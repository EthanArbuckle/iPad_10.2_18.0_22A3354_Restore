uint64_t Database.writeConnection.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = (*(uint64_t (**)(void))(a2 + 32))();
  if (!v2)
    return 0;
  v3 = *(_QWORD *)(v2 + 24);
  swift_retain();
  swift_release();
  return v3;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> Database.startup()()
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
  int v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  uint64_t v15;
  int v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, _QWORD, uint64_t, uint64_t, uint64_t);
  unint64_t v21;
  unint64_t v22;
  int v23;
  int v24;

  v3 = v1;
  v4 = v0;
  v5 = (*(uint64_t (**)(void))(v1 + 32))();
  swift_release();
  if (!v5)
  {
    (*(void (**)(uint64_t, uint64_t))(v3 + 128))(v4, v3);
    if (!v2)
    {
      v6 = Database.writeConnection.getter(v4, v3);
      if (v6)
      {
        v7 = v6;
        sub_23B9777D0();
        Database.optimize()();
        if (!v8)
        {
          Database.incrementalVacuum()();
          if (!v9)
          {
            LOBYTE(v21) = 2;
            Database.checkpoint(mode:)((FindMyStorage::DatabaseCheckpointMode)&v21);
            if (!v10)
            {
              v11 = sub_23B9748E0();
              v12 = *(uint64_t (**)(uint64_t, uint64_t))(v3 + 56);
              if (v11 >= (int)v12(v4, v3))
                goto LABEL_14;
              v13 = sub_23B9748E0();
              v14 = v12;
              v15 = v13;
              v16 = v14(v4, v3);
              if (v16 < (int)v15)
              {
LABEL_19:
                __break(1u);
                swift_bridgeObjectRelease();
                swift_unexpectedError();
                __break(1u);
                return;
              }
              if ((_DWORD)v15 != v16)
              {
                v20 = *(void (**)(uint64_t, _QWORD, uint64_t, uint64_t, uint64_t))(v3 + 104);
                v23 = v16;
                while ((int)v15 < v16)
                {
                  v17 = v15 + 1;
                  v20(v15, (v15 + 1), v7, v4, v3);
                  v21 = 0;
                  v22 = 0xE000000000000000;
                  sub_23B9778D8();
                  swift_bridgeObjectRelease();
                  v21 = 0xD000000000000016;
                  v22 = 0x800000023B977FD0;
                  v24 = v15 + 1;
                  sub_23B977938();
                  sub_23B97786C();
                  swift_bridgeObjectRelease();
                  sub_23B9777AC();
                  swift_bridgeObjectRelease();
                  swift_release();
                  v15 = (v15 + 1);
                  v16 = v23;
                  if (v23 == v17)
                    goto LABEL_13;
                }
                __break(1u);
                goto LABEL_19;
              }
LABEL_13:
              Database.excludeFromBackup()();
              if (!v18)
LABEL_14:
                (*(void (**)(uint64_t, uint64_t))(v3 + 96))(v4, v3);
            }
          }
        }
        swift_release();
        return;
      }
      sub_23B973CCC();
      swift_allocError();
      *(_DWORD *)v19 = 2;
      *(_BYTE *)(v19 + 4) = 1;
      swift_willThrow();
    }
  }
}

uint64_t Database.readConnection.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = (*(uint64_t (**)(void))(a2 + 32))();
  if (!v2)
    return 0;
  v3 = *(_QWORD *)(v2 + 16);
  swift_retain();
  swift_release();
  return v3;
}

_QWORD *sub_23B9730D8@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  if ((*result & 0x8000000000000000) != 0)
  {
    result = (_QWORD *)sub_23B9778FC();
    __break(1u);
  }
  else
  {
    *a2 = *result;
  }
  return result;
}

uint64_t sub_23B973144()
{
  sub_23B97317C();
  return sub_23B977818();
}

unint64_t sub_23B97317C()
{
  unint64_t result;

  result = qword_25430A7D0;
  if (!qword_25430A7D0)
  {
    result = MEMORY[0x24260A474](&protocol conformance descriptor for UInt64, MEMORY[0x24BEE4568]);
    atomic_store(result, (unint64_t *)&qword_25430A7D0);
  }
  return result;
}

void sub_23B9731C0(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  if ((*v1 & 0x8000000000000000) != 0)
    __break(1u);
  else
    *a1 = *v1;
}

void sub_23B9731D4()
{
  Database.startup()();
}

void sub_23B9731F0()
{
  Database.purge()();
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> Database.purge()()
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
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(char *, char *, uint64_t);
  char *v27;
  char *v28;
  uint64_t v29;
  void (*v30)(char *, char *, uint64_t);
  char *v31;
  NSObject *v32;
  os_log_type_t v33;
  uint8_t *v34;
  void *v35;
  uint64_t v36;
  unint64_t v37;
  char *v38;
  void (*v39)(char *, uint64_t);
  void *v40;
  uint8_t *v41;
  void *v42;
  void *v43;
  unsigned int v44;
  id v45;
  id v46;
  uint64_t v47;
  void *v48;
  unsigned int v49;
  id v50;
  id v51;
  uint64_t v52;
  void *v53;
  unsigned int v54;
  id v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  id v59;
  void (*v60)(char *, uint64_t);
  uint64_t v61;
  char *v62;
  char *v63;
  char *v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  id v68[2];

  v3 = v1;
  v4 = v0;
  v68[1] = *(id *)MEMORY[0x24BDAC8D0];
  v66 = sub_23B977788();
  v5 = *(_QWORD *)(v66 - 8);
  v6 = MEMORY[0x24BDAC7A8](v66);
  v62 = (char *)&v58 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v58 - v9;
  v11 = MEMORY[0x24BDAC7A8](v8);
  v13 = (char *)&v58 - v12;
  v14 = MEMORY[0x24BDAC7A8](v11);
  v16 = (char *)&v58 - v15;
  v17 = MEMORY[0x24BDAC7A8](v14);
  v19 = (char *)&v58 - v18;
  v20 = MEMORY[0x24BDAC7A8](v17);
  v64 = (char *)&v58 - v21;
  v22 = MEMORY[0x24BDAC7A8](v20);
  v65 = (char *)&v58 - v23;
  MEMORY[0x24BDAC7A8](v22);
  v63 = (char *)&v58 - v24;
  (*(void (**)(_QWORD, uint64_t, uint64_t))(v3 + 40))(0, v4, v3);
  if (((*(uint64_t (**)(uint64_t, uint64_t))(v3 + 64))(v4, v3) & 1) == 0)
  {
    (*(void (**)(uint64_t, uint64_t))(v3 + 24))(v4, v3);
    (*(void (**)(char *, char *, char *, char *, uint64_t, uint64_t))(v3 + 80))(v19, v16, v13, v10, v4, v3);
    if (v2)
    {
      (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v66);
    }
    else
    {
      v25 = v66;
      v60 = *(void (**)(char *, uint64_t))(v5 + 8);
      v61 = 0;
      v60(v10, v66);
      v26 = *(void (**)(char *, char *, uint64_t))(v5 + 32);
      v27 = v63;
      v26(v63, v19, v25);
      v26(v65, v16, v25);
      v28 = v64;
      v26(v64, v13, v25);
      v59 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
      if (qword_25430A7E0 != -1)
        swift_once();
      v29 = sub_23B977854();
      __swift_project_value_buffer(v29, (uint64_t)qword_25430A8A8);
      v30 = *(void (**)(char *, char *, uint64_t))(v5 + 16);
      v31 = v62;
      v30(v62, v27, v25);
      v32 = sub_23B97783C();
      v33 = sub_23B9778A8();
      if (os_log_type_enabled(v32, v33))
      {
        v34 = (uint8_t *)swift_slowAlloc();
        v35 = (void *)swift_slowAlloc();
        v68[0] = v35;
        *(_DWORD *)v34 = 136446210;
        sub_23B9766C8(&qword_25430A7D8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB28]);
        v36 = sub_23B977938();
        v67 = sub_23B976048(v36, v37, (uint64_t *)v68);
        v38 = v63;
        sub_23B9778C0();
        swift_bridgeObjectRelease();
        v39 = v60;
        v60(v31, v66);
        _os_log_impl(&dword_23B971000, v32, v33, "Purging database: %{public}s", v34, 0xCu);
        swift_arrayDestroy();
        v40 = v35;
        v28 = v64;
        MEMORY[0x24260A4D4](v40, -1, -1);
        v41 = v34;
        v25 = v66;
        MEMORY[0x24260A4D4](v41, -1, -1);
      }
      else
      {
        v38 = v27;
        v39 = v60;
        v60(v31, v25);
      }

      v42 = v59;
      v43 = (void *)sub_23B977764();
      v68[0] = 0;
      v44 = objc_msgSend(v42, sel_removeItemAtURL_error_, v43, v68);

      if (v44)
      {
        v45 = v68[0];
      }
      else
      {
        v46 = v68[0];
        v47 = sub_23B977740();

        swift_willThrow();
        MEMORY[0x24260A444](v47);
      }
      v48 = (void *)sub_23B977764();
      v68[0] = 0;
      v49 = objc_msgSend(v42, sel_removeItemAtURL_error_, v48, v68);

      if (v49)
      {
        v50 = v68[0];
      }
      else
      {
        v51 = v68[0];
        v52 = sub_23B977740();

        swift_willThrow();
        MEMORY[0x24260A444](v52);
      }
      v53 = (void *)sub_23B977764();
      v68[0] = 0;
      v54 = objc_msgSend(v42, sel_removeItemAtURL_error_, v53, v68);

      if (v54)
      {
        v55 = v68[0];

      }
      else
      {
        v56 = v68[0];
        v57 = sub_23B977740();

        swift_willThrow();
        MEMORY[0x24260A444](v57);
      }
      v39(v28, v25);
      v39(v65, v25);
      v39(v38, v25);
    }
  }
}

void sub_23B97379C()
{
  Database.reset()();
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> Database.reset()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v3 = v1;
  v4 = v0;
  (*(void (**)(void))(v1 + 112))();
  if (!v2)
    (*(void (**)(uint64_t, uint64_t))(v3 + 88))(v4, v3);
}

void sub_23B9737EC()
{
  Database.createIfNecessary()();
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> Database.createIfNecessary()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v3 = v1;
  v4 = v0;
  v5 = sub_23B977788();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 32))(v4, v3);
  swift_release();
  if (!v9)
  {
    (*(void (**)(uint64_t, uint64_t))(v3 + 24))(v4, v3);
    v10 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 64))(v4, v3);
    v11 = Database.establishConnection(baseContainerURL:temporary:)((uint64_t)v8, v10 & 1, v4, v3);
    if (v2)
    {
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    }
    else
    {
      v12 = v11;
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 40))(v12, v4, v3);
    }
  }
}

uint64_t Database.description.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_23B9778D8();
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 16);
  sub_23B977920();
  sub_23B97786C();
  swift_bridgeObjectRelease();
  sub_23B97786C();
  MEMORY[0x24260A24C](a1, v4);
  sub_23B97786C();
  swift_bridgeObjectRelease();
  sub_23B97786C();
  sub_23B97786C();
  sub_23B97786C();
  return 60;
}

uint64_t Database.isolatedDescription.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[4] = a2;
  v3[5] = v2;
  v3[3] = a1;
  sub_23B977890();
  return swift_task_switch();
}

uint64_t sub_23B973A78()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = (_QWORD *)(v0 + 16);
  v2 = *(_QWORD *)(v0 + 32);
  v3 = (*(uint64_t (**)(_QWORD, uint64_t))(v2 + 32))(*(_QWORD *)(v0 + 24), v2);
  v4 = *(_QWORD *)(v0 + 40);
  v5 = *(_QWORD *)(v0 + 24);
  if (v3)
  {
    sub_23B9778D8();
    swift_bridgeObjectRelease();
    *v1 = v4;
    v6 = *(_QWORD *)(v2 + 16);
    sub_23B977920();
    sub_23B97786C();
    swift_bridgeObjectRelease();
    sub_23B97786C();
    MEMORY[0x24260A24C](v5, v6);
    sub_23B97786C();
    swift_bridgeObjectRelease();
    sub_23B97786C();
    sub_23B97786C();
    sub_23B97786C();
    sub_23B9777A0();
    sub_23B97786C();
    swift_bridgeObjectRelease();
    sub_23B97786C();
    swift_release();
  }
  else
  {
    sub_23B9778D8();
    swift_bridgeObjectRelease();
    *v1 = v4;
    v7 = *(_QWORD *)(v2 + 16);
    sub_23B977920();
    sub_23B97786C();
    swift_bridgeObjectRelease();
    sub_23B97786C();
    MEMORY[0x24260A24C](v5, v7);
    sub_23B97786C();
    swift_bridgeObjectRelease();
    sub_23B97786C();
    sub_23B97786C();
    sub_23B97786C();
  }
  return (*(uint64_t (**)(uint64_t, unint64_t))(v0 + 8))(60, 0xE100000000000000);
}

unint64_t sub_23B973CCC()
{
  unint64_t result;

  result = qword_256A57B00;
  if (!qword_256A57B00)
  {
    result = MEMORY[0x24260A474](&protocol conformance descriptor for DatabaseError, &type metadata for DatabaseError);
    atomic_store(result, (unint64_t *)&qword_256A57B00);
  }
  return result;
}

uint64_t Database.establishConnection(baseContainerURL:temporary:)(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
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
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  _QWORD *v32;
  void (*v33)(char *, char *, id);
  char *v34;
  char *v35;
  id v36;
  unsigned int *v37;
  _QWORD *v38;
  _QWORD *v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  unint64_t v52;
  char *v53;
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  char *v57;
  NSObject *v58;
  os_log_type_t v59;
  _BOOL4 v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  uint64_t v65;
  _QWORD *v66;
  os_log_t v67;
  _QWORD *v68;
  char *v69;
  char *v70;
  char *v71;
  uint64_t *v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  unsigned int v76;
  id v77;
  id v78;
  uint64_t v79;
  void *v80;
  unsigned int v81;
  id v82;
  id v83;
  uint64_t v84;
  void *v85;
  unsigned int v86;
  id v87;
  id v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t *v91;
  uint64_t v92;
  unint64_t v93;
  uint64_t v94;
  unint64_t v95;
  char *v96;
  os_log_t v98;
  _QWORD *v99;
  char *v100;
  char *v101;
  char *v102;
  uint64_t v103;
  uint64_t v104;
  char *v105;
  uint64_t *v106;
  char *v107;
  uint64_t *v108;
  char *v109;
  uint64_t v110;
  _QWORD *v111;
  id v112;
  int v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  id v117[3];

  v113 = a2;
  v115 = a1;
  v117[1] = *(id *)MEMORY[0x24BDAC8D0];
  v114 = sub_23B9777E8();
  v110 = *(_QWORD *)(v114 - 8);
  v8 = MEMORY[0x24BDAC7A8](v114);
  v108 = (uint64_t *)((char *)&v98 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  v10 = MEMORY[0x24BDAC7A8](v8);
  v106 = (uint64_t *)((char *)&v98 - v11);
  MEMORY[0x24BDAC7A8](v10);
  v105 = (char *)&v98 - v12;
  v13 = (_QWORD *)sub_23B977788();
  v111 = (_QWORD *)*(v13 - 1);
  v112 = v13;
  v14 = MEMORY[0x24BDAC7A8](v13);
  v107 = (char *)&v98 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v98 - v17;
  v19 = MEMORY[0x24BDAC7A8](v16);
  v21 = (char *)&v98 - v20;
  v22 = MEMORY[0x24BDAC7A8](v19);
  v24 = (char *)&v98 - v23;
  v25 = MEMORY[0x24BDAC7A8](v22);
  v27 = (char *)&v98 - v26;
  v28 = MEMORY[0x24BDAC7A8](v25);
  v30 = (char *)&v98 - v29;
  MEMORY[0x24BDAC7A8](v28);
  v109 = (char *)&v98 - v31;
  (*(void (**)(char *, char *, char *, uint64_t, uint64_t, uint64_t))(a4 + 80))(v24, v21, v18, v115, a3, a4);
  if (!v5)
  {
    v100 = 0;
    v103 = v4;
    v104 = a4;
    v115 = a3;
    v32 = v111;
    v33 = (void (*)(char *, char *, id))v111[4];
    v34 = v109;
    v35 = v24;
    v36 = v112;
    v33(v109, v35, v112);
    v102 = v30;
    v33(v30, v21, v36);
    v101 = v27;
    v33(v27, v18, v36);
    v37 = (unsigned int *)MEMORY[0x24BEB31A8];
    if ((v113 & 1) != 0)
    {
      v38 = v32;
      v39 = *(_QWORD **)(v110 + 104);
      v40 = (uint64_t)v105;
      v41 = v114;
      ((void (*)(char *, _QWORD, uint64_t))v39)(v105, *MEMORY[0x24BEB31B8], v114);
      type metadata accessor for ConnectionPair();
      swift_allocObject();
      v42 = v100;
      v43 = ConnectionPair.init(_:readonly:key:)(v40, 0, 0, 0xF000000000000000);
      if (v42)
      {
        v106 = 0;
        v44 = v42;
LABEL_9:
        v112 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
        if (qword_25430A7E0 != -1)
          swift_once();
        v111 = v39;
        v56 = sub_23B977854();
        __swift_project_value_buffer(v56, (uint64_t)qword_25430A8A8);
        v57 = v107;
        ((void (*)(char *, char *, id))v38[2])(v107, v34, v36);
        MEMORY[0x24260A450](v44);
        MEMORY[0x24260A450](v44);
        v58 = sub_23B97783C();
        v59 = sub_23B97789C();
        v60 = os_log_type_enabled(v58, v59);
        v105 = v44;
        if (v60)
        {
          v61 = swift_slowAlloc();
          v98 = v58;
          v62 = v61;
          v99 = (_QWORD *)swift_slowAlloc();
          v100 = (char *)swift_slowAlloc();
          v117[0] = v100;
          *(_DWORD *)v62 = 136446466;
          sub_23B9766C8(&qword_25430A7D8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDB28]);
          v63 = sub_23B977938();
          v116 = sub_23B976048(v63, v64, (uint64_t *)v117);
          sub_23B9778C0();
          swift_bridgeObjectRelease();
          v107 = (char *)v38[1];
          ((void (*)(char *, id))v107)(v57, v36);
          *(_WORD *)(v62 + 12) = 2114;
          v65 = sub_23B977734();
          v116 = v65;
          sub_23B9778C0();
          v66 = v99;
          *v99 = v65;
          MEMORY[0x24260A444](v44);
          MEMORY[0x24260A444](v44);
          v67 = v98;
          _os_log_impl(&dword_23B971000, v98, v59, "Unable to open %{public}s: %{public}@", (uint8_t *)v62, 0x16u);
          __swift_instantiateConcreteTypeFromMangledName(&qword_256A57B10);
          swift_arrayDestroy();
          v68 = v66;
          v34 = v109;
          v41 = v114;
          MEMORY[0x24260A4D4](v68, -1, -1);
          v69 = v100;
          swift_arrayDestroy();
          MEMORY[0x24260A4D4](v69, -1, -1);
          MEMORY[0x24260A4D4](v62, -1, -1);

        }
        else
        {
          v107 = (char *)v38[1];
          ((void (*)(char *, id))v107)(v57, v36);
          MEMORY[0x24260A444](v44);
          MEMORY[0x24260A444](v44);

        }
        v71 = v101;
        v70 = v102;
        v72 = v108;
        v73 = v115;
        v74 = v104;
        if ((v113 & 1) == 0)
        {
          v75 = (void *)sub_23B977764();
          v117[0] = 0;
          v76 = objc_msgSend(v112, sel_removeItemAtURL_error_, v75, v117);

          if (v76)
          {
            v77 = v117[0];
          }
          else
          {
            v78 = v117[0];
            v79 = sub_23B977740();

            swift_willThrow();
            MEMORY[0x24260A444](v79);
            v106 = 0;
          }
          v80 = (void *)sub_23B977764();
          v117[0] = 0;
          v81 = objc_msgSend(v112, sel_removeItemAtURL_error_, v80, v117);

          if (v81)
          {
            v82 = v117[0];
          }
          else
          {
            v83 = v117[0];
            v84 = sub_23B977740();

            swift_willThrow();
            MEMORY[0x24260A444](v84);
            v106 = 0;
          }
          v85 = (void *)sub_23B977764();
          v117[0] = 0;
          v86 = objc_msgSend(v112, sel_removeItemAtURL_error_, v85, v117);

          if (v86)
          {
            v87 = v117[0];
          }
          else
          {
            v88 = v117[0];
            v89 = sub_23B977740();

            swift_willThrow();
            MEMORY[0x24260A444](v89);
            v106 = 0;
          }
          v41 = v114;
          v73 = v115;
        }
        *v72 = sub_23B97777C();
        v72[1] = v90;
        ((void (*)(uint64_t *, _QWORD, uint64_t))v111)(v72, *MEMORY[0x24BEB31A8], v41);
        v4 = v103;
        v91 = v106;
        v92 = (*(uint64_t (**)(uint64_t, uint64_t))(v74 + 72))(v73, v74);
        if (v91)
        {

          MEMORY[0x24260A444](v105);
          (*(void (**)(uint64_t *, uint64_t))(v110 + 8))(v72, v41);
          v96 = v107;
          ((void (*)(char *, id))v107)(v71, v36);
          ((void (*)(char *, id))v96)(v70, v36);
          ((void (*)(char *, id))v96)(v34, v36);
          return v4;
        }
        v94 = v92;
        v95 = v93;
        type metadata accessor for ConnectionPair();
        swift_allocObject();
        v4 = ConnectionPair.init(_:readonly:key:)((uint64_t)v72, 0, v94, v95);

        MEMORY[0x24260A444](v105);
        v53 = v107;
        ((void (*)(char *, id))v107)(v71, v36);
LABEL_30:
        ((void (*)(char *, id))v53)(v70, v36);
        ((void (*)(char *, id))v53)(v34, v36);
        return v4;
      }
      v4 = v43;
      v53 = (char *)v38[1];
    }
    else
    {
      v45 = sub_23B97777C();
      v46 = (uint64_t)v106;
      *v106 = v45;
      *(_QWORD *)(v46 + 8) = v47;
      v48 = *v37;
      v49 = v110;
      v39 = *(_QWORD **)(v110 + 104);
      v41 = v114;
      ((void (*)(uint64_t, uint64_t, uint64_t))v39)(v46, v48, v114);
      v50 = v100;
      v51 = (*(uint64_t (**)(uint64_t))(v104 + 72))(v115);
      v44 = v50;
      if (v50)
      {
        (*(void (**)(uint64_t, uint64_t))(v49 + 8))(v46, v41);
        v106 = 0;
        v38 = v111;
        v36 = v112;
        goto LABEL_9;
      }
      v54 = v51;
      v55 = v52;
      type metadata accessor for ConnectionPair();
      swift_allocObject();
      v4 = ConnectionPair.init(_:readonly:key:)(v46, 0, v54, v55);
      v36 = v112;
      v53 = (char *)v111[1];
    }
    v70 = v102;
    ((void (*)(char *, id))v53)(v101, v36);
    goto LABEL_30;
  }
  return v4;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> Database.optimize()()
{
  uint64_t v0;
  uint64_t v1;

  sub_23B97463C(v0, v1);
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> Database.incrementalVacuum()()
{
  uint64_t v0;
  uint64_t v1;

  sub_23B97463C(v0, v1);
}

uint64_t sub_23B97463C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  if (Database.writeConnection.getter(a1, a2))
  {
    sub_23B9777D0();
    return swift_release();
  }
  else
  {
    sub_23B973CCC();
    swift_allocError();
    *(_DWORD *)v3 = 2;
    *(_BYTE *)(v3 + 4) = 1;
    return swift_willThrow();
  }
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> Database.checkpoint(mode:)(FindMyStorage::DatabaseCheckpointMode mode)
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  sqlite3 *v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  int pnCkpt[2];
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = *(unsigned __int8 *)mode;
  if (Database.writeConnection.getter(v1, v2))
  {
    *(_QWORD *)pnCkpt = 0;
    v4 = (sqlite3 *)sub_23B9777B8();
    sqlite3_wal_checkpoint_v2(v4, "main", v3, &pnCkpt[1], pnCkpt);
    if (qword_25430A820 != -1)
      swift_once();
    v5 = sub_23B977854();
    __swift_project_value_buffer(v5, (uint64_t)qword_25430A8C0);
    v6 = sub_23B97783C();
    v7 = sub_23B9778A8();
    if (os_log_type_enabled(v6, v7))
    {
      v8 = swift_slowAlloc();
      *(_DWORD *)v8 = 67109376;
      swift_beginAccess();
      v11 = pnCkpt[0];
      sub_23B9778C0();
      *(_WORD *)(v8 + 8) = 1024;
      swift_beginAccess();
      sub_23B9778C0();
      _os_log_impl(&dword_23B971000, v6, v7, "Checkpointed %d/%d", (uint8_t *)v8, 0xEu);
      MEMORY[0x24260A4D4](v8, -1, -1);
    }

    swift_release();
  }
  else
  {
    sub_23B973CCC();
    swift_allocError();
    *(_DWORD *)v9 = 2;
    *(_BYTE *)(v9 + 4) = 1;
    swift_willThrow();
  }
}

uint64_t sub_23B9748E0()
{
  uint64_t result;
  uint64_t v1;
  __int128 v2;
  uint64_t v3;
  _BYTE v4[40];

  sub_23B9777C4();
  if (!v3)
    goto LABEL_7;
  sub_23B977020(&v2, (uint64_t)v4);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25430A810);
  swift_dynamicCast();
  result = v1;
  if (v1 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (v1 > 0x7FFFFFFF)
  {
LABEL_6:
    __break(1u);
LABEL_7:
    __break(1u);
    result = swift_unexpectedError();
    __break(1u);
  }
  return result;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> Database.excludeFromBackup()()
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
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(char *, char *, uint64_t);
  char *v27;
  char *v28;
  char *v29;
  void *v30;
  id v31;
  uint64_t v32;
  char *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(char *, uint64_t);
  void *v38;
  unsigned int v39;
  void (*v40)(char *, uint64_t);
  void *v41;
  unsigned int v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  void (*v46)(char *, uint64_t);
  void (*v47)(char *, uint64_t);
  uint64_t v48;
  uint64_t v49;
  char *v50;
  char *v51;
  char *v52;
  char *v53;
  id v54;
  uint64_t v55;

  v2 = v1;
  v3 = v0;
  v4 = sub_23B977728();
  v48 = *(_QWORD *)(v4 - 8);
  v49 = v4;
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v51 = (char *)&v47 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_23B977788();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v10 = (char *)&v47 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v8);
  v13 = (char *)&v47 - v12;
  v14 = MEMORY[0x24BDAC7A8](v11);
  v16 = (char *)&v47 - v15;
  v17 = MEMORY[0x24BDAC7A8](v14);
  v19 = (char *)&v47 - v18;
  v20 = MEMORY[0x24BDAC7A8](v17);
  v50 = (char *)&v47 - v21;
  v22 = MEMORY[0x24BDAC7A8](v20);
  v53 = (char *)&v47 - v23;
  MEMORY[0x24BDAC7A8](v22);
  v52 = (char *)&v47 - v24;
  v54 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  (*(void (**)(uint64_t, uint64_t))(v2 + 24))(v3, v2);
  v25 = v55;
  (*(void (**)(char *, char *, char *, char *, uint64_t, uint64_t))(v2 + 80))(v19, v16, v13, v10, v3, v2);
  if (v25)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);

    return;
  }
  v55 = 0;
  v47 = *(void (**)(char *, uint64_t))(v7 + 8);
  v47(v10, v6);
  v26 = *(void (**)(char *, char *, uint64_t))(v7 + 32);
  v27 = v52;
  v26(v52, v19, v6);
  v26(v53, v16, v6);
  v28 = v50;
  v26(v50, v13, v6);
  v29 = v51;
  sub_23B97771C();
  sub_23B977710();
  sub_23B97777C();
  v30 = (void *)sub_23B977860();
  swift_bridgeObjectRelease();
  v31 = v54;
  LODWORD(v26) = objc_msgSend(v54, sel_fileExistsAtPath_, v30);

  v32 = v6;
  v33 = v53;
  if ((_DWORD)v26)
  {
    v34 = v27;
    v35 = v55;
    sub_23B977758();
    v36 = v35;
    if (v35)
    {

      (*(void (**)(char *, uint64_t))(v48 + 8))(v29, v49);
      v37 = v47;
      v47(v28, v32);
      v37(v33, v32);
      v37(v34, v32);
      return;
    }
  }
  else
  {
    v36 = v55;
  }
  sub_23B97777C();
  v38 = (void *)sub_23B977860();
  swift_bridgeObjectRelease();
  v39 = objc_msgSend(v31, sel_fileExistsAtPath_, v38);

  if (v39)
  {
    sub_23B977758();
    if (v36)
    {

      (*(void (**)(char *, uint64_t))(v48 + 8))(v29, v49);
      v40 = v47;
      v47(v28, v32);
      v40(v33, v32);
      v40(v52, v32);
      return;
    }
  }
  sub_23B97777C();
  v41 = (void *)sub_23B977860();
  swift_bridgeObjectRelease();
  v42 = objc_msgSend(v31, sel_fileExistsAtPath_, v41);

  if (v42)
  {
    sub_23B977758();
    v43 = v49;
    v44 = v52;
    if (v36)
    {

      (*(void (**)(char *, uint64_t))(v48 + 8))(v29, v43);
      goto LABEL_16;
    }
    v45 = v48;
  }
  else
  {
    v45 = v48;
    v43 = v49;
    v44 = v52;
  }

  (*(void (**)(char *, uint64_t))(v45 + 8))(v29, v43);
LABEL_16:
  v46 = v47;
  v47(v28, v32);
  v46(v33, v32);
  v46(v44, v32);
}

uint64_t Database.tableNames(connection:)()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t);
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v2 = sub_23B9777DC();
  if (v0)
    return (uint64_t)v1;
  v3 = v2;
  v13[0] = v2;
  sub_23B977830();
  v4 = (uint64_t (*)(uint64_t))MEMORY[0x24BEB33A8];
  sub_23B9766C8(&qword_25430A7A8, (uint64_t (*)(uint64_t))MEMORY[0x24BEB33A8], MEMORY[0x24BEB33B8]);
  swift_retain();
  sub_23B977884();
  sub_23B9766C8(&qword_25430A7B0, v4, MEMORY[0x24BEB33C0]);
  result = sub_23B9778B4();
  v6 = v16;
  if (!v16)
  {
    v1 = (_QWORD *)MEMORY[0x24BEE4AF8];
LABEL_20:
    swift_release();
    swift_release();
    return (uint64_t)v1;
  }
  v1 = (_QWORD *)MEMORY[0x24BEE4AF8];
  while (*(_QWORD *)(v6 + 16))
  {
    sub_23B976708(v6 + 32, (uint64_t)v13);
    if (v13[3])
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_25430A810);
      if ((swift_dynamicCast() & 1) != 0)
        goto LABEL_10;
    }
    else
    {
      sub_23B976750((uint64_t)v13);
    }
    v14 = 0;
    v15 = 0;
LABEL_10:
    swift_bridgeObjectRelease();
    v7 = v15;
    if (v15)
    {
      v11 = v14;
      v12 = v3;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v1 = sub_23B975F3C(0, v1[2] + 1, 1, v1);
      v9 = v1[2];
      v8 = v1[3];
      if (v9 >= v8 >> 1)
        v1 = sub_23B975F3C((_QWORD *)(v8 > 1), v9 + 1, 1, v1);
      v1[2] = v9 + 1;
      v10 = &v1[2 * v9];
      v10[4] = v11;
      v10[5] = v7;
      result = sub_23B9778B4();
      v6 = v16;
      v3 = v12;
      if (!v16)
        goto LABEL_20;
    }
    else
    {
      result = sub_23B9778B4();
      v6 = v16;
      if (!v16)
        goto LABEL_20;
    }
  }
  __break(1u);
  return result;
}

uint64_t Database.columnNames(connection:tableName:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  _QWORD v20[5];
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  sub_23B9777DC();
  if (v3)
    return (uint64_t)v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25430A7A0);
  v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_23B977C10;
  v8 = MEMORY[0x24BEB33D0];
  *(_QWORD *)(v7 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v7 + 64) = v8;
  *(_QWORD *)(v7 + 32) = a2;
  *(_QWORD *)(v7 + 40) = a3;
  swift_bridgeObjectRetain();
  v10 = sub_23B977824();
  swift_bridgeObjectRelease();
  v20[0] = v10;
  sub_23B977830();
  v11 = (uint64_t (*)(uint64_t))MEMORY[0x24BEB33A8];
  sub_23B9766C8(&qword_25430A7A8, (uint64_t (*)(uint64_t))MEMORY[0x24BEB33A8], MEMORY[0x24BEB33B8]);
  swift_retain();
  sub_23B977884();
  sub_23B9766C8(&qword_25430A7B0, v11, MEMORY[0x24BEB33C0]);
  result = sub_23B9778B4();
  v12 = v23;
  if (!v23)
  {
    v4 = (_QWORD *)MEMORY[0x24BEE4AF8];
LABEL_21:
    swift_release();
    swift_release();
    swift_release();
    return (uint64_t)v4;
  }
  v4 = (_QWORD *)MEMORY[0x24BEE4AF8];
  while (*(_QWORD *)(v12 + 16))
  {
    sub_23B976708(v12 + 32, (uint64_t)v20);
    if (v20[3])
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_25430A810);
      if ((swift_dynamicCast() & 1) != 0)
        goto LABEL_12;
    }
    else
    {
      sub_23B976750((uint64_t)v20);
    }
    v21 = 0;
    v22 = 0;
LABEL_12:
    swift_bridgeObjectRelease();
    v13 = v22;
    if (v22)
    {
      v19 = v21;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v4 = sub_23B975F3C(0, v4[2] + 1, 1, v4);
      v15 = v4[2];
      v14 = v4[3];
      v16 = v15 + 1;
      if (v15 >= v14 >> 1)
      {
        v18 = sub_23B975F3C((_QWORD *)(v14 > 1), v15 + 1, 1, v4);
        v16 = v15 + 1;
        v4 = v18;
      }
      v4[2] = v16;
      v17 = &v4[2 * v15];
      v17[4] = v19;
      v17[5] = v13;
    }
    result = sub_23B9778B4();
    v12 = v23;
    if (!v23)
      goto LABEL_21;
  }
  __break(1u);
  return result;
}

Swift::Int64 __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> Database._test_raw_scalar_sql_query(_:)(Swift::String a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  Swift::Int64 v9;
  _BYTE v10[24];
  uint64_t v11;

  v4 = v2;
  v5 = v1;
  if ((MEMORY[0x24260A000]() & 1) == 0)
    return 0;
  if (Database.readConnection.getter(v5, v4))
  {
    sub_23B9777C4();
    if (!v3)
    {
      if (v11)
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_25430A810);
        if (swift_dynamicCast())
        {
          swift_release();
          return v9;
        }
      }
      else
      {
        sub_23B976750((uint64_t)v10);
      }
      sub_23B973CCC();
      swift_allocError();
      *(_DWORD *)v8 = 0;
      *(_BYTE *)(v8 + 4) = 1;
      swift_willThrow();
    }
    return swift_release();
  }
  else
  {
    sub_23B973CCC();
    swift_allocError();
    *(_DWORD *)v7 = 2;
    *(_BYTE *)(v7 + 4) = 1;
    return swift_willThrow();
  }
}

void *sub_23B975470(char *a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  void *v12;
  void (*v13)(char *, uint64_t);
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  id v25[6];

  v25[5] = *(id *)MEMORY[0x24BDAC8D0];
  v7 = sub_23B977788();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  sub_23B977770();
  v12 = (void *)sub_23B977764();
  v13 = *(void (**)(char *, uint64_t))(v8 + 8);
  v13(v10, v7);
  v25[0] = 0;
  LODWORD(v10) = objc_msgSend(v11, sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_, v12, 1, 0, v25);

  v14 = v25[0];
  if (!(_DWORD)v10)
  {
    v15 = v14;
    sub_23B977740();

    swift_willThrow();
    sub_23B976CD8(a3, a4);
    v18 = a1;
    v19 = v7;
    goto LABEL_5;
  }
  v22 = v7;
  sub_23B97777C();
  v15 = v23;
  v16 = v24;
  v17 = sub_23B97780C();
  if (v16)
  {
    sub_23B976CD8(a3, a4);
    v18 = a1;
    v19 = v22;
LABEL_5:
    v13(v18, v19);
    return v15;
  }
  v15 = (void *)v17;
  if (a4 >> 60 != 15)
    __asm { BR              X10 }
  swift_retain();
  v13(a1, v22);
  swift_release();
  return v15;
}

unint64_t static UInt8.fromDatatypeValue(_:)(unint64_t result)
{
  if ((result & 0x8000000000000000) != 0 || result >= 0x100)
  {
    result = sub_23B9778FC();
    __break(1u);
  }
  return result;
}

uint64_t UInt8.datatypeValue.getter(uint64_t result)
{
  return result;
}

unint64_t *sub_23B9759D0@<X0>(unint64_t *result@<X0>, _BYTE *a2@<X8>)
{
  unint64_t v2;

  v2 = *result;
  if ((*result & 0x8000000000000000) != 0 || v2 >= 0x100)
  {
    result = (unint64_t *)sub_23B9778FC();
    __break(1u);
  }
  else
  {
    *a2 = v2;
  }
  return result;
}

void sub_23B975A80(_QWORD *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = *v1;
}

uint64_t sub_23B975A8C()
{
  sub_23B976C94();
  return sub_23B977818();
}

uint64_t static Int32.fromDatatypeValue(_:)(uint64_t result)
{
  if (result < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_5;
  }
  if (result > 0x7FFFFFFF)
LABEL_5:
    __break(1u);
  return result;
}

uint64_t Int32.datatypeValue.getter(uint64_t result)
{
  return (int)result;
}

uint64_t *sub_23B975AF4@<X0>(uint64_t *result@<X0>, _DWORD *a2@<X8>)
{
  uint64_t v2;

  v2 = *result;
  if (*result < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
  }
  else if (v2 <= 0x7FFFFFFF)
  {
    *a2 = v2;
    return result;
  }
  __break(1u);
  return result;
}

void sub_23B975B20(_QWORD *a1@<X8>)
{
  int *v1;

  *a1 = *v1;
}

uint64_t sub_23B975B2C()
{
  sub_23B976C50();
  return sub_23B977818();
}

unint64_t static UInt32.fromDatatypeValue(_:)(unint64_t result)
{
  if ((result & 0x8000000000000000) != 0 || HIDWORD(result))
  {
    result = sub_23B9778FC();
    __break(1u);
  }
  return result;
}

uint64_t UInt32.datatypeValue.getter(uint64_t result)
{
  return result;
}

unint64_t *sub_23B975C14@<X0>(unint64_t *result@<X0>, _DWORD *a2@<X8>)
{
  unint64_t v2;

  v2 = *result;
  if ((*result & 0x8000000000000000) != 0 || HIDWORD(v2))
  {
    result = (unint64_t *)sub_23B9778FC();
    __break(1u);
  }
  else
  {
    *a2 = v2;
  }
  return result;
}

void sub_23B975CC4(_QWORD *a1@<X8>)
{
  unsigned int *v1;

  *a1 = *v1;
}

uint64_t sub_23B975CD0()
{
  sub_23B976C0C();
  return sub_23B977818();
}

uint64_t static UInt64.fromDatatypeValue(_:)(uint64_t result)
{
  if (result < 0)
  {
    result = sub_23B9778FC();
    __break(1u);
  }
  return result;
}

uint64_t UInt64.datatypeValue.getter(uint64_t result)
{
  if (result < 0)
    __break(1u);
  return result;
}

BOOL static DatabaseCheckpointMode.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t DatabaseCheckpointMode.hash(into:)()
{
  return sub_23B97798C();
}

uint64_t DatabaseCheckpointMode.hashValue.getter()
{
  sub_23B977980();
  sub_23B97798C();
  return sub_23B977998();
}

BOOL sub_23B975DF0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_23B975E04()
{
  sub_23B977980();
  sub_23B97798C();
  return sub_23B977998();
}

uint64_t sub_23B975E48()
{
  return sub_23B97798C();
}

uint64_t sub_23B975E70()
{
  sub_23B977980();
  sub_23B97798C();
  return sub_23B977998();
}

uint64_t sub_23B975EB0()
{
  uint64_t v0;

  v0 = sub_23B977854();
  __swift_allocate_value_buffer(v0, qword_25430A8A8);
  __swift_project_value_buffer(v0, (uint64_t)qword_25430A8A8);
  return sub_23B977848();
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

_QWORD *sub_23B975F3C(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_25430A7B8);
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
    sub_23B976E90(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_23B976048(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_23B976118(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_23B976FA4((uint64_t)v12, *a3);
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
      sub_23B976FA4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_23B976118(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_23B9778CC();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_23B9762D0(a5, a6);
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
  v8 = sub_23B9778F0();
  if (!v8)
  {
    sub_23B9778FC();
    __break(1u);
LABEL_17:
    result = sub_23B977914();
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

uint64_t sub_23B9762D0(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_23B976364(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_23B97653C(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_23B97653C(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_23B976364(uint64_t a1, unint64_t a2)
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
      v3 = sub_23B9764D8(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_23B9778E4();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_23B9778FC();
      __break(1u);
LABEL_10:
      v2 = sub_23B977878();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_23B977914();
    __break(1u);
LABEL_14:
    result = sub_23B9778FC();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_23B9764D8(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_256A57B48);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_23B97653C(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_256A57B48);
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
  result = sub_23B977914();
  __break(1u);
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24260A468]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_23B9766C8(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x24260A474](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23B976708(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25430A818);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23B976750(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25430A818);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_23B976794()
{
  unint64_t result;

  result = qword_25430A7C0;
  if (!qword_25430A7C0)
  {
    result = MEMORY[0x24260A474](&protocol conformance descriptor for UInt8, MEMORY[0x24BEE4260]);
    atomic_store(result, (unint64_t *)&qword_25430A7C0);
  }
  return result;
}

uint64_t sub_23B9767D8()
{
  return MEMORY[0x24BEB33F8];
}

unint64_t sub_23B9767E8()
{
  unint64_t result;

  result = qword_256A57B18;
  if (!qword_256A57B18)
  {
    result = MEMORY[0x24260A474](&protocol conformance descriptor for Int32, MEMORY[0x24BEE3F88]);
    atomic_store(result, (unint64_t *)&qword_256A57B18);
  }
  return result;
}

unint64_t sub_23B976830()
{
  unint64_t result;

  result = qword_256A57B20;
  if (!qword_256A57B20)
  {
    result = MEMORY[0x24260A474](&protocol conformance descriptor for UInt32, MEMORY[0x24BEE44F0]);
    atomic_store(result, (unint64_t *)&qword_256A57B20);
  }
  return result;
}

unint64_t sub_23B976878()
{
  unint64_t result;

  result = qword_25430A7C8;
  if (!qword_25430A7C8)
  {
    result = MEMORY[0x24260A474](&protocol conformance descriptor for UInt64, MEMORY[0x24BEE4568]);
    atomic_store(result, (unint64_t *)&qword_25430A7C8);
  }
  return result;
}

unint64_t sub_23B9768C0()
{
  unint64_t result;

  result = qword_256A57B28;
  if (!qword_256A57B28)
  {
    result = MEMORY[0x24260A474](&protocol conformance descriptor for DatabaseCheckpointMode, &type metadata for DatabaseCheckpointMode);
    atomic_store(result, (unint64_t *)&qword_256A57B28);
  }
  return result;
}

uint64_t dispatch thunk of Database.baseContainerURL.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of Database.connectionPair.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of Database.connectionPair.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t dispatch thunk of Database.connectionPair.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

uint64_t dispatch thunk of Database.currentVersion.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of Database.temporary.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t dispatch thunk of Database.encryptionKey()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 72))();
}

uint64_t dispatch thunk of Database.underlyingFileURLs(baseContainerURL:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 80))();
}

uint64_t dispatch thunk of Database.startup()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 88))();
}

uint64_t dispatch thunk of Database.databaseAvailable()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 96))();
}

uint64_t dispatch thunk of Database.migrate(from:to:writeConnection:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 104))();
}

uint64_t dispatch thunk of Database.purge()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 112))();
}

uint64_t dispatch thunk of Database.reset()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 120))();
}

uint64_t dispatch thunk of Database.createIfNecessary()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 128))();
}

uint64_t __swift_memcpy5_4(uint64_t result, int *a2)
{
  int v2;

  v2 = *a2;
  *(_BYTE *)(result + 4) = *((_BYTE *)a2 + 4);
  *(_DWORD *)result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for DatabaseError(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 5))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for DatabaseError(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_BYTE *)(result + 4) = 0;
    *(_DWORD *)result = a2 - 1;
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
  *(_BYTE *)(result + 5) = v3;
  return result;
}

uint64_t sub_23B976A48(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 4))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_23B976A64(uint64_t result, int a2)
{
  if (a2)
  {
    *(_DWORD *)result = a2 - 1;
    *(_BYTE *)(result + 4) = 1;
  }
  else
  {
    *(_BYTE *)(result + 4) = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for DatabaseError()
{
  return &type metadata for DatabaseError;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for DatabaseCheckpointMode(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for DatabaseCheckpointMode(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23B976B7C + 4 * byte_23B977C25[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_23B976BB0 + 4 * byte_23B977C20[v4]))();
}

uint64_t sub_23B976BB0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23B976BB8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23B976BC0);
  return result;
}

uint64_t sub_23B976BCC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23B976BD4);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_23B976BD8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23B976BE0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23B976BEC(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_23B976BF4(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for DatabaseCheckpointMode()
{
  return &type metadata for DatabaseCheckpointMode;
}

unint64_t sub_23B976C0C()
{
  unint64_t result;

  result = qword_256A57B30;
  if (!qword_256A57B30)
  {
    result = MEMORY[0x24260A474](&protocol conformance descriptor for UInt32, MEMORY[0x24BEE44F0]);
    atomic_store(result, (unint64_t *)&qword_256A57B30);
  }
  return result;
}

unint64_t sub_23B976C50()
{
  unint64_t result;

  result = qword_256A57B38;
  if (!qword_256A57B38)
  {
    result = MEMORY[0x24260A474](&protocol conformance descriptor for Int32, MEMORY[0x24BEE3F88]);
    atomic_store(result, (unint64_t *)&qword_256A57B38);
  }
  return result;
}

unint64_t sub_23B976C94()
{
  unint64_t result;

  result = qword_256A57B40;
  if (!qword_256A57B40)
  {
    result = MEMORY[0x24260A474](&protocol conformance descriptor for UInt8, MEMORY[0x24BEE4260]);
    atomic_store(result, (unint64_t *)&qword_256A57B40);
  }
  return result;
}

uint64_t sub_23B976CD8(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_23B976CEC(a1, a2);
  return a1;
}

uint64_t sub_23B976CEC(uint64_t a1, unint64_t a2)
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

void sub_23B976D30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (!sub_23B9776EC() || !__OFSUB__(a1, sub_23B977704()))
  {
    sub_23B9776F8();
    sub_23B9777B8();
    __asm { BR              X10 }
  }
  __break(1u);
  JUMPOUT(0x23B976E24);
}

uint64_t sub_23B976E38(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_23B976E4C(a1, a2);
  return a1;
}

uint64_t sub_23B976E4C(uint64_t a1, unint64_t a2)
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

uint64_t sub_23B976E90(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  result = sub_23B977914();
  __break(1u);
  return result;
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

uint64_t sub_23B976FA4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
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

uint64_t sub_23B977020(__int128 *a1, uint64_t a2)
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

uint64_t ConnectionPair.__allocating_init(_:readonly:key:)(uint64_t a1, int a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8;

  v8 = swift_allocObject();
  ConnectionPair.init(_:readonly:key:)(a1, a2, a3, a4);
  return v8;
}

uint64_t ConnectionPair.readConnection.getter()
{
  return swift_retain();
}

uint64_t ConnectionPair.writeConnection.getter()
{
  return swift_retain();
}

uint64_t ConnectionPair.init(_:readonly:key:)(uint64_t a1, int a2, uint64_t a3, unint64_t a4)
{
  uint64_t *v4;
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
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  void (*v23)(char *, uint64_t, uint64_t);
  int v24;
  char *v25;
  void (*v26)(char *, char *, uint64_t);
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  void *v40;
  uint64_t result;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  int v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  unint64_t v52;
  unint64_t v53;
  uint64_t v54;

  v47 = a4;
  v50 = a3;
  v45 = a2;
  v44 = *v4;
  v54 = sub_23B977788();
  v6 = *(_QWORD *)(v54 - 8);
  v7 = MEMORY[0x24BDAC7A8](v54);
  v43 = (char *)&v42 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v42 - v10;
  MEMORY[0x24BDAC7A8](v9);
  v51 = (char *)&v42 - v12;
  v13 = sub_23B9777E8();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v42 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = MEMORY[0x24BDAC7A8](v15);
  v20 = (char *)&v42 - v19;
  MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)&v42 - v21;
  v23 = *(void (**)(char *, uint64_t, uint64_t))(v14 + 16);
  v48 = a1;
  v23((char *)&v42 - v21, a1, v13);
  v24 = (*(uint64_t (**)(char *, uint64_t))(v14 + 88))(v22, v13);
  if (v24 != *MEMORY[0x24BEB31A8])
  {
    v32 = v13;
    v34 = v46;
    v33 = v47;
    if (v24 != *MEMORY[0x24BEB31B0] && v24 != *MEMORY[0x24BEB31B8])
    {
      v23(v17, v48, v32);
      v52 = 0;
      v53 = 0xE000000000000000;
      sub_23B9778D8();
      swift_bridgeObjectRelease();
      v52 = 0xD000000000000014;
      v53 = 0x800000023B978490;
      sub_23B977554();
      sub_23B977938();
      sub_23B97786C();
      swift_bridgeObjectRelease();
      result = sub_23B977908();
      __break(1u);
      return result;
    }
    v36 = v48;
    v23(v20, v48, v32);
    sub_23B9777F4();
    swift_allocObject();
    v37 = v34;
    v38 = sub_23B977800();
    v31 = v49;
    if (v37)
    {
      sub_23B976CD8(v50, v33);
      (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v36, v32);
      goto LABEL_12;
    }
    *(_QWORD *)(v49 + 16) = v38;
    *(_QWORD *)(v31 + 24) = v38;
    swift_retain();
    v28 = v33;
LABEL_14:
    swift_retain();
    sub_23B977794();
    swift_release();
    sub_23B977794();
    sub_23B976CD8(v50, v28);
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v36, v32);
    return v31;
  }
  (*(void (**)(char *, uint64_t))(v14 + 96))(v22, v13);
  v25 = v51;
  sub_23B97774C();
  swift_bridgeObjectRelease();
  sub_23B9777F4();
  v26 = *(void (**)(char *, char *, uint64_t))(v6 + 16);
  v26(v11, v25, v54);
  v27 = v50;
  v28 = v47;
  sub_23B976E38(v50, v47);
  v29 = v46;
  v30 = sub_23B975470(v11, v45 & 1, v27, v28);
  if (!v29)
  {
    v46 = v13;
    v31 = v49;
    *(_QWORD *)(v49 + 24) = v30;
    v39 = v43;
    v26(v43, v51, v54);
    sub_23B976E38(v27, v28);
    v40 = sub_23B975470(v39, 1, v27, v28);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v51, v54);
    *(_QWORD *)(v31 + 16) = v40;
    v36 = v48;
    v32 = v46;
    goto LABEL_14;
  }
  sub_23B976CD8(v27, v28);
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v48, v13);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v51, v54);
  v31 = v49;
LABEL_12:
  swift_deallocPartialClassInstance();
  return v31;
}

unint64_t sub_23B977554()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256A57B50;
  if (!qword_256A57B50)
  {
    v1 = sub_23B9777E8();
    result = MEMORY[0x24260A474](MEMORY[0x24BEB31C8], v1);
    atomic_store(result, (unint64_t *)&qword_256A57B50);
  }
  return result;
}

uint64_t ConnectionPair.deinit()
{
  uint64_t v0;

  swift_release();
  swift_release();
  return v0;
}

uint64_t ConnectionPair.__deallocating_deinit()
{
  swift_release();
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t ConnectionPair.description.getter()
{
  return sub_23B9777A0();
}

uint64_t sub_23B97760C()
{
  return sub_23B9777A0();
}

uint64_t type metadata accessor for ConnectionPair()
{
  return objc_opt_self();
}

uint64_t method lookup function for ConnectionPair()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ConnectionPair.__allocating_init(_:readonly:key:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t sub_23B977674()
{
  uint64_t v0;

  v0 = sub_23B977854();
  __swift_allocate_value_buffer(v0, qword_25430A8C0);
  __swift_project_value_buffer(v0, (uint64_t)qword_25430A8C0);
  return sub_23B977848();
}

uint64_t sub_23B9776E0()
{
  return MEMORY[0x24BE31780]();
}

uint64_t sub_23B9776EC()
{
  return MEMORY[0x24BDCBBC8]();
}

uint64_t sub_23B9776F8()
{
  return MEMORY[0x24BDCBBD8]();
}

uint64_t sub_23B977704()
{
  return MEMORY[0x24BDCBBF0]();
}

uint64_t sub_23B977710()
{
  return MEMORY[0x24BDCC7A0]();
}

uint64_t sub_23B97771C()
{
  return MEMORY[0x24BDCC808]();
}

uint64_t sub_23B977728()
{
  return MEMORY[0x24BDCC818]();
}

uint64_t sub_23B977734()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_23B977740()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_23B97774C()
{
  return MEMORY[0x24BDCD870]();
}

uint64_t sub_23B977758()
{
  return MEMORY[0x24BDCD8A0]();
}

uint64_t sub_23B977764()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_23B977770()
{
  return MEMORY[0x24BDCD968]();
}

uint64_t sub_23B97777C()
{
  return MEMORY[0x24BDCD9F8]();
}

uint64_t sub_23B977788()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_23B977794()
{
  return MEMORY[0x24BEB3150]();
}

uint64_t sub_23B9777A0()
{
  return MEMORY[0x24BEB3158]();
}

uint64_t sub_23B9777AC()
{
  return MEMORY[0x24BEB3160]();
}

uint64_t sub_23B9777B8()
{
  return MEMORY[0x24BEB3178]();
}

uint64_t sub_23B9777C4()
{
  return MEMORY[0x24BEB3180]();
}

uint64_t sub_23B9777D0()
{
  return MEMORY[0x24BEB3190]();
}

uint64_t sub_23B9777DC()
{
  return MEMORY[0x24BEB3198]();
}

uint64_t sub_23B9777E8()
{
  return MEMORY[0x24BEB31C0]();
}

uint64_t sub_23B9777F4()
{
  return MEMORY[0x24BEB31D8]();
}

uint64_t sub_23B977800()
{
  return MEMORY[0x24BEB31E8]();
}

uint64_t sub_23B97780C()
{
  return MEMORY[0x24BEB31F0]();
}

uint64_t sub_23B977818()
{
  return MEMORY[0x24BEB3318]();
}

uint64_t sub_23B977824()
{
  return MEMORY[0x24BEB3390]();
}

uint64_t sub_23B977830()
{
  return MEMORY[0x24BEB33A8]();
}

uint64_t sub_23B97783C()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_23B977848()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_23B977854()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_23B977860()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_23B97786C()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_23B977878()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_23B977884()
{
  return MEMORY[0x24BEE0DE8]();
}

uint64_t sub_23B977890()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_23B97789C()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_23B9778A8()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_23B9778B4()
{
  return MEMORY[0x24BEE1E70]();
}

uint64_t sub_23B9778C0()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_23B9778CC()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_23B9778D8()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_23B9778E4()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_23B9778F0()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_23B9778FC()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_23B977908()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_23B977914()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_23B977920()
{
  return MEMORY[0x24BE31AF8]();
}

uint64_t sub_23B97792C()
{
  return MEMORY[0x24BE31B00]();
}

uint64_t sub_23B977938()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_23B977944()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_23B977950()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_23B97795C()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_23B977968()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t _ss5Int32V13FindMyStorageE16declaredDatatypeSSvgZ_0()
{
  return MEMORY[0x24BEB3400]();
}

uint64_t sub_23B977980()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_23B97798C()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_23B977998()
{
  return MEMORY[0x24BEE4328]();
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t sqlite3_key_v2()
{
  return MEMORY[0x24BEDE178]();
}

int sqlite3_wal_checkpoint_v2(sqlite3 *db, const char *zDb, int eMode, int *pnLog, int *pnCkpt)
{
  return MEMORY[0x24BEDE398](db, zDb, *(_QWORD *)&eMode, pnLog, pnCkpt);
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

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x24BEE4C18]();
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

uint64_t swift_task_switch()
{
  return MEMORY[0x24BEE7278]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x24BEE4F68]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

