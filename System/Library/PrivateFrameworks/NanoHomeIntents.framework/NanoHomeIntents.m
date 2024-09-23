uint64_t NHOLogForCategory(uint64_t a1)
{
  if (NHOLogForCategory_onceToken[0] != -1)
    dispatch_once(NHOLogForCategory_onceToken, &__block_literal_global);
  return objc_msgSend((id)NHOLogForCategory_Logging, "logForCategory:", a1);
}

uint64_t NHOSmartStackLastAction.homeID.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t NHOSmartStackLastAction.homeID.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*NHOSmartStackLastAction.homeID.modify())()
{
  return nullsub_1;
}

void NHOSmartStackLastAction.action.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 16);
}

_BYTE *NHOSmartStackLastAction.action.setter(_BYTE *result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 16) = *result;
  return result;
}

uint64_t (*NHOSmartStackLastAction.action.modify())()
{
  return nullsub_1;
}

uint64_t NHOSmartStackLastAction.actionID.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t NHOSmartStackLastAction.actionID.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 24) = a1;
  *(_QWORD *)(v2 + 32) = a2;
  return result;
}

uint64_t (*NHOSmartStackLastAction.actionID.modify())()
{
  return nullsub_1;
}

uint64_t NHOSmartStackLastAction.date.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for NHOSmartStackLastAction() + 28);
  v4 = sub_2429638A8();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t type metadata accessor for NHOSmartStackLastAction()
{
  uint64_t result;

  result = qword_257207818;
  if (!qword_257207818)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t NHOSmartStackLastAction.date.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for NHOSmartStackLastAction() + 28);
  v4 = sub_2429638A8();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(v3, a1, v4);
}

uint64_t (*NHOSmartStackLastAction.date.modify())()
{
  type metadata accessor for NHOSmartStackLastAction();
  return nullsub_1;
}

double static NHOSmartStackLastAction.actionLifeSpan.getter()
{
  return 180.0;
}

Swift::Void __swiftcall NHOSmartStackLastAction.save()()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  char isUniquelyReferenced_nonNull_native;

  sub_242963884();
  MEMORY[0x24BDAC7A8]();
  v1 = *v0;
  v2 = v0[1];
  swift_bridgeObjectRetain();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_242945178(v1, v2, 0x4449656D6F68, 0xE600000000000000, isUniquelyReferenced_nonNull_native);
  swift_bridgeObjectRelease();
  __asm { BR              X10 }
}

void sub_2429436DC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  id v17;
  void *v18;
  void *v19;

  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)(v6 - 72) = v1;
  sub_242945178(0x65536E6F69746361, v5 + 1, 0x6E6F69746361, 0xE600000000000000, isUniquelyReferenced_nonNull_native);
  v8 = *(_QWORD *)(v6 - 72);
  swift_bridgeObjectRelease();
  v9 = *(_QWORD *)(v2 + 24);
  v10 = *(_QWORD *)(v2 + 32);
  swift_bridgeObjectRetain();
  v11 = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)(v6 - 72) = v8;
  sub_242945178(v9, v10, 0x44496E6F69746361, 0xE800000000000000, v11);
  v12 = *(_QWORD *)(v6 - 72);
  swift_bridgeObjectRelease();
  type metadata accessor for NHOSmartStackLastAction();
  sub_2429438CC(v3);
  v13 = sub_242963830();
  v15 = v14;
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v0);
  v16 = swift_isUniquelyReferenced_nonNull_native();
  *(_QWORD *)(v6 - 72) = v12;
  sub_242945178(v13, v15, 1702125924, 0xE400000000000000, v16);
  swift_bridgeObjectRelease();
  v17 = sub_2429459B0();
  v18 = (void *)sub_242963A40();
  swift_bridgeObjectRelease();
  v19 = (void *)sub_242963A7C();
  objc_msgSend(v17, sel_setValue_forKey_, v18, v19);

}

uint64_t sub_2429438CC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  char *v2;
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
  uint64_t v18;
  void (*v19)(char *, _QWORD, uint64_t);
  uint64_t v20;
  uint64_t result;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v24 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257207870);
  MEMORY[0x24BDAC7A8]();
  v2 = (char *)&v22 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = sub_242963938();
  v25 = *(_QWORD *)(v27 - 8);
  MEMORY[0x24BDAC7A8]();
  v23 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = sub_242963878();
  v4 = *(_QWORD *)(v26 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_242963860();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8]();
  v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_242963848();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8]();
  v14 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_242963854();
  MEMORY[0x24BDAC7A8]();
  (*(void (**)(char *, _QWORD))(v16 + 104))((char *)&v22 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0), *MEMORY[0x24BDCE368]);
  v17 = v11;
  v18 = v25;
  (*(void (**)(char *, _QWORD, uint64_t))(v12 + 104))(v14, *MEMORY[0x24BDCE348], v17);
  v19 = *(void (**)(char *, _QWORD, uint64_t))(v8 + 104);
  v20 = v27;
  v19(v10, *MEMORY[0x24BDCE388], v7);
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v6, *MEMORY[0x24BDCE3D0], v26);
  sub_24296392C();
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v18 + 48))(v2, 1, v20);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v23, v2, v20);
    return sub_24296386C();
  }
  return result;
}

uint64_t static NHOSmartStackLastAction.getLastAction()@<X0>(uint64_t a1@<X8>)
{
  uint64_t Action;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  unint64_t v17;
  char v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  uint64_t *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  Swift::String v35;
  int v36;
  unint64_t v37;
  char v38;
  uint64_t *v39;
  uint64_t v40;
  id v41;
  id v42;
  unint64_t v43;
  char v44;
  uint64_t v45;
  NSObject *v46;
  os_log_type_t v47;
  uint8_t *v48;
  uint64_t v49;
  void *v50;
  void *v52;
  id v53;
  void (*v54)(char *, char *, uint64_t);
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  double v58;
  double v59;
  void (*v60)(char *, uint64_t);
  uint64_t v61;
  NSObject *v62;
  os_log_type_t v63;
  uint8_t *v64;
  uint64_t v65;
  uint8_t *v66;
  uint64_t v67;
  NSObject *v68;
  os_log_type_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  int v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  _OWORD v86[2];
  uint64_t v87[5];

  Action = type metadata accessor for NHOSmartStackLastAction();
  v83 = *(_QWORD *)(Action - 8);
  v84 = Action;
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v82 = (uint64_t)&v74 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572077A8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v5 = (char *)&v74 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_2429638A8();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v10 = (char *)&v74 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v74 - v11;
  v13 = sub_2429459B0();
  v14 = (void *)sub_242963A7C();
  v15 = objc_msgSend(v13, sel_objectForKey_, v14);

  if (v15)
  {
    sub_242963C74();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v86, 0, sizeof(v86));
  }
  sub_242945B48((uint64_t)v86, (uint64_t)v87);
  if (!v87[3])
  {
    sub_242945BA8((uint64_t)v87, &qword_2572077B0);
    goto LABEL_12;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572077B8);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_12:
    if (qword_257207728 != -1)
      swift_once();
    v27 = sub_2429639D4();
    __swift_project_value_buffer(v27, (uint64_t)qword_257207B28);
    v28 = sub_2429639BC();
    v29 = sub_242963BFC();
    if (os_log_type_enabled(v28, v29))
    {
      v30 = (uint8_t *)swift_slowAlloc();
      v31 = swift_slowAlloc();
      v87[0] = v31;
      *(_DWORD *)v30 = 136315138;
      *(_QWORD *)&v86[0] = sub_24294461C(0x417473614C746567, 0xEF29286E6F697463, v87);
      sub_242963C5C();
      _os_log_impl(&dword_242941000, v28, v29, "%s no last action found to home smart stack", v30, 0xCu);
      v32 = 1;
      swift_arrayDestroy();
      MEMORY[0x2494E932C](v31, -1, -1);
      MEMORY[0x2494E932C](v30, -1, -1);

    }
    else
    {

      v32 = 1;
    }
    v33 = v84;
    goto LABEL_18;
  }
  v16 = v85;
  if (*(_QWORD *)(v85 + 16) && (v17 = sub_242944C5C(0x4449656D6F68, 0xE600000000000000), (v18 & 1) != 0))
  {
    v19 = (uint64_t *)(*(_QWORD *)(v16 + 56) + 16 * v17);
    v20 = v19[1];
    v79 = *v19;
    v80 = v20;
    v21 = *(_QWORD *)(v16 + 16);
    swift_bridgeObjectRetain();
    v81 = a1;
    if (v21 && (v22 = sub_242944C5C(0x6E6F69746361, 0xE600000000000000), (v23 & 1) != 0))
    {
      v24 = (uint64_t *)(*(_QWORD *)(v16 + 56) + 16 * v22);
      v26 = *v24;
      v25 = (void *)v24[1];
      swift_bridgeObjectRetain();
    }
    else
    {
      v26 = 0;
      v25 = (void *)0xE000000000000000;
    }
    v35._countAndFlagsBits = v26;
    v35._object = v25;
    NHOSmartStackAction.init(rawValue:)(v35);
    v36 = LOBYTE(v87[0]);
    if (LOBYTE(v87[0]) != 5
      && *(_QWORD *)(v16 + 16)
      && (v37 = sub_242944C5C(0x44496E6F69746361, 0xE800000000000000), (v38 & 1) != 0))
    {
      v76 = v36;
      v39 = (uint64_t *)(*(_QWORD *)(v16 + 56) + 16 * v37);
      v40 = v39[1];
      v75 = *v39;
      v41 = objc_allocWithZone(MEMORY[0x24BDD15D0]);
      v78 = v40;
      swift_bridgeObjectRetain();
      v42 = objc_msgSend(v41, sel_init);
      if (*(_QWORD *)(v16 + 16) && (v43 = sub_242944C5C(1702125924, 0xE400000000000000), (v44 & 1) != 0))
      {
        v77 = *(_QWORD *)(*(_QWORD *)(v16 + 56) + 16 * v43);
        swift_bridgeObjectRetain();
      }
      else
      {
        v77 = 0;
      }
      swift_bridgeObjectRelease();
      v52 = (void *)sub_242963A7C();
      swift_bridgeObjectRelease();
      v53 = objc_msgSend(v42, sel_dateFromString_, v52);

      if (v53)
      {
        sub_242963890();

        v54 = *(void (**)(char *, char *, uint64_t))(v7 + 32);
        v54(v5, v10, v6);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v5, 0, 1, v6);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) != 1)
        {
          v54(v12, v5, v6);
          v33 = v84;
          v55 = v82;
          (*(void (**)(uint64_t, char *, uint64_t))(v7 + 16))(v82 + *(int *)(v84 + 28), v12, v6);
          v56 = v80;
          *(_QWORD *)v55 = v79;
          *(_QWORD *)(v55 + 8) = v56;
          *(_BYTE *)(v55 + 16) = v76;
          v57 = v78;
          *(_QWORD *)(v55 + 24) = v75;
          *(_QWORD *)(v55 + 32) = v57;
          sub_24296389C();
          sub_24296383C();
          v59 = v58;
          v60 = *(void (**)(char *, uint64_t))(v7 + 8);
          v60(v10, v6);
          if (v59 >= 180.0)
          {
            if (qword_257207728 != -1)
              swift_once();
            v67 = sub_2429639D4();
            __swift_project_value_buffer(v67, (uint64_t)qword_257207B28);
            v68 = sub_2429639BC();
            v69 = sub_242963BF0();
            if (os_log_type_enabled(v68, v69))
            {
              v70 = swift_slowAlloc();
              v80 = swift_slowAlloc();
              v87[0] = v80;
              *(_DWORD *)v70 = 136315650;
              *(_QWORD *)&v86[0] = sub_24294461C(0x417473614C746567, 0xEF29286E6F697463, v87);
              sub_242963C5C();
              *(_WORD *)(v70 + 12) = 2048;
              *(double *)v86 = v59;
              sub_242963C5C();
              *(_WORD *)(v70 + 22) = 2048;
              *(_QWORD *)&v86[0] = 0x4066800000000000;
              sub_242963C5C();
              _os_log_impl(&dword_242941000, v68, v69, "%s last action is %f seconds which is greater than %f seconds and it was removed", (uint8_t *)v70, 0x20u);
              v71 = v80;
              swift_arrayDestroy();
              MEMORY[0x2494E932C](v71, -1, -1);
              v72 = v70;
              v33 = v84;
              MEMORY[0x2494E932C](v72, -1, -1);
            }

            a1 = v81;
            v73 = (void *)sub_242963A7C();
            objc_msgSend(v13, sel_removeObjectForKey_, v73);

            sub_242945BE4(v82);
            v60(v12, v6);
            v32 = 1;
          }
          else
          {
            if (qword_257207728 != -1)
              swift_once();
            v61 = sub_2429639D4();
            __swift_project_value_buffer(v61, (uint64_t)qword_257207B28);
            v62 = sub_2429639BC();
            v63 = sub_242963BFC();
            if (os_log_type_enabled(v62, v63))
            {
              v64 = (uint8_t *)swift_slowAlloc();
              v65 = swift_slowAlloc();
              v87[0] = v65;
              *(_DWORD *)v64 = 136315138;
              *(_QWORD *)&v86[0] = sub_24294461C(0x417473614C746567, 0xEF29286E6F697463, v87);
              sub_242963C5C();
              _os_log_impl(&dword_242941000, v62, v63, "%s valid last action is found and being returned", v64, 0xCu);
              swift_arrayDestroy();
              MEMORY[0x2494E932C](v65, -1, -1);
              v66 = v64;
              v33 = v84;
              MEMORY[0x2494E932C](v66, -1, -1);
            }

            v60(v12, v6);
            a1 = v81;
            sub_242945C20(v82, v81);
            v32 = 0;
          }
LABEL_18:
          v34 = v83;
          return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v34 + 56))(a1, v32, 1, v33);
        }
      }
      else
      {
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v5, 1, 1, v6);
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_242945BA8((uint64_t)v5, &qword_2572077A8);
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    a1 = v81;
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  if (qword_257207728 != -1)
    swift_once();
  v45 = sub_2429639D4();
  __swift_project_value_buffer(v45, (uint64_t)qword_257207B28);
  v46 = sub_2429639BC();
  v47 = sub_242963BFC();
  if (os_log_type_enabled(v46, v47))
  {
    v48 = (uint8_t *)swift_slowAlloc();
    v49 = swift_slowAlloc();
    v87[0] = v49;
    *(_DWORD *)v48 = 136315138;
    *(_QWORD *)&v86[0] = sub_24294461C(0x417473614C746567, 0xEF29286E6F697463, v87);
    sub_242963C5C();
    _os_log_impl(&dword_242941000, v46, v47, "%s last action found but values could not be loaded and it was removed", v48, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2494E932C](v49, -1, -1);
    MEMORY[0x2494E932C](v48, -1, -1);
  }

  v34 = v83;
  v33 = v84;
  v50 = (void *)sub_242963A7C();
  objc_msgSend(v13, sel_removeObjectForKey_, v50);

  v32 = 1;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v34 + 56))(a1, v32, 1, v33);
}

uint64_t sub_24294461C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_2429446EC(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_2429461EC((uint64_t)v12, *a3);
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
      sub_2429461EC((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_2429446EC(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_242963C68();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_2429448A4(a5, a6);
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
  v8 = sub_242963D04();
  if (!v8)
  {
    sub_242963D40();
    __break(1u);
LABEL_17:
    result = sub_242963D7C();
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

uint64_t sub_2429448A4(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_242944938(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_242944B10(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_242944B10(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_242944938(uint64_t a1, unint64_t a2)
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
      v3 = sub_242944AAC(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_242963CEC();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_242963D40();
      __break(1u);
LABEL_10:
      v2 = sub_242963AF4();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_242963D7C();
    __break(1u);
LABEL_14:
    result = sub_242963D40();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_242944AAC(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_257207868);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_242944B10(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_257207868);
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
  result = sub_242963D7C();
  __break(1u);
  return result;
}

unint64_t sub_242944C5C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_242963DC4();
  sub_242963AC4();
  v4 = sub_242963DDC();
  return sub_2429452EC(a1, a2, v4);
}

unint64_t sub_242944CC0(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_242963CA4();
  return sub_2429453CC(a1, v2);
}

void sub_242944CF0(char a1)
{
  sub_242963DC4();
  __asm { BR              X10 }
}

uint64_t sub_242944D50()
{
  uint64_t v0;
  uint64_t v1;

  sub_242963AC4();
  swift_bridgeObjectRelease();
  v1 = sub_242963DDC();
  return sub_242945490(v0, v1);
}

unint64_t sub_242944DF0(uint64_t a1)
{
  uint64_t v2;

  sub_2429638CC();
  sub_24294611C(&qword_257207858, MEMORY[0x24BDCEA88]);
  v2 = sub_242963A58();
  return sub_2429456C0(a1, v2);
}

uint64_t sub_242944E54(uint64_t a1, char a2)
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
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  unint64_t v21;
  unint64_t v22;
  int64_t v23;
  _QWORD *v24;
  unint64_t v25;
  int64_t v26;
  char v27;
  unint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  int64_t v40;
  uint64_t v41;
  char v42;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257207878);
  v42 = a2;
  v6 = sub_242963D64();
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
      v21 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v22 = v21 | (v13 << 6);
      goto LABEL_31;
    }
    v23 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v23 >= v40)
      break;
    v24 = (_QWORD *)(v5 + 64);
    v25 = *(_QWORD *)(v41 + 8 * v23);
    ++v13;
    if (!v25)
    {
      v13 = v23 + 1;
      if (v23 + 1 >= v40)
        goto LABEL_33;
      v25 = *(_QWORD *)(v41 + 8 * v13);
      if (!v25)
      {
        v26 = v23 + 2;
        if (v26 >= v40)
        {
LABEL_33:
          swift_release();
          v3 = v39;
          if ((v42 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v25 = *(_QWORD *)(v41 + 8 * v26);
        if (!v25)
        {
          while (1)
          {
            v13 = v26 + 1;
            if (__OFADD__(v26, 1))
              goto LABEL_42;
            if (v13 >= v40)
              goto LABEL_33;
            v25 = *(_QWORD *)(v41 + 8 * v13);
            ++v26;
            if (v25)
              goto LABEL_30;
          }
        }
        v13 = v26;
      }
    }
LABEL_30:
    v10 = (v25 - 1) & v25;
    v22 = __clz(__rbit64(v25)) + (v13 << 6);
LABEL_31:
    v31 = 16 * v22;
    v32 = (uint64_t *)(*(_QWORD *)(v5 + 48) + v31);
    v34 = *v32;
    v33 = v32[1];
    v35 = (uint64_t *)(*(_QWORD *)(v5 + 56) + v31);
    v36 = *v35;
    v37 = v35[1];
    if ((v42 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_242963DC4();
    sub_242963AC4();
    result = sub_242963DDC();
    v14 = -1 << *(_BYTE *)(v7 + 32);
    v15 = result & ~v14;
    v16 = v15 >> 6;
    if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v27 = 0;
      v28 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v29 = v16 == v28;
        if (v16 == v28)
          v16 = 0;
        v27 |= v29;
        v30 = *(_QWORD *)(v11 + 8 * v16);
      }
      while (v30 == -1);
      v17 = __clz(__rbit64(~v30)) + (v16 << 6);
    }
    *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    v18 = 16 * v17;
    v19 = (_QWORD *)(*(_QWORD *)(v7 + 48) + v18);
    *v19 = v34;
    v19[1] = v33;
    v20 = (_QWORD *)(*(_QWORD *)(v7 + 56) + v18);
    *v20 = v36;
    v20[1] = v37;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v39;
  v24 = (_QWORD *)(v5 + 64);
  if ((v42 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v38 = 1 << *(_BYTE *)(v5 + 32);
  if (v38 >= 64)
    bzero(v24, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v24 = -1 << v38;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_242945178(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v12;
  char v13;
  unint64_t v14;
  uint64_t v15;
  _BOOL8 v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t result;
  unint64_t v23;
  char v24;
  uint64_t *v25;
  _QWORD *v26;
  uint64_t v27;
  BOOL v28;
  uint64_t v29;

  v6 = v5;
  v12 = *v5;
  v14 = sub_242944C5C(a3, a4);
  v15 = *(_QWORD *)(v12 + 16);
  v16 = (v13 & 1) == 0;
  v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v18 = v13;
  v19 = *(_QWORD *)(v12 + 24);
  if (v19 >= v17 && (a5 & 1) != 0)
    goto LABEL_7;
  if (v19 >= v17 && (a5 & 1) == 0)
  {
    sub_2429457F8();
LABEL_7:
    v20 = (_QWORD *)*v6;
    if ((v18 & 1) != 0)
    {
LABEL_8:
      v21 = (_QWORD *)(v20[7] + 16 * v14);
      result = swift_bridgeObjectRelease();
      *v21 = a1;
      v21[1] = a2;
      return result;
    }
LABEL_11:
    v20[(v14 >> 6) + 8] |= 1 << v14;
    v25 = (uint64_t *)(v20[6] + 16 * v14);
    *v25 = a3;
    v25[1] = a4;
    v26 = (_QWORD *)(v20[7] + 16 * v14);
    *v26 = a1;
    v26[1] = a2;
    v27 = v20[2];
    v28 = __OFADD__(v27, 1);
    v29 = v27 + 1;
    if (!v28)
    {
      v20[2] = v29;
      return swift_bridgeObjectRetain();
    }
    goto LABEL_14;
  }
  sub_242944E54(v17, a5 & 1);
  v23 = sub_242944C5C(a3, a4);
  if ((v18 & 1) == (v24 & 1))
  {
    v14 = v23;
    v20 = (_QWORD *)*v6;
    if ((v18 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_242963DB8();
  __break(1u);
  return result;
}

unint64_t sub_2429452EC(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_242963DA0() & 1) == 0)
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
      while (!v14 && (sub_242963DA0() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_2429453CC(uint64_t a1, uint64_t a2)
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
      sub_24294615C(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = MEMORY[0x2494E8DE0](v9, a1);
      sub_242946198((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_242945490(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;

  v3 = a2 & ~(-1 << *(_BYTE *)(v2 + 32));
  if (((*(_QWORD *)(v2 + 64 + ((v3 >> 3) & 0xFFFFFFFFFFFFF8)) >> v3) & 1) != 0)
    __asm { BR              X9 }
  return a2 & ~(-1 << *(_BYTE *)(v2 + 32));
}

unint64_t sub_2429456C0(uint64_t a1, uint64_t a2)
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
  v5 = sub_2429638CC();
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
      sub_24294611C(&qword_257207860, MEMORY[0x24BDCEA98]);
      v14 = sub_242963A64();
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      if ((v14 & 1) != 0)
        break;
      v10 = (v10 + 1) & v11;
    }
    while (((*(_QWORD *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
  }
  return v10;
}

void *sub_2429457F8()
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
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  int64_t v25;
  unint64_t v26;
  int64_t v27;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257207878);
  v2 = *v0;
  v3 = sub_242963D58();
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
    v25 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v25 >= v13)
      goto LABEL_26;
    v26 = *(_QWORD *)(v6 + 8 * v25);
    ++v9;
    if (!v26)
    {
      v9 = v25 + 1;
      if (v25 + 1 >= v13)
        goto LABEL_26;
      v26 = *(_QWORD *)(v6 + 8 * v9);
      if (!v26)
        break;
    }
LABEL_25:
    v12 = (v26 - 1) & v26;
    v15 = __clz(__rbit64(v26)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + v16);
    v19 = *v17;
    v18 = v17[1];
    v20 = (uint64_t *)(*(_QWORD *)(v2 + 56) + v16);
    v21 = *v20;
    v22 = v20[1];
    v23 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v23 = v19;
    v23[1] = v18;
    v24 = (_QWORD *)(*(_QWORD *)(v4 + 56) + v16);
    *v24 = v21;
    v24[1] = v22;
    swift_bridgeObjectRetain();
    result = (void *)swift_bridgeObjectRetain();
  }
  v27 = v25 + 2;
  if (v27 >= v13)
    goto LABEL_26;
  v26 = *(_QWORD *)(v6 + 8 * v27);
  if (v26)
  {
    v9 = v27;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v27 + 1;
    if (__OFADD__(v27, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v26 = *(_QWORD *)(v6 + 8 * v9);
    ++v27;
    if (v26)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

id sub_2429459B0()
{
  id v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  id v6;
  void *v7;
  id v8;

  v0 = objc_msgSend((id)objc_opt_self(), sel_mainBundle);
  v1 = objc_msgSend(v0, sel_bundleIdentifier);

  if (v1)
  {
    v2 = sub_242963A88();
    v4 = v3;

    if (v2 == 0xD000000000000012 && v4 == 0x8000000242965E90)
    {
      swift_bridgeObjectRelease();
      return objc_msgSend((id)objc_opt_self(), sel_standardUserDefaults);
    }
    v5 = sub_242963DA0();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return objc_msgSend((id)objc_opt_self(), sel_standardUserDefaults);
  }
  v6 = objc_allocWithZone(MEMORY[0x24BDBCF50]);
  v7 = (void *)sub_242963A7C();
  v8 = objc_msgSend(v6, sel_initWithSuiteName_, v7);

  if (v8)
    return v8;
  return objc_msgSend((id)objc_opt_self(), sel_standardUserDefaults);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2494E929C]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_242945B48(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572077B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_242945BA8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_242945BE4(uint64_t a1)
{
  uint64_t Action;

  Action = type metadata accessor for NHOSmartStackLastAction();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(Action - 8) + 8))(a1, Action);
  return a1;
}

uint64_t sub_242945C20(uint64_t a1, uint64_t a2)
{
  uint64_t Action;

  Action = type metadata accessor for NHOSmartStackLastAction();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(Action - 8) + 32))(a2, a1, Action);
  return a2;
}

_QWORD *initializeBufferWithCopyOfBuffer for NHOSmartStackLastAction(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  _QWORD *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t);
  uint64_t v12;

  v3 = (_QWORD *)a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v12 = *a2;
    *v3 = *a2;
    v3 = (_QWORD *)(v12 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    v5 = a2[1];
    *(_QWORD *)a1 = *a2;
    *(_QWORD *)(a1 + 8) = v5;
    *(_BYTE *)(a1 + 16) = *((_BYTE *)a2 + 16);
    v6 = a2[4];
    v7 = *(int *)(a3 + 28);
    v8 = a1 + v7;
    v9 = (uint64_t)a2 + v7;
    *(_QWORD *)(a1 + 24) = a2[3];
    *(_QWORD *)(a1 + 32) = v6;
    v10 = sub_2429638A8();
    v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v11(v8, v9, v10);
  }
  return v3;
}

uint64_t destroy for NHOSmartStackLastAction(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 28);
  v5 = sub_2429638A8();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

uint64_t initializeWithCopy for NHOSmartStackLastAction(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, uint64_t);

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v5 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v5;
  v6 = *(int *)(a3 + 28);
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = sub_2429638A8();
  v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v10(v7, v8, v9);
  return a1;
}

uint64_t assignWithCopy for NHOSmartStackLastAction(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(int *)(a3 + 28);
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = sub_2429638A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

uint64_t initializeWithTake for NHOSmartStackLastAction(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  v4 = *(int *)(a3 + 28);
  v5 = a1 + v4;
  v6 = a2 + v4;
  v7 = sub_2429638A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

uint64_t assignWithTake for NHOSmartStackLastAction(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v7 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v7;
  swift_bridgeObjectRelease();
  v8 = *(int *)(a3 + 28);
  v9 = a1 + v8;
  v10 = a2 + v8;
  v11 = sub_2429638A8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 40))(v9, v10, v11);
  return a1;
}

uint64_t getEnumTagSinglePayload for NHOSmartStackLastAction()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_242945FA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = sub_2429638A8();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 28), a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for NHOSmartStackLastAction()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_242946028(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 8) = (a2 - 1);
  }
  else
  {
    v7 = sub_2429638A8();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 28), a2, a2, v7);
  }
  return result;
}

uint64_t sub_24294609C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2429638A8();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_24294611C(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = sub_2429638CC();
    result = MEMORY[0x2494E92B4](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24294615C(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 16))(a2, a1);
  return a2;
}

uint64_t sub_242946198(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 8))();
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

uint64_t sub_2429461EC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

BOOL static NHOWidgetFamilyUtilties.NHOWidgetFamily.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t NHOWidgetFamilyUtilties.NHOWidgetFamily.hash(into:)()
{
  return sub_242963DD0();
}

uint64_t NHOWidgetFamilyUtilties.NHOWidgetFamily.hashValue.getter()
{
  sub_242963DC4();
  sub_242963DD0();
  return sub_242963DDC();
}

BOOL sub_2429462AC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_2429462C0()
{
  sub_242963DC4();
  sub_242963DD0();
  return sub_242963DDC();
}

uint64_t sub_242946304()
{
  return sub_242963DD0();
}

uint64_t sub_24294632C()
{
  sub_242963DC4();
  sub_242963DD0();
  return sub_242963DDC();
}

void *sub_24294636C(uint64_t a1, unint64_t a2)
{
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;

  if (a1 == 0x656D6F486F6E614ELL && a2 == 0xEE00746567646957 || (sub_242963DA0() & 1) != 0)
    return &unk_251366A68;
  if (a1 == 0xD000000000000031 && a2 == 0x8000000242965EB0 || (sub_242963DA0() & 1) != 0)
    return (void *)sub_242946788((uint64_t)&unk_251366A90);
  if (a1 == 0xD000000000000029 && a2 == 0x8000000242965EF0 || (sub_242963DA0() & 1) != 0)
    return &unk_251366AB8;
  if (a1 == 0xD000000000000029 && a2 == 0x8000000242965F20 || (sub_242963DA0() & 1) != 0)
    return &unk_251366AE0;
  if (a1 == 0xD00000000000002CLL && a2 == 0x8000000242965F50 || (sub_242963DA0() & 1) != 0)
    return &unk_251366B08;
  if (a1 == 0xD000000000000026 && a2 == 0x8000000242965F80 || (sub_242963DA0() & 1) != 0)
    return &unk_251366B30;
  if (a1 == 0xD000000000000027 && a2 == 0x8000000242965FB0 || (sub_242963DA0() & 1) != 0)
    return &unk_251366B58;
  if (qword_257207718 != -1)
    swift_once();
  v5 = sub_2429639D4();
  __swift_project_value_buffer(v5, (uint64_t)qword_257207AF8);
  swift_bridgeObjectRetain_n();
  v6 = sub_2429639BC();
  v7 = sub_242963BF0();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    v9 = swift_slowAlloc();
    v10 = v9;
    *(_DWORD *)v8 = 136315138;
    swift_bridgeObjectRetain();
    sub_24294461C(a1, a2, &v10);
    sub_242963C5C();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_242941000, v6, v7, "Unknown and unhandled widget kind: %s", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2494E932C](v9, -1, -1);
    MEMORY[0x2494E932C](v8, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  return (void *)MEMORY[0x24BEE4AF8];
}

uint64_t NHOWidgetFamilyUtilties.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t NHOWidgetFamilyUtilties.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t sub_242946788(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint64_t v23;

  v2 = sub_242963920();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = objc_msgSend((id)objc_opt_self(), sel_currentLocale);
  sub_2429638E4();

  v7 = (void *)sub_2429638D8();
  v8 = objc_msgSend(v7, sel_countryCode);

  if (!v8)
    goto LABEL_7;
  v9 = sub_242963A88();
  v11 = v10;

  if (v9 == 21333 && v11 == 0xE200000000000000)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v13 = sub_242963DA0();
    swift_bridgeObjectRelease();
    if ((v13 & 1) == 0)
    {
LABEL_7:
      if (qword_257207718 != -1)
        swift_once();
      v14 = sub_2429639D4();
      __swift_project_value_buffer(v14, (uint64_t)qword_257207AF8);
      v15 = sub_2429639BC();
      v16 = sub_242963BE4();
      if (os_log_type_enabled(v15, v16))
      {
        v17 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v17 = 0;
        _os_log_impl(&dword_242941000, v15, v16, "widget Locale requirements not met", v17, 2u);
        MEMORY[0x2494E932C](v17, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      return MEMORY[0x24BEE4AF8];
    }
  }
  if (qword_257207718 != -1)
    swift_once();
  v18 = sub_2429639D4();
  __swift_project_value_buffer(v18, (uint64_t)qword_257207AF8);
  v19 = sub_2429639BC();
  v20 = sub_242963BE4();
  if (os_log_type_enabled(v19, v20))
  {
    v21 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v21 = 0;
    _os_log_impl(&dword_242941000, v19, v20, "widget Locale requirements met", v21, 2u);
    MEMORY[0x2494E932C](v21, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  swift_bridgeObjectRetain();
  return a1;
}

unint64_t sub_242946A40()
{
  unint64_t result;

  result = qword_257207880;
  if (!qword_257207880)
  {
    result = MEMORY[0x2494E92B4](&protocol conformance descriptor for NHOWidgetFamilyUtilties.NHOWidgetFamily, &type metadata for NHOWidgetFamilyUtilties.NHOWidgetFamily);
    atomic_store(result, (unint64_t *)&qword_257207880);
  }
  return result;
}

uint64_t type metadata accessor for NHOWidgetFamilyUtilties()
{
  return objc_opt_self();
}

uint64_t method lookup function for NHOWidgetFamilyUtilties()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of static NHOWidgetFamilyUtilties.supportedWidgetFamilies(forKind:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 80))();
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for NHOWidgetFamilyUtilties.NHOWidgetFamily(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for NHOWidgetFamilyUtilties.NHOWidgetFamily(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_242946BA4 + 4 * byte_242964925[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_242946BD8 + 4 * byte_242964920[v4]))();
}

uint64_t sub_242946BD8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_242946BE0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x242946BE8);
  return result;
}

uint64_t sub_242946BF4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x242946BFCLL);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_242946C00(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_242946C08(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_242946C14(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_242946C1C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for NHOWidgetFamilyUtilties.NHOWidgetFamily()
{
  return &type metadata for NHOWidgetFamilyUtilties.NHOWidgetFamily;
}

uint64_t HMServiceGroup.widgetSupportedServiceKind()@<X0>(uint64_t a1@<X8>)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
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
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, _QWORD, uint64_t, uint64_t);
  id v22;
  unint64_t v23;
  __int128 v24;
  uint64_t v25;
  int v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  id v37;
  id v38;
  id v39;
  NSObject *v40;
  os_log_type_t v41;
  _BOOL4 v42;
  void *v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  id v49;
  uint64_t v50;
  unint64_t v51;
  unint64_t v52;
  id v53;
  uint64_t v54;
  unint64_t v55;
  unint64_t v56;
  void *v57;
  void (*v58)(_QWORD, _QWORD);
  uint64_t v59;
  void (*v60)(char *, char *, uint64_t);
  char *v61;
  int v62;
  void (*v63)(char *, uint64_t);
  id v64;
  id v65;
  id v66;
  uint64_t v67;
  id v68;
  NSObject *v69;
  os_log_type_t v70;
  uint64_t v71;
  id v72;
  id v73;
  uint64_t v74;
  unint64_t v75;
  unint64_t v76;
  id v77;
  uint64_t v78;
  unint64_t v79;
  unint64_t v80;
  id v81;
  uint64_t v82;
  unint64_t v83;
  unint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  char *v88;
  uint64_t v89;
  char v90;
  void (*v91)(char *, uint64_t);
  uint64_t v92;
  void *v93;
  id v94;
  id v95;
  unint64_t v96;
  id v97;
  void (*v98)(char *, uint64_t);
  uint64_t v99;
  void *v100;
  id v101;
  id v102;
  NSObject *v103;
  os_log_type_t v104;
  uint64_t v105;
  id v106;
  uint64_t v107;
  unint64_t v108;
  unint64_t v109;
  id v110;
  uint64_t v111;
  unint64_t v112;
  unint64_t v113;
  uint64_t v114;
  char *v115;
  uint64_t v116;
  char *v117;
  id v118;
  NSObject *v119;
  os_log_type_t v120;
  int v121;
  uint64_t v122;
  uint64_t v123;
  unint64_t v124;
  void (*v125)(char *, uint64_t);
  uint64_t v126;
  unint64_t v127;
  id v128;
  uint64_t v129;
  unint64_t v130;
  unint64_t v131;
  uint64_t v132;
  void (*v133)(char *, uint64_t);
  uint64_t v134;
  char *v135;
  char *v136;
  id v137;
  id v138;
  id v139;
  id v140;
  NSObject *v141;
  os_log_type_t v142;
  int v143;
  uint64_t v144;
  uint64_t v145;
  unint64_t v146;
  char *v147;
  void (*v148)(char *, uint64_t);
  uint64_t v149;
  unint64_t v150;
  id v151;
  uint64_t v152;
  unint64_t v153;
  unint64_t v154;
  id v155;
  uint64_t v156;
  unint64_t v157;
  unint64_t v158;
  uint64_t v159;
  void (*v160)(char *, uint64_t);
  char *v162;
  char *v163;
  char *v164;
  char *v165;
  uint64_t (*v166)(uint64_t, _QWORD, uint64_t, uint64_t);
  uint64_t v167;
  __int128 v168;
  uint64_t v169;
  unint64_t v170;
  uint64_t v171;
  unint64_t v172;
  int v173;
  __int128 v174;
  int v175;
  void (*v176)(_QWORD, _QWORD);
  uint64_t v177;
  int v178;
  char *v179;
  int v180;
  int v181;
  int v182;
  int v183;
  unint64_t v184;
  int v185;
  unint64_t v186;
  char *v187;
  char *v188;
  id v189;
  uint64_t v190;
  unsigned int v191;
  char *v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199[2];

  v3 = sub_242963974();
  v4 = MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v162 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v4);
  v9 = (char *)&v162 - v8;
  v10 = MEMORY[0x24BDAC7A8](v7);
  v165 = (char *)&v162 - v11;
  v12 = MEMORY[0x24BDAC7A8](v10);
  v164 = (char *)&v162 - v13;
  v14 = MEMORY[0x24BDAC7A8](v12);
  v188 = (char *)&v162 - v15;
  v16 = MEMORY[0x24BDAC7A8](v14);
  v192 = (char *)&v162 - v17;
  MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)&v162 - v18;
  v196 = v20;
  v21 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v20 + 56);
  v167 = a1;
  v166 = v21;
  v21(a1, 1, 1, v3);
  v189 = v1;
  v22 = objc_msgSend(v1, sel_services);
  sub_24294899C(0, &qword_257207930);
  v23 = sub_242963B30();

  if (v23 >> 62)
  {
LABEL_51:
    swift_bridgeObjectRetain();
    v25 = sub_242963D4C();
    swift_bridgeObjectRelease();
    if (v25)
      goto LABEL_3;
  }
  else
  {
    v25 = *(_QWORD *)((v23 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v25)
    {
LABEL_3:
      v169 = 0;
      v186 = v23 & 0xC000000000000001;
      v179 = (char *)&v198;
      v185 = *MEMORY[0x24BE4D7B8];
      v26 = *MEMORY[0x24BE4D6E0];
      v182 = *MEMORY[0x24BE4D878];
      v183 = v26;
      v27 = *MEMORY[0x24BE4D650];
      v180 = *MEMORY[0x24BE4D810];
      v181 = v27;
      v28 = 4;
      v170 = (unint64_t)"tents23NHOWidgetFamilyUtilties";
      v172 = 0x8000000242966010;
      v178 = *MEMORY[0x24BE4D828];
      v171 = MEMORY[0x24BEE4AD8] + 8;
      v191 = *MEMORY[0x24BE4D5A0];
      v175 = *MEMORY[0x24BE4D690];
      v173 = *MEMORY[0x24BE4D6A0];
      *(_QWORD *)&v24 = 136315906;
      v174 = v24;
      *(_QWORD *)&v24 = 136315650;
      v168 = v24;
      v190 = v3;
      v187 = v19;
      v184 = v23;
      v177 = v25;
      v163 = v6;
      v162 = v9;
      while (1)
      {
        if (v186)
          v32 = (id)MEMORY[0x2494E8E28](v28 - 4, v23);
        else
          v32 = *(id *)(v23 + 8 * v28);
        v33 = v32;
        v23 = v28 - 3;
        if (__OFADD__(v28 - 4, 1))
        {
          __break(1u);
          goto LABEL_51;
        }
        if (qword_257207738 != -1)
          swift_once();
        v34 = sub_2429639D4();
        v35 = __swift_project_value_buffer(v34, (uint64_t)qword_257207B58);
        v36 = v33;
        v37 = v189;
        v38 = v36;
        v39 = v37;
        v195 = v35;
        v40 = sub_2429639BC();
        v41 = sub_242963BD8();
        v6 = (char *)v41;
        v42 = os_log_type_enabled(v40, v41);
        v193 = v28 - 3;
        v194 = v28;
        if (v42)
        {
          v43 = v39;
          v44 = swift_slowAlloc();
          v176 = (void (*)(_QWORD, _QWORD))swift_slowAlloc();
          v199[0] = (uint64_t)v176;
          *(_DWORD *)v44 = v174;
          v197 = sub_24294461C(0xD00000000000001CLL, v172, v199);
          sub_242963C5C();
          *(_WORD *)(v44 + 12) = 2080;
          v45 = objc_msgSend(v38, sel_name);
          v46 = sub_242963A88();
          v48 = v47;

          v197 = sub_24294461C(v46, v48, v199);
          sub_242963C5C();

          swift_bridgeObjectRelease();
          *(_WORD *)(v44 + 22) = 2080;
          v49 = objc_msgSend(v38, sel_serviceType);
          v50 = sub_242963A88();
          v52 = v51;

          v197 = sub_24294461C(v50, v52, v199);
          sub_242963C5C();

          swift_bridgeObjectRelease();
          *(_WORD *)(v44 + 32) = 2080;
          v53 = objc_msgSend(v43, sel_name);
          v54 = sub_242963A88();
          v56 = v55;

          v197 = sub_24294461C(v54, v56, v199);
          sub_242963C5C();

          v57 = v43;
          v3 = v190;
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_242941000, v40, (os_log_type_t)v6, "%s: Checking service %s of type %s for accessory %s", (uint8_t *)v44, 0x2Au);
          v58 = v176;
          swift_arrayDestroy();
          v19 = v187;
          MEMORY[0x2494E932C](v58, -1, -1);
          MEMORY[0x2494E932C](v44, -1, -1);

        }
        else
        {

          v57 = v39;
        }
        sub_242963C2C();
        v59 = v196;
        v60 = *(void (**)(char *, char *, uint64_t))(v196 + 16);
        v61 = v192;
        v60(v192, v19, v3);
        v62 = (*(uint64_t (**)(char *, uint64_t))(v59 + 88))(v61, v3);
        if (v62 == v185
          || v62 == v183
          || v62 == v182
          || v62 == v181
          || v62 == v180
          || v62 == v178
          || v62 == v191
          || v62 == v175
          || v62 == v173)
        {
          break;
        }
        v63 = *(void (**)(char *, uint64_t))(v196 + 8);
        v63(v192, v3);
        v64 = v38;
        v65 = v57;
        v66 = v64;
        v67 = v3;
        v68 = v65;
        v69 = sub_2429639BC();
        v70 = sub_242963BD8();
        v9 = (char *)v70;
        if (os_log_type_enabled(v69, v70))
        {
          v71 = swift_slowAlloc();
          v195 = swift_slowAlloc();
          v199[0] = v195;
          *(_DWORD *)v71 = v174;
          v197 = sub_24294461C(0xD00000000000001CLL, v170 | 0x8000000000000000, v199);
          v6 = v179;
          sub_242963C5C();
          *(_WORD *)(v71 + 12) = 2080;
          v72 = objc_msgSend(v66, sel_serviceType);
          v176 = (void (*)(_QWORD, _QWORD))v63;
          v73 = v72;
          v74 = sub_242963A88();
          v76 = v75;

          v197 = sub_24294461C(v74, v76, v199);
          sub_242963C5C();

          swift_bridgeObjectRelease();
          *(_WORD *)(v71 + 22) = 2080;
          v77 = objc_msgSend(v66, sel_name);
          v78 = sub_242963A88();
          v80 = v79;

          v197 = sub_24294461C(v78, v80, v199);
          sub_242963C5C();

          swift_bridgeObjectRelease();
          *(_WORD *)(v71 + 32) = 2080;
          v81 = objc_msgSend(v68, sel_name);
          v82 = sub_242963A88();
          v84 = v83;

          v85 = v190;
          v86 = v82;
          v19 = v187;
          v197 = sub_24294461C(v86, v84, v199);
          sub_242963C5C();

          v3 = v85;
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_242941000, v69, (os_log_type_t)v9, "%s: ServiceType %s for service %s for serviceGroup %s is not supported.", (uint8_t *)v71, 0x2Au);
          v87 = v195;
          swift_arrayDestroy();
          MEMORY[0x2494E932C](v87, -1, -1);
          MEMORY[0x2494E932C](v71, -1, -1);

          v88 = v19;
          v89 = v85;
          goto LABEL_35;
        }

        v63(v19, v67);
        v23 = v184;
        v29 = v177;
        v30 = v193;
        v31 = v194;
        v3 = v67;
LABEL_5:
        v28 = v31 + 1;
        if (v30 == v29)
          return swift_bridgeObjectRelease();
      }
      (*(void (**)(char *, _QWORD, uint64_t))(v196 + 104))(v188, v191, v3);
      sub_242948954();
      sub_242963B18();
      sub_242963B18();
      if (v199[0] == v197 && v199[1] == v198)
      {
        swift_bridgeObjectRelease_n();
        v176 = *(void (**)(_QWORD, _QWORD))(v196 + 8);
        v176(v188, v3);
        goto LABEL_41;
      }
      v90 = sub_242963DA0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v91 = *(void (**)(char *, uint64_t))(v196 + 8);
      v91(v188, v3);
      if ((v90 & 1) != 0)
      {
        v176 = (void (*)(_QWORD, _QWORD))v91;
LABEL_41:
        swift_bridgeObjectRelease();
        v115 = v164;
        v60(v164, v19, v3);
        v116 = v3;
        v117 = v165;
        v60(v165, v19, v116);
        v118 = v57;
        v119 = sub_2429639BC();
        v120 = sub_242963BD8();
        v121 = v120;
        if (os_log_type_enabled(v119, v120))
        {
          v122 = swift_slowAlloc();
          v195 = swift_slowAlloc();
          v199[0] = v195;
          *(_DWORD *)v122 = v174;
          v197 = sub_24294461C(0xD00000000000001CLL, v170 | 0x8000000000000000, v199);
          sub_242963C5C();
          *(_WORD *)(v122 + 12) = 2080;
          LODWORD(v194) = v121;
          v123 = ServiceKind.debugDescription.getter();
          v197 = sub_24294461C(v123, v124, v199);
          sub_242963C5C();
          swift_bridgeObjectRelease();
          v125 = (void (*)(char *, uint64_t))v176;
          v176(v115, v116);
          *(_WORD *)(v122 + 22) = 2080;
          v126 = sub_242963968();
          v197 = sub_24294461C(v126, v127, v199);
          sub_242963C5C();
          swift_bridgeObjectRelease();
          v125(v117, v116);
          *(_WORD *)(v122 + 32) = 2080;
          v128 = objc_msgSend(v118, sel_name);
          v129 = sub_242963A88();
          v131 = v130;

          v197 = sub_24294461C(v129, v131, v199);
          sub_242963C5C();

          v19 = v187;
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_242941000, v119, (os_log_type_t)v194, "%s: Found supported service kind %s(%s) for serviceGroup %s", (uint8_t *)v122, 0x2Au);
          v132 = v195;
          swift_arrayDestroy();
          MEMORY[0x2494E932C](v132, -1, -1);
          MEMORY[0x2494E932C](v122, -1, -1);

        }
        else
        {

          v133 = (void (*)(char *, uint64_t))v176;
          v176(v117, v116);
          v133(v115, v116);

        }
        v134 = v167;
        sub_242948D44(v167);
        (*(void (**)(uint64_t, char *, uint64_t))(v196 + 32))(v134, v19, v116);
        return v166(v134, 0, 1, v116);
      }
      HMService.primaryControlCharacteristicType.getter();
      if (v92)
      {
        v93 = (void *)sub_242963A7C();
        swift_bridgeObjectRelease();
        v94 = objc_msgSend(v38, sel_hf_characteristicOfType_, v93);

        if (v94)
          goto LABEL_45;
      }
      else
      {
        v95 = objc_msgSend(v38, sel_characteristics);
        sub_24294899C(0, &qword_257207940);
        v96 = sub_242963B30();

        v97 = v38;
        v98 = v91;
        v99 = v169;
        v100 = sub_2429489D4(v96);
        v169 = v99;
        v91 = v98;
        v3 = v190;
        swift_bridgeObjectRelease();

        if (v100)
        {
LABEL_45:
          v176 = (void (*)(_QWORD, _QWORD))v91;
          swift_bridgeObjectRelease();
          v116 = v3;
          v135 = v162;
          v60(v162, v19, v116);
          v136 = v163;
          v60(v163, v19, v116);
          v137 = v38;
          v138 = v57;
          v139 = v137;
          v140 = v138;
          v141 = sub_2429639BC();
          v142 = sub_242963BD8();
          v143 = v142;
          if (os_log_type_enabled(v141, v142))
          {
            v144 = swift_slowAlloc();
            v195 = swift_slowAlloc();
            v199[0] = v195;
            *(_DWORD *)v144 = 136316162;
            LODWORD(v194) = v143;
            v197 = sub_24294461C(0xD00000000000001CLL, v170 | 0x8000000000000000, v199);
            sub_242963C5C();
            *(_WORD *)(v144 + 12) = 2080;
            v145 = ServiceKind.debugDescription.getter();
            v197 = sub_24294461C(v145, v146, v199);
            sub_242963C5C();
            swift_bridgeObjectRelease();
            v147 = v135;
            v148 = (void (*)(char *, uint64_t))v176;
            v176(v147, v116);
            *(_WORD *)(v144 + 22) = 2080;
            v149 = sub_242963968();
            v197 = sub_24294461C(v149, v150, v199);
            sub_242963C5C();
            swift_bridgeObjectRelease();
            v148(v136, v116);
            *(_WORD *)(v144 + 32) = 2080;
            v151 = objc_msgSend(v139, sel_name);
            v152 = sub_242963A88();
            v154 = v153;

            v197 = sub_24294461C(v152, v154, v199);
            sub_242963C5C();

            swift_bridgeObjectRelease();
            *(_WORD *)(v144 + 42) = 2080;
            v155 = objc_msgSend(v140, sel_name);
            v156 = sub_242963A88();
            v158 = v157;

            v197 = sub_24294461C(v156, v158, v199);
            sub_242963C5C();

            swift_bridgeObjectRelease();
            _os_log_impl(&dword_242941000, v141, (os_log_type_t)v194, "%s: Found supported service kind %s(%s) having a primary control characteristic with service %s for serviceGroup %s", (uint8_t *)v144, 0x34u);
            v159 = v195;
            swift_arrayDestroy();
            MEMORY[0x2494E932C](v159, -1, -1);
            MEMORY[0x2494E932C](v144, -1, -1);

          }
          else
          {

            v160 = (void (*)(char *, uint64_t))v176;
            v176(v136, v116);
            v160(v135, v116);

          }
          v134 = v167;
          sub_242948D44(v167);
          (*(void (**)(uint64_t, char *, uint64_t))(v196 + 32))(v134, v187, v116);
          return v166(v134, 0, 1, v116);
        }
      }
      v101 = v38;
      v102 = v57;
      v9 = (char *)v101;
      v6 = (char *)v102;
      v103 = sub_2429639BC();
      v104 = sub_242963BD8();
      if (os_log_type_enabled(v103, v104))
      {
        v105 = swift_slowAlloc();
        v195 = swift_slowAlloc();
        v199[0] = v195;
        *(_DWORD *)v105 = v168;
        v197 = sub_24294461C(0xD00000000000001CLL, v170 | 0x8000000000000000, v199);
        v176 = (void (*)(_QWORD, _QWORD))v91;
        sub_242963C5C();
        *(_WORD *)(v105 + 12) = 2080;
        v106 = objc_msgSend(v9, sel_name);
        v107 = sub_242963A88();
        v109 = v108;

        v197 = sub_24294461C(v107, v109, v199);
        sub_242963C5C();

        swift_bridgeObjectRelease();
        *(_WORD *)(v105 + 22) = 2080;
        v110 = objc_msgSend(v6, sel_name);
        v111 = sub_242963A88();
        v113 = v112;

        v19 = v187;
        v197 = sub_24294461C(v111, v113, v199);
        sub_242963C5C();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_242941000, v103, v104, "%s: Did not find primary control characteristic for service %s for serviceGroup %s, continuing to next service", (uint8_t *)v105, 0x20u);
        v114 = v195;
        swift_arrayDestroy();
        v3 = v190;
        MEMORY[0x2494E932C](v114, -1, -1);
        MEMORY[0x2494E932C](v105, -1, -1);

        v88 = v19;
        v89 = v3;
LABEL_35:
        v176(v88, v89);
      }
      else
      {

        v91(v19, v3);
      }
      v23 = v184;
      v29 = v177;
      v30 = v193;
      v31 = v194;
      goto LABEL_5;
    }
  }
  return swift_bridgeObjectRelease();
}

HMService_optional __swiftcall HMServiceGroup.serviceWithPrimaryControlCharacteristic()()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  int v17;
  id v18;
  void *v19;
  char *v21;
  uint64_t (*v22)(char *, uint64_t);
  int v23;
  id v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  Swift::Bool v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  uint64_t v37;
  char v39;
  void *v40;
  id v41;
  void (*v42)(char *, uint64_t);
  void (*v43)(char *, uint64_t);
  void (*v44)(char *, uint64_t);
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  uint64_t v53;
  int v54;
  uint64_t v55;
  int v56;
  int v57;
  uint64_t v58;
  int v59;
  uint64_t v60;
  int v61;
  int v62;
  unint64_t v63;
  uint64_t v64;
  uint64_t v65;
  int v66;
  unint64_t v67;
  unsigned int v68;
  unint64_t v69;
  int v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  unint64_t v74;
  uint64_t v75;
  uint64_t v76;
  HMService_optional result;

  v1 = sub_242963974();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = MEMORY[0x24BDAC7A8](v1);
  v5 = (char *)&v44 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = MEMORY[0x24BDAC7A8](v3);
  v8 = (char *)&v44 - v7;
  v9 = MEMORY[0x24BDAC7A8](v6);
  v11 = (uint64_t)&v44 - v10;
  MEMORY[0x24BDAC7A8](v9);
  v71 = (char *)&v44 - v12;
  v13 = objc_msgSend(v0, sel_services);
  sub_24294899C(0, &qword_257207930);
  v14 = sub_242963B30();

  if (v14 >> 62)
    goto LABEL_58;
  v15 = *(_QWORD *)((v14 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (v15)
  {
    v58 = v11;
    v16 = 0;
    v69 = v14 & 0xC000000000000001;
    v70 = *MEMORY[0x24BE4D7B8];
    v64 = v14 & 0xFFFFFFFFFFFFFF8;
    v67 = v14;
    v63 = v14 + 32;
    v66 = *MEMORY[0x24BE4D6E0];
    v62 = *MEMORY[0x24BE4D878];
    v61 = *MEMORY[0x24BE4D650];
    v59 = *MEMORY[0x24BE4D810];
    v17 = *MEMORY[0x24BE4D828];
    v56 = *MEMORY[0x24BE4D690];
    v57 = v17;
    v54 = *MEMORY[0x24BE4D6A0];
    v53 = *MEMORY[0x24BDD5A60];
    v55 = *MEMORY[0x24BDD5770];
    v72 = *MEMORY[0x24BDD5970];
    v60 = *MEMORY[0x24BDD5A50];
    v65 = *MEMORY[0x24BDD5A18];
    v68 = *MEMORY[0x24BE4D5A0];
    while (1)
    {
      if (v69)
      {
        v18 = (id)MEMORY[0x2494E8E28](v16, v67);
      }
      else
      {
        if (v16 >= *(_QWORD *)(v64 + 16))
          goto LABEL_57;
        v18 = *(id *)(v63 + 8 * v16);
      }
      v19 = v18;
      if (__OFADD__(v16++, 1))
        break;
      v21 = v71;
      sub_242963C2C();
      v22 = *(uint64_t (**)(char *, uint64_t))(v2 + 88);
      v23 = v22(v21, v1);
      if (v23 == v70 || v23 == v66 || v23 == v62 || v23 == v61 || v23 == v59 || v23 == v57 || v23 == v56 || v23 == v54)
      {
        sub_242963A88();
        v40 = (void *)sub_242963A7C();
        swift_bridgeObjectRelease();
        v41 = objc_msgSend(v19, sel_hf_characteristicOfType_, v40);

        if (v41)
          goto LABEL_53;
      }
      else
      {
        v44 = *(void (**)(char *, uint64_t))(v2 + 8);
        v44(v71, v1);
        v24 = objc_msgSend(v19, sel_characteristics);
        sub_24294899C(0, &qword_257207940);
        v25 = sub_242963B30();

        v47 = v25;
        if (v25 >> 62)
        {
          swift_bridgeObjectRetain_n();
          v26 = sub_242963D4C();
          swift_bridgeObjectRelease();
        }
        else
        {
          v26 = *(_QWORD *)((v25 & 0xFFFFFFFFFFFFF8) + 0x10);
          swift_bridgeObjectRetain();
        }
        v27 = v47;
        if (v26)
        {
          v46 = v47 & 0xC000000000000001;
          v28 = 4;
          v45 = v26;
          do
          {
            v29 = v28 - 4;
            v49 = v28;
            if (v46)
            {
              v30 = (id)MEMORY[0x2494E8E28](v28 - 4, v27);
              v32 = v29 + 1;
              if (__OFADD__(v29, 1))
                goto LABEL_61;
            }
            else
            {
              v30 = *(id *)(v27 + 8 * v28);
              v32 = v29 + 1;
              if (__OFADD__(v29, 1))
              {
LABEL_61:
                __break(1u);
                goto LABEL_62;
              }
            }
            v48 = v32;
            v52 = v30;
            v33 = objc_msgSend(v30, sel_characteristicType);
            v50 = sub_242963A88();
            v51 = v34;

            v35 = v58;
            sub_242963C2C();
            v36 = v22((char *)v35, v1);
            if (v36 == v70
              || v36 == v66
              || v36 == v62
              || v36 == v61
              || v36 == v59
              || v36 == v57
              || v36 == v56
              || v36 == v54)
            {
              if (v50 == sub_242963A88() && v51 == v37)
              {
                swift_bridgeObjectRelease_n();
LABEL_55:
                swift_bridgeObjectRelease_n();
                swift_bridgeObjectRelease();

                goto LABEL_60;
              }
              v39 = sub_242963DA0();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              if ((v39 & 1) != 0)
                goto LABEL_55;

            }
            else
            {
              v44((char *)v58, v1);

              swift_bridgeObjectRelease();
            }
            v28 = v49 + 1;
            v27 = v47;
          }
          while (v48 != v45);
        }
        swift_bridgeObjectRelease_n();
      }
      sub_242963C2C();
      (*(void (**)(char *, _QWORD, uint64_t))(v2 + 104))(v5, v68, v1);
      sub_242948954();
      sub_242963B18();
      sub_242963B18();
      v14 = v74;
      if (v75 == v73 && v76 == v74)
      {
        swift_bridgeObjectRelease_n();
        v43 = *(void (**)(char *, uint64_t))(v2 + 8);
        v43(v5, v1);
        v43(v8, v1);
LABEL_53:
        swift_bridgeObjectRelease();
        goto LABEL_60;
      }
      v11 = sub_242963DA0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v42 = *(void (**)(char *, uint64_t))(v2 + 8);
      v42(v5, v1);
      v42(v8, v1);
      if ((v11 & 1) != 0)
        goto LABEL_53;

      if (v16 == v15)
        goto LABEL_59;
    }
    __break(1u);
LABEL_57:
    __break(1u);
LABEL_58:
    swift_bridgeObjectRetain();
    v15 = sub_242963D4C();
    swift_bridgeObjectRelease();
  }
LABEL_59:
  swift_bridgeObjectRelease();
  v19 = 0;
LABEL_60:
  v30 = v19;
LABEL_62:
  result.value.super.isa = (Class)v30;
  result.is_nil = v31;
  return result;
}

HMService_optional __swiftcall HMServiceGroup.primaryService()()
{
  void *v0;
  id v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  Swift::Bool v8;
  objc_class *v9;
  HMService_optional result;

  v1 = objc_msgSend(v0, sel_services);
  sub_24294899C(0, &qword_257207930);
  v2 = sub_242963B30();

  if (v2 >> 62)
    goto LABEL_14;
  v3 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (v3)
  {
    v4 = 4;
    while (1)
    {
      v5 = (v2 & 0xC000000000000001) != 0 ? (id)MEMORY[0x2494E8E28](v4 - 4, v2) : *(id *)(v2 + 8 * v4);
      v6 = v5;
      v7 = v4 - 3;
      if (__OFADD__(v4 - 4, 1))
        break;
      if (objc_msgSend(v5, sel_isPrimaryService))
      {
        swift_bridgeObjectRelease();
        goto LABEL_12;
      }

      ++v4;
      if (v7 == v3)
        goto LABEL_10;
    }
    __break(1u);
LABEL_14:
    swift_bridgeObjectRetain();
    v3 = sub_242963D4C();
    swift_bridgeObjectRelease();
  }
LABEL_10:
  swift_bridgeObjectRelease();
  v6 = 0;
LABEL_12:
  v9 = (objc_class *)v6;
  result.value.super.isa = v9;
  result.is_nil = v8;
  return result;
}

unint64_t sub_242948954()
{
  unint64_t result;
  uint64_t v1;

  result = qword_257207938;
  if (!qword_257207938)
  {
    v1 = sub_242963974();
    result = MEMORY[0x2494E92B4](MEMORY[0x24BE4D8B8], v1);
    atomic_store(result, (unint64_t *)&qword_257207938);
  }
  return result;
}

uint64_t sub_24294899C(uint64_t a1, unint64_t *a2)
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

void *sub_2429489D4(unint64_t a1)
{
  char *v1;
  char *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  char *v13;
  char *v14;
  int v15;
  char *v16;
  char v18;
  uint64_t v20;
  int v21;
  uint64_t v22;
  int v23;
  int v24;
  int v25;
  char *v26;
  uint64_t v27;
  int v28;
  int v29;
  uint64_t v30;
  int v31;
  int v32;
  unint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  v2 = v1;
  v4 = sub_242963974();
  v35 = *(_QWORD *)(v4 - 8);
  v36 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v34 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1 >> 62)
    goto LABEL_28;
  v6 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v6; v6 = sub_242963D4C())
  {
    v26 = v2;
    v33 = a1 & 0xC000000000000001;
    v32 = *MEMORY[0x24BE4D7B8];
    v31 = *MEMORY[0x24BE4D6E0];
    v29 = *MEMORY[0x24BE4D878];
    v28 = *MEMORY[0x24BE4D650];
    v25 = *MEMORY[0x24BE4D810];
    v24 = *MEMORY[0x24BE4D828];
    v23 = *MEMORY[0x24BE4D690];
    v21 = *MEMORY[0x24BE4D6A0];
    v20 = *MEMORY[0x24BDD5A60];
    v22 = *MEMORY[0x24BDD5770];
    v37 = *MEMORY[0x24BDD5970];
    v27 = *MEMORY[0x24BDD5A50];
    v7 = 4;
    v30 = *MEMORY[0x24BDD5A18];
    while (1)
    {
      v8 = v33 ? (id)MEMORY[0x2494E8E28](v7 - 4, a1) : *(id *)(a1 + 8 * v7);
      v9 = v8;
      v10 = v7 - 3;
      if (__OFADD__(v7 - 4, 1))
        break;
      v11 = objc_msgSend(v8, sel_characteristicType, v20);
      v12 = sub_242963A88();
      v14 = v13;

      v2 = v34;
      sub_242963C2C();
      v15 = (*(uint64_t (**)(char *, uint64_t))(v35 + 88))(v2, v36);
      if (v15 == v32 || v15 == v31 || v15 == v29 || v15 == v28 || v15 == v25 || v15 == v24 || v15 == v23 || v15 == v21)
      {
        if (v12 == sub_242963A88() && v14 == v16)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
LABEL_26:
          swift_bridgeObjectRelease();
          return v9;
        }
        v2 = v16;
        v18 = sub_242963DA0();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v18 & 1) != 0)
          goto LABEL_26;

      }
      else
      {
        (*(void (**)(char *, uint64_t))(v35 + 8))(v34, v36);

        swift_bridgeObjectRelease();
      }
      ++v7;
      if (v10 == v6)
        goto LABEL_29;
    }
    __break(1u);
LABEL_28:
    swift_bridgeObjectRetain();
  }
LABEL_29:
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_242948D44(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_257207948);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t static EnergyForecastIntent.intentClassName.getter()
{
  return 0xD000000000000013;
}

uint64_t sub_242948DA0()
{
  uint64_t v0;

  v0 = sub_242963824();
  __swift_allocate_value_buffer(v0, qword_257207950);
  __swift_project_value_buffer(v0, (uint64_t)qword_257207950);
  return sub_242963818();
}

uint64_t static EnergyForecastIntent.title.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_242948F3C(&qword_2572076D0, (uint64_t (*)(_QWORD))MEMORY[0x24BDCD380], (uint64_t)qword_257207950, a1);
}

uint64_t static EnergyForecastIntent.title.setter(uint64_t a1)
{
  return sub_242948FEC(a1, &qword_2572076D0, (uint64_t (*)(_QWORD))MEMORY[0x24BDCD380], (uint64_t)qword_257207950);
}

uint64_t (*static EnergyForecastIntent.title.modify())()
{
  uint64_t v0;

  if (qword_2572076D0 != -1)
    swift_once();
  v0 = sub_242963824();
  __swift_project_value_buffer(v0, (uint64_t)qword_257207950);
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_242948EC8()
{
  uint64_t v0;

  v0 = sub_2429637B8();
  __swift_allocate_value_buffer(v0, qword_257207968);
  __swift_project_value_buffer(v0, (uint64_t)qword_257207968);
  return sub_2429637AC();
}

uint64_t static EnergyForecastIntent.description.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_242948F3C(&qword_2572076D8, (uint64_t (*)(_QWORD))MEMORY[0x24BDB5800], (uint64_t)qword_257207968, a1);
}

uint64_t sub_242948F3C@<X0>(_QWORD *a1@<X0>, uint64_t (*a2)(_QWORD)@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  uint64_t v8;

  if (*a1 != -1)
    swift_once();
  v7 = a2(0);
  v8 = __swift_project_value_buffer(v7, a3);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a4, v8, v7);
}

uint64_t static EnergyForecastIntent.description.setter(uint64_t a1)
{
  return sub_242948FEC(a1, &qword_2572076D8, (uint64_t (*)(_QWORD))MEMORY[0x24BDB5800], (uint64_t)qword_257207968);
}

uint64_t sub_242948FEC(uint64_t a1, _QWORD *a2, uint64_t (*a3)(_QWORD), uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (*a2 != -1)
    swift_once();
  v7 = a3(0);
  v8 = __swift_project_value_buffer(v7, a4);
  swift_beginAccess();
  v9 = *(_QWORD *)(v7 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 24))(v8, a1, v7);
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8))(a1, v7);
}

uint64_t (*static EnergyForecastIntent.description.modify())()
{
  uint64_t v0;

  if (qword_2572076D8 != -1)
    swift_once();
  v0 = sub_2429637B8();
  __swift_project_value_buffer(v0, (uint64_t)qword_257207968);
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t EnergyForecastIntent.homeIdentifier.getter()
{
  return sub_242949240();
}

uint64_t EnergyForecastIntent.homeIdentifier.setter()
{
  return sub_24294930C();
}

uint64_t (*EnergyForecastIntent.homeIdentifier.modify(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = *(_QWORD *)(v1 + OBJC_IVAR___NHOEnergyForecastIntent__homeIdentifier);
  swift_retain();
  v3[5] = sub_242963758();
  return sub_2429491A0;
}

uint64_t EnergyForecastIntent.$homeIdentifier.getter()
{
  return sub_242949494();
}

id sub_2429491BC(void *a1)
{
  id v1;
  void *v2;
  uint64_t v4;

  v1 = a1;
  swift_retain();
  sub_242963764();

  swift_release();
  if (!v4)
    return 0;
  v2 = (void *)sub_242963A7C();
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t EnergyForecastIntent.homeName.getter()
{
  return sub_242949240();
}

uint64_t sub_242949240()
{
  uint64_t v1;

  swift_retain();
  sub_242963764();
  swift_release();
  return v1;
}

uint64_t sub_242949290(void *a1, uint64_t a2, uint64_t a3)
{
  id v4;

  if (a3)
    sub_242963A88();
  v4 = a1;
  swift_retain();
  sub_242963770();

  return swift_release();
}

uint64_t EnergyForecastIntent.homeName.setter()
{
  return sub_24294930C();
}

uint64_t sub_24294930C()
{
  swift_retain();
  sub_242963770();
  return swift_release();
}

double sub_242949350@<D0>(_OWORD *a1@<X8>)
{
  double result;
  __int128 v3;

  swift_retain();
  sub_242963764();
  swift_release();
  result = *(double *)&v3;
  *a1 = v3;
  return result;
}

uint64_t sub_2429493A0()
{
  swift_bridgeObjectRetain();
  swift_retain();
  sub_242963770();
  return swift_release();
}

uint64_t (*EnergyForecastIntent.homeName.modify(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = *(_QWORD *)(v1 + OBJC_IVAR___NHOEnergyForecastIntent__homeName);
  swift_retain();
  v3[5] = sub_242963758();
  return sub_2429491A0;
}

void sub_242949450(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD, _QWORD))(*a1 + 40))(*a1, 0);
  swift_release();
  free(v1);
}

uint64_t EnergyForecastIntent.$homeName.getter()
{
  return sub_242949494();
}

uint64_t sub_242949494()
{
  uint64_t v0;

  swift_retain();
  v0 = sub_24296377C();
  swift_release();
  return v0;
}

id EnergyForecastIntent.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id EnergyForecastIntent.init()()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
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
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  _QWORD v22[2];
  void (*v23)(char *, uint64_t, uint64_t);
  void (*v24)(char *, uint64_t, uint64_t, uint64_t);
  void (*v25)(char *, uint64_t, uint64_t, uint64_t);
  void (*v26)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  char *v32;
  uint64_t v33;
  objc_class *ObjectType;
  objc_super v35;
  uint64_t v36;
  uint64_t v37;

  ObjectType = (objc_class *)swift_getObjectType();
  v33 = sub_2429637DC();
  v1 = *(_QWORD *)(v33 - 8);
  MEMORY[0x24BDAC7A8](v33);
  v32 = (char *)v22 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_257207990);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_257207998);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572079A0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_242963824();
  v13 = *(_QWORD *)(v12 - 8);
  v27 = v12;
  MEMORY[0x24BDAC7A8](v12);
  v30 = OBJC_IVAR___NHOEnergyForecastIntent__homeIdentifier;
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572079A8);
  v31 = v0;
  sub_242963818();
  v26 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56);
  v26(v11, 1, 1, v12);
  v14 = sub_242963A70();
  v36 = 0;
  v37 = 0;
  v25 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56);
  v25(v8, 1, 1, v14);
  v15 = sub_242963740();
  v24 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56);
  v24(v5, 1, 1, v15);
  v16 = *MEMORY[0x24BDB6090];
  v23 = *(void (**)(char *, uint64_t, uint64_t))(v1 + 104);
  v17 = v32;
  v18 = v33;
  v23(v32, v16, v33);
  v22[1] = v11;
  *(_QWORD *)(v29 + v30) = sub_242963794();
  v30 = OBJC_IVAR___NHOEnergyForecastIntent__homeName;
  sub_242963818();
  v26(v11, 1, 1, v27);
  v36 = 0;
  v37 = 0;
  v25(v8, 1, 1, v14);
  v24(v5, 1, 1, v15);
  v23(v17, v16, v18);
  v19 = sub_242963794();
  v20 = v31;
  *(_QWORD *)&v31[v30] = v19;

  v35.receiver = v20;
  v35.super_class = ObjectType;
  return objc_msgSendSuper2(&v35, sel_init);
}

id EnergyForecastIntent.__allocating_init(homeIdentifier:)()
{
  objc_class *v0;
  id v1;

  v1 = objc_msgSend(objc_allocWithZone(v0), sel_init);
  swift_retain();
  sub_242963770();

  swift_release();
  return v1;
}

id EnergyForecastIntent.__allocating_init(homeIdentifier:homeName:)()
{
  objc_class *v0;
  id v1;

  v1 = objc_msgSend(objc_allocWithZone(v0), sel_init);
  swift_retain();
  sub_242963770();
  swift_release();
  swift_retain();
  sub_242963770();

  swift_release();
  return v1;
}

id EnergyForecastIntent.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_2429499C0()
{
  return sub_242949D98(&qword_2572079B0, (uint64_t)&protocol conformance descriptor for EnergyForecastIntent);
}

uint64_t type metadata accessor for EnergyForecastIntent()
{
  return objc_opt_self();
}

unint64_t sub_242949A3C()
{
  return 0xD000000000000013;
}

uint64_t sub_242949A58()
{
  return sub_242949D98(&qword_2572079B8, (uint64_t)&protocol conformance descriptor for EnergyForecastIntent);
}

uint64_t sub_242949A7C()
{
  return sub_242949D98(&qword_2572079C0, (uint64_t)&protocol conformance descriptor for EnergyForecastIntent);
}

unint64_t sub_242949AA4()
{
  unint64_t result;

  result = qword_2572079C8;
  if (!qword_2572079C8)
  {
    result = MEMORY[0x2494E92B4](MEMORY[0x24BDB6680], MEMORY[0x24BEE4078]);
    atomic_store(result, (unint64_t *)&qword_2572079C8);
  }
  return result;
}

uint64_t sub_242949AE8()
{
  sub_242949D98(&qword_2572079B0, (uint64_t)&protocol conformance descriptor for EnergyForecastIntent);
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_242949B38@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_2572076D0 != -1)
    swift_once();
  v2 = sub_242963824();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_257207950);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

void sub_242949BD0()
{
  JUMPOUT(0x2494E8828);
}

uint64_t sub_242949BD8()
{
  return sub_242963728();
}

void sub_242949BE0()
{
  JUMPOUT(0x2494E8840);
}

uint64_t sub_242949BE8()
{
  return sub_24296371C();
}

uint64_t sub_242949BF0()
{
  return sub_242963704();
}

uint64_t sub_242949BF8()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  sub_242949D98(&qword_257207A08, (uint64_t)&protocol conformance descriptor for EnergyForecastIntent);
  *v1 = v0;
  v1[1] = sub_242949C6C;
  return sub_24296380C();
}

uint64_t sub_242949C6C()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t result;

  v2 = *v1;
  result = swift_task_dealloc();
  if (v0)
    return (*(uint64_t (**)(void))(v2 + 8))();
  return result;
}

id sub_242949CC8@<X0>(_QWORD *a1@<X8>)
{
  objc_class *v1;
  id result;

  result = objc_msgSend(objc_allocWithZone(v1), sel_init);
  *a1 = result;
  return result;
}

void sub_242949CFC()
{
  sub_242949D98(&qword_257207A00, (uint64_t)&protocol conformance descriptor for EnergyForecastIntent);
  JUMPOUT(0x2494E8810);
}

double sub_242949D28@<D0>(_OWORD *a1@<X8>)
{
  return sub_242949350(a1);
}

uint64_t sub_242949D44()
{
  return sub_2429493A0();
}

double sub_242949D60@<D0>(_OWORD *a1@<X8>)
{
  return sub_242949350(a1);
}

uint64_t sub_242949D7C()
{
  return sub_2429493A0();
}

uint64_t sub_242949D98(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for EnergyForecastIntent();
    result = MEMORY[0x2494E92B4](a2, v5);
    atomic_store(result, a1);
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

unint64_t HMActionSet.iconSymbolName.getter()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v12;
  uint64_t v13;

  v1 = objc_msgSend(v0, sel_applicationData);
  v2 = (void *)sub_242963A7C();
  v3 = objc_msgSend(v1, sel_objectForKeyedSubscript_, v2);

  if (!v3 || (__swift_instantiateConcreteTypeFromMangledName(&qword_257207A10), (swift_dynamicCast() & 1) == 0))
  {
    v12 = 0;
    v13 = 0;
  }
  v4 = (void *)sub_242963A7C();
  v5 = objc_msgSend(v1, sel_objectForKeyedSubscript_, v4);

  if (v5)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_257207A10);
    if ((swift_dynamicCast() & 1) != 0)
    {
      if (!v13 && (sub_242963B00() & 1) != 0)
      {
        v6 = (void *)sub_242963A7C();
        swift_bridgeObjectRelease();
        v7 = HFImageIconIdentifier.symbolMapping.getter();
        v9 = v8;

        v12 = v7;
        v13 = v9;
      }
      swift_bridgeObjectRelease();
    }
  }
  v10 = sub_24294A018();

  if (v13)
  {
    v10 = v12;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  return v10;
}

unint64_t sub_24294A018()
{
  unint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v11;

  v0 = 0x69662E6573756F68;
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_257207A20);
  v2 = MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v11 - v5;
  sub_242963BCC();
  v7 = sub_242963BC0();
  v8 = *(_QWORD *)(v7 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) != 1)
  {
    sub_24294ADF4((uint64_t)v6, (uint64_t)v4);
    v9 = (*(uint64_t (**)(char *, uint64_t))(v8 + 88))(v4, v7);
    if (v9 == *MEMORY[0x24BE4EB78])
    {
      v0 = 0xD000000000000013;
    }
    else if (v9 == *MEMORY[0x24BE4EB90])
    {
      v0 = 0xD000000000000015;
    }
    else if (v9 == *MEMORY[0x24BE4EBA8])
    {
      v0 = 0x2E78616D2E6E7573;
    }
    else if (v9 == *MEMORY[0x24BE4EBA0])
    {
      v0 = 0x6174732E6E6F6F6DLL;
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v8 + 8))(v4, v7);
    }
  }
  sub_242945BA8((uint64_t)v6, &qword_257207A20);
  return v0;
}

uint64_t HMActionSet.iconTintColor.getter()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  id v5;
  id v6;
  uint64_t v7;
  unint64_t v8;
  char v9;
  unint64_t v10;
  unint64_t v11;
  char v12;
  double v13;
  unint64_t v14;
  char v15;
  double v16;
  unint64_t v17;
  char v18;
  double v19;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  _BYTE v24[40];
  __int128 v25;
  __int128 v26;

  v1 = sub_2429639E0();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = objc_msgSend(v0, sel_applicationData);
  v6 = objc_msgSend(v5, sel_dictionary);

  v7 = sub_242963A4C();
  v22 = 0xD00000000000001FLL;
  v23 = 0x8000000242966160;
  sub_242963CBC();
  if (*(_QWORD *)(v7 + 16) && (v8 = sub_242944CC0((uint64_t)v24), (v9 & 1) != 0))
  {
    sub_2429461EC(*(_QWORD *)(v7 + 56) + 32 * v8, (uint64_t)&v25);
  }
  else
  {
    v25 = 0u;
    v26 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_242946198((uint64_t)v24);
  if (*((_QWORD *)&v26 + 1))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_257207A18);
    if ((swift_dynamicCast() & 1) != 0)
    {
      v10 = v22;
      if (*(_QWORD *)(v22 + 16))
      {
        v11 = sub_242944C5C(114, 0xE100000000000000);
        if ((v12 & 1) != 0)
        {
          if (*(_QWORD *)(v10 + 16))
          {
            v13 = *(double *)(*(_QWORD *)(v10 + 56) + 8 * v11);
            v14 = sub_242944C5C(103, 0xE100000000000000);
            if ((v15 & 1) != 0)
            {
              if (*(_QWORD *)(v10 + 16))
              {
                v16 = *(double *)(*(_QWORD *)(v10 + 56) + 8 * v14);
                v17 = sub_242944C5C(98, 0xE100000000000000);
                if ((v18 & 1) != 0)
                {
                  v19 = *(double *)(*(_QWORD *)(v10 + 56) + 8 * v17);
                  swift_bridgeObjectRelease();
                  (*(void (**)(char *, _QWORD, uint64_t))(v2 + 104))(v4, *MEMORY[0x24BDF3C28], v1);
                  return MEMORY[0x2494E8B34](v4, v13, v16, v19, 1.0);
                }
              }
            }
          }
        }
      }
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    sub_242945BA8((uint64_t)&v25, &qword_2572077B0);
  }
  return HMActionSet.defaultTint.getter();
}

uint64_t HMActionSet.defaultTint.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  id v10;
  uint64_t v11;
  uint64_t v13;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_257207A20);
  v1 = MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v1);
  v5 = (char *)&v13 - v4;
  sub_242963BCC();
  v6 = sub_242963BC0();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
    goto LABEL_2;
  sub_24294ADF4((uint64_t)v5, (uint64_t)v3);
  v9 = (*(uint64_t (**)(char *, uint64_t))(v7 + 88))(v3, v6);
  if (v9 == *MEMORY[0x24BE4EB78] || v9 == *MEMORY[0x24BE4EB90])
  {
    v10 = objc_msgSend((id)objc_opt_self(), sel_systemOrangeColor);
LABEL_10:
    v8 = MEMORY[0x2494E8B40](v10);
    goto LABEL_11;
  }
  if (v9 == *MEMORY[0x24BE4EBA8])
  {
    v10 = objc_msgSend((id)objc_opt_self(), sel_systemYellowColor);
    goto LABEL_10;
  }
  if (v9 == *MEMORY[0x24BE4EBA0])
  {
    v10 = objc_msgSend((id)objc_opt_self(), sel_systemIndigoColor);
    goto LABEL_10;
  }
  (*(void (**)(char *, uint64_t))(v7 + 8))(v3, v6);
LABEL_2:
  v8 = _sSo11HMActionSetC15NanoHomeIntentsE15backupTintColor7SwiftUI0H0Vvg_0();
LABEL_11:
  v11 = v8;
  sub_242945BA8((uint64_t)v5, &qword_257207A20);
  return v11;
}

uint64_t HMActionSet.umbrellaCategories.getter()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = objc_msgSend(v0, sel_actions);
  sub_24294AE3C();
  sub_24294AE80((unint64_t *)&qword_257207A30, (uint64_t (*)(uint64_t))sub_24294AE3C, MEMORY[0x24BEE5BD8]);
  v2 = sub_242963B9C();

  sub_24294A6D8(MEMORY[0x24BEE4B08], v2);
  v4 = v3;
  swift_bridgeObjectRelease();
  return v4;
}

void sub_24294A6D8(_BYTE *a1, uint64_t a2)
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
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  id v28;
  int64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  unint64_t v44;
  void (*v45)(unint64_t, char *, uint64_t);
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  _BYTE *v50;
  char *v51;
  uint64_t v52;
  char v53;
  void (*v54)(char *, uint64_t);
  uint64_t v55;
  void *v56;
  char *v57;
  uint64_t v58;
  _BYTE *v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  uint64_t v63;
  __int128 v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  uint64_t v71;
  _BYTE *v72;
  uint64_t v73;
  void (*v74)(char *, unint64_t, uint64_t);
  char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  int64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;

  v4 = sub_242963974();
  v67 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v66 = (char *)&v60 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_24296398C();
  v76 = *(_QWORD *)(v6 - 8);
  v77 = v6;
  v7 = MEMORY[0x24BDAC7A8](v6);
  v75 = (char *)&v60 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v60 - v10;
  v12 = MEMORY[0x24BDAC7A8](v9);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v60 - v13;
  v68 = v4;
  v65 = v15;
  if ((a2 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_242963C80();
    sub_24294AE3C();
    sub_24294AE80((unint64_t *)&qword_257207A30, (uint64_t (*)(uint64_t))sub_24294AE3C, MEMORY[0x24BEE5BD8]);
    sub_242963BA8();
    a2 = v83;
    v16 = v84;
    v17 = v85;
    v18 = v86;
    v19 = v87;
  }
  else
  {
    v20 = -1 << *(_BYTE *)(a2 + 32);
    v16 = a2 + 56;
    v17 = ~v20;
    v21 = -v20;
    if (v21 < 64)
      v22 = ~(-1 << v21);
    else
      v22 = -1;
    v19 = v22 & *(_QWORD *)(a2 + 56);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v18 = 0;
  }
  v70 = v14;
  v69 = v17;
  v79 = a2 & 0x7FFFFFFFFFFFFFFFLL;
  v80 = (unint64_t)(v17 + 64) >> 6;
  v64 = xmmword_242964B70;
  v78 = MEMORY[0x24BEE4AD0] + 8;
LABEL_8:
  v23 = v19;
  while (a2 < 0)
  {
    v27 = sub_242963C98();
    if (!v27)
      goto LABEL_43;
    v82 = v27;
    sub_24294AE3C();
    swift_unknownObjectRetain();
    swift_dynamicCast();
    v28 = v88;
    swift_unknownObjectRelease();
    v25 = v18;
    v24 = v23;
    if (!v28)
      goto LABEL_43;
LABEL_34:
    objc_opt_self();
    v32 = swift_dynamicCastObjCClass();
    if (v32)
    {
      v33 = (void *)v32;
      v81 = v25;
      v19 = v24;
      v34 = v28;
      v35 = objc_msgSend(v33, sel_characteristic);
      v36 = objc_msgSend(v35, sel_service);

      if (v36)
      {
        v37 = v66;
        sub_242963C2C();

        v38 = v65;
        sub_242963950();
        (*(void (**)(char *, uint64_t))(v67 + 8))(v37, v68);
        v39 = v76;
        v40 = v38;
        v41 = v77;
        (*(void (**)(char *, uint64_t, uint64_t))(v76 + 32))(v70, v40, v77);
        __swift_instantiateConcreteTypeFromMangledName(&qword_257207A38);
        v42 = (*(unsigned __int8 *)(v39 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v39 + 80);
        v73 = *(_QWORD *)(v39 + 72);
        v43 = swift_allocObject();
        *(_OWORD *)(v43 + 16) = v64;
        v60 = v43;
        v44 = v43 + v42;
        v45 = *(void (**)(unint64_t, char *, uint64_t))(v39 + 16);
        v45(v44, v70, v41);
        swift_bridgeObjectRetain();
        v62 = v44;
        v74 = (void (*)(char *, unint64_t, uint64_t))v45;
        v45((unint64_t)v11, (char *)v44, v41);
        sub_24294AE80(&qword_257207A40, (uint64_t (*)(uint64_t))MEMORY[0x24BE4E130], MEMORY[0x24BE4E148]);
        swift_bridgeObjectRetain();
        v46 = sub_242963A58();
        v47 = -1 << a1[32];
        v48 = v46 & ~v47;
        v72 = a1 + 56;
        v49 = *(_QWORD *)&a1[((v48 >> 3) & 0xFFFFFFFFFFFFF8) + 56] >> v48;
        v61 = a2;
        v63 = v16;
        if ((v49 & 1) != 0)
        {
          v71 = ~v47;
          while (1)
          {
            v50 = a1;
            v51 = v75;
            v52 = v77;
            v74(v75, *((_QWORD *)a1 + 6) + v48 * v73, v77);
            sub_24294AE80(&qword_257207A48, (uint64_t (*)(uint64_t))MEMORY[0x24BE4E130], MEMORY[0x24BE4E150]);
            v53 = sub_242963A64();
            v54 = *(void (**)(char *, uint64_t))(v76 + 8);
            v54(v51, v52);
            if ((v53 & 1) != 0)
              break;
            v48 = (v48 + 1) & v71;
            a1 = v50;
            if (((*(_QWORD *)&v72[(v48 >> 3) & 0xFFFFFFFFFFFFF8] >> v48) & 1) == 0)
              goto LABEL_40;
          }
          swift_bridgeObjectRelease();
          v59 = v50;
          v58 = v77;
          a2 = v61;
          v57 = v11;
          v54(v11, v77);
        }
        else
        {
LABEL_40:
          swift_bridgeObjectRelease();
          LODWORD(v73) = swift_isUniquelyReferenced_nonNull_native();
          v55 = (uint64_t)v75;
          v56 = a1;
          v57 = v11;
          v58 = v77;
          v74(v75, (unint64_t)v11, v77);
          v88 = v56;
          sub_2429563F8(v55, v48, v73);
          v59 = v88;
          swift_bridgeObjectRelease();
          v54 = *(void (**)(char *, uint64_t))(v76 + 8);
          a2 = v61;
          v54(v11, v58);
        }
        swift_setDeallocating();
        swift_arrayDestroy();
        swift_deallocClassInstance();

        v54(v70, v58);
        swift_bridgeObjectRelease();

        v11 = v57;
        a1 = v59;
        v16 = v63;
        v18 = v81;
        goto LABEL_8;
      }

      v24 = v19;
      v25 = v81;
    }

    v18 = v25;
    v23 = v24;
  }
  if (v23)
  {
    v24 = (v23 - 1) & v23;
    v26 = __clz(__rbit64(v23)) | (v18 << 6);
    v25 = v18;
LABEL_33:
    v28 = *(id *)(*(_QWORD *)(a2 + 48) + 8 * v26);
    if (!v28)
      goto LABEL_43;
    goto LABEL_34;
  }
  v29 = v18 + 1;
  if (!__OFADD__(v18, 1))
  {
    if (v29 >= v80)
      goto LABEL_43;
    v30 = *(_QWORD *)(v16 + 8 * v29);
    v25 = v18 + 1;
    if (!v30)
    {
      v25 = v18 + 2;
      if (v18 + 2 >= v80)
        goto LABEL_43;
      v30 = *(_QWORD *)(v16 + 8 * v25);
      if (!v30)
      {
        v25 = v18 + 3;
        if (v18 + 3 >= v80)
          goto LABEL_43;
        v30 = *(_QWORD *)(v16 + 8 * v25);
        if (!v30)
        {
          v25 = v18 + 4;
          if (v18 + 4 >= v80)
            goto LABEL_43;
          v30 = *(_QWORD *)(v16 + 8 * v25);
          if (!v30)
          {
            v25 = v18 + 5;
            if (v18 + 5 >= v80)
              goto LABEL_43;
            v30 = *(_QWORD *)(v16 + 8 * v25);
            if (!v30)
            {
              v31 = v18 + 6;
              while (v80 != v31)
              {
                v30 = *(_QWORD *)(v16 + 8 * v31++);
                if (v30)
                {
                  v25 = v31 - 1;
                  goto LABEL_32;
                }
              }
LABEL_43:
              sub_24294AE78();
              return;
            }
          }
        }
      }
    }
LABEL_32:
    v24 = (v30 - 1) & v30;
    v26 = __clz(__rbit64(v30)) + (v25 << 6);
    goto LABEL_33;
  }
  __break(1u);
}

uint64_t sub_24294ADF4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257207A20);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_24294AE3C()
{
  unint64_t result;

  result = qword_257207A28;
  if (!qword_257207A28)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_257207A28);
  }
  return result;
}

uint64_t sub_24294AE78()
{
  return swift_release();
}

uint64_t sub_24294AE80(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x2494E92B4](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24294AEC0()
{
  uint64_t result;
  uint64_t v1;

  result = _s15NanoHomeIntents21NHOIntentLocalizationC15localizedStringyS2SFZ_0(0x4C5F544547444957, 0xEF524548434E5541);
  qword_257207A50 = result;
  *(_QWORD *)algn_257207A58 = v1;
  return result;
}

uint64_t static NHOIntentLocalization.launcherWidgetName.getter()
{
  return sub_24294B264(&qword_2572076E0, &qword_257207A50);
}

uint64_t sub_24294AF44()
{
  uint64_t result;
  uint64_t v1;

  result = _s15NanoHomeIntents21NHOIntentLocalizationC15localizedStringyS2SFZ_0(0xD00000000000001DLL, 0x80000002429663E0);
  qword_257207A60 = result;
  *(_QWORD *)algn_257207A68 = v1;
  return result;
}

uint64_t static NHOIntentLocalization.smartStackWidgetName.getter()
{
  return sub_24294B264(&qword_2572076E8, &qword_257207A60);
}

uint64_t sub_24294AFBC()
{
  uint64_t result;
  uint64_t v1;

  result = _s15NanoHomeIntents21NHOIntentLocalizationC15localizedStringyS2SFZ_0(0xD00000000000001DLL, 0x80000002429663C0);
  qword_257207A70 = result;
  *(_QWORD *)algn_257207A78 = v1;
  return result;
}

uint64_t static NHOIntentLocalization.actionSetRectangularWidgetText.getter()
{
  return sub_24294B264(&qword_2572076F0, &qword_257207A70);
}

uint64_t sub_24294B034()
{
  uint64_t result;
  uint64_t v1;

  result = _s15NanoHomeIntents21NHOIntentLocalizationC15localizedStringyS2SFZ_0(0xD00000000000001CLL, 0x80000002429663A0);
  qword_257207A80 = result;
  *(_QWORD *)algn_257207A88 = v1;
  return result;
}

uint64_t static NHOIntentLocalization.forecastEnergyWidgetName.getter()
{
  return sub_24294B264(&qword_2572076F8, &qword_257207A80);
}

uint64_t sub_24294B0AC()
{
  uint64_t result;
  uint64_t v1;

  result = _s15NanoHomeIntents21NHOIntentLocalizationC15localizedStringyS2SFZ_0(0xD000000000000017, 0x8000000242966380);
  qword_257207A90 = result;
  *(_QWORD *)algn_257207A98 = v1;
  return result;
}

uint64_t static NHOIntentLocalization.currentLocationEnergyWidgetName.getter()
{
  return sub_24294B264(&qword_257207700, &qword_257207A90);
}

uint64_t static NHOIntentLocalization.homeSpecificEnergyWidgetName(homeName:)(uint64_t a1, uint64_t a2)
{
  return sub_24294B358(a1, a2, 0xD000000000000014, 0x80000002429661C0);
}

uint64_t sub_24294B15C()
{
  uint64_t result;
  uint64_t v1;

  result = _s15NanoHomeIntents21NHOIntentLocalizationC15localizedStringyS2SFZ_0(0xD00000000000001CLL, 0x8000000242966360);
  qword_257207AA0 = result;
  *(_QWORD *)algn_257207AA8 = v1;
  return result;
}

uint64_t static NHOIntentLocalization.electricityUsageWidgetName.getter()
{
  return sub_24294B264(&qword_257207708, &qword_257207AA0);
}

uint64_t static NHOIntentLocalization.homeSpecificElectricityUsageWidgetName(homeName:)(uint64_t a1, uint64_t a2)
{
  return sub_24294B358(a1, a2, 0xD000000000000020, 0x80000002429661E0);
}

uint64_t sub_24294B20C()
{
  uint64_t result;
  uint64_t v1;

  result = _s15NanoHomeIntents21NHOIntentLocalizationC15localizedStringyS2SFZ_0(0xD00000000000001CLL, 0x8000000242966340);
  qword_257207AB0 = result;
  *(_QWORD *)algn_257207AB8 = v1;
  return result;
}

uint64_t static NHOIntentLocalization.electricityRatesWidgetName.getter()
{
  return sub_24294B264(&qword_257207710, &qword_257207AB0);
}

uint64_t sub_24294B264(_QWORD *a1, uint64_t *a2)
{
  uint64_t v3;

  if (*a1 != -1)
    swift_once();
  v3 = *a2;
  swift_bridgeObjectRetain();
  return v3;
}

id sub_24294B2D4(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  void *v3;

  if (*a3 != -1)
    swift_once();
  swift_bridgeObjectRetain();
  v3 = (void *)sub_242963A7C();
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t static NHOIntentLocalization.homeSpecificElectricityRatesWidgetName(homeName:)(uint64_t a1, uint64_t a2)
{
  return sub_24294B358(a1, a2, 0xD000000000000020, 0x8000000242966210);
}

uint64_t sub_24294B358(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;

  _s15NanoHomeIntents21NHOIntentLocalizationC15localizedStringyS2SFZ_0(a3, a4);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257207AC0);
  v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_242964B70;
  *(_QWORD *)(v6 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v6 + 64) = sub_24294B798();
  *(_QWORD *)(v6 + 32) = a1;
  *(_QWORD *)(v6 + 40) = a2;
  swift_bridgeObjectRetain();
  v7 = sub_242963A94();
  swift_bridgeObjectRelease();
  return v7;
}

id sub_24294B428(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v7 = sub_242963A88();
  v9 = v8;
  _s15NanoHomeIntents21NHOIntentLocalizationC15localizedStringyS2SFZ_0(a4, a5);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257207AC0);
  v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_242964B70;
  *(_QWORD *)(v10 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v10 + 64) = sub_24294B798();
  *(_QWORD *)(v10 + 32) = v7;
  *(_QWORD *)(v10 + 40) = v9;
  swift_bridgeObjectRetain();
  sub_242963A94();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v11 = (void *)sub_242963A7C();
  swift_bridgeObjectRelease();
  return v11;
}

id NHOIntentLocalization.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id NHOIntentLocalization.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_init);
}

id NHOIntentLocalization.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t _s15NanoHomeIntents21NHOIntentLocalizationC15localizedStringyS2SFZ_0(uint64_t a1, uint64_t a2)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  void *v13;
  void *v14;
  id v15;

  v4 = (void *)sub_242963A7C();
  v5 = objc_msgSend((id)objc_opt_self(), sel_bundleWithIdentifier_, v4);

  if (v5)
  {
    v6 = (void *)sub_242963A7C();
    v7 = (void *)sub_242963A7C();
    v8 = objc_msgSend(v5, sel_localizedStringForKey_value_table_, v6, 0, v7);

    v9 = sub_242963A88();
    v11 = v10;

    v12 = v9 == a1 && v11 == a2;
    if (v12 || (sub_242963DA0() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      v13 = (void *)sub_242963A7C();
      v14 = (void *)sub_242963A7C();
      v15 = objc_msgSend(v5, sel_localizedStringForKey_value_table_, v13, 0, v14);

      a1 = sub_242963A88();
    }
    else
    {

      return v9;
    }
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  return a1;
}

unint64_t sub_24294B798()
{
  unint64_t result;

  result = qword_257207AC8;
  if (!qword_257207AC8)
  {
    result = MEMORY[0x2494E92B4](MEMORY[0x24BDCFB50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_257207AC8);
  }
  return result;
}

uint64_t type metadata accessor for NHOIntentLocalization()
{
  return objc_opt_self();
}

unint64_t static Logger.sub.getter()
{
  return 0xD000000000000012;
}

uint64_t sub_24294B818(uint64_t a1)
{
  return sub_24294B9FC(a1, qword_257207AF8);
}

uint64_t static Logger.appIntents.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24294B8A0(&qword_257207718, (uint64_t)qword_257207AF8, a1);
}

uint64_t sub_24294B858(uint64_t a1)
{
  return sub_24294B9FC(a1, qword_257207B10);
}

uint64_t static Logger.intentPerformer.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24294B8A0(&qword_257207720, (uint64_t)qword_257207B10, a1);
}

uint64_t sub_24294B8A0@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;

  if (*a1 != -1)
    swift_once();
  v5 = sub_2429639D4();
  v6 = __swift_project_value_buffer(v5, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a3, v6, v5);
}

uint64_t sub_24294B908(uint64_t a1)
{
  return sub_24294B9FC(a1, qword_257207B28);
}

uint64_t static Logger.lastAction.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24294B8A0(&qword_257207728, (uint64_t)qword_257207B28, a1);
}

uint64_t sub_24294B948(uint64_t a1)
{
  return sub_24294B9FC(a1, qword_257207B40);
}

uint64_t static Logger.homeExtensions.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24294B8A0(&qword_257207730, (uint64_t)qword_257207B40, a1);
}

uint64_t sub_24294B990(uint64_t a1)
{
  return sub_24294B9FC(a1, qword_257207B58);
}

uint64_t static Logger.accessoryWidget.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24294B8A0(&qword_257207738, (uint64_t)qword_257207B58, a1);
}

uint64_t sub_24294B9D8(uint64_t a1)
{
  return sub_24294B9FC(a1, qword_257207B70);
}

uint64_t sub_24294B9FC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_2429639D4();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_2429639C8();
}

uint64_t static Logger.userCapabilities.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_24294B8A0(&qword_257207740, (uint64_t)qword_257207B70, a1);
}

uint64_t NHOSmartStackAction.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_24294BAC4 + 4 * byte_242964BC0[*v0]))(0x726F737365636361, 0xE900000000000079);
}

uint64_t sub_24294BAC4()
{
  return 0x65536E6F69746361;
}

uint64_t sub_24294BADC()
{
  return 0x746867694C6C6C61;
}

uint64_t sub_24294BAF8()
{
  return 0x6B616570536C6C61;
}

uint64_t sub_24294BB18()
{
  return 0x736B636F4C6C6C61;
}

NanoHomeIntents::NHOSmartStackAction_optional __swiftcall NHOSmartStackAction.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  NanoHomeIntents::NHOSmartStackAction_optional result;
  char v5;

  v2 = v1;
  v3 = sub_242963D88();
  result.value = swift_bridgeObjectRelease();
  v5 = 5;
  if (v3 < 5)
    v5 = v3;
  *v2 = v5;
  return result;
}

void sub_24294BB88(char a1)
{
  __asm { BR              X11 }
}

uint64_t sub_24294BBE0(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_24294BC68 + 4 * byte_242964BCA[a2]))(0x65536E6F69746361);
}

uint64_t sub_24294BC68@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  char v3;

  if (a1 == 0x65536E6F69746361 && v2 == a2 + 1)
    v3 = 1;
  else
    v3 = sub_242963DA0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

void sub_24294BD38(char *a1)
{
  sub_24294BB88(*a1);
}

void sub_24294BD44()
{
  unsigned __int8 *v0;
  uint64_t v1;

  v1 = *v0;
  sub_242963DC4();
  __asm { BR              X9 }
}

uint64_t sub_24294BD9C()
{
  sub_242963AC4();
  swift_bridgeObjectRelease();
  return sub_242963DDC();
}

void sub_24294BE34()
{
  __asm { BR              X11 }
}

uint64_t sub_24294BE78()
{
  sub_242963AC4();
  return swift_bridgeObjectRelease();
}

void sub_24294BEF8()
{
  unsigned __int8 *v0;
  uint64_t v1;

  v1 = *v0;
  sub_242963DC4();
  __asm { BR              X9 }
}

uint64_t sub_24294BF4C()
{
  sub_242963AC4();
  swift_bridgeObjectRelease();
  return sub_242963DDC();
}

NanoHomeIntents::NHOSmartStackAction_optional sub_24294BFE4(Swift::String *a1)
{
  return NHOSmartStackAction.init(rawValue:)(*a1);
}

uint64_t sub_24294BFF0()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(void))((char *)sub_24294C028 + 4 * byte_242964BDE[*v0]))();
}

void sub_24294C028(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = 0x65536E6F69746361;
  a1[1] = v1 + 1;
}

void sub_24294C044(_QWORD *a1@<X8>)
{
  *a1 = 0x746867694C6C6C61;
  a1[1] = 0xE900000000000073;
}

void sub_24294C064(_QWORD *a1@<X8>)
{
  *a1 = 0x6B616570536C6C61;
  a1[1] = 0xEB00000000737265;
}

void sub_24294C088(_QWORD *a1@<X8>)
{
  *a1 = 0x736B636F4C6C6C61;
  a1[1] = 0xE800000000000000;
}

uint64_t static NHOSmartStackAction.typeDisplayRepresentation.getter()
{
  return sub_242963800();
}

void sub_24294C0C0()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;

  __swift_instantiateConcreteTypeFromMangledName(&qword_257207D10);
  v0 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_257207D18) - 8);
  v1 = *(_QWORD *)(v0 + 72);
  v2 = (*(unsigned __int8 *)(v0 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 80);
  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_242964FF0;
  v4 = (_BYTE *)(v3 + v2);
  *v4 = 0;
  sub_2429637C4();
  v4[v1] = 1;
  sub_2429637C4();
  v4[2 * v1] = 2;
  sub_2429637C4();
  v4[3 * v1] = 3;
  sub_2429637C4();
  v4[4 * v1] = 4;
  sub_2429637C4();
  sub_24294C24C(v3);
  qword_257207B88 = v5;
}

void sub_24294C24C(uint64_t a1)
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
  char v14;
  unint64_t v15;
  char v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;
  _QWORD v23[2];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_257207D18);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(_QWORD *)(a1 + 16)
    && (__swift_instantiateConcreteTypeFromMangledName(&qword_257207D20),
        v6 = sub_242963D70(),
        v7 = (_QWORD *)v6,
        (v8 = *(_QWORD *)(a1 + 16)) != 0))
  {
    v9 = &v5[*(int *)(v2 + 48)];
    v10 = v6 + 64;
    v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
    v23[1] = a1;
    v12 = a1 + v11;
    v13 = *(_QWORD *)(v3 + 72);
    swift_retain();
    while (1)
    {
      sub_24294ED64(v12, (uint64_t)v5);
      v14 = *v5;
      sub_242944CF0(*v5);
      if ((v16 & 1) != 0)
        break;
      v17 = v15;
      *(_QWORD *)(v10 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      *(_BYTE *)(v7[6] + v15) = v14;
      v18 = v7[7];
      v19 = sub_2429637D0();
      (*(void (**)(unint64_t, char *, uint64_t))(*(_QWORD *)(v19 - 8) + 32))(v18 + *(_QWORD *)(*(_QWORD *)(v19 - 8) + 72) * v17, v9, v19);
      v20 = v7[2];
      v21 = __OFADD__(v20, 1);
      v22 = v20 + 1;
      if (v21)
        goto LABEL_10;
      v7[2] = v22;
      v12 += v13;
      if (!--v8)
      {
        swift_release();
        goto LABEL_8;
      }
    }
    __break(1u);
LABEL_10:
    __break(1u);
  }
  else
  {
LABEL_8:
    swift_bridgeObjectRelease();
  }
}

uint64_t static NHOSmartStackAction.caseDisplayRepresentations.getter()
{
  if (qword_257207748 != -1)
    swift_once();
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t static NHOSmartStackAction.caseDisplayRepresentations.setter(uint64_t a1)
{
  if (qword_257207748 != -1)
    swift_once();
  swift_beginAccess();
  qword_257207B88 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*static NHOSmartStackAction.caseDisplayRepresentations.modify())()
{
  if (qword_257207748 != -1)
    swift_once();
  swift_beginAccess();
  return j__swift_endAccess;
}

void *static NHOSmartStackAction.allCases.getter()
{
  return &unk_251366B80;
}

uint64_t sub_24294C538()
{
  return sub_242963800();
}

uint64_t sub_24294C554()
{
  sub_24294E060();
  return sub_2429636EC();
}

uint64_t sub_24294C58C()
{
  if (qword_257207748 != -1)
    swift_once();
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t sub_24294C5F8()
{
  sub_24294E6D0();
  return sub_2429637E8();
}

void sub_24294C630(_QWORD *a1@<X8>)
{
  *a1 = &unk_251366BA8;
}

uint64_t sub_24294C640()
{
  uint64_t v0;

  v0 = sub_242963824();
  __swift_allocate_value_buffer(v0, qword_257207B90);
  __swift_project_value_buffer(v0, (uint64_t)qword_257207B90);
  return sub_242963818();
}

uint64_t static NHOSmartStackActionIntent.title.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_242948F3C(&qword_257207750, (uint64_t (*)(_QWORD))MEMORY[0x24BDCD380], (uint64_t)qword_257207B90, a1);
}

uint64_t static NHOSmartStackActionIntent.title.setter(uint64_t a1)
{
  return sub_242948FEC(a1, &qword_257207750, (uint64_t (*)(_QWORD))MEMORY[0x24BDCD380], (uint64_t)qword_257207B90);
}

uint64_t (*static NHOSmartStackActionIntent.title.modify())()
{
  uint64_t v0;

  if (qword_257207750 != -1)
    swift_once();
  v0 = sub_242963824();
  __swift_project_value_buffer(v0, (uint64_t)qword_257207B90);
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_24294C760()
{
  uint64_t v0;

  v0 = sub_2429637B8();
  __swift_allocate_value_buffer(v0, qword_257207BA8);
  __swift_project_value_buffer(v0, (uint64_t)qword_257207BA8);
  return sub_2429637AC();
}

uint64_t static NHOSmartStackActionIntent.description.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_242948F3C(&qword_257207758, (uint64_t (*)(_QWORD))MEMORY[0x24BDB5800], (uint64_t)qword_257207BA8, a1);
}

uint64_t static NHOSmartStackActionIntent.description.setter(uint64_t a1)
{
  return sub_242948FEC(a1, &qword_257207758, (uint64_t (*)(_QWORD))MEMORY[0x24BDB5800], (uint64_t)qword_257207BA8);
}

uint64_t (*static NHOSmartStackActionIntent.description.modify())()
{
  uint64_t v0;

  if (qword_257207758 != -1)
    swift_once();
  v0 = sub_2429637B8();
  __swift_project_value_buffer(v0, (uint64_t)qword_257207BA8);
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t NHOSmartStackActionIntent.homeID.getter()
{
  return sub_242949240();
}

uint64_t NHOSmartStackActionIntent.homeID.setter()
{
  return sub_24294930C();
}

uint64_t (*NHOSmartStackActionIntent.homeID.modify(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = *(_QWORD *)(v1 + OBJC_IVAR___NHOSmartStackActionIntent__homeID);
  swift_retain();
  v3[5] = sub_242963758();
  return sub_2429491A0;
}

uint64_t NHOSmartStackActionIntent.$homeID.getter()
{
  return sub_242949494();
}

uint64_t NHOSmartStackActionIntent.homeName.getter()
{
  return sub_242949240();
}

uint64_t NHOSmartStackActionIntent.homeName.setter()
{
  return sub_24294930C();
}

uint64_t (*NHOSmartStackActionIntent.homeName.modify(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = *(_QWORD *)(v1 + OBJC_IVAR___NHOSmartStackActionIntent__homeName);
  swift_retain();
  v3[5] = sub_242963758();
  return sub_2429491A0;
}

uint64_t NHOSmartStackActionIntent.$homeName.getter()
{
  return sub_242949494();
}

uint64_t NHOSmartStackActionIntent.smartStackAction.getter()
{
  swift_retain();
  sub_242963764();
  return swift_release();
}

uint64_t sub_24294C9F4@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;
  char v3;

  swift_retain();
  sub_242963764();
  result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t NHOSmartStackActionIntent.smartStackAction.setter()
{
  swift_retain();
  sub_242963770();
  return swift_release();
}

uint64_t (*NHOSmartStackActionIntent.smartStackAction.modify(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = *(_QWORD *)(v1 + OBJC_IVAR___NHOSmartStackActionIntent__smartStackAction);
  swift_retain();
  v3[5] = sub_242963758();
  return sub_2429491A0;
}

uint64_t NHOSmartStackActionIntent.$smartStackAction.getter()
{
  return sub_242949494();
}

uint64_t NHOSmartStackActionIntent.actionID.getter()
{
  return sub_242949240();
}

uint64_t NHOSmartStackActionIntent.actionID.setter()
{
  return sub_24294930C();
}

uint64_t (*NHOSmartStackActionIntent.actionID.modify(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = *(_QWORD *)(v1 + OBJC_IVAR___NHOSmartStackActionIntent__actionID);
  swift_retain();
  v3[5] = sub_242963758();
  return sub_2429491A0;
}

uint64_t NHOSmartStackActionIntent.$actionID.getter()
{
  return sub_242949494();
}

uint64_t NHOSmartStackActionIntent.actionName.getter()
{
  return sub_242949240();
}

uint64_t NHOSmartStackActionIntent.actionName.setter()
{
  return sub_24294930C();
}

uint64_t (*NHOSmartStackActionIntent.actionName.modify(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = *(_QWORD *)(v1 + OBJC_IVAR___NHOSmartStackActionIntent__actionName);
  swift_retain();
  v3[5] = sub_242963758();
  return sub_2429491A0;
}

uint64_t NHOSmartStackActionIntent.$actionName.getter()
{
  return sub_242949494();
}

uint64_t NHOSmartStackActionIntent.icon.getter()
{
  return sub_242949240();
}

uint64_t NHOSmartStackActionIntent.icon.setter()
{
  return sub_24294930C();
}

uint64_t (*NHOSmartStackActionIntent.icon.modify(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = *(_QWORD *)(v1 + OBJC_IVAR___NHOSmartStackActionIntent__icon);
  swift_retain();
  v3[5] = sub_242963758();
  return sub_2429491A0;
}

uint64_t NHOSmartStackActionIntent.$icon.getter()
{
  return sub_242949494();
}

uint64_t NHOSmartStackActionIntent.useHomeKitRecommendations.getter()
{
  unsigned __int8 v1;

  swift_retain();
  sub_242963764();
  swift_release();
  return v1;
}

uint64_t NHOSmartStackActionIntent.useHomeKitRecommendations.setter()
{
  swift_retain();
  sub_242963770();
  return swift_release();
}

uint64_t sub_24294CE0C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;
  char v3;

  swift_retain();
  sub_242963764();
  result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_24294CE60()
{
  swift_retain();
  sub_242963770();
  return swift_release();
}

uint64_t (*NHOSmartStackActionIntent.useHomeKitRecommendations.modify(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = *(_QWORD *)(v1 + OBJC_IVAR___NHOSmartStackActionIntent__useHomeKitRecommendations);
  swift_retain();
  v3[5] = sub_242963758();
  return sub_2429491A0;
}

uint64_t NHOSmartStackActionIntent.$useHomeKitRecommendations.getter()
{
  return sub_242949494();
}

uint64_t NHOSmartStackActionIntent.accessoriesAndScenes.getter()
{
  uint64_t v1;

  swift_retain();
  sub_242963764();
  swift_release();
  return v1;
}

uint64_t NHOSmartStackActionIntent.accessoriesAndScenes.setter()
{
  swift_retain();
  sub_242963770();
  return swift_release();
}

uint64_t sub_24294D078@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;

  swift_retain();
  sub_242963764();
  result = swift_release();
  *a1 = v3;
  a1[1] = v4;
  return result;
}

uint64_t sub_24294D0CC()
{
  swift_bridgeObjectRetain();
  swift_retain();
  sub_242963770();
  return swift_release();
}

uint64_t (*NHOSmartStackActionIntent.accessoriesAndScenes.modify(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = *(_QWORD *)(v1 + OBJC_IVAR___NHOSmartStackActionIntent__accessoriesAndScenes);
  swift_retain();
  v3[5] = sub_242963758();
  return sub_2429491A0;
}

uint64_t NHOSmartStackActionIntent.$accessoriesAndScenes.getter()
{
  return sub_242949494();
}

uint64_t NHOSmartStackActionIntent.requestConfirmationText.getter()
{
  return sub_242949240();
}

uint64_t NHOSmartStackActionIntent.requestConfirmationText.setter()
{
  return sub_24294930C();
}

uint64_t (*NHOSmartStackActionIntent.requestConfirmationText.modify(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = *(_QWORD *)(v1 + OBJC_IVAR___NHOSmartStackActionIntent__requestConfirmationText);
  swift_retain();
  v3[5] = sub_242963758();
  return sub_2429491A0;
}

uint64_t NHOSmartStackActionIntent.$requestConfirmationText.getter()
{
  return sub_242949494();
}

uint64_t NHOSmartStackActionIntent.requestConfirmationIcon.getter()
{
  return sub_242949240();
}

uint64_t NHOSmartStackActionIntent.requestConfirmationIcon.setter()
{
  return sub_24294930C();
}

uint64_t (*NHOSmartStackActionIntent.requestConfirmationIcon.modify(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = *(_QWORD *)(v1 + OBJC_IVAR___NHOSmartStackActionIntent__requestConfirmationIcon);
  swift_retain();
  v3[5] = sub_242963758();
  return sub_2429491A0;
}

uint64_t NHOSmartStackActionIntent.$requestConfirmationIcon.getter()
{
  return sub_242949494();
}

uint64_t NHOSmartStackActionIntent.isSmartStack.getter()
{
  unsigned __int8 v1;

  swift_retain();
  sub_242963764();
  swift_release();
  return v1;
}

uint64_t sub_24294D2DC@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;
  char v3;

  swift_retain();
  sub_242963764();
  result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_24294D330()
{
  swift_retain();
  sub_242963770();
  return swift_release();
}

uint64_t NHOSmartStackActionIntent.isSmartStack.setter()
{
  swift_retain();
  sub_242963770();
  return swift_release();
}

uint64_t (*NHOSmartStackActionIntent.isSmartStack.modify(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = *(_QWORD *)(v1 + OBJC_IVAR___NHOSmartStackActionIntent__isSmartStack);
  swift_retain();
  v3[5] = sub_242963758();
  return sub_2429491A0;
}

uint64_t NHOSmartStackActionIntent.$isSmartStack.getter()
{
  return sub_242949494();
}

id NHOSmartStackActionIntent.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id NHOSmartStackActionIntent.init()()
{
  void *v0;
  void *v1;
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
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  void (*v23)(char *, uint64_t, uint64_t, uint64_t);
  char *v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  char *v28;
  void (*v29)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v30;
  void (*v31)(char *, uint64_t, uint64_t, uint64_t);
  void (*v32)(char *, uint64_t, uint64_t);
  char *v33;
  uint64_t v34;
  id v35;
  char *v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  void (*v41)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v42;
  void (*v43)(char *, uint64_t, uint64_t, uint64_t);
  void (*v44)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v45;
  void (*v46)(char *, uint64_t, uint64_t);
  uint64_t v47;
  char *v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  id v53;
  uint64_t v54;
  void (*v55)(char *, uint64_t, uint64_t, uint64_t);
  void (*v56)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v57;
  uint64_t v58;
  char *v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  void (*v63)(char *, uint64_t, uint64_t);
  char *v64;
  char *v65;
  void (*v66)(char *, uint64_t, uint64_t, uint64_t);
  char *v67;
  uint64_t v68;
  void (*v69)(char *, uint64_t, uint64_t, uint64_t);
  char *v70;
  char *v71;
  uint64_t v72;
  void (*v73)(char *, uint64_t, uint64_t, uint64_t);
  char *v74;
  uint64_t v75;
  void (*v76)(char *, uint64_t, uint64_t);
  uint64_t v77;
  char *v78;
  char *v79;
  uint64_t v80;
  id v81;
  id v82;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  void (*v87)(char *, uint64_t, uint64_t, char *);
  char *v88;
  objc_class *ObjectType;
  char *v90;
  char *v91;
  char *v92;
  char *v93;
  char *v94;
  void (*v95)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v96;
  unsigned int v97;
  void (*v98)(char *, uint64_t, uint64_t, uint64_t);
  void (*v99)(char *, uint64_t, uint64_t);
  uint64_t v100;
  void (*v101)(char *, uint64_t, uint64_t, uint64_t);
  id v102;
  uint64_t v103;
  char *v104;
  uint64_t v105;
  uint64_t v106;
  objc_super v107;
  unint64_t v108;
  unint64_t v109;

  v1 = v0;
  ObjectType = (objc_class *)swift_getObjectType();
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_257207C18);
  MEMORY[0x24BDAC7A8](v2);
  v91 = (char *)&v84 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_2429637DC();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v94 = (char *)&v84 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_257207990);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v88 = (char *)&v84 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v84 - v11;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_257207998);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v84 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572079A0);
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)&v84 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = sub_242963824();
  v20 = *(_QWORD *)(v19 - 8);
  v103 = v19;
  MEMORY[0x24BDAC7A8](v19);
  v22 = (char *)&v84 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v87 = (void (*)(char *, uint64_t, uint64_t, char *))OBJC_IVAR___NHOSmartStackActionIntent__homeID;
  v96 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572079A8);
  v102 = v1;
  sub_242963818();
  v101 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v20 + 56);
  v101(v18, 1, 1, v19);
  v100 = sub_242963A70();
  v108 = 0;
  v109 = 0;
  v23 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v100 - 8) + 56);
  v23(v15, 1, 1, v100);
  v95 = v23;
  v106 = sub_242963740();
  v98 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v106 - 8) + 56);
  v24 = v12;
  v98(v12, 1, 1, v106);
  v25 = *MEMORY[0x24BDB6090];
  v99 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 104);
  v26 = v94;
  v97 = v25;
  v27 = v6;
  v105 = v6;
  v99(v94, v25, v6);
  v104 = v22;
  v92 = v18;
  v28 = v24;
  *(_QWORD *)((char *)v87 + v86) = sub_242963794();
  v87 = (void (*)(char *, uint64_t, uint64_t, char *))OBJC_IVAR___NHOSmartStackActionIntent__homeName;
  sub_242963818();
  v29 = v101;
  v101(v18, 1, 1, v103);
  v108 = 0;
  v109 = 0;
  v93 = v15;
  v23(v15, 1, 1, v100);
  v30 = v106;
  v31 = v98;
  v98(v24, 1, 1, v106);
  v32 = v99;
  v99(v26, v25, v27);
  v33 = v92;
  v34 = sub_242963794();
  v35 = v102;
  *(_QWORD *)((char *)v87 + (_QWORD)v102) = v34;
  v87 = (void (*)(char *, uint64_t, uint64_t, char *))OBJC_IVAR___NHOSmartStackActionIntent__smartStackAction;
  v86 = __swift_instantiateConcreteTypeFromMangledName(&qword_257207C20);
  sub_242963818();
  v36 = v33;
  v37 = v33;
  v38 = v103;
  v29(v36, 1, 1, v103);
  LOBYTE(v108) = 5;
  v31(v28, 1, 1, v30);
  v31(v88, 1, 1, v30);
  v39 = v97;
  v32(v26, v97, v105);
  sub_24294E060();
  v40 = v26;
  *(_QWORD *)((char *)v87 + (_QWORD)v35) = sub_242963788();
  v88 = (char *)OBJC_IVAR___NHOSmartStackActionIntent__actionID;
  sub_242963818();
  v41 = v101;
  v101(v37, 1, 1, v38);
  v108 = 0;
  v109 = 0;
  v42 = v100;
  v43 = v95;
  v95(v93, 1, 1, v100);
  v44 = v98;
  v98(v28, 1, 1, v106);
  v45 = v39;
  v46 = v99;
  v99(v40, v45, v105);
  *(_QWORD *)&v88[(_QWORD)v102] = sub_242963794();
  v88 = (char *)OBJC_IVAR___NHOSmartStackActionIntent__actionName;
  sub_242963818();
  v47 = v103;
  v41(v37, 1, 1, v103);
  v108 = 0;
  v109 = 0;
  v48 = v93;
  v43(v93, 1, 1, v42);
  v44(v28, 1, 1, v106);
  v49 = v94;
  v50 = v97;
  v51 = v105;
  v46(v94, v97, v105);
  v52 = sub_242963794();
  v53 = v102;
  *(_QWORD *)&v88[(_QWORD)v102] = v52;
  v88 = (char *)OBJC_IVAR___NHOSmartStackActionIntent__icon;
  sub_242963818();
  v54 = v47;
  v55 = v101;
  v101(v37, 1, 1, v54);
  v108 = 0;
  v109 = 0;
  v95(v48, 1, 1, v100);
  v56 = v98;
  v98(v28, 1, 1, v106);
  v99(v49, v50, v51);
  *(_QWORD *)&v88[(_QWORD)v53] = sub_242963794();
  v86 = OBJC_IVAR___NHOSmartStackActionIntent__useHomeKitRecommendations;
  v85 = __swift_instantiateConcreteTypeFromMangledName(&qword_257207C30);
  sub_242963818();
  v57 = v103;
  v55(v37, 1, 1, v103);
  LOBYTE(v108) = 2;
  v88 = (char *)sub_242963B60();
  v87 = *(void (**)(char *, uint64_t, uint64_t, char *))(*((_QWORD *)v88 - 1) + 56);
  v87(v91, 1, 1, v88);
  v90 = v28;
  v58 = v106;
  v56(v28, 1, 1, v106);
  v59 = v49;
  v60 = v49;
  v61 = v97;
  v62 = v105;
  v63 = v99;
  v99(v60, v97, v105);
  v64 = v92;
  v65 = v59;
  *(_QWORD *)((char *)v102 + v86) = sub_2429637A0();
  v86 = OBJC_IVAR___NHOSmartStackActionIntent__accessoriesAndScenes;
  v85 = __swift_instantiateConcreteTypeFromMangledName(&qword_257207C38);
  sub_242963818();
  v66 = v101;
  v101(v64, 1, 1, v57);
  v108 = 0;
  v109 = 0;
  v67 = v93;
  v68 = v100;
  v69 = v95;
  v95(v93, 1, 1, v100);
  v70 = v90;
  v98(v90, 1, 1, v58);
  v63(v65, v61, v62);
  v71 = v92;
  *(_QWORD *)((char *)v102 + v86) = sub_242963794();
  v86 = OBJC_IVAR___NHOSmartStackActionIntent__requestConfirmationText;
  sub_242963818();
  v72 = v103;
  v66(v71, 1, 1, v103);
  v108 = 0;
  v109 = 0;
  v69(v67, 1, 1, v68);
  v73 = v98;
  v98(v70, 1, 1, v106);
  v74 = v94;
  v75 = v97;
  v76 = v99;
  v99(v94, v97, v105);
  v77 = sub_242963794();
  v78 = (char *)v102;
  *(_QWORD *)((char *)v102 + v86) = v77;
  v86 = OBJC_IVAR___NHOSmartStackActionIntent__requestConfirmationIcon;
  sub_242963818();
  v101(v71, 1, 1, v72);
  v108 = 0;
  v109 = 0;
  v95(v67, 1, 1, v100);
  v79 = v90;
  v73(v90, 1, 1, v106);
  v76(v74, v75, v105);
  *(_QWORD *)&v78[v86] = sub_242963794();
  v80 = OBJC_IVAR___NHOSmartStackActionIntent__isSmartStack;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257207C40);
  sub_242963818();
  v101(v71, 1, 1, v103);
  LOBYTE(v108) = 2;
  v87(v91, 1, 1, v88);
  v73(v79, 1, 1, v106);
  v76(v74, v97, v105);
  *(_QWORD *)&v78[v80] = sub_2429637A0();

  v107.receiver = v78;
  v107.super_class = ObjectType;
  v81 = objc_msgSendSuper2(&v107, sel_init);
  v108 = 0xD000000000000024;
  v109 = 0x8000000242966540;
  v82 = v81;
  swift_retain();
  sub_242963770();
  swift_release();
  LOBYTE(v108) = 1;
  swift_retain();
  sub_242963770();

  swift_release();
  return v82;
}

unint64_t sub_24294E060()
{
  unint64_t result;

  result = qword_257207C28;
  if (!qword_257207C28)
  {
    result = MEMORY[0x2494E92B4](&protocol conformance descriptor for NHOSmartStackAction, &type metadata for NHOSmartStackAction);
    atomic_store(result, (unint64_t *)&qword_257207C28);
  }
  return result;
}

uint64_t NHOSmartStackActionIntent.perform()(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 24) = a1;
  return swift_task_switch();
}

uint64_t sub_24294E0DC()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  uint64_t v7;

  if (qword_257207718 != -1)
    swift_once();
  v1 = sub_2429639D4();
  __swift_project_value_buffer(v1, (uint64_t)qword_257207AF8);
  v2 = sub_2429639BC();
  v3 = sub_242963BFC();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    v5 = swift_slowAlloc();
    v7 = v5;
    *(_DWORD *)v4 = 136315138;
    *(_QWORD *)(v0 + 16) = sub_24294461C(0x286D726F66726570, 0xE900000000000029, &v7);
    sub_242963C5C();
    _os_log_impl(&dword_242941000, v2, v3, "%s Perform method is only supported on watchOS", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2494E932C](v5, -1, -1);
    MEMORY[0x2494E932C](v4, -1, -1);
  }

  sub_24296374C();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

id NHOSmartStackActionIntent.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_24294E35C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_257207750 != -1)
    swift_once();
  v2 = sub_242963824();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_257207B90);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_24294E3F4(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_24294E454;
  v3[3] = a1;
  return swift_task_switch();
}

uint64_t sub_24294E454()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_24294E49C()
{
  sub_24294E928(&qword_257207CB8, (uint64_t)&protocol conformance descriptor for NHOSmartStackActionIntent);
  return sub_242963734();
}

unint64_t sub_24294E4CC()
{
  unint64_t result;

  result = qword_257207C50;
  if (!qword_257207C50)
  {
    result = MEMORY[0x2494E92B4](&protocol conformance descriptor for NHOSmartStackAction, &type metadata for NHOSmartStackAction);
    atomic_store(result, (unint64_t *)&qword_257207C50);
  }
  return result;
}

unint64_t sub_24294E514()
{
  unint64_t result;

  result = qword_257207C58;
  if (!qword_257207C58)
  {
    result = MEMORY[0x2494E92B4](&protocol conformance descriptor for NHOSmartStackAction, &type metadata for NHOSmartStackAction);
    atomic_store(result, (unint64_t *)&qword_257207C58);
  }
  return result;
}

unint64_t sub_24294E55C()
{
  unint64_t result;

  result = qword_257207C60;
  if (!qword_257207C60)
  {
    result = MEMORY[0x2494E92B4](&protocol conformance descriptor for NHOSmartStackAction, &type metadata for NHOSmartStackAction);
    atomic_store(result, (unint64_t *)&qword_257207C60);
  }
  return result;
}

unint64_t sub_24294E5A4()
{
  unint64_t result;

  result = qword_257207C68;
  if (!qword_257207C68)
  {
    result = MEMORY[0x2494E92B4](&protocol conformance descriptor for NHOSmartStackAction, &type metadata for NHOSmartStackAction);
    atomic_store(result, (unint64_t *)&qword_257207C68);
  }
  return result;
}

uint64_t sub_24294E5E8()
{
  return MEMORY[0x24BEE0D78];
}

unint64_t sub_24294E5F8()
{
  unint64_t result;

  result = qword_257207C70;
  if (!qword_257207C70)
  {
    result = MEMORY[0x2494E92B4](&protocol conformance descriptor for NHOSmartStackAction, &type metadata for NHOSmartStackAction);
    atomic_store(result, (unint64_t *)&qword_257207C70);
  }
  return result;
}

unint64_t sub_24294E640()
{
  unint64_t result;

  result = qword_257207C78;
  if (!qword_257207C78)
  {
    result = MEMORY[0x2494E92B4](&protocol conformance descriptor for NHOSmartStackAction, &type metadata for NHOSmartStackAction);
    atomic_store(result, (unint64_t *)&qword_257207C78);
  }
  return result;
}

unint64_t sub_24294E688()
{
  unint64_t result;

  result = qword_257207C80;
  if (!qword_257207C80)
  {
    result = MEMORY[0x2494E92B4](&protocol conformance descriptor for NHOSmartStackAction, &type metadata for NHOSmartStackAction);
    atomic_store(result, (unint64_t *)&qword_257207C80);
  }
  return result;
}

unint64_t sub_24294E6D0()
{
  unint64_t result;

  result = qword_257207C88;
  if (!qword_257207C88)
  {
    result = MEMORY[0x2494E92B4](&protocol conformance descriptor for NHOSmartStackAction, &type metadata for NHOSmartStackAction);
    atomic_store(result, (unint64_t *)&qword_257207C88);
  }
  return result;
}

uint64_t sub_24294E714()
{
  sub_24294E060();
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_24294E758()
{
  unint64_t result;

  result = qword_257207C90;
  if (!qword_257207C90)
  {
    result = MEMORY[0x2494E92B4](&protocol conformance descriptor for NHOSmartStackAction, &type metadata for NHOSmartStackAction);
    atomic_store(result, (unint64_t *)&qword_257207C90);
  }
  return result;
}

unint64_t sub_24294E7A0()
{
  unint64_t result;

  result = qword_257207C98;
  if (!qword_257207C98)
  {
    result = MEMORY[0x2494E92B4](&protocol conformance descriptor for NHOSmartStackAction, &type metadata for NHOSmartStackAction);
    atomic_store(result, (unint64_t *)&qword_257207C98);
  }
  return result;
}

unint64_t sub_24294E7E8()
{
  unint64_t result;

  result = qword_257207CA0;
  if (!qword_257207CA0)
  {
    result = MEMORY[0x2494E92B4](&protocol conformance descriptor for NHOSmartStackAction, &type metadata for NHOSmartStackAction);
    atomic_store(result, (unint64_t *)&qword_257207CA0);
  }
  return result;
}

uint64_t sub_24294E82C()
{
  return sub_24294ED24(&qword_257207CA8, &qword_257207CB0, MEMORY[0x24BEE12E0]);
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2494E92A8](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_24294E89C()
{
  return sub_24294E928(&qword_257207CB8, (uint64_t)&protocol conformance descriptor for NHOSmartStackActionIntent);
}

uint64_t type metadata accessor for NHOSmartStackActionIntent()
{
  return objc_opt_self();
}

uint64_t sub_24294E8E0()
{
  return sub_24294E928(&qword_257207CC0, (uint64_t)&protocol conformance descriptor for NHOSmartStackActionIntent);
}

uint64_t sub_24294E904()
{
  return sub_24294E928((unint64_t *)&unk_257207CC8, (uint64_t)&protocol conformance descriptor for NHOSmartStackActionIntent);
}

uint64_t sub_24294E928(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for NHOSmartStackActionIntent();
    result = MEMORY[0x2494E92B4](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24294E964()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24294E974()
{
  sub_24294E928(&qword_257207CB8, (uint64_t)&protocol conformance descriptor for NHOSmartStackActionIntent);
  return swift_getOpaqueTypeConformance2();
}

double sub_24294E9C4@<D0>(_OWORD *a1@<X8>)
{
  return sub_242949350(a1);
}

uint64_t sub_24294E9E0()
{
  return sub_2429493A0();
}

double sub_24294E9FC@<D0>(_OWORD *a1@<X8>)
{
  return sub_242949350(a1);
}

uint64_t sub_24294EA18()
{
  return sub_2429493A0();
}

uint64_t sub_24294EA38()
{
  return sub_24294D330();
}

double sub_24294EA54@<D0>(_OWORD *a1@<X8>)
{
  return sub_242949350(a1);
}

uint64_t sub_24294EA70()
{
  return sub_2429493A0();
}

double sub_24294EA8C@<D0>(_OWORD *a1@<X8>)
{
  return sub_242949350(a1);
}

uint64_t sub_24294EAA8()
{
  return sub_2429493A0();
}

double sub_24294EAC4@<D0>(_OWORD *a1@<X8>)
{
  return sub_242949350(a1);
}

uint64_t sub_24294EAE0()
{
  return sub_2429493A0();
}

double sub_24294EB0C@<D0>(_OWORD *a1@<X8>)
{
  return sub_242949350(a1);
}

uint64_t sub_24294EB28()
{
  return sub_2429493A0();
}

double sub_24294EB44@<D0>(_OWORD *a1@<X8>)
{
  return sub_242949350(a1);
}

uint64_t sub_24294EB60()
{
  return sub_2429493A0();
}

uint64_t sub_24294EB80()
{
  return sub_24294D330();
}

uint64_t getEnumTagSinglePayload for NHOSmartStackAction(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for NHOSmartStackAction(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_24294EC78 + 4 * byte_242964BE8[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_24294ECAC + 4 * byte_242964BE3[v4]))();
}

uint64_t sub_24294ECAC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24294ECB4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24294ECBCLL);
  return result;
}

uint64_t sub_24294ECC8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24294ECD0);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_24294ECD4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24294ECDC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for NHOSmartStackAction()
{
  return &type metadata for NHOSmartStackAction;
}

uint64_t sub_24294ECF8()
{
  return sub_24294ED24(&qword_257207D00, &qword_257207D08, MEMORY[0x24BDB5E58]);
}

uint64_t sub_24294ED24(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x2494E92B4](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24294ED64(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257207D18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

const char *NHOFeatureFlags.domain.getter()
{
  return "NanoHome";
}

const char *NHOFeatureFlags.feature.getter()
{
  return "EagleRoost";
}

uint64_t NHOFeatureFlags.isEnabled.getter()
{
  return sub_24294EEF4((uint64_t)&type metadata for NHOFeatureFlags, (uint64_t (*)(void))sub_24294EDE8);
}

unint64_t sub_24294EDE8()
{
  unint64_t result;

  result = qword_257207D28;
  if (!qword_257207D28)
  {
    result = MEMORY[0x2494E92B4](&protocol conformance descriptor for NHOFeatureFlags, &type metadata for NHOFeatureFlags);
    atomic_store(result, (unint64_t *)&qword_257207D28);
  }
  return result;
}

uint64_t static NHOFeatureFlags.== infix(_:_:)()
{
  return 1;
}

uint64_t NHOFeatureFlags.hash(into:)()
{
  return sub_242963DD0();
}

uint64_t sub_24294EE5C()
{
  return 1;
}

uint64_t sub_24294EE68()
{
  return sub_242963DD0();
}

const char *sub_24294EE90()
{
  return "NanoHome";
}

const char *sub_24294EEA4()
{
  return "EagleRoost";
}

const char *RestrictedGuestFeatureFlags.domain.getter()
{
  return "Home";
}

const char *RestrictedGuestFeatureFlags.feature.getter()
{
  return "RestrictedGuest";
}

uint64_t RestrictedGuestFeatureFlags.isEnabled.getter()
{
  return sub_24294EEF4((uint64_t)&type metadata for RestrictedGuestFeatureFlags, (uint64_t (*)(void))sub_24294EF38);
}

uint64_t sub_24294EEF4(uint64_t a1, uint64_t (*a2)(void))
{
  char v2;
  _BYTE v4[24];
  uint64_t v5;
  uint64_t v6;

  v5 = a1;
  v6 = a2();
  v2 = sub_242963944();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v4);
  return v2 & 1;
}

unint64_t sub_24294EF38()
{
  unint64_t result;

  result = qword_257207D30;
  if (!qword_257207D30)
  {
    result = MEMORY[0x2494E92B4](&protocol conformance descriptor for RestrictedGuestFeatureFlags, &type metadata for RestrictedGuestFeatureFlags);
    atomic_store(result, (unint64_t *)&qword_257207D30);
  }
  return result;
}

uint64_t static RestrictedGuestFeatureFlags.== infix(_:_:)()
{
  return 1;
}

uint64_t _s15NanoHomeIntents15NHOFeatureFlagsO9hashValueSivg_0()
{
  sub_242963DC4();
  sub_242963DD0();
  return sub_242963DDC();
}

uint64_t sub_24294EFC8()
{
  sub_242963DC4();
  sub_242963DD0();
  return sub_242963DDC();
}

const char *sub_24294F004()
{
  return "Home";
}

const char *sub_24294F018()
{
  return "RestrictedGuest";
}

uint64_t sub_24294F02C()
{
  char v0;
  _BYTE v2[24];
  ValueMetadata *v3;
  unint64_t v4;

  v3 = &type metadata for NHOFeatureFlags;
  v4 = sub_24294EDE8();
  v0 = sub_242963944();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v2);
  return v0 & 1;
}

id NHOFeatureFlagsObjC.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id NHOFeatureFlagsObjC.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for NHOFeatureFlagsObjC();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for NHOFeatureFlagsObjC()
{
  return objc_opt_self();
}

id NHOFeatureFlagsObjC.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for NHOFeatureFlagsObjC();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_24294F1A4()
{
  unint64_t result;

  result = qword_257207D38;
  if (!qword_257207D38)
  {
    result = MEMORY[0x2494E92B4](&protocol conformance descriptor for NHOFeatureFlags, &type metadata for NHOFeatureFlags);
    atomic_store(result, (unint64_t *)&qword_257207D38);
  }
  return result;
}

unint64_t sub_24294F1EC()
{
  unint64_t result;

  result = qword_257207D40;
  if (!qword_257207D40)
  {
    result = MEMORY[0x2494E92B4](&protocol conformance descriptor for RestrictedGuestFeatureFlags, &type metadata for RestrictedGuestFeatureFlags);
    atomic_store(result, (unint64_t *)&qword_257207D40);
  }
  return result;
}

uint64_t sub_24294F23C()
{
  return 0;
}

ValueMetadata *type metadata accessor for NHOFeatureFlags()
{
  return &type metadata for NHOFeatureFlags;
}

uint64_t _s15NanoHomeIntents15NHOFeatureFlagsOwet_0(unsigned int *a1, int a2)
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

uint64_t _s15NanoHomeIntents15NHOFeatureFlagsOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_24294F2E4 + 4 * byte_242965000[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_24294F304 + 4 * byte_242965005[v4]))();
}

_BYTE *sub_24294F2E4(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_24294F304(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_24294F30C(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_24294F314(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_24294F31C(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_24294F324(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for RestrictedGuestFeatureFlags()
{
  return &type metadata for RestrictedGuestFeatureFlags;
}

uint64_t method lookup function for NHOFeatureFlagsObjC()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of static NHOFeatureFlagsObjC.eagleRoostFeatureFlagIsEnabled()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t Color.init(hex:)(uint64_t a1, unint64_t a2)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  if ((sub_242963B00() & 1) == 0)
    goto LABEL_5;
  v4 = sub_242963ADC();
  v5 = sub_24294F54C(v4, a1, a2);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  swift_bridgeObjectRelease();
  MEMORY[0x2494E8BE8](v5, v7, v9, v11);
  swift_bridgeObjectRelease();
  if (sub_242963AD0() != 8)
  {
LABEL_5:
    swift_bridgeObjectRelease();
    return _sSo11HMActionSetC15NanoHomeIntentsE15backupTintColor7SwiftUI0H0Vvg_0();
  }
  v12 = objc_allocWithZone(MEMORY[0x24BDD17A8]);
  v13 = (void *)sub_242963A7C();
  swift_bridgeObjectRelease();
  v14 = objc_msgSend(v12, sel_initWithString_, v13);

  v17[0] = 0;
  if (!objc_msgSend(v14, sel_scanHexLongLong_, v17))
  {

    return _sSo11HMActionSetC15NanoHomeIntentsE15backupTintColor7SwiftUI0H0Vvg_0();
  }
  v15 = MEMORY[0x2494E8B40](objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD4B8]), sel_initWithRed_green_blue_alpha_, (double)BYTE3(v17[0]) / 255.0, (double)BYTE2(v17[0]) / 255.0, (double)BYTE1(v17[0]) / 255.0, (double)LOBYTE(v17[0]) / 255.0));

  return v15;
}

unint64_t sub_24294F54C(unint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v3;

  v3 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0)
    v3 = a2 & 0xFFFFFFFFFFFFLL;
  if (4 * v3 >= result >> 14)
    return sub_242963B0C();
  __break(1u);
  return result;
}

Swift::String __swiftcall Color.toHexString()()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  unint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  float v10;
  float v11;
  float v12;
  float v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  Swift::String result;

  sub_24294F748();
  swift_retain();
  v0 = (void *)sub_242963C14();
  v1 = objc_msgSend(v0, sel_CGColor);
  v2 = sub_242963BB4();

  if (!v2)
  {
    v13 = 255.0;
    v12 = 255.0;
    v11 = 255.0;
    v10 = 255.0;
    goto LABEL_8;
  }
  v5 = *(_QWORD *)(v2 + 16);
  if (!v5)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (v5 == 1)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  if (v5 < 3)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  if (v5 == 3)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  v6 = *(double *)(v2 + 32);
  v7 = *(double *)(v2 + 40);
  v8 = *(double *)(v2 + 48);
  v9 = *(double *)(v2 + 56);
  swift_bridgeObjectRelease();
  v10 = v6 * 255.0;
  v11 = v7 * 255.0;
  v12 = v8 * 255.0;
  v13 = v9 * 255.0;
LABEL_8:
  __swift_instantiateConcreteTypeFromMangledName(&qword_257207AC0);
  v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_2429651B0;
  v15 = lroundf(v10);
  v16 = MEMORY[0x24BEE1768];
  v17 = MEMORY[0x24BEE17F0];
  *(_QWORD *)(v14 + 56) = MEMORY[0x24BEE1768];
  *(_QWORD *)(v14 + 64) = v17;
  *(_QWORD *)(v14 + 32) = v15;
  v18 = lroundf(v11);
  *(_QWORD *)(v14 + 96) = v16;
  *(_QWORD *)(v14 + 104) = v17;
  *(_QWORD *)(v14 + 72) = v18;
  v19 = lroundf(v12);
  *(_QWORD *)(v14 + 136) = v16;
  *(_QWORD *)(v14 + 144) = v17;
  *(_QWORD *)(v14 + 112) = v19;
  v20 = lroundf(v13);
  *(_QWORD *)(v14 + 176) = v16;
  *(_QWORD *)(v14 + 184) = v17;
  *(_QWORD *)(v14 + 152) = v20;
  v21 = sub_242963A94();
  v23 = v22;

  v3 = v21;
  v4 = v23;
LABEL_13:
  result._object = v4;
  result._countAndFlagsBits = v3;
  return result;
}

unint64_t sub_24294F748()
{
  unint64_t result;

  result = qword_257207D70;
  if (!qword_257207D70)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_257207D70);
  }
  return result;
}

id *sub_24294F784()
{
  id *result;

  type metadata accessor for HomeManagerActor();
  swift_allocObject();
  result = sub_24294F7EC();
  qword_25720A0C0 = (uint64_t)result;
  return result;
}

id *sub_24294F7BC()
{
  swift_allocObject();
  return sub_24294F7EC();
}

id *sub_24294F7EC()
{
  uint64_t v0;
  void *ObjCClassFromMetadata;
  id v2;
  id *v3;
  objc_super v5;

  swift_defaultActor_initialize();
  *(_BYTE *)(v0 + 120) = 0;
  *(_QWORD *)(v0 + 128) = MEMORY[0x24BEE4AF8];
  sub_24294899C(0, &qword_257207E18);
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  swift_retain();
  v2 = objc_msgSend(ObjCClassFromMetadata, sel_defaultPrivateConfiguration);
  objc_msgSend(v2, sel_setCachePolicy_, 0);
  objc_msgSend(v2, sel_setDiscretionary_, 0);
  objc_msgSend(v2, sel_setAdaptive_, 1);
  *(_QWORD *)(v0 + 112) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD76D8]), sel_initWithConfiguration_, v2);
  swift_release();
  v5.receiver = (id)v0;
  v5.super_class = (Class)type metadata accessor for HomeManagerActor();
  v3 = (id *)objc_msgSendSuper2(&v5, sel_init);
  objc_msgSend(v3[14], sel_setDelegate_, v3);

  return v3;
}

uint64_t HomeManagerActor.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t HomeManagerActor.__deallocating_deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_defaultActor_destroy();
  return swift_defaultActor_deallocate();
}

uint64_t HomeManagerActor.unownedExecutor.getter()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_24294F984()
{
  uint64_t v0;

  return v0;
}

uint64_t static HomeManagerActor.homeManager.getter()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 24) = v1;
  sub_24294899C(0, &qword_257207D88);
  *v1 = v0;
  v1[1] = sub_24294FA30;
  return sub_242963D94();
}

uint64_t sub_24294FA30()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_24294FA84()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 16));
}

uint64_t sub_24294FA8C(uint64_t a1)
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

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_257207E50);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(_QWORD *)(v3 + 64);
  MEMORY[0x24BDAC7A8](v2);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_257207E20);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_242963B90();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 1, 1, v8);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  v9 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = 0;
  *(_QWORD *)(v10 + 24) = 0;
  (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(v10 + v9, (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v2);
  sub_24294FEE0((uint64_t)v7, (uint64_t)&unk_257207E60, v10);
  return swift_release();
}

uint64_t sub_24294FBC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  v4[6] = a4;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_257207E50);
  v4[7] = v5;
  v6 = *(_QWORD *)(v5 - 8);
  v4[8] = v6;
  v4[9] = *(_QWORD *)(v6 + 64);
  v4[10] = swift_task_alloc();
  v4[11] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_24294FC3C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t, uint64_t);
  unint64_t v7;
  uint64_t v8;

  if (qword_257207760 != -1)
    swift_once();
  v1 = v0[10];
  v2 = v0[11];
  v3 = v0[8];
  v4 = v0[6];
  v5 = v0[7];
  v0[12] = qword_25720A0C0;
  v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  v6(v2, v4, v5);
  v6(v1, v2, v5);
  v7 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v8 = swift_allocObject();
  v0[13] = v8;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))(v8 + v7, v2, v5);
  return swift_task_switch();
}

uint64_t sub_24294FD20()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v9;
  unint64_t v10;
  _QWORD *v11;

  v1 = *(_QWORD *)(v0 + 96);
  if (*(_BYTE *)(v1 + 120) == 1)
  {
    v2 = *(void **)(v1 + 112);
    *(_QWORD *)(v0 + 40) = v2;
    v3 = v2;
    sub_242963B78();
  }
  else
  {
    v4 = *(_QWORD *)(v0 + 104);
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = sub_242950934;
    *(_QWORD *)(v5 + 24) = v4;
    v6 = (_QWORD *)(v1 + 128);
    swift_beginAccess();
    v7 = *(_QWORD **)(v1 + 128);
    swift_retain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(_QWORD *)(v1 + 128) = v7;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v7 = sub_242950218(0, v7[2] + 1, 1, v7);
      *v6 = v7;
    }
    v10 = v7[2];
    v9 = v7[3];
    if (v10 >= v9 >> 1)
    {
      v7 = sub_242950218((_QWORD *)(v9 > 1), v10 + 1, 1, v7);
      *v6 = v7;
    }
    v7[2] = v10 + 1;
    v11 = &v7[2 * v10];
    v11[4] = sub_242950998;
    v11[5] = v5;
    swift_endAccess();
  }
  swift_release();
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 64) + 8))(*(_QWORD *)(v0 + 80), *(_QWORD *)(v0 + 56));
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_24294FE9C(void *a1)
{
  id v1;

  v1 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257207E50);
  return sub_242963B78();
}

uint64_t sub_24294FEE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_242963B90();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_242963B84();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_2429506B0(a1);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_242963B6C();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_242950028(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 16) = a4;
  return swift_task_switch();
}

uint64_t sub_242950040()
{
  uint64_t v0;

  sub_242950070();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_242950070()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t *);
  uint64_t v7;

  *(_BYTE *)(v0 + 120) = 1;
  swift_beginAccess();
  v1 = *(_QWORD *)(v0 + 128);
  v2 = *(_QWORD *)(v1 + 16);
  if (v2)
  {
    v3 = *(_QWORD *)(v0 + 112);
    swift_bridgeObjectRetain();
    v4 = v1 + 40;
    do
    {
      v5 = *(void (**)(uint64_t *))(v4 - 8);
      v7 = v3;
      swift_retain();
      v5(&v7);
      swift_release();
      v4 += 16;
      --v2;
    }
    while (v2);
    swift_bridgeObjectRelease();
  }
  *(_QWORD *)(v0 + 128) = MEMORY[0x24BEE4AF8];
  return swift_bridgeObjectRelease();
}

uint64_t sub_242950168(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_2429501CC;
  return v6(a1);
}

uint64_t sub_2429501CC()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

_QWORD *sub_242950218(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_257207E68);
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
    sub_242950324(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_242950324(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257207E70);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_242963D7C();
  __break(1u);
  return result;
}

uint64_t _s15NanoHomeIntents0B12ManagerActorC04homeD14DidUpdateHomesyySo06HMHomeD0CF_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v14[4];

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_257207E20);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_242963B90();
  v6 = *(_QWORD *)(v5 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v4, 1, 1, v5);
  v7 = (_QWORD *)swift_allocObject();
  v7[2] = 0;
  v7[3] = 0;
  v7[4] = v1;
  v8 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5);
  swift_retain();
  if (v8 == 1)
  {
    sub_2429506B0((uint64_t)v4);
    v9 = 0;
    v10 = 0;
  }
  else
  {
    sub_242963B84();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v4, v5);
    if (v7[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      v9 = sub_242963B6C();
      v10 = v11;
      swift_unknownObjectRelease();
    }
    else
    {
      v9 = 0;
      v10 = 0;
    }
  }
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = &unk_257207E30;
  *(_QWORD *)(v12 + 24) = v7;
  if (v10 | v9)
  {
    v14[0] = 0;
    v14[1] = 0;
    v14[2] = v9;
    v14[3] = v10;
  }
  swift_task_create();
  return swift_release();
}

uint64_t type metadata accessor for HomeManagerActor()
{
  return objc_opt_self();
}

uint64_t method lookup function for HomeManagerActor()
{
  return swift_lookUpClassMethod();
}

uint64_t sub_242950624()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_242950650()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_2429509BC;
  v3[2] = v2;
  return swift_task_switch();
}

uint64_t sub_2429506B0(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_257207E20);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2429506F0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_2429509BC;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_257207E38 + dword_257207E38))(a1, v4);
}

uint64_t sub_242950760(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_24294E454;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_257207E38 + dword_257207E38))(a1, v4);
}

uint64_t sub_2429507D0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_257207E50);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_unknownObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_242950848(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v4 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_257207E50) - 8) + 80);
  v5 = *(_QWORD *)(v1 + 16);
  v6 = *(_QWORD *)(v1 + 24);
  v7 = v1 + ((v4 + 32) & ~v4);
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_24294E454;
  return sub_24294FBC4(a1, v5, v6, v7);
}

uint64_t sub_2429508D0()
{
  uint64_t v0;
  uint64_t v1;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_257207E50);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t sub_242950934(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_257207E50);
  return sub_24294FE9C(a1);
}

uint64_t sub_242950974()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_242950998(_QWORD *a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD))(v1 + 16))(*a1);
}

uint64_t static HMHome.home(homeID:fallbackToCurrentHome:)(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3;
  _QWORD *v4;

  *(_BYTE *)(v3 + 104) = a3;
  *(_QWORD *)(v3 + 80) = a1;
  *(_QWORD *)(v3 + 88) = a2;
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 96) = v4;
  sub_24294899C(0, &qword_257207D88);
  *v4 = v3;
  v4[1] = sub_242950A70;
  return sub_242963D94();
}

uint64_t sub_242950A70()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_242950AC4()
{
  uint64_t v0;
  unint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t *v4;
  id v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t *v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  uint64_t v29;
  uint64_t v30;
  os_log_type_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v36;
  uint64_t v37;
  uint64_t type;
  void *v39;
  uint64_t v40[2];

  v1 = *(_QWORD *)(v0 + 88);
  v2 = *(void **)(v0 + 16);
  if (v1)
  {
    v4 = (uint64_t *)(v0 + 80);
    v3 = *(_QWORD *)(v0 + 80);
    swift_bridgeObjectRetain();
    v5 = objc_msgSend(v2, sel_homes);
    sub_24294899C(0, &qword_257207EE8);
    v6 = sub_242963B30();

    swift_bridgeObjectRetain();
    v7 = sub_24295317C(v6, v3, v1);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v7 >> 62)
    {
      v8 = (uint64_t *)(v0 + 64);
      if (sub_242963D4C())
      {
LABEL_4:
        if ((v7 & 0xC000000000000001) != 0)
        {
          v9 = (id)MEMORY[0x2494E8E28](0, v7);
        }
        else
        {
          if (!*(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10))
          {
            __break(1u);
LABEL_32:
            swift_once();
LABEL_8:
            v10 = sub_2429639D4();
            __swift_project_value_buffer(v10, (uint64_t)qword_257207B40);
            v11 = v5;
            swift_bridgeObjectRetain();
            v12 = v11;
            v13 = sub_2429639BC();
            v14 = sub_242963BFC();
            if (os_log_type_enabled(v13, v14))
            {
              v36 = *v4;
              v15 = swift_slowAlloc();
              v37 = swift_slowAlloc();
              v40[0] = v37;
              *(_DWORD *)v15 = 136315650;
              *(_QWORD *)(v0 + 40) = sub_24294461C(0xD000000000000023, 0x80000002429667D0, v40);
              sub_242963C5C();
              *(_WORD *)(v15 + 12) = 2080;
              v39 = v2;
              v16 = objc_msgSend(v12, sel_name);
              v17 = sub_242963A88();
              v19 = v18;

              *(_QWORD *)(v0 + 48) = sub_24294461C(v17, v19, v40);
              sub_242963C5C();
              swift_bridgeObjectRelease();

              *(_WORD *)(v15 + 22) = 2080;
              swift_bridgeObjectRetain();
              *(_QWORD *)(v0 + 56) = sub_24294461C(v36, v1, v40);
              sub_242963C5C();
              swift_bridgeObjectRelease_n();
              _os_log_impl(&dword_242941000, v13, v14, "%s: home %s found for homeID: %s", (uint8_t *)v15, 0x20u);
              swift_arrayDestroy();
              MEMORY[0x2494E932C](v37, -1, -1);
              MEMORY[0x2494E932C](v15, -1, -1);

            }
            else
            {

              swift_bridgeObjectRelease_n();
            }
            return (*(uint64_t (**)(id))(v0 + 8))(v12);
          }
          v9 = *(id *)(v7 + 32);
        }
        v5 = v9;
        swift_bridgeObjectRelease();
        if (qword_257207730 == -1)
          goto LABEL_8;
        goto LABEL_32;
      }
    }
    else
    {
      v8 = (uint64_t *)(v0 + 64);
      if (*(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10))
        goto LABEL_4;
    }
    swift_bridgeObjectRelease();
    if (qword_257207730 != -1)
      swift_once();
    v30 = sub_2429639D4();
    __swift_project_value_buffer(v30, (uint64_t)qword_257207B40);
    swift_bridgeObjectRetain();
    v26 = sub_2429639BC();
    v31 = sub_242963BFC();
    if (os_log_type_enabled(v26, v31))
    {
      type = *v4;
      v32 = v8;
      v33 = swift_slowAlloc();
      v34 = swift_slowAlloc();
      *(_DWORD *)v33 = 136315394;
      v40[0] = v34;
      *v32 = sub_24294461C(0xD000000000000023, 0x80000002429667D0, v40);
      sub_242963C5C();
      *(_WORD *)(v33 + 12) = 2080;
      swift_bridgeObjectRetain();
      *(_QWORD *)(v0 + 72) = sub_24294461C(type, v1, v40);
      sub_242963C5C();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_242941000, v26, v31, "%s: home with ID %s not found, returning no home", (uint8_t *)v33, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x2494E932C](v34, -1, -1);
      MEMORY[0x2494E932C](v33, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
LABEL_28:

    v12 = 0;
    return (*(uint64_t (**)(id))(v0 + 8))(v12);
  }
  if (*(_BYTE *)(v0 + 104) != 1)
  {
    if (qword_257207730 != -1)
      swift_once();
    v25 = sub_2429639D4();
    __swift_project_value_buffer(v25, (uint64_t)qword_257207B40);
    v26 = sub_2429639BC();
    v27 = sub_242963BFC();
    if (os_log_type_enabled(v26, v27))
    {
      v28 = (uint8_t *)swift_slowAlloc();
      v29 = swift_slowAlloc();
      v40[0] = v29;
      *(_DWORD *)v28 = 136315138;
      *(_QWORD *)(v0 + 24) = sub_24294461C(0xD000000000000023, 0x80000002429667D0, v40);
      sub_242963C5C();
      _os_log_impl(&dword_242941000, v26, v27, "%s: no homeID, returning no home", v28, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2494E932C](v29, -1, -1);
      MEMORY[0x2494E932C](v28, -1, -1);
    }

    goto LABEL_28;
  }
  if (qword_257207730 != -1)
    swift_once();
  v20 = sub_2429639D4();
  __swift_project_value_buffer(v20, (uint64_t)qword_257207B40);
  v21 = sub_2429639BC();
  v22 = sub_242963BFC();
  if (os_log_type_enabled(v21, v22))
  {
    v23 = (uint8_t *)swift_slowAlloc();
    v24 = swift_slowAlloc();
    v40[0] = v24;
    *(_DWORD *)v23 = 136315138;
    *(_QWORD *)(v0 + 32) = sub_24294461C(0xD000000000000023, 0x80000002429667D0, v40);
    sub_242963C5C();
    _os_log_impl(&dword_242941000, v21, v22, "%s: no homeID, returning manager.currentHome", v23, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2494E932C](v24, -1, -1);
    MEMORY[0x2494E932C](v23, -1, -1);
  }

  v12 = objc_msgSend(v2, sel_currentHome);
  return (*(uint64_t (**)(id))(v0 + 8))(v12);
}

uint64_t HMHome.pickableEnergyForecastIntents.getter()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1[8] = v0;
  v2 = sub_2429638CC();
  v1[9] = v2;
  v1[10] = *(_QWORD *)(v2 - 8);
  v1[11] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_242951310()
{
  objc_super *v0;
  id receiver;
  objc_class *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  _BYTE *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  objc_class *v12;

  receiver = v0[4].receiver;
  v2 = (objc_class *)type metadata accessor for NHOHomeUserCapabilities();
  v3 = objc_allocWithZone(v2);
  v4 = OBJC_IVAR___NHOHomeUserCapabilities_logger;
  v5 = qword_257207740;
  v6 = receiver;
  v7 = v3;
  if (v5 != -1)
    swift_once();
  v8 = v0[4].receiver;
  v9 = sub_2429639D4();
  v10 = __swift_project_value_buffer(v9, (uint64_t)qword_257207B70);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(&v7[v4], v10, v9);
  v7[OBJC_IVAR___NHOHomeUserCapabilities_isOnboarded] = 0;
  v7[OBJC_IVAR___NHOHomeUserCapabilities_hasMockData] = 0;
  *(_QWORD *)&v7[OBJC_IVAR___NHOHomeUserCapabilities_home] = v8;
  v11 = v8;

  v0[1].receiver = v7;
  v0[1].super_class = v2;
  v0[6].receiver = objc_msgSendSuper2(v0 + 1, sel_init);

  v12 = (objc_class *)swift_task_alloc();
  v0[6].super_class = v12;
  *(_QWORD *)v12 = v0;
  *((_QWORD *)v12 + 1) = sub_242951444;
  return sub_24295CB24();
}

uint64_t sub_242951444()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_242951498()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;

  if ((sub_24295DC28() & 1) != 0)
  {
    v1 = *(_QWORD *)(v0 + 88);
    v2 = *(void **)(v0 + 96);
    v3 = *(_QWORD *)(v0 + 72);
    v4 = *(_QWORD *)(v0 + 80);
    v5 = *(void **)(v0 + 64);
    v6 = objc_msgSend(v5, sel_uniqueIdentifier);
    sub_2429638C0();

    v7 = sub_2429638B4();
    v9 = v8;
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v1, v3);
    v10 = objc_msgSend(v5, sel_name);
    v11 = sub_242963A88();
    v13 = v12;

    v14 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for EnergyForecastIntent()), sel_init);
    *(_QWORD *)(v0 + 32) = v7;
    *(_QWORD *)(v0 + 40) = v9;
    v15 = v14;
    swift_retain();
    sub_242963770();
    swift_release();
    *(_QWORD *)(v0 + 48) = v11;
    *(_QWORD *)(v0 + 56) = v13;
    swift_retain();
    sub_242963770();
    swift_release();

    __swift_instantiateConcreteTypeFromMangledName(&qword_257207EF8);
    v16 = swift_allocObject();
    *(_OWORD *)(v16 + 16) = xmmword_242965250;
    *(_QWORD *)(v16 + 32) = v15;
    v19 = v16;
    sub_242963B3C();
    v17 = v19;

  }
  else
  {

    v17 = MEMORY[0x24BEE4AF8];
  }
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v17);
}

uint64_t HMHome.pickableElectricityUsageIntents.getter()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1[8] = v0;
  v2 = sub_2429638CC();
  v1[9] = v2;
  v1[10] = *(_QWORD *)(v2 - 8);
  v1[11] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2429516A0()
{
  objc_super *v0;
  id receiver;
  objc_class *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  _BYTE *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  objc_class *v12;

  receiver = v0[4].receiver;
  v2 = (objc_class *)type metadata accessor for NHOHomeUserCapabilities();
  v3 = objc_allocWithZone(v2);
  v4 = OBJC_IVAR___NHOHomeUserCapabilities_logger;
  v5 = qword_257207740;
  v6 = receiver;
  v7 = v3;
  if (v5 != -1)
    swift_once();
  v8 = v0[4].receiver;
  v9 = sub_2429639D4();
  v10 = __swift_project_value_buffer(v9, (uint64_t)qword_257207B70);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(&v7[v4], v10, v9);
  v7[OBJC_IVAR___NHOHomeUserCapabilities_isOnboarded] = 0;
  v7[OBJC_IVAR___NHOHomeUserCapabilities_hasMockData] = 0;
  *(_QWORD *)&v7[OBJC_IVAR___NHOHomeUserCapabilities_home] = v8;
  v11 = v8;

  v0[1].receiver = v7;
  v0[1].super_class = v2;
  v0[6].receiver = objc_msgSendSuper2(v0 + 1, sel_init);

  v12 = (objc_class *)swift_task_alloc();
  v0[6].super_class = v12;
  *(_QWORD *)v12 = v0;
  *((_QWORD *)v12 + 1) = sub_2429517D4;
  return sub_24295CB24();
}

uint64_t sub_2429517D4()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_242951828()
{
  uint64_t v0;
  void *v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;

  v1 = *(void **)(v0 + 96);
  if ((*((_BYTE *)v1 + OBJC_IVAR___NHOHomeUserCapabilities_isOnboarded) & 1) != 0
    || (*((_BYTE *)v1 + OBJC_IVAR___NHOHomeUserCapabilities_hasMockData) & 1) != 0
    || (v2 = sub_24295C6C0(), v1 = *(void **)(v0 + 96), (v2 & 1) != 0))
  {
    v4 = *(_QWORD *)(v0 + 80);
    v3 = *(_QWORD *)(v0 + 88);
    v6 = *(void **)(v0 + 64);
    v5 = *(_QWORD *)(v0 + 72);
    v7 = objc_msgSend(v6, sel_uniqueIdentifier);
    sub_2429638C0();

    v8 = sub_2429638B4();
    v10 = v9;
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
    v11 = objc_msgSend(v6, sel_name);
    v12 = sub_242963A88();
    v14 = v13;

    v15 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for ElectricityUsageIntent()), sel_init);
    *(_QWORD *)(v0 + 32) = v8;
    *(_QWORD *)(v0 + 40) = v10;
    v16 = v15;
    swift_retain();
    sub_242963770();
    swift_release();
    *(_QWORD *)(v0 + 48) = v12;
    *(_QWORD *)(v0 + 56) = v14;
    swift_retain();
    sub_242963770();
    swift_release();

    __swift_instantiateConcreteTypeFromMangledName(&qword_257207EF8);
    v17 = swift_allocObject();
    *(_OWORD *)(v17 + 16) = xmmword_242965250;
    *(_QWORD *)(v17 + 32) = v16;
    v20 = v17;
    sub_242963B3C();
    v18 = v20;

  }
  else
  {

    v18 = MEMORY[0x24BEE4AF8];
  }
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v18);
}

uint64_t HMHome.pickableElectricityRatesIntents.getter()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1[8] = v0;
  v2 = sub_2429638CC();
  v1[9] = v2;
  v1[10] = *(_QWORD *)(v2 - 8);
  v1[11] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_242951A50()
{
  objc_super *v0;
  id receiver;
  objc_class *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  _BYTE *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  objc_class *v12;

  receiver = v0[4].receiver;
  v2 = (objc_class *)type metadata accessor for NHOHomeUserCapabilities();
  v3 = objc_allocWithZone(v2);
  v4 = OBJC_IVAR___NHOHomeUserCapabilities_logger;
  v5 = qword_257207740;
  v6 = receiver;
  v7 = v3;
  if (v5 != -1)
    swift_once();
  v8 = v0[4].receiver;
  v9 = sub_2429639D4();
  v10 = __swift_project_value_buffer(v9, (uint64_t)qword_257207B70);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(&v7[v4], v10, v9);
  v7[OBJC_IVAR___NHOHomeUserCapabilities_isOnboarded] = 0;
  v7[OBJC_IVAR___NHOHomeUserCapabilities_hasMockData] = 0;
  *(_QWORD *)&v7[OBJC_IVAR___NHOHomeUserCapabilities_home] = v8;
  v11 = v8;

  v0[1].receiver = v7;
  v0[1].super_class = v2;
  v0[6].receiver = objc_msgSendSuper2(v0 + 1, sel_init);

  v12 = (objc_class *)swift_task_alloc();
  v0[6].super_class = v12;
  *(_QWORD *)v12 = v0;
  *((_QWORD *)v12 + 1) = sub_242951B84;
  return sub_24295CB24();
}

uint64_t sub_242951B84()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_242951BD8()
{
  uint64_t v0;
  void *v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;

  v1 = *(void **)(v0 + 96);
  if ((*((_BYTE *)v1 + OBJC_IVAR___NHOHomeUserCapabilities_isOnboarded) & 1) != 0
    || (*((_BYTE *)v1 + OBJC_IVAR___NHOHomeUserCapabilities_hasMockData) & 1) != 0
    || (v2 = sub_24295C6C0(), v1 = *(void **)(v0 + 96), (v2 & 1) != 0))
  {
    v4 = *(_QWORD *)(v0 + 80);
    v3 = *(_QWORD *)(v0 + 88);
    v6 = *(void **)(v0 + 64);
    v5 = *(_QWORD *)(v0 + 72);
    v7 = objc_msgSend(v6, sel_uniqueIdentifier);
    sub_2429638C0();

    v8 = sub_2429638B4();
    v10 = v9;
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
    v11 = objc_msgSend(v6, sel_name);
    v12 = sub_242963A88();
    v14 = v13;

    v15 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for ElectricityRatesIntent()), sel_init);
    *(_QWORD *)(v0 + 32) = v8;
    *(_QWORD *)(v0 + 40) = v10;
    v16 = v15;
    swift_retain();
    sub_242963770();
    swift_release();
    *(_QWORD *)(v0 + 48) = v12;
    *(_QWORD *)(v0 + 56) = v14;
    swift_retain();
    sub_242963770();
    swift_release();

    __swift_instantiateConcreteTypeFromMangledName(&qword_257207EF8);
    v17 = swift_allocObject();
    *(_OWORD *)(v17 + 16) = xmmword_242965250;
    *(_QWORD *)(v17 + 32) = v16;
    v20 = v17;
    sub_242963B3C();
    v18 = v20;

  }
  else
  {

    v18 = MEMORY[0x24BEE4AF8];
  }
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v18);
}

void HMHome.actionSetsWithActions()()
{
  void *v0;
  id v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t i;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;

  v1 = objc_msgSend(v0, sel_actionSets);
  sub_24294899C(0, &qword_257207F10);
  v2 = sub_242963B30();

  if (!(v2 >> 62))
  {
    v3 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v3)
      goto LABEL_3;
LABEL_17:
    swift_bridgeObjectRelease();
    return;
  }
  swift_bridgeObjectRetain();
  v3 = sub_242963D4C();
  swift_bridgeObjectRelease();
  if (!v3)
    goto LABEL_17;
LABEL_3:
  if (v3 < 1)
  {
    __break(1u);
  }
  else
  {
    for (i = 0; i != v3; ++i)
    {
      if ((v2 & 0xC000000000000001) != 0)
        v5 = (id)MEMORY[0x2494E8E28](i, v2);
      else
        v5 = *(id *)(v2 + 8 * i + 32);
      v6 = v5;
      v7 = objc_msgSend(v5, sel_actions);
      sub_24294899C(0, (unint64_t *)&qword_257207A28);
      sub_242953380();
      v8 = sub_242963B9C();

      if ((v8 & 0xC000000000000001) != 0)
        v9 = sub_242963C8C();
      else
        v9 = *(_QWORD *)(v8 + 16);
      swift_bridgeObjectRelease();
      if (v9 >= 1)
      {
        sub_242963D10();
        sub_242963D28();
        sub_242963D34();
        sub_242963D1C();
      }
      else
      {

      }
    }
    swift_bridgeObjectRelease();
  }
}

uint64_t HMHome.pickableActionSetIntents.getter()
{
  void *v0;
  unint64_t v1;
  unint64_t v2;
  id v3;
  uint64_t v4;

  HMHome.actionSetsWithActions()();
  v2 = v1;
  v3 = v0;
  v4 = sub_2429533D8(v2, v3);
  swift_bridgeObjectRelease();

  return v4;
}

uint64_t HMHome.pickableAccessoryIntents(forRoom:)(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  unint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v22;
  id v23;
  unint64_t v24;
  uint64_t v25;
  id v26;
  char v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  char v40;
  char *v41;
  char *v42;
  id v43;
  id v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  void (*v48)(char *, uint64_t);
  char *v49;
  uint64_t v50;
  id v51;
  int v52;
  int v53;
  id v54;
  char *v55;
  int v56;
  int v57;
  id v58;
  int v59;
  uint64_t v60;
  id v61;
  void (*v62)(char *, char *);
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char *v67;
  char *v68;
  char *v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void (*v78)(char *, char *, char *);
  uint64_t v79;
  char *v80;
  unint64_t v81;
  uint64_t v82;
  char *v83;
  char *v84;
  char *v85;
  unint64_t v86;
  uint64_t v87;
  unint64_t v88;
  unint64_t v89;
  unint64_t v90;
  _QWORD v91[2];

  v2 = sub_2429638CC();
  v71 = *(_QWORD *)(v2 - 8);
  v72 = v2;
  v3 = MEMORY[0x24BDAC7A8](v2);
  v70 = (char *)&v67 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v69 = (char *)&v67 - v5;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_257207948);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v67 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_242963974();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v68 = (char *)&v67 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v67 = (char *)&v67 - v14;
  MEMORY[0x24BDAC7A8](v13);
  v85 = (char *)&v67 - v15;
  v90 = MEMORY[0x24BEE4AF8];
  v91[0] = MEMORY[0x24BEE4AF8];
  v16 = objc_msgSend(a1, sel_accessories);
  sub_24294899C(0, &qword_257207F18);
  v17 = sub_242963B30();

  if (v17 >> 62)
    goto LABEL_57;
  v18 = *(_QWORD *)((v17 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v18)
  {
    while (1)
    {
      v86 = v10;
      v87 = v18;
      v10 = 0;
      v88 = v17;
      v89 = v17 & 0xC000000000000001;
      v82 = v17 & 0xFFFFFFFFFFFFFF8;
      v83 = (char *)v9;
      v80 = v8;
      v81 = v17 + 32;
      while (1)
      {
        if (v89)
        {
          v19 = (id)MEMORY[0x2494E8E28](v10, v17);
        }
        else
        {
          if (v10 >= *(_QWORD *)(v82 + 16))
            goto LABEL_54;
          v19 = *(id *)(v81 + 8 * v10);
        }
        v20 = v19;
        if (__OFADD__(v10++, 1))
        {
          __break(1u);
LABEL_54:
          __break(1u);
LABEL_55:
          __break(1u);
          goto LABEL_56;
        }
        HMAccessory.serviceGroup.getter();
        if (v22)
          break;
        v30 = (uint64_t)v80;
        HMAccessory.widgetSupportedServiceKind()((uint64_t)v80);
        v9 = v86;
        v8 = v83;
        if ((*(unsigned int (**)(uint64_t, uint64_t, char *))(v86 + 48))(v30, 1, v83) == 1)
        {
          sub_242948D44(v30);
          v23 = v20;
          goto LABEL_6;
        }
        (*(void (**)(char *, uint64_t, char *))(v9 + 32))(v85, v30, v8);
        v31 = sub_24296395C();
        v33 = v32;
        v34 = (unint64_t)HMAccessory.primaryService()();
        if (v34)
        {
          v35 = (void *)v34;
          swift_bridgeObjectRelease();
          v36 = HMService.iconSymbol.getter();
          v73 = v37;
          v74 = v36;

        }
        else
        {
          v73 = v33;
          v74 = v31;
        }
        v78 = *(void (**)(char *, char *, char *))(v86 + 16);
        v41 = v67;
        v42 = v83;
        v78(v67, v85, v83);
        v79 = type metadata accessor for NHOAccessoryIntent();
        v43 = v84;
        v44 = objc_msgSend(v84, sel_uniqueIdentifier);
        v45 = v69;
        sub_2429638C0();

        v46 = sub_2429638B4();
        v76 = v47;
        v77 = v46;
        v48 = *(void (**)(char *, uint64_t))(v71 + 8);
        v49 = v45;
        v50 = v72;
        v48(v49, v72);
        v51 = objc_msgSend(v43, sel_name);
        v75 = sub_242963A88();
        v53 = v52;

        v54 = objc_msgSend(v20, sel_uniqueIdentifier);
        v55 = v70;
        sub_2429638C0();

        LODWORD(v54) = sub_2429638B4();
        v57 = v56;
        v48(v55, v50);
        v58 = objc_msgSend(v20, sel_name);
        v9 = sub_242963A88();
        LODWORD(v50) = v59;

        v60 = (uint64_t)v68;
        v78(v68, v41, v42);
        v61 = NHOAccessoryIntent.__allocating_init(homeID:homeName:accessoryID:accessoryName:icon:serviceKind:)(v77, v76, v75, v53, (int)v54, v57, v9, v50, v74, v73, v60);
        v62 = *(void (**)(char *, char *))(v86 + 8);
        v62(v41, v42);
        v62(v85, v42);
        v23 = v61;
        v8 = (char *)v91;
        MEMORY[0x2494E8C54]();
        if (*(_QWORD *)((v91[0] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v91[0] & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_242963B48();
        sub_242963B54();
        sub_242963B3C();
LABEL_5:

        v18 = v87;
        v17 = v88;
LABEL_6:

        if (v10 == v18)
        {
          swift_bridgeObjectRelease();
          v65 = v91[0];
          goto LABEL_59;
        }
      }
      v23 = v22;
      v24 = v90;
      if (v90 >> 62)
      {
        swift_bridgeObjectRetain_n();
        v25 = sub_242963D4C();
        if (!v25)
          goto LABEL_19;
      }
      else
      {
        v25 = *(_QWORD *)((v90 & 0xFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain_n();
        if (!v25)
          goto LABEL_19;
      }
      if ((v24 & 0xC000000000000001) != 0)
        v26 = (id)MEMORY[0x2494E8E28](0, v24);
      else
        v26 = *(id *)(v24 + 32);
      v9 = (unint64_t)v26;
      v8 = (char *)sub_24294899C(0, &qword_257207F20);
      v27 = sub_242963C20();

      if ((v27 & 1) != 0)
        goto LABEL_4;
      if (v25 == 1)
        goto LABEL_19;
      if ((v24 & 0xC000000000000001) != 0)
        break;
      v9 = (unint64_t)*(id *)(v24 + 40);
      v17 = sub_242963C20();

      if ((v17 & 1) != 0)
        goto LABEL_4;
      if (v25 == 2)
        goto LABEL_19;
      v63 = 6;
      while (1)
      {
        v64 = v63 - 3;
        if (__OFADD__(v63 - 4, 1))
          break;
        v9 = (unint64_t)*(id *)(v24 + 8 * v63);
        v17 = sub_242963C20();

        if ((v17 & 1) != 0)
          goto LABEL_4;
        ++v63;
        if (v64 == v25)
          goto LABEL_19;
      }
LABEL_56:
      __break(1u);
LABEL_57:
      swift_bridgeObjectRetain();
      v18 = sub_242963D4C();
      swift_bridgeObjectRelease();
      if (!v18)
        goto LABEL_58;
    }
    v9 = MEMORY[0x2494E8E28](1, v24);
    v17 = sub_242963C20();
    swift_unknownObjectRelease();
    if ((v17 & 1) == 0)
    {
      if (v25 != 2)
      {
        v9 = 2;
        do
        {
          v38 = MEMORY[0x2494E8E28](v9, v24);
          v39 = v9 + 1;
          if (__OFADD__(v9, 1))
            goto LABEL_55;
          v17 = v38;
          v40 = sub_242963C20();
          swift_unknownObjectRelease();
          if ((v40 & 1) != 0)
            goto LABEL_4;
          ++v9;
        }
        while (v39 != v25);
      }
LABEL_19:
      swift_bridgeObjectRelease_n();
      v23 = v23;
      MEMORY[0x2494E8C54]();
      if (*(_QWORD *)((v90 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v90 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_242963B48();
      sub_242963B54();
      sub_242963B3C();
      v8 = v84;
      v28 = sub_2429527B8(v23);
      v18 = v87;
      v17 = v88;
      if (v28)
      {
        v29 = v28;
        v8 = (char *)v91;
        MEMORY[0x2494E8C54]();
        v9 = *(_QWORD *)((v91[0] & 0xFFFFFFFFFFFFFF8) + 0x10);
        if (v9 >= *(_QWORD *)((v91[0] & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_242963B48();
        sub_242963B54();
        sub_242963B3C();

      }
      else
      {

      }
      goto LABEL_6;
    }
LABEL_4:
    swift_bridgeObjectRelease_n();
    goto LABEL_5;
  }
LABEL_58:
  swift_bridgeObjectRelease();
  v65 = MEMORY[0x24BEE4AF8];
LABEL_59:
  swift_bridgeObjectRelease();
  return v65;
}

id sub_2429527B8(void *a1)
{
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
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(char *, uint64_t);
  char *v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  id v36;
  int v37;
  id v38;
  int v39;
  int v40;
  uint64_t v41;
  void (*v42)(char *, uint64_t);
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void (*v47)(char *, char *, uint64_t);
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  char *v52;
  uint64_t v53;

  v53 = sub_2429638CC();
  v2 = *(_QWORD *)(v53 - 8);
  v3 = MEMORY[0x24BDAC7A8](v53);
  v5 = (char *)&v44 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v44 - v6;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_257207948);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v44 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_242963974();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v52 = (char *)&v44 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v44 - v16;
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v44 - v18;
  HMServiceGroup.widgetSupportedServiceKind()((uint64_t)v10);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
  {
    sub_242948D44((uint64_t)v10);
    return 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v19, v10, v11);
    v50 = sub_24296395C();
    v22 = v21;
    v23 = (unint64_t)HMServiceGroup.primaryService()();
    if (v23)
    {
      v24 = (void *)v23;
      swift_bridgeObjectRelease();
      v25 = HMService.iconSymbol.getter();
      v49 = v26;
      v50 = v25;

    }
    else
    {
      v49 = v22;
    }
    v47 = *(void (**)(char *, char *, uint64_t))(v12 + 16);
    v47(v17, v19, v11);
    v48 = type metadata accessor for NHOAccessoryIntent();
    v27 = v51;
    v28 = objc_msgSend(v51, sel_uniqueIdentifier);
    sub_2429638C0();

    v29 = sub_2429638B4();
    v45 = v30;
    v46 = v29;
    v31 = *(void (**)(char *, uint64_t))(v2 + 8);
    v32 = v7;
    v33 = v53;
    v31(v32, v53);
    v34 = objc_msgSend(v27, sel_name);
    v51 = (id)sub_242963A88();
    v44 = v35;

    v36 = objc_msgSend(a1, sel_uniqueIdentifier);
    sub_2429638C0();

    LODWORD(v36) = sub_2429638B4();
    LODWORD(v27) = v37;
    v31(v5, v33);
    v38 = objc_msgSend(a1, sel_name);
    LODWORD(v31) = sub_242963A88();
    v40 = v39;

    v41 = (uint64_t)v52;
    v47(v52, v17, v11);
    v20 = NHOAccessoryIntent.__allocating_init(homeID:homeName:accessoryID:accessoryName:icon:serviceKind:)(v46, v45, (int)v51, v44, (int)v36, (int)v27, (int)v31, v40, v50, v49, v41);
    v42 = *(void (**)(char *, uint64_t))(v12 + 8);
    v42(v17, v11);
    v42(v19, v11);
  }
  return v20;
}

Swift::Bool __swiftcall HMHome.isCurrentRestrictedGuestAwayFromHome()()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  id v18;
  void *v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  Swift::Bool result;
  uint64_t v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29[5];

  v1 = v0;
  v2 = sub_2429639D4();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29[3] = (uint64_t)&type metadata for RestrictedGuestFeatureFlags;
  v29[4] = sub_24294EF38();
  v6 = sub_242963944();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v29);
  if ((v6 & 1) != 0)
  {
    v8 = objc_msgSend(v1, sel_currentUser);
    v7 = objc_msgSend(v1, sel_homeAccessControlForUser_, v8);

    LODWORD(v8) = objc_msgSend(v7, sel_isRestrictedGuest);
    if ((_DWORD)v8)
      LODWORD(v8) = objc_msgSend(v1, sel_homeLocationStatus) == (id)2;
  }
  else
  {
    LODWORD(v8) = 0;
  }
  if (qword_257207730 != -1)
    swift_once();
  v9 = __swift_project_value_buffer(v2, (uint64_t)qword_257207B40);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v9, v2);
  v10 = v1;
  v11 = sub_2429639BC();
  v12 = sub_242963BFC();
  if (!os_log_type_enabled(v11, v12))
  {

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    return (char)v8;
  }
  v26 = v3;
  v27 = v2;
  v13 = swift_slowAlloc();
  v24 = swift_slowAlloc();
  v29[0] = v24;
  *(_DWORD *)v13 = 136315906;
  v28 = sub_24294461C(0xD000000000000026, 0x8000000242966800, v29);
  sub_242963C5C();
  *(_WORD *)(v13 + 12) = 1024;
  v25 = (int)v8;
  LODWORD(v28) = (_DWORD)v8;
  sub_242963C5C();
  *(_WORD *)(v13 + 18) = 2080;
  v14 = objc_msgSend(v10, sel_name);
  v15 = sub_242963A88();
  v17 = v16;

  v28 = sub_24294461C(v15, v17, v29);
  sub_242963C5C();

  swift_bridgeObjectRelease();
  *(_WORD *)(v13 + 28) = 2080;
  objc_msgSend(v10, sel_homeLocationStatus);
  v18 = (id)HMStringFromHomeLocation();
  if (v18)
  {
    v19 = v18;
    v8 = (id)sub_242963A88();
    v21 = v20;

    v28 = sub_24294461C((uint64_t)v8, v21, v29);
    sub_242963C5C();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_242941000, v11, v12, "%s: result = %{BOOL}d, home: %s, location status %s", (uint8_t *)v13, 0x26u);
    v22 = v24;
    swift_arrayDestroy();
    MEMORY[0x2494E932C](v22, -1, -1);
    MEMORY[0x2494E932C](v13, -1, -1);

    (*(void (**)(char *, uint64_t))(v26 + 8))(v5, v27);
    LOBYTE(v8) = v25;
    return (char)v8;
  }

  __break(1u);
  return result;
}

Swift::Bool __swiftcall HMHome.hasEnabledResident()()
{
  void *v0;
  char v1;
  id v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  unsigned __int8 v9;

  v1 = HFForceRemoteAccessStateAvailable();
  v2 = objc_msgSend(v0, sel_residentDevices);
  sub_24294899C(0, &qword_257207F28);
  v3 = sub_242963B30();

  if (v3 >> 62)
    goto LABEL_14;
  v4 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (v4)
  {
    v5 = 4;
    while (1)
    {
      v6 = (v3 & 0xC000000000000001) != 0 ? (id)MEMORY[0x2494E8E28](v5 - 4, v3) : *(id *)(v3 + 8 * v5);
      v7 = v6;
      v8 = v5 - 3;
      if (__OFADD__(v5 - 4, 1))
        break;
      v9 = objc_msgSend(v6, sel_hf_isEnabled);

      if ((v9 & 1) != 0)
      {
        v1 = 1;
        goto LABEL_12;
      }
      ++v5;
      if (v8 == v4)
        goto LABEL_12;
    }
    __break(1u);
LABEL_14:
    swift_bridgeObjectRetain();
    v4 = sub_242963D4C();
    swift_bridgeObjectRelease();
  }
LABEL_12:
  swift_bridgeObjectRelease();
  return v1;
}

Swift::Bool __swiftcall HMHome.hasEnabledAndReachableResident()()
{
  void *v0;
  char v1;
  id v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  unsigned __int8 v9;

  v1 = HFForceRemoteAccessStateAvailable();
  v2 = objc_msgSend(v0, sel_residentDevices);
  sub_24294899C(0, &qword_257207F28);
  v3 = sub_242963B30();

  if (v3 >> 62)
    goto LABEL_15;
  v4 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (v4)
  {
    v5 = 4;
    while (1)
    {
      v6 = (v3 & 0xC000000000000001) != 0 ? (id)MEMORY[0x2494E8E28](v5 - 4, v3) : *(id *)(v3 + 8 * v5);
      v7 = v6;
      v8 = v5 - 3;
      if (__OFADD__(v5 - 4, 1))
        break;
      if (objc_msgSend(v6, sel_hf_isEnabled))
      {
        v9 = objc_msgSend(v7, sel_hf_isReachable);

        if ((v9 & 1) != 0)
        {
          v1 = 1;
          goto LABEL_13;
        }
      }
      else
      {

      }
      ++v5;
      if (v8 == v4)
        goto LABEL_13;
    }
    __break(1u);
LABEL_15:
    swift_bridgeObjectRetain();
    v4 = sub_242963D4C();
    swift_bridgeObjectRelease();
  }
LABEL_13:
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t sub_24295317C(unint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v4;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  id v12;
  unint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  void *v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v4 = v3;
  v25 = a2;
  v7 = sub_2429638CC();
  v23 = *(_QWORD *)(v7 - 8);
  v24 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = MEMORY[0x24BEE4AF8];
  if (a1 >> 62)
    goto LABEL_19;
  v10 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v10)
  {
    while (1)
    {
      v11 = 0;
      v22 = a1 & 0xC000000000000001;
      v20 = v4;
      v21 = a1 & 0xFFFFFFFFFFFFFF8;
      while (v22)
      {
        v12 = (id)MEMORY[0x2494E8E28](v11, a1);
LABEL_9:
        v4 = v12;
        v13 = v11 + 1;
        if (__OFADD__(v11, 1))
          goto LABEL_18;
        v14 = objc_msgSend(v12, sel_uniqueIdentifier);
        sub_2429638C0();

        v15 = sub_2429638B4();
        v17 = v16;
        (*(void (**)(char *, uint64_t))(v23 + 8))(v9, v24);
        if (v15 == v25 && v17 == a3)
        {
          swift_bridgeObjectRelease();
LABEL_14:
          sub_242963D10();
          sub_242963D28();
          sub_242963D34();
          sub_242963D1C();
          goto LABEL_5;
        }
        v18 = sub_242963DA0();
        swift_bridgeObjectRelease();
        if ((v18 & 1) != 0)
          goto LABEL_14;

LABEL_5:
        ++v11;
        if (v13 == v10)
          return v26;
      }
      if (v11 < *(_QWORD *)(v21 + 16))
        break;
      __break(1u);
LABEL_18:
      __break(1u);
LABEL_19:
      v10 = sub_242963D4C();
      if (!v10)
        return MEMORY[0x24BEE4AF8];
    }
    v12 = *(id *)(a1 + 8 * v11 + 32);
    goto LABEL_9;
  }
  return MEMORY[0x24BEE4AF8];
}

unint64_t sub_242953380()
{
  unint64_t result;
  uint64_t v1;

  result = qword_257207A30;
  if (!qword_257207A30)
  {
    v1 = sub_24294899C(255, (unint64_t *)&qword_257207A28);
    result = MEMORY[0x2494E92B4](MEMORY[0x24BEE5BD8], v1);
    atomic_store(result, (unint64_t *)&qword_257207A30);
  }
  return result;
}

uint64_t sub_2429533D8(unint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(char *, uint64_t);
  char *v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  int v28;
  int v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  Swift::String v33;
  _QWORD v35[3];
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  char *v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;

  v3 = v2;
  v43 = a2;
  v5 = sub_2429638CC();
  v41 = *(_QWORD *)(v5 - 8);
  v42 = v5;
  v6 = MEMORY[0x24BDAC7A8](v5);
  v40 = (char *)v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v39 = (char *)v35 - v8;
  v51 = MEMORY[0x24BEE4AF8];
  if (a1 >> 62)
    goto LABEL_13;
  v9 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v9; v9 = sub_242963D4C())
  {
    v35[1] = v3;
    v38 = a1 & 0xC000000000000001;
    v35[2] = type metadata accessor for NHOActionSetIntent();
    v36 = v9;
    v10 = 4;
    v37 = a1;
    while (1)
    {
      v11 = v38 ? (id)MEMORY[0x2494E8E28](v10 - 4, a1) : *(id *)(a1 + 8 * v10);
      v3 = v11;
      if (__OFADD__(v10 - 4, 1))
        break;
      v50 = v10 - 3;
      v12 = v43;
      v13 = objc_msgSend(v43, sel_uniqueIdentifier);
      v14 = v39;
      sub_2429638C0();

      v15 = sub_2429638B4();
      v48 = v16;
      v49 = v15;
      v17 = *(void (**)(char *, uint64_t))(v41 + 8);
      v18 = v14;
      v19 = v42;
      v17(v18, v42);
      v20 = objc_msgSend(v12, sel_name);
      v21 = sub_242963A88();
      v46 = v22;
      v47 = v21;

      v23 = objc_msgSend(v3, sel_uniqueIdentifier);
      v24 = v40;
      sub_2429638C0();

      v25 = sub_2429638B4();
      v44 = v26;
      v45 = v25;
      v17(v24, v19);
      v27 = objc_msgSend(v3, sel_name);
      v28 = sub_242963A88();
      LODWORD(v17) = v29;

      v30 = HMActionSet.iconSymbolName.getter();
      v32 = v31;
      HMActionSet.iconTintColor.getter();
      v33 = Color.toHexString()();
      swift_release();
      NHOActionSetIntent.__allocating_init(homeID:homeName:actionSetID:actionSetName:icon:iconTintColor:)(v49, v48, v47, v46, v45, v44, v28, (int)v17, v30, v32, v33._countAndFlagsBits, (uint64_t)v33._object);

      MEMORY[0x2494E8C54]();
      if (*(_QWORD *)((v51 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v51 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_242963B48();
      sub_242963B54();
      sub_242963B3C();
      ++v10;
      a1 = v37;
      if (v50 == v36)
      {
        swift_bridgeObjectRelease();
        return v51;
      }
    }
    __break(1u);
LABEL_13:
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();
  return MEMORY[0x24BEE4AF8];
}

uint64_t HFImageIconIdentifier.symbolMapping.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;
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
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char v63;

  v0 = sub_242963A88();
  v2 = v1;
  if (v0 == sub_242963A88() && v2 == v3)
    goto LABEL_13;
  v5 = sub_242963DA0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v5 & 1) != 0)
    return sub_242963A88();
  v6 = sub_242963A88();
  v8 = v7;
  if (v6 == sub_242963A88() && v8 == v9)
  {
    swift_bridgeObjectRelease_n();
    return sub_242963A88();
  }
  v11 = sub_242963DA0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v11 & 1) != 0)
    return sub_242963A88();
  v12 = sub_242963A88();
  v14 = v13;
  if (v12 == sub_242963A88() && v14 == v15)
    goto LABEL_13;
  v18 = sub_242963DA0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v18 & 1) != 0)
    return sub_242963A88();
  v19 = sub_242963A88();
  v21 = v20;
  if (v19 == sub_242963A88() && v21 == v22)
    goto LABEL_13;
  v23 = sub_242963DA0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v23 & 1) != 0)
    return sub_242963A88();
  v24 = sub_242963A88();
  v26 = v25;
  if (v24 == sub_242963A88() && v26 == v27)
  {
LABEL_13:
    swift_bridgeObjectRelease_n();
    return sub_242963A88();
  }
  v28 = sub_242963DA0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v28 & 1) != 0)
    return sub_242963A88();
  v29 = sub_242963A88();
  v31 = v30;
  if (v29 == sub_242963A88() && v31 == v32)
    goto LABEL_27;
  v33 = sub_242963DA0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v33 & 1) != 0)
    return 0xD000000000000011;
  v16 = 0x2E6E726F63706F70;
  v34 = sub_242963A88();
  v36 = v35;
  if (v34 == sub_242963A88() && v36 == v37)
    goto LABEL_32;
  v38 = sub_242963DA0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v38 & 1) != 0)
    return v16;
  v16 = 0x696E6B2E6B726F66;
  v39 = sub_242963A88();
  v41 = v40;
  if (v39 == sub_242963A88() && v41 == v42)
    goto LABEL_32;
  v43 = sub_242963DA0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v43 & 1) != 0)
    return v16;
  v44 = sub_242963A88();
  v46 = v45;
  if (v44 == sub_242963A88() && v46 == v47)
  {
    swift_bridgeObjectRelease_n();
    return 0xD000000000000013;
  }
  v48 = sub_242963DA0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v48 & 1) != 0)
    return 0xD000000000000013;
  v16 = 0x702E676E69797266;
  v49 = sub_242963A88();
  v51 = v50;
  if (v49 == sub_242963A88() && v51 == v52)
  {
LABEL_32:
    swift_bridgeObjectRelease_n();
    return v16;
  }
  v53 = sub_242963DA0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v53 & 1) != 0)
    return v16;
  v54 = sub_242963A88();
  v56 = v55;
  if (v54 == sub_242963A88() && v56 == v57)
  {
LABEL_27:
    swift_bridgeObjectRelease_n();
    return 0xD000000000000011;
  }
  v58 = sub_242963DA0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v58 & 1) != 0)
    return 0xD000000000000011;
  v59 = sub_242963A88();
  v61 = v60;
  if (v59 == sub_242963A88() && v61 == v62)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    v63 = sub_242963DA0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v63 & 1) == 0)
      return 0;
  }
  return 0x69662E7472616568;
}

uint64_t ServiceKind.isSupportedByWidgets.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  int v6;
  BOOL v14;
  uint64_t v15;
  uint64_t v17;

  v1 = v0;
  v2 = sub_242963974();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v1, v2);
  v6 = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v5, v2);
  v14 = v6 == *MEMORY[0x24BE4D7B8]
     || v6 == *MEMORY[0x24BE4D6E0]
     || v6 == *MEMORY[0x24BE4D878]
     || v6 == *MEMORY[0x24BE4D650]
     || v6 == *MEMORY[0x24BE4D810]
     || v6 == *MEMORY[0x24BE4D828]
     || v6 == *MEMORY[0x24BE4D5A0]
     || v6 == *MEMORY[0x24BE4D690]
     || v6 == *MEMORY[0x24BE4D6A0];
  v15 = v14;
  if (!v14)
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return v15;
}

uint64_t ServiceKind.debugDescription.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  int v6;
  uint64_t result;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v1 = v0;
  v2 = sub_242963974();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v1, v2);
  v6 = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v5, v2);
  if (v6 == *MEMORY[0x24BE4D7D0])
    return 1819047278;
  v8 = v6;
  result = 0xD000000000000010;
  if (v8 == *MEMORY[0x24BE4D748])
    return 0xD000000000000014;
  if (v8 != *MEMORY[0x24BE4D6C0])
  {
    if (v8 == *MEMORY[0x24BE4D5C0])
      return 0x6669727550726961;
    if (v8 != *MEMORY[0x24BE4D6C8])
    {
      if (v8 == *MEMORY[0x24BE4D848])
        return 0x79726574746162;
      if (v8 == *MEMORY[0x24BE4D630])
        return 0x6F436172656D6163;
      if (v8 == *MEMORY[0x24BE4D788] || v8 == *MEMORY[0x24BE4D790])
        return 0xD000000000000019;
      if (v8 == *MEMORY[0x24BE4D730])
        return 0xD000000000000013;
      if (v8 == *MEMORY[0x24BE4D758])
        return 0xD000000000000014;
      if (v8 == *MEMORY[0x24BE4D640])
        return 0x53746361746E6F63;
      if (v8 == *MEMORY[0x24BE4D7A8])
        return 0xD00000000000001DLL;
      if (v8 == *MEMORY[0x24BE4D5D0])
        return 0x74736F6E67616964;
      if (v8 == *MEMORY[0x24BE4D7C8])
        return 1919905636;
      if (v8 == *MEMORY[0x24BE4D868])
        return 0x6C6C6562726F6F64;
      if (v8 == *MEMORY[0x24BE4D7B8])
        return 7233894;
      if (v8 == *MEMORY[0x24BE4D808])
        return 0x746563756166;
      if (v8 == *MEMORY[0x24BE4D710])
        return 0xD000000000000011;
      if (v8 != *MEMORY[0x24BE4D6E0])
      {
        if (v8 == *MEMORY[0x24BE4D610])
          return 0x6F43726574616568;
        if (v8 == *MEMORY[0x24BE4D778])
          return 0xD000000000000016;
        if (v8 == *MEMORY[0x24BE4D670])
          return 0x79746964696D7568;
        if (v8 == *MEMORY[0x24BE4D5D8])
          return 0x756F537475706E69;
        if (v8 != *MEMORY[0x24BE4D6F0])
        {
          if (v8 == *MEMORY[0x24BE4D7D8])
            return 0x6C6562616CLL;
          if (v8 == *MEMORY[0x24BE4D578])
            return 0x736E65536B61656CLL;
          if (v8 == *MEMORY[0x24BE4D5E8])
          {
            v9 = 0x53746867696CLL;
            return v9 & 0xFFFFFFFFFFFFLL | 0x6E65000000000000;
          }
          if (v8 == *MEMORY[0x24BE4D878])
          {
            return 0x6C7562746867696CLL;
          }
          else if (v8 == *MEMORY[0x24BE4D678])
          {
            return 0x616E614D6B636F6CLL;
          }
          else if (v8 == *MEMORY[0x24BE4D650])
          {
            return 0x6863654D6B636F6CLL;
          }
          else if (v8 == *MEMORY[0x24BE4D580])
          {
            return 0x6F68706F7263696DLL;
          }
          else if (v8 == *MEMORY[0x24BE4D620])
          {
            return 0x65536E6F69746F6DLL;
          }
          else if (v8 == *MEMORY[0x24BE4D6B8])
          {
            return 0x636E61707563636FLL;
          }
          else if (v8 == *MEMORY[0x24BE4D810])
          {
            return 0x74656C74756FLL;
          }
          else if (v8 == *MEMORY[0x24BE4D688])
          {
            return 0x7974697275636573;
          }
          else if (v8 == *MEMORY[0x24BE4D7E0])
          {
            return 0x7374616C73;
          }
          else
          {
            if (v8 == *MEMORY[0x24BE4D5F8])
            {
              v9 = 0x53656B6F6D73;
              return v9 & 0xFFFFFFFFFFFFLL | 0x6E65000000000000;
            }
            if (v8 == *MEMORY[0x24BE4D850])
            {
              return 0x72656B61657073;
            }
            else if (v8 == *MEMORY[0x24BE4D798])
            {
              return 0xD00000000000001ALL;
            }
            else if (v8 == *MEMORY[0x24BE4D7A0])
            {
              return 0xD00000000000001BLL;
            }
            else if (v8 == *MEMORY[0x24BE4D828])
            {
              return 0x686374697773;
            }
            else if (v8 == *MEMORY[0x24BE4D658])
            {
              return 0x6F43746567726174;
            }
            else if (v8 == *MEMORY[0x24BE4D780])
            {
              return 0xD000000000000017;
            }
            else if (v8 == *MEMORY[0x24BE4D590])
            {
              return 0x69736976656C6574;
            }
            else if (v8 == *MEMORY[0x24BE4D720])
            {
              return 0xD000000000000011;
            }
            else if (v8 == *MEMORY[0x24BE4D5A0])
            {
              return 0x74736F6D72656874;
            }
            else if (v8 == *MEMORY[0x24BE4D7F8])
            {
              return 0x65766C6176;
            }
            else if (v8 == *MEMORY[0x24BE4D690])
            {
              return 0x74616C69746E6576;
            }
            else if (v8 == *MEMORY[0x24BE4D5B0])
            {
              return 0x74756F5269666977;
            }
            else if (v8 == *MEMORY[0x24BE4D660])
            {
              return 0x6574615369666977;
            }
            else if (v8 == *MEMORY[0x24BE4D830])
            {
              return 0x776F646E6977;
            }
            else if (v8 == *MEMORY[0x24BE4D6A0])
            {
              return 0x6F43776F646E6977;
            }
            else
            {
              (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
              return 0xD00000000000001ALL;
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t ServiceKind.widgetTogglingCharacteristicKind.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  int v8;
  unsigned int *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;

  v2 = v1;
  v4 = sub_242963974();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v2, v4);
  v8 = (*(uint64_t (**)(char *, uint64_t))(v5 + 88))(v7, v4);
  if (v8 != *MEMORY[0x24BE4D5C0]
    && v8 != *MEMORY[0x24BE4D7B8]
    && v8 != *MEMORY[0x24BE4D808]
    && v8 != *MEMORY[0x24BE4D610]
    && v8 != *MEMORY[0x24BE4D778]
    && v8 != *MEMORY[0x24BE4D6F0])
  {
    if (v8 != *MEMORY[0x24BE4D878])
    {
      if (v8 == *MEMORY[0x24BE4D580])
      {
LABEL_14:
        v9 = (unsigned int *)MEMORY[0x24BE4E348];
        goto LABEL_8;
      }
      if (v8 != *MEMORY[0x24BE4D810])
      {
        if (v8 == *MEMORY[0x24BE4D850])
          goto LABEL_14;
        if (v8 != *MEMORY[0x24BE4D828])
        {
          if (v8 != *MEMORY[0x24BE4D658]
            && v8 != *MEMORY[0x24BE4D590]
            && v8 != *MEMORY[0x24BE4D7F8]
            && v8 != *MEMORY[0x24BE4D690])
          {
            v14 = sub_242963998();
            (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(a1, 1, 1, v14);
            return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
          }
          goto LABEL_7;
        }
      }
    }
    v9 = (unsigned int *)MEMORY[0x24BE4E238];
    goto LABEL_8;
  }
LABEL_7:
  v9 = (unsigned int *)MEMORY[0x24BE4E368];
LABEL_8:
  v10 = *v9;
  v11 = sub_242963998();
  v12 = *(_QWORD *)(v11 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 104))(a1, v10, v11);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v12 + 56))(a1, 0, 1, v11);
}

uint64_t ServiceKind.widgetTargetCharacteristicType.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  int v8;
  unsigned int *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v2 = v1;
  v4 = sub_242963974();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v2, v4);
  v8 = (*(uint64_t (**)(char *, uint64_t))(v5 + 88))(v7, v4);
  if (v8 != *MEMORY[0x24BE4D7C8])
  {
    if (v8 == *MEMORY[0x24BE4D808])
      goto LABEL_4;
    if (v8 == *MEMORY[0x24BE4D6E0])
    {
      v9 = (unsigned int *)MEMORY[0x24BE4E280];
      goto LABEL_17;
    }
    if (v8 == *MEMORY[0x24BE4D610])
    {
      v9 = (unsigned int *)MEMORY[0x24BE4E2F8];
      goto LABEL_17;
    }
    if (v8 == *MEMORY[0x24BE4D778])
    {
      v9 = (unsigned int *)MEMORY[0x24BE4E330];
      goto LABEL_17;
    }
    if (v8 == *MEMORY[0x24BE4D650])
    {
      v9 = (unsigned int *)MEMORY[0x24BE4E310];
      goto LABEL_17;
    }
    if (v8 == *MEMORY[0x24BE4D688])
    {
      v9 = (unsigned int *)MEMORY[0x24BE4E320];
      goto LABEL_17;
    }
    if (v8 == *MEMORY[0x24BE4D5A0])
    {
      v9 = (unsigned int *)MEMORY[0x24BE4E308];
      goto LABEL_17;
    }
    if (v8 == *MEMORY[0x24BE4D7F8])
    {
LABEL_4:
      v9 = (unsigned int *)MEMORY[0x24BE4E368];
      goto LABEL_17;
    }
    if (v8 != *MEMORY[0x24BE4D830] && v8 != *MEMORY[0x24BE4D6A0])
    {
      v15 = *MEMORY[0x24BE4E368];
      v16 = sub_242963998();
      v17 = *(_QWORD *)(v16 - 8);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 104))(a1, v15, v16);
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v17 + 56))(a1, 0, 1, v16);
      return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    }
  }
  v9 = (unsigned int *)MEMORY[0x24BE4E270];
LABEL_17:
  v10 = *v9;
  v11 = sub_242963998();
  v12 = *(_QWORD *)(v11 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 104))(a1, v10, v11);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v12 + 56))(a1, 0, 1, v11);
}

uint64_t ServiceKind.widgetCurrentCharacteristicType.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  int v8;
  unsigned int *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v2 = v1;
  v4 = sub_242963974();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v2, v4);
  v8 = (*(uint64_t (**)(char *, uint64_t))(v5 + 88))(v7, v4);
  if (v8 != *MEMORY[0x24BE4D7C8])
  {
    if (v8 == *MEMORY[0x24BE4D6E0])
    {
      v9 = (unsigned int *)MEMORY[0x24BE4E2A0];
      goto LABEL_11;
    }
    if (v8 == *MEMORY[0x24BE4D650])
    {
      v9 = (unsigned int *)MEMORY[0x24BE4E318];
      goto LABEL_11;
    }
    if (v8 == *MEMORY[0x24BE4D688])
    {
      v9 = (unsigned int *)MEMORY[0x24BE4E328];
      goto LABEL_11;
    }
    if (v8 == *MEMORY[0x24BE4D5A0])
    {
      v9 = (unsigned int *)MEMORY[0x24BE4E2E0];
      goto LABEL_11;
    }
    if (v8 != *MEMORY[0x24BE4D830] && v8 != *MEMORY[0x24BE4D6A0])
    {
      v15 = *MEMORY[0x24BE4E238];
      v16 = sub_242963998();
      v17 = *(_QWORD *)(v16 - 8);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 104))(a1, v15, v16);
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v17 + 56))(a1, 0, 1, v16);
      return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    }
  }
  v9 = (unsigned int *)MEMORY[0x24BE4E278];
LABEL_11:
  v10 = *v9;
  v11 = sub_242963998();
  v12 = *(_QWORD *)(v11 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 104))(a1, v10, v11);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v12 + 56))(a1, 0, 1, v11);
}

uint64_t ServiceKind.widgetDisplayCharacteristicType.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  void (*v13)(unint64_t, _QWORD, uint64_t);
  unint64_t v14;
  unsigned int *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unsigned int *v20;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;

  v1 = v0;
  v2 = sub_242963974();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v44 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v1, v2);
  v6 = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v5, v2);
  if (v6 == *MEMORY[0x24BE4D5C0])
    goto LABEL_6;
  if (v6 != *MEMORY[0x24BE4D7C8])
  {
    if (v6 != *MEMORY[0x24BE4D7B8])
    {
      if (v6 == *MEMORY[0x24BE4D6E0])
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_257207F30);
        v16 = sub_242963998();
        v17 = *(_QWORD *)(v16 - 8);
        v22 = (*(unsigned __int8 *)(v17 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80);
        v11 = swift_allocObject();
        *(_OWORD *)(v11 + 16) = xmmword_242964B70;
        v19 = v11 + v22;
        v20 = (unsigned int *)MEMORY[0x24BE4E2D8];
        goto LABEL_7;
      }
      if (v6 == *MEMORY[0x24BE4D610])
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_257207F30);
        v7 = sub_242963998();
        v23 = *(_QWORD *)(v7 - 8);
        v24 = *(_QWORD *)(v23 + 72);
        v25 = (*(unsigned __int8 *)(v23 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v23 + 80);
        v11 = swift_allocObject();
        *(_OWORD *)(v11 + 16) = xmmword_2429651B0;
        v26 = v11 + v25;
        v13 = *(void (**)(unint64_t, _QWORD, uint64_t))(v23 + 104);
        v13(v26, *MEMORY[0x24BE4E2C8], v7);
        v13(v26 + v24, *MEMORY[0x24BE4E300], v7);
        v13(v26 + 2 * v24, *MEMORY[0x24BE4E2A8], v7);
        v14 = v26 + 3 * v24;
      }
      else
      {
        if (v6 == *MEMORY[0x24BE4D778])
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_257207F30);
          v7 = sub_242963998();
          v27 = *(_QWORD *)(v7 - 8);
          v28 = *(_QWORD *)(v27 + 72);
          v29 = (*(unsigned __int8 *)(v27 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v27 + 80);
          v11 = swift_allocObject();
          *(_OWORD *)(v11 + 16) = xmmword_242964FF0;
          v30 = v11 + v29;
          v13 = *(void (**)(unint64_t, _QWORD, uint64_t))(v27 + 104);
          v13(v30, *MEMORY[0x24BE4E368], v7);
          v13(v30 + v28, *MEMORY[0x24BE4E268], v7);
          v13(v30 + 2 * v28, *MEMORY[0x24BE4E2D0], v7);
          v13(v30 + 3 * v28, *MEMORY[0x24BE4E2E8], v7);
          v14 = v30 + 4 * v28;
          v15 = (unsigned int *)MEMORY[0x24BE4E338];
          goto LABEL_4;
        }
        if (v6 == *MEMORY[0x24BE4D6F0])
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_257207F30);
          v7 = sub_242963998();
          v31 = *(_QWORD *)(v7 - 8);
          v32 = *(_QWORD *)(v31 + 72);
          v33 = (*(unsigned __int8 *)(v31 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v31 + 80);
          v11 = swift_allocObject();
          *(_OWORD *)(v11 + 16) = xmmword_242965270;
          v34 = v11 + v33;
          v13 = *(void (**)(unint64_t, _QWORD, uint64_t))(v31 + 104);
          v13(v34, *MEMORY[0x24BE4E360], v7);
          v14 = v34 + v32;
          v15 = (unsigned int *)MEMORY[0x24BE4E248];
          goto LABEL_4;
        }
        if (v6 == *MEMORY[0x24BE4D878])
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_257207F30);
          v16 = sub_242963998();
          v17 = *(_QWORD *)(v16 - 8);
          v35 = (*(unsigned __int8 *)(v17 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80);
          v11 = swift_allocObject();
          *(_OWORD *)(v11 + 16) = xmmword_242964B70;
          v19 = v11 + v35;
          v20 = (unsigned int *)MEMORY[0x24BE4E230];
          goto LABEL_7;
        }
        if (v6 != *MEMORY[0x24BE4D5A0])
        {
          if (v6 == *MEMORY[0x24BE4D7F8])
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_257207F30);
            v16 = sub_242963998();
            v17 = *(_QWORD *)(v16 - 8);
            v40 = (*(unsigned __int8 *)(v17 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80);
            v11 = swift_allocObject();
            *(_OWORD *)(v11 + 16) = xmmword_242964B70;
            v19 = v11 + v40;
            v20 = (unsigned int *)MEMORY[0x24BE4E360];
            goto LABEL_7;
          }
          if (v6 != *MEMORY[0x24BE4D690])
          {
            if (v6 != *MEMORY[0x24BE4D830] && v6 != *MEMORY[0x24BE4D6A0])
            {
              __swift_instantiateConcreteTypeFromMangledName(&qword_257207F30);
              v41 = sub_242963998();
              v42 = *(_QWORD *)(v41 - 8);
              v43 = (*(unsigned __int8 *)(v42 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v42 + 80);
              v11 = swift_allocObject();
              *(_OWORD *)(v11 + 16) = xmmword_242964B70;
              (*(void (**)(unint64_t, _QWORD, uint64_t))(v42 + 104))(v11 + v43, *MEMORY[0x24BE4E238], v41);
              (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
              return v11;
            }
            goto LABEL_3;
          }
          goto LABEL_6;
        }
        __swift_instantiateConcreteTypeFromMangledName(&qword_257207F30);
        v7 = sub_242963998();
        v36 = *(_QWORD *)(v7 - 8);
        v37 = *(_QWORD *)(v36 + 72);
        v38 = (*(unsigned __int8 *)(v36 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v36 + 80);
        v11 = swift_allocObject();
        *(_OWORD *)(v11 + 16) = xmmword_242964FF0;
        v39 = v11 + v38;
        v13 = *(void (**)(unint64_t, _QWORD, uint64_t))(v36 + 104);
        v13(v39, *MEMORY[0x24BE4E2C8], v7);
        v13(v39 + v37, *MEMORY[0x24BE4E2C0], v7);
        v13(v39 + 2 * v37, *MEMORY[0x24BE4E2E0], v7);
        v13(v39 + 3 * v37, *MEMORY[0x24BE4E2A8], v7);
        v14 = v39 + 4 * v37;
      }
      v15 = (unsigned int *)MEMORY[0x24BE4E298];
      goto LABEL_4;
    }
LABEL_6:
    __swift_instantiateConcreteTypeFromMangledName(&qword_257207F30);
    v16 = sub_242963998();
    v17 = *(_QWORD *)(v16 - 8);
    v18 = (*(unsigned __int8 *)(v17 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80);
    v11 = swift_allocObject();
    *(_OWORD *)(v11 + 16) = xmmword_242964B70;
    v19 = v11 + v18;
    v20 = (unsigned int *)MEMORY[0x24BE4E268];
LABEL_7:
    (*(void (**)(unint64_t, _QWORD, uint64_t))(v17 + 104))(v19, *v20, v16);
    return v11;
  }
LABEL_3:
  __swift_instantiateConcreteTypeFromMangledName(&qword_257207F30);
  v7 = sub_242963998();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_QWORD *)(v8 + 72);
  v10 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_242965270;
  v12 = v11 + v10;
  v13 = *(void (**)(unint64_t, _QWORD, uint64_t))(v8 + 104);
  v13(v12, *MEMORY[0x24BE4E260], v7);
  v14 = v12 + v9;
  v15 = (unsigned int *)MEMORY[0x24BE4E2D8];
LABEL_4:
  v13(v14, *v15, v7);
  return v11;
}

uint64_t ServiceKind.widgetRelevantCharacteristic.getter()
{
  uint64_t v0;
  uint64_t v1;
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
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  unsigned int (*v22)(char *, uint64_t, uint64_t);
  void (*v23)(char *, uint64_t);
  char *v24;
  void (*v25)(char *, uint64_t);
  uint64_t v26;
  char *v27;
  void (*v28)(char *, uint64_t);
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  void (*v33)(char *, unint64_t, uint64_t);
  char *v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_257207F38);
  v1 = MEMORY[0x24BDAC7A8](v0);
  v37 = (uint64_t)&v35 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = MEMORY[0x24BDAC7A8](v1);
  v5 = (char *)&v35 - v4;
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v35 - v6;
  v8 = sub_242963998();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v36 = (char *)&v35 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v35 = (char *)&v35 - v13;
  v14 = MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v35 - v15;
  v17 = MEMORY[0x24BDAC7A8](v14);
  v19 = (char *)&v35 - v18;
  MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)&v35 - v20;
  v38 = MEMORY[0x24BEE4B08];
  ServiceKind.widgetTogglingCharacteristicKind.getter((uint64_t)v7);
  v22 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48);
  if (v22(v7, 1, v8) == 1)
  {
    sub_2429559CC((uint64_t)v7);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v21, v7, v8);
    (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v16, v21, v8);
    sub_242955E3C((uint64_t)v19, v16);
    v23 = *(void (**)(char *, uint64_t))(v9 + 8);
    v23(v19, v8);
    v23(v21, v8);
  }
  ServiceKind.widgetTargetCharacteristicType.getter((uint64_t)v5);
  if (v22(v5, 1, v8) == 1)
  {
    sub_2429559CC((uint64_t)v5);
  }
  else
  {
    v24 = v35;
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v35, v5, v8);
    (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v16, v24, v8);
    sub_242955E3C((uint64_t)v19, v16);
    v25 = *(void (**)(char *, uint64_t))(v9 + 8);
    v25(v19, v8);
    v25(v24, v8);
  }
  v26 = v37;
  ServiceKind.widgetCurrentCharacteristicType.getter(v37);
  if (v22((char *)v26, 1, v8) == 1)
  {
    sub_2429559CC(v26);
  }
  else
  {
    v27 = v36;
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 32))(v36, v26, v8);
    (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v16, v27, v8);
    sub_242955E3C((uint64_t)v19, v16);
    v28 = *(void (**)(char *, uint64_t))(v9 + 8);
    v28(v19, v8);
    v28(v27, v8);
  }
  v29 = ServiceKind.widgetDisplayCharacteristicType.getter();
  if (v29)
  {
    v30 = *(_QWORD *)(v29 + 16);
    if (v30)
    {
      v31 = v29 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
      v32 = *(_QWORD *)(v9 + 72);
      v33 = *(void (**)(char *, unint64_t, uint64_t))(v9 + 16);
      do
      {
        v33(v16, v31, v8);
        sub_242955E3C((uint64_t)v19, v16);
        (*(void (**)(char *, uint64_t))(v9 + 8))(v19, v8);
        v31 += v32;
        --v30;
      }
      while (v30);
    }
    swift_bridgeObjectRelease();
  }
  return v38;
}

uint64_t sub_2429559CC(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_257207F38);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t ServiceKind.iconColorBase.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  char v18;
  void (*v19)(char *, uint64_t);
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  void (*v24)(void);
  unsigned int v25;
  void (*v26)(char *, uint64_t);
  char v27;
  char *v28;
  char *v29;
  char v30;
  uint64_t v31;
  unint64_t v33;
  unint64_t v34;
  void (*v35)(char *, unint64_t, uint64_t);
  unsigned int v36;
  void (*v37)(void);
  char *v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;

  v1 = sub_242963974();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = MEMORY[0x24BDAC7A8](v1);
  v38 = (char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v33 - v5;
  v7 = sub_24296398C();
  v8 = (uint64_t (*)(uint64_t))MEMORY[0x24BE4E130];
  v9 = *(_QWORD *)(v7 - 8);
  v10 = MEMORY[0x24BDAC7A8](v7);
  v12 = (char *)&v33 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v10);
  v15 = (char *)&v33 - v14;
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v33 - v16;
  v40 = v0;
  sub_242963950();
  (*(void (**)(char *, _QWORD, uint64_t))(v9 + 104))(v15, *MEMORY[0x24BE4E110], v7);
  sub_24294AE80(&qword_257207F40, v8, MEMORY[0x24BE4E158]);
  sub_242963B18();
  sub_242963B18();
  v39 = v12;
  if (v43 == v41 && v44 == v42)
    v18 = 1;
  else
    v18 = sub_242963DA0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v19 = *(void (**)(char *, uint64_t))(v9 + 8);
  v19(v15, v7);
  v19(v17, v7);
  if ((v18 & 1) == 0)
    goto LABEL_12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257207F48);
  v20 = *(_QWORD *)(v2 + 72);
  v21 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v22 = swift_allocObject();
  *(_OWORD *)(v22 + 16) = xmmword_242965280;
  v23 = v22 + v21;
  v24 = *(void (**)(void))(v2 + 104);
  ((void (*)(unint64_t, _QWORD, uint64_t))v24)(v23, *MEMORY[0x24BE4D810], v1);
  v34 = v23 + v20;
  v24();
  v25 = *MEMORY[0x24BE4D878];
  v33 = v23 + 2 * v20;
  v36 = v25;
  v37 = v24;
  v24();
  v35 = *(void (**)(char *, unint64_t, uint64_t))(v2 + 16);
  v35(v6, v23, v1);
  sub_24294AE80((unint64_t *)&qword_257207F50, (uint64_t (*)(uint64_t))MEMORY[0x24BE4D888], MEMORY[0x24BE4D8B0]);
  LOBYTE(v20) = sub_242963A64();
  v26 = *(void (**)(char *, uint64_t))(v2 + 8);
  swift_bridgeObjectRetain();
  v26(v6, v1);
  if ((v20 & 1) == 0)
  {
    v35(v6, v34, v1);
    v27 = sub_242963A64();
    v26(v6, v1);
    if ((v27 & 1) == 0)
    {
      v35(v6, v33, v1);
      v30 = sub_242963A64();
      v26(v6, v1);
      swift_bridgeObjectRelease();
      if ((v30 & 1) != 0)
        goto LABEL_9;
      swift_setDeallocating();
      swift_arrayDestroy();
      swift_deallocClassInstance();
LABEL_12:
      v29 = v39;
      sub_242963950();
      goto LABEL_13;
    }
  }
  swift_bridgeObjectRelease();
LABEL_9:
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  v28 = v38;
  ((void (*)(char *, _QWORD, uint64_t))v37)(v38, v36, v1);
  v29 = v39;
  sub_242963950();
  v26(v28, v1);
LABEL_13:
  v31 = sub_242963980();
  v19(v29, v7);
  return v31;
}

uint64_t sub_242955E3C(uint64_t a1, char *a2)
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
  v6 = sub_242963998();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *v3;
  sub_24294AE80(&qword_257207F58, v11, MEMORY[0x24BE4E380]);
  swift_bridgeObjectRetain();
  v31 = a2;
  v12 = sub_242963A58();
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
      sub_24294AE80(&qword_257207F60, (uint64_t (*)(uint64_t))MEMORY[0x24BE4E370], MEMORY[0x24BE4E388]);
      v21 = sub_242963A64();
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
    sub_24295664C((uint64_t)v9, v14, isUniquelyReferenced_nonNull_native);
    *v3 = v32;
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, char *, uint64_t))(v23 + 32))(a1, v25, v6);
    return 1;
  }
}

uint64_t sub_242956098(uint64_t a1, uint64_t (*a2)(uint64_t), uint64_t *a3, unint64_t *a4, uint64_t a5)
{
  uint64_t *v5;
  uint64_t *v7;
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
  unint64_t v25;
  int64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(char *, unint64_t, uint64_t);
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
  uint64_t v43;
  uint64_t (*v44)(uint64_t);
  unint64_t *v45;
  uint64_t v46;

  v45 = a4;
  v46 = a5;
  v7 = v5;
  v44 = a2;
  v8 = a2(0);
  v43 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v39 - v9;
  v11 = *v5;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  v12 = sub_242963CD4();
  v13 = v12;
  if (*(_QWORD *)(v11 + 16))
  {
    v14 = 1 << *(_BYTE *)(v11 + 32);
    v15 = *(_QWORD *)(v11 + 56);
    v42 = (_QWORD *)(v11 + 56);
    if (v14 < 64)
      v16 = ~(-1 << v14);
    else
      v16 = -1;
    v17 = v16 & v15;
    v40 = v5;
    v41 = (unint64_t)(v14 + 63) >> 6;
    v18 = v12 + 56;
    result = swift_retain();
    v20 = 0;
    while (1)
    {
      if (v17)
      {
        v22 = __clz(__rbit64(v17));
        v17 &= v17 - 1;
        v23 = v22 | (v20 << 6);
      }
      else
      {
        v24 = v20 + 1;
        if (__OFADD__(v20, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v24 >= v41)
          goto LABEL_33;
        v25 = v42[v24];
        ++v20;
        if (!v25)
        {
          v20 = v24 + 1;
          if (v24 + 1 >= v41)
            goto LABEL_33;
          v25 = v42[v20];
          if (!v25)
          {
            v20 = v24 + 2;
            if (v24 + 2 >= v41)
              goto LABEL_33;
            v25 = v42[v20];
            if (!v25)
            {
              v26 = v24 + 3;
              if (v26 >= v41)
              {
LABEL_33:
                swift_release();
                v7 = v40;
                v38 = 1 << *(_BYTE *)(v11 + 32);
                if (v38 > 63)
                  bzero(v42, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v42 = -1 << v38;
                *(_QWORD *)(v11 + 16) = 0;
                break;
              }
              v25 = v42[v26];
              if (!v25)
              {
                while (1)
                {
                  v20 = v26 + 1;
                  if (__OFADD__(v26, 1))
                    goto LABEL_39;
                  if (v20 >= v41)
                    goto LABEL_33;
                  v25 = v42[v20];
                  ++v26;
                  if (v25)
                    goto LABEL_23;
                }
              }
              v20 = v26;
            }
          }
        }
LABEL_23:
        v17 = (v25 - 1) & v25;
        v23 = __clz(__rbit64(v25)) + (v20 << 6);
      }
      v27 = v11;
      v28 = *(_QWORD *)(v11 + 48);
      v29 = *(_QWORD *)(v43 + 72);
      v30 = *(void (**)(char *, unint64_t, uint64_t))(v43 + 32);
      v30(v10, v28 + v29 * v23, v8);
      sub_24294AE80(v45, v44, v46);
      result = sub_242963A58();
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
            goto LABEL_38;
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
      result = ((uint64_t (*)(unint64_t, char *, uint64_t))v30)(*(_QWORD *)(v13 + 48) + v21 * v29, v10, v8);
      ++*(_QWORD *)(v13 + 16);
      v11 = v27;
    }
  }
  result = swift_release();
  *v7 = v13;
  return result;
}

uint64_t sub_2429563F8(uint64_t a1, unint64_t a2, char a3)
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
  uint64_t v17;
  void (*v18)(char *, unint64_t, uint64_t);
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t result;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;

  v27 = a1;
  v6 = sub_24296398C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(_QWORD *)(*v3 + 16);
  v11 = *(_QWORD *)(*v3 + 24);
  v26 = v3;
  if (v11 > v10 && (a3 & 1) != 0)
    goto LABEL_12;
  v12 = v10 + 1;
  if ((a3 & 1) != 0)
  {
    sub_242956098(v12, (uint64_t (*)(uint64_t))MEMORY[0x24BE4E130], &qword_257207F70, &qword_257207A40, MEMORY[0x24BE4E148]);
  }
  else
  {
    if (v11 > v10)
    {
      sub_2429568A0((uint64_t (*)(_QWORD))MEMORY[0x24BE4E130], &qword_257207F70);
      goto LABEL_12;
    }
    sub_242956AC4(v12, (uint64_t (*)(uint64_t))MEMORY[0x24BE4E130], &qword_257207F70, &qword_257207A40, MEMORY[0x24BE4E148]);
  }
  v13 = *v3;
  sub_24294AE80(&qword_257207A40, (uint64_t (*)(uint64_t))MEMORY[0x24BE4E130], MEMORY[0x24BE4E148]);
  v14 = sub_242963A58();
  v15 = -1 << *(_BYTE *)(v13 + 32);
  a2 = v14 & ~v15;
  if (((*(_QWORD *)(v13 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v16 = ~v15;
    v17 = *(_QWORD *)(v7 + 72);
    v18 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    do
    {
      v18(v9, *(_QWORD *)(v13 + 48) + v17 * a2, v6);
      sub_24294AE80(&qword_257207A48, (uint64_t (*)(uint64_t))MEMORY[0x24BE4E130], MEMORY[0x24BE4E150]);
      v19 = sub_242963A64();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
      if ((v19 & 1) != 0)
        goto LABEL_15;
      a2 = (a2 + 1) & v16;
    }
    while (((*(_QWORD *)(v13 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_12:
  v20 = v27;
  v21 = *v26;
  *(_QWORD *)(*v26 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v7 + 32))(*(_QWORD *)(v21 + 48) + *(_QWORD *)(v7 + 72) * a2, v20, v6);
  v23 = *(_QWORD *)(v21 + 16);
  v24 = __OFADD__(v23, 1);
  v25 = v23 + 1;
  if (!v24)
  {
    *(_QWORD *)(v21 + 16) = v25;
    return result;
  }
  __break(1u);
LABEL_15:
  result = sub_242963DAC();
  __break(1u);
  return result;
}

uint64_t sub_24295664C(uint64_t a1, unint64_t a2, char a3)
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
  uint64_t v17;
  void (*v18)(char *, unint64_t, uint64_t);
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t result;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;

  v27 = a1;
  v6 = sub_242963998();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(_QWORD *)(*v3 + 16);
  v11 = *(_QWORD *)(*v3 + 24);
  v26 = v3;
  if (v11 > v10 && (a3 & 1) != 0)
    goto LABEL_12;
  v12 = v10 + 1;
  if ((a3 & 1) != 0)
  {
    sub_242956098(v12, (uint64_t (*)(uint64_t))MEMORY[0x24BE4E370], &qword_257207F68, &qword_257207F58, MEMORY[0x24BE4E380]);
  }
  else
  {
    if (v11 > v10)
    {
      sub_2429568A0((uint64_t (*)(_QWORD))MEMORY[0x24BE4E370], &qword_257207F68);
      goto LABEL_12;
    }
    sub_242956AC4(v12, (uint64_t (*)(uint64_t))MEMORY[0x24BE4E370], &qword_257207F68, &qword_257207F58, MEMORY[0x24BE4E380]);
  }
  v13 = *v3;
  sub_24294AE80(&qword_257207F58, (uint64_t (*)(uint64_t))MEMORY[0x24BE4E370], MEMORY[0x24BE4E380]);
  v14 = sub_242963A58();
  v15 = -1 << *(_BYTE *)(v13 + 32);
  a2 = v14 & ~v15;
  if (((*(_QWORD *)(v13 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v16 = ~v15;
    v17 = *(_QWORD *)(v7 + 72);
    v18 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    do
    {
      v18(v9, *(_QWORD *)(v13 + 48) + v17 * a2, v6);
      sub_24294AE80(&qword_257207F60, (uint64_t (*)(uint64_t))MEMORY[0x24BE4E370], MEMORY[0x24BE4E388]);
      v19 = sub_242963A64();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
      if ((v19 & 1) != 0)
        goto LABEL_15;
      a2 = (a2 + 1) & v16;
    }
    while (((*(_QWORD *)(v13 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_12:
  v20 = v27;
  v21 = *v26;
  *(_QWORD *)(*v26 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v7 + 32))(*(_QWORD *)(v21 + 48) + *(_QWORD *)(v7 + 72) * a2, v20, v6);
  v23 = *(_QWORD *)(v21 + 16);
  v24 = __OFADD__(v23, 1);
  v25 = v23 + 1;
  if (!v24)
  {
    *(_QWORD *)(v21 + 16) = v25;
    return result;
  }
  __break(1u);
LABEL_15:
  result = sub_242963DAC();
  __break(1u);
  return result;
}

void *sub_2429568A0(uint64_t (*a1)(_QWORD), uint64_t *a2)
{
  uint64_t *v2;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *result;
  uint64_t v13;
  unint64_t v14;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  int64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  int64_t v24;
  unint64_t v25;
  int64_t v26;
  uint64_t v27;
  uint64_t *v28;

  v4 = v2;
  v5 = a1(0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v27 - v7;
  __swift_instantiateConcreteTypeFromMangledName(a2);
  v9 = *v2;
  v10 = sub_242963CC8();
  v11 = v10;
  if (!*(_QWORD *)(v9 + 16))
  {
    result = (void *)swift_release();
LABEL_30:
    *v4 = v11;
    return result;
  }
  v28 = v4;
  result = (void *)(v10 + 56);
  v13 = v9 + 56;
  v14 = (unint64_t)((1 << *(_BYTE *)(v11 + 32)) + 63) >> 6;
  if (v11 != v9 || (unint64_t)result >= v9 + 56 + 8 * v14)
    result = memmove(result, (const void *)(v9 + 56), 8 * v14);
  v16 = 0;
  *(_QWORD *)(v11 + 16) = *(_QWORD *)(v9 + 16);
  v17 = 1 << *(_BYTE *)(v9 + 32);
  v18 = -1;
  if (v17 < 64)
    v18 = ~(-1 << v17);
  v19 = v18 & *(_QWORD *)(v9 + 56);
  v20 = (unint64_t)(v17 + 63) >> 6;
  while (1)
  {
    if (v19)
    {
      v21 = __clz(__rbit64(v19));
      v19 &= v19 - 1;
      v22 = v21 | (v16 << 6);
      goto LABEL_12;
    }
    v24 = v16 + 1;
    if (__OFADD__(v16, 1))
    {
      __break(1u);
      goto LABEL_32;
    }
    if (v24 >= v20)
      goto LABEL_28;
    v25 = *(_QWORD *)(v13 + 8 * v24);
    ++v16;
    if (!v25)
    {
      v16 = v24 + 1;
      if (v24 + 1 >= v20)
        goto LABEL_28;
      v25 = *(_QWORD *)(v13 + 8 * v16);
      if (!v25)
      {
        v16 = v24 + 2;
        if (v24 + 2 >= v20)
          goto LABEL_28;
        v25 = *(_QWORD *)(v13 + 8 * v16);
        if (!v25)
          break;
      }
    }
LABEL_27:
    v19 = (v25 - 1) & v25;
    v22 = __clz(__rbit64(v25)) + (v16 << 6);
LABEL_12:
    v23 = *(_QWORD *)(v6 + 72) * v22;
    (*(void (**)(char *, unint64_t, uint64_t))(v6 + 16))(v8, *(_QWORD *)(v9 + 48) + v23, v5);
    result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v6 + 32))(*(_QWORD *)(v11 + 48) + v23, v8, v5);
  }
  v26 = v24 + 3;
  if (v26 >= v20)
  {
LABEL_28:
    result = (void *)swift_release();
    v4 = v28;
    goto LABEL_30;
  }
  v25 = *(_QWORD *)(v13 + 8 * v26);
  if (v25)
  {
    v16 = v26;
    goto LABEL_27;
  }
  while (1)
  {
    v16 = v26 + 1;
    if (__OFADD__(v26, 1))
      break;
    if (v16 >= v20)
      goto LABEL_28;
    v25 = *(_QWORD *)(v13 + 8 * v16);
    ++v26;
    if (v25)
      goto LABEL_27;
  }
LABEL_32:
  __break(1u);
  return result;
}

uint64_t sub_242956AC4(uint64_t a1, uint64_t (*a2)(uint64_t), uint64_t *a3, unint64_t *a4, uint64_t a5)
{
  uint64_t *v5;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t result;
  int64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  int64_t v25;
  unint64_t v26;
  int64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  char v32;
  unint64_t v33;
  BOOL v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  int64_t v38;
  uint64_t (*v39)(uint64_t);
  unint64_t *v40;
  uint64_t v41;

  v40 = a4;
  v41 = a5;
  v7 = v5;
  v39 = a2;
  v8 = a2(0);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v36 - v10;
  v12 = *v5;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  v13 = sub_242963CD4();
  v14 = v13;
  if (!*(_QWORD *)(v12 + 16))
  {
    result = swift_release();
LABEL_35:
    *v7 = v14;
    return result;
  }
  v15 = 1 << *(_BYTE *)(v12 + 32);
  v16 = *(_QWORD *)(v12 + 56);
  v36 = v5;
  v37 = v12 + 56;
  if (v15 < 64)
    v17 = ~(-1 << v15);
  else
    v17 = -1;
  v18 = v17 & v16;
  v38 = (unint64_t)(v15 + 63) >> 6;
  v19 = v13 + 56;
  result = swift_retain();
  v21 = 0;
  while (1)
  {
    if (v18)
    {
      v23 = __clz(__rbit64(v18));
      v18 &= v18 - 1;
      v24 = v23 | (v21 << 6);
      goto LABEL_24;
    }
    v25 = v21 + 1;
    if (__OFADD__(v21, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v25 >= v38)
      goto LABEL_33;
    v26 = *(_QWORD *)(v37 + 8 * v25);
    ++v21;
    if (!v26)
    {
      v21 = v25 + 1;
      if (v25 + 1 >= v38)
        goto LABEL_33;
      v26 = *(_QWORD *)(v37 + 8 * v21);
      if (!v26)
      {
        v21 = v25 + 2;
        if (v25 + 2 >= v38)
          goto LABEL_33;
        v26 = *(_QWORD *)(v37 + 8 * v21);
        if (!v26)
          break;
      }
    }
LABEL_23:
    v18 = (v26 - 1) & v26;
    v24 = __clz(__rbit64(v26)) + (v21 << 6);
LABEL_24:
    v28 = *(_QWORD *)(v9 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v9 + 16))(v11, *(_QWORD *)(v12 + 48) + v28 * v24, v8);
    sub_24294AE80(v40, v39, v41);
    result = sub_242963A58();
    v29 = -1 << *(_BYTE *)(v14 + 32);
    v30 = result & ~v29;
    v31 = v30 >> 6;
    if (((-1 << v30) & ~*(_QWORD *)(v19 + 8 * (v30 >> 6))) != 0)
    {
      v22 = __clz(__rbit64((-1 << v30) & ~*(_QWORD *)(v19 + 8 * (v30 >> 6)))) | v30 & 0x7FFFFFFFFFFFFFC0;
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
          goto LABEL_36;
        }
        v34 = v31 == v33;
        if (v31 == v33)
          v31 = 0;
        v32 |= v34;
        v35 = *(_QWORD *)(v19 + 8 * v31);
      }
      while (v35 == -1);
      v22 = __clz(__rbit64(~v35)) + (v31 << 6);
    }
    *(_QWORD *)(v19 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v9 + 32))(*(_QWORD *)(v14 + 48) + v22 * v28, v11, v8);
    ++*(_QWORD *)(v14 + 16);
  }
  v27 = v25 + 3;
  if (v27 >= v38)
  {
LABEL_33:
    result = swift_release_n();
    v7 = v36;
    goto LABEL_35;
  }
  v26 = *(_QWORD *)(v37 + 8 * v27);
  if (v26)
  {
    v21 = v27;
    goto LABEL_23;
  }
  while (1)
  {
    v21 = v27 + 1;
    if (__OFADD__(v27, 1))
      break;
    if (v21 >= v38)
      goto LABEL_33;
    v26 = *(_QWORD *)(v37 + 8 * v21);
    ++v27;
    if (v26)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

id NHOActionSetIntent.__allocating_init(homeID:homeName:actionSetID:actionSetName:icon:iconTintColor:)(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  objc_class *v12;
  id v13;

  v13 = objc_msgSend(objc_allocWithZone(v12), sel_init);
  swift_retain();
  sub_242963770();
  swift_release();
  swift_retain();
  sub_242963770();
  swift_release();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_242963770();
  swift_release();
  swift_retain();
  sub_242963770();
  swift_release();
  swift_retain();
  sub_242963770();
  swift_release();
  swift_retain();
  sub_242963770();
  swift_release();
  swift_retain();
  sub_242963770();
  swift_release();
  swift_retain();
  sub_242963770();

  swift_release();
  return v13;
}

uint64_t sub_242956FD4()
{
  uint64_t v0;

  v0 = sub_242963824();
  __swift_allocate_value_buffer(v0, qword_257207F78);
  __swift_project_value_buffer(v0, (uint64_t)qword_257207F78);
  return sub_242963818();
}

uint64_t static NHOActionSetIntent.title.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_242948F3C(&qword_257207768, (uint64_t (*)(_QWORD))MEMORY[0x24BDCD380], (uint64_t)qword_257207F78, a1);
}

uint64_t static NHOActionSetIntent.title.setter(uint64_t a1)
{
  return sub_242948FEC(a1, &qword_257207768, (uint64_t (*)(_QWORD))MEMORY[0x24BDCD380], (uint64_t)qword_257207F78);
}

uint64_t (*static NHOActionSetIntent.title.modify())()
{
  uint64_t v0;

  if (qword_257207768 != -1)
    swift_once();
  v0 = sub_242963824();
  __swift_project_value_buffer(v0, (uint64_t)qword_257207F78);
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_2429570EC()
{
  uint64_t v0;

  v0 = sub_2429637B8();
  __swift_allocate_value_buffer(v0, qword_257207F90);
  __swift_project_value_buffer(v0, (uint64_t)qword_257207F90);
  return sub_2429637AC();
}

uint64_t static NHOActionSetIntent.description.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_242948F3C(&qword_257207770, (uint64_t (*)(_QWORD))MEMORY[0x24BDB5800], (uint64_t)qword_257207F90, a1);
}

uint64_t static NHOActionSetIntent.description.setter(uint64_t a1)
{
  return sub_242948FEC(a1, &qword_257207770, (uint64_t (*)(_QWORD))MEMORY[0x24BDB5800], (uint64_t)qword_257207F90);
}

uint64_t (*static NHOActionSetIntent.description.modify())()
{
  uint64_t v0;

  if (qword_257207770 != -1)
    swift_once();
  v0 = sub_2429637B8();
  __swift_project_value_buffer(v0, (uint64_t)qword_257207F90);
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t NHOActionSetIntent.homeID.getter()
{
  return sub_242949240();
}

uint64_t NHOActionSetIntent.homeID.setter()
{
  return sub_24294930C();
}

uint64_t (*NHOActionSetIntent.homeID.modify(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = *(_QWORD *)(v1 + OBJC_IVAR___NHOActionSetIntent__homeID);
  swift_retain();
  v3[5] = sub_242963758();
  return sub_2429491A0;
}

uint64_t NHOActionSetIntent.$homeID.getter()
{
  return sub_242949494();
}

uint64_t NHOActionSetIntent.homeName.getter()
{
  return sub_242949240();
}

uint64_t NHOActionSetIntent.homeName.setter()
{
  return sub_24294930C();
}

uint64_t (*NHOActionSetIntent.homeName.modify(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = *(_QWORD *)(v1 + OBJC_IVAR___NHOActionSetIntent__homeName);
  swift_retain();
  v3[5] = sub_242963758();
  return sub_2429491A0;
}

uint64_t NHOActionSetIntent.$homeName.getter()
{
  return sub_242949494();
}

uint64_t NHOActionSetIntent.actionSetID.getter()
{
  return sub_242949240();
}

uint64_t NHOActionSetIntent.actionSetID.setter()
{
  return sub_24294930C();
}

uint64_t (*NHOActionSetIntent.actionSetID.modify(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = *(_QWORD *)(v1 + OBJC_IVAR___NHOActionSetIntent__actionSetID);
  swift_retain();
  v3[5] = sub_242963758();
  return sub_2429491A0;
}

uint64_t NHOActionSetIntent.$actionSetID.getter()
{
  return sub_242949494();
}

uint64_t NHOActionSetIntent.actionSetName.getter()
{
  return sub_242949240();
}

uint64_t NHOActionSetIntent.actionSetName.setter()
{
  return sub_24294930C();
}

uint64_t (*NHOActionSetIntent.actionSetName.modify(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = *(_QWORD *)(v1 + OBJC_IVAR___NHOActionSetIntent__actionSetName);
  swift_retain();
  v3[5] = sub_242963758();
  return sub_2429491A0;
}

uint64_t NHOActionSetIntent.$actionSetName.getter()
{
  return sub_242949494();
}

uint64_t NHOActionSetIntent.icon.getter()
{
  return sub_242949240();
}

uint64_t NHOActionSetIntent.icon.setter()
{
  return sub_24294930C();
}

uint64_t (*NHOActionSetIntent.icon.modify(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = *(_QWORD *)(v1 + OBJC_IVAR___NHOActionSetIntent__icon);
  swift_retain();
  v3[5] = sub_242963758();
  return sub_2429491A0;
}

uint64_t NHOActionSetIntent.$icon.getter()
{
  return sub_242949494();
}

uint64_t NHOActionSetIntent.useHomeKitRecommendations.getter()
{
  unsigned __int8 v1;

  swift_retain();
  sub_242963764();
  swift_release();
  return v1;
}

uint64_t NHOActionSetIntent.useHomeKitRecommendations.setter()
{
  swift_retain();
  sub_242963770();
  return swift_release();
}

uint64_t sub_242957650@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;
  char v3;

  swift_retain();
  sub_242963764();
  result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_2429576A4()
{
  swift_retain();
  sub_242963770();
  return swift_release();
}

uint64_t (*NHOActionSetIntent.useHomeKitRecommendations.modify(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = *(_QWORD *)(v1 + OBJC_IVAR___NHOActionSetIntent__useHomeKitRecommendations);
  swift_retain();
  v3[5] = sub_242963758();
  return sub_2429491A0;
}

uint64_t NHOActionSetIntent.$useHomeKitRecommendations.getter()
{
  return sub_242949494();
}

id sub_24295776C(void *a1)
{
  id v1;
  void *v2;

  v1 = a1;
  swift_retain();
  sub_242963764();

  swift_release();
  v2 = (void *)sub_242963A7C();
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t NHOActionSetIntent.accessoriesAndScenes.getter()
{
  return sub_242949240();
}

uint64_t sub_2429577EC(void *a1)
{
  id v2;

  sub_242963A88();
  v2 = a1;
  swift_retain();
  sub_242963770();

  return swift_release();
}

uint64_t NHOActionSetIntent.accessoriesAndScenes.setter()
{
  return sub_24294930C();
}

uint64_t (*NHOActionSetIntent.accessoriesAndScenes.modify(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = *(_QWORD *)(v1 + OBJC_IVAR___NHOActionSetIntent__accessoriesAndScenes);
  swift_retain();
  v3[5] = sub_242963758();
  return sub_2429491A0;
}

uint64_t NHOActionSetIntent.$accessoriesAndScenes.getter()
{
  return sub_242949494();
}

uint64_t NHOActionSetIntent.requestConfirmationText.getter()
{
  return sub_242949240();
}

uint64_t NHOActionSetIntent.requestConfirmationText.setter()
{
  return sub_24294930C();
}

uint64_t (*NHOActionSetIntent.requestConfirmationText.modify(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = *(_QWORD *)(v1 + OBJC_IVAR___NHOActionSetIntent__requestConfirmationText);
  swift_retain();
  v3[5] = sub_242963758();
  return sub_2429491A0;
}

uint64_t NHOActionSetIntent.$requestConfirmationText.getter()
{
  return sub_242949494();
}

uint64_t NHOActionSetIntent.requestConfirmationIcon.getter()
{
  return sub_242949240();
}

uint64_t NHOActionSetIntent.requestConfirmationIcon.setter()
{
  return sub_24294930C();
}

uint64_t (*NHOActionSetIntent.requestConfirmationIcon.modify(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = *(_QWORD *)(v1 + OBJC_IVAR___NHOActionSetIntent__requestConfirmationIcon);
  swift_retain();
  v3[5] = sub_242963758();
  return sub_2429491A0;
}

uint64_t NHOActionSetIntent.$requestConfirmationIcon.getter()
{
  return sub_242949494();
}

uint64_t NHOActionSetIntent.isSmartStack.getter()
{
  unsigned __int8 v1;

  swift_retain();
  sub_242963764();
  swift_release();
  return v1;
}

uint64_t sub_242957A20@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;
  char v3;

  swift_retain();
  sub_242963764();
  result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_242957A74()
{
  swift_retain();
  sub_242963770();
  return swift_release();
}

uint64_t NHOActionSetIntent.isSmartStack.setter()
{
  swift_retain();
  sub_242963770();
  return swift_release();
}

uint64_t (*NHOActionSetIntent.isSmartStack.modify(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = *(_QWORD *)(v1 + OBJC_IVAR___NHOActionSetIntent__isSmartStack);
  swift_retain();
  v3[5] = sub_242963758();
  return sub_2429491A0;
}

uint64_t NHOActionSetIntent.$isSmartStack.getter()
{
  return sub_242949494();
}

uint64_t NHOActionSetIntent.iconTintColor.getter()
{
  return sub_242949240();
}

uint64_t sub_242957B84@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;

  swift_retain();
  sub_242963764();
  result = swift_release();
  *a1 = v3;
  a1[1] = v4;
  return result;
}

uint64_t NHOActionSetIntent.iconTintColor.setter()
{
  return sub_24294930C();
}

uint64_t (*NHOActionSetIntent.iconTintColor.modify(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = *(_QWORD *)(v1 + OBJC_IVAR___NHOActionSetIntent__iconTintColor);
  swift_retain();
  v3[5] = sub_242963758();
  return sub_2429491A0;
}

uint64_t NHOActionSetIntent.$iconTintColor.getter()
{
  return sub_242949494();
}

id NHOActionSetIntent.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id NHOActionSetIntent.init()()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
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
  void (*v27)(char *, uint64_t, uint64_t);
  char *v28;
  uint64_t v29;
  char *v30;
  char *v31;
  char *v32;
  void (*v33)(char *, uint64_t, uint64_t, uint64_t);
  void (*v34)(char *, uint64_t, uint64_t, uint64_t);
  char *v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  void (*v43)(char *, uint64_t, uint64_t, uint64_t);
  char *v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  void (*v49)(char *, uint64_t, uint64_t, uint64_t);
  char *v50;
  uint64_t v51;
  char *v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  void (*v56)(char *, uint64_t, uint64_t);
  char *v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  char *v61;
  char *v62;
  uint64_t v63;
  void (*v64)(char *, uint64_t, uint64_t, uint64_t);
  char *v65;
  uint64_t v66;
  void (*v67)(char *, uint64_t, uint64_t, uint64_t);
  char *v68;
  uint64_t v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  void (*v75)(char *, uint64_t, uint64_t, uint64_t);
  char *v76;
  uint64_t v77;
  void (*v78)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v79;
  void (*v80)(char *, uint64_t, uint64_t);
  uint64_t v81;
  uint64_t v82;
  void *v83;
  id v84;
  id v85;
  void *v86;
  void *v87;
  Swift::String v88;
  unint64_t v90;
  uint64_t v91;
  void (*v92)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v93;
  objc_class *ObjectType;
  uint64_t v95;
  char *v96;
  char *v97;
  char *v98;
  char *v99;
  char *v100;
  char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  unsigned int v106;
  void (*v107)(char *, uint64_t, uint64_t, uint64_t);
  char *v108;
  void (*v109)(char *, uint64_t, uint64_t, uint64_t);
  void (*v110)(char *, uint64_t, uint64_t);
  void (*v111)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v112;
  objc_super v113;
  Swift::String v114;

  v1 = v0;
  ObjectType = (objc_class *)swift_getObjectType();
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_257207C18);
  MEMORY[0x24BDAC7A8](v2);
  v97 = (char *)&v90 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v112 = sub_2429637DC();
  v4 = *(_QWORD *)(v112 - 8);
  MEMORY[0x24BDAC7A8](v112);
  v6 = (char *)&v90 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_257207990);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v90 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_257207998);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v90 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572079A0);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v90 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_242963824();
  v17 = *(_QWORD *)(v16 - 8);
  v104 = v16;
  MEMORY[0x24BDAC7A8](v16);
  v101 = (char *)&v90 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v95 = OBJC_IVAR___NHOActionSetIntent__homeID;
  v102 = __swift_instantiateConcreteTypeFromMangledName(&qword_257207C38);
  v108 = v1;
  sub_242963818();
  v107 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v17 + 56);
  v107(v15, 1, 1, v16);
  v105 = sub_242963A70();
  v114._countAndFlagsBits = 0;
  v114._object = 0;
  v109 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v105 - 8) + 56);
  v109(v12, 1, 1, v105);
  v103 = sub_242963740();
  v111 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v103 - 8) + 56);
  v19 = v9;
  v111(v9, 1, 1, v103);
  v20 = *MEMORY[0x24BDB6090];
  v110 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 104);
  v106 = v20;
  v21 = v112;
  v110(v6, v20, v112);
  v98 = v15;
  *(_QWORD *)(v93 + v95) = sub_242963794();
  v95 = OBJC_IVAR___NHOActionSetIntent__homeName;
  sub_242963818();
  v22 = v104;
  v107(v15, 1, 1, v104);
  v114._countAndFlagsBits = 0;
  v114._object = 0;
  v23 = v105;
  v109(v12, 1, 1, v105);
  v100 = v19;
  v24 = v19;
  v25 = v103;
  v111(v24, 1, 1, v103);
  v99 = v6;
  v26 = v20;
  v27 = v110;
  v110(v6, v26, v21);
  v28 = v98;
  v29 = sub_242963794();
  v30 = v108;
  *(_QWORD *)&v108[v95] = v29;
  v95 = OBJC_IVAR___NHOActionSetIntent__actionSetID;
  sub_242963818();
  v31 = v28;
  v32 = v28;
  v33 = v107;
  v107(v32, 1, 1, v22);
  v114._countAndFlagsBits = 0;
  v114._object = 0;
  v34 = v109;
  v109(v12, 1, 1, v23);
  v35 = v100;
  v111(v100, 1, 1, v25);
  v36 = v99;
  v27(v99, v106, v112);
  *(_QWORD *)&v30[v95] = sub_242963794();
  v95 = OBJC_IVAR___NHOActionSetIntent__actionSetName;
  sub_242963818();
  v37 = v104;
  v33(v31, 1, 1, v104);
  v114._countAndFlagsBits = 0;
  v114._object = 0;
  v38 = v105;
  v34(v12, 1, 1, v105);
  v39 = v103;
  v111(v35, 1, 1, v103);
  v40 = v106;
  v110(v36, v106, v112);
  v41 = sub_242963794();
  v42 = v108;
  *(_QWORD *)&v108[v95] = v41;
  v95 = OBJC_IVAR___NHOActionSetIntent__icon;
  sub_242963818();
  v107(v31, 1, 1, v37);
  v114._countAndFlagsBits = 0;
  v114._object = 0;
  v96 = v12;
  v109(v12, 1, 1, v38);
  v43 = v111;
  v111(v100, 1, 1, v39);
  v44 = v99;
  v45 = v40;
  v46 = v112;
  v110(v99, v45, v112);
  v47 = v98;
  *(_QWORD *)&v42[v95] = sub_242963794();
  v95 = OBJC_IVAR___NHOActionSetIntent__useHomeKitRecommendations;
  v91 = __swift_instantiateConcreteTypeFromMangledName(&qword_257207C30);
  sub_242963818();
  v48 = v37;
  v49 = v107;
  v107(v47, 1, 1, v48);
  LOBYTE(v114._countAndFlagsBits) = 2;
  v93 = sub_242963B60();
  v92 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v93 - 8) + 56);
  v92(v97, 1, 1, v93);
  v50 = v100;
  v51 = v103;
  v43(v100, 1, 1, v103);
  v52 = v44;
  v53 = v44;
  v54 = v106;
  v55 = v46;
  v56 = v110;
  v110(v53, v106, v55);
  v57 = v50;
  v58 = sub_2429637A0();
  v59 = v108;
  *(_QWORD *)&v108[v95] = v58;
  v95 = OBJC_IVAR___NHOActionSetIntent__accessoriesAndScenes;
  sub_242963818();
  v60 = v104;
  v49(v47, 1, 1, v104);
  v114._countAndFlagsBits = 0;
  v114._object = 0;
  v61 = v96;
  v109(v96, 1, 1, v105);
  v111(v57, 1, 1, v51);
  v56(v52, v54, v112);
  v62 = v98;
  *(_QWORD *)&v59[v95] = sub_242963794();
  v91 = OBJC_IVAR___NHOActionSetIntent__requestConfirmationText;
  v95 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572079A8);
  v90 = 0xD000000000000017;
  sub_242963818();
  v49(v62, 1, 1, v60);
  v114._countAndFlagsBits = 0;
  v114._object = 0;
  v63 = v105;
  v64 = v109;
  v109(v61, 1, 1, v105);
  v65 = v57;
  v66 = v103;
  v67 = v111;
  v111(v57, 1, 1, v103);
  v110(v52, v106, v112);
  v68 = v62;
  *(_QWORD *)&v108[v91] = sub_242963794();
  v91 = OBJC_IVAR___NHOActionSetIntent__requestConfirmationIcon;
  sub_242963818();
  v69 = v104;
  v107(v62, 1, 1, v104);
  v114._countAndFlagsBits = 0;
  v114._object = 0;
  v64(v61, 1, 1, v63);
  v67(v65, 1, 1, v66);
  v70 = v99;
  v71 = v106;
  v72 = v112;
  v110(v99, v106, v112);
  v73 = sub_242963794();
  v74 = v108;
  *(_QWORD *)&v108[v91] = v73;
  v95 = OBJC_IVAR___NHOActionSetIntent__isSmartStack;
  v91 = __swift_instantiateConcreteTypeFromMangledName(&qword_257207C40);
  sub_242963818();
  v75 = v107;
  v107(v68, 1, 1, v69);
  LOBYTE(v114._countAndFlagsBits) = 2;
  v92(v97, 1, 1, v93);
  v76 = v65;
  v77 = v103;
  v78 = v111;
  v111(v76, 1, 1, v103);
  v79 = v72;
  v80 = v110;
  v110(v70, v71, v79);
  *(_QWORD *)&v74[v95] = sub_2429637A0();
  v81 = OBJC_IVAR___NHOActionSetIntent__iconTintColor;
  sub_242963818();
  v75(v68, 1, 1, v104);
  v114._countAndFlagsBits = 0;
  v114._object = 0;
  v109(v96, 1, 1, v105);
  v78(v100, 1, 1, v77);
  v80(v70, v106, v112);
  v82 = sub_242963794();
  v83 = v108;
  *(_QWORD *)&v108[v81] = v82;

  v113.receiver = v83;
  v113.super_class = ObjectType;
  v84 = objc_msgSendSuper2(&v113, sel_init);
  v114._countAndFlagsBits = 0xD000000000000024;
  v114._object = (void *)0x8000000242966AB0;
  v85 = v84;
  swift_retain();
  sub_242963770();
  swift_release();
  v114._countAndFlagsBits = _s15NanoHomeIntents21NHOIntentLocalizationC15localizedStringyS2SFZ_0(0xD00000000000001CLL, 0x8000000242966AE0);
  v114._object = v86;
  swift_retain();
  sub_242963770();
  swift_release();
  v114._countAndFlagsBits = 0xD000000000000024;
  v114._object = (void *)0x8000000242966AB0;
  swift_retain();
  sub_242963770();
  swift_release();
  v114._countAndFlagsBits = _s15NanoHomeIntents21NHOIntentLocalizationC15localizedStringyS2SFZ_0(0xD000000000000021, 0x8000000242966B00);
  v114._object = v87;
  swift_retain();
  sub_242963770();
  swift_release();
  v114._countAndFlagsBits = 0x74696B656D6F68;
  v114._object = (void *)0xE700000000000000;
  swift_retain();
  sub_242963770();
  swift_release();
  sub_2429639EC();
  v88 = Color.toHexString()();
  swift_release();
  v114 = v88;
  swift_retain();
  sub_242963770();
  swift_release();
  v114._countAndFlagsBits = 0xD000000000000024;
  v114._object = (void *)0x8000000242966AB0;
  swift_retain();
  sub_242963770();
  swift_release();
  LOBYTE(v114._countAndFlagsBits) = 0;
  swift_retain();
  sub_242963770();

  swift_release();
  return v85;
}

uint64_t NHOActionSetIntent.perform()(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 24) = a1;
  return swift_task_switch();
}

id NHOActionSetIntent.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_242958B20@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_257207768 != -1)
    swift_once();
  v2 = sub_242963824();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_257207F78);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_242958BB8(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_24294E454;
  v3[3] = a1;
  return swift_task_switch();
}

uint64_t sub_242958C18()
{
  sub_242958CD0(&qword_257208008, (uint64_t)&protocol conformance descriptor for NHOActionSetIntent);
  return sub_242963734();
}

uint64_t sub_242958C44()
{
  return sub_242958CD0(&qword_257208008, (uint64_t)&protocol conformance descriptor for NHOActionSetIntent);
}

uint64_t type metadata accessor for NHOActionSetIntent()
{
  return objc_opt_self();
}

uint64_t sub_242958C88()
{
  return sub_242958CD0(&qword_257208010, (uint64_t)&protocol conformance descriptor for NHOActionSetIntent);
}

uint64_t sub_242958CAC()
{
  return sub_242958CD0((unint64_t *)&unk_257208018, (uint64_t)&protocol conformance descriptor for NHOActionSetIntent);
}

uint64_t sub_242958CD0(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for NHOActionSetIntent();
    result = MEMORY[0x2494E92B4](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_242958D0C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_242958D1C()
{
  sub_242958CD0(&qword_257208008, (uint64_t)&protocol conformance descriptor for NHOActionSetIntent);
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_242958D6C@<X0>(_QWORD *a1@<X8>)
{
  return sub_242957B84(a1);
}

uint64_t sub_242958D88()
{
  return sub_2429493A0();
}

uint64_t sub_242958DA4@<X0>(_QWORD *a1@<X8>)
{
  return sub_242957B84(a1);
}

uint64_t sub_242958DC0()
{
  return sub_2429493A0();
}

uint64_t sub_242958DDC@<X0>(_QWORD *a1@<X8>)
{
  return sub_242957B84(a1);
}

uint64_t sub_242958DF8()
{
  return sub_2429493A0();
}

uint64_t sub_242958E14@<X0>(_QWORD *a1@<X8>)
{
  return sub_242957B84(a1);
}

uint64_t sub_242958E30()
{
  return sub_2429493A0();
}

uint64_t sub_242958E4C@<X0>(_QWORD *a1@<X8>)
{
  return sub_242957B84(a1);
}

uint64_t sub_242958E68()
{
  return sub_2429493A0();
}

uint64_t sub_242958E8C@<X0>(_QWORD *a1@<X8>)
{
  return sub_242957B84(a1);
}

uint64_t sub_242958EA8()
{
  return sub_2429493A0();
}

double sub_242958EC4@<D0>(_OWORD *a1@<X8>)
{
  return sub_242949350(a1);
}

uint64_t sub_242958EE0()
{
  return sub_2429493A0();
}

double sub_242958EFC@<D0>(_OWORD *a1@<X8>)
{
  return sub_242949350(a1);
}

uint64_t sub_242958F18()
{
  return sub_2429493A0();
}

uint64_t sub_242958F3C@<X0>(_QWORD *a1@<X8>)
{
  return sub_242957B84(a1);
}

uint64_t sub_242958F58()
{
  return sub_2429493A0();
}

unint64_t static NHOIntentConstants.appContainerBundleIdentifier.getter()
{
  return 0xD000000000000012;
}

unint64_t static NHOIntentConstants.widgetBundleIdentifier.getter()
{
  return 0xD000000000000022;
}

uint64_t static NHOIntentConstants.WidgetKind.Launcher.getter()
{
  return 0x656D6F486F6E614ELL;
}

unint64_t static NHOIntentConstants.WidgetKind.Energy.getter()
{
  return 0xD000000000000031;
}

unint64_t static NHOIntentConstants.WidgetKind.Accessory.getter()
{
  return 0xD000000000000027;
}

unint64_t static NHOIntentConstants.WidgetKind.ActionSets.getter()
{
  return 0xD000000000000026;
}

unint64_t static NHOIntentConstants.WidgetKind.SmartStack.getter()
{
  return 0xD00000000000002CLL;
}

unint64_t static NHOIntentConstants.WidgetKind.ElectricityUsage.getter()
{
  return 0xD000000000000029;
}

unint64_t static NHOIntentConstants.WidgetKind.ElectricityRates.getter()
{
  return 0xD000000000000029;
}

id NHOIntentConstants.WidgetKind.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id NHOIntentConstants.WidgetKind.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for NHOIntentConstants.WidgetKind();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for NHOIntentConstants.WidgetKind()
{
  return objc_opt_self();
}

id NHOIntentConstants.WidgetKind.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for NHOIntentConstants.WidgetKind();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id NHOIntentConstants.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_init);
}

id NHOIntentConstants.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for NHOIntentConstants()
{
  return objc_opt_self();
}

id ElectricityUsageIntent.__allocating_init(homeIdentifier:homeName:)()
{
  objc_class *v0;
  id v1;

  v1 = objc_msgSend(objc_allocWithZone(v0), sel_init);
  swift_retain();
  sub_242963770();
  swift_release();
  swift_retain();
  sub_242963770();

  swift_release();
  return v1;
}

uint64_t sub_24295946C()
{
  uint64_t v0;

  v0 = sub_242963824();
  __swift_allocate_value_buffer(v0, qword_2572080A0);
  __swift_project_value_buffer(v0, (uint64_t)qword_2572080A0);
  return sub_242963818();
}

uint64_t static ElectricityUsageIntent.title.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_242948F3C(&qword_257207778, (uint64_t (*)(_QWORD))MEMORY[0x24BDCD380], (uint64_t)qword_2572080A0, a1);
}

uint64_t static ElectricityUsageIntent.title.setter(uint64_t a1)
{
  return sub_242948FEC(a1, &qword_257207778, (uint64_t (*)(_QWORD))MEMORY[0x24BDCD380], (uint64_t)qword_2572080A0);
}

uint64_t (*static ElectricityUsageIntent.title.modify())()
{
  uint64_t v0;

  if (qword_257207778 != -1)
    swift_once();
  v0 = sub_242963824();
  __swift_project_value_buffer(v0, (uint64_t)qword_2572080A0);
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_24295958C()
{
  uint64_t v0;

  v0 = sub_2429637B8();
  __swift_allocate_value_buffer(v0, qword_2572080B8);
  __swift_project_value_buffer(v0, (uint64_t)qword_2572080B8);
  return sub_2429637AC();
}

uint64_t static ElectricityUsageIntent.description.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_242948F3C(&qword_257207780, (uint64_t (*)(_QWORD))MEMORY[0x24BDB5800], (uint64_t)qword_2572080B8, a1);
}

uint64_t static ElectricityUsageIntent.description.setter(uint64_t a1)
{
  return sub_242948FEC(a1, &qword_257207780, (uint64_t (*)(_QWORD))MEMORY[0x24BDB5800], (uint64_t)qword_2572080B8);
}

uint64_t (*static ElectricityUsageIntent.description.modify())()
{
  uint64_t v0;

  if (qword_257207780 != -1)
    swift_once();
  v0 = sub_2429637B8();
  __swift_project_value_buffer(v0, (uint64_t)qword_2572080B8);
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t ElectricityUsageIntent.homeID.getter()
{
  return sub_242949240();
}

uint64_t ElectricityUsageIntent.homeID.setter()
{
  return sub_24294930C();
}

uint64_t (*ElectricityUsageIntent.homeID.modify(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = *(_QWORD *)(v1 + OBJC_IVAR___NHOElectricityUsageIntent__homeID);
  swift_retain();
  v3[5] = sub_242963758();
  return sub_2429491A0;
}

uint64_t ElectricityUsageIntent.$homeID.getter()
{
  return sub_242949494();
}

uint64_t ElectricityUsageIntent.homeName.getter()
{
  return sub_242949240();
}

uint64_t ElectricityUsageIntent.homeName.setter()
{
  return sub_24294930C();
}

uint64_t (*ElectricityUsageIntent.homeName.modify(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = *(_QWORD *)(v1 + OBJC_IVAR___NHOElectricityUsageIntent__homeName);
  swift_retain();
  v3[5] = sub_242963758();
  return sub_2429491A0;
}

uint64_t ElectricityUsageIntent.$homeName.getter()
{
  return sub_242949494();
}

id ElectricityUsageIntent.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id ElectricityUsageIntent.init()()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
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
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  _QWORD v22[2];
  void (*v23)(char *, uint64_t, uint64_t);
  void (*v24)(char *, uint64_t, uint64_t, uint64_t);
  void (*v25)(char *, uint64_t, uint64_t, uint64_t);
  void (*v26)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  char *v32;
  uint64_t v33;
  objc_class *ObjectType;
  objc_super v35;
  uint64_t v36;
  uint64_t v37;

  ObjectType = (objc_class *)swift_getObjectType();
  v33 = sub_2429637DC();
  v1 = *(_QWORD *)(v33 - 8);
  MEMORY[0x24BDAC7A8](v33);
  v32 = (char *)v22 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_257207990);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_257207998);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572079A0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_242963824();
  v13 = *(_QWORD *)(v12 - 8);
  v27 = v12;
  MEMORY[0x24BDAC7A8](v12);
  v30 = OBJC_IVAR___NHOElectricityUsageIntent__homeID;
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572079A8);
  v31 = v0;
  sub_242963818();
  v26 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56);
  v26(v11, 1, 1, v12);
  v14 = sub_242963A70();
  v36 = 0;
  v37 = 0;
  v25 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56);
  v25(v8, 1, 1, v14);
  v15 = sub_242963740();
  v24 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56);
  v24(v5, 1, 1, v15);
  v16 = *MEMORY[0x24BDB6090];
  v23 = *(void (**)(char *, uint64_t, uint64_t))(v1 + 104);
  v17 = v32;
  v18 = v33;
  v23(v32, v16, v33);
  v22[1] = v11;
  *(_QWORD *)(v29 + v30) = sub_242963794();
  v30 = OBJC_IVAR___NHOElectricityUsageIntent__homeName;
  sub_242963818();
  v26(v11, 1, 1, v27);
  v36 = 0;
  v37 = 0;
  v25(v8, 1, 1, v14);
  v24(v5, 1, 1, v15);
  v23(v17, v16, v18);
  v19 = sub_242963794();
  v20 = v31;
  *(_QWORD *)&v31[v30] = v19;

  v35.receiver = v20;
  v35.super_class = ObjectType;
  return objc_msgSendSuper2(&v35, sel_init);
}

id ElectricityUsageIntent.__allocating_init(homeIdentifier:)()
{
  objc_class *v0;
  id v1;

  v1 = objc_msgSend(objc_allocWithZone(v0), sel_init);
  swift_retain();
  sub_242963770();

  swift_release();
  return v1;
}

id ElectricityUsageIntent.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_242959C10()
{
  return sub_242959ECC(&qword_2572080E0, (uint64_t)&protocol conformance descriptor for ElectricityUsageIntent);
}

uint64_t type metadata accessor for ElectricityUsageIntent()
{
  return objc_opt_self();
}

uint64_t sub_242959C54()
{
  return sub_242959ECC(&qword_2572080E8, (uint64_t)&protocol conformance descriptor for ElectricityUsageIntent);
}

uint64_t sub_242959C78()
{
  return sub_242959ECC((unint64_t *)&unk_2572080F0, (uint64_t)&protocol conformance descriptor for ElectricityUsageIntent);
}

uint64_t sub_242959C9C()
{
  sub_242959ECC(&qword_2572080E0, (uint64_t)&protocol conformance descriptor for ElectricityUsageIntent);
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_242959D24@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_257207778 != -1)
    swift_once();
  v2 = sub_242963824();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_2572080A0);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_242959DBC()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  sub_242959ECC(&qword_257208128, (uint64_t)&protocol conformance descriptor for ElectricityUsageIntent);
  *v1 = v0;
  v1[1] = sub_242949C6C;
  return sub_24296380C();
}

uint64_t sub_242959E30()
{
  sub_242959ECC(&qword_2572080E0, (uint64_t)&protocol conformance descriptor for ElectricityUsageIntent);
  return sub_242963734();
}

double sub_242959E5C@<D0>(_OWORD *a1@<X8>)
{
  return sub_242949350(a1);
}

uint64_t sub_242959E78()
{
  return sub_2429493A0();
}

double sub_242959E94@<D0>(_OWORD *a1@<X8>)
{
  return sub_242949350(a1);
}

uint64_t sub_242959EB0()
{
  return sub_2429493A0();
}

uint64_t sub_242959ECC(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for ElectricityUsageIntent();
    result = MEMORY[0x2494E92B4](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

void HMAccessory.serviceGroup.getter()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  unint64_t v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  id v12;
  void *v13;
  BOOL v14;
  unint64_t v15;
  id v16;
  void *v17;
  id v18;
  unint64_t v19;
  id v20;
  void *v21;
  char v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  char v27;
  unint64_t v28;
  id v29;
  char v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;

  v1 = objc_msgSend(v0, sel_home);
  if (v1)
  {
    v2 = v1;
    v3 = objc_msgSend(v1, sel_serviceGroups);

    sub_24294899C(0, &qword_257207F20);
    v4 = sub_242963B30();

    v5 = objc_msgSend(v0, sel_services);
    sub_24294899C(0, &qword_257207930);
    v6 = sub_242963B30();

    if (v6 >> 62)
      goto LABEL_55;
    v7 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v7)
    {
LABEL_4:
      v38 = v4 & 0xFFFFFFFFFFFFFF8;
      if (v4 >> 62)
      {
        swift_bridgeObjectRetain();
        v41 = sub_242963D4C();
        swift_bridgeObjectRelease();
      }
      else
      {
        v41 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      v8 = 0;
      v9 = v6 & 0xC000000000000001;
      v10 = v6 & 0xFFFFFFFFFFFFFF8;
      v11 = v6 + 32;
      v39 = v4;
      v40 = v4 & 0xC000000000000001;
      v36 = v6;
      v37 = v4 + 32;
      v33 = v6 & 0xC000000000000001;
      v34 = v7;
      v31 = v6 + 32;
      v32 = v6 & 0xFFFFFFFFFFFFFF8;
      do
      {
LABEL_7:
        if (v9)
        {
          v12 = (id)MEMORY[0x2494E8E28](v8, v6);
        }
        else
        {
          if (v8 >= *(_QWORD *)(v10 + 16))
          {
            __break(1u);
            return;
          }
          v12 = *(id *)(v11 + 8 * v8);
        }
        v13 = v12;
        v14 = __OFADD__(v8++, 1);
        if (v14)
          goto LABEL_54;
        if (v41)
        {
          v35 = v8;
          swift_bridgeObjectRetain();
          v15 = 0;
          while (1)
          {
            if (v40)
            {
              v16 = (id)MEMORY[0x2494E8E28](v15, v39);
            }
            else
            {
              if (v15 >= *(_QWORD *)(v38 + 16))
                goto LABEL_53;
              v16 = *(id *)(v37 + 8 * v15);
            }
            v17 = v16;
            v14 = __OFADD__(v15++, 1);
            if (v14)
              goto LABEL_51;
            v18 = objc_msgSend(v16, sel_services);
            v19 = sub_242963B30();

            if (v19 >> 62)
            {
              swift_bridgeObjectRetain_n();
              v6 = sub_242963D4C();
              swift_bridgeObjectRelease();
              if (!v6)
                goto LABEL_14;
            }
            else
            {
              v6 = *(_QWORD *)((v19 & 0xFFFFFFFFFFFFF8) + 0x10);
              swift_bridgeObjectRetain();
              if (!v6)
                goto LABEL_14;
            }
            v4 = v19 & 0xC000000000000001;
            if ((v19 & 0xC000000000000001) != 0)
              v20 = (id)MEMORY[0x2494E8E28](0, v19);
            else
              v20 = *(id *)(v19 + 32);
            v21 = v20;
            v22 = sub_242963C20();

            if ((v22 & 1) != 0)
            {
LABEL_49:
              swift_bridgeObjectRelease_n();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease_n();

              return;
            }
            if (v6 != 1)
            {
              if (v4)
              {
                MEMORY[0x2494E8E28](1, v19);
                v23 = sub_242963C20();
                swift_unknownObjectRelease();
                if ((v23 & 1) != 0)
                  goto LABEL_49;
                if (v6 != 2)
                {
                  v24 = 2;
                  while (1)
                  {
                    MEMORY[0x2494E8E28](v24, v19);
                    v25 = v24 + 1;
                    if (__OFADD__(v24, 1))
                      break;
                    v4 = sub_242963C20();
                    swift_unknownObjectRelease();
                    if ((v4 & 1) != 0)
                      goto LABEL_49;
                    ++v24;
                    if (v25 == v6)
                      goto LABEL_14;
                  }
                  __break(1u);
LABEL_51:
                  __break(1u);
                  goto LABEL_52;
                }
              }
              else
              {
                v26 = *(id *)(v19 + 40);
                v27 = sub_242963C20();

                if ((v27 & 1) != 0)
                  goto LABEL_49;
                if (v6 != 2)
                {
                  v4 = 6;
                  while (1)
                  {
                    v28 = v4 - 3;
                    if (__OFADD__(v4 - 4, 1))
                      break;
                    v29 = *(id *)(v19 + 8 * v4);
                    v30 = sub_242963C20();

                    if ((v30 & 1) != 0)
                      goto LABEL_49;
                    ++v4;
                    if (v28 == v6)
                      goto LABEL_14;
                  }
LABEL_52:
                  __break(1u);
LABEL_53:
                  __break(1u);
LABEL_54:
                  __break(1u);
LABEL_55:
                  swift_bridgeObjectRetain();
                  v7 = sub_242963D4C();
                  swift_bridgeObjectRelease();
                  if (!v7)
                    goto LABEL_47;
                  goto LABEL_4;
                }
              }
            }
LABEL_14:
            swift_bridgeObjectRelease_n();

            if (v15 == v41)
            {

              v4 = v39;
              swift_bridgeObjectRelease();
              v8 = v35;
              v6 = v36;
              v9 = v33;
              v7 = v34;
              v11 = v31;
              v10 = v32;
              if (v35 != v34)
                goto LABEL_7;
              goto LABEL_47;
            }
          }
        }

      }
      while (v8 != v7);
    }
LABEL_47:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
}

uint64_t HMAccessory.widgetSupportedServiceKind()@<X0>(uint64_t a1@<X8>)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
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
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, _QWORD, uint64_t, uint64_t);
  id v22;
  unint64_t v23;
  __int128 v24;
  uint64_t v25;
  int v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  id v37;
  id v38;
  id v39;
  NSObject *v40;
  os_log_type_t v41;
  _BOOL4 v42;
  void *v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  id v49;
  uint64_t v50;
  unint64_t v51;
  unint64_t v52;
  id v53;
  uint64_t v54;
  unint64_t v55;
  unint64_t v56;
  void *v57;
  void (*v58)(_QWORD, _QWORD);
  uint64_t v59;
  void (*v60)(char *, char *, uint64_t);
  char *v61;
  int v62;
  void (*v63)(char *, uint64_t);
  id v64;
  id v65;
  id v66;
  uint64_t v67;
  id v68;
  NSObject *v69;
  os_log_type_t v70;
  uint64_t v71;
  id v72;
  id v73;
  uint64_t v74;
  unint64_t v75;
  unint64_t v76;
  id v77;
  uint64_t v78;
  unint64_t v79;
  unint64_t v80;
  id v81;
  uint64_t v82;
  unint64_t v83;
  unint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  char *v88;
  uint64_t v89;
  char v90;
  void (*v91)(char *, uint64_t);
  uint64_t v92;
  void *v93;
  id v94;
  id v95;
  unint64_t v96;
  id v97;
  void (*v98)(char *, uint64_t);
  uint64_t v99;
  void *v100;
  id v101;
  id v102;
  NSObject *v103;
  os_log_type_t v104;
  uint64_t v105;
  id v106;
  uint64_t v107;
  unint64_t v108;
  unint64_t v109;
  id v110;
  uint64_t v111;
  unint64_t v112;
  unint64_t v113;
  uint64_t v114;
  char *v115;
  uint64_t v116;
  char *v117;
  id v118;
  NSObject *v119;
  os_log_type_t v120;
  int v121;
  uint64_t v122;
  uint64_t v123;
  unint64_t v124;
  void (*v125)(char *, uint64_t);
  uint64_t v126;
  unint64_t v127;
  id v128;
  uint64_t v129;
  unint64_t v130;
  unint64_t v131;
  uint64_t v132;
  void (*v133)(char *, uint64_t);
  uint64_t v134;
  char *v135;
  char *v136;
  id v137;
  id v138;
  id v139;
  id v140;
  NSObject *v141;
  os_log_type_t v142;
  int v143;
  uint64_t v144;
  uint64_t v145;
  unint64_t v146;
  char *v147;
  void (*v148)(char *, uint64_t);
  uint64_t v149;
  unint64_t v150;
  id v151;
  uint64_t v152;
  unint64_t v153;
  unint64_t v154;
  id v155;
  uint64_t v156;
  unint64_t v157;
  unint64_t v158;
  uint64_t v159;
  void (*v160)(char *, uint64_t);
  char *v162;
  char *v163;
  char *v164;
  char *v165;
  uint64_t (*v166)(uint64_t, _QWORD, uint64_t, uint64_t);
  uint64_t v167;
  __int128 v168;
  uint64_t v169;
  unint64_t v170;
  uint64_t v171;
  unint64_t v172;
  int v173;
  __int128 v174;
  int v175;
  void (*v176)(_QWORD, _QWORD);
  uint64_t v177;
  int v178;
  char *v179;
  int v180;
  int v181;
  int v182;
  int v183;
  unint64_t v184;
  int v185;
  unint64_t v186;
  char *v187;
  char *v188;
  id v189;
  uint64_t v190;
  unsigned int v191;
  char *v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199[2];

  v3 = sub_242963974();
  v4 = MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v162 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v4);
  v9 = (char *)&v162 - v8;
  v10 = MEMORY[0x24BDAC7A8](v7);
  v165 = (char *)&v162 - v11;
  v12 = MEMORY[0x24BDAC7A8](v10);
  v164 = (char *)&v162 - v13;
  v14 = MEMORY[0x24BDAC7A8](v12);
  v188 = (char *)&v162 - v15;
  v16 = MEMORY[0x24BDAC7A8](v14);
  v192 = (char *)&v162 - v17;
  MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)&v162 - v18;
  v196 = v20;
  v21 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v20 + 56);
  v167 = a1;
  v166 = v21;
  v21(a1, 1, 1, v3);
  v189 = v1;
  v22 = objc_msgSend(v1, sel_services);
  sub_24294899C(0, &qword_257207930);
  v23 = sub_242963B30();

  if (v23 >> 62)
  {
LABEL_51:
    swift_bridgeObjectRetain();
    v25 = sub_242963D4C();
    swift_bridgeObjectRelease();
    if (v25)
      goto LABEL_3;
  }
  else
  {
    v25 = *(_QWORD *)((v23 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v25)
    {
LABEL_3:
      v169 = 0;
      v186 = v23 & 0xC000000000000001;
      v179 = (char *)&v198;
      v185 = *MEMORY[0x24BE4D7B8];
      v26 = *MEMORY[0x24BE4D6E0];
      v182 = *MEMORY[0x24BE4D878];
      v183 = v26;
      v27 = *MEMORY[0x24BE4D650];
      v180 = *MEMORY[0x24BE4D810];
      v181 = v27;
      v28 = 4;
      v170 = (unint64_t)"tents23NHOWidgetFamilyUtilties";
      v172 = 0x8000000242966010;
      v178 = *MEMORY[0x24BE4D828];
      v171 = MEMORY[0x24BEE4AD8] + 8;
      v191 = *MEMORY[0x24BE4D5A0];
      v175 = *MEMORY[0x24BE4D690];
      v173 = *MEMORY[0x24BE4D6A0];
      *(_QWORD *)&v24 = 136315906;
      v174 = v24;
      *(_QWORD *)&v24 = 136315650;
      v168 = v24;
      v190 = v3;
      v187 = v19;
      v184 = v23;
      v177 = v25;
      v163 = v6;
      v162 = v9;
      while (1)
      {
        if (v186)
          v32 = (id)MEMORY[0x2494E8E28](v28 - 4, v23);
        else
          v32 = *(id *)(v23 + 8 * v28);
        v33 = v32;
        v23 = v28 - 3;
        if (__OFADD__(v28 - 4, 1))
        {
          __break(1u);
          goto LABEL_51;
        }
        if (qword_257207738 != -1)
          swift_once();
        v34 = sub_2429639D4();
        v35 = __swift_project_value_buffer(v34, (uint64_t)qword_257207B58);
        v36 = v33;
        v37 = v189;
        v38 = v36;
        v39 = v37;
        v195 = v35;
        v40 = sub_2429639BC();
        v41 = sub_242963BD8();
        v6 = (char *)v41;
        v42 = os_log_type_enabled(v40, v41);
        v193 = v28 - 3;
        v194 = v28;
        if (v42)
        {
          v43 = v39;
          v44 = swift_slowAlloc();
          v176 = (void (*)(_QWORD, _QWORD))swift_slowAlloc();
          v199[0] = (uint64_t)v176;
          *(_DWORD *)v44 = v174;
          v197 = sub_24294461C(0xD00000000000001CLL, v172, v199);
          sub_242963C5C();
          *(_WORD *)(v44 + 12) = 2080;
          v45 = objc_msgSend(v38, sel_name);
          v46 = sub_242963A88();
          v48 = v47;

          v197 = sub_24294461C(v46, v48, v199);
          sub_242963C5C();

          swift_bridgeObjectRelease();
          *(_WORD *)(v44 + 22) = 2080;
          v49 = objc_msgSend(v38, sel_serviceType);
          v50 = sub_242963A88();
          v52 = v51;

          v197 = sub_24294461C(v50, v52, v199);
          sub_242963C5C();

          swift_bridgeObjectRelease();
          *(_WORD *)(v44 + 32) = 2080;
          v53 = objc_msgSend(v43, sel_name);
          v54 = sub_242963A88();
          v56 = v55;

          v197 = sub_24294461C(v54, v56, v199);
          sub_242963C5C();

          v57 = v43;
          v3 = v190;
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_242941000, v40, (os_log_type_t)v6, "%s: Checking service %s of type %s for accessory %s", (uint8_t *)v44, 0x2Au);
          v58 = v176;
          swift_arrayDestroy();
          v19 = v187;
          MEMORY[0x2494E932C](v58, -1, -1);
          MEMORY[0x2494E932C](v44, -1, -1);

        }
        else
        {

          v57 = v39;
        }
        sub_242963C2C();
        v59 = v196;
        v60 = *(void (**)(char *, char *, uint64_t))(v196 + 16);
        v61 = v192;
        v60(v192, v19, v3);
        v62 = (*(uint64_t (**)(char *, uint64_t))(v59 + 88))(v61, v3);
        if (v62 == v185
          || v62 == v183
          || v62 == v182
          || v62 == v181
          || v62 == v180
          || v62 == v178
          || v62 == v191
          || v62 == v175
          || v62 == v173)
        {
          break;
        }
        v63 = *(void (**)(char *, uint64_t))(v196 + 8);
        v63(v192, v3);
        v64 = v38;
        v65 = v57;
        v66 = v64;
        v67 = v3;
        v68 = v65;
        v69 = sub_2429639BC();
        v70 = sub_242963BD8();
        v9 = (char *)v70;
        if (os_log_type_enabled(v69, v70))
        {
          v71 = swift_slowAlloc();
          v195 = swift_slowAlloc();
          v199[0] = v195;
          *(_DWORD *)v71 = v174;
          v197 = sub_24294461C(0xD00000000000001CLL, v170 | 0x8000000000000000, v199);
          v6 = v179;
          sub_242963C5C();
          *(_WORD *)(v71 + 12) = 2080;
          v72 = objc_msgSend(v66, sel_serviceType);
          v176 = (void (*)(_QWORD, _QWORD))v63;
          v73 = v72;
          v74 = sub_242963A88();
          v76 = v75;

          v197 = sub_24294461C(v74, v76, v199);
          sub_242963C5C();

          swift_bridgeObjectRelease();
          *(_WORD *)(v71 + 22) = 2080;
          v77 = objc_msgSend(v66, sel_name);
          v78 = sub_242963A88();
          v80 = v79;

          v197 = sub_24294461C(v78, v80, v199);
          sub_242963C5C();

          swift_bridgeObjectRelease();
          *(_WORD *)(v71 + 32) = 2080;
          v81 = objc_msgSend(v68, sel_name);
          v82 = sub_242963A88();
          v84 = v83;

          v85 = v190;
          v86 = v82;
          v19 = v187;
          v197 = sub_24294461C(v86, v84, v199);
          sub_242963C5C();

          v3 = v85;
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_242941000, v69, (os_log_type_t)v9, "%s: ServiceType %s for service %s for accessory %s is not supported.", (uint8_t *)v71, 0x2Au);
          v87 = v195;
          swift_arrayDestroy();
          MEMORY[0x2494E932C](v87, -1, -1);
          MEMORY[0x2494E932C](v71, -1, -1);

          v88 = v19;
          v89 = v85;
          goto LABEL_35;
        }

        v63(v19, v67);
        v23 = v184;
        v29 = v177;
        v30 = v193;
        v31 = v194;
        v3 = v67;
LABEL_5:
        v28 = v31 + 1;
        if (v30 == v29)
          return swift_bridgeObjectRelease();
      }
      (*(void (**)(char *, _QWORD, uint64_t))(v196 + 104))(v188, v191, v3);
      sub_242948954();
      sub_242963B18();
      sub_242963B18();
      if (v199[0] == v197 && v199[1] == v198)
      {
        swift_bridgeObjectRelease_n();
        v176 = *(void (**)(_QWORD, _QWORD))(v196 + 8);
        v176(v188, v3);
        goto LABEL_41;
      }
      v90 = sub_242963DA0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v91 = *(void (**)(char *, uint64_t))(v196 + 8);
      v91(v188, v3);
      if ((v90 & 1) != 0)
      {
        v176 = (void (*)(_QWORD, _QWORD))v91;
LABEL_41:
        swift_bridgeObjectRelease();
        v115 = v164;
        v60(v164, v19, v3);
        v116 = v3;
        v117 = v165;
        v60(v165, v19, v116);
        v118 = v57;
        v119 = sub_2429639BC();
        v120 = sub_242963BD8();
        v121 = v120;
        if (os_log_type_enabled(v119, v120))
        {
          v122 = swift_slowAlloc();
          v195 = swift_slowAlloc();
          v199[0] = v195;
          *(_DWORD *)v122 = v174;
          v197 = sub_24294461C(0xD00000000000001CLL, v170 | 0x8000000000000000, v199);
          sub_242963C5C();
          *(_WORD *)(v122 + 12) = 2080;
          LODWORD(v194) = v121;
          v123 = ServiceKind.debugDescription.getter();
          v197 = sub_24294461C(v123, v124, v199);
          sub_242963C5C();
          swift_bridgeObjectRelease();
          v125 = (void (*)(char *, uint64_t))v176;
          v176(v115, v116);
          *(_WORD *)(v122 + 22) = 2080;
          v126 = sub_242963968();
          v197 = sub_24294461C(v126, v127, v199);
          sub_242963C5C();
          swift_bridgeObjectRelease();
          v125(v117, v116);
          *(_WORD *)(v122 + 32) = 2080;
          v128 = objc_msgSend(v118, sel_name);
          v129 = sub_242963A88();
          v131 = v130;

          v197 = sub_24294461C(v129, v131, v199);
          sub_242963C5C();

          v19 = v187;
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_242941000, v119, (os_log_type_t)v194, "%s: Found supported service kind %s(%s) for accessory %s", (uint8_t *)v122, 0x2Au);
          v132 = v195;
          swift_arrayDestroy();
          MEMORY[0x2494E932C](v132, -1, -1);
          MEMORY[0x2494E932C](v122, -1, -1);

        }
        else
        {

          v133 = (void (*)(char *, uint64_t))v176;
          v176(v117, v116);
          v133(v115, v116);

        }
        v134 = v167;
        sub_242948D44(v167);
        (*(void (**)(uint64_t, char *, uint64_t))(v196 + 32))(v134, v19, v116);
        return v166(v134, 0, 1, v116);
      }
      HMService.primaryControlCharacteristicType.getter();
      if (v92)
      {
        v93 = (void *)sub_242963A7C();
        swift_bridgeObjectRelease();
        v94 = objc_msgSend(v38, sel_hf_characteristicOfType_, v93);

        if (v94)
          goto LABEL_45;
      }
      else
      {
        v95 = objc_msgSend(v38, sel_characteristics);
        sub_24294899C(0, &qword_257207940);
        v96 = sub_242963B30();

        v97 = v38;
        v98 = v91;
        v99 = v169;
        v100 = sub_2429489D4(v96);
        v169 = v99;
        v91 = v98;
        v3 = v190;
        swift_bridgeObjectRelease();

        if (v100)
        {
LABEL_45:
          v176 = (void (*)(_QWORD, _QWORD))v91;
          swift_bridgeObjectRelease();
          v116 = v3;
          v135 = v162;
          v60(v162, v19, v116);
          v136 = v163;
          v60(v163, v19, v116);
          v137 = v38;
          v138 = v57;
          v139 = v137;
          v140 = v138;
          v141 = sub_2429639BC();
          v142 = sub_242963BD8();
          v143 = v142;
          if (os_log_type_enabled(v141, v142))
          {
            v144 = swift_slowAlloc();
            v195 = swift_slowAlloc();
            v199[0] = v195;
            *(_DWORD *)v144 = 136316162;
            LODWORD(v194) = v143;
            v197 = sub_24294461C(0xD00000000000001CLL, v170 | 0x8000000000000000, v199);
            sub_242963C5C();
            *(_WORD *)(v144 + 12) = 2080;
            v145 = ServiceKind.debugDescription.getter();
            v197 = sub_24294461C(v145, v146, v199);
            sub_242963C5C();
            swift_bridgeObjectRelease();
            v147 = v135;
            v148 = (void (*)(char *, uint64_t))v176;
            v176(v147, v116);
            *(_WORD *)(v144 + 22) = 2080;
            v149 = sub_242963968();
            v197 = sub_24294461C(v149, v150, v199);
            sub_242963C5C();
            swift_bridgeObjectRelease();
            v148(v136, v116);
            *(_WORD *)(v144 + 32) = 2080;
            v151 = objc_msgSend(v139, sel_name);
            v152 = sub_242963A88();
            v154 = v153;

            v197 = sub_24294461C(v152, v154, v199);
            sub_242963C5C();

            swift_bridgeObjectRelease();
            *(_WORD *)(v144 + 42) = 2080;
            v155 = objc_msgSend(v140, sel_name);
            v156 = sub_242963A88();
            v158 = v157;

            v197 = sub_24294461C(v156, v158, v199);
            sub_242963C5C();

            swift_bridgeObjectRelease();
            _os_log_impl(&dword_242941000, v141, (os_log_type_t)v194, "%s: Found supported service kind %s(%s) having a primary control characteristic with service %s for accessory %s", (uint8_t *)v144, 0x34u);
            v159 = v195;
            swift_arrayDestroy();
            MEMORY[0x2494E932C](v159, -1, -1);
            MEMORY[0x2494E932C](v144, -1, -1);

          }
          else
          {

            v160 = (void (*)(char *, uint64_t))v176;
            v176(v136, v116);
            v160(v135, v116);

          }
          v134 = v167;
          sub_242948D44(v167);
          (*(void (**)(uint64_t, char *, uint64_t))(v196 + 32))(v134, v187, v116);
          return v166(v134, 0, 1, v116);
        }
      }
      v101 = v38;
      v102 = v57;
      v9 = (char *)v101;
      v6 = (char *)v102;
      v103 = sub_2429639BC();
      v104 = sub_242963BD8();
      if (os_log_type_enabled(v103, v104))
      {
        v105 = swift_slowAlloc();
        v195 = swift_slowAlloc();
        v199[0] = v195;
        *(_DWORD *)v105 = v168;
        v197 = sub_24294461C(0xD00000000000001CLL, v170 | 0x8000000000000000, v199);
        v176 = (void (*)(_QWORD, _QWORD))v91;
        sub_242963C5C();
        *(_WORD *)(v105 + 12) = 2080;
        v106 = objc_msgSend(v9, sel_name);
        v107 = sub_242963A88();
        v109 = v108;

        v197 = sub_24294461C(v107, v109, v199);
        sub_242963C5C();

        swift_bridgeObjectRelease();
        *(_WORD *)(v105 + 22) = 2080;
        v110 = objc_msgSend(v6, sel_name);
        v111 = sub_242963A88();
        v113 = v112;

        v19 = v187;
        v197 = sub_24294461C(v111, v113, v199);
        sub_242963C5C();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_242941000, v103, v104, "%s: Did not find primary control characteristic for service %s for accessory %s, continuing to next service", (uint8_t *)v105, 0x20u);
        v114 = v195;
        swift_arrayDestroy();
        v3 = v190;
        MEMORY[0x2494E932C](v114, -1, -1);
        MEMORY[0x2494E932C](v105, -1, -1);

        v88 = v19;
        v89 = v3;
LABEL_35:
        v176(v88, v89);
      }
      else
      {

        v91(v19, v3);
      }
      v23 = v184;
      v29 = v177;
      v30 = v193;
      v31 = v194;
      goto LABEL_5;
    }
  }
  return swift_bridgeObjectRelease();
}

HMService_optional __swiftcall HMAccessory.primaryService()()
{
  void *v0;
  id v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  Swift::Bool v8;
  objc_class *v9;
  HMService_optional result;

  v1 = objc_msgSend(v0, sel_services);
  sub_24294899C(0, &qword_257207930);
  v2 = sub_242963B30();

  if (v2 >> 62)
    goto LABEL_14;
  v3 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (v3)
  {
    v4 = 4;
    while (1)
    {
      v5 = (v2 & 0xC000000000000001) != 0 ? (id)MEMORY[0x2494E8E28](v4 - 4, v2) : *(id *)(v2 + 8 * v4);
      v6 = v5;
      v7 = v4 - 3;
      if (__OFADD__(v4 - 4, 1))
        break;
      if (objc_msgSend(v5, sel_isPrimaryService))
      {
        swift_bridgeObjectRelease();
        goto LABEL_12;
      }

      ++v4;
      if (v7 == v3)
        goto LABEL_10;
    }
    __break(1u);
LABEL_14:
    swift_bridgeObjectRetain();
    v3 = sub_242963D4C();
    swift_bridgeObjectRelease();
  }
LABEL_10:
  swift_bridgeObjectRelease();
  v6 = 0;
LABEL_12:
  v9 = (objc_class *)v6;
  result.value.super.isa = v9;
  result.is_nil = v8;
  return result;
}

uint64_t HMAccessory.isInServiceGroup.getter()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  id v9;
  void *v10;
  id v12;
  unint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  char v17;
  char v18;
  uint64_t v19;
  char v20;
  id v21;
  char v22;
  uint64_t v23;
  id v24;
  char v25;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;

  v1 = objc_msgSend(v0, sel_home);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = objc_msgSend(v1, sel_serviceGroups);

  sub_24294899C(0, &qword_257207F20);
  v4 = sub_242963B30();

  v5 = (unint64_t)HMAccessory.primaryService()();
  if (v5)
  {
    v6 = (void *)v5;
    if (v4 >> 62)
      goto LABEL_45;
    v7 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v7)
    {
      while (1)
      {
        v8 = 0;
        v30 = v4 & 0xC000000000000001;
        v28 = v4 + 32;
        v29 = v4 & 0xFFFFFFFFFFFFFF8;
        v27 = v4;
        while (1)
        {
          if (v30)
          {
            v9 = (id)MEMORY[0x2494E8E28](v8, v4);
          }
          else
          {
            if (v8 >= *(_QWORD *)(v29 + 16))
              goto LABEL_44;
            v9 = *(id *)(v28 + 8 * v8);
          }
          v10 = v9;
          if (__OFADD__(v8++, 1))
            goto LABEL_42;
          v12 = objc_msgSend(v9, sel_services);
          sub_24294899C(0, &qword_257207930);
          v13 = sub_242963B30();

          if (v13 >> 62)
          {
            swift_bridgeObjectRetain_n();
            v14 = sub_242963D4C();
            swift_bridgeObjectRelease();
            if (!v14)
              goto LABEL_27;
          }
          else
          {
            v14 = *(_QWORD *)((v13 & 0xFFFFFFFFFFFFF8) + 0x10);
            swift_bridgeObjectRetain();
            if (!v14)
              goto LABEL_27;
          }
          if ((v13 & 0xC000000000000001) != 0)
            v15 = (id)MEMORY[0x2494E8E28](0, v13);
          else
            v15 = *(id *)(v13 + 32);
          v16 = v15;
          v17 = sub_242963C20();

          if ((v17 & 1) != 0)
          {
LABEL_39:

            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            v7 = 1;
            goto LABEL_47;
          }
          if (v14 != 1)
            break;
LABEL_27:

          swift_bridgeObjectRelease();
LABEL_28:
          swift_bridgeObjectRelease();
          if (v8 == v7)
          {

            goto LABEL_40;
          }
        }
        if ((v13 & 0xC000000000000001) != 0)
          break;
        v21 = *(id *)(v13 + 40);
        v22 = sub_242963C20();

        if ((v22 & 1) != 0)
          goto LABEL_39;
        if (v14 == 2)
          goto LABEL_27;
        v23 = 6;
        while (1)
        {
          v4 = v23 - 3;
          if (__OFADD__(v23 - 4, 1))
            break;
          v24 = *(id *)(v13 + 8 * v23);
          v25 = sub_242963C20();

          if ((v25 & 1) != 0)
            goto LABEL_39;
          ++v23;
          if (v4 == v14)
          {
LABEL_34:

            swift_bridgeObjectRelease();
            v4 = v27;
            goto LABEL_28;
          }
        }
LABEL_43:
        __break(1u);
LABEL_44:
        __break(1u);
LABEL_45:
        swift_bridgeObjectRetain();
        v7 = sub_242963D4C();
        swift_bridgeObjectRelease();
        if (!v7)
          goto LABEL_46;
      }
      MEMORY[0x2494E8E28](1, v13);
      v18 = sub_242963C20();
      swift_unknownObjectRelease();
      if ((v18 & 1) != 0)
        goto LABEL_39;
      if (v14 != 2)
      {
        v19 = 2;
        while (1)
        {
          MEMORY[0x2494E8E28](v19, v13);
          v4 = v19 + 1;
          if (__OFADD__(v19, 1))
            break;
          v20 = sub_242963C20();
          swift_unknownObjectRelease();
          if ((v20 & 1) != 0)
            goto LABEL_39;
          ++v19;
          if (v4 == v14)
            goto LABEL_34;
        }
        __break(1u);
LABEL_42:
        __break(1u);
        goto LABEL_43;
      }
      goto LABEL_27;
    }
LABEL_46:

  }
  else
  {
LABEL_40:
    v7 = 0;
  }
LABEL_47:
  swift_bridgeObjectRelease();
  return v7;
}

HMService_optional __swiftcall HMAccessory.serviceWithPrimaryControlCharacteristic()()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  int v17;
  id v18;
  void *v19;
  char *v21;
  uint64_t (*v22)(char *, uint64_t);
  int v23;
  id v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  Swift::Bool v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  uint64_t v37;
  char v39;
  void *v40;
  id v41;
  void (*v42)(char *, uint64_t);
  void (*v43)(char *, uint64_t);
  void (*v44)(char *, uint64_t);
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  uint64_t v53;
  int v54;
  uint64_t v55;
  int v56;
  int v57;
  uint64_t v58;
  int v59;
  uint64_t v60;
  int v61;
  int v62;
  unint64_t v63;
  uint64_t v64;
  uint64_t v65;
  int v66;
  unint64_t v67;
  unsigned int v68;
  unint64_t v69;
  int v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  unint64_t v74;
  uint64_t v75;
  uint64_t v76;
  HMService_optional result;

  v1 = sub_242963974();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = MEMORY[0x24BDAC7A8](v1);
  v5 = (char *)&v44 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = MEMORY[0x24BDAC7A8](v3);
  v8 = (char *)&v44 - v7;
  v9 = MEMORY[0x24BDAC7A8](v6);
  v11 = (uint64_t)&v44 - v10;
  MEMORY[0x24BDAC7A8](v9);
  v71 = (char *)&v44 - v12;
  v13 = objc_msgSend(v0, sel_services);
  sub_24294899C(0, &qword_257207930);
  v14 = sub_242963B30();

  if (v14 >> 62)
    goto LABEL_58;
  v15 = *(_QWORD *)((v14 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (v15)
  {
    v58 = v11;
    v16 = 0;
    v69 = v14 & 0xC000000000000001;
    v70 = *MEMORY[0x24BE4D7B8];
    v64 = v14 & 0xFFFFFFFFFFFFFF8;
    v67 = v14;
    v63 = v14 + 32;
    v66 = *MEMORY[0x24BE4D6E0];
    v62 = *MEMORY[0x24BE4D878];
    v61 = *MEMORY[0x24BE4D650];
    v59 = *MEMORY[0x24BE4D810];
    v17 = *MEMORY[0x24BE4D828];
    v56 = *MEMORY[0x24BE4D690];
    v57 = v17;
    v54 = *MEMORY[0x24BE4D6A0];
    v53 = *MEMORY[0x24BDD5A60];
    v55 = *MEMORY[0x24BDD5770];
    v72 = *MEMORY[0x24BDD5970];
    v60 = *MEMORY[0x24BDD5A50];
    v65 = *MEMORY[0x24BDD5A18];
    v68 = *MEMORY[0x24BE4D5A0];
    while (1)
    {
      if (v69)
      {
        v18 = (id)MEMORY[0x2494E8E28](v16, v67);
      }
      else
      {
        if (v16 >= *(_QWORD *)(v64 + 16))
          goto LABEL_57;
        v18 = *(id *)(v63 + 8 * v16);
      }
      v19 = v18;
      if (__OFADD__(v16++, 1))
        break;
      v21 = v71;
      sub_242963C2C();
      v22 = *(uint64_t (**)(char *, uint64_t))(v2 + 88);
      v23 = v22(v21, v1);
      if (v23 == v70 || v23 == v66 || v23 == v62 || v23 == v61 || v23 == v59 || v23 == v57 || v23 == v56 || v23 == v54)
      {
        sub_242963A88();
        v40 = (void *)sub_242963A7C();
        swift_bridgeObjectRelease();
        v41 = objc_msgSend(v19, sel_hf_characteristicOfType_, v40);

        if (v41)
          goto LABEL_53;
      }
      else
      {
        v44 = *(void (**)(char *, uint64_t))(v2 + 8);
        v44(v71, v1);
        v24 = objc_msgSend(v19, sel_characteristics);
        sub_24294899C(0, &qword_257207940);
        v25 = sub_242963B30();

        v47 = v25;
        if (v25 >> 62)
        {
          swift_bridgeObjectRetain_n();
          v26 = sub_242963D4C();
          swift_bridgeObjectRelease();
        }
        else
        {
          v26 = *(_QWORD *)((v25 & 0xFFFFFFFFFFFFF8) + 0x10);
          swift_bridgeObjectRetain();
        }
        v27 = v47;
        if (v26)
        {
          v46 = v47 & 0xC000000000000001;
          v28 = 4;
          v45 = v26;
          do
          {
            v29 = v28 - 4;
            v49 = v28;
            if (v46)
            {
              v30 = (id)MEMORY[0x2494E8E28](v28 - 4, v27);
              v32 = v29 + 1;
              if (__OFADD__(v29, 1))
                goto LABEL_61;
            }
            else
            {
              v30 = *(id *)(v27 + 8 * v28);
              v32 = v29 + 1;
              if (__OFADD__(v29, 1))
              {
LABEL_61:
                __break(1u);
                goto LABEL_62;
              }
            }
            v48 = v32;
            v52 = v30;
            v33 = objc_msgSend(v30, sel_characteristicType);
            v50 = sub_242963A88();
            v51 = v34;

            v35 = v58;
            sub_242963C2C();
            v36 = v22((char *)v35, v1);
            if (v36 == v70
              || v36 == v66
              || v36 == v62
              || v36 == v61
              || v36 == v59
              || v36 == v57
              || v36 == v56
              || v36 == v54)
            {
              if (v50 == sub_242963A88() && v51 == v37)
              {
                swift_bridgeObjectRelease_n();
LABEL_55:
                swift_bridgeObjectRelease_n();
                swift_bridgeObjectRelease();

                goto LABEL_60;
              }
              v39 = sub_242963DA0();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              if ((v39 & 1) != 0)
                goto LABEL_55;

            }
            else
            {
              v44((char *)v58, v1);

              swift_bridgeObjectRelease();
            }
            v28 = v49 + 1;
            v27 = v47;
          }
          while (v48 != v45);
        }
        swift_bridgeObjectRelease_n();
      }
      sub_242963C2C();
      (*(void (**)(char *, _QWORD, uint64_t))(v2 + 104))(v5, v68, v1);
      sub_242948954();
      sub_242963B18();
      sub_242963B18();
      v14 = v74;
      if (v75 == v73 && v76 == v74)
      {
        swift_bridgeObjectRelease_n();
        v43 = *(void (**)(char *, uint64_t))(v2 + 8);
        v43(v5, v1);
        v43(v8, v1);
LABEL_53:
        swift_bridgeObjectRelease();
        goto LABEL_60;
      }
      v11 = sub_242963DA0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v42 = *(void (**)(char *, uint64_t))(v2 + 8);
      v42(v5, v1);
      v42(v8, v1);
      if ((v11 & 1) != 0)
        goto LABEL_53;

      if (v16 == v15)
        goto LABEL_59;
    }
    __break(1u);
LABEL_57:
    __break(1u);
LABEL_58:
    swift_bridgeObjectRetain();
    v15 = sub_242963D4C();
    swift_bridgeObjectRelease();
  }
LABEL_59:
  swift_bridgeObjectRelease();
  v19 = 0;
LABEL_60:
  v30 = v19;
LABEL_62:
  result.value.super.isa = (Class)v30;
  result.is_nil = v31;
  return result;
}

id NHOHomeUserCapabilities.__allocating_init(home:)(void *a1)
{
  objc_class *v1;
  id v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  objc_super v12;

  v3 = objc_allocWithZone(v1);
  v4 = OBJC_IVAR___NHOHomeUserCapabilities_logger;
  v5 = qword_257207740;
  v6 = v3;
  if (v5 != -1)
    swift_once();
  v7 = sub_2429639D4();
  v8 = __swift_project_value_buffer(v7, (uint64_t)qword_257207B70);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(&v6[v4], v8, v7);
  v6[OBJC_IVAR___NHOHomeUserCapabilities_isOnboarded] = 0;
  v6[OBJC_IVAR___NHOHomeUserCapabilities_hasMockData] = 0;
  *(_QWORD *)&v6[OBJC_IVAR___NHOHomeUserCapabilities_home] = a1;
  v9 = a1;

  v12.receiver = v6;
  v12.super_class = v1;
  v10 = objc_msgSendSuper2(&v12, sel_init);

  return v10;
}

uint64_t sub_24295C5A4()
{
  uint64_t v0;

  if ((*(_BYTE *)(v0 + OBJC_IVAR___NHOHomeUserCapabilities_isOnboarded) & 1) != 0
    || (*(_BYTE *)(v0 + OBJC_IVAR___NHOHomeUserCapabilities_hasMockData) & 1) != 0)
  {
    return 1;
  }
  else
  {
    return sub_24295C6C0();
  }
}

uint64_t static NHOHomeUserCapabilities.currentLocationEnergyForecastEnabled.getter()
{
  return sub_24295DC44(0xD000000000000024, 0x8000000242966D40) & 1;
}

uint64_t sub_24295C660()
{
  return sub_24295DC44(0xD000000000000015, 0x8000000242966DE0) & 1;
}

uint64_t sub_24295C6C0()
{
  char *v0;
  char *v1;
  uint64_t v2;
  id v3;
  id v4;
  char v5;
  id v6;
  Swift::Bool v7;
  uint64_t v8;
  char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v19;
  uint64_t v20;

  v1 = v0;
  v2 = OBJC_IVAR___NHOHomeUserCapabilities_home;
  v3 = *(id *)&v0[OBJC_IVAR___NHOHomeUserCapabilities_home];
  v4 = objc_msgSend(v3, sel_currentUser);
  v5 = sub_242963C08();

  if ((v5 & 1) == 0)
  {
    v6 = *(id *)&v1[v2];
    v7 = HMHome.isCurrentRestrictedGuestAwayFromHome()();

    if (!v7)
      return 0;
  }
  if (qword_257207730 != -1)
    swift_once();
  v8 = sub_2429639D4();
  __swift_project_value_buffer(v8, (uint64_t)qword_257207B40);
  v9 = v1;
  v10 = sub_2429639BC();
  v11 = sub_242963BFC();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = swift_slowAlloc();
    v13 = swift_slowAlloc();
    v20 = v13;
    *(_DWORD *)v12 = 136315394;
    v19 = sub_24294461C(0x7463697274736572, 0xEF74736575476465, &v20);
    sub_242963C5C();
    *(_WORD *)(v12 + 12) = 2080;
    v14 = objc_msgSend(*(id *)&v1[v2], sel_name, v19);
    v15 = sub_242963A88();
    v17 = v16;

    sub_24294461C(v15, v17, &v20);
    sub_242963C5C();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_242941000, v10, v11, "%s: the current user in home %s is restricted.", (uint8_t *)v12, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2494E932C](v13, -1, -1);
    MEMORY[0x2494E932C](v12, -1, -1);

  }
  else
  {

  }
  return 1;
}

id NHOHomeUserCapabilities.init(home:)(void *a1)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  objc_super v12;

  v3 = OBJC_IVAR___NHOHomeUserCapabilities_logger;
  v4 = qword_257207740;
  v5 = v1;
  if (v4 != -1)
    swift_once();
  v6 = &v5[v3];
  v7 = sub_2429639D4();
  v8 = __swift_project_value_buffer(v7, (uint64_t)qword_257207B70);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(v6, v8, v7);
  v5[OBJC_IVAR___NHOHomeUserCapabilities_isOnboarded] = 0;
  v5[OBJC_IVAR___NHOHomeUserCapabilities_hasMockData] = 0;
  *(_QWORD *)&v5[OBJC_IVAR___NHOHomeUserCapabilities_home] = a1;
  v9 = a1;

  v12.receiver = v5;
  v12.super_class = (Class)type metadata accessor for NHOHomeUserCapabilities();
  v10 = objc_msgSendSuper2(&v12, sel_init);

  return v10;
}

uint64_t sub_24295CB24()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1[2] = v0;
  v2 = sub_2429638CC();
  v1[3] = v2;
  v1[4] = *(_QWORD *)(v2 - 8);
  v1[5] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_24295CB84()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  _QWORD *v6;

  v2 = v0[4];
  v1 = v0[5];
  v3 = v0[3];
  v4 = *(void **)(v0[2] + OBJC_IVAR___NHOHomeUserCapabilities_home);
  v0[6] = v4;
  v5 = objc_msgSend(v4, sel_uniqueIdentifier);
  sub_2429638C0();

  sub_2429638B4();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  sub_242963A34();
  v6 = (_QWORD *)swift_task_alloc();
  v0[7] = v6;
  *v6 = v0;
  v6[1] = sub_24295CC4C;
  return sub_242963A1C();
}

uint64_t sub_24295CC4C(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 64) = a1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_24295CCA8()
{
  uint64_t v0;
  void *v1;
  char v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(void **)(v0 + 48);
  if (*(_QWORD *)(v0 + 64))
  {
    v2 = sub_242963A28();
    swift_release();
  }
  else
  {
    v2 = 0;
  }

  v3 = *(_QWORD *)(v0 + 16);
  v4 = _sSo6HMHomeC15NanoHomeIntentsE22hasMockElectricityDataSbyF_0();
  v5 = *(_QWORD *)(v0 + 16);
  if ((v2 & 1) == *(_BYTE *)(v3 + OBJC_IVAR___NHOHomeUserCapabilities_isOnboarded)
    && (v4 & 1) == *(_BYTE *)(v5 + OBJC_IVAR___NHOHomeUserCapabilities_hasMockData))
  {
    v6 = 0;
  }
  else
  {
    *(_BYTE *)(v3 + OBJC_IVAR___NHOHomeUserCapabilities_isOnboarded) = v2 & 1;
    *(_BYTE *)(v5 + OBJC_IVAR___NHOHomeUserCapabilities_hasMockData) = v4 & 1;
    v6 = 1;
  }
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v6);
}

uint64_t HMHome.utilityOnboarded()()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1[2] = v0;
  v2 = sub_2429638CC();
  v1[3] = v2;
  v1[4] = *(_QWORD *)(v2 - 8);
  v1[5] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_24295CDC8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  _QWORD *v5;

  v2 = *(_QWORD *)(v0 + 32);
  v1 = *(_QWORD *)(v0 + 40);
  v3 = *(_QWORD *)(v0 + 24);
  v4 = objc_msgSend(*(id *)(v0 + 16), sel_uniqueIdentifier);
  sub_2429638C0();

  sub_2429638B4();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  sub_242963A34();
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 48) = v5;
  *v5 = v0;
  v5[1] = sub_24295CE7C;
  return sub_242963A1C();
}

uint64_t sub_24295CE7C(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 56) = a1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_24295CED8()
{
  uint64_t v0;
  char v1;

  if (*(_QWORD *)(v0 + 56))
  {
    v1 = sub_242963A28();
    swift_release();
  }
  else
  {
    v1 = 0;
  }
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(v1 & 1);
}

uint64_t sub_24295D050(const void *a1, void *a2)
{
  _QWORD *v2;
  _QWORD *v4;

  v2[2] = a2;
  v2[3] = _Block_copy(a1);
  a2;
  v4 = (_QWORD *)swift_task_alloc();
  v2[4] = v4;
  *v4 = v2;
  v4[1] = sub_24295D0B0;
  return sub_24295CB24();
}

uint64_t sub_24295D0B0(char a1)
{
  uint64_t *v1;
  void (**v3)(_QWORD, _QWORD);
  void *v4;
  uint64_t v6;

  v3 = *(void (***)(_QWORD, _QWORD))(*v1 + 24);
  v4 = *(void **)(*v1 + 16);
  v6 = *v1;
  swift_task_dealloc();

  v3[2](v3, a1 & 1);
  _Block_release(v3);
  return (*(uint64_t (**)(void))(v6 + 8))();
}

id NHOHomeUserCapabilities.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void NHOHomeUserCapabilities.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id NHOHomeUserCapabilities.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for NHOHomeUserCapabilities();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t HMHome.onboardedOrMockData()()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1[2] = v0;
  v2 = sub_2429638CC();
  v1[3] = v2;
  v1[4] = *(_QWORD *)(v2 - 8);
  v1[5] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_24295D280()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  _QWORD *v5;

  v2 = *(_QWORD *)(v0 + 32);
  v1 = *(_QWORD *)(v0 + 40);
  v3 = *(_QWORD *)(v0 + 24);
  v4 = objc_msgSend(*(id *)(v0 + 16), sel_uniqueIdentifier);
  sub_2429638C0();

  sub_2429638B4();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  sub_242963A34();
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 48) = v5;
  *v5 = v0;
  v5[1] = sub_24295D334;
  return sub_242963A1C();
}

uint64_t sub_24295D334(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 56) = a1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_24295D390()
{
  uint64_t v0;
  char v1;
  char v2;

  if (*(_QWORD *)(v0 + 56) && (v1 = sub_242963A28(), swift_release(), (v1 & 1) != 0))
    v2 = 1;
  else
    v2 = _sSo6HMHomeC15NanoHomeIntentsE22hasMockElectricityDataSbyF_0();
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(v2 & 1);
}

uint64_t sub_24295D3F0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v4;
  *v4 = v3;
  v4[1] = sub_2429509BC;
  return v6();
}

uint64_t sub_24295D444(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(void);

  v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v5;
  *v5 = v4;
  v5[1] = sub_2429509BC;
  return v7();
}

uint64_t sub_24295D498(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_242963B90();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_242963B84();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_242945BA8(a1, &qword_257207E20);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_242963B6C();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t _sSo6HMHomeC15NanoHomeIntentsE22hasMockElectricityDataSbyF_0()
{
  id v0;
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  char v12;
  char v13;

  v0 = sub_2429459B0();
  v1 = (void *)sub_242963A7C();
  v2 = objc_msgSend(v0, sel_stringForKey_, v1);

  if (v2)
  {
    v3 = sub_242963A88();
    v5 = v4;

  }
  else
  {
    v3 = 0;
    v5 = 0;
  }
  v6 = (void *)sub_242963A7C();
  v7 = objc_msgSend(v0, sel_stringForKey_, v6);

  if (v7)
  {
    v8 = sub_242963A88();
    v10 = v9;

  }
  else
  {
    v8 = 0;
    v10 = 0;
  }
  if (v5)
  {
    if (v3 == 0x746C7561666564 && v5 == 0xE700000000000000)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      v11 = sub_242963DA0();
      swift_bridgeObjectRelease();
      if ((v11 & 1) == 0)
      {

        swift_bridgeObjectRelease();
        v12 = 1;
        return v12 & 1;
      }
    }
  }
  if (v10)
  {
    if (v8 != 0x746C7561666564 || v10 != 0xE700000000000000)
    {
      v13 = sub_242963DA0();
      swift_bridgeObjectRelease();

      v12 = v13 ^ 1;
      return v12 & 1;
    }
    swift_bridgeObjectRelease();
  }

  v12 = 0;
  return v12 & 1;
}

uint64_t sub_24295D7CC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  unsigned int (*v20)(uint64_t, uint64_t, uint64_t);
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  uint64_t v25;
  char *v27;
  char v28;
  void (*v29)(char *, uint64_t);
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;

  v0 = sub_2429638FC();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v31 = (char *)&v30 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572081E8);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572081F0);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v7);
  v12 = (char *)&v30 - v11;
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v30 - v13;
  v15 = sub_242963920();
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v30 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_242963914();
  sub_242963908();
  (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
  sub_2429638F0();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v1 + 56))(v12, 0, 1, v0);
  v19 = (uint64_t)&v5[*(int *)(v3 + 48)];
  sub_24295E200((uint64_t)v14, (uint64_t)v5);
  sub_24295E200((uint64_t)v12, v19);
  v20 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v1 + 48);
  if (v20((uint64_t)v5, 1, v0) == 1)
  {
    sub_242945BA8((uint64_t)v12, &qword_2572081F0);
    sub_242945BA8((uint64_t)v14, &qword_2572081F0);
    if (v20(v19, 1, v0) == 1)
    {
      sub_242945BA8((uint64_t)v5, &qword_2572081F0);
      return 1;
    }
    goto LABEL_6;
  }
  sub_24295E200((uint64_t)v5, (uint64_t)v9);
  if (v20(v19, 1, v0) == 1)
  {
    sub_242945BA8((uint64_t)v12, &qword_2572081F0);
    sub_242945BA8((uint64_t)v14, &qword_2572081F0);
    (*(void (**)(char *, uint64_t))(v1 + 8))(v9, v0);
LABEL_6:
    sub_242945BA8((uint64_t)v5, &qword_2572081E8);
    goto LABEL_7;
  }
  v27 = v31;
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 32))(v31, v19, v0);
  sub_24295E248();
  v28 = sub_242963A64();
  v29 = *(void (**)(char *, uint64_t))(v1 + 8);
  v29(v27, v0);
  sub_242945BA8((uint64_t)v12, &qword_2572081F0);
  sub_242945BA8((uint64_t)v14, &qword_2572081F0);
  v29(v9, v0);
  sub_242945BA8((uint64_t)v5, &qword_2572081F0);
  if ((v28 & 1) != 0)
    return 1;
LABEL_7:
  if (qword_257207730 != -1)
    swift_once();
  v21 = sub_2429639D4();
  __swift_project_value_buffer(v21, (uint64_t)qword_257207B40);
  v22 = sub_2429639BC();
  v23 = sub_242963BFC();
  if (os_log_type_enabled(v22, v23))
  {
    v24 = (uint8_t *)swift_slowAlloc();
    v25 = swift_slowAlloc();
    v33 = v25;
    *(_DWORD *)v24 = 136315138;
    v32 = sub_24294461C(0xD000000000000017, 0x8000000242966E30, &v33);
    sub_242963C5C();
    _os_log_impl(&dword_242941000, v22, v23, "%s: region is not supported", v24, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2494E932C](v25, -1, -1);
    MEMORY[0x2494E932C](v24, -1, -1);
  }

  return 0;
}

uint64_t sub_24295DC28()
{
  return sub_24295DC44(0xD000000000000015, 0x8000000242966DE0);
}

uint64_t sub_24295DC44(uint64_t a1, unint64_t a2)
{
  char v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v11;

  v4 = sub_24295D7CC();
  if ((v4 & 1) == 0)
  {
    if (qword_257207730 != -1)
      swift_once();
    v5 = sub_2429639D4();
    __swift_project_value_buffer(v5, (uint64_t)qword_257207B40);
    v6 = sub_2429639BC();
    v7 = sub_242963BFC();
    if (os_log_type_enabled(v6, v7))
    {
      v8 = (uint8_t *)swift_slowAlloc();
      v9 = swift_slowAlloc();
      v11 = v9;
      *(_DWORD *)v8 = 136315138;
      sub_24294461C(a1, a2, &v11);
      sub_242963C5C();
      _os_log_impl(&dword_242941000, v6, v7, "%s: region is not supported", v8, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2494E932C](v9, -1, -1);
      MEMORY[0x2494E932C](v8, -1, -1);
    }

  }
  return v4 & 1;
}

uint64_t type metadata accessor for NHOHomeUserCapabilities()
{
  uint64_t result;

  result = qword_257208190;
  if (!qword_257208190)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_24295DE00()
{
  return type metadata accessor for NHOHomeUserCapabilities();
}

uint64_t sub_24295DE08()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2429639D4();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for NHOHomeUserCapabilities()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of NHOHomeUserCapabilities.shouldShowElectricity.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of NHOHomeUserCapabilities.energyForecastEnabled.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of NHOHomeUserCapabilities.restrictedGuest.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of NHOHomeUserCapabilities.__allocating_init(home:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 208))();
}

uint64_t dispatch thunk of NHOHomeUserCapabilities.updateCapabilities()()
{
  _QWORD *v0;
  uint64_t v1;
  int *v2;
  _QWORD *v3;
  uint64_t (*v5)(void);

  v2 = *(int **)((*MEMORY[0x24BEE4EA0] & *v0) + 0xD8);
  v5 = (uint64_t (*)(void))((char *)v2 + *v2);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_24295DF5C;
  return v5();
}

uint64_t sub_24295DF5C(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v4;

  v4 = *v1;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t sub_24295DFAC()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));

  return swift_deallocObject();
}

uint64_t sub_24295DFD8()
{
  uint64_t v0;
  uint64_t v1;
  const void *v2;
  void *v3;
  _QWORD *v4;

  v2 = *(const void **)(v0 + 16);
  v3 = *(void **)(v0 + 24);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_24294E454;
  return ((uint64_t (*)(const void *, void *))((char *)&dword_2572081A8 + dword_2572081A8))(v2, v3);
}

uint64_t sub_24295E040()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int *v4;
  _QWORD *v5;

  v2 = v0[2];
  v3 = v0[3];
  v4 = (int *)v0[4];
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_2429509BC;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_2572081B8 + dword_2572081B8))(v2, v3, v4);
}

uint64_t objectdestroy_7Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_24295E0E8(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  int *v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = (int *)v1[4];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_2429509BC;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_2572081C8 + dword_2572081C8))(a1, v4, v5, v6);
}

uint64_t sub_24295E16C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_24295E190(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_24294E454;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_2572081D8 + dword_2572081D8))(a1, v4);
}

uint64_t sub_24295E200(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572081F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_24295E248()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2572081F8;
  if (!qword_2572081F8)
  {
    v1 = sub_2429638FC();
    result = MEMORY[0x2494E92B4](MEMORY[0x24BDCED28], v1);
    atomic_store(result, (unint64_t *)&qword_2572081F8);
  }
  return result;
}

id NHOAccessoryIntent.__allocating_init(homeID:homeName:accessoryID:accessoryName:icon:serviceKind:)(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  objc_class *v11;
  id v12;
  uint64_t v13;

  v12 = objc_msgSend(objc_allocWithZone(v11), sel_init);
  swift_retain();
  sub_242963770();
  swift_release();
  swift_retain();
  sub_242963770();
  swift_release();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_242963770();
  swift_release();
  swift_retain();
  sub_242963770();
  swift_release();
  swift_retain();
  sub_242963770();
  swift_release();
  sub_242963968();
  swift_retain();
  sub_242963770();
  swift_release();
  swift_retain();
  sub_242963770();
  swift_release();
  swift_retain();
  sub_242963770();

  swift_release();
  v13 = sub_242963974();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 8))(a11, v13);
  return v12;
}

uint64_t sub_24295E49C()
{
  uint64_t v0;

  v0 = sub_242963824();
  __swift_allocate_value_buffer(v0, qword_257208200);
  __swift_project_value_buffer(v0, (uint64_t)qword_257208200);
  return sub_242963818();
}

uint64_t static NHOAccessoryIntent.title.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_242948F3C(&qword_257207788, (uint64_t (*)(_QWORD))MEMORY[0x24BDCD380], (uint64_t)qword_257208200, a1);
}

uint64_t static NHOAccessoryIntent.title.setter(uint64_t a1)
{
  return sub_242948FEC(a1, &qword_257207788, (uint64_t (*)(_QWORD))MEMORY[0x24BDCD380], (uint64_t)qword_257208200);
}

uint64_t (*static NHOAccessoryIntent.title.modify())()
{
  uint64_t v0;

  if (qword_257207788 != -1)
    swift_once();
  v0 = sub_242963824();
  __swift_project_value_buffer(v0, (uint64_t)qword_257208200);
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_24295E5C0()
{
  uint64_t v0;

  v0 = sub_2429637B8();
  __swift_allocate_value_buffer(v0, qword_257208218);
  __swift_project_value_buffer(v0, (uint64_t)qword_257208218);
  return sub_2429637AC();
}

uint64_t static NHOAccessoryIntent.description.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_242948F3C(&qword_257207790, (uint64_t (*)(_QWORD))MEMORY[0x24BDB5800], (uint64_t)qword_257208218, a1);
}

uint64_t static NHOAccessoryIntent.description.setter(uint64_t a1)
{
  return sub_242948FEC(a1, &qword_257207790, (uint64_t (*)(_QWORD))MEMORY[0x24BDB5800], (uint64_t)qword_257208218);
}

uint64_t (*static NHOAccessoryIntent.description.modify())()
{
  uint64_t v0;

  if (qword_257207790 != -1)
    swift_once();
  v0 = sub_2429637B8();
  __swift_project_value_buffer(v0, (uint64_t)qword_257208218);
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t NHOAccessoryIntent.homeID.getter()
{
  return sub_242949240();
}

uint64_t NHOAccessoryIntent.homeID.setter()
{
  return sub_24294930C();
}

uint64_t (*NHOAccessoryIntent.homeID.modify(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = *(_QWORD *)(v1 + OBJC_IVAR___NHOAccessoryIntent__homeID);
  swift_retain();
  v3[5] = sub_242963758();
  return sub_2429491A0;
}

uint64_t NHOAccessoryIntent.$homeID.getter()
{
  return sub_242949494();
}

uint64_t NHOAccessoryIntent.homeName.getter()
{
  return sub_242949240();
}

uint64_t NHOAccessoryIntent.homeName.setter()
{
  return sub_24294930C();
}

uint64_t (*NHOAccessoryIntent.homeName.modify(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = *(_QWORD *)(v1 + OBJC_IVAR___NHOAccessoryIntent__homeName);
  swift_retain();
  v3[5] = sub_242963758();
  return sub_2429491A0;
}

uint64_t NHOAccessoryIntent.$homeName.getter()
{
  return sub_242949494();
}

uint64_t NHOAccessoryIntent.accessoryID.getter()
{
  return sub_242949240();
}

uint64_t NHOAccessoryIntent.accessoryID.setter()
{
  return sub_24294930C();
}

uint64_t (*NHOAccessoryIntent.accessoryID.modify(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = *(_QWORD *)(v1 + OBJC_IVAR___NHOAccessoryIntent__accessoryID);
  swift_retain();
  v3[5] = sub_242963758();
  return sub_2429491A0;
}

uint64_t NHOAccessoryIntent.$accessoryID.getter()
{
  return sub_242949494();
}

uint64_t NHOAccessoryIntent.accessoryName.getter()
{
  return sub_242949240();
}

uint64_t NHOAccessoryIntent.accessoryName.setter()
{
  return sub_24294930C();
}

uint64_t (*NHOAccessoryIntent.accessoryName.modify(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = *(_QWORD *)(v1 + OBJC_IVAR___NHOAccessoryIntent__accessoryName);
  swift_retain();
  v3[5] = sub_242963758();
  return sub_2429491A0;
}

uint64_t NHOAccessoryIntent.$accessoryName.getter()
{
  return sub_242949494();
}

uint64_t NHOAccessoryIntent.icon.getter()
{
  return sub_242949240();
}

uint64_t NHOAccessoryIntent.icon.setter()
{
  return sub_24294930C();
}

uint64_t (*NHOAccessoryIntent.icon.modify(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = *(_QWORD *)(v1 + OBJC_IVAR___NHOAccessoryIntent__icon);
  swift_retain();
  v3[5] = sub_242963758();
  return sub_2429491A0;
}

uint64_t NHOAccessoryIntent.$icon.getter()
{
  return sub_242949494();
}

uint64_t NHOAccessoryIntent.serviceType.getter()
{
  return sub_242949240();
}

uint64_t NHOAccessoryIntent.serviceType.setter()
{
  return sub_24294930C();
}

uint64_t (*NHOAccessoryIntent.serviceType.modify(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = *(_QWORD *)(v1 + OBJC_IVAR___NHOAccessoryIntent__serviceType);
  swift_retain();
  v3[5] = sub_242963758();
  return sub_2429491A0;
}

uint64_t NHOAccessoryIntent.$serviceType.getter()
{
  return sub_242949494();
}

uint64_t NHOAccessoryIntent.useHomeKitRecommendations.getter()
{
  unsigned __int8 v1;

  swift_retain();
  sub_242963764();
  swift_release();
  return v1;
}

uint64_t NHOAccessoryIntent.useHomeKitRecommendations.setter()
{
  swift_retain();
  sub_242963770();
  return swift_release();
}

uint64_t sub_24295EBC0@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;
  char v3;

  swift_retain();
  sub_242963764();
  result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_24295EC14()
{
  swift_retain();
  sub_242963770();
  return swift_release();
}

uint64_t (*NHOAccessoryIntent.useHomeKitRecommendations.modify(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = *(_QWORD *)(v1 + OBJC_IVAR___NHOAccessoryIntent__useHomeKitRecommendations);
  swift_retain();
  v3[5] = sub_242963758();
  return sub_2429491A0;
}

uint64_t NHOAccessoryIntent.$useHomeKitRecommendations.getter()
{
  return sub_242949494();
}

uint64_t NHOAccessoryIntent.accessoriesAndScenes.getter()
{
  return sub_242949240();
}

uint64_t NHOAccessoryIntent.accessoriesAndScenes.setter()
{
  return sub_24294930C();
}

uint64_t (*NHOAccessoryIntent.accessoriesAndScenes.modify(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = *(_QWORD *)(v1 + OBJC_IVAR___NHOAccessoryIntent__accessoriesAndScenes);
  swift_retain();
  v3[5] = sub_242963758();
  return sub_2429491A0;
}

uint64_t NHOAccessoryIntent.$accessoriesAndScenes.getter()
{
  return sub_242949494();
}

uint64_t NHOAccessoryIntent.requestConfirmationText.getter()
{
  return sub_242949240();
}

uint64_t NHOAccessoryIntent.requestConfirmationText.setter()
{
  return sub_24294930C();
}

uint64_t (*NHOAccessoryIntent.requestConfirmationText.modify(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = *(_QWORD *)(v1 + OBJC_IVAR___NHOAccessoryIntent__requestConfirmationText);
  swift_retain();
  v3[5] = sub_242963758();
  return sub_2429491A0;
}

uint64_t NHOAccessoryIntent.$requestConfirmationText.getter()
{
  return sub_242949494();
}

uint64_t NHOAccessoryIntent.requestConfirmationIcon.getter()
{
  return sub_242949240();
}

uint64_t NHOAccessoryIntent.requestConfirmationIcon.setter()
{
  return sub_24294930C();
}

uint64_t (*NHOAccessoryIntent.requestConfirmationIcon.modify(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = *(_QWORD *)(v1 + OBJC_IVAR___NHOAccessoryIntent__requestConfirmationIcon);
  swift_retain();
  v3[5] = sub_242963758();
  return sub_2429491A0;
}

uint64_t NHOAccessoryIntent.$requestConfirmationIcon.getter()
{
  return sub_242949494();
}

uint64_t NHOAccessoryIntent.isSmartStack.getter()
{
  unsigned __int8 v1;

  swift_retain();
  sub_242963764();
  swift_release();
  return v1;
}

uint64_t sub_24295EEBC@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;
  char v3;

  swift_retain();
  sub_242963764();
  result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_24295EF10()
{
  swift_retain();
  sub_242963770();
  return swift_release();
}

uint64_t NHOAccessoryIntent.isSmartStack.setter()
{
  swift_retain();
  sub_242963770();
  return swift_release();
}

uint64_t (*NHOAccessoryIntent.isSmartStack.modify(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = *(_QWORD *)(v1 + OBJC_IVAR___NHOAccessoryIntent__isSmartStack);
  swift_retain();
  v3[5] = sub_242963758();
  return sub_2429491A0;
}

uint64_t NHOAccessoryIntent.$isSmartStack.getter()
{
  return sub_242949494();
}

id NHOAccessoryIntent.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id NHOAccessoryIntent.init()()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  void (*v23)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  void (*v32)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v33;
  void (*v34)(char *, uint64_t, uint64_t);
  char *v35;
  uint64_t v36;
  char *v37;
  char *v38;
  void (*v39)(char *, uint64_t, uint64_t, uint64_t);
  char *v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  char *v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  char *v51;
  char *v52;
  uint64_t v53;
  void (*v54)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v55;
  void (*v56)(char *, uint64_t, uint64_t, uint64_t);
  char *v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  char *v61;
  uint64_t v62;
  void (*v63)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v64;
  char *v65;
  uint64_t v66;
  void (*v67)(char *, uint64_t, uint64_t, uint64_t);
  char *v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  char *v72;
  char *v73;
  void (*v74)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void (*v78)(char *, uint64_t, uint64_t, uint64_t);
  char *v79;
  uint64_t v80;
  void (*v81)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v82;
  void (*v83)(char *, uint64_t, uint64_t);
  uint64_t v84;
  char *v85;
  char *v86;
  char *v87;
  uint64_t v88;
  char *v89;
  uint64_t v90;
  id v91;
  id v92;
  unint64_t v93;
  unint64_t v94;
  uint64_t v95;
  char *v96;
  uint64_t v97;
  uint64_t v98;
  unint64_t v99;
  unint64_t v100;
  uint64_t v102;
  uint64_t v103;
  void (*v104)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v105;
  objc_class *ObjectType;
  char *v107;
  uint64_t v108;
  uint64_t v109;
  char *v110;
  char *v111;
  char *v112;
  char *v113;
  char *v114;
  uint64_t v115;
  char *v116;
  unsigned int v117;
  char *v118;
  uint64_t v119;
  void (*v120)(char *, uint64_t, uint64_t, uint64_t);
  void (*v121)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  void (*v125)(char *, uint64_t, uint64_t, uint64_t);
  void (*v126)(char *, uint64_t, uint64_t);
  objc_super v127;
  uint64_t v128;
  unint64_t v129;

  v1 = v0;
  ObjectType = (objc_class *)swift_getObjectType();
  v109 = sub_242963974();
  v108 = *(_QWORD *)(v109 - 8);
  MEMORY[0x24BDAC7A8](v109);
  v107 = (char *)&v102 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_257207C18);
  MEMORY[0x24BDAC7A8](v3);
  v110 = (char *)&v102 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_2429637DC();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v102 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_257207990);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v102 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_257207998);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v102 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572079A0);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v102 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_242963824();
  v19 = *(_QWORD *)(v18 - 8);
  v124 = v18;
  MEMORY[0x24BDAC7A8](v18);
  v21 = (char *)&v102 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v105 = OBJC_IVAR___NHOAccessoryIntent__homeID;
  v115 = __swift_instantiateConcreteTypeFromMangledName(&qword_257207C38);
  v118 = v1;
  sub_242963818();
  v121 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v19 + 56);
  v121(v17, 1, 1, v18);
  v22 = sub_242963A70();
  v128 = 0;
  v129 = 0;
  v23 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56);
  v119 = v22;
  v120 = v23;
  v23(v14, 1, 1, v22);
  v24 = sub_242963740();
  v125 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 56);
  v123 = v24;
  v125(v11, 1, 1, v24);
  v25 = *MEMORY[0x24BDB6090];
  v126 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 104);
  v117 = v25;
  v26 = v5;
  v122 = v5;
  v126(v8, v25, v5);
  v113 = v17;
  v114 = v21;
  v27 = v11;
  *(_QWORD *)((char *)v104 + v105) = sub_242963794();
  v105 = OBJC_IVAR___NHOAccessoryIntent__homeName;
  sub_242963818();
  v28 = v17;
  v29 = v124;
  v121(v28, 1, 1, v124);
  v128 = 0;
  v129 = 0;
  v112 = v14;
  v30 = v119;
  v120(v14, 1, 1, v119);
  v31 = v11;
  v32 = v125;
  v125(v31, 1, 1, v24);
  v33 = v25;
  v34 = v126;
  v126(v8, v33, v26);
  v35 = v113;
  v36 = sub_242963794();
  v37 = v118;
  *(_QWORD *)&v118[v105] = v36;
  v105 = OBJC_IVAR___NHOAccessoryIntent__accessoryID;
  sub_242963818();
  v121(v35, 1, 1, v29);
  v128 = 0;
  v129 = 0;
  v38 = v112;
  v39 = v120;
  v120(v112, 1, 1, v30);
  v40 = v27;
  v32(v27, 1, 1, v123);
  v116 = v8;
  v41 = v8;
  v42 = v117;
  v43 = v122;
  v34(v41, v117, v122);
  v44 = v113;
  v45 = v38;
  v46 = v40;
  *(_QWORD *)&v37[v105] = sub_242963794();
  v105 = OBJC_IVAR___NHOAccessoryIntent__accessoryName;
  sub_242963818();
  v47 = v124;
  v121(v44, 1, 1, v124);
  v128 = 0;
  v129 = 0;
  v48 = v119;
  v39(v45, 1, 1, v119);
  v49 = v123;
  v125(v46, 1, 1, v123);
  v50 = v116;
  v126(v116, v42, v43);
  v51 = v113;
  v52 = v50;
  *(_QWORD *)&v118[v105] = sub_242963794();
  v105 = OBJC_IVAR___NHOAccessoryIntent__icon;
  sub_242963818();
  v53 = v47;
  v54 = v121;
  v121(v51, 1, 1, v53);
  v128 = 0;
  v129 = 0;
  v55 = v48;
  v56 = v120;
  v120(v45, 1, 1, v55);
  v57 = v46;
  v125(v46, 1, 1, v49);
  v58 = v117;
  v126(v52, v117, v122);
  v59 = sub_242963794();
  v60 = v118;
  *(_QWORD *)&v118[v105] = v59;
  v105 = OBJC_IVAR___NHOAccessoryIntent__serviceType;
  sub_242963818();
  v54(v51, 1, 1, v124);
  v128 = 0;
  v129 = 0;
  v56(v45, 1, 1, v119);
  v111 = v57;
  v61 = v57;
  v62 = v123;
  v63 = v125;
  v125(v61, 1, 1, v123);
  v64 = v122;
  v126(v116, v58, v122);
  v65 = v113;
  *(_QWORD *)&v60[v105] = sub_242963794();
  v103 = OBJC_IVAR___NHOAccessoryIntent__useHomeKitRecommendations;
  v102 = __swift_instantiateConcreteTypeFromMangledName(&qword_257207C30);
  sub_242963818();
  v66 = v124;
  v67 = v121;
  v121(v65, 1, 1, v124);
  LOBYTE(v128) = 2;
  v105 = sub_242963B60();
  v104 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v105 - 8) + 56);
  v104(v110, 1, 1, v105);
  v68 = v111;
  v63(v111, 1, 1, v62);
  v69 = v116;
  v70 = v117;
  v126(v116, v117, v64);
  v71 = sub_2429637A0();
  v72 = v118;
  *(_QWORD *)&v118[v103] = v71;
  v103 = OBJC_IVAR___NHOAccessoryIntent__accessoriesAndScenes;
  sub_242963818();
  v73 = v65;
  v67(v65, 1, 1, v66);
  v128 = 0;
  v129 = 0;
  v75 = v119;
  v74 = v120;
  v120(v112, 1, 1, v119);
  v76 = v123;
  v125(v68, 1, 1, v123);
  v126(v69, v70, v122);
  *(_QWORD *)&v72[v103] = sub_242963794();
  v103 = OBJC_IVAR___NHOAccessoryIntent__requestConfirmationText;
  v115 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572079A8);
  v102 = 0xD000000000000017;
  sub_242963818();
  v77 = v124;
  v78 = v121;
  v121(v73, 1, 1, v124);
  v128 = 0;
  v129 = 0;
  v79 = v112;
  v74(v112, 1, 1, v75);
  v80 = v76;
  v81 = v125;
  v125(v111, 1, 1, v80);
  v82 = v117;
  v83 = v126;
  v126(v116, v117, v122);
  v84 = sub_242963794();
  v85 = v118;
  *(_QWORD *)&v118[v103] = v84;
  v103 = OBJC_IVAR___NHOAccessoryIntent__requestConfirmationIcon;
  sub_242963818();
  v78(v73, 1, 1, v77);
  v128 = 0;
  v129 = 0;
  v120(v79, 1, 1, v119);
  v86 = v111;
  v81(v111, 1, 1, v123);
  v87 = v116;
  v88 = v122;
  v83(v116, v82, v122);
  v89 = v85;
  *(_QWORD *)&v85[v103] = sub_242963794();
  v90 = OBJC_IVAR___NHOAccessoryIntent__isSmartStack;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257207C40);
  sub_242963818();
  v78(v73, 1, 1, v124);
  LOBYTE(v128) = 2;
  v104(v110, 1, 1, v105);
  v125(v86, 1, 1, v123);
  v126(v87, v117, v88);
  *(_QWORD *)&v89[v90] = sub_2429637A0();

  v127.receiver = v89;
  v127.super_class = ObjectType;
  v91 = objc_msgSendSuper2(&v127, sel_init);
  v128 = 0xD000000000000024;
  v129 = 0x8000000242966E50;
  v92 = v91;
  swift_retain();
  sub_242963770();
  swift_release();
  v128 = _s15NanoHomeIntents21NHOIntentLocalizationC15localizedStringyS2SFZ_0(0xD00000000000001CLL, 0x8000000242966AE0);
  v129 = v93;
  swift_retain();
  sub_242963770();
  swift_release();
  v128 = 0xD000000000000024;
  v129 = 0x8000000242966E50;
  swift_retain();
  sub_242963770();
  swift_release();
  v128 = _s15NanoHomeIntents21NHOIntentLocalizationC15localizedStringyS2SFZ_0(0xD000000000000021, 0x8000000242966E80);
  v129 = v94;
  swift_retain();
  sub_242963770();
  swift_release();
  v128 = 0x74696B656D6F68;
  v129 = 0xE700000000000000;
  swift_retain();
  sub_242963770();
  swift_release();
  v95 = v108;
  v96 = v107;
  v97 = v109;
  (*(void (**)(char *, _QWORD, uint64_t))(v108 + 104))(v107, *MEMORY[0x24BE4D7D0], v109);
  v98 = sub_242963968();
  v100 = v99;
  (*(void (**)(char *, uint64_t))(v95 + 8))(v96, v97);
  v128 = v98;
  v129 = v100;
  swift_retain();
  sub_242963770();
  swift_release();
  v128 = 0xD000000000000024;
  v129 = 0x8000000242966E50;
  swift_retain();
  sub_242963770();
  swift_release();
  LOBYTE(v128) = 0;
  swift_retain();
  sub_242963770();

  swift_release();
  return v92;
}

uint64_t NHOAccessoryIntent.perform()(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 24) = a1;
  return swift_task_switch();
}

uint64_t NHOAccessoryIntent.description.getter()
{
  sub_242963CE0();
  sub_242963AE8();
  swift_retain();
  sub_242963764();
  swift_release();
  sub_242963AE8();
  swift_bridgeObjectRelease();
  sub_242963AE8();
  swift_retain();
  sub_242963764();
  swift_release();
  sub_242963AE8();
  swift_bridgeObjectRelease();
  sub_242963AE8();
  swift_retain();
  sub_242963764();
  swift_release();
  sub_242963AE8();
  swift_bridgeObjectRelease();
  sub_242963AE8();
  swift_retain();
  sub_242963764();
  swift_release();
  sub_242963AE8();
  swift_bridgeObjectRelease();
  sub_242963AE8();
  swift_retain();
  sub_242963764();
  swift_release();
  sub_242963AE8();
  swift_bridgeObjectRelease();
  sub_242963AE8();
  swift_retain();
  sub_242963764();
  swift_release();
  sub_242963AE8();
  swift_bridgeObjectRelease();
  sub_242963AE8();
  swift_retain();
  sub_242963764();
  swift_release();
  sub_242963AE8();
  swift_bridgeObjectRelease();
  sub_242963AE8();
  swift_retain();
  sub_242963764();
  swift_release();
  sub_242963AE8();
  swift_bridgeObjectRelease();
  sub_242963AE8();
  swift_retain();
  sub_242963764();
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257208290);
  sub_242963AA0();
  sub_242963AE8();
  swift_bridgeObjectRelease();
  return 0;
}

id NHOAccessoryIntent.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_242960360@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_257207788 != -1)
    swift_once();
  v2 = sub_242963824();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_257208200);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_2429603F8(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_24294E454;
  v3[3] = a1;
  return swift_task_switch();
}

uint64_t sub_242960458()
{
  sub_242960510(&qword_257208298, (uint64_t)&protocol conformance descriptor for NHOAccessoryIntent);
  return sub_242963734();
}

uint64_t sub_242960484()
{
  return sub_242960510(&qword_257208298, (uint64_t)&protocol conformance descriptor for NHOAccessoryIntent);
}

uint64_t type metadata accessor for NHOAccessoryIntent()
{
  return objc_opt_self();
}

uint64_t sub_2429604C8()
{
  return sub_242960510(&qword_2572082A0, (uint64_t)&protocol conformance descriptor for NHOAccessoryIntent);
}

uint64_t sub_2429604EC()
{
  return sub_242960510((unint64_t *)&unk_2572082A8, (uint64_t)&protocol conformance descriptor for NHOAccessoryIntent);
}

uint64_t sub_242960510(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for NHOAccessoryIntent();
    result = MEMORY[0x2494E92B4](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24296054C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_24296055C()
{
  sub_242960510(&qword_257208298, (uint64_t)&protocol conformance descriptor for NHOAccessoryIntent);
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2429605AC@<X0>(_QWORD *a1@<X8>)
{
  return sub_242957B84(a1);
}

uint64_t sub_2429605C8()
{
  return sub_2429493A0();
}

uint64_t sub_2429605E4@<X0>(_QWORD *a1@<X8>)
{
  return sub_242957B84(a1);
}

uint64_t sub_242960600()
{
  return sub_2429493A0();
}

uint64_t sub_24296061C@<X0>(_QWORD *a1@<X8>)
{
  return sub_242957B84(a1);
}

uint64_t sub_242960638()
{
  return sub_2429493A0();
}

uint64_t sub_242960654@<X0>(_QWORD *a1@<X8>)
{
  return sub_242957B84(a1);
}

uint64_t sub_242960670()
{
  return sub_2429493A0();
}

uint64_t sub_24296068C@<X0>(_QWORD *a1@<X8>)
{
  return sub_242957B84(a1);
}

uint64_t sub_2429606A8()
{
  return sub_2429493A0();
}

uint64_t sub_2429606C4@<X0>(_QWORD *a1@<X8>)
{
  return sub_242957B84(a1);
}

uint64_t sub_2429606E0()
{
  return sub_2429493A0();
}

uint64_t sub_242960704@<X0>(_QWORD *a1@<X8>)
{
  return sub_242957B84(a1);
}

uint64_t sub_242960720()
{
  return sub_2429493A0();
}

double sub_24296073C@<D0>(_OWORD *a1@<X8>)
{
  return sub_242949350(a1);
}

uint64_t sub_242960758()
{
  return sub_2429493A0();
}

double sub_242960774@<D0>(_OWORD *a1@<X8>)
{
  return sub_242949350(a1);
}

uint64_t sub_242960790()
{
  return sub_2429493A0();
}

id HMService.primaryControlCharacteristic.getter()
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  unint64_t v5;
  id v6;

  HMService.primaryControlCharacteristicType.getter();
  if (v1)
  {
    v2 = (void *)sub_242963A7C();
    swift_bridgeObjectRelease();
    v3 = objc_msgSend(v0, sel_hf_characteristicOfType_, v2);

  }
  else
  {
    v4 = objc_msgSend(v0, sel_characteristics);
    sub_24294899C(0, &qword_257207940);
    v5 = sub_242963B30();

    v6 = v0;
    v3 = sub_2429489D4(v5);
    swift_bridgeObjectRelease();

  }
  return v3;
}

uint64_t HMService.iconSymbol.getter()
{
  return sub_242960F9C(MEMORY[0x24BE4E9A0], (uint64_t (*)(uint64_t))MEMORY[0x24BE4D760]);
}

uint64_t HMService.isLightbulbService.getter()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  char *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  unsigned int (*v37)(uint64_t, uint64_t, uint64_t);
  uint64_t v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  char v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unsigned int (*v50)(uint64_t, uint64_t, uint64_t);
  uint64_t v51;
  char *v52;
  char v53;
  void (*v54)(char *, uint64_t);
  char *v56;
  void (*v57)(char *, uint64_t);
  uint64_t v58;
  char *v59;
  char *v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;

  v1 = v0;
  v2 = sub_242963974();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v59 = (char *)&v58 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572082E8);
  v5 = MEMORY[0x24BDAC7A8](v63);
  v62 = (uint64_t)&v58 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v58 - v7;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_257207948);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v58 = (uint64_t)&v58 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v60 = (char *)&v58 - v13;
  v14 = MEMORY[0x24BDAC7A8](v12);
  v61 = (char *)&v58 - v15;
  v16 = MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v58 - v17;
  v19 = MEMORY[0x24BDAC7A8](v16);
  v21 = (char *)&v58 - v20;
  MEMORY[0x24BDAC7A8](v19);
  v23 = (char *)&v58 - v22;
  v24 = objc_msgSend(v0, sel_serviceType);
  v25 = sub_242963A88();
  v27 = v26;

  if (v25 == sub_242963A88() && v27 == v28)
  {
    swift_bridgeObjectRelease_n();
LABEL_27:
    v45 = 1;
    return v45 & 1;
  }
  v29 = sub_242963DA0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v29 & 1) != 0)
    goto LABEL_27;
  v30 = objc_msgSend(v1, sel_serviceType);
  v31 = sub_242963A88();
  v33 = v32;

  if (v31 == sub_242963A88() && v33 == v34)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    v35 = sub_242963DA0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v35 & 1) == 0)
      goto LABEL_15;
  }
  sub_242963C50();
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v21, *MEMORY[0x24BE4D878], v2);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v3 + 56))(v21, 0, 1, v2);
  v36 = (uint64_t)&v8[*(int *)(v63 + 48)];
  sub_242962120((uint64_t)v23, (uint64_t)v8);
  sub_242962120((uint64_t)v21, v36);
  v37 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48);
  if (v37((uint64_t)v8, 1, v2) == 1)
  {
    sub_242945BA8((uint64_t)v21, &qword_257207948);
    sub_242945BA8((uint64_t)v23, &qword_257207948);
    if (v37(v36, 1, v2) == 1)
    {
      v38 = (uint64_t)v8;
LABEL_22:
      sub_242945BA8(v38, &qword_257207948);
      goto LABEL_27;
    }
    goto LABEL_14;
  }
  sub_242962120((uint64_t)v8, (uint64_t)v18);
  if (v37(v36, 1, v2) == 1)
  {
    sub_242945BA8((uint64_t)v21, &qword_257207948);
    sub_242945BA8((uint64_t)v23, &qword_257207948);
    (*(void (**)(char *, uint64_t))(v3 + 8))(v18, v2);
LABEL_14:
    sub_242945BA8((uint64_t)v8, &qword_2572082E8);
    goto LABEL_15;
  }
  v52 = v59;
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 32))(v59, v36, v2);
  sub_242962168();
  v53 = sub_242963A64();
  v54 = *(void (**)(char *, uint64_t))(v3 + 8);
  v54(v52, v2);
  sub_242945BA8((uint64_t)v21, &qword_257207948);
  sub_242945BA8((uint64_t)v23, &qword_257207948);
  v54(v18, v2);
  sub_242945BA8((uint64_t)v8, &qword_257207948);
  if ((v53 & 1) != 0)
    goto LABEL_27;
LABEL_15:
  v39 = objc_msgSend(v1, sel_serviceType);
  v40 = sub_242963A88();
  v42 = v41;

  if (v40 == sub_242963A88() && v42 == v43)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    v44 = sub_242963DA0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v45 = 0;
    if ((v44 & 1) == 0)
      return v45 & 1;
  }
  v46 = (uint64_t)v61;
  sub_242963C50();
  v47 = (uint64_t)v60;
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v60, *MEMORY[0x24BE4D878], v2);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v3 + 56))(v47, 0, 1, v2);
  v48 = v62;
  v49 = v62 + *(int *)(v63 + 48);
  sub_242962120(v46, v62);
  sub_242962120(v47, v49);
  v50 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48);
  if (v50(v48, 1, v2) == 1)
  {
    sub_242945BA8(v47, &qword_257207948);
    sub_242945BA8(v46, &qword_257207948);
    if (v50(v49, 1, v2) == 1)
    {
      v38 = v48;
      goto LABEL_22;
    }
  }
  else
  {
    v51 = v58;
    sub_242962120(v48, v58);
    if (v50(v49, 1, v2) != 1)
    {
      v56 = v59;
      (*(void (**)(char *, uint64_t, uint64_t))(v3 + 32))(v59, v49, v2);
      sub_242962168();
      v45 = sub_242963A64();
      v57 = *(void (**)(char *, uint64_t))(v3 + 8);
      v57(v56, v2);
      sub_242945BA8(v47, &qword_257207948);
      sub_242945BA8(v46, &qword_257207948);
      v57((char *)v51, v2);
      sub_242945BA8(v48, &qword_257207948);
      return v45 & 1;
    }
    sub_242945BA8(v47, &qword_257207948);
    sub_242945BA8(v46, &qword_257207948);
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v51, v2);
  }
  sub_242945BA8(v48, &qword_2572082E8);
  v45 = 0;
  return v45 & 1;
}

uint64_t HMService.iconSymbolActivated.getter()
{
  return sub_242960F9C(MEMORY[0x24BE4E990], MEMORY[0x24BE4D738]);
}

uint64_t sub_242960F9C(uint64_t (*a1)(void), uint64_t (*a2)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;

  v4 = sub_242963974();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572082E0);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_242963C44();
  if (v11)
  {
    sub_2429639A4();
    v12 = sub_2429639B0();
    v13 = *(_QWORD *)(v12 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v10, 1, v12) != 1)
    {
      v15 = a1();
      (*(void (**)(char *, uint64_t))(v13 + 8))(v10, v12);
      return v15;
    }
    sub_242945BA8((uint64_t)v10, &qword_2572082E0);
  }
  if ((HMService.isLightbulbService.getter() & 1) != 0)
    v14 = (*(uint64_t (**)(char *, _QWORD, uint64_t))(v5 + 104))(v7, *MEMORY[0x24BE4D878], v4);
  else
    v14 = sub_242963C2C();
  v15 = a2(v14);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v15;
}

uint64_t HMService.tint.getter()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  uint64_t v14;
  uint64_t v16;

  v1 = v0;
  v2 = sub_24296398C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_257207948);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_242963974();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = objc_msgSend(v1, sel_serviceType);
  sub_242963A88();

  sub_242963AAC();
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
    sub_242945BA8((uint64_t)v8, &qword_257207948);
    (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x24BE4E110], v2);
    v14 = sub_242963980();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v12, v8, v9);
    v14 = ServiceKind.iconColorBase.getter();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  }
  return v14;
}

uint64_t HMService.primaryControlCharacteristicType.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  int v4;
  uint64_t v6;

  v0 = sub_242963974();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_242963C2C();
  v4 = (*(uint64_t (**)(char *, uint64_t))(v1 + 88))(v3, v0);
  if (v4 == *MEMORY[0x24BE4D7B8]
    || v4 == *MEMORY[0x24BE4D6E0]
    || v4 == *MEMORY[0x24BE4D878]
    || v4 == *MEMORY[0x24BE4D650]
    || v4 == *MEMORY[0x24BE4D810]
    || v4 == *MEMORY[0x24BE4D828]
    || v4 == *MEMORY[0x24BE4D690]
    || v4 == *MEMORY[0x24BE4D6A0])
  {
    return sub_242963A88();
  }
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return 0;
}

uint64_t HMService.primaryStateCharacteristicType.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  int v4;
  uint64_t v6;

  v0 = sub_242963974();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_242963C2C();
  v4 = (*(uint64_t (**)(char *, uint64_t))(v1 + 88))(v3, v0);
  if (v4 == *MEMORY[0x24BE4D7C8]
    || v4 == *MEMORY[0x24BE4D7B8]
    || v4 == *MEMORY[0x24BE4D6E0]
    || v4 == *MEMORY[0x24BE4D878]
    || v4 == *MEMORY[0x24BE4D650]
    || v4 == *MEMORY[0x24BE4D810]
    || v4 == *MEMORY[0x24BE4D828]
    || v4 == *MEMORY[0x24BE4D690]
    || v4 == *MEMORY[0x24BE4D6A0])
  {
    return sub_242963A88();
  }
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return 0;
}

void *HMService.primaryStateCharacteristic.getter()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  unint64_t v6;
  void *v7;

  v1 = HMService.primaryStateCharacteristicType.getter();
  if (!v2)
    return 0;
  v3 = v1;
  v4 = v2;
  v5 = objc_msgSend(v0, sel_characteristics);
  sub_24294899C(0, &qword_257207940);
  v6 = sub_242963B30();

  swift_bridgeObjectRetain();
  v7 = sub_2429621B0(v6, v3, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
  return v7;
}

uint64_t HMService.isLockService.getter()
{
  return sub_2429616AC();
}

uint64_t HMService.isGarageDoor.getter()
{
  return sub_2429616AC();
}

uint64_t sub_2429616AC()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v7;

  v1 = objc_msgSend(v0, sel_serviceType);
  v2 = sub_242963A88();
  v4 = v3;

  if (v2 == sub_242963A88() && v4 == v5)
    v7 = 1;
  else
    v7 = sub_242963DA0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t HMService.isInServiceGroup.getter()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  id v7;
  void *v8;
  id v10;
  unint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  char v15;
  char v16;
  uint64_t v17;
  char v18;
  id v19;
  char v20;
  uint64_t v21;
  id v22;
  char v23;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;

  v1 = objc_msgSend(v0, sel_home);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = objc_msgSend(v1, sel_serviceGroups);

  sub_24294899C(0, &qword_257207F20);
  v4 = sub_242963B30();

  if (v4 >> 62)
    goto LABEL_45;
  v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v5)
  {
    while (1)
    {
      v6 = 0;
      v28 = v4 & 0xC000000000000001;
      v26 = v4 + 32;
      v27 = v4 & 0xFFFFFFFFFFFFFF8;
      v25 = v4;
      while (1)
      {
        if (v28)
        {
          v7 = (id)MEMORY[0x2494E8E28](v6, v4);
        }
        else
        {
          if (v6 >= *(_QWORD *)(v27 + 16))
            goto LABEL_44;
          v7 = *(id *)(v26 + 8 * v6);
        }
        v8 = v7;
        if (__OFADD__(v6++, 1))
          goto LABEL_42;
        v10 = objc_msgSend(v7, sel_services);
        sub_24294899C(0, &qword_257207930);
        v11 = sub_242963B30();

        if (v11 >> 62)
        {
          swift_bridgeObjectRetain_n();
          v12 = sub_242963D4C();
          swift_bridgeObjectRelease();
          if (!v12)
            goto LABEL_26;
        }
        else
        {
          v12 = *(_QWORD *)((v11 & 0xFFFFFFFFFFFFF8) + 0x10);
          swift_bridgeObjectRetain();
          if (!v12)
            goto LABEL_26;
        }
        if ((v11 & 0xC000000000000001) != 0)
          v13 = (id)MEMORY[0x2494E8E28](0, v11);
        else
          v13 = *(id *)(v11 + 32);
        v14 = v13;
        v15 = sub_242963C20();

        if ((v15 & 1) != 0)
        {
LABEL_38:

          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          v5 = 1;
          goto LABEL_39;
        }
        if (v12 != 1)
          break;
LABEL_26:

        swift_bridgeObjectRelease();
LABEL_27:
        swift_bridgeObjectRelease();
        if (v6 == v5)
        {
          v5 = 0;
          goto LABEL_39;
        }
      }
      if ((v11 & 0xC000000000000001) != 0)
        break;
      v19 = *(id *)(v11 + 40);
      v20 = sub_242963C20();

      if ((v20 & 1) != 0)
        goto LABEL_38;
      if (v12 == 2)
        goto LABEL_26;
      v21 = 6;
      while (1)
      {
        v4 = v21 - 3;
        if (__OFADD__(v21 - 4, 1))
          break;
        v22 = *(id *)(v11 + 8 * v21);
        v23 = sub_242963C20();

        if ((v23 & 1) != 0)
          goto LABEL_38;
        ++v21;
        if (v4 == v12)
        {
LABEL_33:

          swift_bridgeObjectRelease();
          v4 = v25;
          goto LABEL_27;
        }
      }
LABEL_43:
      __break(1u);
LABEL_44:
      __break(1u);
LABEL_45:
      swift_bridgeObjectRetain();
      v5 = sub_242963D4C();
      swift_bridgeObjectRelease();
      if (!v5)
        goto LABEL_39;
    }
    MEMORY[0x2494E8E28](1, v11);
    v16 = sub_242963C20();
    swift_unknownObjectRelease();
    if ((v16 & 1) != 0)
      goto LABEL_38;
    if (v12 != 2)
    {
      v17 = 2;
      while (1)
      {
        MEMORY[0x2494E8E28](v17, v11);
        v4 = v17 + 1;
        if (__OFADD__(v17, 1))
          break;
        v18 = sub_242963C20();
        swift_unknownObjectRelease();
        if ((v18 & 1) != 0)
          goto LABEL_38;
        ++v17;
        if (v4 == v12)
          goto LABEL_33;
      }
      __break(1u);
LABEL_42:
      __break(1u);
      goto LABEL_43;
    }
    goto LABEL_26;
  }
LABEL_39:
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_242961AE8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  void *v13;
  void *v14;
  id v15;
  void (*v16)(char *, char *, uint64_t);
  uint64_t v17;
  unint64_t v18;
  char v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v24;
  uint64_t v25;
  _OWORD v26[2];
  __int128 v27;
  __int128 v28;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572082F0);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_2429638CC();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v24 - v11;
  if (!a2)
  {
LABEL_9:
    v20 = (void *)sub_242963C38();
    if (v20)
    {
      v21 = v20;
      v22 = objc_msgSend(v20, sel_value);

      if (v22)
      {
        sub_242963C74();
        swift_unknownObjectRelease();
      }
      else
      {
        memset(v26, 0, sizeof(v26));
      }
      sub_242945B48((uint64_t)v26, (uint64_t)&v27);
    }
    else
    {
      v27 = 0u;
      v28 = 0u;
    }
    goto LABEL_17;
  }
  v13 = (void *)sub_242963C38();
  if (!v13)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v5, 1, 1, v6);
    goto LABEL_8;
  }
  v14 = v13;
  v25 = a2;
  v15 = objc_msgSend(v13, sel_uniqueIdentifier);

  sub_2429638C0();
  v16 = *(void (**)(char *, char *, uint64_t))(v7 + 32);
  v16(v5, v10, v6);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v5, 0, 1, v6);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
LABEL_8:
    sub_242945BA8((uint64_t)v5, &qword_2572082F0);
    goto LABEL_9;
  }
  v16(v12, v5, v6);
  v17 = v25;
  if (*(_QWORD *)(v25 + 16) && (v18 = sub_242944DF0((uint64_t)v12), (v19 & 1) != 0))
  {
    sub_2429461EC(*(_QWORD *)(v17 + 56) + 32 * v18, (uint64_t)&v27);
  }
  else
  {
    v27 = 0u;
    v28 = 0u;
  }
  (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
LABEL_17:
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572077B0);
  if ((swift_dynamicCast() & 1) == 0)
    *(_QWORD *)&v26[0] = 0;
  return *(_QWORD *)&v26[0];
}

uint64_t _sSo9HMServiceC15NanoHomeIntentsE9BOOLValue3for4withSbSg0C9DataModel18CharacteristicKindO_SDy10Foundation4UUIDVypGSgtF_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  void *v13;
  void *v14;
  id v15;
  void (*v16)(char *, char *, uint64_t);
  unint64_t v17;
  char v18;
  void *v19;
  void *v20;
  id v21;
  _OWORD v23[2];
  __int128 v24;
  __int128 v25;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572082F0);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_2429638CC();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)v23 - v11;
  if (!a2)
  {
LABEL_9:
    v19 = (void *)sub_242963C38();
    if (v19)
    {
      v20 = v19;
      v21 = objc_msgSend(v19, sel_value);

      if (v21)
      {
        sub_242963C74();
        swift_unknownObjectRelease();
      }
      else
      {
        memset(v23, 0, sizeof(v23));
      }
      sub_242945B48((uint64_t)v23, (uint64_t)&v24);
    }
    else
    {
      v24 = 0u;
      v25 = 0u;
    }
    goto LABEL_17;
  }
  v13 = (void *)sub_242963C38();
  if (!v13)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v5, 1, 1, v6);
    goto LABEL_8;
  }
  v14 = v13;
  v15 = objc_msgSend(v13, sel_uniqueIdentifier);

  sub_2429638C0();
  v16 = *(void (**)(char *, char *, uint64_t))(v7 + 32);
  v16(v5, v10, v6);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v5, 0, 1, v6);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
LABEL_8:
    sub_242945BA8((uint64_t)v5, &qword_2572082F0);
    goto LABEL_9;
  }
  v16(v12, v5, v6);
  if (*(_QWORD *)(a2 + 16) && (v17 = sub_242944DF0((uint64_t)v12), (v18 & 1) != 0))
  {
    sub_2429461EC(*(_QWORD *)(a2 + 56) + 32 * v17, (uint64_t)&v24);
  }
  else
  {
    v24 = 0u;
    v25 = 0u;
  }
  (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
LABEL_17:
  __swift_instantiateConcreteTypeFromMangledName(&qword_2572077B0);
  if ((swift_dynamicCast() & 1) == 0)
    LOBYTE(v23[0]) = 2;
  return LOBYTE(v23[0]);
}

uint64_t HMService.intValue(for:with:)(uint64_t a1, uint64_t a2)
{
  return sub_242961AE8(a1, a2);
}

uint64_t HMService.doubleValue(for:with:)(uint64_t a1, uint64_t a2)
{
  return sub_242961AE8(a1, a2);
}

Swift::Bool_optional __swiftcall HMService.powerState(with:)(Swift::OpaquePointer_optional with)
{
  void *rawValue;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void (*v6)(char *, _QWORD, uint64_t);
  Swift::Bool_optional v7;
  void (*v8)(char *, uint64_t);
  uint64_t v10;

  rawValue = with.value._rawValue;
  v2 = sub_242963998();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(void (**)(char *, _QWORD, uint64_t))(v3 + 104);
  v6(v5, *MEMORY[0x24BE4E238], v2);
  v7.value = _sSo9HMServiceC15NanoHomeIntentsE9BOOLValue3for4withSbSg0C9DataModel18CharacteristicKindO_SDy10Foundation4UUIDVypGSgtF_0((uint64_t)v5, (uint64_t)rawValue);
  v8 = *(void (**)(char *, uint64_t))(v3 + 8);
  v8(v5, v2);
  if (v7.value == 2)
  {
    v6(v5, *MEMORY[0x24BE4E368], v2);
    v7.value = _sSo9HMServiceC15NanoHomeIntentsE9BOOLValue3for4withSbSg0C9DataModel18CharacteristicKindO_SDy10Foundation4UUIDVypGSgtF_0((uint64_t)v5, (uint64_t)rawValue);
    v8(v5, v2);
  }
  return v7;
}

uint64_t sub_242962120(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257207948);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_242962168()
{
  unint64_t result;
  uint64_t v1;

  result = qword_257207F50;
  if (!qword_257207F50)
  {
    v1 = sub_242963974();
    result = MEMORY[0x2494E92B4](MEMORY[0x24BE4D8B0], v1);
    atomic_store(result, (unint64_t *)&qword_257207F50);
  }
  return result;
}

void *sub_2429621B0(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
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
    v8 = sub_242963D4C();
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
      v4 = 4;
      do
      {
        v9 = v4 - 4;
        if (v24)
        {
          v10 = (id)MEMORY[0x2494E8E28](v4 - 4, v7);
          v11 = v4 - 3;
          if (__OFADD__(v9, 1))
            goto LABEL_19;
        }
        else
        {
          v10 = *(id *)(v7 + 8 * v4);
          v11 = v4 - 3;
          if (__OFADD__(v9, 1))
          {
LABEL_19:
            __break(1u);
            goto LABEL_20;
          }
        }
        v12 = v8;
        v13 = v10;
        v14 = a3;
        v15 = objc_msgSend(v10, sel_characteristicType, v22);
        v16 = sub_242963A88();
        v18 = v17;

        a3 = v14;
        v19 = v16 == a2 && v18 == v14;
        if (v19)
        {
          swift_bridgeObjectRelease();
LABEL_18:
          swift_bridgeObjectRelease();
          return v13;
        }
        v20 = sub_242963DA0();
        swift_bridgeObjectRelease();
        if ((v20 & 1) != 0)
          goto LABEL_18;

        ++v4;
        v8 = v12;
        v19 = v11 == v12;
        v7 = v23;
      }
      while (!v19);
    }
  }
  swift_bridgeObjectRelease();
  return 0;
}

unint64_t static NanoHomeAnalytics.WidgetTapped.getter()
{
  return 0xD000000000000020;
}

unint64_t static NanoHomeAnalytics.SuggestedControlsActionProvider.getter()
{
  return 0xD00000000000003ALL;
}

uint64_t static NanoHomeAnalytics.WidgetActionTypeKey.getter()
{
  return 0x79546E6F69746361;
}

NanoHomeIntents::NanoHomeAnalytics::WidgetActionType_optional __swiftcall NanoHomeAnalytics.WidgetActionType.init(rawValue:)(Swift::Int rawValue)
{
  char *v1;
  char v2;

  v2 = 6;
  if ((unint64_t)rawValue < 6)
    v2 = rawValue;
  *v1 = v2;
  return (NanoHomeIntents::NanoHomeAnalytics::WidgetActionType_optional)rawValue;
}

NanoHomeIntents::NanoHomeAnalytics::WidgetActionType_optional sub_2429623C4(Swift::Int *a1)
{
  return NanoHomeAnalytics.WidgetActionType.init(rawValue:)(*a1);
}

uint64_t static NanoHomeAnalytics.WidgetSourceKey.getter()
{
  return 0x656372756F73;
}

NanoHomeIntents::NanoHomeAnalytics::WidgetSource_optional __swiftcall NanoHomeAnalytics.WidgetSource.init(rawValue:)(Swift::Int rawValue)
{
  char *v1;
  char v2;

  if (rawValue == 1)
    v2 = 1;
  else
    v2 = 2;
  if (!rawValue)
    v2 = 0;
  *v1 = v2;
  return (NanoHomeIntents::NanoHomeAnalytics::WidgetSource_optional)rawValue;
}

uint64_t NanoHomeAnalytics.WidgetSource.rawValue.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

BOOL sub_242962404(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

_QWORD *sub_24296241C@<X0>(_QWORD *result@<X0>, char *a2@<X8>)
{
  char v2;
  char v3;

  if (*result == 1)
    v2 = 1;
  else
    v2 = 2;
  if (*result)
    v3 = v2;
  else
    v3 = 0;
  *a2 = v3;
  return result;
}

void sub_24296243C(_QWORD *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = *v1;
}

uint64_t static NanoHomeAnalytics.WidgetKindKey.getter()
{
  return 0x694B746567646977;
}

NanoHomeIntents::NanoHomeAnalytics::WidgetKind_optional __swiftcall NanoHomeAnalytics.WidgetKind.init(rawValue:)(Swift::Int rawValue)
{
  char *v1;
  char v2;

  v2 = 3;
  if ((unint64_t)rawValue < 3)
    v2 = rawValue;
  *v1 = v2;
  return (NanoHomeIntents::NanoHomeAnalytics::WidgetKind_optional)rawValue;
}

uint64_t NanoHomeAnalytics.WidgetKind.rawValue.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

NanoHomeIntents::NanoHomeAnalytics::WidgetKind_optional sub_242962480(Swift::Int *a1)
{
  return NanoHomeAnalytics.WidgetKind.init(rawValue:)(*a1);
}

uint64_t static NanoHomeAnalytics.WidgetActionProviderKey.getter()
{
  return 0x72506E6F69746361;
}

NanoHomeIntents::NanoHomeAnalytics::WidgetActionProvider_optional __swiftcall NanoHomeAnalytics.WidgetActionProvider.init(rawValue:)(Swift::Int rawValue)
{
  char *v1;
  char v2;

  v2 = 11;
  if ((unint64_t)rawValue < 0xB)
    v2 = rawValue;
  *v1 = v2;
  return (NanoHomeIntents::NanoHomeAnalytics::WidgetActionProvider_optional)rawValue;
}

unint64_t sub_2429624C4()
{
  unint64_t result;

  result = qword_2572082F8;
  if (!qword_2572082F8)
  {
    result = MEMORY[0x2494E92B4](&protocol conformance descriptor for NanoHomeAnalytics.WidgetActionType, &type metadata for NanoHomeAnalytics.WidgetActionType);
    atomic_store(result, (unint64_t *)&qword_2572082F8);
  }
  return result;
}

unint64_t sub_24296250C()
{
  unint64_t result;

  result = qword_257208300;
  if (!qword_257208300)
  {
    result = MEMORY[0x2494E92B4](&protocol conformance descriptor for NanoHomeAnalytics.WidgetSource, &type metadata for NanoHomeAnalytics.WidgetSource);
    atomic_store(result, (unint64_t *)&qword_257208300);
  }
  return result;
}

unint64_t sub_242962554()
{
  unint64_t result;

  result = qword_257208308;
  if (!qword_257208308)
  {
    result = MEMORY[0x2494E92B4](&protocol conformance descriptor for NanoHomeAnalytics.WidgetKind, &type metadata for NanoHomeAnalytics.WidgetKind);
    atomic_store(result, (unint64_t *)&qword_257208308);
  }
  return result;
}

unint64_t sub_24296259C()
{
  unint64_t result;

  result = qword_257208310;
  if (!qword_257208310)
  {
    result = MEMORY[0x2494E92B4](&protocol conformance descriptor for NanoHomeAnalytics.WidgetActionProvider, &type metadata for NanoHomeAnalytics.WidgetActionProvider);
    atomic_store(result, (unint64_t *)&qword_257208310);
  }
  return result;
}

NanoHomeIntents::NanoHomeAnalytics::WidgetActionProvider_optional sub_2429625E0(Swift::Int *a1)
{
  return NanoHomeAnalytics.WidgetActionProvider.init(rawValue:)(*a1);
}

ValueMetadata *type metadata accessor for NanoHomeAnalytics()
{
  return &type metadata for NanoHomeAnalytics;
}

uint64_t getEnumTagSinglePayload for NanoHomeAnalytics.WidgetActionType(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFB)
    goto LABEL_17;
  if (a2 + 5 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 5) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 5;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 5;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 5;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 6;
  v8 = v6 - 6;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for NanoHomeAnalytics.WidgetActionType(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 5 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 5) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFB)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFA)
    return ((uint64_t (*)(void))((char *)&loc_2429626D4 + 4 * byte_242965705[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_242962708 + 4 * byte_242965700[v4]))();
}

uint64_t sub_242962708(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_242962710(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x242962718);
  return result;
}

uint64_t sub_242962724(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24296272CLL);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_242962730(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_242962738(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for NanoHomeAnalytics.WidgetActionType()
{
  return &type metadata for NanoHomeAnalytics.WidgetActionType;
}

uint64_t getEnumTagSinglePayload for NanoHomeAnalytics.WidgetSource(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for NanoHomeAnalytics.WidgetSource(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_242962830 + 4 * byte_24296570F[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_242962864 + 4 * byte_24296570A[v4]))();
}

uint64_t sub_242962864(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24296286C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x242962874);
  return result;
}

uint64_t sub_242962880(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x242962888);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_24296288C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_242962894(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_2429628A0(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for NanoHomeAnalytics.WidgetSource()
{
  return &type metadata for NanoHomeAnalytics.WidgetSource;
}

uint64_t getEnumTagSinglePayload for NanoHomeAnalytics.WidgetKind(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFE)
    goto LABEL_17;
  if (a2 + 2 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 2) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 2;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 2;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 2;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 3;
  v8 = v6 - 3;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for NanoHomeAnalytics.WidgetKind(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 2 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 2) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFE)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFD)
    return ((uint64_t (*)(void))((char *)&loc_242962998 + 4 * byte_242965719[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_2429629CC + 4 * byte_242965714[v4]))();
}

uint64_t sub_2429629CC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2429629D4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2429629DCLL);
  return result;
}

uint64_t sub_2429629E8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2429629F0);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_2429629F4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2429629FC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for NanoHomeAnalytics.WidgetKind()
{
  return &type metadata for NanoHomeAnalytics.WidgetKind;
}

uint64_t getEnumTagSinglePayload for NanoHomeAnalytics.WidgetActionProvider(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF6)
    goto LABEL_17;
  if (a2 + 10 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 10) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 10;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 10;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 10;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0xB;
  v8 = v6 - 11;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for NanoHomeAnalytics.WidgetActionProvider(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 10 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 10) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF6)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF5)
    return ((uint64_t (*)(void))((char *)&loc_242962AF4 + 4 * byte_242965723[v4]))();
  *a1 = a2 + 10;
  return ((uint64_t (*)(void))((char *)sub_242962B28 + 4 * byte_24296571E[v4]))();
}

uint64_t sub_242962B28(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_242962B30(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x242962B38);
  return result;
}

uint64_t sub_242962B44(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x242962B4CLL);
  *(_BYTE *)result = a2 + 10;
  return result;
}

uint64_t sub_242962B50(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_242962B58(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for NanoHomeAnalytics.WidgetActionProvider()
{
  return &type metadata for NanoHomeAnalytics.WidgetActionProvider;
}

id ElectricityRatesIntent.__allocating_init(homeIdentifier:homeName:)()
{
  objc_class *v0;
  id v1;

  v1 = objc_msgSend(objc_allocWithZone(v0), sel_init);
  swift_retain();
  sub_242963770();
  swift_release();
  swift_retain();
  sub_242963770();

  swift_release();
  return v1;
}

uint64_t sub_242962C44()
{
  uint64_t v0;

  v0 = sub_242963824();
  __swift_allocate_value_buffer(v0, qword_257208318);
  __swift_project_value_buffer(v0, (uint64_t)qword_257208318);
  return sub_242963818();
}

uint64_t static ElectricityRatesIntent.title.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_242948F3C(&qword_257207798, (uint64_t (*)(_QWORD))MEMORY[0x24BDCD380], (uint64_t)qword_257208318, a1);
}

uint64_t static ElectricityRatesIntent.title.setter(uint64_t a1)
{
  return sub_242948FEC(a1, &qword_257207798, (uint64_t (*)(_QWORD))MEMORY[0x24BDCD380], (uint64_t)qword_257208318);
}

uint64_t (*static ElectricityRatesIntent.title.modify())()
{
  uint64_t v0;

  if (qword_257207798 != -1)
    swift_once();
  v0 = sub_242963824();
  __swift_project_value_buffer(v0, (uint64_t)qword_257208318);
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_242962D64()
{
  uint64_t v0;

  v0 = sub_2429637B8();
  __swift_allocate_value_buffer(v0, qword_257208330);
  __swift_project_value_buffer(v0, (uint64_t)qword_257208330);
  return sub_2429637AC();
}

uint64_t static ElectricityRatesIntent.description.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_242948F3C(&qword_2572077A0, (uint64_t (*)(_QWORD))MEMORY[0x24BDB5800], (uint64_t)qword_257208330, a1);
}

uint64_t static ElectricityRatesIntent.description.setter(uint64_t a1)
{
  return sub_242948FEC(a1, &qword_2572077A0, (uint64_t (*)(_QWORD))MEMORY[0x24BDB5800], (uint64_t)qword_257208330);
}

uint64_t (*static ElectricityRatesIntent.description.modify())()
{
  uint64_t v0;

  if (qword_2572077A0 != -1)
    swift_once();
  v0 = sub_2429637B8();
  __swift_project_value_buffer(v0, (uint64_t)qword_257208330);
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t ElectricityRatesIntent.homeID.getter()
{
  return sub_242949240();
}

uint64_t ElectricityRatesIntent.homeID.setter()
{
  return sub_24294930C();
}

uint64_t (*ElectricityRatesIntent.homeID.modify(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = *(_QWORD *)(v1 + OBJC_IVAR___NHOElectricityRatesIntent__homeID);
  swift_retain();
  v3[5] = sub_242963758();
  return sub_2429491A0;
}

uint64_t ElectricityRatesIntent.$homeID.getter()
{
  return sub_242949494();
}

uint64_t ElectricityRatesIntent.homeName.getter()
{
  return sub_242949240();
}

uint64_t ElectricityRatesIntent.homeName.setter()
{
  return sub_24294930C();
}

uint64_t (*ElectricityRatesIntent.homeName.modify(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[4] = *(_QWORD *)(v1 + OBJC_IVAR___NHOElectricityRatesIntent__homeName);
  swift_retain();
  v3[5] = sub_242963758();
  return sub_2429491A0;
}

uint64_t ElectricityRatesIntent.$homeName.getter()
{
  return sub_242949494();
}

id ElectricityRatesIntent.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id ElectricityRatesIntent.init()()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
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
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  _QWORD v22[2];
  void (*v23)(char *, uint64_t, uint64_t);
  void (*v24)(char *, uint64_t, uint64_t, uint64_t);
  void (*v25)(char *, uint64_t, uint64_t, uint64_t);
  void (*v26)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  char *v32;
  uint64_t v33;
  objc_class *ObjectType;
  objc_super v35;
  uint64_t v36;
  uint64_t v37;

  ObjectType = (objc_class *)swift_getObjectType();
  v33 = sub_2429637DC();
  v1 = *(_QWORD *)(v33 - 8);
  MEMORY[0x24BDAC7A8](v33);
  v32 = (char *)v22 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_257207990);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_257207998);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572079A0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_242963824();
  v13 = *(_QWORD *)(v12 - 8);
  v27 = v12;
  MEMORY[0x24BDAC7A8](v12);
  v30 = OBJC_IVAR___NHOElectricityRatesIntent__homeID;
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572079A8);
  v31 = v0;
  sub_242963818();
  v26 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56);
  v26(v11, 1, 1, v12);
  v14 = sub_242963A70();
  v36 = 0;
  v37 = 0;
  v25 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56);
  v25(v8, 1, 1, v14);
  v15 = sub_242963740();
  v24 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56);
  v24(v5, 1, 1, v15);
  v16 = *MEMORY[0x24BDB6090];
  v23 = *(void (**)(char *, uint64_t, uint64_t))(v1 + 104);
  v17 = v32;
  v18 = v33;
  v23(v32, v16, v33);
  v22[1] = v11;
  *(_QWORD *)(v29 + v30) = sub_242963794();
  v30 = OBJC_IVAR___NHOElectricityRatesIntent__homeName;
  sub_242963818();
  v26(v11, 1, 1, v27);
  v36 = 0;
  v37 = 0;
  v25(v8, 1, 1, v14);
  v24(v5, 1, 1, v15);
  v23(v17, v16, v18);
  v19 = sub_242963794();
  v20 = v31;
  *(_QWORD *)&v31[v30] = v19;

  v35.receiver = v20;
  v35.super_class = ObjectType;
  return objc_msgSendSuper2(&v35, sel_init);
}

id ElectricityRatesIntent.__allocating_init(homeIdentifier:)()
{
  objc_class *v0;
  id v1;

  v1 = objc_msgSend(objc_allocWithZone(v0), sel_init);
  swift_retain();
  sub_242963770();

  swift_release();
  return v1;
}

id ElectricityRatesIntent.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_2429633E8()
{
  return sub_2429636A4(&qword_257208358, (uint64_t)&protocol conformance descriptor for ElectricityRatesIntent);
}

uint64_t type metadata accessor for ElectricityRatesIntent()
{
  return objc_opt_self();
}

uint64_t sub_24296342C()
{
  return sub_2429636A4(&qword_257208360, (uint64_t)&protocol conformance descriptor for ElectricityRatesIntent);
}

uint64_t sub_242963450()
{
  return sub_2429636A4((unint64_t *)&unk_257208368, (uint64_t)&protocol conformance descriptor for ElectricityRatesIntent);
}

uint64_t sub_242963474()
{
  sub_2429636A4(&qword_257208358, (uint64_t)&protocol conformance descriptor for ElectricityRatesIntent);
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2429634FC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_257207798 != -1)
    swift_once();
  v2 = sub_242963824();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_257208318);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_242963594()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  sub_2429636A4((unint64_t *)&unk_2572083A0, (uint64_t)&protocol conformance descriptor for ElectricityRatesIntent);
  *v1 = v0;
  v1[1] = sub_242949C6C;
  return sub_24296380C();
}

uint64_t sub_242963608()
{
  sub_2429636A4(&qword_257208358, (uint64_t)&protocol conformance descriptor for ElectricityRatesIntent);
  return sub_242963734();
}

double sub_242963634@<D0>(_OWORD *a1@<X8>)
{
  return sub_242949350(a1);
}

uint64_t sub_242963650()
{
  return sub_2429493A0();
}

double sub_24296366C@<D0>(_OWORD *a1@<X8>)
{
  return sub_242949350(a1);
}

uint64_t sub_242963688()
{
  return sub_2429493A0();
}

uint64_t sub_2429636A4(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for ElectricityRatesIntent();
    result = MEMORY[0x2494E92B4](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2429636E0()
{
  return MEMORY[0x24BDB4B38]();
}

uint64_t sub_2429636EC()
{
  return MEMORY[0x24BDB4D88]();
}

uint64_t sub_2429636F8()
{
  return MEMORY[0x24BDB4DD8]();
}

uint64_t sub_242963704()
{
  return MEMORY[0x24BDB4DF8]();
}

uint64_t sub_242963710()
{
  return MEMORY[0x24BDB4E08]();
}

uint64_t sub_24296371C()
{
  return MEMORY[0x24BDB4E10]();
}

uint64_t sub_242963728()
{
  return MEMORY[0x24BDB4E60]();
}

uint64_t sub_242963734()
{
  return MEMORY[0x24BDB4E68]();
}

uint64_t sub_242963740()
{
  return MEMORY[0x24BDB5028]();
}

uint64_t sub_24296374C()
{
  return MEMORY[0x24BDB51C0]();
}

uint64_t sub_242963758()
{
  return MEMORY[0x24BDB5458]();
}

uint64_t sub_242963764()
{
  return MEMORY[0x24BDB5460]();
}

uint64_t sub_242963770()
{
  return MEMORY[0x24BDB5468]();
}

uint64_t sub_24296377C()
{
  return MEMORY[0x24BDB5470]();
}

uint64_t sub_242963788()
{
  return MEMORY[0x24BDB5508]();
}

uint64_t sub_242963794()
{
  return MEMORY[0x24BDB5580]();
}

uint64_t sub_2429637A0()
{
  return MEMORY[0x24BDB5588]();
}

uint64_t sub_2429637AC()
{
  return MEMORY[0x24BDB57F8]();
}

uint64_t sub_2429637B8()
{
  return MEMORY[0x24BDB5800]();
}

uint64_t sub_2429637C4()
{
  return MEMORY[0x24BDB5D40]();
}

uint64_t sub_2429637D0()
{
  return MEMORY[0x24BDB5DF0]();
}

uint64_t sub_2429637DC()
{
  return MEMORY[0x24BDB6098]();
}

uint64_t sub_2429637E8()
{
  return MEMORY[0x24BDB6150]();
}

uint64_t sub_2429637F4()
{
  return MEMORY[0x24BDB6168]();
}

uint64_t sub_242963800()
{
  return MEMORY[0x24BDB61F0]();
}

uint64_t sub_24296380C()
{
  return MEMORY[0x24BDB6208]();
}

uint64_t sub_242963818()
{
  return MEMORY[0x24BDCD320]();
}

uint64_t sub_242963824()
{
  return MEMORY[0x24BDCD380]();
}

uint64_t sub_242963830()
{
  return MEMORY[0x24BDCE2F0]();
}

uint64_t sub_24296383C()
{
  return MEMORY[0x24BDCE330]();
}

uint64_t sub_242963848()
{
  return MEMORY[0x24BDCE350]();
}

uint64_t sub_242963854()
{
  return MEMORY[0x24BDCE378]();
}

uint64_t sub_242963860()
{
  return MEMORY[0x24BDCE3A0]();
}

uint64_t sub_24296386C()
{
  return MEMORY[0x24BDCE3B8]();
}

uint64_t sub_242963878()
{
  return MEMORY[0x24BDCE3E8]();
}

uint64_t sub_242963884()
{
  return MEMORY[0x24BDCE448]();
}

uint64_t sub_242963890()
{
  return MEMORY[0x24BDCE878]();
}

uint64_t sub_24296389C()
{
  return MEMORY[0x24BDCE880]();
}

uint64_t sub_2429638A8()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_2429638B4()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_2429638C0()
{
  return MEMORY[0x24BDCE9F8]();
}

uint64_t sub_2429638CC()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_2429638D8()
{
  return MEMORY[0x24BDCEC90]();
}

uint64_t sub_2429638E4()
{
  return MEMORY[0x24BDCECE0]();
}

uint64_t sub_2429638F0()
{
  return MEMORY[0x24BDCECF8]();
}

uint64_t sub_2429638FC()
{
  return MEMORY[0x24BDCED08]();
}

uint64_t sub_242963908()
{
  return MEMORY[0x24BDCED50]();
}

uint64_t sub_242963914()
{
  return MEMORY[0x24BDCED58]();
}

uint64_t sub_242963920()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_24296392C()
{
  return MEMORY[0x24BDCF4C8]();
}

uint64_t sub_242963938()
{
  return MEMORY[0x24BDCF510]();
}

uint64_t sub_242963944()
{
  return MEMORY[0x24BE30BE0]();
}

uint64_t sub_242963950()
{
  return MEMORY[0x24BE4D6F8]();
}

uint64_t sub_24296395C()
{
  return MEMORY[0x24BE4D760]();
}

uint64_t sub_242963968()
{
  return MEMORY[0x24BE4D870]();
}

uint64_t sub_242963974()
{
  return MEMORY[0x24BE4D888]();
}

uint64_t sub_242963980()
{
  return MEMORY[0x24BE4E0E0]();
}

uint64_t sub_24296398C()
{
  return MEMORY[0x24BE4E130]();
}

uint64_t sub_242963998()
{
  return MEMORY[0x24BE4E370]();
}

uint64_t sub_2429639A4()
{
  return MEMORY[0x24BE4E9C8]();
}

uint64_t sub_2429639B0()
{
  return MEMORY[0x24BE4E9D8]();
}

uint64_t sub_2429639BC()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_2429639C8()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_2429639D4()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_2429639E0()
{
  return MEMORY[0x24BDF3C40]();
}

uint64_t sub_2429639EC()
{
  return MEMORY[0x24BDF3D30]();
}

uint64_t _sSo11HMActionSetC15NanoHomeIntentsE15backupTintColor7SwiftUI0H0Vvg_0()
{
  return MEMORY[0x24BDF3D50]();
}

uint64_t sub_242963A04()
{
  return MEMORY[0x24BDF3E70]();
}

uint64_t sub_242963A10()
{
  return MEMORY[0x24BDF3EB0]();
}

uint64_t sub_242963A1C()
{
  return MEMORY[0x24BE2EA80]();
}

uint64_t sub_242963A28()
{
  return MEMORY[0x24BE2EA90]();
}

uint64_t sub_242963A34()
{
  return MEMORY[0x24BE2EAF0]();
}

uint64_t sub_242963A40()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_242963A4C()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_242963A58()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_242963A64()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_242963A70()
{
  return MEMORY[0x24BDB6620]();
}

uint64_t sub_242963A7C()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_242963A88()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_242963A94()
{
  return MEMORY[0x24BDCFA78]();
}

uint64_t sub_242963AA0()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_242963AAC()
{
  return MEMORY[0x24BE4EB48]();
}

uint64_t sub_242963AB8()
{
  return MEMORY[0x24BEE0A50]();
}

uint64_t sub_242963AC4()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_242963AD0()
{
  return MEMORY[0x24BEE0B68]();
}

uint64_t sub_242963ADC()
{
  return MEMORY[0x24BEE0B88]();
}

uint64_t sub_242963AE8()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_242963AF4()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_242963B00()
{
  return MEMORY[0x24BEE0CC8]();
}

uint64_t sub_242963B0C()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_242963B18()
{
  return MEMORY[0x24BEE0FD8]();
}

uint64_t sub_242963B24()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_242963B30()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_242963B3C()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_242963B48()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_242963B54()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_242963B60()
{
  return MEMORY[0x24BDB6650]();
}

uint64_t sub_242963B6C()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_242963B78()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t sub_242963B84()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_242963B90()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_242963B9C()
{
  return MEMORY[0x24BDCFCE8]();
}

uint64_t sub_242963BA8()
{
  return MEMORY[0x24BEE1678]();
}

uint64_t sub_242963BB4()
{
  return MEMORY[0x24BDBD758]();
}

uint64_t sub_242963BC0()
{
  return MEMORY[0x24BE4EBB8]();
}

uint64_t sub_242963BCC()
{
  return MEMORY[0x24BE4EBD8]();
}

uint64_t sub_242963BD8()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_242963BE4()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_242963BF0()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_242963BFC()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_242963C08()
{
  return MEMORY[0x24BE4EC08]();
}

uint64_t sub_242963C14()
{
  return MEMORY[0x24BDF5540]();
}

uint64_t sub_242963C20()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_242963C2C()
{
  return MEMORY[0x24BE4EC10]();
}

uint64_t sub_242963C38()
{
  return MEMORY[0x24BE4EC20]();
}

uint64_t sub_242963C44()
{
  return MEMORY[0x24BE4EC30]();
}

uint64_t sub_242963C50()
{
  return MEMORY[0x24BE4EC38]();
}

uint64_t sub_242963C5C()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_242963C68()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_242963C74()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_242963C80()
{
  return MEMORY[0x24BEE2300]();
}

uint64_t sub_242963C8C()
{
  return MEMORY[0x24BEE2330]();
}

uint64_t sub_242963C98()
{
  return MEMORY[0x24BEE2358]();
}

uint64_t sub_242963CA4()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_242963CB0()
{
  return MEMORY[0x24BEE23A8]();
}

uint64_t sub_242963CBC()
{
  return MEMORY[0x24BEE23E8]();
}

uint64_t sub_242963CC8()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_242963CD4()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_242963CE0()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_242963CEC()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_242963CF8()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_242963D04()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_242963D10()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_242963D1C()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_242963D28()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_242963D34()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_242963D40()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_242963D4C()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_242963D58()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_242963D64()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_242963D70()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_242963D7C()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_242963D88()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_242963D94()
{
  return MEMORY[0x24BEE7040]();
}

uint64_t sub_242963DA0()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_242963DAC()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_242963DB8()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_242963DC4()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_242963DD0()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_242963DDC()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t HFForceRemoteAccessStateAvailable()
{
  return MEMORY[0x24BE4CE58]();
}

uint64_t HMStringFromHomeLocation()
{
  return MEMORY[0x24BDD6F28]();
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

uint64_t lroundf(float a1)
{
  return MEMORY[0x24BDAEB18](a1);
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
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

uint64_t swift_defaultActor_deallocate()
{
  return MEMORY[0x24BEE71E0]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x24BEE71E8]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x24BEE71F0]();
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

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
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

