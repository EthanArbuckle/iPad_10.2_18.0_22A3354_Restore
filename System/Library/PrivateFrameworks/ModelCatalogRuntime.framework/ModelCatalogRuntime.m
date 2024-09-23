uint64_t sub_24218C524()
{
  return swift_initClassMetadata2();
}

uint64_t sub_24218C558(uint64_t a1, void *a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t AssociatedConformanceWitness;
  uint64_t AssociatedTypeWitness;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  os_log_type_t v19;
  uint8_t *v20;
  void (*v21)(NSObject *, uint64_t);
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  char *v33;
  uint64_t v34;
  uint8_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  NSObject *v40;
  os_log_type_t v41;
  uint8_t *v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  NSObject *v49;
  os_log_type_t v50;
  uint8_t *v51;
  uint64_t v52;
  uint64_t result;
  _QWORD v54[3];
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint8_t *v58;
  uint64_t v59;
  void (*v60)(NSObject *, uint64_t);
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  __int128 v70;
  __int128 v71;
  _BYTE v72[40];

  v66 = a2;
  v4 = *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v2) + 0x50);
  v3 = *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v2) + 0x58);
  sub_24218D684();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  sub_2421AFBE0();
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v55 = (char *)v54 - v7;
  v8 = swift_checkMetadataState();
  v64 = *(_QWORD *)(v8 - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  sub_24218D690();
  sub_24218D648();
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v65 = (char *)v54 - v9;
  v67 = sub_2421AF940();
  v10 = *(_QWORD *)(v67 - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  sub_24218D690();
  sub_24218D648();
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  sub_24218D648();
  v11 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v62 = (uint64_t)v54 - v12;
  v13 = MEMORY[0x24BDAC7A8](v11);
  v15 = ((char *)v54 - v14);
  MEMORY[0x24BDAC7A8](v13);
  v17 = ((char *)v54 - v16);
  v59 = v3;
  v56 = v4;
  sub_24218D684();
  v58 = (uint8_t *)AssociatedConformanceWitness;
  v63 = v8;
  v54[1] = swift_getAssociatedConformanceWitness();
  v61 = AssociatedTypeWitness;
  v18 = swift_getAssociatedConformanceWitness();
  sub_24218D660();
  sub_2421AF928();
  v19 = sub_24218D658();
  if (sub_24218D638(v19))
  {
    v20 = (uint8_t *)sub_24218D61C();
    *(_WORD *)v20 = 0;
    _os_log_impl(&dword_24218A000, v17, (os_log_type_t)v8, "BidirectionalDelegate: Got connection request.", v20, 2u);
    sub_24218D600();
  }

  v21 = *(void (**)(NSObject *, uint64_t))(v10 + 8);
  v22 = v67;
  v21(v17, v67);
  v23 = sub_2421AF5D4();
  v25 = v24;
  v26 = sub_2421AF5F8();
  sub_24218D660();
  v27 = v66;
  LOBYTE(v23) = sub_24219BD4C(v23, v25, v26);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v60 = v21;
  v21(v15, v22);
  if ((v23 & 1) == 0)
    return 0;
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  v28 = (void *)sub_2421AF5EC();
  sub_24218D66C(v27, sel_setRemoteObjectInterface_);

  v59 = v18;
  v29 = (void *)sub_2421AF5EC();
  sub_24218D66C(v27, sel_setExportedInterface_);

  v30 = (void *)sub_2421AFA6C();
  v31 = objc_msgSend(v27, sel_valueForEntitlement_, v30);

  v32 = v27;
  if (v31)
  {
    sub_2421AFC10();
    swift_unknownObjectRelease();
  }
  else
  {
    v70 = 0u;
    v71 = 0u;
  }
  v34 = v64;
  v33 = v65;
  v35 = v58;
  v36 = v61;
  v37 = v62;
  sub_24218D4B8((uint64_t)&v70, (uint64_t)v72);
  sub_24218D540((uint64_t)v72, (uint64_t)&v70);
  if (!*((_QWORD *)&v71 + 1))
  {
    sub_24218D588((uint64_t)&v70);
LABEL_13:
    v38 = 0;
    v39 = 0;
    goto LABEL_15;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
    v33 = v65;
    goto LABEL_13;
  }
  v38 = v68;
  v39 = v69;
  sub_24218D60C();
  swift_bridgeObjectRetain_n();
  v40 = v37;
  sub_2421AF928();
  v41 = sub_24218D658();
  if (os_log_type_enabled(v40, v41))
  {
    v42 = (uint8_t *)sub_24218D61C();
    *(_QWORD *)&v70 = sub_24218D61C();
    *(_DWORD *)v42 = 136315138;
    v58 = v42 + 4;
    swift_bridgeObjectRetain();
    sub_2421A0BC4(v38, v39, (uint64_t *)&v70);
    v68 = v43;
    sub_2421AFBEC();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_24218A000, v40, v41, "BidirectionalDelegate: clientApplicationIdentifier: %s", v42, 0xCu);
    swift_arrayDestroy();
    sub_24218D600();
  }

  swift_bridgeObjectRelease_n();
  sub_24218D62C(v62);
  v33 = v65;
LABEL_15:
  v44 = v39;
  v45 = v63;
  (*((void (**)(uint64_t, unint64_t, uint64_t, uint8_t *))v35 + 3))(v38, v44, v63, v35);
  (*(void (**)(uint64_t, char *, uint64_t))(v34 + 16))(v57, v33, v45);
  swift_getAssociatedTypeWitness();
  if (swift_dynamicCast())
  {
    if (((*((uint64_t (**)(void *, uint64_t, uint8_t *))v35 + 7))(v32, v45, v35) & 1) != 0)
    {
      v46 = v32;
      swift_unknownObjectRetain();
      v47 = (uint64_t)v55;
      sub_2421AF820();
      v52 = 1;
      sub_24218D5C8(v47, 0, 1, v36);
      (*((void (**)(uint64_t, uint64_t, uint8_t *))v35 + 5))(v47, v45, v35);
      sub_2421AFD48();
      sub_24218D66C(v46, sel_setExportedObject_);
      sub_24218D67C();
      swift_unknownObjectRelease();
      (*(void (**)(char *, uint64_t))(v64 + 8))(v33, v45);
      sub_24218D588((uint64_t)v72);
      return v52;
    }
    v48 = v54[2];
    sub_24218D60C();
    v49 = sub_2421AF928();
    v50 = sub_2421AFB80();
    if (sub_24218D638(v50))
    {
      v51 = (uint8_t *)sub_24218D61C();
      *(_WORD *)v51 = 0;
      _os_log_impl(&dword_24218A000, v49, (os_log_type_t)v36, "BidirectionalDelegate: connection rejected by server instance.", v51, 2u);
      sub_24218D600();
    }
    sub_24218D67C();

    sub_24218D62C(v48);
    (*(void (**)(char *, uint64_t))(v34 + 8))(v33, v45);
    sub_24218D588((uint64_t)v72);
    return 0;
  }
  result = sub_2421AFCF4();
  __break(1u);
  return result;
}

uint64_t sub_24218CED0(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = a1;
  v9 = sub_24218C558((uint64_t)v8, v7);

  return v9 & 1;
}

id sub_24218CF2C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_init);
}

id sub_24218CF60()
{
  return sub_24218CF2C();
}

id sub_24218CF80()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for BidirectionalDelegate(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_24218D5D4(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for BidirectionalDelegate);
}

void type metadata accessor for FLUserInfoProperty()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_2571DF1F0)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_2571DF1F0);
  }
}

uint64_t sub_24218D008()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = sub_2421AFA90();
  v2 = v1;
  if (v0 == sub_2421AFA90() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_2421AFD54();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

BOOL sub_24218D08C(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_24218D09C()
{
  uint64_t *v0;

  return sub_24218D22C(*v0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF9E0]);
}

uint64_t sub_24218D0C0(uint64_t a1, id *a2)
{
  uint64_t result;

  result = sub_2421AFA78();
  *a2 = 0;
  return result;
}

uint64_t sub_24218D138(uint64_t a1, id *a2)
{
  char v3;

  v3 = sub_2421AFA84();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_24218D1B4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_24218D1D8();
  *a1 = result;
  return result;
}

uint64_t sub_24218D1D8()
{
  uint64_t v0;

  sub_2421AFA90();
  v0 = sub_2421AFA6C();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_24218D20C()
{
  uint64_t *v0;

  return sub_24218D22C(*v0, MEMORY[0x24BEE0CD8]);
}

uint64_t sub_24218D22C(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v3;
  uint64_t v4;

  v3 = sub_2421AFA90();
  v4 = a2(v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_24218D264()
{
  return sub_24218D26C();
}

uint64_t sub_24218D26C()
{
  sub_2421AFA90();
  sub_2421AFAC0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24218D2AC()
{
  return sub_24218D2B4();
}

uint64_t sub_24218D2B4()
{
  uint64_t v0;

  sub_2421AFA90();
  sub_2421AFD84();
  sub_2421AFAC0();
  v0 = sub_2421AFD9C();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_24218D324()
{
  return sub_24218D008();
}

uint64_t sub_24218D330@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_2421AFA6C();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_24218D374@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_24218D39C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_24218D3A0()
{
  sub_24218D478(&qword_2571DF210, (uint64_t)&unk_2421B06A8);
  sub_24218D478(&qword_2571DF218, (uint64_t)&unk_2421B05FC);
  return sub_2421AFD30();
}

uint64_t sub_24218D40C()
{
  return sub_24218D478(&qword_2571DF1F8, (uint64_t)&unk_2421B05C0);
}

uint64_t sub_24218D430()
{
  return sub_24218D478(&qword_2571DF200, (uint64_t)&unk_2421B0594);
}

uint64_t sub_24218D454()
{
  return sub_24218D478(&qword_2571DF208, (uint64_t)&unk_2421B0630);
}

uint64_t sub_24218D478(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    type metadata accessor for FLUserInfoProperty();
    result = MEMORY[0x2426A5144](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24218D4B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_24218D500(&qword_2543A6910);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_24218D500(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2426A512C]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_24218D540(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_24218D500(&qword_2543A6910);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24218D588(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_24218D500(&qword_2543A6910);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_24218D5C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_24218D5D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x2426A50F0](a1, v6, a5);
}

void sub_24218D600()
{
  JUMPOUT(0x2426A51D4);
}

uint64_t sub_24218D60C()
{
  return sub_2421AF5E0();
}

uint64_t sub_24218D61C()
{
  return swift_slowAlloc();
}

void sub_24218D624()
{
  void *v0;

}

uint64_t sub_24218D62C(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, _QWORD))(v1 - 248))(a1, *(_QWORD *)(v1 - 192));
}

BOOL sub_24218D638(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

void sub_24218D648()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 256) = v0;
}

uint64_t sub_24218D658()
{
  return sub_2421AFB98();
}

uint64_t sub_24218D660()
{
  return sub_2421AF5E0();
}

id sub_24218D66C(id a1, SEL a2)
{
  uint64_t v2;

  return objc_msgSend(a1, a2, v2);
}

id sub_24218D674()
{
  void *v0;

  return v0;
}

uint64_t sub_24218D67C()
{
  return swift_unknownObjectRelease();
}

uint64_t sub_24218D684()
{
  return swift_getAssociatedTypeWitness();
}

BOOL sub_24218D6A4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  __int128 v5;
  uint64_t v6;
  _OWORD v7[2];

  v0 = sub_2421AFAD8();
  v2 = v1;
  swift_getObjectType();
  OS_xpc_object.asAny.getter((uint64_t)&v5);
  v3 = v6;
  if (v6)
  {
    sub_24218E140(&v5, v7);
    sub_24218E150((uint64_t)v7, (uint64_t)&v5);
    sub_24218DA98((uint64_t)&v5, v0, v2);
    sub_24218E18C((uint64_t)v7);
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_24218E104((uint64_t)&v5, &qword_2543A6910);
  }
  return v3 != 0;
}

void OS_xpc_object.asAny.getter(uint64_t a1@<X8>)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t *v10;
  unint64_t v11;
  uint64_t value;
  uint64_t v13;
  BOOL v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t *v22;
  const void *bytes_ptr;
  const void *v24;
  size_t length;
  size_t v26;
  uint64_t v27;

  v2 = v1;
  v4 = sub_24218D500(&qword_2571DF280);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x2426A52C4](v2);
  if (sub_2421AF970() == v7)
  {
    v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBCEF8]), sel_init);
    v11 = sub_24218E0C8();
LABEL_15:
    *(_QWORD *)(a1 + 24) = v11;
    *(_QWORD *)a1 = v9;
    return;
  }
  if (sub_2421AF994() == v7)
  {
    value = xpc_int64_get_value(v2);
    v13 = MEMORY[0x24BEE4008];
LABEL_18:
    *(_QWORD *)(a1 + 24) = v13;
    *(_QWORD *)a1 = value;
    return;
  }
  if (sub_2421AF9B8() == v7)
  {
    value = xpc_uint64_get_value(v2);
    v13 = MEMORY[0x24BEE4568];
    goto LABEL_18;
  }
  if (sub_2421AF94C() == v7)
  {
    v14 = xpc_BOOL_get_value(v2);
    *(_QWORD *)(a1 + 24) = MEMORY[0x24BEE1328];
    *(_BYTE *)a1 = v14;
    return;
  }
  if (sub_2421AF9A0() == v7)
  {
    v15 = xpc_double_get_value(v2);
    *(_QWORD *)(a1 + 24) = MEMORY[0x24BEE13C8];
    *(double *)a1 = v15;
    return;
  }
  if (sub_2421AF9AC() == v7)
  {
    if (xpc_string_get_string_ptr(v2))
    {
      v16 = sub_2421AFAD8();
      v18 = MEMORY[0x24BEE0D00];
LABEL_23:
      *(_QWORD *)(a1 + 24) = v18;
      *(_QWORD *)a1 = v16;
      *(_QWORD *)(a1 + 8) = v17;
      return;
    }
  }
  else if (sub_2421AF97C() == v7)
  {
    v19 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1880]), sel_initWithUUIDBytes_, xpc_uuid_get_bytes(v2));
    v20 = objc_msgSend(v19, sel_UUIDString);
    sub_2421AFA90();

    sub_2421AF4B4();
    swift_bridgeObjectRelease();
    v21 = sub_2421AF4C0();
    if (sub_24218E0BC((uint64_t)v6, 1, v21) != 1)
    {
      *(_QWORD *)(a1 + 24) = v21;
      v22 = sub_24218E080((uint64_t *)a1);
      (*(void (**)(uint64_t *, char *, uint64_t))(*(_QWORD *)(v21 - 8) + 32))(v22, v6, v21);

      return;
    }

    sub_24218E104((uint64_t)v6, &qword_2571DF280);
  }
  else
  {
    if (sub_2421AF964() == v7)
    {
      xpc_date_get_value_absolute();
      *(_QWORD *)(a1 + 24) = sub_2421AF4A8();
      sub_24218E080((uint64_t *)a1);
      sub_2421AF454();
      return;
    }
    if (sub_2421AF958() != v7)
    {
      if (sub_2421AF988() == v7)
      {
        v26 = sub_24218DD18(v2);
        if (v26)
        {
          v9 = (id)v26;
          v10 = (uint64_t *)&unk_2571DF290;
          goto LABEL_32;
        }
      }
      else if (sub_2421AF9D0() == v7)
      {
        v8 = sub_24218DF30(v2);
        if (v8)
        {
          v9 = (id)v8;
          v10 = (uint64_t *)&unk_2571DF288;
LABEL_32:
          v11 = sub_24218D500(v10);
          goto LABEL_15;
        }
      }
      goto LABEL_33;
    }
    bytes_ptr = xpc_data_get_bytes_ptr(v2);
    if (bytes_ptr)
    {
      v24 = bytes_ptr;
      length = xpc_data_get_length(v2);
      v16 = MEMORY[0x2426A4424](v24, length);
      v18 = MEMORY[0x24BDCDDE8];
      goto LABEL_23;
    }
  }
LABEL_33:
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
}

uint64_t sub_24218DA98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _OWORD v6[2];

  if (*(_QWORD *)(a1 + 24))
  {
    sub_24218E140((_OWORD *)a1, v6);
    sub_24218DC9C(v6, a2, a3);
    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_24218E104(a1, &qword_2543A6910);
    sub_24218DB78(a2, a3, v6);
    swift_bridgeObjectRelease();
    return sub_24218E104((uint64_t)v6, &qword_2543A6910);
  }
}

uint64_t sub_24218DB28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t (*v5)(uint64_t, uint64_t);
  char v6;

  v5 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 32);
  swift_unknownObjectRetain();
  v6 = v5(a2, a3);
  swift_unknownObjectRelease();
  return v6 & 1;
}

double sub_24218DB78@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t *v3;
  uint64_t *v4;
  unint64_t v8;
  char v9;
  double result;
  uint64_t v11;

  v4 = v3;
  swift_bridgeObjectRetain();
  v8 = sub_242197484(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if ((a2 & 1) != 0)
  {
    swift_isUniquelyReferenced_nonNull_native();
    v11 = *v4;
    *v4 = 0x8000000000000000;
    sub_24218D500(&qword_2571DF308);
    sub_2421AFCC4();
    swift_bridgeObjectRelease();
    sub_24218E140((_OWORD *)(*(_QWORD *)(v11 + 56) + 32 * v8), a3);
    sub_2421AFCDC();
    *v4 = v11;
    swift_bridgeObjectRelease();
  }
  else
  {
    result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

uint64_t sub_24218DC9C(_OWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v8;

  swift_isUniquelyReferenced_nonNull_native();
  v8 = *v3;
  *v3 = 0x8000000000000000;
  sub_2421AE698(a1, a2, a3);
  *v3 = v8;
  return swift_bridgeObjectRelease();
}

size_t sub_24218DD18(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  size_t result;
  size_t v5;
  size_t v6;
  id v7;
  uint64_t ObjectType;
  unint64_t v9;
  unint64_t v10;
  id v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  __int128 v20;
  unint64_t v21;

  v2 = MEMORY[0x2426A52C4]();
  if (v2 != sub_2421AF988())
    return 0;
  result = xpc_array_get_count(a1);
  if ((result & 0x8000000000000000) == 0)
  {
    v5 = result;
    if (!result)
      return MEMORY[0x24BEE4AF8];
    v6 = 0;
    v3 = MEMORY[0x24BEE4AF8];
    do
    {
      v7 = xpc_array_get_value(a1, v6);
      ObjectType = swift_getObjectType();
      OS_xpc_object.asAny.getter(&v18, ObjectType);
      swift_unknownObjectRelease();
      if (v19)
      {
        sub_24218E140(&v18, &v20);
        sub_24218E150((uint64_t)&v20, (uint64_t)&v18);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_2421A0028(0, *(_QWORD *)(v3 + 16) + 1, 1, v3);
          v3 = v14;
        }
        v10 = *(_QWORD *)(v3 + 16);
        v9 = *(_QWORD *)(v3 + 24);
        if (v10 >= v9 >> 1)
        {
          sub_2421A0028(v9 > 1, v10 + 1, 1, v3);
          v3 = v15;
        }
        *(_QWORD *)(v3 + 16) = v10 + 1;
        sub_24218E140(&v18, (_OWORD *)(v3 + 32 * v10 + 32));
        sub_24218E18C((uint64_t)&v20);
      }
      else
      {
        sub_24218E104((uint64_t)&v18, &qword_2543A6910);
        v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBCEF8]), sel_init);
        v21 = sub_24218E0C8();
        *(_QWORD *)&v20 = v11;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_2421A0028(0, *(_QWORD *)(v3 + 16) + 1, 1, v3);
          v3 = v16;
        }
        v13 = *(_QWORD *)(v3 + 16);
        v12 = *(_QWORD *)(v3 + 24);
        if (v13 >= v12 >> 1)
        {
          sub_2421A0028(v12 > 1, v13 + 1, 1, v3);
          v3 = v17;
        }
        *(_QWORD *)(v3 + 16) = v13 + 1;
        sub_24218E140(&v20, (_OWORD *)(v3 + 32 * v13 + 32));
      }
      ++v6;
    }
    while (v5 != v6);
    return v3;
  }
  __break(1u);
  return result;
}

uint64_t sub_24218DF30(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  char isEscapingClosureAtFileLocation;
  uint64_t result;
  _QWORD aBlock[6];
  uint64_t v10;

  v2 = MEMORY[0x2426A52C4]();
  if (v2 != sub_2421AF9D0())
    return 0;
  v10 = MEMORY[0x24BEE4B00];
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = &v10;
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = sub_24218E1B8;
  *(_QWORD *)(v5 + 24) = v4;
  aBlock[4] = sub_24218E1CC;
  aBlock[5] = v5;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_24218DB28;
  aBlock[3] = &unk_251331ED0;
  v6 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  xpc_dictionary_apply(a1, v6);
  _Block_release(v6);
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  result = swift_release();
  if ((isEscapingClosureAtFileLocation & 1) == 0)
  {
    v3 = v10;
    swift_release();
    return v3;
  }
  __break(1u);
  return result;
}

uint64_t *sub_24218E080(uint64_t *a1)
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

uint64_t sub_24218E0BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

unint64_t sub_24218E0C8()
{
  unint64_t result;

  result = qword_2571DF298;
  if (!qword_2571DF298)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2571DF298);
  }
  return result;
}

uint64_t sub_24218E104(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_24218D500(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

_OWORD *sub_24218E140(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_24218E150(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_24218E18C(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_24218E1AC()
{
  return sub_24218E208();
}

uint64_t sub_24218E1B8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_24218D6A4(a1, a2, *(_QWORD *)(v2 + 16));
}

uint64_t sub_24218E1C0()
{
  return sub_24218E208();
}

uint64_t sub_24218E1CC()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))() & 1;
}

uint64_t sub_24218E1F0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_24218E200()
{
  return swift_release();
}

uint64_t sub_24218E208()
{
  return swift_deallocObject();
}

uint64_t sub_24218E210(uint64_t a1)
{
  return sub_24218E2BC(a1, qword_2543A6B60);
}

uint64_t sub_24218E22C(uint64_t a1)
{
  return sub_24218E2BC(a1, qword_2543A6B78);
}

uint64_t *sub_24218E24C(uint64_t a1, uint64_t *a2)
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

uint64_t sub_24218E28C(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_24218E2A4(uint64_t a1)
{
  return sub_24218E2BC(a1, qword_2543A6B90);
}

uint64_t sub_24218E2BC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_2421AF940();
  sub_24218E24C(v3, a2);
  sub_24218E28C(v3, (uint64_t)a2);
  return sub_2421AF934();
}

uint64_t sub_24218E330()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(unint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
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
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  uint64_t result;
  char *v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char v41;
  char v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  NSObject *v49;
  char *v50;
  uint64_t v51;
  uint64_t (*v52)(char *, uint64_t, uint64_t);
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
  char v63;
  void (*v64)(char *, uint64_t);
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  char *v70;
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
  uint64_t v81;
  NSObject *v82;
  os_log_type_t v83;
  int v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  char *v89;
  uint64_t v90;
  unint64_t v91;
  unint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  unint64_t v96;
  uint64_t v97;
  void (*v98)(uint64_t, uint64_t);
  uint64_t v99;
  _QWORD v100[4];
  __int128 v101;
  uint64_t *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  int64_t v108;
  uint64_t v109;
  unint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  os_log_t v117;
  char *v118;
  void (*v119)(unint64_t, char *, uint64_t);
  uint64_t v120;
  _QWORD *v121;
  uint64_t v122;
  __int128 v123;
  uint64_t v124;
  uint64_t v125;
  _QWORD *v126;
  uint64_t v127;
  _QWORD *v128;
  uint64_t v129;
  uint64_t v130[2];

  v0 = sub_24218D500(&qword_2543A67F0);
  MEMORY[0x24BDAC7A8](v0);
  v111 = (uint64_t)v100 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24218D500(&qword_2543A6B28);
  v2 = sub_24218D500(&qword_2543A6A90);
  v3 = *(_QWORD *)(v2 - 8);
  v127 = *(_QWORD *)(v3 + 72);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v5 = swift_allocObject();
  v128 = (_QWORD *)v5;
  *(_OWORD *)(v5 + 16) = xmmword_2421B0710;
  v6 = v5 + v4;
  v126 = (_QWORD *)*(int *)(v2 + 48);
  v7 = *MEMORY[0x24BE68558];
  v8 = sub_2421901F8();
  v120 = *(_QWORD *)(v8 - 8);
  v9 = *(void (**)(unint64_t, uint64_t, uint64_t))(v120 + 104);
  v9(v6, v7, v8);
  sub_24218D500(&qword_2543A68F8);
  v10 = sub_2421AF664();
  v11 = *(_QWORD *)(v10 - 8);
  v124 = *(_QWORD *)(v11 + 72);
  v125 = v11;
  v12 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  v13 = sub_2421901C8();
  v123 = xmmword_2421B0720;
  *(_OWORD *)(v13 + 16) = xmmword_2421B0720;
  sub_2421AF64C();
  *(_QWORD *)((char *)v126 + v6) = v13;
  v14 = v8;
  v15 = v10;
  v16 = v6 + v127;
  v17 = *(int *)(v2 + 48);
  v9(v16, *MEMORY[0x24BE68550], v14);
  v18 = sub_2421901C8();
  *(_OWORD *)(v18 + 16) = v123;
  v110 = v12;
  sub_2421AF658();
  *(_QWORD *)(v16 + v17) = v18;
  sub_24218D500(&qword_2543A6AF0);
  sub_242190110(&qword_2543A6A80, (uint64_t (*)(uint64_t))MEMORY[0x24BE68570], MEMORY[0x24BE68580]);
  v19 = sub_2421AF9F4();
  v20 = *(_QWORD *)(v19 + 64);
  v103 = v19 + 64;
  v21 = 1 << *(_BYTE *)(v19 + 32);
  v22 = -1;
  if (v21 < 64)
    v22 = ~(-1 << v21);
  v23 = v22 & v20;
  v24 = sub_24218D500(&qword_2543A6A78);
  v100[2] = v100;
  MEMORY[0x24BDAC7A8](v24);
  sub_242190184();
  v114 = v26;
  v115 = v27;
  v29 = v28 - v26;
  v30 = 0;
  v102 = v130;
  v108 = (unint64_t)(v21 + 63) >> 6;
  v100[0] = v108 - 1;
  v113 = v19;
  v100[1] = v19 + 104;
  *(_QWORD *)&v31 = 136315394;
  v101 = v31;
  v100[3] = MEMORY[0x24BEE4AD8] + 8;
  v112 = v14;
  v107 = v15;
  v109 = v28 - v26;
  while (1)
  {
    result = MEMORY[0x24BDAC7A8](v25);
    v33 = (char *)v100 - v114;
    if (v23)
    {
      *(_QWORD *)&v123 = (v23 - 1) & v23;
      v34 = __clz(__rbit64(v23)) | (v30 << 6);
      v35 = v120;
      goto LABEL_6;
    }
    v35 = v120;
    if (__OFADD__(v30, 1))
      break;
    sub_2421901A0();
    if (v41 != v42)
    {
      v43 = *(_QWORD *)(v103 + 8 * v40);
      if (v43)
        goto LABEL_11;
      v44 = v40;
      if (v40 + 1 < v108)
      {
        v43 = *(_QWORD *)(v103 + 8 * (v40 + 1));
        if (v43)
        {
          ++v40;
          goto LABEL_11;
        }
        v44 = v40 + 1;
        if (v40 + 2 < v108)
        {
          v43 = *(_QWORD *)(v103 + 8 * (v40 + 2));
          if (v43)
          {
            v40 += 2;
            goto LABEL_11;
          }
          v44 = v40 + 2;
          sub_2421901A0();
          if (v41 != v42)
          {
            v43 = *(_QWORD *)(v103 + 8 * v40);
            if (!v43)
            {
              do
              {
                sub_2421901A0();
                if (v41 == v42)
                {
                  v44 = v100[0];
                  goto LABEL_12;
                }
                v43 = *(_QWORD *)(v99 + 8 * v30++);
              }
              while (!v43);
              v40 = v30 + 4;
            }
LABEL_11:
            *(_QWORD *)&v123 = (v43 - 1) & v43;
            v34 = __clz(__rbit64(v43)) + (v40 << 6);
            v30 = v40;
LABEL_6:
            v36 = v113;
            sub_242190210((uint64_t)v33, *(_QWORD *)(v113 + 48) + *(_QWORD *)(v35 + 72) * v34, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v35 + 16));
            v37 = *(_QWORD *)(v36 + 56);
            v38 = sub_242190200();
            *(_QWORD *)&v33[*(int *)(v38 + 48)] = *(_QWORD *)(v37 + 8 * v34);
            sub_2421901F0((uint64_t)v33, 0, v39, v38);
            swift_bridgeObjectRetain();
            goto LABEL_13;
          }
        }
      }
    }
    else
    {
      v44 = v30;
    }
LABEL_12:
    v45 = sub_242190200();
    sub_2421901F0((uint64_t)v33, 1, v46, v45);
    *(_QWORD *)&v123 = 0;
    v30 = v44;
LABEL_13:
    sub_24218ED9C((uint64_t)v33, v29);
    v47 = sub_242190200();
    v48 = sub_24218E0BC(v29, 1, v47);
    if ((_DWORD)v48 == 1)
      return swift_release();
    v122 = v30;
    v49 = *(NSObject **)(v35 + 64);
    MEMORY[0x24BDAC7A8](v48);
    v50 = (char *)v100 - (((unint64_t)&v49[1].isa + 7) & 0xFFFFFFFFFFFFFFF0);
    v51 = *(_QWORD *)(v29 + *(int *)(v47 + 48));
    v52 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v35 + 32);
    v53 = v52(v50, v29, v14);
    v54 = *(_QWORD *)(v51 + 16);
    v121 = v100;
    v119 = (void (*)(unint64_t, char *, uint64_t))v52;
    if (v54)
    {
      v117 = v49;
      v118 = (char *)v100 - (((unint64_t)&v49[1].isa + 7) & 0xFFFFFFFFFFFFFFF0);
      v116 = v51;
      v55 = v51 + v110;
      v56 = *(_QWORD *)(v125 + 16);
      v126 = *(_QWORD **)(v125 + 64);
      v127 = v56;
      while (1)
      {
        MEMORY[0x24BDAC7A8](v53);
        sub_242190184();
        v59 = v57 - v58;
        sub_2421901E4(v57 - v58, v55);
        v60 = sub_2421AF634();
        v128 = v100;
        v61 = *(_QWORD *)(v60 - 8);
        v62 = *(_QWORD *)(v61 + 64);
        MEMORY[0x24BDAC7A8](v60);
        sub_2421AF640();
        v63 = sub_2421AF604();
        v64 = *(void (**)(char *, uint64_t))(v61 + 8);
        v64((char *)v100 - ((v62 + 15) & 0xFFFFFFFFFFFFFFF0), v60);
        if ((v63 & 1) == 0)
          break;
        v53 = (*(uint64_t (**)(uint64_t, uint64_t))(v125 + 8))(v59, v15);
        v55 += v124;
        if (!--v54)
        {
          swift_bridgeObjectRelease();
          v14 = v112;
          v35 = v120;
          v29 = v109;
          v49 = v117;
          v50 = v118;
          goto LABEL_20;
        }
      }
      v105 = v62;
      v106 = v60;
      v128 = v100;
      swift_bridgeObjectRelease();
      if (qword_2543A66F0 != -1)
        swift_once();
      v73 = sub_2421AF940();
      v74 = sub_24218E28C(v73, (uint64_t)qword_2543A6B60);
      v119 = (void (*)(unint64_t, char *, uint64_t))v100;
      MEMORY[0x24BDAC7A8](v74);
      sub_242190184();
      v77 = v75 - v76;
      v15 = v107;
      v78 = sub_2421901E4(v75 - v76, v59);
      MEMORY[0x24BDAC7A8](v78);
      sub_242190184();
      v81 = v79 - v80;
      v14 = v112;
      sub_242190210(v79 - v80, (uint64_t)v118, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v120 + 16));
      v82 = sub_2421AF928();
      v83 = sub_2421AFB98();
      v84 = v83;
      if (os_log_type_enabled(v82, v83))
      {
        v85 = sub_24218D61C();
        v86 = sub_24218D61C();
        v127 = v86;
        v130[0] = v86;
        *(_DWORD *)v85 = v101;
        v104 = v85 + 4;
        MEMORY[0x24BDAC7A8](v86);
        sub_242190184();
        v117 = v82;
        v89 = (char *)(v87 - v88);
        LODWORD(v116) = v84;
        sub_2421AF640();
        v90 = sub_2421AF628();
        v92 = v91;
        v64(v89, v106);
        sub_2421A0BC4(v90, v92, v130);
        v129 = v93;
        v126 = v100;
        sub_2421AFBEC();
        v94 = v107;
        swift_bridgeObjectRelease();
        (*(void (**)(uint64_t, uint64_t))(v125 + 8))(v77, v94);
        *(_WORD *)(v85 + 12) = 2080;
        v95 = sub_2421AF778();
        sub_2421A0BC4(v95, v96, v130);
        v129 = v97;
        sub_2421AFBEC();
        swift_bridgeObjectRelease();
        sub_2421901C0(v81);
        _os_log_impl(&dword_24218A000, v117, (os_log_type_t)v116, "Device does not meet precondition: %s. So not subscribing to request resource key: %s", (uint8_t *)v85, 0x16u);
        swift_arrayDestroy();
        sub_24218D600();
      }

      sub_2421901C0(v81);
      v98 = *(void (**)(uint64_t, uint64_t))(v125 + 8);
      v98(v77, v15);
      v98(v59, v15);
      v25 = sub_2421901C0((uint64_t)v118);
      v30 = v122;
      v23 = v123;
      v29 = v109;
    }
    else
    {
      swift_bridgeObjectRelease();
LABEL_20:
      v65 = sub_2421AF4A8();
      v66 = v111;
      v68 = sub_2421901F0(v111, 1, v67, v65);
      MEMORY[0x24BDAC7A8](v68);
      v69 = (char *)v100 - (((unint64_t)&v49[1].isa + 7) & 0xFFFFFFFFFFFFFFF0);
      sub_242190210((uint64_t)v69, (uint64_t)v50, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v35 + 16));
      v70 = v50;
      v71 = (*(unsigned __int8 *)(v35 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v35 + 80);
      v72 = swift_allocObject();
      v119(v72 + v71, v69, v14);
      sub_242191D20();
      swift_release();
      sub_2421900D0(v66);
      v25 = (*(uint64_t (**)(char *, uint64_t))(v35 + 8))(v70, v14);
      v30 = v122;
      v23 = v123;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_24218ED9C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_24218D500(&qword_2543A6A78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_24218EDE4(void *a1, uint64_t a2)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  id v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  if (a1)
  {
    v4 = a1;
    if (qword_2543A66F0 != -1)
      swift_once();
    v5 = sub_2421AF940();
    sub_24218E28C(v5, (uint64_t)qword_2543A6B60);
    v6 = sub_2421AF784();
    v7 = *(_QWORD *)(v6 - 8);
    MEMORY[0x24BDAC7A8](v6);
    v9 = (char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a2, v6);
    v10 = a1;
    v11 = a1;
    v12 = sub_2421AF928();
    v13 = sub_2421AFB80();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = swift_slowAlloc();
      v34 = (_QWORD *)swift_slowAlloc();
      v35 = swift_slowAlloc();
      v37 = v35;
      *(_DWORD *)v14 = 136315394;
      v15 = sub_2421AF778();
      sub_2421A0BC4(v15, v16, &v37);
      v36 = v17;
      sub_2421AFBEC();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
      *(_WORD *)(v14 + 12) = 2112;
      v18 = a1;
      v19 = _swift_stdlib_bridgeErrorToNSError();
      v36 = v19;
      sub_2421AFBEC();
      v20 = v34;
      *v34 = v19;

      _os_log_impl(&dword_24218A000, v12, v13, "Failed to subscribe to %s: %@", (uint8_t *)v14, 0x16u);
      sub_24218D500(&qword_2543A6B08);
      swift_arrayDestroy();
      MEMORY[0x2426A51D4](v20, -1, -1);
      v21 = v35;
      swift_arrayDestroy();
      MEMORY[0x2426A51D4](v21, -1, -1);
      MEMORY[0x2426A51D4](v14, -1, -1);

    }
    else
    {

      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    }
  }
  else
  {
    if (qword_2543A66F0 != -1)
      swift_once();
    v22 = sub_2421AF940();
    sub_24218E28C(v22, (uint64_t)qword_2543A6B60);
    v23 = sub_2421AF784();
    v24 = *(_QWORD *)(v23 - 8);
    MEMORY[0x24BDAC7A8](v23);
    v26 = (char *)&v34 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, uint64_t, uint64_t))(v24 + 16))(v26, a2, v23);
    v27 = sub_2421AF928();
    v28 = sub_2421AFB98();
    if (os_log_type_enabled(v27, v28))
    {
      v29 = (uint8_t *)swift_slowAlloc();
      v30 = swift_slowAlloc();
      v37 = v30;
      *(_DWORD *)v29 = 136315138;
      v31 = sub_2421AF778();
      sub_2421A0BC4(v31, v32, &v37);
      v36 = v33;
      sub_2421AFBEC();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v24 + 8))(v26, v23);
      _os_log_impl(&dword_24218A000, v27, v28, "Successfully subscribed to %s", v29, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2426A51D4](v30, -1, -1);
      MEMORY[0x2426A51D4](v29, -1, -1);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v24 + 8))(v26, v23);
    }

  }
}

void sub_24218F248(NSObject *a1)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;

  v2 = (void *)objc_opt_self();
  v3 = objc_msgSend(v2, sel_sharedScheduler);
  v4 = (void *)sub_2421AFA6C();
  v5 = MEMORY[0x24BDAC760];
  v13 = sub_242190218((uint64_t)v4, v6, v7, v8, v9, v10, v11, v12, MEMORY[0x24BDAC760]);
  objc_msgSend(v3, sel_registerForTaskWithIdentifier_usingQueue_launchHandler_, v4, a1, v13);
  _Block_release(v13);

  v14 = objc_msgSend(v2, sel_sharedScheduler);
  v15 = (void *)sub_2421AFA6C();
  v23 = sub_242190218((uint64_t)v15, v16, v17, v18, v19, v20, v21, v22, v5);
  objc_msgSend(v14, sel_registerForTaskWithIdentifier_usingQueue_launchHandler_, v15, a1, v23);
  _Block_release(v23);

  v32 = sub_242190218(v24, v25, v26, v27, v28, v29, v30, v31, v5);
  xpc_set_event_stream_handler("com.apple.notifyd.matching", a1, v32);
  _Block_release(v32);
}

id sub_24218F424(void *a1)
{
  uint64_t v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v13;

  if (qword_2543A66F0 != -1)
    swift_once();
  v2 = sub_2421AF940();
  sub_24218E28C(v2, (uint64_t)qword_2543A6B60);
  v3 = a1;
  v4 = sub_2421AF928();
  v5 = sub_2421AFB98();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    v7 = swift_slowAlloc();
    v13 = v7;
    *(_DWORD *)v6 = 136315138;
    v8 = objc_msgSend(v3, sel_identifier);
    v9 = sub_2421AFA90();
    v11 = v10;

    sub_2421A0BC4(v9, v11, &v13);
    sub_2421AFBEC();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24218A000, v4, v5, "Running background task event: %s", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2426A51D4](v7, -1, -1);
    MEMORY[0x2426A51D4](v6, -1, -1);

  }
  else
  {

  }
  sub_24218E330();
  return objc_msgSend(v3, sel_setTaskCompleted);
}

void sub_24218F5FC(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

id sub_24218F64C(void *a1)
{
  uint64_t v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v13;

  if (qword_2543A66F0 != -1)
    swift_once();
  v2 = sub_2421AF940();
  sub_24218E28C(v2, (uint64_t)qword_2543A6B60);
  v3 = a1;
  v4 = sub_2421AF928();
  v5 = sub_2421AFB98();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    v7 = swift_slowAlloc();
    v13 = v7;
    *(_DWORD *)v6 = 136315138;
    v8 = objc_msgSend(v3, sel_identifier);
    v9 = sub_2421AFA90();
    v11 = v10;

    sub_2421A0BC4(v9, v11, &v13);
    sub_2421AFBEC();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24218A000, v4, v5, "Running background task event: %s", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2426A51D4](v7, -1, -1);
    MEMORY[0x2426A51D4](v6, -1, -1);

  }
  else
  {

  }
  type metadata accessor for FollowUpManager();
  sub_24219D07C();
  return objc_msgSend(v3, sel_setTaskCompleted);
}

void sub_24218F830(void *a1)
{
  const char *v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;

  v2 = (const char *)sub_2421AF9C4();
  if (xpc_dictionary_get_string(a1, v2))
  {
    v3 = sub_2421AFAD8();
    v5 = v4;
    if (qword_2543A66F0 != -1)
      swift_once();
    v6 = sub_2421AF940();
    sub_24218E28C(v6, (uint64_t)qword_2543A6B60);
    swift_bridgeObjectRetain();
    v7 = sub_2421AF928();
    v8 = sub_2421AFB98();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = (uint8_t *)swift_slowAlloc();
      v10 = swift_slowAlloc();
      v11 = v10;
      *(_DWORD *)v9 = 136315138;
      swift_bridgeObjectRetain();
      sub_2421A0BC4(v3, v5, &v11);
      sub_2421AFBEC();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_24218A000, v7, v8, "Handle notification: %s", v9, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2426A51D4](v10, -1, -1);
      MEMORY[0x2426A51D4](v9, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

uint64_t sub_24218F9E4(uint64_t a1)
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

uint64_t sub_24218FA2C()
{
  return swift_task_switch();
}

uint64_t sub_24218FA40()
{
  uint64_t v0;
  BOOL v1;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;

  if (MEMORY[0x24BE3C130])
    v1 = MEMORY[0x24BE3C150] == 0;
  else
    v1 = 1;
  if (v1 || MEMORY[0x24BE3C140] == 0)
    return (*(uint64_t (**)(void))(v0 + 8))();
  if (qword_2543A66F0 != -1)
    swift_once();
  v3 = sub_2421AF940();
  *(_QWORD *)(v0 + 24) = sub_24218E28C(v3, (uint64_t)qword_2543A6B60);
  v4 = sub_2421AF928();
  v5 = sub_2421AFB98();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)sub_24218D61C();
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_24218A000, v4, v5, "Starting to listen for changes to availability", v6, 2u);
    sub_24218D600();
  }

  v7 = sub_2421AF91C();
  *(_QWORD *)(v0 + 32) = v7;
  *(_QWORD *)(v0 + 40) = *(_QWORD *)(v7 - 8);
  *(_QWORD *)(v0 + 48) = sub_242190178();
  v8 = sub_2421AF8C8();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = sub_242190178();
  sub_2421AF8BC();
  sub_2421AF910();
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v10, v8);
  sub_242190208();
  v11 = sub_2421AF8EC();
  v12 = (uint64_t (*)(uint64_t))MEMORY[0x24BE3C0D0];
  *(_QWORD *)(v0 + 56) = v11;
  *(_QWORD *)(v0 + 64) = *(_QWORD *)(v11 - 8);
  *(_QWORD *)(v0 + 72) = sub_242190178();
  v13 = sub_2421AF8F8();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = sub_242190178();
  sub_2421AF904();
  sub_2421AF8E0();
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v15, v13);
  swift_task_dealloc();
  sub_24218D500(&qword_2543A6988);
  *(_QWORD *)(v0 + 80) = sub_242190178();
  *(_QWORD *)(v0 + 88) = sub_242190110(&qword_2543A6AB0, v12, MEMORY[0x24BE3C0E0]);
  v16 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 96) = v16;
  *v16 = v0;
  v16[1] = sub_24218FCD8;
  return sub_2421AFB20();
}

uint64_t sub_24218FCD8()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;

  v2 = *v1;
  v4 = *v1;
  sub_2421901D8(&v4);
  if (v0)
    *(_QWORD *)(v2 + 104) = v0;
  return sub_242190194();
}

uint64_t sub_24218FD2C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;

  v1 = *(_QWORD *)(v0 + 80);
  v2 = sub_2421AF8B0();
  if (sub_24218E0BC(v1, 1, v2) == 1)
  {
    v3 = *(_QWORD *)(v0 + 48);
    v5 = *(_QWORD *)(v0 + 32);
    v4 = *(_QWORD *)(v0 + 40);
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 64) + 8))(*(_QWORD *)(v0 + 72), *(_QWORD *)(v0 + 56));
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
    swift_task_dealloc();
    swift_task_dealloc();
    sub_242190208();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v7 = *(_QWORD *)(v2 - 8);
    v8 = swift_task_alloc();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32))(v8, v1, v2);
    v9 = swift_task_alloc();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v9, v8, v2);
    v10 = sub_2421AF928();
    v11 = sub_2421AFB98();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = sub_24218D61C();
      v17 = sub_24218D61C();
      *(_DWORD *)v12 = 136315138;
      sub_242190110(&qword_2543A6AA8, (uint64_t (*)(uint64_t))MEMORY[0x24BE3C028], MEMORY[0x24BE3C040]);
      v13 = sub_2421AFD3C();
      sub_2421A0BC4(v13, v14, &v17);
      *(_QWORD *)(v12 + 4) = v15;
      swift_bridgeObjectRelease();
      sub_2421901B0();
      _os_log_impl(&dword_24218A000, v10, v11, "Received new availability: %s", (uint8_t *)v12, 0xCu);
      swift_arrayDestroy();
      sub_24218D600();
    }
    sub_2421901B0();

    swift_task_dealloc();
    type metadata accessor for FollowUpManager();
    sub_24219D07C();
    ((void (*)(uint64_t, uint64_t))v7)(v8, v2);
    sub_242190208();
    v16 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 112) = v16;
    *v16 = v0;
    v16[1] = sub_24218FFE8;
    return sub_2421AFB20();
  }
}

uint64_t sub_24218FF88()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 16) = *(_QWORD *)(v0 + 104);
  sub_24218D500(&qword_2571DF318);
  swift_dynamicCast();
  return swift_willThrowTypedImpl();
}

uint64_t sub_24218FFE8()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;

  v2 = *v1;
  v4 = *v1;
  sub_2421901D8(&v4);
  if (v0)
    *(_QWORD *)(v2 + 104) = v0;
  return sub_242190194();
}

uint64_t sub_24219003C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = sub_2421901F8();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

void sub_242190098(void *a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(sub_2421901F8() - 8) + 80);
  sub_24218EDE4(a1, v1 + ((v3 + 16) & ~v3));
}

uint64_t sub_2421900D0(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_24218D500(&qword_2543A67F0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_242190110(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x2426A5144](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_242190150(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_242190160()
{
  return swift_release();
}

uint64_t sub_242190178()
{
  return swift_task_alloc();
}

uint64_t sub_242190194()
{
  return swift_task_switch();
}

uint64_t sub_2421901B0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t sub_2421901C0(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(a1, v2);
}

uint64_t sub_2421901C8()
{
  return swift_allocObject();
}

uint64_t sub_2421901D8@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
  return swift_task_dealloc();
}

uint64_t sub_2421901E4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 - 120))(a1, a2, v2);
}

uint64_t sub_2421901F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_24218D5C8(a1, a2, 1, a4);
}

uint64_t sub_2421901F8()
{
  return sub_2421AF784();
}

uint64_t sub_242190200()
{
  uint64_t *v0;

  return sub_24218D500(v0);
}

uint64_t sub_242190208()
{
  return swift_task_dealloc();
}

uint64_t sub_242190210@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

void *sub_242190218(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return _Block_copy(&a9);
}

void sub_242190220()
{
  sub_24219025C();
}

void sub_242190234()
{
  sub_242190F7C();
}

void sub_242190248()
{
  sub_24219025C();
}

void sub_24219025C()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(char *);
  uint64_t (*v4)(char *);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
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
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  char v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  int v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
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
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  char v72;
  char v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
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
  void (*v90)(uint64_t, char *, _QWORD *);
  void *v91;
  void *v92;
  id v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  id v98;
  id v99;
  unint64_t v100;
  unint64_t v101;
  uint64_t v102;
  uint64_t v103;
  void (*v104)(uint64_t);
  uint64_t v105;
  uint64_t v106;
  char v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  id v137;
  void *v138;
  __n128 *v139;
  uint64_t v140;
  void *v141;
  uint64_t v142;
  uint64_t (*v143)(uint64_t, _QWORD);
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  os_log_type_t v147;
  uint64_t v148;
  unint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  void *v154;
  uint64_t v155[3];
  uint64_t v156;
  _QWORD *v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t (*v161)(char *);
  char *v162;
  __int128 v163;
  __int128 v164;
  _QWORD *v165;
  uint64_t *v166;
  unint64_t v167;
  uint64_t *v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  _QWORD v172[6];

  sub_242199548();
  *(_QWORD *)&v164 = v2;
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v165 = v9;
  sub_24218D500(&qword_2543A67F0);
  sub_2421992E8();
  MEMORY[0x24BDAC7A8](v10);
  sub_24218D690();
  sub_24218D648();
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)v155 - v12;
  v14 = (_QWORD *)sub_242199938();
  v159 = *(v14 - 1);
  sub_242199348();
  MEMORY[0x24BDAC7A8](v15);
  sub_242199590(v16, v155[0]);
  sub_2421992E8();
  MEMORY[0x24BDAC7A8](v17);
  sub_2421995E0();
  sub_242199910();
  v156 = sub_2421AF58C();
  v155[2] = *(_QWORD *)(v156 - 8);
  sub_242199348();
  MEMORY[0x24BDAC7A8](v18);
  sub_24219943C();
  sub_242199910();
  v160 = v6;
  sub_242199910();
  sub_242199A88();
  sub_242199A68();
  v19 = sub_2421998B8();
  v20 = *(_QWORD *)(v19 + 16);
  v157 = v14;
  if (v20)
  {
    v161 = v4;
    v162 = v13;
    *(_QWORD *)&v163 = v8;
    v167 = MEMORY[0x24BEE4AF8];
    v155[0] = v19;
    v1 = v19 + 32;
    do
    {
      sub_2421929F8(v1, (uint64_t)v172);
      v21 = sub_242199484();
      v0 = v155;
      v22 = *(_QWORD *)(v21 - 8);
      v23 = *(_QWORD *)(v22 + 64);
      MEMORY[0x24BDAC7A8](v21);
      v24 = (char *)v155 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
      sub_24218D500(&qword_2543A6A60);
      v168 = v155;
      sub_2421992E8();
      MEMORY[0x24BDAC7A8](v25);
      v27 = (char *)v155 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
      sub_242199744();
      v28 = sub_24218D500(&qword_2543A67F8);
      sub_24218D500(&qword_2543A6808);
      if (sub_242199454())
      {
        v166 = (uint64_t *)v1;
        v30 = v170;
        v29 = v171;
        v28 = (uint64_t)sub_242198260(&v169, v170);
        v31 = v29;
        v0 = v155;
        v1 = (uint64_t)v166;
        MEMORY[0x2426A4724](v30, v31);
        sub_2421999E0((uint64_t)v27);
      }
      else
      {
        v32 = sub_242199724();
        sub_242199198(v32, &qword_2543A6A68);
        sub_2421999B0((uint64_t)v27);
      }
      sub_242199A08();
      if (sub_24218E0BC((uint64_t)v27, 1, v21) == 1)
      {
        sub_242199198((uint64_t)v27, &qword_2543A6A60);
      }
      else
      {
        v166 = v155;
        v33 = sub_242199AD4((uint64_t)v24, (uint64_t)v27);
        v168 = v155;
        MEMORY[0x24BDAC7A8](v33);
        v34 = sub_242199A10((uint64_t)v155);
        sub_242199AD4(v34, (uint64_t)v24);
        v35 = v167;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          v39 = sub_2421998F8();
          v35 = sub_2421A00F0(v39, v40, v41, v35);
        }
        v37 = *(_QWORD *)(v35 + 16);
        v36 = *(_QWORD *)(v35 + 24);
        if (v37 >= v36 >> 1)
          v35 = sub_2421A00F0(v36 > 1, v37 + 1, 1, v35);
        *(_QWORD *)(v35 + 16) = v37 + 1;
        sub_24219979C();
        v167 = v35;
        sub_242199AD4(v35 + v38 + *(_QWORD *)(v22 + 72) * v37, v28);
        v0 = v166;
      }
      v1 += 40;
      --v20;
    }
    while (v20);
    v42 = sub_242199794();
    v14 = v157;
    v8 = v163;
    v13 = v162;
    v4 = v161;
  }
  else
  {
    v42 = swift_bridgeObjectRelease();
  }
  MEMORY[0x24BDAC7A8](v42);
  sub_242199948();
  sub_242199A60(v4, v43, v44);
  v45 = sub_242199A98();
  sub_242199158(v8, (uint64_t)v13, &qword_2543A67F0);
  v46 = sub_242199AEC((uint64_t)v13);
  v47 = 0x24BEBE000uLL;
  v167 = v45;
  if (v46 == 1)
  {
    sub_242199198((uint64_t)v13, &qword_2543A67F0);
    v48 = sub_242199520();
    sub_24219794C(v48);
    sub_2421993A4();
    sub_242199910();
    sub_242199B0C();
    sub_24219946C();
    sub_242199858();
    v50 = 1 << *(_BYTE *)(v45 + 32);
    v51 = -1;
    if (v50 < 64)
      v51 = ~(-1 << v50);
    v52 = v51 & v49;
    v53 = sub_242199484();
    sub_242199414(v53, v54, v55, v56, v57, v58, v59, v60, v155[0]);
    v62 = MEMORY[0x24BDAC7A8](v61);
    sub_24219931C(v62, v63, v64, v65, v66, v67, v68, v69, v155[0]);
    sub_242199520();
    v70 = 0;
    v164 = xmmword_2421B0720;
    if (!v52)
      goto LABEL_21;
LABEL_20:
    v52 &= v52 - 1;
    sub_24219982C();
    while (1)
    {
      v76 = sub_2421993EC(v71);
      v77 = MEMORY[0x24BDAC7A8](v76);
      sub_24219948C(v77, v78, v79, v80, v81, v82, v83, v84, v155[0]);
      v85 = sub_2421AF6DC();
      v87 = v86;
      if (qword_2543A6AD0 != -1)
        swift_once();
      v1 = qword_2543A6AB8;
      v172[0] = v85;
      v172[1] = v87;
      sub_242199588();
      sub_242199918();
      sub_242199434();
      v47 = (unint64_t)objc_msgSend((id)objc_opt_self(), sel_sharedManager);
      if (qword_2543A6838 != -1)
        swift_once();
      v14 = (_QWORD *)sub_242199474();
      sub_24218D500(&qword_2543A6940);
      v88 = sub_2421993E0();
      sub_24219966C(v88);
      v13 = (char *)sub_2421AFAF0();
      sub_242199770();
      sub_2421993D4((id)v47, sel_unsubscribe_subscriptionNames_queue_completion_, (uint64_t)v14, (uint64_t)v13);
      sub_24219947C();

      sub_242199778();
      v45 = v167;
      v70 = v168;
      if (v52)
        goto LABEL_20;
LABEL_21:
      if (__OFADD__(v70, 1))
      {
        __break(1u);
        goto LABEL_66;
      }
      sub_242199408();
      if (v72 == v73)
        goto LABEL_64;
      sub_242199538();
      if (!v74)
      {
        sub_2421992DC();
        if (v72 == v73)
          goto LABEL_64;
        sub_2421992F8();
        if (!v74)
        {
          sub_2421992DC();
          if (v72 == v73)
            goto LABEL_64;
          sub_2421992F8();
          if (!v74)
          {
            sub_2421992DC();
            if (v72 == v73)
              goto LABEL_64;
            sub_2421992F8();
            if (!v74)
            {
              sub_2421992DC();
              if (v72 == v73)
                goto LABEL_64;
              sub_2421992F8();
              if (!v74)
              {
                sub_242199408();
                if (v72 == v73)
                {
LABEL_64:
                  sub_242199B38();
                  sub_2421992BC();
                  sub_2421993A4();
                  goto LABEL_106;
                }
                sub_242199820();
                if (!v74)
                  break;
              }
            }
          }
        }
      }
LABEL_44:
      v52 = (v74 - 1) & v74;
      sub_2421997E0();
    }
    while (!__OFADD__(v75, 1))
    {
      sub_2421992DC();
      if (v72 == v73)
        goto LABEL_64;
      sub_242199528();
      if (v74)
        goto LABEL_44;
    }
    __break(1u);
  }
  else
  {
    v168 = v0;
    v89 = sub_242199880();
    v90(v89, v13, v14);
    v91 = (void *)objc_opt_self();
    v50 = (uint64_t)sub_242199A44(v91, sel_sharedManager);
    if (qword_2543A6838 != -1)
LABEL_66:
      swift_once();
    v92 = (void *)sub_242199474();
    v93 = objc_msgSend((id)v50, sel_subscriptionsForSubscriber_, v92);

    v50 = MEMORY[0x24BEE4AF8];
    if (!v93)
      goto LABEL_70;
    sub_24219971C(v94, &qword_2543A68F0);
    v47 = sub_242199A38();

    if (!(v47 >> 62))
    {
      v96 = *(_QWORD *)((v47 & 0xFFFFFFFFFFFFF8) + 0x10);
      if (!v96)
      {
LABEL_69:
        sub_242199434();
        goto LABEL_70;
      }
      goto LABEL_55;
    }
  }
  sub_242199588();
  v96 = sub_2421AFD00();
  v95 = sub_242199434();
  if (!v96)
    goto LABEL_69;
LABEL_55:
  v172[0] = v50;
  sub_242199688(v95, v96 & ~(v96 >> 63));
  if (v96 < 0)
  {
LABEL_109:
    __break(1u);
    goto LABEL_110;
  }
  v97 = 0;
  v50 = v172[0];
  do
  {
    if ((v47 & 0xC000000000000001) != 0)
      v98 = (id)MEMORY[0x2426A4C4C](v97, v47);
    else
      v98 = *(id *)(v47 + 8 * v97 + 32);
    v99 = objc_msgSend(v98, sel_name, v155[0]);
    sub_2421AFA90();
    sub_242199A7C();

    v172[0] = v50;
    v45 = *(_QWORD *)(v50 + 16);
    v100 = *(_QWORD *)(v50 + 24);
    if (v45 >= v100 >> 1)
    {
      sub_2421996BC((char *)(v100 > 1), v45 + 1);
      v50 = v172[0];
    }
    ++v97;
    *(_QWORD *)(v50 + 16) = v45 + 1;
    v101 = v50 + 16 * v45;
    *(_QWORD *)(v101 + 32) = v13;
    *(_QWORD *)(v101 + 40) = v1;
  }
  while (v96 != v97);
  sub_242199434();
  v14 = v157;
LABEL_70:
  v0 = v168;
  if (*(_QWORD *)(sub_242197A64(v167, (_QWORD *)v50) + 16))
  {
    v102 = sub_242199AB0();
    sub_24219794C(v102);
    sub_242199698();
    v103 = sub_242199AF8();
    v104(v103);
    sub_242199800(v45, 0);
    sub_2421998E8();
    sub_242199B0C();
    v105 = sub_24219946C();
    sub_242199B40(v105, &qword_2543A67F0);
    sub_242199618();
    v108 = 1 << v107;
    v109 = -1;
    if (v108 < 64)
      v109 = ~(-1 << v108);
    v110 = v109 & v106;
    v111 = sub_242199484();
    v155[0] = (uint64_t)v155;
    v165 = (_QWORD *)v111;
    sub_2421994B8();
    v113 = MEMORY[0x24BDAC7A8](v112);
    sub_242199364(v113, v114, v115, v116, v117, v118, v119, v120, v155[0]);
    v121 = 0;
    v163 = xmmword_2421B0720;
    v14 = v165;
    if (!v110)
      goto LABEL_75;
LABEL_74:
    sub_2421997B0();
    while (1)
    {
      sub_2421995F8(v122);
      sub_2421999D0();
      v126 = MEMORY[0x24BDAC7A8](v125);
      sub_2421994D0(v126, v127, v128, v129, v130, v131, v132, v133, v155[0]);
      v134 = sub_2421AF6DC();
      v136 = v135;
      v137 = sub_242199AA0(v134, sel_sharedManager);
      v138 = (void *)sub_242199474();
      sub_24218D500(&qword_2543A6940);
      v139 = (__n128 *)sub_2421993E0();
      sub_242199870(v139);
      *(_QWORD *)(v140 + 32) = v134;
      *(_QWORD *)(v140 + 40) = v136;
      swift_bridgeObjectRetain();
      v141 = (void *)sub_2421AFAF0();
      sub_242199434();
      sub_2421993D4(v137, sel_unsubscribe_subscriptionNames_queue_completion_, (uint64_t)v138, (uint64_t)v141);
      sub_24219978C();

      sub_2421998A8();
      v121 = v168;
      if (v110)
        goto LABEL_74;
LABEL_75:
      v50 = v167;
      if (__OFADD__(v121, 1))
      {
        __break(1u);
        goto LABEL_108;
      }
      sub_242199408();
      if (v72 == v73)
        goto LABEL_101;
      sub_242199538();
      if (!v123)
      {
        sub_2421992DC();
        if (v72 == v73)
          goto LABEL_101;
        sub_2421992F8();
        if (!v123)
        {
          sub_2421992DC();
          if (v72 == v73)
            goto LABEL_101;
          sub_2421992F8();
          if (!v123)
          {
            sub_2421992DC();
            if (v72 == v73)
              goto LABEL_101;
            sub_2421992F8();
            if (!v123)
            {
              sub_2421992DC();
              if (v72 == v73)
                goto LABEL_101;
              sub_2421992F8();
              if (!v123)
              {
                sub_242199408();
                if (v72 == v73)
                {
LABEL_101:
                  sub_24219946C();
                  v142 = sub_2421996D4();
                  sub_2421993CC(v142, v143);
                  sub_2421992BC();
                  sub_24219946C();
                  goto LABEL_106;
                }
                sub_242199820();
                if (!v123)
                  break;
              }
            }
          }
        }
      }
LABEL_98:
      v110 = (v123 - 1) & v123;
      sub_2421997E0();
    }
    while (!__OFADD__(v124, 1))
    {
      sub_2421992DC();
      if (v72 == v73)
        goto LABEL_101;
      sub_242199528();
      if (v123)
        goto LABEL_98;
    }
LABEL_108:
    __break(1u);
    goto LABEL_109;
  }
  sub_242199698();
  if (qword_2543A6928 != -1)
LABEL_110:
    swift_once();
  v144 = sub_242199940();
  sub_24218E28C(v144, (uint64_t)qword_2543A6B78);
  sub_242199738();
  sub_2421995C8();
  MEMORY[0x24BDAC7A8](v145);
  sub_2421994F8(v146, v155[0]);
  sub_2421AF928();
  v147 = sub_242199868();
  if (sub_24219965C(v147))
  {
    sub_24218D61C();
    v172[0] = sub_242199574();
    v148 = sub_242199560(4.8149e-34);
    sub_242199764(v148, v149);
    v169 = v150;
    sub_2421AFBEC();
    sub_24219947C();
    sub_242199354();
    sub_2421995B4(&dword_24218A000, v151, v152, "No existing subscriptions to expire with requestResourcesKey %s");
    sub_242199630();
    sub_24218D600();
  }
  sub_242199354();

  sub_24219971C(v153, (unint64_t *)&qword_2543A69A8);
  sub_2421998E8();
  v154 = (void *)sub_2421AFBD4();
  ((void (*)(uint64_t *, void *, _QWORD))v0[2])(v0, v154, 0);

  _Block_release(v0);
  (*(void (**)(uint64_t, _QWORD *))(v159 + 8))(v158, v14);
  sub_2421992BC();
LABEL_106:
  sub_2421998C8();
  sub_2421998C8();
  sub_2421998C8();
  sub_2421998C8();
  sub_242199304();
}

void sub_242190F68()
{
  sub_242190F7C();
}

void sub_242190F7C()
{
  unint64_t v0;
  uint64_t *v1;
  void (*v2)(_QWORD);
  void (*v3)(_QWORD);
  uint64_t (*v4)(char *);
  uint64_t (*v5)(char *);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
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
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
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
  unint64_t v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  char v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
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
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  char v72;
  char v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
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
  id v88;
  void *v89;
  uint64_t v90;
  void *v91;
  void *v92;
  id v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  id v97;
  unint64_t v98;
  unint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  char v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  char *v126;
  uint64_t v127;
  uint64_t v128;
  char *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  id v133;
  void *v134;
  __n128 *v135;
  uint64_t v136;
  void *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  os_log_type_t v141;
  uint64_t v142;
  unint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  void *v148;
  uint64_t v149[2];
  uint64_t *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  char *v157;
  unint64_t v158;
  __int128 v159;
  char *v160;
  __int128 v161;
  uint64_t v162;
  uint64_t *v163;
  uint64_t v164;
  uint64_t v165;
  _QWORD v166[3];
  uint64_t v167;
  uint64_t v168;
  _QWORD v169[6];

  sub_242199548();
  v3 = v2;
  v5 = v4;
  v7 = v6;
  *(_QWORD *)&v161 = v8;
  v10 = v9;
  v162 = v11;
  sub_24218D500(&qword_2543A67F0);
  sub_2421992E8();
  MEMORY[0x24BDAC7A8](v12);
  sub_24218D690();
  sub_24218D648();
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)v149 - v14;
  v156 = sub_242199938();
  v154 = *(_QWORD *)(v156 - 8);
  sub_242199348();
  MEMORY[0x24BDAC7A8](v16);
  sub_242199AB8();
  v153 = v17;
  sub_2421997A8();
  sub_2421992E8();
  MEMORY[0x24BDAC7A8](v18);
  v152 = sub_2421996A0();
  v151 = *(_QWORD *)(v152 - 8);
  sub_242199348();
  MEMORY[0x24BDAC7A8](v19);
  sub_24219943C();
  v155 = v7;
  swift_retain_n();
  sub_242199A88();
  sub_242199A68();
  v20 = sub_2421998B8();
  v21 = *(_QWORD *)(v20 + 16);
  if (v21)
  {
    v150 = (uint64_t *)v5;
    v157 = v15;
    v158 = v10;
    v160 = (char *)v3;
    v22 = MEMORY[0x24BEE4AF8];
    v149[1] = v20;
    v3 = (void (*)(_QWORD))(v20 + 32);
    do
    {
      sub_2421929F8((uint64_t)v3, (uint64_t)v169);
      v23 = sub_242199484();
      v24 = *(uint64_t **)(v23 - 8);
      v25 = v24[8];
      MEMORY[0x24BDAC7A8](v23);
      sub_242199A24((uint64_t)v149);
      sub_24218D500(&qword_2543A6A60);
      v1 = v149;
      sub_2421992E8();
      MEMORY[0x24BDAC7A8](v26);
      sub_24219943C();
      sub_242199744();
      sub_24218D500(&qword_2543A67F8);
      sub_24218D500(&qword_2543A6808);
      v27 = sub_242199454();
      v165 = v25;
      if (v27)
      {
        v163 = v24;
        v28 = v22;
        v30 = v167;
        v29 = v168;
        sub_242198260(v166, v167);
        v31 = v30;
        v22 = v28;
        v1 = v149;
        v24 = v163;
        MEMORY[0x2426A4724](v31, v29);
        sub_242199800(v0, 0);
        sub_24218E18C((uint64_t)v166);
      }
      else
      {
        v32 = sub_242199724();
        sub_242199198(v32, &qword_2543A6A68);
        sub_242199800(v0, 1);
      }
      sub_242199A08();
      if (sub_242199AEC(v0) == 1)
      {
        sub_242199198(v0, &qword_2543A6A60);
      }
      else
      {
        v33 = v22;
        v34 = v164;
        v35 = sub_242199A58(v164, v0);
        v163 = v149;
        MEMORY[0x24BDAC7A8](v35);
        v165 = (uint64_t)v149 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
        v37 = v34;
        v22 = v33;
        sub_242199A58(v165, v37);
        if ((sub_242199908() & 1) == 0)
        {
          v40 = sub_2421998F8();
          v22 = sub_2421A00F0(v40, v41, v42, v33);
        }
        v0 = *(_QWORD *)(v22 + 16);
        v38 = *(_QWORD *)(v22 + 24);
        if (v0 >= v38 >> 1)
          v22 = sub_2421A00F0(v38 > 1, v0 + 1, 1, v22);
        *(_QWORD *)(v22 + 16) = v0 + 1;
        sub_24219979C();
        sub_242199A58(v22 + v39 + v24[9] * v0, v165);
        v1 = v163;
      }
      v3 = (void (*)(_QWORD))((char *)v3 + 40);
      --v21;
    }
    while (v21);
    sub_242199794();
    sub_242199B18();
    v10 = v158;
    v15 = v157;
    v5 = (uint64_t (*)(char *))v150;
  }
  else
  {
    v43 = swift_bridgeObjectRelease();
  }
  MEMORY[0x24BDAC7A8](v43);
  sub_242199948();
  sub_242199A60(v5, v44, v45);
  v165 = v0;
  v46 = sub_242199A98();
  sub_242199158(v10, (uint64_t)v15, &qword_2543A67F0);
  if (sub_2421997EC((uint64_t)v15) == 1)
  {
    sub_242199198((uint64_t)v15, &qword_2543A67F0);
    v47 = sub_242199588();
    sub_24219794C(v47);
    sub_242199434();
    swift_retain();
    v48 = sub_2421998D0();
    v3(v48);
    sub_24219946C();
    sub_242199858();
    v50 = 1 << *(_BYTE *)(v46 + 32);
    v51 = -1;
    if (v50 < 64)
      v51 = ~(-1 << v50);
    v52 = v51 & v49;
    v53 = sub_242199484();
    sub_242199414(v53, v54, v55, v56, v57, v58, v59, v60, v149[0]);
    v62 = MEMORY[0x24BDAC7A8](v61);
    sub_24219931C(v62, v63, v64, v65, v66, v67, v68, v69, v149[0]);
    sub_242199588();
    v70 = 0;
    v161 = xmmword_2421B0720;
    v164 = v46;
    if (!v52)
      goto LABEL_21;
LABEL_20:
    v52 &= v52 - 1;
    sub_24219982C();
    while (1)
    {
      v76 = sub_2421993EC(v71);
      v10 = (unint64_t)v149;
      v77 = MEMORY[0x24BDAC7A8](v76);
      sub_24219948C(v77, v78, v79, v80, v81, v82, v83, v84, v149[0]);
      v85 = sub_2421AF6DC();
      v87 = v86;
      if (qword_2543A6AD0 != -1)
        swift_once();
      v21 = qword_2543A6AB8;
      v169[0] = v85;
      v169[1] = v87;
      sub_242199588();
      sub_242199918();
      sub_242199434();
      v88 = objc_msgSend((id)objc_opt_self(), sel_sharedManager);
      if (qword_2543A6838 != -1)
        swift_once();
      v89 = (void *)sub_242199474();
      sub_24218D500(&qword_2543A6940);
      v90 = sub_2421993E0();
      sub_24219966C(v90);
      v1 = (uint64_t *)sub_2421AFAF0();
      sub_242199770();
      sub_2421993D4(v88, sel_unsubscribe_subscriptionNames_queue_completion_, (uint64_t)v89, (uint64_t)v1);
      sub_24219947C();

      sub_242199778();
      v46 = v164;
      v70 = v165;
      if (v52)
        goto LABEL_20;
LABEL_21:
      if (__OFADD__(v70, 1))
      {
        __break(1u);
        goto LABEL_65;
      }
      sub_242199408();
      if (v72 == v73)
        goto LABEL_63;
      sub_242199538();
      if (!v74)
      {
        sub_2421992DC();
        if (v72 == v73)
          goto LABEL_63;
        sub_2421992F8();
        if (!v74)
        {
          sub_2421992DC();
          if (v72 == v73)
            goto LABEL_63;
          sub_2421992F8();
          if (!v74)
          {
            sub_2421992DC();
            if (v72 == v73)
              goto LABEL_63;
            sub_2421992F8();
            if (!v74)
            {
              sub_2421992DC();
              if (v72 == v73)
                goto LABEL_63;
              sub_2421992F8();
              if (!v74)
              {
                sub_242199408();
                if (v72 == v73)
                {
LABEL_63:
                  sub_242199698();
                  sub_2421992BC();
                  sub_242199898();
                  sub_242199434();
                  goto LABEL_106;
                }
                sub_242199820();
                if (!v74)
                  break;
              }
            }
          }
        }
      }
LABEL_44:
      v52 = (v74 - 1) & v74;
      sub_2421997E0();
    }
    while (!__OFADD__(v75, 1))
    {
      sub_2421992DC();
      if (v72 == v73)
        goto LABEL_63;
      sub_242199528();
      if (v74)
        goto LABEL_44;
    }
    __break(1u);
    goto LABEL_67;
  }
  sub_242199AE4(v153, (uint64_t)v15, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v154 + 32));
  v91 = (void *)objc_opt_self();
  v50 = (uint64_t)sub_242199A44(v91, sel_sharedManager);
  if (qword_2543A6838 != -1)
LABEL_65:
    swift_once();
  v92 = (void *)sub_242199474();
  v93 = objc_msgSend((id)v50, sel_subscriptionsForSubscriber_, v92);

  v50 = MEMORY[0x24BEE4AF8];
  if (v93)
  {
    v164 = v46;
    sub_24219971C(v94, &qword_2543A68F0);
    v10 = sub_242199A38();

    if (!(v10 >> 62))
    {
      v96 = *(_QWORD *)((v10 & 0xFFFFFFFFFFFFF8) + 0x10);
      if (!v96)
      {
LABEL_68:
        sub_2421993A4();
LABEL_69:
        v46 = v164;
        goto LABEL_70;
      }
LABEL_55:
      v160 = (char *)v3;
      v169[0] = v50;
      sub_242199688(v95, v96 & ~(v96 >> 63));
      if (v96 < 0)
      {
LABEL_109:
        __break(1u);
        goto LABEL_110;
      }
      v3 = 0;
      v50 = v169[0];
      do
      {
        if ((v10 & 0xC000000000000001) != 0)
          sub_242199B84();
        v97 = objc_msgSend(sub_242199A4C(), sel_name);
        sub_2421AFA90();
        sub_242199A7C();

        v169[0] = v50;
        v99 = *(_QWORD *)(v50 + 16);
        v98 = *(_QWORD *)(v50 + 24);
        if (v99 >= v98 >> 1)
        {
          sub_2421996BC((char *)(v98 > 1), v99 + 1);
          v50 = v169[0];
        }
        v3 = (void (*)(_QWORD))((char *)v3 + 1);
        *(_QWORD *)(v50 + 16) = v99 + 1;
        v100 = v50 + 16 * v99;
        *(_QWORD *)(v100 + 32) = v1;
        *(_QWORD *)(v100 + 40) = v21;
      }
      while ((void (*)(_QWORD))v96 != v3);
      sub_2421993A4();
      sub_242199B18();
      goto LABEL_69;
    }
LABEL_67:
    sub_242199520();
    v96 = sub_2421AFD00();
    v95 = sub_2421993A4();
    if (!v96)
      goto LABEL_68;
    goto LABEL_55;
  }
LABEL_70:
  v101 = sub_242197A64(v46, (_QWORD *)v50);
  if (*(_QWORD *)(v101 + 16))
  {
    v102 = sub_242199AB0();
    sub_24219794C(v102);
    sub_242199698();
    sub_24219970C(v159, v153, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v154 + 16));
    sub_24219980C();
    v103 = v155;
    swift_retain();
    v104 = sub_2421998D0();
    v3(v104);
    v105 = sub_24219946C();
    sub_242199B40(v105, &qword_2543A67F0);
    sub_242199618();
    v108 = 1 << v107;
    v109 = -1;
    if (v108 < 64)
      v109 = ~(-1 << v108);
    v50 = v109 & v106;
    v110 = sub_242199484();
    v150 = v149;
    v162 = v110;
    sub_2421994B8();
    MEMORY[0x24BDAC7A8](v111);
    *(_QWORD *)&v161 = v112;
    v160 = (char *)v149 - ((v112 + 15) & 0xFFFFFFFFFFFFFFF0);
    v158 = (unint64_t)(v108 + 63) >> 6;
    v164 = v101;
    sub_242199588();
    v113 = 0;
    v159 = xmmword_2421B0720;
    v114 = v162;
    if (!v50)
      goto LABEL_75;
LABEL_74:
    v50 &= v50 - 1;
    sub_24219982C();
    while (1)
    {
      v126 = v160;
      (*(void (**)(char *, uint64_t, uint64_t))(v103 + 16))(v160, *(_QWORD *)(v164 + 48) + *(_QWORD *)(v103 + 72) * v115, v114);
      sub_2421999D0();
      MEMORY[0x24BDAC7A8](v127);
      v129 = (char *)v149 - ((v128 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *, char *, uint64_t))(v103 + 32))(v129, v126, v114);
      v130 = sub_2421AF6DC();
      v132 = v131;
      v133 = sub_242199AA0(v130, sel_sharedManager);
      v134 = (void *)sub_242199474();
      sub_24218D500(&qword_2543A6940);
      v135 = (__n128 *)sub_2421993E0();
      sub_242199870(v135);
      *(_QWORD *)(v136 + 32) = v130;
      *(_QWORD *)(v136 + 40) = v132;
      sub_242199B7C();
      v137 = (void *)sub_2421AFAF0();
      sub_242199434();
      sub_2421993D4(v133, sel_unsubscribe_subscriptionNames_queue_completion_, (uint64_t)v134, (uint64_t)v137);
      sub_242199838();

      (*(void (**)(char *, uint64_t))(v103 + 8))(v129, v114);
      v113 = v165;
      if (v50)
        goto LABEL_74;
LABEL_75:
      if (__OFADD__(v113, 1))
      {
        __break(1u);
        goto LABEL_108;
      }
      sub_242199408();
      if (v72 == v73)
        goto LABEL_101;
      sub_242199538();
      if (!v116)
      {
        sub_2421992DC();
        if (v72 == v73)
          goto LABEL_101;
        sub_2421992F8();
        if (!v117)
        {
          sub_2421992DC();
          if (v72 == v73)
            goto LABEL_101;
          sub_2421992F8();
          if (!v118)
          {
            sub_2421992DC();
            if (v72 == v73)
              goto LABEL_101;
            sub_2421992F8();
            if (!v119)
            {
              sub_2421992DC();
              if (v72 == v73)
                goto LABEL_101;
              sub_2421992F8();
              if (!v120)
              {
                sub_242199408();
                if (v72 == v73)
                {
LABEL_101:
                  sub_24219946C();
                  sub_2421993CC(v153, *(uint64_t (**)(uint64_t, _QWORD))(v154 + 8));
                  sub_2421992BC();
                  sub_242199898();
                  sub_24219946C();
                  goto LABEL_106;
                }
                sub_242199820();
                if (!v122)
                  break;
              }
            }
          }
        }
      }
LABEL_98:
      sub_2421999C0();
      v50 = v125 & v124;
      sub_2421997E0();
    }
    while (!__OFADD__(v121, 1))
    {
      sub_2421992DC();
      if (v72 == v73)
        goto LABEL_101;
      sub_242199528();
      if (v123)
        goto LABEL_98;
    }
LABEL_108:
    __break(1u);
    goto LABEL_109;
  }
  sub_242199698();
  if (qword_2543A6928 != -1)
LABEL_110:
    swift_once();
  v138 = sub_242199940();
  sub_24218E28C(v138, (uint64_t)qword_2543A6B78);
  sub_242199738();
  sub_2421995C8();
  MEMORY[0x24BDAC7A8](v139);
  sub_2421994F8(v140, v149[0]);
  sub_2421AF928();
  v141 = sub_242199868();
  if (sub_24219965C(v141))
  {
    sub_24218D61C();
    v169[0] = sub_242199574();
    v142 = sub_242199560(4.8149e-34);
    sub_242199764(v142, v143);
    sub_242199640(v144);
    sub_24219947C();
    sub_242199354();
    sub_2421995B4(&dword_24218A000, v145, v146, "No existing subscriptions to expire with requestResourcesKey %s");
    sub_242199630();
    sub_24218D600();
  }
  sub_242199354();

  sub_24219971C(v147, (unint64_t *)&qword_2543A69A8);
  v148 = (void *)sub_2421AFBD4();
  ((void (*)(void *, _QWORD))v161)(v148, 0);

  sub_2421993CC(v153, *(uint64_t (**)(uint64_t, _QWORD))(v154 + 8));
  sub_2421992BC();
  swift_release_n();
LABEL_106:
  sub_242199304();
}

void sub_242191D20()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  void (*v3)(_QWORD);
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
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
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
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
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  char v69;
  char v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
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
  id v88;
  void *v89;
  void *v90;
  uint64_t v91;
  uint64_t (*v92)(uint64_t, uint64_t, uint64_t);
  void *v93;
  void *v94;
  id v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  id v100;
  id v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  unint64_t v105;
  unint64_t v106;
  _QWORD *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t (*v111)(uint64_t, uint64_t, uint64_t);
  uint64_t v112;
  uint64_t v113;
  char v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  id v143;
  __n128 *v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t (*v147)(uint64_t, _QWORD);
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  os_log_type_t v151;
  uint64_t v152;
  unint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t *v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  __int128 v166;
  void (*v167)(_QWORD);
  __int128 v168;
  uint64_t v169;
  uint64_t *v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;

  sub_242199548();
  *(_QWORD *)&v168 = v2;
  v167 = v3;
  v5 = v4;
  v7 = v6;
  sub_24218D500(&qword_2543A67F0);
  sub_2421992E8();
  MEMORY[0x24BDAC7A8](v8);
  sub_24218D690();
  sub_24218D648();
  MEMORY[0x24BDAC7A8](v9);
  v11 = (uint64_t *)((char *)&v157 - v10);
  v164 = sub_242199938();
  v163 = *(_QWORD *)(v164 - 8);
  sub_242199348();
  MEMORY[0x24BDAC7A8](v12);
  sub_242199590(v13, v157);
  sub_2421992E8();
  MEMORY[0x24BDAC7A8](v14);
  v161 = sub_2421996A0();
  v160 = *(_QWORD *)(v161 - 8);
  sub_242199348();
  MEMORY[0x24BDAC7A8](v15);
  sub_242199978();
  v18 = v17 - v16;
  sub_242199A88();
  sub_242199A68();
  v159 = v18;
  v19 = sub_2421AF580();
  v20 = *(_QWORD *)(v19 + 16);
  *(_QWORD *)&v166 = v7;
  if (v20)
  {
    v158 = v11;
    v165 = v5;
    v172 = MEMORY[0x24BEE4AF8];
    v157 = v19;
    v21 = v19 + 32;
    do
    {
      sub_2421929F8(v21, (uint64_t)&v176);
      v22 = sub_242199484();
      v23 = *(_QWORD *)(v22 - 8);
      v0 = *(_QWORD *)(v23 + 64);
      MEMORY[0x24BDAC7A8](v22);
      sub_242199A24((uint64_t)&v157);
      sub_24218D500(&qword_2543A6A60);
      sub_2421992E8();
      MEMORY[0x24BDAC7A8](v24);
      sub_242199978();
      v1 = (uint64_t *)(v26 - v25);
      sub_242199744();
      v27 = sub_24218D500(&qword_2543A67F8);
      sub_24218D500(&qword_2543A6808);
      if (sub_242199454())
      {
        v169 = v23;
        v170 = &v157;
        v29 = v174;
        v28 = v175;
        v27 = (uint64_t)sub_242198260(&v173, v174);
        v23 = v169;
        MEMORY[0x2426A4724](v29, v28);
        sub_2421999E0((uint64_t)v1);
      }
      else
      {
        v30 = sub_242199724();
        sub_242199198(v30, &qword_2543A6A68);
        sub_2421999B0((uint64_t)v1);
      }
      sub_242199A08();
      if (sub_24218E0BC((uint64_t)v1, 1, v22) == 1)
      {
        sub_242199198((uint64_t)v1, &qword_2543A6A60);
      }
      else
      {
        v170 = &v157;
        v31 = v171;
        v32 = sub_242199ADC(v171, (uint64_t)v1);
        v1 = &v157;
        MEMORY[0x24BDAC7A8](v32);
        v33 = sub_242199A10((uint64_t)&v157);
        sub_242199ADC(v33, v31);
        v0 = v23;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          v38 = sub_2421998F8();
          v172 = sub_2421A00F0(v38, v39, v40, v41);
        }
        v35 = *(_QWORD *)(v172 + 16);
        v34 = *(_QWORD *)(v172 + 24);
        if (v35 >= v34 >> 1)
          v172 = sub_2421A00F0(v34 > 1, v35 + 1, 1, v172);
        *(_QWORD *)(v172 + 16) = v35 + 1;
        sub_24219979C();
        sub_242199ADC(v37 + v36 + *(_QWORD *)(v0 + 72) * v35, v27);
      }
      v21 += 40;
      --v20;
    }
    while (v20);
    v42 = sub_242199794();
    v7 = v166;
    v5 = v165;
    v11 = v158;
  }
  else
  {
    v42 = swift_bridgeObjectRelease();
    v172 = MEMORY[0x24BEE4AF8];
  }
  v43 = (uint64_t)&v157;
  MEMORY[0x24BDAC7A8](v42);
  *(&v157 - 2) = v7;
  sub_242199A60((uint64_t (*)(char *))sub_24219928C, (uint64_t)(&v157 - 4), v172);
  v44 = sub_242199A98();
  sub_242199158(v5, (uint64_t)v11, &qword_2543A67F0);
  v45 = &unk_251332000;
  if (sub_2421997EC((uint64_t)v11) == 1)
  {
    sub_242199198((uint64_t)v11, &qword_2543A67F0);
    v46 = sub_242199750();
    sub_24219794C(v46);
    swift_bridgeObjectRelease();
    sub_2421996F4();
    sub_24219946C();
    sub_242199858();
    v43 = 1 << *(_BYTE *)(v44 + 32);
    v48 = -1;
    if (v43 < 64)
      v48 = ~(-1 << v43);
    v49 = v48 & v47;
    v50 = sub_242199484();
    sub_242199414(v50, v51, v52, v53, v54, v55, v56, v57, v157);
    v59 = MEMORY[0x24BDAC7A8](v58);
    sub_24219931C(v59, v60, v61, v62, v63, v64, v65, v66, v157);
    sub_242199750();
    v67 = 0;
    v168 = xmmword_2421B0720;
    v171 = v44;
    if (!v49)
      goto LABEL_21;
LABEL_20:
    v49 &= v49 - 1;
    sub_24219982C();
    while (1)
    {
      v81 = sub_2421993EC(v68);
      v43 = (uint64_t)&v157;
      MEMORY[0x24BDAC7A8](v81);
      sub_242199960();
      v82 = v5;
      v5 = (uint64_t)v45;
      (*(void (**)(unint64_t, uint64_t, _QWORD *))(v0 + 32))(v7, v82, v45);
      v83 = sub_2421AF6DC();
      v85 = v84;
      if (qword_2543A6AD0 != -1)
        swift_once();
      v176 = v83;
      v177 = v85;
      swift_bridgeObjectRetain();
      sub_2421AFACC();
      swift_bridgeObjectRelease();
      v87 = v176;
      v86 = v177;
      v88 = objc_msgSend((id)objc_opt_self(), sel_sharedManager);
      if (qword_2543A6838 != -1)
        swift_once();
      v89 = (void *)sub_242199474();
      sub_24218D500(&qword_2543A6940);
      v1 = (uint64_t *)sub_2421993E0();
      *((_OWORD *)v1 + 1) = v168;
      v1[4] = v87;
      v1[5] = v86;
      sub_242199714();
      v90 = (void *)sub_2421AFAF0();
      sub_242199770();
      sub_2421993D4(v88, sel_unsubscribe_subscriptionNames_queue_completion_, (uint64_t)v89, (uint64_t)v90);
      sub_24219947C();

      v45 = (_QWORD *)v5;
      (*(void (**)(unint64_t, uint64_t))(v0 + 8))(v7, v5);
      v44 = v171;
      v67 = v172;
      if (v49)
        goto LABEL_20;
LABEL_21:
      if (__OFADD__(v67, 1))
      {
        __break(1u);
        goto LABEL_65;
      }
      sub_242199408();
      if (v69 == v70)
        goto LABEL_63;
      sub_242199538();
      if (!v71)
      {
        sub_2421992DC();
        if (v69 == v70)
          goto LABEL_63;
        sub_2421992F8();
        if (!v72)
        {
          sub_2421992DC();
          if (v69 == v70)
            goto LABEL_63;
          sub_2421992F8();
          if (!v73)
          {
            sub_2421992DC();
            if (v69 == v70)
              goto LABEL_63;
            sub_2421992F8();
            if (!v74)
            {
              sub_2421992DC();
              if (v69 == v70)
                goto LABEL_63;
              sub_2421992F8();
              if (!v75)
              {
                sub_242199408();
                if (v69 == v70)
                {
LABEL_63:
                  swift_release();
                  sub_2421993AC();
                  swift_bridgeObjectRelease();
                  goto LABEL_105;
                }
                sub_242199820();
                if (!v77)
                  break;
              }
            }
          }
        }
      }
LABEL_44:
      sub_2421999C0();
      v49 = v80 & v79;
      sub_2421997E0();
    }
    while (!__OFADD__(v76, 1))
    {
      sub_2421992DC();
      if (v69 == v70)
        goto LABEL_63;
      sub_242199528();
      if (v78)
        goto LABEL_44;
    }
    __break(1u);
  }
  else
  {
    v91 = sub_242199880();
    sub_242199AE4(v91, (uint64_t)v11, v92);
    v93 = (void *)objc_opt_self();
    v45 = sub_242199A44(v93, sel_sharedManager);
    if (qword_2543A6838 != -1)
LABEL_65:
      swift_once();
    v94 = (void *)sub_242199474();
    v95 = objc_msgSend(v45, sel_subscriptionsForSubscriber_, v94);

    v45 = (_QWORD *)MEMORY[0x24BEE4AF8];
    if (!v95)
      goto LABEL_69;
    sub_24219971C(v96, &qword_2543A68F0);
    v7 = sub_2421AFAFC();

    if (!(v7 >> 62))
    {
      v98 = *(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10);
      if (!v98)
      {
LABEL_68:
        sub_2421993A4();
        goto LABEL_69;
      }
      goto LABEL_55;
    }
  }
  sub_242199520();
  v98 = sub_2421AFD00();
  v97 = sub_2421993A4();
  if (!v98)
    goto LABEL_68;
LABEL_55:
  v171 = v44;
  v172 = v0;
  v176 = (uint64_t)v45;
  sub_242199688(v97, v98 & ~(v98 >> 63));
  if (v98 < 0)
  {
LABEL_108:
    __break(1u);
    goto LABEL_109;
  }
  v99 = 0;
  v45 = (_QWORD *)v176;
  v43 = v7 & 0xC000000000000001;
  do
  {
    if (v43)
      sub_242199B84();
    v100 = sub_242199A4C();
    v101 = objc_msgSend(v100, sel_name);
    v102 = sub_2421AFA90();
    v104 = v103;

    v176 = (uint64_t)v45;
    v106 = v45[2];
    v105 = v45[3];
    v1 = (uint64_t *)(v106 + 1);
    if (v106 >= v105 >> 1)
    {
      sub_2421996BC((char *)(v105 > 1), v106 + 1);
      v45 = (_QWORD *)v176;
    }
    ++v99;
    v45[2] = v1;
    v107 = &v45[2 * v106];
    v107[4] = v102;
    v107[5] = v104;
  }
  while (v98 != v99);
  sub_2421993A4();
  v44 = v171;
LABEL_69:
  if (*(_QWORD *)(sub_242197A64(v44, v45) + 16))
  {
    v108 = sub_242199AB0();
    sub_24219794C(v108);
    sub_242199698();
    v109 = sub_242199AF8();
    sub_24219970C(v109, v110, v111);
    sub_24219980C();
    sub_2421996F4();
    v112 = swift_release();
    sub_242199B40(v112, &qword_2543A67F0);
    sub_242199618();
    v43 = 1 << v114;
    v115 = -1;
    if (v43 < 64)
      v115 = ~(-1 << v43);
    v116 = v115 & v113;
    v117 = sub_242199484();
    v158 = &v157;
    v169 = v117;
    sub_2421994B8();
    v119 = MEMORY[0x24BDAC7A8](v118);
    sub_242199364(v119, v120, v121, v122, v123, v124, v125, v126, v157);
    v127 = 0;
    v166 = xmmword_2421B0720;
    if (!v116)
      goto LABEL_74;
LABEL_73:
    sub_2421997B0();
    while (1)
    {
      sub_2421995F8(v128);
      sub_2421999D0();
      v132 = MEMORY[0x24BDAC7A8](v131);
      sub_2421994D0(v132, v133, v134, v135, v136, v137, v138, v139, v157);
      v140 = sub_2421AF6DC();
      v142 = v141;
      v143 = sub_242199AA0(v140, sel_sharedManager);
      v1 = (uint64_t *)sub_242199474();
      sub_24218D500(&qword_2543A6940);
      v144 = (__n128 *)sub_2421993E0();
      sub_242199870(v144);
      *(_QWORD *)(v145 + 32) = v140;
      *(_QWORD *)(v145 + 40) = v142;
      sub_242199588();
      v43 = sub_2421AFAF0();
      sub_2421993A4();
      sub_2421993D4(v143, sel_unsubscribe_subscriptionNames_queue_completion_, (uint64_t)v1, v43);
      sub_242199434();

      sub_2421998A8();
      v127 = v172;
      if (v116)
        goto LABEL_73;
LABEL_74:
      if (__OFADD__(v127, 1))
      {
        __break(1u);
        goto LABEL_107;
      }
      sub_242199408();
      if (v69 == v70)
        goto LABEL_100;
      sub_242199538();
      if (!v129)
      {
        sub_2421992DC();
        if (v69 == v70)
          goto LABEL_100;
        sub_2421992F8();
        if (!v129)
        {
          sub_2421992DC();
          if (v69 == v70)
            goto LABEL_100;
          sub_2421992F8();
          if (!v129)
          {
            sub_2421992DC();
            if (v69 == v70)
              goto LABEL_100;
            sub_2421992F8();
            if (!v129)
            {
              sub_2421992DC();
              if (v69 == v70)
                goto LABEL_100;
              sub_2421992F8();
              if (!v129)
              {
                sub_242199408();
                if (v69 == v70)
                {
LABEL_100:
                  sub_24219946C();
                  v146 = sub_2421996D4();
                  sub_2421993CC(v146, v147);
                  sub_2421993AC();
                  sub_24219946C();
                  goto LABEL_105;
                }
                sub_242199820();
                if (!v129)
                  break;
              }
            }
          }
        }
      }
LABEL_97:
      v116 = (v129 - 1) & v129;
      sub_2421997E0();
    }
    while (!__OFADD__(v130, 1))
    {
      sub_2421992DC();
      if (v69 == v70)
        goto LABEL_100;
      sub_242199528();
      if (v129)
        goto LABEL_97;
    }
LABEL_107:
    __break(1u);
    goto LABEL_108;
  }
  sub_242199698();
  if (qword_2543A6928 != -1)
LABEL_109:
    swift_once();
  v148 = sub_242199940();
  sub_24218E28C(v148, (uint64_t)qword_2543A6B78);
  sub_242199738();
  sub_2421995C8();
  MEMORY[0x24BDAC7A8](v149);
  sub_24219970C((uint64_t)&v157 - ((v150 + 15) & 0xFFFFFFFFFFFFFFF0), v166, (uint64_t (*)(uint64_t, uint64_t, uint64_t))v1[2]);
  sub_2421AF928();
  v151 = sub_242199868();
  if (sub_24219965C(v151))
  {
    sub_24218D61C();
    v176 = sub_242199574();
    v152 = sub_242199560(4.8149e-34);
    sub_242199764(v152, v153);
    sub_242199640(v154);
    sub_24219947C();
    sub_242199354();
    sub_2421995B4(&dword_24218A000, v155, v156, "No existing subscriptions to expire with requestResourcesKey %s");
    sub_242199630();
    sub_24218D600();
  }
  sub_242199354();

  v167(0);
  sub_2421993CC(v162, *(uint64_t (**)(uint64_t, _QWORD))(v163 + 8));
  sub_2421993AC();
LABEL_105:
  sub_242199304();
}

uint64_t sub_2421929F8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_242192A3C()
{
  strcpy((char *)qword_2543A6820, "model-catalog");
  unk_2543A682E = -4864;
}

void sub_242192A6C()
{
  qword_2543A6AB8 = 0x6E6972697078652DLL;
  unk_2543A6AC0 = 0xE900000000000067;
}

void sub_242192A94()
{
  uint64_t v0;
  uint64_t inited;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  uint64_t v17;
  char v18;
  BOOL v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  unint64_t v33;
  uint64_t v34;
  _BOOL8 v35;
  uint64_t v36;
  char v37;
  unint64_t v38;
  char v39;
  _QWORD *v40;
  uint64_t *v41;
  _QWORD *v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t *v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  int64_t v58;
  void (*v59)(uint64_t *__return_ptr, _QWORD *);
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  _QWORD v67[4];
  _QWORD *v68;
  _QWORD v69[2];
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  void (*v73)(uint64_t *__return_ptr, _QWORD *);
  uint64_t v74;

  sub_242199548();
  sub_24218D500(&qword_2543A6900);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2421B0720;
  *(_QWORD *)(inited + 32) = 0x75676E616C2E636DLL;
  *(_QWORD *)(inited + 40) = 0xEB00000000656761;
  *(_QWORD *)(inited + 48) = 0x636972656E6567;
  *(_QWORD *)(inited + 56) = 0xE700000000000000;
  v2 = (_QWORD *)sub_2421AF9F4();
  v3 = sub_2421AF61C();
  v4 = *(_QWORD *)(v3 + 16);
  if (v4)
  {
    v5 = sub_2421AF634();
    v55 = *(_QWORD *)(v5 - 8);
    sub_24219979C();
    v52 = v3 + v8;
    v49 = v3;
    v48 = v4;
    v47 = v6;
    while (v7 < *(_QWORD *)(v3 + 16))
    {
      v53 = &v46;
      v54 = v7;
      MEMORY[0x24BDAC7A8](v6);
      sub_242199988();
      (*(void (**)(uint64_t))(v9 + 16))(v0);
      if ((sub_2421AF604() & 1) != 0)
      {
        v56 = v0;
        v10 = sub_2421AF610();
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v68 = v2;
        sub_242198E2C(v10, (uint64_t)sub_2421AEB00, 0, v69);
        v61 = v74;
        v60 = v69[0];
        v57 = v69[1];
        v62 = v71;
        v12 = v72;
        v59 = v73;
        v50 = v70;
        v58 = (unint64_t)(v70 + 64) >> 6;
        v51 = v10;
        sub_242199714();
        while (1)
        {
          if (v12)
          {
            v13 = __clz(__rbit64(v12));
            v12 &= v12 - 1;
            v14 = v13 | (v62 << 6);
          }
          else
          {
            v15 = v62 + 1;
            if (__OFADD__(v62, 1))
              goto LABEL_46;
            v0 = v56;
            if (v15 >= v58)
              goto LABEL_38;
            v16 = *(_QWORD *)(v57 + 8 * v15);
            v17 = v62 + 1;
            if (!v16)
            {
              sub_2421999A0();
              if (v18 == v19)
                goto LABEL_38;
              sub_242199928();
              if (!v16)
              {
                sub_2421999A0();
                if (v18 == v19)
                  goto LABEL_38;
                sub_242199928();
                if (!v16)
                {
                  sub_2421999A0();
                  if (v18 == v19)
                    goto LABEL_38;
                  sub_242199928();
                  if (!v16)
                  {
                    sub_242199408();
                    if (v18 == v19)
                      goto LABEL_38;
                    v16 = *(_QWORD *)(v57 + 8 * v17);
                    if (!v16)
                    {
                      while (1)
                      {
                        sub_242199408();
                        if (v18 == v19)
                          break;
                        v16 = *(_QWORD *)(v57 + 8 * v20);
                        v21 = v20 + 1;
                        if (v16)
                        {
                          v17 = v21 - 1;
                          goto LABEL_27;
                        }
                      }
LABEL_38:
                      sub_242199794();
                      sub_242198FFC();
                      sub_242199A00();
                      swift_release();
                      v3 = v49;
                      v4 = v48;
                      v5 = v47;
                      goto LABEL_39;
                    }
                  }
                }
              }
            }
LABEL_27:
            v12 = (v16 - 1) & v16;
            v14 = __clz(__rbit64(v16)) + (v17 << 6);
            v62 = v17;
          }
          v22 = (uint64_t *)(*(_QWORD *)(v60 + 48) + 16 * v14);
          v23 = *v22;
          v24 = v22[1];
          v25 = (uint64_t *)(*(_QWORD *)(v60 + 56) + 16 * v14);
          v26 = *v25;
          v27 = v25[1];
          v67[0] = v23;
          v67[1] = v24;
          v67[2] = v26;
          v67[3] = v27;
          sub_242199520();
          sub_242199B7C();
          v59(&v63, v67);
          sub_242199838();
          sub_2421993A4();
          v28 = v63;
          v29 = v64;
          v30 = v65;
          v31 = v66;
          v33 = sub_242197484(v63, v64);
          v34 = v2[2];
          v35 = (v32 & 1) == 0;
          v36 = v34 + v35;
          if (__OFADD__(v34, v35))
            break;
          v37 = v32;
          if (v2[3] >= v36)
          {
            if ((isUniquelyReferenced_nonNull_native & 1) == 0)
            {
              sub_24218D500(&qword_2543A6B10);
              sub_2421AFCD0();
            }
          }
          else
          {
            sub_2421974E8(v36, isUniquelyReferenced_nonNull_native & 1);
            v38 = sub_242197484(v28, v29);
            if ((v37 & 1) != (v39 & 1))
            {
              sub_2421AFD6C();
              __break(1u);
              return;
            }
            v33 = v38;
          }
          v2 = v68;
          if ((v37 & 1) != 0)
          {
            sub_2421993A4();
            v40 = (_QWORD *)(v2[7] + 16 * v33);
            swift_bridgeObjectRelease();
            *v40 = v30;
            v40[1] = v31;
            isUniquelyReferenced_nonNull_native = 1;
          }
          else
          {
            sub_2421996C4((uint64_t)&v68[v33 >> 6]);
            v41 = (uint64_t *)(v2[6] + 16 * v33);
            *v41 = v28;
            v41[1] = v29;
            v42 = (_QWORD *)(v2[7] + 16 * v33);
            *v42 = v30;
            v42[1] = v31;
            v43 = v2[2];
            v19 = __OFADD__(v43, 1);
            v44 = v43 + 1;
            if (v19)
              goto LABEL_45;
            v2[2] = v44;
            isUniquelyReferenced_nonNull_native = 1;
          }
        }
        __break(1u);
LABEL_45:
        __break(1u);
LABEL_46:
        __break(1u);
        break;
      }
LABEL_39:
      v45 = v54 + 1;
      v6 = (*(uint64_t (**)(uint64_t, uint64_t))(v55 + 8))(v0, v5);
      v7 = v45;
      if (v45 == v4)
        goto LABEL_40;
    }
    __break(1u);
    goto LABEL_48;
  }
LABEL_40:
  swift_bridgeObjectRelease();
  if (qword_2543A6AE8 != -1)
LABEL_48:
    swift_once();
  if (byte_2543A6BA8 == 1)
  {
    swift_isUniquelyReferenced_nonNull_native();
    v67[0] = v2;
    sub_2421AE7A8();
    sub_242199A00();
  }
  sub_242199304();
}

void sub_242193034(uint64_t a1, uint64_t a2, uint64_t a3, void (**a4)(const void *, _QWORD, void *))
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t isUniquelyReferenced_nonNull_native;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(char *, uint64_t, uint64_t);
  uint64_t v39;
  int64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t);
  uint64_t v52;
  uint64_t v53;
  unint64_t *v54;
  unint64_t v55;
  void *v56;
  uint64_t v57;
  void (**v58)(const void *, _QWORD, void *);
  void *v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t *v71;
  char *v72;
  int64_t v73;
  uint64_t v74;
  uint64_t v75;
  void (*v76)(char *, char *, uint64_t);
  char *v77;
  uint64_t v78;
  uint64_t v79;
  unint64_t v80;
  unint64_t v81;
  char v82;
  unint64_t v83;
  char v84;
  uint64_t v85;
  unint64_t v86;
  char v87;
  _QWORD *v88;
  _QWORD *v89;
  _QWORD *v90;
  _QWORD *v91;
  uint64_t v92;
  BOOL v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  int v99;
  uint64_t v100;
  char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  void (**v109)(const void *, _QWORD, void *);
  uint64_t v110;
  uint64_t v111;
  unint64_t v112;
  uint64_t v113;
  uint64_t *v114;
  uint64_t *v115;
  void (*v116)(char *, uint64_t);
  uint64_t v117;
  void (*v118)(char *, uint64_t, uint64_t);
  int64_t v119;
  void (*v120)(char *, uint64_t, uint64_t);
  unint64_t v121;
  unint64_t v122;
  unint64_t v123;

  v104 = a3;
  v105 = a2;
  v6 = sub_24218D500(&qword_2543A67F0);
  MEMORY[0x24BDAC7A8](v6);
  v103 = (uint64_t)&v100 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a4;
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = sub_2421992A4;
  *(_QWORD *)(v9 + 24) = v8;
  v107 = v9;
  v108 = v8;
  v10 = *(_QWORD *)(a1 + 16);
  v109 = a4;
  if (v10)
  {
    v11 = a1;
    v12 = MEMORY[0x24BEE4AF8];
    _Block_copy(a4);
    v122 = v12;
    swift_retain();
    sub_2421A2F74(0, v10, 0);
    isUniquelyReferenced_nonNull_native = sub_2421AF70C();
    v14 = isUniquelyReferenced_nonNull_native;
    v15 = *(_QWORD *)(isUniquelyReferenced_nonNull_native - 8);
    v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
    v106 = v11;
    v17 = v11 + v16;
    v19 = *(_QWORD *)(v15 + 64);
    v18 = *(_QWORD *)(v15 + 72);
    v120 = *(void (**)(char *, uint64_t, uint64_t))(v15 + 16);
    v121 = v18;
    v119 = v10;
    do
    {
      MEMORY[0x24BDAC7A8](isUniquelyReferenced_nonNull_native);
      v120((char *)&v100 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0), v17, v14);
      v20 = sub_2421AF6DC();
      v22 = v21;
      (*(void (**)(char *, uint64_t))(v15 + 8))((char *)&v100 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0), v14);
      v23 = v122;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        isUniquelyReferenced_nonNull_native = (uint64_t)sub_2421A2F74(0, *(_QWORD *)(v23 + 16) + 1, 1);
        v23 = v122;
      }
      v25 = *(_QWORD *)(v23 + 16);
      v24 = *(_QWORD *)(v23 + 24);
      if (v25 >= v24 >> 1)
      {
        isUniquelyReferenced_nonNull_native = (uint64_t)sub_2421A2F74((char *)(v24 > 1), v25 + 1, 1);
        v23 = v122;
      }
      *(_QWORD *)(v23 + 16) = v25 + 1;
      v26 = v23 + 16 * v25;
      *(_QWORD *)(v26 + 32) = v20;
      *(_QWORD *)(v26 + 40) = v22;
      v17 += v121;
      --v10;
    }
    while (v10);
    a1 = v106;
    v10 = v119;
  }
  else
  {
    _Block_copy(a4);
    swift_retain();
    v23 = MEMORY[0x24BEE4AF8];
  }
  sub_24219CC10(v23);
  if (*(_QWORD *)(v27 + 16) != 1 || (v28 = sub_242195E3C(v27), !v29))
  {
    v50 = sub_2421AF598();
    v51 = (uint64_t (*)(uint64_t))MEMORY[0x24BE682E0];
    v52 = *(_QWORD *)(v50 - 8);
    MEMORY[0x24BDAC7A8](v50);
    v54 = (unint64_t *)((char *)&v100 - ((v53 + 15) & 0xFFFFFFFFFFFFFFF0));
    v122 = 0;
    v123 = 0xE000000000000000;
    sub_2421AFC58();
    swift_bridgeObjectRelease();
    v122 = 0xD00000000000002CLL;
    v123 = 0x80000002421B1730;
    sub_2421AFB5C();
    sub_2421AFACC();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v55 = v123;
    *v54 = v122;
    v54[1] = v55;
    (*(void (**)(unint64_t *, _QWORD, uint64_t))(v52 + 104))(v54, *MEMORY[0x24BE682D8], v50);
    sub_242199250(&qword_2571DF328, v51, MEMORY[0x24BE682E8]);
    v56 = (void *)swift_allocError();
    (*(void (**)(uint64_t, unint64_t *, uint64_t))(v52 + 16))(v57, v54, v50);
    v58 = v109;
    _Block_copy(v109);
    v59 = (void *)sub_2421AF3E8();
    v58[2](v58, 0, v59);

    _Block_release(v58);
    (*(void (**)(unint64_t *, uint64_t))(v52 + 8))(v54, v50);
    swift_release();
    swift_release();
    _Block_release(v58);
    return;
  }
  v30 = (char *)v28;
  v31 = v29;
  swift_bridgeObjectRelease();
  if (v10)
  {
    v101 = v30;
    v102 = v31;
    v122 = MEMORY[0x24BEE4AF8];
    sub_2421A2F74(0, v10, 0);
    v32 = sub_2421AF70C();
    v33 = v32;
    v34 = *(_QWORD *)(v32 - 8);
    v35 = (*(unsigned __int8 *)(v34 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v34 + 80);
    v106 = a1;
    v36 = a1 + v35;
    v37 = *(_QWORD *)(v34 + 72);
    v120 = *(void (**)(char *, uint64_t, uint64_t))(v34 + 64);
    v38 = *(void (**)(char *, uint64_t, uint64_t))(v34 + 16);
    v117 = v37;
    v118 = v38;
    v39 = v36;
    v40 = v10;
    v113 = v32;
    do
    {
      MEMORY[0x24BDAC7A8](v32);
      v42 = (char *)&v100 - ((v41 + 15) & 0xFFFFFFFFFFFFFFF0);
      v118(v42, v36, v33);
      v43 = sub_2421AF6D0();
      v45 = v44;
      v116 = *(void (**)(char *, uint64_t))(v34 + 8);
      v116(v42, v33);
      v46 = v122;
      v32 = swift_isUniquelyReferenced_nonNull_native();
      if ((v32 & 1) == 0)
      {
        v32 = (uint64_t)sub_2421A2F74(0, *(_QWORD *)(v46 + 16) + 1, 1);
        v46 = v122;
      }
      v48 = *(_QWORD *)(v46 + 16);
      v47 = *(_QWORD *)(v46 + 24);
      if (v48 >= v47 >> 1)
      {
        v32 = (uint64_t)sub_2421A2F74((char *)(v47 > 1), v48 + 1, 1);
        v46 = v122;
      }
      *(_QWORD *)(v46 + 16) = v48 + 1;
      v49 = v46 + 16 * v48;
      *(_QWORD *)(v49 + 32) = v43;
      *(_QWORD *)(v49 + 40) = v45;
      v36 += v117;
      --v40;
      v33 = v113;
    }
    while (v40);
    v60 = swift_bridgeObjectRetain();
    v112 = MEMORY[0x24BEE4B00];
    v61 = &qword_2543A6970;
    v62 = v39;
    while (1)
    {
      v119 = v10;
      v121 = v46;
      v115 = &v100;
      MEMORY[0x24BDAC7A8](v60);
      v64 = (char *)&v100 - ((v63 + 15) & 0xFFFFFFFFFFFFFFF0);
      v118(v64, v62, v33);
      v65 = sub_2421AF784();
      v114 = &v100;
      v66 = *(_QWORD *)(v65 - 8);
      MEMORY[0x24BDAC7A8](v65);
      v68 = (char *)&v100 - ((v67 + 15) & 0xFFFFFFFFFFFFFFF0);
      v69 = sub_24218D500(v61);
      MEMORY[0x24BDAC7A8](v69);
      v71 = v61;
      v72 = (char *)&v100 - ((v70 + 15) & 0xFFFFFFFFFFFFFFF0);
      sub_2421AF6E8();
      if (sub_24218E0BC((uint64_t)v72, 1, v65) == 1)
      {
        sub_242199198((uint64_t)v72, v71);
        v46 = v121;
        v61 = v71;
        v73 = v119;
      }
      else
      {
        v30 = v64;
        v74 = v62;
        v75 = v66;
        v76 = *(void (**)(char *, char *, uint64_t))(v66 + 32);
        v110 = v65;
        v76(v68, v72, v65);
        v77 = v68;
        v78 = sub_2421AF760();
        v31 = v79;
        v80 = v112;
        swift_isUniquelyReferenced_nonNull_native();
        v122 = v80;
        v111 = v78;
        v81 = sub_242197484(v78, v31);
        if (__OFADD__(*(_QWORD *)(v80 + 16), (v82 & 1) == 0))
        {
          __break(1u);
LABEL_40:
          __break(1u);
          goto LABEL_41;
        }
        v83 = v81;
        v84 = v82;
        sub_24218D500(&qword_2543A6B10);
        v85 = v75;
        v62 = v74;
        v64 = v30;
        if ((sub_2421AFCC4() & 1) != 0)
        {
          v86 = sub_242197484(v111, v31);
          if ((v84 & 1) != (v87 & 1))
          {
            swift_release();
            swift_release();
            _Block_release(v109);
            sub_2421AFD6C();
            __break(1u);
            return;
          }
          v83 = v86;
        }
        v88 = (_QWORD *)v122;
        v112 = v122;
        if ((v84 & 1) != 0)
        {
          v89 = (_QWORD *)(*(_QWORD *)(v122 + 56) + 16 * v83);
          swift_bridgeObjectRelease();
          *v89 = 0x44454C42414E45;
          v89[1] = 0xE700000000000000;
        }
        else
        {
          *(_QWORD *)(v122 + 8 * (v83 >> 6) + 64) |= 1 << v83;
          v90 = (_QWORD *)(v88[6] + 16 * v83);
          *v90 = v111;
          v90[1] = v31;
          v91 = (_QWORD *)(v88[7] + 16 * v83);
          *v91 = 0x44454C42414E45;
          v91[1] = 0xE700000000000000;
          v92 = v88[2];
          v93 = __OFADD__(v92, 1);
          v94 = v92 + 1;
          if (v93)
            goto LABEL_40;
          v88[2] = v94;
          swift_bridgeObjectRetain();
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v85 + 8))(v77, v110);
        v73 = v119;
        v46 = v121;
        v33 = v113;
        v61 = &qword_2543A6970;
      }
      v60 = ((uint64_t (*)(char *, uint64_t))v116)(v64, v33);
      v62 += v117;
      v10 = v73 - 1;
      if (!v10)
      {
        swift_bridgeObjectRelease();
        v31 = v102;
        v30 = v101;
        v95 = v112;
        goto LABEL_35;
      }
    }
  }
  v121 = MEMORY[0x24BEE4AF8];
  v95 = MEMORY[0x24BEE4B00];
LABEL_35:
  sub_242192A94();
  sub_242195EA0(v96, v95);
  v97 = v103;
  sub_242199158(v105, v103, &qword_2543A67F0);
  v98 = sub_2421AF4A8();
  v99 = sub_24218E0BC(v97, 1, v98);
  sub_242199198(v97, &qword_2543A67F0);
  if (v99 != 1)
  {
    if (qword_2543A6AD0 != -1)
LABEL_41:
      swift_once();
    v122 = (unint64_t)v30;
    v123 = v31;
    swift_bridgeObjectRetain();
    sub_2421AFACC();
    swift_bridgeObjectRelease();
  }
  sub_242195F1C();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  _Block_release(v109);
}

uint64_t sub_242193A0C(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(_QWORD, void *), uint64_t a5)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int64_t v11;
  uint64_t isUniquelyReferenced_nonNull_native;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
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
  int64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t);
  uint64_t v47;
  uint64_t v48;
  unint64_t *v49;
  unint64_t v50;
  void *v51;
  uint64_t v52;
  uint64_t result;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  int64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  unint64_t v71;
  char v72;
  unint64_t v73;
  char v74;
  char v75;
  uint64_t v76;
  unint64_t v77;
  char v78;
  _QWORD *v79;
  _QWORD *v80;
  _QWORD *v81;
  _QWORD *v82;
  uint64_t v83;
  BOOL v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  int v90;
  uint64_t v91;
  unint64_t v92;
  unint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  char *v101;
  unint64_t v102;
  uint64_t v103;
  uint64_t *v104;
  uint64_t *v105;
  void (*v106)(char *, uint64_t);
  void (*v107)(_QWORD, void *);
  int64_t v108;
  void (*v109)(char *, uint64_t, uint64_t);
  uint64_t v110;
  unint64_t v111;
  unint64_t v112;

  v95 = a3;
  v97 = a2;
  v8 = sub_24218D500(&qword_2543A67F0);
  MEMORY[0x24BDAC7A8](v8);
  v94 = (uint64_t)&v91 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = swift_allocObject();
  v107 = a4;
  *(_QWORD *)(v10 + 16) = a4;
  *(_QWORD *)(v10 + 24) = a5;
  v99 = v10;
  v11 = *(_QWORD *)(a1 + 16);
  v96 = a1;
  if (v11)
  {
    v111 = MEMORY[0x24BEE4AF8];
    v98 = a5;
    swift_retain();
    sub_2421A2F74(0, v11, 0);
    isUniquelyReferenced_nonNull_native = sub_2421AF70C();
    v13 = isUniquelyReferenced_nonNull_native;
    v14 = *(_QWORD *)(isUniquelyReferenced_nonNull_native - 8);
    v15 = a1 + ((*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80));
    v17 = *(_QWORD *)(v14 + 64);
    v16 = *(_QWORD *)(v14 + 72);
    v109 = *(void (**)(char *, uint64_t, uint64_t))(v14 + 16);
    v110 = v16;
    v108 = v11;
    do
    {
      MEMORY[0x24BDAC7A8](isUniquelyReferenced_nonNull_native);
      v109((char *)&v91 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0), v15, v13);
      v18 = sub_2421AF6DC();
      v20 = v19;
      (*(void (**)(char *, uint64_t))(v14 + 8))((char *)&v91 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0), v13);
      v21 = v111;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        isUniquelyReferenced_nonNull_native = (uint64_t)sub_2421A2F74(0, *(_QWORD *)(v21 + 16) + 1, 1);
        v21 = v111;
      }
      v23 = *(_QWORD *)(v21 + 16);
      v22 = *(_QWORD *)(v21 + 24);
      if (v23 >= v22 >> 1)
      {
        isUniquelyReferenced_nonNull_native = (uint64_t)sub_2421A2F74((char *)(v22 > 1), v23 + 1, 1);
        v21 = v111;
      }
      *(_QWORD *)(v21 + 16) = v23 + 1;
      v24 = v21 + 16 * v23;
      *(_QWORD *)(v24 + 32) = v18;
      *(_QWORD *)(v24 + 40) = v20;
      v15 += v110;
      --v11;
    }
    while (v11);
    a5 = v98;
    v11 = v108;
  }
  else
  {
    swift_retain();
    v21 = MEMORY[0x24BEE4AF8];
  }
  sub_24219CC10(v21);
  if (*(_QWORD *)(v25 + 16) != 1 || (v26 = sub_242195E3C(v25), !v27))
  {
    v45 = sub_2421AF598();
    v46 = (uint64_t (*)(uint64_t))MEMORY[0x24BE682E0];
    v47 = *(_QWORD *)(v45 - 8);
    MEMORY[0x24BDAC7A8](v45);
    v49 = (unint64_t *)((char *)&v91 - ((v48 + 15) & 0xFFFFFFFFFFFFFFF0));
    v111 = 0;
    v112 = 0xE000000000000000;
    sub_2421AFC58();
    swift_bridgeObjectRelease();
    v111 = 0xD00000000000002CLL;
    v112 = 0x80000002421B1730;
    sub_2421AFB5C();
    sub_2421AFACC();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v50 = v112;
    *v49 = v111;
    v49[1] = v50;
    (*(void (**)(unint64_t *, _QWORD, uint64_t))(v47 + 104))(v49, *MEMORY[0x24BE682D8], v45);
    sub_242199250(&qword_2571DF328, v46, MEMORY[0x24BE682E8]);
    v51 = (void *)swift_allocError();
    (*(void (**)(uint64_t, unint64_t *, uint64_t))(v47 + 16))(v52, v49, v45);
    v107(0, v51);

    (*(void (**)(unint64_t *, uint64_t))(v47 + 8))(v49, v45);
    swift_release();
    return swift_release();
  }
  v28 = v27;
  v93 = v26;
  swift_bridgeObjectRelease();
  if (v11)
  {
    v91 = v28;
    v98 = a5;
    v111 = MEMORY[0x24BEE4AF8];
    sub_2421A2F74(0, v11, 0);
    v29 = sub_2421AF70C();
    v30 = v29;
    v31 = *(_QWORD *)(v29 - 8);
    v32 = v96 + ((*(unsigned __int8 *)(v31 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v31 + 80));
    v107 = *(void (**)(_QWORD, void *))(v31 + 72);
    v33 = *(_QWORD *)(v31 + 64);
    v109 = *(void (**)(char *, uint64_t, uint64_t))(v31 + 16);
    v110 = v33;
    v34 = v32;
    v35 = v11;
    v103 = v29;
    do
    {
      MEMORY[0x24BDAC7A8](v29);
      v37 = (char *)&v91 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
      v109(v37, v32, v30);
      v38 = sub_2421AF6D0();
      v40 = v39;
      v106 = *(void (**)(char *, uint64_t))(v31 + 8);
      v106(v37, v30);
      v41 = v111;
      v29 = swift_isUniquelyReferenced_nonNull_native();
      if ((v29 & 1) == 0)
      {
        v29 = (uint64_t)sub_2421A2F74(0, *(_QWORD *)(v41 + 16) + 1, 1);
        v41 = v111;
      }
      v43 = *(_QWORD *)(v41 + 16);
      v42 = *(_QWORD *)(v41 + 24);
      if (v43 >= v42 >> 1)
      {
        v29 = (uint64_t)sub_2421A2F74((char *)(v42 > 1), v43 + 1, 1);
        v41 = v111;
      }
      *(_QWORD *)(v41 + 16) = v43 + 1;
      v44 = v41 + 16 * v43;
      *(_QWORD *)(v44 + 32) = v38;
      *(_QWORD *)(v44 + 40) = v40;
      v32 += (uint64_t)v107;
      --v35;
      v30 = v103;
    }
    while (v35);
    v92 = v41;
    v54 = swift_bridgeObjectRetain();
    v102 = MEMORY[0x24BEE4B00];
    v55 = v34;
    while (1)
    {
      v108 = v11;
      v105 = &v91;
      MEMORY[0x24BDAC7A8](v54);
      v57 = (char *)&v91 - ((v56 + 15) & 0xFFFFFFFFFFFFFFF0);
      v109(v57, v55, v30);
      v58 = sub_2421AF784();
      v104 = &v91;
      v59 = *(_QWORD *)(v58 - 8);
      MEMORY[0x24BDAC7A8](v58);
      v61 = (char *)&v91 - ((v60 + 15) & 0xFFFFFFFFFFFFFFF0);
      v62 = sub_24218D500(&qword_2543A6970);
      MEMORY[0x24BDAC7A8](v62);
      v64 = (char *)&v91 - ((v63 + 15) & 0xFFFFFFFFFFFFFFF0);
      sub_2421AF6E8();
      if (sub_24218E0BC((uint64_t)v64, 1, v58) == 1)
      {
        sub_242199198((uint64_t)v64, &qword_2543A6970);
        v65 = v108;
      }
      else
      {
        v101 = v57;
        v66 = v55;
        v67 = v59;
        (*(void (**)(char *, char *, uint64_t))(v59 + 32))(v61, v64, v58);
        v68 = sub_2421AF760();
        v28 = v69;
        v70 = v102;
        swift_isUniquelyReferenced_nonNull_native();
        v111 = v70;
        v100 = v68;
        v71 = sub_242197484(v68, v28);
        if (__OFADD__(*(_QWORD *)(v70 + 16), (v72 & 1) == 0))
        {
          __break(1u);
LABEL_40:
          __break(1u);
          goto LABEL_41;
        }
        v73 = v71;
        v74 = v72;
        sub_24218D500(&qword_2543A6B10);
        v75 = sub_2421AFCC4();
        v76 = v67;
        v55 = v66;
        v57 = v101;
        if ((v75 & 1) != 0)
        {
          v77 = sub_242197484(v100, v28);
          if ((v74 & 1) != (v78 & 1))
          {
            swift_release();
            swift_release();
            result = sub_2421AFD6C();
            __break(1u);
            return result;
          }
          v73 = v77;
        }
        v79 = (_QWORD *)v111;
        v102 = v111;
        if ((v74 & 1) != 0)
        {
          v80 = (_QWORD *)(*(_QWORD *)(v111 + 56) + 16 * v73);
          swift_bridgeObjectRelease();
          *v80 = 0x44454C42414E45;
          v80[1] = 0xE700000000000000;
        }
        else
        {
          *(_QWORD *)(v111 + 8 * (v73 >> 6) + 64) |= 1 << v73;
          v81 = (_QWORD *)(v79[6] + 16 * v73);
          *v81 = v100;
          v81[1] = v28;
          v82 = (_QWORD *)(v79[7] + 16 * v73);
          *v82 = 0x44454C42414E45;
          v82[1] = 0xE700000000000000;
          v83 = v79[2];
          v84 = __OFADD__(v83, 1);
          v85 = v83 + 1;
          if (v84)
            goto LABEL_40;
          v79[2] = v85;
          swift_bridgeObjectRetain();
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v76 + 8))(v61, v58);
        v65 = v108;
        v30 = v103;
      }
      v54 = ((uint64_t (*)(char *, uint64_t))v106)(v57, v30);
      v55 += (uint64_t)v107;
      v11 = v65 - 1;
      if (!v11)
      {
        swift_bridgeObjectRelease();
        v28 = v91;
        v86 = v102;
        goto LABEL_35;
      }
    }
  }
  v92 = MEMORY[0x24BEE4AF8];
  v86 = MEMORY[0x24BEE4B00];
LABEL_35:
  sub_242192A94();
  sub_242195EA0(v87, v86);
  v88 = v94;
  sub_242199158(v97, v94, &qword_2543A67F0);
  v89 = sub_2421AF4A8();
  v90 = sub_24218E0BC(v88, 1, v89);
  sub_242199198(v88, &qword_2543A67F0);
  if (v90 != 1)
  {
    if (qword_2543A6AD0 != -1)
LABEL_41:
      swift_once();
    v111 = v93;
    v112 = v28;
    swift_bridgeObjectRetain();
    sub_2421AFACC();
    swift_bridgeObjectRelease();
  }
  sub_242195F1C();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void sub_242194360(uint64_t a1, uint64_t a2, uint64_t a3, void (**a4)(const void *, _QWORD, void *))
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t isUniquelyReferenced_nonNull_native;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(char *, uint64_t, uint64_t);
  uint64_t v39;
  int64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t);
  uint64_t v52;
  uint64_t v53;
  unint64_t *v54;
  unint64_t v55;
  void *v56;
  uint64_t v57;
  void (**v58)(const void *, _QWORD, void *);
  void *v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t *v71;
  char *v72;
  int64_t v73;
  uint64_t v74;
  uint64_t v75;
  void (*v76)(char *, char *, uint64_t);
  char *v77;
  uint64_t v78;
  uint64_t v79;
  unint64_t v80;
  unint64_t v81;
  char v82;
  unint64_t v83;
  char v84;
  uint64_t v85;
  unint64_t v86;
  char v87;
  _QWORD *v88;
  _QWORD *v89;
  _QWORD *v90;
  _QWORD *v91;
  uint64_t v92;
  BOOL v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  int v99;
  uint64_t v100;
  char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  void (**v109)(const void *, _QWORD, void *);
  uint64_t v110;
  uint64_t v111;
  unint64_t v112;
  uint64_t v113;
  uint64_t *v114;
  uint64_t *v115;
  void (*v116)(char *, uint64_t);
  uint64_t v117;
  void (*v118)(char *, uint64_t, uint64_t);
  int64_t v119;
  void (*v120)(char *, uint64_t, uint64_t);
  unint64_t v121;
  unint64_t v122;
  unint64_t v123;

  v104 = a3;
  v105 = a2;
  v6 = sub_24218D500(&qword_2543A67F0);
  MEMORY[0x24BDAC7A8](v6);
  v103 = (uint64_t)&v100 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a4;
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = sub_242198E1C;
  *(_QWORD *)(v9 + 24) = v8;
  v107 = v9;
  v108 = v8;
  v10 = *(_QWORD *)(a1 + 16);
  v109 = a4;
  if (v10)
  {
    v11 = a1;
    v12 = MEMORY[0x24BEE4AF8];
    _Block_copy(a4);
    v122 = v12;
    swift_retain();
    sub_2421A2F74(0, v10, 0);
    isUniquelyReferenced_nonNull_native = sub_2421AF70C();
    v14 = isUniquelyReferenced_nonNull_native;
    v15 = *(_QWORD *)(isUniquelyReferenced_nonNull_native - 8);
    v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
    v106 = v11;
    v17 = v11 + v16;
    v19 = *(_QWORD *)(v15 + 64);
    v18 = *(_QWORD *)(v15 + 72);
    v120 = *(void (**)(char *, uint64_t, uint64_t))(v15 + 16);
    v121 = v18;
    v119 = v10;
    do
    {
      MEMORY[0x24BDAC7A8](isUniquelyReferenced_nonNull_native);
      v120((char *)&v100 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0), v17, v14);
      v20 = sub_2421AF6DC();
      v22 = v21;
      (*(void (**)(char *, uint64_t))(v15 + 8))((char *)&v100 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0), v14);
      v23 = v122;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        isUniquelyReferenced_nonNull_native = (uint64_t)sub_2421A2F74(0, *(_QWORD *)(v23 + 16) + 1, 1);
        v23 = v122;
      }
      v25 = *(_QWORD *)(v23 + 16);
      v24 = *(_QWORD *)(v23 + 24);
      if (v25 >= v24 >> 1)
      {
        isUniquelyReferenced_nonNull_native = (uint64_t)sub_2421A2F74((char *)(v24 > 1), v25 + 1, 1);
        v23 = v122;
      }
      *(_QWORD *)(v23 + 16) = v25 + 1;
      v26 = v23 + 16 * v25;
      *(_QWORD *)(v26 + 32) = v20;
      *(_QWORD *)(v26 + 40) = v22;
      v17 += v121;
      --v10;
    }
    while (v10);
    a1 = v106;
    v10 = v119;
  }
  else
  {
    _Block_copy(a4);
    swift_retain();
    v23 = MEMORY[0x24BEE4AF8];
  }
  sub_24219CC10(v23);
  if (*(_QWORD *)(v27 + 16) != 1 || (v28 = sub_242195E3C(v27), !v29))
  {
    v50 = sub_2421AF598();
    v51 = (uint64_t (*)(uint64_t))MEMORY[0x24BE682E0];
    v52 = *(_QWORD *)(v50 - 8);
    MEMORY[0x24BDAC7A8](v50);
    v54 = (unint64_t *)((char *)&v100 - ((v53 + 15) & 0xFFFFFFFFFFFFFFF0));
    v122 = 0;
    v123 = 0xE000000000000000;
    sub_2421AFC58();
    swift_bridgeObjectRelease();
    v122 = 0xD00000000000002CLL;
    v123 = 0x80000002421B1730;
    sub_2421AFB5C();
    sub_2421AFACC();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v55 = v123;
    *v54 = v122;
    v54[1] = v55;
    (*(void (**)(unint64_t *, _QWORD, uint64_t))(v52 + 104))(v54, *MEMORY[0x24BE682D8], v50);
    sub_242199250(&qword_2571DF328, v51, MEMORY[0x24BE682E8]);
    v56 = (void *)swift_allocError();
    (*(void (**)(uint64_t, unint64_t *, uint64_t))(v52 + 16))(v57, v54, v50);
    v58 = v109;
    _Block_copy(v109);
    v59 = (void *)sub_2421AF3E8();
    v58[2](v58, 0, v59);

    _Block_release(v58);
    (*(void (**)(unint64_t *, uint64_t))(v52 + 8))(v54, v50);
    swift_release();
    swift_release();
    _Block_release(v58);
    return;
  }
  v30 = (char *)v28;
  v31 = v29;
  swift_bridgeObjectRelease();
  if (v10)
  {
    v101 = v30;
    v102 = v31;
    v122 = MEMORY[0x24BEE4AF8];
    sub_2421A2F74(0, v10, 0);
    v32 = sub_2421AF70C();
    v33 = v32;
    v34 = *(_QWORD *)(v32 - 8);
    v35 = (*(unsigned __int8 *)(v34 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v34 + 80);
    v106 = a1;
    v36 = a1 + v35;
    v37 = *(_QWORD *)(v34 + 72);
    v120 = *(void (**)(char *, uint64_t, uint64_t))(v34 + 64);
    v38 = *(void (**)(char *, uint64_t, uint64_t))(v34 + 16);
    v117 = v37;
    v118 = v38;
    v39 = v36;
    v40 = v10;
    v113 = v32;
    do
    {
      MEMORY[0x24BDAC7A8](v32);
      v42 = (char *)&v100 - ((v41 + 15) & 0xFFFFFFFFFFFFFFF0);
      v118(v42, v36, v33);
      v43 = sub_2421AF6D0();
      v45 = v44;
      v116 = *(void (**)(char *, uint64_t))(v34 + 8);
      v116(v42, v33);
      v46 = v122;
      v32 = swift_isUniquelyReferenced_nonNull_native();
      if ((v32 & 1) == 0)
      {
        v32 = (uint64_t)sub_2421A2F74(0, *(_QWORD *)(v46 + 16) + 1, 1);
        v46 = v122;
      }
      v48 = *(_QWORD *)(v46 + 16);
      v47 = *(_QWORD *)(v46 + 24);
      if (v48 >= v47 >> 1)
      {
        v32 = (uint64_t)sub_2421A2F74((char *)(v47 > 1), v48 + 1, 1);
        v46 = v122;
      }
      *(_QWORD *)(v46 + 16) = v48 + 1;
      v49 = v46 + 16 * v48;
      *(_QWORD *)(v49 + 32) = v43;
      *(_QWORD *)(v49 + 40) = v45;
      v36 += v117;
      --v40;
      v33 = v113;
    }
    while (v40);
    v60 = swift_bridgeObjectRetain();
    v112 = MEMORY[0x24BEE4B00];
    v61 = &qword_2543A6970;
    v62 = v39;
    while (1)
    {
      v119 = v10;
      v121 = v46;
      v115 = &v100;
      MEMORY[0x24BDAC7A8](v60);
      v64 = (char *)&v100 - ((v63 + 15) & 0xFFFFFFFFFFFFFFF0);
      v118(v64, v62, v33);
      v65 = sub_2421AF784();
      v114 = &v100;
      v66 = *(_QWORD *)(v65 - 8);
      MEMORY[0x24BDAC7A8](v65);
      v68 = (char *)&v100 - ((v67 + 15) & 0xFFFFFFFFFFFFFFF0);
      v69 = sub_24218D500(v61);
      MEMORY[0x24BDAC7A8](v69);
      v71 = v61;
      v72 = (char *)&v100 - ((v70 + 15) & 0xFFFFFFFFFFFFFFF0);
      sub_2421AF6E8();
      if (sub_24218E0BC((uint64_t)v72, 1, v65) == 1)
      {
        sub_242199198((uint64_t)v72, v71);
        v46 = v121;
        v61 = v71;
        v73 = v119;
      }
      else
      {
        v30 = v64;
        v74 = v62;
        v75 = v66;
        v76 = *(void (**)(char *, char *, uint64_t))(v66 + 32);
        v110 = v65;
        v76(v68, v72, v65);
        v77 = v68;
        v78 = sub_2421AF760();
        v31 = v79;
        v80 = v112;
        swift_isUniquelyReferenced_nonNull_native();
        v122 = v80;
        v111 = v78;
        v81 = sub_242197484(v78, v31);
        if (__OFADD__(*(_QWORD *)(v80 + 16), (v82 & 1) == 0))
        {
          __break(1u);
LABEL_40:
          __break(1u);
          goto LABEL_41;
        }
        v83 = v81;
        v84 = v82;
        sub_24218D500(&qword_2543A6B10);
        v85 = v75;
        v62 = v74;
        v64 = v30;
        if ((sub_2421AFCC4() & 1) != 0)
        {
          v86 = sub_242197484(v111, v31);
          if ((v84 & 1) != (v87 & 1))
          {
            swift_release();
            swift_release();
            _Block_release(v109);
            sub_2421AFD6C();
            __break(1u);
            return;
          }
          v83 = v86;
        }
        v88 = (_QWORD *)v122;
        v112 = v122;
        if ((v84 & 1) != 0)
        {
          v89 = (_QWORD *)(*(_QWORD *)(v122 + 56) + 16 * v83);
          swift_bridgeObjectRelease();
          *v89 = 0x44454C42414E45;
          v89[1] = 0xE700000000000000;
        }
        else
        {
          *(_QWORD *)(v122 + 8 * (v83 >> 6) + 64) |= 1 << v83;
          v90 = (_QWORD *)(v88[6] + 16 * v83);
          *v90 = v111;
          v90[1] = v31;
          v91 = (_QWORD *)(v88[7] + 16 * v83);
          *v91 = 0x44454C42414E45;
          v91[1] = 0xE700000000000000;
          v92 = v88[2];
          v93 = __OFADD__(v92, 1);
          v94 = v92 + 1;
          if (v93)
            goto LABEL_40;
          v88[2] = v94;
          swift_bridgeObjectRetain();
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v85 + 8))(v77, v110);
        v73 = v119;
        v46 = v121;
        v33 = v113;
        v61 = &qword_2543A6970;
      }
      v60 = ((uint64_t (*)(char *, uint64_t))v116)(v64, v33);
      v62 += v117;
      v10 = v73 - 1;
      if (!v10)
      {
        swift_bridgeObjectRelease();
        v31 = v102;
        v30 = v101;
        v95 = v112;
        goto LABEL_35;
      }
    }
  }
  v121 = MEMORY[0x24BEE4AF8];
  v95 = MEMORY[0x24BEE4B00];
LABEL_35:
  sub_242192A94();
  sub_242195EA0(v96, v95);
  v97 = v103;
  sub_242199158(v105, v103, &qword_2543A67F0);
  v98 = sub_2421AF4A8();
  v99 = sub_24218E0BC(v97, 1, v98);
  sub_242199198(v97, &qword_2543A67F0);
  if (v99 != 1)
  {
    if (qword_2543A6AD0 != -1)
LABEL_41:
      swift_once();
    v122 = (unint64_t)v30;
    v123 = v31;
    swift_bridgeObjectRetain();
    sub_2421AFACC();
    swift_bridgeObjectRelease();
  }
  sub_242195F1C();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  _Block_release(v109);
}

uint64_t sub_242194D38(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(_QWORD, void *), uint64_t a5)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int64_t v11;
  uint64_t isUniquelyReferenced_nonNull_native;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
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
  int64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t);
  uint64_t v47;
  uint64_t v48;
  unint64_t *v49;
  unint64_t v50;
  void *v51;
  uint64_t v52;
  uint64_t result;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  int64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  unint64_t v71;
  char v72;
  unint64_t v73;
  char v74;
  char v75;
  uint64_t v76;
  unint64_t v77;
  char v78;
  _QWORD *v79;
  _QWORD *v80;
  _QWORD *v81;
  _QWORD *v82;
  uint64_t v83;
  BOOL v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  int v90;
  uint64_t v91;
  unint64_t v92;
  unint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  char *v101;
  unint64_t v102;
  uint64_t v103;
  uint64_t *v104;
  uint64_t *v105;
  void (*v106)(char *, uint64_t);
  void (*v107)(_QWORD, void *);
  int64_t v108;
  void (*v109)(char *, uint64_t, uint64_t);
  uint64_t v110;
  unint64_t v111;
  unint64_t v112;

  v95 = a3;
  v97 = a2;
  v8 = sub_24218D500(&qword_2543A67F0);
  MEMORY[0x24BDAC7A8](v8);
  v94 = (uint64_t)&v91 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = swift_allocObject();
  v107 = a4;
  *(_QWORD *)(v10 + 16) = a4;
  *(_QWORD *)(v10 + 24) = a5;
  v99 = v10;
  v11 = *(_QWORD *)(a1 + 16);
  v96 = a1;
  if (v11)
  {
    v111 = MEMORY[0x24BEE4AF8];
    v98 = a5;
    swift_retain();
    sub_2421A2F74(0, v11, 0);
    isUniquelyReferenced_nonNull_native = sub_2421AF70C();
    v13 = isUniquelyReferenced_nonNull_native;
    v14 = *(_QWORD *)(isUniquelyReferenced_nonNull_native - 8);
    v15 = a1 + ((*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80));
    v17 = *(_QWORD *)(v14 + 64);
    v16 = *(_QWORD *)(v14 + 72);
    v109 = *(void (**)(char *, uint64_t, uint64_t))(v14 + 16);
    v110 = v16;
    v108 = v11;
    do
    {
      MEMORY[0x24BDAC7A8](isUniquelyReferenced_nonNull_native);
      v109((char *)&v91 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0), v15, v13);
      v18 = sub_2421AF6DC();
      v20 = v19;
      (*(void (**)(char *, uint64_t))(v14 + 8))((char *)&v91 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0), v13);
      v21 = v111;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      {
        isUniquelyReferenced_nonNull_native = (uint64_t)sub_2421A2F74(0, *(_QWORD *)(v21 + 16) + 1, 1);
        v21 = v111;
      }
      v23 = *(_QWORD *)(v21 + 16);
      v22 = *(_QWORD *)(v21 + 24);
      if (v23 >= v22 >> 1)
      {
        isUniquelyReferenced_nonNull_native = (uint64_t)sub_2421A2F74((char *)(v22 > 1), v23 + 1, 1);
        v21 = v111;
      }
      *(_QWORD *)(v21 + 16) = v23 + 1;
      v24 = v21 + 16 * v23;
      *(_QWORD *)(v24 + 32) = v18;
      *(_QWORD *)(v24 + 40) = v20;
      v15 += v110;
      --v11;
    }
    while (v11);
    a5 = v98;
    v11 = v108;
  }
  else
  {
    swift_retain();
    v21 = MEMORY[0x24BEE4AF8];
  }
  sub_24219CC10(v21);
  if (*(_QWORD *)(v25 + 16) != 1 || (v26 = sub_242195E3C(v25), !v27))
  {
    v45 = sub_2421AF598();
    v46 = (uint64_t (*)(uint64_t))MEMORY[0x24BE682E0];
    v47 = *(_QWORD *)(v45 - 8);
    MEMORY[0x24BDAC7A8](v45);
    v49 = (unint64_t *)((char *)&v91 - ((v48 + 15) & 0xFFFFFFFFFFFFFFF0));
    v111 = 0;
    v112 = 0xE000000000000000;
    sub_2421AFC58();
    swift_bridgeObjectRelease();
    v111 = 0xD00000000000002CLL;
    v112 = 0x80000002421B1730;
    sub_2421AFB5C();
    sub_2421AFACC();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v50 = v112;
    *v49 = v111;
    v49[1] = v50;
    (*(void (**)(unint64_t *, _QWORD, uint64_t))(v47 + 104))(v49, *MEMORY[0x24BE682D8], v45);
    sub_242199250(&qword_2571DF328, v46, MEMORY[0x24BE682E8]);
    v51 = (void *)swift_allocError();
    (*(void (**)(uint64_t, unint64_t *, uint64_t))(v47 + 16))(v52, v49, v45);
    v107(0, v51);

    (*(void (**)(unint64_t *, uint64_t))(v47 + 8))(v49, v45);
    swift_release();
    return swift_release();
  }
  v28 = v27;
  v93 = v26;
  swift_bridgeObjectRelease();
  if (v11)
  {
    v91 = v28;
    v98 = a5;
    v111 = MEMORY[0x24BEE4AF8];
    sub_2421A2F74(0, v11, 0);
    v29 = sub_2421AF70C();
    v30 = v29;
    v31 = *(_QWORD *)(v29 - 8);
    v32 = v96 + ((*(unsigned __int8 *)(v31 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v31 + 80));
    v107 = *(void (**)(_QWORD, void *))(v31 + 72);
    v33 = *(_QWORD *)(v31 + 64);
    v109 = *(void (**)(char *, uint64_t, uint64_t))(v31 + 16);
    v110 = v33;
    v34 = v32;
    v35 = v11;
    v103 = v29;
    do
    {
      MEMORY[0x24BDAC7A8](v29);
      v37 = (char *)&v91 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
      v109(v37, v32, v30);
      v38 = sub_2421AF6D0();
      v40 = v39;
      v106 = *(void (**)(char *, uint64_t))(v31 + 8);
      v106(v37, v30);
      v41 = v111;
      v29 = swift_isUniquelyReferenced_nonNull_native();
      if ((v29 & 1) == 0)
      {
        v29 = (uint64_t)sub_2421A2F74(0, *(_QWORD *)(v41 + 16) + 1, 1);
        v41 = v111;
      }
      v43 = *(_QWORD *)(v41 + 16);
      v42 = *(_QWORD *)(v41 + 24);
      if (v43 >= v42 >> 1)
      {
        v29 = (uint64_t)sub_2421A2F74((char *)(v42 > 1), v43 + 1, 1);
        v41 = v111;
      }
      *(_QWORD *)(v41 + 16) = v43 + 1;
      v44 = v41 + 16 * v43;
      *(_QWORD *)(v44 + 32) = v38;
      *(_QWORD *)(v44 + 40) = v40;
      v32 += (uint64_t)v107;
      --v35;
      v30 = v103;
    }
    while (v35);
    v92 = v41;
    v54 = swift_bridgeObjectRetain();
    v102 = MEMORY[0x24BEE4B00];
    v55 = v34;
    while (1)
    {
      v108 = v11;
      v105 = &v91;
      MEMORY[0x24BDAC7A8](v54);
      v57 = (char *)&v91 - ((v56 + 15) & 0xFFFFFFFFFFFFFFF0);
      v109(v57, v55, v30);
      v58 = sub_2421AF784();
      v104 = &v91;
      v59 = *(_QWORD *)(v58 - 8);
      MEMORY[0x24BDAC7A8](v58);
      v61 = (char *)&v91 - ((v60 + 15) & 0xFFFFFFFFFFFFFFF0);
      v62 = sub_24218D500(&qword_2543A6970);
      MEMORY[0x24BDAC7A8](v62);
      v64 = (char *)&v91 - ((v63 + 15) & 0xFFFFFFFFFFFFFFF0);
      sub_2421AF6E8();
      if (sub_24218E0BC((uint64_t)v64, 1, v58) == 1)
      {
        sub_242199198((uint64_t)v64, &qword_2543A6970);
        v65 = v108;
      }
      else
      {
        v101 = v57;
        v66 = v55;
        v67 = v59;
        (*(void (**)(char *, char *, uint64_t))(v59 + 32))(v61, v64, v58);
        v68 = sub_2421AF760();
        v28 = v69;
        v70 = v102;
        swift_isUniquelyReferenced_nonNull_native();
        v111 = v70;
        v100 = v68;
        v71 = sub_242197484(v68, v28);
        if (__OFADD__(*(_QWORD *)(v70 + 16), (v72 & 1) == 0))
        {
          __break(1u);
LABEL_40:
          __break(1u);
          goto LABEL_41;
        }
        v73 = v71;
        v74 = v72;
        sub_24218D500(&qword_2543A6B10);
        v75 = sub_2421AFCC4();
        v76 = v67;
        v55 = v66;
        v57 = v101;
        if ((v75 & 1) != 0)
        {
          v77 = sub_242197484(v100, v28);
          if ((v74 & 1) != (v78 & 1))
          {
            swift_release();
            swift_release();
            result = sub_2421AFD6C();
            __break(1u);
            return result;
          }
          v73 = v77;
        }
        v79 = (_QWORD *)v111;
        v102 = v111;
        if ((v74 & 1) != 0)
        {
          v80 = (_QWORD *)(*(_QWORD *)(v111 + 56) + 16 * v73);
          swift_bridgeObjectRelease();
          *v80 = 0x44454C42414E45;
          v80[1] = 0xE700000000000000;
        }
        else
        {
          *(_QWORD *)(v111 + 8 * (v73 >> 6) + 64) |= 1 << v73;
          v81 = (_QWORD *)(v79[6] + 16 * v73);
          *v81 = v100;
          v81[1] = v28;
          v82 = (_QWORD *)(v79[7] + 16 * v73);
          *v82 = 0x44454C42414E45;
          v82[1] = 0xE700000000000000;
          v83 = v79[2];
          v84 = __OFADD__(v83, 1);
          v85 = v83 + 1;
          if (v84)
            goto LABEL_40;
          v79[2] = v85;
          swift_bridgeObjectRetain();
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v76 + 8))(v61, v58);
        v65 = v108;
        v30 = v103;
      }
      v54 = ((uint64_t (*)(char *, uint64_t))v106)(v57, v30);
      v55 += (uint64_t)v107;
      v11 = v65 - 1;
      if (!v11)
      {
        swift_bridgeObjectRelease();
        v28 = v91;
        v86 = v102;
        goto LABEL_35;
      }
    }
  }
  v92 = MEMORY[0x24BEE4AF8];
  v86 = MEMORY[0x24BEE4B00];
LABEL_35:
  sub_242192A94();
  sub_242195EA0(v87, v86);
  v88 = v94;
  sub_242199158(v97, v94, &qword_2543A67F0);
  v89 = sub_2421AF4A8();
  v90 = sub_24218E0BC(v88, 1, v89);
  sub_242199198(v88, &qword_2543A67F0);
  if (v90 != 1)
  {
    if (qword_2543A6AD0 != -1)
LABEL_41:
      swift_once();
    v111 = v93;
    v112 = v28;
    swift_bridgeObjectRetain();
    sub_2421AFACC();
    swift_bridgeObjectRelease();
  }
  sub_242195F1C();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void sub_24219568C()
{
  uint64_t v0;
  uint64_t v1;
  void (*v2)(void *);
  uint64_t v3;
  uint64_t v4;
  unint64_t *v5;
  unint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  void (*v34)(uint64_t);
  char *v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD *v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t);
  uint64_t v48;
  unint64_t v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  unint64_t v65;
  char v66;
  unint64_t v67;
  char v68;
  char v69;
  unint64_t v70;
  char v71;
  _QWORD *v72;
  _QWORD *v73;
  _QWORD *v74;
  uint64_t v75;
  BOOL v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  int v82;
  uint64_t v83;
  unint64_t v84;
  uint64_t v85;
  uint64_t v86;
  unint64_t *v87;
  uint64_t v88;
  uint64_t v89;
  void (*v90)(void *);
  char *v91;
  uint64_t v92;
  unint64_t v93;
  unint64_t v94;
  uint64_t *v95;
  uint64_t *v96;
  void (*v97)(uint64_t, uint64_t);
  uint64_t v98;
  void (*v99)(uint64_t);
  uint64_t v100;
  void (*v101)(uint64_t);
  uint64_t v102;
  unint64_t v103;
  unint64_t v104;

  sub_242199548();
  v1 = v0;
  v90 = v2;
  v86 = v3;
  v88 = v4;
  v6 = v5;
  sub_24218D500(&qword_2543A67F0);
  sub_2421992E8();
  MEMORY[0x24BDAC7A8](v7);
  sub_242199AB8();
  v85 = v8;
  v9 = v6[2];
  v10 = MEMORY[0x24BEE4AF8];
  v87 = v6;
  if (v9)
  {
    v89 = v1;
    v103 = MEMORY[0x24BEE4AF8];
    sub_2421997CC();
    v11 = sub_242199484();
    v12 = *(_QWORD *)(v11 - 8);
    sub_24219979C();
    v6 = (unint64_t *)((char *)v6 + v14);
    v15 = *(_QWORD *)(v12 + 72);
    v101 = *(void (**)(uint64_t))(v12 + 16);
    v102 = v15;
    v94 = v9;
    v16 = v9;
    do
    {
      MEMORY[0x24BDAC7A8](v13);
      v17 = sub_242199840((uint64_t)&v83);
      v101(v17);
      v18 = sub_2421AF6DC();
      v20 = v19;
      (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v10, v11);
      v10 = v103;
      v13 = sub_242199908();
      if ((v13 & 1) == 0)
      {
        v13 = (uint64_t)sub_2421996BC(0, *(_QWORD *)(v10 + 16) + 1);
        v10 = v103;
      }
      v22 = *(_QWORD *)(v10 + 16);
      v21 = *(_QWORD *)(v10 + 24);
      if (v22 >= v21 >> 1)
      {
        v13 = (uint64_t)sub_2421996BC((char *)(v21 > 1), v22 + 1);
        v10 = v103;
      }
      *(_QWORD *)(v10 + 16) = v22 + 1;
      v23 = v10 + 16 * v22;
      *(_QWORD *)(v23 + 32) = v18;
      *(_QWORD *)(v23 + 40) = v20;
      v6 = (unint64_t *)((char *)v6 + v102);
      --v16;
    }
    while (v16);
    v1 = v89;
    v9 = v94;
  }
  sub_24219CC10(v10);
  if (*(_QWORD *)(v24 + 16) != 1 || (v25 = sub_242195E3C(v24), !v26))
  {
    v46 = sub_2421AF598();
    v47 = (uint64_t (*)(uint64_t))MEMORY[0x24BE682E0];
    v48 = *(_QWORD *)(v46 - 8);
    MEMORY[0x24BDAC7A8](v46);
    sub_24219943C();
    v103 = 0;
    v104 = 0xE000000000000000;
    sub_2421AFC58();
    swift_bridgeObjectRelease();
    v103 = 0xD00000000000002CLL;
    v104 = 0x80000002421B1730;
    sub_2421AFB5C();
    sub_2421AFACC();
    sub_2421993A4();
    sub_242199838();
    v49 = v104;
    *v6 = v103;
    v6[1] = v49;
    (*(void (**)(unint64_t *, _QWORD, uint64_t))(v48 + 104))(v6, *MEMORY[0x24BE682D8], v46);
    sub_242199250(&qword_2571DF328, v47, MEMORY[0x24BE682E8]);
    v50 = (void *)swift_allocError();
    sub_242199AE4(v51, (uint64_t)v6, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v48 + 16));
    v90(v50);

    (*(void (**)(unint64_t *, uint64_t))(v48 + 8))(v6, v46);
LABEL_38:
    sub_242199304();
    return;
  }
  v27 = v25;
  v28 = v26;
  sub_2421993A4();
  if (!v9)
  {
    v101 = (void (*)(uint64_t))MEMORY[0x24BEE4AF8];
    v78 = MEMORY[0x24BEE4B00];
LABEL_34:
    sub_242192A94();
    sub_242195EA0(v79, v78);
    v80 = v85;
    sub_242199158(v88, v85, &qword_2543A67F0);
    v81 = sub_242199938();
    v82 = sub_24218E0BC(v80, 1, v81);
    sub_242199198(v80, &qword_2543A67F0);
    if (v82 != 1)
    {
      if (qword_2543A6AD0 != -1)
LABEL_41:
        swift_once();
      v103 = v27;
      v104 = v28;
      sub_242199B7C();
      sub_2421AFACC();
      sub_242199838();
    }
    sub_242195F1C();
    sub_242199838();
    sub_24219978C();
    sub_24219947C();
    goto LABEL_38;
  }
  v83 = v27;
  v84 = v28;
  v89 = v1;
  v103 = MEMORY[0x24BEE4AF8];
  sub_2421997CC();
  v102 = sub_242199484();
  v29 = *(_QWORD **)(v102 - 8);
  sub_24219979C();
  v32 = (char *)v87 + v31;
  v33 = v29[9];
  v100 = v29[8];
  v34 = (void (*)(uint64_t))v29[2];
  v98 = v33;
  v99 = v34;
  v35 = v32;
  v36 = v9;
  v37 = v9;
  do
  {
    MEMORY[0x24BDAC7A8](v30);
    v38 = sub_242199840((uint64_t)&v83);
    v39 = v102;
    v99(v38);
    v40 = (_QWORD *)sub_2421AF6D0();
    v42 = v41;
    v97 = (void (*)(uint64_t, uint64_t))v29[1];
    v97(v10, v39);
    v10 = v103;
    v30 = sub_242199908();
    if ((v30 & 1) == 0)
    {
      v30 = (uint64_t)sub_2421996BC(0, *(_QWORD *)(v10 + 16) + 1);
      v10 = v103;
    }
    v44 = *(_QWORD *)(v10 + 16);
    v43 = *(_QWORD *)(v10 + 24);
    if (v44 >= v43 >> 1)
    {
      v30 = (uint64_t)sub_2421996BC((char *)(v43 > 1), v44 + 1);
      v10 = v103;
    }
    *(_QWORD *)(v10 + 16) = v44 + 1;
    v45 = v10 + 16 * v44;
    *(_QWORD *)(v45 + 32) = v40;
    *(_QWORD *)(v45 + 40) = v42;
    v32 += v98;
    --v37;
  }
  while (v37);
  v52 = swift_bridgeObjectRetain();
  v93 = MEMORY[0x24BEE4B00];
  v53 = v102;
  v54 = v35;
  while (1)
  {
    v101 = (void (*)(uint64_t))v10;
    v96 = &v83;
    MEMORY[0x24BDAC7A8](v52);
    sub_242199960();
    ((void (*)(uint64_t, char *, uint64_t))v99)(v42, v54, v53);
    v55 = sub_2421AF784();
    v95 = &v83;
    v56 = *(_QWORD *)(v55 - 8);
    MEMORY[0x24BDAC7A8](v55);
    sub_242199978();
    v59 = v58 - v57;
    sub_24218D500(&qword_2543A6970);
    sub_2421992E8();
    MEMORY[0x24BDAC7A8](v60);
    sub_2421995E0();
    sub_2421AF6E8();
    if (sub_24218E0BC((uint64_t)v40, 1, v55) == 1)
    {
      sub_242199198((uint64_t)v40, &qword_2543A6970);
      v10 = (uint64_t)v101;
      v53 = v102;
      goto LABEL_31;
    }
    v91 = v54;
    v92 = v42;
    v94 = v36;
    v61 = v56;
    sub_24219970C(v59, (uint64_t)v40, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v56 + 32));
    v28 = v59;
    v40 = (_QWORD *)sub_2421AF760();
    v63 = v62;
    v64 = v93;
    v27 = sub_242199908();
    v103 = v64;
    v65 = sub_242199A70();
    if (__OFADD__(*(_QWORD *)(v64 + 16), (v66 & 1) == 0))
    {
      __break(1u);
LABEL_40:
      __break(1u);
      goto LABEL_41;
    }
    v67 = v65;
    v68 = v66;
    sub_24218D500(&qword_2543A6B10);
    v69 = sub_2421AFCC4();
    v27 = v61;
    v54 = v91;
    v42 = v92;
    if ((v69 & 1) != 0)
      break;
LABEL_26:
    v93 = v103;
    if ((v68 & 1) != 0)
    {
      v40 = (_QWORD *)(*(_QWORD *)(v103 + 56) + 16 * v67);
      swift_bridgeObjectRelease();
      *v40 = 0x44454C42414E45;
      v40[1] = 0xE700000000000000;
      v10 = (uint64_t)v101;
    }
    else
    {
      sub_2421996C4(v103 + 8 * (v67 >> 6));
      v73 = (_QWORD *)(v72[6] + 16 * v67);
      *v73 = v40;
      v73[1] = v63;
      v74 = (_QWORD *)(v72[7] + 16 * v67);
      *v74 = 0x44454C42414E45;
      v74[1] = 0xE700000000000000;
      v75 = v72[2];
      v76 = __OFADD__(v75, 1);
      v77 = v75 + 1;
      v10 = (uint64_t)v101;
      if (v76)
        goto LABEL_40;
      v72[2] = v77;
      swift_bridgeObjectRetain();
    }
    sub_242199770();
    sub_242199A00();
    (*(void (**)(unint64_t, uint64_t))(v27 + 8))(v28, v55);
    v36 = v94;
    v53 = v102;
LABEL_31:
    v52 = ((uint64_t (*)(uint64_t, uint64_t))v97)(v42, v53);
    v54 += v98;
    if (!--v36)
    {
      swift_bridgeObjectRelease();
      v28 = v84;
      v27 = v83;
      v78 = v93;
      goto LABEL_34;
    }
  }
  v70 = sub_242199A70();
  if ((v68 & 1) == (v71 & 1))
  {
    v67 = v70;
    goto LABEL_26;
  }
  sub_2421AFD6C();
  __break(1u);
}

uint64_t sub_242195E3C(uint64_t a1)
{
  uint64_t result;
  int v3;
  char v4;

  result = sub_242199080(a1);
  if ((v4 & 1) != 0)
    goto LABEL_7;
  if (*(_DWORD *)(a1 + 36) != v3)
  {
    __break(1u);
LABEL_7:
    __break(1u);
    return result;
  }
  if (result == 1 << *(_BYTE *)(a1 + 32))
    return 0;
  else
    return sub_242199004(result, v3, 0, a1);
}

uint64_t sub_242195EA0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v6;
  uint64_t v8;

  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v8 = a2;
  sub_242198284(a1, (uint64_t)sub_2421AEB00, 0, isUniquelyReferenced_nonNull_native, &v8);
  v6 = v8;
  swift_bridgeObjectRelease();
  if (v2)
    swift_bridgeObjectRelease();
  return v6;
}

void sub_242195F1C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _BOOL8 v31;
  unint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  BOOL v37;
  uint64_t v38;
  char v39;
  uint64_t inited;
  id v41;
  id v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD *v47;
  uint64_t v48;
  unint64_t v49;
  id v50;
  id v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  id v55;
  void *v56;
  _QWORD *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  _QWORD *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void **v66;
  uint64_t v67;
  uint64_t v68[8];

  sub_242199548();
  v2 = v1;
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  sub_24218D500(&qword_2543A67F0);
  sub_2421992E8();
  MEMORY[0x24BDAC7A8](v13);
  sub_242199988();
  v14 = sub_2421994C8();
  sub_24218D500(&qword_2543A68C8);
  v15 = sub_2421AF9F4();
  *(_QWORD *)(v14 + 16) = v15;
  v16 = v8[2];
  v65 = v10;
  v63 = v4;
  v62 = v2;
  v64 = v12;
  if (v16)
  {
    v60 = v0;
    v59 = v6;
    v17 = v8;
    v19 = v8[4];
    v18 = (void *)v8[5];
    v61 = v17;
    swift_bridgeObjectRetain();
    sub_242199520();
    v20 = sub_2421AF508();
    if (!*(_QWORD *)(v20 + 16))
    {
LABEL_35:
      sub_24219947C();
      __break(1u);
LABEL_36:
      sub_2421AFD6C();
      __break(1u);
      goto LABEL_37;
    }
    sub_242199520();
    v21 = sub_242199758();
    if ((v22 & 1) != 0)
    {
      v67 = v16;
      v66 = (void **)(v61 + 7);
      while (1)
      {
        v23 = *(_QWORD *)(*(_QWORD *)(v20 + 56) + 8 * v21);
        swift_bridgeObjectRetain_n();
        sub_2421993A4();
        sub_24219947C();
        v24 = sub_242199714();
        v25 = sub_2421984AC(v24, v23);
        sub_24219978C();
        sub_24219947C();
        swift_isUniquelyReferenced_nonNull_native();
        v68[0] = *(_QWORD *)(v14 + 16);
        v26 = v68[0];
        v27 = v14;
        *(_QWORD *)(v14 + 16) = 0x8000000000000000;
        v12 = v19;
        v28 = sub_242199758();
        v30 = *(_QWORD *)(v26 + 16);
        v31 = (v29 & 1) == 0;
        v10 = v30 + v31;
        if (__OFADD__(v30, v31))
          break;
        v14 = v28;
        v23 = v29;
        sub_24218D500(&qword_2543A6930);
        if ((sub_2421AFCC4() & 1) != 0)
        {
          v32 = sub_242197484(v12, (uint64_t)v18);
          if ((v23 & 1) != (v33 & 1))
            goto LABEL_36;
          v14 = v32;
        }
        v15 = v68[0];
        if ((v23 & 1) != 0)
        {
          v34 = *(_QWORD *)(v68[0] + 56);
          swift_bridgeObjectRelease();
          *(_QWORD *)(v34 + 8 * v14) = v25;
        }
        else
        {
          sub_2421996C4(v68[0] + 8 * (v14 >> 6));
          v35 = (uint64_t *)(*(_QWORD *)(v68[0] + 48) + 16 * v14);
          *v35 = v12;
          v35[1] = (uint64_t)v18;
          *(_QWORD *)(*(_QWORD *)(v15 + 56) + 8 * v14) = v25;
          v36 = *(_QWORD *)(v15 + 16);
          v37 = __OFADD__(v36, 1);
          v38 = v36 + 1;
          if (v37)
            goto LABEL_33;
          *(_QWORD *)(v15 + 16) = v38;
          sub_242199520();
        }
        v14 = v27;
        *(_QWORD *)(v27 + 16) = v15;
        sub_2421993A4();
        sub_242199A00();
        if (v67 == 1)
          goto LABEL_17;
        v19 = (uint64_t)*(v66 - 1);
        v18 = *v66;
        sub_242199520();
        v20 = sub_2421AF508();
        if (!*(_QWORD *)(v20 + 16))
          goto LABEL_35;
        v66 += 2;
        --v67;
        sub_242199520();
        v21 = sub_242199758();
        if ((v39 & 1) == 0)
          goto LABEL_16;
      }
      __break(1u);
LABEL_33:
      __break(1u);
      goto LABEL_34;
    }
LABEL_16:
    sub_2421993A4();
    sub_24219947C();
    __break(1u);
LABEL_17:
    sub_242199794();
    v12 = v64;
    v10 = v65;
    v0 = v60;
    v6 = v59;
  }
  if (v12 == 0xD00000000000002CLL && v10 == 0x80000002421B1780 || (sub_2421AFD54() & 1) != 0)
  {
    sub_24218D500(&qword_2543A6900);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_2421B0720;
    *(_QWORD *)(inited + 32) = 0xD000000000000031;
    *(_QWORD *)(inited + 40) = 0x80000002421B1850;
    *(_QWORD *)(inited + 48) = 0x53552D6E65;
    *(_QWORD *)(inited + 56) = 0xE500000000000000;
    v23 = sub_2421AF9F4();
  }
  else
  {
    v23 = 0;
  }
  sub_242199158(v6, v0, &qword_2543A67F0);
  v41 = objc_allocWithZone(MEMORY[0x24BEBEE80]);
  sub_242199750();
  sub_242199AA8();
  v42 = sub_242197340(v12, v10, v15, v23, v0);
  if (!v42)
  {
LABEL_37:
    sub_2421AFC58();
    sub_2421AFACC();
    sub_2421AFACC();
    sub_2421AFACC();
    sub_242199AA8();
    sub_2421AF9E8();
    sub_2421AFACC();
    swift_bridgeObjectRelease();
    sub_24219978C();
    sub_2421AFCF4();
    __break(1u);
    return;
  }
  v18 = v42;
  if (qword_2543A6928 != -1)
LABEL_34:
    swift_once();
  v43 = sub_242199940();
  sub_24218E28C(v43, (uint64_t)qword_2543A6B78);
  v44 = v18;
  sub_2421AF928();
  v45 = sub_242199868();
  if (os_log_type_enabled((os_log_t)v23, (os_log_type_t)v45))
  {
    v46 = sub_24218D61C();
    v47 = (_QWORD *)sub_24218D61C();
    v68[0] = sub_24218D61C();
    *(_DWORD *)v46 = 136315394;
    if (qword_2543A6838 != -1)
      swift_once();
    v48 = qword_2543A6820[0];
    v49 = unk_2543A6828;
    swift_bridgeObjectRetain();
    sub_2421A0BC4(v48, v49, v68);
    sub_2421AFBEC();
    sub_242199770();
    *(_WORD *)(v46 + 12) = 2112;
    v50 = v44;
    sub_2421AFBEC();
    *v47 = v18;

    _os_log_impl(&dword_24218A000, (os_log_t)v23, (os_log_type_t)v45, "Subscribing to UAF with subscriberID: %s, subscriptions: %@", (uint8_t *)v46, 0x16u);
    sub_24218D500(&qword_2543A6B08);
    swift_arrayDestroy();
    sub_24218D600();
  }

  sub_242199B18();
  v51 = objc_msgSend((id)objc_opt_self(), sel_sharedManager);
  if (qword_2543A6838 != -1)
    swift_once();
  v52 = (void *)sub_242199474();
  sub_24218D500(&qword_2543A6908);
  v53 = sub_2421994C8();
  *(_OWORD *)(v53 + 16) = xmmword_2421B0740;
  *(_QWORD *)(v53 + 32) = v44;
  v54 = sub_2421AFB08();
  sub_24219971C(v54, &qword_2543A68F0);
  v55 = v44;
  v56 = (void *)sub_2421AFAF0();
  sub_242199434();
  v57 = (_QWORD *)sub_2421994C8();
  v57[2] = v12;
  v57[3] = v10;
  v57[4] = v14;
  v57[5] = v45;
  v57[6] = v62;
  v68[4] = (uint64_t)sub_242199228;
  v68[5] = (uint64_t)v57;
  v68[0] = MEMORY[0x24BDAC760];
  v68[1] = 1107296256;
  v68[2] = (uint64_t)sub_2421969E4;
  v68[3] = (uint64_t)&unk_251332088;
  v58 = _Block_copy(v68);
  sub_242199750();
  swift_retain();
  swift_retain();
  swift_release();
  objc_msgSend(v51, sel_subscribe_subscriptions_queue_completion_, v52, v56, v63, v58);
  _Block_release(v58);
  swift_release();

  sub_242199304();
}

uint64_t sub_242196760(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t))
{
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v17;
  uint64_t v18;

  if (a1)
  {
    if (qword_2543A66F0 != -1)
      swift_once();
    v9 = sub_2421AF940();
    sub_24218E28C(v9, (uint64_t)qword_2543A6B60);
    swift_bridgeObjectRetain_n();
    swift_retain_n();
    v10 = sub_2421AF928();
    v11 = sub_2421AFB80();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = swift_slowAlloc();
      v17 = swift_slowAlloc();
      v18 = v17;
      *(_DWORD *)v12 = 136315394;
      swift_bridgeObjectRetain();
      sub_2421A0BC4(a2, a3, &v18);
      sub_2421AFBEC();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v12 + 12) = 2080;
      swift_beginAccess();
      swift_bridgeObjectRetain();
      sub_24218D500(&qword_2543A68C8);
      v13 = sub_2421AF9E8();
      v15 = v14;
      swift_bridgeObjectRelease();
      sub_2421A0BC4(v13, v15, &v18);
      sub_2421AFBEC();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24218A000, v10, v11, "Failed to subscribe to subscription name %s, asset sets: %s", (uint8_t *)v12, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x2426A51D4](v17, -1, -1);
      MEMORY[0x2426A51D4](v12, -1, -1);

    }
    else
    {

      swift_release_n();
      swift_bridgeObjectRelease_n();
    }
  }
  return a5(a1);
}

void sub_2421969E4(uint64_t a1, void *a2)
{
  void (*v3)(void *);
  id v4;

  v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3(a2);
  swift_release();

}

uint64_t sub_242196A38(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  char *v6;
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
  int v17;
  uint64_t *v18;
  char v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  void (*v24)(char *, uint64_t);
  _QWORD v26[2];

  v3 = sub_24218D500(&qword_2543A6970);
  v4 = *(_QWORD *)(*(_QWORD *)(v3 - 8) + 64);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (v4 + 15) & 0xFFFFFFFFFFFFFFF0;
  v6 = (char *)v26 - v5;
  v7 = sub_2421AF6E8();
  MEMORY[0x24BDAC7A8](v7);
  v8 = (char *)v26 - v5;
  v9 = sub_2421AF784();
  v10 = *(_QWORD *)(v9 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))((char *)v26 - v5, a2, v9);
  sub_24218D5C8((uint64_t)v26 - v5, 0, 1, v9);
  v11 = sub_24218D500(&qword_2543A6978);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = (uint64_t)&v14[*(int *)(v12 + 48)];
  sub_242199158((uint64_t)v26 - v5, (uint64_t)v14, &qword_2543A6970);
  sub_242199158((uint64_t)v26 - v5, v15, &qword_2543A6970);
  v16 = sub_24218E0BC((uint64_t)v14, 1, v9);
  if ((_DWORD)v16 == 1)
  {
    sub_242199198((uint64_t)v26 - v5, &qword_2543A6970);
    sub_242199198((uint64_t)v26 - v5, &qword_2543A6970);
    v17 = sub_24218E0BC(v15, 1, v9);
    if (v17 == 1)
      v18 = &qword_2543A6970;
    else
      v18 = &qword_2543A6978;
    if (v17 == 1)
      v19 = -1;
    else
      v19 = 0;
  }
  else
  {
    v26[1] = v26;
    MEMORY[0x24BDAC7A8](v16);
    v20 = (char *)v26 - v5;
    sub_242199158((uint64_t)v14, (uint64_t)v26 - v5, &qword_2543A6970);
    v21 = sub_24218E0BC(v15, 1, v9);
    if ((_DWORD)v21 == 1)
    {
      sub_242199198((uint64_t)v26 - v5, &qword_2543A6970);
      sub_242199198((uint64_t)v26 - v5, &qword_2543A6970);
      (*(void (**)(char *, uint64_t))(v10 + 8))((char *)v26 - v5, v9);
      v18 = &qword_2543A6978;
      v19 = 0;
    }
    else
    {
      v26[0] = v26;
      MEMORY[0x24BDAC7A8](v21);
      v23 = (char *)v26 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *, uint64_t, uint64_t))(v10 + 32))(v23, v15, v9);
      sub_242199250(&qword_2543A6A88, (uint64_t (*)(uint64_t))MEMORY[0x24BE68570], MEMORY[0x24BE68588]);
      v19 = sub_2421AFA0C();
      v24 = *(void (**)(char *, uint64_t))(v10 + 8);
      v24(v23, v9);
      v18 = &qword_2543A6970;
      sub_242199198((uint64_t)v8, &qword_2543A6970);
      sub_242199198((uint64_t)v6, &qword_2543A6970);
      v24(v20, v9);
    }
  }
  sub_242199198((uint64_t)v14, v18);
  return v19 & 1;
}

uint64_t sub_242196D44(uint64_t a1)
{
  uint64_t v1;

  return sub_242196A38(a1, *(_QWORD *)(v1 + 16)) & 1;
}

uint64_t sub_242196D60(uint64_t (*a1)(char *), uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  char *v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(char *, char *, uint64_t);
  uint64_t *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(char *);
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v4 = a3;
  v28 = a1;
  v29 = a2;
  v5 = MEMORY[0x24BEE4AF8];
  v32 = MEMORY[0x24BEE4AF8];
  v6 = *(_QWORD *)(a3 + 16);
  v31 = sub_2421AF70C();
  v7 = *(_QWORD *)(v31 - 8);
  result = MEMORY[0x24BDAC7A8](v31);
  v30 = v9;
  v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = v6;
  if (v6)
  {
    v11 = 0;
    v23 = v4;
    while (v11 < *(_QWORD *)(v4 + 16))
    {
      v12 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
      v13 = *(_QWORD *)(v7 + 72);
      (*(void (**)(char *, unint64_t, uint64_t))(v7 + 16))(v10, v4 + v12 + v13 * v11, v31);
      v5 = v29;
      v14 = v28(v10);
      if (v3)
      {
        (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v31);
        swift_bridgeObjectRelease();
        swift_release();
        return v5;
      }
      if ((v14 & 1) != 0)
      {
        v25 = &v22;
        v26 = &v22;
        MEMORY[0x24BDAC7A8](v14);
        v16 = (char *)&v22 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
        v24 = *(void (**)(char *, char *, uint64_t))(v7 + 32);
        v24(v16, v10, v31);
        v17 = v32;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_2421A2F90(0, *(_QWORD *)(v17 + 16) + 1, 1);
          v17 = v32;
        }
        v19 = *(_QWORD *)(v17 + 16);
        v18 = *(_QWORD *)(v17 + 24);
        if (v19 >= v18 >> 1)
        {
          sub_2421A2F90(v18 > 1, v19 + 1, 1);
          v17 = v32;
        }
        *(_QWORD *)(v17 + 16) = v19 + 1;
        v20 = ((uint64_t (*)(unint64_t, char *, uint64_t))v24)(v17 + v12 + v19 * v13, v16, v31);
        v32 = v17;
        v4 = v23;
      }
      else
      {
        v20 = (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, v31);
      }
      ++v11;
      result = MEMORY[0x24BDAC7A8](v20);
      v10 = (char *)&v22 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
      if (v27 == v11)
      {
        v5 = v32;
        goto LABEL_15;
      }
    }
    __break(1u);
  }
  else
  {
LABEL_15:
    swift_bridgeObjectRelease();
    return v5;
  }
  return result;
}

void sub_242196FC8(uint64_t a1, uint64_t a2)
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;

  v4 = objc_msgSend((id)objc_opt_self(), sel_sharedManager);
  if (qword_2543A6838 != -1)
    swift_once();
  v5 = (void *)sub_242199474();
  sub_24218D500(&qword_2543A6940);
  v6 = sub_2421993E0();
  *(_OWORD *)(v6 + 16) = xmmword_2421B0720;
  *(_QWORD *)(v6 + 32) = a1;
  *(_QWORD *)(v6 + 40) = a2;
  sub_242199714();
  v7 = (id)sub_2421AFAF0();
  sub_242199434();
  sub_2421993D4(v4, sel_unsubscribe_subscriptionNames_queue_completion_, (uint64_t)v5, (uint64_t)v7);

}

uint64_t sub_2421970C0(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v13[5];
  _QWORD v14[3];
  uint64_t v15;
  uint64_t v16[3];
  uint64_t AssociatedTypeWitness;
  uint64_t AssociatedConformanceWitness;

  sub_24218D500(&qword_2543A67E8);
  sub_2421992E8();
  MEMORY[0x24BDAC7A8](v3);
  sub_2421995E0();
  sub_242198260(a1, a1[3]);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  sub_24218E080(v16);
  v4 = sub_2421AF73C();
  sub_242199B5C(v4, v5, &qword_2571DF330);
  if (v15)
  {
    sub_242198260(v14, v15);
    v13[3] = swift_getAssociatedTypeWitness();
    v13[4] = swift_getAssociatedConformanceWitness();
    sub_24218E080(v13);
    sub_2421AF52C();
    sub_2421AF670();
    v6 = sub_2421997A8();
    sub_24218D5C8(v1, 0, 1, v6);
    sub_24218E18C((uint64_t)v13);
    v7 = sub_24218E18C((uint64_t)v14);
  }
  else
  {
    sub_242199198((uint64_t)v14, &qword_2571DF330);
    v9 = sub_2421997A8();
    v7 = sub_24218D5C8(v1, 1, 1, v9);
  }
  sub_242199B5C(v7, v8, &qword_2571DF330);
  if (v15)
  {
    sub_242198260(v14, v15);
    sub_2421AF520();
    sub_24218E18C((uint64_t)v14);
  }
  else
  {
    sub_242199198((uint64_t)v14, &qword_2571DF330);
  }
  v10 = objc_allocWithZone((Class)sub_2421AF7B4());
  v11 = sub_2421AF79C();
  sub_242199198((uint64_t)v16, &qword_2571DF330);
  return v11;
}

id sub_242197340(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v5;
  void *v6;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;

  v6 = v5;
  v10 = (void *)sub_2421AFA6C();
  swift_bridgeObjectRelease();
  if (a3)
  {
    sub_24218D500(&qword_2543A68C8);
    v11 = (void *)sub_2421AF9DC();
    swift_bridgeObjectRelease();
    if (a4)
    {
LABEL_3:
      v12 = (void *)sub_2421AF9DC();
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    v11 = 0;
    if (a4)
      goto LABEL_3;
  }
  v12 = 0;
LABEL_6:
  v13 = sub_2421AF4A8();
  v14 = 0;
  if (sub_24218E0BC(a5, 1, v13) != 1)
  {
    v14 = (void *)sub_2421AF478();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 8))(a5, v13);
  }
  v15 = objc_msgSend(v6, sel_init_assetSets_usageAliases_expires_, v10, v11, v12, v14);

  return v15;
}

unint64_t sub_242197484(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_2421AFD84();
  sub_2421AFAC0();
  v4 = sub_2421AFD9C();
  return sub_242197850(a1, a2, v4);
}

void sub_2421974E8(uint64_t a1, char a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  int64_t v12;
  unint64_t v13;
  unint64_t i;
  int64_t v15;
  _QWORD *v16;
  unint64_t v17;
  int64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  BOOL v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  _QWORD *v36;
  uint64_t v37;
  _QWORD *v38;
  int64_t v39;
  uint64_t v40;
  char v41;

  v3 = v2;
  v5 = *v2;
  sub_24218D500(&qword_2543A6938);
  v41 = a2;
  v6 = sub_2421AFD0C();
  v7 = (_QWORD *)v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_39;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v40 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v38 = v2;
  v39 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  swift_retain();
  v12 = 0;
  if (!v10)
    goto LABEL_7;
LABEL_6:
  v13 = __clz(__rbit64(v10));
  v10 &= v10 - 1;
  for (i = v13 | (v12 << 6); ; i = __clz(__rbit64(v17)) + (v12 << 6))
  {
    v19 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * i);
    v21 = *v19;
    v20 = v19[1];
    v22 = (uint64_t *)(*(_QWORD *)(v5 + 56) + 16 * i);
    v23 = *v22;
    v24 = v22[1];
    if ((v41 & 1) == 0)
    {
      sub_242199AA8();
      sub_242199750();
    }
    sub_2421AFD84();
    sub_2421AFAC0();
    sub_2421AFD9C();
    sub_242199BA4();
    if (((v27 << v26) & ~*(_QWORD *)(v11 + 8 * v25)) == 0)
    {
      sub_242199B68();
      while (++v29 != v30 || (v28 & 1) == 0)
      {
        v31 = v29 == v30;
        if (v29 == v30)
          v29 = 0;
        v28 |= v31;
        if (*(_QWORD *)(v11 + 8 * v29) != -1)
        {
          sub_242199B48();
          goto LABEL_30;
        }
      }
      __break(1u);
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return;
    }
    sub_242199B90();
LABEL_30:
    sub_242199B24();
    *(_QWORD *)(v11 + v32) |= v33;
    v35 = (_QWORD *)(v7[6] + 16 * v34);
    *v35 = v21;
    v35[1] = v20;
    v36 = (_QWORD *)(v7[7] + 16 * v34);
    *v36 = v23;
    v36[1] = v24;
    ++v7[2];
    if (v10)
      goto LABEL_6;
LABEL_7:
    v15 = v12 + 1;
    if (__OFADD__(v12, 1))
      goto LABEL_41;
    if (v15 >= v39)
    {
      sub_242199ACC();
      v3 = v38;
      v16 = (_QWORD *)(v5 + 64);
      goto LABEL_34;
    }
    v16 = (_QWORD *)(v5 + 64);
    v17 = *(_QWORD *)(v40 + 8 * v15);
    ++v12;
    if (!v17)
    {
      v12 = v15 + 1;
      if (v15 + 1 >= v39)
        goto LABEL_32;
      v17 = *(_QWORD *)(v40 + 8 * v12);
      if (!v17)
        break;
    }
LABEL_18:
    v10 = (v17 - 1) & v17;
  }
  v18 = v15 + 2;
  if (v18 < v39)
  {
    v17 = *(_QWORD *)(v40 + 8 * v18);
    if (!v17)
    {
      while (1)
      {
        v12 = v18 + 1;
        if (__OFADD__(v18, 1))
          goto LABEL_42;
        if (v12 >= v39)
          goto LABEL_32;
        v17 = *(_QWORD *)(v40 + 8 * v12);
        ++v18;
        if (v17)
          goto LABEL_18;
      }
    }
    v12 = v18;
    goto LABEL_18;
  }
LABEL_32:
  sub_242199ACC();
  v3 = v38;
LABEL_34:
  if ((v41 & 1) != 0)
  {
    v37 = 1 << *(_BYTE *)(v5 + 32);
    if (v37 >= 64)
      sub_242197930(0, (unint64_t)(v37 + 63) >> 6, v16);
    else
      *v16 = -1 << v37;
    *(_QWORD *)(v5 + 16) = 0;
  }
LABEL_39:
  sub_242199ACC();
  *v3 = v7;
}

_OWORD *sub_2421977A4(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  _OWORD *v11;
  _OWORD *result;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  sub_2421996C4(a5 + 8 * (a1 >> 6));
  v8 = (_QWORD *)(*(_QWORD *)(v6 + 48) + 16 * v7);
  *v8 = v9;
  v8[1] = v10;
  result = sub_24218E140(v11, (_OWORD *)(*(_QWORD *)(v6 + 56) + 32 * v7));
  v13 = *(_QWORD *)(a5 + 16);
  v14 = __OFADD__(v13, 1);
  v15 = v13 + 1;
  if (v14)
    __break(1u);
  else
    *(_QWORD *)(a5 + 16) = v15;
  return result;
}

void sub_242197804(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;

  sub_2421996C4(a6 + 8 * (a1 >> 6));
  v8 = (_QWORD *)(v6[6] + 16 * v7);
  *v8 = v9;
  v8[1] = v10;
  v11 = (_QWORD *)(v6[7] + 16 * v7);
  *v11 = v12;
  v11[1] = v13;
  v14 = v6[2];
  v15 = __OFADD__(v14, 1);
  v16 = v14 + 1;
  if (v15)
    __break(1u);
  else
    v6[2] = v16;
}

unint64_t sub_242197850(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_2421AFD54() & 1) == 0)
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
      while (!v14 && (sub_2421AFD54() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_242197930(uint64_t result, uint64_t a2, _QWORD *a3)
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

size_t sub_24219794C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  _QWORD *v6;
  size_t result;
  _QWORD *v9;
  uint64_t v10;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return MEMORY[0x24BEE4AF8];
  sub_24218D500(&qword_2543A6B20);
  v3 = *(_QWORD *)(sub_2421AF70C() - 8);
  v4 = *(_QWORD *)(v3 + 72);
  v5 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v6 = (_QWORD *)swift_allocObject();
  result = j__malloc_size(v6);
  if (v4)
  {
    if (result - v5 != 0x8000000000000000 || v4 != -1)
    {
      v6[2] = v1;
      v6[3] = 2 * ((uint64_t)(result - v5) / v4);
      v9 = sub_242198B1C(&v10, (uint64_t)v6 + v5, v1, a1);
      swift_bridgeObjectRetain();
      sub_242198FFC();
      if (v9 == (_QWORD *)v1)
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

uint64_t sub_242197A64(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  char v5;
  unsigned int v6;
  unint64_t v7;
  uint64_t isStackAllocationSafe;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = *(_BYTE *)(a1 + 32);
  v6 = v5 & 0x3F;
  v7 = (unint64_t)((1 << v5) + 63) >> 6;
  isStackAllocationSafe = swift_bridgeObjectRetain_n();
  if (v6 <= 0xD || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x24BDAC7A8](isStackAllocationSafe);
    v9 = (_QWORD *)((char *)v13 - ((8 * v7 + 15) & 0x3FFFFFFFFFFFFFF0));
    sub_242197930(0, v7, v9);
    swift_bridgeObjectRetain();
    v10 = sub_242197C68((uint64_t)v9, v7, a1, a2);
    swift_release();
    if (v2)
      swift_willThrow();
    swift_bridgeObjectRelease_n();
  }
  else
  {
    v11 = (_QWORD *)swift_slowAlloc();
    sub_242197930(0, v7, v11);
    swift_bridgeObjectRetain();
    v10 = sub_242197C68((uint64_t)v11, v7, a1, a2);
    swift_release();
    MEMORY[0x2426A51D4](v11, -1, -1);
    swift_bridgeObjectRelease_n();
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_242197C30(uint64_t a1, unint64_t *a2)
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

uint64_t sub_242197C68(uint64_t result, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  int64_t v10;
  unint64_t v11;
  int64_t v12;
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
  uint64_t v24;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
  int64_t v38;
  uint64_t v39;
  unint64_t v40;
  _QWORD *v41;
  uint64_t *v42;
  uint64_t v43;
  int64_t v44;

  v33 = a2;
  v4 = 0;
  v39 = a3;
  v5 = *(_QWORD *)(a3 + 56);
  v36 = 0;
  v37 = a3 + 56;
  v6 = 1 << *(_BYTE *)(a3 + 32);
  v7 = -1;
  if (v6 < 64)
    v7 = ~(-1 << v6);
  v8 = v7 & v5;
  v38 = (unint64_t)(v6 + 63) >> 6;
  v41 = a4;
  v34 = result;
  v35 = a4 + 7;
  while (1)
  {
    while (1)
    {
      if (v8)
      {
        v43 = (v8 - 1) & v8;
        v44 = v4;
        v9 = __clz(__rbit64(v8)) | (v4 << 6);
      }
      else
      {
        v10 = v4 + 1;
        if (__OFADD__(v4, 1))
          goto LABEL_41;
        if (v10 >= v38)
          goto LABEL_39;
        v11 = *(_QWORD *)(v37 + 8 * v10);
        v12 = v4 + 1;
        if (!v11)
        {
          v12 = v4 + 2;
          if (v4 + 2 >= v38)
            goto LABEL_39;
          v11 = *(_QWORD *)(v37 + 8 * v12);
          if (!v11)
          {
            v12 = v4 + 3;
            if (v4 + 3 >= v38)
              goto LABEL_39;
            v11 = *(_QWORD *)(v37 + 8 * v12);
            if (!v11)
            {
              v13 = v4 + 4;
              if (v4 + 4 >= v38)
                goto LABEL_39;
              v11 = *(_QWORD *)(v37 + 8 * v13);
              if (!v11)
              {
                while (1)
                {
                  v12 = v13 + 1;
                  if (__OFADD__(v13, 1))
                    goto LABEL_42;
                  if (v12 >= v38)
                    goto LABEL_39;
                  v11 = *(_QWORD *)(v37 + 8 * v12);
                  ++v13;
                  if (v11)
                    goto LABEL_19;
                }
              }
              v12 = v4 + 4;
            }
          }
        }
LABEL_19:
        v43 = (v11 - 1) & v11;
        v44 = v12;
        v9 = __clz(__rbit64(v11)) + (v12 << 6);
      }
      v14 = sub_2421AF70C();
      v42 = &v33;
      v15 = *(_QWORD *)(v14 - 8);
      MEMORY[0x24BDAC7A8](v14);
      v17 = (char *)&v33 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
      v18 = *(_QWORD *)(v39 + 48);
      v19 = *(_QWORD *)(v15 + 72);
      v40 = v9;
      (*(void (**)(char *, unint64_t, uint64_t))(v15 + 16))(v17, v18 + v19 * v9, v14);
      v20 = sub_2421AF6DC();
      v22 = v21;
      v23 = v41[2];
      if (v23)
        break;
LABEL_35:
      swift_bridgeObjectRelease();
      result = (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v17, v14);
      v8 = v43;
      v4 = v44;
    }
    v24 = v20;
    if (v41[4] != v20 || v41[5] != v21)
    {
      result = sub_2421AFD54();
      if ((result & 1) == 0)
        break;
    }
LABEL_36:
    swift_bridgeObjectRelease();
    result = (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v17, v14);
    *(_QWORD *)(v34 + ((v40 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v40;
    v30 = __OFADD__(v36++, 1);
    v4 = v44;
    v8 = v43;
    if (v30)
    {
      __break(1u);
LABEL_39:
      swift_retain();
      sub_242197FD4();
      v32 = v31;
      swift_bridgeObjectRelease();
      return v32;
    }
  }
  if (v23 == 1)
    goto LABEL_35;
  v26 = v35;
  v27 = 1;
  while (1)
  {
    v28 = v27 + 1;
    if (__OFADD__(v27, 1))
      break;
    if (*(v26 - 1) == v24 && *v26 == v22)
      goto LABEL_36;
    result = sub_2421AFD54();
    if ((result & 1) != 0)
      goto LABEL_36;
    v26 += 2;
    ++v27;
    if (v28 == v23)
      goto LABEL_35;
  }
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
  return result;
}

void sub_242197FB0()
{
  sub_242197FD4();
}

void sub_242197FD4()
{
  unint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  unint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t);
  unint64_t v18;
  unint64_t v19;
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
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  BOOL v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t);
  unint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t **v51;

  sub_242199548();
  v48 = v5;
  v49 = v6;
  v47 = v7;
  v8 = v3;
  if (!v2)
  {
    sub_242199B38();
LABEL_36:
    sub_242199304();
    return;
  }
  v9 = v2;
  if (*(_QWORD *)(v3 + 16) == v2)
    goto LABEL_36;
  v10 = v1;
  v11 = v0;
  sub_24218D500(v4);
  v12 = sub_2421AFC4C();
  v13 = v12;
  v44 = v11;
  v45 = v10;
  if (v10 < 1)
    v14 = 0;
  else
    v14 = *v11;
  v15 = 0;
  v16 = v12 + 56;
  v46 = v8;
  v17 = v47;
  while (1)
  {
    if (v14)
    {
      v18 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      v50 = v15;
      v19 = v18 | (v15 << 6);
    }
    else
    {
      v20 = v15 + 1;
      if (__OFADD__(v15, 1))
        goto LABEL_39;
      if (v20 >= v45)
      {
LABEL_35:
        sub_242199B38();
        goto LABEL_36;
      }
      if (!v44[v20])
      {
        if (v15 + 2 >= v45)
          goto LABEL_35;
        if (!v44[v15 + 2])
        {
          if (v15 + 3 >= v45)
            goto LABEL_35;
          if (!v44[v15 + 3])
          {
            v21 = v15 + 4;
            if (v15 + 4 >= v45)
              goto LABEL_35;
            if (!v44[v21])
            {
              do
              {
                v22 = v21 + 1;
                if (__OFADD__(v21, 1))
                  goto LABEL_40;
                if (v22 >= v45)
                  goto LABEL_35;
                ++v21;
              }
              while (!v44[v22]);
            }
          }
        }
      }
      sub_2421999C0();
      v14 = v24 & v23;
      v50 = v25;
      v19 = v26 + (v25 << 6);
    }
    v27 = v17(0);
    v51 = &v44;
    v28 = *(_QWORD *)(v27 - 8);
    MEMORY[0x24BDAC7A8](v27);
    v30 = (char *)&v44 - v29;
    v31 = *(_QWORD *)(v8 + 48);
    v32 = *(_QWORD *)(v28 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v28 + 16))(v30, v31 + v32 * v19, v27);
    sub_242199250(v48, v17, v49);
    sub_2421AFA00();
    sub_242199BA4();
    if (((v35 << v34) & ~*(_QWORD *)(v16 + 8 * v33)) == 0)
      break;
    sub_242199B90();
LABEL_33:
    sub_242199B24();
    *(_QWORD *)(v16 + v40) |= v41;
    (*(void (**)(uint64_t, char *, uint64_t))(v28 + 32))(*(_QWORD *)(v13 + 48) + v42 * v32, v30, v27);
    ++*(_QWORD *)(v13 + 16);
    if (__OFSUB__(v9--, 1))
      goto LABEL_38;
    v8 = v46;
    v15 = v50;
    if (!v9)
      goto LABEL_35;
  }
  sub_242199B68();
  while (++v37 != v38 || (v36 & 1) == 0)
  {
    v39 = v37 == v38;
    if (v37 == v38)
      v37 = 0;
    v36 |= v39;
    if (*(_QWORD *)(v16 + 8 * v37) != -1)
    {
      sub_242199B48();
      goto LABEL_33;
    }
  }
  __break(1u);
LABEL_38:
  __break(1u);
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
}

_QWORD *sub_242198260(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_242198284(uint64_t a1, uint64_t a2, uint64_t a3, char a4, _QWORD *a5)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  char v16;
  unint64_t v17;
  uint64_t v18;
  _BOOL8 v19;
  uint64_t v20;
  char v21;
  unint64_t v22;
  char v23;
  _QWORD *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t *v29;
  _QWORD *v30;
  uint64_t v31;
  BOOL v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t result;
  __int128 v38;

  sub_242198E2C(a1, a2, a3, &v38);
  swift_bridgeObjectRetain();
  swift_retain();
  v7 = sub_242198E68();
  if (v8)
  {
    v11 = v7;
    v12 = v8;
    v13 = v9;
    v14 = v10;
    while (1)
    {
      v15 = (_QWORD *)*a5;
      v17 = sub_242197484(v11, v12);
      v18 = v15[2];
      v19 = (v16 & 1) == 0;
      v20 = v18 + v19;
      if (__OFADD__(v18, v19))
        break;
      v21 = v16;
      if (v15[3] >= v20)
      {
        if ((a4 & 1) == 0)
        {
          sub_24218D500(&qword_2543A6B10);
          sub_2421AFCD0();
        }
      }
      else
      {
        sub_2421974E8(v20, a4 & 1);
        v22 = sub_242197484(v11, v12);
        if ((v21 & 1) != (v23 & 1))
          goto LABEL_17;
        v17 = v22;
      }
      v24 = (_QWORD *)*a5;
      if ((v21 & 1) != 0)
      {
        v25 = (uint64_t *)(v24[7] + 16 * v17);
        v27 = *v25;
        v26 = v25[1];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v28 = (_QWORD *)(v24[7] + 16 * v17);
        swift_bridgeObjectRelease();
        *v28 = v27;
        v28[1] = v26;
      }
      else
      {
        v24[(v17 >> 6) + 8] |= 1 << v17;
        v29 = (uint64_t *)(v24[6] + 16 * v17);
        *v29 = v11;
        v29[1] = v12;
        v30 = (_QWORD *)(v24[7] + 16 * v17);
        *v30 = v13;
        v30[1] = v14;
        v31 = v24[2];
        v32 = __OFADD__(v31, 1);
        v33 = v31 + 1;
        if (v32)
          goto LABEL_16;
        v24[2] = v33;
      }
      v11 = sub_242198E68();
      v12 = v34;
      v13 = v35;
      v14 = v36;
      a4 = 1;
      if (!v34)
        goto LABEL_14;
    }
    __break(1u);
LABEL_16:
    __break(1u);
LABEL_17:
    result = sub_2421AFD6C();
    __break(1u);
  }
  else
  {
LABEL_14:
    swift_bridgeObjectRelease();
    swift_release();
    sub_242198FFC();
    return swift_release();
  }
  return result;
}

uint64_t sub_2421984AC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  char v5;
  unsigned int v6;
  unint64_t v7;
  uint64_t isStackAllocationSafe;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD v13[2];

  v4 = a1;
  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = *(_BYTE *)(a1 + 32);
  v6 = v5 & 0x3F;
  v7 = (unint64_t)((1 << v5) + 63) >> 6;
  isStackAllocationSafe = swift_bridgeObjectRetain_n();
  if (v6 <= 0xD || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x24BDAC7A8](isStackAllocationSafe);
    v9 = (_QWORD *)((char *)v13 - ((8 * v7 + 15) & 0x3FFFFFFFFFFFFFF0));
    sub_242197930(0, v7, v9);
    swift_bridgeObjectRetain();
    v10 = sub_242198668((uint64_t)v9, v7, v4, a2);
    if (v2)
      swift_willThrow();
    else
      v4 = v10;
    swift_bridgeObjectRelease_n();
  }
  else
  {
    v11 = (_QWORD *)swift_slowAlloc();
    sub_242197930(0, v7, v11);
    swift_bridgeObjectRetain();
    v4 = sub_242198668((uint64_t)v11, v7, v4, a2);
    MEMORY[0x2426A51D4](v11, -1, -1);
    swift_bridgeObjectRelease_n();
  }
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_242198668(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  int64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  int64_t v12;
  unint64_t v13;
  int64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v22;
  unint64_t *v24;
  _QWORD *v25;
  uint64_t v27;
  int64_t v28;

  v5 = 0;
  v6 = 0;
  v27 = a3 + 64;
  v7 = 1 << *(_BYTE *)(a3 + 32);
  v8 = -1;
  if (v7 < 64)
    v8 = ~(-1 << v7);
  v9 = v8 & *(_QWORD *)(a3 + 64);
  v28 = (unint64_t)(v7 + 63) >> 6;
  v24 = (unint64_t *)result;
  v25 = (_QWORD *)(a4 + 40);
  while (1)
  {
LABEL_4:
    if (v9)
    {
      v10 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      v11 = v10 | (v6 << 6);
      goto LABEL_20;
    }
    v12 = v6 + 1;
    if (__OFADD__(v6, 1))
    {
      __break(1u);
      goto LABEL_34;
    }
    if (v12 >= v28)
      goto LABEL_32;
    v13 = *(_QWORD *)(v27 + 8 * v12);
    ++v6;
    if (!v13)
    {
      v6 = v12 + 1;
      if (v12 + 1 >= v28)
        goto LABEL_32;
      v13 = *(_QWORD *)(v27 + 8 * v6);
      if (!v13)
      {
        v6 = v12 + 2;
        if (v12 + 2 >= v28)
          goto LABEL_32;
        v13 = *(_QWORD *)(v27 + 8 * v6);
        if (!v13)
          break;
      }
    }
LABEL_19:
    v9 = (v13 - 1) & v13;
    v11 = __clz(__rbit64(v13)) + (v6 << 6);
LABEL_20:
    v15 = *(_QWORD *)(a4 + 16);
    if (v15)
    {
      v16 = v25;
      v17 = (uint64_t *)(*(_QWORD *)(a3 + 48) + 16 * v11);
      v18 = *v17;
      v19 = v17[1];
      while (1)
      {
        result = *(v16 - 1);
        if (result == v18 && *v16 == v19)
          break;
        result = sub_2421AFD54();
        if ((result & 1) != 0)
          break;
        v16 += 2;
        if (!--v15)
          goto LABEL_4;
      }
      *(unint64_t *)((char *)v24 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
      if (__OFADD__(v5++, 1))
      {
        __break(1u);
LABEL_32:
        v22 = sub_242198870(v24, a2, v5, a3);
        swift_bridgeObjectRelease();
        return v22;
      }
    }
  }
  v14 = v12 + 3;
  if (v14 >= v28)
    goto LABEL_32;
  v13 = *(_QWORD *)(v27 + 8 * v14);
  if (v13)
  {
    v6 = v14;
    goto LABEL_19;
  }
  while (1)
  {
    v6 = v14 + 1;
    if (__OFADD__(v14, 1))
      break;
    if (v6 >= v28)
      goto LABEL_32;
    v13 = *(_QWORD *)(v27 + 8 * v6);
    ++v14;
    if (v13)
      goto LABEL_19;
  }
LABEL_34:
  __break(1u);
  return result;
}

uint64_t sub_242198870(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  char v30;
  unint64_t v31;
  BOOL v32;
  uint64_t v33;
  _QWORD *v34;
  _QWORD *v35;
  unint64_t *v37;
  uint64_t v38;
  uint64_t v39;

  if (!a3)
    return MEMORY[0x24BEE4B00];
  v4 = a4;
  v5 = a3;
  if (*(_QWORD *)(a4 + 16) == a3)
  {
    swift_retain();
    return v4;
  }
  sub_24218D500(&qword_2543A6938);
  result = sub_2421AFD18();
  v9 = result;
  v37 = a1;
  v38 = a2;
  if (a2 < 1)
    v10 = 0;
  else
    v10 = *a1;
  v11 = 0;
  v12 = result + 64;
  while (1)
  {
    if (v10)
    {
      v13 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v39 = v11;
      v14 = v13 | (v11 << 6);
    }
    else
    {
      v15 = v11 + 1;
      if (__OFADD__(v11, 1))
        goto LABEL_40;
      if (v15 >= v38)
        return v9;
      v16 = v37[v15];
      v17 = v11 + 1;
      if (!v16)
      {
        v17 = v11 + 2;
        if (v11 + 2 >= v38)
          return v9;
        v16 = v37[v17];
        if (!v16)
        {
          v17 = v11 + 3;
          if (v11 + 3 >= v38)
            return v9;
          v16 = v37[v17];
          if (!v16)
          {
            v18 = v11 + 4;
            if (v11 + 4 >= v38)
              return v9;
            v16 = v37[v18];
            if (!v16)
            {
              while (1)
              {
                v17 = v18 + 1;
                if (__OFADD__(v18, 1))
                  goto LABEL_41;
                if (v17 >= v38)
                  return v9;
                v16 = v37[v17];
                ++v18;
                if (v16)
                  goto LABEL_24;
              }
            }
            v17 = v11 + 4;
          }
        }
      }
LABEL_24:
      v10 = (v16 - 1) & v16;
      v39 = v17;
      v14 = __clz(__rbit64(v16)) + (v17 << 6);
    }
    v19 = v4;
    v20 = (uint64_t *)(*(_QWORD *)(v4 + 48) + 16 * v14);
    v22 = *v20;
    v21 = v20[1];
    v23 = (uint64_t *)(*(_QWORD *)(v4 + 56) + 16 * v14);
    v24 = *v23;
    v25 = v23[1];
    sub_2421AFD84();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_2421AFAC0();
    result = sub_2421AFD9C();
    v26 = -1 << *(_BYTE *)(v9 + 32);
    v27 = result & ~v26;
    v28 = v27 >> 6;
    if (((-1 << v27) & ~*(_QWORD *)(v12 + 8 * (v27 >> 6))) == 0)
      break;
    v29 = __clz(__rbit64((-1 << v27) & ~*(_QWORD *)(v12 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
LABEL_34:
    *(_QWORD *)(v12 + ((v29 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v29;
    v34 = (_QWORD *)(*(_QWORD *)(v9 + 48) + 16 * v29);
    *v34 = v22;
    v34[1] = v21;
    v35 = (_QWORD *)(*(_QWORD *)(v9 + 56) + 16 * v29);
    *v35 = v24;
    v35[1] = v25;
    ++*(_QWORD *)(v9 + 16);
    if (__OFSUB__(v5--, 1))
      goto LABEL_39;
    v4 = v19;
    v11 = v39;
    if (!v5)
      return v9;
  }
  v30 = 0;
  v31 = (unint64_t)(63 - v26) >> 6;
  while (++v28 != v31 || (v30 & 1) == 0)
  {
    v32 = v28 == v31;
    if (v28 == v31)
      v28 = 0;
    v30 |= v32;
    v33 = *(_QWORD *)(v12 + 8 * v28);
    if (v33 != -1)
    {
      v29 = __clz(__rbit64(~v33)) + (v28 << 6);
      goto LABEL_34;
    }
  }
  __break(1u);
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

_QWORD *sub_242198B1C(_QWORD *result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  int64_t v20;
  char *v21;
  unint64_t v22;
  int64_t v23;
  unint64_t v24;
  unint64_t v25;
  int64_t v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(char *, char *, uint64_t);
  uint64_t v30;
  uint64_t v31;
  int64_t v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  int64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  v41 = a4;
  v6 = *(_QWORD *)(a4 + 56);
  v4 = a4 + 56;
  v5 = v6;
  v7 = -1 << *(_BYTE *)(v4 - 24);
  if (-v7 < 64)
    v8 = ~(-1 << -(char)v7);
  else
    v8 = -1;
  v9 = v8 & v5;
  if (!a2)
  {
    v20 = 0;
    v12 = 0;
LABEL_36:
    *result = v41;
    result[1] = v4;
    result[2] = ~v7;
    result[3] = v20;
    result[4] = v9;
    return (_QWORD *)v12;
  }
  if (!a3)
  {
    v20 = 0;
    v12 = 0;
    goto LABEL_36;
  }
  if (a3 < 0)
  {
LABEL_38:
    __break(1u);
    goto LABEL_39;
  }
  v42 = a2;
  v34 = result;
  v35 = v4;
  v11 = sub_2421AF70C();
  v12 = 0;
  v13 = *(_QWORD *)(v11 - 8);
  v37 = v11;
  v38 = v13;
  v14 = *(_QWORD *)(v13 + 64);
  v39 = a3;
  v40 = v14;
  v36 = (unint64_t)(63 - v7) >> 6;
  v32 = v36 - 1;
  v33 = v7;
  v15 = v11;
  while (1)
  {
    v16 = MEMORY[0x24BDAC7A8](v11);
    v18 = (char *)&v31 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
    result = (_QWORD *)MEMORY[0x24BDAC7A8](v16);
    v21 = (char *)&v31 - v19;
    if (v9)
    {
      v22 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      v23 = v20;
      v24 = v22 | (v20 << 6);
      goto LABEL_23;
    }
    v23 = v20 + 1;
    if (__OFADD__(v20, 1))
    {
      __break(1u);
      goto LABEL_38;
    }
    v4 = v35;
    if (v23 >= v36)
      goto LABEL_35;
    v25 = *(_QWORD *)(v35 + 8 * v23);
    if (!v25)
      break;
LABEL_22:
    v9 = (v25 - 1) & v25;
    v24 = __clz(__rbit64(v25)) + (v23 << 6);
LABEL_23:
    ++v12;
    v27 = v38;
    v28 = *(_QWORD *)(v38 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v38 + 16))((char *)&v31 - v19, *(_QWORD *)(v41 + 48) + v28 * v24, v15);
    v29 = *(void (**)(char *, char *, uint64_t))(v27 + 32);
    v29(v18, v21, v15);
    v30 = v42;
    v11 = ((uint64_t (*)(uint64_t, char *, uint64_t))v29)(v42, v18, v15);
    if (v12 == v39)
    {
      v12 = v39;
      result = v34;
      v4 = v35;
      v7 = v33;
      v20 = v23;
      goto LABEL_36;
    }
    v42 = v30 + v28;
  }
  v26 = v20 + 2;
  ++v20;
  if (v23 + 1 >= v36)
    goto LABEL_35;
  v25 = *(_QWORD *)(v35 + 8 * v26);
  if (v25)
    goto LABEL_15;
  v20 = v23 + 1;
  if (v23 + 2 >= v36)
    goto LABEL_35;
  v25 = *(_QWORD *)(v35 + 8 * (v23 + 2));
  if (v25)
  {
    v23 += 2;
    goto LABEL_22;
  }
  v20 = v23 + 2;
  if (v23 + 3 >= v36)
    goto LABEL_35;
  v25 = *(_QWORD *)(v35 + 8 * (v23 + 3));
  if (v25)
  {
    v23 += 3;
    goto LABEL_22;
  }
  v26 = v23 + 4;
  v20 = v23 + 3;
  if (v23 + 4 >= v36)
  {
LABEL_35:
    v9 = 0;
    v7 = v33;
    result = v34;
    goto LABEL_36;
  }
  v25 = *(_QWORD *)(v35 + 8 * v26);
  if (v25)
  {
LABEL_15:
    v23 = v26;
    goto LABEL_22;
  }
  while (1)
  {
    v23 = v26 + 1;
    if (__OFADD__(v26, 1))
      break;
    if (v23 >= v36)
    {
      v20 = v32;
      goto LABEL_35;
    }
    v25 = *(_QWORD *)(v35 + 8 * v23);
    ++v26;
    if (v25)
      goto LABEL_22;
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_242198DF8()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void sub_242198E1C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_2421A5D28(a1, a2, *(_QWORD *)(v2 + 16));
}

uint64_t sub_242198E24(uint64_t a1)
{
  uint64_t v1;

  return sub_2421A5D18(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_242198E2C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = -1 << *(_BYTE *)(a1 + 32);
  *a4 = a1;
  v7 = *(_QWORD *)(a1 + 64);
  result = a1 + 64;
  v6 = v7;
  a4[1] = result;
  a4[2] = ~v4;
  if (-v4 < 64)
    v8 = ~(-1 << -(char)v4);
  else
    v8 = -1;
  a4[3] = 0;
  a4[4] = v8 & v6;
  a4[5] = a2;
  a4[6] = a3;
  return result;
}

uint64_t sub_242198E68()
{
  uint64_t *v0;
  uint64_t v1;
  unint64_t v2;
  int64_t v3;
  int64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t *__return_ptr, _QWORD *);
  uint64_t result;
  int64_t v15;
  int64_t v16;
  uint64_t v17;
  unint64_t v18;
  int64_t v19;
  int64_t v20;
  uint64_t v21;
  _QWORD v22[4];

  v1 = *v0;
  v3 = v0[3];
  v2 = v0[4];
  v4 = v3;
  if (v2)
  {
    v5 = (v2 - 1) & v2;
    v6 = __clz(__rbit64(v2)) | (v3 << 6);
LABEL_3:
    v7 = (uint64_t *)(*(_QWORD *)(v1 + 48) + 16 * v6);
    v8 = *v7;
    v9 = v7[1];
    v10 = (uint64_t *)(*(_QWORD *)(v1 + 56) + 16 * v6);
    v11 = *v10;
    v12 = v10[1];
    v0[3] = v4;
    v0[4] = v5;
    v13 = (void (*)(uint64_t *__return_ptr, _QWORD *))v0[5];
    v22[0] = v8;
    v22[1] = v9;
    v22[2] = v11;
    v22[3] = v12;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v13(&v21, v22);
    swift_bridgeObjectRelease();
    sub_24219978C();
    return v21;
  }
  v15 = v3 + 1;
  if (__OFADD__(v3, 1))
  {
    __break(1u);
  }
  else
  {
    v16 = (unint64_t)(v0[2] + 64) >> 6;
    if (v15 < v16)
    {
      v17 = v0[1];
      v18 = *(_QWORD *)(v17 + 8 * v15);
      if (v18)
      {
LABEL_7:
        v5 = (v18 - 1) & v18;
        v6 = __clz(__rbit64(v18)) + (v15 << 6);
        v4 = v15;
        goto LABEL_3;
      }
      v19 = v3 + 2;
      v4 = v3 + 1;
      if (v3 + 2 < v16)
      {
        v18 = *(_QWORD *)(v17 + 8 * v19);
        if (v18)
        {
LABEL_10:
          v15 = v19;
          goto LABEL_7;
        }
        v4 = v3 + 2;
        if (v3 + 3 < v16)
        {
          v18 = *(_QWORD *)(v17 + 8 * (v3 + 3));
          if (v18)
          {
            v15 = v3 + 3;
            goto LABEL_7;
          }
          v19 = v3 + 4;
          v4 = v3 + 3;
          if (v3 + 4 < v16)
          {
            v18 = *(_QWORD *)(v17 + 8 * v19);
            if (v18)
              goto LABEL_10;
            v15 = v3 + 5;
            v4 = v3 + 4;
            if (v3 + 5 < v16)
            {
              v18 = *(_QWORD *)(v17 + 8 * v15);
              if (v18)
                goto LABEL_7;
              v4 = v16 - 1;
              v20 = v3 + 6;
              while (v20 < v16)
              {
                v18 = *(_QWORD *)(v17 + 8 * v20++);
                if (v18)
                {
                  v15 = v20 - 1;
                  goto LABEL_7;
                }
              }
            }
          }
        }
      }
    }
    result = 0;
    v0[3] = v4;
    v0[4] = 0;
  }
  return result;
}

uint64_t sub_242198FFC()
{
  return swift_release();
}

uint64_t sub_242199004(uint64_t result, int a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  if (result < 0 || 1 << *(_BYTE *)(a4 + 32) <= result)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (((*(_QWORD *)(a4 + (((unint64_t)result >> 3) & 0xFFFFFFFFFFFFF8) + 56) >> result) & 1) == 0)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (*(_DWORD *)(a4 + 36) == a2)
  {
    v4 = *(_QWORD *)(*(_QWORD *)(a4 + 48) + 16 * result);
    swift_bridgeObjectRetain();
    return v4;
  }
LABEL_8:
  __break(1u);
  return result;
}

uint64_t sub_242199080(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;
  unsigned int v6;
  uint64_t i;

  v1 = *(_QWORD *)(a1 + 56);
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
  v1 = *(_QWORD *)(a1 + 64);
  if (v1)
  {
    v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  v2 = 64;
  for (i = 9; i - 7 < (unint64_t)(v3 + 63) >> 6; ++i)
  {
    v1 = *(_QWORD *)(a1 + 8 * i);
    v2 += 64;
    if (v1)
      return __clz(__rbit64(v1)) + v2;
  }
  return v3;
}

uint64_t sub_242199100()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_242199124(uint64_t result)
{
  if ((*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 24) - 8) + 80) & 0x20000) != 0)
    JUMPOUT(0x2426A51D4);
  return result;
}

void sub_242199158(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_24218D500(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  sub_242199A90();
}

void sub_242199198(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_24218D500(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  sub_242199A90();
}

uint64_t sub_2421991D0()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_2421991F4()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_242199228(uint64_t a1)
{
  uint64_t v1;

  return sub_242196760(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(uint64_t (**)(uint64_t))(v1 + 40));
}

uint64_t sub_242199238(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_242199248()
{
  return swift_release();
}

void sub_242199250(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t v5;

  if (!*a1)
  {
    v5 = a2(255);
    atomic_store(MEMORY[0x2426A5144](a3, v5), a1);
  }
  sub_242199A90();
}

uint64_t sub_24219928C(uint64_t a1)
{
  return sub_242196D44(a1) & 1;
}

uint64_t sub_2421992BC()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 - 368) + 8))(*(_QWORD *)(v0 - 376), *(_QWORD *)(v0 - 360));
}

void sub_24219931C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  *(_QWORD *)(v11 - 256) = (char *)&a9 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)(v11 - 248) = v9;
  *(_QWORD *)(v11 - 280) = (unint64_t)(v10 + 63) >> 6;
}

uint64_t sub_242199354()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t sub_242199364(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  *(_QWORD *)(v12 - 272) = v9;
  *(_QWORD *)(v12 - 280) = (char *)&a9 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)(v12 - 312) = (unint64_t)(v10 + 63) >> 6;
  *(_QWORD *)(v12 - 240) = v11;
  return swift_bridgeObjectRetain();
}

uint64_t sub_2421993A4()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_2421993AC()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 - 360) + 8))(*(_QWORD *)(v0 - 368), *(_QWORD *)(v0 - 352));
}

uint64_t sub_2421993CC@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, _QWORD)@<X8>)
{
  uint64_t v2;

  return a2(a1, *(_QWORD *)(v2 - 256));
}

id sub_2421993D4(id a1, SEL a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(a1, a2, a3, a4, 0, 0);
}

uint64_t sub_2421993E0()
{
  return swift_allocObject();
}

uint64_t sub_2421993EC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(v3 + 16))(*(_QWORD *)(v4 - 256), v1 + *(_QWORD *)(v3 + 72) * a1, v2);
}

void sub_242199414(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;

  *(_QWORD *)(v9 - 312) = &a9;
}

uint64_t sub_242199434()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_242199454()
{
  return swift_dynamicCast();
}

uint64_t sub_24219946C()
{
  return swift_release();
}

uint64_t sub_242199474()
{
  return sub_2421AFA6C();
}

uint64_t sub_24219947C()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_242199484()
{
  return sub_2421AF70C();
}

uint64_t sub_24219948C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  return (*(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 32))((char *)&a9 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v12, v10);
}

uint64_t sub_2421994C8()
{
  return swift_allocObject();
}

uint64_t sub_2421994D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  return (*(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 32))((char *)&a9 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v10, v12);
}

uint64_t sub_2421994F8@<X0>(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (*(uint64_t (**)(char *, _QWORD, uint64_t))(v3 + 16))((char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0), *(_QWORD *)(v4 - 256), v2);
}

uint64_t sub_242199520()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_242199560(float a1)
{
  float *v1;

  *v1 = a1;
  return sub_2421AF778();
}

uint64_t sub_242199574()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 232) = v0;
  return swift_slowAlloc();
}

uint64_t sub_242199588()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_242199590@<X0>(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 344) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
  return sub_2421AF430();
}

void sub_2421995B4(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  uint8_t *v5;
  os_log_type_t v6;

  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

uint64_t sub_2421995F8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(v2 + 16))(*(_QWORD *)(v4 - 280), v1 + *(_QWORD *)(v2 + 72) * a1, v3);
}

void sub_242199618()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 320) = v0 + 56;
}

uint64_t sub_242199630()
{
  return swift_arrayDestroy();
}

uint64_t sub_242199640(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 176) = a1;
  return sub_2421AFBEC();
}

BOOL sub_24219965C(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t sub_24219966C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *(_OWORD *)(a1 + 16) = *(_OWORD *)(v3 - 272);
  *(_QWORD *)(a1 + 32) = v2;
  *(_QWORD *)(a1 + 40) = v1;
  return swift_bridgeObjectRetain();
}

char *sub_242199688(uint64_t a1, int64_t a2)
{
  return sub_2421A2F74(0, a2, 0);
}

uint64_t sub_242199698()
{
  return swift_release();
}

uint64_t sub_2421996A0()
{
  return sub_2421AF58C();
}

char *sub_2421996BC(char *a1, int64_t a2)
{
  return sub_2421A2F74(a1, a2, 1);
}

void sub_2421996C4(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(a1 + 64) |= v1;
}

uint64_t sub_2421996D4()
{
  uint64_t v0;

  return *(_QWORD *)(v0 - 344);
}

void sub_2421996F4()
{
  sub_24219568C();
}

uint64_t sub_24219970C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

uint64_t sub_242199714()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_24219971C(uint64_t a1, unint64_t *a2)
{
  return sub_242197C30(0, a2);
}

uint64_t sub_242199724()
{
  uint64_t v0;

  *(_QWORD *)(v0 - 144) = 0;
  *(_OWORD *)(v0 - 176) = 0u;
  *(_OWORD *)(v0 - 160) = 0u;
  return v0 - 176;
}

uint64_t sub_242199738()
{
  return sub_2421AF784();
}

uint64_t sub_242199744()
{
  uint64_t v0;

  return sub_2421929F8(v0 - 128, v0 - 216);
}

uint64_t sub_242199750()
{
  return swift_bridgeObjectRetain();
}

unint64_t sub_242199758()
{
  uint64_t v0;
  uint64_t v1;

  return sub_242197484(v1, v0);
}

void sub_242199764(uint64_t a1, unint64_t a2)
{
  uint64_t v2;

  sub_2421A0BC4(a1, a2, (uint64_t *)(v2 - 128));
}

uint64_t sub_242199770()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_242199778()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v0, v2);
}

uint64_t sub_24219978C()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_242199794()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_2421997A8()
{
  return sub_2421AF430();
}

void sub_2421997B0()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 232) = v0;
}

char *sub_2421997CC()
{
  int64_t v0;

  return sub_2421A2F74(0, v0, 0);
}

void sub_2421997E0()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 232) = v0;
}

uint64_t sub_2421997EC(uint64_t a1)
{
  uint64_t v1;

  return sub_24218E0BC(a1, 1, *(_QWORD *)(v1 - 328));
}

uint64_t sub_242199800(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_24218D5C8(a1, a2, 1, v2);
}

uint64_t sub_24219980C()
{
  uint64_t v0;
  uint64_t v1;

  return sub_24218D5C8(v1, 0, 1, v0);
}

void sub_24219982C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 232) = v0;
}

uint64_t sub_242199838()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_242199840@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return a1 - (v1 & 0xFFFFFFFFFFFFFFF0);
}

void sub_242199858()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 304) = v0 + 56;
}

uint64_t sub_242199868()
{
  return sub_2421AFB98();
}

__n128 sub_242199870(__n128 *a1)
{
  uint64_t v1;
  __n128 result;

  result = *(__n128 *)(v1 - 304);
  a1[1] = result;
  return result;
}

uint64_t sub_242199880()
{
  uint64_t v0;

  return *(_QWORD *)(v0 - 344);
}

uint64_t sub_242199898()
{
  return swift_release_n();
}

uint64_t sub_2421998A8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v0, v2);
}

uint64_t sub_2421998B8()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 376) = v0;
  return sub_2421AF580();
}

void sub_2421998C8()
{
  const void *v0;

  _Block_release(v0);
}

uint64_t sub_2421998D0()
{
  uint64_t v0;

  return v0;
}

void *sub_2421998E8()
{
  uint64_t v0;

  return _Block_copy(*(const void **)(v0 - 328));
}

uint64_t sub_2421998F8()
{
  return 0;
}

uint64_t sub_242199908()
{
  return swift_isUniquelyReferenced_nonNull_native();
}

void *sub_242199910()
{
  const void *v0;

  return _Block_copy(v0);
}

uint64_t sub_242199918()
{
  return sub_2421AFACC();
}

uint64_t sub_242199938()
{
  return sub_2421AF4A8();
}

uint64_t sub_242199940()
{
  return sub_2421AF940();
}

uint64_t sub_2421999B0(uint64_t a1)
{
  uint64_t v1;

  return sub_24218D5C8(a1, 1, 1, v1);
}

uint64_t sub_2421999E0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  sub_24218D5C8(a1, 0, 1, v1);
  return sub_24218E18C(v2 - 176);
}

uint64_t sub_242199A00()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_242199A08()
{
  uint64_t v0;

  return sub_24218E18C(v0 - 128);
}

uint64_t sub_242199A10@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return a1 - (v1 & 0xFFFFFFFFFFFFFFF0);
}

void sub_242199A24(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 240) = a1 - (v1 & 0xFFFFFFFFFFFFFFF0);
}

uint64_t sub_242199A38()
{
  return sub_2421AFAFC();
}

id sub_242199A44(id a1, SEL a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 248) = a1;
  return objc_msgSend(a1, a2);
}

id sub_242199A4C()
{
  uint64_t v0;
  uint64_t v1;

  return *(id *)(v0 + 8 * v1 + 32);
}

uint64_t sub_242199A58(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(uint64_t, uint64_t, uint64_t);
  uint64_t v3;

  return v2(a1, a2, v3);
}

uint64_t sub_242199A60(uint64_t (*a1)(char *), uint64_t a2, uint64_t a3)
{
  return sub_242196D60(a1, a2, a3);
}

uint64_t sub_242199A68()
{
  return sub_2421AF538();
}

unint64_t sub_242199A70()
{
  uint64_t v0;
  uint64_t v1;

  return sub_242197484(v0, v1);
}

void sub_242199A7C()
{
  void *v0;

}

uint64_t sub_242199A88()
{
  return sub_2421AF844();
}

uint64_t sub_242199A98()
{
  return sub_24219CCA8();
}

id sub_242199AA0(uint64_t a1, const char *a2)
{
  uint64_t v2;

  return objc_msgSend(*(id *)(v2 - 248), a2);
}

uint64_t sub_242199AA8()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_242199AB0()
{
  return swift_retain();
}

uint64_t sub_242199ACC()
{
  return swift_release();
}

uint64_t sub_242199AD4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(a1, a2, v2);
}

uint64_t sub_242199ADC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(a1, a2, v2);
}

uint64_t sub_242199AE4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

uint64_t sub_242199AEC(uint64_t a1)
{
  uint64_t v1;

  return sub_24218E0BC(a1, 1, v1);
}

uint64_t sub_242199AF8()
{
  uint64_t v0;

  return *(_QWORD *)(v0 - 256);
}

uint64_t sub_242199B0C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 - 272))();
}

uint64_t sub_242199B38()
{
  return swift_release();
}

void sub_242199B40(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  sub_242199198(v2, a2);
}

void sub_242199B5C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  sub_242199158(v3 - 112, v3 - 160, a3);
}

uint64_t sub_242199B7C()
{
  return swift_bridgeObjectRetain();
}

void sub_242199B84()
{
  JUMPOUT(0x2426A4C4CLL);
}

uint64_t sub_242199BB8()
{
  uint64_t result;

  result = os_variant_has_internal_content();
  byte_2543A6BA8 = result;
  return result;
}

uint64_t sub_242199BDC()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for Utils()
{
  return objc_opt_self();
}

id sub_242199C0C()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v1 = (void *)sub_2421AFA6C();
  swift_bridgeObjectRelease();
  v2 = objc_msgSend(v0, sel_initWithMachServiceName_, v1);

  return v2;
}

uint64_t sub_242199C7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;

  sub_24219B7C0(a1, 0, 0, 0, 1, 0, 0);
  if (*(_QWORD *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2421AFB14();
    swift_unknownObjectRelease();
  }
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = a2;
  *(_QWORD *)(v5 + 24) = a3;
  return swift_task_create();
}

uint64_t static ModelCatalogDaemon.iOSSandboxProfileName.getter()
{
  return sub_24219BC5C((uint64_t *)&unk_2571DF3D8);
}

uint64_t static ModelCatalogDaemon.iOSSandboxProfileName.setter(uint64_t a1, uint64_t a2)
{
  return sub_24219BC54(a1, a2, qword_2571DF3D8);
}

uint64_t (*static ModelCatalogDaemon.iOSSandboxProfileName.modify())()
{
  sub_24219BCC8();
  return j__swift_endAccess;
}

uint64_t static ModelCatalogDaemon.macOSSandboxProfileName.getter()
{
  return sub_24219BC5C((uint64_t *)&unk_2571DF3E8);
}

uint64_t sub_242199DE0(uint64_t *a1)
{
  uint64_t v2;

  sub_24219BCC8();
  v2 = *a1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t static ModelCatalogDaemon.macOSSandboxProfileName.setter(uint64_t a1, uint64_t a2)
{
  return sub_24219BC54(a1, a2, qword_2571DF3E8);
}

uint64_t sub_242199E38(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4)
{
  sub_24219BCC8();
  *a3 = a1;
  *a4 = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*static ModelCatalogDaemon.macOSSandboxProfileName.modify())()
{
  sub_24219BCC8();
  return j_j__swift_endAccess;
}

uint64_t static ModelCatalogDaemon.start(using:)(NSObject *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  id v12;
  void *v13;
  unsigned int v14;
  id v15;
  void *v16;
  unsigned int v17;
  void *v18;
  os_log_type_t v19;
  _DWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;

  v2 = sub_24218D500(&qword_2543A6998);
  MEMORY[0x24BDAC7A8](v2);
  sub_242199978();
  v5 = v4 - v3;
  v6 = sub_2421AF430();
  MEMORY[0x24BDAC7A8](v6);
  sub_242199978();
  if (qword_2543A66F0 != -1)
    swift_once();
  v7 = sub_242199940();
  v8 = (void *)sub_24218E28C(v7, (uint64_t)qword_2543A6B60);
  v9 = sub_24219BCE4();
  v10 = sub_2421AFB74();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)sub_24218D61C();
    *(_WORD *)v11 = 0;
    sub_24219BB88(&dword_24218A000, v9, v10, "starting XPC services", v11);
    sub_24218D600();
  }

  sub_24219A244((uint64_t)a1);
  v12 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  sub_2421AF844();
  v13 = (void *)sub_2421AF40C();
  sub_24219BD20();
  v14 = sub_24219BB5C();

  v15 = 0;
  if (v14
    && (sub_2421AF850(),
        v16 = (void *)sub_2421AF40C(),
        sub_24219BD20(),
        v17 = sub_24219BB5C(),
        v16,
        v15 = 0,
        v17))
  {

  }
  else
  {
    v18 = v15;
    sub_2421AF3F4();

    swift_willThrow();
    sub_24219BD18();
    sub_24219BD18();
    sub_2421AF928();
    v19 = sub_24219BCC0();
    if (sub_24219BB3C(v19))
    {
      v20 = (_DWORD *)sub_24218D61C();
      v21 = (_QWORD *)sub_24218D61C();
      *v20 = 138412290;
      sub_24219BD18();
      v27 = _swift_stdlib_bridgeErrorToNSError();
      sub_24219BBE4();
      *v21 = v27;
      sub_24219BBDC();
      sub_24219BBDC();
      sub_24219BB08(&dword_24218A000, v22, v23, "Failed to create sideload directories: %@");
      sub_24218D500(&qword_2543A6B08);
      sub_24219BC64();
      sub_24218D600();
    }
    sub_24219BBDC();
    sub_24219BBDC();
    sub_24219BBDC();

  }
  sub_24218F248(a1);
  sub_2421AFB38();
  sub_24219BC38();
  v24 = sub_24219BD0C();
  *(_QWORD *)(v24 + 16) = 0;
  *(_QWORD *)(v24 + 24) = 0;
  sub_242199C7C(v5, (uint64_t)&unk_2571DF400, v24);
  swift_release();
  sub_24219BD00();
  sub_24219BC38();
  v25 = sub_24219BD0C();
  *(_QWORD *)(v25 + 16) = 0;
  *(_QWORD *)(v25 + 24) = 0;
  sub_242199C7C(v5, (uint64_t)&unk_2571DF408, v25);
  swift_release();
  return sub_24219BD00();
}

void sub_24219A244(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  id v14;

  v2 = sub_2421AF940();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24219BA5C();
  sub_2421AF5A4();
  sub_2421AF5C8();
  v6 = sub_242199C0C();
  v7 = (void *)qword_2543A6B58;
  qword_2543A6B58 = (uint64_t)v6;

  v8 = (void *)qword_2543A6B58;
  if (qword_2543A6B58)
  {
    v9 = objc_allocWithZone((Class)sub_24218D500(&qword_2543A68C0));
    v14 = v8;
    qword_2543A6B50 = (uint64_t)objc_msgSend(v9, sel_init);
    swift_unknownObjectRelease();
    objc_msgSend(v14, sel__setQueue_, a1);
    objc_msgSend(v14, sel_setDelegate_, qword_2543A6B50);
    objc_msgSend(v14, sel_resume);

  }
  else
  {
    sub_2421AF5E0();
    v10 = sub_2421AF928();
    v11 = sub_2421AFB8C();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_24218A000, v10, v11, "Failed to create Internal XPC service", v12, 2u);
      MEMORY[0x2426A51D4](v12, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
}

uint64_t sub_24219A430()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 24) = v1;
  *v1 = v0;
  v1[1] = sub_24219A474;
  return sub_24219A714();
}

uint64_t sub_24219A474()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 32) = v0;
  swift_task_dealloc();
  if (!v0)
    return sub_24219BB90(*(uint64_t (**)(void))(v2 + 8));
  sub_24219BC18();
  return sub_24219BB9C();
}

uint64_t sub_24219A4CC()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;
  id v5;
  os_log_type_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  sub_24219BCA4();
  if (qword_2543A66F0 != -1)
    swift_once();
  v1 = *(void **)(v0 + 32);
  v2 = sub_242199940();
  v3 = (void *)sub_24218E28C(v2, (uint64_t)qword_2543A6B60);
  v4 = v1;
  v5 = v1;
  sub_2421AF928();
  v6 = sub_24219BCC0();
  if (sub_24219BB3C(v6))
  {
    sub_24218D61C();
    v7 = (_QWORD *)sub_24218D61C();
    sub_24219BBF0(5.7779e-34);
    v8 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 16) = v8;
    sub_24219BBE4();
    *v7 = v8;
    sub_24219BAB4();
    sub_24219BAB4();
    sub_24219BB08(&dword_24218A000, v9, v10, "Error monitoring essential asset updates: %@");
    sub_24218D500(&qword_2543A6B08);
    sub_24219BC64();
    sub_24218D600();
  }
  sub_24219BAB4();
  sub_24219BAB4();
  sub_24219BAB4();

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_24219A61C()
{
  swift_unknownObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_24219A640()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_24219A698;
  sub_24219BBC8();
  return sub_24219A430();
}

uint64_t sub_24219A698()
{
  uint64_t v0;

  sub_24219BB1C();
  return sub_24219BB90(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_24219A6BC()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_24219BA98;
  sub_24219BBC8();
  return sub_24218FA2C();
}

uint64_t sub_24219A714()
{
  _QWORD *v0;
  uint64_t v1;

  v1 = sub_2421AF430();
  v0[39] = v1;
  v0[40] = *(_QWORD *)(v1 - 8);
  v0[41] = swift_task_alloc();
  v0[42] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_24219A780()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  os_log_type_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  __int128 *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  __int128 *v35;
  uint64_t v36;
  __int128 *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  os_log_type_t v46;
  uint64_t v47;
  uint64_t v48;
  _QWORD *v49;
  void *v51;
  __int128 *v52;
  uint64_t v53;
  __int128 *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t *v57;
  unint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void (*v61)(uint64_t, unint64_t, uint64_t *);
  uint64_t v62;

  if (qword_2543A66F0 != -1)
LABEL_42:
    swift_once();
  v2 = sub_242199940();
  v3 = sub_24218E28C(v2, (uint64_t)qword_2543A6B60);
  v1[43] = v3;
  v51 = (void *)v3;
  sub_24219BCE4();
  v4 = sub_24218D658();
  if (sub_24218D638(v4))
  {
    *(_WORD *)sub_24218D61C() = 0;
    sub_24219BAF4(&dword_24218A000, v5, v6, "Starting monitoring generative experiences essential assets updates");
    sub_24218D600();
  }
  v8 = v1[41];
  v7 = v1[42];
  v9 = v1;
  v10 = v1[40];
  v11 = v9[39];

  sub_2421AF844();
  v12 = sub_2421AF58C();
  v9[44] = v12;
  v9[45] = *(_QWORD *)(v12 - 8);
  v0 = (uint64_t *)sub_24219BAA4();
  v9[46] = (uint64_t)v0;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v8, v7, v11);
  sub_2421AF538();
  v13 = sub_2421AF580();
  v14 = v13;
  v15 = MEMORY[0x24BEE4AF8];
  v62 = MEMORY[0x24BEE4AF8];
  v56 = *(_QWORD *)(v13 + 16);
  v57 = v9;
  if (v56)
  {
    v16 = 0;
    v17 = (__int128 *)(v9 + 2);
    v52 = (__int128 *)(v9 + 7);
    v53 = v13;
    v54 = (__int128 *)(v9 + 2);
    v55 = v13 + 32;
    v1 = v9;
    while (1)
    {
      if (v16 >= *(_QWORD *)(v14 + 16))
      {
LABEL_41:
        __break(1u);
        goto LABEL_42;
      }
      v58 = v16;
      v59 = v15;
      sub_2421929F8(v55 + 40 * v16, (uint64_t)v17);
      sub_242198260(v17, v1[5]);
      v18 = sub_2421AF5BC();
      v0 = (uint64_t *)sub_2421AF838();
      v19 = *(v0 - 1);
      v20 = swift_task_alloc();
      (*(void (**)(uint64_t, _QWORD, uint64_t *))(v19 + 104))(v20, *MEMORY[0x24BE687A0], v0);
      v21 = swift_task_alloc();
      v22 = v21;
      v23 = *(uint64_t **)(v18 + 16);
      if (v23)
      {
        v24 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
        v61 = *(void (**)(uint64_t, unint64_t, uint64_t *))(v19 + 16);
        v61(v21, v18 + v24, v0);
        sub_24219BA04();
        v25 = sub_24219BC04();
        sub_24219BCDC(v22);
        if ((v25 & 1) != 0)
        {
LABEL_9:
          swift_task_dealloc();
          sub_24219BCDC(v20);
          swift_bridgeObjectRelease();
          sub_24219BC4C();
          v17 = v54;
          sub_24219BA44(v54, (uint64_t)v52);
          v15 = v59;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            v0 = &v62;
            sub_2421A2FAC(0, *(_QWORD *)(v59 + 16) + 1, 1);
            v15 = v62;
          }
          v14 = v53;
          v26 = v58;
          v28 = *(_QWORD *)(v15 + 16);
          v27 = *(_QWORD *)(v15 + 24);
          if (v28 >= v27 >> 1)
          {
            v0 = &v62;
            sub_2421A2FAC((char *)(v27 > 1), v28 + 1, 1);
            v15 = v62;
          }
          sub_24219BD38();
          sub_24219BA44(v52, v29);
          goto LABEL_20;
        }
        if (v23 != (uint64_t *)1)
        {
          v60 = *(_QWORD *)(v19 + 72);
          v30 = v18 + v60 + v24;
          v31 = 1;
          while (1)
          {
            v61(v22, v30, v0);
            v1 = (uint64_t *)(v31 + 1);
            if (__OFADD__(v31, 1))
              break;
            v32 = sub_24219BC04();
            sub_24219BCDC(v22);
            if ((v32 & 1) != 0)
              goto LABEL_9;
            ++v31;
            v30 += v60;
            if (v1 == v23)
              goto LABEL_19;
          }
          __break(1u);
          goto LABEL_41;
        }
      }
LABEL_19:
      swift_task_dealloc();
      (*(void (**)(uint64_t, uint64_t *))(v19 + 8))(v20, v0);
      swift_bridgeObjectRelease();
      sub_24219BC4C();
      v17 = v54;
      sub_24218E18C((uint64_t)v54);
      v26 = v58;
      v15 = v59;
      v14 = v53;
LABEL_20:
      v16 = v26 + 1;
      v1 = v57;
      if (v16 == v56)
        goto LABEL_23;
    }
  }
  v1 = v9;
LABEL_23:
  swift_bridgeObjectRelease();
  v33 = *(_QWORD *)(v15 + 16);
  if (v33)
  {
    v34 = (uint64_t)(v1 + 12);
    v35 = (__int128 *)(v1 + 17);
    v36 = (uint64_t)(v1 + 27);
    v37 = (__int128 *)(v1 + 32);
    v38 = (uint64_t)(v1 + 22);
    v39 = v15 + 32;
    swift_retain();
    v40 = MEMORY[0x24BEE4AF8];
    do
    {
      sub_2421929F8(v39, v34);
      sub_2421929F8(v34, v36);
      sub_24218D500(&qword_2543A67F8);
      sub_24218D500(&qword_2543A6808);
      if ((swift_dynamicCast() & 1) == 0)
      {
        *(_QWORD *)(v38 + 32) = 0;
        *(_OWORD *)v38 = 0u;
        *(_OWORD *)(v38 + 16) = 0u;
      }
      sub_24218E18C(v34);
      if (v1[25])
      {
        sub_24219BA44((__int128 *)v38, (uint64_t)v35);
        sub_24219BA44(v35, (uint64_t)v37);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_24219BD2C(0, *(_QWORD *)(v40 + 16) + 1);
          v40 = v44;
        }
        v42 = *(_QWORD *)(v40 + 16);
        v41 = *(_QWORD *)(v40 + 24);
        if (v42 >= v41 >> 1)
        {
          sub_24219BD2C(v41 > 1, v42 + 1);
          v40 = v45;
        }
        sub_24219BD38();
        sub_24219BA44(v37, v43);
        v1 = v57;
      }
      else
      {
        sub_24218E104(v38, &qword_2543A6A68);
      }
      v39 += 40;
      --v33;
    }
    while (v33);
    swift_release_n();
  }
  else
  {
    swift_release();
    v40 = MEMORY[0x24BEE4AF8];
  }
  v1[47] = v40;
  sub_2421AF928();
  v46 = sub_24218D658();
  if (sub_24218D638(v46))
  {
    *(_WORD *)sub_24218D61C() = 0;
    sub_24219BAF4(&dword_24218A000, v47, v48, "Checking is essential resources ready upon first launch");
    sub_24218D600();
  }

  v49 = (_QWORD *)swift_task_alloc();
  v1[48] = (uint64_t)v49;
  *v49 = v1;
  v49[1] = sub_24219ACFC;
  return static ModelCatalogDaemon.essentialResourcesReady(sideLoadUrl:waitForSystemReadiness:)(v1[42]);
}

uint64_t sub_24219ACFC(char a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 392) = v1;
  swift_task_dealloc();
  if (!v1)
    *(_BYTE *)(v4 + 464) = a1 & 1;
  sub_24219BC18();
  return sub_24219BB4C();
}

uint64_t sub_24219AD64()
{
  uint64_t v0;
  void *v1;
  os_log_type_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  sub_24219BCA4();
  if (*(_BYTE *)(v0 + 464) == 1)
  {
    v1 = *(void **)(v0 + 344);
    sub_2421AF928();
    v2 = sub_24218D658();
    if (sub_24218D638(v2))
    {
      *(_WORD *)sub_24218D61C() = 0;
      sub_24219BAF4(&dword_24218A000, v3, v4, "Notifying essential resources ready upon first launch");
      sub_24218D600();
    }

    sub_2421AF4F0();
  }
  v5 = *(_QWORD *)(v0 + 392);
  v6 = sub_24218D500(&qword_2543A69A0);
  *(_QWORD *)(v0 + 400) = v6;
  *(_QWORD *)(v0 + 408) = *(_QWORD *)(v6 - 8);
  *(_QWORD *)(v0 + 416) = sub_24219BAA4();
  sub_2421AF4E4();
  if (v5)
  {
    sub_24219BC24();
    sub_24219BC8C();
    sub_24219BC7C();
    sub_24219BC9C();
    sub_24219BC4C();
    swift_task_dealloc();
    sub_24219BCF8();
    return sub_24219BAD8(*(uint64_t (**)(void))(v0 + 8));
  }
  else
  {
    sub_24219BCD0();
    v8 = sub_24218D500((uint64_t *)&unk_2543A6AF8);
    *(_QWORD *)(v0 + 424) = v8;
    *(_QWORD *)(v0 + 432) = *(_QWORD *)(v8 - 8);
    v9 = sub_24219BAA4();
    sub_24219BC6C(v9);
    *(_QWORD *)(v0 + 448) = 0;
    v10 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 456) = v10;
    sub_24219BBA8(v10);
    return sub_24219BABC();
  }
}

uint64_t sub_24219AE98()
{
  swift_task_dealloc();
  sub_24219BC18();
  return sub_24219BB9C();
}

uint64_t sub_24219AEE0()
{
  os_log_type_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  char v6;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  _QWORD *v24;
  uint64_t v25;

  if (*(_QWORD *)(v1 + 304))
  {
    v2 = *(NSObject **)(v1 + 344);
    swift_bridgeObjectRelease();
    sub_2421AF928();
    v3 = sub_24218D658();
    if (sub_24219BB78(v3))
    {
      v4 = (uint8_t *)sub_24218D61C();
      *(_WORD *)v4 = 0;
      sub_24219BB88(&dword_24218A000, v2, v0, "Checking is essential resources ready upon asset update", v4);
      sub_24218D600();
    }
    v5 = *(_QWORD *)(v1 + 448);

    v6 = static ModelCatalogDaemon.isEssentialResourcesReady(sideLoadUrl:)();
    if (v5)
    {
      v7 = *(NSObject **)(v1 + 344);
      sub_24218D674();
      sub_24218D674();
      sub_2421AF928();
      v8 = sub_24219BCC0();
      if (os_log_type_enabled(v7, v8))
      {
        v9 = sub_24218D61C();
        v10 = (_QWORD *)sub_24218D61C();
        *(_DWORD *)v9 = 138412290;
        sub_24218D674();
        v11 = _swift_stdlib_bridgeErrorToNSError();
        *(_QWORD *)(v9 + 4) = v11;
        *v10 = v11;
        sub_24218D624();
        sub_24218D624();
        _os_log_impl(&dword_24218A000, v7, v8, "Error checking essential resources ready: %@", (uint8_t *)v9, 0xCu);
        sub_24218D500(&qword_2543A6B08);
        sub_24219BC64();
        sub_24218D600();
      }
      sub_24218D624();
      sub_24218D624();
      sub_24218D624();

    }
    else if ((v6 & 1) != 0)
    {
      v21 = *(NSObject **)(v1 + 344);
      sub_2421AF928();
      v22 = sub_24218D658();
      if (sub_24219BB78(v22))
      {
        v23 = (uint8_t *)sub_24218D61C();
        *(_WORD *)v23 = 0;
        sub_24219BB88(&dword_24218A000, v21, OS_LOG_TYPE_DEFAULT, "Notifying essential resources ready upon asset update", v23);
        sub_24218D600();
      }

      sub_2421AF4F0();
    }
    *(_QWORD *)(v1 + 448) = 0;
    v24 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v1 + 456) = v24;
    *v24 = v1;
    v24[1] = sub_24219AE98;
    sub_24219BC18();
    return sub_2421AFB50();
  }
  else
  {
    v12 = *(_QWORD *)(v1 + 416);
    v13 = *(_QWORD *)(v1 + 400);
    v14 = *(_QWORD *)(v1 + 408);
    v16 = *(_QWORD *)(v1 + 360);
    v15 = *(_QWORD *)(v1 + 368);
    v17 = *(_QWORD *)(v1 + 352);
    v18 = *(_QWORD *)(v1 + 336);
    v19 = *(_QWORD *)(v1 + 320);
    v25 = *(_QWORD *)(v1 + 312);
    sub_24219BCEC(*(_QWORD *)(v1 + 432));
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v12, v13);
    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v15, v17);
    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v18, v25);
    sub_24219BC9C();
    sub_24219BC4C();
    swift_task_dealloc();
    sub_24219BCF8();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_24219B198()
{
  _QWORD *v0;
  void *v1;
  void *v2;
  id v3;
  id v4;
  os_log_type_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;

  sub_24219BCA4();
  v1 = (void *)v0[49];
  v2 = (void *)v0[43];
  v3 = v1;
  v4 = v1;
  sub_2421AF928();
  v5 = sub_24219BCC0();
  if (sub_24219BB3C(v5))
  {
    sub_24218D61C();
    v6 = (_QWORD *)sub_24218D61C();
    sub_24219BBF0(5.7779e-34);
    v7 = _swift_stdlib_bridgeErrorToNSError();
    v0[37] = v7;
    sub_24219BBE4();
    *v6 = v7;
    sub_24219BAB4();
    sub_24219BAB4();
    sub_24219BB08(&dword_24218A000, v8, v9, "Error checking essential resources ready: %@");
    sub_24218D500(&qword_2543A6B08);
    sub_24219BC64();
    sub_24218D600();
  }
  sub_24219BAB4();
  sub_24219BAB4();
  sub_24219BAB4();

  v10 = sub_24218D500(&qword_2543A69A0);
  v0[50] = v10;
  v0[51] = *(_QWORD *)(v10 - 8);
  v0[52] = sub_24219BAA4();
  sub_2421AF4E4();
  sub_24219BCD0();
  v11 = sub_24218D500((uint64_t *)&unk_2543A6AF8);
  v0[53] = v11;
  v0[54] = *(_QWORD *)(v11 - 8);
  v12 = sub_24219BAA4();
  sub_24219BC6C(v12);
  v0[56] = 0;
  v13 = (_QWORD *)swift_task_alloc();
  v0[57] = v13;
  sub_24219BBA8(v13);
  return sub_24219BABC();
}

uint64_t static ModelCatalogDaemon.isEssentialResourcesReady(sideLoadUrl:)()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;

  sub_2421AF55C();
  v2 = sub_2421AF880();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  sub_242199978();
  v6 = v5 - v4;
  swift_bridgeObjectRetain();
  sub_2421AF874();
  if (v0)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = sub_2421AF568();
    swift_bridgeObjectRelease();
    if (qword_2543A66F0 != -1)
      swift_once();
    v8 = sub_2421AF940();
    sub_24218E28C(v8, (uint64_t)qword_2543A6B60);
    v9 = sub_2421AF928();
    v10 = sub_2421AFB98();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v11 = 67109120;
      v1 = v7 ^ 1;
      sub_2421AFBEC();
      _os_log_impl(&dword_24218A000, v9, v10, "isEssentialResourcesReady: %{BOOL}d", v11, 8u);
      MEMORY[0x2426A51D4](v11, -1, -1);

    }
    else
    {

      v1 = v7 ^ 1;
    }
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v6, v2);
  }
  return v1 & 1;
}

uint64_t static ModelCatalogDaemon.essentialResourcesReady(sideLoadUrl:waitForSystemReadiness:)(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  sub_24219BC18();
  return swift_task_switch();
}

uint64_t sub_24219B528()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;

  v0[3] = sub_2421AF55C();
  v1 = sub_2421AF880();
  v0[4] = v1;
  v0[5] = *(_QWORD *)(v1 - 8);
  v0[6] = sub_24219BAA4();
  v2 = (_QWORD *)swift_task_alloc();
  v0[7] = v2;
  *v2 = v0;
  v2[1] = sub_24219B5A0;
  return sub_2421AF85C();
}

uint64_t sub_24219B5A0(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 64) = v1;
  swift_task_dealloc();
  if (v1)
    swift_bridgeObjectRelease();
  else
    *(_QWORD *)(v4 + 72) = a1;
  sub_24219BC18();
  return sub_24219BB4C();
}

uint64_t sub_24219B60C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t);
  uint64_t v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  os_log_type_t v7;
  uint8_t *v8;

  v1 = *(_QWORD *)(v0 + 64);
  sub_2421AF868();
  if (v1)
  {
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
    v3 = 0;
  }
  else
  {
    v4 = *(NSObject **)(v0 + 24);
    v5 = sub_2421AF568();
    swift_bridgeObjectRelease();
    if (qword_2543A66F0 != -1)
      swift_once();
    v6 = sub_242199940();
    sub_24218E28C(v6, (uint64_t)qword_2543A6B60);
    sub_24219BCE4();
    v7 = sub_24218D658();
    if (sub_24219BB78(v7))
    {
      v8 = (uint8_t *)sub_24218D61C();
      *(_DWORD *)v8 = 67109120;
      *(_DWORD *)(v0 + 80) = (v5 ^ 1) & 1;
      sub_2421AFBEC();
      _os_log_impl(&dword_24218A000, v4, OS_LOG_TYPE_DEFAULT, "essentialResourcesReady: %{BOOL}d", v8, 8u);
      sub_24218D600();
    }

    sub_24219BCEC(*(_QWORD *)(v0 + 40));
    sub_24219BC9C();
    v2 = *(uint64_t (**)(uint64_t))(v0 + 8);
    v3 = (v5 ^ 1) & 1;
  }
  return v2(v3);
}

uint64_t sub_24219B774()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
}

uint64_t static ModelCatalogDaemon.doesDraftModelAssetRequireCompilation(asset:)()
{
  return 1;
}

uint64_t sub_24219B7C0(uint64_t a1, char a2, char a3, char a4, char a5, char a6, char a7)
{
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t result;
  unsigned __int8 v19;
  uint64_t v20;

  v14 = sub_24218D500(&qword_2543A6998);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v20 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24219B9BC(a1, (uint64_t)v16);
  v17 = sub_2421AFB38();
  if (sub_24218E0BC((uint64_t)v16, 1, v17) == 1)
  {
    sub_24218E104((uint64_t)v16, &qword_2543A6998);
    result = 0;
    if ((a2 & 1) == 0)
      goto LABEL_3;
  }
  else
  {
    v19 = sub_2421AFB2C();
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v17 - 8) + 8))(v16, v17);
    result = v19;
    if ((a2 & 1) == 0)
    {
LABEL_3:
      if ((a3 & 1) != 0)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  result |= 0x100uLL;
  if ((a3 & 1) != 0)
  {
LABEL_4:
    result |= 0x400uLL;
    if ((a4 & 1) == 0)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  if ((a4 & 1) == 0)
  {
LABEL_5:
    if ((a5 & 1) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_15:
  result |= 0x800uLL;
  if ((a5 & 1) != 0)
LABEL_6:
    result |= 0x1000uLL;
LABEL_7:
  if ((a6 & 1) != 0)
    result |= 0x2000uLL;
  if ((a7 & 1) != 0)
    return result | 0x4000;
  return result;
}

ValueMetadata *type metadata accessor for ModelCatalogDaemon()
{
  return &type metadata for ModelCatalogDaemon;
}

uint64_t sub_24219B908()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_24219B92C()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t);

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_24219B990;
  v2 = sub_24219BBC8();
  return v3(v2);
}

uint64_t sub_24219B990()
{
  uint64_t v0;

  sub_24219BB1C();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_24219B9BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_24218D500(&qword_2543A6998);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_24219BA04()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2543A6980;
  if (!qword_2543A6980)
  {
    v1 = sub_2421AF838();
    result = MEMORY[0x2426A5144](MEMORY[0x24BE687B0], v1);
    atomic_store(result, (unint64_t *)&qword_2543A6980);
  }
  return result;
}

uint64_t sub_24219BA44(__int128 *a1, uint64_t a2)
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

unint64_t sub_24219BA5C()
{
  unint64_t result;

  result = qword_2543A68E0;
  if (!qword_2543A68E0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2543A68E0);
  }
  return result;
}

uint64_t sub_24219BAA4()
{
  return swift_task_alloc();
}

void sub_24219BAB4()
{
  void *v0;

}

uint64_t sub_24219BABC()
{
  return sub_2421AFB50();
}

uint64_t sub_24219BAD8(uint64_t (*a1)(void))
{
  return a1();
}

void sub_24219BAF4(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  os_log_type_t v4;
  NSObject *v5;
  uint8_t *v6;

  _os_log_impl(a1, v5, v4, a4, v6, 2u);
}

void sub_24219BB08(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  uint8_t *v5;
  os_log_type_t v6;

  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

uint64_t sub_24219BB1C()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
  *(_QWORD *)(v1 - 8) = *v0;
  return swift_task_dealloc();
}

BOOL sub_24219BB3C(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t sub_24219BB4C()
{
  return swift_task_switch();
}

id sub_24219BB5C()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;

  return objc_msgSend(v1, (SEL)(v2 + 1753), v0, 1, 0, v3 - 96);
}

BOOL sub_24219BB78(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

void sub_24219BB88(void *a1, NSObject *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
  _os_log_impl(a1, a2, a3, a4, a5, 2u);
}

uint64_t sub_24219BB90(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_24219BB9C()
{
  return swift_task_switch();
}

uint64_t sub_24219BBA8(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *a1 = v3;
  a1[1] = v1;
  return v2;
}

uint64_t sub_24219BBC8()
{
  uint64_t v0;

  return v0;
}

void sub_24219BBDC()
{
  void *v0;

}

uint64_t sub_24219BBE4()
{
  return sub_2421AFBEC();
}

id sub_24219BBF0(float a1)
{
  void *v1;
  float *v2;

  *v2 = a1;
  return v1;
}

uint64_t sub_24219BC04()
{
  return sub_2421AFA0C();
}

uint64_t sub_24219BC24()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_24219BC38()
{
  uint64_t v0;
  uint64_t v1;

  return sub_24218D5C8(v0, 1, 1, v1);
}

uint64_t sub_24219BC4C()
{
  return swift_task_dealloc();
}

uint64_t sub_24219BC54(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  return sub_242199E38(a1, a2, a3, a3 + 1);
}

uint64_t sub_24219BC5C(uint64_t *a1)
{
  return sub_242199DE0(a1);
}

uint64_t sub_24219BC64()
{
  return swift_arrayDestroy();
}

uint64_t sub_24219BC6C(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 440) = a1;
  return sub_2421AFB44();
}

uint64_t sub_24219BC7C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
}

uint64_t sub_24219BC8C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
}

uint64_t sub_24219BC9C()
{
  return swift_task_dealloc();
}

uint64_t sub_24219BCC0()
{
  return sub_2421AFB80();
}

uint64_t sub_24219BCC8()
{
  return swift_beginAccess();
}

uint64_t sub_24219BCD0()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_24219BCDC(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(a1, v1);
}

uint64_t sub_24219BCE4()
{
  return sub_2421AF928();
}

uint64_t sub_24219BCEC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t))(a1 + 8))(v1);
}

uint64_t sub_24219BCF8()
{
  return swift_task_dealloc();
}

uint64_t sub_24219BD00()
{
  uint64_t v0;
  uint64_t *v1;

  return sub_24218E104(v0, v1);
}

uint64_t sub_24219BD0C()
{
  return swift_allocObject();
}

id sub_24219BD18()
{
  void *v0;

  return v0;
}

uint64_t sub_24219BD20()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(v1, v0);
}

void sub_24219BD2C(char a1, uint64_t a2)
{
  uint64_t v2;

  sub_2421A0284(a1, a2, 1, v2);
}

void sub_24219BD38()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
}

uint64_t sub_24219BD4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  os_log_type_t v4;
  id v6;
  char v7;
  id v8;
  id v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  os_log_type_t v16;
  uint64_t v17;
  uint64_t v18;

  v6 = v3;
  v7 = sub_24219BF48(a3, v6);
  v8 = v6;
  swift_bridgeObjectRetain_n();
  v9 = v8;
  v10 = sub_2421AF928();
  if ((v7 & 1) != 0)
  {
    v11 = sub_2421AFB98();
    if (sub_24219CBB0(v11))
    {
      v12 = sub_24218D61C();
      sub_24218D61C();
      v13 = sub_24219CBE0(4.8151e-34);
      sub_24219CBD0(v13, v14);
      sub_24219CB50();
      sub_24219CBF0();
      *(_WORD *)(v12 + 12) = 1024;
      objc_msgSend(v9, sel_processIdentifier);

      sub_24219CB6C();
      v15 = "XPC connection for service(%s) from %d";
      goto LABEL_6;
    }
  }
  else
  {
    v16 = sub_2421AFB80();
    if (sub_24219CBB0(v16))
    {
      v12 = sub_24218D61C();
      sub_24218D61C();
      v17 = sub_24219CBE0(4.8151e-34);
      sub_24219CBD0(v17, v18);
      sub_24219CB50();
      sub_24219CBF0();
      *(_WORD *)(v12 + 12) = 1024;
      objc_msgSend(v9, sel_processIdentifier);

      sub_24219CB6C();
      v15 = "ModelCatalog %s: Rejecting connection from %d: lacking entitlement";
LABEL_6:
      _os_log_impl(&dword_24218A000, v10, v4, v15, (uint8_t *)v12, 0x12u);
      swift_arrayDestroy();
      sub_24218D600();
    }
  }
  swift_bridgeObjectRelease_n();

  return v7 & 1;
}

uint64_t sub_24219BF48(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  int64_t v11;
  void *v12;
  id v13;
  char v14;
  uint64_t v15;
  int64_t v16;
  _OWORD v17[2];
  _BYTE v18[24];
  uint64_t v19;
  char v20;

  v3 = a1 + 56;
  v4 = 1 << *(_BYTE *)(a1 + 32);
  v5 = -1;
  if (v4 < 64)
    v5 = ~(-1 << v4);
  v6 = v5 & *(_QWORD *)(a1 + 56);
  v16 = (unint64_t)(v4 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v8 = 0;
  while (v6)
  {
    v6 &= v6 - 1;
LABEL_22:
    swift_bridgeObjectRetain();
    v12 = (void *)sub_2421AFA6C();
    v13 = objc_msgSend(a2, sel_valueForEntitlement_, v12);

    if (v13)
    {
      sub_2421AFC10();
      swift_unknownObjectRelease();
    }
    else
    {
      memset(v17, 0, sizeof(v17));
    }
    sub_24218D4B8((uint64_t)v17, (uint64_t)v18);
    if (v19)
    {
      if ((swift_dynamicCast() & 1) == 0)
        goto LABEL_30;
      v14 = v20;
      result = swift_bridgeObjectRelease();
      if ((v14 & 1) != 0)
      {
        v15 = 1;
LABEL_32:

        swift_release();
        return v15;
      }
    }
    else
    {
      sub_24218D588((uint64_t)v18);
LABEL_30:
      result = swift_bridgeObjectRelease();
    }
  }
  v9 = v8 + 1;
  if (__OFADD__(v8, 1))
  {
    __break(1u);
    goto LABEL_34;
  }
  if (v9 >= v16)
    goto LABEL_31;
  v10 = *(_QWORD *)(v3 + 8 * v9);
  ++v8;
  if (v10)
    goto LABEL_21;
  v8 = v9 + 1;
  if (v9 + 1 >= v16)
    goto LABEL_31;
  v10 = *(_QWORD *)(v3 + 8 * v8);
  if (v10)
    goto LABEL_21;
  v8 = v9 + 2;
  if (v9 + 2 >= v16)
    goto LABEL_31;
  v10 = *(_QWORD *)(v3 + 8 * v8);
  if (v10)
    goto LABEL_21;
  v8 = v9 + 3;
  if (v9 + 3 >= v16)
    goto LABEL_31;
  v10 = *(_QWORD *)(v3 + 8 * v8);
  if (v10)
  {
LABEL_21:
    v6 = (v10 - 1) & v10;
    goto LABEL_22;
  }
  v11 = v9 + 4;
  if (v11 >= v16)
  {
LABEL_31:
    v15 = 0;
    goto LABEL_32;
  }
  v10 = *(_QWORD *)(v3 + 8 * v11);
  if (v10)
  {
    v8 = v11;
    goto LABEL_21;
  }
  while (1)
  {
    v8 = v11 + 1;
    if (__OFADD__(v11, 1))
      break;
    if (v8 >= v16)
      goto LABEL_31;
    v10 = *(_QWORD *)(v3 + 8 * v8);
    ++v11;
    if (v10)
      goto LABEL_21;
  }
LABEL_34:
  __break(1u);
  return result;
}

uint64_t sub_24219C1A4()
{
  return 1;
}

uint64_t sub_24219C1AC(void *a1, void *a2)
{
  _QWORD *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  void (*v19)(char *, uint64_t);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  NSObject *v35;
  os_log_type_t v36;
  _BOOL4 v37;
  uint8_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t AssociatedConformanceWitness;
  uint64_t v42;
  void *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v51;
  NSObject *v52;
  os_log_type_t v53;
  uint8_t *v54;
  _QWORD v55[2];
  uint64_t v56;
  char *v57;
  void (*v58)(char *, uint64_t);
  NSObject *v59;
  uint64_t v60;
  id v61;
  char *v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  unint64_t v69;
  __int128 v70;
  __int128 v71;
  uint64_t (*v72)();
  uint64_t v73;
  _BYTE v74[40];

  v67 = a2;
  v61 = a1;
  v4 = *(NSObject **)((*MEMORY[0x24BEE4EA0] & *v2) + 0x50);
  v3 = *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v2) + 0x58);
  v64 = sub_24219CB9C();
  v60 = *(_QWORD *)(v64 - 8);
  MEMORY[0x24BDAC7A8](v64);
  v63 = (char *)v55 - v5;
  v66 = sub_2421AF940();
  v6 = *(_QWORD *)(v66 - 8);
  v7 = MEMORY[0x24BDAC7A8](v66);
  v57 = (char *)v55 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v62 = (char *)v55 - v10;
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)v55 - v12;
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)v55 - v14;
  sub_24219CB9C();
  v65 = v3;
  v59 = v4;
  swift_getAssociatedConformanceWitness();
  sub_24219CB24();
  v16 = sub_2421AF928();
  v17 = sub_2421AFB98();
  if (sub_24218D638(v17))
  {
    v18 = (uint8_t *)sub_24218D61C();
    *(_WORD *)v18 = 0;
    sub_24219BB88(&dword_24218A000, v16, (os_log_type_t)v3, "Delegate: Got connection request.", v18);
    sub_24218D600();
  }

  v19 = *(void (**)(char *, uint64_t))(v6 + 8);
  v20 = v66;
  v19(v15, v66);
  v21 = sub_2421AF5D4();
  v23 = v22;
  v24 = sub_2421AF5F8();
  sub_2421AF5E0();
  v25 = v67;
  LOBYTE(v21) = sub_24219BD4C(v21, v23, v24);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v58 = v19;
  v19(v13, v20);
  if ((v21 & 1) == 0)
    return 0;
  v26 = (void *)sub_2421AF5EC();
  objc_msgSend(v25, sel_setExportedInterface_, v26);

  v27 = (void *)sub_2421AFA6C();
  v28 = objc_msgSend(v25, sel_valueForEntitlement_, v27);

  if (v28)
  {
    sub_2421AFC10();
    swift_unknownObjectRelease();
  }
  else
  {
    v70 = 0u;
    v71 = 0u;
  }
  v29 = v64;
  v30 = v65;
  v31 = v59;
  v32 = (uint64_t)v62;
  sub_24218D4B8((uint64_t)&v70, (uint64_t)v74);
  sub_24218D540((uint64_t)v74, (uint64_t)&v70);
  if (*((_QWORD *)&v71 + 1))
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      v34 = v68;
      v33 = v69;
      sub_24219CB24();
      swift_bridgeObjectRetain_n();
      v35 = sub_2421AF928();
      v36 = sub_2421AFB98();
      v59 = v35;
      v37 = os_log_type_enabled(v35, v36);
      v56 = v34;
      if (v37)
      {
        v38 = (uint8_t *)sub_24218D61C();
        *(_QWORD *)&v70 = sub_24218D61C();
        *(_DWORD *)v38 = 136315138;
        v55[1] = v38 + 4;
        swift_bridgeObjectRetain();
        sub_2421A0BC4(v34, v33, (uint64_t *)&v70);
        v68 = v39;
        sub_2421AFBEC();
        sub_24219CBF0();
        _os_log_impl(&dword_24218A000, v59, v36, "Delegate: clientApplicationIdentifier: %s", v38, 0xCu);
        swift_arrayDestroy();
        sub_24218D600();
      }

      swift_bridgeObjectRelease_n();
      sub_24219CBC0(v32);
      v40 = v56;
      v30 = v65;
      goto LABEL_14;
    }
  }
  else
  {
    sub_24218D588((uint64_t)&v70);
  }
  v40 = 0;
  v33 = 0;
LABEL_14:
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  (*(void (**)(uint64_t, unint64_t, uint64_t, uint64_t))(AssociatedConformanceWitness + 8))(v40, v33, v29, AssociatedConformanceWitness);
  v42 = sub_2421AFD48();
  v43 = v67;
  sub_24219CB34(v42, sel_setExportedObject_);
  swift_unknownObjectRelease();
  v44 = objc_msgSend(v61, sel__queue);
  sub_24219CB34((uint64_t)v44, sel__setQueue_);

  if (((*(uint64_t (**)(void *, uint64_t, uint64_t))(AssociatedConformanceWitness + 16))(v43, v29, AssociatedConformanceWitness) & 1) != 0)
  {
    v45 = sub_24219BD0C();
    *(_QWORD *)(v45 + 16) = v31;
    *(_QWORD *)(v45 + 24) = v30;
    v72 = sub_24219CAB0;
    v73 = v45;
    v46 = MEMORY[0x24BDAC760];
    *(_QWORD *)&v70 = MEMORY[0x24BDAC760];
    *((_QWORD *)&v70 + 1) = 1107296256;
    sub_24219CC04((uint64_t)&unk_2513322A0);
    v47 = sub_24219CBF8();
    sub_24219CB34(v47, sel_setInterruptionHandler_);
    _Block_release(v44);
    v48 = sub_24219BD0C();
    *(_QWORD *)(v48 + 16) = v31;
    *(_QWORD *)(v48 + 24) = v30;
    v72 = sub_24219CAF4;
    v73 = v48;
    *(_QWORD *)&v70 = v46;
    *((_QWORD *)&v70 + 1) = 1107296256;
    sub_24219CC04((uint64_t)&unk_2513322F0);
    v49 = sub_24219CBF8();
    sub_24219CB34(v49, sel_setInvalidationHandler_);
    _Block_release(v44);
    objc_msgSend(v43, sel_resume);
    sub_24219CB84();
    sub_24218D588((uint64_t)v74);
    return 1;
  }
  v51 = (uint64_t)v57;
  sub_24219CB24();
  v52 = sub_2421AF928();
  v53 = sub_2421AFB80();
  if (sub_24218D638(v53))
  {
    v54 = (uint8_t *)sub_24218D61C();
    *(_WORD *)v54 = 0;
    sub_24219BB88(&dword_24218A000, v52, (os_log_type_t)v44, "Delegate: connection rejected by server instance.", v54);
    sub_24218D600();
  }

  sub_24219CBC0(v51);
  sub_24219CB84();
  sub_24218D588((uint64_t)v74);
  return 0;
}

uint64_t sub_24219C888(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_24219C8B4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void), const char *a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v14;

  v6 = sub_2421AF940();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  sub_2421AF5E0();
  v10 = sub_2421AF928();
  v11 = a3();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (uint8_t *)sub_24218D61C();
    *(_WORD *)v12 = 0;
    sub_24219BB88(&dword_24218A000, v10, v11, a4, v12);
    sub_24218D600();
  }

  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t sub_24219C9FC(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = a1;
  v9 = sub_24219C1AC(v6, v7);

  return v9 & 1;
}

id sub_24219CA5C()
{
  return sub_24218CF2C();
}

uint64_t type metadata accessor for Delegate(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_24218D5D4(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Delegate);
}

uint64_t sub_24219CA88()
{
  return sub_24219C1A4() & 1;
}

uint64_t sub_24219CAB0()
{
  uint64_t v0;

  return sub_24219C8B4(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), MEMORY[0x24BEE7910], "Delegate: connection interrupted.");
}

uint64_t sub_24219CAD8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_24219CAE8()
{
  return swift_release();
}

uint64_t sub_24219CAF4()
{
  uint64_t v0;

  return sub_24219C8B4(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), MEMORY[0x24BEE7928], "Delegate: connection invalidated.");
}

uint64_t sub_24219CB24()
{
  return sub_2421AF5E0();
}

id sub_24219CB34(uint64_t a1, const char *a2)
{
  uint64_t v2;
  void *v3;

  return objc_msgSend(v3, a2, v2);
}

uint64_t sub_24219CB40()
{
  return swift_deallocObject();
}

uint64_t sub_24219CB50()
{
  return sub_2421AFBEC();
}

uint64_t sub_24219CB6C()
{
  return sub_2421AFBEC();
}

uint64_t sub_24219CB84()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 272) + 8))(v1, v0);
}

uint64_t sub_24219CB9C()
{
  return swift_getAssociatedTypeWitness();
}

BOOL sub_24219CBB0(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t sub_24219CBC0(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, _QWORD))(v1 - 288))(a1, *(_QWORD *)(v1 - 224));
}

void sub_24219CBD0(uint64_t a1, uint64_t a2, ...)
{
  unint64_t v2;
  uint64_t v3;
  va_list va;

  va_start(va, a2);
  sub_2421A0BC4(v3, v2, (uint64_t *)va);
}

uint64_t sub_24219CBE0(float a1)
{
  float *v1;

  *v1 = a1;
  return swift_bridgeObjectRetain();
}

uint64_t sub_24219CBF0()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t sub_24219CBF8()
{
  return swift_release();
}

void *sub_24219CC04@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 176) = v1;
  *(_QWORD *)(v2 - 168) = a1;
  return _Block_copy((const void *)(v2 - 192));
}

void sub_24219CC10(uint64_t a1)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6[3];

  v6[2] = sub_2421AFB68();
  v2 = *(_QWORD *)(a1 + 16);
  if (v2)
  {
    v3 = (uint64_t *)(a1 + 40);
    do
    {
      v4 = *(v3 - 1);
      v5 = *v3;
      swift_bridgeObjectRetain();
      sub_2421A131C(v6, v4, v5);
      swift_bridgeObjectRelease();
      v3 += 2;
      --v2;
    }
    while (v2);
    sub_24219978C();
  }
  else
  {
    sub_24219978C();
  }
  sub_2421A40D4();
}

uint64_t sub_24219CCA8()
{
  return sub_24219CCCC();
}

uint64_t sub_24219CCCC()
{
  uint64_t v0;
  uint64_t v1;
  void (*v2)(char *, char *);
  void (*v3)(char *, char *);
  _QWORD *v4;
  _QWORD *v5;
  uint64_t (*v6)(uint64_t);
  uint64_t (*v7)(uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(char *, uint64_t, uint64_t);
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  _QWORD v23[2];
  void (*v24)(char *, uint64_t, uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  sub_242199548();
  v28 = v0;
  v29 = v1;
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v10 = v6(0);
  sub_2421A3E68(v5, v7);
  v11 = sub_2421AFB68();
  v27 = v11;
  v12 = *(_QWORD *)(v9 + 16);
  if (v12)
  {
    v13 = *(_QWORD *)(v10 - 8);
    v14 = v9 + ((*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80));
    v15 = *(_QWORD *)(v13 + 64);
    v25 = *(_QWORD *)(v13 + 72);
    v26 = v13;
    v16 = *(void (**)(char *, uint64_t, uint64_t))(v13 + 16);
    v23[1] = v9;
    v24 = v16;
    do
    {
      v17 = MEMORY[0x24BDAC7A8](v11);
      v18 = (char *)v23 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
      MEMORY[0x24BDAC7A8](v17);
      v20 = (char *)v23 - v19;
      v24((char *)v23 - v19, v14, v10);
      v3(v18, v20);
      v11 = (*(uint64_t (**)(char *, uint64_t))(v26 + 8))(v18, v10);
      v14 += v25;
      --v12;
    }
    while (v12);
    swift_bridgeObjectRelease();
    return v27;
  }
  else
  {
    v21 = v11;
    sub_24219978C();
  }
  return v21;
}

unint64_t static FollowUpManager.clientIdentifier.getter()
{
  sub_2421A4220();
  return 0xD000000000000016;
}

unint64_t static FollowUpManager.uniqueIdentifier.getter()
{
  sub_2421A4220();
  return 0xD000000000000027;
}

void sub_24219CE6C()
{
  id v0;
  uint64_t v1;

  v0 = objc_allocWithZone(MEMORY[0x24BE1B3A8]);
  sub_24219FFD0(0xD000000000000016, 0x80000002421B1640, (SEL *)&selRef_initWithClientIdentifier_);
  if (v1)
    qword_2543A6AD8 = v1;
  else
    __break(1u);
}

void sub_24219CEC8()
{
  strcpy((char *)&qword_2571DF428, "DateOfLastCFU");
  unk_2571DF436 = -4864;
}

uint64_t sub_24219CEF8()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v8;

  v0 = objc_allocWithZone(MEMORY[0x24BDBCF50]);
  sub_24219FFD0(0xD000000000000023, 0x80000002421B1BA0, (SEL *)&selRef_initWithSuiteName_);
  v2 = v1;
  if (!v1)
  {
    if (qword_2543A6928 != -1)
      swift_once();
    v3 = sub_2421AF940();
    sub_24218E28C(v3, (uint64_t)qword_2543A6B78);
    v4 = sub_2421AF928();
    v5 = sub_2421AFB80();
    if (os_log_type_enabled(v4, v5))
    {
      v6 = (uint8_t *)sub_24218D61C();
      v8 = sub_24218D61C();
      *(_DWORD *)v6 = 136315138;
      sub_2421A0BC4(0xD000000000000023, 0x80000002421B1BA0, &v8);
      sub_2421AFBEC();
      sub_2421A4030(&dword_24218A000, v4, v5, "Could not initialize UserDefaults with suite name: %s", v6);
      sub_24219BC64();
      sub_24218D600();
    }

  }
  return v2;
}

void sub_24219D07C()
{
  NSObject *v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  os_log_type_t v6;
  _WORD *v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  os_log_type_t v23;
  _DWORD *v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
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
  char *v48;
  uint64_t v49;
  unint64_t v50;
  __int128 *v51;
  unint64_t v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  unint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  os_log_type_t v68;
  _BOOL4 v69;
  uint8_t *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t (*v74)();
  NSObject *v75;
  uint64_t v76;
  int64_t v77;
  unint64_t v78;
  __int128 v79;
  uint64_t v80;
  unint64_t v81;
  BOOL v82;
  unint64_t v83;
  char v84;
  uint64_t v85;
  char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  NSObject *v93;
  Class v94;
  int v95;
  _QWORD *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  NSObject *v102;
  os_log_type_t v103;
  int v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  unint64_t v109;
  uint64_t v110;
  uint64_t v111;
  NSObject *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  NSObject *v117;
  os_log_type_t v118;
  int v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  unint64_t v124;
  uint64_t v125;
  void (*v126)(uint64_t, uint64_t (*)());
  uint64_t v127;
  void *v128;
  os_log_type_t v129;
  uint8_t *v130;
  Class isa;
  char v132;
  os_log_type_t v133;
  _WORD *v134;
  uint64_t v135;
  uint64_t v136;
  const char *v137;
  uint64_t v138;
  unint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  os_log_type_t v143;
  _WORD *v144;
  uint64_t v145;
  uint64_t v146;
  os_log_type_t v147;
  uint8_t *v148;
  uint64_t v149;
  os_log_type_t v150;
  uint8_t *v151;
  os_log_type_t v152;
  _DWORD *v153;
  _QWORD *v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  const char *v158;
  os_log_type_t v159;
  _DWORD *v160;
  _QWORD *v161;
  uint64_t v162;
  os_log_type_t v163;
  _WORD *v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  void (*v168)(uint64_t);
  os_log_type_t v169;
  _WORD *v170;
  uint64_t v171;
  uint64_t v172;
  void (*v173)(uint64_t, uint64_t);
  _QWORD v174[2];
  os_log_t v175;
  _QWORD *v176;
  int v177;
  uint64_t (*v178)(uint64_t, uint64_t);
  uint64_t v179;
  NSObject *v180;
  unint64_t v181;
  uint64_t v182;
  uint64_t v183;
  _QWORD *v184;
  __int128 v185;
  uint64_t v186;
  _QWORD *v187;
  unint64_t v188;
  _QWORD *v189;
  uint64_t v190;
  int64_t v191;
  char *v192;
  uint64_t v193;
  _QWORD *v194;
  _QWORD *v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  __int128 v200;
  __int128 v201;
  uint64_t v202;
  __int128 v203[3];
  __int128 v204;
  __int128 v205;
  uint64_t v206;

  sub_242199548();
  v179 = v1;
  if (qword_2543A6990 == -1)
    goto LABEL_2;
  while (1)
  {
    swift_once();
LABEL_2:
    v5 = sub_2421AF940();
    v186 = sub_24218E28C(v5, (uint64_t)qword_2543A6B90);
    sub_2421AF928();
    v6 = sub_242199868();
    if (sub_2421A3F7C(v6))
    {
      v7 = (_WORD *)sub_24218D61C();
      sub_2421A41B4(v7);
      sub_2421A3FB0(&dword_24218A000, v8, v9, "Running checkAndNotifyForOutOfStorageStatus...");
      sub_24218D600();
    }

    if (MEMORY[0x24BE3C130])
      v10 = MEMORY[0x24BE3C150] == 0;
    else
      v10 = 1;
    if (!v10 && MEMORY[0x24BE3C140] != 0)
    {
      v12 = sub_2421AF8A4();
      v197 = *(_QWORD *)(v12 - 8);
      sub_242199348();
      MEMORY[0x24BDAC7A8](v13);
      sub_242199AB8();
      sub_2421A3FC4(v14);
      v15 = sub_2421AF91C();
      v16 = *(_QWORD *)(v15 - 8);
      MEMORY[0x24BDAC7A8](v15);
      sub_2421A413C();
      sub_2421AF8C8();
      sub_2421A41C0();
      MEMORY[0x24BDAC7A8](v17);
      sub_2421A4018();
      sub_2421A4220();
      sub_2421AF8BC();
      sub_2421AF910();
      sub_2421A40E8(*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8));
      sub_2421AF8B0();
      sub_2421A41C0();
      MEMORY[0x24BDAC7A8](v18);
      sub_2421A4018();
      sub_2421AF8D4();
      sub_2421A42F4(*(uint64_t (**)(uint64_t, uint64_t))(v16 + 8));
      v19 = (*(uint64_t (**)(uint64_t, unint64_t))(v4 + 88))(v3, v2);
      if (MEMORY[0x24BE3BDF8] && v19 == *MEMORY[0x24BE3BDF8])
      {
        sub_2421A40E8(*(uint64_t (**)(uint64_t, uint64_t))(v4 + 96));
        v20 = v196;
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v197 + 32))(v196, v3, v12);
        v21 = sub_2421AF898();
        swift_bridgeObjectRetain_n();
        v22 = (void *)sub_2421A3F70();
        v23 = sub_2421AFB74();
        if (sub_2421A3FD4(v23))
        {
          v24 = (_DWORD *)sub_24218D61C();
          *(_QWORD *)&v204 = sub_24218D61C();
          *v24 = 136315138;
          sub_2421AF88C();
          v195 = (_QWORD *)v12;
          sub_2421A3E68(&qword_2543A6A98, (uint64_t (*)(uint64_t))MEMORY[0x24BE3BF78]);
          swift_bridgeObjectRetain();
          v25 = sub_2421AFB5C();
          v27 = v26;
          sub_2421A4070();
          sub_2421A0BC4(v25, v27, (uint64_t *)&v204);
          *(_QWORD *)&v203[0] = v28;
          sub_2421AFBEC();
          sub_2421A42E0();
          swift_bridgeObjectRelease();
          sub_2421A3FE4(&dword_24218A000, v29, v30, "GMS Unavailable for the following reasons: %s");
          sub_24219BC64();
          sub_24218D600();
        }

        sub_2421A42E0();
        v0 = sub_2421AF88C();
        isa = v0[-1].isa;
        MEMORY[0x24BDAC7A8](v0);
        sub_2421A413C();
        sub_242199ADC(v20, *MEMORY[0x24BE3BED8]);
        v132 = sub_24219E958(v20, v21);
        sub_2421A42F4(*((uint64_t (**)(uint64_t, uint64_t))isa + 1));
        if ((v132 & 1) != 0)
        {
          sub_2421A4070();
          sub_2421A3F70();
          v133 = sub_242199868();
          if (sub_2421A3F7C(v133))
          {
            v134 = (_WORD *)sub_24218D61C();
            sub_2421A41B4(v134);
            v137 = "GMS Unavailable - Device is never capable of enabling GM, bailing early";
            goto LABEL_117;
          }
          goto LABEL_118;
        }
        sub_24218D500(&qword_2543A6B30);
        v138 = *((_QWORD *)isa + 9);
        v139 = (*((unsigned __int8 *)isa + 80) + 32) & ~(unint64_t)*((unsigned __int8 *)isa + 80);
        v140 = swift_allocObject();
        *(_OWORD *)(v140 + 16) = xmmword_2421B0840;
        v3 = v140 + v139;
        sub_242199ADC(v3, *MEMORY[0x24BE3BF48]);
        sub_242199ADC(v3 + v138, *MEMORY[0x24BE3BF68]);
        sub_242199ADC(v3 + 2 * v138, *MEMORY[0x24BE3BF00]);
        sub_242199ADC(v3 + 3 * v138, *MEMORY[0x24BE3BEF0]);
        sub_242199ADC(v3 + 4 * v138, *MEMORY[0x24BE3BF40]);
        sub_242199ADC(v3 + 5 * v138, *MEMORY[0x24BE3BF08]);
        sub_242199ADC(v3 + 6 * v138, *MEMORY[0x24BE3BF20]);
        v141 = sub_24219CCCC();
        v142 = sub_2421A3310(v141, v21);
        sub_24219978C();
        v0 = *(NSObject **)(v142 + 16);
        swift_release();
        if (v0)
        {
          sub_2421A3F70();
          v143 = sub_242199868();
          if (sub_2421A3F7C(v143))
          {
            v144 = (_WORD *)sub_24218D61C();
            sub_2421A41B4(v144);
            sub_2421A3FB0(&dword_24218A000, v145, v146, "GMS Unavailable - Device currently cannot enable GM due to ineligibility. Clearing and bailing early");
            sub_24218D600();
          }

          sub_24219FC58();
          goto LABEL_145;
        }
        v167 = sub_2421A4104();
        v168(v167);
      }
      else
      {
        sub_2421A40E8(*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8));
      }
    }
    v31 = sub_2421AF58C();
    sub_2421A42D4(v31, (uint64_t)&v204);
    v182 = v32;
    sub_242199348();
    MEMORY[0x24BDAC7A8](v33);
    sub_242199978();
    v2 = v35 - v34;
    sub_2421AF430();
    sub_242199348();
    MEMORY[0x24BDAC7A8](v36);
    sub_242199978();
    v0 = (v38 - v37);
    sub_2421AF844();
    sub_2421AF538();
    v181 = v2;
    v39 = sub_2421AF580();
    v40 = v39;
    v41 = MEMORY[0x24BEE4AF8];
    *(_QWORD *)&v200 = MEMORY[0x24BEE4AF8];
    v191 = *(_QWORD *)(v39 + 16);
    if (!v191)
      break;
    v4 = 0;
    v190 = v39 + 32;
    v42 = 40;
    v189 = (_QWORD *)v39;
    while (v4 < *(_QWORD *)(v40 + 16))
    {
      sub_2421A2FC8(v190 + v4 * v42, (uint64_t)&v204);
      sub_242198260(&v204, *((uint64_t *)&v205 + 1));
      v43 = sub_2421AF5BC();
      v44 = sub_2421AF838();
      v194 = v174;
      v3 = *(_QWORD *)(v44 - 8);
      v45 = *(_QWORD *)(v3 + 64);
      MEMORY[0x24BDAC7A8](v44);
      v2 = (v45 + 15) & 0xFFFFFFFFFFFFFFF0;
      v0 = ((char *)v174 - v2);
      v46 = (*(uint64_t (**)(char *, _QWORD, uint64_t))(v3 + 104))((char *)v174 - v2, *MEMORY[0x24BE687A0], v44);
      MEMORY[0x24BDAC7A8](v46);
      v48 = (char *)v174 - v2;
      v49 = *(_QWORD *)(v43 + 16);
      v195 = (_QWORD *)v43;
      if (v49)
      {
        v193 = v47;
        v192 = (char *)v4;
        v2 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
        v197 = *(_QWORD *)(v3 + 16);
        ((void (*)(char *, unint64_t, uint64_t))v197)(v48, v43 + v2, v44);
        sub_2421A3E68(&qword_2543A6980, (uint64_t (*)(uint64_t))MEMORY[0x24BE687A8]);
        v4 = v50;
        v42 = sub_2421A4090();
        sub_2421A419C((uint64_t)v48);
        if ((v42 & 1) != 0)
        {
LABEL_21:
          sub_2421A40A4();
          sub_2421A419C((uint64_t)v0);
          sub_242199794();
          v51 = (__int128 *)sub_2421A4268();
          sub_24219BA44(v51, (uint64_t)v203);
          v0 = v200;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_2421A2FAC(0, (int64_t)v0[2].isa + 1, 1);
            v0 = v200;
          }
          sub_2421A417C();
          v2 = (unint64_t)v0[2].isa;
          v52 = (unint64_t)v0[3].isa;
          if (v2 >= v52 >> 1)
          {
            sub_2421A2FAC((char *)(v52 > 1), v2 + 1, 1);
            v0 = v200;
          }
          v0[2].isa = (Class)(v2 + 1);
          sub_24219BA44(v203, (uint64_t)&v0[4] + v2 * v42);
          goto LABEL_34;
        }
        if (v49 != 1)
        {
          v196 = *(_QWORD *)(v3 + 72);
          v42 = (uint64_t)v195 + v196 + v2;
          v2 = 1;
          while (1)
          {
            ((void (*)(char *, uint64_t, uint64_t))v197)(v48, v42, v44);
            v40 = v2 + 1;
            if (__OFADD__(v2, 1))
              break;
            v3 = sub_2421A4090();
            sub_2421A419C((uint64_t)v48);
            if ((v3 & 1) != 0)
              goto LABEL_21;
            ++v2;
            v42 += v196;
            if (v40 == v49)
              goto LABEL_32;
          }
          __break(1u);
LABEL_145:
          sub_2421A3F70();
          v169 = sub_242199868();
          if (sub_2421A3F7C(v169))
          {
            v170 = (_WORD *)sub_24218D61C();
            sub_2421A41B4(v170);
            v137 = "Cleared any pending OOS CFUs";
LABEL_117:
            sub_2421A3FB0(&dword_24218A000, v135, v136, v137);
            sub_24218D600();
          }
LABEL_118:

          v171 = sub_2421A4104();
          goto LABEL_139;
        }
LABEL_32:
        sub_2421A417C();
      }
      sub_2421A419C((uint64_t)v0);
      sub_242199794();
      v53 = sub_2421A4268();
      sub_24218E18C(v53);
LABEL_34:
      if (++v4 == v191)
      {
        v41 = v200;
        goto LABEL_36;
      }
    }
    __break(1u);
LABEL_148:
    __break(1u);
LABEL_149:
    __break(1u);
  }
LABEL_36:
  swift_bridgeObjectRelease();
  v54 = *(_QWORD *)(v41 + 16);
  if (v54)
  {
    v55 = v41 + 32;
    swift_retain();
    v56 = MEMORY[0x24BEE4AF8];
    v4 = 40;
    v0 = &qword_2543A6A68;
    do
    {
      sub_2421A2FC8(v55, (uint64_t)&v204);
      sub_2421A2FC8((uint64_t)&v204, (uint64_t)v203);
      sub_24218D500(&qword_2543A67F8);
      sub_24218D500(&qword_2543A6808);
      if ((swift_dynamicCast() & 1) == 0)
      {
        v202 = 0;
        v200 = 0u;
        v201 = 0u;
      }
      sub_24218E18C((uint64_t)&v204);
      if (*((_QWORD *)&v201 + 1))
      {
        sub_24219BA44(&v200, (uint64_t)v203);
        sub_24219BA44(v203, (uint64_t)&v200);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_2421A425C(0, *(_QWORD *)(v56 + 16) + 1);
          v56 = v59;
        }
        v58 = *(_QWORD *)(v56 + 16);
        v57 = *(_QWORD *)(v56 + 24);
        if (v58 >= v57 >> 1)
        {
          sub_2421A425C(v57 > 1, v58 + 1);
          v56 = v60;
        }
        *(_QWORD *)(v56 + 16) = v58 + 1;
        sub_24219BA44(&v200, v56 + 40 * v58 + 32);
      }
      else
      {
        sub_242199198((uint64_t)&v200, &qword_2543A6A68);
      }
      v55 += 40;
      --v54;
    }
    while (v54);
    swift_release_n();
  }
  else
  {
    swift_release();
    v56 = MEMORY[0x24BEE4AF8];
  }
  v3 = *(_QWORD *)(v56 + 16);
  if (v3)
  {
    *(_QWORD *)&v203[0] = MEMORY[0x24BEE4AF8];
    sub_2421A2F90(0, v3, 0);
    v0 = (v56 + 32);
    v61 = sub_242199484();
    v197 = v61;
    v62 = *(_QWORD *)(v61 - 8);
    v63 = *(_QWORD *)(v62 + 64);
    do
    {
      MEMORY[0x24BDAC7A8](v61);
      sub_2421A2FC8((uint64_t)v0, (uint64_t)&v204);
      v64 = *((_QWORD *)&v205 + 1);
      v65 = v206;
      sub_242198260(&v204, *((uint64_t *)&v205 + 1));
      MEMORY[0x2426A4724](v64, v65);
      sub_24218E18C((uint64_t)&v204);
      v66 = *(_QWORD *)&v203[0];
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_2421A2F90(0, *(_QWORD *)(v66 + 16) + 1, 1);
        v66 = *(_QWORD *)&v203[0];
      }
      v4 = *(_QWORD *)(v66 + 16);
      v67 = *(_QWORD *)(v66 + 24);
      v54 = v4 + 1;
      if (v4 >= v67 >> 1)
      {
        sub_2421A2F90(v67 > 1, v4 + 1, 1);
        v66 = *(_QWORD *)&v203[0];
      }
      *(_QWORD *)(v66 + 16) = v54;
      v61 = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v62 + 32))(v66+ ((*(unsigned __int8 *)(v62 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v62 + 80))+ *(_QWORD *)(v62 + 72) * v4, (char *)v174 - ((v63 + 15) & 0xFFFFFFFFFFFFFFF0), v197);
      *(_QWORD *)&v203[0] = v66;
      v0 += 5;
      --v3;
    }
    while (v3);
    sub_2421A4070();
  }
  else
  {
    sub_2421A4070();
    LOBYTE(v66) = MEMORY[0x24BEE4AF8];
  }
  v2 = sub_24219CCCC();
  swift_bridgeObjectRetain();
  sub_2421A3F70();
  v68 = sub_242199868();
  v69 = sub_2421A3F7C(v68);
  v188 = v2;
  if (v69)
  {
    v70 = (uint8_t *)sub_24218D61C();
    *(_DWORD *)v70 = 134217984;
    *(_QWORD *)&v204 = *(_QWORD *)(v188 + 16);
    sub_2421A4038();
    sub_242199794();
    sub_2421A4030(&dword_24218A000, v0, (os_log_type_t)v66, "Checking if any of %ld subscriptions are out of space", v70);
    sub_24218D600();
  }

  sub_2421A4070();
  v199 = 0;
  v71 = *(_QWORD *)(v2 + 56);
  v190 = v2 + 56;
  v72 = 1 << *(_BYTE *)(v2 + 32);
  v73 = -1;
  if (v72 < 64)
    v73 = ~(-1 << v72);
  v74 = (uint64_t (*)())(v73 & v71);
  v75 = sub_242199484();
  v180 = v174;
  v197 = (uint64_t)v75[-1].isa;
  MEMORY[0x24BDAC7A8](v75);
  v193 = v76;
  v192 = (char *)v174 - ((v76 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2421A4078();
  v77 = 0;
  v187 = 0;
  v78 = v72 + 63;
  v0 = v75;
  v191 = v78 >> 6;
  *(_QWORD *)&v79 = 136315394;
  v185 = v79;
  v174[1] = MEMORY[0x24BEE4AD8] + 8;
  if (v74)
  {
LABEL_64:
    sub_2421A4334();
    v196 = (uint64_t)v74;
    v81 = v80 | (v77 << 6);
    goto LABEL_79;
  }
  while (2)
  {
    v82 = __OFADD__(v77++, 1);
    if (v82)
      goto LABEL_148;
    if (v77 >= v191)
      goto LABEL_101;
    v83 = *(_QWORD *)(v190 + 8 * v77);
    if (!v83)
    {
      sub_2421A41E4();
      if (v84 == v82)
        goto LABEL_101;
      sub_2421A416C();
      if (!v83)
      {
        sub_2421A41E4();
        if (v84 == v82)
          goto LABEL_101;
        sub_2421A416C();
        if (!v83)
        {
          sub_2421A41E4();
          if (v84 == v82)
          {
LABEL_101:
            v74 = swift_allocError;
            v96 = v187;
            v93 = v180;
            swift_release();
            if (qword_2543A6AE8 != -1)
              goto LABEL_152;
            goto LABEL_102;
          }
          sub_2421A416C();
          if (!v83)
          {
            while (1)
            {
              v77 = v85 + 1;
              if (__OFADD__(v85, 1))
                goto LABEL_149;
              if (v77 >= v191)
                goto LABEL_101;
              v83 = *(_QWORD *)(v190 + 8 * v77);
              ++v85;
              if (v83)
                goto LABEL_78;
            }
          }
        }
      }
      v77 = v85;
    }
LABEL_78:
    v196 = (v83 - 1) & v83;
    v81 = __clz(__rbit64(v83)) + (v77 << 6);
LABEL_79:
    v75 = v197;
    v86 = v192;
    (*(void (**)(char *, unint64_t, NSObject *))(v197 + 16))(v192, *(_QWORD *)(v2 + 48) + *(_QWORD *)(v197 + 72) * v81, v0);
    v195 = v174;
    sub_2421A412C();
    MEMORY[0x24BDAC7A8](v87);
    sub_242190184();
    v4 = v88 - v89;
    v74 = (uint64_t (*)())v0;
    ((void (*)(uint64_t, char *, NSObject *))v75[4].isa)(v88 - v89, v86, v0);
    v90 = sub_2421AF7D8();
    v194 = v174;
    v54 = *(_QWORD *)(v90 - 8);
    v91 = *(_QWORD *)(v54 + 64);
    MEMORY[0x24BDAC7A8](v90);
    v3 = (uint64_t)v174 - ((v91 + 15) & 0xFFFFFFFFFFFFFFF0);
    LOBYTE(v75) = v4;
    sub_2421AF6F4();
    v92 = (*(uint64_t (**)(uint64_t, uint64_t))(v54 + 88))(v3, v90);
    if (!MEMORY[0x24BE68620] || (_DWORD)v92 != *MEMORY[0x24BE68620])
    {
      v0 = v74;
      sub_2421A42AC(v4, *(uint64_t (**)(uint64_t, uint64_t))(v197 + 8));
LABEL_87:
      sub_2421A411C();
      sub_2421A40A4();
      sub_2421A4354();
      goto LABEL_88;
    }
    v189 = v174;
    MEMORY[0x24BDAC7A8](v92);
    v93 = ((char *)v174 - ((v91 + 15) & 0xFFFFFFFFFFFFFFF0));
    (*(void (**)(NSObject *, uint64_t, uint64_t))(v54 + 16))(v93, v3, v90);
    (*(void (**)(NSObject *, uint64_t))(v54 + 96))(v93, v90);
    v75 = sub_2421AF82C();
    v94 = v75[-1].isa;
    v95 = (*((uint64_t (**)(NSObject *, NSObject *))v94 + 11))(v93, v75);
    if (!MEMORY[0x24BE68790] || v95 != *MEMORY[0x24BE68790])
    {
      sub_2421A42AC(v4, *(uint64_t (**)(uint64_t, uint64_t))(v197 + 8));
      v112 = v93;
      v0 = v74;
      (*((void (**)(NSObject *, NSObject *))v94 + 1))(v112, v75);
      sub_2421A40A4();
      v2 = v188;
      goto LABEL_87;
    }
    LOBYTE(v75) = v4;
    v96 = v187;
    v97 = sub_2421AF700();
    if (v96)
    {
      v187 = v174;
      sub_2421A412C();
      MEMORY[0x24BDAC7A8](v98);
      sub_242190184();
      v101 = v99 - v100;
      sub_2421A42A0(v99 - v100);
      sub_24218D674();
      sub_24218D674();
      v102 = sub_2421A3F70();
      v103 = sub_2421AFB80();
      v104 = v103;
      if (os_log_type_enabled(v102, v103))
      {
        v105 = sub_24218D61C();
        v177 = v104;
        v106 = v105;
        v176 = (_QWORD *)sub_24218D61C();
        v107 = sub_24218D61C();
        *(_DWORD *)v106 = sub_2421A42C0(v107, (uint64_t)&v204 + 8).n128_u32[0];
        sub_2421A3E68(&qword_2571DF438, (uint64_t (*)(uint64_t))MEMORY[0x24BE684A0]);
        v175 = v102;
        v108 = sub_2421AFD3C();
        sub_242199764(v108, v109);
        *(_QWORD *)(v106 + 4) = v110;
        sub_24219947C();
        v178 = *(uint64_t (**)(uint64_t, uint64_t))(v197 + 8);
        sub_2421A42AC(v101, v178);
        *(_WORD *)(v106 + 12) = 2112;
        sub_24218D674();
        v111 = sub_2421A4194();
        *(_QWORD *)(v106 + 14) = v111;
        *v176 = v111;
        sub_24218D624();
        sub_24218D624();
        _os_log_impl(&dword_24218A000, v175, (os_log_type_t)v177, "Unable to fetch asset size for subscription: %s with error: %@", (uint8_t *)v106, 0x16u);
        sub_24218D500(&qword_2543A6B08);
        sub_24219BC64();
        sub_24218D600();
      }

      sub_24218D624();
      sub_24218D624();
      v75 = *(NSObject **)(v197 + 8);
      sub_2421A4154(v101);
      sub_24218D624();
      sub_2421A4154(v4);
      v187 = 0;
      goto LABEL_100;
    }
    v187 = 0;
    if (!__CFADD__(v199, v97))
    {
      v184 = v174;
      v199 += v97;
      sub_2421A412C();
      MEMORY[0x24BDAC7A8](v113);
      sub_242190184();
      v116 = v114 - v115;
      sub_2421A42A0(v114 - v115);
      v117 = sub_2421A3F70();
      v118 = sub_2421AFB98();
      v119 = v118;
      if (os_log_type_enabled(v117, v118))
      {
        v120 = sub_24218D61C();
        LODWORD(v178) = v119;
        v121 = v120;
        v122 = sub_24218D61C();
        *(_DWORD *)v121 = sub_2421A42C0(v122, (uint64_t)v203).n128_u32[0];
        sub_2421A3E68(&qword_2571DF438, (uint64_t (*)(uint64_t))MEMORY[0x24BE684A0]);
        v123 = sub_2421AFD3C();
        sub_242199764(v123, v124);
        *(_QWORD *)(v121 + 4) = v125;
        sub_24219947C();
        sub_2421A4154(v116);
        *(_WORD *)(v121 + 12) = 2048;
        *(_QWORD *)(v121 + 14) = v199;
        _os_log_impl(&dword_24218A000, v117, (os_log_type_t)v178, "Found subscription: %s with out of space status - new remaining space required: %llu", (uint8_t *)v121, 0x16u);
        swift_arrayDestroy();
        sub_24218D600();
      }

      v126 = *(void (**)(uint64_t, uint64_t (*)()))(v197 + 8);
      v126(v116, v74);
      v126(v4, v74);
LABEL_100:
      v0 = v74;
      sub_2421A4354();
      sub_2421A40A4();
      sub_2421A411C();
      v2 = v188;
LABEL_88:
      if (v74)
        goto LABEL_64;
      continue;
    }
    break;
  }
  __break(1u);
LABEL_152:
  swift_once();
LABEL_102:
  if (byte_2543A6BA8 != 1)
    goto LABEL_127;
  v127 = sub_24219CEF8();
  if (!v127)
  {
    v204 = 0u;
    v205 = 0u;
LABEL_113:
    sub_242199198((uint64_t)&v204, &qword_2543A6910);
    goto LABEL_127;
  }
  v93 = v127;
  sub_2421A4220();
  v128 = (void *)sub_2421AFA6C();
  v75 = -[NSObject valueForKeyPath:](v93, sel_valueForKeyPath_, v128);

  if (v75)
  {
    sub_2421AFC10();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v203, 0, 32);
  }
  sub_24218D4B8((uint64_t)v203, (uint64_t)&v204);
  if (!*((_QWORD *)&v205 + 1))
    goto LABEL_113;
  if (swift_dynamicCast())
  {
    if ((v203[0] & 1) != 0)
    {
      sub_2421A4078();
      v199 = 0x1F0000000;
      sub_2421A3F70();
      v129 = sub_242199868();
      if (sub_2421A3F7C(v129))
      {
        v130 = (uint8_t *)sub_24218D61C();
        *(_DWORD *)v130 = *((_QWORD *)v74 + 259);
        *(_QWORD *)&v204 = 0x1F0000000;
        sub_2421A4038();
        sub_2421A4030(&dword_24218A000, v93, (os_log_type_t)v75, "userDefaultsOutOfStorageStateOverrideKey set to YES, setting remainingSpaceRequired to: %llu", v130);
        goto LABEL_125;
      }
    }
    else
    {
      sub_2421A4078();
      v199 = 0;
      sub_2421A3F70();
      v147 = sub_242199868();
      if (sub_2421A3F7C(v147))
      {
        v148 = (uint8_t *)sub_24218D61C();
        *(_DWORD *)v148 = *((_QWORD *)v74 + 259);
        *(_QWORD *)&v204 = 0;
        sub_2421A4038();
        sub_2421A4030(&dword_24218A000, v93, (os_log_type_t)v75, "userDefaultsOutOfStorageStateOverrideKey set to NO, setting remainingSpaceRequired to: %llu", v148);
LABEL_125:
        sub_24218D600();
      }
    }

  }
LABEL_127:
  swift_beginAccess();
  v149 = v199;
  if (v199)
  {
    sub_2421A3F70();
    v150 = sub_242199868();
    if (sub_2421A3F7C(v150))
    {
      v151 = (uint8_t *)sub_24218D61C();
      *(_DWORD *)v151 = *((_QWORD *)v74 + 259);
      v198 = v149;
      sub_2421AFBEC();
      sub_2421A4030(&dword_24218A000, v93, (os_log_type_t)v75, "Will attempt to post out of storage CFU with remaining space required: %llu", v151);
      sub_24218D600();
    }

    sub_24219EBDC((uint64_t *)v199);
    if (v96)
    {
      sub_24218D674();
      sub_24218D674();
      sub_2421A3F70();
      v152 = sub_2421A432C();
      if (sub_2421A3FD4(v152))
      {
        v153 = (_DWORD *)sub_24218D61C();
        v154 = (_QWORD *)sub_24218D61C();
        *v153 = 138412290;
        sub_24218D674();
        v155 = sub_2421A4194();
        sub_2421A3FF8(v155);
        *v154 = v54;
        sub_24218D624();
        sub_24218D624();
        v158 = "Could not post out of storage CFU with error: %@";
        goto LABEL_136;
      }
      goto LABEL_137;
    }
  }
  else
  {
    sub_24219FC58();
    if (v96)
    {
      sub_24218D674();
      sub_24218D674();
      sub_2421A3F70();
      v159 = sub_2421A432C();
      if (sub_2421A3FD4(v159))
      {
        v160 = (_DWORD *)sub_24218D61C();
        v161 = (_QWORD *)sub_24218D61C();
        *v160 = 138412290;
        sub_24218D674();
        v162 = sub_2421A4194();
        sub_2421A3FF8(v162);
        *v161 = v54;
        sub_24218D624();
        sub_24218D624();
        v158 = "Could not clear out of storage CFUs with error: %@";
LABEL_136:
        sub_2421A3FE4(&dword_24218A000, v156, v157, v158);
        sub_24218D500(&qword_2543A6B08);
        sub_24219BC64();
        sub_24218D600();
      }
LABEL_137:

      sub_24218D624();
      sub_24218D624();
      sub_24218D624();
    }
    else
    {
      sub_2421A3F70();
      v163 = sub_242199868();
      if (sub_2421A3F7C(v163))
      {
        v164 = (_WORD *)sub_24218D61C();
        sub_2421A41B4(v164);
        sub_2421A3FB0(&dword_24218A000, v165, v166, "Device has enough space. Cleared any pending OOS CFUs");
        sub_24218D600();
      }

    }
  }
  v173 = *(void (**)(uint64_t, uint64_t))(v182 + 8);
  v171 = v181;
  v172 = v183;
LABEL_139:
  v173(v171, v172);
  sub_242199304();
}

uint64_t sub_24219E958(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(char *, unint64_t, uint64_t);
  char v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  if (*(_QWORD *)(a2 + 16)
    && (v4 = sub_2421AF88C(),
        sub_2421A3E68(&qword_2543A6A98, (uint64_t (*)(uint64_t))MEMORY[0x24BE3BF78]),
        v5 = sub_2421AFA00(),
        v6 = -1 << *(_BYTE *)(a2 + 32),
        v7 = v5 & ~v6,
        v17 = a2 + 56,
        ((*(_QWORD *)(a2 + 56 + ((v7 >> 3) & 0xFFFFFFFFFFFFF8)) >> v7) & 1) != 0))
  {
    v15 = ~v6;
    v16 = a1;
    v8 = *(_QWORD *)(v4 - 8);
    v10 = *(_QWORD *)(v8 + 64);
    v9 = *(_QWORD *)(v8 + 72);
    v11 = *(void (**)(char *, unint64_t, uint64_t))(v8 + 16);
    do
    {
      MEMORY[0x24BDAC7A8](v5);
      v11((char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), *(_QWORD *)(a2 + 48) + v9 * v7, v4);
      sub_2421A3E68(&qword_2543A6AA0, (uint64_t (*)(uint64_t))MEMORY[0x24BE3BF78]);
      v12 = sub_2421AFA0C();
      v5 = (*(uint64_t (**)(char *, uint64_t))(v8 + 8))((char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
      if ((v12 & 1) != 0)
        break;
      v7 = (v7 + 1) & v15;
    }
    while (((*(_QWORD *)(v17 + ((v7 >> 3) & 0xFFFFFFFFFFFFF8)) >> v7) & 1) != 0);
  }
  else
  {
    v12 = 0;
  }
  return v12 & 1;
}

void sub_24219EAE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v13;
  uint64_t v14;
  char v15;
  _QWORD *v16;
  char v18;

  if (*(_QWORD *)(a3 + 16))
  {
    sub_2421AFD84();
    sub_2421AFAC0();
    v6 = sub_2421AFD9C();
    v7 = -1 << *(_BYTE *)(a3 + 32);
    v8 = v6 & ~v7;
    sub_2421A4048();
    if ((v9 & 1) != 0)
    {
      v10 = *(_QWORD *)(a3 + 48);
      v11 = (_QWORD *)(v10 + 16 * v8);
      if ((*v11 != a1 || v11[1] != a2) && (sub_2421A40F4() & 1) == 0)
      {
        v13 = ~v7;
        v14 = (v8 + 1) & v13;
        sub_2421A4048();
        if ((v15 & 1) != 0)
        {
          do
          {
            v16 = (_QWORD *)(v10 + 16 * v14);
            if (*v16 == a1 && v16[1] == a2)
              break;
            if ((sub_2421A40F4() & 1) != 0)
              break;
            v14 = (v14 + 1) & v13;
            sub_2421A4048();
          }
          while ((v18 & 1) != 0);
        }
      }
    }
  }
}

void sub_24219EBDC(uint64_t *a1)
{
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
  void (**v14)(_QWORD, uint64_t);
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
  char *v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  char *v40;
  unint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  void (**v45)(_QWORD, uint64_t);
  uint64_t v46;
  uint64_t v47;
  os_log_type_t v48;
  NSObject *v49;
  os_log_type_t v50;
  uint8_t *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t *v54;
  void *v55;
  int v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  double v60;
  double v61;
  uint64_t v62;
  os_log_type_t v63;
  NSObject *v64;
  os_log_type_t v65;
  _BOOL4 v66;
  char *v67;
  char *v68;
  uint64_t v69;
  void (*v70)(char *, void *);
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  id v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  id v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  char *v92;
  void *v93;
  uint64_t v94;
  uint64_t inited;
  void *v96;
  id v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  id v102;
  id v103;
  void *v104;
  id v105;
  char *v106;
  void *v107;
  id v108;
  void *v109;
  uint64_t v110;
  uint64_t v111;
  unsigned int v112;
  void *v113;
  uint64_t v114;
  id v115;
  uint64_t v116;
  uint64_t v117;
  id v118;
  NSObject *v119;
  os_log_type_t v120;
  _BOOL4 v121;
  _DWORD *v122;
  _QWORD *v123;
  id v124;
  id v125;
  void *v126;
  uint64_t v127;
  uint64_t v128;
  char *v129;
  uint64_t v130;
  void *v131;
  void *v132;
  NSObject *v133;
  os_log_type_t v134;
  _DWORD *v135;
  uint64_t v136;
  unint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  char *v141;
  char *v142;
  char *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  char *v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t *v156;
  uint64_t v157;
  char *v158;
  uint64_t v159;
  uint64_t v160;
  void (**v161)(_QWORD, uint64_t);
  _QWORD v162[5];
  __int128 v163;
  __int128 v164;
  uint64_t v165;
  char v166[8];
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;

  v156 = a1;
  v165 = *MEMORY[0x24BDAC8D0];
  sub_2421AFA48();
  sub_242199348();
  MEMORY[0x24BDAC7A8](v3);
  sub_242199AB8();
  sub_2421A3FC4(v4);
  sub_2421AF4D8();
  sub_242199348();
  MEMORY[0x24BDAC7A8](v5);
  sub_242199AB8();
  sub_2421A3FC4(v6);
  sub_2421AFA60();
  sub_242199348();
  MEMORY[0x24BDAC7A8](v7);
  sub_242199AB8();
  v149 = v8;
  sub_24218D500(&qword_2543A67E8);
  sub_242199348();
  v10 = MEMORY[0x24BDAC7A8](v9);
  v158 = (char *)&v140 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  sub_2421A3FC4((uint64_t)&v140 - v12);
  v13 = sub_2421AF3D0();
  sub_2421A42D4(v13, (uint64_t)&v168);
  v161 = v14;
  sub_242199348();
  MEMORY[0x24BDAC7A8](v15);
  sub_242199AB8();
  sub_2421A3FC4(v16);
  v17 = sub_2421AF3B8();
  sub_2421A42D4(v17, (uint64_t)&v164 + 8);
  v151 = v18;
  sub_242199348();
  MEMORY[0x24BDAC7A8](v19);
  sub_242199AB8();
  sub_2421A3FC4(v20);
  v21 = sub_2421AF3DC();
  sub_2421A42D4(v21, (uint64_t)v166);
  v154 = v22;
  sub_242199348();
  MEMORY[0x24BDAC7A8](v23);
  sub_242199978();
  v26 = v25 - v24;
  sub_24218D500(&qword_2543A67F0);
  sub_242199348();
  MEMORY[0x24BDAC7A8](v27);
  sub_2421A4018();
  v28 = sub_2421AF4A8();
  v29 = *(_QWORD *)(v28 - 8);
  v30 = MEMORY[0x24BDAC7A8](v28);
  v32 = (char *)&v140 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = MEMORY[0x24BDAC7A8](v30);
  v35 = (char *)&v140 - v34;
  v36 = MEMORY[0x24BDAC7A8](v33);
  v38 = (char *)&v140 - v37;
  MEMORY[0x24BDAC7A8](v36);
  v40 = (char *)&v140 - v39;
  v41 = (unint64_t)sub_24219FD64();
  if (v1)
    return;
  v144 = v2;
  v141 = v38;
  v42 = v158;
  v143 = v35;
  v142 = v32;
  v145 = v29;
  v147 = v40;
  v148 = v28;
  v146 = 0;
  if (v41 >> 62)
  {
    swift_bridgeObjectRetain();
    v43 = sub_2421AFD00();
    swift_bridgeObjectRelease();
  }
  else
  {
    v43 = *(_QWORD *)((v41 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v44 = (uint64_t)v42;
  v45 = v161;
  swift_bridgeObjectRelease();
  v46 = v160;
  if (v43 >= 1)
  {
    if (qword_2543A6928 != -1)
      swift_once();
    v47 = sub_242199940();
    v48 = sub_24218E28C(v47, (uint64_t)qword_2543A6B78);
    v49 = sub_2421AF928();
    v50 = sub_2421AFB98();
    if (sub_2421A3F7C(v50))
    {
      v51 = (uint8_t *)sub_24218D61C();
      *(_WORD *)v51 = 0;
      _os_log_impl(&dword_24218A000, v49, v48, "Already have pending OOS CFU, skipping", v51, 2u);
      sub_24218D600();
    }

    return;
  }
  v52 = v26;
  sub_2421AF49C();
  v53 = sub_24219CEF8();
  v54 = &qword_2571DF428;
  if (!v53)
  {
    v163 = 0u;
    v164 = 0u;
    sub_2421A40B8();
LABEL_25:
    sub_242199198((uint64_t)&v163, &qword_2543A6910);
    sub_2421A4250(v43, 1);
    goto LABEL_26;
  }
  v55 = (void *)v53;
  if (qword_2571DF108 != -1)
    swift_once();
  v54 = (uint64_t *)sub_2421AFA6C();
  v43 = (uint64_t)objc_msgSend(v55, sel_objectForKey_, v54);

  if (v43)
  {
    sub_2421AFC10();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v162, 0, 32);
  }
  sub_2421A40B8();
  sub_24218D4B8((uint64_t)v162, (uint64_t)&v163);
  if (!*((_QWORD *)&v164 + 1))
    goto LABEL_25;
  v56 = swift_dynamicCast();
  sub_2421A4250(v43, v56 ^ 1u);
  if (sub_24218E0BC(v43, 1, (uint64_t)v55) == 1)
  {
LABEL_26:
    sub_242199198(v43, &qword_2543A67F0);
    goto LABEL_27;
  }
  v57 = v145;
  v58 = v43;
  v59 = v141;
  (*(void (**)(char *, uint64_t, void *))(v145 + 32))(v141, v58, v55);
  sub_2421AF460();
  v61 = v60;
  if (v60 < 604800.0)
  {
    if (qword_2543A6928 != -1)
      swift_once();
    v62 = sub_242199940();
    v63 = sub_24218E28C(v62, (uint64_t)qword_2543A6B78);
    v64 = sub_2421AF928();
    v65 = sub_2421AFB80();
    v66 = sub_2421A3F7C(v65);
    v67 = v147;
    v68 = v141;
    if (v66)
    {
      v69 = sub_24218D61C();
      *(_DWORD *)v69 = 134218240;
      *(double *)&v163 = v61;
      sub_2421A4238();
      *(_WORD *)(v69 + 12) = 2048;
      *(_QWORD *)&v163 = 0x4122750000000000;
      sub_2421A4238();
      _os_log_impl(&dword_24218A000, v64, v63, "It has only been %f seconds since we have last posted a CFU, which does not exceed the minimum interval of %f seconds. Not posting CFU", (uint8_t *)v69, 0x16u);
      sub_24218D600();
    }

    v70 = *(void (**)(char *, void *))(v145 + 8);
    v70(v68, v55);
    v70(v67, v55);
    return;
  }
  (*(void (**)(char *, void *))(v57 + 8))(v59, v55);
  v54 = v156;
  v45 = v161;
LABEL_27:
  v162[0] = v54;
  v71 = v151;
  v72 = v150;
  v73 = v152;
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v151 + 104))(v150, *MEMORY[0x24BDCCAA0], v152);
  v74 = v153;
  sub_2421AF3C4();
  sub_2421AF364();
  v45[1](v74, v46);
  (*(void (**)(uint64_t, uint64_t))(v71 + 8))(v72, v73);
  sub_2421A349C();
  sub_2421A3E68(&qword_2571DF448, (uint64_t (*)(uint64_t))MEMORY[0x24BDCCAD0]);
  sub_2421A34D8();
  v75 = v155;
  sub_2421AFC04();
  (*(void (**)(uint64_t, uint64_t))(v154 + 8))(v52, v75);
  sub_2421A4220();
  v76 = v157;
  v77 = sub_2421AF424();
  sub_24219971C(v77, &qword_2571DF458);
  sub_2421A3514(v76, v44);
  v78 = sub_24219FB90(0, 0, v44);
  if (!v78)
  {
    __break(1u);
    goto LABEL_50;
  }
  v79 = v78;
  sub_2421A4220();
  sub_2421AFA18();
  sub_2421A42EC();
  v160 = sub_2421A3F8C();
  v159 = v80;
  sub_2421AFA3C();
  sub_2421A422C();
  sub_2421AFA24();
  swift_bridgeObjectRelease();
  sub_2421A422C();
  sub_2421AFA54();
  sub_2421A42EC();
  v81 = sub_2421A3F8C();
  v83 = v82;
  sub_2421A4220();
  sub_2421AFA18();
  sub_2421A42EC();
  v84 = sub_2421A3F8C();
  v86 = v85;
  v87 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE1B3B0]), sel_init);
  sub_2421A4220();
  sub_2421A3CF4(v88, v89, v87);
  objc_msgSend(v87, sel_setDisplayStyle_, 2);
  sub_2421A3E14(v84, v86, v87, (SEL *)&selRef_setTitle_);
  sub_24218D500(&qword_2543A6908);
  v90 = swift_allocObject();
  *(_OWORD *)(v90 + 16) = xmmword_2421B0740;
  *(_QWORD *)(v90 + 32) = v79;
  *(_QWORD *)&v163 = v90;
  sub_2421AFB08();
  v91 = v163;
  v161 = v79;
  sub_2421A3D38(v91, v87);
  v92 = v143;
  sub_2421AF484();
  v93 = (void *)sub_2421AF478();
  v158 = *(char **)(v145 + 8);
  v94 = ((uint64_t (*)(char *, uint64_t))v158)(v92, v148);
  sub_2421A4320(v94, sel_setExpirationDate_);

  sub_24218D500(&qword_2571DF460);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2421B0720;
  *(_QWORD *)&v163 = *MEMORY[0x24BE1B370];
  v96 = (void *)v163;
  type metadata accessor for FLUserInfoProperty();
  sub_2421A3E68(&qword_2571DF210, (uint64_t (*)(uint64_t))type metadata accessor for FLUserInfoProperty);
  v97 = v96;
  v98 = sub_2421AFC28();
  v99 = sub_24219971C(v98, (unint64_t *)&qword_2543A69A8);
  v100 = sub_2421AFBC8();
  *(_QWORD *)(inited + 96) = v99;
  *(_QWORD *)(inited + 72) = v100;
  v101 = sub_2421AF9F4();
  sub_2421A3DA8(v101, v87);
  v102 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE1B3B8]), sel_init);
  sub_2421A4320((uint64_t)v102, sel_setNotification_);

  v103 = sub_2421A4084();
  if (!v103)
  {
LABEL_50:
    __break(1u);
    goto LABEL_51;
  }
  v104 = v103;
  sub_2421A3E14(v160, v159, v103, (SEL *)&selRef_setTitle_);

  v105 = sub_2421A4084();
  v106 = v147;
  if (!v105)
  {
LABEL_51:
    __break(1u);
    goto LABEL_52;
  }
  v107 = v105;
  sub_2421A3E14(v81, v83, v105, (SEL *)&selRef_setInformativeText_);

  v108 = sub_2421A4084();
  if (!v108)
  {
LABEL_52:
    __break(1u);
    return;
  }
  v109 = v108;
  objc_msgSend(v108, sel_setActivateAction_, v161);

  v110 = v148;
  v111 = v157;
  if (qword_2543A6AE0 != -1)
    swift_once();
  *(_QWORD *)&v163 = 0;
  v112 = objc_msgSend((id)qword_2543A6AD8, sel_postFollowUpItem_error_, v87, &v163);
  v113 = (void *)v163;
  if (v112)
  {
    v114 = qword_2543A6928;
    v115 = (id)v163;
    if (v114 != -1)
      swift_once();
    v116 = sub_242199940();
    v117 = sub_24218E28C(v116, (uint64_t)qword_2543A6B78);
    v118 = v87;
    v160 = v117;
    v119 = sub_2421AF928();
    v120 = sub_2421AFB98();
    v121 = os_log_type_enabled(v119, v120);
    v159 = (uint64_t)v118;
    if (v121)
    {
      v122 = (_DWORD *)sub_24218D61C();
      v123 = (_QWORD *)sub_24218D61C();
      *v122 = 138412290;
      *(_QWORD *)&v163 = v118;
      v124 = v118;
      sub_2421AFBEC();
      *v123 = v87;

      sub_2421A4294(&dword_24218A000, v119, v120, "Posted new CFU with item: %@");
      sub_24218D500(&qword_2543A6B08);
      swift_arrayDestroy();
      sub_24218D600();
    }

    v126 = v118;
    v127 = v148;
    v128 = v145;
    v129 = v142;

    v130 = sub_24219CEF8();
    if (v130)
    {
      v131 = (void *)v130;
      v132 = (void *)sub_2421AF478();
      if (qword_2571DF108 != -1)
        swift_once();
      v113 = (void *)sub_2421AFA6C();
      objc_msgSend(v131, sel_setValue_forKey_, v132, v113);

    }
    (*(void (**)(char *, char *, uint64_t))(v128 + 16))(v129, v106, v127);
    v133 = sub_2421AF928();
    v134 = sub_2421AFB98();
    if (os_log_type_enabled(v133, v134))
    {
      v135 = (_DWORD *)sub_24218D61C();
      *(_QWORD *)&v163 = sub_24218D61C();
      *v135 = 136315138;
      sub_2421A3E68(&qword_2571DF468, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900]);
      v136 = sub_2421AFD3C();
      sub_2421A0BC4(v136, v137, (uint64_t *)&v163);
      v162[0] = v138;
      sub_2421AFBEC();
      sub_24219947C();
      sub_2421A427C();
      sub_2421A4294(&dword_24218A000, v133, v134, "Persisted new last post date of %s to user defaults");
      swift_arrayDestroy();
      sub_24218D600();
    }

    sub_2421A427C();
    sub_2421A40B0((uint64_t)&v169);
    sub_2421A40B0((uint64_t)&v167);
    sub_2421A4214(v139, &qword_2543A67E8);
    ((void (*)(char *, uint64_t))v113)(v106, v127);
  }
  else
  {
    v125 = (id)v163;
    sub_2421AF3F4();

    sub_2421A4368();
    sub_2421A40B0((uint64_t)&v169);

    sub_242199198(v111, &qword_2543A67E8);
    ((void (*)(char *, uint64_t))v158)(v106, v110);
  }
}

id sub_24219FB90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  if (a2)
  {
    v4 = (void *)sub_2421AFA6C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  v5 = sub_2421AF430();
  v6 = 0;
  if (sub_24218E0BC(a3, 1, v5) != 1)
  {
    v6 = (void *)sub_2421AF40C();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(a3, v5);
  }
  v7 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_actionWithLabel_url_, v4, v6);

  return v7;
}

id sub_24219FC58()
{
  void *v0;
  void *v1;
  uint64_t v2;
  id v4;
  id v5[2];

  v5[1] = *(id *)MEMORY[0x24BDAC8D0];
  if (qword_2543A6AE0 != -1)
    swift_once();
  v1 = (void *)qword_2543A6AD8;
  sub_24218D500(&qword_2543A6B40);
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_2421B0720;
  *(_QWORD *)(v2 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v2 + 32) = 0xD000000000000027;
  *(_QWORD *)(v2 + 40) = 0x80000002421B18E0;
  v5[0] = 0;
  if ((sub_2421A3C88(v2, (uint64_t)v5, v1) & 1) != 0)
    return v5[0];
  v4 = v5[0];
  sub_2421A42B4();

  return (id)sub_2421A4368();
}

id sub_24219FD64()
{
  void *v0;
  id v1;
  id v2;
  void *v3;
  unint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  id v14;
  id v15[2];

  v15[1] = *(id *)MEMORY[0x24BDAC8D0];
  if (qword_2543A6AE0 != -1)
    swift_once();
  v15[0] = 0;
  v1 = objc_msgSend((id)qword_2543A6AD8, sel_pendingFollowUpItems_, v15);
  v2 = v15[0];
  if (v1)
  {
    v3 = v1;
    sub_24219971C((uint64_t)v1, &qword_2571DF470);
    v4 = sub_2421AFAFC();
    v5 = v2;

    v15[0] = (id)MEMORY[0x24BEE4AF8];
    if (v4 >> 62)
    {
      swift_bridgeObjectRetain();
      v6 = sub_2421AFD00();
      sub_2421993A4();
      if (v6)
        goto LABEL_6;
    }
    else
    {
      v6 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
      if (v6)
      {
LABEL_6:
        if (v6 < 1)
          __break(1u);
        v7 = 0;
        while (1)
        {
          v8 = (v4 & 0xC000000000000001) != 0
             ? (id)MEMORY[0x2426A4C4C](v7, v4)
             : *(id *)(v4 + 8 * v7 + 32);
          v9 = v8;
          v10 = sub_2421A3E94(v8);
          if (!v11)
            break;
          if (v10 == 0xD000000000000027 && v11 == 0x80000002421B18E0)
          {
            sub_24219947C();
          }
          else
          {
            v12 = sub_2421AFD54();
            sub_24219947C();
            if ((v12 & 1) == 0)
              break;
          }
          sub_2421AFC88();
          sub_2421AFCAC();
          sub_2421AFCB8();
          sub_2421AFC94();
LABEL_18:
          if (v6 == ++v7)
          {
            sub_2421993A4();
            return v15[0];
          }
        }

        goto LABEL_18;
      }
    }
    sub_2421993A4();
    return (id)MEMORY[0x24BEE4AF8];
  }
  else
  {
    v14 = v15[0];
    sub_2421A42B4();

    return (id)sub_2421A4368();
  }
}

uint64_t FollowUpManager.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t FollowUpManager.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

void sub_24219FFD0(uint64_t a1, uint64_t a2, SEL *a3)
{
  void *v3;
  void *v5;

  if (a2)
  {
    v5 = (void *)sub_2421AFA6C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(v3, *a3, v5);

  sub_2421A4348();
}

void sub_2421A0028(char a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v6;
  char v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  size_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;

  if ((a3 & 1) != 0)
  {
    sub_2421A41F4();
    if (v7 != v8)
    {
      if (v6 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return;
      }
      sub_2421A41A4();
    }
  }
  else
  {
    v6 = a2;
  }
  v9 = *(_QWORD *)(a4 + 16);
  if (v6 <= v9)
    v10 = *(_QWORD *)(a4 + 16);
  else
    v10 = v6;
  if (v10)
  {
    sub_24218D500(&qword_2543A6B40);
    v11 = swift_allocObject();
    v12 = j__malloc_size((const void *)v11);
    *(_QWORD *)(v11 + 16) = v9;
    *(_QWORD *)(v11 + 24) = 2 * ((uint64_t)(v12 - 32) / 32);
  }
  else
  {
    v11 = MEMORY[0x24BEE4AF8];
  }
  if ((a1 & 1) != 0)
  {
    sub_2421A0690((char *)(a4 + 32), v9, (char *)(v11 + 32));
    *(_QWORD *)(a4 + 16) = 0;
    sub_24219978C();
  }
  else
  {
    v13 = sub_2421A415C();
    sub_2421A035C(v13, v14, v15, v16);
  }
  sub_2421A4348();
}

uint64_t sub_2421A00F0(char a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v6;
  char v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  _QWORD *v14;
  size_t v15;
  BOOL v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    sub_2421A41F4();
    if (v7 != v8)
    {
      if (v6 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_23;
      }
      sub_2421A41A4();
    }
  }
  else
  {
    v6 = a2;
  }
  v9 = *(_QWORD *)(a4 + 16);
  if (v6 <= v9)
    v10 = *(_QWORD *)(a4 + 16);
  else
    v10 = v6;
  if (!v10)
  {
    v14 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_18;
  }
  sub_24218D500(&qword_2543A6B20);
  v11 = *(_QWORD *)(sub_242199484() - 8);
  v12 = *(_QWORD *)(v11 + 72);
  v13 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  v14 = (_QWORD *)swift_allocObject();
  v15 = j__malloc_size(v14);
  if (!v12 || (v15 - v13 == 0x8000000000000000 ? (v16 = v12 == -1) : (v16 = 0), v16))
  {
LABEL_23:
    sub_2421A405C();
    result = sub_2421AFCE8();
    __break(1u);
    return result;
  }
  v14[2] = v9;
  v14[3] = 2 * ((uint64_t)(v15 - v13) / v12);
LABEL_18:
  v17 = *(unsigned __int8 *)(*(_QWORD *)(sub_242199484() - 8) + 80);
  v18 = (v17 + 32) & ~v17;
  if ((a1 & 1) != 0)
  {
    sub_2421A0798(a4 + v18, v9, (unint64_t)v14 + v18);
    *(_QWORD *)(a4 + 16) = 0;
    sub_24219978C();
  }
  else
  {
    v19 = sub_2421A415C();
    sub_2421A0454(v19, v20, v21, v22);
  }
  return (uint64_t)v14;
}

void sub_2421A0284(char a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v6;
  char v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  size_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;

  if ((a3 & 1) != 0)
  {
    sub_2421A41F4();
    if (v7 != v8)
    {
      if (v6 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return;
      }
      sub_2421A41A4();
    }
  }
  else
  {
    v6 = a2;
  }
  v9 = *(_QWORD *)(a4 + 16);
  if (v6 <= v9)
    v10 = *(_QWORD *)(a4 + 16);
  else
    v10 = v6;
  if (v10)
  {
    sub_24218D500(qword_2543A69B0);
    v11 = swift_allocObject();
    v12 = j__malloc_size((const void *)v11);
    *(_QWORD *)(v11 + 16) = v9;
    *(_QWORD *)(v11 + 24) = 2 * ((uint64_t)(v12 - 32) / 40);
  }
  else
  {
    v11 = MEMORY[0x24BEE4AF8];
  }
  if ((a1 & 1) != 0)
  {
    sub_2421A0894((char *)(a4 + 32), v9, (char *)(v11 + 32));
    *(_QWORD *)(a4 + 16) = 0;
    sub_24219978C();
  }
  else
  {
    v13 = sub_2421A415C();
    sub_2421A0574(v13, v14, v15, v16);
  }
}

uint64_t sub_2421A035C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v5 = a4 + 32 * a1 + 32;
    v6 = a3 + 32 * v4;
    if (v5 >= v6 || v5 + 32 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  result = sub_2421AFD24();
  __break(1u);
  return result;
}

uint64_t sub_2421A0454(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v8 = *(_QWORD *)(sub_2421AF70C() - 8);
    v9 = *(unsigned __int8 *)(v8 + 80);
    v10 = *(_QWORD *)(v8 + 72);
    v11 = a4 + ((v9 + 32) & ~v9) + v10 * a1;
    v12 = v10 * v4;
    v13 = a3 + v12;
    v14 = v11 + v12;
    if (v11 >= v13 || v14 <= a3)
    {
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v13;
    }
  }
  result = sub_2421AFD24();
  __break(1u);
  return result;
}

uint64_t sub_2421A0574(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v5 = a4 + 40 * a1 + 32;
    v6 = a3 + 40 * v4;
    if (v5 >= v6 || v5 + 40 * v4 <= a3)
    {
      sub_24218D500(&qword_2543A6808);
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  result = sub_2421AFD24();
  __break(1u);
  return result;
}

char *sub_2421A0690(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_2421AFD24();
    __break(1u);
  }
  else if (__dst != __src || &__src[32 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 32 * a2);
  }
  return __src;
}

char *sub_2421A0714(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_2421AFD24();
    __break(1u);
  }
  else if (__dst != __src || &__src[16 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 16 * a2);
  }
  return __src;
}

uint64_t sub_2421A0798(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t result;

  if (a2 < 0)
  {
    result = sub_2421AFD24();
    __break(1u);
  }
  else if (a3 < a1 || (result = sub_2421AF70C(), a1 + *(_QWORD *)(*(_QWORD *)(result - 8) + 72) * a2 <= a3))
  {
    sub_2421AF70C();
    return swift_arrayInitWithTakeFrontToBack();
  }
  else if (a3 != a1)
  {
    return swift_arrayInitWithTakeBackToFront();
  }
  return result;
}

char *sub_2421A0894(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    sub_2421A405C();
    __src = (char *)sub_2421AFD24();
    __break(1u);
  }
  else if (__dst != __src || &__src[40 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 40 * a2);
  }
  return __src;
}

uint64_t sub_2421A0914(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t result;

  if ((a2 & 0x8000000000000000) == 0 && (a3 + 16 * a2 <= a1 || a1 + 16 * a2 <= a3))
    return swift_arrayInitWithCopy();
  result = sub_2421AFD24();
  __break(1u);
  return result;
}

uint64_t sub_2421A09E0(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t result;

  if ((a2 & 0x8000000000000000) == 0)
  {
    v5 = *(_QWORD *)(*(_QWORD *)(sub_2421AF70C() - 8) + 72) * a2;
    v6 = a3 + v5;
    v7 = a1 + v5;
    if (v6 <= a1 || v7 <= a3)
      return swift_arrayInitWithCopy();
  }
  result = sub_2421AFD24();
  __break(1u);
  return result;
}

uint64_t sub_2421A0AD4(unint64_t a1, uint64_t a2, unint64_t a3)
{
  BOOL v3;
  uint64_t result;

  if (a2 < 0 || (a3 + 40 * a2 > a1 ? (v3 = a1 + 40 * a2 > a3) : (v3 = 0), v3))
  {
    result = sub_2421AFD24();
    __break(1u);
  }
  else
  {
    sub_24218D500(&qword_2543A67F8);
    return swift_arrayInitWithCopy();
  }
  return result;
}

void sub_2421A0BC4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[3];
  uint64_t ObjectType;

  v6 = sub_2421A0C84(v10, 0, 0, 1, a1, a2);
  if (v6)
  {
    v7 = v6;
    ObjectType = swift_getObjectType();
    v10[0] = v7;
    v8 = *a3;
    if (*a3)
    {
      sub_24218E150((uint64_t)v10, *a3);
      *a3 = v8 + 32;
    }
  }
  else
  {
    ObjectType = MEMORY[0x24BEE2520];
    v10[0] = a1;
    v10[1] = a2;
    v9 = *a3;
    if (*a3)
    {
      sub_24218E150((uint64_t)v10, *a3);
      *a3 = v9 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_24218E18C((uint64_t)v10);
  sub_2421A40D4();
}

uint64_t sub_2421A0C84(_QWORD *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
      sub_2421A0DD8((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_2421AFBF8();
      result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    result = sub_2421A0E9C(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    v8 = sub_2421AFC7C();
    if (!v8)
    {
      result = sub_2421AFCE8();
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

void *sub_2421A0DD8(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_2421AFD24();
  __break(1u);
  return result;
}

uint64_t sub_2421A0E9C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_2421A0F30(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = (uint64_t)sub_2421A1104(0, *(_QWORD *)(v2 + 16) + 1, 1, v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = (uint64_t)sub_2421A1104((char *)(v3 > 1), v4 + 1, 1, v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2421A0F30(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
  {
    v2 = sub_2421AFAE4();
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
  v3 = sub_2421A10A0(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    v4 = v3;
    v5 = sub_2421AFC64();
    if ((v6 & 1) != 0 || v5 != v2)
      goto LABEL_14;
    return (uint64_t)v4;
  }
  sub_2421AFD24();
  __break(1u);
LABEL_14:
  result = sub_2421AFCE8();
  __break(1u);
  return result;
}

_QWORD *sub_2421A10A0(uint64_t a1, uint64_t a2)
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
  sub_24218D500(&qword_2543A6B38);
  v4 = (_QWORD *)swift_allocObject();
  v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_2421A1104(char *result, int64_t a2, char a3, uint64_t a4)
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
    sub_24218D500(&qword_2543A6B38);
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
    sub_2421A129C(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_2421A11D8(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_2421A11D8(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_2421AFD24();
  __break(1u);
  return result;
}

char *sub_2421A129C(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_2421AFD24();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

uint64_t sub_2421A131C(uint64_t *a1, uint64_t a2, uint64_t a3)
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
  sub_2421AFD84();
  swift_bridgeObjectRetain();
  sub_2421AFAC0();
  v8 = sub_2421AFD9C();
  v9 = -1 << *(_BYTE *)(v7 + 32);
  v10 = v8 & ~v9;
  if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = *(_QWORD *)(v7 + 48);
    v12 = (_QWORD *)(v11 + 16 * v10);
    v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_2421AFD54() & 1) != 0)
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
      if (v19 || (sub_2421AFD54() & 1) != 0)
        goto LABEL_7;
    }
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v21 = *v3;
  *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_2421A1FDC(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_2421A14C8(uint64_t a1, char *a2)
{
  _QWORD *v2;
  _QWORD *v3;
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
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  char *v32;
  uint64_t v33;

  v3 = v2;
  v6 = *v3;
  v7 = sub_2421AF70C();
  sub_2421A3E68(&qword_2543A6A50, (uint64_t (*)(uint64_t))MEMORY[0x24BE684A0]);
  swift_bridgeObjectRetain();
  v32 = a2;
  v8 = sub_2421AFA00();
  v9 = -1 << *(_BYTE *)(v6 + 32);
  v10 = v8 & ~v9;
  v30 = v6 + 56;
  if (((*(_QWORD *)(v6 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v26 = v3;
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
      sub_2421A3E68(&qword_2543A6A58, (uint64_t (*)(uint64_t))MEMORY[0x24BE684A0]);
      v18 = sub_2421AFA0C();
      v19 = (uint64_t (*)(char *, uint64_t))v31[1];
      v8 = v19((char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), v7);
      if ((v18 & 1) != 0)
        break;
      v10 = (v10 + 1) & v28;
      v6 = v14;
      v13 = v17;
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
    sub_2421A2174((uint64_t)v23, v10, v22);
    *v3 = v33;
    swift_bridgeObjectRelease();
    ((void (*)(uint64_t, char *, uint64_t))v20[4])(a1, v24, v7);
    return 1;
  }
}

uint64_t sub_2421A1770(uint64_t a1, char *a2)
{
  _QWORD *v2;
  _QWORD *v3;
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
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  char *v32;
  uint64_t v33;

  v3 = v2;
  v6 = *v3;
  v7 = sub_2421AF88C();
  sub_2421A3E68(&qword_2543A6A98, (uint64_t (*)(uint64_t))MEMORY[0x24BE3BF78]);
  swift_bridgeObjectRetain();
  v32 = a2;
  v8 = sub_2421AFA00();
  v9 = -1 << *(_BYTE *)(v6 + 32);
  v10 = v8 & ~v9;
  v30 = v6 + 56;
  if (((*(_QWORD *)(v6 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v26 = v3;
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
      sub_2421A3E68(&qword_2543A6AA0, (uint64_t (*)(uint64_t))MEMORY[0x24BE3BF78]);
      v18 = sub_2421AFA0C();
      v19 = (uint64_t (*)(char *, uint64_t))v31[1];
      v8 = v19((char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), v7);
      if ((v18 & 1) != 0)
        break;
      v10 = (v10 + 1) & v28;
      v6 = v14;
      v13 = v17;
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
    sub_2421A23E4((uint64_t)v23, v10, v22);
    *v3 = v33;
    swift_bridgeObjectRelease();
    ((void (*)(uint64_t, char *, uint64_t))v20[4])(a1, v24, v7);
    return 1;
  }
}

uint64_t sub_2421A1A18()
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
  sub_24218D500(&qword_2571DF478);
  v3 = sub_2421AFC40();
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
      sub_2421AFD84();
      sub_2421AFAC0();
      result = sub_2421AFD9C();
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
                sub_242197930(0, (unint64_t)(v29 + 63) >> 6, v30);
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

void sub_2421A1CF0()
{
  uint64_t *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t);
  uint64_t *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t);
  unint64_t v16;
  unint64_t i;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(char *, uint64_t, uint64_t);
  uint64_t v34;
  char v35;
  uint64_t v36;
  unint64_t v37;
  char v38;
  uint64_t v39;
  uint64_t v40;
  BOOL v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  _QWORD *v45;
  uint64_t (*v46)(uint64_t);
  _QWORD *v47;
  uint64_t v48;
  uint64_t **v49;
  uint64_t v50;

  sub_242199548();
  v47 = v1;
  v48 = v2;
  v46 = v3;
  v4 = v0;
  v5 = (_QWORD *)*v0;
  sub_2421A4204(v6, v7);
  v8 = sub_2421AFC40();
  if (v5[2])
  {
    sub_2421A41D8();
    v45 = v5 + 7;
    sub_2421A430C();
    v11 = v10 & v9;
    sub_2421A4300();
    v43 = v0;
    v44 = v12;
    v13 = v8 + 56;
    swift_retain();
    v14 = 0;
    v15 = v46;
    if (!v11)
      goto LABEL_4;
LABEL_3:
    v16 = __clz(__rbit64(v11));
    v11 &= v11 - 1;
    v50 = v14;
    for (i = v16 | (v14 << 6); ; i = v24 + (v23 << 6))
    {
      v25 = v15(0);
      v49 = &v43;
      MEMORY[0x24BDAC7A8](v25);
      v27 = (char *)&v43 - v26;
      v28 = v5;
      v29 = v5[6];
      v31 = *(_QWORD *)(v30 + 72);
      v32 = v29 + v31 * i;
      v33 = *(void (**)(char *, uint64_t, uint64_t))(v30 + 32);
      v33((char *)&v43 - v26, v32, v25);
      sub_2421A3E68(v47, v15);
      sub_2421AFA00();
      sub_242199BA4();
      if (((v36 << v35) & ~*(_QWORD *)(v13 + 8 * v34)) == 0)
      {
        sub_242199B68();
        while (++v39 != v40 || (v38 & 1) == 0)
        {
          v41 = v39 == v40;
          if (v39 == v40)
            v39 = 0;
          v38 |= v41;
          if (*(_QWORD *)(v13 + 8 * v39) != -1)
          {
            sub_242199B48();
            goto LABEL_26;
          }
        }
        __break(1u);
LABEL_34:
        __break(1u);
LABEL_35:
        __break(1u);
        return;
      }
      sub_242199B90();
LABEL_26:
      *(_QWORD *)(v13 + ((v37 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v37;
      v33((char *)(*(_QWORD *)(v8 + 48) + v37 * v31), (uint64_t)v27, v25);
      ++*(_QWORD *)(v8 + 16);
      v14 = v50;
      v5 = v28;
      if (v11)
        goto LABEL_3;
LABEL_4:
      v18 = v14 + 1;
      if (__OFADD__(v14, 1))
        goto LABEL_34;
      if (v18 >= v44)
        goto LABEL_28;
      if (!v45[v18])
      {
        if (v14 + 2 >= v44)
          goto LABEL_28;
        if (!v45[v14 + 2])
        {
          if (v14 + 3 >= v44)
            goto LABEL_28;
          if (!v45[v14 + 3])
          {
            v19 = v14 + 4;
            if (v14 + 4 >= v44)
            {
LABEL_28:
              swift_release();
              v4 = v43;
              sub_2421A41D8();
              if (v42 > 63)
                sub_242197930(0, (unint64_t)(v42 + 63) >> 6, v45);
              else
                *v45 = -1 << v42;
              v5[2] = 0;
              break;
            }
            if (!v45[v19])
            {
              do
              {
                v20 = v19 + 1;
                if (__OFADD__(v19, 1))
                  goto LABEL_35;
                if (v20 >= v44)
                  goto LABEL_28;
                ++v19;
              }
              while (!v45[v20]);
            }
          }
        }
      }
      sub_2421999C0();
      v11 = v22 & v21;
      v50 = v23;
    }
  }
  swift_release();
  *v4 = v8;
  sub_242199304();
}

uint64_t sub_2421A1FDC(uint64_t result, uint64_t a2, unint64_t a3, char a4)
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
    sub_2421A1A18();
  }
  else
  {
    if (v10 > v9)
    {
      result = (uint64_t)sub_2421A2654();
      goto LABEL_22;
    }
    sub_2421A2A1C();
  }
  v11 = *v4;
  sub_2421AFD84();
  sub_2421AFAC0();
  result = sub_2421AFD9C();
  v12 = -1 << *(_BYTE *)(v11 + 32);
  a3 = result & ~v12;
  v13 = v11 + 56;
  if (((*(_QWORD *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
  {
    v14 = *(_QWORD *)(v11 + 48);
    v15 = (_QWORD *)(v14 + 16 * a3);
    v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (result = sub_2421AFD54(), (result & 1) != 0))
    {
LABEL_21:
      result = sub_2421AFD60();
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
          result = sub_2421AFD54();
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

uint64_t sub_2421A2174(uint64_t a1, unint64_t a2, char a3)
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
    sub_2421A1CF0();
  }
  else
  {
    if (v6 > v5)
    {
      sub_2421A2804();
      goto LABEL_12;
    }
    sub_2421A2CC4();
  }
  v7 = *v3;
  v8 = sub_2421AF70C();
  sub_2421A3E68(&qword_2543A6A50, (uint64_t (*)(uint64_t))MEMORY[0x24BE684A0]);
  v9 = sub_2421AFA00();
  v10 = -1 << *(_BYTE *)(v7 + 32);
  a2 = v9 & ~v10;
  v25 = v7 + 56;
  v26 = v7;
  if (((*(_QWORD *)(v7 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v11 = ~v10;
    v12 = *(_QWORD *)(v8 - 8);
    v13 = *(_QWORD *)(v12 + 64);
    v14 = *(_QWORD *)(v12 + 72);
    v15 = *(void (**)(char *, unint64_t, uint64_t))(v12 + 16);
    do
    {
      MEMORY[0x24BDAC7A8](v9);
      v15((char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), *(_QWORD *)(v26 + 48) + v14 * a2, v8);
      sub_2421A3E68(&qword_2543A6A58, (uint64_t (*)(uint64_t))MEMORY[0x24BE684A0]);
      v16 = sub_2421AFA0C();
      v9 = (*(uint64_t (**)(char *, uint64_t))(v12 + 8))((char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), v8);
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
  v19 = sub_2421AF70C();
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
  result = sub_2421AFD60();
  __break(1u);
  return result;
}

uint64_t sub_2421A23E4(uint64_t a1, unint64_t a2, char a3)
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
    sub_2421A1CF0();
  }
  else
  {
    if (v6 > v5)
    {
      sub_2421A2804();
      goto LABEL_12;
    }
    sub_2421A2CC4();
  }
  v7 = *v3;
  v8 = sub_2421AF88C();
  sub_2421A3E68(&qword_2543A6A98, (uint64_t (*)(uint64_t))MEMORY[0x24BE3BF78]);
  v9 = sub_2421AFA00();
  v10 = -1 << *(_BYTE *)(v7 + 32);
  a2 = v9 & ~v10;
  v25 = v7 + 56;
  v26 = v7;
  if (((*(_QWORD *)(v7 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v11 = ~v10;
    v12 = *(_QWORD *)(v8 - 8);
    v13 = *(_QWORD *)(v12 + 64);
    v14 = *(_QWORD *)(v12 + 72);
    v15 = *(void (**)(char *, unint64_t, uint64_t))(v12 + 16);
    do
    {
      MEMORY[0x24BDAC7A8](v9);
      v15((char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), *(_QWORD *)(v26 + 48) + v14 * a2, v8);
      sub_2421A3E68(&qword_2543A6AA0, (uint64_t (*)(uint64_t))MEMORY[0x24BE3BF78]);
      v16 = sub_2421AFA0C();
      v9 = (*(uint64_t (**)(char *, uint64_t))(v12 + 8))((char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), v8);
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
  v19 = sub_2421AF88C();
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
  result = sub_2421AFD60();
  __break(1u);
  return result;
}

void *sub_2421A2654()
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
  sub_24218D500(&qword_2571DF478);
  v2 = *v0;
  v3 = sub_2421AFC34();
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

void sub_2421A2804()
{
  uint64_t *v0;
  uint64_t (*v1)(_QWORD);
  uint64_t (*v2)(_QWORD);
  uint64_t *v3;
  _QWORD *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t i;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  const void *v30;
  uint64_t v31;

  sub_242199548();
  v2 = v1;
  sub_24218D500(v3);
  v29 = v0;
  v4 = (_QWORD *)*v0;
  v5 = sub_2421AFC34();
  if (!v4[2])
  {
LABEL_28:
    swift_release();
    *v29 = v5;
    sub_242199304();
    return;
  }
  sub_2421A41D8();
  sub_2421A4300();
  v30 = v8;
  v9 = &v8[8 * v7];
  if ((_QWORD *)v5 != v4 || v6 >= v9)
    memmove(v6, v30, 8 * v7);
  v11 = 0;
  *(_QWORD *)(v5 + 16) = v4[2];
  sub_2421A41D8();
  v13 = -1;
  if (v12 < 64)
    v13 = ~(-1 << v12);
  v14 = v13 & v4[7];
  sub_2421A4300();
  v31 = v15;
  if (!v14)
    goto LABEL_12;
LABEL_11:
  v16 = __clz(__rbit64(v14));
  v14 &= v14 - 1;
  for (i = v16 | (v11 << 6); ; i = v22 + (v11 << 6))
  {
    v23 = v2(0);
    v24 = *(_QWORD *)(v23 - 8);
    MEMORY[0x24BDAC7A8](v23);
    v26 = (char *)&v28 - v25;
    v27 = *(_QWORD *)(v24 + 72) * i;
    (*(void (**)(char *, unint64_t, uint64_t))(v24 + 16))((char *)&v28 - v25, v4[6] + v27, v23);
    (*(void (**)(unint64_t, char *, uint64_t))(v24 + 32))(*(_QWORD *)(v5 + 48) + v27, v26, v23);
    if (v14)
      goto LABEL_11;
LABEL_12:
    v18 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v18 >= v31)
      goto LABEL_28;
    ++v11;
    if (!*((_QWORD *)v30 + v18))
    {
      v11 = v18 + 1;
      if (v18 + 1 >= v31)
        goto LABEL_28;
      if (!*((_QWORD *)v30 + v11))
      {
        v11 = v18 + 2;
        if (v18 + 2 >= v31)
          goto LABEL_28;
        if (!*((_QWORD *)v30 + v11))
          break;
      }
    }
LABEL_25:
    sub_2421999C0();
    v14 = v21 & v20;
  }
  v19 = v18 + 3;
  if (v19 >= v31)
    goto LABEL_28;
  if (*((_QWORD *)v30 + v19))
  {
    v11 = v19;
    goto LABEL_25;
  }
  while (1)
  {
    v11 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v11 >= v31)
      goto LABEL_28;
    ++v19;
    if (*((_QWORD *)v30 + v11))
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
}

uint64_t sub_2421A2A1C()
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
  sub_24218D500(&qword_2571DF478);
  v3 = sub_2421AFC40();
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
    sub_2421AFD84();
    swift_bridgeObjectRetain();
    sub_2421AFAC0();
    result = sub_2421AFD9C();
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

void sub_2421A2CC4()
{
  uint64_t *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t);
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t);
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
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
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  unint64_t v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  BOOL v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t);
  _QWORD *v45;
  uint64_t v46;
  uint64_t **v47;
  uint64_t v48;

  sub_242199548();
  v45 = v1;
  v46 = v2;
  v44 = v3;
  v4 = v0;
  v5 = *v0;
  sub_2421A4204(v6, v7);
  v8 = sub_2421AFC40();
  if (*(_QWORD *)(v5 + 16))
  {
    sub_2421A41D8();
    v41 = v0;
    v42 = v5 + 56;
    sub_2421A430C();
    v11 = v10 & v9;
    sub_2421A4300();
    v43 = v12;
    v13 = v8 + 56;
    swift_retain();
    v14 = 0;
    v15 = v44;
    if (!v11)
      goto LABEL_4;
LABEL_3:
    sub_2421A4334();
    v48 = v16;
    for (i = v17 | (v16 << 6); ; i = v25 + (v24 << 6))
    {
      v26 = v15(0);
      v47 = &v41;
      v27 = *(_QWORD *)(v26 - 8);
      MEMORY[0x24BDAC7A8](v26);
      v29 = (char *)&v41 - v28;
      v30 = v5;
      v31 = *(_QWORD *)(v5 + 48);
      v32 = *(_QWORD *)(v27 + 72);
      (*(void (**)(char *, uint64_t, uint64_t))(v27 + 16))(v29, v31 + v32 * i, v26);
      sub_2421A3E68(v45, v15);
      sub_2421AFA00();
      sub_242199BA4();
      if (((v35 << v34) & ~*(_QWORD *)(v13 + 8 * v33)) == 0)
      {
        sub_242199B68();
        while (++v38 != v39 || (v37 & 1) == 0)
        {
          v40 = v38 == v39;
          if (v38 == v39)
            v38 = 0;
          v37 |= v40;
          if (*(_QWORD *)(v13 + 8 * v38) != -1)
          {
            sub_242199B48();
            goto LABEL_26;
          }
        }
        __break(1u);
LABEL_32:
        __break(1u);
        goto LABEL_33;
      }
      sub_242199B90();
LABEL_26:
      *(_QWORD *)(v13 + ((v36 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v36;
      (*(void (**)(unint64_t, char *, uint64_t))(v27 + 32))(*(_QWORD *)(v8 + 48) + v36 * v32, v29, v26);
      ++*(_QWORD *)(v8 + 16);
      v14 = v48;
      v5 = v30;
      if (v11)
        goto LABEL_3;
LABEL_4:
      v19 = v14 + 1;
      if (__OFADD__(v14, 1))
        goto LABEL_32;
      if (v19 >= v43)
        goto LABEL_28;
      if (!*(_QWORD *)(v42 + 8 * v19))
      {
        if (v14 + 2 >= v43)
          goto LABEL_28;
        if (!*(_QWORD *)(v42 + 8 * (v14 + 2)))
        {
          if (v14 + 3 >= v43)
            goto LABEL_28;
          if (!*(_QWORD *)(v42 + 8 * (v14 + 3)))
          {
            v20 = v14 + 4;
            if (v14 + 4 >= v43)
            {
LABEL_28:
              swift_release_n();
              v4 = v41;
              goto LABEL_30;
            }
            if (!*(_QWORD *)(v42 + 8 * v20))
              break;
          }
        }
      }
LABEL_16:
      sub_2421999C0();
      v11 = v23 & v22;
      v48 = v24;
    }
    while (1)
    {
      v21 = v20 + 1;
      if (__OFADD__(v20, 1))
        break;
      if (v21 >= v43)
        goto LABEL_28;
      ++v20;
      if (*(_QWORD *)(v42 + 8 * v21))
        goto LABEL_16;
    }
LABEL_33:
    __break(1u);
  }
  else
  {
    swift_release();
LABEL_30:
    *v4 = v8;
    sub_242199304();
  }
}

char *sub_2421A2F74(char *a1, int64_t a2, char a3)
{
  uint64_t *v3;
  char *result;

  result = sub_2421A3008(a1, a2, a3, *v3);
  *v3 = (uint64_t)result;
  return result;
}

size_t sub_2421A2F90(size_t a1, int64_t a2, char a3)
{
  uint64_t *v3;
  size_t result;

  result = sub_2421A30E8(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

char *sub_2421A2FAC(char *a1, int64_t a2, char a3)
{
  uint64_t *v3;
  char *result;

  result = sub_2421A3228(a1, a2, a3, *v3);
  *v3 = (uint64_t)result;
  return result;
}

void sub_2421A2FC8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v2;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v2 - 8))(a2, a1);
  sub_242199A90();
}

char *sub_2421A3008(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
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
    sub_24218D500(&qword_2543A6940);
    v10 = (char *)swift_allocObject();
    v11 = j__malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_2421A0714(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_2421A0914((unint64_t)v13, v8, (unint64_t)v12);
  }
  swift_release();
  return v10;
}

size_t sub_2421A30E8(size_t result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;

  v5 = result;
  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_25:
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
  if (!v9)
  {
    v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  sub_24218D500(&qword_2543A6B20);
  v10 = *(_QWORD *)(sub_2421AF70C() - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  result = j__malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1)
    goto LABEL_24;
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  v15 = *(unsigned __int8 *)(*(_QWORD *)(sub_2421AF70C() - 8) + 80);
  v16 = (v15 + 32) & ~v15;
  v17 = (unint64_t)v13 + v16;
  v18 = a4 + v16;
  if ((v5 & 1) != 0)
  {
    sub_2421A0798(v18, v8, v17);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_2421A09E0(v18, v8, v17);
  }
  swift_release();
  return (size_t)v13;
}

char *sub_2421A3228(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
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
    sub_24218D500(&qword_2543A6B18);
    v10 = (char *)swift_allocObject();
    v11 = j__malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_2421A0894(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_2421A0AD4((unint64_t)v13, v8, (unint64_t)v12);
  }
  swift_release();
  return v10;
}

uint64_t sub_2421A3310(uint64_t isStackAllocationSafe, uint64_t a2)
{
  uint64_t v3;
  char v4;
  unint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD v12[2];

  v3 = isStackAllocationSafe;
  v12[1] = *MEMORY[0x24BDAC8D0];
  v4 = *(_BYTE *)(a2 + 32);
  v5 = (unint64_t)((1 << v4) + 63) >> 6;
  if ((v4 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x24BDAC7A8](isStackAllocationSafe);
    v6 = (_QWORD *)((char *)v12 - ((8 * v5 + 15) & 0x3FFFFFFFFFFFFFF0));
    sub_242197930(0, v5, v6);
    sub_2421A355C((uint64_t)v6, v5, a2, v3);
    v8 = v7;
    swift_release();
  }
  else
  {
    v9 = (_QWORD *)swift_slowAlloc();
    sub_242197930(0, v5, v9);
    sub_2421A355C((uint64_t)v9, v5, a2, v3);
    v8 = v10;
    swift_release();
    MEMORY[0x2426A51D4](v9, -1, -1);
  }
  return v8;
}

unint64_t sub_2421A349C()
{
  unint64_t result;

  result = qword_2571DF440;
  if (!qword_2571DF440)
  {
    result = MEMORY[0x2426A5144](MEMORY[0x24BEE45A0], MEMORY[0x24BEE4568]);
    atomic_store(result, (unint64_t *)&qword_2571DF440);
  }
  return result;
}

unint64_t sub_2421A34D8()
{
  unint64_t result;

  result = qword_2571DF450;
  if (!qword_2571DF450)
  {
    result = MEMORY[0x2426A5144](MEMORY[0x24BEE4040], MEMORY[0x24BEE4008]);
    atomic_store(result, (unint64_t *)&qword_2571DF450);
  }
  return result;
}

uint64_t sub_2421A3514(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_24218D500(&qword_2543A67E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_2421A355C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  int64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t i;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  char v34;
  uint64_t (*v35)(char *, uint64_t);
  int64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  int64_t v42;
  unint64_t v43;
  int64_t v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD *v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  char *v56;
  char v57;
  uint64_t (*v58)(char *, uint64_t);
  BOOL v59;
  _QWORD v60[3];
  uint64_t v61;
  int64_t v62;
  uint64_t v63;
  unint64_t v64;
  uint64_t v65;
  _QWORD *v66;
  uint64_t v67;
  int64_t v68;
  uint64_t v69;
  uint64_t (*v70)(unint64_t, unint64_t, uint64_t);
  uint64_t v71;
  unint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;

  v4 = a4;
  v5 = a3;
  v63 = a1;
  v6 = *(_QWORD *)(a3 + 16);
  v7 = *(_QWORD *)(a4 + 16);
  v75 = a3;
  v74 = a4;
  v60[2] = a2;
  if (v7 < v6)
  {
    v8 = *(_QWORD *)(a4 + 56);
    v61 = a4 + 56;
    v9 = 1 << *(_BYTE *)(a4 + 32);
    if (v9 < 64)
      v10 = ~(-1 << v9);
    else
      v10 = -1;
    v11 = v10 & v8;
    v12 = sub_2421AF88C();
    v60[1] = v60;
    v13 = *(_QWORD *)(v12 - 8);
    MEMORY[0x24BDAC7A8](v12);
    v72 = v13;
    v73 = v14;
    v64 = (unint64_t)v60 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
    v65 = 0;
    v15 = 0;
    v62 = (unint64_t)(v9 + 63) >> 6;
    v69 = v5 + 56;
    if (!v11)
      goto LABEL_7;
LABEL_6:
    v16 = __clz(__rbit64(v11));
    v17 = (v11 - 1) & v11;
    v68 = v15;
    for (i = v16 | (v15 << 6); ; i = __clz(__rbit64(v20)) + (v21 << 6))
    {
      v67 = v17;
      v23 = *(_QWORD *)(v13 + 72);
      v24 = *(_QWORD *)(v4 + 48) + v23 * i;
      v25 = v64;
      v70 = *(uint64_t (**)(unint64_t, unint64_t, uint64_t))(v13 + 16);
      v71 = v23;
      v26 = v70(v64, v24, v12);
      v66 = v60;
      MEMORY[0x24BDAC7A8](v26);
      v28 = (v27 + 15) & 0xFFFFFFFFFFFFFFF0;
      (*(void (**)(char *, unint64_t, uint64_t))(v13 + 32))((char *)v60 - v28, v25, v12);
      sub_2421A3E68(&qword_2543A6A98, (uint64_t (*)(uint64_t))MEMORY[0x24BE3BF78]);
      v29 = sub_2421AFA00();
      v30 = v75;
      v31 = -1 << *(_BYTE *)(v75 + 32);
      v32 = v29 & ~v31;
      if (((*(_QWORD *)(v69 + ((v32 >> 3) & 0xFFFFFFFFFFFFF8)) >> v32) & 1) != 0)
      {
        v33 = ~v31;
        while (1)
        {
          MEMORY[0x24BDAC7A8](v29);
          v70((unint64_t)v60 - v28, *(_QWORD *)(v30 + 48) + v32 * v71, v12);
          sub_2421A3E68(&qword_2543A6AA0, (uint64_t (*)(uint64_t))MEMORY[0x24BE3BF78]);
          v34 = sub_2421AFA0C();
          v35 = *(uint64_t (**)(char *, uint64_t))(v72 + 8);
          v29 = v35((char *)v60 - v28, v12);
          if ((v34 & 1) != 0)
            break;
          v32 = (v32 + 1) & v33;
          v30 = v75;
          if (((*(_QWORD *)(v69 + ((v32 >> 3) & 0xFFFFFFFFFFFFF8)) >> v32) & 1) == 0)
            goto LABEL_27;
        }
        v35((char *)v60 - v28, v12);
        *(_QWORD *)(v63 + ((v32 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v32;
        if (__OFADD__(v65, 1))
          goto LABEL_65;
        ++v65;
      }
      else
      {
        v35 = *(uint64_t (**)(char *, uint64_t))(v13 + 8);
LABEL_27:
        v35((char *)v60 - v28, v12);
      }
      v4 = v74;
      v13 = v72;
      v11 = v67;
      v15 = v68;
      if (v67)
        goto LABEL_6;
LABEL_7:
      v19 = v15 + 1;
      if (__OFADD__(v15, 1))
      {
        __break(1u);
        goto LABEL_64;
      }
      if (v19 >= v62)
        goto LABEL_62;
      v20 = *(_QWORD *)(v61 + 8 * v19);
      v21 = v15 + 1;
      if (!v20)
      {
        v21 = v15 + 2;
        if (v15 + 2 >= v62)
          goto LABEL_62;
        v20 = *(_QWORD *)(v61 + 8 * v21);
        if (!v20)
        {
          v21 = v15 + 3;
          if (v15 + 3 >= v62)
            goto LABEL_62;
          v20 = *(_QWORD *)(v61 + 8 * v21);
          if (!v20)
          {
            v22 = v15 + 4;
            if (v15 + 4 >= v62)
              goto LABEL_62;
            v20 = *(_QWORD *)(v61 + 8 * v22);
            if (!v20)
            {
              while (1)
              {
                v21 = v22 + 1;
                if (__OFADD__(v22, 1))
                  goto LABEL_66;
                if (v21 >= v62)
                  goto LABEL_62;
                v20 = *(_QWORD *)(v61 + 8 * v21);
                ++v22;
                if (v20)
                  goto LABEL_20;
              }
            }
            v21 = v15 + 4;
          }
        }
      }
LABEL_20:
      v17 = (v20 - 1) & v20;
      v68 = v21;
    }
  }
  v65 = 0;
  v36 = 0;
  v37 = *(_QWORD *)(a3 + 56);
  v61 = a3 + 56;
  v38 = 1 << *(_BYTE *)(a3 + 32);
  if (v38 < 64)
    v39 = ~(-1 << v38);
  else
    v39 = -1;
  v40 = v39 & v37;
  v62 = (unint64_t)(v38 + 63) >> 6;
  v69 = a4 + 56;
  while (v40)
  {
    v67 = (v40 - 1) & v40;
    v68 = v36;
    v41 = __clz(__rbit64(v40)) | (v36 << 6);
LABEL_52:
    v46 = sub_2421AF88C();
    v66 = v60;
    v47 = *(_QWORD **)(v46 - 8);
    MEMORY[0x24BDAC7A8](v46);
    v72 = (v48 + 15) & 0xFFFFFFFFFFFFFFF0;
    v73 = v48;
    v49 = (char *)v60 - v72;
    v50 = v47[9];
    v51 = *(_QWORD *)(v5 + 48) + v50 * v41;
    v70 = (uint64_t (*)(unint64_t, unint64_t, uint64_t))v47[2];
    v71 = v50;
    v70((unint64_t)v60 - v72, v51, v46);
    sub_2421A3E68(&qword_2543A6A98, (uint64_t (*)(uint64_t))MEMORY[0x24BE3BF78]);
    v52 = sub_2421AFA00();
    v53 = -1 << *(_BYTE *)(v4 + 32);
    v54 = v52 & ~v53;
    if (((*(_QWORD *)(v69 + ((v54 >> 3) & 0xFFFFFFFFFFFFF8)) >> v54) & 1) != 0)
    {
      v64 = v41;
      v55 = ~v53;
      while (1)
      {
        MEMORY[0x24BDAC7A8](v52);
        v56 = (char *)v60 - v72;
        v70((unint64_t)v60 - v72, *(_QWORD *)(v74 + 48) + v54 * v71, v46);
        sub_2421A3E68(&qword_2543A6AA0, (uint64_t (*)(uint64_t))MEMORY[0x24BE3BF78]);
        v57 = sub_2421AFA0C();
        v58 = (uint64_t (*)(char *, uint64_t))v47[1];
        v52 = v58(v56, v46);
        if ((v57 & 1) != 0)
          break;
        v54 = (v54 + 1) & v55;
        if (((*(_QWORD *)(v69 + ((v54 >> 3) & 0xFFFFFFFFFFFFF8)) >> v54) & 1) == 0)
          goto LABEL_58;
      }
      v58(v49, v46);
      *(_QWORD *)(v63 + ((v64 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v64;
      v59 = __OFADD__(v65++, 1);
      v5 = v75;
      v4 = v74;
      v40 = v67;
      v36 = v68;
      if (v59)
      {
        __break(1u);
LABEL_62:
        swift_retain();
        sub_242197FB0();
        return;
      }
    }
    else
    {
      v58 = (uint64_t (*)(char *, uint64_t))v47[1];
LABEL_58:
      v58(v49, v46);
      v40 = v67;
      v5 = v75;
      v4 = v74;
      v36 = v68;
    }
  }
  v42 = v36 + 1;
  if (__OFADD__(v36, 1))
  {
LABEL_64:
    __break(1u);
LABEL_65:
    __break(1u);
LABEL_66:
    __break(1u);
    goto LABEL_67;
  }
  if (v42 >= v62)
    goto LABEL_62;
  v43 = *(_QWORD *)(v61 + 8 * v42);
  v44 = v36 + 1;
  if (v43)
    goto LABEL_51;
  v44 = v36 + 2;
  if (v36 + 2 >= v62)
    goto LABEL_62;
  v43 = *(_QWORD *)(v61 + 8 * v44);
  if (v43)
    goto LABEL_51;
  v44 = v36 + 3;
  if (v36 + 3 >= v62)
    goto LABEL_62;
  v43 = *(_QWORD *)(v61 + 8 * v44);
  if (v43)
  {
LABEL_51:
    v67 = (v43 - 1) & v43;
    v68 = v44;
    v41 = __clz(__rbit64(v43)) + (v44 << 6);
    goto LABEL_52;
  }
  v45 = v36 + 4;
  if (v36 + 4 >= v62)
    goto LABEL_62;
  v43 = *(_QWORD *)(v61 + 8 * v45);
  if (v43)
  {
    v44 = v36 + 4;
    goto LABEL_51;
  }
  while (1)
  {
    v44 = v45 + 1;
    if (__OFADD__(v45, 1))
      break;
    if (v44 >= v62)
      goto LABEL_62;
    v43 = *(_QWORD *)(v61 + 8 * v44);
    ++v45;
    if (v43)
      goto LABEL_51;
  }
LABEL_67:
  __break(1u);
}

id sub_2421A3C88(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v5 = (void *)sub_2421AFAF0();
  swift_bridgeObjectRelease();
  v6 = objc_msgSend(a3, sel_clearPendingFollowUpItemsWithUniqueIdentifiers_error_, v5, a2);

  return v6;
}

void sub_2421A3CF4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = (id)sub_2421AFA6C();
  objc_msgSend(a3, sel_setUniqueIdentifier_, v4);

}

void sub_2421A3D38(uint64_t a1, void *a2)
{
  id v3;

  sub_242197C30(0, &qword_2571DF458);
  v3 = (id)sub_2421AFAF0();
  swift_bridgeObjectRelease();
  objc_msgSend(a2, sel_setActions_, v3);

}

void sub_2421A3DA8(uint64_t a1, void *a2)
{
  id v3;

  v3 = (id)sub_2421AF9DC();
  swift_bridgeObjectRelease();
  objc_msgSend(a2, sel_setUserInfo_, v3);

}

void sub_2421A3E14(uint64_t a1, uint64_t a2, void *a3, SEL *a4)
{
  id v6;

  v6 = (id)sub_2421AFA6C();
  sub_2421A4070();
  objc_msgSend(a3, *a4, v6);

}

void sub_2421A3E68(_QWORD *a1, uint64_t (*a2)(uint64_t))
{
  if (!*a1)
  {
    sub_2421A4244(0, a2);
    sub_2421A4288();
  }
  sub_242199A90();
}

uint64_t sub_2421A3E94(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(a1, sel_uniqueIdentifier);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = sub_2421AFA90();

  return v3;
}

uint64_t type metadata accessor for FollowUpManager()
{
  return objc_opt_self();
}

uint64_t method lookup function for FollowUpManager()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of static FollowUpManager.checkAndNotifyForOutOfStorageStatus()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of static FollowUpManager.postOutOfStorageFollowUp(remainingSpaceRequired:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of static FollowUpManager.clearPendingOutOfStorageFollowUpItems()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of static FollowUpManager.pendingOutOfStorageFollowUpItems()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t sub_2421A3F70()
{
  return sub_2421AF928();
}

BOOL sub_2421A3F7C(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t sub_2421A3F8C()
{
  return sub_2421AFA9C();
}

void sub_2421A3FB0(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;

  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

uint64_t sub_2421A3FC4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 256) = a1;
  return 0;
}

BOOL sub_2421A3FD4(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

void sub_2421A3FE4(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  uint8_t *v5;
  os_log_type_t v6;

  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

uint64_t sub_2421A3FF8(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 248) = a1;
  return sub_2421AFBEC();
}

void sub_2421A4030(void *a1, NSObject *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
  _os_log_impl(a1, a2, a3, a4, a5, 0xCu);
}

uint64_t sub_2421A4038()
{
  return sub_2421AFBEC();
}

uint64_t sub_2421A4070()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_2421A4078()
{
  return swift_beginAccess();
}

id sub_2421A4084()
{
  void *v0;
  uint64_t v1;

  return objc_msgSend(v0, (SEL)(v1 + 1096));
}

uint64_t sub_2421A4090()
{
  return sub_2421AFA0C();
}

void sub_2421A40B0(uint64_t a1@<X8>)
{

}

uint64_t sub_2421A40E8@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

uint64_t sub_2421A40F4()
{
  return sub_2421AFD54();
}

uint64_t sub_2421A4104()
{
  uint64_t v0;

  return *(_QWORD *)(v0 - 264);
}

uint64_t sub_2421A411C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
}

uint64_t sub_2421A4154(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(a1, v2);
}

uint64_t sub_2421A415C()
{
  return 0;
}

uint64_t sub_2421A4194()
{
  return _swift_stdlib_bridgeErrorToNSError();
}

uint64_t sub_2421A419C(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(a1, v1);
}

_WORD *sub_2421A41B4(_WORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_2421A4204(uint64_t a1, uint64_t *a2)
{
  return sub_24218D500(a2);
}

void sub_2421A4214(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  sub_242199198(*(_QWORD *)(v2 - 336), a2);
}

uint64_t sub_2421A422C()
{
  return sub_2421AFA30();
}

uint64_t sub_2421A4238()
{
  return sub_2421AFBEC();
}

uint64_t sub_2421A4244(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  return a2(255);
}

uint64_t sub_2421A4250(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_24218D5C8(a1, a2, 1, v2);
}

void sub_2421A425C(char a1, uint64_t a2)
{
  uint64_t v2;

  sub_2421A0284(a1, a2, 1, v2);
}

uint64_t sub_2421A4268()
{
  uint64_t v0;

  return v0 - 128;
}

uint64_t sub_2421A427C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 - 328))();
}

void sub_2421A4288()
{
  JUMPOUT(0x2426A5144);
}

void sub_2421A4294(void *a1, NSObject *a2, os_log_type_t a3, const char *a4)
{
  uint8_t *v4;

  _os_log_impl(a1, a2, a3, a4, v4, 0xCu);
}

uint64_t sub_2421A42A0(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t, uint64_t);
  uint64_t v3;

  return v2(a1, v3, v1);
}

uint64_t sub_2421A42AC@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t sub_2421A42B4()
{
  return sub_2421AF3F4();
}

__n128 sub_2421A42C0@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  *(_QWORD *)(a2 - 256) = a1;
  *(_QWORD *)(v2 - 128) = a1;
  return *(__n128 *)(v2 - 368);
}

uint64_t sub_2421A42D4@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)(a2 - 256) = result;
  return result;
}

uint64_t sub_2421A42E0()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t sub_2421A42EC()
{
  return sub_2421AF4CC();
}

uint64_t sub_2421A42F4@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

id sub_2421A4320(uint64_t a1, const char *a2)
{
  uint64_t v2;
  void *v3;

  return objc_msgSend(v3, a2, v2);
}

uint64_t sub_2421A432C()
{
  return sub_2421AFB80();
}

uint64_t sub_2421A4368()
{
  return swift_willThrow();
}

uint64_t ExitReason.description.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_2421A43A8 + 4 * byte_2421B0880[*v0]))(0xD000000000000020, 0x80000002421B1E70);
}

uint64_t sub_2421A43A8()
{
  return 0x73736563637573;
}

uint64_t sub_2421A43C0@<X0>(uint64_t a1@<X8>)
{
  return a1 + 4;
}

ModelCatalogRuntime::ExitReason_optional __swiftcall ExitReason.init(rawValue:)(Swift::Int32 rawValue)
{
  char *v1;
  char v2;

  if (rawValue >= 6)
    v2 = 6;
  else
    v2 = rawValue;
  *v1 = v2;
  return (ModelCatalogRuntime::ExitReason_optional)rawValue;
}

uint64_t ExitReason.rawValue.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

BOOL sub_2421A4430(char *a1, char *a2)
{
  return sub_24218D08C(*a1, *a2);
}

uint64_t sub_2421A443C()
{
  return sub_2421A4444();
}

uint64_t sub_2421A4444()
{
  sub_2421AFD84();
  sub_2421AFD90();
  return sub_2421AFD9C();
}

uint64_t sub_2421A4488()
{
  return sub_2421A4490();
}

uint64_t sub_2421A4490()
{
  return sub_2421AFD90();
}

uint64_t sub_2421A44B4()
{
  return sub_2421A44BC();
}

uint64_t sub_2421A44BC()
{
  sub_2421AFD84();
  sub_2421AFD90();
  return sub_2421AFD9C();
}

ModelCatalogRuntime::ExitReason_optional sub_2421A44FC(Swift::Int32 *a1)
{
  return ExitReason.init(rawValue:)(*a1);
}

uint64_t sub_2421A4504@<X0>(_DWORD *a1@<X8>)
{
  uint64_t result;

  result = ExitReason.rawValue.getter();
  *a1 = result;
  return result;
}

void static Exit.exit(_:)(unsigned __int8 *a1)
{
  _exit(*a1);
}

unint64_t sub_2421A4540()
{
  unint64_t result;

  result = qword_2571DF480;
  if (!qword_2571DF480)
  {
    result = MEMORY[0x2426A5144](&protocol conformance descriptor for ExitReason, &type metadata for ExitReason);
    atomic_store(result, (unint64_t *)&qword_2571DF480);
  }
  return result;
}

_BYTE *initializeBufferWithCopyOfBuffer for ExitReason(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ExitReason(unsigned __int8 *a1, unsigned int a2)
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
  if (a2 >= 0xFB)
  {
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
    v5 = (*a1 | (v4 << 8)) - 6;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 6;
  v5 = v6 - 6;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for ExitReason(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2421A4660 + 4 * byte_2421B088B[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_2421A4694 + 4 * byte_2421B0886[v4]))();
}

uint64_t sub_2421A4694(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2421A469C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2421A46A4);
  return result;
}

uint64_t sub_2421A46B0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2421A46B8);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_2421A46BC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2421A46C4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2421A46D0(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_2421A46DC(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ExitReason()
{
  return &type metadata for ExitReason;
}

ValueMetadata *type metadata accessor for Exit()
{
  return &type metadata for Exit;
}

void static Daemon.main()(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v3 = v2;
  v14 = a2;
  v6 = sub_2421AFBA4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_2421AFBB0();
  MEMORY[0x24BDAC7A8](v10);
  static Daemon.enterSandbox()(a1, a2);
  sub_2421A4888();
  v15 = MEMORY[0x24BEE4AF8];
  sub_2421A48C4();
  sub_24218D500(&qword_2543A68D0);
  sub_2421A4904();
  sub_2421AFC1C();
  (*(void (**)(char *, _QWORD, uint64_t))(v7 + 104))(v9, *MEMORY[0x24BEE5758], v6);
  v11 = sub_2421AFBBC();
  dispatch_activate(v11);
  v12 = (void *)MEMORY[0x2426A4DC0]();
  sub_2421A498C(v11, v3, a1, v14);
  objc_autoreleasePoolPop(v12);

  dispatch_main();
}

unint64_t sub_2421A4888()
{
  unint64_t result;

  result = qword_2543A66E8;
  if (!qword_2543A66E8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2543A66E8);
  }
  return result;
}

unint64_t sub_2421A48C4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2543A68E8;
  if (!qword_2543A68E8)
  {
    v1 = sub_2421AFBB0();
    result = MEMORY[0x2426A5144](MEMORY[0x24BEE5900], v1);
    atomic_store(result, (unint64_t *)&qword_2543A68E8);
  }
  return result;
}

unint64_t sub_2421A4904()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2543A68D8;
  if (!qword_2543A68D8)
  {
    v1 = sub_2421A4948(&qword_2543A68D0);
    result = MEMORY[0x2426A5144](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_2543A68D8);
  }
  return result;
}

uint64_t sub_2421A4948(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2426A5138](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_2421A498C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t result;
  _QWORD v13[6];

  v8 = (_QWORD *)swift_allocObject();
  v8[2] = a3;
  v8[3] = a4;
  v8[4] = a2;
  v8[5] = a1;
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = sub_2421A4C08;
  *(_QWORD *)(v9 + 24) = v8;
  v13[4] = sub_2421A4C24;
  v13[5] = v9;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 1107296256;
  v13[2] = sub_2421A4C44;
  v13[3] = &unk_251332488;
  v10 = _Block_copy(v13);
  v11 = a1;
  swift_retain();
  swift_release();
  dispatch_async_and_wait(v11, v10);
  _Block_release(v10);
  LOBYTE(v10) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  result = swift_release();
  if ((v10 & 1) != 0)
    __break(1u);
  return result;
}

uint64_t dispatch thunk of static Daemon.iOSSandboxProfileName.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of static Daemon.macOSSandboxProfileName.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of static Daemon.start(using:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t sub_2421A4AE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;

  if (qword_2543A66F0 != -1)
    swift_once();
  v7 = sub_2421AF940();
  sub_24218E28C(v7, (uint64_t)qword_2543A6B60);
  v8 = sub_2421AF928();
  v9 = sub_2421AFB98();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_24218A000, v8, v9, "Starting modelcatalogd", v10, 2u);
    MEMORY[0x2426A51D4](v10, -1, -1);
  }

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a4 + 24))(a2, a3, a4);
}

uint64_t sub_2421A4BE4()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_2421A4C08()
{
  uint64_t *v0;

  return sub_2421A4AE0(v0[4], v0[5], v0[2], v0[3]);
}

uint64_t sub_2421A4C14()
{
  return swift_deallocObject();
}

uint64_t sub_2421A4C24()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_2421A4C44(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t sub_2421A4C64(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_2421A4C74()
{
  return swift_release();
}

uint64_t static Daemon.enterSandbox()(uint64_t a1, uint64_t a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  (*(void (**)(void))(a2 + 8))();
  sub_2421AFAB4();
  swift_bridgeObjectRelease();
  v2 = _set_user_dir_suffix();
  swift_release();
  if (!v2)
    _exit(5);
  static Daemon.confstr(_:)();
  if (!v3
    || (String.realpath.getter(), v5 = v4, swift_bridgeObjectRelease(), result = swift_bridgeObjectRelease(), !v5))
  {
    _exit(3);
  }
  return result;
}

uint64_t static Daemon.confstr(_:)()
{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;

  sub_2421AF3AC();
  swift_allocObject();
  v0 = sub_2421AF388();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    if (sub_2421AF37C())
    {
      result = sub_2421AF3A0();
      if (__OFSUB__(0, result))
        goto LABEL_12;
    }
    swift_allocObject();
    v2 = sub_2421AF370();
    swift_release();
    v0 = v2;
  }
  result = sub_2421AF37C();
  if (!result)
  {
LABEL_13:
    __break(1u);
    return result;
  }
  v3 = result;
  result = sub_2421AF3A0();
  v4 = -result;
  if (__OFSUB__(0, result))
  {
    __break(1u);
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  v5 = sub_2421AF394();
  if (v5 >= 1024)
    v6 = 1024;
  else
    v6 = v5;
  bzero((void *)(v3 + v4), v6);
  v9 = 0x40000000000;
  v10 = v0 | 0x4000000000000000;
  sub_2421A4F2C((uint64_t)&v9);
  v8 = v7;
  sub_2421A51BC(v9, v10);
  return v8;
}

uint64_t sub_2421A4E54@<X0>(char *a1@<X0>, int a2@<W2>, _QWORD *a3@<X8>)
{
  uint64_t result;
  uint64_t v6;

  result = confstr(a2, a1, 0x400uLL);
  if (result >= 1 && a1)
  {
    result = sub_2421AFAD8();
    *a3 = result;
    a3[1] = v6;
  }
  else
  {
    *a3 = 0;
    a3[1] = 0;
  }
  return result;
}

uint64_t String.realpath.getter()
{
  uint64_t v0;
  char *v1;
  uint64_t v2;

  v0 = sub_2421AFAB4();
  v1 = realpath_DARWIN_EXTSN((const char *)(v0 + 32), 0);
  swift_release();
  if (!v1)
    return 0;
  v2 = sub_2421AFAD8();
  MEMORY[0x2426A51D4](v1, -1, -1);
  return v2;
}

void sub_2421A4F2C(uint64_t a1)
{
  __asm { BR              X11 }
}

uint64_t sub_2421A4F88@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  int v2;
  uint64_t v3;
  uint64_t result;
  unint64_t v5;
  uint64_t v6;
  unsigned int v7;
  unsigned __int8 v8;
  unsigned __int8 v9;
  unsigned __int8 v10;

  v6 = v3;
  LOWORD(v7) = a1;
  BYTE2(v7) = BYTE2(a1);
  HIBYTE(v7) = BYTE3(a1);
  v8 = BYTE4(a1);
  v9 = BYTE5(a1);
  v10 = BYTE6(a1);
  result = sub_2421A52A8((char *)&v6, BYTE6(a1), v2);
  v5 = v7 | ((unint64_t)v8 << 32) | ((unint64_t)v9 << 40) | ((unint64_t)v10 << 48);
  *v1 = v6;
  v1[1] = v5;
  return result;
}

uint64_t sub_2421A51BC(uint64_t a1, unint64_t a2)
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

uint64_t sub_2421A5200(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v4;
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  result = sub_2421AF37C();
  if (!result)
    goto LABEL_9;
  v9 = result;
  result = sub_2421AF3A0();
  v10 = a1 - result;
  if (__OFSUB__(a1, result))
  {
    __break(1u);
    goto LABEL_8;
  }
  if (__OFSUB__(a2, a1))
  {
LABEL_8:
    __break(1u);
LABEL_9:
    __break(1u);
    return result;
  }
  sub_2421AF394();
  result = sub_2421A4E54((char *)(v9 + v10), a4, &v11);
  if (!v4)
    return v11;
  return result;
}

uint64_t sub_2421A52A8(char *a1, uint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t result;
  uint64_t v5;

  result = sub_2421A4E54(a1, a3, &v5);
  if (!v3)
    return v5;
  return result;
}

id sub_2421A52D8()
{
  objc_class *v0;
  id v1;

  v1 = objc_allocWithZone(v0);
  return sub_2421A5318();
}

id sub_2421A5318()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_class *ObjectType;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  uint64_t v24;
  unint64_t v25;
  objc_super v27;
  id v28[12];
  uint64_t v29;
  uint64_t v30;

  sub_242199548();
  v29 = v2;
  v30 = v3;
  v5 = v4;
  v7 = v6;
  v28[1] = *(id *)MEMORY[0x24BDAC8D0];
  ObjectType = (objc_class *)swift_getObjectType();
  v9 = sub_2421997A8();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  sub_242199988();
  v11 = &v0[OBJC_IVAR____TtCC19ModelCatalogRuntime20CatalogServiceServer6Server_clientApplicationIdentifier];
  *(_QWORD *)v11 = v7;
  *((_QWORD *)v11 + 1) = v5;
  v12 = v0;
  sub_2421AF844();
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 32))(&v12[OBJC_IVAR____TtCC19ModelCatalogRuntime20CatalogServiceServer6Server_sideloadURL], v1, v9);
  v13 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  v14 = (void *)sub_2421AF40C();

  v28[0] = 0;
  LODWORD(v9) = objc_msgSend(v13, sel_createDirectoryAtURL_withIntermediateDirectories_attributes_error_, v14, 1, 0, v28);

  if ((_DWORD)v9)
  {
    v15 = v28[0];
  }
  else
  {
    v16 = v28[0];
    v17 = (void *)sub_2421AF3F4();

    swift_willThrow();
    if (qword_2543A66F0 != -1)
      swift_once();
    v18 = sub_242199940();
    sub_24218E28C(v18, (uint64_t)qword_2543A6B60);
    v19 = v17;
    v20 = v17;
    v21 = sub_2421AF928();
    v22 = sub_2421AFB80();
    if (sub_2421AF264(v21))
    {
      v23 = (uint8_t *)sub_24218D61C();
      v28[0] = (id)sub_24218D61C();
      *(_DWORD *)v23 = 136315138;
      swift_getErrorValue();
      v24 = sub_2421AFD78();
      sub_2421A0BC4(v24, v25, (uint64_t *)v28);
      sub_2421AEF78();
      sub_24219947C();
      sub_2421AEED4();
      sub_2421AEED4();
      sub_2421A4030(&dword_24218A000, v21, v22, "Failed to create sideload directory: %s", v23);
      sub_24219BC64();
      sub_24218D600();
    }
    sub_2421AEED4();
    sub_2421AEED4();
    sub_2421AEED4();

  }
  v27.receiver = v12;
  v27.super_class = ObjectType;
  return objc_msgSendSuper2(&v27, sel_init);
}

void sub_2421A55E0(uint64_t a1, unint64_t a2, uint64_t a3, void (**a4)(_QWORD, _QWORD, _QWORD))
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v7 = sub_24218D500(&qword_2543A67F0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  _Block_copy(a4);
  if (qword_2543A66F0 != -1)
    swift_once();
  v10 = sub_2421AF940();
  sub_24218E28C(v10, (uint64_t)qword_2543A6B60);
  swift_bridgeObjectRetain_n();
  v11 = sub_2421AF928();
  v12 = sub_2421AFB74();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc();
    v14 = swift_slowAlloc();
    v33 = v14;
    *(_DWORD *)v13 = 136315138;
    swift_bridgeObjectRetain();
    sub_2421A0BC4(a1, a2, &v33);
    v32 = v15;
    sub_2421AFBEC();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_24218A000, v11, v12, "Attempting requestResources for key: %s", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2426A51D4](v14, -1, -1);
    MEMORY[0x2426A51D4](v13, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v16 = sub_2421AF784();
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)&v32 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = sub_24218D500(&qword_2543A6970);
  MEMORY[0x24BDAC7A8](v20);
  v22 = (char *)&v32 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  sub_2421AF76C();
  if (sub_24218E0BC((uint64_t)v22, 1, v16) == 1)
  {
    sub_242199198((uint64_t)v22, &qword_2543A6970);
    v23 = sub_2421AF598();
    v24 = (uint64_t (*)(uint64_t))MEMORY[0x24BE682E0];
    v25 = *(_QWORD *)(v23 - 8);
    MEMORY[0x24BDAC7A8](v23);
    v27 = (uint64_t *)((char *)&v32 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0));
    *v27 = a1;
    v27[1] = a2;
    (*(void (**)(uint64_t *, _QWORD, uint64_t))(v25 + 104))(v27, *MEMORY[0x24BE682D0], v23);
    sub_242199250(&qword_2571DF328, v24, MEMORY[0x24BE682E8]);
    v28 = (void *)swift_allocError();
    (*(void (**)(uint64_t, uint64_t *, uint64_t))(v25 + 16))(v29, v27, v23);
    swift_bridgeObjectRetain();
    v30 = (void *)sub_2421AF3E8();
    ((void (**)(_QWORD, _QWORD, void *))a4)[2](a4, 0, v30);

    (*(void (**)(uint64_t *, uint64_t))(v25 + 8))(v27, v23);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v17 + 32))(v19, v22, v16);
    sub_24218E330();
    v31 = sub_2421AF4A8();
    sub_24218D5C8((uint64_t)v9, 1, 1, v31);
    _Block_copy(a4);
    sub_242190220();
    sub_242199198((uint64_t)v9, &qword_2543A67F0);
    (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v16);
  }
  _Block_release(a4);
  _Block_release(a4);
}

void CatalogServiceServer.Server.requestResources(requestKey:with:)()
{
  uint64_t v0;
  uint64_t v1;
  void (*v2)(_QWORD, uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(_QWORD, uint64_t);
  uint64_t v27;

  sub_242199548();
  v26 = v2;
  v4 = v3;
  v6 = v5;
  sub_24218D500(&qword_2543A67F0);
  sub_2421992E8();
  MEMORY[0x24BDAC7A8](v7);
  sub_242199988();
  if (qword_2543A66F0 != -1)
    swift_once();
  v8 = sub_242199940();
  v9 = sub_24218E28C(v8, (uint64_t)qword_2543A6B60);
  sub_2421AEE18();
  sub_2421AF928();
  v10 = sub_2421AEF44();
  v11 = v10;
  if (os_log_type_enabled(v9, v10))
  {
    v12 = (uint8_t *)sub_24218D61C();
    v27 = sub_24218D61C();
    *(_DWORD *)v12 = 136315138;
    sub_242199520();
    sub_2421AF014(v6, v13, &v27);
    sub_2421AEF94(v14);
    sub_2421AFBEC();
    sub_24219CBF0();
    sub_2421A4030(&dword_24218A000, v9, (os_log_type_t)v11, "Attempting requestResources for key: %s", v12);
    sub_24219BC64();
    sub_24218D600();
  }

  sub_2421AEE20();
  v15 = sub_2421AF784();
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  sub_2421AEE80();
  sub_24218D500(&qword_2543A6970);
  sub_2421992E8();
  MEMORY[0x24BDAC7A8](v17);
  sub_2421AED7C();
  sub_242199520();
  sub_2421AF76C();
  if (sub_24218E0BC(v11, 1, v15) == 1)
  {
    sub_242199198(v11, &qword_2543A6970);
    v18 = sub_2421AF598();
    v19 = (uint64_t (*)(uint64_t))MEMORY[0x24BE682E0];
    v20 = *(_QWORD *)(v18 - 8);
    MEMORY[0x24BDAC7A8](v18);
    sub_24219943C();
    *(_QWORD *)v16 = v6;
    *(_QWORD *)(v16 + 8) = v4;
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v20 + 104))(v16, *MEMORY[0x24BE682D0], v18);
    sub_242199250(&qword_2571DF328, v19, MEMORY[0x24BE682E8]);
    v21 = sub_2421AF238();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 16))(v22, v16, v18);
    sub_242199520();
    v26(0, v21);
    sub_2421AEED4();
    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v16, v18);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 32))(v1, v11, v15);
    sub_24218E330();
    v23 = sub_242199938();
    sub_2421AF28C(v0, v24, v25, v23);
    swift_retain();
    sub_242190234();
    sub_242199198(v0, &qword_2543A67F0);
    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v1, v15);
  }
  sub_242199304();
}

void sub_2421A5D28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  id v6;

  if (a2)
    v5 = sub_2421AF3E8();
  else
    v5 = 0;
  v6 = (id)v5;
  (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, a1);

}

void sub_2421A5D80(uint64_t a1, unint64_t a2, uint64_t a3, void (**a4)(_QWORD, _QWORD, _QWORD))
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t);
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  char *v34;
  uint64_t v35;
  void (*v36)(char *, uint64_t);
  uint64_t v37;
  void (*v38)(char *, char *, uint64_t);
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;

  v7 = sub_24218D500(&qword_2543A67F0);
  MEMORY[0x24BDAC7A8](v7);
  v43 = (char *)&v40 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v42 = sub_2421AF4A8();
  v40 = *(_QWORD *)(v42 - 8);
  v9 = MEMORY[0x24BDAC7A8](v42);
  v11 = (char *)&v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v41 = (char *)&v40 - v12;
  _Block_copy(a4);
  if (qword_2543A66F0 != -1)
    swift_once();
  v13 = sub_2421AF940();
  sub_24218E28C(v13, (uint64_t)qword_2543A6B60);
  swift_bridgeObjectRetain_n();
  v14 = sub_2421AF928();
  v15 = sub_2421AFB74();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = (uint8_t *)swift_slowAlloc();
    v17 = swift_slowAlloc();
    v45 = v17;
    *(_DWORD *)v16 = 136315138;
    swift_bridgeObjectRetain();
    sub_2421A0BC4(a1, a2, &v45);
    v44 = v18;
    sub_2421AFBEC();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_24218A000, v14, v15, "Attempting releaseResources for key: %s", v16, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2426A51D4](v17, -1, -1);
    MEMORY[0x2426A51D4](v16, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v19 = sub_2421AF784();
  v20 = *(_QWORD *)(v19 - 8);
  MEMORY[0x24BDAC7A8](v19);
  v22 = (char *)&v40 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = sub_24218D500(&qword_2543A6970);
  MEMORY[0x24BDAC7A8](v23);
  v25 = (char *)&v40 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  sub_2421AF76C();
  if (sub_24218E0BC((uint64_t)v25, 1, v19) == 1)
  {
    sub_242199198((uint64_t)v25, &qword_2543A6970);
    v26 = sub_2421AF598();
    v27 = (uint64_t (*)(uint64_t))MEMORY[0x24BE682E0];
    v28 = *(_QWORD *)(v26 - 8);
    MEMORY[0x24BDAC7A8](v26);
    v30 = (uint64_t *)((char *)&v40 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0));
    *v30 = a1;
    v30[1] = a2;
    (*(void (**)(uint64_t *, _QWORD, uint64_t))(v28 + 104))(v30, *MEMORY[0x24BE682D0], v26);
    sub_242199250(&qword_2571DF328, v27, MEMORY[0x24BE682E8]);
    v31 = (void *)swift_allocError();
    (*(void (**)(uint64_t, uint64_t *, uint64_t))(v28 + 16))(v32, v30, v26);
    swift_bridgeObjectRetain();
    v33 = (void *)sub_2421AF3E8();
    ((void (**)(_QWORD, _QWORD, void *))a4)[2](a4, 0, v33);

    (*(void (**)(uint64_t *, uint64_t))(v28 + 8))(v30, v26);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v20 + 32))(v22, v25, v19);
    sub_2421AF490();
    v34 = v41;
    sub_2421AF46C();
    v35 = v40;
    v36 = *(void (**)(char *, uint64_t))(v40 + 8);
    v37 = v42;
    v36(v11, v42);
    v38 = *(void (**)(char *, char *, uint64_t))(v35 + 16);
    v39 = (uint64_t)v43;
    v38(v43, v34, v37);
    sub_24218D5C8(v39, 0, 1, v37);
    _Block_copy(a4);
    sub_242190248();
    sub_242199198(v39, &qword_2543A67F0);
    v36(v34, v37);
    (*(void (**)(char *, uint64_t))(v20 + 8))(v22, v19);
  }
  _Block_release(a4);
  _Block_release(a4);
}

void CatalogServiceServer.Server.releaseResources(requestKey:with:)()
{
  uint64_t v0;
  os_log_type_t v1;
  void (*v2)(_QWORD, void *);
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
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t);
  uint64_t v27;
  void *v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  void (*v32)(uint64_t *, uint64_t);
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  void (*v38)(_QWORD, void *);
  uint64_t v39;
  uint64_t v40;

  sub_242199548();
  v38 = v2;
  v39 = v3;
  v5 = v4;
  v7 = v6;
  sub_24218D500(&qword_2543A67F0);
  sub_2421992E8();
  MEMORY[0x24BDAC7A8](v8);
  sub_242199AB8();
  v36 = v9;
  v10 = sub_242199938();
  v35 = *(_QWORD *)(v10 - 8);
  sub_242199348();
  v12 = MEMORY[0x24BDAC7A8](v11);
  v14 = (uint64_t *)((char *)&v34 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v12);
  v37 = (char *)&v34 - v15;
  if (qword_2543A66F0 != -1)
    swift_once();
  v16 = sub_242199940();
  v17 = sub_24218E28C(v16, (uint64_t)qword_2543A6B60);
  sub_2421AEE18();
  sub_2421AF928();
  v18 = sub_2421AEF44();
  if (sub_2421AEDB0(v18))
  {
    v19 = (uint8_t *)sub_24218D61C();
    v40 = sub_24218D61C();
    *(_DWORD *)v19 = 136315138;
    sub_242199520();
    sub_2421AF014(v7, v20, &v40);
    sub_2421AEF94(v21);
    sub_2421AFBEC();
    sub_24219CBF0();
    sub_2421A4030(&dword_24218A000, v17, v1, "Attempting releaseResources for key: %s", v19);
    sub_24219BC64();
    sub_24218D600();
  }

  sub_2421AEE20();
  v22 = sub_2421AF784();
  v23 = *(_QWORD *)(v22 - 8);
  MEMORY[0x24BDAC7A8](v22);
  sub_24219943C();
  sub_24218D500(&qword_2543A6970);
  sub_2421992E8();
  MEMORY[0x24BDAC7A8](v24);
  sub_2421A413C();
  sub_242199520();
  sub_2421AF76C();
  if (sub_24218E0BC((uint64_t)v17, 1, v22) == 1)
  {
    sub_242199198((uint64_t)v17, &qword_2543A6970);
    v25 = sub_2421AF598();
    v26 = (uint64_t (*)(uint64_t))MEMORY[0x24BE682E0];
    sub_2421AEFA8();
    MEMORY[0x24BDAC7A8](v27);
    sub_2421AEE68();
    *v14 = v7;
    v14[1] = v5;
    (*(void (**)(uint64_t *, _QWORD, uint64_t))(v10 + 104))(v14, *MEMORY[0x24BE682D0], v25);
    sub_242199250(&qword_2571DF328, v26, MEMORY[0x24BE682E8]);
    v28 = (void *)sub_2421AF238();
    sub_24219970C(v29, (uint64_t)v14, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 16));
    sub_242199520();
    v38(0, v28);

    (*(void (**)(uint64_t *, uint64_t))(v10 + 8))(v14, v25);
  }
  else
  {
    (*(void (**)(uint64_t, NSObject *, uint64_t))(v23 + 32))(v0, v17, v22);
    sub_2421AF490();
    v30 = v37;
    sub_2421AF46C();
    v31 = v35;
    v32 = *(void (**)(uint64_t *, uint64_t))(v35 + 8);
    v32(v14, v10);
    v33 = v36;
    (*(void (**)(uint64_t, char *, uint64_t))(v31 + 16))(v36, v30, v10);
    sub_24218D5C8(v33, 0, 1, v10);
    swift_retain();
    sub_242190F68();
    sub_242199198(v33, &qword_2543A67F0);
    v32((uint64_t *)v30, v10);
    (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v0, v22);
  }
  sub_242199304();
}

void sub_2421A6608(uint64_t a1, void (*a2)(uint64_t, uint64_t))
{
  uint64_t v4;
  void *v5;

  if (a1)
  {
    v4 = 0;
  }
  else
  {
    sub_2421AE5BC();
    v4 = sub_2421AF338();
  }
  v5 = (void *)v4;
  a2(v4, a1);
  sub_2421AEEC4(v5);
}

void sub_2421A6664(uint64_t a1, unint64_t a2, char *a3, const void *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint8_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  NSObject *v28;
  os_log_type_t v29;
  BOOL v30;
  uint8_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  NSObject *v45;
  os_log_type_t v46;
  uint8_t *v47;
  uint64_t v48;
  int v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  NSObject *v60;
  os_log_type_t v61;
  _BOOL4 v62;
  char *v63;
  uint8_t *v64;
  void *v65;
  char v66;
  char v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  unint64_t v75;
  uint64_t v76;
  void (*v77)(char *, uint64_t);
  uint64_t inited;
  uint64_t v79;
  uint64_t v80;
  _QWORD *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  _QWORD *v87;
  _QWORD v88[3];
  uint64_t v89;
  unint64_t v90;
  uint64_t v91;
  uint64_t v92;
  const void *v93;
  uint64_t v94;
  uint64_t v95;
  char *v96;
  uint64_t v97;
  char *v98;
  uint64_t v99;
  __int128 v100[2];
  uint64_t v101;
  __int128 v102[2];
  uint64_t v103;
  _QWORD v104[3];
  uint64_t v105;
  uint64_t v106;
  __int128 v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110[3];
  uint64_t v111;
  uint64_t v112;

  v98 = a3;
  v7 = sub_24218D500(&qword_2543A67F0);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v91 = (uint64_t)v88 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v94 = (uint64_t)v88 - v10;
  v97 = sub_2421AF430();
  v95 = *(_QWORD *)(v97 - 8);
  MEMORY[0x24BDAC7A8](v97);
  v96 = (char *)v88 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = a4;
  _Block_copy(a4);
  if (qword_2543A66F0 != -1)
    swift_once();
  v13 = sub_2421AF940();
  v14 = sub_24218E28C(v13, (uint64_t)qword_2543A6B60);
  swift_bridgeObjectRetain_n();
  v99 = v14;
  v15 = sub_2421AF928();
  v16 = sub_2421AFB74();
  if (os_log_type_enabled(v15, v16))
  {
    v17 = swift_slowAlloc();
    v93 = a4;
    v18 = (uint8_t *)v17;
    v19 = a1;
    v20 = swift_slowAlloc();
    v110[0] = v20;
    *(_DWORD *)v18 = 136315138;
    swift_bridgeObjectRetain();
    sub_2421A0BC4(v19, a2, v110);
    *(_QWORD *)&v107 = v21;
    sub_2421AFBEC();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_24218A000, v15, v16, "Attempting explicit request for resource id: %s", v18, 0xCu);
    swift_arrayDestroy();
    v22 = v20;
    a1 = v19;
    MEMORY[0x2426A51D4](v22, -1, -1);
    v23 = v18;
    a4 = v93;
    MEMORY[0x2426A51D4](v23, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v24 = sub_2421AF58C();
  v25 = *(_QWORD *)(v24 - 8);
  MEMORY[0x24BDAC7A8](v24);
  v27 = (char *)v88 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, char *, uint64_t))(v95 + 16))(v96, &v98[OBJC_IVAR____TtCC19ModelCatalogRuntime20CatalogServiceServer6Server_sideloadURL], v97);
  sub_2421AF538();
  sub_2421AF574();
  if (!v108)
  {
    sub_242199198((uint64_t)&v107, (uint64_t *)&unk_2543A6918);
    sub_2421AE5BC();
    v38 = (void *)sub_2421AFBD4();
    (*((void (**)(const void *, void *, _QWORD))a4 + 2))(a4, v38, 0);

    (*(void (**)(char *, uint64_t))(v25 + 8))(v27, v24);
LABEL_23:
    swift_release();
    _Block_release(a4);
    return;
  }
  v98 = v27;
  sub_24219BA44(&v107, (uint64_t)v110);
  sub_2421A2FC8((uint64_t)v110, (uint64_t)&v107);
  v28 = sub_2421AF928();
  v29 = sub_2421AFB74();
  v30 = os_log_type_enabled(v28, v29);
  v89 = a1;
  v90 = a2;
  v92 = v25;
  if (v30)
  {
    v31 = (uint8_t *)swift_slowAlloc();
    v32 = swift_slowAlloc();
    v97 = v24;
    v33 = v32;
    *(_QWORD *)&v102[0] = v32;
    *(_DWORD *)v31 = 136315138;
    v96 = (char *)(v31 + 4);
    sub_2421A2FC8((uint64_t)&v107, (uint64_t)v104);
    sub_24218D500(&qword_2543A67F8);
    v34 = sub_2421AFAA8();
    sub_2421A0BC4(v34, v35, (uint64_t *)v102);
    v104[0] = v36;
    sub_2421AFBEC();
    swift_bridgeObjectRelease();
    sub_24218E18C((uint64_t)&v107);
    _os_log_impl(&dword_24218A000, v28, v29, "Attempting explicit request  found resource: %s", v31, 0xCu);
    swift_arrayDestroy();
    v37 = v33;
    v24 = v97;
    MEMORY[0x2426A51D4](v37, -1, -1);
    MEMORY[0x2426A51D4](v31, -1, -1);
  }
  else
  {
    sub_24218E18C((uint64_t)&v107);
  }

  sub_2421A2FC8((uint64_t)v110, (uint64_t)v104);
  sub_24218D500(&qword_2543A67F8);
  sub_24218D500(&qword_2543A6808);
  if (!swift_dynamicCast())
  {
    v103 = 0;
    memset(v102, 0, sizeof(v102));
    sub_242199198((uint64_t)v102, &qword_2543A6A68);
LABEL_20:
    v60 = sub_2421AF928();
    v61 = sub_2421AFB74();
    v62 = os_log_type_enabled(v60, v61);
    v63 = v98;
    if (v62)
    {
      v64 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v64 = 0;
      _os_log_impl(&dword_24218A000, v60, v61, "Attempting explicit request for unsupported resource", v64, 2u);
      MEMORY[0x2426A51D4](v64, -1, -1);
    }

    sub_2421AE5BC();
    v65 = (void *)sub_2421AFBD4();
    (*((void (**)(const void *, void *, _QWORD))a4 + 2))(a4, v65, 0);

    (*(void (**)(char *, uint64_t))(v92 + 8))(v63, v24);
    sub_24218E18C((uint64_t)v110);
    goto LABEL_23;
  }
  sub_24219BA44(v102, (uint64_t)&v107);
  v39 = sub_2421AF514();
  v40 = v111;
  v41 = v112;
  sub_242198260(v110, v111);
  v42 = MEMORY[0x2426A458C](v40, v41);
  sub_24219EAE4(v42, v43, v39);
  LOBYTE(v40) = v44;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v40 & 1) == 0)
  {
    sub_24218E18C((uint64_t)&v107);
    goto LABEL_20;
  }
  v45 = sub_2421AF928();
  v46 = sub_2421AFB74();
  if (os_log_type_enabled(v45, v46))
  {
    v47 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v47 = 0;
    _os_log_impl(&dword_24218A000, v45, v46, "got the explicit resource, attempting to request", v47, 2u);
    MEMORY[0x2426A51D4](v47, -1, -1);
  }
  v97 = v24;
  v99 = v12;
  v93 = a4;

  v48 = sub_2421AF4A8();
  sub_24218D5C8(v94, 1, 1, v48);
  sub_2421A2FC8((uint64_t)v110, (uint64_t)v102);
  sub_24218D500(&qword_2571DF488);
  v49 = swift_dynamicCast();
  v88[2] = v88;
  if (v49)
  {
    v95 = v48;
    sub_24219BA44(v100, (uint64_t)v104);
    v50 = sub_24218D500(&qword_2571DF498);
    v96 = (char *)v88;
    MEMORY[0x24BDAC7A8](v50);
    v52 = (char *)v88 - ((v51 + 15) & 0xFFFFFFFFFFFFFFF0);
    v53 = v105;
    v54 = v106;
    sub_242198260(v104, v105);
    v55 = sub_2421AF7CC();
    v56 = *(_QWORD *)(v55 - 8);
    MEMORY[0x24BDAC7A8](v55);
    v58 = (char *)v88 - ((v57 + 15) & 0xFFFFFFFFFFFFFFF0);
    MEMORY[0x2426A47D8](v53, v54);
    sub_2421AF7C0();
    (*(void (**)(char *, uint64_t))(v56 + 8))(v58, v55);
    v59 = sub_2421AF814();
    if (sub_24218E0BC((uint64_t)v52, 1, v59) == 1)
    {
      sub_242199198((uint64_t)v52, &qword_2571DF498);
    }
    else
    {
      sub_2421AF808();
      v67 = v66;
      (*(void (**)(char *, uint64_t))(*(_QWORD *)(v59 - 8) + 8))(v52, v59);
      if ((v67 & 1) == 0)
      {
        v68 = v91;
        sub_2421AF484();
        v69 = v94;
        sub_242199198(v94, &qword_2543A67F0);
        sub_24218D5C8(v68, 0, 1, v95);
        sub_2421AE650(v68, v69);
      }
    }
    sub_24218E18C((uint64_t)v104);
  }
  else
  {
    v101 = 0;
    memset(v100, 0, sizeof(v100));
    sub_242199198((uint64_t)v100, &qword_2571DF490);
  }
  v70 = v108;
  v71 = v109;
  sub_242198260(&v107, v108);
  v72 = sub_2421AF70C();
  v96 = (char *)v88;
  v73 = *(_QWORD *)(v72 - 8);
  v74 = *(_QWORD *)(v73 + 64);
  MEMORY[0x24BDAC7A8](v72);
  v75 = (v74 + 15) & 0xFFFFFFFFFFFFFFF0;
  MEMORY[0x2426A4724](v70, v71);
  v95 = sub_2421AF6DC();
  v88[1] = v76;
  v77 = *(void (**)(char *, uint64_t))(v73 + 8);
  v77((char *)v88 - v75, v72);
  sub_24218D500(&qword_2543A6940);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_2421B0720;
  v79 = v108;
  v80 = v109;
  v81 = sub_242198260(&v107, v108);
  MEMORY[0x24BDAC7A8](v81);
  MEMORY[0x2426A4724](v79, v80);
  v82 = sub_2421AF6D0();
  v84 = v83;
  v77((char *)v88 - v75, v72);
  *(_QWORD *)(inited + 32) = v82;
  *(_QWORD *)(inited + 40) = v84;
  sub_242198260(&v107, v108);
  sub_2421AF754();
  v85 = v94;
  v86 = v91;
  sub_2421AE5F8(v94, v91);
  v87 = (_QWORD *)swift_allocObject();
  v87[2] = v89;
  v87[3] = v90;
  v87[4] = sub_2421992A4;
  v87[5] = v99;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_242195F1C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  sub_242199198(v86, &qword_2543A67F0);
  sub_242199198(v85, &qword_2543A67F0);
  (*(void (**)(char *, uint64_t))(v92 + 8))(v98, v97);
  sub_24218E18C((uint64_t)&v107);
  sub_24218E18C((uint64_t)v110);
  swift_release();
  _Block_release(v93);
}

void CatalogServiceServer.Server.requestResource(identifier:with:)()
{
  uint64_t v0;
  os_log_type_t v1;
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
  NSObject *v17;
  os_log_type_t v18;
  _BOOL4 v19;
  uint8_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  _BOOL4 v29;
  uint8_t *v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  os_log_type_t v42;
  _WORD *v43;
  uint64_t v44;
  char v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  NSObject *v52;
  os_log_type_t v53;
  _WORD *v54;
  uint64_t v55;
  char v56;
  char v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void (*v68)(char *, uint64_t);
  uint64_t inited;
  uint64_t v70;
  uint64_t v71;
  _QWORD *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  _QWORD *v78;
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
  uint64_t *v90;
  uint64_t v91;
  uint64_t *v92;
  NSObject *v93;
  __int128 v94[2];
  uint64_t v95;
  __int128 v96[2];
  uint64_t v97;
  _QWORD v98[3];
  uint64_t v99;
  uint64_t v100;
  __int128 v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104[6];

  sub_242199548();
  v91 = v0;
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  sub_24218D500(&qword_2543A67F0);
  sub_2421992E8();
  MEMORY[0x24BDAC7A8](v10);
  sub_24218D690();
  v84 = v11;
  MEMORY[0x24BDAC7A8](v12);
  v86 = (uint64_t)&v80 - v13;
  v90 = (uint64_t *)sub_2421997A8();
  v88 = *(v90 - 1);
  sub_242199348();
  MEMORY[0x24BDAC7A8](v14);
  sub_242199AB8();
  v89 = v15;
  if (qword_2543A66F0 != -1)
    swift_once();
  v16 = sub_242199940();
  v17 = sub_24218E28C(v16, (uint64_t)qword_2543A6B60);
  sub_2421AEE18();
  sub_2421AF928();
  v18 = sub_2421AEF44();
  v19 = sub_2421AEDB0(v18);
  v87 = v3;
  v93 = v17;
  if (v19)
  {
    v20 = (uint8_t *)sub_24218D61C();
    v21 = sub_24218D61C();
    v85 = v5;
    v104[0] = v21;
    *(_DWORD *)v20 = 136315138;
    sub_242199520();
    sub_2421AF014(v9, v22, v104);
    sub_2421AF218(v23);
    sub_2421AEF78();
    sub_24219CBF0();
    sub_2421A4030(&dword_24218A000, v17, v1, "Attempting explicit request for resource id: %s", v20);
    sub_24219BC64();
    sub_24218D600();
  }

  sub_2421AEE20();
  v24 = sub_2421AEE98();
  v92 = &v80;
  v25 = *(_QWORD *)(v24 - 8);
  MEMORY[0x24BDAC7A8](v24);
  sub_2421AEE80();
  (*(void (**)(uint64_t, uint64_t, uint64_t *))(v88 + 16))(v89, v91 + OBJC_IVAR____TtCC19ModelCatalogRuntime20CatalogServiceServer6Server_sideloadURL, v90);
  sub_2421AF538();
  v26 = sub_2421AF574();
  if (v102)
  {
    sub_24219BA44(&v101, (uint64_t)v104);
    sub_2421AEE44();
    v27 = v17;
    sub_2421AF928();
    v28 = sub_2421AEF44();
    v29 = sub_24219BB3C(v28);
    v82 = v9;
    v83 = v7;
    if (v29)
    {
      v91 = v3;
      v30 = (uint8_t *)sub_24218D61C();
      *(_QWORD *)&v96[0] = sub_24218D61C();
      *(_DWORD *)v30 = 136315138;
      v90 = (uint64_t *)(v30 + 4);
      sub_2421AF188((uint64_t)&v101);
      sub_24218D500(&qword_2543A67F8);
      v31 = sub_2421AF250();
      sub_2421A0BC4(v31, v32, (uint64_t *)v96);
      sub_2421AF304(v33);
      sub_2421AFBEC();
      swift_bridgeObjectRelease();
      sub_2421AEE50();
      sub_2421A4030(&dword_24218A000, v27, (os_log_type_t)swift_allocError, "Attempting explicit request  found resource: %s", v30);
      sub_24219BC64();
      sub_24218D600();
    }
    sub_2421AEE50();

    sub_2421AF188((uint64_t)v104);
    sub_24218D500(&qword_2543A67F8);
    sub_24218D500(&qword_2543A6808);
    if ((sub_2421AF2AC() & 1) != 0)
    {
      sub_24219BA44(v96, (uint64_t)&v101);
      v17 = sub_2421AF514();
      v35 = v104[3];
      v36 = v104[4];
      sub_2421AF350();
      v37 = MEMORY[0x2426A458C](v35, v36);
      sub_24219EAE4(v37, v38, (uint64_t)v17);
      v40 = v39;
      sub_24219947C();
      sub_2421A4070();
      if ((v40 & 1) != 0)
      {
        v41 = v93;
        sub_2421AF928();
        v42 = sub_2421AEF44();
        if (sub_24219BB78(v42))
        {
          v43 = (_WORD *)sub_24218D61C();
          sub_2421AF2F8(v43);
          sub_2421AEEDC(&dword_24218A000, v41, (os_log_type_t)v17, "got the explicit resource, attempting to request");
          sub_24218D600();
        }
        v91 = v3;
        v93 = v24;
        v85 = v5;

        v44 = sub_242199938();
        sub_24218D5C8(v86, 1, 1, v44);
        sub_2421A2FC8((uint64_t)v104, (uint64_t)v96);
        sub_24218D500(&qword_2571DF488);
        v45 = sub_2421AF2AC();
        v81 = v25;
        if ((v45 & 1) != 0)
        {
          v89 = v44;
          sub_24219BA44(v94, (uint64_t)v98);
          sub_24218D500(&qword_2571DF498);
          v90 = &v80;
          sub_2421992E8();
          MEMORY[0x24BDAC7A8](v46);
          sub_2421A4018();
          v47 = v99;
          v48 = v100;
          sub_242198260(v98, v99);
          v49 = sub_2421AF7CC();
          v50 = *(_QWORD *)(v49 - 8);
          MEMORY[0x24BDAC7A8](v49);
          sub_2421AED7C();
          MEMORY[0x2426A47D8](v47, v48);
          sub_2421AF7C0();
          (*(void (**)(uint64_t, uint64_t))(v50 + 8))(v5, v49);
          v51 = sub_2421AF814();
          if (sub_24218E0BC(v40, 1, v51) == 1)
          {
            sub_242199198(v40, &qword_2571DF498);
          }
          else
          {
            sub_2421AF808();
            v57 = v56;
            sub_2421AF2EC(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v51 - 8) + 8));
            if ((v57 & 1) == 0)
            {
              v58 = v84;
              sub_2421AF484();
              v59 = v86;
              sub_242199198(v86, &qword_2543A67F0);
              sub_24218D5C8(v58, 0, 1, v89);
              sub_2421AE650(v58, v59);
            }
          }
          sub_24218E18C((uint64_t)v98);
        }
        else
        {
          v95 = 0;
          memset(v94, 0, sizeof(v94));
          sub_242199198((uint64_t)v94, &qword_2571DF490);
        }
        v60 = v102;
        v61 = v103;
        sub_242198260(&v101, v102);
        v62 = sub_242199484();
        v90 = &v80;
        v63 = *(_QWORD *)(v62 - 8);
        v64 = *(_QWORD *)(v63 + 64);
        MEMORY[0x24BDAC7A8](v62);
        v65 = (v64 + 15) & 0xFFFFFFFFFFFFFFF0;
        MEMORY[0x2426A4724](v60, v61);
        v66 = sub_2421AF6DC();
        v88 = v67;
        v89 = v66;
        v68 = *(void (**)(char *, uint64_t))(v63 + 8);
        v68((char *)&v80 - v65, v62);
        sub_24218D500(&qword_2543A6940);
        inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_2421B0720;
        v71 = v102;
        v70 = v103;
        v72 = sub_242198260(&v101, v102);
        MEMORY[0x24BDAC7A8](v72);
        MEMORY[0x2426A4724](v71, v70);
        v73 = sub_2421AF6D0();
        v75 = v74;
        v68((char *)&v80 - v65, v62);
        *(_QWORD *)(inited + 32) = v73;
        *(_QWORD *)(inited + 40) = v75;
        sub_242198260(&v101, v102);
        sub_2421AF754();
        v76 = v86;
        v77 = v84;
        sub_2421AE5F8(v86, v84);
        v78 = (_QWORD *)swift_allocObject();
        v78[2] = v82;
        v79 = v85;
        v78[3] = v83;
        v78[4] = v79;
        v78[5] = v87;
        swift_bridgeObjectRetain();
        swift_retain();
        sub_242195F1C();
        sub_2421A4070();
        sub_242199434();
        sub_24219947C();
        swift_release();
        sub_242199198(v77, &qword_2543A67F0);
        sub_242199198(v76, &qword_2543A67F0);
        (*(void (**)(uint64_t, NSObject *))(v81 + 8))(v91, v93);
        sub_2421AEE50();
LABEL_26:
        sub_242199A08();
        goto LABEL_27;
      }
      sub_2421AEE50();
    }
    else
    {
      v97 = 0;
      memset(v96, 0, sizeof(v96));
      sub_242199198((uint64_t)v96, &qword_2543A6A68);
    }
    v52 = v93;
    sub_2421AF928();
    v53 = sub_2421AEF44();
    if (sub_24219BB78(v53))
    {
      v54 = (_WORD *)sub_24218D61C();
      sub_2421AF2F8(v54);
      sub_2421AEEDC(&dword_24218A000, v52, (os_log_type_t)v17, "Attempting explicit request for unsupported resource");
      sub_24218D600();
    }

    sub_2421AEDC0();
    v55 = sub_2421AF344();
    sub_2421AF1B8(v55);

    sub_2421AEEE8(v3, *(uint64_t (**)(uint64_t, uint64_t))(v25 + 8));
    goto LABEL_26;
  }
  sub_2421AF0EC(v26, (uint64_t *)&unk_2543A6918);
  sub_2421AEDC0();
  v34 = sub_2421AF32C();
  sub_2421AF1B8(v34);

  sub_2421AEEE8(v3, *(uint64_t (**)(uint64_t, uint64_t))(v25 + 8));
LABEL_27:
  sub_242199304();
}

void sub_2421A7A68(void *a1, uint64_t a2, unint64_t a3, void (*a4)(_QWORD, _QWORD))
{
  uint64_t v8;
  id v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  void *v18;
  void (*v19)(_QWORD, _QWORD);
  uint64_t v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  if (qword_2543A66F0 != -1)
    swift_once();
  v8 = sub_2421AF940();
  sub_24218E28C(v8, (uint64_t)qword_2543A6B60);
  swift_bridgeObjectRetain();
  v9 = a1;
  swift_bridgeObjectRetain();
  v10 = a1;
  v11 = sub_2421AF928();
  v12 = sub_2421AFB74();
  if (os_log_type_enabled(v11, v12))
  {
    v19 = a4;
    v13 = swift_slowAlloc();
    v14 = (_QWORD *)swift_slowAlloc();
    v15 = swift_slowAlloc();
    v20[0] = v15;
    *(_DWORD *)v13 = 136315394;
    swift_bridgeObjectRetain();
    sub_2421A0BC4(a2, a3, v20);
    sub_2421AFBEC();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v13 + 12) = 2112;
    if (a1)
    {
      v16 = a1;
      v17 = _swift_stdlib_bridgeErrorToNSError();
      sub_2421AFBEC();
    }
    else
    {
      sub_2421AFBEC();
      v17 = 0;
    }
    *v14 = v17;

    _os_log_impl(&dword_24218A000, v11, v12, "Explicit request for resource: %s: %@", (uint8_t *)v13, 0x16u);
    sub_24218D500(&qword_2543A6B08);
    swift_arrayDestroy();
    MEMORY[0x2426A51D4](v14, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x2426A51D4](v15, -1, -1);
    MEMORY[0x2426A51D4](v13, -1, -1);

    a4 = v19;
  }
  else
  {
    swift_bridgeObjectRelease_n();

  }
  sub_2421AE5BC();
  v18 = (void *)sub_2421AFBD4();
  a4(v18, a1);

}

void sub_2421A7D4C(uint64_t a1, unint64_t a2, uint64_t *a3, void (**a4)(_QWORD, _QWORD, _QWORD))
{
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  _BOOL4 v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  NSObject *v21;
  os_log_type_t v22;
  BOOL v23;
  uint8_t *v24;
  uint64_t v25;
  void (**v26)(_QWORD, _QWORD, _QWORD);
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  NSObject *v39;
  os_log_type_t v40;
  uint8_t *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  NSObject *v47;
  os_log_type_t v48;
  uint8_t *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  __int128 v57[2];
  uint64_t v58;
  _QWORD v59[5];
  __int128 v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63[3];
  uint64_t v64;
  uint64_t v65;

  v55 = a3;
  v54 = sub_2421AF430();
  v53 = *(_QWORD *)(v54 - 8);
  MEMORY[0x24BDAC7A8](v54);
  v8 = (char *)&v51 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2543A66F0 != -1)
    swift_once();
  v9 = sub_2421AF940();
  v10 = sub_24218E28C(v9, (uint64_t)qword_2543A6B60);
  swift_bridgeObjectRetain_n();
  v11 = sub_2421AF928();
  v12 = sub_2421AFB74();
  v13 = os_log_type_enabled(v11, v12);
  v56 = v10;
  if (v13)
  {
    v14 = (uint8_t *)swift_slowAlloc();
    v15 = swift_slowAlloc();
    v63[0] = v15;
    *(_DWORD *)v14 = 136315138;
    swift_bridgeObjectRetain();
    sub_2421A0BC4(a1, a2, v63);
    *(_QWORD *)&v60 = v16;
    sub_2421AFBEC();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_24218A000, v11, v12, "Attempting explicit replease for resource id: %s", v14, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2426A51D4](v15, -1, -1);
    MEMORY[0x2426A51D4](v14, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v17 = sub_2421AF58C();
  v18 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)&v51 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v53 + 16))(v8, (uint64_t)v55 + OBJC_IVAR____TtCC19ModelCatalogRuntime20CatalogServiceServer6Server_sideloadURL, v54);
  sub_2421AF538();
  sub_2421AF574();
  if (v61)
  {
    sub_24219BA44(&v60, (uint64_t)v63);
    sub_2421A2FC8((uint64_t)v63, (uint64_t)&v60);
    v21 = sub_2421AF928();
    v22 = sub_2421AFB74();
    v23 = os_log_type_enabled(v21, v22);
    v52 = v18;
    if (v23)
    {
      v24 = (uint8_t *)swift_slowAlloc();
      v25 = swift_slowAlloc();
      v55 = &v51;
      v26 = a4;
      v27 = v25;
      *(_QWORD *)&v57[0] = v25;
      *(_DWORD *)v24 = 136315138;
      sub_2421A2FC8((uint64_t)&v60, (uint64_t)v59);
      sub_24218D500(&qword_2543A67F8);
      v28 = sub_2421AFAA8();
      sub_2421A0BC4(v28, v29, (uint64_t *)v57);
      v59[0] = v30;
      sub_2421AFBEC();
      swift_bridgeObjectRelease();
      sub_24218E18C((uint64_t)&v60);
      _os_log_impl(&dword_24218A000, v21, v22, "Attempting explicit release found resource: %s", v24, 0xCu);
      swift_arrayDestroy();
      v31 = v27;
      a4 = v26;
      MEMORY[0x2426A51D4](v31, -1, -1);
      MEMORY[0x2426A51D4](v24, -1, -1);
    }
    else
    {
      sub_24218E18C((uint64_t)&v60);
    }

    sub_2421A2FC8((uint64_t)v63, (uint64_t)v59);
    sub_24218D500(&qword_2543A67F8);
    sub_24218D500(&qword_2543A6808);
    if (swift_dynamicCast())
    {
      sub_24219BA44(v57, (uint64_t)&v60);
      v33 = sub_2421AF514();
      v34 = v64;
      v35 = v65;
      sub_242198260(v63, v64);
      v36 = MEMORY[0x2426A458C](v34, v35);
      sub_24219EAE4(v36, v37, v33);
      LOBYTE(v34) = v38;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v34 & 1) != 0)
      {
        v39 = sub_2421AF928();
        v40 = sub_2421AFB74();
        if (os_log_type_enabled(v39, v40))
        {
          v41 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v41 = 0;
          _os_log_impl(&dword_24218A000, v39, v40, "got the explicit resource, attempting release", v41, 2u);
          MEMORY[0x2426A51D4](v41, -1, -1);
        }

        v42 = v61;
        v43 = v62;
        sub_242198260(&v60, v61);
        v44 = MEMORY[0x2426A458C](v42, *(_QWORD *)(v43 + 8));
        sub_242196FC8(v44, v45);
        swift_bridgeObjectRelease();
        sub_2421AE5BC();
        v46 = (void *)sub_2421AFBD4();
        ((void (**)(_QWORD, void *, _QWORD))a4)[2](a4, v46, 0);

        (*(void (**)(char *, uint64_t))(v52 + 8))(v20, v17);
        sub_24218E18C((uint64_t)&v60);
LABEL_21:
        sub_24218E18C((uint64_t)v63);
        goto LABEL_22;
      }
      sub_24218E18C((uint64_t)&v60);
    }
    else
    {
      v58 = 0;
      memset(v57, 0, sizeof(v57));
      sub_242199198((uint64_t)v57, &qword_2543A6A68);
    }
    v47 = sub_2421AF928();
    v48 = sub_2421AFB74();
    if (os_log_type_enabled(v47, v48))
    {
      v49 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v49 = 0;
      _os_log_impl(&dword_24218A000, v47, v48, "Attempting explicit release could not cast", v49, 2u);
      MEMORY[0x2426A51D4](v49, -1, -1);
    }

    sub_2421AE5BC();
    v50 = (void *)sub_2421AFBD4();
    ((void (**)(_QWORD, void *, _QWORD))a4)[2](a4, v50, 0);

    (*(void (**)(char *, uint64_t))(v52 + 8))(v20, v17);
    goto LABEL_21;
  }
  sub_242199198((uint64_t)&v60, (uint64_t *)&unk_2543A6918);
  sub_2421AE5BC();
  v32 = (void *)sub_2421AFBD4();
  ((void (**)(_QWORD, void *, _QWORD))a4)[2](a4, v32, 0);

  (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
LABEL_22:
  _Block_release(a4);
}

void CatalogServiceServer.Server.releaseResource(identifier:with:)()
{
  NSObject *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  os_log_type_t v19;
  uint8_t *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  os_log_type_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  os_log_type_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD v45[2];
  uint64_t v46;
  uint64_t v47;
  _QWORD *v48;
  NSObject *v49;
  __int128 v50[2];
  uint64_t v51;
  __int128 v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55[3];
  uint64_t v56;
  uint64_t v57;

  sub_242199548();
  v48 = v1;
  v45[1] = v4;
  v6 = v5;
  v8 = v7;
  v47 = sub_2421997A8();
  v46 = *(_QWORD *)(v47 - 8);
  sub_242199348();
  MEMORY[0x24BDAC7A8](v9);
  sub_2421995E0();
  if (qword_2543A66F0 != -1)
    swift_once();
  v10 = sub_242199940();
  v11 = sub_24218E28C(v10, (uint64_t)qword_2543A6B60);
  sub_2421AEE18();
  v12 = v11;
  sub_2421AF928();
  v13 = sub_2421AEF44();
  v49 = v11;
  if (sub_24219BB3C(v13))
  {
    v14 = (uint8_t *)sub_24218D61C();
    v55[0] = sub_24218D61C();
    *(_DWORD *)v14 = 136315138;
    swift_bridgeObjectRetain();
    sub_2421A0BC4(v8, v6, v55);
    sub_2421AF218(v15);
    sub_2421AFBEC();
    sub_24219CBF0();
    sub_2421A4030(&dword_24218A000, v12, (os_log_type_t)v3, "Attempting explicit replease for resource id: %s", v14);
    sub_24219BC64();
    sub_24218D600();
  }

  sub_2421AEE20();
  v16 = sub_2421AEE98();
  sub_2421AEE58();
  MEMORY[0x24BDAC7A8](v17);
  sub_24219943C();
  (*(void (**)(NSObject *, uint64_t, uint64_t))(v46 + 16))(v0, (uint64_t)v48 + OBJC_IVAR____TtCC19ModelCatalogRuntime20CatalogServiceServer6Server_sideloadURL, v47);
  sub_2421AF538();
  v18 = sub_2421AF574();
  if (v53)
  {
    sub_24219BA44(&v52, (uint64_t)v55);
    sub_2421AEE44();
    sub_2421AF928();
    v19 = sub_2421AF2D8();
    v45[0] = v2;
    if (sub_2421AF264(v0))
    {
      v20 = (uint8_t *)sub_24218D61C();
      v21 = sub_24218D61C();
      v48 = v45;
      *(_QWORD *)&v50[0] = v21;
      *(_DWORD *)v20 = 136315138;
      sub_2421AF188((uint64_t)&v52);
      sub_24218D500(&qword_2543A67F8);
      v22 = sub_2421AF250();
      sub_2421A0BC4(v22, v23, (uint64_t *)v50);
      sub_2421AF304(v24);
      sub_2421AFBEC();
      swift_bridgeObjectRelease();
      sub_2421AEE50();
      sub_2421A4030(&dword_24218A000, v0, v19, "Attempting explicit release found resource: %s", v20);
      sub_24219BC64();
      sub_24218D600();
    }
    sub_2421AEE50();

    sub_2421AF188((uint64_t)v55);
    v26 = (void *)sub_24218D500(&qword_2543A67F8);
    sub_24218D500(&qword_2543A6808);
    if ((sub_2421AEFE8() & 1) != 0)
    {
      sub_24219BA44(v50, (uint64_t)&v52);
      v26 = (void *)sub_2421AF514();
      v27 = v56;
      v28 = v57;
      sub_242198260(v55, v56);
      v29 = MEMORY[0x2426A458C](v27, v28);
      sub_24219EAE4(v29, v30, (uint64_t)v26);
      LOBYTE(v27) = v31;
      sub_24219947C();
      sub_24219978C();
      if ((v27 & 1) != 0)
      {
        sub_2421AF2B8();
        v32 = sub_2421AF2D8();
        if (sub_2421A3F7C(v32))
        {
          *(_WORD *)sub_24218D61C() = 0;
          sub_2421A3FB0(&dword_24218A000, v33, v34, "got the explicit resource, attempting release");
          sub_24218D600();
        }

        v35 = v53;
        v36 = v54;
        sub_242198260(&v52, v53);
        v37 = MEMORY[0x2426A458C](v35, *(_QWORD *)(v36 + 8));
        v39 = (void *)v38;
        sub_242196FC8(v37, v38);
        sub_24219978C();
        sub_2421AEDC0();
        v40 = sub_2421AF338();
        sub_2421AEE28(v40);

        sub_2421AF0F4();
        sub_2421AEE50();
LABEL_19:
        sub_242199A08();
        goto LABEL_20;
      }
      sub_2421AEE50();
    }
    else
    {
      v51 = 0;
      memset(v50, 0, sizeof(v50));
      sub_242199198((uint64_t)v50, &qword_2543A6A68);
    }
    sub_2421AF2B8();
    v41 = sub_2421AF2D8();
    if (sub_2421A3F7C(v41))
    {
      *(_WORD *)sub_24218D61C() = 0;
      sub_2421A3FB0(&dword_24218A000, v42, v43, "Attempting explicit release could not cast");
      sub_24218D600();
    }

    sub_2421AEDC0();
    v44 = sub_2421AF344();
    sub_2421AEE28(v44);

    sub_2421AF0F4();
    goto LABEL_19;
  }
  sub_2421AF0EC(v18, (uint64_t *)&unk_2543A6918);
  sub_2421AEDC0();
  v25 = sub_2421AF32C();
  sub_2421AEE28(v25);

  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v16);
LABEL_20:
  sub_242199304();
}

void sub_2421A8948(uint64_t a1, unint64_t a2, uint64_t a3, void (**a4)(_QWORD, _QWORD, _QWORD))
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  void *v22;
  void (**v23)(_QWORD, _QWORD, _QWORD);
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27[5];

  v25 = a3;
  v24 = sub_2421AF430();
  v7 = *(_QWORD *)(v24 - 8);
  MEMORY[0x24BDAC7A8](v24);
  v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2543A66F0 != -1)
    swift_once();
  v10 = sub_2421AF940();
  sub_24218E28C(v10, (uint64_t)qword_2543A6B60);
  swift_bridgeObjectRetain_n();
  v11 = sub_2421AF928();
  v12 = sub_2421AFB98();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc();
    v14 = swift_slowAlloc();
    v23 = a4;
    v15 = v14;
    v27[0] = v14;
    *(_DWORD *)v13 = 136315138;
    swift_bridgeObjectRetain();
    sub_2421A0BC4(a1, a2, v27);
    v26 = v16;
    sub_2421AFBEC();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_24218A000, v11, v12, "requesting resource for: %s", v13, 0xCu);
    swift_arrayDestroy();
    v17 = v15;
    a4 = v23;
    MEMORY[0x2426A51D4](v17, -1, -1);
    MEMORY[0x2426A51D4](v13, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v18 = sub_2421AF58C();
  v19 = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v18);
  v21 = (char *)&v23 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v25 + OBJC_IVAR____TtCC19ModelCatalogRuntime20CatalogServiceServer6Server_sideloadURL, v24);
  sub_2421AF538();
  sub_2421AF574();
  sub_2421AF724();
  v22 = (void *)sub_2421AF718();
  ((void (**)(_QWORD, void *, _QWORD))a4)[2](a4, v22, 0);

  sub_242199198((uint64_t)v27, (uint64_t *)&unk_2543A6918);
  (*(void (**)(char *, uint64_t))(v19 + 8))(v21, v18);
  _Block_release(a4);
}

void CatalogServiceServer.Server.resourceContainer(identifier:with:)()
{
  NSObject *v0;
  os_log_type_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;

  sub_242199548();
  v3 = v2;
  sub_2421997A8();
  sub_2421AEE58();
  MEMORY[0x24BDAC7A8](v4);
  sub_2421AED7C();
  if (qword_2543A66F0 != -1)
    swift_once();
  v5 = sub_242199940();
  sub_2421AEDC8(v5, (uint64_t)qword_2543A6B60);
  sub_2421AF928();
  v6 = sub_24218D658();
  if (sub_2421AEDB0(v6))
  {
    v7 = (uint8_t *)sub_24218D61C();
    v8 = sub_24218D61C();
    sub_2421AF1C8(v8);
    v9 = sub_2421AEFF4(4.8149e-34);
    sub_2421AF008(v9, v10, &v15);
    sub_2421AEF5C(v11);
    sub_24219CBF0();
    sub_2421A4030(&dword_24218A000, v0, v1, "requesting resource for: %s", v7);
    sub_24219BC64();
    sub_24218D600();
  }

  sub_2421AEE20();
  sub_2421AEE98();
  sub_2421AEFA8();
  MEMORY[0x24BDAC7A8](v12);
  sub_2421AF140();
  sub_2421AF0B0(OBJC_IVAR____TtCC19ModelCatalogRuntime20CatalogServiceServer6Server_sideloadURL);
  sub_2421AF1B0();
  sub_2421AF318();
  sub_2421AF574();
  sub_2421AF724();
  v13 = (id)sub_2421AF718();
  sub_2421AF01C();

  sub_2421AF1A0(v14, (uint64_t *)&unk_2543A6918);
  sub_2421AEDE4();
  sub_242199304();
}

void sub_2421A8E60(uint64_t a1, unint64_t a2, uint64_t a3, void (**a4)(_QWORD, _QWORD, _QWORD))
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  void *v22;
  void (**v23)(_QWORD, _QWORD, _QWORD);
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27[5];

  v25 = a3;
  v24 = sub_2421AF430();
  v7 = *(_QWORD *)(v24 - 8);
  MEMORY[0x24BDAC7A8](v24);
  v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2543A66F0 != -1)
    swift_once();
  v10 = sub_2421AF940();
  sub_24218E28C(v10, (uint64_t)qword_2543A6B60);
  swift_bridgeObjectRetain_n();
  v11 = sub_2421AF928();
  v12 = sub_2421AFB98();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc();
    v14 = swift_slowAlloc();
    v23 = a4;
    v15 = v14;
    v27[0] = v14;
    *(_DWORD *)v13 = 136315138;
    swift_bridgeObjectRetain();
    sub_2421A0BC4(a1, a2, v27);
    v26 = v16;
    sub_2421AFBEC();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_24218A000, v11, v12, "requesting resource bundle for: %s", v13, 0xCu);
    swift_arrayDestroy();
    v17 = v15;
    a4 = v23;
    MEMORY[0x2426A51D4](v17, -1, -1);
    MEMORY[0x2426A51D4](v13, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v18 = sub_2421AF58C();
  v19 = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v18);
  v21 = (char *)&v23 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v25 + OBJC_IVAR____TtCC19ModelCatalogRuntime20CatalogServiceServer6Server_sideloadURL, v24);
  sub_2421AF538();
  sub_2421AF544();
  sub_2421AF7F0();
  v22 = (void *)sub_2421AF7E4();
  ((void (**)(_QWORD, void *, _QWORD))a4)[2](a4, v22, 0);

  sub_242199198((uint64_t)v27, &qword_2571DF4A0);
  (*(void (**)(char *, uint64_t))(v19 + 8))(v21, v18);
  _Block_release(a4);
}

void CatalogServiceServer.Server.resourceBundleContainer(identifier:with:)()
{
  NSObject *v0;
  os_log_type_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;

  sub_242199548();
  v3 = v2;
  sub_2421997A8();
  sub_2421AEE58();
  MEMORY[0x24BDAC7A8](v4);
  sub_2421AED7C();
  if (qword_2543A66F0 != -1)
    swift_once();
  v5 = sub_242199940();
  sub_2421AEDC8(v5, (uint64_t)qword_2543A6B60);
  sub_2421AF928();
  v6 = sub_24218D658();
  if (sub_2421AEDB0(v6))
  {
    v7 = (uint8_t *)sub_24218D61C();
    v8 = sub_24218D61C();
    sub_2421AF1C8(v8);
    v9 = sub_2421AEFF4(4.8149e-34);
    sub_2421AF008(v9, v10, &v15);
    sub_2421AEF5C(v11);
    sub_24219CBF0();
    sub_2421A4030(&dword_24218A000, v0, v1, "requesting resource bundle for: %s", v7);
    sub_24219BC64();
    sub_24218D600();
  }

  sub_2421AEE20();
  sub_2421AEE98();
  sub_2421AEFA8();
  MEMORY[0x24BDAC7A8](v12);
  sub_2421AF140();
  sub_2421AF0B0(OBJC_IVAR____TtCC19ModelCatalogRuntime20CatalogServiceServer6Server_sideloadURL);
  sub_2421AF1B0();
  sub_2421AF318();
  sub_2421AF544();
  sub_2421AF7F0();
  v13 = (id)sub_2421AF7E4();
  sub_2421AF01C();

  sub_2421AF1A0(v14, &qword_2571DF4A0);
  sub_2421AEDE4();
  sub_242199304();
}

void sub_2421A9378(uint64_t a1, void (**a2)(_QWORD, _QWORD, _QWORD))
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[2];
  void (**v20)(_QWORD, _QWORD, _QWORD);
  uint64_t v21;
  _BYTE v22[40];
  _BYTE v23[40];
  uint64_t v24;

  v4 = sub_2421AF430();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2543A66F0 != -1)
    swift_once();
  v8 = sub_2421AF940();
  sub_24218E28C(v8, (uint64_t)qword_2543A6B60);
  v9 = sub_2421AF928();
  v10 = sub_2421AFB98();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_24218A000, v9, v10, "requesting resources", v11, 2u);
    MEMORY[0x2426A51D4](v11, -1, -1);
  }

  v12 = sub_2421AF58C();
  v21 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1 + OBJC_IVAR____TtCC19ModelCatalogRuntime20CatalogServiceServer6Server_sideloadURL, v4);
  sub_2421AF538();
  v15 = sub_2421AF580();
  v16 = *(_QWORD *)(v15 + 16);
  if (v16)
  {
    v19[0] = v12;
    v19[1] = v19;
    v20 = a2;
    v24 = MEMORY[0x24BEE4AF8];
    sub_2421AFCA0();
    sub_2421AF724();
    v17 = v15 + 32;
    do
    {
      sub_2421A2FC8(v17, (uint64_t)v23);
      sub_2421A2FC8((uint64_t)v23, (uint64_t)v22);
      sub_2421AF718();
      sub_242199198((uint64_t)v22, (uint64_t *)&unk_2543A6918);
      sub_24218E18C((uint64_t)v23);
      sub_2421AFC88();
      sub_2421AFCAC();
      sub_2421AFCB8();
      sub_2421AFC94();
      v17 += 40;
      --v16;
    }
    while (v16);
    swift_bridgeObjectRelease();
    a2 = v20;
    v12 = v19[0];
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  sub_2421AF724();
  v18 = (void *)sub_2421AFAF0();
  ((void (**)(_QWORD, void *, _QWORD))a2)[2](a2, v18, 0);
  swift_bridgeObjectRelease();

  (*(void (**)(char *, uint64_t))(v21 + 8))(v14, v12);
  _Block_release(a2);
}

void CatalogServiceServer.Server.resourceContainers(with:)()
{
  NSObject *v0;
  os_log_type_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  os_log_type_t v8;
  _WORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[12];
  uint64_t v16;

  sub_242199548();
  v3 = v2;
  v5 = v4;
  sub_2421997A8();
  sub_2421AEE58();
  MEMORY[0x24BDAC7A8](v6);
  sub_2421AED7C();
  if (qword_2543A66F0 != -1)
    swift_once();
  v7 = sub_242199940();
  sub_24218E28C(v7, (uint64_t)qword_2543A6B60);
  sub_24219BCE4();
  v8 = sub_242199868();
  if (sub_2421A3F7C(v8))
  {
    v9 = (_WORD *)sub_24218D61C();
    sub_2421AF2F8(v9);
    sub_2421AEEDC(&dword_24218A000, v0, v1, "requesting resources");
    sub_24218D600();
  }

  v10 = sub_2421AEE98();
  v15[4] = *(_QWORD *)(v10 - 8);
  v15[5] = v10;
  sub_242199348();
  MEMORY[0x24BDAC7A8](v11);
  sub_242199988();
  sub_2421AF06C(OBJC_IVAR____TtCC19ModelCatalogRuntime20CatalogServiceServer6Server_sideloadURL);
  sub_2421AF1B0();
  v12 = sub_2421AF580();
  v13 = *(_QWORD *)(v12 + 16);
  if (v13)
  {
    v15[1] = v15;
    v15[2] = v3;
    v15[3] = v5;
    sub_2421AF168(MEMORY[0x24BEE4AF8]);
    sub_2421AF724();
    v14 = v12 + 32;
    do
    {
      sub_2421AF22C();
      sub_2421AEE44();
      sub_2421AF718();
      sub_2421AF178();
      sub_24218E18C((uint64_t)&v16);
      sub_2421AFC88();
      sub_2421AF190();
      sub_2421AF280();
      sub_2421AFC94();
      v14 += 40;
      --v13;
    }
    while (v13);
    sub_2421AEF00();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  sub_2421AF0DC();
  sub_24219978C();
  sub_2421AEDF4();
  sub_242199304();
}

void sub_2421A98E0(uint64_t a1, void (**a2)(_QWORD, _QWORD, _QWORD))
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[2];
  void (**v20)(_QWORD, _QWORD, _QWORD);
  uint64_t v21;
  _BYTE v22[40];
  _BYTE v23[40];
  uint64_t v24;

  v4 = sub_2421AF430();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2543A66F0 != -1)
    swift_once();
  v8 = sub_2421AF940();
  sub_24218E28C(v8, (uint64_t)qword_2543A6B60);
  v9 = sub_2421AF928();
  v10 = sub_2421AFB98();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_24218A000, v9, v10, "requesting resource bundles", v11, 2u);
    MEMORY[0x2426A51D4](v11, -1, -1);
  }

  v12 = sub_2421AF58C();
  v21 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1 + OBJC_IVAR____TtCC19ModelCatalogRuntime20CatalogServiceServer6Server_sideloadURL, v4);
  sub_2421AF538();
  v15 = sub_2421AF550();
  v16 = *(_QWORD *)(v15 + 16);
  if (v16)
  {
    v19[0] = v12;
    v19[1] = v19;
    v20 = a2;
    v24 = MEMORY[0x24BEE4AF8];
    sub_2421AFCA0();
    sub_2421AF7F0();
    v17 = v15 + 32;
    do
    {
      sub_2421A2FC8(v17, (uint64_t)v23);
      sub_2421A2FC8((uint64_t)v23, (uint64_t)v22);
      sub_2421AF7E4();
      sub_242199198((uint64_t)v22, &qword_2571DF4A0);
      sub_24218E18C((uint64_t)v23);
      sub_2421AFC88();
      sub_2421AFCAC();
      sub_2421AFCB8();
      sub_2421AFC94();
      v17 += 40;
      --v16;
    }
    while (v16);
    swift_bridgeObjectRelease();
    a2 = v20;
    v12 = v19[0];
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  sub_2421AF7F0();
  v18 = (void *)sub_2421AFAF0();
  ((void (**)(_QWORD, void *, _QWORD))a2)[2](a2, v18, 0);
  swift_bridgeObjectRelease();

  (*(void (**)(char *, uint64_t))(v21 + 8))(v14, v12);
  _Block_release(a2);
}

void CatalogServiceServer.Server.resourceBundleContainers(with:)()
{
  NSObject *v0;
  os_log_type_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  os_log_type_t v8;
  _WORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[12];
  uint64_t v16;

  sub_242199548();
  v3 = v2;
  v5 = v4;
  sub_2421997A8();
  sub_2421AEE58();
  MEMORY[0x24BDAC7A8](v6);
  sub_2421AED7C();
  if (qword_2543A66F0 != -1)
    swift_once();
  v7 = sub_242199940();
  sub_24218E28C(v7, (uint64_t)qword_2543A6B60);
  sub_24219BCE4();
  v8 = sub_242199868();
  if (sub_2421A3F7C(v8))
  {
    v9 = (_WORD *)sub_24218D61C();
    sub_2421AF2F8(v9);
    sub_2421AEEDC(&dword_24218A000, v0, v1, "requesting resource bundles");
    sub_24218D600();
  }

  v10 = sub_2421AEE98();
  v15[4] = *(_QWORD *)(v10 - 8);
  v15[5] = v10;
  sub_242199348();
  MEMORY[0x24BDAC7A8](v11);
  sub_242199988();
  sub_2421AF06C(OBJC_IVAR____TtCC19ModelCatalogRuntime20CatalogServiceServer6Server_sideloadURL);
  sub_2421AF1B0();
  v12 = sub_2421AF550();
  v13 = *(_QWORD *)(v12 + 16);
  if (v13)
  {
    v15[1] = v15;
    v15[2] = v3;
    v15[3] = v5;
    sub_2421AF168(MEMORY[0x24BEE4AF8]);
    sub_2421AF7F0();
    v14 = v12 + 32;
    do
    {
      sub_2421AF22C();
      sub_2421AEE44();
      sub_2421AF7E4();
      sub_2421AF178();
      sub_24218E18C((uint64_t)&v16);
      sub_2421AFC88();
      sub_2421AF190();
      sub_2421AF280();
      sub_2421AFC94();
      v14 += 40;
      --v13;
    }
    while (v13);
    sub_2421AEF00();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  sub_2421AF0DC();
  sub_24219978C();
  sub_2421AEDF4();
  sub_242199304();
}

void sub_2421A9E48(void *a1, int a2, void *aBlock, void (*a4)(void))
{
  void *v6;
  id v7;

  v6 = _Block_copy(aBlock);
  _Block_copy(v6);
  v7 = a1;
  a4();
  _Block_release(v6);
  sub_2421AEEC4(v7);
}

void CatalogServiceServer.Server.sideload(resource:with:)()
{
  sub_2421AA0AC();
}

void sub_2421A9ED0()
{
  void (*v0)(id, uint64_t);
  void (*v1)(id, uint64_t);
  const char *v2;
  const char *v3;
  uint64_t (*v4)(void);
  uint64_t (*v5)(void);
  const void *v6;
  const void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  sub_2421AEF1C();
  v1 = v0;
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  if (qword_2543A66F0 != -1)
    swift_once();
  v12 = sub_242199940();
  v13 = (void *)sub_24218E28C(v12, (uint64_t)qword_2543A6B60);
  v14 = v11;
  v15 = sub_2421AF928();
  v16 = sub_2421AFB98();
  if (os_log_type_enabled(v15, v16))
  {
    v17 = (uint8_t *)sub_24218D61C();
    sub_24218D61C();
    *(_DWORD *)v17 = 136315138;
    v18 = v5();
    sub_2421AF20C(v18, v19, v20, v21, v22, v23);
    sub_2421AF298();
    sub_2421AEF78();

    sub_24219947C();
    sub_2421A4030(&dword_24218A000, v15, v16, v3, v17);
    sub_24219BC64();
    sub_24218D600();
  }

  v1(v14, v9 + OBJC_IVAR____TtCC19ModelCatalogRuntime20CatalogServiceServer6Server_sideloadURL);
  sub_2421AEDC0();
  v24 = sub_2421AEF38();
  sub_2421AEFD0(v24);

  _Block_release(v7);
  sub_2421AED94();
}

void CatalogServiceServer.Server.sideload(resourceBundle:with:)()
{
  sub_2421AA0AC();
}

void sub_2421AA0AC()
{
  uint64_t v0;
  void (*v1)(id, uint64_t);
  void (*v2)(id, uint64_t);
  const char *v3;
  const char *v4;
  uint64_t (*v5)(void);
  uint64_t (*v6)(void);
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  void *v13;
  uint8_t *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  sub_2421AEF1C();
  v2 = v1;
  v4 = v3;
  v6 = v5;
  v8 = v7;
  if (qword_2543A66F0 != -1)
    swift_once();
  v9 = sub_242199940();
  sub_24218E28C(v9, (uint64_t)qword_2543A6B60);
  v10 = v8;
  v11 = sub_2421AF928();
  v12 = sub_2421AFB98();
  v13 = (void *)v12;
  if (os_log_type_enabled(v11, v12))
  {
    v14 = (uint8_t *)sub_24218D61C();
    sub_24218D61C();
    *(_DWORD *)v14 = 136315138;
    v15 = v6();
    sub_2421AF20C(v15, v16, v17, v18, v19, v20);
    sub_2421AF110();
    sub_2421AFBEC();

    sub_24219947C();
    sub_2421A4030(&dword_24218A000, v11, (os_log_type_t)v13, v4, v14);
    sub_24219BC64();
    sub_24218D600();
  }

  v2(v10, v0 + OBJC_IVAR____TtCC19ModelCatalogRuntime20CatalogServiceServer6Server_sideloadURL);
  sub_2421AEDC0();
  v21 = sub_2421AEF38();
  sub_2421AF158(v21);

  sub_2421AED94();
}

void sub_2421AA27C(void *a1, int a2, void *a3, void *a4)
{
  void *v6;
  id v7;
  id v8;

  v6 = sub_2421AF35C((int)a1, a2, (int)a3, a4);
  _Block_copy(v6);
  v7 = a3;
  v8 = a1;
  sub_2421A9ED0();
  _Block_release(v6);

  sub_2421AEEA0(v8);
}

void CatalogServiceServer.Server.removeSideload(resource:with:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
  sub_2421AA558(a1, a2, a3, a4, (uint64_t)"remove sideload resource: %s", MEMORY[0x24BE687D8], a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26);
}

#error "2421AA384: call analysis failed (funcsize=32)"

void sub_2421AA3A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, unint64_t, uint64_t);
  void (*v30)(uint64_t, unint64_t, uint64_t);
  const char *v31;
  const char *v32;
  const void *v33;
  const void *v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  os_log_type_t v42;
  uint8_t *v43;
  uint64_t v44;

  sub_2421AEF1C();
  a25 = v27;
  a26 = v28;
  v30 = v29;
  v32 = v31;
  v34 = v33;
  v36 = v35;
  v38 = v37;
  v40 = v39;
  if (qword_2543A66F0 != -1)
    swift_once();
  v41 = sub_242199940();
  sub_2421AEDC8(v41, (uint64_t)qword_2543A6B60);
  sub_2421AF928();
  v42 = sub_24218D658();
  if (os_log_type_enabled(v26, v42))
  {
    v43 = (uint8_t *)sub_24218D61C();
    a13 = sub_24218D61C();
    *(_DWORD *)v43 = 136315138;
    sub_2421AF094();
    sub_2421A0BC4(v40, v38, &a13);
    sub_2421AF110();
    sub_2421AFBEC();
    sub_24219CBF0();
    sub_2421A4030(&dword_24218A000, v26, v42, v32, v43);
    sub_24219BC64();
    sub_24218D600();
  }

  sub_2421AEE20();
  v30(v40, v38, v36 + OBJC_IVAR____TtCC19ModelCatalogRuntime20CatalogServiceServer6Server_sideloadURL);
  sub_2421AEDC0();
  v44 = sub_2421AEF38();
  sub_2421AEFD0(v44);

  _Block_release(v34);
  sub_2421AED94();
}

void CatalogServiceServer.Server.removeSideload(resourceBundle:with:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
  sub_2421AA558(a1, a2, a3, a4, (uint64_t)"remove sideload resource bundle: %s", MEMORY[0x24BE687E8], a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22,
    a23,
    a24,
    a25,
    a26);
}

void sub_2421AA558(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
  NSObject *v26;
  os_log_type_t v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t, uint64_t, char *);
  void (*v31)(uint64_t, uint64_t, char *);
  const char *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  os_log_type_t v39;
  uint8_t *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;

  sub_2421AEF1C();
  a25 = v28;
  a26 = v29;
  v31 = v30;
  v33 = v32;
  v35 = v34;
  v37 = v36;
  if (qword_2543A66F0 != -1)
    swift_once();
  v38 = sub_242199940();
  sub_2421AEDC8(v38, (uint64_t)qword_2543A6B60);
  sub_2421AF928();
  v39 = sub_24218D658();
  if (sub_2421AEDB0(v39))
  {
    v40 = (uint8_t *)sub_24218D61C();
    a13 = sub_24218D61C();
    *(_DWORD *)v40 = 136315138;
    v41 = sub_2421AF094();
    sub_2421AF008(v41, v42, &a13);
    sub_2421AF298();
    sub_2421AEF78();
    sub_24219CBF0();
    sub_2421A4030(&dword_24218A000, v26, v27, v33, v40);
    sub_24219BC64();
    sub_24218D600();
  }

  sub_2421AEE20();
  v31(v37, v35, (char *)v26 + OBJC_IVAR____TtCC19ModelCatalogRuntime20CatalogServiceServer6Server_sideloadURL);
  sub_2421AEDC0();
  v43 = sub_2421AEF38();
  sub_2421AF158(v43);

  sub_2421AED94();
}

void sub_2421AA6FC(uint64_t a1, unint64_t a2, uint64_t a3, void (**a4)(_QWORD, _QWORD, _QWORD))
{
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;

  if (qword_2543A66F0 != -1)
    swift_once();
  v7 = sub_2421AF940();
  sub_24218E28C(v7, (uint64_t)qword_2543A6B60);
  swift_bridgeObjectRetain_n();
  v8 = sub_2421AF928();
  v9 = sub_2421AFB98();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc();
    v11 = swift_slowAlloc();
    v19 = v11;
    *(_DWORD *)v10 = 136315138;
    swift_bridgeObjectRetain();
    sub_2421A0BC4(a1, a2, &v19);
    v18 = v12;
    sub_2421AFBEC();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_24218A000, v8, v9, "requesting availability information for: %s", v10, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2426A51D4](v11, -1, -1);
    MEMORY[0x2426A51D4](v10, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v13 = sub_2421AF67C();
  MEMORY[0x24BDAC7A8](v13);
  (*(void (**)(char *, _QWORD))(v15 + 104))((char *)&v18 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), *MEMORY[0x24BE68428]);
  v16 = objc_allocWithZone((Class)sub_2421AF694());
  v17 = (void *)sub_2421AF688();
  ((void (**)(_QWORD, void *, _QWORD))a4)[2](a4, v17, 0);

  _Block_release(a4);
}

void CatalogServiceServer.Server.resourceStatus(identifier:with:)()
{
  void (*v0)(void *, _QWORD);
  void (*v1)(void *, _QWORD);
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
  id v12;
  void *v13;
  uint64_t v14;

  sub_242199548();
  v1 = v0;
  v3 = v2;
  if (qword_2543A66F0 != -1)
    swift_once();
  v4 = sub_242199940();
  v5 = sub_24218E28C(v4, (uint64_t)qword_2543A6B60);
  sub_2421AEE18();
  sub_2421AF928();
  v6 = sub_24218D658();
  if (sub_2421AF264(v5))
  {
    v7 = (uint8_t *)sub_24218D61C();
    v14 = sub_24218D61C();
    *(_DWORD *)v7 = 136315138;
    sub_242199520();
    sub_2421AF014(v3, v8, &v14);
    sub_2421AEF94(v9);
    sub_2421AEF78();
    sub_24219CBF0();
    sub_2421A4030(&dword_24218A000, v5, v6, "requesting availability information for: %s", v7);
    sub_24219BC64();
    sub_24218D600();
  }

  sub_2421AEE20();
  v10 = sub_2421AF67C();
  MEMORY[0x24BDAC7A8](v10);
  sub_2421A413C();
  (*(void (**)(NSObject *, _QWORD))(v11 + 104))(v5, *MEMORY[0x24BE68428]);
  v12 = objc_allocWithZone((Class)sub_2421AF694());
  v13 = (void *)sub_2421AF688();
  v1(v13, 0);

  sub_242199304();
}

void sub_2421AAB00(unint64_t a1, unint64_t a2, uint64_t a3, void (**a4)(_QWORD, id, _QWORD))
{
  uint64_t v8;
  uint64_t v9;
  uint8_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  const char *v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  _BOOL4 v20;
  uint8_t *v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char v45;
  char *v46;
  char *v47;
  void (**v48)(char *, uint64_t);
  void (*v49)(char *, uint64_t);
  uint64_t v50;
  void (*v51)(char *, uint64_t);
  uint64_t v52;
  id v53;
  id v54;
  NSObject *v55;
  os_log_type_t v56;
  uint64_t v57;
  uint8_t *v58;
  uint64_t v59;
  id v60;
  uint64_t v61;
  unint64_t v62;
  unint64_t v63;
  uint64_t v64;
  uint8_t *v65;
  const void *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void (**v70)(char *, uint64_t);
  uint64_t v71;
  uint64_t (*v72)();
  char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  char isUniquelyReferenced_nonNull_native;
  id v78;
  id v79;
  NSObject *v80;
  os_log_type_t v81;
  uint8_t *v82;
  id v83;
  uint64_t v84;
  uint64_t v85;
  unint64_t v86;
  unint64_t v87;
  uint64_t v88;
  char *v89;
  id v90;
  id v91;
  NSObject *v92;
  os_log_type_t v93;
  uint8_t *v94;
  uint64_t v95;
  uint64_t v96;
  id v97;
  uint64_t v98;
  unint64_t v99;
  unint64_t v100;
  uint64_t v101;
  uint64_t v102;
  const void *v103;
  void (**v104)(char *, uint64_t);
  void (**v105)(char *, uint64_t);
  uint64_t v106;
  uint64_t v107;
  void (**v108)(_QWORD, id, _QWORD);
  uint64_t v109;
  uint8_t *v110;
  char *v111;
  char *v112;
  void (**v113)(char *, uint64_t);
  uint64_t v114;
  uint64_t v115;
  _QWORD v116[5];
  __int128 v117;
  __int128 v118;
  uint64_t v119;
  uint64_t v120[6];
  unint64_t v121;
  unint64_t v122;

  v8 = sub_24218D500(&qword_2543A67E8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (uint8_t *)&v106 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_2421AF430();
  v113 = *(void (***)(char *, uint64_t))(v11 - 8);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v111 = (char *)&v106 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v112 = (char *)&v106 - v14;
  if (a1 == 0xD000000000000028 && a2 == 0x80000002421B1ED0 || (sub_2421AFD54() & 1) != 0)
  {
    v15 = 0xD000000000000027;
    v16 = "com.apple.if.planner.nlrouter.tokenizer";
LABEL_5:
    v121 = v15;
    v122 = (unint64_t)(v16 - 32) | 0x8000000000000000;
    goto LABEL_6;
  }
  if (a1 == 0xD000000000000023 && a2 == 0x80000002421B1F00 || (sub_2421AFD54() & 1) != 0)
  {
    v15 = 0xD000000000000022;
    v16 = "com.apple.if.planner.nlrouter.base";
    goto LABEL_5;
  }
  v121 = a1;
  v122 = a2;
  swift_bridgeObjectRetain();
LABEL_6:
  if (qword_2543A66F0 != -1)
    swift_once();
  v17 = sub_2421AF940();
  v109 = sub_24218E28C(v17, (uint64_t)qword_2543A6B60);
  v18 = sub_2421AF928();
  v19 = sub_2421AFB98();
  v20 = os_log_type_enabled(v18, v19);
  v108 = a4;
  v115 = v11;
  v110 = v10;
  v107 = a3;
  if (v20)
  {
    v21 = (uint8_t *)swift_slowAlloc();
    v22 = swift_slowAlloc();
    v120[0] = v22;
    *(_DWORD *)v21 = 136315138;
    swift_beginAccess();
    v24 = v121;
    v23 = v122;
    swift_bridgeObjectRetain();
    sub_2421A0BC4(v24, v23, v120);
    *(_QWORD *)&v117 = v25;
    sub_2421AFBEC();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24218A000, v18, v19, "requesting resource information for: %s", v21, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2426A51D4](v22, -1, -1);
    MEMORY[0x2426A51D4](v21, -1, -1);
  }

  v114 = sub_2421AF9F4();
  v26 = sub_2421AF6C4();
  v27 = *(_QWORD *)(v26 - 8);
  MEMORY[0x24BDAC7A8](v26);
  v29 = (char *)&v106 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = sub_24218D500(&qword_2543A6800);
  MEMORY[0x24BDAC7A8](v30);
  v32 = (char *)&v106 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_2421AF730();
  swift_bridgeObjectRelease();
  if (sub_24218E0BC((uint64_t)v32, 1, v26) == 1)
  {
    sub_242199198((uint64_t)v32, &qword_2543A6800);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v27 + 32))(v29, v32, v26);
    v33 = v112;
    sub_2421AF6AC();
    sub_2421AF400();
    v113[1](v33, v115);
    v34 = v114;
    swift_isUniquelyReferenced_nonNull_native();
    v120[0] = v34;
    sub_2421AE7A8();
    v35 = v120[0];
    swift_bridgeObjectRelease();
    sub_2421AF6B8();
    swift_isUniquelyReferenced_nonNull_native();
    v120[0] = v35;
    sub_2421AE7A8();
    v36 = v120[0];
    swift_bridgeObjectRelease();
    sub_2421AF6A0();
    swift_isUniquelyReferenced_nonNull_native();
    v120[0] = v36;
    sub_2421AE7A8();
    v114 = v120[0];
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v27 + 8))(v29, v26);
  }
  v37 = sub_2421AF4FC();
  v38 = *(_QWORD *)(v37 + 16);
  if (v38)
  {
    v39 = (_QWORD *)(v37 + 32);
    while (1)
    {
      v40 = v39[3];
      v41 = v39[4];
      sub_242198260(v39, v40);
      v42 = MEMORY[0x2426A458C](v40, v41);
      if (v42 == v121 && v43 == v122)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        goto LABEL_31;
      }
      v45 = sub_2421AFD54();
      swift_bridgeObjectRelease();
      if ((v45 & 1) != 0)
        break;
      v39 += 5;
      if (!--v38)
        goto LABEL_25;
    }
    swift_bridgeObjectRelease();
LABEL_31:
    v67 = sub_2421AF58C();
    v68 = *(_QWORD *)(v67 - 8);
    MEMORY[0x24BDAC7A8](v67);
    v70 = (void (**)(char *, uint64_t))((char *)&v106 - ((v69 + 15) & 0xFFFFFFFFFFFFFFF0));
    v71 = v115;
    ((void (*)(char *, uint64_t, uint64_t))v113[2])(v112, v107 + OBJC_IVAR____TtCC19ModelCatalogRuntime20CatalogServiceServer6Server_sideloadURL, v115);
    sub_2421AF538();
    swift_bridgeObjectRetain();
    v113 = v70;
    sub_2421AF574();
    swift_bridgeObjectRelease();
    if (v116[3])
    {
      sub_24218D500(&qword_2543A67F8);
      sub_24218D500(&qword_2543A6808);
      v72 = swift_allocError;
      if ((swift_dynamicCast() & 1) != 0)
      {
        if (*((_QWORD *)&v118 + 1))
        {
          sub_24219BA44(&v117, (uint64_t)v120);
          v73 = (char *)sub_2421970C0(v120);
          v74 = sub_2421AF7A8();
          if (!v74)
            v74 = sub_2421AF9F4();
          v75 = v74;
          v76 = v114;
          v115 = v68;
          swift_bridgeObjectRetain();
          isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          *(_QWORD *)&v117 = v75;
          sub_2421AE8F4(v76, (uint64_t)sub_2421AEB00, 0, isUniquelyReferenced_nonNull_native, &v117);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_2421AF790();
          v78 = objc_allocWithZone((Class)sub_2421AF7B4());
          v79 = (id)sub_2421AF79C();
          v80 = sub_2421AF928();
          v81 = sub_2421AFB98();
          if (os_log_type_enabled(v80, v81))
          {
            v112 = v73;
            v82 = (uint8_t *)swift_slowAlloc();
            v111 = (char *)swift_slowAlloc();
            *(_QWORD *)&v117 = v111;
            *(_DWORD *)v82 = 136315138;
            v110 = v82 + 4;
            v83 = objc_msgSend(v79, sel_debugDescription);
            v84 = sub_2421AFA90();
            v114 = v67;
            v85 = v84;
            v87 = v86;

            v73 = v112;
            sub_2421A0BC4(v85, v87, (uint64_t *)&v117);
            v116[0] = v88;
            sub_2421AFBEC();

            swift_bridgeObjectRelease();
            _os_log_impl(&dword_24218A000, v80, v81, "Resource Info is: %s", v82, 0xCu);
            v67 = v114;
            v89 = v111;
            swift_arrayDestroy();
            MEMORY[0x2426A51D4](v89, -1, -1);
            MEMORY[0x2426A51D4](v82, -1, -1);

          }
          else
          {

          }
          v103 = v108;
          v105 = v113;
          v108[2](v108, v79, 0);

          sub_24218E18C((uint64_t)v120);
          (*(void (**)(_QWORD, uint64_t))(v115 + 8))(v105, v67);
          goto LABEL_44;
        }
      }
      else
      {
        v119 = 0;
        v117 = 0u;
        v118 = 0u;
      }
    }
    else
    {
      sub_242199198((uint64_t)v116, (uint64_t *)&unk_2543A6918);
      v117 = 0u;
      v118 = 0u;
      v119 = 0;
      v72 = swift_allocError;
    }
    sub_242199198((uint64_t)&v117, &qword_2543A6A68);
    sub_24218D5C8((uint64_t)v110, 1, 1, v71);
    v90 = objc_allocWithZone((Class)sub_2421AF7B4());
    v91 = (id)sub_2421AF79C();
    v92 = sub_2421AF928();
    v93 = sub_2421AFB98();
    if (os_log_type_enabled(v92, v93))
    {
      v94 = (uint8_t *)swift_slowAlloc();
      v95 = swift_slowAlloc();
      v115 = v68;
      v96 = v95;
      v120[0] = v95;
      *(_DWORD *)v94 = *((_QWORD *)v72 + 140);
      v112 = (char *)(v94 + 4);
      v97 = objc_msgSend(v91, sel_debugDescription);
      v98 = sub_2421AFA90();
      v114 = v67;
      v100 = v99;

      sub_2421A0BC4(v98, v100, v120);
      *(_QWORD *)&v117 = v101;
      sub_2421AFBEC();

      v67 = v114;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_24218A000, v92, v93, "Resource Info is: %s", v94, 0xCu);
      swift_arrayDestroy();
      v102 = v96;
      v68 = v115;
      MEMORY[0x2426A51D4](v102, -1, -1);
      MEMORY[0x2426A51D4](v94, -1, -1);

    }
    else
    {

    }
    v103 = v108;
    v104 = v113;
    v108[2](v108, v91, 0);

    (*(void (**)(_QWORD, uint64_t))(v68 + 8))(v104, v67);
LABEL_44:
    swift_bridgeObjectRelease();
    _Block_release(v103);
    return;
  }
LABEL_25:
  swift_bridgeObjectRelease();
  v46 = v112;
  sub_2421AF850();
  swift_bridgeObjectRetain();
  v47 = v111;
  sub_2421AF418();
  swift_bridgeObjectRelease();
  v48 = v113;
  v49 = v113[1];
  v50 = v115;
  v49(v46, v115);
  v51 = v48[2];
  v52 = (uint64_t)v110;
  ((void (*)(uint8_t *, char *, uint64_t))v51)(v110, v47, v50);
  sub_24218D5C8(v52, 0, 1, v50);
  v53 = objc_allocWithZone((Class)sub_2421AF7B4());
  v54 = (id)sub_2421AF79C();
  v55 = sub_2421AF928();
  v56 = sub_2421AFB98();
  if (os_log_type_enabled(v55, v56))
  {
    v57 = swift_slowAlloc();
    v114 = (uint64_t)v49;
    v58 = (uint8_t *)v57;
    v59 = swift_slowAlloc();
    v120[0] = v59;
    *(_DWORD *)v58 = 136315138;
    v60 = objc_msgSend(v54, sel_debugDescription);
    v61 = sub_2421AFA90();
    v63 = v62;

    sub_2421A0BC4(v61, v63, v120);
    *(_QWORD *)&v117 = v64;
    sub_2421AFBEC();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_24218A000, v55, v56, "Resource Info is: %s", v58, 0xCu);
    swift_arrayDestroy();
    v50 = v115;
    MEMORY[0x2426A51D4](v59, -1, -1);
    v65 = v58;
    v49 = (void (*)(char *, uint64_t))v114;
    MEMORY[0x2426A51D4](v65, -1, -1);

  }
  else
  {

  }
  v66 = v108;
  v108[2](v108, v54, 0);

  v49(v111, v50);
  swift_bridgeObjectRelease();
  _Block_release(v66);
}

void CatalogServiceServer.Server.resourceInformation(identifier:with:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  const char *v18;
  uint64_t v19;
  os_log_type_t v20;
  _BOOL4 v21;
  uint8_t *v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD *v36;
  uint64_t v37;
  NSObject *v38;
  uint64_t v39;
  uint64_t v40;
  char v42;
  NSObject *v43;
  void *v44;
  uint8_t *v45;
  uint64_t v46;
  void (*v47)(NSObject *, void *);
  void (*v48)(void *, uint8_t *, void *);
  void *v49;
  id v50;
  id v51;
  os_log_type_t v52;
  uint8_t *v53;
  uint64_t v54;
  id v55;
  uint64_t v56;
  unint64_t v57;
  unint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char v66;
  void *v67;
  void *v68;
  NSObject *v69;
  id v70;
  os_log_type_t v71;
  uint8_t *v72;
  uint64_t v73;
  id v74;
  uint64_t v75;
  unint64_t v76;
  unint64_t v77;
  uint64_t v78;
  void *v79;
  id v80;
  id v81;
  os_log_type_t v82;
  uint8_t *v83;
  uint64_t v84;
  id v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  _QWORD v89[4];
  void *v90;
  uint8_t *v91;
  NSObject *v92;
  uint64_t v93;
  void *v94;
  uint64_t v95;
  _QWORD v96[5];
  __int128 v97;
  __int128 v98;
  uint64_t v99;
  uint64_t v100[9];
  unint64_t v101;
  unint64_t v102;

  sub_242199548();
  v1 = v0;
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  sub_24218D500(&qword_2543A67E8);
  sub_2421992E8();
  MEMORY[0x24BDAC7A8](v10);
  sub_242199AB8();
  v90 = (void *)v11;
  v12 = sub_2421997A8();
  v93 = *(_QWORD *)(v12 - 8);
  sub_242199348();
  MEMORY[0x24BDAC7A8](v13);
  sub_24218D690();
  v91 = v14;
  MEMORY[0x24BDAC7A8](v15);
  v92 = ((char *)v89 - v16);
  if (v9 == 0xD000000000000028 && v7 == 0x80000002421B1ED0
    || (sub_2421AF26C(), (sub_2421AF25C() & 1) != 0))
  {
    v17 = 0xD000000000000027;
    v18 = "com.apple.if.planner.nlrouter.tokenizer";
LABEL_5:
    v101 = v17;
    v102 = (unint64_t)(v18 - 32) | 0x8000000000000000;
    goto LABEL_6;
  }
  if (v9 == 0xD000000000000023 && v7 == 0x80000002421B1F00
    || (sub_2421AF26C(), (sub_2421AF25C() & 1) != 0))
  {
    v17 = 0xD000000000000022;
    v18 = "com.apple.if.planner.nlrouter.base";
    goto LABEL_5;
  }
  v101 = v9;
  v102 = (unint64_t)v7;
  swift_bridgeObjectRetain();
LABEL_6:
  v94 = (void *)v12;
  if (qword_2543A66F0 != -1)
    swift_once();
  v19 = sub_242199940();
  v89[3] = sub_24218E28C(v19, (uint64_t)qword_2543A6B60);
  sub_24219BCE4();
  v20 = sub_242199868();
  v21 = os_log_type_enabled(v7, v20);
  v89[2] = v5;
  v89[1] = v3;
  v89[0] = v1;
  if (v21)
  {
    v22 = (uint8_t *)sub_24218D61C();
    v100[0] = sub_24218D61C();
    *(_DWORD *)v22 = 136315138;
    sub_2421AF244();
    v24 = v101;
    v23 = v102;
    swift_bridgeObjectRetain();
    sub_2421A0BC4(v24, v23, v100);
    sub_2421AEF80(v25);
    sub_2421AFBEC();
    sub_242199434();
    sub_2421A4030(&dword_24218A000, v7, v20, "requesting resource information for: %s", v22);
    sub_24219BC64();
    sub_24218D600();
  }

  v26 = v94;
  v95 = sub_2421AF9F4();
  v27 = sub_2421AF6C4();
  v28 = *(_QWORD *)(v27 - 8);
  MEMORY[0x24BDAC7A8](v27);
  sub_2421AEE80();
  sub_24218D500(&qword_2543A6800);
  sub_2421992E8();
  MEMORY[0x24BDAC7A8](v29);
  sub_2421995E0();
  sub_2421AF244();
  swift_bridgeObjectRetain();
  sub_2421AF730();
  swift_bridgeObjectRelease();
  if (sub_24218E0BC((uint64_t)v7, 1, v27) == 1)
  {
    sub_242199198((uint64_t)v7, &qword_2543A6800);
  }
  else
  {
    (*(void (**)(uint64_t, NSObject *, uint64_t))(v28 + 32))(v1, v7, v27);
    v30 = (uint64_t)v92;
    sub_2421AF6AC();
    sub_2421AF400();
    sub_2421AEEE8(v30, *(uint64_t (**)(uint64_t, uint64_t))(v93 + 8));
    v31 = v95;
    swift_isUniquelyReferenced_nonNull_native();
    v100[0] = v31;
    sub_2421AE7A8();
    v32 = v100[0];
    sub_242199A00();
    sub_2421AF6B8();
    sub_2421AF0D4();
    v100[0] = v32;
    sub_2421AF2E0();
    sub_2421AE7A8();
    v33 = v100[0];
    sub_242199A00();
    sub_2421AF6A0();
    sub_2421AF0D4();
    v100[0] = v33;
    sub_2421AF2E0();
    sub_2421AE7A8();
    v95 = v100[0];
    sub_242199A00();
    (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v1, v27);
  }
  v34 = sub_2421AF4FC();
  v35 = *(_QWORD *)(v34 + 16);
  if (v35)
  {
    v36 = (_QWORD *)(v34 + 32);
    while (1)
    {
      v37 = v36[3];
      v38 = v36[4];
      sub_242198260(v36, v37);
      v39 = MEMORY[0x2426A458C](v37, v38);
      if (v39 == v101 && v40 == v102)
      {
        sub_2421993A4();
        sub_2421AF1A8();
        goto LABEL_30;
      }
      v42 = sub_2421AF25C();
      sub_2421AF1A8();
      if ((v42 & 1) != 0)
        break;
      v36 += 5;
      if (!--v35)
        goto LABEL_25;
    }
    sub_2421993A4();
LABEL_30:
    v60 = sub_2421AEE98();
    sub_2421AEFA8();
    MEMORY[0x24BDAC7A8](v61);
    sub_2421AEE68();
    (*(void (**)(NSObject *, uint64_t, void *))(v93 + 16))(v92, v89[0] + OBJC_IVAR____TtCC19ModelCatalogRuntime20CatalogServiceServer6Server_sideloadURL, v26);
    sub_2421AF538();
    swift_bridgeObjectRetain();
    sub_2421AF574();
    sub_2421AF1A8();
    if (v96[3])
    {
      sub_24218D500(&qword_2543A67F8);
      sub_24218D500(&qword_2543A6808);
      if ((sub_2421AEFE8() & 1) != 0)
      {
        if (*((_QWORD *)&v98 + 1))
        {
          sub_24219BA44(&v97, (uint64_t)v100);
          v62 = (void *)sub_2421970C0(v100);
          v63 = sub_2421AF7A8();
          if (!v63)
            v63 = sub_2421AF9F4();
          v64 = v63;
          v65 = v95;
          v95 = v35;
          swift_bridgeObjectRetain();
          v66 = sub_2421AF0D4();
          *(_QWORD *)&v97 = v64;
          sub_2421AE8F4(v65, (uint64_t)sub_2421AEB00, 0, v66, &v97);
          v67 = (void *)v97;
          sub_242199A00();
          sub_24219947C();
          v68 = v90;
          sub_2421AF790();
          v69 = objc_allocWithZone((Class)sub_2421AF7B4());
          v70 = (id)sub_2421AF79C();
          sub_2421AEF0C();
          v71 = sub_24218D658();
          if (os_log_type_enabled(v69, v71))
          {
            v72 = (uint8_t *)sub_24218D61C();
            v73 = sub_24218D61C();
            v92 = v73;
            *(_QWORD *)&v97 = v73;
            v94 = v62;
            *(_DWORD *)v72 = 136315138;
            v91 = v72 + 4;
            v74 = sub_2421AF1DC(v73, sel_debugDescription);
            v75 = sub_2421AFA90();
            v93 = v60;
            v77 = v76;

            sub_2421A0BC4(v75, v77, (uint64_t *)&v97);
            v96[0] = v78;
            sub_2421AFBEC();

            swift_bridgeObjectRelease();
            sub_2421A4030(&dword_24218A000, v69, v71, "Resource Info is: %s", v72);
            sub_24219BC64();
            sub_24218D600();
          }

          sub_2421AEE04();
          sub_2421AEF4C();

          sub_24218E18C((uint64_t)v100);
          (*(void (**)(NSObject *, uint64_t))(v95 + 8))(v38, v60);
LABEL_42:
          swift_bridgeObjectRelease();
          goto LABEL_43;
        }
      }
      else
      {
        v99 = 0;
        v97 = 0u;
        v98 = 0u;
      }
    }
    else
    {
      sub_242199198((uint64_t)v96, (uint64_t *)&unk_2543A6918);
      v97 = 0u;
      v98 = 0u;
      v99 = 0;
    }
    v94 = v38;
    sub_242199198((uint64_t)&v97, &qword_2543A6A68);
    v79 = v90;
    v80 = objc_allocWithZone((Class)sub_2421AF1F0((uint64_t)v90, 1));
    v81 = (id)sub_2421AF09C();
    sub_2421AEF0C();
    v82 = sub_24218D658();
    if (sub_24219BB3C(v82))
    {
      v83 = (uint8_t *)sub_24218D61C();
      v84 = sub_24218D61C();
      v95 = v35;
      v100[0] = v84;
      v93 = v60;
      *(_DWORD *)v83 = 136315138;
      v92 = (v83 + 4);
      v85 = sub_2421AF1DC(v84, sel_debugDescription);
      v86 = sub_2421AFA90();

      sub_2421AF014(v86, v87, v100);
      sub_2421AEF80(v88);
      sub_2421AFBEC();

      sub_2421993A4();
      sub_2421A4030(&dword_24218A000, v38, (os_log_type_t)v38, "Resource Info is: %s", v83);
      sub_24219BC64();
      sub_24218D600();
    }

    sub_2421AEE04();
    sub_2421AEF4C();

    (*(void (**)(void *, uint64_t))(v35 + 8))(v94, v60);
    goto LABEL_42;
  }
LABEL_25:
  sub_2421993A4();
  v43 = v92;
  sub_2421AF850();
  v44 = (void *)v102;
  sub_2421AF094();
  v45 = v91;
  sub_2421AF418();
  sub_2421A4070();
  v46 = v93;
  v47 = *(void (**)(NSObject *, void *))(v93 + 8);
  v47(v43, v26);
  v48 = *(void (**)(void *, uint8_t *, void *))(v46 + 16);
  v49 = v90;
  v48(v90, v45, v26);
  v50 = objc_allocWithZone((Class)sub_2421AF1F0((uint64_t)v49, 0));
  v51 = (id)sub_2421AF09C();
  sub_2421AEF0C();
  v52 = sub_24218D658();
  if (os_log_type_enabled(v43, v52))
  {
    v53 = (uint8_t *)sub_24218D61C();
    v54 = sub_24218D61C();
    v100[0] = v54;
    v95 = (uint64_t)v47;
    *(_DWORD *)v53 = 136315138;
    v55 = sub_2421AF1DC(v54, sel_debugDescription);
    v56 = sub_2421AFA90();
    v58 = v57;

    sub_2421A0BC4(v56, v58, v100);
    sub_2421AEF80(v59);
    sub_2421AFBEC();

    swift_bridgeObjectRelease();
    sub_2421A4030(&dword_24218A000, v43, v52, "Resource Info is: %s", v53);
    sub_24219BC64();
    sub_24218D600();
  }

  sub_2421AEE04();
  sub_2421AEF4C();

  v47(v91, v26);
  swift_bridgeObjectRelease();
LABEL_43:
  sub_242199304();
}

uint64_t sub_2421AC934(void *a1, int a2, int a3, void *a4, void (*a5)(uint64_t, uint64_t, id, void *))
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v7 = sub_2421AF35C((int)a1, a2, a3, a4);
  v8 = sub_2421AFA90();
  v10 = v9;
  _Block_copy(v7);
  v11 = a1;
  a5(v8, v10, v11, v7);
  _Block_release(v7);

  return sub_2421AEEB4();
}

void sub_2421AC9A8(uint64_t a1, void (**a2)(_QWORD, _QWORD, _QWORD))
{
  void *v3;

  static ModelCatalogDaemon.isEssentialResourcesReady(sideLoadUrl:)();
  sub_2421AE5BC();
  v3 = (void *)sub_2421AFBC8();
  ((void (**)(_QWORD, void *, _QWORD))a2)[2](a2, v3, 0);

  _Block_release(a2);
}

void CatalogServiceServer.Server.isGenerativeExperiencesEssentialResourcesReady(with:)(void (*a1)(void *, _QWORD))
{
  void *v2;

  static ModelCatalogDaemon.isEssentialResourcesReady(sideLoadUrl:)();
  sub_2421AEDC0();
  v2 = (void *)sub_2421AFBC8();
  a1(v2, 0);
  sub_2421AEEA0(v2);
}

uint64_t CatalogServiceServer.Server.generativeExperiencesEssentialResourcesReady(with:)(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  id v11;

  sub_24218D500(&qword_2543A6998);
  sub_2421992E8();
  MEMORY[0x24BDAC7A8](v6);
  sub_2421A4018();
  v7 = sub_2421AFB38();
  sub_2421AF28C(v3, v8, v9, v7);
  v10 = (_QWORD *)swift_allocObject();
  v10[2] = 0;
  v10[3] = 0;
  v10[4] = v2;
  v10[5] = a1;
  v10[6] = a2;
  v11 = v2;
  swift_retain();
  sub_2421ACD40(v3, (uint64_t)&unk_2571DF4B0, (uint64_t)v10);
  return swift_release();
}

uint64_t sub_2421ACBC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;
  _QWORD *v8;

  v6[2] = a5;
  v6[3] = a6;
  v7 = a4 + OBJC_IVAR____TtCC19ModelCatalogRuntime20CatalogServiceServer6Server_sideloadURL;
  v8 = (_QWORD *)swift_task_alloc();
  v6[4] = v8;
  *v8 = v6;
  v8[1] = sub_2421ACC24;
  return static ModelCatalogDaemon.essentialResourcesReady(sideLoadUrl:waitForSystemReadiness:)(v7);
}

uint64_t sub_2421ACC24(char a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 40) = v1;
  swift_task_dealloc();
  if (!v1)
    *(_BYTE *)(v4 + 48) = a1 & 1;
  return swift_task_switch();
}

uint64_t sub_2421ACC9C()
{
  uint64_t v0;
  void (*v1)(void *, _QWORD);
  void *v2;

  v1 = *(void (**)(void *, _QWORD))(v0 + 16);
  sub_2421AEDC0();
  v2 = (void *)sub_2421AFBC8();
  v1(v2, 0);

  return sub_2421AEEF0(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_2421ACCF0()
{
  uint64_t v0;
  void *v1;
  void (*v2)(_QWORD, void *);
  void *v3;

  v1 = *(void **)(v0 + 40);
  v2 = *(void (**)(_QWORD, void *))(v0 + 16);
  v3 = (void *)sub_2421AF3E8();
  v2(0, v3);

  return sub_2421AEEF0(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_2421ACD40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_2421AFB38();
  if (sub_24218E0BC(a1, 1, v6) == 1)
  {
    sub_242199198(a1, &qword_2543A6998);
  }
  else
  {
    sub_2421AFB2C();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(a1, v6);
  }
  if (*(_QWORD *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2421AFB14();
    swift_unknownObjectRelease();
  }
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a2;
  *(_QWORD *)(v7 + 24) = a3;
  return swift_task_create();
}

void sub_2421ACEF0(uint64_t a1, void (**a2)(_QWORD, void *, _QWORD))
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  int64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  void (*v23)(char *, uint64_t);
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  int64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t *v55;
  int64_t v56;
  unint64_t v57;
  unint64_t i;
  int64_t v59;
  unint64_t v60;
  int64_t v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  int v76;
  void *v77;
  const void *v78;
  uint64_t v79;
  char *v80;
  uint64_t v81;
  uint64_t v82;
  void (**v83)(_QWORD, void *, _QWORD);
  uint64_t v84;
  uint64_t v85;
  char *v86;
  int64_t v87;
  char *v88;
  uint64_t *v89;
  uint64_t v90;
  int64_t v91;
  uint64_t *v92;
  __int128 v93;
  __int128 v94;
  uint64_t v95;
  __int128 v96[2];
  __int128 v97;
  uint64_t v98;
  uint64_t v99;

  v83 = a2;
  v3 = sub_2421AF430();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v79 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v82 = sub_2421AF58C();
  v81 = *(_QWORD *)(v82 - 8);
  MEMORY[0x24BDAC7A8](v82);
  v8 = (char *)&v79 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, a1 + OBJC_IVAR____TtCC19ModelCatalogRuntime20CatalogServiceServer6Server_sideloadURL, v3);
  sub_2421AF538();
  v80 = v8;
  v9 = sub_2421AF580();
  v10 = v9;
  v11 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)&v93 = MEMORY[0x24BEE4AF8];
  v86 = *(char **)(v9 + 16);
  if (v86)
  {
    v12 = 0;
    v85 = v9 + 32;
    v84 = v9;
    while (1)
    {
      if ((unint64_t)v12 >= *(_QWORD *)(v10 + 16))
        goto LABEL_74;
      sub_2421A2FC8(v85 + 40 * (_QWORD)v12, (uint64_t)&v97);
      sub_242198260(&v97, v98);
      v13 = sub_2421AF5BC();
      v14 = sub_2421AF838();
      v89 = &v79;
      v15 = *(_QWORD *)(v14 - 8);
      v16 = *(_QWORD *)(v15 + 64);
      MEMORY[0x24BDAC7A8](v14);
      v17 = (char *)&v79 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
      v18 = (*(uint64_t (**)(char *, _QWORD, uint64_t))(v15 + 104))(v17, *MEMORY[0x24BE687A0], v14);
      MEMORY[0x24BDAC7A8](v18);
      v20 = *(_QWORD *)(v13 + 16);
      v90 = v13;
      if (v20)
      {
        v87 = v19;
        v88 = v12;
        v21 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
        v92 = *(uint64_t **)(v15 + 16);
        ((void (*)(char *, unint64_t, uint64_t))v92)(v17, v13 + v21, v14);
        sub_242199250((unint64_t *)&qword_2543A6980, (uint64_t (*)(uint64_t))MEMORY[0x24BE687A8], MEMORY[0x24BE687B0]);
        v22 = sub_2421AFA0C();
        v23 = *(void (**)(char *, uint64_t))(v15 + 8);
        v23(v17, v14);
        if ((v22 & 1) != 0)
        {
LABEL_6:
          v23(v17, v14);
          swift_bridgeObjectRelease();
          sub_24219BA44(&v97, (uint64_t)v96);
          v24 = v93;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_2421A2FAC(0, *(_QWORD *)(v24 + 16) + 1, 1);
            v24 = v93;
          }
          v26 = *(_QWORD *)(v24 + 16);
          v25 = *(_QWORD *)(v24 + 24);
          v12 = v88;
          if (v26 >= v25 >> 1)
          {
            sub_2421A2FAC((char *)(v25 > 1), v26 + 1, 1);
            v24 = v93;
          }
          *(_QWORD *)(v24 + 16) = v26 + 1;
          sub_24219BA44(v96, v24 + 40 * v26 + 32);
          v10 = v84;
          goto LABEL_19;
        }
        if (v20 != 1)
        {
          v91 = *(_QWORD *)(v15 + 72);
          v27 = v90 + v91 + v21;
          v28 = 1;
          while (1)
          {
            ((void (*)(char *, unint64_t, uint64_t))v92)(v17, v27, v14);
            v29 = v28 + 1;
            if (__OFADD__(v28, 1))
              break;
            v30 = sub_2421AFA0C();
            v23(v17, v14);
            if ((v30 & 1) != 0)
              goto LABEL_6;
            ++v28;
            v27 += v91;
            if (v29 == v20)
              goto LABEL_17;
          }
          __break(1u);
LABEL_74:
          __break(1u);
LABEL_75:
          __break(1u);
          goto LABEL_76;
        }
LABEL_17:
        v10 = v84;
        v12 = v88;
        v23(v17, v14);
      }
      else
      {
        (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
      }
      swift_bridgeObjectRelease();
      sub_24218E18C((uint64_t)&v97);
LABEL_19:
      if (++v12 == v86)
      {
        v11 = v93;
        break;
      }
    }
  }
  swift_bridgeObjectRelease();
  v31 = *(_QWORD *)(v11 + 16);
  if (v31)
  {
    v32 = v11 + 32;
    swift_retain();
    v33 = MEMORY[0x24BEE4AF8];
    do
    {
      sub_2421A2FC8(v32, (uint64_t)&v97);
      sub_2421A2FC8((uint64_t)&v97, (uint64_t)v96);
      sub_24218D500(&qword_2543A67F8);
      sub_24218D500(&qword_2543A6808);
      if ((swift_dynamicCast() & 1) == 0)
      {
        v95 = 0;
        v93 = 0u;
        v94 = 0u;
      }
      sub_24218E18C((uint64_t)&v97);
      if (*((_QWORD *)&v94 + 1))
      {
        sub_24219BA44(&v93, (uint64_t)v96);
        sub_24219BA44(v96, (uint64_t)&v93);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_2421A0284(0, *(_QWORD *)(v33 + 16) + 1, 1, v33);
          v33 = v36;
        }
        v35 = *(_QWORD *)(v33 + 16);
        v34 = *(_QWORD *)(v33 + 24);
        if (v35 >= v34 >> 1)
        {
          sub_2421A0284(v34 > 1, v35 + 1, 1, v33);
          v33 = v37;
        }
        *(_QWORD *)(v33 + 16) = v35 + 1;
        sub_24219BA44(&v93, v33 + 40 * v35 + 32);
      }
      else
      {
        sub_242199198((uint64_t)&v93, &qword_2543A6A68);
      }
      v32 += 40;
      --v31;
    }
    while (v31);
    swift_release_n();
  }
  else
  {
    swift_release();
    v33 = MEMORY[0x24BEE4AF8];
  }
  v38 = *(_QWORD *)(v33 + 16);
  if (v38)
  {
    *(_QWORD *)&v96[0] = MEMORY[0x24BEE4AF8];
    sub_2421A2F90(0, v38, 0);
    v39 = v33 + 32;
    v40 = sub_2421AF70C();
    v92 = (uint64_t *)v40;
    v41 = *(_QWORD *)(v40 - 8);
    v42 = *(_QWORD *)(v41 + 64);
    do
    {
      MEMORY[0x24BDAC7A8](v40);
      sub_2421A2FC8(v39, (uint64_t)&v97);
      v43 = v98;
      v44 = v99;
      sub_242198260(&v97, v98);
      MEMORY[0x2426A4724](v43, v44);
      sub_24218E18C((uint64_t)&v97);
      v45 = *(_QWORD *)&v96[0];
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_2421A2F90(0, *(_QWORD *)(v45 + 16) + 1, 1);
        v45 = *(_QWORD *)&v96[0];
      }
      v47 = *(_QWORD *)(v45 + 16);
      v46 = *(_QWORD *)(v45 + 24);
      if (v47 >= v46 >> 1)
      {
        sub_2421A2F90(v46 > 1, v47 + 1, 1);
        v45 = *(_QWORD *)&v96[0];
      }
      *(_QWORD *)(v45 + 16) = v47 + 1;
      v40 = (*(uint64_t (**)(unint64_t, char *, uint64_t *))(v41 + 32))(v45+ ((*(unsigned __int8 *)(v41 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v41 + 80))+ *(_QWORD *)(v41 + 72) * v47, (char *)&v79 - ((v42 + 15) & 0xFFFFFFFFFFFFFFF0), v92);
      *(_QWORD *)&v96[0] = v45;
      v39 += 40;
      --v38;
    }
    while (v38);
  }
  swift_bridgeObjectRelease();
  v48 = sub_24219CCA8();
  v49 = v48 + 56;
  v50 = 1 << *(_BYTE *)(v48 + 32);
  v51 = -1;
  if (v50 < 64)
    v51 = ~(-1 << v50);
  v52 = v51 & *(_QWORD *)(v48 + 56);
  v53 = sub_2421AF70C();
  v79 = (uint64_t)&v79;
  v54 = *(_QWORD *)(v53 - 8);
  MEMORY[0x24BDAC7A8](v53);
  v88 = (char *)&v79 - (((unint64_t)v55 + 15) & 0xFFFFFFFFFFFFFFF0);
  v89 = v55;
  v87 = (unint64_t)(v50 + 63) >> 6;
  swift_bridgeObjectRetain();
  v56 = 0;
  v85 = v48;
  v84 = v48 + 56;
  v90 = v53;
  if (!v52)
    goto LABEL_46;
LABEL_45:
  v57 = __clz(__rbit64(v52));
  v52 &= v52 - 1;
  v91 = v56;
  for (i = v57 | (v56 << 6); ; i = __clz(__rbit64(v60)) + (v61 << 6))
  {
    v63 = v88;
    v64 = (*(uint64_t (**)(char *, unint64_t, uint64_t))(v54 + 16))(v88, *(_QWORD *)(v48 + 48) + *(_QWORD *)(v54 + 72) * i, v53);
    v92 = &v79;
    MEMORY[0x24BDAC7A8](v64);
    v66 = (char *)&v79 - ((v65 + 15) & 0xFFFFFFFFFFFFFFF0);
    v67 = v54;
    (*(void (**)(char *, char *, uint64_t))(v54 + 32))(v66, v63, v53);
    v68 = sub_2421AF7D8();
    v69 = *(_QWORD *)(v68 - 8);
    v70 = *(_QWORD *)(v69 + 64);
    MEMORY[0x24BDAC7A8](v68);
    v71 = (char *)&v79 - ((v70 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_2421AF6F4();
    v72 = (*(uint64_t (**)(char *, uint64_t))(v69 + 88))(v71, v68);
    if (MEMORY[0x24BE68620] && (_DWORD)v72 == *MEMORY[0x24BE68620])
    {
      v86 = (char *)&v79;
      MEMORY[0x24BDAC7A8](v72);
      v73 = (char *)&v79 - ((v70 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *, char *, uint64_t))(v69 + 16))(v73, v71, v68);
      (*(void (**)(char *, uint64_t))(v69 + 96))(v73, v68);
      v74 = sub_2421AF82C();
      v75 = *(_QWORD *)(v74 - 8);
      v76 = (*(uint64_t (**)(char *, uint64_t))(v75 + 88))(v73, v74);
      if (MEMORY[0x24BE68790] && v76 == *MEMORY[0x24BE68790])
      {
        (*(void (**)(char *, uint64_t))(v69 + 8))(v71, v68);
        (*(void (**)(char *, uint64_t))(v67 + 8))(v66, v90);
        swift_release();
        swift_bridgeObjectRelease();
        goto LABEL_71;
      }
      (*(void (**)(char *, uint64_t))(v75 + 8))(v73, v74);
      v48 = v85;
      v49 = v84;
    }
    (*(void (**)(char *, uint64_t))(v69 + 8))(v71, v68);
    v54 = v67;
    v53 = v90;
    (*(void (**)(char *, uint64_t))(v67 + 8))(v66, v90);
    v56 = v91;
    if (v52)
      goto LABEL_45;
LABEL_46:
    v59 = v56 + 1;
    if (__OFADD__(v56, 1))
      goto LABEL_75;
    if (v59 >= v87)
    {
LABEL_70:
      swift_release();
      swift_bridgeObjectRelease();
LABEL_71:
      sub_2421AE5BC();
      v77 = (void *)sub_2421AFBC8();
      v78 = v83;
      v83[2](v83, v77, 0);

      (*(void (**)(char *, uint64_t))(v81 + 8))(v80, v82);
      _Block_release(v78);
      return;
    }
    v60 = *(_QWORD *)(v49 + 8 * v59);
    v61 = v56 + 1;
    if (!v60)
    {
      v61 = v56 + 2;
      if (v56 + 2 >= v87)
        goto LABEL_70;
      v60 = *(_QWORD *)(v49 + 8 * v61);
      if (!v60)
      {
        v61 = v56 + 3;
        if (v56 + 3 >= v87)
          goto LABEL_70;
        v60 = *(_QWORD *)(v49 + 8 * v61);
        if (!v60)
        {
          v61 = v56 + 4;
          if (v56 + 4 >= v87)
            goto LABEL_70;
          v60 = *(_QWORD *)(v49 + 8 * v61);
          if (!v60)
          {
            v61 = v56 + 5;
            if (v56 + 5 >= v87)
              goto LABEL_70;
            v60 = *(_QWORD *)(v49 + 8 * v61);
            if (!v60)
            {
              v62 = v56 + 6;
              if (v56 + 6 >= v87)
                goto LABEL_70;
              v60 = *(_QWORD *)(v49 + 8 * v62);
              v61 = v56 + 6;
              if (!v60)
                break;
            }
          }
        }
      }
    }
LABEL_62:
    v52 = (v60 - 1) & v60;
    v91 = v61;
  }
  while (1)
  {
    v61 = v62 + 1;
    if (__OFADD__(v62, 1))
      break;
    if (v61 >= v87)
      goto LABEL_70;
    v60 = *(_QWORD *)(v49 + 8 * v61);
    ++v62;
    if (v60)
      goto LABEL_62;
  }
LABEL_76:
  __break(1u);
}

void CatalogServiceServer.Server.hasEnoughStorageForGenerativeExperiencesEssentialResources(with:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void (*v4)(void *, _QWORD);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char *v17;
  uint64_t v18;
  int64_t v19;
  char *v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  int64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  _QWORD *v54;
  uint64_t v55;
  unint64_t v56;
  unint64_t i;
  int64_t v58;
  unint64_t v59;
  int64_t v60;
  char v61;
  char v62;
  uint64_t v63;
  int64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  uint64_t v75;
  char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t (*v79)(uint64_t);
  int v80;
  void *v81;
  _QWORD v82[2];
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  void (*v87)(void *, _QWORD);
  uint64_t v88;
  uint64_t v89;
  _QWORD *v90;
  int64_t v91;
  unint64_t v92;
  _QWORD *v93;
  uint64_t v94;
  int64_t v95;
  void (*v96)(char *, unint64_t, uint64_t);
  __int128 v97;
  __int128 v98;
  uint64_t v99;
  __int128 v100[2];
  __int128 v101;
  uint64_t v102;

  sub_242199548();
  v86 = v3;
  v87 = v4;
  v5 = sub_2421997A8();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  sub_24219943C();
  v85 = sub_2421AEE98();
  v84 = *(_QWORD *)(v85 - 8);
  sub_242199348();
  MEMORY[0x24BDAC7A8](v7);
  sub_2421AEE68();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v1, v0 + OBJC_IVAR____TtCC19ModelCatalogRuntime20CatalogServiceServer6Server_sideloadURL, v5);
  sub_2421AF538();
  v83 = v2;
  v8 = sub_2421AF580();
  v9 = v8;
  v10 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)&v97 = MEMORY[0x24BEE4AF8];
  v90 = *(_QWORD **)(v8 + 16);
  if (v90)
  {
    v11 = 0;
    v89 = v8 + 32;
    v88 = v8;
    while (1)
    {
      if (v11 >= *(_QWORD *)(v9 + 16))
        goto LABEL_80;
      sub_2421A2FC8(v89 + 40 * v11, (uint64_t)&v101);
      sub_242198260(&v101, v102);
      v12 = sub_2421AF5BC();
      v13 = sub_2421AF838();
      v93 = v82;
      v14 = *(_QWORD *)(v13 - 8);
      v15 = *(_QWORD *)(v14 + 64);
      MEMORY[0x24BDAC7A8](v13);
      v16 = (v15 + 15) & 0xFFFFFFFFFFFFFFF0;
      v17 = (char *)v82 - v16;
      v18 = (*(uint64_t (**)(char *, _QWORD, uint64_t))(v14 + 104))((char *)v82 - v16, *MEMORY[0x24BE687A0], v13);
      MEMORY[0x24BDAC7A8](v18);
      v20 = (char *)v82 - v16;
      v21 = *(_QWORD *)(v12 + 16);
      v94 = v12;
      if (v21)
      {
        v91 = v19;
        v92 = v11;
        v22 = (*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
        v96 = *(void (**)(char *, unint64_t, uint64_t))(v14 + 16);
        v96((char *)v82 - v16, v12 + v22, v13);
        sub_242199250((unint64_t *)&qword_2543A6980, (uint64_t (*)(uint64_t))MEMORY[0x24BE687A8], MEMORY[0x24BE687B0]);
        v23 = sub_2421AF080();
        sub_2421AF128((uint64_t)v20);
        if ((v23 & 1) != 0)
        {
LABEL_6:
          sub_2421AF128((uint64_t)v17);
          swift_bridgeObjectRelease();
          sub_24219BA44(&v101, (uint64_t)v100);
          v24 = v97;
          if ((sub_2421AF0D4() & 1) == 0)
          {
            sub_2421A2FAC(0, *(_QWORD *)(v24 + 16) + 1, 1);
            v24 = v97;
          }
          v9 = v88;
          v26 = *(_QWORD *)(v24 + 16);
          v25 = *(_QWORD *)(v24 + 24);
          v11 = v92;
          if (v26 >= v25 >> 1)
          {
            sub_2421A2FAC((char *)(v25 > 1), v26 + 1, 1);
            v24 = v97;
          }
          *(_QWORD *)(v24 + 16) = v26 + 1;
          sub_24219BA44(v100, v24 + 40 * v26 + 32);
          goto LABEL_19;
        }
        if (v21 != 1)
        {
          v95 = *(_QWORD *)(v14 + 72);
          v27 = v94 + v95 + v22;
          v28 = 1;
          while (1)
          {
            v96(v20, v27, v13);
            v29 = v28 + 1;
            if (__OFADD__(v28, 1))
              break;
            v30 = sub_2421AF080();
            sub_2421AF128((uint64_t)v20);
            if ((v30 & 1) != 0)
              goto LABEL_6;
            ++v28;
            v27 += v95;
            if (v29 == v21)
              goto LABEL_17;
          }
          __break(1u);
LABEL_80:
          __break(1u);
LABEL_81:
          __break(1u);
          goto LABEL_82;
        }
LABEL_17:
        v9 = v88;
        v11 = v92;
      }
      sub_2421AF128((uint64_t)v17);
      swift_bridgeObjectRelease();
      sub_242199A08();
LABEL_19:
      if ((_QWORD *)++v11 == v90)
      {
        v10 = v97;
        break;
      }
    }
  }
  sub_242199434();
  v31 = *(_QWORD *)(v10 + 16);
  if (v31)
  {
    v32 = v10 + 32;
    swift_retain();
    v33 = MEMORY[0x24BEE4AF8];
    do
    {
      sub_2421A2FC8(v32, (uint64_t)&v101);
      sub_2421AEE44();
      sub_24218D500(&qword_2543A67F8);
      sub_24218D500(&qword_2543A6808);
      if ((sub_2421AEFE8() & 1) == 0)
      {
        v99 = 0;
        v97 = 0u;
        v98 = 0u;
      }
      sub_242199A08();
      if (*((_QWORD *)&v98 + 1))
      {
        sub_24219BA44(&v97, (uint64_t)v100);
        sub_24219BA44(v100, (uint64_t)&v97);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_2421AF1E4(0, *(_QWORD *)(v33 + 16) + 1);
          v33 = v36;
        }
        v35 = *(_QWORD *)(v33 + 16);
        v34 = *(_QWORD *)(v33 + 24);
        if (v35 >= v34 >> 1)
        {
          sub_2421AF1E4(v34 > 1, v35 + 1);
          v33 = v37;
        }
        *(_QWORD *)(v33 + 16) = v35 + 1;
        sub_24219BA44(&v97, v33 + 40 * v35 + 32);
      }
      else
      {
        sub_242199198((uint64_t)&v97, &qword_2543A6A68);
      }
      v32 += 40;
      --v31;
    }
    while (v31);
    swift_release_n();
  }
  else
  {
    swift_release();
    v33 = MEMORY[0x24BEE4AF8];
  }
  v38 = *(_QWORD *)(v33 + 16);
  if (v38)
  {
    *(_QWORD *)&v100[0] = MEMORY[0x24BEE4AF8];
    sub_2421A2F90(0, v38, 0);
    v39 = v33 + 32;
    v40 = sub_242199484();
    v96 = (void (*)(char *, unint64_t, uint64_t))v40;
    v41 = *(_QWORD *)(v40 - 8);
    v42 = *(_QWORD *)(v41 + 64);
    do
    {
      MEMORY[0x24BDAC7A8](v40);
      sub_2421A2FC8(v39, (uint64_t)&v101);
      sub_2421AF350();
      v43 = sub_2421AF2E0();
      MEMORY[0x2426A4724](v43);
      sub_242199A08();
      v44 = *(_QWORD *)&v100[0];
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_2421A2F90(0, *(_QWORD *)(v44 + 16) + 1, 1);
        v44 = *(_QWORD *)&v100[0];
      }
      v46 = *(_QWORD *)(v44 + 16);
      v45 = *(_QWORD *)(v44 + 24);
      if (v46 >= v45 >> 1)
      {
        sub_2421A2F90(v45 > 1, v46 + 1, 1);
        v44 = *(_QWORD *)&v100[0];
      }
      *(_QWORD *)(v44 + 16) = v46 + 1;
      v40 = (*(uint64_t (**)(unint64_t, char *, _QWORD *))(v41 + 32))(v44+ ((*(unsigned __int8 *)(v41 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v41 + 80))+ *(_QWORD *)(v41 + 72) * v46, (char *)v82 - ((v42 + 15) & 0xFFFFFFFFFFFFFFF0), v96);
      *(_QWORD *)&v100[0] = v44;
      v39 += 40;
      --v38;
    }
    while (v38);
  }
  swift_bridgeObjectRelease();
  v47 = sub_24219CCA8();
  v48 = v47 + 56;
  v49 = 1 << *(_BYTE *)(v47 + 32);
  v50 = -1;
  if (v49 < 64)
    v50 = ~(-1 << v49);
  v51 = v50 & *(_QWORD *)(v47 + 56);
  v52 = sub_242199484();
  v82[1] = v82;
  v53 = *(_QWORD *)(v52 - 8);
  MEMORY[0x24BDAC7A8](v52);
  v92 = (unint64_t)v82 - (((unint64_t)v54 + 15) & 0xFFFFFFFFFFFFFFF0);
  v93 = v54;
  v91 = (unint64_t)(v49 + 63) >> 6;
  swift_bridgeObjectRetain();
  v55 = 0;
  v89 = v47;
  v88 = v47 + 56;
  v94 = v52;
  if (!v51)
    goto LABEL_46;
LABEL_45:
  v56 = __clz(__rbit64(v51));
  v51 &= v51 - 1;
  v95 = v55;
  for (i = v56 | (v55 << 6); ; i = __clz(__rbit64(v59)) + (v60 << 6))
  {
    v66 = v92;
    v67 = sub_24219970C(v92, *(_QWORD *)(v47 + 48) + *(_QWORD *)(v53 + 72) * i, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v53 + 16));
    v96 = (void (*)(char *, unint64_t, uint64_t))v82;
    MEMORY[0x24BDAC7A8](v67);
    v69 = (char *)v82 - ((v68 + 15) & 0xFFFFFFFFFFFFFFF0);
    v70 = v53;
    sub_24219970C((uint64_t)v69, v66, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v53 + 32));
    v71 = sub_2421AF7D8();
    v72 = *(_QWORD *)(v71 - 8);
    v73 = *(_QWORD *)(v72 + 64);
    MEMORY[0x24BDAC7A8](v71);
    v74 = (char *)v82 - ((v73 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_2421AF6F4();
    v75 = (*(uint64_t (**)(char *, uint64_t))(v72 + 88))(v74, v71);
    if (MEMORY[0x24BE68620] && (_DWORD)v75 == *MEMORY[0x24BE68620])
    {
      v90 = v82;
      MEMORY[0x24BDAC7A8](v75);
      v76 = (char *)v82 - ((v73 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *, char *, uint64_t))(v72 + 16))(v76, v74, v71);
      (*(void (**)(char *, uint64_t))(v72 + 96))(v76, v71);
      v77 = *(_QWORD *)(sub_2421AF82C() - 8);
      v78 = sub_2421AF2E0();
      v80 = v79(v78);
      if (MEMORY[0x24BE68790] && v80 == *MEMORY[0x24BE68790])
      {
        sub_2421AF130();
        (*(void (**)(char *, uint64_t))(v70 + 8))(v69, v94);
        sub_24219946C();
        sub_24219978C();
        goto LABEL_77;
      }
      sub_2421AF2EC(*(uint64_t (**)(uint64_t, uint64_t))(v77 + 8));
      v47 = v89;
      v48 = v88;
    }
    sub_2421AF130();
    v53 = v70;
    (*(void (**)(char *, uint64_t))(v70 + 8))(v69, v94);
    v55 = v95;
    if (v51)
      goto LABEL_45;
LABEL_46:
    v58 = v55 + 1;
    if (__OFADD__(v55, 1))
      goto LABEL_81;
    if (v58 >= v91)
    {
LABEL_76:
      swift_release();
      sub_242199434();
LABEL_77:
      sub_2421AEDC0();
      v81 = (void *)sub_2421AFBC8();
      v87(v81, 0);

      (*(void (**)(uint64_t, uint64_t))(v84 + 8))(v83, v85);
      sub_242199304();
      return;
    }
    v59 = *(_QWORD *)(v48 + 8 * v58);
    v60 = v55 + 1;
    if (!v59)
    {
      sub_2421AF104();
      if (v61 == v62)
        goto LABEL_76;
      v59 = *(_QWORD *)(v48 + 8 * v60);
      if (!v59)
      {
        sub_2421AF104();
        if (v61 == v62)
          goto LABEL_76;
        v59 = *(_QWORD *)(v48 + 8 * v60);
        if (!v59)
        {
          sub_2421AF104();
          if (v61 == v62)
            goto LABEL_76;
          v59 = *(_QWORD *)(v48 + 8 * v60);
          if (!v59)
          {
            sub_2421AF104();
            if (v61 == v62)
              goto LABEL_76;
            v59 = *(_QWORD *)(v48 + 8 * v60);
            if (!v59)
              break;
          }
        }
      }
    }
LABEL_68:
    v51 = (v59 - 1) & v59;
    v95 = v60;
  }
  v64 = v63 + 5;
  if (v64 >= v91)
    goto LABEL_76;
  v59 = *(_QWORD *)(v48 + 8 * v64);
  if (v59)
  {
    v60 = v64;
    goto LABEL_68;
  }
  while (!__OFADD__(v64, 1))
  {
    sub_2421AF104();
    if (v61 == v62)
      goto LABEL_76;
    v59 = *(_QWORD *)(v48 + 8 * v60);
    v64 = v65 + 1;
    if (v59)
      goto LABEL_68;
  }
LABEL_82:
  __break(1u);
}

id CatalogServiceServer.Server.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void CatalogServiceServer.Server.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id CatalogServiceServer.Server.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_2421AE4F4@<X0>(_QWORD *a1@<X8>)
{
  id result;

  result = sub_2421A52D8();
  *a1 = result;
  return result;
}

uint64_t CatalogServiceServer.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t CatalogServiceServer.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t sub_2421AE530(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_2421AE594;
  return v6(a1);
}

uint64_t sub_2421AE594()
{
  uint64_t v0;

  sub_24219BB1C();
  return sub_24219BB90(*(uint64_t (**)(void))(v0 + 8));
}

unint64_t sub_2421AE5BC()
{
  unint64_t result;

  result = qword_2543A69A8;
  if (!qword_2543A69A8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2543A69A8);
  }
  return result;
}

uint64_t sub_2421AE5F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_24218D500(&qword_2543A67F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_2421AE644(void *a1)
{
  uint64_t v1;

  sub_2421A7A68(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(void (**)(_QWORD, _QWORD))(v1 + 32));
}

uint64_t sub_2421AE650(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_24218D500(&qword_2543A67F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

_OWORD *sub_2421AE698(_OWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  unint64_t v7;
  char v8;
  char v9;
  unint64_t v10;
  char v11;
  unint64_t v12;
  char v13;
  uint64_t v14;
  _OWORD *v15;
  _OWORD *result;

  sub_242197484(a2, a3);
  sub_2421AF2C4();
  if (v9)
  {
    __break(1u);
    goto LABEL_9;
  }
  v10 = v7;
  v11 = v8;
  sub_24218D500(&qword_2571DF308);
  if ((sub_2421AFCC4() & 1) == 0)
    goto LABEL_5;
  v12 = sub_242197484(a2, a3);
  if ((v11 & 1) != (v13 & 1))
  {
LABEL_9:
    result = (_OWORD *)sub_2421AFD6C();
    __break(1u);
    return result;
  }
  v10 = v12;
LABEL_5:
  v14 = *v3;
  if ((v11 & 1) != 0)
  {
    v15 = (_OWORD *)(*(_QWORD *)(v14 + 56) + 32 * v10);
    sub_24218E18C((uint64_t)v15);
    return sub_24218E140(a1, v15);
  }
  else
  {
    sub_2421977A4(v10, a2, a3, (uint64_t)a1, v14);
    return (_OWORD *)swift_bridgeObjectRetain();
  }
}

void sub_2421AE7A8()
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
  unint64_t v9;
  char v10;
  char v11;
  unint64_t v12;
  char v13;
  unint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t *v17;

  sub_242199548();
  v2 = v1;
  v4 = v3;
  v6 = v5;
  v8 = v7;
  sub_242197484(v3, v1);
  sub_2421AF2C4();
  if (v11)
  {
    __break(1u);
    goto LABEL_9;
  }
  v12 = v9;
  v13 = v10;
  sub_24218D500(&qword_2543A6B10);
  if ((sub_2421AFCC4() & 1) == 0)
    goto LABEL_5;
  v14 = sub_242197484(v4, v2);
  if ((v13 & 1) != (v15 & 1))
  {
LABEL_9:
    sub_2421AFD6C();
    __break(1u);
    return;
  }
  v12 = v14;
LABEL_5:
  v16 = *v0;
  if ((v13 & 1) != 0)
  {
    v17 = (uint64_t *)(*(_QWORD *)(v16 + 56) + 16 * v12);
    swift_bridgeObjectRelease();
    *v17 = v8;
    v17[1] = v6;
    sub_242199304();
  }
  else
  {
    sub_242197804(v12, v4, v2, v8, v6, v16);
    swift_bridgeObjectRetain();
  }
}

uint64_t sub_2421AE8AC(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *a1 = a4;
  a1[1] = a5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a2;
}

uint64_t sub_2421AE8F4(uint64_t a1, uint64_t a2, uint64_t a3, char a4, _QWORD *a5)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  char v16;
  unint64_t v17;
  uint64_t v18;
  _BOOL8 v19;
  uint64_t v20;
  char v21;
  unint64_t v22;
  char v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t *v26;
  _QWORD *v27;
  uint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t result;
  __int128 v35;

  sub_242198E2C(a1, a2, a3, &v35);
  swift_bridgeObjectRetain();
  swift_retain();
  v7 = sub_242198E68();
  if (v8)
  {
    v11 = v7;
    v12 = v8;
    v13 = v9;
    v14 = v10;
    while (1)
    {
      v15 = (_QWORD *)*a5;
      v17 = sub_242197484(v11, v12);
      v18 = v15[2];
      v19 = (v16 & 1) == 0;
      v20 = v18 + v19;
      if (__OFADD__(v18, v19))
        break;
      v21 = v16;
      if (v15[3] >= v20)
      {
        if ((a4 & 1) == 0)
        {
          sub_24218D500(&qword_2543A6B10);
          sub_2421AFCD0();
        }
      }
      else
      {
        sub_2421974E8(v20, a4 & 1);
        v22 = sub_242197484(v11, v12);
        if ((v21 & 1) != (v23 & 1))
          goto LABEL_17;
        v17 = v22;
      }
      v24 = (_QWORD *)*a5;
      if ((v21 & 1) != 0)
      {
        swift_bridgeObjectRelease();
        v25 = (_QWORD *)(v24[7] + 16 * v17);
        swift_bridgeObjectRelease();
        *v25 = v13;
        v25[1] = v14;
      }
      else
      {
        v24[(v17 >> 6) + 8] |= 1 << v17;
        v26 = (uint64_t *)(v24[6] + 16 * v17);
        *v26 = v11;
        v26[1] = v12;
        v27 = (_QWORD *)(v24[7] + 16 * v17);
        *v27 = v13;
        v27[1] = v14;
        v28 = v24[2];
        v29 = __OFADD__(v28, 1);
        v30 = v28 + 1;
        if (v29)
          goto LABEL_16;
        v24[2] = v30;
      }
      v11 = sub_242198E68();
      v12 = v31;
      v13 = v32;
      v14 = v33;
      a4 = 1;
      if (!v31)
        goto LABEL_14;
    }
    __break(1u);
LABEL_16:
    __break(1u);
LABEL_17:
    result = sub_2421AFD6C();
    __break(1u);
  }
  else
  {
LABEL_14:
    swift_bridgeObjectRelease();
    swift_release();
    sub_242198FFC();
    return swift_release();
  }
  return result;
}

uint64_t sub_2421AEB00@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[2];

  result = sub_2421AE8AC(v7, *a1, a1[1], a1[2], a1[3]);
  v4 = v7[0];
  v5 = v7[1];
  *a2 = result;
  a2[1] = v6;
  a2[2] = v4;
  a2[3] = v5;
  return result;
}

uint64_t sub_2421AEB40()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2421AEB74(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = v1[5];
  v8 = v1[6];
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v9;
  *v9 = v2;
  v9[1] = sub_24219B990;
  return sub_2421ACBC4(a1, v4, v5, v6, v7, v8);
}

_UNKNOWN **sub_2421AEBF4()
{
  return &off_251332500;
}

uint64_t sub_2421AEC00()
{
  return MEMORY[0x24BE682F0];
}

uint64_t type metadata accessor for CatalogServiceServer()
{
  return objc_opt_self();
}

uint64_t method lookup function for CatalogServiceServer()
{
  return swift_lookUpClassMethod();
}

uint64_t sub_2421AEC38()
{
  return type metadata accessor for CatalogServiceServer.Server();
}

uint64_t type metadata accessor for CatalogServiceServer.Server()
{
  uint64_t result;

  result = qword_2543A6810;
  if (!qword_2543A6810)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2421AEC78()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2421AF430();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for CatalogServiceServer.Server()
{
  return swift_lookUpClassMethod();
}

uint64_t sub_2421AECFC()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_2421AED24()
{
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2421AED50()
{
  swift_release();
  return swift_deallocObject();
}

BOOL sub_2421AEDB0(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

unint64_t sub_2421AEDC0()
{
  return sub_2421AE5BC();
}

uint64_t sub_2421AEDC8(uint64_t a1, uint64_t a2)
{
  sub_24218E28C(a1, a2);
  return swift_bridgeObjectRetain_n();
}

uint64_t sub_2421AEDE4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v2, v1);
}

uint64_t sub_2421AEDF4()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(v1 - 192) + 8))(v0, *(_QWORD *)(v1 - 184));
}

id sub_2421AEE04()
{
  void *v0;

  return v0;
}

uint64_t sub_2421AEE18()
{
  return swift_bridgeObjectRetain_n();
}

uint64_t sub_2421AEE20()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t sub_2421AEE28(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, _QWORD);

  return v1(a1, 0);
}

uint64_t sub_2421AEE3C()
{
  return sub_2421AF3E8();
}

void sub_2421AEE44()
{
  uint64_t v0;

  sub_2421A2FC8(v0 - 128, v0 - 168);
}

uint64_t sub_2421AEE50()
{
  uint64_t v0;

  return sub_24218E18C(v0 - 168);
}

uint64_t sub_2421AEE98()
{
  return sub_2421AF58C();
}

void sub_2421AEEA0(id a1)
{

}

uint64_t sub_2421AEEB4()
{
  return swift_bridgeObjectRelease();
}

void sub_2421AEEC4(id a1)
{

}

void sub_2421AEED4()
{
  void *v0;

}

void sub_2421AEEDC(void *a1, NSObject *a2, os_log_type_t a3, const char *a4)
{
  uint8_t *v4;

  _os_log_impl(a1, a2, a3, a4, v4, 2u);
}

uint64_t sub_2421AEEE8@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t sub_2421AEEF0(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_2421AEF00()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_2421AEF0C()
{
  return sub_2421AF928();
}

uint64_t sub_2421AEF38()
{
  return sub_2421AFBC8();
}

uint64_t sub_2421AEF44()
{
  return sub_2421AFB74();
}

uint64_t sub_2421AEF4C()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t, _QWORD);

  return v1(v0, 0);
}

uint64_t sub_2421AEF5C(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 136) = a1;
  return sub_2421AFBEC();
}

uint64_t sub_2421AEF78()
{
  return sub_2421AFBEC();
}

uint64_t sub_2421AEF80(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 224) = a1;
  return v1 - 224;
}

uint64_t sub_2421AEF94(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 96) = a1;
  return v1 - 96;
}

uint64_t sub_2421AEFB8(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(v1 + 16))(v1, 0, a1);
}

uint64_t sub_2421AEFD0(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(v1 + 16))(v1, a1, 0);
}

uint64_t sub_2421AEFE8()
{
  return swift_dynamicCast();
}

uint64_t sub_2421AEFF4(float a1)
{
  float *v1;

  *v1 = a1;
  return swift_bridgeObjectRetain();
}

void sub_2421AF008(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  unint64_t v3;
  uint64_t v4;

  sub_2421A0BC4(v4, v3, a3);
}

void sub_2421AF014(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  unint64_t v3;

  sub_2421A0BC4(a1, v3, a3);
}

uint64_t sub_2421AF01C()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, _QWORD))(v1 - 144))(v0, 0);
}

uint64_t sub_2421AF030(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD, uint64_t))(v1 - 200))(0, a1);
}

uint64_t sub_2421AF044(uint64_t a1)
{
  uint64_t (*v1)(_QWORD, uint64_t);

  return v1(0, a1);
}

uint64_t sub_2421AF058(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD, uint64_t))(v1 - 144))(0, a1);
}

uint64_t sub_2421AF06C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v4, v1 + a1, v3);
}

uint64_t sub_2421AF080()
{
  return sub_2421AFA0C();
}

uint64_t sub_2421AF094()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_2421AF09C()
{
  return sub_2421AF79C();
}

uint64_t sub_2421AF0B0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(v1 + 16))(v3, v2 + a1, *(_QWORD *)(v4 - 160));
}

uint64_t sub_2421AF0C4()
{
  return sub_2421AFBEC();
}

uint64_t sub_2421AF0D4()
{
  return swift_isUniquelyReferenced_nonNull_native();
}

uint64_t sub_2421AF0DC()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t, _QWORD);

  return v1(v0, 0);
}

void sub_2421AF0EC(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  sub_242199198(v2 - 168, a2);
}

uint64_t sub_2421AF0F4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v2, v0);
}

uint64_t sub_2421AF128(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(a1, v1);
}

uint64_t sub_2421AF130()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t sub_2421AF158(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, _QWORD);

  return v1(a1, 0);
}

uint64_t sub_2421AF168@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 88) = a1;
  return sub_2421AFCA0();
}

void sub_2421AF178()
{
  uint64_t *v0;
  uint64_t v1;

  sub_242199198(v1 - 168, v0);
}

void sub_2421AF188(uint64_t a1)
{
  uint64_t v1;

  sub_2421A2FC8(a1, v1 - 208);
}

uint64_t sub_2421AF190()
{
  return sub_2421AFCAC();
}

void sub_2421AF1A0(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  sub_242199198(v2 - 120, a2);
}

uint64_t sub_2421AF1A8()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_2421AF1B0()
{
  return sub_2421AF538();
}

uint64_t sub_2421AF1B8(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, _QWORD);

  return v1(a1, 0);
}

uint64_t sub_2421AF1C8(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 168) = v1;
  *(_QWORD *)(v2 - 120) = result;
  return result;
}

id sub_2421AF1DC(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

void sub_2421AF1E4(char a1, uint64_t a2)
{
  uint64_t v2;

  sub_2421A0284(a1, a2, 1, v2);
}

uint64_t sub_2421AF1F0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_24218D5C8(a1, a2, 1, v2);
  return sub_2421AF7B4();
}

void sub_2421AF20C(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  sub_2421A0BC4(a1, a2, (uint64_t *)va);
}

uint64_t sub_2421AF218(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 168) = a1;
  return v1 - 168;
}

void sub_2421AF22C()
{
  uint64_t v0;
  uint64_t v1;

  sub_2421A2FC8(v0, v1 - 128);
}

uint64_t sub_2421AF238()
{
  return swift_allocError();
}

uint64_t sub_2421AF244()
{
  return swift_beginAccess();
}

uint64_t sub_2421AF250()
{
  return sub_2421AFAA8();
}

uint64_t sub_2421AF25C()
{
  return sub_2421AFD54();
}

BOOL sub_2421AF264(NSObject *a1)
{
  os_log_type_t v1;

  return os_log_type_enabled(a1, v1);
}

uint64_t sub_2421AF26C()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_2421AF280()
{
  return sub_2421AFCB8();
}

uint64_t sub_2421AF28C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_24218D5C8(a1, 1, 1, a4);
}

uint64_t sub_2421AF2AC()
{
  return swift_dynamicCast();
}

uint64_t sub_2421AF2B8()
{
  return sub_2421AF928();
}

uint64_t sub_2421AF2D8()
{
  return sub_2421AFB74();
}

uint64_t sub_2421AF2E0()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_2421AF2EC@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

_WORD *sub_2421AF2F8(_WORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_2421AF304(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 208) = a1;
  return v1 - 208;
}

uint64_t sub_2421AF318()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_2421AF32C()
{
  return sub_2421AFBD4();
}

uint64_t sub_2421AF338()
{
  return sub_2421AFBD4();
}

uint64_t sub_2421AF344()
{
  return sub_2421AFBD4();
}

_QWORD *sub_2421AF350()
{
  uint64_t v0;
  uint64_t v1;

  return sub_242198260((_QWORD *)(v1 - 128), v0);
}

void *sub_2421AF35C(int a1, int a2, int a3, void *aBlock)
{
  return _Block_copy(aBlock);
}

uint64_t sub_2421AF364()
{
  return MEMORY[0x24BDCB108]();
}

uint64_t sub_2421AF370()
{
  return MEMORY[0x24BDCBBA0]();
}

uint64_t sub_2421AF37C()
{
  return MEMORY[0x24BDCBBC8]();
}

uint64_t sub_2421AF388()
{
  return MEMORY[0x24BDCBBD0]();
}

uint64_t sub_2421AF394()
{
  return MEMORY[0x24BDCBBD8]();
}

uint64_t sub_2421AF3A0()
{
  return MEMORY[0x24BDCBBF0]();
}

uint64_t sub_2421AF3AC()
{
  return MEMORY[0x24BDCBC10]();
}

uint64_t sub_2421AF3B8()
{
  return MEMORY[0x24BDCCAB0]();
}

uint64_t sub_2421AF3C4()
{
  return MEMORY[0x24BDCCAB8]();
}

uint64_t sub_2421AF3D0()
{
  return MEMORY[0x24BDCCAC0]();
}

uint64_t sub_2421AF3DC()
{
  return MEMORY[0x24BDCCAD0]();
}

uint64_t sub_2421AF3E8()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_2421AF3F4()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_2421AF400()
{
  return MEMORY[0x24BDCD820]();
}

uint64_t sub_2421AF40C()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_2421AF418()
{
  return MEMORY[0x24BDCD928]();
}

uint64_t sub_2421AF424()
{
  return MEMORY[0x24BDCDA68]();
}

uint64_t sub_2421AF430()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_2421AF43C()
{
  return MEMORY[0x24BDCDB60]();
}

uint64_t sub_2421AF448()
{
  return MEMORY[0x24BDCDD00]();
}

uint64_t sub_2421AF454()
{
  return MEMORY[0x24BDCDE78]();
}

uint64_t sub_2421AF460()
{
  return MEMORY[0x24BDCE330]();
}

uint64_t sub_2421AF46C()
{
  return MEMORY[0x24BDCE468]();
}

uint64_t sub_2421AF478()
{
  return MEMORY[0x24BDCE5D8]();
}

uint64_t sub_2421AF484()
{
  return MEMORY[0x24BDCE610]();
}

uint64_t sub_2421AF490()
{
  return MEMORY[0x24BDCE880]();
}

uint64_t sub_2421AF49C()
{
  return MEMORY[0x24BDCE8F8]();
}

uint64_t sub_2421AF4A8()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_2421AF4B4()
{
  return MEMORY[0x24BDCE998]();
}

uint64_t sub_2421AF4C0()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_2421AF4CC()
{
  return MEMORY[0x24BDCED58]();
}

uint64_t sub_2421AF4D8()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_2421AF4E4()
{
  return MEMORY[0x24BE68008]();
}

uint64_t sub_2421AF4F0()
{
  return MEMORY[0x24BE68010]();
}

uint64_t sub_2421AF4FC()
{
  return MEMORY[0x24BE68040]();
}

uint64_t sub_2421AF508()
{
  return MEMORY[0x24BE680D0]();
}

uint64_t sub_2421AF514()
{
  return MEMORY[0x24BE680D8]();
}

uint64_t sub_2421AF520()
{
  return MEMORY[0x24BE681C0]();
}

uint64_t sub_2421AF52C()
{
  return MEMORY[0x24BE681E0]();
}

uint64_t sub_2421AF538()
{
  return MEMORY[0x24BE68240]();
}

uint64_t sub_2421AF544()
{
  return MEMORY[0x24BE68248]();
}

uint64_t sub_2421AF550()
{
  return MEMORY[0x24BE68250]();
}

uint64_t sub_2421AF55C()
{
  return MEMORY[0x24BE68258]();
}

uint64_t sub_2421AF568()
{
  return MEMORY[0x24BE68260]();
}

uint64_t sub_2421AF574()
{
  return MEMORY[0x24BE68268]();
}

uint64_t sub_2421AF580()
{
  return MEMORY[0x24BE68270]();
}

uint64_t sub_2421AF58C()
{
  return MEMORY[0x24BE68278]();
}

uint64_t sub_2421AF598()
{
  return MEMORY[0x24BE682E0]();
}

uint64_t sub_2421AF5A4()
{
  return MEMORY[0x24BE682F8]();
}

uint64_t sub_2421AF5B0()
{
  return MEMORY[0x24BE68328]();
}

uint64_t sub_2421AF5BC()
{
  return MEMORY[0x24BE68330]();
}

uint64_t sub_2421AF5C8()
{
  return MEMORY[0x24BE68340]();
}

uint64_t sub_2421AF5D4()
{
  return MEMORY[0x24BE68348]();
}

uint64_t sub_2421AF5E0()
{
  return MEMORY[0x24BE68350]();
}

uint64_t sub_2421AF5EC()
{
  return MEMORY[0x24BE68358]();
}

uint64_t sub_2421AF5F8()
{
  return MEMORY[0x24BE68360]();
}

uint64_t sub_2421AF604()
{
  return MEMORY[0x24BE683A8]();
}

uint64_t sub_2421AF610()
{
  return MEMORY[0x24BE683B0]();
}

uint64_t sub_2421AF61C()
{
  return MEMORY[0x24BE683B8]();
}

uint64_t sub_2421AF628()
{
  return MEMORY[0x24BE683C0]();
}

uint64_t sub_2421AF634()
{
  return MEMORY[0x24BE683C8]();
}

uint64_t sub_2421AF640()
{
  return MEMORY[0x24BE683D0]();
}

uint64_t sub_2421AF64C()
{
  return MEMORY[0x24BE683D8]();
}

uint64_t sub_2421AF658()
{
  return MEMORY[0x24BE683E0]();
}

uint64_t sub_2421AF664()
{
  return MEMORY[0x24BE683E8]();
}

uint64_t sub_2421AF670()
{
  return MEMORY[0x24BE68400]();
}

uint64_t sub_2421AF67C()
{
  return MEMORY[0x24BE68430]();
}

uint64_t sub_2421AF688()
{
  return MEMORY[0x24BE68438]();
}

uint64_t sub_2421AF694()
{
  return MEMORY[0x24BE68440]();
}

uint64_t sub_2421AF6A0()
{
  return MEMORY[0x24BE68450]();
}

uint64_t sub_2421AF6AC()
{
  return MEMORY[0x24BE68458]();
}

uint64_t sub_2421AF6B8()
{
  return MEMORY[0x24BE68460]();
}

uint64_t sub_2421AF6C4()
{
  return MEMORY[0x24BE68468]();
}

uint64_t sub_2421AF6D0()
{
  return MEMORY[0x24BE68478]();
}

uint64_t sub_2421AF6DC()
{
  return MEMORY[0x24BE68480]();
}

uint64_t sub_2421AF6E8()
{
  return MEMORY[0x24BE68488]();
}

uint64_t sub_2421AF6F4()
{
  return MEMORY[0x24BE68490]();
}

uint64_t sub_2421AF700()
{
  return MEMORY[0x24BE68498]();
}

uint64_t sub_2421AF70C()
{
  return MEMORY[0x24BE684A0]();
}

uint64_t sub_2421AF718()
{
  return MEMORY[0x24BE684D0]();
}

uint64_t sub_2421AF724()
{
  return MEMORY[0x24BE684D8]();
}

uint64_t sub_2421AF730()
{
  return MEMORY[0x24BE684E0]();
}

uint64_t sub_2421AF73C()
{
  return MEMORY[0x24BE68510]();
}

uint64_t sub_2421AF748()
{
  return MEMORY[0x24BE68528]();
}

uint64_t sub_2421AF754()
{
  return MEMORY[0x24BE68530]();
}

uint64_t sub_2421AF760()
{
  return MEMORY[0x24BE68548]();
}

uint64_t sub_2421AF76C()
{
  return MEMORY[0x24BE68560]();
}

uint64_t sub_2421AF778()
{
  return MEMORY[0x24BE68568]();
}

uint64_t sub_2421AF784()
{
  return MEMORY[0x24BE68570]();
}

uint64_t sub_2421AF790()
{
  return MEMORY[0x24BE68590]();
}

uint64_t sub_2421AF79C()
{
  return MEMORY[0x24BE68598]();
}

uint64_t sub_2421AF7A8()
{
  return MEMORY[0x24BE685A0]();
}

uint64_t sub_2421AF7B4()
{
  return MEMORY[0x24BE685A8]();
}

uint64_t sub_2421AF7C0()
{
  return MEMORY[0x24BE68608]();
}

uint64_t sub_2421AF7CC()
{
  return MEMORY[0x24BE68610]();
}

uint64_t sub_2421AF7D8()
{
  return MEMORY[0x24BE68628]();
}

uint64_t sub_2421AF7E4()
{
  return MEMORY[0x24BE68638]();
}

uint64_t sub_2421AF7F0()
{
  return MEMORY[0x24BE68640]();
}

uint64_t sub_2421AF7FC()
{
  return MEMORY[0x24BE686F0]();
}

uint64_t sub_2421AF808()
{
  return MEMORY[0x24BE68700]();
}

uint64_t sub_2421AF814()
{
  return MEMORY[0x24BE68708]();
}

uint64_t sub_2421AF820()
{
  return MEMORY[0x24BE68778]();
}

uint64_t sub_2421AF82C()
{
  return MEMORY[0x24BE68798]();
}

uint64_t sub_2421AF838()
{
  return MEMORY[0x24BE687A8]();
}

uint64_t sub_2421AF844()
{
  return MEMORY[0x24BE687C0]();
}

uint64_t sub_2421AF850()
{
  return MEMORY[0x24BE687C8]();
}

uint64_t sub_2421AF85C()
{
  return MEMORY[0x24BE687F0]();
}

uint64_t sub_2421AF868()
{
  return MEMORY[0x24BE68800]();
}

uint64_t sub_2421AF874()
{
  return MEMORY[0x24BE68810]();
}

uint64_t sub_2421AF880()
{
  return MEMORY[0x24BE68818]();
}

uint64_t sub_2421AF88C()
{
  return MEMORY[0x24BE3BF78]();
}

uint64_t sub_2421AF898()
{
  return MEMORY[0x24BE3BFD0]();
}

uint64_t sub_2421AF8A4()
{
  return MEMORY[0x24BE3BFE0]();
}

uint64_t sub_2421AF8B0()
{
  return MEMORY[0x24BE3C028]();
}

uint64_t sub_2421AF8BC()
{
  return MEMORY[0x24BE3C050]();
}

uint64_t sub_2421AF8C8()
{
  return MEMORY[0x24BE3C070]();
}

uint64_t sub_2421AF8D4()
{
  return MEMORY[0x24BE3C098]();
}

uint64_t sub_2421AF8E0()
{
  return MEMORY[0x24BE3C0B8]();
}

uint64_t sub_2421AF8EC()
{
  return MEMORY[0x24BE3C0D0]();
}

uint64_t sub_2421AF8F8()
{
  return MEMORY[0x24BE3C0E8]();
}

uint64_t sub_2421AF904()
{
  return MEMORY[0x24BE3C108]();
}

uint64_t sub_2421AF910()
{
  return MEMORY[0x24BE3C120]();
}

uint64_t sub_2421AF91C()
{
  return MEMORY[0x24BE3C130]();
}

uint64_t sub_2421AF928()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_2421AF934()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_2421AF940()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_2421AF94C()
{
  return MEMORY[0x24BEE6440]();
}

uint64_t sub_2421AF958()
{
  return MEMORY[0x24BEE6448]();
}

uint64_t sub_2421AF964()
{
  return MEMORY[0x24BEE6450]();
}

uint64_t sub_2421AF970()
{
  return MEMORY[0x24BEE6458]();
}

uint64_t sub_2421AF97C()
{
  return MEMORY[0x24BEE6460]();
}

uint64_t sub_2421AF988()
{
  return MEMORY[0x24BEE6468]();
}

uint64_t sub_2421AF994()
{
  return MEMORY[0x24BEE6478]();
}

uint64_t sub_2421AF9A0()
{
  return MEMORY[0x24BEE6480]();
}

uint64_t sub_2421AF9AC()
{
  return MEMORY[0x24BEE6488]();
}

uint64_t sub_2421AF9B8()
{
  return MEMORY[0x24BEE6490]();
}

uint64_t sub_2421AF9C4()
{
  return MEMORY[0x24BEE64A8]();
}

uint64_t sub_2421AF9D0()
{
  return MEMORY[0x24BEE64B8]();
}

uint64_t sub_2421AF9DC()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_2421AF9E8()
{
  return MEMORY[0x24BEE0270]();
}

uint64_t sub_2421AF9F4()
{
  return MEMORY[0x24BEE02B0]();
}

uint64_t sub_2421AFA00()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_2421AFA0C()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_2421AFA18()
{
  return MEMORY[0x24BDCF8D8]();
}

uint64_t sub_2421AFA24()
{
  return MEMORY[0x24BDCF910]();
}

uint64_t sub_2421AFA30()
{
  return MEMORY[0x24BDCF930]();
}

uint64_t sub_2421AFA3C()
{
  return MEMORY[0x24BDCF938]();
}

uint64_t sub_2421AFA48()
{
  return MEMORY[0x24BDCF948]();
}

uint64_t sub_2421AFA54()
{
  return MEMORY[0x24BDCF968]();
}

uint64_t sub_2421AFA60()
{
  return MEMORY[0x24BDCF978]();
}

uint64_t sub_2421AFA6C()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_2421AFA78()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_2421AFA84()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_2421AFA90()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_2421AFA9C()
{
  return MEMORY[0x24BDCFB20]();
}

uint64_t sub_2421AFAA8()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_2421AFAB4()
{
  return MEMORY[0x24BEE0A30]();
}

uint64_t sub_2421AFAC0()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_2421AFACC()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_2421AFAD8()
{
  return MEMORY[0x24BEE0BE8]();
}

uint64_t sub_2421AFAE4()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_2421AFAF0()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_2421AFAFC()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_2421AFB08()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_2421AFB14()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_2421AFB20()
{
  return MEMORY[0x24BEE68C8]();
}

uint64_t sub_2421AFB2C()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_2421AFB38()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_2421AFB44()
{
  return MEMORY[0x24BEE6A50]();
}

uint64_t sub_2421AFB50()
{
  return MEMORY[0x24BEE6A58]();
}

uint64_t sub_2421AFB5C()
{
  return MEMORY[0x24BEE1598]();
}

uint64_t sub_2421AFB68()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_2421AFB74()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_2421AFB80()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_2421AFB8C()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_2421AFB98()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_2421AFBA4()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_2421AFBB0()
{
  return MEMORY[0x24BEE58F0]();
}

uint64_t sub_2421AFBBC()
{
  return MEMORY[0x24BEE5908]();
}

uint64_t sub_2421AFBC8()
{
  return MEMORY[0x24BDD01F0]();
}

uint64_t sub_2421AFBD4()
{
  return MEMORY[0x24BDD01F8]();
}

uint64_t sub_2421AFBE0()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_2421AFBEC()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_2421AFBF8()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_2421AFC04()
{
  return MEMORY[0x24BDD0670]();
}

uint64_t sub_2421AFC10()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_2421AFC1C()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_2421AFC28()
{
  return MEMORY[0x24BEE23E8]();
}

uint64_t sub_2421AFC34()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_2421AFC40()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_2421AFC4C()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_2421AFC58()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_2421AFC64()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_2421AFC70()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_2421AFC7C()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_2421AFC88()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_2421AFC94()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_2421AFCA0()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_2421AFCAC()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_2421AFCB8()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_2421AFCC4()
{
  return MEMORY[0x24BEE2E58]();
}

uint64_t sub_2421AFCD0()
{
  return MEMORY[0x24BEE2E68]();
}

uint64_t sub_2421AFCDC()
{
  return MEMORY[0x24BEE2E70]();
}

uint64_t sub_2421AFCE8()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_2421AFCF4()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_2421AFD00()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_2421AFD0C()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_2421AFD18()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_2421AFD24()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_2421AFD30()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_2421AFD3C()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_2421AFD48()
{
  return MEMORY[0x24BEE3A20]();
}

uint64_t sub_2421AFD54()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_2421AFD60()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_2421AFD6C()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_2421AFD78()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_2421AFD84()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_2421AFD90()
{
  return MEMORY[0x24BEE4310]();
}

uint64_t sub_2421AFD9C()
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

void _exit(int a1)
{
  MEMORY[0x24BDACAC8](*(_QWORD *)&a1);
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

uint64_t _set_user_dir_suffix()
{
  return MEMORY[0x24BDACC40]();
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

size_t confstr(int a1, char *a2, size_t a3)
{
  return MEMORY[0x24BDADA08](*(_QWORD *)&a1, a2, a3);
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x24BDADC58](object);
}

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC8](queue, block);
}

void dispatch_main(void)
{
  MEMORY[0x24BDADE88]();
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

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x24BDAF4D0]();
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return (char *)MEMORY[0x24BDAFAC0](a1, a2);
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

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x24BEE4B78]();
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

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x24BEE4BE0]();
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

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x24BEE4CD0]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x24BEE4CD8]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x24BEE4D18]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x24BEE4E28]();
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

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x24BEE4F48]();
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

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x24BEE5058]();
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x24BDB0660](xarray);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x24BDB06A0](xarray, index);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x24BDB06E0](xBOOL);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x24BDB0880](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x24BDB0888](xdata);
}

uint64_t xpc_date_get_value_absolute()
{
  return MEMORY[0x24BDB08A8]();
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x24BDB08B0](xdict, applier);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x24BDB0950](xdict, key);
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

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return MEMORY[0x24BDB0A88](xint);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
  MEMORY[0x24BDB0B58](stream, targetq, handler);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x24BDB0BA8](xstring);
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return MEMORY[0x24BDB0BE0](xuint);
}

const uint8_t *__cdecl xpc_uuid_get_bytes(xpc_object_t xuuid)
{
  return (const uint8_t *)MEMORY[0x24BDB0C00](xuuid);
}

