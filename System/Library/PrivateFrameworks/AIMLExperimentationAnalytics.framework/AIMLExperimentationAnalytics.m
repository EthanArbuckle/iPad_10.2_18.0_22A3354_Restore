uint64_t sub_21C281760()
{
  swift_unknownObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for Instrumentation()
{
  return objc_opt_self();
}

uint64_t sub_21C2817A4()
{
  uint64_t v0;

  v0 = sub_21C28AF78();
  __swift_allocate_value_buffer(v0, qword_2552543B0);
  __swift_project_value_buffer(v0, (uint64_t)qword_2552543B0);
  return sub_21C28AF54();
}

uint64_t sub_21C2817F0(int a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)(v5 + 112) = a4;
  *(_QWORD *)(v5 + 120) = v4;
  *(_QWORD *)(v5 + 96) = a2;
  *(_QWORD *)(v5 + 104) = a3;
  *(_DWORD *)(v5 + 128) = a1;
  return OUTLINED_FUNCTION_7();
}

uint64_t sub_21C281854()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  id v9;
  unsigned int v10;
  id v11;
  char isEscapingClosureAtFileLocation;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v20;
  unsigned int v21;

  v1 = *(_QWORD *)(v0 + 112);
  v2 = *(_QWORD *)(v0 + 120);
  v4 = *(void **)(v0 + 96);
  v3 = *(_QWORD *)(v0 + 104);
  v21 = *(_DWORD *)(v0 + 128);
  *(_QWORD *)(v0 + 88) = MEMORY[0x24BEE4AF8];
  v5 = *(void **)(v2 + 16);
  v6 = (_QWORD *)OUTLINED_FUNCTION_30();
  v6[2] = v2;
  v6[3] = v4;
  v6[4] = v3;
  v6[5] = v1;
  v20 = (_QWORD *)(v0 + 88);
  v6[6] = v0 + 88;
  v7 = OUTLINED_FUNCTION_30();
  *(_QWORD *)(v0 + 16) = MEMORY[0x24BDAC760];
  *(_QWORD *)(v7 + 16) = sub_21C283824;
  *(_QWORD *)(v7 + 24) = v6;
  *(_QWORD *)(v0 + 48) = sub_21C283844;
  *(_QWORD *)(v0 + 56) = v7;
  *(_QWORD *)(v0 + 24) = 1107296256;
  *(_QWORD *)(v0 + 32) = sub_21C282648;
  *(_QWORD *)(v0 + 40) = &block_descriptor_6;
  v8 = _Block_copy((const void *)(v0 + 16));
  swift_retain();
  v9 = v4;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  *(_QWORD *)(v0 + 16) = 0;
  v10 = objc_msgSend(v5, sel_enumerateActiveExperimentsForEnvironment_error_block_, v21, v0 + 16, v8);
  _Block_release(v8);
  v11 = *(id *)(v0 + 16);
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  if ((isEscapingClosureAtFileLocation & 1) != 0)
  {
    __break(1u);
LABEL_11:
    swift_once();
    goto LABEL_4;
  }
  if (!v10)
  {
    sub_21C28AF30();

    swift_willThrow();
    swift_bridgeObjectRelease();
    swift_release();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  if (qword_253F823E0 != -1)
    goto LABEL_11;
LABEL_4:
  v13 = OUTLINED_FUNCTION_11();
  v14 = __swift_project_value_buffer(v13, (uint64_t)qword_253F824C0);
  sub_21C28AFA8();
  v15 = OUTLINED_FUNCTION_8();
  if (OUTLINED_FUNCTION_31(v15))
  {
    v16 = (uint8_t *)OUTLINED_FUNCTION_1();
    *(_DWORD *)v16 = 134217984;
    OUTLINED_FUNCTION_14();
    if (*v20 >> 62)
    {
      swift_bridgeObjectRetain();
      v17 = sub_21C28B1F4();
      swift_bridgeObjectRelease();
    }
    else
    {
      v17 = *(_QWORD *)((*v20 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    *(_QWORD *)(v0 + 16) = v17;
    sub_21C28B17C();
    OUTLINED_FUNCTION_16(&dword_21C280000, v14, v15, "%ld experiment/s with factor", v16);
    OUTLINED_FUNCTION_0();
  }

  OUTLINED_FUNCTION_14();
  v18 = *(_QWORD *)(v0 + 88);
  swift_release();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v18);
}

void sub_21C281B9C(void *a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, unint64_t a6, _QWORD *a7)
{
  char v9;
  id v10;

  sub_21C281C10((uint64_t)a1, a4, a5, a6);
  if ((v9 & 1) != 0)
  {
    v10 = a1;
    MEMORY[0x220777B24]();
    sub_21C283654(*(_QWORD *)((*a7 & 0xFFFFFFFFFFFFF8) + 0x10));
    sub_21C28B0E0();
    sub_21C28B0C8();
  }
}

void sub_21C281C10(uint64_t a1, void *a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  id v14;
  unint64_t v15;
  id v16;
  uint64_t v17;
  unint64_t v18;
  id v19;
  void *v20;
  void *v21;
  NSObject *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  os_log_type_t v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  id v57;
  id v58;
  id v59;
  id v60;
  os_log_type_t v61;
  uint64_t v62;
  uint64_t v63;
  id v64;
  uint64_t v65;
  unint64_t v66;
  unint64_t v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  os_log_type_t v81;
  uint64_t v82;
  id v83;
  uint64_t v84;
  uint64_t v85;
  id v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  unint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  id v94;
  NSObject *v95;
  os_log_type_t v96;
  uint8_t *v97;
  id v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  int v102;
  id v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109[2];

  v105 = a3;
  v106 = OUTLINED_FUNCTION_11();
  v104 = *(_QWORD *)(v106 - 8);
  v8 = MEMORY[0x24BDAC7A8](v106);
  v10 = (char *)&v101 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v8);
  v13 = (char *)&v101 - v12;
  v14 = OUTLINED_FUNCTION_34(v11, sel_namespaces);
  sub_21C283738();
  v15 = sub_21C28B0BC();

  if (v15 >> 62)
  {
    swift_bridgeObjectRetain();
    v16 = (id)sub_21C28B1F4();
    OUTLINED_FUNCTION_3();
  }
  else
  {
    v16 = *(id *)((v15 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v17 = OUTLINED_FUNCTION_3();
  if (!v16)
    goto LABEL_33;
  v16 = OUTLINED_FUNCTION_34(v17, sel_namespaces);
  v18 = sub_21C28B0BC();

  if (v18 >> 62)
  {
    swift_bridgeObjectRetain();
    v93 = sub_21C28B1F4();
    OUTLINED_FUNCTION_3();
    if (v93)
      goto LABEL_6;
    goto LABEL_32;
  }
  if (!*(_QWORD *)((v18 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_32:
    OUTLINED_FUNCTION_3();
LABEL_33:
    if (qword_253F823E0 != -1)
      swift_once();
    __swift_project_value_buffer(v106, (uint64_t)qword_253F824C0);
    v94 = OUTLINED_FUNCTION_17();
    v95 = sub_21C28AFA8();
    v96 = sub_21C28B110();
    if (os_log_type_enabled(v95, v96))
    {
      v97 = (uint8_t *)OUTLINED_FUNCTION_1();
      v109[0] = OUTLINED_FUNCTION_1();
      *(_DWORD *)v97 = 136315138;
      v98 = objc_msgSend(v94, sel_experimentId);
      v99 = OUTLINED_FUNCTION_28();

      v107 = OUTLINED_FUNCTION_20(v99, v100, v109);
      sub_21C28B17C();

      OUTLINED_FUNCTION_3();
      OUTLINED_FUNCTION_16(&dword_21C280000, v95, v96, "No namespaces for experiment %s", v97);
      OUTLINED_FUNCTION_27();
      OUTLINED_FUNCTION_0();
    }

    return;
  }
LABEL_6:
  sub_21C28AD58(0, (v18 & 0xC000000000000001) == 0, v18);
  if ((v18 & 0xC000000000000001) != 0)
    v19 = (id)MEMORY[0x220777C38](0, v18);
  else
    v19 = *(id *)(v18 + 32);
  v20 = v19;
  OUTLINED_FUNCTION_3();
  v21 = *(void **)(v4 + 24);
  v22 = sub_21C28B044();
  v23 = objc_msgSend(v20, sel_name);
  if (!v23)
  {
    sub_21C28B050();
    v23 = (id)sub_21C28B044();
    OUTLINED_FUNCTION_6();
  }
  v24 = objc_msgSend(v21, sel_levelForFactor_withNamespaceName_, v22, v23);

  if (v24)
  {
    sub_21C283680(v24);
    if (v25)
    {
      v26 = v25;
      v105 = (uint64_t)v20;
      v27 = sub_21C28B068();
      v29 = v28;
      v30 = OUTLINED_FUNCTION_22();
      v109[0] = v27;
      v109[1] = v29;
      v31 = OUTLINED_FUNCTION_36(v30, sel_UUIDString);
      OUTLINED_FUNCTION_26();

      v32 = sub_21C28B068();
      v34 = v33;
      OUTLINED_FUNCTION_6();
      v107 = v32;
      v108 = v34;
      sub_21C2837B4();
      v35 = OUTLINED_FUNCTION_25();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_5();
      if ((v35 & 1) == 0)
      {
        v73 = v106;
        v74 = v104;
        if (qword_253F823E0 != -1)
          swift_once();
        v75 = __swift_project_value_buffer(v73, (uint64_t)qword_253F824C0);
        OUTLINED_FUNCTION_39((uint64_t)v10, v75, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v74 + 16));
        v76 = a2;
        v77 = OUTLINED_FUNCTION_17();
        v78 = v24;
        v79 = (id)v35;
        v80 = v77;
        v13 = (char *)v78;
        sub_21C28AFA8();
        v81 = OUTLINED_FUNCTION_8();
        if (!OUTLINED_FUNCTION_12(v81))
        {

          OUTLINED_FUNCTION_18();
          (*(void (**)(char *, uint64_t))(v74 + 8))(v10, v73);
          return;
        }
        v102 = (int)v77;
        v82 = OUTLINED_FUNCTION_1();
        v101 = OUTLINED_FUNCTION_1();
        v109[0] = v101;
        *(_DWORD *)v82 = 136315650;
        v83 = objc_msgSend(v79, sel_UUIDString, v101);
        OUTLINED_FUNCTION_28();
        OUTLINED_FUNCTION_33();
        v84 = OUTLINED_FUNCTION_21();
        OUTLINED_FUNCTION_4(v84);

        v85 = OUTLINED_FUNCTION_22();
        *(_WORD *)(v82 + 12) = 2080;
        v86 = OUTLINED_FUNCTION_36(v85, sel_experimentId);
        sub_21C28B050();
        OUTLINED_FUNCTION_32();
        v88 = OUTLINED_FUNCTION_20(a1, v87, v109);
        OUTLINED_FUNCTION_2(v88);

        OUTLINED_FUNCTION_3();
        *(_WORD *)(v82 + 22) = 2080;
        v89 = sub_21C283680(v13);
        if (v90)
        {
          v91 = OUTLINED_FUNCTION_19(v89, v90);
          OUTLINED_FUNCTION_2(v91);

          OUTLINED_FUNCTION_5();
          OUTLINED_FUNCTION_10(&dword_21C280000, v92, (os_log_type_t)v102, "No codePathID \"%s\" in experiment %s. TRILevel stringValue \"%s\"");
          OUTLINED_FUNCTION_9();
          OUTLINED_FUNCTION_0();
        }
        goto LABEL_41;
      }
      v36 = v106;
      v37 = v104;
      if (qword_253F823E0 != -1)
        swift_once();
      v38 = __swift_project_value_buffer(v36, (uint64_t)qword_253F824C0);
      OUTLINED_FUNCTION_39((uint64_t)v13, v38, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v37 + 16));
      v39 = a2;
      v40 = OUTLINED_FUNCTION_17();
      v41 = v24;
      v42 = (id)v35;
      v43 = v40;
      v10 = (char *)v41;
      sub_21C28AFA8();
      v44 = OUTLINED_FUNCTION_8();
      if (!OUTLINED_FUNCTION_12(v44))
      {

        OUTLINED_FUNCTION_18();
        (*(void (**)(char *, uint64_t))(v37 + 8))(v13, v36);
        return;
      }
      v102 = (int)v40;
      v45 = OUTLINED_FUNCTION_1();
      v101 = OUTLINED_FUNCTION_1();
      v109[0] = v101;
      *(_DWORD *)v45 = 136315650;
      v46 = objc_msgSend(v42, sel_UUIDString, v101);
      OUTLINED_FUNCTION_28();
      OUTLINED_FUNCTION_33();
      v47 = OUTLINED_FUNCTION_21();
      OUTLINED_FUNCTION_4(v47);

      v48 = OUTLINED_FUNCTION_22();
      *(_WORD *)(v45 + 12) = 2080;
      v49 = OUTLINED_FUNCTION_36(v48, sel_experimentId);
      sub_21C28B050();
      OUTLINED_FUNCTION_32();
      v51 = OUTLINED_FUNCTION_20(a1, v50, v109);
      OUTLINED_FUNCTION_2(v51);

      OUTLINED_FUNCTION_3();
      *(_WORD *)(v45 + 22) = 2080;
      v52 = sub_21C283680(v10);
      if (v53)
      {
        v54 = OUTLINED_FUNCTION_19(v52, v53);
        OUTLINED_FUNCTION_2(v54);

        OUTLINED_FUNCTION_5();
        OUTLINED_FUNCTION_10(&dword_21C280000, v55, (os_log_type_t)v102, "CodePathID \"%s\" in experiment %s. TRILevel stringValue \"%s\"");
        OUTLINED_FUNCTION_9();
        OUTLINED_FUNCTION_0();
      }
    }
    else
    {
      __break(1u);
    }

    __break(1u);
LABEL_41:

    __break(1u);
    return;
  }
  v56 = v20;
  if (qword_253F823E0 != -1)
    swift_once();
  __swift_project_value_buffer(v106, (uint64_t)qword_253F824C0);
  v57 = OUTLINED_FUNCTION_17();
  v58 = v56;
  OUTLINED_FUNCTION_24();
  v59 = v57;
  v60 = v58;
  sub_21C28AFA8();
  v61 = OUTLINED_FUNCTION_8();
  if (os_log_type_enabled(v22, v61))
  {
    v62 = OUTLINED_FUNCTION_1();
    v63 = OUTLINED_FUNCTION_1();
    v106 = v63;
    v109[0] = v63;
    *(_DWORD *)v62 = 136315650;
    v64 = OUTLINED_FUNCTION_34(v63, sel_experimentId);
    v65 = sub_21C28B050();
    v67 = v66;

    v107 = sub_21C28774C(v65, v67, v109);
    sub_21C28B17C();

    swift_bridgeObjectRelease();
    *(_WORD *)(v62 + 12) = 2080;
    v68 = objc_msgSend(v60, sel_name);
    v69 = sub_21C28B050();

    v71 = OUTLINED_FUNCTION_20(v69, v70, v109);
    OUTLINED_FUNCTION_13(v71);

    OUTLINED_FUNCTION_3();
    *(_WORD *)(v62 + 22) = 2080;
    swift_bridgeObjectRetain();
    v72 = sub_21C28774C(v105, a4, v109);
    OUTLINED_FUNCTION_13(v72);
    OUTLINED_FUNCTION_35();
    _os_log_impl(&dword_21C280000, v22, v61, "No TRILevel in experiment %s with namespace %s, for factor %s", (uint8_t *)v62, 0x20u);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_0();
  }

  OUTLINED_FUNCTION_23();
}

void sub_21C282648(uint64_t a1, void *a2)
{
  void (*v2)(void);
  id v3;

  v2 = *(void (**)(void))(a1 + 32);
  v3 = a2;
  v2();

}

uint64_t sub_21C28268C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;

  v6[14] = a5;
  v6[15] = v5;
  v6[12] = a3;
  v6[13] = a4;
  v6[11] = a2;
  v7 = sub_21C28AF78();
  v6[16] = v7;
  v6[17] = *(_QWORD *)(v7 - 8);
  v6[18] = swift_task_alloc();
  return OUTLINED_FUNCTION_7();
}

uint64_t sub_21C2826EC()
{
  uint64_t v0;
  unint64_t *v1;
  uint64_t v2;
  void *v3;
  uint64_t *v4;
  _UNKNOWN **v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t result;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  id v32;
  id v33;
  uint64_t v34;
  NSObject *v35;
  unint64_t v36;
  os_log_type_t v37;
  uint8_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unsigned int v42;
  uint64_t v43;
  uint64_t v44;
  unsigned int v45;
  void *v46;

  *(_QWORD *)(v0 + 72) = MEMORY[0x24BEE4AF8];
  v1 = (unint64_t *)(v0 + 72);
  v2 = *(_QWORD *)(*(_QWORD *)(v0 + 96) + 16);
  if (v2)
  {
    v41 = *(_QWORD *)(v0 + 136);
    v3 = *(void **)(*(_QWORD *)(v0 + 120) + 24);
    v4 = (uint64_t *)(swift_bridgeObjectRetain() + 40);
    v5 = &off_24E025000;
    v46 = v3;
    while (1)
    {
      v7 = *(v4 - 1);
      v6 = *v4;
      swift_bridgeObjectRetain();
      v8 = (void *)sub_21C28B044();
      v9 = (void *)OUTLINED_FUNCTION_15();
      v10 = objc_msgSend(v3, (SEL)v5[311], v8, v9);

      if (v10)
      {
        if (objc_msgSend(v10, sel_levelOneOfCase) == 11)
        {
          result = sub_21C283680(v10);
          if (!v12)
          {
            __break(1u);
            return result;
          }
          v13 = v12;
          v14 = *(void **)(v0 + 88);
          v15 = sub_21C28B068();
          v17 = v16;
          OUTLINED_FUNCTION_22();
          *(_QWORD *)(v0 + 40) = v15;
          *(_QWORD *)(v0 + 48) = v17;
          v18 = objc_msgSend(v14, sel_UUIDString);
          OUTLINED_FUNCTION_26();

          v19 = sub_21C28B068();
          v21 = v20;
          swift_bridgeObjectRelease();
          *(_QWORD *)(v0 + 56) = v19;
          *(_QWORD *)(v0 + 64) = v21;
          sub_21C2837B4();
          LOBYTE(v19) = OUTLINED_FUNCTION_25();
          OUTLINED_FUNCTION_5();
          swift_bridgeObjectRelease();
          if ((v19 & 1) != 0)
          {
            v22 = (void *)OUTLINED_FUNCTION_15();
            v3 = v46;
            v23 = objc_msgSend(v46, sel_experimentIdentifiersWithNamespaceName_, v22);

            if (v23)
            {
              v24 = (void *)OUTLINED_FUNCTION_15();
              v45 = objc_msgSend(v46, sel_compatibilityVersionWithNamespaceName_, v24);

              if (qword_255254220 != -1)
                swift_once();
              v25 = *(void **)(v0 + 144);
              v26 = __swift_project_value_buffer(*(_QWORD *)(v0 + 128), (uint64_t)qword_2552543B0);
              OUTLINED_FUNCTION_39((uint64_t)v25, v26, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v41 + 16));
              v27 = objc_msgSend(v23, sel_experimentId);
              v28 = sub_21C28B050();
              v43 = v29;
              v44 = v28;

              v42 = objc_msgSend(v23, sel_deploymentId);
              v30 = objc_msgSend(v23, sel_treatmentId);
              OUTLINED_FUNCTION_26();

              __swift_instantiateConcreteTypeFromMangledName(&qword_253F82240);
              v31 = OUTLINED_FUNCTION_30();
              *(_OWORD *)(v31 + 16) = xmmword_21C28B7A0;
              sub_21C283738();
              *(_QWORD *)(v31 + 32) = sub_21C282C00(v7, v6, v45);
              sub_21C28B0C8();
              v32 = objc_allocWithZone(MEMORY[0x24BEBA920]);
              v33 = sub_21C283544(2u, (uint64_t)v25, v44, v43, v42);
              MEMORY[0x220777B24]();
              if (*(_QWORD *)((*(_QWORD *)(v0 + 72) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*(_QWORD *)(v0 + 72) & 0xFFFFFFFFFFFFFF8)
                                                                                                 + 0x18) >> 1)
                sub_21C28B0D4();
              sub_21C28B0E0();
              sub_21C28B0C8();

LABEL_16:
              v3 = v46;
            }
            else
            {

              OUTLINED_FUNCTION_6();
            }
            v5 = &off_24E025000;
            goto LABEL_18;
          }

          OUTLINED_FUNCTION_6();
          goto LABEL_16;
        }
        OUTLINED_FUNCTION_6();

      }
      else
      {
        OUTLINED_FUNCTION_6();
      }
LABEL_18:
      v4 += 2;
      if (!--v2)
      {
        swift_bridgeObjectRelease();
        v1 = (unint64_t *)(v0 + 72);
        break;
      }
    }
  }
  if (qword_253F823E0 != -1)
    swift_once();
  v34 = OUTLINED_FUNCTION_11();
  v35 = __swift_project_value_buffer(v34, (uint64_t)qword_253F824C0);
  v36 = *v1;
  OUTLINED_FUNCTION_24();
  sub_21C28AFA8();
  v37 = OUTLINED_FUNCTION_8();
  if (OUTLINED_FUNCTION_31(v37))
  {
    v38 = (uint8_t *)OUTLINED_FUNCTION_1();
    *(_DWORD *)v38 = 134217984;
    if (v36 >> 62)
    {
      swift_bridgeObjectRetain();
      v39 = sub_21C28B1F4();
      OUTLINED_FUNCTION_5();
    }
    else
    {
      v39 = *(_QWORD *)((v36 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    OUTLINED_FUNCTION_5();
    *(_QWORD *)(v0 + 80) = v39;
    sub_21C28B17C();
    OUTLINED_FUNCTION_5();
    OUTLINED_FUNCTION_16(&dword_21C280000, v35, v37, "%ld experiment/s with factor", v38);
    OUTLINED_FUNCTION_0();
  }
  OUTLINED_FUNCTION_23();

  OUTLINED_FUNCTION_14();
  v40 = *(_QWORD *)(v0 + 72);
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v40);
}

id sub_21C282C00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4;
  void *v5;
  id v6;

  v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v5 = (void *)sub_21C28B044();
  swift_bridgeObjectRelease();
  v6 = objc_msgSend(v4, sel_initWithName_compatibilityVersion_, v5, a3);

  return v6;
}

id sub_21C282C78()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t *v28;
  uint64_t inited;
  uint64_t v30;
  uint64_t v31;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  v1 = sub_21C28AF78();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v33 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *(void **)(v0 + 24);
  OUTLINED_FUNCTION_38();
  v6 = (void *)sub_21C28B044();
  v7 = objc_msgSend(v5, sel_experimentIdentifiersWithNamespaceName_, v6);

  if (v7)
  {
    v8 = OUTLINED_FUNCTION_38();
    v10 = sub_21C2830B0(v8, v9);
    if ((v10 & 0x100000000) != 0)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_253F82280);
      inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_21C28B7B0;
      *(_QWORD *)(inited + 32) = sub_21C28B050();
      *(_QWORD *)(inited + 40) = v30;
      *(_QWORD *)(inited + 72) = MEMORY[0x24BEE0D00];
      *(_QWORD *)(inited + 48) = 0xD000000000000023;
      *(_QWORD *)(inited + 56) = 0x800000021C28B970;
      v31 = sub_21C28B02C();
      v21 = objc_allocWithZone(MEMORY[0x24BDD1540]);
      sub_21C287104(0xD000000000000027, 0x800000021C28B940, -1, v31);
      swift_willThrow();

    }
    else
    {
      v11 = v10;
      if (qword_255254220 != -1)
        swift_once();
      v12 = __swift_project_value_buffer(v1, (uint64_t)qword_2552543B0);
      (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v12, v1);
      v13 = objc_msgSend(v7, sel_experimentId);
      v14 = sub_21C28B050();
      v34 = v15;
      v35 = v14;

      HIDWORD(v33) = objc_msgSend(v7, sel_deploymentId);
      v16 = objc_msgSend(v7, sel_treatmentId);
      sub_21C28B050();

      __swift_instantiateConcreteTypeFromMangledName(&qword_253F82240);
      v17 = swift_allocObject();
      *(_OWORD *)(v17 + 16) = xmmword_21C28B7A0;
      sub_21C283738();
      swift_bridgeObjectRetain();
      v18 = OUTLINED_FUNCTION_38();
      *(_QWORD *)(v17 + 32) = sub_21C282C00(v18, v19, v11);
      v37 = v17;
      sub_21C28B0C8();
      v20 = objc_allocWithZone(MEMORY[0x24BEBA920]);
      v21 = sub_21C283544(2u, (uint64_t)v4, v35, v34, HIDWORD(v33));

    }
  }
  else
  {
    if (qword_253F823E0 != -1)
      swift_once();
    v22 = sub_21C28AFB4();
    __swift_project_value_buffer(v22, (uint64_t)qword_253F824C0);
    swift_bridgeObjectRetain_n();
    v23 = sub_21C28AFA8();
    v24 = sub_21C28B110();
    if (os_log_type_enabled(v23, v24))
    {
      v25 = (uint8_t *)swift_slowAlloc();
      v37 = swift_slowAlloc();
      *(_DWORD *)v25 = 136315138;
      swift_bridgeObjectRetain();
      v26 = OUTLINED_FUNCTION_38();
      v36 = sub_21C28774C(v26, v27, v28);
      sub_21C28B17C();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_21C280000, v23, v24, "No active experiment for namespace %s", v25, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_0();
    }

    swift_bridgeObjectRelease_n();
    return 0;
  }
  return v21;
}

unint64_t sub_21C2830B0(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  void *v5;
  void *v6;
  unsigned int v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v13;

  v5 = *(void **)(v2 + 24);
  v6 = (void *)sub_21C28B044();
  v7 = objc_msgSend(v5, sel_compatibilityVersionWithNamespaceName_, v6);

  if (!v7)
  {
    if (qword_253F823E0 != -1)
      swift_once();
    v8 = OUTLINED_FUNCTION_11();
    __swift_project_value_buffer(v8, (uint64_t)qword_253F824C0);
    OUTLINED_FUNCTION_24();
    v9 = sub_21C28AFA8();
    v10 = sub_21C28B11C();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = (uint8_t *)OUTLINED_FUNCTION_1();
      v13 = OUTLINED_FUNCTION_1();
      *(_DWORD *)v11 = 136315138;
      swift_bridgeObjectRetain();
      sub_21C28774C(a1, a2, &v13);
      OUTLINED_FUNCTION_37();
      sub_21C28B17C();
      OUTLINED_FUNCTION_35();
      OUTLINED_FUNCTION_16(&dword_21C280000, v9, v10, "%s doesn't exist on the device.", v11);
      OUTLINED_FUNCTION_27();
      OUTLINED_FUNCTION_0();
    }

    OUTLINED_FUNCTION_23();
  }
  return v7 | ((unint64_t)(v7 == 0) << 32);
}

id sub_21C28325C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v15;

  v5 = *(void **)(v2 + 24);
  v6 = (void *)sub_21C28B044();
  v7 = objc_msgSend(v5, sel_rolloutIdentifiersWithNamespaceName_, v6);

  if (v7)
  {
    sub_21C28AD7C(v7);
    v9 = v8;
    swift_bridgeObjectRelease();
    if (v9)
      return v7;

  }
  if (qword_253F823E0 != -1)
    swift_once();
  v10 = OUTLINED_FUNCTION_11();
  __swift_project_value_buffer(v10, (uint64_t)qword_253F824C0);
  OUTLINED_FUNCTION_24();
  v11 = sub_21C28AFA8();
  v12 = sub_21C28B11C();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)OUTLINED_FUNCTION_1();
    v15 = OUTLINED_FUNCTION_1();
    *(_DWORD *)v13 = 136315138;
    swift_bridgeObjectRetain();
    sub_21C28774C(a1, a2, &v15);
    OUTLINED_FUNCTION_37();
    sub_21C28B17C();
    OUTLINED_FUNCTION_35();
    OUTLINED_FUNCTION_16(&dword_21C280000, v11, v12, "No active rollout exists for %s", v13);
    OUTLINED_FUNCTION_27();
    OUTLINED_FUNCTION_0();
  }

  OUTLINED_FUNCTION_23();
  return 0;
}

id sub_21C283414(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[6];

  v9 = *(void **)(v5 + 24);
  v10 = (void *)sub_21C28B044();
  v14[4] = a4;
  v14[5] = a5;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 1107296256;
  v14[2] = sub_21C2834E4;
  v14[3] = &block_descriptor;
  v11 = _Block_copy(v14);
  swift_retain();
  swift_release();
  v12 = objc_msgSend(v9, sel_addUpdateHandlerForNamespaceName_queue_usingBlock_, v10, a3, v11);
  _Block_release(v11);

  return v12;
}

uint64_t sub_21C2834E4(uint64_t a1)
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

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

id sub_21C283544(unsigned __int8 a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v5;
  void *v6;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;

  v6 = v5;
  v10 = (void *)sub_21C28AF48();
  v11 = (void *)sub_21C28B044();
  swift_bridgeObjectRelease();
  v12 = (void *)sub_21C28B044();
  swift_bridgeObjectRelease();
  sub_21C283738();
  v13 = (void *)sub_21C28B0B0();
  swift_bridgeObjectRelease();
  v14 = objc_msgSend(v6, sel_initWithType_date_experimentId_deploymentId_treatmentId_namespaces_, a1, v10, v11, a5, v12, v13);

  v15 = sub_21C28AF78();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 8))(a2, v15);
  return v14;
}

uint64_t sub_21C283654(uint64_t result)
{
  _QWORD *v1;

  if (result + 1 > *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFF8) + 0x18) >> 1)
    return sub_21C28B0D4();
  return result;
}

uint64_t sub_21C283680(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(a1, sel_stringValue);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = sub_21C28B050();

  return v3;
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

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x220777F74]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_21C283738()
{
  unint64_t result;

  result = qword_2552543C8;
  if (!qword_2552543C8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, &qword_2552543C8);
  }
  return result;
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

unint64_t sub_21C2837B4()
{
  unint64_t result;

  result = qword_253F82290;
  if (!qword_253F82290)
  {
    result = MEMORY[0x220777F8C](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_253F82290);
  }
  return result;
}

uint64_t sub_21C2837F0()
{
  uint64_t v0;

  swift_release();

  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_21C283824(void *a1, uint64_t a2)
{
  uint64_t v2;

  sub_21C281B9C(a1, a2, *(_QWORD *)(v2 + 16), *(void **)(v2 + 24), *(_QWORD *)(v2 + 32), *(_QWORD *)(v2 + 40), *(_QWORD **)(v2 + 48));
}

uint64_t sub_21C283834()
{
  return swift_deallocObject();
}

uint64_t sub_21C283844()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

void OUTLINED_FUNCTION_0()
{
  JUMPOUT(0x220777FF8);
}

uint64_t OUTLINED_FUNCTION_1()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_2(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 112) = a1;
  return sub_21C28B17C();
}

uint64_t OUTLINED_FUNCTION_3()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_4(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 112) = a1;
  return sub_21C28B17C();
}

uint64_t OUTLINED_FUNCTION_5()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_6()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_7()
{
  return swift_task_switch();
}

uint64_t OUTLINED_FUNCTION_8()
{
  return sub_21C28B110();
}

uint64_t OUTLINED_FUNCTION_9()
{
  return swift_arrayDestroy();
}

void OUTLINED_FUNCTION_10(void *a1, uint64_t a2, os_log_type_t a3, const char *a4)
{
  uint8_t *v4;
  uint64_t v5;

  _os_log_impl(a1, *(os_log_t *)(v5 - 144), a3, a4, v4, 0x20u);
}

uint64_t OUTLINED_FUNCTION_11()
{
  return sub_21C28AFB4();
}

BOOL OUTLINED_FUNCTION_12(os_log_type_t a1)
{
  NSObject *v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 144) = v1;
  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_13(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 112) = a1;
  return sub_21C28B17C();
}

uint64_t OUTLINED_FUNCTION_14()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_15()
{
  return sub_21C28B044();
}

void OUTLINED_FUNCTION_16(void *a1, NSObject *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
  _os_log_impl(a1, a2, a3, a4, a5, 0xCu);
}

id OUTLINED_FUNCTION_17()
{
  void *v0;

  return v0;
}

void OUTLINED_FUNCTION_18()
{
  uint64_t v0;

}

uint64_t OUTLINED_FUNCTION_19(uint64_t a1, unint64_t a2)
{
  uint64_t v2;

  return sub_21C28774C(a1, a2, (uint64_t *)(v2 - 96));
}

uint64_t OUTLINED_FUNCTION_20(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  unint64_t v3;

  return sub_21C28774C(a1, v3, a3);
}

uint64_t OUTLINED_FUNCTION_21()
{
  unint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return sub_21C28774C(v1, v0, (uint64_t *)(v2 - 96));
}

uint64_t OUTLINED_FUNCTION_22()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_23()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_24()
{
  return swift_bridgeObjectRetain_n();
}

uint64_t OUTLINED_FUNCTION_25()
{
  return sub_21C28B194();
}

uint64_t OUTLINED_FUNCTION_26()
{
  return sub_21C28B050();
}

uint64_t OUTLINED_FUNCTION_27()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_28()
{
  return sub_21C28B050();
}

uint64_t OUTLINED_FUNCTION_30()
{
  return swift_allocObject();
}

BOOL OUTLINED_FUNCTION_31(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

void OUTLINED_FUNCTION_32()
{
  void *v0;

}

void OUTLINED_FUNCTION_33()
{
  void *v0;

}

id OUTLINED_FUNCTION_34(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

uint64_t OUTLINED_FUNCTION_35()
{
  return swift_bridgeObjectRelease_n();
}

id OUTLINED_FUNCTION_36(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

uint64_t OUTLINED_FUNCTION_38()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_39@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

uint64_t dispatch thunk of ExperimentationAnalytics.emitTrigger(for:requestID:)()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(void);

  OUTLINED_FUNCTION_3_0();
  v1 = (_QWORD *)OUTLINED_FUNCTION_2_0();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_1_0(v1, (uint64_t)sub_21C283CC4);
  return OUTLINED_FUNCTION_0_0(v2, v3, v4, v5, v6);
}

uint64_t dispatch thunk of ExperimentationAnalytics.cacheTrialExperiments(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);

  v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(a3 + 16) + *(_QWORD *)(a3 + 16));
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_21C283CC4;
  return v9(a1, a2, a3);
}

uint64_t dispatch thunk of ExperimentationAnalytics.emitTriggerFromCache(for:requestID:)()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(void);

  OUTLINED_FUNCTION_3_0();
  v1 = (_QWORD *)OUTLINED_FUNCTION_2_0();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_1_0(v1, (uint64_t)sub_21C283CC4);
  return OUTLINED_FUNCTION_0_0(v2, v3, v4, v5, v6);
}

uint64_t dispatch thunk of ExperimentationAnalytics.cacheTrialExperimentIdentifiers(for:namespaces:)()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(void);

  OUTLINED_FUNCTION_3_0();
  v1 = (_QWORD *)OUTLINED_FUNCTION_2_0();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_1_0(v1, (uint64_t)sub_21C283CC4);
  return OUTLINED_FUNCTION_0_0(v2, v3, v4, v5, v6);
}

uint64_t dispatch thunk of ExperimentationAnalytics.startRolloutUpdateTracking(for:)()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(void);

  OUTLINED_FUNCTION_3_0();
  v1 = (_QWORD *)OUTLINED_FUNCTION_2_0();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_1_0(v1, (uint64_t)sub_21C283CC4);
  return OUTLINED_FUNCTION_0_0(v2, v3, v4, v5, v6);
}

uint64_t dispatch thunk of ExperimentationAnalytics.endRolloutUpdateTracking(for:)()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(void);

  OUTLINED_FUNCTION_3_0();
  v1 = (_QWORD *)OUTLINED_FUNCTION_2_0();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_1_0(v1, (uint64_t)sub_21C283CC4);
  return OUTLINED_FUNCTION_0_0(v2, v3, v4, v5, v6);
}

uint64_t dispatch thunk of ExperimentationAnalytics.emitTrigger(for:namespace:requestID:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  _QWORD *v13;
  uint64_t (*v15)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v13 = (_QWORD *)OUTLINED_FUNCTION_2_0();
  *(_QWORD *)(v6 + 16) = v13;
  *v13 = v6;
  v13[1] = sub_21C283C7C;
  return v15(a1, a2, a3, a4, a5, a6);
}

uint64_t sub_21C283C7C()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t OUTLINED_FUNCTION_0_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  return a5();
}

uint64_t OUTLINED_FUNCTION_1_0@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  *a1 = v2;
  a1[1] = a2;
  return v3;
}

uint64_t OUTLINED_FUNCTION_2_0()
{
  return swift_task_alloc();
}

void sub_21C283D24()
{
  qword_253F824B0 = 0x6874617065646F63;
  *(_QWORD *)algn_253F824B8 = 0xEB00000000736469;
}

id ExperimentationAnalyticsManager.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id ExperimentationAnalyticsManager.init()()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v13;
  uint64_t v14;
  objc_super v15;
  uint64_t v16;

  v1 = sub_21C28B140();
  v13 = *(_QWORD *)(v1 - 8);
  v14 = v1;
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_27_0();
  v4 = v3 - v2;
  sub_21C28B134();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_27_0();
  sub_21C28AFD8();
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_27_0();
  v5 = MEMORY[0x24BEE4B00];
  *(_QWORD *)&v0[OBJC_IVAR___AIMLExperimentationAnalyticsManagerInternal_experimentsForCodePathID] = MEMORY[0x24BEE4B00];
  *(_QWORD *)&v0[OBJC_IVAR___AIMLExperimentationAnalyticsManagerInternal_rolloutTrackingInfoForNamespace] = v5;
  v6 = OBJC_IVAR___AIMLExperimentationAnalyticsManagerInternal_lock;
  v7 = objc_allocWithZone(MEMORY[0x24BDD1648]);
  v8 = v0;
  *(_QWORD *)&v0[v6] = objc_msgSend(v7, sel_init);
  v9 = OBJC_IVAR___AIMLExperimentationAnalyticsManagerInternal_rolloutRegistrationLock;
  *(_QWORD *)&v8[v9] = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1648]), sel_init);
  type metadata accessor for Instrumentation();
  v10 = OUTLINED_FUNCTION_30();
  *(_QWORD *)(v10 + 16) = objc_msgSend((id)objc_opt_self(), sel_sharedStream);
  *(_QWORD *)&v8[OBJC_IVAR___AIMLExperimentationAnalyticsManagerInternal_instrumentation] = v10;
  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_30();
  *(_QWORD *)&v8[OBJC_IVAR___AIMLExperimentationAnalyticsManagerInternal_experimentation] = sub_21C28951C();
  v11 = objc_msgSend((id)objc_opt_self(), sel_standardUserDefaults);
  *(_QWORD *)&v8[OBJC_IVAR___AIMLExperimentationAnalyticsManagerInternal_userDefaults] = v11;
  sub_21C28917C(0, (unint64_t *)&unk_253F823F8);
  sub_21C28AFCC();
  v16 = MEMORY[0x24BEE4AF8];
  sub_21C288B1C((uint64_t *)&unk_253F82420, (void (*)(uint64_t))MEMORY[0x24BEE5688]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F82408);
  sub_21C288B54((uint64_t *)&unk_253F82410, &qword_253F82408);
  sub_21C28B1A0();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v13 + 104))(v4, *MEMORY[0x24BEE5750], v14);
  *(_QWORD *)&v8[OBJC_IVAR___AIMLExperimentationAnalyticsManagerInternal_queue] = sub_21C28B14C();

  v15.receiver = v8;
  v15.super_class = (Class)type metadata accessor for ExperimentationAnalyticsManager();
  return objc_msgSendSuper2(&v15, sel_init);
}

uint64_t sub_21C284068(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;

  v2[2] = a1;
  v2[3] = v1;
  v3 = (_QWORD *)swift_task_alloc();
  v2[4] = v3;
  v4 = OUTLINED_FUNCTION_32_0(v3, (uint64_t)sub_21C2840A8);
  return OUTLINED_FUNCTION_31_0(v4);
}

uint64_t sub_21C2840A8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_15_0();
  if (v1)
    return OUTLINED_FUNCTION_7_0(*(uint64_t (**)(void))(v3 + 8));
  *(_QWORD *)(v2 + 48) = v0;
  OUTLINED_FUNCTION_24_0();
  return OUTLINED_FUNCTION_0_1();
}

uint64_t sub_21C2840EC()
{
  uint64_t v0;
  char *v1;
  void *v2;
  void *v3;
  char *v4;
  id v5;
  uint64_t (*v6)(void);

  OUTLINED_FUNCTION_43();
  v2 = *(void **)(v0 + 16);
  v1 = *(char **)(v0 + 24);
  v3 = *(void **)&v1[OBJC_IVAR___AIMLExperimentationAnalyticsManagerInternal_lock];
  v4 = v1;
  v5 = v2;
  swift_bridgeObjectRetain();
  sub_21C284168(v3, v4, v5);
  swift_bridgeObjectRelease();
  v6 = (uint64_t (*)(void))OUTLINED_FUNCTION_40();
  return v6();
}

void sub_21C284168(void *a1, void *a2, void *a3)
{
  id v6;
  uint64_t v7;

  objc_msgSend(a1, sel_lock);
  swift_beginAccess();
  v6 = a3;
  v7 = swift_bridgeObjectRetain();
  sub_21C288610(v7, v6);
  swift_endAccess();

  objc_msgSend(a1, sel_unlock);
  swift_bridgeObjectRelease();

}

void sub_21C28422C(void *a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  objc_msgSend(a1, sel_lock);
  v11 = (uint64_t *)&a2[OBJC_IVAR___AIMLExperimentationAnalyticsManagerInternal_rolloutTrackingInfoForNamespace];
  swift_beginAccess();
  v12 = *v11;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v13 = sub_21C284B3C(a3, a4, v12);
  v15 = v14;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!v13)
  {
    sub_21C283414(a3, a4, *(_QWORD *)&a2[OBJC_IVAR___AIMLExperimentationAnalyticsManagerInternal_queue], a5, a6);
    swift_beginAccess();
    swift_bridgeObjectRetain();
    v17 = swift_unknownObjectRetain();
    sub_21C28867C(v17, 1, a3, a4);
    swift_endAccess();
    goto LABEL_5;
  }
  if (!__OFADD__(v15, 1))
  {
    swift_beginAccess();
    swift_bridgeObjectRetain();
    v16 = swift_unknownObjectRetain();
    sub_21C28867C(v16, v15 + 1, a3, a4);
    swift_endAccess();
LABEL_5:
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    objc_msgSend(a1, sel_unlock);
    swift_release();
    swift_bridgeObjectRelease();

    return;
  }
  __break(1u);
}

void sub_21C2843E8(void *a1, void *a2, uint64_t a3, unint64_t a4)
{
  objc_msgSend(a1, sel_lock);
  sub_21C286A48((uint64_t)a2, a3, a4);
  objc_msgSend(a1, sel_unlock);
  swift_bridgeObjectRelease();

}

void *sub_21C284470(void *a1, void *a2, void *a3)
{
  uint64_t v3;
  void *v8;

  objc_msgSend(a1, sel_lock);
  sub_21C2849C8((uint64_t)a2, a3, &v8);
  objc_msgSend(a1, sel_unlock);
  if (v3)
  {

  }
  else
  {

    a2 = v8;
  }
  return a2;
}

uint64_t sub_21C284574(void *a1, void *aBlock, void *a3)
{
  _QWORD *v3;
  id v6;
  _QWORD *v7;

  v3[2] = a1;
  v3[3] = a3;
  v3[4] = _Block_copy(aBlock);
  v6 = a1;
  a3;
  v7 = (_QWORD *)swift_task_alloc();
  v3[5] = v7;
  *v7 = v3;
  v7[1] = sub_21C2845F0;
  return sub_21C284068((uint64_t)v6);
}

uint64_t sub_21C2845F0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD *v5;

  OUTLINED_FUNCTION_26_0();
  v4 = *(void **)(v2 + 16);
  v3 = *(void **)(v2 + 24);
  OUTLINED_FUNCTION_10_0(v5);

  if (v0)
  {
    OUTLINED_FUNCTION_48();
    OUTLINED_FUNCTION_18_0();
    OUTLINED_FUNCTION_13_0();

  }
  else
  {
    OUTLINED_FUNCTION_12_0();
  }
  _Block_release(*(const void **)(v2 + 32));
  return OUTLINED_FUNCTION_42(*(uint64_t (**)(void))(v1 + 8));
}

uint64_t sub_21C28465C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char *v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v10;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255254540);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_21C28B104();
  __swift_storeEnumTagSinglePayload((uint64_t)v5, 1, 1, v6);
  v7 = (_QWORD *)swift_allocObject();
  v7[2] = 0;
  v7[3] = 0;
  v7[4] = a1;
  v7[5] = a2;
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = 0;
  v8[3] = 0;
  v8[4] = &unk_255254550;
  v8[5] = v7;
  sub_21C28729C((uint64_t)v5, (uint64_t)&unk_255254560, (uint64_t)v8);
  return swift_release();
}

uint64_t sub_21C284738()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_50();
  v1[2] = v2;
  v1[3] = v0;
  v3 = (_QWORD *)swift_task_alloc();
  v1[4] = v3;
  *v3 = v1;
  v3[1] = sub_21C284790;
  v4 = OUTLINED_FUNCTION_33_0();
  return sub_21C28506C(v4, v5);
}

uint64_t sub_21C284790()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_15_0();
  if (v1)
    return OUTLINED_FUNCTION_7_0(*(uint64_t (**)(void))(v3 + 8));
  *(_QWORD *)(v2 + 48) = v0;
  OUTLINED_FUNCTION_24_0();
  return OUTLINED_FUNCTION_0_1();
}

uint64_t sub_21C28484C(void *a1, int a2, void *aBlock, void *a4)
{
  _QWORD *v4;
  id v7;
  _QWORD *v8;

  v4[2] = a1;
  v4[3] = a4;
  v4[4] = _Block_copy(aBlock);
  v4[5] = sub_21C28B0BC();
  v7 = a1;
  a4;
  v8 = (_QWORD *)swift_task_alloc();
  v4[6] = v8;
  *v8 = v4;
  v8[1] = sub_21C2848E8;
  return sub_21C284738();
}

uint64_t sub_21C2848E8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD *v5;

  OUTLINED_FUNCTION_43();
  OUTLINED_FUNCTION_26_0();
  v4 = *(void **)(v2 + 16);
  v3 = *(void **)(v2 + 24);
  OUTLINED_FUNCTION_10_0(v5);

  OUTLINED_FUNCTION_20_0();
  if (v0)
  {
    OUTLINED_FUNCTION_48();
    OUTLINED_FUNCTION_18_0();
    OUTLINED_FUNCTION_13_0();

  }
  else
  {
    OUTLINED_FUNCTION_12_0();
  }
  _Block_release(*(const void **)(v2 + 32));
  return OUTLINED_FUNCTION_17_0(*(uint64_t (**)(void))(v1 + 8));
}

uint64_t sub_21C284950(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v1;
  return OUTLINED_FUNCTION_1_1();
}

uint64_t sub_21C284960()
{
  uint64_t v0;
  void *v1;

  v1 = sub_21C284470(*(void **)(*(_QWORD *)(v0 + 24) + OBJC_IVAR___AIMLExperimentationAnalyticsManagerInternal_lock), *(id *)(v0 + 24), *(id *)(v0 + 16));
  return OUTLINED_FUNCTION_29((uint64_t)v1, *(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_21C2849C8@<X0>(uint64_t a1@<X0>, void *a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t *v5;
  uint64_t v6;
  id v7;
  unint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t result;
  uint64_t inited;
  uint64_t v13;
  uint64_t v14;
  id v15;

  v5 = (uint64_t *)(a1 + OBJC_IVAR___AIMLExperimentationAnalyticsManagerInternal_experimentsForCodePathID);
  swift_beginAccess();
  v6 = *v5;
  if (*(_QWORD *)(v6 + 16))
  {
    v7 = a2;
    swift_bridgeObjectRetain();
    v8 = sub_21C288274((uint64_t)v7);
    if ((v9 & 1) != 0)
    {
      v10 = *(_QWORD *)(*(_QWORD *)(v6 + 56) + 8 * v8);
      swift_bridgeObjectRetain();

      result = swift_bridgeObjectRelease();
      *a3 = v10;
      return result;
    }

    swift_bridgeObjectRelease();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_253F82280);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_21C28B7B0;
  *(_QWORD *)(inited + 32) = sub_21C28B050();
  *(_QWORD *)(inited + 40) = v13;
  *(_QWORD *)(inited + 72) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(inited + 48) = 0xD00000000000001CLL;
  *(_QWORD *)(inited + 56) = 0x800000021C28BF20;
  v14 = sub_21C28B02C();
  v15 = objc_allocWithZone(MEMORY[0x24BDD1540]);
  sub_21C287104(0xD000000000000027, 0x800000021C28B940, -1, v14);
  return swift_willThrow();
}

uint64_t sub_21C284B3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3;

  if (*(_QWORD *)(a3 + 16) && (sub_21C2882A4(a1, a2), (v3 & 1) != 0))
    return swift_unknownObjectRetain();
  else
    return 0;
}

uint64_t sub_21C284B88(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;

  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  v4 = (_QWORD *)swift_task_alloc();
  v3[5] = v4;
  v5 = OUTLINED_FUNCTION_32_0(v4, (uint64_t)sub_21C284BCC);
  return OUTLINED_FUNCTION_31_0(v5);
}

uint64_t sub_21C284BCC(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v6;

  v4 = *v2;
  v6 = *v2;
  OUTLINED_FUNCTION_10_0(&v6);
  if (v1)
    return OUTLINED_FUNCTION_7_0((uint64_t (*)(void))v2[1]);
  *(_QWORD *)(v4 + 48) = a1;
  OUTLINED_FUNCTION_24_0();
  return OUTLINED_FUNCTION_0_1();
}

uint64_t sub_21C284C24()
{
  uint64_t v0;
  uint64_t (*v1)(void);

  sub_21C2851B4(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 48), *(void **)(v0 + 24));
  OUTLINED_FUNCTION_20_0();
  v1 = (uint64_t (*)(void))OUTLINED_FUNCTION_40();
  return v1();
}

uint64_t sub_21C284C78(void *a1, void *a2, void *aBlock, void *a4)
{
  _QWORD *v4;
  id v8;
  id v9;
  _QWORD *v10;

  v4[3] = a2;
  v4[4] = a4;
  v4[2] = a1;
  v4[5] = _Block_copy(aBlock);
  v8 = a1;
  v9 = a2;
  a4;
  v10 = (_QWORD *)swift_task_alloc();
  v4[6] = v10;
  *v10 = v4;
  v10[1] = sub_21C284D04;
  return sub_21C284B88((uint64_t)v8, (uint64_t)a2);
}

uint64_t sub_21C284D04()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD *v6;

  OUTLINED_FUNCTION_43();
  OUTLINED_FUNCTION_26_0();
  v4 = *(void **)(v2 + 24);
  v3 = *(void **)(v2 + 32);
  v5 = *(void **)(v2 + 16);
  OUTLINED_FUNCTION_10_0(v6);

  if (v0)
  {
    OUTLINED_FUNCTION_48();
    OUTLINED_FUNCTION_18_0();
    OUTLINED_FUNCTION_13_0();

  }
  else
  {
    OUTLINED_FUNCTION_12_0();
  }
  _Block_release(*(const void **)(v2 + 40));
  return OUTLINED_FUNCTION_17_0(*(uint64_t (**)(void))(v1 + 8));
}

uint64_t sub_21C284D70(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;

  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  v4 = (_QWORD *)swift_task_alloc();
  v3[5] = v4;
  v5 = OUTLINED_FUNCTION_32_0(v4, (uint64_t)sub_21C284DBC);
  return sub_21C284950(v5);
}

uint64_t sub_21C284DBC(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v6;

  v4 = *v2;
  v6 = *v2;
  OUTLINED_FUNCTION_10_0(&v6);
  if (v1)
    return OUTLINED_FUNCTION_7_0((uint64_t (*)(void))v2[1]);
  *(_QWORD *)(v4 + 48) = a1;
  OUTLINED_FUNCTION_24_0();
  return OUTLINED_FUNCTION_0_1();
}

uint64_t sub_21C284E28(void *a1, int a2, void *a3, void *a4, void *aBlock, uint64_t a6, uint64_t a7)
{
  void *v11;
  _QWORD *v12;
  id v13;
  id v14;
  id v15;

  v11 = _Block_copy(aBlock);
  v12 = (_QWORD *)OUTLINED_FUNCTION_30();
  v12[2] = a3;
  v12[3] = a4;
  v12[4] = v11;
  v12[5] = a1;
  v13 = a3;
  v14 = a4;
  v15 = a1;
  return sub_21C28465C(a7, (uint64_t)v12);
}

uint64_t sub_21C284E9C(void *a1, void *a2, void *aBlock, void *a4)
{
  _QWORD *v4;
  id v8;
  id v9;
  _QWORD *v10;

  v4[3] = a2;
  v4[4] = a4;
  v4[2] = a1;
  v4[5] = _Block_copy(aBlock);
  v8 = a1;
  v9 = a2;
  a4;
  v10 = (_QWORD *)swift_task_alloc();
  v4[6] = v10;
  *v10 = v4;
  v10[1] = sub_21C2891B8;
  return sub_21C284D70((uint64_t)v8, (uint64_t)a2);
}

uint64_t sub_21C284F28(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v1;
  return OUTLINED_FUNCTION_1_1();
}

uint64_t sub_21C284F38()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  if (qword_253F82288 != -1)
    swift_once();
  v1 = qword_253F824B0;
  v2 = *(_QWORD *)algn_253F824B8;
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 32) = v3;
  *v3 = v0;
  v3[1] = sub_21C284FD8;
  return sub_21C2817F0(0, *(_QWORD *)(v0 + 16), v1, v2);
}

uint64_t sub_21C284FD8(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v6;

  v4 = *v2;
  v6 = *v2;
  OUTLINED_FUNCTION_10_0(&v6);
  if (v1)
    return OUTLINED_FUNCTION_7_0((uint64_t (*)(void))v2[1]);
  *(_QWORD *)(v4 + 40) = a1;
  OUTLINED_FUNCTION_24_0();
  return OUTLINED_FUNCTION_0_1();
}

uint64_t sub_21C285030()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_47();
  v1 = OUTLINED_FUNCTION_57();
  OUTLINED_FUNCTION_20_0();
  return OUTLINED_FUNCTION_30_0(v1, *(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_21C28506C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return OUTLINED_FUNCTION_1_1();
}

uint64_t sub_21C285080()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  if (qword_253F82288 != -1)
    swift_once();
  v1 = qword_253F824B0;
  v2 = *(_QWORD *)algn_253F824B8;
  v3 = (_QWORD *)swift_task_alloc();
  v0[5] = (uint64_t)v3;
  *v3 = v0;
  v3[1] = sub_21C285120;
  return sub_21C28268C(0, v0[2], v0[3], v1, v2);
}

uint64_t sub_21C285120(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v6;

  v4 = *v2;
  v6 = *v2;
  OUTLINED_FUNCTION_10_0(&v6);
  if (v1)
    return OUTLINED_FUNCTION_7_0((uint64_t (*)(void))v2[1]);
  *(_QWORD *)(v4 + 48) = a1;
  OUTLINED_FUNCTION_24_0();
  return OUTLINED_FUNCTION_0_1();
}

uint64_t sub_21C285178()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_47();
  v1 = OUTLINED_FUNCTION_57();
  OUTLINED_FUNCTION_20_0();
  return OUTLINED_FUNCTION_30_0(v1, *(uint64_t (**)(void))(v0 + 8));
}

void sub_21C2851B4(uint64_t a1, uint64_t a2, void *a3)
{
  unint64_t v3;
  void *v4;
  NSObject *v5;
  unint64_t v6;
  void *v7;
  id v8;

  if (a3)
  {
    v8 = a3;
    v3 = OUTLINED_FUNCTION_33_0();
    sub_21C289A34(v3, v4, v5);
    OUTLINED_FUNCTION_23_0(v8);
  }
  else
  {
    v6 = OUTLINED_FUNCTION_33_0();
    sub_21C2896AC(v6, v7);
    OUTLINED_FUNCTION_22_0();
  }
}

uint64_t sub_21C285218(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;

  v5[10] = a4;
  v5[11] = v4;
  v5[8] = a2;
  v5[9] = a3;
  v5[7] = a1;
  return OUTLINED_FUNCTION_1_1();
}

uint64_t sub_21C285230()
{
  uint64_t v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t inited;
  id v5;
  uint64_t v6;
  uint64_t (*v7)(void);
  unint64_t v9;

  v1 = sub_21C282C78();
  if (v1)
  {
    v2 = *(void **)(v0 + 80);
    v3 = *(_QWORD *)(v0 + 56);
    OUTLINED_FUNCTION_47();
    __swift_instantiateConcreteTypeFromMangledName(&qword_253F82240);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_21C28B7A0;
    *(_QWORD *)(inited + 32) = v1;
    OUTLINED_FUNCTION_56();
    v5 = v1;
    v6 = sub_21C28A2F4(v9);
    swift_bridgeObjectRelease();
    sub_21C2851B4(v3, v6, v2);
    swift_bridgeObjectRelease();

  }
  v7 = (uint64_t (*)(void))OUTLINED_FUNCTION_40();
  return v7();
}

uint64_t sub_21C2853A8(void *a1, int a2, void *a3, void *aBlock, void *a5)
{
  _QWORD *v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD *v14;

  v5[3] = a3;
  v5[4] = a5;
  v5[2] = a1;
  v5[5] = _Block_copy(aBlock);
  v9 = sub_21C28B050();
  v11 = v10;
  v5[6] = v10;
  v12 = a1;
  v13 = a3;
  a5;
  v14 = (_QWORD *)swift_task_alloc();
  v5[7] = v14;
  *v14 = v5;
  v14[1] = sub_21C28545C;
  return sub_21C285218((uint64_t)v12, v9, v11, (uint64_t)a3);
}

uint64_t sub_21C28545C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD *v6;

  OUTLINED_FUNCTION_26_0();
  v4 = *(void **)(v2 + 24);
  v3 = *(void **)(v2 + 32);
  v5 = *(void **)(v2 + 16);
  OUTLINED_FUNCTION_10_0(v6);

  OUTLINED_FUNCTION_20_0();
  if (v0)
  {
    OUTLINED_FUNCTION_48();
    OUTLINED_FUNCTION_18_0();
    OUTLINED_FUNCTION_13_0();

  }
  else
  {
    OUTLINED_FUNCTION_12_0();
  }
  _Block_release(*(const void **)(v2 + 40));
  return OUTLINED_FUNCTION_42(*(uint64_t (**)(void))(v1 + 8));
}

uint64_t sub_21C2854DC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[4] = a2;
  v3[5] = v2;
  v3[3] = a1;
  return OUTLINED_FUNCTION_1_1();
}

uint64_t sub_21C2854F0()
{
  _QWORD *v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  _BOOL4 v4;
  unint64_t v5;
  uint64_t v6;
  uint8_t *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t (*v11)(void);
  uint64_t v13;

  if (qword_253F823E0 != -1)
    swift_once();
  v1 = sub_21C28AFB4();
  __swift_project_value_buffer(v1, (uint64_t)qword_253F824C0);
  swift_bridgeObjectRetain_n();
  v2 = sub_21C28AFA8();
  v3 = sub_21C28B110();
  v4 = os_log_type_enabled(v2, v3);
  v5 = v0[4];
  if (v4)
  {
    v6 = v0[3];
    v7 = (uint8_t *)OUTLINED_FUNCTION_1();
    v13 = OUTLINED_FUNCTION_1();
    *(_DWORD *)v7 = 136315138;
    swift_bridgeObjectRetain();
    v0[2] = sub_21C28774C(v6, v5, &v13);
    sub_21C28B17C();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_21C280000, v2, v3, "Rollout update tracking for namespace: %s", v7, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_0();
  }
  swift_bridgeObjectRelease_n();

  sub_21C285BC4(v0[3], v0[4]);
  sub_21C285728();
  v8 = sub_21C28AFA8();
  v9 = sub_21C28B110();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)OUTLINED_FUNCTION_1();
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_21C280000, v8, v9, "Finished starting tracking for namespace", v10, 2u);
    OUTLINED_FUNCTION_0();
  }

  v11 = (uint64_t (*)(void))OUTLINED_FUNCTION_40();
  return v11();
}

uint64_t sub_21C285728()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_50();
  v0 = OUTLINED_FUNCTION_30();
  swift_unknownObjectWeakInit();
  v1 = OUTLINED_FUNCTION_33_0();
  sub_21C285B40(v1, v2, v3, v0);
  return swift_release();
}

void sub_21C285784(void *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  os_log_type_t v11;
  uint8_t *v12;

  v3 = a2 + 16;
  swift_beginAccess();
  v4 = MEMORY[0x220778070](v3);
  if (v4)
  {
    v5 = v4;
    v6 = objc_msgSend(a1, sel_namespaceName);
    v7 = sub_21C28B050();
    v9 = v8;

    sub_21C285BC4(v7, v9);
    swift_bridgeObjectRelease();
  }
  else
  {
    if (qword_253F823E0 != -1)
      swift_once();
    v10 = sub_21C28AFB4();
    __swift_project_value_buffer(v10, (uint64_t)qword_253F824C0);
    v5 = sub_21C28AFA8();
    v11 = sub_21C28B11C();
    if (os_log_type_enabled(v5, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_21C280000, v5, v11, "ExperimentationAnalyticsManager object is not retained in memory of the process", v12, 2u);
      MEMORY[0x220777FF8](v12, -1, -1);
    }
  }

}

void sub_21C285B40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  char *v4;
  void *v9;
  char *v10;

  v9 = *(void **)&v4[OBJC_IVAR___AIMLExperimentationAnalyticsManagerInternal_rolloutRegistrationLock];
  v10 = v4;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_21C28422C(v9, v10, a1, a2, a3, a4);
}

void sub_21C285BC4(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  os_log_type_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  objc_msgSend(*(id *)(*(_QWORD *)(v2 + OBJC_IVAR___AIMLExperimentationAnalyticsManagerInternal_experimentation) + 24), sel_refresh);
  v6 = sub_21C285E80(a1, a2);
  if (!v3)
  {
    v7 = (void *)v6;
    if (v6)
    {
      sub_21C2860B8(a1, a2, v6);
      if (v8)
      {
        sub_21C286178(a1, a2, v7);

        swift_bridgeObjectRelease();
      }
      else
      {
        if (qword_253F823E0 != -1)
          swift_once();
        v16 = OUTLINED_FUNCTION_11();
        OUTLINED_FUNCTION_19_0(v16, (uint64_t)qword_253F824C0);
        v17 = sub_21C28AFA8();
        v18 = sub_21C28B11C();
        if (os_log_type_enabled(v17, v18))
        {
          v19 = (uint8_t *)OUTLINED_FUNCTION_1();
          v22 = OUTLINED_FUNCTION_1();
          *(_DWORD *)v19 = 136315138;
          v20 = swift_bridgeObjectRetain();
          OUTLINED_FUNCTION_36_0(v20, v21, &v22);
          OUTLINED_FUNCTION_55();
          sub_21C28B17C();
          OUTLINED_FUNCTION_38_0();
          _os_log_impl(&dword_21C280000, v17, v18, "No update to %s", v19, 0xCu);
          swift_arrayDestroy();
          OUTLINED_FUNCTION_0();
        }

        OUTLINED_FUNCTION_37_0();
      }
    }
    else
    {
      if (qword_253F823E0 != -1)
        swift_once();
      v9 = OUTLINED_FUNCTION_11();
      OUTLINED_FUNCTION_19_0(v9, (uint64_t)qword_253F824C0);
      v10 = (void *)sub_21C28AFA8();
      v11 = sub_21C28B128();
      if (OUTLINED_FUNCTION_44(v11))
      {
        OUTLINED_FUNCTION_1();
        v22 = OUTLINED_FUNCTION_1();
        v12 = OUTLINED_FUNCTION_34_0(4.8149e-34);
        OUTLINED_FUNCTION_36_0(v12, v13, &v22);
        OUTLINED_FUNCTION_21_0();
        OUTLINED_FUNCTION_38_0();
        OUTLINED_FUNCTION_35_0(&dword_21C280000, v14, v15, "No active rollout exists for %s");
        OUTLINED_FUNCTION_45();
        OUTLINED_FUNCTION_0();
      }

      OUTLINED_FUNCTION_37_0();
    }
  }
}

uint64_t sub_21C285E80(uint64_t a1, unint64_t a2)
{
  unint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t inited;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  void *v15;
  os_log_type_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v4 = sub_21C2830B0(a1, a2);
  if ((v4 & 0x100000000) != 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_253F82280);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_21C28B7B0;
    *(_QWORD *)(inited + 32) = sub_21C28B050();
    *(_QWORD *)(inited + 40) = v11;
    *(_QWORD *)(inited + 72) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(inited + 48) = 0xD000000000000023;
    *(_QWORD *)(inited + 56) = 0x800000021C28B970;
    v12 = sub_21C28B02C();
    v13 = objc_allocWithZone(MEMORY[0x24BDD1540]);
    sub_21C287104(0xD000000000000027, 0x800000021C28B940, -1, v12);
    swift_willThrow();
  }
  else
  {
    v5 = v4;
    v6 = sub_21C28325C(a1, a2);
    if (v6)
    {
      v7 = v6;
      type metadata accessor for Experimentation();
      v8 = sub_21C28A458(a1, a2, v7, v5);

      return v8;
    }
    if (qword_253F823E0 != -1)
      swift_once();
    v14 = OUTLINED_FUNCTION_11();
    OUTLINED_FUNCTION_19_0(v14, (uint64_t)qword_253F824C0);
    v15 = (void *)sub_21C28AFA8();
    v16 = sub_21C28B128();
    if (OUTLINED_FUNCTION_44(v16))
    {
      OUTLINED_FUNCTION_1();
      v21 = OUTLINED_FUNCTION_1();
      v17 = OUTLINED_FUNCTION_34_0(4.8149e-34);
      OUTLINED_FUNCTION_36_0(v17, v18, &v21);
      OUTLINED_FUNCTION_21_0();
      OUTLINED_FUNCTION_38_0();
      OUTLINED_FUNCTION_35_0(&dword_21C280000, v19, v20, "Couldn't find active rollout for namespace: %s");
      OUTLINED_FUNCTION_45();
      OUTLINED_FUNCTION_0();
    }

    OUTLINED_FUNCTION_37_0();
  }
  return 0;
}

uint64_t sub_21C2860B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v11;

  v5 = sub_21C286484(a3);
  if (!v3)
  {
    v4 = v5;
    v7 = v6;
    v8 = sub_21C286230();
    if (v9)
    {
      if (v4 == v8 && v9 == v7)
      {
        swift_bridgeObjectRelease();
LABEL_10:
        swift_bridgeObjectRelease();
        return 0;
      }
      v11 = sub_21C28B20C();
      swift_bridgeObjectRelease();
      if ((v11 & 1) != 0)
        goto LABEL_10;
    }
  }
  return v4;
}

void sub_21C286178(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  id v5;
  unint64_t v6;

  __swift_instantiateConcreteTypeFromMangledName(&qword_253F82240);
  v4 = OUTLINED_FUNCTION_30();
  *(_OWORD *)(v4 + 16) = xmmword_21C28B7A0;
  *(_QWORD *)(v4 + 32) = a3;
  OUTLINED_FUNCTION_56();
  v5 = a3;
  sub_21C289ED4(v6);
  swift_bridgeObjectRelease();
  sub_21C286410();
}

uint64_t sub_21C286230()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t *v11;

  sub_21C286970();
  v1 = *(void **)(v0 + OBJC_IVAR___AIMLExperimentationAnalyticsManagerInternal_userDefaults);
  v2 = (void *)sub_21C28B044();
  v3 = objc_msgSend(v1, sel_stringForKey_, v2);

  if (v3)
  {
    OUTLINED_FUNCTION_20_0();
    v4 = sub_21C28B050();

  }
  else
  {
    if (qword_253F823E0 != -1)
      swift_once();
    v5 = sub_21C28AFB4();
    __swift_project_value_buffer(v5, (uint64_t)qword_253F824C0);
    OUTLINED_FUNCTION_53();
    v6 = sub_21C28AFA8();
    v7 = sub_21C28B11C();
    if (os_log_type_enabled(v6, v7))
    {
      v8 = (uint8_t *)OUTLINED_FUNCTION_1();
      OUTLINED_FUNCTION_1();
      *(_DWORD *)v8 = 136315138;
      OUTLINED_FUNCTION_53();
      v9 = OUTLINED_FUNCTION_33_0();
      sub_21C28774C(v9, v10, v11);
      sub_21C28B17C();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_21C280000, v6, v7, "Couldn't find %s key in UserDefaults", v8, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_0();
    }

    swift_bridgeObjectRelease_n();
    return 0;
  }
  return v4;
}

void sub_21C286410()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;

  OUTLINED_FUNCTION_50();
  v1 = *(void **)(v0 + OBJC_IVAR___AIMLExperimentationAnalyticsManagerInternal_userDefaults);
  v2 = (void *)sub_21C28B044();
  OUTLINED_FUNCTION_33_0();
  sub_21C286970();
  v3 = (void *)sub_21C28B044();
  OUTLINED_FUNCTION_20_0();
  objc_msgSend(v1, sel_setObject_forKey_, v2, v3);

  OUTLINED_FUNCTION_23_0(v3);
}

uint64_t sub_21C286484(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  unint64_t v12;
  unint64_t v13;
  char *v14;
  void *v15;
  _QWORD v17[11];
  id v18[3];

  v18[2] = *(id *)MEMORY[0x24BDAC8D0];
  v3 = sub_21C28B014();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_27_0();
  v5 = sub_21C28B008();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  MEMORY[0x24BDAC7A8](v7);
  v17[7] = (char *)v17 - v8;
  v9 = (void *)objc_opt_self();
  v18[0] = 0;
  v10 = objc_msgSend(v9, sel_archivedDataWithRootObject_requiringSecureCoding_error_, a1, 0, v18);
  v11 = v18[0];
  if (v10)
  {
    v17[4] = v1;
    v17[8] = v4;
    v17[6] = sub_21C28AF3C();
    v13 = v12;

    sub_21C288B1C(&qword_253F82220, (void (*)(uint64_t))MEMORY[0x24BDC6AF8]);
    sub_21C28AFFC();
    v14 = (char *)&loc_21C2865E0 + *((int *)qword_21C286960 + (v13 >> 62));
    v17[5] = v6;
    v17[3] = v13;
    __asm { BR              X10 }
  }
  v15 = v11;
  sub_21C28AF30();

  swift_willThrow();
  return v4;
}

unint64_t sub_21C286970()
{
  sub_21C28B080();
  return 0xD000000000000029;
}

uint64_t sub_21C2869B8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return OUTLINED_FUNCTION_1_1();
}

uint64_t sub_21C2869CC()
{
  uint64_t (*v0)(void);

  sub_21C2869F8();
  v0 = (uint64_t (*)(void))OUTLINED_FUNCTION_40();
  return OUTLINED_FUNCTION_8_0(v0);
}

void sub_21C2869F8()
{
  unint64_t v0;
  char *v1;
  uint64_t v2;
  void *v3;
  char *v4;

  OUTLINED_FUNCTION_50();
  v3 = *(void **)&v1[OBJC_IVAR___AIMLExperimentationAnalyticsManagerInternal_rolloutRegistrationLock];
  v4 = v1;
  OUTLINED_FUNCTION_53();
  sub_21C2843E8(v3, v4, v2, v0);
  OUTLINED_FUNCTION_22_0();
}

void sub_21C286A48(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  uint64_t v19[8];

  v6 = (uint64_t *)(a1 + OBJC_IVAR___AIMLExperimentationAnalyticsManagerInternal_rolloutTrackingInfoForNamespace);
  swift_beginAccess();
  v7 = *v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v8 = sub_21C284B3C(a2, a3, v7);
  v10 = v9;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v8)
  {
    v11 = __OFSUB__(v10, 1);
    v12 = v10 - 1;
    if (!v11)
    {
      if (v12)
      {
        swift_beginAccess();
        swift_bridgeObjectRetain();
        v13 = swift_unknownObjectRetain();
        sub_21C28867C(v13, v12, a2, a3);
        swift_endAccess();
        swift_unknownObjectRelease();
        swift_bridgeObjectRelease();
      }
      else
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + OBJC_IVAR___AIMLExperimentationAnalyticsManagerInternal_experimentation) + 24), sel_removeUpdateHandlerForToken_, v8);
        swift_beginAccess();
        sub_21C288500(a2, a3);
        swift_endAccess();
        swift_unknownObjectRelease();
        swift_unknownObjectRelease();
      }
      return;
    }
    __break(1u);
  }
  else if (qword_253F823E0 == -1)
  {
    goto LABEL_6;
  }
  swift_once();
LABEL_6:
  v14 = sub_21C28AFB4();
  __swift_project_value_buffer(v14, (uint64_t)qword_253F824C0);
  swift_bridgeObjectRetain_n();
  v15 = sub_21C28AFA8();
  v16 = sub_21C28B11C();
  if (os_log_type_enabled(v15, v16))
  {
    v17 = (uint8_t *)swift_slowAlloc();
    v18 = swift_slowAlloc();
    v19[0] = v18;
    *(_DWORD *)v17 = 136315138;
    swift_bridgeObjectRetain();
    v19[7] = sub_21C28774C(a2, a3, v19);
    sub_21C28B17C();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_21C280000, v15, v16, "%s is not being tracked", v17, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x220777FF8](v18, -1, -1);
    MEMORY[0x220777FF8](v17, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
}

id ExperimentationAnalyticsManager.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ExperimentationAnalyticsManager();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_21C286DD4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_21C2891B4;
  return sub_21C284B88(a1, a2);
}

uint64_t sub_21C286E34(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_21C2891B4;
  return sub_21C284068(a1);
}

uint64_t sub_21C286E84(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_21C2891B4;
  return sub_21C284D70(a1, a2);
}

uint64_t sub_21C286EE4()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_21C2891B4;
  return sub_21C284738();
}

uint64_t sub_21C286F44(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_21C2891B4;
  return sub_21C2854DC(a1, a2);
}

uint64_t sub_21C286FA4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_21C2891B4;
  return sub_21C2869B8(a1, a2);
}

uint64_t sub_21C287004(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v9;

  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v9;
  *v9 = v4;
  v9[1] = sub_21C28707C;
  return sub_21C285218(a1, a2, a3, a4);
}

uint64_t sub_21C28707C()
{
  uint64_t v0;

  OUTLINED_FUNCTION_3_1();
  return OUTLINED_FUNCTION_8_0(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x220777F80](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t type metadata accessor for ExperimentationAnalyticsManager()
{
  return objc_opt_self();
}

id sub_21C287104(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  void *v7;
  void *v8;
  id v9;

  v7 = (void *)sub_21C28B044();
  swift_bridgeObjectRelease();
  if (a4)
  {
    v8 = (void *)sub_21C28B020();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = 0;
  }
  v9 = objc_msgSend(v4, sel_initWithDomain_code_userInfo_, v7, a3, v8);

  return v9;
}

uint64_t sub_21C2871B0(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_21C2871C0(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_21C2871F4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v4;
  *v4 = v3;
  v4[1] = sub_21C2891BC;
  return v6();
}

uint64_t sub_21C287248(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(void);

  v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v5;
  *v5 = v4;
  v5[1] = sub_21C2891BC;
  return v7();
}

uint64_t sub_21C28729C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_21C28B104();
  if (__swift_getEnumTagSinglePayload(a1, 1, v6) == 1)
  {
    sub_21C288E80(a1);
  }
  else
  {
    sub_21C28B0F8();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(a1, v6);
  }
  if (*(_QWORD *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_21C28B0EC();
    swift_unknownObjectRelease();
  }
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a2;
  *(_QWORD *)(v7 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_21C2873D8(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_21C28743C;
  return v6(a1);
}

uint64_t sub_21C28743C()
{
  uint64_t (*v0)(void);

  OUTLINED_FUNCTION_3_1();
  v0 = (uint64_t (*)(void))OUTLINED_FUNCTION_40();
  return OUTLINED_FUNCTION_8_0(v0);
}

char *sub_21C287460(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;

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
    __swift_instantiateConcreteTypeFromMangledName(&qword_253F82228);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  if ((v5 & 1) != 0)
  {
    sub_21C287640((char *)(a4 + 32), v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_21C28754C(0, v8, (unint64_t)v12, a4);
  }
  return v10;
}

uint64_t sub_21C28754C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  result = sub_21C28B200();
  __break(1u);
  return result;
}

char *sub_21C287640(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_21C28B200();
    __break(1u);
  }
  else if (__dst != __src || &__src[16 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 16 * a2);
  }
  return __src;
}

_BYTE **sub_21C2876C4(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

uint64_t sub_21C2876D4(uint64_t (*a1)(void))
{
  return a1();
}

void sub_21C2876F4(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;

  v6 = a4();
  sub_21C28774C(v6, v7, a3);
  v8 = *a1 + 8;
  OUTLINED_FUNCTION_55();
  sub_21C28B17C();
  swift_bridgeObjectRelease();
  *a1 = v8;
  OUTLINED_FUNCTION_22_0();
}

uint64_t sub_21C28774C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  _QWORD *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v15[3];
  uint64_t ObjectType;

  OUTLINED_FUNCTION_24_0();
  v9 = sub_21C287BDC(v6, v7, v8, 1, a1, a2);
  v10 = v15[0];
  if (v9)
  {
    v11 = v9;
    ObjectType = swift_getObjectType();
    v15[0] = v11;
    v12 = *a3;
    if (*a3)
    {
      sub_21C289114((uint64_t)v15, *a3);
      *a3 = v12 + 32;
    }
  }
  else
  {
    ObjectType = MEMORY[0x24BEE2520];
    v15[0] = a1;
    v15[1] = a2;
    v13 = *a3;
    if (*a3)
    {
      sub_21C289114((uint64_t)v15, *a3);
      *a3 = v13 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v15);
  return v10;
}

uint64_t method lookup function for ExperimentationAnalyticsManager()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ExperimentationAnalyticsManager.cacheTrialExperiments(for:)()
{
  _QWORD *v0;
  uint64_t v1;
  int *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t (*v6)(void);

  v2 = *(int **)((*MEMORY[0x24BEE4EA0] & *v0) + 0xC8);
  v6 = (uint64_t (*)(void))((char *)v2 + *v2);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  v4 = OUTLINED_FUNCTION_32_0(v3, (uint64_t)sub_21C2891B4);
  return OUTLINED_FUNCTION_29(v4, v6);
}

uint64_t dispatch thunk of ExperimentationAnalyticsManager.cacheTrialExperimentIdentifiers(for:namespaces:)()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(void);

  OUTLINED_FUNCTION_16_0();
  v1 = (_QWORD *)OUTLINED_FUNCTION_2_0();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_9_0(v1, (uint64_t)sub_21C2891B4);
  return OUTLINED_FUNCTION_2_1(v2, v3, v4);
}

uint64_t dispatch thunk of ExperimentationAnalyticsManager.emitTrigger(for:requestID:)()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(void);

  OUTLINED_FUNCTION_16_0();
  v1 = (_QWORD *)OUTLINED_FUNCTION_2_0();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_9_0(v1, (uint64_t)sub_21C2891B4);
  return OUTLINED_FUNCTION_2_1(v2, v3, v4);
}

uint64_t dispatch thunk of ExperimentationAnalyticsManager.emitTriggerFromCache(for:requestID:)()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(void);

  OUTLINED_FUNCTION_16_0();
  v1 = (_QWORD *)OUTLINED_FUNCTION_2_0();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_9_0(v1, (uint64_t)sub_21C2891B4);
  return OUTLINED_FUNCTION_2_1(v2, v3, v4);
}

uint64_t dispatch thunk of ExperimentationAnalyticsManager.emitTrigger(for:namespace:requestID:)()
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
  _QWORD *v9;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);

  OUTLINED_FUNCTION_43();
  v2 = v1;
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v9 = (_QWORD *)OUTLINED_FUNCTION_2_0();
  *(_QWORD *)(v0 + 16) = v9;
  *v9 = v0;
  v9[1] = sub_21C28707C;
  return v11(v8, v6, v4, v2);
}

uint64_t dispatch thunk of ExperimentationAnalyticsManager.startRolloutUpdateTracking(for:)()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(void);

  OUTLINED_FUNCTION_16_0();
  v1 = (_QWORD *)OUTLINED_FUNCTION_2_0();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_9_0(v1, (uint64_t)sub_21C2891B4);
  return OUTLINED_FUNCTION_2_1(v2, v3, v4);
}

uint64_t dispatch thunk of ExperimentationAnalyticsManager.endRolloutUpdateTracking(for:)()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(void);

  OUTLINED_FUNCTION_16_0();
  v1 = (_QWORD *)OUTLINED_FUNCTION_2_0();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_9_0(v1, (uint64_t)sub_21C2891B4);
  return OUTLINED_FUNCTION_2_1(v2, v3, v4);
}

_QWORD *initializeBufferWithCopyOfBuffer for RolloutTrackingInfo(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_unknownObjectRetain();
  return a1;
}

uint64_t destroy for RolloutTrackingInfo()
{
  return swift_unknownObjectRelease();
}

_QWORD *assignWithCopy for RolloutTrackingInfo(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  a1[1] = a2[1];
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

_QWORD *assignWithTake for RolloutTrackingInfo(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_unknownObjectRelease();
  a1[1] = a2[1];
  return a1;
}

uint64_t getEnumTagSinglePayload for RolloutTrackingInfo(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for RolloutTrackingInfo(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for RolloutTrackingInfo()
{
  return &type metadata for RolloutTrackingInfo;
}

uint64_t sub_21C287BDC(_QWORD *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
      sub_21C287D30((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_21C28B188();
      result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    result = sub_21C287DF4(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    v8 = sub_21C28B1C4();
    if (!v8)
    {
      result = sub_21C28B1E8();
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

void *sub_21C287D30(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_21C28B200();
  __break(1u);
  return result;
}

uint64_t sub_21C287DF4(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_21C287E88(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = (uint64_t)sub_21C28805C(0, *(_QWORD *)(v2 + 16) + 1, 1, v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = (uint64_t)sub_21C28805C((char *)(v3 > 1), v4 + 1, 1, v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_21C287E88(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
  {
    v2 = sub_21C28B08C();
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
  v3 = sub_21C287FF8(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    v4 = v3;
    v5 = sub_21C28B1AC();
    if ((v6 & 1) != 0 || v5 != v2)
      goto LABEL_14;
    return (uint64_t)v4;
  }
  sub_21C28B200();
  __break(1u);
LABEL_14:
  result = sub_21C28B1E8();
  __break(1u);
  return result;
}

_QWORD *sub_21C287FF8(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2552545B8);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_21C28805C(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2552545B8);
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
  v13 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_21C2881F4(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_21C288130(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_21C288130(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_21C28B200();
  __break(1u);
  return result;
}

char *sub_21C2881F4(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_21C28B200();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

unint64_t sub_21C288274(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_21C28B158();
  return sub_21C288308(a1, v2);
}

unint64_t sub_21C2882A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_21C28B224();
  sub_21C28B074();
  v4 = sub_21C28B230();
  return sub_21C288420(a1, a2, v4);
}

unint64_t sub_21C288308(uint64_t a1, uint64_t a2)
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
    sub_21C28917C(0, qword_253F822B8);
    v6 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * i);
    v7 = sub_21C28B164();

    if ((v7 & 1) == 0)
    {
      v8 = ~v4;
      for (i = (i + 1) & v8; ((*(_QWORD *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0; i = (i + 1) & v8)
      {
        v9 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * i);
        v10 = sub_21C28B164();

        if ((v10 & 1) != 0)
          break;
      }
    }
  }
  return i;
}

unint64_t sub_21C288420(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_21C28B20C() & 1) == 0)
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
      while (!v14 && (sub_21C28B20C() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_21C288500(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  unint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v10;

  v3 = v2;
  swift_bridgeObjectRetain();
  v6 = sub_21C2882A4(a1, a2);
  LOBYTE(a2) = v7;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0)
    return 0;
  swift_isUniquelyReferenced_nonNull_native();
  v10 = *v3;
  *v3 = 0x8000000000000000;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F82248);
  sub_21C28B1D0();
  swift_bridgeObjectRelease();
  v8 = *(_QWORD *)(*(_QWORD *)(v10 + 56) + 16 * v6);
  sub_21C28B1DC();
  *v3 = v10;
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_21C288610(uint64_t a1, void *a2)
{
  uint64_t *v2;
  uint64_t v6;

  swift_isUniquelyReferenced_nonNull_native();
  v6 = *v2;
  *v2 = 0x8000000000000000;
  sub_21C288700(a1, a2);
  *v2 = v6;
  return swift_bridgeObjectRelease();
}

uint64_t sub_21C28867C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;
  uint64_t v10;

  swift_isUniquelyReferenced_nonNull_native();
  v10 = *v4;
  *v4 = 0x8000000000000000;
  sub_21C288814(a1, a2, a3, a4);
  *v4 = v10;
  return swift_bridgeObjectRelease();
}

id sub_21C288700(uint64_t a1, void *a2)
{
  _QWORD *v2;
  _QWORD **v3;
  _QWORD *v5;
  unint64_t v6;
  char v7;
  unint64_t v8;
  char v9;
  unint64_t v10;
  char v11;
  _QWORD *v12;
  uint64_t v13;
  id result;

  v3 = (_QWORD **)v2;
  v5 = (_QWORD *)*v2;
  v6 = sub_21C288274((uint64_t)a2);
  if (__OFADD__(v5[2], (v7 & 1) == 0))
  {
    __break(1u);
    goto LABEL_9;
  }
  v8 = v6;
  v9 = v7;
  __swift_instantiateConcreteTypeFromMangledName(qword_253F822A0);
  if ((sub_21C28B1D0() & 1) == 0)
    goto LABEL_5;
  v10 = sub_21C288274((uint64_t)a2);
  if ((v9 & 1) != (v11 & 1))
  {
LABEL_9:
    sub_21C28917C(0, qword_253F822B8);
    result = (id)sub_21C28B218();
    __break(1u);
    return result;
  }
  v8 = v10;
LABEL_5:
  v12 = *v3;
  if ((v9 & 1) != 0)
  {
    v13 = v12[7];
    result = (id)swift_bridgeObjectRelease();
    *(_QWORD *)(v13 + 8 * v8) = a1;
  }
  else
  {
    sub_21C288940(v8, (uint64_t)a2, a1, v12);
    return a2;
  }
  return result;
}

uint64_t sub_21C288814(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  _QWORD **v5;
  _QWORD *v10;
  unint64_t v11;
  char v12;
  unint64_t v13;
  char v14;
  unint64_t v15;
  char v16;
  _QWORD *v17;
  uint64_t *v18;
  uint64_t result;

  v5 = (_QWORD **)v4;
  v10 = (_QWORD *)*v4;
  v11 = sub_21C2882A4(a3, a4);
  if (__OFADD__(v10[2], (v12 & 1) == 0))
  {
    __break(1u);
    goto LABEL_9;
  }
  v13 = v11;
  v14 = v12;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F82248);
  if ((sub_21C28B1D0() & 1) == 0)
    goto LABEL_5;
  v15 = sub_21C2882A4(a3, a4);
  if ((v14 & 1) != (v16 & 1))
  {
LABEL_9:
    result = sub_21C28B218();
    __break(1u);
    return result;
  }
  v13 = v15;
LABEL_5:
  v17 = *v5;
  if ((v14 & 1) != 0)
  {
    v18 = (uint64_t *)(v17[7] + 16 * v13);
    result = swift_unknownObjectRelease();
    *v18 = a1;
    v18[1] = a2;
  }
  else
  {
    sub_21C288984(v13, a3, a4, a1, a2, v17);
    return swift_bridgeObjectRetain();
  }
  return result;
}

unint64_t sub_21C288940(unint64_t result, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v4;
  BOOL v5;
  uint64_t v6;

  a4[(result >> 6) + 8] |= 1 << result;
  *(_QWORD *)(a4[6] + 8 * result) = a2;
  *(_QWORD *)(a4[7] + 8 * result) = a3;
  v4 = a4[2];
  v5 = __OFADD__(v4, 1);
  v6 = v4 + 1;
  if (v5)
    __break(1u);
  else
    a4[2] = v6;
  return result;
}

unint64_t sub_21C288984(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _QWORD *a6)
{
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;

  a6[(result >> 6) + 8] |= 1 << result;
  v6 = (_QWORD *)(a6[6] + 16 * result);
  *v6 = a2;
  v6[1] = a3;
  v7 = (_QWORD *)(a6[7] + 16 * result);
  *v7 = a4;
  v7[1] = a5;
  v8 = a6[2];
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
    __break(1u);
  else
    a6[2] = v10;
  return result;
}

uint64_t sub_21C2889D0(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = sub_21C28AF00();
  if (!result || (result = sub_21C28AF18(), !__OFSUB__(a1, result)))
  {
    if (!__OFSUB__(a2, a1))
    {
      sub_21C28AF0C();
      sub_21C28B014();
      sub_21C288B1C(&qword_253F82220, (void (*)(uint64_t))MEMORY[0x24BDC6AF8]);
      return sub_21C28AFE4();
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_21C288A94(uint64_t a1, unint64_t a2)
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

uint64_t sub_21C288AD8(uint64_t a1, unint64_t a2)
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

uint64_t sub_21C288B1C(uint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result;

  result = *a1;
  if (!result)
  {
    a2(255);
    OUTLINED_FUNCTION_52();
  }
  return result;
}

uint64_t sub_21C288B54(uint64_t *a1, uint64_t *a2)
{
  uint64_t result;

  result = *a1;
  if (!result)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    OUTLINED_FUNCTION_52();
  }
  return result;
}

uint64_t sub_21C288B8C()
{
  sub_21C28B014();
  sub_21C288B1C(&qword_253F82220, (void (*)(uint64_t))MEMORY[0x24BDC6AF8]);
  return sub_21C28AFE4();
}

uint64_t sub_21C288C9C()
{
  uint64_t v0;

  OUTLINED_FUNCTION_64();

  _Block_release(*(const void **)(v0 + 40));
  return swift_deallocObject();
}

uint64_t sub_21C288CDC()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t (*v2)(void);

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_21C288D50;
  OUTLINED_FUNCTION_51();
  return v2();
}

uint64_t sub_21C288D50()
{
  uint64_t v0;

  OUTLINED_FUNCTION_3_1();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_21C288D8C()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(void);

  OUTLINED_FUNCTION_43();
  OUTLINED_FUNCTION_63();
  v1 = (_QWORD *)OUTLINED_FUNCTION_46();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_6_0(v1, (uint64_t)sub_21C2891BC);
  return OUTLINED_FUNCTION_0_0(v2, v3, v4, v5, v6);
}

uint64_t objectdestroy_22Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21C288DFC()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t (*v2)(void);

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_21C2891BC;
  OUTLINED_FUNCTION_51();
  return v2();
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t sub_21C288E80(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255254540);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_21C288EC0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21C288EE4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_21C2891B4;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_255254568 + dword_255254568))(a1, v4);
}

uint64_t sub_21C288F58()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(void);

  OUTLINED_FUNCTION_43();
  OUTLINED_FUNCTION_63();
  v1 = (_QWORD *)OUTLINED_FUNCTION_46();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_6_0(v1, (uint64_t)sub_21C2891BC);
  return OUTLINED_FUNCTION_0_0(v2, v3, v4, v5, v6);
}

uint64_t sub_21C288F9C()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(void);

  OUTLINED_FUNCTION_43();
  OUTLINED_FUNCTION_63();
  v1 = (_QWORD *)OUTLINED_FUNCTION_46();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_6_0(v1, (uint64_t)sub_21C2891BC);
  return OUTLINED_FUNCTION_0_0(v2, v3, v4, v5, v6);
}

uint64_t objectdestroy_38Tm()
{
  uint64_t v0;

  OUTLINED_FUNCTION_64();

  _Block_release(*(const void **)(v0 + 32));
  return swift_deallocObject();
}

uint64_t sub_21C289018()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(void);

  OUTLINED_FUNCTION_43();
  OUTLINED_FUNCTION_63();
  v1 = (_QWORD *)OUTLINED_FUNCTION_46();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_6_0(v1, (uint64_t)sub_21C2891BC);
  return OUTLINED_FUNCTION_0_0(v2, v3, v4, v5, v6);
}

uint64_t sub_21C289058()
{
  uint64_t v0;

  OUTLINED_FUNCTION_64();
  _Block_release(*(const void **)(v0 + 24));

  return swift_deallocObject();
}

uint64_t sub_21C289088()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  _QWORD *v5;

  v2 = (void *)v0[2];
  v3 = (void *)v0[3];
  v4 = (void *)v0[4];
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_21C2891BC;
  return ((uint64_t (*)(void *, void *, void *))((char *)&dword_2552545A8 + dword_2552545A8))(v2, v3, v4);
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

uint64_t sub_21C289114(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_21C289150()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_21C289174(void *a1)
{
  uint64_t v1;

  sub_21C285784(a1, v1);
}

uint64_t sub_21C28917C(uint64_t a1, unint64_t *a2)
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

uint64_t OUTLINED_FUNCTION_0_1()
{
  return swift_task_switch();
}

uint64_t OUTLINED_FUNCTION_1_1()
{
  return swift_task_switch();
}

uint64_t OUTLINED_FUNCTION_2_1(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return a3();
}

uint64_t OUTLINED_FUNCTION_3_1()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
  *(_QWORD *)(v1 - 8) = *v0;
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_6_0@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  *a1 = v3;
  a1[1] = a2;
  return v2;
}

uint64_t OUTLINED_FUNCTION_7_0(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_8_0(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_9_0@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  *a1 = v3;
  a1[1] = a2;
  return v2;
}

uint64_t OUTLINED_FUNCTION_10_0@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_12_0()
{
  uint64_t v0;

  return (*(uint64_t (**)(uint64_t, _QWORD))(v0 + 16))(v0, 0);
}

uint64_t OUTLINED_FUNCTION_13_0()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 16))(v0, v1);
}

uint64_t OUTLINED_FUNCTION_15_0()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;

  v3 = *v1;
  v4 = (uint64_t *)(v2 - 8);
  *v4 = *v1;
  *v4 = *v1;
  *(_QWORD *)(v3 + 40) = v0;
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_17_0(uint64_t (*a1)(void))
{
  return a1();
}

void OUTLINED_FUNCTION_18_0()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_19_0(uint64_t a1, uint64_t a2)
{
  __swift_project_value_buffer(a1, a2);
  return swift_bridgeObjectRetain_n();
}

uint64_t OUTLINED_FUNCTION_20_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_21_0()
{
  return sub_21C28B17C();
}

void OUTLINED_FUNCTION_23_0(id a1)
{

}

void OUTLINED_FUNCTION_26_0()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
}

uint64_t OUTLINED_FUNCTION_29(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t OUTLINED_FUNCTION_30_0(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t OUTLINED_FUNCTION_31_0(uint64_t a1)
{
  return sub_21C284F28(a1);
}

uint64_t OUTLINED_FUNCTION_32_0@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  *a1 = v3;
  a1[1] = a2;
  return v2;
}

uint64_t OUTLINED_FUNCTION_33_0()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_34_0(float a1)
{
  float *v1;

  *v1 = a1;
  return swift_bridgeObjectRetain();
}

void OUTLINED_FUNCTION_35_0(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  uint8_t *v5;
  os_log_type_t v6;

  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_36_0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  unint64_t v3;
  uint64_t v4;

  return sub_21C28774C(v4, v3, a3);
}

uint64_t OUTLINED_FUNCTION_37_0()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_38_0()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_40()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 8);
}

uint64_t OUTLINED_FUNCTION_42(uint64_t (*a1)(void))
{
  return a1();
}

BOOL OUTLINED_FUNCTION_44(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_45()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_46()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_47()
{
  return type metadata accessor for Experimentation();
}

uint64_t OUTLINED_FUNCTION_48()
{
  return sub_21C28AF24();
}

uint64_t OUTLINED_FUNCTION_49(uint64_t a1)
{
  unint64_t v1;

  return sub_21C288AD8(a1, v1);
}

void OUTLINED_FUNCTION_52()
{
  JUMPOUT(0x220777F8CLL);
}

uint64_t OUTLINED_FUNCTION_53()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_54()
{
  unint64_t v0;
  uint64_t v1;

  return sub_21C288A94(v1, v0);
}

uint64_t OUTLINED_FUNCTION_56()
{
  return sub_21C28B0C8();
}

uint64_t OUTLINED_FUNCTION_57()
{
  unint64_t v0;

  return sub_21C28A2F4(v0);
}

void OUTLINED_FUNCTION_58(uint64_t a1@<X8>)
{
  uint64_t v1;

}

char *OUTLINED_FUNCTION_59(char *a1, int64_t a2)
{
  uint64_t v2;

  return sub_21C287460(a1, a2, 1, v2);
}

uint64_t OUTLINED_FUNCTION_61(uint64_t a1, uint64_t a2)
{
  return sub_21C2889D0(a1, a2);
}

uint64_t OUTLINED_FUNCTION_62()
{
  return sub_21C288B8C();
}

void OUTLINED_FUNCTION_64()
{
  uint64_t v0;

}

uint64_t sub_21C28951C()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 16) = objc_msgSend((id)objc_opt_self(), sel_defaultProvider);
  *(_QWORD *)(v0 + 24) = objc_msgSend((id)objc_opt_self(), sel_clientWithIdentifier_, 0);
  return v0;
}

uint64_t sub_21C28957C()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  return v0;
}

uint64_t sub_21C2895A0()
{
  sub_21C28957C();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for Experimentation()
{
  return objc_opt_self();
}

uint64_t sub_21C2895E0()
{
  uint64_t v0;

  v0 = sub_21C28AFB4();
  __swift_allocate_value_buffer(v0, qword_253F824C0);
  __swift_project_value_buffer(v0, (uint64_t)qword_253F824C0);
  sub_21C289670();
  sub_21C28B170();
  return sub_21C28AFC0();
}

unint64_t sub_21C289670()
{
  unint64_t result;

  result = qword_253F823E8;
  if (!qword_253F823E8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_253F823E8);
  }
  return result;
}

void sub_21C2896AC(unint64_t a1, void *a2)
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
  char *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  char v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  uint64_t v28;
  uint64_t v29;
  _WORD *v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F823D0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_21C28AF9C();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_10_1();
  v11 = v9 - v10;
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v32 - v13;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v28 = sub_21C28B1F4();
    swift_bridgeObjectRelease();
    if (v28)
      goto LABEL_3;
  }
  else if (*(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_3:
    v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE94BC8]), sel_init);
    v16 = v15;
    if (v15)
    {
      v17 = v15;
      sub_21C28A18C(a1, v17, &qword_2552545D8, 0x24BE94BB0, (SEL *)&selRef_setAllocations_);

    }
    v18 = objc_msgSend(a2, sel_UUIDString);
    sub_21C28B050();

    sub_21C28AF84();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_12_1((uint64_t)v6);
    if (v19)
    {
      sub_21C28A1E8((uint64_t)v6);
    }
    else
    {
      v20 = OUTLINED_FUNCTION_8_1((uint64_t)v14, (uint64_t)v6, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 32));
      if (v16)
      {
        OUTLINED_FUNCTION_16_1(v20, &qword_2552545D0);
        OUTLINED_FUNCTION_8_1(v11, (uint64_t)v14, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 16));
        v21 = v16;
        v22 = sub_21C28A654(v11);
        objc_msgSend(v21, sel_setCodepathId_, v22);

      }
      OUTLINED_FUNCTION_15_1((uint64_t)v14, *(uint64_t (**)(uint64_t, uint64_t))(v8 + 8));
    }
    v23 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE94BE0]), sel_init);
    objc_msgSend(v23, sel_setExperimentTriggered_, v16);
    sub_21C28A0CC((uint64_t)v23);
    if (qword_253F823E0 != -1)
      swift_once();
    v24 = OUTLINED_FUNCTION_11();
    v25 = OUTLINED_FUNCTION_2_2(v24, (uint64_t)qword_253F824C0);
    v26 = sub_21C28B110();
    if (os_log_type_enabled(v25, v26))
    {
      v27 = (uint8_t *)OUTLINED_FUNCTION_1_2();
      *(_WORD *)v27 = 0;
      OUTLINED_FUNCTION_5_0(&dword_21C280000, v25, v26, "experimentTriggered event emitted", v27);
      OUTLINED_FUNCTION_0();
    }

    OUTLINED_FUNCTION_9_1();
    return;
  }
  if (qword_253F823E0 != -1)
    swift_once();
  v29 = OUTLINED_FUNCTION_11();
  v33 = OUTLINED_FUNCTION_2_2(v29, (uint64_t)qword_253F824C0);
  sub_21C28B110();
  if (OUTLINED_FUNCTION_11_0(v33))
  {
    v30 = (_WORD *)OUTLINED_FUNCTION_1_2();
    OUTLINED_FUNCTION_13_1(v30);
    OUTLINED_FUNCTION_3_2(&dword_21C280000, v33, v31, "experimentTriggered event no emitted. Trial experiments empty.");
    OUTLINED_FUNCTION_0();
  }
  OUTLINED_FUNCTION_4_0(v33);
}

void sub_21C289A34(unint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v3;
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  id v37;
  id v38;
  uint64_t v39;
  NSObject *v40;
  os_log_type_t v41;
  uint8_t *v42;
  uint64_t v43;
  uint64_t v44;
  _WORD *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  NSObject *v50;

  v50 = a3;
  v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F823D0);
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_10_1();
  v9 = v7 - v8;
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v47 - v11;
  v13 = sub_21C28AF9C();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_10_1();
  v17 = v15 - v16;
  v19 = MEMORY[0x24BDAC7A8](v18);
  MEMORY[0x24BDAC7A8](v19);
  v22 = (char *)&v47 - v21;
  if (a1 >> 62)
  {
    v48 = v20;
    swift_bridgeObjectRetain();
    v43 = sub_21C28B1F4();
    swift_bridgeObjectRelease();
    v20 = v48;
    if (v43)
      goto LABEL_3;
  }
  else if (*(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_3:
    v47 = v17;
    v48 = v20;
    v49 = v3;
    v23 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE94BD0]), sel_init);
    v24 = v23;
    if (v23)
    {
      v25 = v23;
      sub_21C28A18C(a1, v25, &qword_2552545D8, 0x24BE94BB0, (SEL *)&selRef_setAllocations_);

    }
    v26 = objc_msgSend(a2, sel_UUIDString);
    sub_21C28B050();

    sub_21C28AF84();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_12_1((uint64_t)v12);
    if (v27)
    {
      sub_21C28A1E8((uint64_t)v12);
    }
    else
    {
      v28 = OUTLINED_FUNCTION_8_1((uint64_t)v22, (uint64_t)v12, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v14 + 32));
      if (v24)
      {
        OUTLINED_FUNCTION_16_1(v28, &qword_2552545D0);
        v29 = v48;
        OUTLINED_FUNCTION_8_1(v48, (uint64_t)v22, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v14 + 16));
        v30 = v24;
        v31 = sub_21C28A654(v29);
        OUTLINED_FUNCTION_14_0((uint64_t)v31, sel_setCodepathId_);

      }
      OUTLINED_FUNCTION_15_1((uint64_t)v22, *(uint64_t (**)(uint64_t, uint64_t))(v14 + 8));
    }
    v32 = -[NSObject UUIDString](v50, sel_UUIDString);
    sub_21C28B050();

    sub_21C28AF84();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_12_1(v9);
    if (v27)
    {
      sub_21C28A1E8(v9);
    }
    else
    {
      v33 = v47;
      v34 = OUTLINED_FUNCTION_8_1(v47, v9, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v14 + 32));
      if (v24)
      {
        OUTLINED_FUNCTION_16_1(v34, &qword_2552545D0);
        v35 = v48;
        OUTLINED_FUNCTION_8_1(v48, v33, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v14 + 16));
        v36 = v24;
        v37 = sub_21C28A654(v35);
        OUTLINED_FUNCTION_14_0((uint64_t)v37, sel_setRequestId_);

      }
      OUTLINED_FUNCTION_15_1(v33, *(uint64_t (**)(uint64_t, uint64_t))(v14 + 8));
    }
    v38 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE94BE0]), sel_init);
    objc_msgSend(v38, sel_setSiriRequestExperimentTriggered_, v24);
    sub_21C28A0CC((uint64_t)v38);
    if (qword_253F823E0 != -1)
      swift_once();
    v39 = OUTLINED_FUNCTION_11();
    v40 = OUTLINED_FUNCTION_2_2(v39, (uint64_t)qword_253F824C0);
    v41 = sub_21C28B110();
    if (os_log_type_enabled(v40, v41))
    {
      v42 = (uint8_t *)OUTLINED_FUNCTION_1_2();
      *(_WORD *)v42 = 0;
      OUTLINED_FUNCTION_5_0(&dword_21C280000, v40, v41, "SiriRequestExperimentTriggered event emitted.", v42);
      OUTLINED_FUNCTION_0();
    }

    OUTLINED_FUNCTION_9_1();
    return;
  }
  if (qword_253F823E0 != -1)
    swift_once();
  v44 = OUTLINED_FUNCTION_11();
  v50 = OUTLINED_FUNCTION_2_2(v44, (uint64_t)qword_253F824C0);
  sub_21C28B110();
  if (OUTLINED_FUNCTION_11_0(v50))
  {
    v45 = (_WORD *)OUTLINED_FUNCTION_1_2();
    OUTLINED_FUNCTION_13_1(v45);
    OUTLINED_FUNCTION_3_2(&dword_21C280000, v50, v46, "SiriRequestExperimentTriggered event no emitted. Trial experiments empty.");
    OUTLINED_FUNCTION_0();
  }
  OUTLINED_FUNCTION_4_0(v50);
}

void sub_21C289ED4(unint64_t a1)
{
  id v2;
  id v3;
  uint64_t v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8;
  _WORD *v9;
  uint64_t v10;
  NSObject *oslog;
  NSObject *osloga;

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_21C28B1F4();
    swift_bridgeObjectRelease();
    if (v7)
      goto LABEL_3;
  }
  else if (*(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_3:
    v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE94BD8]), sel_init);
    if (v2)
      sub_21C28A18C(a1, v2, &qword_2552545C8, 0x24BE94BB8, (SEL *)&selRef_setRollouts_);
    v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE94BE0]), sel_init);
    objc_msgSend(v3, sel_setRolloutChangeSnapshot_, v2);
    sub_21C28A0CC((uint64_t)v3);
    if (qword_253F823E0 != -1)
      swift_once();
    v4 = OUTLINED_FUNCTION_11();
    oslog = OUTLINED_FUNCTION_2_2(v4, (uint64_t)qword_253F824C0);
    v5 = sub_21C28B110();
    if (os_log_type_enabled(oslog, v5))
    {
      v6 = (uint8_t *)OUTLINED_FUNCTION_1_2();
      *(_WORD *)v6 = 0;
      OUTLINED_FUNCTION_5_0(&dword_21C280000, oslog, v5, "RolloutChangeSnapshot event emitted", v6);
      OUTLINED_FUNCTION_0();
    }

    OUTLINED_FUNCTION_23_0(v2);
    return;
  }
  if (qword_253F823E0 != -1)
    swift_once();
  v8 = OUTLINED_FUNCTION_11();
  osloga = OUTLINED_FUNCTION_2_2(v8, (uint64_t)qword_253F824C0);
  sub_21C28B110();
  if (OUTLINED_FUNCTION_11_0(osloga))
  {
    v9 = (_WORD *)OUTLINED_FUNCTION_1_2();
    OUTLINED_FUNCTION_13_1(v9);
    OUTLINED_FUNCTION_3_2(&dword_21C280000, osloga, v10, "RolloutChangeSnapshot event not emitted. Trial rollouts empty.");
    OUTLINED_FUNCTION_0();
  }
  OUTLINED_FUNCTION_23_0(osloga);
}

void sub_21C28A0CC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _WORD *v3;
  uint64_t v4;
  NSObject *v5;

  if (a1)
  {
    objc_msgSend(*(id *)(v1 + 16), sel_emitMessage_, a1);
  }
  else
  {
    if (qword_253F823E0 != -1)
      swift_once();
    v2 = OUTLINED_FUNCTION_11();
    v5 = OUTLINED_FUNCTION_2_2(v2, (uint64_t)qword_253F824C0);
    sub_21C28B128();
    if (OUTLINED_FUNCTION_11_0(v5))
    {
      v3 = (_WORD *)OUTLINED_FUNCTION_1_2();
      OUTLINED_FUNCTION_13_1(v3);
      OUTLINED_FUNCTION_3_2(&dword_21C280000, v5, v4, "EXPSiriSchemaEXPSiriClientEvent nil");
      OUTLINED_FUNCTION_0();
    }

  }
}

void sub_21C28A18C(uint64_t a1, void *a2, unint64_t *a3, uint64_t a4, SEL *a5)
{
  void *v7;

  sub_21C28917C(0, a3);
  v7 = (void *)sub_21C28B0B0();
  objc_msgSend(a2, *a5, v7);
  OUTLINED_FUNCTION_23_0(v7);
}

uint64_t sub_21C28A1E8(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F823D0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t OUTLINED_FUNCTION_1_2()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_2_2(uint64_t a1, uint64_t a2)
{
  __swift_project_value_buffer(a1, a2);
  return sub_21C28AFA8();
}

void OUTLINED_FUNCTION_3_2(void *a1, NSObject *a2, uint64_t a3, const char *a4)
{
  os_log_type_t v4;
  uint8_t *v5;

  _os_log_impl(a1, a2, v4, a4, v5, 2u);
}

void OUTLINED_FUNCTION_4_0(id a1)
{

}

void OUTLINED_FUNCTION_5_0(void *a1, NSObject *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
  _os_log_impl(a1, a2, a3, a4, a5, 2u);
}

uint64_t OUTLINED_FUNCTION_8_1@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

BOOL OUTLINED_FUNCTION_11_0(NSObject *a1)
{
  os_log_type_t v1;

  return os_log_type_enabled(a1, v1);
}

uint64_t OUTLINED_FUNCTION_12_1(uint64_t a1)
{
  uint64_t v1;

  return __swift_getEnumTagSinglePayload(a1, 1, v1);
}

_WORD *OUTLINED_FUNCTION_13_1(_WORD *result)
{
  *result = 0;
  return result;
}

id OUTLINED_FUNCTION_14_0(uint64_t a1, const char *a2)
{
  void *v2;
  uint64_t v3;

  return objc_msgSend(v2, a2, v3);
}

uint64_t OUTLINED_FUNCTION_15_1@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t OUTLINED_FUNCTION_16_1(uint64_t a1, unint64_t *a2)
{
  return sub_21C28917C(0, a2);
}

uint64_t sub_21C28A2F4(unint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t i;
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;

  v9 = MEMORY[0x24BEE4AF8];
  if (!(a1 >> 62))
  {
    v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v2)
      goto LABEL_3;
LABEL_15:
    swift_bridgeObjectRelease();
    return MEMORY[0x24BEE4AF8];
  }
  swift_bridgeObjectRetain();
  v2 = sub_21C28B1F4();
  if (!v2)
    goto LABEL_15;
LABEL_3:
  result = type metadata accessor for Experimentation();
  if (v2 < 1)
  {
    __break(1u);
  }
  else
  {
    for (i = 0; i != v2; ++i)
    {
      if ((a1 & 0xC000000000000001) != 0)
        v5 = (id)MEMORY[0x220777C38](i, a1);
      else
        v5 = *(id *)(a1 + 8 * i + 32);
      v6 = v5;
      sub_21C28A6D0(v5);
      if (v7)
      {
        v8 = v7;
        MEMORY[0x220777B24]();
        if (*(_QWORD *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_21C28B0D4();
        sub_21C28B0E0();
        sub_21C28B0C8();

        v6 = v8;
      }

    }
    swift_bridgeObjectRelease();
    return v9;
  }
  return result;
}

uint64_t sub_21C28A458(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t result;
  uint64_t v24;

  v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE94BB8]), sel_init);
  v9 = v8;
  if (v8)
  {
    v10 = v8;
    v11 = objc_msgSend(a3, sel_rolloutId);
    v12 = sub_21C28B050();
    v14 = v13;

    sub_21C28AE90(v12, v14, v10, (SEL *)&selRef_setRolloutId_);
    v15 = v10;
    sub_21C28AD7C(a3);
    if (v16)
    {
      v17 = (void *)sub_21C28B044();
      swift_bridgeObjectRelease();
    }
    else
    {
      v17 = 0;
    }
    objc_msgSend(v15, sel_setRampId_, v17);

    v18 = v15;
    v19 = objc_msgSend(a3, sel_deploymentId);
    if ((v19 & 0x80000000) != 0)
    {
      result = sub_21C28B1E8();
      __break(1u);
      return result;
    }
    objc_msgSend(v18, sel_setDeploymentId_, v19);

  }
  type metadata accessor for Experimentation();
  v20 = sub_21C28AC88(a1, a2, a3, a4);
  if (v20)
  {
    v21 = v20;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_253F82240);
      v22 = swift_allocObject();
      *(_OWORD *)(v22 + 16) = xmmword_21C28B7A0;
      *(_QWORD *)(v22 + 32) = v21;
      v24 = v22;
      sub_21C28B0C8();
      sub_21C28AE20(v24, v9);
    }
    else
    {

    }
  }
  return (uint64_t)v9;
}

id sub_21C28A654(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;

  v2 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v3 = (void *)sub_21C28AF90();
  v4 = objc_msgSend(v2, sel_initWithNSUUID_, v3);

  v5 = sub_21C28AF9C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(a1, v5);
  return v4;
}

void sub_21C28A6D0(id a1)
{
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
  char *v12;
  id v13;
  void *v14;
  char *v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  uint64_t v30;
  id v31;
  id v32;
  id v33;
  id v34;
  unsigned int v35;
  uint64_t v36;
  id v37;
  unint64_t v38;
  uint64_t v39;
  id v40;
  unint64_t v41;
  id v42;
  id v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  id v49;
  double v50;
  double v51;
  double v52;
  id v53;
  uint64_t v54;
  char *v55;
  id v56;

  v2 = sub_21C28AF78();
  v3 = *(_QWORD *)(v2 - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v55 = (char *)&v53 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253F823D0);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v6 = (char *)&v53 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_21C28AF9C();
  v54 = *(_QWORD *)(v7 - 8);
  v8 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v10 = (char *)&v53 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v53 - v11;
  v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE94BB0]), sel_init);
  v14 = v13;
  v56 = a1;
  if (v13)
  {
    v53 = v13;
    v15 = v6;
    v16 = v7;
    v17 = v10;
    v18 = v12;
    v19 = v3;
    v20 = v2;
    v21 = objc_msgSend(v56, sel_experimentId);
    v22 = sub_21C28B050();
    v24 = v23;

    v2 = v20;
    v3 = v19;
    v12 = v18;
    v10 = v17;
    v7 = v16;
    v6 = v15;
    v25 = v22;
    v26 = v53;
    sub_21C28AE90(v25, v24, v53, (SEL *)&selRef_setExperimentId_);

    a1 = v56;
  }
  v27 = objc_msgSend(a1, sel_treatmentId);
  sub_21C28B050();

  sub_21C28AF84();
  swift_bridgeObjectRelease();
  if (__swift_getEnumTagSinglePayload((uint64_t)v6, 1, v7) == 1)
  {
    sub_21C28A1E8((uint64_t)v6);
    v28 = v56;
    v29 = v14;
    if (!v14)
      goto LABEL_13;
    goto LABEL_9;
  }
  v30 = v54;
  (*(void (**)(char *, char *, uint64_t))(v54 + 32))(v12, v6, v7);
  v29 = v14;
  if (v14)
  {
    sub_21C28917C(0, &qword_2552545D0);
    (*(void (**)(char *, char *, uint64_t))(v30 + 16))(v10, v12, v7);
    v31 = v14;
    v32 = sub_21C28A654((uint64_t)v10);
    objc_msgSend(v31, sel_setTreatmentId_, v32);

  }
  (*(void (**)(char *, uint64_t))(v30 + 8))(v12, v7);
  v28 = v56;
  if (v14)
  {
LABEL_9:
    v33 = v29;
    objc_msgSend(v33, sel_setDeploymentId_, (int)objc_msgSend(v28, sel_deploymentId));

    v34 = v33;
    v35 = objc_msgSend(v28, sel_type);
    if (v35 - 1 < 3)
      v36 = (v35 - 1) + 1;
    else
      v36 = 0;
    objc_msgSend(v34, sel_setAllocationStatus_, v36);

  }
LABEL_13:
  v37 = OUTLINED_FUNCTION_0_2();
  sub_21C28917C(0, &qword_2552543C8);
  v38 = sub_21C28B0BC();

  if (v38 >> 62)
  {
    swift_bridgeObjectRetain();
    v39 = sub_21C28B1F4();
    swift_bridgeObjectRelease();
  }
  else
  {
    v39 = *(_QWORD *)((v38 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (v39)
  {
    v40 = OUTLINED_FUNCTION_0_2();
    v41 = sub_21C28B0BC();

    if (v41 >> 62)
    {
      swift_bridgeObjectRetain();
      sub_21C28B1F4();
      OUTLINED_FUNCTION_1_3();
      if (v38)
        goto LABEL_18;
    }
    else
    {
      v38 = *(_QWORD *)((v41 & 0xFFFFFFFFFFFFF8) + 0x10);
      if (v38)
      {
LABEL_18:
        if ((v41 & 0xC000000000000001) != 0)
          goto LABEL_36;
        if (!*(_QWORD *)((v41 & 0xFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
          return;
        }
        v42 = *(id *)(v41 + 32);
        while (1)
        {
          OUTLINED_FUNCTION_1_3();
          if (!v29)
          {
LABEL_31:

            return;
          }
          v43 = v29;
          v44 = objc_msgSend((id)v38, sel_name);
          v45 = sub_21C28B050();
          v47 = v46;

          sub_21C28AE90(v45, v47, v43, (SEL *)&selRef_setExperimentNamespace_);
          v48 = v43;
          objc_msgSend(v48, sel_setCompatibilityVersion_, objc_msgSend((id)v38, sel_compatibilityVersion));

LABEL_27:
          v38 = v29;
          v49 = objc_msgSend(v28, sel_date);
          v41 = (unint64_t)v55;
          sub_21C28AF6C();

          sub_21C28AF60();
          v51 = v50;
          (*(void (**)(unint64_t, uint64_t))(v3 + 8))(v41, v2);
          v52 = v51 * 1000.0;
          if ((~COERCE__INT64(v51 * 1000.0) & 0x7FF0000000000000) == 0)
            break;
          if (v52 <= -1.0)
            goto LABEL_34;
          if (v52 < 1.84467441e19)
          {
            objc_msgSend((id)v38, sel_setLastUpdatedAtInMs_, (unint64_t)v52);
            goto LABEL_31;
          }
LABEL_35:
          __break(1u);
LABEL_36:
          MEMORY[0x220777C38](0, v41);
        }
        __break(1u);
LABEL_34:
        __break(1u);
        goto LABEL_35;
      }
    }
    swift_bridgeObjectRelease();
  }
  if (v29)
    goto LABEL_27;
}

uint64_t sub_21C28AC74(char a1)
{
  unsigned int v1;

  v1 = (a1 - 1);
  if (v1 < 3)
    return v1 + 1;
  else
    return 0;
}

id sub_21C28AC88(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE94BC0]), sel_init);
  if (v8)
  {
    sub_21C28ADDC(a1, a2, v8);
    v9 = v8;
    v10 = objc_msgSend(a3, sel_factorPackId);
    v11 = sub_21C28B050();
    v13 = v12;

    sub_21C28AE90(v11, v13, v9, (SEL *)&selRef_setFactorPackId_);
  }
  objc_msgSend(v8, sel_setCompatibilityVersion_, a4);
  return v8;
}

unint64_t sub_21C28AD58(unint64_t result, char a2, uint64_t a3)
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

uint64_t sub_21C28AD7C(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(a1, sel_rampId);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = sub_21C28B050();

  return v3;
}

void sub_21C28ADDC(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = (id)sub_21C28B044();
  objc_msgSend(a3, sel_setName_, v4);

}

void sub_21C28AE20(uint64_t a1, void *a2)
{
  id v3;

  sub_21C28917C(0, &qword_253F82278);
  v3 = (id)sub_21C28B0B0();
  swift_bridgeObjectRelease();
  objc_msgSend(a2, sel_setNamespaces_, v3);

}

void sub_21C28AE90(uint64_t a1, uint64_t a2, void *a3, SEL *a4)
{
  id v6;

  v6 = (id)sub_21C28B044();
  swift_bridgeObjectRelease();
  objc_msgSend(a3, *a4, v6);

}

id OUTLINED_FUNCTION_0_2()
{
  uint64_t v0;
  void *v1;

  return objc_msgSend(v1, (SEL)(v0 + 4049));
}

uint64_t OUTLINED_FUNCTION_1_3()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_21C28AF00()
{
  return MEMORY[0x24BDCBBC8]();
}

uint64_t sub_21C28AF0C()
{
  return MEMORY[0x24BDCBBD8]();
}

uint64_t sub_21C28AF18()
{
  return MEMORY[0x24BDCBBF0]();
}

uint64_t sub_21C28AF24()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_21C28AF30()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_21C28AF3C()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_21C28AF48()
{
  return MEMORY[0x24BDCE5D8]();
}

uint64_t sub_21C28AF54()
{
  return MEMORY[0x24BDCE778]();
}

uint64_t sub_21C28AF60()
{
  return MEMORY[0x24BDCE780]();
}

uint64_t sub_21C28AF6C()
{
  return MEMORY[0x24BDCE878]();
}

uint64_t sub_21C28AF78()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_21C28AF84()
{
  return MEMORY[0x24BDCE998]();
}

uint64_t sub_21C28AF90()
{
  return MEMORY[0x24BDCE9D0]();
}

uint64_t sub_21C28AF9C()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_21C28AFA8()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_21C28AFB4()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_21C28AFC0()
{
  return MEMORY[0x24BEE78E8]();
}

uint64_t sub_21C28AFCC()
{
  return MEMORY[0x24BEE54E8]();
}

uint64_t sub_21C28AFD8()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_21C28AFE4()
{
  return MEMORY[0x24BDC62A8]();
}

uint64_t sub_21C28AFF0()
{
  return MEMORY[0x24BDC62B0]();
}

uint64_t sub_21C28AFFC()
{
  return MEMORY[0x24BDC62C8]();
}

uint64_t sub_21C28B008()
{
  return MEMORY[0x24BDC62F0]();
}

uint64_t sub_21C28B014()
{
  return MEMORY[0x24BDC6AF8]();
}

uint64_t sub_21C28B020()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_21C28B02C()
{
  return MEMORY[0x24BEE02B0]();
}

uint64_t sub_21C28B038()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_21C28B044()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_21C28B050()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_21C28B05C()
{
  return MEMORY[0x24BDCFA78]();
}

uint64_t sub_21C28B068()
{
  return MEMORY[0x24BEE0A08]();
}

uint64_t sub_21C28B074()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_21C28B080()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_21C28B08C()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_21C28B098()
{
  return MEMORY[0x24BEE0DE8]();
}

uint64_t sub_21C28B0A4()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_21C28B0B0()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_21C28B0BC()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_21C28B0C8()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_21C28B0D4()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_21C28B0E0()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_21C28B0EC()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_21C28B0F8()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_21C28B104()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_21C28B110()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_21C28B11C()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_21C28B128()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_21C28B134()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_21C28B140()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_21C28B14C()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_21C28B158()
{
  return MEMORY[0x24BEE5BB8]();
}

uint64_t sub_21C28B164()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_21C28B170()
{
  return MEMORY[0x24BEE79A0]();
}

uint64_t sub_21C28B17C()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_21C28B188()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_21C28B194()
{
  return MEMORY[0x24BDD0638]();
}

uint64_t sub_21C28B1A0()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_21C28B1AC()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_21C28B1B8()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_21C28B1C4()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_21C28B1D0()
{
  return MEMORY[0x24BEE2E58]();
}

uint64_t sub_21C28B1DC()
{
  return MEMORY[0x24BEE2E70]();
}

uint64_t sub_21C28B1E8()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_21C28B1F4()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_21C28B200()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_21C28B20C()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_21C28B218()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_21C28B224()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_21C28B230()
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

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x24BEE4F78]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
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

