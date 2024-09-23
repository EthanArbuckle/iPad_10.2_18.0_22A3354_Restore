uint64_t DDIInitializeLocalUsersAndGroups(uint64_t a1)
{
  return +[DDObjcCompatibility swiftInitializeLocalUsersAndGroupsAndPerform:](DDObjcCompatibility, "swiftInitializeLocalUsersAndGroupsAndPerform:", a1);
}

BOOL DDIUpdateLocalUsersAndGroups(_QWORD *a1, uint64_t a2)
{
  id v3;
  void *v4;
  id v6;

  if (a1)
    *a1 = 0;
  v6 = 0;
  +[DDObjcCompatibility swiftUpdateLocalUsersAndGroupsAndReturnError:perform:](DDObjcCompatibility, "swiftUpdateLocalUsersAndGroupsAndReturnError:perform:", &v6, a2);
  v3 = v6;
  v4 = v3;
  if (a1 && v3)
    *a1 = objc_retainAutorelease(v3);

  return v4 == 0;
}

uint64_t OUTLINED_FUNCTION_0()
{
  return _os_log_send_and_compose_impl();
}

uint64_t OUTLINED_FUNCTION_1()
{
  return _os_crash_msg();
}

BOOL OUTLINED_FUNCTION_2()
{
  NSObject *v0;

  return os_log_type_enabled(v0, OS_LOG_TYPE_ERROR);
}

uint64_t sub_23A1F2154(char a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t result;
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  uint8_t *v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  NSObject *v37;
  os_log_type_t v38;
  uint8_t *v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  unint64_t v45;
  NSObject *v46;
  os_log_type_t v47;
  uint8_t *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  unint64_t v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;

  v3 = 0;
  v4 = sub_23A232E80();
  v53 = *(_QWORD *)(v4 - 8);
  v54 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v52 = (char *)&v51 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_23A232FE8();
  v63 = *(_QWORD *)(v6 - 8);
  v64 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v62 = (char *)&v51 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = a1 & 1;
  if (v8)
    v9 = 0x6C61636F6CLL;
  else
    v9 = 0x6D6574737973;
  v10 = 0xE500000000000000;
  if (!v8)
    v10 = 0xE600000000000000;
  v55 = v9;
  v56 = v10;
  v57 = v1;
  v11 = sub_23A1F2BD4(v8);
  v13 = v12;
  v14 = v11 >> 62;
  v15 = v12 >> 62;
  if (v8)
  {
    v16 = sub_23A233660();
    swift_bridgeObjectRelease();
    if ((v16 & 1) == 0)
      goto LABEL_13;
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  if (!v14)
  {
    if (*(_QWORD *)((v11 & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_11;
LABEL_45:
    v31 = sub_23A232FF4();
    v32 = sub_23A233264();
    if (os_log_type_enabled(v31, v32))
    {
      v33 = (uint8_t *)swift_slowAlloc();
      v34 = swift_slowAlloc();
      v66 = v34;
      *(_DWORD *)v33 = 136446210;
      v65 = sub_23A21FD94(0xD00000000000001ALL, 0x800000023A236E80, &v66);
      sub_23A233288();
      _os_log_impl(&dword_23A1F0000, v31, v32, "%{public}s", v33, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B845A58](v34, -1, -1);
      MEMORY[0x23B845A58](v33, -1, -1);
    }

    if (((unint64_t)"No system user files found" & 0x1000000000000000) == 0)
    {
      if (((unint64_t)"No system user files found" & 0x2000000000000000) != 0)
      {
        v35 = (unint64_t)"No system user files found" & 0xFFFFFFFFFFFFFFLL;
        v66 = 0xD00000000000002BLL;
        goto LABEL_69;
      }
      goto LABEL_72;
    }
    sub_23A2332F4();
    __break(1u);
LABEL_75:
    result = sub_23A2332F4();
    __break(1u);
    return result;
  }
  swift_bridgeObjectRetain();
  v30 = sub_23A2333D8();
  swift_bridgeObjectRelease();
  if (!v30)
    goto LABEL_45;
LABEL_11:
  if (!v15)
  {
    if (*(_QWORD *)((v13 & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_13;
    goto LABEL_51;
  }
  swift_bridgeObjectRetain();
  v36 = sub_23A2333D8();
  swift_bridgeObjectRelease();
  if (!v36)
  {
LABEL_51:
    v37 = sub_23A232FF4();
    v38 = sub_23A233264();
    if (os_log_type_enabled(v37, v38))
    {
      v39 = (uint8_t *)swift_slowAlloc();
      v40 = swift_slowAlloc();
      v66 = v40;
      *(_DWORD *)v39 = 136446210;
      v65 = sub_23A21FD94(0xD00000000000001BLL, 0x800000023A236E30, &v66);
      sub_23A233288();
      _os_log_impl(&dword_23A1F0000, v37, v38, "%{public}s", v39, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B845A58](v40, -1, -1);
      MEMORY[0x23B845A58](v39, -1, -1);
    }

    if (((unint64_t)"No system group files found" & 0x1000000000000000) == 0)
    {
      if (((unint64_t)"No system group files found" & 0x2000000000000000) != 0)
      {
        v35 = (unint64_t)"No system group files found" & 0xFFFFFFFFFFFFFFLL;
        v66 = 0xD00000000000002CLL;
        goto LABEL_69;
      }
      while (1)
      {
LABEL_72:
        sub_23A1F93A0();
        __break(1u);
      }
    }
    goto LABEL_75;
  }
LABEL_13:
  if (v14)
  {
LABEL_43:
    swift_bridgeObjectRetain();
    v17 = sub_23A2333D8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v17 = *(_QWORD *)((v11 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v18 = MEMORY[0x24BEE4AF8];
  if (v17)
  {
    v66 = MEMORY[0x24BEE4AF8];
    sub_23A233384();
    if (v17 < 0)
    {
      __break(1u);
      goto LABEL_57;
    }
    v19 = 0;
    do
    {
      if (v17 == v19)
      {
        __break(1u);
LABEL_42:
        __break(1u);
        goto LABEL_43;
      }
      if ((v11 & 0xC000000000000001) != 0)
        MEMORY[0x23B84508C](v19, v11);
      else
        swift_retain();
      v20 = swift_retain();
      sub_23A207034(v20);
      if (v3)
        goto LABEL_58;
      ++v19;
      swift_release_n();
      sub_23A23336C();
      sub_23A233390();
      sub_23A23339C();
      sub_23A233378();
    }
    while (v17 != v19);
    v21 = v66;
    swift_bridgeObjectRelease();
    v18 = MEMORY[0x24BEE4AF8];
    if (!v15)
      goto LABEL_25;
LABEL_38:
    swift_bridgeObjectRetain();
    v3 = sub_23A2333D8();
    swift_bridgeObjectRelease();
    if (!v3)
      goto LABEL_39;
LABEL_26:
    v58 = v21;
    v66 = v18;
    sub_23A233384();
    if ((v3 & 0x8000000000000000) == 0)
    {
      v11 = 0;
      v59 = v13;
      v60 = v13 & 0xC000000000000001;
      while (1)
      {
        if (v3 == v11)
          goto LABEL_42;
        if (v60)
        {
          v22 = MEMORY[0x23B84508C](v11, v13);
        }
        else
        {
          v22 = *(_QWORD *)(v13 + 8 * v11 + 32);
          swift_retain();
        }
        if (*(_QWORD *)(v22 + 16) != 3)
          goto LABEL_61;
        v23 = *(_DWORD *)(v22 + 24);
        v25 = *(_QWORD *)(v22 + 32);
        v24 = *(_QWORD *)(v22 + 40);
        (*(void (**)(char *, uint64_t, uint64_t))(v63 + 16))(v62, v22 + OBJC_IVAR____TtC23DarwinDirectoryInternal15GroupRecordFile_uuid, v64);
        v26 = *(_QWORD *)(v22 + OBJC_IVAR____TtC23DarwinDirectoryInternal15GroupRecordFile_nestedGroups);
        if (!v26)
          goto LABEL_60;
        v27 = *(_QWORD *)(v22 + OBJC_IVAR____TtC23DarwinDirectoryInternal15GroupRecordFile_aliases);
        if (!v27)
          break;
        ++v11;
        v28 = *(_QWORD *)(v22 + OBJC_IVAR____TtC23DarwinDirectoryInternal15GroupRecordFile_fullName + 8);
        v61 = *(_QWORD *)(v22 + OBJC_IVAR____TtC23DarwinDirectoryInternal15GroupRecordFile_fullName);
        type metadata accessor for GroupRecord(0);
        v15 = swift_allocObject();
        *(_DWORD *)(v15 + 32) = v23;
        *(_QWORD *)(v15 + 40) = v25;
        *(_QWORD *)(v15 + 48) = v24;
        (*(void (**)(unint64_t, char *, uint64_t))(v63 + 32))(v15 + OBJC_IVAR____TtC23DarwinDirectoryInternal11GroupRecord_uuid, v62, v64);
        *(_QWORD *)(v15 + 16) = v61;
        *(_QWORD *)(v15 + 24) = v28;
        *(_QWORD *)(v15 + OBJC_IVAR____TtC23DarwinDirectoryInternal11GroupRecord_nestedGroups) = v26;
        *(_QWORD *)(v15 + OBJC_IVAR____TtC23DarwinDirectoryInternal11GroupRecord_aliases) = v27;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_release();
        sub_23A23336C();
        sub_23A233390();
        sub_23A23339C();
        sub_23A233378();
        v13 = v59;
        if (v3 == v11)
        {
          swift_bridgeObjectRelease();
          return v58;
        }
      }
      __break(1u);
LABEL_60:
      __break(1u);
LABEL_61:
      LODWORD(v65) = 22;
      swift_retain();
      sub_23A21ECDC(MEMORY[0x24BEE4AF8]);
      sub_23A1F58C8((unint64_t *)&qword_256951AD0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCAFE0], MEMORY[0x24BDCAFD8]);
      v41 = v52;
      v42 = v54;
      sub_23A232F28();
      v43 = (void *)sub_23A232E74();
      (*(void (**)(char *, uint64_t))(v53 + 8))(v41, v42);
      swift_willThrow();
      swift_release_n();

      swift_bridgeObjectRelease();
      swift_release();
      goto LABEL_62;
    }
LABEL_57:
    __break(1u);
LABEL_58:
    swift_release_n();
    swift_release();
    MEMORY[0x23B845920](v3);
LABEL_62:
    v66 = 0;
    v67 = 0xE000000000000000;
    sub_23A233300();
    sub_23A233174();
    sub_23A233174();
    swift_bridgeObjectRelease();
    sub_23A233174();
    v44 = v66;
    v45 = v67;
    swift_bridgeObjectRetain_n();
    v46 = sub_23A232FF4();
    v47 = sub_23A233264();
    if (os_log_type_enabled(v46, v47))
    {
      v48 = (uint8_t *)swift_slowAlloc();
      v49 = swift_slowAlloc();
      v66 = v49;
      *(_DWORD *)v48 = 136446210;
      swift_bridgeObjectRetain();
      v65 = sub_23A21FD94(v44, v45, &v66);
      sub_23A233288();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_23A1F0000, v46, v47, "%{public}s", v48, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B845A58](v49, -1, -1);
      MEMORY[0x23B845A58](v48, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    v66 = 0xD000000000000011;
    v67 = 0x800000023A236E10;
    sub_23A233174();
    v50 = v66;
    if ((v67 & 0x1000000000000000) == 0 && v67 & 0x2000000000000000 | v66 & 0x1000000000000000)
    {
      if ((v67 & 0x2000000000000000) != 0)
      {
        v35 = v67 & 0xFFFFFFFFFFFFFFLL;
LABEL_69:
        v67 = v35;
        abort_with_reason();
      }
      if ((v50 & 0x1000000000000000) == 0)
        sub_23A233360();
      goto LABEL_72;
    }
    goto LABEL_75;
  }
  swift_bridgeObjectRelease();
  v21 = MEMORY[0x24BEE4AF8];
  if (v15)
    goto LABEL_38;
LABEL_25:
  v3 = *(_QWORD *)((v13 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v3)
    goto LABEL_26;
LABEL_39:
  swift_bridgeObjectRelease();
  return v21;
}

uint64_t sub_23A1F2BD4(char a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(char *, uint64_t, uint64_t);
  uint64_t v12;
  void (*v13)(char *, uint64_t);
  uint64_t *v14;
  uint64_t v15;
  uint64_t v17;

  v2 = sub_23A2330D8();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v17 - v7;
  if ((a1 & 1) != 0)
  {
    if (qword_256951A98 != -1)
      swift_once();
    v9 = qword_256956130;
  }
  else
  {
    if (qword_256951A88 != -1)
      swift_once();
    v9 = qword_256956100;
  }
  v10 = __swift_project_value_buffer(v2, (uint64_t)v9);
  v11 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  v11(v8, v10, v2);
  v12 = sub_23A1F3284((uint64_t)v8, type metadata accessor for UserRecordFile, &qword_256951AF0, (uint64_t)&unk_23A235030);
  v13 = *(void (**)(char *, uint64_t))(v3 + 8);
  v13(v8, v2);
  if ((a1 & 1) != 0)
  {
    if (qword_256951AA0 != -1)
      swift_once();
    v14 = qword_256956148;
  }
  else
  {
    if (qword_256951A90 != -1)
      swift_once();
    v14 = qword_256956118;
  }
  v15 = __swift_project_value_buffer(v2, (uint64_t)v14);
  v11(v6, v15, v2);
  sub_23A1F3284((uint64_t)v6, type metadata accessor for GroupRecordFile, &qword_256951AE8, (uint64_t)&unk_23A234FE0);
  v13(v6, v2);
  return v12;
}

uint64_t sub_23A1F3284(uint64_t a1, uint64_t (*a2)(uint64_t), unint64_t *a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  _QWORD v29[6];
  void (*v30)(char *, unint64_t, uint64_t);
  uint64_t v31;
  uint64_t (*v32)(uint64_t);
  unint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  v33 = a3;
  v34 = a4;
  v32 = a2;
  v6 = sub_23A2330D8();
  v35 = *(_QWORD *)(v6 - 8);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)v29 - v10;
  v12 = sub_23A23300C();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)v29 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)v29 - v17;
  v19 = v31;
  v20 = sub_23A1FD944(a1);
  if (v19)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v18, v4, v12);
    v21 = sub_23A232FF4();
    v22 = sub_23A233264();
    if (os_log_type_enabled(v21, v22))
    {
      v23 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v23 = 0;
      _os_log_impl(&dword_23A1F0000, v21, v22, "Failed to load record files: failed to get contents of directory", v23, 2u);
      MEMORY[0x23B845A58](v23, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v13 + 8))(v18, v12);
    return swift_willThrow();
  }
  else
  {
    v25 = v13;
    v31 = v4;
    v29[5] = v9;
    v36 = MEMORY[0x24BEE4AF8];
    v26 = *(_QWORD *)(v20 + 16);
    if (v26)
    {
      v29[3] = v20;
      v29[4] = v16;
      v29[1] = v25;
      v29[2] = v12;
      v27 = v20 + ((*(unsigned __int8 *)(v35 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v35 + 80));
      v28 = *(_QWORD *)(v35 + 72);
      v30 = *(void (**)(char *, unint64_t, uint64_t))(v35 + 16);
      do
      {
        v30(v11, v27, v6);
        sub_23A1F3FF4((unint64_t)v11, v32, v33, v34);
        MEMORY[0x23B844F0C]();
        if (*(_QWORD *)((v36 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v36 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_23A2331D4();
        sub_23A2331F8();
        sub_23A2331C8();
        (*(void (**)(char *, uint64_t))(v35 + 8))(v11, v6);
        v27 += v28;
        --v26;
      }
      while (v26);
      swift_bridgeObjectRelease();
      return v36;
    }
    else
    {
      swift_bridgeObjectRelease();
      return MEMORY[0x24BEE4AF8];
    }
  }
}

void sub_23A1F3714(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_23A1F3764(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_23A1F37F8 + 4 * byte_23A2340BF[a2]))(17481);
}

uint64_t sub_23A1F37F8(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 17481 && v1 == 0xE200000000000000)
    v2 = 1;
  else
    v2 = sub_23A233660();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

void sub_23A1F38E4(char a1)
{
  __asm { BR              X11 }
}

uint64_t sub_23A1F3958(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_23A1F39B4 + 4 * byte_23A2340CA[a2]))(0xD000000000000013);
}

uint64_t sub_23A1F39B4(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 0xD000000000000013 && v1 == 0x800000023A236D50)
    v2 = 1;
  else
    v2 = sub_23A233660();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

void sub_23A1F3A48(char a1)
{
  __asm { BR              X12 }
}

uint64_t sub_23A1F3A94(uint64_t a1, unsigned __int8 a2)
{
  uint64_t v2;

  return ((uint64_t (*)(uint64_t))((char *)sub_23A1F3B58 + 4 * byte_23A2340D7[a2]))(v2 + 4);
}

uint64_t sub_23A1F3B58(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  char v3;

  if (a1 == v1 + 4 && v2 == 0x800000023A236C10)
    v3 = 1;
  else
    v3 = sub_23A233660();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

void sub_23A1F3C4C(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_23A1F3C84(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_23A1F3D00 + 4 * byte_23A2340E5[a2]))(1701667182);
}

uint64_t sub_23A1F3D00(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 1701667182 && v1 == 0xE400000000000000)
    v2 = 1;
  else
    v2 = sub_23A233660();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

void sub_23A1F3DC0(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_23A1F3DF8(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_23A1F3EC8 + 4 * byte_23A2340F2[a2]))(1701667182);
}

uint64_t sub_23A1F3EC8(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 1701667182 && v1 == 0xE400000000000000)
    v2 = 1;
  else
    v2 = sub_23A233660();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

NSObject *sub_23A1F3FF4(unint64_t a1, uint64_t (*a2)(uint64_t), unint64_t *a3, uint64_t a4)
{
  NSObject *v4;
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
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  unint64_t v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  char *v41;
  NSObject *v42;
  os_log_type_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  int v47;
  os_log_type_t v48;
  void (*v49)(char *, uint64_t);
  os_log_t v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t (*v53)(uint64_t);
  uint64_t v54;
  os_log_t v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  NSObject *v59;
  NSObject *v60;
  os_log_type_t v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  NSObject *v65;
  uint64_t v66;
  unint64_t v67;
  unint64_t v68;
  char *v69;
  NSObject *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  NSObject *v75;
  os_log_type_t v76;
  os_log_type_t v77;
  uint64_t v78;
  uint8_t *v79;
  uint64_t v80;
  unint64_t v81;
  os_log_t v82;
  uint64_t v83;
  char *v85;
  uint64_t v86;
  char *v87;
  NSObject *v88;
  unint64_t *v89;
  uint64_t (*v90)(uint64_t);
  NSObject *v91;
  os_log_t v92;
  uint64_t v93;
  char *v94;
  os_log_t v95;
  NSObject *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  NSObject *v102;
  NSObject *v103;

  v90 = a2;
  v91 = a4;
  v89 = a3;
  v6 = sub_23A2330D8();
  v7 = *(_QWORD *)(v6 - 8);
  v97 = v6;
  v98 = v7;
  v8 = MEMORY[0x24BDAC7A8](v6);
  v87 = (char *)&v85 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v88 = ((char *)&v85 - v11);
  v12 = MEMORY[0x24BDAC7A8](v10);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v85 - v13;
  v15 = sub_23A23300C();
  v16 = *(_QWORD *)(v15 - 8);
  v99 = v15;
  v100 = v16;
  v17 = MEMORY[0x24BDAC7A8](v15);
  v92 = (os_log_t)((char *)&v85 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  v19 = MEMORY[0x24BDAC7A8](v17);
  v93 = (uint64_t)&v85 - v20;
  v21 = MEMORY[0x24BDAC7A8](v19);
  MEMORY[0x24BDAC7A8](v21);
  v23 = ((char *)&v85 - v22);
  v24 = sub_23A232E80();
  v86 = *(_QWORD *)(v24 - 8);
  v25 = MEMORY[0x24BDAC7A8](v24);
  v85 = (char *)&v85 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = MEMORY[0x24BDAC7A8](v25);
  v94 = (char *)&v85 - v28;
  MEMORY[0x24BDAC7A8](v27);
  v30 = (char *)&v85 - v29;
  v96 = a1;
  v31 = sub_23A21F680();
  if (v4)
  {
    v103 = v4;
    v33 = v4;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256951AE0);
    v34 = v24;
    if ((swift_dynamicCast() & 1) != 0)
    {
      MEMORY[0x23B845920](v4);
      v35 = v86;
      v36 = v94;
      (*(void (**)(char *, char *, uint64_t))(v86 + 32))(v94, v30, v34);
      v38 = v99;
      v37 = v100;
      (*(void (**)(uint64_t, os_log_t, uint64_t))(v100 + 16))(v93, v95, v99);
      v39 = v97;
      v40 = v88;
      (*(void (**)(NSObject *, NSObject *, uint64_t))(v98 + 16))(v88, v96, v97);
      v41 = v85;
      (*(void (**)(char *, char *, uint64_t))(v35 + 16))(v85, v36, v34);
      v42 = sub_23A232FF4();
      v43 = sub_23A233264();
      if (os_log_type_enabled(v42, v43))
      {
        v44 = swift_slowAlloc();
        v96 = swift_slowAlloc();
        v102 = v96;
        *(_DWORD *)v44 = 136446466;
        sub_23A1F58C8(&qword_256951AD8, (uint64_t (*)(uint64_t))MEMORY[0x24BEE60D8], MEMORY[0x24BEE60F8]);
        v95 = v42;
        v45 = sub_23A2334E0();
        v101 = sub_23A21FD94(v45, v46, (uint64_t *)&v102);
        sub_23A233288();
        swift_bridgeObjectRelease();
        (*(void (**)(NSObject *, uint64_t))(v98 + 8))(v40, v39);
        *(_WORD *)(v44 + 12) = 1024;
        sub_23A1F58C8((unint64_t *)&qword_256951AD0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCAFE0], MEMORY[0x24BDCAFD8]);
        sub_23A232F10();
        v47 = sub_23A233090();
        v48 = v43;
        v49 = *(void (**)(char *, uint64_t))(v35 + 8);
        v49(v41, v34);
        LODWORD(v101) = v47;
        sub_23A233288();
        v50 = v95;
        _os_log_impl(&dword_23A1F0000, v95, v48, "Failed to load file %{public}s: %{darwin.errno}d", (uint8_t *)v44, 0x12u);
        v40 = v96;
        swift_arrayDestroy();
        MEMORY[0x23B845A58](v40, -1, -1);
        MEMORY[0x23B845A58](v44, -1, -1);

        (*(void (**)(uint64_t, uint64_t))(v100 + 8))(v93, v99);
      }
      else
      {
        v49 = *(void (**)(char *, uint64_t))(v35 + 8);
        v49(v41, v34);
        (*(void (**)(NSObject *, uint64_t))(v98 + 8))(v40, v39);

        (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v93, v38);
      }
      v69 = v94;
      sub_23A232E74();
      swift_willThrow();
      v49(v69, v34);
      MEMORY[0x23B845920](v103);
    }
    else
    {
      MEMORY[0x23B845920](v103);
      v54 = v99;
      v55 = v92;
      (*(void (**)(os_log_t, os_log_t, uint64_t))(v100 + 16))(v92, v95, v99);
      v57 = v97;
      v56 = v98;
      v58 = v87;
      (*(void (**)(char *, NSObject *, uint64_t))(v98 + 16))(v87, v96, v97);
      v59 = v4;
      v60 = v4;
      v40 = sub_23A232FF4();
      v61 = sub_23A233264();
      if (os_log_type_enabled(v40, v61))
      {
        v62 = swift_slowAlloc();
        v96 = swift_slowAlloc();
        v103 = v96;
        *(_DWORD *)v62 = 136446466;
        sub_23A1F58C8(&qword_256951AD8, (uint64_t (*)(uint64_t))MEMORY[0x24BEE60D8], MEMORY[0x24BEE60F8]);
        v63 = sub_23A2334E0();
        v102 = sub_23A21FD94(v63, v64, (uint64_t *)&v103);
        sub_23A233288();
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v98 + 8))(v58, v57);
        *(_WORD *)(v62 + 12) = 2082;
        v102 = v4;
        v65 = v4;
        v66 = sub_23A233144();
        v102 = sub_23A21FD94(v66, v67, (uint64_t *)&v103);
        sub_23A233288();
        swift_bridgeObjectRelease();
        MEMORY[0x23B845920](v4);
        MEMORY[0x23B845920](v4);
        _os_log_impl(&dword_23A1F0000, v40, v61, "Failed to load file %{public}s: %{public}s", (uint8_t *)v62, 0x16u);
        v68 = (unint64_t)v96;
        swift_arrayDestroy();
        MEMORY[0x23B845A58](v68, -1, -1);
        MEMORY[0x23B845A58](v62, -1, -1);

        (*(void (**)(os_log_t, uint64_t))(v100 + 8))(v92, v99);
      }
      else
      {
        (*(void (**)(char *, uint64_t))(v56 + 8))(v58, v57);
        MEMORY[0x23B845920](v4);
        MEMORY[0x23B845920](v4);

        (*(void (**)(os_log_t, uint64_t))(v100 + 8))(v55, v54);
      }
      swift_willThrow();
    }
  }
  else
  {
    v51 = v31;
    v52 = v32;
    v94 = v14;
    sub_23A232EE0();
    swift_allocObject();
    sub_23A1F5840(v51, v52);
    sub_23A232ED4();
    v53 = v90;
    v90(0);
    sub_23A1F58C8(v89, v53, (uint64_t)v91);
    sub_23A232EC8();
    swift_release();
    sub_23A1F5884(v51, v52);
    v40 = v103;
    v70 = v23;
    v71 = v51;
    v72 = v99;
    (*(void (**)(NSObject *, os_log_t, uint64_t))(v100 + 16))(v23, v95, v99);
    v73 = v97;
    v74 = v94;
    (*(void (**)(char *, NSObject *, uint64_t))(v98 + 16))(v94, v96, v97);
    v75 = sub_23A232FF4();
    v76 = sub_23A233258();
    v96 = v52;
    v77 = v76;
    if (os_log_type_enabled(v75, v76))
    {
      v92 = v75;
      v78 = swift_slowAlloc();
      v95 = v70;
      v79 = (uint8_t *)v78;
      v91 = swift_slowAlloc();
      v103 = v91;
      v93 = v71;
      *(_DWORD *)v79 = 136446210;
      sub_23A1F58C8(&qword_256951AD8, (uint64_t (*)(uint64_t))MEMORY[0x24BEE60D8], MEMORY[0x24BEE60F8]);
      v80 = sub_23A2334E0();
      v102 = sub_23A21FD94(v80, v81, (uint64_t *)&v103);
      sub_23A233288();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v98 + 8))(v74, v73);
      v82 = v92;
      _os_log_impl(&dword_23A1F0000, v92, v77, "Loaded file %{public}s", v79, 0xCu);
      v83 = (uint64_t)v91;
      swift_arrayDestroy();
      MEMORY[0x23B845A58](v83, -1, -1);
      MEMORY[0x23B845A58](v79, -1, -1);
      sub_23A1F5884(v93, (unint64_t)v96);

      (*(void (**)(os_log_t, uint64_t))(v100 + 8))(v95, v99);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v98 + 8))(v74, v73);
      sub_23A1F5884(v71, (unint64_t)v96);

      (*(void (**)(NSObject *, uint64_t))(v100 + 8))(v70, v72);
    }
  }
  return v40;
}

uint64_t sub_23A1F4BDC(uint64_t a1)
{
  NSObject *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
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
  uint64_t v23;
  char *v24;
  uint64_t v25;
  unint64_t v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint8_t *v31;
  uint64_t v32;
  os_log_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  os_log_type_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  int v43;
  void (*v44)(uint64_t, uint64_t);
  os_log_t v45;
  unint64_t v46;
  unint64_t v47;
  uint64_t v48;
  os_log_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  NSObject *v53;
  NSObject *v54;
  NSObject *v55;
  os_log_type_t v56;
  int v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  NSObject *v61;
  uint64_t v62;
  unint64_t v63;
  uint64_t v64;
  char *v65;
  char *v66;
  uint64_t v67;
  NSObject *v68;
  os_log_type_t v69;
  int v70;
  uint8_t *v71;
  uint64_t v72;
  unint64_t v73;
  uint8_t *v74;
  os_log_t v75;
  uint64_t v77;
  char *v78;
  uint8_t *v79;
  char *v80;
  os_log_t v81;
  os_log_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  os_log_t v90;
  uint64_t v91;
  NSObject *v92;

  v86 = sub_23A2330D8();
  v89 = *(_QWORD *)(v86 - 8);
  v3 = MEMORY[0x24BDAC7A8](v86);
  v78 = (char *)&v77 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v80 = (char *)&v77 - v6;
  v7 = MEMORY[0x24BDAC7A8](v5);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v77 - v8;
  v10 = sub_23A23300C();
  v87 = *(_QWORD *)(v10 - 8);
  v88 = v10;
  v11 = MEMORY[0x24BDAC7A8](v10);
  v81 = (os_log_t)((char *)&v77 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  v13 = MEMORY[0x24BDAC7A8](v11);
  v82 = (os_log_t)((char *)&v77 - v14);
  v15 = MEMORY[0x24BDAC7A8](v13);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v77 - v16;
  v18 = sub_23A232E80();
  v77 = *(_QWORD *)(v18 - 8);
  v19 = MEMORY[0x24BDAC7A8](v18);
  v83 = (uint64_t)&v77 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = MEMORY[0x24BDAC7A8](v19);
  v79 = (uint8_t *)&v77 - v22;
  MEMORY[0x24BDAC7A8](v21);
  v24 = (char *)&v77 - v23;
  v85 = a1;
  v25 = sub_23A21F680();
  if (v1)
  {
    v90 = v1;
    v27 = v1;
    v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_256951AE0);
    v29 = v18;
    if ((swift_dynamicCast() & 1) != 0)
    {
      MEMORY[0x23B845920](v1);
      v30 = v77;
      v31 = v79;
      (*(void (**)(uint8_t *, char *, uint64_t))(v77 + 32))(v79, v24, v18);
      v32 = v88;
      v33 = v82;
      (*(void (**)(os_log_t, uint64_t, uint64_t))(v87 + 16))(v82, v84, v88);
      v34 = v80;
      v35 = v86;
      (*(void (**)(char *, uint64_t, uint64_t))(v89 + 16))(v80, v85, v86);
      v36 = v83;
      (*(void (**)(uint64_t, uint8_t *, uint64_t))(v30 + 16))(v83, v31, v29);
      v37 = sub_23A232FF4();
      v38 = sub_23A233264();
      LODWORD(v85) = v38;
      if (os_log_type_enabled(v37, v38))
      {
        v39 = swift_slowAlloc();
        v84 = swift_slowAlloc();
        v92 = v84;
        *(_DWORD *)v39 = 136446466;
        sub_23A1F58C8(&qword_256951AD8, (uint64_t (*)(uint64_t))MEMORY[0x24BEE60D8], MEMORY[0x24BEE60F8]);
        v81 = v37;
        v40 = sub_23A2334E0();
        v91 = sub_23A21FD94(v40, v41, (uint64_t *)&v92);
        sub_23A233288();
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v89 + 8))(v34, v35);
        *(_WORD *)(v39 + 12) = 1024;
        sub_23A1F58C8((unint64_t *)&qword_256951AD0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCAFE0], MEMORY[0x24BDCAFD8]);
        v32 = (uint64_t)&v91;
        v42 = v83;
        sub_23A232F10();
        v43 = sub_23A233090();
        v44 = *(void (**)(uint64_t, uint64_t))(v30 + 8);
        v44(v42, v29);
        LODWORD(v91) = v43;
        sub_23A233288();
        v45 = v81;
        _os_log_impl(&dword_23A1F0000, v81, (os_log_type_t)v85, "Failed to load file %{public}s: %{darwin.errno}d", (uint8_t *)v39, 0x12u);
        v46 = v84;
        swift_arrayDestroy();
        MEMORY[0x23B845A58](v46, -1, -1);
        MEMORY[0x23B845A58](v39, -1, -1);

        (*(void (**)(os_log_t, uint64_t))(v87 + 8))(v33, v88);
      }
      else
      {
        v44 = *(void (**)(uint64_t, uint64_t))(v30 + 8);
        v44(v36, v29);
        (*(void (**)(char *, uint64_t))(v89 + 8))(v34, v35);

        (*(void (**)(os_log_t, uint64_t))(v87 + 8))(v33, v32);
      }
      sub_23A232E74();
      swift_willThrow();
      v44((uint64_t)v31, v29);
      MEMORY[0x23B845920](v90);
    }
    else
    {
      v83 = v28;
      MEMORY[0x23B845920](v90);
      v48 = v87;
      v32 = v88;
      v49 = v81;
      (*(void (**)(os_log_t, uint64_t, uint64_t))(v87 + 16))(v81, v84, v88);
      v50 = v89;
      v51 = v78;
      v52 = v86;
      (*(void (**)(char *, uint64_t, uint64_t))(v89 + 16))(v78, v85, v86);
      v53 = v1;
      v54 = v1;
      v55 = sub_23A232FF4();
      v56 = sub_23A233264();
      v57 = v56;
      if (os_log_type_enabled(v55, v56))
      {
        v58 = swift_slowAlloc();
        v85 = swift_slowAlloc();
        v90 = (os_log_t)v85;
        *(_DWORD *)v58 = 136446466;
        LOBYTE(v32) = v58 + 4;
        sub_23A1F58C8(&qword_256951AD8, (uint64_t (*)(uint64_t))MEMORY[0x24BEE60D8], MEMORY[0x24BEE60F8]);
        LODWORD(v84) = v57;
        v59 = sub_23A2334E0();
        v92 = sub_23A21FD94(v59, v60, (uint64_t *)&v90);
        sub_23A233288();
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v89 + 8))(v51, v52);
        *(_WORD *)(v58 + 12) = 2082;
        v92 = v1;
        v61 = v1;
        v62 = sub_23A233144();
        v92 = sub_23A21FD94(v62, v63, (uint64_t *)&v90);
        sub_23A233288();
        swift_bridgeObjectRelease();
        MEMORY[0x23B845920](v1);
        MEMORY[0x23B845920](v1);
        _os_log_impl(&dword_23A1F0000, v55, (os_log_type_t)v84, "Failed to load file %{public}s: %{public}s", (uint8_t *)v58, 0x16u);
        v64 = v85;
        swift_arrayDestroy();
        MEMORY[0x23B845A58](v64, -1, -1);
        MEMORY[0x23B845A58](v58, -1, -1);

        (*(void (**)(os_log_t, uint64_t))(v48 + 8))(v49, v88);
      }
      else
      {
        (*(void (**)(char *, uint64_t))(v50 + 8))(v51, v52);
        MEMORY[0x23B845920](v1);
        MEMORY[0x23B845920](v1);

        (*(void (**)(os_log_t, uint64_t))(v48 + 8))(v49, v32);
      }
      swift_willThrow();
    }
  }
  else
  {
    v32 = v25;
    v47 = v26;
    sub_23A232EE0();
    swift_allocObject();
    sub_23A1F5840(v32, v47);
    sub_23A232ED4();
    sub_23A1F5908();
    sub_23A232EC8();
    swift_release();
    sub_23A1F5884(v32, v47);
    v83 = v32;
    LOBYTE(v32) = (_BYTE)v90;
    v65 = v17;
    (*(void (**)(char *, uint64_t, uint64_t))(v87 + 16))(v17, v84, v88);
    v84 = v47;
    v66 = v9;
    v67 = v86;
    (*(void (**)(char *, uint64_t, uint64_t))(v89 + 16))(v9, v85, v86);
    v85 = (uint64_t)v65;
    v68 = sub_23A232FF4();
    v69 = sub_23A233258();
    v70 = v69;
    if (os_log_type_enabled(v68, v69))
    {
      v82 = v68;
      v71 = (uint8_t *)swift_slowAlloc();
      v81 = (os_log_t)swift_slowAlloc();
      v90 = v81;
      LODWORD(v80) = v70;
      *(_DWORD *)v71 = 136446210;
      v78 = (char *)(v71 + 4);
      v79 = v71;
      sub_23A1F58C8(&qword_256951AD8, (uint64_t (*)(uint64_t))MEMORY[0x24BEE60D8], MEMORY[0x24BEE60F8]);
      v72 = sub_23A2334E0();
      v92 = sub_23A21FD94(v72, v73, (uint64_t *)&v90);
      sub_23A233288();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v89 + 8))(v66, v67);
      v68 = v82;
      v74 = v79;
      _os_log_impl(&dword_23A1F0000, v82, (os_log_type_t)v80, "Loaded file %{public}s", v79, 0xCu);
      v75 = v81;
      swift_arrayDestroy();
      MEMORY[0x23B845A58](v75, -1, -1);
      MEMORY[0x23B845A58](v74, -1, -1);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v89 + 8))(v66, v67);
    }
    sub_23A1F5884(v83, v84);

    (*(void (**)(uint64_t, uint64_t))(v87 + 8))(v85, v88);
  }
  return v32 & 1;
}

uint64_t sub_23A1F57A0(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return a3();
}

uint64_t sub_23A1F57C8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return a3();
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
    result = MEMORY[0x23B8459A4]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_23A1F5840(uint64_t a1, unint64_t a2)
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

uint64_t sub_23A1F5884(uint64_t a1, unint64_t a2)
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

uint64_t sub_23A1F58C8(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x23B8459BC](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_23A1F5908()
{
  unint64_t result;

  result = qword_256951AF8;
  if (!qword_256951AF8)
  {
    result = MEMORY[0x23B8459BC](&unk_23A2353F0, &type metadata for Configuration);
    atomic_store(result, (unint64_t *)&qword_256951AF8);
  }
  return result;
}

uint64_t *sub_23A1F594C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_23A23300C();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = *(_OWORD *)((char *)a2 + v8 + 24);
    *(_OWORD *)((char *)a1 + v8 + 24) = v9;
    (**(void (***)(void))(v9 - 8))();
  }
  return a1;
}

uint64_t sub_23A1F59EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_23A23300C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  return __swift_destroy_boxed_opaque_existential_1(a1 + *(int *)(a2 + 20));
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_23A1F5A50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  __int128 v8;

  v6 = sub_23A23300C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = *(_OWORD *)(a2 + v7 + 24);
  *(_OWORD *)(a1 + v7 + 24) = v8;
  (**(void (***)(void))(v8 - 8))();
  return a1;
}

uint64_t sub_23A1F5AC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_23A23300C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + *(int *)(a3 + 20)), (uint64_t *)(a2 + *(int *)(a3 + 20)));
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE v11[24];

  if (result != a2)
  {
    v3 = result;
    v4 = result[3];
    v5 = a2[3];
    if (v4 == v5)
    {
      v9 = *(_QWORD *)(v4 - 8);
      if ((*(_BYTE *)(v9 + 82) & 2) != 0)
      {
        v10 = *a2;
        swift_retain();
        result = (uint64_t *)swift_release();
        *v3 = v10;
      }
      else
      {
        return (uint64_t *)(*(uint64_t (**)(uint64_t *, uint64_t *, uint64_t))(v9 + 24))(result, a2, result[3]);
      }
    }
    else
    {
      result[3] = v5;
      result[4] = a2[4];
      v6 = *(_QWORD *)(v4 - 8);
      v7 = *(_QWORD *)(v5 - 8);
      v8 = *(_DWORD *)(v7 + 80);
      if ((*(_BYTE *)(v6 + 82) & 2) != 0)
      {
        if ((v8 & 0x20000) != 0)
        {
          *result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(_BYTE *, uint64_t *, uint64_t))(v6 + 32))(v11, result, v4);
        if ((v8 & 0x20000) != 0)
        {
          *v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v11, v4);
      }
    }
  }
  return result;
}

uint64_t sub_23A1F5C8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;

  v6 = sub_23A23300C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = *(_OWORD *)(v9 + 16);
  *(_OWORD *)v8 = *(_OWORD *)v9;
  *(_OWORD *)(v8 + 16) = v10;
  *(_QWORD *)(v8 + 32) = *(_QWORD *)(v9 + 32);
  return a1;
}

uint64_t sub_23A1F5CF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;

  v6 = sub_23A23300C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  __swift_destroy_boxed_opaque_existential_1(a1 + v7);
  v10 = *(_OWORD *)(v9 + 16);
  *(_OWORD *)v8 = *(_OWORD *)v9;
  *(_OWORD *)(v8 + 16) = v10;
  *(_QWORD *)(v8 + 32) = *(_QWORD *)(v9 + 32);
  return a1;
}

uint64_t sub_23A1F5D6C()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A1F5D78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = sub_23A23300C();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20) + 24);
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t sub_23A1F5DF8()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A1F5E04(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_23A23300C();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20) + 24) = (a2 - 1);
  return result;
}

uint64_t type metadata accessor for RecordManager()
{
  uint64_t result;

  result = qword_256951B58;
  if (!qword_256951B58)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23A1F5EBC()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23A23300C();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for ProviderSideEffects(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for ProviderSideEffects(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  __swift_destroy_boxed_opaque_existential_1(a1 + 40);
  return __swift_destroy_boxed_opaque_existential_1(a1 + 80);
}

_OWORD *initializeWithCopy for ProviderSideEffects(_OWORD *a1, _OWORD *a2)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;

  v4 = *(_OWORD *)((char *)a2 + 24);
  *(_OWORD *)((char *)a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  v5 = a2[4];
  a1[4] = v5;
  (**(void (***)(uint64_t, uint64_t))(v5 - 8))((uint64_t)a1 + 40, (uint64_t)a2 + 40);
  v6 = *(_OWORD *)((char *)a2 + 104);
  *(_OWORD *)((char *)a1 + 104) = v6;
  (**(void (***)(uint64_t, uint64_t))(v6 - 8))((uint64_t)(a1 + 5), (uint64_t)(a2 + 5));
  return a1;
}

uint64_t *assignWithCopy for ProviderSideEffects(uint64_t *a1, uint64_t *a2)
{
  __swift_assign_boxed_opaque_existential_1(a1, a2);
  __swift_assign_boxed_opaque_existential_1(a1 + 5, a2 + 5);
  __swift_assign_boxed_opaque_existential_1(a1 + 10, a2 + 10);
  return a1;
}

__n128 __swift_memcpy120_8(uint64_t a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __n128 result;
  __int128 v6;
  __int128 v7;

  v2 = *a2;
  v3 = a2[1];
  v4 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)a1 = v2;
  *(_OWORD *)(a1 + 16) = v3;
  result = (__n128)a2[4];
  v6 = a2[5];
  v7 = a2[6];
  *(_QWORD *)(a1 + 112) = *((_QWORD *)a2 + 14);
  *(_OWORD *)(a1 + 80) = v6;
  *(_OWORD *)(a1 + 96) = v7;
  *(__n128 *)(a1 + 64) = result;
  return result;
}

uint64_t assignWithTake for ProviderSideEffects(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  __int128 v5;

  __swift_destroy_boxed_opaque_existential_1(a1);
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  __swift_destroy_boxed_opaque_existential_1(a1 + 40);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  __swift_destroy_boxed_opaque_existential_1(a1 + 80);
  v5 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v5;
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  return a1;
}

uint64_t getEnumTagSinglePayload for ProviderSideEffects(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 120))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ProviderSideEffects(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 120) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 24) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 120) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ProviderSideEffects()
{
  return &type metadata for ProviderSideEffects;
}

uint64_t sub_23A1F6194@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;

  v2 = type metadata accessor for FilesystemProvider();
  v3 = swift_allocObject();
  sub_23A233000();
  a1[3] = v2;
  a1[4] = (uint64_t)&off_250B30050;
  *a1 = v3;
  v4 = type metadata accessor for NotificationProvider();
  v5 = swift_allocObject();
  sub_23A233000();
  a1[8] = v4;
  a1[9] = (uint64_t)&off_250B30090;
  a1[5] = v5;
  v6 = type metadata accessor for SysctlProvider();
  v7 = swift_allocObject();
  result = sub_23A233000();
  a1[13] = v6;
  a1[14] = (uint64_t)&off_250B2FC70;
  a1[10] = v7;
  return result;
}

uint64_t User.init(_:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t result;
  uint64_t v27;
  id v28;
  uint64_t v29;
  void (*v30)(uint64_t, char *, uint64_t);
  int *v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unsigned int v46;
  uint64_t v47;
  uint64_t v48;

  v4 = sub_23A232FE8();
  v47 = *(_QWORD *)(v4 - 8);
  v5 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v7 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v39 - v8;
  v10 = objc_msgSend(a1, sel_uuid);
  sub_23A232FD0();

  v46 = objc_msgSend(a1, "uid");
  v11 = objc_msgSend(a1, sel_name);
  v12 = sub_23A23312C();
  v44 = v13;
  v45 = v12;

  v14 = objc_msgSend(a1, sel_primaryGroupUUID);
  sub_23A232FD0();

  v15 = objc_msgSend(a1, sel_fullName);
  v16 = sub_23A23312C();
  v42 = v17;
  v43 = v16;

  v18 = objc_msgSend(a1, sel_homeDirectory);
  v19 = sub_23A23312C();
  v40 = v20;
  v41 = v19;

  v21 = objc_msgSend(a1, sel_shell);
  v22 = sub_23A23312C();
  v24 = v23;

  v25 = objc_msgSend(a1, sel_memberships);
  v48 = 0;
  sub_23A1F65D8();
  result = sub_23A233234();
  v27 = v48;
  if (v48)
  {

    v28 = objc_msgSend(a1, sel_aliases);
    v48 = 0;
    result = sub_23A233234();
    v29 = v48;
    if (v48)
    {

      v30 = *(void (**)(uint64_t, char *, uint64_t))(v47 + 32);
      v30(a2, v9, v4);
      v31 = (int *)type metadata accessor for User(0);
      *(_DWORD *)(a2 + v31[5]) = v46;
      v32 = (uint64_t *)(a2 + v31[6]);
      v33 = v44;
      *v32 = v45;
      v32[1] = v33;
      result = ((uint64_t (*)(uint64_t, char *, uint64_t))v30)(a2 + v31[7], v7, v4);
      v34 = (uint64_t *)(a2 + v31[8]);
      v35 = v42;
      *v34 = v43;
      v34[1] = v35;
      v36 = (uint64_t *)(a2 + v31[9]);
      v37 = v40;
      *v36 = v41;
      v36[1] = v37;
      v38 = (uint64_t *)(a2 + v31[10]);
      *v38 = v22;
      v38[1] = v24;
      *(_QWORD *)(a2 + v31[11]) = v27;
      *(_QWORD *)(a2 + v31[12]) = v29;
      return result;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

unint64_t sub_23A1F65D8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256951B90;
  if (!qword_256951B90)
  {
    v1 = sub_23A232FE8();
    result = MEMORY[0x23B8459BC](MEMORY[0x24BDCEA88], v1);
    atomic_store(result, (unint64_t *)&qword_256951B90);
  }
  return result;
}

id DDIUser.init(_:)(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  unsigned int v17;
  id ObjCClassFromMetadata;

  ObjCClassFromMetadata = (id)swift_getObjCClassFromMetadata();
  v2 = (void *)sub_23A232FB8();
  v3 = type metadata accessor for User(0);
  v17 = *(_DWORD *)(a1 + *(int *)(v3 + 20));
  v4 = (void *)sub_23A233120();
  v5 = (void *)sub_23A232FB8();
  v6 = (void *)sub_23A233120();
  v7 = (void *)sub_23A233120();
  v8 = (void *)sub_23A233120();
  sub_23A232FE8();
  sub_23A1F65D8();
  v9 = (void *)sub_23A233228();
  v10 = objc_msgSend(ObjCClassFromMetadata, sel_userWithUUID_uid_name_primaryGroupUUID_fullName_homeDirectory_shell_memberships_, v2, v17, v4, v5, v6, v7, v8, v9);

  v11 = *(_QWORD *)(a1 + *(int *)(v3 + 48));
  v12 = v10;
  sub_23A1F680C(v11);
  v13 = objc_allocWithZone(MEMORY[0x24BDBCEF0]);
  v14 = (void *)sub_23A233228();
  swift_bridgeObjectRelease();
  v15 = objc_msgSend(v13, sel_initWithSet_, v14);

  objc_msgSend(v12, sel_setAliases_, v15);
  sub_23A1F8F44(a1, type metadata accessor for User);
  return v12;
}

uint64_t sub_23A1F680C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t result;
  int64_t v10;
  unint64_t v11;
  uint64_t v12;
  int64_t v13;
  uint64_t v14;
  int64_t v15;
  int64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  char v20;
  unint64_t v21;
  BOOL v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;

  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256951BD8);
    v2 = sub_23A2332E8();
  }
  else
  {
    v2 = MEMORY[0x24BEE4B08];
  }
  v3 = a1 + 56;
  v4 = -1 << *(_BYTE *)(a1 + 32);
  if (-v4 < 64)
    v5 = ~(-1 << -(char)v4);
  else
    v5 = -1;
  v6 = v5 & *(_QWORD *)(a1 + 56);
  v7 = (unint64_t)(63 - v4) >> 6;
  v8 = v2 + 56;
  swift_bridgeObjectRetain();
  result = swift_retain();
  v10 = 0;
  while (1)
  {
    if (v6)
    {
      v6 &= v6 - 1;
      goto LABEL_28;
    }
    v13 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v13 >= v7)
      goto LABEL_37;
    v14 = *(_QWORD *)(v3 + 8 * v13);
    v15 = v10 + 1;
    if (!v14)
    {
      v15 = v10 + 2;
      if (v10 + 2 >= v7)
        goto LABEL_37;
      v14 = *(_QWORD *)(v3 + 8 * v15);
      if (!v14)
      {
        v15 = v10 + 3;
        if (v10 + 3 >= v7)
          goto LABEL_37;
        v14 = *(_QWORD *)(v3 + 8 * v15);
        if (!v14)
        {
          v15 = v10 + 4;
          if (v10 + 4 >= v7)
            goto LABEL_37;
          v14 = *(_QWORD *)(v3 + 8 * v15);
          if (!v14)
            break;
        }
      }
    }
LABEL_27:
    v6 = (v14 - 1) & v14;
    v10 = v15;
LABEL_28:
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    result = sub_23A2332C4();
    v17 = -1 << *(_BYTE *)(v2 + 32);
    v18 = result & ~v17;
    v19 = v18 >> 6;
    if (((-1 << v18) & ~*(_QWORD *)(v8 + 8 * (v18 >> 6))) != 0)
    {
      v11 = __clz(__rbit64((-1 << v18) & ~*(_QWORD *)(v8 + 8 * (v18 >> 6)))) | v18 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v20 = 0;
      v21 = (unint64_t)(63 - v17) >> 6;
      do
      {
        if (++v19 == v21 && (v20 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        v22 = v19 == v21;
        if (v19 == v21)
          v19 = 0;
        v20 |= v22;
        v23 = *(_QWORD *)(v8 + 8 * v19);
      }
      while (v23 == -1);
      v11 = __clz(__rbit64(~v23)) + (v19 << 6);
    }
    *(_QWORD *)(v8 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
    v12 = *(_QWORD *)(v2 + 48) + 40 * v11;
    *(_OWORD *)v12 = v24;
    *(_OWORD *)(v12 + 16) = v25;
    *(_QWORD *)(v12 + 32) = v26;
    ++*(_QWORD *)(v2 + 16);
  }
  v16 = v10 + 5;
  if (v10 + 5 >= v7)
  {
LABEL_37:
    swift_release();
    sub_23A1F8F80();
    return v2;
  }
  v14 = *(_QWORD *)(v3 + 8 * v16);
  if (v14)
  {
    v15 = v10 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    v15 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v15 >= v7)
      goto LABEL_37;
    v14 = *(_QWORD *)(v3 + 8 * v15);
    ++v16;
    if (v14)
      goto LABEL_27;
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_23A1F6AFC(uint64_t a1)
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
  unint64_t v13;
  uint64_t v14;
  uint64_t result;
  int64_t v16;
  unint64_t v17;
  uint64_t v18;
  __int128 v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  int64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  char v29;
  unint64_t v30;
  BOOL v31;
  uint64_t v32;
  uint64_t v33;
  int64_t v34;
  uint64_t v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;

  v2 = sub_23A232FE8();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v33 - v7;
  v36 = a1;
  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256951BD8);
    v9 = sub_23A2332E8();
  }
  else
  {
    v9 = MEMORY[0x24BEE4B08];
  }
  v10 = *(_QWORD *)(v36 + 56);
  v35 = v36 + 56;
  v11 = -1 << *(_BYTE *)(v36 + 32);
  if (-v11 < 64)
    v12 = ~(-1 << -(char)v11);
  else
    v12 = -1;
  v13 = v12 & v10;
  v33 = -1 << *(_BYTE *)(v36 + 32);
  v34 = (unint64_t)(63 - v11) >> 6;
  v14 = v9 + 56;
  swift_bridgeObjectRetain();
  result = swift_retain();
  v16 = 0;
  while (1)
  {
    if (v13)
    {
      v20 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      v21 = v20 | (v16 << 6);
      goto LABEL_28;
    }
    v22 = v16 + 1;
    if (__OFADD__(v16, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v22 >= v34)
      goto LABEL_37;
    v23 = *(_QWORD *)(v35 + 8 * v22);
    v24 = v16 + 1;
    if (!v23)
    {
      v24 = v16 + 2;
      if (v16 + 2 >= v34)
        goto LABEL_37;
      v23 = *(_QWORD *)(v35 + 8 * v24);
      if (!v23)
      {
        v24 = v16 + 3;
        if (v16 + 3 >= v34)
          goto LABEL_37;
        v23 = *(_QWORD *)(v35 + 8 * v24);
        if (!v23)
        {
          v24 = v16 + 4;
          if (v16 + 4 >= v34)
            goto LABEL_37;
          v23 = *(_QWORD *)(v35 + 8 * v24);
          if (!v23)
            break;
        }
      }
    }
LABEL_27:
    v13 = (v23 - 1) & v23;
    v21 = __clz(__rbit64(v23)) + (v24 << 6);
    v16 = v24;
LABEL_28:
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v8, *(_QWORD *)(v36 + 48) + *(_QWORD *)(v3 + 72) * v21, v2);
    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v6, v8, v2);
    swift_dynamicCast();
    v37 = v40;
    v38 = v41;
    v39 = v42;
    result = sub_23A2332C4();
    v26 = -1 << *(_BYTE *)(v9 + 32);
    v27 = result & ~v26;
    v28 = v27 >> 6;
    if (((-1 << v27) & ~*(_QWORD *)(v14 + 8 * (v27 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v27) & ~*(_QWORD *)(v14 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
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
        v32 = *(_QWORD *)(v14 + 8 * v28);
      }
      while (v32 == -1);
      v17 = __clz(__rbit64(~v32)) + (v28 << 6);
    }
    *(_QWORD *)(v14 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    v18 = *(_QWORD *)(v9 + 48) + 40 * v17;
    v19 = v38;
    *(_OWORD *)v18 = v37;
    *(_OWORD *)(v18 + 16) = v19;
    *(_QWORD *)(v18 + 32) = v39;
    ++*(_QWORD *)(v9 + 16);
  }
  v25 = v16 + 5;
  if (v16 + 5 >= v34)
  {
LABEL_37:
    swift_release();
    sub_23A1F8F80();
    return v9;
  }
  v23 = *(_QWORD *)(v35 + 8 * v25);
  if (v23)
  {
    v24 = v16 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    v24 = v25 + 1;
    if (__OFADD__(v25, 1))
      break;
    if (v24 >= v34)
      goto LABEL_37;
    v23 = *(_QWORD *)(v35 + 8 * v24);
    ++v25;
    if (v23)
      goto LABEL_27;
  }
LABEL_39:
  __break(1u);
  return result;
}

int *Group.init(_:)@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  int *result;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  unsigned int v26;
  uint64_t v27;

  v4 = sub_23A232FE8();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = objc_msgSend(a1, sel_uuid);
  sub_23A232FD0();

  v26 = objc_msgSend(a1, "gid");
  v9 = objc_msgSend(a1, sel_name);
  v10 = sub_23A23312C();
  v24 = v11;
  v25 = v10;

  v12 = objc_msgSend(a1, sel_fullName);
  v13 = sub_23A23312C();
  v15 = v14;

  v16 = objc_msgSend(a1, sel_nestedGroups);
  v27 = 0;
  sub_23A1F65D8();
  result = (int *)sub_23A233234();
  v18 = v27;
  if (v27)
  {

    v19 = objc_msgSend(a1, sel_aliases);
    v27 = 0;
    result = (int *)sub_23A233234();
    v20 = v27;
    if (v27)
    {

      (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))(a2, v7, v4);
      result = (int *)type metadata accessor for Group(0);
      *(_DWORD *)(a2 + result[5]) = v26;
      v21 = (uint64_t *)(a2 + result[6]);
      v22 = v24;
      *v21 = v25;
      v21[1] = v22;
      v23 = (uint64_t *)(a2 + result[7]);
      *v23 = v13;
      v23[1] = v15;
      *(_QWORD *)(a2 + result[8]) = v18;
      *(_QWORD *)(a2 + result[9]) = v20;
      return result;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

id DDIGroup.init(_:)(uint64_t a1)
{
  void *ObjCClassFromMetadata;
  void *v3;
  int *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;

  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  v3 = (void *)sub_23A232FB8();
  v4 = (int *)type metadata accessor for Group(0);
  v5 = *(unsigned int *)(a1 + v4[5]);
  v6 = (void *)sub_23A233120();
  v7 = (void *)sub_23A233120();
  v8 = objc_msgSend(ObjCClassFromMetadata, sel_groupWithUUID_gid_name_fullName_, v3, v5, v6, v7);

  v9 = *(_QWORD *)(a1 + v4[8]);
  v10 = v8;
  sub_23A1F6AFC(v9);
  v11 = objc_allocWithZone(MEMORY[0x24BDBCEF0]);
  v12 = (void *)sub_23A233228();
  swift_bridgeObjectRelease();
  v13 = objc_msgSend(v11, sel_initWithSet_, v12);

  objc_msgSend(v10, sel_setNestedGroups_, v13);
  sub_23A1F680C(*(_QWORD *)(a1 + v4[9]));
  v14 = objc_allocWithZone(MEMORY[0x24BDBCEF0]);
  v15 = (void *)sub_23A233228();
  swift_bridgeObjectRelease();
  v16 = objc_msgSend(v14, sel_initWithSet_, v15);

  objc_msgSend(v10, sel_setAliases_, v16);
  sub_23A1F8F44(a1, type metadata accessor for Group);
  return v10;
}

void static ObjcCompatibility.swiftInitializeLocalUsersAndGroupsAndPerform(_:)(const void *a1)
{
  void *v1;
  _QWORD v2[4];

  v1 = _Block_copy(a1);
  v2[2] = v1;
  if (qword_256951AC0 != -1)
    swift_once();
  sub_23A1F84EC((void (*)(unint64_t *, _QWORD **))sub_23A1F7A28, (uint64_t)v2, qword_2569524F8);
  _Block_release(v1);
}

uint64_t sub_23A1F72C8(unint64_t *a1, unint64_t *a2, void (**a3)(_QWORD, _QWORD, _QWORD))
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  uint64_t result;
  unint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  unint64_t v49;
  unint64_t v50;
  unint64_t *v51;
  char *v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  id v58;
  unint64_t v59;
  unint64_t v60;
  unint64_t *v61;
  _QWORD v62[3];
  uint64_t v63;
  char *v64;
  uint64_t v65;
  unint64_t *v66;
  uint64_t v67;
  char *v68;
  void (**v69)(_QWORD, _QWORD, _QWORD);
  uint64_t v70;
  char *v71;
  unint64_t *v72;
  char *v73;
  unint64_t v74;

  v69 = a3;
  v72 = a2;
  v4 = type metadata accessor for Group(0);
  v70 = *(_QWORD *)(v4 - 8);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v62 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x24BDAC7A8](v5);
  v10 = (char *)v62 - v9;
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)v62 - v11;
  v13 = type metadata accessor for User(0);
  v14 = *(_QWORD *)(v13 - 8);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v64 = (char *)v62 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)v62 - v18;
  MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)v62 - v20;
  v66 = a1;
  v22 = *a1;
  v23 = *(_QWORD *)(*a1 + 16);
  v71 = v7;
  v65 = v14;
  if (v23)
  {
    v67 = (uint64_t)v12;
    v68 = v10;
    v74 = MEMORY[0x24BEE4AF8];
    swift_bridgeObjectRetain();
    sub_23A233384();
    sub_23A1F8E0C(0, &qword_256951BC0);
    v24 = *(unsigned __int8 *)(v14 + 80);
    v63 = v22;
    v25 = v22 + ((v24 + 32) & ~v24);
    v26 = *(_QWORD *)(v14 + 72);
    do
    {
      sub_23A1F8E44(v25, (uint64_t)v21, type metadata accessor for User);
      sub_23A1F8E44((uint64_t)v21, (uint64_t)v19, type metadata accessor for User);
      DDIUser.init(_:)((uint64_t)v19);
      sub_23A1F8F44((uint64_t)v21, type metadata accessor for User);
      sub_23A23336C();
      sub_23A233390();
      sub_23A23339C();
      sub_23A233378();
      v25 += v26;
      --v23;
    }
    while (v23);
    swift_bridgeObjectRelease();
    v7 = v71;
    v12 = (char *)v67;
    v10 = v68;
  }
  v27 = sub_23A1F8E0C(0, &qword_256951BC0);
  v28 = (void *)sub_23A2331A4();
  swift_bridgeObjectRelease();
  objc_msgSend(v28, sel_mutableCopy);

  sub_23A2332AC();
  swift_unknownObjectRelease();
  v29 = sub_23A1F8E0C(0, &qword_256951BC8);
  v67 = MEMORY[0x24BEE4AD8] + 8;
  swift_dynamicCast();
  v68 = v73;
  v30 = *v72;
  v31 = *(_QWORD *)(*v72 + 16);
  if (v31)
  {
    v62[2] = v29;
    v63 = v27;
    v74 = MEMORY[0x24BEE4AF8];
    swift_bridgeObjectRetain();
    sub_23A233384();
    sub_23A1F8E0C(0, &qword_256951BD0);
    v32 = *(unsigned __int8 *)(v70 + 80);
    v62[1] = v30;
    v33 = v30 + ((v32 + 32) & ~v32);
    v34 = *(_QWORD *)(v70 + 72);
    do
    {
      sub_23A1F8E44(v33, (uint64_t)v12, type metadata accessor for Group);
      sub_23A1F8E44((uint64_t)v12, (uint64_t)v10, type metadata accessor for Group);
      DDIGroup.init(_:)((uint64_t)v10);
      sub_23A1F8F44((uint64_t)v12, type metadata accessor for Group);
      sub_23A23336C();
      sub_23A233390();
      sub_23A23339C();
      sub_23A233378();
      v33 += v34;
      --v31;
    }
    while (v31);
    swift_bridgeObjectRelease();
    v7 = v71;
  }
  v35 = sub_23A1F8E0C(0, &qword_256951BD0);
  v36 = (void *)sub_23A2331A4();
  swift_bridgeObjectRelease();
  objc_msgSend(v36, sel_mutableCopy);

  sub_23A2332AC();
  swift_unknownObjectRelease();
  swift_dynamicCast();
  v37 = v73;
  v38 = v68;
  ((void (**)(_QWORD, char *, char *))v69)[2](v69, v68, v73);
  v74 = 0;
  v39 = v38;
  result = sub_23A2331B0();
  v41 = v74;
  if (!v74)
    goto LABEL_41;

  if (v41 >> 62)
  {
    swift_bridgeObjectRetain();
    v42 = sub_23A2333D8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v42 = *(_QWORD *)((v41 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  v43 = MEMORY[0x24BEE4AF8];
  v69 = (void (**)(_QWORD, _QWORD, _QWORD))v39;
  if (v42)
  {
    v74 = MEMORY[0x24BEE4AF8];
    result = sub_23A20D488(0, v42 & ~(v42 >> 63), 0);
    if (v42 < 0)
    {
      __break(1u);
LABEL_40:
      __break(1u);
LABEL_41:
      __break(1u);
      goto LABEL_42;
    }
    v67 = (uint64_t)v37;
    v68 = (char *)v35;
    v44 = 0;
    v45 = v74;
    v47 = (uint64_t)v64;
    v46 = v65;
    do
    {
      if ((v41 & 0xC000000000000001) != 0)
        v48 = (id)MEMORY[0x23B84508C](v44, v41);
      else
        v48 = *(id *)(v41 + 8 * v44 + 32);
      User.init(_:)(v48, v47);
      v74 = v45;
      v50 = *(_QWORD *)(v45 + 16);
      v49 = *(_QWORD *)(v45 + 24);
      if (v50 >= v49 >> 1)
      {
        sub_23A20D488(v49 > 1, v50 + 1, 1);
        v45 = v74;
      }
      ++v44;
      *(_QWORD *)(v45 + 16) = v50 + 1;
      sub_23A1F8E88(v47, v45+ ((*(unsigned __int8 *)(v46 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v46 + 80))+ *(_QWORD *)(v46 + 72) * v50, type metadata accessor for User);
    }
    while (v42 != v44);
    v7 = v71;
    v37 = (void *)v67;
    v43 = MEMORY[0x24BEE4AF8];
  }
  else
  {
    v45 = MEMORY[0x24BEE4AF8];
  }
  v51 = v66;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *v51 = v45;
  v74 = 0;
  v52 = v37;
  result = sub_23A2331B0();
  v53 = v74;
  if (v74)
  {

    if (v53 >> 62)
    {
      swift_bridgeObjectRetain();
      v54 = sub_23A2333D8();
      swift_bridgeObjectRelease();
      if (v54)
      {
LABEL_26:
        v74 = v43;
        result = sub_23A20D45C(0, v54 & ~(v54 >> 63), 0);
        if ((v54 & 0x8000000000000000) == 0)
        {
          v71 = v52;
          v55 = 0;
          v56 = v74;
          v57 = v70;
          do
          {
            if ((v53 & 0xC000000000000001) != 0)
              v58 = (id)MEMORY[0x23B84508C](v55, v53);
            else
              v58 = *(id *)(v53 + 8 * v55 + 32);
            Group.init(_:)(v58, (uint64_t)v7);
            v74 = v56;
            v60 = *(_QWORD *)(v56 + 16);
            v59 = *(_QWORD *)(v56 + 24);
            if (v60 >= v59 >> 1)
            {
              sub_23A20D45C(v59 > 1, v60 + 1, 1);
              v57 = v70;
              v56 = v74;
            }
            ++v55;
            *(_QWORD *)(v56 + 16) = v60 + 1;
            sub_23A1F8E88((uint64_t)v7, v56+ ((*(unsigned __int8 *)(v57 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v57 + 80))+ *(_QWORD *)(v57 + 72) * v60, type metadata accessor for Group);
          }
          while (v54 != v55);

          goto LABEL_38;
        }
        goto LABEL_40;
      }
    }
    else
    {
      v54 = *(_QWORD *)((v53 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v54)
        goto LABEL_26;
    }

    v56 = MEMORY[0x24BEE4AF8];
LABEL_38:
    v61 = v72;
    swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
    *v61 = v56;
    return result;
  }
LABEL_42:
  __break(1u);
  return result;
}

uint64_t sub_23A1F7A28(unint64_t *a1, unint64_t *a2)
{
  uint64_t v2;

  return sub_23A1F72C8(a1, a2, *(void (***)(_QWORD, _QWORD, _QWORD))(v2 + 16));
}

void static ObjcCompatibility.swiftUpdateLocalUsersAndGroups(perform:)(const void *a1)
{
  void *v1;
  _QWORD v2[5];

  v1 = _Block_copy(a1);
  _Block_copy(v1);
  if (qword_256951AC0 != -1)
    swift_once();
  v2[3] = &type metadata for ProviderSideEffects;
  v2[4] = &off_250B2F8C0;
  v2[0] = swift_allocObject();
  sub_23A1F8DB0(qword_2569524F8, (_OWORD *)(v2[0] + 16));
  sub_23A219558(v2, v1);
  _Block_release(v1);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
  _Block_release(v1);
}

void sub_23A1F7B7C(unint64_t *a1, unint64_t *a2, void (**a3)(_QWORD, _QWORD, _QWORD, _QWORD))
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id *v37;
  void *v38;
  uint64_t v39;
  id v40;
  unint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t *v49;
  char *v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  id v57;
  unint64_t v58;
  unint64_t v59;
  unint64_t *v60;
  _QWORD v61[3];
  uint64_t v62;
  char *v63;
  unint64_t *v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  void (**v68)(_QWORD, _QWORD, _QWORD, _QWORD);
  char *v69;
  unint64_t *v70;
  uint64_t v71;
  unint64_t v72;
  char *v73;

  v68 = a3;
  v70 = a2;
  v4 = type metadata accessor for Group(0);
  v65 = *(_QWORD *)(v4 - 8);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v63 = (char *)v61 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)v61 - v8;
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)v61 - v10;
  v12 = type metadata accessor for User(0);
  v13 = *(_QWORD *)(v12 - 8);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v69 = (char *)v61 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)v61 - v17;
  MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)v61 - v19;
  v64 = a1;
  v21 = *a1;
  v22 = *(_QWORD *)(*a1 + 16);
  v61[0] = v13;
  if (v22)
  {
    v66 = (uint64_t)v11;
    v67 = v9;
    v72 = MEMORY[0x24BEE4AF8];
    swift_bridgeObjectRetain();
    sub_23A233384();
    v71 = sub_23A1F8E0C(0, &qword_256951BC0);
    v23 = *(unsigned __int8 *)(v13 + 80);
    v62 = v21;
    v24 = v21 + ((v23 + 32) & ~v23);
    v25 = *(_QWORD *)(v13 + 72);
    do
    {
      sub_23A1F8E44(v24, (uint64_t)v20, type metadata accessor for User);
      sub_23A1F8E44((uint64_t)v20, (uint64_t)v18, type metadata accessor for User);
      DDIUser.init(_:)((uint64_t)v18);
      sub_23A1F8F44((uint64_t)v20, type metadata accessor for User);
      sub_23A23336C();
      sub_23A233390();
      sub_23A23339C();
      sub_23A233378();
      v24 += v25;
      --v22;
    }
    while (v22);
    swift_bridgeObjectRelease();
    v11 = (char *)v66;
    v9 = v67;
  }
  v26 = sub_23A1F8E0C(0, &qword_256951BC0);
  v27 = (void *)sub_23A2331A4();
  swift_bridgeObjectRelease();
  objc_msgSend(v27, sel_mutableCopy);

  sub_23A2332AC();
  swift_unknownObjectRelease();
  v28 = sub_23A1F8E0C(0, &qword_256951BC8);
  v66 = MEMORY[0x24BEE4AD8] + 8;
  swift_dynamicCast();
  v67 = v73;
  v29 = *v70;
  v30 = *(_QWORD *)(*v70 + 16);
  if (v30)
  {
    v61[2] = v28;
    v62 = v26;
    v72 = MEMORY[0x24BEE4AF8];
    swift_bridgeObjectRetain();
    sub_23A233384();
    v71 = sub_23A1F8E0C(0, &qword_256951BD0);
    v31 = *(unsigned __int8 *)(v65 + 80);
    v61[1] = v29;
    v32 = v29 + ((v31 + 32) & ~v31);
    v33 = *(_QWORD *)(v65 + 72);
    do
    {
      sub_23A1F8E44(v32, (uint64_t)v11, type metadata accessor for Group);
      sub_23A1F8E44((uint64_t)v11, (uint64_t)v9, type metadata accessor for Group);
      DDIGroup.init(_:)((uint64_t)v9);
      sub_23A1F8F44((uint64_t)v11, type metadata accessor for Group);
      sub_23A23336C();
      sub_23A233390();
      sub_23A23339C();
      sub_23A233378();
      v32 += v33;
      --v30;
    }
    while (v30);
    swift_bridgeObjectRelease();
  }
  v34 = sub_23A1F8E0C(0, &qword_256951BD0);
  v35 = (void *)sub_23A2331A4();
  swift_bridgeObjectRelease();
  objc_msgSend(v35, sel_mutableCopy);

  sub_23A2332AC();
  swift_unknownObjectRelease();
  swift_dynamicCast();
  v36 = v73;
  v37 = (id *)swift_slowAlloc();
  v38 = v67;
  ((void (**)(_QWORD, char *, void *, id *))v68)[2](v68, v67, v36, v37);
  v39 = (uint64_t)v69;
  if (*v37)
  {
    *v37;
    swift_willThrow();
    MEMORY[0x23B845A58](v37, -1, -1);

    return;
  }
  v72 = 0;
  v40 = v38;
  sub_23A2331B0();
  v41 = v72;
  if (!v72)
    goto LABEL_42;
  v71 = (uint64_t)v37;

  if (v41 >> 62)
  {
    swift_bridgeObjectRetain();
    v42 = sub_23A2333D8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v42 = *(_QWORD *)((v41 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  v43 = MEMORY[0x24BEE4AF8];
  v68 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))v40;
  if (v42)
  {
    v66 = (uint64_t)v36;
    v67 = (char *)v34;
    v72 = MEMORY[0x24BEE4AF8];
    sub_23A20D488(0, v42 & ~(v42 >> 63), 0);
    if (v42 < 0)
    {
      __break(1u);
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      goto LABEL_43;
    }
    v44 = 0;
    v43 = v72;
    v45 = v61[0];
    do
    {
      if ((v41 & 0xC000000000000001) != 0)
        v46 = (id)MEMORY[0x23B84508C](v44, v41);
      else
        v46 = *(id *)(v41 + 8 * v44 + 32);
      User.init(_:)(v46, v39);
      v72 = v43;
      v48 = *(_QWORD *)(v43 + 16);
      v47 = *(_QWORD *)(v43 + 24);
      if (v48 >= v47 >> 1)
      {
        sub_23A20D488(v47 > 1, v48 + 1, 1);
        v43 = v72;
      }
      ++v44;
      *(_QWORD *)(v43 + 16) = v48 + 1;
      sub_23A1F8E88(v39, v43+ ((*(unsigned __int8 *)(v45 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v45 + 80))+ *(_QWORD *)(v45 + 72) * v48, type metadata accessor for User);
    }
    while (v42 != v44);
    v36 = (void *)v66;
  }
  v49 = v64;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *v49 = v43;
  v72 = 0;
  v50 = v36;
  sub_23A2331B0();
  v51 = v72;
  if (v72)
  {

    v52 = (uint64_t)v63;
    if (v51 >> 62)
    {
      swift_bridgeObjectRetain();
      v53 = sub_23A2333D8();
      swift_bridgeObjectRelease();
    }
    else
    {
      v53 = *(_QWORD *)((v51 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    v54 = MEMORY[0x24BEE4AF8];
    if (!v53)
    {
LABEL_37:
      v60 = v70;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      *v60 = v54;
      MEMORY[0x23B845A58](v71, -1, -1);

      return;
    }
    v69 = v50;
    v72 = MEMORY[0x24BEE4AF8];
    sub_23A20D45C(0, v53 & ~(v53 >> 63), 0);
    if ((v53 & 0x8000000000000000) == 0)
    {
      v55 = 0;
      v54 = v72;
      v56 = v65;
      do
      {
        if ((v51 & 0xC000000000000001) != 0)
          v57 = (id)MEMORY[0x23B84508C](v55, v51);
        else
          v57 = *(id *)(v51 + 8 * v55 + 32);
        Group.init(_:)(v57, v52);
        v72 = v54;
        v59 = *(_QWORD *)(v54 + 16);
        v58 = *(_QWORD *)(v54 + 24);
        if (v59 >= v58 >> 1)
        {
          sub_23A20D45C(v58 > 1, v59 + 1, 1);
          v56 = v65;
          v54 = v72;
        }
        ++v55;
        *(_QWORD *)(v54 + 16) = v59 + 1;
        sub_23A1F8E88(v52, v54+ ((*(unsigned __int8 *)(v56 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v56 + 80))+ *(_QWORD *)(v56 + 72) * v59, type metadata accessor for Group);
      }
      while (v53 != v55);
      v50 = v69;
      goto LABEL_37;
    }
    goto LABEL_41;
  }
LABEL_43:
  __break(1u);
}

id ObjcCompatibility.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id ObjcCompatibility.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_init);
}

id ObjcCompatibility.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_23A1F84EC(void (*a1)(unint64_t *, _QWORD **), uint64_t a2, _OWORD *a3)
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
  _QWORD *v13;
  uint64_t *v14;
  uint64_t *boxed_opaque_existential_1;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint8_t *v31;
  unint64_t v32;
  unint64_t v33;
  _QWORD v35[7];
  void (*v36)(unint64_t *, _QWORD **);
  uint64_t v37;
  _QWORD v38[5];

  v36 = a1;
  v37 = a2;
  v4 = sub_23A23300C();
  v35[5] = *(_QWORD *)(v4 - 8);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v35[3] = (char *)v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v35[1] = (char *)v35 - v8;
  MEMORY[0x24BDAC7A8](v7);
  v35[2] = (char *)v35 - v9;
  v10 = type metadata accessor for RecordManager();
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)v35 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v38[3] = &type metadata for ProviderSideEffects;
  v38[4] = &off_250B2F8C0;
  v38[0] = swift_allocObject();
  sub_23A1F8DB0(a3, (_OWORD *)(v38[0] + 16));
  v13 = __swift_project_boxed_opaque_existential_1(v38, (uint64_t)&type metadata for ProviderSideEffects);
  v14 = (uint64_t *)&v12[*(int *)(v10 + 20)];
  v14[3] = (uint64_t)&type metadata for ProviderSideEffects;
  v14[4] = (uint64_t)&off_250B2F8A0;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v14);
  initializeWithCopy for ProviderSideEffects(boxed_opaque_existential_1, v13);
  sub_23A233000();
  if (qword_256951AC8 != -1)
    swift_once();
  v35[6] = v4;
  v35[4] = __swift_project_value_buffer(v4, (uint64_t)qword_256952570);
  v16 = sub_23A232FF4();
  v17 = sub_23A233270();
  if (os_log_type_enabled(v16, v17))
  {
    v18 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v18 = 0;
    _os_log_impl(&dword_23A1F0000, v16, v17, "Initializing DarwinDirectory local domain...", v18, 2u);
    MEMORY[0x23B845A58](v18, -1, -1);
  }

  v19 = sub_23A2060EC();
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v26 = sub_23A1F2BD4(1);
  v28 = sub_23A21450C(v26, v27);
  v30 = v29;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v31 = sub_23A216FEC(v28, v30, v36, v37, v23);
  v33 = v32;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_23A1FE3CC((unint64_t)v31, v33, v19 & 1, v21, (uint64_t)v23, v25);
  sub_23A1F8F44((uint64_t)v12, (uint64_t (*)(_QWORD))type metadata accessor for RecordManager);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v38);
}

uint64_t sub_23A1F8D7C()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  __swift_destroy_boxed_opaque_existential_1(v0 + 96);
  return swift_deallocObject();
}

_OWORD *sub_23A1F8DB0(_OWORD *a1, _OWORD *a2)
{
  initializeWithCopy for ProviderSideEffects(a2, a1);
  return a2;
}

uint64_t type metadata accessor for ObjcCompatibility()
{
  return objc_opt_self();
}

uint64_t sub_23A1F8E0C(uint64_t a1, unint64_t *a2)
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

uint64_t sub_23A1F8E44(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_23A1F8E88(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t v2;

  v1 = a1;
  if ((*(_BYTE *)(*(_QWORD *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_23A1F8F2C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_23A1F57C8(a1, a2, *(uint64_t (**)(void))(v2 + 16));
}

uint64_t sub_23A1F8F44(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_23A1F8F80()
{
  return swift_release();
}

uint64_t sub_23A1F8F8C(uint64_t a1, uint64_t a2)
{
  return sub_23A1F8F2C(a1, a2);
}

unint64_t sub_23A1F8FA0(uint64_t a1)
{
  unint64_t result;

  result = sub_23A1F8FC4();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_23A1F8FC4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256951BE0;
  if (!qword_256951BE0)
  {
    v1 = type metadata accessor for RecordStore(255);
    result = MEMORY[0x23B8459BC](&unk_23A2343B4, v1);
    atomic_store(result, (unint64_t *)&qword_256951BE0);
  }
  return result;
}

uint64_t sub_23A1F900C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t serialization;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, _QWORD);
  uint64_t result;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v2 = sub_23A232F7C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14[0] = 0;
  v6 = type metadata accessor for RecordStore(0);
  v7 = sub_23A1F8FC4();
  sub_23A221AC4(v0, v6, v7);
  if (v1)
  {
    result = swift_unexpectedError();
    __break(1u);
  }
  else
  {
    serialization = DarwinDirectory_xpc_make_serialization();
    swift_unknownObjectRelease();
    if (!serialization)
      __break(1u);
    v9 = v14[0];
    (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x24BDCDB90], v2);
    sub_23A232F70();
    if (v9)
    {
      sub_23A232EBC();
      swift_allocObject();
      swift_retain();
      v10 = sub_23A232E8C();
      v11 = sub_23A1F92BC(v10, v9);
      swift_release();
    }
    else
    {
      v12 = (void (*)(uint64_t, _QWORD))sub_23A232F70();
      v12(serialization, 0);
      swift_release();
      swift_release();
      v11 = 0;
    }
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    return v11;
  }
  return result;
}

uint64_t sub_23A1F91FC(_BYTE *__src, _BYTE *a2)
{
  unint64_t v2;
  _BYTE __dst[14];
  char v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (__src)
    v2 = a2 - __src;
  else
    v2 = 0;
  if ((v2 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_11:
    __break(1u);
  }
  if (v2 > 0xFF)
    goto LABEL_11;
  memset(__dst, 0, sizeof(__dst));
  v5 = v2;
  if (__src && a2 != __src)
    memcpy(__dst, __src, a2 - __src);
  return *(_QWORD *)__dst;
}

uint64_t sub_23A1F92BC(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;

  if (!a2)
  {
    swift_release();
    return 0;
  }
  if (a2 > 14)
  {
    if ((unint64_t)a2 < 0x7FFFFFFF)
      return a2 << 32;
    sub_23A232F88();
    v3 = swift_allocObject();
    *(_QWORD *)(v3 + 16) = 0;
    *(_QWORD *)(v3 + 24) = a2;
    return v3;
  }
  if (a2 < 0)
  {
    __break(1u);
  }
  else
  {
    v4 = (_BYTE *)sub_23A232E98();
    if (!v4)
    {
LABEL_10:
      v5 = sub_23A232EA4();
      if (v5 >= a2)
        v6 = a2;
      else
        v6 = v5;
      v7 = &v4[v6];
      if (v4)
        v8 = v7;
      else
        v8 = 0;
      v3 = sub_23A1F91FC(v4, v8);
      swift_release();
      return v3;
    }
    result = sub_23A232EB0();
    if (!__OFSUB__(0, result))
    {
      v4 -= result;
      goto LABEL_10;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_23A1F93A0()
{
  uint64_t v0;

  v0 = abort_with_reason();
  return sub_23A1F93BC(v0);
}

void sub_23A1F93BC(char *a1)
{
  sub_23A1F3DC0(*a1);
}

void sub_23A1F93C8()
{
  char *v0;

  sub_23A220820(0, *v0);
}

void sub_23A1F93D4(uint64_t a1)
{
  char *v1;

  sub_23A220728(a1, *v1);
}

void sub_23A1F93DC(uint64_t a1)
{
  char *v1;

  sub_23A220820(a1, *v1);
}

uint64_t sub_23A1F93E4@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23A1FD4C0();
  *a1 = result;
  return result;
}

uint64_t sub_23A1F9410()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(void))((char *)sub_23A1F9434 + 4 * byte_23A234220[*v0]))();
}

void sub_23A1F9434(_QWORD *a1@<X8>)
{
  *a1 = 1701667182;
  a1[1] = 0xE400000000000000;
}

void sub_23A1F9448(_QWORD *a1@<X8>)
{
  *a1 = 1145656661;
  a1[1] = 0xE400000000000000;
}

void sub_23A1F945C(_QWORD *a1@<X8>)
{
  *a1 = 0x656D614E6C6C7566;
  a1[1] = 0xE800000000000000;
}

void sub_23A1F9478(uint64_t a1@<X8>)
{
  strcpy((char *)a1, "homeDirectory");
  *(_WORD *)(a1 + 14) = -4864;
}

void sub_23A1F94A0(char *a1@<X8>)
{
  strcpy(a1, "primaryGroupID");
  a1[15] = -18;
}

void sub_23A1F94C8(_QWORD *a1@<X8>)
{
  *a1 = 0x6C6C656873;
  a1[1] = 0xE500000000000000;
}

void sub_23A1F94E0(_QWORD *a1@<X8>)
{
  *a1 = 0x6C626174754D7369;
  a1[1] = 0xE900000000000065;
}

uint64_t sub_23A1F9500()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_23A1F9524 + 4 * byte_23A234228[*v0]))(17481, 0xE200000000000000);
}

uint64_t sub_23A1F9524()
{
  return 1701667182;
}

uint64_t sub_23A1F9534()
{
  return 1145656661;
}

uint64_t sub_23A1F9544()
{
  return 0x656D614E6C6C7566;
}

uint64_t sub_23A1F955C()
{
  return 0x65726944656D6F68;
}

uint64_t sub_23A1F9580()
{
  return 0x477972616D697270;
}

uint64_t sub_23A1F95A4()
{
  return 0x6C6C656873;
}

uint64_t sub_23A1F95B8()
{
  return 0x6C626174754D7369;
}

uint64_t sub_23A1F95D4@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23A1FD4C0();
  *a1 = result;
  return result;
}

uint64_t sub_23A1F95F8()
{
  return 0;
}

void sub_23A1F9604(_BYTE *a1@<X8>)
{
  *a1 = 8;
}

uint64_t sub_23A1F9610()
{
  sub_23A1FC570();
  return sub_23A233858();
}

uint64_t sub_23A1F9638()
{
  sub_23A1FC570();
  return sub_23A233864();
}

uint64_t sub_23A1F9660()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_bridgeObjectRelease();
  v1 = v0 + OBJC_IVAR____TtCV23DarwinDirectoryInternal11RecordStore15UserStoreRecord_uuid;
  v2 = sub_23A232FE8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_23A1F96F4()
{
  return type metadata accessor for RecordStore.UserStoreRecord(0);
}

uint64_t type metadata accessor for RecordStore.UserStoreRecord(uint64_t a1)
{
  return sub_23A1FC53C(a1, qword_256951C10);
}

uint64_t sub_23A1F9710()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23A232FE8();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_23A1F97AC(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  char v20;

  v2 = v1;
  v17 = sub_23A232FE8();
  v4 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17);
  v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256951E20);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A1FC570();
  sub_23A233834();
  v19 = 0;
  v11 = v18;
  sub_23A2334BC();
  if (v11)
    return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  v13 = v17;
  v18 = v8;
  v19 = 1;
  swift_bridgeObjectRetain();
  sub_23A23348C();
  swift_bridgeObjectRelease();
  v14 = v2 + OBJC_IVAR____TtCV23DarwinDirectoryInternal11RecordStore15UserStoreRecord_uuid;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v14, v13);
  v20 = 2;
  sub_23A1F58C8(&qword_256951DF0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA70]);
  sub_23A2334B0();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v13);
  v20 = 3;
  swift_bridgeObjectRetain();
  sub_23A23348C();
  swift_bridgeObjectRelease();
  v20 = 4;
  swift_bridgeObjectRetain();
  sub_23A23348C();
  swift_bridgeObjectRelease();
  v20 = 5;
  sub_23A2334BC();
  v20 = 6;
  swift_bridgeObjectRetain();
  sub_23A23348C();
  v15 = v18;
  swift_bridgeObjectRelease();
  v20 = 7;
  sub_23A233498();
  return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v10, v7);
}

_QWORD *sub_23A1F9B78(_QWORD *a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  char *v12;
  uint64_t v13;
  int v14;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  char v36;
  char v37;
  char v38;
  char v39;
  char v40;
  char v41;
  char v42;
  char v43;

  v32 = *v1;
  v3 = sub_23A232FE8();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_256951E08);
  v7 = *(_QWORD *)(v31 - 8);
  MEMORY[0x24BDAC7A8](v31);
  v9 = OBJC_IVAR____TtCV23DarwinDirectoryInternal11RecordStore15UserStoreRecord_isMutable;
  v33 = (uint64_t)a1;
  v34 = v1;
  *((_BYTE *)v1 + OBJC_IVAR____TtCV23DarwinDirectoryInternal11RecordStore15UserStoreRecord_isMutable) = 0;
  v10 = a1[3];
  v11 = a1;
  v12 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(v11, v10);
  sub_23A1FC570();
  v13 = v35;
  sub_23A233828();
  if (v13)
  {
    v25 = v33;
    v16 = v34;
    swift_deallocPartialClassInstance();
  }
  else
  {
    v35 = v9;
    v43 = 0;
    v14 = sub_23A23345C();
    v16 = v34;
    *((_DWORD *)v34 + 4) = v14;
    v42 = 1;
    v16[3] = sub_23A23342C();
    v16[4] = v17;
    v41 = 2;
    sub_23A1F58C8(&qword_256951E18, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAA8]);
    sub_23A233450();
    v30 = v4;
    (*(void (**)(uint64_t, char *, uint64_t))(v4 + 32))((uint64_t)v16 + OBJC_IVAR____TtCV23DarwinDirectoryInternal11RecordStore15UserStoreRecord_uuid, v6, v3);
    v40 = 3;
    v18 = sub_23A23342C();
    v19 = (_QWORD *)((char *)v16 + OBJC_IVAR____TtCV23DarwinDirectoryInternal11RecordStore15UserStoreRecord_fullName);
    *v19 = v18;
    v19[1] = v20;
    v39 = 4;
    v21 = sub_23A23342C();
    v22 = (_QWORD *)((char *)v16 + OBJC_IVAR____TtCV23DarwinDirectoryInternal11RecordStore15UserStoreRecord_homeDirectory);
    *v22 = v21;
    v22[1] = v23;
    v38 = 5;
    v24 = sub_23A23345C();
    v25 = v33;
    *(_DWORD *)((char *)v16 + OBJC_IVAR____TtCV23DarwinDirectoryInternal11RecordStore15UserStoreRecord_primaryGroupID) = v24;
    v37 = 6;
    v26 = sub_23A23342C();
    v27 = (_QWORD *)((char *)v16 + OBJC_IVAR____TtCV23DarwinDirectoryInternal11RecordStore15UserStoreRecord_shell);
    *v27 = v26;
    v27[1] = v28;
    v36 = 7;
    v29 = sub_23A233438();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v31);
    *((_BYTE *)v16 + v35) = v29 & 1;
  }
  __swift_destroy_boxed_opaque_existential_1(v25);
  return v16;
}

uint64_t sub_23A1F9FB8@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_23A1FAB98(a1, (uint64_t (*)(uint64_t))sub_23A1F9B78, a2);
}

uint64_t sub_23A1F9FD4(_QWORD *a1)
{
  return sub_23A1F97AC(a1);
}

void sub_23A1F9FF4(char *a1)
{
  sub_23A1F3C4C(*a1);
}

void sub_23A1FA000()
{
  unsigned __int8 *v0;
  uint64_t v1;

  v1 = *v0;
  sub_23A2337F8();
  __asm { BR              X9 }
}

uint64_t sub_23A1FA040()
{
  sub_23A233168();
  swift_bridgeObjectRelease();
  return sub_23A23381C();
}

void sub_23A1FA0C4()
{
  __asm { BR              X10 }
}

uint64_t sub_23A1FA0F4()
{
  sub_23A233168();
  return swift_bridgeObjectRelease();
}

void sub_23A1FA164()
{
  unsigned __int8 *v0;
  uint64_t v1;

  v1 = *v0;
  sub_23A2337F8();
  __asm { BR              X9 }
}

uint64_t sub_23A1FA1A0()
{
  sub_23A233168();
  swift_bridgeObjectRelease();
  return sub_23A23381C();
}

uint64_t sub_23A1FA224@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23A1FD508();
  *a1 = result;
  return result;
}

uint64_t sub_23A1FA250()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(void))((char *)sub_23A1FA274 + 4 * byte_23A23423F[*v0]))();
}

void sub_23A1FA274(_QWORD *a1@<X8>)
{
  *a1 = 1701667182;
  a1[1] = 0xE400000000000000;
}

void sub_23A1FA288(_QWORD *a1@<X8>)
{
  *a1 = 1145656661;
  a1[1] = 0xE400000000000000;
}

void sub_23A1FA29C(_QWORD *a1@<X8>)
{
  *a1 = 0x614E7265626D656DLL;
  a1[1] = 0xEB0000000073656DLL;
}

void sub_23A1FA2C0(_QWORD *a1@<X8>)
{
  *a1 = 0x6C626174754D7369;
  a1[1] = 0xE900000000000065;
}

uint64_t sub_23A1FA2E0()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_23A1FA304 + 4 * byte_23A234244[*v0]))(17481, 0xE200000000000000);
}

uint64_t sub_23A1FA304()
{
  return 1701667182;
}

uint64_t sub_23A1FA314()
{
  return 1145656661;
}

uint64_t sub_23A1FA324()
{
  return 0x614E7265626D656DLL;
}

uint64_t sub_23A1FA344()
{
  return 0x6C626174754D7369;
}

uint64_t sub_23A1FA360@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23A1FD508();
  *a1 = result;
  return result;
}

void sub_23A1FA384(_BYTE *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_23A1FA390()
{
  sub_23A1FC5B4();
  return sub_23A233858();
}

uint64_t sub_23A1FA3B8()
{
  sub_23A1FC5B4();
  return sub_23A233864();
}

uint64_t sub_23A1FA3E0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_bridgeObjectRelease();
  v1 = v0 + OBJC_IVAR____TtCV23DarwinDirectoryInternal11RecordStore16GroupStoreRecord_uuid;
  v2 = sub_23A232FE8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_23A1FA448()
{
  return type metadata accessor for RecordStore.GroupStoreRecord(0);
}

uint64_t type metadata accessor for RecordStore.GroupStoreRecord(uint64_t a1)
{
  return sub_23A1FC53C(a1, qword_256951D00);
}

uint64_t sub_23A1FA464()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23A232FE8();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_23A1FA500(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t (*v12)(char *, uint64_t);
  char *v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  char v28;
  char v29;
  char v30;
  uint64_t v31;

  v2 = v1;
  v25 = sub_23A232FE8();
  v4 = *(_QWORD *)(v25 - 8);
  MEMORY[0x24BDAC7A8](v25);
  v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_256951E48);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A1FC5B4();
  sub_23A233834();
  v30 = 0;
  v27 = v10;
  v11 = v26;
  sub_23A2334BC();
  if (v11)
  {
    v12 = *(uint64_t (**)(char *, uint64_t))(v8 + 8);
    v13 = v27;
    v14 = v7;
  }
  else
  {
    v16 = v25;
    v26 = v8;
    v30 = 1;
    swift_bridgeObjectRetain();
    sub_23A23348C();
    swift_bridgeObjectRelease();
    v17 = v2 + OBJC_IVAR____TtCV23DarwinDirectoryInternal11RecordStore16GroupStoreRecord_uuid;
    swift_beginAccess();
    v18 = v17;
    v19 = v7;
    v20 = v16;
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v18, v16);
    v29 = 2;
    sub_23A1F58C8(&qword_256951DF0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA70]);
    v21 = v19;
    sub_23A2334B0();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v20);
    v22 = (uint64_t *)(v2 + OBJC_IVAR____TtCV23DarwinDirectoryInternal11RecordStore16GroupStoreRecord_memberNames);
    swift_beginAccess();
    v31 = *v22;
    v28 = 3;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256951E38);
    sub_23A1FC5F8(qword_256951E50, MEMORY[0x24BEE0D08], MEMORY[0x24BEE12A0]);
    sub_23A2334B0();
    v23 = v26;
    LOBYTE(v31) = 4;
    v24 = v27;
    sub_23A233498();
    v12 = *(uint64_t (**)(char *, uint64_t))(v23 + 8);
    v13 = v24;
    v14 = v21;
  }
  return v12(v13, v14);
}

_QWORD *sub_23A1FA828(_QWORD *a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  char v28;
  char v29;
  char v30;
  char v31;

  v22 = *v1;
  v20 = sub_23A232FE8();
  v3 = *(_QWORD *)(v20 - 8);
  MEMORY[0x24BDAC7A8](v20);
  v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_256951E28);
  v6 = *(_QWORD *)(v21 - 8);
  MEMORY[0x24BDAC7A8](v21);
  v7 = OBJC_IVAR____TtCV23DarwinDirectoryInternal11RecordStore16GroupStoreRecord_isMutable;
  v23 = a1;
  v24 = v1;
  *((_BYTE *)v1 + OBJC_IVAR____TtCV23DarwinDirectoryInternal11RecordStore16GroupStoreRecord_isMutable) = 0;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A1FC5B4();
  v8 = v25;
  sub_23A233828();
  if (v8)
  {
    v14 = (uint64_t)v23;
    v16 = v24;
    swift_deallocPartialClassInstance();
    v18 = v14;
  }
  else
  {
    v9 = v5;
    v10 = v6;
    v31 = 0;
    v11 = v20;
    v12 = v21;
    v13 = sub_23A23345C();
    v16 = v24;
    *((_DWORD *)v24 + 4) = v13;
    v30 = 1;
    v16[3] = sub_23A23342C();
    v16[4] = v17;
    v29 = 2;
    sub_23A1F58C8(&qword_256951E18, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAA8]);
    sub_23A233450();
    v25 = v3;
    (*(void (**)(uint64_t, char *, uint64_t))(v3 + 32))((uint64_t)v16 + OBJC_IVAR____TtCV23DarwinDirectoryInternal11RecordStore16GroupStoreRecord_uuid, v9, v11);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256951E38);
    v28 = 3;
    sub_23A1FC5F8(&qword_256951E40, MEMORY[0x24BEE0D38], MEMORY[0x24BEE12D0]);
    sub_23A233450();
    *(_QWORD *)((char *)v16 + OBJC_IVAR____TtCV23DarwinDirectoryInternal11RecordStore16GroupStoreRecord_memberNames) = v26;
    v27 = 4;
    LOBYTE(v11) = sub_23A233438();
    (*(void (**)(_QWORD, uint64_t))(v10 + 8))(0, v12);
    *((_BYTE *)v16 + v7) = v11 & 1;
    v18 = (uint64_t)v23;
  }
  __swift_destroy_boxed_opaque_existential_1(v18);
  return v16;
}

uint64_t sub_23A1FAB7C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_23A1FAB98(a1, (uint64_t (*)(uint64_t))sub_23A1FA828, a2);
}

uint64_t sub_23A1FAB98@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t)@<X3>, uint64_t *a3@<X8>)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t result;

  v7 = swift_allocObject();
  result = a2(a1);
  if (!v3)
    *a3 = v7;
  return result;
}

uint64_t sub_23A1FABF8(_QWORD *a1)
{
  return sub_23A1FA500(a1);
}

uint64_t sub_23A1FAC18@<X0>(unint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t *a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t result;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  uint64_t v41;
  char v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void (*v48)(uint64_t, uint64_t);
  char v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  unint64_t v53;
  uint64_t v54;
  unint64_t v55;
  void (*v56)(char *, uint64_t, uint64_t);
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  unint64_t v60;

  v8 = sub_23A232FE8();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v50 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  *a4 = a1;
  a4[1] = a2;
  v12 = (char *)a4 + *(int *)(type metadata accessor for RecordStore(0) + 48);
  v57 = v9;
  v58 = v8;
  v56 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  v56(v12, a3, v8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v13 = MEMORY[0x24BEE4AF8];
  a4[2] = sub_23A1FE120(MEMORY[0x24BEE4AF8]);
  a4[3] = sub_23A1FE120(v13);
  result = sub_23A1FE120(v13);
  a4[4] = result;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v15 = sub_23A2333D8();
    result = swift_bridgeObjectRelease();
  }
  else
  {
    v15 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v55 = a2;
  v51 = a3;
  if (v15)
  {
    if (v15 < 1)
    {
      __break(1u);
      goto LABEL_25;
    }
    v16 = 0;
    v53 = a1 & 0xC000000000000001;
    v54 = a1;
    v52 = (char *)v15;
    v17 = v58;
    do
    {
      if (v53)
      {
        v18 = MEMORY[0x23B84508C](v16, a1);
      }
      else
      {
        v18 = *(_QWORD *)(a1 + 8 * v16 + 32);
        swift_retain();
      }
      LODWORD(v59) = *(_DWORD *)(v18 + 16);
      v19 = sub_23A2334E0();
      v21 = v20;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v59 = a4[2];
      a4[2] = 0x8000000000000000;
      sub_23A1FC658(v16, v19, v21, isUniquelyReferenced_nonNull_native);
      a4[2] = v59;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v23 = *(_QWORD *)(v18 + 24);
      v24 = *(_QWORD *)(v18 + 32);
      swift_bridgeObjectRetain();
      v25 = swift_isUniquelyReferenced_nonNull_native();
      v59 = a4[3];
      a4[3] = 0x8000000000000000;
      sub_23A1FC658(v16, v23, v24, v25);
      a4[3] = v59;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v26 = v18 + OBJC_IVAR____TtCV23DarwinDirectoryInternal11RecordStore15UserStoreRecord_uuid;
      swift_beginAccess();
      v56(v11, v26, v17);
      v27 = sub_23A232FAC();
      v29 = v28;
      (*(void (**)(char *, uint64_t))(v57 + 8))(v11, v17);
      v30 = swift_isUniquelyReferenced_nonNull_native();
      v59 = a4[4];
      a4[4] = 0x8000000000000000;
      sub_23A1FC658(v16, v27, v29, v30);
      a4[4] = v59;
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      ++v16;
      a1 = v54;
    }
    while (v52 != (char *)v16);
    swift_bridgeObjectRelease();
    a2 = v55;
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  v31 = MEMORY[0x24BEE4AF8];
  a4[5] = sub_23A1FE120(MEMORY[0x24BEE4AF8]);
  a4[6] = sub_23A1FE120(v31);
  result = sub_23A1FE120(v31);
  a4[7] = result;
  if (!(a2 >> 62))
  {
    v32 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v32)
      goto LABEL_14;
LABEL_22:
    v48 = *(void (**)(uint64_t, uint64_t))(v57 + 8);
LABEL_23:
    v48(v51, v58);
    return swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  v32 = sub_23A2333D8();
  result = swift_bridgeObjectRelease();
  if (!v32)
    goto LABEL_22;
LABEL_14:
  if (v32 >= 1)
  {
    v33 = 0;
    v52 = v11;
    v53 = a2 & 0xC000000000000001;
    v54 = v32;
    v34 = v58;
    do
    {
      if (v53)
      {
        v35 = MEMORY[0x23B84508C](v33, a2);
      }
      else
      {
        v35 = *(_QWORD *)(a2 + 8 * v33 + 32);
        swift_retain();
      }
      LODWORD(v60) = *(_DWORD *)(v35 + 16);
      v36 = sub_23A2334E0();
      v38 = v37;
      v39 = swift_isUniquelyReferenced_nonNull_native();
      v60 = a4[5];
      a4[5] = 0x8000000000000000;
      sub_23A1FC658(v33, v36, v38, v39);
      a4[5] = v60;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v40 = *(_QWORD *)(v35 + 24);
      v41 = *(_QWORD *)(v35 + 32);
      swift_bridgeObjectRetain();
      v42 = swift_isUniquelyReferenced_nonNull_native();
      v60 = a4[6];
      a4[6] = 0x8000000000000000;
      sub_23A1FC658(v33, v40, v41, v42);
      a4[6] = v60;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v43 = v35 + OBJC_IVAR____TtCV23DarwinDirectoryInternal11RecordStore16GroupStoreRecord_uuid;
      swift_beginAccess();
      v44 = v52;
      v56(v52, v43, v34);
      v45 = sub_23A232FAC();
      v47 = v46;
      v48 = *(void (**)(uint64_t, uint64_t))(v57 + 8);
      v48((uint64_t)v44, v34);
      v49 = swift_isUniquelyReferenced_nonNull_native();
      v60 = a4[7];
      a4[7] = 0x8000000000000000;
      sub_23A1FC658(v33, v45, v47, v49);
      a4[7] = v60;
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      ++v33;
      a2 = v55;
    }
    while (v54 != v33);
    goto LABEL_23;
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_23A1FB194(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_23A1FB1D0 + 4 * byte_23A234249[a1]))(0xD000000000000015, 0x800000023A236BF0);
}

uint64_t sub_23A1FB1D0()
{
  uint64_t v0;

  return v0 + 4;
}

uint64_t sub_23A1FB274(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_23A1FB2B0 + 4 * byte_23A234252[a1]))(0xD000000000000015, 0x800000023A236BF0);
}

uint64_t sub_23A1FB2B0()
{
  uint64_t v0;

  return v0 + 4;
}

void sub_23A1FB354(char *a1)
{
  sub_23A1F3A48(*a1);
}

uint64_t sub_23A1FB360()
{
  char *v0;
  char v1;
  _BYTE v3[72];

  v1 = *v0;
  sub_23A2337F8();
  sub_23A220628((uint64_t)v3, v1);
  return sub_23A23381C();
}

void sub_23A1FB3A4(uint64_t a1)
{
  char *v1;

  sub_23A220628(a1, *v1);
}

uint64_t sub_23A1FB3AC()
{
  char *v0;
  char v1;
  _BYTE v3[72];

  v1 = *v0;
  sub_23A2337F8();
  sub_23A220628((uint64_t)v3, v1);
  return sub_23A23381C();
}

uint64_t sub_23A1FB3EC@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23A1FD550();
  *a1 = result;
  return result;
}

uint64_t sub_23A1FB418@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_23A1FB194(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_23A1FB440()
{
  unsigned __int8 *v0;

  return sub_23A1FB274(*v0);
}

uint64_t sub_23A1FB448@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23A1FD550();
  *a1 = result;
  return result;
}

void sub_23A1FB46C(_BYTE *a1@<X8>)
{
  *a1 = 9;
}

uint64_t sub_23A1FB478()
{
  sub_23A1FC41C();
  return sub_23A233858();
}

uint64_t sub_23A1FB4A0()
{
  sub_23A1FC41C();
  return sub_23A233864();
}

uint64_t sub_23A1FB4C8()
{
  _QWORD *v0;
  _QWORD *v1;
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
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  unint64_t v23;
  uint64_t v24;
  _BOOL8 v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  uint64_t *v29;
  uint64_t v30;
  BOOL v31;
  uint64_t v32;
  unint64_t isUniquelyReferenced_nonNull_native;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  _QWORD *v49;
  unint64_t v50;
  uint64_t v51;
  _BOOL8 v52;
  uint64_t v53;
  unint64_t v54;
  char v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t result;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  unint64_t v63;
  char *v64;
  uint64_t v65;
  _QWORD *v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  uint64_t v70;

  v1 = v0;
  v2 = sub_23A232FE8();
  v67 = *(_QWORD *)(v2 - 8);
  v68 = v2;
  v3 = MEMORY[0x24BDAC7A8](v2);
  v61 = (char *)&v60 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v64 = (char *)&v60 - v5;
  v0[4] = sub_23A1FE120(MEMORY[0x24BEE4AF8]);
  swift_bridgeObjectRelease();
  v6 = *v0;
  if (*v0 >> 62)
    goto LABEL_25;
  v7 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  v66 = v1;
  if (!v7)
  {
LABEL_26:
    swift_bridgeObjectRelease();
    v1[7] = sub_23A1FE120(MEMORY[0x24BEE4AF8]);
    swift_bridgeObjectRelease();
    isUniquelyReferenced_nonNull_native = v1[1];
    if (isUniquelyReferenced_nonNull_native >> 62)
      goto LABEL_50;
    v34 = *(_QWORD *)((isUniquelyReferenced_nonNull_native & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (!v34)
      return swift_bridgeObjectRelease();
LABEL_28:
    v63 = isUniquelyReferenced_nonNull_native;
    v64 = (char *)(isUniquelyReferenced_nonNull_native & 0xC000000000000001);
    v35 = 4;
    while (1)
    {
      v36 = v35 - 4;
      if (v64)
      {
        v37 = MEMORY[0x23B84508C](v35 - 4, isUniquelyReferenced_nonNull_native);
        v38 = v35 - 3;
        if (__OFADD__(v36, 1))
          goto LABEL_47;
      }
      else
      {
        v37 = swift_retain();
        v38 = v35 - 3;
        if (__OFADD__(v36, 1))
        {
LABEL_47:
          __break(1u);
LABEL_48:
          __break(1u);
LABEL_49:
          __break(1u);
LABEL_50:
          swift_bridgeObjectRetain_n();
          v34 = sub_23A2333D8();
          swift_bridgeObjectRelease();
          if (!v34)
            return swift_bridgeObjectRelease();
          goto LABEL_28;
        }
      }
      v65 = v38;
      v39 = v34;
      v40 = v37 + OBJC_IVAR____TtCV23DarwinDirectoryInternal11RecordStore16GroupStoreRecord_uuid;
      swift_beginAccess();
      v41 = v67;
      v42 = v61;
      v43 = v40;
      v44 = v68;
      (*(void (**)(char *, uint64_t, uint64_t))(v67 + 16))(v61, v43, v68);
      v45 = sub_23A232FAC();
      v47 = v46;
      (*(void (**)(char *, uint64_t))(v41 + 8))(v42, v44);
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v69 = v1[7];
      v48 = v69;
      v1[7] = 0x8000000000000000;
      v50 = sub_23A203DB0(v45, v47);
      v51 = *(_QWORD *)(v48 + 16);
      v52 = (v49 & 1) == 0;
      v53 = v51 + v52;
      if (__OFADD__(v51, v52))
        goto LABEL_48;
      v1 = v49;
      if (*(_QWORD *)(v48 + 24) >= v53)
      {
        if ((isUniquelyReferenced_nonNull_native & 1) != 0)
        {
          isUniquelyReferenced_nonNull_native = v69;
          if ((v49 & 1) != 0)
            goto LABEL_29;
        }
        else
        {
          sub_23A204CFC();
          isUniquelyReferenced_nonNull_native = v69;
          if ((v1 & 1) != 0)
            goto LABEL_29;
        }
      }
      else
      {
        sub_23A204228(v53, isUniquelyReferenced_nonNull_native);
        v54 = sub_23A203DB0(v45, v47);
        if ((v1 & 1) != (v55 & 1))
          goto LABEL_52;
        v50 = v54;
        isUniquelyReferenced_nonNull_native = v69;
        if ((v1 & 1) != 0)
        {
LABEL_29:
          *(_QWORD *)(*(_QWORD *)(isUniquelyReferenced_nonNull_native + 56) + 8 * v50) = v36;
          goto LABEL_30;
        }
      }
      *(_QWORD *)(isUniquelyReferenced_nonNull_native + 8 * (v50 >> 6) + 64) |= 1 << v50;
      v56 = (uint64_t *)(*(_QWORD *)(isUniquelyReferenced_nonNull_native + 48) + 16 * v50);
      *v56 = v45;
      v56[1] = v47;
      *(_QWORD *)(*(_QWORD *)(isUniquelyReferenced_nonNull_native + 56) + 8 * v50) = v36;
      v57 = *(_QWORD *)(isUniquelyReferenced_nonNull_native + 16);
      v31 = __OFADD__(v57, 1);
      v58 = v57 + 1;
      if (v31)
        goto LABEL_49;
      *(_QWORD *)(isUniquelyReferenced_nonNull_native + 16) = v58;
      swift_bridgeObjectRetain();
LABEL_30:
      v1 = v66;
      v66[7] = isUniquelyReferenced_nonNull_native;
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      ++v35;
      v34 = v39;
      isUniquelyReferenced_nonNull_native = v63;
      if (v65 == v39)
        return swift_bridgeObjectRelease();
    }
  }
LABEL_3:
  v62 = v6;
  v63 = v6 & 0xC000000000000001;
  v8 = 4;
  while (1)
  {
    v9 = v8 - 4;
    if (v63)
    {
      v10 = MEMORY[0x23B84508C](v8 - 4, v6);
      v11 = v8 - 3;
      if (__OFADD__(v9, 1))
        goto LABEL_22;
    }
    else
    {
      v10 = swift_retain();
      v11 = v8 - 3;
      if (__OFADD__(v9, 1))
      {
LABEL_22:
        __break(1u);
LABEL_23:
        __break(1u);
LABEL_24:
        __break(1u);
LABEL_25:
        swift_bridgeObjectRetain_n();
        v7 = sub_23A2333D8();
        swift_bridgeObjectRelease();
        v66 = v1;
        if (!v7)
          goto LABEL_26;
        goto LABEL_3;
      }
    }
    v65 = v11;
    v12 = v7;
    v13 = v10 + OBJC_IVAR____TtCV23DarwinDirectoryInternal11RecordStore15UserStoreRecord_uuid;
    swift_beginAccess();
    v14 = v67;
    v15 = v64;
    v16 = v13;
    v17 = v68;
    (*(void (**)(char *, uint64_t, uint64_t))(v67 + 16))(v64, v16, v68);
    v18 = sub_23A232FAC();
    v20 = v19;
    (*(void (**)(char *, uint64_t))(v14 + 8))(v15, v17);
    v6 = swift_isUniquelyReferenced_nonNull_native();
    v70 = v1[4];
    v21 = v70;
    v1[4] = 0x8000000000000000;
    v23 = sub_23A203DB0(v18, v20);
    v24 = *(_QWORD *)(v21 + 16);
    v25 = (v22 & 1) == 0;
    v26 = v24 + v25;
    if (__OFADD__(v24, v25))
      goto LABEL_23;
    v1 = v22;
    if (*(_QWORD *)(v21 + 24) < v26)
      break;
    if ((v6 & 1) != 0)
    {
      v6 = v70;
      if ((v22 & 1) != 0)
        goto LABEL_4;
    }
    else
    {
      sub_23A204CFC();
      v6 = v70;
      if ((v1 & 1) != 0)
      {
LABEL_4:
        *(_QWORD *)(*(_QWORD *)(v6 + 56) + 8 * v23) = v9;
        goto LABEL_5;
      }
    }
LABEL_18:
    *(_QWORD *)(v6 + 8 * (v23 >> 6) + 64) |= 1 << v23;
    v29 = (uint64_t *)(*(_QWORD *)(v6 + 48) + 16 * v23);
    *v29 = v18;
    v29[1] = v20;
    *(_QWORD *)(*(_QWORD *)(v6 + 56) + 8 * v23) = v9;
    v30 = *(_QWORD *)(v6 + 16);
    v31 = __OFADD__(v30, 1);
    v32 = v30 + 1;
    if (v31)
      goto LABEL_24;
    *(_QWORD *)(v6 + 16) = v32;
    swift_bridgeObjectRetain();
LABEL_5:
    v1 = v66;
    v66[4] = v6;
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    ++v8;
    v7 = v12;
    v6 = v62;
    if (v65 == v12)
      goto LABEL_26;
  }
  sub_23A204228(v26, v6);
  v27 = sub_23A203DB0(v18, v20);
  if ((v1 & 1) == (v28 & 1))
  {
    v23 = v27;
    v6 = v70;
    if ((v1 & 1) != 0)
      goto LABEL_4;
    goto LABEL_18;
  }
LABEL_52:
  result = sub_23A2337BC();
  __break(1u);
  return result;
}

uint64_t sub_23A1FBA50(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v10;
  uint64_t v11;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256951DB0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A1FC41C();
  sub_23A233834();
  v11 = *v3;
  HIBYTE(v10) = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256951DC0);
  sub_23A1FD598(&qword_256951DC8, &qword_256951DD0, (uint64_t)&unk_23A234364, MEMORY[0x24BEE12A0]);
  sub_23A2334B0();
  if (!v2)
  {
    v11 = v3[1];
    HIBYTE(v10) = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256951DD8);
    sub_23A1FC4A4(&qword_256951DE0, &qword_256951DE8, (uint64_t)&unk_23A234314, MEMORY[0x24BEE12A0]);
    sub_23A2334B0();
    type metadata accessor for RecordStore(0);
    LOBYTE(v11) = 2;
    sub_23A232FE8();
    sub_23A1F58C8(&qword_256951DF0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA70]);
    sub_23A2334B0();
    v11 = v3[2];
    HIBYTE(v10) = 3;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256951DF8);
    sub_23A1FD61C(&qword_256951E00, MEMORY[0x24BEE0D08], MEMORY[0x24BEE1770], MEMORY[0x24BEE04C0]);
    sub_23A2334B0();
    v11 = v3[3];
    HIBYTE(v10) = 4;
    sub_23A2334B0();
    v11 = v3[4];
    HIBYTE(v10) = 5;
    sub_23A2334B0();
    v11 = v3[5];
    HIBYTE(v10) = 6;
    sub_23A2334B0();
    v11 = v3[6];
    HIBYTE(v10) = 7;
    sub_23A2334B0();
    v11 = v3[7];
    HIBYTE(v10) = 8;
    sub_23A2334B0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_23A1FBDDC@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  char v27;
  uint64_t v28;

  v21 = a2;
  v4 = sub_23A232FE8();
  v24 = *(_QWORD *)(v4 - 8);
  v25 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_256951F50);
  v7 = *(_QWORD *)(v22 - 8);
  MEMORY[0x24BDAC7A8](v22);
  v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = type metadata accessor for RecordStore(0);
  MEMORY[0x24BDAC7A8](v23);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = a1[3];
  v26 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v12);
  sub_23A1FC41C();
  v13 = v9;
  sub_23A233828();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
  v14 = v6;
  v15 = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256951DC0);
  v27 = 0;
  sub_23A1FD598(&qword_256951F58, &qword_256951F60, (uint64_t)&unk_23A23438C, MEMORY[0x24BEE12D0]);
  v16 = v22;
  sub_23A233450();
  *(_QWORD *)v11 = v28;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256951DD8);
  v27 = 1;
  sub_23A1FC4A4(&qword_256951F68, &qword_256951F70, (uint64_t)&unk_23A23433C, MEMORY[0x24BEE12D0]);
  sub_23A233450();
  v17 = (uint64_t)v26;
  *((_QWORD *)v11 + 1) = v28;
  LOBYTE(v28) = 2;
  sub_23A1F58C8(&qword_256951E18, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAA8]);
  v18 = v25;
  sub_23A233450();
  (*(void (**)(char *, char *, uint64_t))(v24 + 32))(&v11[*(int *)(v23 + 48)], v14, v18);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256951DF8);
  v27 = 3;
  sub_23A1FD61C(&qword_256951F78, MEMORY[0x24BEE0D38], MEMORY[0x24BEE1798], MEMORY[0x24BEE04E0]);
  sub_23A233450();
  *((_QWORD *)v11 + 2) = v28;
  v27 = 4;
  sub_23A233450();
  *((_QWORD *)v11 + 3) = v28;
  v27 = 5;
  sub_23A233450();
  *((_QWORD *)v11 + 4) = v28;
  v27 = 6;
  sub_23A233450();
  *((_QWORD *)v11 + 5) = v28;
  v27 = 7;
  sub_23A233450();
  *((_QWORD *)v11 + 6) = v28;
  v27 = 8;
  sub_23A233450();
  (*(void (**)(char *, uint64_t))(v15 + 8))(v13, v16);
  *((_QWORD *)v11 + 7) = v28;
  sub_23A1FD680((uint64_t)v11, v21);
  __swift_destroy_boxed_opaque_existential_1(v17);
  return sub_23A1FD6C4((uint64_t)v11);
}

uint64_t sub_23A1FC3F4@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_23A1FBDDC(a1, a2);
}

uint64_t sub_23A1FC408(_QWORD *a1)
{
  return sub_23A1FBA50(a1);
}

unint64_t sub_23A1FC41C()
{
  unint64_t result;

  result = qword_256951DB8;
  if (!qword_256951DB8)
  {
    result = MEMORY[0x23B8459BC](&unk_23A234780, &type metadata for RecordStore.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256951DB8);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B8459B0](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_23A1FC4A4(unint64_t *a1, unint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;

  result = *a1;
  if (!result)
  {
    v9 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256951DD8);
    v10 = sub_23A1F58C8(a2, type metadata accessor for RecordStore.GroupStoreRecord, a3);
    result = MEMORY[0x23B8459BC](a4, v9, &v10);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t type metadata accessor for RecordStore(uint64_t a1)
{
  return sub_23A1FC53C(a1, qword_256951EB0);
}

uint64_t sub_23A1FC53C(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

unint64_t sub_23A1FC570()
{
  unint64_t result;

  result = qword_256951E10;
  if (!qword_256951E10)
  {
    result = MEMORY[0x23B8459BC](&unk_23A234730, &type metadata for RecordStore.UserStoreRecord.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256951E10);
  }
  return result;
}

unint64_t sub_23A1FC5B4()
{
  unint64_t result;

  result = qword_256951E30;
  if (!qword_256951E30)
  {
    result = MEMORY[0x23B8459BC](&unk_23A2346E0, &type metadata for RecordStore.GroupStoreRecord.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256951E30);
  }
  return result;
}

uint64_t sub_23A1FC5F8(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  result = *a1;
  if (!result)
  {
    v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256951E38);
    v8 = a2;
    result = MEMORY[0x23B8459BC](a3, v7, &v8);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23A1FC658(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t result;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  char v19;
  uint64_t *v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;

  v5 = v4;
  v10 = *v4;
  v12 = sub_23A203DB0(a2, a3);
  v13 = *(_QWORD *)(v10 + 16);
  v14 = (v11 & 1) == 0;
  result = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v16 = v11;
  v17 = *(_QWORD *)(v10 + 24);
  if (v17 >= result && (a4 & 1) != 0)
    goto LABEL_7;
  if (v17 >= result && (a4 & 1) == 0)
  {
    result = (uint64_t)sub_23A204CFC();
LABEL_7:
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      *(_QWORD *)(v18[7] + 8 * v12) = a1;
      return result;
    }
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    v20 = (uint64_t *)(v18[6] + 16 * v12);
    *v20 = a2;
    v20[1] = a3;
    *(_QWORD *)(v18[7] + 8 * v12) = a1;
    v21 = v18[2];
    v22 = __OFADD__(v21, 1);
    v23 = v21 + 1;
    if (!v22)
    {
      v18[2] = v23;
      return swift_bridgeObjectRetain();
    }
    goto LABEL_14;
  }
  sub_23A204228(result, a4 & 1);
  result = sub_23A203DB0(a2, a3);
  if ((v16 & 1) == (v19 & 1))
  {
    v12 = result;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_23A2337BC();
  __break(1u);
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for RecordStore.GroupStoreRecord.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for RecordStore.GroupStoreRecord.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23A1FC894 + 4 * byte_23A234260[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_23A1FC8C8 + 4 * byte_23A23425B[v4]))();
}

uint64_t sub_23A1FC8C8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A1FC8D0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23A1FC8D8);
  return result;
}

uint64_t sub_23A1FC8E4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23A1FC8ECLL);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_23A1FC8F0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A1FC8F8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for RecordStore.GroupStoreRecord.CodingKeys()
{
  return &type metadata for RecordStore.GroupStoreRecord.CodingKeys;
}

uint64_t getEnumTagSinglePayload for RecordStore.UserStoreRecord.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF9)
    goto LABEL_17;
  if (a2 + 7 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 7) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 7;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 7;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 7;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 8;
  v8 = v6 - 8;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for RecordStore.UserStoreRecord.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 7 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 7) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF9)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF8)
    return ((uint64_t (*)(void))((char *)&loc_23A1FC9F4 + 4 * byte_23A23426A[v4]))();
  *a1 = a2 + 7;
  return ((uint64_t (*)(void))((char *)sub_23A1FCA28 + 4 * byte_23A234265[v4]))();
}

uint64_t sub_23A1FCA28(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A1FCA30(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23A1FCA38);
  return result;
}

uint64_t sub_23A1FCA44(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23A1FCA4CLL);
  *(_BYTE *)result = a2 + 7;
  return result;
}

uint64_t sub_23A1FCA50(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A1FCA58(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A1FCA64(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_23A1FCA6C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for RecordStore.UserStoreRecord.CodingKeys()
{
  return &type metadata for RecordStore.UserStoreRecord.CodingKeys;
}

uint64_t getEnumTagSinglePayload for RecordStore.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF8)
    goto LABEL_17;
  if (a2 + 8 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 8) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 8;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 8;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 8;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 9;
  v8 = v6 - 9;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for RecordStore.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 8 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 8) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF8)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF7)
    return ((uint64_t (*)(void))((char *)&loc_23A1FCB60 + 4 * byte_23A234274[v4]))();
  *a1 = a2 + 8;
  return ((uint64_t (*)(void))((char *)sub_23A1FCB94 + 4 * byte_23A23426F[v4]))();
}

uint64_t sub_23A1FCB94(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A1FCB9C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23A1FCBA4);
  return result;
}

uint64_t sub_23A1FCBB0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23A1FCBB8);
  *(_BYTE *)result = a2 + 8;
  return result;
}

uint64_t sub_23A1FCBBC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A1FCBC4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for RecordStore.CodingKeys()
{
  return &type metadata for RecordStore.CodingKeys;
}

uint64_t *sub_23A1FCBE0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v12)(char *, char *, uint64_t);
  char *v13;
  char *v14;

  v3 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v5 = (uint64_t *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain();
  }
  else
  {
    v5 = a1;
    v6 = a2[2];
    a1[1] = a2[1];
    a1[2] = v6;
    v7 = a2[4];
    a1[3] = a2[3];
    a1[4] = v7;
    v8 = a2[6];
    a1[5] = a2[5];
    a1[6] = v8;
    v9 = *(int *)(a3 + 48);
    v13 = (char *)a2 + v9;
    v14 = (char *)a1 + v9;
    a1[7] = a2[7];
    v10 = sub_23A232FE8();
    v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v12(v14, v13, v10);
  }
  return v5;
}

uint64_t sub_23A1FCCF0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 48);
  v5 = sub_23A232FE8();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

_QWORD *sub_23A1FCD70(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v11)(char *, char *, uint64_t);
  char *v12;
  char *v13;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  v7 = a2[7];
  v8 = *(int *)(a3 + 48);
  v12 = (char *)a2 + v8;
  v13 = (char *)a1 + v8;
  a1[6] = a2[6];
  a1[7] = v7;
  v9 = sub_23A232FE8();
  v11 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v11(v13, v12, v9);
  return a1;
}

_QWORD *sub_23A1FCE50(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(int *)(a3 + 48);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_23A232FE8();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

_OWORD *sub_23A1FCF6C(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  __int128 v4;
  __int128 v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  v6 = *(int *)(a3 + 48);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_23A232FE8();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  return a1;
}

_QWORD *sub_23A1FCFD0(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  *a1 = *a2;
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  swift_bridgeObjectRelease();
  a1[5] = a2[5];
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  swift_bridgeObjectRelease();
  a1[7] = a2[7];
  swift_bridgeObjectRelease();
  v6 = *(int *)(a3 + 48);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_23A232FE8();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 40))(v7, v8, v9);
  return a1;
}

uint64_t sub_23A1FD0AC()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A1FD0B8(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)a1;
    if (*(_QWORD *)a1 >= 0xFFFFFFFFuLL)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = sub_23A232FE8();
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(&a1[*(int *)(a3 + 48)], a2, v8);
  }
}

uint64_t sub_23A1FD134()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

char *sub_23A1FD140(char *result, uint64_t a2, int a3, uint64_t a4)
{
  char *v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)result = (a2 - 1);
  }
  else
  {
    v7 = sub_23A232FE8();
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 48)], a2, a2, v7);
  }
  return result;
}

uint64_t sub_23A1FD1B4()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23A232FE8();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unint64_t sub_23A1FD23C()
{
  unint64_t result;

  result = qword_256951F08;
  if (!qword_256951F08)
  {
    result = MEMORY[0x23B8459BC](&unk_23A2344D8, &type metadata for RecordStore.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256951F08);
  }
  return result;
}

unint64_t sub_23A1FD284()
{
  unint64_t result;

  result = qword_256951F10;
  if (!qword_256951F10)
  {
    result = MEMORY[0x23B8459BC](&unk_23A2345C8, &type metadata for RecordStore.UserStoreRecord.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256951F10);
  }
  return result;
}

unint64_t sub_23A1FD2CC()
{
  unint64_t result;

  result = qword_256951F18;
  if (!qword_256951F18)
  {
    result = MEMORY[0x23B8459BC](&unk_23A2346B8, &type metadata for RecordStore.GroupStoreRecord.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256951F18);
  }
  return result;
}

unint64_t sub_23A1FD314()
{
  unint64_t result;

  result = qword_256951F20;
  if (!qword_256951F20)
  {
    result = MEMORY[0x23B8459BC](&unk_23A2345F0, &type metadata for RecordStore.GroupStoreRecord.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256951F20);
  }
  return result;
}

unint64_t sub_23A1FD35C()
{
  unint64_t result;

  result = qword_256951F28;
  if (!qword_256951F28)
  {
    result = MEMORY[0x23B8459BC](&unk_23A234618, &type metadata for RecordStore.GroupStoreRecord.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256951F28);
  }
  return result;
}

unint64_t sub_23A1FD3A4()
{
  unint64_t result;

  result = qword_256951F30;
  if (!qword_256951F30)
  {
    result = MEMORY[0x23B8459BC](&unk_23A234500, &type metadata for RecordStore.UserStoreRecord.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256951F30);
  }
  return result;
}

unint64_t sub_23A1FD3EC()
{
  unint64_t result;

  result = qword_256951F38;
  if (!qword_256951F38)
  {
    result = MEMORY[0x23B8459BC](&unk_23A234528, &type metadata for RecordStore.UserStoreRecord.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256951F38);
  }
  return result;
}

unint64_t sub_23A1FD434()
{
  unint64_t result;

  result = qword_256951F40;
  if (!qword_256951F40)
  {
    result = MEMORY[0x23B8459BC](&unk_23A234410, &type metadata for RecordStore.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256951F40);
  }
  return result;
}

unint64_t sub_23A1FD47C()
{
  unint64_t result;

  result = qword_256951F48;
  if (!qword_256951F48)
  {
    result = MEMORY[0x23B8459BC](&unk_23A234438, &type metadata for RecordStore.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256951F48);
  }
  return result;
}

uint64_t sub_23A1FD4C0()
{
  unint64_t v0;

  v0 = sub_23A233414();
  swift_bridgeObjectRelease();
  if (v0 >= 8)
    return 8;
  else
    return v0;
}

uint64_t sub_23A1FD508()
{
  unint64_t v0;

  v0 = sub_23A233414();
  swift_bridgeObjectRelease();
  if (v0 >= 5)
    return 5;
  else
    return v0;
}

uint64_t sub_23A1FD550()
{
  unint64_t v0;

  v0 = sub_23A233414();
  swift_bridgeObjectRelease();
  if (v0 >= 9)
    return 9;
  else
    return v0;
}

uint64_t sub_23A1FD598(unint64_t *a1, unint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;

  result = *a1;
  if (!result)
  {
    v9 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256951DC0);
    v10 = sub_23A1F58C8(a2, type metadata accessor for RecordStore.UserStoreRecord, a3);
    result = MEMORY[0x23B8459BC](a4, v9, &v10);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23A1FD61C(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  _QWORD v10[2];

  result = *a1;
  if (!result)
  {
    v9 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256951DF8);
    v10[0] = a2;
    v10[1] = a3;
    result = MEMORY[0x23B8459BC](a4, v9, v10);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23A1FD680(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for RecordStore(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23A1FD6C4(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for RecordStore(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

ValueMetadata *type metadata accessor for NotificationError()
{
  return &type metadata for NotificationError;
}

unint64_t sub_23A1FD718()
{
  sub_23A233300();
  swift_bridgeObjectRelease();
  sub_23A2334E0();
  sub_23A233174();
  swift_bridgeObjectRelease();
  sub_23A233174();
  return 0xD000000000000012;
}

unint64_t sub_23A1FD7C8()
{
  return sub_23A1FD718();
}

uint64_t sub_23A1FD7D0(void (*a1)(_QWORD *), uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  int64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(_QWORD *);
  uint64_t v19;
  _QWORD v20[2];
  uint64_t v21;

  v4 = v3;
  v18 = a1;
  v19 = a2;
  v17 = sub_23A2330D8();
  v6 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17);
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(_QWORD *)(a3 + 16);
  v10 = MEMORY[0x24BEE4AF8];
  if (v9)
  {
    v21 = MEMORY[0x24BEE4AF8];
    sub_23A20D430(0, v9, 0);
    v10 = v21;
    v11 = (uint64_t *)(a3 + 40);
    while (1)
    {
      v12 = *v11;
      v20[0] = *(v11 - 1);
      v20[1] = v12;
      swift_bridgeObjectRetain();
      v18(v20);
      if (v4)
        break;
      v4 = 0;
      swift_bridgeObjectRelease();
      v21 = v10;
      v14 = *(_QWORD *)(v10 + 16);
      v13 = *(_QWORD *)(v10 + 24);
      if (v14 >= v13 >> 1)
      {
        sub_23A20D430(v13 > 1, v14 + 1, 1);
        v10 = v21;
      }
      v11 += 2;
      *(_QWORD *)(v10 + 16) = v14 + 1;
      (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v10+ ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))+ *(_QWORD *)(v6 + 72) * v14, v8, v17);
      if (!--v9)
        return v10;
    }
    swift_release();
    swift_bridgeObjectRelease();
  }
  return v10;
}

uint64_t sub_23A1FD944(uint64_t a1)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  char *v30;
  char *v31;
  NSObject *v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t result;
  int v39;
  uint64_t v40;
  void (*v41)(char *, uint64_t);
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  id v48;
  os_log_type_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  id v53;
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  char *v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  int v61;
  char *v62;
  char *v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;

  v3 = sub_23A2330D8();
  v4 = *(_QWORD *)(v3 - 8);
  v68 = v3;
  v69 = v4;
  v5 = MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v59 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v62 = (char *)&v59 - v8;
  v9 = sub_23A23300C();
  v66 = *(_QWORD *)(v9 - 8);
  v67 = v9;
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v59 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v59 - v13;
  v15 = sub_23A232E80();
  v16 = *(_QWORD *)(v15 - 8);
  v17 = MEMORY[0x24BDAC7A8](v15);
  v63 = (char *)&v59 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = MEMORY[0x24BDAC7A8](v17);
  v64 = (char *)&v59 - v20;
  MEMORY[0x24BDAC7A8](v19);
  v22 = (char *)&v59 - v21;
  v23 = sub_23A21F078();
  if (!v1)
  {
    v42 = v23;
    MEMORY[0x24BDAC7A8](v23);
    *(&v59 - 2) = a1;
    v16 = sub_23A1FD7D0((void (*)(_QWORD *))sub_23A1FE0E0, (uint64_t)(&v59 - 4), v42);
    swift_bridgeObjectRelease();
    return v16;
  }
  v72 = (uint64_t)v1;
  v24 = v1;
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_256951AE0);
  if (!swift_dynamicCast())
  {
    v64 = (char *)v25;
    MEMORY[0x23B845920](v72);
    v43 = v66;
    v44 = v67;
    (*(void (**)(char *, uint64_t, uint64_t))(v66 + 16))(v12, v65, v67);
    v46 = v68;
    v45 = v69;
    (*(void (**)(char *, uint64_t, uint64_t))(v69 + 16))(v7, a1, v68);
    v47 = v1;
    v48 = v1;
    v16 = sub_23A232FF4();
    v49 = sub_23A233264();
    if (os_log_type_enabled((os_log_t)v16, v49))
    {
      v50 = swift_slowAlloc();
      v65 = swift_slowAlloc();
      v72 = v65;
      *(_DWORD *)v50 = 136446466;
      sub_23A1F58C8(&qword_256951AD8, (uint64_t (*)(uint64_t))MEMORY[0x24BEE60D8], MEMORY[0x24BEE60F8]);
      v51 = sub_23A2334E0();
      v71 = sub_23A21FD94(v51, v52, &v72);
      sub_23A233288();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v69 + 8))(v7, v46);
      *(_WORD *)(v50 + 12) = 2082;
      v71 = (uint64_t)v1;
      v53 = v1;
      v54 = sub_23A233144();
      v71 = sub_23A21FD94(v54, v55, &v72);
      sub_23A233288();
      swift_bridgeObjectRelease();
      MEMORY[0x23B845920](v1);
      MEMORY[0x23B845920](v1);
      _os_log_impl(&dword_23A1F0000, (os_log_t)v16, v49, "Failed to get contents of directory %{public}s: %{public}s", (uint8_t *)v50, 0x16u);
      v56 = v65;
      swift_arrayDestroy();
      MEMORY[0x23B845A58](v56, -1, -1);
      MEMORY[0x23B845A58](v50, -1, -1);

      (*(void (**)(char *, uint64_t))(v66 + 8))(v12, v67);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v45 + 8))(v7, v46);
      MEMORY[0x23B845920](v1);
      MEMORY[0x23B845920](v1);

      (*(void (**)(char *, uint64_t))(v43 + 8))(v12, v44);
    }
    swift_willThrow();
    return v16;
  }
  MEMORY[0x23B845920](v1);
  v26 = v64;
  (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v64, v22, v15);
  v27 = v66;
  v28 = v14;
  v29 = v67;
  (*(void (**)(char *, uint64_t, uint64_t))(v66 + 16))(v14, v65, v67);
  v30 = v62;
  (*(void (**)(char *, uint64_t, uint64_t))(v69 + 16))(v62, a1, v68);
  v31 = v63;
  (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v63, v26, v15);
  v32 = sub_23A232FF4();
  v33 = sub_23A233264();
  if (!os_log_type_enabled(v32, (os_log_type_t)v33))
  {
    v57 = v31;
    v41 = *(void (**)(char *, uint64_t))(v16 + 8);
    v41(v57, v15);
    (*(void (**)(char *, uint64_t))(v69 + 8))(v30, v68);

    (*(void (**)(char *, uint64_t))(v27 + 8))(v28, v29);
    goto LABEL_11;
  }
  v65 = (uint64_t)v28;
  v61 = v33;
  v34 = swift_slowAlloc();
  v60 = swift_slowAlloc();
  v71 = v60;
  *(_DWORD *)v34 = 136446466;
  sub_23A1F58C8(&qword_256951AD8, (uint64_t (*)(uint64_t))MEMORY[0x24BEE60D8], MEMORY[0x24BEE60F8]);
  v35 = v68;
  v36 = sub_23A2334E0();
  v70 = sub_23A21FD94(v36, v37, &v71);
  sub_23A233288();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v69 + 8))(v30, v35);
  *(_WORD *)(v34 + 12) = 1024;
  sub_23A1F58C8((unint64_t *)&qword_256951AD0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCAFE0], MEMORY[0x24BDCAFD8]);
  result = sub_23A232F1C();
  if (result < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
  }
  else
  {
    v39 = result;
    v40 = v65;
    if (result <= 0x7FFFFFFF)
    {
      v41 = *(void (**)(char *, uint64_t))(v16 + 8);
      v41(v63, v15);
      LODWORD(v70) = v39;
      sub_23A233288();
      _os_log_impl(&dword_23A1F0000, v32, (os_log_type_t)v61, "Failed to get contents of directory %{public}s: %{darwin.errno}d", (uint8_t *)v34, 0x12u);
      v16 = v60;
      swift_arrayDestroy();
      MEMORY[0x23B845A58](v16, -1, -1);
      MEMORY[0x23B845A58](v34, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v66 + 8))(v40, v67);
LABEL_11:
      v58 = v64;
      sub_23A232E74();
      swift_willThrow();
      v41(v58, v15);
      MEMORY[0x23B845920](v72);
      return v16;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_23A1FE038(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  v3 = sub_23A2330D8();
  MEMORY[0x24BDAC7A8](v3);
  (*(void (**)(char *, uint64_t))(v5 + 16))((char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a2);
  swift_bridgeObjectRetain();
  return sub_23A2330CC();
}

uint64_t sub_23A1FE0E0(uint64_t a1)
{
  uint64_t v1;

  return sub_23A1FE038(a1, *(_QWORD *)(v1 + 16));
}

unint64_t sub_23A1FE0FC(uint64_t a1)
{
  return sub_23A1FE230(a1, &qword_256951FE8, &qword_256951FD8, (uint64_t (*)(char *))sub_23A203D18, (uint64_t (*)(_QWORD))MEMORY[0x24BDCEA58]);
}

unint64_t sub_23A1FE120(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t result;
  char v9;
  uint64_t *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_256951FD0);
  v2 = (_QWORD *)sub_23A2333FC();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (uint64_t *)(a1 + 48);
  while (1)
  {
    v5 = *(v4 - 2);
    v6 = *(v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    result = sub_23A203DB0(v5, v6);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v10 = (uint64_t *)(v2[6] + 16 * result);
    *v10 = v5;
    v10[1] = v6;
    *(_QWORD *)(v2[7] + 8 * result) = v7;
    v11 = v2[2];
    v12 = __OFADD__(v11, 1);
    v13 = v11 + 1;
    if (v12)
      goto LABEL_11;
    v4 += 3;
    v2[2] = v13;
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

unint64_t sub_23A1FE230(uint64_t a1, uint64_t *a2, uint64_t *a3, uint64_t (*a4)(char *), uint64_t (*a5)(_QWORD))
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t result;
  char v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  BOOL v27;
  uint64_t v28;
  _QWORD v29[2];
  uint64_t (*v30)(_QWORD);
  uint64_t (*v31)(char *);

  v30 = a5;
  v31 = a4;
  v8 = __swift_instantiateConcreteTypeFromMangledName(a2);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(_QWORD *)(a1 + 16))
  {
    v13 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(a3);
  v12 = sub_23A2333FC();
  v13 = (_QWORD *)v12;
  v14 = *(_QWORD *)(a1 + 16);
  if (!v14)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v13;
  }
  v15 = *(int *)(v8 + 48);
  v16 = a1;
  v17 = v12 + 64;
  v18 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v29[1] = v16;
  v19 = v16 + v18;
  v20 = *(_QWORD *)(v9 + 72);
  swift_retain();
  while (1)
  {
    sub_23A205614(v19, (uint64_t)v11, a2);
    result = v31(v11);
    if ((v22 & 1) != 0)
      break;
    v23 = result;
    *(_QWORD *)(v17 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v24 = v13[6];
    v25 = v30(0);
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(_QWORD *)(v25 - 8) + 32))(v24 + *(_QWORD *)(*(_QWORD *)(v25 - 8) + 72) * v23, v11, v25);
    *(_QWORD *)(v13[7] + 8 * v23) = *(_QWORD *)&v11[v15];
    v26 = v13[2];
    v27 = __OFADD__(v26, 1);
    v28 = v26 + 1;
    if (v27)
      goto LABEL_11;
    v13[2] = v28;
    v19 += v20;
    if (!--v14)
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

uint64_t sub_23A1FE3CC(unint64_t a1, unint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  void (*v26)(char *, uint64_t, uint64_t);
  NSObject *v27;
  os_log_type_t v28;
  uint64_t v29;
  uint8_t *v30;
  uint8_t *v31;
  void (*v32)(char *, uint64_t);
  int v33;
  unint64_t *v34;
  uint64_t v35;
  unint64_t v36;
  char *v37;
  unint64_t v38;
  void (*v39)(_QWORD, _QWORD, _QWORD);
  uint64_t result;
  void (*v41)(_QWORD, _QWORD, _QWORD);
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void (*v50)(char *, uint64_t, uint64_t);
  char *v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t v57;
  void (*v58)(uint64_t, char *, uint64_t);
  void (**v59)(char *, uint64_t, uint64_t);
  uint64_t v60;
  unint64_t *v61;
  _QWORD *v62;
  uint64_t v63;
  void (*v64)(_QWORD, _QWORD, _QWORD);
  uint64_t *v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  void (*v71)(char *, uint64_t, uint64_t);
  unint64_t v72;
  uint64_t v73;
  char *v74;
  uint64_t v75;
  uint64_t *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  void (*v80)(uint64_t, char *, uint64_t);
  _QWORD *v81;
  unint64_t v82;
  _QWORD *v83;
  void (**v84)(char *, uint64_t, uint64_t);
  uint64_t v85;
  void (*v86)(_QWORD, _QWORD, _QWORD);
  uint64_t v87;
  unint64_t v88;
  uint64_t v89;
  char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  char *v94;
  uint64_t *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t **v99;
  uint64_t v100;
  uint64_t *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  char *v106;
  uint64_t *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t **v110;
  void (*v111)(_QWORD, _QWORD, _QWORD);
  char *v112;
  NSObject *v113;
  os_log_type_t v114;
  uint8_t *v115;
  uint64_t v116;
  _QWORD *v117;
  uint64_t v118;
  void (*v119)(_QWORD, _QWORD, _QWORD);
  void (*v120)(char *, uint64_t);
  uint64_t v121;
  uint64_t v122;
  char *v123;
  char *v124;
  void (*v125)(char *, uint64_t, uint64_t);
  uint64_t v126;
  unint64_t v127;
  unint64_t v128;
  char *v129;
  void (*v130)(_QWORD, _QWORD, _QWORD);
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  unint64_t v134;
  void (*v135)(char *, uint64_t, uint64_t);
  uint64_t v136;
  uint64_t v137;
  uint64_t *v138;
  void (*v139)(char *, uint64_t, uint64_t);
  char *v140;
  uint64_t v141;
  uint64_t v142;
  unint64_t v143;

  v138 = (uint64_t *)a6;
  v7 = v6;
  v137 = a5;
  v127 = a1;
  v128 = a2;
  v10 = sub_23A232FE8();
  v11 = *(_QWORD *)(v10 - 8);
  v141 = v10;
  v142 = v11;
  v12 = MEMORY[0x24BDAC7A8](v10);
  v129 = (char *)&v118 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v140 = (char *)&v118 - v14;
  v15 = type metadata accessor for RecordStore(0);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (unint64_t *)((char *)&v118 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  v18 = sub_23A23300C();
  v19 = *(_QWORD *)(v18 - 8);
  v20 = MEMORY[0x24BDAC7A8](v18);
  v123 = (char *)&v118 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = MEMORY[0x24BDAC7A8](v20);
  v124 = (char *)&v118 - v23;
  MEMORY[0x24BDAC7A8](v22);
  v25 = (char *)&v118 - v24;
  v26 = *(void (**)(_QWORD, _QWORD, _QWORD))(v19 + 16);
  v126 = v7;
  v125 = (void (*)(char *, uint64_t, uint64_t))v26;
  v26((char *)&v118 - v24, v7, v18);
  v27 = sub_23A232FF4();
  v28 = sub_23A23324C();
  if (os_log_type_enabled(v27, v28))
  {
    v29 = v18;
    v30 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v30 = 0;
    _os_log_impl(&dword_23A1F0000, v27, v28, "Updating local domain...", v30, 2u);
    v31 = v30;
    v18 = v29;
    MEMORY[0x23B845A58](v31, -1, -1);
  }

  v32 = *(void (**)(char *, uint64_t))(v19 + 8);
  v32(v25, v18);
  v33 = a3 & 1;
  v34 = v17;
  v35 = v126;
  v36 = v127;
  v37 = (char *)v17;
  v38 = v128;
  v39 = (void (*)(_QWORD, _QWORD, _QWORD))v139;
  result = sub_23A1FF298(v127, v128, v33, a4, v137, (uint64_t)v138, v34);
  v41 = v39;
  if (!v39)
  {
    if (v36 >> 62)
    {
      swift_bridgeObjectRetain();
      v42 = sub_23A2333D8();
      swift_bridgeObjectRelease();
    }
    else
    {
      v42 = *(_QWORD *)((v36 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    v43 = MEMORY[0x24BEE4AF8];
    v122 = (uint64_t)v37;
    v121 = v18;
    v120 = (void (*)(_QWORD, _QWORD))v32;
    v119 = 0;
    if (v42)
    {
      v143 = MEMORY[0x24BEE4AF8];
      result = sub_23A233384();
      if (v42 < 0)
      {
        __break(1u);
        goto LABEL_36;
      }
      if ((v36 & 0xC000000000000001) != 0)
      {
        v44 = 0;
        v139 = (char *)v42;
        v45 = v129;
        do
        {
          v138 = (uint64_t *)(v44 + 1);
          v46 = MEMORY[0x23B84508C]();
          LODWORD(v137) = *(_DWORD *)(v46 + 16);
          v47 = *(_QWORD *)(v46 + 32);
          v136 = *(_QWORD *)(v46 + 24);
          v49 = v141;
          v48 = v142;
          v50 = *(void (**)(char *, uint64_t, uint64_t))(v142 + 16);
          v51 = v140;
          v50(v140, v46 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_uuid, v141);
          v52 = *(_QWORD *)(v46 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_fullName + 8);
          v135 = *(void (**)(char *, uint64_t, uint64_t))(v46
                                                                 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_fullName);
          v132 = v52;
          v53 = *(_QWORD *)(v46 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_homeDirectory + 8);
          v134 = *(_QWORD *)(v46 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_homeDirectory);
          v50(v45, v46 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_primaryGroupUUID, v49);
          v54 = *(_QWORD *)(v46 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_shell + 8);
          v133 = *(_QWORD *)(v46 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_shell);
          v131 = v54;
          v55 = (uint64_t *)(v46 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_memberships);
          swift_beginAccess();
          v56 = *v55;
          v130 = *(void (**)(_QWORD, _QWORD, _QWORD))(v46
                                                               + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_aliases);
          type metadata accessor for UserRecordFile(0);
          v57 = swift_allocObject();
          *(_QWORD *)(v57 + OBJC_IVAR____TtC23DarwinDirectoryInternal14UserRecordFile_aliases) = 0;
          *(_QWORD *)(v57 + 16) = 3;
          *(_DWORD *)(v57 + 24) = v137;
          *(_QWORD *)(v57 + 32) = v136;
          *(_QWORD *)(v57 + 40) = v47;
          v58 = *(void (**)(uint64_t, char *, uint64_t))(v48 + 32);
          v58(v57 + OBJC_IVAR____TtC23DarwinDirectoryInternal14UserRecordFile_uuid, v51, v49);
          v59 = (_QWORD *)(v57 + OBJC_IVAR____TtC23DarwinDirectoryInternal14UserRecordFile_fullName);
          v60 = v132;
          *v59 = v135;
          v59[1] = v60;
          v61 = (unint64_t *)(v57 + OBJC_IVAR____TtC23DarwinDirectoryInternal14UserRecordFile_homeDirectory);
          *v61 = v134;
          v61[1] = v53;
          v58(v57 + OBJC_IVAR____TtC23DarwinDirectoryInternal14UserRecordFile_primaryGroupUUID, v45, v49);
          v62 = (_QWORD *)(v57 + OBJC_IVAR____TtC23DarwinDirectoryInternal14UserRecordFile_shell);
          v64 = v130;
          v63 = v131;
          *v62 = v133;
          v62[1] = v63;
          *(_QWORD *)(v57 + OBJC_IVAR____TtC23DarwinDirectoryInternal14UserRecordFile_memberships) = v56;
          *(_QWORD *)(v57 + OBJC_IVAR____TtC23DarwinDirectoryInternal14UserRecordFile_aliases) = v64;
          swift_bridgeObjectRetain();
          v65 = (uint64_t *)v139;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_unknownObjectRelease();
          swift_bridgeObjectRelease();
          sub_23A23336C();
          sub_23A233390();
          sub_23A23339C();
          sub_23A233378();
          v44 = (uint64_t)v138;
        }
        while (v65 != v138);
      }
      else
      {
        v66 = (uint64_t *)(v36 + 32);
        v130 = *(void (**)(_QWORD, _QWORD, _QWORD))(v142 + 16);
        do
        {
          v67 = *v66;
          v138 = v66 + 1;
          v139 = (char *)v42;
          LODWORD(v132) = *(_DWORD *)(v67 + 16);
          v68 = *(_QWORD *)(v67 + 32);
          v131 = *(_QWORD *)(v67 + 24);
          v70 = v140;
          v69 = v141;
          v71 = (void (*)(char *, uint64_t, uint64_t))v130;
          v130(v140, v67 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_uuid, v141);
          v72 = *(_QWORD *)(v67 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_fullName + 8);
          v137 = *(_QWORD *)(v67 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_fullName);
          v134 = v72;
          v73 = *(_QWORD *)(v67 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_homeDirectory + 8);
          v136 = *(_QWORD *)(v67 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_homeDirectory);
          v74 = v129;
          v71(v129, v67 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_primaryGroupUUID, v69);
          v75 = *(_QWORD *)(v67 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_shell + 8);
          v135 = *(void (**)(char *, uint64_t, uint64_t))(v67
                                                                 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_shell);
          v133 = v75;
          v76 = (uint64_t *)(v67 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_memberships);
          swift_beginAccess();
          v77 = *v76;
          v78 = *(_QWORD *)(v67 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_aliases);
          type metadata accessor for UserRecordFile(0);
          v79 = swift_allocObject();
          *(_QWORD *)(v79 + OBJC_IVAR____TtC23DarwinDirectoryInternal14UserRecordFile_aliases) = 0;
          *(_QWORD *)(v79 + 16) = 3;
          *(_DWORD *)(v79 + 24) = v132;
          *(_QWORD *)(v79 + 32) = v131;
          *(_QWORD *)(v79 + 40) = v68;
          v80 = *(void (**)(uint64_t, char *, uint64_t))(v142 + 32);
          v80(v79 + OBJC_IVAR____TtC23DarwinDirectoryInternal14UserRecordFile_uuid, v70, v69);
          v81 = (_QWORD *)(v79 + OBJC_IVAR____TtC23DarwinDirectoryInternal14UserRecordFile_fullName);
          v82 = v134;
          *v81 = v137;
          v81[1] = v82;
          v83 = (_QWORD *)(v79 + OBJC_IVAR____TtC23DarwinDirectoryInternal14UserRecordFile_homeDirectory);
          *v83 = v136;
          v83[1] = v73;
          v80(v79 + OBJC_IVAR____TtC23DarwinDirectoryInternal14UserRecordFile_primaryGroupUUID, v74, v69);
          v84 = (_QWORD *)(v79 + OBJC_IVAR____TtC23DarwinDirectoryInternal14UserRecordFile_shell);
          v85 = v133;
          *v84 = v135;
          v84[1] = v85;
          *(_QWORD *)(v79 + OBJC_IVAR____TtC23DarwinDirectoryInternal14UserRecordFile_memberships) = v77;
          *(_QWORD *)(v79 + OBJC_IVAR____TtC23DarwinDirectoryInternal14UserRecordFile_aliases) = v78;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          v86 = (void (*)(_QWORD, _QWORD, _QWORD))v139;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          sub_23A23336C();
          sub_23A233390();
          sub_23A23339C();
          sub_23A233378();
          v66 = v138;
          v42 = (uint64_t)v86 - 1;
        }
        while (v42);
      }
      v43 = v143;
      v37 = (char *)v122;
      v18 = v121;
      v32 = (void (*)(char *, uint64_t))v120;
      v41 = v119;
      v35 = v126;
      v38 = v128;
    }
    if (v38 >> 62)
    {
      swift_bridgeObjectRetain();
      v87 = sub_23A2333D8();
      swift_bridgeObjectRelease();
    }
    else
    {
      v87 = *(_QWORD *)((v38 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    v88 = MEMORY[0x24BEE4AF8];
    if (!v87)
    {
      v100 = (uint64_t)v37;
LABEL_27:
      sub_23A1FFD88(v43, v88, v100);
      if (v41)
      {
        sub_23A1FD6C4(v100);
        swift_bridgeObjectRelease();
        return swift_bridgeObjectRelease();
      }
      else
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v112 = v124;
        v125(v124, v35, v18);
        v113 = sub_23A232FF4();
        v114 = sub_23A233270();
        if (os_log_type_enabled(v113, v114))
        {
          v115 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v115 = 0;
          _os_log_impl(&dword_23A1F0000, v113, v114, "Updated local domain", v115, 2u);
          v112 = v124;
          MEMORY[0x23B845A58](v115, -1, -1);
        }

        v32(v112, v18);
        v116 = type metadata accessor for RecordManager();
        v117 = __swift_project_boxed_opaque_existential_1((_QWORD *)(v35 + *(int *)(v116 + 20)), *(_QWORD *)(v35 + *(int *)(v116 + 20) + 24));
        __swift_project_boxed_opaque_existential_1(v117 + 5, v117[8]);
        sub_23A21F9D4(0xD00000000000001FLL, 0x800000023A2372C0);
        return sub_23A1FD6C4(v100);
      }
    }
    v134 = v43;
    v143 = MEMORY[0x24BEE4AF8];
    result = sub_23A233384();
    if ((v87 & 0x8000000000000000) == 0)
    {
      v89 = v87;
      if ((v38 & 0xC000000000000001) != 0)
      {
        v90 = 0;
        v135 = (void (*)(char *, uint64_t, uint64_t))v87;
        v91 = v141;
        do
        {
          v139 = v90 + 1;
          v92 = MEMORY[0x23B84508C]();
          LODWORD(v137) = *(_DWORD *)(v92 + 32);
          v93 = *(_QWORD *)(v92 + 48);
          v136 = *(_QWORD *)(v92 + 40);
          v94 = v140;
          (*(void (**)(char *, uint64_t, uint64_t))(v142 + 16))(v140, v92 + OBJC_IVAR____TtC23DarwinDirectoryInternal11GroupRecord_uuid, v91);
          v95 = *(uint64_t **)(v92 + 24);
          v138 = *(uint64_t **)(v92 + 16);
          v96 = *(_QWORD *)(v92 + OBJC_IVAR____TtC23DarwinDirectoryInternal11GroupRecord_nestedGroups);
          v97 = *(_QWORD *)(v92 + OBJC_IVAR____TtC23DarwinDirectoryInternal11GroupRecord_aliases);
          type metadata accessor for GroupRecordFile(0);
          v98 = swift_allocObject();
          *(_QWORD *)(v98 + OBJC_IVAR____TtC23DarwinDirectoryInternal15GroupRecordFile_nestedGroups) = 0;
          *(_QWORD *)(v98 + OBJC_IVAR____TtC23DarwinDirectoryInternal15GroupRecordFile_aliases) = 0;
          *(_QWORD *)(v98 + 16) = 3;
          *(_DWORD *)(v98 + 24) = v137;
          *(_QWORD *)(v98 + 32) = v136;
          *(_QWORD *)(v98 + 40) = v93;
          (*(void (**)(uint64_t, char *, uint64_t))(v142 + 32))(v98 + OBJC_IVAR____TtC23DarwinDirectoryInternal15GroupRecordFile_uuid, v94, v91);
          v99 = (uint64_t **)(v98 + OBJC_IVAR____TtC23DarwinDirectoryInternal15GroupRecordFile_fullName);
          *v99 = v138;
          v99[1] = v95;
          *(_QWORD *)(v98 + OBJC_IVAR____TtC23DarwinDirectoryInternal15GroupRecordFile_nestedGroups) = v96;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          *(_QWORD *)(v98 + OBJC_IVAR____TtC23DarwinDirectoryInternal15GroupRecordFile_aliases) = v97;
          swift_unknownObjectRelease();
          swift_bridgeObjectRelease();
          sub_23A23336C();
          sub_23A233390();
          sub_23A23339C();
          sub_23A233378();
          v90 = v139;
        }
        while ((char *)v135 != v139);
      }
      else
      {
        v101 = (uint64_t *)(v38 + 32);
        v135 = *(void (**)(char *, uint64_t, uint64_t))(v142 + 16);
        v102 = v89;
        do
        {
          v103 = *v101++;
          LODWORD(v137) = *(_DWORD *)(v103 + 32);
          v104 = *(_QWORD *)(v103 + 48);
          v136 = *(_QWORD *)(v103 + 40);
          v106 = v140;
          v105 = v141;
          v135(v140, v103 + OBJC_IVAR____TtC23DarwinDirectoryInternal11GroupRecord_uuid, v141);
          v107 = *(uint64_t **)(v103 + 24);
          v138 = *(uint64_t **)(v103 + 16);
          v108 = *(_QWORD *)(v103 + OBJC_IVAR____TtC23DarwinDirectoryInternal11GroupRecord_nestedGroups);
          v139 = *(char **)(v103 + OBJC_IVAR____TtC23DarwinDirectoryInternal11GroupRecord_aliases);
          type metadata accessor for GroupRecordFile(0);
          v109 = swift_allocObject();
          *(_QWORD *)(v109 + OBJC_IVAR____TtC23DarwinDirectoryInternal15GroupRecordFile_nestedGroups) = 0;
          *(_QWORD *)(v109 + OBJC_IVAR____TtC23DarwinDirectoryInternal15GroupRecordFile_aliases) = 0;
          *(_QWORD *)(v109 + 16) = 3;
          *(_DWORD *)(v109 + 24) = v137;
          *(_QWORD *)(v109 + 32) = v136;
          *(_QWORD *)(v109 + 40) = v104;
          (*(void (**)(uint64_t, char *, uint64_t))(v142 + 32))(v109 + OBJC_IVAR____TtC23DarwinDirectoryInternal15GroupRecordFile_uuid, v106, v105);
          v110 = (uint64_t **)(v109 + OBJC_IVAR____TtC23DarwinDirectoryInternal15GroupRecordFile_fullName);
          *v110 = v138;
          v110[1] = v107;
          *(_QWORD *)(v109 + OBJC_IVAR____TtC23DarwinDirectoryInternal15GroupRecordFile_nestedGroups) = v108;
          swift_retain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          v111 = (void (*)(_QWORD, _QWORD, _QWORD))v139;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          *(_QWORD *)(v109 + OBJC_IVAR____TtC23DarwinDirectoryInternal15GroupRecordFile_aliases) = v111;
          swift_release();
          swift_bridgeObjectRelease();
          sub_23A23336C();
          sub_23A233390();
          sub_23A23339C();
          sub_23A233378();
          --v102;
        }
        while (v102);
      }
      v88 = v143;
      v100 = v122;
      v18 = v121;
      v32 = (void (*)(char *, uint64_t))v120;
      v41 = v119;
      v35 = v126;
      v43 = v134;
      goto LABEL_27;
    }
LABEL_36:
    __break(1u);
  }
  return result;
}

uint64_t sub_23A1FF298@<X0>(unint64_t a1@<X0>, unint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, unint64_t *a7@<X8>)
{
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
  char *v19;
  uint64_t v20;
  char *v21;
  NSObject *v22;
  os_log_type_t v23;
  unint64_t v24;
  uint8_t *v25;
  void (*v26)(char *, uint64_t);
  unint64_t v27;
  unint64_t v28;
  void (*v29)(char *, uint64_t, void *);
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *v46;
  os_log_type_t v47;
  uint8_t *v48;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  int v56;
  unint64_t v57;
  uint64_t v58;
  BOOL v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  uint64_t v64;
  int v65;
  unint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t *v71;
  int v72;
  uint64_t v73;
  unint64_t v74;
  unint64_t v75;
  uint64_t v76;
  uint64_t v77;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  char *v81;
  void (*v82)(char *, uint64_t, uint64_t);
  void (*v83)(char *, uint64_t);
  uint64_t v84;
  uint64_t v85;
  unint64_t v86;
  unint64_t v87;

  v8 = v7;
  v73 = a6;
  v74 = a1;
  v76 = a4;
  v77 = a5;
  v72 = a3;
  v75 = a2;
  v71 = a7;
  v9 = sub_23A232FE8();
  v79 = *(_QWORD *)(v9 - 8);
  v80 = v9;
  v10 = MEMORY[0x24BDAC7A8](v9);
  v84 = (uint64_t)&v71 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v78 = (char *)&v71 - v12;
  v13 = sub_23A23300C();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v81 = (char *)&v71 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v71 - v18;
  MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)&v71 - v20;
  v82 = *(void (**)(char *, uint64_t, uint64_t))(v14 + 16);
  v82((char *)&v71 - v20, v8, v13);
  v22 = sub_23A232FF4();
  v23 = sub_23A23324C();
  v24 = v23;
  if (os_log_type_enabled(v22, v23))
  {
    v25 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v25 = 0;
    _os_log_impl(&dword_23A1F0000, v22, (os_log_type_t)v24, "Building updated record store...", v25, 2u);
    MEMORY[0x23B845A58](v25, -1, -1);
  }

  v26 = *(void (**)(char *, uint64_t))(v14 + 8);
  v26(v21, v13);
  v27 = sub_23A1F2154(0);
  v28 = v27;
  v87 = v27;
  v86 = (unint64_t)v29;
  v83 = v26;
  if (v27 >> 62)
    goto LABEL_128;
  v30 = *(_QWORD *)((v27 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v30; v30 = sub_23A2333D8())
  {
    v31 = 0;
    v24 = v28 & 0xC000000000000001;
    while (1)
    {
      if (v24)
        v32 = MEMORY[0x23B84508C](v31, v28);
      else
        v32 = swift_retain();
      v33 = *(_DWORD *)(v32 + 16);
      swift_release();
      if (v33 == 501)
      {
        swift_bridgeObjectRelease();
        v24 = v31 + 1;
        if (__OFADD__(v31, 1))
        {
          __break(1u);
        }
        else
        {
          v28 = v87;
          if (!(v87 >> 62))
          {
            if (v24 == *(_QWORD *)((v87 & 0xFFFFFFFFFFFFF8) + 0x10))
              goto LABEL_14;
LABEL_37:
            v53 = v31 + 5;
            while (1)
            {
              v54 = v53 - 4;
              v24 = v28 & 0xC000000000000001;
              if ((v28 & 0xC000000000000001) != 0)
              {
                v55 = MEMORY[0x23B84508C](v53 - 4, v28);
              }
              else
              {
                if ((v54 & 0x8000000000000000) != 0)
                  goto LABEL_108;
                if (v54 >= *(_QWORD *)((v28 & 0xFFFFFFFFFFFFF8) + 0x10))
                  goto LABEL_109;
                v55 = swift_retain();
              }
              v56 = *(_DWORD *)(v55 + 16);
              swift_release();
              if (v56 != 501)
              {
                if (v54 != v31)
                {
                  if (v24)
                  {
                    v58 = MEMORY[0x23B84508C](v31, v28);
                    v24 = MEMORY[0x23B84508C](v53 - 4, v28);
                  }
                  else
                  {
                    if (v31 < 0)
                      goto LABEL_116;
                    v57 = *(_QWORD *)((v28 & 0xFFFFFFFFFFFFF8) + 0x10);
                    if (v31 >= v57)
                      goto LABEL_117;
                    v58 = *(_QWORD *)(v28 + 8 * v31 + 32);
                    swift_retain();
                    if ((v54 & 0x8000000000000000) != 0)
                      goto LABEL_118;
                    if (v54 >= v57)
                      goto LABEL_119;
                    v24 = *(_QWORD *)(v28 + 8 * v53);
                    swift_retain();
                  }
                  if (!swift_isUniquelyReferenced_nonNull_bridgeObject()
                    || (v28 & 0x8000000000000000) != 0
                    || (v28 & 0x4000000000000000) != 0)
                  {
                    sub_23A205148(v28);
                  }
                  *(_QWORD *)((v28 & 0xFFFFFFFFFFFFFF8) + 8 * v31 + 0x20) = v24;
                  swift_release();
                  sub_23A2331C8();
                  v28 = v87;
                  if (!swift_isUniquelyReferenced_nonNull_bridgeObject()
                    || (v28 & 0x8000000000000000) != 0
                    || (v28 & 0x4000000000000000) != 0)
                  {
                    sub_23A205148(v28);
                  }
                  if ((v54 & 0x8000000000000000) != 0)
                    goto LABEL_120;
                  if (v54 >= *(_QWORD *)((v28 & 0xFFFFFFFFFFFFFF8) + 0x10))
                    goto LABEL_121;
                  *(_QWORD *)((v28 & 0xFFFFFFFFFFFFFF8) + 8 * v53) = v58;
                  swift_release();
                  v28 = (unint64_t)&v87;
                  sub_23A2331C8();
                }
                v59 = __OFADD__(v31++, 1);
                if (v59)
                  goto LABEL_114;
              }
              v24 = v53 - 3;
              if (__OFADD__(v54, 1))
                goto LABEL_110;
              v28 = v87;
              if (v87 >> 62)
              {
                swift_bridgeObjectRetain();
                v60 = sub_23A2333D8();
                swift_bridgeObjectRelease();
              }
              else
              {
                v60 = *(_QWORD *)((v87 & 0xFFFFFFFFFFFFF8) + 0x10);
              }
              ++v53;
              if (v24 == v60)
                goto LABEL_14;
            }
          }
        }
        swift_bridgeObjectRetain();
        v69 = sub_23A2333D8();
        swift_bridgeObjectRelease();
        if (v24 == v69)
          goto LABEL_14;
        goto LABEL_37;
      }
      v34 = v31 + 1;
      if (__OFADD__(v31, 1))
        break;
      ++v31;
      if (v34 == v30)
        goto LABEL_12;
    }
    __break(1u);
LABEL_107:
    __break(1u);
LABEL_108:
    __break(1u);
LABEL_109:
    __break(1u);
LABEL_110:
    __break(1u);
LABEL_111:
    __break(1u);
LABEL_112:
    __break(1u);
LABEL_113:
    __break(1u);
LABEL_114:
    __break(1u);
LABEL_115:
    __break(1u);
LABEL_116:
    __break(1u);
LABEL_117:
    __break(1u);
LABEL_118:
    __break(1u);
LABEL_119:
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
    swift_bridgeObjectRetain();
  }
LABEL_12:
  swift_bridgeObjectRelease();
  v28 = v87;
  if (v87 >> 62)
    goto LABEL_136;
  v31 = *(_QWORD *)((v87 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
LABEL_14:
    if (v28 >> 62)
    {
      swift_bridgeObjectRetain();
      v35 = sub_23A2333D8();
      swift_bridgeObjectRelease();
      if (v35 < v31)
      {
LABEL_131:
        __break(1u);
        goto LABEL_132;
      }
    }
    else
    {
      v35 = *(_QWORD *)((v28 & 0xFFFFFFFFFFFFF8) + 0x10);
      if (v35 < v31)
        goto LABEL_131;
    }
    sub_23A205318(v31, v35, (void (*)(_QWORD))type metadata accessor for UserRecord);
    v28 = v86;
    v24 = v86 >> 62;
    if (!(v86 >> 62))
    {
      v36 = *(_QWORD *)((v86 & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (!v36)
        goto LABEL_25;
      goto LABEL_18;
    }
LABEL_132:
    swift_bridgeObjectRetain();
    v36 = sub_23A2333D8();
    if (!v36)
    {
LABEL_25:
      swift_bridgeObjectRelease();
      if (v24)
      {
        swift_bridgeObjectRetain();
        v37 = sub_23A2333D8();
        swift_bridgeObjectRelease();
      }
      else
      {
        v37 = *(_QWORD *)((v28 & 0xFFFFFFFFFFFFF8) + 0x10);
      }
      goto LABEL_27;
    }
LABEL_18:
    v37 = 0;
    while (1)
    {
      v38 = (v28 & 0xC000000000000001) != 0 ? MEMORY[0x23B84508C](v37, v28) : swift_retain();
      v39 = *(_DWORD *)(v38 + 32);
      swift_release();
      if (v39 == 501)
        break;
      v40 = v37 + 1;
      if (__OFADD__(v37, 1))
        goto LABEL_107;
      ++v37;
      if (v40 == v36)
        goto LABEL_25;
    }
    swift_bridgeObjectRelease();
    v61 = v37 + 1;
    if (__OFADD__(v37, 1))
    {
      __break(1u);
    }
    else if (!v24)
    {
      if (v61 != *(_QWORD *)((v28 & 0xFFFFFFFFFFFFF8) + 0x10))
        goto LABEL_73;
      goto LABEL_27;
    }
    swift_bridgeObjectRetain();
    v70 = sub_23A2333D8();
    swift_bridgeObjectRelease();
    if (v61 != v70)
    {
LABEL_73:
      v62 = v37 + 5;
      do
      {
        v63 = v62 - 4;
        v24 = v28 & 0xC000000000000001;
        if ((v28 & 0xC000000000000001) != 0)
        {
          v64 = MEMORY[0x23B84508C](v62 - 4, v28);
        }
        else
        {
          if ((v63 & 0x8000000000000000) != 0)
            goto LABEL_111;
          if (v63 >= *(_QWORD *)((v28 & 0xFFFFFFFFFFFFF8) + 0x10))
            goto LABEL_112;
          v64 = swift_retain();
        }
        v65 = *(_DWORD *)(v64 + 32);
        swift_release();
        if (v65 != 501)
        {
          if (v63 != v37)
          {
            if (v24)
            {
              v67 = MEMORY[0x23B84508C](v37, v28);
              v24 = MEMORY[0x23B84508C](v62 - 4, v28);
            }
            else
            {
              if (v37 < 0)
                goto LABEL_122;
              v66 = *(_QWORD *)((v28 & 0xFFFFFFFFFFFFF8) + 0x10);
              if (v37 >= v66)
                goto LABEL_123;
              v67 = *(_QWORD *)(v28 + 8 * v37 + 32);
              swift_retain();
              if ((v63 & 0x8000000000000000) != 0)
                goto LABEL_124;
              if (v63 >= v66)
                goto LABEL_125;
              v24 = *(_QWORD *)(v28 + 8 * v62);
              swift_retain();
            }
            if (!swift_isUniquelyReferenced_nonNull_bridgeObject()
              || (v28 & 0x8000000000000000) != 0
              || (v28 & 0x4000000000000000) != 0)
            {
              sub_23A205148(v28);
            }
            *(_QWORD *)((v28 & 0xFFFFFFFFFFFFFF8) + 8 * v37 + 0x20) = v24;
            swift_release();
            sub_23A2331C8();
            v28 = v86;
            if (!swift_isUniquelyReferenced_nonNull_bridgeObject()
              || (v28 & 0x8000000000000000) != 0
              || (v28 & 0x4000000000000000) != 0)
            {
              sub_23A205148(v28);
            }
            if ((v63 & 0x8000000000000000) != 0)
              goto LABEL_126;
            if (v63 >= *(_QWORD *)((v28 & 0xFFFFFFFFFFFFFF8) + 0x10))
              goto LABEL_127;
            *(_QWORD *)((v28 & 0xFFFFFFFFFFFFFF8) + 8 * v62) = v67;
            swift_release();
            v28 = (unint64_t)&v86;
            sub_23A2331C8();
          }
          v59 = __OFADD__(v37++, 1);
          if (v59)
            goto LABEL_115;
        }
        v24 = v62 - 3;
        if (__OFADD__(v63, 1))
          goto LABEL_113;
        v28 = v86;
        if (v86 >> 62)
        {
          swift_bridgeObjectRetain();
          v68 = sub_23A2333D8();
          swift_bridgeObjectRelease();
        }
        else
        {
          v68 = *(_QWORD *)((v86 & 0xFFFFFFFFFFFFF8) + 0x10);
        }
        ++v62;
      }
      while (v24 != v68);
    }
LABEL_27:
    if (v28 >> 62)
      break;
    v41 = *(_QWORD *)((v28 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v41 >= v37)
      goto LABEL_29;
LABEL_135:
    __break(1u);
LABEL_136:
    swift_bridgeObjectRetain();
    v31 = sub_23A2333D8();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  v41 = sub_23A2333D8();
  swift_bridgeObjectRelease();
  if (v41 < v37)
    goto LABEL_135;
LABEL_29:
  sub_23A205318(v37, v41, (void (*)(_QWORD))type metadata accessor for GroupRecord);
  v42 = type metadata accessor for RecordManager();
  v43 = __swift_project_boxed_opaque_existential_1((_QWORD *)(v8 + *(int *)(v42 + 20)), *(_QWORD *)(v8 + *(int *)(v42 + 20) + 24));
  __swift_project_boxed_opaque_existential_1(v43 + 10, v43[13]);
  v45 = v84;
  v44 = v85;
  sub_23A2063A8(v84);
  if (v44)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v82(v19, v8, v13);
    v46 = sub_23A232FF4();
    v47 = sub_23A233264();
    if (os_log_type_enabled(v46, v47))
    {
      v48 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v48 = 0;
      _os_log_impl(&dword_23A1F0000, v46, v47, "Failed to update local domain: failed to get current boot UUID", v48, 2u);
      MEMORY[0x23B845A58](v48, -1, -1);
    }

    v83(v19, v13);
    return swift_willThrow();
  }
  else
  {
    v51 = (uint64_t)v78;
    v50 = v79;
    v52 = v80;
    (*(void (**)(char *, uint64_t, uint64_t))(v79 + 32))(v78, v45, v80);
    sub_23A208024(v87, (void (*)(char *, uint64_t, void *))v86, v74, v75, v51, v72 & 1, v76, v77, v71);
    (*(void (**)(uint64_t, uint64_t))(v50 + 8))(v51, v52);
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_23A1FFD88(unint64_t a1, unint64_t a2, uint64_t a3)
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
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  char *v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  void (*v27)(char *, uint64_t);
  uint64_t v28;
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  NSObject *v33;
  os_log_type_t v34;
  uint8_t *v35;
  uint64_t v36;
  _QWORD *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD v42[5];
  char *v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  uint64_t v50;
  void (*v51)(char *, uint64_t, uint64_t);
  uint64_t v52;
  _QWORD v53[5];

  v5 = v3;
  v49 = a2;
  v50 = a3;
  v48 = a1;
  v46 = sub_23A232E80();
  v42[1] = *(_QWORD *)(v46 - 8);
  v6 = MEMORY[0x24BDAC7A8](v46);
  v42[2] = (char *)v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v42[4] = (char *)v42 - v9;
  MEMORY[0x24BDAC7A8](v8);
  v45 = (char *)v42 - v10;
  v44 = sub_23A2330D8();
  v47 = *(_QWORD *)(v44 - 8);
  MEMORY[0x24BDAC7A8](v44);
  v43 = (char *)v42 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_23A23300C();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v42[3] = (char *)v42 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)v42 - v17;
  v19 = MEMORY[0x24BDAC7A8](v16);
  v21 = (char *)v42 - v20;
  MEMORY[0x24BDAC7A8](v19);
  v23 = (char *)v42 - v22;
  v51 = *(void (**)(char *, uint64_t, uint64_t))(v13 + 16);
  v52 = v5;
  v51((char *)v42 - v22, v5, v12);
  v24 = sub_23A232FF4();
  v25 = sub_23A23324C();
  if (os_log_type_enabled(v24, v25))
  {
    v26 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v26 = 0;
    _os_log_impl(&dword_23A1F0000, v24, v25, "Preparing staging directory...", v26, 2u);
    MEMORY[0x23B845A58](v26, -1, -1);
  }

  v27 = *(void (**)(char *, uint64_t))(v13 + 8);
  v27(v23, v12);
  v28 = v52;
  sub_23A20053C();
  if (!v4)
  {
    v51(v21, v28, v12);
    v29 = sub_23A232FF4();
    v30 = sub_23A23324C();
    if (os_log_type_enabled(v29, v30))
    {
      v31 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v31 = 0;
      _os_log_impl(&dword_23A1F0000, v29, v30, "Staging files...", v31, 2u);
      MEMORY[0x23B845A58](v31, -1, -1);
    }

    v27(v21, v12);
    sub_23A200754(v48, v49, v50);
    v51(v18, v28, v12);
    v33 = sub_23A232FF4();
    v34 = sub_23A23324C();
    if (os_log_type_enabled(v33, v34))
    {
      v35 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v35 = 0;
      _os_log_impl(&dword_23A1F0000, v33, v34, "Swapping in staged files...", v35, 2u);
      MEMORY[0x23B845A58](v35, -1, -1);
    }

    v27(v18, v12);
    v36 = type metadata accessor for RecordManager();
    v37 = __swift_project_boxed_opaque_existential_1((_QWORD *)(v28 + *(int *)(v36 + 20)), *(_QWORD *)(v28 + *(int *)(v36 + 20) + 24));
    sub_23A203CD4((uint64_t)v37, (uint64_t)v53);
    __swift_project_boxed_opaque_existential_1(v53, v53[3]);
    if (qword_256951A70 != -1)
      swift_once();
    v38 = v44;
    v39 = __swift_project_value_buffer(v44, (uint64_t)qword_2569560B8);
    v40 = (uint64_t)v43;
    (*(void (**)(char *, uint64_t, uint64_t))(v47 + 16))(v43, v39, v38);
    if (qword_256951A68 != -1)
      swift_once();
    v41 = __swift_project_value_buffer(v38, (uint64_t)qword_2569560A0);
    sub_23A21E600(v40, v41);
    (*(void (**)(uint64_t, uint64_t))(v47 + 8))(v40, v38);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v53);
  }
  return sub_23A200420(v28);
}

uint64_t sub_23A200420(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v10;

  v2 = sub_23A23300C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
  v6 = sub_23A232FF4();
  v7 = sub_23A23324C();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_23A1F0000, v6, v7, "Cleaning up staging directory...", v8, 2u);
    MEMORY[0x23B845A58](v8, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return sub_23A2009C0();
}

uint64_t sub_23A20053C()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  id v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  _QWORD v16[2];
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v2 = sub_23A23300C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23A2009C0();
  if (!v1)
    return sub_23A200EC8();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v0, v2);
  v6 = v1;
  v7 = v1;
  v8 = sub_23A232FF4();
  v9 = sub_23A233264();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc();
    v17 = swift_slowAlloc();
    v18 = (uint64_t)v1;
    v19 = v17;
    *(_DWORD *)v10 = 136446210;
    v16[1] = v10 + 4;
    v11 = v1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256951AE0);
    v12 = sub_23A233144();
    v18 = sub_23A21FD94(v12, v13, &v19);
    sub_23A233288();
    swift_bridgeObjectRelease();
    MEMORY[0x23B845920](v1);
    MEMORY[0x23B845920](v1);
    _os_log_impl(&dword_23A1F0000, v8, v9, "Failed to update local domain: failed to remove staging directory: %{public}s", v10, 0xCu);
    v14 = v17;
    swift_arrayDestroy();
    MEMORY[0x23B845A58](v14, -1, -1);
    MEMORY[0x23B845A58](v10, -1, -1);
  }
  else
  {
    MEMORY[0x23B845920](v1);
    MEMORY[0x23B845920](v1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return swift_willThrow();
}

uint64_t sub_23A200754(unint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  uint64_t v20;

  v8 = sub_23A23300C();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_256951AA8 != -1)
    swift_once();
  v12 = sub_23A2330D8();
  v13 = __swift_project_value_buffer(v12, (uint64_t)qword_256956160);
  sub_23A201848(a1, v13, &qword_256951FB0, &qword_256951FC8, &qword_256951FC0, &qword_256951FB8, (uint8_t *)sub_23A21CE24);
  if (v4)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v3, v8);
    v17 = sub_23A232FF4();
    v18 = sub_23A233264();
    if (os_log_type_enabled(v17, v18))
    {
      v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_23A1F0000, v17, v18, "Failed to update local domain: failed to save files", v19, 2u);
      MEMORY[0x23B845A58](v19, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    return swift_willThrow();
  }
  else
  {
    if (qword_256951AB0 != -1)
      swift_once();
    v14 = __swift_project_value_buffer(v12, (uint64_t)qword_256956178);
    sub_23A201848(a2, v14, &qword_256951F80, &qword_256951FA8, &qword_256951F90, &qword_256951F88, (uint8_t *)sub_23A21CFDC);
    if (qword_256951A80 != -1)
      swift_once();
    v15 = __swift_project_value_buffer(v12, (uint64_t)qword_2569560E8);
    return sub_23A201E7C(a3, v15);
  }
}

uint64_t sub_23A2009C0()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  uint64_t result;
  int v26;
  void (*v27)(char *, uint64_t);
  uint64_t v28;
  char *v29;
  uint64_t v30;
  id v31;
  id v32;
  NSObject *v33;
  os_log_type_t v34;
  uint8_t *v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  char *v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45[5];
  uint64_t v46;

  v44 = sub_23A23300C();
  v2 = *(_QWORD *)(v44 - 8);
  v3 = MEMORY[0x24BDAC7A8](v44);
  v41 = (char *)&v40 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v42 = (char *)&v40 - v5;
  v6 = sub_23A232E80();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v40 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v8);
  v13 = (char *)&v40 - v12;
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v40 - v14;
  v16 = type metadata accessor for RecordManager();
  v17 = __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + *(int *)(v16 + 20)), *(_QWORD *)(v0 + *(int *)(v16 + 20) + 24));
  sub_23A203CD4((uint64_t)v17, (uint64_t)v45);
  __swift_project_boxed_opaque_existential_1(v45, v45[3]);
  if (qword_256951A70 != -1)
    swift_once();
  v18 = sub_23A2330D8();
  v19 = __swift_project_value_buffer(v18, (uint64_t)qword_2569560B8);
  sub_23A21DB84(v19);
  if (!v1)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v45);
  v43 = v2;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v45);
  v45[0] = (uint64_t)v1;
  v20 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256951AE0);
  if (swift_dynamicCast())
  {
    MEMORY[0x23B845920](v1);
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v13, v15, v6);
    v21 = v44;
    (*(void (**)(char *, uint64_t, uint64_t))(v43 + 16))(v42, v0, v44);
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v10, v13, v6);
    v22 = sub_23A232FF4();
    v23 = sub_23A233264();
    if (!os_log_type_enabled(v22, v23))
    {
      v27 = *(void (**)(char *, uint64_t))(v7 + 8);
      v27(v10, v6);
      goto LABEL_13;
    }
    v24 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v24 = 67109120;
    sub_23A1F58C8((unint64_t *)&qword_256951AD0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCAFE0], MEMORY[0x24BDCAFD8]);
    result = sub_23A232F1C();
    if (result < (uint64_t)0xFFFFFFFF80000000)
    {
      __break(1u);
    }
    else
    {
      v26 = result;
      if (result <= 0x7FFFFFFF)
      {
        v27 = *(void (**)(char *, uint64_t))(v7 + 8);
        v27(v10, v6);
        LODWORD(v46) = v26;
        sub_23A233288();
        _os_log_impl(&dword_23A1F0000, v22, v23, "Failed to remove staging directory: %{darwin.errno}d", v24, 8u);
        MEMORY[0x23B845A58](v24, -1, -1);
        v21 = v44;
LABEL_13:

        (*(void (**)(char *, uint64_t))(v43 + 8))(v42, v21);
        sub_23A232E74();
        swift_willThrow();
        v27(v13, v6);
        return MEMORY[0x23B845920](v45[0]);
      }
    }
    __break(1u);
  }
  else
  {
    MEMORY[0x23B845920](v45[0]);
    v28 = v43;
    v29 = v41;
    v30 = v44;
    (*(void (**)(char *, uint64_t, uint64_t))(v43 + 16))(v41, v0, v44);
    v31 = v1;
    v32 = v1;
    v33 = sub_23A232FF4();
    v34 = sub_23A233264();
    if (os_log_type_enabled(v33, v34))
    {
      v35 = (uint8_t *)swift_slowAlloc();
      v36 = swift_slowAlloc();
      v45[0] = v36;
      *(_DWORD *)v35 = 136446210;
      v46 = (uint64_t)v1;
      v37 = v1;
      v38 = sub_23A233144();
      v46 = sub_23A21FD94(v38, v39, v45);
      sub_23A233288();
      swift_bridgeObjectRelease();
      MEMORY[0x23B845920](v1);
      MEMORY[0x23B845920](v1);
      _os_log_impl(&dword_23A1F0000, v33, v34, "Failed to remove staging directory: %{public}s", v35, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B845A58](v36, -1, -1);
      MEMORY[0x23B845A58](v35, -1, -1);

      (*(void (**)(char *, uint64_t))(v43 + 8))(v41, v44);
    }
    else
    {
      MEMORY[0x23B845920](v1);
      MEMORY[0x23B845920](v1);

      (*(void (**)(char *, uint64_t))(v28 + 8))(v29, v30);
    }
    return swift_willThrow();
  }
  return result;
}

uint64_t sub_23A200EC8()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
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
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  _QWORD *v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  int v35;
  uint8_t *v36;
  uint64_t result;
  int v38;
  void (*v39)(char *, uint64_t);
  _QWORD *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  id v45;
  id v46;
  NSObject *v47;
  os_log_type_t v48;
  uint8_t *v49;
  uint64_t v50;
  id v51;
  uint64_t v52;
  unint64_t v53;
  _QWORD v54[5];
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61[3];
  uint64_t v62;
  uint64_t v63;

  v2 = sub_23A23300C();
  v59 = *(_QWORD *)(v2 - 8);
  v60 = v2;
  v3 = MEMORY[0x24BDAC7A8](v2);
  v54[2] = (char *)v54 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v54[4] = (char *)v54 - v6;
  v7 = MEMORY[0x24BDAC7A8](v5);
  v55 = (char *)v54 - v8;
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v54 - v9;
  v58 = sub_23A232E80();
  v56 = *(_QWORD *)(v58 - 8);
  v11 = MEMORY[0x24BDAC7A8](v58);
  v54[1] = (char *)v54 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v54[3] = (char *)v54 - v14;
  v15 = MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)v54 - v16;
  v18 = MEMORY[0x24BDAC7A8](v15);
  v20 = (char *)v54 - v19;
  v21 = MEMORY[0x24BDAC7A8](v18);
  MEMORY[0x24BDAC7A8](v21);
  v23 = (char *)v54 - v22;
  v24 = *(int *)(type metadata accessor for RecordManager() + 20);
  v57 = v0;
  v25 = (_QWORD *)(v0 + v24);
  v26 = __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + v24), *(_QWORD *)(v0 + v24 + 24));
  sub_23A203CD4((uint64_t)v26, (uint64_t)v61);
  __swift_project_boxed_opaque_existential_1(v61, v62);
  if (qword_256951AA8 != -1)
    swift_once();
  v27 = sub_23A2330D8();
  v28 = __swift_project_value_buffer(v27, (uint64_t)qword_256956160);
  sub_23A21D68C(v28);
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v61);
    v61[0] = (uint64_t)v1;
    v29 = v1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256951AE0);
    v30 = v58;
    if ((swift_dynamicCast() & 1) != 0)
    {
      MEMORY[0x23B845920](v1);
      v31 = v56;
      (*(void (**)(char *, char *, uint64_t))(v56 + 32))(v20, v23, v30);
      v33 = v59;
      v32 = v60;
      (*(void (**)(char *, uint64_t, uint64_t))(v59 + 16))(v10, v57, v60);
      (*(void (**)(char *, char *, uint64_t))(v31 + 16))(v17, v20, v30);
      v34 = sub_23A232FF4();
      v35 = sub_23A233264();
      if (!os_log_type_enabled(v34, (os_log_type_t)v35))
      {
        v39 = *(void (**)(char *, uint64_t))(v31 + 8);
        v39(v17, v30);
        goto LABEL_15;
      }
      LODWORD(v57) = v35;
      v36 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v36 = 67109120;
      sub_23A1F58C8((unint64_t *)&qword_256951AD0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCAFE0], MEMORY[0x24BDCAFD8]);
      result = sub_23A232F1C();
      if (result < (uint64_t)0xFFFFFFFF80000000)
      {
        __break(1u);
      }
      else
      {
        v38 = result;
        if (result <= 0x7FFFFFFF)
        {
          v39 = *(void (**)(char *, uint64_t))(v31 + 8);
          v30 = v58;
          v39(v17, v58);
          LODWORD(v63) = v38;
          sub_23A233288();
          _os_log_impl(&dword_23A1F0000, v34, (os_log_type_t)v57, "Failed to update local domain: failed to create user staging directory: %{darwin.errno}d", v36, 8u);
          MEMORY[0x23B845A58](v36, -1, -1);
          v33 = v59;
          v32 = v60;
LABEL_15:

          (*(void (**)(char *, uint64_t))(v33 + 8))(v10, v32);
          sub_23A232E74();
          swift_willThrow();
          v39(v20, v30);
          return MEMORY[0x23B845920](v61[0]);
        }
      }
      __break(1u);
      __break(1u);
      __break(1u);
    }
    else
    {
      MEMORY[0x23B845920](v61[0]);
      v43 = v59;
      v42 = v60;
      v44 = v55;
      (*(void (**)(char *, uint64_t, uint64_t))(v59 + 16))(v55, v57, v60);
      v45 = v1;
      v46 = v1;
      v47 = sub_23A232FF4();
      v48 = sub_23A233264();
      if (os_log_type_enabled(v47, v48))
      {
        v49 = (uint8_t *)swift_slowAlloc();
        v50 = swift_slowAlloc();
        v61[0] = v50;
        *(_DWORD *)v49 = 136446210;
        v63 = (uint64_t)v1;
        v51 = v1;
        v52 = sub_23A233144();
        v63 = sub_23A21FD94(v52, v53, v61);
        sub_23A233288();
        swift_bridgeObjectRelease();
        MEMORY[0x23B845920](v1);
        MEMORY[0x23B845920](v1);
        _os_log_impl(&dword_23A1F0000, v47, v48, "Failed to update local domain: failed to create user staging directory: %{public}s", v49, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x23B845A58](v50, -1, -1);
        MEMORY[0x23B845A58](v49, -1, -1);

        (*(void (**)(char *, uint64_t))(v59 + 8))(v55, v60);
      }
      else
      {
        MEMORY[0x23B845920](v1);
        MEMORY[0x23B845920](v1);

        (*(void (**)(char *, uint64_t))(v43 + 8))(v44, v42);
      }
      return swift_willThrow();
    }
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v61);
    v40 = __swift_project_boxed_opaque_existential_1(v25, v25[3]);
    sub_23A203CD4((uint64_t)v40, (uint64_t)v61);
    __swift_project_boxed_opaque_existential_1(v61, v62);
    if (qword_256951AB0 != -1)
      swift_once();
    v41 = __swift_project_value_buffer(v27, (uint64_t)qword_256956178);
    sub_23A21D68C(v41);
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)v61);
  }
  return result;
}

uint64_t sub_23A201848(unint64_t a1, uint64_t a2, uint64_t *a3, uint64_t *a4, uint64_t *a5, uint64_t *a6, uint8_t *a7)
{
  uint64_t *v7;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t result;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t *v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t *v51;
  char *v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t *v59;
  uint8_t *v60;
  char *v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t *v66;

  v59 = a4;
  v60 = a7;
  v62 = a6;
  v66 = a5;
  v57 = a2;
  v10 = sub_23A23300C();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v50 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_23A2330D8();
  v63 = *(_QWORD *)(v14 - 8);
  v64 = v14;
  v15 = MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v50 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v61 = (char *)&v50 - v18;
  v65 = a3;
  v19 = __swift_instantiateConcreteTypeFromMangledName(a3);
  v20 = MEMORY[0x24BDAC7A8](v19);
  v22 = (char *)&v50 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v20);
  v24 = (char *)&v50 - v23;
  v25 = v58;
  result = sub_23A203640(a1, v57, v59, v66);
  if (v25)
    return result;
  v58 = result;
  v59 = v7;
  v52 = v17;
  v53 = v13;
  v54 = v11;
  v55 = v10;
  v27 = 0;
  v29 = *(_QWORD *)(result + 64);
  result += 64;
  v28 = v29;
  v30 = 1 << *(_BYTE *)(result - 32);
  v31 = -1;
  if (v30 < 64)
    v31 = ~(-1 << v30);
  v32 = v31 & v28;
  v56 = result;
  v57 = (unint64_t)(v30 + 63) >> 6;
  v51 = (uint64_t *)(v57 - 1);
  v34 = v63;
  v33 = v64;
  v35 = v62;
  if ((v31 & v28) == 0)
    goto LABEL_7;
LABEL_5:
  v36 = __clz(__rbit64(v32));
  v32 &= v32 - 1;
  v66 = v27;
  v37 = v36 | ((_QWORD)v27 << 6);
  while (2)
  {
    v38 = v58;
    (*(void (**)(char *, unint64_t, uint64_t))(v34 + 16))(v22, *(_QWORD *)(v58 + 48) + *(_QWORD *)(v34 + 72) * v37, v33);
    v39 = *(_QWORD *)(v38 + 56);
    v40 = __swift_instantiateConcreteTypeFromMangledName(v35);
    *(_QWORD *)&v22[*(int *)(v40 + 48)] = *(_QWORD *)(v39 + 8 * v37);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v40 - 8) + 56))(v22, 0, 1, v40);
    swift_retain();
    v41 = v65;
    while (1)
    {
      sub_23A204EA8((uint64_t)v22, (uint64_t)v24, v41);
      v45 = __swift_instantiateConcreteTypeFromMangledName(v35);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v45 - 8) + 48))(v24, 1, v45) == 1)
        return swift_release();
      v46 = *(int *)(v45 + 48);
      v34 = v63;
      v47 = v64;
      v48 = (uint64_t)v61;
      (*(void (**)(char *, char *, uint64_t))(v63 + 32))(v61, v24, v64);
      sub_23A202A74(*(_QWORD *)&v24[v46], v48, v60);
      swift_release();
      result = (*(uint64_t (**)(uint64_t, uint64_t))(v34 + 8))(v48, v47);
      v33 = v47;
      v27 = v66;
      v35 = v62;
      if (v32)
        goto LABEL_5;
LABEL_7:
      v42 = (uint64_t *)((char *)v27 + 1);
      if (__OFADD__(v27, 1))
      {
        __break(1u);
        goto LABEL_35;
      }
      if ((uint64_t)v42 >= v57)
      {
        v66 = v27;
        v41 = v65;
        goto LABEL_12;
      }
      v43 = *(_QWORD *)(v56 + 8 * (_QWORD)v42);
      v41 = v65;
      if (v43)
        goto LABEL_10;
      v49 = (uint64_t *)((char *)v27 + 2);
      if ((uint64_t)v27 + 2 < v57)
        break;
LABEL_31:
      v66 = v42;
LABEL_12:
      v44 = __swift_instantiateConcreteTypeFromMangledName(v35);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v44 - 8) + 56))(v22, 1, 1, v44);
      v32 = 0;
    }
    v43 = *(_QWORD *)(v56 + 8 * (_QWORD)v49);
    if (v43)
      goto LABEL_18;
    if ((uint64_t)v27 + 3 >= v57)
    {
      v66 = (uint64_t *)((char *)v27 + 2);
      goto LABEL_12;
    }
    v43 = *(_QWORD *)(v56 + 8 * ((_QWORD)v27 + 3));
    if (v43)
    {
      v42 = (uint64_t *)((char *)v27 + 3);
      goto LABEL_10;
    }
    v49 = (uint64_t *)((char *)v27 + 4);
    if ((uint64_t)v27 + 4 >= v57)
    {
      v66 = (uint64_t *)((char *)v27 + 3);
      goto LABEL_12;
    }
    v43 = *(_QWORD *)(v56 + 8 * (_QWORD)v49);
    if (v43)
    {
LABEL_18:
      v42 = v49;
LABEL_10:
      v32 = (v43 - 1) & v43;
      v37 = __clz(__rbit64(v43)) + ((_QWORD)v42 << 6);
      v66 = v42;
      continue;
    }
    break;
  }
  while (1)
  {
    v42 = (uint64_t *)((char *)v49 + 1);
    if (__OFADD__(v49, 1))
      break;
    if ((uint64_t)v42 >= v57)
    {
      v42 = v51;
      goto LABEL_31;
    }
    v43 = *(_QWORD *)(v56 + 8 * (_QWORD)v42);
    v49 = (uint64_t *)((char *)v49 + 1);
    if (v43)
      goto LABEL_10;
  }
LABEL_35:
  __break(1u);
  return result;
}

uint64_t sub_23A201E7C(uint64_t a1, NSObject *a2)
{
  void *v2;
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
  void (**v18)(char *, uint64_t, uint64_t);
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint8_t *v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  id v36;
  NSObject *v37;
  os_log_type_t v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  unint64_t v45;
  id v46;
  uint64_t v47;
  unint64_t v48;
  os_log_t v49;
  uint64_t v50;
  uint8_t *v51;
  uint64_t v52;
  uint64_t v53;
  _QWORD *v54;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  NSObject *v60;
  os_log_type_t v61;
  uint64_t v62;
  uint8_t *v63;
  uint64_t v64;
  unint64_t v65;
  os_log_t v66;
  NSObject *v67;
  uint64_t v68;
  char *v69;
  char *v70;
  char *v71;
  char *v72;
  char *v73;
  char *v74;
  char *v75;
  uint8_t *v76;
  NSObject *v77;
  void (**v78)(char *, uint64_t);
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint8_t *v83;
  os_log_t v84;
  uint64_t v85;
  os_log_t v86;

  v84 = a2;
  v79 = sub_23A232E80();
  v76 = *(uint8_t **)(v79 - 8);
  v3 = MEMORY[0x24BDAC7A8](v79);
  v74 = (char *)&v68 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v77 = ((char *)&v68 - v6);
  MEMORY[0x24BDAC7A8](v5);
  v78 = (void (**)(char *, uint64_t))((char *)&v68 - v7);
  v8 = sub_23A2330D8();
  v9 = *(_QWORD *)(v8 - 8);
  v80 = v8;
  v81 = v9;
  v10 = MEMORY[0x24BDAC7A8](v8);
  v72 = (char *)&v68 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v73 = (char *)&v68 - v13;
  v14 = MEMORY[0x24BDAC7A8](v12);
  v75 = (char *)&v68 - v15;
  MEMORY[0x24BDAC7A8](v14);
  v83 = (uint8_t *)&v68 - v16;
  v17 = sub_23A23300C();
  v18 = *(void (***)(char *, uint64_t, uint64_t))(v17 - 8);
  v19 = MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)&v68 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = MEMORY[0x24BDAC7A8](v19);
  v24 = (char *)&v68 - v23;
  v25 = MEMORY[0x24BDAC7A8](v22);
  v27 = (char *)&v68 - v26;
  MEMORY[0x24BDAC7A8](v25);
  v29 = (char *)&v68 - v28;
  v30 = sub_23A1F900C();
  if (v2)
  {
    v32 = v29;
    v18[2](v29, v82, v17);
    v33 = v80;
    v34 = v81;
    (*(void (**)(uint8_t *, os_log_t, uint64_t))(v81 + 16))(v83, v84, v80);
    v35 = v2;
    v36 = v2;
    v37 = sub_23A232FF4();
    v38 = sub_23A233264();
    v39 = v38;
    if (os_log_type_enabled(v37, v38))
    {
      v40 = swift_slowAlloc();
      v78 = (void (**)(char *, uint64_t))v18;
      v41 = v33;
      v42 = v40;
      v84 = (os_log_t)swift_slowAlloc();
      v86 = v84;
      *(_DWORD *)v42 = 136446466;
      v82 = v17;
      LODWORD(v79) = v39;
      sub_23A1F58C8(&qword_256951AD8, (uint64_t (*)(uint64_t))MEMORY[0x24BEE60D8], MEMORY[0x24BEE60F8]);
      v43 = (unint64_t)v83;
      v44 = sub_23A2334E0();
      v85 = sub_23A21FD94(v44, v45, (uint64_t *)&v86);
      sub_23A233288();
      swift_bridgeObjectRelease();
      (*(void (**)(unint64_t, uint64_t))(v34 + 8))(v43, v41);
      *(_WORD *)(v42 + 12) = 2082;
      v85 = (uint64_t)v2;
      v46 = v2;
      __swift_instantiateConcreteTypeFromMangledName(&qword_256951AE0);
      v47 = sub_23A233144();
      v85 = sub_23A21FD94(v47, v48, (uint64_t *)&v86);
      sub_23A233288();
      swift_bridgeObjectRelease();
      MEMORY[0x23B845920](v2);
      MEMORY[0x23B845920](v2);
      _os_log_impl(&dword_23A1F0000, v37, (os_log_type_t)v79, "Failed to save file %{public}s: failed to serialize data: %{public}s", (uint8_t *)v42, 0x16u);
      v49 = v84;
      swift_arrayDestroy();
      MEMORY[0x23B845A58](v49, -1, -1);
      MEMORY[0x23B845A58](v42, -1, -1);

      v78[1](v32, v82);
    }
    else
    {
      (*(void (**)(uint8_t *, uint64_t))(v34 + 8))(v83, v33);
      MEMORY[0x23B845920](v2);
      MEMORY[0x23B845920](v2);

      ((void (*)(char *, uint64_t))v18[1])(v32, v17);
    }
    return swift_willThrow();
  }
  else
  {
    v50 = v30;
    v51 = v31;
    v69 = v27;
    v70 = v24;
    v71 = v21;
    v52 = type metadata accessor for RecordManager();
    v53 = v82;
    v54 = __swift_project_boxed_opaque_existential_1((_QWORD *)(v82 + *(int *)(v52 + 20)), *(_QWORD *)(v82 + *(int *)(v52 + 20) + 24));
    __swift_project_boxed_opaque_existential_1(v54, v54[3]);
    sub_23A1F5840(v50, (unint64_t)v51);
    sub_23A21E128(v50, v51, (uint64_t)v84);
    v79 = 0;
    sub_23A1F5884(v50, (unint64_t)v51);
    v78 = (void (**)(char *, uint64_t))v18;
    v56 = v69;
    v18[2](v69, v53, v17);
    v58 = v80;
    v57 = v81;
    v59 = v75;
    (*(void (**)(char *, os_log_t, uint64_t))(v81 + 16))(v75, v84, v80);
    v60 = sub_23A232FF4();
    v61 = sub_23A233258();
    if (os_log_type_enabled(v60, v61))
    {
      v84 = v60;
      v62 = swift_slowAlloc();
      v83 = v51;
      v63 = (uint8_t *)v62;
      v77 = swift_slowAlloc();
      v86 = v77;
      v82 = v17;
      *(_DWORD *)v63 = 136446210;
      v76 = v63 + 4;
      sub_23A1F58C8(&qword_256951AD8, (uint64_t (*)(uint64_t))MEMORY[0x24BEE60D8], MEMORY[0x24BEE60F8]);
      v64 = sub_23A2334E0();
      v85 = sub_23A21FD94(v64, v65, (uint64_t *)&v86);
      sub_23A233288();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v57 + 8))(v59, v58);
      v66 = v84;
      _os_log_impl(&dword_23A1F0000, v84, v61, "Saved file %{public}s", v63, 0xCu);
      v67 = v77;
      swift_arrayDestroy();
      MEMORY[0x23B845A58](v67, -1, -1);
      MEMORY[0x23B845A58](v63, -1, -1);
      sub_23A1F5884(v50, (unint64_t)v83);

      return ((uint64_t (*)(char *, uint64_t))v78[1])(v56, v82);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v57 + 8))(v59, v58);
      sub_23A1F5884(v50, (unint64_t)v51);

      return ((uint64_t (*)(char *, uint64_t))v78[1])(v56, v17);
    }
  }
}

uint64_t sub_23A202A74(uint64_t a1, uint64_t a2, uint8_t *a3)
{
  void *v3;
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
  void (**v20)(char *, os_log_t, uint64_t);
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint8_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  id v39;
  NSObject *v40;
  os_log_type_t v41;
  int v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  id v49;
  uint64_t v50;
  unint64_t v51;
  os_log_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  os_log_t v56;
  _QWORD *v57;
  uint8_t *v58;
  uint8_t *v59;
  uint64_t v60;
  uint64_t v62;
  void (*v63)(char *, uint64_t, uint64_t);
  char *v64;
  uint64_t v65;
  NSObject *v66;
  os_log_type_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  unint64_t v73;
  uint64_t v74;
  char *v75;
  char *v76;
  char *v77;
  char *v78;
  char *v79;
  char *v80;
  char *v81;
  uint64_t v82;
  char *v83;
  uint64_t v84;
  void (**v85)(char *, uint64_t);
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  os_log_t v91;
  uint8_t *v92;
  uint64_t v93;
  uint64_t v94;

  v92 = a3;
  v90 = a2;
  v86 = sub_23A232E80();
  v82 = *(_QWORD *)(v86 - 8);
  v4 = MEMORY[0x24BDAC7A8](v86);
  v81 = (char *)&v74 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v83 = (char *)&v74 - v7;
  MEMORY[0x24BDAC7A8](v6);
  v85 = (void (**)(char *, uint64_t))((char *)&v74 - v8);
  v9 = sub_23A2330D8();
  v10 = *(_QWORD *)(v9 - 8);
  v88 = v9;
  v89 = v10;
  v11 = MEMORY[0x24BDAC7A8](v9);
  v79 = (char *)&v74 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v80 = (char *)&v74 - v14;
  v15 = MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v74 - v16;
  MEMORY[0x24BDAC7A8](v15);
  v87 = (uint64_t)&v74 - v18;
  v19 = sub_23A23300C();
  v20 = *(void (***)(char *, os_log_t, uint64_t))(v19 - 8);
  v21 = MEMORY[0x24BDAC7A8](v19);
  v23 = (char *)&v74 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = MEMORY[0x24BDAC7A8](v21);
  v26 = (char *)&v74 - v25;
  v27 = MEMORY[0x24BDAC7A8](v24);
  v29 = (char *)&v74 - v28;
  v30 = MEMORY[0x24BDAC7A8](v27);
  v32 = (char *)&v74 - v31;
  v33 = ((uint64_t (*)(uint64_t))v92)(v30);
  v92 = v34;
  if (v3)
  {
    v20[2](v32, v91, v19);
    v35 = v89;
    v37 = v87;
    v36 = v88;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v89 + 16))(v87, v90, v88);
    v38 = v3;
    v39 = v3;
    v40 = sub_23A232FF4();
    v41 = sub_23A233264();
    v42 = v41;
    if (os_log_type_enabled(v40, v41))
    {
      v43 = swift_slowAlloc();
      LODWORD(v92) = v42;
      v44 = v43;
      v45 = swift_slowAlloc();
      v85 = (void (**)(char *, uint64_t))v20;
      v46 = v45;
      v94 = v45;
      *(_DWORD *)v44 = 136446466;
      v84 = v19;
      sub_23A1F58C8(&qword_256951AD8, (uint64_t (*)(uint64_t))MEMORY[0x24BEE60D8], MEMORY[0x24BEE60F8]);
      v91 = v40;
      v47 = sub_23A2334E0();
      v93 = sub_23A21FD94(v47, v48, &v94);
      sub_23A233288();
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v37, v36);
      *(_WORD *)(v44 + 12) = 2082;
      v93 = (uint64_t)v3;
      v49 = v3;
      __swift_instantiateConcreteTypeFromMangledName(&qword_256951AE0);
      v50 = sub_23A233144();
      v93 = sub_23A21FD94(v50, v51, &v94);
      sub_23A233288();
      swift_bridgeObjectRelease();
      MEMORY[0x23B845920](v3);
      MEMORY[0x23B845920](v3);
      v52 = v91;
      _os_log_impl(&dword_23A1F0000, v91, (os_log_type_t)v92, "Failed to save file %{public}s: failed to serialize data: %{public}s", (uint8_t *)v44, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x23B845A58](v46, -1, -1);
      MEMORY[0x23B845A58](v44, -1, -1);

      v85[1](v32, v84);
    }
    else
    {
      (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v37, v36);
      MEMORY[0x23B845920](v3);
      MEMORY[0x23B845920](v3);

      ((void (*)(char *, uint64_t))v20[1])(v32, v19);
    }
    return swift_willThrow();
  }
  else
  {
    v53 = v33;
    v75 = v17;
    v76 = v23;
    v77 = v26;
    v78 = v29;
    v54 = v89;
    v55 = type metadata accessor for RecordManager();
    v56 = v91;
    v57 = __swift_project_boxed_opaque_existential_1((Class *)((char *)&v91->isa + *(int *)(v55 + 20)), *(uint64_t *)((char *)&v91[3].isa + *(int *)(v55 + 20)));
    __swift_project_boxed_opaque_existential_1(v57, v57[3]);
    v58 = v92;
    sub_23A1F5840(v53, (unint64_t)v92);
    v59 = v58;
    v60 = v90;
    sub_23A21E128(v53, v59, v90);
    v86 = 0;
    sub_23A1F5884(v53, (unint64_t)v92);
    v20[2](v78, v56, v19);
    v62 = v54;
    v63 = *(void (**)(char *, uint64_t, uint64_t))(v54 + 16);
    v64 = v75;
    v65 = v88;
    v63(v75, v60, v88);
    v66 = sub_23A232FF4();
    v67 = sub_23A233258();
    if (os_log_type_enabled(v66, v67))
    {
      v68 = swift_slowAlloc();
      v87 = v53;
      v69 = v68;
      v70 = swift_slowAlloc();
      v85 = (void (**)(char *, uint64_t))v20;
      v71 = v70;
      v94 = v70;
      v84 = v19;
      *(_DWORD *)v69 = 136446210;
      v91 = (os_log_t)(v69 + 4);
      sub_23A1F58C8(&qword_256951AD8, (uint64_t (*)(uint64_t))MEMORY[0x24BEE60D8], MEMORY[0x24BEE60F8]);
      v72 = sub_23A2334E0();
      v93 = sub_23A21FD94(v72, v73, &v94);
      sub_23A233288();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v62 + 8))(v64, v65);
      _os_log_impl(&dword_23A1F0000, v66, v67, "Saved file %{public}s", (uint8_t *)v69, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B845A58](v71, -1, -1);
      MEMORY[0x23B845A58](v69, -1, -1);
      sub_23A1F5884(v87, (unint64_t)v92);

      return ((uint64_t (*)(char *, uint64_t))v85[1])(v78, v84);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v62 + 8))(v64, v65);
      sub_23A1F5884(v53, (unint64_t)v92);

      return ((uint64_t (*)(char *, uint64_t))v20[1])(v78, v19);
    }
  }
}

uint64_t sub_23A203640(unint64_t a1, uint64_t a2, uint64_t *a3, uint64_t *a4)
{
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t isUniquelyReferenced_nonNull_native;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t (*v22)(_QWORD);
  unint64_t v23;
  unint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, uint64_t);
  uint64_t v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  char *v33;
  char v34;
  uint64_t v35;
  _BOOL8 v36;
  uint64_t v37;
  char v38;
  unint64_t v39;
  char v40;
  uint64_t v41;
  BOOL v42;
  uint64_t v43;
  char *v44;
  NSObject *v45;
  uint64_t v46;
  os_log_type_t v47;
  uint64_t v48;
  uint8_t *v49;
  uint64_t v50;
  unint64_t v51;
  void (*v52)(char *, uint64_t);
  void (*v53)(char *, uint64_t, uint64_t);
  uint8_t *v54;
  uint64_t v55;
  char *v56;
  char *v57;
  uint64_t v58;
  uint64_t result;
  char *v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  uint64_t *v66;
  uint8_t *v67;
  unint64_t v68;
  char *v69;
  uint64_t v70;
  char *v71;
  char *v72;
  unint64_t v73;
  uint8_t *v74;
  void (*v75)(char *, uint64_t, uint64_t);
  uint64_t v76;
  uint64_t v77;
  uint64_t v78[5];

  v70 = a2;
  v73 = a1;
  v6 = sub_23A232E80();
  v7 = *(char **)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v60 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_23A23300C();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v71 = (char *)&v60 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  isUniquelyReferenced_nonNull_native = sub_23A2330D8();
  v72 = *(char **)(isUniquelyReferenced_nonNull_native - 8);
  v14 = MEMORY[0x24BDAC7A8](isUniquelyReferenced_nonNull_native);
  v77 = (uint64_t)&v60 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = MEMORY[0x24BDAC7A8](v14);
  v65 = (char *)&v60 - v17;
  v18 = MEMORY[0x24BDAC7A8](v16);
  v69 = (char *)&v60 - v19;
  MEMORY[0x24BDAC7A8](v18);
  v21 = (char *)&v60 - v20;
  v66 = a4;
  v23 = sub_23A1FE230(MEMORY[0x24BEE4AF8], a3, a4, (uint64_t (*)(char *))sub_23A203E14, v22);
  v24 = v73;
  v25 = (_QWORD *)v23;
  if (!(v73 >> 62))
  {
    v26 = *(_QWORD *)((v73 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v26)
      goto LABEL_3;
LABEL_29:
    swift_bridgeObjectRelease();
    return (uint64_t)v25;
  }
LABEL_28:
  swift_bridgeObjectRetain();
  v58 = sub_23A2333D8();
  v24 = v73;
  v26 = v58;
  if (!v58)
    goto LABEL_29;
LABEL_3:
  v62 = v6;
  v63 = v10;
  v60 = v9;
  v61 = v7;
  v67 = (uint8_t *)v26;
  v68 = v24 & 0xC000000000000001;
  v10 = 4;
  v9 = v72;
  while (1)
  {
    if (v68)
    {
      v6 = MEMORY[0x23B84508C](v10 - 4, v24);
    }
    else
    {
      v6 = *(_QWORD *)(v24 + 8 * v10);
      swift_retain();
    }
    v7 = v71;
    if (__OFADD__(v10 - 4, 1))
    {
      __break(1u);
LABEL_26:
      __break(1u);
LABEL_27:
      __break(1u);
      goto LABEL_28;
    }
    v74 = (uint8_t *)(v10 - 3);
    v75 = (void (*)(char *, uint64_t, uint64_t))*((_QWORD *)v9 + 2);
    v75(v69, v70, isUniquelyReferenced_nonNull_native);
    v30 = *(_QWORD *)(v6 + 32);
    v29 = *(_QWORD *)(v6 + 40);
    v76 = v6;
    v78[0] = v30;
    v78[1] = v29;
    swift_bridgeObjectRetain();
    sub_23A233174();
    sub_23A2330CC();
    if (v25[2])
    {
      sub_23A203E14((uint64_t)v21);
      if ((v31 & 1) != 0)
        break;
    }
    v7 = (char *)v11;
    v32 = v77;
    v9 = v21;
    v33 = v21;
    v21 = (char *)isUniquelyReferenced_nonNull_native;
    v75((char *)v77, (uint64_t)v33, isUniquelyReferenced_nonNull_native);
    swift_retain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v78[0] = (uint64_t)v25;
    v6 = (uint64_t)v25;
    v11 = sub_23A203E14(v32);
    v35 = v25[2];
    v36 = (v34 & 1) == 0;
    v37 = v35 + v36;
    if (__OFADD__(v35, v36))
      goto LABEL_26;
    v38 = v34;
    if (v25[3] >= v37)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        sub_23A204EEC(v66);
    }
    else
    {
      sub_23A204530(v37, isUniquelyReferenced_nonNull_native, v66);
      v39 = sub_23A203E14(v77);
      if ((v38 & 1) != (v40 & 1))
      {
        result = sub_23A2337BC();
        __break(1u);
        return result;
      }
      v11 = v39;
    }
    isUniquelyReferenced_nonNull_native = (uint64_t)v21;
    v25 = (_QWORD *)v78[0];
    v21 = v9;
    if ((v38 & 1) != 0)
    {
      v27 = *(_QWORD *)(v78[0] + 56);
      swift_release();
      *(_QWORD *)(v27 + 8 * v11) = v76;
      v9 = v72;
    }
    else
    {
      *(_QWORD *)(v78[0] + 8 * (v11 >> 6) + 64) |= 1 << v11;
      v9 = v72;
      v75((char *)(v25[6] + *((_QWORD *)v72 + 9) * v11), v77, isUniquelyReferenced_nonNull_native);
      v6 = v76;
      *(_QWORD *)(v25[7] + 8 * v11) = v76;
      v41 = v25[2];
      v42 = __OFADD__(v41, 1);
      v43 = v41 + 1;
      if (v42)
        goto LABEL_27;
      v25[2] = v43;
    }
    swift_bridgeObjectRelease();
    v28 = (void (*)(uint64_t, uint64_t))*((_QWORD *)v9 + 1);
    v28(v77, isUniquelyReferenced_nonNull_native);
    v28((uint64_t)v21, isUniquelyReferenced_nonNull_native);
    swift_release();
    ++v10;
    v24 = v73;
    v11 = (unint64_t)v7;
    if (v74 == v67)
      goto LABEL_29;
  }
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v7, v64, v63);
  v44 = v65;
  v75(v65, (uint64_t)v21, isUniquelyReferenced_nonNull_native);
  v45 = sub_23A232FF4();
  v46 = v11;
  v47 = sub_23A233264();
  if (os_log_type_enabled(v45, v47))
  {
    v77 = v46;
    v48 = isUniquelyReferenced_nonNull_native;
    v49 = (uint8_t *)swift_slowAlloc();
    v75 = (void (*)(char *, uint64_t, uint64_t))swift_slowAlloc();
    v78[0] = (uint64_t)v75;
    *(_DWORD *)v49 = 136315138;
    v74 = v49 + 4;
    sub_23A1F58C8(&qword_256951AD8, (uint64_t (*)(uint64_t))MEMORY[0x24BEE60D8], MEMORY[0x24BEE60F8]);
    v50 = sub_23A2334E0();
    v78[4] = sub_23A21FD94(v50, v51, v78);
    sub_23A233288();
    swift_bridgeObjectRelease();
    v52 = (void (*)(char *, uint64_t))*((_QWORD *)v72 + 1);
    v52(v44, v48);
    _os_log_impl(&dword_23A1F0000, v45, v47, "Failed to save files: multiple files collided at %s", v49, 0xCu);
    v53 = v75;
    swift_arrayDestroy();
    MEMORY[0x23B845A58](v53, -1, -1);
    v54 = v49;
    isUniquelyReferenced_nonNull_native = v48;
    MEMORY[0x23B845A58](v54, -1, -1);

    (*(void (**)(char *, uint64_t))(v77 + 8))(v71, v63);
  }
  else
  {
    v52 = (void (*)(char *, uint64_t))*((_QWORD *)v9 + 1);
    v52(v44, isUniquelyReferenced_nonNull_native);

    (*(void (**)(char *, uint64_t))(v46 + 8))(v71, v63);
  }
  v56 = v61;
  v55 = v62;
  LODWORD(v78[0]) = 17;
  sub_23A21ECDC(MEMORY[0x24BEE4AF8]);
  sub_23A1F58C8((unint64_t *)&qword_256951AD0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCAFE0], MEMORY[0x24BDCAFD8]);
  v57 = v60;
  sub_23A232F28();
  sub_23A232E74();
  (*((void (**)(char *, uint64_t))v56 + 1))(v57, v55);
  swift_willThrow();
  v52(v21, isUniquelyReferenced_nonNull_native);
  swift_bridgeObjectRelease();
  swift_release();
  return (uint64_t)v25;
}

uint64_t sub_23A203CD4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_23A203D18(uint64_t a1)
{
  uint64_t (*v2)(uint64_t);
  uint64_t v3;

  sub_23A232FE8();
  v2 = (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58];
  sub_23A1F58C8((unint64_t *)&qword_256951B90, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  v3 = sub_23A2330F0();
  return sub_23A2049A8(a1, v3, v2, &qword_256951FE0, MEMORY[0x24BDCEA98]);
}

unint64_t sub_23A203DB0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_23A2337F8();
  sub_23A233168();
  v4 = sub_23A23381C();
  return sub_23A2048C8(a1, a2, v4);
}

unint64_t sub_23A203E14(uint64_t a1)
{
  uint64_t (*v2)(uint64_t);
  uint64_t v3;

  sub_23A2330D8();
  v2 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE60D8];
  sub_23A1F58C8(&qword_256951F98, (uint64_t (*)(uint64_t))MEMORY[0x24BEE60D8], MEMORY[0x24BEE60E8]);
  v3 = sub_23A2330F0();
  return sub_23A2049A8(a1, v3, v2, &qword_256951FA0, MEMORY[0x24BEE60F0]);
}

uint64_t sub_23A203EAC(uint64_t a1, int a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t result;
  int64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  _QWORD *v23;
  unint64_t v24;
  int64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  char v32;
  unint64_t v33;
  BOOL v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  int64_t v39;
  _QWORD *v40;
  uint64_t i;
  int v42;

  v3 = v2;
  v5 = sub_23A232FE8();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256951FD8);
  v42 = a2;
  v10 = sub_23A2333F0();
  v11 = v10;
  if (!*(_QWORD *)(v9 + 16))
    goto LABEL_39;
  v12 = 1 << *(_BYTE *)(v9 + 32);
  v13 = *(_QWORD *)(v9 + 64);
  v40 = (_QWORD *)(v9 + 64);
  if (v12 < 64)
    v14 = ~(-1 << v12);
  else
    v14 = -1;
  v15 = v14 & v13;
  v38 = v2;
  v39 = (unint64_t)(v12 + 63) >> 6;
  v16 = v10 + 64;
  result = swift_retain();
  v18 = 0;
  for (i = v9; ; v9 = i)
  {
    if (v15)
    {
      v20 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      v21 = v20 | (v18 << 6);
      goto LABEL_20;
    }
    if (__OFADD__(v18++, 1))
      goto LABEL_41;
    if (v18 >= v39)
      break;
    v23 = v40;
    v24 = v40[v18];
    if (!v24)
    {
      v25 = v18 + 1;
      if (v18 + 1 >= v39)
      {
LABEL_32:
        swift_release();
        v3 = v38;
        if ((v42 & 1) == 0)
          goto LABEL_39;
        goto LABEL_35;
      }
      v24 = v40[v25];
      if (!v24)
      {
        while (1)
        {
          v18 = v25 + 1;
          if (__OFADD__(v25, 1))
            break;
          if (v18 >= v39)
            goto LABEL_32;
          v24 = v40[v18];
          ++v25;
          if (v24)
            goto LABEL_19;
        }
LABEL_40:
        __break(1u);
LABEL_41:
        __break(1u);
        return result;
      }
      ++v18;
    }
LABEL_19:
    v15 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v18 << 6);
LABEL_20:
    v26 = *(_QWORD *)(v6 + 72);
    v27 = *(_QWORD *)(v9 + 48) + v26 * v21;
    if ((v42 & 1) != 0)
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v6 + 32))(v8, v27, v5);
      v28 = *(_QWORD *)(*(_QWORD *)(v9 + 56) + 8 * v21);
    }
    else
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v6 + 16))(v8, v27, v5);
      v28 = *(_QWORD *)(*(_QWORD *)(v9 + 56) + 8 * v21);
      swift_retain();
    }
    sub_23A1F58C8((unint64_t *)&qword_256951B90, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
    result = sub_23A2330F0();
    v29 = -1 << *(_BYTE *)(v11 + 32);
    v30 = result & ~v29;
    v31 = v30 >> 6;
    if (((-1 << v30) & ~*(_QWORD *)(v16 + 8 * (v30 >> 6))) != 0)
    {
      v19 = __clz(__rbit64((-1 << v30) & ~*(_QWORD *)(v16 + 8 * (v30 >> 6)))) | v30 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v32 = 0;
      v33 = (unint64_t)(63 - v29) >> 6;
      do
      {
        if (++v31 == v33 && (v32 & 1) != 0)
        {
          __break(1u);
          goto LABEL_40;
        }
        v34 = v31 == v33;
        if (v31 == v33)
          v31 = 0;
        v32 |= v34;
        v35 = *(_QWORD *)(v16 + 8 * v31);
      }
      while (v35 == -1);
      v19 = __clz(__rbit64(~v35)) + (v31 << 6);
    }
    *(_QWORD *)(v16 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v6 + 32))(*(_QWORD *)(v11 + 48) + v26 * v19, v8, v5);
    *(_QWORD *)(*(_QWORD *)(v11 + 56) + 8 * v19) = v28;
    ++*(_QWORD *)(v11 + 16);
  }
  swift_release();
  v3 = v38;
  v23 = v40;
  if ((v42 & 1) == 0)
    goto LABEL_39;
LABEL_35:
  v36 = 1 << *(_BYTE *)(v9 + 32);
  if (v36 >= 64)
    bzero(v23, ((unint64_t)(v36 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v36;
  *(_QWORD *)(v9 + 16) = 0;
LABEL_39:
  result = swift_release();
  *v3 = v11;
  return result;
}

uint64_t sub_23A204228(uint64_t a1, char a2)
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
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  _QWORD *v22;
  unint64_t v23;
  int64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  int64_t v35;
  uint64_t v36;
  char v37;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256951FD0);
  v37 = a2;
  v6 = sub_23A2333F0();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v36 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v34 = v2;
  v35 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v35)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v36 + 8 * v21);
    ++v13;
    if (!v23)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v35)
        goto LABEL_33;
      v23 = *(_QWORD *)(v36 + 8 * v13);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v35)
        {
LABEL_33:
          swift_release();
          v3 = v34;
          if ((v37 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v23 = *(_QWORD *)(v36 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v13 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_42;
            if (v13 >= v35)
              goto LABEL_33;
            v23 = *(_QWORD *)(v36 + 8 * v13);
            ++v24;
            if (v23)
              goto LABEL_30;
          }
        }
        v13 = v24;
      }
    }
LABEL_30:
    v10 = (v23 - 1) & v23;
    v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    v29 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v20);
    v31 = *v29;
    v30 = v29[1];
    v32 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v20);
    if ((v37 & 1) == 0)
      swift_bridgeObjectRetain();
    sub_23A2337F8();
    sub_23A233168();
    result = sub_23A23381C();
    v14 = -1 << *(_BYTE *)(v7 + 32);
    v15 = result & ~v14;
    v16 = v15 >> 6;
    if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v27 = v16 == v26;
        if (v16 == v26)
          v16 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    v18 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v17);
    *v18 = v31;
    v18[1] = v30;
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v17) = v32;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v34;
  v22 = (_QWORD *)(v5 + 64);
  if ((v37 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v33 = 1 << *(_BYTE *)(v5 + 32);
  if (v33 >= 64)
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v22 = -1 << v33;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_23A204530(uint64_t a1, int a2, uint64_t *a3)
{
  uint64_t *v3;
  uint64_t *v5;
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
  unint64_t v17;
  uint64_t v18;
  uint64_t result;
  int64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  int64_t v24;
  _QWORD *v25;
  unint64_t v26;
  int64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  char v34;
  unint64_t v35;
  BOOL v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  int64_t v41;
  _QWORD *v42;
  uint64_t i;
  int v44;

  v5 = v3;
  v7 = sub_23A2330D8();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *v3;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  v44 = a2;
  v12 = sub_23A2333F0();
  v13 = v12;
  if (!*(_QWORD *)(v11 + 16))
    goto LABEL_41;
  v14 = 1 << *(_BYTE *)(v11 + 32);
  v15 = *(_QWORD *)(v11 + 64);
  v42 = (_QWORD *)(v11 + 64);
  if (v14 < 64)
    v16 = ~(-1 << v14);
  else
    v16 = -1;
  v17 = v16 & v15;
  v40 = v3;
  v41 = (unint64_t)(v14 + 63) >> 6;
  v18 = v12 + 64;
  result = swift_retain();
  v20 = 0;
  for (i = v11; ; v11 = i)
  {
    if (v17)
    {
      v22 = __clz(__rbit64(v17));
      v17 &= v17 - 1;
      v23 = v22 | (v20 << 6);
      goto LABEL_22;
    }
    v24 = v20 + 1;
    if (__OFADD__(v20, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v24 >= v41)
      break;
    v25 = v42;
    v26 = v42[v24];
    ++v20;
    if (!v26)
    {
      v20 = v24 + 1;
      if (v24 + 1 >= v41)
        goto LABEL_34;
      v26 = v42[v20];
      if (!v26)
      {
        v27 = v24 + 2;
        if (v27 >= v41)
        {
LABEL_34:
          swift_release();
          v5 = v40;
          if ((v44 & 1) == 0)
            goto LABEL_41;
          goto LABEL_37;
        }
        v26 = v42[v27];
        if (!v26)
        {
          while (1)
          {
            v20 = v27 + 1;
            if (__OFADD__(v27, 1))
              goto LABEL_43;
            if (v20 >= v41)
              goto LABEL_34;
            v26 = v42[v20];
            ++v27;
            if (v26)
              goto LABEL_21;
          }
        }
        v20 = v27;
      }
    }
LABEL_21:
    v17 = (v26 - 1) & v26;
    v23 = __clz(__rbit64(v26)) + (v20 << 6);
LABEL_22:
    v28 = *(_QWORD *)(v8 + 72);
    v29 = *(_QWORD *)(v11 + 48) + v28 * v23;
    if ((v44 & 1) != 0)
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v8 + 32))(v10, v29, v7);
      v30 = *(_QWORD *)(*(_QWORD *)(v11 + 56) + 8 * v23);
    }
    else
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v8 + 16))(v10, v29, v7);
      v30 = *(_QWORD *)(*(_QWORD *)(v11 + 56) + 8 * v23);
      swift_retain();
    }
    sub_23A1F58C8(&qword_256951F98, (uint64_t (*)(uint64_t))MEMORY[0x24BEE60D8], MEMORY[0x24BEE60E8]);
    result = sub_23A2330F0();
    v31 = -1 << *(_BYTE *)(v13 + 32);
    v32 = result & ~v31;
    v33 = v32 >> 6;
    if (((-1 << v32) & ~*(_QWORD *)(v18 + 8 * (v32 >> 6))) != 0)
    {
      v21 = __clz(__rbit64((-1 << v32) & ~*(_QWORD *)(v18 + 8 * (v32 >> 6)))) | v32 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v34 = 0;
      v35 = (unint64_t)(63 - v31) >> 6;
      do
      {
        if (++v33 == v35 && (v34 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        v36 = v33 == v35;
        if (v33 == v35)
          v33 = 0;
        v34 |= v36;
        v37 = *(_QWORD *)(v18 + 8 * v33);
      }
      while (v37 == -1);
      v21 = __clz(__rbit64(~v37)) + (v33 << 6);
    }
    *(_QWORD *)(v18 + ((v21 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v21;
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v8 + 32))(*(_QWORD *)(v13 + 48) + v28 * v21, v10, v7);
    *(_QWORD *)(*(_QWORD *)(v13 + 56) + 8 * v21) = v30;
    ++*(_QWORD *)(v13 + 16);
  }
  swift_release();
  v5 = v40;
  v25 = v42;
  if ((v44 & 1) == 0)
    goto LABEL_41;
LABEL_37:
  v38 = 1 << *(_BYTE *)(v11 + 32);
  if (v38 >= 64)
    bzero(v25, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v25 = -1 << v38;
  *(_QWORD *)(v11 + 16) = 0;
LABEL_41:
  result = swift_release();
  *v5 = v13;
  return result;
}

unint64_t sub_23A2048C8(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_23A233660() & 1) == 0)
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
      while (!v14 && (sub_23A233660() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_23A2049A8(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t), unint64_t *a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(char *, unint64_t, uint64_t);
  char v17;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  unint64_t *v21;
  uint64_t v22;

  v21 = a4;
  v22 = a5;
  v6 = v5;
  v19 = a1;
  v20 = a3;
  v8 = a3(0);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v19 - v10;
  v12 = -1 << *(_BYTE *)(v6 + 32);
  v13 = a2 & ~v12;
  if (((*(_QWORD *)(v6 + 64 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8)) >> v13) & 1) != 0)
  {
    v14 = ~v12;
    v15 = *(_QWORD *)(v9 + 72);
    v16 = *(void (**)(char *, unint64_t, uint64_t))(v9 + 16);
    do
    {
      v16(v11, *(_QWORD *)(v6 + 48) + v15 * v13, v8);
      sub_23A1F58C8(v21, v20, v22);
      v17 = sub_23A233114();
      (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
      if ((v17 & 1) != 0)
        break;
      v13 = (v13 + 1) & v14;
    }
    while (((*(_QWORD *)(v6 + 64 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8)) >> v13) & 1) != 0);
  }
  return v13;
}

void *sub_23A204AD8()
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
  unint64_t v10;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v22;
  int64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  int64_t v27;

  v1 = v0;
  v2 = sub_23A232FE8();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256951FD8);
  v6 = *v0;
  v7 = sub_23A2333E4();
  v8 = v7;
  if (!*(_QWORD *)(v6 + 16))
  {
    result = (void *)swift_release();
LABEL_26:
    *v1 = v8;
    return result;
  }
  v25 = v1;
  result = (void *)(v7 + 64);
  v10 = (unint64_t)((1 << *(_BYTE *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v6 + 64 + 8 * v10)
    result = memmove(result, (const void *)(v6 + 64), 8 * v10);
  v26 = v6 + 64;
  v12 = 0;
  *(_QWORD *)(v8 + 16) = *(_QWORD *)(v6 + 16);
  v13 = 1 << *(_BYTE *)(v6 + 32);
  v14 = -1;
  if (v13 < 64)
    v14 = ~(-1 << v13);
  v15 = v14 & *(_QWORD *)(v6 + 64);
  v27 = (unint64_t)(v13 + 63) >> 6;
  while (1)
  {
    if (v15)
    {
      v16 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      v17 = v16 | (v12 << 6);
      goto LABEL_12;
    }
    if (__OFADD__(v12++, 1))
      goto LABEL_28;
    if (v12 >= v27)
    {
LABEL_24:
      result = (void *)swift_release();
      v1 = v25;
      goto LABEL_26;
    }
    v22 = *(_QWORD *)(v26 + 8 * v12);
    if (!v22)
      break;
LABEL_23:
    v15 = (v22 - 1) & v22;
    v17 = __clz(__rbit64(v22)) + (v12 << 6);
LABEL_12:
    v18 = *(_QWORD *)(v3 + 72) * v17;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(_QWORD *)(v6 + 48) + v18, v2);
    v19 = 8 * v17;
    v20 = *(_QWORD *)(*(_QWORD *)(v6 + 56) + 8 * v17);
    (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(_QWORD *)(v8 + 48) + v18, v5, v2);
    *(_QWORD *)(*(_QWORD *)(v8 + 56) + v19) = v20;
    result = (void *)swift_retain();
  }
  v23 = v12 + 1;
  if (v12 + 1 >= v27)
    goto LABEL_24;
  v22 = *(_QWORD *)(v26 + 8 * v23);
  if (v22)
  {
    ++v12;
    goto LABEL_23;
  }
  while (1)
  {
    v12 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v12 >= v27)
      goto LABEL_24;
    v22 = *(_QWORD *)(v26 + 8 * v12);
    ++v23;
    if (v22)
      goto LABEL_23;
  }
  __break(1u);
LABEL_28:
  __break(1u);
  return result;
}

void *sub_23A204CFC()
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
  uint64_t v21;
  _QWORD *v22;
  int64_t v23;
  unint64_t v24;
  int64_t v25;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256951FD0);
  v2 = *v0;
  v3 = sub_23A2333E4();
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
    v23 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v13)
      goto LABEL_26;
    v24 = *(_QWORD *)(v6 + 8 * v23);
    ++v9;
    if (!v24)
    {
      v9 = v23 + 1;
      if (v23 + 1 >= v13)
        goto LABEL_26;
      v24 = *(_QWORD *)(v6 + 8 * v9);
      if (!v24)
        break;
    }
LABEL_25:
    v12 = (v24 - 1) & v24;
    v15 = __clz(__rbit64(v24)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v19 = *v17;
    v18 = v17[1];
    v20 = 8 * v15;
    v21 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v20);
    v22 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v22 = v19;
    v22[1] = v18;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v20) = v21;
    result = (void *)swift_bridgeObjectRetain();
  }
  v25 = v23 + 2;
  if (v25 >= v13)
    goto LABEL_26;
  v24 = *(_QWORD *)(v6 + 8 * v25);
  if (v24)
  {
    v9 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v25 + 1;
    if (__OFADD__(v25, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v24 = *(_QWORD *)(v6 + 8 * v9);
    ++v25;
    if (v24)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_23A204EA8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

void *sub_23A204EEC(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *result;
  unint64_t v11;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  int64_t v28;

  v3 = sub_23A2330D8();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(a1);
  v26 = v1;
  v7 = *v1;
  v8 = sub_23A2333E4();
  v9 = v8;
  if (!*(_QWORD *)(v7 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v26 = v9;
    return result;
  }
  result = (void *)(v8 + 64);
  v11 = (unint64_t)((1 << *(_BYTE *)(v9 + 32)) + 63) >> 6;
  if (v9 != v7 || (unint64_t)result >= v7 + 64 + 8 * v11)
    result = memmove(result, (const void *)(v7 + 64), 8 * v11);
  v27 = v7 + 64;
  v13 = 0;
  *(_QWORD *)(v9 + 16) = *(_QWORD *)(v7 + 16);
  v14 = 1 << *(_BYTE *)(v7 + 32);
  v15 = -1;
  if (v14 < 64)
    v15 = ~(-1 << v14);
  v16 = v15 & *(_QWORD *)(v7 + 64);
  v28 = (unint64_t)(v14 + 63) >> 6;
  while (1)
  {
    if (v16)
    {
      v17 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      v18 = v17 | (v13 << 6);
      goto LABEL_12;
    }
    v22 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v28)
      goto LABEL_26;
    v23 = *(_QWORD *)(v27 + 8 * v22);
    ++v13;
    if (!v23)
    {
      v13 = v22 + 1;
      if (v22 + 1 >= v28)
        goto LABEL_26;
      v23 = *(_QWORD *)(v27 + 8 * v13);
      if (!v23)
        break;
    }
LABEL_25:
    v16 = (v23 - 1) & v23;
    v18 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_12:
    v19 = *(_QWORD *)(v4 + 72) * v18;
    (*(void (**)(char *, unint64_t, uint64_t))(v4 + 16))(v6, *(_QWORD *)(v7 + 48) + v19, v3);
    v20 = 8 * v18;
    v21 = *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v18);
    (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))(*(_QWORD *)(v9 + 48) + v19, v6, v3);
    *(_QWORD *)(*(_QWORD *)(v9 + 56) + v20) = v21;
    result = (void *)swift_retain();
  }
  v24 = v22 + 2;
  if (v24 >= v28)
    goto LABEL_26;
  v23 = *(_QWORD *)(v27 + 8 * v24);
  if (v23)
  {
    v13 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    v13 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v13 >= v28)
      goto LABEL_26;
    v23 = *(_QWORD *)(v27 + 8 * v13);
    ++v24;
    if (v23)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

_QWORD *sub_23A20511C(_QWORD *a1)
{
  return sub_23A2067C8(0, a1[2], 0, a1);
}

uint64_t sub_23A205130(unint64_t a1)
{
  return sub_23A2068D4(0, *(_QWORD *)(a1 + 16), 0, a1);
}

void sub_23A205148(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_23A2333D8();
    swift_bridgeObjectRelease();
  }
  JUMPOUT(0x23B845098);
}

uint64_t sub_23A2051B0(uint64_t a1, int64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  int64_t v5;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  _QWORD *isUniquelyReferenced_nonNull_native;
  int64_t v11;
  uint64_t result;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;

  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_22;
  }
  v4 = *(_QWORD **)v2;
  v5 = *(_QWORD *)(*(_QWORD *)v2 + 16);
  if (v5 < a2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v7 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v8 = a1 - a2;
  if (__OFSUB__(0, v7))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  v9 = v5 - v7;
  if (__OFADD__(v5, v8))
  {
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  isUniquelyReferenced_nonNull_native = (_QWORD *)swift_isUniquelyReferenced_nonNull_native();
  if (!(_DWORD)isUniquelyReferenced_nonNull_native || v9 > v4[3] >> 1)
  {
    if (v5 <= v9)
      v11 = v5 + v8;
    else
      v11 = v5;
    v4 = sub_23A2067C8(isUniquelyReferenced_nonNull_native, v11, 1, v4);
  }
  result = swift_arrayDestroy();
  if (!v7)
    goto LABEL_20;
  v13 = v4[2];
  v14 = __OFSUB__(v13, a2);
  v15 = v13 - a2;
  if (v14)
    goto LABEL_26;
  if ((v15 & 0x8000000000000000) == 0)
  {
    v16 = (char *)&v4[2 * a2 + 4];
    if (a1 != a2 || &v4[2 * a1 + 4] >= (_QWORD *)&v16[16 * v15])
      result = (uint64_t)memmove(&v4[2 * a1 + 4], v16, 16 * v15);
    v17 = v4[2];
    v14 = __OFADD__(v17, v8);
    v18 = v17 - v7;
    if (!v14)
    {
      v4[2] = v18;
LABEL_20:
      *(_QWORD *)v2 = v4;
      return result;
    }
    goto LABEL_27;
  }
LABEL_28:
  result = sub_23A233408();
  __break(1u);
  return result;
}

uint64_t sub_23A205318(uint64_t a1, uint64_t a2, void (*a3)(_QWORD))
{
  uint64_t v3;
  unint64_t *v4;
  uint64_t v5;
  void (*v6)(_QWORD);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t result;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    v6 = a3;
    v3 = a2;
    v5 = a1;
    if (!(*v4 >> 62))
    {
      if (*(_QWORD *)((*v4 & 0xFFFFFFFFFFFFF8) + 0x10) >= a2)
        goto LABEL_4;
LABEL_31:
      __break(1u);
      goto LABEL_32;
    }
  }
  swift_bridgeObjectRetain();
  v23 = sub_23A2333D8();
  swift_bridgeObjectRelease();
  if (v23 < v3)
    goto LABEL_31;
LABEL_4:
  v8 = v3 - v5;
  if (__OFSUB__(v3, v5))
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  v7 = v5 - v3;
  if (__OFSUB__(0, v8))
  {
LABEL_33:
    __break(1u);
LABEL_34:
    swift_bridgeObjectRetain();
    v9 = sub_23A2333D8();
    swift_bridgeObjectRelease();
    v10 = v9 + v7;
    if (!__OFADD__(v9, v7))
      goto LABEL_8;
LABEL_36:
    __break(1u);
LABEL_37:
    swift_bridgeObjectRetain();
    v14 = sub_23A2333D8();
    swift_bridgeObjectRelease();
    v11 = *v4;
    goto LABEL_15;
  }
  if (*v4 >> 62)
    goto LABEL_34;
  v9 = *(_QWORD *)((*v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  v10 = v9 - v8;
  if (__OFADD__(v9, v7))
    goto LABEL_36;
LABEL_8:
  v11 = *v4;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *v4 = v11;
  v9 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject
    && (v11 & 0x8000000000000000) == 0
    && (v11 & 0x4000000000000000) == 0)
  {
    v13 = v11 & 0xFFFFFFFFFFFFFF8;
    if (v10 <= *(_QWORD *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      goto LABEL_18;
    v9 = 1;
  }
  if (v11 >> 62)
    goto LABEL_37;
  v14 = *(_QWORD *)((v11 & 0xFFFFFFFFFFFFF8) + 0x10);
LABEL_15:
  if (v14 <= v10)
    v14 = v10;
  swift_bridgeObjectRetain();
  *v4 = MEMORY[0x23B845098](v9, v14, 1, v11);
  swift_bridgeObjectRelease();
  v13 = *v4 & 0xFFFFFFFFFFFFFF8;
LABEL_18:
  v15 = v13 + 32;
  v16 = (char *)(v13 + 32 + 8 * v5);
  v6(0);
  swift_arrayDestroy();
  if (!v7)
    return sub_23A2331C8();
  if (!(*v4 >> 62))
  {
    v17 = *(_QWORD *)((*v4 & 0xFFFFFFFFFFFFF8) + 0x10);
    v18 = v17 - v3;
    if (!__OFSUB__(v17, v3))
      goto LABEL_21;
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  swift_bridgeObjectRetain();
  v24 = sub_23A2333D8();
  swift_bridgeObjectRelease();
  v18 = v24 - v3;
  if (__OFSUB__(v24, v3))
    goto LABEL_40;
LABEL_21:
  if ((v18 & 0x8000000000000000) == 0)
  {
    v19 = (char *)(v15 + 8 * v3);
    if (v5 != v3 || v16 >= &v19[8 * v18])
      memmove(v16, v19, 8 * v18);
    if (!(*v4 >> 62))
    {
      v20 = *(_QWORD *)((*v4 & 0xFFFFFFFFFFFFF8) + 0x10);
      v21 = v20 + v7;
      if (!__OFADD__(v20, v7))
      {
LABEL_27:
        *(_QWORD *)((*v4 & 0xFFFFFFFFFFFFF8) + 0x10) = v21;
        return sub_23A2331C8();
      }
      goto LABEL_43;
    }
LABEL_41:
    swift_bridgeObjectRetain();
    v25 = sub_23A2333D8();
    swift_bridgeObjectRelease();
    v21 = v25 + v7;
    if (!__OFADD__(v25, v7))
      goto LABEL_27;
LABEL_43:
    __break(1u);
  }
  result = sub_23A233408();
  __break(1u);
  return result;
}

uint64_t sub_23A205614(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_23A205658(uint64_t a1)
{
  return sub_23A205770(a1, qword_256956058);
}

uint64_t sub_23A205674()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v7;

  v0 = sub_23A2330D8();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = MEMORY[0x24BDAC7A8](v0);
  v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_allocate_value_buffer(v2, qword_256956070);
  __swift_project_value_buffer(v0, (uint64_t)qword_256956070);
  if (qword_256951A50 != -1)
    swift_once();
  v5 = __swift_project_value_buffer(v0, (uint64_t)qword_256956058);
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v4, v5, v0);
  return sub_23A2330CC();
}

uint64_t sub_23A205754(uint64_t a1)
{
  return sub_23A205770(a1, qword_256956088);
}

uint64_t sub_23A205770(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_23A2330D8();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_23A2330B4();
}

uint64_t sub_23A2057CC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v7;

  v0 = sub_23A2330D8();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = MEMORY[0x24BDAC7A8](v0);
  v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_allocate_value_buffer(v2, qword_2569560A0);
  __swift_project_value_buffer(v0, (uint64_t)qword_2569560A0);
  if (qword_256951A60 != -1)
    swift_once();
  v5 = __swift_project_value_buffer(v0, (uint64_t)qword_256956088);
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v4, v5, v0);
  return sub_23A2330CC();
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

uint64_t sub_23A2058EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v7;

  v0 = sub_23A2330D8();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = MEMORY[0x24BDAC7A8](v0);
  v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_allocate_value_buffer(v2, qword_2569560B8);
  __swift_project_value_buffer(v0, (uint64_t)qword_2569560B8);
  if (qword_256951A60 != -1)
    swift_once();
  v5 = __swift_project_value_buffer(v0, (uint64_t)qword_256956088);
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v4, v5, v0);
  return sub_23A2330CC();
}

uint64_t sub_23A2059DC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v7;

  v0 = sub_23A2330D8();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = MEMORY[0x24BDAC7A8](v0);
  v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_allocate_value_buffer(v2, qword_2569560D0);
  __swift_project_value_buffer(v0, (uint64_t)qword_2569560D0);
  if (qword_256951A50 != -1)
    swift_once();
  v5 = __swift_project_value_buffer(v0, (uint64_t)qword_256956058);
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v4, v5, v0);
  return sub_23A2330CC();
}

uint64_t sub_23A205AC4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v7;

  v0 = sub_23A2330D8();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = MEMORY[0x24BDAC7A8](v0);
  v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_allocate_value_buffer(v2, qword_2569560E8);
  __swift_project_value_buffer(v0, (uint64_t)qword_2569560E8);
  if (qword_256951A70 != -1)
    swift_once();
  v5 = __swift_project_value_buffer(v0, (uint64_t)qword_2569560B8);
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v4, v5, v0);
  return sub_23A2330CC();
}

uint64_t sub_23A205BAC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v7;

  v0 = sub_23A2330D8();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = MEMORY[0x24BDAC7A8](v0);
  v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_allocate_value_buffer(v2, qword_256956100);
  __swift_project_value_buffer(v0, (uint64_t)qword_256956100);
  if (qword_256951A58 != -1)
    swift_once();
  v5 = __swift_project_value_buffer(v0, (uint64_t)qword_256956070);
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v4, v5, v0);
  return sub_23A2330CC();
}

uint64_t sub_23A205C8C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v7;

  v0 = sub_23A2330D8();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = MEMORY[0x24BDAC7A8](v0);
  v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_allocate_value_buffer(v2, qword_256956118);
  __swift_project_value_buffer(v0, (uint64_t)qword_256956118);
  if (qword_256951A58 != -1)
    swift_once();
  v5 = __swift_project_value_buffer(v0, (uint64_t)qword_256956070);
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v4, v5, v0);
  return sub_23A2330CC();
}

uint64_t sub_23A205D6C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v7;

  v0 = sub_23A2330D8();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = MEMORY[0x24BDAC7A8](v0);
  v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_allocate_value_buffer(v2, qword_256956130);
  __swift_project_value_buffer(v0, (uint64_t)qword_256956130);
  if (qword_256951A68 != -1)
    swift_once();
  v5 = __swift_project_value_buffer(v0, (uint64_t)qword_2569560A0);
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v4, v5, v0);
  return sub_23A2330CC();
}

uint64_t sub_23A205E4C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v7;

  v0 = sub_23A2330D8();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = MEMORY[0x24BDAC7A8](v0);
  v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_allocate_value_buffer(v2, qword_256956148);
  __swift_project_value_buffer(v0, (uint64_t)qword_256956148);
  if (qword_256951A68 != -1)
    swift_once();
  v5 = __swift_project_value_buffer(v0, (uint64_t)qword_2569560A0);
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v4, v5, v0);
  return sub_23A2330CC();
}

uint64_t sub_23A205F2C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v7;

  v0 = sub_23A2330D8();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = MEMORY[0x24BDAC7A8](v0);
  v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_allocate_value_buffer(v2, qword_256956160);
  __swift_project_value_buffer(v0, (uint64_t)qword_256956160);
  if (qword_256951A70 != -1)
    swift_once();
  v5 = __swift_project_value_buffer(v0, (uint64_t)qword_2569560B8);
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v4, v5, v0);
  return sub_23A2330CC();
}

uint64_t sub_23A20600C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v7;

  v0 = sub_23A2330D8();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = MEMORY[0x24BDAC7A8](v0);
  v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_allocate_value_buffer(v2, qword_256956178);
  __swift_project_value_buffer(v0, (uint64_t)qword_256956178);
  if (qword_256951A70 != -1)
    swift_once();
  v5 = __swift_project_value_buffer(v0, (uint64_t)qword_2569560B8);
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v4, v5, v0);
  return sub_23A2330CC();
}

uint64_t sub_23A2060EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  char v5;
  uint64_t v7;

  v0 = sub_23A2330D8();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_256951A78 != -1)
    swift_once();
  v4 = __swift_project_value_buffer(v0, (uint64_t)qword_2569560D0);
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v4, v0);
  v5 = sub_23A1F4BDC((uint64_t)v3);
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return v5 & 1;
}

uint64_t sub_23A2063A8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  int v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t result;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE v19[12];
  int v20;
  size_t v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v2 = sub_23A232E80();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = &v19[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569535C0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = &v19[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v21[0] = 37;
  v9 = sub_23A2331EC();
  *(_QWORD *)(v9 + 16) = 37;
  *(_OWORD *)(v9 + 48) = 0u;
  *(_QWORD *)(v9 + 61) = 0;
  *(_OWORD *)(v9 + 32) = 0u;
  if (sysctlbyname("kern.bootsessionuuid", (void *)(v9 + 32), v21, 0, 0))
  {
    v10 = MEMORY[0x23B844E10]();
    v11 = sub_23A232FF4();
    v12 = sub_23A233264();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v13 = 67109120;
      v20 = v10;
      sub_23A233288();
      _os_log_impl(&dword_23A1F0000, v11, v12, "sysctlbyname(\"kern.bootsessionuuid\") failed: %{darwin.errno}d", v13, 8u);
      MEMORY[0x23B845A58](v13, -1, -1);
    }

    result = sub_23A233084();
    if ((result & 0x100000000) == 0)
    {
      v15 = result;
      swift_bridgeObjectRelease();
      v20 = v15;
      sub_23A21ECDC(MEMORY[0x24BEE4AF8]);
      sub_23A206780();
      sub_23A232F28();
      sub_23A232E74();
      (*(void (**)(_BYTE *, uint64_t))(v3 + 8))(v5, v2);
      return swift_willThrow();
    }
    __break(1u);
  }
  else
  {
    v16 = swift_bridgeObjectRetain();
    sub_23A206BF8(v16);
    swift_bridgeObjectRelease();
    sub_23A232FA0();
    swift_bridgeObjectRelease();
    v17 = sub_23A232FE8();
    v18 = *(_QWORD *)(v17 - 8);
    result = (*(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v18 + 48))(v8, 1, v17);
    if ((_DWORD)result != 1)
    {
      swift_bridgeObjectRelease();
      return (*(uint64_t (**)(uint64_t, _BYTE *, uint64_t))(v18 + 32))(a1, v8, v17);
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_23A206680()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC23DarwinDirectoryInternal14SysctlProvider_logger;
  v2 = sub_23A23300C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t sub_23A2066D0()
{
  return type metadata accessor for SysctlProvider();
}

uint64_t type metadata accessor for SysctlProvider()
{
  uint64_t result;

  result = qword_256952018;
  if (!qword_256952018)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23A206714()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23A23300C();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

unint64_t sub_23A206780()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256951AD0;
  if (!qword_256951AD0)
  {
    v1 = sub_23A232E80();
    result = MEMORY[0x23B8459BC](MEMORY[0x24BDCAFD8], v1);
    atomic_store(result, (unint64_t *)&qword_256951AD0);
  }
  return result;
}

_QWORD *sub_23A2067C8(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2569520A8);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 17;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      v13 = v10 + 4;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v13 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4])
          memmove(v13, a4 + 4, 16 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_23A206B08(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_23A2068D4(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_23A2068FC(a1, a2, a3, a4, &qword_2569520B8, type metadata accessor for User);
}

uint64_t sub_23A2068E8(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_23A2068FC(a1, a2, a3, a4, &qword_2569520B0, (uint64_t (*)(_QWORD))MEMORY[0x24BDCEA58]);
}

uint64_t sub_23A2068FC(char a1, int64_t a2, char a3, unint64_t a4, uint64_t *a5, uint64_t (*a6)(_QWORD))
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
    result = sub_23A2333C0();
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
    sub_23A206C44(0, v11, v21, a4, a6);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v16;
}

uint64_t sub_23A206B08(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      return v6;
    }
  }
  result = sub_23A233408();
  __break(1u);
  return result;
}

uint64_t sub_23A206BF8(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(_QWORD *)(result + 16);
  if (v1)
  {
    v2 = result;
    v3 = *(unsigned __int8 *)(result + 32);
    result += 32;
    if (!v3)
      return sub_23A23315C();
    v4 = 0;
    v5 = v1 - 1;
    v6 = v2 + 33;
    while (v5 != v4)
    {
      if (!*(unsigned __int8 *)(v6 + v4++))
        return sub_23A23315C();
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_23A206C44(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD))
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
  result = sub_23A233408();
  __break(1u);
  return result;
}

uint64_t sub_23A206D5C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void (*v3)(uint64_t, uint64_t);

  swift_bridgeObjectRelease();
  v1 = v0 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_uuid;
  v2 = sub_23A232FE8();
  v3 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8);
  v3(v1, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3(v0 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_primaryGroupUUID, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_23A206E24()
{
  sub_23A206D5C();
  return swift_deallocClassInstance();
}

uint64_t sub_23A206E48()
{
  return type metadata accessor for UserRecord(0);
}

uint64_t type metadata accessor for UserRecord(uint64_t a1)
{
  return sub_23A1FC53C(a1, qword_2569520E8);
}

uint64_t sub_23A206E64()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23A232FE8();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_23A206F00()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v1 = v0 + OBJC_IVAR____TtC23DarwinDirectoryInternal11GroupRecord_uuid;
  v2 = sub_23A232FE8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_23A206F80()
{
  return type metadata accessor for GroupRecord(0);
}

uint64_t type metadata accessor for GroupRecord(uint64_t a1)
{
  return sub_23A1FC53C(a1, qword_256952298);
}

uint64_t sub_23A206F9C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23A232FE8();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_23A207034(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  void (*v15)(char *, uint64_t, uint64_t);
  uint64_t v16;
  uint64_t v17;
  uint64_t result;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, char *, uint64_t);
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  _QWORD *v26;
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
  int v37;

  v3 = sub_23A232FE8();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v28 - v8;
  v10 = sub_23A232E80();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(_QWORD *)(a1 + 16) != 3)
  {
    v37 = 22;
    sub_23A21ECDC(MEMORY[0x24BEE4AF8]);
    sub_23A206780();
    sub_23A232F28();
    sub_23A232E74();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    swift_willThrow();
    return a1;
  }
  v35 = v1;
  v36 = *(_DWORD *)(a1 + 24);
  v14 = *(_QWORD *)(a1 + 40);
  v32 = *(_QWORD *)(a1 + 32);
  v15 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
  v15(v9, a1 + OBJC_IVAR____TtC23DarwinDirectoryInternal14UserRecordFile_uuid, v3);
  v16 = *(_QWORD *)(a1 + OBJC_IVAR____TtC23DarwinDirectoryInternal14UserRecordFile_fullName + 8);
  v31 = *(_QWORD *)(a1 + OBJC_IVAR____TtC23DarwinDirectoryInternal14UserRecordFile_fullName);
  v34 = v16;
  v17 = *(_QWORD *)(a1 + OBJC_IVAR____TtC23DarwinDirectoryInternal14UserRecordFile_homeDirectory + 8);
  v30 = *(_QWORD *)(a1 + OBJC_IVAR____TtC23DarwinDirectoryInternal14UserRecordFile_homeDirectory);
  v33 = v17;
  result = ((uint64_t (*)(char *, uint64_t, uint64_t))v15)(v7, a1 + OBJC_IVAR____TtC23DarwinDirectoryInternal14UserRecordFile_primaryGroupUUID, v3);
  v19 = *(_QWORD *)(a1 + OBJC_IVAR____TtC23DarwinDirectoryInternal14UserRecordFile_aliases);
  if (v19)
  {
    v29 = *(_QWORD *)(a1 + OBJC_IVAR____TtC23DarwinDirectoryInternal14UserRecordFile_memberships);
    v20 = *(_QWORD *)(a1 + OBJC_IVAR____TtC23DarwinDirectoryInternal14UserRecordFile_shell + 8);
    v28 = *(_QWORD *)(a1 + OBJC_IVAR____TtC23DarwinDirectoryInternal14UserRecordFile_shell);
    type metadata accessor for UserRecord(0);
    a1 = swift_allocObject();
    *(_DWORD *)(a1 + 16) = v36;
    *(_QWORD *)(a1 + 24) = v32;
    *(_QWORD *)(a1 + 32) = v14;
    v21 = *(void (**)(uint64_t, char *, uint64_t))(v4 + 32);
    v21(a1 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_uuid, v9, v3);
    v22 = (_QWORD *)(a1 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_fullName);
    v23 = v33;
    v24 = v34;
    *v22 = v31;
    v22[1] = v24;
    v25 = (_QWORD *)(a1 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_homeDirectory);
    *v25 = v30;
    v25[1] = v23;
    v21(a1 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_primaryGroupUUID, v7, v3);
    v26 = (_QWORD *)(a1 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_shell);
    v27 = v29;
    *v26 = v28;
    v26[1] = v20;
    *(_QWORD *)(a1 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_memberships) = v27;
    *(_QWORD *)(a1 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_aliases) = v19;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return a1;
  }
  __break(1u);
  return result;
}

uint64_t sub_23A207330(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, char *, uint64_t);
  _QWORD *v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;

  v2 = sub_23A232FE8();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v24 - v7;
  v30 = *(_DWORD *)(a1 + 16);
  v9 = *(_QWORD *)(a1 + 32);
  v29 = *(_QWORD *)(a1 + 24);
  v10 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  v10((char *)&v24 - v7, a1 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_uuid, v2);
  v11 = *(_QWORD *)(a1 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_fullName);
  v27 = *(_QWORD *)(a1 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_fullName + 8);
  v28 = v11;
  v12 = *(_QWORD *)(a1 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_homeDirectory + 8);
  v26 = *(_QWORD *)(a1 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_homeDirectory);
  v10(v6, a1 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_primaryGroupUUID, v2);
  v13 = *(_QWORD *)(a1 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_shell + 8);
  v25 = *(_QWORD *)(a1 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_shell);
  v14 = (uint64_t *)(a1 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_memberships);
  swift_beginAccess();
  v15 = *v14;
  v16 = *(_QWORD *)(a1 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_aliases);
  type metadata accessor for UserRecord(0);
  v17 = swift_allocObject();
  *(_DWORD *)(v17 + 16) = v30;
  *(_QWORD *)(v17 + 24) = v29;
  *(_QWORD *)(v17 + 32) = v9;
  v18 = *(void (**)(uint64_t, char *, uint64_t))(v3 + 32);
  v18(v17 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_uuid, v8, v2);
  v19 = (_QWORD *)(v17 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_fullName);
  v20 = v27;
  *v19 = v28;
  v19[1] = v20;
  v21 = (_QWORD *)(v17 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_homeDirectory);
  *v21 = v26;
  v21[1] = v12;
  v18(v17 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_primaryGroupUUID, v6, v2);
  v22 = (_QWORD *)(v17 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_shell);
  *v22 = v25;
  v22[1] = v13;
  *(_QWORD *)(v17 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_memberships) = v15;
  *(_QWORD *)(v17 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_aliases) = v16;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return v17;
}

unint64_t sub_23A20755C(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t result;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  void (*v22)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(char *, char *, uint64_t);
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  _QWORD *v36;
  uint64_t v37;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  __int128 v43;
  char *v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  _QWORD *v49;
  unint64_t v50;
  char *v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  void (*v55)(char *, uint64_t, uint64_t);
  char *v56;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569535C0);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v41 - v8;
  v10 = sub_23A232FE8();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v53 = (char *)&v41 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v45 = (char *)&v41 - v15;
  result = MEMORY[0x24BDAC7A8](v14);
  v56 = (char *)&v41 - v17;
  v49 = a1;
  v18 = *a1;
  if (v18 >> 62)
    goto LABEL_36;
  v19 = *(_QWORD *)((v18 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (v19)
  {
    result = 0;
    v20 = *(_QWORD *)(a2 + 16);
    v43 = xmmword_23A2349C0;
    v42 = 0x800000023A237610;
    v47 = v20;
    v48 = a2;
    v44 = v7;
    v46 = v19;
    v51 = v9;
    v52 = v11;
    v21 = v53;
    while (result != v19)
    {
      v23 = *v49;
      v24 = (*v49 & 0xC000000000000001) == 0;
      v50 = result;
      if (v24)
      {
        if (result >= *(_QWORD *)((v23 & 0xFFFFFFFFFFFFF8) + 0x10))
          goto LABEL_33;
        v40 = *(_QWORD *)(v23 + 8 * result + 32);
        swift_retain();
      }
      else
      {
        v40 = MEMORY[0x23B84508C]();
      }
      v25 = v40 + OBJC_IVAR____TtCV23DarwinDirectoryInternal11RecordStore15UserStoreRecord_uuid;
      swift_beginAccess();
      v55 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
      v55(v56, v25, v10);
      swift_release();
      if (v20)
      {
        v26 = a2 + ((*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80));
        swift_bridgeObjectRetain();
        v54 = *(_QWORD *)(v11 + 72);
        v27 = v20;
        while (1)
        {
          v55(v9, v26, v10);
          v22 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56);
          v22(v9, 0, 1, v10);
          v7 = *(char **)(v11 + 48);
          if (((unsigned int (*)(char *, uint64_t, uint64_t))v7)(v9, 1, v10) == 1)
            break;
          v28 = *(void (**)(char *, char *, uint64_t))(v11 + 32);
          v29 = v10;
          v30 = v11;
          v28(v21, v9, v29);
          sub_23A1F58C8(&qword_256951FE0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA98]);
          v11 = sub_23A233114();
          v9 = *(char **)(v30 + 8);
          v10 = v29;
          ((void (*)(char *, uint64_t))v9)(v21, v29);
          if ((v11 & 1) != 0)
          {
            a2 = v48;
            swift_bridgeObjectRelease();
            ((void (*)(char *, uint64_t))v9)(v56, v29);
            v31 = *v49;
            if ((*v49 & 0xC000000000000001) != 0)
            {
              v33 = MEMORY[0x23B84508C](v50);
              v32 = v44;
            }
            else
            {
              v32 = v44;
              if (v50 >= *(_QWORD *)((v31 & 0xFFFFFFFFFFFFF8) + 0x10))
                goto LABEL_34;
              v33 = *(_QWORD *)(v31 + 8 * v50 + 32);
              swift_retain();
            }
            v34 = *(_DWORD *)(v33 + 16);
            __swift_instantiateConcreteTypeFromMangledName(&qword_2569523D8);
            v35 = swift_allocObject();
            *(_OWORD *)(v35 + 16) = v43;
            *(_QWORD *)(v35 + 56) = MEMORY[0x24BEE0D00];
            *(_QWORD *)(v35 + 64) = sub_23A211B90();
            *(_QWORD *)(v35 + 32) = 0xD00000000000001CLL;
            *(_QWORD *)(v35 + 40) = v42;
            *(_QWORD *)(v35 + 96) = MEMORY[0x24BEE44F0];
            *(_QWORD *)(v35 + 104) = MEMORY[0x24BEE4558];
            *(_DWORD *)(v35 + 72) = v34;
            sub_23A233138();
            sub_23A232FA0();
            swift_bridgeObjectRelease();
            result = ((uint64_t (*)(char *, uint64_t, uint64_t))v7)(v32, 1, v10);
            if ((_DWORD)result == 1)
              goto LABEL_38;
            v28(v45, v32, v10);
            swift_release();
            v36 = v49;
            v37 = *v49;
            isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
            *v36 = v37;
            v9 = v51;
            if (!isUniquelyReferenced_nonNull_bridgeObject || v37 < 0 || (v37 & 0x4000000000000000) != 0)
              sub_23A205144(v37);
            v11 = v52;
            v20 = v47;
            if (v50 < *(_QWORD *)((v37 & 0xFFFFFFFFFFFFFF8) + 0x10))
            {
              v39 = *(_QWORD *)((v37 & 0xFFFFFFFFFFFFFF8) + 8 * v50 + 0x20)
                  + OBJC_IVAR____TtCV23DarwinDirectoryInternal11RecordStore15UserStoreRecord_uuid;
              swift_beginAccess();
              (*(void (**)(uint64_t, char *, uint64_t))(v11 + 40))(v39, v45, v10);
              swift_endAccess();
              sub_23A2331C8();
              goto LABEL_8;
            }
            goto LABEL_35;
          }
          v26 += v54;
          --v27;
          v9 = v51;
          v11 = v52;
          if (!v27)
            goto LABEL_6;
        }
      }
      else
      {
        swift_bridgeObjectRetain();
        v22 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56);
LABEL_6:
        v22(v9, 1, 1, v10);
      }
      a2 = v48;
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v11 + 8))(v56, v10);
      v20 = v47;
LABEL_8:
      result = v50 + 1;
      v19 = v46;
      if (v50 + 1 == v46)
        return result;
    }
    __break(1u);
LABEL_33:
    __break(1u);
LABEL_34:
    __break(1u);
LABEL_35:
    __break(1u);
LABEL_36:
    swift_bridgeObjectRetain();
    v19 = sub_23A2333D8();
    result = swift_bridgeObjectRelease();
    if (v19 < 0)
    {
      __break(1u);
LABEL_38:
      __break(1u);
      return result;
    }
  }
  return result;
}

unint64_t sub_23A207AC0(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t result;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  void (*v22)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(char *, char *, uint64_t);
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  _QWORD *v36;
  uint64_t v37;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  __int128 v43;
  char *v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  _QWORD *v49;
  unint64_t v50;
  char *v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  void (*v55)(char *, uint64_t, uint64_t);
  char *v56;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569535C0);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v41 - v8;
  v10 = sub_23A232FE8();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v53 = (char *)&v41 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v45 = (char *)&v41 - v15;
  result = MEMORY[0x24BDAC7A8](v14);
  v56 = (char *)&v41 - v17;
  v49 = a1;
  v18 = *a1;
  if (v18 >> 62)
    goto LABEL_36;
  v19 = *(_QWORD *)((v18 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (v19)
  {
    result = 0;
    v20 = *(_QWORD *)(a2 + 16);
    v43 = xmmword_23A2349C0;
    v42 = 0x800000023A2375F0;
    v47 = v20;
    v48 = a2;
    v44 = v7;
    v46 = v19;
    v51 = v9;
    v52 = v11;
    v21 = v53;
    while (result != v19)
    {
      v23 = *v49;
      v24 = (*v49 & 0xC000000000000001) == 0;
      v50 = result;
      if (v24)
      {
        if (result >= *(_QWORD *)((v23 & 0xFFFFFFFFFFFFF8) + 0x10))
          goto LABEL_33;
        v40 = *(_QWORD *)(v23 + 8 * result + 32);
        swift_retain();
      }
      else
      {
        v40 = MEMORY[0x23B84508C]();
      }
      v25 = v40 + OBJC_IVAR____TtCV23DarwinDirectoryInternal11RecordStore16GroupStoreRecord_uuid;
      swift_beginAccess();
      v55 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
      v55(v56, v25, v10);
      swift_release();
      if (v20)
      {
        v26 = a2 + ((*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80));
        swift_bridgeObjectRetain();
        v54 = *(_QWORD *)(v11 + 72);
        v27 = v20;
        while (1)
        {
          v55(v9, v26, v10);
          v22 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56);
          v22(v9, 0, 1, v10);
          v7 = *(char **)(v11 + 48);
          if (((unsigned int (*)(char *, uint64_t, uint64_t))v7)(v9, 1, v10) == 1)
            break;
          v28 = *(void (**)(char *, char *, uint64_t))(v11 + 32);
          v29 = v10;
          v30 = v11;
          v28(v21, v9, v29);
          sub_23A1F58C8(&qword_256951FE0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA98]);
          v11 = sub_23A233114();
          v9 = *(char **)(v30 + 8);
          v10 = v29;
          ((void (*)(char *, uint64_t))v9)(v21, v29);
          if ((v11 & 1) != 0)
          {
            a2 = v48;
            swift_bridgeObjectRelease();
            ((void (*)(char *, uint64_t))v9)(v56, v29);
            v31 = *v49;
            if ((*v49 & 0xC000000000000001) != 0)
            {
              v33 = MEMORY[0x23B84508C](v50);
              v32 = v44;
            }
            else
            {
              v32 = v44;
              if (v50 >= *(_QWORD *)((v31 & 0xFFFFFFFFFFFFF8) + 0x10))
                goto LABEL_34;
              v33 = *(_QWORD *)(v31 + 8 * v50 + 32);
              swift_retain();
            }
            v34 = *(_DWORD *)(v33 + 16);
            __swift_instantiateConcreteTypeFromMangledName(&qword_2569523D8);
            v35 = swift_allocObject();
            *(_OWORD *)(v35 + 16) = v43;
            *(_QWORD *)(v35 + 56) = MEMORY[0x24BEE0D00];
            *(_QWORD *)(v35 + 64) = sub_23A211B90();
            *(_QWORD *)(v35 + 32) = 0xD00000000000001CLL;
            *(_QWORD *)(v35 + 40) = v42;
            *(_QWORD *)(v35 + 96) = MEMORY[0x24BEE44F0];
            *(_QWORD *)(v35 + 104) = MEMORY[0x24BEE4558];
            *(_DWORD *)(v35 + 72) = v34;
            sub_23A233138();
            sub_23A232FA0();
            swift_bridgeObjectRelease();
            result = ((uint64_t (*)(char *, uint64_t, uint64_t))v7)(v32, 1, v10);
            if ((_DWORD)result == 1)
              goto LABEL_38;
            v28(v45, v32, v10);
            swift_release();
            v36 = v49;
            v37 = *v49;
            isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
            *v36 = v37;
            v9 = v51;
            if (!isUniquelyReferenced_nonNull_bridgeObject || v37 < 0 || (v37 & 0x4000000000000000) != 0)
              sub_23A205144(v37);
            v11 = v52;
            v20 = v47;
            if (v50 < *(_QWORD *)((v37 & 0xFFFFFFFFFFFFFF8) + 0x10))
            {
              v39 = *(_QWORD *)((v37 & 0xFFFFFFFFFFFFFF8) + 8 * v50 + 0x20)
                  + OBJC_IVAR____TtCV23DarwinDirectoryInternal11RecordStore16GroupStoreRecord_uuid;
              swift_beginAccess();
              (*(void (**)(uint64_t, char *, uint64_t))(v11 + 40))(v39, v45, v10);
              swift_endAccess();
              sub_23A2331C8();
              goto LABEL_8;
            }
            goto LABEL_35;
          }
          v26 += v54;
          --v27;
          v9 = v51;
          v11 = v52;
          if (!v27)
            goto LABEL_6;
        }
      }
      else
      {
        swift_bridgeObjectRetain();
        v22 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56);
LABEL_6:
        v22(v9, 1, 1, v10);
      }
      a2 = v48;
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v11 + 8))(v56, v10);
      v20 = v47;
LABEL_8:
      result = v50 + 1;
      v19 = v46;
      if (v50 + 1 == v46)
        return result;
    }
    __break(1u);
LABEL_33:
    __break(1u);
LABEL_34:
    __break(1u);
LABEL_35:
    __break(1u);
LABEL_36:
    swift_bridgeObjectRetain();
    v19 = sub_23A2333D8();
    result = swift_bridgeObjectRelease();
    if (v19 < 0)
    {
      __break(1u);
LABEL_38:
      __break(1u);
      return result;
    }
  }
  return result;
}

uint64_t sub_23A208024@<X0>(unint64_t a1@<X0>, void (*a2)(char *, uint64_t, void *)@<X1>, unint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X4>, int a6@<W5>, uint64_t a7@<X6>, uint64_t a8@<X7>, unint64_t *a9@<X8>)
{
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
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
  void *v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  id v31;
  NSObject *v32;
  os_log_type_t v33;
  uint8_t *v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t result;
  uint64_t v44;
  void *v45;
  unint64_t *v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  char *v50;
  unint64_t *v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  unint64_t v57;
  _QWORD *v58;
  char *v59;
  unint64_t v60;
  unint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  uint64_t v68;
  unint64_t v69;
  unint64_t v70;
  unint64_t *v71;
  unint64_t *v72;
  uint64_t v73;
  char *v74;
  char *v75;
  char *v76;
  char *v77;
  unint64_t v78;
  char *v79;
  uint64_t v80;
  uint64_t v81;
  int v82;
  uint64_t v83;
  void (*v84)(char *, uint64_t, void *);
  uint64_t v85;
  unint64_t *v86;
  unint64_t v87;
  void *v88;
  uint64_t v89;
  uint64_t v90;

  v87 = a4;
  v83 = a8;
  v84 = a2;
  v85 = a7;
  v86 = a9;
  v82 = a6;
  v81 = a5;
  v11 = type metadata accessor for RecordStore(0);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v73 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_23A232FE8();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v73 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = MEMORY[0x24BDAC7A8](v16);
  v21 = (char *)&v73 - v20;
  v22 = MEMORY[0x24BDAC7A8](v19);
  v24 = (char *)&v73 - v23;
  MEMORY[0x24BDAC7A8](v22);
  v26 = (char *)&v73 - v25;
  v27 = v88;
  v28 = sub_23A20A338(a1, a3, (void (*)(uint64_t, uint64_t *))sub_23A20B124);
  if (!v27)
  {
    v39 = v28;
    v76 = v26;
    v77 = v13;
    v40 = v85;
    v74 = v18;
    v75 = v24;
    v79 = v21;
    v80 = v15;
    v78 = a3;
    v88 = (void *)v14;
    v41 = sub_23A20A338((unint64_t)v84, v87, (void (*)(uint64_t, uint64_t *))sub_23A20ADD4);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v42 = sub_23A21134C(v39);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_23A20A52C(v42, v41);
    v44 = (uint64_t)v76;
    v45 = v88;
    v84 = *(void (**)(char *, uint64_t, void *))(v80 + 16);
    v84(v76, v81, v88);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v46 = v86;
    sub_23A209278(v42, v41, v44, v86);
    v47 = (uint64_t)v77;
    sub_23A1F8E44((uint64_t)v46, (uint64_t)v77, type metadata accessor for RecordStore);
    sub_23A20C978((uint64_t *)v46 + 3, v42);
    sub_23A1F8F44(v47, type metadata accessor for RecordStore);
    sub_23A1F8E44((uint64_t)v46, v47, type metadata accessor for RecordStore);
    sub_23A20CC38((uint64_t *)v46 + 6, v41);
    sub_23A1F8F44(v47, type metadata accessor for RecordStore);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v48 = v78;
    result = sub_23A2114D4(v78, v87, v40);
    if ((v82 & 1) == 0)
      return result;
    if (v48 >> 62)
    {
      swift_bridgeObjectRetain();
      v49 = sub_23A2333D8();
      swift_bridgeObjectRelease();
    }
    else
    {
      v49 = *(_QWORD *)((v48 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    v50 = v79;
    v51 = v86;
    v52 = MEMORY[0x24BEE4AF8];
    if (v49)
    {
      v90 = MEMORY[0x24BEE4AF8];
      result = sub_23A20D4D0(0, v49 & ~(v49 >> 63), 0);
      if (v49 < 0)
      {
        __break(1u);
        goto LABEL_41;
      }
      v52 = v90;
      v53 = v75;
      if ((v48 & 0xC000000000000001) != 0)
      {
        v54 = 0;
        do
        {
          v55 = MEMORY[0x23B84508C](v54, v48);
          v84(v53, v55 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_uuid, v45);
          swift_unknownObjectRelease();
          v90 = v52;
          v57 = *(_QWORD *)(v52 + 16);
          v56 = *(_QWORD *)(v52 + 24);
          if (v57 >= v56 >> 1)
          {
            sub_23A20D4D0(v56 > 1, v57 + 1, 1);
            v52 = v90;
          }
          ++v54;
          *(_QWORD *)(v52 + 16) = v57 + 1;
          (*(void (**)(unint64_t, char *, void *))(v80 + 32))(v52+ ((*(unsigned __int8 *)(v80 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v80 + 80))+ *(_QWORD *)(v80 + 72) * v57, v53, v45);
          v48 = v78;
        }
        while (v49 != v54);
      }
      else
      {
        v58 = (_QWORD *)(v48 + 32);
        v59 = v74;
        do
        {
          v84(v59, *v58 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_uuid, v45);
          v90 = v52;
          v61 = *(_QWORD *)(v52 + 16);
          v60 = *(_QWORD *)(v52 + 24);
          if (v61 >= v60 >> 1)
          {
            sub_23A20D4D0(v60 > 1, v61 + 1, 1);
            v52 = v90;
          }
          *(_QWORD *)(v52 + 16) = v61 + 1;
          (*(void (**)(unint64_t, char *, void *))(v80 + 32))(v52+ ((*(unsigned __int8 *)(v80 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v80 + 80))+ *(_QWORD *)(v80 + 72) * v61, v59, v45);
          ++v58;
          --v49;
        }
        while (v49);
      }
      v51 = v86;
      v50 = v79;
    }
    v62 = v80;
    if (v87 >> 62)
    {
      v72 = v51;
      swift_bridgeObjectRetain();
      v63 = sub_23A2333D8();
      swift_bridgeObjectRelease();
      v51 = v72;
    }
    else
    {
      v63 = *(_QWORD *)((v87 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    v64 = MEMORY[0x24BEE4AF8];
    if (!v63)
    {
LABEL_37:
      v71 = v51;
      sub_23A20755C(v51, v52);
      sub_23A207AC0(v71 + 1, v64);
      sub_23A1FB4C8();
      swift_bridgeObjectRelease();
      return swift_bridgeObjectRelease();
    }
    v90 = MEMORY[0x24BEE4AF8];
    v85 = v63;
    result = sub_23A20D4D0(0, v63 & ~(v63 >> 63), 0);
    v65 = v85;
    if ((v85 & 0x8000000000000000) == 0)
    {
      v66 = 0;
      v64 = v90;
      v67 = v87 & 0xC000000000000001;
      do
      {
        if (v67)
        {
          v68 = MEMORY[0x23B84508C](v66, v87);
          v84(v50, v68 + OBJC_IVAR____TtC23DarwinDirectoryInternal11GroupRecord_uuid, v88);
          v65 = v85;
          swift_unknownObjectRelease();
        }
        else
        {
          v84(v50, *(_QWORD *)(v87 + 8 * v66 + 32) + OBJC_IVAR____TtC23DarwinDirectoryInternal11GroupRecord_uuid, v88);
        }
        v90 = v64;
        v70 = *(_QWORD *)(v64 + 16);
        v69 = *(_QWORD *)(v64 + 24);
        if (v70 >= v69 >> 1)
        {
          sub_23A20D4D0(v69 > 1, v70 + 1, 1);
          v65 = v85;
          v64 = v90;
        }
        ++v66;
        *(_QWORD *)(v64 + 16) = v70 + 1;
        v50 = v79;
        (*(void (**)(unint64_t, char *, void *))(v62 + 32))(v64+ ((*(unsigned __int8 *)(v62 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v62 + 80))+ *(_QWORD *)(v62 + 72) * v70, v79, v88);
        v51 = v86;
      }
      while (v65 != v66);
      goto LABEL_37;
    }
LABEL_41:
    __break(1u);
    return result;
  }
  if (qword_256951AB8 != -1)
    swift_once();
  v29 = sub_23A23300C();
  __swift_project_value_buffer(v29, (uint64_t)qword_2569523C0);
  v30 = v27;
  v31 = v27;
  v32 = sub_23A232FF4();
  v33 = sub_23A233264();
  if (os_log_type_enabled(v32, v33))
  {
    v34 = (uint8_t *)swift_slowAlloc();
    v35 = swift_slowAlloc();
    v90 = v35;
    *(_DWORD *)v34 = 136446210;
    v89 = (uint64_t)v27;
    v36 = v27;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256951AE0);
    v37 = sub_23A233144();
    v89 = sub_23A21FD94(v37, v38, &v90);
    sub_23A233288();
    swift_bridgeObjectRelease();
    MEMORY[0x23B845920](v27);
    MEMORY[0x23B845920](v27);
    _os_log_impl(&dword_23A1F0000, v32, v33, "Failed to build record store: failed to merge system and local users: %{public}s", v34, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B845A58](v35, -1, -1);
    MEMORY[0x23B845A58](v34, -1, -1);
  }
  else
  {
    MEMORY[0x23B845920](v27);
    MEMORY[0x23B845920](v27);
  }

  return swift_willThrow();
}

uint64_t sub_23A208A6C()
{
  uint64_t v0;

  v0 = sub_23A23300C();
  __swift_allocate_value_buffer(v0, qword_2569523C0);
  __swift_project_value_buffer(v0, (uint64_t)qword_2569523C0);
  return sub_23A233000();
}

void sub_23A208AEC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(_QWORD);
  char *v7;
  _QWORD v8[4];
  uint64_t v9;

  v9 = sub_23A232FE8();
  v1 = MEMORY[0x24BDAC7A8](v9);
  v2 = MEMORY[0x24BDAC7A8](v1);
  MEMORY[0x24BDAC7A8](v2);
  v8[3] = (char *)v8 - v3;
  v4 = type metadata accessor for RecordStoreBuilderError();
  MEMORY[0x24BDAC7A8](v4);
  sub_23A1F8E44(v0, (uint64_t)v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  v7 = (char *)sub_23A208BF8 + 4 * word_23A2349E0[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_23A208BF8()
{
  int *v0;
  uint64_t v1;
  int v2;

  v2 = *v0;
  *(_QWORD *)(v1 - 96) = 0;
  *(_QWORD *)(v1 - 88) = 0xE000000000000000;
  sub_23A233300();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 - 96) = 0xD00000000000001ALL;
  *(_QWORD *)(v1 - 88) = 0x800000023A2377A0;
  *(_DWORD *)(v1 - 104) = v2;
  sub_23A2334E0();
  sub_23A233174();
  swift_bridgeObjectRelease();
  return *(_QWORD *)(v1 - 96);
}

uint64_t sub_23A209278@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t *a4@<X8>)
{
  uint64_t isUniquelyReferenced_nonNull_native;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t, uint64_t);
  uint64_t v18;
  uint64_t v19;
  _BOOL8 v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD **v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t result;
  uint64_t v37;
  char *v38;
  unint64_t *v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t i;
  uint64_t v44;
  _QWORD *v45;

  v39 = a4;
  v40 = a3;
  isUniquelyReferenced_nonNull_native = sub_23A232FE8();
  v7 = *(_QWORD *)(isUniquelyReferenced_nonNull_native - 8);
  v8 = MEMORY[0x24BDAC7A8](isUniquelyReferenced_nonNull_native);
  v38 = (char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v44 = (uint64_t)&v37 - v10;
  v11 = (_QWORD *)sub_23A1FE0FC(MEMORY[0x24BEE4AF8]);
  if (a2 >> 62)
    goto LABEL_24;
  v12 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (i = v7; v12; i = v7)
  {
    v37 = a1;
    v41 = a2;
    v42 = a2 & 0xC000000000000001;
    v13 = 4;
    while (1)
    {
      a1 = v13 - 4;
      if (!v42)
        break;
      v14 = MEMORY[0x23B84508C](v13 - 4, a2);
      v15 = v13 - 3;
      if (__OFADD__(a1, 1))
        goto LABEL_21;
LABEL_11:
      v16 = v14;
      v17 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16);
      a1 = v44;
      v7 = isUniquelyReferenced_nonNull_native;
      v17(v44, v14 + OBJC_IVAR____TtC23DarwinDirectoryInternal11GroupRecord_uuid, isUniquelyReferenced_nonNull_native);
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v45 = v11;
      a2 = sub_23A203D18(a1);
      v19 = v11[2];
      v20 = (v18 & 1) == 0;
      v21 = v19 + v20;
      if (__OFADD__(v19, v20))
        goto LABEL_22;
      a1 = v18;
      if (v11[3] >= v21)
      {
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          sub_23A204AD8();
      }
      else
      {
        sub_23A203EAC(v21, isUniquelyReferenced_nonNull_native);
        v22 = sub_23A203D18(v44);
        if ((a1 & 1) != (v23 & 1))
          goto LABEL_37;
        a2 = v22;
      }
      isUniquelyReferenced_nonNull_native = v7;
      v11 = v45;
      v7 = i;
      if ((a1 & 1) != 0)
      {
        *(_QWORD *)(v45[7] + 8 * a2) = v16;
        swift_release();
      }
      else
      {
        v45[(a2 >> 6) + 8] |= 1 << a2;
        v17(v11[6] + *(_QWORD *)(v7 + 72) * a2, v44, isUniquelyReferenced_nonNull_native);
        *(_QWORD *)(v11[7] + 8 * a2) = v16;
        v24 = v11[2];
        v25 = __OFADD__(v24, 1);
        v26 = v24 + 1;
        if (v25)
          goto LABEL_23;
        v11[2] = v26;
      }
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v44, isUniquelyReferenced_nonNull_native);
      ++v13;
      a2 = v41;
      if (v15 == v12)
      {
        swift_bridgeObjectRelease();
        a1 = v37;
        goto LABEL_26;
      }
    }
    v14 = swift_retain();
    v15 = v13 - 3;
    if (!__OFADD__(a1, 1))
      goto LABEL_11;
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
LABEL_23:
    __break(1u);
LABEL_24:
    swift_bridgeObjectRetain_n();
    v12 = sub_23A2333D8();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
LABEL_26:
  swift_bridgeObjectRetain();
  v27 = sub_23A210B54(a1, (uint64_t)v11);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v28 = sub_23A211050(a2, (uint64_t)v11, a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease_n();
  if (!(v28 >> 62))
  {
    v29 = *(_QWORD *)((v28 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v29)
      goto LABEL_28;
LABEL_35:
    swift_bridgeObjectRelease();
    v33 = i;
    v34 = (uint64_t)v38;
    v35 = v40;
    (*(void (**)(char *, uint64_t, uint64_t))(i + 16))(v38, v40, isUniquelyReferenced_nonNull_native);
    sub_23A1FAC18(v27, v28, v34, v39);
    return (*(uint64_t (**)(uint64_t, uint64_t))(v33 + 8))(v35, isUniquelyReferenced_nonNull_native);
  }
  swift_bridgeObjectRetain();
  v29 = sub_23A2333D8();
  if (!v29)
    goto LABEL_35;
LABEL_28:
  if (v29 >= 1)
  {
    v30 = 0;
    do
    {
      if ((v28 & 0xC000000000000001) != 0)
      {
        v31 = MEMORY[0x23B84508C](v30, v28);
      }
      else
      {
        v31 = *(_QWORD *)(v28 + 8 * v30 + 32);
        swift_retain();
      }
      ++v30;
      v32 = (_QWORD **)(v31 + OBJC_IVAR____TtCV23DarwinDirectoryInternal11RecordStore16GroupStoreRecord_memberNames);
      swift_beginAccess();
      sub_23A20DA18(v32);
      swift_endAccess();
      swift_release();
    }
    while (v29 != v30);
    goto LABEL_35;
  }
  __break(1u);
LABEL_37:
  result = sub_23A2337BC();
  __break(1u);
  return result;
}

unint64_t sub_23A2096D0@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(char *, uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;
  unint64_t result;
  char v18;
  uint64_t v19;
  void (*v20)(char *, uint64_t);
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  _QWORD *v28;
  _QWORD *v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;

  v34 = a3;
  v5 = sub_23A232FE8();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v30 - v10;
  v12 = *a1;
  v31 = *(_DWORD *)(*a1 + 16);
  v13 = *(_QWORD *)(v12 + 32);
  v30 = *(_QWORD *)(v12 + 24);
  v14 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  v14((char *)&v30 - v10, v12 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_uuid, v5);
  v15 = *(_QWORD *)(v12 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_fullName + 8);
  v33 = *(_QWORD *)(v12 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_fullName);
  v35 = v15;
  v16 = *(_QWORD *)(v12 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_homeDirectory + 8);
  v32 = *(_QWORD *)(v12 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_homeDirectory);
  result = ((uint64_t (*)(char *, uint64_t, uint64_t))v14)(v9, v12 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_primaryGroupUUID, v5);
  if (*(_QWORD *)(a2 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    result = sub_23A203D18((uint64_t)v9);
    if ((v18 & 1) != 0)
    {
      v19 = *(_QWORD *)(*(_QWORD *)(a2 + 56) + 8 * result);
      v20 = *(void (**)(char *, uint64_t))(v6 + 8);
      swift_retain();
      v20(v9, v5);
      v21 = *(_DWORD *)(v19 + 32);
      swift_release();
      v22 = v12 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_shell;
      v24 = *(_QWORD *)(v12 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_shell);
      v23 = *(_QWORD *)(v22 + 8);
      type metadata accessor for RecordStore.UserStoreRecord(0);
      v25 = swift_allocObject();
      *(_BYTE *)(v25 + OBJC_IVAR____TtCV23DarwinDirectoryInternal11RecordStore15UserStoreRecord_isMutable) = 0;
      *(_DWORD *)(v25 + 16) = v31;
      *(_QWORD *)(v25 + 24) = v30;
      *(_QWORD *)(v25 + 32) = v13;
      (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))(v25 + OBJC_IVAR____TtCV23DarwinDirectoryInternal11RecordStore15UserStoreRecord_uuid, v11, v5);
      v26 = (_QWORD *)(v25 + OBJC_IVAR____TtCV23DarwinDirectoryInternal11RecordStore15UserStoreRecord_fullName);
      v27 = v35;
      *v26 = v33;
      v26[1] = v27;
      v28 = (_QWORD *)(v25 + OBJC_IVAR____TtCV23DarwinDirectoryInternal11RecordStore15UserStoreRecord_homeDirectory);
      *v28 = v32;
      v28[1] = v16;
      *(_DWORD *)(v25 + OBJC_IVAR____TtCV23DarwinDirectoryInternal11RecordStore15UserStoreRecord_primaryGroupID) = v21;
      v29 = (_QWORD *)(v25 + OBJC_IVAR____TtCV23DarwinDirectoryInternal11RecordStore15UserStoreRecord_shell);
      *v29 = v24;
      v29[1] = v23;
      *v34 = v25;
      return swift_bridgeObjectRetain();
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_23A20992C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  int64_t v28;
  uint64_t v29;
  char *v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  int64_t v34;
  unint64_t v35;
  int64_t v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  int64_t v42;
  char *v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;

  v45 = a2;
  v5 = sub_23A232FE8();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v44 = (char *)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569535C0);
  MEMORY[0x24BDAC7A8](v8);
  v43 = (char *)&v40 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  v10 = swift_bridgeObjectRetain();
  v11 = sub_23A210CC0(v10, a1);
  v41 = a3;
  swift_bridgeObjectRelease();
  swift_release();
  if (v11 >> 62)
  {
    v12 = sub_23A2333D8();
    if (v12)
      goto LABEL_3;
LABEL_13:
    swift_bridgeObjectRelease();
    v15 = MEMORY[0x24BEE4AF8];
    goto LABEL_14;
  }
  v12 = *(_QWORD *)((v11 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v12)
    goto LABEL_13;
LABEL_3:
  v46 = MEMORY[0x24BEE4AF8];
  result = sub_23A20D4B4(0, v12 & ~(v12 >> 63), 0);
  if (v12 < 0)
    goto LABEL_46;
  v40 = a1;
  v14 = 0;
  v15 = v46;
  v42 = v11 & 0xC000000000000001;
  v16 = v11;
  do
  {
    if (v42)
    {
      v17 = MEMORY[0x23B84508C](v14, v11);
    }
    else
    {
      v17 = *(_QWORD *)(v11 + 8 * v14 + 32);
      swift_retain();
    }
    v18 = *(_QWORD *)(v17 + 24);
    v19 = *(_QWORD *)(v17 + 32);
    swift_bridgeObjectRetain();
    swift_release();
    v46 = v15;
    v21 = *(_QWORD *)(v15 + 16);
    v20 = *(_QWORD *)(v15 + 24);
    if (v21 >= v20 >> 1)
    {
      sub_23A20D4B4(v20 > 1, v21 + 1, 1);
      v15 = v46;
    }
    ++v14;
    *(_QWORD *)(v15 + 16) = v21 + 1;
    v22 = v15 + 16 * v21;
    *(_QWORD *)(v22 + 32) = v18;
    *(_QWORD *)(v22 + 40) = v19;
    v11 = v16;
  }
  while (v12 != v14);
  swift_bridgeObjectRelease();
  a1 = v40;
LABEL_14:
  v40 = sub_23A210FBC(v15);
  swift_bridgeObjectRelease();
  v23 = *(_QWORD *)(a1 + OBJC_IVAR____TtC23DarwinDirectoryInternal11GroupRecord_nestedGroups);
  v46 = MEMORY[0x24BEE4B08];
  v24 = v23 + 56;
  v25 = 1 << *(_BYTE *)(v23 + 32);
  v26 = -1;
  if (v25 < 64)
    v26 = ~(-1 << v25);
  v27 = v26 & *(_QWORD *)(v23 + 56);
  v42 = (unint64_t)(v25 + 63) >> 6;
  result = swift_bridgeObjectRetain_n();
  v28 = 0;
  v30 = v43;
  v29 = (uint64_t)v44;
  if (!v27)
    goto LABEL_18;
LABEL_17:
  v31 = __clz(__rbit64(v27));
  v27 &= v27 - 1;
  v32 = v31 | (v28 << 6);
  v33 = v45;
  while (1)
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v6 + 16))(v30, *(_QWORD *)(v23 + 48) + *(_QWORD *)(v6 + 72) * v32, v5);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v6 + 56))(v30, 0, 1, v5);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v30, 1, v5) == 1)
      goto LABEL_42;
    result = (*(uint64_t (**)(uint64_t, char *, uint64_t))(v6 + 32))(v29, v30, v5);
    if (!*(_QWORD *)(v33 + 16))
      break;
    result = sub_23A203D18(v29);
    if ((v37 & 1) == 0)
      goto LABEL_44;
    v38 = swift_retain();
    v39 = sub_23A20992C(v38, v33, v41);
    swift_release();
    v30 = v43;
    v29 = (uint64_t)v44;
    sub_23A20A050(v39);
    result = (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v29, v5);
    if (v27)
      goto LABEL_17;
LABEL_18:
    v34 = v28 + 1;
    v33 = v45;
    if (__OFADD__(v28, 1))
      goto LABEL_45;
    if (v34 >= v42)
      goto LABEL_41;
    v35 = *(_QWORD *)(v24 + 8 * v34);
    ++v28;
    if (!v35)
    {
      v28 = v34 + 1;
      if (v34 + 1 >= v42)
        goto LABEL_41;
      v35 = *(_QWORD *)(v24 + 8 * v28);
      if (!v35)
      {
        v28 = v34 + 2;
        if (v34 + 2 >= v42)
          goto LABEL_41;
        v35 = *(_QWORD *)(v24 + 8 * v28);
        if (!v35)
        {
          v28 = v34 + 3;
          if (v34 + 3 >= v42)
            goto LABEL_41;
          v35 = *(_QWORD *)(v24 + 8 * v28);
          if (!v35)
          {
            v28 = v34 + 4;
            if (v34 + 4 >= v42)
              goto LABEL_41;
            v35 = *(_QWORD *)(v24 + 8 * v28);
            if (!v35)
            {
              v36 = v34 + 5;
              if (v36 >= v42)
              {
LABEL_41:
                (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v30, 1, 1, v5);
LABEL_42:
                swift_release();
                swift_bridgeObjectRelease();
                return sub_23A20A1BC(v46, v40);
              }
              v35 = *(_QWORD *)(v24 + 8 * v36);
              if (!v35)
              {
                while (1)
                {
                  v28 = v36 + 1;
                  if (__OFADD__(v36, 1))
                    goto LABEL_47;
                  if (v28 >= v42)
                    goto LABEL_41;
                  v35 = *(_QWORD *)(v24 + 8 * v28);
                  ++v36;
                  if (v35)
                    goto LABEL_35;
                }
              }
              v28 = v36;
            }
          }
        }
      }
    }
LABEL_35:
    v27 = (v35 - 1) & v35;
    v32 = __clz(__rbit64(v35)) + (v28 << 6);
  }
  __break(1u);
LABEL_44:
  __break(1u);
LABEL_45:
  __break(1u);
LABEL_46:
  __break(1u);
LABEL_47:
  __break(1u);
  return result;
}

uint64_t sub_23A209DC0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  char *v12;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t i;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  uint64_t v23;
  int64_t v24;

  v2 = sub_23A232FE8();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v23 - v7;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569535C0);
  result = MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = 0;
  v14 = a1 + 56;
  v15 = 1 << *(_BYTE *)(a1 + 32);
  v16 = -1;
  if (v15 < 64)
    v16 = ~(-1 << v15);
  v17 = v16 & *(_QWORD *)(a1 + 56);
  v24 = (unint64_t)(v15 + 63) >> 6;
  if (!v17)
    goto LABEL_5;
LABEL_4:
  v18 = __clz(__rbit64(v17));
  v17 &= v17 - 1;
  for (i = v18 | (v13 << 6); ; i = __clz(__rbit64(v21)) + (v13 << 6))
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v12, *(_QWORD *)(a1 + 48) + *(_QWORD *)(v3 + 72) * i, v2);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v3 + 56))(v12, 0, 1, v2);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v12, 1, v2) == 1)
      return swift_release();
    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v6, v12, v2);
    sub_23A20E684((uint64_t)v8, v6);
    result = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v8, v2);
    if (v17)
      goto LABEL_4;
LABEL_5:
    v20 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v20 >= v24)
      goto LABEL_24;
    v21 = *(_QWORD *)(v14 + 8 * v20);
    ++v13;
    if (!v21)
    {
      v13 = v20 + 1;
      if (v20 + 1 >= v24)
        goto LABEL_24;
      v21 = *(_QWORD *)(v14 + 8 * v13);
      if (!v21)
      {
        v13 = v20 + 2;
        if (v20 + 2 >= v24)
          goto LABEL_24;
        v21 = *(_QWORD *)(v14 + 8 * v13);
        if (!v21)
        {
          v13 = v20 + 3;
          if (v20 + 3 >= v24)
            goto LABEL_24;
          v21 = *(_QWORD *)(v14 + 8 * v13);
          if (!v21)
            break;
        }
      }
    }
LABEL_20:
    v17 = (v21 - 1) & v21;
  }
  v22 = v20 + 4;
  if (v22 >= v24)
  {
LABEL_24:
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56))(v12, 1, 1, v2);
    return swift_release();
  }
  v21 = *(_QWORD *)(v14 + 8 * v22);
  if (v21)
  {
    v13 = v22;
    goto LABEL_20;
  }
  while (1)
  {
    v13 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v13 >= v24)
      goto LABEL_24;
    v21 = *(_QWORD *)(v14 + 8 * v13);
    ++v22;
    if (v21)
      goto LABEL_20;
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_23A20A050(uint64_t result)
{
  uint64_t v1;
  int64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  int64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  uint64_t v16;

  v1 = result;
  v2 = 0;
  v3 = result + 56;
  v4 = 1 << *(_BYTE *)(result + 32);
  v5 = -1;
  if (v4 < 64)
    v5 = ~(-1 << v4);
  v6 = v5 & *(_QWORD *)(result + 56);
  v7 = (unint64_t)(v4 + 63) >> 6;
  while (1)
  {
    if (v6)
    {
      v8 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      v9 = v8 | (v2 << 6);
      goto LABEL_5;
    }
    v13 = v2 + 1;
    if (__OFADD__(v2, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v13 >= v7)
      return swift_release();
    v14 = *(_QWORD *)(v3 + 8 * v13);
    ++v2;
    if (!v14)
    {
      v2 = v13 + 1;
      if (v13 + 1 >= v7)
        return swift_release();
      v14 = *(_QWORD *)(v3 + 8 * v2);
      if (!v14)
      {
        v2 = v13 + 2;
        if (v13 + 2 >= v7)
          return swift_release();
        v14 = *(_QWORD *)(v3 + 8 * v2);
        if (!v14)
        {
          v2 = v13 + 3;
          if (v13 + 3 >= v7)
            return swift_release();
          v14 = *(_QWORD *)(v3 + 8 * v2);
          if (!v14)
            break;
        }
      }
    }
LABEL_22:
    v6 = (v14 - 1) & v14;
    v9 = __clz(__rbit64(v14)) + (v2 << 6);
LABEL_5:
    v10 = (uint64_t *)(*(_QWORD *)(v1 + 48) + 16 * v9);
    v11 = *v10;
    v12 = v10[1];
    swift_bridgeObjectRetain();
    sub_23A20E8E0(&v16, v11, v12);
    result = swift_bridgeObjectRelease();
  }
  v15 = v13 + 4;
  if (v15 >= v7)
    return swift_release();
  v14 = *(_QWORD *)(v3 + 8 * v15);
  if (v14)
  {
    v2 = v15;
    goto LABEL_22;
  }
  while (1)
  {
    v2 = v15 + 1;
    if (__OFADD__(v15, 1))
      break;
    if (v2 >= v7)
      return swift_release();
    v14 = *(_QWORD *)(v3 + 8 * v2);
    ++v15;
    if (v14)
      goto LABEL_22;
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_23A20A1BC(uint64_t result, uint64_t a2)
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
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;

  v2 = result;
  v3 = 0;
  v18 = a2;
  v4 = result + 56;
  v5 = 1 << *(_BYTE *)(result + 32);
  v6 = -1;
  if (v5 < 64)
    v6 = ~(-1 << v5);
  v7 = v6 & *(_QWORD *)(result + 56);
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
    v14 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v14 >= v8)
      goto LABEL_23;
    v15 = *(_QWORD *)(v4 + 8 * v14);
    ++v3;
    if (!v15)
    {
      v3 = v14 + 1;
      if (v14 + 1 >= v8)
        goto LABEL_23;
      v15 = *(_QWORD *)(v4 + 8 * v3);
      if (!v15)
      {
        v3 = v14 + 2;
        if (v14 + 2 >= v8)
          goto LABEL_23;
        v15 = *(_QWORD *)(v4 + 8 * v3);
        if (!v15)
        {
          v3 = v14 + 3;
          if (v14 + 3 >= v8)
            goto LABEL_23;
          v15 = *(_QWORD *)(v4 + 8 * v3);
          if (!v15)
            break;
        }
      }
    }
LABEL_22:
    v7 = (v15 - 1) & v15;
    v10 = __clz(__rbit64(v15)) + (v3 << 6);
LABEL_5:
    v11 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v10);
    v12 = *v11;
    v13 = v11[1];
    swift_bridgeObjectRetain();
    sub_23A20E8E0(&v17, v12, v13);
    result = swift_bridgeObjectRelease();
  }
  v16 = v14 + 4;
  if (v16 >= v8)
  {
LABEL_23:
    swift_release();
    return v18;
  }
  v15 = *(_QWORD *)(v4 + 8 * v16);
  if (v15)
  {
    v3 = v16;
    goto LABEL_22;
  }
  while (1)
  {
    v3 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v3 >= v8)
      goto LABEL_23;
    v15 = *(_QWORD *)(v4 + 8 * v3);
    ++v16;
    if (v15)
      goto LABEL_22;
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_23A20A338(unint64_t a1, unint64_t a2, void (*a3)(uint64_t, uint64_t *))
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;

  v6 = a1;
  v18 = MEMORY[0x24BEE4AF8];
  if (a1 >> 62)
    goto LABEL_25;
  v7 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v7; v7 = sub_23A2333D8())
  {
    v8 = 4;
    while (1)
    {
      v9 = v8 - 4;
      if ((v6 & 0xC000000000000001) == 0)
        break;
      v10 = MEMORY[0x23B84508C](v8 - 4, v6);
      v11 = __OFADD__(v9, 1);
      v12 = v8 - 3;
      if (v11)
        goto LABEL_23;
LABEL_9:
      a3(v10, &v18);
      if (v3)
        goto LABEL_22;
      swift_release();
      ++v8;
      if (v12 == v7)
        goto LABEL_11;
    }
    v10 = *(_QWORD *)(v6 + 8 * v8);
    swift_retain();
    v11 = __OFADD__(v9, 1);
    v12 = v8 - 3;
    if (!v11)
      goto LABEL_9;
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
LABEL_25:
    swift_bridgeObjectRetain();
  }
LABEL_11:
  swift_bridgeObjectRelease();
  if (a2 >> 62)
  {
    swift_bridgeObjectRetain();
    v6 = sub_23A2333D8();
    if (v6)
      goto LABEL_13;
LABEL_21:
    swift_bridgeObjectRelease();
    return v18;
  }
  v6 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v6)
    goto LABEL_21;
LABEL_13:
  v13 = 4;
  while (1)
  {
    v14 = v13 - 4;
    if ((a2 & 0xC000000000000001) != 0)
    {
      v15 = MEMORY[0x23B84508C](v13 - 4, a2);
      v11 = __OFADD__(v14, 1);
      v16 = v13 - 3;
      if (v11)
        goto LABEL_24;
    }
    else
    {
      v15 = *(_QWORD *)(a2 + 8 * v13);
      swift_retain();
      v11 = __OFADD__(v14, 1);
      v16 = v13 - 3;
      if (v11)
        goto LABEL_24;
    }
    a3(v15, &v18);
    if (v3)
      break;
    swift_release();
    ++v13;
    if (v16 == v6)
      goto LABEL_21;
  }
LABEL_22:
  swift_bridgeObjectRelease();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23A20A52C(unint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t isUniquelyReferenced_nonNull_native;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  _BOOL8 v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  uint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  int64_t v45;
  unint64_t v46;
  int64_t v47;
  unint64_t v48;
  char *v49;
  uint64_t v50;
  char v51;
  uint64_t v52;
  uint64_t v53;
  _QWORD *v54;
  _QWORD *v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t result;
  _QWORD *v60;
  _QWORD *v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  _QWORD v65[2];
  uint64_t v66;
  unint64_t v67;
  uint64_t v68;
  unint64_t v69;
  uint64_t v70;
  char *v71;
  unint64_t v72;
  uint64_t v73;
  int64_t v74;
  char *v75;
  char *v76;
  void (*v77)(uint64_t, uint64_t, uint64_t);
  uint64_t v78;
  unint64_t v79;
  uint64_t v80;
  _QWORD *v81;
  unint64_t v82;

  v3 = v2;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569535C0);
  MEMORY[0x24BDAC7A8](v6);
  v76 = (char *)v65 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  isUniquelyReferenced_nonNull_native = sub_23A232FE8();
  v9 = *(_QWORD *)(isUniquelyReferenced_nonNull_native - 8);
  v10 = MEMORY[0x24BDAC7A8](isUniquelyReferenced_nonNull_native);
  v75 = (char *)v65 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v71 = (char *)v65 - v13;
  MEMORY[0x24BDAC7A8](v12);
  v15 = (uint64_t)v65 - v14;
  v16 = (_QWORD *)sub_23A1FE0FC(MEMORY[0x24BEE4AF8]);
  if (a2 >> 62)
    goto LABEL_86;
  v17 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  while (1)
  {
    v79 = a2;
    v80 = isUniquelyReferenced_nonNull_native;
    v78 = v17;
    v82 = v9;
    v70 = v3;
    v72 = a1;
    if (!v17)
      break;
    v77 = (void (*)(uint64_t, uint64_t, uint64_t))(a2 & 0xC000000000000001);
    v3 = 4;
    while (1)
    {
      a1 = v3 - 4;
      if (!v77)
        break;
      v18 = MEMORY[0x23B84508C](v3 - 4, a2);
      v19 = v3 - 3;
      if (__OFADD__(a1, 1))
        goto LABEL_80;
LABEL_12:
      v9 = *(_QWORD *)(v9 + 16);
      ((void (*)(uint64_t, uint64_t, uint64_t))v9)(v15, v18 + OBJC_IVAR____TtC23DarwinDirectoryInternal11GroupRecord_uuid, isUniquelyReferenced_nonNull_native);
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v81 = v16;
      a1 = sub_23A203D18(v15);
      v21 = v16[2];
      v22 = (v20 & 1) == 0;
      v23 = v21 + v22;
      if (__OFADD__(v21, v22))
        goto LABEL_81;
      a2 = v20;
      if (v16[3] >= v23)
      {
        if ((isUniquelyReferenced_nonNull_native & 1) != 0)
        {
          isUniquelyReferenced_nonNull_native = v80;
          v16 = v81;
          if ((v20 & 1) != 0)
            goto LABEL_5;
        }
        else
        {
          sub_23A204AD8();
          isUniquelyReferenced_nonNull_native = v80;
          v16 = v81;
          if ((a2 & 1) != 0)
            goto LABEL_5;
        }
      }
      else
      {
        sub_23A203EAC(v23, isUniquelyReferenced_nonNull_native);
        v24 = sub_23A203D18(v15);
        if ((a2 & 1) != (v25 & 1))
          goto LABEL_91;
        a1 = v24;
        isUniquelyReferenced_nonNull_native = v80;
        v16 = v81;
        if ((a2 & 1) != 0)
        {
LABEL_5:
          *(_QWORD *)(v16[7] + 8 * a1) = v18;
          swift_release();
          goto LABEL_6;
        }
      }
      v16[(a1 >> 6) + 8] |= 1 << a1;
      ((void (*)(unint64_t, uint64_t, uint64_t))v9)(v16[6] + *(_QWORD *)(v82 + 72) * a1, v15, isUniquelyReferenced_nonNull_native);
      *(_QWORD *)(v16[7] + 8 * a1) = v18;
      v26 = v16[2];
      v27 = __OFADD__(v26, 1);
      v28 = v26 + 1;
      if (v27)
        goto LABEL_82;
      v16[2] = v28;
LABEL_6:
      swift_bridgeObjectRelease();
      v9 = v82;
      (*(void (**)(uint64_t, uint64_t))(v82 + 8))(v15, isUniquelyReferenced_nonNull_native);
      ++v3;
      v17 = v78;
      a2 = v79;
      if (v19 == v78)
      {
        swift_bridgeObjectRelease();
        v3 = v70;
        a1 = v72;
        goto LABEL_25;
      }
    }
    v18 = *(_QWORD *)(a2 + 8 * v3);
    swift_retain();
    v19 = v3 - 3;
    if (!__OFADD__(a1, 1))
      goto LABEL_12;
LABEL_80:
    __break(1u);
LABEL_81:
    __break(1u);
LABEL_82:
    __break(1u);
LABEL_83:
    __break(1u);
LABEL_84:
    __break(1u);
LABEL_85:
    __break(1u);
LABEL_86:
    swift_bridgeObjectRetain();
    v17 = sub_23A2333D8();
  }
  swift_bridgeObjectRelease();
LABEL_25:
  v29 = (uint64_t)v71;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v15 = sub_23A2333D8();
    if (v15)
      goto LABEL_27;
    goto LABEL_63;
  }
  v15 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v15)
  {
LABEL_63:
    swift_bridgeObjectRelease();
    if (v17)
    {
      v9 = a2 & 0xC000000000000001;
      swift_bridgeObjectRetain();
      v15 = 4;
      a1 = MEMORY[0x24BEE4AF8];
      while (1)
      {
        v52 = v15 - 4;
        if (v9)
        {
          v53 = MEMORY[0x23B84508C](v15 - 4, a2);
          v27 = __OFADD__(v52, 1);
          isUniquelyReferenced_nonNull_native = v15 - 3;
          if (v27)
            goto LABEL_83;
        }
        else
        {
          v53 = *(_QWORD *)(a2 + 8 * v15);
          swift_retain();
          v27 = __OFADD__(v52, 1);
          isUniquelyReferenced_nonNull_native = v15 - 3;
          if (v27)
            goto LABEL_83;
        }
        sub_23A20C20C(v53, (uint64_t)v16, a1);
        if (v3)
          break;
        swift_release();
        ++v15;
        if (isUniquelyReferenced_nonNull_native == v17)
        {
          swift_bridgeObjectRelease();
          return swift_bridgeObjectRelease();
        }
      }
      swift_bridgeObjectRelease();
      swift_release();
    }
    return swift_bridgeObjectRelease();
  }
LABEL_27:
  v30 = 0;
  v31 = a1 & 0xC000000000000001;
  v65[1] = a1 + 32;
  v66 = a1 & 0xFFFFFFFFFFFFFF8;
  v67 = a1 & 0xC000000000000001;
  v68 = v15;
LABEL_28:
  if (v31)
  {
    a2 = v30;
    v32 = MEMORY[0x23B84508C](v30, a1);
    v33 = v30 + 1;
    if (__OFADD__(a2, 1))
      goto LABEL_85;
    goto LABEL_34;
  }
  if (v30 >= *(_QWORD *)(v66 + 16))
  {
LABEL_90:
    __break(1u);
LABEL_91:
    result = sub_23A2337BC();
    __break(1u);
  }
  else
  {
    v32 = swift_retain();
    v27 = __OFADD__(v30, 1);
    v33 = v30 + 1;
    if (v27)
      goto LABEL_85;
LABEL_34:
    v69 = v33;
    v73 = v32;
    v34 = v32 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_primaryGroupUUID;
    v77 = *(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16);
    v77(v29, v32 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_primaryGroupUUID, isUniquelyReferenced_nonNull_native);
    if (v16[2])
    {
      sub_23A203D18(v29);
      v15 = *(_QWORD *)(v9 + 8);
      if ((v35 & 1) != 0)
      {
        ((void (*)(uint64_t, uint64_t))v15)(v29, isUniquelyReferenced_nonNull_native);
        v36 = v73 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_memberships;
        swift_beginAccess();
        v37 = *(_QWORD *)v36;
        v39 = *(_QWORD *)(*(_QWORD *)v36 + 56);
        a1 = *(_QWORD *)v36 + 56;
        v38 = v39;
        v40 = 1 << *(_BYTE *)(v37 + 32);
        if (v40 < 64)
          v41 = ~(-1 << v40);
        else
          v41 = -1;
        v42 = v41 & v38;
        v74 = (unint64_t)(v40 + 63) >> 6;
        swift_bridgeObjectRetain();
        v3 = 0;
        if (v42)
        {
LABEL_40:
          v43 = __clz(__rbit64(v42));
          v42 &= v42 - 1;
          v44 = v43 | (v3 << 6);
          goto LABEL_55;
        }
        while (1)
        {
          v45 = v3 + 1;
          if (__OFADD__(v3, 1))
            goto LABEL_84;
          if (v45 >= v74)
            goto LABEL_61;
          v46 = *(_QWORD *)(a1 + 8 * v45);
          ++v3;
          if (!v46)
          {
            v3 = v45 + 1;
            if (v45 + 1 >= v74)
              goto LABEL_61;
            v46 = *(_QWORD *)(a1 + 8 * v3);
            if (!v46)
            {
              v3 = v45 + 2;
              if (v45 + 2 >= v74)
                goto LABEL_61;
              v46 = *(_QWORD *)(a1 + 8 * v3);
              if (!v46)
              {
                v47 = v45 + 3;
                if (v47 >= v74)
                {
LABEL_61:
                  isUniquelyReferenced_nonNull_native = v80;
                  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v76, 1, 1, v80);
                  swift_release();
                  swift_release();
LABEL_62:
                  v15 = v68;
                  v30 = v69;
                  v3 = v70;
                  v29 = (uint64_t)v71;
                  v17 = v78;
                  a2 = v79;
                  a1 = v72;
                  v31 = v67;
                  if (v69 != v68)
                    goto LABEL_28;
                  goto LABEL_63;
                }
                v46 = *(_QWORD *)(a1 + 8 * v47);
                if (!v46)
                {
                  while (1)
                  {
                    v3 = v47 + 1;
                    if (__OFADD__(v47, 1))
                      break;
                    if (v3 >= v74)
                      goto LABEL_61;
                    v46 = *(_QWORD *)(a1 + 8 * v3);
                    ++v47;
                    if (v46)
                      goto LABEL_54;
                  }
                  __break(1u);
                  goto LABEL_90;
                }
                v3 = v47;
              }
            }
          }
LABEL_54:
          v42 = (v46 - 1) & v46;
          v44 = __clz(__rbit64(v46)) + (v3 << 6);
LABEL_55:
          v48 = *(_QWORD *)(v37 + 48) + *(_QWORD *)(v9 + 72) * v44;
          a2 = v9;
          v49 = v76;
          isUniquelyReferenced_nonNull_native = v80;
          v77((uint64_t)v76, v48, v80);
          (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(a2 + 56))(v49, 0, 1, isUniquelyReferenced_nonNull_native);
          if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(a2 + 48))(v49, 1, isUniquelyReferenced_nonNull_native) == 1)
          {
            swift_release();
            swift_release();
            v9 = a2;
            goto LABEL_62;
          }
          v50 = (uint64_t)v75;
          (*(void (**)(void))(a2 + 32))();
          if (!v16[2] || (sub_23A203D18(v50), (v51 & 1) == 0))
          {
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            type metadata accessor for RecordStoreBuilderError();
            sub_23A1F58C8(&qword_2569523F8, (uint64_t (*)(uint64_t))type metadata accessor for RecordStoreBuilderError, (uint64_t)&unk_23A234AE0);
            swift_allocError();
            v55 = v54;
            v56 = (char *)v54 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256952400) + 48);
            v57 = *(_QWORD *)(v73 + 32);
            *v55 = *(_QWORD *)(v73 + 24);
            v55[1] = v57;
            v58 = v80;
            v77((uint64_t)v56, v50, v80);
            swift_storeEnumTagMultiPayload();
            swift_bridgeObjectRetain();
            swift_willThrow();
            swift_release();
            ((void (*)(uint64_t, uint64_t))v15)(v50, v58);
            return swift_release();
          }
          ((void (*)(uint64_t, uint64_t))v15)(v50, v80);
          v9 = v82;
          if (v42)
            goto LABEL_40;
        }
      }
    }
    else
    {
      v15 = *(_QWORD *)(v9 + 8);
    }
    ((void (*)(char *, uint64_t))v15)(v71, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    type metadata accessor for RecordStoreBuilderError();
    sub_23A1F58C8(&qword_2569523F8, (uint64_t (*)(uint64_t))type metadata accessor for RecordStoreBuilderError, (uint64_t)&unk_23A234AE0);
    swift_allocError();
    v61 = v60;
    v62 = (char *)v60 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256952400) + 48);
    v63 = isUniquelyReferenced_nonNull_native;
    v64 = *(_QWORD *)(v73 + 32);
    *v61 = *(_QWORD *)(v73 + 24);
    v61[1] = v64;
    v77((uint64_t)v62, v34, v63);
    swift_storeEnumTagMultiPayload();
    swift_bridgeObjectRetain();
    swift_willThrow();
    return swift_release();
  }
  return result;
}

uint64_t sub_23A20ADD4(uint64_t a1, unint64_t *a2)
{
  unint64_t v3;
  char v4;
  uint64_t v5;
  _DWORD *v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  unint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  unint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _BYTE v23[16];
  uint64_t *v24;
  _BYTE v25[16];
  uint64_t *v26;
  uint64_t v27;

  v3 = *a2;
  v26 = &v27;
  v27 = a1;
  swift_bridgeObjectRetain();
  v4 = sub_23A20B880((uint64_t (*)(uint64_t *))sub_23A211CA0, (uint64_t)v25, v3);
  v5 = swift_bridgeObjectRelease();
  if ((v4 & 1) != 0)
  {
    type metadata accessor for RecordStoreBuilderError();
    sub_23A1F58C8(&qword_2569523F8, (uint64_t (*)(uint64_t))type metadata accessor for RecordStoreBuilderError, (uint64_t)&unk_23A234AE0);
    swift_allocError();
    *v6 = *(_DWORD *)(v27 + 32);
LABEL_3:
    swift_storeEnumTagMultiPayload();
    return swift_willThrow();
  }
  v7 = *(_QWORD *)(v27 + OBJC_IVAR____TtC23DarwinDirectoryInternal11GroupRecord_aliases);
  MEMORY[0x24BDAC7A8](v5);
  v24 = &v27;
  swift_bridgeObjectRetain();
  v8 = sub_23A20B474((uint64_t (*)(_QWORD *))sub_23A211CC0, (uint64_t)v23, v7);
  v9 = swift_bridgeObjectRelease();
  if ((v8 & 1) != 0
    || (v10 = *a2,
        MEMORY[0x24BDAC7A8](v9),
        v24 = &v27,
        swift_bridgeObjectRetain(),
        v11 = sub_23A20B880((uint64_t (*)(uint64_t *))sub_23A211CDC, (uint64_t)v23, v10),
        v12 = swift_bridgeObjectRelease(),
        (v11 & 1) != 0))
  {
    type metadata accessor for RecordStoreBuilderError();
    sub_23A1F58C8(&qword_2569523F8, (uint64_t (*)(uint64_t))type metadata accessor for RecordStoreBuilderError, (uint64_t)&unk_23A234AE0);
    swift_allocError();
    v13 = *(_QWORD *)(v27 + 48);
    *v14 = *(_QWORD *)(v27 + 40);
    v14[1] = v13;
    swift_storeEnumTagMultiPayload();
    swift_bridgeObjectRetain();
    return swift_willThrow();
  }
  v16 = *a2;
  MEMORY[0x24BDAC7A8](v12);
  v24 = &v27;
  swift_bridgeObjectRetain();
  v17 = sub_23A20B880((uint64_t (*)(uint64_t *))sub_23A211D00, (uint64_t)v23, v16);
  swift_bridgeObjectRelease();
  if ((v17 & 1) != 0)
  {
    type metadata accessor for RecordStoreBuilderError();
    sub_23A1F58C8(&qword_2569523F8, (uint64_t (*)(uint64_t))type metadata accessor for RecordStoreBuilderError, (uint64_t)&unk_23A234AE0);
    swift_allocError();
    v19 = v18;
    v20 = v27 + OBJC_IVAR____TtC23DarwinDirectoryInternal11GroupRecord_uuid;
    v21 = sub_23A232FE8();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 16))(v19, v20, v21);
    goto LABEL_3;
  }
  v22 = swift_retain();
  MEMORY[0x23B844F0C](v22);
  if (*(_QWORD *)((*a2 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*a2 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    sub_23A2331D4();
  sub_23A2331F8();
  return sub_23A2331C8();
}

uint64_t sub_23A20B124(uint64_t a1, unint64_t *a2)
{
  unint64_t v3;
  char v4;
  uint64_t v5;
  _DWORD *v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  unint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  unint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _BYTE v23[16];
  uint64_t *v24;
  _BYTE v25[16];
  uint64_t *v26;
  uint64_t v27;

  v3 = *a2;
  v26 = &v27;
  v27 = a1;
  swift_bridgeObjectRetain();
  v4 = sub_23A20B880((uint64_t (*)(uint64_t *))sub_23A211DE0, (uint64_t)v25, v3);
  v5 = swift_bridgeObjectRelease();
  if ((v4 & 1) != 0)
  {
    type metadata accessor for RecordStoreBuilderError();
    sub_23A1F58C8(&qword_2569523F8, (uint64_t (*)(uint64_t))type metadata accessor for RecordStoreBuilderError, (uint64_t)&unk_23A234AE0);
    swift_allocError();
    *v6 = *(_DWORD *)(v27 + 16);
LABEL_3:
    swift_storeEnumTagMultiPayload();
    return swift_willThrow();
  }
  v7 = *(_QWORD *)(v27 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_aliases);
  MEMORY[0x24BDAC7A8](v5);
  v24 = &v27;
  swift_bridgeObjectRetain();
  v8 = sub_23A20B474((uint64_t (*)(_QWORD *))sub_23A211E00, (uint64_t)v23, v7);
  v9 = swift_bridgeObjectRelease();
  if ((v8 & 1) != 0
    || (v10 = *a2,
        MEMORY[0x24BDAC7A8](v9),
        v24 = &v27,
        swift_bridgeObjectRetain(),
        v11 = sub_23A20B880((uint64_t (*)(uint64_t *))sub_23A211E1C, (uint64_t)v23, v10),
        v12 = swift_bridgeObjectRelease(),
        (v11 & 1) != 0))
  {
    type metadata accessor for RecordStoreBuilderError();
    sub_23A1F58C8(&qword_2569523F8, (uint64_t (*)(uint64_t))type metadata accessor for RecordStoreBuilderError, (uint64_t)&unk_23A234AE0);
    swift_allocError();
    v13 = *(_QWORD *)(v27 + 32);
    *v14 = *(_QWORD *)(v27 + 24);
    v14[1] = v13;
    swift_storeEnumTagMultiPayload();
    swift_bridgeObjectRetain();
    return swift_willThrow();
  }
  v16 = *a2;
  MEMORY[0x24BDAC7A8](v12);
  v24 = &v27;
  swift_bridgeObjectRetain();
  v17 = sub_23A20B880((uint64_t (*)(uint64_t *))sub_23A211E40, (uint64_t)v23, v16);
  swift_bridgeObjectRelease();
  if ((v17 & 1) != 0)
  {
    type metadata accessor for RecordStoreBuilderError();
    sub_23A1F58C8(&qword_2569523F8, (uint64_t (*)(uint64_t))type metadata accessor for RecordStoreBuilderError, (uint64_t)&unk_23A234AE0);
    swift_allocError();
    v19 = v18;
    v20 = v27 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_uuid;
    v21 = sub_23A232FE8();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 16))(v19, v20, v21);
    goto LABEL_3;
  }
  v22 = swift_retain();
  MEMORY[0x23B844F0C](v22);
  if (*(_QWORD *)((*a2 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*a2 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    sub_23A2331D4();
  sub_23A2331F8();
  return sub_23A2331C8();
}

uint64_t sub_23A20B474(uint64_t (*a1)(_QWORD *), uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t result;
  int64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v15;
  int64_t v16;
  _QWORD *v17;
  uint64_t v18;
  char v19;
  char v20;
  char v21;
  _QWORD v22[2];
  int64_t v23;

  v6 = a3 + 56;
  v7 = 1 << *(_BYTE *)(a3 + 32);
  v8 = -1;
  if (v7 < 64)
    v8 = ~(-1 << v7);
  v9 = v8 & *(_QWORD *)(a3 + 56);
  v23 = (unint64_t)(v7 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v11 = 0;
  while (1)
  {
    if (v9)
    {
      v12 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      v13 = v12 | (v11 << 6);
      goto LABEL_19;
    }
    if (__OFADD__(v11++, 1))
      break;
    if (v11 >= v23)
      goto LABEL_27;
    v15 = *(_QWORD *)(v6 + 8 * v11);
    if (!v15)
    {
      v16 = v11 + 1;
      if (v11 + 1 >= v23)
        goto LABEL_27;
      v15 = *(_QWORD *)(v6 + 8 * v16);
      if (!v15)
      {
        v16 = v11 + 2;
        if (v11 + 2 >= v23)
          goto LABEL_27;
        v15 = *(_QWORD *)(v6 + 8 * v16);
        if (!v15)
        {
          v16 = v11 + 3;
          if (v11 + 3 >= v23)
            goto LABEL_27;
          v15 = *(_QWORD *)(v6 + 8 * v16);
          if (!v15)
          {
            v16 = v11 + 4;
            if (v11 + 4 >= v23)
            {
LABEL_27:
              swift_release();
              v21 = 0;
              return v21 & 1;
            }
            v15 = *(_QWORD *)(v6 + 8 * v16);
            if (!v15)
            {
              while (1)
              {
                v11 = v16 + 1;
                if (__OFADD__(v16, 1))
                  goto LABEL_30;
                if (v11 >= v23)
                  goto LABEL_27;
                v15 = *(_QWORD *)(v6 + 8 * v11);
                ++v16;
                if (v15)
                  goto LABEL_18;
              }
            }
          }
        }
      }
      v11 = v16;
    }
LABEL_18:
    v9 = (v15 - 1) & v15;
    v13 = __clz(__rbit64(v15)) + (v11 << 6);
LABEL_19:
    v17 = (_QWORD *)(*(_QWORD *)(a3 + 48) + 16 * v13);
    v18 = v17[1];
    v22[0] = *v17;
    v22[1] = v18;
    swift_bridgeObjectRetain();
    v19 = a1(v22);
    if (v3)
    {
      swift_release();
      swift_bridgeObjectRelease();
      return v21 & 1;
    }
    v20 = v19;
    result = swift_bridgeObjectRelease();
    if ((v20 & 1) != 0)
    {
      swift_release();
      v21 = 1;
      return v21 & 1;
    }
  }
  __break(1u);
LABEL_30:
  __break(1u);
  return result;
}

BOOL sub_23A20B658(uint64_t (*a1)(char *), _BOOL8 a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(char *, uint64_t, uint64_t, uint64_t);
  int v16;
  BOOL v17;
  void (*v18)(char *, char *, uint64_t);
  uint64_t v19;
  char *v20;
  char v21;
  char v22;
  void (*v23)(char *, uint64_t, uint64_t, uint64_t);
  _QWORD v25[2];
  int v26;
  uint64_t v27;
  char *v28;
  void (*v29)(char *, uint64_t, uint64_t);
  _BOOL8 v30;
  uint64_t (*v31)(char *);
  uint64_t v32;

  v4 = v3;
  v30 = a2;
  v31 = a1;
  v32 = sub_23A232FE8();
  v6 = *(_QWORD *)(v32 - 8);
  MEMORY[0x24BDAC7A8](v32);
  v8 = (char *)v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569535C0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *(_QWORD *)(a3 + 16);
  if (v12)
  {
    v13 = a3 + ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
    v27 = *(_QWORD *)(v6 + 72);
    v28 = v8;
    v29 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
    v25[1] = a3;
    swift_bridgeObjectRetain();
    while (1)
    {
      v14 = v32;
      v29(v11, v13, v32);
      v15 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56);
      v15(v11, 0, 1, v14);
      v16 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 48))(v11, 1, v14);
      v17 = v16 != 1;
      if (v16 == 1)
        break;
      v26 = 1;
      v18 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
      v19 = v6;
      v20 = v28;
      v18(v28, v11, v14);
      v17 = v30;
      v21 = v31(v20);
      if (v4)
      {
        (*(void (**)(char *, uint64_t))(v19 + 8))(v20, v14);
        swift_bridgeObjectRelease();
        return v17;
      }
      v22 = v21;
      v23 = v15;
      (*(void (**)(char *, uint64_t))(v19 + 8))(v20, v14);
      if ((v22 & 1) != 0)
      {
        v17 = v26;
        break;
      }
      v13 += v27;
      --v12;
      v4 = 0;
      v6 = v19;
      if (!v12)
        goto LABEL_9;
    }
  }
  else
  {
    v23 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56);
    swift_bridgeObjectRetain();
LABEL_9:
    v23(v11, 1, 1, v32);
    v17 = 0;
  }
  swift_bridgeObjectRelease();
  return v17;
}

uint64_t sub_23A20B880(uint64_t (*a1)(uint64_t *), uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  char v11;
  char v12;
  uint64_t v15;

  if (a3 >> 62)
  {
LABEL_17:
    swift_bridgeObjectRetain();
    v5 = sub_23A2333D8();
    if (v5)
      goto LABEL_3;
  }
  else
  {
    v5 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v5)
    {
LABEL_3:
      v6 = 4;
      do
      {
        v7 = v6 - 4;
        if ((a3 & 0xC000000000000001) != 0)
        {
          v8 = MEMORY[0x23B84508C](v6 - 4, a3);
          v9 = v6 - 3;
          if (__OFADD__(v7, 1))
            goto LABEL_16;
        }
        else
        {
          v8 = *(_QWORD *)(a3 + 8 * v6);
          swift_retain();
          v9 = v6 - 3;
          if (__OFADD__(v7, 1))
          {
LABEL_16:
            __break(1u);
            goto LABEL_17;
          }
        }
        v15 = v8;
        v10 = a1(&v15);
        if (v3)
        {
          swift_bridgeObjectRelease();
          swift_release();
          return v12 & 1;
        }
        v11 = v10;
        swift_release();
        if ((v11 & 1) != 0)
        {
          swift_bridgeObjectRelease();
          v12 = 1;
          return v12 & 1;
        }
        ++v6;
      }
      while (v9 != v5);
    }
  }
  swift_bridgeObjectRelease();
  v12 = 0;
  return v12 & 1;
}

uint64_t sub_23A20B9C4(uint64_t (*a1)(char *), uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t result;
  int64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v21;
  int64_t v22;
  char v23;
  char v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  int64_t v28;
  uint64_t (*v29)(char *);
  uint64_t v30;

  v29 = a1;
  v5 = sub_23A232FE8();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569535C0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *(_QWORD *)(a3 + 56);
  v27 = a3 + 56;
  v13 = 1 << *(_BYTE *)(a3 + 32);
  v14 = -1;
  if (v13 < 64)
    v14 = ~(-1 << v13);
  v15 = v14 & v12;
  v28 = (unint64_t)(v13 + 63) >> 6;
  v30 = a3;
  result = swift_bridgeObjectRetain();
  v17 = 0;
  while (v15)
  {
    v18 = __clz(__rbit64(v15));
    v15 &= v15 - 1;
    v19 = v18 | (v17 << 6);
LABEL_19:
    (*(void (**)(char *, unint64_t, uint64_t))(v6 + 16))(v11, *(_QWORD *)(v30 + 48) + *(_QWORD *)(v6 + 72) * v19, v5);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v6 + 56))(v11, 0, 1, v5);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v11, 1, v5) == 1)
      goto LABEL_29;
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v11, v5);
    v23 = v29(v8);
    if (v3)
    {
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      swift_release();
      return v25 & 1;
    }
    v24 = v23;
    result = (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    if ((v24 & 1) != 0)
    {
      swift_release();
      v25 = 1;
      return v25 & 1;
    }
  }
  if (__OFADD__(v17++, 1))
  {
    __break(1u);
    goto LABEL_32;
  }
  if (v17 >= v28)
    goto LABEL_28;
  v21 = *(_QWORD *)(v27 + 8 * v17);
  if (v21)
  {
LABEL_18:
    v15 = (v21 - 1) & v21;
    v19 = __clz(__rbit64(v21)) + (v17 << 6);
    goto LABEL_19;
  }
  v22 = v17 + 1;
  if (v17 + 1 >= v28)
    goto LABEL_28;
  v21 = *(_QWORD *)(v27 + 8 * v22);
  if (v21)
    goto LABEL_17;
  v22 = v17 + 2;
  if (v17 + 2 >= v28)
    goto LABEL_28;
  v21 = *(_QWORD *)(v27 + 8 * v22);
  if (v21)
    goto LABEL_17;
  v22 = v17 + 3;
  if (v17 + 3 >= v28)
    goto LABEL_28;
  v21 = *(_QWORD *)(v27 + 8 * v22);
  if (v21)
    goto LABEL_17;
  v22 = v17 + 4;
  if (v17 + 4 >= v28)
  {
LABEL_28:
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v11, 1, 1, v5);
LABEL_29:
    swift_release();
    v25 = 0;
    return v25 & 1;
  }
  v21 = *(_QWORD *)(v27 + 8 * v22);
  if (v21)
  {
LABEL_17:
    v17 = v22;
    goto LABEL_18;
  }
  while (1)
  {
    v17 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v17 >= v28)
      goto LABEL_28;
    v21 = *(_QWORD *)(v27 + 8 * v17);
    ++v22;
    if (v21)
      goto LABEL_18;
  }
LABEL_32:
  __break(1u);
  return result;
}

BOOL sub_23A20BCB4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t inited;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = *(_QWORD *)(a1 + OBJC_IVAR____TtC23DarwinDirectoryInternal11GroupRecord_aliases);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569520A8);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_23A2349D0;
  v6 = *(_QWORD *)(a1 + 48);
  *(_QWORD *)(inited + 32) = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(inited + 40) = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v7 = sub_23A211D20(inited, v4);
  swift_setDeallocating();
  swift_arrayDestroy();
  v8 = *(_QWORD *)(a2 + OBJC_IVAR____TtC23DarwinDirectoryInternal11GroupRecord_aliases);
  v9 = swift_initStackObject();
  *(_OWORD *)(v9 + 16) = xmmword_23A2349D0;
  v10 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(v9 + 32) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(v9 + 40) = v10;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v11 = sub_23A211D20(v9, v8);
  swift_setDeallocating();
  swift_arrayDestroy();
  LOBYTE(a2) = sub_23A20BF8C(v11, v7);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (a2 & 1) == 0;
}

BOOL sub_23A20BE20(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t inited;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = *(_QWORD *)(a1 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_aliases);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569520A8);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_23A2349D0;
  v6 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(inited + 32) = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(inited + 40) = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v7 = sub_23A211D20(inited, v4);
  swift_setDeallocating();
  swift_arrayDestroy();
  v8 = *(_QWORD *)(a2 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_aliases);
  v9 = swift_initStackObject();
  *(_OWORD *)(v9 + 16) = xmmword_23A2349D0;
  v10 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(v9 + 32) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(v9 + 40) = v10;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v11 = sub_23A211D20(v9, v8);
  swift_setDeallocating();
  swift_arrayDestroy();
  LOBYTE(a2) = sub_23A20BF8C(v11, v7);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (a2 & 1) == 0;
}

uint64_t sub_23A20BF8C(uint64_t a1, uint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t result;
  int64_t v11;
  unint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  BOOL v25;
  uint64_t v26;
  unint64_t i;
  uint64_t v28;
  _QWORD *v29;
  BOOL v30;
  uint64_t v31;
  int64_t v32;
  uint64_t v33;

  v2 = *(_QWORD *)(a2 + 16);
  if (!v2)
    return 1;
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
    return 1;
  if (v2 >= v3)
    v4 = a1;
  else
    v4 = a2;
  v31 = v4 + 56;
  if (v2 >= v3)
    v5 = a2;
  else
    v5 = a1;
  v6 = 1 << *(_BYTE *)(v4 + 32);
  if (v6 < 64)
    v7 = ~(-1 << v6);
  else
    v7 = -1;
  v8 = v7 & *(_QWORD *)(v4 + 56);
  v32 = (unint64_t)(v6 + 63) >> 6;
  v33 = v4;
  v9 = v5 + 56;
  swift_bridgeObjectRetain();
  result = swift_bridgeObjectRetain();
  v11 = 0;
  while (1)
  {
    while (v8)
    {
      v12 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      v13 = v12 | (v11 << 6);
      if (*(_QWORD *)(v5 + 16))
        goto LABEL_29;
    }
    v14 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_48;
    }
    if (v14 >= v32)
      goto LABEL_44;
    v15 = *(_QWORD *)(v31 + 8 * v14);
    ++v11;
    if (!v15)
    {
      v11 = v14 + 1;
      if (v14 + 1 >= v32)
        goto LABEL_44;
      v15 = *(_QWORD *)(v31 + 8 * v11);
      if (!v15)
        break;
    }
LABEL_28:
    v8 = (v15 - 1) & v15;
    v13 = __clz(__rbit64(v15)) + (v11 << 6);
    if (*(_QWORD *)(v5 + 16))
    {
LABEL_29:
      v17 = (uint64_t *)(*(_QWORD *)(v33 + 48) + 16 * v13);
      v19 = *v17;
      v18 = v17[1];
      sub_23A2337F8();
      swift_bridgeObjectRetain();
      sub_23A233168();
      v20 = sub_23A23381C();
      v21 = -1 << *(_BYTE *)(v5 + 32);
      v22 = v20 & ~v21;
      if (((*(_QWORD *)(v9 + ((v22 >> 3) & 0xFFFFFFFFFFFFF8)) >> v22) & 1) != 0)
      {
        v23 = *(_QWORD *)(v5 + 48);
        v24 = (_QWORD *)(v23 + 16 * v22);
        v25 = *v24 == v19 && v24[1] == v18;
        if (v25 || (sub_23A233660() & 1) != 0)
        {
LABEL_43:
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_release();
          return 0;
        }
        v26 = ~v21;
        for (i = v22 + 1; ; i = v28 + 1)
        {
          v28 = i & v26;
          if (((*(_QWORD *)(v9 + (((i & v26) >> 3) & 0xFFFFFFFFFFFFF8)) >> (i & v26)) & 1) == 0)
            break;
          v29 = (_QWORD *)(v23 + 16 * v28);
          v30 = *v29 == v19 && v29[1] == v18;
          if (v30 || (sub_23A233660() & 1) != 0)
            goto LABEL_43;
        }
      }
      result = swift_bridgeObjectRelease();
    }
  }
  v16 = v14 + 2;
  if (v16 >= v32)
  {
LABEL_44:
    swift_release();
    swift_bridgeObjectRelease();
    return 1;
  }
  v15 = *(_QWORD *)(v31 + 8 * v16);
  if (v15)
  {
    v11 = v16;
    goto LABEL_28;
  }
  while (1)
  {
    v11 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v11 >= v32)
      goto LABEL_44;
    v15 = *(_QWORD *)(v31 + 8 * v11);
    ++v16;
    if (v15)
      goto LABEL_28;
  }
LABEL_48:
  __break(1u);
  return result;
}

uint64_t sub_23A20C20C(uint64_t a1, uint64_t a2, uint64_t a3)
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
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  void (*v19)(char *, unint64_t, uint64_t);
  uint64_t v20;
  uint64_t v21;
  uint64_t result;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  int64_t v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  BOOL v34;
  unint64_t v35;
  int64_t v36;
  void (*v37)(char *, unint64_t, uint64_t);
  unint64_t v38;
  char v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  char *v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  int64_t v49;
  __int128 v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  unint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char v59[16];
  uint64_t v60;
  uint64_t v61;

  v57 = a2;
  v61 = *MEMORY[0x24BDAC8D0];
  v6 = sub_23A232FE8();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v55 = (char *)&v48 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569535C0);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v48 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v48 - v13;
  v53 = a1 + OBJC_IVAR____TtC23DarwinDirectoryInternal11GroupRecord_uuid;
  v60 = a1 + OBJC_IVAR____TtC23DarwinDirectoryInternal11GroupRecord_uuid;
  if (!sub_23A20B658((uint64_t (*)(char *))sub_23A211C2C, (_BOOL8)v59, a3))
  {
    v23 = v3;
    v51 = a3;
    v24 = *(_QWORD *)(a1 + OBJC_IVAR____TtC23DarwinDirectoryInternal11GroupRecord_nestedGroups);
    v25 = *(_QWORD *)(v24 + 56);
    v48 = v24 + 56;
    v26 = 1 << *(_BYTE *)(v24 + 32);
    v27 = -1;
    if (v26 < 64)
      v27 = ~(-1 << v26);
    v28 = v27 & v25;
    v49 = (unint64_t)(v26 + 63) >> 6;
    v52 = v24;
    swift_bridgeObjectRetain();
    v29 = 0;
    v50 = xmmword_23A2349D0;
    if (!v28)
      goto LABEL_9;
LABEL_8:
    v56 = v23;
    v30 = __clz(__rbit64(v28));
    v31 = (v28 - 1) & v28;
    v32 = v30 | (v29 << 6);
    v33 = (uint64_t)v55;
    while (1)
    {
      v37 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
      v37(v14, *(_QWORD *)(v52 + 48) + *(_QWORD *)(v7 + 72) * v32, v6);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v14, 0, 1, v6);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v14, 1, v6) == 1)
        return swift_release();
      v54 = v31;
      (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(v33, v14, v6);
      if (!*(_QWORD *)(v57 + 16) || (v38 = sub_23A203D18(v33), (v39 & 1) == 0))
      {
        type metadata accessor for RecordStoreBuilderError();
        sub_23A1F58C8(&qword_2569523F8, (uint64_t (*)(uint64_t))type metadata accessor for RecordStoreBuilderError, (uint64_t)&unk_23A234AE0);
        swift_allocError();
        v45 = v44;
        v46 = v33;
        v47 = &v44[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256952408) + 48)];
        v37(v45, v53, v6);
        v37(v47, v46, v6);
        swift_storeEnumTagMultiPayload();
        swift_willThrow();
        (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v46, v6);
        return swift_release();
      }
      v40 = *(_QWORD *)(*(_QWORD *)(v57 + 56) + 8 * v38);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2569520B0);
      v41 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
      v42 = swift_allocObject();
      *(_OWORD *)(v42 + 16) = v50;
      v37((char *)(v42 + v41), v53, v6);
      v58 = v51;
      swift_retain();
      swift_bridgeObjectRetain();
      sub_23A20FE18(v42);
      v43 = v56;
      sub_23A20C20C(v40, v57, v58);
      v23 = v43;
      if (v43)
      {
        swift_release();
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v7 + 8))(v55, v6);
        return swift_release();
      }
      (*(void (**)(char *, uint64_t))(v7 + 8))(v55, v6);
      swift_release();
      swift_bridgeObjectRelease();
      v28 = v54;
      if (v54)
        goto LABEL_8;
LABEL_9:
      v34 = __OFADD__(v29++, 1);
      v33 = (uint64_t)v55;
      if (v34)
      {
        __break(1u);
        goto LABEL_36;
      }
      if (v29 >= v49)
        goto LABEL_34;
      v35 = *(_QWORD *)(v48 + 8 * v29);
      if (!v35)
      {
        v36 = v29 + 1;
        if (v29 + 1 >= v49)
          goto LABEL_34;
        v35 = *(_QWORD *)(v48 + 8 * v36);
        if (!v35)
        {
          v36 = v29 + 2;
          if (v29 + 2 >= v49)
            goto LABEL_34;
          v35 = *(_QWORD *)(v48 + 8 * v36);
          if (!v35)
          {
            v36 = v29 + 3;
            if (v29 + 3 >= v49)
            {
LABEL_34:
              (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v14, 1, 1, v6);
              return swift_release();
            }
            v35 = *(_QWORD *)(v48 + 8 * v36);
            if (!v35)
            {
              while (1)
              {
                v29 = v36 + 1;
                if (__OFADD__(v36, 1))
                  break;
                if (v29 >= v49)
                  goto LABEL_34;
                v35 = *(_QWORD *)(v48 + 8 * v29);
                ++v36;
                if (v35)
                  goto LABEL_19;
              }
LABEL_36:
              __break(1u);
            }
          }
        }
        v29 = v36;
      }
LABEL_19:
      v56 = v23;
      v31 = (v35 - 1) & v35;
      v32 = __clz(__rbit64(v35)) + (v29 << 6);
    }
  }
  v15 = type metadata accessor for RecordStoreBuilderError();
  sub_23A1F58C8(&qword_2569523F8, (uint64_t (*)(uint64_t))type metadata accessor for RecordStoreBuilderError, (uint64_t)&unk_23A234AE0);
  v56 = swift_allocError();
  if (*(_QWORD *)(a3 + 16))
  {
    v17 = v16;
    v57 = v15;
    v18 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
    v19 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    v19(v12, a3 + v18, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v12, 0, 1, v6);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v12, 1, v6) != 1)
    {
      v20 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256952410) + 48);
      (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(v17, v12, v6);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2569520B0);
      v21 = swift_allocObject();
      *(_OWORD *)(v21 + 16) = xmmword_23A2349D0;
      v19((char *)(v21 + v18), v53, v6);
      v58 = a3;
      swift_bridgeObjectRetain();
      sub_23A20FE18(v21);
      *(_QWORD *)(v17 + v20) = v58;
      swift_storeEnumTagMultiPayload();
      return swift_willThrow();
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v12, 1, 1, v6);
  }
  result = MEMORY[0x23B845920](v56);
  __break(1u);
  return result;
}

uint64_t sub_23A20C848(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;

  v5 = sub_23A232FE8();
  v6 = *(_QWORD *)(v5 - 8);
  result = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(_QWORD *)(a2 + 8);
  if ((v10 & 0xC000000000000001) != 0)
  {
    v11 = MEMORY[0x23B84508C](a3);
    goto LABEL_5;
  }
  if ((a3 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)((v10 & 0xFFFFFFFFFFFFF8) + 0x10) > a3)
  {
    v11 = *(_QWORD *)(v10 + 8 * a3 + 32);
    swift_retain();
LABEL_5:
    v12 = v11 + OBJC_IVAR____TtCV23DarwinDirectoryInternal11RecordStore16GroupStoreRecord_uuid;
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v9, v12, v5);
    swift_release();
    v13 = sub_23A232FC4();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
    return v13 & 1;
  }
  __break(1u);
  return result;
}

uint64_t sub_23A20C978(uint64_t *a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t result;
  uint64_t i;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char v19;
  uint64_t v20;

  v20 = MEMORY[0x24BEE4AF8];
  if (a2 >> 62)
  {
    swift_bridgeObjectRetain();
    result = sub_23A2333D8();
    v4 = result;
    if (!result)
      goto LABEL_15;
  }
  else
  {
    v4 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (!v4)
      goto LABEL_15;
  }
  if (v4 < 1)
  {
    __break(1u);
    goto LABEL_33;
  }
  if ((a2 & 0xC000000000000001) != 0)
  {
    for (i = 0; i != v4; ++i)
    {
      if (*(_QWORD *)(*(_QWORD *)(MEMORY[0x23B84508C](i, a2)
                                 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_aliases)
                     + 16))
      {
        sub_23A23336C();
        sub_23A233390();
        sub_23A23339C();
        sub_23A233378();
      }
      else
      {
        swift_unknownObjectRelease();
      }
    }
  }
  else
  {
    v7 = 0;
    v8 = OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_aliases;
    do
    {
      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a2 + 8 * v7 + 32) + v8) + 16))
      {
        swift_retain();
        sub_23A23336C();
        sub_23A233390();
        sub_23A23339C();
        sub_23A233378();
        v8 = OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_aliases;
      }
      ++v7;
    }
    while (v4 != v7);
  }
LABEL_15:
  swift_bridgeObjectRelease();
  if ((v20 & 0x8000000000000000) == 0 && (v20 & 0x4000000000000000) == 0)
  {
    v9 = *(_QWORD *)(v20 + 16);
    result = swift_retain();
    if (v9)
      goto LABEL_18;
    return swift_release_n();
  }
  swift_retain();
  result = sub_23A2333D8();
  v9 = result;
  if (!result)
    return swift_release_n();
LABEL_18:
  if (v9 >= 1)
  {
    v10 = 0;
    do
    {
      if ((v20 & 0xC000000000000001) != 0)
      {
        v14 = MEMORY[0x23B84508C](v10, v20);
      }
      else
      {
        v14 = *(_QWORD *)(v20 + 8 * v10 + 32);
        swift_retain();
      }
      v15 = *a1;
      if (*(_QWORD *)(*a1 + 16))
      {
        v17 = *(_QWORD *)(v14 + 24);
        v16 = *(_QWORD *)(v14 + 32);
        swift_bridgeObjectRetain();
        v18 = sub_23A203DB0(v17, v16);
        if ((v19 & 1) != 0)
          v11 = *(_QWORD *)(*(_QWORD *)(v15 + 56) + 8 * v18);
        else
          v11 = 0;
        v12 = v19 ^ 1;
        swift_bridgeObjectRelease();
      }
      else
      {
        v11 = 0;
        v12 = 1;
      }
      ++v10;
      v13 = swift_bridgeObjectRetain();
      sub_23A20CEF8(v13, a1, v11, v12 & 1);
      swift_release();
      swift_bridgeObjectRelease();
    }
    while (v9 != v10);
    return swift_release_n();
  }
LABEL_33:
  __break(1u);
  return result;
}

uint64_t sub_23A20CC38(uint64_t *a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t result;
  uint64_t i;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char v19;
  uint64_t v20;

  v20 = MEMORY[0x24BEE4AF8];
  if (a2 >> 62)
  {
    swift_bridgeObjectRetain();
    result = sub_23A2333D8();
    v4 = result;
    if (!result)
      goto LABEL_15;
  }
  else
  {
    v4 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (!v4)
      goto LABEL_15;
  }
  if (v4 < 1)
  {
    __break(1u);
    goto LABEL_33;
  }
  if ((a2 & 0xC000000000000001) != 0)
  {
    for (i = 0; i != v4; ++i)
    {
      if (*(_QWORD *)(*(_QWORD *)(MEMORY[0x23B84508C](i, a2)
                                 + OBJC_IVAR____TtC23DarwinDirectoryInternal11GroupRecord_aliases)
                     + 16))
      {
        sub_23A23336C();
        sub_23A233390();
        sub_23A23339C();
        sub_23A233378();
      }
      else
      {
        swift_unknownObjectRelease();
      }
    }
  }
  else
  {
    v7 = 0;
    v8 = OBJC_IVAR____TtC23DarwinDirectoryInternal11GroupRecord_aliases;
    do
    {
      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a2 + 8 * v7 + 32) + v8) + 16))
      {
        swift_retain();
        sub_23A23336C();
        sub_23A233390();
        sub_23A23339C();
        sub_23A233378();
        v8 = OBJC_IVAR____TtC23DarwinDirectoryInternal11GroupRecord_aliases;
      }
      ++v7;
    }
    while (v4 != v7);
  }
LABEL_15:
  swift_bridgeObjectRelease();
  if ((v20 & 0x8000000000000000) == 0 && (v20 & 0x4000000000000000) == 0)
  {
    v9 = *(_QWORD *)(v20 + 16);
    result = swift_retain();
    if (v9)
      goto LABEL_18;
    return swift_release_n();
  }
  swift_retain();
  result = sub_23A2333D8();
  v9 = result;
  if (!result)
    return swift_release_n();
LABEL_18:
  if (v9 >= 1)
  {
    v10 = 0;
    do
    {
      if ((v20 & 0xC000000000000001) != 0)
      {
        v14 = MEMORY[0x23B84508C](v10, v20);
      }
      else
      {
        v14 = *(_QWORD *)(v20 + 8 * v10 + 32);
        swift_retain();
      }
      v15 = *a1;
      if (*(_QWORD *)(*a1 + 16))
      {
        v17 = *(_QWORD *)(v14 + 40);
        v16 = *(_QWORD *)(v14 + 48);
        swift_bridgeObjectRetain();
        v18 = sub_23A203DB0(v17, v16);
        if ((v19 & 1) != 0)
          v11 = *(_QWORD *)(*(_QWORD *)(v15 + 56) + 8 * v18);
        else
          v11 = 0;
        v12 = v19 ^ 1;
        swift_bridgeObjectRelease();
      }
      else
      {
        v11 = 0;
        v12 = 1;
      }
      ++v10;
      v13 = swift_bridgeObjectRetain();
      sub_23A20CEF8(v13, a1, v11, v12 & 1);
      swift_release();
      swift_bridgeObjectRelease();
    }
    while (v9 != v10);
    return swift_release_n();
  }
LABEL_33:
  __break(1u);
  return result;
}

uint64_t sub_23A20CEF8(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  int64_t v11;
  unint64_t v12;
  unint64_t i;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  char v24;
  unint64_t v25;
  uint64_t v26;
  _BOOL8 v27;
  uint64_t v28;
  char v29;
  unint64_t v30;
  char v31;
  _QWORD *v32;
  unint64_t v33;
  char v34;
  char v35;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  BOOL v40;
  uint64_t v41;
  uint64_t result;
  uint64_t v43;
  uint64_t v45;
  int64_t v46;
  int64_t v47;
  _QWORD *v48;
  uint64_t v49;

  v6 = a1;
  v45 = a1 + 56;
  v7 = 1 << *(_BYTE *)(a1 + 32);
  v8 = -1;
  if (v7 < 64)
    v8 = ~(-1 << v7);
  v9 = v8 & *(_QWORD *)(a1 + 56);
  v46 = (unint64_t)(v7 + 63) >> 6;
  v10 = swift_bridgeObjectRetain();
  v11 = 0;
  v43 = v10;
  if (v9)
    goto LABEL_6;
LABEL_7:
  while (2)
  {
    v14 = v11 + 1;
    if (!__OFADD__(v11, 1))
    {
      if (v14 < v46)
      {
        v15 = *(_QWORD *)(v45 + 8 * v14);
        v16 = v11 + 1;
        if (v15)
          goto LABEL_22;
        v16 = v11 + 2;
        if (v11 + 2 >= v46)
          return swift_release();
        v15 = *(_QWORD *)(v45 + 8 * v16);
        if (v15)
          goto LABEL_22;
        v16 = v11 + 3;
        if (v11 + 3 >= v46)
          return swift_release();
        v15 = *(_QWORD *)(v45 + 8 * v16);
        if (v15)
          goto LABEL_22;
        v16 = v11 + 4;
        if (v11 + 4 >= v46)
          return swift_release();
        v15 = *(_QWORD *)(v45 + 8 * v16);
        if (v15)
        {
LABEL_22:
          v9 = (v15 - 1) & v15;
          v47 = v16;
          for (i = __clz(__rbit64(v15)) + (v16 << 6); ; i = v12 | (v11 << 6))
          {
            v18 = (uint64_t *)(*(_QWORD *)(v6 + 48) + 16 * i);
            v20 = *v18;
            v19 = v18[1];
            if ((a4 & 1) == 0)
              break;
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            v33 = sub_23A203DB0(v20, v19);
            v35 = v34;
            swift_bridgeObjectRelease();
            if ((v35 & 1) != 0)
            {
              isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
              v37 = *a2;
              v49 = *a2;
              *a2 = 0x8000000000000000;
              if ((isUniquelyReferenced_nonNull_native & 1) == 0)
              {
                sub_23A204CFC();
                v37 = v49;
              }
              swift_bridgeObjectRelease();
              sub_23A20D844(v33, v37);
              *a2 = v37;
              swift_bridgeObjectRelease();
            }
            swift_bridgeObjectRelease();
            v11 = v47;
            if (!v9)
              goto LABEL_7;
LABEL_6:
            v12 = __clz(__rbit64(v9));
            v9 &= v9 - 1;
            v47 = v11;
          }
          v21 = a4;
          swift_bridgeObjectRetain_n();
          v22 = swift_isUniquelyReferenced_nonNull_native();
          v23 = *a2;
          v48 = (_QWORD *)*a2;
          *a2 = 0x8000000000000000;
          v25 = sub_23A203DB0(v20, v19);
          v26 = *(_QWORD *)(v23 + 16);
          v27 = (v24 & 1) == 0;
          v28 = v26 + v27;
          if (__OFADD__(v26, v27))
          {
            __break(1u);
            break;
          }
          v29 = v24;
          if (*(_QWORD *)(v23 + 24) < v28)
          {
            sub_23A204228(v28, v22);
            v30 = sub_23A203DB0(v20, v19);
            if ((v29 & 1) != (v31 & 1))
              goto LABEL_46;
            v25 = v30;
            v32 = v48;
            if ((v29 & 1) == 0)
              goto LABEL_37;
LABEL_35:
            *(_QWORD *)(v32[7] + 8 * v25) = a3;
            goto LABEL_39;
          }
          if ((v22 & 1) != 0)
          {
            v32 = v48;
            if ((v24 & 1) != 0)
              goto LABEL_35;
          }
          else
          {
            sub_23A204CFC();
            v32 = v48;
            if ((v29 & 1) != 0)
              goto LABEL_35;
          }
LABEL_37:
          v32[(v25 >> 6) + 8] |= 1 << v25;
          v38 = (uint64_t *)(v32[6] + 16 * v25);
          *v38 = v20;
          v38[1] = v19;
          *(_QWORD *)(v32[7] + 8 * v25) = a3;
          v39 = v32[2];
          v40 = __OFADD__(v39, 1);
          v41 = v39 + 1;
          if (v40)
            goto LABEL_44;
          v32[2] = v41;
          swift_bridgeObjectRetain();
LABEL_39:
          *a2 = (uint64_t)v32;
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease();
          a4 = v21;
          v6 = v43;
          v11 = v47;
          if (!v9)
            continue;
          goto LABEL_6;
        }
        v17 = v11 + 5;
        if (v11 + 5 < v46)
        {
          v15 = *(_QWORD *)(v45 + 8 * v17);
          if (v15)
          {
            v16 = v11 + 5;
            goto LABEL_22;
          }
          while (1)
          {
            v16 = v17 + 1;
            if (__OFADD__(v17, 1))
              goto LABEL_45;
            if (v16 >= v46)
              return swift_release();
            v15 = *(_QWORD *)(v45 + 8 * v16);
            ++v17;
            if (v15)
              goto LABEL_22;
          }
        }
      }
      return swift_release();
    }
    break;
  }
  __break(1u);
LABEL_44:
  __break(1u);
LABEL_45:
  __break(1u);
LABEL_46:
  result = sub_23A2337BC();
  __break(1u);
  return result;
}

uint64_t sub_23A20D2AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  unint64_t v12;
  void (*v13)(char *, unint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  void (*v18)(char *, uint64_t);
  BOOL v20;
  uint64_t v22;
  uint64_t v23;

  v4 = sub_23A232FE8();
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v10 = (char *)&v22 - v9;
  v11 = *(_QWORD *)(a1 + 16);
  if (v11 == *(_QWORD *)(a2 + 16))
  {
    if (!v11 || a1 == a2)
    {
      v17 = 1;
    }
    else
    {
      v12 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
      v22 = *(_QWORD *)(v8 + 72);
      v23 = v8;
      v13 = *(void (**)(char *, unint64_t, uint64_t))(v8 + 16);
      v14 = v11 - 1;
      do
      {
        v15 = a1;
        v13(v10, a1 + v12, v4);
        v16 = a2;
        v13(v7, a2 + v12, v4);
        sub_23A1F58C8(&qword_256951FE0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA98]);
        v17 = sub_23A233114();
        v18 = *(void (**)(char *, uint64_t))(v23 + 8);
        v18(v7, v4);
        v18(v10, v4);
        v20 = v14-- != 0;
        if ((v17 & 1) == 0)
          break;
        v12 += v22;
        a2 = v16;
        a1 = v15;
      }
      while (v20);
    }
  }
  else
  {
    v17 = 0;
  }
  return v17 & 1;
}

uint64_t sub_23A20D430(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_23A20D664(a1, a2, a3, (_QWORD *)*v3, &qword_256952430, (uint64_t (*)(_QWORD))MEMORY[0x24BEE60D8]);
  *v3 = result;
  return result;
}

uint64_t sub_23A20D45C(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_23A20D664(a1, a2, a3, (_QWORD *)*v3, &qword_256952428, type metadata accessor for Group);
  *v3 = result;
  return result;
}

uint64_t sub_23A20D488(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_23A20D664(a1, a2, a3, (_QWORD *)*v3, &qword_2569520B8, type metadata accessor for User);
  *v3 = result;
  return result;
}

uint64_t sub_23A20D4B4(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_23A20D4FC(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_23A20D4D0(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_23A20D664(a1, a2, a3, (_QWORD *)*v3, &qword_2569520B0, (uint64_t (*)(_QWORD))MEMORY[0x24BDCEA58]);
  *v3 = result;
  return result;
}

uint64_t sub_23A20D4FC(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
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
        goto LABEL_32;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569520A8);
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
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_23A233408();
  __break(1u);
  return result;
}

uint64_t sub_23A20D664(char a1, int64_t a2, char a3, _QWORD *a4, uint64_t *a5, uint64_t (*a6)(_QWORD))
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
  result = sub_23A233408();
  __break(1u);
  return result;
}

unint64_t sub_23A20D844(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _OWORD *v12;
  _OWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_23A2332B8();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_23A2337F8();
        swift_bridgeObjectRetain();
        sub_23A233168();
        v9 = sub_23A23381C();
        result = swift_bridgeObjectRelease();
        v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8)
            goto LABEL_5;
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          v11 = *(_QWORD *)(a2 + 48);
          v12 = (_OWORD *)(v11 + 16 * v3);
          v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1)
            *v12 = *v13;
          v14 = *(_QWORD *)(a2 + 56);
          v15 = (_QWORD *)(v14 + 8 * v3);
          v16 = (_QWORD *)(v14 + 8 * v6);
          if (v3 != v6 || (v3 = v6, v15 >= v16 + 1))
          {
            *v15 = *v16;
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v18 = *v17;
    v19 = (-1 << v3) - 1;
  }
  else
  {
    v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    v19 = *v17;
    v18 = (-1 << result) - 1;
  }
  *v17 = v19 & v18;
  v20 = *(_QWORD *)(a2 + 16);
  v21 = __OFSUB__(v20, 1);
  v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_23A20DA18(_QWORD **a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5[2];

  v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_23A20511C(v2);
  v3 = v2[2];
  v5[0] = (uint64_t)(v2 + 4);
  v5[1] = v3;
  result = sub_23A20DA84(v5);
  *a1 = v2;
  return result;
}

uint64_t sub_23A20DA84(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  int v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  BOOL v39;
  unint64_t v40;
  unint64_t v41;
  char *v42;
  char *v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  BOOL v55;
  unint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  BOOL v65;
  uint64_t v66;
  char v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  BOOL v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  unint64_t v83;
  uint64_t v84;
  char *v85;
  char *v86;
  uint64_t v87;
  char *v88;
  unint64_t v89;
  char *v90;
  uint64_t v91;
  uint64_t v92;
  unint64_t v93;
  char *v94;
  uint64_t v95;
  unint64_t v96;
  char *v97;
  uint64_t v98;
  uint64_t v99;
  char *v100;
  unint64_t v101;
  uint64_t *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  char *__dst;

  v3 = a1[1];
  result = sub_23A2334D4();
  if (result >= v3)
  {
    if (v3 < 0)
      goto LABEL_152;
    if (v3)
      return sub_23A20E16C(0, v3, 1, a1);
    return result;
  }
  if (v3 >= 0)
    v5 = v3;
  else
    v5 = v3 + 1;
  if (v3 < -1)
    goto LABEL_160;
  v105 = result;
  v102 = a1;
  if (v3 < 2)
  {
    v8 = MEMORY[0x24BEE4AF8];
    __dst = (char *)(MEMORY[0x24BEE4AF8] + 32);
    if (v3 != 1)
    {
      v12 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
      v11 = (char *)MEMORY[0x24BEE4AF8];
LABEL_118:
      v94 = v11;
      v104 = v8;
      if (v12 >= 2)
      {
        v95 = *v102;
        do
        {
          v96 = v12 - 2;
          if (v12 < 2)
            goto LABEL_147;
          if (!v95)
            goto LABEL_159;
          v97 = v94;
          v98 = *(_QWORD *)&v94[16 * v96 + 32];
          v99 = *(_QWORD *)&v94[16 * v12 + 24];
          sub_23A20E238((char *)(v95 + 16 * v98), (char *)(v95 + 16 * *(_QWORD *)&v94[16 * v12 + 16]), v95 + 16 * v99, __dst);
          if (v1)
            break;
          if (v99 < v98)
            goto LABEL_148;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v97 = sub_23A20E670((uint64_t)v97);
          if (v96 >= *((_QWORD *)v97 + 2))
            goto LABEL_149;
          v100 = &v97[16 * v96 + 32];
          *(_QWORD *)v100 = v98;
          *((_QWORD *)v100 + 1) = v99;
          v101 = *((_QWORD *)v97 + 2);
          if (v12 > v101)
            goto LABEL_150;
          memmove(&v97[16 * v12 + 16], &v97[16 * v12 + 32], 16 * (v101 - v12));
          v94 = v97;
          *((_QWORD *)v97 + 2) = v101 - 1;
          v12 = v101 - 1;
        }
        while (v101 > 2);
      }
LABEL_115:
      swift_bridgeObjectRelease();
      *(_QWORD *)(v104 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
    v104 = MEMORY[0x24BEE4AF8];
  }
  else
  {
    v6 = v5 >> 1;
    v7 = sub_23A2331EC();
    *(_QWORD *)(v7 + 16) = v6;
    v104 = v7;
    __dst = (char *)(v7 + 32);
  }
  v9 = 0;
  v10 = *a1;
  v103 = v10 + 8;
  v11 = (char *)MEMORY[0x24BEE4AF8];
  v106 = v3;
  while (1)
  {
    v13 = v9++;
    if (v9 >= v3)
      goto LABEL_46;
    v14 = (uint64_t *)(v10 + 16 * v9);
    v15 = *v14;
    v16 = v14[1];
    v17 = (_QWORD *)(v10 + 16 * v13);
    if (v15 == *v17 && v16 == v17[1])
    {
      v20 = v13 + 2;
      if (v13 + 2 >= v3)
        goto LABEL_45;
      v19 = 0;
    }
    else
    {
      v19 = sub_23A233660();
      v20 = v13 + 2;
      if (v13 + 2 >= v3)
        goto LABEL_36;
    }
    v21 = (_QWORD *)(v103 + 16 * v20);
    do
    {
      v23 = (_QWORD *)(v10 + 16 * v9);
      if (*(v21 - 1) == *v23 && *v21 == v23[1])
      {
        if ((v19 & 1) != 0)
          goto LABEL_37;
      }
      else if (((v19 ^ sub_23A233660()) & 1) != 0)
      {
        goto LABEL_36;
      }
      v21 += 2;
      v22 = v20 + 1;
      v9 = v20;
      v20 = v22;
    }
    while (v22 < v3);
    v20 = v22;
LABEL_36:
    v9 = v20;
    if ((v19 & 1) != 0)
    {
LABEL_37:
      if (v20 < v13)
        goto LABEL_155;
      if (v13 < v20)
      {
        v25 = 16 * v20;
        v26 = 16 * v13;
        v27 = v20;
        v28 = v13;
        do
        {
          if (v28 != --v27)
          {
            if (!v10)
              goto LABEL_158;
            v29 = v10 + v25;
            v30 = *(_QWORD *)(v10 + v26);
            v31 = *(_QWORD *)(v10 + v26 + 8);
            *(_OWORD *)(v10 + v26) = *(_OWORD *)(v10 + v25 - 16);
            *(_QWORD *)(v29 - 16) = v30;
            *(_QWORD *)(v29 - 8) = v31;
          }
          ++v28;
          v25 -= 16;
          v26 += 16;
        }
        while (v28 < v27);
      }
LABEL_45:
      v9 = v20;
    }
LABEL_46:
    if (v9 < v3)
    {
      if (__OFSUB__(v9, v13))
        goto LABEL_151;
      if (v9 - v13 < v105)
        break;
    }
LABEL_67:
    if (v9 < v13)
      goto LABEL_146;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v11 = sub_23A20E4D0(0, *((_QWORD *)v11 + 2) + 1, 1, v11);
    v41 = *((_QWORD *)v11 + 2);
    v40 = *((_QWORD *)v11 + 3);
    v12 = v41 + 1;
    if (v41 >= v40 >> 1)
      v11 = sub_23A20E4D0((char *)(v40 > 1), v41 + 1, 1, v11);
    *((_QWORD *)v11 + 2) = v12;
    v42 = v11 + 32;
    v43 = &v11[16 * v41 + 32];
    *(_QWORD *)v43 = v13;
    *((_QWORD *)v43 + 1) = v9;
    if (v41)
    {
      v107 = v9;
      while (1)
      {
        v44 = v12 - 1;
        if (v12 >= 4)
        {
          v49 = &v42[16 * v12];
          v50 = *((_QWORD *)v49 - 8);
          v51 = *((_QWORD *)v49 - 7);
          v55 = __OFSUB__(v51, v50);
          v52 = v51 - v50;
          if (v55)
            goto LABEL_135;
          v54 = *((_QWORD *)v49 - 6);
          v53 = *((_QWORD *)v49 - 5);
          v55 = __OFSUB__(v53, v54);
          v47 = v53 - v54;
          v48 = v55;
          if (v55)
            goto LABEL_136;
          v56 = v12 - 2;
          v57 = &v42[16 * v12 - 32];
          v59 = *(_QWORD *)v57;
          v58 = *((_QWORD *)v57 + 1);
          v55 = __OFSUB__(v58, v59);
          v60 = v58 - v59;
          if (v55)
            goto LABEL_138;
          v55 = __OFADD__(v47, v60);
          v61 = v47 + v60;
          if (v55)
            goto LABEL_141;
          if (v61 >= v52)
          {
            v79 = &v42[16 * v44];
            v81 = *(_QWORD *)v79;
            v80 = *((_QWORD *)v79 + 1);
            v55 = __OFSUB__(v80, v81);
            v82 = v80 - v81;
            if (v55)
              goto LABEL_145;
            v72 = v47 < v82;
            goto LABEL_105;
          }
        }
        else
        {
          if (v12 != 3)
          {
            v73 = *((_QWORD *)v11 + 4);
            v74 = *((_QWORD *)v11 + 5);
            v55 = __OFSUB__(v74, v73);
            v66 = v74 - v73;
            v67 = v55;
            goto LABEL_99;
          }
          v46 = *((_QWORD *)v11 + 4);
          v45 = *((_QWORD *)v11 + 5);
          v55 = __OFSUB__(v45, v46);
          v47 = v45 - v46;
          v48 = v55;
        }
        if ((v48 & 1) != 0)
          goto LABEL_137;
        v56 = v12 - 2;
        v62 = &v42[16 * v12 - 32];
        v64 = *(_QWORD *)v62;
        v63 = *((_QWORD *)v62 + 1);
        v65 = __OFSUB__(v63, v64);
        v66 = v63 - v64;
        v67 = v65;
        if (v65)
          goto LABEL_140;
        v68 = &v42[16 * v44];
        v70 = *(_QWORD *)v68;
        v69 = *((_QWORD *)v68 + 1);
        v55 = __OFSUB__(v69, v70);
        v71 = v69 - v70;
        if (v55)
          goto LABEL_143;
        if (__OFADD__(v66, v71))
          goto LABEL_144;
        if (v66 + v71 >= v47)
        {
          v72 = v47 < v71;
LABEL_105:
          if (v72)
            v44 = v56;
          goto LABEL_107;
        }
LABEL_99:
        if ((v67 & 1) != 0)
          goto LABEL_139;
        v75 = &v42[16 * v44];
        v77 = *(_QWORD *)v75;
        v76 = *((_QWORD *)v75 + 1);
        v55 = __OFSUB__(v76, v77);
        v78 = v76 - v77;
        if (v55)
          goto LABEL_142;
        if (v78 < v66)
          goto LABEL_15;
LABEL_107:
        v83 = v44 - 1;
        if (v44 - 1 >= v12)
        {
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
          __break(1u);
LABEL_150:
          __break(1u);
LABEL_151:
          __break(1u);
LABEL_152:
          __break(1u);
LABEL_153:
          __break(1u);
          goto LABEL_154;
        }
        v84 = v10;
        if (!v10)
          goto LABEL_157;
        v85 = v11;
        v86 = &v42[16 * v83];
        v87 = *(_QWORD *)v86;
        v88 = v42;
        v89 = v44;
        v90 = &v42[16 * v44];
        v91 = *((_QWORD *)v90 + 1);
        v92 = v84;
        sub_23A20E238((char *)(v84 + 16 * *(_QWORD *)v86), (char *)(v84 + 16 * *(_QWORD *)v90), v84 + 16 * v91, __dst);
        if (v1)
          goto LABEL_115;
        if (v91 < v87)
          goto LABEL_132;
        if (v89 > *((_QWORD *)v85 + 2))
          goto LABEL_133;
        *(_QWORD *)v86 = v87;
        *(_QWORD *)&v88[16 * v83 + 8] = v91;
        v93 = *((_QWORD *)v85 + 2);
        if (v89 >= v93)
          goto LABEL_134;
        v11 = v85;
        v12 = v93 - 1;
        memmove(v90, v90 + 16, 16 * (v93 - 1 - v89));
        v42 = v88;
        *((_QWORD *)v85 + 2) = v93 - 1;
        v10 = v92;
        v9 = v107;
        if (v93 <= 2)
          goto LABEL_15;
      }
    }
    v12 = 1;
LABEL_15:
    v3 = v106;
    if (v9 >= v106)
    {
      v8 = v104;
      goto LABEL_118;
    }
  }
  if (__OFADD__(v13, v105))
    goto LABEL_153;
  if (v13 + v105 >= v3)
    v32 = v3;
  else
    v32 = v13 + v105;
  if (v32 >= v13)
  {
    if (v9 != v32)
    {
      v33 = (_QWORD *)(v10 + 16 * v9);
      do
      {
        v34 = (uint64_t *)(v10 + 16 * v9);
        v35 = *v34;
        v36 = v34[1];
        v37 = v13;
        v38 = v33;
        do
        {
          v39 = v35 == *(v38 - 2) && v36 == *(v38 - 1);
          if (v39 || (sub_23A233660() & 1) == 0)
            break;
          if (!v10)
            goto LABEL_156;
          v35 = *v38;
          v36 = v38[1];
          *(_OWORD *)v38 = *((_OWORD *)v38 - 1);
          *(v38 - 1) = v36;
          *(v38 - 2) = v35;
          v38 -= 2;
          ++v37;
        }
        while (v9 != v37);
        ++v9;
        v33 += 2;
      }
      while (v9 != v32);
      v9 = v32;
    }
    goto LABEL_67;
  }
LABEL_154:
  __break(1u);
LABEL_155:
  __break(1u);
LABEL_156:
  __break(1u);
LABEL_157:
  __break(1u);
LABEL_158:
  __break(1u);
LABEL_159:
  __break(1u);
LABEL_160:
  result = sub_23A2333C0();
  __break(1u);
  return result;
}

uint64_t sub_23A20E16C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  BOOL v13;

  if (a3 != a2)
  {
    v4 = a3;
    v6 = result;
    v7 = *a4;
    v8 = *a4 + 16 * a3;
LABEL_5:
    v9 = (uint64_t *)(v7 + 16 * v4);
    result = *v9;
    v10 = v9[1];
    v11 = v6;
    v12 = (uint64_t *)v8;
    while (1)
    {
      v13 = result == *(v12 - 2) && v10 == *(v12 - 1);
      if (v13 || (result = sub_23A233660(), (result & 1) == 0))
      {
LABEL_4:
        ++v4;
        v8 += 16;
        if (v4 == a2)
          return result;
        goto LABEL_5;
      }
      if (!v7)
        break;
      result = *v12;
      v10 = v12[1];
      *(_OWORD *)v12 = *((_OWORD *)v12 - 1);
      *(v12 - 1) = v10;
      *(v12 - 2) = result;
      v12 -= 2;
      if (v4 == ++v11)
        goto LABEL_4;
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_23A20E238(char *__src, char *a2, unint64_t a3, char *__dst)
{
  char *v4;
  char *v6;
  char *v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  BOOL v15;
  char *v16;
  char *v17;
  char *v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  uint64_t result;
  char *v25;
  char *v26;
  char *v27;

  v4 = __dst;
  v6 = a2;
  v7 = __src;
  v8 = a2 - __src;
  v9 = a2 - __src + 15;
  if (a2 - __src >= 0)
    v9 = a2 - __src;
  v10 = v9 >> 4;
  v11 = a3 - (_QWORD)a2;
  v12 = a3 - (_QWORD)a2 + 15;
  if ((uint64_t)(a3 - (_QWORD)a2) >= 0)
    v12 = a3 - (_QWORD)a2;
  v13 = v12 >> 4;
  v27 = __src;
  v26 = __dst;
  if (v10 >= v12 >> 4)
  {
    if (v11 >= -15)
    {
      if (__dst != a2 || &a2[16 * v13] <= __dst)
        memmove(__dst, a2, 16 * v13);
      v17 = &v4[16 * v13];
      v25 = v17;
      v27 = v6;
      if (v7 < v6 && v11 >= 16)
      {
        v18 = (char *)(a3 - 16);
        v19 = v6;
        while (1)
        {
          v20 = v18 + 16;
          v21 = *((_QWORD *)v19 - 2);
          v22 = *((_QWORD *)v19 - 1);
          v19 -= 16;
          v23 = *((_QWORD *)v17 - 2) == v21 && *((_QWORD *)v17 - 1) == v22;
          if (v23 || (sub_23A233660() & 1) == 0)
          {
            v25 = v17 - 16;
            if (v20 < v17 || v18 >= v17 || v20 != v17)
              *(_OWORD *)v18 = *((_OWORD *)v17 - 1);
            v19 = v6;
            v17 -= 16;
            if (v6 <= v7)
              goto LABEL_50;
          }
          else
          {
            if (v20 != v6 || v18 >= v6)
              *(_OWORD *)v18 = *(_OWORD *)v19;
            v27 = v19;
            if (v19 <= v7)
              goto LABEL_50;
          }
          v18 -= 16;
          v6 = v19;
          if (v17 <= v4)
            goto LABEL_50;
        }
      }
      goto LABEL_50;
    }
  }
  else if (v8 >= -15)
  {
    if (__dst != __src || &__src[16 * v10] <= __dst)
      memmove(__dst, __src, 16 * v10);
    v14 = &v4[16 * v10];
    v25 = v14;
    if ((unint64_t)v6 < a3 && v8 >= 16)
    {
      do
      {
        v15 = *(_QWORD *)v6 == *(_QWORD *)v4 && *((_QWORD *)v6 + 1) == *((_QWORD *)v4 + 1);
        if (v15 || (sub_23A233660() & 1) == 0)
        {
          if (v7 != v4)
            *(_OWORD *)v7 = *(_OWORD *)v4;
          v4 += 16;
          v26 = v4;
          v16 = v6;
        }
        else
        {
          v16 = v6 + 16;
          if (v7 < v6 || v7 >= v16 || v7 != v6)
            *(_OWORD *)v7 = *(_OWORD *)v6;
        }
        v7 += 16;
        if (v4 >= v14)
          break;
        v6 = v16;
      }
      while ((unint64_t)v16 < a3);
      v27 = v7;
    }
LABEL_50:
    sub_23A20E5C8((void **)&v27, (const void **)&v26, &v25);
    return 1;
  }
  result = sub_23A233408();
  __break(1u);
  return result;
}

char *sub_23A20E4D0(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569523E8);
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

char *sub_23A20E5C8(void **a1, const void **a2, _QWORD *a3)
{
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *result;
  uint64_t v7;

  v3 = (char *)*a2;
  v4 = *a3 - (_QWORD)v3;
  v5 = v4 + 15;
  if (v4 >= 0)
    v5 = *a3 - (_QWORD)v3;
  if (v4 <= -16)
  {
    result = (char *)sub_23A233408();
    __break(1u);
  }
  else
  {
    result = (char *)*a1;
    v7 = v5 >> 4;
    if (result != v3 || result >= &v3[16 * v7])
      return (char *)memmove(result, v3, 16 * v7);
  }
  return result;
}

char *sub_23A20E670(uint64_t a1)
{
  return sub_23A20E4D0(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_23A20E684(uint64_t a1, char *a2)
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
  v6 = sub_23A232FE8();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *v3;
  sub_23A1F58C8((unint64_t *)&qword_256951B90, v11, MEMORY[0x24BDCEA88]);
  swift_bridgeObjectRetain();
  v31 = a2;
  v12 = sub_23A2330F0();
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
      sub_23A1F58C8(&qword_256951FE0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA98]);
      v21 = sub_23A233114();
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
    sub_23A20F0D4((uint64_t)v9, v14, isUniquelyReferenced_nonNull_native);
    *v3 = v32;
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, char *, uint64_t))(v23 + 32))(a1, v25, v6);
    return 1;
  }
}

uint64_t sub_23A20E8E0(uint64_t *a1, uint64_t a2, uint64_t a3)
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
  sub_23A2337F8();
  swift_bridgeObjectRetain();
  sub_23A233168();
  v8 = sub_23A23381C();
  v9 = -1 << *(_BYTE *)(v7 + 32);
  v10 = v8 & ~v9;
  if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = *(_QWORD *)(v7 + 48);
    v12 = (_QWORD *)(v11 + 16 * v10);
    v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_23A233660() & 1) != 0)
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
      if (v19 || (sub_23A233660() & 1) != 0)
        goto LABEL_7;
    }
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v21 = *v3;
  *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_23A20F2D8(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_23A20EA8C()
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
  v2 = sub_23A232FE8();
  v36 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v33 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256952418);
  v6 = sub_23A2332DC();
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
      sub_23A1F58C8((unint64_t *)&qword_256951B90, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
      result = sub_23A2330F0();
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

uint64_t sub_23A20EDF8()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569523F0);
  v3 = sub_23A2332DC();
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
      sub_23A2337F8();
      sub_23A233168();
      result = sub_23A23381C();
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

uint64_t sub_23A20F0D4(uint64_t a1, unint64_t a2, char a3)
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
  v6 = sub_23A232FE8();
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
    sub_23A20EA8C();
  }
  else
  {
    if (v11 > v10)
    {
      sub_23A20F470();
      goto LABEL_12;
    }
    sub_23A20F844();
  }
  v12 = *v3;
  sub_23A1F58C8((unint64_t *)&qword_256951B90, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  v13 = sub_23A2330F0();
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
      sub_23A1F58C8(&qword_256951FE0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA98]);
      v18 = sub_23A233114();
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
  result = sub_23A2337B0();
  __break(1u);
  return result;
}

uint64_t sub_23A20F2D8(uint64_t result, uint64_t a2, unint64_t a3, char a4)
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
    sub_23A20EDF8();
  }
  else
  {
    if (v10 > v9)
    {
      result = (uint64_t)sub_23A20F694();
      goto LABEL_22;
    }
    sub_23A20FB6C();
  }
  v11 = *v4;
  sub_23A2337F8();
  sub_23A233168();
  result = sub_23A23381C();
  v12 = -1 << *(_BYTE *)(v11 + 32);
  a3 = result & ~v12;
  v13 = v11 + 56;
  if (((*(_QWORD *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
  {
    v14 = *(_QWORD *)(v11 + 48);
    v15 = (_QWORD *)(v14 + 16 * a3);
    v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (result = sub_23A233660(), (result & 1) != 0))
    {
LABEL_21:
      result = sub_23A2337B0();
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
          result = sub_23A233660();
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

void *sub_23A20F470()
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
  v2 = sub_23A232FE8();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256952418);
  v6 = *v0;
  v7 = sub_23A2332D0();
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

void *sub_23A20F694()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569523F0);
  v2 = *v0;
  v3 = sub_23A2332D0();
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

uint64_t sub_23A20F844()
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
  v2 = sub_23A232FE8();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256952418);
  v7 = sub_23A2332DC();
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
    sub_23A1F58C8((unint64_t *)&qword_256951B90, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
    result = sub_23A2330F0();
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

uint64_t sub_23A20FB6C()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2569523F0);
  v3 = sub_23A2332DC();
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
    sub_23A2337F8();
    swift_bridgeObjectRetain();
    sub_23A233168();
    result = sub_23A23381C();
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

uint64_t sub_23A20FE18(uint64_t a1)
{
  unint64_t *v1;
  uint64_t v2;
  unint64_t v3;
  int64_t v4;
  int64_t v5;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;
  int64_t v23;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *v1;
  v4 = *(_QWORD *)(*v1 + 16);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= *(_QWORD *)(v3 + 24) >> 1)
  {
    if (*(_QWORD *)(a1 + 16))
      goto LABEL_5;
    goto LABEL_18;
  }
  if (v4 <= v5)
    v23 = v4 + v2;
  else
    v23 = v4;
  v3 = sub_23A2068E8(isUniquelyReferenced_nonNull_native, v23, 1, v3);
  if (!*(_QWORD *)(a1 + 16))
  {
LABEL_18:
    if (!v2)
      goto LABEL_19;
    goto LABEL_21;
  }
LABEL_5:
  v8 = *(_QWORD *)(v3 + 16);
  v9 = (*(_QWORD *)(v3 + 24) >> 1) - v8;
  v10 = sub_23A232FE8();
  if (v9 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v11 = *(_QWORD *)(v10 - 8);
  v12 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  v13 = *(_QWORD *)(v11 + 72);
  v14 = v3 + v12 + v13 * v8;
  v15 = a1 + v12;
  v16 = v13 * v2;
  v17 = v14 + v16;
  v18 = v15 + v16;
  if (v15 < v17 && v14 < v18)
    goto LABEL_24;
  swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_19:
    result = swift_bridgeObjectRelease();
    *v1 = v3;
    return result;
  }
  v20 = *(_QWORD *)(v3 + 16);
  v21 = __OFADD__(v20, v2);
  v22 = v20 + v2;
  if (!v21)
  {
    *(_QWORD *)(v3 + 16) = v22;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  result = sub_23A233408();
  __break(1u);
  return result;
}

uint64_t sub_23A20FF80(uint64_t result, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  int64_t v12;
  uint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  _QWORD *v20;
  uint64_t v21;

  v5 = (_QWORD *)result;
  v6 = a4 + 56;
  v7 = -1 << *(_BYTE *)(a4 + 32);
  if (-v7 < 64)
    v8 = ~(-1 << -(char)v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(a4 + 56);
  if (!a2)
  {
    v12 = 0;
    v10 = 0;
LABEL_38:
    *v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }
  v10 = a3;
  if (!a3)
  {
    v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  v11 = a2;
  v12 = 0;
  v13 = 0;
  v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9)
    goto LABEL_9;
LABEL_8:
  v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    v20 = (_QWORD *)(*(_QWORD *)(a4 + 48) + 16 * v16);
    v21 = v20[1];
    *v11 = *v20;
    v11[1] = v21;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 2;
    result = swift_bridgeObjectRetain();
    if (v9)
      goto LABEL_8;
LABEL_9:
    v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14)
      goto LABEL_33;
    v18 = *(_QWORD *)(v6 + 8 * v17);
    if (!v18)
      break;
LABEL_18:
    v9 = (v18 - 1) & v18;
    v16 = __clz(__rbit64(v18)) + (v17 << 6);
    v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    v9 = 0;
    v12 = v17;
    goto LABEL_37;
  }
  v18 = *(_QWORD *)(v6 + 8 * v12);
  if (v18)
    goto LABEL_14;
  v19 = v17 + 2;
  if (v17 + 2 >= v14)
    goto LABEL_33;
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
    goto LABEL_17;
  v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    v9 = 0;
    v12 = v17 + 2;
    goto LABEL_37;
  }
  v18 = *(_QWORD *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    v17 = v12;
    goto LABEL_18;
  }
  v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    v9 = 0;
LABEL_37:
    v10 = v13;
    goto LABEL_38;
  }
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    v17 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v17 >= v14)
    {
      v9 = 0;
      v12 = v14 - 1;
      goto LABEL_37;
    }
    v18 = *(_QWORD *)(v6 + 8 * v17);
    ++v19;
    if (v18)
      goto LABEL_18;
  }
LABEL_41:
  __break(1u);
  return result;
}

BOOL sub_23A21017C()
{
  sub_23A211D9C();
  return sub_23A2332A0() == 0;
}

BOOL sub_23A2101E4()
{
  sub_23A211D9C();
  return sub_23A2332A0() == 0;
}

void sub_23A21024C(uint64_t a1, uint64_t a2)
{
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
  char *v31;
  char *v32;
  _QWORD v33[12];
  uint64_t v34;
  uint64_t v35;

  v34 = a2;
  v35 = a1;
  v2 = sub_23A232FE8();
  v33[10] = *(_QWORD *)(v2 - 8);
  v33[11] = v2;
  v3 = MEMORY[0x24BDAC7A8](v2);
  v33[4] = (char *)v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v33[1] = (char *)v33 - v6;
  v7 = MEMORY[0x24BDAC7A8](v5);
  v33[2] = (char *)v33 - v8;
  v9 = MEMORY[0x24BDAC7A8](v7);
  v33[3] = (char *)v33 - v10;
  v11 = MEMORY[0x24BDAC7A8](v9);
  v33[9] = (char *)v33 - v12;
  v13 = MEMORY[0x24BDAC7A8](v11);
  v33[6] = (char *)v33 - v14;
  v15 = MEMORY[0x24BDAC7A8](v13);
  v33[7] = (char *)v33 - v16;
  v17 = MEMORY[0x24BDAC7A8](v15);
  v33[0] = (char *)v33 - v18;
  MEMORY[0x24BDAC7A8](v17);
  v33[5] = (char *)v33 - v19;
  v20 = type metadata accessor for RecordStoreBuilderError();
  v21 = MEMORY[0x24BDAC7A8](v20);
  v22 = MEMORY[0x24BDAC7A8](v21);
  v33[8] = (char *)v33 - v23;
  v24 = MEMORY[0x24BDAC7A8](v22);
  v25 = MEMORY[0x24BDAC7A8](v24);
  v26 = MEMORY[0x24BDAC7A8](v25);
  v27 = MEMORY[0x24BDAC7A8](v26);
  MEMORY[0x24BDAC7A8](v27);
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569524F0);
  v29 = MEMORY[0x24BDAC7A8](v28);
  v31 = (char *)v33 + *(int *)(v29 + 48) - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23A1F8E44(v35, (uint64_t)v33 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for RecordStoreBuilderError);
  sub_23A1F8E44(v34, (uint64_t)v31, (uint64_t (*)(_QWORD))type metadata accessor for RecordStoreBuilderError);
  v32 = (char *)sub_23A210524 + 4 * byte_23A2349EE[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

BOOL sub_23A210524()
{
  uint64_t v0;
  _DWORD *v1;
  _DWORD *v2;
  BOOL v3;

  sub_23A1F8E44(v0, (uint64_t)v2, (uint64_t (*)(_QWORD))type metadata accessor for RecordStoreBuilderError);
  if (swift_getEnumCaseMultiPayload())
  {
    sub_23A212BD8(v0);
    return 0;
  }
  else
  {
    v3 = *v2 == *v1;
    sub_23A1F8F44(v0, (uint64_t (*)(_QWORD))type metadata accessor for RecordStoreBuilderError);
  }
  return v3;
}

uint64_t sub_23A210B54(unint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (a1 >> 62)
    goto LABEL_16;
  v5 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    result = MEMORY[0x24BEE4AF8];
    if (!v5)
      break;
    v11 = MEMORY[0x24BEE4AF8];
    result = sub_23A233384();
    if (v5 < 0)
    {
      __break(1u);
      return result;
    }
    v7 = 0;
    while (v5 != v7)
    {
      if ((a1 & 0xC000000000000001) != 0)
      {
        v8 = MEMORY[0x23B84508C](v7, a1);
      }
      else
      {
        v8 = *(_QWORD *)(a1 + 8 * v7 + 32);
        swift_retain();
      }
      v9 = v8;
      sub_23A2096D0(&v9, a2, &v10);
      swift_release();
      if (v2)
        return swift_release();
      ++v7;
      sub_23A23336C();
      sub_23A233390();
      sub_23A23339C();
      sub_23A233378();
      if (v5 == v7)
        return v11;
    }
    __break(1u);
LABEL_16:
    swift_bridgeObjectRetain();
    v5 = sub_23A2333D8();
    swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_23A210CC0(unint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  unint64_t v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(char *, unint64_t, uint64_t);
  char v18;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v4 = sub_23A232FE8();
  v28 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = MEMORY[0x24BEE4AF8];
  if (a1 >> 62)
  {
LABEL_23:
    v7 = sub_23A2333D8();
    if (v7)
      goto LABEL_3;
  }
  else
  {
    v7 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v7)
    {
LABEL_3:
      v8 = 0;
      v29 = a2 + OBJC_IVAR____TtC23DarwinDirectoryInternal11GroupRecord_uuid;
      v25 = a1 & 0xFFFFFFFFFFFFFF8;
      v26 = a1 & 0xC000000000000001;
      v24 = a1 + 32;
      v21 = v7;
      v22 = a1;
      while (1)
      {
        if (v26)
        {
          a2 = MEMORY[0x23B84508C](v8, a1);
          v9 = __OFADD__(v8++, 1);
          if (v9)
          {
LABEL_20:
            __break(1u);
            return v30;
          }
        }
        else
        {
          if (v8 >= *(_QWORD *)(v25 + 16))
          {
            __break(1u);
            goto LABEL_23;
          }
          a2 = *(_QWORD *)(v24 + 8 * v8);
          swift_retain();
          v9 = __OFADD__(v8++, 1);
          if (v9)
            goto LABEL_20;
        }
        v10 = a2 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_memberships;
        swift_beginAccess();
        v11 = *(_QWORD *)v10;
        if (*(_QWORD *)(*(_QWORD *)v10 + 16))
        {
          v27 = a2;
          sub_23A1F58C8((unint64_t *)&qword_256951B90, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
          swift_bridgeObjectRetain();
          v12 = sub_23A2330F0();
          v13 = -1 << *(_BYTE *)(v11 + 32);
          v14 = v12 & ~v13;
          a2 = v11 + 56;
          if (((*(_QWORD *)(v11 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFF8)) >> v14) & 1) != 0)
          {
            v23 = v8;
            v15 = ~v13;
            v16 = *(_QWORD *)(v28 + 72);
            v17 = *(void (**)(char *, unint64_t, uint64_t))(v28 + 16);
            while (1)
            {
              v17(v6, *(_QWORD *)(v11 + 48) + v16 * v14, v4);
              sub_23A1F58C8(&qword_256951FE0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA98]);
              v18 = sub_23A233114();
              (*(void (**)(char *, uint64_t))(v28 + 8))(v6, v4);
              if ((v18 & 1) != 0)
                break;
              v14 = (v14 + 1) & v15;
              if (((*(_QWORD *)(a2 + ((v14 >> 3) & 0xFFFFFFFFFFFFF8)) >> v14) & 1) == 0)
              {
                swift_release();
                swift_bridgeObjectRelease();
                goto LABEL_17;
              }
            }
            swift_bridgeObjectRelease();
            sub_23A23336C();
            sub_23A233390();
            sub_23A23339C();
            sub_23A233378();
LABEL_17:
            v7 = v21;
            a1 = v22;
            v8 = v23;
          }
          else
          {
            swift_release();
            swift_bridgeObjectRelease();
          }
        }
        else
        {
          swift_release();
        }
        if (v8 == v7)
          return v30;
      }
    }
  }
  return MEMORY[0x24BEE4AF8];
}

uint64_t sub_23A210FBC(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *(_QWORD *)(a1 + 16);
  result = sub_23A233240();
  v8 = result;
  if (v2)
  {
    v4 = (uint64_t *)(a1 + 40);
    do
    {
      v5 = *(v4 - 1);
      v6 = *v4;
      swift_bridgeObjectRetain();
      sub_23A20E8E0(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t sub_23A211050(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  int64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  char *v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD v35[5];
  uint64_t v36;

  v4 = v3;
  v29 = a2;
  v30 = a3;
  v6 = sub_23A232FE8();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1 >> 62)
    goto LABEL_21;
  v10 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    result = MEMORY[0x24BEE4AF8];
    if (!v10)
      return result;
    v36 = MEMORY[0x24BEE4AF8];
    result = sub_23A233384();
    if (v10 < 0)
    {
      __break(1u);
      return result;
    }
    v22 = v4;
    v23 = v7;
    v12 = 0;
    v27 = v9;
    v28 = a1 & 0xC000000000000001;
    v24 = v6;
    v25 = a1;
    v26 = v10;
    while (v10 != v12)
    {
      if (v28)
      {
        v16 = MEMORY[0x23B84508C](v12, a1);
      }
      else
      {
        v16 = *(_QWORD *)(a1 + 8 * v12 + 32);
        swift_retain();
      }
      v17 = *(_DWORD *)(v16 + 32);
      v18 = *(_QWORD *)(v16 + 48);
      v34 = *(_QWORD *)(v16 + 40);
      (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v16 + OBJC_IVAR____TtC23DarwinDirectoryInternal11GroupRecord_uuid, v6);
      v33 = v18;
      swift_bridgeObjectRetain();
      v19 = sub_23A20992C(v16, v29, v30);
      v9 = *(char **)(v19 + 16);
      if (v9)
      {
        v31 = v17;
        __swift_instantiateConcreteTypeFromMangledName(&qword_2569520A8);
        v13 = (_QWORD *)swift_allocObject();
        v20 = _swift_stdlib_malloc_size(v13);
        v21 = v20 - 32;
        if (v20 < 32)
          v21 = v20 - 17;
        v13[2] = v9;
        v13[3] = 2 * (v21 >> 4);
        v32 = sub_23A20FF80((uint64_t)v35, v13 + 4, (uint64_t)v9, v19);
        v6 = v35[1];
        v7 = v35[2];
        v4 = v35[3];
        a1 = v35[4];
        swift_bridgeObjectRetain();
        sub_23A1F8F80();
        if ((char *)v32 != v9)
          goto LABEL_20;
        swift_bridgeObjectRelease();
        v6 = v24;
        a1 = v25;
        v7 = v23;
        v17 = v31;
      }
      else
      {
        swift_bridgeObjectRelease();
        v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
      }
      ++v12;
      type metadata accessor for RecordStore.GroupStoreRecord(0);
      v14 = swift_allocObject();
      *(_BYTE *)(v14 + OBJC_IVAR____TtCV23DarwinDirectoryInternal11RecordStore16GroupStoreRecord_isMutable) = 0;
      *(_DWORD *)(v14 + 16) = v17;
      v15 = v33;
      *(_QWORD *)(v14 + 24) = v34;
      *(_QWORD *)(v14 + 32) = v15;
      v9 = v27;
      (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(v14 + OBJC_IVAR____TtCV23DarwinDirectoryInternal11RecordStore16GroupStoreRecord_uuid, v27, v6);
      *(_QWORD *)(v14 + OBJC_IVAR____TtCV23DarwinDirectoryInternal11RecordStore16GroupStoreRecord_memberNames) = v13;
      swift_release();
      sub_23A23336C();
      v4 = *(_QWORD *)(v36 + 16);
      sub_23A233390();
      sub_23A23339C();
      sub_23A233378();
      v10 = v26;
      if (v26 == v12)
        return v36;
    }
    __break(1u);
LABEL_20:
    __break(1u);
LABEL_21:
    swift_bridgeObjectRetain();
    v10 = sub_23A2333D8();
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_23A21134C(unint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (a1 >> 62)
    goto LABEL_14;
  v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    result = MEMORY[0x24BEE4AF8];
    if (!v2)
      break;
    v7 = MEMORY[0x24BEE4AF8];
    result = sub_23A233384();
    if (v2 < 0)
    {
      __break(1u);
      return result;
    }
    v4 = 0;
    while (v2 != v4)
    {
      if ((a1 & 0xC000000000000001) != 0)
      {
        v5 = MEMORY[0x23B84508C](v4, a1);
      }
      else
      {
        v5 = *(_QWORD *)(a1 + 8 * v4 + 32);
        swift_retain();
      }
      ++v4;
      sub_23A207330(v5);
      swift_beginAccess();
      v6 = swift_bridgeObjectRetain();
      sub_23A209DC0(v6);
      swift_endAccess();
      swift_release();
      sub_23A23336C();
      sub_23A233390();
      sub_23A23339C();
      sub_23A233378();
      if (v2 == v4)
        return v7;
    }
    __break(1u);
LABEL_14:
    swift_bridgeObjectRetain();
    v2 = sub_23A2333D8();
    swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_23A2114D4(unint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t result;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(char *, uint64_t, uint64_t);
  uint64_t v25;
  uint64_t v26;
  char v27;
  void (*v28)(char *, uint64_t);
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  void (*v40)(char *, uint64_t, uint64_t);
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  char v45;
  void (*v46)(char *, uint64_t);
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  char *v53;
  unint64_t i;
  unint64_t v55;
  unint64_t v56;
  uint64_t *v57;
  uint64_t v58;

  v48 = a3;
  v55 = a1;
  v5 = type metadata accessor for RecordStore(0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (uint64_t)&v47 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v51 = 0;
  v8 = sub_23A232FE8();
  v58 = *(_QWORD *)(v8 - 8);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v53 = (char *)&v47 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v47 - v12;
  result = MEMORY[0x24BDAC7A8](v11);
  v16 = (char *)&v47 - v15;
  v57 = v3;
  if ((unint64_t)*v3 >> 62)
    goto LABEL_65;
  v17 = *(_QWORD *)((*v3 & 0xFFFFFFFFFFFFF8) + 0x10);
  do
  {
    v52 = a2;
    v49 = v7;
    v18 = v55;
    if (!v17)
    {
LABEL_28:
      v29 = v57[1];
      if (v29 >> 62)
        goto LABEL_67;
      v18 = *(_QWORD *)((v29 & 0xFFFFFFFFFFFFF8) + 0x10);
      goto LABEL_30;
    }
    if (v55 >> 62)
      goto LABEL_69;
    v56 = *(_QWORD *)((v55 & 0xFFFFFFFFFFFFF8) + 0x10);
LABEL_6:
    v19 = 0;
    i = v18 & 0xC000000000000001;
    v47 = v17;
    while (1)
    {
      if (v19 == v17)
        goto LABEL_61;
      if ((*v57 & 0xC000000000000001) != 0)
      {
        v20 = MEMORY[0x23B84508C](v19);
        if (v56)
          break;
        goto LABEL_27;
      }
      if (v19 >= *(_QWORD *)((*v57 & 0xFFFFFFFFFFFFF8) + 0x10))
        goto LABEL_62;
      v20 = swift_retain();
      if (v56)
        break;
LABEL_27:
      v27 = 0;
LABEL_8:
      ++v19;
      *(_BYTE *)(v20 + OBJC_IVAR____TtCV23DarwinDirectoryInternal11RecordStore15UserStoreRecord_isMutable) = v27 & 1;
      result = swift_release();
      if (v19 == v17)
        goto LABEL_28;
    }
    v50 = v20;
    swift_bridgeObjectRetain();
    v21 = 4;
    while (1)
    {
      v22 = v21 - 4;
      if (!i)
        break;
      v7 = MEMORY[0x23B84508C](v21 - 4, v18);
      v23 = v21 - 3;
      if (__OFADD__(v22, 1))
        goto LABEL_57;
LABEL_19:
      v24 = *(void (**)(char *, uint64_t, uint64_t))(v58 + 16);
      v24(v16, v7 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_uuid, v8);
      v25 = *v57;
      if ((*v57 & 0xC000000000000001) != 0)
      {
        v26 = MEMORY[0x23B84508C](v19);
      }
      else
      {
        if (v19 >= *(_QWORD *)((v25 & 0xFFFFFFFFFFFFF8) + 0x10))
          goto LABEL_58;
        v26 = *(_QWORD *)(v25 + 8 * v19 + 32);
        swift_retain();
      }
      a2 = v26 + OBJC_IVAR____TtCV23DarwinDirectoryInternal11RecordStore15UserStoreRecord_uuid;
      swift_beginAccess();
      v24(v13, a2, v8);
      swift_release();
      v27 = sub_23A232FC4();
      v28 = *(void (**)(char *, uint64_t))(v58 + 8);
      v28(v13, v8);
      v28(v16, v8);
      swift_release();
      v18 = v55;
      if ((v27 & 1) == 0)
      {
        ++v21;
        if (v23 != v56)
          continue;
      }
      swift_bridgeObjectRelease();
      a2 = v52;
      v17 = v47;
      v20 = v50;
      goto LABEL_8;
    }
    v7 = *(_QWORD *)(v18 + 8 * v21);
    swift_retain();
    v23 = v21 - 3;
    if (!__OFADD__(v22, 1))
      goto LABEL_19;
LABEL_57:
    __break(1u);
LABEL_58:
    __break(1u);
LABEL_59:
    __break(1u);
LABEL_60:
    __break(1u);
LABEL_61:
    __break(1u);
LABEL_62:
    __break(1u);
LABEL_63:
    __break(1u);
LABEL_64:
    __break(1u);
LABEL_65:
    swift_bridgeObjectRetain();
    v17 = sub_23A2333D8();
    result = swift_bridgeObjectRelease();
  }
  while ((v17 & 0x8000000000000000) == 0);
  __break(1u);
LABEL_67:
  swift_bridgeObjectRetain();
  v18 = sub_23A2333D8();
  result = swift_bridgeObjectRelease();
  if (v18 < 0)
  {
    __break(1u);
LABEL_69:
    swift_bridgeObjectRetain();
    v56 = sub_23A2333D8();
    swift_bridgeObjectRelease();
    goto LABEL_6;
  }
LABEL_30:
  if (v18)
  {
    if (a2 >> 62)
    {
      swift_bridgeObjectRetain();
      v16 = (char *)sub_23A2333D8();
      swift_bridgeObjectRelease();
    }
    else
    {
      v16 = *(char **)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    v30 = 0;
    v56 = a2 & 0xC000000000000001;
    for (i = v18; i != v30; v18 = i)
    {
      if (v30 == v18)
        goto LABEL_63;
      v36 = v57[1];
      if ((v36 & 0xC000000000000001) != 0)
      {
        v55 = MEMORY[0x23B84508C](v30);
        if (v16)
          goto LABEL_40;
      }
      else
      {
        if (v30 >= *(_QWORD *)((v36 & 0xFFFFFFFFFFFFF8) + 0x10))
          goto LABEL_64;
        v55 = *(_QWORD *)(v36 + 8 * v30 + 32);
        swift_retain();
        if (v16)
        {
LABEL_40:
          swift_bridgeObjectRetain();
          v37 = 4;
          while (1)
          {
            v7 = v37 - 4;
            if (v56)
            {
              v38 = MEMORY[0x23B84508C](v37 - 4, a2);
              v39 = (char *)(v37 - 3);
              if (__OFADD__(v7, 1))
                goto LABEL_59;
            }
            else
            {
              v38 = *(_QWORD *)(a2 + 8 * v37);
              swift_retain();
              v39 = (char *)(v37 - 3);
              if (__OFADD__(v7, 1))
                goto LABEL_59;
            }
            v40 = *(void (**)(char *, uint64_t, uint64_t))(v58 + 16);
            v40(v53, v38 + OBJC_IVAR____TtC23DarwinDirectoryInternal11GroupRecord_uuid, v8);
            v41 = v57[1];
            if ((v41 & 0xC000000000000001) != 0)
            {
              v42 = MEMORY[0x23B84508C](v30);
            }
            else
            {
              if (v30 >= *(_QWORD *)((v41 & 0xFFFFFFFFFFFFF8) + 0x10))
                goto LABEL_60;
              v42 = *(_QWORD *)(v41 + 8 * v30 + 32);
              swift_retain();
            }
            v43 = v42 + OBJC_IVAR____TtCV23DarwinDirectoryInternal11RecordStore16GroupStoreRecord_uuid;
            swift_beginAccess();
            v40(v13, v43, v8);
            swift_release();
            v44 = v53;
            v45 = sub_23A232FC4();
            v46 = *(void (**)(char *, uint64_t))(v58 + 8);
            v46(v13, v8);
            v46(v44, v8);
            swift_release();
            if ((v45 & 1) != 0)
              break;
            ++v37;
            a2 = v52;
            if (v39 == v16)
            {
              swift_bridgeObjectRelease();
              goto LABEL_34;
            }
          }
          a2 = v52;
          swift_bridgeObjectRelease();
          v31 = v49;
          sub_23A1F8E44((uint64_t)v57, v49, type metadata accessor for RecordStore);
          v7 = 1;
          goto LABEL_35;
        }
      }
LABEL_34:
      v31 = v49;
      v32 = sub_23A1F8E44((uint64_t)v57, v49, type metadata accessor for RecordStore);
      MEMORY[0x24BDAC7A8](v32);
      *(&v47 - 2) = v31;
      *(&v47 - 1) = v30;
      v33 = v48;
      swift_bridgeObjectRetain();
      v34 = v51;
      v7 = sub_23A20B9C4((uint64_t (*)(char *))sub_23A211BD4, (uint64_t)(&v47 - 4), v33);
      v51 = v34;
      swift_bridgeObjectRelease();
LABEL_35:
      v35 = v55;
      ++v30;
      sub_23A1F8F44(v31, type metadata accessor for RecordStore);
      *(_BYTE *)(v35 + OBJC_IVAR____TtCV23DarwinDirectoryInternal11RecordStore16GroupStoreRecord_isMutable) = v7 & 1;
      result = swift_release();
    }
  }
  return result;
}

unint64_t sub_23A211B90()
{
  unint64_t result;

  result = qword_2569523E0;
  if (!qword_2569523E0)
  {
    result = MEMORY[0x23B8459BC](MEMORY[0x24BDCFB50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_2569523E0);
  }
  return result;
}

uint64_t sub_23A211BD4(uint64_t a1)
{
  uint64_t v1;

  return sub_23A20C848(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24)) & 1;
}

uint64_t type metadata accessor for RecordStoreBuilderError()
{
  uint64_t result;

  result = qword_2569524A8;
  if (!qword_2569524A8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23A211C2C()
{
  sub_23A232FE8();
  sub_23A1F58C8(&qword_256951FE0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA98]);
  return sub_23A233114() & 1;
}

BOOL sub_23A211CA0(uint64_t a1)
{
  uint64_t v1;

  return *(_DWORD *)(*(_QWORD *)a1 + 32) == *(_DWORD *)(**(_QWORD **)(v1 + 16) + 32);
}

BOOL sub_23A211CC0()
{
  return sub_23A21017C();
}

BOOL sub_23A211CDC(uint64_t *a1)
{
  uint64_t v1;

  return sub_23A20BCB4(*a1, **(_QWORD **)(v1 + 16));
}

uint64_t sub_23A211D00()
{
  return sub_23A211E60() & 1;
}

uint64_t sub_23A211D20(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;

  v8 = a2;
  v2 = *(_QWORD *)(a1 + 16);
  if (v2)
  {
    v3 = (uint64_t *)(a1 + 40);
    do
    {
      v4 = *(v3 - 1);
      v5 = *v3;
      swift_bridgeObjectRetain();
      sub_23A20E8E0(&v7, v4, v5);
      swift_bridgeObjectRelease();
      v3 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return a2;
}

unint64_t sub_23A211D9C()
{
  unint64_t result;

  result = qword_256952420;
  if (!qword_256952420)
  {
    result = MEMORY[0x23B8459BC](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_256952420);
  }
  return result;
}

BOOL sub_23A211DE0(uint64_t a1)
{
  uint64_t v1;

  return *(_DWORD *)(*(_QWORD *)a1 + 16) == *(_DWORD *)(**(_QWORD **)(v1 + 16) + 16);
}

BOOL sub_23A211E00()
{
  return sub_23A2101E4();
}

BOOL sub_23A211E1C(uint64_t *a1)
{
  uint64_t v1;

  return sub_23A20BE20(*a1, **(_QWORD **)(v1 + 16));
}

uint64_t sub_23A211E40()
{
  return sub_23A211E60() & 1;
}

uint64_t sub_23A211E60()
{
  return sub_23A232FC4() & 1;
}

uint64_t *sub_23A211EA0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t *, uint64_t *, uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v5 = *(_QWORD *)(a3 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v6 + 16) & ~(unint64_t)v6));
    swift_retain();
  }
  else
  {
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        v7 = a2[1];
        *a1 = *a2;
        a1[1] = v7;
        swift_bridgeObjectRetain();
        swift_storeEnumTagMultiPayload();
        break;
      case 2u:
        v10 = sub_23A232FE8();
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(a1, a2, v10);
        swift_storeEnumTagMultiPayload();
        break;
      case 3u:
      case 4u:
        v11 = a2[1];
        *a1 = *a2;
        a1[1] = v11;
        swift_bridgeObjectRetain();
        v12 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256952400) + 48);
        v13 = (char *)a1 + v12;
        v14 = (char *)a2 + v12;
        v15 = sub_23A232FE8();
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v13, v14, v15);
        swift_storeEnumTagMultiPayload();
        break;
      case 5u:
        v16 = sub_23A232FE8();
        v17 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v16 - 8) + 16);
        v17(a1, a2, v16);
        v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_256952408);
        v17((uint64_t *)((char *)a1 + *(int *)(v18 + 48)), (uint64_t *)((char *)a2 + *(int *)(v18 + 48)), v16);
        swift_storeEnumTagMultiPayload();
        break;
      case 6u:
        v19 = sub_23A232FE8();
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v19 - 8) + 16))(a1, a2, v19);
        v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_256952410);
        *(uint64_t *)((char *)a1 + *(int *)(v20 + 48)) = *(uint64_t *)((char *)a2 + *(int *)(v20 + 48));
        swift_bridgeObjectRetain();
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(_QWORD *)(v5 + 64));
        break;
    }
  }
  return a1;
}

uint64_t sub_23A2120F0(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);

  result = swift_getEnumCaseMultiPayload();
  switch((int)result)
  {
    case 1:
      goto LABEL_7;
    case 2:
      goto LABEL_3;
    case 3:
    case 4:
      swift_bridgeObjectRelease();
      a1 += *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256952400) + 48);
LABEL_3:
      v3 = sub_23A232FE8();
      v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8);
      v5 = a1;
      goto LABEL_5;
    case 5:
      v6 = sub_23A232FE8();
      v8 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8);
      v8(a1, v6);
      v5 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256952408) + 48);
      v3 = v6;
      v4 = (uint64_t (*)(uint64_t, uint64_t))v8;
LABEL_5:
      result = v4(v5, v3);
      break;
    case 6:
      v7 = sub_23A232FE8();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(a1, v7);
      __swift_instantiateConcreteTypeFromMangledName(&qword_256952410);
LABEL_7:
      result = swift_bridgeObjectRelease();
      break;
    default:
      return result;
  }
  return result;
}

_QWORD *sub_23A212210(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(_QWORD *, _QWORD *, uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      v6 = a2[1];
      *a1 = *a2;
      a1[1] = v6;
      swift_bridgeObjectRetain();
      goto LABEL_8;
    case 2u:
      v7 = sub_23A232FE8();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
      goto LABEL_8;
    case 3u:
    case 4u:
      v8 = a2[1];
      *a1 = *a2;
      a1[1] = v8;
      swift_bridgeObjectRetain();
      v9 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256952400) + 48);
      v10 = (char *)a1 + v9;
      v11 = (char *)a2 + v9;
      v12 = sub_23A232FE8();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v10, v11, v12);
      goto LABEL_8;
    case 5u:
      v13 = sub_23A232FE8();
      v14 = *(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v13 - 8) + 16);
      v14(a1, a2, v13);
      v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256952408);
      v14((_QWORD *)((char *)a1 + *(int *)(v15 + 48)), (_QWORD *)((char *)a2 + *(int *)(v15 + 48)), v13);
      goto LABEL_8;
    case 6u:
      v16 = sub_23A232FE8();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(a1, a2, v16);
      v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_256952410);
      *(_QWORD *)((char *)a1 + *(int *)(v17 + 48)) = *(_QWORD *)((char *)a2 + *(int *)(v17 + 48));
      swift_bridgeObjectRetain();
LABEL_8:
      swift_storeEnumTagMultiPayload();
      break;
    default:
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
      break;
  }
  return a1;
}

_QWORD *sub_23A212424(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(_QWORD *, _QWORD *, uint64_t);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  if (a1 != a2)
  {
    sub_23A1F8F44((uint64_t)a1, (uint64_t (*)(_QWORD))type metadata accessor for RecordStoreBuilderError);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        *a1 = *a2;
        a1[1] = a2[1];
        swift_bridgeObjectRetain();
        swift_storeEnumTagMultiPayload();
        break;
      case 2u:
        v6 = sub_23A232FE8();
        (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
        swift_storeEnumTagMultiPayload();
        break;
      case 3u:
      case 4u:
        *a1 = *a2;
        a1[1] = a2[1];
        swift_bridgeObjectRetain();
        v7 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256952400) + 48);
        v8 = (char *)a1 + v7;
        v9 = (char *)a2 + v7;
        v10 = sub_23A232FE8();
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
        swift_storeEnumTagMultiPayload();
        break;
      case 5u:
        v11 = sub_23A232FE8();
        v12 = *(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
        v12(a1, a2, v11);
        v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256952408);
        v12((_QWORD *)((char *)a1 + *(int *)(v13 + 48)), (_QWORD *)((char *)a2 + *(int *)(v13 + 48)), v11);
        swift_storeEnumTagMultiPayload();
        break;
      case 6u:
        v14 = sub_23A232FE8();
        (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(a1, a2, v14);
        v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256952410);
        *(_QWORD *)((char *)a1 + *(int *)(v15 + 48)) = *(_QWORD *)((char *)a2 + *(int *)(v15 + 48));
        swift_bridgeObjectRetain();
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
        break;
    }
  }
  return a1;
}

_OWORD *sub_23A21267C(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(_OWORD *, _OWORD *, uint64_t);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  switch(swift_getEnumCaseMultiPayload())
  {
    case 2u:
      v6 = sub_23A232FE8();
      (*(void (**)(_OWORD *, _OWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
      goto LABEL_7;
    case 3u:
    case 4u:
      *a1 = *a2;
      v7 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256952400) + 48);
      v8 = (char *)a1 + v7;
      v9 = (char *)a2 + v7;
      v10 = sub_23A232FE8();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
      goto LABEL_7;
    case 5u:
      v11 = sub_23A232FE8();
      v12 = *(void (**)(_OWORD *, _OWORD *, uint64_t))(*(_QWORD *)(v11 - 8) + 32);
      v12(a1, a2, v11);
      v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256952408);
      v12((_OWORD *)((char *)a1 + *(int *)(v13 + 48)), (_OWORD *)((char *)a2 + *(int *)(v13 + 48)), v11);
      goto LABEL_7;
    case 6u:
      v14 = sub_23A232FE8();
      (*(void (**)(_OWORD *, _OWORD *, uint64_t))(*(_QWORD *)(v14 - 8) + 32))(a1, a2, v14);
      v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256952410);
      *(_QWORD *)((char *)a1 + *(int *)(v15 + 48)) = *(_QWORD *)((char *)a2 + *(int *)(v15 + 48));
LABEL_7:
      swift_storeEnumTagMultiPayload();
      break;
    default:
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
      break;
  }
  return a1;
}

_OWORD *sub_23A212868(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(_OWORD *, _OWORD *, uint64_t);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  if (a1 != a2)
  {
    sub_23A1F8F44((uint64_t)a1, (uint64_t (*)(_QWORD))type metadata accessor for RecordStoreBuilderError);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 2u:
        v6 = sub_23A232FE8();
        (*(void (**)(_OWORD *, _OWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
        goto LABEL_8;
      case 3u:
      case 4u:
        *a1 = *a2;
        v7 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256952400) + 48);
        v8 = (char *)a1 + v7;
        v9 = (char *)a2 + v7;
        v10 = sub_23A232FE8();
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
        goto LABEL_8;
      case 5u:
        v11 = sub_23A232FE8();
        v12 = *(void (**)(_OWORD *, _OWORD *, uint64_t))(*(_QWORD *)(v11 - 8) + 32);
        v12(a1, a2, v11);
        v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_256952408);
        v12((_OWORD *)((char *)a1 + *(int *)(v13 + 48)), (_OWORD *)((char *)a2 + *(int *)(v13 + 48)), v11);
        goto LABEL_8;
      case 6u:
        v14 = sub_23A232FE8();
        (*(void (**)(_OWORD *, _OWORD *, uint64_t))(*(_QWORD *)(v14 - 8) + 32))(a1, a2, v14);
        v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_256952410);
        *(_QWORD *)((char *)a1 + *(int *)(v15 + 48)) = *(_QWORD *)((char *)a2 + *(int *)(v15 + 48));
LABEL_8:
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
        break;
    }
  }
  return a1;
}

uint64_t sub_23A212A6C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t sub_23A212A78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_23A212A88()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_23A212A98()
{
  uint64_t result;
  unint64_t v1;
  char v2;
  char v3;
  char v4;
  char v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;

  v6 = MEMORY[0x24BEE0170] + 64;
  v7 = &unk_23A234A78;
  result = sub_23A232FE8();
  if (v1 <= 0x3F)
  {
    v8 = *(_QWORD *)(result - 8) + 64;
    swift_getTupleTypeLayout2();
    v9 = &v5;
    swift_getTupleTypeLayout2();
    v10 = &v4;
    swift_getTupleTypeLayout2();
    v11 = &v3;
    swift_getTupleTypeLayout2();
    v12 = &v2;
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

unint64_t sub_23A212B8C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2569524E8;
  if (!qword_2569524E8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256951E38);
    result = MEMORY[0x23B8459BC](MEMORY[0x24BEE12B0], v1);
    atomic_store(result, (unint64_t *)&qword_2569524E8);
  }
  return result;
}

uint64_t sub_23A212BD8(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569524F0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t initializeLocalUsersAndGroups(andPerform:)(void (*a1)(unint64_t *, _QWORD **), uint64_t a2)
{
  if (qword_256951AC0 != -1)
    swift_once();
  return sub_23A1F84EC(a1, a2, qword_2569524F8);
}

uint64_t updateLocalUsersAndGroups(perform:)(void (*a1)(unint64_t *, _QWORD **), uint64_t a2)
{
  _QWORD v5[5];

  if (qword_256951AC0 != -1)
    swift_once();
  v5[3] = &type metadata for ProviderSideEffects;
  v5[4] = &off_250B2F8C0;
  v5[0] = swift_allocObject();
  sub_23A1F8DB0(qword_2569524F8, (_OWORD *)(v5[0] + 16));
  sub_23A212D6C(a1, a2, v5);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v5);
}

uint64_t sub_23A212D2C()
{
  return sub_23A1F6194(qword_2569524F8);
}

uint64_t sub_23A212D38()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 56);
  __swift_destroy_boxed_opaque_existential_1(v0 + 96);
  return swift_deallocObject();
}

uint64_t sub_23A212D6C(void (*a1)(unint64_t *, _QWORD **), uint64_t a2, _QWORD *a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t *v12;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint8_t *v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  uint8_t *v33;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  v6 = type metadata accessor for RecordManager();
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = a3[3];
  v10 = a3[4];
  v11 = __swift_project_boxed_opaque_existential_1(a3, v9);
  v12 = (uint64_t *)&v8[*(int *)(v6 + 20)];
  v12[3] = v9;
  v12[4] = *(_QWORD *)(v10 + 8);
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v12);
  (*(void (**)(uint64_t *, _QWORD *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(boxed_opaque_existential_1, v11, v9);
  sub_23A233000();
  if (qword_256951AC8 != -1)
    swift_once();
  v14 = sub_23A23300C();
  v36 = __swift_project_value_buffer(v14, (uint64_t)qword_256952570);
  v15 = sub_23A232FF4();
  v16 = sub_23A233270();
  if (os_log_type_enabled(v15, v16))
  {
    v17 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v17 = 0;
    _os_log_impl(&dword_23A1F0000, v15, v16, "Updating local domain...", v17, 2u);
    MEMORY[0x23B845A58](v17, -1, -1);
  }

  HIDWORD(v35) = sub_23A2060EC();
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v24 = sub_23A1F2154(1);
  v25 = v37;
  v27 = sub_23A216FEC(v24, v26, a1, a2, v21);
  if (v25)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v31 = sub_23A232FF4();
    v32 = sub_23A233264();
    if (os_log_type_enabled(v31, v32))
    {
      v33 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v33 = 0;
      _os_log_impl(&dword_23A1F0000, v31, v32, "Failed to update local domain.", v33, 2u);
      MEMORY[0x23B845A58](v33, -1, -1);
    }

    swift_willThrow();
    return sub_23A1F8F44((uint64_t)v8, (uint64_t (*)(_QWORD))type metadata accessor for RecordManager);
  }
  else
  {
    v29 = (unint64_t)v27;
    v30 = v28;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_23A1FE3CC(v29, v30, BYTE4(v35) & 1, v19, (uint64_t)v21, v23);
    sub_23A1F8F44((uint64_t)v8, (uint64_t (*)(_QWORD))type metadata accessor for RecordManager);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_23A2130A8()
{
  uint64_t v0;

  v0 = sub_23A23300C();
  __swift_allocate_value_buffer(v0, qword_256952570);
  __swift_project_value_buffer(v0, (uint64_t)qword_256952570);
  return sub_23A233000();
}

uint64_t User.uid.getter()
{
  uint64_t v0;

  return *(unsigned int *)(v0 + *(int *)(type metadata accessor for User(0) + 20));
}

uint64_t type metadata accessor for User(uint64_t a1)
{
  return sub_23A1FC53C(a1, qword_2569525F0);
}

uint64_t User.uid.setter(int a1)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for User(0);
  *(_DWORD *)(v1 + *(int *)(result + 20)) = a1;
  return result;
}

uint64_t (*User.uid.modify())()
{
  type metadata accessor for User(0);
  return nullsub_1;
}

uint64_t User.name.getter()
{
  return sub_23A213F18(type metadata accessor for User);
}

uint64_t User.name.setter(uint64_t a1, uint64_t a2)
{
  return sub_23A213F64(a1, a2, type metadata accessor for User);
}

uint64_t (*User.name.modify())()
{
  type metadata accessor for User(0);
  return nullsub_1;
}

uint64_t User.primaryGroupUUID.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for User(0) + 28);
  v4 = sub_23A232FE8();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t User.primaryGroupUUID.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for User(0) + 28);
  v4 = sub_23A232FE8();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(v3, a1, v4);
}

uint64_t (*User.primaryGroupUUID.modify())()
{
  type metadata accessor for User(0);
  return nullsub_1;
}

uint64_t User.fullName.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for User(0) + 32));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t User.fullName.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t result;

  v5 = (_QWORD *)(v2 + *(int *)(type metadata accessor for User(0) + 32));
  result = swift_bridgeObjectRelease();
  *v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*User.fullName.modify())()
{
  type metadata accessor for User(0);
  return nullsub_1;
}

uint64_t User.homeDirectory.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for User(0) + 36));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t User.homeDirectory.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t result;

  v5 = (_QWORD *)(v2 + *(int *)(type metadata accessor for User(0) + 36));
  result = swift_bridgeObjectRelease();
  *v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*User.homeDirectory.modify())()
{
  type metadata accessor for User(0);
  return nullsub_1;
}

uint64_t User.shell.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for User(0) + 40));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t User.shell.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t result;

  v5 = (_QWORD *)(v2 + *(int *)(type metadata accessor for User(0) + 40));
  result = swift_bridgeObjectRelease();
  *v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*User.shell.modify())()
{
  type metadata accessor for User(0);
  return nullsub_1;
}

uint64_t User.memberships.getter()
{
  type metadata accessor for User(0);
  return swift_bridgeObjectRetain();
}

uint64_t User.memberships.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;

  v3 = *(int *)(type metadata accessor for User(0) + 44);
  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + v3) = a1;
  return result;
}

uint64_t (*User.memberships.modify())()
{
  type metadata accessor for User(0);
  return nullsub_1;
}

uint64_t User.aliases.getter()
{
  type metadata accessor for User(0);
  return swift_bridgeObjectRetain();
}

uint64_t User.aliases.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;

  v3 = *(int *)(type metadata accessor for User(0) + 48);
  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + v3) = a1;
  return result;
}

uint64_t (*User.aliases.modify())()
{
  type metadata accessor for User(0);
  return nullsub_1;
}

uint64_t User.hash(into:)(__int128 *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = v1;
  sub_23A232FE8();
  sub_23A1F58C8((unint64_t *)&qword_256951B90, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  sub_23A2330FC();
  v4 = type metadata accessor for User(0);
  sub_23A233810();
  swift_bridgeObjectRetain();
  sub_23A233168();
  swift_bridgeObjectRelease();
  sub_23A2330FC();
  swift_bridgeObjectRetain();
  sub_23A233168();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_23A233168();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_23A233168();
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(v1 + *(int *)(v4 + 44));
  swift_bridgeObjectRetain();
  sub_23A21566C(a1, v5);
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(v2 + *(int *)(v4 + 48));
  swift_bridgeObjectRetain();
  sub_23A2154D8((uint64_t)a1, v6);
  return swift_bridgeObjectRelease();
}

uint64_t sub_23A21374C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  char *v13;
  int64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t i;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  uint64_t v23;
  void (*v24)(char *, unint64_t, uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  void (*v32)(char *, uint64_t);
  char *v33;
  uint64_t v34;
  uint64_t v35;
  int64_t v36;
  int64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;

  v4 = sub_23A232FE8();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v40 = (char *)&v33 - v9;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569535C0);
  result = MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1 == a2)
    return 1;
  if (*(_QWORD *)(a1 + 16) == *(_QWORD *)(a2 + 16))
  {
    v14 = 0;
    v15 = *(_QWORD *)(a1 + 56);
    v34 = a1;
    v35 = a1 + 56;
    v16 = 1 << *(_BYTE *)(a1 + 32);
    if (v16 < 64)
      v17 = ~(-1 << v16);
    else
      v17 = -1;
    v18 = v17 & v15;
    v36 = (unint64_t)(v16 + 63) >> 6;
    v39 = a2 + 56;
    v33 = v13;
    if (!v18)
      goto LABEL_8;
LABEL_7:
    v38 = (v18 - 1) & v18;
    for (i = __clz(__rbit64(v18)) | (v14 << 6); ; i = __clz(__rbit64(v21)) + (v14 << 6))
    {
      v23 = *(_QWORD *)(v5 + 72);
      v24 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
      v24(v13, *(_QWORD *)(a1 + 48) + v23 * i, v4);
      v25 = 1;
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v5 + 56))(v13, 0, 1, v4);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v13, 1, v4) == 1)
        return v25;
      v37 = v14;
      (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v40, v13, v4);
      sub_23A1F58C8((unint64_t *)&qword_256951B90, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
      v26 = sub_23A2330F0();
      v27 = -1 << *(_BYTE *)(a2 + 32);
      v28 = v26 & ~v27;
      if (((*(_QWORD *)(v39 + ((v28 >> 3) & 0xFFFFFFFFFFFFF8)) >> v28) & 1) == 0)
        break;
      v29 = a2;
      v30 = ~v27;
      while (1)
      {
        v24(v8, *(_QWORD *)(v29 + 48) + v28 * v23, v4);
        sub_23A1F58C8(&qword_256951FE0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA98]);
        v31 = sub_23A233114();
        v32 = *(void (**)(char *, uint64_t))(v5 + 8);
        v32(v8, v4);
        if ((v31 & 1) != 0)
          break;
        v28 = (v28 + 1) & v30;
        if (((*(_QWORD *)(v39 + ((v28 >> 3) & 0xFFFFFFFFFFFFF8)) >> v28) & 1) == 0)
          goto LABEL_32;
      }
      result = ((uint64_t (*)(char *, uint64_t))v32)(v40, v4);
      a2 = v29;
      v13 = v33;
      a1 = v34;
      v14 = v37;
      v18 = v38;
      if (v38)
        goto LABEL_7;
LABEL_8:
      v20 = v14 + 1;
      if (__OFADD__(v14, 1))
      {
        __break(1u);
LABEL_37:
        __break(1u);
        return result;
      }
      if (v20 >= v36)
        goto LABEL_35;
      v21 = *(_QWORD *)(v35 + 8 * v20);
      ++v14;
      if (!v21)
      {
        v14 = v20 + 1;
        if (v20 + 1 >= v36)
          goto LABEL_35;
        v21 = *(_QWORD *)(v35 + 8 * v14);
        if (!v21)
        {
          v14 = v20 + 2;
          if (v20 + 2 >= v36)
            goto LABEL_35;
          v21 = *(_QWORD *)(v35 + 8 * v14);
          if (!v21)
          {
            v22 = v20 + 3;
            if (v22 >= v36)
            {
LABEL_35:
              v25 = 1;
              (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v13, 1, 1, v4);
              return v25;
            }
            v21 = *(_QWORD *)(v35 + 8 * v22);
            if (!v21)
            {
              while (1)
              {
                v14 = v22 + 1;
                if (__OFADD__(v22, 1))
                  goto LABEL_37;
                if (v14 >= v36)
                  goto LABEL_35;
                v21 = *(_QWORD *)(v35 + 8 * v14);
                ++v22;
                if (v21)
                  goto LABEL_21;
              }
            }
            v14 = v22;
          }
        }
      }
LABEL_21:
      v38 = (v21 - 1) & v21;
    }
    v32 = *(void (**)(char *, uint64_t))(v5 + 8);
LABEL_32:
    v32(v40, v4);
  }
  return 0;
}

uint64_t sub_23A213B20(uint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  int64_t v10;
  unint64_t v11;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  BOOL v23;
  uint64_t v24;
  unint64_t i;
  uint64_t v26;
  _QWORD *v27;
  BOOL v28;
  uint64_t v29;
  int64_t v30;
  int64_t v31;

  if (result == a2)
    return 1;
  if (*(_QWORD *)(result + 16) != *(_QWORD *)(a2 + 16))
    return 0;
  v3 = 0;
  v29 = result + 56;
  v4 = 1 << *(_BYTE *)(result + 32);
  if (v4 < 64)
    v5 = ~(-1 << v4);
  else
    v5 = -1;
  v6 = v5 & *(_QWORD *)(result + 56);
  v30 = (unint64_t)(v4 + 63) >> 6;
  v7 = a2 + 56;
  while (1)
  {
    if (v6)
    {
      v8 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      v31 = v3;
      v9 = v8 | (v3 << 6);
      goto LABEL_24;
    }
    v10 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_43;
    }
    if (v10 >= v30)
      return 1;
    v11 = *(_QWORD *)(v29 + 8 * v10);
    v12 = v3 + 1;
    if (!v11)
    {
      v12 = v3 + 2;
      if (v3 + 2 >= v30)
        return 1;
      v11 = *(_QWORD *)(v29 + 8 * v12);
      if (!v11)
      {
        v12 = v3 + 3;
        if (v3 + 3 >= v30)
          return 1;
        v11 = *(_QWORD *)(v29 + 8 * v12);
        if (!v11)
          break;
      }
    }
LABEL_23:
    v6 = (v11 - 1) & v11;
    v31 = v12;
    v9 = __clz(__rbit64(v11)) + (v12 << 6);
LABEL_24:
    v14 = result;
    v15 = (uint64_t *)(*(_QWORD *)(result + 48) + 16 * v9);
    v17 = *v15;
    v16 = v15[1];
    sub_23A2337F8();
    swift_bridgeObjectRetain();
    sub_23A233168();
    v18 = sub_23A23381C();
    v19 = -1 << *(_BYTE *)(a2 + 32);
    v20 = v18 & ~v19;
    if (((*(_QWORD *)(v7 + ((v20 >> 3) & 0xFFFFFFFFFFFFF8)) >> v20) & 1) == 0)
      goto LABEL_39;
    v21 = *(_QWORD *)(a2 + 48);
    v22 = (_QWORD *)(v21 + 16 * v20);
    v23 = *v22 == v17 && v22[1] == v16;
    if (!v23 && (sub_23A233660() & 1) == 0)
    {
      v24 = ~v19;
      for (i = v20 + 1; ; i = v26 + 1)
      {
        v26 = i & v24;
        if (((*(_QWORD *)(v7 + (((i & v24) >> 3) & 0xFFFFFFFFFFFFF8)) >> (i & v24)) & 1) == 0)
          break;
        v27 = (_QWORD *)(v21 + 16 * v26);
        v28 = *v27 == v17 && v27[1] == v16;
        if (v28 || (sub_23A233660() & 1) != 0)
          goto LABEL_7;
      }
LABEL_39:
      swift_bridgeObjectRelease();
      return 0;
    }
LABEL_7:
    swift_bridgeObjectRelease();
    result = v14;
    v3 = v31;
  }
  v13 = v3 + 4;
  if (v3 + 4 >= v30)
    return 1;
  v11 = *(_QWORD *)(v29 + 8 * v13);
  if (v11)
  {
    v12 = v3 + 4;
    goto LABEL_23;
  }
  while (1)
  {
    v12 = v13 + 1;
    if (__OFADD__(v13, 1))
      break;
    if (v12 >= v30)
      return 1;
    v11 = *(_QWORD *)(v29 + 8 * v12);
    ++v13;
    if (v11)
      goto LABEL_23;
  }
LABEL_43:
  __break(1u);
  return result;
}

uint64_t User.hashValue.getter()
{
  __int128 v1[4];

  sub_23A2337F8();
  User.hash(into:)(v1);
  return sub_23A23381C();
}

uint64_t sub_23A213DE0()
{
  __int128 v1[4];

  sub_23A2337F8();
  User.hash(into:)(v1);
  return sub_23A23381C();
}

uint64_t sub_23A213E20()
{
  __int128 v1[4];

  sub_23A2337F8();
  User.hash(into:)(v1);
  return sub_23A23381C();
}

uint64_t _s23DarwinDirectoryInternal4UserV4uuid10Foundation4UUIDVvg_0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_23A232FE8();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t Group.gid.getter()
{
  uint64_t v0;

  return *(unsigned int *)(v0 + *(int *)(type metadata accessor for Group(0) + 20));
}

uint64_t Group.gid.setter(int a1)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for Group(0);
  *(_DWORD *)(v1 + *(int *)(result + 20)) = a1;
  return result;
}

uint64_t (*Group.gid.modify())()
{
  type metadata accessor for Group(0);
  return nullsub_1;
}

uint64_t Group.name.getter()
{
  return sub_23A213F18(type metadata accessor for Group);
}

uint64_t sub_23A213F18(uint64_t (*a1)(_QWORD))
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 + *(int *)(a1(0) + 24));
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t Group.name.setter(uint64_t a1, uint64_t a2)
{
  return sub_23A213F64(a1, a2, type metadata accessor for Group);
}

uint64_t sub_23A213F64(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;
  _QWORD *v6;
  uint64_t result;

  v6 = (_QWORD *)(v3 + *(int *)(a3(0) + 24));
  result = swift_bridgeObjectRelease();
  *v6 = a1;
  v6[1] = a2;
  return result;
}

uint64_t (*Group.name.modify())()
{
  type metadata accessor for Group(0);
  return nullsub_1;
}

uint64_t Group.fullName.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for Group(0) + 28));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Group.fullName.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t result;

  v5 = (_QWORD *)(v2 + *(int *)(type metadata accessor for Group(0) + 28));
  result = swift_bridgeObjectRelease();
  *v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*Group.fullName.modify())()
{
  type metadata accessor for Group(0);
  return nullsub_1;
}

uint64_t Group.nestedGroups.getter()
{
  type metadata accessor for Group(0);
  return swift_bridgeObjectRetain();
}

uint64_t Group.nestedGroups.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;

  v3 = *(int *)(type metadata accessor for Group(0) + 32);
  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + v3) = a1;
  return result;
}

uint64_t (*Group.nestedGroups.modify())()
{
  type metadata accessor for Group(0);
  return nullsub_1;
}

uint64_t Group.aliases.getter()
{
  type metadata accessor for Group(0);
  return swift_bridgeObjectRetain();
}

uint64_t Group.aliases.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;

  v3 = *(int *)(type metadata accessor for Group(0) + 36);
  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + v3) = a1;
  return result;
}

uint64_t (*Group.aliases.modify())()
{
  type metadata accessor for Group(0);
  return nullsub_1;
}

uint64_t Group.hash(into:)(__int128 *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = v1;
  sub_23A232FE8();
  sub_23A1F58C8((unint64_t *)&qword_256951B90, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  sub_23A2330FC();
  v4 = type metadata accessor for Group(0);
  sub_23A233810();
  swift_bridgeObjectRetain();
  sub_23A233168();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_23A233168();
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(v1 + *(int *)(v4 + 32));
  swift_bridgeObjectRetain();
  sub_23A21566C(a1, v5);
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(v2 + *(int *)(v4 + 36));
  swift_bridgeObjectRetain();
  sub_23A2154D8((uint64_t)a1, v6);
  return swift_bridgeObjectRelease();
}

uint64_t Group.hashValue.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  __int128 v6[4];

  v1 = v0;
  sub_23A2337F8();
  sub_23A232FE8();
  sub_23A1F58C8((unint64_t *)&qword_256951B90, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  sub_23A2330FC();
  v2 = type metadata accessor for Group(0);
  sub_23A233810();
  swift_bridgeObjectRetain();
  sub_23A233168();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_23A233168();
  swift_bridgeObjectRelease();
  v3 = *(_QWORD *)(v0 + *(int *)(v2 + 32));
  swift_bridgeObjectRetain();
  sub_23A21566C(v6, v3);
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(v1 + *(int *)(v2 + 36));
  swift_bridgeObjectRetain();
  sub_23A2154D8((uint64_t)v6, v4);
  swift_bridgeObjectRelease();
  return sub_23A23381C();
}

uint64_t sub_23A2143E0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v8[4];

  v4 = v2;
  sub_23A2337F8();
  sub_23A232FE8();
  sub_23A1F58C8((unint64_t *)&qword_256951B90, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  sub_23A2330FC();
  sub_23A233810();
  swift_bridgeObjectRetain();
  sub_23A233168();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_23A233168();
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(v2 + *(int *)(a2 + 32));
  swift_bridgeObjectRetain();
  sub_23A21566C(v8, v5);
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(v4 + *(int *)(a2 + 36));
  swift_bridgeObjectRetain();
  sub_23A2154D8((uint64_t)v8, v6);
  swift_bridgeObjectRelease();
  return sub_23A23381C();
}

uint64_t sub_23A21450C(unint64_t a1, unint64_t a2)
{
  uint64_t v2;
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
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  void (*v25)(char *, uint64_t, uint64_t);
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char *v31;
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
  unint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  void (*v49)(char *, uint64_t, uint64_t);
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  int v54;
  uint64_t v55;
  uint64_t v56;

  v5 = sub_23A232FE8();
  v6 = *(_QWORD *)(v5 - 8);
  v47 = v5;
  v48 = v6;
  v7 = MEMORY[0x24BDAC7A8](v5);
  v50 = (char *)&v42 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v46 = (char *)&v42 - v9;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v10 = sub_23A2333D8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v11 = MEMORY[0x24BEE4AF8];
  if (v10)
  {
    v56 = MEMORY[0x24BEE4AF8];
    result = sub_23A233384();
    if (v10 < 0)
    {
      __break(1u);
      goto LABEL_39;
    }
    if ((a1 & 0xC000000000000001) != 0)
    {
      v13 = 0;
      do
      {
        v14 = v13 + 1;
        MEMORY[0x23B84508C]();
        sub_23A21AC24();
        swift_unknownObjectRelease();
        sub_23A23336C();
        sub_23A233390();
        sub_23A23339C();
        sub_23A233378();
        v13 = v14;
      }
      while (v10 != v14);
    }
    else
    {
      v15 = a1 + 32;
      do
      {
        v15 += 8;
        sub_23A21AC24();
        sub_23A23336C();
        sub_23A233390();
        sub_23A23339C();
        sub_23A233378();
        --v10;
      }
      while (v10);
    }
    v11 = v56;
  }
  if (a2 >> 62)
  {
    swift_bridgeObjectRetain();
    v16 = sub_23A2333D8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v16 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  if (!v16)
    return v11;
  v56 = MEMORY[0x24BEE4AF8];
  result = sub_23A233384();
  if ((v16 & 0x8000000000000000) == 0)
  {
    v43 = v11;
    v44 = v2;
    if ((a2 & 0xC000000000000001) != 0)
    {
      v17 = 0;
      v45 = a2;
      v55 = v16;
      v19 = v47;
      v18 = v48;
      v20 = v46;
      do
      {
        v21 = MEMORY[0x23B84508C](v17, a2);
        v54 = *(_DWORD *)(v21 + 24);
        v22 = *(_QWORD *)(v21 + 40);
        v53 = *(_QWORD *)(v21 + 32);
        (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))(v20, v21 + OBJC_IVAR____TtC23DarwinDirectoryInternal15GroupRecordFile_uuid, v19);
        v23 = *(_QWORD *)(v21 + OBJC_IVAR____TtC23DarwinDirectoryInternal15GroupRecordFile_fullName);
        v51 = *(_QWORD *)(v21 + OBJC_IVAR____TtC23DarwinDirectoryInternal15GroupRecordFile_fullName + 8);
        v52 = v23;
        if (*(_QWORD *)(v21 + OBJC_IVAR____TtC23DarwinDirectoryInternal15GroupRecordFile_nestedGroups))
          v24 = *(char **)(v21 + OBJC_IVAR____TtC23DarwinDirectoryInternal15GroupRecordFile_nestedGroups);
        else
          v24 = (char *)MEMORY[0x24BEE4B08];
        v50 = v24;
        if (*(_QWORD *)(v21 + OBJC_IVAR____TtC23DarwinDirectoryInternal15GroupRecordFile_aliases))
          v25 = *(void (**)(char *, uint64_t, uint64_t))(v21
                                                                + OBJC_IVAR____TtC23DarwinDirectoryInternal15GroupRecordFile_aliases);
        else
          v25 = (void (*)(char *, uint64_t, uint64_t))MEMORY[0x24BEE4B08];
        v49 = v25;
        ++v17;
        type metadata accessor for GroupRecord(0);
        v26 = swift_allocObject();
        *(_DWORD *)(v26 + 32) = v54;
        *(_QWORD *)(v26 + 40) = v53;
        *(_QWORD *)(v26 + 48) = v22;
        (*(void (**)(uint64_t, char *, uint64_t))(v18 + 32))(v26 + OBJC_IVAR____TtC23DarwinDirectoryInternal11GroupRecord_uuid, v20, v19);
        v27 = v51;
        *(_QWORD *)(v26 + 16) = v52;
        *(_QWORD *)(v26 + 24) = v27;
        *(_QWORD *)(v26 + OBJC_IVAR____TtC23DarwinDirectoryInternal11GroupRecord_nestedGroups) = v50;
        *(_QWORD *)(v26 + OBJC_IVAR____TtC23DarwinDirectoryInternal11GroupRecord_aliases) = v49;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v28 = v55;
        swift_bridgeObjectRetain();
        swift_unknownObjectRelease();
        sub_23A23336C();
        sub_23A233390();
        a2 = v45;
        sub_23A23339C();
        sub_23A233378();
      }
      while (v28 != v17);
    }
    else
    {
      v29 = (uint64_t *)(a2 + 32);
      v30 = v47;
      v49 = *(void (**)(char *, uint64_t, uint64_t))(v48 + 16);
      v31 = v50;
      do
      {
        v55 = v16;
        v33 = *v29++;
        v32 = v33;
        v54 = *(_DWORD *)(v33 + 24);
        v34 = *(_QWORD *)(v33 + 40);
        v53 = *(_QWORD *)(v33 + 32);
        v49(v31, v33 + OBJC_IVAR____TtC23DarwinDirectoryInternal15GroupRecordFile_uuid, v30);
        v35 = *(_QWORD *)(v33 + OBJC_IVAR____TtC23DarwinDirectoryInternal15GroupRecordFile_fullName + 8);
        v52 = *(_QWORD *)(v33 + OBJC_IVAR____TtC23DarwinDirectoryInternal15GroupRecordFile_fullName);
        if (*(_QWORD *)(v33 + OBJC_IVAR____TtC23DarwinDirectoryInternal15GroupRecordFile_nestedGroups))
          v36 = *(_QWORD *)(v32 + OBJC_IVAR____TtC23DarwinDirectoryInternal15GroupRecordFile_nestedGroups);
        else
          v36 = MEMORY[0x24BEE4B08];
        v51 = v36;
        v37 = *(_QWORD *)(v32 + OBJC_IVAR____TtC23DarwinDirectoryInternal15GroupRecordFile_aliases);
        if (v37)
          v38 = v37;
        else
          v38 = MEMORY[0x24BEE4B08];
        type metadata accessor for GroupRecord(0);
        v39 = swift_allocObject();
        *(_DWORD *)(v39 + 32) = v54;
        *(_QWORD *)(v39 + 40) = v53;
        *(_QWORD *)(v39 + 48) = v34;
        (*(void (**)(uint64_t, char *, uint64_t))(v48 + 32))(v39 + OBJC_IVAR____TtC23DarwinDirectoryInternal11GroupRecord_uuid, v31, v30);
        v40 = v51;
        *(_QWORD *)(v39 + 16) = v52;
        *(_QWORD *)(v39 + 24) = v35;
        *(_QWORD *)(v39 + OBJC_IVAR____TtC23DarwinDirectoryInternal11GroupRecord_nestedGroups) = v40;
        *(_QWORD *)(v39 + OBJC_IVAR____TtC23DarwinDirectoryInternal11GroupRecord_aliases) = v38;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v41 = v55;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_23A23336C();
        sub_23A233390();
        sub_23A23339C();
        sub_23A233378();
        v16 = v41 - 1;
      }
      while (v16);
    }
    return v43;
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_23A214A34(uint64_t a1)
{
  int *v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v2 = (int *)type metadata accessor for User(0);
  result = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(_QWORD *)(a1 + 16);
  if (v7)
  {
    v8 = a1 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
    v9 = *(_QWORD *)(v4 + 72);
    swift_bridgeObjectRetain();
    while (1)
    {
      sub_23A1F8E44(v8, (uint64_t)v6, type metadata accessor for User);
      v10 = &v6[v2[6]];
      v12 = *(_QWORD *)v10;
      v11 = *((_QWORD *)v10 + 1);
      v13 = v12 & 0xFFFFFFFFFFFFLL;
      if (!((v11 & 0x2000000000000000) != 0 ? HIBYTE(v11) & 0xF : v13))
        break;
      v15 = &v6[v2[8]];
      v17 = *(_QWORD *)v15;
      v16 = *((_QWORD *)v15 + 1);
      v18 = v17 & 0xFFFFFFFFFFFFLL;
      if (!((v16 & 0x2000000000000000) != 0 ? HIBYTE(v16) & 0xF : v18))
        break;
      v20 = &v6[v2[9]];
      v22 = *(_QWORD *)v20;
      v21 = *((_QWORD *)v20 + 1);
      v23 = v22 & 0xFFFFFFFFFFFFLL;
      if (!((v21 & 0x2000000000000000) != 0 ? HIBYTE(v21) & 0xF : v23))
        break;
      v25 = &v6[v2[10]];
      v27 = *(_QWORD *)v25;
      v26 = *((_QWORD *)v25 + 1);
      v28 = v27 & 0xFFFFFFFFFFFFLL;
      v29 = (v26 & 0x2000000000000000) != 0 ? HIBYTE(v26) & 0xF : v28;
      if (!v29 || *(_DWORD *)&v6[v2[5]] < 0x1F4u)
        break;
      sub_23A1F8F44((uint64_t)v6, type metadata accessor for User);
      v8 += v9;
      if (!--v7)
        return swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    type metadata accessor for UserValidationError(0);
    sub_23A1F58C8(qword_2569526F8, type metadata accessor for UserValidationError, (uint64_t)&unk_23A234DB8);
    swift_allocError();
    sub_23A1F8E44((uint64_t)v6, v30, type metadata accessor for User);
    swift_storeEnumTagMultiPayload();
    swift_willThrow();
    return sub_23A1F8F44((uint64_t)v6, type metadata accessor for User);
  }
  return result;
}

uint64_t sub_23A214DD0(uint64_t a1)
{
  int *v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v2 = (int *)type metadata accessor for Group(0);
  result = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(_QWORD *)(a1 + 16);
  if (v7)
  {
    v8 = a1 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
    v9 = *(_QWORD *)(v4 + 72);
    swift_bridgeObjectRetain();
    while (1)
    {
      sub_23A1F8E44(v8, (uint64_t)v6, type metadata accessor for Group);
      v10 = &v6[v2[6]];
      v12 = *(_QWORD *)v10;
      v11 = *((_QWORD *)v10 + 1);
      v13 = v12 & 0xFFFFFFFFFFFFLL;
      if (!((v11 & 0x2000000000000000) != 0 ? HIBYTE(v11) & 0xF : v13))
        break;
      v15 = &v6[v2[7]];
      v17 = *(_QWORD *)v15;
      v16 = *((_QWORD *)v15 + 1);
      v18 = v17 & 0xFFFFFFFFFFFFLL;
      v19 = (v16 & 0x2000000000000000) != 0 ? HIBYTE(v16) & 0xF : v18;
      if (!v19 || *(_DWORD *)&v6[v2[5]] < 0x1F4u)
        break;
      sub_23A1F8F44((uint64_t)v6, type metadata accessor for Group);
      v8 += v9;
      if (!--v7)
        return swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    type metadata accessor for GroupValidationError(0);
    sub_23A1F58C8(&qword_2569526F0, type metadata accessor for GroupValidationError, (uint64_t)&unk_23A234DF8);
    swift_allocError();
    sub_23A1F8E44((uint64_t)v6, v20, type metadata accessor for Group);
    swift_storeEnumTagMultiPayload();
    swift_willThrow();
    return sub_23A1F8F44((uint64_t)v6, type metadata accessor for Group);
  }
  return result;
}

void sub_23A215054()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(_QWORD);
  char *v5;
  uint64_t v6;

  v1 = type metadata accessor for User(0);
  MEMORY[0x24BDAC7A8](v1);
  v2 = type metadata accessor for UserValidationError(0);
  MEMORY[0x24BDAC7A8](v2);
  sub_23A1F8E44(v0, (uint64_t)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  v5 = (char *)sub_23A21511C + 4 * byte_23A234B20[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_23A21511C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_23A1F8E88(v1, v0, type metadata accessor for User);
  *(_QWORD *)(v2 - 64) = 0;
  *(_QWORD *)(v2 - 56) = 0xE000000000000000;
  sub_23A233300();
  v3 = *(_QWORD *)(v2 - 56);
  *(_QWORD *)(v2 - 64) = *(_QWORD *)(v2 - 64);
  *(_QWORD *)(v2 - 56) = v3;
  sub_23A233174();
  sub_23A2333A8();
  v4 = *(_QWORD *)(v2 - 64);
  sub_23A1F8F44(v0, type metadata accessor for User);
  return v4;
}

uint64_t sub_23A2152F0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t (*v8)(_QWORD);
  uint64_t v9;
  _QWORD v11[2];

  v1 = v0;
  v2 = type metadata accessor for Group(0);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for GroupValidationError(0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23A1F8E44(v1, (uint64_t)v7, v8);
  swift_getEnumCaseMultiPayload();
  sub_23A1F8E88((uint64_t)v7, (uint64_t)v4, type metadata accessor for Group);
  v11[0] = 0;
  v11[1] = 0xE000000000000000;
  sub_23A233300();
  sub_23A233174();
  sub_23A2333A8();
  v9 = v11[0];
  sub_23A1F8F44((uint64_t)v4, type metadata accessor for Group);
  return v9;
}

uint64_t sub_23A2154D8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int64_t v7;
  uint64_t result;
  uint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v13;
  int64_t v14;

  sub_23A23381C();
  v3 = a2 + 56;
  v4 = 1 << *(_BYTE *)(a2 + 32);
  v5 = -1;
  if (v4 < 64)
    v5 = ~(-1 << v4);
  v6 = v5 & *(_QWORD *)(a2 + 56);
  v7 = (unint64_t)(v4 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v9 = 0;
  v10 = 0;
  while (1)
  {
    if (v6)
    {
      v6 &= v6 - 1;
      goto LABEL_5;
    }
    if (__OFADD__(v10++, 1))
      goto LABEL_19;
    if (v10 >= v7)
    {
LABEL_17:
      swift_release();
      return sub_23A233804();
    }
    v13 = *(_QWORD *)(v3 + 8 * v10);
    if (!v13)
      break;
LABEL_16:
    v6 = (v13 - 1) & v13;
LABEL_5:
    sub_23A2337F8();
    swift_bridgeObjectRetain();
    sub_23A233168();
    v11 = sub_23A23381C();
    result = swift_bridgeObjectRelease();
    v9 ^= v11;
  }
  v14 = v10 + 1;
  if (v10 + 1 >= v7)
    goto LABEL_17;
  v13 = *(_QWORD *)(v3 + 8 * v14);
  if (v13)
  {
    ++v10;
    goto LABEL_16;
  }
  while (1)
  {
    v10 = v14 + 1;
    if (__OFADD__(v14, 1))
      break;
    if (v10 >= v7)
      goto LABEL_17;
    v13 = *(_QWORD *)(v3 + 8 * v10);
    ++v14;
    if (v13)
      goto LABEL_16;
  }
  __break(1u);
LABEL_19:
  __break(1u);
  return result;
}

uint64_t sub_23A21566C(__int128 *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  int64_t v19;
  uint64_t result;
  uint64_t v21;
  int64_t v22;
  unint64_t v23;
  unint64_t i;
  unint64_t v26;
  int64_t v27;
  uint64_t v28;
  _QWORD v29[3];
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;

  v4 = sub_23A232FE8();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569535C0);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *((_QWORD *)a1 + 8);
  v12 = a1[1];
  v31 = *a1;
  v32 = v12;
  v13 = a1[2];
  v14 = a1[3];
  v29[1] = a1;
  v33 = v13;
  v34 = v14;
  v35 = v11;
  v29[2] = sub_23A23381C();
  v30 = a2;
  v15 = a2 + 56;
  v16 = 1 << *(_BYTE *)(a2 + 32);
  v17 = -1;
  if (v16 < 64)
    v17 = ~(-1 << v16);
  v18 = v17 & *(_QWORD *)(a2 + 56);
  v19 = (unint64_t)(v16 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v21 = 0;
  v22 = 0;
  if (!v18)
    goto LABEL_5;
LABEL_4:
  v23 = __clz(__rbit64(v18));
  v18 &= v18 - 1;
  for (i = v23 | (v22 << 6); ; i = __clz(__rbit64(v26)) + (v22 << 6))
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v5 + 16))(v10, *(_QWORD *)(v30 + 48) + *(_QWORD *)(v5 + 72) * i, v4);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v5 + 56))(v10, 0, 1, v4);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v10, 1, v4) == 1)
      goto LABEL_19;
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v10, v4);
    sub_23A1F58C8((unint64_t *)&qword_256951B90, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
    v28 = sub_23A2330F0();
    result = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    v21 ^= v28;
    if (v18)
      goto LABEL_4;
LABEL_5:
    if (__OFADD__(v22++, 1))
      goto LABEL_21;
    if (v22 >= v19)
      goto LABEL_18;
    v26 = *(_QWORD *)(v15 + 8 * v22);
    if (!v26)
      break;
LABEL_14:
    v18 = (v26 - 1) & v26;
  }
  v27 = v22 + 1;
  if (v22 + 1 >= v19)
  {
LABEL_18:
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v10, 1, 1, v4);
LABEL_19:
    swift_release();
    return sub_23A233804();
  }
  v26 = *(_QWORD *)(v15 + 8 * v27);
  if (v26)
  {
    ++v22;
    goto LABEL_14;
  }
  while (1)
  {
    v22 = v27 + 1;
    if (__OFADD__(v27, 1))
      break;
    if (v22 >= v19)
      goto LABEL_18;
    v26 = *(_QWORD *)(v15 + 8 * v22);
    ++v27;
    if (v26)
      goto LABEL_14;
  }
  __break(1u);
LABEL_21:
  __break(1u);
  return result;
}

uint64_t _s23DarwinDirectoryInternal5GroupV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  int *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  BOOL v15;

  if ((sub_23A232FC4() & 1) == 0)
    return 0;
  v4 = type metadata accessor for Group(0);
  if (*(_DWORD *)(a1 + *(int *)(v4 + 20)) != *(_DWORD *)(a2 + *(int *)(v4 + 20)))
    return 0;
  v5 = (int *)v4;
  v6 = *(int *)(v4 + 24);
  v7 = *(_QWORD *)(a1 + v6);
  v8 = *(_QWORD *)(a1 + v6 + 8);
  v9 = (_QWORD *)(a2 + v6);
  v10 = v7 == *v9 && v8 == v9[1];
  if ((v10 || (sub_23A233660() & 1) != 0)
    && ((v11 = v5[7],
         v12 = *(_QWORD *)(a1 + v11),
         v13 = *(_QWORD *)(a1 + v11 + 8),
         v14 = (_QWORD *)(a2 + v11),
         v12 == *v14)
      ? (v15 = v13 == v14[1])
      : (v15 = 0),
        (v15 || (sub_23A233660() & 1) != 0)
     && (sub_23A21374C(*(_QWORD *)(a1 + v5[8]), *(_QWORD *)(a2 + v5[8])) & 1) != 0))
  {
    return sub_23A213B20(*(_QWORD *)(a1 + v5[9]), *(_QWORD *)(a2 + v5[9]));
  }
  else
  {
    return 0;
  }
}

uint64_t sub_23A2159D4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
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
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  int EnumCaseMultiPayload;
  char v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v30;
  uint64_t v31;

  v31 = a2;
  v3 = type metadata accessor for Group(0);
  v4 = MEMORY[0x24BDAC7A8](v3);
  v30 = (uint64_t)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v30 - v7;
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v30 - v9;
  v11 = type metadata accessor for GroupValidationError(0);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v30 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x24BDAC7A8](v12);
  v17 = (char *)&v30 - v16;
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v30 - v18;
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_256952858);
  v21 = MEMORY[0x24BDAC7A8](v20);
  v23 = (char *)&v30 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = (uint64_t)&v23[*(int *)(v21 + 48)];
  sub_23A1F8E44(a1, (uint64_t)v23, type metadata accessor for GroupValidationError);
  sub_23A1F8E44(v31, v24, type metadata accessor for GroupValidationError);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload)
  {
    if (EnumCaseMultiPayload == 1)
    {
      sub_23A1F8E44((uint64_t)v23, (uint64_t)v17, type metadata accessor for GroupValidationError);
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        sub_23A1F8E88(v24, (uint64_t)v8, type metadata accessor for Group);
        v26 = _s23DarwinDirectoryInternal5GroupV2eeoiySbAC_ACtFZ_0((uint64_t)v17, (uint64_t)v8);
        sub_23A1F8F44((uint64_t)v8, type metadata accessor for Group);
        v27 = (uint64_t)v17;
LABEL_12:
        sub_23A1F8F44(v27, type metadata accessor for Group);
        sub_23A1F8F44((uint64_t)v23, type metadata accessor for GroupValidationError);
        return v26 & 1;
      }
      v14 = v17;
    }
    else
    {
      sub_23A1F8E44((uint64_t)v23, (uint64_t)v14, type metadata accessor for GroupValidationError);
      if (swift_getEnumCaseMultiPayload() == 2)
      {
        v28 = v30;
        sub_23A1F8E88(v24, v30, type metadata accessor for Group);
        v26 = _s23DarwinDirectoryInternal5GroupV2eeoiySbAC_ACtFZ_0((uint64_t)v14, v28);
        sub_23A1F8F44(v28, type metadata accessor for Group);
        v27 = (uint64_t)v14;
        goto LABEL_12;
      }
    }
  }
  else
  {
    sub_23A1F8E44((uint64_t)v23, (uint64_t)v19, type metadata accessor for GroupValidationError);
    if (!swift_getEnumCaseMultiPayload())
    {
      sub_23A1F8E88(v24, (uint64_t)v10, type metadata accessor for Group);
      v26 = _s23DarwinDirectoryInternal5GroupV2eeoiySbAC_ACtFZ_0((uint64_t)v19, (uint64_t)v10);
      sub_23A1F8F44((uint64_t)v10, type metadata accessor for Group);
      v27 = (uint64_t)v19;
      goto LABEL_12;
    }
    v14 = v19;
  }
  sub_23A1F8F44((uint64_t)v14, type metadata accessor for Group);
  sub_23A21ABE0((uint64_t)v23, &qword_256952858);
  v26 = 0;
  return v26 & 1;
}

uint64_t _s23DarwinDirectoryInternal4UserV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  int *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  BOOL v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;

  if ((sub_23A232FC4() & 1) == 0)
    return 0;
  v4 = type metadata accessor for User(0);
  if (*(_DWORD *)(a1 + *(int *)(v4 + 20)) != *(_DWORD *)(a2 + *(int *)(v4 + 20)))
    return 0;
  v5 = (int *)v4;
  v6 = *(int *)(v4 + 24);
  v7 = *(_QWORD *)(a1 + v6);
  v8 = *(_QWORD *)(a1 + v6 + 8);
  v9 = (_QWORD *)(a2 + v6);
  v10 = v7 == *v9 && v8 == v9[1];
  if (!v10 && (sub_23A233660() & 1) == 0)
    return 0;
  if ((sub_23A232FC4() & 1) == 0)
    return 0;
  v11 = v5[8];
  v12 = *(_QWORD *)(a1 + v11);
  v13 = *(_QWORD *)(a1 + v11 + 8);
  v14 = (_QWORD *)(a2 + v11);
  v15 = v12 == *v14 && v13 == v14[1];
  if (!v15 && (sub_23A233660() & 1) == 0)
    return 0;
  v16 = v5[9];
  v17 = *(_QWORD *)(a1 + v16);
  v18 = *(_QWORD *)(a1 + v16 + 8);
  v19 = (_QWORD *)(a2 + v16);
  v20 = v17 == *v19 && v18 == v19[1];
  if (!v20 && (sub_23A233660() & 1) == 0)
    return 0;
  v21 = v5[10];
  v22 = *(_QWORD *)(a1 + v21);
  v23 = *(_QWORD *)(a1 + v21 + 8);
  v24 = (_QWORD *)(a2 + v21);
  if ((v22 != *v24 || v23 != v24[1]) && (sub_23A233660() & 1) == 0)
    return 0;
  if ((sub_23A21374C(*(_QWORD *)(a1 + v5[11]), *(_QWORD *)(a2 + v5[11])) & 1) != 0)
    return sub_23A213B20(*(_QWORD *)(a1 + v5[12]), *(_QWORD *)(a2 + v5[12]));
  else
    return 0;
}

uint64_t type metadata accessor for Group(uint64_t a1)
{
  return sub_23A1FC53C(a1, qword_2569526A0);
}

uint64_t sub_23A215E48()
{
  return sub_23A1F58C8(&qword_256952588, type metadata accessor for User, (uint64_t)&protocol conformance descriptor for User);
}

uint64_t sub_23A215E74()
{
  return sub_23A1F58C8(&qword_256952590, type metadata accessor for Group, (uint64_t)&protocol conformance descriptor for Group);
}

char *initializeBufferWithCopyOfBuffer for User(char *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  void (*v8)(char *, char *, uint64_t);
  uint64_t v9;
  char *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  _QWORD *v19;
  uint64_t v20;
  char *v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v29 = *a2;
    *(_QWORD *)a1 = *a2;
    a1 = (char *)(v29 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_23A232FE8();
    v8 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 16);
    v8(a1, (char *)a2, v7);
    v9 = a3[6];
    *(_DWORD *)&a1[a3[5]] = *(_DWORD *)((char *)a2 + a3[5]);
    v10 = &a1[v9];
    v11 = (uint64_t *)((char *)a2 + v9);
    v12 = v11[1];
    *(_QWORD *)v10 = *v11;
    *((_QWORD *)v10 + 1) = v12;
    v13 = a3[7];
    v14 = &a1[v13];
    v15 = (char *)a2 + v13;
    swift_bridgeObjectRetain();
    v8(v14, v15, v7);
    v16 = a3[8];
    v17 = a3[9];
    v18 = &a1[v16];
    v19 = (uint64_t *)((char *)a2 + v16);
    v20 = v19[1];
    *(_QWORD *)v18 = *v19;
    *((_QWORD *)v18 + 1) = v20;
    v21 = &a1[v17];
    v22 = (uint64_t *)((char *)a2 + v17);
    v23 = v22[1];
    *(_QWORD *)v21 = *v22;
    *((_QWORD *)v21 + 1) = v23;
    v24 = a3[10];
    v25 = a3[11];
    v26 = &a1[v24];
    v27 = (uint64_t *)((char *)a2 + v24);
    v28 = v27[1];
    *(_QWORD *)v26 = *v27;
    *((_QWORD *)v26 + 1) = v28;
    *(_QWORD *)&a1[v25] = *(uint64_t *)((char *)a2 + v25);
    *(_QWORD *)&a1[a3[12]] = *(uint64_t *)((char *)a2 + a3[12]);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for User(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t);

  v4 = sub_23A232FE8();
  v5 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(a1, v4);
  swift_bridgeObjectRelease();
  v5(a1 + *(int *)(a2 + 28), v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for User(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  _QWORD *v26;
  uint64_t v27;

  v6 = sub_23A232FE8();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16);
  v7(a1, a2, v6);
  v8 = a3[6];
  *(_DWORD *)(a1 + a3[5]) = *(_DWORD *)(a2 + a3[5]);
  v9 = (_QWORD *)(a1 + v8);
  v10 = (_QWORD *)(a2 + v8);
  v11 = v10[1];
  *v9 = *v10;
  v9[1] = v11;
  v12 = a3[7];
  v13 = a1 + v12;
  v14 = a2 + v12;
  swift_bridgeObjectRetain();
  v7(v13, v14, v6);
  v15 = a3[8];
  v16 = a3[9];
  v17 = (_QWORD *)(a1 + v15);
  v18 = (_QWORD *)(a2 + v15);
  v19 = v18[1];
  *v17 = *v18;
  v17[1] = v19;
  v20 = (_QWORD *)(a1 + v16);
  v21 = (_QWORD *)(a2 + v16);
  v22 = v21[1];
  *v20 = *v21;
  v20[1] = v22;
  v23 = a3[10];
  v24 = a3[11];
  v25 = (_QWORD *)(a1 + v23);
  v26 = (_QWORD *)(a2 + v23);
  v27 = v26[1];
  *v25 = *v26;
  v25[1] = v27;
  *(_QWORD *)(a1 + v24) = *(_QWORD *)(a2 + v24);
  *(_QWORD *)(a1 + a3[12]) = *(_QWORD *)(a2 + a3[12]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for User(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;

  v6 = sub_23A232FE8();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24);
  v7(a1, a2, v6);
  *(_DWORD *)(a1 + a3[5]) = *(_DWORD *)(a2 + a3[5]);
  v8 = a3[6];
  v9 = (_QWORD *)(a1 + v8);
  v10 = (_QWORD *)(a2 + v8);
  *v9 = *v10;
  v9[1] = v10[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v7(a1 + a3[7], a2 + a3[7], v6);
  v11 = a3[8];
  v12 = (_QWORD *)(a1 + v11);
  v13 = (_QWORD *)(a2 + v11);
  *v12 = *v13;
  v12[1] = v13[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v14 = a3[9];
  v15 = (_QWORD *)(a1 + v14);
  v16 = (_QWORD *)(a2 + v14);
  *v15 = *v16;
  v15[1] = v16[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v17 = a3[10];
  v18 = (_QWORD *)(a1 + v17);
  v19 = (_QWORD *)(a2 + v17);
  *v18 = *v19;
  v18[1] = v19[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + a3[11]) = *(_QWORD *)(a2 + a3[11]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + a3[12]) = *(_QWORD *)(a2 + a3[12]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for User(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = sub_23A232FE8();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32);
  v7(a1, a2, v6);
  v8 = a3[6];
  *(_DWORD *)(a1 + a3[5]) = *(_DWORD *)(a2 + a3[5]);
  *(_OWORD *)(a1 + v8) = *(_OWORD *)(a2 + v8);
  v7(a1 + a3[7], a2 + a3[7], v6);
  v9 = a3[9];
  *(_OWORD *)(a1 + a3[8]) = *(_OWORD *)(a2 + a3[8]);
  *(_OWORD *)(a1 + v9) = *(_OWORD *)(a2 + v9);
  v10 = a3[11];
  *(_OWORD *)(a1 + a3[10]) = *(_OWORD *)(a2 + a3[10]);
  *(_QWORD *)(a1 + v10) = *(_QWORD *)(a2 + v10);
  *(_QWORD *)(a1 + a3[12]) = *(_QWORD *)(a2 + a3[12]);
  return a1;
}

uint64_t assignWithTake for User(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  _QWORD *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;

  v6 = sub_23A232FE8();
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40);
  v7(a1, a2, v6);
  v8 = a3[6];
  *(_DWORD *)(a1 + a3[5]) = *(_DWORD *)(a2 + a3[5]);
  v9 = (_QWORD *)(a1 + v8);
  v10 = (uint64_t *)(a2 + v8);
  v12 = *v10;
  v11 = v10[1];
  *v9 = v12;
  v9[1] = v11;
  swift_bridgeObjectRelease();
  v7(a1 + a3[7], a2 + a3[7], v6);
  v13 = a3[8];
  v14 = (_QWORD *)(a1 + v13);
  v15 = (uint64_t *)(a2 + v13);
  v17 = *v15;
  v16 = v15[1];
  *v14 = v17;
  v14[1] = v16;
  swift_bridgeObjectRelease();
  v18 = a3[9];
  v19 = (_QWORD *)(a1 + v18);
  v20 = (uint64_t *)(a2 + v18);
  v22 = *v20;
  v21 = v20[1];
  *v19 = v22;
  v19[1] = v21;
  swift_bridgeObjectRelease();
  v23 = a3[10];
  v24 = (_QWORD *)(a1 + v23);
  v25 = (uint64_t *)(a2 + v23);
  v27 = *v25;
  v26 = v25[1];
  *v24 = v27;
  v24[1] = v26;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + a3[11]) = *(_QWORD *)(a2 + a3[11]);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + a3[12]) = *(_QWORD *)(a2 + a3[12]);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for User()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t storeEnumTagSinglePayload for User()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_23A2164E4()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23A232FE8();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for Group(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v17 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v17 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_23A232FE8();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[6];
    *(_DWORD *)((char *)a1 + a3[5]) = *(_DWORD *)((char *)a2 + a3[5]);
    v9 = (uint64_t *)((char *)a1 + v8);
    v10 = (uint64_t *)((char *)a2 + v8);
    v11 = v10[1];
    *v9 = *v10;
    v9[1] = v11;
    v12 = a3[7];
    v13 = a3[8];
    v14 = (uint64_t *)((char *)a1 + v12);
    v15 = (uint64_t *)((char *)a2 + v12);
    v16 = v15[1];
    *v14 = *v15;
    v14[1] = v16;
    *(uint64_t *)((char *)a1 + v13) = *(uint64_t *)((char *)a2 + v13);
    *(uint64_t *)((char *)a1 + a3[9]) = *(uint64_t *)((char *)a2 + a3[9]);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for Group(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_23A232FE8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for Group(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;

  v6 = sub_23A232FE8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[6];
  *(_DWORD *)(a1 + a3[5]) = *(_DWORD *)(a2 + a3[5]);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  v10 = v9[1];
  *v8 = *v9;
  v8[1] = v10;
  v11 = a3[7];
  v12 = a3[8];
  v13 = (_QWORD *)(a1 + v11);
  v14 = (_QWORD *)(a2 + v11);
  v15 = v14[1];
  *v13 = *v14;
  v13[1] = v15;
  *(_QWORD *)(a1 + v12) = *(_QWORD *)(a2 + v12);
  *(_QWORD *)(a1 + a3[9]) = *(_QWORD *)(a2 + a3[9]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for Group(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;

  v6 = sub_23A232FE8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  *(_DWORD *)(a1 + a3[5]) = *(_DWORD *)(a2 + a3[5]);
  v7 = a3[6];
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  *v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v10 = a3[7];
  v11 = (_QWORD *)(a1 + v10);
  v12 = (_QWORD *)(a2 + v10);
  *v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + a3[8]) = *(_QWORD *)(a2 + a3[8]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + a3[9]) = *(_QWORD *)(a2 + a3[9]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for Group(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_23A232FE8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[6];
  *(_DWORD *)(a1 + a3[5]) = *(_DWORD *)(a2 + a3[5]);
  *(_OWORD *)(a1 + v7) = *(_OWORD *)(a2 + v7);
  v8 = a3[8];
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  *(_QWORD *)(a1 + v8) = *(_QWORD *)(a2 + v8);
  *(_QWORD *)(a1 + a3[9]) = *(_QWORD *)(a2 + a3[9]);
  return a1;
}

uint64_t assignWithTake for Group(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v6 = sub_23A232FE8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = a3[6];
  *(_DWORD *)(a1 + a3[5]) = *(_DWORD *)(a2 + a3[5]);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (uint64_t *)(a2 + v7);
  v11 = *v9;
  v10 = v9[1];
  *v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  v12 = a3[7];
  v13 = (_QWORD *)(a1 + v12);
  v14 = (uint64_t *)(a2 + v12);
  v16 = *v14;
  v15 = v14[1];
  *v13 = v16;
  v13[1] = v15;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + a3[8]) = *(_QWORD *)(a2 + a3[8]);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + a3[9]) = *(_QWORD *)(a2 + a3[9]);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for Group()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t __swift_get_extra_inhabitant_indexTm(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = sub_23A232FE8();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 24) + 8);
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t storeEnumTagSinglePayload for Group()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t __swift_store_extra_inhabitant_indexTm(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_23A232FE8();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 24) + 8) = (a2 - 1);
  return result;
}

uint64_t sub_23A216ACC()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23A232FE8();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void sub_23A216B5C(uint64_t a1, uint64_t a2)
{
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  _QWORD v21[4];
  uint64_t v22;
  uint64_t v23;

  v22 = a1;
  v23 = a2;
  v2 = type metadata accessor for User(0);
  v3 = MEMORY[0x24BDAC7A8](v2);
  v21[3] = (char *)v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v21[2] = (char *)v21 - v6;
  v7 = MEMORY[0x24BDAC7A8](v5);
  v21[1] = (char *)v21 - v8;
  v9 = MEMORY[0x24BDAC7A8](v7);
  v21[0] = (char *)v21 - v10;
  MEMORY[0x24BDAC7A8](v9);
  v11 = type metadata accessor for UserValidationError(0);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v13 = MEMORY[0x24BDAC7A8](v12);
  v14 = MEMORY[0x24BDAC7A8](v13);
  v15 = MEMORY[0x24BDAC7A8](v14);
  MEMORY[0x24BDAC7A8](v15);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_256952850);
  v17 = MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)v21 + *(int *)(v17 + 48) - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23A1F8E44(v22, (uint64_t)v21 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for UserValidationError);
  sub_23A1F8E44(v23, (uint64_t)v19, type metadata accessor for UserValidationError);
  v20 = (char *)sub_23A216D6C + 4 * byte_23A234B25[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_23A216D6C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;

  sub_23A1F8E44(v0, v2, type metadata accessor for UserValidationError);
  if (swift_getEnumCaseMultiPayload())
  {
    sub_23A1F8F44(v2, type metadata accessor for User);
    sub_23A21ABE0(v0, &qword_256952850);
    v4 = 0;
  }
  else
  {
    sub_23A1F8E88(v1, v3, type metadata accessor for User);
    v4 = _s23DarwinDirectoryInternal4UserV2eeoiySbAC_ACtFZ_0(v2, v3);
    sub_23A1F8F44(v3, type metadata accessor for User);
    sub_23A1F8F44(v2, type metadata accessor for User);
    sub_23A1F8F44(v0, type metadata accessor for UserValidationError);
  }
  return v4 & 1;
}

uint8_t *sub_23A216FEC(unint64_t a1, unint64_t a2, void (*a3)(unint64_t *, _QWORD **), uint64_t a4, _QWORD *a5)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(_QWORD *, uint64_t, uint64_t);
  int *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  void (*v44)(_QWORD, _QWORD, _QWORD);
  uint64_t *v45;
  _QWORD *v46;
  uint64_t v47;
  uint8_t **v48;
  _QWORD *v49;
  unint64_t v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t v55;
  void (*v56)(char *, uint64_t, uint64_t);
  uint64_t v57;
  int *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t v64;
  _QWORD *v65;
  uint64_t v66;
  _QWORD *v67;
  _QWORD *v68;
  _QWORD *v69;
  unint64_t v70;
  unint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  int v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  int *v86;
  char *v87;
  char *v88;
  unint64_t v89;
  unint64_t v90;
  uint64_t *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  int *v100;
  _QWORD *v101;
  _QWORD *v102;
  _QWORD *v103;
  uint64_t v104;
  uint8_t *v105;
  _QWORD *v106;
  _QWORD *v107;
  NSObject *v108;
  os_log_type_t v109;
  _QWORD *v110;
  _QWORD *v111;
  uint64_t v112;
  unint64_t v113;
  uint64_t v114;
  uint64_t v115;
  char *v117;
  uint64_t v118;
  char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  char *v123;
  uint64_t v124;
  uint8_t *v125;
  char *v126;
  uint64_t v127;
  uint64_t v128;
  void (*v129)(char *, uint64_t, uint64_t);
  char *v130;
  uint64_t v131;
  _QWORD *v132;
  void (*v133)(_QWORD, _QWORD, _QWORD);
  uint64_t *v134;
  uint64_t v135;
  uint64_t v136;
  char *v137;
  uint64_t v138;
  uint64_t v139;
  uint8_t *v140;
  void (*v141)(uint64_t, char *, uint64_t);
  _QWORD *v142;
  uint64_t v143;
  _QWORD *v144;
  _QWORD *v145;
  uint64_t v146;
  char *v147;
  uint64_t v148;
  _QWORD *v149;
  char *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  int *v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  char *v159;
  uint64_t v160;
  uint64_t *v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  void (*v166)(uint64_t, char *, uint64_t);
  char *v167;
  uint64_t v168;
  uint64_t v169;
  char *v170;
  _QWORD *v171;
  char *v172;
  uint64_t v173;
  void (*v174)(unint64_t *, _QWORD **);
  _QWORD *v175;
  char *v176;
  char *v177;
  char *v178;
  char *v179;
  char *v180;
  uint64_t v181;
  unint64_t v182;
  uint64_t v183;
  int *v184;
  uint64_t v185;
  int *v186;
  uint64_t v187;
  void (*v188)(_QWORD, _QWORD, _QWORD);
  uint64_t v189;
  _QWORD *v190;
  uint8_t *v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  char *v198;
  _QWORD *v199;
  _QWORD *v200;
  unint64_t v201;

  v171 = a5;
  v173 = a4;
  v174 = a3;
  v182 = a2;
  v197 = sub_23A232FE8();
  v6 = *(_QWORD *)(v197 - 8);
  v7 = MEMORY[0x24BDAC7A8](v197);
  v177 = (char *)&v169 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v169 - v9;
  v11 = type metadata accessor for Group(0);
  v183 = *(_QWORD *)(v11 - 8);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v176 = (char *)&v169 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v16 = (unint64_t)&v169 - v15;
  v17 = MEMORY[0x24BDAC7A8](v14);
  v19 = (char *)&v169 - v18;
  MEMORY[0x24BDAC7A8](v17);
  v198 = (char *)&v169 - v20;
  v21 = type metadata accessor for User(0);
  v185 = *(_QWORD *)(v21 - 8);
  v186 = (int *)v21;
  v22 = MEMORY[0x24BDAC7A8](v21);
  v24 = (int *)((char *)&v169 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0));
  v25 = MEMORY[0x24BDAC7A8](v22);
  v180 = (char *)&v169 - v26;
  v27 = MEMORY[0x24BDAC7A8](v25);
  v172 = (char *)&v169 - v28;
  MEMORY[0x24BDAC7A8](v27);
  v30 = (uint64_t *)((char *)&v169 - v29);
  v181 = a1;
  if (a1 >> 62)
  {
LABEL_57:
    swift_bridgeObjectRetain();
    v168 = sub_23A2333D8();
    swift_bridgeObjectRelease();
    v31 = v168;
  }
  else
  {
    v31 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v32 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v196 = v6;
  v178 = v10;
  v184 = (int *)v11;
  v179 = v19;
  v170 = (char *)v16;
  if (v31)
  {
    v200 = (_QWORD *)MEMORY[0x24BEE4AF8];
    v195 = v31;
    sub_23A20D488(0, v31 & ~(v31 >> 63), 0);
    v33 = v195;
    if (v195 < 0)
    {
      __break(1u);
      goto LABEL_60;
    }
    v32 = v200;
    if ((v181 & 0xC000000000000001) != 0)
    {
      v34 = 0;
      v35 = v197;
      do
      {
        v189 = v34;
        v36 = MEMORY[0x23B84508C]();
        v37 = *(void (**)(_QWORD *, uint64_t, uint64_t))(v196 + 16);
        v37(v30, v36 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_uuid, v35);
        LODWORD(v193) = *(_DWORD *)(v36 + 16);
        v194 = *(_QWORD *)(v36 + 24);
        v188 = *(void (**)(_QWORD, _QWORD, _QWORD))(v36 + 32);
        v38 = v186;
        v37((_QWORD *)((char *)v30 + v186[7]), v36 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_primaryGroupUUID, v35);
        v39 = *(_QWORD *)(v36 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_fullName + 8);
        v192 = *(_QWORD *)(v36 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_fullName);
        v187 = v39;
        v16 = *(_QWORD *)(v36 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_homeDirectory + 8);
        v191 = *(uint8_t **)(v36 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_homeDirectory);
        v40 = *(_QWORD *)(v36 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_shell + 8);
        v190 = *(_QWORD **)(v36 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_shell);
        v41 = (uint64_t *)(v36 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_memberships);
        swift_beginAccess();
        v42 = *v41;
        v43 = *(_QWORD *)(v36 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_aliases);
        v44 = v188;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_unknownObjectRelease();
        *(_DWORD *)((char *)v30 + v38[5]) = v193;
        v45 = (_QWORD *)((char *)v30 + v38[6]);
        *v45 = v194;
        v45[1] = (uint64_t)v44;
        v46 = (_QWORD *)((char *)v30 + v38[8]);
        v47 = v187;
        *v46 = v192;
        v46[1] = v47;
        v48 = (uint8_t **)((char *)v30 + v38[9]);
        *v48 = v191;
        v48[1] = (uint8_t *)v16;
        v49 = (_QWORD *)((char *)v30 + v38[10]);
        *v49 = v190;
        v49[1] = v40;
        *(_QWORD *)((char *)v30 + v38[11]) = v42;
        *(_QWORD *)((char *)v30 + v38[12]) = v43;
        v200 = v32;
        v51 = v32[2];
        v50 = v32[3];
        if (v51 >= v50 >> 1)
        {
          sub_23A20D488(v50 > 1, v51 + 1, 1);
          v32 = v200;
        }
        v52 = v189 + 1;
        v32[2] = v51 + 1;
        sub_23A1F8E88((uint64_t)v30, (uint64_t)v32+ ((*(unsigned __int8 *)(v185 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v185 + 80))+ *(_QWORD *)(v185 + 72) * v51, type metadata accessor for User);
        v35 = v197;
        v34 = v52;
      }
      while (v195 != v52);
    }
    else
    {
      v53 = (uint64_t *)(v181 + 32);
      v54 = v197;
      v188 = *(void (**)(_QWORD, _QWORD, _QWORD))(v196 + 16);
      do
      {
        v194 = (uint64_t)v53;
        v195 = v33;
        v55 = *v53;
        v56 = (void (*)(char *, uint64_t, uint64_t))v188;
        v188(v24, *v53 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_uuid, v54);
        LODWORD(v191) = *(_DWORD *)(v55 + 16);
        v57 = *(_QWORD *)(v55 + 24);
        v192 = *(_QWORD *)(v55 + 32);
        v193 = v57;
        v58 = v186;
        v56((char *)v24 + v186[7], v55 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_primaryGroupUUID, v54);
        v60 = *(_QWORD *)(v55 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_fullName);
        v59 = *(_QWORD *)(v55 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_fullName + 8);
        v16 = *(_QWORD *)(v55 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_homeDirectory + 8);
        v190 = *(_QWORD **)(v55 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_homeDirectory);
        v61 = *(_QWORD *)(v55 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_shell + 8);
        v189 = *(_QWORD *)(v55 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_shell);
        v62 = (uint64_t *)(v55 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_memberships);
        swift_beginAccess();
        v63 = *(_QWORD *)(v55 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_aliases);
        v64 = *v62;
        *(int *)((char *)v24 + v58[5]) = (int)v191;
        v65 = (_QWORD *)((char *)v24 + v58[6]);
        v66 = v192;
        *v65 = v193;
        v65[1] = v66;
        v67 = (_QWORD *)((char *)v24 + v58[8]);
        *v67 = v60;
        v67[1] = v59;
        v68 = (_QWORD *)((char *)v24 + v58[9]);
        *v68 = v190;
        v68[1] = v16;
        v69 = (_QWORD *)((char *)v24 + v58[10]);
        *v69 = v189;
        v69[1] = v61;
        *(_QWORD *)((char *)v24 + v58[11]) = v64;
        *(_QWORD *)((char *)v24 + v58[12]) = v63;
        v200 = v32;
        v71 = v32[2];
        v70 = v32[3];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (v71 >= v70 >> 1)
        {
          sub_23A20D488(v70 > 1, v71 + 1, 1);
          v32 = v200;
        }
        v32[2] = v71 + 1;
        sub_23A1F8E88((uint64_t)v24, (uint64_t)v32+ ((*(unsigned __int8 *)(v185 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v185 + 80))+ *(_QWORD *)(v185 + 72) * v71, type metadata accessor for User);
        v53 = (uint64_t *)(v194 + 8);
        v33 = v195 - 1;
        v54 = v197;
      }
      while (v195 != 1);
    }
    v19 = v179;
  }
  v11 = v182;
  v201 = (unint64_t)v32;
  v24 = v186;
  v72 = (uint64_t)v176;
  if (v182 >> 62)
  {
    swift_bridgeObjectRetain();
    v73 = sub_23A2333D8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v73 = *(_QWORD *)((v182 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v74 = v196;
  v75 = (uint64_t)v19;
  v30 = (_QWORD *)MEMORY[0x24BEE4AF8];
  if (!v73)
    goto LABEL_31;
  v199 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v194 = v73;
  sub_23A20D45C(0, v73 & ~(v73 >> 63), 0);
  v76 = v194;
  if (v194 < 0)
  {
LABEL_60:
    __break(1u);
    goto LABEL_61;
  }
  v30 = v199;
  if ((v11 & 0xC000000000000001) != 0)
  {
    v77 = 0;
    v78 = v197;
    v79 = (uint64_t)v198;
    do
    {
      v80 = MEMORY[0x23B84508C](v77, v11);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v196 + 16))(v79, v80 + OBJC_IVAR____TtC23DarwinDirectoryInternal11GroupRecord_uuid, v78);
      v81 = *(_DWORD *)(v80 + 32);
      v83 = *(_QWORD *)(v80 + 40);
      v82 = *(_QWORD *)(v80 + 48);
      v84 = *(_QWORD *)(v80 + 24);
      v195 = *(_QWORD *)(v80 + 16);
      v85 = *(_QWORD *)(v80 + OBJC_IVAR____TtC23DarwinDirectoryInternal11GroupRecord_nestedGroups);
      v16 = *(_QWORD *)(v80 + OBJC_IVAR____TtC23DarwinDirectoryInternal11GroupRecord_aliases);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_unknownObjectRelease();
      v86 = v184;
      *(_DWORD *)&v198[v184[5]] = v81;
      v87 = &v198[v86[6]];
      *(_QWORD *)v87 = v83;
      *((_QWORD *)v87 + 1) = v82;
      v88 = &v198[v86[7]];
      *(_QWORD *)v88 = v195;
      *((_QWORD *)v88 + 1) = v84;
      *(_QWORD *)&v198[v86[8]] = v85;
      v79 = (uint64_t)v198;
      *(_QWORD *)&v198[v86[9]] = v16;
      v199 = v30;
      v90 = v30[2];
      v89 = v30[3];
      if (v90 >= v89 >> 1)
      {
        sub_23A20D45C(v89 > 1, v90 + 1, 1);
        v30 = v199;
      }
      ++v77;
      v30[2] = v90 + 1;
      sub_23A1F8E88(v79, (uint64_t)v30+ ((*(unsigned __int8 *)(v183 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v183 + 80))+ *(_QWORD *)(v183 + 72) * v90, type metadata accessor for Group);
      v78 = v197;
      v11 = v182;
    }
    while (v194 != v77);
  }
  else
  {
    v91 = (uint64_t *)(v11 + 32);
    v198 = *(char **)(v74 + 16);
    v92 = v197;
    do
    {
      v93 = *v91;
      ((void (*)(uint64_t, uint64_t, uint64_t))v198)(v72, *v91 + OBJC_IVAR____TtC23DarwinDirectoryInternal11GroupRecord_uuid, v92);
      v95 = *(_QWORD *)(v93 + 40);
      v94 = *(_QWORD *)(v93 + 48);
      v96 = *(_QWORD *)(v93 + 16);
      v97 = *(_QWORD *)(v93 + 24);
      v98 = *(_QWORD *)(v93 + OBJC_IVAR____TtC23DarwinDirectoryInternal11GroupRecord_nestedGroups);
      v99 = *(_QWORD *)(v93 + OBJC_IVAR____TtC23DarwinDirectoryInternal11GroupRecord_aliases);
      v100 = v184;
      *(_DWORD *)(v72 + v184[5]) = *(_DWORD *)(v93 + 32);
      v101 = (_QWORD *)(v72 + v100[6]);
      *v101 = v95;
      v101[1] = v94;
      v102 = (_QWORD *)(v72 + v100[7]);
      *v102 = v96;
      v102[1] = v97;
      *(_QWORD *)(v72 + v100[8]) = v98;
      *(_QWORD *)(v72 + v100[9]) = v99;
      v199 = v30;
      v16 = v30[2];
      v11 = v30[3];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v16 >= v11 >> 1)
      {
        sub_23A20D45C(v11 > 1, v16 + 1, 1);
        v30 = v199;
      }
      v30[2] = v16 + 1;
      sub_23A1F8E88(v72, (uint64_t)v30+ ((*(unsigned __int8 *)(v183 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v183 + 80))+ *(_QWORD *)(v183 + 72) * v16, type metadata accessor for Group);
      ++v91;
      --v76;
      v92 = v197;
    }
    while (v76);
  }
  v75 = (uint64_t)v179;
  v24 = v186;
LABEL_31:
  v200 = v30;
  v103 = v175;
  v174(&v201, &v200);
  v30 = v103;
  if (v103)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_256951AC8 == -1)
    {
LABEL_33:
      v104 = sub_23A23300C();
      v105 = (uint8_t *)__swift_project_value_buffer(v104, (uint64_t)qword_256952570);
      v106 = v30;
      v107 = v30;
      v108 = sub_23A232FF4();
      v109 = sub_23A233264();
      if (os_log_type_enabled(v108, v109))
      {
        v105 = (uint8_t *)swift_slowAlloc();
        v110 = (_QWORD *)swift_slowAlloc();
        *(_DWORD *)v105 = 138543362;
        v111 = v30;
        v112 = _swift_stdlib_bridgeErrorToNSError();
        v199 = (_QWORD *)v112;
        sub_23A233288();
        *v110 = v112;
        MEMORY[0x23B845920](v30);
        MEMORY[0x23B845920](v30);
        _os_log_impl(&dword_23A1F0000, v108, v109, "Failed to update local users and groups: Performer failed: %{public}@", v105, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_2569526E8);
        swift_arrayDestroy();
        MEMORY[0x23B845A58](v110, -1, -1);
        MEMORY[0x23B845A58](v105, -1, -1);
      }
      else
      {
        MEMORY[0x23B845920](v30);
        MEMORY[0x23B845920](v30);
      }

      swift_willThrow();
      return v105;
    }
LABEL_61:
    swift_once();
    goto LABEL_33;
  }
  v113 = v201;
  v114 = swift_bridgeObjectRetain();
  sub_23A214A34(v114);
  swift_bridgeObjectRelease();
  v115 = swift_bridgeObjectRetain();
  sub_23A214DD0(v115);
  swift_bridgeObjectRelease();
  v19 = *(char **)(v113 + 16);
  v182 = 0;
  if (v19)
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0)
      v181 = v113;
    else
      v181 = sub_23A205130(v113);
    v117 = 0;
    v30 = v171;
    v6 = v181;
    do
    {
      v10 = *(char **)(v6 + 16);
      swift_bridgeObjectRetain();
      if (v117 >= v10)
      {
        __break(1u);
        goto LABEL_57;
      }
      v11 = (*(unsigned __int8 *)(v185 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v185 + 80);
      v118 = *(_QWORD *)(v185 + 72);
      sub_23A209DC0((uint64_t)v30);
      ++v117;
    }
    while (v19 != v117);
    v201 = v6;
    v119 = *(char **)(v6 + 16);
    v105 = (uint8_t *)MEMORY[0x24BEE4AF8];
    if (v119)
    {
      v199 = (_QWORD *)MEMORY[0x24BEE4AF8];
      swift_bridgeObjectRetain();
      sub_23A233384();
      v120 = v6 + v11;
      v121 = (uint64_t)v180;
      v122 = (uint64_t)v172;
      v123 = v177;
      do
      {
        v198 = v119;
        sub_23A1F8E44(v120, v122, type metadata accessor for User);
        sub_23A1F8E44(v122, v121, type metadata accessor for User);
        v124 = v24[6];
        LODWORD(v195) = *(_DWORD *)(v121 + v24[5]);
        v125 = *(uint8_t **)(v121 + v124 + 8);
        v194 = *(_QWORD *)(v121 + v124);
        v191 = v125;
        v126 = v123;
        v128 = v196;
        v127 = v197;
        v129 = *(void (**)(char *, uint64_t, uint64_t))(v196 + 16);
        v130 = v178;
        v129(v178, v121, v197);
        v131 = v24[7];
        v132 = (_QWORD *)(v121 + v24[8]);
        v133 = (void (*)(_QWORD, _QWORD, _QWORD))*v132;
        v187 = v132[1];
        v188 = v133;
        v134 = (uint64_t *)(v121 + v24[9]);
        v135 = v134[1];
        v189 = *v134;
        v129(v126, (uint64_t)&v180[v131], v127);
        v136 = v24[11];
        v137 = &v180[v24[10]];
        v138 = *((_QWORD *)v137 + 1);
        v190 = *(_QWORD **)v137;
        v192 = *(_QWORD *)&v180[v136];
        v193 = *(_QWORD *)&v180[v24[12]];
        type metadata accessor for UserRecord(0);
        v139 = swift_allocObject();
        *(_DWORD *)(v139 + 16) = v195;
        v140 = v191;
        *(_QWORD *)(v139 + 24) = v194;
        *(_QWORD *)(v139 + 32) = v140;
        v141 = *(void (**)(uint64_t, char *, uint64_t))(v128 + 32);
        v141(v139 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_uuid, v130, v127);
        v142 = (_QWORD *)(v139 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_fullName);
        v143 = v187;
        *v142 = v188;
        v142[1] = v143;
        v144 = (_QWORD *)(v139 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_homeDirectory);
        *v144 = v189;
        v144[1] = v135;
        v141(v139 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_primaryGroupUUID, v177, v127);
        v123 = v177;
        v145 = (_QWORD *)(v139 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_shell);
        *v145 = v190;
        v145[1] = v138;
        v146 = v193;
        *(_QWORD *)(v139 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_memberships) = v192;
        *(_QWORD *)(v139 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_aliases) = v146;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v121 = (uint64_t)v180;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v122 = (uint64_t)v172;
        swift_bridgeObjectRetain();
        v24 = v186;
        swift_bridgeObjectRetain();
        sub_23A1F8F44(v121, type metadata accessor for User);
        sub_23A1F8F44(v122, type metadata accessor for User);
        sub_23A23336C();
        sub_23A233390();
        v147 = v198;
        sub_23A23339C();
        sub_23A233378();
        v120 += v118;
        v119 = v147 - 1;
      }
      while (v119);
      v105 = (uint8_t *)v199;
      swift_bridgeObjectRelease();
    }
    v148 = v197;
    v75 = (uint64_t)v179;
  }
  else
  {
    v105 = (uint8_t *)MEMORY[0x24BEE4AF8];
    v148 = v197;
  }
  v149 = v200;
  v150 = (char *)v200[2];
  if (v150)
  {
    v191 = v105;
    v199 = (_QWORD *)MEMORY[0x24BEE4AF8];
    swift_bridgeObjectRetain();
    sub_23A233384();
    v151 = *(unsigned __int8 *)(v183 + 80);
    v190 = v149;
    v152 = (uint64_t)v149 + ((v151 + 32) & ~v151);
    v192 = *(_QWORD *)(v183 + 72);
    v153 = (uint64_t)v170;
    do
    {
      v198 = v150;
      sub_23A1F8E44(v152, v75, type metadata accessor for Group);
      sub_23A1F8E44(v75, v153, type metadata accessor for Group);
      v154 = v184;
      v155 = v184[6];
      LODWORD(v195) = *(_DWORD *)(v153 + v184[5]);
      v156 = *(_QWORD *)(v153 + v155 + 8);
      v194 = *(_QWORD *)(v153 + v155);
      v157 = v196;
      v158 = v148;
      v159 = v178;
      (*(void (**)(char *, uint64_t, uint64_t))(v196 + 16))(v178, v153, v158);
      v160 = v154[8];
      v161 = (uint64_t *)(v153 + v154[7]);
      v162 = v161[1];
      v193 = *v161;
      v163 = *(_QWORD *)(v153 + v160);
      v164 = *(_QWORD *)(v153 + v154[9]);
      type metadata accessor for GroupRecord(0);
      v165 = swift_allocObject();
      *(_DWORD *)(v165 + 32) = v195;
      *(_QWORD *)(v165 + 40) = v194;
      *(_QWORD *)(v165 + 48) = v156;
      v166 = *(void (**)(uint64_t, char *, uint64_t))(v157 + 32);
      v167 = v198;
      v166(v165 + OBJC_IVAR____TtC23DarwinDirectoryInternal11GroupRecord_uuid, v159, v197);
      *(_QWORD *)(v165 + 16) = v193;
      *(_QWORD *)(v165 + 24) = v162;
      v148 = v197;
      *(_QWORD *)(v165 + OBJC_IVAR____TtC23DarwinDirectoryInternal11GroupRecord_nestedGroups) = v163;
      *(_QWORD *)(v165 + OBJC_IVAR____TtC23DarwinDirectoryInternal11GroupRecord_aliases) = v164;
      swift_bridgeObjectRetain();
      v75 = (uint64_t)v179;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_23A1F8F44(v153, type metadata accessor for Group);
      sub_23A1F8F44(v75, type metadata accessor for Group);
      sub_23A23336C();
      sub_23A233390();
      sub_23A23339C();
      sub_23A233378();
      v152 += v192;
      v150 = v167 - 1;
    }
    while (v150);
    swift_bridgeObjectRelease();
    v105 = v191;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v105;
}

uint64_t type metadata accessor for GroupValidationError(uint64_t a1)
{
  return sub_23A1FC53C(a1, qword_256952818);
}

uint64_t type metadata accessor for UserValidationError(uint64_t a1)
{
  return sub_23A1FC53C(a1, qword_256952770);
}

uint8_t *sub_23A2182C0(unint64_t a1, unint64_t a2, uint64_t a3, void (**a4)(_QWORD, _QWORD, _QWORD, _QWORD))
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
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int *v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  int *v37;
  uint64_t v38;
  void (*v39)(unint64_t, uint64_t, char *);
  unint64_t v40;
  char *v41;
  uint64_t v42;
  void (*v43)(_QWORD, _QWORD, _QWORD);
  unint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  char *v49;
  char *v50;
  void (*v51)(_QWORD, _QWORD, _QWORD);
  unint64_t *v52;
  unint64_t v53;
  unint64_t v54;
  unint64_t v55;
  unint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  void (*v61)(uint8_t *, uint64_t, char *);
  uint64_t v62;
  int *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  uint64_t v71;
  char *v72;
  char *v73;
  char *v74;
  uint64_t v75;
  unint64_t v76;
  unint64_t v77;
  uint8_t *v78;
  uint64_t v79;
  int v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  int *v87;
  char *v88;
  char *v89;
  unint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  int *v97;
  char *v98;
  char *v99;
  unint64_t v100;
  unint64_t v101;
  unint64_t v102;
  uint64_t v103;
  uint8_t *v104;
  id v105;
  id v106;
  NSObject *v107;
  os_log_type_t v108;
  _QWORD *v109;
  id v110;
  uint64_t v111;
  unint64_t v112;
  uint64_t v113;
  uint64_t v114;
  char *v116;
  unint64_t v117;
  char *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  void (*v126)(unint64_t, uint64_t, char *);
  unint64_t v127;
  uint64_t v128;
  uint64_t *v129;
  unint64_t v130;
  uint64_t v131;
  uint64_t *v132;
  unint64_t v133;
  int *v134;
  uint64_t v135;
  unint64_t *v136;
  unint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint8_t *v140;
  void (*v141)(uint64_t, unint64_t, char *);
  _QWORD *v142;
  unint64_t v143;
  unint64_t *v144;
  void (*v145)(_QWORD, _QWORD, _QWORD);
  int *v146;
  uint64_t v147;
  unint64_t *v148;
  char *v149;
  unint64_t v150;
  char *v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  char *v156;
  uint64_t v157;
  int *v158;
  uint64_t v159;
  uint64_t v160;
  unint64_t v161;
  uint64_t v162;
  uint64_t *v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  char *v167;
  char *v168;
  char *v169;
  int *v170;
  void (**v171)(_QWORD, _QWORD, _QWORD, _QWORD);
  unint64_t v172;
  char *v173;
  unint64_t v174;
  uint64_t v175;
  unint64_t v176;
  char *v177;
  unint64_t v178;
  unint64_t v179;
  uint64_t v180;
  int *v181;
  uint64_t v182;
  int *v183;
  void (*v184)(_QWORD, _QWORD, _QWORD);
  unint64_t v185;
  unint64_t v186;
  uint8_t *v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  char *v192;
  uint8_t *v193;
  char *v194;
  char *v195;
  uint8_t *v196;
  unint64_t v197;
  unint64_t v198;

  v171 = a4;
  v175 = a3;
  v179 = a2;
  v5 = type metadata accessor for User(0);
  v182 = *(_QWORD *)(v5 - 8);
  v183 = (int *)v5;
  v6 = MEMORY[0x24BDAC7A8](v5);
  v195 = (char *)&v168 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v193 = (uint8_t *)&v168 - v9;
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v168 - v11;
  MEMORY[0x24BDAC7A8](v10);
  v14 = (unint64_t)&v168 - v13;
  v15 = sub_23A232FE8();
  v16 = *(_QWORD *)(v15 - 8);
  v17 = MEMORY[0x24BDAC7A8](v15);
  v19 = (int *)((char *)&v168 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v17);
  v21 = (unint64_t)&v168 - v20;
  v22 = type metadata accessor for Group(0);
  v180 = *(_QWORD *)(v22 - 8);
  v181 = (int *)v22;
  v23 = MEMORY[0x24BDAC7A8](v22);
  v194 = (char *)&v168 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = MEMORY[0x24BDAC7A8](v23);
  v173 = (char *)&v168 - v26;
  v27 = MEMORY[0x24BDAC7A8](v25);
  v29 = (char *)&v168 - v28;
  MEMORY[0x24BDAC7A8](v27);
  v31 = (char *)&v168 - v30;
  v178 = a1;
  if (a1 >> 62)
  {
LABEL_57:
    swift_bridgeObjectRetain();
    v32 = sub_23A2333D8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v32 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v33 = MEMORY[0x24BEE4AF8];
  v192 = (char *)v15;
  v190 = v16;
  v176 = v21;
  v169 = v29;
  v177 = v31;
  v168 = v12;
  v174 = v14;
  v170 = v19;
  if (v32)
  {
    v197 = MEMORY[0x24BEE4AF8];
    v191 = v32;
    sub_23A20D488(0, v32 & ~(v32 >> 63), 0);
    v34 = v191;
    if (v191 < 0)
    {
      __break(1u);
      goto LABEL_60;
    }
    v35 = v197;
    if ((v178 & 0xC000000000000001) != 0)
    {
      v36 = 0;
      v21 = (unint64_t)v195;
      v37 = v183;
      do
      {
        v38 = MEMORY[0x23B84508C](v36);
        v39 = *(void (**)(unint64_t, uint64_t, char *))(v190 + 16);
        v40 = v21;
        v41 = v192;
        v39(v40, v38 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_uuid, v192);
        LODWORD(v189) = *(_DWORD *)(v38 + 16);
        v42 = *(_QWORD *)(v38 + 32);
        v193 = *(uint8_t **)(v38 + 24);
        v39((unint64_t)&v195[v37[7]], v38 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_primaryGroupUUID, v41);
        v14 = *(_QWORD *)(v38 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_fullName + 8);
        v188 = *(_QWORD *)(v38 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_fullName);
        v43 = *(void (**)(_QWORD, _QWORD, _QWORD))(v38
                                                            + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_homeDirectory
                                                            + 8);
        v187 = *(uint8_t **)(v38 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_homeDirectory);
        v184 = v43;
        v44 = *(_QWORD *)(v38 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_shell);
        v185 = *(_QWORD *)(v38 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_shell + 8);
        v186 = v44;
        v45 = (uint64_t *)(v38 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_memberships);
        swift_beginAccess();
        v46 = *v45;
        v47 = *(_QWORD *)(v38 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_aliases);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_unknownObjectRelease();
        *(_DWORD *)&v195[v37[5]] = v189;
        v48 = &v195[v37[6]];
        *(_QWORD *)v48 = v193;
        *((_QWORD *)v48 + 1) = v42;
        v49 = &v195[v37[8]];
        *(_QWORD *)v49 = v188;
        *((_QWORD *)v49 + 1) = v14;
        v21 = (unint64_t)v195;
        v50 = &v195[v37[9]];
        v51 = v184;
        *(_QWORD *)v50 = v187;
        *((_QWORD *)v50 + 1) = v51;
        v52 = (unint64_t *)(v21 + v37[10]);
        v53 = v185;
        *v52 = v186;
        v52[1] = v53;
        *(_QWORD *)(v21 + v37[11]) = v46;
        *(_QWORD *)(v21 + v37[12]) = v47;
        v197 = v35;
        v55 = *(_QWORD *)(v35 + 16);
        v54 = *(_QWORD *)(v35 + 24);
        if (v55 >= v54 >> 1)
        {
          sub_23A20D488(v54 > 1, v55 + 1, 1);
          v35 = v197;
        }
        ++v36;
        *(_QWORD *)(v35 + 16) = v55 + 1;
        sub_23A1F8E88(v21, v35+ ((*(unsigned __int8 *)(v182 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v182 + 80))+ *(_QWORD *)(v182 + 72) * v55, type metadata accessor for User);
      }
      while (v191 != v36);
    }
    else
    {
      v57 = (char *)(v178 + 32);
      v184 = *(void (**)(_QWORD, _QWORD, _QWORD))(v190 + 16);
      v58 = (uint64_t)v193;
      do
      {
        v195 = v57;
        v191 = v34;
        v59 = *(_QWORD *)v57;
        v60 = v192;
        v61 = (void (*)(uint8_t *, uint64_t, char *))v184;
        v184(v58, *(_QWORD *)v57 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_uuid, v192);
        LODWORD(v187) = *(_DWORD *)(v59 + 16);
        v62 = *(_QWORD *)(v59 + 24);
        v188 = *(_QWORD *)(v59 + 32);
        v189 = v62;
        v63 = v183;
        v61(&v193[v183[7]], v59 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_primaryGroupUUID, v60);
        v64 = *(_QWORD *)(v59 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_fullName);
        v65 = *(_QWORD *)(v59 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_fullName + 8);
        v21 = *(_QWORD *)(v59 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_homeDirectory + 8);
        v186 = *(_QWORD *)(v59 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_homeDirectory);
        v66 = *(_QWORD *)(v59 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_shell + 8);
        v185 = *(_QWORD *)(v59 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_shell);
        v67 = (uint64_t *)(v59 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_memberships);
        swift_beginAccess();
        v68 = *(_QWORD *)(v59 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_aliases);
        v69 = *v67;
        *(_DWORD *)&v193[v63[5]] = (_DWORD)v187;
        v70 = (char *)&v193[v63[6]];
        v71 = v188;
        *(_QWORD *)v70 = v189;
        *((_QWORD *)v70 + 1) = v71;
        v72 = (char *)&v193[v63[8]];
        *(_QWORD *)v72 = v64;
        *((_QWORD *)v72 + 1) = v65;
        v73 = (char *)&v193[v63[9]];
        *(_QWORD *)v73 = v186;
        *((_QWORD *)v73 + 1) = v21;
        v74 = (char *)&v193[v63[10]];
        *(_QWORD *)v74 = v185;
        *((_QWORD *)v74 + 1) = v66;
        *(_QWORD *)&v193[v63[11]] = v69;
        v75 = v63[12];
        v58 = (uint64_t)v193;
        *(_QWORD *)&v193[v75] = v68;
        v197 = v35;
        v14 = *(_QWORD *)(v35 + 16);
        v76 = *(_QWORD *)(v35 + 24);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (v14 >= v76 >> 1)
        {
          sub_23A20D488(v76 > 1, v14 + 1, 1);
          v35 = v197;
        }
        *(_QWORD *)(v35 + 16) = v14 + 1;
        sub_23A1F8E88(v58, v35+ ((*(unsigned __int8 *)(v182 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v182 + 80))+ *(_QWORD *)(v182 + 72) * v14, type metadata accessor for User);
        v57 = v195 + 8;
        v34 = v191 - 1;
      }
      while (v191 != 1);
    }
    v56 = v179;
    v33 = v35;
  }
  else
  {
    v56 = v179;
  }
  v198 = v33;
  v19 = v183;
  v31 = (char *)v175;
  v29 = v173;
  if (v56 >> 62)
  {
    swift_bridgeObjectRetain();
    v16 = sub_23A2333D8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v16 = *(_QWORD *)((v56 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v12 = v192;
  v77 = MEMORY[0x24BEE4AF8];
  if (!v16)
    goto LABEL_32;
  v196 = (uint8_t *)MEMORY[0x24BEE4AF8];
  sub_23A20D45C(0, v16 & ~(v16 >> 63), 0);
  if (v16 < 0)
  {
LABEL_60:
    __break(1u);
    goto LABEL_61;
  }
  v195 = (char *)v16;
  v78 = v196;
  if ((v56 & 0xC000000000000001) != 0)
  {
    v16 = 0;
    v29 = v194;
    do
    {
      v193 = v78;
      v79 = MEMORY[0x23B84508C](v16, v56);
      (*(void (**)(char *, uint64_t, char *))(v190 + 16))(v29, v79 + OBJC_IVAR____TtC23DarwinDirectoryInternal11GroupRecord_uuid, v12);
      v80 = *(_DWORD *)(v79 + 32);
      v82 = *(_QWORD *)(v79 + 40);
      v81 = *(_QWORD *)(v79 + 48);
      v84 = *(_QWORD *)(v79 + 16);
      v83 = *(_QWORD *)(v79 + 24);
      v85 = *(_QWORD *)(v79 + OBJC_IVAR____TtC23DarwinDirectoryInternal11GroupRecord_nestedGroups);
      v86 = *(_QWORD *)(v79 + OBJC_IVAR____TtC23DarwinDirectoryInternal11GroupRecord_aliases);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_unknownObjectRelease();
      v87 = v181;
      *(_DWORD *)&v194[v181[5]] = v80;
      v88 = &v194[v87[6]];
      *(_QWORD *)v88 = v82;
      *((_QWORD *)v88 + 1) = v81;
      v89 = &v194[v87[7]];
      *(_QWORD *)v89 = v84;
      *((_QWORD *)v89 + 1) = v83;
      *(_QWORD *)&v194[v87[8]] = v85;
      v78 = v193;
      v29 = v194;
      *(_QWORD *)&v194[v87[9]] = v86;
      v196 = v78;
      v21 = *((_QWORD *)v78 + 2);
      v90 = *((_QWORD *)v78 + 3);
      if (v21 >= v90 >> 1)
      {
        sub_23A20D45C(v90 > 1, v21 + 1, 1);
        v78 = v196;
      }
      ++v16;
      *((_QWORD *)v78 + 2) = v21 + 1;
      sub_23A1F8E88((uint64_t)v29, (uint64_t)&v78[((*(unsigned __int8 *)(v180 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v180 + 80))+ *(_QWORD *)(v180 + 72) * v21], type metadata accessor for Group);
      v12 = v192;
      v56 = v179;
    }
    while (v195 != (char *)v16);
  }
  else
  {
    v21 = v56 + 32;
    v194 = *(char **)(v190 + 16);
    do
    {
      v91 = *(_QWORD *)v21;
      ((void (*)(char *, uint64_t, char *))v194)(v29, *(_QWORD *)v21 + OBJC_IVAR____TtC23DarwinDirectoryInternal11GroupRecord_uuid, v12);
      v93 = *(_QWORD *)(v91 + 40);
      v92 = *(_QWORD *)(v91 + 48);
      v94 = *(_QWORD *)(v91 + 16);
      v95 = *(_QWORD *)(v91 + 24);
      v96 = *(_QWORD *)(v91 + OBJC_IVAR____TtC23DarwinDirectoryInternal11GroupRecord_nestedGroups);
      v16 = *(_QWORD *)(v91 + OBJC_IVAR____TtC23DarwinDirectoryInternal11GroupRecord_aliases);
      v97 = v181;
      *(_DWORD *)&v29[v181[5]] = *(_DWORD *)(v91 + 32);
      v98 = &v29[v97[6]];
      *(_QWORD *)v98 = v93;
      *((_QWORD *)v98 + 1) = v92;
      v99 = &v29[v97[7]];
      *(_QWORD *)v99 = v94;
      *((_QWORD *)v99 + 1) = v95;
      *(_QWORD *)&v29[v97[8]] = v96;
      *(_QWORD *)&v29[v97[9]] = v16;
      v196 = v78;
      v101 = *((_QWORD *)v78 + 2);
      v100 = *((_QWORD *)v78 + 3);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (v101 >= v100 >> 1)
      {
        sub_23A20D45C(v100 > 1, v101 + 1, 1);
        v78 = v196;
      }
      *((_QWORD *)v78 + 2) = v101 + 1;
      sub_23A1F8E88((uint64_t)v29, (uint64_t)&v78[((*(unsigned __int8 *)(v180 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v180 + 80))+ *(_QWORD *)(v180 + 72) * v101], type metadata accessor for Group);
      v21 += 8;
      --v195;
    }
    while (v195);
  }
  v77 = (unint64_t)v78;
  v19 = v183;
  v31 = (char *)v175;
LABEL_32:
  v197 = v77;
  v102 = v172;
  sub_23A1F7B7C(&v198, &v197, v171);
  v14 = v102;
  if (v102)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_256951AC8 == -1)
    {
LABEL_34:
      v103 = sub_23A23300C();
      v104 = (uint8_t *)__swift_project_value_buffer(v103, (uint64_t)qword_256952570);
      v105 = (id)v14;
      v106 = (id)v14;
      v107 = sub_23A232FF4();
      v108 = sub_23A233264();
      if (os_log_type_enabled(v107, v108))
      {
        v104 = (uint8_t *)swift_slowAlloc();
        v109 = (_QWORD *)swift_slowAlloc();
        *(_DWORD *)v104 = 138543362;
        v110 = (id)v14;
        v111 = _swift_stdlib_bridgeErrorToNSError();
        v196 = (uint8_t *)v111;
        sub_23A233288();
        *v109 = v111;
        MEMORY[0x23B845920](v14);
        MEMORY[0x23B845920](v14);
        _os_log_impl(&dword_23A1F0000, v107, v108, "Failed to update local users and groups: Performer failed: %{public}@", v104, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_2569526E8);
        swift_arrayDestroy();
        MEMORY[0x23B845A58](v109, -1, -1);
        MEMORY[0x23B845A58](v104, -1, -1);
      }
      else
      {
        MEMORY[0x23B845920](v14);
        MEMORY[0x23B845920](v14);
      }

      swift_willThrow();
      return v104;
    }
LABEL_61:
    swift_once();
    goto LABEL_34;
  }
  v112 = v198;
  v113 = swift_bridgeObjectRetain();
  sub_23A214A34(v113);
  swift_bridgeObjectRelease();
  v114 = swift_bridgeObjectRetain();
  sub_23A214DD0(v114);
  swift_bridgeObjectRelease();
  v195 = *(char **)(v112 + 16);
  v178 = 0;
  if (v195)
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0)
      v175 = v112;
    else
      v175 = sub_23A205130(v112);
    v116 = 0;
    v15 = v175;
    do
    {
      v117 = *(_QWORD *)(v15 + 16);
      swift_bridgeObjectRetain();
      if ((unint64_t)v116 >= v117)
      {
        __break(1u);
        goto LABEL_57;
      }
      v16 = (*(unsigned __int8 *)(v182 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v182 + 80);
      v21 = *(_QWORD *)(v182 + 72);
      sub_23A209DC0((uint64_t)v31);
      v29 = ++v116;
    }
    while (v195 != v116);
    v198 = v15;
    v118 = *(char **)(v15 + 16);
    v104 = (uint8_t *)MEMORY[0x24BEE4AF8];
    if (v118)
    {
      v196 = (uint8_t *)MEMORY[0x24BEE4AF8];
      swift_bridgeObjectRetain();
      sub_23A233384();
      v119 = v15 + v16;
      v120 = (uint64_t)v168;
      do
      {
        v194 = v118;
        v195 = (char *)v119;
        v193 = (uint8_t *)v21;
        v121 = v174;
        sub_23A1F8E44(v119, v174, type metadata accessor for User);
        sub_23A1F8E44(v121, v120, type metadata accessor for User);
        v122 = v19[6];
        LODWORD(v189) = *(_DWORD *)(v120 + v19[5]);
        v123 = v120 + v122;
        v124 = *(_QWORD *)(v120 + v122);
        v187 = *(uint8_t **)(v123 + 8);
        v188 = v124;
        v125 = v190;
        v126 = *(void (**)(unint64_t, uint64_t, char *))(v190 + 16);
        v127 = v176;
        v126(v176, v120, v12);
        v128 = v19[7];
        v129 = (uint64_t *)(v120 + v19[8]);
        v131 = *v129;
        v130 = v129[1];
        v182 = v131;
        v179 = v130;
        v132 = (uint64_t *)(v120 + v19[9]);
        v133 = *v132;
        v184 = (void (*)(_QWORD, _QWORD, _QWORD))v132[1];
        v185 = v133;
        v134 = v170;
        v126((unint64_t)v170, v120 + v128, v12);
        v135 = v19[11];
        v136 = (unint64_t *)(v120 + v19[10]);
        v137 = v136[1];
        v186 = *v136;
        v138 = *(_QWORD *)(v120 + v135);
        v191 = *(_QWORD *)(v120 + v19[12]);
        type metadata accessor for UserRecord(0);
        v139 = swift_allocObject();
        *(_DWORD *)(v139 + 16) = v189;
        v140 = v187;
        *(_QWORD *)(v139 + 24) = v188;
        *(_QWORD *)(v139 + 32) = v140;
        v141 = *(void (**)(uint64_t, unint64_t, char *))(v125 + 32);
        v141(v139 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_uuid, v127, v192);
        v142 = (_QWORD *)(v139 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_fullName);
        v143 = v179;
        *v142 = v182;
        v142[1] = v143;
        v144 = (unint64_t *)(v139 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_homeDirectory);
        v145 = v184;
        *v144 = v185;
        v144[1] = (unint64_t)v145;
        v146 = v134;
        v21 = (unint64_t)v193;
        v141(v139 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_primaryGroupUUID, (unint64_t)v146, v192);
        v147 = v191;
        v12 = v192;
        v148 = (unint64_t *)(v139 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_shell);
        *v148 = v186;
        v148[1] = v137;
        *(_QWORD *)(v139 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_memberships) = v138;
        *(_QWORD *)(v139 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_aliases) = v147;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v149 = v194;
        swift_bridgeObjectRetain();
        v19 = v183;
        swift_bridgeObjectRetain();
        sub_23A1F8F44(v120, type metadata accessor for User);
        sub_23A1F8F44(v174, type metadata accessor for User);
        sub_23A23336C();
        sub_23A233390();
        sub_23A23339C();
        sub_23A233378();
        v119 = (uint64_t)&v195[v21];
        v118 = v149 - 1;
      }
      while (v118);
      v104 = v196;
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    v104 = (uint8_t *)MEMORY[0x24BEE4AF8];
  }
  v150 = v197;
  v151 = *(char **)(v197 + 16);
  if (v151)
  {
    v187 = v104;
    v196 = (uint8_t *)MEMORY[0x24BEE4AF8];
    swift_bridgeObjectRetain();
    sub_23A233384();
    v152 = *(unsigned __int8 *)(v180 + 80);
    v186 = v150;
    v153 = v150 + ((v152 + 32) & ~v152);
    v188 = *(_QWORD *)(v180 + 72);
    v154 = (uint64_t)v169;
    v155 = v190;
    v156 = v192;
    do
    {
      v195 = v151;
      v157 = (uint64_t)v177;
      sub_23A1F8E44(v153, (uint64_t)v177, type metadata accessor for Group);
      sub_23A1F8E44(v157, v154, type metadata accessor for Group);
      v158 = v181;
      v159 = v181[6];
      LODWORD(v194) = *(_DWORD *)(v154 + v181[5]);
      v160 = *(_QWORD *)(v154 + v159 + 8);
      v193 = *(uint8_t **)(v154 + v159);
      v161 = v176;
      (*(void (**)(unint64_t, uint64_t, char *))(v155 + 16))(v176, v154, v156);
      v162 = v158[8];
      v163 = (uint64_t *)(v154 + v158[7]);
      v164 = v163[1];
      v189 = *v163;
      v165 = *(_QWORD *)(v154 + v162);
      v191 = *(_QWORD *)(v154 + v158[9]);
      type metadata accessor for GroupRecord(0);
      v166 = swift_allocObject();
      *(_DWORD *)(v166 + 32) = (_DWORD)v194;
      *(_QWORD *)(v166 + 40) = v193;
      *(_QWORD *)(v166 + 48) = v160;
      (*(void (**)(uint64_t, unint64_t, char *))(v155 + 32))(v166 + OBJC_IVAR____TtC23DarwinDirectoryInternal11GroupRecord_uuid, v161, v156);
      *(_QWORD *)(v166 + 16) = v189;
      *(_QWORD *)(v166 + 24) = v164;
      *(_QWORD *)(v166 + OBJC_IVAR____TtC23DarwinDirectoryInternal11GroupRecord_nestedGroups) = v165;
      *(_QWORD *)(v166 + OBJC_IVAR____TtC23DarwinDirectoryInternal11GroupRecord_aliases) = v191;
      swift_bridgeObjectRetain();
      v167 = v195;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_23A1F8F44(v154, type metadata accessor for Group);
      sub_23A1F8F44((uint64_t)v177, type metadata accessor for Group);
      sub_23A23336C();
      sub_23A233390();
      sub_23A23339C();
      sub_23A233378();
      v153 += v188;
      v151 = v167 - 1;
    }
    while (v151);
    swift_bridgeObjectRelease();
    v104 = v187;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v104;
}

void sub_23A219558(_QWORD *a1, void *a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t *v11;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint8_t *v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  char v30;
  NSObject *v31;
  os_log_type_t v32;
  uint8_t *v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;

  v5 = type metadata accessor for RecordManager();
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = a1[3];
  v9 = a1[4];
  v10 = __swift_project_boxed_opaque_existential_1(a1, v8);
  v11 = (uint64_t *)&v7[*(int *)(v5 + 20)];
  v11[3] = v8;
  v11[4] = *(_QWORD *)(v9 + 8);
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v11);
  (*(void (**)(uint64_t *, _QWORD *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(boxed_opaque_existential_1, v10, v8);
  _Block_copy(a2);
  sub_23A233000();
  if (qword_256951AC8 != -1)
    swift_once();
  v13 = sub_23A23300C();
  v36 = __swift_project_value_buffer(v13, (uint64_t)qword_256952570);
  v14 = sub_23A232FF4();
  v15 = sub_23A233270();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v16 = 0;
    _os_log_impl(&dword_23A1F0000, v14, v15, "Updating local domain...", v16, 2u);
    MEMORY[0x23B845A58](v16, -1, -1);
  }

  LODWORD(v35) = sub_23A2060EC();
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v23 = sub_23A1F2154(1);
  v25 = v24;
  _Block_copy(a2);
  v26 = sub_23A2182C0(v23, v25, v20, (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))a2);
  if (v2)
  {
    _Block_release(a2);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v31 = sub_23A232FF4();
    v32 = sub_23A233264();
    if (os_log_type_enabled(v31, v32))
    {
      v33 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v33 = 0;
      _os_log_impl(&dword_23A1F0000, v31, v32, "Failed to update local domain.", v33, 2u);
      MEMORY[0x23B845A58](v33, -1, -1);
    }

    swift_willThrow();
    sub_23A1F8F44((uint64_t)v7, (uint64_t (*)(_QWORD))type metadata accessor for RecordManager);
  }
  else
  {
    v28 = (unint64_t)v26;
    v34 = v18;
    v29 = v27;
    _Block_release(a2);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v30 = v35 & 1;
    v35 = v29;
    sub_23A1FE3CC(v28, v29, v30, v34, v20, v22);
    sub_23A1F8F44((uint64_t)v7, (uint64_t (*)(_QWORD))type metadata accessor for RecordManager);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  _Block_release(a2);
}

uint64_t sub_23A2198D0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) == 0)
  {
    v5 = (char *)&loc_23A219928 + 4 * word_23A234B2A[swift_getEnumCaseMultiPayload()];
    __asm { BR              X10 }
  }
  v6 = *a2;
  *a1 = *a2;
  v7 = v6 + ((v4 + 16) & ~(unint64_t)v4);
  swift_retain();
  return v7;
}

uint64_t sub_23A219E3C(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  void (*v4)(uint64_t, uint64_t);
  uint64_t v5;

  result = swift_getEnumCaseMultiPayload();
  switch((int)result)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
      v3 = sub_23A232FE8();
      v4 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8);
      v4(a1, v3);
      v5 = type metadata accessor for User(0);
      swift_bridgeObjectRelease();
      v4(a1 + *(int *)(v5 + 28), v3);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      result = swift_bridgeObjectRelease();
      break;
    default:
      return result;
  }
  return result;
}

void sub_23A219F28()
{
  char *v0;

  v0 = (char *)sub_23A219F7C + 4 * byte_23A234B39[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_23A219F7C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void (*v3)(uint64_t, uint64_t, uint64_t);
  int *v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;

  v2 = sub_23A232FE8();
  v3 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16);
  v3(v0, v1, v2);
  v4 = (int *)type metadata accessor for User(0);
  *(_DWORD *)(v0 + v4[5]) = *(_DWORD *)(v1 + v4[5]);
  v5 = v4[6];
  v6 = (_QWORD *)(v0 + v5);
  v7 = (_QWORD *)(v1 + v5);
  v8 = v7[1];
  *v6 = *v7;
  v6[1] = v8;
  v9 = v4[7];
  v10 = v0 + v9;
  v11 = v1 + v9;
  swift_bridgeObjectRetain();
  v3(v10, v11, v2);
  v12 = v4[8];
  v13 = (_QWORD *)(v0 + v12);
  v14 = (_QWORD *)(v1 + v12);
  v15 = v14[1];
  *v13 = *v14;
  v13[1] = v15;
  v16 = v4[9];
  v17 = (_QWORD *)(v0 + v16);
  v18 = (_QWORD *)(v1 + v16);
  v19 = v18[1];
  *v17 = *v18;
  v17[1] = v19;
  v20 = v4[10];
  v21 = (_QWORD *)(v0 + v20);
  v22 = (_QWORD *)(v1 + v20);
  v23 = v22[1];
  *v21 = *v22;
  v21[1] = v23;
  *(_QWORD *)(v0 + v4[11]) = *(_QWORD *)(v1 + v4[11]);
  *(_QWORD *)(v0 + v4[12]) = *(_QWORD *)(v1 + v4[12]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_storeEnumTagMultiPayload();
  return v0;
}

uint64_t sub_23A21A094(uint64_t result, uint64_t a2)
{
  char *v2;

  if (result != a2)
  {
    sub_23A1F8F44(result, type metadata accessor for UserValidationError);
    v2 = (char *)&loc_23A21A100 + 4 * byte_23A234B3E[swift_getEnumCaseMultiPayload()];
    __asm { BR              X10 }
  }
  return result;
}

void sub_23A21A238()
{
  char *v0;

  v0 = (char *)sub_23A21A288 + 4 * byte_23A234B43[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_23A21A288()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void (*v3)(uint64_t, uint64_t, uint64_t);
  int *v4;

  v2 = sub_23A232FE8();
  v3 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 32);
  v3(v0, v1, v2);
  v4 = (int *)type metadata accessor for User(0);
  *(_DWORD *)(v0 + v4[5]) = *(_DWORD *)(v1 + v4[5]);
  *(_OWORD *)(v0 + v4[6]) = *(_OWORD *)(v1 + v4[6]);
  v3(v0 + v4[7], v1 + v4[7], v2);
  *(_OWORD *)(v0 + v4[8]) = *(_OWORD *)(v1 + v4[8]);
  *(_OWORD *)(v0 + v4[9]) = *(_OWORD *)(v1 + v4[9]);
  *(_OWORD *)(v0 + v4[10]) = *(_OWORD *)(v1 + v4[10]);
  *(_QWORD *)(v0 + v4[11]) = *(_QWORD *)(v1 + v4[11]);
  *(_QWORD *)(v0 + v4[12]) = *(_QWORD *)(v1 + v4[12]);
  swift_storeEnumTagMultiPayload();
  return v0;
}

uint64_t sub_23A21A34C(uint64_t result, uint64_t a2)
{
  char *v2;

  if (result != a2)
  {
    sub_23A1F8F44(result, type metadata accessor for UserValidationError);
    v2 = (char *)&loc_23A21A3B4 + 4 * byte_23A234B48[swift_getEnumCaseMultiPayload()];
    __asm { BR              X10 }
  }
  return result;
}

uint64_t sub_23A21A478()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for User(319);
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t *sub_23A21A4E4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v6;
  int *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v17 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v17 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    swift_getEnumCaseMultiPayload();
    v6 = sub_23A232FE8();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
    v7 = (int *)type metadata accessor for Group(0);
    *(_DWORD *)((char *)a1 + v7[5]) = *(_DWORD *)((char *)a2 + v7[5]);
    v8 = v7[6];
    v9 = (uint64_t *)((char *)a1 + v8);
    v10 = (uint64_t *)((char *)a2 + v8);
    v12 = *v10;
    v11 = v10[1];
    *v9 = v12;
    v9[1] = v11;
    v13 = v7[7];
    v14 = (uint64_t *)((char *)a1 + v13);
    v15 = (uint64_t *)((char *)a2 + v13);
    v16 = v15[1];
    *v14 = *v15;
    v14[1] = v16;
    *(uint64_t *)((char *)a1 + v7[8]) = *(uint64_t *)((char *)a2 + v7[8]);
    *(uint64_t *)((char *)a1 + v7[9]) = *(uint64_t *)((char *)a2 + v7[9]);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_23A21A750(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = swift_getEnumCaseMultiPayload();
  if (result <= 2)
  {
    v3 = sub_23A232FE8();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
    type metadata accessor for Group(0);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_23A21A7E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  int *v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;

  swift_getEnumCaseMultiPayload();
  v4 = sub_23A232FE8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  v5 = (int *)type metadata accessor for Group(0);
  *(_DWORD *)(a1 + v5[5]) = *(_DWORD *)(a2 + v5[5]);
  v6 = v5[6];
  v7 = (_QWORD *)(a1 + v6);
  v8 = (_QWORD *)(a2 + v6);
  v9 = v8[1];
  *v7 = *v8;
  v7[1] = v9;
  v10 = v5[7];
  v11 = (_QWORD *)(a1 + v10);
  v12 = (_QWORD *)(a2 + v10);
  v13 = v12[1];
  *v11 = *v12;
  v11[1] = v13;
  *(_QWORD *)(a1 + v5[8]) = *(_QWORD *)(a2 + v5[8]);
  *(_QWORD *)(a1 + v5[9]) = *(_QWORD *)(a2 + v5[9]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t sub_23A21A8D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  int *v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;

  if (a1 != a2)
  {
    sub_23A1F8F44(a1, type metadata accessor for GroupValidationError);
    swift_getEnumCaseMultiPayload();
    v4 = sub_23A232FE8();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
    v5 = (int *)type metadata accessor for Group(0);
    *(_DWORD *)(a1 + v5[5]) = *(_DWORD *)(a2 + v5[5]);
    v6 = v5[6];
    v7 = (_QWORD *)(a1 + v6);
    v8 = (_QWORD *)(a2 + v6);
    *v7 = *v8;
    v7[1] = v8[1];
    v9 = v5[7];
    v10 = (_QWORD *)(a1 + v9);
    v11 = (_QWORD *)(a2 + v9);
    *v10 = *v11;
    v10[1] = v11[1];
    *(_QWORD *)(a1 + v5[8]) = *(_QWORD *)(a2 + v5[8]);
    *(_QWORD *)(a1 + v5[9]) = *(_QWORD *)(a2 + v5[9]);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_23A21A9F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  int *v5;

  swift_getEnumCaseMultiPayload();
  v4 = sub_23A232FE8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
  v5 = (int *)type metadata accessor for Group(0);
  *(_DWORD *)(a1 + v5[5]) = *(_DWORD *)(a2 + v5[5]);
  *(_OWORD *)(a1 + v5[6]) = *(_OWORD *)(a2 + v5[6]);
  *(_OWORD *)(a1 + v5[7]) = *(_OWORD *)(a2 + v5[7]);
  *(_QWORD *)(a1 + v5[8]) = *(_QWORD *)(a2 + v5[8]);
  *(_QWORD *)(a1 + v5[9]) = *(_QWORD *)(a2 + v5[9]);
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t sub_23A21AAAC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  int *v5;

  if (a1 != a2)
  {
    sub_23A1F8F44(a1, type metadata accessor for GroupValidationError);
    swift_getEnumCaseMultiPayload();
    v4 = sub_23A232FE8();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
    v5 = (int *)type metadata accessor for Group(0);
    *(_DWORD *)(a1 + v5[5]) = *(_DWORD *)(a2 + v5[5]);
    *(_OWORD *)(a1 + v5[6]) = *(_OWORD *)(a2 + v5[6]);
    *(_OWORD *)(a1 + v5[7]) = *(_OWORD *)(a2 + v5[7]);
    *(_QWORD *)(a1 + v5[8]) = *(_QWORD *)(a2 + v5[8]);
    *(_QWORD *)(a1 + v5[9]) = *(_QWORD *)(a2 + v5[9]);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_23A21AB78()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for Group(319);
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t sub_23A21ABE0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_23A21AC24()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  void (*v8)(char *, uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, char *, uint64_t);
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int v29;

  v1 = sub_23A232FE8();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = MEMORY[0x24BDAC7A8](v1);
  v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v22 - v6;
  v29 = *(_DWORD *)(v0 + 24);
  v28 = *(_QWORD *)(v0 + 32);
  v24 = *(_QWORD *)(v0 + 40);
  v8 = *(void (**)(char *, uint64_t, uint64_t))(v2 + 16);
  v8((char *)&v22 - v6, v0 + OBJC_IVAR____TtC23DarwinDirectoryInternal14UserRecordFile_uuid, v1);
  v9 = *(_QWORD *)(v0 + OBJC_IVAR____TtC23DarwinDirectoryInternal14UserRecordFile_fullName);
  v23 = *(_QWORD *)(v0 + OBJC_IVAR____TtC23DarwinDirectoryInternal14UserRecordFile_fullName + 8);
  v10 = *(_QWORD *)(v0 + OBJC_IVAR____TtC23DarwinDirectoryInternal14UserRecordFile_homeDirectory + 8);
  v26 = *(_QWORD *)(v0 + OBJC_IVAR____TtC23DarwinDirectoryInternal14UserRecordFile_homeDirectory);
  v27 = v9;
  v8(v5, v0 + OBJC_IVAR____TtC23DarwinDirectoryInternal14UserRecordFile_primaryGroupUUID, v1);
  v11 = *(_QWORD *)(v0 + OBJC_IVAR____TtC23DarwinDirectoryInternal14UserRecordFile_shell + 8);
  v25 = *(_QWORD *)(v0 + OBJC_IVAR____TtC23DarwinDirectoryInternal14UserRecordFile_shell);
  v12 = *(_QWORD *)(v0 + OBJC_IVAR____TtC23DarwinDirectoryInternal14UserRecordFile_memberships);
  v13 = MEMORY[0x24BEE4B08];
  if (*(_QWORD *)(v0 + OBJC_IVAR____TtC23DarwinDirectoryInternal14UserRecordFile_aliases))
    v13 = *(_QWORD *)(v0 + OBJC_IVAR____TtC23DarwinDirectoryInternal14UserRecordFile_aliases);
  v22 = v13;
  type metadata accessor for UserRecord(0);
  v14 = swift_allocObject();
  *(_DWORD *)(v14 + 16) = v29;
  v15 = v24;
  *(_QWORD *)(v14 + 24) = v28;
  *(_QWORD *)(v14 + 32) = v15;
  v16 = *(void (**)(uint64_t, char *, uint64_t))(v2 + 32);
  v16(v14 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_uuid, v7, v1);
  v17 = (_QWORD *)(v14 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_fullName);
  v18 = v23;
  *v17 = v27;
  v17[1] = v18;
  v19 = (_QWORD *)(v14 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_homeDirectory);
  *v19 = v26;
  v19[1] = v10;
  v16(v14 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_primaryGroupUUID, v5, v1);
  v20 = (_QWORD *)(v14 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_shell);
  *v20 = v25;
  v20[1] = v11;
  *(_QWORD *)(v14 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_memberships) = v12;
  *(_QWORD *)(v14 + OBJC_IVAR____TtC23DarwinDirectoryInternal10UserRecord_aliases) = v22;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return v14;
}

uint64_t sub_23A21AE78(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_23A21AEAC + 4 * byte_23A234E40[a1]))(0x6E6F6973726576, 0xE700000000000000);
}

uint64_t sub_23A21AEAC()
{
  return 17481;
}

uint64_t sub_23A21AEB8()
{
  return 1701667182;
}

uint64_t sub_23A21AEC8()
{
  return 1145656661;
}

uint64_t sub_23A21AED8()
{
  return 0x656D614E6C6C7566;
}

uint64_t sub_23A21AEF0()
{
  return 0x65726944656D6F68;
}

unint64_t sub_23A21AF14()
{
  return 0xD000000000000010;
}

uint64_t sub_23A21AF30()
{
  return 0x6C6C656873;
}

uint64_t sub_23A21AF44()
{
  return 0x68737265626D656DLL;
}

uint64_t sub_23A21AF64()
{
  return 0x73657361696C61;
}

uint64_t sub_23A21AF78(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_23A21AFAC + 4 * byte_23A234E4A[a1]))(0x6E6F6973726576, 0xE700000000000000);
}

uint64_t sub_23A21AFAC()
{
  return 17481;
}

uint64_t sub_23A21AFB8()
{
  return 1701667182;
}

uint64_t sub_23A21AFC8()
{
  return 1145656661;
}

uint64_t sub_23A21AFD8()
{
  return 0x656D614E6C6C7566;
}

uint64_t sub_23A21AFF0()
{
  return 0x65726944656D6F68;
}

unint64_t sub_23A21B014()
{
  return 0xD000000000000010;
}

uint64_t sub_23A21B030()
{
  return 0x6C6C656873;
}

uint64_t sub_23A21B044()
{
  return 0x68737265626D656DLL;
}

uint64_t sub_23A21B064()
{
  return 0x73657361696C61;
}

uint64_t sub_23A21B078(unsigned __int8 *a1, unsigned __int8 *a2)
{
  unsigned __int8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;

  v2 = *a2;
  v3 = sub_23A21AE78(*a1);
  v5 = v4;
  if (v3 == sub_23A21AE78(v2) && v5 == v6)
    v8 = 1;
  else
    v8 = sub_23A233660();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_23A21B100()
{
  unsigned __int8 *v0;
  unsigned __int8 v1;

  v1 = *v0;
  sub_23A2337F8();
  sub_23A21AE78(v1);
  sub_23A233168();
  swift_bridgeObjectRelease();
  return sub_23A23381C();
}

uint64_t sub_23A21B160()
{
  unsigned __int8 *v0;

  sub_23A21AE78(*v0);
  sub_23A233168();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23A21B1A0()
{
  unsigned __int8 *v0;
  unsigned __int8 v1;

  v1 = *v0;
  sub_23A2337F8();
  sub_23A21AE78(v1);
  sub_23A233168();
  swift_bridgeObjectRelease();
  return sub_23A23381C();
}

uint64_t sub_23A21B1FC@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23A21D5FC();
  *a1 = result;
  return result;
}

uint64_t sub_23A21B228@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_23A21AE78(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_23A21B250()
{
  unsigned __int8 *v0;

  return sub_23A21AF78(*v0);
}

uint64_t sub_23A21B258@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23A21D5FC();
  *a1 = result;
  return result;
}

void sub_23A21B27C(_BYTE *a1@<X8>)
{
  *a1 = 10;
}

uint64_t sub_23A21B288()
{
  sub_23A21CCB8();
  return sub_23A233858();
}

uint64_t sub_23A21B2B0()
{
  sub_23A21CCB8();
  return sub_23A233864();
}

uint64_t sub_23A21B2D8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void (*v3)(uint64_t, uint64_t);

  swift_bridgeObjectRelease();
  v1 = v0 + OBJC_IVAR____TtC23DarwinDirectoryInternal14UserRecordFile_uuid;
  v2 = sub_23A232FE8();
  v3 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8);
  v3(v1, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3(v0 + OBJC_IVAR____TtC23DarwinDirectoryInternal14UserRecordFile_primaryGroupUUID, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_23A21B3A0()
{
  sub_23A21B2D8();
  return swift_deallocClassInstance();
}

uint64_t sub_23A21B3C4()
{
  return type metadata accessor for UserRecordFile(0);
}

uint64_t type metadata accessor for UserRecordFile(uint64_t a1)
{
  return sub_23A1FC53C(a1, qword_256952888);
}

uint64_t sub_23A21B3E0()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23A232FE8();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_23A21B494(_QWORD *a1)
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
  char *v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  _QWORD v19[2];
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char v23;
  uint64_t v24;

  v2 = sub_23A232FE8();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256952A98);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A21CCB8();
  v10 = v21;
  sub_23A233834();
  LOBYTE(v24) = 0;
  v11 = v22;
  sub_23A2334A4();
  if (v11)
    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  v22 = v5;
  v13 = v7;
  LOBYTE(v24) = 1;
  sub_23A2334BC();
  v14 = v6;
  v15 = v10;
  LOBYTE(v24) = 2;
  swift_bridgeObjectRetain();
  v20 = v14;
  sub_23A23348C();
  swift_bridgeObjectRelease();
  LOBYTE(v24) = 3;
  v16 = sub_23A1F58C8(&qword_256951DF0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA70]);
  sub_23A2334B0();
  v19[1] = v16;
  LOBYTE(v24) = 4;
  swift_bridgeObjectRetain();
  sub_23A23348C();
  swift_bridgeObjectRelease();
  LOBYTE(v24) = 5;
  swift_bridgeObjectRetain();
  sub_23A23348C();
  swift_bridgeObjectRelease();
  v17 = v22;
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v22, v15 + OBJC_IVAR____TtC23DarwinDirectoryInternal14UserRecordFile_primaryGroupUUID, v2);
  LOBYTE(v24) = 6;
  sub_23A2334B0();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v17, v2);
  LOBYTE(v24) = 7;
  swift_bridgeObjectRetain();
  sub_23A23348C();
  swift_bridgeObjectRelease();
  v24 = *(_QWORD *)(v15 + OBJC_IVAR____TtC23DarwinDirectoryInternal14UserRecordFile_memberships);
  v23 = 8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256952A78);
  sub_23A21CCFC(&qword_256952AA0, &qword_256951DF0, MEMORY[0x24BDCEA70], MEMORY[0x24BEE1700]);
  sub_23A2334B0();
  v24 = *(_QWORD *)(v15 + OBJC_IVAR____TtC23DarwinDirectoryInternal14UserRecordFile_aliases);
  v23 = 9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256952A88);
  sub_23A21CD80(&qword_256952AA8, MEMORY[0x24BEE0D08], MEMORY[0x24BEE1700]);
  v18 = v20;
  sub_23A233480();
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v9, v18);
}

_QWORD *sub_23A21B94C(_QWORD *a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(char *, char *, uint64_t);
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD *v42;
  uint64_t v43;
  _QWORD *v44;
  char v45;
  uint64_t v46;

  v41 = *v1;
  v3 = sub_23A232FE8();
  v37 = *(_QWORD *)(v3 - 8);
  v38 = v3;
  v4 = MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v36 - v7;
  v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_256952A68);
  v9 = *(_QWORD *)(v40 - 8);
  MEMORY[0x24BDAC7A8](v40);
  v11 = (char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = OBJC_IVAR____TtC23DarwinDirectoryInternal14UserRecordFile_aliases;
  v44 = v1;
  *(_QWORD *)((char *)v1 + OBJC_IVAR____TtC23DarwinDirectoryInternal14UserRecordFile_aliases) = 0;
  v13 = a1[3];
  v42 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v13);
  sub_23A21CCB8();
  v39 = v11;
  v14 = v43;
  sub_23A233828();
  if (v14)
  {
    v17 = (uint64_t)v42;
    v34 = v44;
    swift_bridgeObjectRelease();
    swift_deallocPartialClassInstance();
    v35 = v17;
  }
  else
  {
    v15 = v9;
    LOBYTE(v46) = 0;
    v16 = sub_23A233444();
    v19 = v44;
    v44[2] = v16;
    LOBYTE(v46) = 1;
    *((_DWORD *)v19 + 6) = sub_23A23345C();
    LOBYTE(v46) = 2;
    v19[4] = sub_23A23342C();
    v19[5] = v20;
    LOBYTE(v46) = 3;
    v21 = sub_23A1F58C8(&qword_256951E18, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAA8]);
    v22 = v38;
    v43 = v21;
    sub_23A233450();
    v23 = *(void (**)(char *, char *, uint64_t))(v37 + 32);
    v23((char *)v19 + OBJC_IVAR____TtC23DarwinDirectoryInternal14UserRecordFile_uuid, v8, v22);
    LOBYTE(v46) = 4;
    v24 = sub_23A23342C();
    v25 = (_QWORD *)((char *)v19 + OBJC_IVAR____TtC23DarwinDirectoryInternal14UserRecordFile_fullName);
    *v25 = v24;
    v25[1] = v26;
    LOBYTE(v46) = 5;
    v36 = 0;
    v27 = sub_23A23342C();
    v28 = (_QWORD *)((char *)v19 + OBJC_IVAR____TtC23DarwinDirectoryInternal14UserRecordFile_homeDirectory);
    *v28 = v27;
    v28[1] = v29;
    LOBYTE(v46) = 6;
    v30 = v38;
    sub_23A233450();
    v23((char *)v19 + OBJC_IVAR____TtC23DarwinDirectoryInternal14UserRecordFile_primaryGroupUUID, v6, v30);
    LOBYTE(v46) = 7;
    v31 = sub_23A23342C();
    v32 = (_QWORD *)((char *)v19 + OBJC_IVAR____TtC23DarwinDirectoryInternal14UserRecordFile_shell);
    *v32 = v31;
    v32[1] = v33;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256952A78);
    v45 = 8;
    sub_23A21CCFC(&qword_256952A80, &qword_256951E18, MEMORY[0x24BDCEAA8], MEMORY[0x24BEE1720]);
    sub_23A233450();
    *(_QWORD *)((char *)v44 + OBJC_IVAR____TtC23DarwinDirectoryInternal14UserRecordFile_memberships) = v46;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256952A88);
    v45 = 9;
    sub_23A21CD80(&qword_256952A90, MEMORY[0x24BEE0D38], MEMORY[0x24BEE1720]);
    sub_23A233420();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v39, v40);
    v34 = v44;
    *(_QWORD *)((char *)v44 + v12) = v46;
    swift_bridgeObjectRelease();
    v35 = (uint64_t)v42;
  }
  __swift_destroy_boxed_opaque_existential_1(v35);
  return v34;
}

uint64_t sub_23A21BF60@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_23A1FAB98(a1, (uint64_t (*)(uint64_t))sub_23A21B94C, a2);
}

uint64_t sub_23A21BF7C(_QWORD *a1)
{
  return sub_23A21B494(a1);
}

void sub_23A21BF9C(char *a1)
{
  sub_23A1F3714(*a1);
}

void sub_23A21BFA8()
{
  char *v0;

  sub_23A220A0C(0, *v0);
}

void sub_23A21BFB4()
{
  __asm { BR              X10 }
}

uint64_t sub_23A21BFF0()
{
  sub_23A233168();
  return swift_bridgeObjectRelease();
}

void sub_23A21C07C(uint64_t a1)
{
  char *v1;

  sub_23A220A0C(a1, *v1);
}

uint64_t sub_23A21C084@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23A21D644();
  *a1 = result;
  return result;
}

uint64_t sub_23A21C0B0()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(void))((char *)sub_23A21C0E0 + 4 * byte_23A234E5B[*v0]))();
}

void sub_23A21C0E0(_QWORD *a1@<X8>)
{
  *a1 = 17481;
  a1[1] = 0xE200000000000000;
}

void sub_23A21C0F0(_QWORD *a1@<X8>)
{
  *a1 = 1701667182;
  a1[1] = 0xE400000000000000;
}

void sub_23A21C104(_QWORD *a1@<X8>)
{
  *a1 = 1145656661;
  a1[1] = 0xE400000000000000;
}

void sub_23A21C118(_QWORD *a1@<X8>)
{
  *a1 = 0x656D614E6C6C7566;
  a1[1] = 0xE800000000000000;
}

void sub_23A21C134(uint64_t a1@<X8>)
{
  strcpy((char *)a1, "nestedGroups");
  *(_BYTE *)(a1 + 13) = 0;
  *(_WORD *)(a1 + 14) = -5120;
}

void sub_23A21C158(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = 0x73657361696C61;
  a1[1] = v1;
}

uint64_t sub_23A21C170()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_23A21C1A0 + 4 * byte_23A234E62[*v0]))(0x6E6F6973726576, 0xE700000000000000);
}

uint64_t sub_23A21C1A0()
{
  return 17481;
}

uint64_t sub_23A21C1AC()
{
  return 1701667182;
}

uint64_t sub_23A21C1BC()
{
  return 1145656661;
}

uint64_t sub_23A21C1CC()
{
  return 0x656D614E6C6C7566;
}

uint64_t sub_23A21C1E4()
{
  return 0x724764657473656ELL;
}

uint64_t sub_23A21C204()
{
  return 0x73657361696C61;
}

uint64_t sub_23A21C218@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23A21D644();
  *a1 = result;
  return result;
}

void sub_23A21C23C(_BYTE *a1@<X8>)
{
  *a1 = 7;
}

uint64_t sub_23A21C248()
{
  sub_23A21CDE0();
  return sub_23A233858();
}

uint64_t sub_23A21C270()
{
  sub_23A21CDE0();
  return sub_23A233864();
}

uint64_t sub_23A21C298()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_bridgeObjectRelease();
  v1 = v0 + OBJC_IVAR____TtC23DarwinDirectoryInternal15GroupRecordFile_uuid;
  v2 = sub_23A232FE8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_23A21C324()
{
  return type metadata accessor for GroupRecordFile(0);
}

uint64_t type metadata accessor for GroupRecordFile(uint64_t a1)
{
  return sub_23A1FC53C(a1, qword_256952988);
}

uint64_t sub_23A21C340()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23A232FE8();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_23A21C3E0(uint64_t a1)
{
  uint64_t result;

  result = sub_23A1F58C8(&qword_256951AE8, type metadata accessor for GroupRecordFile, (uint64_t)&unk_23A234FE0);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_23A21C41C(uint64_t a1)
{
  uint64_t result;

  result = sub_23A1F58C8(&qword_256951AF0, type metadata accessor for UserRecordFile, (uint64_t)&unk_23A235030);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_23A21C458(uint64_t a1)
{
  uint64_t result;

  result = sub_23A1F58C8(&qword_256952A48, type metadata accessor for GroupRecordFile, (uint64_t)&unk_23A234FB8);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_23A21C494(uint64_t a1)
{
  uint64_t result;

  result = sub_23A1F58C8(&qword_256952A50, type metadata accessor for GroupRecordFile, (uint64_t)&unk_23A234F48);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_23A21C4D0(uint64_t a1)
{
  uint64_t result;

  result = sub_23A1F58C8(&qword_256952A58, type metadata accessor for UserRecordFile, (uint64_t)&unk_23A235008);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_23A21C50C(uint64_t a1)
{
  uint64_t result;

  result = sub_23A1F58C8(&qword_256952A60, type metadata accessor for UserRecordFile, (uint64_t)&unk_23A234F80);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_23A21C548(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v10;
  uint64_t v11;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_256952AC0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A21CDE0();
  sub_23A233834();
  LOBYTE(v11) = 0;
  sub_23A2334A4();
  if (!v2)
  {
    LOBYTE(v11) = 1;
    sub_23A2334BC();
    LOBYTE(v11) = 2;
    swift_bridgeObjectRetain();
    sub_23A23348C();
    swift_bridgeObjectRelease();
    LOBYTE(v11) = 3;
    sub_23A232FE8();
    sub_23A1F58C8(&qword_256951DF0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA70]);
    sub_23A2334B0();
    LOBYTE(v11) = 4;
    swift_bridgeObjectRetain();
    sub_23A23348C();
    swift_bridgeObjectRelease();
    v11 = *(_QWORD *)(v3 + OBJC_IVAR____TtC23DarwinDirectoryInternal15GroupRecordFile_nestedGroups);
    HIBYTE(v10) = 5;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256952A78);
    sub_23A21CCFC(&qword_256952AA0, &qword_256951DF0, MEMORY[0x24BDCEA70], MEMORY[0x24BEE1700]);
    sub_23A233480();
    v11 = *(_QWORD *)(v3 + OBJC_IVAR____TtC23DarwinDirectoryInternal15GroupRecordFile_aliases);
    HIBYTE(v10) = 6;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256952A88);
    sub_23A21CD80(&qword_256952AA8, MEMORY[0x24BEE0D08], MEMORY[0x24BEE1700]);
    sub_23A233480();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

_QWORD *sub_23A21C84C(_QWORD *a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  _QWORD *v31;
  char *v32;
  char v33;
  uint64_t v34;

  v29 = *v1;
  v3 = sub_23A232FE8();
  v26 = *(_QWORD *)(v3 - 8);
  v27 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_256952AB0);
  v6 = *(_QWORD *)(v28 - 8);
  MEMORY[0x24BDAC7A8](v28);
  v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = OBJC_IVAR____TtC23DarwinDirectoryInternal15GroupRecordFile_nestedGroups;
  *(_QWORD *)((char *)v1 + OBJC_IVAR____TtC23DarwinDirectoryInternal15GroupRecordFile_nestedGroups) = 0;
  v10 = OBJC_IVAR____TtC23DarwinDirectoryInternal15GroupRecordFile_aliases;
  v30 = a1;
  v31 = v1;
  *(_QWORD *)((char *)v1 + OBJC_IVAR____TtC23DarwinDirectoryInternal15GroupRecordFile_aliases) = 0;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A21CDE0();
  v11 = v32;
  sub_23A233828();
  if (v11)
  {
    v15 = (uint64_t)v30;
    v17 = v31;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_deallocPartialClassInstance();
    v23 = v15;
  }
  else
  {
    v32 = v5;
    v12 = v27;
    v13 = v28;
    v24 = v10;
    v25 = v9;
    LOBYTE(v34) = 0;
    v14 = sub_23A233444();
    v17 = v31;
    v31[2] = v14;
    LOBYTE(v34) = 1;
    *((_DWORD *)v17 + 6) = sub_23A23345C();
    LOBYTE(v34) = 2;
    v17[4] = sub_23A23342C();
    v17[5] = v18;
    LOBYTE(v34) = 3;
    sub_23A1F58C8(&qword_256951E18, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAA8]);
    v19 = v32;
    sub_23A233450();
    (*(void (**)(uint64_t, char *, uint64_t))(v26 + 32))((uint64_t)v17 + OBJC_IVAR____TtC23DarwinDirectoryInternal15GroupRecordFile_uuid, v19, v12);
    LOBYTE(v34) = 4;
    v20 = sub_23A23342C();
    v21 = (_QWORD *)((char *)v17 + OBJC_IVAR____TtC23DarwinDirectoryInternal15GroupRecordFile_fullName);
    *v21 = v20;
    v21[1] = v22;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256952A78);
    v33 = 5;
    sub_23A21CCFC(&qword_256952A80, &qword_256951E18, MEMORY[0x24BDCEAA8], MEMORY[0x24BEE1720]);
    sub_23A233420();
    *(_QWORD *)((char *)v17 + v25) = v34;
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256952A88);
    v33 = 6;
    sub_23A21CD80(&qword_256952A90, MEMORY[0x24BEE0D38], MEMORY[0x24BEE1720]);
    sub_23A233420();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v13);
    *(_QWORD *)((char *)v17 + v24) = v34;
    swift_bridgeObjectRelease();
    v23 = (uint64_t)v30;
  }
  __swift_destroy_boxed_opaque_existential_1(v23);
  return v17;
}

uint64_t sub_23A21CC7C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_23A1FAB98(a1, (uint64_t (*)(uint64_t))sub_23A21C84C, a2);
}

uint64_t sub_23A21CC98(_QWORD *a1)
{
  return sub_23A21C548(a1);
}

unint64_t sub_23A21CCB8()
{
  unint64_t result;

  result = qword_256952A70;
  if (!qword_256952A70)
  {
    result = MEMORY[0x23B8459BC](&unk_23A235294, &type metadata for UserRecordFile.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256952A70);
  }
  return result;
}

uint64_t sub_23A21CCFC(unint64_t *a1, unint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;

  result = *a1;
  if (!result)
  {
    v9 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256952A78);
    v10 = sub_23A1F58C8(a2, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], a3);
    result = MEMORY[0x23B8459BC](a4, v9, &v10);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23A21CD80(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  result = *a1;
  if (!result)
  {
    v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256952A88);
    v8 = a2;
    result = MEMORY[0x23B8459BC](a3, v7, &v8);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_23A21CDE0()
{
  unint64_t result;

  result = qword_256952AB8;
  if (!qword_256952AB8)
  {
    result = MEMORY[0x23B8459BC](&unk_23A235244, &type metadata for GroupRecordFile.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256952AB8);
  }
  return result;
}

uint64_t sub_23A21CE24()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t result;

  v2 = *(_QWORD *)(v0 + 16);
  if (v2 != 3)
  {
    v5 = sub_23A233354();
    swift_allocError();
    v4 = v6;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256952AC8);
    v4[3] = MEMORY[0x24BEE1E88];
    *v4 = v2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256952AD0);
    v7 = swift_allocObject();
    *(_OWORD *)(v7 + 16) = xmmword_23A2349D0;
    *(_QWORD *)(v7 + 56) = &type metadata for UserRecordFile.CodingKeys;
    *(_QWORD *)(v7 + 64) = sub_23A21CCB8();
    *(_BYTE *)(v7 + 32) = 0;
    sub_23A233330();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v5 - 8) + 104))(v4, *MEMORY[0x24BEE2728], v5);
    swift_willThrow();
    return (uint64_t)v4;
  }
  sub_23A232F04();
  swift_allocObject();
  sub_23A232EF8();
  sub_23A1F58C8(&qword_256952A58, type metadata accessor for UserRecordFile, (uint64_t)&unk_23A235008);
  v3 = sub_23A232EEC();
  if (!v1)
  {
    v4 = (_QWORD *)v3;
    swift_release();
    return (uint64_t)v4;
  }
  result = swift_unexpectedError();
  __break(1u);
  return result;
}

uint64_t sub_23A21CFDC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t result;

  v2 = *(_QWORD *)(v0 + 16);
  if (v2 != 3)
  {
    v5 = sub_23A233354();
    swift_allocError();
    v4 = v6;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256952AC8);
    v4[3] = MEMORY[0x24BEE1E88];
    *v4 = v2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256952AD0);
    v7 = swift_allocObject();
    *(_OWORD *)(v7 + 16) = xmmword_23A2349D0;
    *(_QWORD *)(v7 + 56) = &type metadata for GroupRecordFile.CodingKeys;
    *(_QWORD *)(v7 + 64) = sub_23A21CDE0();
    *(_BYTE *)(v7 + 32) = 0;
    sub_23A233330();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v5 - 8) + 104))(v4, *MEMORY[0x24BEE2728], v5);
    swift_willThrow();
    return (uint64_t)v4;
  }
  sub_23A232F04();
  swift_allocObject();
  sub_23A232EF8();
  sub_23A1F58C8(&qword_256952A48, type metadata accessor for GroupRecordFile, (uint64_t)&unk_23A234FB8);
  v3 = sub_23A232EEC();
  if (!v1)
  {
    v4 = (_QWORD *)v3;
    swift_release();
    return (uint64_t)v4;
  }
  result = swift_unexpectedError();
  __break(1u);
  return result;
}

uint64_t getEnumTagSinglePayload for GroupRecordFile.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFA)
    goto LABEL_17;
  if (a2 + 6 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 6) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 6;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 6;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 6;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 7;
  v8 = v6 - 7;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for GroupRecordFile.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 6 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 6) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFA)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF9)
    return ((uint64_t (*)(void))((char *)&loc_23A21D270 + 4 * byte_23A234E6E[v4]))();
  *a1 = a2 + 6;
  return ((uint64_t (*)(void))((char *)sub_23A21D2A4 + 4 * byte_23A234E69[v4]))();
}

uint64_t sub_23A21D2A4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A21D2AC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23A21D2B4);
  return result;
}

uint64_t sub_23A21D2C0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23A21D2C8);
  *(_BYTE *)result = a2 + 6;
  return result;
}

uint64_t sub_23A21D2CC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A21D2D4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for GroupRecordFile.CodingKeys()
{
  return &type metadata for GroupRecordFile.CodingKeys;
}

uint64_t getEnumTagSinglePayload for UserRecordFile.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF7)
    goto LABEL_17;
  if (a2 + 9 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 9) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 9;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 9;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 9;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0xA;
  v8 = v6 - 10;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for UserRecordFile.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 9 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 9) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF7)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF6)
    return ((uint64_t (*)(void))((char *)&loc_23A21D3CC + 4 * byte_23A234E78[v4]))();
  *a1 = a2 + 9;
  return ((uint64_t (*)(void))((char *)sub_23A21D400 + 4 * byte_23A234E73[v4]))();
}

uint64_t sub_23A21D400(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A21D408(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23A21D410);
  return result;
}

uint64_t sub_23A21D41C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23A21D424);
  *(_BYTE *)result = a2 + 9;
  return result;
}

uint64_t sub_23A21D428(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A21D430(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for UserRecordFile.CodingKeys()
{
  return &type metadata for UserRecordFile.CodingKeys;
}

unint64_t sub_23A21D450()
{
  unint64_t result;

  result = qword_256952AD8;
  if (!qword_256952AD8)
  {
    result = MEMORY[0x23B8459BC](&unk_23A23512C, &type metadata for UserRecordFile.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256952AD8);
  }
  return result;
}

unint64_t sub_23A21D498()
{
  unint64_t result;

  result = qword_256952AE0;
  if (!qword_256952AE0)
  {
    result = MEMORY[0x23B8459BC](&unk_23A23521C, &type metadata for GroupRecordFile.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256952AE0);
  }
  return result;
}

unint64_t sub_23A21D4E0()
{
  unint64_t result;

  result = qword_256952AE8;
  if (!qword_256952AE8)
  {
    result = MEMORY[0x23B8459BC](&unk_23A235154, &type metadata for GroupRecordFile.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256952AE8);
  }
  return result;
}

unint64_t sub_23A21D528()
{
  unint64_t result;

  result = qword_256952AF0;
  if (!qword_256952AF0)
  {
    result = MEMORY[0x23B8459BC](&unk_23A23517C, &type metadata for GroupRecordFile.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256952AF0);
  }
  return result;
}

unint64_t sub_23A21D570()
{
  unint64_t result;

  result = qword_256952AF8;
  if (!qword_256952AF8)
  {
    result = MEMORY[0x23B8459BC](&unk_23A235064, &type metadata for UserRecordFile.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256952AF8);
  }
  return result;
}

unint64_t sub_23A21D5B8()
{
  unint64_t result;

  result = qword_256952B00;
  if (!qword_256952B00)
  {
    result = MEMORY[0x23B8459BC](&unk_23A23508C, &type metadata for UserRecordFile.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256952B00);
  }
  return result;
}

uint64_t sub_23A21D5FC()
{
  unint64_t v0;

  v0 = sub_23A233414();
  swift_bridgeObjectRelease();
  if (v0 >= 0xA)
    return 10;
  else
    return v0;
}

uint64_t sub_23A21D644()
{
  unint64_t v0;

  v0 = sub_23A233414();
  swift_bridgeObjectRelease();
  if (v0 >= 7)
    return 7;
  else
    return v0;
}

void sub_23A21D68C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  id v14;
  void *v15;
  unsigned int v16;
  id v17;
  id v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  void *v22;
  uint64_t v23;
  unint64_t v24;
  id v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  int v36;
  uint64_t v37;
  char *v38;
  char *v39;
  char *v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  id v47[2];

  v47[1] = *(id *)MEMORY[0x24BDAC8D0];
  v2 = sub_23A232E80();
  v43 = *(_QWORD *)(v2 - 8);
  v44 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v39 = (char *)&v39 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256952BF8);
  MEMORY[0x24BDAC7A8](v4);
  v40 = (char *)&v39 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_23A232E68();
  v42 = *(_QWORD *)(v6 - 8);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v41 = (char *)&v39 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v39 - v9;
  v11 = sub_23A2330D8();
  v45 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v39 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  sub_23A2330C0();
  v15 = (void *)sub_23A233120();
  swift_bridgeObjectRelease();
  v47[0] = 0;
  v16 = objc_msgSend(v14, sel_createDirectoryAtPath_withIntermediateDirectories_attributes_error_, v15, 1, 0, v47);

  v17 = v47[0];
  if (!v16)
  {
    v25 = v47[0];
    v26 = (void *)sub_23A232F40();

    swift_willThrow();
    v47[0] = v26;
    v27 = v26;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256951AE0);
    if (swift_dynamicCast())
    {
      v28 = v6;
      v30 = v41;
      v29 = v42;
      (*(void (**)(char *, char *, uint64_t))(v42 + 32))(v41, v10, v6);
      v31 = sub_23A232E5C();
      if (v31)
      {
        v46 = v31;
        v32 = (uint64_t)v40;
        v33 = v44;
        v34 = swift_dynamicCast();
        v35 = v43;
        (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v43 + 56))(v32, v34 ^ 1u, 1, v33);
      }
      else
      {
        v35 = v43;
        v33 = v44;
        v32 = (uint64_t)v40;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v43 + 56))(v40, 1, 1, v44);
      }
      v36 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v35 + 48))(v32, 1, v33);
      sub_23A21F038(v32);
      if (v36)
      {
        (*(void (**)(char *, uint64_t))(v29 + 8))(v30, v28);
      }
      else
      {
        MEMORY[0x23B845920](v26);
        v37 = sub_23A232E5C();
        if (!v37)
        {
          __break(1u);
          return;
        }
        v46 = v37;
        v38 = v39;
        swift_dynamicCast();
        sub_23A232E74();
        swift_willThrow();
        (*(void (**)(char *, uint64_t))(v29 + 8))(v30, v28);
        (*(void (**)(char *, uint64_t))(v35 + 8))(v38, v33);
      }
    }
    MEMORY[0x23B845920](v47[0]);
    return;
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v45 + 16))(v13, a1, v11);
  v18 = v17;
  v19 = sub_23A232FF4();
  v20 = sub_23A233258();
  if (os_log_type_enabled(v19, v20))
  {
    v21 = (uint8_t *)swift_slowAlloc();
    v22 = (void *)swift_slowAlloc();
    v47[0] = v22;
    *(_DWORD *)v21 = 136446210;
    sub_23A1F58C8(&qword_256951AD8, (uint64_t (*)(uint64_t))MEMORY[0x24BEE60D8], MEMORY[0x24BEE60F8]);
    v23 = sub_23A2334E0();
    v46 = sub_23A21FD94(v23, v24, (uint64_t *)v47);
    sub_23A233288();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v45 + 8))(v13, v11);
    _os_log_impl(&dword_23A1F0000, v19, v20, "Created directory %{public}s", v21, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B845A58](v22, -1, -1);
    MEMORY[0x23B845A58](v21, -1, -1);

  }
  else
  {

    (*(void (**)(char *, uint64_t))(v45 + 8))(v13, v11);
  }
}

void sub_23A21DB84(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  void *v14;
  unsigned int v15;
  id v16;
  id v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  void *v21;
  uint64_t v22;
  unint64_t v23;
  id v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  char *v37;
  void (*v38)(char *, uint64_t);
  int v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  char *v43;
  char *v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  id v51[2];

  v51[1] = *(id *)MEMORY[0x24BDAC8D0];
  v48 = sub_23A232E80();
  v45 = *(_QWORD *)(v48 - 8);
  MEMORY[0x24BDAC7A8](v48);
  v43 = (char *)&v42 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256952BF8);
  MEMORY[0x24BDAC7A8](v3);
  v44 = (char *)&v42 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_23A232E68();
  v47 = *(_QWORD *)(v5 - 8);
  v6 = MEMORY[0x24BDAC7A8](v5);
  v46 = (char *)&v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v42 - v8;
  v10 = sub_23A2330D8();
  v49 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v42 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  sub_23A2330C0();
  v14 = (void *)sub_23A233120();
  swift_bridgeObjectRelease();
  v51[0] = 0;
  v15 = objc_msgSend(v13, sel_removeItemAtPath_error_, v14, v51);

  v16 = v51[0];
  if (!v15)
  {
    v24 = v51[0];
    v25 = (void *)sub_23A232F40();

    swift_willThrow();
    v51[0] = v25;
    v26 = v25;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256951AE0);
    if (swift_dynamicCast())
    {
      v27 = v5;
      v29 = v46;
      v28 = v47;
      (*(void (**)(char *, char *, uint64_t))(v47 + 32))(v46, v9, v27);
      v30 = sub_23A232E5C();
      if (v30)
      {
        v50 = v30;
        v31 = (uint64_t)v44;
        v32 = v48;
        v33 = swift_dynamicCast();
        v34 = v45;
        (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v45 + 56))(v31, v33 ^ 1u, 1, v32);
      }
      else
      {
        v31 = (uint64_t)v44;
        v34 = v45;
        v32 = v48;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v45 + 56))(v44, 1, 1, v48);
      }
      v35 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v34 + 48))(v31, 1, v32);
      sub_23A21F038(v31);
      if (!v35)
      {
        MEMORY[0x23B845920](v25);
        v36 = sub_23A232E5C();
        if (v36)
        {
          v50 = v36;
          v37 = v43;
          swift_dynamicCast();
          sub_23A1F58C8((unint64_t *)&qword_256951AD0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCAFE0], MEMORY[0x24BDCAFD8]);
          sub_23A232F10();
          v38 = *(void (**)(char *, uint64_t))(v34 + 8);
          v38(v37, v32);
          v39 = sub_23A233090();
          if (v39 == sub_23A233090())
          {
            (*(void (**)(char *, uint64_t))(v28 + 8))(v29, v27);
            MEMORY[0x23B845920](v51[0]);
            return;
          }
          v40 = sub_23A232E5C();
          if (v40)
          {
            v50 = v40;
            v41 = v43;
            swift_dynamicCast();
            sub_23A232E74();
            swift_willThrow();
            (*(void (**)(char *, uint64_t))(v28 + 8))(v29, v27);
            v38(v41, v32);
            goto LABEL_16;
          }
        }
        else
        {
          __break(1u);
        }
        __break(1u);
        return;
      }
      (*(void (**)(char *, uint64_t))(v28 + 8))(v29, v27);
    }
LABEL_16:
    MEMORY[0x23B845920](v51[0]);
    return;
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v49 + 16))(v12, a1, v10);
  v17 = v16;
  v18 = sub_23A232FF4();
  v19 = sub_23A233258();
  if (os_log_type_enabled(v18, v19))
  {
    v20 = (uint8_t *)swift_slowAlloc();
    v21 = (void *)swift_slowAlloc();
    v51[0] = v21;
    *(_DWORD *)v20 = 136446210;
    sub_23A1F58C8(&qword_256951AD8, (uint64_t (*)(uint64_t))MEMORY[0x24BEE60D8], MEMORY[0x24BEE60F8]);
    v22 = sub_23A2334E0();
    v50 = sub_23A21FD94(v22, v23, (uint64_t *)v51);
    sub_23A233288();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v49 + 8))(v12, v10);
    _os_log_impl(&dword_23A1F0000, v18, v19, "Deleted %{public}s", v20, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B845A58](v21, -1, -1);
    MEMORY[0x23B845A58](v20, -1, -1);

  }
  else
  {

    (*(void (**)(char *, uint64_t))(v49 + 8))(v12, v10);
  }
}

uint64_t sub_23A21E128(uint64_t a1, uint8_t *a2, uint64_t a3)
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
  char *v16;
  void *v17;
  id v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t result;
  int v34;
  char *v35;
  char *v36;
  char *v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint8_t *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;

  v46 = a2;
  v45 = a1;
  v4 = sub_23A232E80();
  v40 = *(_QWORD *)(v4 - 8);
  v41 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v36 = (char *)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_256952BF8);
  MEMORY[0x24BDAC7A8](v6);
  v37 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_23A232E68();
  v39 = *(_QWORD *)(v8 - 8);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v38 = (char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = sub_23A2330D8();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v36 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v44 = sub_23A232F58();
  v42 = *(_QWORD *)(v44 - 8);
  MEMORY[0x24BDAC7A8](v44);
  v16 = (char *)&v36 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23A2330C0();
  sub_23A232F4C();
  swift_bridgeObjectRelease();
  v43 = v16;
  v17 = (void *)v47;
  sub_23A232F94();
  if (v17)
  {
    v49 = (uint64_t)v17;
    v18 = v17;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256951AE0);
    if (swift_dynamicCast())
    {
      v19 = v39;
      v20 = v38;
      (*(void (**)(void))(v39 + 32))();
      v21 = sub_23A232E5C();
      if (v21)
      {
        v48 = v21;
        v22 = (uint64_t)v37;
        v23 = v41;
        v24 = swift_dynamicCast();
        v25 = v40;
        (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v40 + 56))(v22, v24 ^ 1u, 1, v23);
      }
      else
      {
        v25 = v40;
        v23 = v41;
        v22 = (uint64_t)v37;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v40 + 56))(v37, 1, 1, v41);
      }
      v34 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v25 + 48))(v22, 1, v23);
      sub_23A21F038(v22);
      if (!v34)
      {
        MEMORY[0x23B845920](v17);
        result = sub_23A232E5C();
        if (!result)
        {
          __break(1u);
          return result;
        }
        v48 = result;
        v35 = v36;
        swift_dynamicCast();
        sub_23A232E74();
        swift_willThrow();
        (*(void (**)(char *, uint64_t))(v19 + 8))(v20, v8);
        (*(void (**)(char *, uint64_t))(v42 + 8))(v43, v44);
        (*(void (**)(char *, uint64_t))(v25 + 8))(v35, v23);
        return MEMORY[0x23B845920](v49);
      }
      (*(void (**)(char *, uint64_t))(v19 + 8))(v20, v8);
    }
    (*(void (**)(char *, uint64_t))(v42 + 8))(v43, v44);
    return MEMORY[0x23B845920](v49);
  }
  v26 = v12;
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, a3, v11);
  v27 = sub_23A232FF4();
  v28 = sub_23A233258();
  if (os_log_type_enabled(v27, v28))
  {
    v29 = (uint8_t *)swift_slowAlloc();
    v47 = swift_slowAlloc();
    v49 = v47;
    *(_DWORD *)v29 = 136446210;
    v46 = v29 + 4;
    sub_23A1F58C8(&qword_256951AD8, (uint64_t (*)(uint64_t))MEMORY[0x24BEE60D8], MEMORY[0x24BEE60F8]);
    v30 = sub_23A2334E0();
    v48 = sub_23A21FD94(v30, v31, &v49);
    sub_23A233288();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v26 + 8))(v14, v11);
    _os_log_impl(&dword_23A1F0000, v27, v28, "Wrote file %{public}s", v29, 0xCu);
    v32 = v47;
    swift_arrayDestroy();
    MEMORY[0x23B845A58](v32, -1, -1);
    MEMORY[0x23B845A58](v29, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v26 + 8))(v14, v11);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v42 + 8))(v43, v44);
}

void sub_23A21E600(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  int v18;
  void (*v19)(char *, uint64_t, uint64_t);
  NSObject *v20;
  os_log_type_t v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  void (*v26)(char *, uint64_t);
  uint64_t v27;
  unint64_t v28;
  int v29;
  os_log_t v30;
  uint64_t v31;
  void (*v32)(char *, uint64_t, uint64_t);
  NSObject *v33;
  os_log_type_t v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  void (*v39)(char *, uint64_t);
  char *v40;
  uint64_t v41;
  unint64_t v42;
  os_log_t v43;
  uint64_t v44;
  void (*v45)(char *, uint64_t);
  uint64_t v46;
  char *v47;
  uint64_t v48;
  void (*v49)(char *, uint64_t);
  uint64_t v50;
  os_log_t v51;
  uint64_t v52;
  char *v53;
  os_log_t v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  int *v59;
  uint64_t v60;
  uint64_t v61;
  int v62;
  int v63;

  v4 = sub_23A232E80();
  v54 = *(os_log_t *)(v4 - 8);
  v55 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v53 = (char *)&v50 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_23A2330D8();
  v57 = *(_QWORD *)(v6 - 8);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v50 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v7);
  v12 = (char *)&v50 - v11;
  v13 = MEMORY[0x24BDAC7A8](v10);
  v56 = (char *)&v50 - v14;
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v50 - v15;
  v63 = 0;
  v58 = a2;
  v59 = &v63;
  v17 = sub_23A2330A8();
  if (v63)
  {
    v18 = MEMORY[0x23B844E10](v17);
    v19 = *(void (**)(char *, uint64_t, uint64_t))(v57 + 16);
    v19(v12, a1, v6);
    v19(v9, a2, v6);
    v20 = sub_23A232FF4();
    v21 = sub_23A233264();
    v22 = v21;
    if (os_log_type_enabled(v20, v21))
    {
      v23 = swift_slowAlloc();
      v52 = swift_slowAlloc();
      v61 = v52;
      *(_DWORD *)v23 = 136446722;
      v62 = v22;
      sub_23A1F58C8(&qword_256951AD8, (uint64_t (*)(uint64_t))MEMORY[0x24BEE60D8], MEMORY[0x24BEE60F8]);
      v51 = v20;
      v24 = sub_23A2334E0();
      v60 = sub_23A21FD94(v24, v25, &v61);
      LODWORD(v56) = v18;
      sub_23A233288();
      swift_bridgeObjectRelease();
      v26 = *(void (**)(char *, uint64_t))(v57 + 8);
      v26(v12, v6);
      *(_WORD *)(v23 + 12) = 2082;
      v27 = sub_23A2334E0();
      v60 = sub_23A21FD94(v27, v28, &v61);
      v29 = (int)v56;
      sub_23A233288();
      swift_bridgeObjectRelease();
      v26(v9, v6);
      *(_WORD *)(v23 + 22) = 1024;
      LODWORD(v60) = v29;
      sub_23A233288();
      v30 = v51;
      _os_log_impl(&dword_23A1F0000, v51, (os_log_type_t)v62, "renamex_np(%{public}s, %{public}s) failed: %{darwin.errno}d", (uint8_t *)v23, 0x1Cu);
      v31 = v52;
      swift_arrayDestroy();
      MEMORY[0x23B845A58](v31, -1, -1);
      MEMORY[0x23B845A58](v23, -1, -1);

    }
    else
    {

      v45 = *(void (**)(char *, uint64_t))(v57 + 8);
      v45(v12, v6);
      v45(v9, v6);
    }
    v46 = sub_23A233084();
    if ((v46 & 0x100000000) != 0)
    {
      __break(1u);
    }
    else
    {
      LODWORD(v61) = v46;
      sub_23A21ECDC(MEMORY[0x24BEE4AF8]);
      sub_23A1F58C8((unint64_t *)&qword_256951AD0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCAFE0], MEMORY[0x24BDCAFD8]);
      v47 = v53;
      v48 = v55;
      sub_23A232F28();
      sub_23A232E74();
      ((void (*)(char *, uint64_t))v54[1].isa)(v47, v48);
      swift_willThrow();
    }
  }
  else
  {
    v32 = *(void (**)(char *, uint64_t, uint64_t))(v57 + 16);
    v32(v16, a1, v6);
    v32(v56, a2, v6);
    v33 = sub_23A232FF4();
    v34 = sub_23A233258();
    v35 = v34;
    if (os_log_type_enabled(v33, v34))
    {
      v36 = swift_slowAlloc();
      v55 = swift_slowAlloc();
      v61 = v55;
      *(_DWORD *)v36 = 136446466;
      sub_23A1F58C8(&qword_256951AD8, (uint64_t (*)(uint64_t))MEMORY[0x24BEE60D8], MEMORY[0x24BEE60F8]);
      v54 = v33;
      v37 = sub_23A2334E0();
      v60 = sub_23A21FD94(v37, v38, &v61);
      sub_23A233288();
      swift_bridgeObjectRelease();
      v39 = *(void (**)(char *, uint64_t))(v57 + 8);
      v39(v16, v6);
      *(_WORD *)(v36 + 12) = 2082;
      LODWORD(v57) = v35;
      v40 = v56;
      v41 = sub_23A2334E0();
      v60 = sub_23A21FD94(v41, v42, &v61);
      sub_23A233288();
      swift_bridgeObjectRelease();
      v39(v40, v6);
      v43 = v54;
      _os_log_impl(&dword_23A1F0000, v54, (os_log_type_t)v57, "Atomically swapped %{public}s <-> %{public}s", (uint8_t *)v36, 0x16u);
      v44 = v55;
      swift_arrayDestroy();
      MEMORY[0x23B845A58](v44, -1, -1);
      MEMORY[0x23B845A58](v36, -1, -1);

    }
    else
    {

      v49 = *(void (**)(char *, uint64_t))(v57 + 8);
      v49(v16, v6);
      v49(v56, v6);
    }
  }
}

uint64_t sub_23A21EC00()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC23DarwinDirectoryInternal18FilesystemProvider_logger;
  v2 = sub_23A23300C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t sub_23A21EC50()
{
  return type metadata accessor for FilesystemProvider();
}

uint64_t type metadata accessor for FilesystemProvider()
{
  uint64_t result;

  result = qword_256952B30;
  if (!qword_256952B30)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_23A21EC94()
{
  return sub_23A2330A8();
}

unint64_t sub_23A21ECDC(uint64_t a1)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256952BE8);
  v2 = sub_23A2333FC();
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
    sub_23A21EFAC(v6, (uint64_t)&v15);
    v7 = v15;
    v8 = v16;
    result = sub_23A21EE04(v15, v16);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = (unint64_t)sub_23A21EFF4(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_23A21EE04(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_23A2337F8();
  sub_23A233168();
  v4 = sub_23A23381C();
  return sub_23A21EE68(a1, a2, v4);
}

unint64_t sub_23A21EE68(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if ((*v10 != a1 || v10[1] != a2) && (sub_23A233660() & 1) == 0)
    {
      v12 = ~v5;
      i = (i + 1) & v12;
      if (((*(_QWORD *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0)
      {
        v13 = (_QWORD *)(v9 + 16 * i);
        if ((*v13 != a1 || v13[1] != a2) && (sub_23A233660() & 1) == 0)
        {
          for (i = (i + 1) & v12; ((*(_QWORD *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0; i = (i + 1) & v12)
          {
            v15 = (_QWORD *)(v9 + 16 * i);
            if (*v15 == a1 && v15[1] == a2)
              break;
            if ((sub_23A233660() & 1) != 0)
              break;
          }
        }
      }
    }
  }
  return i;
}

uint64_t sub_23A21EFAC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_256952BF0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_23A21EFF4(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_23A21F004(char *a1)
{
  uint64_t v1;
  _DWORD *v2;
  uint64_t result;

  v2 = *(_DWORD **)(v1 + 16);
  result = renamex_np(*(const char **)(v1 + 24), a1, 2u);
  *v2 = result;
  return result;
}

uint64_t sub_23A21F038(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256952BF8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23A21F078()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  char **v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  char *v15;
  _QWORD *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  char *v26;
  char *v27;
  char *v28;
  void (*v29)(uint64_t, char *);
  uint64_t v30;
  char *v31;
  int v32;
  uint64_t v33;
  uint64_t result;
  uint64_t v35;
  BOOL v36;
  char **v37;
  char *v38;
  _QWORD *v39;
  char *v40;
  char *v42;
  int v43;
  uint64_t v44;
  uint64_t v45;
  BOOL v46;
  BOOL v47;
  char *v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  _QWORD *v57;
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v0 = sub_23A232E80();
  v51 = *(_QWORD *)(v0 - 8);
  v52 = v0;
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v49 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256952BF8);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char **)((char *)&v49 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v6 = sub_23A232E68();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (uint64_t)&v49 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v53 = (char *)&v49 - v11;
  v12 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  sub_23A2330C0();
  v13 = (void *)sub_23A233120();
  swift_bridgeObjectRelease();
  v56 = 0;
  v14 = objc_msgSend(v12, sel_contentsOfDirectoryAtPath_error_, v13, &v56);

  v15 = v56;
  if (v14)
  {
    v16 = (_QWORD *)sub_23A2331BC();
    v17 = v15;

    v57 = v16;
    v15 = (char *)v16[2];
    if (!v15)
    {
      v21 = 0;
      v7 = 0;
      goto LABEL_18;
    }
    v18 = v16[4];
    v19 = v16[5];
    if (v18 == 46 && v19 == 0xE100000000000000
      || (sub_23A233660() & 1) != 0
      || v18 == 11822 && v19 == 0xE200000000000000
      || (sub_23A233660() & 1) != 0)
    {
      v7 = 0;
LABEL_10:
      v20 = v7 + 1;
      if (!__OFADD__(v7, 1))
      {
        if ((char *)v20 == v15)
          goto LABEL_12;
        v5 = (char **)(16 * v7);
        v15 = (char *)(v7 + 1);
        while ((v20 & 0x8000000000000000) == 0)
        {
          v6 = v16[2];
          if ((unint64_t)v15 >= v6)
            goto LABEL_63;
          v10 = (uint64_t)v5 + (_QWORD)v16;
          v35 = *(uint64_t *)((char *)v5 + (_QWORD)v16 + 48);
          v2 = *(char **)((char *)v5 + (_QWORD)v16 + 56);
          v36 = v35 == 46 && v2 == (char *)0xE100000000000000;
          if (!v36
            && (sub_23A233660() & 1) == 0
            && (v35 != 11822 || v2 != (char *)0xE200000000000000)
            && (sub_23A233660() & 1) == 0)
          {
            if (v15 != (char *)v7)
            {
              if (v7 >= v6)
                goto LABEL_66;
              v37 = (char **)&v16[2 * v7 + 4];
              v38 = v37[1];
              v53 = *v37;
              v6 = *(_QWORD *)(v10 + 48);
              v2 = *(char **)(v10 + 56);
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
                v16 = sub_23A20511C(v16);
              v39 = &v16[2 * v7];
              v39[4] = v6;
              v39[5] = v2;
              swift_bridgeObjectRelease();
              if ((unint64_t)v15 >= v16[2])
                goto LABEL_67;
              v40 = (char *)v5 + (_QWORD)v16;
              *((_QWORD *)v40 + 6) = v53;
              *((_QWORD *)v40 + 7) = v38;
              swift_bridgeObjectRelease();
              v57 = v16;
            }
            if (__OFADD__(v7++, 1))
              goto LABEL_65;
          }
          ++v15;
          v5 += 2;
          if (v15 == (char *)v16[2])
            goto LABEL_12;
        }
        __break(1u);
LABEL_63:
        __break(1u);
      }
      __break(1u);
LABEL_65:
      __break(1u);
LABEL_66:
      __break(1u);
LABEL_67:
      __break(1u);
LABEL_68:
      __break(1u);
    }
    if (v15 == (char *)1)
    {
      v7 = 1;
    }
    else
    {
      v5 = (char **)(v16 + 7);
      v7 = 1;
      v6 = 0xE100000000000000;
      v10 = 11822;
      do
      {
        v45 = (uint64_t)*(v5 - 1);
        v2 = *v5;
        v46 = v45 == 46 && v2 == (char *)0xE100000000000000;
        if (v46 || (sub_23A233660() & 1) != 0)
          goto LABEL_10;
        v47 = v45 == 11822 && v2 == (char *)0xE200000000000000;
        if (v47 || (sub_23A233660() & 1) != 0)
          goto LABEL_10;
        v48 = (char *)(v7 + 1);
        if (__OFADD__(v7, 1))
          goto LABEL_68;
        v5 += 2;
        ++v7;
      }
      while (v48 != v15);
      v7 = (uint64_t)v15;
    }
LABEL_12:
    v21 = v16[2];
    if (v21 < v7)
    {
      __break(1u);
      goto LABEL_14;
    }
LABEL_18:
    sub_23A2051B0(v7, v21);
    return (uint64_t)v57;
  }
LABEL_14:
  v22 = (uint64_t)v5;
  v54 = v7;
  v50 = v2;
  v24 = v51;
  v23 = v52;
  v25 = v15;
  v26 = (char *)sub_23A232F40();

  swift_willThrow();
  v56 = v26;
  v27 = v26;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256951AE0);
  v28 = v53;
  if (!swift_dynamicCast())
    return MEMORY[0x23B845920](v56);
  v29 = *(void (**)(uint64_t, char *))(v54 + 32);
  v53 = (char *)v6;
  v29(v10, v28);
  v30 = sub_23A232E5C();
  v31 = v26;
  if (v30)
  {
    v55 = v30;
    v32 = swift_dynamicCast();
    v33 = v24;
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v24 + 56))(v22, v32 ^ 1u, 1, v23);
  }
  else
  {
    v33 = v24;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v24 + 56))(v22, 1, 1, v23);
  }
  v42 = v50;
  v43 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v33 + 48))(v22, 1, v23);
  sub_23A21F038(v22);
  v44 = v54;
  if (v43)
  {
    (*(void (**)(uint64_t, char *))(v54 + 8))(v10, v53);
    return MEMORY[0x23B845920](v56);
  }
  MEMORY[0x23B845920](v31);
  result = sub_23A232E5C();
  if (result)
  {
    v55 = result;
    swift_dynamicCast();
    sub_23A232E74();
    swift_willThrow();
    (*(void (**)(uint64_t, char *))(v44 + 8))(v10, v53);
    (*(void (**)(char *, uint64_t))(v33 + 8))(v42, v23);
    return MEMORY[0x23B845920](v56);
  }
  __break(1u);
  return result;
}

uint64_t sub_23A21F680()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
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
  id v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  int v24;
  uint64_t result;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;

  v1 = sub_23A232E80();
  v37 = *(_QWORD *)(v1 - 8);
  v38 = v1;
  MEMORY[0x24BDAC7A8](v1);
  v31 = (char *)&v30 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256952BF8);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_23A232E68();
  v36 = *(_QWORD *)(v6 - 8);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v35 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v30 - v9;
  v11 = sub_23A232F58();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v30 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23A2330C0();
  sub_23A232F4C();
  swift_bridgeObjectRelease();
  v16 = sub_23A232F64();
  if (!v0)
  {
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
    return v16;
  }
  v32 = v15;
  v33 = v12;
  v34 = v11;
  v40 = v0;
  v17 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256951AE0);
  if (!swift_dynamicCast())
  {
    (*(void (**)(char *, uint64_t))(v33 + 8))(v14, v34);
LABEL_13:
    MEMORY[0x23B845920](v40);
    return v16;
  }
  v30 = v16;
  v19 = v35;
  v18 = v36;
  (*(void (**)(char *, char *, uint64_t))(v36 + 32))(v35, v10, v6);
  v20 = sub_23A232E5C();
  if (v20)
  {
    v39 = v20;
    v21 = v38;
    v22 = swift_dynamicCast();
    v23 = v37;
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v37 + 56))(v5, v22 ^ 1u, 1, v21);
  }
  else
  {
    v23 = v37;
    v21 = v38;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v37 + 56))(v5, 1, 1, v38);
  }
  v24 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v23 + 48))(v5, 1, v21);
  sub_23A21F038((uint64_t)v5);
  if (v24)
  {
    (*(void (**)(char *, uint64_t))(v18 + 8))(v19, v6);
    (*(void (**)(char *, uint64_t))(v33 + 8))(v14, v34);
LABEL_12:
    v16 = v30;
    goto LABEL_13;
  }
  MEMORY[0x23B845920](v0);
  result = sub_23A232E5C();
  v27 = v33;
  v26 = v34;
  if (result)
  {
    v39 = result;
    v28 = v31;
    v29 = v38;
    swift_dynamicCast();
    sub_23A232E74();
    swift_willThrow();
    (*(void (**)(char *, uint64_t))(v36 + 8))(v19, v6);
    (*(void (**)(char *, uint64_t))(v27 + 8))(v14, v26);
    (*(void (**)(char *, uint64_t))(v37 + 8))(v28, v29);
    goto LABEL_12;
  }
  __break(1u);
  return result;
}

void sub_23A21F9D4(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  uint32_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint8_t *v11;
  uint64_t v12;
  uint32_t *v13;
  uint64_t v14;

  v4 = sub_23A233150();
  v5 = notify_post((const char *)(v4 + 32));
  swift_release();
  swift_bridgeObjectRetain_n();
  v6 = sub_23A232FF4();
  if (v5)
  {
    v7 = sub_23A233264();
    if (os_log_type_enabled(v6, v7))
    {
      v8 = swift_slowAlloc();
      v9 = swift_slowAlloc();
      v14 = v9;
      *(_DWORD *)v8 = 136446466;
      swift_bridgeObjectRetain();
      sub_23A21FD94(a1, a2, &v14);
      sub_23A233288();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v8 + 12) = 1024;
      sub_23A233288();
      _os_log_impl(&dword_23A1F0000, v6, v7, "notify_post(%{public}s) Failed: %u", (uint8_t *)v8, 0x12u);
      swift_arrayDestroy();
      MEMORY[0x23B845A58](v9, -1, -1);
      MEMORY[0x23B845A58](v8, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    if ((v5 & 0x80000000) != 0)
    {
      __break(1u);
    }
    else
    {
      sub_23A21FD50();
      swift_allocError();
      *v13 = v5;
      swift_willThrow();
    }
  }
  else
  {
    v10 = sub_23A233258();
    if (os_log_type_enabled(v6, (os_log_type_t)v10))
    {
      v11 = (uint8_t *)swift_slowAlloc();
      v12 = swift_slowAlloc();
      v14 = v12;
      *(_DWORD *)v11 = 136446210;
      swift_bridgeObjectRetain();
      sub_23A21FD94(a1, a2, &v14);
      sub_23A233288();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_23A1F0000, v6, (os_log_type_t)v10, "Posted notification %{public}s", v11, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B845A58](v12, -1, -1);
      MEMORY[0x23B845A58](v11, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

  }
}

uint64_t sub_23A21FCBC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC23DarwinDirectoryInternal20NotificationProvider_logger;
  v2 = sub_23A23300C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t sub_23A21FD0C()
{
  return type metadata accessor for NotificationProvider();
}

uint64_t type metadata accessor for NotificationProvider()
{
  uint64_t result;

  result = qword_256952C28;
  if (!qword_256952C28)
    return swift_getSingletonMetadata();
  return result;
}

unint64_t sub_23A21FD50()
{
  unint64_t result;

  result = qword_256952CB8;
  if (!qword_256952CB8)
  {
    result = MEMORY[0x23B8459BC](&unk_23A23483C, &type metadata for NotificationError);
    atomic_store(result, (unint64_t *)&qword_256952CB8);
  }
  return result;
}

uint64_t sub_23A21FD94(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_23A21FE64(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_23A2203D4((uint64_t)v12, *a3);
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
      sub_23A2203D4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_23A21FE64(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_23A233294();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_23A22001C(a5, a6);
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
  v8 = sub_23A233360();
  if (!v8)
  {
    sub_23A2333C0();
    __break(1u);
LABEL_17:
    result = sub_23A233408();
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

uint64_t sub_23A22001C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_23A2200B0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_23A220288(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_23A220288(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_23A2200B0(uint64_t a1, unint64_t a2)
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
      v3 = sub_23A220224(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_23A23330C();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_23A2333C0();
      __break(1u);
LABEL_10:
      v2 = sub_23A23318C();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_23A233408();
    __break(1u);
LABEL_14:
    result = sub_23A2333C0();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_23A220224(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256952CC0);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_23A220288(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_256952CC0);
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
  result = sub_23A233408();
  __break(1u);
  return result;
}

uint64_t sub_23A2203D4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_23A220410(uint64_t a1)
{
  unint64_t result;

  result = sub_23A220434();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_23A220434()
{
  unint64_t result;

  result = qword_256952CC8;
  if (!qword_256952CC8)
  {
    result = MEMORY[0x23B8459BC](&unk_23A2353C8, &type metadata for Configuration);
    atomic_store(result, (unint64_t *)&qword_256952CC8);
  }
  return result;
}

unint64_t sub_23A220478(uint64_t a1)
{
  unint64_t result;

  result = sub_23A1F5908();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

void sub_23A22049C(char a1)
{
  sub_23A2337F8();
  __asm { BR              X10 }
}

uint64_t sub_23A2204F8()
{
  sub_23A233168();
  swift_bridgeObjectRelease();
  return sub_23A23381C();
}

void sub_23A220574(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_23A2205C0()
{
  sub_23A233168();
  return swift_bridgeObjectRelease();
}

void sub_23A220628(uint64_t a1, char a2)
{
  __asm { BR              X11 }
}

uint64_t sub_23A220670()
{
  sub_23A233168();
  return swift_bridgeObjectRelease();
}

void sub_23A220728(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_23A22075C()
{
  sub_23A233168();
  return swift_bridgeObjectRelease();
}

void sub_23A220820(uint64_t a1, char a2)
{
  sub_23A2337F8();
  __asm { BR              X10 }
}

uint64_t sub_23A220860()
{
  sub_23A233168();
  swift_bridgeObjectRelease();
  return sub_23A23381C();
}

void sub_23A220938(uint64_t a1, char a2)
{
  sub_23A2337F8();
  __asm { BR              X10 }
}

uint64_t sub_23A220990()
{
  sub_23A233168();
  swift_bridgeObjectRelease();
  return sub_23A23381C();
}

void sub_23A220A0C(uint64_t a1, char a2)
{
  sub_23A2337F8();
  __asm { BR              X10 }
}

uint64_t sub_23A220A58()
{
  sub_23A233168();
  swift_bridgeObjectRelease();
  return sub_23A23381C();
}

uint64_t sub_23A220AF8(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_23A220B38 + 4 * byte_23A23537C[a1]))(0x7A696D796E6F6E61, 0xEE00734449555565);
}

unint64_t sub_23A220B38()
{
  return 0xD000000000000013;
}

unint64_t sub_23A220B54()
{
  return 0xD000000000000024;
}

uint64_t sub_23A220B8C(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_23A220BCC + 4 * byte_23A235380[a1]))(0x7A696D796E6F6E61, 0xEE00734449555565);
}

unint64_t sub_23A220BCC()
{
  return 0xD000000000000013;
}

unint64_t sub_23A220BE8()
{
  return 0xD000000000000024;
}

uint64_t sub_23A220C20(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;

  v15 = a3;
  v16 = a5;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256952CE0);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23A22123C();
  sub_23A233834();
  LOBYTE(v18) = 0;
  sub_23A233498();
  if (!v5)
  {
    v12 = v16;
    v18 = v15;
    v17 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256952A78);
    sub_23A221280(&qword_256952AA0, &qword_256951DF0, MEMORY[0x24BDCEA70], MEMORY[0x24BEE1700]);
    sub_23A2334B0();
    v18 = a4;
    v17 = 2;
    sub_23A2334B0();
    v18 = v12;
    v17 = 3;
    sub_23A2334B0();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

void sub_23A220DF8(char *a1)
{
  sub_23A1F38E4(*a1);
}

void sub_23A220E04()
{
  char *v0;

  sub_23A22049C(*v0);
}

void sub_23A220E0C(uint64_t a1)
{
  char *v1;

  sub_23A220574(a1, *v1);
}

void sub_23A220E14(uint64_t a1)
{
  char *v1;

  sub_23A220938(a1, *v1);
}

uint64_t sub_23A220E1C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23A220F4C();
  *a1 = result;
  return result;
}

uint64_t sub_23A220E48@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_23A220AF8(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_23A220E70()
{
  unsigned __int8 *v0;

  return sub_23A220B8C(*v0);
}

uint64_t sub_23A220E78@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_23A220F4C();
  *a1 = result;
  return result;
}

void sub_23A220E9C(_BYTE *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_23A220EA8()
{
  sub_23A22123C();
  return sub_23A233858();
}

uint64_t sub_23A220ED0()
{
  sub_23A22123C();
  return sub_23A233864();
}

uint64_t sub_23A220EF8@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  result = sub_23A220F94(a1);
  if (!v2)
  {
    *(_BYTE *)a2 = result & 1;
    *(_QWORD *)(a2 + 8) = v5;
    *(_QWORD *)(a2 + 16) = v6;
    *(_QWORD *)(a2 + 24) = v7;
  }
  return result;
}

uint64_t sub_23A220F2C(_QWORD *a1)
{
  uint64_t *v1;

  return sub_23A220C20(a1, *(unsigned __int8 *)v1, v1[1], v1[2], v1[3]);
}

uint64_t sub_23A220F4C()
{
  unint64_t v0;

  v0 = sub_23A233414();
  swift_bridgeObjectRelease();
  if (v0 >= 4)
    return 4;
  else
    return v0;
}

uint64_t sub_23A220F94(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  char v11;
  uint64_t v12;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_256952CD0);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = a1[3];
  __swift_project_boxed_opaque_existential_1(a1, v7);
  sub_23A22123C();
  sub_23A233828();
  if (v1)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  }
  else
  {
    LOBYTE(v12) = 0;
    LOBYTE(v7) = sub_23A233438();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256952A78);
    v11 = 1;
    v8 = sub_23A221280(&qword_256952A80, &qword_256951E18, MEMORY[0x24BDCEAA8], MEMORY[0x24BEE1720]);
    sub_23A233450();
    v11 = 2;
    swift_bridgeObjectRetain();
    v10 = v8;
    sub_23A233450();
    v11 = 3;
    swift_bridgeObjectRetain();
    v10 = 0;
    sub_23A233450();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    swift_bridgeObjectRetain();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v7 & 1;
}

unint64_t sub_23A22123C()
{
  unint64_t result;

  result = qword_256952CD8;
  if (!qword_256952CD8)
  {
    result = MEMORY[0x23B8459BC](&unk_23A235538, &type metadata for Configuration.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256952CD8);
  }
  return result;
}

uint64_t sub_23A221280(unint64_t *a1, unint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;

  result = *a1;
  if (!result)
  {
    v9 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256952A78);
    v10 = sub_23A2212FC(a2, a3);
    result = MEMORY[0x23B8459BC](a4, v9, &v10);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23A2212FC(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = sub_23A232FE8();
    result = MEMORY[0x23B8459BC](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for Configuration.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for Configuration.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23A221418 + 4 * byte_23A235389[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_23A22144C + 4 * byte_23A235384[v4]))();
}

uint64_t sub_23A22144C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A221454(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23A22145CLL);
  return result;
}

uint64_t sub_23A221468(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23A221470);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_23A221474(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23A22147C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for Configuration.CodingKeys()
{
  return &type metadata for Configuration.CodingKeys;
}

uint64_t destroy for Configuration()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for Configuration(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for Configuration(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t assignWithTake for Configuration(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for Configuration(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 32))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Configuration(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 32) = 1;
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
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for Configuration()
{
  return &type metadata for Configuration;
}

unint64_t sub_23A221694()
{
  unint64_t result;

  result = qword_256952CE8;
  if (!qword_256952CE8)
  {
    result = MEMORY[0x23B8459BC](&unk_23A235510, &type metadata for Configuration.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256952CE8);
  }
  return result;
}

unint64_t sub_23A2216DC()
{
  unint64_t result;

  result = qword_256952CF0;
  if (!qword_256952CF0)
  {
    result = MEMORY[0x23B8459BC](&unk_23A235448, &type metadata for Configuration.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256952CF0);
  }
  return result;
}

unint64_t sub_23A221724()
{
  unint64_t result;

  result = qword_256952CF8;
  if (!qword_256952CF8)
  {
    result = MEMORY[0x23B8459BC](&unk_23A235470, &type metadata for Configuration.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_256952CF8);
  }
  return result;
}

uint64_t destroy for XPCCodingKey()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for XPCCodingKey(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for XPCCodingKey(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = v4;
  return a1;
}

__n128 __swift_memcpy25_8(uint64_t a1, uint64_t a2)
{
  __n128 result;

  result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for XPCCodingKey(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  return a1;
}

uint64_t getEnumTagSinglePayload for XPCCodingKey(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 25))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for XPCCodingKey(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_BYTE *)(result + 24) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 25) = 1;
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
    *(_BYTE *)(result + 25) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for XPCCodingKey()
{
  return &type metadata for XPCCodingKey;
}

uint64_t sub_23A2218FC()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_23A221928@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(_QWORD *)a3 = result;
  *(_QWORD *)(a3 + 8) = a2;
  *(_QWORD *)(a3 + 16) = 0;
  *(_BYTE *)(a3 + 24) = 1;
  return result;
}

uint64_t sub_23A22193C()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 16);
}

uint64_t sub_23A221948@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;
  uint64_t v5;

  result = sub_23A2334E0();
  *(_QWORD *)a2 = result;
  *(_QWORD *)(a2 + 8) = v5;
  *(_QWORD *)(a2 + 16) = a1;
  *(_BYTE *)(a2 + 24) = 0;
  return result;
}

uint64_t sub_23A2219A0()
{
  sub_23A221A80();
  return sub_23A233858();
}

uint64_t sub_23A2219C8()
{
  sub_23A221A80();
  return sub_23A233864();
}

unint64_t sub_23A2219F4()
{
  unint64_t result;

  result = qword_256952D60;
  if (!qword_256952D60)
  {
    result = MEMORY[0x23B8459BC](&unk_23A2355B0, &type metadata for XPCCodingKey);
    atomic_store(result, (unint64_t *)&qword_256952D60);
  }
  return result;
}

unint64_t sub_23A221A3C()
{
  unint64_t result;

  result = qword_256952D68;
  if (!qword_256952D68)
  {
    result = MEMORY[0x23B8459BC](&unk_23A2355D8, &type metadata for XPCCodingKey);
    atomic_store(result, (unint64_t *)&qword_256952D68);
  }
  return result;
}

unint64_t sub_23A221A80()
{
  unint64_t result;

  result = qword_256952D70;
  if (!qword_256952D70)
  {
    result = MEMORY[0x23B8459BC](&unk_23A235600, &type metadata for XPCCodingKey);
    atomic_store(result, (unint64_t *)&qword_256952D70);
  }
  return result;
}

uint64_t sub_23A221AC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v7 = type metadata accessor for _XPCEncoder();
  v8 = (_QWORD *)swift_allocObject();
  v9 = MEMORY[0x24BEE4AF8];
  v8[2] = MEMORY[0x24BEE4AF8];
  v8[3] = sub_23A221CF4(v9);
  v8[4] = 0;
  v16 = v7;
  v17 = sub_23A224F98((unint64_t *)&unk_256952DE0, type metadata accessor for _XPCEncoder, (uint64_t)&unk_23A235790);
  v14 = (uint64_t)v8;
  swift_retain();
  sub_23A2330E4();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v14);
  if (!v3)
  {
    a3 = v8[4];
    if (a3)
    {
      swift_unknownObjectRetain();
      swift_release();
      return a3;
    }
    a3 = sub_23A233354();
    swift_allocError();
    v12 = v11;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256952AC8);
    v12[3] = a2;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v12);
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 16))(boxed_opaque_existential_1, a1, a2);
    v14 = 0;
    v15 = 0xE000000000000000;
    sub_23A233300();
    swift_bridgeObjectRelease();
    v14 = 0x6576656C2D706F54;
    v15 = 0xEA0000000000206CLL;
    sub_23A233870();
    sub_23A233174();
    swift_bridgeObjectRelease();
    sub_23A233174();
    sub_23A233330();
    (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(a3 - 8) + 104))(v12, *MEMORY[0x24BEE2728], a3);
    swift_willThrow();
  }
  swift_release();
  return a3;
}

uint64_t type metadata accessor for _XPCEncoder()
{
  return objc_opt_self();
}

unint64_t sub_23A221CF4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t result;
  char v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;
  _QWORD v22[2];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569532E0);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(_QWORD *)(a1 + 16))
  {
    v7 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(qword_2569532E8);
  v6 = sub_23A2333FC();
  v7 = (_QWORD *)v6;
  v8 = *(_QWORD *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  v9 = &v5[*(int *)(v2 + 48)];
  v10 = v6 + 64;
  v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v22[1] = a1;
  v12 = a1 + v11;
  v13 = *(_QWORD *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_23A224D04(v12, (uint64_t)v5);
    result = sub_23A2248D4((uint64_t)v5);
    if ((v15 & 1) != 0)
      break;
    v16 = result;
    *(_QWORD *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v17 = v7[6];
    v18 = sub_23A2333B4();
    (*(void (**)(unint64_t, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 32))(v17 + *(_QWORD *)(*(_QWORD *)(v18 - 8) + 72) * v16, v5, v18);
    result = (unint64_t)sub_23A21EFF4(v9, (_OWORD *)(v7[7] + 32 * v16));
    v19 = v7[2];
    v20 = __OFADD__(v19, 1);
    v21 = v19 + 1;
    if (v20)
      goto LABEL_11;
    v7[2] = v21;
    v12 += v13;
    if (!--v8)
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

ValueMetadata *type metadata accessor for SimpleXPCEncoder()
{
  return &type metadata for SimpleXPCEncoder;
}

uint64_t sub_23A221E98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  xpc_object_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v4 = v3;
  v7 = *(xpc_object_t *)(v4 + 32);
  if (!v7)
    goto LABEL_4;
  v8 = swift_unknownObjectRetain();
  v9 = MEMORY[0x23B845B54](v8);
  if (v9 != sub_23A233078())
  {
    __break(1u);
LABEL_4:
    v7 = xpc_dictionary_create(0, 0, 0);
    *(_QWORD *)(v4 + 32) = v7;
    swift_unknownObjectRetain();
    swift_unknownObjectRelease();
  }
  v10 = *(_QWORD *)(v4 + 16);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain();
  sub_23A221FE4(v4, v10, (uint64_t)v7);
  v12 = type metadata accessor for _XPCKeyedEncodingContainer(0, a2, a3, v11);
  swift_retain();
  swift_unknownObjectRetain();
  swift_bridgeObjectRetain();
  MEMORY[0x23B8459BC](&unk_23A235850, v12);
  sub_23A2334C8();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  return swift_unknownObjectRelease();
}

uint64_t sub_23A221FE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t result;

  v4 = MEMORY[0x23B845B54](a3);
  if (v4 == sub_23A233078())
    return a1;
  result = sub_23A2333CC();
  __break(1u);
  return result;
}

uint64_t sub_23A222088@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  xpc_object_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;

  v3 = *(xpc_object_t *)(v1 + 32);
  if (v3)
  {
    v4 = swift_unknownObjectRetain();
    v5 = MEMORY[0x23B845B54](v4);
    if (v5 == sub_23A23303C())
      goto LABEL_5;
    __break(1u);
  }
  v3 = xpc_array_create(0, 0);
  *(_QWORD *)(v1 + 32) = v3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
LABEL_5:
  v6 = *(_QWORD *)(v1 + 16);
  swift_retain();
  swift_bridgeObjectRetain();
  v7 = swift_unknownObjectRetain();
  v8 = MEMORY[0x23B845B54](v7);
  if (v8 == sub_23A23303C())
  {
    a1[3] = &type metadata for _XPCUnkeyedEncodingContainer;
    a1[4] = sub_23A224CB4();
    result = swift_unknownObjectRelease();
    *a1 = v1;
    a1[1] = v3;
    a1[2] = v6;
  }
  else
  {
    result = sub_23A2333CC();
    __break(1u);
  }
  return result;
}

uint64_t sub_23A2221A8()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_23A2221DC()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_23A2221E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23A221E98(a1, a2, a3);
}

uint64_t sub_23A222208@<X0>(_QWORD *a1@<X8>)
{
  return sub_23A222088(a1);
}

void sub_23A222228(_QWORD *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  if (*(_QWORD *)(*v1 + 32))
  {
    __break(1u);
  }
  else
  {
    a1[3] = type metadata accessor for _XPCEncoder();
    a1[4] = sub_23A224F98(&qword_2569532C8, type metadata accessor for _XPCEncoder, (uint64_t)&unk_23A2356D8);
    *a1 = v3;
    swift_retain();
  }
}

uint64_t sub_23A22228C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t *boxed_opaque_existential_1;
  void *v8;
  uint64_t result;
  uint64_t v10[5];

  v10[4] = a3;
  v10[3] = a2;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v10);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 16))(boxed_opaque_existential_1, a1, a2);
  v8 = sub_23A224A4C(v10);
  result = __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
  if (!v4)
  {
    *(_QWORD *)(v3 + 32) = v8;
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_23A222310()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_23A22231C()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  *(_QWORD *)(v1 + 32) = xpc_null_create();
  return swift_unknownObjectRelease();
}

uint64_t sub_23A222354(char a1)
{
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 32) = xpc_BOOL_create(a1 & 1);
  return swift_unknownObjectRelease();
}

uint64_t sub_23A222390()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  xpc_object_t v3;

  v1 = *v0;
  v2 = sub_23A233150();
  v3 = xpc_string_create((const char *)(v2 + 32));
  swift_release();
  *(_QWORD *)(v1 + 32) = v3;
  return swift_unknownObjectRelease();
}

uint64_t sub_23A2223E4(double a1)
{
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 32) = xpc_double_create(a1);
  return swift_unknownObjectRelease();
}

uint64_t sub_23A22241C(float a1)
{
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 32) = xpc_double_create(a1);
  return swift_unknownObjectRelease();
}

uint64_t sub_23A222458(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23A22260C(a1, a2, a3, (uint64_t (*)(void))MEMORY[0x24BDB0A80]);
}

uint64_t sub_23A222474(char a1)
{
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 32) = xpc_int64_create(a1);
  return swift_unknownObjectRelease();
}

uint64_t sub_23A2224B0(__int16 a1)
{
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 32) = xpc_int64_create(a1);
  return swift_unknownObjectRelease();
}

uint64_t sub_23A2224EC(int a1)
{
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 32) = xpc_int64_create(a1);
  return swift_unknownObjectRelease();
}

uint64_t sub_23A222528()
{
  return sub_23A233684();
}

uint64_t sub_23A22253C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23A22260C(a1, a2, a3, (uint64_t (*)(void))MEMORY[0x24BDB0BD8]);
}

uint64_t sub_23A222558(unsigned __int8 a1)
{
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 32) = xpc_uint64_create(a1);
  return swift_unknownObjectRelease();
}

uint64_t sub_23A222594(unsigned __int16 a1)
{
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 32) = xpc_uint64_create(a1);
  return swift_unknownObjectRelease();
}

uint64_t sub_23A2225D0(uint64_t value)
{
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 32) = xpc_uint64_create(value);
  return swift_unknownObjectRelease();
}

uint64_t sub_23A22260C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t *v4;
  uint64_t v5;

  v5 = *v4;
  *(_QWORD *)(v5 + 32) = a4();
  return swift_unknownObjectRelease();
}

uint64_t sub_23A222644()
{
  return sub_23A233690();
}

uint64_t sub_23A222658(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23A22228C(a1, a2, a3);
}

uint64_t sub_23A222678(uint64_t a1, ValueMetadata *a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  size_t count;
  _QWORD *v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t *boxed_opaque_existential_1;
  void *v13;
  void *v14;
  xpc_object_t xarray;
  uint64_t v18;
  __int128 v19;
  ValueMetadata *v20;
  unint64_t v21;
  size_t v22;

  v4 = v3;
  xarray = *(xpc_object_t *)(v3 + 8);
  count = xpc_array_get_count(xarray);
  *(_QWORD *)&v19 = 0x207865646E49;
  *((_QWORD *)&v19 + 1) = 0xE600000000000000;
  v22 = count;
  sub_23A2334E0();
  sub_23A233174();
  swift_bridgeObjectRelease();
  v8 = *(_QWORD **)(v3 + 16);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v8 = sub_23A22DD14(0, v8[2] + 1, 1, v8);
  v10 = v8[2];
  v9 = v8[3];
  if (v10 >= v9 >> 1)
    v8 = sub_23A22DD14((_QWORD *)(v9 > 1), v10 + 1, 1, v8);
  v20 = &type metadata for XPCCodingKey;
  v21 = sub_23A221A80();
  v11 = swift_allocObject();
  *(_QWORD *)&v19 = v11;
  *(_QWORD *)(v11 + 16) = 0x207865646E49;
  *(_QWORD *)(v11 + 24) = 0xE600000000000000;
  *(_QWORD *)(v11 + 32) = count;
  *(_BYTE *)(v11 + 40) = 0;
  v8[2] = v10 + 1;
  sub_23A224F80(&v19, (uint64_t)&v8[5 * v10 + 4]);
  *(_QWORD *)(v4 + 16) = v8;
  v20 = a2;
  v21 = a3;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v19);
  (*((void (**)(uint64_t *, uint64_t, ValueMetadata *))a2[-1].Description + 2))(boxed_opaque_existential_1, a1, a2);
  v13 = sub_23A224A4C(&v19);
  if (v18)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v19);
  }
  else
  {
    v14 = v13;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v19);
    xpc_array_append_value(xarray, v14);
    swift_unknownObjectRelease();
  }
  return sub_23A222C90(v4);
}

uint64_t sub_23A222840(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t *v4;
  void *v7;
  size_t count;
  _QWORD *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  xpc_object_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v20;
  uint64_t v21;
  ValueMetadata *v22;
  unint64_t v23;
  size_t v24;

  v4 = v3;
  v7 = (void *)v3[1];
  count = xpc_array_get_count(v7);
  *(_QWORD *)&v20 = 0x207865646E49;
  *((_QWORD *)&v20 + 1) = 0xE600000000000000;
  v24 = count;
  sub_23A2334E0();
  sub_23A233174();
  swift_bridgeObjectRelease();
  v9 = (_QWORD *)v3[2];
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v9 = sub_23A22DD14(0, v9[2] + 1, 1, v9);
  v11 = v9[2];
  v10 = v9[3];
  if (v11 >= v10 >> 1)
    v9 = sub_23A22DD14((_QWORD *)(v10 > 1), v11 + 1, 1, v9);
  v22 = &type metadata for XPCCodingKey;
  v23 = sub_23A221A80();
  v12 = swift_allocObject();
  *(_QWORD *)&v20 = v12;
  *(_QWORD *)(v12 + 16) = 0x207865646E49;
  *(_QWORD *)(v12 + 24) = 0xE600000000000000;
  *(_QWORD *)(v12 + 32) = count;
  *(_BYTE *)(v12 + 40) = 0;
  v9[2] = v11 + 1;
  sub_23A224F80(&v20, (uint64_t)&v9[5 * v11 + 4]);
  v4[2] = (uint64_t)v9;
  v13 = xpc_dictionary_create(0, 0, 0);
  xpc_array_append_value(v7, v13);
  v14 = *v4;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain();
  *(_QWORD *)&v20 = sub_23A221FE4(v14, (uint64_t)v9, (uint64_t)v13);
  *((_QWORD *)&v20 + 1) = v15;
  v21 = v16;
  v18 = type metadata accessor for _XPCKeyedEncodingContainer(0, a2, a3, v17);
  swift_retain();
  swift_unknownObjectRetain();
  swift_bridgeObjectRetain();
  MEMORY[0x23B8459BC](&unk_23A235850, v18);
  sub_23A2334C8();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  swift_unknownObjectRelease();
  return sub_23A222C90((uint64_t)v4);
}

uint64_t sub_23A222A78@<X0>(_QWORD *a1@<X8>)
{
  uint64_t *v1;
  uint64_t *v2;
  void *v4;
  size_t count;
  _QWORD *v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  xpc_object_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t result;
  __int128 v15;
  ValueMetadata *v16;
  unint64_t v17;
  size_t v18;

  v2 = v1;
  v4 = (void *)v1[1];
  count = xpc_array_get_count(v4);
  *(_QWORD *)&v15 = 0x207865646E49;
  *((_QWORD *)&v15 + 1) = 0xE600000000000000;
  v18 = count;
  sub_23A2334E0();
  sub_23A233174();
  swift_bridgeObjectRelease();
  v6 = (_QWORD *)v1[2];
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v6 = sub_23A22DD14(0, v6[2] + 1, 1, v6);
  v8 = v6[2];
  v7 = v6[3];
  if (v8 >= v7 >> 1)
    v6 = sub_23A22DD14((_QWORD *)(v7 > 1), v8 + 1, 1, v6);
  v16 = &type metadata for XPCCodingKey;
  v17 = sub_23A221A80();
  v9 = swift_allocObject();
  *(_QWORD *)&v15 = v9;
  *(_QWORD *)(v9 + 16) = 0x207865646E49;
  *(_QWORD *)(v9 + 24) = 0xE600000000000000;
  *(_QWORD *)(v9 + 32) = count;
  *(_BYTE *)(v9 + 40) = 0;
  v6[2] = v8 + 1;
  sub_23A224F80(&v15, (uint64_t)&v6[5 * v8 + 4]);
  v2[2] = (uint64_t)v6;
  v10 = xpc_array_create(0, 0);
  xpc_array_append_value(v4, v10);
  v11 = *v2;
  swift_retain();
  swift_bridgeObjectRetain();
  v12 = swift_unknownObjectRetain();
  v13 = MEMORY[0x23B845B54](v12);
  if (v13 == sub_23A23303C())
  {
    a1[3] = &type metadata for _XPCUnkeyedEncodingContainer;
    a1[4] = sub_23A224CB4();
    swift_unknownObjectRelease();
    *a1 = v11;
    a1[1] = v10;
    a1[2] = v6;
    return sub_23A222C90((uint64_t)v2);
  }
  else
  {
    result = sub_23A2333CC();
    __break(1u);
  }
  return result;
}

uint64_t sub_23A222C90(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;

  v2 = *(_QWORD **)(a1 + 16);
  if (!v2[2])
  {
    __break(1u);
LABEL_6:
    result = (uint64_t)sub_23A22DF44(v2);
    v2 = (_QWORD *)result;
    v4 = *(_QWORD *)(result + 16);
    if (v4)
      goto LABEL_4;
    goto LABEL_7;
  }
  v1 = a1;
  result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) == 0)
    goto LABEL_6;
  v4 = v2[2];
  if (v4)
  {
LABEL_4:
    v5 = v4 - 1;
    result = __swift_destroy_boxed_opaque_existential_1((uint64_t)&v2[5 * v4 - 1]);
    v2[2] = v5;
    *(_QWORD *)(v1 + 16) = v2;
    return result;
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t sub_23A222D0C@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  void *v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;

  v3 = *(void **)(v1 + 8);
  swift_retain();
  xpc_array_get_count(v3);
  v4 = type metadata accessor for _XPCSuperUnkeyedEncoder();
  v5 = (_QWORD *)swift_allocObject();
  v6 = swift_unknownObjectRetain();
  v7 = MEMORY[0x23B845B54](v6);
  result = sub_23A23303C();
  if (v7 == result)
  {
    v9 = MEMORY[0x24BEE4AF8];
    v5[2] = MEMORY[0x24BEE4AF8];
    v5[3] = sub_23A221CF4(v9);
    v5[4] = 0;
    swift_release();
    swift_unknownObjectRelease();
    a1[3] = v4;
    result = sub_23A224F98((unint64_t *)&unk_256953370, type metadata accessor for _XPCSuperUnkeyedEncoder, (uint64_t)&unk_23A235790);
    a1[4] = result;
    *a1 = v5;
  }
  else
  {
    __break(1u);
  }
  return result;
}

size_t sub_23A222DD0()
{
  uint64_t v0;

  return xpc_array_get_count(*(xpc_object_t *)(v0 + 8));
}

uint64_t sub_23A222DD8()
{
  uint64_t v0;
  void *v1;
  xpc_object_t v2;

  v1 = *(void **)(v0 + 8);
  v2 = xpc_null_create();
  xpc_array_append_value(v1, v2);
  return swift_unknownObjectRelease();
}

uint64_t sub_23A222E20(char a1)
{
  uint64_t v1;
  void *v2;
  xpc_object_t v3;

  v2 = *(void **)(v1 + 8);
  v3 = xpc_BOOL_create(a1 & 1);
  xpc_array_append_value(v2, v3);
  return swift_unknownObjectRelease();
}

uint64_t sub_23A222E6C()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  xpc_object_t v3;

  v1 = *(void **)(v0 + 8);
  v2 = sub_23A233150();
  v3 = xpc_string_create((const char *)(v2 + 32));
  swift_release();
  xpc_array_append_value(v1, v3);
  return swift_unknownObjectRelease();
}

uint64_t sub_23A222EC8(double a1)
{
  uint64_t v1;
  void *v2;
  xpc_object_t v3;

  v2 = *(void **)(v1 + 8);
  v3 = xpc_double_create(a1);
  xpc_array_append_value(v2, v3);
  return swift_unknownObjectRelease();
}

uint64_t sub_23A222F10(float a1)
{
  uint64_t v1;
  void *v2;
  xpc_object_t v3;

  v2 = *(void **)(v1 + 8);
  v3 = xpc_double_create(a1);
  xpc_array_append_value(v2, v3);
  return swift_unknownObjectRelease();
}

uint64_t sub_23A222F5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23A223170(a1, a2, a3, (uint64_t (*)(void))MEMORY[0x24BDB0A80]);
}

uint64_t sub_23A222F78(char a1)
{
  uint64_t v1;
  void *v2;
  xpc_object_t v3;

  v2 = *(void **)(v1 + 8);
  v3 = xpc_int64_create(a1);
  xpc_array_append_value(v2, v3);
  return swift_unknownObjectRelease();
}

uint64_t sub_23A222FC4(__int16 a1)
{
  uint64_t v1;
  void *v2;
  xpc_object_t v3;

  v2 = *(void **)(v1 + 8);
  v3 = xpc_int64_create(a1);
  xpc_array_append_value(v2, v3);
  return swift_unknownObjectRelease();
}

uint64_t sub_23A223010(int a1)
{
  uint64_t v1;
  void *v2;
  xpc_object_t v3;

  v2 = *(void **)(v1 + 8);
  v3 = xpc_int64_create(a1);
  xpc_array_append_value(v2, v3);
  return swift_unknownObjectRelease();
}

uint64_t sub_23A22305C()
{
  return sub_23A23363C();
}

uint64_t sub_23A223070(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23A223170(a1, a2, a3, (uint64_t (*)(void))MEMORY[0x24BDB0BD8]);
}

uint64_t sub_23A22308C(unsigned __int8 a1)
{
  uint64_t v1;
  void *v2;
  xpc_object_t v3;

  v2 = *(void **)(v1 + 8);
  v3 = xpc_uint64_create(a1);
  xpc_array_append_value(v2, v3);
  return swift_unknownObjectRelease();
}

uint64_t sub_23A2230D8(unsigned __int16 a1)
{
  uint64_t v1;
  void *v2;
  xpc_object_t v3;

  v2 = *(void **)(v1 + 8);
  v3 = xpc_uint64_create(a1);
  xpc_array_append_value(v2, v3);
  return swift_unknownObjectRelease();
}

uint64_t sub_23A223124(uint64_t value)
{
  uint64_t v1;
  void *v2;
  xpc_object_t v3;

  v2 = *(void **)(v1 + 8);
  v3 = xpc_uint64_create(value);
  xpc_array_append_value(v2, v3);
  return swift_unknownObjectRelease();
}

uint64_t sub_23A223170(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v4;
  void *v5;
  void *v6;

  v5 = *(void **)(v4 + 8);
  v6 = (void *)a4();
  xpc_array_append_value(v5, v6);
  return swift_unknownObjectRelease();
}

uint64_t sub_23A2231B8()
{
  return sub_23A233648();
}

uint64_t sub_23A2231CC(uint64_t a1, ValueMetadata *a2, unint64_t a3)
{
  return sub_23A222678(a1, a2, a3);
}

uint64_t sub_23A2231E0()
{
  return sub_23A233564();
}

uint64_t sub_23A223208()
{
  return sub_23A233588();
}

uint64_t sub_23A223230()
{
  return sub_23A23357C();
}

uint64_t sub_23A223258()
{
  return sub_23A233594();
}

uint64_t sub_23A223280()
{
  return sub_23A2335A0();
}

uint64_t sub_23A2232A8()
{
  return sub_23A2335AC();
}

uint64_t sub_23A2232D0()
{
  return sub_23A2335C4();
}

uint64_t sub_23A2232F8()
{
  return sub_23A2335D0();
}

uint64_t sub_23A223320()
{
  return sub_23A2335DC();
}

uint64_t sub_23A223348()
{
  return sub_23A2335E8();
}

uint64_t sub_23A223370()
{
  return sub_23A233600();
}

uint64_t sub_23A223398()
{
  return sub_23A2335B8();
}

uint64_t sub_23A2233C0()
{
  return sub_23A2335F4();
}

uint64_t sub_23A2233E8()
{
  return sub_23A23360C();
}

uint64_t sub_23A223410()
{
  return sub_23A233618();
}

uint64_t sub_23A223438()
{
  return sub_23A233624();
}

uint64_t sub_23A223460()
{
  return sub_23A233630();
}

uint64_t sub_23A223488()
{
  return sub_23A233570();
}

uint64_t sub_23A2234C4(void *a1, _QWORD *a2, uint64_t a3, void *a4)
{
  uint64_t v6;

  __swift_project_boxed_opaque_existential_1(a2, a2[3]);
  sub_23A233840();
  v6 = sub_23A233150();
  swift_bridgeObjectRelease();
  xpc_dictionary_set_value(a4, (const char *)(v6 + 32), a1);
  return swift_release();
}

uint64_t sub_23A22353C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v5;
  xpc_object_t v6;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11[3];
  __int128 v12;

  v5 = *(void **)(v2 + 8);
  v6 = xpc_null_create();
  v12 = *(_OWORD *)(a2 + 16);
  v10 = v12;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v11);
  (*(void (**)(uint64_t *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(boxed_opaque_existential_1, a1);
  sub_23A2234C4(v6, v11, v8, v5);
  swift_unknownObjectRelease();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
}

uint64_t sub_23A2235D4(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  void *v6;
  xpc_object_t v7;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12[3];
  __int128 v13;

  v6 = *(void **)(v3 + 8);
  v7 = xpc_BOOL_create(a1 & 1);
  v13 = *(_OWORD *)(a3 + 16);
  v11 = v13;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v12);
  (*(void (**)(uint64_t *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(boxed_opaque_existential_1, a2);
  sub_23A2234C4(v7, v12, v9, v6);
  swift_unknownObjectRelease();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
}

uint64_t sub_23A223670(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  void *v6;
  xpc_object_t v7;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12[3];
  __int128 v13;

  v6 = *(void **)(v3 + 8);
  v7 = xpc_int64_create(a1);
  v13 = *(_OWORD *)(a3 + 16);
  v11 = v13;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v12);
  (*(void (**)(uint64_t *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(boxed_opaque_existential_1, a2);
  sub_23A2234C4(v7, v12, v9, v6);
  swift_unknownObjectRelease();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
}

uint64_t sub_23A22370C(__int16 a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  void *v6;
  xpc_object_t v7;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12[3];
  __int128 v13;

  v6 = *(void **)(v3 + 8);
  v7 = xpc_int64_create(a1);
  v13 = *(_OWORD *)(a3 + 16);
  v11 = v13;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v12);
  (*(void (**)(uint64_t *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(boxed_opaque_existential_1, a2);
  sub_23A2234C4(v7, v12, v9, v6);
  swift_unknownObjectRelease();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
}

uint64_t sub_23A2237A8(int a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  void *v6;
  xpc_object_t v7;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12[3];
  __int128 v13;

  v6 = *(void **)(v3 + 8);
  v7 = xpc_int64_create(a1);
  v13 = *(_OWORD *)(a3 + 16);
  v11 = v13;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v12);
  (*(void (**)(uint64_t *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(boxed_opaque_existential_1, a2);
  sub_23A2234C4(v7, v12, v9, v6);
  swift_unknownObjectRelease();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
}

uint64_t sub_23A223844(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v4;
  void *v7;
  void *v8;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13[3];
  __int128 v14;

  v7 = *(void **)(v4 + 8);
  v8 = (void *)a4();
  v14 = *(_OWORD *)(a3 + 16);
  v12 = v14;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v13);
  (*(void (**)(uint64_t *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(boxed_opaque_existential_1, a2);
  sub_23A2234C4(v8, v13, v10, v7);
  swift_unknownObjectRelease();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
}

uint64_t sub_23A2238DC(unsigned __int8 a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  void *v6;
  xpc_object_t v7;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12[3];
  __int128 v13;

  v6 = *(void **)(v3 + 8);
  v7 = xpc_uint64_create(a1);
  v13 = *(_OWORD *)(a3 + 16);
  v11 = v13;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v12);
  (*(void (**)(uint64_t *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(boxed_opaque_existential_1, a2);
  sub_23A2234C4(v7, v12, v9, v6);
  swift_unknownObjectRelease();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
}

uint64_t sub_23A223978(unsigned __int16 a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  void *v6;
  xpc_object_t v7;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12[3];
  __int128 v13;

  v6 = *(void **)(v3 + 8);
  v7 = xpc_uint64_create(a1);
  v13 = *(_OWORD *)(a3 + 16);
  v11 = v13;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v12);
  (*(void (**)(uint64_t *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(boxed_opaque_existential_1, a2);
  sub_23A2234C4(v7, v12, v9, v6);
  swift_unknownObjectRelease();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
}

uint64_t sub_23A223A14(uint64_t value, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  void *v6;
  xpc_object_t v7;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12[3];
  __int128 v13;

  v6 = *(void **)(v3 + 8);
  v7 = xpc_uint64_create(value);
  v13 = *(_OWORD *)(a3 + 16);
  v11 = v13;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v12);
  (*(void (**)(uint64_t *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(boxed_opaque_existential_1, a2);
  sub_23A2234C4(v7, v12, v9, v6);
  swift_unknownObjectRelease();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
}

uint64_t sub_23A223AB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  void *v7;
  uint64_t v8;
  xpc_object_t v9;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14[3];
  __int128 v15;

  v7 = *(void **)(v4 + 8);
  v8 = sub_23A233150();
  v9 = xpc_string_create((const char *)(v8 + 32));
  swift_release();
  v15 = *(_OWORD *)(a4 + 16);
  v13 = v15;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v14);
  (*(void (**)(uint64_t *, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(boxed_opaque_existential_1, a3);
  sub_23A2234C4(v9, v14, v11, v7);
  swift_unknownObjectRelease();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
}

uint64_t sub_23A223B5C(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v3;
  void *v6;
  xpc_object_t v7;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12[3];
  __int128 v13;

  v6 = *(void **)(v3 + 8);
  v7 = xpc_double_create(a3);
  v13 = *(_OWORD *)(a2 + 16);
  v11 = v13;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v12);
  (*(void (**)(uint64_t *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(boxed_opaque_existential_1, a1);
  sub_23A2234C4(v7, v12, v9, v6);
  swift_unknownObjectRelease();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
}

uint64_t sub_23A223BF4(uint64_t a1, uint64_t a2, float a3)
{
  uint64_t v3;
  void *v6;
  xpc_object_t v7;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12[3];
  __int128 v13;

  v6 = *(void **)(v3 + 8);
  v7 = xpc_double_create(a3);
  v13 = *(_OWORD *)(a2 + 16);
  v11 = v13;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v12);
  (*(void (**)(uint64_t *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(boxed_opaque_existential_1, a1);
  sub_23A2234C4(v7, v12, v9, v6);
  swift_unknownObjectRelease();
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
}

uint64_t sub_23A223C90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  void (*v16)(uint64_t *, uint64_t, uint64_t);
  uint64_t v17;
  void (*v18)(uint64_t *, uint64_t, uint64_t);
  uint64_t *v19;
  _QWORD *v20;
  _QWORD *v21;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v23;
  unint64_t v24;
  void (*v25)(uint64_t *, uint64_t, uint64_t);
  void (*v26)(uint64_t *, uint64_t, uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t *v35;
  uint64_t v36;
  _QWORD *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44[3];
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;

  v42 = a4;
  v6 = v5;
  v40 = a1;
  v9 = *(_QWORD *)(a3 + 16);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x24BDAC7A8](a1);
  v13 = (char *)&v39 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v39 - v14;
  v16 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v10 + 16);
  v39 = v17;
  v18 = v16;
  ((void (*)(char *))v16)((char *)&v39 - v14);
  v43 = v6;
  v21 = *(_QWORD **)(v6 + 16);
  v19 = (uint64_t *)(v6 + 16);
  v20 = v21;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *v19 = (uint64_t)v21;
  v47 = a5;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v20 = sub_23A22DD14(0, v20[2] + 1, 1, v20);
    *v19 = (uint64_t)v20;
  }
  v24 = v20[2];
  v23 = v20[3];
  v25 = v18;
  if (v24 >= v23 >> 1)
  {
    v38 = sub_23A22DD14((_QWORD *)(v23 > 1), v24 + 1, 1, v20);
    v25 = v18;
    *v19 = (uint64_t)v38;
  }
  v26 = v25;
  v25((uint64_t *)v13, (uint64_t)v15, v9);
  v27 = *(_QWORD *)(a3 + 24);
  sub_23A22DF58(v24, (uint64_t)v13, v19, v9, v27);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v15, v9);
  v29 = v42;
  v28 = v43;
  v30 = *(void **)(v43 + 8);
  v45 = v42;
  v46 = v47;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v44);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 16))(boxed_opaque_existential_1, v40, v29);
  v32 = v41;
  v33 = sub_23A224A4C(v44);
  if (!v32)
  {
    v34 = v33;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v44);
    v45 = v9;
    v46 = v27;
    v35 = __swift_allocate_boxed_opaque_existential_1(v44);
    v26(v35, v39, v9);
    sub_23A2234C4(v34, v44, v36, v30);
    swift_unknownObjectRelease();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v44);
  return sub_23A222C90(v28);
}

uint64_t sub_23A223E9C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t *v6;
  uint64_t *v7;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  xpc_object_t v17;
  void *v18;
  uint64_t v19;
  uint64_t *boxed_opaque_existential_1;
  void (*v21)(uint64_t *, uint64_t, uint64_t);
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40[5];

  v7 = v6;
  v38 = a4;
  v39 = a5;
  v37 = a6;
  v10 = *(_QWORD *)(a3 + 16);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x24BDAC7A8](a1);
  v14 = (char *)&v35 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v35 - v15;
  v17 = xpc_dictionary_create(0, 0, 0);
  v18 = (void *)v7[1];
  v19 = *(_QWORD *)(a3 + 24);
  v40[3] = v10;
  v40[4] = v19;
  v36 = v19;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v40);
  v21 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v11 + 16);
  v21(boxed_opaque_existential_1, a2, v10);
  sub_23A2234C4(v17, v40, v22, v18);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v40);
  v21((uint64_t *)v16, a2, v10);
  v24 = v7 + 2;
  v23 = (_QWORD *)v7[2];
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v7[2] = (uint64_t)v23;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v23 = sub_23A22DD14(0, v23[2] + 1, 1, v23);
    *v24 = v23;
  }
  v27 = v23[2];
  v26 = v23[3];
  if (v27 >= v26 >> 1)
    *v24 = sub_23A22DD14((_QWORD *)(v26 > 1), v27 + 1, 1, v23);
  v21((uint64_t *)v14, (uint64_t)v16, v10);
  sub_23A22DF58(v27, (uint64_t)v14, v7 + 2, v10, v36);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v16, v10);
  v28 = v7[2];
  v29 = *v7;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain();
  v40[0] = sub_23A221FE4(v29, v28, (uint64_t)v17);
  v40[1] = v30;
  v40[2] = v31;
  v33 = type metadata accessor for _XPCKeyedEncodingContainer(0, v38, v39, v32);
  MEMORY[0x23B8459BC](&unk_23A235850, v33);
  sub_23A2334C8();
  sub_23A222C90((uint64_t)v7);
  return swift_unknownObjectRelease();
}

uint64_t sub_23A2240DC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t *v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  xpc_object_t v14;
  void *v15;
  uint64_t v16;
  uint64_t *boxed_opaque_existential_1;
  void (*v18)(uint64_t *, uint64_t, uint64_t);
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t result;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33[5];

  v7 = *(_QWORD *)(a2 + 16);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](a1);
  v11 = (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v30 - v12;
  v14 = xpc_array_create(0, 0);
  v15 = (void *)v3[1];
  v16 = *(_QWORD *)(a2 + 24);
  v33[3] = v7;
  v33[4] = v16;
  v32 = v16;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v33);
  v31 = v8;
  v18 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v8 + 16);
  v18(boxed_opaque_existential_1, a1, v7);
  sub_23A2234C4(v14, v33, v19, v15);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v33);
  v18((uint64_t *)v13, a1, v7);
  v20 = v3 + 2;
  v21 = (_QWORD *)v3[2];
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v3[2] = (uint64_t)v21;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v21 = sub_23A22DD14(0, v21[2] + 1, 1, v21);
    *v20 = v21;
  }
  v24 = v21[2];
  v23 = v21[3];
  if (v24 >= v23 >> 1)
    *v20 = sub_23A22DD14((_QWORD *)(v23 > 1), v24 + 1, 1, v21);
  v18((uint64_t *)v11, (uint64_t)v13, v7);
  sub_23A22DF58(v24, (uint64_t)v11, v3 + 2, v7, v32);
  (*(void (**)(char *, uint64_t))(v31 + 8))(v13, v7);
  v25 = v3[2];
  v26 = *v3;
  swift_retain();
  swift_bridgeObjectRetain();
  v27 = swift_unknownObjectRetain();
  v28 = MEMORY[0x23B845B54](v27);
  if (v28 == sub_23A23303C())
  {
    a3[3] = &type metadata for _XPCUnkeyedEncodingContainer;
    a3[4] = sub_23A224CB4();
    *a3 = v26;
    a3[1] = v14;
    a3[2] = v25;
    sub_23A222C90((uint64_t)v3);
    return swift_unknownObjectRelease();
  }
  else
  {
    result = sub_23A2333CC();
    __break(1u);
  }
  return result;
}

uint64_t sub_23A22433C@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  unint64_t v8;

  v2 = type metadata accessor for _XPCSuperKeyedEncoder();
  v3 = (_QWORD *)swift_allocObject();
  swift_retain();
  v4 = swift_unknownObjectRetain();
  v5 = MEMORY[0x23B845B54](v4);
  result = sub_23A233078();
  if (v5 == result)
  {
    v7 = MEMORY[0x24BEE4AF8];
    v3[2] = MEMORY[0x24BEE4AF8];
    v8 = sub_23A221CF4(v7);
    swift_release();
    swift_unknownObjectRelease();
    v3[3] = v8;
    v3[4] = 0;
    a1[3] = v2;
    result = sub_23A224F98((unint64_t *)&unk_256953380, type metadata accessor for _XPCSuperKeyedEncoder, (uint64_t)&unk_23A235790);
    a1[4] = result;
    *a1 = v3;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_23A2243FC@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  unint64_t v8;

  v2 = type metadata accessor for _XPCSuperKeyedEncoder();
  v3 = (_QWORD *)swift_allocObject();
  swift_retain();
  v4 = swift_unknownObjectRetain();
  v5 = MEMORY[0x23B845B54](v4);
  result = sub_23A233078();
  if (v5 == result)
  {
    v7 = MEMORY[0x24BEE4AF8];
    v3[2] = MEMORY[0x24BEE4AF8];
    v8 = sub_23A221CF4(v7);
    swift_unknownObjectRelease();
    v3[3] = v8;
    v3[4] = 0;
    swift_release();
    a1[3] = v2;
    result = sub_23A224F98((unint64_t *)&unk_256953380, type metadata accessor for _XPCSuperKeyedEncoder, (uint64_t)&unk_23A235790);
    a1[4] = result;
    *a1 = v3;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_23A2244BC()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_23A2244C4(uint64_t a1, uint64_t a2)
{
  return sub_23A22353C(a1, a2);
}

uint64_t sub_23A2244D8(char a1, uint64_t a2, uint64_t a3)
{
  return sub_23A2235D4(a1, a2, a3);
}

uint64_t sub_23A2244EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_23A223AB0(a1, a2, a3, a4);
}

uint64_t sub_23A224500(uint64_t a1, uint64_t a2, double a3)
{
  return sub_23A223B5C(a1, a2, a3);
}

uint64_t sub_23A224514(uint64_t a1, uint64_t a2, float a3)
{
  return sub_23A223BF4(a1, a2, a3);
}

uint64_t sub_23A224528(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23A223844(a1, a2, a3, (uint64_t (*)(void))MEMORY[0x24BDB0A80]);
}

uint64_t sub_23A224544(char a1, uint64_t a2, uint64_t a3)
{
  return sub_23A223670(a1, a2, a3);
}

uint64_t sub_23A224558(__int16 a1, uint64_t a2, uint64_t a3)
{
  return sub_23A22370C(a1, a2, a3);
}

uint64_t sub_23A22456C(int a1, uint64_t a2, uint64_t a3)
{
  return sub_23A2237A8(a1, a2, a3);
}

uint64_t sub_23A224580()
{
  return sub_23A233798();
}

uint64_t sub_23A224594(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23A223844(a1, a2, a3, (uint64_t (*)(void))MEMORY[0x24BDB0BD8]);
}

uint64_t sub_23A2245B0(unsigned __int8 a1, uint64_t a2, uint64_t a3)
{
  return sub_23A2238DC(a1, a2, a3);
}

uint64_t sub_23A2245C4(unsigned __int16 a1, uint64_t a2, uint64_t a3)
{
  return sub_23A223978(a1, a2, a3);
}

uint64_t sub_23A2245D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23A223A14(a1, a2, a3);
}

uint64_t sub_23A2245EC()
{
  return sub_23A2337A4();
}

uint64_t sub_23A224600(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_23A223C90(a1, a2, a5, a3, a4);
}

uint64_t sub_23A224624()
{
  return sub_23A23378C();
}

uint64_t sub_23A22464C()
{
  return sub_23A233720();
}

uint64_t sub_23A224660()
{
  return sub_23A233714();
}

uint64_t sub_23A224674()
{
  return sub_23A23372C();
}

uint64_t sub_23A22468C(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_23A2247F0(a1, a2, a3, a4, MEMORY[0x24BEE3C98]);
}

uint64_t sub_23A2246A8()
{
  return sub_23A233738();
}

uint64_t sub_23A2246C0(__int16 a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_23A224778(a1, a2, a3, a4, MEMORY[0x24BEE3CB8]);
}

uint64_t sub_23A2246DC(int a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_23A2247B4(a1, a2, a3, a4, MEMORY[0x24BEE3CC0]);
}

uint64_t sub_23A2246F8(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_23A2247F0(a1, a2, a3, a4, MEMORY[0x24BEE3CC8]);
}

uint64_t sub_23A224714()
{
  return sub_23A23375C();
}

uint64_t sub_23A22472C()
{
  return sub_23A233768();
}

uint64_t sub_23A224744()
{
  return sub_23A233744();
}

uint64_t sub_23A22475C(__int16 a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_23A224778(a1, a2, a3, a4, MEMORY[0x24BEE3CD8]);
}

uint64_t sub_23A224778(__int16 a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD))
{
  return a5(a1 & 0x1FF);
}

uint64_t sub_23A224798(int a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_23A2247B4(a1, a2, a3, a4, MEMORY[0x24BEE3CE8]);
}

uint64_t sub_23A2247B4(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD))
{
  return a5(a1 & 0x1FFFF);
}

uint64_t sub_23A2247D4(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_23A2247F0(a1, a2, a3, a4, MEMORY[0x24BEE3CF0]);
}

uint64_t sub_23A2247F0(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t))
{
  return a5(a1 | ((HIDWORD(a1) & 1) << 32));
}

uint64_t sub_23A224818()
{
  return sub_23A233774();
}

uint64_t sub_23A224830()
{
  return sub_23A233780();
}

uint64_t sub_23A224848()
{
  return sub_23A233750();
}

uint64_t sub_23A224870@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  return sub_23A223E9C(a1, a2, a5, a3, a4, a6);
}

uint64_t type metadata accessor for _XPCSuperKeyedEncoder()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for _XPCSuperUnkeyedEncoder()
{
  return objc_opt_self();
}

unint64_t sub_23A2248D4(uint64_t a1)
{
  uint64_t v2;

  sub_23A2333B4();
  v2 = sub_23A2330F0();
  return sub_23A224924(a1, v2);
}

unint64_t sub_23A224924(uint64_t a1, uint64_t a2)
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
  v5 = sub_23A2333B4();
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
      v14 = sub_23A233114();
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      if ((v14 & 1) != 0)
        break;
      v10 = (v10 + 1) & v11;
    }
    while (((*(_QWORD *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
  }
  return v10;
}

void *sub_23A224A4C(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  char v11;
  char v12;
  char v13;
  char v14;
  char v15;
  char v16;
  char v17;
  char v18;
  uint64_t uuid;
  char v21;
  char v22;
  char v23;
  char v24;
  char v25;
  char v26;
  char v27;
  char v28;
  _QWORD v29[6];

  v29[5] = *MEMORY[0x24BDAC8D0];
  v3 = sub_23A232FE8();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&uuid - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  if (swift_getDynamicType() == v3)
  {
    sub_23A203CD4((uint64_t)a1, (uint64_t)v29);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2569532D0);
    swift_dynamicCast();
    uuid = sub_23A232FDC();
    v21 = v11;
    v22 = v12;
    v23 = v13;
    v24 = v14;
    v25 = v15;
    v26 = v16;
    v27 = v17;
    v28 = v18;
    v10 = xpc_uuid_create((const unsigned __int8 *)&uuid);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
  else
  {
    v7 = type metadata accessor for _XPCEncoder();
    v8 = (_QWORD *)swift_allocObject();
    v9 = MEMORY[0x24BEE4AF8];
    v8[2] = MEMORY[0x24BEE4AF8];
    v8[3] = sub_23A221CF4(v9);
    v8[4] = 0;
    v10 = __swift_project_boxed_opaque_existential_1(a1, a1[3]);
    v29[3] = v7;
    v29[4] = sub_23A224F98((unint64_t *)&unk_256952DE0, type metadata accessor for _XPCEncoder, (uint64_t)&unk_23A235790);
    v29[0] = v8;
    swift_retain();
    sub_23A2330E4();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v29);
    if (!v1)
    {
      v10 = (void *)v8[4];
      if (v10)
        swift_unknownObjectRetain();
      else
        v10 = xpc_null_create();
    }
    swift_release();
  }
  return v10;
}

unint64_t sub_23A224CB4()
{
  unint64_t result;

  result = qword_2569532D8;
  if (!qword_2569532D8)
  {
    result = MEMORY[0x23B8459BC](&unk_23A2359C8, &type metadata for _XPCUnkeyedEncodingContainer);
    atomic_store(result, (unint64_t *)&qword_2569532D8);
  }
  return result;
}

uint64_t type metadata accessor for _XPCKeyedEncodingContainer(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for _XPCKeyedEncodingContainer);
}

uint64_t sub_23A224D04(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569532E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23A224D4C()
{
  return swift_allocateGenericValueMetadata();
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t _s18XPCCoderDependency28_XPCUnkeyedEncodingContainerVwxx_0()
{
  swift_release();
  swift_unknownObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *_s18XPCCoderDependency28_XPCUnkeyedEncodingContainerVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_retain();
  swift_unknownObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *_s18XPCCoderDependency28_XPCUnkeyedEncodingContainerVwca_0(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s18XPCCoderDependency28_XPCUnkeyedEncodingContainerVwta_0(uint64_t a1, uint64_t a2)
{
  swift_release();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_unknownObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s18XPCCoderDependency28_XPCUnkeyedEncodingContainerVwet_0(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 24))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t sub_23A224F04(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 24) = 1;
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
    *(_BYTE *)(result + 24) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for _XPCUnkeyedEncodingContainer()
{
  return &type metadata for _XPCUnkeyedEncodingContainer;
}

uint64_t sub_23A224F54(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a2 + 24);
}

uint64_t sub_23A224F5C()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_23A224F80(__int128 *a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;

  v2 = *a1;
  v3 = a1[1];
  *(_QWORD *)(a2 + 32) = *((_QWORD *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_23A224F98(unint64_t *a1, uint64_t (*a2)(void), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2();
    result = MEMORY[0x23B8459BC](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x23B84595C](a1, v6, a5);
}

uint64_t sub_23A225008()
{
  return swift_allocObject();
}

uint64_t sub_23A225018()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_23A225020@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _QWORD *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v23 = a4;
  v7 = sub_23A23327C();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v22 - v9;
  type metadata accessor for _XPCDecoder();
  v11 = (_QWORD *)swift_allocObject();
  swift_unknownObjectRetain();
  v12 = MEMORY[0x24BEE4AF8];
  v13 = sub_23A221CF4(MEMORY[0x24BEE4AF8]);
  v11[3] = a2;
  v11[4] = v13;
  v14 = a1;
  v11[2] = v12;
  v15 = v24;
  sub_23A2258AC(a3, (uint64_t)v10);
  if (v15)
    return swift_release();
  v16 = v23;
  v17 = *(_QWORD *)(a3 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v10, 1, a3) == 1)
  {
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    v18 = sub_23A23333C();
    swift_allocError();
    v20 = v19;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256953390);
    *v20 = v14;
    sub_23A233330();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v18 - 8) + 104))(v20, *MEMORY[0x24BEE26E0], v18);
    swift_willThrow();
    return swift_release();
  }
  swift_release();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v17 + 32))(v16, v10, a3);
}

uint64_t type metadata accessor for _XPCDecoder()
{
  return objc_opt_self();
}

uint64_t sub_23A225218()
{
  return swift_deallocClassInstance();
}

uint64_t sub_23A225228(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v16;
  uint64_t v17;

  v6 = *(_QWORD *)(v3 + 24);
  v7 = MEMORY[0x23B845B54](v6);
  if (v7 == sub_23A233024())
  {
    v12 = sub_23A23333C();
    swift_allocError();
    v14 = v13;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256953390);
    *v14 = sub_23A233468();
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_23A233330();
    (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v12 - 8) + 104))(v14, *MEMORY[0x24BEE26E0], v12);
    return swift_willThrow();
  }
  v8 = MEMORY[0x23B845B54](v6);
  if (v8 != sub_23A233078())
  {
    swift_beginAccess();
    v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569535E0);
    sub_23A23333C();
    swift_allocError();
    v11 = v10;
    swift_bridgeObjectRetain();
    sub_23A225434(v9, v6, v11);
    swift_bridgeObjectRelease();
    return swift_willThrow();
  }
  swift_retain();
  swift_unknownObjectRetain();
  sub_23A22558C(v3, v6);
  v17 = type metadata accessor for _XPCKeyedDecodingContainer(0, a2, a3, v16);
  MEMORY[0x23B8459BC](&unk_23A235D00, v17);
  return sub_23A233474();
}

uint64_t sub_23A225434@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, _QWORD *a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;

  sub_23A233300();
  swift_bridgeObjectRelease();
  sub_23A233870();
  sub_23A233174();
  swift_bridgeObjectRelease();
  sub_23A233174();
  sub_23A22DFD0(a2);
  sub_23A233174();
  swift_bridgeObjectRelease();
  sub_23A233174();
  __swift_instantiateConcreteTypeFromMangledName(&qword_256953390);
  *a3 = a1;
  swift_bridgeObjectRetain();
  sub_23A233330();
  v6 = *MEMORY[0x24BEE26D0];
  v7 = sub_23A23333C();
  return (*(uint64_t (**)(_QWORD *, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 104))(a3, v6, v7);
}

uint64_t sub_23A22558C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t result;

  v3 = MEMORY[0x23B845B54](a2);
  if (v3 == sub_23A233078())
  {
    swift_beginAccess();
    swift_bridgeObjectRetain();
    return a1;
  }
  else
  {
    result = sub_23A2333CC();
    __break(1u);
  }
  return result;
}

uint64_t sub_23A22564C@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t *v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;

  v3 = *(_QWORD *)(v1 + 24);
  v4 = MEMORY[0x23B845B54](v3);
  if (v4 == sub_23A233024())
  {
    v9 = sub_23A23333C();
    swift_allocError();
    v11 = v10;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256953390);
    *v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569535D8);
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_23A233330();
    (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v9 - 8) + 104))(v11, *MEMORY[0x24BEE26E0], v9);
    return swift_willThrow();
  }
  v5 = MEMORY[0x23B845B54](v3);
  if (v5 != sub_23A23303C())
  {
    swift_beginAccess();
    v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569535C8);
    sub_23A23333C();
    swift_allocError();
    v8 = v7;
    swift_bridgeObjectRetain();
    sub_23A225434(v6, v3, v8);
    swift_bridgeObjectRelease();
    return swift_willThrow();
  }
  swift_retain();
  v13 = swift_unknownObjectRetain();
  v14 = MEMORY[0x23B845B54](v13);
  if (v14 == sub_23A23303C())
  {
    swift_beginAccess();
    v15 = *(_QWORD *)(v1 + 16);
    a1[3] = &type metadata for _XPCUnkeyedDecodingContainer;
    a1[4] = sub_23A22F6D0();
    v16 = (_QWORD *)swift_allocObject();
    *a1 = v16;
    v16[2] = v1;
    v16[3] = v3;
    v16[4] = v15;
    v16[5] = 0;
    return swift_bridgeObjectRetain();
  }
  else
  {
    result = sub_23A2333CC();
    __break(1u);
  }
  return result;
}

uint64_t sub_23A2258AC@<X0>(uint64_t a1@<X2>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t result;

  type metadata accessor for _XPCDecoder();
  sub_23A22F754(qword_2569535E8, (uint64_t)&unk_23A235C40);
  swift_retain();
  result = sub_23A23321C();
  if (!v2)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 56))(a2, 0, 1, a1);
  return result;
}

uint64_t type metadata accessor for SimpleXPCDecoder()
{
  return objc_opt_self();
}

uint64_t sub_23A225980@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v5;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  _QWORD *v22;
  unint64_t v23;
  uint64_t result;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t, uint64_t, uint64_t);
  void (*v27)(char *, char *, uint64_t);
  int v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD v31[6];

  v31[0] = a4;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569535C0);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_23A232FE8();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)v31 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = MEMORY[0x24BDAC7A8](v15);
  v20 = (char *)v31 - v19;
  if (v18 != a2)
  {
    swift_beginAccess();
    v21 = *(_QWORD *)(v5 + 16);
    type metadata accessor for _XPCDecoder();
    v22 = (_QWORD *)swift_allocObject();
    swift_unknownObjectRetain();
    swift_bridgeObjectRetain();
    v23 = sub_23A221CF4(MEMORY[0x24BEE4AF8]);
    v22[3] = a1;
    v22[4] = v23;
    v22[2] = v21;
    sub_23A2258AC(a3, a5);
    return swift_release();
  }
  v25 = v31[5];
  result = sub_23A225B98(a1, (uint64_t)v12);
  if (!v25)
  {
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, a2) == 1)
    {
      sub_23A22F690((uint64_t)v12);
      v26 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 56);
    }
    else
    {
      v27 = *(void (**)(char *, char *, uint64_t))(v14 + 32);
      v27(v20, v12, a2);
      v27(v17, v20, a2);
      v28 = swift_dynamicCast();
      v26 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 56);
      if (v28)
      {
        v29 = a5;
        v30 = 0;
        return v26(v29, v30, 1, a3);
      }
    }
    v29 = a5;
    v30 = 1;
    return v26(v29, v30, 1, a3);
  }
  return result;
}

uint64_t sub_23A225B98@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v10;
  const uint8_t *bytes;
  id v12;
  uint64_t v13;

  v4 = MEMORY[0x23B845B54]();
  if (v4 == sub_23A233024())
    goto LABEL_4;
  v5 = MEMORY[0x23B845B54](a1);
  if (v5 != sub_23A233030())
  {
    swift_beginAccess();
    v6 = sub_23A232FE8();
    sub_23A23333C();
    swift_allocError();
    v8 = v7;
    swift_bridgeObjectRetain();
    sub_23A225434(v6, (uint64_t)a1, v8);
    swift_bridgeObjectRelease();
    return swift_willThrow();
  }
  bytes = xpc_uuid_get_bytes(a1);
  if (!bytes)
  {
LABEL_4:
    v10 = sub_23A232FE8();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(a2, 1, 1, v10);
  }
  else
  {
    v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1880]), sel_initWithUUIDBytes_, bytes);
    sub_23A232FD0();

    v13 = sub_23A232FE8();
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(a2, 0, 1, v13);
  }
}

uint64_t sub_23A225CFC()
{
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_23A225D34()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_23A225D40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23A225228(a1, a2, a3);
}

uint64_t sub_23A225D60@<X0>(_QWORD *a1@<X8>)
{
  return sub_23A22564C(a1);
}

uint64_t sub_23A225D80@<X0>(_QWORD *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  a1[3] = type metadata accessor for _XPCDecoder();
  a1[4] = sub_23A22F754(&qword_2569535B8, (uint64_t)&unk_23A235B88);
  *a1 = v3;
  return swift_retain();
}

uint64_t sub_23A225DDC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;

  v1 = MEMORY[0x23B845B54](*(_QWORD *)(v0 + 24));
  result = sub_23A233024();
  if (v1 == result)
  {
    v3 = sub_23A23333C();
    swift_allocError();
    v5 = v4;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256953390);
    *v5 = MEMORY[0x24BEE1328];
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_23A233300();
    swift_bridgeObjectRelease();
    sub_23A233330();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v3 - 8) + 104))(v5, *MEMORY[0x24BEE26E0], v3);
    return swift_willThrow();
  }
  return result;
}

uint64_t sub_23A225F00()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;

  v1 = MEMORY[0x23B845B54](*(_QWORD *)(v0 + 24));
  result = sub_23A233024();
  if (v1 == result)
  {
    v3 = sub_23A23333C();
    swift_allocError();
    v5 = v4;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256953390);
    *v5 = MEMORY[0x24BEE1768];
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_23A233300();
    swift_bridgeObjectRelease();
    sub_23A233330();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v3 - 8) + 104))(v5, *MEMORY[0x24BEE26E0], v3);
    return swift_willThrow();
  }
  return result;
}

uint64_t sub_23A226024()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;

  v1 = MEMORY[0x23B845B54](*(_QWORD *)(v0 + 24));
  result = sub_23A233024();
  if (v1 == result)
  {
    v3 = sub_23A23333C();
    swift_allocError();
    v5 = v4;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256953390);
    *v5 = MEMORY[0x24BEE3E50];
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_23A233300();
    swift_bridgeObjectRelease();
    sub_23A233330();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v3 - 8) + 104))(v5, *MEMORY[0x24BEE26E0], v3);
    return swift_willThrow();
  }
  return result;
}

uint64_t sub_23A226148()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;

  v1 = MEMORY[0x23B845B54](*(_QWORD *)(v0 + 24));
  result = sub_23A233024();
  if (v1 == result)
  {
    v3 = sub_23A23333C();
    swift_allocError();
    v5 = v4;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256953390);
    *v5 = MEMORY[0x24BEE3F30];
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_23A233300();
    swift_bridgeObjectRelease();
    sub_23A233330();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v3 - 8) + 104))(v5, *MEMORY[0x24BEE26E0], v3);
    return swift_willThrow();
  }
  return result;
}

uint64_t sub_23A22626C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;

  v1 = MEMORY[0x23B845B54](*(_QWORD *)(v0 + 24));
  result = sub_23A233024();
  if (v1 == result)
  {
    v3 = sub_23A23333C();
    swift_allocError();
    v5 = v4;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256953390);
    *v5 = MEMORY[0x24BEE3F88];
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_23A233300();
    swift_bridgeObjectRelease();
    sub_23A233330();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v3 - 8) + 104))(v5, *MEMORY[0x24BEE26E0], v3);
    return swift_willThrow();
  }
  return result;
}

uint64_t sub_23A226390()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;

  v1 = MEMORY[0x23B845B54](*(_QWORD *)(v0 + 24));
  result = sub_23A233024();
  if (v1 == result)
  {
    v3 = sub_23A23333C();
    swift_allocError();
    v5 = v4;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256953390);
    *v5 = MEMORY[0x24BEE4008];
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_23A233300();
    swift_bridgeObjectRelease();
    sub_23A233330();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v3 - 8) + 104))(v5, *MEMORY[0x24BEE26E0], v3);
    return swift_willThrow();
  }
  return result;
}

uint64_t sub_23A2264B4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;

  v1 = MEMORY[0x23B845B54](*(_QWORD *)(v0 + 24));
  result = sub_23A233024();
  if (v1 == result)
  {
    v3 = sub_23A23333C();
    swift_allocError();
    v5 = v4;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256953390);
    *v5 = MEMORY[0x24BEE1E88];
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_23A233300();
    swift_bridgeObjectRelease();
    sub_23A233330();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v3 - 8) + 104))(v5, *MEMORY[0x24BEE26E0], v3);
    return swift_willThrow();
  }
  return result;
}

uint64_t sub_23A2265D8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;

  v1 = MEMORY[0x23B845B54](*(_QWORD *)(v0 + 24));
  result = sub_23A233024();
  if (v1 == result)
  {
    v3 = sub_23A23333C();
    swift_allocError();
    v5 = v4;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256953390);
    *v5 = MEMORY[0x24BEE4260];
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_23A233300();
    swift_bridgeObjectRelease();
    sub_23A233330();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v3 - 8) + 104))(v5, *MEMORY[0x24BEE26E0], v3);
    return swift_willThrow();
  }
  return result;
}

uint64_t sub_23A2266FC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;

  v1 = MEMORY[0x23B845B54](*(_QWORD *)(v0 + 24));
  result = sub_23A233024();
  if (v1 == result)
  {
    v3 = sub_23A23333C();
    swift_allocError();
    v5 = v4;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256953390);
    *v5 = MEMORY[0x24BEE4478];
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_23A233300();
    swift_bridgeObjectRelease();
    sub_23A233330();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v3 - 8) + 104))(v5, *MEMORY[0x24BEE26E0], v3);
    return swift_willThrow();
  }
  return result;
}

uint64_t sub_23A226820()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;

  v1 = MEMORY[0x23B845B54](*(_QWORD *)(v0 + 24));
  result = sub_23A233024();
  if (v1 == result)
  {
    v3 = sub_23A23333C();
    swift_allocError();
    v5 = v4;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256953390);
    *v5 = MEMORY[0x24BEE44F0];
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_23A233300();
    swift_bridgeObjectRelease();
    sub_23A233330();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v3 - 8) + 104))(v5, *MEMORY[0x24BEE26E0], v3);
    return swift_willThrow();
  }
  return result;
}

uint64_t sub_23A226944()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;

  v1 = MEMORY[0x23B845B54](*(_QWORD *)(v0 + 24));
  result = sub_23A233024();
  if (v1 == result)
  {
    v3 = sub_23A23333C();
    swift_allocError();
    v5 = v4;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256953390);
    *v5 = MEMORY[0x24BEE4568];
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_23A233300();
    swift_bridgeObjectRelease();
    sub_23A233330();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v3 - 8) + 104))(v5, *MEMORY[0x24BEE26E0], v3);
    return swift_willThrow();
  }
  return result;
}

uint64_t sub_23A226A68()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;

  v1 = MEMORY[0x23B845B54](*(_QWORD *)(v0 + 24));
  result = sub_23A233024();
  if (v1 == result)
  {
    v3 = sub_23A23333C();
    swift_allocError();
    v5 = v4;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256953390);
    *v5 = MEMORY[0x24BEE14E8];
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_23A233300();
    swift_bridgeObjectRelease();
    sub_23A233330();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v3 - 8) + 104))(v5, *MEMORY[0x24BEE26E0], v3);
    return swift_willThrow();
  }
  return result;
}

uint64_t sub_23A226B8C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;

  v1 = MEMORY[0x23B845B54](*(_QWORD *)(v0 + 24));
  result = sub_23A233024();
  if (v1 == result)
  {
    v3 = sub_23A23333C();
    swift_allocError();
    v5 = v4;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256953390);
    *v5 = MEMORY[0x24BEE13C8];
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_23A233300();
    swift_bridgeObjectRelease();
    sub_23A233330();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v3 - 8) + 104))(v5, *MEMORY[0x24BEE26E0], v3);
    return swift_willThrow();
  }
  return result;
}

uint64_t sub_23A226CB0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;

  v1 = MEMORY[0x23B845B54](*(_QWORD *)(v0 + 24));
  result = sub_23A233024();
  if (v1 == result)
  {
    v3 = sub_23A23333C();
    swift_allocError();
    v5 = v4;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256953390);
    *v5 = MEMORY[0x24BEE0D00];
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_23A233300();
    swift_bridgeObjectRelease();
    sub_23A233330();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v3 - 8) + 104))(v5, *MEMORY[0x24BEE26E0], v3);
    return swift_willThrow();
  }
  return result;
}

uint64_t sub_23A226DD4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;

  v3 = MEMORY[0x23B845B54](*(_QWORD *)(v1 + 24));
  result = sub_23A233024();
  if (v3 == result)
  {
    v5 = sub_23A23333C();
    swift_allocError();
    v7 = v6;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256953390);
    *v7 = a1;
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_23A233300();
    swift_bridgeObjectRelease();
    sub_23A233870();
    sub_23A233174();
    swift_bridgeObjectRelease();
    sub_23A233174();
    sub_23A233330();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v5 - 8) + 104))(v7, *MEMORY[0x24BEE26E0], v5);
    return swift_willThrow();
  }
  return result;
}

uint64_t sub_23A226F44()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;

  result = sub_23A226CB0();
  if (!v1)
  {
    v3 = *(void **)(v0 + 24);
    v4 = MEMORY[0x23B845B54](v3);
    result = sub_23A233024();
    if (v4 == result)
    {
      __break(1u);
    }
    else
    {
      v5 = MEMORY[0x23B845B54](v3);
      if (v5 != sub_23A233060())
      {
        swift_beginAccess();
        sub_23A23333C();
        swift_allocError();
        v7 = v6;
        swift_bridgeObjectRetain();
        sub_23A225434(MEMORY[0x24BEE0D00], (uint64_t)v3, v7);
        swift_bridgeObjectRelease();
        return swift_willThrow();
      }
      result = (uint64_t)xpc_string_get_string_ptr(v3);
      if (result)
        return sub_23A233180();
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_23A227034@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t result;
  uint64_t v14;
  uint64_t v15;

  v10 = sub_23A23327C();
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v15 - v11;
  result = sub_23A226DD4(a1);
  if (!v5)
  {
    sub_23A225980(*(void **)(v4 + 24), a1, a2, a3, (uint64_t)v12);
    v14 = *(_QWORD *)(a2 - 8);
    result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, a2);
    if ((_DWORD)result == 1)
      __break(1u);
    else
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v14 + 32))(a4, v12, a2);
  }
  return result;
}

uint64_t sub_23A227120()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

BOOL sub_23A227160()
{
  uint64_t v0;
  uint64_t v1;

  v1 = MEMORY[0x23B845B54](*(_QWORD *)(*(_QWORD *)v0 + 24));
  return v1 == sub_23A233024();
}

uint64_t sub_23A227194()
{
  return sub_23A22F3DC() & 1;
}

uint64_t sub_23A2271B8()
{
  return sub_23A226F44();
}

void sub_23A2271D8()
{
  sub_23A22F5AC();
}

void sub_23A2271F8()
{
  sub_23A22F4C4();
}

uint64_t sub_23A227218()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t result;
  char v4;

  v2 = *v0;
  result = sub_23A225F00();
  if (!v1)
  {
    result = sub_23A22E840(*(void **)(v2 + 24), 7630409, 0xE300000000000000, MEMORY[0x24BEE1768]);
    if ((v4 & 1) != 0)
      __break(1u);
  }
  return result;
}

uint64_t sub_23A227264(uint64_t a1, uint64_t a2)
{
  return sub_23A2273A4(a1, a2, sub_23A226024, (uint64_t (*)(_QWORD))sub_23A22E158);
}

uint64_t sub_23A227288(uint64_t a1, uint64_t a2)
{
  return sub_23A227404(a1, a2, sub_23A226148, (uint64_t (*)(_QWORD))sub_23A22E3A0);
}

uint64_t sub_23A2272AC(uint64_t a1, uint64_t a2)
{
  return sub_23A227464(a1, a2, sub_23A22626C, (uint64_t (*)(_QWORD))sub_23A22E5EC);
}

uint64_t sub_23A2272D0()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t result;
  char v4;

  v2 = *v0;
  result = sub_23A226390();
  if (!v1)
  {
    result = sub_23A22E840(*(void **)(v2 + 24), 0x3436746E49, 0xE500000000000000, MEMORY[0x24BEE4008]);
    if ((v4 & 1) != 0)
      __break(1u);
  }
  return result;
}

uint64_t sub_23A227320()
{
  return sub_23A23366C();
}

uint64_t sub_23A227334()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t result;
  char v4;

  v2 = *v0;
  result = sub_23A2264B4();
  if (!v1)
  {
    result = sub_23A22EA98(*(void **)(v2 + 24), 1953384789, 0xE400000000000000, MEMORY[0x24BEE1E88]);
    if ((v4 & 1) != 0)
      __break(1u);
  }
  return result;
}

uint64_t sub_23A227380(uint64_t a1, uint64_t a2)
{
  return sub_23A2273A4(a1, a2, sub_23A2265D8, (uint64_t (*)(_QWORD))sub_23A22ECF0);
}

uint64_t sub_23A2273A4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void), uint64_t (*a4)(_QWORD))
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t result;

  v7 = *v4;
  result = a3();
  if (!v5)
  {
    result = a4(*(_QWORD *)(v7 + 24));
    if ((result & 0x100) != 0)
      __break(1u);
  }
  return result;
}

uint64_t sub_23A2273E0(uint64_t a1, uint64_t a2)
{
  return sub_23A227404(a1, a2, sub_23A2266FC, (uint64_t (*)(_QWORD))sub_23A22EF3C);
}

uint64_t sub_23A227404(uint64_t a1, uint64_t a2, uint64_t (*a3)(void), uint64_t (*a4)(_QWORD))
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t result;

  v7 = *v4;
  result = a3();
  if (!v5)
  {
    result = a4(*(_QWORD *)(v7 + 24));
    if ((result & 0x10000) != 0)
      __break(1u);
  }
  return result;
}

uint64_t sub_23A227440(uint64_t a1, uint64_t a2)
{
  return sub_23A227464(a1, a2, sub_23A226820, (uint64_t (*)(_QWORD))sub_23A22F188);
}

uint64_t sub_23A227464(uint64_t a1, uint64_t a2, uint64_t (*a3)(void), uint64_t (*a4)(_QWORD))
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t result;

  v7 = *v4;
  result = a3();
  if (!v5)
  {
    result = a4(*(_QWORD *)(v7 + 24));
    if ((result & 0x100000000) != 0)
      __break(1u);
  }
  return result;
}

uint64_t sub_23A2274A0()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t result;
  char v4;

  v2 = *v0;
  result = sub_23A226944();
  if (!v1)
  {
    result = sub_23A22EA98(*(void **)(v2 + 24), 0x3436746E4955, 0xE600000000000000, MEMORY[0x24BEE4568]);
    if ((v4 & 1) != 0)
      __break(1u);
  }
  return result;
}

uint64_t sub_23A2274F0()
{
  return sub_23A233678();
}

uint64_t sub_23A227504@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  return sub_23A227034(a1, a2, a3, a4);
}

uint64_t sub_23A227524()
{
  uint64_t v0;
  void *v1;
  int64_t v2;
  id v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t *v8;
  uint64_t inited;
  uint64_t v10;
  uint64_t v11;

  v1 = *(void **)(v0 + 8);
  v2 = *(_QWORD *)(v0 + 24);
  if (v2 >= (uint64_t)xpc_array_get_count(v1))
  {
    v6 = sub_23A23333C();
    swift_allocError();
    v8 = v7;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256953390);
    *v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256953678);
    swift_beginAccess();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256952AD0);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_23A2349D0;
    v10 = *(_QWORD *)(v0 + 24);
    swift_bridgeObjectRetain();
    sub_23A2334E0();
    sub_23A233174();
    swift_bridgeObjectRelease();
    *(_QWORD *)(inited + 56) = &type metadata for XPCCodingKey;
    *(_QWORD *)(inited + 64) = sub_23A221A80();
    v11 = swift_allocObject();
    *(_QWORD *)(inited + 32) = v11;
    *(_QWORD *)(v11 + 16) = 0x207865646E49;
    *(_QWORD *)(v11 + 24) = 0xE600000000000000;
    *(_QWORD *)(v11 + 32) = v10;
    *(_BYTE *)(v11 + 40) = 0;
    sub_23A22DE48((_QWORD *)inited);
    sub_23A233330();
    (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v6 - 8) + 104))(v8, *MEMORY[0x24BEE26E0], v6);
    swift_willThrow();
  }
  else
  {
    v3 = xpc_array_get_value(v1, v2);
    v4 = MEMORY[0x23B845B54]();
    swift_unknownObjectRelease();
    if (v4 == sub_23A233024())
    {
      *(_QWORD *)(v0 + 24) = v2 + 1;
      v5 = 1;
    }
    else
    {
      v5 = 0;
    }
  }
  return v5 & 1;
}

_QWORD *sub_23A22774C()
{
  uint64_t *v0;
  uint64_t *v1;
  void *v2;
  int64_t v3;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  xpc_object_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t inited;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v32;
  _QWORD v33[2];
  __int128 v34;
  ValueMetadata *v35;
  unint64_t v36;
  _QWORD v37[3];
  uint64_t v38;

  v1 = v0;
  v2 = (void *)v0[1];
  v3 = v0[3];
  if (v3 >= (uint64_t)xpc_array_get_count(v2))
  {
    v17 = sub_23A23333C();
    swift_allocError();
    v19 = v18;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256953390);
    *v19 = MEMORY[0x24BEE0D00];
    v20 = *v0;
    swift_beginAccess();
    v21 = *(_QWORD *)(v20 + 16);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256952AD0);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_23A2349D0;
    v23 = v0[3];
    v37[1] = 0xE600000000000000;
    v33[0] = v23;
    swift_bridgeObjectRetain();
    sub_23A2334E0();
    sub_23A233174();
    swift_bridgeObjectRelease();
    *(_QWORD *)(inited + 56) = &type metadata for XPCCodingKey;
    *(_QWORD *)(inited + 64) = sub_23A221A80();
    v24 = swift_allocObject();
    *(_QWORD *)(inited + 32) = v24;
    *(_QWORD *)(v24 + 16) = 0x207865646E49;
    *(_QWORD *)(v24 + 24) = 0xE600000000000000;
    *(_QWORD *)(v24 + 32) = v23;
    *(_BYTE *)(v24 + 40) = 0;
    v37[0] = v21;
    v14 = v37;
    sub_23A22DE48((_QWORD *)inited);
    sub_23A233330();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v17 - 8) + 104))(v19, *MEMORY[0x24BEE26E0], v17);
    swift_willThrow();
  }
  else
  {
    v4 = *v0;
    *(_QWORD *)&v34 = 0x207865646E49;
    *((_QWORD *)&v34 + 1) = 0xE600000000000000;
    v37[0] = v3;
    sub_23A2334E0();
    sub_23A233174();
    swift_bridgeObjectRelease();
    v5 = (_QWORD *)(v4 + 16);
    swift_beginAccess();
    v6 = *(_QWORD **)(v4 + 16);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(_QWORD *)(v4 + 16) = v6;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v6 = sub_23A22DD14(0, v6[2] + 1, 1, v6);
      *v5 = v6;
    }
    v9 = v6[2];
    v8 = v6[3];
    if (v9 >= v8 >> 1)
    {
      v6 = sub_23A22DD14((_QWORD *)(v8 > 1), v9 + 1, 1, v6);
      *v5 = v6;
    }
    v35 = &type metadata for XPCCodingKey;
    v32 = sub_23A221A80();
    v36 = v32;
    v10 = swift_allocObject();
    *(_QWORD *)&v34 = v10;
    *(_QWORD *)(v10 + 16) = 0x207865646E49;
    *(_QWORD *)(v10 + 24) = 0xE600000000000000;
    *(_QWORD *)(v10 + 32) = v3;
    *(_BYTE *)(v10 + 40) = 0;
    v6[2] = v9 + 1;
    sub_23A224F80(&v34, (uint64_t)&v6[5 * v9 + 4]);
    v11 = xpc_array_get_value(v2, v3);
    v12 = MEMORY[0x23B845B54]();
    if (v12 == sub_23A233024())
      goto LABEL_12;
    v13 = MEMORY[0x23B845B54](v11);
    if (v13 != sub_23A233060())
    {
      v14 = (_QWORD *)*v5;
      sub_23A23333C();
      swift_allocError();
      v16 = v15;
      swift_bridgeObjectRetain();
      sub_23A225434(MEMORY[0x24BEE0D00], (uint64_t)v11, v16);
      swift_bridgeObjectRelease();
      swift_willThrow();
      swift_unknownObjectRelease();
LABEL_13:
      sub_23A228C04(v1);
      return v14;
    }
    if (!xpc_string_get_string_ptr(v11))
    {
LABEL_12:
      swift_unknownObjectRelease();
      v25 = sub_23A23333C();
      swift_allocError();
      v27 = v26;
      __swift_instantiateConcreteTypeFromMangledName(&qword_256953390);
      *v27 = MEMORY[0x24BEE0D00];
      swift_beginAccess();
      __swift_instantiateConcreteTypeFromMangledName(&qword_256952AD0);
      v28 = swift_initStackObject();
      *(_OWORD *)(v28 + 16) = xmmword_23A2349D0;
      v38 = v1[3];
      v29 = v38;
      swift_bridgeObjectRetain();
      sub_23A2334E0();
      sub_23A233174();
      swift_bridgeObjectRelease();
      *(_QWORD *)(v28 + 56) = &type metadata for XPCCodingKey;
      *(_QWORD *)(v28 + 64) = v32;
      v30 = swift_allocObject();
      *(_QWORD *)(v28 + 32) = v30;
      *(_QWORD *)(v30 + 16) = 0x207865646E49;
      *(_QWORD *)(v30 + 24) = 0xE600000000000000;
      *(_QWORD *)(v30 + 32) = v29;
      *(_BYTE *)(v30 + 40) = 0;
      sub_23A22DE48((_QWORD *)v28);
      v33[0] = 0;
      v33[1] = 0xE000000000000000;
      v14 = v33;
      sub_23A233300();
      swift_bridgeObjectRelease();
      sub_23A233330();
      (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v25 - 8) + 104))(v27, *MEMORY[0x24BEE26E0], v25);
      swift_willThrow();
      goto LABEL_13;
    }
    v14 = (_QWORD *)sub_23A233180();
    swift_unknownObjectRelease();
    v1[3] = v3 + 1;
    sub_23A228C04(v1);
  }
  return v14;
}

uint64_t sub_23A227CD4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t *v4;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  int64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  xpc_object_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t inited;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v37;
  uint64_t v38;
  int v39;
  uint64_t *v40;
  uint64_t *v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  __int128 v63;
  ValueMetadata *v64;
  unint64_t v65;
  uint64_t v66;
  unint64_t v67;
  uint64_t v68;

  v59 = a3;
  v58 = a2;
  v7 = sub_23A23327C();
  v56 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v50 - v8;
  v10 = (void *)v4[1];
  v11 = v4[3];
  if (v11 >= (uint64_t)xpc_array_get_count(v10))
  {
    v26 = sub_23A23333C();
    swift_allocError();
    v28 = v27;
    v60 = (uint64_t)v27 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256953390) + 48);
    *v28 = a1;
    v29 = *v4;
    swift_beginAccess();
    v30 = *(_QWORD *)(v29 + 16);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256952AD0);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_23A2349D0;
    v32 = v4[3];
    v66 = 0x207865646E49;
    v67 = 0xE600000000000000;
    v61 = v32;
    swift_bridgeObjectRetain();
    sub_23A2334E0();
    sub_23A233174();
    swift_bridgeObjectRelease();
    v33 = v66;
    v34 = v67;
    *(_QWORD *)(inited + 56) = &type metadata for XPCCodingKey;
    *(_QWORD *)(inited + 64) = sub_23A221A80();
    v35 = swift_allocObject();
    *(_QWORD *)(inited + 32) = v35;
    *(_QWORD *)(v35 + 16) = v33;
    *(_QWORD *)(v35 + 24) = v34;
    *(_QWORD *)(v35 + 32) = v32;
    *(_BYTE *)(v35 + 40) = 0;
    v66 = v30;
    sub_23A22DE48((_QWORD *)inited);
    sub_23A233330();
    (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v26 - 8) + 104))(v28, *MEMORY[0x24BEE26E0], v26);
    return swift_willThrow();
  }
  else
  {
    v52 = a4;
    v55 = v4;
    v12 = *v4;
    *(_QWORD *)&v63 = 0x207865646E49;
    *((_QWORD *)&v63 + 1) = 0xE600000000000000;
    v66 = v11;
    sub_23A2334E0();
    sub_23A233174();
    swift_bridgeObjectRelease();
    v53 = *((_QWORD *)&v63 + 1);
    v54 = v63;
    v13 = (_QWORD *)(v12 + 16);
    swift_beginAccess();
    v14 = *(_QWORD **)(v12 + 16);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(_QWORD *)(v12 + 16) = v14;
    v57 = a1;
    v51 = v7;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v14 = sub_23A22DD14(0, v14[2] + 1, 1, v14);
      *v13 = v14;
    }
    v17 = v14[2];
    v16 = v14[3];
    if (v17 >= v16 >> 1)
    {
      v14 = sub_23A22DD14((_QWORD *)(v16 > 1), v17 + 1, 1, v14);
      *v13 = v14;
    }
    v64 = &type metadata for XPCCodingKey;
    v18 = sub_23A221A80();
    v65 = v18;
    v19 = swift_allocObject();
    *(_QWORD *)&v63 = v19;
    v20 = v53;
    *(_QWORD *)(v19 + 16) = v54;
    *(_QWORD *)(v19 + 24) = v20;
    *(_QWORD *)(v19 + 32) = v11;
    *(_BYTE *)(v19 + 40) = 0;
    v14[2] = v17 + 1;
    sub_23A224F80(&v63, (uint64_t)&v14[5 * v17 + 4]);
    v21 = xpc_array_get_value(v10, v11);
    v22 = v57;
    v23 = v58;
    v24 = v60;
    sub_23A225980(v21, v57, v58, v59, (uint64_t)v9);
    if (v24)
    {
      swift_unknownObjectRelease();
      v25 = v55;
    }
    else
    {
      swift_unknownObjectRelease();
      v37 = v23;
      v38 = *(_QWORD *)(v23 - 8);
      v39 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v38 + 48))(v9, 1, v37);
      v40 = v55;
      if (v39 == 1)
      {
        (*(void (**)(char *, uint64_t))(v56 + 8))(v9, v51);
        v60 = sub_23A23333C();
        swift_allocError();
        v42 = v41;
        v59 = (uint64_t)v41 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256953390) + 48);
        *v42 = v22;
        v43 = *v40;
        swift_beginAccess();
        v44 = *(_QWORD *)(v43 + 16);
        __swift_instantiateConcreteTypeFromMangledName(&qword_256952AD0);
        v45 = swift_initStackObject();
        *(_OWORD *)(v45 + 16) = xmmword_23A2349D0;
        v46 = v40[3];
        v61 = 0x207865646E49;
        v62 = 0xE600000000000000;
        v68 = v46;
        swift_bridgeObjectRetain();
        sub_23A2334E0();
        sub_23A233174();
        swift_bridgeObjectRelease();
        v47 = v61;
        v48 = v62;
        *(_QWORD *)(v45 + 56) = &type metadata for XPCCodingKey;
        *(_QWORD *)(v45 + 64) = v18;
        v49 = swift_allocObject();
        *(_QWORD *)(v45 + 32) = v49;
        *(_QWORD *)(v49 + 16) = v47;
        *(_QWORD *)(v49 + 24) = v48;
        *(_QWORD *)(v49 + 32) = v46;
        *(_BYTE *)(v49 + 40) = 0;
        v61 = v44;
        sub_23A22DE48((_QWORD *)v45);
        v61 = 0;
        v62 = 0xE000000000000000;
        sub_23A233300();
        swift_bridgeObjectRelease();
        v61 = 0x6465746365707845;
        v62 = 0xE900000000000020;
        sub_23A233870();
        sub_23A233174();
        swift_bridgeObjectRelease();
        sub_23A233174();
        sub_23A233330();
        (*(void (**)(uint64_t *, _QWORD))(*(_QWORD *)(v60 - 8) + 104))(v42, *MEMORY[0x24BEE26E0]);
        swift_willThrow();
      }
      else
      {
        (*(void (**)(uint64_t, char *, uint64_t))(v38 + 32))(v52, v9, v37);
        v40[3] = v11 + 1;
      }
      v25 = v40;
    }
    return sub_23A228C04(v25);
  }
}

uint64_t sub_23A22836C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v5;
  int64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  xpc_object_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v31;
  uint64_t v32;
  ValueMetadata *v33;
  unint64_t v34;
  int64_t v35;
  uint64_t v36;

  v4 = v3;
  v36 = a2;
  v5 = *v3;
  v6 = v3[3];
  *(_QWORD *)&v31 = 0x207865646E49;
  *((_QWORD *)&v31 + 1) = 0xE600000000000000;
  v35 = v6;
  sub_23A2334E0();
  sub_23A233174();
  swift_bridgeObjectRelease();
  v7 = (_QWORD *)(v5 + 16);
  swift_beginAccess();
  v8 = *(_QWORD **)(v5 + 16);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)(v5 + 16) = v8;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v8 = sub_23A22DD14(0, v8[2] + 1, 1, v8);
    *v7 = v8;
  }
  v11 = v8[2];
  v10 = v8[3];
  if (v11 >= v10 >> 1)
  {
    v8 = sub_23A22DD14((_QWORD *)(v10 > 1), v11 + 1, 1, v8);
    *v7 = v8;
  }
  v33 = &type metadata for XPCCodingKey;
  v34 = sub_23A221A80();
  v12 = swift_allocObject();
  *(_QWORD *)&v31 = v12;
  *(_QWORD *)(v12 + 16) = 0x207865646E49;
  *(_QWORD *)(v12 + 24) = 0xE600000000000000;
  *(_QWORD *)(v12 + 32) = v6;
  *(_BYTE *)(v12 + 40) = 0;
  v8[2] = v11 + 1;
  sub_23A224F80(&v31, (uint64_t)&v8[5 * v11 + 4]);
  v13 = (void *)v4[1];
  if (v6 >= (uint64_t)xpc_array_get_count(v13))
  {
    v19 = sub_23A23333C();
    swift_allocError();
    v21 = v20;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256953390);
    *v21 = sub_23A233468();
    swift_bridgeObjectRetain();
    sub_23A233330();
    (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v19 - 8) + 104))(v21, *MEMORY[0x24BEE26E0], v19);
    swift_willThrow();
    return sub_23A228C04(v4);
  }
  v14 = xpc_array_get_value(v13, v6);
  v15 = MEMORY[0x23B845B54]();
  if (v15 == sub_23A233024())
  {
    v22 = sub_23A23333C();
    swift_allocError();
    v24 = v23;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256953390);
    *v24 = sub_23A233468();
    swift_bridgeObjectRetain();
    sub_23A233330();
    (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v22 - 8) + 104))(v24, *MEMORY[0x24BEE26E0], v22);
    goto LABEL_11;
  }
  v16 = MEMORY[0x23B845B54](v14);
  if (v16 != sub_23A233078())
  {
    v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569535E0);
    sub_23A23333C();
    swift_allocError();
    sub_23A225434(v17, (uint64_t)v14, v18);
LABEL_11:
    swift_willThrow();
    swift_unknownObjectRelease();
    return sub_23A228C04(v4);
  }
  v4[3] = v6 + 1;
  swift_retain();
  swift_unknownObjectRetain();
  *(_QWORD *)&v31 = sub_23A22558C(v5, (uint64_t)v14);
  *((_QWORD *)&v31 + 1) = v26;
  v32 = v27;
  v29 = type metadata accessor for _XPCKeyedDecodingContainer(0, v36, a3, v28);
  swift_retain();
  swift_unknownObjectRetain();
  swift_bridgeObjectRetain();
  MEMORY[0x23B8459BC](&unk_23A235D00, v29);
  sub_23A233474();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  swift_unknownObjectRelease();
  return sub_23A228C04(v4);
}

uint64_t sub_23A2287B0@<X0>(_QWORD *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v5;
  int64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  xpc_object_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t result;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  __int128 v30;
  ValueMetadata *v31;
  unint64_t v32;
  int64_t v33;
  uint64_t v34;

  v3 = v1;
  v5 = *v1;
  v6 = v1[3];
  *(_QWORD *)&v30 = 0x207865646E49;
  *((_QWORD *)&v30 + 1) = 0xE600000000000000;
  v33 = v6;
  sub_23A2334E0();
  sub_23A233174();
  swift_bridgeObjectRelease();
  v7 = (_QWORD *)(v5 + 16);
  swift_beginAccess();
  v8 = *(_QWORD **)(v5 + 16);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)(v5 + 16) = v8;
  v34 = v2;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v8 = sub_23A22DD14(0, v8[2] + 1, 1, v8);
    *v7 = v8;
  }
  v11 = v8[2];
  v10 = v8[3];
  if (v11 >= v10 >> 1)
  {
    v8 = sub_23A22DD14((_QWORD *)(v10 > 1), v11 + 1, 1, v8);
    *v7 = v8;
  }
  v31 = &type metadata for XPCCodingKey;
  v32 = sub_23A221A80();
  v12 = swift_allocObject();
  *(_QWORD *)&v30 = v12;
  *(_QWORD *)(v12 + 16) = 0x207865646E49;
  *(_QWORD *)(v12 + 24) = 0xE600000000000000;
  *(_QWORD *)(v12 + 32) = v6;
  *(_BYTE *)(v12 + 40) = 0;
  v8[2] = v11 + 1;
  sub_23A224F80(&v30, (uint64_t)&v8[5 * v11 + 4]);
  v13 = (void *)v3[1];
  if (v6 >= (uint64_t)xpc_array_get_count(v13))
  {
    v19 = sub_23A23333C();
    swift_allocError();
    v21 = v20;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256953390);
    *v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569535D8);
    swift_bridgeObjectRetain();
    sub_23A233330();
    (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v19 - 8) + 104))(v21, *MEMORY[0x24BEE26E0], v19);
    swift_willThrow();
    return sub_23A228C04(v3);
  }
  v14 = xpc_array_get_value(v13, v6);
  v15 = MEMORY[0x23B845B54]();
  if (v15 == sub_23A233024())
  {
    v22 = sub_23A23333C();
    swift_allocError();
    v24 = v23;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256953390);
    *v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569535D8);
    swift_bridgeObjectRetain();
    sub_23A233330();
    (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v22 - 8) + 104))(v24, *MEMORY[0x24BEE26E0], v22);
    goto LABEL_11;
  }
  v16 = MEMORY[0x23B845B54](v14);
  if (v16 != sub_23A23303C())
  {
    v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569535C8);
    sub_23A23333C();
    swift_allocError();
    sub_23A225434(v17, (uint64_t)v14, v18);
LABEL_11:
    swift_willThrow();
    swift_unknownObjectRelease();
    return sub_23A228C04(v3);
  }
  v3[3] = v6 + 1;
  swift_retain();
  v26 = swift_unknownObjectRetain();
  v27 = MEMORY[0x23B845B54](v26);
  if (v27 == sub_23A23303C())
  {
    v28 = *(_QWORD *)(v5 + 16);
    a1[3] = &type metadata for _XPCUnkeyedDecodingContainer;
    a1[4] = sub_23A22F6D0();
    v29 = (_QWORD *)swift_allocObject();
    *a1 = v29;
    swift_bridgeObjectRetain();
    swift_unknownObjectRelease();
    v29[2] = v5;
    v29[3] = v14;
    v29[4] = v28;
    v29[5] = 0;
    return sub_23A228C04(v3);
  }
  else
  {
    result = sub_23A2333CC();
    __break(1u);
  }
  return result;
}

uint64_t sub_23A228C04(uint64_t *a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;

  v1 = *a1;
  swift_beginAccess();
  v2 = *(_QWORD **)(v1 + 16);
  if (!v2[2])
  {
    __break(1u);
LABEL_6:
    result = (uint64_t)sub_23A22DF44(v2);
    v2 = (_QWORD *)result;
    v4 = *(_QWORD *)(result + 16);
    if (v4)
      goto LABEL_4;
    goto LABEL_7;
  }
  swift_retain();
  result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) == 0)
    goto LABEL_6;
  v4 = v2[2];
  if (v4)
  {
LABEL_4:
    v5 = v4 - 1;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v2[5 * v4 - 1]);
    v2[2] = v5;
    *(_QWORD *)(v1 + 16) = v2;
    swift_endAccess();
    return swift_release();
  }
LABEL_7:
  __break(1u);
  return result;
}

size_t sub_23A228CB4()
{
  uint64_t v0;

  return xpc_array_get_count(*(xpc_object_t *)(v0 + 8));
}

BOOL sub_23A228CD0()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 24);
  return v1 >= (uint64_t)xpc_array_get_count(*(xpc_object_t *)(v0 + 8));
}

uint64_t sub_23A228CFC()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 24);
}

uint64_t sub_23A228D04()
{
  return sub_23A227524() & 1;
}

uint64_t sub_23A228D1C()
{
  return sub_23A22F968() & 1;
}

_QWORD *sub_23A228D34()
{
  return sub_23A22774C();
}

double sub_23A228D48()
{
  return sub_23A2327F0();
}

float sub_23A228D5C()
{
  return sub_23A23226C();
}

_QWORD *sub_23A228D70()
{
  return sub_23A22FEE0();
}

_QWORD *sub_23A228D84()
{
  return sub_23A230E3C((uint64_t (*)(void))sub_23A22E158, MEMORY[0x24BEE3E50]);
}

_QWORD *sub_23A228DC0()
{
  return sub_23A231340((uint64_t (*)(void))sub_23A22E3A0, MEMORY[0x24BEE3F30]);
}

uint64_t sub_23A228DFC()
{
  return sub_23A231844((uint64_t (*)(void))sub_23A22E5EC, MEMORY[0x24BEE3F88]);
}

_QWORD *sub_23A228E38()
{
  return sub_23A2303F8();
}

uint64_t sub_23A228E4C()
{
  return sub_23A23354C();
}

_QWORD *sub_23A228E60()
{
  return sub_23A23091C();
}

_QWORD *sub_23A228E74()
{
  return sub_23A230E3C((uint64_t (*)(void))sub_23A22ECF0, MEMORY[0x24BEE4260]);
}

_QWORD *sub_23A228EB0()
{
  return sub_23A231340((uint64_t (*)(void))sub_23A22EF3C, MEMORY[0x24BEE4478]);
}

uint64_t sub_23A228EEC()
{
  return sub_23A231844((uint64_t (*)(void))sub_23A22F188, MEMORY[0x24BEE44F0]);
}

_QWORD *sub_23A228F28()
{
  return sub_23A231D48();
}

uint64_t sub_23A228F3C()
{
  return sub_23A233558();
}

uint64_t sub_23A228F50@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  return sub_23A227CD4(a1, a2, a3, a4);
}

uint64_t sub_23A228F64()
{
  return sub_23A2334F8();
}

uint64_t sub_23A228F78()
{
  return sub_23A2334EC();
}

uint64_t sub_23A228F8C()
{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;

  result = sub_23A233504();
  if (v0)
    return v2;
  return result;
}

uint64_t sub_23A228FAC(uint64_t a1, uint64_t a2)
{
  return sub_23A22913C(a1, a2, MEMORY[0x24BEE3690]);
}

uint64_t sub_23A228FC8()
{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;

  result = sub_23A233510();
  if (v0)
    return v2;
  return result;
}

uint64_t sub_23A228FE8(uint64_t a1, uint64_t a2)
{
  return sub_23A2290B4(a1, a2, MEMORY[0x24BEE36B0]);
}

uint64_t sub_23A229004(uint64_t a1, uint64_t a2)
{
  return sub_23A2290F8(a1, a2, MEMORY[0x24BEE36B8]);
}

uint64_t sub_23A229020(uint64_t a1, uint64_t a2)
{
  return sub_23A22913C(a1, a2, MEMORY[0x24BEE36C0]);
}

uint64_t sub_23A22903C()
{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;

  result = sub_23A233534();
  if (v0)
    return v2;
  return result;
}

uint64_t sub_23A22905C(uint64_t a1, uint64_t a2)
{
  return sub_23A2291A8(a1, a2, MEMORY[0x24BEE36D8]);
}

uint64_t sub_23A229078()
{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;

  result = sub_23A23351C();
  if (v0)
    return v2;
  return result;
}

uint64_t sub_23A229098(uint64_t a1, uint64_t a2)
{
  return sub_23A2290B4(a1, a2, MEMORY[0x24BEE36D0]);
}

uint64_t sub_23A2290B4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return a3() & 0x1FF;
}

uint64_t sub_23A2290DC(uint64_t a1, uint64_t a2)
{
  return sub_23A2290F8(a1, a2, MEMORY[0x24BEE36E0]);
}

uint64_t sub_23A2290F8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return a3() & 0x1FFFF;
}

uint64_t sub_23A229120(uint64_t a1, uint64_t a2)
{
  return sub_23A22913C(a1, a2, MEMORY[0x24BEE36E8]);
}

uint64_t sub_23A22913C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  unint64_t v3;

  v3 = a3();
  return v3 | ((HIDWORD(v3) & 1) << 32);
}

uint64_t sub_23A22916C()
{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;

  result = sub_23A233540();
  if (v0)
    return v2;
  return result;
}

uint64_t sub_23A22918C(uint64_t a1, uint64_t a2)
{
  return sub_23A2291A8(a1, a2, MEMORY[0x24BEE36F8]);
}

uint64_t sub_23A2291A8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v3;
  uint64_t result;
  uint64_t v5;

  result = a3();
  if (v3)
    return v5;
  return result;
}

uint64_t sub_23A2291CC()
{
  return sub_23A233528();
}

uint64_t sub_23A2291F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23A22836C(a1, a2, a3);
}

uint64_t sub_23A229208@<X0>(_QWORD *a1@<X8>)
{
  return sub_23A2287B0(a1);
}

void sub_23A22921C()
{
  sub_23A2333CC();
  __break(1u);
}

uint64_t sub_23A229264(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  uint64_t result;
  uint64_t v12;
  _QWORD aBlock[6];
  uint64_t v14;

  v14 = sub_23A2331E0();
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = a4;
  v8[3] = a5;
  v8[4] = &v14;
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = sub_23A232D80;
  *(_QWORD *)(v9 + 24) = v8;
  aBlock[4] = sub_23A232D9C;
  aBlock[5] = v9;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_23A229474;
  aBlock[3] = &block_descriptor;
  v10 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  xpc_dictionary_apply(a2, v10);
  _Block_release(v10);
  LOBYTE(a2) = swift_isEscapingClosureAtFileLocation();
  result = swift_release();
  if ((a2 & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    v12 = v14;
    swift_release();
    return v12;
  }
  return result;
}

uint64_t sub_23A2293A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t result;
  uint64_t v9;

  v5 = sub_23A23327C();
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v9 - v6;
  sub_23A233180();
  sub_23A23384C();
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(a4 - 8) + 48))(v7, 1, a4);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }
  else
  {
    sub_23A233210();
    sub_23A233204();
    return 1;
  }
  return result;
}

uint64_t sub_23A229474(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t (*v5)(uint64_t, uint64_t);
  char v6;

  v5 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 32);
  swift_unknownObjectRetain();
  v6 = v5(a2, a3);
  swift_unknownObjectRelease();
  return v6 & 1;
}

BOOL sub_23A2294C4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  xpc_object_t v5;

  sub_23A233840();
  v4 = sub_23A233150();
  swift_bridgeObjectRelease();
  v5 = xpc_dictionary_get_value(a3, (const char *)(v4 + 32));
  swift_release();
  if (v5)
    swift_unknownObjectRelease();
  return v5 != 0;
}

BOOL sub_23A229540(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10;
  xpc_object_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t *boxed_opaque_existential_1;

  sub_23A233840();
  v10 = sub_23A233150();
  swift_bridgeObjectRelease();
  v11 = xpc_dictionary_get_value(a3, (const char *)(v10 + 32));
  swift_release();
  if (v11)
  {
    v12 = MEMORY[0x23B845B54](v11);
    v13 = sub_23A233024();
    swift_unknownObjectRelease();
    return v12 == v13;
  }
  else
  {
    v15 = sub_23A23333C();
    swift_allocError();
    v17 = v16;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256953680);
    v17[3] = a5;
    v17[4] = a6;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v17);
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a5 - 8) + 16))(boxed_opaque_existential_1, a1, a5);
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_23A233300();
    sub_23A233174();
    sub_23A233654();
    sub_23A233174();
    sub_23A233330();
    (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v15 - 8) + 104))(v17, *MEMORY[0x24BEE26C8], v15);
    swift_willThrow();
  }
  return v14;
}

uint64_t sub_23A229728(uint64_t a1, uint64_t a2, void *a3, char *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  xpc_object_t v18;
  void *v19;
  uint64_t *v20;
  _QWORD *v21;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t *v36;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v38;
  _QWORD *v39;
  _QWORD *v40;
  uint64_t v41;
  uint64_t v43;
  void (*v44)(char *, uint64_t, uint64_t);
  uint64_t v45;
  uint64_t v46;
  void *v47;
  char *v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;

  v48 = a4;
  v10 = *(_QWORD *)(a5 - 8);
  v11 = MEMORY[0x24BDAC7A8](a1);
  v13 = (char *)&v43 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x24BDAC7A8](v11);
  v16 = (char *)&v43 - v15;
  v51 = v14;
  sub_23A233840();
  v17 = sub_23A233150();
  swift_bridgeObjectRelease();
  v47 = a3;
  v18 = xpc_dictionary_get_value(a3, (const char *)(v17 + 32));
  swift_release();
  if (v18)
  {
    v19 = v18;
    v45 = a5;
    v46 = a6;
    v44 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
    v44(v16, v51, a5);
    v20 = (uint64_t *)(a2 + 16);
    swift_beginAccess();
    v21 = *(_QWORD **)(a2 + 16);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v51 = a2;
    *(_QWORD *)(a2 + 16) = v21;
    v23 = v10;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v21 = sub_23A22DD14(0, v21[2] + 1, 1, v21);
      *v20 = (uint64_t)v21;
    }
    v24 = (uint64_t)v18;
    v26 = v21[2];
    v25 = v21[3];
    if (v26 >= v25 >> 1)
      *v20 = (uint64_t)sub_23A22DD14((_QWORD *)(v25 > 1), v26 + 1, 1, v21);
    v27 = v45;
    v44(v13, (uint64_t)v16, v45);
    sub_23A22DF58(v26, (uint64_t)v13, v20, v27, v46);
    (*(void (**)(char *, uint64_t))(v23 + 8))(v16, v27);
    v28 = MEMORY[0x23B845B54](v19);
    if (v28 == sub_23A233024())
    {
      v38 = sub_23A23333C();
      swift_allocError();
      v40 = v39;
      __swift_instantiateConcreteTypeFromMangledName(&qword_256953390);
      v44 = (void (*)(char *, uint64_t, uint64_t))v24;
      *v40 = MEMORY[0x24BEE1328];
      v41 = v51;
      v49 = 0;
      v50 = 0xE000000000000000;
      swift_bridgeObjectRetain();
      v20 = &v49;
      sub_23A233300();
      swift_bridgeObjectRelease();
      sub_23A233330();
      (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v38 - 8) + 104))(v40, *MEMORY[0x24BEE26E0], v38);
      swift_willThrow();
      sub_23A22D0A8(v41);
    }
    else
    {
      v29 = MEMORY[0x23B845B54](v19);
      v30 = sub_23A233018();
      v31 = v51;
      if (v29 == v30)
      {
        LOBYTE(v20) = xpc_BOOL_get_value(v19);
        sub_23A22D0A8(v31);
        swift_unknownObjectRelease();
        return v20 & 1;
      }
      sub_23A23333C();
      swift_allocError();
      v33 = v32;
      swift_bridgeObjectRetain();
      sub_23A225434(MEMORY[0x24BEE1328], v24, v33);
      swift_bridgeObjectRelease();
      swift_willThrow();
      sub_23A22D0A8(v31);
    }
    swift_unknownObjectRelease();
  }
  else
  {
    v34 = sub_23A23333C();
    swift_allocError();
    v36 = v35;
    v48 = (char *)v35 + *(int *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256953680) + 48);
    v36[3] = a5;
    v36[4] = a6;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v36);
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(v10 + 16))(boxed_opaque_existential_1, v51, a5);
    swift_beginAccess();
    v49 = 0;
    v50 = 0xE000000000000000;
    swift_bridgeObjectRetain();
    v20 = &v49;
    sub_23A233300();
    sub_23A233174();
    sub_23A233654();
    sub_23A233174();
    sub_23A233330();
    (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v34 - 8) + 104))(v36, *MEMORY[0x24BEE26C8], v34);
    swift_willThrow();
  }
  return v20 & 1;
}

uint64_t *sub_23A229BDC(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  xpc_object_t v18;
  xpc_object_t v19;
  void (*v20)(char *, uint64_t, uint64_t);
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  char isUniquelyReferenced_nonNull_native;
  void *v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  char *v30;
  int64_t v31;
  char v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t *v35;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v37;
  _QWORD *v38;
  _QWORD *v39;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;

  v44 = a4;
  v10 = *(_QWORD *)(a5 - 8);
  v11 = MEMORY[0x24BDAC7A8](a1);
  v13 = (char *)&v41 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x24BDAC7A8](v11);
  v16 = (char *)&v41 - v15;
  v48 = v14;
  sub_23A233840();
  v17 = sub_23A233150();
  swift_bridgeObjectRelease();
  v43 = a3;
  v18 = xpc_dictionary_get_value(a3, (const char *)(v17 + 32));
  swift_release();
  if (!v18)
  {
    v33 = sub_23A23333C();
    swift_allocError();
    v35 = v34;
    v45 = (char *)v34 + *(int *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256953680) + 48);
    v35[3] = a5;
    v35[4] = a6;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v35);
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(v10 + 16))(boxed_opaque_existential_1, v48, a5);
    swift_beginAccess();
    v46 = 0;
    v47 = 0xE000000000000000;
    swift_bridgeObjectRetain();
    v29 = &v46;
    sub_23A233300();
    sub_23A233174();
    sub_23A233654();
    sub_23A233174();
    sub_23A233330();
    (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v33 - 8) + 104))(v35, *MEMORY[0x24BEE26C8], v33);
    swift_willThrow();
    return v29;
  }
  v19 = v18;
  v41 = v10;
  v42 = a6;
  v20 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  v21 = a5;
  v20(v16, v48, a5);
  v22 = (_QWORD *)(a2 + 16);
  swift_beginAccess();
  v23 = *(_QWORD **)(a2 + 16);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)(a2 + 16) = v23;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v23 = sub_23A22DD14(0, v23[2] + 1, 1, v23);
    *v22 = v23;
  }
  v25 = v19;
  v27 = v23[2];
  v26 = v23[3];
  if (v27 >= v26 >> 1)
    *v22 = sub_23A22DD14((_QWORD *)(v26 > 1), v27 + 1, 1, v23);
  v20(v13, (uint64_t)v16, v21);
  sub_23A22DF58(v27, (uint64_t)v13, (uint64_t *)(a2 + 16), v21, v42);
  (*(void (**)(char *, uint64_t))(v41 + 8))(v16, v21);
  v28 = MEMORY[0x24BEE1768];
  v29 = (uint64_t *)a2;
  v30 = v45;
  v31 = sub_23A22E840(v25, 7630409, 0xE300000000000000, MEMORY[0x24BEE1768]);
  if (v30)
  {
LABEL_11:
    sub_23A22D0A8(a2);
    swift_unknownObjectRelease();
    return v29;
  }
  if ((v32 & 1) != 0)
  {
    v37 = sub_23A23333C();
    swift_allocError();
    v39 = v38;
    v48 = (uint64_t)v38 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256953390) + 48);
    *v39 = v28;
    v46 = 0;
    v47 = 0xE000000000000000;
    swift_bridgeObjectRetain();
    v29 = &v46;
    sub_23A233300();
    swift_bridgeObjectRelease();
    sub_23A233330();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v37 - 8) + 104))(v39, *MEMORY[0x24BEE26E0], v37);
    swift_willThrow();
    goto LABEL_11;
  }
  v29 = (uint64_t *)v31;
  sub_23A22D0A8(a2);
  swift_unknownObjectRelease();
  return v29;
}

uint64_t *sub_23A229FF8(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  xpc_object_t v18;
  xpc_object_t v19;
  void (*v20)(char *, uint64_t, uint64_t);
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  char isUniquelyReferenced_nonNull_native;
  void *v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  char *v30;
  int64_t v31;
  char v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t *v35;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v37;
  _QWORD *v38;
  _QWORD *v39;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;

  v44 = a4;
  v10 = *(_QWORD *)(a5 - 8);
  v11 = MEMORY[0x24BDAC7A8](a1);
  v13 = (char *)&v41 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x24BDAC7A8](v11);
  v16 = (char *)&v41 - v15;
  v48 = v14;
  sub_23A233840();
  v17 = sub_23A233150();
  swift_bridgeObjectRelease();
  v43 = a3;
  v18 = xpc_dictionary_get_value(a3, (const char *)(v17 + 32));
  swift_release();
  if (!v18)
  {
    v33 = sub_23A23333C();
    swift_allocError();
    v35 = v34;
    v45 = (char *)v34 + *(int *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256953680) + 48);
    v35[3] = a5;
    v35[4] = a6;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v35);
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(v10 + 16))(boxed_opaque_existential_1, v48, a5);
    swift_beginAccess();
    v46 = 0;
    v47 = 0xE000000000000000;
    swift_bridgeObjectRetain();
    v29 = &v46;
    sub_23A233300();
    sub_23A233174();
    sub_23A233654();
    sub_23A233174();
    sub_23A233330();
    (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v33 - 8) + 104))(v35, *MEMORY[0x24BEE26C8], v33);
    swift_willThrow();
    return v29;
  }
  v19 = v18;
  v41 = v10;
  v42 = a6;
  v20 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  v21 = a5;
  v20(v16, v48, a5);
  v22 = (_QWORD *)(a2 + 16);
  swift_beginAccess();
  v23 = *(_QWORD **)(a2 + 16);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)(a2 + 16) = v23;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v23 = sub_23A22DD14(0, v23[2] + 1, 1, v23);
    *v22 = v23;
  }
  v25 = v19;
  v27 = v23[2];
  v26 = v23[3];
  if (v27 >= v26 >> 1)
    *v22 = sub_23A22DD14((_QWORD *)(v26 > 1), v27 + 1, 1, v23);
  v20(v13, (uint64_t)v16, v21);
  sub_23A22DF58(v27, (uint64_t)v13, (uint64_t *)(a2 + 16), v21, v42);
  (*(void (**)(char *, uint64_t))(v41 + 8))(v16, v21);
  v28 = MEMORY[0x24BEE4008];
  v29 = (uint64_t *)a2;
  v30 = v45;
  v31 = sub_23A22E840(v25, 0x3436746E49, 0xE500000000000000, MEMORY[0x24BEE4008]);
  if (v30)
  {
LABEL_11:
    sub_23A22D0A8(a2);
    swift_unknownObjectRelease();
    return v29;
  }
  if ((v32 & 1) != 0)
  {
    v37 = sub_23A23333C();
    swift_allocError();
    v39 = v38;
    v48 = (uint64_t)v38 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256953390) + 48);
    *v39 = v28;
    v46 = 0;
    v47 = 0xE000000000000000;
    swift_bridgeObjectRetain();
    v29 = &v46;
    sub_23A233300();
    swift_bridgeObjectRelease();
    sub_23A233330();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v37 - 8) + 104))(v39, *MEMORY[0x24BEE26E0], v37);
    swift_willThrow();
    goto LABEL_11;
  }
  v29 = (uint64_t *)v31;
  sub_23A22D0A8(a2);
  swift_unknownObjectRelease();
  return v29;
}

uint64_t *sub_23A22A418(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  xpc_object_t v18;
  xpc_object_t v19;
  void (*v20)(char *, uint64_t, uint64_t);
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  char isUniquelyReferenced_nonNull_native;
  void *v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  char *v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t *v35;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v37;
  _QWORD *v38;
  _QWORD *v39;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;

  v44 = a4;
  v10 = *(_QWORD *)(a5 - 8);
  v11 = MEMORY[0x24BDAC7A8](a1);
  v13 = (char *)&v41 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x24BDAC7A8](v11);
  v16 = (char *)&v41 - v15;
  v48 = v14;
  sub_23A233840();
  v17 = sub_23A233150();
  swift_bridgeObjectRelease();
  v43 = a3;
  v18 = xpc_dictionary_get_value(a3, (const char *)(v17 + 32));
  swift_release();
  if (!v18)
  {
    v33 = sub_23A23333C();
    swift_allocError();
    v35 = v34;
    v45 = (char *)v34 + *(int *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256953680) + 48);
    v35[3] = a5;
    v35[4] = a6;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v35);
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(v10 + 16))(boxed_opaque_existential_1, v48, a5);
    swift_beginAccess();
    v46 = 0;
    v47 = 0xE000000000000000;
    swift_bridgeObjectRetain();
    v29 = &v46;
    sub_23A233300();
    sub_23A233174();
    sub_23A233654();
    sub_23A233174();
    sub_23A233330();
    (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v33 - 8) + 104))(v35, *MEMORY[0x24BEE26C8], v33);
    swift_willThrow();
    return v29;
  }
  v19 = v18;
  v41 = v10;
  v42 = a6;
  v20 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  v21 = a5;
  v20(v16, v48, a5);
  v22 = (_QWORD *)(a2 + 16);
  swift_beginAccess();
  v23 = *(_QWORD **)(a2 + 16);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)(a2 + 16) = v23;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v23 = sub_23A22DD14(0, v23[2] + 1, 1, v23);
    *v22 = v23;
  }
  v25 = v19;
  v27 = v23[2];
  v26 = v23[3];
  if (v27 >= v26 >> 1)
    *v22 = sub_23A22DD14((_QWORD *)(v26 > 1), v27 + 1, 1, v23);
  v20(v13, (uint64_t)v16, v21);
  sub_23A22DF58(v27, (uint64_t)v13, (uint64_t *)(a2 + 16), v21, v42);
  (*(void (**)(char *, uint64_t))(v41 + 8))(v16, v21);
  v28 = MEMORY[0x24BEE1E88];
  v29 = (uint64_t *)a2;
  v30 = v45;
  v31 = sub_23A22EA98(v25, 1953384789, 0xE400000000000000, MEMORY[0x24BEE1E88]);
  if (v30)
  {
LABEL_11:
    sub_23A22D0A8(a2);
    swift_unknownObjectRelease();
    return v29;
  }
  if ((v32 & 1) != 0)
  {
    v37 = sub_23A23333C();
    swift_allocError();
    v39 = v38;
    v48 = (uint64_t)v38 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256953390) + 48);
    *v39 = v28;
    v46 = 0;
    v47 = 0xE000000000000000;
    swift_bridgeObjectRetain();
    v29 = &v46;
    sub_23A233300();
    swift_bridgeObjectRelease();
    sub_23A233330();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v37 - 8) + 104))(v39, *MEMORY[0x24BEE26E0], v37);
    swift_willThrow();
    goto LABEL_11;
  }
  v29 = (uint64_t *)v31;
  sub_23A22D0A8(a2);
  swift_unknownObjectRelease();
  return v29;
}

uint64_t *sub_23A22A834(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t (*a7)(xpc_object_t), uint64_t a8, uint64_t a9, uint64_t (*a10)(xpc_object_t))
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  xpc_object_t v22;
  uint64_t v23;
  void (*v24)(char *, uint64_t, uint64_t);
  uint64_t v25;
  uint64_t *v26;
  _QWORD *v27;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t *v38;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v40;
  _QWORD *v41;
  _QWORD *v42;
  _QWORD v44[2];
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t (*v50)(xpc_object_t);
  xpc_object_t v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;

  v45 = a8;
  v50 = a7;
  v48 = a4;
  v14 = *(_QWORD *)(a5 - 8);
  v15 = MEMORY[0x24BDAC7A8](a1);
  v17 = (char *)v44 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = MEMORY[0x24BDAC7A8](v15);
  v20 = (char *)v44 - v19;
  v54 = v18;
  sub_23A233840();
  v21 = sub_23A233150();
  swift_bridgeObjectRelease();
  v47 = a3;
  v22 = xpc_dictionary_get_value(a3, (const char *)(v21 + 32));
  swift_release();
  v51 = v22;
  if (v22)
  {
    v46 = a6;
    v23 = v14;
    v24 = *(void (**)(char *, uint64_t, uint64_t))(v14 + 16);
    v25 = v54;
    v54 = a5;
    v24(v20, v25, a5);
    v26 = (uint64_t *)(a2 + 16);
    swift_beginAccess();
    v27 = *(_QWORD **)(a2 + 16);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v29 = a2;
    *(_QWORD *)(a2 + 16) = v27;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v27 = sub_23A22DD14(0, v27[2] + 1, 1, v27);
      *v26 = (uint64_t)v27;
    }
    v31 = v27[2];
    v30 = v27[3];
    if (v31 >= v30 >> 1)
      *v26 = (uint64_t)sub_23A22DD14((_QWORD *)(v30 > 1), v31 + 1, 1, v27);
    v32 = v54;
    v24(v17, (uint64_t)v20, v54);
    sub_23A22DF58(v31, (uint64_t)v17, v26, v32, v46);
    (*(void (**)(char *, uint64_t))(v23 + 8))(v20, v32);
    v33 = (uint64_t *)v29;
    v34 = v49;
    v35 = v50(v51);
    if (v34)
    {
      sub_23A22D0A8(v29);
LABEL_12:
      swift_unknownObjectRelease();
      return v33;
    }
    v33 = (uint64_t *)v35;
    if ((v35 & 0x100) != 0)
    {
      v49 = a9;
      v50 = a10;
      v40 = sub_23A23333C();
      swift_allocError();
      v42 = v41;
      v44[1] = (char *)v41 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256953390) + 48);
      *v42 = v45;
      v52 = 0;
      v53 = 0xE000000000000000;
      swift_bridgeObjectRetain();
      v33 = &v52;
      sub_23A233300();
      swift_bridgeObjectRelease();
      sub_23A233330();
      (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v40 - 8) + 104))(v42, *MEMORY[0x24BEE26E0], v40);
      swift_willThrow();
      sub_23A22D0A8(v29);
      goto LABEL_12;
    }
    sub_23A22D0A8(v29);
    swift_unknownObjectRelease();
  }
  else
  {
    v36 = sub_23A23333C();
    swift_allocError();
    v38 = v37;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256953680);
    v38[3] = a5;
    v38[4] = a6;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v38);
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(v14 + 16))(boxed_opaque_existential_1, v54, a5);
    swift_beginAccess();
    v52 = 0;
    v53 = 0xE000000000000000;
    swift_bridgeObjectRetain();
    v33 = &v52;
    sub_23A233300();
    sub_23A233174();
    sub_23A233654();
    sub_23A233174();
    sub_23A233330();
    (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v36 - 8) + 104))(v38, *MEMORY[0x24BEE26C8], v36);
    swift_willThrow();
  }
  return v33;
}

uint64_t *sub_23A22AC68(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t (*a7)(xpc_object_t), uint64_t a8, uint64_t a9, uint64_t (*a10)(xpc_object_t))
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  xpc_object_t v22;
  uint64_t v23;
  void (*v24)(char *, uint64_t, uint64_t);
  uint64_t v25;
  uint64_t *v26;
  _QWORD *v27;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t *v38;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v40;
  _QWORD *v41;
  _QWORD *v42;
  _QWORD v44[2];
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t (*v50)(xpc_object_t);
  xpc_object_t v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;

  v45 = a8;
  v50 = a7;
  v48 = a4;
  v14 = *(_QWORD *)(a5 - 8);
  v15 = MEMORY[0x24BDAC7A8](a1);
  v17 = (char *)v44 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = MEMORY[0x24BDAC7A8](v15);
  v20 = (char *)v44 - v19;
  v54 = v18;
  sub_23A233840();
  v21 = sub_23A233150();
  swift_bridgeObjectRelease();
  v47 = a3;
  v22 = xpc_dictionary_get_value(a3, (const char *)(v21 + 32));
  swift_release();
  v51 = v22;
  if (v22)
  {
    v46 = a6;
    v23 = v14;
    v24 = *(void (**)(char *, uint64_t, uint64_t))(v14 + 16);
    v25 = v54;
    v54 = a5;
    v24(v20, v25, a5);
    v26 = (uint64_t *)(a2 + 16);
    swift_beginAccess();
    v27 = *(_QWORD **)(a2 + 16);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v29 = a2;
    *(_QWORD *)(a2 + 16) = v27;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v27 = sub_23A22DD14(0, v27[2] + 1, 1, v27);
      *v26 = (uint64_t)v27;
    }
    v31 = v27[2];
    v30 = v27[3];
    if (v31 >= v30 >> 1)
      *v26 = (uint64_t)sub_23A22DD14((_QWORD *)(v30 > 1), v31 + 1, 1, v27);
    v32 = v54;
    v24(v17, (uint64_t)v20, v54);
    sub_23A22DF58(v31, (uint64_t)v17, v26, v32, v46);
    (*(void (**)(char *, uint64_t))(v23 + 8))(v20, v32);
    v33 = (uint64_t *)v29;
    v34 = v49;
    v35 = v50(v51);
    if (v34)
    {
      sub_23A22D0A8(v29);
LABEL_12:
      swift_unknownObjectRelease();
      return v33;
    }
    v33 = (uint64_t *)v35;
    if ((v35 & 0x10000) != 0)
    {
      v49 = a9;
      v50 = a10;
      v40 = sub_23A23333C();
      swift_allocError();
      v42 = v41;
      v44[1] = (char *)v41 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256953390) + 48);
      *v42 = v45;
      v52 = 0;
      v53 = 0xE000000000000000;
      swift_bridgeObjectRetain();
      v33 = &v52;
      sub_23A233300();
      swift_bridgeObjectRelease();
      sub_23A233330();
      (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v40 - 8) + 104))(v42, *MEMORY[0x24BEE26E0], v40);
      swift_willThrow();
      sub_23A22D0A8(v29);
      goto LABEL_12;
    }
    sub_23A22D0A8(v29);
    swift_unknownObjectRelease();
  }
  else
  {
    v36 = sub_23A23333C();
    swift_allocError();
    v38 = v37;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256953680);
    v38[3] = a5;
    v38[4] = a6;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v38);
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(v14 + 16))(boxed_opaque_existential_1, v54, a5);
    swift_beginAccess();
    v52 = 0;
    v53 = 0xE000000000000000;
    swift_bridgeObjectRetain();
    v33 = &v52;
    sub_23A233300();
    sub_23A233174();
    sub_23A233654();
    sub_23A233174();
    sub_23A233330();
    (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v36 - 8) + 104))(v38, *MEMORY[0x24BEE26C8], v36);
    swift_willThrow();
  }
  return v33;
}

uint64_t *sub_23A22B09C(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t (*a7)(xpc_object_t), uint64_t a8, uint64_t a9, uint64_t (*a10)(xpc_object_t))
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  xpc_object_t v22;
  uint64_t v23;
  void (*v24)(char *, uint64_t, uint64_t);
  uint64_t v25;
  uint64_t *v26;
  _QWORD *v27;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t *v38;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v40;
  _QWORD *v41;
  _QWORD *v42;
  _QWORD v44[2];
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t (*v50)(xpc_object_t);
  xpc_object_t v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;

  v45 = a8;
  v50 = a7;
  v48 = a4;
  v14 = *(_QWORD *)(a5 - 8);
  v15 = MEMORY[0x24BDAC7A8](a1);
  v17 = (char *)v44 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = MEMORY[0x24BDAC7A8](v15);
  v20 = (char *)v44 - v19;
  v54 = v18;
  sub_23A233840();
  v21 = sub_23A233150();
  swift_bridgeObjectRelease();
  v47 = a3;
  v22 = xpc_dictionary_get_value(a3, (const char *)(v21 + 32));
  swift_release();
  v51 = v22;
  if (v22)
  {
    v46 = a6;
    v23 = v14;
    v24 = *(void (**)(char *, uint64_t, uint64_t))(v14 + 16);
    v25 = v54;
    v54 = a5;
    v24(v20, v25, a5);
    v26 = (uint64_t *)(a2 + 16);
    swift_beginAccess();
    v27 = *(_QWORD **)(a2 + 16);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v29 = a2;
    *(_QWORD *)(a2 + 16) = v27;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v27 = sub_23A22DD14(0, v27[2] + 1, 1, v27);
      *v26 = (uint64_t)v27;
    }
    v31 = v27[2];
    v30 = v27[3];
    if (v31 >= v30 >> 1)
      *v26 = (uint64_t)sub_23A22DD14((_QWORD *)(v30 > 1), v31 + 1, 1, v27);
    v32 = v54;
    v24(v17, (uint64_t)v20, v54);
    sub_23A22DF58(v31, (uint64_t)v17, v26, v32, v46);
    (*(void (**)(char *, uint64_t))(v23 + 8))(v20, v32);
    v33 = (uint64_t *)v29;
    v34 = v49;
    v35 = v50(v51);
    if (v34)
    {
      sub_23A22D0A8(v29);
LABEL_12:
      swift_unknownObjectRelease();
      return v33;
    }
    v33 = (uint64_t *)v35;
    if ((v35 & 0x100000000) != 0)
    {
      v49 = a9;
      v50 = a10;
      v40 = sub_23A23333C();
      swift_allocError();
      v42 = v41;
      v44[1] = (char *)v41 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256953390) + 48);
      *v42 = v45;
      v52 = 0;
      v53 = 0xE000000000000000;
      swift_bridgeObjectRetain();
      v33 = &v52;
      sub_23A233300();
      swift_bridgeObjectRelease();
      sub_23A233330();
      (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v40 - 8) + 104))(v42, *MEMORY[0x24BEE26E0], v40);
      swift_willThrow();
      sub_23A22D0A8(v29);
      goto LABEL_12;
    }
    sub_23A22D0A8(v29);
    swift_unknownObjectRelease();
  }
  else
  {
    v36 = sub_23A23333C();
    swift_allocError();
    v38 = v37;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256953680);
    v38[3] = a5;
    v38[4] = a6;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v38);
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(v14 + 16))(boxed_opaque_existential_1, v54, a5);
    swift_beginAccess();
    v52 = 0;
    v53 = 0xE000000000000000;
    swift_bridgeObjectRetain();
    v33 = &v52;
    sub_23A233300();
    sub_23A233174();
    sub_23A233654();
    sub_23A233174();
    sub_23A233330();
    (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v36 - 8) + 104))(v38, *MEMORY[0x24BEE26C8], v36);
    swift_willThrow();
  }
  return v33;
}

uint64_t *sub_23A22B4D0(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  xpc_object_t v18;
  xpc_object_t v19;
  void (*v20)(char *, uint64_t, uint64_t);
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  char isUniquelyReferenced_nonNull_native;
  void *v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  char *v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t *v35;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v37;
  _QWORD *v38;
  _QWORD *v39;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;

  v44 = a4;
  v10 = *(_QWORD *)(a5 - 8);
  v11 = MEMORY[0x24BDAC7A8](a1);
  v13 = (char *)&v41 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x24BDAC7A8](v11);
  v16 = (char *)&v41 - v15;
  v48 = v14;
  sub_23A233840();
  v17 = sub_23A233150();
  swift_bridgeObjectRelease();
  v43 = a3;
  v18 = xpc_dictionary_get_value(a3, (const char *)(v17 + 32));
  swift_release();
  if (!v18)
  {
    v33 = sub_23A23333C();
    swift_allocError();
    v35 = v34;
    v45 = (char *)v34 + *(int *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256953680) + 48);
    v35[3] = a5;
    v35[4] = a6;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v35);
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(v10 + 16))(boxed_opaque_existential_1, v48, a5);
    swift_beginAccess();
    v46 = 0;
    v47 = 0xE000000000000000;
    swift_bridgeObjectRetain();
    v29 = &v46;
    sub_23A233300();
    sub_23A233174();
    sub_23A233654();
    sub_23A233174();
    sub_23A233330();
    (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v33 - 8) + 104))(v35, *MEMORY[0x24BEE26C8], v33);
    swift_willThrow();
    return v29;
  }
  v19 = v18;
  v41 = v10;
  v42 = a6;
  v20 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  v21 = a5;
  v20(v16, v48, a5);
  v22 = (_QWORD *)(a2 + 16);
  swift_beginAccess();
  v23 = *(_QWORD **)(a2 + 16);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)(a2 + 16) = v23;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v23 = sub_23A22DD14(0, v23[2] + 1, 1, v23);
    *v22 = v23;
  }
  v25 = v19;
  v27 = v23[2];
  v26 = v23[3];
  if (v27 >= v26 >> 1)
    *v22 = sub_23A22DD14((_QWORD *)(v26 > 1), v27 + 1, 1, v23);
  v20(v13, (uint64_t)v16, v21);
  sub_23A22DF58(v27, (uint64_t)v13, (uint64_t *)(a2 + 16), v21, v42);
  (*(void (**)(char *, uint64_t))(v41 + 8))(v16, v21);
  v28 = MEMORY[0x24BEE4568];
  v29 = (uint64_t *)a2;
  v30 = v45;
  v31 = sub_23A22EA98(v25, 0x3436746E4955, 0xE600000000000000, MEMORY[0x24BEE4568]);
  if (v30)
  {
LABEL_11:
    sub_23A22D0A8(a2);
    swift_unknownObjectRelease();
    return v29;
  }
  if ((v32 & 1) != 0)
  {
    v37 = sub_23A23333C();
    swift_allocError();
    v39 = v38;
    v48 = (uint64_t)v38 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256953390) + 48);
    *v39 = v28;
    v46 = 0;
    v47 = 0xE000000000000000;
    swift_bridgeObjectRetain();
    v29 = &v46;
    sub_23A233300();
    swift_bridgeObjectRelease();
    sub_23A233330();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v37 - 8) + 104))(v39, *MEMORY[0x24BEE26E0], v37);
    swift_willThrow();
    goto LABEL_11;
  }
  v29 = (uint64_t *)v31;
  sub_23A22D0A8(a2);
  swift_unknownObjectRelease();
  return v29;
}

float sub_23A22B8F0(uint64_t a1, uint64_t a2, void *a3, char *a4, uint64_t a5, uint64_t a6)
{
  float value;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  xpc_object_t v19;
  void *v20;
  uint64_t *v21;
  _QWORD *v22;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t *v37;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v39;
  _QWORD *v40;
  _QWORD *v41;
  uint64_t v42;
  uint64_t v44;
  void (*v45)(char *, uint64_t, uint64_t);
  uint64_t v46;
  uint64_t v47;
  void *v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;

  v49 = a4;
  v11 = *(_QWORD *)(a5 - 8);
  v12 = MEMORY[0x24BDAC7A8](a1);
  v14 = (char *)&v44 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x24BDAC7A8](v12);
  v17 = (char *)&v44 - v16;
  v50 = v15;
  sub_23A233840();
  v18 = sub_23A233150();
  swift_bridgeObjectRelease();
  v48 = a3;
  v19 = xpc_dictionary_get_value(a3, (const char *)(v18 + 32));
  swift_release();
  if (v19)
  {
    v20 = v19;
    v46 = a5;
    v47 = a6;
    v45 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
    v45(v17, v50, a5);
    v21 = (uint64_t *)(a2 + 16);
    swift_beginAccess();
    v22 = *(_QWORD **)(a2 + 16);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v50 = a2;
    *(_QWORD *)(a2 + 16) = v22;
    v24 = v11;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v22 = sub_23A22DD14(0, v22[2] + 1, 1, v22);
      *v21 = (uint64_t)v22;
    }
    v25 = (uint64_t)v19;
    v27 = v22[2];
    v26 = v22[3];
    if (v27 >= v26 >> 1)
      *v21 = (uint64_t)sub_23A22DD14((_QWORD *)(v26 > 1), v27 + 1, 1, v22);
    v28 = v46;
    v45(v14, (uint64_t)v17, v46);
    sub_23A22DF58(v27, (uint64_t)v14, v21, v28, v47);
    (*(void (**)(char *, uint64_t))(v24 + 8))(v17, v28);
    v29 = MEMORY[0x23B845B54](v20);
    if (v29 == sub_23A233024())
    {
      v39 = sub_23A23333C();
      swift_allocError();
      v41 = v40;
      __swift_instantiateConcreteTypeFromMangledName(&qword_256953390);
      v45 = (void (*)(char *, uint64_t, uint64_t))v25;
      *v41 = MEMORY[0x24BEE14E8];
      v42 = v50;
      v51 = 0;
      v52 = 0xE000000000000000;
      swift_bridgeObjectRetain();
      sub_23A233300();
      swift_bridgeObjectRelease();
      sub_23A233330();
      (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v39 - 8) + 104))(v41, *MEMORY[0x24BEE26E0], v39);
      swift_willThrow();
      sub_23A22D0A8(v42);
    }
    else
    {
      v30 = MEMORY[0x23B845B54](v20);
      v31 = sub_23A233054();
      v32 = v50;
      if (v30 == v31)
      {
        value = xpc_double_get_value(v20);
        sub_23A22D0A8(v32);
        swift_unknownObjectRelease();
        return value;
      }
      sub_23A23333C();
      swift_allocError();
      v34 = v33;
      swift_bridgeObjectRetain();
      sub_23A225434(MEMORY[0x24BEE14E8], v25, v34);
      swift_bridgeObjectRelease();
      swift_willThrow();
      sub_23A22D0A8(v32);
    }
    swift_unknownObjectRelease();
  }
  else
  {
    v35 = sub_23A23333C();
    swift_allocError();
    v37 = v36;
    v49 = (char *)v36 + *(int *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256953680) + 48);
    v37[3] = a5;
    v37[4] = a6;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v37);
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(v11 + 16))(boxed_opaque_existential_1, v50, a5);
    swift_beginAccess();
    v51 = 0;
    v52 = 0xE000000000000000;
    swift_bridgeObjectRetain();
    sub_23A233300();
    sub_23A233174();
    sub_23A233654();
    sub_23A233174();
    sub_23A233330();
    (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v35 - 8) + 104))(v37, *MEMORY[0x24BEE26C8], v35);
    swift_willThrow();
  }
  return value;
}

double sub_23A22BDAC(uint64_t a1, uint64_t a2, void *a3, char *a4, uint64_t a5, uint64_t a6)
{
  double value;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  xpc_object_t v19;
  void *v20;
  uint64_t *v21;
  _QWORD *v22;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t *v37;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v39;
  _QWORD *v40;
  _QWORD *v41;
  uint64_t v42;
  uint64_t v44;
  void (*v45)(char *, uint64_t, uint64_t);
  uint64_t v46;
  uint64_t v47;
  void *v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;

  v49 = a4;
  v11 = *(_QWORD *)(a5 - 8);
  v12 = MEMORY[0x24BDAC7A8](a1);
  v14 = (char *)&v44 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x24BDAC7A8](v12);
  v17 = (char *)&v44 - v16;
  v50 = v15;
  sub_23A233840();
  v18 = sub_23A233150();
  swift_bridgeObjectRelease();
  v48 = a3;
  v19 = xpc_dictionary_get_value(a3, (const char *)(v18 + 32));
  swift_release();
  if (v19)
  {
    v20 = v19;
    v46 = a5;
    v47 = a6;
    v45 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
    v45(v17, v50, a5);
    v21 = (uint64_t *)(a2 + 16);
    swift_beginAccess();
    v22 = *(_QWORD **)(a2 + 16);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v50 = a2;
    *(_QWORD *)(a2 + 16) = v22;
    v24 = v11;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v22 = sub_23A22DD14(0, v22[2] + 1, 1, v22);
      *v21 = (uint64_t)v22;
    }
    v25 = (uint64_t)v19;
    v27 = v22[2];
    v26 = v22[3];
    if (v27 >= v26 >> 1)
      *v21 = (uint64_t)sub_23A22DD14((_QWORD *)(v26 > 1), v27 + 1, 1, v22);
    v28 = v46;
    v45(v14, (uint64_t)v17, v46);
    sub_23A22DF58(v27, (uint64_t)v14, v21, v28, v47);
    (*(void (**)(char *, uint64_t))(v24 + 8))(v17, v28);
    v29 = MEMORY[0x23B845B54](v20);
    if (v29 == sub_23A233024())
    {
      v39 = sub_23A23333C();
      swift_allocError();
      v41 = v40;
      __swift_instantiateConcreteTypeFromMangledName(&qword_256953390);
      v45 = (void (*)(char *, uint64_t, uint64_t))v25;
      *v41 = MEMORY[0x24BEE13C8];
      v42 = v50;
      v51 = 0;
      v52 = 0xE000000000000000;
      swift_bridgeObjectRetain();
      sub_23A233300();
      swift_bridgeObjectRelease();
      sub_23A233330();
      (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v39 - 8) + 104))(v41, *MEMORY[0x24BEE26E0], v39);
      swift_willThrow();
      sub_23A22D0A8(v42);
    }
    else
    {
      v30 = MEMORY[0x23B845B54](v20);
      v31 = sub_23A233054();
      v32 = v50;
      if (v30 == v31)
      {
        value = xpc_double_get_value(v20);
        sub_23A22D0A8(v32);
        swift_unknownObjectRelease();
        return value;
      }
      sub_23A23333C();
      swift_allocError();
      v34 = v33;
      swift_bridgeObjectRetain();
      sub_23A225434(MEMORY[0x24BEE13C8], v25, v34);
      swift_bridgeObjectRelease();
      swift_willThrow();
      sub_23A22D0A8(v32);
    }
    swift_unknownObjectRelease();
  }
  else
  {
    v35 = sub_23A23333C();
    swift_allocError();
    v37 = v36;
    v49 = (char *)v36 + *(int *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256953680) + 48);
    v37[3] = a5;
    v37[4] = a6;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v37);
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(v11 + 16))(boxed_opaque_existential_1, v50, a5);
    swift_beginAccess();
    v51 = 0;
    v52 = 0xE000000000000000;
    swift_bridgeObjectRetain();
    sub_23A233300();
    sub_23A233174();
    sub_23A233654();
    sub_23A233174();
    sub_23A233330();
    (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v35 - 8) + 104))(v37, *MEMORY[0x24BEE26C8], v35);
    swift_willThrow();
  }
  return value;
}

uint64_t *sub_23A22C268(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  void (*v19)(char *, uint64_t, uint64_t);
  uint64_t v20;
  uint64_t *v21;
  _QWORD *v22;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t *v35;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v37;
  _QWORD *v38;
  _QWORD *v39;
  uint64_t v41[3];
  char *v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;

  v41[2] = a4;
  v10 = *(_QWORD *)(a5 - 8);
  v11 = MEMORY[0x24BDAC7A8](a1);
  v13 = (char *)v41 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x24BDAC7A8](v11);
  v16 = (char *)v41 - v15;
  v45 = v14;
  sub_23A233840();
  v17 = sub_23A233150();
  swift_bridgeObjectRelease();
  v41[1] = (uint64_t)a3;
  v18 = xpc_dictionary_get_value(a3, (const char *)(v17 + 32));
  swift_release();
  v42 = v18;
  if (v18)
  {
    v41[0] = a6;
    v19 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
    v20 = v45;
    v45 = a5;
    v19(v16, v20, a5);
    v21 = (uint64_t *)(a2 + 16);
    swift_beginAccess();
    v22 = *(_QWORD **)(a2 + 16);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v24 = a2;
    *(_QWORD *)(a2 + 16) = v22;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v22 = sub_23A22DD14(0, v22[2] + 1, 1, v22);
      *v21 = (uint64_t)v22;
    }
    v26 = v22[2];
    v25 = v22[3];
    v27 = v45;
    if (v26 >= v25 >> 1)
      *v21 = (uint64_t)sub_23A22DD14((_QWORD *)(v25 > 1), v26 + 1, 1, v22);
    v19(v13, (uint64_t)v16, v27);
    sub_23A22DF58(v26, (uint64_t)v13, v21, v27, v41[0]);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v16, v27);
    v28 = v42;
    v29 = MEMORY[0x23B845B54](v42);
    if (v29 == sub_23A233024())
      goto LABEL_12;
    v30 = MEMORY[0x23B845B54](v28);
    if (v30 != sub_23A233060())
    {
      sub_23A23333C();
      swift_allocError();
      v32 = v31;
      swift_bridgeObjectRetain();
      sub_23A225434(MEMORY[0x24BEE0D00], (uint64_t)v28, v32);
      swift_bridgeObjectRelease();
      swift_willThrow();
      sub_23A22D0A8(v24);
LABEL_13:
      swift_unknownObjectRelease();
      return v21;
    }
    if (!xpc_string_get_string_ptr(v28))
    {
LABEL_12:
      v37 = sub_23A23333C();
      swift_allocError();
      v39 = v38;
      __swift_instantiateConcreteTypeFromMangledName(&qword_256953390);
      *v39 = MEMORY[0x24BEE0D00];
      v43 = 0;
      v44 = 0xE000000000000000;
      swift_bridgeObjectRetain();
      v21 = &v43;
      sub_23A233300();
      swift_bridgeObjectRelease();
      sub_23A233330();
      (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v37 - 8) + 104))(v39, *MEMORY[0x24BEE26E0], v37);
      swift_willThrow();
      sub_23A22D0A8(v24);
      goto LABEL_13;
    }
    v21 = (uint64_t *)sub_23A233180();
    sub_23A22D0A8(v24);
    swift_unknownObjectRelease();
  }
  else
  {
    v33 = sub_23A23333C();
    swift_allocError();
    v35 = v34;
    v42 = (char *)v34 + *(int *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256953680) + 48);
    v35[3] = a5;
    v35[4] = a6;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v35);
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(v10 + 16))(boxed_opaque_existential_1, v45, a5);
    swift_beginAccess();
    v43 = 0;
    v44 = 0xE000000000000000;
    swift_bridgeObjectRetain();
    v21 = &v43;
    sub_23A233300();
    sub_23A233174();
    sub_23A233654();
    sub_23A233174();
    sub_23A233330();
    (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v33 - 8) + 104))(v35, *MEMORY[0x24BEE26C8], v33);
    swift_willThrow();
  }
  return v21;
}

uint64_t sub_23A22C71C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10)
{
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  xpc_object_t v25;
  xpc_object_t v26;
  uint64_t v27;
  void (*v28)(char *, uint64_t, uint64_t);
  uint64_t *v29;
  _QWORD *v30;
  char isUniquelyReferenced_nonNull_native;
  void *v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t *v42;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v45;
  uint64_t v46;
  _QWORD *v47;
  _QWORD *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;

  v56 = a5;
  v51 = a9;
  v52 = a1;
  v59 = a7;
  v15 = sub_23A23327C();
  v49 = *(_QWORD *)(v15 - 8);
  v50 = v15;
  v16 = MEMORY[0x24BDAC7A8](v15);
  v58 = (uint64_t)&v49 - v17;
  v18 = *(_QWORD *)(a6 - 8);
  v19 = MEMORY[0x24BDAC7A8](v16);
  v21 = (char *)&v49 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v19);
  v23 = (char *)&v49 - v22;
  v62 = a2;
  sub_23A233840();
  v24 = sub_23A233150();
  swift_bridgeObjectRelease();
  v55 = a4;
  v25 = xpc_dictionary_get_value(a4, (const char *)(v24 + 32));
  swift_release();
  if (!v25)
  {
    v40 = sub_23A23333C();
    swift_allocError();
    v42 = v41;
    v59 = (uint64_t)v41 + *(int *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256953680) + 48);
    v42[3] = a6;
    v42[4] = a8;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v42);
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(v18 + 16))(boxed_opaque_existential_1, v62, a6);
    swift_beginAccess();
    v60 = 0;
    v61 = 0xE000000000000000;
    swift_bridgeObjectRetain();
    sub_23A233300();
    sub_23A233174();
    sub_23A233654();
    sub_23A233174();
    sub_23A233330();
    (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v40 - 8) + 104))(v42, *MEMORY[0x24BEE26C8], v40);
    return swift_willThrow();
  }
  v26 = v25;
  v53 = a10;
  v54 = a8;
  v27 = v18;
  v28 = *(void (**)(char *, uint64_t, uint64_t))(v18 + 16);
  v28(v23, v62, a6);
  v29 = (uint64_t *)(a3 + 16);
  swift_beginAccess();
  v30 = *(_QWORD **)(a3 + 16);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v62 = a3;
  *(_QWORD *)(a3 + 16) = v30;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v30 = sub_23A22DD14(0, v30[2] + 1, 1, v30);
    *v29 = (uint64_t)v30;
  }
  v32 = v26;
  v34 = v30[2];
  v33 = v30[3];
  if (v34 >= v33 >> 1)
    *v29 = (uint64_t)sub_23A22DD14((_QWORD *)(v33 > 1), v34 + 1, 1, v30);
  v28(v21, (uint64_t)v23, a6);
  sub_23A22DF58(v34, (uint64_t)v21, v29, a6, v54);
  (*(void (**)(char *, uint64_t))(v27 + 8))(v23, a6);
  v35 = v58;
  v36 = v59;
  v37 = v62;
  v38 = v57;
  sub_23A225980(v32, v59, v59, v53, v58);
  if (v38)
  {
    v39 = v37;
LABEL_12:
    sub_23A22D0A8(v39);
    return swift_unknownObjectRelease();
  }
  v45 = *(_QWORD *)(v36 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v45 + 48))(v35, 1, v36) != 1)
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v45 + 32))(v51, v35, v36);
    v39 = v37;
    goto LABEL_12;
  }
  (*(void (**)(uint64_t, uint64_t))(v49 + 8))(v35, v50);
  v46 = sub_23A23333C();
  swift_allocError();
  v48 = v47;
  v58 = (uint64_t)v47 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_256953390) + 48);
  *v48 = v52;
  v60 = 0;
  v61 = 0xE000000000000000;
  swift_bridgeObjectRetain();
  sub_23A233300();
  swift_bridgeObjectRelease();
  v60 = 0x6465746365707845;
  v61 = 0xE900000000000020;
  sub_23A233870();
  sub_23A233174();
  swift_bridgeObjectRelease();
  sub_23A233174();
  sub_23A233330();
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v46 - 8) + 104))(v48, *MEMORY[0x24BEE26E0], v46);
  swift_willThrow();
  sub_23A22D0A8(v37);
  return swift_unknownObjectRelease();
}

uint64_t sub_23A22CC28@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, void *a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X7>, uint64_t a8@<X8>, uint64_t a9)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  void (*v18)(char *);
  uint64_t v19;
  uint64_t *v20;
  _QWORD *v21;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  xpc_object_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t *v34;
  uint64_t *v35;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  xpc_object_t v55;

  v45 = a8;
  v49 = a6;
  v51 = a4;
  v55 = a3;
  v12 = *(_QWORD *)(a5 - 8);
  v13 = MEMORY[0x24BDAC7A8](a1);
  v15 = (char *)&v44 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v44 - v16;
  v18 = *(void (**)(char *))(v12 + 16);
  v50 = v19;
  v18((char *)&v44 - v16);
  v20 = (uint64_t *)(a2 + 16);
  swift_beginAccess();
  v21 = *(_QWORD **)(a2 + 16);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v48 = a2;
  *(_QWORD *)(a2 + 16) = v21;
  v23 = a7;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v21 = sub_23A22DD14(0, v21[2] + 1, 1, v21);
    *v20 = (uint64_t)v21;
  }
  v47 = a9;
  v25 = v21[2];
  v24 = v21[3];
  if (v25 >= v24 >> 1)
    *v20 = (uint64_t)sub_23A22DD14((_QWORD *)(v24 > 1), v25 + 1, 1, v21);
  ((void (*)(char *, char *, uint64_t))v18)(v15, v17, a5);
  v26 = v25;
  v27 = v23;
  sub_23A22DF58(v26, (uint64_t)v15, v20, a5, v23);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v17, a5);
  v28 = v50;
  sub_23A233840();
  v29 = sub_23A233150();
  swift_bridgeObjectRelease();
  v30 = xpc_dictionary_get_value(v55, (const char *)(v29 + 32));
  swift_release();
  if (!v30)
  {
    v45 = sub_23A23333C();
    v46 = swift_allocError();
    v35 = v34;
    v44 = (char *)v34 + *(int *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256953680) + 48);
    v35[3] = a5;
    v35[4] = v23;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v35);
    ((void (*)(uint64_t *, uint64_t, uint64_t))v18)(boxed_opaque_existential_1, v28, a5);
    v52 = 0;
    v53 = 0xE000000000000000;
    swift_bridgeObjectRetain();
    sub_23A233300();
    sub_23A233174();
    sub_23A233468();
    sub_23A233870();
    sub_23A233174();
    swift_bridgeObjectRelease();
    sub_23A233174();
    sub_23A233654();
    sub_23A233330();
    (*(void (**)(uint64_t *, _QWORD))(*(_QWORD *)(v45 - 8) + 104))(v35, *MEMORY[0x24BEE26C8]);
    swift_willThrow();
    return sub_23A22D0A8(v48);
  }
  v31 = MEMORY[0x23B845B54](v30);
  if (v31 != sub_23A233078())
  {
    v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569535E0);
    sub_23A23333C();
    swift_allocError();
    sub_23A225434(v32, (uint64_t)v30, v33);
    swift_willThrow();
    swift_unknownObjectRelease();
    return sub_23A22D0A8(v48);
  }
  v38 = v48;
  swift_retain();
  swift_unknownObjectRetain();
  v52 = sub_23A22558C(v38, (uint64_t)v30);
  v53 = v39;
  v54 = v40;
  v42 = type metadata accessor for _XPCKeyedDecodingContainer(0, v49, v47, v41);
  v50 = v27;
  v43 = v42;
  swift_retain();
  swift_unknownObjectRetain();
  swift_bridgeObjectRetain();
  MEMORY[0x23B8459BC](&unk_23A235D00, v43);
  sub_23A233474();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  swift_unknownObjectRelease();
  return sub_23A22D0A8(v38);
}

uint64_t sub_23A22D0A8(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;

  v2 = (_QWORD *)(a1 + 16);
  swift_beginAccess();
  v3 = *(_QWORD **)(a1 + 16);
  if (!v3[2])
  {
    __break(1u);
LABEL_6:
    result = (uint64_t)sub_23A22DF44(v3);
    v3 = (_QWORD *)result;
    v5 = *(_QWORD *)(result + 16);
    if (v5)
      goto LABEL_4;
    goto LABEL_7;
  }
  result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) == 0)
    goto LABEL_6;
  v5 = v3[2];
  if (v5)
  {
LABEL_4:
    v6 = v5 - 1;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v3[5 * v5 - 1]);
    v3[2] = v6;
    *v2 = v3;
    return swift_endAccess();
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t sub_23A22D14C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  void (*v16)(char *);
  uint64_t v17;
  uint64_t *v18;
  _QWORD *v19;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  xpc_object_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t *v36;
  uint64_t *boxed_opaque_existential_1;
  uint64_t result;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD *v42;
  _QWORD *v43;
  _QWORD v44[2];
  uint64_t v45;
  uint64_t v46;
  xpc_object_t v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;

  v44[0] = a7;
  v50 = a4;
  v47 = a3;
  v10 = *(_QWORD *)(a5 - 8);
  v11 = MEMORY[0x24BDAC7A8](a1);
  v13 = (char *)v44 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)v44 - v14;
  v16 = *(void (**)(char *))(v10 + 16);
  v45 = v17;
  v16((char *)v44 - v14);
  v18 = (uint64_t *)(a2 + 16);
  swift_beginAccess();
  v19 = *(_QWORD **)(a2 + 16);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v46 = a2;
  *(_QWORD *)(a2 + 16) = v19;
  v21 = a6;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v19 = sub_23A22DD14(0, v19[2] + 1, 1, v19);
    *v18 = (uint64_t)v19;
  }
  v23 = v19[2];
  v22 = v19[3];
  if (v23 >= v22 >> 1)
    *v18 = (uint64_t)sub_23A22DD14((_QWORD *)(v22 > 1), v23 + 1, 1, v19);
  ((void (*)(char *, char *, uint64_t))v16)(v13, v15, a5);
  v24 = v23;
  v25 = v21;
  sub_23A22DF58(v24, (uint64_t)v13, v18, a5, v21);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v15, a5);
  v26 = v45;
  sub_23A233840();
  v27 = sub_23A233150();
  swift_bridgeObjectRelease();
  v28 = xpc_dictionary_get_value(v47, (const char *)(v27 + 32));
  swift_release();
  if (!v28)
  {
    v34 = sub_23A23333C();
    v44[1] = swift_allocError();
    v36 = v35;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256953680);
    v36[3] = a5;
    v36[4] = v25;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v36);
    ((void (*)(uint64_t *, uint64_t, uint64_t))v16)(boxed_opaque_existential_1, v26, a5);
    v48 = 0;
    v49 = 0xE000000000000000;
    swift_bridgeObjectRetain();
    sub_23A233300();
    sub_23A233174();
    sub_23A233654();
    sub_23A233174();
    sub_23A233330();
    (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v34 - 8) + 104))(v36, *MEMORY[0x24BEE26C8], v34);
    swift_willThrow();
    v31 = v46;
    return sub_23A22D0A8(v31);
  }
  v29 = MEMORY[0x23B845B54](v28);
  v30 = sub_23A23303C();
  v31 = v46;
  if (v29 != v30)
  {
    v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569535C8);
    sub_23A23333C();
    swift_allocError();
    sub_23A225434(v32, (uint64_t)v28, v33);
    swift_willThrow();
    swift_unknownObjectRelease();
    return sub_23A22D0A8(v31);
  }
  swift_retain();
  v39 = swift_unknownObjectRetain();
  v40 = MEMORY[0x23B845B54](v39);
  if (v40 == sub_23A23303C())
  {
    v41 = *(_QWORD *)(v31 + 16);
    v42 = (_QWORD *)v44[0];
    *(_QWORD *)(v44[0] + 24) = &type metadata for _XPCUnkeyedDecodingContainer;
    v42[4] = sub_23A22F6D0();
    v43 = (_QWORD *)swift_allocObject();
    *v42 = v43;
    swift_bridgeObjectRetain();
    swift_unknownObjectRelease();
    v43[2] = v31;
    v43[3] = v28;
    v43[4] = v41;
    v43[5] = 0;
    return sub_23A22D0A8(v31);
  }
  else
  {
    result = sub_23A2333CC();
    __break(1u);
  }
  return result;
}

void sub_23A22D590()
{
  sub_23A2333CC();
  __break(1u);
}

void sub_23A22D5D8()
{
  sub_23A2333CC();
  __break(1u);
}

uint64_t sub_23A22D620(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_23A229264(a1, *(void **)(v3 + 8), a3, *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24));
}

BOOL sub_23A22D62C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_23A2294C4(a1, a2, *(void **)(v2 + 8));
}

BOOL sub_23A22D638(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  return sub_23A229540(a1, *(_QWORD *)v4, *(void **)(v4 + 8), a4, *(_QWORD *)(a2 + 16), *(_QWORD *)(a2 + 24));
}

uint64_t sub_23A22D65C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_23A229728(a1, *(_QWORD *)v2, *(void **)(v2 + 8), *(char **)(v2 + 16), *(_QWORD *)(a2 + 16), *(_QWORD *)(a2 + 24)) & 1;
}

uint64_t *sub_23A22D684(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_23A22C268(a1, *(_QWORD *)v2, *(void **)(v2 + 8), *(_QWORD *)(v2 + 16), *(_QWORD *)(a2 + 16), *(_QWORD *)(a2 + 24));
}

double sub_23A22D6A8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_23A22BDAC(a1, *(_QWORD *)v2, *(void **)(v2 + 8), *(char **)(v2 + 16), *(_QWORD *)(a2 + 16), *(_QWORD *)(a2 + 24));
}

float sub_23A22D6CC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_23A22B8F0(a1, *(_QWORD *)v2, *(void **)(v2 + 8), *(char **)(v2 + 16), *(_QWORD *)(a2 + 16), *(_QWORD *)(a2 + 24));
}

uint64_t sub_23A22D6F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23A22D99C(a1, a2, a3, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_23A229BDC);
}

uint64_t *sub_23A22D70C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23A22D848(a1, a2, a3, sub_23A22E158, MEMORY[0x24BEE3E50], 0xD00000000000002BLL, (uint64_t (*)(xpc_object_t))0x800000023A238810);
}

uint64_t *sub_23A22D748(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23A22D8C4(a1, a2, a3, sub_23A22E3A0, MEMORY[0x24BEE3F30], 0xD00000000000002CLL, (uint64_t (*)(xpc_object_t))0x800000023A2387E0);
}

uint64_t *sub_23A22D784(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23A22D940(a1, a2, a3, (uint64_t (*)(xpc_object_t))sub_23A22E5EC, MEMORY[0x24BEE3F88], 0xD00000000000002CLL, (uint64_t (*)(xpc_object_t))0x800000023A2387B0);
}

uint64_t sub_23A22D7C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23A22D99C(a1, a2, a3, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_23A229FF8);
}

uint64_t sub_23A22D7DC()
{
  return sub_23A2336FC();
}

uint64_t sub_23A22D7F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23A22D99C(a1, a2, a3, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_23A22A418);
}

uint64_t *sub_23A22D80C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23A22D848(a1, a2, a3, sub_23A22ECF0, MEMORY[0x24BEE4260], 0xD00000000000002CLL, (uint64_t (*)(xpc_object_t))0x800000023A238720);
}

uint64_t *sub_23A22D848(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(xpc_object_t), uint64_t a5, uint64_t a6, uint64_t (*a7)(xpc_object_t))
{
  uint64_t v7;

  return sub_23A22A834(a1, *(_QWORD *)v7, *(void **)(v7 + 8), *(_QWORD *)(v7 + 16), *(_QWORD *)(a2 + 16), *(_QWORD *)(a2 + 24), a4, a5, a6, a7);
}

uint64_t *sub_23A22D888(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23A22D8C4(a1, a2, a3, sub_23A22EF3C, MEMORY[0x24BEE4478], 0xD00000000000002DLL, (uint64_t (*)(xpc_object_t))0x800000023A2386F0);
}

uint64_t *sub_23A22D8C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(xpc_object_t), uint64_t a5, uint64_t a6, uint64_t (*a7)(xpc_object_t))
{
  uint64_t v7;

  return sub_23A22AC68(a1, *(_QWORD *)v7, *(void **)(v7 + 8), *(_QWORD *)(v7 + 16), *(_QWORD *)(a2 + 16), *(_QWORD *)(a2 + 24), a4, a5, a6, a7);
}

uint64_t *sub_23A22D904(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23A22D940(a1, a2, a3, (uint64_t (*)(xpc_object_t))sub_23A22F188, MEMORY[0x24BEE44F0], 0xD00000000000002DLL, (uint64_t (*)(xpc_object_t))0x800000023A2386C0);
}

uint64_t *sub_23A22D940(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(xpc_object_t), uint64_t a5, uint64_t a6, uint64_t (*a7)(xpc_object_t))
{
  uint64_t v7;

  return sub_23A22B09C(a1, *(_QWORD *)v7, *(void **)(v7 + 8), *(_QWORD *)(v7 + 16), *(_QWORD *)(a2 + 16), *(_QWORD *)(a2 + 24), a4, a5, a6, a7);
}

uint64_t sub_23A22D980(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23A22D99C(a1, a2, a3, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_23A22B4D0);
}

uint64_t sub_23A22D99C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  _QWORD *v4;

  return a4(a1, *v4, v4[1], v4[2], *(_QWORD *)(a2 + 16), *(_QWORD *)(a2 + 24));
}

uint64_t sub_23A22D9C4()
{
  return sub_23A233708();
}

uint64_t sub_23A22D9D8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v6;

  return sub_23A22C71C(a1, a2, *(_QWORD *)v6, *(void **)(v6 + 8), *(_QWORD *)(v6 + 16), *(_QWORD *)(a5 + 16), a3, *(_QWORD *)(a5 + 24), a6, a4);
}

uint64_t sub_23A22DA10()
{
  return sub_23A2336A8();
}

uint64_t sub_23A22DA24()
{
  return sub_23A23369C();
}

uint64_t sub_23A22DA38()
{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;

  result = sub_23A2336B4();
  if (v0)
    return v2;
  return result;
}

uint64_t sub_23A22DA58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23A22DBE8(a1, a2, a3, MEMORY[0x24BEE3C00]);
}

uint64_t sub_23A22DA74()
{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;

  result = sub_23A2336C0();
  if (v0)
    return v2;
  return result;
}

uint64_t sub_23A22DA94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23A22DB60(a1, a2, a3, MEMORY[0x24BEE3C20]);
}

uint64_t sub_23A22DAB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23A22DBA4(a1, a2, a3, MEMORY[0x24BEE3C28]);
}

uint64_t sub_23A22DACC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23A22DBE8(a1, a2, a3, MEMORY[0x24BEE3C30]);
}

uint64_t sub_23A22DAE8()
{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;

  result = sub_23A2336E4();
  if (v0)
    return v2;
  return result;
}

uint64_t sub_23A22DB08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23A22DC54(a1, a2, a3, MEMORY[0x24BEE3C48]);
}

uint64_t sub_23A22DB24()
{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;

  result = sub_23A2336CC();
  if (v0)
    return v2;
  return result;
}

uint64_t sub_23A22DB44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23A22DB60(a1, a2, a3, MEMORY[0x24BEE3C40]);
}

uint64_t sub_23A22DB60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  return a4() & 0x1FF;
}

uint64_t sub_23A22DB88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23A22DBA4(a1, a2, a3, MEMORY[0x24BEE3C50]);
}

uint64_t sub_23A22DBA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  return a4() & 0x1FFFF;
}

uint64_t sub_23A22DBCC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23A22DBE8(a1, a2, a3, MEMORY[0x24BEE3C58]);
}

uint64_t sub_23A22DBE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  unint64_t v4;

  v4 = a4();
  return v4 | ((HIDWORD(v4) & 1) << 32);
}

uint64_t sub_23A22DC18()
{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;

  result = sub_23A2336F0();
  if (v0)
    return v2;
  return result;
}

uint64_t sub_23A22DC38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23A22DC54(a1, a2, a3, MEMORY[0x24BEE3C68]);
}

uint64_t sub_23A22DC54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v4;
  uint64_t result;
  uint64_t v6;

  result = a4();
  if (v4)
    return v6;
  return result;
}

uint64_t sub_23A22DC78()
{
  return sub_23A2336D8();
}

uint64_t sub_23A22DCA0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  uint64_t v5;

  return sub_23A22CC28(a1, *(_QWORD *)v5, *(void **)(v5 + 8), *(_QWORD *)(v5 + 16), *(_QWORD *)(a4 + 16), a2, *(_QWORD *)(a4 + 24), a5, a3);
}

uint64_t sub_23A22DCD8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;

  return sub_23A22D14C(a1, *(_QWORD *)v3, *(void **)(v3 + 8), *(_QWORD *)(v3 + 16), *(_QWORD *)(a2 + 16), *(_QWORD *)(a2 + 24), a3);
}

void sub_23A22DCFC()
{
  sub_23A22D590();
}

void sub_23A22DD08()
{
  sub_23A22D5D8();
}

_QWORD *sub_23A22DD14(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  size_t v11;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
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
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256952AD0);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v10 + 4 >= &a4[5 * v8 + 4])
      memmove(v10 + 4, a4 + 4, 40 * v8);
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_256953670);
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

_QWORD *sub_23A22DE48(_QWORD *result)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  int64_t v4;
  int64_t v5;
  _QWORD *v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  int64_t v10;

  v2 = result[2];
  v3 = *(_QWORD **)v1;
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 16);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v6 = result;
  result = (_QWORD *)swift_isUniquelyReferenced_nonNull_native();
  if ((_DWORD)result && v5 <= v3[3] >> 1)
  {
    if (v6[2])
      goto LABEL_5;
    goto LABEL_13;
  }
  if (v4 <= v5)
    v10 = v4 + v2;
  else
    v10 = v4;
  result = sub_23A22DD14(result, v10, 1, v3);
  v3 = result;
  if (!v6[2])
  {
LABEL_13:
    if (!v2)
      goto LABEL_14;
    goto LABEL_16;
  }
LABEL_5:
  if ((v3[3] >> 1) - v3[2] < v2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_256953670);
  result = (_QWORD *)swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_14:
    result = (_QWORD *)swift_bridgeObjectRelease();
    *(_QWORD *)v1 = v3;
    return result;
  }
  v7 = v3[2];
  v8 = __OFADD__(v7, v2);
  v9 = v7 + v2;
  if (!v8)
  {
    v3[2] = v9;
    goto LABEL_14;
  }
LABEL_18:
  __break(1u);
  return result;
}

_QWORD *sub_23A22DF44(_QWORD *a1)
{
  return sub_23A22DD14(0, a1[2], 0, a1);
}

uint64_t sub_23A22DF58(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5)
{
  uint64_t *boxed_opaque_existential_1;
  uint64_t v10;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;

  v13 = a4;
  v14 = a5;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v12);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a4 - 8) + 32))(boxed_opaque_existential_1, a2, a4);
  v10 = *a3;
  *(_QWORD *)(v10 + 16) = a1 + 1;
  return sub_23A224F80(&v12, v10 + 40 * a1 + 32);
}

uint64_t sub_23A22DFD0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const _xpc_type_s *v10;

  v2 = MEMORY[0x23B845B54]();
  if (v2 == sub_23A233024())
    return 0x76206C6C756E2061;
  v3 = 0x7265626D756E2061;
  v4 = MEMORY[0x23B845B54](a1);
  if (v4 != sub_23A233048())
  {
    v5 = MEMORY[0x23B845B54](a1);
    if (v5 != sub_23A23306C())
    {
      v6 = MEMORY[0x23B845B54](a1);
      if (v6 == sub_23A233060())
      {
        return 0x676E697274732061;
      }
      else
      {
        v7 = MEMORY[0x23B845B54](a1);
        if (v7 == sub_23A23303C())
        {
          return 0x7961727261206E61;
        }
        else
        {
          v8 = MEMORY[0x23B845B54](a1);
          if (v8 == sub_23A233078())
          {
            return 0x6F69746369642061;
          }
          else
          {
            v9 = MEMORY[0x23B845B54](a1);
            if (v9 == sub_23A233030())
            {
              return 0x646975752061;
            }
            else
            {
              v10 = (const _xpc_type_s *)MEMORY[0x23B845B54](a1);
              xpc_type_get_name(v10);
              return sub_23A233180();
            }
          }
        }
      }
    }
  }
  return v3;
}

uint64_t sub_23A22E158(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  unsigned __int8 value;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v2 = MEMORY[0x23B845B54]();
  v3 = sub_23A233024();
  if (v2 == v3)
  {
    value = 0;
    return value | ((v2 == v3) << 8);
  }
  v4 = MEMORY[0x23B845B54](a1);
  if (v4 == sub_23A233048())
  {
    value = xpc_int64_get_value(a1);
    if (xpc_int64_get_value(a1) != (char)value)
    {
      v9 = sub_23A23333C();
      swift_allocError();
      v11 = v10;
      swift_beginAccess();
      swift_bridgeObjectRetain();
      sub_23A233300();
      swift_bridgeObjectRelease();
      xpc_int64_get_value(a1);
      sub_23A2334E0();
      sub_23A233174();
      swift_bridgeObjectRelease();
      sub_23A233174();
      sub_23A233174();
      sub_23A233174();
      sub_23A233330();
      (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v9 - 8) + 104))(v11, *MEMORY[0x24BEE26D8], v9);
      return swift_willThrow();
    }
    return value | ((v2 == v3) << 8);
  }
  swift_beginAccess();
  sub_23A23333C();
  swift_allocError();
  v6 = v5;
  swift_bridgeObjectRetain();
  sub_23A225434(MEMORY[0x24BEE3E50], (uint64_t)a1, v6);
  swift_bridgeObjectRelease();
  return swift_willThrow();
}

uint64_t sub_23A22E3A0(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  unsigned __int16 value;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v2 = MEMORY[0x23B845B54]();
  v3 = sub_23A233024();
  if (v2 == v3)
  {
    value = 0;
    return value | ((v2 == v3) << 16);
  }
  v4 = MEMORY[0x23B845B54](a1);
  if (v4 == sub_23A233048())
  {
    value = xpc_int64_get_value(a1);
    if (xpc_int64_get_value(a1) != (__int16)value)
    {
      v9 = sub_23A23333C();
      swift_allocError();
      v11 = v10;
      swift_beginAccess();
      swift_bridgeObjectRetain();
      sub_23A233300();
      swift_bridgeObjectRelease();
      xpc_int64_get_value(a1);
      sub_23A2334E0();
      sub_23A233174();
      swift_bridgeObjectRelease();
      sub_23A233174();
      sub_23A233174();
      sub_23A233174();
      sub_23A233330();
      (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v9 - 8) + 104))(v11, *MEMORY[0x24BEE26D8], v9);
      return swift_willThrow();
    }
    return value | ((v2 == v3) << 16);
  }
  swift_beginAccess();
  sub_23A23333C();
  swift_allocError();
  v6 = v5;
  swift_bridgeObjectRetain();
  sub_23A225434(MEMORY[0x24BEE3F30], (uint64_t)a1, v6);
  swift_bridgeObjectRelease();
  return swift_willThrow();
}

unint64_t sub_23A22E5EC(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  unsigned int value;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v2 = MEMORY[0x23B845B54]();
  v3 = sub_23A233024();
  if (v2 == v3)
  {
    value = 0;
    return value | ((unint64_t)(v2 == v3) << 32);
  }
  v4 = MEMORY[0x23B845B54](a1);
  if (v4 == sub_23A233048())
  {
    value = xpc_int64_get_value(a1);
    if (xpc_int64_get_value(a1) != value)
    {
      v9 = sub_23A23333C();
      swift_allocError();
      v11 = v10;
      swift_beginAccess();
      swift_bridgeObjectRetain();
      sub_23A233300();
      swift_bridgeObjectRelease();
      xpc_int64_get_value(a1);
      sub_23A2334E0();
      sub_23A233174();
      swift_bridgeObjectRelease();
      sub_23A233174();
      sub_23A233174();
      sub_23A233174();
      sub_23A233330();
      (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v9 - 8) + 104))(v11, *MEMORY[0x24BEE26D8], v9);
      return swift_willThrow();
    }
    return value | ((unint64_t)(v2 == v3) << 32);
  }
  swift_beginAccess();
  sub_23A23333C();
  swift_allocError();
  v6 = v5;
  swift_bridgeObjectRetain();
  sub_23A225434(MEMORY[0x24BEE3F88], (uint64_t)a1, v6);
  swift_bridgeObjectRelease();
  return swift_willThrow();
}

int64_t sub_23A22E840(void *a1, uint64_t a2, uint64_t a3, int64_t value)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;

  v6 = MEMORY[0x23B845B54]();
  if (v6 == sub_23A233024())
    return 0;
  v7 = MEMORY[0x23B845B54](a1);
  if (v7 != sub_23A233048())
  {
    swift_beginAccess();
    sub_23A23333C();
    swift_allocError();
    v9 = v8;
    swift_bridgeObjectRetain();
    sub_23A225434(value, (uint64_t)a1, v9);
    swift_bridgeObjectRelease();
LABEL_7:
    swift_willThrow();
    return value;
  }
  value = xpc_int64_get_value(a1);
  if (value != xpc_int64_get_value(a1))
  {
    value = sub_23A23333C();
    swift_allocError();
    v11 = v10;
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_23A233300();
    swift_bridgeObjectRelease();
    xpc_int64_get_value(a1);
    sub_23A2334E0();
    sub_23A233174();
    swift_bridgeObjectRelease();
    sub_23A233174();
    sub_23A233174();
    sub_23A233174();
    sub_23A233330();
    (*(void (**)(uint64_t, _QWORD, int64_t))(*(_QWORD *)(value - 8) + 104))(v11, *MEMORY[0x24BEE26D8], value);
    goto LABEL_7;
  }
  return value;
}

uint64_t sub_23A22EA98(void *a1, uint64_t a2, uint64_t a3, uint64_t value)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;

  v6 = MEMORY[0x23B845B54]();
  if (v6 == sub_23A233024())
    return 0;
  v7 = MEMORY[0x23B845B54](a1);
  if (v7 != sub_23A23306C())
  {
    swift_beginAccess();
    sub_23A23333C();
    swift_allocError();
    v9 = v8;
    swift_bridgeObjectRetain();
    sub_23A225434(value, (uint64_t)a1, v9);
    swift_bridgeObjectRelease();
LABEL_7:
    swift_willThrow();
    return value;
  }
  value = xpc_uint64_get_value(a1);
  if (value != xpc_uint64_get_value(a1))
  {
    value = sub_23A23333C();
    swift_allocError();
    v11 = v10;
    swift_beginAccess();
    swift_bridgeObjectRetain();
    sub_23A233300();
    swift_bridgeObjectRelease();
    xpc_uint64_get_value(a1);
    sub_23A2334E0();
    sub_23A233174();
    swift_bridgeObjectRelease();
    sub_23A233174();
    sub_23A233174();
    sub_23A233174();
    sub_23A233330();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(value - 8) + 104))(v11, *MEMORY[0x24BEE26D8], value);
    goto LABEL_7;
  }
  return value;
}

uint64_t sub_23A22ECF0(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  unsigned __int8 value;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v2 = MEMORY[0x23B845B54]();
  v3 = sub_23A233024();
  if (v2 == v3)
  {
    value = 0;
    return value | ((v2 == v3) << 8);
  }
  v4 = MEMORY[0x23B845B54](a1);
  if (v4 == sub_23A23306C())
  {
    value = xpc_uint64_get_value(a1);
    if (xpc_uint64_get_value(a1) != value)
    {
      v9 = sub_23A23333C();
      swift_allocError();
      v11 = v10;
      swift_beginAccess();
      swift_bridgeObjectRetain();
      sub_23A233300();
      swift_bridgeObjectRelease();
      xpc_uint64_get_value(a1);
      sub_23A2334E0();
      sub_23A233174();
      swift_bridgeObjectRelease();
      sub_23A233174();
      sub_23A233174();
      sub_23A233174();
      sub_23A233330();
      (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v9 - 8) + 104))(v11, *MEMORY[0x24BEE26D8], v9);
      return swift_willThrow();
    }
    return value | ((v2 == v3) << 8);
  }
  swift_beginAccess();
  sub_23A23333C();
  swift_allocError();
  v6 = v5;
  swift_bridgeObjectRetain();
  sub_23A225434(MEMORY[0x24BEE4260], (uint64_t)a1, v6);
  swift_bridgeObjectRelease();
  return swift_willThrow();
}

uint64_t sub_23A22EF3C(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  unsigned __int16 value;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v2 = MEMORY[0x23B845B54]();
  v3 = sub_23A233024();
  if (v2 == v3)
  {
    value = 0;
    return value | ((v2 == v3) << 16);
  }
  v4 = MEMORY[0x23B845B54](a1);
  if (v4 == sub_23A23306C())
  {
    value = xpc_uint64_get_value(a1);
    if (xpc_uint64_get_value(a1) != value)
    {
      v9 = sub_23A23333C();
      swift_allocError();
      v11 = v10;
      swift_beginAccess();
      swift_bridgeObjectRetain();
      sub_23A233300();
      swift_bridgeObjectRelease();
      xpc_uint64_get_value(a1);
      sub_23A2334E0();
      sub_23A233174();
      swift_bridgeObjectRelease();
      sub_23A233174();
      sub_23A233174();
      sub_23A233174();
      sub_23A233330();
      (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v9 - 8) + 104))(v11, *MEMORY[0x24BEE26D8], v9);
      return swift_willThrow();
    }
    return value | ((v2 == v3) << 16);
  }
  swift_beginAccess();
  sub_23A23333C();
  swift_allocError();
  v6 = v5;
  swift_bridgeObjectRetain();
  sub_23A225434(MEMORY[0x24BEE4478], (uint64_t)a1, v6);
  swift_bridgeObjectRelease();
  return swift_willThrow();
}

unint64_t sub_23A22F188(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  unsigned int value;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v2 = MEMORY[0x23B845B54]();
  v3 = sub_23A233024();
  if (v2 == v3)
  {
    value = 0;
    return value | ((unint64_t)(v2 == v3) << 32);
  }
  v4 = MEMORY[0x23B845B54](a1);
  if (v4 == sub_23A23306C())
  {
    value = xpc_uint64_get_value(a1);
    if (xpc_uint64_get_value(a1) != value)
    {
      v9 = sub_23A23333C();
      swift_allocError();
      v11 = v10;
      swift_beginAccess();
      swift_bridgeObjectRetain();
      sub_23A233300();
      swift_bridgeObjectRelease();
      xpc_uint64_get_value(a1);
      sub_23A2334E0();
      sub_23A233174();
      swift_bridgeObjectRelease();
      sub_23A233174();
      sub_23A233174();
      sub_23A233174();
      sub_23A233330();
      (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v9 - 8) + 104))(v11, *MEMORY[0x24BEE26D8], v9);
      return swift_willThrow();
    }
    return value | ((unint64_t)(v2 == v3) << 32);
  }
  swift_beginAccess();
  sub_23A23333C();
  swift_allocError();
  v6 = v5;
  swift_bridgeObjectRetain();
  sub_23A225434(MEMORY[0x24BEE44F0], (uint64_t)a1, v6);
  swift_bridgeObjectRelease();
  return swift_willThrow();
}

uint64_t sub_23A22F3DC()
{
  uint64_t v0;
  uint64_t v1;
  char value;
  void *v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;

  value = sub_23A225DDC();
  if (v1)
    return value & 1;
  v3 = *(void **)(v0 + 24);
  v4 = MEMORY[0x23B845B54](v3);
  result = sub_23A233024();
  if (v4 != result)
  {
    v6 = MEMORY[0x23B845B54](v3);
    if (v6 == sub_23A233018())
    {
      value = xpc_BOOL_get_value(v3);
    }
    else
    {
      swift_beginAccess();
      sub_23A23333C();
      swift_allocError();
      v8 = v7;
      swift_bridgeObjectRetain();
      sub_23A225434(MEMORY[0x24BEE1328], (uint64_t)v3, v8);
      swift_bridgeObjectRelease();
      value = swift_willThrow();
    }
    return value & 1;
  }
  __break(1u);
  return result;
}

void sub_23A22F4C4()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;

  sub_23A226A68();
  if (!v1)
  {
    v2 = *(void **)(v0 + 24);
    v3 = MEMORY[0x23B845B54](v2);
    if (v3 == sub_23A233024())
    {
      __break(1u);
    }
    else
    {
      v4 = MEMORY[0x23B845B54](v2);
      if (v4 == sub_23A233054())
      {
        xpc_double_get_value(v2);
      }
      else
      {
        swift_beginAccess();
        sub_23A23333C();
        swift_allocError();
        v6 = v5;
        swift_bridgeObjectRetain();
        sub_23A225434(MEMORY[0x24BEE14E8], (uint64_t)v2, v6);
        swift_bridgeObjectRelease();
        swift_willThrow();
      }
    }
  }
}

void sub_23A22F5AC()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;

  sub_23A226B8C();
  if (!v1)
  {
    v2 = *(void **)(v0 + 24);
    v3 = MEMORY[0x23B845B54](v2);
    if (v3 == sub_23A233024())
    {
      __break(1u);
    }
    else
    {
      v4 = MEMORY[0x23B845B54](v2);
      if (v4 == sub_23A233054())
      {
        xpc_double_get_value(v2);
      }
      else
      {
        swift_beginAccess();
        sub_23A23333C();
        swift_allocError();
        v6 = v5;
        swift_bridgeObjectRetain();
        sub_23A225434(MEMORY[0x24BEE13C8], (uint64_t)v2, v6);
        swift_bridgeObjectRelease();
        swift_willThrow();
      }
    }
  }
}

uint64_t sub_23A22F690(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2569535C0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_23A22F6D0()
{
  unint64_t result;

  result = qword_2569535D0;
  if (!qword_2569535D0)
  {
    result = MEMORY[0x23B8459BC](&unk_23A235E80, &type metadata for _XPCUnkeyedDecodingContainer);
    atomic_store(result, (unint64_t *)&qword_2569535D0);
  }
  return result;
}

uint64_t sub_23A22F714()
{
  swift_release();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t type metadata accessor for _XPCKeyedDecodingContainer(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for _XPCKeyedDecodingContainer);
}

uint64_t sub_23A22F754(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for _XPCDecoder();
    result = MEMORY[0x23B8459BC](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

_QWORD *initializeWithCopy for _XPCUnkeyedDecodingContainer(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_retain();
  swift_unknownObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for _XPCUnkeyedDecodingContainer(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  return a1;
}

uint64_t assignWithTake for _XPCUnkeyedDecodingContainer(uint64_t a1, uint64_t a2)
{
  swift_release();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_unknownObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  return a1;
}

uint64_t getEnumTagSinglePayload for _XPCUnkeyedDecodingContainer(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 32))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for _XPCUnkeyedDecodingContainer(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 32) = 1;
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
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for _XPCUnkeyedDecodingContainer()
{
  return &type metadata for _XPCUnkeyedDecodingContainer;
}

uint64_t sub_23A22F944()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_23A22F968()
{
  uint64_t *v0;
  uint64_t *v1;
  void *v2;
  int64_t v3;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  xpc_object_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t inited;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v32;
  _QWORD v33[2];
  __int128 v34;
  ValueMetadata *v35;
  unint64_t v36;
  _QWORD v37[3];
  uint64_t v38;

  v1 = v0;
  v2 = (void *)v0[1];
  v3 = v0[3];
  if (v3 >= (uint64_t)xpc_array_get_count(v2))
  {
    v17 = sub_23A23333C();
    swift_allocError();
    v19 = v18;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256953390);
    *v19 = MEMORY[0x24BEE1328];
    v20 = *v0;
    swift_beginAccess();
    v21 = *(_QWORD *)(v20 + 16);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256952AD0);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_23A2349D0;
    v23 = v0[3];
    v37[1] = 0xE600000000000000;
    v33[0] = v23;
    swift_bridgeObjectRetain();
    sub_23A2334E0();
    sub_23A233174();
    swift_bridgeObjectRelease();
    *(_QWORD *)(inited + 56) = &type metadata for XPCCodingKey;
    *(_QWORD *)(inited + 64) = sub_23A221A80();
    v24 = swift_allocObject();
    *(_QWORD *)(inited + 32) = v24;
    *(_QWORD *)(v24 + 16) = 0x207865646E49;
    *(_QWORD *)(v24 + 24) = 0xE600000000000000;
    *(_QWORD *)(v24 + 32) = v23;
    *(_BYTE *)(v24 + 40) = 0;
    v37[0] = v21;
    v14 = v37;
    sub_23A22DE48((_QWORD *)inited);
    sub_23A233330();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v17 - 8) + 104))(v19, *MEMORY[0x24BEE26E0], v17);
    swift_willThrow();
  }
  else
  {
    v4 = *v0;
    *(_QWORD *)&v34 = 0x207865646E49;
    *((_QWORD *)&v34 + 1) = 0xE600000000000000;
    v37[0] = v3;
    sub_23A2334E0();
    sub_23A233174();
    swift_bridgeObjectRelease();
    v5 = (_QWORD *)(v4 + 16);
    swift_beginAccess();
    v6 = *(_QWORD **)(v4 + 16);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(_QWORD *)(v4 + 16) = v6;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v6 = sub_23A22DD14(0, v6[2] + 1, 1, v6);
      *v5 = v6;
    }
    v9 = v6[2];
    v8 = v6[3];
    if (v9 >= v8 >> 1)
    {
      v6 = sub_23A22DD14((_QWORD *)(v8 > 1), v9 + 1, 1, v6);
      *v5 = v6;
    }
    v35 = &type metadata for XPCCodingKey;
    v32 = sub_23A221A80();
    v36 = v32;
    v10 = swift_allocObject();
    *(_QWORD *)&v34 = v10;
    *(_QWORD *)(v10 + 16) = 0x207865646E49;
    *(_QWORD *)(v10 + 24) = 0xE600000000000000;
    *(_QWORD *)(v10 + 32) = v3;
    *(_BYTE *)(v10 + 40) = 0;
    v6[2] = v9 + 1;
    sub_23A224F80(&v34, (uint64_t)&v6[5 * v9 + 4]);
    v11 = xpc_array_get_value(v2, v3);
    v12 = MEMORY[0x23B845B54]();
    if (v12 == sub_23A233024())
    {
      swift_unknownObjectRelease();
      v25 = sub_23A23333C();
      swift_allocError();
      v27 = v26;
      __swift_instantiateConcreteTypeFromMangledName(&qword_256953390);
      *v27 = MEMORY[0x24BEE1328];
      swift_beginAccess();
      __swift_instantiateConcreteTypeFromMangledName(&qword_256952AD0);
      v28 = swift_initStackObject();
      *(_OWORD *)(v28 + 16) = xmmword_23A2349D0;
      v38 = v1[3];
      v29 = v38;
      swift_bridgeObjectRetain();
      sub_23A2334E0();
      sub_23A233174();
      swift_bridgeObjectRelease();
      *(_QWORD *)(v28 + 56) = &type metadata for XPCCodingKey;
      *(_QWORD *)(v28 + 64) = v32;
      v30 = swift_allocObject();
      *(_QWORD *)(v28 + 32) = v30;
      *(_QWORD *)(v30 + 16) = 0x207865646E49;
      *(_QWORD *)(v30 + 24) = 0xE600000000000000;
      *(_QWORD *)(v30 + 32) = v29;
      *(_BYTE *)(v30 + 40) = 0;
      sub_23A22DE48((_QWORD *)v28);
      v33[0] = 0;
      v33[1] = 0xE000000000000000;
      v14 = v33;
      sub_23A233300();
      swift_bridgeObjectRelease();
      sub_23A233330();
      (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v25 - 8) + 104))(v27, *MEMORY[0x24BEE26E0], v25);
      swift_willThrow();
    }
    else
    {
      v13 = MEMORY[0x23B845B54](v11);
      if (v13 == sub_23A233018())
      {
        LOBYTE(v14) = xpc_BOOL_get_value(v11);
        swift_unknownObjectRelease();
        v1[3] = v3 + 1;
        sub_23A228C04(v1);
        return v14 & 1;
      }
      v14 = (_QWORD *)*v5;
      sub_23A23333C();
      swift_allocError();
      v16 = v15;
      swift_bridgeObjectRetain();
      sub_23A225434(MEMORY[0x24BEE1328], (uint64_t)v11, v16);
      swift_bridgeObjectRelease();
      swift_willThrow();
      swift_unknownObjectRelease();
    }
    sub_23A228C04(v1);
  }
  return v14 & 1;
}

_QWORD *sub_23A22FEE0()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t *v2;
  void *v3;
  int64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  _QWORD *v15;
  int64_t v16;
  char v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t inited;
  uint64_t v24;
  uint64_t v25;
  char v26;
  _QWORD *v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v33;
  _QWORD v34[2];
  __int128 v35;
  ValueMetadata *v36;
  unint64_t v37;
  _QWORD v38[3];
  uint64_t v39;

  v2 = v0;
  v3 = (void *)v0[1];
  v4 = v0[3];
  if (v4 >= (uint64_t)xpc_array_get_count(v3))
  {
    v18 = sub_23A23333C();
    swift_allocError();
    v20 = v19;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256953390);
    *v20 = MEMORY[0x24BEE1768];
    v21 = *v0;
    swift_beginAccess();
    v22 = *(_QWORD *)(v21 + 16);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256952AD0);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_23A2349D0;
    v24 = v2[3];
    v38[1] = 0xE600000000000000;
    v34[0] = v24;
    swift_bridgeObjectRetain();
    sub_23A2334E0();
    sub_23A233174();
    swift_bridgeObjectRelease();
    *(_QWORD *)(inited + 56) = &type metadata for XPCCodingKey;
    *(_QWORD *)(inited + 64) = sub_23A221A80();
    v25 = swift_allocObject();
    *(_QWORD *)(inited + 32) = v25;
    *(_QWORD *)(v25 + 16) = 0x207865646E49;
    *(_QWORD *)(v25 + 24) = 0xE600000000000000;
    *(_QWORD *)(v25 + 32) = v24;
    *(_BYTE *)(v25 + 40) = 0;
    v38[0] = v22;
    v15 = v38;
    sub_23A22DE48((_QWORD *)inited);
    sub_23A233330();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v18 - 8) + 104))(v20, *MEMORY[0x24BEE26E0], v18);
    swift_willThrow();
  }
  else
  {
    v5 = (_QWORD *)*v0;
    *(_QWORD *)&v35 = 0x207865646E49;
    *((_QWORD *)&v35 + 1) = 0xE600000000000000;
    v38[0] = v4;
    sub_23A2334E0();
    sub_23A233174();
    swift_bridgeObjectRelease();
    v6 = v5 + 2;
    swift_beginAccess();
    v7 = (_QWORD *)v5[2];
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v5[2] = v7;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v7 = sub_23A22DD14(0, v7[2] + 1, 1, v7);
      *v6 = v7;
    }
    v10 = v7[2];
    v9 = v7[3];
    if (v10 >= v9 >> 1)
    {
      v7 = sub_23A22DD14((_QWORD *)(v9 > 1), v10 + 1, 1, v7);
      *v6 = v7;
    }
    v36 = &type metadata for XPCCodingKey;
    v11 = sub_23A221A80();
    v37 = v11;
    v12 = swift_allocObject();
    *(_QWORD *)&v35 = v12;
    *(_QWORD *)(v12 + 16) = 0x207865646E49;
    *(_QWORD *)(v12 + 24) = 0xE600000000000000;
    *(_QWORD *)(v12 + 32) = v4;
    *(_BYTE *)(v12 + 40) = 0;
    v7[2] = v10 + 1;
    sub_23A224F80(&v35, (uint64_t)&v7[5 * v10 + 4]);
    v13 = xpc_array_get_value(v3, v4);
    v14 = MEMORY[0x24BEE1768];
    v15 = v5;
    v16 = sub_23A22E840(v13, 7630409, 0xE300000000000000, MEMORY[0x24BEE1768]);
    if (v1)
    {
      swift_unknownObjectRelease();
LABEL_12:
      sub_23A228C04(v2);
      return v15;
    }
    v15 = (_QWORD *)v16;
    v26 = v17;
    swift_unknownObjectRelease();
    if ((v26 & 1) != 0)
    {
      v33 = sub_23A23333C();
      swift_allocError();
      v28 = v27;
      __swift_instantiateConcreteTypeFromMangledName(&qword_256953390);
      *v28 = v14;
      swift_beginAccess();
      __swift_instantiateConcreteTypeFromMangledName(&qword_256952AD0);
      v29 = swift_initStackObject();
      *(_OWORD *)(v29 + 16) = xmmword_23A2349D0;
      v39 = v2[3];
      v30 = v39;
      swift_bridgeObjectRetain();
      sub_23A2334E0();
      sub_23A233174();
      swift_bridgeObjectRelease();
      *(_QWORD *)(v29 + 56) = &type metadata for XPCCodingKey;
      *(_QWORD *)(v29 + 64) = v11;
      v31 = swift_allocObject();
      *(_QWORD *)(v29 + 32) = v31;
      *(_QWORD *)(v31 + 16) = 0x207865646E49;
      *(_QWORD *)(v31 + 24) = 0xE600000000000000;
      *(_QWORD *)(v31 + 32) = v30;
      *(_BYTE *)(v31 + 40) = 0;
      sub_23A22DE48((_QWORD *)v29);
      v34[0] = 0;
      v34[1] = 0xE000000000000000;
      v15 = v34;
      sub_23A233300();
      swift_bridgeObjectRelease();
      sub_23A233330();
      (*(void (**)(_QWORD *, _QWORD))(*(_QWORD *)(v33 - 8) + 104))(v28, *MEMORY[0x24BEE26E0]);
      swift_willThrow();
      goto LABEL_12;
    }
    v2[3] = v4 + 1;
    sub_23A228C04(v2);
  }
  return v15;
}

_QWORD *sub_23A2303F8()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t *v2;
  void *v3;
  int64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  _QWORD *v15;
  int64_t v16;
  char v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t inited;
  uint64_t v24;
  uint64_t v25;
  char v26;
  _QWORD *v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v33;
  _QWORD v34[2];
  __int128 v35;
  ValueMetadata *v36;
  unint64_t v37;
  _QWORD v38[3];
  uint64_t v39;

  v2 = v0;
  v3 = (void *)v0[1];
  v4 = v0[3];
  if (v4 >= (uint64_t)xpc_array_get_count(v3))
  {
    v18 = sub_23A23333C();
    swift_allocError();
    v20 = v19;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256953390);
    *v20 = MEMORY[0x24BEE4008];
    v21 = *v0;
    swift_beginAccess();
    v22 = *(_QWORD *)(v21 + 16);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256952AD0);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_23A2349D0;
    v24 = v2[3];
    v38[1] = 0xE600000000000000;
    v34[0] = v24;
    swift_bridgeObjectRetain();
    sub_23A2334E0();
    sub_23A233174();
    swift_bridgeObjectRelease();
    *(_QWORD *)(inited + 56) = &type metadata for XPCCodingKey;
    *(_QWORD *)(inited + 64) = sub_23A221A80();
    v25 = swift_allocObject();
    *(_QWORD *)(inited + 32) = v25;
    *(_QWORD *)(v25 + 16) = 0x207865646E49;
    *(_QWORD *)(v25 + 24) = 0xE600000000000000;
    *(_QWORD *)(v25 + 32) = v24;
    *(_BYTE *)(v25 + 40) = 0;
    v38[0] = v22;
    v15 = v38;
    sub_23A22DE48((_QWORD *)inited);
    sub_23A233330();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v18 - 8) + 104))(v20, *MEMORY[0x24BEE26E0], v18);
    swift_willThrow();
  }
  else
  {
    v5 = (_QWORD *)*v0;
    *(_QWORD *)&v35 = 0x207865646E49;
    *((_QWORD *)&v35 + 1) = 0xE600000000000000;
    v38[0] = v4;
    sub_23A2334E0();
    sub_23A233174();
    swift_bridgeObjectRelease();
    v6 = v5 + 2;
    swift_beginAccess();
    v7 = (_QWORD *)v5[2];
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v5[2] = v7;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v7 = sub_23A22DD14(0, v7[2] + 1, 1, v7);
      *v6 = v7;
    }
    v10 = v7[2];
    v9 = v7[3];
    if (v10 >= v9 >> 1)
    {
      v7 = sub_23A22DD14((_QWORD *)(v9 > 1), v10 + 1, 1, v7);
      *v6 = v7;
    }
    v36 = &type metadata for XPCCodingKey;
    v11 = sub_23A221A80();
    v37 = v11;
    v12 = swift_allocObject();
    *(_QWORD *)&v35 = v12;
    *(_QWORD *)(v12 + 16) = 0x207865646E49;
    *(_QWORD *)(v12 + 24) = 0xE600000000000000;
    *(_QWORD *)(v12 + 32) = v4;
    *(_BYTE *)(v12 + 40) = 0;
    v7[2] = v10 + 1;
    sub_23A224F80(&v35, (uint64_t)&v7[5 * v10 + 4]);
    v13 = xpc_array_get_value(v3, v4);
    v14 = MEMORY[0x24BEE4008];
    v15 = v5;
    v16 = sub_23A22E840(v13, 0x3436746E49, 0xE500000000000000, MEMORY[0x24BEE4008]);
    if (v1)
    {
      swift_unknownObjectRelease();
LABEL_12:
      sub_23A228C04(v2);
      return v15;
    }
    v15 = (_QWORD *)v16;
    v26 = v17;
    swift_unknownObjectRelease();
    if ((v26 & 1) != 0)
    {
      v33 = sub_23A23333C();
      swift_allocError();
      v28 = v27;
      __swift_instantiateConcreteTypeFromMangledName(&qword_256953390);
      *v28 = v14;
      swift_beginAccess();
      __swift_instantiateConcreteTypeFromMangledName(&qword_256952AD0);
      v29 = swift_initStackObject();
      *(_OWORD *)(v29 + 16) = xmmword_23A2349D0;
      v39 = v2[3];
      v30 = v39;
      swift_bridgeObjectRetain();
      sub_23A2334E0();
      sub_23A233174();
      swift_bridgeObjectRelease();
      *(_QWORD *)(v29 + 56) = &type metadata for XPCCodingKey;
      *(_QWORD *)(v29 + 64) = v11;
      v31 = swift_allocObject();
      *(_QWORD *)(v29 + 32) = v31;
      *(_QWORD *)(v31 + 16) = 0x207865646E49;
      *(_QWORD *)(v31 + 24) = 0xE600000000000000;
      *(_QWORD *)(v31 + 32) = v30;
      *(_BYTE *)(v31 + 40) = 0;
      sub_23A22DE48((_QWORD *)v29);
      v34[0] = 0;
      v34[1] = 0xE000000000000000;
      v15 = v34;
      sub_23A233300();
      swift_bridgeObjectRelease();
      sub_23A233330();
      (*(void (**)(_QWORD *, _QWORD))(*(_QWORD *)(v33 - 8) + 104))(v28, *MEMORY[0x24BEE26E0]);
      swift_willThrow();
      goto LABEL_12;
    }
    v2[3] = v4 + 1;
    sub_23A228C04(v2);
  }
  return v15;
}

_QWORD *sub_23A23091C()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t *v2;
  void *v3;
  int64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t inited;
  uint64_t v24;
  uint64_t v25;
  char v26;
  _QWORD *v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v33;
  _QWORD v34[2];
  __int128 v35;
  ValueMetadata *v36;
  unint64_t v37;
  _QWORD v38[3];
  uint64_t v39;

  v2 = v0;
  v3 = (void *)v0[1];
  v4 = v0[3];
  if (v4 >= (uint64_t)xpc_array_get_count(v3))
  {
    v18 = sub_23A23333C();
    swift_allocError();
    v20 = v19;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256953390);
    *v20 = MEMORY[0x24BEE1E88];
    v21 = *v0;
    swift_beginAccess();
    v22 = *(_QWORD *)(v21 + 16);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256952AD0);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_23A2349D0;
    v24 = v2[3];
    v38[1] = 0xE600000000000000;
    v34[0] = v24;
    swift_bridgeObjectRetain();
    sub_23A2334E0();
    sub_23A233174();
    swift_bridgeObjectRelease();
    *(_QWORD *)(inited + 56) = &type metadata for XPCCodingKey;
    *(_QWORD *)(inited + 64) = sub_23A221A80();
    v25 = swift_allocObject();
    *(_QWORD *)(inited + 32) = v25;
    *(_QWORD *)(v25 + 16) = 0x207865646E49;
    *(_QWORD *)(v25 + 24) = 0xE600000000000000;
    *(_QWORD *)(v25 + 32) = v24;
    *(_BYTE *)(v25 + 40) = 0;
    v38[0] = v22;
    v15 = v38;
    sub_23A22DE48((_QWORD *)inited);
    sub_23A233330();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v18 - 8) + 104))(v20, *MEMORY[0x24BEE26E0], v18);
    swift_willThrow();
  }
  else
  {
    v5 = (_QWORD *)*v0;
    *(_QWORD *)&v35 = 0x207865646E49;
    *((_QWORD *)&v35 + 1) = 0xE600000000000000;
    v38[0] = v4;
    sub_23A2334E0();
    sub_23A233174();
    swift_bridgeObjectRelease();
    v6 = v5 + 2;
    swift_beginAccess();
    v7 = (_QWORD *)v5[2];
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v5[2] = v7;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v7 = sub_23A22DD14(0, v7[2] + 1, 1, v7);
      *v6 = v7;
    }
    v10 = v7[2];
    v9 = v7[3];
    if (v10 >= v9 >> 1)
    {
      v7 = sub_23A22DD14((_QWORD *)(v9 > 1), v10 + 1, 1, v7);
      *v6 = v7;
    }
    v36 = &type metadata for XPCCodingKey;
    v11 = sub_23A221A80();
    v37 = v11;
    v12 = swift_allocObject();
    *(_QWORD *)&v35 = v12;
    *(_QWORD *)(v12 + 16) = 0x207865646E49;
    *(_QWORD *)(v12 + 24) = 0xE600000000000000;
    *(_QWORD *)(v12 + 32) = v4;
    *(_BYTE *)(v12 + 40) = 0;
    v7[2] = v10 + 1;
    sub_23A224F80(&v35, (uint64_t)&v7[5 * v10 + 4]);
    v13 = xpc_array_get_value(v3, v4);
    v14 = MEMORY[0x24BEE1E88];
    v15 = v5;
    v16 = sub_23A22EA98(v13, 1953384789, 0xE400000000000000, MEMORY[0x24BEE1E88]);
    if (v1)
    {
      swift_unknownObjectRelease();
LABEL_12:
      sub_23A228C04(v2);
      return v15;
    }
    v15 = (_QWORD *)v16;
    v26 = v17;
    swift_unknownObjectRelease();
    if ((v26 & 1) != 0)
    {
      v33 = sub_23A23333C();
      swift_allocError();
      v28 = v27;
      __swift_instantiateConcreteTypeFromMangledName(&qword_256953390);
      *v28 = v14;
      swift_beginAccess();
      __swift_instantiateConcreteTypeFromMangledName(&qword_256952AD0);
      v29 = swift_initStackObject();
      *(_OWORD *)(v29 + 16) = xmmword_23A2349D0;
      v39 = v2[3];
      v30 = v39;
      swift_bridgeObjectRetain();
      sub_23A2334E0();
      sub_23A233174();
      swift_bridgeObjectRelease();
      *(_QWORD *)(v29 + 56) = &type metadata for XPCCodingKey;
      *(_QWORD *)(v29 + 64) = v11;
      v31 = swift_allocObject();
      *(_QWORD *)(v29 + 32) = v31;
      *(_QWORD *)(v31 + 16) = 0x207865646E49;
      *(_QWORD *)(v31 + 24) = 0xE600000000000000;
      *(_QWORD *)(v31 + 32) = v30;
      *(_BYTE *)(v31 + 40) = 0;
      sub_23A22DE48((_QWORD *)v29);
      v34[0] = 0;
      v34[1] = 0xE000000000000000;
      v15 = v34;
      sub_23A233300();
      swift_bridgeObjectRelease();
      sub_23A233330();
      (*(void (**)(_QWORD *, _QWORD))(*(_QWORD *)(v33 - 8) + 104))(v28, *MEMORY[0x24BEE26E0]);
      swift_willThrow();
      goto LABEL_12;
    }
    v2[3] = v4 + 1;
    sub_23A228C04(v2);
  }
  return v15;
}

_QWORD *sub_23A230E3C(uint64_t (*a1)(void), uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t *v6;
  void *v7;
  int64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  id v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t inited;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v34;
  _QWORD v35[2];
  __int128 v36;
  ValueMetadata *v37;
  unint64_t v38;
  _QWORD v39[3];
  uint64_t v40;

  v6 = v2;
  v7 = (void *)v2[1];
  v8 = v2[3];
  if (v8 >= (uint64_t)xpc_array_get_count(v7))
  {
    v20 = sub_23A23333C();
    swift_allocError();
    v22 = v21;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256953390);
    *v22 = a2;
    v23 = *v2;
    swift_beginAccess();
    v24 = *(_QWORD *)(v23 + 16);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256952AD0);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_23A2349D0;
    v26 = v6[3];
    v39[1] = 0xE600000000000000;
    v35[0] = v26;
    swift_bridgeObjectRetain();
    sub_23A2334E0();
    sub_23A233174();
    swift_bridgeObjectRelease();
    *(_QWORD *)(inited + 56) = &type metadata for XPCCodingKey;
    *(_QWORD *)(inited + 64) = sub_23A221A80();
    v27 = swift_allocObject();
    *(_QWORD *)(inited + 32) = v27;
    *(_QWORD *)(v27 + 16) = 0x207865646E49;
    *(_QWORD *)(v27 + 24) = 0xE600000000000000;
    *(_QWORD *)(v27 + 32) = v26;
    *(_BYTE *)(v27 + 40) = 0;
    v39[0] = v24;
    v18 = v39;
    sub_23A22DE48((_QWORD *)inited);
    sub_23A233330();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v20 - 8) + 104))(v22, *MEMORY[0x24BEE26E0], v20);
    swift_willThrow();
  }
  else
  {
    v9 = (_QWORD *)*v2;
    *(_QWORD *)&v36 = 0x207865646E49;
    *((_QWORD *)&v36 + 1) = 0xE600000000000000;
    v39[0] = v8;
    sub_23A2334E0();
    sub_23A233174();
    swift_bridgeObjectRelease();
    v10 = v9 + 2;
    swift_beginAccess();
    v11 = (_QWORD *)v9[2];
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v9[2] = v11;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v11 = sub_23A22DD14(0, v11[2] + 1, 1, v11);
      *v10 = v11;
    }
    v14 = v11[2];
    v13 = v11[3];
    if (v14 >= v13 >> 1)
    {
      v11 = sub_23A22DD14((_QWORD *)(v13 > 1), v14 + 1, 1, v11);
      *v10 = v11;
    }
    v37 = &type metadata for XPCCodingKey;
    v15 = sub_23A221A80();
    v38 = v15;
    v16 = swift_allocObject();
    *(_QWORD *)&v36 = v16;
    *(_QWORD *)(v16 + 16) = 0x207865646E49;
    *(_QWORD *)(v16 + 24) = 0xE600000000000000;
    *(_QWORD *)(v16 + 32) = v8;
    *(_BYTE *)(v16 + 40) = 0;
    v11[2] = v14 + 1;
    sub_23A224F80(&v36, (uint64_t)&v11[5 * v14 + 4]);
    v17 = xpc_array_get_value(v7, v8);
    v18 = v9;
    v19 = a1();
    if (v3)
    {
      swift_unknownObjectRelease();
LABEL_12:
      sub_23A228C04(v6);
      return v18;
    }
    v18 = (_QWORD *)v19;
    swift_unknownObjectRelease();
    if (((unsigned __int16)v18 & 0x100) != 0)
    {
      v34 = sub_23A23333C();
      swift_allocError();
      v29 = v28;
      __swift_instantiateConcreteTypeFromMangledName(&qword_256953390);
      *v29 = a2;
      swift_beginAccess();
      __swift_instantiateConcreteTypeFromMangledName(&qword_256952AD0);
      v30 = swift_initStackObject();
      *(_OWORD *)(v30 + 16) = xmmword_23A2349D0;
      v40 = v6[3];
      v31 = v40;
      swift_bridgeObjectRetain();
      sub_23A2334E0();
      sub_23A233174();
      swift_bridgeObjectRelease();
      *(_QWORD *)(v30 + 56) = &type metadata for XPCCodingKey;
      *(_QWORD *)(v30 + 64) = v15;
      v32 = swift_allocObject();
      *(_QWORD *)(v30 + 32) = v32;
      *(_QWORD *)(v32 + 16) = 0x207865646E49;
      *(_QWORD *)(v32 + 24) = 0xE600000000000000;
      *(_QWORD *)(v32 + 32) = v31;
      *(_BYTE *)(v32 + 40) = 0;
      sub_23A22DE48((_QWORD *)v30);
      v35[0] = 0;
      v35[1] = 0xE000000000000000;
      v18 = v35;
      sub_23A233300();
      swift_bridgeObjectRelease();
      sub_23A233330();
      (*(void (**)(_QWORD *, _QWORD))(*(_QWORD *)(v34 - 8) + 104))(v29, *MEMORY[0x24BEE26E0]);
      swift_willThrow();
      goto LABEL_12;
    }
    v6[3] = v8 + 1;
    sub_23A228C04(v6);
  }
  return v18;
}

_QWORD *sub_23A231340(uint64_t (*a1)(void), uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t *v6;
  void *v7;
  int64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  id v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t inited;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v34;
  _QWORD v35[2];
  __int128 v36;
  ValueMetadata *v37;
  unint64_t v38;
  _QWORD v39[3];
  uint64_t v40;

  v6 = v2;
  v7 = (void *)v2[1];
  v8 = v2[3];
  if (v8 >= (uint64_t)xpc_array_get_count(v7))
  {
    v20 = sub_23A23333C();
    swift_allocError();
    v22 = v21;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256953390);
    *v22 = a2;
    v23 = *v2;
    swift_beginAccess();
    v24 = *(_QWORD *)(v23 + 16);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256952AD0);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_23A2349D0;
    v26 = v6[3];
    v39[1] = 0xE600000000000000;
    v35[0] = v26;
    swift_bridgeObjectRetain();
    sub_23A2334E0();
    sub_23A233174();
    swift_bridgeObjectRelease();
    *(_QWORD *)(inited + 56) = &type metadata for XPCCodingKey;
    *(_QWORD *)(inited + 64) = sub_23A221A80();
    v27 = swift_allocObject();
    *(_QWORD *)(inited + 32) = v27;
    *(_QWORD *)(v27 + 16) = 0x207865646E49;
    *(_QWORD *)(v27 + 24) = 0xE600000000000000;
    *(_QWORD *)(v27 + 32) = v26;
    *(_BYTE *)(v27 + 40) = 0;
    v39[0] = v24;
    v18 = v39;
    sub_23A22DE48((_QWORD *)inited);
    sub_23A233330();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v20 - 8) + 104))(v22, *MEMORY[0x24BEE26E0], v20);
    swift_willThrow();
  }
  else
  {
    v9 = (_QWORD *)*v2;
    *(_QWORD *)&v36 = 0x207865646E49;
    *((_QWORD *)&v36 + 1) = 0xE600000000000000;
    v39[0] = v8;
    sub_23A2334E0();
    sub_23A233174();
    swift_bridgeObjectRelease();
    v10 = v9 + 2;
    swift_beginAccess();
    v11 = (_QWORD *)v9[2];
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v9[2] = v11;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v11 = sub_23A22DD14(0, v11[2] + 1, 1, v11);
      *v10 = v11;
    }
    v14 = v11[2];
    v13 = v11[3];
    if (v14 >= v13 >> 1)
    {
      v11 = sub_23A22DD14((_QWORD *)(v13 > 1), v14 + 1, 1, v11);
      *v10 = v11;
    }
    v37 = &type metadata for XPCCodingKey;
    v15 = sub_23A221A80();
    v38 = v15;
    v16 = swift_allocObject();
    *(_QWORD *)&v36 = v16;
    *(_QWORD *)(v16 + 16) = 0x207865646E49;
    *(_QWORD *)(v16 + 24) = 0xE600000000000000;
    *(_QWORD *)(v16 + 32) = v8;
    *(_BYTE *)(v16 + 40) = 0;
    v11[2] = v14 + 1;
    sub_23A224F80(&v36, (uint64_t)&v11[5 * v14 + 4]);
    v17 = xpc_array_get_value(v7, v8);
    v18 = v9;
    v19 = a1();
    if (v3)
    {
      swift_unknownObjectRelease();
LABEL_12:
      sub_23A228C04(v6);
      return v18;
    }
    v18 = (_QWORD *)v19;
    swift_unknownObjectRelease();
    if ((v18 & 0x10000) != 0)
    {
      v34 = sub_23A23333C();
      swift_allocError();
      v29 = v28;
      __swift_instantiateConcreteTypeFromMangledName(&qword_256953390);
      *v29 = a2;
      swift_beginAccess();
      __swift_instantiateConcreteTypeFromMangledName(&qword_256952AD0);
      v30 = swift_initStackObject();
      *(_OWORD *)(v30 + 16) = xmmword_23A2349D0;
      v40 = v6[3];
      v31 = v40;
      swift_bridgeObjectRetain();
      sub_23A2334E0();
      sub_23A233174();
      swift_bridgeObjectRelease();
      *(_QWORD *)(v30 + 56) = &type metadata for XPCCodingKey;
      *(_QWORD *)(v30 + 64) = v15;
      v32 = swift_allocObject();
      *(_QWORD *)(v30 + 32) = v32;
      *(_QWORD *)(v32 + 16) = 0x207865646E49;
      *(_QWORD *)(v32 + 24) = 0xE600000000000000;
      *(_QWORD *)(v32 + 32) = v31;
      *(_BYTE *)(v32 + 40) = 0;
      sub_23A22DE48((_QWORD *)v30);
      v35[0] = 0;
      v35[1] = 0xE000000000000000;
      v18 = v35;
      sub_23A233300();
      swift_bridgeObjectRelease();
      sub_23A233330();
      (*(void (**)(_QWORD *, _QWORD))(*(_QWORD *)(v34 - 8) + 104))(v29, *MEMORY[0x24BEE26E0]);
      swift_willThrow();
      goto LABEL_12;
    }
    v6[3] = v8 + 1;
    sub_23A228C04(v6);
  }
  return v18;
}

uint64_t sub_23A231844(uint64_t (*a1)(void), uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t *v6;
  void *v7;
  int64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t inited;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v34;
  _QWORD v35[2];
  __int128 v36;
  ValueMetadata *v37;
  unint64_t v38;
  _QWORD v39[3];
  uint64_t v40;

  v6 = v2;
  v7 = (void *)v2[1];
  v8 = v2[3];
  if (v8 >= (uint64_t)xpc_array_get_count(v7))
  {
    v20 = sub_23A23333C();
    swift_allocError();
    v22 = v21;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256953390);
    *v22 = a2;
    v23 = *v2;
    swift_beginAccess();
    v24 = *(_QWORD *)(v23 + 16);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256952AD0);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_23A2349D0;
    v26 = v6[3];
    v39[1] = 0xE600000000000000;
    v35[0] = v26;
    swift_bridgeObjectRetain();
    sub_23A2334E0();
    sub_23A233174();
    swift_bridgeObjectRelease();
    *(_QWORD *)(inited + 56) = &type metadata for XPCCodingKey;
    *(_QWORD *)(inited + 64) = sub_23A221A80();
    v27 = swift_allocObject();
    *(_QWORD *)(inited + 32) = v27;
    *(_QWORD *)(v27 + 16) = 0x207865646E49;
    *(_QWORD *)(v27 + 24) = 0xE600000000000000;
    *(_QWORD *)(v27 + 32) = v26;
    *(_BYTE *)(v27 + 40) = 0;
    v39[0] = v24;
    v18 = (uint64_t)v39;
    sub_23A22DE48((_QWORD *)inited);
    sub_23A233330();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v20 - 8) + 104))(v22, *MEMORY[0x24BEE26E0], v20);
    swift_willThrow();
  }
  else
  {
    v9 = (_QWORD *)*v2;
    *(_QWORD *)&v36 = 0x207865646E49;
    *((_QWORD *)&v36 + 1) = 0xE600000000000000;
    v39[0] = v8;
    sub_23A2334E0();
    sub_23A233174();
    swift_bridgeObjectRelease();
    v10 = v9 + 2;
    swift_beginAccess();
    v11 = (_QWORD *)v9[2];
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v9[2] = v11;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v11 = sub_23A22DD14(0, v11[2] + 1, 1, v11);
      *v10 = v11;
    }
    v14 = v11[2];
    v13 = v11[3];
    if (v14 >= v13 >> 1)
    {
      v11 = sub_23A22DD14((_QWORD *)(v13 > 1), v14 + 1, 1, v11);
      *v10 = v11;
    }
    v37 = &type metadata for XPCCodingKey;
    v15 = sub_23A221A80();
    v38 = v15;
    v16 = swift_allocObject();
    *(_QWORD *)&v36 = v16;
    *(_QWORD *)(v16 + 16) = 0x207865646E49;
    *(_QWORD *)(v16 + 24) = 0xE600000000000000;
    *(_QWORD *)(v16 + 32) = v8;
    *(_BYTE *)(v16 + 40) = 0;
    v11[2] = v14 + 1;
    sub_23A224F80(&v36, (uint64_t)&v11[5 * v14 + 4]);
    v17 = xpc_array_get_value(v7, v8);
    v18 = (uint64_t)v9;
    v19 = a1();
    if (v3)
    {
      swift_unknownObjectRelease();
LABEL_12:
      sub_23A228C04(v6);
      return v18;
    }
    v18 = v19;
    swift_unknownObjectRelease();
    if ((v18 & 0x100000000) != 0)
    {
      v34 = sub_23A23333C();
      swift_allocError();
      v29 = v28;
      __swift_instantiateConcreteTypeFromMangledName(&qword_256953390);
      *v29 = a2;
      swift_beginAccess();
      __swift_instantiateConcreteTypeFromMangledName(&qword_256952AD0);
      v30 = swift_initStackObject();
      *(_OWORD *)(v30 + 16) = xmmword_23A2349D0;
      v40 = v6[3];
      v31 = v40;
      swift_bridgeObjectRetain();
      sub_23A2334E0();
      sub_23A233174();
      swift_bridgeObjectRelease();
      *(_QWORD *)(v30 + 56) = &type metadata for XPCCodingKey;
      *(_QWORD *)(v30 + 64) = v15;
      v32 = swift_allocObject();
      *(_QWORD *)(v30 + 32) = v32;
      *(_QWORD *)(v32 + 16) = 0x207865646E49;
      *(_QWORD *)(v32 + 24) = 0xE600000000000000;
      *(_QWORD *)(v32 + 32) = v31;
      *(_BYTE *)(v32 + 40) = 0;
      sub_23A22DE48((_QWORD *)v30);
      v35[0] = 0;
      v35[1] = 0xE000000000000000;
      v18 = (uint64_t)v35;
      sub_23A233300();
      swift_bridgeObjectRelease();
      sub_23A233330();
      (*(void (**)(_QWORD *, _QWORD))(*(_QWORD *)(v34 - 8) + 104))(v29, *MEMORY[0x24BEE26E0]);
      swift_willThrow();
      goto LABEL_12;
    }
    v6[3] = v8 + 1;
    sub_23A228C04(v6);
  }
  return v18;
}

_QWORD *sub_23A231D48()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t *v2;
  void *v3;
  int64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t inited;
  uint64_t v24;
  uint64_t v25;
  char v26;
  _QWORD *v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v33;
  _QWORD v34[2];
  __int128 v35;
  ValueMetadata *v36;
  unint64_t v37;
  _QWORD v38[3];
  uint64_t v39;

  v2 = v0;
  v3 = (void *)v0[1];
  v4 = v0[3];
  if (v4 >= (uint64_t)xpc_array_get_count(v3))
  {
    v18 = sub_23A23333C();
    swift_allocError();
    v20 = v19;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256953390);
    *v20 = MEMORY[0x24BEE4568];
    v21 = *v0;
    swift_beginAccess();
    v22 = *(_QWORD *)(v21 + 16);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256952AD0);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_23A2349D0;
    v24 = v2[3];
    v38[1] = 0xE600000000000000;
    v34[0] = v24;
    swift_bridgeObjectRetain();
    sub_23A2334E0();
    sub_23A233174();
    swift_bridgeObjectRelease();
    *(_QWORD *)(inited + 56) = &type metadata for XPCCodingKey;
    *(_QWORD *)(inited + 64) = sub_23A221A80();
    v25 = swift_allocObject();
    *(_QWORD *)(inited + 32) = v25;
    *(_QWORD *)(v25 + 16) = 0x207865646E49;
    *(_QWORD *)(v25 + 24) = 0xE600000000000000;
    *(_QWORD *)(v25 + 32) = v24;
    *(_BYTE *)(v25 + 40) = 0;
    v38[0] = v22;
    v15 = v38;
    sub_23A22DE48((_QWORD *)inited);
    sub_23A233330();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v18 - 8) + 104))(v20, *MEMORY[0x24BEE26E0], v18);
    swift_willThrow();
  }
  else
  {
    v5 = (_QWORD *)*v0;
    *(_QWORD *)&v35 = 0x207865646E49;
    *((_QWORD *)&v35 + 1) = 0xE600000000000000;
    v38[0] = v4;
    sub_23A2334E0();
    sub_23A233174();
    swift_bridgeObjectRelease();
    v6 = v5 + 2;
    swift_beginAccess();
    v7 = (_QWORD *)v5[2];
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v5[2] = v7;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v7 = sub_23A22DD14(0, v7[2] + 1, 1, v7);
      *v6 = v7;
    }
    v10 = v7[2];
    v9 = v7[3];
    if (v10 >= v9 >> 1)
    {
      v7 = sub_23A22DD14((_QWORD *)(v9 > 1), v10 + 1, 1, v7);
      *v6 = v7;
    }
    v36 = &type metadata for XPCCodingKey;
    v11 = sub_23A221A80();
    v37 = v11;
    v12 = swift_allocObject();
    *(_QWORD *)&v35 = v12;
    *(_QWORD *)(v12 + 16) = 0x207865646E49;
    *(_QWORD *)(v12 + 24) = 0xE600000000000000;
    *(_QWORD *)(v12 + 32) = v4;
    *(_BYTE *)(v12 + 40) = 0;
    v7[2] = v10 + 1;
    sub_23A224F80(&v35, (uint64_t)&v7[5 * v10 + 4]);
    v13 = xpc_array_get_value(v3, v4);
    v14 = MEMORY[0x24BEE4568];
    v15 = v5;
    v16 = sub_23A22EA98(v13, 0x3436746E4955, 0xE600000000000000, MEMORY[0x24BEE4568]);
    if (v1)
    {
      swift_unknownObjectRelease();
LABEL_12:
      sub_23A228C04(v2);
      return v15;
    }
    v15 = (_QWORD *)v16;
    v26 = v17;
    swift_unknownObjectRelease();
    if ((v26 & 1) != 0)
    {
      v33 = sub_23A23333C();
      swift_allocError();
      v28 = v27;
      __swift_instantiateConcreteTypeFromMangledName(&qword_256953390);
      *v28 = v14;
      swift_beginAccess();
      __swift_instantiateConcreteTypeFromMangledName(&qword_256952AD0);
      v29 = swift_initStackObject();
      *(_OWORD *)(v29 + 16) = xmmword_23A2349D0;
      v39 = v2[3];
      v30 = v39;
      swift_bridgeObjectRetain();
      sub_23A2334E0();
      sub_23A233174();
      swift_bridgeObjectRelease();
      *(_QWORD *)(v29 + 56) = &type metadata for XPCCodingKey;
      *(_QWORD *)(v29 + 64) = v11;
      v31 = swift_allocObject();
      *(_QWORD *)(v29 + 32) = v31;
      *(_QWORD *)(v31 + 16) = 0x207865646E49;
      *(_QWORD *)(v31 + 24) = 0xE600000000000000;
      *(_QWORD *)(v31 + 32) = v30;
      *(_BYTE *)(v31 + 40) = 0;
      sub_23A22DE48((_QWORD *)v29);
      v34[0] = 0;
      v34[1] = 0xE000000000000000;
      v15 = v34;
      sub_23A233300();
      swift_bridgeObjectRelease();
      sub_23A233330();
      (*(void (**)(_QWORD *, _QWORD))(*(_QWORD *)(v33 - 8) + 104))(v28, *MEMORY[0x24BEE26E0]);
      swift_willThrow();
      goto LABEL_12;
    }
    v2[3] = v4 + 1;
    sub_23A228C04(v2);
  }
  return v15;
}

float sub_23A23226C()
{
  uint64_t *v0;
  float v1;
  uint64_t *v2;
  void *v3;
  int64_t v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  xpc_object_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  int64_t v21;
  uint64_t inited;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  double value;
  unint64_t v33;
  __int128 v34;
  ValueMetadata *v35;
  unint64_t v36;
  int64_t v37;
  unint64_t v38;

  v2 = v0;
  v3 = (void *)v0[1];
  v4 = v0[3];
  if (v4 >= (uint64_t)xpc_array_get_count(v3))
  {
    v17 = sub_23A23333C();
    swift_allocError();
    v19 = v18;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256953390);
    *v19 = MEMORY[0x24BEE14E8];
    v20 = *v0;
    swift_beginAccess();
    v21 = *(_QWORD *)(v20 + 16);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256952AD0);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_23A2349D0;
    v23 = v0[3];
    v38 = 0xE600000000000000;
    swift_bridgeObjectRetain();
    sub_23A2334E0();
    sub_23A233174();
    swift_bridgeObjectRelease();
    *(_QWORD *)(inited + 56) = &type metadata for XPCCodingKey;
    *(_QWORD *)(inited + 64) = sub_23A221A80();
    v24 = swift_allocObject();
    *(_QWORD *)(inited + 32) = v24;
    *(_QWORD *)(v24 + 16) = 0x207865646E49;
    *(_QWORD *)(v24 + 24) = 0xE600000000000000;
    *(_QWORD *)(v24 + 32) = v23;
    *(_BYTE *)(v24 + 40) = 0;
    v37 = v21;
    sub_23A22DE48((_QWORD *)inited);
    sub_23A233330();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v17 - 8) + 104))(v19, *MEMORY[0x24BEE26E0], v17);
    swift_willThrow();
  }
  else
  {
    v5 = *v0;
    *(_QWORD *)&v34 = 0x207865646E49;
    *((_QWORD *)&v34 + 1) = 0xE600000000000000;
    v37 = v4;
    sub_23A2334E0();
    sub_23A233174();
    swift_bridgeObjectRelease();
    v6 = (_QWORD *)(v5 + 16);
    swift_beginAccess();
    v7 = *(_QWORD **)(v5 + 16);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(_QWORD *)(v5 + 16) = v7;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v7 = sub_23A22DD14(0, v7[2] + 1, 1, v7);
      *v6 = v7;
    }
    v10 = v7[2];
    v9 = v7[3];
    if (v10 >= v9 >> 1)
    {
      v7 = sub_23A22DD14((_QWORD *)(v9 > 1), v10 + 1, 1, v7);
      *v6 = v7;
    }
    v35 = &type metadata for XPCCodingKey;
    v33 = sub_23A221A80();
    v36 = v33;
    v11 = swift_allocObject();
    *(_QWORD *)&v34 = v11;
    *(_QWORD *)(v11 + 16) = 0x207865646E49;
    *(_QWORD *)(v11 + 24) = 0xE600000000000000;
    *(_QWORD *)(v11 + 32) = v4;
    *(_BYTE *)(v11 + 40) = 0;
    v7[2] = v10 + 1;
    sub_23A224F80(&v34, (uint64_t)&v7[5 * v10 + 4]);
    v12 = xpc_array_get_value(v3, v4);
    v13 = MEMORY[0x23B845B54]();
    if (v13 == sub_23A233024())
    {
      swift_unknownObjectRelease();
      v25 = sub_23A23333C();
      swift_allocError();
      v27 = v26;
      __swift_instantiateConcreteTypeFromMangledName(&qword_256953390);
      *v27 = MEMORY[0x24BEE14E8];
      swift_beginAccess();
      __swift_instantiateConcreteTypeFromMangledName(&qword_256952AD0);
      v28 = swift_initStackObject();
      *(_OWORD *)(v28 + 16) = xmmword_23A2349D0;
      v29 = v2[3];
      swift_bridgeObjectRetain();
      sub_23A2334E0();
      sub_23A233174();
      swift_bridgeObjectRelease();
      *(_QWORD *)(v28 + 56) = &type metadata for XPCCodingKey;
      *(_QWORD *)(v28 + 64) = v33;
      v30 = swift_allocObject();
      *(_QWORD *)(v28 + 32) = v30;
      *(_QWORD *)(v30 + 16) = 0x207865646E49;
      *(_QWORD *)(v30 + 24) = 0xE600000000000000;
      *(_QWORD *)(v30 + 32) = v29;
      *(_BYTE *)(v30 + 40) = 0;
      sub_23A22DE48((_QWORD *)v28);
      sub_23A233300();
      swift_bridgeObjectRelease();
      sub_23A233330();
      (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v25 - 8) + 104))(v27, *MEMORY[0x24BEE26E0], v25);
      swift_willThrow();
    }
    else
    {
      v14 = MEMORY[0x23B845B54](v12);
      if (v14 == sub_23A233054())
      {
        value = xpc_double_get_value(v12);
        swift_unknownObjectRelease();
        v1 = value;
        v2[3] = v4 + 1;
        sub_23A228C04(v2);
        return v1;
      }
      sub_23A23333C();
      swift_allocError();
      v16 = v15;
      swift_bridgeObjectRetain();
      sub_23A225434(MEMORY[0x24BEE14E8], (uint64_t)v12, v16);
      swift_bridgeObjectRelease();
      swift_willThrow();
      swift_unknownObjectRelease();
    }
    sub_23A228C04(v2);
  }
  return v1;
}

double sub_23A2327F0()
{
  uint64_t *v0;
  double value;
  uint64_t *v2;
  void *v3;
  int64_t v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  xpc_object_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  int64_t v21;
  uint64_t inited;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v32;
  __int128 v33;
  ValueMetadata *v34;
  unint64_t v35;
  int64_t v36;
  unint64_t v37;

  v2 = v0;
  v3 = (void *)v0[1];
  v4 = v0[3];
  if (v4 >= (uint64_t)xpc_array_get_count(v3))
  {
    v17 = sub_23A23333C();
    swift_allocError();
    v19 = v18;
    __swift_instantiateConcreteTypeFromMangledName(&qword_256953390);
    *v19 = MEMORY[0x24BEE13C8];
    v20 = *v0;
    swift_beginAccess();
    v21 = *(_QWORD *)(v20 + 16);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256952AD0);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_23A2349D0;
    v23 = v0[3];
    v37 = 0xE600000000000000;
    swift_bridgeObjectRetain();
    sub_23A2334E0();
    sub_23A233174();
    swift_bridgeObjectRelease();
    *(_QWORD *)(inited + 56) = &type metadata for XPCCodingKey;
    *(_QWORD *)(inited + 64) = sub_23A221A80();
    v24 = swift_allocObject();
    *(_QWORD *)(inited + 32) = v24;
    *(_QWORD *)(v24 + 16) = 0x207865646E49;
    *(_QWORD *)(v24 + 24) = 0xE600000000000000;
    *(_QWORD *)(v24 + 32) = v23;
    *(_BYTE *)(v24 + 40) = 0;
    v36 = v21;
    sub_23A22DE48((_QWORD *)inited);
    sub_23A233330();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v17 - 8) + 104))(v19, *MEMORY[0x24BEE26E0], v17);
    swift_willThrow();
  }
  else
  {
    v5 = *v0;
    *(_QWORD *)&v33 = 0x207865646E49;
    *((_QWORD *)&v33 + 1) = 0xE600000000000000;
    v36 = v4;
    sub_23A2334E0();
    sub_23A233174();
    swift_bridgeObjectRelease();
    v6 = (_QWORD *)(v5 + 16);
    swift_beginAccess();
    v7 = *(_QWORD **)(v5 + 16);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(_QWORD *)(v5 + 16) = v7;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v7 = sub_23A22DD14(0, v7[2] + 1, 1, v7);
      *v6 = v7;
    }
    v10 = v7[2];
    v9 = v7[3];
    if (v10 >= v9 >> 1)
    {
      v7 = sub_23A22DD14((_QWORD *)(v9 > 1), v10 + 1, 1, v7);
      *v6 = v7;
    }
    v34 = &type metadata for XPCCodingKey;
    v32 = sub_23A221A80();
    v35 = v32;
    v11 = swift_allocObject();
    *(_QWORD *)&v33 = v11;
    *(_QWORD *)(v11 + 16) = 0x207865646E49;
    *(_QWORD *)(v11 + 24) = 0xE600000000000000;
    *(_QWORD *)(v11 + 32) = v4;
    *(_BYTE *)(v11 + 40) = 0;
    v7[2] = v10 + 1;
    sub_23A224F80(&v33, (uint64_t)&v7[5 * v10 + 4]);
    v12 = xpc_array_get_value(v3, v4);
    v13 = MEMORY[0x23B845B54]();
    if (v13 == sub_23A233024())
    {
      swift_unknownObjectRelease();
      v25 = sub_23A23333C();
      swift_allocError();
      v27 = v26;
      __swift_instantiateConcreteTypeFromMangledName(&qword_256953390);
      *v27 = MEMORY[0x24BEE13C8];
      swift_beginAccess();
      __swift_instantiateConcreteTypeFromMangledName(&qword_256952AD0);
      v28 = swift_initStackObject();
      *(_OWORD *)(v28 + 16) = xmmword_23A2349D0;
      v29 = v2[3];
      swift_bridgeObjectRetain();
      sub_23A2334E0();
      sub_23A233174();
      swift_bridgeObjectRelease();
      *(_QWORD *)(v28 + 56) = &type metadata for XPCCodingKey;
      *(_QWORD *)(v28 + 64) = v32;
      v30 = swift_allocObject();
      *(_QWORD *)(v28 + 32) = v30;
      *(_QWORD *)(v30 + 16) = 0x207865646E49;
      *(_QWORD *)(v30 + 24) = 0xE600000000000000;
      *(_QWORD *)(v30 + 32) = v29;
      *(_BYTE *)(v30 + 40) = 0;
      sub_23A22DE48((_QWORD *)v28);
      sub_23A233300();
      swift_bridgeObjectRelease();
      sub_23A233330();
      (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v25 - 8) + 104))(v27, *MEMORY[0x24BEE26E0], v25);
      swift_willThrow();
    }
    else
    {
      v14 = MEMORY[0x23B845B54](v12);
      if (v14 == sub_23A233054())
      {
        value = xpc_double_get_value(v12);
        swift_unknownObjectRelease();
        v2[3] = v4 + 1;
        sub_23A228C04(v2);
        return value;
      }
      sub_23A23333C();
      swift_allocError();
      v16 = v15;
      swift_bridgeObjectRetain();
      sub_23A225434(MEMORY[0x24BEE13C8], (uint64_t)v12, v16);
      swift_bridgeObjectRelease();
      swift_willThrow();
      swift_unknownObjectRelease();
    }
    sub_23A228C04(v2);
  }
  return value;
}

uint64_t sub_23A232D70()
{
  return swift_deallocObject();
}

uint64_t sub_23A232D80(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_23A2293A8(a1, a2, *(_QWORD *)(v2 + 32), *(_QWORD *)(v2 + 16));
}

uint64_t sub_23A232D8C()
{
  return swift_deallocObject();
}

uint64_t sub_23A232D9C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))() & 1;
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

uint64_t sub_23A232E5C()
{
  return MEMORY[0x24BDCADB8]();
}

uint64_t sub_23A232E68()
{
  return MEMORY[0x24BDCAEE8]();
}

uint64_t sub_23A232E74()
{
  return MEMORY[0x24BDCAFC8]();
}

uint64_t sub_23A232E80()
{
  return MEMORY[0x24BDCAFE0]();
}

uint64_t sub_23A232E8C()
{
  return MEMORY[0x24BDCBBA0]();
}

uint64_t sub_23A232E98()
{
  return MEMORY[0x24BDCBBC8]();
}

uint64_t sub_23A232EA4()
{
  return MEMORY[0x24BDCBBD8]();
}

uint64_t sub_23A232EB0()
{
  return MEMORY[0x24BDCBBF0]();
}

uint64_t sub_23A232EBC()
{
  return MEMORY[0x24BDCBC10]();
}

uint64_t sub_23A232EC8()
{
  return MEMORY[0x24BDCCA20]();
}

uint64_t sub_23A232ED4()
{
  return MEMORY[0x24BDCCA40]();
}

uint64_t sub_23A232EE0()
{
  return MEMORY[0x24BDCCA48]();
}

uint64_t sub_23A232EEC()
{
  return MEMORY[0x24BDCCA60]();
}

uint64_t sub_23A232EF8()
{
  return MEMORY[0x24BDCCA88]();
}

uint64_t sub_23A232F04()
{
  return MEMORY[0x24BDCCA90]();
}

uint64_t sub_23A232F10()
{
  return MEMORY[0x24BDCD2A0]();
}

uint64_t sub_23A232F1C()
{
  return MEMORY[0x24BDCD2B8]();
}

uint64_t sub_23A232F28()
{
  return MEMORY[0x24BDCD2C0]();
}

uint64_t sub_23A232F34()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_23A232F40()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_23A232F4C()
{
  return MEMORY[0x24BDCD860]();
}

uint64_t sub_23A232F58()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_23A232F64()
{
  return MEMORY[0x24BDCDB78]();
}

uint64_t sub_23A232F70()
{
  return MEMORY[0x24BDCDB80]();
}

uint64_t sub_23A232F7C()
{
  return MEMORY[0x24BDCDBB0]();
}

uint64_t sub_23A232F88()
{
  return MEMORY[0x24BDCDC10]();
}

uint64_t sub_23A232F94()
{
  return MEMORY[0x24BDCDD20]();
}

uint64_t sub_23A232FA0()
{
  return MEMORY[0x24BDCE998]();
}

uint64_t sub_23A232FAC()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_23A232FB8()
{
  return MEMORY[0x24BDCE9D0]();
}

uint64_t sub_23A232FC4()
{
  return MEMORY[0x24BDCE9E0]();
}

uint64_t sub_23A232FD0()
{
  return MEMORY[0x24BDCE9F8]();
}

uint64_t sub_23A232FDC()
{
  return MEMORY[0x24BDCEA18]();
}

uint64_t sub_23A232FE8()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_23A232FF4()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_23A233000()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_23A23300C()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_23A233018()
{
  return MEMORY[0x24BEE6440]();
}

uint64_t sub_23A233024()
{
  return MEMORY[0x24BEE6458]();
}

uint64_t sub_23A233030()
{
  return MEMORY[0x24BEE6460]();
}

uint64_t sub_23A23303C()
{
  return MEMORY[0x24BEE6468]();
}

uint64_t sub_23A233048()
{
  return MEMORY[0x24BEE6478]();
}

uint64_t sub_23A233054()
{
  return MEMORY[0x24BEE6480]();
}

uint64_t sub_23A233060()
{
  return MEMORY[0x24BEE6488]();
}

uint64_t sub_23A23306C()
{
  return MEMORY[0x24BEE6490]();
}

uint64_t sub_23A233078()
{
  return MEMORY[0x24BEE64B8]();
}

uint64_t sub_23A233084()
{
  return MEMORY[0x24BEE7698]();
}

uint64_t sub_23A233090()
{
  return MEMORY[0x24BEE76A0]();
}

uint64_t sub_23A23309C()
{
  return MEMORY[0x24BEE76B0]();
}

uint64_t sub_23A2330A8()
{
  return MEMORY[0x24BEE6010]();
}

uint64_t sub_23A2330B4()
{
  return MEMORY[0x24BEE6040]();
}

uint64_t sub_23A2330C0()
{
  return MEMORY[0x24BEE6070]();
}

uint64_t sub_23A2330CC()
{
  return MEMORY[0x24BEE60C0]();
}

uint64_t sub_23A2330D8()
{
  return MEMORY[0x24BEE60D8]();
}

uint64_t sub_23A2330E4()
{
  return MEMORY[0x24BEE0500]();
}

uint64_t sub_23A2330F0()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_23A2330FC()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_23A233108()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_23A233114()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_23A233120()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_23A23312C()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_23A233138()
{
  return MEMORY[0x24BDCFA78]();
}

uint64_t sub_23A233144()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_23A233150()
{
  return MEMORY[0x24BEE0A30]();
}

uint64_t sub_23A23315C()
{
  return MEMORY[0x24BEE0AD0]();
}

uint64_t sub_23A233168()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_23A233174()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_23A233180()
{
  return MEMORY[0x24BEE0BE8]();
}

uint64_t sub_23A23318C()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_23A233198()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_23A2331A4()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_23A2331B0()
{
  return MEMORY[0x24BDCFBB0]();
}

uint64_t sub_23A2331BC()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_23A2331C8()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_23A2331D4()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_23A2331E0()
{
  return MEMORY[0x24BEE1180]();
}

uint64_t sub_23A2331EC()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_23A2331F8()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_23A233204()
{
  return MEMORY[0x24BEE11F8]();
}

uint64_t sub_23A233210()
{
  return MEMORY[0x24BEE1250]();
}

uint64_t sub_23A23321C()
{
  return MEMORY[0x24BEE1478]();
}

uint64_t sub_23A233228()
{
  return MEMORY[0x24BDCFCC0]();
}

uint64_t sub_23A233234()
{
  return MEMORY[0x24BDCFCC8]();
}

uint64_t sub_23A233240()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_23A23324C()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_23A233258()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_23A233264()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_23A233270()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_23A23327C()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_23A233288()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_23A233294()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_23A2332A0()
{
  return MEMORY[0x24BDD0580]();
}

uint64_t sub_23A2332AC()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_23A2332B8()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_23A2332C4()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_23A2332D0()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_23A2332DC()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_23A2332E8()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_23A2332F4()
{
  return MEMORY[0x24BEE24F0]();
}

uint64_t sub_23A233300()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_23A23330C()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_23A233318()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_23A233324()
{
  return MEMORY[0x24BEE2660]();
}

uint64_t sub_23A233330()
{
  return MEMORY[0x24BEE26E8]();
}

uint64_t sub_23A23333C()
{
  return MEMORY[0x24BEE2710]();
}

uint64_t sub_23A233348()
{
  return MEMORY[0x24BEE2730]();
}

uint64_t sub_23A233354()
{
  return MEMORY[0x24BEE2750]();
}

uint64_t sub_23A233360()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_23A23336C()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_23A233378()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_23A233384()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_23A233390()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_23A23339C()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_23A2333A8()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_23A2333B4()
{
  return MEMORY[0x24BEE2CC8]();
}

uint64_t sub_23A2333C0()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_23A2333CC()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_23A2333D8()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_23A2333E4()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_23A2333F0()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_23A2333FC()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_23A233408()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_23A233414()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_23A233420()
{
  return MEMORY[0x24BEE3308]();
}

uint64_t sub_23A23342C()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_23A233438()
{
  return MEMORY[0x24BEE3358]();
}

uint64_t sub_23A233444()
{
  return MEMORY[0x24BEE3378]();
}

uint64_t sub_23A233450()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_23A23345C()
{
  return MEMORY[0x24BEE33B8]();
}

uint64_t sub_23A233468()
{
  return MEMORY[0x24BEE33E0]();
}

uint64_t sub_23A233474()
{
  return MEMORY[0x24BEE33F0]();
}

uint64_t sub_23A233480()
{
  return MEMORY[0x24BEE3458]();
}

uint64_t sub_23A23348C()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_23A233498()
{
  return MEMORY[0x24BEE34A8]();
}

uint64_t sub_23A2334A4()
{
  return MEMORY[0x24BEE34C8]();
}

uint64_t sub_23A2334B0()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_23A2334BC()
{
  return MEMORY[0x24BEE3508]();
}

uint64_t sub_23A2334C8()
{
  return MEMORY[0x24BEE3530]();
}

uint64_t sub_23A2334D4()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_23A2334E0()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_23A2334EC()
{
  return MEMORY[0x24BEE3678]();
}

uint64_t sub_23A2334F8()
{
  return MEMORY[0x24BEE3680]();
}

uint64_t sub_23A233504()
{
  return MEMORY[0x24BEE3688]();
}

uint64_t sub_23A233510()
{
  return MEMORY[0x24BEE3698]();
}

uint64_t sub_23A23351C()
{
  return MEMORY[0x24BEE36A0]();
}

uint64_t sub_23A233528()
{
  return MEMORY[0x24BEE36A8]();
}

uint64_t sub_23A233534()
{
  return MEMORY[0x24BEE36C8]();
}

uint64_t sub_23A233540()
{
  return MEMORY[0x24BEE36F0]();
}

uint64_t sub_23A23354C()
{
  return MEMORY[0x24BEE3700]();
}

uint64_t sub_23A233558()
{
  return MEMORY[0x24BEE3708]();
}

uint64_t sub_23A233564()
{
  return MEMORY[0x24BEE37D8]();
}

uint64_t sub_23A233570()
{
  return MEMORY[0x24BEE37E0]();
}

uint64_t sub_23A23357C()
{
  return MEMORY[0x24BEE37E8]();
}

uint64_t sub_23A233588()
{
  return MEMORY[0x24BEE37F0]();
}

uint64_t sub_23A233594()
{
  return MEMORY[0x24BEE37F8]();
}

uint64_t sub_23A2335A0()
{
  return MEMORY[0x24BEE3800]();
}

uint64_t sub_23A2335AC()
{
  return MEMORY[0x24BEE3808]();
}

uint64_t sub_23A2335B8()
{
  return MEMORY[0x24BEE3810]();
}

uint64_t sub_23A2335C4()
{
  return MEMORY[0x24BEE3818]();
}

uint64_t sub_23A2335D0()
{
  return MEMORY[0x24BEE3820]();
}

uint64_t sub_23A2335DC()
{
  return MEMORY[0x24BEE3828]();
}

uint64_t sub_23A2335E8()
{
  return MEMORY[0x24BEE3830]();
}

uint64_t sub_23A2335F4()
{
  return MEMORY[0x24BEE3838]();
}

uint64_t sub_23A233600()
{
  return MEMORY[0x24BEE3840]();
}

uint64_t sub_23A23360C()
{
  return MEMORY[0x24BEE3848]();
}

uint64_t sub_23A233618()
{
  return MEMORY[0x24BEE3850]();
}

uint64_t sub_23A233624()
{
  return MEMORY[0x24BEE3858]();
}

uint64_t sub_23A233630()
{
  return MEMORY[0x24BEE3860]();
}

uint64_t sub_23A23363C()
{
  return MEMORY[0x24BEE3868]();
}

uint64_t sub_23A233648()
{
  return MEMORY[0x24BEE3870]();
}

uint64_t sub_23A233654()
{
  return MEMORY[0x24BEE3938]();
}

uint64_t sub_23A233660()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_23A23366C()
{
  return MEMORY[0x24BEE3AD0]();
}

uint64_t sub_23A233678()
{
  return MEMORY[0x24BEE3AD8]();
}

uint64_t sub_23A233684()
{
  return MEMORY[0x24BEE3B70]();
}

uint64_t sub_23A233690()
{
  return MEMORY[0x24BEE3B78]();
}

uint64_t sub_23A23369C()
{
  return MEMORY[0x24BEE3BE8]();
}

uint64_t sub_23A2336A8()
{
  return MEMORY[0x24BEE3BF0]();
}

uint64_t sub_23A2336B4()
{
  return MEMORY[0x24BEE3BF8]();
}

uint64_t sub_23A2336C0()
{
  return MEMORY[0x24BEE3C08]();
}

uint64_t sub_23A2336CC()
{
  return MEMORY[0x24BEE3C10]();
}

uint64_t sub_23A2336D8()
{
  return MEMORY[0x24BEE3C18]();
}

uint64_t sub_23A2336E4()
{
  return MEMORY[0x24BEE3C38]();
}

uint64_t sub_23A2336F0()
{
  return MEMORY[0x24BEE3C60]();
}

uint64_t sub_23A2336FC()
{
  return MEMORY[0x24BEE3C70]();
}

uint64_t sub_23A233708()
{
  return MEMORY[0x24BEE3C78]();
}

uint64_t sub_23A233714()
{
  return MEMORY[0x24BEE3C80]();
}

uint64_t sub_23A233720()
{
  return MEMORY[0x24BEE3C88]();
}

uint64_t sub_23A23372C()
{
  return MEMORY[0x24BEE3C90]();
}

uint64_t sub_23A233738()
{
  return MEMORY[0x24BEE3CA0]();
}

uint64_t sub_23A233744()
{
  return MEMORY[0x24BEE3CA8]();
}

uint64_t sub_23A233750()
{
  return MEMORY[0x24BEE3CB0]();
}

uint64_t sub_23A23375C()
{
  return MEMORY[0x24BEE3CD0]();
}

uint64_t sub_23A233768()
{
  return MEMORY[0x24BEE3CE0]();
}

uint64_t sub_23A233774()
{
  return MEMORY[0x24BEE3CF8]();
}

uint64_t sub_23A233780()
{
  return MEMORY[0x24BEE3D00]();
}

uint64_t sub_23A23378C()
{
  return MEMORY[0x24BEE3D08]();
}

uint64_t sub_23A233798()
{
  return MEMORY[0x24BEE3D10]();
}

uint64_t sub_23A2337A4()
{
  return MEMORY[0x24BEE3D18]();
}

uint64_t sub_23A2337B0()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_23A2337BC()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_23A2337C8()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_23A2337D4()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_23A2337E0()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_23A2337EC()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_23A2337F8()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_23A233804()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_23A233810()
{
  return MEMORY[0x24BEE4310]();
}

uint64_t sub_23A23381C()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_23A233828()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_23A233834()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_23A233840()
{
  return MEMORY[0x24BEE49E8]();
}

uint64_t sub_23A23384C()
{
  return MEMORY[0x24BEE49F0]();
}

uint64_t sub_23A233858()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_23A233864()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t sub_23A233870()
{
  return MEMORY[0x24BEE4A98]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

uint64_t _os_crash_msg()
{
  return MEMORY[0x24BDACB58]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x24BDACBA8]();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x24BEE4B30]();
}

uint64_t abort_with_reason()
{
  return MEMORY[0x24BDAD020]();
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

uint32_t notify_post(const char *name)
{
  return MEMORY[0x24BDAF160](name);
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

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

int renamex_np(const char *a1, const char *a2, unsigned int a3)
{
  return MEMORY[0x24BDAFB90](a1, a2, *(_QWORD *)&a3);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x24BEE4B58]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x24BEE4B80]();
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

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x24BEE4C18]();
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

uint64_t swift_getDynamicType()
{
  return MEMORY[0x24BEE4D00]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x24BEE4D08]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
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

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x24BEE4DE0]();
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

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x24BEE4E68]();
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

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x24BEE4F58]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4F60]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x24BEE4F68]();
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

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x24BDB0100](a1, a2, a3, a4, a5);
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
  MEMORY[0x24BDB0630](xarray, value);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB0640](objects, count);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x24BDB0660](xarray);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x24BDB06A0](xarray, index);
}

xpc_object_t xpc_BOOL_create(BOOL value)
{
  return (xpc_object_t)MEMORY[0x24BDB06D8](value);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x24BDB06E0](xBOOL);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x24BDB08B0](xdict, applier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB08C0](keys, values, count);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x24BDB0968](xdict, key);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x24BDB09E0](xdict, key, value);
}

xpc_object_t xpc_double_create(double value)
{
  return (xpc_object_t)MEMORY[0x24BDB09E8](value);
}

double xpc_double_get_value(xpc_object_t xdouble)
{
  double result;

  MEMORY[0x24BDB09F0](xdouble);
  return result;
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x24BDB0A70](object);
}

xpc_object_t xpc_int64_create(int64_t value)
{
  return (xpc_object_t)MEMORY[0x24BDB0A80](value);
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return MEMORY[0x24BDB0A88](xint);
}

uint64_t xpc_make_serialization()
{
  return MEMORY[0x24BDB0AB8]();
}

xpc_object_t xpc_null_create(void)
{
  return (xpc_object_t)MEMORY[0x24BDB0AC0]();
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x24BDB0B80](string);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x24BDB0BA8](xstring);
}

const char *__cdecl xpc_type_get_name(xpc_type_t type)
{
  return (const char *)MEMORY[0x24BDB0BD0](type);
}

xpc_object_t xpc_uint64_create(uint64_t value)
{
  return (xpc_object_t)MEMORY[0x24BDB0BD8](value);
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return MEMORY[0x24BDB0BE0](xuint);
}

xpc_object_t xpc_uuid_create(const unsigned __int8 *uuid)
{
  return (xpc_object_t)MEMORY[0x24BDB0BF8](uuid);
}

const uint8_t *__cdecl xpc_uuid_get_bytes(xpc_object_t xuuid)
{
  return (const uint8_t *)MEMORY[0x24BDB0C00](xuuid);
}

