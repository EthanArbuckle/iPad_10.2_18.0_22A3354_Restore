void type metadata accessor for URLResourceKey(uint64_t a1)
{
  sub_2293106F0(a1, &qword_255A40860);
}

uint64_t sub_2293101CC(uint64_t a1, uint64_t a2)
{
  return sub_229310328(a1, a2, MEMORY[0x24BEE0CD8]);
}

uint64_t sub_2293101EC(uint64_t a1, uint64_t a2)
{
  return sub_229310328(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF9E0]);
}

uint64_t sub_2293101F8(uint64_t a1, id *a2)
{
  uint64_t result;

  result = sub_229318F70();
  *a2 = 0;
  return result;
}

uint64_t sub_22931026C(uint64_t a1, id *a2)
{
  char v3;

  v3 = sub_229318F7C();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_2293102E8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  sub_229318F88();
  v2 = sub_229318F64();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_229310328(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_229318F88();
  v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_229310364()
{
  sub_229318F88();
  sub_229318F94();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2293103A4()
{
  uint64_t v0;

  sub_229318F88();
  sub_2293190CC();
  sub_229318F94();
  v0 = sub_2293190F0();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_229310418()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = sub_229318F88();
  v2 = v1;
  if (v0 == sub_229318F88() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_229319084();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_2293104A4()
{
  sub_229310670((unint64_t *)&qword_255A408B0, (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey, (uint64_t)&unk_2293196D0);
  sub_229310670(&qword_255A408B8, (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey, (uint64_t)&unk_229319624);
  return sub_229319078();
}

uint64_t sub_229310528@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_229318F64();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_22931056C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_229318F88();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_229310594()
{
  sub_229310670(&qword_255A40880, (uint64_t (*)(uint64_t))type metadata accessor for URLResourceKey, (uint64_t)&unk_2293194F8);
  sub_229310670(&qword_255A40888, (uint64_t (*)(uint64_t))type metadata accessor for URLResourceKey, (uint64_t)&unk_229319498);
  return sub_229319078();
}

uint64_t sub_229310618()
{
  return sub_229310670(&qword_255A40868, (uint64_t (*)(uint64_t))type metadata accessor for URLResourceKey, (uint64_t)&unk_22931945C);
}

uint64_t sub_229310644()
{
  return sub_229310670(&qword_255A40870, (uint64_t (*)(uint64_t))type metadata accessor for URLResourceKey, (uint64_t)&unk_229319430);
}

uint64_t sub_229310670(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x22E2C7668](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2293106B0()
{
  return sub_229310670(&qword_255A40878, (uint64_t (*)(uint64_t))type metadata accessor for URLResourceKey, (uint64_t)&unk_2293194CC);
}

void type metadata accessor for FileAttributeKey(uint64_t a1)
{
  sub_2293106F0(a1, &qword_255A40890);
}

void sub_2293106F0(uint64_t a1, unint64_t *a2)
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

uint64_t sub_229310734()
{
  return sub_229310670(&qword_255A40898, (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey, (uint64_t)&unk_2293195E8);
}

uint64_t sub_229310760()
{
  return sub_229310670(&qword_255A408A0, (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey, (uint64_t)&unk_2293195BC);
}

uint64_t sub_22931078C()
{
  return sub_229310670(&qword_255A408A8, (uint64_t (*)(uint64_t))type metadata accessor for FileAttributeKey, (uint64_t)&unk_229319658);
}

uint64_t sub_2293107C0()
{
  void *v0;
  SEL *p_type;
  id v2;
  id v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  SEL *v17;
  uint64_t v18;
  id v19;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;

  p_type = (SEL *)&stru_24F205FF0.type;
  v2 = objc_msgSend(v0, sel_modelDescription);
  v3 = objc_msgSend(v2, sel_inputDescriptions);

  v4 = sub_229315124(0, &qword_255A408C0);
  v5 = sub_229318FC4();

  if (v5 >> 62)
  {
LABEL_35:
    swift_bridgeObjectRetain();
    v6 = sub_229319060();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (v6 != 1)
    return 0;
  v7 = objc_msgSend(v0, p_type[29]);
  v8 = objc_msgSend(v7, sel_inputDescriptions);

  v9 = sub_229318FC4();
  if ((v9 & 0xC000000000000001) != 0)
  {
    v10 = (id)MEMORY[0x22E2C735C](0, v9);
  }
  else
  {
    if (!*(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_45;
    }
    v10 = *(id *)(v9 + 32);
  }
  v11 = v10;
  swift_bridgeObjectRelease();
  v12 = objc_msgSend(v11, sel_type);

  if (v12 != (id)4 || (sub_229313BD0() & 1) == 0)
    return 0;
  v13 = objc_msgSend(v0, p_type[29]);
  v14 = objc_msgSend(v13, sel_outputDescriptions);

  v4 = sub_229318FC4();
  if (!(v4 >> 62))
  {
    v15 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v15)
      goto LABEL_11;
    goto LABEL_18;
  }
LABEL_45:
  swift_bridgeObjectRetain();
  v15 = sub_229319060();
  if (!v15)
  {
LABEL_18:
    swift_bridgeObjectRelease_n();
    return 0;
  }
LABEL_11:
  v16 = 4;
  while (1)
  {
    if ((v4 & 0xC000000000000001) != 0)
      v17 = (SEL *)MEMORY[0x22E2C735C](v16 - 4, v4);
    else
      v17 = (SEL *)*(id *)(v4 + 8 * v16);
    p_type = v17;
    v18 = v16 - 3;
    if (__OFADD__(v16 - 4, 1))
    {
      __break(1u);
      goto LABEL_35;
    }
    v19 = -[SEL type](v17, sel_type);

    if (v19 == (id)6)
      break;
    ++v16;
    if (v18 == v15)
      goto LABEL_18;
  }
  swift_bridgeObjectRelease_n();
  v21 = objc_msgSend(v0, sel_modelTypeName);
  v22 = sub_229318F88();
  v24 = v23;

  if (v22 == 0xD000000000000012 && v24 == 0x8000000229319EF0 || (sub_229319084() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return sub_229313D14();
  }
  else if (v22 == 0x7373616C436D6C67 && v24 == 0xED00007265696669
         || (sub_229319084() & 1) != 0
         || v22 == 0xD000000000000017 && v24 == 0x8000000229319F90
         || (sub_229319084() & 1) != 0
         || v22 == 0xD000000000000016 && v24 == 0x8000000229319FB0
         || (sub_229319084() & 1) != 0
         || v22 == 0xD000000000000017 && v24 == 0x8000000229319F30
         || (sub_229319084() & 1) != 0
         || v22 == 0xD00000000000001BLL && v24 == 0x8000000229319FD0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v25 = sub_229319084();
    swift_bridgeObjectRelease();
    return v25 & 1;
  }
}

unint64_t sub_229310CA4()
{
  void *v0;
  id v1;
  id v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v14;
  id v15;
  unint64_t v16;
  uint64_t p_type;
  unint64_t v18;
  id v19;
  id v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t i;
  id v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  id v35;
  unint64_t v36;
  uint64_t v37;
  id v38;
  id v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char v51;
  id v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  id v57;
  uint64_t v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char v63;
  void *v64;
  id v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  id v69;
  void *v70;
  uint64_t v71;
  id v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  char v77;
  id v78;
  unint64_t v79;
  unint64_t v80;
  id v81;
  id v82;
  id v83;
  uint64_t v84;

  v1 = objc_msgSend(v0, sel_modelDescription);
  v2 = objc_msgSend(v1, sel_inputDescriptions);

  sub_229315124(0, &qword_255A408C0);
  v3 = sub_229318FC4();

  if (v3 >> 62)
    goto LABEL_39;
  v4 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v4)
  {
LABEL_14:
    swift_bridgeObjectRelease_n();
    return 0;
  }
LABEL_3:
  v5 = 4;
  while (1)
  {
    if ((v3 & 0xC000000000000001) != 0)
      v6 = (id)MEMORY[0x22E2C735C](v5 - 4, v3);
    else
      v6 = *(id *)(v3 + 8 * v5);
    v7 = v6;
    v8 = v5 - 3;
    if (__OFADD__(v5 - 4, 1))
    {
      __break(1u);
LABEL_39:
      swift_bridgeObjectRetain();
      v4 = sub_229319060();
      if (!v4)
        goto LABEL_14;
      goto LABEL_3;
    }
    v9 = objc_msgSend(v6, sel_name);
    v10 = sub_229318F88();
    v12 = v11;

    if (v10 == 0x6E496574617473 && v12 == 0xE700000000000000)
      break;
    v14 = sub_229319084();
    swift_bridgeObjectRelease();
    if ((v14 & 1) != 0)
    {
      swift_bridgeObjectRelease_n();
      goto LABEL_17;
    }

    ++v5;
    if (v8 == v4)
      goto LABEL_14;
  }
  swift_bridgeObjectRelease_n();
  swift_bridgeObjectRelease();
LABEL_17:
  if (objc_msgSend(v7, sel_type) != (id)5 || !objc_msgSend(v7, sel_constraint))
  {

    return 0;
  }
  objc_opt_self();
  v15 = objc_msgSend((id)swift_dynamicCastObjCClassUnconditional(), sel_shape);
  sub_229315124(0, &qword_255A408C8);
  v16 = sub_229318FC4();

  p_type = __swift_instantiateConcreteTypeFromMangledName(&qword_255A408D0);
  v18 = swift_allocObject();
  *(_OWORD *)(v18 + 16) = xmmword_229319720;
  *(_QWORD *)(v18 + 32) = sub_229318FF4();
  sub_229318FD0();
  LOBYTE(v18) = sub_229314340(v16, v18);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v18 & 1) == 0)
    goto LABEL_65;
  v19 = objc_msgSend(v83, sel_modelDescription);
  v20 = objc_msgSend(v19, sel_inputDescriptions);

  v21 = sub_229318FC4();
  v84 = MEMORY[0x24BEE4AF8];
  if (!(v21 >> 62))
  {
    v22 = *(_QWORD *)((v21 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v22)
      goto LABEL_22;
LABEL_42:
    swift_bridgeObjectRelease();
    v32 = MEMORY[0x24BEE4AF8];
LABEL_43:
    if ((v32 & 0x8000000000000000) == 0 && (v32 & 0x4000000000000000) == 0)
    {
      v33 = *(_QWORD *)(v32 + 16);
      goto LABEL_46;
    }
    goto LABEL_110;
  }
  swift_bridgeObjectRetain();
  v22 = sub_229319060();
  swift_bridgeObjectRelease();
  if (!v22)
    goto LABEL_42;
LABEL_22:
  if (v22 >= 1)
  {
    for (i = 0; i != v22; ++i)
    {
      if ((v21 & 0xC000000000000001) != 0)
        v24 = (id)MEMORY[0x22E2C735C](i, v21);
      else
        v24 = *(id *)(v21 + 8 * i + 32);
      v25 = v24;
      v26 = objc_msgSend(v24, sel_name);
      v27 = sub_229318F88();
      v29 = v28;

      if (v27 == 0x6E496574617473 && v29 == 0xE700000000000000)
      {

        swift_bridgeObjectRelease();
      }
      else
      {
        v31 = sub_229319084();
        swift_bridgeObjectRelease();
        if ((v31 & 1) != 0)
        {

        }
        else
        {
          sub_229319030();
          sub_229319048();
          sub_229319054();
          sub_22931903C();
        }
      }
    }
    swift_bridgeObjectRelease();
    v32 = v84;
    goto LABEL_43;
  }
  __break(1u);
LABEL_112:
  swift_bridgeObjectRetain();
  v37 = sub_229319060();
  swift_bridgeObjectRelease();
LABEL_49:
  swift_bridgeObjectRelease();
  if (v37 != 3)
    goto LABEL_65;
  v38 = objc_msgSend(v83, sel_modelDescription);
  v39 = objc_msgSend(v38, *(SEL *)(p_type + 272));

  v40 = sub_229318FC4();
  if (!(v40 >> 62))
  {
    v41 = *(_QWORD *)((v40 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v41)
      goto LABEL_52;
LABEL_64:
    swift_bridgeObjectRelease_n();
    goto LABEL_65;
  }
  while (2)
  {
    swift_bridgeObjectRetain();
    v41 = sub_229319060();
    if (!v41)
      goto LABEL_64;
LABEL_52:
    v42 = 4;
    while (1)
    {
      v43 = v42 - 4;
      if ((v40 & 0xC000000000000001) != 0)
      {
        v44 = (id)MEMORY[0x22E2C735C](v42 - 4, v40);
        v45 = v42 - 3;
        if (__OFADD__(v43, 1))
          goto LABEL_109;
      }
      else
      {
        v44 = *(id *)(v40 + 8 * v42);
        v45 = v42 - 3;
        if (__OFADD__(v43, 1))
        {
LABEL_109:
          __break(1u);
LABEL_110:
          swift_bridgeObjectRetain();
          v33 = sub_229319060();
          swift_release();
LABEL_46:
          swift_release();
          if (!v33)
            goto LABEL_65;
          v34 = objc_msgSend(v83, sel_modelDescription);
          p_type = (uint64_t)&stru_24F205FF0.type;
          v35 = objc_msgSend(v34, sel_outputDescriptions);

          v36 = sub_229318FC4();
          if (!(v36 >> 62))
          {
            v37 = *(_QWORD *)((v36 & 0xFFFFFFFFFFFFF8) + 0x10);
            goto LABEL_49;
          }
          goto LABEL_112;
        }
      }
      v82 = v44;
      v46 = objc_msgSend(v44, sel_name);
      v47 = sub_229318F88();
      v49 = v48;

      if (v47 == 0x6C6562616CLL && v49 == 0xE500000000000000)
      {
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        goto LABEL_70;
      }
      v51 = sub_229319084();
      swift_bridgeObjectRelease();
      if ((v51 & 1) != 0)
        break;

      ++v42;
      if (v45 == v41)
        goto LABEL_64;
    }
    swift_bridgeObjectRelease_n();
LABEL_70:
    if (objc_msgSend(v82, sel_type) != (id)3)
    {

      goto LABEL_66;
    }
    v53 = objc_msgSend(v83, sel_modelDescription);
    v54 = objc_msgSend(v53, sel_outputDescriptions);

    v40 = sub_229318FC4();
    if (!(v40 >> 62))
    {
      v55 = *(_QWORD *)((v40 & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (v55)
        goto LABEL_73;
LABEL_82:
      swift_bridgeObjectRelease_n();
      v64 = v82;
LABEL_83:

LABEL_65:
LABEL_66:
      swift_unknownObjectRelease();
      return 0;
    }
LABEL_117:
    swift_bridgeObjectRetain();
    v55 = sub_229319060();
    if (!v55)
      goto LABEL_82;
LABEL_73:
    v56 = 4;
LABEL_74:
    if ((v40 & 0xC000000000000001) != 0)
      v57 = (id)MEMORY[0x22E2C735C](v56 - 4, v40);
    else
      v57 = *(id *)(v40 + 8 * v56);
    v58 = v56 - 3;
    if (__OFADD__(v56 - 4, 1))
    {
      __break(1u);
      continue;
    }
    break;
  }
  v81 = v57;
  v59 = objc_msgSend(v57, sel_name);
  v60 = sub_229318F88();
  v62 = v61;

  if (v60 == 0xD000000000000010 && v62 == 0x8000000229319F70)
  {
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    goto LABEL_87;
  }
  v63 = sub_229319084();
  swift_bridgeObjectRelease();
  if ((v63 & 1) == 0)
  {

    ++v56;
    if (v58 == v55)
      goto LABEL_82;
    goto LABEL_74;
  }
  swift_bridgeObjectRelease_n();
LABEL_87:
  if (objc_msgSend(v81, sel_type) != (id)6)
  {

    swift_unknownObjectRelease();
    return 0;
  }
  v65 = objc_msgSend(v83, sel_modelDescription);
  v66 = objc_msgSend(v65, sel_outputDescriptions);

  v40 = sub_229318FC4();
  if (v40 >> 62)
  {
    swift_bridgeObjectRetain();
    v67 = sub_229319060();
    if (v67)
      goto LABEL_90;
LABEL_101:
    swift_bridgeObjectRelease_n();

    v64 = v81;
    goto LABEL_83;
  }
  v67 = *(_QWORD *)((v40 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v67)
    goto LABEL_101;
LABEL_90:
  v68 = 4;
  while (1)
  {
    if ((v40 & 0xC000000000000001) != 0)
      v69 = (id)MEMORY[0x22E2C735C](v68 - 4, v40);
    else
      v69 = *(id *)(v40 + 8 * v68);
    v70 = v69;
    v71 = v68 - 3;
    if (__OFADD__(v68 - 4, 1))
    {
      __break(1u);
      goto LABEL_117;
    }
    v72 = objc_msgSend(v69, sel_name);
    v73 = sub_229318F88();
    v75 = v74;

    if (v73 == 0x74754F6574617473 && v75 == 0xE800000000000000)
    {
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      goto LABEL_105;
    }
    v77 = sub_229319084();
    swift_bridgeObjectRelease();
    if ((v77 & 1) != 0)
      break;

    ++v68;
    if (v71 == v67)
      goto LABEL_101;
  }
  swift_bridgeObjectRelease_n();
LABEL_105:
  if (objc_msgSend(v70, sel_type) == (id)5 && objc_msgSend(v7, sel_constraint))
  {
    objc_opt_self();
    v78 = objc_msgSend((id)swift_dynamicCastObjCClassUnconditional(), sel_shape);
    v79 = sub_229318FC4();

    v80 = swift_allocObject();
    *(_OWORD *)(v80 + 16) = xmmword_229319720;
    *(_QWORD *)(v80 + 32) = sub_229318FF4();
    sub_229318FD0();
    LOBYTE(v80) = sub_229314340(v79, v80);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
    return v80 & 1;
  }

  swift_unknownObjectRelease();
  return 0;
}

unint64_t sub_2293118D0()
{
  void *v0;
  id v1;
  char **p_type;
  id v3;
  id v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v22;
  unint64_t result;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char v41;
  id v42;
  void *v43;
  unint64_t v44;
  uint64_t v45;
  id v46;
  void *v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char v52;
  id v53;
  id v54;

  v1 = v0;
  p_type = &stru_24F205FF0.type;
  v3 = objc_msgSend(v0, sel_modelDescription);
  v4 = objc_msgSend(v3, sel_inputDescriptions);

  sub_229315124(0, &qword_255A408C0);
  v5 = sub_229318FC4();

  if (v5 >> 62)
    goto LABEL_68;
  v6 = *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v6)
  {
LABEL_24:
    swift_bridgeObjectRelease_n();
    return 0;
  }
LABEL_3:
  v7 = 4;
  while (1)
  {
    if ((v5 & 0xC000000000000001) != 0)
      v8 = (id)MEMORY[0x22E2C735C](v7 - 4, v5);
    else
      v8 = *(id *)(v5 + 8 * v7);
    v9 = v8;
    v10 = v7 - 3;
    if (__OFADD__(v7 - 4, 1))
    {
      __break(1u);
LABEL_65:

      return 0;
    }
    v11 = objc_msgSend(v8, sel_type);

    if (v11 == (id)4)
      break;
    ++v7;
    if (v10 == v6)
      goto LABEL_24;
  }
  swift_bridgeObjectRelease_n();
  v12 = objc_msgSend(v1, p_type[29]);
  v13 = objc_msgSend(v12, sel_outputDescriptions);

  v14 = sub_229318FC4();
  if (v14 >> 62)
  {
LABEL_71:
    swift_bridgeObjectRetain();
    v15 = sub_229319060();
    if (!v15)
      goto LABEL_24;
  }
  else
  {
    v15 = *(_QWORD *)((v14 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (!v15)
      goto LABEL_24;
  }
  v53 = v1;
  v16 = 4;
  while (1)
  {
    if ((v14 & 0xC000000000000001) != 0)
      v17 = (id)MEMORY[0x22E2C735C](v16 - 4, v14);
    else
      v17 = *(id *)(v14 + 8 * v16);
    v5 = (unint64_t)v17;
    p_type = (char **)(v16 - 3);
    if (__OFADD__(v16 - 4, 1))
    {
      __break(1u);
LABEL_68:
      swift_bridgeObjectRetain();
      v6 = sub_229319060();
      if (!v6)
        goto LABEL_24;
      goto LABEL_3;
    }
    v1 = objc_msgSend(v17, sel_name);
    v18 = sub_229318F88();
    v20 = v19;

    if (v18 == 0x6E656469666E6F63 && v20 == 0xEA00000000006563)
    {
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      goto LABEL_28;
    }
    v22 = sub_229319084();
    swift_bridgeObjectRelease();
    if ((v22 & 1) != 0)
      break;

    ++v16;
    if (p_type == (char **)v15)
      goto LABEL_24;
  }
  swift_bridgeObjectRelease_n();
LABEL_28:
  if (objc_msgSend((id)v5, sel_type, v53) != (id)5)
  {
LABEL_63:

    return 0;
  }
  v24 = objc_msgSend(v54, sel_modelDescription);
  v25 = objc_msgSend(v24, sel_outputDescriptions);

  v14 = sub_229318FC4();
  if (v14 >> 62)
  {
    swift_bridgeObjectRetain();
    v26 = sub_229319060();
    if (v26)
      goto LABEL_31;
    goto LABEL_43;
  }
  v26 = *(_QWORD *)((v14 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v26)
  {
LABEL_43:
    swift_bridgeObjectRelease_n();
    goto LABEL_63;
  }
LABEL_31:
  v27 = 4;
  while (1)
  {
    v28 = v27 - 4;
    if ((v14 & 0xC000000000000001) != 0)
    {
      v29 = (id)MEMORY[0x22E2C735C](v27 - 4, v14);
      v30 = v27 - 3;
      if (__OFADD__(v28, 1))
        goto LABEL_70;
    }
    else
    {
      v29 = *(id *)(v14 + 8 * v27);
      v30 = v27 - 3;
      if (__OFADD__(v28, 1))
      {
LABEL_70:
        __break(1u);
        goto LABEL_71;
      }
    }
    v31 = v29;
    v1 = objc_msgSend(v29, sel_name);
    v32 = sub_229318F88();
    v34 = v33;

    if (v32 == 0x616E6964726F6F63 && v34 == 0xEB00000000736574)
    {
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      goto LABEL_46;
    }
    v36 = sub_229319084();
    swift_bridgeObjectRelease();
    if ((v36 & 1) != 0)
      break;

    ++v27;
    if (v30 == v26)
      goto LABEL_43;
  }
  swift_bridgeObjectRelease_n();
LABEL_46:
  v1 = v31;
  if (objc_msgSend(v31, sel_type) != (id)5)
    goto LABEL_62;
  v37 = objc_msgSend(v54, sel_modelTypeName);
  v38 = sub_229318F88();
  v40 = v39;

  if (v38 == 0x656E696C65706970 && v40 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v41 = sub_229319084();
    swift_bridgeObjectRelease();
    if ((v41 & 1) == 0)
      goto LABEL_65;
  }
  v42 = objc_msgSend(v54, sel_subModels);
  if (!v42)
  {
LABEL_62:

    goto LABEL_63;
  }
  v43 = v42;
  sub_229315124(0, &qword_255A408E8);
  v44 = sub_229318FC4();

  if (v44 >> 62)
  {
    swift_bridgeObjectRetain();
    v45 = sub_229319060();
    swift_bridgeObjectRelease();
    if (!v45)
      goto LABEL_76;
LABEL_54:
    result = v45 - 1;
    if (__OFSUB__(v45, 1))
    {
      __break(1u);
    }
    else if ((v44 & 0xC000000000000001) == 0)
    {
      if ((result & 0x8000000000000000) != 0)
      {
        __break(1u);
      }
      else if (result < *(_QWORD *)((v44 & 0xFFFFFFFFFFFFF8) + 0x10))
      {
        v46 = *(id *)(v44 + 8 * result + 32);
LABEL_59:
        v47 = v46;
        swift_bridgeObjectRelease();
        v48 = objc_msgSend(v47, sel_modelTypeName);

        v49 = sub_229318F88();
        v51 = v50;

        if (v49 == 0xD000000000000015 && v51 == 0x8000000229319F50)
        {
          swift_bridgeObjectRelease();

          return 1;
        }
        else
        {
          v52 = sub_229319084();
          swift_bridgeObjectRelease();

          return v52 & 1;
        }
      }
      __break(1u);
      return result;
    }
    v46 = (id)MEMORY[0x22E2C735C](result, v44);
    goto LABEL_59;
  }
  v45 = *(_QWORD *)((v44 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v45)
    goto LABEL_54;
LABEL_76:

  swift_bridgeObjectRelease();
  return 0;
}

void sub_229311FF8()
{
  void *v0;
  char **p_type;
  id v2;
  id v3;
  unint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  unint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t v18;
  id v19;
  void *v20;

  v2 = objc_msgSend(v0, sel_modelDescription);
  v3 = objc_msgSend(v2, sel_inputDescriptions);

  sub_229315124(0, &qword_255A408C0);
  v4 = sub_229318FC4();

  if (v4 >> 62)
  {
    swift_bridgeObjectRetain();
    v5 = sub_229319060();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (v5 != 1)
    return;
  v6 = objc_msgSend(v0, sel_modelDescription);
  v7 = objc_msgSend(v6, sel_inputDescriptions);

  v8 = sub_229318FC4();
  if ((v8 & 0xC000000000000001) != 0)
  {
    v9 = (id)MEMORY[0x22E2C735C](0, v8);
  }
  else
  {
    if (!*(_QWORD *)((v8 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_19;
    }
    v9 = *(id *)(v8 + 32);
  }
  v10 = v9;
  swift_bridgeObjectRelease();
  v11 = objc_msgSend(v10, sel_type);

  if (v11 != (id)4)
    return;
  v12 = objc_msgSend(v0, sel_modelDescription);
  p_type = &stru_24F205FF0.type;
  v13 = objc_msgSend(v12, sel_outputDescriptions);

  v14 = sub_229318FC4();
  if (!(v14 >> 62))
  {
    v15 = *(_QWORD *)((v14 & 0xFFFFFFFFFFFFF8) + 0x10);
    goto LABEL_10;
  }
LABEL_19:
  swift_bridgeObjectRetain();
  v15 = sub_229319060();
  swift_bridgeObjectRelease();
LABEL_10:
  swift_bridgeObjectRelease();
  if (v15 == 1)
  {
    v16 = objc_msgSend(v0, sel_modelDescription);
    v17 = objc_msgSend(v16, p_type[34]);

    v18 = sub_229318FC4();
    if ((v18 & 0xC000000000000001) != 0)
    {
      v19 = (id)MEMORY[0x22E2C735C](0, v18);
      goto LABEL_14;
    }
    if (*(_QWORD *)((v18 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      v19 = *(id *)(v18 + 32);
LABEL_14:
      v20 = v19;
      swift_bridgeObjectRelease();
      objc_msgSend(v20, sel_type);

      return;
    }
    __break(1u);
  }
}

void sub_2293122B4()
{
  void *v0;
  unint64_t v1;
  char **p_type;
  void *v3;
  id v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  unint64_t v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  char v16;
  id v17;
  void *v18;
  void *v19;
  char v20;
  id v21;
  void *v22;
  void *v23;
  char v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  void *v30;
  uint64_t v31;
  unint64_t v32;

  v3 = v0;
  v4 = objc_msgSend(v0, sel_modelDescription);
  v5 = objc_msgSend(v4, sel_inputDescriptions);

  sub_229315124(0, &qword_255A408C0);
  v6 = sub_229318FC4();

  if (v6 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_229319060();
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (v7 == 1)
  {
    v8 = objc_msgSend(v3, sel_modelDescription);
    v9 = objc_msgSend(v8, sel_inputDescriptions);

    v10 = sub_229318FC4();
    if ((v10 & 0xC000000000000001) != 0)
    {
      v11 = (id)MEMORY[0x22E2C735C](0, v10);
    }
    else
    {
      if (!*(_QWORD *)((v10 & 0xFFFFFFFFFFFFF8) + 0x10))
      {
        __break(1u);
        goto LABEL_43;
      }
      v11 = *(id *)(v10 + 32);
    }
    v8 = v11;
    swift_bridgeObjectRelease();
    if (objc_msgSend(v8, sel_type) != (id)5 || !objc_msgSend(v8, sel_constraint))
    {
LABEL_36:

      return;
    }
    objc_opt_self();
    v12 = objc_msgSend((id)swift_dynamicCastObjCClassUnconditional(), sel_shape);
    v10 = sub_229315124(0, &qword_255A408C8);
    v1 = sub_229318FC4();

    if (v1 >> 62)
      goto LABEL_44;
    if (*(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10) == 3)
    {
      do
      {
        v32 = v1 & 0xC000000000000001;
        if ((v1 & 0xC000000000000001) != 0)
        {
          v13 = (id)MEMORY[0x22E2C735C](1, v1);
        }
        else
        {
          if (*(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10) < 2uLL)
          {
            __break(1u);
            goto LABEL_49;
          }
          v13 = *(id *)(v1 + 40);
        }
        v14 = v13;
        v15 = (void *)sub_229318FF4();
        v16 = sub_229319000();

        if ((v16 & 1) == 0)
          break;
        if (v32)
        {
          v17 = (id)MEMORY[0x22E2C735C](2, v1);
        }
        else
        {
          if (*(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10) < 3uLL)
          {
            __break(1u);
            return;
          }
          v17 = *(id *)(v1 + 48);
        }
        v18 = v17;
        v19 = (void *)sub_229318FF4();
        v20 = sub_229319000();

        if ((v20 & 1) != 0)
        {
          swift_bridgeObjectRelease();
          p_type = (char **)(&stru_24F205FF0 + 16);
        }
        else
        {
          if (v32)
            v21 = (id)MEMORY[0x22E2C735C](2, v1);
          else
            v21 = *(id *)(v1 + 48);
          v22 = v21;
          p_type = &stru_24F205FF0.type;
          swift_bridgeObjectRelease();
          v23 = (void *)sub_229318FF4();
          v24 = sub_229319000();

          if ((v24 & 1) == 0)
          {
            swift_unknownObjectRelease();
            goto LABEL_36;
          }
        }
        v25 = objc_msgSend(v3, sel_modelDescription);
        v26 = objc_msgSend(v25, sel_outputDescriptions);

        v10 = sub_229318FC4();
        if (!(v10 >> 62))
        {
          v27 = *(_QWORD *)((v10 & 0xFFFFFFFFFFFFF8) + 0x10);
          swift_bridgeObjectRetain();
          if (!v27)
            goto LABEL_34;
          goto LABEL_27;
        }
LABEL_49:
        swift_bridgeObjectRetain();
        v27 = sub_229319060();
        if (!v27)
        {
LABEL_34:
          swift_bridgeObjectRelease_n();

          swift_unknownObjectRelease();
          return;
        }
LABEL_27:
        v28 = 4;
        while (1)
        {
          v29 = (v10 & 0xC000000000000001) != 0
              ? (id)MEMORY[0x22E2C735C](v28 - 4, v10)
              : *(id *)(v10 + 8 * v28);
          v3 = v29;
          v1 = v28 - 3;
          if (__OFADD__(v28 - 4, 1))
            break;
          if (objc_msgSend(v29, p_type[31]) == (id)6)
          {
            swift_bridgeObjectRelease_n();
            if (objc_msgSend(v3, sel_constraint))
            {
              objc_opt_self();
              v30 = (void *)swift_dynamicCastObjCClassUnconditional();
              swift_unknownObjectRetain();
              objc_msgSend(v30, sel_keyType);

              swift_unknownObjectRelease_n();
              swift_unknownObjectRelease();
            }
            else
            {

              swift_unknownObjectRelease();
            }
            return;
          }

          ++v28;
          if (v1 == v27)
            goto LABEL_34;
        }
LABEL_43:
        __break(1u);
LABEL_44:
        swift_bridgeObjectRetain();
        v31 = sub_229319060();
        swift_bridgeObjectRelease();
      }
      while (v31 == 3);
    }
    swift_unknownObjectRelease();

    swift_bridgeObjectRelease();
  }
}

unint64_t sub_22931281C()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  char v6;
  id v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t result;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  char v25;

  v1 = objc_msgSend(v0, sel_modelTypeName);
  v2 = sub_229318F88();
  v4 = v3;

  if (v2 == 0xD000000000000012 && v4 == 0x8000000229319EF0)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = sub_229319084();
    swift_bridgeObjectRelease();
    v6 = 0;
    if ((v5 & 1) == 0)
      return v6 & 1;
  }
  v7 = objc_msgSend(v0, sel_subModels);
  if (!v7)
  {
    v6 = 0;
    return v6 & 1;
  }
  v8 = v7;
  sub_229315124(0, &qword_255A408E8);
  v9 = sub_229318FC4();

  if (v9 >> 62)
  {
    swift_bridgeObjectRetain();
    result = sub_229319060();
    v10 = result;
    if (!result)
      goto LABEL_37;
  }
  else
  {
    v10 = *(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (!v10)
      goto LABEL_37;
  }
  if ((v9 & 0xC000000000000001) != 0)
  {
    v12 = (id)MEMORY[0x22E2C735C](0, v9);
  }
  else
  {
    if (!*(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_42;
    }
    v12 = *(id *)(v9 + 32);
  }
  v13 = v12;
  swift_bridgeObjectRelease();
  v14 = objc_msgSend(v13, sel_modelTypeName);

  v15 = sub_229318F88();
  v17 = v16;

  result = v10 - 1;
  if (__OFSUB__(v10, 1))
  {
LABEL_42:
    __break(1u);
LABEL_43:
    __break(1u);
    goto LABEL_44;
  }
  if ((v9 & 0xC000000000000001) != 0)
  {
    v18 = (id)MEMORY[0x22E2C735C](result, v9);
    goto LABEL_18;
  }
  if ((result & 0x8000000000000000) != 0)
    goto LABEL_43;
  if (result < *(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v18 = *(id *)(v9 + 8 * result + 32);
LABEL_18:
    v19 = v18;
    swift_bridgeObjectRelease();
    v20 = objc_msgSend(v19, sel_modelTypeName);

    v21 = sub_229318F88();
    v23 = v22;

    v24 = v15 == 0xD00000000000001ALL && v17 == 0x8000000229319F10;
    v25 = v24;
    if (v24 || (sub_229319084() & 1) != 0)
    {
      if (v21 == 0x7373616C436D6C67 && v23 == 0xED00007265696669 || (sub_229319084() & 1) != 0)
        goto LABEL_33;
      if ((v25 & 1) != 0)
        goto LABEL_32;
    }
    if ((sub_229319084() & 1) != 0)
    {
LABEL_32:
      if (v21 != 0xD000000000000017 || v23 != 0x8000000229319F30)
      {
        v6 = sub_229319084();
        swift_bridgeObjectRelease();
        goto LABEL_38;
      }
LABEL_33:
      swift_bridgeObjectRelease();
      v6 = 1;
LABEL_38:
      swift_bridgeObjectRelease();
      return v6 & 1;
    }
LABEL_37:
    swift_bridgeObjectRelease();
    v6 = 0;
    goto LABEL_38;
  }
LABEL_44:
  __break(1u);
  return result;
}

void sub_229312BC4()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  id v6;
  void *v7;
  unint64_t v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v1 = objc_msgSend(v0, sel_modelTypeName);
  v2 = sub_229318F88();
  v4 = v3;

  if (v2 == 0xD000000000000012 && v4 == 0x8000000229319EF0)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = sub_229319084();
    swift_bridgeObjectRelease();
    if ((v5 & 1) == 0)
      return;
  }
  v6 = objc_msgSend(v0, sel_subModels);
  if (v6)
  {
    v7 = v6;
    sub_229315124(0, &qword_255A408E8);
    v8 = sub_229318FC4();

    if (v8 >> 62)
    {
      swift_bridgeObjectRetain();
      v22 = sub_229319060();
      swift_bridgeObjectRelease();
      if (v22 != 2)
        goto LABEL_24;
    }
    else if (*(_QWORD *)((v8 & 0xFFFFFFFFFFFFF8) + 0x10) != 2)
    {
      goto LABEL_24;
    }
    if ((v8 & 0xC000000000000001) != 0)
    {
      v9 = (id)MEMORY[0x22E2C735C](0, v8);
    }
    else
    {
      if (!*(_QWORD *)((v8 & 0xFFFFFFFFFFFFF8) + 0x10))
      {
        __break(1u);
        goto LABEL_28;
      }
      v9 = *(id *)(v8 + 32);
    }
    v10 = v9;
    v11 = objc_msgSend(v9, sel_modelTypeName);

    v12 = sub_229318F88();
    v14 = v13;

    if (v12 == 0xD000000000000011 && v14 == 0x8000000229319EB0)
    {
      swift_bridgeObjectRelease();
LABEL_15:
      if ((v8 & 0xC000000000000001) != 0)
      {
        v16 = (id)MEMORY[0x22E2C735C](1, v8);
LABEL_19:
        v17 = v16;
        swift_bridgeObjectRelease();
        v18 = objc_msgSend(v17, sel_modelTypeName);

        v19 = sub_229318F88();
        v21 = v20;

        if (v19 == 0x7373616C436D6C67 && v21 == 0xED00007265696669)
        {
          swift_bridgeObjectRelease();
        }
        else
        {
          sub_229319084();
          swift_bridgeObjectRelease();
        }
        return;
      }
      if (*(_QWORD *)((v8 & 0xFFFFFFFFFFFFF8) + 0x10) >= 2uLL)
      {
        v16 = *(id *)(v8 + 40);
        goto LABEL_19;
      }
LABEL_28:
      __break(1u);
      return;
    }
    v15 = sub_229319084();
    swift_bridgeObjectRelease();
    if ((v15 & 1) != 0)
      goto LABEL_15;
LABEL_24:
    swift_bridgeObjectRelease();
  }
}

void sub_229312ED8()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  id v6;
  void *v7;
  unint64_t v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v1 = objc_msgSend(v0, sel_modelTypeName);
  v2 = sub_229318F88();
  v4 = v3;

  if (v2 == 0xD000000000000011 && v4 == 0x8000000229319E90)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = sub_229319084();
    swift_bridgeObjectRelease();
    if ((v5 & 1) == 0)
      return;
  }
  v6 = objc_msgSend(v0, sel_subModels);
  if (v6)
  {
    v7 = v6;
    sub_229315124(0, &qword_255A408E8);
    v8 = sub_229318FC4();

    if (v8 >> 62)
    {
      swift_bridgeObjectRetain();
      v22 = sub_229319060();
      swift_bridgeObjectRelease();
      if (v22 != 2)
        goto LABEL_24;
    }
    else if (*(_QWORD *)((v8 & 0xFFFFFFFFFFFFF8) + 0x10) != 2)
    {
      goto LABEL_24;
    }
    if ((v8 & 0xC000000000000001) != 0)
    {
      v9 = (id)MEMORY[0x22E2C735C](0, v8);
    }
    else
    {
      if (!*(_QWORD *)((v8 & 0xFFFFFFFFFFFFF8) + 0x10))
      {
        __break(1u);
        goto LABEL_28;
      }
      v9 = *(id *)(v8 + 32);
    }
    v10 = v9;
    v11 = objc_msgSend(v9, sel_modelTypeName);

    v12 = sub_229318F88();
    v14 = v13;

    if (v12 == 0xD000000000000011 && v14 == 0x8000000229319EB0)
    {
      swift_bridgeObjectRelease();
LABEL_15:
      if ((v8 & 0xC000000000000001) != 0)
      {
        v16 = (id)MEMORY[0x22E2C735C](1, v8);
LABEL_19:
        v17 = v16;
        swift_bridgeObjectRelease();
        v18 = objc_msgSend(v17, sel_modelTypeName);

        v19 = sub_229318F88();
        v21 = v20;

        if (v19 == 0xD000000000000015 && v21 == 0x8000000229319ED0)
        {
          swift_bridgeObjectRelease();
        }
        else
        {
          sub_229319084();
          swift_bridgeObjectRelease();
        }
        return;
      }
      if (*(_QWORD *)((v8 & 0xFFFFFFFFFFFFF8) + 0x10) >= 2uLL)
      {
        v16 = *(id *)(v8 + 40);
        goto LABEL_19;
      }
LABEL_28:
      __break(1u);
      return;
    }
    v15 = sub_229319084();
    swift_bridgeObjectRelease();
    if ((v15 & 1) != 0)
      goto LABEL_15;
LABEL_24:
    swift_bridgeObjectRelease();
  }
}

BOOL sub_2293131BC()
{
  void *v0;
  char **v1;
  char **v2;
  void *v3;
  uint64_t p_type;
  id v5;
  id v6;
  unint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  unint64_t v11;
  id v12;
  id v13;
  unint64_t v14;
  unint64_t v15;
  id v16;
  id v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  void *v22;
  id v23;

  v3 = v0;
  p_type = (uint64_t)&stru_24F205FF0.type;
  v5 = objc_msgSend(v0, sel_modelDescription);
  v6 = objc_msgSend(v5, sel_inputDescriptions);

  sub_229315124(0, &qword_255A408C0);
  v7 = sub_229318FC4();

  if (v7 >> 62)
  {
    swift_bridgeObjectRetain();
    v8 = sub_229319060();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = *(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (v8 != 1)
    return 0;
  v9 = objc_msgSend(v3, sel_modelDescription);
  v10 = objc_msgSend(v9, sel_inputDescriptions);

  v11 = sub_229318FC4();
  if ((v11 & 0xC000000000000001) != 0)
  {
LABEL_28:
    v12 = (id)MEMORY[0x22E2C735C](0, v11);
  }
  else
  {
    if (!*(_QWORD *)((v11 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_30;
    }
    v12 = *(id *)(v11 + 32);
  }
  v9 = v12;
  swift_bridgeObjectRelease();
  v1 = &stru_24F205FF0.type;
  if (objc_msgSend(v9, sel_type) != (id)5
    || (v2 = &stru_24F205FF0.type, !objc_msgSend(v9, sel_constraint)))
  {

    return 0;
  }
  objc_opt_self();
  v13 = objc_msgSend((id)swift_dynamicCastObjCClassUnconditional(), sel_shape);
  sub_229315124(0, &qword_255A408C8);
  v14 = sub_229318FC4();

  __swift_instantiateConcreteTypeFromMangledName(&qword_255A408D0);
  v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_229319730;
  *(_QWORD *)(v15 + 32) = sub_229318FF4();
  *(_QWORD *)(v15 + 40) = sub_229318FF4();
  *(_QWORD *)(v15 + 48) = sub_229318FF4();
  sub_229318FD0();
  LOBYTE(v15) = sub_229314340(v14, v15);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v15 & 1) == 0)
    goto LABEL_20;
  v16 = objc_msgSend(v3, *(SEL *)(p_type + 232));
  v17 = objc_msgSend(v16, sel_outputDescriptions);

  v11 = sub_229318FC4();
  if (!(v11 >> 62))
  {
    v18 = *(_QWORD *)((v11 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v18)
      goto LABEL_12;
    goto LABEL_19;
  }
LABEL_30:
  swift_bridgeObjectRetain();
  v18 = sub_229319060();
  if (!v18)
  {
LABEL_19:
    swift_bridgeObjectRelease_n();
LABEL_20:

    swift_unknownObjectRelease();
    return 0;
  }
LABEL_12:
  p_type = 4;
  while (1)
  {
    if ((v11 & 0xC000000000000001) != 0)
      v19 = (id)MEMORY[0x22E2C735C](p_type - 4, v11);
    else
      v19 = *(id *)(v11 + 8 * p_type);
    v3 = v19;
    v20 = p_type - 3;
    if (__OFADD__(p_type - 4, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (objc_msgSend(v19, v1[31]) == (id)6)
      break;

    ++p_type;
    if (v20 == v18)
      goto LABEL_19;
  }
  swift_bridgeObjectRelease_n();
  if (objc_msgSend(v3, v2[32]))
  {
    objc_opt_self();
    v22 = (void *)swift_dynamicCastObjCClassUnconditional();
    swift_unknownObjectRetain();
    v23 = objc_msgSend(v22, sel_keyType);

    swift_unknownObjectRelease_n();
    swift_unknownObjectRelease();
    return v23 == (id)3;
  }

  swift_unknownObjectRelease();
  return 0;
}

uint64_t sub_22931360C()
{
  void *v0;
  unint64_t v1;
  unint64_t v2;
  void *v3;
  id v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  unint64_t v10;
  id v11;
  id v12;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  int64_t v19;
  uint64_t v20;
  char v21;
  char v22;
  id v23;
  id v24;
  uint64_t v25;
  char **p_type;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t result;
  void *v31;
  id v32;

  v3 = v0;
  v4 = objc_msgSend(v0, sel_modelDescription);
  v5 = objc_msgSend(v4, sel_inputDescriptions);

  sub_229315124(0, &qword_255A408C0);
  v6 = sub_229318FC4();

  if (v6 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_229319060();
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (v7 != 1)
    return 0;
  v8 = objc_msgSend(v3, sel_modelDescription);
  v9 = objc_msgSend(v8, sel_inputDescriptions);

  v10 = sub_229318FC4();
  if ((v10 & 0xC000000000000001) != 0)
  {
LABEL_43:
    v11 = (id)MEMORY[0x22E2C735C](0, v10);
  }
  else
  {
    if (!*(_QWORD *)((v10 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_45;
    }
    v11 = *(id *)(v10 + 32);
  }
  v8 = v11;
  swift_bridgeObjectRelease();
  if (objc_msgSend(v8, sel_type) != (id)5 || !objc_msgSend(v8, sel_constraint))
  {

    return 0;
  }
  objc_opt_self();
  v12 = objc_msgSend((id)swift_dynamicCastObjCClassUnconditional(), sel_shape);
  sub_229315124(0, &qword_255A408C8);
  v1 = sub_229318FC4();

  v2 = v1 >> 62;
  if (!(v1 >> 62))
  {
    v13 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v13 >= 1)
      v14 = 1;
    else
      v14 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v13 >= (unint64_t)v14)
    {
LABEL_14:
      if ((v1 & 0xC000000000000001) != 0 && (unint64_t)v13 >= 2)
      {
        v15 = v14;
        do
        {
          v16 = v15 + 1;
          sub_229319018();
          v15 = v16;
        }
        while (v13 != v16);
      }
      if (v2)
      {
        swift_bridgeObjectRetain();
        sub_22931906C();
        v9 = v17;
        v14 = v18;
        v13 = v19;
        swift_bridgeObjectRelease_n();
      }
      else
      {
        v9 = (id)((v1 & 0xFFFFFFFFFFFFFF8) + 32);
        v13 = (2 * v13) | 1;
      }
      __swift_instantiateConcreteTypeFromMangledName(&qword_255A408D0);
      v1 = swift_allocObject();
      *(_OWORD *)(v1 + 16) = xmmword_229319740;
      *(_QWORD *)(v1 + 32) = sub_229318FF4();
      *(_QWORD *)(v1 + 40) = sub_229318FF4();
      sub_229318FD0();
      if ((v1 & 0x8000000000000000) == 0 && (v1 & 0x4000000000000000) == 0)
      {
        v20 = v1 & 0xFFFFFFFFFFFFFF8;
LABEL_25:
        sub_229314B5C((uint64_t)v9, v14, v13, v20 + 32, 0, (2 * *(_QWORD *)(v20 + 16)) | 1);
        v22 = v21;
        swift_unknownObjectRelease();
        swift_release();
        if ((v22 & 1) != 0)
        {
          v23 = objc_msgSend(v3, sel_modelDescription);
          v24 = objc_msgSend(v23, sel_outputDescriptions);

          v10 = sub_229318FC4();
          if (v10 >> 62)
          {
            swift_bridgeObjectRetain();
            v25 = sub_229319060();
            p_type = (char **)(&stru_24F205FF0 + 16);
            if (v25)
            {
LABEL_28:
              v9 = (id)(v10 & 0xC000000000000001);
              v27 = 4;
              while (1)
              {
                if (v9)
                  v28 = (id)MEMORY[0x22E2C735C](v27 - 4, v10);
                else
                  v28 = *(id *)(v10 + 8 * v27);
                v3 = v28;
                v29 = v27 - 3;
                if (__OFADD__(v27 - 4, 1))
                {
                  __break(1u);
                  goto LABEL_43;
                }
                if (objc_msgSend(v28, p_type[31]) == (id)6)
                  break;

                ++v27;
                if (v29 == v25)
                  goto LABEL_35;
              }
              swift_bridgeObjectRelease_n();
              if (objc_msgSend(v3, sel_constraint))
              {
                objc_opt_self();
                v31 = (void *)swift_dynamicCastObjCClassUnconditional();
                swift_unknownObjectRetain();
                v32 = objc_msgSend(v31, sel_keyType);

                swift_unknownObjectRelease_n();
                swift_unknownObjectRelease();
                return v32 == (id)3;
              }

              swift_unknownObjectRelease();
              return 0;
            }
          }
          else
          {
            v25 = *(_QWORD *)((v10 & 0xFFFFFFFFFFFFF8) + 0x10);
            swift_bridgeObjectRetain();
            p_type = &stru_24F205FF0.type;
            if (v25)
              goto LABEL_28;
          }
LABEL_35:
          swift_bridgeObjectRelease_n();
        }

        swift_unknownObjectRelease();
        return 0;
      }
LABEL_53:
      v20 = (uint64_t)sub_229314634(v1);
      swift_bridgeObjectRelease();
      goto LABEL_25;
    }
    goto LABEL_52;
  }
LABEL_45:
  swift_bridgeObjectRetain();
  v13 = sub_229319060();
  result = swift_bridgeObjectRelease();
  if ((v13 & 0x8000000000000000) == 0)
  {
    if (v13 >= 1)
      v14 = 1;
    else
      v14 = v13;
    swift_bridgeObjectRetain();
    v9 = (id)sub_229319060();
    swift_bridgeObjectRelease();
    if ((uint64_t)v9 >= v14)
    {
      swift_bridgeObjectRetain();
      v9 = (id)sub_229319060();
      swift_bridgeObjectRelease();
      if ((uint64_t)v9 >= v13)
        goto LABEL_14;
      __break(1u);
    }
LABEL_52:
    __break(1u);
    goto LABEL_53;
  }
  __break(1u);
  return result;
}

uint64_t sub_229313BD0()
{
  void *v0;
  void *v1;
  id v2;
  id v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  unint64_t v10;
  char v11;

  v1 = v0;
  v2 = objc_msgSend(v0, sel_modelDescription);
  v3 = objc_msgSend(v2, sel_predictedFeatureName);

  if (v3)
  {
    v4 = sub_229318F88();
    v6 = v5;

    v7 = HIBYTE(v6) & 0xF;
    if ((v6 & 0x2000000000000000) == 0)
      v7 = v4 & 0xFFFFFFFFFFFFLL;
    if (v7)
    {
      v8 = objc_msgSend(v1, sel_modelDescription);
      v9 = objc_msgSend(v8, sel_outputDescriptions);

      sub_229315124(0, &qword_255A408C0);
      v10 = sub_229318FC4();

      swift_bridgeObjectRetain();
      v11 = sub_2293149C0(v10, v4, v6);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      v11 = 0;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    v11 = 0;
  }
  return v11 & 1;
}

uint64_t sub_229313D14()
{
  void *v0;
  uint64_t result;
  void *v2;
  unint64_t v3;
  id v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  id v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  id v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  char v38;
  uint64_t v39;

  result = (uint64_t)objc_msgSend(v0, sel_subModels);
  if (!result)
    return result;
  v2 = (void *)result;
  sub_229315124(0, &qword_255A408E8);
  v3 = sub_229318FC4();

  if (v3 >> 62)
  {
    swift_bridgeObjectRetain();
    v39 = sub_229319060();
    swift_bridgeObjectRelease();
    if (v39 != 2)
      goto LABEL_7;
  }
  else if (*(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10) != 2)
  {
    goto LABEL_7;
  }
  v4 = objc_msgSend(v0, sel_modelDescription);
  v5 = objc_msgSend(v4, sel_outputDescriptions);

  sub_229315124(0, &qword_255A408C0);
  v6 = sub_229318FC4();

  if (v6 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_229319060();
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (v7 >= 3)
    goto LABEL_7;
  v8 = v3 & 0xC000000000000001;
  if ((v3 & 0xC000000000000001) != 0)
  {
    v9 = (id)MEMORY[0x22E2C735C](0, v3);
  }
  else
  {
    if (!*(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
LABEL_61:
      __break(1u);
LABEL_62:
      __break(1u);
      goto LABEL_63;
    }
    v9 = *(id *)(v3 + 32);
  }
  v10 = v9;
  v11 = objc_msgSend(v9, sel_modelTypeName);

  v12 = sub_229318F88();
  v14 = v13;

  if (v12 == 0xD000000000000012 && v14 == 0x8000000229319FF0)
    goto LABEL_25;
  v15 = sub_229319084();
  swift_bridgeObjectRelease();
  if ((v15 & 1) != 0)
    goto LABEL_26;
  v16 = v8 ? (id)MEMORY[0x22E2C735C](0, v3) : *(id *)(v3 + 32);
  v17 = v16;
  v18 = objc_msgSend(v16, sel_modelTypeName);

  v19 = sub_229318F88();
  v21 = v20;

  if (v19 == 0x654E6C617275656ELL && v21 == 0xED00006B726F7774)
    goto LABEL_25;
  v22 = sub_229319084();
  swift_bridgeObjectRelease();
  if ((v22 & 1) != 0)
    goto LABEL_26;
  v23 = v8 ? (id)MEMORY[0x22E2C735C](0, v3) : *(id *)(v3 + 32);
  v24 = v23;
  v25 = objc_msgSend(v23, sel_modelTypeName);

  v26 = sub_229318F88();
  v28 = v27;

  if (v26 == 0x6F4D6D6F74737563 && v28 == 0xEB000000006C6564)
  {
LABEL_25:
    swift_bridgeObjectRelease();
    goto LABEL_26;
  }
  v37 = sub_229319084();
  swift_bridgeObjectRelease();
  if ((v37 & 1) == 0)
  {
LABEL_7:
    swift_bridgeObjectRelease();
    return 0;
  }
LABEL_26:
  if (v3 >> 62)
  {
    swift_bridgeObjectRetain();
    v29 = sub_229319060();
    swift_bridgeObjectRelease();
  }
  else
  {
    v29 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  if (!v29)
    goto LABEL_64;
  v30 = v29 - 1;
  if (__OFSUB__(v29, 1))
    goto LABEL_61;
  if (v8)
  {
    v31 = (id)MEMORY[0x22E2C735C](v30, v3);
    goto LABEL_36;
  }
  if ((v30 & 0x8000000000000000) != 0)
    goto LABEL_62;
  if (v30 >= *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_63:
    __break(1u);
LABEL_64:
    result = swift_bridgeObjectRelease();
    __break(1u);
    return result;
  }
  v31 = *(id *)(v3 + 8 * v30 + 32);
LABEL_36:
  v32 = v31;
  swift_bridgeObjectRelease();
  v33 = objc_msgSend(v32, sel_modelTypeName);

  v34 = sub_229318F88();
  v36 = v35;

  if (v34 == 0x7373616C436D6C67 && v36 == 0xED00007265696669
    || (sub_229319084() & 1) != 0
    || v34 == 0xD000000000000017 && v36 == 0x8000000229319F90
    || (sub_229319084() & 1) != 0
    || v34 == 0xD000000000000016 && v36 == 0x8000000229319FB0
    || (sub_229319084() & 1) != 0
    || v34 == 0xD000000000000017 && v36 == 0x8000000229319F30
    || (sub_229319084() & 1) != 0
    || v34 == 0xD00000000000001BLL && v36 == 0x8000000229319FD0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v38 = sub_229319084();
    swift_bridgeObjectRelease();
    return v38 & 1;
  }
}

id sub_229314340(unint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id result;
  void *v12;
  id v13;
  void *v14;
  char v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  unint64_t v24;
  unint64_t v25;
  void **v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  unint64_t v31;

  v2 = a2;
  v3 = a1;
  v4 = a1 >> 62;
  if (!(a1 >> 62))
  {
    v5 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    v6 = a2 >> 62;
    if (!(a2 >> 62))
      goto LABEL_3;
LABEL_47:
    swift_bridgeObjectRetain();
    v30 = sub_229319060();
    swift_bridgeObjectRelease();
    if (v5 == v30)
      goto LABEL_4;
LABEL_48:
    LOBYTE(v5) = 0;
    return (id)(v5 & 1);
  }
  swift_bridgeObjectRetain();
  v5 = sub_229319060();
  swift_bridgeObjectRelease();
  v6 = (unint64_t)v2 >> 62;
  if ((unint64_t)v2 >> 62)
    goto LABEL_47;
LABEL_3:
  if (v5 != *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10))
    goto LABEL_48;
LABEL_4:
  if (!v5)
    goto LABEL_37;
  v7 = v3 & 0xFFFFFFFFFFFFFF8;
  if (v3 < 0)
    v7 = v3;
  if (!v4)
    v7 = (v3 & 0xFFFFFFFFFFFFFF8) + 32;
  v8 = v2 & 0xFFFFFFFFFFFFFF8;
  v9 = (v2 & 0xFFFFFFFFFFFFFF8) + 32;
  if (v2 < 0)
    v10 = v2;
  else
    v10 = v2 & 0xFFFFFFFFFFFFFF8;
  if (v6)
    v9 = v10;
  if (v7 == v9)
  {
LABEL_37:
    LOBYTE(v5) = 1;
    return (id)(v5 & 1);
  }
  if ((v5 & 0x8000000000000000) != 0)
    goto LABEL_54;
  v31 = v3 & 0xC000000000000001;
  if ((v3 & 0xC000000000000001) != 0)
    goto LABEL_55;
  for (result = *(id *)(v3 + 32); ; result = (id)MEMORY[0x22E2C735C](0, v3))
  {
    v12 = result;
    if ((v2 & 0xC000000000000001) == 0)
      break;
    v13 = (id)MEMORY[0x22E2C735C](0, v2);
LABEL_21:
    v14 = v13;
    sub_229315124(0, &qword_255A408C8);
    v15 = sub_229319000();

    if ((v15 & 1) == 0)
      goto LABEL_48;
    v16 = v5 - 1;
    if (v5 == 1)
      return (id)(v5 & 1);
    if (((v2 | v3) & 0xC000000000000001) != 0)
    {
      v17 = 0;
      v18 = v5 - 2;
      while (v16 != v17)
      {
        v5 = v17 + 1;
        if (v31)
          v19 = (id)MEMORY[0x22E2C735C](v17 + 1, v3);
        else
          v19 = *(id *)(v3 + 40 + 8 * v17);
        v20 = v19;
        if ((v2 & 0xC000000000000001) != 0)
        {
          v21 = (id)MEMORY[0x22E2C735C](v17 + 1, v2);
        }
        else
        {
          if (v5 >= *(_QWORD *)(v8 + 16))
            goto LABEL_53;
          v21 = *(id *)(v2 + 40 + 8 * v17);
        }
        v22 = v21;
        v5 = sub_229319000();

        if ((v5 & 1) != 0 && v18 != v17++)
          continue;
        return (id)(v5 & 1);
      }
      __break(1u);
    }
    else
    {
      v24 = *(_QWORD *)(v8 + 16);
      if (v24 <= 1)
        v24 = 1;
      v25 = v24 - 1;
      v26 = (void **)(v3 + 40);
      v8 = v2 + 40;
      while (v16)
      {
        if (!v25)
          goto LABEL_52;
        v28 = *v26++;
        v27 = v28;
        v29 = *(void **)v8;
        v8 += 8;
        v2 = v27;
        v3 = v29;
        v5 = sub_229319000();

        if ((v5 & 1) != 0)
        {
          --v25;
          if (--v16)
            continue;
        }
        return (id)(v5 & 1);
      }
    }
    __break(1u);
LABEL_52:
    __break(1u);
LABEL_53:
    __break(1u);
LABEL_54:
    __break(1u);
LABEL_55:
    ;
  }
  if (*(_QWORD *)(v8 + 16))
  {
    v13 = *(id *)(v2 + 32);
    goto LABEL_21;
  }
  __break(1u);
  return result;
}

_QWORD *sub_229314634(unint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  int64_t v4;
  uint64_t v5;
  unint64_t v6;

  v1 = a1;
  if (a1 >> 62)
    goto LABEL_10;
  v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v2)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  while (1)
  {
    if (v2 <= 0)
    {
      v3 = (_QWORD *)MEMORY[0x24BEE4AF8];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_255A408D0);
      v3 = (_QWORD *)swift_allocObject();
      v4 = _swift_stdlib_malloc_size(v3);
      v5 = v4 - 32;
      if (v4 < 32)
        v5 = v4 - 25;
      v3[2] = v2;
      v3[3] = (2 * (v5 >> 3)) | 1;
    }
    swift_bridgeObjectRetain();
    sub_229314728((uint64_t)(v3 + 4), v2, v1);
    v1 = v6;
    swift_bridgeObjectRelease();
    if (v1 == v2)
      break;
    __break(1u);
LABEL_10:
    swift_bridgeObjectRetain();
    v2 = sub_229319060();
    swift_bridgeObjectRelease();
    if (!v2)
      return (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  return v3;
}

uint64_t sub_229314728(uint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t i;
  void (*v10)(_QWORD *);
  id *v11;
  id v12;
  void (*v13[4])(id *);

  v5 = result;
  v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_229319060();
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
      v8 = sub_229319060();
      result = swift_bridgeObjectRelease();
      if (v8 <= a2)
      {
        if (v7 >= 1)
        {
          sub_229315094();
          swift_bridgeObjectRetain();
          for (i = 0; i != v7; ++i)
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_255A408D8);
            v10 = sub_2293148CC(v13, i, a3);
            v12 = *v11;
            ((void (*)(void (**)(id *), _QWORD))v10)(v13, 0);
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
        sub_229315124(0, &qword_255A408C8);
        swift_arrayInitWithCopy();
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

void (*sub_2293148CC(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(_QWORD *a1)
{
  void (*v6)(id *);

  v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((_QWORD *)v6 + 4) = sub_22931494C(v6, a2, a3);
  return sub_229314920;
}

void sub_229314920(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_22931494C(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  void (*v3)(id *);
  id v4;

  v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    v4 = (id)MEMORY[0x22E2C735C](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(_QWORD *)v3 = v4;
    return destroy for ModelHeuristics;
  }
  __break(1u);
  return result;
}

void destroy for ModelHeuristics(id *a1)
{

}

uint64_t sub_2293149C0(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  char v20;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;

  v4 = v3;
  v7 = a1;
  if (a1 >> 62)
  {
LABEL_20:
    swift_bridgeObjectRetain();
    v8 = sub_229319060();
    if (v8)
      goto LABEL_3;
  }
  else
  {
    v8 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v8)
    {
LABEL_3:
      v22 = v4;
      v23 = v7;
      v24 = v7 & 0xC000000000000001;
      v9 = 4;
      while (1)
      {
        v10 = v9 - 4;
        if (v24)
        {
          v11 = (id)MEMORY[0x22E2C735C](v9 - 4, v7);
          v4 = v9 - 3;
          if (__OFADD__(v10, 1))
            goto LABEL_19;
        }
        else
        {
          v11 = *(id *)(v7 + 8 * v9);
          v4 = v9 - 3;
          if (__OFADD__(v10, 1))
          {
LABEL_19:
            __break(1u);
            goto LABEL_20;
          }
        }
        v12 = v8;
        v13 = v11;
        v14 = a3;
        v15 = objc_msgSend(v11, sel_name, v22);
        v16 = sub_229318F88();
        v18 = v17;

        a3 = v14;
        v19 = v16 == a2 && v18 == v14;
        if (v19)
        {
          swift_bridgeObjectRelease();

          v20 = 1;
          goto LABEL_22;
        }
        v20 = sub_229319084();

        swift_bridgeObjectRelease();
        if ((v20 & 1) == 0)
        {
          ++v9;
          v8 = v12;
          v19 = v4 == v12;
          v7 = v23;
          if (!v19)
            continue;
        }
        goto LABEL_22;
      }
    }
  }
  v20 = 0;
LABEL_22:
  swift_bridgeObjectRelease();
  return v20 & 1;
}

void sub_229314B5C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  int64_t v6;
  uint64_t v7;
  int64_t v9;
  id *v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  char v17;
  id v18;
  uint64_t v19;
  id v20;

  v6 = a3 >> 1;
  v7 = (a3 >> 1) - a2;
  if (__OFSUB__(a3 >> 1, a2))
  {
    __break(1u);
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  v9 = a6 >> 1;
  if (__OFSUB__(a6 >> 1, a5))
    goto LABEL_23;
  if (v7 != (a6 >> 1) - a5)
    return;
  if (!v7)
    return;
  v12 = (id *)(a1 + 8 * a2);
  if (v12 == (id *)(a4 + 8 * a5) || v6 == a2)
    return;
  if (v6 <= a2)
  {
LABEL_26:
    __break(1u);
    return;
  }
  v19 = a2 + 1;
  v18 = *v12;
  v20 = *v12;
  if (v18)
  {
    v13 = a5;
    while (v9 != v13)
    {
      if (v13 < a5 || v13 >= v9)
        goto LABEL_24;
      v14 = *(void **)(a4 + 8 * v13);
      sub_229315124(0, &qword_255A408C8);
      v15 = v14;
      v16 = v18;
      v17 = sub_229319000();

      if ((v17 & 1) != 0 && v6 != v19)
      {
        if (v19 >= v6)
          goto LABEL_25;
        v18 = *(id *)(a1 + 8 * v19);
        ++v13;
        ++v19;
        if (v18)
          continue;
      }
      return;
    }

  }
}

uint64_t sub_229314CC0(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;
  char v7;
  char v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  id v24;

  if ((sub_2293107C0() & 1) != 0)
  {
    v2 = 0x436567616D69;
    return v2 & 0xFFFFFFFFFFFFLL | 0x616C000000000000;
  }
  if ((sub_229310CA4() & 1) != 0)
    return 0xD000000000000012;
  if ((sub_2293118D0() & 1) != 0)
    return 0x65447463656A626FLL;
  sub_229311FF8();
  if ((v4 & 1) != 0)
    return 0x617254656C797473;
  sub_2293122B4();
  if ((v5 & 1) != 0)
    return 0xD000000000000010;
  if ((sub_22931281C() & 1) != 0)
  {
    v2 = 0x43646E756F73;
    return v2 & 0xFFFFFFFFFFFFLL | 0x616C000000000000;
  }
  sub_229312BC4();
  if ((v7 & 1) != 0)
    return 0xD000000000000011;
  sub_229312ED8();
  if ((v8 & 1) != 0)
    return 0xD000000000000010;
  v3 = 0x6E656D6D6F636572;
  v9 = objc_msgSend(a1, sel_modelTypeName);
  v10 = sub_229318F88();
  v12 = v11;

  if (v10 == 0xD000000000000019 && v12 == 0x8000000229319E70)
    goto LABEL_27;
  v13 = sub_229319084();
  swift_bridgeObjectRelease();
  if ((v13 & 1) != 0)
    return v3;
  v3 = 0x73616C4374786574;
  v14 = objc_msgSend(a1, sel_modelTypeName);
  v15 = sub_229318F88();
  v17 = v16;

  if (v15 == 0x73616C4374786574 && v17 == 0xEE00726569666973)
    goto LABEL_27;
  v18 = sub_229319084();
  swift_bridgeObjectRelease();
  if ((v18 & 1) != 0)
    return v3;
  v3 = 0x6767615464726F77;
  v19 = objc_msgSend(a1, sel_modelTypeName);
  v20 = sub_229318F88();
  v22 = v21;

  if (v20 == 0x6767615464726F77 && v22 == 0xEA00000000007265)
  {
LABEL_27:
    swift_bridgeObjectRelease();
    return v3;
  }
  v23 = sub_229319084();
  swift_bridgeObjectRelease();
  if ((v23 & 1) == 0)
  {
    if (sub_2293131BC())
    {
      return 0xD000000000000012;
    }
    else if ((sub_22931360C() & 1) != 0)
    {
      return 0xD000000000000014;
    }
    else
    {
      v24 = objc_msgSend(a1, sel_modelTypeName);
      v3 = sub_229318F88();

    }
  }
  return v3;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x22E2C7650]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_229315094()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255A408E0;
  if (!qword_255A408E0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255A408D8);
    result = MEMORY[0x22E2C7668](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&qword_255A408E0);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x22E2C765C](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_229315124(uint64_t a1, unint64_t *a2)
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

MLKit::MLPreviewType_optional __swiftcall MLPreviewType.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  MLKit::MLPreviewType_optional result;
  char v5;

  v2 = v1;
  v3 = sub_229319090();
  result.value = swift_bridgeObjectRelease();
  v5 = 19;
  if (v3 < 0x13)
    v5 = v3;
  *v2 = v5;
  return result;
}

uint64_t sub_2293151BC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = MLPreviewType.rawValue.getter();
  v2 = v1;
  if (v0 == MLPreviewType.rawValue.getter() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_229319084();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

void *static MLPreviewType.allCases.getter()
{
  return &unk_24F205900;
}

uint64_t MLPreviewType.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_229315298 + 4 * byte_229319750[*v0]))(0x616C436567616D69, 0xEF72656966697373);
}

uint64_t sub_229315298()
{
  return 0x73616C4374786574;
}

unint64_t sub_2293152BC()
{
  return 0xD000000000000012;
}

uint64_t sub_229315480()
{
  return 0x6E776F6E6B6E75;
}

uint64_t sub_229315498()
{
  return sub_2293151BC();
}

unint64_t sub_2293154A8()
{
  unint64_t result;

  result = qword_255A408F0;
  if (!qword_255A408F0)
  {
    result = MEMORY[0x22E2C7668](&protocol conformance descriptor for MLPreviewType, &type metadata for MLPreviewType);
    atomic_store(result, (unint64_t *)&qword_255A408F0);
  }
  return result;
}

uint64_t sub_2293154EC()
{
  sub_2293190CC();
  MLPreviewType.rawValue.getter();
  sub_229318F94();
  swift_bridgeObjectRelease();
  return sub_2293190F0();
}

uint64_t sub_229315550()
{
  MLPreviewType.rawValue.getter();
  sub_229318F94();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2293155A0()
{
  sub_2293190CC();
  MLPreviewType.rawValue.getter();
  sub_229318F94();
  swift_bridgeObjectRelease();
  return sub_2293190F0();
}

uint64_t sub_229315600()
{
  sub_2293158B8();
  return sub_229318FB8();
}

uint64_t sub_22931565C()
{
  sub_2293158B8();
  return sub_229318FAC();
}

unint64_t sub_2293156AC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255A408F8;
  if (!qword_255A408F8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255A40900);
    result = MEMORY[0x22E2C7668](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&qword_255A408F8);
  }
  return result;
}

void sub_2293156F8(_QWORD *a1@<X8>)
{
  *a1 = &unk_24F205900;
}

MLKit::MLPreviewType_optional sub_229315708(Swift::String *a1)
{
  return MLPreviewType.init(rawValue:)(*a1);
}

uint64_t sub_229315714@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = MLPreviewType.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for MLPreviewType(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xEE)
    goto LABEL_17;
  if (a2 + 18 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 18) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 18;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 18;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 18;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0x13;
  v8 = v6 - 19;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for MLPreviewType(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 18 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 18) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xEE)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xED)
    return ((uint64_t (*)(void))((char *)&loc_229315824 + 4 * byte_229319768[v4]))();
  *a1 = a2 + 18;
  return ((uint64_t (*)(void))((char *)sub_229315858 + 4 * byte_229319763[v4]))();
}

uint64_t sub_229315858(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_229315860(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x229315868);
  return result;
}

uint64_t sub_229315874(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x22931587CLL);
  *(_BYTE *)result = a2 + 18;
  return result;
}

uint64_t sub_229315880(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_229315888(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_229315894(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_2293158A0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for MLPreviewType()
{
  return &type metadata for MLPreviewType;
}

unint64_t sub_2293158B8()
{
  unint64_t result;

  result = qword_255A40908;
  if (!qword_255A40908)
  {
    result = MEMORY[0x22E2C7668](&protocol conformance descriptor for MLPreviewType, &type metadata for MLPreviewType);
    atomic_store(result, (unint64_t *)&qword_255A40908);
  }
  return result;
}

BOOL sub_2293158FC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_229315914()
{
  sub_2293190CC();
  sub_2293190D8();
  return sub_2293190F0();
}

uint64_t sub_229315958()
{
  return sub_2293190D8();
}

uint64_t sub_229315980()
{
  sub_2293190CC();
  sub_2293190D8();
  return sub_2293190F0();
}

uint64_t sub_2293159C0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t);

  v1 = v0 + OBJC_IVAR____TtC5MLKit20MLPreviewEnvironment__screenMode;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A40A90);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  v3 = v0 + OBJC_IVAR____TtC5MLKit20MLPreviewEnvironment__dismissPreview;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A40A98);
  v5 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(v3, v4);
  v5(v0 + OBJC_IVAR____TtC5MLKit20MLPreviewEnvironment__presentShareSheet, v4);
  return swift_deallocClassInstance();
}

uint64_t sub_229315A60()
{
  return type metadata accessor for MLPreviewEnvironment();
}

uint64_t type metadata accessor for MLPreviewEnvironment()
{
  uint64_t result;

  result = qword_255A40950;
  if (!qword_255A40950)
    return swift_getSingletonMetadata();
  return result;
}

void sub_229315AA4()
{
  unint64_t v0;
  unint64_t v1;

  sub_229315B4C(319, &qword_255A40960);
  if (v0 <= 0x3F)
  {
    sub_229315B4C(319, qword_255A40968);
    if (v1 <= 0x3F)
      swift_updateClassMetadata2();
  }
}

void sub_229315B4C(uint64_t a1, unint64_t *a2)
{
  unint64_t v3;
  uint64_t v4;

  if (!*a2)
  {
    v3 = sub_229318F40();
    if (!v4)
      atomic_store(v3, a2);
  }
}

uint64_t getEnumTagSinglePayload for MLPreviewEnvironment.PreviewScreenMode(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFF)
    goto LABEL_17;
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
    if (v4)
      return (*a1 | (v4 << 8)) - 1;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 1;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 1;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 2;
  v8 = v6 - 2;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for MLPreviewEnvironment.PreviewScreenMode(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_229315C6C + 4 * byte_229319905[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_229315CA0 + 4 * byte_229319900[v4]))();
}

uint64_t sub_229315CA0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_229315CA8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x229315CB0);
  return result;
}

uint64_t sub_229315CBC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x229315CC4);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_229315CC8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_229315CD0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_229315CDC(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for MLPreviewEnvironment.PreviewScreenMode()
{
  return &type metadata for MLPreviewEnvironment.PreviewScreenMode;
}

unint64_t sub_229315CFC()
{
  unint64_t result;

  result = qword_255A40A88;
  if (!qword_255A40A88)
  {
    result = MEMORY[0x22E2C7668](&unk_229319984, &type metadata for MLPreviewEnvironment.PreviewScreenMode);
    atomic_store(result, (unint64_t *)&qword_255A40A88);
  }
  return result;
}

uint64_t sub_229315D40()
{
  return MEMORY[0x24BDB9D70];
}

uint64_t sub_229315D4C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for MLPreviewEnvironment();
  result = sub_229318F34();
  *a1 = result;
  return result;
}

MLKit::MLPreviewType_optional ModelHeuristics.previewType.getter@<W0>(char *a1@<X8>)
{
  id *v1;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  Swift::String v7;
  MLKit::MLPreviewType_optional result;
  char v9;
  char v10;

  v3 = *v1;
  v4 = sub_229314CC0(v3);
  v6 = v5;

  v7._countAndFlagsBits = v4;
  v7._object = v6;
  result.value = MLPreviewType.init(rawValue:)(v7).value;
  v9 = v10;
  if (v10 == 19)
    v9 = 18;
  *a1 = v9;
  return result;
}

uint64_t sub_229315DF4()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for SomeClass()
{
  return objc_opt_self();
}

double ModelHeuristics.availabilityOfSpecification.getter@<D0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double result;

  v2 = *(_QWORD *)(v1 + 8) - 1;
  if (v2 >= 8)
  {
    result = 0.0;
    *(_OWORD *)a1 = xmmword_229319A00;
    *(_OWORD *)(a1 + 16) = 0u;
    *(_OWORD *)(a1 + 32) = 0u;
    *(_OWORD *)(a1 + 48) = 0u;
    *(_OWORD *)(a1 + 64) = 0u;
  }
  else
  {
    v3 = 8 * v2;
    v4 = *(_QWORD *)&a1013[v3];
    v5 = *(_QWORD *)((char *)&unk_229319B20 + v3);
    v6 = *(_QWORD *)&a110[v3];
    v7 = *(_QWORD *)&a40[v3];
    v8 = *(_QWORD *)((char *)&unk_229319BE0 + v3);
    *(_QWORD *)a1 = v4;
    *(_QWORD *)(a1 + 8) = v5;
    *(_QWORD *)(a1 + 16) = v6;
    *(_QWORD *)(a1 + 24) = 0xE400000000000000;
    *(_QWORD *)(a1 + 32) = v7;
    *(_QWORD *)(a1 + 40) = v8;
    *(_QWORD *)(a1 + 48) = v6;
    result = -4.94660803e173;
    *(_OWORD *)(a1 + 56) = xmmword_229319A10;
    *(_QWORD *)(a1 + 72) = 0xE300000000000000;
  }
  return result;
}

uint64_t ModelHeuristics.OSAvailability.components.getter()
{
  _QWORD *v0;
  uint64_t v1;

  v0 = ModelHeuristics.OSAvailability.pairs.getter();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v1 = sub_229316FF8((uint64_t)v0);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t ModelHeuristics.OSAvailability.init(macOS:iOS:watchOS:tvOS:visionOS:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, _QWORD *a9@<X8>, uint64_t a10, uint64_t a11)
{
  *a9 = result;
  a9[1] = a2;
  a9[2] = a3;
  a9[3] = a4;
  a9[4] = a5;
  a9[5] = a6;
  a9[6] = a7;
  a9[7] = a8;
  a9[8] = a10;
  a9[9] = a11;
  return result;
}

uint64_t ModelHeuristics.OSAvailability.macOS.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ModelHeuristics.OSAvailability.macOS.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*ModelHeuristics.OSAvailability.macOS.modify())()
{
  return nullsub_1;
}

uint64_t ModelHeuristics.OSAvailability.iOS.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ModelHeuristics.OSAvailability.iOS.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return result;
}

uint64_t (*ModelHeuristics.OSAvailability.iOS.modify())()
{
  return nullsub_1;
}

uint64_t ModelHeuristics.OSAvailability.watchOS.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ModelHeuristics.OSAvailability.watchOS.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 32) = a1;
  *(_QWORD *)(v2 + 40) = a2;
  return result;
}

uint64_t (*ModelHeuristics.OSAvailability.watchOS.modify())()
{
  return nullsub_1;
}

uint64_t ModelHeuristics.OSAvailability.tvOS.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 48);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ModelHeuristics.OSAvailability.tvOS.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 48) = a1;
  *(_QWORD *)(v2 + 56) = a2;
  return result;
}

uint64_t (*ModelHeuristics.OSAvailability.tvOS.modify())()
{
  return nullsub_1;
}

uint64_t ModelHeuristics.OSAvailability.visionOS.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 64);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ModelHeuristics.OSAvailability.visionOS.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 64) = a1;
  *(_QWORD *)(v2 + 72) = a2;
  return result;
}

uint64_t (*ModelHeuristics.OSAvailability.visionOS.modify())()
{
  return nullsub_1;
}

_QWORD *ModelHeuristics.OSAvailability.pairs.getter()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  unint64_t v8;
  unint64_t v9;
  _QWORD *v10;
  unint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  unint64_t v17;
  unint64_t v18;
  _QWORD *v19;
  unint64_t v20;
  unint64_t v21;
  _QWORD *v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v2 = *v0;
  v1 = v0[1];
  v4 = v0[2];
  v3 = v0[3];
  v6 = v0[4];
  v5 = v0[5];
  v24 = v0[6];
  v25 = v0[7];
  v26 = v0[8];
  v27 = v0[9];
  if (!v1)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v7 = (_QWORD *)MEMORY[0x24BEE4AF8];
    if (v3)
      goto LABEL_5;
LABEL_12:
    if (!v5)
      goto LABEL_18;
    goto LABEL_13;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v7 = sub_229316C88(0, 1, 1, MEMORY[0x24BEE4AF8]);
  v9 = v7[2];
  v8 = v7[3];
  if (v9 >= v8 >> 1)
    v7 = sub_229316C88((_QWORD *)(v8 > 1), v9 + 1, 1, v7);
  v7[2] = v9 + 1;
  v10 = &v7[4 * v9];
  v10[4] = 0x534F63616DLL;
  v10[5] = 0xE500000000000000;
  v10[6] = v2;
  v10[7] = v1;
  if (!v3)
    goto LABEL_12;
LABEL_5:
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v7 = sub_229316C88(0, v7[2] + 1, 1, v7);
  v12 = v7[2];
  v11 = v7[3];
  if (v12 >= v11 >> 1)
    v7 = sub_229316C88((_QWORD *)(v11 > 1), v12 + 1, 1, v7);
  v7[2] = v12 + 1;
  v13 = &v7[4 * v12];
  v13[4] = 5459817;
  v13[5] = 0xE300000000000000;
  v13[6] = v4;
  v13[7] = v3;
  if (v5)
  {
LABEL_13:
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v7 = sub_229316C88(0, v7[2] + 1, 1, v7);
    v15 = v7[2];
    v14 = v7[3];
    if (v15 >= v14 >> 1)
      v7 = sub_229316C88((_QWORD *)(v14 > 1), v15 + 1, 1, v7);
    v7[2] = v15 + 1;
    v16 = &v7[4 * v15];
    v16[4] = 0x534F6863746177;
    v16[5] = 0xE700000000000000;
    v16[6] = v6;
    v16[7] = v5;
  }
LABEL_18:
  if (v25)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v7 = sub_229316C88(0, v7[2] + 1, 1, v7);
    v18 = v7[2];
    v17 = v7[3];
    if (v18 >= v17 >> 1)
      v7 = sub_229316C88((_QWORD *)(v17 > 1), v18 + 1, 1, v7);
    v7[2] = v18 + 1;
    v19 = &v7[4 * v18];
    v19[4] = 1397716596;
    v19[5] = 0xE400000000000000;
    v19[6] = v24;
    v19[7] = v25;
  }
  if (v27)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v7 = sub_229316C88(0, v7[2] + 1, 1, v7);
    v21 = v7[2];
    v20 = v7[3];
    if (v21 >= v20 >> 1)
      v7 = sub_229316C88((_QWORD *)(v20 > 1), v21 + 1, 1, v7);
    v7[2] = v21 + 1;
    v22 = &v7[4 * v21];
    v22[4] = 0x534F6E6F69736976;
    v22[5] = 0xE800000000000000;
    v22[6] = v26;
    v22[7] = v27;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A40B38);
  swift_arrayDestroy();
  return v7;
}

uint64_t ModelHeuristics.OSAvailability.description.getter()
{
  _QWORD *v0;
  uint64_t v1;

  v0 = ModelHeuristics.OSAvailability.pairs.getter();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_229316FF8((uint64_t)v0);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A40B40);
  sub_22931712C();
  v1 = sub_229318F58();
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t ModelHeuristics.OSAvailability.hash(into:)()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = v0[3];
  v2 = v0[5];
  v3 = v0[7];
  v4 = v0[9];
  if (v0[1])
  {
    sub_2293190E4();
    swift_bridgeObjectRetain();
    sub_229318F94();
    swift_bridgeObjectRelease();
    if (v1)
      goto LABEL_3;
  }
  else
  {
    sub_2293190E4();
    if (v1)
    {
LABEL_3:
      sub_2293190E4();
      swift_bridgeObjectRetain();
      sub_229318F94();
      swift_bridgeObjectRelease();
      if (v2)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  sub_2293190E4();
  if (v2)
  {
LABEL_4:
    sub_2293190E4();
    swift_bridgeObjectRetain();
    sub_229318F94();
    swift_bridgeObjectRelease();
    if (v3)
      goto LABEL_5;
LABEL_10:
    sub_2293190E4();
    if (v4)
      goto LABEL_6;
    return sub_2293190E4();
  }
LABEL_9:
  sub_2293190E4();
  if (!v3)
    goto LABEL_10;
LABEL_5:
  sub_2293190E4();
  swift_bridgeObjectRetain();
  sub_229318F94();
  swift_bridgeObjectRelease();
  if (v4)
  {
LABEL_6:
    sub_2293190E4();
    swift_bridgeObjectRetain();
    sub_229318F94();
    return swift_bridgeObjectRelease();
  }
  return sub_2293190E4();
}

uint64_t ModelHeuristics.OSAvailability.hashValue.getter()
{
  sub_2293190CC();
  ModelHeuristics.OSAvailability.hash(into:)();
  return sub_2293190F0();
}

uint64_t sub_229316960()
{
  sub_2293190CC();
  ModelHeuristics.OSAvailability.hash(into:)();
  return sub_2293190F0();
}

uint64_t sub_2293169BC()
{
  sub_2293190CC();
  ModelHeuristics.OSAvailability.hash(into:)();
  return sub_2293190F0();
}

uint64_t sub_229316A10()
{
  _QWORD *v0;
  uint64_t v1;

  v0 = ModelHeuristics.OSAvailability.pairs.getter();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_229316FF8((uint64_t)v0);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A40B40);
  sub_22931712C();
  v1 = sub_229318F58();
  swift_bridgeObjectRelease();
  return v1;
}

char *sub_229316B6C(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_229316B88(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

char *sub_229316B88(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_255A40B58);
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
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

_QWORD *sub_229316C88(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;

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
    __swift_instantiateConcreteTypeFromMangledName(&qword_255A40B60);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 1;
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 5);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v10 + 4 >= &a4[4 * v8 + 4])
      memmove(v10 + 4, a4 + 4, 32 * v8);
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_255A40B68);
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t _s5MLKit15ModelHeuristicsV14OSAvailabilityV2eeoiySbAE_AEtFZ_0(_QWORD *a1, _QWORD *a2)
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
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  char v29;
  uint64_t result;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  char v41;
  uint64_t v42;
  char v43;
  char v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;

  v3 = a1[1];
  v4 = a1[2];
  v6 = a1[3];
  v5 = a1[4];
  v7 = a1[5];
  v8 = a1[6];
  v10 = a1[7];
  v9 = a1[8];
  v11 = a1[9];
  v12 = a2[1];
  v13 = a2[2];
  v15 = a2[3];
  v14 = a2[4];
  v17 = a2[5];
  v16 = a2[6];
  v18 = a2[7];
  v19 = a2[8];
  v20 = a2[9];
  if (!v3)
  {
    if (v12)
      return 0;
    goto LABEL_8;
  }
  if (!v12)
    return 0;
  if (*a1 == *a2 && v3 == v12)
    goto LABEL_8;
  v49 = a1[7];
  v51 = a2[7];
  v47 = a2[8];
  v48 = a1[6];
  v45 = a1[9];
  v46 = a2[9];
  v21 = a1[8];
  v22 = a2[6];
  v23 = a1[4];
  v24 = a1[5];
  v25 = a2[5];
  v26 = a2[4];
  v27 = a2[2];
  v28 = sub_229319084();
  v13 = v27;
  v14 = v26;
  v17 = v25;
  v7 = v24;
  v5 = v23;
  v16 = v22;
  v9 = v21;
  v11 = v45;
  v20 = v46;
  v19 = v47;
  v8 = v48;
  v10 = v49;
  v18 = v51;
  v29 = v28;
  result = 0;
  if ((v29 & 1) != 0)
  {
LABEL_8:
    if (v6)
    {
      if (!v15)
        return 0;
      if (v4 != v13 || v6 != v15)
      {
        v50 = v9;
        v52 = v17;
        v31 = v16;
        v32 = v5;
        v33 = v7;
        v34 = v14;
        v35 = sub_229319084();
        v14 = v34;
        v9 = v50;
        v17 = v52;
        v7 = v33;
        v5 = v32;
        v16 = v31;
        v36 = v35;
        result = 0;
        if ((v36 & 1) == 0)
          return result;
      }
    }
    else if (v15)
    {
      return 0;
    }
    if (v7)
    {
      if (!v17)
        return 0;
      if (v5 != v14 || v7 != v17)
      {
        v37 = v18;
        v38 = v9;
        v39 = v16;
        v40 = sub_229319084();
        v16 = v39;
        v9 = v38;
        v18 = v37;
        v41 = v40;
        result = 0;
        if ((v41 & 1) == 0)
          return result;
      }
    }
    else if (v17)
    {
      return 0;
    }
    if (v10)
    {
      if (!v18)
        return 0;
      if (v8 != v16 || v10 != v18)
      {
        v42 = v9;
        v43 = sub_229319084();
        v9 = v42;
        v44 = v43;
        result = 0;
        if ((v44 & 1) == 0)
          return result;
      }
    }
    else if (v18)
    {
      return 0;
    }
    if (v11)
    {
      if (v20 && (v9 == v19 && v11 == v20 || (sub_229319084() & 1) != 0))
        return 1;
    }
    else if (!v20)
    {
      return 1;
    }
    return 0;
  }
  return result;
}

uint64_t sub_229316FF8(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x24BEE4AF8];
  if (v1)
  {
    v11 = MEMORY[0x24BEE4AF8];
    sub_229316B6C(0, v1, 0);
    v2 = v11;
    v4 = a1 + 56;
    do
    {
      v9 = *(_QWORD *)(v4 - 24);
      v10 = *(_QWORD *)(v4 - 16);
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      sub_229318FA0();
      sub_229318FA0();
      sub_229318FA0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v6 = *(_QWORD *)(v11 + 16);
      v5 = *(_QWORD *)(v11 + 24);
      if (v6 >= v5 >> 1)
        sub_229316B6C((char *)(v5 > 1), v6 + 1, 1);
      v4 += 32;
      *(_QWORD *)(v11 + 16) = v6 + 1;
      v7 = v11 + 16 * v6;
      *(_QWORD *)(v7 + 32) = v9;
      *(_QWORD *)(v7 + 40) = v10;
      --v1;
    }
    while (v1);
  }
  return v2;
}

unint64_t sub_22931712C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255A40B48;
  if (!qword_255A40B48)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255A40B40);
    result = MEMORY[0x22E2C7668](MEMORY[0x24BEE12B0], v1);
    atomic_store(result, (unint64_t *)&qword_255A40B48);
  }
  return result;
}

unint64_t sub_22931717C()
{
  unint64_t result;

  result = qword_255A40B50;
  if (!qword_255A40B50)
  {
    result = MEMORY[0x22E2C7668](&protocol conformance descriptor for ModelHeuristics.OSAvailability, &type metadata for ModelHeuristics.OSAvailability);
    atomic_store(result, (unint64_t *)&qword_255A40B50);
  }
  return result;
}

uint64_t _s14OSAvailabilityVwCP(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t _s14OSAvailabilityVwxx()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *_s14OSAvailabilityVwcp(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  v6 = a2[7];
  a1[6] = a2[6];
  a1[7] = v6;
  v7 = a2[9];
  a1[8] = a2[8];
  a1[9] = v7;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *_s14OSAvailabilityVwca(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[8] = a2[8];
  a1[9] = a2[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy80_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  result = *(__n128 *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(__n128 *)(a1 + 16) = result;
  *(_OWORD *)(a1 + 32) = v3;
  return result;
}

_QWORD *_s14OSAvailabilityVwta(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  swift_bridgeObjectRelease();
  v7 = a2[7];
  a1[6] = a2[6];
  a1[7] = v7;
  swift_bridgeObjectRelease();
  v8 = a2[9];
  a1[8] = a2[8];
  a1[9] = v8;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s14OSAvailabilityVwet(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 80))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t _s14OSAvailabilityVwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 80) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 80) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for ModelHeuristics.OSAvailability()
{
  return &type metadata for ModelHeuristics.OSAvailability;
}

uint64_t storeEnumTagSinglePayload for FileErrors(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_229317528 + 4 * byte_229319C25[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_22931755C + 4 * byte_229319C20[v4]))();
}

uint64_t sub_22931755C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_229317564(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x22931756CLL);
  return result;
}

uint64_t sub_229317578(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x229317580);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_229317584(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22931758C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for FileErrors()
{
  return &type metadata for FileErrors;
}

unint64_t sub_2293175AC()
{
  unint64_t result;

  result = qword_255A40B70;
  if (!qword_255A40B70)
  {
    result = MEMORY[0x22E2C7668](&unk_229319C78, &type metadata for FileErrors);
    atomic_store(result, (unint64_t *)&qword_255A40B70);
  }
  return result;
}

uint64_t ModelHeuristics.init(model:version:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  *a3 = result;
  a3[1] = a2;
  return result;
}

uint64_t ModelHeuristics.specificationVersion.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 8);
}

_QWORD *initializeBufferWithCopyOfBuffer for ModelHeuristics(_QWORD *a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v3 = *(void **)a2;
  v4 = *(_QWORD *)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v4;
  v5 = v3;
  return a1;
}

uint64_t assignWithCopy for ModelHeuristics(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t assignWithTake for ModelHeuristics(uint64_t a1, _QWORD *a2)
{
  void *v4;

  v4 = *(void **)a1;
  *(_QWORD *)a1 = *a2;

  *(_QWORD *)(a1 + 8) = a2[1];
  return a1;
}

uint64_t getEnumTagSinglePayload for ModelHeuristics(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 16))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ModelHeuristics(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for ModelHeuristics()
{
  return &type metadata for ModelHeuristics;
}

uint64_t static DiskSize.formattedSize(of:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  unint64_t v9;
  char v10;
  char v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v17;

  v2 = 3157552;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A40B78);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((sub_229317BB8() & 1) != 0)
  {
    v6 = sub_229318F28();
    v7 = *(_QWORD *)(v6 - 8);
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v5, a1, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v5, 0, 1, v6);
    v9 = sub_229318684((uint64_t)v5);
    v11 = v10;
    sub_229318E8C((uint64_t)v5, &qword_255A40B78);
    if ((v11 & 1) != 0)
      return v2;
  }
  else
  {
    v9 = sub_229318AF4();
    if ((v8 & 1) != 0)
      return v2;
  }
  if ((uint64_t)v9 >= 1)
  {
    v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1490]), sel_init);
    objc_msgSend(v12, sel_setCountStyle_, 0);
    if (v9 > 0x3FE)
    {
      if (v9 >> 10 > 0x3FE)
      {
        if ((float)((float)(v9 >> 10) * 0.00097656) >= 1023.0)
          objc_msgSend(v12, sel_setAllowedUnits_, 8);
        else
          objc_msgSend(v12, sel_setAllowedUnits_, 4);
        v14 = objc_msgSend(v12, sel_stringFromByteCount_, v9);
      }
      else
      {
        objc_msgSend(v12, sel_setAllowedUnits_, 2);
        v14 = objc_msgSend(v12, sel_stringFromByteCount_, v9);
      }
      v15 = v14;
      v2 = sub_229318F88();

    }
    else
    {
      objc_msgSend(v12, sel_setAllowedUnits_, 1);
      v13 = objc_msgSend(v12, sel_stringFromByteCount_, v9);
      v2 = sub_229318F88();

    }
  }
  return v2;
}

uint64_t sub_2293179E4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;
  int v5;
  char v6;
  id v7;
  id v8;
  id v9;
  _BYTE v10[32];

  result = sub_229318350(a1);
  if ((v6 & 1) != 0)
    goto LABEL_8;
  if (*(_DWORD *)(a1 + 36) != v5)
  {
    __break(1u);
LABEL_8:
    __break(1u);
    return result;
  }
  if (result == 1 << *(_BYTE *)(a1 + 32))
  {
    *(_QWORD *)(a2 + 32) = 0;
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
  }
  else
  {
    v7 = sub_2293183D8(v10, result, v5, 0, a1);
    v9 = v7;
    *(_QWORD *)a2 = v7;
    sub_229318CFC((uint64_t)v10, a2 + 8);
    v8 = v7;
    return sub_229318E8C((uint64_t)&v9, &qword_255A40B90);
  }
  return result;
}

uint64_t static DiskSize.sizeInBytes(of:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A40B78);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((sub_229317BB8() & 1) == 0)
    return sub_229318AF4();
  v5 = sub_229318F28();
  v6 = *(_QWORD *)(v5 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v4, a1, v5);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v6 + 56))(v4, 0, 1, v5);
  v7 = sub_229318684((uint64_t)v4);
  sub_229318E8C((uint64_t)v4, &qword_255A40B78);
  return v7;
}

uint64_t sub_229317BB8()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  char *v4;
  uint64_t inited;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  char v11;
  uint64_t v12;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255A40BB8);
  v0 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v2 = (char *)&v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v0);
  v4 = (char *)&v12 - v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A40B80);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_229319D00;
  v6 = (void *)*MEMORY[0x24BDBCC60];
  *(_QWORD *)(inited + 32) = *MEMORY[0x24BDBCC60];
  v7 = v6;
  sub_229318458(inited);
  swift_setDeallocating();
  type metadata accessor for URLResourceKey(0);
  swift_arrayDestroy();
  sub_229318F10();
  swift_bridgeObjectRelease();
  v8 = sub_229318EE0();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v4, 0, 1, v8);
  sub_229318E48((uint64_t)v4, (uint64_t)v2, &qword_255A40BB8);
  sub_229318EE0();
  v9 = *(_QWORD *)(v8 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v2, 1, v8) == 1)
  {
    sub_229318E8C((uint64_t)v4, &qword_255A40BB8);
    sub_229318E8C((uint64_t)v2, &qword_255A40BB8);
    return 0;
  }
  else
  {
    v11 = sub_229318ED4();
    sub_229318E8C((uint64_t)v4, &qword_255A40BB8);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v2, v8);
    return v11 & 1;
  }
}

uint64_t static DiskSize.folderSizeInBytes(of:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  uint64_t v3;

  result = sub_229318684(a1);
  if (v1)
    return v3;
  return result;
}

uint64_t static DiskSize.fileSizeInBytes(of:)()
{
  return sub_229318AF4();
}

uint64_t static DiskSize.fileSizeInGB(url:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t inited;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  id v10;
  __int128 v11;
  _OWORD v12[2];
  __int128 v13;

  v0 = sub_229318EE0();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A40B80);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_229319D00;
  v5 = (void *)*MEMORY[0x24BDBCC48];
  *(_QWORD *)(inited + 32) = *MEMORY[0x24BDBCC48];
  v6 = v5;
  sub_229318458(inited);
  swift_setDeallocating();
  type metadata accessor for URLResourceKey(0);
  swift_arrayDestroy();
  sub_229318F10();
  swift_bridgeObjectRelease();
  v7 = sub_229318EC8();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_2293179E4(v7, (uint64_t)&v10);
  swift_bridgeObjectRelease();
  if (v10)
  {

    sub_229318CDC(&v11, v12);
    sub_229318CDC(v12, &v13);
    return swift_dynamicCast();
  }
  else
  {
    result = sub_229318E8C((uint64_t)&v10, &qword_255A40B88);
    __break(1u);
  }
  return result;
}

uint64_t static DiskSize.fileSizeInMB(url:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t inited;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  id v10;
  __int128 v11;
  _OWORD v12[2];
  __int128 v13;

  v0 = sub_229318EE0();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A40B80);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_229319D00;
  v5 = (void *)*MEMORY[0x24BDBCC48];
  *(_QWORD *)(inited + 32) = *MEMORY[0x24BDBCC48];
  v6 = v5;
  sub_229318458(inited);
  swift_setDeallocating();
  type metadata accessor for URLResourceKey(0);
  swift_arrayDestroy();
  sub_229318F10();
  swift_bridgeObjectRelease();
  v7 = sub_229318EC8();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  sub_2293179E4(v7, (uint64_t)&v10);
  swift_bridgeObjectRelease();
  if (v10)
  {

    sub_229318CDC(&v11, v12);
    sub_229318CDC(v12, &v13);
    return swift_dynamicCast();
  }
  else
  {
    result = sub_229318E8C((uint64_t)&v10, &qword_255A40B88);
    __break(1u);
  }
  return result;
}

unint64_t sub_22931815C(uint64_t a1)
{
  uint64_t v2;

  sub_229318F88();
  sub_2293190CC();
  sub_229318F94();
  v2 = sub_2293190F0();
  swift_bridgeObjectRelease();
  return sub_2293181DC(a1, v2);
}

unint64_t sub_2293181DC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v18;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  v5 = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
  {
    v6 = sub_229318F88();
    v8 = v7;
    if (v6 == sub_229318F88() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    v11 = sub_229319084();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      v12 = ~v4;
      v5 = (v5 + 1) & v12;
      if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
      {
        while (1)
        {
          v13 = sub_229318F88();
          v15 = v14;
          if (v13 == sub_229318F88() && v15 == v16)
            break;
          v18 = sub_229319084();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            v5 = (v5 + 1) & v12;
            if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
              continue;
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

uint64_t sub_229318350(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;
  unsigned int v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;

  v1 = *(_QWORD *)(a1 + 64);
  if (v1)
  {
    v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  v5 = *(_BYTE *)(a1 + 32);
  v6 = v5 & 0x3F;
  v3 = 1 << v5;
  if (v6 < 7)
    return v3;
  v1 = *(_QWORD *)(a1 + 72);
  if (v1)
  {
    v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2)
    v7 = 2;
  v8 = v7 - 2;
  v9 = (unint64_t *)(a1 + 80);
  v2 = 64;
  while (v8)
  {
    v10 = *v9++;
    v1 = v10;
    --v8;
    v2 += 64;
    if (v10)
      return __clz(__rbit64(v1)) + v2;
  }
  return v3;
}

id sub_2293183D8(id result, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  id v5;

  if (a2 < 0 || 1 << *(_BYTE *)(a5 + 32) <= a2)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (((*(_QWORD *)(a5 + (((unint64_t)a2 >> 3) & 0xFFFFFFFFFFFFF8) + 64) >> a2) & 1) == 0)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (*(_DWORD *)(a5 + 36) == a3)
  {
    v5 = *(id *)(*(_QWORD *)(a5 + 48) + 8 * a2);
    sub_229318CFC(*(_QWORD *)(a5 + 56) + 32 * a2, (uint64_t)result);
    return v5;
  }
LABEL_8:
  __break(1u);
  return result;
}

uint64_t sub_229318458(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v27;
  uint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_255A40B98);
    v3 = sub_22931900C();
    v4 = 0;
    v5 = v3 + 56;
    v31 = v1;
    v32 = a1 + 32;
    while (1)
    {
      v6 = *(void **)(v32 + 8 * v4);
      sub_229318F88();
      sub_2293190CC();
      v7 = v6;
      sub_229318F94();
      v8 = sub_2293190F0();
      result = swift_bridgeObjectRelease();
      v10 = -1 << *(_BYTE *)(v3 + 32);
      v11 = v8 & ~v10;
      v12 = v11 >> 6;
      v13 = *(_QWORD *)(v5 + 8 * (v11 >> 6));
      v14 = 1 << v11;
      if (((1 << v11) & v13) != 0)
      {
        v15 = sub_229318F88();
        v17 = v16;
        if (v15 == sub_229318F88() && v17 == v18)
        {
LABEL_3:
          swift_bridgeObjectRelease_n();
LABEL_4:

          goto LABEL_5;
        }
        v20 = sub_229319084();
        swift_bridgeObjectRelease();
        result = swift_bridgeObjectRelease();
        if ((v20 & 1) != 0)
          goto LABEL_4;
        v21 = ~v10;
        while (1)
        {
          v11 = (v11 + 1) & v21;
          v12 = v11 >> 6;
          v13 = *(_QWORD *)(v5 + 8 * (v11 >> 6));
          v14 = 1 << v11;
          if ((v13 & (1 << v11)) == 0)
            break;
          v22 = sub_229318F88();
          v24 = v23;
          if (v22 == sub_229318F88() && v24 == v25)
            goto LABEL_3;
          v27 = sub_229319084();
          swift_bridgeObjectRelease();
          result = swift_bridgeObjectRelease();
          if ((v27 & 1) != 0)
            goto LABEL_4;
        }
      }
      *(_QWORD *)(v5 + 8 * v12) = v14 | v13;
      *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v11) = v7;
      v28 = *(_QWORD *)(v3 + 16);
      v29 = __OFADD__(v28, 1);
      v30 = v28 + 1;
      if (v29)
      {
        __break(1u);
        return result;
      }
      *(_QWORD *)(v3 + 16) = v30;
LABEL_5:
      if (++v4 == v31)
        return v3;
    }
  }
  return MEMORY[0x24BEE4B08];
}

uint64_t sub_229318684(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int v12;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  unsigned int v20;
  uint64_t v21;
  id v22;
  void *v23;
  BOOL v24;
  _BYTE *v25;
  _BYTE *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  _OWORD v36[2];
  __int128 v37;
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v2 = sub_229318F04();
  v33 = *(_QWORD *)(v2 - 8);
  v34 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A40B78);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_229318F28();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_229318E48(a1, (uint64_t)v7, &qword_255A40B78);
  v12 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8);
  if (v12 == 1)
  {
    sub_229318E8C((uint64_t)v7, &qword_255A40B78);
    return 0;
  }
  v32 = v12;
  (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v11, v7, v8);
  v14 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255A40B80);
  v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_229319D00;
  v16 = (void *)*MEMORY[0x24BDBCC48];
  *(_QWORD *)(v15 + 32) = *MEMORY[0x24BDBCC48];
  v17 = v16;
  v18 = (void *)sub_229318FE8();

  swift_bridgeObjectRelease();
  if (!v18)
  {
LABEL_17:
    sub_229318D38();
    swift_allocError();
    *v25 = 0;
    swift_willThrow();
    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  v30 = v18;
  v31 = v8;
  sub_229318FDC();
  sub_229318EF8();
  if (v38)
  {
    v29 = 0;
    while (1)
    {
      sub_229318CDC(&v37, v36);
      sub_229318D7C();
      if (!swift_dynamicCast())
      {
        sub_229318D38();
        swift_allocError();
        *v26 = 1;
        swift_willThrow();

        (*(void (**)(char *, uint64_t))(v33 + 8))(v4, v34);
        return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v31);
      }
      v8 = (uint64_t)v11;
      v19 = v35;
      v35 = 0;
      *(_QWORD *)&v36[0] = 0;
      v20 = objc_msgSend(v19, sel_getResourceValue_forKey_error_, v36, v17, &v35);
      v21 = *(_QWORD *)&v36[0];
      v22 = v35;
      if (!v20)
      {
        v27 = v22;
        swift_unknownObjectRetain();
        sub_229318EEC();

        swift_willThrow();
        (*(void (**)(char *, uint64_t))(v33 + 8))(v4, v34);
        (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v31);
        return swift_unknownObjectRelease();
      }
      if (!v21)
        goto LABEL_11;
      swift_unknownObjectRetain_n();
      objc_opt_self();
      v23 = (void *)swift_dynamicCastObjCClass();
      if (!v23)
        break;
      v11 = (char *)objc_msgSend(v23, sel_longLongValue);

      swift_unknownObjectRelease_n();
      v24 = __OFADD__(v29, v11);
      v29 += (uint64_t)v11;
      if (v24)
      {
        __break(1u);
        goto LABEL_17;
      }
LABEL_12:
      sub_229318EF8();
      v11 = (char *)v8;
      if (!v38)
        goto LABEL_19;
    }
    swift_unknownObjectRelease_n();
LABEL_11:

    goto LABEL_12;
  }
  v29 = 0;
LABEL_19:

  (*(void (**)(char *, uint64_t))(v33 + 8))(v4, v34);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v31);
  return v29;
}

uint64_t sub_229318AF4()
{
  id v0;
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  id v5;
  id v6;
  unint64_t v7;
  char v8;
  id v9;
  void *v10;
  uint64_t v12;
  _BYTE v13[24];
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v0 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  sub_229318F1C();
  v1 = (void *)sub_229318F64();
  swift_bridgeObjectRelease();
  *(_QWORD *)&v15 = 0;
  v2 = objc_msgSend(v0, sel_attributesOfItemAtPath_error_, v1, &v15);

  v3 = (void *)v15;
  if (v2)
  {
    type metadata accessor for FileAttributeKey(0);
    sub_229318E00();
    v4 = sub_229318F4C();
    v5 = v3;

    if (*(_QWORD *)(v4 + 16))
    {
      v6 = (id)*MEMORY[0x24BDD0D08];
      v7 = sub_22931815C((uint64_t)v6);
      if ((v8 & 1) != 0)
      {
        sub_229318CFC(*(_QWORD *)(v4 + 56) + 32 * v7, (uint64_t)&v15);
      }
      else
      {
        v15 = 0u;
        v16 = 0u;
      }

    }
    else
    {
      v15 = 0u;
      v16 = 0u;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = (id)v15;
    v10 = (void *)sub_229318EEC();

    swift_willThrow();
    v15 = 0u;
    v16 = 0u;
  }
  sub_229318DB8((uint64_t)&v15, (uint64_t)v13);
  if (v14)
  {
    if (swift_dynamicCast())
      return v12;
  }
  else
  {
    sub_229318E8C((uint64_t)v13, &qword_255A40BB0);
  }
  return 0;
}

_OWORD *sub_229318CDC(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

ValueMetadata *type metadata accessor for DiskSize()
{
  return &type metadata for DiskSize;
}

uint64_t sub_229318CFC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_229318D38()
{
  unint64_t result;

  result = qword_255A40BA0;
  if (!qword_255A40BA0)
  {
    result = MEMORY[0x22E2C7668](&unk_229319CA0, &type metadata for FileErrors);
    atomic_store(result, (unint64_t *)&qword_255A40BA0);
  }
  return result;
}

unint64_t sub_229318D7C()
{
  unint64_t result;

  result = qword_255A40BA8;
  if (!qword_255A40BA8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_255A40BA8);
  }
  return result;
}

uint64_t sub_229318DB8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A40BB0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_229318E00()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255A408B0;
  if (!qword_255A408B0)
  {
    type metadata accessor for FileAttributeKey(255);
    result = MEMORY[0x22E2C7668](&unk_2293196D0, v1);
    atomic_store(result, (unint64_t *)&qword_255A408B0);
  }
  return result;
}

uint64_t sub_229318E48(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_229318E8C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_229318EC8()
{
  return MEMORY[0x24BDCC6F8]();
}

uint64_t sub_229318ED4()
{
  return MEMORY[0x24BDCC710]();
}

uint64_t sub_229318EE0()
{
  return MEMORY[0x24BDCC818]();
}

uint64_t sub_229318EEC()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_229318EF8()
{
  return MEMORY[0x24BDCD508]();
}

uint64_t sub_229318F04()
{
  return MEMORY[0x24BDCD520]();
}

uint64_t sub_229318F10()
{
  return MEMORY[0x24BDCD848]();
}

uint64_t sub_229318F1C()
{
  return MEMORY[0x24BDCD9F8]();
}

uint64_t sub_229318F28()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_229318F34()
{
  return MEMORY[0x24BDB9C48]();
}

uint64_t sub_229318F40()
{
  return MEMORY[0x24BDB9EF0]();
}

uint64_t sub_229318F4C()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_229318F58()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_229318F64()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_229318F70()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_229318F7C()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_229318F88()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_229318F94()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_229318FA0()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_229318FAC()
{
  return MEMORY[0x24BEE1000]();
}

uint64_t sub_229318FB8()
{
  return MEMORY[0x24BEE1080]();
}

uint64_t sub_229318FC4()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_229318FD0()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_229318FDC()
{
  return MEMORY[0x24BDCFE18]();
}

uint64_t sub_229318FE8()
{
  return MEMORY[0x24BDCFF40]();
}

uint64_t sub_229318FF4()
{
  return MEMORY[0x24BDD01F8]();
}

uint64_t sub_229319000()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_22931900C()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_229319018()
{
  return MEMORY[0x24BEE2648]();
}

uint64_t sub_229319024()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_229319030()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_22931903C()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_229319048()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_229319054()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_229319060()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_22931906C()
{
  return MEMORY[0x24BEE3070]();
}

uint64_t sub_229319078()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_229319084()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_229319090()
{
  return MEMORY[0x24BEE3D50]();
}

uint64_t sub_22931909C()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_2293190A8()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_2293190B4()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_2293190C0()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_2293190CC()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_2293190D8()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_2293190E4()
{
  return MEMORY[0x24BEE4300]();
}

uint64_t sub_2293190F0()
{
  return MEMORY[0x24BEE4328]();
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

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x24BEE4C60]();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return MEMORY[0x24BEE4C68]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
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

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x24BEE4F30]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

