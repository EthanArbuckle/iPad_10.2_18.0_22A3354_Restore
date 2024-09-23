uint64_t CUIKITriggerReminderSync(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BDC7470], "isReminderAppLocked");
  if ((result & 1) == 0)
    return +[CUIKIReminderSyncTrigger triggerSyncWithWhy:](_TtC21CalendarUIKitInternal24CUIKIReminderSyncTrigger, "triggerSyncWithWhy:", a1);
  return result;
}

uint64_t sub_2376DDAC0(uint64_t a1)
{
  return sub_2376DDB5C(a1, qword_256808F68);
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

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_2376DDB38(uint64_t a1)
{
  return sub_2376DDB5C(a1, qword_2542B77D0);
}

uint64_t sub_2376DDB5C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_2376F2BA4();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_2376F2B98();
}

unint64_t static ReminderColorDeserializer.deserialize(from:)(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v10;

  v5 = sub_2376F2AFC();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2376DDC8C(a1, a2);
  sub_2376F2AE4();
  if (!v2)
  {
    a2 = sub_2376F2ACC();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  return a2;
}

uint64_t sub_2376DDC8C(uint64_t a1, unint64_t a2)
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

id ReminderColorDeserializer.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id ReminderColorDeserializer.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ReminderColorDeserializer();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for ReminderColorDeserializer()
{
  return objc_opt_self();
}

id ReminderColorDeserializer.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ReminderColorDeserializer();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_2376DDED4(uint64_t a1, unint64_t a2)
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

void RemindersInCalendarEditingReminderProperties.init(event:)(void *a1)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  char *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  __swift_instantiateConcreteTypeFromMangledName(&qword_256808F00);
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)&v18 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256808CF8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2376F2B38();
  v6 = objc_msgSend(a1, sel_title);
  if (v6)
  {
    v7 = v6;
    sub_2376F2BE0();

  }
  sub_2376F2B2C();
  v8 = objc_msgSend(a1, sel_notes);
  if (v8)
  {
    v9 = v8;
    sub_2376F2BE0();

  }
  sub_2376F2B20();
  v10 = objc_msgSend(a1, sel_startDateComponents);
  if (v10)
  {
    v11 = v10;
    sub_2376F27B4();

    v12 = sub_2376F27D8();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v5, 0, 1, v12);
  }
  else
  {
    v13 = sub_2376F27D8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v5, 1, 1, v13);
  }
  sub_2376F2B08();
  v14 = objc_msgSend(a1, "URL");
  if (v14)
  {
    v15 = v14;
    sub_2376F2814();

    v16 = sub_2376F282C();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v3, 0, 1, v16);
  }
  else
  {
    v17 = sub_2376F282C();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v3, 1, 1, v17);
  }
  sub_2376F2B14();

}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B81A9E0]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

id REMReminderChangeItem.cuiki_list.getter()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v9[2];

  v9[1] = *(id *)MEMORY[0x24BDAC8D0];
  v1 = objc_msgSend(v0, sel_listID);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = (void *)sub_2376F2D00();
  v9[0] = 0;
  v4 = objc_msgSend(v3, sel_fetchListWithObjectID_error_, v2, v9);

  v5 = v9[0];
  if (!v4)
  {
    v6 = v5;
    v7 = (void *)sub_2376F27F0();

    swift_willThrow();
    return 0;
  }

  return v4;
}

uint64_t sub_2376DE26C(uint64_t a1, uint64_t a2)
{
  return sub_2376DE304(a1, a2, (SEL *)&selRef_titleAsString);
}

uint64_t sub_2376DE278(uint64_t a1, uint64_t a2)
{
  return sub_2376DE304(a1, a2, (SEL *)&selRef_notesAsString);
}

uint64_t sub_2376DE284@<X0>(uint64_t a1@<X8>)
{
  return sub_2376DE364((SEL *)&selRef_icsUrl, (void (*)(void))MEMORY[0x24BDCD9C0], MEMORY[0x24BDCDAC0], a1);
}

uint64_t sub_2376DE2A0@<X0>(uint64_t a1@<X8>)
{
  return sub_2376DE364((SEL *)&selRef_effectiveDisplayDateComponents_forCalendar, (void (*)(void))MEMORY[0x24BDCBCC0], MEMORY[0x24BDCBDE0], a1);
}

id sub_2376DE2C0()
{
  return REMReminderChangeItem.cuiki_list.getter();
}

id REMReminder.cuiki_list.getter()
{
  void *v0;

  return objc_msgSend(v0, sel_list);
}

uint64_t sub_2376DE304(uint64_t a1, uint64_t a2, SEL *a3)
{
  id *v3;
  id v4;
  void *v5;
  uint64_t v6;

  v4 = objc_msgSend(*v3, *a3);
  if (!v4)
    return 0;
  v5 = v4;
  v6 = sub_2376F2BE0();

  return v6;
}

uint64_t sub_2376DE364@<X0>(SEL *a1@<X2>, void (*a2)(void)@<X3>, uint64_t (*a3)(void)@<X4>, uint64_t a4@<X8>)
{
  id *v4;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;

  v8 = objc_msgSend(*v4, *a1);
  if (v8)
  {
    v9 = v8;
    a2();

    v10 = ((uint64_t (*)(_QWORD))a3)(0);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56);
    v12 = a4;
    v13 = 0;
  }
  else
  {
    v10 = a3();
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56);
    v12 = a4;
    v13 = 1;
  }
  return v11(v12, v13, 1, v10);
}

uint64_t sub_2376DE3F4()
{
  id *v0;
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(*v0, sel_recurrenceRules);
  if (!v1)
    return 0;
  v2 = v1;
  sub_2376E121C(0, &qword_256808D30);
  v3 = sub_2376F2C1C();

  return v3;
}

id sub_2376DE464()
{
  id *v0;

  return objc_msgSend(*v0, sel_list);
}

id sub_2376DE488()
{
  id *v0;

  return objc_msgSend(*v0, sel_objectID);
}

void EKEvent.update(from:updateDates:forSavingIntegrationEvent:)(_QWORD *a1, int a2, int a3)
{
  void *v3;
  void *v4;
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
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  id v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t *v69;
  char *v70;
  uint64_t v71;
  char *v72;
  uint64_t v73;
  char *v74;
  id v75;
  void *v76;
  char *v77;
  uint64_t v78;
  char *v79;
  void (*v80)(_QWORD, _QWORD, _QWORD);
  int v81;
  uint64_t v82;
  unsigned __int8 v83;
  char v84;
  char v85;
  id v86;
  void *v87;
  char *v88;
  void (*v89)(char *, char *, uint64_t);
  uint64_t v90;
  uint64_t v91;
  void (*v92)(uint64_t, uint64_t, uint64_t, uint64_t);
  unsigned int (*v93)(uint64_t, uint64_t, uint64_t);
  uint64_t v94;
  id v95;
  void *v96;
  char *v97;
  uint64_t v98;
  uint64_t v99;
  unint64_t v100;
  uint64_t v101;
  char *v102;
  char *v103;
  char *v104;
  void (*v105)(char *, uint64_t);
  uint64_t v106;
  char v107;
  char *v108;
  uint64_t v109;
  char *v110;
  unsigned int (*v111)(char *, uint64_t, uint64_t);
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  unint64_t v116;
  uint64_t v117;
  void *v118;
  id v119;
  char *v120;
  void *v121;
  uint64_t v122;
  char *v123;
  uint64_t v124;
  char *v125;
  char *v126;
  void *v127;
  void (*v128)(char *, uint64_t);
  char *v129;
  char *v130;
  void *v131;
  uint64_t v132;
  char *v133;
  char *v134;
  char *v135;
  char *v136;
  char *v137;
  char *v138;
  uint64_t v139;
  uint64_t v140;
  char *v141;
  char *v142;
  char *v143;
  char *v144;
  char *v145;
  uint64_t v146;
  uint64_t v147;
  char *v148;
  char *v149;
  uint64_t v150;
  uint64_t v151;
  char *v152;
  uint64_t v153;
  void (*v154)(_QWORD, _QWORD, _QWORD);
  uint64_t v155;
  uint64_t v156;
  char *v157;
  char *v158;
  uint64_t v159;
  uint64_t v160;
  int v161;
  uint64_t v162;

  v4 = v3;
  v161 = a3;
  LODWORD(v162) = a2;
  v140 = sub_2376F28C8();
  v139 = *(_QWORD *)(v140 - 8);
  MEMORY[0x24BDAC7A8](v140);
  v137 = (char *)&v132 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256808D00);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v138 = (char *)&v132 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v145 = (char *)&v132 - v11;
  v12 = MEMORY[0x24BDAC7A8](v10);
  v136 = (char *)&v132 - v13;
  MEMORY[0x24BDAC7A8](v12);
  v142 = (char *)&v132 - v14;
  v15 = sub_2376F2874();
  v155 = *(_QWORD *)(v15 - 8);
  v156 = v15;
  v16 = MEMORY[0x24BDAC7A8](v15);
  v134 = (char *)&v132 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = MEMORY[0x24BDAC7A8](v16);
  v143 = (char *)&v132 - v19;
  v20 = MEMORY[0x24BDAC7A8](v18);
  v135 = (char *)&v132 - v21;
  v22 = MEMORY[0x24BDAC7A8](v20);
  v144 = (char *)&v132 - v23;
  MEMORY[0x24BDAC7A8](v22);
  v141 = (char *)&v132 - v24;
  v25 = sub_2376F28EC();
  v153 = *(_QWORD *)(v25 - 8);
  v154 = (void (*)(_QWORD, _QWORD, _QWORD))v25;
  MEMORY[0x24BDAC7A8](v25);
  v148 = (char *)&v132 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_256808D08);
  MEMORY[0x24BDAC7A8](v27);
  v152 = (char *)&v132 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = sub_2376F2880();
  v150 = *(_QWORD *)(v29 - 8);
  v151 = v29;
  MEMORY[0x24BDAC7A8](v29);
  v149 = (char *)&v132 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = sub_2376F28D4();
  v146 = *(_QWORD *)(v31 - 8);
  v147 = v31;
  MEMORY[0x24BDAC7A8](v31);
  v158 = (char *)&v132 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_256808CF8);
  MEMORY[0x24BDAC7A8](v33);
  v35 = (char *)&v132 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  v36 = sub_2376F27D8();
  v37 = *(_QWORD *)(v36 - 8);
  v159 = v36;
  v160 = v37;
  v38 = MEMORY[0x24BDAC7A8](v36);
  v133 = (char *)&v132 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v38);
  v157 = (char *)&v132 - v40;
  v41 = sub_2376F282C();
  v42 = *(_QWORD *)(v41 - 8);
  MEMORY[0x24BDAC7A8](v41);
  v44 = (char *)&v132 - ((v43 + 15) & 0xFFFFFFFFFFFFFFF0);
  v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_256808F00);
  MEMORY[0x24BDAC7A8](v45);
  v47 = (char *)&v132 - ((v46 + 15) & 0xFFFFFFFFFFFFFFF0);
  v49 = a1[3];
  v48 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v49);
  (*(void (**)(uint64_t, uint64_t))(v48 + 8))(v49, v48);
  if (v50)
  {
    v51 = (void *)sub_2376F2BD4();
    swift_bridgeObjectRelease();
    objc_msgSend(v3, sel_setTitle_, v51);

  }
  v52 = a1[3];
  v53 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v52);
  (*(void (**)(uint64_t, uint64_t))(v53 + 16))(v52, v53);
  if (v54)
  {
    v55 = (void *)sub_2376F2BD4();
    swift_bridgeObjectRelease();
  }
  else
  {
    v55 = 0;
  }
  objc_msgSend(v4, sel_setNotes_, v55);

  v56 = a1[3];
  v57 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v56);
  (*(void (**)(uint64_t, uint64_t))(v57 + 24))(v56, v57);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v42 + 48))(v47, 1, v41) == 1)
  {
    v58 = 0;
  }
  else
  {
    v58 = (void *)sub_2376F2808();
    (*(void (**)(char *, uint64_t))(v42 + 8))(v47, v41);
  }
  v59 = v4;
  objc_msgSend(v4, sel_setURL_, v58);

  v60 = a1[3];
  v61 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v60);
  v62 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v61 + 56))(v60, v61);
  v63 = objc_msgSend(v62, sel_urlRepresentation);

  sub_2376F2814();
  sub_2376F27FC();
  (*(void (**)(char *, uint64_t))(v42 + 8))(v44, v41);
  v64 = (void *)sub_2376F2BD4();
  swift_bridgeObjectRelease();
  objc_msgSend(v4, sel_setUniqueID_, v64);

  if ((v162 & 1) == 0)
    goto LABEL_36;
  v65 = a1[3];
  v66 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v65);
  (*(void (**)(uint64_t, uint64_t))(v66 + 32))(v65, v66);
  v68 = v159;
  v67 = v160;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v160 + 48))(v35, 1, v159) == 1)
  {
    v69 = &qword_256808CF8;
    goto LABEL_34;
  }
  v70 = v157;
  (*(void (**)(char *, char *, uint64_t))(v67 + 32))(v157, v35, v68);
  v72 = v149;
  v71 = v150;
  v73 = v151;
  (*(void (**)(char *, _QWORD, uint64_t))(v150 + 104))(v149, *MEMORY[0x24BDCEF70], v151);
  v74 = v158;
  sub_2376F288C();
  (*(void (**)(char *, uint64_t))(v71 + 8))(v72, v73);
  v75 = objc_msgSend(v59, sel_effectiveTimeZone);
  if (!v75)
  {
    (*(void (**)(char *, uint64_t, uint64_t, void (*)(_QWORD, _QWORD, _QWORD)))(v153 + 56))(v152, 1, 1, v154);
    goto LABEL_49;
  }
  v76 = v75;
  v77 = v148;
  sub_2376F28E0();

  v79 = v152;
  v78 = v153;
  v80 = v154;
  (*(void (**)(char *, char *, _QWORD))(v153 + 32))(v152, v77, v154);
  (*(void (**)(char *, _QWORD, uint64_t, void (*)(_QWORD, _QWORD, _QWORD)))(v78 + 56))(v79, 0, 1, v80);
  v81 = (*(uint64_t (**)(char *, uint64_t, _QWORD))(v78 + 48))(v79, 1, v80);
  v82 = v155;
  if (v81 == 1)
  {
LABEL_49:
    __break(1u);
    return;
  }
  sub_2376F28BC();
  v83 = objc_msgSend(v59, sel_isAllDay);
  sub_2376F27CC();
  v85 = v84;
  if ((v84 & 1) == 0)
  {
    if ((v83 & 1) == 0)
      objc_msgSend(v59, sel_duration);
    v162 = 0;
    goto LABEL_32;
  }
  v86 = objc_msgSend(v59, sel_startDate);
  if (!v86)
  {
    v90 = (uint64_t)v142;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v82 + 56))(v142, 1, 1, v156);
    goto LABEL_28;
  }
  v87 = v86;
  v88 = v144;
  sub_2376F2868();

  v89 = *(void (**)(char *, char *, uint64_t))(v82 + 32);
  v90 = (uint64_t)v142;
  v91 = v156;
  v89(v142, v88, v156);
  v92 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v82 + 56);
  v92(v90, 0, 1, v91);
  v93 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v82 + 48);
  if (v93(v90, 1, v91) == 1)
  {
LABEL_28:
    sub_2376E081C(v90, &qword_256808D00);
    v162 = 1;
    goto LABEL_31;
  }
  v94 = v156;
  v89(v141, (char *)v90, v156);
  v95 = objc_msgSend(v59, sel_endDateUnadjustedForLegacyClients);
  if (v95)
  {
    v96 = v95;
    v97 = v144;
    sub_2376F2868();

    v98 = (uint64_t)v136;
    v89(v136, v97, v94);
    v92(v98, 0, 1, v94);
    if (v93(v98, 1, v94) != 1)
    {
      v89(v135, (char *)v98, v94);
      __swift_instantiateConcreteTypeFromMangledName(&qword_256808D18);
      v99 = v139;
      v100 = (*(unsigned __int8 *)(v139 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v139 + 80);
      v101 = swift_allocObject();
      *(_OWORD *)(v101 + 16) = xmmword_2376F3790;
      (*(void (**)(unint64_t, _QWORD, uint64_t))(v99 + 104))(v101 + v100, *MEMORY[0x24BDCF220], v140);
      sub_2376DFEE4(v101);
      swift_setDeallocating();
      v162 = 1;
      swift_arrayDestroy();
      swift_deallocClassInstance();
      v102 = v144;
      sub_2376F2850();
      v103 = v133;
      v104 = v141;
      sub_2376F2898();
      swift_bridgeObjectRelease();
      v105 = *(void (**)(char *, uint64_t))(v82 + 8);
      v105(v102, v94);
      v106 = sub_2376F27C0();
      LOBYTE(v102) = v107;
      v108 = v103;
      v68 = v159;
      (*(void (**)(char *, uint64_t))(v160 + 8))(v108, v159);
      v105(v135, v94);
      v105(v104, v94);
      if ((v102 & 1) == 0)
      {
        if (v106 <= 1)
          v109 = 1;
        else
          v109 = v106;
        v162 = v109;
      }
      goto LABEL_31;
    }
  }
  else
  {
    v98 = (uint64_t)v136;
    v92((uint64_t)v136, 1, 1, v94);
  }
  (*(void (**)(char *, uint64_t))(v82 + 8))(v141, v94);
  sub_2376E081C(v98, &qword_256808D00);
  v162 = 1;
  v68 = v159;
LABEL_31:
  v70 = v157;
  v74 = v158;
LABEL_32:
  v35 = v145;
  objc_msgSend(v59, sel_setAllDay_, v85 & 1);
  sub_2376F28A4();
  v110 = v70;
  v111 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v82 + 48);
  v112 = v156;
  if (v111(v35, 1, v156) != 1)
  {
    v120 = v143;
    v154 = *(void (**)(_QWORD, _QWORD, _QWORD))(v82 + 32);
    v154(v143, v35, v112);
    v121 = (void *)sub_2376F285C();
    objc_msgSend(v59, sel_setStartDate_, v121);

    if ((v85 & 1) != 0)
    {
      v122 = v139;
      v123 = v137;
      v124 = v140;
      (*(void (**)(char *, _QWORD, uint64_t))(v139 + 104))(v137, *MEMORY[0x24BDCF220], v140);
      v125 = v138;
      sub_2376F28B0();
      (*(void (**)(char *, uint64_t))(v122 + 8))(v123, v124);
      if (v111(v125, 1, v112) == 1)
      {
        (*(void (**)(char *, uint64_t))(v155 + 8))(v120, v112);
        (*(void (**)(char *, uint64_t))(v146 + 8))(v158, v147);
        (*(void (**)(char *, uint64_t))(v160 + 8))(v157, v159);
        v69 = &qword_256808D00;
        v113 = (uint64_t)v125;
        goto LABEL_35;
      }
      v129 = v134;
      v154(v134, v125, v112);
      v130 = v144;
      sub_2376F2850();
      v131 = (void *)sub_2376F285C();
      v128 = *(void (**)(char *, uint64_t))(v155 + 8);
      v128(v130, v112);
      objc_msgSend(v59, sel_setEndDateUnadjustedForLegacyClients_, v131);

      v128(v129, v112);
    }
    else
    {
      v126 = v144;
      sub_2376F2850();
      v127 = (void *)sub_2376F285C();
      v128 = *(void (**)(char *, uint64_t))(v82 + 8);
      v128(v126, v112);
      objc_msgSend(v59, sel_setEndDateUnadjustedForLegacyClients_, v127);

    }
    v128(v120, v112);
    (*(void (**)(char *, uint64_t))(v146 + 8))(v158, v147);
    (*(void (**)(char *, uint64_t))(v160 + 8))(v157, v159);
    goto LABEL_36;
  }
  (*(void (**)(char *, uint64_t))(v146 + 8))(v74, v147);
  (*(void (**)(char *, uint64_t))(v160 + 8))(v110, v68);
  v69 = &qword_256808D00;
LABEL_34:
  v113 = (uint64_t)v35;
LABEL_35:
  sub_2376E081C(v113, v69);
LABEL_36:
  v114 = a1[3];
  v115 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v114);
  v116 = (*(uint64_t (**)(uint64_t, uint64_t))(v115 + 40))(v114, v115);
  v117 = _sSo16EKRecurrenceRuleC21CalendarUIKitInternalE7convertySayABGSgSaySo013REMRecurrenceB0CGSgFZ_0(v116);
  swift_bridgeObjectRelease();
  if (v117)
  {
    sub_2376E121C(0, &qword_256808D10);
    v118 = (void *)sub_2376F2C10();
    swift_bridgeObjectRelease();
  }
  else
  {
    v118 = 0;
  }
  objc_msgSend(v59, sel_setRecurrenceRules_, v118);

  if ((v161 & 1) != 0)
  {
    v119 = sub_2376DF2BC(a1);
    objc_msgSend(v59, sel_setColor_, v119);

  }
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

id sub_2376DF2BC(_QWORD *a1)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id result;
  void *v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  id v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  void *v27;
  void *v28;
  _QWORD v29[2];

  v2 = v1;
  v4 = sub_2376F282C();
  v5 = *(_QWORD *)(v4 - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v7 = (char *)v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = a1[3];
  v9 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v8);
  v10 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v9 + 48))(v8, v9);
  if (!v10)
    return 0;
  v11 = v10;
  v12 = objc_msgSend(v10, sel_objectID);
  v13 = objc_msgSend(v12, sel_urlRepresentation);

  sub_2376F2814();
  sub_2376F27FC();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  result = objc_msgSend(v2, sel_eventStore);
  if (result)
  {
    v15 = result;
    v16 = (id)*MEMORY[0x24BE14200];
    v17 = (void *)sub_2376F2BD4();
    v18 = objc_msgSend(v15, sel_colorWithProviderIdentifier_externalIdentifier_, v16, v17);

    if (v18)
    {

      swift_bridgeObjectRelease();
    }
    else
    {
      v19 = sub_2376F2AFC();
      v29[0] = v29;
      v20 = *(_QWORD *)(v19 - 8);
      MEMORY[0x24BDAC7A8](v19);
      v22 = (char *)v29 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
      v23 = objc_msgSend(v11, sel_color);
      sub_2376F2AF0();
      v24 = sub_2376F2AD8();
      v26 = v25;
      v18 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDC74C0]), sel_init);
      objc_msgSend(v18, sel_setProviderIdentifier_, v16);
      v27 = (void *)sub_2376F2BD4();
      swift_bridgeObjectRelease();
      objc_msgSend(v18, sel_setExternalID_, v27);

      v28 = (void *)sub_2376F2838();
      objc_msgSend(v18, sel_setData_, v28);

      sub_2376DDED4(v24, v26);
      (*(void (**)(char *, uint64_t))(v20 + 8))(v22, v19);
    }
    return v18;
  }
  __break(1u);
  return result;
}

id static EKRecurrenceRule.convert(_:)(void *a1)
{
  id v2;
  uint64_t v3;
  id v4;
  id v5;
  void *v6;
  unint64_t v7;
  unint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  id v27;

  v2 = objc_msgSend(a1, sel_frequency);
  if ((unint64_t)v2 > 3)
    return 0;
  v3 = (uint64_t)v2;
  v4 = objc_msgSend(a1, sel_interval);
  v5 = objc_msgSend(a1, sel_daysOfTheWeek);
  if (v5)
  {
    v6 = v5;
    sub_2376E121C(0, &qword_256808D28);
    v7 = sub_2376F2C1C();

  }
  else
  {
    v7 = 0;
  }
  v9 = sub_2376E0ADC(v7, (Class *)0x24BDC7510);
  swift_bridgeObjectRelease();
  v10 = objc_msgSend(a1, sel_daysOfTheMonth);
  if (v10)
  {
    v11 = v10;
    sub_2376E121C(0, &qword_256808D20);
    v12 = sub_2376F2C1C();

  }
  else
  {
    v12 = 0;
  }
  v13 = objc_msgSend(a1, sel_monthsOfTheYear);
  if (v13)
  {
    v14 = v13;
    sub_2376E121C(0, &qword_256808D20);
    v15 = sub_2376F2C1C();

  }
  else
  {
    v15 = 0;
  }
  v16 = objc_msgSend(a1, sel_weeksOfTheYear);
  if (v16)
  {
    v17 = v16;
    sub_2376E121C(0, &qword_256808D20);
    v18 = sub_2376F2C1C();

  }
  else
  {
    v18 = 0;
  }
  v19 = objc_msgSend(a1, sel_daysOfTheYear);
  if (v19)
  {
    v20 = v19;
    sub_2376E121C(0, &qword_256808D20);
    v21 = sub_2376F2C1C();

  }
  else
  {
    v21 = 0;
  }
  v22 = objc_msgSend(a1, sel_setPositions);
  if (v22)
  {
    v23 = v22;
    sub_2376E121C(0, &qword_256808D20);
    v24 = sub_2376F2C1C();

  }
  else
  {
    v24 = 0;
  }
  v25 = objc_msgSend(a1, sel_recurrenceEnd);
  v26 = (void *)sub_2376E0858(v25);

  v27 = objc_allocWithZone(MEMORY[0x24BDC7528]);
  return sub_2376DFA60(v3, (uint64_t)v4, v9, v12, v15, v18, v21, v24, v26);
}

uint64_t static REMRecurrenceRule.convert(_:account:reminder:)(unint64_t a1, void *a2, void *a3)
{
  unint64_t v3;
  uint64_t v6;
  uint64_t result;
  uint64_t i;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  unint64_t v13;

  v3 = a1;
  if (!a1)
    return v3;
  v13 = MEMORY[0x24BEE4AF8];
  if (!(a1 >> 62))
  {
    v6 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v6)
      goto LABEL_4;
LABEL_19:
    swift_bridgeObjectRelease();
    v3 = MEMORY[0x24BEE4AF8];
    if (!(MEMORY[0x24BEE4AF8] >> 62))
      goto LABEL_15;
    goto LABEL_20;
  }
  swift_bridgeObjectRetain();
  result = sub_2376F2E98();
  v6 = result;
  if (!result)
    goto LABEL_19;
LABEL_4:
  if (v6 >= 1)
  {
    for (i = 0; i != v6; ++i)
    {
      if ((v3 & 0xC000000000000001) != 0)
        v9 = (id)MEMORY[0x23B81A560](i, v3);
      else
        v9 = *(id *)(v3 + 8 * i + 32);
      v10 = v9;
      v11 = _sSo17REMRecurrenceRuleC21CalendarUIKitInternalE7convert_7account8reminderABSgSo012EKRecurrenceB0C_So11REMObjectIDCAKtFZ_0(v9, a2, a3);

      if (v11)
      {
        MEMORY[0x23B81A350]();
        if (*(_QWORD *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_2376F2C40();
        sub_2376F2C58();
        sub_2376F2C28();
      }
    }
    swift_bridgeObjectRelease();
    v3 = v13;
    if (!(v13 >> 62))
    {
LABEL_15:
      if (*(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10))
        return v3;
LABEL_16:
      swift_bridgeObjectRelease();
      return 0;
    }
LABEL_20:
    swift_bridgeObjectRetain();
    v12 = sub_2376F2E98();
    swift_bridgeObjectRelease();
    if (v12)
      return v3;
    goto LABEL_16;
  }
  __break(1u);
  return result;
}

id sub_2376DFA60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v25;

  if (a3)
  {
    sub_2376E121C(0, &qword_256808D38);
    v16 = (void *)sub_2376F2C10();
    swift_bridgeObjectRelease();
    if (a4)
      goto LABEL_3;
  }
  else
  {
    v16 = 0;
    if (a4)
    {
LABEL_3:
      sub_2376E121C(0, &qword_256808D20);
      v17 = (void *)sub_2376F2C10();
      swift_bridgeObjectRelease();
      if (a5)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  v17 = 0;
  if (a5)
  {
LABEL_4:
    sub_2376E121C(0, &qword_256808D20);
    v18 = (void *)sub_2376F2C10();
    swift_bridgeObjectRelease();
    if (a6)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  v18 = 0;
  if (a6)
  {
LABEL_5:
    sub_2376E121C(0, &qword_256808D20);
    v19 = (void *)sub_2376F2C10();
    swift_bridgeObjectRelease();
    if (a7)
      goto LABEL_6;
LABEL_12:
    v20 = 0;
    v21 = a9;
    if (a8)
      goto LABEL_7;
LABEL_13:
    v22 = 0;
    goto LABEL_14;
  }
LABEL_11:
  v19 = 0;
  if (!a7)
    goto LABEL_12;
LABEL_6:
  sub_2376E121C(0, &qword_256808D20);
  v20 = (void *)sub_2376F2C10();
  swift_bridgeObjectRelease();
  v21 = a9;
  if (!a8)
    goto LABEL_13;
LABEL_7:
  sub_2376E121C(0, &qword_256808D20);
  v22 = (void *)sub_2376F2C10();
  swift_bridgeObjectRelease();
LABEL_14:
  v23 = objc_msgSend(v25, sel_initRecurrenceWithFrequency_interval_daysOfTheWeek_daysOfTheMonth_monthsOfTheYear_weeksOfTheYear_daysOfTheYear_setPositions_end_, a1, a2, v16, v17, v18, v19, v20, v22, v21);

  return v23;
}

id sub_2376DFC88(void *a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v29;

  if (a7)
  {
    sub_2376E121C(0, &qword_256808D28);
    v16 = (void *)sub_2376F2C10();
    swift_bridgeObjectRelease();
    v17 = a9;
    if (a8)
      goto LABEL_3;
  }
  else
  {
    v16 = 0;
    v17 = a9;
    if (a8)
    {
LABEL_3:
      sub_2376E121C(0, &qword_256808D20);
      v18 = (void *)sub_2376F2C10();
      swift_bridgeObjectRelease();
      v19 = a10;
      if (v17)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  v18 = 0;
  v19 = a10;
  if (v17)
  {
LABEL_4:
    sub_2376E121C(0, &qword_256808D20);
    v20 = (void *)sub_2376F2C10();
    swift_bridgeObjectRelease();
    v21 = a11;
    if (v19)
      goto LABEL_5;
    goto LABEL_11;
  }
LABEL_10:
  v20 = 0;
  v21 = a11;
  if (v19)
  {
LABEL_5:
    sub_2376E121C(0, &qword_256808D20);
    v22 = (void *)sub_2376F2C10();
    swift_bridgeObjectRelease();
    v23 = a12;
    if (v21)
      goto LABEL_6;
LABEL_12:
    v24 = 0;
    v25 = a13;
    if (v23)
      goto LABEL_7;
LABEL_13:
    v26 = 0;
    goto LABEL_14;
  }
LABEL_11:
  v22 = 0;
  v23 = a12;
  if (!v21)
    goto LABEL_12;
LABEL_6:
  sub_2376E121C(0, &qword_256808D20);
  v24 = (void *)sub_2376F2C10();
  swift_bridgeObjectRelease();
  v25 = a13;
  if (!v23)
    goto LABEL_13;
LABEL_7:
  sub_2376E121C(0, &qword_256808D20);
  v26 = (void *)sub_2376F2C10();
  swift_bridgeObjectRelease();
LABEL_14:
  v27 = objc_msgSend(v29, sel_initRecurrenceRuleWithObjectID_accountID_reminderID_frequency_interval_firstDayOfTheWeek_daysOfTheWeek_daysOfTheMonth_monthsOfTheYear_weeksOfTheYear_daysOfTheYear_setPositions_end_, a1, a2, a3, a4, a5, a6, v16, v18, v20, v22, v24, v26, v25);

  return v27;
}

uint64_t sub_2376DFEE4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  void (*v22)(char *, uint64_t);
  uint64_t result;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(char *, uint64_t, uint64_t);
  uint64_t v32;

  v2 = sub_2376F28C8();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v27 - v7;
  v9 = *(_QWORD *)(a1 + 16);
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256808D40);
    v10 = sub_2376F2DF0();
    v11 = 0;
    v12 = *(unsigned __int8 *)(v3 + 80);
    v28 = v9;
    v29 = a1 + ((v12 + 32) & ~v12);
    v13 = *(_QWORD *)(v3 + 72);
    v31 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    v32 = v10 + 56;
    while (1)
    {
      v30 = v11;
      v31(v8, v29 + v13 * v11, v2);
      sub_2376E1254(&qword_256808D48, MEMORY[0x24BDCF2A8]);
      v14 = sub_2376F2BBC();
      v15 = ~(-1 << *(_BYTE *)(v10 + 32));
      v16 = v14 & v15;
      v17 = (v14 & (unint64_t)v15) >> 6;
      v18 = *(_QWORD *)(v32 + 8 * v17);
      v19 = 1 << (v14 & v15);
      if ((v19 & v18) != 0)
      {
        do
        {
          v31(v6, *(_QWORD *)(v10 + 48) + v16 * v13, v2);
          sub_2376E1254(&qword_256808D50, MEMORY[0x24BDCF2C0]);
          v20 = sub_2376F2BC8();
          v21 = v3;
          v22 = *(void (**)(char *, uint64_t))(v3 + 8);
          v22(v6, v2);
          if ((v20 & 1) != 0)
          {
            v22(v8, v2);
            v3 = v21;
            v9 = v28;
            goto LABEL_4;
          }
          v16 = (v16 + 1) & v15;
          v17 = v16 >> 6;
          v18 = *(_QWORD *)(v32 + 8 * (v16 >> 6));
          v19 = 1 << v16;
          v3 = v21;
        }
        while ((v18 & (1 << v16)) != 0);
        v9 = v28;
      }
      *(_QWORD *)(v32 + 8 * v17) = v19 | v18;
      result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(_QWORD *)(v10 + 48) + v16 * v13, v8, v2);
      v24 = *(_QWORD *)(v10 + 16);
      v25 = __OFADD__(v24, 1);
      v26 = v24 + 1;
      if (v25)
        break;
      *(_QWORD *)(v10 + 16) = v26;
LABEL_4:
      v11 = v30 + 1;
      if (v30 + 1 == v9)
        return v10;
    }
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4B08];
  }
  return result;
}

uint64_t _sSo16EKRecurrenceRuleC21CalendarUIKitInternalE7convertySayABGSgSaySo013REMRecurrenceB0CGSgFZ_0(unint64_t a1)
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
  uint64_t result;
  uint64_t v15;
  unint64_t v16;
  char **v17;
  char *v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  char *v24;
  uint64_t v25;
  char *v26;
  char *v27;
  char *v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  char *v33;
  void (*v34)(char *, char *, uint64_t);
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  void *v43;
  id v44;
  unint64_t v45;
  id v46;
  id v47;
  unint64_t v48;
  uint64_t v49;
  char *v50;
  char *v51;
  char *v52;
  unint64_t v53;
  id *v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  id v63;
  uint64_t v64;
  unint64_t v65;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256808D00);
  v3 = MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v50 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v50 - v6;
  v8 = sub_2376F2874();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v52 = (char *)&v50 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v51 = (char *)&v50 - v12;
  if (!a1)
    return 0;
  v65 = MEMORY[0x24BEE4AF8];
  if (a1 >> 62)
  {
LABEL_51:
    swift_bridgeObjectRetain();
    result = sub_2376F2E98();
    v13 = result;
    if (result)
      goto LABEL_4;
    goto LABEL_52;
  }
  v13 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  result = swift_bridgeObjectRetain();
  if (!v13)
  {
LABEL_52:
    swift_bridgeObjectRelease();
    v48 = MEMORY[0x24BEE4AF8];
    if (!(MEMORY[0x24BEE4AF8] >> 62))
      goto LABEL_46;
LABEL_53:
    swift_bridgeObjectRetain();
    v49 = sub_2376F2E98();
    swift_bridgeObjectRelease();
    if (v49)
      return v48;
LABEL_47:
    swift_bridgeObjectRelease();
    return 0;
  }
LABEL_4:
  if (v13 < 1)
  {
    __break(1u);
    return result;
  }
  v55 = v7;
  v56 = v8;
  v50 = v5;
  v15 = 0;
  v16 = a1 & 0xC000000000000001;
  v17 = &off_2508F7000;
  v53 = a1 & 0xC000000000000001;
  v54 = (id *)a1;
  do
  {
    if (v16)
      v18 = (char *)MEMORY[0x23B81A560](v15, a1);
    else
      v18 = (char *)*(id *)(a1 + 8 * v15 + 32);
    v7 = v18;
    v19 = objc_msgSend(v18, v17[182], v50);
    if ((unint64_t)v19 >= 4)
    {

      goto LABEL_7;
    }
    v64 = (uint64_t)v19;
    v63 = objc_msgSend(v7, sel_interval);
    v20 = objc_msgSend(v7, sel_daysOfTheWeek);
    if (v20)
    {
      v21 = v20;
      sub_2376E121C(0, &qword_256808D28);
      v5 = (char *)sub_2376F2C1C();

    }
    else
    {
      v5 = 0;
    }
    v62 = sub_2376E0ADC((unint64_t)v5, (Class *)0x24BDC7510);
    swift_bridgeObjectRelease();
    v22 = objc_msgSend(v7, sel_daysOfTheMonth);
    if (v22)
    {
      v23 = v22;
      sub_2376E121C(0, &qword_256808D20);
      v61 = sub_2376F2C1C();

    }
    else
    {
      v61 = 0;
    }
    v24 = (char *)objc_msgSend(v7, sel_monthsOfTheYear);
    if (v24)
    {
      v5 = v24;
      sub_2376E121C(0, &qword_256808D20);
      v25 = sub_2376F2C1C();

    }
    else
    {
      v25 = 0;
    }
    v26 = (char *)objc_msgSend(v7, sel_weeksOfTheYear);
    if (v26)
    {
      v5 = v26;
      sub_2376E121C(0, &qword_256808D20);
      v60 = sub_2376F2C1C();

    }
    else
    {
      v60 = 0;
    }
    v27 = (char *)objc_msgSend(v7, sel_daysOfTheYear);
    if (v27)
    {
      v5 = v27;
      sub_2376E121C(0, &qword_256808D20);
      v59 = sub_2376F2C1C();

    }
    else
    {
      v59 = 0;
    }
    v28 = (char *)objc_msgSend(v7, sel_setPositions);
    if (v28)
    {
      v5 = v28;
      sub_2376E121C(0, &qword_256808D20);
      v58 = sub_2376F2C1C();

    }
    else
    {
      v58 = 0;
    }
    v29 = objc_msgSend(v7, sel_recurrenceEnd);
    if (v29)
    {
      v57 = v25;
      v30 = v29;
      v31 = objc_msgSend(v30, sel_endDate);
      if (!v31)
      {
        v8 = (uint64_t)v55;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v55, 1, 1, v56);
LABEL_37:
        sub_2376E081C(v8, &qword_256808D00);
        v45 = (unint64_t)objc_msgSend(v30, sel_occurrenceCount);
        if ((v45 & 0x8000000000000000) != 0)
        {
          __break(1u);
          goto LABEL_51;
        }
        v44 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDC7518]), sel_initWithOccurrenceCount_, v45);

        v16 = v53;
        a1 = (unint64_t)v54;
        v17 = &off_2508F7000;
        v25 = v57;
        goto LABEL_41;
      }
      v32 = v31;
      v33 = v52;
      sub_2376F2868();

      v34 = *(void (**)(char *, char *, uint64_t))(v9 + 32);
      v8 = (uint64_t)v55;
      v35 = v13;
      v36 = v9;
      v37 = v56;
      v34(v55, v33, v56);
      v5 = *(char **)(v36 + 56);
      ((void (*)(uint64_t, _QWORD, uint64_t, uint64_t))v5)(v8, 0, 1, v37);
      a1 = *(_QWORD *)(v36 + 48);
      v38 = v37;
      v9 = v36;
      v13 = v35;
      if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))a1)(v8, 1, v38) == 1)
        goto LABEL_37;
      v39 = v51;
      v40 = v8;
      v41 = v56;
      v34(v51, (char *)v40, v56);
      v42 = v50;
      (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v50, v39, v41);
      ((void (*)(char *, _QWORD, uint64_t, uint64_t))v5)(v42, 0, 1, v41);
      if (((unsigned int (*)(char *, uint64_t, uint64_t))a1)(v42, 1, v41) == 1)
      {
        v43 = 0;
      }
      else
      {
        v43 = (void *)sub_2376F285C();
        (*(void (**)(char *, uint64_t))(v9 + 8))(v42, v41);
      }
      v13 = v35;
      v25 = v57;
      v44 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDC7518]), sel_initWithEndDate_, v43);

      (*(void (**)(char *, uint64_t))(v9 + 8))(v51, v41);
      v16 = v53;
      a1 = (unint64_t)v54;
      v17 = &off_2508F7000;
    }
    else
    {
      v44 = 0;
    }
LABEL_41:
    v46 = objc_allocWithZone(MEMORY[0x24BDC7528]);
    v47 = sub_2376DFA60(v64, (uint64_t)v63, v62, v61, v25, v60, v59, v58, v44);

    if (v47)
    {
      MEMORY[0x23B81A350]();
      if (*(_QWORD *)((v65 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v65 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_2376F2C40();
      sub_2376F2C58();
      sub_2376F2C28();
    }
LABEL_7:
    ++v15;
  }
  while (v13 != v15);
  swift_bridgeObjectRelease();
  v48 = v65;
  if (v65 >> 62)
    goto LABEL_53;
LABEL_46:
  if (!*(_QWORD *)((v48 & 0xFFFFFFFFFFFFF8) + 0x10))
    goto LABEL_47;
  return v48;
}

uint64_t sub_2376E081C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_2376E0858(void *a1)
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
  char *v12;
  uint64_t v13;
  char *v14;
  id v15;
  id v16;
  void *v17;
  void (*v18)(char *, char *, uint64_t);
  void (*v19)(char *, _QWORD, uint64_t, uint64_t);
  unsigned int (*v20)(char *, uint64_t, uint64_t);
  void *v21;
  id v22;
  unint64_t result;
  uint64_t v24;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256808D00);
  v3 = MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v24 - v6;
  v8 = sub_2376F2874();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v24 - v13;
  if (!a1)
    return 0;
  v15 = a1;
  v16 = objc_msgSend(v15, sel_endDate);
  if (v16)
  {
    v17 = v16;
    sub_2376F2868();

    v18 = *(void (**)(char *, char *, uint64_t))(v9 + 32);
    v18(v7, v12, v8);
    v19 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v9 + 56);
    v19(v7, 0, 1, v8);
    v20 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48);
    if (v20(v7, 1, v8) != 1)
    {
      v18(v14, v7, v8);
      (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v5, v14, v8);
      v19(v5, 0, 1, v8);
      if (v20(v5, 1, v8) == 1)
      {
        v21 = 0;
      }
      else
      {
        v21 = (void *)sub_2376F285C();
        (*(void (**)(char *, uint64_t))(v9 + 8))(v5, v8);
      }
      v22 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDC7518]), sel_initWithEndDate_, v21);

      (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v8);
      return (unint64_t)v22;
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v7, 1, 1, v8);
  }
  sub_2376E081C((uint64_t)v7, &qword_256808D00);
  result = (unint64_t)objc_msgSend(v15, sel_occurrenceCount);
  if ((result & 0x8000000000000000) == 0)
  {
    v22 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDC7518]), sel_initWithOccurrenceCount_, result);

    return (unint64_t)v22;
  }
  __break(1u);
  return result;
}

unint64_t sub_2376E0ADC(unint64_t result, Class *a2)
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;

  if (result)
  {
    v3 = result;
    if (result >> 62)
    {
      swift_bridgeObjectRetain();
      v4 = sub_2376F2E98();
      swift_bridgeObjectRelease();
    }
    else
    {
      v4 = *(_QWORD *)((result & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    result = MEMORY[0x24BEE4AF8];
    if (v4)
    {
      v10 = MEMORY[0x24BEE4AF8];
      result = sub_2376F2E44();
      if (v4 < 0)
      {
        __break(1u);
      }
      else
      {
        v5 = 0;
        do
        {
          if ((v3 & 0xC000000000000001) != 0)
            v6 = (id)MEMORY[0x23B81A560](v5, v3);
          else
            v6 = *(id *)(v3 + 8 * v5 + 32);
          v7 = v6;
          v8 = (char *)objc_msgSend(v6, sel_dayOfTheWeek);
          if ((unint64_t)(v8 - 1) >= 7)
            v9 = 7;
          else
            v9 = (uint64_t)v8;
          ++v5;
          objc_msgSend(objc_allocWithZone(*a2), sel_initWithDayOfTheWeek_weekNumber_, v9, objc_msgSend(v7, sel_weekNumber));

          sub_2376F2E2C();
          sub_2376F2E50();
          sub_2376F2E5C();
          sub_2376F2E38();
        }
        while (v4 != v5);
        return v10;
      }
    }
  }
  return result;
}

uint64_t sub_2376E0C4C(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  id v12;
  id v13;
  void *v14;
  void (*v15)(char *, char *, uint64_t);
  void *v16;
  id v17;
  unint64_t v18;
  uint64_t result;
  uint64_t v20;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256808D00);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_2376F2874();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v20 - v10;
  if (!a1)
    return 0;
  v12 = a1;
  v13 = objc_msgSend(v12, sel_endDate);
  if (v13)
  {
    v14 = v13;
    sub_2376F2868();

    v15 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
    v15(v4, v9, v5);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v6 + 56))(v4, 0, 1, v5);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) != 1)
    {
      v15(v11, v4, v5);
      v16 = (void *)sub_2376F285C();
      v17 = objc_msgSend((id)objc_opt_self(), sel_recurrenceEndWithEndDate_, v16);

      (*(void (**)(char *, uint64_t))(v6 + 8))(v11, v5);
      return (uint64_t)v17;
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v4, 1, 1, v5);
  }
  sub_2376E081C((uint64_t)v4, &qword_256808D00);
  v18 = (unint64_t)objc_msgSend(v12, sel_occurrenceCount);
  if ((v18 & 0x8000000000000000) == 0)
  {
    v17 = objc_msgSend((id)objc_opt_self(), sel_recurrenceEndWithOccurrenceCount_, v18);

    return (uint64_t)v17;
  }
  result = sub_2376F2E8C();
  __break(1u);
  return result;
}

id _sSo17REMRecurrenceRuleC21CalendarUIKitInternalE7convert_7account8reminderABSgSo012EKRecurrenceB0C_So11REMObjectIDCAKtFZ_0(void *a1, void *a2, void *a3)
{
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  unint64_t v10;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  uint64_t v26;
  id v27;
  void *v28;
  unint64_t v29;
  id v30;
  id v31;
  id v32;

  v6 = objc_msgSend(a1, sel_frequency);
  if ((unint64_t)v6 > 3)
    return 0;
  v7 = (uint64_t)v6;
  v32 = objc_msgSend((id)objc_opt_self(), sel_newObjectID);
  v31 = objc_msgSend(a1, sel_interval);
  v30 = objc_msgSend(a1, sel_firstDayOfTheWeek);
  v8 = objc_msgSend(a1, sel_daysOfTheWeek);
  if (v8)
  {
    v9 = v8;
    sub_2376E121C(0, &qword_256808D38);
    v10 = sub_2376F2C1C();

  }
  else
  {
    v10 = 0;
  }
  v29 = sub_2376E0ADC(v10, (Class *)0x24BE7D220);
  swift_bridgeObjectRelease();
  v12 = objc_msgSend(a1, sel_daysOfTheMonth);
  if (v12)
  {
    v13 = v12;
    sub_2376E121C(0, &qword_256808D20);
    v14 = sub_2376F2C1C();

  }
  else
  {
    v14 = 0;
  }
  v15 = objc_msgSend(a1, sel_monthsOfTheYear);
  if (v15)
  {
    v16 = v15;
    sub_2376E121C(0, &qword_256808D20);
    v17 = sub_2376F2C1C();

  }
  else
  {
    v17 = 0;
  }
  v18 = objc_msgSend(a1, sel_weeksOfTheYear);
  if (v18)
  {
    v19 = v18;
    sub_2376E121C(0, &qword_256808D20);
    v20 = sub_2376F2C1C();

  }
  else
  {
    v20 = 0;
  }
  v21 = objc_msgSend(a1, sel_daysOfTheYear);
  if (v21)
  {
    v22 = v21;
    sub_2376E121C(0, &qword_256808D20);
    v23 = sub_2376F2C1C();

  }
  else
  {
    v23 = 0;
  }
  v24 = objc_msgSend(a1, sel_setPositions);
  if (v24)
  {
    v25 = v24;
    sub_2376E121C(0, &qword_256808D20);
    v26 = sub_2376F2C1C();

  }
  else
  {
    v26 = 0;
  }
  v27 = objc_msgSend(a1, sel_recurrenceEnd);
  v28 = (void *)sub_2376E0C4C(v27);

  objc_allocWithZone(MEMORY[0x24BE7D230]);
  return sub_2376DFC88(v32, a2, a3, v7, (uint64_t)v31, (uint64_t)v30, v29, v14, v17, v20, v23, v26, v28);
}

uint64_t dispatch thunk of EKEvent.ReminderConvertable.titleAsString.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of EKEvent.ReminderConvertable.notesAsString.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of EKEvent.ReminderConvertable.icsUrl.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of EKEvent.ReminderConvertable.effectiveDisplayDateComponents_forCalendar.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of EKEvent.ReminderConvertable.recurrenceRules.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of EKEvent.ReminderConvertable.cuiki_list.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of EKEvent.ReminderConvertable.objectID.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t sub_2376E121C(uint64_t a1, unint64_t *a2)
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

uint64_t sub_2376E1254(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = sub_2376F28C8();
    result = MEMORY[0x23B81A9F8](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t EKEvent.recurrentReminderOccurrenceDate.getter@<X0>(uint64_t a1@<X8>)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256808CF8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((objc_msgSend(v2, sel_hasRecurrenceRules) & 1) != 0
    || (v7 = objc_msgSend(v2, sel_masterEvent), v7, v7))
  {
    v8 = objc_msgSend(v2, sel_startDateComponents);
    if (v8)
    {
      v9 = v8;
      sub_2376F27B4();

      v10 = sub_2376F27D8();
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v6, 0, 1, v10);
    }
    else
    {
      v11 = sub_2376F27D8();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v6, 1, 1, v11);
    }
    return sub_2376E13E0((uint64_t)v6, a1);
  }
  else
  {
    v13 = sub_2376F27D8();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(a1, 1, 1, v13);
  }
}

uint64_t sub_2376E13E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256808CF8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2376E1428(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v13[2];

  v2 = sub_2376F2784();
  MEMORY[0x24BDAC7A8](v2);
  v3 = sub_2376F2B5C();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = *(_QWORD *)(v4 + 64);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (v5 + 15) & 0xFFFFFFFFFFFFFFF0;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256808D58);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2376E163C(a1, (uint64_t)v9);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v9, 1, v3) == 1)
  {
    sub_2376E081C((uint64_t)v9, &qword_256808D58);
    return 0;
  }
  else
  {
    v11 = (*(uint64_t (**)(char *, char *, uint64_t))(v4 + 32))((char *)v13 - v6, v9, v3);
    MEMORY[0x24BDAC7A8](v11);
    (*(void (**)(char *, char *, uint64_t))(v4 + 16))((char *)v13 - v6, (char *)v13 - v6, v3);
    v13[1] = MEMORY[0x24BEE4AF8];
    sub_2376E18B4();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256808D68);
    sub_2376E18FC();
    sub_2376F2D54();
    sub_2376F2B68();
    objc_allocWithZone((Class)sub_2376F2904());
    sub_2376E198C();
    v10 = sub_2376F28F8();
    (*(void (**)(char *, uint64_t))(v4 + 8))((char *)v13 - v6, v3);
  }
  return v10;
}

uint64_t sub_2376E163C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256808F00);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_2376F282C();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = objc_msgSend(a1, sel_uniqueID);
  if (v11)
  {
    v12 = v11;
    sub_2376F2BE0();

    sub_2376F2820();
    swift_bridgeObjectRelease();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
    {
      sub_2376E081C((uint64_t)v6, &qword_256808F00);
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v10, v6, v7);
      v13 = (void *)sub_2376F2808();
      v14 = objc_msgSend((id)objc_opt_self(), sel_objectIDWithURL_, v13);

      (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
      if (v14)
      {
        v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256808DA8);
        v16 = *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64);
        MEMORY[0x24BDAC7A8](v15);
        v17 = (v16 + 15) & 0xFFFFFFFFFFFFFFF0;
        v18 = sub_2376E1C80(a1, (uint64_t)&v22 - v17);
        MEMORY[0x24BDAC7A8](v18);
        sub_2376E1F10((uint64_t)&v22 - v17, (uint64_t)&v22 - v17);
        sub_2376F2B44();
        sub_2376E081C((uint64_t)&v22 - v17, &qword_256808DA8);
        v19 = sub_2376F2B5C();
        return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(a2, 0, 1, v19);
      }
    }
  }
  v21 = sub_2376F2B5C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(a2, 1, 1, v21);
}

unint64_t sub_2376E18B4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256808D60;
  if (!qword_256808D60)
  {
    v1 = sub_2376F2784();
    result = MEMORY[0x23B81A9F8](MEMORY[0x24BDB4CE8], v1);
    atomic_store(result, (unint64_t *)&qword_256808D60);
  }
  return result;
}

unint64_t sub_2376E18FC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256808D70;
  if (!qword_256808D70)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256808D68);
    result = MEMORY[0x23B81A9F8](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_256808D70);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B81A9EC](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_2376E198C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256808D78;
  if (!qword_256808D78)
  {
    v1 = sub_2376F2B68();
    result = MEMORY[0x23B81A9F8](MEMORY[0x24BE7E300], v1);
    atomic_store(result, (unint64_t *)&qword_256808D78);
  }
  return result;
}

uint64_t sub_2376E1A10(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v11;

  v2 = sub_2376F2B5C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256808D58);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2376E163C(a1, (uint64_t)v8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v8, 1, v2) == 1)
  {
    sub_2376E081C((uint64_t)v8, &qword_256808D58);
    return 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v5, v8, v2);
    v9 = sub_2376F2B50();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  return v9;
}

uint64_t sub_2376E1C80@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256808CF8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_2376F27D8();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v17 - v12;
  EKEvent.recurrentReminderOccurrenceDate.getter((uint64_t)v6);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    sub_2376E081C((uint64_t)v6, &qword_256808CF8);
    v14 = sub_2376F2B80();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(a2, 1, 1, v14);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v13, v6, v7);
    (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v11, v13, v7);
    objc_msgSend(a1, sel_CUIK_reminderShouldBeEditable);
    sub_2376F2B74();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
    v16 = sub_2376F2B80();
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(a2, 0, 1, v16);
  }
}

id ReminderEntityAnnotation.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id ReminderEntityAnnotation.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ReminderEntityAnnotation();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for ReminderEntityAnnotation()
{
  return objc_opt_self();
}

id ReminderEntityAnnotation.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ReminderEntityAnnotation();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for ReminderEntityAnnotation()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of static ReminderEntityAnnotation.annotation(withReminderIntegrationEvent:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of static ReminderEntityAnnotation.entityIdentifier(forReminderIntegrationEvent:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t sub_2376E1F10(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256808DA8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

id CUIKIReminderSyncTrigger.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id CUIKIReminderSyncTrigger.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CUIKIReminderSyncTrigger();
  return objc_msgSendSuper2(&v2, sel_init);
}

id CUIKIReminderSyncTrigger.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CUIKIReminderSyncTrigger();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t _s21CalendarUIKitInternal24CUIKIReminderSyncTriggerC07triggerE03whyySo0dE6ReasonV_tFZ_0(unint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  unsigned int *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;

  v2 = sub_2376F2BA4();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2542B7768 != -1)
    swift_once();
  v6 = __swift_project_value_buffer(v2, (uint64_t)qword_2542B77D0);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  v7 = sub_2376F2B8C();
  v8 = sub_2376F2CF4();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    v10 = swift_slowAlloc();
    v23 = v10;
    *(_DWORD *)v9 = 136446210;
    if (a1 > 2)
    {
      v11 = 0x6E776F6E6B6E55;
      v12 = 0xE700000000000000;
    }
    else
    {
      v11 = *(_QWORD *)&aAppLaunappActi[8 * a1];
      v12 = *(_QWORD *)&aAppLaunappActi[8 * a1 + 24];
    }
    v22 = sub_2376F0408(v11, v12, &v23);
    sub_2376F2D30();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2376DB000, v7, v8, "Requesting a reminders sync with reason %{public}s", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B81AA70](v10, -1, -1);
    MEMORY[0x23B81AA70](v9, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  if (a1 == 2)
  {
    v13 = sub_2376F29A0();
    v14 = *(_QWORD *)(v13 - 8);
    MEMORY[0x24BDAC7A8](v13);
    v16 = (char *)&v22 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
    v17 = (unsigned int *)MEMORY[0x24BE7E128];
  }
  else if (a1 == 1)
  {
    v13 = sub_2376F29A0();
    v14 = *(_QWORD *)(v13 - 8);
    MEMORY[0x24BDAC7A8](v13);
    v16 = (char *)&v22 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
    v17 = (unsigned int *)MEMORY[0x24BE7E120];
  }
  else if (a1)
  {
    v13 = sub_2376F29A0();
    v14 = *(_QWORD *)(v13 - 8);
    MEMORY[0x24BDAC7A8](v13);
    v16 = (char *)&v22 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
    *(_QWORD *)v16 = 0x6E776F6E6B6E75;
    *((_QWORD *)v16 + 1) = 0xE700000000000000;
    v17 = (unsigned int *)MEMORY[0x24BE7E130];
  }
  else
  {
    v13 = sub_2376F29A0();
    v14 = *(_QWORD *)(v13 - 8);
    MEMORY[0x24BDAC7A8](v13);
    v16 = (char *)&v22 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
    v17 = (unsigned int *)MEMORY[0x24BE7E118];
  }
  (*(void (**)(char *, _QWORD, uint64_t))(v14 + 104))(v16, *v17, v13);
  sub_2376F2940();
  return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v16, v13);
}

uint64_t type metadata accessor for CUIKIReminderSyncTrigger()
{
  return objc_opt_self();
}

uint64_t sub_2376E23B0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  int v6;
  uint64_t v8;

  v2 = sub_2376F2A60();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v8 - v4;
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v8 - v4, a1, v2);
  v6 = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v5, v2);
  if (!MEMORY[0x24BE7E1E8] || v6 != *MEMORY[0x24BE7E1E8])
  {
    if (MEMORY[0x24BE7E1E0] && v6 == *MEMORY[0x24BE7E1E0])
      return 1;
    if (MEMORY[0x24BE7E1D8] && v6 == *MEMORY[0x24BE7E1D8])
      return 2;
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  return 0;
}

uint64_t sub_2376E249C()
{
  uint64_t result;

  result = sub_2376F2BD4();
  qword_256808DB0 = result;
  return result;
}

id static NSNotificationName.reminderEventDeleted.getter()
{
  return sub_2376E253C(&qword_256808C00, (id *)&qword_256808DB0);
}

uint64_t sub_2376E24EC()
{
  uint64_t result;

  result = sub_2376F2BD4();
  qword_256808DB8 = result;
  return result;
}

id static NSNotificationName.reminderEventCompleted.getter()
{
  return sub_2376E253C(&qword_256808C08, (id *)&qword_256808DB8);
}

id sub_2376E253C(_QWORD *a1, id *a2)
{
  if (*a1 != -1)
    swift_once();
  return *a2;
}

id CUIKIReminderEditorImplementation.__allocating_init(eventStore:alertDisplayer:undoManager:changeTracker:)(void *a1, uint64_t a2, void *a3, void *a4)
{
  objc_class *v4;
  id v9;
  id v10;

  v9 = objc_allocWithZone(v4);
  v10 = sub_2376EB614(a1, a2, (uint64_t)a3, a4);

  swift_unknownObjectRelease();
  return v10;
}

id CUIKIReminderEditorImplementation.init(eventStore:alertDisplayer:undoManager:changeTracker:)(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v7;

  v7 = sub_2376EB614(a1, a2, (uint64_t)a3, a4);

  swift_unknownObjectRelease();
  return v7;
}

uint64_t sub_2376E2714()
{
  swift_beginAccess();
  return swift_unknownObjectRetain();
}

uint64_t sub_2376E27F4(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC21CalendarUIKitInternal33CUIKIReminderEditorImplementation_alertDisplayer);
  swift_beginAccess();
  *v3 = a1;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  *(_QWORD *)(v1 + OBJC_IVAR____TtC21CalendarUIKitInternal33CUIKIReminderEditorImplementation__requestPerformer) = 0;
  swift_unknownObjectRelease();
  return swift_release();
}

uint64_t sub_2376E2878(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = *a1;
  v3 = *a2;
  v4 = (_QWORD *)(*a2 + OBJC_IVAR____TtC21CalendarUIKitInternal33CUIKIReminderEditorImplementation_alertDisplayer);
  swift_beginAccess();
  *v4 = v2;
  swift_unknownObjectRetain_n();
  swift_unknownObjectRelease();
  *(_QWORD *)(v3 + OBJC_IVAR____TtC21CalendarUIKitInternal33CUIKIReminderEditorImplementation__requestPerformer) = 0;
  swift_unknownObjectRelease();
  return swift_release();
}

uint64_t (*sub_2376E2904(uint64_t a1))(uint64_t a1, char a2)
{
  uint64_t v1;

  *(_QWORD *)(a1 + 24) = v1;
  swift_beginAccess();
  return sub_2376E294C;
}

uint64_t sub_2376E294C(uint64_t a1, char a2)
{
  uint64_t result;

  result = swift_endAccess();
  if ((a2 & 1) == 0)
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 24)
              + OBJC_IVAR____TtC21CalendarUIKitInternal33CUIKIReminderEditorImplementation__requestPerformer) = 0;
    return swift_release();
  }
  return result;
}

uint64_t sub_2376E2994()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE v12[24];
  uint64_t v13;
  ValueMetadata *v14;
  unint64_t v15;

  v1 = OBJC_IVAR____TtC21CalendarUIKitInternal33CUIKIReminderEditorImplementation__requestPerformer;
  if (*(_QWORD *)(v0 + OBJC_IVAR____TtC21CalendarUIKitInternal33CUIKIReminderEditorImplementation__requestPerformer))
  {
    v2 = *(_QWORD *)(v0 + OBJC_IVAR____TtC21CalendarUIKitInternal33CUIKIReminderEditorImplementation__requestPerformer);
  }
  else
  {
    v3 = v0;
    v4 = sub_2376F2A54();
    v5 = *(_QWORD *)(v4 - 8);
    v6 = *(_QWORD *)(v5 + 64);
    MEMORY[0x24BDAC7A8](v4);
    v7 = (v6 + 15) & 0xFFFFFFFFFFFFFFF0;
    sub_2376F2A48();
    v8 = (uint64_t *)(v0 + OBJC_IVAR____TtC21CalendarUIKitInternal33CUIKIReminderEditorImplementation_alertDisplayer);
    swift_beginAccess();
    v9 = *v8;
    v14 = &type metadata for CUIKIReminderEditorImplementation.AlertDisplayerAdapter;
    v15 = sub_2376EBF80();
    v13 = v9;
    swift_unknownObjectRetain();
    v10 = sub_2376F2A3C();
    MEMORY[0x24BDAC7A8](v10);
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v5 + 16))(&v12[-v7], &v12[-v7], v4);
    sub_2376F297C();
    swift_allocObject();
    v2 = sub_2376F294C();
    *(_QWORD *)(v3 + v1) = v2;
    swift_retain();
    swift_release();
    (*(void (**)(_BYTE *, uint64_t))(v5 + 8))(&v12[-v7], v4);
  }
  swift_retain();
  return v2;
}

uint64_t sub_2376E2B14(unint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char **v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  unint64_t v13;
  char *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  unsigned int v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  char *v32;
  uint64_t v33;
  char *v34;
  void (*v35)(uint64_t, char *, uint64_t);
  uint64_t v36;
  int v37;
  char *v38;
  void *v39;
  uint64_t v40;
  unsigned int v41;
  uint64_t v42;
  id v43;
  id v44;
  void *v45;
  uint64_t v46;
  id v47;
  id v48;
  uint64_t v49;
  NSObject *v50;
  os_log_type_t v51;
  uint8_t *v52;
  id v53;
  void *v54;
  uint64_t v55;
  id v56;
  id v57;
  NSObject *v58;
  os_log_type_t v59;
  uint64_t v60;
  _QWORD *v61;
  id v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  _OWORD *v78;
  uint64_t v79;
  unint64_t v80;
  unint64_t v81;
  unint64_t v82;
  unint64_t v83;
  char *v84;
  char *v85;
  void (**v86)(char **, uint64_t);
  void *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  __int128 v93;
  unint64_t v94;
  unint64_t v95;
  void **v96;
  __int128 v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  unint64_t v102;
  uint64_t v103;
  char *v104;
  uint64_t v105;
  uint64_t v106;
  id v107;
  void (**v108)(char **, uint64_t, uint64_t, uint64_t);
  char *v109;
  int v110;
  void (*v111)(char *, char *, uint64_t);
  char **v112;
  char *v113;
  char *v114;
  uint64_t v115;
  char *v116;
  unint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  id v125[9];

  v125[8] = *(id *)MEMORY[0x24BDAC8D0];
  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256808DD0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char **)((char *)&v93 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256808CF8);
  MEMORY[0x24BDAC7A8](v7);
  v104 = (char *)&v93 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v120 = sub_2376F27D8();
  v118 = *(_QWORD *)(v120 - 8);
  v9 = *(_QWORD *)(v118 + 64);
  v10 = MEMORY[0x24BDAC7A8](v120);
  v116 = (char *)&v93 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v114 = (char *)&v93 - v11;
  v12 = v1;
  v13 = swift_bridgeObjectRetain();
  v95 = sub_2376EBC30(v13);

  swift_bridgeObjectRelease();
  v14 = (char *)v12;
  v15 = swift_bridgeObjectRetain();
  v94 = sub_2376EBDD8(v15);
  v99 = v2;
  v113 = v14;

  swift_bridgeObjectRelease();
  v125[0] = (id)MEMORY[0x24BEE4AF8];
  if (a1 >> 62)
  {
LABEL_56:
    swift_bridgeObjectRetain();
    v16 = sub_2376F2E98();
  }
  else
  {
    v16 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
  }
  v112 = v6;
  if (v16)
  {
    if (v16 < 1)
    {
      __break(1u);
LABEL_60:
      __break(1u);
    }
    v119 = v9;
    v17 = 0;
    v6 = &off_2508F7000;
    do
    {
      if ((a1 & 0xC000000000000001) != 0)
        v18 = (id)MEMORY[0x23B81A560](v17, a1);
      else
        v18 = *(id *)(a1 + 8 * v17 + 32);
      v19 = v18;
      sub_2376F2BE0();
      v20 = (void *)sub_2376F2BD4();
      swift_bridgeObjectRelease();
      v21 = objc_msgSend(v19, sel__hasChangesForKey_, v20);

      if (v21)
      {
        sub_2376F2E2C();
        sub_2376F2E50();
        sub_2376F2E5C();
        sub_2376F2E38();
      }
      else
      {

      }
      ++v17;
    }
    while (v16 != v17);
    swift_bridgeObjectRelease();
    v22 = (unint64_t)v125[0];
    v9 = v119;
  }
  else
  {
    swift_bridgeObjectRelease();
    v22 = MEMORY[0x24BEE4AF8];
  }
  v23 = (uint64_t)v104;
  if ((v22 & 0x8000000000000000) != 0 || (v22 & 0x4000000000000000) != 0)
  {
    swift_bridgeObjectRetain();
    v24 = sub_2376F2E98();
    swift_release();
    if (v24)
      goto LABEL_18;
  }
  else
  {
    v24 = *(_QWORD *)(v22 + 16);
    if (v24)
    {
LABEL_18:
      v103 = OBJC_IVAR____TtC21CalendarUIKitInternal33CUIKIReminderEditorImplementation_eventStore;
      v98 = OBJC_IVAR____TtC21CalendarUIKitInternal33CUIKIReminderEditorImplementation_changeTracker;
      v105 = OBJC_IVAR____TtC21CalendarUIKitInternal33CUIKIReminderEditorImplementation__requestPerformer;
      v117 = v22 & 0xC000000000000001;
      v96 = (void **)&v113[OBJC_IVAR____TtC21CalendarUIKitInternal33CUIKIReminderEditorImplementation_alertDisplayer];
      swift_beginAccess();
      v101 = v9 + 7;
      v9 = 4;
      *((_QWORD *)&v25 + 1) = 3;
      v97 = xmmword_2376F38D0;
      v100 = MEMORY[0x24BEE4AE0] + 8;
      *(_QWORD *)&v25 = 138412290;
      v93 = v25;
      v102 = v22;
      v115 = v24;
      do
      {
        if (v117)
          v26 = (id)MEMORY[0x23B81A560](v9 - 4, v22);
        else
          v26 = *(id *)(v22 + 8 * v9);
        v27 = v26;
        a1 = v9 - 3;
        if (__OFADD__(v9 - 4, 1))
        {
          __break(1u);
          goto LABEL_56;
        }
        v28 = sub_2376EB728(v26);
        if (v28)
        {
          v29 = v28;
          v119 = v9 - 3;
          v30 = objc_msgSend(v27, sel_startDateComponents);
          if (!v30)
          {
            (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v118 + 56))(v23, 1, 1, v120);
LABEL_32:
            sub_2376E081C(v23, &qword_256808CF8);
            if (qword_2542B7768 != -1)
              swift_once();
            v49 = sub_2376F2BA4();
            __swift_project_value_buffer(v49, (uint64_t)qword_2542B77D0);
            v50 = sub_2376F2B8C();
            v51 = sub_2376F2CE8();
            if (os_log_type_enabled(v50, v51))
            {
              v52 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)v52 = 0;
              _os_log_impl(&dword_2376DB000, v50, v51, "Not saving changes to reminder without a date", v52, 2u);
              MEMORY[0x23B81AA70](v52, -1, -1);

            }
            else
            {

            }
            v24 = v115;
            a1 = v119;
            goto LABEL_20;
          }
          v31 = v30;
          v32 = v116;
          sub_2376F27B4();

          v33 = v118;
          v34 = v32;
          v35 = *(void (**)(uint64_t, char *, uint64_t))(v118 + 32);
          v36 = v120;
          v35(v23, v34, v120);
          (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v33 + 56))(v23, 0, 1, v36);
          if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v33 + 48))(v23, 1, v36) == 1)
            goto LABEL_32;
          v35((uint64_t)v114, (char *)v23, v120);
          v37 = objc_msgSend(v27, sel_sequenceNumber);
          v38 = v113;
          v39 = *(void **)&v113[v103];
          v40 = sub_2376F2D0C();
          v125[0] = 0;
          v41 = objc_msgSend(v39, sel_saveEvent_span_commit_error_, v27, v40, 0, v125);
          v111 = (void (*)(char *, char *, uint64_t))v35;
          v110 = v37;
          if (v41)
          {
            v42 = *(_QWORD *)&v38[v98];
            v43 = v125[0];
            sub_2376ED9DC(v27, v37, 1, v42);
            v44 = objc_msgSend(v27, sel_objectID);
            if (!v44)
              goto LABEL_60;
            v45 = v44;
            __swift_instantiateConcreteTypeFromMangledName(&qword_256808E20);
            v46 = swift_allocObject();
            *(_OWORD *)(v46 + 16) = v97;
            *(_QWORD *)(v46 + 32) = v45;
            v125[0] = (id)v46;
            sub_2376F2C28();
            v47 = v125[0];
            v48 = v45;
            sub_2376EF230((uint64_t)v47);
            swift_bridgeObjectRelease();

          }
          else
          {
            v53 = v125[0];
            v54 = (void *)sub_2376F27F0();

            swift_willThrow();
            if (qword_2542B7768 != -1)
              swift_once();
            v99 = 0;
            v55 = sub_2376F2BA4();
            __swift_project_value_buffer(v55, (uint64_t)qword_2542B77D0);
            v56 = v54;
            v57 = v54;
            v58 = sub_2376F2B8C();
            v59 = sub_2376F2CE8();
            if (os_log_type_enabled(v58, v59))
            {
              v60 = swift_slowAlloc();
              v61 = (_QWORD *)swift_slowAlloc();
              *(_DWORD *)v60 = v93;
              v62 = v54;
              v63 = _swift_stdlib_bridgeErrorToNSError();
              *(_QWORD *)(v60 + 4) = v63;
              *v61 = v63;

              _os_log_impl(&dword_2376DB000, v58, v59, "Error saving integration event: %@", (uint8_t *)v60, 0xCu);
              __swift_instantiateConcreteTypeFromMangledName(&qword_256808E18);
              swift_arrayDestroy();
              MEMORY[0x23B81AA70](v61, -1, -1);
              MEMORY[0x23B81AA70](v60, -1, -1);

            }
            else
            {

            }
          }
          v64 = v113;
          v65 = *(_QWORD *)&v113[v105];
          v106 = v9;
          if (v65)
          {
            v66 = v65;
          }
          else
          {
            v67 = sub_2376F2A54();
            v109 = (char *)&v93;
            v68 = *(_QWORD *)(v67 - 8);
            v69 = v67;
            v70 = *(_QWORD *)(v68 + 64);
            MEMORY[0x24BDAC7A8](v67);
            v71 = (char *)&v93 - ((v70 + 15) & 0xFFFFFFFFFFFFFFF0);
            sub_2376F2A48();
            v72 = *v96;
            v125[3] = &type metadata for CUIKIReminderEditorImplementation.AlertDisplayerAdapter;
            v125[4] = (id)sub_2376EBF80();
            v125[0] = v72;
            swift_unknownObjectRetain();
            v73 = sub_2376F2A3C();
            v108 = (void (**)(char **, uint64_t, uint64_t, uint64_t))&v93;
            MEMORY[0x24BDAC7A8](v73);
            v74 = v69;
            (*(void (**)(char *, char *, uint64_t))(v68 + 16))(v71, v71, v69);
            sub_2376F297C();
            swift_allocObject();
            v75 = sub_2376F294C();
            *(_QWORD *)&v64[v105] = v75;
            v66 = v75;
            swift_retain();
            swift_release();
            (*(void (**)(char *, uint64_t))(v68 + 8))(v71, v74);
          }
          v76 = sub_2376F2CC4();
          v108 = *(void (***)(char **, uint64_t, uint64_t, uint64_t))(v76 - 8);
          v108[7](v112, 1, 1, v76);
          v77 = v118;
          (*(void (**)(char *, char *, uint64_t))(v118 + 16))(v116, v114, v120);
          sub_2376F2CAC();
          v109 = v64;
          swift_retain();
          v78 = v29;
          swift_retain();
          v107 = v27;
          v79 = sub_2376F2CA0();
          v80 = (*(unsigned __int8 *)(v77 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v77 + 80);
          v81 = (v101 + v80) & 0xFFFFFFFFFFFFFFF8;
          v82 = (v81 + 15) & 0xFFFFFFFFFFFFFFF8;
          v83 = (v82 + 11) & 0xFFFFFFFFFFFFFFF8;
          v84 = (char *)swift_allocObject();
          *((_QWORD *)v84 + 2) = v79;
          v85 = v109;
          *((_QWORD *)v84 + 3) = MEMORY[0x24BEE6930];
          *((_QWORD *)v84 + 4) = v85;
          v109 = (char *)v78;
          *((_QWORD *)v84 + 5) = v78;
          v86 = (void (**)(char **, uint64_t))v108;
          v111(&v84[v80], v116, v120);
          *(_QWORD *)&v84[v81] = v66;
          v87 = v107;
          *(_QWORD *)&v84[v82] = v107;
          v6 = v112;
          *(_DWORD *)&v84[v83] = v110;
          if (((unsigned int (*)(char **, uint64_t, uint64_t))v86[6])(v6, 1, v76) == 1)
          {
            sub_2376E081C((uint64_t)v6, (uint64_t *)&unk_256808DD0);
          }
          else
          {
            sub_2376F2CB8();
            v86[1](v6, v76);
          }
          v9 = v106;
          if (*((_QWORD *)v84 + 2))
          {
            swift_getObjectType();
            swift_unknownObjectRetain();
            v88 = sub_2376F2C70();
            v90 = v89;
            swift_unknownObjectRelease();
          }
          else
          {
            v88 = 0;
            v90 = 0;
          }
          v91 = swift_allocObject();
          *(_QWORD *)(v91 + 16) = &unk_256808E00;
          *(_QWORD *)(v91 + 24) = v84;
          if (v90 | v88)
          {
            v121 = 0;
            v122 = 0;
            v123 = v88;
            v124 = v90;
          }
          v22 = v102;
          a1 = v119;
          swift_task_create();
          swift_release();

          swift_release();
          (*(void (**)(char *, uint64_t))(v118 + 8))(v114, v120);
          v23 = (uint64_t)v104;
          v24 = v115;
        }
        else
        {

        }
LABEL_20:
        ++v9;
      }
      while (a1 != v24);
    }
  }
  swift_release();
  sub_2376E3BD0(v95, 1);
  swift_bridgeObjectRelease();
  sub_2376E3BD0(v94, 0);
  return swift_bridgeObjectRelease();
}

uint64_t sub_2376E378C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  _QWORD *v12;
  int v14;

  *(_DWORD *)(v8 + 64) = v14;
  *(_QWORD *)(v8 + 16) = a4;
  *(_QWORD *)(v8 + 24) = a8;
  *(_QWORD *)(v8 + 32) = sub_2376F2CAC();
  *(_QWORD *)(v8 + 40) = sub_2376F2CA0();
  v12 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v8 + 48) = v12;
  *v12 = v8;
  v12[1] = sub_2376E3824;
  return sub_2376E786C(a5, a6, a7);
}

uint64_t sub_2376E3824(uint64_t a1)
{
  void *v1;
  uint64_t v2;

  *(_QWORD *)(*(_QWORD *)v2 + 56) = a1;
  swift_task_dealloc();
  if (v1)

  sub_2376F2C70();
  return swift_task_switch();
}

uint64_t sub_2376E38DC()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  int v3;
  uint64_t v4;
  id v5;
  id v6;

  v1 = *(_QWORD *)(v0 + 56);
  swift_release();
  if (v1)
  {
    v2 = *(void **)(v0 + 56);
    v3 = *(_DWORD *)(v0 + 64);
    v4 = *(_QWORD *)(*(_QWORD *)(v0 + 16)
                   + OBJC_IVAR____TtC21CalendarUIKitInternal33CUIKIReminderEditorImplementation_changeTracker);
    v5 = *(id *)(v0 + 24);
    v6 = v2;
    sub_2376F1744(v5, v3, 1, v4, v5, v6);

  }
  else
  {
    sub_2376ED43C(*(void **)(v0 + 24), 1);
  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2376E3988()
{
  uint64_t v0;

  swift_release();
  sub_2376ED43C(*(void **)(v0 + 24), 1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2376E39D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_2376F2CC4();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_2376F2CB8();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_2376E081C(a1, (uint64_t *)&unk_256808DD0);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2376F2C70();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_2376E3BD0(unint64_t a1, int a2)
{
  char *v2;
  char *v3;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  char *v8;
  uint64_t i;
  uint64_t v10;
  __int128 v11;
  NSObject *v12;
  char *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t inited;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  void *v22;
  uint64_t v23;
  id v24;
  id v25;
  void *v26;
  uint64_t v27;
  id v28;
  id v29;
  NSObject *v30;
  os_log_type_t v31;
  uint64_t v32;
  char *v33;
  unint64_t v34;
  _QWORD *v35;
  id v36;
  uint64_t v37;
  _QWORD *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  int v47;
  __int128 v48;
  uint64_t v49;
  __int128 v50;
  uint64_t v51;
  uint64_t v52;
  __int128 v53;
  id v54;
  id v55;
  unint64_t v56;
  id v57[16];

  v3 = v2;
  LODWORD(v2) = a2;
  v57[15] = *(id *)MEMORY[0x24BDAC8D0];
  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256808DD0);
  result = MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v46 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1 >> 62)
    goto LABEL_22;
  for (i = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10); i; result = swift_bridgeObjectRelease())
  {
    v46 = v8;
    v47 = (int)v2;
    v55 = (id)objc_opt_self();
    v51 = OBJC_IVAR____TtC21CalendarUIKitInternal33CUIKIReminderEditorImplementation_changeTracker;
    v54 = *(id *)&v3[OBJC_IVAR____TtC21CalendarUIKitInternal33CUIKIReminderEditorImplementation_eventStore];
    v56 = a1 & 0xC000000000000001;
    swift_bridgeObjectRetain();
    v10 = 4;
    v53 = xmmword_2376F3790;
    v52 = MEMORY[0x24BEE4AD8] + 8;
    *((_QWORD *)&v11 + 1) = 3;
    v50 = xmmword_2376F38D0;
    *(_QWORD *)&v11 = 138412290;
    v48 = v11;
    v49 = i;
    while (1)
    {
      v13 = v56 ? (char *)MEMORY[0x23B81A560](v10 - 4, a1) : (char *)*(id *)(a1 + 8 * v10);
      v2 = v13;
      v14 = v10 - 3;
      if (__OFADD__(v10 - 4, 1))
        break;
      v15 = objc_msgSend(v55, sel_defaultCenter);
      if (qword_256808C08 != -1)
        swift_once();
      v16 = qword_256808DB8;
      __swift_instantiateConcreteTypeFromMangledName(&qword_256808ED0);
      inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = v53;
      v57[0] = (id)0x746E657665;
      v57[1] = (id)0xE500000000000000;
      sub_2376F2DC0();
      *(_QWORD *)(inited + 96) = sub_2376E121C(0, &qword_256808EC0);
      *(_QWORD *)(inited + 72) = v2;
      v12 = v2;
      sub_2376E4208(inited);
      v18 = (void *)sub_2376F2BB0();
      swift_bridgeObjectRelease();
      objc_msgSend(v15, sel_postNotificationName_object_userInfo_, v16, 0, v18);

      v57[0] = 0;
      if (objc_msgSend(v54, sel_saveEvent_span_commit_error_, v12, 0, 0, v57))
      {
        v19 = *(_QWORD *)&v3[v51];
        v20 = v57[0];
        sub_2376ED9DC(v12, (int)-[NSObject sequenceNumber](v12, sel_sequenceNumber), 1, v19);
        v21 = -[NSObject objectID](v12, sel_objectID);
        if (!v21)
          __break(1u);
        v22 = v21;
        __swift_instantiateConcreteTypeFromMangledName(&qword_256808E20);
        v23 = swift_allocObject();
        *(_OWORD *)(v23 + 16) = v50;
        *(_QWORD *)(v23 + 32) = v22;
        v57[0] = (id)v23;
        sub_2376F2C28();
        v24 = v57[0];
        v8 = v22;
        sub_2376EF230((uint64_t)v24);
        swift_bridgeObjectRelease();

      }
      else
      {
        v25 = v57[0];
        v26 = (void *)sub_2376F27F0();

        swift_willThrow();
        if (qword_2542B7768 != -1)
          swift_once();
        v27 = sub_2376F2BA4();
        __swift_project_value_buffer(v27, (uint64_t)qword_2542B77D0);
        v28 = v26;
        v29 = v26;
        v30 = sub_2376F2B8C();
        v31 = sub_2376F2CE8();
        v8 = (char *)v31;
        if (os_log_type_enabled(v30, v31))
        {
          v32 = swift_slowAlloc();
          v33 = v3;
          v34 = a1;
          v35 = (_QWORD *)swift_slowAlloc();
          *(_DWORD *)v32 = v48;
          v36 = v26;
          v37 = _swift_stdlib_bridgeErrorToNSError();
          *(_QWORD *)(v32 + 4) = v37;
          *v35 = v37;

          _os_log_impl(&dword_2376DB000, v30, (os_log_type_t)v8, "Error saving integration event: %@", (uint8_t *)v32, 0xCu);
          __swift_instantiateConcreteTypeFromMangledName(&qword_256808E18);
          swift_arrayDestroy();
          v38 = v35;
          a1 = v34;
          v3 = v33;
          i = v49;
          MEMORY[0x23B81AA70](v38, -1, -1);
          MEMORY[0x23B81AA70](v32, -1, -1);

        }
        else
        {

          v12 = v30;
        }
      }

      ++v10;
      if (v14 == i)
      {
        swift_bridgeObjectRelease();
        v39 = sub_2376E2994();
        v40 = sub_2376F2CC4();
        v41 = (uint64_t)v46;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v40 - 8) + 56))(v46, 1, 1, v40);
        sub_2376F2CAC();
        swift_bridgeObjectRetain();
        v42 = v3;
        swift_retain();
        v43 = sub_2376F2CA0();
        v44 = swift_allocObject();
        v45 = MEMORY[0x24BEE6930];
        *(_QWORD *)(v44 + 16) = v43;
        *(_QWORD *)(v44 + 24) = v45;
        *(_QWORD *)(v44 + 32) = a1;
        *(_QWORD *)(v44 + 40) = v42;
        *(_BYTE *)(v44 + 48) = v47 & 1;
        *(_QWORD *)(v44 + 56) = v39;
        sub_2376E5E84(v41, (uint64_t)&unk_256808EF0, v44);
        swift_release();
        return swift_release();
      }
    }
    __break(1u);
LABEL_22:
    swift_bridgeObjectRetain();
    i = sub_2376F2E98();
  }
  return result;
}

unint64_t sub_2376E4208(uint64_t a1)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256808ED8);
  v2 = sub_2376F2EC8();
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
    sub_2376ECA34(v6, (uint64_t)v15, &qword_256808EE0);
    result = sub_2376E8BF0((uint64_t)v15);
    if ((v8 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v9 = v3[6] + 40 * result;
    v10 = v15[0];
    v11 = v15[1];
    *(_QWORD *)(v9 + 32) = v16;
    *(_OWORD *)v9 = v10;
    *(_OWORD *)(v9 + 16) = v11;
    result = (unint64_t)sub_2376ECA78(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_2376E4348(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  void **v4;
  void *v5;
  id v6;
  id v7;
  unint64_t result;
  char v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_256808EC8);
  v2 = (_QWORD *)sub_2376F2EC8();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (void **)(a1 + 40);
  while (1)
  {
    v5 = *v4;
    v6 = *(v4 - 1);
    v7 = v5;
    result = sub_2376E8C20((uint64_t)v6);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v10 = 8 * result;
    *(_QWORD *)(v2[6] + v10) = v6;
    *(_QWORD *)(v2[7] + v10) = v7;
    v11 = v2[2];
    v12 = __OFADD__(v11, 1);
    v13 = v11 + 1;
    if (v12)
      goto LABEL_11;
    v2[2] = v13;
    v4 += 2;
    if (!--v3)
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

unint64_t sub_2376E4450(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  unint64_t result;
  char v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;
  __int128 v20;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_256808E88);
  v2 = (_QWORD *)sub_2376F2EC8();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (_QWORD *)(a1 + 80);
  while (1)
  {
    v5 = *(v4 - 6);
    v6 = *(v4 - 5);
    v20 = *((_OWORD *)v4 - 2);
    v7 = *((_DWORD *)v4 - 4);
    v8 = (void *)*(v4 - 1);
    v9 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v10 = (id)v20;
    v11 = *((id *)&v20 + 1);
    v12 = v8;
    result = sub_2376E8B8C(v5, v6);
    if ((v14 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v15 = (uint64_t *)(v2[6] + 16 * result);
    *v15 = v5;
    v15[1] = v6;
    v16 = v2[7] + 40 * result;
    *(_OWORD *)v16 = v20;
    *(_DWORD *)(v16 + 16) = v7;
    *(_QWORD *)(v16 + 24) = v8;
    *(_QWORD *)(v16 + 32) = v9;
    v17 = v2[2];
    v18 = __OFADD__(v17, 1);
    v19 = v17 + 1;
    if (v18)
      goto LABEL_11;
    v4 += 7;
    v2[2] = v19;
    if (!--v3)
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

uint64_t sub_2376E45B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *(_QWORD *)(v7 + 240) = a5;
  *(_QWORD *)(v7 + 248) = a7;
  *(_BYTE *)(v7 + 456) = a6;
  *(_QWORD *)(v7 + 232) = a4;
  v8 = sub_2376F282C();
  *(_QWORD *)(v7 + 256) = v8;
  *(_QWORD *)(v7 + 264) = *(_QWORD *)(v8 - 8);
  *(_QWORD *)(v7 + 272) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256808CF8);
  *(_QWORD *)(v7 + 280) = swift_task_alloc();
  *(_QWORD *)(v7 + 288) = swift_task_alloc();
  sub_2376F2CAC();
  *(_QWORD *)(v7 + 296) = sub_2376F2CA0();
  *(_QWORD *)(v7 + 304) = sub_2376F2C70();
  *(_QWORD *)(v7 + 312) = v9;
  return swift_task_switch();
}

id sub_2376E46B8()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  id result;
  unint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
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
  void (*v28)(uint64_t, uint64_t);
  char isUniquelyReferenced_nonNull_native;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(uint64_t, unint64_t, uint64_t);
  uint64_t v38;

  v1 = *(_QWORD *)(v0 + 232);
  if (!(v1 >> 62))
  {
    v2 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 320) = v2;
    if (v2)
      goto LABEL_3;
LABEL_22:
    swift_bridgeObjectRelease();
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (id)(*(uint64_t (**)(void))(v0 + 8))();
  }
  swift_bridgeObjectRetain();
  v34 = sub_2376F2E98();
  *(_QWORD *)(v0 + 320) = v34;
  if (!v34)
    goto LABEL_22;
LABEL_3:
  v3 = *(_QWORD *)(v0 + 232);
  v4 = OBJC_IVAR____TtC21CalendarUIKitInternal33CUIKIReminderEditorImplementation_changeTracker;
  *(_QWORD *)(v0 + 328) = OBJC_IVAR____TtC21CalendarUIKitInternal33CUIKIReminderEditorImplementation_eventStore;
  *(_QWORD *)(v0 + 336) = v4;
  *(_QWORD *)(v0 + 344) = OBJC_IVAR____TtC21CalendarUIKitInternal33CUIKIReminderEditorImplementation_undoManager;
  if ((v3 & 0xC000000000000001) != 0)
    v5 = (id)MEMORY[0x23B81A560](0);
  else
    v5 = *(id *)(v3 + 32);
  v6 = v5;
  *(_QWORD *)(v0 + 352) = v5;
  *(_QWORD *)(v0 + 360) = 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256808EA0);
  v7 = sub_2376F2994();
  v8 = *(_QWORD *)(v7 - 8);
  v38 = v8;
  v9 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v36 = *(_QWORD *)(v8 + 72);
  v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_2376F3790;
  result = sub_2376EB728(v6);
  if (result)
  {
    v12 = v10 + v9;
    if ((objc_msgSend(v6, sel_hasRecurrenceRules) & 1) != 0
      || (v13 = objc_msgSend(v6, sel_masterEvent), v13, v13))
    {
      v14 = objc_msgSend(v6, sel_startDateComponents);
      v15 = *(_QWORD *)(v0 + 280);
      if (v14)
      {
        v16 = v14;
        sub_2376F27B4();

        v17 = sub_2376F27D8();
        (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v15, 0, 1, v17);
      }
      else
      {
        v18 = sub_2376F27D8();
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v15, 1, 1, v18);
      }
      sub_2376E13E0(*(_QWORD *)(v0 + 280), *(_QWORD *)(v0 + 288));
    }
    else
    {
      v32 = *(_QWORD *)(v0 + 288);
      v33 = sub_2376F27D8();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v33 - 8) + 56))(v32, 1, 1, v33);
    }
    v35 = v0;
    sub_2376F2988();
    sub_2376EC9C0(&qword_256808EA8, MEMORY[0x24BE7E108]);
    v19 = sub_2376F2CD0();
    v20 = swift_task_alloc();
    v37 = *(void (**)(uint64_t, unint64_t, uint64_t))(v38 + 16);
    v37(v20, v12, v7);
    swift_bridgeObjectRetain();
    v21 = sub_2376F2BBC();
    v22 = -1 << *(_BYTE *)(v19 + 32);
    v23 = v21 & ~v22;
    if (((*(_QWORD *)(v19 + 56 + ((v23 >> 3) & 0xFFFFFFFFFFFFF8)) >> v23) & 1) != 0)
    {
      v24 = ~v22;
      while (1)
      {
        v25 = swift_task_alloc();
        v37(v25, *(_QWORD *)(v19 + 48) + v23 * v36, v7);
        sub_2376EC9C0(&qword_256808EB0, MEMORY[0x24BE7E110]);
        v26 = v20;
        v27 = sub_2376F2BC8();
        v28 = *(void (**)(uint64_t, uint64_t))(v38 + 8);
        v28(v25, v7);
        swift_task_dealloc();
        if ((v27 & 1) != 0)
          break;
        v23 = (v23 + 1) & v24;
        v20 = v26;
        if (((*(_QWORD *)(v19 + 56 + ((v23 >> 3) & 0xFFFFFFFFFFFFF8)) >> v23) & 1) == 0)
          goto LABEL_17;
      }
      swift_bridgeObjectRelease();
      v31 = v26;
    }
    else
    {
LABEL_17:
      swift_bridgeObjectRelease();
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v30 = swift_task_alloc();
      v37(v30, v20, v7);
      sub_2376E9E44(v30, v23, isUniquelyReferenced_nonNull_native);
      swift_bridgeObjectRelease();
      swift_task_dealloc();
      v31 = v20;
      v28 = *(void (**)(uint64_t, uint64_t))(v38 + 8);
    }
    *(_QWORD *)(v35 + 368) = v19;
    v28(v31, v7);
    swift_task_dealloc();
    swift_setDeallocating();
    swift_arrayDestroy();
    swift_deallocClassInstance();
    return (id)swift_task_switch();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_2376E4BA0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v1 = v0[30] + v0[43];
  v2 = sub_2376F2A30();
  v0[47] = v2;
  v0[48] = *(_QWORD *)(v2 - 8);
  v0[49] = swift_task_alloc();
  swift_bridgeObjectRetain();
  sub_2376F2A24();
  MEMORY[0x23B81AAF4](v1);
  sub_2376F2A18();
  v3 = sub_2376F2A0C();
  v0[50] = v3;
  v4 = *(_QWORD *)(v3 - 8);
  v0[51] = v4;
  v0[52] = *(_QWORD *)(v4 + 64);
  v0[53] = swift_task_alloc();
  v5 = (_QWORD *)swift_task_alloc();
  v0[54] = v5;
  *v5 = v0;
  v5[1] = sub_2376E4CC8;
  return sub_2376F2970();
}

uint64_t sub_2376E4CC8()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 440) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2376E4D70()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
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
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t);
  uint64_t v23;
  uint64_t v24;

  v1 = v0[53];
  v2 = v0[50];
  v3 = v0[51];
  v4 = swift_task_alloc();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v4, v1, v2);
  v5 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 88))(v4, v2);
  if (MEMORY[0x24BE7E190] && v5 == *MEMORY[0x24BE7E190])
  {
    v6 = v0[53];
    v7 = v0[50];
    v8 = v0[51];
    v9 = v0[48];
    v23 = v0[47];
    v24 = v0[49];
    (*(void (**)(uint64_t, uint64_t))(v8 + 96))(v4, v7);
    v10 = sub_2376F2A00();
    v11 = *(_QWORD *)(v10 - 8);
    v12 = swift_task_alloc();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 32))(v12, v4, v10);
    v13 = sub_2376F29F4();
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v12, v10);
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v24, v23);
    swift_bridgeObjectRelease();
    swift_task_dealloc();
  }
  else
  {
    if (MEMORY[0x24BE7E198] && v5 == *MEMORY[0x24BE7E198])
    {
      v15 = v0[48];
      v14 = v0[49];
      v16 = v0[47];
      (*(void (**)(_QWORD, _QWORD))(v0[51] + 8))(v0[53], v0[50]);
      (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v14, v16);
    }
    else
    {
      v17 = v0[50];
      v19 = v0[48];
      v18 = v0[49];
      v20 = v0[47];
      v21 = *(void (**)(uint64_t, uint64_t))(v0[51] + 8);
      v21(v0[53], v17);
      (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v18, v20);
      v21(v4, v17);
    }
    swift_bridgeObjectRelease();
    v13 = MEMORY[0x24BEE4AF8];
  }
  v0[56] = v13;
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2376E4F9C()
{
  _QWORD *v0;
  void *v1;

  v1 = (void *)v0[55];
  (*(void (**)(_QWORD, _QWORD))(v0[48] + 8))(v0[49], v0[47]);

  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  return swift_task_switch();
}

id sub_2376E5044()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  id result;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  void (*v27)(uint64_t, uint64_t);
  char isUniquelyReferenced_nonNull_native;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(uint64_t, unint64_t, uint64_t);
  uint64_t v34;

  v1 = *(void **)(v0 + 352);
  sub_2376ED43C(v1, 1);

  v2 = *(_QWORD *)(v0 + 360);
  if (v2 == *(_QWORD *)(v0 + 320))
  {
    swift_bridgeObjectRelease();
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (id)(*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v4 = *(_QWORD *)(v0 + 232);
    if ((v4 & 0xC000000000000001) != 0)
      v5 = (id)MEMORY[0x23B81A560](*(_QWORD *)(v0 + 360));
    else
      v5 = *(id *)(v4 + 8 * v2 + 32);
    v6 = v5;
    *(_QWORD *)(v0 + 352) = v5;
    *(_QWORD *)(v0 + 360) = v2 + 1;
    if (__OFADD__(v2, 1))
      __break(1u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256808EA0);
    v7 = sub_2376F2994();
    v8 = *(_QWORD *)(v7 - 8);
    v34 = v8;
    v9 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
    v32 = *(_QWORD *)(v8 + 72);
    v10 = swift_allocObject();
    *(_OWORD *)(v10 + 16) = xmmword_2376F3790;
    result = sub_2376EB728(v6);
    if (result)
    {
      v11 = v10 + v9;
      if ((objc_msgSend(v6, sel_hasRecurrenceRules) & 1) != 0
        || (v12 = objc_msgSend(v6, sel_masterEvent), v12, v12))
      {
        v13 = objc_msgSend(v6, sel_startDateComponents);
        v14 = *(_QWORD *)(v0 + 280);
        if (v13)
        {
          v15 = v13;
          sub_2376F27B4();

          v16 = sub_2376F27D8();
          (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v14, 0, 1, v16);
        }
        else
        {
          v17 = sub_2376F27D8();
          (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v14, 1, 1, v17);
        }
        sub_2376E13E0(*(_QWORD *)(v0 + 280), *(_QWORD *)(v0 + 288));
      }
      else
      {
        v30 = *(_QWORD *)(v0 + 288);
        v31 = sub_2376F27D8();
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v31 - 8) + 56))(v30, 1, 1, v31);
      }
      sub_2376F2988();
      sub_2376EC9C0(&qword_256808EA8, MEMORY[0x24BE7E108]);
      v18 = sub_2376F2CD0();
      v19 = swift_task_alloc();
      v33 = *(void (**)(uint64_t, unint64_t, uint64_t))(v34 + 16);
      v33(v19, v11, v7);
      swift_bridgeObjectRetain();
      v20 = sub_2376F2BBC();
      v21 = -1 << *(_BYTE *)(v18 + 32);
      v22 = v20 & ~v21;
      if (((*(_QWORD *)(v18 + 56 + ((v22 >> 3) & 0xFFFFFFFFFFFFF8)) >> v22) & 1) != 0)
      {
        v23 = ~v21;
        while (1)
        {
          v24 = swift_task_alloc();
          v33(v24, *(_QWORD *)(v18 + 48) + v22 * v32, v7);
          sub_2376EC9C0(&qword_256808EB0, MEMORY[0x24BE7E110]);
          v25 = v19;
          v26 = sub_2376F2BC8();
          v27 = *(void (**)(uint64_t, uint64_t))(v34 + 8);
          v27(v24, v7);
          swift_task_dealloc();
          if ((v26 & 1) != 0)
            break;
          v22 = (v22 + 1) & v23;
          v19 = v25;
          if (((*(_QWORD *)(v18 + 56 + ((v22 >> 3) & 0xFFFFFFFFFFFFF8)) >> v22) & 1) == 0)
            goto LABEL_18;
        }
        swift_bridgeObjectRelease();
      }
      else
      {
LABEL_18:
        swift_bridgeObjectRelease();
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v29 = swift_task_alloc();
        v33(v29, v19, v7);
        sub_2376E9E44(v29, v22, isUniquelyReferenced_nonNull_native);
        swift_bridgeObjectRelease();
        swift_task_dealloc();
        v25 = v19;
        v27 = *(void (**)(uint64_t, uint64_t))(v34 + 8);
      }
      *(_QWORD *)(v0 + 368) = v18;
      v27(v25, v7);
      swift_task_dealloc();
      swift_setDeallocating();
      swift_arrayDestroy();
      swift_deallocClassInstance();
      return (id)swift_task_switch();
    }
    else
    {
      __break(1u);
    }
  }
  return result;
}

id sub_2376E5500()
{
  id v0;
  _QWORD *v1;
  unint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t inited;
  id v15;
  id v16;
  void *v17;
  void *v18;
  unsigned int v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  id v26;
  id v27;
  id result;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  id v33;
  uint64_t (*v34)(void);
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  unint64_t v44;
  id v45;
  id v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char v59;
  void (*v60)(uint64_t, uint64_t);
  char isUniquelyReferenced_nonNull_native;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  _QWORD *v67;
  uint64_t v68;
  void (*v69)(uint64_t, unint64_t, uint64_t);
  _QWORD *v70;
  uint64_t v71;
  uint64_t v72;

  v2 = v1[56];
  if (!(v2 >> 62))
  {
    if (*(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_3;
LABEL_12:
    swift_bridgeObjectRelease();
    v27 = (id)v1[44];
    sub_2376ED43C(v27, 1);
    goto LABEL_13;
  }
  swift_bridgeObjectRetain();
  v35 = sub_2376F2E98();
  swift_bridgeObjectRelease();
  if (!v35)
    goto LABEL_12;
LABEL_3:
  if ((v2 & 0xC000000000000001) != 0)
  {
    v0 = (id)MEMORY[0x23B81A560](0, v1[56]);
  }
  else
  {
    if (!*(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_37;
    }
    v0 = *(id *)(v1[56] + 32);
  }
  v70 = v1 + 28;
  v3 = (void *)v1[44];
  v5 = v1[33];
  v4 = v1[34];
  v6 = v1[32];
  swift_bridgeObjectRelease();
  v7 = v3;
  v8 = objc_msgSend(v0, sel_objectID);
  v9 = objc_msgSend(v8, sel_urlRepresentation);

  sub_2376F2814();
  sub_2376F27FC();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  v10 = (void *)sub_2376F2BD4();
  swift_bridgeObjectRelease();
  objc_msgSend(v7, sel_setUniqueID_, v10);

  v2 = (unint64_t)objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
  if (qword_256808C08 != -1)
LABEL_37:
    swift_once();
  v11 = (void *)v1[44];
  v66 = v1[41];
  v12 = v1[30];
  v13 = qword_256808DB8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256808ED0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2376F38E0;
  v1[24] = 0x746E657665;
  v1[25] = 0xE500000000000000;
  sub_2376F2DC0();
  *(_QWORD *)(inited + 96) = sub_2376E121C(0, &qword_256808EC0);
  *(_QWORD *)(inited + 72) = v11;
  v1[26] = 0x7265646E696D6572;
  v1[27] = 0xE800000000000000;
  v15 = v11;
  sub_2376F2DC0();
  *(_QWORD *)(inited + 168) = sub_2376E121C(0, &qword_256808EF8);
  *(_QWORD *)(inited + 144) = v0;
  v16 = v0;
  sub_2376E4208(inited);
  v17 = (void *)sub_2376F2BB0();
  swift_bridgeObjectRelease();
  objc_msgSend((id)v2, sel_postNotificationName_object_userInfo_, v13, 0, v17);

  v18 = *(void **)(v12 + v66);
  v1[28] = 0;
  v19 = objc_msgSend(v18, sel_saveEvent_span_commit_error_, v15, 0, 0, v70);
  v20 = (void *)v1[28];
  v21 = (void *)v1[44];
  if (!v19)
  {
    v33 = v20;
    swift_bridgeObjectRelease();
    swift_release();
    sub_2376F27F0();

    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v34 = (uint64_t (*)(void))v1[1];
    return (id)v34();
  }
  v22 = v1[42];
  v23 = v1[30];
  v24 = v20;
  objc_msgSend(v18, sel_addPendingIntegrationEvent_, v21);
  v25 = *(_QWORD *)(v23 + v22);
  LODWORD(v22) = objc_msgSend(v21, sel_sequenceNumber);
  v26 = v21;
  v27 = v16;
  sub_2376F1744(v26, v22, 1, v25, v26, v27);

  sub_2376ED9DC(v26, (int)objc_msgSend(v26, sel_sequenceNumber), 1, v25);
  result = objc_msgSend(v26, sel_objectID);
  if (!result)
  {
    __break(1u);
LABEL_40:
    __break(1u);
    return result;
  }
  v29 = result;
  v30 = (void *)v1[44];
  __swift_instantiateConcreteTypeFromMangledName(&qword_256808E20);
  v31 = swift_allocObject();
  *(_OWORD *)(v31 + 16) = xmmword_2376F38D0;
  *(_QWORD *)(v31 + 32) = v29;
  v72 = v31;
  sub_2376F2C28();
  v32 = v29;
  sub_2376EF230(v72);
  swift_bridgeObjectRelease();

LABEL_13:
  v36 = v1[45];
  if (v36 == v1[40])
  {
    swift_bridgeObjectRelease();
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v34 = (uint64_t (*)(void))v1[1];
    return (id)v34();
  }
  v37 = v1[29];
  if ((v37 & 0xC000000000000001) != 0)
    v38 = (id)MEMORY[0x23B81A560](v1[45]);
  else
    v38 = *(id *)(v37 + 8 * v36 + 32);
  v39 = v38;
  v1[44] = v38;
  v1[45] = v36 + 1;
  if (__OFADD__(v36, 1))
    __break(1u);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256808EA0);
  v40 = sub_2376F2994();
  v41 = *(_QWORD *)(v40 - 8);
  v71 = v41;
  v42 = (*(unsigned __int8 *)(v41 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v41 + 80);
  v68 = *(_QWORD *)(v41 + 72);
  v43 = swift_allocObject();
  *(_OWORD *)(v43 + 16) = xmmword_2376F3790;
  result = sub_2376EB728(v39);
  if (!result)
    goto LABEL_40;
  v44 = v43 + v42;
  if ((objc_msgSend(v39, sel_hasRecurrenceRules) & 1) != 0
    || (v45 = objc_msgSend(v39, sel_masterEvent), v45, v45))
  {
    v46 = objc_msgSend(v39, sel_startDateComponents);
    v47 = v1[35];
    if (v46)
    {
      v48 = v46;
      sub_2376F27B4();

      v49 = sub_2376F27D8();
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v49 - 8) + 56))(v47, 0, 1, v49);
    }
    else
    {
      v50 = sub_2376F27D8();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v50 - 8) + 56))(v47, 1, 1, v50);
    }
    sub_2376E13E0(v1[35], v1[36]);
  }
  else
  {
    v64 = v1[36];
    v65 = sub_2376F27D8();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v65 - 8) + 56))(v64, 1, 1, v65);
  }
  v67 = v1;
  sub_2376F2988();
  sub_2376EC9C0(&qword_256808EA8, MEMORY[0x24BE7E108]);
  v51 = sub_2376F2CD0();
  v52 = swift_task_alloc();
  v69 = *(void (**)(uint64_t, unint64_t, uint64_t))(v71 + 16);
  v69(v52, v44, v40);
  swift_bridgeObjectRetain();
  v53 = sub_2376F2BBC();
  v54 = -1 << *(_BYTE *)(v51 + 32);
  v55 = v53 & ~v54;
  if (((*(_QWORD *)(v51 + 56 + ((v55 >> 3) & 0xFFFFFFFFFFFFF8)) >> v55) & 1) != 0)
  {
    v56 = ~v54;
    while (1)
    {
      v57 = swift_task_alloc();
      v69(v57, *(_QWORD *)(v51 + 48) + v55 * v68, v40);
      sub_2376EC9C0(&qword_256808EB0, MEMORY[0x24BE7E110]);
      v58 = v52;
      v59 = sub_2376F2BC8();
      v60 = *(void (**)(uint64_t, uint64_t))(v71 + 8);
      v60(v57, v40);
      swift_task_dealloc();
      if ((v59 & 1) != 0)
        break;
      v55 = (v55 + 1) & v56;
      v52 = v58;
      if (((*(_QWORD *)(v51 + 56 + ((v55 >> 3) & 0xFFFFFFFFFFFFF8)) >> v55) & 1) == 0)
        goto LABEL_31;
    }
    swift_bridgeObjectRelease();
    v63 = v58;
  }
  else
  {
LABEL_31:
    swift_bridgeObjectRelease();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v62 = swift_task_alloc();
    v69(v62, v52, v40);
    sub_2376E9E44(v62, v55, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    v63 = v52;
    v60 = *(void (**)(uint64_t, uint64_t))(v71 + 8);
  }
  v67[46] = v51;
  v60(v63, v40);
  swift_task_dealloc();
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  return (id)swift_task_switch();
}

uint64_t sub_2376E5E84(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  v5 = sub_2376F2CC4();
  v6 = *(_QWORD *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_2376F2CB8();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(_QWORD *)(a3 + 16))
      return swift_task_create();
    goto LABEL_3;
  }
  sub_2376E081C(a1, (uint64_t *)&unk_256808DD0);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2376F2C70();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t sub_2376E5FB8(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  id v17;
  char isUniquelyReferenced_nonNull_native;
  char v19;
  unint64_t v20;
  uint64_t v21;
  _BOOL8 v22;
  uint64_t v23;
  char v24;
  unint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  BOOL v29;
  uint64_t v30;
  id v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t result;
  _QWORD v43[2];
  char *v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  uint64_t v49;

  v45 = a2;
  v46 = a3;
  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256808DD0);
  MEMORY[0x24BDAC7A8](v4);
  v44 = (char *)v43 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_2376E4348(MEMORY[0x24BEE4AF8]);
  if (a1 >> 62)
  {
LABEL_34:
    swift_bridgeObjectRetain();
    v7 = sub_2376F2E98();
    if (v7)
      goto LABEL_3;
LABEL_35:
    swift_bridgeObjectRelease();
    v32 = (void *)v43[1];
    v33 = sub_2376E2994();
    v34 = sub_2376F2CC4();
    v35 = (uint64_t)v44;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v34 - 8) + 56))(v44, 1, 1, v34);
    sub_2376F2CAC();
    v36 = v32;
    swift_retain();
    v37 = v46;
    swift_retain();
    v38 = sub_2376F2CA0();
    v39 = (_QWORD *)swift_allocObject();
    v40 = MEMORY[0x24BEE6930];
    v39[2] = v38;
    v39[3] = v40;
    v39[4] = v6;
    v39[5] = v36;
    v41 = v45;
    v39[6] = v33;
    v39[7] = v41;
    v39[8] = v37;
    sub_2376E39D0(v35, (uint64_t)&unk_256808E30, (uint64_t)v39);
    swift_release();
    return swift_release();
  }
  v7 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v7)
    goto LABEL_35;
LABEL_3:
  v47 = a1;
  v48 = a1 & 0xC000000000000001;
  v8 = 4;
  while (1)
  {
    if (v48)
      v9 = (id)MEMORY[0x23B81A560](v8 - 4, a1);
    else
      v9 = *(id *)(a1 + 8 * v8);
    v10 = v9;
    v11 = v8 - 3;
    if (__OFADD__(v8 - 4, 1))
    {
      __break(1u);
LABEL_31:
      __break(1u);
LABEL_32:
      __break(1u);
LABEL_33:
      __break(1u);
      goto LABEL_34;
    }
    v12 = sub_2376EB728(v9);
    if (v12)
      break;

LABEL_5:
    ++v8;
    if (v11 == v7)
      goto LABEL_35;
  }
  v13 = v12;
  if ((v6 & 0xC000000000000001) != 0)
  {
    if (v6 < 0)
      v14 = v6;
    else
      v14 = v6 & 0xFFFFFFFFFFFFFF8;
    v15 = v10;
    v16 = sub_2376F2D84();
    if (__OFADD__(v16, 1))
      goto LABEL_32;
    v6 = sub_2376EA9E8(v14, v16 + 1);
  }
  else
  {
    v17 = v10;
  }
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v49 = v6;
  a1 = v6;
  v20 = sub_2376E8C20((uint64_t)v13);
  v21 = *(_QWORD *)(v6 + 16);
  v22 = (v19 & 1) == 0;
  v23 = v21 + v22;
  if (__OFADD__(v21, v22))
    goto LABEL_31;
  v24 = v19;
  if (*(_QWORD *)(v6 + 24) >= v23)
  {
    if ((isUniquelyReferenced_nonNull_native & 1) != 0)
    {
      a1 = 8 * v20;
      if ((v19 & 1) != 0)
        goto LABEL_25;
    }
    else
    {
      sub_2376EB470();
      v6 = v49;
      a1 = 8 * v20;
      if ((v24 & 1) != 0)
        goto LABEL_25;
    }
LABEL_27:
    *(_QWORD *)(v6 + 8 * (v20 >> 6) + 64) |= 1 << v20;
    *(_QWORD *)(*(_QWORD *)(v6 + 48) + a1) = v13;
    *(_QWORD *)(*(_QWORD *)(v6 + 56) + a1) = v10;
    v28 = *(_QWORD *)(v6 + 16);
    v29 = __OFADD__(v28, 1);
    v30 = v28 + 1;
    if (v29)
      goto LABEL_33;
    *(_QWORD *)(v6 + 16) = v30;
    v31 = v13;
    goto LABEL_29;
  }
  sub_2376EAF98(v23, isUniquelyReferenced_nonNull_native);
  v6 = v49;
  v25 = sub_2376E8C20((uint64_t)v13);
  if ((v24 & 1) == (v26 & 1))
  {
    v20 = v25;
    a1 = 8 * v25;
    if ((v24 & 1) == 0)
      goto LABEL_27;
LABEL_25:
    v27 = *(_QWORD *)(v6 + 56);

    *(_QWORD *)(v27 + a1) = v10;
LABEL_29:
    swift_bridgeObjectRelease();

    a1 = v47;
    goto LABEL_5;
  }
  sub_2376E121C(0, &qword_256808E38);
  result = sub_2376F2F04();
  __break(1u);
  return result;
}

uint64_t sub_2376E6330(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t v9;

  v8[26] = a7;
  v8[27] = a8;
  v8[24] = a5;
  v8[25] = a6;
  v8[23] = a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256808CF8);
  v8[28] = swift_task_alloc();
  v8[29] = swift_task_alloc();
  sub_2376F2CAC();
  v8[30] = sub_2376F2CA0();
  v8[31] = sub_2376F2C70();
  v8[32] = v9;
  return swift_task_switch();
}

uint64_t sub_2376E640C()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v1 = *(_QWORD *)(v0 + 184);
  if ((v1 & 0xC000000000000001) != 0)
  {
    v2 = 0;
    v3 = 0;
    v4 = 0;
    v5 = sub_2376F2E68() | 0x8000000000000000;
  }
  else
  {
    v6 = -1 << *(_BYTE *)(v1 + 32);
    v3 = ~v6;
    v2 = (_QWORD *)(v1 + 64);
    v7 = -v6;
    if (v7 < 64)
      v8 = ~(-1 << v7);
    else
      v8 = -1;
    v4 = v8 & *(_QWORD *)(v1 + 64);
    v5 = *(_QWORD *)(v0 + 184);
  }
  *(_QWORD *)(v0 + 264) = v5;
  *(_QWORD *)(v0 + 272) = v2;
  *(_BYTE *)(v0 + 344) = 1;
  *(_QWORD *)(v0 + 288) = 0;
  *(_QWORD *)(v0 + 296) = v4;
  *(_QWORD *)(v0 + 280) = v3;
  swift_bridgeObjectRetain();
  if ((v5 & 0x8000000000000000) != 0)
  {
    v17 = sub_2376F2E80();
    if (!v17)
    {
LABEL_39:
      sub_2376ECA2C();
      swift_release();
      (*(void (**)(_QWORD, _QWORD))(v0 + 208))(*(unsigned __int8 *)(v0 + 344), 0);
      swift_task_dealloc();
      swift_task_dealloc();
      return (*(uint64_t (**)(void))(v0 + 8))();
    }
    v19 = v18;
    *(_QWORD *)(v0 + 160) = v17;
    sub_2376E121C(0, &qword_256808E38);
    swift_unknownObjectRetain();
    swift_dynamicCast();
    v15 = *(id *)(v0 + 152);
    swift_unknownObjectRelease();
    *(_QWORD *)(v0 + 176) = v19;
    sub_2376E121C(0, &qword_256808EC0);
    swift_unknownObjectRetain();
    swift_dynamicCast();
    v16 = *(id *)(v0 + 168);
    swift_unknownObjectRelease();
    v9 = 0;
    v11 = v4;
  }
  else
  {
    if (v4)
    {
      v9 = 0;
      v10 = __clz(__rbit64(v4));
      v11 = (v4 - 1) & v4;
    }
    else
    {
      v27 = v3 + 64;
      if ((unint64_t)(v3 + 64) <= 0x7F)
        goto LABEL_39;
      v28 = v2[1];
      if (v28)
      {
        v9 = 1;
      }
      else
      {
        if (v27 < 0xC0)
          goto LABEL_39;
        v28 = v2[2];
        if (v28)
        {
          v9 = 2;
        }
        else
        {
          if (v27 < 0x100)
            goto LABEL_39;
          v28 = v2[3];
          if (v28)
          {
            v9 = 3;
          }
          else
          {
            if (v27 < 0x140)
              goto LABEL_39;
            v28 = v2[4];
            if (!v28)
            {
              v34 = v27 >> 6;
              v35 = 5;
              while (v34 != v35)
              {
                v28 = v2[v35++];
                if (v28)
                {
                  v9 = v35 - 1;
                  goto LABEL_21;
                }
              }
              goto LABEL_39;
            }
            v9 = 4;
          }
        }
      }
LABEL_21:
      v11 = (v28 - 1) & v28;
      v10 = __clz(__rbit64(v28)) + (v9 << 6);
    }
    v12 = 8 * v10;
    v13 = *(void **)(*(_QWORD *)(v5 + 48) + v12);
    v14 = *(void **)(*(_QWORD *)(v5 + 56) + v12);
    v15 = v13;
    v16 = v14;
  }
  *(_QWORD *)(v0 + 320) = v9;
  *(_QWORD *)(v0 + 328) = v11;
  *(_QWORD *)(v0 + 304) = v15;
  *(_QWORD *)(v0 + 312) = v16;
  if (!v15)
    goto LABEL_39;
  v20 = v15;
  v21 = v16;
  if ((objc_msgSend(v21, sel_hasRecurrenceRules) & 1) != 0
    || (v22 = objc_msgSend(v21, sel_masterEvent), v22, v22))
  {
    v23 = objc_msgSend(v21, sel_startDateComponents, v36);
    v24 = *(_QWORD *)(v0 + 224);
    if (v23)
    {
      v25 = v23;
      sub_2376F27B4();

      v26 = sub_2376F27D8();
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 56))(v24, 0, 1, v26);
    }
    else
    {
      v29 = sub_2376F27D8();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 56))(v24, 1, 1, v29);
    }
    sub_2376E13E0(*(_QWORD *)(v0 + 224), *(_QWORD *)(v0 + 232));
  }
  else
  {
    v32 = *(_QWORD *)(v0 + 232);
    v33 = sub_2376F27D8();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v33 - 8) + 56))(v32, 1, 1, v33);
  }
  v30 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 336) = v30;
  *v30 = v0;
  v30[1] = sub_2376E684C;
  return sub_2376E7280((uint64_t)v20, *(_QWORD *)(v0 + 232), *(_QWORD *)(v0 + 200));
}

uint64_t sub_2376E684C(char a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 232);
  *(_BYTE *)(*(_QWORD *)v1 + 345) = a1;
  swift_task_dealloc();
  sub_2376E081C(v2, &qword_256808CF8);
  return swift_task_switch();
}

id sub_2376E68EC()
{
  uint64_t v0;
  int v1;
  id *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t inited;
  id v12;
  void *v13;
  int v14;
  void *v15;
  unsigned int v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  id result;
  void *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;
  void *v31;
  uint64_t v32;
  id v33;
  id v34;
  NSObject *v35;
  os_log_type_t v36;
  BOOL v37;
  void *v38;
  uint8_t *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  id v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  id v53;
  id v54;
  id v55;
  id v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  int64_t v60;
  int64_t v61;
  uint64_t v62;
  unint64_t v63;
  uint64_t v64;
  _QWORD *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  _QWORD *v69;
  void *v70;
  uint64_t v71;

  v1 = *(unsigned __int8 *)(v0 + 345);
  if (v1 == 1)
  {
    v28 = *(void **)(v0 + 304);
    v27 = *(void **)(v0 + 312);
    sub_2376ECA2C();

    swift_release();
    v29 = 0;
LABEL_47:
    (*(void (**)(uint64_t, _QWORD))(v0 + 208))(v29, 0);
    swift_task_dealloc();
    swift_task_dealloc();
    return (id)(*(uint64_t (**)(void))(v0 + 8))();
  }
  v2 = (id *)(v0 + 152);
  if (v1 == 2 && (objc_msgSend(*(id *)(v0 + 312), sel_hasEverBeenCommitted) & 1) != 0)
  {
    v3 = *(void **)(v0 + 304);
    v4 = *(void **)(v0 + 312);

    v5 = *(_QWORD *)(v0 + 320);
    v6 = *(_QWORD *)(v0 + 328);
    *(_BYTE *)(v0 + 344) = 0;
  }
  else
  {
    v7 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
    if (qword_256808C00 != -1)
      swift_once();
    v8 = *(void **)(v0 + 312);
    v9 = *(_QWORD *)(v0 + 192);
    v10 = qword_256808DB0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256808ED0);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_2376F3790;
    *(_QWORD *)(v0 + 120) = 0x746E657665;
    *(_QWORD *)(v0 + 128) = 0xE500000000000000;
    sub_2376F2DC0();
    *(_QWORD *)(inited + 96) = sub_2376E121C(0, &qword_256808EC0);
    *(_QWORD *)(inited + 72) = v8;
    v12 = v8;
    sub_2376E4208(inited);
    v13 = (void *)sub_2376F2BB0();
    swift_bridgeObjectRelease();
    objc_msgSend(v7, sel_postNotificationName_object_userInfo_, v10, 0, v13);

    v14 = objc_msgSend(v12, sel_sequenceNumber);
    v15 = *(void **)(v9 + OBJC_IVAR____TtC21CalendarUIKitInternal33CUIKIReminderEditorImplementation_eventStore);
    *(_QWORD *)(v0 + 136) = 0;
    v16 = objc_msgSend(v15, sel_removeEvent_span_commit_error_, v12, 0, 0, v0 + 136);
    v17 = *(void **)(v0 + 136);
    if (v16)
    {
      v18 = *(void **)(v0 + 312);
      v19 = *(_QWORD *)(*(_QWORD *)(v0 + 192)
                      + OBJC_IVAR____TtC21CalendarUIKitInternal33CUIKIReminderEditorImplementation_changeTracker);
      v20 = v17;
      sub_2376ED9DC(v18, v14, 1, v19);
      result = objc_msgSend(v18, sel_objectID);
      if (!result)
      {
        __break(1u);
        return result;
      }
      v22 = result;
      v23 = *(void **)(v0 + 304);
      v24 = *(NSObject **)(v0 + 312);
      __swift_instantiateConcreteTypeFromMangledName(&qword_256808E20);
      v25 = swift_allocObject();
      *(_OWORD *)(v25 + 16) = xmmword_2376F38D0;
      *(_QWORD *)(v25 + 32) = v22;
      v71 = v25;
      sub_2376F2C28();
      v26 = v22;
      sub_2376EF230(v71);
      swift_bridgeObjectRelease();

    }
    else
    {
      v30 = v17;
      v31 = (void *)sub_2376F27F0();

      swift_willThrow();
      if (qword_2542B7768 != -1)
        swift_once();
      v32 = sub_2376F2BA4();
      __swift_project_value_buffer(v32, (uint64_t)qword_2542B77D0);
      v33 = v31;
      v34 = v31;
      v35 = sub_2376F2B8C();
      v36 = sub_2376F2CE8();
      v37 = os_log_type_enabled(v35, v36);
      v24 = *(NSObject **)(v0 + 304);
      v38 = *(void **)(v0 + 312);
      if (v37)
      {
        v70 = *(void **)(v0 + 312);
        v39 = (uint8_t *)swift_slowAlloc();
        v69 = (_QWORD *)swift_slowAlloc();
        *(_DWORD *)v39 = 138412290;
        v40 = v31;
        v41 = _swift_stdlib_bridgeErrorToNSError();
        *(_QWORD *)(v0 + 144) = v41;
        v2 = (id *)(v0 + 152);
        sub_2376F2D30();
        *v69 = v41;

        _os_log_impl(&dword_2376DB000, v35, v36, "Error deleting integration event: %@", v39, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_256808E18);
        swift_arrayDestroy();
        MEMORY[0x23B81AA70](v69, -1, -1);
        MEMORY[0x23B81AA70](v39, -1, -1);

      }
      else
      {

        v24 = v35;
      }
    }

    v5 = *(_QWORD *)(v0 + 320);
    v6 = *(_QWORD *)(v0 + 328);
  }
  *(_QWORD *)(v0 + 288) = v5;
  *(_QWORD *)(v0 + 296) = v6;
  v42 = *(_QWORD *)(v0 + 264);
  if (v42 < 0)
  {
    v50 = sub_2376F2E80();
    if (!v50)
    {
LABEL_46:
      sub_2376ECA2C();
      swift_release();
      v29 = *(unsigned __int8 *)(v0 + 344);
      goto LABEL_47;
    }
    v52 = v51;
    *(_QWORD *)(v0 + 160) = v50;
    sub_2376E121C(0, &qword_256808E38);
    swift_unknownObjectRetain();
    swift_dynamicCast();
    v48 = *v2;
    swift_unknownObjectRelease();
    *(_QWORD *)(v0 + 176) = v52;
    sub_2376E121C(0, &qword_256808EC0);
    swift_unknownObjectRetain();
    swift_dynamicCast();
    v49 = *(id *)(v0 + 168);
    swift_unknownObjectRelease();
    v45 = v5;
    v43 = v6;
  }
  else
  {
    if (v6)
    {
      v43 = (v6 - 1) & v6;
      v44 = __clz(__rbit64(v6)) | (v5 << 6);
      v45 = v5;
    }
    else
    {
      v60 = v5 + 1;
      if (__OFADD__(v5, 1))
        __break(1u);
      v61 = (unint64_t)(*(_QWORD *)(v0 + 280) + 64) >> 6;
      if (v60 >= v61)
        goto LABEL_46;
      v62 = *(_QWORD *)(v0 + 272);
      v63 = *(_QWORD *)(v62 + 8 * v60);
      v45 = v5 + 1;
      if (!v63)
      {
        v45 = v5 + 2;
        if (v5 + 2 >= v61)
          goto LABEL_46;
        v63 = *(_QWORD *)(v62 + 8 * v45);
        if (!v63)
        {
          v45 = v5 + 3;
          if (v5 + 3 >= v61)
            goto LABEL_46;
          v63 = *(_QWORD *)(v62 + 8 * v45);
          if (!v63)
          {
            v45 = v5 + 4;
            if (v5 + 4 >= v61)
              goto LABEL_46;
            v63 = *(_QWORD *)(v62 + 8 * v45);
            if (!v63)
            {
              v68 = v5 + 5;
              while (v61 != v68)
              {
                v63 = *(_QWORD *)(v62 + 8 * v68++);
                if (v63)
                {
                  v45 = v68 - 1;
                  goto LABEL_31;
                }
              }
              goto LABEL_46;
            }
          }
        }
      }
LABEL_31:
      v43 = (v63 - 1) & v63;
      v44 = __clz(__rbit64(v63)) + (v45 << 6);
    }
    v46 = 8 * v44;
    v47 = *(void **)(*(_QWORD *)(v42 + 56) + v46);
    v48 = *(id *)(*(_QWORD *)(v42 + 48) + v46);
    v49 = v47;
  }
  *(_QWORD *)(v0 + 320) = v45;
  *(_QWORD *)(v0 + 328) = v43;
  *(_QWORD *)(v0 + 304) = v48;
  *(_QWORD *)(v0 + 312) = v49;
  if (!v48)
    goto LABEL_46;
  v53 = v48;
  v54 = v49;
  if ((objc_msgSend(v54, sel_hasRecurrenceRules) & 1) != 0
    || (v55 = objc_msgSend(v54, sel_masterEvent), v55, v55))
  {
    v56 = objc_msgSend(v54, sel_startDateComponents);
    v57 = *(_QWORD *)(v0 + 224);
    if (v56)
    {
      v58 = v56;
      sub_2376F27B4();

      v59 = sub_2376F27D8();
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v59 - 8) + 56))(v57, 0, 1, v59);
    }
    else
    {
      v64 = sub_2376F27D8();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v64 - 8) + 56))(v57, 1, 1, v64);
    }
    sub_2376E13E0(*(_QWORD *)(v0 + 224), *(_QWORD *)(v0 + 232));
  }
  else
  {
    v66 = *(_QWORD *)(v0 + 232);
    v67 = sub_2376F27D8();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v67 - 8) + 56))(v66, 1, 1, v67);
  }
  v65 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 336) = v65;
  *v65 = v0;
  v65[1] = sub_2376E684C;
  return (id)sub_2376E7280((uint64_t)v53, *(_QWORD *)(v0 + 232), *(_QWORD *)(v0 + 200));
}

void sub_2376E7228(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  id v6;

  if (a2)
    v5 = sub_2376F27E4();
  else
    v5 = 0;
  v6 = (id)v5;
  (*(void (**)(uint64_t, _QWORD))(a3 + 16))(a3, a1 & 1);

}

uint64_t sub_2376E7280(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;

  v4[5] = a3;
  v4[6] = v3;
  v4[3] = a1;
  v4[4] = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256808CF8);
  v4[7] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2376E72E0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;

  v2 = v0[6];
  v1 = v0[7];
  v4 = (void *)v0[3];
  v3 = v0[4];
  v5 = sub_2376F2994();
  v0[8] = v5;
  v6 = *(_QWORD *)(v5 - 8);
  v0[9] = v6;
  v7 = swift_task_alloc();
  v0[10] = v7;
  sub_2376ECA34(v3, v1, &qword_256808CF8);
  v8 = v4;
  sub_2376F2988();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256808EA0);
  v9 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_2376F3790;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v6 + 16))(v10 + v9, v7, v5);
  sub_2376EC888(v10);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  v11 = sub_2376F2934();
  v0[11] = v11;
  v0[12] = *(_QWORD *)(v11 - 8);
  v0[13] = swift_task_alloc();
  sub_2376F2928();
  MEMORY[0x23B81AAF4](v2 + OBJC_IVAR____TtC21CalendarUIKitInternal33CUIKIReminderEditorImplementation_undoManager);
  sub_2376F291C();
  v12 = sub_2376F2910();
  v0[14] = v12;
  v13 = *(_QWORD *)(v12 - 8);
  v0[15] = v13;
  v0[16] = *(_QWORD *)(v13 + 64);
  v0[17] = swift_task_alloc();
  v14 = (_QWORD *)swift_task_alloc();
  v0[18] = v14;
  *v14 = v0;
  v14[1] = sub_2376E74B0;
  return sub_2376F2958();
}

uint64_t sub_2376E74B0()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 152) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2376E7514()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;

  v1 = *(_QWORD *)(v0 + 136);
  v2 = *(_QWORD *)(v0 + 112);
  v3 = *(_QWORD *)(v0 + 120);
  v4 = *(_QWORD *)(v0 + 80);
  v5 = *(_QWORD *)(v0 + 64);
  v6 = *(_QWORD *)(v0 + 72);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 96) + 8))(*(_QWORD *)(v0 + 104), *(_QWORD *)(v0 + 88));
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  v7 = swift_task_alloc();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 32))(v7, v1, v2);
  v8 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 88))(v7, v2);
  if (MEMORY[0x24BE7DFF0] && v8 == *MEMORY[0x24BE7DFF0])
  {
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v0 + 120) + 8))(v7, *(_QWORD *)(v0 + 112));
    v9 = 0;
  }
  else if (MEMORY[0x24BE7DFF8] && v8 == *MEMORY[0x24BE7DFF8])
  {
    v9 = 1;
  }
  else
  {
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v0 + 120) + 8))(v7, *(_QWORD *)(v0 + 112));
    v9 = 2;
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v9);
}

uint64_t sub_2376E7658()
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
  uint8_t *v9;
  _QWORD *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  swift_task_dealloc();
  if (qword_2542B7768 != -1)
    swift_once();
  v1 = *(void **)(v0 + 152);
  v2 = sub_2376F2BA4();
  __swift_project_value_buffer(v2, (uint64_t)qword_2542B77D0);
  v3 = v1;
  v4 = v1;
  v5 = sub_2376F2B8C();
  v6 = sub_2376F2CE8();
  v7 = os_log_type_enabled(v5, v6);
  v8 = *(void **)(v0 + 152);
  if (v7)
  {
    v9 = (uint8_t *)swift_slowAlloc();
    v10 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v9 = 138412290;
    v11 = v8;
    v12 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 16) = v12;
    sub_2376F2D30();
    *v10 = v12;

    _os_log_impl(&dword_2376DB000, v5, v6, "Error deleting reminder: %@", v9, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256808E18);
    swift_arrayDestroy();
    MEMORY[0x23B81AA70](v10, -1, -1);
    MEMORY[0x23B81AA70](v9, -1, -1);

  }
  else
  {

  }
  v13 = *(_QWORD *)(v0 + 80);
  v14 = *(_QWORD *)(v0 + 64);
  v15 = *(_QWORD *)(v0 + 72);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 96) + 8))(*(_QWORD *)(v0 + 104), *(_QWORD *)(v0 + 88));
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v13, v14);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(2);
}

uint64_t sub_2376E786C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;

  v4[9] = a3;
  v4[10] = v3;
  v4[7] = a1;
  v4[8] = a2;
  v5 = sub_2376F27D8();
  v4[11] = v5;
  v4[12] = *(_QWORD *)(v5 - 8);
  v4[13] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2376E78D0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t inited;
  id v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  unint64_t v14;

  v2 = v0[12];
  v1 = v0[13];
  v4 = v0[10];
  v3 = v0[11];
  v6 = (void *)v0[7];
  v5 = v0[8];
  v7 = sub_2376F29E8();
  v0[14] = v7;
  v0[15] = *(_QWORD *)(v7 - 8);
  v0[16] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256808E20);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2376F38D0;
  *(_QWORD *)(inited + 32) = v6;
  v14 = inited;
  sub_2376F2C28();
  v9 = v6;
  sub_2376EC6D8(v14);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v5, v3);
  sub_2376F29D0();
  MEMORY[0x23B81AAF4](v4 + OBJC_IVAR____TtC21CalendarUIKitInternal33CUIKIReminderEditorImplementation_undoManager);
  sub_2376F29DC();
  v10 = sub_2376F29C4();
  v0[17] = v10;
  v11 = *(_QWORD *)(v10 - 8);
  v0[18] = v11;
  v0[19] = *(_QWORD *)(v11 + 64);
  v0[20] = swift_task_alloc();
  v12 = (_QWORD *)swift_task_alloc();
  v0[21] = v12;
  *v12 = v0;
  v12[1] = sub_2376E7A3C;
  return sub_2376F2964();
}

uint64_t sub_2376E7A3C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 176) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2376E7AA0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t result;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v1 = *(_QWORD *)(v0 + 160);
  v2 = *(_QWORD *)(v0 + 136);
  v3 = *(_QWORD *)(v0 + 144);
  v4 = swift_task_alloc();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v4, v1, v2);
  v5 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 88))(v4, v2);
  if (!MEMORY[0x24BE7E150] || v5 != *MEMORY[0x24BE7E150])
  {
    if (MEMORY[0x24BE7E158] && v5 == *MEMORY[0x24BE7E158])
    {
      v14 = *(_QWORD *)(v0 + 120);
      v13 = *(_QWORD *)(v0 + 128);
      v15 = *(_QWORD *)(v0 + 112);
      (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 144) + 8))(*(_QWORD *)(v0 + 160), *(_QWORD *)(v0 + 136));
      (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v15);
    }
    else
    {
      v16 = *(_QWORD *)(v0 + 136);
      v18 = *(_QWORD *)(v0 + 120);
      v17 = *(_QWORD *)(v0 + 128);
      v19 = *(_QWORD *)(v0 + 112);
      v20 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v0 + 144) + 8);
      v20(*(_QWORD *)(v0 + 160), v16);
      (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v17, v19);
      v20(v4, v16);
    }
    v12 = 0;
    goto LABEL_17;
  }
  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v0 + 144) + 96))(v4, *(_QWORD *)(v0 + 136));
  v6 = sub_2376F29B8();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = swift_task_alloc();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32))(v8, v4, v6);
  v9 = sub_2376F29AC();
  if (!(v9 >> 62))
  {
    result = *(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10);
    v27 = v7;
    v28 = v6;
    if (result)
      goto LABEL_5;
LABEL_15:
    swift_bridgeObjectRelease();
    v12 = 0;
    goto LABEL_16;
  }
  result = sub_2376F2E98();
  v27 = v7;
  v28 = v6;
  if (!result)
    goto LABEL_15;
LABEL_5:
  if ((v9 & 0xC000000000000001) != 0)
  {
    v11 = (id)MEMORY[0x23B81A560](0, v9);
    goto LABEL_8;
  }
  if (*(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v11 = *(id *)(v9 + 32);
LABEL_8:
    v12 = v11;
    swift_bridgeObjectRelease();
LABEL_16:
    v21 = *(_QWORD *)(v0 + 160);
    v23 = *(_QWORD *)(v0 + 136);
    v22 = *(_QWORD *)(v0 + 144);
    v25 = *(_QWORD *)(v0 + 120);
    v24 = *(_QWORD *)(v0 + 128);
    v26 = *(_QWORD *)(v0 + 112);
    (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v8, v28);
    (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v21, v23);
    (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v24, v26);
    swift_task_dealloc();
LABEL_17:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(id))(v0 + 8))(v12);
  }
  __break(1u);
  return result;
}

uint64_t sub_2376E7D00()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 120) + 8))(*(_QWORD *)(v0 + 128), *(_QWORD *)(v0 + 112));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2376E7D64()
{
  return 1;
}

uint64_t sub_2376E7D6C()
{
  sub_2376F2F40();
  sub_2376F2F4C();
  return sub_2376F2F58();
}

uint64_t sub_2376E7DAC()
{
  return sub_2376F2F4C();
}

uint64_t sub_2376E7DD0()
{
  sub_2376F2F40();
  sub_2376F2F4C();
  return sub_2376F2F58();
}

uint64_t sub_2376E7E1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;

  v4[4] = a3;
  v4[5] = a4;
  v4[2] = a1;
  v4[3] = a2;
  v4[6] = sub_2376F2CAC();
  v4[7] = sub_2376F2CA0();
  v4[8] = sub_2376F2C70();
  v4[9] = v5;
  return swift_task_switch();
}

uint64_t sub_2376E7E90()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  __int128 v5;

  v1 = *(_QWORD *)(v0 + 40);
  v5 = *(_OWORD *)(v0 + 24);
  *(_QWORD *)(v0 + 80) = sub_2376F2CA0();
  v2 = swift_task_alloc();
  *(_QWORD *)(v0 + 88) = v2;
  *(_QWORD *)(v2 + 16) = v1;
  *(_OWORD *)(v2 + 24) = v5;
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 96) = v3;
  *v3 = v0;
  v3[1] = sub_2376E7F54;
  return sub_2376F2EEC();
}

uint64_t sub_2376E7F54()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 104) = v0;
  swift_task_dealloc();
  if (!v0)
  {
    swift_release();
    swift_task_dealloc();
  }
  return swift_task_switch();
}

uint64_t sub_2376E7FC8()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2376E7FFC()
{
  uint64_t v0;

  swift_release();
  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_2376E8044(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  void (*v32)(char *, uint64_t);
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  char *v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  unint64_t v42;
  id v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  uint64_t v61;
  id v62;
  id v63;
  _QWORD v64[2];
  id v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  _QWORD *v82;
  uint64_t v83;
  uint64_t v84;
  _QWORD aBlock[6];
  uint64_t v86;

  v65 = a3;
  v78 = a1;
  v6 = *(_QWORD *)(a4 - 8);
  v7 = MEMORY[0x24BDAC7A8](a1);
  v71 = (char *)v64 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v72 = v8;
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v64 - v9;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256808E70);
  v11 = sub_2376F2C94();
  v76 = *(_QWORD *)(v11 - 8);
  v77 = v11;
  v74 = *(_QWORD *)(v76 + 64);
  MEMORY[0x24BDAC7A8](v11);
  v75 = (char *)v64 - v12;
  v86 = MEMORY[0x24BEE4AF8];
  v64[1] = sub_2376F2AC0();
  v13 = sub_2376F2AA8();
  v14 = a4;
  v15 = sub_2376F2A9C();
  v16 = *(_QWORD *)(v15 - 8);
  v73 = *(_QWORD *)(v16 + 64);
  MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)v64 - v17;
  if (!MEMORY[0x23B81A3B0](v13, v15))
  {
LABEL_13:
    swift_bridgeObjectRelease();
    v84 = sub_2376F2A6C();
    v52 = v51;
    v53 = sub_2376F2AB4();
    v55 = v54;
    v56 = v86;
    v57 = v75;
    v58 = v76;
    v59 = v77;
    (*(void (**)(char *, uint64_t, uint64_t))(v76 + 16))(v75, v78, v77);
    v60 = (*(unsigned __int8 *)(v58 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v58 + 80);
    v61 = swift_allocObject();
    *(_QWORD *)(v61 + 16) = v14;
    (*(void (**)(unint64_t, char *, uint64_t))(v58 + 32))(v61 + v60, v57, v59);
    v62 = objc_allocWithZone(MEMORY[0x24BE14810]);
    v63 = sub_2376E8990(v84, v52, v53, v55, v56, (uint64_t)sub_2376EC5CC, v61);
    objc_msgSend(v65, sel_displayIntegrationAlert_, v63);

    return;
  }
  v64[0] = a2;
  v19 = 0;
  v70 = v13;
  v69 = v18;
  v68 = v16;
  v67 = v15;
  v66 = v10;
  while (1)
  {
    v20 = sub_2376F2C4C();
    sub_2376F2C34();
    if ((v20 & 1) == 0)
      break;
    v21 = (*(uint64_t (**)(char *, unint64_t, uint64_t))(v16 + 16))(v18, v13+ ((*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80))+ *(_QWORD *)(v16 + 72) * v19, v15);
    v22 = v19 + 1;
    if (__OFADD__(v19, 1))
      goto LABEL_14;
LABEL_5:
    v83 = v22;
    v84 = v19;
    v82 = v64;
    MEMORY[0x24BDAC7A8](v21);
    v24 = (char *)v64 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v24, v18, v15);
    v25 = sub_2376F2A84();
    v80 = v26;
    v81 = v25;
    v27 = sub_2376F2A60();
    v28 = *(_QWORD *)(v27 - 8);
    MEMORY[0x24BDAC7A8](v27);
    v29 = v6;
    v31 = (char *)v64 - v30;
    sub_2376F2A78();
    v79 = sub_2376E23B0((uint64_t)v31);
    v32 = *(void (**)(char *, uint64_t))(v28 + 8);
    v33 = v14;
    v32(v31, v27);
    sub_2376F2A90();
    v34 = v75;
    v35 = v76;
    v36 = v77;
    (*(void (**)(char *, uint64_t, uint64_t))(v76 + 16))(v75, v78, v77);
    v37 = v10;
    v38 = v71;
    (*(void (**)(char *, char *, uint64_t))(v29 + 16))(v71, v37, v14);
    v39 = (*(unsigned __int8 *)(v35 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v35 + 80);
    v40 = (v74 + *(unsigned __int8 *)(v29 + 80) + v39) & ~(unint64_t)*(unsigned __int8 *)(v29 + 80);
    v41 = swift_allocObject();
    *(_QWORD *)(v41 + 16) = v33;
    (*(void (**)(unint64_t, char *, uint64_t))(v35 + 32))(v41 + v39, v34, v36);
    v42 = v41 + v40;
    v14 = v33;
    (*(void (**)(unint64_t, char *, uint64_t))(v29 + 32))(v42, v38, v33);
    v43 = objc_allocWithZone(MEMORY[0x24BE14818]);
    v44 = (void *)sub_2376F2BD4();
    swift_bridgeObjectRelease();
    aBlock[4] = sub_2376EC4C0;
    aBlock[5] = v41;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_2376E8964;
    aBlock[3] = &block_descriptor;
    v45 = _Block_copy(aBlock);
    v46 = objc_msgSend(v43, sel_initWithTitle_style_handler_, v44, v79, v45, v64[0]);

    _Block_release(v45);
    swift_release();
    v47 = v46;
    MEMORY[0x23B81A350]();
    if (*(_QWORD *)((v86 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v86 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_2376F2C40();
    sub_2376F2C58();
    sub_2376F2C28();

    v10 = v66;
    (*(void (**)(char *, uint64_t))(v29 + 8))(v66, v33);
    v48 = v68;
    v15 = v67;
    (*(void (**)(char *, uint64_t))(v68 + 8))(v24, v67);
    v13 = v70;
    v49 = MEMORY[0x23B81A3B0](v70, v15);
    v19 = v84 + 1;
    v6 = v29;
    v16 = v48;
    v18 = v69;
    if (v83 == v49)
      goto LABEL_13;
  }
  v50 = sub_2376F2E08();
  if (v73 != 8)
    goto LABEL_15;
  aBlock[0] = v50;
  (*(void (**)(char *, _QWORD *, uint64_t))(v16 + 16))(v18, aBlock, v15);
  v21 = swift_unknownObjectRelease();
  v22 = v19 + 1;
  if (!__OFADD__(v19, 1))
    goto LABEL_5;
LABEL_14:
  __break(1u);
LABEL_15:
  __break(1u);
}

uint64_t sub_2376E8690(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  MEMORY[0x24BDAC7A8](a1);
  (*(void (**)(char *))(v2 + 16))((char *)&v4 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0));
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256808E70);
  sub_2376F2C94();
  return sub_2376F2C88();
}

uint64_t sub_2376E8724()
{
  sub_2376EC624();
  swift_allocError();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256808E70);
  sub_2376F2C94();
  return sub_2376F2C7C();
}

uint64_t sub_2376E879C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v8;
  _QWORD *v9;

  v8 = *v3;
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v9;
  *v9 = v4;
  v9[1] = sub_2376E880C;
  return sub_2376E7E1C(a1, a2, v8, a3);
}

uint64_t sub_2376E880C()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

id CUIKIReminderEditorImplementation.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void CUIKIReminderEditorImplementation.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id CUIKIReminderEditorImplementation.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CUIKIReminderEditorImplementation();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_2376E8964(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

id sub_2376E8990(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  void *v7;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v18[6];

  if (a2)
  {
    v12 = (void *)sub_2376F2BD4();
    swift_bridgeObjectRelease();
    if (a4)
      goto LABEL_3;
LABEL_6:
    v13 = 0;
    if (a5)
      goto LABEL_4;
LABEL_7:
    v14 = 0;
    goto LABEL_8;
  }
  v12 = 0;
  if (!a4)
    goto LABEL_6;
LABEL_3:
  v13 = (void *)sub_2376F2BD4();
  swift_bridgeObjectRelease();
  if (!a5)
    goto LABEL_7;
LABEL_4:
  sub_2376E121C(0, &qword_256808E78);
  v14 = (void *)sub_2376F2C10();
  swift_bridgeObjectRelease();
LABEL_8:
  v18[4] = a6;
  v18[5] = a7;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 1107296256;
  v18[2] = sub_2376E8964;
  v18[3] = &block_descriptor_22;
  v15 = _Block_copy(v18);
  v16 = objc_msgSend(v7, sel_initWithTitle_message_actions_cancelBlock_, v12, v13, v14, v15);

  _Block_release(v15);
  swift_release();
  return v16;
}

uint64_t sub_2376E8ADC(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_2376E8B40;
  return v6(a1);
}

uint64_t sub_2376E8B40()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

unint64_t sub_2376E8B8C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_2376F2F40();
  sub_2376F2BEC();
  v4 = sub_2376F2F58();
  return sub_2376E8C50(a1, a2, v4);
}

unint64_t sub_2376E8BF0(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_2376F2DA8();
  return sub_2376E8D30(a1, v2);
}

unint64_t sub_2376E8C20(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_2376F2D18();
  return sub_2376E8DF4(a1, v2);
}

unint64_t sub_2376E8C50(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_2376F2EE0() & 1) == 0)
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
      while (!v14 && (sub_2376F2EE0() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_2376E8D30(uint64_t a1, uint64_t a2)
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
      sub_2376EC668(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = MEMORY[0x23B81A500](v9, a1);
      sub_2376EC6A4((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_2376E8DF4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t i;
  id v6;
  char v7;
  uint64_t v8;
  id v9;
  char v10;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  i = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0)
  {
    sub_2376E121C(0, &qword_256808E38);
    v6 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * i);
    v7 = sub_2376F2D24();

    if ((v7 & 1) == 0)
    {
      v8 = ~v4;
      for (i = (i + 1) & v8; ((*(_QWORD *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0; i = (i + 1) & v8)
      {
        v9 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * i);
        v10 = sub_2376F2D24();

        if ((v10 & 1) != 0)
          break;
      }
    }
  }
  return i;
}

uint64_t sub_2376E8F0C(_QWORD *a1, void *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  id v14;
  char v15;
  uint64_t v16;
  id v17;
  char v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  char isUniquelyReferenced_nonNull_native;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v3 = v2;
  v6 = *v2;
  if ((*v2 & 0xC000000000000001) != 0)
  {
    if (v6 < 0)
      v7 = *v2;
    else
      v7 = v6 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
    v8 = a2;
    v9 = sub_2376F2D90();

    if (v9)
    {
      swift_bridgeObjectRelease();

      sub_2376E121C(0, &qword_256808E38);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v26;
      swift_unknownObjectRelease();
      return 0;
    }
    result = sub_2376F2D84();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    v21 = sub_2376E9444(v7, result + 1);
    v27 = v21;
    if (*(_QWORD *)(v21 + 24) <= *(_QWORD *)(v21 + 16))
    {
      v25 = v8;
      sub_2376E9638();
      v22 = v27;
    }
    else
    {
      v22 = v21;
      v23 = v8;
    }
    sub_2376E9C40((uint64_t)v8, v22);
    *v3 = v22;
  }
  else
  {
    swift_bridgeObjectRetain();
    v11 = sub_2376F2D18();
    v12 = -1 << *(_BYTE *)(v6 + 32);
    v13 = v11 & ~v12;
    if (((*(_QWORD *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8)) >> v13) & 1) != 0)
    {
      sub_2376E121C(0, &qword_256808E38);
      v14 = *(id *)(*(_QWORD *)(v6 + 48) + 8 * v13);
      v15 = sub_2376F2D24();

      if ((v15 & 1) != 0)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        v19 = *(void **)(*(_QWORD *)(*v2 + 48) + 8 * v13);
        *a1 = v19;
        v20 = v19;
        return 0;
      }
      v16 = ~v12;
      while (1)
      {
        v13 = (v13 + 1) & v16;
        if (((*(_QWORD *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8)) >> v13) & 1) == 0)
          break;
        v17 = *(id *)(*(_QWORD *)(v6 + 48) + 8 * v13);
        v18 = sub_2376F2D24();

        if ((v18 & 1) != 0)
          goto LABEL_12;
      }
    }
    swift_bridgeObjectRelease();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v28 = *v2;
    *v2 = 0x8000000000000000;
    v8 = a2;
    sub_2376E9CC0((uint64_t)v8, v13, isUniquelyReferenced_nonNull_native);
    *v2 = v28;
  }
  swift_bridgeObjectRelease();
  *a1 = v8;
  return 1;
}

uint64_t sub_2376E91A8(uint64_t a1, char *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  void (*v13)(_QWORD, _QWORD, _QWORD);
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  void (*v17)(_QWORD, _QWORD, _QWORD);
  char v18;
  uint64_t (*v19)(char *, uint64_t);
  _QWORD *v20;
  uint64_t isUniquelyReferenced_nonNull_native;
  char v22;
  char *v23;
  char *v24;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  char *v32;
  uint64_t v33;

  v3 = v2;
  v6 = *v2;
  v7 = sub_2376F2994();
  sub_2376EC9C0(&qword_256808EA8, MEMORY[0x24BE7E108]);
  swift_bridgeObjectRetain();
  v32 = a2;
  v8 = sub_2376F2BBC();
  v9 = -1 << *(_BYTE *)(v6 + 32);
  v10 = v8 & ~v9;
  v30 = v6 + 56;
  if (((*(_QWORD *)(v6 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v26 = v2;
    v27 = a1;
    v28 = ~v9;
    v11 = *(_QWORD **)(v7 - 8);
    v12 = v11[8];
    v29 = v11[9];
    v31 = v11;
    v13 = (void (*)(_QWORD, _QWORD, _QWORD))v11[2];
    while (1)
    {
      MEMORY[0x24BDAC7A8](v8);
      v14 = v6;
      v15 = *(_QWORD *)(v6 + 48);
      v16 = v29 * v10;
      v17 = v13;
      v13((char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), v15 + v29 * v10, v7);
      sub_2376EC9C0(&qword_256808EB0, MEMORY[0x24BE7E110]);
      v18 = sub_2376F2BC8();
      v19 = (uint64_t (*)(char *, uint64_t))v31[1];
      v8 = v19((char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), v7);
      if ((v18 & 1) != 0)
        break;
      v10 = (v10 + 1) & v28;
      v13 = v17;
      v6 = v14;
      if (((*(_QWORD *)(v30 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        v3 = v26;
        a1 = v27;
        v20 = v31;
        goto LABEL_7;
      }
    }
    swift_bridgeObjectRelease();
    v19(v32, v7);
    v17(v27, *(_QWORD *)(*v26 + 48) + v16, v7);
    return 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    v20 = *(_QWORD **)(v7 - 8);
    v12 = v20[8];
    v13 = (void (*)(_QWORD, _QWORD, _QWORD))v20[2];
LABEL_7:
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v22 = isUniquelyReferenced_nonNull_native;
    MEMORY[0x24BDAC7A8](isUniquelyReferenced_nonNull_native);
    v23 = (char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
    v24 = v32;
    v13(v23, v32, v7);
    v33 = *v3;
    *v3 = 0x8000000000000000;
    sub_2376E9E44((uint64_t)v23, v10, v22);
    *v3 = v33;
    swift_bridgeObjectRelease();
    ((void (*)(uint64_t, char *, uint64_t))v20[4])(a1, v24, v7);
    return 1;
  }
}

uint64_t sub_2376E9444(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  char v9;
  unint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256808E98);
    v2 = sub_2376F2DE4();
    v14 = v2;
    sub_2376F2D78();
    if (sub_2376F2D9C())
    {
      sub_2376E121C(0, &qword_256808E38);
      do
      {
        swift_dynamicCast();
        v2 = v14;
        if (*(_QWORD *)(v14 + 24) <= *(_QWORD *)(v14 + 16))
        {
          sub_2376E9638();
          v2 = v14;
        }
        result = sub_2376F2D18();
        v4 = v2 + 56;
        v5 = -1 << *(_BYTE *)(v2 + 32);
        v6 = result & ~v5;
        v7 = v6 >> 6;
        if (((-1 << v6) & ~*(_QWORD *)(v2 + 56 + 8 * (v6 >> 6))) != 0)
        {
          v8 = __clz(__rbit64((-1 << v6) & ~*(_QWORD *)(v2 + 56 + 8 * (v6 >> 6)))) | v6 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          v9 = 0;
          v10 = (unint64_t)(63 - v5) >> 6;
          do
          {
            if (++v7 == v10 && (v9 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            v11 = v7 == v10;
            if (v7 == v10)
              v7 = 0;
            v9 |= v11;
            v12 = *(_QWORD *)(v4 + 8 * v7);
          }
          while (v12 == -1);
          v8 = __clz(__rbit64(~v12)) + (v7 << 6);
        }
        *(_QWORD *)(v4 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v8;
        *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v8) = v13;
        ++*(_QWORD *)(v2 + 16);
      }
      while (sub_2376F2D9C());
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x24BEE4B08];
  }
  return v2;
}

uint64_t sub_2376E9638()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  unint64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t result;
  int64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256808E98);
  v3 = sub_2376F2DD8();
  v4 = v3;
  if (*(_QWORD *)(v2 + 16))
  {
    v28 = v0;
    v5 = 1 << *(_BYTE *)(v2 + 32);
    v6 = (_QWORD *)(v2 + 56);
    if (v5 < 64)
      v7 = ~(-1 << v5);
    else
      v7 = -1;
    v8 = v7 & *(_QWORD *)(v2 + 56);
    v9 = (unint64_t)(v5 + 63) >> 6;
    v10 = v3 + 56;
    result = swift_retain();
    v12 = 0;
    while (1)
    {
      if (v8)
      {
        v14 = __clz(__rbit64(v8));
        v8 &= v8 - 1;
        v15 = v14 | (v12 << 6);
      }
      else
      {
        v16 = v12 + 1;
        if (__OFADD__(v12, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v9)
          goto LABEL_33;
        v17 = v6[v16];
        ++v12;
        if (!v17)
        {
          v12 = v16 + 1;
          if (v16 + 1 >= v9)
            goto LABEL_33;
          v17 = v6[v12];
          if (!v17)
          {
            v12 = v16 + 2;
            if (v16 + 2 >= v9)
              goto LABEL_33;
            v17 = v6[v12];
            if (!v17)
            {
              v18 = v16 + 3;
              if (v18 >= v9)
              {
LABEL_33:
                swift_release();
                v1 = v28;
                v27 = 1 << *(_BYTE *)(v2 + 32);
                if (v27 > 63)
                  bzero((void *)(v2 + 56), ((unint64_t)(v27 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v6 = -1 << v27;
                *(_QWORD *)(v2 + 16) = 0;
                break;
              }
              v17 = v6[v18];
              if (!v17)
              {
                while (1)
                {
                  v12 = v18 + 1;
                  if (__OFADD__(v18, 1))
                    goto LABEL_39;
                  if (v12 >= v9)
                    goto LABEL_33;
                  v17 = v6[v12];
                  ++v18;
                  if (v17)
                    goto LABEL_23;
                }
              }
              v12 = v18;
            }
          }
        }
LABEL_23:
        v8 = (v17 - 1) & v17;
        v15 = __clz(__rbit64(v17)) + (v12 << 6);
      }
      v19 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v15);
      result = sub_2376F2D18();
      v20 = -1 << *(_BYTE *)(v4 + 32);
      v21 = result & ~v20;
      v22 = v21 >> 6;
      if (((-1 << v21) & ~*(_QWORD *)(v10 + 8 * (v21 >> 6))) != 0)
      {
        v13 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v23 = 0;
        v24 = (unint64_t)(63 - v20) >> 6;
        do
        {
          if (++v22 == v24 && (v23 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v25 = v22 == v24;
          if (v22 == v24)
            v22 = 0;
          v23 |= v25;
          v26 = *(_QWORD *)(v10 + 8 * v22);
        }
        while (v26 == -1);
        v13 = __clz(__rbit64(~v26)) + (v22 << 6);
      }
      *(_QWORD *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v13) = v19;
      ++*(_QWORD *)(v4 + 16);
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

uint64_t sub_2376E98D4()
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
  int64_t i;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  void (*v25)(char *, unint64_t, uint64_t);
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  char v29;
  unint64_t v30;
  BOOL v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  int64_t v35;
  _QWORD *v36;
  int64_t v37;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256808EB8);
  v3 = sub_2376F2DD8();
  v4 = v3;
  if (*(_QWORD *)(v2 + 16))
  {
    v5 = 1 << *(_BYTE *)(v2 + 32);
    v6 = *(_QWORD *)(v2 + 56);
    v36 = (_QWORD *)(v2 + 56);
    if (v5 < 64)
      v7 = ~(-1 << v5);
    else
      v7 = -1;
    v8 = v7 & v6;
    v34 = v0;
    v35 = (unint64_t)(v5 + 63) >> 6;
    v9 = v3 + 56;
    result = swift_retain();
    for (i = 0; ; i = v37)
    {
      if (v8)
      {
        v13 = __clz(__rbit64(v8));
        v8 &= v8 - 1;
        v37 = i;
        v14 = v13 | (i << 6);
      }
      else
      {
        v15 = i + 1;
        if (__OFADD__(i, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v15 >= v35)
          goto LABEL_33;
        v16 = v36[v15];
        v17 = i + 1;
        if (!v16)
        {
          v17 = i + 2;
          if (i + 2 >= v35)
            goto LABEL_33;
          v16 = v36[v17];
          if (!v16)
          {
            v17 = i + 3;
            if (i + 3 >= v35)
              goto LABEL_33;
            v16 = v36[v17];
            if (!v16)
            {
              v18 = i + 4;
              if (i + 4 >= v35)
              {
LABEL_33:
                swift_release();
                v1 = v34;
                v33 = 1 << *(_BYTE *)(v2 + 32);
                if (v33 > 63)
                  bzero(v36, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v36 = -1 << v33;
                *(_QWORD *)(v2 + 16) = 0;
                break;
              }
              v16 = v36[v18];
              if (!v16)
              {
                while (1)
                {
                  v17 = v18 + 1;
                  if (__OFADD__(v18, 1))
                    goto LABEL_39;
                  if (v17 >= v35)
                    goto LABEL_33;
                  v16 = v36[v17];
                  ++v18;
                  if (v16)
                    goto LABEL_23;
                }
              }
              v17 = i + 4;
            }
          }
        }
LABEL_23:
        v8 = (v16 - 1) & v16;
        v37 = v17;
        v14 = __clz(__rbit64(v16)) + (v17 << 6);
      }
      v19 = sub_2376F2994();
      MEMORY[0x24BDAC7A8](v19);
      v21 = (char *)&v34 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
      v23 = *(_QWORD *)(v22 + 72);
      v24 = *(_QWORD *)(v2 + 48) + v23 * v14;
      v25 = *(void (**)(char *, unint64_t, uint64_t))(v22 + 32);
      v25(v21, v24, v19);
      sub_2376EC9C0(&qword_256808EA8, MEMORY[0x24BE7E108]);
      result = sub_2376F2BBC();
      v26 = -1 << *(_BYTE *)(v4 + 32);
      v27 = result & ~v26;
      v28 = v27 >> 6;
      if (((-1 << v27) & ~*(_QWORD *)(v9 + 8 * (v27 >> 6))) != 0)
      {
        v12 = __clz(__rbit64((-1 << v27) & ~*(_QWORD *)(v9 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v29 = 0;
        v30 = (unint64_t)(63 - v26) >> 6;
        do
        {
          if (++v28 == v30 && (v29 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v31 = v28 == v30;
          if (v28 == v30)
            v28 = 0;
          v29 |= v31;
          v32 = *(_QWORD *)(v9 + 8 * v28);
        }
        while (v32 == -1);
        v12 = __clz(__rbit64(~v32)) + (v28 << 6);
      }
      *(_QWORD *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      result = ((uint64_t (*)(unint64_t, char *, uint64_t))v25)(*(_QWORD *)(v4 + 48) + v12 * v23, v21, v19);
      ++*(_QWORD *)(v4 + 16);
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

unint64_t sub_2376E9C40(uint64_t a1, uint64_t a2)
{
  unint64_t result;

  sub_2376F2D18();
  result = sub_2376F2D6C();
  *(_QWORD *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
  *(_QWORD *)(*(_QWORD *)(a2 + 48) + 8 * result) = a1;
  ++*(_QWORD *)(a2 + 16);
  return result;
}

void sub_2376E9CC0(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t *v3;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  char v12;
  uint64_t v13;
  id v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;

  v6 = *(_QWORD *)(*v3 + 16);
  v7 = *(_QWORD *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0)
    goto LABEL_14;
  if ((a3 & 1) != 0)
  {
    sub_2376E9638();
  }
  else
  {
    if (v7 > v6)
    {
      sub_2376EA054();
      goto LABEL_14;
    }
    sub_2376EA43C();
  }
  v8 = *v3;
  v9 = sub_2376F2D18();
  v10 = -1 << *(_BYTE *)(v8 + 32);
  a2 = v9 & ~v10;
  if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    sub_2376E121C(0, &qword_256808E38);
    v11 = *(id *)(*(_QWORD *)(v8 + 48) + 8 * a2);
    v12 = sub_2376F2D24();

    if ((v12 & 1) != 0)
    {
LABEL_13:
      sub_2376F2EF8();
      __break(1u);
    }
    else
    {
      v13 = ~v10;
      while (1)
      {
        a2 = (a2 + 1) & v13;
        if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) == 0)
          break;
        v14 = *(id *)(*(_QWORD *)(v8 + 48) + 8 * a2);
        v15 = sub_2376F2D24();

        if ((v15 & 1) != 0)
          goto LABEL_13;
      }
    }
  }
LABEL_14:
  v16 = *v3;
  *(_QWORD *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(_QWORD *)(*(_QWORD *)(v16 + 48) + 8 * a2) = a1;
  v17 = *(_QWORD *)(v16 + 16);
  v18 = __OFADD__(v17, 1);
  v19 = v17 + 1;
  if (v18)
    __break(1u);
  else
    *(_QWORD *)(v16 + 16) = v19;
}

uint64_t sub_2376E9E44(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t *v3;
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
  void (*v15)(char *, unint64_t, uint64_t);
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v27 = a1;
  v5 = *(_QWORD *)(*v3 + 16);
  v6 = *(_QWORD *)(*v3 + 24);
  if (v6 > v5 && (a3 & 1) != 0)
    goto LABEL_12;
  if ((a3 & 1) != 0)
  {
    sub_2376E98D4();
  }
  else
  {
    if (v6 > v5)
    {
      sub_2376EA1FC();
      goto LABEL_12;
    }
    sub_2376EA6B4();
  }
  v7 = *v3;
  v8 = sub_2376F2994();
  sub_2376EC9C0(&qword_256808EA8, MEMORY[0x24BE7E108]);
  v9 = sub_2376F2BBC();
  v10 = -1 << *(_BYTE *)(v7 + 32);
  a2 = v9 & ~v10;
  v25 = v7 + 56;
  v26 = v7;
  if (((*(_QWORD *)(v7 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v11 = ~v10;
    v12 = *(_QWORD *)(v8 - 8);
    v14 = *(_QWORD *)(v12 + 64);
    v13 = *(_QWORD *)(v12 + 72);
    v15 = *(void (**)(char *, unint64_t, uint64_t))(v12 + 16);
    do
    {
      MEMORY[0x24BDAC7A8](v9);
      v15((char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), *(_QWORD *)(v26 + 48) + v13 * a2, v8);
      sub_2376EC9C0(&qword_256808EB0, MEMORY[0x24BE7E110]);
      v16 = sub_2376F2BC8();
      v9 = (*(uint64_t (**)(char *, uint64_t))(v12 + 8))((char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), v8);
      if ((v16 & 1) != 0)
        goto LABEL_15;
      a2 = (a2 + 1) & v11;
    }
    while (((*(_QWORD *)(v25 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_12:
  v17 = *v24;
  *(_QWORD *)(*v24 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  v18 = *(_QWORD *)(v17 + 48);
  v19 = sub_2376F2994();
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 32))(v18 + *(_QWORD *)(*(_QWORD *)(v19 - 8) + 72) * a2, v27, v19);
  v21 = *(_QWORD *)(v17 + 16);
  v22 = __OFADD__(v21, 1);
  v23 = v21 + 1;
  if (!v22)
  {
    *(_QWORD *)(v17 + 16) = v23;
    return result;
  }
  __break(1u);
LABEL_15:
  result = sub_2376F2EF8();
  __break(1u);
  return result;
}

id sub_2376EA054()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id result;
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
  void *v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256808E98);
  v2 = *v0;
  v3 = sub_2376F2DCC();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_28:
    result = (id)swift_release();
    *v1 = v4;
    return result;
  }
  result = (id)(v3 + 56);
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
    v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v18 >= v13)
      goto LABEL_28;
    v19 = *(_QWORD *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      v9 = v18 + 1;
      if (v18 + 1 >= v13)
        goto LABEL_28;
      v19 = *(_QWORD *)(v6 + 8 * v9);
      if (!v19)
      {
        v9 = v18 + 2;
        if (v18 + 2 >= v13)
          goto LABEL_28;
        v19 = *(_QWORD *)(v6 + 8 * v9);
        if (!v19)
          break;
      }
    }
LABEL_27:
    v12 = (v19 - 1) & v19;
    v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(void **)(*(_QWORD *)(v2 + 48) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    result = v17;
  }
  v20 = v18 + 3;
  if (v20 >= v13)
    goto LABEL_28;
  v19 = *(_QWORD *)(v6 + 8 * v20);
  if (v19)
  {
    v9 = v20;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v19 = *(_QWORD *)(v6 + 8 * v9);
    ++v20;
    if (v19)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_2376EA1FC()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  unint64_t v6;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  int64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  unint64_t v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  uint64_t *v23;
  const void *v24;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256808EB8);
  v2 = *v0;
  v3 = sub_2376F2DCC();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = (void *)swift_release();
LABEL_30:
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 56);
  v6 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  v23 = v1;
  v24 = (const void *)(v2 + 56);
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v6)
    result = memmove(result, v24, 8 * v6);
  v8 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v9 = 1 << *(_BYTE *)(v2 + 32);
  v10 = -1;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  v11 = v10 & *(_QWORD *)(v2 + 56);
  v12 = (unint64_t)(v9 + 63) >> 6;
  while (1)
  {
    if (v11)
    {
      v13 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      v14 = v13 | (v8 << 6);
      goto LABEL_12;
    }
    v20 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
      goto LABEL_32;
    }
    if (v20 >= v12)
      goto LABEL_28;
    v21 = *((_QWORD *)v24 + v20);
    ++v8;
    if (!v21)
    {
      v8 = v20 + 1;
      if (v20 + 1 >= v12)
        goto LABEL_28;
      v21 = *((_QWORD *)v24 + v8);
      if (!v21)
      {
        v8 = v20 + 2;
        if (v20 + 2 >= v12)
          goto LABEL_28;
        v21 = *((_QWORD *)v24 + v8);
        if (!v21)
          break;
      }
    }
LABEL_27:
    v11 = (v21 - 1) & v21;
    v14 = __clz(__rbit64(v21)) + (v8 << 6);
LABEL_12:
    v15 = sub_2376F2994();
    v16 = *(_QWORD *)(v15 - 8);
    MEMORY[0x24BDAC7A8](v15);
    v18 = (char *)&v23 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
    v19 = *(_QWORD *)(v16 + 72) * v14;
    (*(void (**)(char *, unint64_t, uint64_t))(v16 + 16))(v18, *(_QWORD *)(v2 + 48) + v19, v15);
    result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v16 + 32))(*(_QWORD *)(v4 + 48) + v19, v18, v15);
  }
  v22 = v20 + 3;
  if (v22 >= v12)
  {
LABEL_28:
    result = (void *)swift_release();
    v1 = v23;
    goto LABEL_30;
  }
  v21 = *((_QWORD *)v24 + v22);
  if (v21)
  {
    v8 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    v8 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v8 >= v12)
      goto LABEL_28;
    v21 = *((_QWORD *)v24 + v8);
    ++v22;
    if (v21)
      goto LABEL_27;
  }
LABEL_32:
  __break(1u);
  return result;
}

uint64_t sub_2376EA43C()
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
  int64_t v9;
  uint64_t v10;
  uint64_t result;
  int64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  id v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t *v27;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256808E98);
  v3 = sub_2376F2DD8();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v4;
    return result;
  }
  v27 = v0;
  v5 = 1 << *(_BYTE *)(v2 + 32);
  v6 = v2 + 56;
  if (v5 < 64)
    v7 = ~(-1 << v5);
  else
    v7 = -1;
  v8 = v7 & *(_QWORD *)(v2 + 56);
  v9 = (unint64_t)(v5 + 63) >> 6;
  v10 = v3 + 56;
  result = swift_retain();
  v12 = 0;
  while (1)
  {
    if (v8)
    {
      v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      v15 = v14 | (v12 << 6);
      goto LABEL_24;
    }
    v16 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v9)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v16);
    ++v12;
    if (!v17)
    {
      v12 = v16 + 1;
      if (v16 + 1 >= v9)
        goto LABEL_33;
      v17 = *(_QWORD *)(v6 + 8 * v12);
      if (!v17)
      {
        v12 = v16 + 2;
        if (v16 + 2 >= v9)
          goto LABEL_33;
        v17 = *(_QWORD *)(v6 + 8 * v12);
        if (!v17)
          break;
      }
    }
LABEL_23:
    v8 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v12 << 6);
LABEL_24:
    v19 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * v15);
    result = sub_2376F2D18();
    v20 = -1 << *(_BYTE *)(v4 + 32);
    v21 = result & ~v20;
    v22 = v21 >> 6;
    if (((-1 << v21) & ~*(_QWORD *)(v10 + 8 * (v21 >> 6))) != 0)
    {
      v13 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v23 = 0;
      v24 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v25 = v22 == v24;
        if (v22 == v24)
          v22 = 0;
        v23 |= v25;
        v26 = *(_QWORD *)(v10 + 8 * v22);
      }
      while (v26 == -1);
      v13 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(_QWORD *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v13) = v19;
    ++*(_QWORD *)(v4 + 16);
  }
  v18 = v16 + 3;
  if (v18 >= v9)
  {
LABEL_33:
    result = swift_release_n();
    v1 = v27;
    goto LABEL_35;
  }
  v17 = *(_QWORD *)(v6 + 8 * v18);
  if (v17)
  {
    v12 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    v12 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v12 >= v9)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v12);
    ++v18;
    if (v17)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_2376EA6B4()
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
  int64_t i;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  char v29;
  unint64_t v30;
  BOOL v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  int64_t v35;
  int64_t v36;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256808EB8);
  v3 = sub_2376F2DD8();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v4;
    return result;
  }
  v5 = 1 << *(_BYTE *)(v2 + 32);
  v6 = *(_QWORD *)(v2 + 56);
  v33 = v0;
  v34 = v2 + 56;
  if (v5 < 64)
    v7 = ~(-1 << v5);
  else
    v7 = -1;
  v8 = v7 & v6;
  v35 = (unint64_t)(v5 + 63) >> 6;
  v9 = v3 + 56;
  result = swift_retain();
  for (i = 0; ; i = v36)
  {
    if (v8)
    {
      v13 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      v36 = i;
      v14 = v13 | (i << 6);
      goto LABEL_24;
    }
    v15 = i + 1;
    if (__OFADD__(i, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v15 >= v35)
      goto LABEL_33;
    v16 = *(_QWORD *)(v34 + 8 * v15);
    v17 = i + 1;
    if (!v16)
    {
      v17 = i + 2;
      if (i + 2 >= v35)
        goto LABEL_33;
      v16 = *(_QWORD *)(v34 + 8 * v17);
      if (!v16)
      {
        v17 = i + 3;
        if (i + 3 >= v35)
          goto LABEL_33;
        v16 = *(_QWORD *)(v34 + 8 * v17);
        if (!v16)
          break;
      }
    }
LABEL_23:
    v8 = (v16 - 1) & v16;
    v36 = v17;
    v14 = __clz(__rbit64(v16)) + (v17 << 6);
LABEL_24:
    v19 = sub_2376F2994();
    v20 = *(_QWORD *)(v19 - 8);
    MEMORY[0x24BDAC7A8](v19);
    v22 = (char *)&v33 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
    v23 = v2;
    v24 = *(_QWORD *)(v2 + 48);
    v25 = *(_QWORD *)(v20 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v20 + 16))(v22, v24 + v25 * v14, v19);
    sub_2376EC9C0(&qword_256808EA8, MEMORY[0x24BE7E108]);
    result = sub_2376F2BBC();
    v26 = -1 << *(_BYTE *)(v4 + 32);
    v27 = result & ~v26;
    v28 = v27 >> 6;
    if (((-1 << v27) & ~*(_QWORD *)(v9 + 8 * (v27 >> 6))) != 0)
    {
      v12 = __clz(__rbit64((-1 << v27) & ~*(_QWORD *)(v9 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v29 = 0;
      v30 = (unint64_t)(63 - v26) >> 6;
      do
      {
        if (++v28 == v30 && (v29 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v31 = v28 == v30;
        if (v28 == v30)
          v28 = 0;
        v29 |= v31;
        v32 = *(_QWORD *)(v9 + 8 * v28);
      }
      while (v32 == -1);
      v12 = __clz(__rbit64(~v32)) + (v28 << 6);
    }
    *(_QWORD *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v20 + 32))(*(_QWORD *)(v4 + 48) + v12 * v25, v22, v19);
    ++*(_QWORD *)(v4 + 16);
    v2 = v23;
  }
  v18 = i + 4;
  if (i + 4 >= v35)
  {
LABEL_33:
    result = swift_release_n();
    v1 = v33;
    goto LABEL_35;
  }
  v16 = *(_QWORD *)(v34 + 8 * v18);
  if (v16)
  {
    v17 = i + 4;
    goto LABEL_23;
  }
  while (1)
  {
    v17 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v17 >= v35)
      goto LABEL_33;
    v16 = *(_QWORD *)(v34 + 8 * v17);
    ++v18;
    if (v16)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_2376EA9E8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  unint64_t v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256808EC8);
    v2 = sub_2376F2EBC();
    v18 = v2;
    sub_2376F2E68();
    v3 = sub_2376F2E80();
    if (v3)
    {
      v4 = v3;
      sub_2376E121C(0, &qword_256808E38);
      do
      {
        swift_dynamicCast();
        sub_2376E121C(0, &qword_256808EC0);
        swift_dynamicCast();
        v2 = v18;
        v12 = *(_QWORD *)(v18 + 16);
        if (*(_QWORD *)(v18 + 24) <= v12)
        {
          sub_2376EAF98(v12 + 1, 1);
          v2 = v18;
        }
        result = sub_2376F2D18();
        v6 = v2 + 64;
        v7 = -1 << *(_BYTE *)(v2 + 32);
        v8 = result & ~v7;
        v9 = v8 >> 6;
        if (((-1 << v8) & ~*(_QWORD *)(v2 + 64 + 8 * (v8 >> 6))) != 0)
        {
          v10 = __clz(__rbit64((-1 << v8) & ~*(_QWORD *)(v2 + 64 + 8 * (v8 >> 6)))) | v8 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          v13 = 0;
          v14 = (unint64_t)(63 - v7) >> 6;
          do
          {
            if (++v9 == v14 && (v13 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            v15 = v9 == v14;
            if (v9 == v14)
              v9 = 0;
            v13 |= v15;
            v16 = *(_QWORD *)(v6 + 8 * v9);
          }
          while (v16 == -1);
          v10 = __clz(__rbit64(~v16)) + (v9 << 6);
        }
        *(_QWORD *)(v6 + ((v10 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v10;
        v11 = 8 * v10;
        *(_QWORD *)(*(_QWORD *)(v2 + 48) + v11) = v17;
        *(_QWORD *)(*(_QWORD *)(v2 + 56) + v11) = v4;
        ++*(_QWORD *)(v2 + 16);
        v4 = sub_2376F2E80();
      }
      while (v4);
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x24BEE4B00];
  }
  return v2;
}

uint64_t sub_2376EAC38(uint64_t a1, char a2)
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
  _QWORD *v18;
  uint64_t v19;
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
  int v34;
  id v35;
  id v36;
  id v37;
  uint64_t v38;
  uint64_t *v39;
  int64_t v40;
  uint64_t v41;
  char v42;
  __int128 v43;
  __int128 v44;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256808E88);
  v42 = a2;
  v6 = sub_2376F2EB0();
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
      v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v21 = v20 | (v13 << 6);
      goto LABEL_31;
    }
    v22 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v40)
      break;
    v23 = (_QWORD *)(v5 + 64);
    v24 = *(_QWORD *)(v41 + 8 * v22);
    ++v13;
    if (!v24)
    {
      v13 = v22 + 1;
      if (v22 + 1 >= v40)
        goto LABEL_33;
      v24 = *(_QWORD *)(v41 + 8 * v13);
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v40)
        {
LABEL_33:
          swift_release();
          v3 = v39;
          if ((v42 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v24 = *(_QWORD *)(v41 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            v13 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_42;
            if (v13 >= v40)
              goto LABEL_33;
            v24 = *(_QWORD *)(v41 + 8 * v13);
            ++v25;
            if (v24)
              goto LABEL_30;
          }
        }
        v13 = v25;
      }
    }
LABEL_30:
    v10 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v13 << 6);
LABEL_31:
    v30 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v21);
    v32 = *v30;
    v31 = v30[1];
    v33 = *(_QWORD *)(v5 + 56) + 40 * v21;
    v34 = *(_DWORD *)(v33 + 16);
    v43 = *(_OWORD *)(v33 + 24);
    v44 = *(_OWORD *)v33;
    if ((v42 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v35 = (id)v44;
      v36 = *((id *)&v44 + 1);
      v37 = (id)v43;
    }
    sub_2376F2F40();
    sub_2376F2BEC();
    result = sub_2376F2F58();
    v14 = -1 << *(_BYTE *)(v7 + 32);
    v15 = result & ~v14;
    v16 = v15 >> 6;
    if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v26 = 0;
      v27 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v28 = v16 == v27;
        if (v16 == v27)
          v16 = 0;
        v26 |= v28;
        v29 = *(_QWORD *)(v11 + 8 * v16);
      }
      while (v29 == -1);
      v17 = __clz(__rbit64(~v29)) + (v16 << 6);
    }
    *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    v18 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v17);
    *v18 = v32;
    v18[1] = v31;
    v19 = *(_QWORD *)(v7 + 56) + 40 * v17;
    *(_OWORD *)v19 = v44;
    *(_DWORD *)(v19 + 16) = v34;
    *(_OWORD *)(v19 + 24) = v43;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v39;
  v23 = (_QWORD *)(v5 + 64);
  if ((v42 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v38 = 1 << *(_BYTE *)(v5 + 32);
  if (v38 >= 64)
    bzero(v23, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v38;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_2376EAF98(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t result;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
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
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256808EC8);
  v6 = sub_2376F2EB0();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v36 = v2;
  v37 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v11 = (unint64_t)(v8 + 63) >> 6;
  v12 = v6 + 64;
  result = swift_retain();
  v14 = 0;
  while (1)
  {
    if (v10)
    {
      v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
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
    if (v22 >= v11)
      break;
    v23 = (_QWORD *)(v5 + 64);
    v24 = *(_QWORD *)(v37 + 8 * v22);
    ++v14;
    if (!v24)
    {
      v14 = v22 + 1;
      if (v22 + 1 >= v11)
        goto LABEL_33;
      v24 = *(_QWORD *)(v37 + 8 * v14);
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v11)
        {
LABEL_33:
          swift_release();
          v3 = v36;
          if ((a2 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v24 = *(_QWORD *)(v37 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            v14 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_42;
            if (v14 >= v11)
              goto LABEL_33;
            v24 = *(_QWORD *)(v37 + 8 * v14);
            ++v25;
            if (v24)
              goto LABEL_30;
          }
        }
        v14 = v25;
      }
    }
LABEL_30:
    v10 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    v30 = 8 * v21;
    v31 = *(void **)(*(_QWORD *)(v5 + 48) + v30);
    v32 = *(void **)(*(_QWORD *)(v5 + 56) + v30);
    if ((a2 & 1) == 0)
    {
      v33 = v31;
      v34 = v32;
    }
    result = sub_2376F2D18();
    v15 = -1 << *(_BYTE *)(v7 + 32);
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
    v19 = 8 * v18;
    *(_QWORD *)(*(_QWORD *)(v7 + 48) + v19) = v31;
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + v19) = v32;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v36;
  v23 = (_QWORD *)(v5 + 64);
  if ((a2 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v35 = 1 << *(_BYTE *)(v5 + 32);
  if (v35 >= 64)
    bzero(v23, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v35;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

id sub_2376EB268()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id result;
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
  uint64_t v21;
  int v22;
  _QWORD *v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  void *v27;
  id v28;
  id v29;
  int64_t v30;
  unint64_t v31;
  int64_t v32;
  __int128 v33;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256808E88);
  v2 = *v0;
  v3 = sub_2376F2EA4();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (id)swift_release();
    *v1 = v4;
    return result;
  }
  result = (id)(v3 + 64);
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
    v30 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v30 >= v13)
      goto LABEL_26;
    v31 = *(_QWORD *)(v6 + 8 * v30);
    ++v9;
    if (!v31)
    {
      v9 = v30 + 1;
      if (v30 + 1 >= v13)
        goto LABEL_26;
      v31 = *(_QWORD *)(v6 + 8 * v9);
      if (!v31)
        break;
    }
LABEL_25:
    v12 = (v31 - 1) & v31;
    v15 = __clz(__rbit64(v31)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v18 = *v17;
    v19 = v17[1];
    v20 = 40 * v15;
    v21 = *(_QWORD *)(v2 + 56) + v20;
    v22 = *(_DWORD *)(v21 + 16);
    v23 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    v24 = *(_OWORD *)(v21 + 24);
    v33 = *(_OWORD *)v21;
    v25 = *(_OWORD *)v21;
    *v23 = v18;
    v23[1] = v19;
    v26 = *(_QWORD *)(v4 + 56) + v20;
    *(_OWORD *)v26 = v25;
    *(_DWORD *)(v26 + 16) = v22;
    *(_OWORD *)(v26 + 24) = v24;
    v27 = (void *)v24;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v28 = (id)v33;
    v29 = *((id *)&v33 + 1);
    result = v27;
  }
  v32 = v30 + 2;
  if (v32 >= v13)
    goto LABEL_26;
  v31 = *(_QWORD *)(v6 + 8 * v32);
  if (v31)
  {
    v9 = v32;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v32 + 1;
    if (__OFADD__(v32, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v31 = *(_QWORD *)(v6 + 8 * v9);
    ++v32;
    if (v31)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

id sub_2376EB470()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id result;
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
  void *v17;
  void *v18;
  id v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256808EC8);
  v2 = *v0;
  v3 = sub_2376F2EA4();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (id)swift_release();
    *v1 = v4;
    return result;
  }
  result = (id)(v3 + 64);
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
    v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13)
      goto LABEL_26;
    v21 = *(_QWORD *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      v9 = v20 + 1;
      if (v20 + 1 >= v13)
        goto LABEL_26;
      v21 = *(_QWORD *)(v6 + 8 * v9);
      if (!v21)
        break;
    }
LABEL_25:
    v12 = (v21 - 1) & v21;
    v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(void **)(*(_QWORD *)(v2 + 48) + v16);
    v18 = *(void **)(*(_QWORD *)(v2 + 56) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v16) = v18;
    v19 = v17;
    result = v18;
  }
  v22 = v20 + 2;
  if (v22 >= v13)
    goto LABEL_26;
  v21 = *(_QWORD *)(v6 + 8 * v22);
  if (v21)
  {
    v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v21 = *(_QWORD *)(v6 + 8 * v9);
    ++v22;
    if (v21)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

id sub_2376EB614(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  char *v4;
  char *v8;
  id v9;
  id v10;
  objc_super v12;
  uint64_t v13;

  swift_unknownObjectWeakInit();
  *(_QWORD *)&v4[OBJC_IVAR____TtC21CalendarUIKitInternal33CUIKIReminderEditorImplementation__requestPerformer] = 0;
  swift_unknownObjectWeakAssign();
  v8 = v4;
  v9 = objc_msgSend(a4, sel_impl);
  sub_2376F2D48();
  swift_unknownObjectRelease();
  type metadata accessor for PendingReminderTracker();
  swift_dynamicCast();
  *(_QWORD *)&v8[OBJC_IVAR____TtC21CalendarUIKitInternal33CUIKIReminderEditorImplementation_changeTracker] = v13;
  *(_QWORD *)&v8[OBJC_IVAR____TtC21CalendarUIKitInternal33CUIKIReminderEditorImplementation_eventStore] = a1;
  *(_QWORD *)&v8[OBJC_IVAR____TtC21CalendarUIKitInternal33CUIKIReminderEditorImplementation_alertDisplayer] = a2;
  v10 = a1;
  swift_unknownObjectRetain();

  v12.receiver = v8;
  v12.super_class = (Class)type metadata accessor for CUIKIReminderEditorImplementation();
  return objc_msgSendSuper2(&v12, sel_init);
}

id sub_2376EB728(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  void *v23;
  id v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  uint64_t v29;
  _QWORD v31[2];
  uint64_t v32;
  uint64_t v33;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256808F00);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)v31 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_2376F282C();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = objc_msgSend(a1, sel_uniqueID);
  if (!v9)
  {
    if (qword_2542B7768 != -1)
      swift_once();
    v19 = sub_2376F2BA4();
    __swift_project_value_buffer(v19, (uint64_t)qword_2542B77D0);
    v20 = sub_2376F2B8C();
    v21 = sub_2376F2CE8();
    if (os_log_type_enabled(v20, v21))
    {
      v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_2376DB000, v20, v21, "skipping event with nil uniqueID", v22, 2u);
      MEMORY[0x23B81AA70](v22, -1, -1);
    }

    return 0;
  }
  v10 = v9;
  v11 = sub_2376F2BE0();
  v13 = v12;

  sub_2376F2820();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    sub_2376E081C((uint64_t)v4, &qword_256808F00);
    if (qword_2542B7768 != -1)
      swift_once();
    v14 = sub_2376F2BA4();
    __swift_project_value_buffer(v14, (uint64_t)qword_2542B77D0);
    swift_bridgeObjectRetain();
    v15 = sub_2376F2B8C();
    v16 = sub_2376F2CE8();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = (uint8_t *)swift_slowAlloc();
      v18 = swift_slowAlloc();
      v33 = v18;
      *(_DWORD *)v17 = 136315138;
      swift_bridgeObjectRetain();
      v32 = sub_2376F0408(v11, v13, &v33);
      sub_2376F2D30();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2376DB000, v15, v16, "event ID %s is not a valid reminder ID", v17, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B81AA70](v18, -1, -1);
      MEMORY[0x23B81AA70](v17, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    return 0;
  }
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v4, v5);
  v23 = (void *)sub_2376F2808();
  v24 = objc_msgSend((id)objc_opt_self(), sel_objectIDWithURL_, v23);

  if (!v24)
  {
    if (qword_2542B7768 != -1)
      swift_once();
    v25 = sub_2376F2BA4();
    __swift_project_value_buffer(v25, (uint64_t)qword_2542B77D0);
    swift_bridgeObjectRetain();
    v26 = sub_2376F2B8C();
    v27 = sub_2376F2CE8();
    if (os_log_type_enabled(v26, v27))
    {
      v28 = (uint8_t *)swift_slowAlloc();
      v29 = swift_slowAlloc();
      v33 = v29;
      *(_DWORD *)v28 = 136315138;
      v31[1] = v28 + 4;
      swift_bridgeObjectRetain();
      v32 = sub_2376F0408(v11, v13, &v33);
      sub_2376F2D30();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2376DB000, v26, v27, "event ID %s is not a valid reminder ID", v28, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B81AA70](v29, -1, -1);
      MEMORY[0x23B81AA70](v28, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    return 0;
  }
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  swift_bridgeObjectRelease();
  return v24;
}

uint64_t sub_2376EBC30(unint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  unint64_t v9;
  id v10;
  unint64_t v12;
  uint64_t v13;

  v1 = a1;
  v13 = MEMORY[0x24BEE4AF8];
  if (a1 >> 62)
    goto LABEL_18;
  v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v2)
  {
    while (1)
    {
      v3 = 0;
      v4 = v1 & 0xC000000000000001;
      v5 = v1 & 0xFFFFFFFFFFFFFF8;
      v6 = *MEMORY[0x24BE13CC8];
      v12 = v1;
      while (v4)
      {
        v7 = (id)MEMORY[0x23B81A560](v3, v1);
LABEL_9:
        v8 = v7;
        v9 = v3 + 1;
        if (__OFADD__(v3, 1))
          goto LABEL_17;
        v10 = sub_2376EB728(v7);

        if (v10
          && objc_msgSend(v8, sel__hasChangesForKey_, v6)
          && (objc_msgSend(v8, sel_completed) & 1) != 0)
        {
          sub_2376F2E2C();
          sub_2376F2E50();
          v1 = v12;
          sub_2376F2E5C();
          sub_2376F2E38();
        }
        else
        {

        }
        ++v3;
        if (v9 == v2)
          return v13;
      }
      if (v3 < *(_QWORD *)(v5 + 16))
        break;
      __break(1u);
LABEL_17:
      __break(1u);
LABEL_18:
      v2 = sub_2376F2E98();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    v7 = *(id *)(v1 + 8 * v3 + 32);
    goto LABEL_9;
  }
  return MEMORY[0x24BEE4AF8];
}

uint64_t sub_2376EBDD8(unint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  unint64_t v9;
  id v10;
  unint64_t v12;
  uint64_t v13;

  v1 = a1;
  v13 = MEMORY[0x24BEE4AF8];
  if (a1 >> 62)
    goto LABEL_18;
  v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v2)
  {
    while (1)
    {
      v3 = 0;
      v4 = v1 & 0xC000000000000001;
      v5 = v1 & 0xFFFFFFFFFFFFFF8;
      v6 = *MEMORY[0x24BE13CC8];
      v12 = v1;
      while (v4)
      {
        v7 = (id)MEMORY[0x23B81A560](v3, v1);
LABEL_9:
        v8 = v7;
        v9 = v3 + 1;
        if (__OFADD__(v3, 1))
          goto LABEL_17;
        v10 = sub_2376EB728(v7);

        if (v10
          && objc_msgSend(v8, sel__hasChangesForKey_, v6)
          && (objc_msgSend(v8, sel_completed) & 1) == 0)
        {
          sub_2376F2E2C();
          sub_2376F2E50();
          v1 = v12;
          sub_2376F2E5C();
          sub_2376F2E38();
        }
        else
        {

        }
        ++v3;
        if (v9 == v2)
          return v13;
      }
      if (v3 < *(_QWORD *)(v5 + 16))
        break;
      __break(1u);
LABEL_17:
      __break(1u);
LABEL_18:
      v2 = sub_2376F2E98();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    v7 = *(id *)(v1 + 8 * v3 + 32);
    goto LABEL_9;
  }
  return MEMORY[0x24BEE4AF8];
}

unint64_t sub_2376EBF80()
{
  unint64_t result;

  result = qword_256808DF0;
  if (!qword_256808DF0)
  {
    result = MEMORY[0x23B81A9F8](&unk_2376F3958, &type metadata for CUIKIReminderEditorImplementation.AlertDisplayerAdapter);
    atomic_store(result, &qword_256808DF0);
  }
  return result;
}

uint64_t sub_2376EBFC4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v1 = sub_2376F27D8();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (((*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8;
  swift_unknownObjectRelease();

  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_2376EC07C(uint64_t a1)
{
  _QWORD *v1;
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

  v4 = *(_QWORD *)(sub_2376F27D8() - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = (*(_QWORD *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8;
  v7 = v1[2];
  v8 = v1[3];
  v9 = v1[4];
  v10 = v1[5];
  v11 = (uint64_t)v1 + v5;
  v12 = *(_QWORD *)((char *)v1 + v6);
  v13 = *(_QWORD *)((char *)v1 + ((v6 + 15) & 0xFFFFFFFFFFFFFFF8));
  v14 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v14;
  *v14 = v2;
  v14[1] = sub_2376E880C;
  return sub_2376E378C(a1, v7, v8, v9, v10, v11, v12, v13);
}

uint64_t sub_2376EC15C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2376EC180(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_2376ECC9C;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_256808E08 + dword_256808E08))(a1, v4);
}

uint64_t sub_2376EC1F0()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2376EC234(uint64_t a1)
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
  v11[1] = sub_2376ECC9C;
  return sub_2376E6330(a1, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t type metadata accessor for CUIKIReminderEditorImplementation()
{
  return objc_opt_self();
}

uint64_t sub_2376EC2E8@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;

  v3 = (_QWORD *)(*a1 + OBJC_IVAR____TtC21CalendarUIKitInternal33CUIKIReminderEditorImplementation_alertDisplayer);
  swift_beginAccess();
  *a2 = *v3;
  return swift_unknownObjectRetain();
}

uint64_t method lookup function for CUIKIReminderEditorImplementation()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CUIKIReminderEditorImplementation.__allocating_init(eventStore:alertDisplayer:undoManager:changeTracker:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 168))();
}

uint64_t dispatch thunk of CUIKIReminderEditorImplementation.alertDisplayer.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of CUIKIReminderEditorImplementation.alertDisplayer.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of CUIKIReminderEditorImplementation.alertDisplayer.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of CUIKIReminderEditorImplementation.saveChanges(toEvents:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of CUIKIReminderEditorImplementation.delete(_:completionHandler:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xE8))();
}

ValueMetadata *type metadata accessor for CUIKIReminderEditorImplementation.AlertDisplayerAdapter()
{
  return &type metadata for CUIKIReminderEditorImplementation.AlertDisplayerAdapter;
}

void sub_2376EC400(uint64_t a1)
{
  uint64_t v1;

  sub_2376E8044(a1, *(_QWORD *)(v1 + 24), *(void **)(v1 + 32), *(_QWORD *)(v1 + 16));
}

uint64_t sub_2376EC40C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v1 = *(_QWORD *)(v0 + 16);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256808E70);
  v2 = sub_2376F2C94();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v5 = *(_QWORD *)(v1 - 8);
  v6 = (v4 + *(_QWORD *)(v3 + 64) + *(unsigned __int8 *)(v5 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  (*(void (**)(unint64_t, uint64_t))(v3 + 8))(v0 + v4, v2);
  (*(void (**)(unint64_t, uint64_t))(v5 + 8))(v0 + v6, v1);
  return swift_deallocObject();
}

uint64_t sub_2376EC4C0()
{
  uint64_t v0;
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256808E70);
  v1 = sub_2376F2C94();
  return sub_2376E8690(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)));
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

uint64_t sub_2376EC54C()
{
  uint64_t v0;
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256808E70);
  v1 = sub_2376F2C94();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t sub_2376EC5CC()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256808E70);
  sub_2376F2C94();
  return sub_2376E8724();
}

unint64_t sub_2376EC624()
{
  unint64_t result;

  result = qword_256808E80;
  if (!qword_256808E80)
  {
    result = MEMORY[0x23B81A9F8](&unk_2376F3A08, &type metadata for CUIKIReminderEditorImplementation.AlertDisplayerAdapter.CUIKReminderEditorAlertErrors);
    atomic_store(result, (unint64_t *)&qword_256808E80);
  }
  return result;
}

uint64_t sub_2376EC668(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 16))(a2, a1);
  return a2;
}

uint64_t sub_2376EC6A4(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 8))();
  return a1;
}

uint64_t sub_2376EC6D8(unint64_t a1)
{
  unint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void **v7;
  void *v8;
  id v9;
  uint64_t v10;

  v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_2376F2E98();
    swift_bridgeObjectRelease();
  }
  sub_2376E121C(0, &qword_256808E38);
  sub_2376EC830();
  result = sub_2376F2CD0();
  v10 = result;
  if (v2)
  {
    swift_bridgeObjectRetain();
    v4 = sub_2376F2E98();
    result = swift_bridgeObjectRelease();
    if (!v4)
      return v10;
  }
  else
  {
    v4 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v4)
      return v10;
  }
  if (v4 >= 1)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (i = 0; i != v4; ++i)
      {
        v6 = (void *)MEMORY[0x23B81A560](i, a1);
        sub_2376E8F0C(&v9, v6);

      }
    }
    else
    {
      v7 = (void **)(a1 + 32);
      do
      {
        v8 = *v7++;
        sub_2376E8F0C(&v9, v8);

        --v4;
      }
      while (v4);
    }
    return v10;
  }
  __break(1u);
  return result;
}

unint64_t sub_2376EC830()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256808E90;
  if (!qword_256808E90)
  {
    v1 = sub_2376E121C(255, &qword_256808E38);
    result = MEMORY[0x23B81A9F8](MEMORY[0x24BEE5BD8], v1);
    atomic_store(result, (unint64_t *)&qword_256808E90);
  }
  return result;
}

uint64_t sub_2376EC888(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(char *, uint64_t, uint64_t);
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = sub_2376F2994();
  sub_2376EC9C0(&qword_256808EA8, MEMORY[0x24BE7E108]);
  result = sub_2376F2CD0();
  v16 = result;
  if (v2)
  {
    v5 = *(_QWORD *)(v3 - 8);
    v6 = a1 + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
    v7 = *(_QWORD *)(v5 + 64);
    v14 = *(_QWORD *)(v5 + 72);
    v15 = v5;
    v8 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
    do
    {
      v9 = MEMORY[0x24BDAC7A8](result);
      v10 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
      MEMORY[0x24BDAC7A8](v9);
      v12 = (char *)&v13 - v11;
      v8((char *)&v13 - v11, v6, v3);
      sub_2376E91A8((uint64_t)v10, v12);
      result = (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v10, v3);
      v6 += v14;
      --v2;
    }
    while (v2);
    return v16;
  }
  return result;
}

uint64_t sub_2376EC9C0(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = sub_2376F2994();
    result = MEMORY[0x23B81A9F8](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2376ECA00()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void sub_2376ECA24(char a1, uint64_t a2)
{
  uint64_t v2;

  sub_2376E7228(a1, a2, *(_QWORD *)(v2 + 16));
}

uint64_t sub_2376ECA2C()
{
  return swift_release();
}

uint64_t sub_2376ECA34(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

_OWORD *sub_2376ECA78(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_2376ECA88()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2376ECAC4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  _QWORD *v10;

  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(_QWORD *)(v1 + 24);
  v6 = *(_QWORD *)(v1 + 32);
  v7 = *(_QWORD *)(v1 + 40);
  v8 = *(_BYTE *)(v1 + 48);
  v9 = *(_QWORD *)(v1 + 56);
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v10;
  *v10 = v2;
  v10[1] = sub_2376E880C;
  return sub_2376E45B4(a1, v4, v5, v6, v7, v8, v9);
}

uint64_t getEnumTagSinglePayload for CUIKIReminderEditorImplementation.AlertDisplayerAdapter.CUIKReminderEditorAlertErrors(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for CUIKIReminderEditorImplementation.AlertDisplayerAdapter.CUIKReminderEditorAlertErrors(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_2376ECBEC + 4 * byte_2376F38F0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_2376ECC0C + 4 * byte_2376F38F5[v4]))();
}

_BYTE *sub_2376ECBEC(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_2376ECC0C(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2376ECC14(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2376ECC1C(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2376ECC24(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2376ECC2C(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_2376ECC38()
{
  return 0;
}

ValueMetadata *type metadata accessor for CUIKIReminderEditorImplementation.AlertDisplayerAdapter.CUIKReminderEditorAlertErrors()
{
  return &type metadata for CUIKIReminderEditorImplementation.AlertDisplayerAdapter.CUIKReminderEditorAlertErrors;
}

unint64_t sub_2376ECC58()
{
  unint64_t result;

  result = qword_256808F10;
  if (!qword_256808F10)
  {
    result = MEMORY[0x23B81A9F8](&unk_2376F39E0, &type metadata for CUIKIReminderEditorImplementation.AlertDisplayerAdapter.CUIKReminderEditorAlertErrors);
    atomic_store(result, (unint64_t *)&qword_256808F10);
  }
  return result;
}

char *PendingReminderTracker.__allocating_init(eventStore:)(void *a1)
{
  objc_class *v1;
  char *v3;
  uint64_t v4;
  char *v5;
  id v6;
  id v7;
  void *v8;
  char *v9;
  id v10;
  objc_super v12;

  v3 = (char *)objc_allocWithZone(v1);
  v4 = OBJC_IVAR____TtC21CalendarUIKitInternal22PendingReminderTracker_trackedEvents;
  v5 = v3;
  *(_QWORD *)&v3[v4] = sub_2376E4450(MEMORY[0x24BEE4AF8]);
  *(_QWORD *)&v5[OBJC_IVAR____TtC21CalendarUIKitInternal22PendingReminderTracker_eventStore] = a1;
  v6 = a1;

  v12.receiver = v5;
  v12.super_class = v1;
  v7 = objc_msgSendSuper2(&v12, sel_init);
  v8 = (void *)objc_opt_self();
  v9 = (char *)v7;
  v10 = objc_msgSend(v8, sel_defaultCenter);
  objc_msgSend(v10, sel_addObserver_selector_name_object_, v9, sel_eventStoreDidChange_, *MEMORY[0x24BDC7420], *(_QWORD *)&v9[OBJC_IVAR____TtC21CalendarUIKitInternal22PendingReminderTracker_eventStore]);

  return v9;
}

char *PendingReminderTracker.init(eventStore:)(void *a1)
{
  char *v1;
  uint64_t v3;
  char *v4;
  id v5;
  id v6;
  void *v7;
  char *v8;
  id v9;
  objc_super v11;

  v3 = OBJC_IVAR____TtC21CalendarUIKitInternal22PendingReminderTracker_trackedEvents;
  v4 = v1;
  *(_QWORD *)&v1[v3] = sub_2376E4450(MEMORY[0x24BEE4AF8]);
  *(_QWORD *)&v4[OBJC_IVAR____TtC21CalendarUIKitInternal22PendingReminderTracker_eventStore] = a1;
  v5 = a1;

  v11.receiver = v4;
  v11.super_class = (Class)type metadata accessor for PendingReminderTracker();
  v6 = objc_msgSendSuper2(&v11, sel_init);
  v7 = (void *)objc_opt_self();
  v8 = (char *)v6;
  v9 = objc_msgSend(v7, sel_defaultCenter);
  objc_msgSend(v9, sel_addObserver_selector_name_object_, v8, sel_eventStoreDidChange_, *MEMORY[0x24BDC7420], *(_QWORD *)&v8[OBJC_IVAR____TtC21CalendarUIKitInternal22PendingReminderTracker_eventStore]);

  return v8;
}

uint64_t type metadata accessor for PendingReminderTracker()
{
  return objc_opt_self();
}

id sub_2376ECEE0(void *a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  id result;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;

  v3 = v2;
  sub_2376ED9DC(a1, a2, 1, v3);
  result = objc_msgSend(a1, sel_objectID);
  if (result)
  {
    v6 = result;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256808E20);
    v7 = swift_allocObject();
    *(_OWORD *)(v7 + 16) = xmmword_2376F38D0;
    *(_QWORD *)(v7 + 32) = v6;
    v9 = v7;
    sub_2376F2C28();
    v8 = v6;
    sub_2376EF230(v9);

    return (id)swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_2376ED070(void *a1, int a2, void *a3)
{
  uint64_t v3;
  id v6;
  id v7;

  v6 = a1;
  v7 = a3;
  sub_2376F1744(v6, a2, 1, v3, v6, v7);

}

void sub_2376ED0D4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;

  if (qword_2542B7768 != -1)
    swift_once();
  v6 = sub_2376F2BA4();
  __swift_project_value_buffer(v6, (uint64_t)qword_2542B77D0);
  v7 = a2;
  v8 = sub_2376F2B8C();
  v9 = sub_2376F2CDC();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc();
    v11 = swift_slowAlloc();
    v19 = v11;
    *(_DWORD *)v10 = 136315138;
    v12 = objc_msgSend(v7, sel_uniqueID);
    if (v12)
    {
      v13 = v12;
      v14 = sub_2376F2BE0();
      v16 = v15;

    }
    else
    {
      v14 = 0;
      v16 = 0xE000000000000000;
    }
    sub_2376F0408(v14, v16, &v19);
    sub_2376F2D30();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2376DB000, v8, v9, "Saving optimistic result for %s", v10, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B81AA70](v11, -1, -1);
    MEMORY[0x23B81AA70](v10, -1, -1);

  }
  else
  {

  }
  v17 = *(void **)(a1 + 24);
  v18 = a3;

  *(_QWORD *)(a1 + 24) = a3;
}

uint64_t sub_2376ED330(void *a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  __int128 v5;
  __int128 v6;
  uint64_t v7;

  v7 = 0;
  v5 = 0u;
  v6 = 0u;
  sub_2376EE4AC(a1, 0, 0, v1, (uint64_t)&v5);
  v2 = (void *)v5;
  if (!(_QWORD)v5)
    return 0;
  v3 = *((_QWORD *)&v6 + 1);

  swift_bridgeObjectRelease();
  return v3;
}

void sub_2376ED43C(void *a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  id v13;
  unint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  _QWORD *v22;
  id v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  uint64_t v28;
  id v29;
  id v30[3];
  _QWORD v31[5];
  _QWORD v32[5];
  _OWORD v33[2];
  unint64_t v34;
  __int128 v35;
  __int128 v36;
  unint64_t v37;

  v3 = v2;
  v6 = objc_msgSend(a1, sel_originalItem);
  if (v6)
  {
    v7 = v6;
    v8 = objc_msgSend(v6, sel_uniqueID);
    if (v8)
    {
      v9 = v8;
      v10 = sub_2376F2BE0();
      v12 = v11;

      goto LABEL_6;
    }

  }
  else
  {
    v13 = objc_msgSend(a1, sel_uniqueID);
    if (v13)
    {
      v7 = v13;
      v10 = sub_2376F2BE0();
      v12 = v14;
LABEL_6:

      v15 = (uint64_t *)(v3 + OBJC_IVAR____TtC21CalendarUIKitInternal22PendingReminderTracker_trackedEvents);
      swift_beginAccess();
      v16 = *v15;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_2376ED8F0(v10, v12, v16, v31);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_2376F26C8((uint64_t)v31, (uint64_t)v33, &qword_256808F40);
      if (*(_QWORD *)&v33[0])
      {
        v35 = v33[0];
        v36 = v33[1];
        v37 = v34;
        swift_beginAccess();
        sub_2376F0A48(v10, v12, (uint64_t)v32);
        swift_endAccess();
        sub_2376F226C((uint64_t)v32);
        swift_bridgeObjectRelease();
        v17 = (void *)v35;
        sub_2376F1070((void *)v35, v37, a2 & 1);

        sub_2376F26C8((uint64_t)&v36 + 8, (uint64_t)v30, &qword_256808F48);
        sub_2376F22E0(v30);
        swift_bridgeObjectRelease();
      }
      else
      {
        if (qword_256808BF0 != -1)
          swift_once();
        v24 = sub_2376F2BA4();
        __swift_project_value_buffer(v24, (uint64_t)qword_256808F68);
        swift_bridgeObjectRetain();
        v25 = sub_2376F2B8C();
        v26 = sub_2376F2CF4();
        if (os_log_type_enabled(v25, v26))
        {
          v27 = (uint8_t *)swift_slowAlloc();
          v28 = swift_slowAlloc();
          *(_QWORD *)&v35 = v28;
          *(_DWORD *)v27 = 136446210;
          swift_bridgeObjectRetain();
          v32[0] = sub_2376F0408(v10, v12, (uint64_t *)&v35);
          sub_2376F2D30();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_2376DB000, v25, v26, "Ignoring attempt to reset event not tracked with id %{public}s", v27, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x23B81AA70](v28, -1, -1);
          MEMORY[0x23B81AA70](v27, -1, -1);

        }
        else
        {

          swift_bridgeObjectRelease_n();
        }
      }
      return;
    }
  }
  if (qword_2542B7768 != -1)
    swift_once();
  v18 = sub_2376F2BA4();
  __swift_project_value_buffer(v18, (uint64_t)qword_2542B77D0);
  v29 = a1;
  v19 = sub_2376F2B8C();
  v20 = sub_2376F2CE8();
  if (os_log_type_enabled(v19, v20))
  {
    v21 = (uint8_t *)swift_slowAlloc();
    v22 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v21 = 138412290;
    *(_QWORD *)&v35 = v29;
    v23 = v29;
    sub_2376F2D30();
    *v22 = v29;

    _os_log_impl(&dword_2376DB000, v19, v20, "Ignoring attempt to reset event with no uniqueID (%@)", v21, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256808E18);
    swift_arrayDestroy();
    MEMORY[0x23B81AA70](v22, -1, -1);
    MEMORY[0x23B81AA70](v21, -1, -1);

  }
  else
  {

  }
}

unint64_t sub_2376ED8F0@<X0>(unint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  char v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;

  if (*(_QWORD *)(a3 + 16) && (result = sub_2376E8B8C(result, a2), (v6 & 1) != 0))
  {
    v7 = *(_QWORD *)(a3 + 56) + 40 * result;
    v8 = *(void **)v7;
    v9 = *(void **)(v7 + 8);
    v10 = *(unsigned int *)(v7 + 16);
    v12 = *(void **)(v7 + 24);
    v11 = *(_QWORD *)(v7 + 32);
    swift_bridgeObjectRetain();
    v13 = v8;
    v14 = v9;
    result = v12;
  }
  else
  {
    v8 = 0;
    v9 = 0;
    v10 = 0;
    v12 = 0;
    v11 = 0;
  }
  *a4 = v8;
  a4[1] = v9;
  a4[2] = v10;
  a4[3] = v12;
  a4[4] = v11;
  return result;
}

void sub_2376ED9DC(void *a1, int a2, char a3, uint64_t a4)
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  unint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  NSObject *v32;
  os_log_type_t v33;
  uint8_t *v34;
  _QWORD *v35;
  id v36;
  _QWORD *v37;
  id v38;
  unint64_t v39;
  uint64_t v40;
  id v41;
  id v42;
  id v43;
  uint64_t v44;
  NSObject *v45;
  os_log_type_t v46;
  uint8_t *v47;
  uint64_t v48;
  id v49;
  id v50;
  id v51;
  uint64_t v52;
  NSObject *v53;
  uint64_t v54;
  uint64_t v55;
  id v56;
  os_log_type_t v57;
  _QWORD *v58;
  id v59;
  id v60;
  uint64_t v61;
  id v62;
  id v63;
  id v64;
  char isUniquelyReferenced_nonNull_native;
  uint8_t *buf;
  uint64_t v67;
  uint64_t v68;
  NSObject *log;
  NSObject *loga;
  os_log_type_t type[8];
  os_log_type_t typea;
  uint64_t v73;
  int v74;
  id v75;
  id v76;
  uint64_t v77;
  __int128 v78;
  __int128 v79;
  unint64_t v80;
  _QWORD v81[5];
  _QWORD v82[5];
  _QWORD v83[5];
  _QWORD v84[5];
  __int128 v85;
  __int128 v86;
  unint64_t v87;
  id v88;
  _BYTE v89[16];

  v8 = objc_msgSend(a1, sel_originalItem);
  v9 = v8;
  if (v8)
  {
    v10 = objc_msgSend(v8, sel_uniqueID);
    if (v10)
    {
      v11 = v10;
      v74 = a2;
      v12 = sub_2376F2BE0();
      v14 = v13;

      v15 = v9;
      goto LABEL_6;
    }

LABEL_12:
    if (qword_2542B7768 != -1)
      swift_once();
    v31 = sub_2376F2BA4();
    __swift_project_value_buffer(v31, (uint64_t)qword_2542B77D0);
    v76 = a1;
    v32 = sub_2376F2B8C();
    v33 = sub_2376F2CE8();
    if (!os_log_type_enabled(v32, v33))
    {

      return;
    }
    v34 = (uint8_t *)swift_slowAlloc();
    v35 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v34 = 138412290;
    *(_QWORD *)&v85 = v76;
    v36 = v76;
    sub_2376F2D30();
    *v35 = v76;

    _os_log_impl(&dword_2376DB000, v32, v33, "Ignoring pending event with no uniqueID (%@)", v34, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256808E18);
    swift_arrayDestroy();
    v37 = v35;
LABEL_16:
    MEMORY[0x23B81AA70](v37, -1, -1);
    MEMORY[0x23B81AA70](v34, -1, -1);

    return;
  }
  v16 = objc_msgSend(a1, sel_uniqueID);
  if (!v16)
    goto LABEL_12;
  v15 = v16;
  v74 = a2;
  v12 = sub_2376F2BE0();
  v14 = v17;
LABEL_6:

  v18 = (uint64_t *)(a4 + OBJC_IVAR____TtC21CalendarUIKitInternal22PendingReminderTracker_trackedEvents);
  swift_beginAccess();
  v19 = *v18;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v73 = v12;
  sub_2376ED8F0(v12, v14, v19, v81);
  v20 = (void *)v81[0];
  v21 = (void *)v81[1];
  v22 = v81[2];
  v23 = (void *)v81[3];
  v24 = (void *)v14;
  v25 = v81[4];
  v75 = v24;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2376F26C8((uint64_t)v81, (uint64_t)v84, &qword_256808F40);
  if (v84[0])
  {
    *(_QWORD *)&v78 = v20;
    *((_QWORD *)&v78 + 1) = v21;
    *((_QWORD *)&v79 + 1) = v23;
    v80 = v25;
    if ((a3 & 1) != 0)
    {
      v26 = v22;
      v27 = a1;
      if ((_DWORD)v22)
        goto LABEL_9;
      goto LABEL_20;
    }

    swift_bridgeObjectRelease();
LABEL_46:
    swift_bridgeObjectRelease();
    return;
  }
  if ((a3 & 1) == 0)
    goto LABEL_46;
  v27 = a1;
  v38 = a1;
  sub_2376F0ED0(v38, v82);
  v20 = (void *)v82[0];
  v21 = (void *)v82[1];
  v26 = v82[2];
  v23 = (void *)v82[3];
  v39 = v82[4];
  sub_2376F26C8((uint64_t)v82, (uint64_t)v83, &qword_256808F40);
  if (v83[0])
  {
    *(_QWORD *)&v78 = v20;
    *((_QWORD *)&v78 + 1) = v21;
    *((_QWORD *)&v79 + 1) = v23;
    v80 = v39;
    if ((_DWORD)v26)
    {
LABEL_9:
      sub_2376F2680(v20, v21, v26, v23);
      if ((_DWORD)v26 == v74)
      {
        swift_bridgeObjectRetain();
        v28 = v20;
        v29 = v21;
        v30 = v23;
      }
      else
      {
        v48 = qword_2542B7768;
        v49 = v20;
        v50 = v21;
        v51 = v23;
        swift_bridgeObjectRetain();
        if (v48 != -1)
          swift_once();
        v52 = sub_2376F2BA4();
        __swift_project_value_buffer(v52, (uint64_t)qword_2542B77D0);
        swift_bridgeObjectRetain_n();
        v53 = sub_2376F2B8C();
        typea = sub_2376F2CDC();
        if (os_log_type_enabled(v53, typea))
        {
          loga = v53;
          v54 = swift_slowAlloc();
          v68 = swift_slowAlloc();
          *(_QWORD *)&v85 = v68;
          *(_DWORD *)v54 = 67109634;
          swift_beginAccess();
          sub_2376F2D30();
          *(_WORD *)(v54 + 8) = 1024;
          sub_2376F2D30();
          *(_WORD *)(v54 + 14) = 2080;
          swift_bridgeObjectRetain();
          sub_2376F0408(v73, (unint64_t)v75, (uint64_t *)&v85);
          sub_2376F2D30();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_2376DB000, loga, typea, "Updating tracked sequence number (%d->%d) for %s", (uint8_t *)v54, 0x18u);
          swift_arrayDestroy();
          MEMORY[0x23B81AA70](v68, -1, -1);
          MEMORY[0x23B81AA70](v54, -1, -1);

        }
        else
        {

          swift_bridgeObjectRelease_n();
        }
      }
LABEL_37:
      swift_beginAccess();
      LODWORD(v79) = v74;
      if (v9)
      {
        if (v80)
        {
          swift_bridgeObjectRetain();
          if ((sub_2376EF0AC((uint64_t)v27, v80) & 1) == 0)
          {
            *(_QWORD *)&v85 = v80;
            v60 = v27;
            MEMORY[0x23B81A350]();
            if (*(_QWORD *)((v85 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v85 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
              sub_2376F2C40();
            sub_2376F2C58();
            sub_2376F2C28();
            v80 = v85;
          }
        }
        else
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_256808E20);
          v61 = swift_allocObject();
          *(_OWORD *)(v61 + 16) = xmmword_2376F38D0;
          *(_QWORD *)(v61 + 32) = v27;
          *(_QWORD *)&v85 = v61;
          sub_2376F2C28();
          v80 = v85;
          v62 = v27;
        }
        swift_bridgeObjectRelease();
      }
      v85 = v78;
      v86 = v79;
      v87 = v80;
      sub_2376F26C8((uint64_t)&v86 + 8, (uint64_t)&v88, &qword_256808F48);
      sub_2376F26C8((uint64_t)&v87, (uint64_t)v89, &qword_256808F58);
      swift_beginAccess();
      v63 = (id)v78;
      v64 = *((id *)&v78 + 1);
      sub_2376F270C(&v88);
      sub_2376F2734((uint64_t)v89);
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v77 = *v18;
      *v18 = 0x8000000000000000;
      sub_2376F0D3C((uint64_t)&v85, v73, (uint64_t)v75, isUniquelyReferenced_nonNull_native);
      *v18 = v77;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_endAccess();
      sub_2376F229C(v20, v21, v26, v23);

      swift_bridgeObjectRelease();
      goto LABEL_46;
    }
LABEL_20:
    *(_QWORD *)type = v27;
    sub_2376F2680(v20, v21, v26, v23);
    v40 = qword_2542B7768;
    v41 = v20;
    v42 = v21;
    v43 = v23;
    swift_bridgeObjectRetain();
    if (v40 != -1)
      swift_once();
    v44 = sub_2376F2BA4();
    __swift_project_value_buffer(v44, (uint64_t)qword_2542B77D0);
    swift_bridgeObjectRetain_n();
    v45 = sub_2376F2B8C();
    v46 = sub_2376F2CDC();
    log = v45;
    if (os_log_type_enabled(v45, v46))
    {
      v47 = (uint8_t *)swift_slowAlloc();
      v67 = swift_slowAlloc();
      *(_QWORD *)&v85 = v67;
      buf = v47;
      *(_DWORD *)v47 = 136446210;
      swift_bridgeObjectRetain();
      sub_2376F0408(v73, (unint64_t)v75, (uint64_t *)&v85);
      v27 = *(void **)type;
      sub_2376F2D30();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2376DB000, log, v46, "Now tracking pending reminder with id %{public}s", buf, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B81AA70](v67, -1, -1);
      MEMORY[0x23B81AA70](buf, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
      v27 = *(void **)type;
    }
    goto LABEL_37;
  }
  swift_bridgeObjectRelease();
  if (qword_2542B7768 != -1)
    swift_once();
  v55 = sub_2376F2BA4();
  __swift_project_value_buffer(v55, (uint64_t)qword_2542B77D0);
  v56 = v38;
  v32 = sub_2376F2B8C();
  v57 = sub_2376F2CE8();
  if (os_log_type_enabled(v32, v57))
  {
    v34 = (uint8_t *)swift_slowAlloc();
    v58 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v34 = 138412290;
    *(_QWORD *)&v85 = v56;
    v59 = v56;
    sub_2376F2D30();
    *v58 = v56;

    _os_log_impl(&dword_2376DB000, v32, v57, "Couldn't create tracked event info for event %@", v34, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256808E18);
    swift_arrayDestroy();
    v37 = v58;
    goto LABEL_16;
  }

}

void sub_2376EE4AC(void *a1, int a2, char a3, uint64_t a4, uint64_t a5)
{
  id v10;
  void *v11;
  id v12;
  void *v13;
  char v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  id v19;
  unint64_t v20;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  unint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  os_log_type_t v33;
  uint8_t *v34;
  _QWORD *v35;
  id v36;
  _QWORD *v37;
  id v38;
  unint64_t v39;
  int v40;
  id v41;
  id v42;
  id v43;
  uint64_t v44;
  void *v45;
  id v46;
  uint64_t v47;
  id v48;
  id v49;
  id v50;
  uint64_t v51;
  NSObject *v52;
  os_log_type_t v53;
  uint8_t *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  id v58;
  id v59;
  id v60;
  uint64_t v61;
  NSObject *v62;
  os_log_type_t v63;
  uint64_t v64;
  uint64_t v65;
  id v66;
  os_log_type_t v67;
  _QWORD *v68;
  id v69;
  id v70;
  uint64_t v71;
  id v72;
  void *v73;
  void *v74;
  uint64_t v75;
  id v76;
  id v77;
  id v78;
  id v79;
  char isUniquelyReferenced_nonNull_native;
  os_log_type_t v81;
  os_log_type_t type;
  uint64_t typea;
  void *v84;
  uint64_t *v85;
  int v86;
  id v87;
  void *v88;
  void *v89;
  uint64_t v90;
  void *v91;
  uint64_t v92;
  char v93;
  void *v94;
  void *v95;
  uint64_t v96;
  uint64_t v97;
  id v98;
  id v99;
  uint64_t v100;
  __int128 v101;
  __int128 v102;
  unint64_t v103;
  _QWORD v104[5];
  _QWORD v105[5];
  uint64_t v106[5];
  uint64_t v107[5];
  __int128 v108;
  __int128 v109;
  unint64_t v110;
  char v111[8];
  id v112[3];

  v10 = objc_msgSend(a1, sel_originalItem);
  v11 = v10;
  if (v10)
  {
    v12 = objc_msgSend(v10, sel_uniqueID);
    if (v12)
    {
      v13 = v12;
      v86 = a2;
      v97 = a5;
      v14 = a3;
      v15 = sub_2376F2BE0();
      v17 = v16;

      v94 = v11;
      v18 = v11;
      goto LABEL_6;
    }

LABEL_10:
    if (qword_2542B7768 != -1)
      swift_once();
    v31 = sub_2376F2BA4();
    __swift_project_value_buffer(v31, (uint64_t)qword_2542B77D0);
    v99 = a1;
    v32 = sub_2376F2B8C();
    v33 = sub_2376F2CE8();
    if (!os_log_type_enabled(v32, v33))
    {

      return;
    }
    v34 = (uint8_t *)swift_slowAlloc();
    v35 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v34 = 138412290;
    *(_QWORD *)&v108 = v99;
    v36 = v99;
    sub_2376F2D30();
    *v35 = v99;

    _os_log_impl(&dword_2376DB000, v32, v33, "Ignoring pending event with no uniqueID (%@)", v34, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256808E18);
    swift_arrayDestroy();
    v37 = v35;
    goto LABEL_14;
  }
  v19 = objc_msgSend(a1, sel_uniqueID);
  if (!v19)
    goto LABEL_10;
  v18 = v19;
  v94 = 0;
  v86 = a2;
  v97 = a5;
  v14 = a3;
  v15 = sub_2376F2BE0();
  v17 = v20;
LABEL_6:

  v21 = (uint64_t *)(a4 + OBJC_IVAR____TtC21CalendarUIKitInternal22PendingReminderTracker_trackedEvents);
  swift_beginAccess();
  v22 = v21;
  v23 = *v21;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v96 = v15;
  sub_2376ED8F0(v15, v17, v23, v104);
  v25 = (void *)v104[0];
  v24 = (void *)v104[1];
  v26 = v104[2];
  v27 = (void *)v104[3];
  v28 = v104[4];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2376F26C8((uint64_t)v104, (uint64_t)v107, &qword_256808F40);
  if (!v107[0])
  {
    if ((v14 & 1) == 0)
    {
      swift_bridgeObjectRelease();
      return;
    }
    v93 = v14;
    v38 = a1;
    sub_2376F0ED0(v38, v105);
    v25 = (void *)v105[0];
    v29 = (void *)v105[1];
    v26 = v105[2];
    v27 = (void *)v105[3];
    v39 = v105[4];
    sub_2376F26C8((uint64_t)v105, (uint64_t)v106, &qword_256808F40);
    if (v106[0])
    {
      v84 = a1;
      *(_QWORD *)&v101 = v25;
      *((_QWORD *)&v101 + 1) = v29;
      v98 = v29;
      v30 = v25;
      *((_QWORD *)&v102 + 1) = v27;
      v103 = v39;
LABEL_18:
      v90 = v26;
      v91 = v27;
      v85 = v22;
      v88 = v25;
      v89 = v29;
      if ((_DWORD)v26)
      {
        sub_2376F2680(v25, v29, v26, v27);
        v40 = v86;
        if ((_DWORD)v26 == v86)
        {
          swift_bridgeObjectRetain();
          v41 = v30;
          v42 = v98;
          v43 = v27;
          v44 = v97;
          v45 = v94;
          goto LABEL_39;
        }
        v57 = qword_2542B7768;
        v58 = v30;
        v59 = v98;
        v60 = v27;
        swift_bridgeObjectRetain();
        v44 = v97;
        v45 = v94;
        if (v57 != -1)
          swift_once();
        v61 = sub_2376F2BA4();
        __swift_project_value_buffer(v61, (uint64_t)qword_2542B77D0);
        swift_bridgeObjectRetain_n();
        v62 = sub_2376F2B8C();
        v63 = sub_2376F2CDC();
        if (os_log_type_enabled(v62, v63))
        {
          v81 = v63;
          v64 = swift_slowAlloc();
          typea = swift_slowAlloc();
          *(_QWORD *)&v108 = typea;
          *(_DWORD *)v64 = 67109634;
          swift_beginAccess();
          sub_2376F2D30();
          *(_WORD *)(v64 + 8) = 1024;
          sub_2376F2D30();
          *(_WORD *)(v64 + 14) = 2080;
          swift_bridgeObjectRetain();
          sub_2376F0408(v96, v17, (uint64_t *)&v108);
          sub_2376F2D30();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_2376DB000, v62, v81, "Updating tracked sequence number (%d->%d) for %s", (uint8_t *)v64, 0x18u);
          swift_arrayDestroy();
          MEMORY[0x23B81AA70](typea, -1, -1);
          MEMORY[0x23B81AA70](v64, -1, -1);

          goto LABEL_39;
        }

      }
      else
      {
        sub_2376F2680(v25, v29, v26, v27);
        v47 = qword_2542B7768;
        v48 = v30;
        v49 = v98;
        v50 = v27;
        swift_bridgeObjectRetain();
        if (v47 != -1)
          swift_once();
        v51 = sub_2376F2BA4();
        __swift_project_value_buffer(v51, (uint64_t)qword_2542B77D0);
        swift_bridgeObjectRetain_n();
        v52 = sub_2376F2B8C();
        v53 = sub_2376F2CDC();
        v44 = v97;
        v40 = v86;
        v45 = v94;
        if (os_log_type_enabled(v52, v53))
        {
          type = v53;
          v54 = (uint8_t *)swift_slowAlloc();
          *(_QWORD *)&v108 = swift_slowAlloc();
          v55 = v108;
          *(_DWORD *)v54 = 136446210;
          swift_bridgeObjectRetain();
          sub_2376F0408(v96, v17, (uint64_t *)&v108);
          sub_2376F2D30();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_2376DB000, v52, type, "Now tracking pending reminder with id %{public}s", v54, 0xCu);
          swift_arrayDestroy();
          v56 = v55;
          v45 = v94;
          MEMORY[0x23B81AA70](v56, -1, -1);
          MEMORY[0x23B81AA70](v54, -1, -1);

          goto LABEL_39;
        }

      }
      swift_bridgeObjectRelease_n();
LABEL_39:
      swift_beginAccess();
      LODWORD(v102) = v40;
      v92 = v17;
      v87 = v30;
      if (v45)
      {
        if (v103)
        {
          swift_bridgeObjectRetain();
          if ((sub_2376EF0AC((uint64_t)v84, v103) & 1) == 0)
          {
            *(_QWORD *)&v108 = v103;
            v70 = v84;
            MEMORY[0x23B81A350]();
            if (*(_QWORD *)((v108 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v108 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
              sub_2376F2C40();
            sub_2376F2C58();
            sub_2376F2C28();
            v103 = v108;
          }
        }
        else
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_256808E20);
          v71 = swift_allocObject();
          *(_OWORD *)(v71 + 16) = xmmword_2376F38D0;
          *(_QWORD *)(v71 + 32) = v84;
          *(_QWORD *)&v108 = v71;
          sub_2376F2C28();
          v103 = v108;
          v72 = v84;
        }
        swift_bridgeObjectRelease();
      }
      goto LABEL_47;
    }
    swift_bridgeObjectRelease();
    if (qword_2542B7768 != -1)
      swift_once();
    v65 = sub_2376F2BA4();
    __swift_project_value_buffer(v65, (uint64_t)qword_2542B77D0);
    v66 = v38;
    v32 = sub_2376F2B8C();
    v67 = sub_2376F2CE8();
    if (!os_log_type_enabled(v32, v67))
    {

      return;
    }
    v34 = (uint8_t *)swift_slowAlloc();
    v68 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v34 = 138412290;
    *(_QWORD *)&v108 = v66;
    v69 = v66;
    sub_2376F2D30();
    *v68 = v66;

    _os_log_impl(&dword_2376DB000, v32, v67, "Couldn't create tracked event info for event %@", v34, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256808E18);
    swift_arrayDestroy();
    v37 = v68;
LABEL_14:
    MEMORY[0x23B81AA70](v37, -1, -1);
    MEMORY[0x23B81AA70](v34, -1, -1);

    return;
  }
  *(_QWORD *)&v101 = v25;
  *((_QWORD *)&v101 + 1) = v24;
  LODWORD(v102) = v26;
  *((_QWORD *)&v102 + 1) = v27;
  v103 = v28;
  v29 = v24;
  v93 = v14;
  if ((v14 & 1) != 0)
  {
    v98 = v24;
    v30 = v25;
    v84 = a1;
    goto LABEL_18;
  }
  v85 = v22;
  v44 = v97;
  v92 = v17;
  v90 = v26;
  sub_2376F2680(v25, v24, v26, v27);
  swift_bridgeObjectRetain();
  v88 = v25;
  v87 = v25;
  v89 = v24;
  v98 = v24;
  v91 = v27;
  v46 = v27;
LABEL_47:
  swift_beginAccess();
  v108 = v101;
  v109 = v102;
  v110 = v103;
  sub_2376F26C8((uint64_t)&v109 + 8, (uint64_t)v112, &qword_256808F48);
  sub_2376F26C8((uint64_t)&v110, (uint64_t)v111, &qword_256808F58);
  v74 = *(void **)v44;
  v73 = *(void **)(v44 + 8);
  v75 = *(_QWORD *)(v44 + 16);
  v95 = *(void **)(v44 + 24);
  *(_OWORD *)v44 = v101;
  *(_QWORD *)(v44 + 16) = v102;
  *(_QWORD *)(v44 + 24) = *((_QWORD *)&v102 + 1);
  *(_QWORD *)(v44 + 32) = v103;
  v76 = (id)v101;
  v77 = *((id *)&v101 + 1);
  sub_2376F270C(v112);
  sub_2376F2734((uint64_t)v111);
  sub_2376F229C(v74, v73, v75, v95);
  if ((v93 & 1) != 0)
  {
    swift_beginAccess();
    v78 = v76;
    v79 = v77;
    sub_2376F270C(v112);
    sub_2376F2734((uint64_t)v111);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v100 = *v85;
    *v85 = 0x8000000000000000;
    sub_2376F0D3C((uint64_t)&v108, v96, v92, isUniquelyReferenced_nonNull_native);
    *v85 = v100;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_endAccess();
    sub_2376F229C(v88, v89, v90, v91);

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_2376F229C(v88, v89, v90, v91);

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_2376F22E0(v112);
    sub_2376F275C((uint64_t)v111);
  }
}

uint64_t sub_2376EF0AC(uint64_t a1, unint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  id v5;
  void *v6;
  char v7;
  uint64_t v9;
  uint64_t v10;
  char v11;
  unint64_t v12;
  id v13;
  char v14;

  if (a2 >> 62)
    goto LABEL_20;
  v3 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v3; v3 = sub_2376F2E98())
  {
    v4 = a2 & 0xC000000000000001;
    if ((a2 & 0xC000000000000001) == 0)
    {
      v5 = *(id *)(a2 + 32);
      goto LABEL_5;
    }
    while (1)
    {
      v5 = (id)MEMORY[0x23B81A560](0, a2);
LABEL_5:
      v6 = v5;
      sub_2376E121C(0, &qword_256808EC0);
      v7 = sub_2376F2D24();

      if ((v7 & 1) != 0)
      {
LABEL_6:
        swift_bridgeObjectRelease();
        return 1;
      }
      if (v3 == 1)
        goto LABEL_18;
      if (v4)
        break;
      v4 = 5;
      while (1)
      {
        v12 = v4 - 3;
        if (__OFADD__(v4 - 4, 1))
          break;
        v13 = *(id *)(a2 + 8 * v4);
        v14 = sub_2376F2D24();

        if ((v14 & 1) != 0)
          goto LABEL_6;
        ++v4;
        if (v12 == v3)
          goto LABEL_18;
      }
      __break(1u);
    }
    v9 = 1;
    while (1)
    {
      MEMORY[0x23B81A560](v9, a2);
      v10 = v9 + 1;
      if (__OFADD__(v9, 1))
        break;
      v11 = sub_2376F2D24();
      swift_unknownObjectRelease();
      if ((v11 & 1) != 0)
        goto LABEL_6;
      ++v9;
      if (v10 == v3)
        goto LABEL_18;
    }
    __break(1u);
LABEL_20:
    swift_bridgeObjectRetain();
  }
LABEL_18:
  swift_bridgeObjectRelease();
  return 0;
}

void sub_2376EF230(uint64_t a1)
{
  uint64_t v1;
  uint64_t inited;
  uint64_t v4;
  id v5;
  uint64_t v6;
  id v7;
  void *v8;

  sub_2376E4208(MEMORY[0x24BEE4AF8]);
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256808ED0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2376F3A50;
  sub_2376F2BE0();
  sub_2376F2DC0();
  *(_QWORD *)(inited + 96) = __swift_instantiateConcreteTypeFromMangledName(&qword_256808F60);
  *(_QWORD *)(inited + 72) = a1;
  sub_2376F2BE0();
  swift_bridgeObjectRetain();
  sub_2376F2DC0();
  *(_QWORD *)(inited + 168) = MEMORY[0x24BEE1E88];
  *(_QWORD *)(inited + 144) = 1;
  sub_2376F2BE0();
  sub_2376F2DC0();
  v4 = MEMORY[0x24BEE1328];
  *(_QWORD *)(inited + 240) = MEMORY[0x24BEE1328];
  *(_BYTE *)(inited + 216) = 1;
  sub_2376F2BE0();
  sub_2376F2DC0();
  *(_QWORD *)(inited + 312) = v4;
  *(_BYTE *)(inited + 288) = 0;
  swift_bridgeObjectRetain();
  sub_2376F2DC0();
  *(_QWORD *)(inited + 384) = v4;
  *(_BYTE *)(inited + 360) = 1;
  sub_2376E4208(inited);
  v5 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
  v6 = *MEMORY[0x24BDC7420];
  v7 = *(id *)(v1 + OBJC_IVAR____TtC21CalendarUIKitInternal22PendingReminderTracker_eventStore);
  v8 = (void *)sub_2376F2BB0();
  swift_bridgeObjectRelease();
  objc_msgSend(v5, sel_postNotificationName_object_userInfo_, v6, v7, v8);

}

void sub_2376EF484()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  char v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t *v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  unsigned __int8 v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  void *v43;
  uint64_t v44;
  id v45;
  void *v46;
  id v47;
  id v48;
  id v49;
  char v50;
  uint64_t v51;
  NSObject *v52;
  os_log_type_t v53;
  uint8_t *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  unsigned int v62;
  uint64_t v63;
  NSObject *v64;
  os_log_type_t v65;
  uint64_t v66;
  uint64_t v67;
  unint64_t v68;
  char v69;
  char v70;
  char v71;
  uint64_t v72;
  unsigned int v73;
  uint64_t v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  NSObject *v80;
  os_log_type_t v81;
  void *v82;
  uint64_t v83;
  uint64_t v84;
  unint64_t v85;
  void *v86;
  unint64_t v87;
  char v88;
  char v89;
  void *v90;
  void *v91;
  uint64_t v92;
  void *v93;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v95;
  uint64_t v96;
  os_log_type_t type;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t *v101;
  int64_t v102;
  unint64_t v103;
  void *v104;
  void *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  unint64_t v109;
  unint64_t v110;
  int64_t v111;
  id v112;
  void *v113;
  unint64_t v114;
  id v115;
  id v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119[3];
  __int128 v120;
  __int128 v121;
  _BYTE v122[48];

  v1 = v0;
  v2 = sub_2376F279C();
  if (v2)
  {
    v3 = v2;
    v119[0] = qword_256808F20;
    v119[1] = unk_256808F28;
    swift_bridgeObjectRetain();
    sub_2376F2DC0();
    if (*(_QWORD *)(v3 + 16) && (v4 = sub_2376E8BF0((uint64_t)v122), (v5 & 1) != 0))
    {
      sub_2376F2620(*(_QWORD *)(v3 + 56) + 32 * v4, (uint64_t)&v120);
    }
    else
    {
      v120 = 0u;
      v121 = 0u;
    }
    swift_bridgeObjectRelease();
    sub_2376EC6A4((uint64_t)v122);
    if (*((_QWORD *)&v121 + 1))
    {
      if (swift_dynamicCast() && (v122[0] & 1) != 0)
        return;
      goto LABEL_12;
    }
  }
  else
  {
    v120 = 0u;
    v121 = 0u;
  }
  sub_2376F25E0((uint64_t)&v120);
LABEL_12:
  v6 = (uint64_t *)(v1 + OBJC_IVAR____TtC21CalendarUIKitInternal22PendingReminderTracker_trackedEvents);
  swift_beginAccess();
  v100 = *v6 + 64;
  v7 = 1 << *(_BYTE *)(*v6 + 32);
  v8 = -1;
  if (v7 < 64)
    v8 = ~(-1 << v7);
  v9 = v8 & *(_QWORD *)(*v6 + 64);
  v106 = OBJC_IVAR____TtC21CalendarUIKitInternal22PendingReminderTracker_eventStore;
  v102 = (unint64_t)(v7 + 63) >> 6;
  v108 = *v6;
  swift_bridgeObjectRetain();
  v10 = 0;
  v107 = v1;
  v101 = v6;
  while (v9)
  {
    v16 = __clz(__rbit64(v9));
    v9 &= v9 - 1;
    v17 = v16 | (v10 << 6);
LABEL_33:
    v21 = (uint64_t *)(*(_QWORD *)(v108 + 48) + 16 * v17);
    v22 = *v21;
    v23 = v21[1];
    v24 = *(_QWORD *)(v108 + 56) + 40 * v17;
    v25 = *(void **)v24;
    v26 = *(void **)(v24 + 8);
    v27 = *(_DWORD *)(v24 + 16);
    v28 = *(void **)(v24 + 24);
    v114 = *(_QWORD *)(v24 + 32);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    v29 = v25;
    v30 = v26;
    v31 = v28;
    v32 = v29;
    swift_bridgeObjectRetain();
    v33 = v32;
    v115 = v30;
    v112 = v31;
    v34 = objc_msgSend(v33, sel_isTemporary);
    v35 = *(void **)(v1 + v106);
    if ((v34 & 1) != 0)
    {
      v104 = v33;
      v36 = v35;
      v99 = v22;
      v37 = (void *)sub_2376F2BD4();
      v38 = objc_msgSend(v36, sel_allEventsWithUniqueId_occurrenceDate_, v37, 0);

      if (!v38)
      {
        swift_bridgeObjectRelease_n();

        goto LABEL_76;
      }
      v109 = v9;
      v111 = v10;
      sub_2376E121C(0, &qword_256808EC0);
      v39 = sub_2376F2C1C();

      v103 = v23;
      if (!(v39 >> 62))
      {
        v40 = *(_QWORD *)((v39 & 0xFFFFFFFFFFFFF8) + 0x10);
        if (v40)
          goto LABEL_37;
LABEL_78:

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();

        swift_bridgeObjectRelease_n();
        v1 = v107;
        goto LABEL_79;
      }
      swift_bridgeObjectRetain();
      v40 = sub_2376F2E98();
      swift_bridgeObjectRelease();
      if (!v40)
        goto LABEL_78;
LABEL_37:
      v41 = 4;
      while (1)
      {
        if ((v39 & 0xC000000000000001) != 0)
          v42 = (id)MEMORY[0x23B81A560](v41 - 4, v39);
        else
          v42 = *(id *)(v39 + 8 * v41);
        v43 = v42;
        v44 = v41 - 3;
        if (__OFADD__(v41 - 4, 1))
        {
          __break(1u);
          goto LABEL_82;
        }
        v45 = objc_msgSend(v42, sel_calendar);
        if (!v45)
          goto LABEL_84;
        v46 = v45;
        v47 = objc_msgSend(v45, sel_objectID);

        if (v47)
        {
          sub_2376E121C(0, &qword_256808F50);
          v48 = v115;
          v49 = v47;
          v50 = sub_2376F2D24();

          if ((v50 & 1) != 0)
            break;
        }

        ++v41;
        if (v44 == v40)
          goto LABEL_78;
      }
      swift_bridgeObjectRelease();
      if (qword_2542B7768 != -1)
        swift_once();
      v51 = sub_2376F2BA4();
      __swift_project_value_buffer(v51, (uint64_t)qword_2542B77D0);
      swift_bridgeObjectRetain_n();
      v52 = sub_2376F2B8C();
      v53 = sub_2376F2CDC();
      if (os_log_type_enabled(v52, v53))
      {
        v54 = (uint8_t *)swift_slowAlloc();
        v55 = swift_slowAlloc();
        v119[0] = v55;
        *(_DWORD *)v54 = 136315138;
        swift_bridgeObjectRetain();
        v56 = v99;
        sub_2376F0408(v99, v103, v119);
        sub_2376F2D30();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_2376DB000, v52, v53, "Clearing pending state for %s because it now exists", v54, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x23B81AA70](v55, -1, -1);
        MEMORY[0x23B81AA70](v54, -1, -1);

        v9 = v109;
        v10 = v111;
      }
      else
      {

        swift_bridgeObjectRelease_n();
        v9 = v109;
        v56 = v99;
      }
      sub_2376F1070(v104, v114, 1);
      swift_beginAccess();
      sub_2376F0A48(v56, v103, (uint64_t)v122);
      swift_endAccess();
      sub_2376F226C((uint64_t)v122);

      swift_bridgeObjectRelease_n();
      v1 = v107;
LABEL_76:
      swift_bridgeObjectRelease_n();
    }
    else
    {
      v57 = v1;
      v58 = v33;
      v59 = objc_msgSend(v35, sel_publicObjectWithObjectID_, v33);
      if (!v59)
        goto LABEL_56;
      v60 = v59;
      objc_opt_self();
      v61 = (void *)swift_dynamicCastObjCClass();
      if (v61)
      {
        v62 = objc_msgSend(v61, sel_sequenceNumber);
        if (v27 == v62)
        {

          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease_n();
          v1 = v57;
        }
        else
        {
          v73 = v62;
          v109 = v9;
          v111 = v10;
          if (qword_2542B7768 != -1)
            swift_once();
          v74 = sub_2376F2BA4();
          __swift_project_value_buffer(v74, (uint64_t)qword_2542B77D0);
          v75 = v58;
          swift_bridgeObjectRetain_n();
          v76 = v115;
          v77 = v112;
          swift_bridgeObjectRetain_n();
          v116 = v75;
          v78 = v76;
          v79 = v77;
          v80 = sub_2376F2B8C();
          v81 = sub_2376F2CDC();
          v113 = v78;
          v105 = v79;
          if (os_log_type_enabled(v80, v81))
          {
            type = v81;
            v82 = v78;
            v83 = swift_slowAlloc();
            v98 = swift_slowAlloc();
            v119[0] = v98;
            *(_DWORD *)v83 = 136315650;
            swift_bridgeObjectRetain();
            *(_QWORD *)(v83 + 4) = sub_2376F0408(v22, v23, v119);
            swift_bridgeObjectRelease_n();
            *(_WORD *)(v83 + 12) = 1024;
            swift_bridgeObjectRelease();

            *(_DWORD *)(v83 + 14) = v27;
            swift_bridgeObjectRelease();

            *(_WORD *)(v83 + 18) = 1024;
            v84 = v22;
            *(_DWORD *)(v83 + 20) = v73;
            _os_log_impl(&dword_2376DB000, v80, type, "Clearing pending state for %s because it has been updated (%d->%d)", (uint8_t *)v83, 0x18u);
            swift_arrayDestroy();
            MEMORY[0x23B81AA70](v98, -1, -1);
            MEMORY[0x23B81AA70](v83, -1, -1);

            v85 = v114;
            v86 = v116;
          }
          else
          {

            swift_bridgeObjectRelease_n();
            swift_bridgeObjectRelease_n();

            v86 = v116;
            v85 = v114;
            v84 = v22;
          }
          v1 = v107;
          sub_2376F1070(v86, v85, 1);
          swift_beginAccess();
          swift_bridgeObjectRetain();
          v87 = sub_2376E8B8C(v84, v23);
          v89 = v88;
          swift_bridgeObjectRelease();
          v90 = 0;
          v91 = 0;
          v92 = 0;
          v93 = 0;
          if ((v89 & 1) != 0)
          {
            isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
            v95 = *v101;
            v118 = *v101;
            *v101 = 0x8000000000000000;
            if ((isUniquelyReferenced_nonNull_native & 1) == 0)
            {
              sub_2376EB268();
              v95 = v118;
            }
            swift_bridgeObjectRelease();
            v96 = *(_QWORD *)(v95 + 56) + 40 * v87;
            v90 = *(void **)v96;
            v91 = *(void **)(v96 + 8);
            v92 = *(unsigned int *)(v96 + 16);
            v93 = *(void **)(v96 + 24);
            sub_2376F0B54(v87, v95);
            *v101 = v95;
            swift_bridgeObjectRelease();
            v86 = v116;
          }
          swift_endAccess();
          sub_2376F229C(v90, v91, v92, v93);

          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease_n();
LABEL_79:
          v9 = v109;
          v10 = v111;
        }
      }
      else
      {

LABEL_56:
        if (qword_2542B7768 != -1)
          swift_once();
        v63 = sub_2376F2BA4();
        __swift_project_value_buffer(v63, (uint64_t)qword_2542B77D0);
        swift_bridgeObjectRetain_n();
        v64 = sub_2376F2B8C();
        v65 = sub_2376F2CDC();
        v110 = v9;
        if (os_log_type_enabled(v64, v65))
        {
          v66 = swift_slowAlloc();
          v67 = swift_slowAlloc();
          v119[0] = v67;
          *(_DWORD *)v66 = 136315138;
          swift_bridgeObjectRetain();
          *(_QWORD *)(v66 + 4) = sub_2376F0408(v22, v23, v119);
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_2376DB000, v64, v65, "Clearing pending state for %s because it has been deleted", (uint8_t *)v66, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x23B81AA70](v67, -1, -1);
          MEMORY[0x23B81AA70](v66, -1, -1);

        }
        else
        {

          swift_bridgeObjectRelease_n();
        }
        sub_2376F1070(v58, v114, 1);
        swift_beginAccess();
        swift_bridgeObjectRetain();
        v68 = sub_2376E8B8C(v22, v23);
        v70 = v69;
        swift_bridgeObjectRelease();
        v12 = 0;
        v13 = 0;
        v14 = 0;
        v15 = 0;
        if ((v70 & 1) != 0)
        {
          v71 = swift_isUniquelyReferenced_nonNull_native();
          v72 = *v101;
          v117 = *v101;
          *v101 = 0x8000000000000000;
          if ((v71 & 1) == 0)
          {
            sub_2376EB268();
            v72 = v117;
          }
          swift_bridgeObjectRelease();
          v11 = *(_QWORD *)(v72 + 56) + 40 * v68;
          v12 = *(void **)v11;
          v13 = *(void **)(v11 + 8);
          v14 = *(unsigned int *)(v11 + 16);
          v15 = *(void **)(v11 + 24);
          sub_2376F0B54(v68, v72);
          *v101 = v72;
          swift_bridgeObjectRelease();
        }
        swift_endAccess();
        sub_2376F229C(v12, v13, v14, v15);
        swift_bridgeObjectRelease_n();

        swift_bridgeObjectRelease_n();
        v9 = v110;
        v1 = v107;
      }
    }
  }
  v18 = v10 + 1;
  if (__OFADD__(v10, 1))
  {
LABEL_82:
    __break(1u);
    goto LABEL_83;
  }
  if (v18 >= v102)
    goto LABEL_80;
  v19 = *(_QWORD *)(v100 + 8 * v18);
  ++v10;
  if (v19)
    goto LABEL_32;
  v10 = v18 + 1;
  if (v18 + 1 >= v102)
    goto LABEL_80;
  v19 = *(_QWORD *)(v100 + 8 * v10);
  if (v19)
    goto LABEL_32;
  v10 = v18 + 2;
  if (v18 + 2 >= v102)
    goto LABEL_80;
  v19 = *(_QWORD *)(v100 + 8 * v10);
  if (v19)
  {
LABEL_32:
    v9 = (v19 - 1) & v19;
    v17 = __clz(__rbit64(v19)) + (v10 << 6);
    goto LABEL_33;
  }
  v20 = v18 + 3;
  if (v20 >= v102)
  {
LABEL_80:
    swift_release();
    return;
  }
  v19 = *(_QWORD *)(v100 + 8 * v20);
  if (v19)
  {
    v10 = v20;
    goto LABEL_32;
  }
  while (1)
  {
    v10 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v10 >= v102)
      goto LABEL_80;
    v19 = *(_QWORD *)(v100 + 8 * v10);
    ++v20;
    if (v19)
      goto LABEL_32;
  }
LABEL_83:
  __break(1u);
LABEL_84:
  __break(1u);
}

id PendingReminderTracker.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void PendingReminderTracker.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id PendingReminderTracker.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PendingReminderTracker();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_2376F0408(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_2376F04D8(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_2376F2620((uint64_t)v12, *a3);
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
      sub_2376F2620((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_2376F04D8(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_2376F2D3C();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_2376F0690(a5, a6);
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
  v8 = sub_2376F2E20();
  if (!v8)
  {
    sub_2376F2E8C();
    __break(1u);
LABEL_17:
    result = sub_2376F2ED4();
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

uint64_t sub_2376F0690(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_2376F0724(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_2376F08FC(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_2376F08FC(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2376F0724(uint64_t a1, unint64_t a2)
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
      v3 = sub_2376F0898(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_2376F2DFC();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_2376F2E8C();
      __break(1u);
LABEL_10:
      v2 = sub_2376F2BF8();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_2376F2ED4();
    __break(1u);
LABEL_14:
    result = sub_2376F2E8C();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_2376F0898(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542B77C0);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_2376F08FC(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2542B77C0);
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
  result = sub_2376F2ED4();
  __break(1u);
  return result;
}

uint64_t sub_2376F0A48@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t *v3;
  uint64_t *v4;
  unint64_t v8;
  char v9;
  uint64_t result;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  v4 = v3;
  swift_bridgeObjectRetain();
  v8 = sub_2376E8B8C(a1, a2);
  LOBYTE(a2) = v9;
  result = swift_bridgeObjectRelease();
  if ((a2 & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v12 = *v4;
    v19 = *v4;
    *v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_2376EB268();
      v12 = v19;
    }
    swift_bridgeObjectRelease();
    v13 = *(_QWORD *)(v12 + 56) + 40 * v8;
    v18 = *(_OWORD *)v13;
    v14 = *(unsigned int *)(v13 + 16);
    v15 = *(_QWORD *)(v13 + 24);
    v16 = *(_QWORD *)(v13 + 32);
    sub_2376F0B54(v8, v12);
    *v4 = v12;
    result = swift_bridgeObjectRelease();
    v17 = v18;
  }
  else
  {
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v17 = 0uLL;
  }
  *(_OWORD *)a3 = v17;
  *(_QWORD *)(a3 + 16) = v14;
  *(_QWORD *)(a3 + 24) = v15;
  *(_QWORD *)(a3 + 32) = v16;
  return result;
}

unint64_t sub_2376F0B54(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  _OWORD *v14;
  _OWORD *v15;
  uint64_t v16;
  unint64_t v17;
  __int128 *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_2376F2D60();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_2376F2F40();
        swift_bridgeObjectRetain();
        sub_2376F2BEC();
        v11 = sub_2376F2F58();
        result = swift_bridgeObjectRelease();
        v12 = v11 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v12 < v8)
            goto LABEL_5;
        }
        else if (v12 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v12)
        {
LABEL_11:
          v13 = *(_QWORD *)(a2 + 48);
          v14 = (_OWORD *)(v13 + 16 * v3);
          v15 = (_OWORD *)(v13 + 16 * v6);
          if (v3 != v6 || v14 >= v15 + 1)
            *v14 = *v15;
          v16 = *(_QWORD *)(a2 + 56);
          v17 = v16 + 40 * v3;
          v18 = (__int128 *)(v16 + 40 * v6);
          if (v3 != v6 || (v3 = v6, v17 >= (unint64_t)v18 + 40))
          {
            v9 = *v18;
            v10 = v18[1];
            *(_QWORD *)(v17 + 32) = *((_QWORD *)v18 + 4);
            *(_OWORD *)v17 = v9;
            *(_OWORD *)(v17 + 16) = v10;
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v19 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v20 = *v19;
    v21 = (-1 << v3) - 1;
  }
  else
  {
    v19 = (uint64_t *)(v4 + 8 * (result >> 6));
    v21 = *v19;
    v20 = (-1 << result) - 1;
  }
  *v19 = v21 & v20;
  v22 = *(_QWORD *)(a2 + 16);
  v23 = __OFSUB__(v22, 1);
  v24 = v22 - 1;
  if (v23)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v24;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_2376F0D3C(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t result;
  __int128 v23;
  unint64_t v24;
  char v25;
  uint64_t *v26;
  uint64_t v27;
  __int128 v28;
  uint64_t v29;
  BOOL v30;
  uint64_t v31;

  v5 = v4;
  v10 = *v4;
  v12 = sub_2376E8B8C(a2, a3);
  v13 = *(_QWORD *)(v10 + 16);
  v14 = (v11 & 1) == 0;
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v16 = v11;
  v17 = *(_QWORD *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0)
    goto LABEL_7;
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_2376EB268();
LABEL_7:
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      v19 = v18[7] + 40 * v12;
      v20 = *(void **)v19;
      v21 = *(void **)(v19 + 24);

      result = swift_bridgeObjectRelease();
      v23 = *(_OWORD *)(a1 + 16);
      *(_OWORD *)v19 = *(_OWORD *)a1;
      *(_OWORD *)(v19 + 16) = v23;
      *(_QWORD *)(v19 + 32) = *(_QWORD *)(a1 + 32);
      return result;
    }
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    v26 = (uint64_t *)(v18[6] + 16 * v12);
    *v26 = a2;
    v26[1] = a3;
    v27 = v18[7] + 40 * v12;
    v28 = *(_OWORD *)(a1 + 16);
    *(_OWORD *)v27 = *(_OWORD *)a1;
    *(_OWORD *)(v27 + 16) = v28;
    *(_QWORD *)(v27 + 32) = *(_QWORD *)(a1 + 32);
    v29 = v18[2];
    v30 = __OFADD__(v29, 1);
    v31 = v29 + 1;
    if (!v30)
    {
      v18[2] = v31;
      return swift_bridgeObjectRetain();
    }
    goto LABEL_14;
  }
  sub_2376EAC38(v15, a4 & 1);
  v24 = sub_2376E8B8C(a2, a3);
  if ((v16 & 1) == (v25 & 1))
  {
    v12 = v24;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_2376F2F04();
  __break(1u);
  return result;
}

void sub_2376F0ED0(void *a1@<X0>, _QWORD *a2@<X8>)
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;

  v4 = objc_msgSend(a1, sel_originalItem);
  if (!v4)
  {
    v6 = objc_msgSend(a1, sel_objectID);
    if (v6)
    {
      v12 = objc_msgSend(a1, sel_calendar);
      if (v12)
      {
        v13 = v12;
        v9 = objc_msgSend(v12, sel_objectID);

        if (!v9)
        {

          v6 = 0;
        }
        goto LABEL_17;
      }

      goto LABEL_15;
    }
LABEL_11:

LABEL_16:
    v9 = 0;
    goto LABEL_17;
  }
  v5 = v4;
  v6 = objc_msgSend(v4, sel_objectID);
  if (!v6)
  {

    goto LABEL_11;
  }
  v7 = objc_msgSend(v5, sel_calendar);
  if (!v7)
  {

LABEL_15:
    v6 = 0;
    goto LABEL_16;
  }
  v8 = v7;
  v9 = objc_msgSend(v7, sel_objectID);

  if (!v9)
  {

    v6 = 0;
LABEL_17:
    v11 = 0;
    goto LABEL_18;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_256808E20);
  v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_2376F38D0;
  *(_QWORD *)(v10 + 32) = a1;
  v14 = v10;
  sub_2376F2C28();
  v11 = v14;

LABEL_18:
  *a2 = v6;
  a2[1] = v9;
  a2[2] = 0;
  a2[3] = 0;
  a2[4] = v11;
}

uint64_t sub_2376F1070(void *a1, unint64_t a2, char a3)
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  id v15;
  id v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  id v25;
  id v26;
  os_log_type_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  id v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  id v39;
  void *v40;
  id v41;
  uint64_t v42;
  id v44;
  void *v45;
  uint64_t v46;
  id v47;
  id v48;
  NSObject *v49;
  os_log_type_t v50;
  uint8_t *v51;
  _QWORD *v52;
  id v53;
  void *v54;
  uint64_t v55;
  char v56;
  unint64_t v58;
  uint64_t v59;
  id v60;
  unint64_t v61;
  uint64_t v62;

  v6 = v3;
  v8 = a1;
  v62 = *MEMORY[0x24BDAC8D0];
  v61 = MEMORY[0x24BEE4AF8];
  v9 = 0x256808000uLL;
  v59 = v6;
  if (a2)
  {
    v10 = a2;
    if (a2 >> 62)
    {
      swift_bridgeObjectRetain();
      v11 = sub_2376F2E98();
      if (v11)
        goto LABEL_4;
    }
    else
    {
      v11 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (v11)
      {
LABEL_4:
        if (v11 >= 1)
        {
          v56 = a3;
          v12 = 0;
          v13 = OBJC_IVAR____TtC21CalendarUIKitInternal22PendingReminderTracker_eventStore;
          v14 = v10 & 0xC000000000000001;
          v58 = v10;
          while (1)
          {
            if (v14)
              v16 = (id)MEMORY[0x23B81A560](v12, v10);
            else
              v16 = *(id *)(v10 + 8 * v12 + 32);
            v17 = v16;
            v18 = objc_msgSend(v16, sel_objectID);
            if (v18)
            {
              v19 = v18;
              if ((-[NSObject isTemporary](v18, sel_isTemporary) & 1) == 0)
              {

LABEL_23:
                goto LABEL_7;
              }
              v20 = v19;
              MEMORY[0x23B81A350]();
              if (*(_QWORD *)((v61 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v61 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
                sub_2376F2C40();
              sub_2376F2C58();
              sub_2376F2C28();

            }
            v21 = *(void **)(v6 + v13);
            v60 = 0;
            if (objc_msgSend(v21, sel_removeEvent_span_commit_error_, v17, 0, 0, &v60))
            {
              v15 = v60;

            }
            else
            {
              v22 = v60;
              v23 = (void *)sub_2376F27F0();

              swift_willThrow();
              if (qword_2542B7768 != -1)
                swift_once();
              v24 = sub_2376F2BA4();
              __swift_project_value_buffer(v24, (uint64_t)qword_2542B77D0);
              v25 = v23;
              v26 = v23;
              v19 = sub_2376F2B8C();
              v27 = sub_2376F2CE8();
              if (!os_log_type_enabled(v19, v27))
              {

                goto LABEL_23;
              }
              v28 = v11;
              v29 = v14;
              v30 = v13;
              v31 = swift_slowAlloc();
              v32 = (_QWORD *)swift_slowAlloc();
              *(_DWORD *)v31 = 138412290;
              v33 = v23;
              v34 = _swift_stdlib_bridgeErrorToNSError();
              *(_QWORD *)(v31 + 4) = v34;
              *v32 = v34;

              _os_log_impl(&dword_2376DB000, v19, v27, "Couldn't remove temporary event: %@", (uint8_t *)v31, 0xCu);
              __swift_instantiateConcreteTypeFromMangledName(&qword_256808E18);
              swift_arrayDestroy();
              v35 = v32;
              v6 = v59;
              MEMORY[0x23B81AA70](v35, -1, -1);
              v36 = v31;
              v13 = v30;
              v14 = v29;
              v11 = v28;
              v10 = v58;
              MEMORY[0x23B81AA70](v36, -1, -1);

            }
LABEL_7:
            if (v11 == ++v12)
            {
              swift_bridgeObjectRelease();
              a3 = v56;
              v8 = a1;
              v9 = 0x256808000;
              goto LABEL_27;
            }
          }
        }
        __break(1u);
LABEL_48:
        sub_2376F2C40();
        goto LABEL_30;
      }
    }
    swift_bridgeObjectRelease();
    v8 = a1;
  }
LABEL_27:
  v9 = *(_QWORD *)(v9 + 3896);
  v37 = objc_msgSend(*(id *)(v6 + v9), sel_publicObjectWithObjectID_, v8);
  if (!v37)
    goto LABEL_35;
  v5 = v37;
  objc_opt_self();
  v38 = swift_dynamicCastObjCClass();
  if (!v38)
    goto LABEL_34;
  v4 = (void *)v38;
  v39 = v8;
  MEMORY[0x23B81A350]();
  if (*(_QWORD *)((v61 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v61 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    goto LABEL_48;
LABEL_30:
  sub_2376F2C58();
  sub_2376F2C28();
  if ((objc_msgSend(v4, sel_hasEverBeenCommitted) & 1) != 0)
  {
    objc_msgSend(v4, sel_reset);
LABEL_34:

    goto LABEL_35;
  }
  v40 = *(void **)(v6 + v9);
  v60 = 0;
  if (objc_msgSend(v40, sel_removeEvent_span_commit_error_, v4, 0, 0, &v60))
  {
    v41 = v60;
    goto LABEL_34;
  }
  v44 = v60;
  v45 = (void *)sub_2376F27F0();

  swift_willThrow();
  if (qword_2542B7768 != -1)
    swift_once();
  v46 = sub_2376F2BA4();
  __swift_project_value_buffer(v46, (uint64_t)qword_2542B77D0);
  v47 = v45;
  v48 = v45;
  v49 = sub_2376F2B8C();
  v50 = sub_2376F2CE8();
  if (os_log_type_enabled(v49, v50))
  {
    v51 = (uint8_t *)swift_slowAlloc();
    v52 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v51 = 138412290;
    v53 = v45;
    v54 = (void *)_swift_stdlib_bridgeErrorToNSError();
    v60 = v54;
    sub_2376F2D30();
    *v52 = v54;

    _os_log_impl(&dword_2376DB000, v49, v50, "Couldn't remove temporary event: %@", v51, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256808E18);
    swift_arrayDestroy();
    MEMORY[0x23B81AA70](v52, -1, -1);
    MEMORY[0x23B81AA70](v51, -1, -1);

  }
  else
  {

  }
LABEL_35:
  if ((a3 & 1) != 0)
  {
    if (v61 >> 62)
    {
      swift_bridgeObjectRetain();
      v55 = sub_2376F2E98();
      swift_bridgeObjectRelease();
      if (v55 < 1)
        return swift_bridgeObjectRelease();
      goto LABEL_38;
    }
    if (*(uint64_t *)((v61 & 0xFFFFFFFFFFFFF8) + 0x10) >= 1)
    {
LABEL_38:
      v42 = swift_bridgeObjectRetain();
      sub_2376EF230(v42);
      swift_bridgeObjectRelease();
    }
  }
  return swift_bridgeObjectRelease();
}

void sub_2376F1744(void *a1, int a2, char a3, uint64_t a4, void *a5, void *a6)
{
  id v11;
  void *v12;
  id v13;
  void *v14;
  unint64_t v15;
  unint64_t v16;
  void *v17;
  id v18;
  unint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  os_log_type_t v31;
  uint8_t *v32;
  _QWORD *v33;
  id v34;
  _QWORD *v35;
  id v36;
  unint64_t v37;
  int v38;
  id v39;
  id v40;
  id v41;
  id v42;
  uint64_t v43;
  id v44;
  id v45;
  id v46;
  uint64_t v47;
  NSObject *v48;
  os_log_type_t v49;
  uint8_t *v50;
  uint8_t *v51;
  uint64_t v52;
  id v53;
  id v54;
  id v55;
  uint64_t v56;
  NSObject *v57;
  uint64_t v58;
  uint64_t v59;
  id v60;
  os_log_type_t v61;
  _QWORD *v62;
  id v63;
  id v64;
  uint64_t v65;
  id v66;
  __int128 v67;
  id v68;
  id v69;
  char isUniquelyReferenced_nonNull_native;
  os_log_type_t type;
  uint64_t typea;
  os_log_type_t log;
  os_log_t v74;
  NSObject *v75;
  id v76;
  uint64_t v77;
  uint64_t v78;
  int v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  id v84;
  uint64_t v85;
  id v87;
  uint64_t v88;
  __int128 v89;
  __int128 v90;
  unint64_t v91;
  _QWORD v92[5];
  _QWORD v93[5];
  _QWORD v94[5];
  _QWORD v95[5];
  __int128 v96;
  __int128 v97;
  unint64_t v98;
  id v99;
  _BYTE v100[16];

  v11 = objc_msgSend(a1, sel_originalItem);
  v12 = v11;
  if (v11)
  {
    v13 = objc_msgSend(v11, sel_uniqueID);
    if (v13)
    {
      v14 = v13;
      v79 = a2;
      v82 = a5;
      v83 = a6;
      v85 = sub_2376F2BE0();
      v16 = v15;

      v17 = v12;
      goto LABEL_6;
    }

LABEL_10:
    if (qword_2542B7768 != -1)
      swift_once();
    v29 = sub_2376F2BA4();
    __swift_project_value_buffer(v29, (uint64_t)qword_2542B77D0);
    v87 = a1;
    v30 = sub_2376F2B8C();
    v31 = sub_2376F2CE8();
    if (!os_log_type_enabled(v30, v31))
    {

      return;
    }
    v32 = (uint8_t *)swift_slowAlloc();
    v33 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v32 = 138412290;
    *(_QWORD *)&v96 = v87;
    v34 = v87;
    sub_2376F2D30();
    *v33 = v87;

    _os_log_impl(&dword_2376DB000, v30, v31, "Ignoring pending event with no uniqueID (%@)", v32, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256808E18);
    swift_arrayDestroy();
    v35 = v33;
LABEL_14:
    MEMORY[0x23B81AA70](v35, -1, -1);
    MEMORY[0x23B81AA70](v32, -1, -1);

    return;
  }
  v18 = objc_msgSend(a1, sel_uniqueID);
  if (!v18)
    goto LABEL_10;
  v17 = v18;
  v79 = a2;
  v82 = a5;
  v83 = a6;
  v85 = sub_2376F2BE0();
  v16 = v19;
LABEL_6:

  v20 = (uint64_t *)(a4 + OBJC_IVAR____TtC21CalendarUIKitInternal22PendingReminderTracker_trackedEvents);
  swift_beginAccess();
  v21 = *v20;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_2376ED8F0(v85, v16, v21, v92);
  v23 = (void *)v92[0];
  v22 = (id)v92[1];
  v25 = v92[2];
  v24 = (void *)v92[3];
  v26 = v92[4];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2376F26C8((uint64_t)v92, (uint64_t)v95, &qword_256808F40);
  if (v95[0])
  {
    *(_QWORD *)&v89 = v23;
    *((_QWORD *)&v89 + 1) = v22;
    LODWORD(v90) = v25;
    *((_QWORD *)&v90 + 1) = v24;
    v91 = v26;
    v27 = v25;
    v28 = v22;
    if ((a3 & 1) == 0)
    {
      sub_2376F2680(v23, v22, v25, v24);
      swift_bridgeObjectRetain();
      v84 = v23;
      v81 = v22;
      v22 = v22;
      v42 = v24;
      v80 = v23;
LABEL_48:
      swift_beginAccess();
      sub_2376ED0D4((uint64_t)&v89, v82, v83);
      swift_endAccess();
      if ((a3 & 1) != 0)
      {
        v96 = v89;
        v97 = v90;
        v98 = v91;
        v67 = v89;
        sub_2376F26C8((uint64_t)&v97 + 8, (uint64_t)&v99, &qword_256808F48);
        sub_2376F26C8((uint64_t)&v98, (uint64_t)v100, &qword_256808F58);
        swift_beginAccess();
        v68 = (id)v67;
        v69 = *((id *)&v67 + 1);
        sub_2376F270C(&v99);
        sub_2376F2734((uint64_t)v100);
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v88 = *v20;
        *v20 = 0x8000000000000000;
        sub_2376F0D3C((uint64_t)&v96, v85, v16, isUniquelyReferenced_nonNull_native);
        *v20 = v88;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_endAccess();
        sub_2376F229C(v80, v81, v27, v24);
      }
      else
      {
        sub_2376F229C(v80, v81, v27, v24);
        swift_bridgeObjectRelease();
      }

      swift_bridgeObjectRelease();
      goto LABEL_52;
    }
    v84 = v23;
LABEL_18:
    v80 = v23;
    v81 = v28;
    if ((_DWORD)v27)
    {
      sub_2376F2680(v23, v28, v27, v24);
      v38 = v79;
      if ((_DWORD)v27 == v79)
      {
        swift_bridgeObjectRetain();
        v39 = v84;
        v40 = v22;
        v41 = v24;
      }
      else
      {
        v78 = v27;
        v52 = qword_2542B7768;
        v53 = v84;
        v54 = v22;
        v55 = v24;
        swift_bridgeObjectRetain();
        if (v52 != -1)
          swift_once();
        v56 = sub_2376F2BA4();
        __swift_project_value_buffer(v56, (uint64_t)qword_2542B77D0);
        swift_bridgeObjectRetain_n();
        v57 = sub_2376F2B8C();
        log = sub_2376F2CDC();
        if (os_log_type_enabled(v57, log))
        {
          v75 = v57;
          v58 = swift_slowAlloc();
          typea = swift_slowAlloc();
          *(_QWORD *)&v96 = typea;
          *(_DWORD *)v58 = 67109634;
          swift_beginAccess();
          sub_2376F2D30();
          *(_WORD *)(v58 + 8) = 1024;
          sub_2376F2D30();
          *(_WORD *)(v58 + 14) = 2080;
          swift_bridgeObjectRetain();
          sub_2376F0408(v85, v16, (uint64_t *)&v96);
          sub_2376F2D30();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_2376DB000, v75, log, "Updating tracked sequence number (%d->%d) for %s", (uint8_t *)v58, 0x18u);
          swift_arrayDestroy();
          MEMORY[0x23B81AA70](typea, -1, -1);
          MEMORY[0x23B81AA70](v58, -1, -1);

        }
        else
        {

          swift_bridgeObjectRelease_n();
        }
        v27 = v78;
      }
    }
    else
    {
      v77 = v27;
      sub_2376F2680(v23, v28, v27, v24);
      v43 = qword_2542B7768;
      v44 = v84;
      v45 = v22;
      v46 = v24;
      swift_bridgeObjectRetain();
      if (v43 != -1)
        swift_once();
      v47 = sub_2376F2BA4();
      __swift_project_value_buffer(v47, (uint64_t)qword_2542B77D0);
      swift_bridgeObjectRetain_n();
      v48 = sub_2376F2B8C();
      v49 = sub_2376F2CDC();
      if (os_log_type_enabled(v48, v49))
      {
        v76 = v22;
        v50 = (uint8_t *)swift_slowAlloc();
        v74 = (os_log_t)swift_slowAlloc();
        *(_QWORD *)&v96 = v74;
        *(_DWORD *)v50 = 136446210;
        type = v49;
        v51 = v50;
        swift_bridgeObjectRetain();
        v22 = v76;
        sub_2376F0408(v85, v16, (uint64_t *)&v96);
        sub_2376F2D30();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_2376DB000, v48, type, "Now tracking pending reminder with id %{public}s", v51, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x23B81AA70](v74, -1, -1);
        MEMORY[0x23B81AA70](v51, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      v27 = v77;
      v38 = v79;
    }
    swift_beginAccess();
    LODWORD(v90) = v38;
    if (v12)
    {
      if (v91)
      {
        swift_bridgeObjectRetain();
        if ((sub_2376EF0AC((uint64_t)a1, v91) & 1) == 0)
        {
          *(_QWORD *)&v96 = v91;
          v64 = a1;
          MEMORY[0x23B81A350]();
          if (*(_QWORD *)((v96 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v96 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
            sub_2376F2C40();
          sub_2376F2C58();
          sub_2376F2C28();
          v91 = v96;
        }
      }
      else
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_256808E20);
        v65 = swift_allocObject();
        *(_OWORD *)(v65 + 16) = xmmword_2376F38D0;
        *(_QWORD *)(v65 + 32) = a1;
        *(_QWORD *)&v96 = v65;
        sub_2376F2C28();
        v91 = v96;
        v66 = a1;
      }
      swift_bridgeObjectRelease();
    }
    goto LABEL_48;
  }
  if ((a3 & 1) == 0)
  {
LABEL_52:
    swift_bridgeObjectRelease();
    return;
  }
  v36 = a1;
  sub_2376F0ED0(v36, v93);
  v23 = (void *)v93[0];
  v22 = (id)v93[1];
  v27 = v93[2];
  v24 = (void *)v93[3];
  v37 = v93[4];
  sub_2376F26C8((uint64_t)v93, (uint64_t)v94, &qword_256808F40);
  if (v94[0])
  {
    *(_QWORD *)&v89 = v23;
    *((_QWORD *)&v89 + 1) = v22;
    LODWORD(v90) = v27;
    v84 = v23;
    *((_QWORD *)&v90 + 1) = v24;
    v91 = v37;
    v28 = v22;
    goto LABEL_18;
  }
  swift_bridgeObjectRelease();
  if (qword_2542B7768 != -1)
    swift_once();
  v59 = sub_2376F2BA4();
  __swift_project_value_buffer(v59, (uint64_t)qword_2542B77D0);
  v60 = v36;
  v30 = sub_2376F2B8C();
  v61 = sub_2376F2CE8();
  if (os_log_type_enabled(v30, v61))
  {
    v32 = (uint8_t *)swift_slowAlloc();
    v62 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v32 = 138412290;
    *(_QWORD *)&v96 = v60;
    v63 = v60;
    sub_2376F2D30();
    *v62 = v60;

    _os_log_impl(&dword_2376DB000, v30, v61, "Couldn't create tracked event info for event %@", v32, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256808E18);
    swift_arrayDestroy();
    v35 = v62;
    goto LABEL_14;
  }

}

uint64_t sub_2376F226C(uint64_t a1)
{
  sub_2376F229C(*(void **)a1, *(void **)(a1 + 8), *(_QWORD *)(a1 + 16), *(void **)(a1 + 24));
  return a1;
}

void *sub_2376F229C(void *result, void *a2, uint64_t a3, void *a4)
{
  if (result)
  {

    return (void *)swift_bridgeObjectRelease();
  }
  return result;
}

id *sub_2376F22E0(id *a1)
{

  return a1;
}

uint64_t method lookup function for PendingReminderTracker()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PendingReminderTracker.__allocating_init(eventStore:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t dispatch thunk of PendingReminderTracker.addPending(event:sequenceNumber:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of PendingReminderTracker.setOptimisticReminder(event:sequenceNumber:optimisticReminder:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of PendingReminderTracker.optimisticReminder(for:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of PendingReminderTracker.revertPending(event:sendNotification:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xB8))();
}

uint64_t initializeBufferWithCopyOfBuffer for PendingReminderTracker.TrackedEventInfo(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for PendingReminderTracker.TrackedEventInfo(id *a1)
{

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for PendingReminderTracker.TrackedEventInfo(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  id v9;

  v3 = *(void **)a2;
  v4 = *(void **)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  v6 = *(void **)(a2 + 24);
  v5 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v5;
  v7 = v3;
  v8 = v4;
  v9 = v6;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for PendingReminderTracker.TrackedEventInfo(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  v7 = *(void **)(a2 + 8);
  v8 = *(void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v7;
  v9 = v7;

  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  v10 = *(void **)(a1 + 24);
  v11 = *(void **)(a2 + 24);
  *(_QWORD *)(a1 + 24) = v11;
  v12 = v11;

  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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

uint64_t assignWithTake for PendingReminderTracker.TrackedEventInfo(uint64_t a1, uint64_t a2)
{
  void *v4;

  v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;

  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PendingReminderTracker.TrackedEventInfo(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 40))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PendingReminderTracker.TrackedEventInfo(uint64_t result, int a2, int a3)
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
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 40) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for PendingReminderTracker.TrackedEventInfo()
{
  return &type metadata for PendingReminderTracker.TrackedEventInfo;
}

uint64_t sub_2376F25E0(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542B77C8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2376F2620(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
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

id sub_2376F2680(id result, void *a2, uint64_t a3, void *a4)
{
  void *v5;
  id v6;
  id v7;

  if (result)
  {
    v5 = result;
    swift_bridgeObjectRetain();
    v6 = v5;
    v7 = a2;
    return a4;
  }
  return result;
}

uint64_t sub_2376F26C8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

id *sub_2376F270C(id *a1)
{
  id v2;

  v2 = *a1;
  return a1;
}

uint64_t sub_2376F2734(uint64_t a1)
{
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_2376F275C(uint64_t a1)
{
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_2376F2784()
{
  return MEMORY[0x24BDB4CD8]();
}

uint64_t sub_2376F2790()
{
  return MEMORY[0x24BDCB8E8]();
}

uint64_t sub_2376F279C()
{
  return MEMORY[0x24BDCB918]();
}

uint64_t sub_2376F27A8()
{
  return MEMORY[0x24BDCB930]();
}

uint64_t sub_2376F27B4()
{
  return MEMORY[0x24BDCBCC0]();
}

uint64_t sub_2376F27C0()
{
  return MEMORY[0x24BDCBCC8]();
}

uint64_t sub_2376F27CC()
{
  return MEMORY[0x24BDCBD08]();
}

uint64_t sub_2376F27D8()
{
  return MEMORY[0x24BDCBDE0]();
}

uint64_t sub_2376F27E4()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_2376F27F0()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_2376F27FC()
{
  return MEMORY[0x24BDCD820]();
}

uint64_t sub_2376F2808()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_2376F2814()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_2376F2820()
{
  return MEMORY[0x24BDCDA68]();
}

uint64_t sub_2376F282C()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_2376F2838()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_2376F2844()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_2376F2850()
{
  return MEMORY[0x24BDCE468]();
}

uint64_t sub_2376F285C()
{
  return MEMORY[0x24BDCE5D8]();
}

uint64_t sub_2376F2868()
{
  return MEMORY[0x24BDCE878]();
}

uint64_t sub_2376F2874()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_2376F2880()
{
  return MEMORY[0x24BDCEF80]();
}

uint64_t sub_2376F288C()
{
  return MEMORY[0x24BDCEFA0]();
}

uint64_t sub_2376F2898()
{
  return MEMORY[0x24BDCF040]();
}

uint64_t sub_2376F28A4()
{
  return MEMORY[0x24BDCF140]();
}

uint64_t sub_2376F28B0()
{
  return MEMORY[0x24BDCF160]();
}

uint64_t sub_2376F28BC()
{
  return MEMORY[0x24BDCF1D0]();
}

uint64_t sub_2376F28C8()
{
  return MEMORY[0x24BDCF290]();
}

uint64_t sub_2376F28D4()
{
  return MEMORY[0x24BDCF2D8]();
}

uint64_t sub_2376F28E0()
{
  return MEMORY[0x24BDCF4F0]();
}

uint64_t sub_2376F28EC()
{
  return MEMORY[0x24BDCF510]();
}

uint64_t sub_2376F28F8()
{
  return MEMORY[0x24BDFBBA0]();
}

uint64_t sub_2376F2904()
{
  return MEMORY[0x24BDFBBA8]();
}

uint64_t sub_2376F2910()
{
  return MEMORY[0x24BE7E000]();
}

uint64_t sub_2376F291C()
{
  return MEMORY[0x24BE7E008]();
}

uint64_t sub_2376F2928()
{
  return MEMORY[0x24BE7E010]();
}

uint64_t sub_2376F2934()
{
  return MEMORY[0x24BE7E018]();
}

uint64_t sub_2376F2940()
{
  return MEMORY[0x24BE7E0A0]();
}

uint64_t sub_2376F294C()
{
  return MEMORY[0x24BE7E0A8]();
}

uint64_t sub_2376F2958()
{
  return MEMORY[0x24BE7E0B0]();
}

uint64_t sub_2376F2964()
{
  return MEMORY[0x24BE7E0C0]();
}

uint64_t sub_2376F2970()
{
  return MEMORY[0x24BE7E0D0]();
}

uint64_t sub_2376F297C()
{
  return MEMORY[0x24BE7E0E0]();
}

uint64_t sub_2376F2988()
{
  return MEMORY[0x24BE7E0F0]();
}

uint64_t sub_2376F2994()
{
  return MEMORY[0x24BE7E0F8]();
}

uint64_t sub_2376F29A0()
{
  return MEMORY[0x24BE7E138]();
}

uint64_t sub_2376F29AC()
{
  return MEMORY[0x24BE7E140]();
}

uint64_t sub_2376F29B8()
{
  return MEMORY[0x24BE7E148]();
}

uint64_t sub_2376F29C4()
{
  return MEMORY[0x24BE7E160]();
}

uint64_t sub_2376F29D0()
{
  return MEMORY[0x24BE7E168]();
}

uint64_t sub_2376F29DC()
{
  return MEMORY[0x24BE7E170]();
}

uint64_t sub_2376F29E8()
{
  return MEMORY[0x24BE7E178]();
}

uint64_t sub_2376F29F4()
{
  return MEMORY[0x24BE7E180]();
}

uint64_t sub_2376F2A00()
{
  return MEMORY[0x24BE7E188]();
}

uint64_t sub_2376F2A0C()
{
  return MEMORY[0x24BE7E1A0]();
}

uint64_t sub_2376F2A18()
{
  return MEMORY[0x24BE7E1A8]();
}

uint64_t sub_2376F2A24()
{
  return MEMORY[0x24BE7E1B0]();
}

uint64_t sub_2376F2A30()
{
  return MEMORY[0x24BE7E1B8]();
}

uint64_t sub_2376F2A3C()
{
  return MEMORY[0x24BE7E1C0]();
}

uint64_t sub_2376F2A48()
{
  return MEMORY[0x24BE7E1C8]();
}

uint64_t sub_2376F2A54()
{
  return MEMORY[0x24BE7E1D0]();
}

uint64_t sub_2376F2A60()
{
  return MEMORY[0x24BE7E1F0]();
}

uint64_t sub_2376F2A6C()
{
  return MEMORY[0x24BE7E1F8]();
}

uint64_t sub_2376F2A78()
{
  return MEMORY[0x24BE7E200]();
}

uint64_t sub_2376F2A84()
{
  return MEMORY[0x24BE7E208]();
}

uint64_t sub_2376F2A90()
{
  return MEMORY[0x24BE7E210]();
}

uint64_t sub_2376F2A9C()
{
  return MEMORY[0x24BE7E218]();
}

uint64_t sub_2376F2AA8()
{
  return MEMORY[0x24BE7E220]();
}

uint64_t sub_2376F2AB4()
{
  return MEMORY[0x24BE7E228]();
}

uint64_t sub_2376F2AC0()
{
  return MEMORY[0x24BE7E230]();
}

uint64_t sub_2376F2ACC()
{
  return MEMORY[0x24BE7E238]();
}

uint64_t sub_2376F2AD8()
{
  return MEMORY[0x24BE7E240]();
}

uint64_t sub_2376F2AE4()
{
  return MEMORY[0x24BE7E248]();
}

uint64_t sub_2376F2AF0()
{
  return MEMORY[0x24BE7E250]();
}

uint64_t sub_2376F2AFC()
{
  return MEMORY[0x24BE7E258]();
}

uint64_t sub_2376F2B08()
{
  return MEMORY[0x24BE7E260]();
}

uint64_t sub_2376F2B14()
{
  return MEMORY[0x24BE7E268]();
}

uint64_t sub_2376F2B20()
{
  return MEMORY[0x24BE7E270]();
}

uint64_t sub_2376F2B2C()
{
  return MEMORY[0x24BE7E278]();
}

uint64_t sub_2376F2B38()
{
  return MEMORY[0x24BE7E280]();
}

uint64_t sub_2376F2B44()
{
  return MEMORY[0x24BE7E288]();
}

uint64_t sub_2376F2B50()
{
  return MEMORY[0x24BE7E290]();
}

uint64_t sub_2376F2B5C()
{
  return MEMORY[0x24BE7E298]();
}

uint64_t sub_2376F2B68()
{
  return MEMORY[0x24BE7E308]();
}

uint64_t sub_2376F2B74()
{
  return MEMORY[0x24BE7E310]();
}

uint64_t sub_2376F2B80()
{
  return MEMORY[0x24BE7E318]();
}

uint64_t sub_2376F2B8C()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_2376F2B98()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_2376F2BA4()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_2376F2BB0()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_2376F2BBC()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_2376F2BC8()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_2376F2BD4()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_2376F2BE0()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_2376F2BEC()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_2376F2BF8()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_2376F2C04()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_2376F2C10()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_2376F2C1C()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_2376F2C28()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_2376F2C34()
{
  return MEMORY[0x24BEE1140]();
}

uint64_t sub_2376F2C40()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_2376F2C4C()
{
  return MEMORY[0x24BEE11A0]();
}

uint64_t sub_2376F2C58()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_2376F2C64()
{
  return MEMORY[0x24BEE1220]();
}

uint64_t sub_2376F2C70()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_2376F2C7C()
{
  return MEMORY[0x24BEE6820]();
}

uint64_t sub_2376F2C88()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t sub_2376F2C94()
{
  return MEMORY[0x24BEE6830]();
}

uint64_t sub_2376F2CA0()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_2376F2CAC()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_2376F2CB8()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_2376F2CC4()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_2376F2CD0()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_2376F2CDC()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_2376F2CE8()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_2376F2CF4()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_2376F2D00()
{
  return MEMORY[0x24BE7EA00]();
}

uint64_t sub_2376F2D0C()
{
  return MEMORY[0x24BDC73E0]();
}

uint64_t sub_2376F2D18()
{
  return MEMORY[0x24BEE5BB8]();
}

uint64_t sub_2376F2D24()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_2376F2D30()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_2376F2D3C()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_2376F2D48()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_2376F2D54()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_2376F2D60()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_2376F2D6C()
{
  return MEMORY[0x24BEE22E0]();
}

uint64_t sub_2376F2D78()
{
  return MEMORY[0x24BEE2300]();
}

uint64_t sub_2376F2D84()
{
  return MEMORY[0x24BEE2330]();
}

uint64_t sub_2376F2D90()
{
  return MEMORY[0x24BEE2340]();
}

uint64_t sub_2376F2D9C()
{
  return MEMORY[0x24BEE2358]();
}

uint64_t sub_2376F2DA8()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_2376F2DB4()
{
  return MEMORY[0x24BEE23A8]();
}

uint64_t sub_2376F2DC0()
{
  return MEMORY[0x24BEE23E8]();
}

uint64_t sub_2376F2DCC()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_2376F2DD8()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_2376F2DE4()
{
  return MEMORY[0x24BEE24C8]();
}

uint64_t sub_2376F2DF0()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_2376F2DFC()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_2376F2E08()
{
  return MEMORY[0x24BEE2650]();
}

uint64_t sub_2376F2E14()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_2376F2E20()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_2376F2E2C()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_2376F2E38()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_2376F2E44()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_2376F2E50()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_2376F2E5C()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_2376F2E68()
{
  return MEMORY[0x24BEE2EA8]();
}

uint64_t sub_2376F2E74()
{
  return MEMORY[0x24BEE2EE0]();
}

uint64_t sub_2376F2E80()
{
  return MEMORY[0x24BEE2F18]();
}

uint64_t sub_2376F2E8C()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_2376F2E98()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_2376F2EA4()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_2376F2EB0()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_2376F2EBC()
{
  return MEMORY[0x24BEE3090]();
}

uint64_t sub_2376F2EC8()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_2376F2ED4()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_2376F2EE0()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_2376F2EEC()
{
  return MEMORY[0x24BEE70E0]();
}

uint64_t sub_2376F2EF8()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_2376F2F04()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_2376F2F10()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_2376F2F1C()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_2376F2F28()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_2376F2F34()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_2376F2F40()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_2376F2F4C()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_2376F2F58()
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
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

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
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

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
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

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x24BEE4C60]();
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

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
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

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

