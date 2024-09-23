uint64_t objectdestroy_2Tm_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v1 = sub_21EB02300();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (((((v3 + *(_QWORD *)(v2 + 64) + 31) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  swift_release();
  swift_bridgeObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_21EAEC888(NSObject *a1, void *a2)
{
  uint64_t v2;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;

  v5 = *(_QWORD *)(sub_21EB02300() - 8);
  v6 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v7 = v6 + *(_QWORD *)(v5 + 64);
  v8 = (v7 + 7) & 0xFFFFFFFFFFFFFFF8;
  v9 = (v7 + 31) & 0xFFFFFFFFFFFFFFF8;
  return sub_21EAE51AC(a1, a2, v2 + v6, *(uint64_t (**)(_QWORD))(v2 + v8), *(_QWORD *)(v2 + v8 + 8), *(unsigned __int8 *)(v2 + v8 + 16), *(_QWORD *)(v2 + v9), *(_QWORD *)(v2 + v9 + 8), *(_QWORD *)(v2 + ((v9 + 23) & 0xFFFFFFFFFFFFFFF8)), *(void **)(v2 + ((((v9 + 23) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)), *(void **)(v2+ ((((((v9 + 23) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFF8)));
}

uint64_t sub_21EAEC938()
{
  uint64_t v0;
  uint64_t v1;

  v1 = sub_21EB02300();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 17) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21EAEC9CC(int a1)
{
  uint64_t v1;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;

  v3 = *(_QWORD *)(sub_21EB02300() - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 17) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v5 = v4 + *(_QWORD *)(v3 + 64);
  return sub_21EAE41B4(a1, *(unsigned __int8 *)(v1 + 16), v1 + v4, *(_QWORD *)(v1 + ((v5 + 7) & 0xFFFFFFFFFFFFFFF8)), *(_QWORD *)(v1 + ((v5 + 7) & 0xFFFFFFFFFFFFFFF8) + 8), *(_BYTE *)(v1 + ((v5 + 7) & 0xFFFFFFFFFFFFFFF8) + 16), *(uint64_t (**)(_QWORD))(v1 + ((v5 + 31) & 0xFFFFFFFFFFFFFFF8)), *(_QWORD *)(v1 + ((v5 + 31) & 0xFFFFFFFFFFFFFFF8) + 8));
}

uint64_t sub_21EAECA38()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v1 = sub_21EB02300();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (((*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  swift_bridgeObjectRelease();

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)(v0
                     + ((((((((((v4 + 15) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)
                         + 15) & 0xFFFFFFFFFFFFFFF8)
                       + 15) & 0xFFFFFFFFFFFFFFF8)));
  return swift_deallocObject();
}

void sub_21EAECB24(void *a1, void *a2)
{
  uint64_t v2;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;

  v5 = *(_QWORD *)(sub_21EB02300() - 8);
  v6 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v7 = (*(_QWORD *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
  v8 = (v7 + 23) & 0xFFFFFFFFFFFFFFF8;
  v9 = (v8 + 15) & 0xFFFFFFFFFFFFFFF8;
  v10 = (v9 + 23) & 0xFFFFFFFFFFFFFFF8;
  sub_21EAE4DB0(a1, a2, v2 + v6, *(_QWORD *)(v2 + v7), *(_QWORD *)(v2 + v7 + 8), *(void **)(v2 + v8), *(_QWORD *)(v2 + v9), *(_QWORD *)(v2 + v9 + 8), *(_QWORD *)(v2 + v10), *(_QWORD *)(v2 + ((v10 + 15) & 0xFFFFFFFFFFFFFFF8)), *(_QWORD *)(v2 + ((((v10 + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)), *(void **)(v2 + ((((((v10 + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFF8)));
}

uint64_t sub_21EAECBE8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v1 = sub_21EB02300();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (((((((*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)
      + 15) & 0xFFFFFFFFFFFFFFF8;

  swift_bridgeObjectRelease();
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_deallocObject();
}

void sub_21EAECCC0(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;

  v3 = *(_QWORD *)(sub_21EB02300() - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v5 = (*(_QWORD *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  sub_21EAE49BC(a1, *(void **)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(void **)(v1 + 40), *(void (**)(_QWORD))(v1 + 48), *(_QWORD *)(v1 + 56), v1 + v4, *(_QWORD *)(v1 + v5), *(_QWORD *)(v1 + ((v5 + 15) & 0xFFFFFFFFFFFFFFF8)), *(_QWORD *)(v1 + ((((v5 + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)), *(_QWORD *)(v1 + ((((((v5 + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFF8)));
}

uint64_t sub_21EAECD54()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_21EAECD80()
{
  id v0;

  v0 = (id)sub_21EB02228();
  DOCPresentAlertForError();

}

uint64_t sub_21EAECDB8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = sub_21EB02300();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  if (*(_QWORD *)(v0 + 16))
    swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + ((v3 + 32) & ~v3), v1);
  return swift_deallocObject();
}

uint64_t sub_21EAECE40()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v1 = sub_21EB02300();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 17) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (((((((*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)
      + 15) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  swift_bridgeObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_21EAECF18()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v1 = *(_QWORD *)(sub_21EB02300() - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 17) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v3 = (*(_QWORD *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8;
  v4 = (v3 + 23) & 0xFFFFFFFFFFFFFFF8;
  v5 = (v4 + 23) & 0xFFFFFFFFFFFFFFF8;
  v6 = (v5 + 15) & 0xFFFFFFFFFFFFFFF8;
  sub_21EAE3B0C(*(_QWORD *)(v0 + ((((v6 + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)), *(_QWORD *)(v0 + ((((v6 + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 8), *(_BYTE *)(v0 + 16), v0 + v2, *(_QWORD *)(v0 + v3), *(_QWORD *)(v0 + v3 + 8), *(_QWORD *)(v0 + v4), *(_QWORD *)(v0 + v4 + 8), *(_QWORD *)(v0 + v5), *(void **)(v0 + v6), *(void **)(v0 + ((v6 + 15) & 0xFFFFFFFFFFFFFFF8)));
}

uint64_t sub_21EAED010(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v4 = sub_21EB02C30();
  v6 = a1;
  if (v5)
  {
    v7 = v4;
    v8 = v5;
    v6 = a1;
    do
    {
      if ((v6 ^ a2) < 0x4000)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        goto LABEL_12;
      }
      v11 = sub_21EB0311C();
      v13 = v12;
      v6 = sub_21EB03110();
      if (v7 == v11 && v8 == v13)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      else
      {
        v9 = sub_21EB034C4();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v9 & 1) == 0)
        {
          swift_bridgeObjectRelease();
LABEL_14:
          swift_bridgeObjectRelease();
          return 0;
        }
      }
      v7 = sub_21EB02C30();
      v8 = v10;
    }
    while (v10);
  }
  swift_bridgeObjectRelease();
  if ((v6 ^ a2) >= 0x4000)
  {
    sub_21EB0311C();
    sub_21EB03110();
    swift_bridgeObjectRelease();
    goto LABEL_14;
  }
LABEL_12:
  swift_bridgeObjectRelease();
  return 1;
}

uint64_t sub_21EAED1F8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL8 v10;

  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v0 = sub_21EB02C30();
  if (v1)
  {
    v2 = v0;
    v3 = v1;
    do
    {
      v6 = sub_21EB02C30();
      if (!v7)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return 1;
      }
      if (v2 == v6 && v3 == v7)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      else
      {
        v4 = sub_21EB034C4();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v4 & 1) == 0)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          return 0;
        }
      }
      v2 = sub_21EB02C30();
      v3 = v5;
    }
    while (v5);
  }
  swift_bridgeObjectRelease();
  sub_21EB02C30();
  v9 = v8;
  swift_bridgeObjectRelease();
  v10 = v9 == 0;
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_21EAED35C(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t i;
  uint64_t v4;
  _BOOL8 v5;
  BOOL v6;

  v2 = *(_QWORD *)(a2 + 16);
  if (!v2)
    return 0;
  if (*(_QWORD *)(a2 + 32) == result)
    return 1;
  if (v2 == 1)
    return 0;
  for (i = 5; ; ++i)
  {
    v4 = i - 3;
    if (__OFADD__(i - 4, 1))
      break;
    v6 = *(_QWORD *)(a2 + 8 * i) == result;
    v5 = v6;
    v6 = v6 || v4 == v2;
    if (v6)
      return v5;
  }
  __break(1u);
  return result;
}

id sub_21EAED3C0()
{
  id result;

  result = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDB00]), sel_init);
  qword_25546C370 = (uint64_t)result;
  return result;
}

uint64_t DOCTypeToFocusController.delegate.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC26DocumentManagerExecutables24DOCTypeToFocusController_delegate;
  swift_beginAccess();
  return MEMORY[0x2207B6ACC](v1);
}

void (*DOCTypeToFocusController.delegate.modify(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = malloc(0x38uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC26DocumentManagerExecutables24DOCTypeToFocusController_delegate;
  v3[5] = v1;
  v3[6] = v4;
  v5 = v1 + v4;
  swift_beginAccess();
  v6 = MEMORY[0x2207B6ACC](v5);
  v7 = *(_QWORD *)(v5 + 8);
  v3[3] = v6;
  v3[4] = v7;
  return sub_21EAED4B0;
}

void sub_21EAED4B0(uint64_t a1, char a2)
{
  void *v3;

  v3 = *(void **)a1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a1 + 40) + *(_QWORD *)(*(_QWORD *)a1 + 48) + 8) = *(_QWORD *)(*(_QWORD *)a1 + 32);
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

uint64_t DOCTypeToFocusController.autocorrectionType.getter()
{
  return 1;
}

uint64_t (*DOCTypeToFocusController.autocorrectionType.modify(_QWORD *a1))()
{
  *a1 = 1;
  return nullsub_1;
}

id DOCTypeToFocusController.inputAssistantItem.getter()
{
  return objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDA68]), sel_init);
}

uint64_t DOCTypeToFocusController.hasText.getter()
{
  return 0;
}

BOOL DOCTypeToFocusController.isTyping.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + OBJC_IVAR____TtC26DocumentManagerExecutables24DOCTypeToFocusController_typeToFocusTimeout) != 0;
}

Swift::Void __swiftcall DOCTypeToFocusController.insertText(_:)(Swift::String a1)
{
  uint64_t v1;
  uint64_t v2;
  void *object;
  uint64_t countAndFlagsBits;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t ObjectType;
  uint64_t (*v20)(uint64_t);
  char v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  id v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD aBlock[3];
  void *v36;
  void (*v37)(uint64_t);
  uint64_t v38;
  _OWORD v39[2];
  uint64_t v40;

  v2 = v1;
  object = a1._object;
  countAndFlagsBits = a1._countAndFlagsBits;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25546C388);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = sub_21EB02438();
  v8 = *(_QWORD *)(v34 - 8);
  MEMORY[0x24BDAC7A8](v34);
  v10 = (char *)&v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = (uint64_t *)(v1 + OBJC_IVAR____TtC26DocumentManagerExecutables24DOCTypeToFocusController_typeToFocusInputBuffer);
  swift_beginAccess();
  swift_bridgeObjectRetain();
  v12 = sub_21EB02BE8();
  swift_bridgeObjectRelease();
  v13 = countAndFlagsBits;
  if (v12)
  {
    v14 = (uint64_t)object;
    LOBYTE(v15) = 0;
  }
  else
  {
    v16 = countAndFlagsBits;
    v14 = (uint64_t)object;
    v15 = sub_21EA5DFD0(v16, (uint64_t)object, qword_24E3287B8);
    swift_arrayDestroy();
  }
  v17 = v2 + OBJC_IVAR____TtC26DocumentManagerExecutables24DOCTypeToFocusController_delegate;
  swift_beginAccess();
  if (MEMORY[0x2207B6ACC](v17))
  {
    if ((v15 & 1) == 0)
    {
      v18 = *(_QWORD *)(v17 + 8);
      ObjectType = swift_getObjectType();
      v20 = *(uint64_t (**)(uint64_t))(v18 + 8);
      v33 = ObjectType;
      if ((v20(v2) & 1) != 0)
      {
        v32 = v18;
        v21 = sub_21EA5DFD0(v13, v14, qword_24E3287E8);
        swift_arrayDestroy();
        if ((v21 & 1) == 0)
        {
          swift_beginAccess();
          sub_21EB02C0C();
          swift_endAccess();
          v40 = 0;
          memset(v39, 0, sizeof(v39));
          v22 = *v11;
          v23 = (char *)v11[1];
          swift_bridgeObjectRetain();
          sub_21EAEDE80(v22, v23, (uint64_t)v39, (uint64_t)v7);
          swift_bridgeObjectRelease();
          v24 = v34;
          if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v7, 1, v34) == 1)
          {
            sub_21EA59E08((uint64_t)v7, &qword_25546C388);
          }
          else
          {
            (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v10, v7, v24);
            sub_21EAEE860((uint64_t)v39, (uint64_t)aBlock);
            if (!v36)
            {
              __break(1u);
              return;
            }
            (*(void (**)(uint64_t, _QWORD *, char *, uint64_t))(v32 + 32))(v2, aBlock, v10, v33);
            (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v24);
            __swift_destroy_boxed_opaque_existential_0((uint64_t)aBlock);
          }
          v25 = OBJC_IVAR____TtC26DocumentManagerExecutables24DOCTypeToFocusController_typeToFocusTimeout;
          objc_msgSend(*(id *)(v2 + OBJC_IVAR____TtC26DocumentManagerExecutables24DOCTypeToFocusController_typeToFocusTimeout), sel_invalidate);
          v26 = (void *)objc_opt_self();
          v27 = swift_allocObject();
          swift_unknownObjectWeakInit();
          v37 = sub_21EAEE858;
          v38 = v27;
          aBlock[0] = MEMORY[0x24BDAC760];
          aBlock[1] = 1107296256;
          aBlock[2] = sub_21EAA71A8;
          v36 = &block_descriptor_23;
          v28 = _Block_copy(aBlock);
          swift_release();
          v29 = objc_msgSend(v26, sel_scheduledTimerWithTimeInterval_repeats_block_, 0, v28, 0.5);
          _Block_release(v28);
          v30 = *(void **)(v2 + v25);
          *(_QWORD *)(v2 + v25) = v29;
          swift_unknownObjectRelease();

          sub_21EA59E08((uint64_t)v39, &qword_25546C398);
          return;
        }
      }
    }
    swift_unknownObjectRelease();
  }
}

uint64_t DOCTypeToFocusController.inputView.getter()
{
  uint64_t v0;
  id v1;

  if (qword_255469C58 != -1)
    swift_once();
  v0 = qword_25546C370;
  v1 = (id)qword_25546C370;
  return v0;
}

void DOCTypeToFocusController.handlePressesBegan(_:with:)(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  unsigned int v4;

  if (a2)
  {
    v3 = a2;
    if ((objc_msgSend(v3, sel_modifierFlags) & 0x80000) != 0
      || (objc_msgSend(v3, sel_modifierFlags) & 0x40000) != 0)
    {

    }
    else
    {
      v4 = objc_msgSend(v3, sel_modifierFlags);

      if ((v4 & 0x100000) == 0)
        return;
    }
    *(_BYTE *)(v2 + OBJC_IVAR____TtC26DocumentManagerExecutables24DOCTypeToFocusController_eventHadModifierKey) = 1;
  }
}

void DOCTypeToFocusController.handlePressesEnded(_:with:)(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  Swift::String v15;
  id v16;
  id v17;
  id v18;

  if ((a1 & 0xC000000000000001) != 0)
  {
    if (sub_21EB0323C() != 1)
      return;
  }
  else if (*(_QWORD *)(a1 + 16) != 1)
  {
    return;
  }
  v4 = swift_bridgeObjectRetain();
  v18 = (id)sub_21EA7D104(v4);
  swift_bridgeObjectRelease();
  if (v18)
  {
    v5 = objc_msgSend(v18, sel_key);
    if (v5)
    {
      v16 = v5;
      if (!a2)
      {

        v9 = v16;
LABEL_24:

        return;
      }
      v17 = a2;
      v6 = objc_msgSend(v17, sel_allPresses);
      sub_21EA7ED90();
      sub_21EAEE954();
      v7 = sub_21EB02E1C();

      if ((v7 & 0xC000000000000001) != 0)
        v8 = sub_21EB0323C();
      else
        v8 = *(_QWORD *)(v7 + 16);
      swift_bridgeObjectRelease();
      if ((objc_msgSend(v17, sel_modifierFlags) & 0x80000) != 0
        || (objc_msgSend(v17, sel_modifierFlags) & 0x40000) != 0
        || (objc_msgSend(v17, sel_modifierFlags) & 0x100000) != 0
        || (sub_21EAED35C((uint64_t)objc_msgSend(v18, sel_type), (uint64_t)&unk_24E328818) & 1) != 0)
      {

        v9 = v17;
        goto LABEL_24;
      }
      if (v8 == 1)
      {
        v10 = OBJC_IVAR____TtC26DocumentManagerExecutables24DOCTypeToFocusController_eventHadModifierKey;
        if ((*(_BYTE *)(v2 + OBJC_IVAR____TtC26DocumentManagerExecutables24DOCTypeToFocusController_eventHadModifierKey) & 1) == 0)
        {
          v11 = objc_msgSend(v16, sel_characters);
          v12 = sub_21EB02B88();
          v14 = v13;

          v15._countAndFlagsBits = v12;
          v15._object = v14;
          DOCTypeToFocusController.insertText(_:)(v15);
          swift_bridgeObjectRelease();
        }

        *(_BYTE *)(v2 + v10) = 0;
        return;
      }

    }
    v9 = v18;
    goto LABEL_24;
  }
}

void DOCTypeToFocusController.handlePressesCancelled(_:with:)()
{
  uint64_t v0;

  *(_BYTE *)(v0 + OBJC_IVAR____TtC26DocumentManagerExecutables24DOCTypeToFocusController_eventHadModifierKey) = 0;
}

void sub_21EAEDD70(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  _QWORD *v5;
  void *v6;

  v2 = a2 + 16;
  swift_beginAccess();
  v3 = MEMORY[0x2207B6ACC](v2);
  if (v3)
  {
    v4 = (char *)v3;
    v5 = (_QWORD *)(v3 + OBJC_IVAR____TtC26DocumentManagerExecutables24DOCTypeToFocusController_typeToFocusInputBuffer);
    swift_beginAccess();
    *v5 = 0;
    v5[1] = 0xE000000000000000;
    swift_bridgeObjectRelease();
    v6 = *(void **)&v4[OBJC_IVAR____TtC26DocumentManagerExecutables24DOCTypeToFocusController_typeToFocusTimeout];
    *(_QWORD *)&v4[OBJC_IVAR____TtC26DocumentManagerExecutables24DOCTypeToFocusController_typeToFocusTimeout] = 0;

  }
}

uint64_t sub_21EAEDE80@<X0>(uint64_t a1@<X0>, char *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t v5;
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
  char *v20;
  uint64_t ObjectType;
  uint64_t v22;
  uint64_t v23;
  uint64_t result;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
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
  char *v50;
  char *v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  _QWORD v65[2];
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  void (*v75)(char *, _QWORD, uint64_t, uint64_t);
  id v76;
  uint64_t v77;
  uint64_t v78;
  __int128 v79;
  uint64_t v80;
  uint64_t v81;
  __int128 v82;
  __int128 v83;
  uint64_t v84;
  uint64_t v85;
  char *v86;

  v5 = v4;
  v74 = a3;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25546B120);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)v65 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_25546C388);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)v65 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = v5 + OBJC_IVAR____TtC26DocumentManagerExecutables24DOCTypeToFocusController_delegate;
  swift_beginAccess();
  v16 = MEMORY[0x2207B6ACC](v15);
  if (v16)
  {
    v17 = v16;
    v73 = v14;
    v18 = *(_QWORD *)(v15 + 8);
    if (qword_2540A6CB8 != -1)
      swift_once();
    sub_21EB02EDC();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2540A6F70);
    v19 = swift_allocObject();
    *(_OWORD *)(v19 + 16) = xmmword_21EB08F10;
    *(_QWORD *)(v19 + 56) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v19 + 64) = sub_21EA5EA3C();
    *(_QWORD *)(v19 + 32) = a1;
    *(_QWORD *)(v19 + 40) = a2;
    swift_bridgeObjectRetain();
    sub_21EB025F4();
    swift_bridgeObjectRelease();
    v20 = a2;
    ObjectType = swift_getObjectType();
    v22 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v18 + 16))(v5, ObjectType, v18);
    if (!a1 && v20 == (char *)0xE000000000000000 || (sub_21EB034C4() & 1) != 0)
    {
      v23 = sub_21EB02438();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(a4, 1, 1, v23);
      swift_unknownObjectRelease();
      return swift_bridgeObjectRelease();
    }
    v69 = a4;
    v71 = v20;
    v25 = sub_21EB02BE8();
    v72 = v22;
    v68 = v5;
    v70 = v18;
    v67 = ObjectType;
    if (v25)
    {
      v85 = a1;
      v86 = v71;
      v76 = (id)objc_opt_self();
      v26 = objc_msgSend(v76, sel_currentLocale);
      sub_21EB023D8();

      v27 = sub_21EB023F0();
      v75 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 56);
      v75(v11, 0, 1, v27);
      sub_21EA8E234();
      sub_21EB031AC();
      sub_21EA59E08((uint64_t)v11, &qword_25546B120);
      v28 = *(_QWORD *)(v22 + 16);
      if (v28)
      {
        v65[1] = a1;
        v66 = v17;
        v29 = v22 + 32;
        swift_bridgeObjectRetain();
        while (1)
        {
          sub_21EA5F908(v29, (uint64_t)&v79);
          v30 = v80;
          v31 = v81;
          __swift_project_boxed_opaque_existential_0(&v79, v80);
          v77 = (*(uint64_t (**)(uint64_t, uint64_t))(v31 + 8))(v30, v31);
          v78 = v32;
          v33 = objc_msgSend(v76, sel_currentLocale);
          sub_21EB023D8();

          v75(v11, 0, 1, v27);
          sub_21EB031AC();
          sub_21EA59E08((uint64_t)v11, &qword_25546B120);
          swift_bridgeObjectRelease();
          LOBYTE(v33) = sub_21EAED1F8();
          swift_bridgeObjectRelease();
          if ((v33 & 1) != 0)
            break;
          __swift_destroy_boxed_opaque_existential_0((uint64_t)&v79);
          v29 += 40;
          if (!--v28)
          {
            swift_bridgeObjectRelease();
            v17 = v66;
            goto LABEL_15;
          }
        }
        swift_bridgeObjectRelease();
        sub_21EA5F94C(&v79, (uint64_t)&v82);
        swift_bridgeObjectRelease();
        v17 = v66;
      }
      else
      {
LABEL_15:
        v84 = 0;
        v82 = 0u;
        v83 = 0u;
        swift_bridgeObjectRelease();
      }
      v5 = v68;
      v34 = v74;
      v35 = v70;
      v36 = v67;
      if (*((_QWORD *)&v83 + 1))
      {
        sub_21EA59E08(v74, &qword_25546C398);
        sub_21EA5F94C(&v82, (uint64_t)&v85);
        sub_21EA5F908((uint64_t)&v85, v34);
        v37 = (uint64_t)v73;
        (*(void (**)(uint64_t, uint64_t *, uint64_t, uint64_t))(v35 + 24))(v5, &v85, v36, v35);
        __swift_destroy_boxed_opaque_existential_0((uint64_t)&v85);
        v38 = sub_21EB02438();
        v39 = *(_QWORD *)(v38 - 8);
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v39 + 48))(v37, 1, v38) != 1)
        {
          swift_unknownObjectRelease();
          swift_bridgeObjectRelease();
          v40 = v69;
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v39 + 32))(v69, v37, v38);
          return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v39 + 56))(v40, 0, 1, v38);
        }
LABEL_22:
        sub_21EA59E08(v37, &qword_25546C388);
        swift_bridgeObjectRetain();
        v42 = sub_21EAEE99C(1);
        v44 = v43;
        v46 = v45;
        v48 = v47;
        swift_bridgeObjectRelease();
        v49 = MEMORY[0x2207B53EC](v42, v44, v46, v48);
        v51 = v50;
        swift_bridgeObjectRelease();
        if (sub_21EB02BE8())
        {
          v66 = v17;
          v85 = v49;
          v86 = v51;
          v73 = v51;
          v76 = (id)objc_opt_self();
          v52 = objc_msgSend(v76, sel_currentLocale);
          sub_21EB023D8();

          v53 = sub_21EB023F0();
          v75 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v53 - 8) + 56);
          v75(v11, 0, 1, v53);
          sub_21EA8E234();
          sub_21EB031AC();
          sub_21EA59E08((uint64_t)v11, &qword_25546B120);
          v54 = *(_QWORD *)(v72 + 16);
          if (v54)
          {
            v55 = v72 + 32;
            swift_bridgeObjectRetain();
            while (1)
            {
              sub_21EA5F908(v55, (uint64_t)&v79);
              v57 = v80;
              v56 = v81;
              __swift_project_boxed_opaque_existential_0(&v79, v80);
              v77 = (*(uint64_t (**)(uint64_t, uint64_t))(v56 + 8))(v57, v56);
              v78 = v58;
              v59 = objc_msgSend(v76, sel_currentLocale);
              sub_21EB023D8();

              v75(v11, 0, 1, v53);
              sub_21EB031AC();
              sub_21EA59E08((uint64_t)v11, &qword_25546B120);
              swift_bridgeObjectRelease();
              LOBYTE(v56) = sub_21EAED1F8();
              swift_bridgeObjectRelease();
              if ((v56 & 1) != 0)
                break;
              __swift_destroy_boxed_opaque_existential_0((uint64_t)&v79);
              v55 += 40;
              if (!--v54)
              {
                swift_bridgeObjectRelease();
                v5 = v68;
                goto LABEL_28;
              }
            }
            swift_bridgeObjectRelease();
            sub_21EA5F94C(&v79, (uint64_t)&v82);
            swift_bridgeObjectRelease();
            v5 = v68;
          }
          else
          {
LABEL_28:
            v84 = 0;
            v82 = 0u;
            v83 = 0u;
            swift_bridgeObjectRelease();
          }
          v61 = v69;
          v62 = v74;
          v63 = v70;
          if (*((_QWORD *)&v83 + 1))
          {
            sub_21EA59E08(v74, &qword_25546C398);
            sub_21EA5F94C(&v82, (uint64_t)&v85);
            sub_21EA5F908((uint64_t)&v85, v62);
            (*(void (**)(uint64_t, uint64_t *, uint64_t, uint64_t))(v63 + 24))(v5, &v85, v67, v63);
            __swift_destroy_boxed_opaque_existential_0((uint64_t)&v85);
          }
          else
          {
            sub_21EA59E08((uint64_t)&v82, &qword_25546C398);
            v64 = sub_21EB02438();
            (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v64 - 8) + 56))(v61, 1, 1, v64);
          }
          swift_unknownObjectRelease();
          swift_bridgeObjectRelease();
        }
        else
        {
          v60 = sub_21EB02438();
          (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v60 - 8) + 56))(v69, 1, 1, v60);
          swift_unknownObjectRelease();
          swift_bridgeObjectRelease();
        }
        return swift_bridgeObjectRelease();
      }
      sub_21EA59E08((uint64_t)&v82, &qword_25546C398);
    }
    v41 = sub_21EB02438();
    v37 = (uint64_t)v73;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v41 - 8) + 56))(v73, 1, 1, v41);
    goto LABEL_22;
  }
  result = sub_21EB033C8();
  __break(1u);
  return result;
}

uint64_t sub_21EAEE834()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_21EAEE858(uint64_t a1)
{
  uint64_t v1;

  sub_21EAEDD70(a1, v1);
}

uint64_t sub_21EAEE860(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25546C398);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

id DOCTypeToFocusController.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id DOCTypeToFocusController.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DOCTypeToFocusController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_21EAEE954()
{
  unint64_t result;
  unint64_t v1;

  result = qword_25546C3B0;
  if (!qword_25546C3B0)
  {
    v1 = sub_21EA7ED90();
    result = MEMORY[0x2207B694C](MEMORY[0x24BEE5BD8], v1);
    atomic_store(result, (unint64_t *)&qword_25546C3B0);
  }
  return result;
}

uint64_t sub_21EAEE99C(uint64_t result)
{
  uint64_t v1;

  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    v1 = result;
    result = sub_21EB02BE8();
    if (!__OFSUB__(result, v1))
    {
      sub_21EB02BF4();
      return sub_21EB02C78();
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_21EAEEA54(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  uint64_t v4;
  uint64_t ObjectType;

  result = MEMORY[0x2207B6ACC](v1 + 16);
  if (result)
  {
    v4 = *(_QWORD *)(v1 + 24);
    ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 8))(a1, ObjectType, v4);
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t DOCAssertion.__allocating_init(traceInfo:)(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = swift_allocObject();
  *(_BYTE *)(result + 32) = 1;
  *(_QWORD *)(result + 40) = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(result + 16) = a1;
  *(_QWORD *)(result + 24) = a2;
  return result;
}

uint64_t DOCAssertion.init(traceInfo:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_BYTE *)(v2 + 32) = 1;
  *(_QWORD *)(v2 + 40) = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return v2;
}

uint64_t DOCAssertion.deinit()
{
  uint64_t v0;

  if (*(_BYTE *)(v0 + 32) == 1)
    sub_21EAEEB64(0);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_21EAEEB64(uint64_t result)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t j;
  uint64_t v15;
  uint64_t v16;
  uint64_t ObjectType;
  unint64_t v18;

  v2 = *(unsigned __int8 *)(v1 + 32);
  *(_BYTE *)(v1 + 32) = result;
  if (v2 == 1 && (result & 1) == 0)
  {
    v3 = v1;
    v4 = (unint64_t *)(v1 + 40);
    swift_beginAccess();
    v5 = *(_QWORD *)(v1 + 40);
    v6 = MEMORY[0x24BEE4AF8];
    v18 = MEMORY[0x24BEE4AF8];
    if (v5 >> 62)
    {
      swift_bridgeObjectRetain();
      result = sub_21EB0341C();
      v7 = result;
      if (result)
        goto LABEL_5;
    }
    else
    {
      v7 = *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10);
      result = swift_bridgeObjectRetain();
      if (v7)
      {
LABEL_5:
        if (v7 < 1)
        {
          __break(1u);
          goto LABEL_32;
        }
        for (i = 0; i != v7; ++i)
        {
          if ((v5 & 0xC000000000000001) != 0)
          {
            v9 = MEMORY[0x2207B5B3C](i, v5);
          }
          else
          {
            v9 = *(_QWORD *)(v5 + 8 * i + 32);
            sub_21EB01F10();
          }
          v10 = MEMORY[0x2207B6ACC](v9 + 16);
          swift_unknownObjectRelease();
          if (v10)
          {
            sub_21EB03338();
            sub_21EB03368();
            sub_21EB03374();
            sub_21EB03344();
          }
          else
          {
            swift_release();
          }
        }
        swift_bridgeObjectRelease();
        v11 = v18;
LABEL_17:
        *v4 = v11;
        result = swift_bridgeObjectRelease();
        v12 = *v4;
        *v4 = v6;
        if (v12 >> 62)
        {
          swift_bridgeObjectRetain();
          v13 = sub_21EB0341C();
          result = swift_bridgeObjectRelease();
          if (v13)
          {
LABEL_19:
            if (v13 >= 1)
            {
              for (j = 0; j != v13; ++j)
              {
                if ((v12 & 0xC000000000000001) != 0)
                {
                  v15 = MEMORY[0x2207B5B3C](j, v12);
                }
                else
                {
                  v15 = *(_QWORD *)(v12 + 8 * j + 32);
                  sub_21EB01F10();
                }
                if (MEMORY[0x2207B6ACC](v15 + 16))
                {
                  v16 = *(_QWORD *)(v15 + 24);
                  ObjectType = swift_getObjectType();
                  (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 8))(v3, ObjectType, v16);
                  swift_release();
                  swift_unknownObjectRelease();
                }
                else
                {
                  swift_release();
                }
              }
              return swift_bridgeObjectRelease();
            }
LABEL_32:
            __break(1u);
            return result;
          }
        }
        else
        {
          v13 = *(_QWORD *)((v12 & 0xFFFFFFFFFFFFF8) + 0x10);
          if (v13)
            goto LABEL_19;
        }
        return swift_bridgeObjectRelease();
      }
    }
    swift_bridgeObjectRelease();
    v11 = MEMORY[0x24BEE4AF8];
    goto LABEL_17;
  }
  return result;
}

Swift::Void __swiftcall DOCAssertion.invalidate()()
{
  sub_21EAEEB64(0);
}

_QWORD *DOCAssertionCollection.__allocating_init(debugName:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *result;
  uint64_t v9;

  result = (_QWORD *)swift_allocObject();
  v9 = MEMORY[0x24BEE4AF8];
  result[5] = a1;
  result[6] = a2;
  result[2] = v9;
  result[3] = a3;
  result[4] = a4;
  return result;
}

_QWORD *DOCAssertionCollection.init(debugName:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;

  v4[6] = a2;
  v4[2] = MEMORY[0x24BEE4AF8];
  v4[3] = a3;
  v4[4] = a4;
  v4[5] = a1;
  return v4;
}

uint64_t DOCAssertionCollection.add(_:autoInvalidationTimeout:)(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3;
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
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;
  double v21;
  double v22;
  void *v23;
  void (*v24)(char *, uint64_t);
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  double v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD aBlock[6];

  v29 = *(double *)&a2;
  v6 = sub_21EB02A20();
  v33 = *(_QWORD *)(v6 - 8);
  v34 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_21EB02A5C();
  v31 = *(_QWORD *)(v9 - 8);
  v32 = v9;
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = sub_21EB02A74();
  v12 = *(_QWORD *)(v30 - 8);
  v13 = MEMORY[0x24BDAC7A8](v30);
  v15 = (char *)&v29 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v29 - v16;
  sub_21EA61D30(v3, a1);
  swift_beginAccess();
  v18 = sub_21EB01F10();
  MEMORY[0x2207B5500](v18);
  if (*(_QWORD *)((*(_QWORD *)(v3 + 16) & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*(_QWORD *)(v3 + 16) & 0xFFFFFFFFFFFFFF8)
                                                                                     + 0x18) >> 1)
    sub_21EB02D20();
  sub_21EB02D5C();
  sub_21EB02D08();
  v19 = swift_endAccess();
  result = (*(uint64_t (**)(uint64_t))(v3 + 24))(v19);
  if ((a3 & 1) == 0)
  {
    v21 = v29;
    v22 = v29;
    sub_21EA5D1AC();
    v23 = (void *)sub_21EB02F54();
    sub_21EB02A68();
    MEMORY[0x2207B52C0](v15, v22);
    v24 = *(void (**)(char *, uint64_t))(v12 + 8);
    v25 = v30;
    v24(v15, v30);
    v26 = swift_allocObject();
    *(_QWORD *)(v26 + 16) = a1;
    *(double *)(v26 + 24) = v21;
    aBlock[4] = sub_21EAEF768;
    aBlock[5] = v26;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_21EA5EAB0;
    aBlock[3] = &block_descriptor_24;
    v27 = _Block_copy(aBlock);
    sub_21EB01F10();
    swift_release();
    sub_21EB02A44();
    aBlock[0] = MEMORY[0x24BEE4AF8];
    sub_21EAE0BC4();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2540A6D10);
    sub_21EA843CC();
    v28 = v34;
    sub_21EB031DC();
    MEMORY[0x2207B5764](v17, v11, v8, v27);
    _Block_release(v27);

    (*(void (**)(char *, uint64_t))(v33 + 8))(v8, v28);
    (*(void (**)(char *, uint64_t))(v31 + 8))(v11, v32);
    return ((uint64_t (*)(char *, uint64_t))v24)(v17, v25);
  }
  return result;
}

uint64_t sub_21EAEF150(uint64_t result)
{
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  uint64_t v6[2];

  if (*(_BYTE *)(result + 32) == 1)
  {
    v6[0] = 0;
    v6[1] = 0xE000000000000000;
    sub_21EB032E4();
    sub_21EB02C0C();
    type metadata accessor for DOCAssertion();
    sub_21EB033B0();
    sub_21EB02C0C();
    sub_21EB02E04();
    sub_21EB02C0C();
    if (qword_255469B78 != -1)
      swift_once();
    v1 = sub_21EB0263C();
    __swift_project_value_buffer(v1, (uint64_t)static Logger.UI);
    swift_bridgeObjectRetain();
    v2 = sub_21EB02624();
    v3 = sub_21EB02EF4();
    if (os_log_type_enabled(v2, v3))
    {
      v4 = (uint8_t *)swift_slowAlloc();
      v5 = swift_slowAlloc();
      v6[0] = v5;
      *(_DWORD *)v4 = 136315138;
      swift_bridgeObjectRetain();
      sub_21EA591E4(0, 0xE000000000000000, v6);
      sub_21EB03134();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_21EA4C000, v2, v3, "WARNING: %s", v4, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2207B6A18](v5, -1, -1);
      MEMORY[0x2207B6A18](v4, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    return sub_21EAEEB64(0);
  }
  return result;
}

uint64_t DOCAssertionCollection.description.getter()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t i;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;

  swift_beginAccess();
  v1 = *(_QWORD *)(v0 + 16);
  v2 = MEMORY[0x24BEE4AF8];
  v17 = MEMORY[0x24BEE4AF8];
  if (!(v1 >> 62))
  {
    v3 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v3)
      goto LABEL_3;
LABEL_15:
    swift_bridgeObjectRelease();
    v7 = MEMORY[0x24BEE4AF8];
    if ((MEMORY[0x24BEE4AF8] & 0x8000000000000000) != 0)
      goto LABEL_27;
    goto LABEL_16;
  }
  swift_bridgeObjectRetain();
  result = sub_21EB0341C();
  v3 = result;
  if (!result)
    goto LABEL_15;
LABEL_3:
  if (v3 < 1)
  {
    __break(1u);
    goto LABEL_31;
  }
  for (i = 0; i != v3; ++i)
  {
    if ((v1 & 0xC000000000000001) != 0)
    {
      v6 = MEMORY[0x2207B5B3C](i, v1);
    }
    else
    {
      v6 = *(_QWORD *)(v1 + 8 * i + 32);
      sub_21EB01F10();
    }
    if (*(_BYTE *)(v6 + 32) == 1)
    {
      sub_21EB03338();
      sub_21EB03368();
      sub_21EB03374();
      sub_21EB03344();
    }
    else
    {
      swift_release();
    }
  }
  swift_bridgeObjectRelease();
  v7 = v17;
  if (v17 < 0)
    goto LABEL_27;
LABEL_16:
  if ((v7 & 0x4000000000000000) == 0)
  {
    v8 = *(_QWORD *)(v7 + 16);
    if (!v8)
    {
LABEL_28:
      swift_release();
      v10 = MEMORY[0x24BEE4AF8];
LABEL_29:
      sub_21EB032E4();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      sub_21EB02C0C();
      swift_bridgeObjectRelease();
      sub_21EB02C0C();
      MEMORY[0x2207B5524](v10, MEMORY[0x24BEE0D00]);
      sub_21EB02C0C();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_21EB02C0C();
      return 0xD00000000000001ELL;
    }
    goto LABEL_18;
  }
LABEL_27:
  swift_bridgeObjectRetain();
  v8 = sub_21EB0341C();
  swift_release();
  if (!v8)
    goto LABEL_28;
LABEL_18:
  result = sub_21EA7D4A4(0, v8 & ~(v8 >> 63), 0);
  if ((v8 & 0x8000000000000000) == 0)
  {
    v9 = 0;
    v10 = v2;
    do
    {
      if ((v7 & 0xC000000000000001) != 0)
      {
        v11 = MEMORY[0x2207B5B3C](v9, v7);
      }
      else
      {
        v11 = *(_QWORD *)(v7 + 8 * v9 + 32);
        sub_21EB01F10();
      }
      v13 = *(_QWORD *)(v11 + 16);
      v12 = *(_QWORD *)(v11 + 24);
      swift_bridgeObjectRetain();
      swift_release();
      v15 = *(_QWORD *)(v2 + 16);
      v14 = *(_QWORD *)(v2 + 24);
      if (v15 >= v14 >> 1)
        sub_21EA7D4A4(v14 > 1, v15 + 1, 1);
      ++v9;
      *(_QWORD *)(v2 + 16) = v15 + 1;
      v16 = v2 + 16 * v15;
      *(_QWORD *)(v16 + 32) = v13;
      *(_QWORD *)(v16 + 40) = v12;
    }
    while (v8 != v9);
    swift_release();
    goto LABEL_29;
  }
LABEL_31:
  __break(1u);
  return result;
}

uint64_t DOCAssertionCollection.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_21EAEF724()
{
  return DOCAssertionCollection.description.getter();
}

uint64_t sub_21EAEF744()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21EAEF768()
{
  uint64_t v0;

  return sub_21EAEF150(*(_QWORD *)(v0 + 16));
}

void sub_21EAEF774(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_21EAEF7BC(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_21EAEF808 + 4 * byte_21EB0C984[a2]))(0x7461667865);
}

uint64_t sub_21EAEF808(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  char v3;

  if (a1 == 0x7461667865 && v1 == v2)
    v3 = 1;
  else
    v3 = sub_21EB034C4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_21EAEF898(char a1, unsigned __int8 a2)
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  int v5;
  char v6;

  v2 = 0x800000021EB0E510;
  if (a1)
  {
    if (a1 == 1)
      v3 = 0x800000021EB0E540;
    else
      v3 = 0x800000021EB0E570;
    v4 = 0xD000000000000029;
    v5 = a2;
    if (a2)
    {
LABEL_6:
      if (v5 == 1)
        v2 = 0x800000021EB0E540;
      else
        v2 = 0x800000021EB0E570;
      if (v4 != 0xD000000000000029)
        goto LABEL_15;
      goto LABEL_13;
    }
  }
  else
  {
    v4 = 0xD000000000000025;
    v3 = 0x800000021EB0E510;
    v5 = a2;
    if (a2)
      goto LABEL_6;
  }
  if (v4 != 0xD000000000000025)
  {
LABEL_15:
    v6 = sub_21EB034C4();
    goto LABEL_16;
  }
LABEL_13:
  if (v3 != v2)
    goto LABEL_15;
  v6 = 1;
LABEL_16:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v6 & 1;
}

void sub_21EAEF990(char a1)
{
  __asm { BR              X12 }
}

uint64_t sub_21EAEF9DC(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_21EAEFA40 + 4 * byte_21EB0C98C[a2]))(0xD00000000000001DLL);
}

uint64_t sub_21EAEFA40(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 0xD00000000000001DLL && v1 == 0x800000021EB0E390)
    v2 = 1;
  else
    v2 = sub_21EB034C4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

void sub_21EAEFAD8(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_21EAEFB28(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_21EAEFBB4 + 4 * byte_21EB0C996[a2]))(1851876211);
}

uint64_t sub_21EAEFBB4(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 1851876211 && v1 == 0xE400000000000000)
    v2 = 1;
  else
    v2 = sub_21EB034C4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

uint64_t sub_21EAEFC90(unsigned __int8 a1, unsigned __int8 a2)
{
  int v2;
  uint64_t v3;
  unint64_t v4;
  int v5;
  uint64_t v6;
  unint64_t v7;
  char v8;

  v2 = a1;
  if (a1)
  {
    if (a1 == 1)
      v3 = 0x6F64646572616873;
    else
      v3 = 6450547;
    if (v2 == 1)
      v4 = 0xEF73746E656D7563;
    else
      v4 = 0xE300000000000000;
    v5 = a2;
    if (a2)
    {
LABEL_9:
      if (v5 == 1)
        v6 = 0x6F64646572616873;
      else
        v6 = 6450547;
      if (v5 == 1)
        v7 = 0xEF73746E656D7563;
      else
        v7 = 0xE300000000000000;
      if (v3 != v6)
        goto LABEL_21;
      goto LABEL_19;
    }
  }
  else
  {
    v4 = 0xE400000000000000;
    v3 = 1701603686;
    v5 = a2;
    if (a2)
      goto LABEL_9;
  }
  v7 = 0xE400000000000000;
  if (v3 != 1701603686)
  {
LABEL_21:
    v8 = sub_21EB034C4();
    goto LABEL_22;
  }
LABEL_19:
  if (v4 != v7)
    goto LABEL_21;
  v8 = 1;
LABEL_22:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_21EAEFDA0(char a1, unsigned __int8 a2)
{
  uint64_t v2;
  unint64_t v3;
  int v4;
  uint64_t v5;
  unint64_t v6;
  char v7;

  if (a1)
  {
    if (a1 == 1)
      v2 = 2003789939;
    else
      v2 = 1701079400;
    v3 = 0xE400000000000000;
    v4 = a2;
    if (a2)
    {
LABEL_6:
      if (v4 == 1)
        v5 = 2003789939;
      else
        v5 = 1701079400;
      v6 = 0xE400000000000000;
      if (v2 != v5)
        goto LABEL_15;
      goto LABEL_13;
    }
  }
  else
  {
    v3 = 0xE600000000000000;
    v2 = 0x656C67676F74;
    v4 = a2;
    if (a2)
      goto LABEL_6;
  }
  v6 = 0xE600000000000000;
  if (v2 != 0x656C67676F74)
  {
LABEL_15:
    v7 = sub_21EB034C4();
    goto LABEL_16;
  }
LABEL_13:
  if (v3 != v6)
    goto LABEL_15;
  v7 = 1;
LABEL_16:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_21EAEFE90(unsigned __int8 a1, unsigned __int8 a2)
{
  int v2;
  uint64_t v3;
  unint64_t v4;
  int v5;
  uint64_t v6;
  unint64_t v7;
  char v8;

  v2 = a1;
  if (a1)
  {
    if (a1 == 1)
      v3 = 0x6574707972636E65;
    else
      v3 = 0x736E655365736163;
    if (v2 == 1)
      v4 = 0xE900000000000064;
    else
      v4 = 0xED00006576697469;
    v5 = a2;
    if (a2)
    {
LABEL_9:
      if (v5 == 1)
        v6 = 0x6574707972636E65;
      else
        v6 = 0x736E655365736163;
      if (v5 == 1)
        v7 = 0xE900000000000064;
      else
        v7 = 0xED00006576697469;
      if (v3 != v6)
        goto LABEL_21;
      goto LABEL_19;
    }
  }
  else
  {
    v4 = 0xE400000000000000;
    v3 = 1701736302;
    v5 = a2;
    if (a2)
      goto LABEL_9;
  }
  v7 = 0xE400000000000000;
  if (v3 != 1701736302)
  {
LABEL_21:
    v8 = sub_21EB034C4();
    goto LABEL_22;
  }
LABEL_19:
  if (v4 != v7)
    goto LABEL_21;
  v8 = 1;
LABEL_22:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

void sub_21EAEFFB8(char a1)
{
  __asm { BR              X11 }
}

uint64_t sub_21EAF0004(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_21EAF0098 + 4 * byte_21EB0C9A3[a2]))(0x646573557473616CLL);
}

uint64_t sub_21EAF0098(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 0x646573557473616CLL && v1 == 0xEC00000065746144)
    v2 = 1;
  else
    v2 = sub_21EB034C4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

void sub_21EAF0184(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_21EAF01C4(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_21EAF0228 + 4 * byte_21EB0C9B0[a2]))(1701667182);
}

uint64_t sub_21EAF0228(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  char v3;

  if (a1 == 1701667182 && v1 == v2)
    v3 = 1;
  else
    v3 = sub_21EB034C4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

void sub_21EAF02DC(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_21EAF031C(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_21EAF0374 + 4 * byte_21EB0C9BB[a2]))(1684957547);
}

uint64_t sub_21EAF0374(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  char v3;

  if (a1 == 1684957547 && v1 == v2)
    v3 = 1;
  else
    v3 = sub_21EB034C4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_21EAF0414(char a1, char a2)
{
  BOOL v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;

  v2 = (a1 & 1) == 0;
  if ((a1 & 1) != 0)
    v3 = 1819044198;
  else
    v3 = 0x656B6F727473;
  if (v2)
    v4 = 0xE600000000000000;
  else
    v4 = 0xE400000000000000;
  if ((a2 & 1) != 0)
    v5 = 1819044198;
  else
    v5 = 0x656B6F727473;
  if ((a2 & 1) != 0)
    v6 = 0xE400000000000000;
  else
    v6 = 0xE600000000000000;
  if (v3 == v5 && v4 == v6)
    v7 = 1;
  else
    v7 = sub_21EB034C4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_21EAF04AC(unsigned __int8 a1, unsigned __int8 a2)
{
  int v2;
  uint64_t v3;
  unint64_t v4;
  int v5;
  uint64_t v6;
  unint64_t v7;
  char v8;

  v2 = a1;
  if (a1)
  {
    if (a1 == 1)
      v3 = 0x7261646E6F636573;
    else
      v3 = 0x7972616974726574;
    if (v2 == 1)
      v4 = 0xE900000000000079;
    else
      v4 = 0xE800000000000000;
    v5 = a2;
    if (a2)
    {
LABEL_9:
      if (v5 == 1)
        v6 = 0x7261646E6F636573;
      else
        v6 = 0x7972616974726574;
      if (v5 == 1)
        v7 = 0xE900000000000079;
      else
        v7 = 0xE800000000000000;
      if (v3 != v6)
        goto LABEL_21;
      goto LABEL_19;
    }
  }
  else
  {
    v4 = 0xE700000000000000;
    v3 = 0x7972616D697270;
    v5 = a2;
    if (a2)
      goto LABEL_9;
  }
  v7 = 0xE700000000000000;
  if (v3 != 0x7972616D697270)
  {
LABEL_21:
    v8 = sub_21EB034C4();
    goto LABEL_22;
  }
LABEL_19:
  if (v4 != v7)
    goto LABEL_21;
  v8 = 1;
LABEL_22:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t DOCItemSortMode.DisplayableMode.accessibilityIdentifierComponent.getter(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_21EAF05FC + 4 * byte_21EB0C9C0[a1]))(1702125924, 0xE400000000000000);
}

uint64_t sub_21EAF05FC()
{
  return 1701667182;
}

uint64_t sub_21EAF0608()
{
  return 6775156;
}

uint64_t sub_21EAF0618()
{
  return 1702521203;
}

uint64_t sub_21EAF0624()
{
  return 1684957547;
}

uint64_t sub_21EAF0630()
{
  return 0x7942646572616873;
}

void *static DOCItemSortMode.allCases.getter()
{
  return &unk_24E328870;
}

unint64_t DOCItemSortMode.displayableMode.getter(char a1)
{
  return 0x5040302010000uLL >> (8 * a1);
}

uint64_t DOCItemSortMode.DisplayableMode.rawValue.getter(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_21EAF06B8 + 4 * byte_21EB0C9D3[a1]))(1702125924, 0xE400000000000000);
}

uint64_t sub_21EAF06B8()
{
  return 1701667182;
}

uint64_t sub_21EAF06C4()
{
  return 1936154996;
}

uint64_t sub_21EAF06D0()
{
  return 1702521203;
}

uint64_t sub_21EAF06DC()
{
  return 1684957547;
}

uint64_t sub_21EAF06E8()
{
  return 0x7942646572616873;
}

void sub_21EAF0700(char *a1)
{
  sub_21EAF0184(*a1);
}

void sub_21EAF070C()
{
  char *v0;

  sub_21EAF87C4(*v0);
}

void sub_21EAF0714()
{
  __asm { BR              X10 }
}

uint64_t sub_21EAF0748()
{
  sub_21EB02BDC();
  return swift_bridgeObjectRelease();
}

void sub_21EAF07A4(uint64_t a1)
{
  char *v1;

  sub_21EAF891C(a1, *v1);
}

uint64_t sub_21EAF07AC@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = _s26DocumentManagerExecutables15DOCItemSortModeO011DisplayableF0O8rawValueAESgSS_tcfC_0();
  *a1 = result;
  return result;
}

uint64_t sub_21EAF07D8()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(void))((char *)sub_21EAF0800 + 4 * byte_21EB0C9DF[*v0]))();
}

void sub_21EAF0800(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = 1701667182;
  a1[1] = v1;
}

void sub_21EAF0810(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = 1936154996;
  a1[1] = v1;
}

void sub_21EAF0820(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = 1702521203;
  a1[1] = v1;
}

void sub_21EAF0830(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = 1684957547;
  a1[1] = v1;
}

void sub_21EAF0840(_QWORD *a1@<X8>)
{
  *a1 = 0x7942646572616873;
  a1[1] = 0xE800000000000000;
}

uint64_t DOCItemSortMode.rawValue.getter(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_21EAF0894 + 4 * byte_21EB0C9E5[a1]))(0xD000000000000010, 0x800000021EB0E320);
}

uint64_t sub_21EAF0894()
{
  return 0x646573557473616CLL;
}

uint64_t sub_21EAF08B4()
{
  return 1701667182;
}

uint64_t sub_21EAF08C4()
{
  return 1936154996;
}

uint64_t sub_21EAF08D4()
{
  return 1702521203;
}

uint64_t sub_21EAF08E4()
{
  return 1684957547;
}

uint64_t sub_21EAF08F4()
{
  return 0x7942646572616873;
}

uint64_t sub_21EAF090C(char *a1)
{
  char v1;

  sub_21EAEFFB8(*a1);
  return v1 & 1;
}

void sub_21EAF092C()
{
  char *v0;

  sub_21EAF89D0(0, *v0);
}

void sub_21EAF0938(uint64_t a1)
{
  char *v1;

  sub_21EAF3344(a1, *v1);
}

void sub_21EAF0940(uint64_t a1)
{
  char *v1;

  sub_21EAF89D0(a1, *v1);
}

uint64_t sub_21EAF0948@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = _s26DocumentManagerExecutables15DOCItemSortModeO8rawValueACSgSS_tcfC_0();
  *a1 = result;
  return result;
}

uint64_t sub_21EAF0974@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = DOCItemSortMode.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

void sub_21EAF099C(_QWORD *a1@<X8>)
{
  *a1 = &unk_24E328870;
}

uint64_t DOCItemSortDescriptor.sortDescriptors.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t DOCItemSortDescriptor.nodePropertiesAffectingSort.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t DOCItemSortDescriptor.isReversed.getter(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  return a4 & 1;
}

void DOCItemSortDescriptor.reversedSortDesciptors.getter(char a1)
{
  _s26DocumentManagerExecutables21DOCItemSortDescriptorV4type10isReversedAcA0dE4ModeO_SbtcfC_0(a1);
}

uint64_t static DOCItemSortDescriptor.== infix(_:_:)(char a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, int a8)
{
  int v10;

  sub_21EAEFFB8(a1);
  return v10 & ~(a4 ^ a8) & 1;
}

uint64_t static DOCItemSortDescriptor.equalIgnoringSortOption(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  char v3;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2 != *(_QWORD *)(a2 + 16))
    return 0;
  if (v2)
  {
    v3 = *(_BYTE *)(a1 + 32);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    __asm { BR              X10 }
  }
  return 1;
}

uint64_t sub_21EAF0CEC(uint64_t a1, uint64_t a2)
{
  int v2;
  int v3;
  int v4;

  v2 = *(unsigned __int8 *)(a1 + 24);
  v3 = *(unsigned __int8 *)(a2 + 24);
  sub_21EAEFFB8(*(_BYTE *)a1);
  return v4 & ~(v2 ^ v3) & 1;
}

uint64_t _s26DocumentManagerExecutables15DOCItemSortModeO8rawValueACSgSS_tcfC_0()
{
  unint64_t v0;

  v0 = sub_21EB03470();
  swift_bridgeObjectRelease();
  if (v0 >= 7)
    return 7;
  else
    return v0;
}

uint64_t _s26DocumentManagerExecutables15DOCItemSortModeO011DisplayableF0O8rawValueAESgSS_tcfC_0()
{
  unint64_t v0;

  v0 = sub_21EB03470();
  swift_bridgeObjectRelease();
  if (v0 >= 6)
    return 6;
  else
    return v0;
}

unint64_t sub_21EAF0DD4()
{
  unint64_t result;

  result = qword_25546C490;
  if (!qword_25546C490)
  {
    result = MEMORY[0x2207B694C](&protocol conformance descriptor for DOCItemSortMode.DisplayableMode, &type metadata for DOCItemSortMode.DisplayableMode);
    atomic_store(result, (unint64_t *)&qword_25546C490);
  }
  return result;
}

unint64_t sub_21EAF0E1C()
{
  unint64_t result;

  result = qword_25546C498;
  if (!qword_25546C498)
  {
    result = MEMORY[0x2207B694C](&protocol conformance descriptor for DOCItemSortMode, &type metadata for DOCItemSortMode);
    atomic_store(result, (unint64_t *)&qword_25546C498);
  }
  return result;
}

unint64_t sub_21EAF0E64()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25546C4A0;
  if (!qword_25546C4A0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25546C4A8);
    result = MEMORY[0x2207B694C](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&qword_25546C4A0);
  }
  return result;
}

unint64_t sub_21EAF0EB4()
{
  unint64_t result;

  result = qword_25546C4B0;
  if (!qword_25546C4B0)
  {
    result = MEMORY[0x2207B694C](&protocol conformance descriptor for DOCItemSortMode, &type metadata for DOCItemSortMode);
    atomic_store(result, (unint64_t *)&qword_25546C4B0);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for DOCItemSortMode(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21EAF0F44 + 4 * byte_21EB0C9FF[v4]))();
  *a1 = a2 + 6;
  return ((uint64_t (*)(void))((char *)sub_21EAF0F78 + 4 * byte_21EB0C9FA[v4]))();
}

uint64_t sub_21EAF0F78(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21EAF0F80(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21EAF0F88);
  return result;
}

uint64_t sub_21EAF0F94(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21EAF0F9CLL);
  *(_BYTE *)result = a2 + 6;
  return result;
}

uint64_t sub_21EAF0FA0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21EAF0FA8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t storeEnumTagSinglePayload for DOCItemSortMode.DisplayableMode(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21EAF1000 + 4 * byte_21EB0CA09[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_21EAF1034 + 4 * byte_21EB0CA04[v4]))();
}

uint64_t sub_21EAF1034(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21EAF103C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21EAF1044);
  return result;
}

uint64_t sub_21EAF1050(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21EAF1058);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_21EAF105C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21EAF1064(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t initializeWithCopy for DOCItemSortDescriptor(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for DOCItemSortDescriptor(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  return a1;
}

uint64_t assignWithTake for DOCItemSortDescriptor(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  return a1;
}

uint64_t getEnumTagSinglePayload for DOCItemSortDescriptor(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for DOCItemSortDescriptor(uint64_t result, int a2, int a3)
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

unint64_t sub_21EAF11F8()
{
  unint64_t result;

  result = qword_25546C4B8;
  if (!qword_25546C4B8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_25546C4B8);
  }
  return result;
}

unint64_t sub_21EAF1234(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t *v6;
  uint64_t *v7;
  unint64_t result;
  int64_t i;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  _OWORD *v18;
  unint64_t v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  int64_t v23;
  uint64_t *v24;
  unint64_t v25;
  char v26;
  uint64_t *v27;
  uint64_t v28;
  BOOL v29;
  uint64_t v30;
  int64_t v31;
  uint64_t v32;
  int64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  __int128 v38;
  uint64_t v39;
  _OWORD v40[2];

  v1 = a1;
  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25546A428);
    v2 = (_QWORD *)sub_21EB0344C();
  }
  else
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
  }
  v32 = v1 + 64;
  v3 = -1 << *(_BYTE *)(v1 + 32);
  if (-v3 < 64)
    v4 = ~(-1 << -(char)v3);
  else
    v4 = -1;
  v5 = v4 & *(_QWORD *)(v1 + 64);
  v31 = (unint64_t)(63 - v3) >> 6;
  v6 = &v37;
  v7 = &v39;
  result = swift_bridgeObjectRetain();
  i = 0;
  v10 = MEMORY[0x24BEE4AD8] + 8;
  v11 = MEMORY[0x24BEE0D00];
  if (v5)
    goto LABEL_10;
LABEL_11:
  v20 = i + 1;
  if (__OFADD__(i, 1))
    goto LABEL_35;
  if (v20 >= v31)
    goto LABEL_32;
  v21 = *(_QWORD *)(v32 + 8 * v20);
  v22 = i + 1;
  if (!v21)
  {
    v22 = i + 2;
    if (i + 2 >= v31)
      goto LABEL_32;
    v21 = *(_QWORD *)(v32 + 8 * v22);
    if (!v21)
    {
      v22 = i + 3;
      if (i + 3 >= v31)
        goto LABEL_32;
      v21 = *(_QWORD *)(v32 + 8 * v22);
      if (!v21)
      {
        v22 = i + 4;
        if (i + 4 >= v31)
          goto LABEL_32;
        v21 = *(_QWORD *)(v32 + 8 * v22);
        if (!v21)
        {
          v23 = i + 5;
          if (i + 5 < v31)
          {
            v21 = *(_QWORD *)(v32 + 8 * v23);
            if (v21)
            {
              v22 = i + 5;
              goto LABEL_26;
            }
            while (1)
            {
              v22 = v23 + 1;
              if (__OFADD__(v23, 1))
                goto LABEL_36;
              if (v22 >= v31)
                break;
              v21 = *(_QWORD *)(v32 + 8 * v22);
              ++v23;
              if (v21)
                goto LABEL_26;
            }
          }
LABEL_32:
          sub_21EAA2258();
          return (unint64_t)v2;
        }
      }
    }
  }
LABEL_26:
  v34 = (v21 - 1) & v21;
  v19 = __clz(__rbit64(v21)) + (v22 << 6);
  for (i = v22; ; v19 = __clz(__rbit64(v5)) | (i << 6))
  {
    v24 = (uint64_t *)(*(_QWORD *)(v1 + 48) + 16 * v19);
    v35 = *v24;
    v36 = v24[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_21EA5951C(v6, v7);
    sub_21EA5951C(v7, v40);
    sub_21EA5951C(v40, &v38);
    result = sub_21EA5B7F8(v35, v36);
    v25 = result;
    if ((v26 & 1) != 0)
    {
      v33 = i;
      v12 = v7;
      v13 = v6;
      v14 = v1;
      v15 = v11;
      v16 = v10;
      v17 = (uint64_t *)(v2[6] + 16 * result);
      swift_bridgeObjectRelease();
      *v17 = v35;
      v17[1] = v36;
      v10 = v16;
      v11 = v15;
      v1 = v14;
      v6 = v13;
      v7 = v12;
      i = v33;
      v18 = (_OWORD *)(v2[7] + 32 * v25);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v18);
      result = (unint64_t)sub_21EA5951C(&v38, v18);
      v5 = v34;
      if (!v34)
        goto LABEL_11;
      goto LABEL_10;
    }
    if (v2[2] >= v2[3])
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v27 = (uint64_t *)(v2[6] + 16 * result);
    *v27 = v35;
    v27[1] = v36;
    result = (unint64_t)sub_21EA5951C(&v38, (_OWORD *)(v2[7] + 32 * result));
    v28 = v2[2];
    v29 = __OFADD__(v28, 1);
    v30 = v28 + 1;
    if (v29)
      goto LABEL_34;
    v2[2] = v30;
    v5 = v34;
    if (!v34)
      goto LABEL_11;
LABEL_10:
    v34 = (v5 - 1) & v5;
  }
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

Swift::String *DOCUSBRenamingErrorDomain.unsafeMutableAddressor()
{
  return &DOCUSBRenamingErrorDomain;
}

DocumentManagerExecutables::DOCUSBRenamingErrorCode_optional __swiftcall DOCUSBRenamingErrorCode.init(rawValue:)(Swift::Int rawValue)
{
  DocumentManagerExecutables::DOCUSBRenamingErrorCode_optional v1;

  if (rawValue == 2)
    v1.value = DocumentManagerExecutables_DOCUSBRenamingErrorCode_invalidName;
  else
    v1.value = DocumentManagerExecutables_DOCUSBRenamingErrorCode_unknownDefault;
  if (rawValue == 1)
    return 0;
  else
    return v1;
}

uint64_t DOCUSBRenamingErrorCode.rawValue.getter(char a1)
{
  return (a1 & 1u) + 1;
}

uint64_t sub_21EAF15CC()
{
  sub_21EB035A8();
  sub_21EB035B4();
  return sub_21EB035E4();
}

uint64_t sub_21EAF1618()
{
  return sub_21EB035B4();
}

uint64_t sub_21EAF164C()
{
  sub_21EB035A8();
  sub_21EB035B4();
  return sub_21EB035E4();
}

_QWORD *sub_21EAF1694@<X0>(_QWORD *result@<X0>, char *a2@<X8>)
{
  char v2;
  char v3;

  if (*result == 2)
    v2 = 1;
  else
    v2 = 2;
  if (*result == 1)
    v3 = 0;
  else
    v3 = v2;
  *a2 = v3;
  return result;
}

void sub_21EAF16B4(uint64_t *a1@<X8>)
{
  _BYTE *v1;
  uint64_t v2;

  v2 = 1;
  if (*v1)
    v2 = 2;
  *a1 = v2;
}

uint64_t sub_21EAF16CC()
{
  uint64_t v0;
  id v1;
  id v2;

  sub_21EB032E4();
  swift_bridgeObjectRelease();
  v1 = *(id *)(v0 + 16);
  v2 = objc_msgSend(v1, sel_description);
  sub_21EB02B88();

  sub_21EB02C0C();
  swift_bridgeObjectRelease();
  sub_21EB02C0C();
  swift_bridgeObjectRetain();
  sub_21EB02C0C();
  swift_bridgeObjectRelease();
  return 0x3D656372756F73;
}

void sub_21EAF17CC()
{
  uint64_t v0;
  uint64_t *v1;
  id v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t inited;
  uint64_t v11;
  unint64_t v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void (*v17)(_QWORD, id);
  id v18;
  uint64_t aBlock;
  unint64_t v20;
  void (*v21)(uint64_t, void *);
  void *v22;
  void (*v23)(void *);
  uint64_t *v24;
  void *v25;

  v1 = (uint64_t *)v0;
  v2 = objc_msgSend(*(id *)(v0 + 16), sel_identifier);
  sub_21EB02B88();

  v3 = (void *)sub_21EB02B58();
  swift_bridgeObjectRelease();
  v4 = (void *)objc_opt_self();
  sub_21EB01F10();
  v5 = objc_msgSend(v4, sel_sharedManager);
  if (v5)
  {
    v6 = v5;
    v7 = sub_21EAB7804();

    if (v7)
    {
      sub_21EAF2ADC(v1[3], v1[4], v7);
      v8 = (void *)sub_21EB02B58();
      swift_bridgeObjectRelease();
      v23 = sub_21EAF2AD4;
      v24 = v1;
      aBlock = MEMORY[0x24BDAC760];
      v20 = 1107296256;
      v21 = sub_21EA8423C;
      v22 = &block_descriptor_3;
      v9 = _Block_copy(&aBlock);
      sub_21EB01F10();
      swift_release();
      objc_msgSend(v7, sel_rename_withCompletionBlock_, v8, v9);
      _Block_release(v9);

      swift_release();
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_25546AFF0);
      inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_21EB08F10;
      *(_QWORD *)(inited + 32) = sub_21EB02B88();
      *(_QWORD *)(inited + 40) = v11;
      aBlock = 0;
      v20 = 0xE000000000000000;
      sub_21EB032E4();
      sub_21EB02C0C();
      v25 = v3;
      type metadata accessor for FPProviderDomainID(0);
      sub_21EB033B0();
      *(_QWORD *)(inited + 48) = 0;
      *(_QWORD *)(inited + 56) = 0xE000000000000000;
      v12 = sub_21EA98428(inited);
      sub_21EAF1234(v12);
      swift_bridgeObjectRelease();
      v13 = objc_allocWithZone(MEMORY[0x24BDD1540]);
      v14 = (void *)sub_21EB02B58();
      v15 = (void *)sub_21EB02AC8();
      swift_bridgeObjectRelease();
      v16 = objc_msgSend(v13, sel_initWithDomain_code_userInfo_, v14, 1, v15);

      v17 = (void (*)(_QWORD, id))v1[5];
      if (v17)
      {
        sub_21EA83588(v1[5]);
        v18 = v16;
        v17(0, v16);

        sub_21EA5CA7C((uint64_t)v17);
        swift_release();
      }
      else
      {

        swift_release();
      }
    }
  }
  else
  {
    __break(1u);
  }
}

void sub_21EAF1AF8(void *a1, uint64_t a2)
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  void (*v20)(_QWORD, _QWORD);
  void (*v21)(_QWORD, void *);
  id v22;
  uint64_t v23;

  if (a1)
  {
    v4 = a1;
    if (qword_255469BA8 != -1)
      swift_once();
    v5 = sub_21EB0263C();
    __swift_project_value_buffer(v5, (uint64_t)static Logger.Rename);
    v6 = a1;
    v7 = a1;
    v8 = sub_21EB02624();
    v9 = sub_21EB02EE8();
    if (os_log_type_enabled(v8, v9))
    {
      v10 = swift_slowAlloc();
      v11 = swift_slowAlloc();
      v23 = v11;
      *(_DWORD *)v10 = 136315394;
      sub_21EA591E4(0x286D726F66726570, 0xE900000000000029, &v23);
      sub_21EB03134();
      *(_WORD *)(v10 + 12) = 2080;
      v12 = a1;
      __swift_instantiateConcreteTypeFromMangledName(&qword_25546A8F8);
      v13 = sub_21EB02BA0();
      sub_21EA591E4(v13, v14, &v23);
      sub_21EB03134();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_21EA4C000, v8, v9, "%s: Rename failed with error: %s", (uint8_t *)v10, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x2207B6A18](v11, -1, -1);
      MEMORY[0x2207B6A18](v10, -1, -1);
    }
    else
    {

    }
    v21 = *(void (**)(_QWORD, void *))(a2 + 40);
    if (v21)
    {
      v22 = a1;
      sub_21EA83588((uint64_t)v21);
      v21(0, a1);

      sub_21EA5CA7C((uint64_t)v21);
    }

  }
  else
  {
    if (qword_255469BA8 != -1)
      swift_once();
    v15 = sub_21EB0263C();
    __swift_project_value_buffer(v15, (uint64_t)static Logger.Rename);
    v16 = sub_21EB02624();
    v17 = sub_21EB02EDC();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      v19 = swift_slowAlloc();
      v23 = v19;
      *(_DWORD *)v18 = 136315138;
      sub_21EA591E4(0x286D726F66726570, 0xE900000000000029, &v23);
      sub_21EB03134();
      _os_log_impl(&dword_21EA4C000, v16, v17, "%s: Rename completed on disk", v18, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2207B6A18](v19, -1, -1);
      MEMORY[0x2207B6A18](v18, -1, -1);
    }

    v20 = *(void (**)(_QWORD, _QWORD))(a2 + 40);
    if (v20)
    {
      sub_21EB01F10();
      v20(0, 0);
      sub_21EA5CA7C((uint64_t)v20);
    }
  }
}

uint64_t sub_21EAF1EBC()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  sub_21EA5CA7C(*(_QWORD *)(v0 + 40));
  return swift_deallocClassInstance();
}

uint64_t sub_21EAF1EF0()
{
  return sub_21EAF16CC();
}

uint64_t sub_21EAF1F10()
{
  uint64_t v0;
  uint64_t result;

  type metadata accessor for DOCUSBRenaming();
  v0 = swift_allocObject();
  result = sub_21EAF27D0();
  static DOCUSBRenaming.shared = v0;
  return result;
}

uint64_t *DOCUSBRenaming.shared.unsafeMutableAddressor()
{
  if (qword_255469C60 != -1)
    swift_once();
  return &static DOCUSBRenaming.shared;
}

uint64_t static DOCUSBRenaming.shared.getter()
{
  if (qword_255469C60 != -1)
    swift_once();
  return sub_21EB01F10();
}

BOOL DOCUSBRenaming.canRename.getter()
{
  id v0;
  unsigned int v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  v0 = objc_msgSend((id)objc_opt_self(), sel_usbRenameErase);
  v1 = objc_msgSend(v0, sel_isEnabled);

  if (!v1)
    return 0;
  if (qword_2540A6848 != -1)
    swift_once();
  v2 = *(_QWORD *)(static DOCUSBFormatting.shared + 16);
  swift_beginAccess();
  v3 = *(_QWORD *)(v2 + 24);
  if (v3 >> 62)
  {
    swift_bridgeObjectRetain();
    v4 = sub_21EB0341C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  return v4 < 1;
}

uint64_t DOCUSBRenaming.performRename(source:newDisplayName:alertPresenting:requiresAlertPresentation:completion:finishedBlock:)(void *a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  _QWORD *v20;
  _QWORD *v21;
  id v22;
  id v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  char *v35;
  uint64_t v36;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t aBlock[6];

  v8 = v7;
  v15 = sub_21EB02A20();
  v43 = *(_QWORD *)(v15 - 8);
  v44 = v15;
  MEMORY[0x24BDAC7A8](v15);
  v42 = (char *)&v38 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_21EB02A5C();
  v40 = *(_QWORD *)(v17 - 8);
  v41 = v17;
  MEMORY[0x24BDAC7A8](v17);
  v19 = (char *)&v38 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for DOCUSBRenameOperation_StorageKit();
  v20 = (_QWORD *)swift_allocObject();
  v20[2] = a1;
  v20[3] = a2;
  v20[4] = a3;
  v21 = (_QWORD *)swift_allocObject();
  v21[2] = v8;
  v21[3] = a2;
  v21[4] = a3;
  v21[5] = a4;
  v21[6] = a6;
  v21[7] = a7;
  v20[5] = sub_21EAF2664;
  v20[6] = v21;
  swift_bridgeObjectRetain_n();
  v22 = a1;
  sub_21EB01F10();
  v23 = a4;
  sub_21EB01F10();
  sub_21EA5CA7C(0);
  if (qword_255469BA8 != -1)
    swift_once();
  v24 = sub_21EB0263C();
  __swift_project_value_buffer(v24, (uint64_t)static Logger.Rename);
  swift_retain_n();
  v25 = sub_21EB02624();
  v26 = sub_21EB02EDC();
  if (os_log_type_enabled(v25, v26))
  {
    v27 = swift_slowAlloc();
    v39 = swift_slowAlloc();
    aBlock[0] = v39;
    *(_DWORD *)v27 = 136315394;
    v45 = sub_21EA591E4(0xD000000000000068, 0x800000021EB152B0, aBlock);
    sub_21EB03134();
    *(_WORD *)(v27 + 12) = 2080;
    sub_21EB01F10();
    v28 = sub_21EAF16CC();
    v30 = v29;
    swift_release();
    v45 = sub_21EA591E4(v28, v30, aBlock);
    sub_21EB03134();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21EA4C000, v25, v26, "%s: Adding USB Rename Operation %s", (uint8_t *)v27, 0x16u);
    v31 = v39;
    swift_arrayDestroy();
    MEMORY[0x2207B6A18](v31, -1, -1);
    MEMORY[0x2207B6A18](v27, -1, -1);

  }
  else
  {

    swift_release_n();
  }
  v32 = *(void **)(v8 + 16);
  aBlock[4] = (uint64_t)sub_21EAF278C;
  aBlock[5] = (uint64_t)v20;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_21EA5EAB0;
  aBlock[3] = (uint64_t)&block_descriptor_25;
  v33 = _Block_copy(aBlock);
  sub_21EB01F10();
  v34 = v32;
  sub_21EB02A44();
  v45 = MEMORY[0x24BEE4AF8];
  sub_21EA59DC8((unint64_t *)&qword_2540A6CE0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2540A6D10);
  sub_21EA5DB98((unint64_t *)&qword_2540A6D20, (uint64_t *)&unk_2540A6D10);
  v35 = v42;
  v36 = v44;
  sub_21EB031DC();
  MEMORY[0x2207B57A0](0, v19, v35, v33);
  _Block_release(v33);
  swift_release();

  (*(void (**)(char *, uint64_t))(v43 + 8))(v35, v36);
  (*(void (**)(char *, uint64_t))(v40 + 8))(v19, v41);
  return swift_release();
}

uint64_t type metadata accessor for DOCUSBRenameOperation_StorageKit()
{
  return objc_opt_self();
}

void sub_21EAF252C(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v19[6];

  v15 = (_QWORD *)swift_allocObject();
  v15[2] = a2;
  v15[3] = a3;
  v15[4] = a4;
  v15[5] = a5;
  v15[6] = a6;
  v15[7] = a7;
  v15[8] = a8;
  v19[4] = sub_21EAF2D08;
  v19[5] = v15;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 1107296256;
  v19[2] = sub_21EA5EAB0;
  v19[3] = &block_descriptor_9_3;
  v16 = _Block_copy(v19);
  v17 = a2;
  sub_21EB01F10();
  swift_bridgeObjectRetain();
  v18 = a6;
  sub_21EB01F10();
  swift_release();
  DOCRunInMainThread();
  _Block_release(v16);
}

uint64_t sub_21EAF2628()
{
  uint64_t v0;

  swift_release();
  swift_bridgeObjectRelease();

  swift_release();
  return swift_deallocObject();
}

void sub_21EAF2664(uint64_t a1, void *a2)
{
  uint64_t v2;

  sub_21EAF252C(a1, a2, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32), *(void **)(v2 + 40), *(_QWORD *)(v2 + 48), *(_QWORD *)(v2 + 56));
}

uint64_t sub_21EAF2674(id a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t (*a6)(id))
{
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v19[6];

  if (a1)
  {
    v11 = a1;
    v12 = (void *)sub_21EB02228();
    v13 = sub_21EAF2D1C(a3, a4, v12);

    v14 = swift_allocObject();
    *(_QWORD *)(v14 + 16) = v13;
    *(_QWORD *)(v14 + 24) = a5;
    v19[4] = sub_21EAECD80;
    v19[5] = v14;
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 1107296256;
    v19[2] = sub_21EA5EAB0;
    v19[3] = &block_descriptor_15_2;
    v15 = _Block_copy(v19);
    v16 = v13;
    v17 = a5;
    swift_release();
    DOCRunInMainThread();
    _Block_release(v15);

  }
  return a6(a1);
}

uint64_t DOCUSBRenaming.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t DOCUSBRenaming.__deallocating_deinit()
{
  uint64_t v0;

  return swift_deallocClassInstance();
}

uint64_t sub_21EAF27D0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  _QWORD v9[2];

  v1 = sub_21EB02F30();
  v2 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688];
  MEMORY[0x24BDAC7A8](v1);
  v3 = sub_21EB02F48();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_21EB02A5C();
  MEMORY[0x24BDAC7A8](v7);
  sub_21EA579D4(0, (unint64_t *)&qword_2540A6E20);
  sub_21EB02A50();
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v6, *MEMORY[0x24BEE5758], v3);
  v9[1] = MEMORY[0x24BEE4AF8];
  sub_21EA59DC8((unint64_t *)&unk_2540A6E10, v2, MEMORY[0x24BEE5698]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2540A6D30);
  sub_21EA5DB98(qword_2540A6D40, (uint64_t *)&unk_2540A6D30);
  sub_21EB031DC();
  *(_QWORD *)(v0 + 16) = sub_21EB02F84();
  return v0;
}

unint64_t sub_21EAF29A4()
{
  unint64_t result;

  result = qword_25546C4C0;
  if (!qword_25546C4C0)
  {
    result = MEMORY[0x2207B694C](&protocol conformance descriptor for DOCUSBRenamingErrorCode, &type metadata for DOCUSBRenamingErrorCode);
    atomic_store(result, (unint64_t *)&qword_25546C4C0);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for DOCUSBRenamingErrorCode(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21EAF2A34 + 4 * byte_21EB0CC65[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_21EAF2A68 + 4 * byte_21EB0CC60[v4]))();
}

uint64_t sub_21EAF2A68(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21EAF2A70(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21EAF2A78);
  return result;
}

uint64_t sub_21EAF2A84(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21EAF2A8CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_21EAF2A90(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21EAF2A98(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DOCUSBRenamingErrorCode()
{
  return &type metadata for DOCUSBRenamingErrorCode;
}

uint64_t type metadata accessor for DOCUSBRenaming()
{
  return objc_opt_self();
}

void sub_21EAF2AD4(void *a1)
{
  uint64_t v1;

  sub_21EAF1AF8(a1, v1);
}

uint64_t sub_21EAF2ADC(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v18;
  uint64_t v19;
  _QWORD v22[2];

  v6 = sub_21EB020FC();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = objc_msgSend(a3, sel_filesystemType);
  if (!v10)
  {
    sub_21EB02B88();
    goto LABEL_14;
  }
  v11 = v10;
  v12 = sub_21EB02B88();
  v14 = v13;

  v15 = sub_21EB02B88();
  if (!v14)
  {
LABEL_14:
    swift_bridgeObjectRelease();
    sub_21EB02B88();
    goto LABEL_15;
  }
  if (v15 == v12 && v14 == v16)
  {
    swift_bridgeObjectRelease();
    goto LABEL_18;
  }
  v18 = sub_21EB034C4();
  swift_bridgeObjectRelease();
  if ((v18 & 1) != 0)
  {
LABEL_18:
    swift_bridgeObjectRelease();
    v22[0] = a1;
    v22[1] = a2;
    sub_21EB020D8();
    sub_21EA8E234();
    a1 = sub_21EB03170();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    return a1;
  }
  if (sub_21EB02B88() == v12 && v14 == v19)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_16;
  }
  sub_21EB034C4();
  swift_bridgeObjectRelease();
LABEL_15:
  swift_bridgeObjectRelease();
LABEL_16:
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_21EAF2CC4()
{
  uint64_t v0;

  swift_release();
  swift_bridgeObjectRelease();

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_21EAF2D08()
{
  uint64_t v0;

  return sub_21EAF2674(*(id *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40), *(void **)(v0 + 48), *(uint64_t (**)(id))(v0 + 56));
}

id sub_21EAF2D1C(uint64_t a1, uint64_t a2, void *a3)
{
  id result;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  char v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  uint64_t v39;
  _OWORD v40[2];
  __int128 v41;
  uint64_t v42;

  result = (id)_DocumentManagerBundle();
  if (!result)
  {
    __break(1u);
    goto LABEL_7;
  }
  v7 = result;
  sub_21EB02168();

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2540A6F70);
  v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_21EB08F10;
  *(_QWORD *)(v8 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v8 + 64) = sub_21EA5EA3C();
  *(_QWORD *)(v8 + 32) = a1;
  *(_QWORD *)(v8 + 40) = a2;
  swift_bridgeObjectRetain();
  v9 = sub_21EB02B64();
  v39 = v10;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  result = (id)_DocumentManagerBundle();
  if (!result)
  {
LABEL_7:
    __break(1u);
    return result;
  }
  v11 = result;
  v12 = sub_21EB02168();
  v14 = v13;

  sub_21EB032E4();
  sub_21EB02C0C();
  sub_21EB02C0C();
  sub_21EB02C0C();
  *(_QWORD *)&v40[0] = a3;
  v38 = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25546A418);
  sub_21EB02BA0();
  sub_21EB02C0C();
  swift_bridgeObjectRelease();
  sub_21EA98908(MEMORY[0x24BEE4AF8]);
  v15 = sub_21EB02B88();
  v17 = v16;
  v18 = a3;
  v19 = MEMORY[0x24BEE0D00];
  v42 = MEMORY[0x24BEE0D00];
  *(_QWORD *)&v41 = v9;
  *((_QWORD *)&v41 + 1) = v39;
  sub_21EA5951C(&v41, v40);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_21EA9BA3C(v40, v15, v17, isUniquelyReferenced_nonNull_native);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v21 = sub_21EB02B88();
  v23 = v22;
  v42 = v19;
  *(_QWORD *)&v41 = v12;
  *((_QWORD *)&v41 + 1) = v14;
  sub_21EA5951C(&v41, v40);
  v24 = swift_isUniquelyReferenced_nonNull_native();
  sub_21EA9BA3C(v40, v21, v23, v24);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v25 = sub_21EB02B88();
  v27 = v26;
  v42 = v19;
  *(_QWORD *)&v41 = 0;
  *((_QWORD *)&v41 + 1) = 0xE000000000000000;
  sub_21EA5951C(&v41, v40);
  v28 = swift_isUniquelyReferenced_nonNull_native();
  sub_21EA9BA3C(v40, v25, v27, v28);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v18)
  {
    v29 = sub_21EB02B88();
    v31 = v30;
    v42 = sub_21EA579D4(0, (unint64_t *)&unk_25546C300);
    *(_QWORD *)&v41 = v38;
    sub_21EA5951C(&v41, v40);
    v32 = v38;
    v33 = swift_isUniquelyReferenced_nonNull_native();
    sub_21EA9BA3C(v40, v29, v31, v33);

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  v34 = objc_allocWithZone(MEMORY[0x24BDD1540]);
  v35 = (void *)sub_21EB02B58();
  v36 = (void *)sub_21EB02AC8();
  swift_bridgeObjectRelease();
  v37 = objc_msgSend(v34, sel_initWithDomain_code_userInfo_, v35, 2, v36, 0x800000021EB154A0);

  return v37;
}

uint64_t sub_21EAF31E8()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_21EAF322C()
{
  sub_21EB02BDC();
  return swift_bridgeObjectRelease();
}

void sub_21EAF32A4(uint64_t a1, char a2)
{
  __asm { BR              X11 }
}

uint64_t sub_21EAF32EC()
{
  sub_21EB02BDC();
  return swift_bridgeObjectRelease();
}

void sub_21EAF3344(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_21EAF3388()
{
  sub_21EB02BDC();
  return swift_bridgeObjectRelease();
}

uint64_t DOCItemGroupingBehavior.accessibilityIdentifierComponent.getter(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_21EAF3440 + 4 * byte_21EB0CDBB[a1]))(1701736302, 0xE400000000000000);
}

uint64_t sub_21EAF3440()
{
  return 1702125924;
}

uint64_t sub_21EAF344C()
{
  return 1701667182;
}

uint64_t sub_21EAF3458()
{
  return 6775156;
}

uint64_t sub_21EAF3468()
{
  return 1702521203;
}

uint64_t sub_21EAF3474()
{
  return 1684957547;
}

uint64_t sub_21EAF3480()
{
  return 0x7942646572616873;
}

uint64_t DOCItemGroupingBehavior.hash(into:)(uint64_t a1, char a2)
{
  if (a2 != 7)
  {
    sub_21EB035B4();
    __asm { BR              X10 }
  }
  return sub_21EB035B4();
}

uint64_t sub_21EAF3530()
{
  sub_21EB02BDC();
  return swift_bridgeObjectRelease();
}

uint64_t static DOCItemGroupingBehavior.__derived_enum_equals(_:_:)(char a1, char a2)
{
  if (a1 == 7)
    return a2 == 7;
  if (a2 == 7)
    return 0;
  return sub_21EAEFAD4();
}

uint64_t DOCItemGroupingBehavior.hashValue.getter(char a1)
{
  _BYTE v3[72];

  sub_21EB035A8();
  DOCItemGroupingBehavior.hash(into:)((uint64_t)v3, a1);
  return sub_21EB035E4();
}

uint64_t sub_21EAF3640()
{
  char *v0;
  char v1;
  _BYTE v3[72];

  v1 = *v0;
  sub_21EB035A8();
  DOCItemGroupingBehavior.hash(into:)((uint64_t)v3, v1);
  return sub_21EB035E4();
}

uint64_t sub_21EAF3684(uint64_t a1)
{
  char *v1;

  return DOCItemGroupingBehavior.hash(into:)(a1, *v1);
}

uint64_t sub_21EAF368C()
{
  char *v0;
  char v1;
  _BYTE v3[72];

  v1 = *v0;
  sub_21EB035A8();
  DOCItemGroupingBehavior.hash(into:)((uint64_t)v3, v1);
  return sub_21EB035E4();
}

uint64_t sub_21EAF36CC(_BYTE *a1, unsigned __int8 *a2)
{
  int v2;

  v2 = *a2;
  if (*a1 == 7)
    return v2 == 7;
  if (v2 == 7)
    return 0;
  return sub_21EAEFAD4();
}

unint64_t sub_21EAF3708()
{
  unint64_t result;

  result = qword_25546C680;
  if (!qword_25546C680)
  {
    result = MEMORY[0x2207B694C](&protocol conformance descriptor for DOCItemGroupingBehavior, &type metadata for DOCItemGroupingBehavior);
    atomic_store(result, (unint64_t *)&qword_25546C680);
  }
  return result;
}

unint64_t sub_21EAF3750()
{
  unint64_t result;

  result = qword_25546C688;
  if (!qword_25546C688)
  {
    result = MEMORY[0x2207B694C](&protocol conformance descriptor for DOCItemGroupingBehavior, &type metadata for DOCItemGroupingBehavior);
    atomic_store(result, (unint64_t *)&qword_25546C688);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for DOCItemGroupingBehavior(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  unsigned int v3;
  int v4;
  uint64_t v5;

  v3 = a3 + 7;
  if (a3 + 7 >= 0xFFFF00)
    v4 = 4;
  else
    v4 = 2;
  if (v3 >> 8 < 0xFF)
    v4 = 1;
  if (v3 >= 0x100)
    LODWORD(v5) = v4;
  else
    LODWORD(v5) = 0;
  if (a3 >= 0xF9)
    v5 = v5;
  else
    v5 = 0;
  if (a2 <= 0xF8)
    return ((uint64_t (*)(void))((char *)&loc_21EAF37E8 + 4 * byte_21EB0CDD4[v5]))();
  *a1 = a2 + 7;
  return ((uint64_t (*)(void))((char *)sub_21EAF381C + 4 * byte_21EB0CDCF[v5]))();
}

uint64_t sub_21EAF381C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21EAF3824(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21EAF382CLL);
  return result;
}

uint64_t sub_21EAF3838(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21EAF3840);
  *(_BYTE *)result = a2 + 7;
  return result;
}

uint64_t sub_21EAF3844(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21EAF384C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21EAF3858(unsigned __int8 *a1)
{
  unsigned int v1;

  v1 = *a1;
  if (v1 >= 7)
    return v1 - 6;
  else
    return 0;
}

_BYTE *sub_21EAF386C(_BYTE *result, int a2)
{
  if (a2)
    *result = a2 + 6;
  return result;
}

id static UIImage.doc_executablesFrameworkImage(named:)()
{
  void *v0;
  id v1;
  id v2;
  void *v3;
  id v4;

  v0 = (void *)sub_21EB02B58();
  v1 = objc_msgSend((id)objc_opt_self(), sel_bundleWithIdentifier_, v0);

  if (!v1)
    return 0;
  swift_bridgeObjectRetain();
  v2 = v1;
  v3 = (void *)sub_21EB02B58();
  swift_bridgeObjectRelease();
  v4 = objc_msgSend((id)objc_opt_self(), sel_imageNamed_inBundle_compatibleWithTraitCollection_, v3, v2, 0);

  return v4;
}

uint64_t static DOCAuthenticationMechanism.current.getter()
{
  id v0;
  void *v1;
  char oysterCapability;

  v0 = (id)MobileGestalt_get_current_device();
  if (!v0)
    return 1;
  v1 = v0;
  if (MobileGestalt_get_pearlIDCapability())
  {

    return 3;
  }
  if (MobileGestalt_get_touchIDCapability())
  {

    return 2;
  }
  oysterCapability = MobileGestalt_get_oysterCapability();

  if ((oysterCapability & 1) != 0)
    return 4;
  else
    return 1;
}

void DOCAuthenticationMechanism.localizedDescription.getter(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_21EAF3A0C()
{
  id v0;
  void *v1;
  uint64_t v2;

  v0 = (id)_DocumentManagerBundle();
  if (!v0)
  {
    __break(1u);
    JUMPOUT(0x21EAF3C98);
  }
  v1 = v0;
  v2 = sub_21EB02168();

  return v2;
}

BOOL static DOCAuthenticationMechanism.__derived_enum_equals(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

uint64_t DOCAuthenticationMechanism.hash(into:)()
{
  return sub_21EB035B4();
}

uint64_t DOCAuthenticationMechanism.hashValue.getter()
{
  sub_21EB035A8();
  sub_21EB035B4();
  return sub_21EB035E4();
}

uint64_t UIDevice.doc_preferredAuthenticationMechanism.getter()
{
  id v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  unsigned __int8 v5;
  id v7;
  id v8;
  id v9;
  unsigned __int8 v10;
  char oysterCapability;
  id v12;
  id v13;
  id v14;
  unsigned __int8 v15;

  v0 = (id)MobileGestalt_get_current_device();
  if (v0)
  {
    v1 = v0;
    if ((MobileGestalt_get_pearlIDCapability() & 1) != 0)
    {

      v2 = objc_msgSend((id)objc_opt_self(), sel_currentUser);
      v3 = objc_msgSend(v2, sel_state);

      v4 = objc_msgSend(v3, sel_biometry);
      if (v4)
      {
        v5 = objc_msgSend(v4, sel_isEnrolled);

        if ((v5 & 1) != 0)
          return 3;
      }
    }
    else if ((MobileGestalt_get_touchIDCapability() & 1) != 0)
    {

      v7 = objc_msgSend((id)objc_opt_self(), sel_currentUser);
      v8 = objc_msgSend(v7, sel_state);

      v9 = objc_msgSend(v8, sel_biometry);
      if (v9)
      {
        v10 = objc_msgSend(v9, sel_isEnrolled);

        if ((v10 & 1) != 0)
          return 2;
      }
    }
    else
    {
      oysterCapability = MobileGestalt_get_oysterCapability();

      if ((oysterCapability & 1) != 0)
      {
        v12 = objc_msgSend((id)objc_opt_self(), sel_currentUser);
        v13 = objc_msgSend(v12, sel_state);

        v14 = objc_msgSend(v13, sel_biometry);
        if (v14)
        {
          v15 = objc_msgSend(v14, sel_isEnrolled);

          if ((v15 & 1) != 0)
            return 4;
        }
      }
    }
  }
  return 1;
}

unint64_t sub_21EAF3F24()
{
  unint64_t result;

  result = qword_25546C690;
  if (!qword_25546C690)
  {
    result = MEMORY[0x2207B694C](&protocol conformance descriptor for DOCAuthenticationMechanism, &type metadata for DOCAuthenticationMechanism);
    atomic_store(result, (unint64_t *)&qword_25546C690);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for DOCAuthenticationMechanism(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21EAF3FB4 + 4 * byte_21EB0CEA5[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_21EAF3FE8 + 4 * asc_21EB0CEA0[v4]))();
}

uint64_t sub_21EAF3FE8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21EAF3FF0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21EAF3FF8);
  return result;
}

uint64_t sub_21EAF4004(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21EAF400CLL);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_21EAF4010(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21EAF4018(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DOCAuthenticationMechanism()
{
  return &type metadata for DOCAuthenticationMechanism;
}

id DOCOpenLocationIntentActionResolver.locationIntent.getter()
{
  uint64_t v0;

  return *(id *)(v0 + 16);
}

uint64_t DOCOpenLocationIntentActionResolver.isCancelled.getter()
{
  uint64_t v0;

  swift_beginAccess();
  return *(unsigned __int8 *)(v0 + 24);
}

uint64_t DOCOpenLocationIntentActionResolver.isCancelled.setter(char a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_beginAccess();
  *(_BYTE *)(v1 + 24) = a1;
  return result;
}

uint64_t (*DOCOpenLocationIntentActionResolver.isCancelled.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t DOCOpenLocationIntentActionResolver.locationIdentifier.getter()
{
  uint64_t v0;
  uint64_t v1;

  swift_beginAccess();
  v1 = *(_QWORD *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t DOCOpenLocationIntentActionResolver.locationIdentifier.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_beginAccess();
  *(_QWORD *)(v2 + 32) = a1;
  *(_QWORD *)(v2 + 40) = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*DOCOpenLocationIntentActionResolver.locationIdentifier.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t DOCOpenLocationIntentActionResolver.semanticLocationResolutionHandler.getter()
{
  uint64_t v0;
  uint64_t v1;

  swift_beginAccess();
  v1 = *(_QWORD *)(v0 + 48);
  sub_21EA83588(v1);
  return v1;
}

uint64_t DOCOpenLocationIntentActionResolver.semanticLocationResolutionHandler.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;

  swift_beginAccess();
  v5 = *(_QWORD *)(v2 + 48);
  *(_QWORD *)(v2 + 48) = a1;
  *(_QWORD *)(v2 + 56) = a2;
  return sub_21EA5CA7C(v5);
}

uint64_t (*DOCOpenLocationIntentActionResolver.semanticLocationResolutionHandler.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t DOCOpenLocationIntentActionResolver.tagLocationResolutionHandler.getter()
{
  uint64_t v0;
  uint64_t v1;

  swift_beginAccess();
  v1 = *(_QWORD *)(v0 + 64);
  sub_21EA83588(v1);
  return v1;
}

uint64_t DOCOpenLocationIntentActionResolver.tagLocationResolutionHandler.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;

  swift_beginAccess();
  v5 = *(_QWORD *)(v2 + 64);
  *(_QWORD *)(v2 + 64) = a1;
  *(_QWORD *)(v2 + 72) = a2;
  return sub_21EA5CA7C(v5);
}

uint64_t (*DOCOpenLocationIntentActionResolver.tagLocationResolutionHandler.modify())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t DOCOpenLocationIntentActionResolver.urlLocationResolutionHandler.getter()
{
  uint64_t v0;
  uint64_t v1;

  swift_beginAccess();
  v1 = *(_QWORD *)(v0 + 80);
  sub_21EA83588(v1);
  return v1;
}

uint64_t DOCOpenLocationIntentActionResolver.urlLocationResolutionHandler.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;

  swift_beginAccess();
  v5 = *(_QWORD *)(v2 + 80);
  *(_QWORD *)(v2 + 80) = a1;
  *(_QWORD *)(v2 + 88) = a2;
  return sub_21EA5CA7C(v5);
}

uint64_t (*DOCOpenLocationIntentActionResolver.urlLocationResolutionHandler.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t DOCOpenLocationIntentActionResolver.__allocating_init(with:)(void *a1)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = swift_allocObject();
  *(_BYTE *)(v2 + 24) = 0;
  *(_OWORD *)(v2 + 48) = 0u;
  *(_OWORD *)(v2 + 64) = 0u;
  *(_OWORD *)(v2 + 80) = 0u;
  *(_OWORD *)(v2 + 32) = 0u;
  *(_QWORD *)(v2 + 16) = a1;
  v3 = a1;
  v4 = sub_21EAF46F8(a1);
  v6 = v5;

  swift_beginAccess();
  *(_QWORD *)(v2 + 32) = v4;
  *(_QWORD *)(v2 + 40) = v6;
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t DOCOpenLocationIntentActionResolver.init(with:)(void *a1)
{
  uint64_t v1;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(_BYTE *)(v1 + 24) = 0;
  *(_OWORD *)(v1 + 48) = 0u;
  *(_OWORD *)(v1 + 64) = 0u;
  *(_OWORD *)(v1 + 80) = 0u;
  *(_OWORD *)(v1 + 32) = 0u;
  *(_QWORD *)(v1 + 16) = a1;
  v3 = a1;
  v4 = sub_21EAF46F8(a1);
  v6 = v5;

  swift_beginAccess();
  *(_QWORD *)(v1 + 32) = v4;
  *(_QWORD *)(v1 + 40) = v6;
  swift_bridgeObjectRelease();
  return v1;
}

Swift::Void __swiftcall DOCOpenLocationIntentActionResolver.startResolving()()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v10;
  id v11;
  id v12;

  v1 = *(void **)(v0 + 16);
  v2 = objc_msgSend(v1, sel_location);
  if (!v2)
    goto LABEL_10;
  v12 = v2;
  v3 = objc_msgSend(v2, sel_locationType);
  if (!v3)
  {

LABEL_10:
    sub_21EAF521C(0);
    return;
  }
  v4 = v3;
  v5 = sub_21EB02B88();
  v7 = v6;

  if (sub_21EB02B88() == v5 && v8 == v7)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_12;
  }
  v10 = sub_21EB034C4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v10 & 1) != 0)
  {
LABEL_12:
    v11 = objc_msgSend(v1, sel_folder);
    sub_21EAF601C(v11);
    goto LABEL_13;
  }
  v11 = objc_msgSend(v1, sel_location);
  sub_21EAF521C(v11);
LABEL_13:

}

Swift::Void __swiftcall DOCOpenLocationIntentActionResolver.cancelResolving()()
{
  uint64_t v0;

  swift_beginAccess();
  *(_BYTE *)(v0 + 24) = 1;
}

uint64_t sub_21EAF46F8(void *a1)
{
  uint64_t v1;
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  os_log_type_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v26;

  v3 = objc_msgSend(*(id *)(v1 + 16), sel_location);
  if (v3)
  {
    v4 = v3;
    v5 = objc_msgSend(v3, sel_locationType);
    if (v5)
    {
      v6 = v5;
      v7 = sub_21EB02B88();
      v9 = v8;

      if (sub_21EB02B88() == v7 && v10 == v9)
      {
        swift_bridgeObjectRelease_n();
      }
      else
      {
        v12 = sub_21EB034C4();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v12 & 1) == 0)
        {
          v13 = objc_msgSend(a1, sel_location);
          v14 = (uint64_t)sub_21EAF4C9C(v13);
LABEL_18:
          v24 = v14;

          return v24;
        }
      }
      v13 = objc_msgSend(a1, sel_folder);
      v14 = sub_21EAF49F4(v13);
      goto LABEL_18;
    }

  }
  if (qword_255469B78 != -1)
    swift_once();
  v15 = sub_21EB0263C();
  __swift_project_value_buffer(v15, (uint64_t)static Logger.UI);
  v16 = a1;
  v17 = sub_21EB02624();
  v18 = sub_21EB02EE8();
  if (os_log_type_enabled(v17, v18))
  {
    v19 = swift_slowAlloc();
    v20 = swift_slowAlloc();
    v26 = v20;
    *(_DWORD *)v19 = 136315394;
    sub_21EA591E4(0xD000000000000011, 0x800000021EB158C0, &v26);
    sub_21EB03134();
    *(_WORD *)(v19 + 12) = 2080;
    v21 = v16;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25546C830);
    v22 = sub_21EB02BA0();
    sub_21EA591E4(v22, v23, &v26);
    sub_21EB03134();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21EA4C000, v17, v18, "%s location or locationType in intent: %s", (uint8_t *)v19, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2207B6A18](v20, -1, -1);
    MEMORY[0x2207B6A18](v19, -1, -1);

  }
  else
  {

  }
  return 0;
}

uint64_t sub_21EAF49F4(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2540A6520);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21EAF6258(a1, v4);
  v5 = sub_21EB02300();
  v6 = *(_QWORD *)(v5 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    sub_21EA7C4E4((uint64_t)v4);
    v7 = 0;
    v8 = 0;
  }
  else
  {
    v7 = sub_21EB02294();
    v8 = v9;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v4, v5);
  }
  if (qword_255469B78 != -1)
    swift_once();
  v10 = sub_21EB0263C();
  __swift_project_value_buffer(v10, (uint64_t)static Logger.UI);
  swift_bridgeObjectRetain_n();
  v11 = sub_21EB02624();
  v12 = sub_21EB02EE8();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = swift_slowAlloc();
    v14 = swift_slowAlloc();
    v21 = v14;
    *(_DWORD *)v13 = 136315394;
    v19 = sub_21EA591E4(0xD000000000000017, 0x800000021EB158E0, &v21);
    sub_21EB03134();
    *(_WORD *)(v13 + 12) = 2080;
    v19 = v7;
    v20 = v8;
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2540A6CF8);
    v15 = sub_21EB02BA0();
    v19 = sub_21EA591E4(v15, v16, &v21);
    sub_21EB03134();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21EA4C000, v11, v12, "%s location: %s.", (uint8_t *)v13, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2207B6A18](v14, -1, -1);
    MEMORY[0x2207B6A18](v13, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  return v7;
}

id sub_21EAF4C9C(void *a1)
{
  id v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  char v26;
  id result;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;

  if (!a1)
    goto LABEL_9;
  v1 = a1;
  v2 = objc_msgSend(v1, sel_locationType);
  if (!v2)
  {

LABEL_9:
    if (qword_255469B78 != -1)
      swift_once();
    v17 = sub_21EB0263C();
    __swift_project_value_buffer(v17, (uint64_t)static Logger.UI);
    v18 = sub_21EB02624();
    v19 = sub_21EB02EE8();
    v20 = 0xD00000000000003FLL;
    if (os_log_type_enabled(v18, v19))
    {
      v21 = swift_slowAlloc();
      v22 = swift_slowAlloc();
      v32 = v22;
      *(_DWORD *)v21 = 136315394;
      v34 = sub_21EA591E4(0xD000000000000019, 0x800000021EB15940, &v32);
      sub_21EB03134();
      *(_WORD *)(v21 + 12) = 2080;
      v34 = sub_21EA591E4(0xD00000000000003FLL, 0x800000021EB15900, &v32);
      sub_21EB03134();
      _os_log_impl(&dword_21EA4C000, v18, v19, "%s location: %s.", (uint8_t *)v21, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x2207B6A18](v22, -1, -1);
      MEMORY[0x2207B6A18](v21, -1, -1);

    }
    else
    {

    }
    return (id)v20;
  }
  v3 = v2;
  v4 = sub_21EB02B88();
  v6 = v5;

  if (qword_255469B78 != -1)
    swift_once();
  v7 = sub_21EB0263C();
  __swift_project_value_buffer(v7, (uint64_t)static Logger.UI);
  v8 = v1;
  v9 = sub_21EB02624();
  v10 = sub_21EB02EDC();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = swift_slowAlloc();
    v12 = swift_slowAlloc();
    v34 = v12;
    *(_DWORD *)v11 = 136315394;
    v32 = sub_21EA591E4(0xD000000000000019, 0x800000021EB15940, &v34);
    sub_21EB03134();
    *(_WORD *)(v11 + 12) = 2080;
    v13 = objc_msgSend(v8, sel_identifier);
    if (v13)
    {
      v14 = v13;
      sub_21EB02B88();
      v16 = v15;

    }
    else
    {
      v16 = 0;
    }
    v33 = v16;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2540A6CF8);
    v23 = sub_21EB02BA0();
    v32 = sub_21EA591E4(v23, v24, &v34);
    sub_21EB03134();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21EA4C000, v9, v10, "%s location: %s.", (uint8_t *)v11, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2207B6A18](v12, -1, -1);
    MEMORY[0x2207B6A18](v11, -1, -1);

  }
  else
  {

  }
  if (v4 == sub_21EB02B88() && v6 == v25)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    v26 = sub_21EB034C4();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v26 & 1) == 0)
    {
      v30 = objc_msgSend(v8, sel_identifier);
      if (v30)
      {
        v31 = v30;
        v20 = sub_21EB02B88();

      }
      else
      {

        return 0;
      }
      return (id)v20;
    }
  }
  v32 = 0x5F7265646C6F66;
  v33 = 0xE700000000000000;
  result = objc_msgSend(v8, sel_identifier);
  if (result)
  {
    v28 = result;
    sub_21EB02B88();

    sub_21EB02C0C();
    swift_bridgeObjectRelease();
    sub_21EB02C0C();
    result = objc_msgSend(v8, sel_domainIdentifier);
    if (result)
    {
      v29 = result;
      sub_21EB02B88();

      sub_21EB02C0C();
      swift_bridgeObjectRelease();
      return (id)v32;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

void sub_21EAF521C(void *a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  os_log_type_t v16;
  char **v17;
  char **v18;
  uint64_t v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  id v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  id v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  id v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  id v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  id v52;
  id v53;
  void *v54;
  uint64_t v55;
  unint64_t v56;
  unint64_t v57;
  id v58;
  void *v59;
  uint64_t v60;
  void (*v61)(void *, uint64_t, unint64_t);
  void (*v62)(void *, uint64_t, unint64_t);
  uint64_t v63;
  void *v64;
  _OWORD v65[2];
  _OWORD v66[2];

  if (a1)
  {
    v2 = a1;
  }
  else
  {
    if (qword_255469B78 != -1)
      swift_once();
    v3 = sub_21EB0263C();
    __swift_project_value_buffer(v3, (uint64_t)static Logger.UI);
    v4 = sub_21EB02624();
    v5 = sub_21EB02EE8();
    if (os_log_type_enabled(v4, v5))
    {
      v6 = (uint8_t *)swift_slowAlloc();
      v7 = swift_slowAlloc();
      *(_QWORD *)&v66[0] = v7;
      *(_DWORD *)v6 = 136315138;
      *(_QWORD *)&v65[0] = sub_21EA591E4(0xD000000000000012, 0x800000021EB158A0, (uint64_t *)v66);
      sub_21EB03134();
      _os_log_impl(&dword_21EA4C000, v4, v5, "%s Location was nil. Falling back to Recents.", v6, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2207B6A18](v7, -1, -1);
      MEMORY[0x2207B6A18](v6, -1, -1);
    }

    v8 = (id)DOCCreateDefaultHomeScreenWidgetIntent();
    v9 = (void *)sub_21EB02B58();
    v10 = objc_msgSend(v8, sel_valueForKey_, v9);

    if (!v10)
    {
      __break(1u);
      return;
    }
    sub_21EB031B8();

    swift_unknownObjectRelease();
    sub_21EA5951C(v65, v66);
    sub_21EAF7724();
    swift_dynamicCast();
    v2 = v64;
  }
  v11 = qword_255469B78;
  v12 = a1;
  if (v11 != -1)
    swift_once();
  v13 = sub_21EB0263C();
  __swift_project_value_buffer(v13, (uint64_t)static Logger.UI);
  v14 = v2;
  v15 = sub_21EB02624();
  v16 = sub_21EB02EDC();
  v17 = &selRef_configurationUpdateHandler;
  v18 = &selRef_configurationUpdateHandler;
  if (os_log_type_enabled(v15, v16))
  {
    v19 = swift_slowAlloc();
    v63 = swift_slowAlloc();
    *(_QWORD *)&v65[0] = v63;
    *(_DWORD *)v19 = 136316418;
    *(_QWORD *)&v66[0] = sub_21EA591E4(0xD000000000000012, 0x800000021EB158A0, (uint64_t *)v65);
    sub_21EB03134();
    *(_WORD *)(v19 + 12) = 2080;
    v20 = objc_msgSend(v14, sel_identifier);
    if (v20)
    {
      v21 = v20;
      v22 = sub_21EB02B88();
      v24 = v23;

    }
    else
    {
      v22 = 0;
      v24 = 0;
    }
    *(_QWORD *)&v66[0] = v22;
    *((_QWORD *)&v66[0] + 1) = v24;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2540A6CF8);
    v25 = sub_21EB02BA0();
    *(_QWORD *)&v66[0] = sub_21EA591E4(v25, v26, (uint64_t *)v65);
    sub_21EB03134();

    swift_bridgeObjectRelease();
    *(_WORD *)(v19 + 22) = 2080;
    v27 = objc_msgSend(v14, sel_displayString);
    v28 = sub_21EB02B88();
    v30 = v29;

    *(_QWORD *)&v66[0] = sub_21EA591E4(v28, v30, (uint64_t *)v65);
    sub_21EB03134();

    swift_bridgeObjectRelease();
    *(_WORD *)(v19 + 32) = 2080;
    v31 = objc_msgSend(v14, sel_locationType);
    if (v31)
    {
      v32 = v31;
      v33 = sub_21EB02B88();
      v35 = v34;

    }
    else
    {
      v33 = 0;
      v35 = 0;
    }
    *(_QWORD *)&v66[0] = v33;
    *((_QWORD *)&v66[0] + 1) = v35;
    v36 = sub_21EB02BA0();
    *(_QWORD *)&v66[0] = sub_21EA591E4(v36, v37, (uint64_t *)v65);
    sub_21EB03134();

    swift_bridgeObjectRelease();
    *(_WORD *)(v19 + 42) = 2080;
    v38 = objc_msgSend(v14, sel_locationIdentifier);
    if (v38)
    {
      v39 = v38;
      v40 = sub_21EB02B88();
      v42 = v41;

    }
    else
    {
      v40 = 0;
      v42 = 0;
    }
    *(_QWORD *)&v66[0] = v40;
    *((_QWORD *)&v66[0] + 1) = v42;
    v43 = sub_21EB02BA0();
    *(_QWORD *)&v66[0] = sub_21EA591E4(v43, v44, (uint64_t *)v65);
    sub_21EB03134();

    swift_bridgeObjectRelease();
    *(_WORD *)(v19 + 52) = 2080;
    v45 = objc_msgSend(v14, sel_domainIdentifier);
    if (v45)
    {
      v46 = v45;
      v47 = sub_21EB02B88();
      v49 = v48;

    }
    else
    {
      v47 = 0;
      v49 = 0;
    }
    *(_QWORD *)&v66[0] = v47;
    *((_QWORD *)&v66[0] + 1) = v49;
    v50 = sub_21EB02BA0();
    *(_QWORD *)&v66[0] = sub_21EA591E4(v50, v51, (uint64_t *)v65);
    sub_21EB03134();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21EA4C000, v15, v16, "%s id: %s display name: %s type: %s locationId: %s bundleId: %s", (uint8_t *)v19, 0x3Eu);
    swift_arrayDestroy();
    MEMORY[0x2207B6A18](v63, -1, -1);
    MEMORY[0x2207B6A18](v19, -1, -1);

    v18 = &selRef_configurationUpdateHandler;
    v17 = &selRef_configurationUpdateHandler;
  }
  else
  {

  }
  v52 = objc_msgSend(v14, v17[135], v63);
  if (!v52)
    v52 = (id)*MEMORY[0x24BE2E038];
  v53 = objc_msgSend(v14, sel_identifier);
  if (v53)
  {
    v54 = v53;
    v55 = sub_21EB02B88();
    v57 = v56;

  }
  else
  {
    v55 = 0;
    v57 = 0;
  }
  v58 = objc_msgSend(v14, v18[143]);
  if (v58)
  {
    v59 = v58;
    v60 = sub_21EB02B88();
    v62 = v61;

  }
  else
  {
    v60 = 0;
    v62 = 0;
  }
  sub_21EAF5990(v52, v55, v57, v60, v62);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

void sub_21EAF5990(void *a1, uint64_t a2, unint64_t a3, uint64_t a4, void (*a5)(void *, uint64_t, unint64_t))
{
  uint64_t v5;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  id v39;
  NSObject *v40;
  os_log_type_t v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  unint64_t v49;
  os_log_type_t type;
  uint64_t v51;
  id v52;
  uint64_t v53;

  v11 = sub_21EB02B88();
  v13 = v12;
  if (v11 == sub_21EB02B88() && v13 == v14)
  {
    swift_bridgeObjectRelease_n();
LABEL_15:
    swift_beginAccess();
    a5 = *(void (**)(void *, uint64_t, unint64_t))(v5 + 48);
    if (a5)
    {
      if (a3)
        goto LABEL_17;
    }
    else
    {
      __break(1u);
    }
    __break(1u);
LABEL_45:
    swift_once();
    goto LABEL_40;
  }
  v16 = sub_21EB034C4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v16 & 1) != 0)
    goto LABEL_15;
  v17 = sub_21EB02B88();
  v19 = v18;
  if (v17 == sub_21EB02B88() && v19 == v20)
  {
    swift_bridgeObjectRelease_n();
LABEL_20:
    swift_beginAccess();
    a5 = *(void (**)(void *, uint64_t, unint64_t))(v5 + 48);
    if (!a5)
    {
      __break(1u);
      goto LABEL_47;
    }
    if (!a3)
    {
      __break(1u);
      goto LABEL_23;
    }
LABEL_17:
    sub_21EB01F10();
    a5(a1, a2, a3);
LABEL_18:
    sub_21EA5CA7C((uint64_t)a5);
    return;
  }
  v22 = sub_21EB034C4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v22 & 1) != 0)
    goto LABEL_20;
  v23 = sub_21EB02B88();
  v25 = v24;
  if (v23 == sub_21EB02B88() && v25 == v26)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_24;
  }
LABEL_23:
  v27 = sub_21EB034C4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v27 & 1) != 0)
  {
LABEL_24:
    swift_beginAccess();
    a5 = *(void (**)(void *, uint64_t, unint64_t))(v5 + 64);
    if (a5)
    {
      if (a3)
      {
        sub_21EB01F10();
        ((void (*)(uint64_t, unint64_t))a5)(a2, a3);
        goto LABEL_18;
      }
      goto LABEL_48;
    }
LABEL_47:
    __break(1u);
LABEL_48:
    __break(1u);
    goto LABEL_49;
  }
  v28 = sub_21EB02B88();
  v30 = v29;
  if (v28 == sub_21EB02B88() && v30 == v31)
  {
    swift_bridgeObjectRelease_n();
LABEL_31:
    sub_21EAF6D50();
    return;
  }
  v32 = sub_21EB034C4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v32 & 1) != 0)
    goto LABEL_31;
  v33 = sub_21EB02B88();
  v35 = v34;
  if (v33 == sub_21EB02B88() && v35 == v36)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_36;
  }
  v37 = sub_21EB034C4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v37 & 1) != 0)
  {
LABEL_36:
    if (a3)
    {
      if (a5)
      {
        sub_21EAF6F58(a2, a3, a4, (unint64_t)a5);
        return;
      }
      goto LABEL_50;
    }
LABEL_49:
    __break(1u);
LABEL_50:
    __break(1u);
    return;
  }
  if (qword_255469B78 != -1)
    goto LABEL_45;
LABEL_40:
  v38 = sub_21EB0263C();
  __swift_project_value_buffer(v38, (uint64_t)static Logger.UI);
  swift_bridgeObjectRetain_n();
  v39 = a1;
  swift_bridgeObjectRetain_n();
  v52 = v39;
  v40 = sub_21EB02624();
  v41 = sub_21EB02EE8();
  if (os_log_type_enabled(v40, v41))
  {
    type = v41;
    v42 = swift_slowAlloc();
    v51 = swift_slowAlloc();
    v53 = v51;
    *(_DWORD *)v42 = 136315906;
    sub_21EA591E4(0xD000000000000032, 0x800000021EB15840, &v53);
    sub_21EB03134();
    *(_WORD *)(v42 + 12) = 2080;
    type metadata accessor for DOCIntentLocationType(0);
    v43 = v52;
    v44 = sub_21EB02BA0();
    sub_21EA591E4(v44, v45, &v53);
    sub_21EB03134();

    swift_bridgeObjectRelease();
    *(_WORD *)(v42 + 22) = 2080;
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2540A6CF8);
    v46 = sub_21EB02BA0();
    sub_21EA591E4(v46, v47, &v53);
    sub_21EB03134();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v42 + 32) = 2080;
    swift_bridgeObjectRetain();
    v48 = sub_21EB02BA0();
    sub_21EA591E4(v48, v49, &v53);
    sub_21EB03134();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21EA4C000, v40, type, "%s type: %s identifier: %s bundle id: %s.", (uint8_t *)v42, 0x2Au);
    swift_arrayDestroy();
    MEMORY[0x2207B6A18](v51, -1, -1);
    MEMORY[0x2207B6A18](v42, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();

  }
}

void sub_21EAF601C(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2540A6520);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_21EB02300();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21EAF6258(a1, v4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    sub_21EA7C4E4((uint64_t)v4);
    if (qword_255469B78 != -1)
      swift_once();
    v9 = sub_21EB0263C();
    __swift_project_value_buffer(v9, (uint64_t)static Logger.UI);
    v10 = sub_21EB02624();
    v11 = sub_21EB02EE8();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      v13 = swift_slowAlloc();
      v15 = v13;
      *(_DWORD *)v12 = 136315138;
      v14 = sub_21EA591E4(0xD000000000000016, 0x800000021EB15880, &v15);
      sub_21EB03134();
      _os_log_impl(&dword_21EA4C000, v10, v11, "%s Folder was nil. Can not continue.", v12, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2207B6A18](v13, -1, -1);
      MEMORY[0x2207B6A18](v12, -1, -1);
    }

  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v4, v5);
    sub_21EAF6924((uint64_t)v8);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
}

uint64_t sub_21EAF6258@<X0>(void *a1@<X0>, char *a2@<X8>)
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
  char *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void (*v19)(char *, char *, uint64_t);
  void (*v20)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  uint64_t v25;
  uint64_t (*v26)(char *, uint64_t, uint64_t, uint64_t);
  char *v27;
  uint64_t v28;
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  uint64_t v32;
  id v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char v42;
  char *v43;
  uint64_t v44;
  NSObject *v45;
  os_log_type_t v46;
  uint8_t *v47;
  uint64_t v48;
  char *v49;
  void (*v50)(char *, _QWORD, uint64_t, uint64_t);
  char *v51;
  id v52;
  uint64_t v53;
  uint64_t v54;

  v4 = sub_21EB025DC();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v49 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2540A6520);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v49 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_21EB02300();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v49 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  if (!a1)
  {
    if (qword_255469B78 != -1)
      swift_once();
    v21 = sub_21EB0263C();
    __swift_project_value_buffer(v21, (uint64_t)static Logger.UI);
    v22 = sub_21EB02624();
    v23 = sub_21EB02EE8();
    if (os_log_type_enabled(v22, v23))
    {
      v24 = (uint8_t *)swift_slowAlloc();
      v25 = swift_slowAlloc();
      v54 = v25;
      *(_DWORD *)v24 = 136315138;
      v53 = sub_21EA591E4(0x6D6F7266286C7275, 0xEA0000000000293ALL, &v54);
      sub_21EB03134();
      _os_log_impl(&dword_21EA4C000, v22, v23, "%s Folder was nil. Can not continue.", v24, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2207B6A18](v25, -1, -1);
      MEMORY[0x2207B6A18](v24, -1, -1);
    }

    v26 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56);
    v27 = a2;
    return v26(v27, 1, 1, v11);
  }
  v51 = (char *)&v49 - v16;
  v52 = a1;
  v17 = objc_msgSend(v52, sel_fileURL);
  if (!v17)
  {
    v20 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56);
    v20(v10, 1, 1, v11);
    goto LABEL_11;
  }
  v18 = v17;
  sub_21EB022DC();

  v19 = *(void (**)(char *, char *, uint64_t))(v12 + 32);
  v19(v10, v15, v11);
  v50 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56);
  v50(v10, 0, 1, v11);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) != 1)
  {
    v19(v51, v10, v11);
    v34 = objc_msgSend(v52, sel_typeIdentifier);
    v49 = a2;
    if (v34)
    {
      v35 = v34;
      v36 = sub_21EB02B88();
      v38 = v37;

    }
    else
    {
      v36 = 0;
      v38 = 0;
    }
    sub_21EB02564();
    v39 = sub_21EB0248C();
    v41 = v40;
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    if (v38)
    {
      if (v36 == v39 && v38 == v41)
      {

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
LABEL_26:
        v43 = v49;
        v19(v49, v51, v11);
        return ((uint64_t (*)(char *, _QWORD, uint64_t, uint64_t))v50)(v43, 0, 1, v11);
      }
      v42 = sub_21EB034C4();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v42 & 1) != 0)
      {

        goto LABEL_26;
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    if (qword_255469B78 != -1)
      swift_once();
    v44 = sub_21EB0263C();
    __swift_project_value_buffer(v44, (uint64_t)static Logger.UI);
    v45 = sub_21EB02624();
    v46 = sub_21EB02EE8();
    if (os_log_type_enabled(v45, v46))
    {
      v47 = (uint8_t *)swift_slowAlloc();
      v48 = swift_slowAlloc();
      v54 = v48;
      *(_DWORD *)v47 = 136315138;
      v53 = sub_21EA591E4(0x6D6F7266286C7275, 0xEA0000000000293ALL, &v54);
      sub_21EB03134();
      _os_log_impl(&dword_21EA4C000, v45, v46, "%s URL is not a folder. Can not proceed.", v47, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2207B6A18](v48, -1, -1);
      MEMORY[0x2207B6A18](v47, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v12 + 8))(v51, v11);
    v27 = v49;
    v26 = (uint64_t (*)(char *, uint64_t, uint64_t, uint64_t))v50;
    return v26(v27, 1, 1, v11);
  }
  v20 = v50;
LABEL_11:
  sub_21EA7C4E4((uint64_t)v10);
  if (qword_255469B78 != -1)
    swift_once();
  v28 = sub_21EB0263C();
  __swift_project_value_buffer(v28, (uint64_t)static Logger.UI);
  v29 = sub_21EB02624();
  v30 = sub_21EB02EE8();
  if (os_log_type_enabled(v29, v30))
  {
    v31 = (uint8_t *)swift_slowAlloc();
    v32 = swift_slowAlloc();
    v54 = v32;
    *(_DWORD *)v31 = 136315138;
    v53 = sub_21EA591E4(0x6D6F7266286C7275, 0xEA0000000000293ALL, &v54);
    sub_21EB03134();
    _os_log_impl(&dword_21EA4C000, v29, v30, "%s folder URL is nil. Can not proceed.", v31, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2207B6A18](v32, -1, -1);
    MEMORY[0x2207B6A18](v31, -1, -1);
  }

  return ((uint64_t (*)(char *, uint64_t, uint64_t, uint64_t))v20)(a2, 1, 1, v11);
}

void sub_21EAF6924(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD aBlock[6];

  v2 = v1;
  v4 = sub_21EB02300();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x24BDAC7A8](v4);
  v7 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  v8 = (void *)sub_21EB022B8();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v4);
  v9 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v10 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v10 + v9, (char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  *(_QWORD *)(v10 + ((v6 + v9 + 7) & 0xFFFFFFFFFFFFFFF8)) = v2;
  aBlock[4] = sub_21EAF76C4;
  aBlock[5] = v10;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21EA81D44;
  aBlock[3] = &block_descriptor_6_6;
  v11 = _Block_copy(aBlock);
  sub_21EB01F10();
  swift_release();
  objc_msgSend(v7, sel_fetchItemForURL_completionHandler_, v8, v11);
  _Block_release(v11);

}

void sub_21EAF6AB0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void (*v11)(id);
  id v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20[3];
  uint64_t v21;

  v7 = sub_21EB02300();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    swift_beginAccess();
    v11 = *(void (**)(id))(a4 + 80);
    if (v11)
    {
      v12 = a1;
      sub_21EA83588((uint64_t)v11);
      v11(v12);
      sub_21EA5CA7C((uint64_t)v11);

    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    if (qword_255469B78 != -1)
      swift_once();
    v13 = sub_21EB0263C();
    __swift_project_value_buffer(v13, (uint64_t)static Logger.UI);
    (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, a3, v7);
    v14 = sub_21EB02624();
    v15 = sub_21EB02EE8();
    if (os_log_type_enabled(v14, v15))
    {
      v16 = swift_slowAlloc();
      v17 = swift_slowAlloc();
      v20[0] = v17;
      *(_DWORD *)v16 = 136315394;
      v21 = sub_21EA591E4(0x5255656C646E6168, 0xED0000293A5F284CLL, v20);
      sub_21EB03134();
      *(_WORD *)(v16 + 12) = 2080;
      sub_21EA7C524();
      v18 = sub_21EB03488();
      v21 = sub_21EA591E4(v18, v19, v20);
      sub_21EB03134();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
      _os_log_impl(&dword_21EA4C000, v14, v15, "%s unable to fetch item for URL: %s", (uint8_t *)v16, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x2207B6A18](v17, -1, -1);
      MEMORY[0x2207B6A18](v16, -1, -1);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    }

  }
}

void sub_21EAF6D50()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t aBlock[6];

  v1 = v0;
  if (qword_255469B78 != -1)
    swift_once();
  v2 = sub_21EB0263C();
  __swift_project_value_buffer(v2, (uint64_t)static Logger.UI);
  v3 = sub_21EB02624();
  v4 = sub_21EB02EDC();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    v6 = swift_slowAlloc();
    aBlock[0] = v6;
    *(_DWORD *)v5 = 136315138;
    sub_21EA591E4(0xD000000000000013, 0x800000021EB15820, aBlock);
    sub_21EB03134();
    _os_log_impl(&dword_21EA4C000, v3, v4, "%s loading Downloads collection.", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2207B6A18](v6, -1, -1);
    MEMORY[0x2207B6A18](v5, -1, -1);
  }

  v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE2DEE8]), sel_init);
  aBlock[4] = (uint64_t)sub_21EAF7618;
  aBlock[5] = v1;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_21EA81D44;
  aBlock[3] = (uint64_t)&block_descriptor_3_0;
  v8 = _Block_copy(aBlock);
  sub_21EB01F10();
  swift_release();
  objc_msgSend(v7, sel_fetchDefaultDownloadsLocationItem_, v8);
  _Block_release(v8);

}

void sub_21EAF6F58(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t aBlock[6];

  v5 = v4;
  if (qword_255469B78 != -1)
    swift_once();
  v10 = sub_21EB0263C();
  __swift_project_value_buffer(v10, (uint64_t)static Logger.UI);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  v11 = sub_21EB02624();
  v12 = sub_21EB02EDC();
  if (os_log_type_enabled(v11, v12))
  {
    v21 = v5;
    v13 = swift_slowAlloc();
    v14 = swift_slowAlloc();
    aBlock[0] = v14;
    *(_DWORD *)v13 = 136315650;
    sub_21EA591E4(0xD00000000000001CLL, 0x800000021EB15800, aBlock);
    sub_21EB03134();
    *(_WORD *)(v13 + 12) = 2080;
    swift_bridgeObjectRetain();
    sub_21EA591E4(a1, a2, aBlock);
    sub_21EB03134();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v13 + 22) = 2080;
    swift_bridgeObjectRetain();
    sub_21EA591E4(a3, a4, aBlock);
    sub_21EB03134();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_21EA4C000, v11, v12, "%s loading folder with ID: %s domain: %s.", (uint8_t *)v13, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x2207B6A18](v14, -1, -1);
    v15 = v13;
    v5 = v21;
    MEMORY[0x2207B6A18](v15, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  v16 = (void *)sub_21EB02B58();
  v17 = (void *)sub_21EB02B58();
  v18 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDC82E8]), sel_initWithProviderDomainID_itemIdentifier_, v16, v17);

  v19 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  aBlock[4] = (uint64_t)sub_21EAF75E0;
  aBlock[5] = v5;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_21EA81D44;
  aBlock[3] = (uint64_t)&block_descriptor_26;
  v20 = _Block_copy(aBlock);
  sub_21EB01F10();
  swift_release();
  objc_msgSend(v19, sel_fetchItemForItemID_completionHandler_, v18, v20);
  _Block_release(v20);

}

void sub_21EAF72A0(void *a1, void *a2, uint64_t a3, uint64_t a4, unint64_t a5, const char *a6)
{
  void (*v8)(id);
  id v9;
  uint64_t v14;
  id v15;
  id v16;
  os_log_type_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  NSObject *oslog;
  uint64_t v23;

  if (a1)
  {
    swift_beginAccess();
    v8 = *(void (**)(id))(a3 + 80);
    if (v8)
    {
      v9 = a1;
      sub_21EA83588((uint64_t)v8);
      v8(v9);
      sub_21EA5CA7C((uint64_t)v8);

    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    if (qword_255469B78 != -1)
      swift_once();
    v14 = sub_21EB0263C();
    __swift_project_value_buffer(v14, (uint64_t)static Logger.UI);
    v15 = a2;
    v16 = a2;
    oslog = sub_21EB02624();
    v17 = sub_21EB02EE8();
    if (os_log_type_enabled(oslog, v17))
    {
      v18 = swift_slowAlloc();
      v19 = swift_slowAlloc();
      v23 = v19;
      *(_DWORD *)v18 = 136315394;
      sub_21EA591E4(a4, a5, &v23);
      sub_21EB03134();
      *(_WORD *)(v18 + 12) = 2080;
      if (a2)
      {
        swift_getErrorValue();
        sub_21EB03554();
      }
      __swift_instantiateConcreteTypeFromMangledName(&qword_2540A6CF8);
      v20 = sub_21EB02BA0();
      sub_21EA591E4(v20, v21, &v23);
      sub_21EB03134();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_21EA4C000, oslog, v17, a6, (uint8_t *)v18, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x2207B6A18](v19, -1, -1);
      MEMORY[0x2207B6A18](v18, -1, -1);

    }
    else
    {

    }
  }
}

uint64_t DOCOpenLocationIntentActionResolver.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  sub_21EA5CA7C(*(_QWORD *)(v0 + 48));
  sub_21EA5CA7C(*(_QWORD *)(v0 + 64));
  sub_21EA5CA7C(*(_QWORD *)(v0 + 80));
  return v0;
}

uint64_t DOCOpenLocationIntentActionResolver.__deallocating_deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  sub_21EA5CA7C(*(_QWORD *)(v0 + 48));
  sub_21EA5CA7C(*(_QWORD *)(v0 + 64));
  sub_21EA5CA7C(*(_QWORD *)(v0 + 80));
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for DOCOpenLocationIntentActionResolver()
{
  return objc_opt_self();
}

void sub_21EAF75E0(void *a1, void *a2)
{
  uint64_t v2;

  sub_21EAF72A0(a1, a2, v2, 0xD00000000000001CLL, 0x800000021EB15800, "%s failed to get folder item: %s");
}

void sub_21EAF7618(void *a1, void *a2)
{
  uint64_t v2;

  sub_21EAF72A0(a1, a2, v2, 0xD000000000000013, 0x800000021EB15820, "%s failed to get downloads item: %s");
}

uint64_t sub_21EAF7650()
{
  uint64_t v0;
  uint64_t v1;

  v1 = sub_21EB02300();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  swift_release();
  return swift_deallocObject();
}

void sub_21EAF76C4(void *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  unint64_t v6;

  v5 = *(_QWORD *)(sub_21EB02300() - 8);
  v6 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  sub_21EAF6AB0(a1, a2, v2 + v6, *(_QWORD *)(v2 + ((*(_QWORD *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFF8)));
}

unint64_t sub_21EAF7724()
{
  unint64_t result;

  result = qword_25546C828;
  if (!qword_25546C828)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_25546C828);
  }
  return result;
}

id FPItem.collaborationHighlight.getter()
{
  void *v0;
  id v1;
  id v2;

  if (qword_2540A6648 != -1)
    swift_once();
  swift_beginAccess();
  v1 = (id)static DOCCollaborationHighlightManager.shared;
  v2 = sub_21EA574D8(v0);

  return v2;
}

uint64_t FPItem.invitationURL.getter@<X0>(uint64_t a1@<X8>)
{
  void *v1;
  id v3;
  id v4;
  uint64_t v5;
  id v7;
  id v8;
  uint64_t v9;

  if (qword_2540A6648 != -1)
    swift_once();
  swift_beginAccess();
  v3 = (id)static DOCCollaborationHighlightManager.shared;
  v4 = sub_21EA574D8(v1);

  if (!v4)
    goto LABEL_6;
  if (objc_msgSend(v4, sel_highlightType))
  {

LABEL_6:
    v5 = sub_21EB02300();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(a1, 1, 1, v5);
  }
  v7 = objc_msgSend(v4, sel_slHighlight);
  v8 = objc_msgSend(v7, sel_resourceURL);

  sub_21EB022DC();
  v9 = sub_21EB02300();
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(a1, 0, 1, v9);
}

Swift::Bool __swiftcall FPItem.openInvitationIfPossible()()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  id v9;
  unsigned __int8 v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v18;

  v1 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2540A6520);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v18 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_21EB02300();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!objc_msgSend(v0, sel_doc_isCollaborationInvitation))
    goto LABEL_9;
  if (qword_2540A6648 != -1)
    swift_once();
  swift_beginAccess();
  v8 = (id)static DOCCollaborationHighlightManager.shared;
  v9 = sub_21EA574D8(v0);

  if (!v9)
    goto LABEL_7;
  if (objc_msgSend(v9, sel_highlightType))
  {

LABEL_7:
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v3, 1, 1, v4);
LABEL_8:
    sub_21EA7C4E4((uint64_t)v3);
LABEL_9:
    v10 = 0;
    goto LABEL_10;
  }
  v12 = objc_msgSend(v9, sel_slHighlight);
  v13 = objc_msgSend(v12, sel_resourceURL);

  sub_21EB022DC();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v5 + 56))(v3, 0, 1, v4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
    goto LABEL_8;
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v3, v4);
  v11 = objc_msgSend((id)objc_opt_self(), sel_defaultWorkspace);
  if (!v11)
  {
    __break(1u);
    return (char)v11;
  }
  v14 = v11;
  v15 = (void *)sub_21EB022B8();
  sub_21EA98908(MEMORY[0x24BEE4AF8]);
  v16 = (void *)sub_21EB02AC8();
  swift_bridgeObjectRelease();
  v10 = objc_msgSend(v14, sel_openURL_withOptions_, v15, v16);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
LABEL_10:
  LOBYTE(v11) = v10;
  return (char)v11;
}

void FPItem.collaborationSenderDisplayName.getter()
{
  void *v0;
  uint64_t v1;
  char **v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  unint64_t v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  unint64_t v14;
  uint64_t v15;
  id v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  id v29;
  id v30;
  void *v31;
  id v32;
  id v33;
  void *v34;
  id v35;
  uint64_t v36;
  id v37;
  uint64_t v38;

  if (qword_2540A6648 != -1)
    swift_once();
  swift_beginAccess();
  v4 = (id)static DOCCollaborationHighlightManager.shared;
  v5 = sub_21EA574D8(v0);

  if (!v5)
    return;
  v6 = objc_msgSend(v5, sel_slHighlight);

  if (!v6)
    return;
  v7 = objc_msgSend(v6, sel_attributions);
  sub_21EA579D4(0, &qword_25546C838);
  v8 = sub_21EB02CF0();

  if (v8 >> 62)
  {
    swift_bridgeObjectRetain();
    v9 = (void *)sub_21EB0341C();
    swift_bridgeObjectRelease();
    if (!v9)
      goto LABEL_45;
  }
  else
  {
    v9 = *(void **)((v8 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v9)
    {
LABEL_45:

      swift_bridgeObjectRelease();
      return;
    }
  }
  if ((v8 & 0xC000000000000001) != 0)
  {
    v10 = (id)MEMORY[0x2207B5B3C](0, v8);
  }
  else
  {
    if (!*(_QWORD *)((v8 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_40;
    }
    v10 = *(id *)(v8 + 32);
  }
  v9 = v10;
  swift_bridgeObjectRelease();
  if (objc_msgSend(v9, sel_isGroupConversation))
  {
    v11 = objc_msgSend(v9, sel_groupDisplayName);
    if (v11)
    {
      v12 = v11;
LABEL_22:
      sub_21EB02B88();

      return;
    }
  }
  if (!objc_msgSend(v9, sel_isFromMe))
  {
    v29 = objc_msgSend(v9, sel_sender);
    v12 = objc_msgSend(v29, sel_displayName);

    goto LABEL_22;
  }
  v2 = &selRef_configurationUpdateHandler;
  v13 = objc_msgSend(v9, sel_relatedPersons);
  v1 = sub_21EA579D4(0, &qword_25546C840);
  v14 = sub_21EB02CF0();

  if (!(v14 >> 62))
  {
    v15 = *(_QWORD *)((v14 & 0xFFFFFFFFFFFFF8) + 0x10);
    goto LABEL_16;
  }
LABEL_40:
  swift_bridgeObjectRetain();
  v15 = sub_21EB0341C();
  swift_bridgeObjectRelease();
LABEL_16:
  swift_bridgeObjectRelease();
  v16 = objc_msgSend(v9, v2[153]);
  v17 = sub_21EB02CF0();

  if (v15 < 2)
  {
    if (v17 >> 62)
    {
      swift_bridgeObjectRetain();
      v18 = sub_21EB0341C();
      swift_bridgeObjectRelease();
      if (v18)
      {
LABEL_25:
        if ((v17 & 0xC000000000000001) != 0)
        {
          v30 = (id)MEMORY[0x2207B5B3C](0, v17);
        }
        else
        {
          if (!*(_QWORD *)((v17 & 0xFFFFFFFFFFFFF8) + 0x10))
          {
            __break(1u);
            goto LABEL_49;
          }
          v30 = *(id *)(v17 + 32);
        }
        v31 = v30;
        swift_bridgeObjectRelease();
        v32 = objc_msgSend(v31, sel_displayName);

        sub_21EB02B88();
        return;
      }
    }
    else
    {
      v18 = *(_QWORD *)((v17 & 0xFFFFFFFFFFFFF8) + 0x10);
      if (v18)
        goto LABEL_25;
    }

    swift_bridgeObjectRelease();
    return;
  }
  v3 = v9;
  v18 = sub_21EAF822C(v17, v3);
  swift_bridgeObjectRelease();

  if (qword_255469B78 != -1)
    swift_once();
  v19 = sub_21EB0263C();
  __swift_project_value_buffer(v19, (uint64_t)static Logger.UI);
  swift_bridgeObjectRetain_n();
  v20 = sub_21EB02624();
  v21 = sub_21EB02EDC();
  if (os_log_type_enabled(v20, v21))
  {
    v22 = (uint8_t *)swift_slowAlloc();
    v37 = v3;
    v23 = swift_slowAlloc();
    v38 = v23;
    *(_DWORD *)v22 = 136315138;
    v24 = swift_bridgeObjectRetain();
    v25 = MEMORY[0x2207B5524](v24, v1);
    v27 = v26;
    swift_bridgeObjectRelease();
    sub_21EA591E4(v25, v27, &v38);
    sub_21EB03134();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21EA4C000, v20, v21, "xxxxxx isFromMe: relatedPersonsWithoutSender: %s", v22, 0xCu);
    swift_arrayDestroy();
    v28 = v23;
    v3 = v37;
    MEMORY[0x2207B6A18](v28, -1, -1);
    MEMORY[0x2207B6A18](v22, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  if (!(v18 >> 62))
  {
    if (*(_QWORD *)((v18 & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_32;
    goto LABEL_44;
  }
  swift_bridgeObjectRetain();
  v36 = sub_21EB0341C();
  swift_bridgeObjectRelease();
  if (!v36)
  {
LABEL_44:

    goto LABEL_45;
  }
LABEL_32:
  if ((v18 & 0xC000000000000001) != 0)
  {
LABEL_49:
    v33 = (id)MEMORY[0x2207B5B3C](0, v18);
    goto LABEL_35;
  }
  if (*(_QWORD *)((v18 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v33 = *(id *)(v18 + 32);
LABEL_35:
    v34 = v33;
    swift_bridgeObjectRelease();
    v35 = objc_msgSend(v34, sel_displayName);

    sub_21EB02B88();
    return;
  }
  __break(1u);
}

uint64_t sub_21EAF822C(unint64_t a1, void *a2)
{
  uint64_t v3;
  unint64_t v4;
  id v5;
  void *v6;
  unint64_t v7;
  id v8;
  char v9;
  uint64_t v12;

  v12 = MEMORY[0x24BEE4AF8];
  if (a1 >> 62)
    goto LABEL_16;
  v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v3)
  {
    while (1)
    {
      v4 = 0;
      while ((a1 & 0xC000000000000001) != 0)
      {
        v5 = (id)MEMORY[0x2207B5B3C](v4, a1);
LABEL_9:
        v6 = v5;
        v7 = v4 + 1;
        if (__OFADD__(v4, 1))
          goto LABEL_15;
        v8 = objc_msgSend(a2, sel_sender);
        sub_21EA579D4(0, &qword_25546C840);
        v9 = sub_21EB0308C();

        if ((v9 & 1) != 0)
        {

        }
        else
        {
          sub_21EB03338();
          sub_21EB03368();
          sub_21EB03374();
          sub_21EB03344();
        }
        ++v4;
        if (v7 == v3)
          return v12;
      }
      if (v4 < *(_QWORD *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
        break;
      __break(1u);
LABEL_15:
      __break(1u);
LABEL_16:
      v3 = sub_21EB0341C();
      if (!v3)
        return MEMORY[0x24BEE4AF8];
    }
    v5 = *(id *)(a1 + 8 * v4 + 32);
    goto LABEL_9;
  }
  return MEMORY[0x24BEE4AF8];
}

uint64_t UITraitCollection.doc_preferredValidatedLayoutSizeCategory(_:)(uint64_t (*a1)(_QWORD))
{
  void *v1;
  id v3;
  char v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  unsigned __int8 *v8;
  uint64_t v9;
  unsigned int v10;

  v3 = objc_msgSend(v1, sel_preferredContentSizeCategory);
  if ((sub_21EB03044() & 1) != 0)
  {
    v4 = sub_21EB03050();

    if ((v4 & 1) != 0)
      v5 = 2;
    else
      v5 = 1;
  }
  else
  {

    v5 = 0;
  }
  v6 = sub_21EA5EFB4(v5);
  v7 = *(_QWORD *)(v6 + 16);
  if (v7)
  {
    v8 = (unsigned __int8 *)(v6 + 32);
    while (1)
    {
      v10 = *v8++;
      v9 = v10;
      if ((a1(v10) & 1) != 0)
        break;
      if (!--v7)
        goto LABEL_10;
    }
  }
  else
  {
LABEL_10:
    v9 = 0;
  }
  swift_bridgeObjectRelease();
  return v9;
}

BOOL DOCContentLayoutSizeCategory.isLargerThanRegularLayout.getter(char a1)
{
  return a1 != 0;
}

uint64_t DOCContentLayoutSizeCategory.rawValue.getter(uint64_t result)
{
  return result;
}

DocumentManagerExecutables::DOCContentLayoutSizeCategory_optional __swiftcall DOCContentLayoutSizeCategory.init(rawValue:)(Swift::Int rawValue)
{
  if ((unint64_t)rawValue >= 3)
    LOBYTE(rawValue) = 3;
  return (DocumentManagerExecutables::DOCContentLayoutSizeCategory_optional)rawValue;
}

uint64_t UITraitCollection.doc_preferredLayoutSizeCategory.getter()
{
  void *v0;
  id v1;
  char v2;

  v1 = objc_msgSend(v0, sel_preferredContentSizeCategory);
  if ((sub_21EB03044() & 1) != 0)
  {
    v2 = sub_21EB03050();

    if ((v2 & 1) != 0)
      return 2;
    else
      return 1;
  }
  else
  {

    return 0;
  }
}

unint64_t sub_21EAF8510()
{
  unint64_t result;

  result = qword_25546C848;
  if (!qword_25546C848)
  {
    result = MEMORY[0x2207B694C](&protocol conformance descriptor for DOCContentLayoutSizeCategory, &type metadata for DOCContentLayoutSizeCategory);
    atomic_store(result, (unint64_t *)&qword_25546C848);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for DOCContentLayoutSizeCategory(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21EAF85A0 + 4 * byte_21EB0CFC5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_21EAF85D4 + 4 * asc_21EB0CFC0[v4]))();
}

uint64_t sub_21EAF85D4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21EAF85DC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21EAF85E4);
  return result;
}

uint64_t sub_21EAF85F0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21EAF85F8);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_21EAF85FC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21EAF8604(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void sub_21EAF8610(char a1)
{
  sub_21EB035A8();
  __asm { BR              X10 }
}

uint64_t sub_21EAF866C()
{
  sub_21EB02BDC();
  swift_bridgeObjectRelease();
  return sub_21EB035E4();
}

void sub_21EAF86DC(char a1)
{
  sub_21EB035A8();
  __asm { BR              X10 }
}

uint64_t sub_21EAF872C()
{
  sub_21EB02BDC();
  swift_bridgeObjectRelease();
  return sub_21EB035E4();
}

void sub_21EAF87C4(char a1)
{
  sub_21EB035A8();
  __asm { BR              X10 }
}

uint64_t sub_21EAF880C()
{
  sub_21EB02BDC();
  swift_bridgeObjectRelease();
  return sub_21EB035E4();
}

uint64_t sub_21EAF887C()
{
  sub_21EB035A8();
  sub_21EB02BDC();
  swift_bridgeObjectRelease();
  return sub_21EB035E4();
}

void sub_21EAF891C(uint64_t a1, char a2)
{
  sub_21EB035A8();
  __asm { BR              X10 }
}

uint64_t sub_21EAF8960()
{
  sub_21EB02BDC();
  swift_bridgeObjectRelease();
  return sub_21EB035E4();
}

void sub_21EAF89D0(uint64_t a1, char a2)
{
  sub_21EB035A8();
  __asm { BR              X10 }
}

uint64_t sub_21EAF8A20()
{
  sub_21EB02BDC();
  swift_bridgeObjectRelease();
  return sub_21EB035E4();
}

void sub_21EAF8AC0(uint64_t a1, char a2)
{
  sub_21EB035A8();
  __asm { BR              X10 }
}

uint64_t sub_21EAF8B0C()
{
  sub_21EB02BDC();
  swift_bridgeObjectRelease();
  return sub_21EB035E4();
}

void sub_21EAF8BA4(uint64_t a1, char a2)
{
  sub_21EB035A8();
  __asm { BR              X10 }
}

uint64_t sub_21EAF8BFC()
{
  sub_21EB02BDC();
  swift_bridgeObjectRelease();
  return sub_21EB035E4();
}

uint64_t sub_21EAF8C6C()
{
  sub_21EB035A8();
  sub_21EB02BDC();
  swift_bridgeObjectRelease();
  return sub_21EB035E4();
}

BOOL UTType.isClaimed(for:handlerRank:)(unsigned __int8 a1, uint64_t a2)
{
  void *v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
  id v10;
  uint64_t v11;
  id v13;
  void *v14;
  id v15[2];

  v15[1] = *(id *)MEMORY[0x24BDAC8D0];
  sub_21EB0248C();
  v4 = (void *)sub_21EB02B58();
  swift_bridgeObjectRelease();
  v5 = objc_msgSend((id)objc_opt_self(), sel_documentProxyForName_type_MIMEType_, 0, v4, 0);

  v15[0] = 0;
  v6 = objc_msgSend(v5, sel_availableClaimBindingsForMode_handlerRank_error_, a1, a2, v15);
  v7 = v15[0];
  if (v6)
  {
    v8 = v6;
    sub_21EAF8E90();
    v9 = sub_21EB02CF0();
    v10 = v7;

    if (v9 >> 62)
    {
      swift_bridgeObjectRetain();
      v11 = sub_21EB0341C();

      swift_bridgeObjectRelease_n();
    }
    else
    {
      v11 = *(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRelease();

    }
    return v11 != 0;
  }
  else
  {
    v13 = v15[0];
    v14 = (void *)sub_21EB02234();

    swift_willThrow();
    return 0;
  }
}

unint64_t sub_21EAF8E90()
{
  unint64_t result;

  result = qword_25546C348;
  if (!qword_25546C348)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_25546C348);
  }
  return result;
}

uint64_t URL.promisedContentType.getter()
{
  return sub_21EAFAA64((uint64_t (*)(uint64_t))sub_21EAFAD38);
}

uint64_t UTType.docMobileConfig.unsafeMutableAddressor()
{
  return sub_21EA64A24(&qword_255469C70, (uint64_t)static UTType.docMobileConfig);
}

uint64_t UTType.docMobileProvision.unsafeMutableAddressor()
{
  return sub_21EA64A24(&qword_255469C78, (uint64_t)static UTType.docMobileProvision);
}

uint64_t static UTType.docWatchface.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_21EAF8F8C(&qword_255469C68, (uint64_t)static UTType.docWatchface, a1);
}

uint64_t sub_21EAF8F4C(uint64_t a1)
{
  return sub_21EA64A64(a1, static UTType.docMobileConfig);
}

uint64_t static UTType.docMobileConfig.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_21EAF8F8C(&qword_255469C70, (uint64_t)static UTType.docMobileConfig, a1);
}

uint64_t sub_21EAF8F8C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;

  if (*a1 != -1)
    swift_once();
  v5 = sub_21EB025DC();
  v6 = __swift_project_value_buffer(v5, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a3, v6, v5);
}

uint64_t sub_21EAF8FF4(uint64_t a1)
{
  return sub_21EA64A64(a1, static UTType.docMobileProvision);
}

uint64_t static UTType.docMobileProvision.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_21EAF8F8C(&qword_255469C78, (uint64_t)static UTType.docMobileProvision, a1);
}

uint64_t static UTType.docMSOfficeWordProcessing.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_21EAF8F8C(&qword_255469C80, (uint64_t)static UTType.docMSOfficeWordProcessing, a1);
}

uint64_t static UTType.docMSOfficeWordProcessingTemplate.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_21EAF8F8C(&qword_255469C88, (uint64_t)static UTType.docMSOfficeWordProcessingTemplate, a1);
}

uint64_t static UTType.docMSOfficeXMLWordProcessing.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_21EAF8F8C(&qword_255469C90, (uint64_t)static UTType.docMSOfficeXMLWordProcessing, a1);
}

uint64_t static UTType.docOfficeOpenXMLWordProcessing.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_21EAF8F8C(&qword_255469C98, (uint64_t)static UTType.docOfficeOpenXMLWordProcessing, a1);
}

uint64_t static UTType.docOfficeOpenXMLMacroEnabledWordProcessing.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_21EAF8F8C(&qword_255469CA0, (uint64_t)static UTType.docOfficeOpenXMLMacroEnabledWordProcessing, a1);
}

uint64_t static UTType.docOfficeOpenXMLWordProcessingTemplate.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_21EAF8F8C(&qword_255469CA8, (uint64_t)static UTType.docOfficeOpenXMLWordProcessingTemplate, a1);
}

uint64_t static UTType.docOfficeOpenXMLMacroEnabledWordProcessingTemplate.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_21EAF8F8C(&qword_255469CB0, (uint64_t)static UTType.docOfficeOpenXMLMacroEnabledWordProcessingTemplate, a1);
}

uint64_t UTType.capitalizedSentenceLocalizedDescription.getter()
{
  unint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;

  v1 = sub_21EB024EC();
  if (v0)
  {
    v2 = v0;
    swift_bridgeObjectRetain();
    sub_21EAFAD50(1);
    swift_bridgeObjectRelease();
    v3 = sub_21EB03104();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_21EAFADD8(1uLL, v1, v2);
    swift_bridgeObjectRelease();
    sub_21EAFAE74();
    swift_bridgeObjectRetain();
    sub_21EB02C00();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return v3;
  }
  return v1;
}

uint64_t String.capitalizedSentence.getter(uint64_t a1, unint64_t a2)
{
  uint64_t v4;

  swift_bridgeObjectRetain();
  sub_21EAFAD50(1);
  swift_bridgeObjectRelease();
  v4 = sub_21EB03104();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_21EAFADD8(1uLL, a1, a2);
  swift_bridgeObjectRelease();
  sub_21EAFAE74();
  swift_bridgeObjectRetain();
  sub_21EB02C00();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_21EAF9324()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  _OWORD *v3;
  _BYTE *v4;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25546C858);
  v0 = *(_QWORD *)(type metadata accessor for DOCDragPasteboardType() - 8);
  v1 = *(_QWORD *)(v0 + 72);
  v2 = (*(unsigned __int8 *)(v0 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 80);
  v3 = (_OWORD *)swift_allocObject();
  v3[1] = xmmword_21EB0D1C0;
  v4 = (char *)v3 + v2;
  *v4 = 0;
  swift_storeEnumTagMultiPayload();
  v4[v1] = 1;
  swift_storeEnumTagMultiPayload();
  v4[2 * v1] = 2;
  swift_storeEnumTagMultiPayload();
  sub_21EB02594();
  swift_storeEnumTagMultiPayload();
  sub_21EB025C4();
  swift_storeEnumTagMultiPayload();
  sub_21EB024B0();
  swift_storeEnumTagMultiPayload();
  sub_21EB0257C();
  swift_storeEnumTagMultiPayload();
  sub_21EB02510();
  swift_storeEnumTagMultiPayload();
  sub_21EB02480();
  swift_storeEnumTagMultiPayload();
  sub_21EB025B8();
  swift_storeEnumTagMultiPayload();
  sub_21EB025D0();
  swift_storeEnumTagMultiPayload();
  sub_21EB024A4();
  result = swift_storeEnumTagMultiPayload();
  DOCAcceptableDragPasteboardTypes._rawValue = v3;
  return result;
}

Swift::OpaquePointer *DOCAcceptableDragPasteboardTypes.unsafeMutableAddressor()
{
  if (qword_255469CB8 != -1)
    swift_once();
  return &DOCAcceptableDragPasteboardTypes;
}

unint64_t DOCFPItemDragPasteboardType.typeIdentifier.getter(char a1)
{
  unint64_t result;

  result = 0xD000000000000029;
  if (!a1)
    return 0xD000000000000025;
  return result;
}

unint64_t DOCFPItemDragPasteboardType.rawValue.getter(char a1)
{
  unint64_t result;

  result = 0xD000000000000029;
  if (!a1)
    return 0xD000000000000025;
  return result;
}

uint64_t sub_21EAF9608(char *a1, unsigned __int8 *a2)
{
  return sub_21EAEF898(*a1, *a2);
}

uint64_t sub_21EAF9614()
{
  return sub_21EAF887C();
}

uint64_t sub_21EAF961C()
{
  return sub_21EAF322C();
}

uint64_t sub_21EAF9624()
{
  return sub_21EAF8C6C();
}

uint64_t sub_21EAF962C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = _s26DocumentManagerExecutables27DOCFPItemDragPasteboardTypeO8rawValueACSgSS_tcfC_0();
  *a1 = result;
  return result;
}

unint64_t sub_21EAF9658@<X0>(unint64_t *a1@<X8>)
{
  char *v1;
  unint64_t result;
  unint64_t v4;

  result = DOCFPItemDragPasteboardType.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t DOCDragPasteboardType.init(_:)@<X0>(uint64_t a1@<X8>)
{
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
  char *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(char *, char *, uint64_t);
  uint64_t v17;
  uint64_t v18;

  v18 = a1;
  v1 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2540A6540);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v17 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_21EB025DC();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for DOCDragPasteboardType();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  v12 = sub_21EB03470();
  swift_bridgeObjectRelease();
  if (v12 < 3)
  {
    swift_bridgeObjectRelease();
    *v11 = v12;
LABEL_6:
    swift_storeEnumTagMultiPayload();
    v14 = v18;
    sub_21EAFAF3C((uint64_t)v11, v18);
    v13 = 0;
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(v14, v13, 1, v8);
  }
  sub_21EB025E8();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) != 1)
  {
    v15 = *(void (**)(char *, char *, uint64_t))(v5 + 32);
    v15(v7, v3, v4);
    v15(v11, v7, v4);
    goto LABEL_6;
  }
  sub_21EA59E08((uint64_t)v3, (uint64_t *)&unk_2540A6540);
  v13 = 1;
  v14 = v18;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(v14, v13, 1, v8);
}

unint64_t DOCDragPasteboardType.typeIdentifier.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v11;

  v1 = v0;
  v2 = sub_21EB025DC();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for DOCDragPasteboardType();
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21EAFAF80(v1, (uint64_t)v8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(char *, _BYTE *, uint64_t))(v3 + 32))(v5, v8, v2);
    v9 = sub_21EB0248C();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  else
  {
    v9 = 0xD000000000000029;
    if (!*v8)
      return 0xD000000000000025;
  }
  return v9;
}

uint64_t DOCDragPasteboardType.isFPItemFileOrLocation.getter()
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
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unsigned __int8 *v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  int v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  char *v30;
  char *v31;
  int v32;
  int v33;
  void (*v34)(char *, uint64_t);
  char *v35;
  int v36;
  uint64_t v37;
  int EnumCaseMultiPayload;
  void (*v39)(char *, unsigned __int8 *, uint64_t);
  uint64_t v40;
  uint64_t v41;
  int v42;
  uint64_t v43;
  _BYTE *v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  _QWORD v52[2];
  unint64_t v53;
  unint64_t v54;
  unint64_t v55;
  unint64_t v56;
  unint64_t v57;
  unsigned __int8 *v58;
  char *v59;
  char *v60;
  uint64_t v61;
  _BYTE *v62;
  uint64_t v63;
  int v64;

  v1 = v0;
  v2 = sub_21EB025DC();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v60 = (char *)v52 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v59 = (char *)v52 - v7;
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v52 - v8;
  v10 = type metadata accessor for DOCDragPasteboardType();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v63 = (uint64_t)v52 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v62 = (char *)v52 - v15;
  MEMORY[0x24BDAC7A8](v14);
  v17 = (unsigned __int8 *)v52 - v16;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25546C858);
  v18 = *(_QWORD *)(v11 + 72);
  v19 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  v20 = swift_allocObject();
  *(_OWORD *)(v20 + 16) = xmmword_21EB07140;
  v21 = v20 + v19;
  *(_BYTE *)(v20 + v19) = 0;
  swift_storeEnumTagMultiPayload();
  *(_BYTE *)(v20 + v19 + v18) = 1;
  swift_storeEnumTagMultiPayload();
  v52[1] = v20;
  swift_bridgeObjectRetain();
  v22 = 0;
  v23 = 0;
  v54 = (unint64_t)"ntManager.FPItem.File";
  v56 = 0x800000021EB0E540;
  v57 = (unint64_t)"econdary";
  v53 = (unint64_t)"ntManager.FPItem.Location";
  v55 = 0x800000021EB0E570;
  v61 = v3;
  v58 = v17;
  while (1)
  {
    while (1)
    {
      v36 = v22;
      v37 = v21 + v23 * v18;
      sub_21EAFAF80(v1, (uint64_t)v17);
      EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
      v64 = v36;
      if (EnumCaseMultiPayload != 1)
        break;
      v39 = *(void (**)(char *, unsigned __int8 *, uint64_t))(v3 + 32);
      v39(v9, v17, v2);
      v40 = v37;
      v41 = v63;
      sub_21EAFAF80(v40, v63);
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        v24 = v60;
        v39(v60, (unsigned __int8 *)v41, v2);
        v25 = v18;
        v26 = v1;
        v27 = v10;
        v28 = v21;
        v29 = v2;
        v30 = v9;
        v31 = v59;
        v39(v59, (unsigned __int8 *)v24, v29);
        v32 = sub_21EB025AC();
        v3 = v61;
        v33 = v32;
        v34 = *(void (**)(char *, uint64_t))(v61 + 8);
        v35 = v31;
        v9 = v30;
        v2 = v29;
        v21 = v28;
        v10 = v27;
        v1 = v26;
        v18 = v25;
        v17 = v58;
        v34(v35, v2);
        v34(v9, v2);
        v23 = 1;
        v22 = 1;
        if (((v33 | v64) & 1) != 0)
          goto LABEL_29;
      }
      else
      {
        sub_21EAFAFC4(v41);
        (*(void (**)(char *, uint64_t))(v3 + 8))(v9, v2);
LABEL_8:
        v23 = 1;
        v22 = 1;
        if ((v64 & 1) != 0)
        {
          LOBYTE(v33) = 0;
          goto LABEL_29;
        }
      }
    }
    v42 = *v17;
    v43 = v37;
    v44 = v62;
    sub_21EAFAF80(v43, (uint64_t)v62);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      sub_21EAFAFC4((uint64_t)v44);
      goto LABEL_8;
    }
    v45 = v1;
    if (v42)
    {
      v46 = v42 == 1 ? v54 | 0x8000000000000000 : v53 | 0x8000000000000000;
      v47 = 0xD000000000000029;
    }
    else
    {
      v47 = 0xD000000000000025;
      v46 = v57 | 0x8000000000000000;
    }
    v48 = v56;
    if (*v44 != 1)
      v48 = v55;
    v49 = *v44 ? 0xD000000000000029 : 0xD000000000000025;
    v50 = *v44 ? v48 : v57 | 0x8000000000000000;
    if (v47 == v49 && v46 == v50)
      break;
    v33 = sub_21EB034C4();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v22 = 1;
    v23 = 1;
    v1 = v45;
    v3 = v61;
    if (((v33 | v64) & 1) != 0)
      goto LABEL_29;
  }
  swift_bridgeObjectRelease_n();
  LOBYTE(v33) = 1;
LABEL_29:
  swift_bridgeObjectRelease();
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  return v33 & 1;
}

Swift::Bool __swiftcall DOCDragPasteboardType.conformsToAnyOf(_:)(Swift::OpaquePointer a1)
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
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE *v18;
  uint64_t v19;
  uint64_t v20;
  unsigned __int8 *v21;
  uint64_t v22;
  void *rawValue;
  char *v24;
  uint64_t v25;
  void (*v26)(char *, unsigned __int8 *, uint64_t);
  char *v27;
  char *v28;
  char *v29;
  char *v30;
  char v31;
  char v32;
  void (*v33)(char *, uint64_t);
  char *v34;
  int v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  char v41;
  Swift::Bool v42;
  void *v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  uint64_t v50;
  char *v51;
  char *v52;
  _BYTE *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;

  v2 = v1;
  v4 = sub_21EB025DC();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v52 = (char *)&v44 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v51 = (char *)&v44 - v9;
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v44 - v10;
  v12 = type metadata accessor for DOCDragPasteboardType();
  v13 = MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v44 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = MEMORY[0x24BDAC7A8](v13);
  v18 = (char *)&v44 - v17;
  MEMORY[0x24BDAC7A8](v16);
  v21 = (unsigned __int8 *)&v44 - v20;
  v22 = *((_QWORD *)a1._rawValue + 2);
  if (!v22)
    return 0;
  rawValue = a1._rawValue;
  v24 = (char *)a1._rawValue
      + ((*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80));
  v55 = *(_QWORD *)(v19 + 72);
  v44 = rawValue;
  swift_bridgeObjectRetain();
  v46 = (unint64_t)"ntManager.FPItem.File";
  v48 = 0x800000021EB0E540;
  v49 = (unint64_t)"econdary";
  v45 = (unint64_t)"ntManager.FPItem.Location";
  v47 = 0x800000021EB0E570;
  v53 = v18;
  v54 = v2;
  v56 = v5;
  v57 = v4;
  v50 = v12;
  while (1)
  {
    sub_21EAFAF80(v2, (uint64_t)v21);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v25 = v5;
      v26 = *(void (**)(char *, unsigned __int8 *, uint64_t))(v5 + 32);
      v26(v11, v21, v4);
      sub_21EAFAF80((uint64_t)v24, (uint64_t)v15);
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        v27 = v11;
        v28 = v52;
        v26(v52, (unsigned __int8 *)v15, v4);
        v29 = v15;
        v30 = v51;
        v26(v51, (unsigned __int8 *)v28, v4);
        v11 = v27;
        v31 = sub_21EB025AC();
        v18 = v53;
        v32 = v31;
        v33 = *(void (**)(char *, uint64_t))(v25 + 8);
        v34 = v30;
        v15 = v29;
        v33(v34, v57);
        v33(v11, v57);
        v4 = v57;
        v2 = v54;
        if ((v32 & 1) != 0)
          goto LABEL_32;
      }
      else
      {
        sub_21EAFAFC4((uint64_t)v15);
        (*(void (**)(char *, uint64_t))(v25 + 8))(v11, v4);
        v2 = v54;
      }
      goto LABEL_4;
    }
    v35 = *v21;
    sub_21EAFAF80((uint64_t)v24, (uint64_t)v18);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      sub_21EAFAFC4((uint64_t)v18);
      goto LABEL_4;
    }
    if (v35)
    {
      v36 = v35 == 1 ? v46 | 0x8000000000000000 : v45 | 0x8000000000000000;
      v37 = 0xD000000000000029;
    }
    else
    {
      v37 = 0xD000000000000025;
      v36 = v49 | 0x8000000000000000;
    }
    v38 = v48;
    if (*v18 != 1)
      v38 = v47;
    v39 = *v18 ? 0xD000000000000029 : 0xD000000000000025;
    v40 = *v18 ? v38 : v49 | 0x8000000000000000;
    if (v37 == v39 && v36 == v40)
      break;
    v41 = sub_21EB034C4();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v18 = v53;
    v2 = v54;
    v4 = v57;
    if ((v41 & 1) != 0)
      goto LABEL_32;
LABEL_4:
    v5 = v56;
    v24 += v55;
    if (!--v22)
    {
      v42 = 0;
      goto LABEL_33;
    }
  }
  swift_bridgeObjectRelease_n();
LABEL_32:
  v42 = 1;
LABEL_33:
  swift_bridgeObjectRelease();
  return v42;
}

uint64_t DOCDragPasteboardType.conforms(to:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
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
  char *v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE *v19;
  uint64_t v20;
  unsigned __int8 *v21;
  void (*v22)(char *, unsigned __int8 *, uint64_t);
  char v23;
  void (*v24)(char *, uint64_t);
  int v25;
  unint64_t v26;
  const char *v27;
  unint64_t v28;
  unint64_t v29;
  const char *v30;
  uint64_t v32;
  uint64_t v33;

  v2 = v1;
  v33 = a1;
  v3 = sub_21EB025DC();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x24BDAC7A8](v5);
  v10 = (char *)&v32 - v9;
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v32 - v11;
  v13 = type metadata accessor for DOCDragPasteboardType();
  v14 = MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v32 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = MEMORY[0x24BDAC7A8](v14);
  v19 = (char *)&v32 - v18;
  MEMORY[0x24BDAC7A8](v17);
  v21 = (unsigned __int8 *)&v32 - v20;
  sub_21EAFAF80(v2, (uint64_t)&v32 - v20);
  if (swift_getEnumCaseMultiPayload() != 1)
  {
    v25 = *v21;
    sub_21EAFAF80(v33, (uint64_t)v19);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      sub_21EAFAFC4((uint64_t)v19);
LABEL_7:
      v23 = 0;
      return v23 & 1;
    }
    v26 = 0x800000021EB0E510;
    if (v25)
    {
      if (v25 == 1)
        v27 = "com.apple.DocumentManager.FPItem.Location";
      else
        v27 = "com.apple.DocumentManager.FPItem.Favorite";
      v29 = (unint64_t)(v27 - 32) | 0x8000000000000000;
      v28 = 0xD000000000000029;
      if (*v19)
      {
LABEL_16:
        if (*v19 == 1)
          v30 = "com.apple.DocumentManager.FPItem.Location";
        else
          v30 = "com.apple.DocumentManager.FPItem.Favorite";
        v26 = (unint64_t)(v30 - 32) | 0x8000000000000000;
        if (v28 != 0xD000000000000029)
          goto LABEL_22;
LABEL_20:
        if (v29 == v26)
        {
          swift_bridgeObjectRelease_n();
          v23 = 1;
          return v23 & 1;
        }
LABEL_22:
        v23 = sub_21EB034C4();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return v23 & 1;
      }
    }
    else
    {
      v28 = 0xD000000000000025;
      v29 = 0x800000021EB0E510;
      if (*v19)
        goto LABEL_16;
    }
    if (v28 != 0xD000000000000025)
      goto LABEL_22;
    goto LABEL_20;
  }
  v22 = *(void (**)(char *, unsigned __int8 *, uint64_t))(v4 + 32);
  v22(v12, v21, v3);
  sub_21EAFAF80(v33, (uint64_t)v16);
  if (swift_getEnumCaseMultiPayload() != 1)
  {
    sub_21EAFAFC4((uint64_t)v16);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v12, v3);
    goto LABEL_7;
  }
  v22(v7, (unsigned __int8 *)v16, v3);
  v22(v10, (unsigned __int8 *)v7, v3);
  v23 = sub_21EB025AC();
  v24 = *(void (**)(char *, uint64_t))(v4 + 8);
  v24(v10, v3);
  v24(v12, v3);
  return v23 & 1;
}

Swift::Bool __swiftcall String.conformsToAnyOf(_:)(Swift::OpaquePointer a1)
{
  char *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  unsigned __int8 *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  Swift::Bool v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  _BYTE *v32;
  void (*v33)(char *, unsigned __int8 *, uint64_t);
  uint64_t v34;
  uint64_t v35;
  char *v36;
  char v37;
  void (*v38)(char *, uint64_t);
  char *v39;
  int v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  char v46;
  unint64_t v48;
  unint64_t v49;
  uint64_t v50;
  unint64_t v51;
  unint64_t v52;
  unint64_t v53;
  _QWORD *rawValue;
  char *v55;
  unint64_t v56;
  uint64_t v57;
  char *v58;
  char *v59;
  _BYTE *v60;
  char *v61;
  uint64_t v62;
  char *v63;

  v63 = v1;
  rawValue = a1._rawValue;
  v50 = sub_21EB025DC();
  v57 = *(_QWORD *)(v50 - 8);
  v2 = MEMORY[0x24BDAC7A8](v50);
  v4 = (char *)&v48 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = MEMORY[0x24BDAC7A8](v2);
  v7 = (char *)&v48 - v6;
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v48 - v8;
  v10 = type metadata accessor for DOCDragPasteboardType();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v48 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x24BDAC7A8](v12);
  v17 = (char *)&v48 - v16;
  MEMORY[0x24BDAC7A8](v15);
  v19 = (unsigned __int8 *)&v48 - v18;
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_25546C860);
  MEMORY[0x24BDAC7A8](v20);
  v22 = (char *)&v48 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  DOCDragPasteboardType.init(_:)((uint64_t)v22);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v22, 1, v10) == 1)
  {
    sub_21EA59E08((uint64_t)v22, &qword_25546C860);
    return 0;
  }
  v60 = v17;
  v61 = v9;
  v24 = v50;
  v58 = v14;
  v59 = v4;
  v63 = v22;
  v55 = v7;
  v25 = rawValue[2];
  if (!v25)
  {
    v23 = 0;
    v29 = (uint64_t)v63;
    goto LABEL_36;
  }
  v26 = (uint64_t)rawValue
      + ((*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80));
  v62 = *(_QWORD *)(v11 + 72);
  swift_bridgeObjectRetain();
  v56 = 0xD000000000000025;
  v49 = (unint64_t)"ntManager.FPItem.File";
  v52 = 0x800000021EB0E540;
  v53 = (unint64_t)"econdary";
  v48 = (unint64_t)"ntManager.FPItem.Location";
  v51 = 0x800000021EB0E570;
  v27 = v57;
  v28 = v61;
  v29 = (uint64_t)v63;
  v30 = v24;
  v31 = v59;
  v32 = v60;
  while (1)
  {
    sub_21EAFAF80(v29, (uint64_t)v19);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v33 = *(void (**)(char *, unsigned __int8 *, uint64_t))(v27 + 32);
      v33(v28, v19, v30);
      v34 = v30;
      v35 = (uint64_t)v58;
      sub_21EAFAF80(v26, (uint64_t)v58);
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        v33(v31, (unsigned __int8 *)v35, v34);
        v36 = v55;
        v33(v55, (unsigned __int8 *)v31, v34);
        v37 = sub_21EB025AC();
        v38 = *(void (**)(char *, uint64_t))(v27 + 8);
        v39 = v36;
        v28 = v61;
        v38(v39, v34);
        v38(v28, v34);
        v30 = v34;
        v31 = v59;
        v32 = v60;
        if ((v37 & 1) != 0)
          goto LABEL_34;
      }
      else
      {
        sub_21EAFAFC4(v35);
        (*(void (**)(char *, uint64_t))(v27 + 8))(v28, v34);
        v30 = v34;
        v32 = v60;
      }
      goto LABEL_6;
    }
    v40 = *v19;
    sub_21EAFAF80(v26, (uint64_t)v32);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      sub_21EAFAFC4((uint64_t)v32);
      goto LABEL_6;
    }
    if (v40)
    {
      v41 = v40 == 1 ? v49 | 0x8000000000000000 : v48 | 0x8000000000000000;
      v42 = 0xD000000000000029;
    }
    else
    {
      v42 = v56;
      v41 = v53 | 0x8000000000000000;
    }
    v43 = v52;
    if (*v32 != 1)
      v43 = v51;
    v44 = *v32 ? 0xD000000000000029 : v56;
    v45 = *v32 ? v43 : v53 | 0x8000000000000000;
    if (v42 == v44 && v41 == v45)
      break;
    v46 = sub_21EB034C4();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v27 = v57;
    v31 = v59;
    if ((v46 & 1) != 0)
      goto LABEL_34;
LABEL_6:
    v29 = (uint64_t)v63;
    v26 += v62;
    if (!--v25)
    {
      v23 = 0;
      goto LABEL_35;
    }
  }
  swift_bridgeObjectRelease_n();
LABEL_34:
  v23 = 1;
  v29 = (uint64_t)v63;
LABEL_35:
  swift_bridgeObjectRelease();
LABEL_36:
  sub_21EAFAFC4(v29);
  return v23;
}

uint64_t URL.contentType.getter()
{
  return sub_21EAFAA64((uint64_t (*)(uint64_t))sub_21EAFB000);
}

uint64_t sub_21EAFA910@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char v6;
  uint64_t inited;
  void *v8;
  id v9;
  uint64_t result;
  _QWORD v11[8];

  v11[7] = a1;
  v2 = sub_21EB02180();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_21EB022E8();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25546C918);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_21EB08F10;
  v8 = (void *)*MEMORY[0x24BDBCBE8];
  *(_QWORD *)(inited + 32) = *MEMORY[0x24BDBCBE8];
  v9 = v8;
  sub_21EA8EFBC(inited);
  swift_setDeallocating();
  type metadata accessor for URLResourceKey(0);
  swift_arrayDestroy();
  sub_21EB022A0();
  if (v1)
  {
    result = swift_bridgeObjectRelease();
    if ((v6 & 1) == 0)
      return result;
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_21EB02174();
    result = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    if ((v6 & 1) == 0)
      return result;
  }
  return sub_21EB022D0();
}

uint64_t sub_21EAFAA64(uint64_t (*a1)(uint64_t))
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char v8;
  uint64_t result;
  uint64_t v10;

  v2 = v1;
  v10 = sub_21EB025DC();
  MEMORY[0x24BDAC7A8](v10);
  v4 = sub_21EB02300();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v2, v4);
  v8 = sub_21EB02270();
  result = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  if ((v8 & 1) != 0)
    return a1(result);
  __break(1u);
  return result;
}

uint64_t sub_21EAFAC0C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t inited;
  void *v6;
  id v7;
  uint64_t result;
  uint64_t v9;

  v1 = sub_21EB02180();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25546C918);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_21EB08F10;
  v6 = (void *)*MEMORY[0x24BDBCBE8];
  *(_QWORD *)(inited + 32) = *MEMORY[0x24BDBCBE8];
  v7 = v6;
  sub_21EA8EFBC(inited);
  swift_setDeallocating();
  type metadata accessor for URLResourceKey(0);
  swift_arrayDestroy();
  sub_21EB022C4();
  result = swift_bridgeObjectRelease();
  if (!v0)
  {
    sub_21EB02174();
    return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
  return result;
}

uint64_t sub_21EAFAD38()
{
  return sub_21EAFAC0C();
}

uint64_t sub_21EAFAD50(uint64_t result)
{
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    sub_21EB02BF4();
    return sub_21EB02C78();
  }
  return result;
}

unint64_t sub_21EAFADD8(unint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  char v6;

  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    if ((a3 & 0x2000000000000000) != 0)
      v3 = HIBYTE(a3) & 0xF;
    else
      v3 = a2 & 0xFFFFFFFFFFFFLL;
    v4 = 7;
    if (((a3 >> 60) & ((a2 & 0x800000000000000) == 0)) != 0)
      v4 = 11;
    v5 = v4 | (v3 << 16);
    result = sub_21EB02BF4();
    if ((v6 & 1) != 0)
      result = v5;
    if (4 * v3 >= result >> 14)
      return sub_21EB02C78();
  }
  __break(1u);
  return result;
}

unint64_t sub_21EAFAE74()
{
  unint64_t result;

  result = qword_25546C850;
  if (!qword_25546C850)
  {
    result = MEMORY[0x2207B694C](MEMORY[0x24BEE1E20], MEMORY[0x24BEE1E08]);
    atomic_store(result, (unint64_t *)&qword_25546C850);
  }
  return result;
}

uint64_t _s26DocumentManagerExecutables27DOCFPItemDragPasteboardTypeO8rawValueACSgSS_tcfC_0()
{
  unint64_t v0;

  v0 = sub_21EB03470();
  swift_bridgeObjectRelease();
  if (v0 >= 3)
    return 3;
  else
    return v0;
}

uint64_t type metadata accessor for DOCDragPasteboardType()
{
  uint64_t result;

  result = qword_25546C8E0;
  if (!qword_25546C8E0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_21EAFAF3C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for DOCDragPasteboardType();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_21EAFAF80(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for DOCDragPasteboardType();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_21EAFAFC4(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for DOCDragPasteboardType();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_21EAFB000@<X0>(uint64_t a1@<X8>)
{
  return sub_21EAFA910(a1);
}

unint64_t sub_21EAFB01C()
{
  unint64_t result;

  result = qword_25546C868;
  if (!qword_25546C868)
  {
    result = MEMORY[0x2207B694C](&protocol conformance descriptor for DOCFPItemDragPasteboardType, &type metadata for DOCFPItemDragPasteboardType);
    atomic_store(result, (unint64_t *)&qword_25546C868);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for DOCFPItemDragPasteboardType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21EAFB0AC + 4 * byte_21EB0D0BC[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_21EAFB0E0 + 4 * byte_21EB0D0B7[v4]))();
}

uint64_t sub_21EAFB0E0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21EAFB0E8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21EAFB0F0);
  return result;
}

uint64_t sub_21EAFB0FC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21EAFB104);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_21EAFB108(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21EAFB110(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DOCFPItemDragPasteboardType()
{
  return &type metadata for DOCFPItemDragPasteboardType;
}

uint64_t *initializeBufferWithCopyOfBuffer for DOCDragPasteboardType(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v5 = *(_QWORD *)(a3 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v6 + 16) & ~(unint64_t)v6));
    sub_21EB01F10();
  }
  else if (swift_getEnumCaseMultiPayload() == 1)
  {
    v7 = sub_21EB025DC();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(v5 + 64));
  }
  return a1;
}

uint64_t destroy for DOCDragPasteboardType(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = swift_getEnumCaseMultiPayload();
  if ((_DWORD)result == 1)
  {
    v3 = sub_21EB025DC();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  }
  return result;
}

void *initializeWithCopy for DOCDragPasteboardType(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = sub_21EB025DC();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  return a1;
}

void *assignWithCopy for DOCDragPasteboardType(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (a1 != a2)
  {
    sub_21EAFAFC4((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v6 = sub_21EB025DC();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
  }
  return a1;
}

void *initializeWithTake for DOCDragPasteboardType(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = sub_21EB025DC();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  return a1;
}

void *assignWithTake for DOCDragPasteboardType(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (a1 != a2)
  {
    sub_21EAFAFC4((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v6 = sub_21EB025DC();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for DOCDragPasteboardType(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for DOCDragPasteboardType(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_21EAFB498()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_21EAFB4A8()
{
  uint64_t result;
  unint64_t v1;

  result = sub_21EB025DC();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t String.wrappedInDirectionalIsolation(_:)(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t result;
  uint64_t v4;

  if (a1 == 2)
  {
    if (qword_255469A98 != -1)
      swift_once();
    v1 = &static DOCUnicode.bidiIsolateBeginRLI;
  }
  else if (a1 == 1)
  {
    if (qword_255469A90 != -1)
      swift_once();
    v1 = &static DOCUnicode.bidiIsolateBeginLRI;
  }
  else
  {
    if (a1)
    {
      result = sub_21EB034F4();
      __break(1u);
      return result;
    }
    if (qword_255469AA0 != -1)
      swift_once();
    v1 = &static DOCUnicode.bidiIsolateBeginFSI;
  }
  v2 = (uint64_t *)(*v1 + OBJC_IVAR____TtC26DocumentManagerExecutables10DOCUnicode_rawValue);
  swift_beginAccess();
  v4 = *v2;
  swift_bridgeObjectRetain();
  sub_21EB02C0C();
  if (qword_255469AA8 != -1)
    swift_once();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_21EB02C0C();
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t DOCUnicode.DOCUnicodeLayoutDirection.init(_:)(uint64_t a1)
{
  if (a1 == 1)
    return 2;
  else
    return 1;
}

unint64_t DOCUnicode.DOCUnicodeLayoutDirection.init(rawValue:)(unint64_t result)
{
  if (result > 2)
    return 0;
  return result;
}

uint64_t static DOCUnicode.layoutDirection(forUIDirection:)(uint64_t a1)
{
  if (a1 == 1)
    return 2;
  else
    return 1;
}

uint64_t BidiDirectionalIsolationReturning.wrappedInDirectionalIsolation(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 == 1)
    return (*(uint64_t (**)(uint64_t))(a3 + 16))(2);
  else
    return (*(uint64_t (**)(uint64_t))(a3 + 16))(1);
}

uint64_t BidiDirectionalIsolationUpdating.wrapInDirectionalIsolation(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 == 1)
    return (*(uint64_t (**)(uint64_t))(a3 + 8))(2);
  else
    return (*(uint64_t (**)(uint64_t))(a3 + 8))(1);
}

uint64_t String.wrapInDirectionalIsolation(_:)(uint64_t a1)
{
  uint64_t *v1;
  void *v2;
  id v3;
  uint64_t result;

  if (a1 == 2)
  {
    if (qword_255469A98 != -1)
      swift_once();
    v1 = &static DOCUnicode.bidiIsolateBeginRLI;
  }
  else if (a1 == 1)
  {
    if (qword_255469A90 != -1)
      swift_once();
    v1 = &static DOCUnicode.bidiIsolateBeginLRI;
  }
  else
  {
    if (a1)
    {
      result = sub_21EB034F4();
      __break(1u);
      return result;
    }
    if (qword_255469AA0 != -1)
      swift_once();
    v1 = &static DOCUnicode.bidiIsolateBeginFSI;
  }
  v2 = (void *)*v1;
  swift_beginAccess();
  v3 = v2;
  swift_bridgeObjectRetain();
  sub_21EB02C6C();
  sub_21EABD2A8();
  sub_21EB02C18();

  swift_bridgeObjectRelease();
  if (qword_255469AA8 != -1)
    swift_once();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_21EB02C6C();
  sub_21EB02C0C();
  return swift_bridgeObjectRelease();
}

uint64_t sub_21EAFB96C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;
  uint64_t v4;

  result = String.wrappedInDirectionalIsolation(_:)(a1);
  *a2 = result;
  a2[1] = v4;
  return result;
}

uint64_t NSString.wrappedInDirectionalIsolation(_:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  sub_21EB02B88();
  if (a1 == 2)
  {
    if (qword_255469A98 == -1)
      goto LABEL_9;
    goto LABEL_12;
  }
  if (a1 == 1)
  {
    if (qword_255469A90 == -1)
      goto LABEL_9;
    goto LABEL_12;
  }
  if (a1)
  {
    result = sub_21EB034F4();
    __break(1u);
    return result;
  }
  if (qword_255469AA0 != -1)
LABEL_12:
    swift_once();
LABEL_9:
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_21EB02C0C();
  if (qword_255469AA8 != -1)
    swift_once();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_21EB02C0C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v2 = sub_21EB02B58();
  swift_bridgeObjectRelease();
  return v2;
}

id sub_21EAFBB90(void *a1, uint64_t a2, uint64_t a3)
{
  id v4;
  void *v5;

  v4 = a1;
  v5 = (void *)NSString.wrappedInDirectionalIsolation(_:)(a3);

  return v5;
}

uint64_t NSAttributedString.wrappedInDirectionalIsolation(_:)(uint64_t a1)
{
  uint64_t v1;
  id v3;
  uint64_t *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  uint64_t result;

  v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1688]), sel_init);
  if (a1 == 2)
  {
    if (qword_255469A98 != -1)
      swift_once();
    v4 = &static DOCUnicode.bidiIsolateBeginRLI;
  }
  else if (a1 == 1)
  {
    if (qword_255469A90 != -1)
      swift_once();
    v4 = &static DOCUnicode.bidiIsolateBeginLRI;
  }
  else
  {
    if (a1)
    {
      result = sub_21EB034F4();
      __break(1u);
      return result;
    }
    if (qword_255469AA0 != -1)
      swift_once();
    v4 = &static DOCUnicode.bidiIsolateBeginFSI;
  }
  v5 = (void *)*v4;
  v6 = objc_allocWithZone(MEMORY[0x24BDD1458]);
  swift_beginAccess();
  v7 = v5;
  swift_bridgeObjectRetain();
  v8 = (void *)sub_21EB02B58();
  swift_bridgeObjectRelease();
  v9 = objc_msgSend(v6, sel_initWithString_, v8);

  objc_msgSend(v3, sel_appendAttributedString_, v9);
  objc_msgSend(v3, sel_appendAttributedString_, v1);
  if (qword_255469AA8 != -1)
    swift_once();
  v10 = (void *)static DOCUnicode.bidiIsolateEnd;
  v11 = objc_allocWithZone(MEMORY[0x24BDD1458]);
  swift_beginAccess();
  v12 = v10;
  swift_bridgeObjectRetain();
  v13 = (void *)sub_21EB02B58();
  swift_bridgeObjectRelease();
  v14 = objc_msgSend(v11, sel_initWithString_, v13);

  objc_msgSend(v3, sel_appendAttributedString_, v14);
  return (uint64_t)v3;
}

id sub_21EAFBE60(void *a1, uint64_t a2, uint64_t a3)
{
  id v4;
  void *v5;

  v4 = a1;
  v5 = (void *)NSAttributedString.wrappedInDirectionalIsolation(_:)(a3);

  return v5;
}

id sub_21EAFBE98@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  id *v2;
  id result;

  result = objc_msgSend(*v2, sel_wrappedInDirectionalIsolation_, a1);
  *a2 = result;
  return result;
}

void NSMutableAttributedString.wrapInDirectionalIsolation(_:)(uint64_t a1)
{
  void *v1;
  uint64_t *v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  if (a1 == 2)
  {
    if (qword_255469A98 != -1)
      swift_once();
    v2 = &static DOCUnicode.bidiIsolateBeginRLI;
  }
  else if (a1 == 1)
  {
    if (qword_255469A90 != -1)
      swift_once();
    v2 = &static DOCUnicode.bidiIsolateBeginLRI;
  }
  else
  {
    if (a1)
    {
      sub_21EB034F4();
      __break(1u);
      return;
    }
    if (qword_255469AA0 != -1)
      swift_once();
    v2 = &static DOCUnicode.bidiIsolateBeginFSI;
  }
  v3 = (void *)*v2;
  v4 = objc_allocWithZone(MEMORY[0x24BDD1458]);
  swift_beginAccess();
  v5 = v3;
  swift_bridgeObjectRetain();
  v6 = (void *)sub_21EB02B58();
  swift_bridgeObjectRelease();
  v7 = objc_msgSend(v4, sel_initWithString_, v6);

  objc_msgSend(v1, sel_insertAttributedString_atIndex_, v7, 0);
  if (qword_255469AA8 != -1)
    swift_once();
  v8 = (void *)static DOCUnicode.bidiIsolateEnd;
  v9 = objc_allocWithZone(MEMORY[0x24BDD1458]);
  swift_beginAccess();
  v10 = v8;
  swift_bridgeObjectRetain();
  v11 = (void *)sub_21EB02B58();
  swift_bridgeObjectRelease();
  v12 = objc_msgSend(v9, sel_initWithString_, v11);

  objc_msgSend(v1, sel_appendAttributedString_, v12);
}

unint64_t sub_21EAFC13C()
{
  unint64_t result;

  result = qword_25546C920;
  if (!qword_25546C920)
  {
    result = MEMORY[0x2207B694C](&protocol conformance descriptor for DOCUnicode.DOCUnicodeLayoutDirection, &type metadata for DOCUnicode.DOCUnicodeLayoutDirection);
    atomic_store(result, (unint64_t *)&qword_25546C920);
  }
  return result;
}

void sub_21EAFC180(void *a1, uint64_t a2, uint64_t a3)
{
  id v4;

  v4 = a1;
  NSMutableAttributedString.wrapInDirectionalIsolation(_:)(a3);

}

id sub_21EAFC1C0(uint64_t a1)
{
  id *v1;

  return objc_msgSend(*v1, sel_wrapInDirectionalIsolation_, a1);
}

ValueMetadata *type metadata accessor for DOCUnicode.DOCUnicodeLayoutDirection()
{
  return &type metadata for DOCUnicode.DOCUnicodeLayoutDirection;
}

uint64_t UIStackView.doc_addFlexiblySpacedArrangedSubviews(_:minSpacing:maxSpacing:)(uint64_t a1, double a2, double a3)
{
  void *v3;
  void *v4;
  char **v5;
  void *v6;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  id v12;
  double v13;
  double v14;
  uint64_t result;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  id *v25;
  id v26;
  id v27;
  uint64_t v28;
  id v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  void *v40;
  id v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;

  v6 = v4;
  v9 = a1;
  v10 = (unint64_t)a1 >> 62;
  if (!((unint64_t)a1 >> 62))
  {
    v11 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v11)
      goto LABEL_3;
    return swift_bridgeObjectRelease();
  }
  if (a1 < 0)
    v3 = (void *)a1;
  else
    v3 = (void *)(a1 & 0xFFFFFFFFFFFFFF8);
  swift_bridgeObjectRetain();
  v11 = sub_21EB0341C();
  if (!v11)
    return swift_bridgeObjectRelease();
LABEL_3:
  if ((v9 & 0xC000000000000001) != 0)
  {
    v12 = (id)MEMORY[0x2207B5B3C](0, v9);
  }
  else
  {
    if (!*(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_61;
    }
    v12 = *(id *)(v9 + 32);
  }
  v3 = v12;
  swift_bridgeObjectRelease();
  if (a2 < 0.0)
    a2 = 0.0;
  if (a2 > a3)
    v13 = a2;
  else
    v13 = a3;
  if (a3 >= 0.0)
    v14 = v13;
  else
    v14 = 1.79769313e308;
  v5 = &selRef_configurationUpdateHandler;
  result = (uint64_t)objc_msgSend(v6, sel_addArrangedSubview_, v3, v13);
  v45 = MEMORY[0x24BEE4AF8];
  if (v11 < 0)
    goto LABEL_76;
  if (v10)
  {
    swift_bridgeObjectRetain();
    if (sub_21EB0341C() >= 1)
    {
      swift_bridgeObjectRetain();
      v16 = sub_21EB0341C();
      result = swift_bridgeObjectRelease();
      goto LABEL_20;
    }
LABEL_61:
    __break(1u);
    goto LABEL_62;
  }
  v16 = *(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10);
  result = swift_bridgeObjectRetain();
  if (!v16)
    goto LABEL_61;
LABEL_20:
  if (v16 < v11)
  {
LABEL_62:
    __break(1u);
LABEL_63:
    swift_bridgeObjectRetain();
    result = sub_21EB0341C();
    if (!result)
      goto LABEL_64;
    goto LABEL_38;
  }
  if ((v9 & 0xC000000000000001) != 0 && v11 != 1)
  {
    sub_21EA579D4(0, &qword_2540A6EF0);
    result = 1;
    do
    {
      v17 = result + 1;
      sub_21EB032FC();
      result = v17;
    }
    while (v11 != v17);
  }
  if (v10)
  {
    swift_bridgeObjectRetain();
    sub_21EB03428();
    v18 = v21;
    v19 = v22;
    v20 = v23;
    result = swift_bridgeObjectRelease_n();
  }
  else
  {
    v18 = (v9 & 0xFFFFFFFFFFFFFF8) + 32;
    v19 = 1;
    v20 = (2 * v11) | 1;
  }
  v24 = (v20 >> 1) - v19;
  if (v20 >> 1 == v19)
  {
    swift_unknownObjectRelease();
    v9 = MEMORY[0x24BEE4AF8];
  }
  else
  {
    if ((uint64_t)(v20 >> 1) <= v19)
    {
LABEL_75:
      __break(1u);
LABEL_76:
      __break(1u);
      goto LABEL_77;
    }
    swift_unknownObjectRetain();
    v25 = (id *)(v18 + 8 * v19);
    do
    {
      v26 = *v25;
      v27 = sub_21EAFC7A4(a2, v14);
      MEMORY[0x2207B5500]();
      if (*(_QWORD *)((v45 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v45 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_21EB02D20();
      sub_21EB02D5C();
      sub_21EB02D08();
      objc_msgSend(v6, sel_addArrangedSubview_, v27);
      objc_msgSend(v6, sel_addArrangedSubview_, v26);

      ++v25;
      --v24;
    }
    while (v24);
    swift_unknownObjectRelease_n();
    v9 = v45;
  }
  v5 = (char **)(v9 >> 62);
  if (v9 >> 62)
    goto LABEL_63;
  v28 = *(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10);
  result = swift_bridgeObjectRetain();
  if (!v28)
  {
LABEL_64:

    return swift_bridgeObjectRelease_n();
  }
LABEL_38:
  if ((v9 & 0xC000000000000001) != 0)
  {
    v29 = (id)MEMORY[0x2207B5B3C](0, v9);
  }
  else
  {
    if (!*(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
LABEL_74:
      __break(1u);
      goto LABEL_75;
    }
    v29 = *(id *)(v9 + 32);
  }
  v30 = v29;
  swift_bridgeObjectRelease();
  if (!v5)
  {
    v31 = *(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v31 >= 1)
      v32 = 1;
    else
      v32 = *(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v31 >= (unint64_t)v32)
      goto LABEL_46;
    goto LABEL_73;
  }
  swift_bridgeObjectRetain_n();
  v31 = sub_21EB0341C();
  result = swift_bridgeObjectRelease();
  if (v31 < 0)
  {
LABEL_77:
    __break(1u);
    return result;
  }
  if (v31 >= 1)
    v32 = 1;
  else
    v32 = v31;
  swift_bridgeObjectRetain();
  v43 = sub_21EB0341C();
  result = swift_bridgeObjectRelease();
  if (v43 < v32)
    goto LABEL_73;
  swift_bridgeObjectRetain();
  v44 = sub_21EB0341C();
  result = swift_bridgeObjectRelease();
  if (v44 < v31)
  {
    __break(1u);
LABEL_73:
    __break(1u);
    goto LABEL_74;
  }
LABEL_46:
  if ((v9 & 0xC000000000000001) != 0 && (unint64_t)v31 >= 2)
  {
    sub_21EA579D4(0, &qword_2540A6EF0);
    v33 = v32;
    do
    {
      v34 = v33 + 1;
      sub_21EB032FC();
      v33 = v34;
    }
    while (v31 != v34);
  }
  if (v5)
  {
    swift_bridgeObjectRetain();
    sub_21EB03428();
    v35 = v37;
    v32 = v38;
    v36 = v39;
    swift_bridgeObjectRelease_n();
  }
  else
  {
    v35 = (v9 & 0xFFFFFFFFFFFFFF8) + 32;
    v36 = (2 * v31) | 1;
  }
  v40 = (void *)objc_opt_self();
  v41 = v30;
  sub_21EAFCA18(v35, v32, v36, v41);
  swift_unknownObjectRelease();

  sub_21EA579D4(0, &qword_25546A918);
  v42 = (void *)sub_21EB02CE4();
  swift_bridgeObjectRelease();
  objc_msgSend(v40, sel_activateConstraints_, v42);

  return swift_bridgeObjectRelease();
}

id sub_21EAFC7A4(double a1, double a2)
{
  id v4;
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;

  v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDB00]), sel_init);
  objc_msgSend(v4, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  LODWORD(v5) = 1144750080;
  objc_msgSend(v4, sel_setContentHuggingPriority_forAxis_, 0, v5);
  LODWORD(v6) = 1132068864;
  objc_msgSend(v4, sel_setContentCompressionResistancePriority_forAxis_, 0, v6);
  v7 = (void *)objc_opt_self();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540A6F80);
  v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_21EB0CC40;
  v9 = objc_msgSend(v4, sel_heightAnchor);
  v10 = objc_msgSend(v9, sel_constraintGreaterThanOrEqualToConstant_, 1.0);

  *(_QWORD *)(v8 + 32) = v10;
  v11 = objc_msgSend(v4, sel_widthAnchor);
  v12 = objc_msgSend(v11, sel_constraintGreaterThanOrEqualToConstant_, a1);

  *(_QWORD *)(v8 + 40) = v12;
  v13 = objc_msgSend(v4, sel_widthAnchor);
  v14 = objc_msgSend(v13, sel_constraintLessThanOrEqualToConstant_, a2);

  *(_QWORD *)(v8 + 48) = v14;
  sub_21EB02D08();
  sub_21EA579D4(0, &qword_25546A918);
  v15 = (void *)sub_21EB02CE4();
  swift_bridgeObjectRelease();
  objc_msgSend(v7, sel_activateConstraints_, v15);

  return v4;
}

uint64_t sub_21EAFC9A0(void *a1, double a2, double a3)
{
  uint64_t v6;
  id v7;

  sub_21EA579D4(0, &qword_2540A6EF0);
  v6 = sub_21EB02CF0();
  v7 = a1;
  UIStackView.doc_addFlexiblySpacedArrangedSubviews(_:minSpacing:maxSpacing:)(v6, a2, a3);

  return swift_bridgeObjectRelease();
}

uint64_t sub_21EAFCA18(uint64_t result, uint64_t a2, unint64_t a3, void *a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  int64_t v14;
  uint64_t v16;

  v14 = a3 >> 1;
  v4 = (a3 >> 1) - a2;
  if (__OFSUB__(a3 >> 1, a2))
    goto LABEL_13;
  v5 = result;
  result = MEMORY[0x24BEE4AF8];
  if (v4)
  {
    v16 = MEMORY[0x24BEE4AF8];
    result = sub_21EB0335C();
    if (v4 < 0)
    {
LABEL_14:
      __break(1u);
      return result;
    }
    v6 = 0;
    v7 = v5 + 8 * a2;
    while (1)
    {
      v8 = v6 + 1;
      if (__OFADD__(v6, 1))
        break;
      if (a2 + v6 >= v14 || v6 >= v4)
        goto LABEL_12;
      v9 = *(id *)(v7 + 8 * v6);
      v10 = objc_msgSend(v9, sel_widthAnchor);
      v11 = objc_msgSend(a4, sel_widthAnchor);
      v12 = objc_msgSend(v10, sel_constraintEqualToAnchor_, v11);

      sub_21EB03338();
      sub_21EB03368();
      sub_21EB03374();
      result = sub_21EB03344();
      ++v6;
      if (v8 == v4)
        return v16;
    }
    __break(1u);
LABEL_12:
    __break(1u);
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  return result;
}

uint64_t sub_21EAFCB84()
{
  sub_21EB035A8();
  sub_21EB035B4();
  return sub_21EB035E4();
}

uint64_t sub_21EAFCBC4()
{
  return sub_21EB035B4();
}

uint64_t sub_21EAFCBE8()
{
  sub_21EB035A8();
  sub_21EB035B4();
  return sub_21EB035E4();
}

void DOCICloudRootNode.deferredCreationNode.setter(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;

  v3 = (void **)(v1 + OBJC_IVAR____TtC26DocumentManagerExecutables17DOCICloudRootNode_deferredCreationNode);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;

}

uint64_t (*DOCICloudRootNode.deferredCreationNode.modify())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t DOCICloudRootNode.observerBlock.getter()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC26DocumentManagerExecutables17DOCICloudRootNode_observerBlock);
  swift_beginAccess();
  v2 = *v1;
  sub_21EA83588(*v1);
  return v2;
}

uint64_t DOCICloudRootNode.observerBlock.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v5;
  uint64_t v6;

  v5 = (uint64_t *)(v2 + OBJC_IVAR____TtC26DocumentManagerExecutables17DOCICloudRootNode_observerBlock);
  swift_beginAccess();
  v6 = *v5;
  *v5 = a1;
  v5[1] = a2;
  return sub_21EA5CA7C(v6);
}

uint64_t (*DOCICloudRootNode.observerBlock.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

id *sub_21EAFCDB0(void *a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  char *v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  id v21;
  objc_class *v22;
  id v23;
  uint64_t v24;
  id *v25;
  id *v26;
  id *v27;
  id v28;
  char *v29;
  uint64_t v30;
  uint64_t v32;
  uint64_t *v33;
  id *v34;
  _QWORD v35[2];
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  objc_super v41;

  v3 = sub_21EB02A20();
  v38 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v37 = (char *)v35 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_21EB02618();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)&v1[OBJC_IVAR____TtC26DocumentManagerExecutables17DOCICloudRootNode_deferredCreationNode] = 0;
  v9 = &v1[OBJC_IVAR____TtC26DocumentManagerExecutables17DOCICloudRootNode_observerBlock];
  *(_QWORD *)v9 = 0;
  *((_QWORD *)v9 + 1) = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC26DocumentManagerExecutables17DOCICloudRootNode_iCloudContainer] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC26DocumentManagerExecutables17DOCICloudRootNode_appLibrariesContainer] = 0;
  v10 = v1;
  sub_21EB03014();
  if (qword_2540A6C50 != -1)
    swift_once();
  sub_21EB0260C();
  v34 = (id *)MEMORY[0x24BEE4AF8];
  LOBYTE(v33) = 2;
  v32 = 22;
  sub_21EB02600();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  if (qword_255469BE8 != -1)
    swift_once();
  v11 = sub_21EB0263C();
  __swift_project_value_buffer(v11, (uint64_t)static Logger.Enumeration);
  v12 = a1;
  v13 = sub_21EB02624();
  v14 = sub_21EB02F00();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = (uint8_t *)swift_slowAlloc();
    v16 = swift_slowAlloc();
    v40 = v16;
    v36 = v3;
    *(_DWORD *)v15 = 136315138;
    v35[1] = v15 + 4;
    v17 = objc_msgSend(v12, sel_identifier);
    v18 = sub_21EB02B88();
    v20 = v19;

    v39 = sub_21EA591E4(v18, v20, &v40);
    v3 = v36;
    sub_21EB03134();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21EA4C000, v13, v14, "Init DOCICloudRootNode for domain %s", v15, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2207B6A18](v16, -1, -1);
    MEMORY[0x2207B6A18](v15, -1, -1);

  }
  else
  {

  }
  *(_QWORD *)&v10[OBJC_IVAR____TtC26DocumentManagerExecutables17DOCICloudRootNode_providerDomain] = v12;
  v21 = v12;

  v22 = (objc_class *)type metadata accessor for DOCICloudRootNode();
  v41.receiver = v10;
  v41.super_class = v22;
  v23 = objc_msgSendSuper2(&v41, sel_init);
  v24 = qword_2540A69F8;
  v25 = (id *)v23;
  v26 = v25;
  if (v24 != -1)
    v25 = (id *)swift_once();
  v27 = (id *)off_2540A69E8;
  MEMORY[0x24BDAC7A8](v25);
  v34 = v26;
  v28 = v27[2];
  v29 = v37;
  v30 = sub_21EB02A14();
  MEMORY[0x24BDAC7A8](v30);
  v32 = (uint64_t)sub_21EA6139C;
  v33 = &v32;
  v34 = v27;
  sub_21EB02F60();

  (*(void (**)(char *, uint64_t))(v38 + 8))(v29, v3);
  sub_21EA51790();

  return v26;
}

uint64_t sub_21EAFD1FC(void *a1)
{
  char *v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  char *v6;
  void *v7;

  *(_QWORD *)&v1[OBJC_IVAR____TtC26DocumentManagerExecutables17DOCICloudRootNode_deferredCreationNode] = 0;
  v2 = &v1[OBJC_IVAR____TtC26DocumentManagerExecutables17DOCICloudRootNode_observerBlock];
  *(_QWORD *)v2 = 0;
  *((_QWORD *)v2 + 1) = 0;
  v3 = OBJC_IVAR____TtC26DocumentManagerExecutables17DOCICloudRootNode_iCloudContainer;
  *(_QWORD *)&v1[OBJC_IVAR____TtC26DocumentManagerExecutables17DOCICloudRootNode_iCloudContainer] = 0;
  v4 = OBJC_IVAR____TtC26DocumentManagerExecutables17DOCICloudRootNode_appLibrariesContainer;
  *(_QWORD *)&v1[OBJC_IVAR____TtC26DocumentManagerExecutables17DOCICloudRootNode_appLibrariesContainer] = 0;
  v5 = *(void **)&v1[v3];
  v6 = v1;

  v7 = *(void **)&v1[v4];
  type metadata accessor for DOCICloudRootNode();
  swift_deallocPartialClassInstance();
  return 0;
}

void sub_21EAFD2BC(uint64_t a1)
{
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
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  void (*v22)(char *, uint64_t);
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  _QWORD v31[11];
  uint64_t v32;
  char *v33;
  uint64_t v34;

  v2 = sub_21EB02A20();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_21EB02A5C();
  v34 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v33 = (char *)v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_21EB029FC();
  v31[8] = *(_QWORD *)(v8 - 8);
  v31[9] = v8;
  MEMORY[0x24BDAC7A8](v8);
  v32 = sub_21EB02A74();
  v31[7] = *(_QWORD *)(v32 - 8);
  v9 = MEMORY[0x24BDAC7A8](v32);
  v31[6] = (char *)v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v31[10] = (char *)v31 - v11;
  v12 = sub_21EB02618();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)v31 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  v16 = MEMORY[0x2207B6ACC](a1 + 16);
  if (v16)
  {
    v17 = (char *)v16;
    v31[4] = v2;
    if (qword_255469BE8 != -1)
      swift_once();
    v31[1] = v6;
    v31[2] = v5;
    v18 = sub_21EB0263C();
    v31[5] = __swift_project_value_buffer(v18, (uint64_t)static Logger.Enumeration);
    v19 = sub_21EB02624();
    v20 = sub_21EB02F00();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_21EA4C000, v19, v20, "DOCICloudRootNode Managed: building containers...", v21, 2u);
      MEMORY[0x2207B6A18](v21, -1, -1);
    }
    v31[3] = v3;

    sub_21EB03008();
    if (qword_2540A6C50 != -1)
      swift_once();
    sub_21EB0260C();
    sub_21EB02600();
    v22 = *(void (**)(char *, uint64_t))(v13 + 8);
    v22(v15, v12);
    v23 = (void *)objc_opt_self();
    v24 = objc_msgSend(v23, sel_dataSeparatedICloudDefaultContainer);
    v25 = *(void **)&v17[OBJC_IVAR____TtC26DocumentManagerExecutables17DOCICloudRootNode_iCloudContainer];
    *(_QWORD *)&v17[OBJC_IVAR____TtC26DocumentManagerExecutables17DOCICloudRootNode_iCloudContainer] = v24;

    v26 = objc_msgSend(v23, sel_dataSeparatedICloudLibrariesContainer);
    v27 = *(void **)&v17[OBJC_IVAR____TtC26DocumentManagerExecutables17DOCICloudRootNode_appLibrariesContainer];
    *(_QWORD *)&v17[OBJC_IVAR____TtC26DocumentManagerExecutables17DOCICloudRootNode_appLibrariesContainer] = v26;

    sub_21EB02FFC();
    sub_21EB0260C();
    sub_21EB02600();
    v22(v15, v12);
    sub_21EA51A58();
    v28 = sub_21EB02624();
    v29 = sub_21EB02F00();
    if (os_log_type_enabled(v28, v29))
    {
      v30 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v30 = 0;
      _os_log_impl(&dword_21EA4C000, v28, v29, "DOCICloudRootNode Managed: finished building containers...", v30, 2u);
      MEMORY[0x2207B6A18](v30, -1, -1);

    }
    else
    {

    }
  }
}

void sub_21EAFD9E4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;

  v1 = a1 + 16;
  swift_beginAccess();
  v2 = MEMORY[0x2207B6ACC](v1);
  if (v2)
  {
    v3 = (void *)v2;
    sub_21EA51790();

  }
}

id DOCICloudRootNode.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void DOCICloudRootNode.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id DOCICloudRootNode.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DOCICloudRootNode();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void DOCICloudRootNode.identifier.getter(uint64_t a1@<X8>)
{
  uint64_t v1;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  __int128 v7;

  v3 = *(void **)(v1 + OBJC_IVAR____TtC26DocumentManagerExecutables17DOCICloudRootNode_iCloudContainer);
  if (v3)
  {
    v4 = objc_msgSend(v3, sel_identifier);
    sub_21EB031B8();
    swift_unknownObjectRelease();
    sub_21EA5951C(&v7, (_OWORD *)a1);
  }
  else
  {
    v5 = objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC26DocumentManagerExecutables17DOCICloudRootNode_providerDomain), sel_identifier);
    type metadata accessor for FPProviderDomainID(0);
    *(_QWORD *)(a1 + 24) = v6;
    *(_QWORD *)a1 = v5;
  }
}

uint64_t DOCICloudRootNode.identifierKey.getter()
{
  void *v0;
  id v1;

  v1 = objc_msgSend(v0, sel_identifier);
  sub_21EB031B8();
  swift_unknownObjectRelease();
  return swift_dynamicCast();
}

id DOCICloudRootNode.fpfs_fpItem.getter()
{
  return sub_21EAFE750((SEL *)&selRef_fpfs_fpItem);
}

uint64_t DOCICloudRootNode.contentType.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void *v7;
  id v8;
  uint64_t v10;

  v3 = sub_21EB025DC();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(void **)(v1 + OBJC_IVAR____TtC26DocumentManagerExecutables17DOCICloudRootNode_iCloudContainer);
  if (!v7)
    return _s26DocumentManagerExecutables14FISentinelNodeC11contentType07UniformG11Identifiers6UTTypeVvg_0();
  v8 = objc_msgSend(v7, sel_contentType);
  sub_21EB024F8();

  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v4 + 32))(a1, v6, v3);
}

uint64_t DOCICloudRootNode.typeIdentifier.getter()
{
  uint64_t v0;
  void *v1;
  id v2;
  uint64_t v3;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC26DocumentManagerExecutables17DOCICloudRootNode_iCloudContainer);
  if (!v1)
    return 0x692E63696C627570;
  v2 = objc_msgSend(v1, sel_typeIdentifier);
  v3 = sub_21EB02B88();

  return v3;
}

id DOCICloudRootNode.fileSize.getter()
{
  return sub_21EAFE750((SEL *)&selRef_fileSize);
}

id DOCICloudRootNode.childItemCount.getter()
{
  return sub_21EAFE750((SEL *)&selRef_childItemCount);
}

id DOCICloudRootNode.providerDomainID.getter()
{
  return sub_21EAFDEC8((SEL *)&selRef_providerDomainID, (SEL *)&selRef_identifier);
}

id DOCICloudRootNode.providerID.getter()
{
  return sub_21EAFDEC8((SEL *)&selRef_providerID, (SEL *)&selRef_providerID);
}

id sub_21EAFDEC8(SEL *a1, SEL *a2)
{
  uint64_t v2;
  id v3;

  if (*(_QWORD *)(v2 + OBJC_IVAR____TtC26DocumentManagerExecutables17DOCICloudRootNode_iCloudContainer))
    v3 = objc_msgSend(*(id *)(v2 + OBJC_IVAR____TtC26DocumentManagerExecutables17DOCICloudRootNode_iCloudContainer), *a1);
  else
    v3 = objc_msgSend(*(id *)(v2 + OBJC_IVAR____TtC26DocumentManagerExecutables17DOCICloudRootNode_providerDomain), *a2);
  return v3;
}

id sub_21EAFDF28(void *a1, uint64_t a2, uint64_t (*a3)(_QWORD), void (*a4)(void), uint64_t (*a5)(void))
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  void *v13;
  uint64_t v15;

  v8 = a3(0);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v15 - v10;
  v12 = a1;
  a4();

  v13 = (void *)a5();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return v13;
}

uint64_t DOCICloudRootNode.creationDate.getter@<X0>(uint64_t a1@<X8>)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  id v11;
  void (*v12)(char *, char *, uint64_t);
  objc_class *v14;
  id v15;
  objc_super v16;

  v3 = sub_21EB02384();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2540A6530);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(void **)&v1[OBJC_IVAR____TtC26DocumentManagerExecutables17DOCICloudRootNode_iCloudContainer];
  if (v10)
  {
    v11 = objc_msgSend(v10, sel_creationDate);
    sub_21EB02360();

    v12 = *(void (**)(char *, char *, uint64_t))(v4 + 32);
    v12(v9, v6, v3);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v4 + 56))(v9, 0, 1, v3);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v9, 1, v3) != 1)
      return ((uint64_t (*)(uint64_t, char *, uint64_t))v12)(a1, v9, v3);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v9, 1, 1, v3);
  }
  v14 = (objc_class *)type metadata accessor for DOCICloudRootNode();
  v16.receiver = v1;
  v16.super_class = v14;
  v15 = objc_msgSendSuper2(&v16, sel_creationDate);
  sub_21EB02360();

  return sub_21EAFEBFC((uint64_t)v9);
}

uint64_t DOCICloudRootNode.doc_creationDate.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_21EAFE1E0((uint64_t *)&unk_2540A6530, (SEL *)&selRef_doc_creationDate, (void (*)(void))MEMORY[0x24BDCE878], MEMORY[0x24BDCE900], a1);
}

uint64_t DOCICloudRootNode.modificationDate.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_21EAFE1E0((uint64_t *)&unk_2540A6530, (SEL *)&selRef_modificationDate, (void (*)(void))MEMORY[0x24BDCE878], MEMORY[0x24BDCE900], a1);
}

uint64_t sub_21EAFE1E0@<X0>(uint64_t *a1@<X0>, SEL *a2@<X1>, void (*a3)(void)@<X2>, uint64_t (*a4)(void)@<X3>, uint64_t a5@<X8>)
{
  uint64_t v5;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;

  v11 = __swift_instantiateConcreteTypeFromMangledName(a1);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = *(void **)(v5 + OBJC_IVAR____TtC26DocumentManagerExecutables17DOCICloudRootNode_iCloudContainer);
  if (v14)
  {
    v15 = objc_msgSend(v14, *a2);
    if (v15)
    {
      v16 = v15;
      a3();

      v17 = ((uint64_t (*)(_QWORD))a4)(0);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v13, 0, 1, v17);
    }
    else
    {
      v20 = a4();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(v13, 1, 1, v20);
    }
    return sub_21EA59D84((uint64_t)v13, a5, a1);
  }
  else
  {
    v18 = a4();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(a5, 1, 1, v18);
  }
}

uint64_t DOCICloudRootNode.doc_lastUsedDate.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_21EAFE1E0((uint64_t *)&unk_2540A6530, (SEL *)&selRef_doc_lastUsedDate, (void (*)(void))MEMORY[0x24BDCE878], MEMORY[0x24BDCE900], a1);
}

uint64_t DOCICloudRootNode.dateForSortingByRecents.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_21EAFE1E0((uint64_t *)&unk_2540A6530, (SEL *)&selRef_dateForSortingByRecents, (void (*)(void))MEMORY[0x24BDCE878], MEMORY[0x24BDCE900], a1);
}

uint64_t DOCICloudRootNode.isFolder.getter()
{
  return sub_21EAFE550((SEL *)&selRef_isFolder);
}

uint64_t DOCICloudRootNode.filename.getter()
{
  uint64_t v0;
  void *v1;
  id v2;
  uint64_t v3;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC26DocumentManagerExecutables17DOCICloudRootNode_iCloudContainer);
  if (!v1)
    return 0;
  v2 = objc_msgSend(v1, sel_filename);
  v3 = sub_21EB02B88();

  return v3;
}

id DOCICloudRootNode.isActionable.getter()
{
  return sub_21EAFE7B8((SEL *)&selRef_isActionable);
}

id DOCICloudRootNode.isReadable.getter()
{
  return sub_21EAFE7B8((SEL *)&selRef_isReadable);
}

id DOCICloudRootNode.isWritable.getter()
{
  return sub_21EAFE7B8((SEL *)&selRef_isWritable);
}

id DOCICloudRootNode.isPending.getter()
{
  return sub_21EAFE7B8((SEL *)&selRef_isPending);
}

id DOCICloudRootNode.isExternalDownloadPlaceholder.getter()
{
  return sub_21EAFE7B8((SEL *)&selRef_isExternalDownloadPlaceholder);
}

uint64_t sub_21EAFE524(uint64_t a1, uint64_t a2, SEL *a3)
{
  void *v3;

  v3 = *(void **)(a1 + OBJC_IVAR____TtC26DocumentManagerExecutables17DOCICloudRootNode_iCloudContainer);
  if (v3)
    return (uint64_t)objc_msgSend(v3, *a3);
  else
    return 1;
}

uint64_t DOCICloudRootNode.isCloudItem.getter()
{
  return sub_21EAFE550((SEL *)&selRef_isCloudItem);
}

uint64_t sub_21EAFE550(SEL *a1)
{
  uint64_t v1;

  if (*(_QWORD *)(v1 + OBJC_IVAR____TtC26DocumentManagerExecutables17DOCICloudRootNode_iCloudContainer))
    return (uint64_t)objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC26DocumentManagerExecutables17DOCICloudRootNode_iCloudContainer), *a1);
  else
    return 1;
}

id DOCICloudRootNode.isContainer.getter()
{
  return sub_21EAFE7B8((SEL *)&selRef_isContainer);
}

uint64_t DOCICloudRootNode.isRootItem.getter()
{
  return 1;
}

id DOCICloudRootNode.isTrashed.getter()
{
  return sub_21EAFE7B8((SEL *)&selRef_isTrashed);
}

id DOCICloudRootNode.isDownloading.getter()
{
  return sub_21EAFE7B8((SEL *)&selRef_isDownloading);
}

id DOCICloudRootNode.isDownloaded.getter()
{
  return sub_21EAFE7B8((SEL *)&selRef_isDownloaded);
}

id DOCICloudRootNode.downloadingProgress.getter()
{
  return sub_21EAFE750((SEL *)&selRef_downloadingProgress);
}

id DOCICloudRootNode.downloadingError.getter()
{
  return sub_21EAFE6F8((SEL *)&selRef_downloadingError);
}

id DOCICloudRootNode.isUploading.getter()
{
  return sub_21EAFE7B8((SEL *)&selRef_isUploading);
}

id DOCICloudRootNode.isUploaded.getter()
{
  return sub_21EAFE7B8((SEL *)&selRef_isUploaded);
}

id DOCICloudRootNode.uploadingProgress.getter()
{
  return sub_21EAFE750((SEL *)&selRef_uploadingProgress);
}

id sub_21EAFE674(char *a1, uint64_t a2, SEL *a3)
{
  void *v3;
  char *v5;
  id v6;

  v3 = *(void **)&a1[OBJC_IVAR____TtC26DocumentManagerExecutables17DOCICloudRootNode_iCloudContainer];
  if (v3)
  {
    v5 = a1;
    v6 = objc_msgSend(v3, *a3);

    if (v6)
    {
      v3 = (void *)sub_21EB02228();

    }
    else
    {
      v3 = 0;
    }
  }
  return v3;
}

id DOCICloudRootNode.uploadingError.getter()
{
  return sub_21EAFE6F8((SEL *)&selRef_uploadingError);
}

id sub_21EAFE6F8(SEL *a1)
{
  uint64_t v1;

  if (*(_QWORD *)(v1 + OBJC_IVAR____TtC26DocumentManagerExecutables17DOCICloudRootNode_iCloudContainer))
    return objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC26DocumentManagerExecutables17DOCICloudRootNode_iCloudContainer), *a1);
  else
    return 0;
}

id DOCICloudRootNode.copyingProgress.getter()
{
  return sub_21EAFE750((SEL *)&selRef_copyingProgress);
}

id sub_21EAFE750(SEL *a1)
{
  uint64_t v1;

  return objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC26DocumentManagerExecutables17DOCICloudRootNode_iCloudContainer), *a1);
}

id DOCICloudRootNode.isShared.getter()
{
  return sub_21EAFE7B8((SEL *)&selRef_isShared);
}

id DOCICloudRootNode.isSharedByCurrentUser.getter()
{
  return sub_21EAFE7B8((SEL *)&selRef_isSharedByCurrentUser);
}

id DOCICloudRootNode.isTopLevelSharedItem.getter()
{
  return sub_21EAFE7B8((SEL *)&selRef_isTopLevelSharedItem);
}

id sub_21EAFE7B8(SEL *a1)
{
  uint64_t v1;

  if (*(_QWORD *)(v1 + OBJC_IVAR____TtC26DocumentManagerExecutables17DOCICloudRootNode_iCloudContainer))
    return objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC26DocumentManagerExecutables17DOCICloudRootNode_iCloudContainer), *a1);
  else
    return 0;
}

id sub_21EAFE814(void *a1, uint64_t a2, uint64_t *a3, void (*a4)(void), uint64_t (*a5)(_QWORD), uint64_t (*a6)(void))
{
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v18;

  v10 = __swift_instantiateConcreteTypeFromMangledName(a3);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = a1;
  a4();

  v14 = a5(0);
  v15 = *(_QWORD *)(v14 - 8);
  v16 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v12, 1, v14) != 1)
  {
    v16 = (void *)a6();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v12, v14);
  }
  return v16;
}

uint64_t DOCICloudRootNode.ownerNameComponents.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_21EAFE1E0(&qword_2540A6518, (SEL *)&selRef_ownerNameComponents, (void (*)(void))MEMORY[0x24BDCCBD0], MEMORY[0x24BDCCC10], a1);
}

uint64_t DOCICloudRootNode.itemDecorations.getter()
{
  uint64_t v0;
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC26DocumentManagerExecutables17DOCICloudRootNode_iCloudContainer);
  if (!v1)
    return MEMORY[0x24BEE4AF8];
  v2 = objc_msgSend(v1, sel_itemDecorations);
  if (!v2)
    return MEMORY[0x24BEE4AF8];
  v3 = v2;
  sub_21EA579D4(0, &qword_25546A7D8);
  v4 = sub_21EB02CF0();

  return v4;
}

uint64_t DOCICloudRootNode.tags.getter()
{
  uint64_t v0;
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC26DocumentManagerExecutables17DOCICloudRootNode_iCloudContainer);
  if (!v1)
    return 0;
  v2 = objc_msgSend(v1, sel_tags);
  if (!v2)
    return 0;
  v3 = v2;
  sub_21EA579D4(0, (unint64_t *)&unk_25546BFB0);
  v4 = sub_21EB02CF0();

  return v4;
}

id DOCICloudRootNode.localizedStandardTagsCompare(node:)(uint64_t a1)
{
  return sub_21EAFEBB4(a1, (SEL *)&selRef_localizedStandardTagsCompareNode_);
}

id DOCICloudRootNode._doc_fileTypeCompare(node:)(uint64_t a1)
{
  return sub_21EAFEBB4(a1, (SEL *)&selRef__doc_fileTypeCompare_);
}

id sub_21EAFEBB4(uint64_t a1, SEL *a2)
{
  uint64_t v2;
  id result;

  result = *(id *)(v2 + OBJC_IVAR____TtC26DocumentManagerExecutables17DOCICloudRootNode_iCloudContainer);
  if (result)
    return objc_msgSend(result, *a2, a1);
  return result;
}

id sub_21EAFEBE0(uint64_t a1, uint64_t a2, uint64_t a3, SEL *a4)
{
  id result;

  result = *(id *)(a1 + OBJC_IVAR____TtC26DocumentManagerExecutables17DOCICloudRootNode_iCloudContainer);
  if (result)
    return objc_msgSend(result, *a4);
  return result;
}

uint64_t sub_21EAFEBFC(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2540A6530);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_21EAFEC3C()
{
  unint64_t result;

  result = qword_25546C998;
  if (!qword_25546C998)
  {
    result = MEMORY[0x2207B694C](&unk_21EB0D490, &type metadata for DOCICloudRootNode.DOCICloudRootNodeError);
    atomic_store(result, (unint64_t *)&qword_25546C998);
  }
  return result;
}

uint64_t sub_21EAFEC80()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_21EAFECA4()
{
  uint64_t v0;

  sub_21EAFD2BC(v0);
}

void sub_21EAFECAC()
{
  uint64_t v0;

  sub_21EAFD9E4(v0);
}

void destroy for DOCICloudRootNode.ThreadSafeRootNodes(id *a1)
{

}

_QWORD *initializeWithCopy for DOCICloudRootNode.ThreadSafeRootNodes(_QWORD *a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;

  v3 = *(void **)a2;
  v4 = *(void **)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v4;
  v5 = *(void **)(a2 + 16);
  v6 = *(void **)(a2 + 24);
  a1[2] = v5;
  a1[3] = v6;
  v7 = v3;
  v8 = v4;
  v9 = v5;
  v10 = v6;
  return a1;
}

uint64_t assignWithCopy for DOCICloudRootNode.ThreadSafeRootNodes(uint64_t a1, uint64_t a2)
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
  void *v13;
  void *v14;
  id v15;

  v4 = *(void **)a1;
  v5 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v5;

  v7 = *(void **)(a1 + 8);
  v8 = *(void **)(a2 + 8);
  *(_QWORD *)(a1 + 8) = v8;
  v9 = v8;

  v10 = *(void **)(a1 + 16);
  v11 = *(void **)(a2 + 16);
  *(_QWORD *)(a1 + 16) = v11;
  v12 = v11;

  v13 = *(void **)(a1 + 24);
  v14 = *(void **)(a2 + 24);
  *(_QWORD *)(a1 + 24) = v14;
  v15 = v14;

  return a1;
}

uint64_t assignWithTake for DOCICloudRootNode.ThreadSafeRootNodes(uint64_t a1, _OWORD *a2)
{
  void *v4;
  void *v5;

  v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *a2;

  v5 = *(void **)(a1 + 24);
  *(_OWORD *)(a1 + 16) = a2[1];

  return a1;
}

uint64_t getEnumTagSinglePayload for DOCICloudRootNode.ThreadSafeRootNodes(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 32))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for DOCICloudRootNode.ThreadSafeRootNodes(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 32) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 32) = 0;
    if (a2)
      *(_QWORD *)result = a2;
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for DOCICloudRootNode.DOCICloudRootNodeError(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_21EAFEF04 + 4 * asc_21EB0D3A0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_21EAFEF24 + 4 * byte_21EB0D3A5[v4]))();
}

_BYTE *sub_21EAFEF04(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_21EAFEF24(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_21EAFEF2C(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_21EAFEF34(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_21EAFEF3C(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_21EAFEF44(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for DOCICloudRootNode.DOCICloudRootNodeError()
{
  return &type metadata for DOCICloudRootNode.DOCICloudRootNodeError;
}

unint64_t sub_21EAFEF64()
{
  unint64_t result;

  result = qword_25546C9A0;
  if (!qword_25546C9A0)
  {
    result = MEMORY[0x2207B694C](&unk_21EB0D468, &type metadata for DOCICloudRootNode.DOCICloudRootNodeError);
    atomic_store(result, (unint64_t *)&qword_25546C9A0);
  }
  return result;
}

uint64_t static DOCAnalyticsAPIAbuseEvent.renameAPI(hostIdentifier:type:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  *(_QWORD *)a4 = 0xD000000000000032;
  *(_QWORD *)(a4 + 8) = 0x800000021EB105C0;
  *(_QWORD *)(a4 + 16) = 0;
  *(_QWORD *)(a4 + 24) = 0;
  *(_QWORD *)(a4 + 32) = a1;
  *(_QWORD *)(a4 + 40) = a2;
  *(_BYTE *)(a4 + 48) = a3 & 1;
  return swift_bridgeObjectRetain();
}

uint64_t static DOCAnalyticsAPIAbuseEvent.createDocumentSPI(hostIdentifier:type:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  *(_QWORD *)a4 = 0xD00000000000003ALL;
  *(_QWORD *)(a4 + 8) = 0x800000021EB15F20;
  *(_QWORD *)(a4 + 16) = 0;
  *(_QWORD *)(a4 + 24) = 0;
  *(_QWORD *)(a4 + 32) = a1;
  *(_QWORD *)(a4 + 40) = a2;
  *(_BYTE *)(a4 + 48) = a3 & 1;
  return swift_bridgeObjectRetain();
}

unint64_t sub_21EAFF028()
{
  uint64_t inited;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25546A388);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_21EB07140;
  strcpy((char *)(inited + 32), "hostIdentifier");
  *(_BYTE *)(inited + 47) = -18;
  *(_QWORD *)(inited + 48) = sub_21EB02B58();
  *(_QWORD *)(inited + 56) = 1701869940;
  *(_QWORD *)(inited + 64) = 0xE400000000000000;
  *(_QWORD *)(inited + 72) = sub_21EB02E40();
  return sub_21EA5E924(inited);
}

unint64_t (*sub_21EAFF0C4())()
{
  uint64_t v0;
  __int128 v1;
  uint64_t v2;
  __int128 v3;
  _OWORD v5[3];
  char v6;

  v1 = *(_OWORD *)(v0 + 16);
  v5[0] = *(_OWORD *)v0;
  v5[1] = v1;
  v5[2] = *(_OWORD *)(v0 + 32);
  v6 = *(_BYTE *)(v0 + 48);
  v2 = swift_allocObject();
  v3 = *(_OWORD *)(v0 + 16);
  *(_OWORD *)(v2 + 16) = *(_OWORD *)v0;
  *(_OWORD *)(v2 + 32) = v3;
  *(_OWORD *)(v2 + 48) = *(_OWORD *)(v0 + 32);
  *(_BYTE *)(v2 + 64) = *(_BYTE *)(v0 + 48);
  sub_21EA9488C((uint64_t)v5);
  return sub_21EAFF508;
}

uint64_t DOCAnalyticsAPIAbuseEvent.EventType.rawValue.getter(char a1)
{
  return a1 & 1;
}

DocumentManagerExecutables::DOCAnalyticsAPIAbuseEvent::EventType_optional __swiftcall DOCAnalyticsAPIAbuseEvent.EventType.init(rawValue:)(Swift::Int rawValue)
{
  DocumentManagerExecutables::DOCAnalyticsAPIAbuseEvent::EventType_optional v1;

  if (rawValue == 1)
    v1.value = DocumentManagerExecutables_DOCAnalyticsAPIAbuseEvent_EventType_nameCollision;
  else
    v1.value = DocumentManagerExecutables_DOCAnalyticsAPIAbuseEvent_EventType_unknownDefault;
  if (rawValue)
    return v1;
  else
    return 0;
}

unint64_t sub_21EAFF164()
{
  unint64_t result;

  result = qword_25546C9A8;
  if (!qword_25546C9A8)
  {
    result = MEMORY[0x2207B694C](&protocol conformance descriptor for DOCAnalyticsAPIAbuseEvent.EventType, &type metadata for DOCAnalyticsAPIAbuseEvent.EventType);
    atomic_store(result, (unint64_t *)&qword_25546C9A8);
  }
  return result;
}

_QWORD *sub_21EAFF1A8@<X0>(_QWORD *result@<X0>, char *a2@<X8>)
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

uint64_t destroy for DOCAnalyticsAPIAbuseEvent()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for DOCAnalyticsAPIAbuseEvent(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  v5 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v5;
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for DOCAnalyticsAPIAbuseEvent(uint64_t a1, uint64_t a2)
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
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  return a1;
}

__n128 __swift_memcpy49_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for DOCAnalyticsAPIAbuseEvent(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

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
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  return a1;
}

uint64_t getEnumTagSinglePayload for DOCAnalyticsAPIAbuseEvent(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 49))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DOCAnalyticsAPIAbuseEvent(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 48) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 49) = 1;
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
    *(_BYTE *)(result + 49) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for DOCAnalyticsAPIAbuseEvent()
{
  return &type metadata for DOCAnalyticsAPIAbuseEvent;
}

uint64_t storeEnumTagSinglePayload for DOCAnalyticsAPIAbuseEvent.EventType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_21EAFF454 + 4 * byte_21EB0D4D5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_21EAFF488 + 4 * byte_21EB0D4D0[v4]))();
}

uint64_t sub_21EAFF488(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21EAFF490(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21EAFF498);
  return result;
}

uint64_t sub_21EAFF4A4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21EAFF4ACLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_21EAFF4B0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21EAFF4B8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DOCAnalyticsAPIAbuseEvent.EventType()
{
  return &type metadata for DOCAnalyticsAPIAbuseEvent.EventType;
}

uint64_t sub_21EAFF4D4()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

unint64_t sub_21EAFF508()
{
  return sub_21EAFF028();
}

uint64_t UIScrollView.doc_isMoving.getter()
{
  void *v0;

  if ((objc_msgSend(v0, sel_isDragging) & 1) != 0
    || (objc_msgSend(v0, sel_isDecelerating) & 1) != 0)
  {
    return 1;
  }
  else
  {
    return (uint64_t)objc_msgSend(v0, sel_isTracking);
  }
}

id UIScrollView.doc_translateContent(dx:dy:animated:)(char a1, double a2, double a3)
{
  void *v3;
  double v7;
  double v8;

  objc_msgSend(v3, sel_contentOffset);
  return objc_msgSend(v3, sel_setContentOffset_animated_, a1 & 1, v7 + a2, v8 + a3);
}

uint64_t static DOCUserInterfaceStateStore.retrieveDefaultSortMode(configuration:)(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t result;
  char v15;
  __int128 v16;
  __int128 v17;

  v2 = objc_msgSend((id)objc_opt_self(), sel_sharedStore);
  v3 = objc_msgSend(v2, sel_interfaceStateForConfiguration_, a1);

  if (!v3)
    return 0;
  v4 = objc_msgSend(v3, sel_sortingMode);

  if (!v4)
    return 0;
  v5 = sub_21EB02AD4();

  v6 = sub_21EB02B88();
  if (!*(_QWORD *)(v5 + 16) || (v8 = sub_21EA5B7F8(v6, v7), (v9 & 1) == 0))
  {
    v16 = 0u;
    v17 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_11;
  }
  sub_21EA5A05C(*(_QWORD *)(v5 + 56) + 32 * v8, (uint64_t)&v16);
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v17 + 1))
    goto LABEL_11;
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_13:
    swift_bridgeObjectRelease();
    return 0;
  }
  v10 = sub_21EB02B88();
  if (*(_QWORD *)(v5 + 16) && (v12 = sub_21EA5B7F8(v10, v11), (v13 & 1) != 0))
  {
    sub_21EA5A05C(*(_QWORD *)(v5 + 56) + 32 * v12, (uint64_t)&v16);
  }
  else
  {
    v16 = 0u;
    v17 = 0u;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v17 + 1))
  {
LABEL_11:
    swift_bridgeObjectRelease();
    sub_21EA5B5B0((uint64_t)&v16);
    return 0;
  }
  if ((swift_dynamicCast() & 1) == 0)
    goto LABEL_13;
  v15 = _s26DocumentManagerExecutables15DOCItemSortModeO8rawValueACSgSS_tcfC_0();
  if (v15 == 7)
    return 0;
  _s26DocumentManagerExecutables21DOCItemSortDescriptorV4type10isReversedAcA0dE4ModeO_SbtcfC_0(v15);
  return result;
}

void static DOCUserInterfaceStateStore.saveDefaultSortMode(_:configuration:)(char a1)
{
  __asm { BR              X10 }
}

void sub_21EAFF848()
{
  uint64_t v0;
  char v1;
  void *v2;
  id v3;
  id v4;
  uint64_t inited;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v2 = (void *)objc_opt_self();
  v3 = objc_msgSend(v2, sel_sharedStore);
  v4 = objc_msgSend(v3, sel_interfaceStateForConfiguration_, v0);

  if (v4)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25546C350);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_21EB07140;
    *(_QWORD *)(inited + 32) = sub_21EB02B88();
    *(_QWORD *)(inited + 40) = v6;
    *(_QWORD *)(inited + 72) = MEMORY[0x24BEE0D00];
    strcpy((char *)(inited + 48), "lastUsedDate");
    *(_BYTE *)(inited + 61) = 0;
    *(_WORD *)(inited + 62) = -5120;
    *(_QWORD *)(inited + 80) = sub_21EB02B88();
    *(_QWORD *)(inited + 88) = v7;
    *(_QWORD *)(inited + 120) = MEMORY[0x24BEE1328];
    *(_BYTE *)(inited + 96) = v1 & 1;
    sub_21EA98908(inited);
    v8 = (void *)sub_21EB02AC8();
    swift_bridgeObjectRelease();
    objc_msgSend(v4, sel_setSortingMode_, v8);

    v9 = objc_msgSend(v2, sel_sharedStore);
    objc_msgSend(v9, sel_updateInterfaceState_forConfiguration_, v4, v0);

  }
  else
  {
    swift_bridgeObjectRelease();
  }
}

void static DOCUserInterfaceStateStore.saveDefaultGroupingBehavior(_:for:configuration:)(char a1, void *a2, uint64_t a3)
{
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t inited;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char isUniquelyReferenced_nonNull_native;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  NSObject *v27;
  void *v28;
  os_log_type_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  id v33;
  uint64_t v34;
  unint64_t v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  _OWORD v39[2];
  __int128 v40;
  uint64_t v41;

  v6 = (void *)objc_opt_self();
  v7 = objc_msgSend(v6, sel_sharedStore);
  v8 = objc_msgSend(v7, sel_interfaceStateForConfiguration_, a3);

  if (v8)
  {
    v9 = _sSo26DOCUserInterfaceStateStoreC26DocumentManagerExecutablesE016groupingBehaviorC10Identifier3forSSSo017DOCDocumentSourceJ0aSg_tFZ_0(a2);
    v11 = v10;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25546C350);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_21EB08F10;
    *(_QWORD *)(inited + 32) = sub_21EB02B88();
    *(_QWORD *)(inited + 40) = v13;
    *(_QWORD *)(inited + 72) = MEMORY[0x24BEE1328];
    *(_BYTE *)(inited + 48) = a1 != 7;
    sub_21EA98908(inited);
    v38 = v9;
    v14 = MEMORY[0x24BEE0D00];
    v15 = sub_21EB02B88();
    v16 = 0x800000021EB0E320;
    v17 = 0xD000000000000010;
    v18 = v15;
    v20 = v19;
    switch(a1)
    {
      case 0:
        goto LABEL_9;
      case 1:
        v16 = 0xEC00000065746144;
        v17 = 0x646573557473616CLL;
        goto LABEL_9;
      case 2:
        v16 = 0xE400000000000000;
        v17 = 1701667182;
        goto LABEL_9;
      case 3:
        v16 = 0xE400000000000000;
        v17 = 1936154996;
        goto LABEL_9;
      case 4:
        v16 = 0xE400000000000000;
        v17 = 1702521203;
        goto LABEL_9;
      case 5:
        v16 = 0xE400000000000000;
        v17 = 1684957547;
        goto LABEL_9;
      case 6:
        v16 = 0xE800000000000000;
        v17 = 0x7942646572616873;
LABEL_9:
        v41 = v14;
        *(_QWORD *)&v40 = v17;
        *((_QWORD *)&v40 + 1) = v16;
        sub_21EA5951C(&v40, v39);
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        sub_21EA9BA3C(v39, v18, v20, isUniquelyReferenced_nonNull_native);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        break;
      default:
        break;
    }
    v22 = objc_msgSend(v8, sel_groupingBehaviors);
    v23 = (void *)sub_21EB02AC8();
    swift_bridgeObjectRelease();
    v24 = (void *)sub_21EB02B58();
    objc_msgSend(v22, sel_setValue_forKey_, v23, v24);

    if (qword_255469BC8 != -1)
      swift_once();
    v25 = sub_21EB0263C();
    __swift_project_value_buffer(v25, (uint64_t)static Logger.StateStore);
    v26 = a2;
    swift_bridgeObjectRetain();
    v27 = sub_21EB02624();
    v28 = a2;
    v29 = sub_21EB02EDC();
    if (os_log_type_enabled(v27, v29))
    {
      v30 = swift_slowAlloc();
      v37 = swift_slowAlloc();
      *(_QWORD *)&v40 = v37;
      *(_DWORD *)v30 = 136315906;
      *(_QWORD *)&v39[0] = sub_21EA591E4(0xD000000000000031, 0x800000021EB15FD0, (uint64_t *)&v40);
      sub_21EB03134();
      *(_WORD *)(v30 + 12) = 2080;
      LOBYTE(v39[0]) = a1;
      v31 = sub_21EB02BA0();
      *(_QWORD *)&v39[0] = sub_21EA591E4(v31, v32, (uint64_t *)&v40);
      sub_21EB03134();
      swift_bridgeObjectRelease();
      *(_WORD *)(v30 + 22) = 2080;
      swift_bridgeObjectRetain();
      *(_QWORD *)&v39[0] = sub_21EA591E4(v38, v11, (uint64_t *)&v40);
      sub_21EB03134();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v30 + 32) = 2080;
      *(_QWORD *)&v39[0] = v28;
      v33 = v26;
      __swift_instantiateConcreteTypeFromMangledName(&qword_25546C9C0);
      v34 = sub_21EB02BA0();
      *(_QWORD *)&v39[0] = sub_21EA591E4(v34, v35, (uint64_t *)&v40);
      sub_21EB03134();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21EA4C000, v27, v29, "%s saving new value: \"%s\" to defaults: %s for identifier: %s", (uint8_t *)v30, 0x2Au);
      swift_arrayDestroy();
      MEMORY[0x2207B6A18](v37, -1, -1);
      MEMORY[0x2207B6A18](v30, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    v36 = objc_msgSend(v6, sel_sharedStore);
    objc_msgSend(v36, sel_updateInterfaceState_forConfiguration_, v8, a3);

  }
}

ValueMetadata *type metadata accessor for DocumentManagerExecutablesIntentsPackage()
{
  return &type metadata for DocumentManagerExecutablesIntentsPackage;
}

uint64_t static NSUserDefaults.docUserDefaults.getter()
{
  uint64_t v0;
  id v1;

  if (qword_2540A6DF8 != -1)
    swift_once();
  swift_beginAccess();
  v0 = static NSUserDefaults.docUserDefaults;
  v1 = (id)static NSUserDefaults.docUserDefaults;
  return v0;
}

void static NSUserDefaults.docUserDefaults.setter(uint64_t a1)
{
  void *v2;

  if (qword_2540A6DF8 != -1)
    swift_once();
  swift_beginAccess();
  v2 = (void *)static NSUserDefaults.docUserDefaults;
  static NSUserDefaults.docUserDefaults = a1;

}

uint64_t (*static NSUserDefaults.docUserDefaults.modify())()
{
  if (qword_2540A6DF8 != -1)
    swift_once();
  swift_beginAccess();
  return j__swift_endAccess;
}

void *DeepLinkLocation.filesAppURLScheme.unsafeMutableAddressor()
{
  return &static DeepLinkLocation.filesAppURLScheme;
}

uint64_t static DeepLinkLocation.filesAppURLScheme.getter()
{
  return 0x6F64646572616873;
}

uint64_t DeepLinkError.localizedStringResource.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  v0 = sub_21EB0224C();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_21EB023F0();
  MEMORY[0x24BDAC7A8](v4);
  v5 = sub_21EB02B4C();
  MEMORY[0x24BDAC7A8](v5);
  sub_21EB02B40();
  sub_21EB023E4();
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x24BDCD328], v0);
  return sub_21EB02264();
}

uint64_t static DeepLinkError.__derived_enum_equals(_:_:)()
{
  return 1;
}

uint64_t DeepLinkError.hash(into:)()
{
  return sub_21EB035B4();
}

uint64_t DeepLinkError.hashValue.getter()
{
  sub_21EB035A8();
  sub_21EB035B4();
  return sub_21EB035E4();
}

unint64_t sub_21EB0035C()
{
  unint64_t result;

  result = qword_25546C9D8;
  if (!qword_25546C9D8)
  {
    result = MEMORY[0x2207B694C](&protocol conformance descriptor for DeepLinkError, &type metadata for DeepLinkError);
    atomic_store(result, (unint64_t *)&qword_25546C9D8);
  }
  return result;
}

ValueMetadata *type metadata accessor for DeepLinkLocation()
{
  return &type metadata for DeepLinkLocation;
}

uint64_t storeEnumTagSinglePayload for DeepLinkError(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_21EB003F4 + 4 * asc_21EB0D620[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_21EB00414 + 4 * byte_21EB0D625[v4]))();
}

_BYTE *sub_21EB003F4(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_21EB00414(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_21EB0041C(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_21EB00424(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_21EB0042C(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_21EB00434(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for DeepLinkError()
{
  return &type metadata for DeepLinkError;
}

uint64_t Array.prefix(upToAndIncluding:)()
{
  uint64_t v0;
  uint64_t v2;

  v0 = sub_21EB02D98();
  swift_bridgeObjectRetain();
  MEMORY[0x2207B694C](MEMORY[0x24BEE12E0], v0);
  sub_21EB02E94();
  return v2;
}

Swift::Void __swiftcall Array.remove(upTo:)(Swift::Int upTo)
{
  if (upTo >= 1)
  {
    MEMORY[0x2207B694C](MEMORY[0x24BEE12E8]);
    sub_21EB02EB8();
  }
}

BOOL Array<A>.hasAny(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  _BOOL8 v13;
  _BYTE v15[16];
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v8 = sub_21EB030F8();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = &v15[-v10];
  v19 = a1;
  v16 = a3;
  v17 = a4;
  v18 = a2;
  v12 = sub_21EB02D98();
  MEMORY[0x2207B694C](MEMORY[0x24BEE12C8], v12);
  sub_21EB02C9C();
  v13 = (*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 48))(v11, 1, a3) != 1;
  (*(void (**)(_BYTE *, uint64_t))(v9 + 8))(v11, v8);
  return v13;
}

uint64_t sub_21EB00624()
{
  uint64_t v0;

  v0 = sub_21EB02D98();
  MEMORY[0x2207B694C](MEMORY[0x24BEE12C8], v0);
  return sub_21EB02CCC() & 1;
}

uint64_t sub_21EB0069C()
{
  return sub_21EB00624() & 1;
}

uint64_t Array.enqueue(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  MEMORY[0x24BDAC7A8](a1);
  (*(void (**)(char *))(v2 + 16))((char *)&v4 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0));
  return sub_21EB02D74();
}

uint64_t Array.dequeue()@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  _QWORD *v2;
  uint64_t v5;
  uint64_t v6;

  v5 = *(_QWORD *)(a1 + 16);
  if (MEMORY[0x2207B5590](*v2, v5))
  {
    MEMORY[0x2207B694C](MEMORY[0x24BEE12E8], a1);
    sub_21EB02EAC();
    v6 = 0;
  }
  else
  {
    v6 = 1;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(a2, v6, 1, v5);
}

uint64_t Sequence.asyncMap<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t AssociatedTypeWitness;
  uint64_t v9;

  v6[7] = a5;
  v6[8] = v5;
  v6[5] = a3;
  v6[6] = a4;
  v6[3] = a1;
  v6[4] = a2;
  v6[9] = swift_task_alloc();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v6[10] = AssociatedTypeWitness;
  v6[11] = *(_QWORD *)(AssociatedTypeWitness - 8);
  v6[12] = swift_task_alloc();
  sub_21EB030F8();
  v6[13] = swift_task_alloc();
  v6[14] = *(_QWORD *)(a3 - 8);
  v6[15] = swift_task_alloc();
  v9 = swift_getAssociatedTypeWitness();
  v6[16] = v9;
  v6[17] = *(_QWORD *)(v9 - 8);
  v6[18] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_21EB008D8()
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
  int *v10;
  _QWORD *v11;
  int *v12;

  v2 = *(_QWORD *)(v0 + 112);
  v1 = *(_QWORD *)(v0 + 120);
  v3 = *(_QWORD *)(v0 + 64);
  v4 = *(_QWORD *)(v0 + 40);
  *(_QWORD *)(v0 + 16) = sub_21EB02ABC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v3, v4);
  sub_21EB02C84();
  v5 = *(_QWORD *)(v0 + 104);
  v6 = *(_QWORD *)(v0 + 80);
  v7 = *(_QWORD *)(v0 + 88);
  swift_getAssociatedConformanceWitness();
  sub_21EB03128();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 136) + 8))(*(_QWORD *)(v0 + 144), *(_QWORD *)(v0 + 128));
    v8 = *(_QWORD *)(v0 + 16);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(uint64_t))(v0 + 8))(v8);
  }
  else
  {
    v10 = *(int **)(v0 + 24);
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 88) + 32))(*(_QWORD *)(v0 + 96), *(_QWORD *)(v0 + 104), *(_QWORD *)(v0 + 80));
    v12 = (int *)((char *)v10 + *v10);
    v11 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 152) = v11;
    *v11 = v0;
    v11[1] = sub_21EB00A74;
    return ((uint64_t (*)(_QWORD, _QWORD))v12)(*(_QWORD *)(v0 + 72), *(_QWORD *)(v0 + 96));
  }
}

uint64_t sub_21EB00A74()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 160) = v0;
  swift_task_dealloc();
  if (v0)
    swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_21EB00AE0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int *v9;
  _QWORD *v10;
  int *v11;

  v2 = *(_QWORD *)(v0 + 88);
  v1 = *(_QWORD *)(v0 + 96);
  v3 = *(_QWORD *)(v0 + 80);
  sub_21EB02D98();
  sub_21EB02D74();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  v4 = *(_QWORD *)(v0 + 104);
  v5 = *(_QWORD *)(v0 + 80);
  v6 = *(_QWORD *)(v0 + 88);
  swift_getAssociatedConformanceWitness();
  sub_21EB03128();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 136) + 8))(*(_QWORD *)(v0 + 144), *(_QWORD *)(v0 + 128));
    v7 = *(_QWORD *)(v0 + 16);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(uint64_t))(v0 + 8))(v7);
  }
  else
  {
    v9 = *(int **)(v0 + 24);
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 88) + 32))(*(_QWORD *)(v0 + 96), *(_QWORD *)(v0 + 104), *(_QWORD *)(v0 + 80));
    v11 = (int *)((char *)v9 + *v9);
    v10 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 152) = v10;
    *v10 = v0;
    v10[1] = sub_21EB00A74;
    return ((uint64_t (*)(_QWORD, _QWORD))v11)(*(_QWORD *)(v0 + 72), *(_QWORD *)(v0 + 96));
  }
}

uint64_t sub_21EB00C68()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(v0 + 136);
  v1 = *(_QWORD *)(v0 + 144);
  v3 = *(_QWORD *)(v0 + 128);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 88) + 8))(*(_QWORD *)(v0 + 96), *(_QWORD *)(v0 + 80));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void FPItemManager.doc_refetchItem(_:completion:)(void *a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  id v7;
  _QWORD *v8;
  void *v9;
  id v10;
  _QWORD v11[6];

  v7 = objc_msgSend(a1, sel_itemID);
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = a1;
  v8[3] = a2;
  v8[4] = a3;
  v11[4] = sub_21EB01578;
  v11[5] = v8;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 1107296256;
  v11[2] = sub_21EA81D44;
  v11[3] = &block_descriptor_28;
  v9 = _Block_copy(v11);
  v10 = a1;
  sub_21EB01F10();
  swift_release();
  objc_msgSend(v3, sel_fetchItemForItemID_completionHandler_, v7, v9);
  _Block_release(v9);

}

void sub_21EB00DF8(void *a1, uint64_t a2, void *a3, void (*a4)(void *, id))
{
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;

  if (a1)
  {
    v13 = a1;
    a4(a1, 0);
LABEL_7:

    return;
  }
  if (a2)
  {
    v7 = (void *)sub_21EB02228();
    if (qword_2540A6CB8 != -1)
      swift_once();
    sub_21EB02EE8();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2540A6F70);
    v8 = swift_allocObject();
    *(_OWORD *)(v8 + 16) = xmmword_21EB07140;
    v9 = objc_msgSend(a3, sel_itemID);
    *(_QWORD *)(v8 + 56) = sub_21EA579D4(0, (unint64_t *)&qword_25546C2F0);
    *(_QWORD *)(v8 + 64) = sub_21EAEBD24(&qword_25546C2F8, (unint64_t *)&qword_25546C2F0);
    *(_QWORD *)(v8 + 32) = v9;
    *(_QWORD *)(v8 + 96) = sub_21EA579D4(0, (unint64_t *)&unk_25546C300);
    *(_QWORD *)(v8 + 104) = sub_21EAEBD24((unint64_t *)&qword_25546BC30, (unint64_t *)&unk_25546C300);
    *(_QWORD *)(v8 + 72) = v7;
    v10 = v7;
    sub_21EB025F4();
    swift_bridgeObjectRelease();
    v13 = v10;
    a4(0, v10);

    goto LABEL_7;
  }
  if (qword_2540A6CB8 != -1)
    swift_once();
  sub_21EB02EE8();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2540A6F70);
  v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_21EB08F10;
  v12 = objc_msgSend(a3, sel_itemID);
  *(_QWORD *)(v11 + 56) = sub_21EA579D4(0, (unint64_t *)&qword_25546C2F0);
  *(_QWORD *)(v11 + 64) = sub_21EAEBD24(&qword_25546C2F8, (unint64_t *)&qword_25546C2F0);
  *(_QWORD *)(v11 + 32) = v12;
  sub_21EB025F4();
  swift_bridgeObjectRelease();
  a4(0, 0);
}

void sub_21EB010E8(uint64_t a1, id a2, char a3, uint64_t a4, void (*a5)(uint64_t, id))
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;

  if (a1)
  {
    v9 = a2;
    v10 = a2;
  }
  else
  {
    v10 = a2;
    if (!a2)
    {
      sub_21EB02B88();
      v11 = objc_allocWithZone(MEMORY[0x24BDD1540]);
      v12 = (void *)sub_21EB02B58();
      swift_bridgeObjectRelease();
      v10 = objc_msgSend(v11, sel_initWithDomain_code_userInfo_, v12, 4, 0);

    }
    v13 = a2;
    if (qword_2540A6CB8 != -1)
      swift_once();
    sub_21EB02EE8();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2540A6F70);
    v14 = swift_allocObject();
    *(_OWORD *)(v14 + 16) = xmmword_21EB09A00;
    *(_QWORD *)(v14 + 56) = MEMORY[0x24BEE0D00];
    v15 = sub_21EA5EA3C();
    *(_QWORD *)(v14 + 64) = v15;
    *(_QWORD *)(v14 + 32) = 0xD000000000000025;
    *(_QWORD *)(v14 + 40) = 0x800000021EB160F0;
    v16 = sub_21EB022B8();
    *(_QWORD *)(v14 + 96) = sub_21EA579D4(0, &qword_25546C0B8);
    *(_QWORD *)(v14 + 104) = sub_21EAEBD24((unint64_t *)&unk_25546C0C0, &qword_25546C0B8);
    *(_QWORD *)(v14 + 72) = v16;
    if (a2)
    {
      v17 = sub_21EB02228();
      v19 = sub_21EA579D4(0, (unint64_t *)&unk_25546C300);
      v20 = sub_21EAEBD24((unint64_t *)&qword_25546BC30, (unint64_t *)&unk_25546C300);
      *(_QWORD *)&v18 = v17;
      sub_21EA5F94C(&v18, v14 + 112);
    }
    else
    {
      *(_QWORD *)(v14 + 136) = MEMORY[0x24BEE0D00];
      *(_QWORD *)(v14 + 144) = v15;
      *(_QWORD *)(v14 + 112) = 0x676E697373696D28;
      *(_QWORD *)(v14 + 120) = 0xEF29726F72726520;
    }
    sub_21EB025F4();
    swift_bridgeObjectRelease();
  }
  a5(a1, v10);

  if ((a3 & 1) != 0)
    sub_21EB022D0();
}

void _sSo13FPItemManagerC08DocumentB11ExecutablesE13doc_fetchItem3for17completionHandlery10Foundation3URLV_ySo0A0CSg_s5Error_pSgtctF_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  id v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD aBlock[6];

  v16 = a2;
  v5 = sub_21EB02300();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  MEMORY[0x24BDAC7A8](v5);
  v8 = sub_21EB022E8();
  v9 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  v10 = (void *)sub_21EB022B8();
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))((char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v5);
  v11 = (*(unsigned __int8 *)(v6 + 80) + 17) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v12 = swift_allocObject();
  *(_BYTE *)(v12 + 16) = v8 & 1;
  (*(void (**)(unint64_t, char *, uint64_t))(v6 + 32))(v12 + v11, (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0), v5);
  v13 = (_QWORD *)(v12 + ((v7 + v11 + 7) & 0xFFFFFFFFFFFFFFF8));
  *v13 = v16;
  v13[1] = a3;
  aBlock[4] = sub_21EB015FC;
  aBlock[5] = v12;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21EA81D44;
  aBlock[3] = &block_descriptor_6_7;
  v14 = _Block_copy(aBlock);
  sub_21EB01F10();
  swift_release();
  objc_msgSend(v9, sel_fetchItemForURL_completionHandler_, v10, v14);
  _Block_release(v14);

}

uint64_t sub_21EB0154C()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

void sub_21EB01578(void *a1, uint64_t a2)
{
  uint64_t v2;

  sub_21EB00DF8(a1, a2, *(void **)(v2 + 16), *(void (**)(void *, id))(v2 + 24));
}

uint64_t sub_21EB01584()
{
  uint64_t v0;
  uint64_t v1;

  v1 = sub_21EB02300();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 17) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  swift_release();
  return swift_deallocObject();
}

void sub_21EB015FC(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v5;
  unint64_t v6;

  v5 = *(_QWORD *)(sub_21EB02300() - 8);
  v6 = (*(unsigned __int8 *)(v5 + 80) + 17) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  sub_21EB010E8(a1, a2, *(_BYTE *)(v2 + 16), v2 + v6, *(void (**)(uint64_t, id))(v2 + ((*(_QWORD *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8)));
}

CGSize __swiftcall CGSize.ceil()()
{
  double v0;
  double v1;
  double v2;
  double v3;
  CGSize result;

  v2 = ceil(v0);
  v3 = ceil(v1);
  result.height = v3;
  result.width = v2;
  return result;
}

CGSize __swiftcall CGSize.floor()()
{
  double v0;
  double v1;
  double v2;
  double v3;
  CGSize result;

  v2 = floor(v0);
  v3 = floor(v1);
  result.height = v3;
  result.width = v2;
  return result;
}

CGSize __swiftcall CGSize.rounded()()
{
  double v0;
  double v1;
  double v2;
  double v3;
  CGSize result;

  v2 = round(v0);
  v3 = round(v1);
  result.height = v3;
  result.width = v2;
  return result;
}

double CGSize.doc_bySubtracting(width:height:)(double a1, double a2, double a3)
{
  return a3 - a1;
}

double static CGSize.doc_preferredSourceListIconSize(for:)(void *a1)
{
  uint64_t inited;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  unint64_t v13;
  id v14;
  void *v15;
  unint64_t v16;
  char v17;
  double v18;
  id v19;
  double v20;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2540A6F50);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_21EB09EE0;
  v3 = (void *)*MEMORY[0x24BEBE078];
  *(_QWORD *)(inited + 32) = *MEMORY[0x24BEBE078];
  *(_QWORD *)(inited + 40) = 0x4041000000000000;
  v4 = (void *)*MEMORY[0x24BEBE070];
  *(_QWORD *)(inited + 48) = *MEMORY[0x24BEBE070];
  *(_QWORD *)(inited + 56) = 0x4044000000000000;
  v5 = (void *)*MEMORY[0x24BEBE068];
  *(_QWORD *)(inited + 64) = *MEMORY[0x24BEBE068];
  *(_QWORD *)(inited + 72) = 0x4043800000000000;
  v6 = (void *)*MEMORY[0x24BEBE060];
  *(_QWORD *)(inited + 80) = *MEMORY[0x24BEBE060];
  *(_QWORD *)(inited + 88) = 0x4046000000000000;
  v7 = (void *)*MEMORY[0x24BEBE058];
  *(_QWORD *)(inited + 96) = *MEMORY[0x24BEBE058];
  *(_QWORD *)(inited + 104) = 0x4048800000000000;
  v8 = v3;
  v9 = v4;
  v10 = v5;
  v11 = v6;
  v12 = v7;
  v13 = sub_21EA98B44(inited);
  v14 = objc_msgSend(a1, sel_preferredContentSizeCategory);
  v15 = v14;
  if (*(_QWORD *)(v13 + 16) && (v16 = sub_21EA826D4((uint64_t)v14), (v17 & 1) != 0))
  {
    v18 = *(double *)(*(_QWORD *)(v13 + 56) + 8 * v16);

    swift_bridgeObjectRelease();
  }
  else
  {

    swift_bridgeObjectRelease();
    v19 = objc_msgSend((id)objc_opt_self(), sel_defaultMetrics);
    objc_msgSend(v19, sel_scaledValueForValue_compatibleWithTraitCollection_, a1, 29.0);
    v18 = v20;

  }
  return v18;
}

uint64_t UIEdgeInsets.hash(into:)()
{
  sub_21EB035D8();
  sub_21EB035D8();
  sub_21EB035D8();
  return sub_21EB035D8();
}

uint64_t UIEdgeInsets.hashValue.getter()
{
  sub_21EB035A8();
  UIEdgeInsets.hash(into:)();
  return sub_21EB035E4();
}

uint64_t sub_21EB01910()
{
  sub_21EB035A8();
  UIEdgeInsets.hash(into:)();
  return sub_21EB035E4();
}

uint64_t sub_21EB01974()
{
  return UIEdgeInsets.hash(into:)();
}

uint64_t sub_21EB01980()
{
  sub_21EB035A8();
  UIEdgeInsets.hash(into:)();
  return sub_21EB035E4();
}

double UIEdgeInsets.verticalInsets.getter(double a1, double a2, double a3)
{
  return a1 + a3;
}

double UIEdgeInsets.horizontalInsets.getter(double a1, double a2, double a3, double a4)
{
  return a2 + a4;
}

unint64_t sub_21EB019F4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25546C9E8;
  if (!qword_25546C9E8)
  {
    type metadata accessor for UIEdgeInsets(255);
    result = MEMORY[0x2207B694C](MEMORY[0x24BEBCBA8], v1);
    atomic_store(result, (unint64_t *)&qword_25546C9E8);
  }
  return result;
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self();
}

uint64_t sub_21EB01E38()
{
  return MEMORY[0x24BDB4AF0]();
}

uint64_t sub_21EB01E44()
{
  return MEMORY[0x24BDB4D88]();
}

uint64_t sub_21EB01E50()
{
  return MEMORY[0x24BDB4DF8]();
}

uint64_t sub_21EB01E5C()
{
  return MEMORY[0x24BDB4E08]();
}

uint64_t sub_21EB01E68()
{
  return MEMORY[0x24BDB4E60]();
}

uint64_t sub_21EB01E74()
{
  return MEMORY[0x24BDB4E68]();
}

uint64_t sub_21EB01E80()
{
  return MEMORY[0x24BDB4EE0]();
}

uint64_t sub_21EB01E8C()
{
  return MEMORY[0x24BDB5028]();
}

uint64_t sub_21EB01E98()
{
  return MEMORY[0x24BDB51C0]();
}

uint64_t sub_21EB01EA4()
{
  return MEMORY[0x24BDB5458]();
}

uint64_t sub_21EB01EB0()
{
  return MEMORY[0x24BDB5460]();
}

uint64_t sub_21EB01EBC()
{
  return MEMORY[0x24BDB5468]();
}

uint64_t sub_21EB01EC8()
{
  return MEMORY[0x24BDB5470]();
}

uint64_t sub_21EB01ED4()
{
  return MEMORY[0x24BDB5508]();
}

uint64_t sub_21EB01EE0()
{
  return MEMORY[0x24BDB56A0]();
}

uint64_t sub_21EB01EEC()
{
  return MEMORY[0x24BDB56A8]();
}

uint64_t sub_21EB01EF8()
{
  return MEMORY[0x24BDB56B0]();
}

uint64_t sub_21EB01F04()
{
  return MEMORY[0x24BDB56B8]();
}

uint64_t sub_21EB01F10()
{
  return MEMORY[0x24BDB56C8]();
}

uint64_t sub_21EB01F1C()
{
  return MEMORY[0x24BDB56D8]();
}

uint64_t sub_21EB01F28()
{
  return MEMORY[0x24BDB56E0]();
}

uint64_t sub_21EB01F34()
{
  return MEMORY[0x24BDB56E8]();
}

uint64_t sub_21EB01F40()
{
  return MEMORY[0x24BDB56F0]();
}

uint64_t sub_21EB01F4C()
{
  return MEMORY[0x24BDB56F8]();
}

uint64_t sub_21EB01F58()
{
  return MEMORY[0x24BDB5708]();
}

uint64_t sub_21EB01F64()
{
  return MEMORY[0x24BDB5710]();
}

uint64_t sub_21EB01F70()
{
  return MEMORY[0x24BDB5718]();
}

uint64_t sub_21EB01F7C()
{
  return MEMORY[0x24BDB5720]();
}

uint64_t sub_21EB01F88()
{
  return MEMORY[0x24BDB5738]();
}

uint64_t sub_21EB01F94()
{
  return MEMORY[0x24BDB5740]();
}

uint64_t sub_21EB01FA0()
{
  return MEMORY[0x24BDB5748]();
}

uint64_t sub_21EB01FAC()
{
  return MEMORY[0x24BDB5750]();
}

uint64_t sub_21EB01FB8()
{
  return MEMORY[0x24BDB5760]();
}

uint64_t sub_21EB01FC4()
{
  return MEMORY[0x24BDB5770]();
}

uint64_t sub_21EB01FD0()
{
  return MEMORY[0x24BDB5778]();
}

uint64_t sub_21EB01FDC()
{
  return MEMORY[0x24BDB5780]();
}

uint64_t sub_21EB01FE8()
{
  return MEMORY[0x24BDB5790]();
}

uint64_t sub_21EB01FF4()
{
  return MEMORY[0x24BDB5800]();
}

uint64_t sub_21EB02000()
{
  return MEMORY[0x24BDB5810]();
}

uint64_t sub_21EB0200C()
{
  return MEMORY[0x24BDB5DB0]();
}

uint64_t sub_21EB02018()
{
  return MEMORY[0x24BDB5DD8]();
}

uint64_t sub_21EB02024()
{
  return MEMORY[0x24BDB5DF0]();
}

uint64_t sub_21EB02030()
{
  return MEMORY[0x24BDB5F50]();
}

uint64_t sub_21EB0203C()
{
  return MEMORY[0x24BDB5FF0]();
}

uint64_t sub_21EB02048()
{
  return MEMORY[0x24BDB5FF8]();
}

uint64_t sub_21EB02054()
{
  return MEMORY[0x24BDB6000]();
}

uint64_t sub_21EB02060()
{
  return MEMORY[0x24BDB6018]();
}

uint64_t sub_21EB0206C()
{
  return MEMORY[0x24BDB6098]();
}

uint64_t sub_21EB02078()
{
  return MEMORY[0x24BDB6150]();
}

uint64_t sub_21EB02084()
{
  return MEMORY[0x24BDB6168]();
}

uint64_t sub_21EB02090()
{
  return MEMORY[0x24BDB61F0]();
}

uint64_t sub_21EB0209C()
{
  return MEMORY[0x24BDB61F8]();
}

uint64_t sub_21EB020A8()
{
  return MEMORY[0x24BDB6200]();
}

uint64_t sub_21EB020B4()
{
  return MEMORY[0x24BDCAF28]();
}

uint64_t sub_21EB020C0()
{
  return MEMORY[0x24BDCAFC8]();
}

uint64_t sub_21EB020CC()
{
  return MEMORY[0x24BDCAFE0]();
}

uint64_t sub_21EB020D8()
{
  return MEMORY[0x24BDCB6C0]();
}

uint64_t sub_21EB020E4()
{
  return MEMORY[0x24BDCB6E0]();
}

uint64_t sub_21EB020F0()
{
  return MEMORY[0x24BDCB740]();
}

uint64_t sub_21EB020FC()
{
  return MEMORY[0x24BDCB750]();
}

uint64_t sub_21EB02108()
{
  return MEMORY[0x24BDCB8D8]();
}

uint64_t sub_21EB02114()
{
  return MEMORY[0x24BDCB8E8]();
}

uint64_t sub_21EB02120()
{
  return MEMORY[0x24BDCB8F0]();
}

uint64_t sub_21EB0212C()
{
  return MEMORY[0x24BDCB910]();
}

uint64_t sub_21EB02138()
{
  return MEMORY[0x24BDCB930]();
}

uint64_t sub_21EB02144()
{
  return MEMORY[0x24BDCBDE0]();
}

uint64_t sub_21EB02150()
{
  return MEMORY[0x24BDCC320]();
}

uint64_t sub_21EB0215C()
{
  return MEMORY[0x24BDCC560]();
}

uint64_t sub_21EB02168()
{
  return MEMORY[0x24BDCC6D8]();
}

uint64_t sub_21EB02174()
{
  return MEMORY[0x24BEE6118]();
}

uint64_t sub_21EB02180()
{
  return MEMORY[0x24BDCC818]();
}

uint64_t sub_21EB0218C()
{
  return MEMORY[0x24BDCCB20]();
}

uint64_t sub_21EB02198()
{
  return MEMORY[0x24BDCCB30]();
}

uint64_t sub_21EB021A4()
{
  return MEMORY[0x24BDCCBB0]();
}

uint64_t sub_21EB021B0()
{
  return MEMORY[0x24BDCCBD0]();
}

uint64_t sub_21EB021BC()
{
  return MEMORY[0x24BDCCC10]();
}

uint64_t sub_21EB021C8()
{
  return MEMORY[0x24BDCD280]();
}

uint64_t sub_21EB021D4()
{
  return MEMORY[0x24BDCD288]();
}

uint64_t sub_21EB021E0()
{
  return MEMORY[0x24BDCD290]();
}

uint64_t sub_21EB021EC()
{
  return MEMORY[0x24BDCD298]();
}

uint64_t sub_21EB021F8()
{
  return MEMORY[0x24BDCD2A0]();
}

uint64_t sub_21EB02204()
{
  return MEMORY[0x24BDCD2A8]();
}

uint64_t sub_21EB02210()
{
  return MEMORY[0x24BDCD2B8]();
}

uint64_t sub_21EB0221C()
{
  return MEMORY[0x24BDCD2C0]();
}

uint64_t sub_21EB02228()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_21EB02234()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_21EB02240()
{
  return MEMORY[0x24BDCD320]();
}

uint64_t sub_21EB0224C()
{
  return MEMORY[0x24BDCD340]();
}

uint64_t sub_21EB02258()
{
  return MEMORY[0x24BDCD380]();
}

uint64_t sub_21EB02264()
{
  return MEMORY[0x24BDCD3A8]();
}

uint64_t sub_21EB02270()
{
  return MEMORY[0x24BDCD748]();
}

uint64_t sub_21EB0227C()
{
  return MEMORY[0x24BDCD810]();
}

uint64_t sub_21EB02288()
{
  return MEMORY[0x24BDCD820]();
}

uint64_t sub_21EB02294()
{
  return MEMORY[0x24BDCD838]();
}

uint64_t sub_21EB022A0()
{
  return MEMORY[0x24BDCD848]();
}

uint64_t sub_21EB022AC()
{
  return MEMORY[0x24BDCD898]();
}

uint64_t sub_21EB022B8()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_21EB022C4()
{
  return MEMORY[0x24BDCD970]();
}

uint64_t sub_21EB022D0()
{
  return MEMORY[0x24BDCD9B0]();
}

uint64_t sub_21EB022DC()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_21EB022E8()
{
  return MEMORY[0x24BDCD9C8]();
}

uint64_t sub_21EB022F4()
{
  return MEMORY[0x24BDCD9F8]();
}

uint64_t sub_21EB02300()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_21EB0230C()
{
  return MEMORY[0x24BDCDB78]();
}

uint64_t sub_21EB02318()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_21EB02324()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_21EB02330()
{
  return MEMORY[0x24BDCE2D0]();
}

uint64_t sub_21EB0233C()
{
  return MEMORY[0x24BDCE330]();
}

uint64_t sub_21EB02348()
{
  return MEMORY[0x24BDCE5D8]();
}

uint64_t sub_21EB02354()
{
  return MEMORY[0x24BDCE5E8]();
}

uint64_t sub_21EB02360()
{
  return MEMORY[0x24BDCE878]();
}

uint64_t sub_21EB0236C()
{
  return MEMORY[0x24BDCE880]();
}

uint64_t sub_21EB02378()
{
  return MEMORY[0x24BDCE8F8]();
}

uint64_t sub_21EB02384()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_21EB02390()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_21EB0239C()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_21EB023A8()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_21EB023B4()
{
  return MEMORY[0x24BDCEAC8]();
}

uint64_t sub_21EB023C0()
{
  return MEMORY[0x24BDCECC0]();
}

uint64_t sub_21EB023CC()
{
  return MEMORY[0x24BDCECC8]();
}

uint64_t sub_21EB023D8()
{
  return MEMORY[0x24BDCECE0]();
}

uint64_t sub_21EB023E4()
{
  return MEMORY[0x24BDCED58]();
}

uint64_t sub_21EB023F0()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_21EB023FC()
{
  return MEMORY[0x24BDCF050]();
}

uint64_t sub_21EB02408()
{
  return MEMORY[0x24BDCF140]();
}

uint64_t sub_21EB02414()
{
  return MEMORY[0x24BDCF1B0]();
}

uint64_t sub_21EB02420()
{
  return MEMORY[0x24BDCF290]();
}

uint64_t sub_21EB0242C()
{
  return MEMORY[0x24BDCF2D8]();
}

uint64_t sub_21EB02438()
{
  return MEMORY[0x24BDCF678]();
}

uint64_t sub_21EB02444()
{
  return MEMORY[0x24BEE5118]();
}

uint64_t sub_21EB02450()
{
  return MEMORY[0x24BEE5120]();
}

uint64_t sub_21EB0245C()
{
  return MEMORY[0x24BEE5130]();
}

uint64_t sub_21EB02468()
{
  return MEMORY[0x24BEE6130]();
}

uint64_t sub_21EB02474()
{
  return MEMORY[0x24BEE6140]();
}

uint64_t sub_21EB02480()
{
  return MEMORY[0x24BEE6180]();
}

uint64_t sub_21EB0248C()
{
  return MEMORY[0x24BEE6190]();
}

uint64_t sub_21EB02498()
{
  return MEMORY[0x24BEE61A0]();
}

uint64_t sub_21EB024A4()
{
  return MEMORY[0x24BEE61C8]();
}

uint64_t sub_21EB024B0()
{
  return MEMORY[0x24BEE61D0]();
}

uint64_t sub_21EB024BC()
{
  return MEMORY[0x24BEE61E0]();
}

uint64_t sub_21EB024C8()
{
  return MEMORY[0x24BEE6200]();
}

uint64_t sub_21EB024D4()
{
  return MEMORY[0x24BEE6210]();
}

uint64_t sub_21EB024E0()
{
  return MEMORY[0x24BEE6238]();
}

uint64_t sub_21EB024EC()
{
  return MEMORY[0x24BEE6240]();
}

uint64_t sub_21EB024F8()
{
  return MEMORY[0x24BEE6260]();
}

uint64_t sub_21EB02504()
{
  return MEMORY[0x24BEE6270]();
}

uint64_t sub_21EB02510()
{
  return MEMORY[0x24BEE6298]();
}

uint64_t sub_21EB0251C()
{
  return MEMORY[0x24BEE62A8]();
}

uint64_t _s26DocumentManagerExecutables14FISentinelNodeC11contentType07UniformG11Identifiers6UTTypeVvg_0()
{
  return MEMORY[0x24BEE62D0]();
}

uint64_t sub_21EB02534()
{
  return MEMORY[0x24BEE62E8]();
}

uint64_t sub_21EB02540()
{
  return MEMORY[0x24BEE6300]();
}

uint64_t sub_21EB0254C()
{
  return MEMORY[0x24BEE6310]();
}

uint64_t sub_21EB02558()
{
  return MEMORY[0x24BEE6318]();
}

uint64_t sub_21EB02564()
{
  return MEMORY[0x24BEE6328]();
}

uint64_t sub_21EB02570()
{
  return MEMORY[0x24BEE6330]();
}

uint64_t sub_21EB0257C()
{
  return MEMORY[0x24BEE6338]();
}

uint64_t sub_21EB02588()
{
  return MEMORY[0x24BEE6340]();
}

uint64_t sub_21EB02594()
{
  return MEMORY[0x24BEE6348]();
}

uint64_t sub_21EB025A0()
{
  return MEMORY[0x24BEE6360]();
}

uint64_t sub_21EB025AC()
{
  return MEMORY[0x24BEE6368]();
}

uint64_t sub_21EB025B8()
{
  return MEMORY[0x24BEE6370]();
}

uint64_t sub_21EB025C4()
{
  return MEMORY[0x24BEE6390]();
}

uint64_t sub_21EB025D0()
{
  return MEMORY[0x24BEE6398]();
}

uint64_t sub_21EB025DC()
{
  return MEMORY[0x24BEE63B8]();
}

uint64_t sub_21EB025E8()
{
  return MEMORY[0x24BEE6410]();
}

uint64_t sub_21EB025F4()
{
  return MEMORY[0x24BEE76E8]();
}

uint64_t sub_21EB02600()
{
  return MEMORY[0x24BEE76F8]();
}

uint64_t sub_21EB0260C()
{
  return MEMORY[0x24BEE7748]();
}

uint64_t sub_21EB02618()
{
  return MEMORY[0x24BEE7758]();
}

uint64_t sub_21EB02624()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_21EB02630()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_21EB0263C()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_21EB02648()
{
  return MEMORY[0x24BEBC128]();
}

uint64_t sub_21EB02654()
{
  return MEMORY[0x24BEBC130]();
}

uint64_t sub_21EB02660()
{
  return MEMORY[0x24BEBC138]();
}

uint64_t sub_21EB0266C()
{
  return MEMORY[0x24BEBC140]();
}

uint64_t sub_21EB02678()
{
  return MEMORY[0x24BEBC148]();
}

uint64_t sub_21EB02684()
{
  return MEMORY[0x24BEBC150]();
}

uint64_t sub_21EB02690()
{
  return MEMORY[0x24BEBC200]();
}

uint64_t sub_21EB0269C()
{
  return MEMORY[0x24BEBC210]();
}

uint64_t sub_21EB026A8()
{
  return MEMORY[0x24BEBC228]();
}

uint64_t sub_21EB026B4()
{
  return MEMORY[0x24BEBC230]();
}

uint64_t sub_21EB026C0()
{
  return MEMORY[0x24BEBC238]();
}

uint64_t sub_21EB026CC()
{
  return MEMORY[0x24BEBC240]();
}

uint64_t sub_21EB026D8()
{
  return MEMORY[0x24BEBC3A0]();
}

uint64_t sub_21EB026E4()
{
  return MEMORY[0x24BEBC3C0]();
}

uint64_t sub_21EB026F0()
{
  return MEMORY[0x24BEBCB60]();
}

uint64_t sub_21EB026FC()
{
  return MEMORY[0x24BEBCB68]();
}

uint64_t sub_21EB02708()
{
  return MEMORY[0x24BEBCB70]();
}

uint64_t sub_21EB02714()
{
  return MEMORY[0x24BEE76B0]();
}

uint64_t sub_21EB02720()
{
  return MEMORY[0x24BDB9C48]();
}

uint64_t sub_21EB0272C()
{
  return MEMORY[0x24BDB9E98]();
}

uint64_t sub_21EB02738()
{
  return MEMORY[0x24BDB9EC8]();
}

uint64_t sub_21EB02744()
{
  return MEMORY[0x24BDB9ED0]();
}

uint64_t sub_21EB02750()
{
  return MEMORY[0x24BDB9EF0]();
}

uint64_t sub_21EB0275C()
{
  return MEMORY[0x24BDEAF80]();
}

uint64_t sub_21EB02768()
{
  return MEMORY[0x24BDEAFA8]();
}

uint64_t sub_21EB02774()
{
  return MEMORY[0x24BDEB740]();
}

uint64_t sub_21EB02780()
{
  return MEMORY[0x24BDEB828]();
}

uint64_t sub_21EB0278C()
{
  return MEMORY[0x24BDEC998]();
}

uint64_t sub_21EB02798()
{
  return MEMORY[0x24BDEC9A0]();
}

uint64_t sub_21EB027A4()
{
  return MEMORY[0x24BDEC9B0]();
}

uint64_t sub_21EB027B0()
{
  return MEMORY[0x24BDED330]();
}

uint64_t sub_21EB027BC()
{
  return MEMORY[0x24BDED3B0]();
}

uint64_t sub_21EB027C8()
{
  return MEMORY[0x24BDEE090]();
}

uint64_t sub_21EB027D4()
{
  return MEMORY[0x24BDEE098]();
}

uint64_t sub_21EB027E0()
{
  return MEMORY[0x24BDEE468]();
}

uint64_t sub_21EB027EC()
{
  return MEMORY[0x24BDEE478]();
}

uint64_t sub_21EB027F8()
{
  return MEMORY[0x24BDEE4C0]();
}

uint64_t sub_21EB02804()
{
  return MEMORY[0x24BDEE4D8]();
}

uint64_t sub_21EB02810()
{
  return MEMORY[0x24BDEE590]();
}

uint64_t sub_21EB0281C()
{
  return MEMORY[0x24BDEE598]();
}

uint64_t sub_21EB02828()
{
  return MEMORY[0x24BDEE608]();
}

uint64_t sub_21EB02834()
{
  return MEMORY[0x24BDEEA50]();
}

uint64_t sub_21EB02840()
{
  return MEMORY[0x24BDEF168]();
}

uint64_t sub_21EB0284C()
{
  return MEMORY[0x24BDEF1D0]();
}

uint64_t sub_21EB02858()
{
  return MEMORY[0x24BDEF6E8]();
}

uint64_t sub_21EB02864()
{
  return MEMORY[0x24BDEF6F0]();
}

uint64_t sub_21EB02870()
{
  return MEMORY[0x24BDEF740]();
}

uint64_t sub_21EB0287C()
{
  return MEMORY[0x24BDF14A8]();
}

uint64_t sub_21EB02888()
{
  return MEMORY[0x24BDF1700]();
}

uint64_t sub_21EB02894()
{
  return MEMORY[0x24BDF17F8]();
}

uint64_t sub_21EB028A0()
{
  return MEMORY[0x24BDF1960]();
}

uint64_t sub_21EB028AC()
{
  return MEMORY[0x24BDF1D18]();
}

uint64_t sub_21EB028B8()
{
  return MEMORY[0x24BDF1DC8]();
}

uint64_t sub_21EB028C4()
{
  return MEMORY[0x24BDF1FC0]();
}

uint64_t sub_21EB028D0()
{
  return MEMORY[0x24BDF1FF0]();
}

uint64_t sub_21EB028DC()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t sub_21EB028E8()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t sub_21EB028F4()
{
  return MEMORY[0x24BDF2138]();
}

uint64_t sub_21EB02900()
{
  return MEMORY[0x24BDF23E0]();
}

uint64_t sub_21EB0290C()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t sub_21EB02918()
{
  return MEMORY[0x24BDF28B8]();
}

uint64_t sub_21EB02924()
{
  return MEMORY[0x24BDF3020]();
}

uint64_t sub_21EB02930()
{
  return MEMORY[0x24BDF3178]();
}

uint64_t sub_21EB0293C()
{
  return MEMORY[0x24BDF3390]();
}

uint64_t sub_21EB02948()
{
  return MEMORY[0x24BDF3840]();
}

uint64_t sub_21EB02954()
{
  return MEMORY[0x24BDF3C78]();
}

uint64_t sub_21EB02960()
{
  return MEMORY[0x24BDF3EB0]();
}

uint64_t sub_21EB0296C()
{
  return MEMORY[0x24BDF4280]();
}

uint64_t sub_21EB02978()
{
  return MEMORY[0x24BDF4290]();
}

uint64_t sub_21EB02984()
{
  return MEMORY[0x24BDF4330]();
}

uint64_t sub_21EB02990()
{
  return MEMORY[0x24BDF4380]();
}

uint64_t sub_21EB0299C()
{
  return MEMORY[0x24BDF4518]();
}

uint64_t sub_21EB029A8()
{
  return MEMORY[0x24BDF46A8]();
}

uint64_t sub_21EB029B4()
{
  return MEMORY[0x24BDF47F8]();
}

uint64_t sub_21EB029C0()
{
  return MEMORY[0x24BDF49A0]();
}

uint64_t sub_21EB029CC()
{
  return MEMORY[0x24BDF4AA0]();
}

uint64_t sub_21EB029D8()
{
  return MEMORY[0x24BDF4AB8]();
}

uint64_t sub_21EB029E4()
{
  return MEMORY[0x24BDF4F18]();
}

uint64_t sub_21EB029F0()
{
  return MEMORY[0x24BDF53A0]();
}

uint64_t sub_21EB029FC()
{
  return MEMORY[0x24BEE5428]();
}

uint64_t sub_21EB02A08()
{
  return MEMORY[0x24BEE5438]();
}

uint64_t sub_21EB02A14()
{
  return MEMORY[0x24BEE5450]();
}

uint64_t sub_21EB02A20()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_21EB02A2C()
{
  return MEMORY[0x24BEE54B0]();
}

uint64_t sub_21EB02A38()
{
  return MEMORY[0x24BEE54C0]();
}

uint64_t sub_21EB02A44()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_21EB02A50()
{
  return MEMORY[0x24BEE54D0]();
}

uint64_t sub_21EB02A5C()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_21EB02A68()
{
  return MEMORY[0x24BEE5570]();
}

uint64_t sub_21EB02A74()
{
  return MEMORY[0x24BEE5590]();
}

uint64_t sub_21EB02A80()
{
  return MEMORY[0x24BEE5618]();
}

uint64_t sub_21EB02A8C()
{
  return MEMORY[0x24BEE5620]();
}

uint64_t sub_21EB02A98()
{
  return MEMORY[0x24BEE5628]();
}

uint64_t sub_21EB02AA4()
{
  return MEMORY[0x24BEE5648]();
}

uint64_t sub_21EB02AB0()
{
  return MEMORY[0x24BEE01A8]();
}

uint64_t sub_21EB02ABC()
{
  return MEMORY[0x24BEE01B8]();
}

uint64_t sub_21EB02AC8()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_21EB02AD4()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_21EB02AE0()
{
  return MEMORY[0x24BEE02B0]();
}

uint64_t sub_21EB02AEC()
{
  return MEMORY[0x24BEE03D0]();
}

uint64_t sub_21EB02AF8()
{
  return MEMORY[0x24BEE0460]();
}

uint64_t sub_21EB02B04()
{
  return MEMORY[0x24BEE04A8]();
}

uint64_t sub_21EB02B10()
{
  return MEMORY[0x24BEE04B0]();
}

uint64_t sub_21EB02B1C()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_21EB02B28()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_21EB02B34()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_21EB02B40()
{
  return MEMORY[0x24BDCF8D8]();
}

uint64_t sub_21EB02B4C()
{
  return MEMORY[0x24BDCF978]();
}

uint64_t sub_21EB02B58()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_21EB02B64()
{
  return MEMORY[0x24BDCF9F0]();
}

uint64_t sub_21EB02B70()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_21EB02B7C()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_21EB02B88()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_21EB02B94()
{
  return MEMORY[0x24BDCFA78]();
}

uint64_t sub_21EB02BA0()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_21EB02BAC()
{
  return MEMORY[0x24BEE0A08]();
}

uint64_t sub_21EB02BB8()
{
  return MEMORY[0x24BEE0A30]();
}

uint64_t sub_21EB02BC4()
{
  return MEMORY[0x24BEE0A50]();
}

uint64_t sub_21EB02BD0()
{
  return MEMORY[0x24BEE0A58]();
}

uint64_t sub_21EB02BDC()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_21EB02BE8()
{
  return MEMORY[0x24BEE0B68]();
}

uint64_t sub_21EB02BF4()
{
  return MEMORY[0x24BEE0B80]();
}

uint64_t sub_21EB02C00()
{
  return MEMORY[0x24BEE0BB0]();
}

uint64_t sub_21EB02C0C()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_21EB02C18()
{
  return MEMORY[0x24BEE0BD0]();
}

uint64_t _s26DocumentManagerExecutables29DOCAssociatedObjectStorageKeyV11descriptionSSvg_0()
{
  return MEMORY[0x24BEE0BE8]();
}

uint64_t sub_21EB02C30()
{
  return MEMORY[0x24BEE0C00]();
}

uint64_t sub_21EB02C3C()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_21EB02C48()
{
  return MEMORY[0x24BEE0C90]();
}

uint64_t sub_21EB02C54()
{
  return MEMORY[0x24BEE0CC8]();
}

uint64_t sub_21EB02C60()
{
  return MEMORY[0x24BEE0D98]();
}

uint64_t sub_21EB02C6C()
{
  return MEMORY[0x24BEE0DD0]();
}

uint64_t sub_21EB02C78()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_21EB02C84()
{
  return MEMORY[0x24BEE0DE8]();
}

uint64_t sub_21EB02C90()
{
  return MEMORY[0x24BEE0E48]();
}

uint64_t sub_21EB02C9C()
{
  return MEMORY[0x24BEE0E98]();
}

uint64_t sub_21EB02CA8()
{
  return MEMORY[0x24BEE0EB0]();
}

uint64_t sub_21EB02CB4()
{
  return MEMORY[0x24BEE0EB8]();
}

uint64_t sub_21EB02CC0()
{
  return MEMORY[0x24BEE0EE8]();
}

uint64_t sub_21EB02CCC()
{
  return MEMORY[0x24BEE0F30]();
}

uint64_t sub_21EB02CD8()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_21EB02CE4()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_21EB02CF0()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_21EB02CFC()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_21EB02D08()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_21EB02D14()
{
  return MEMORY[0x24BEE1140]();
}

uint64_t sub_21EB02D20()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_21EB02D2C()
{
  return MEMORY[0x24BEE1178]();
}

uint64_t sub_21EB02D38()
{
  return MEMORY[0x24BEE1180]();
}

uint64_t sub_21EB02D44()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_21EB02D50()
{
  return MEMORY[0x24BEE11A0]();
}

uint64_t sub_21EB02D5C()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_21EB02D68()
{
  return MEMORY[0x24BEE11C8]();
}

uint64_t sub_21EB02D74()
{
  return MEMORY[0x24BEE11F8]();
}

uint64_t sub_21EB02D80()
{
  return MEMORY[0x24BEE1208]();
}

uint64_t sub_21EB02D8C()
{
  return MEMORY[0x24BEE1220]();
}

uint64_t sub_21EB02D98()
{
  return MEMORY[0x24BEE1250]();
}

uint64_t sub_21EB02DA4()
{
  return MEMORY[0x24BEE1308]();
}

uint64_t sub_21EB02DB0()
{
  return MEMORY[0x24BDCFC08]();
}

uint64_t sub_21EB02DBC()
{
  return MEMORY[0x24BEE6820]();
}

uint64_t sub_21EB02DC8()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t sub_21EB02DD4()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_21EB02DE0()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_21EB02DEC()
{
  return MEMORY[0x24BEE1370]();
}

uint64_t sub_21EB02DF8()
{
  return MEMORY[0x24BEE1380]();
}

uint64_t sub_21EB02E04()
{
  return MEMORY[0x24BEE13A8]();
}

uint64_t sub_21EB02E10()
{
  return MEMORY[0x24BDCFCC0]();
}

uint64_t sub_21EB02E1C()
{
  return MEMORY[0x24BDCFCE8]();
}

uint64_t sub_21EB02E28()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_21EB02E34()
{
  return MEMORY[0x24BEE1678]();
}

uint64_t sub_21EB02E40()
{
  return MEMORY[0x24BDCFD28]();
}

uint64_t sub_21EB02E4C()
{
  return MEMORY[0x24BEE17F8]();
}

uint64_t sub_21EB02E58()
{
  return MEMORY[0x24BEE18A0]();
}

uint64_t sub_21EB02E64()
{
  return MEMORY[0x24BEE18D0]();
}

uint64_t sub_21EB02E70()
{
  return MEMORY[0x24BEE18E8]();
}

uint64_t sub_21EB02E7C()
{
  return MEMORY[0x24BEE1918]();
}

uint64_t sub_21EB02E88()
{
  return MEMORY[0x24BEE1938]();
}

uint64_t sub_21EB02E94()
{
  return MEMORY[0x24BEE19A0]();
}

uint64_t sub_21EB02EA0()
{
  return MEMORY[0x24BEE1A28]();
}

uint64_t sub_21EB02EAC()
{
  return MEMORY[0x24BEE1A78]();
}

uint64_t sub_21EB02EB8()
{
  return MEMORY[0x24BEE1A80]();
}

uint64_t sub_21EB02EC4()
{
  return MEMORY[0x24BEBCBB0]();
}

uint64_t sub_21EB02ED0()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_21EB02EDC()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_21EB02EE8()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_21EB02EF4()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_21EB02F00()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_21EB02F0C()
{
  return MEMORY[0x24BEE5650]();
}

uint64_t sub_21EB02F18()
{
  return MEMORY[0x24BEE5658]();
}

uint64_t sub_21EB02F24()
{
  return MEMORY[0x24BEE5678]();
}

uint64_t sub_21EB02F30()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_21EB02F3C()
{
  return MEMORY[0x24BEE56B8]();
}

uint64_t sub_21EB02F48()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_21EB02F54()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_21EB02F60()
{
  return MEMORY[0x24BEE5778]();
}

uint64_t sub_21EB02F6C()
{
  return MEMORY[0x24BEE5780]();
}

uint64_t sub_21EB02F78()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_21EB02F84()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_21EB02F90()
{
  return MEMORY[0x24BEE57B0]();
}

uint64_t sub_21EB02F9C()
{
  return MEMORY[0x24BDE9758]();
}

uint64_t sub_21EB02FA8()
{
  return MEMORY[0x24BEBCCF0]();
}

uint64_t sub_21EB02FB4()
{
  return MEMORY[0x24BEBCCF8]();
}

uint64_t sub_21EB02FC0()
{
  return MEMORY[0x24BEBCD00]();
}

uint64_t sub_21EB02FCC()
{
  return MEMORY[0x24BEE5890]();
}

uint64_t sub_21EB02FD8()
{
  return MEMORY[0x24BEE58B8]();
}

uint64_t sub_21EB02FE4()
{
  return MEMORY[0x24BEE58D0]();
}

uint64_t sub_21EB02FF0()
{
  return MEMORY[0x24BEE58D8]();
}

uint64_t sub_21EB02FFC()
{
  return MEMORY[0x24BEE7940]();
}

uint64_t sub_21EB03008()
{
  return MEMORY[0x24BEE7948]();
}

uint64_t sub_21EB03014()
{
  return MEMORY[0x24BEE7958]();
}

uint64_t sub_21EB03020()
{
  return MEMORY[0x24BEE5918]();
}

uint64_t sub_21EB0302C()
{
  return MEMORY[0x24BEE5920]();
}

uint64_t sub_21EB03038()
{
  return MEMORY[0x24BEE5928]();
}

uint64_t sub_21EB03044()
{
  return MEMORY[0x24BEBCD48]();
}

uint64_t sub_21EB03050()
{
  return MEMORY[0x24BEBCD50]();
}

uint64_t sub_21EB0305C()
{
  return MEMORY[0x24BEE5970]();
}

uint64_t sub_21EB03068()
{
  return MEMORY[0x24BEE5980]();
}

uint64_t sub_21EB03074()
{
  return MEMORY[0x24BEE5998]();
}

uint64_t sub_21EB03080()
{
  return MEMORY[0x24BEE5BB8]();
}

uint64_t sub_21EB0308C()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_21EB03098()
{
  return MEMORY[0x24BEE5BD0]();
}

uint64_t sub_21EB030A4()
{
  return MEMORY[0x24BEBD210]();
}

uint64_t sub_21EB030B0()
{
  return MEMORY[0x24BEBD218]();
}

uint64_t sub_21EB030BC()
{
  return MEMORY[0x24BEE7978]();
}

uint64_t sub_21EB030C8()
{
  return MEMORY[0x24BEE7980]();
}

uint64_t sub_21EB030D4()
{
  return MEMORY[0x24BEE7988]();
}

uint64_t sub_21EB030E0()
{
  return MEMORY[0x24BEE7998]();
}

uint64_t sub_21EB030EC()
{
  return MEMORY[0x24BEE79A0]();
}

uint64_t sub_21EB030F8()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_21EB03104()
{
  return MEMORY[0x24BEE1D60]();
}

uint64_t sub_21EB03110()
{
  return MEMORY[0x24BEE1DA8]();
}

uint64_t sub_21EB0311C()
{
  return MEMORY[0x24BEE1E50]();
}

uint64_t sub_21EB03128()
{
  return MEMORY[0x24BEE1E70]();
}

uint64_t sub_21EB03134()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_21EB03140()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_21EB0314C()
{
  return MEMORY[0x24BDD04C8]();
}

uint64_t sub_21EB03158()
{
  return MEMORY[0x24BDD0518]();
}

uint64_t sub_21EB03164()
{
  return MEMORY[0x24BDD0530]();
}

uint64_t sub_21EB03170()
{
  return MEMORY[0x24BDD0548]();
}

uint64_t sub_21EB0317C()
{
  return MEMORY[0x24BDD0568]();
}

uint64_t sub_21EB03188()
{
  return MEMORY[0x24BDD05C8]();
}

uint64_t sub_21EB03194()
{
  return MEMORY[0x24BDD05D8]();
}

uint64_t sub_21EB031A0()
{
  return MEMORY[0x24BDD0600]();
}

uint64_t sub_21EB031AC()
{
  return MEMORY[0x24BDD0628]();
}

uint64_t sub_21EB031B8()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_21EB031C4()
{
  return MEMORY[0x24BEE20E8]();
}

uint64_t sub_21EB031D0()
{
  return MEMORY[0x24BEE22B0]();
}

uint64_t sub_21EB031DC()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_21EB031E8()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_21EB031F4()
{
  return MEMORY[0x24BEE22E0]();
}

uint64_t sub_21EB03200()
{
  return MEMORY[0x24BEE22F8]();
}

uint64_t sub_21EB0320C()
{
  return MEMORY[0x24BEE2300]();
}

uint64_t sub_21EB03218()
{
  return MEMORY[0x24BEE2318]();
}

uint64_t sub_21EB03224()
{
  return MEMORY[0x24BEE2320]();
}

uint64_t sub_21EB03230()
{
  return MEMORY[0x24BEE2328]();
}

uint64_t sub_21EB0323C()
{
  return MEMORY[0x24BEE2330]();
}

uint64_t sub_21EB03248()
{
  return MEMORY[0x24BEE2340]();
}

uint64_t sub_21EB03254()
{
  return MEMORY[0x24BEE2348]();
}

uint64_t sub_21EB03260()
{
  return MEMORY[0x24BEE2350]();
}

uint64_t sub_21EB0326C()
{
  return MEMORY[0x24BEE2358]();
}

uint64_t sub_21EB03278()
{
  return MEMORY[0x24BEE2360]();
}

uint64_t sub_21EB03284()
{
  return MEMORY[0x24BEE2368]();
}

uint64_t sub_21EB03290()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_21EB0329C()
{
  return MEMORY[0x24BEE23A8]();
}

uint64_t sub_21EB032A8()
{
  return MEMORY[0x24BEE23E8]();
}

uint64_t sub_21EB032B4()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_21EB032C0()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_21EB032CC()
{
  return MEMORY[0x24BEE24C8]();
}

uint64_t sub_21EB032D8()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_21EB032E4()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_21EB032F0()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_21EB032FC()
{
  return MEMORY[0x24BEE2648]();
}

uint64_t sub_21EB03308()
{
  return MEMORY[0x24BEE2650]();
}

uint64_t sub_21EB03314()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_21EB03320()
{
  return MEMORY[0x24BEE2660]();
}

uint64_t sub_21EB0332C()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_21EB03338()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_21EB03344()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_21EB03350()
{
  return MEMORY[0x24BEE2950]();
}

uint64_t sub_21EB0335C()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_21EB03368()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_21EB03374()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_21EB03380()
{
  return MEMORY[0x24BEE29C0]();
}

uint64_t sub_21EB0338C()
{
  return MEMORY[0x24BEE2A00]();
}

uint64_t sub_21EB03398()
{
  return MEMORY[0x24BEE2A08]();
}

uint64_t sub_21EB033A4()
{
  return MEMORY[0x24BEE2BD8]();
}

uint64_t sub_21EB033B0()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_21EB033BC()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_21EB033C8()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_21EB033D4()
{
  return MEMORY[0x24BEE2F58]();
}

uint64_t sub_21EB033E0()
{
  return MEMORY[0x24BEE2F68]();
}

uint64_t sub_21EB033EC()
{
  return MEMORY[0x24BEE2F90]();
}

uint64_t sub_21EB033F8()
{
  return MEMORY[0x24BEE2F98]();
}

uint64_t sub_21EB03404()
{
  return MEMORY[0x24BEE2FA0]();
}

uint64_t sub_21EB03410()
{
  return MEMORY[0x24BEE2FB0]();
}

uint64_t sub_21EB0341C()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_21EB03428()
{
  return MEMORY[0x24BEE3070]();
}

uint64_t sub_21EB03434()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_21EB03440()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_21EB0344C()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_21EB03458()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_21EB03464()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_21EB03470()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_21EB0347C()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_21EB03488()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_21EB03494()
{
  return MEMORY[0x24BEE38F0]();
}

uint64_t sub_21EB034A0()
{
  return MEMORY[0x24BEE3930]();
}

uint64_t sub_21EB034AC()
{
  return MEMORY[0x24BEE39E0]();
}

uint64_t sub_21EB034B8()
{
  return MEMORY[0x24BEE3A20]();
}

uint64_t sub_21EB034C4()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_21EB034D0()
{
  return MEMORY[0x24BEE3B90]();
}

uint64_t sub_21EB034DC()
{
  return MEMORY[0x24BEE3B98]();
}

uint64_t sub_21EB034E8()
{
  return MEMORY[0x24BEE70E0]();
}

uint64_t sub_21EB034F4()
{
  return MEMORY[0x24BEE3D98]();
}

uint64_t sub_21EB03500()
{
  return MEMORY[0x24BEE3DD8]();
}

uint64_t sub_21EB0350C()
{
  return MEMORY[0x24BEE3DE0]();
}

uint64_t sub_21EB03518()
{
  return MEMORY[0x24BEE3EC0]();
}

uint64_t sub_21EB03524()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_21EB03530()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_21EB0353C()
{
  return MEMORY[0x24BDD06E0]();
}

uint64_t sub_21EB03548()
{
  return MEMORY[0x24BDD06F0]();
}

uint64_t sub_21EB03554()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_21EB03560()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_21EB0356C()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_21EB03578()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_21EB03584()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_21EB03590()
{
  return MEMORY[0x24BDD0750]();
}

uint64_t sub_21EB0359C()
{
  return MEMORY[0x24BEE42D8]();
}

uint64_t sub_21EB035A8()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_21EB035B4()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_21EB035C0()
{
  return MEMORY[0x24BEE4300]();
}

uint64_t sub_21EB035CC()
{
  return MEMORY[0x24BEE4310]();
}

uint64_t sub_21EB035D8()
{
  return MEMORY[0x24BEE4318]();
}

uint64_t sub_21EB035E4()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_21EB035F0()
{
  return MEMORY[0x24BEE4A98]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x24BE1A1C8]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  CFTimeInterval result;

  MEMORY[0x24BDE5410]();
  return result;
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x24BDBBE38](theDict, key, value);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x24BDBC130](number, theType, valuePtr);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x24BDBC2C8](rl, source, mode);
}

CFRunLoopMode CFRunLoopCopyCurrentMode(CFRunLoopRef rl)
{
  return (CFRunLoopMode)MEMORY[0x24BDBC2F0](rl);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x24BDBC2F8]();
}

void CFRunLoopRun(void)
{
  MEMORY[0x24BDBC358]();
}

void CFRunLoopSourceInvalidate(CFRunLoopSourceRef source)
{
  MEMORY[0x24BDBC378](source);
}

void CFRunLoopStop(CFRunLoopRef rl)
{
  MEMORY[0x24BDBC388](rl);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x24BDBC4D0](theString1, theString2, compareOptions);
}

SInt32 CFUserNotificationCancel(CFUserNotificationRef userNotification)
{
  return MEMORY[0x24BDBC918](userNotification);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x24BDBC920](allocator, flags, error, dictionary, timeout);
}

CFRunLoopSourceRef CFUserNotificationCreateRunLoopSource(CFAllocatorRef allocator, CFUserNotificationRef userNotification, CFUserNotificationCallBack callout, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x24BDBC928](allocator, userNotification, callout, order);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8E0](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD908](retstr, t, tx, ty);
}

CGFloat CGColorGetAlpha(CGColorRef color)
{
  CGFloat result;

  MEMORY[0x24BDBDAE8](color);
  return result;
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
  MEMORY[0x24BDBDCE0](c, path);
}

void CGContextClipToMask(CGContextRef c, CGRect rect, CGImageRef mask)
{
  MEMORY[0x24BDBDD30](c, mask, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextConcatCTM(CGContextRef c, CGAffineTransform *transform)
{
  MEMORY[0x24BDBDD50](c, transform);
}

void CGContextFillPath(CGContextRef c)
{
  MEMORY[0x24BDBDE68](c);
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x24BDBDE70](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

uint64_t CGContextGetBlendMode()
{
  return MEMORY[0x24BDBDE90]();
}

void CGContextRestoreGState(CGContextRef c)
{
  MEMORY[0x24BDBDF58](c);
}

void CGContextSaveGState(CGContextRef c)
{
  MEMORY[0x24BDBDF70](c);
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
  MEMORY[0x24BDBDF78](c, sx, sy);
}

void CGContextSetBlendMode(CGContextRef c, CGBlendMode mode)
{
  MEMORY[0x24BDBDFB0](c, *(_QWORD *)&mode);
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x24BDBDFD8](c, color);
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
  MEMORY[0x24BDBE038](c, width);
}

void CGContextSetStrokeColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x24BDBE0D0](c, color);
}

void CGContextStrokePath(CGContextRef c)
{
  MEMORY[0x24BDBE118](c);
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
  MEMORY[0x24BDBE130](c, tx, ty);
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x24BDBEFC0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBEFE0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFE8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF000]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF008]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF010]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF018]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x24BDBF030]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectIntegral(CGRect rect)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x24BDBF038]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x24BDBF050]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x24BDBF060]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

uint64_t DOCAssertWithIntenalBuildAlert()
{
  return MEMORY[0x24BE2DD20]();
}

uint64_t DOCCenterSizeInRect()
{
  return MEMORY[0x24BE2DD28]();
}

uint64_t DOCConstraintWithPriority()
{
  return MEMORY[0x24BE2DFF8]();
}

uint64_t DOCConstraintsToResizeWithSuperview()
{
  return MEMORY[0x24BE2E000]();
}

uint64_t DOCConstraintsToResizeWithSuperviewSafeArea()
{
  return MEMORY[0x24BE2E008]();
}

uint64_t DOCConstraintsWithPriority()
{
  return MEMORY[0x24BE2E010]();
}

uint64_t DOCCreateDefaultHomeScreenWidgetIntent()
{
  return MEMORY[0x24BE2E018]();
}

uint64_t DOCDeviceIsPad()
{
  return MEMORY[0x24BE2DE00]();
}

uint64_t DOCInitLogging()
{
  return MEMORY[0x24BE2DE58]();
}

uint64_t DOCIsInternalBuild()
{
  return MEMORY[0x24BE2DD48]();
}

uint64_t DOCLocalizedDisplayName()
{
  return MEMORY[0x24BE2DE68]();
}

uint64_t DOCPresentAlertForError()
{
  return MEMORY[0x24BE2DD50]();
}

uint64_t DOCPresentAlertForErrorWithForceHandler()
{
  return MEMORY[0x24BE2DD58]();
}

uint64_t DOCProviderDomainIDIsExternalDevice()
{
  return MEMORY[0x24BE2DE80]();
}

uint64_t DOCProviderDomainIDIsRemovable()
{
  return MEMORY[0x24BE2DE88]();
}

uint64_t DOCProviderDomainIDIsSharedServerDomainID()
{
  return MEMORY[0x24BE2DE90]();
}

uint64_t DOCProviderDomainIsSharedServerDomain()
{
  return MEMORY[0x24BE2DE98]();
}

uint64_t DOCRunInMainThread()
{
  return MEMORY[0x24BE2DEA0]();
}

uint64_t DOCTagsFromFPTags()
{
  return MEMORY[0x24BE2DEC0]();
}

uint64_t DOCUsePadIdiomForTraits()
{
  return MEMORY[0x24BE2DD68]();
}

uint64_t DOCUsePhoneIdiomForTraits()
{
  return MEMORY[0x24BE2DD70]();
}

uint64_t FPCrossDeviceItemIDForItemID()
{
  return MEMORY[0x24BDC7DB8]();
}

uint64_t FPExtendBookmarkForDocumentURL()
{
  return MEMORY[0x24BDC8060]();
}

uint64_t FPIsCloudDocsWithFPFSEnabled()
{
  return MEMORY[0x24BDC80E0]();
}

uint64_t FPTagFromDOCTag()
{
  return MEMORY[0x24BE2DEC8]();
}

uint64_t FPTagsFromDOCTags()
{
  return MEMORY[0x24BE2DED0]();
}

uint64_t MobileGestalt_get_current_device()
{
  return MEMORY[0x24BED8580]();
}

uint64_t MobileGestalt_get_deviceClassNumber()
{
  return MEMORY[0x24BED8588]();
}

uint64_t MobileGestalt_get_oysterCapability()
{
  return MEMORY[0x24BED8648]();
}

uint64_t MobileGestalt_get_pearlIDCapability()
{
  return MEMORY[0x24BED8660]();
}

uint64_t MobileGestalt_get_touchIDCapability()
{
  return MEMORY[0x24BED8678]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

BOOL UIAccessibilityIsBoldTextEnabled(void)
{
  return MEMORY[0x24BEBDE10]();
}

BOOL UIAccessibilityIsInvertColorsEnabled(void)
{
  return MEMORY[0x24BEBDE30]();
}

BOOL UIAccessibilityShouldDifferentiateWithoutColor(void)
{
  return MEMORY[0x24BEBDED0]();
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
  MEMORY[0x24BEBE280](opaque, (__n128)size, *(__n128 *)&size.height, scale);
}

void UIGraphicsEndImageContext(void)
{
  MEMORY[0x24BEBE298]();
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x24BEBE2A8]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x24BEBE2B0]();
}

void UIGraphicsPopContext(void)
{
  MEMORY[0x24BEBE2B8]();
}

void UIGraphicsPushContext(CGContextRef context)
{
  MEMORY[0x24BEBE2C0](context);
}

uint64_t UIRectIntegralWithScale()
{
  return MEMORY[0x24BEBE6B8]();
}

uint64_t UIRoundToScale()
{
  return MEMORY[0x24BEBE6D0]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

uint64_t _DocumentManagerBundle()
{
  return MEMORY[0x24BE2DF48]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_isClassOrObjCExistentialType()
{
  return MEMORY[0x24BEE4B28]();
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

BOOL class_addMethod(Class cls, SEL name, IMP imp, const char *types)
{
  return MEMORY[0x24BEDCE40](cls, name, imp, types);
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x24BEDCEA0](cls, name);
}

IMP class_replaceMethod(Class cls, SEL name, IMP imp, const char *types)
{
  return (IMP)MEMORY[0x24BEDCEE8](cls, name, imp, types);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x24BDADDD0](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x24BDADDD8](group);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

void dispatch_suspend(dispatch_object_t object)
{
  MEMORY[0x24BDADFE0](object);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAE3F0](__x, __y);
  return result;
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x24BDAE6D0]();
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

void method_exchangeImplementations(Method m1, Method m2)
{
  MEMORY[0x24BEDCF28](m1, m2);
}

IMP method_getImplementation(Method m)
{
  return (IMP)MEMORY[0x24BEDCF30](m);
}

const char *__cdecl method_getTypeEncoding(Method m)
{
  return (const char *)MEMORY[0x24BEDCF50](m);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x24BEDD080](object, key);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x24BEDD3C0](object, key, value, policy);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
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

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x24BDAFE38](*(_QWORD *)&a1);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x24BDAFF10](__s1);
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

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x24BEE4C18]();
}

uint64_t swift_deletedMethodError()
{
  return MEMORY[0x24BEE4C28]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x24BEE4C40]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x24BEE4C60]();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return MEMORY[0x24BEE4C68]();
}

uint64_t swift_dynamicCastUnknownClass()
{
  return MEMORY[0x24BEE4C88]();
}

uint64_t swift_dynamicCastUnknownClassUnconditional()
{
  return MEMORY[0x24BEE4C90]();
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

uint64_t swift_getKeyPath()
{
  return MEMORY[0x24BEE4D88]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x24BEE4D98]();
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

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x24BEE4DF8]();
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

uint64_t swift_readAtKeyPath()
{
  return MEMORY[0x24BEE4ED8]();
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

uint64_t swift_setAtWritableKeyPath()
{
  return MEMORY[0x24BEE4F28]();
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

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x24BEE4F48]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x24BEE4F58]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4F60]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x24BEE7228]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x24BEE7238]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x24BEE7278]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x24BEE4F68]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x24BEE5028]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x24BEE5030]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x24BEE5038]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x24BDB00F8](a1, *(_QWORD *)&a2, a3, a4, a5, a6);
}

