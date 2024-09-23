id sub_22D8CAFF4()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IdentityButton.Coordinator();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for IdentityButton.Coordinator()
{
  return objc_opt_self();
}

void type metadata accessor for Style(uint64_t a1)
{
  sub_22D8CB794(a1, &qword_255D9FD60);
}

void type metadata accessor for Label(uint64_t a1)
{
  sub_22D8CB794(a1, &qword_255D9FD68);
}

void type metadata accessor for PKPaymentButtonStyle(uint64_t a1)
{
  sub_22D8CB794(a1, &qword_255D9FD70);
}

void type metadata accessor for PKPaymentButtonType(uint64_t a1)
{
  sub_22D8CB794(a1, &qword_255D9FD78);
}

void type metadata accessor for PKPayLaterDisplayStyle(uint64_t a1)
{
  sub_22D8CB794(a1, &qword_255D9FD80);
}

void type metadata accessor for PKPayLaterAction(uint64_t a1)
{
  sub_22D8CB794(a1, &qword_255D9FD88);
}

__n128 __swift_memcpy20_4(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u32[0] = a2[1].n128_u32[0];
  *a1 = result;
  return result;
}

uint64_t sub_22D8CB0E8(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 20))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_22D8CB108(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_DWORD *)(result + 16) = 0;
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
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
  *(_BYTE *)(result + 20) = v3;
  return result;
}

void type metadata accessor for Decimal(uint64_t a1)
{
  sub_22D8CB794(a1, &qword_255D9FD90);
}

void type metadata accessor for PKAddShareablePassConfigurationPrimaryAction(uint64_t a1)
{
  sub_22D8CB794(a1, &qword_255D9FD98);
}

uint64_t initializeBufferWithCopyOfBuffer for IdentityButton(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for IdentityButton()
{
  return swift_release();
}

uint64_t initializeWithCopy for IdentityButton(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v3 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v3;
  swift_retain();
  return a1;
}

_QWORD *assignWithCopy for IdentityButton(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  *a1 = *a2;
  a1[1] = a2[1];
  v3 = a2[3];
  a1[2] = a2[2];
  a1[3] = v3;
  swift_retain();
  swift_release();
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

_OWORD *assignWithTake for IdentityButton(_OWORD *a1, _OWORD *a2)
{
  __int128 v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for IdentityButton(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 32))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for IdentityButton(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 16) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for IdentityButton()
{
  return &type metadata for IdentityButton;
}

unint64_t sub_22D8CB2E8()
{
  unint64_t result;

  result = qword_255D9FDA0;
  if (!qword_255D9FDA0)
  {
    result = MEMORY[0x22E31B14C](&unk_22D8E7BAC, &type metadata for IdentityButton);
    atomic_store(result, (unint64_t *)&qword_255D9FDA0);
  }
  return result;
}

id sub_22D8CB32C()
{
  _QWORD *v0;
  id v1;
  void *v3;

  v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE6FA90]), sel_initWithLabel_style_, *v0, v0[1]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255D9FDD8);
  sub_22D8E6E3C();
  objc_msgSend(v1, sel_addTarget_action_forControlEvents_, v3, sel_callback, 0x2000);

  return v1;
}

id sub_22D8CB3D0@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  objc_class *v5;
  char *v6;
  char *v7;
  id result;
  objc_super v9;

  v4 = *(_QWORD *)(v1 + 16);
  v3 = *(_QWORD *)(v1 + 24);
  v5 = (objc_class *)type metadata accessor for IdentityButton.Coordinator();
  v6 = (char *)objc_allocWithZone(v5);
  v7 = &v6[OBJC_IVAR____TtCV16_PassKit_SwiftUI14IdentityButton11Coordinator_action];
  *(_QWORD *)v7 = v4;
  *((_QWORD *)v7 + 1) = v3;
  v9.receiver = v6;
  v9.super_class = v5;
  swift_retain();
  result = objc_msgSendSuper2(&v9, sel_init);
  *a1 = result;
  return result;
}

uint64_t sub_22D8CB444()
{
  return sub_22D8E6DA0();
}

unint64_t sub_22D8CB484(uint64_t a1)
{
  unint64_t result;

  result = sub_22D8CB4A8();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_22D8CB4A8()
{
  unint64_t result;

  result = qword_255D9FDD0;
  if (!qword_255D9FDD0)
  {
    result = MEMORY[0x22E31B14C](&unk_22D8E7A80, &type metadata for IdentityButton);
    atomic_store(result, (unint64_t *)&qword_255D9FDD0);
  }
  return result;
}

uint64_t sub_22D8CB4EC()
{
  sub_22D8CB4A8();
  return sub_22D8E6E00();
}

uint64_t sub_22D8CB53C()
{
  sub_22D8CB4A8();
  return sub_22D8E6DAC();
}

uint64_t sub_22D8CB58C()
{
  return sub_22D8E6EE4();
}

void sub_22D8CB5A4()
{
  sub_22D8CB4A8();
  sub_22D8E6DF4();
  __break(1u);
}

uint64_t sub_22D8CB5C8(uint64_t a1, uint64_t a2)
{
  return sub_22D8CB944(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF9E0]);
}

uint64_t sub_22D8CB5D4(uint64_t a1, id *a2)
{
  uint64_t result;

  result = sub_22D8E7028();
  *a2 = 0;
  return result;
}

uint64_t sub_22D8CB648(uint64_t a1, id *a2)
{
  char v3;

  v3 = sub_22D8E7034();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_22D8CB6C4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  sub_22D8E7040();
  v2 = sub_22D8E701C();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

_QWORD *sub_22D8CB704@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_22D8CB714(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t sub_22D8CB720()
{
  return MEMORY[0x24BDF5560];
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x22E31B134]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

void type metadata accessor for PKAddPassButtonStyle(uint64_t a1)
{
  sub_22D8CB794(a1, &qword_255D9FDE0);
}

void type metadata accessor for PKPaymentNetwork(uint64_t a1)
{
  sub_22D8CB794(a1, &qword_255D9FDE8);
}

void sub_22D8CB794(uint64_t a1, unint64_t *a2)
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

uint64_t sub_22D8CB7D8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_22D8E701C();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_22D8CB81C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_22D8E7040();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_22D8CB844()
{
  sub_22D8CB8F8(&qword_255D9FE08, (uint64_t)&unk_22D8E7D00);
  sub_22D8CB8F8((unint64_t *)&unk_255D9FE10, (uint64_t)"Ɏ\a\",?");
  return sub_22D8E719C();
}

uint64_t sub_22D8CB8B0()
{
  return sub_22D8CB8F8(&qword_255D9FDF0, (uint64_t)&unk_22D8E7C64);
}

uint64_t sub_22D8CB8D4()
{
  return sub_22D8CB8F8(&qword_255D9FDF8, (uint64_t)&unk_22D8E7C38);
}

uint64_t sub_22D8CB8F8(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    type metadata accessor for PKPaymentNetwork(255);
    result = MEMORY[0x22E31B14C](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_22D8CB938(uint64_t a1, uint64_t a2)
{
  return sub_22D8CB944(a1, a2, MEMORY[0x24BEE0CD8]);
}

uint64_t sub_22D8CB944(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_22D8E7040();
  v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_22D8CB980()
{
  sub_22D8E7040();
  sub_22D8E704C();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22D8CB9C0()
{
  uint64_t v0;

  sub_22D8E7040();
  sub_22D8E71CC();
  sub_22D8E704C();
  v0 = sub_22D8E71E4();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_22D8CBA30()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = sub_22D8E7040();
  v2 = v1;
  if (v0 == sub_22D8E7040() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_22D8E71A8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_22D8CBAB8()
{
  return sub_22D8CB8F8(&qword_255D9FE00, (uint64_t)&unk_22D8E7CD4);
}

void sub_22D8CBAE4()
{
  id v0;
  void *v1;
  id v2;

  sub_22D8E7040();
  v0 = objc_allocWithZone(MEMORY[0x24BDD1540]);
  v1 = (void *)sub_22D8E701C();
  swift_bridgeObjectRelease();
  v2 = objc_msgSend(v0, sel_initWithDomain_code_userInfo_, v1, 0, 0);

  qword_255DA2860 = (uint64_t)v2;
}

uint64_t AddPassToWalletButton.init(carKeyPassword:supportedRadioTechnologies:issuerIdentifier:onCompletion:fallback:)@<X0>(uint64_t a1@<X2>, uint64_t a2@<X4>, uint64_t a3@<X5>, uint64_t a4@<X6>, void (*a5)(uint64_t)@<X7>, _OWORD *a6@<X8>, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v12;
  uint64_t v13;
  char *v14;
  _QWORD v16[2];
  uint64_t v17;
  uint64_t v18;

  v17 = a3;
  v18 = a4;
  v16[1] = a2;
  sub_22D8E7124();
  v12 = MEMORY[0x24BDAC7A8]();
  v14 = (char *)v16 - v13;
  a5(v12);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(a8 - 8) + 56))(v14, 0, 1, a8);
  return sub_22D8CBC5C(a1, (uint64_t)v14, v17, v18, a6, a8, a9);
}

uint64_t sub_22D8CBC5C@<X0>(uint64_t a1@<X2>, uint64_t a2@<X5>, uint64_t a3@<X6>, uint64_t a4@<X7>, _OWORD *a5@<X8>, uint64_t a6, uint64_t a7)
{
  id v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;

  v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE6E988]), sel_init);
  v12 = (void *)sub_22D8E701C();
  swift_bridgeObjectRelease();
  objc_msgSend(v11, sel_setPassword_, v12);

  objc_msgSend(v11, sel_setSupportedRadioTechnologies_, a1);
  v13 = v11;
  v14 = (void *)sub_22D8E701C();
  swift_bridgeObjectRelease();
  objc_msgSend(v13, sel_setIssuerIdentifier_, v14);

  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = a3;
  *(_QWORD *)(v15 + 24) = a4;
  *(_QWORD *)&v18 = v13;
  *((_QWORD *)&v18 + 1) = sub_22D8CCBD0;
  v20 = 0;
  v21 = 0;
  v19 = v15;
  v22 = 2;
  return sub_22D8CFBF8(&v18, a2, a6, a7, a5);
}

uint64_t AddPassToWalletButton.init(_:onCompletion:fallback:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void (*a4)(uint64_t)@<X3>, uint64_t a5@<X5>, uint64_t a6@<X6>, _OWORD *a7@<X8>)
{
  uint64_t v14;
  uint64_t v15;
  char *v16;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;

  sub_22D8E7124();
  v14 = MEMORY[0x24BDAC7A8]();
  v16 = (char *)&v18 - v15;
  a4(v14);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(a5 - 8) + 56))(v16, 0, 1, a5);
  *(_QWORD *)&v18 = a1;
  *((_QWORD *)&v18 + 1) = a2;
  v20 = 0;
  v21 = 0;
  v19 = a3;
  v22 = 2;
  return sub_22D8CFBF8(&v18, (uint64_t)v16, a5, a6, a7);
}

{
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;

  v14 = sub_22D8E7124();
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v19 - v15;
  *(_QWORD *)&v19 = a1;
  *((_QWORD *)&v19 + 1) = a2;
  v21 = 0;
  v22 = 0;
  v20 = a3;
  v23 = 1;
  v17 = swift_retain();
  a4(v17);
  swift_release();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(a5 - 8) + 56))(v16, 0, 1, a5);
  return sub_22D8CFBF8(&v19, (uint64_t)v16, a5, a6, a7);
}

void sub_22D8CBE94(id a1, char a2, void (*a3)(id, uint64_t))
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  id v9;

  if ((a2 & 1) != 0)
  {
    v8 = a1;
    a3(a1, 1);
    sub_22D8CC958(a1, 1);
    return;
  }
  if ((unint64_t)a1 >> 62)
  {
    swift_bridgeObjectRetain();
    if (sub_22D8E7190())
      goto LABEL_4;
  }
  else
  {
    v5 = *(_QWORD *)(((unint64_t)a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v5)
    {
LABEL_4:
      if (((unint64_t)a1 & 0xC000000000000001) != 0)
      {
        v6 = (id)MEMORY[0x22E31ACC0](0, a1);
        goto LABEL_7;
      }
      if (*(_QWORD *)(((unint64_t)a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        v6 = *((id *)a1 + 4);
LABEL_7:
        v7 = v6;
        sub_22D8CC958(a1, 0);
        v9 = v7;
        a3(v7, 0);

        return;
      }
      __break(1u);
      goto LABEL_14;
    }
  }
  sub_22D8CC958(a1, 0);
  if (qword_255D9FD00 != -1)
LABEL_14:
    swift_once();
  a3((id)qword_255DA2860, 1);
}

uint64_t AddPassToWalletButton<>.init(carKeyPassword:supportedRadioTechnologies:issuerIdentifier:onCompletion:)@<X0>(uint64_t a1@<X2>, uint64_t a2@<X5>, uint64_t a3@<X6>, uint64_t a4@<X8>)
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t result;

  v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE6E988]), sel_init);
  v9 = (void *)sub_22D8E701C();
  swift_bridgeObjectRelease();
  objc_msgSend(v8, sel_setPassword_, v9);

  objc_msgSend(v8, sel_setSupportedRadioTechnologies_, a1);
  v10 = v8;
  v11 = (void *)sub_22D8E701C();
  swift_bridgeObjectRelease();
  objc_msgSend(v10, sel_setIssuerIdentifier_, v11);

  result = swift_allocObject();
  *(_QWORD *)(result + 16) = a2;
  *(_QWORD *)(result + 24) = a3;
  *(_QWORD *)a4 = v10;
  *(_QWORD *)(a4 + 8) = sub_22D8CC148;
  *(_QWORD *)(a4 + 24) = 0;
  *(_QWORD *)(a4 + 32) = 0;
  *(_QWORD *)(a4 + 16) = result;
  *(_WORD *)(a4 + 40) = 258;
  return result;
}

uint64_t sub_22D8CC124()
{
  swift_release();
  return swift_deallocObject();
}

void sub_22D8CC148(void *a1, char a2)
{
  uint64_t v2;

  sub_22D8CBE94(a1, a2 & 1, *(void (**)(id, uint64_t))(v2 + 16));
}

uint64_t AddPassToWalletButton<>.init(_:onCompletion:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  *(_QWORD *)a4 = result;
  *(_QWORD *)(a4 + 8) = a2;
  *(_QWORD *)(a4 + 24) = 0;
  *(_QWORD *)(a4 + 32) = 0;
  *(_QWORD *)(a4 + 16) = a3;
  *(_WORD *)(a4 + 40) = 258;
  return result;
}

{
  *(_QWORD *)a4 = result;
  *(_QWORD *)(a4 + 8) = a2;
  *(_QWORD *)(a4 + 24) = 0;
  *(_QWORD *)(a4 + 32) = 0;
  *(_QWORD *)(a4 + 16) = a3;
  *(_WORD *)(a4 + 40) = 257;
  return result;
}

id sub_22D8CC16C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  objc_class *v17;
  char *v18;
  uint64_t (**v19)(uint64_t, char, uint64_t, uint64_t);
  id v20;
  id v21;
  id v22;
  _QWORD v24[6];
  objc_super v25;

  v8 = *(_QWORD *)(a4 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  MEMORY[0x24BDAC7A8](a1);
  v10 = (char *)v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v12, v11);
  v13 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v14 = (v9 + v13 + 7) & 0xFFFFFFFFFFFFFFF8;
  v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = *(_OWORD *)(a4 + 16);
  (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v15 + v13, v10, a4);
  v16 = (_QWORD *)(v15 + v14);
  *v16 = a2;
  v16[1] = a3;
  v17 = (objc_class *)type metadata accessor for AddSecureElementPassViewControllerWrapper.Coordinator();
  v18 = (char *)objc_allocWithZone(v17);
  v19 = (uint64_t (**)(uint64_t, char, uint64_t, uint64_t))&v18[OBJC_IVAR____TtCV16_PassKit_SwiftUIP33_541E15F1A3504E1B411D8ADFDBE1A4E241AddSecureElementPassViewControllerWrapper11Coordinator_completion];
  *v19 = sub_22D8CC634;
  v19[1] = (uint64_t (*)(uint64_t, char, uint64_t, uint64_t))v15;
  swift_retain_n();
  v20 = a1;
  swift_retain();
  sub_22D8CC6BC(0);
  v25.receiver = v18;
  v25.super_class = v17;
  v21 = objc_msgSendSuper2(&v25, sel_init);
  swift_release();
  v22 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE6FA80]), sel_initWithConfiguration_delegate_, v20, v21);
  if (v22)
  {
    v24[1] = v20;
    v24[2] = sub_22D8CC634;
    v24[3] = v15;
    v24[4] = v22;
    v24[5] = v21;
    sub_22D8CC6CC();
    return (id)sub_22D8E6FC8();
  }
  else
  {

    swift_release();
    if (qword_255D9FD00 != -1)
      swift_once();
    return (id)qword_255DA2860;
  }
}

id sub_22D8CC41C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AddSecureElementPassViewControllerWrapper.Coordinator();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for AddSecureElementPassViewControllerWrapper.Coordinator()
{
  return objc_opt_self();
}

uint64_t sub_22D8CC484(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5 = *(_QWORD *)(v4 + 16);
  v6 = type metadata accessor for AddPassToWalletButton_iOS(0, v5, *(_QWORD *)(v4 + 24), a4);
  v7 = v4
     + ((*(unsigned __int8 *)(*(_QWORD *)(v6 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v6 - 8) + 80));
  sub_22D8CC5B0(*(void **)v7, *(_QWORD *)(v7 + 8), *(_QWORD *)(v7 + 16), *(_QWORD *)(v7 + 24), *(_QWORD *)(v7 + 32), *(_BYTE *)(v7 + 40));
  v8 = v7 + *(int *)(v6 + 36);
  v9 = *(_QWORD *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v8, 1, v5))
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v5);
  sub_22D8CC628(*(_QWORD *)(v7 + *(int *)(v6 + 40)), *(_BYTE *)(v7 + *(int *)(v6 + 40) + 8));
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

void *sub_22D8CC5B0(void *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  switch(a6)
  {
    case 0:
      goto LABEL_5;
    case 1:
      swift_bridgeObjectRelease();
      goto LABEL_5;
    case 2:

      goto LABEL_5;
    case 3:

      swift_release();
LABEL_5:
      result = (void *)swift_release();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_22D8CC628(uint64_t a1, char a2)
{
  uint64_t result;

  if ((a2 & 1) == 0)
    return swift_release();
  return result;
}

uint64_t sub_22D8CC634(uint64_t a1, char a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);

  v6 = a2 & 1;
  v7 = type metadata accessor for AddPassToWalletButton_iOS(0, *(_QWORD *)(v4 + 16), *(_QWORD *)(v4 + 24), a4);
  v8 = *(uint64_t (**)(uint64_t, uint64_t))(v4
                                                  + ((*(_QWORD *)(*(_QWORD *)(v7 - 8) + 64)
                                                    + ((*(unsigned __int8 *)(*(_QWORD *)(v7 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v7 - 8) + 80))
                                                    + 7) & 0xFFFFFFFFFFFFFFF8));
  sub_22D8CCC94();
  return v8(a1, v6);
}

uint64_t sub_22D8CC6BC(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

unint64_t sub_22D8CC6CC()
{
  unint64_t result;

  result = qword_255D9FEB0;
  if (!qword_255D9FEB0)
  {
    result = MEMORY[0x22E31B14C](&unk_22D8E7EB4, &type metadata for AddSecureElementPassViewControllerWrapper);
    atomic_store(result, (unint64_t *)&qword_255D9FEB0);
  }
  return result;
}

id sub_22D8CC710()
{
  uint64_t v0;

  return *(id *)(v0 + 24);
}

id sub_22D8CC720@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  void *v2;

  v2 = *(void **)(v1 + 32);
  *a1 = v2;
  return v2;
}

uint64_t sub_22D8CC72C()
{
  return sub_22D8E6E60();
}

uint64_t sub_22D8CC764()
{
  sub_22D8CCB88();
  return sub_22D8E6E9C();
}

uint64_t sub_22D8CC7B4()
{
  sub_22D8CCB88();
  return sub_22D8E6E6C();
}

void sub_22D8CC804()
{
  sub_22D8CCB88();
  sub_22D8E6E90();
  __break(1u);
}

uint64_t sub_22D8CC828(void *a1, void *a2)
{
  uint64_t v2;
  uint64_t *v3;
  void (*v4)(id, uint64_t);
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;

  v3 = (uint64_t *)(v2
                 + OBJC_IVAR____TtCV16_PassKit_SwiftUIP33_541E15F1A3504E1B411D8ADFDBE1A4E241AddSecureElementPassViewControllerWrapper11Coordinator_completion);
  v4 = *(void (**)(id, uint64_t))(v2
                                          + OBJC_IVAR____TtCV16_PassKit_SwiftUIP33_541E15F1A3504E1B411D8ADFDBE1A4E241AddSecureElementPassViewControllerWrapper11Coordinator_completion);
  if (v4)
  {
    if (a1)
    {
      swift_retain();
      v4(a1, 0);
      sub_22D8CC6BC((uint64_t)v4);
    }
    else
    {
      if (a2)
      {
        swift_retain();
        v7 = a2;
      }
      else
      {
        v8 = qword_255D9FD00;
        swift_retain();
        if (v8 != -1)
          swift_once();
        v7 = (id)qword_255DA2860;
      }
      v9 = a2;
      v4(v7, 1);
      sub_22D8CC6BC((uint64_t)v4);

    }
  }
  v10 = *v3;
  *v3 = 0;
  v3[1] = 0;
  return sub_22D8CC6BC(v10);
}

unint64_t sub_22D8CC91C()
{
  unint64_t result;

  result = qword_255D9FEB8;
  if (!qword_255D9FEB8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_255D9FEB8);
  }
  return result;
}

void sub_22D8CC958(id a1, char a2)
{
  if ((a2 & 1) != 0)

  else
    swift_bridgeObjectRelease();
}

void destroy for AddSecureElementPassViewControllerWrapper(id *a1)
{

  swift_release();
}

uint64_t initializeWithCopy for AddSecureElementPassViewControllerWrapper(uint64_t a1, __int128 *a2)
{
  __int128 v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;

  v3 = *a2;
  *(_OWORD *)a1 = *a2;
  v4 = (void *)*((_QWORD *)a2 + 3);
  *(_QWORD *)(a1 + 16) = *((_QWORD *)a2 + 2);
  *(_QWORD *)(a1 + 24) = v4;
  v5 = (void *)*((_QWORD *)a2 + 4);
  *(_QWORD *)(a1 + 32) = v5;
  v6 = (id)v3;
  swift_retain();
  v7 = v4;
  v8 = v5;
  return a1;
}

uint64_t assignWithCopy for AddSecureElementPassViewControllerWrapper(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  v7 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v7;
  swift_retain();
  swift_release();
  v8 = *(void **)(a2 + 24);
  v9 = *(void **)(a1 + 24);
  *(_QWORD *)(a1 + 24) = v8;
  v10 = v8;

  v11 = *(void **)(a2 + 32);
  v12 = *(void **)(a1 + 32);
  *(_QWORD *)(a1 + 32) = v11;
  v13 = v11;

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

uint64_t assignWithTake for AddSecureElementPassViewControllerWrapper(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  v4 = *(void **)(a1 + 24);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);

  v5 = *(void **)(a1 + 32);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);

  return a1;
}

uint64_t getEnumTagSinglePayload for AddSecureElementPassViewControllerWrapper(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for AddSecureElementPassViewControllerWrapper(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for AddSecureElementPassViewControllerWrapper()
{
  return &type metadata for AddSecureElementPassViewControllerWrapper;
}

unint64_t sub_22D8CCB88()
{
  unint64_t result;

  result = qword_255D9FEC0;
  if (!qword_255D9FEC0)
  {
    result = MEMORY[0x22E31B14C](&unk_22D8E7E3C, &type metadata for AddSecureElementPassViewControllerWrapper);
    atomic_store(result, (unint64_t *)&qword_255D9FEC0);
  }
  return result;
}

uint64_t sub_22D8CCBD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;

  type metadata accessor for PayWithApplePayButton.Configuration(255, *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), a4);
  sub_22D8E6F74();
  sub_22D8E6F50();
  return v5;
}

uint64_t sub_22D8CCC40()
{
  unsigned __int8 v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255DA0058);
  sub_22D8E6F50();
  return v1;
}

uint64_t sub_22D8CCC94()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DA0058);
  return sub_22D8E6F5C();
}

uint64_t sub_22D8CCCEC@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char v6;

  v4 = v2 + *(int *)(a1 + 48);
  v5 = *(_QWORD *)v4;
  v6 = *(_BYTE *)(v4 + 8);
  sub_22D8CE69C(*(_QWORD *)v4, v6);
  sub_22D8DE6F8(v5, v6, a2);
  return sub_22D8CC628(v5, v6);
}

uint64_t sub_22D8CCD44(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;

  v2 = v1 + *(int *)(a1 + 52);
  v3 = *(_QWORD *)v2;
  v4 = *(_BYTE *)(v2 + 8);
  sub_22D8CE6A8(*(_QWORD *)v2, v4);
  v5 = sub_22D8DE724(v3, v4);
  sub_22D8CE014(v3, v4);
  return v5;
}

uint64_t sub_22D8CCDA0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;

  v2 = v1 + *(int *)(a1 + 56);
  v3 = *(_QWORD *)v2;
  v4 = *(_BYTE *)(v2 + 8);
  sub_22D8CE6A8(*(_QWORD *)v2, v4);
  v5 = sub_22D8DE730(v3, v4);
  sub_22D8CE014(v3, v4);
  return v5;
}

uint64_t sub_22D8CCDFC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;

  v2 = v1 + *(int *)(a1 + 60);
  v3 = *(_QWORD *)v2;
  v4 = *(_BYTE *)(v2 + 8);
  sub_22D8CE6A8(*(_QWORD *)v2, v4);
  v5 = sub_22D8DE8E8(v3, v4);
  sub_22D8CE014(v3, v4);
  return v5;
}

uint64_t sub_22D8CCE58(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;

  v2 = v1 + *(int *)(a1 + 64);
  v3 = *(_QWORD *)v2;
  v4 = *(_BYTE *)(v2 + 8);
  sub_22D8CE6A8(*(_QWORD *)v2, v4);
  v5 = sub_22D8DE8F4(v3, v4);
  sub_22D8CE014(v3, v4);
  return v5;
}

uint64_t PayWithApplePayButton.init(_:action:fallback:)@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void (*a4)(uint64_t)@<X3>, uint64_t a5@<X5>, uint64_t a6@<X6>, _QWORD *a7@<X8>)
{
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;

  sub_22D8E7124();
  MEMORY[0x24BDAC7A8]();
  v15 = (char *)&v18 - v14;
  v19 = *a1;
  v16 = swift_retain();
  a4(v16);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(a5 - 8) + 56))(v15, 0, 1, a5);
  sub_22D8CD108(&v19, a2, a3, 0, (uint64_t)v15, a5, a6, a7);
  return swift_release();
}

id sub_22D8CCFA8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, char a5@<W4>, uint64_t a6@<X8>)
{
  uint64_t KeyPath;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id result;
  char v18;
  uint64_t v19;

  sub_22D8E6F44();
  KeyPath = swift_getKeyPath();
  v10 = swift_getKeyPath();
  v11 = swift_getKeyPath();
  v12 = swift_getKeyPath();
  v13 = swift_getKeyPath();
  result = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDB00]), sel_init);
  *(_QWORD *)a6 = a1;
  *(_BYTE *)(a6 + 8) = a5 & 1;
  *(_QWORD *)(a6 + 16) = a2;
  *(_QWORD *)(a6 + 24) = a3;
  *(_BYTE *)(a6 + 32) = a4 & 1;
  *(_QWORD *)(a6 + 40) = 0;
  *(_BYTE *)(a6 + 48) = v18;
  *(_QWORD *)(a6 + 56) = v19;
  *(_QWORD *)(a6 + 64) = KeyPath;
  *(_BYTE *)(a6 + 72) = 0;
  *(_QWORD *)(a6 + 80) = v10;
  *(_BYTE *)(a6 + 88) = 0;
  *(_QWORD *)(a6 + 96) = v11;
  *(_BYTE *)(a6 + 104) = 0;
  *(_QWORD *)(a6 + 112) = v12;
  *(_BYTE *)(a6 + 120) = 0;
  *(_QWORD *)(a6 + 128) = v13;
  *(_BYTE *)(a6 + 136) = 0;
  *(_QWORD *)(a6 + 144) = result;
  return result;
}

uint64_t sub_22D8CD108@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, _QWORD *a8@<X8>)
{
  uint64_t v14;
  int *v15;
  char *v16;
  uint64_t v17;
  char *v18;
  char *v19;
  char *v20;
  char *v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  char *v30;
  id v31;
  uint64_t result;
  char v33;
  _QWORD v34[2];
  char v35;
  __int128 v36;
  char v37;
  uint64_t v38;

  v33 = a4;
  v14 = *a1;
  v15 = (int *)type metadata accessor for PayWithApplePayButton(0, a6, a7, a4);
  v16 = (char *)a8 + v15[11];
  LOBYTE(v34[0]) = 1;
  sub_22D8E6F44();
  v17 = *((_QWORD *)&v36 + 1);
  *v16 = v36;
  *((_QWORD *)v16 + 1) = v17;
  v18 = (char *)a8 + v15[12];
  *(_QWORD *)v18 = swift_getKeyPath();
  v18[8] = 0;
  v19 = (char *)a8 + v15[13];
  *(_QWORD *)v19 = swift_getKeyPath();
  v19[8] = 0;
  v20 = (char *)a8 + v15[14];
  *(_QWORD *)v20 = swift_getKeyPath();
  v20[8] = 0;
  v21 = (char *)a8 + v15[15];
  *(_QWORD *)v21 = swift_getKeyPath();
  v21[8] = 0;
  v22 = (char *)a8 + v15[16];
  *(_QWORD *)v22 = swift_getKeyPath();
  v22[8] = 0;
  *a8 = v14;
  v23 = (char *)a8 + v15[9];
  v24 = sub_22D8E7124();
  v25 = *(_QWORD *)(v24 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v25 + 16))(v23, a5, v24);
  v34[0] = a2;
  v34[1] = a3;
  v35 = v33 & 1;
  v27 = type metadata accessor for PayWithApplePayButton.Configuration(0, a6, a7, v26);
  *(_QWORD *)((char *)&v36 + *(int *)(sub_22D8E6F74() + 28)) = 0;
  (*(void (**)(__int128 *, _QWORD *, uint64_t))(*(_QWORD *)(v27 - 8) + 32))(&v36, v34, v27);
  v28 = v37;
  v29 = v38;
  v30 = (char *)a8 + v15[10];
  *(_OWORD *)v30 = v36;
  v30[16] = v28;
  *((_QWORD *)v30 + 3) = v29;
  v31 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDB00]), sel_init);
  result = (*(uint64_t (**)(uint64_t, uint64_t))(v25 + 8))(a5, v24);
  *(_QWORD *)((char *)a8 + v15[17]) = v31;
  return result;
}

uint64_t PayWithApplePayButton.body.getter@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
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
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  unint64_t v26;
  uint64_t v27;
  char *v28;
  void (*v29)(char *, char *, uint64_t);
  void (*v30)(char *, uint64_t);
  uint64_t v32;
  char *v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD v47[3];

  v43 = a2;
  v3 = sub_22D8E70C4();
  v41 = *(_QWORD *)(v3 - 8);
  v42 = v3;
  v4 = MEMORY[0x24BDAC7A8](v3);
  v40 = (char *)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 - 8) + 64);
  v38 = *(_QWORD *)(a1 - 8);
  v39 = v6;
  MEMORY[0x24BDAC7A8](v4);
  v35 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255D9FF30);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255D9FF38);
  v32 = *(_QWORD *)(a1 + 16);
  v8 = v32;
  sub_22D8E7124();
  sub_22D8E6E30();
  swift_getTupleTypeMetadata2();
  v9 = sub_22D8E6FE0();
  MEMORY[0x22E31B14C](MEMORY[0x24BDF5428], v9);
  v10 = sub_22D8E6FBC();
  v37 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v32 - v11;
  sub_22D8E6CEC();
  v13 = sub_22D8E6D10();
  v34 = *(_QWORD *)(v13 - 8);
  v14 = MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v32 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v33 = (char *)&v32 - v17;
  v18 = *(_QWORD *)(a1 + 24);
  v44 = v8;
  v45 = v18;
  v19 = v36;
  v46 = v36;
  sub_22D8E6FD4();
  sub_22D8E6FB0();
  v20 = v38;
  v21 = v35;
  (*(void (**)(char *, uint64_t, uint64_t))(v38 + 16))(v35, v19, a1);
  v22 = (*(unsigned __int8 *)(v20 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80);
  v23 = swift_allocObject();
  *(_QWORD *)(v23 + 16) = v32;
  *(_QWORD *)(v23 + 24) = v18;
  (*(void (**)(unint64_t, char *, uint64_t))(v20 + 32))(v23 + v22, v21, a1);
  v24 = MEMORY[0x22E31B14C](MEMORY[0x24BDF4750], v10);
  v25 = v40;
  sub_22D8E70AC();
  sub_22D8E6EFC();
  swift_release();
  (*(void (**)(char *, uint64_t))(v41 + 8))(v25, v42);
  (*(void (**)(char *, uint64_t))(v37 + 8))(v12, v10);
  v26 = sub_22D8CE204();
  v47[0] = v24;
  v47[1] = v26;
  MEMORY[0x22E31B14C](MEMORY[0x24BDED308], v13, v47);
  v28 = v33;
  v27 = v34;
  v29 = *(void (**)(char *, char *, uint64_t))(v34 + 16);
  v29(v33, v16, v13);
  v30 = *(void (**)(char *, uint64_t))(v27 + 8);
  v30(v16, v13);
  v29(v43, v28, v13);
  return ((uint64_t (*)(char *, uint64_t))v30)(v28, v13);
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x22E31B140](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

void sub_22D8CD6A4(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(char *, uint64_t, uint64_t);
  void (*v24)(char *, uint64_t);
  void *v25;
  uint64_t v26;
  id v27;
  unint64_t v28;
  uint64_t v29;
  void (*v30)(char *, uint64_t);
  uint64_t v31;
  uint64_t v32;
  int v33;
  uint64_t v34;
  int v35;
  void *v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD v43[2];
  _QWORD v44[3];
  _QWORD v45[2];
  id v46[2];
  uint64_t v47;
  uint64_t v48;
  char v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52[2];
  _QWORD v53[2];
  unsigned __int8 v54;
  uint64_t v55;
  unsigned __int8 v56;
  uint64_t v57;
  uint64_t v58;

  v40 = a4;
  v7 = sub_22D8E7124();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v11 = (char *)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v31 - v12;
  v37 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255D9FF38);
  v14 = sub_22D8E6E30();
  v39 = *(_QWORD *)(v14 - 8);
  v15 = MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v31 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v31 - v18;
  v41 = a3;
  v21 = type metadata accessor for PayWithApplePayButton(0, a2, a3, v20);
  v38 = *(id *)(a1 + *(int *)(v21 + 68));
  sub_22D8E6FD4();
  sub_22D8E6CE0();
  v36 = (void *)v53[1];
  v35 = v54;
  v34 = v55;
  v33 = v56;
  v32 = v57;
  v31 = v58;
  if ((sub_22D8CCC40() & 1) != 0)
  {
    sub_22D8CDABC(v21, (uint64_t)v46);
    sub_22D8CF8A8();
    v42 = v41;
    MEMORY[0x22E31B14C](MEMORY[0x24BDF5578], v7, &v42);
    sub_22D8CFC68((uint64_t)v46, v37);
    sub_22D8CFA00();
  }
  else
  {
    v22 = a1 + *(int *)(v21 + 36);
    v53[0] = v41;
    MEMORY[0x22E31B14C](MEMORY[0x24BDF5578], v7, v53);
    v23 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
    v23(v13, v22, v7);
    v23(v11, (uint64_t)v13, v7);
    sub_22D8CF8A8();
    sub_22D8CFD2C((uint64_t)v11, v37, v7);
    v24 = *(void (**)(char *, uint64_t))(v8 + 8);
    v24(v11, v7);
    v24(v13, v7);
  }
  v25 = v38;
  v46[0] = v38;
  v46[1] = v36;
  LOBYTE(v47) = v35;
  v48 = v34;
  v49 = v33;
  v50 = v32;
  v51 = v31;
  v52[0] = (uint64_t)v46;
  v26 = v39;
  (*(void (**)(char *, char *, uint64_t))(v39 + 16))(v17, v19, v14);
  v52[1] = (uint64_t)v17;
  v27 = v25;
  v45[0] = __swift_instantiateConcreteTypeFromMangledName(&qword_255D9FF30);
  v45[1] = v14;
  v44[1] = sub_22D8CF950();
  v28 = sub_22D8CF8A8();
  v44[0] = v41;
  v29 = MEMORY[0x22E31B14C](MEMORY[0x24BDF5578], v7, v44);
  v43[0] = v28;
  v43[1] = v29;
  v44[2] = MEMORY[0x22E31B14C](MEMORY[0x24BDEF3E0], v14, v43);
  sub_22D8CDC3C(v52, 2uLL, (uint64_t)v45);
  v30 = *(void (**)(char *, uint64_t))(v26 + 8);
  v30(v19, v14);

  v30(v17, v14);
}

void sub_22D8CDAB0(uint64_t a1@<X8>)
{
  uint64_t *v1;

  sub_22D8CD6A4(v1[4], v1[2], v1[3], a1);
}

double sub_22D8CDABC@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  double result;
  __int128 v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v26;
  char v27;
  _OWORD v28[2];
  char v29;

  v5 = *(_QWORD *)(a1 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  v7 = MEMORY[0x24BDAC7A8]();
  v12 = sub_22D8CCBD4(v7, v8, v9, v10);
  v13 = *v2;
  if ((v14 & 1) != 0)
  {
    sub_22D8CCCEC(a1, v28);
    v16 = *(_QWORD *)&v28[0];
    (*(void (**)(char *, uint64_t *, uint64_t))(v5 + 16))((char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v2, a1);
    v17 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
    v18 = swift_allocObject();
    *(_OWORD *)(v18 + 16) = *(_OWORD *)(a1 + 16);
    (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v18 + v17, (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
    *(_QWORD *)(v18 + ((v6 + v17 + 7) & 0xFFFFFFFFFFFFFFF8)) = v12;
    v23 = v13;
    v24 = v16;
    v25 = sub_22D8CFB64;
    v26 = v18;
    v27 = 1;
  }
  else
  {
    v15 = v11;
    sub_22D8CCCEC(a1, &v24);
    v23 = v13;
    v25 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v12;
    v26 = v15;
    v27 = 0;
  }
  sub_22D8CF90C();
  sub_22D8E6E24();
  result = *(double *)v28;
  v20 = v28[1];
  v21 = v29;
  *(_OWORD *)a2 = v28[0];
  *(_OWORD *)(a2 + 16) = v20;
  *(_BYTE *)(a2 + 32) = v21;
  return result;
}

uint64_t sub_22D8CDC24@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 16))(a3, a1);
}

uint64_t sub_22D8CDC3C(uint64_t *a1, unint64_t a2, uint64_t a3)
{
  uint64_t *v5;
  uint64_t TupleTypeMetadata;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  unint64_t v11;
  __int128 *v12;
  _OWORD *v13;
  unint64_t v14;
  __int128 v15;
  unint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;

  v5 = (uint64_t *)(a3 & 0xFFFFFFFFFFFFFFFELL);
  if (a2 == 1)
  {
    TupleTypeMetadata = *v5;
    MEMORY[0x24BDAC7A8]();
    v8 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
LABEL_12:
    v22 = 32;
    v23 = a2;
    do
    {
      if (a2 == 1)
        v24 = 0;
      else
        v24 = *(_DWORD *)(TupleTypeMetadata + v22);
      v26 = *v5++;
      v25 = v26;
      v27 = *a1++;
      (*(void (**)(char *, uint64_t))(*(_QWORD *)(v25 - 8) + 16))(&v8[v24], v27);
      v22 += 16;
      --v23;
    }
    while (v23);
    return sub_22D8E6FEC();
  }
  MEMORY[0x24BDAC7A8]();
  v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    v11 = 0;
    if (a2 < 4)
      goto LABEL_9;
    if ((unint64_t)(v10 - (char *)v5) < 0x20)
      goto LABEL_9;
    v11 = a2 & 0xFFFFFFFFFFFFFFFCLL;
    v12 = (__int128 *)(v5 + 2);
    v13 = v10 + 16;
    v14 = a2 & 0xFFFFFFFFFFFFFFFCLL;
    do
    {
      v15 = *v12;
      *(v13 - 1) = *(v12 - 1);
      *v13 = v15;
      v12 += 2;
      v13 += 2;
      v14 -= 4;
    }
    while (v14);
    if (v11 != a2)
    {
LABEL_9:
      v16 = a2 - v11;
      v17 = v11;
      v18 = &v10[8 * v11];
      v19 = &v5[v17];
      do
      {
        v20 = *v19++;
        *(_QWORD *)v18 = v20;
        v18 += 8;
        --v16;
      }
      while (v16);
    }
  }
  TupleTypeMetadata = swift_getTupleTypeMetadata();
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v29 - v21;
  if (a2)
    goto LABEL_12;
  return sub_22D8E6FEC();
}

uint64_t sub_22D8CDDF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  sub_22D8E70A0();
  v3[5] = sub_22D8E7094();
  sub_22D8E7088();
  return swift_task_switch();
}

uint64_t sub_22D8CDE60()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)(v0 + 32);
  v2 = *(_QWORD *)(v0 + 24);
  swift_release();
  v4 = type metadata accessor for PayWithApplePayButton(0, v2, v1, v3);
  sub_22D8CE0E8(v4);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_22D8CDEB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  int *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v5 = *(_QWORD *)(v4 + 16);
  v6 = (int *)type metadata accessor for PayWithApplePayButton(0, v5, *(_QWORD *)(v4 + 24), a4);
  v7 = *(unsigned __int8 *)(*((_QWORD *)v6 - 1) + 80);
  v8 = v4 + ((v7 + 32) & ~v7);
  v9 = v8 + v6[9];
  v10 = *(_QWORD *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v9, 1, v5))
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v5);
  sub_22D8CE004(*(void **)(v8 + v6[10]), *(_QWORD *)(v8 + v6[10] + 8), *(_BYTE *)(v8 + v6[10] + 16));
  swift_release();
  swift_release();
  sub_22D8CC628(*(_QWORD *)(v8 + v6[12]), *(_BYTE *)(v8 + v6[12] + 8));
  sub_22D8CE014(*(_QWORD *)(v8 + v6[13]), *(_BYTE *)(v8 + v6[13] + 8));
  sub_22D8CE014(*(_QWORD *)(v8 + v6[14]), *(_BYTE *)(v8 + v6[14] + 8));
  sub_22D8CE014(*(_QWORD *)(v8 + v6[15]), *(_BYTE *)(v8 + v6[15] + 8));
  sub_22D8CE014(*(_QWORD *)(v8 + v6[16]), *(_BYTE *)(v8 + v6[16] + 8));

  return swift_deallocObject();
}

uint64_t type metadata accessor for PayWithApplePayButton(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for PayWithApplePayButton);
}

void sub_22D8CE004(void *a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)

  else
    swift_release();
}

uint64_t sub_22D8CE014(uint64_t a1, char a2)
{
  if ((a2 & 1) != 0)
    return swift_bridgeObjectRelease();
  else
    return swift_release();
}

uint64_t sub_22D8CE020(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  v6 = *(_QWORD *)(v4 + 16);
  v7 = *(_QWORD *)(v4 + 24);
  v8 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for PayWithApplePayButton(0, v6, v7, a4) - 8) + 80);
  v9 = v4 + ((v8 + 32) & ~v8);
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v10;
  *v10 = v5;
  v10[1] = sub_22D8CE0A0;
  return sub_22D8CDDF0(v9, v6, v7);
}

uint64_t sub_22D8CE0A0()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_22D8CE0E8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  char v15;
  uint64_t v17;

  v3 = *(_QWORD *)(a1 + 16);
  v4 = sub_22D8E7124();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v17 - v6;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)&v17 - v6, v1 + *(int *)(a1 + 36), v4);
  LODWORD(v3) = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 48))(v7, 1, v3);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  if ((_DWORD)v3 != 1)
  {
    v11 = (void *)sub_22D8CCBD4(a1, v8, v9, v10);
    v13 = v12;
    v15 = v14;
    if ((v14 & 1) != 0)
      sub_22D8D8258();
    sub_22D8CE004(v11, v13, v15 & 1);
  }
  return sub_22D8CCC94();
}

unint64_t sub_22D8CE204()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255D9FF50[0];
  if (!qword_255D9FF50[0])
  {
    v1 = sub_22D8E6CEC();
    result = MEMORY[0x22E31B14C](MEMORY[0x24BDEC4C8], v1);
    atomic_store(result, qword_255D9FF50);
  }
  return result;
}

void sub_22D8CE24C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;

  v5 = type metadata accessor for PayWithApplePayButton(0, a3, a4, a4);
  sub_22D8CF798(a2, v5);
  sub_22D8D7FD0();
}

double PayWithApplePayButton<>.init(_:action:)@<D0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  __int128 v5;
  __int128 v6;
  __int128 v7;
  double result;
  __int128 v9;
  _OWORD v10[9];
  uint64_t v11;

  sub_22D8CCFA8(*a1, a2, a3, 0, 1, (uint64_t)v10);
  v5 = v10[7];
  *(_OWORD *)(a4 + 96) = v10[6];
  *(_OWORD *)(a4 + 112) = v5;
  *(_OWORD *)(a4 + 128) = v10[8];
  *(_QWORD *)(a4 + 144) = v11;
  v6 = v10[3];
  *(_OWORD *)(a4 + 32) = v10[2];
  *(_OWORD *)(a4 + 48) = v6;
  v7 = v10[5];
  *(_OWORD *)(a4 + 64) = v10[4];
  *(_OWORD *)(a4 + 80) = v7;
  result = *(double *)v10;
  v9 = v10[1];
  *(_OWORD *)a4 = v10[0];
  *(_OWORD *)(a4 + 16) = v9;
  return result;
}

uint64_t sub_22D8CE314()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_22D8CE348()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_22D8CE350()
{
  uint64_t result;
  unint64_t v1;

  result = sub_22D8E7124();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_22D8CE400(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  size_t v8;
  size_t v9;
  int v10;
  uint64_t v13;
  void *v14;
  const void *v15;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  uint64_t v19;
  char v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  char v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  void *v39;
  id v40;

  v3 = a1;
  v4 = *(_QWORD *)(a3 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  v7 = v6;
  if (*(_DWORD *)(v5 + 84))
    v8 = *(_QWORD *)(v5 + 64);
  else
    v8 = *(_QWORD *)(v5 + 64) + 1;
  v9 = v8 + 7;
  v10 = v6 & 0x100000;
  if (v7 > 7
    || v10 != 0
    || ((((((v8 + 7 + ((v7 + 8) & ~v7)) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 103) & 0xFFFFFFFFFFFFFFF8)
     + 8 > 0x18)
  {
    v13 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v13 + ((v7 & 0xF8 ^ 0x1F8) & (v7 + 16)));
    swift_retain();
  }
  else
  {
    *a1 = *a2;
    v14 = (void *)(((unint64_t)a1 + v7 + 8) & ~v7);
    v15 = (const void *)(((unint64_t)a2 + v7 + 8) & ~v7);
    if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v5 + 48))(v15, 1, v4))
    {
      memcpy(v14, v15, v8);
    }
    else
    {
      (*(void (**)(void *, const void *, uint64_t))(v5 + 16))(v14, v15, v4);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v5 + 56))(v14, 0, 1, v4);
    }
    v16 = ((unint64_t)v14 + v9) & 0xFFFFFFFFFFFFFFF8;
    v17 = ((unint64_t)v15 + v9) & 0xFFFFFFFFFFFFFFF8;
    v18 = *(void **)v17;
    v19 = *(_QWORD *)(v17 + 8);
    v20 = *(_BYTE *)(v17 + 16);
    sub_22D8CE68C(*(void **)v17, v19, v20);
    *(_QWORD *)v16 = v18;
    *(_QWORD *)(v16 + 8) = v19;
    *(_BYTE *)(v16 + 16) = v20;
    *(_QWORD *)(v16 + 24) = *(_QWORD *)(v17 + 24);
    v21 = (v16 + 39) & 0xFFFFFFFFFFFFFFF8;
    v22 = (v17 + 39) & 0xFFFFFFFFFFFFFFF8;
    *(_BYTE *)v21 = *(_BYTE *)v22;
    *(_QWORD *)(v21 + 8) = *(_QWORD *)(v22 + 8);
    v23 = (v21 + 23) & 0xFFFFFFFFFFFFFFF8;
    v24 = (v22 + 23) & 0xFFFFFFFFFFFFFFF8;
    v25 = *(_QWORD *)v24;
    v26 = *(_BYTE *)(v24 + 8);
    swift_retain();
    swift_retain();
    sub_22D8CE69C(v25, v26);
    *(_QWORD *)v23 = v25;
    *(_BYTE *)(v23 + 8) = v26;
    v27 = (v21 + 39) & 0xFFFFFFFFFFFFFFF8;
    v28 = (v22 + 39) & 0xFFFFFFFFFFFFFFF8;
    v29 = *(_QWORD *)v28;
    LOBYTE(v25) = *(_BYTE *)(v28 + 8);
    sub_22D8CE6A8(*(_QWORD *)v28, v25);
    *(_QWORD *)v27 = v29;
    *(_BYTE *)(v27 + 8) = v25;
    v30 = (v21 + 55) & 0xFFFFFFFFFFFFFFF8;
    v31 = (v22 + 55) & 0xFFFFFFFFFFFFFFF8;
    v32 = *(_QWORD *)v31;
    LOBYTE(v25) = *(_BYTE *)(v31 + 8);
    sub_22D8CE6A8(*(_QWORD *)v31, v25);
    *(_QWORD *)v30 = v32;
    *(_BYTE *)(v30 + 8) = v25;
    v33 = (v21 + 71) & 0xFFFFFFFFFFFFFFF8;
    v34 = (v22 + 71) & 0xFFFFFFFFFFFFFFF8;
    v35 = *(_QWORD *)v34;
    LOBYTE(v25) = *(_BYTE *)(v34 + 8);
    sub_22D8CE6A8(*(_QWORD *)v34, v25);
    *(_QWORD *)v33 = v35;
    *(_BYTE *)(v33 + 8) = v25;
    v36 = (v21 + 87) & 0xFFFFFFFFFFFFFFF8;
    v37 = (v22 + 87) & 0xFFFFFFFFFFFFFFF8;
    v38 = *(_QWORD *)v37;
    LOBYTE(v25) = *(_BYTE *)(v37 + 8);
    sub_22D8CE6A8(*(_QWORD *)v37, v25);
    *(_QWORD *)v36 = v38;
    *(_BYTE *)(v36 + 8) = v25;
    v39 = *(void **)((v22 + 103) & 0xFFFFFFFFFFFFF8);
    *(_QWORD *)((v21 + 103) & 0xFFFFFFFFFFFFF8) = v39;
    v40 = v39;
  }
  return v3;
}

id sub_22D8CE68C(void *a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return a1;
  else
    return (id)swift_retain();
}

uint64_t sub_22D8CE69C(uint64_t a1, char a2)
{
  uint64_t result;

  if ((a2 & 1) == 0)
    return swift_retain();
  return result;
}

uint64_t sub_22D8CE6A8(uint64_t a1, char a2)
{
  if ((a2 & 1) != 0)
    return swift_bridgeObjectRetain();
  else
    return swift_retain();
}

void sub_22D8CE6B4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;

  v2 = *(_QWORD *)(a2 + 16);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = (a1 + *(unsigned __int8 *)(v3 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  if (!(*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v3 + 48))(v4, 1, v2))
    (*(void (**)(unint64_t, uint64_t))(v3 + 8))(v4, v2);
  v5 = v4 + *(_QWORD *)(v3 + 64);
  if (!*(_DWORD *)(v3 + 84))
    ++v5;
  v6 = (v5 + 7) & 0xFFFFFFFFFFFFFFF8;
  sub_22D8CE004(*(void **)v6, *(_QWORD *)(v6 + 8), *(_BYTE *)(v6 + 16));
  swift_release();
  v7 = (v6 + 39) & 0xFFFFFFFFFFFFFFF8;
  swift_release();
  sub_22D8CC628(*(_QWORD *)((v7 + 23) & 0xFFFFFFFFFFFFFFF8), *(_BYTE *)(((v7 + 23) & 0xFFFFFFFFFFFFFFF8) + 8));
  sub_22D8CE014(*(_QWORD *)((v7 + 39) & 0xFFFFFFFFFFFFFFF8), *(_BYTE *)(((v7 + 39) & 0xFFFFFFFFFFFFFFF8) + 8));
  sub_22D8CE014(*(_QWORD *)((v7 + 55) & 0xFFFFFFFFFFFFFFF8), *(_BYTE *)(((v7 + 55) & 0xFFFFFFFFFFFFFFF8) + 8));
  sub_22D8CE014(*(_QWORD *)((v7 + 71) & 0xFFFFFFFFFFFFFFF8), *(_BYTE *)(((v7 + 71) & 0xFFFFFFFFFFFFFFF8) + 8));
  sub_22D8CE014(*(_QWORD *)((v7 + 87) & 0xFFFFFFFFFFFFFFF8), *(_BYTE *)(((v7 + 87) & 0xFFFFFFFFFFFFFFF8) + 8));

}

_QWORD *sub_22D8CE7C4(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const void *v8;
  int v9;
  size_t v10;
  size_t v11;
  size_t v12;
  unint64_t v13;
  unint64_t v14;
  void *v15;
  uint64_t v16;
  char v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  char v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  void *v36;
  id v37;

  *a1 = *a2;
  v4 = *(_QWORD *)(a3 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(unsigned __int8 *)(v5 + 80);
  v7 = (void *)(((unint64_t)a1 + v6 + 8) & ~v6);
  v8 = (const void *)(((unint64_t)a2 + v6 + 8) & ~v6);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v5 + 48))(v8, 1, v4))
  {
    v9 = *(_DWORD *)(v5 + 84);
    v10 = *(_QWORD *)(v5 + 64);
    if (v9)
      v11 = v10;
    else
      v11 = v10 + 1;
    memcpy(v7, v8, v11);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v5 + 16))(v7, v8, v4);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v5 + 56))(v7, 0, 1, v4);
    v9 = *(_DWORD *)(v5 + 84);
    v10 = *(_QWORD *)(v5 + 64);
  }
  if (v9)
    v12 = v10;
  else
    v12 = v10 + 1;
  v13 = ((unint64_t)v7 + v12 + 7) & 0xFFFFFFFFFFFFFFF8;
  v14 = ((unint64_t)v8 + v12 + 7) & 0xFFFFFFFFFFFFFFF8;
  v15 = *(void **)v14;
  v16 = *(_QWORD *)(v14 + 8);
  v17 = *(_BYTE *)(v14 + 16);
  sub_22D8CE68C(*(void **)v14, v16, v17);
  *(_QWORD *)v13 = v15;
  *(_QWORD *)(v13 + 8) = v16;
  *(_BYTE *)(v13 + 16) = v17;
  *(_QWORD *)(v13 + 24) = *(_QWORD *)(v14 + 24);
  v18 = (v13 + 39) & 0xFFFFFFFFFFFFFFF8;
  v19 = (v14 + 39) & 0xFFFFFFFFFFFFFFF8;
  *(_BYTE *)v18 = *(_BYTE *)v19;
  *(_QWORD *)(v18 + 8) = *(_QWORD *)(v19 + 8);
  v20 = (v18 + 23) & 0xFFFFFFFFFFFFFFF8;
  v21 = (v19 + 23) & 0xFFFFFFFFFFFFFFF8;
  v22 = *(_QWORD *)v21;
  v23 = *(_BYTE *)(v21 + 8);
  swift_retain();
  swift_retain();
  sub_22D8CE69C(v22, v23);
  *(_QWORD *)v20 = v22;
  *(_BYTE *)(v20 + 8) = v23;
  v24 = (v18 + 39) & 0xFFFFFFFFFFFFFFF8;
  v25 = (v19 + 39) & 0xFFFFFFFFFFFFFFF8;
  v26 = *(_QWORD *)v25;
  LOBYTE(v22) = *(_BYTE *)(v25 + 8);
  sub_22D8CE6A8(*(_QWORD *)v25, v22);
  *(_QWORD *)v24 = v26;
  *(_BYTE *)(v24 + 8) = v22;
  v27 = (v18 + 55) & 0xFFFFFFFFFFFFFFF8;
  v28 = (v19 + 55) & 0xFFFFFFFFFFFFFFF8;
  v29 = *(_QWORD *)v28;
  LOBYTE(v22) = *(_BYTE *)(v28 + 8);
  sub_22D8CE6A8(*(_QWORD *)v28, v22);
  *(_QWORD *)v27 = v29;
  *(_BYTE *)(v27 + 8) = v22;
  v30 = (v18 + 71) & 0xFFFFFFFFFFFFFFF8;
  v31 = (v19 + 71) & 0xFFFFFFFFFFFFFFF8;
  v32 = *(_QWORD *)v31;
  LOBYTE(v22) = *(_BYTE *)(v31 + 8);
  sub_22D8CE6A8(*(_QWORD *)v31, v22);
  *(_QWORD *)v30 = v32;
  *(_BYTE *)(v30 + 8) = v22;
  v33 = (v18 + 87) & 0xFFFFFFFFFFFFFFF8;
  v34 = (v19 + 87) & 0xFFFFFFFFFFFFFFF8;
  v35 = *(_QWORD *)v34;
  LOBYTE(v22) = *(_BYTE *)(v34 + 8);
  sub_22D8CE6A8(*(_QWORD *)v34, v22);
  *(_QWORD *)v33 = v35;
  *(_BYTE *)(v33 + 8) = v22;
  v36 = *(void **)((v19 + 103) & 0xFFFFFFFFFFFFF8);
  *(_QWORD *)((v18 + 103) & 0xFFFFFFFFFFFFF8) = v36;
  v37 = v36;
  return a1;
}

_QWORD *sub_22D8CE9FC(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t (*v9)(void *, uint64_t, uint64_t);
  int v10;
  int v11;
  size_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;
  uint64_t v17;
  char v18;
  void *v19;
  uint64_t v20;
  char v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char v48;
  void **v49;
  void *v50;
  void *v51;
  id v52;

  *a1 = *a2;
  v4 = *(_QWORD *)(a3 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(unsigned __int8 *)(v5 + 80);
  v7 = (void *)(((unint64_t)a1 + v6 + 8) & ~v6);
  v8 = (void *)(((unint64_t)a2 + v6 + 8) & ~v6);
  v9 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v5 + 48);
  v10 = v9(v7, 1, v4);
  v11 = v9(v8, 1, v4);
  if (v10)
  {
    if (!v11)
    {
      (*(void (**)(void *, void *, uint64_t))(v5 + 16))(v7, v8, v4);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v5 + 56))(v7, 0, 1, v4);
      goto LABEL_10;
    }
  }
  else
  {
    if (!v11)
    {
      (*(void (**)(void *, void *, uint64_t))(v5 + 24))(v7, v8, v4);
      goto LABEL_10;
    }
    (*(void (**)(void *, uint64_t))(v5 + 8))(v7, v4);
  }
  if (*(_DWORD *)(v5 + 84))
    v12 = *(_QWORD *)(v5 + 64);
  else
    v12 = *(_QWORD *)(v5 + 64) + 1;
  memcpy(v7, v8, v12);
LABEL_10:
  if (*(_DWORD *)(v5 + 84))
    v13 = *(_QWORD *)(v5 + 64);
  else
    v13 = *(_QWORD *)(v5 + 64) + 1;
  v14 = ((unint64_t)v7 + v13 + 7) & 0xFFFFFFFFFFFFFFF8;
  v15 = ((unint64_t)v8 + v13 + 7) & 0xFFFFFFFFFFFFFFF8;
  v16 = *(void **)v15;
  v17 = *(_QWORD *)(v15 + 8);
  v18 = *(_BYTE *)(v15 + 16);
  sub_22D8CE68C(*(void **)v15, v17, v18);
  v19 = *(void **)v14;
  v20 = *(_QWORD *)(v14 + 8);
  v21 = *(_BYTE *)(v14 + 16);
  *(_QWORD *)v14 = v16;
  *(_QWORD *)(v14 + 8) = v17;
  *(_BYTE *)(v14 + 16) = v18;
  sub_22D8CE004(v19, v20, v21);
  *(_QWORD *)(v14 + 24) = *(_QWORD *)(v15 + 24);
  swift_retain();
  swift_release();
  v22 = (v14 + 39) & 0xFFFFFFFFFFFFFFF8;
  v23 = (v15 + 39) & 0xFFFFFFFFFFFFFFF8;
  *(_BYTE *)v22 = *(_BYTE *)v23;
  *(_QWORD *)(v22 + 8) = *(_QWORD *)(v23 + 8);
  swift_retain();
  swift_release();
  v24 = (v22 + 23) & 0xFFFFFFFFFFFFFFF8;
  v25 = (v23 + 23) & 0xFFFFFFFFFFFFFFF8;
  v26 = *(_QWORD *)v25;
  LOBYTE(v17) = *(_BYTE *)(v25 + 8);
  sub_22D8CE69C(*(_QWORD *)v25, v17);
  v27 = *(_QWORD *)v24;
  v28 = *(_BYTE *)(v24 + 8);
  *(_QWORD *)v24 = v26;
  *(_BYTE *)(v24 + 8) = v17;
  sub_22D8CC628(v27, v28);
  v29 = (v22 + 39) & 0xFFFFFFFFFFFFFFF8;
  v30 = (v23 + 39) & 0xFFFFFFFFFFFFFFF8;
  v31 = *(_QWORD *)v30;
  LOBYTE(v17) = *(_BYTE *)(v30 + 8);
  sub_22D8CE6A8(*(_QWORD *)v30, v17);
  v32 = *(_QWORD *)v29;
  v33 = *(_BYTE *)(v29 + 8);
  *(_QWORD *)v29 = v31;
  *(_BYTE *)(v29 + 8) = v17;
  sub_22D8CE014(v32, v33);
  v34 = (v22 + 55) & 0xFFFFFFFFFFFFFFF8;
  v35 = (v23 + 55) & 0xFFFFFFFFFFFFFFF8;
  v36 = *(_QWORD *)v35;
  LOBYTE(v17) = *(_BYTE *)(v35 + 8);
  sub_22D8CE6A8(*(_QWORD *)v35, v17);
  v37 = *(_QWORD *)v34;
  v38 = *(_BYTE *)(v34 + 8);
  *(_QWORD *)v34 = v36;
  *(_BYTE *)(v34 + 8) = v17;
  sub_22D8CE014(v37, v38);
  v39 = (v22 + 71) & 0xFFFFFFFFFFFFFFF8;
  v40 = (v23 + 71) & 0xFFFFFFFFFFFFFFF8;
  v41 = *(_QWORD *)v40;
  LOBYTE(v17) = *(_BYTE *)(v40 + 8);
  sub_22D8CE6A8(*(_QWORD *)v40, v17);
  v42 = *(_QWORD *)v39;
  v43 = *(_BYTE *)(v39 + 8);
  *(_QWORD *)v39 = v41;
  *(_BYTE *)(v39 + 8) = v17;
  sub_22D8CE014(v42, v43);
  v44 = (v22 + 87) & 0xFFFFFFFFFFFFFFF8;
  v45 = (v23 + 87) & 0xFFFFFFFFFFFFFFF8;
  v46 = *(_QWORD *)v45;
  LOBYTE(v17) = *(_BYTE *)(v45 + 8);
  sub_22D8CE6A8(*(_QWORD *)v45, v17);
  v47 = *(_QWORD *)v44;
  v48 = *(_BYTE *)(v44 + 8);
  *(_QWORD *)v44 = v46;
  *(_BYTE *)(v44 + 8) = v17;
  sub_22D8CE014(v47, v48);
  v49 = (void **)((v22 + 103) & 0xFFFFFFFFFFFFFFF8);
  v50 = *(void **)((v23 + 103) & 0xFFFFFFFFFFFFF8);
  v51 = *v49;
  *v49 = v50;
  v52 = v50;

  return a1;
}

_QWORD *sub_22D8CECDC(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const void *v8;
  int v9;
  size_t v10;
  size_t v11;
  size_t v12;
  _OWORD *v13;
  _OWORD *v14;
  __int128 v15;
  _OWORD *v16;
  _OWORD *v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;

  *a1 = *a2;
  v4 = *(_QWORD *)(a3 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(unsigned __int8 *)(v5 + 80);
  v7 = (void *)(((unint64_t)a1 + v6 + 8) & ~v6);
  v8 = (const void *)(((unint64_t)a2 + v6 + 8) & ~v6);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v5 + 48))(v8, 1, v4))
  {
    v9 = *(_DWORD *)(v5 + 84);
    v10 = *(_QWORD *)(v5 + 64);
    if (v9)
      v11 = v10;
    else
      v11 = v10 + 1;
    memcpy(v7, v8, v11);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v5 + 32))(v7, v8, v4);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v5 + 56))(v7, 0, 1, v4);
    v9 = *(_DWORD *)(v5 + 84);
    v10 = *(_QWORD *)(v5 + 64);
  }
  if (v9)
    v12 = v10;
  else
    v12 = v10 + 1;
  v13 = (_OWORD *)(((unint64_t)v7 + v12 + 7) & 0xFFFFFFFFFFFFFFF8);
  v14 = (_OWORD *)(((unint64_t)v8 + v12 + 7) & 0xFFFFFFFFFFFFFFF8);
  v15 = v14[1];
  *v13 = *v14;
  v13[1] = v15;
  v16 = (_OWORD *)(((unint64_t)v13 + 39) & 0xFFFFFFFFFFFFFFF8);
  v17 = (_OWORD *)(((unint64_t)v14 + 39) & 0xFFFFFFFFFFFFFFF8);
  *v16 = *v17;
  v18 = ((unint64_t)v16 + 23) & 0xFFFFFFFFFFFFFFF8;
  v19 = ((unint64_t)v17 + 23) & 0xFFFFFFFFFFFFFFF8;
  v20 = *(_QWORD *)v19;
  *(_BYTE *)(v18 + 8) = *(_BYTE *)(v19 + 8);
  *(_QWORD *)v18 = v20;
  v21 = ((unint64_t)v16 + 39) & 0xFFFFFFFFFFFFFFF8;
  v22 = ((unint64_t)v17 + 39) & 0xFFFFFFFFFFFFFFF8;
  v23 = *(_QWORD *)v22;
  *(_BYTE *)(v21 + 8) = *(_BYTE *)(v22 + 8);
  *(_QWORD *)v21 = v23;
  v24 = ((unint64_t)v16 + 55) & 0xFFFFFFFFFFFFFFF8;
  v25 = ((unint64_t)v17 + 55) & 0xFFFFFFFFFFFFFFF8;
  v26 = *(_QWORD *)v25;
  *(_BYTE *)(v24 + 8) = *(_BYTE *)(v25 + 8);
  *(_QWORD *)v24 = v26;
  v27 = ((unint64_t)v16 + 71) & 0xFFFFFFFFFFFFFFF8;
  v28 = ((unint64_t)v17 + 71) & 0xFFFFFFFFFFFFFFF8;
  v29 = *(_QWORD *)v28;
  *(_BYTE *)(v27 + 8) = *(_BYTE *)(v28 + 8);
  *(_QWORD *)v27 = v29;
  v30 = ((unint64_t)v16 + 87) & 0xFFFFFFFFFFFFFFF8;
  v31 = ((unint64_t)v17 + 87) & 0xFFFFFFFFFFFFFFF8;
  v32 = *(_QWORD *)v31;
  *(_BYTE *)(v30 + 8) = *(_BYTE *)(v31 + 8);
  *(_QWORD *)v30 = v32;
  *(_QWORD *)(((unint64_t)v16 + 103) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)v17 + 103) & 0xFFFFFFFFFFFFF8);
  return a1;
}

_QWORD *sub_22D8CEE98(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t (*v9)(void *, uint64_t, uint64_t);
  int v10;
  int v11;
  size_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  char v16;
  void *v17;
  uint64_t v18;
  char v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char v46;
  void **v47;
  void *v48;

  *a1 = *a2;
  v4 = *(_QWORD *)(a3 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(unsigned __int8 *)(v5 + 80);
  v7 = (void *)(((unint64_t)a1 + v6 + 8) & ~v6);
  v8 = (void *)(((unint64_t)a2 + v6 + 8) & ~v6);
  v9 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v5 + 48);
  v10 = v9(v7, 1, v4);
  v11 = v9(v8, 1, v4);
  if (v10)
  {
    if (!v11)
    {
      (*(void (**)(void *, void *, uint64_t))(v5 + 32))(v7, v8, v4);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v5 + 56))(v7, 0, 1, v4);
      goto LABEL_10;
    }
  }
  else
  {
    if (!v11)
    {
      (*(void (**)(void *, void *, uint64_t))(v5 + 40))(v7, v8, v4);
      goto LABEL_10;
    }
    (*(void (**)(void *, uint64_t))(v5 + 8))(v7, v4);
  }
  if (*(_DWORD *)(v5 + 84))
    v12 = *(_QWORD *)(v5 + 64);
  else
    v12 = *(_QWORD *)(v5 + 64) + 1;
  memcpy(v7, v8, v12);
LABEL_10:
  if (*(_DWORD *)(v5 + 84))
    v13 = *(_QWORD *)(v5 + 64);
  else
    v13 = *(_QWORD *)(v5 + 64) + 1;
  v14 = ((unint64_t)v7 + v13 + 7) & 0xFFFFFFFFFFFFFFF8;
  v15 = ((unint64_t)v8 + v13 + 7) & 0xFFFFFFFFFFFFFFF8;
  v16 = *(_BYTE *)(v15 + 16);
  v17 = *(void **)v14;
  v18 = *(_QWORD *)(v14 + 8);
  v19 = *(_BYTE *)(v14 + 16);
  *(_OWORD *)v14 = *(_OWORD *)v15;
  *(_BYTE *)(v14 + 16) = v16;
  sub_22D8CE004(v17, v18, v19);
  *(_QWORD *)(v14 + 24) = *(_QWORD *)(v15 + 24);
  swift_release();
  v20 = (v14 + 39) & 0xFFFFFFFFFFFFFFF8;
  v21 = (v15 + 39) & 0xFFFFFFFFFFFFFFF8;
  *(_BYTE *)v20 = *(_BYTE *)v21;
  *(_QWORD *)(v20 + 8) = *(_QWORD *)(v21 + 8);
  swift_release();
  v22 = (v20 + 23) & 0xFFFFFFFFFFFFFFF8;
  v23 = (v21 + 23) & 0xFFFFFFFFFFFFFFF8;
  v24 = *(_QWORD *)v23;
  LOBYTE(v23) = *(_BYTE *)(v23 + 8);
  v25 = *(_QWORD *)v22;
  v26 = *(_BYTE *)(v22 + 8);
  *(_QWORD *)v22 = v24;
  *(_BYTE *)(v22 + 8) = v23;
  sub_22D8CC628(v25, v26);
  v27 = (v20 + 39) & 0xFFFFFFFFFFFFFFF8;
  v28 = (v21 + 39) & 0xFFFFFFFFFFFFFFF8;
  v29 = *(_QWORD *)v28;
  LOBYTE(v28) = *(_BYTE *)(v28 + 8);
  v30 = *(_QWORD *)v27;
  v31 = *(_BYTE *)(v27 + 8);
  *(_QWORD *)v27 = v29;
  *(_BYTE *)(v27 + 8) = v28;
  sub_22D8CE014(v30, v31);
  v32 = (v20 + 55) & 0xFFFFFFFFFFFFFFF8;
  v33 = (v21 + 55) & 0xFFFFFFFFFFFFFFF8;
  v34 = *(_QWORD *)v33;
  LOBYTE(v33) = *(_BYTE *)(v33 + 8);
  v35 = *(_QWORD *)v32;
  v36 = *(_BYTE *)(v32 + 8);
  *(_QWORD *)v32 = v34;
  *(_BYTE *)(v32 + 8) = v33;
  sub_22D8CE014(v35, v36);
  v37 = (v20 + 71) & 0xFFFFFFFFFFFFFFF8;
  v38 = (v21 + 71) & 0xFFFFFFFFFFFFFFF8;
  v39 = *(_QWORD *)v38;
  LOBYTE(v38) = *(_BYTE *)(v38 + 8);
  v40 = *(_QWORD *)v37;
  v41 = *(_BYTE *)(v37 + 8);
  *(_QWORD *)v37 = v39;
  *(_BYTE *)(v37 + 8) = v38;
  sub_22D8CE014(v40, v41);
  v42 = (v20 + 87) & 0xFFFFFFFFFFFFFFF8;
  v43 = (v21 + 87) & 0xFFFFFFFFFFFFFFF8;
  v44 = *(_QWORD *)v43;
  LOBYTE(v43) = *(_BYTE *)(v43 + 8);
  v45 = *(_QWORD *)v42;
  v46 = *(_BYTE *)(v42 + 8);
  *(_QWORD *)v42 = v44;
  *(_BYTE *)(v42 + 8) = v43;
  sub_22D8CE014(v45, v46);
  v47 = (void **)((v20 + 103) & 0xFFFFFFFFFFFFFFF8);
  v48 = *v47;
  *v47 = *(void **)((v21 + 103) & 0xFFFFFFFFFFFFF8);

  return a1;
}

uint64_t sub_22D8CF118(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  int v5;
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v15;
  unsigned int v16;
  unint64_t v17;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  if (v5)
    v6 = v5 - 1;
  else
    v6 = 0;
  if (v6 <= 0x7FFFFFFF)
    v7 = 0x7FFFFFFF;
  else
    v7 = v6;
  v8 = *(_QWORD *)(v4 + 64);
  if (!v5)
    ++v8;
  if (!a2)
    return 0;
  v9 = *(unsigned __int8 *)(v4 + 80);
  v10 = v8 + 7;
  if (v7 < a2)
  {
    if (((((((((v10 + ((v9 + 8) & ~v9)) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 103) & 0xFFFFFFFFFFFFFFF8)
         + 8) & 0xFFFFFFF8) != 0)
      v11 = 2;
    else
      v11 = a2 - v7 + 1;
    if (v11 >= 0x10000)
      v12 = 4;
    else
      v12 = 2;
    if (v11 < 0x100)
      v12 = 1;
    if (v11 >= 2)
      v13 = v12;
    else
      v13 = 0;
    __asm { BR              X17 }
  }
  v15 = (a1 + v9 + 8) & ~v9;
  if (v6 < 0x7FFFFFFF)
  {
    v17 = *(_QWORD *)((((((v10 + v15) & 0xFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFF8) + 103) & 0xFFFFFFFFFFFFF8);
    if (v17 >= 0xFFFFFFFF)
      LODWORD(v17) = -1;
    return (v17 + 1);
  }
  else
  {
    v16 = (*(uint64_t (**)(uint64_t))(v4 + 48))(v15);
    if (v16 >= 2)
      return v16 - 1;
    else
      return 0;
  }
}

void sub_22D8CF28C(unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  int v6;
  uint64_t v7;
  int v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  unsigned int v12;
  unsigned int v13;
  int v14;
  unsigned int v15;

  v6 = 0;
  v7 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  v8 = *(_DWORD *)(v7 + 84);
  if (v8)
    v9 = v8 - 1;
  else
    v9 = 0;
  if (v9 <= 0x7FFFFFFF)
    v10 = 0x7FFFFFFF;
  else
    v10 = v9;
  v11 = *(_QWORD *)(v7 + 64);
  if (!v8)
    ++v11;
  if (v10 < a3)
  {
    v12 = a3 - v10;
    if ((((((((_DWORD)v11 + 7 + ((*(unsigned __int8 *)(v7 + 80) + 8) & ~*(unsigned __int8 *)(v7 + 80))) & 0xFFFFFFF8)
           + 39) & 0xFFFFFFF8)
         + 103) & 0xFFFFFFF8) == 0xFFFFFFF8)
      v13 = v12 + 1;
    else
      v13 = 2;
    if (v13 >= 0x10000)
      v14 = 4;
    else
      v14 = 2;
    if (v13 < 0x100)
      v14 = 1;
    if (v13 >= 2)
      v6 = v14;
    else
      v6 = 0;
  }
  if (a2 > v10)
  {
    if ((((((((_DWORD)v11 + 7 + ((*(unsigned __int8 *)(v7 + 80) + 8) & ~*(unsigned __int8 *)(v7 + 80))) & 0xFFFFFFF8)
           + 39) & 0xFFFFFFF8)
         + 103) & 0xFFFFFFF8) != 0xFFFFFFF8)
    {
      v15 = ~v10 + a2;
      bzero(a1, ((((((v11 + 7 + ((*(unsigned __int8 *)(v7 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80))) & 0xFFFFFFFFFFFFFFF8)+ 39) & 0xFFFFFFFFFFFFFFF8)+ 103) & 0xFFFFFFFFFFFFFFF8)+ 8);
      *a1 = v15;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X16 }
}

uint64_t sub_22D8CF3A8@<X0>(unsigned int a1@<W1>, size_t a2@<X8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  int v18;
  uint64_t v19;
  uint64_t result;

  *(_BYTE *)(v15 + v16) = 0;
  if (a1)
  {
    v17 = (void *)((v15 + v14 + 8) & v10);
    if (v11 < 0x7FFFFFFF)
    {
      if ((a1 & 0x80000000) != 0)
        v19 = a1 ^ 0x80000000;
      else
        v19 = a1 - 1;
      *(_QWORD *)(((((((unint64_t)v17 + v13) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 103) & 0xFFFFFFFFFFFFFFF8) = v19;
    }
    else if (v11 >= a1)
    {
      return (*(uint64_t (**)(void *, _QWORD))(v12 + 56))(v17, a1 + 1);
    }
    else if ((_DWORD)a2)
    {
      if (a2 <= 3)
        v18 = a2;
      else
        v18 = 4;
      bzero(v17, a2);
      __asm { BR              X10 }
    }
  }
  return result;
}

void sub_22D8CF4B8()
{
  uint64_t v0;
  int v1;

  *(_WORD *)v0 = v1;
  *(_BYTE *)(v0 + 2) = BYTE2(v1);
}

void sub_22D8CF4C8()
{
  _WORD *v0;
  __int16 v1;

  *v0 = v1;
}

void sub_22D8CF4D0()
{
  _DWORD *v0;
  int v1;

  *v0 = v1;
}

uint64_t sub_22D8CF4DC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD v4[2];

  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255D9FF30);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255D9FF38);
  sub_22D8E7124();
  sub_22D8E6E30();
  swift_getTupleTypeMetadata2();
  v0 = sub_22D8E6FE0();
  MEMORY[0x22E31B14C](MEMORY[0x24BDF5428], v0);
  v1 = sub_22D8E6FBC();
  sub_22D8E6CEC();
  v2 = sub_22D8E6D10();
  v4[0] = MEMORY[0x22E31B14C](MEMORY[0x24BDF4750], v1);
  v4[1] = sub_22D8CE204();
  return MEMORY[0x22E31B14C](MEMORY[0x24BDED308], v2, v4);
}

uint64_t sub_22D8CF5DC()
{
  return swift_allocateGenericValueMetadata();
}

void sub_22D8CF5E8(uint64_t a1)
{
  sub_22D8CE004(*(void **)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t sub_22D8CF5F8(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  char v5;

  v3 = *(void **)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_22D8CE68C(*(void **)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t sub_22D8CF640(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  char v5;
  void *v6;
  uint64_t v7;
  char v8;

  v3 = *(void **)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_22D8CE68C(*(void **)a2, v4, v5);
  v6 = *(void **)a1;
  v7 = *(_QWORD *)(a1 + 8);
  v8 = *(_BYTE *)(a1 + 16);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  sub_22D8CE004(v6, v7, v8);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t sub_22D8CF6A8(uint64_t a1, uint64_t a2)
{
  char v3;
  void *v4;
  uint64_t v5;
  char v6;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(void **)a1;
  v5 = *(_QWORD *)(a1 + 8);
  v6 = *(_BYTE *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = v3;
  sub_22D8CE004(v4, v5, v6);
  return a1;
}

uint64_t sub_22D8CF6EC(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 1)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t sub_22D8CF734(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 255;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

uint64_t sub_22D8CF778(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_22D8CF780(uint64_t result, char a2)
{
  *(_BYTE *)(result + 16) = a2 & 1;
  return result;
}

uint64_t type metadata accessor for PayWithApplePayButton.Configuration(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for PayWithApplePayButton.Configuration);
}

void sub_22D8CF798(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v5;
  void *v6;

  *(_QWORD *)(a1 + OBJC_IVAR____TtC16_PassKit_SwiftUI31PaymentAuthorizationCoordinator_onPaymentMethodChange) = sub_22D8CCD44(a2);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + OBJC_IVAR____TtC16_PassKit_SwiftUI31PaymentAuthorizationCoordinator_onShippingContactChange) = sub_22D8CCDA0(a2);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + OBJC_IVAR____TtC16_PassKit_SwiftUI31PaymentAuthorizationCoordinator_onShippingChange) = sub_22D8CCDFC(a2);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + OBJC_IVAR____TtC16_PassKit_SwiftUI31PaymentAuthorizationCoordinator_onCouponCodeChange) = sub_22D8CCE58(a2);
  swift_bridgeObjectRelease();
  v5 = objc_msgSend(*(id *)(v2 + *(int *)(a2 + 68)), sel_window);
  v6 = *(void **)(a1 + OBJC_IVAR____TtC16_PassKit_SwiftUI31PaymentAuthorizationCoordinator_activeWindow);
  *(_QWORD *)(a1 + OBJC_IVAR____TtC16_PassKit_SwiftUI31PaymentAuthorizationCoordinator_activeWindow) = v5;

}

unint64_t sub_22D8CF8A8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_255DA0060;
  if (!qword_255DA0060)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255D9FF38);
    v2[0] = sub_22D8CF90C();
    v2[1] = v2[0];
    result = MEMORY[0x22E31B14C](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_255DA0060);
  }
  return result;
}

unint64_t sub_22D8CF90C()
{
  unint64_t result;

  result = qword_255DA0068;
  if (!qword_255DA0068)
  {
    result = MEMORY[0x22E31B14C]("Ŏ\a\"$<", &type metadata for PaymentButtonView);
    atomic_store(result, (unint64_t *)&qword_255DA0068);
  }
  return result;
}

unint64_t sub_22D8CF950()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_255DA0070;
  if (!qword_255DA0070)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255D9FF30);
    v2[0] = sub_22D8CF9BC();
    v2[1] = MEMORY[0x24BDEBEE0];
    result = MEMORY[0x22E31B14C](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_255DA0070);
  }
  return result;
}

unint64_t sub_22D8CF9BC()
{
  unint64_t result;

  result = qword_255DA0078[0];
  if (!qword_255DA0078[0])
  {
    result = MEMORY[0x22E31B14C](&unk_22D8E8B30, &type metadata for WindowFinder);
    atomic_store(result, qword_255DA0078);
  }
  return result;
}

uint64_t sub_22D8CFA00()
{
  return swift_release();
}

uint64_t sub_22D8CFA08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  int *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;

  v5 = *(_QWORD *)(v4 + 16);
  v6 = (int *)type metadata accessor for PayWithApplePayButton(0, v5, *(_QWORD *)(v4 + 24), a4);
  v7 = *((_QWORD *)v6 - 1);
  v8 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v9 = *(_QWORD *)(v7 + 64);
  v10 = v4 + v8;
  v11 = v4 + v8 + v6[9];
  v12 = *(_QWORD *)(v5 - 8);
  if (!(*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v12 + 48))(v11, 1, v5))
    (*(void (**)(unint64_t, uint64_t))(v12 + 8))(v11, v5);
  sub_22D8CE004(*(void **)(v10 + v6[10]), *(_QWORD *)(v10 + v6[10] + 8), *(_BYTE *)(v10 + v6[10] + 16));
  swift_release();
  swift_release();
  sub_22D8CC628(*(_QWORD *)(v10 + v6[12]), *(_BYTE *)(v10 + v6[12] + 8));
  sub_22D8CE014(*(_QWORD *)(v10 + v6[13]), *(_BYTE *)(v10 + v6[13] + 8));
  sub_22D8CE014(*(_QWORD *)(v10 + v6[14]), *(_BYTE *)(v10 + v6[14] + 8));
  sub_22D8CE014(*(_QWORD *)(v10 + v6[15]), *(_BYTE *)(v10 + v6[15] + 8));
  sub_22D8CE014(*(_QWORD *)(v10 + v6[16]), *(_BYTE *)(v10 + v6[16] + 8));

  return swift_deallocObject();
}

void sub_22D8CFB64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v5 = *(_QWORD *)(v4 + 16);
  v6 = *(_QWORD *)(v4 + 24);
  v7 = *(_QWORD *)(type metadata accessor for PayWithApplePayButton(0, v5, v6, a4) - 8);
  v8 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  sub_22D8CE24C(v4 + v8, *(_QWORD *)(v4 + ((*(_QWORD *)(v7 + 64) + v8 + 7) & 0xFFFFFFFFFFFFF8)), v5, v6);
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x22E31B0D4](a1, v6, a5);
}

uint64_t sub_22D8CFBF8@<X0>(__int128 *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, _OWORD *a5@<X8>)
{
  uint64_t v9;
  char *v10;
  uint64_t v11;

  sub_22D8CFF88(a1, a5);
  v10 = (char *)a5 + *(int *)(type metadata accessor for AddPassToWalletButton(0, a3, a4, v9) + 36);
  v11 = sub_22D8E7124();
  return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v10, a2, v11);
}

uint64_t sub_22D8CFC68(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v6;

  sub_22D8E6E18();
  MEMORY[0x24BDAC7A8]();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 16))((char *)&v6 - v4, a1, a2);
  swift_storeEnumTagMultiPayload();
  return sub_22D8E6E24();
}

uint64_t sub_22D8CFD2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v7;

  sub_22D8E6E18();
  MEMORY[0x24BDAC7A8]();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 16))((char *)&v7 - v5, a1, a3);
  swift_storeEnumTagMultiPayload();
  return sub_22D8E6E24();
}

uint64_t AddPassToWalletButton.body.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  __int128 *v2;
  __int128 *v3;
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
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t (*v18)(char *, uint64_t);
  uint64_t v20;
  uint64_t v21;
  __int128 v22[3];

  v3 = v2;
  v21 = a2;
  v5 = *(_QWORD *)(a1 + 16);
  v6 = sub_22D8E7124();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v20 - v8;
  v10 = *(_QWORD *)(a1 + 24);
  v12 = type metadata accessor for AddPassToWalletButton_iOS(0, v5, v10, v11);
  v20 = *(_QWORD *)(v12 - 8);
  v13 = MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v20 - v16;
  sub_22D8CFF88(v3, v22);
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v9, (char *)v3 + *(int *)(a1 + 36), v6);
  sub_22D8D010C((uint64_t)v22);
  sub_22D8CFFA0(v22, (uint64_t)v9, v5, v10, v15);
  MEMORY[0x22E31B14C](&unk_22D8E8230, v12);
  sub_22D8CFBF4((uint64_t)v15, v12, (uint64_t)v17);
  v18 = *(uint64_t (**)(char *, uint64_t))(v20 + 8);
  v18(v15, v12);
  sub_22D8CDC24((uint64_t)v17, v12, v21);
  return v18(v17, v12);
}

uint64_t type metadata accessor for AddPassToWalletButton_iOS(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for AddPassToWalletButton_iOS);
}

_OWORD *sub_22D8CFF88(__int128 *a1, _OWORD *a2)
{
  __int128 v2;
  __int128 v3;

  v2 = *a1;
  v3 = a1[1];
  *(_OWORD *)((char *)a2 + 25) = *(__int128 *)((char *)a1 + 25);
  *a2 = v2;
  a2[1] = v3;
  return a2;
}

uint64_t sub_22D8CFFA0@<X0>(__int128 *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, _OWORD *a5@<X8>)
{
  int *v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  char *v13;
  char *v14;
  uint64_t v15;
  char v17;
  uint64_t v18;

  v8 = (int *)type metadata accessor for AddPassToWalletButton_iOS(0, a3, a4, a4);
  v9 = (char *)a5 + v8[10];
  *(_QWORD *)v9 = swift_getKeyPath();
  v9[8] = 0;
  v10 = (char *)a5 + v8[11];
  sub_22D8E6F44();
  *v10 = v17;
  *((_QWORD *)v10 + 1) = v18;
  v11 = (char *)a5 + v8[12];
  sub_22D8E6F44();
  *v11 = v17;
  *((_QWORD *)v11 + 1) = v18;
  v12 = (char *)a5 + v8[13];
  sub_22D8E6F44();
  *v12 = v17;
  *((_QWORD *)v12 + 1) = v18;
  v13 = (char *)a5 + v8[14];
  sub_22D8E6F44();
  *v13 = v17;
  *((_QWORD *)v13 + 1) = v18;
  sub_22D8CFF88(a1, a5);
  v14 = (char *)a5 + v8[9];
  v15 = sub_22D8E7124();
  return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 32))(v14, a2, v15);
}

uint64_t sub_22D8D010C(uint64_t a1)
{
  sub_22D8D0140(*(void **)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 40));
  return a1;
}

void *sub_22D8D0140(void *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  id v6;
  id v7;

  switch(a6)
  {
    case 0:
      goto LABEL_5;
    case 1:
      swift_bridgeObjectRetain();
      goto LABEL_5;
    case 2:
      v6 = result;
      goto LABEL_5;
    case 3:
      v7 = result;
      swift_retain();
LABEL_5:
      result = (void *)swift_retain();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_22D8D01BC()
{
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255DA0058);
  sub_22D8E6F68();
  return v1;
}

uint64_t sub_22D8D0214()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DA0058);
  return sub_22D8E6F5C();
}

uint64_t sub_22D8D026C()
{
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255DA0058);
  sub_22D8E6F68();
  return v1;
}

uint64_t sub_22D8D02C4()
{
  unsigned __int8 v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255DA0058);
  sub_22D8E6F50();
  return v1;
}

uint64_t sub_22D8D0318()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DA0058);
  return sub_22D8E6F5C();
}

uint64_t sub_22D8D0370()
{
  unsigned __int8 v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255DA0058);
  sub_22D8E6F50();
  return v1;
}

uint64_t sub_22D8D03C4()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DA0058);
  return sub_22D8E6F5C();
}

uint64_t sub_22D8D041C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(char *, uint64_t, uint64_t);
  char *v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  void (*v33)(uint64_t, uint64_t);
  uint64_t v35;
  uint64_t v36;
  char *v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  _QWORD v50[2];
  uint64_t v51;
  _QWORD v52[2];
  uint64_t v53;

  v46 = a2;
  v4 = sub_22D8E70C4();
  v44 = *(_QWORD *)(v4 - 8);
  v45 = v4;
  v5 = MEMORY[0x24BDAC7A8](v4);
  v43 = (char *)&v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(_QWORD *)(a1 - 8);
  v39 = *(_QWORD *)(v7 + 64);
  MEMORY[0x24BDAC7A8](v5);
  v38 = (char *)&v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255DA0180);
  v36 = *(_QWORD *)(a1 + 16);
  v9 = v36;
  v10 = sub_22D8E7124();
  v11 = sub_22D8E6E30();
  v12 = sub_22D8E6F38();
  v41 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v35 - v13;
  sub_22D8E6CEC();
  v15 = sub_22D8E6D10();
  v42 = *(_QWORD *)(v15 - 8);
  v16 = MEMORY[0x24BDAC7A8](v15);
  v37 = (char *)&v35 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v40 = (uint64_t)&v35 - v18;
  v19 = *(_QWORD *)(a1 + 24);
  v47 = v9;
  v48 = v19;
  v49 = v2;
  v20 = sub_22D8D3948();
  v53 = v19;
  v21 = MEMORY[0x22E31B14C](MEMORY[0x24BDF5578], v10, &v53);
  v52[0] = v20;
  v52[1] = v21;
  v22 = MEMORY[0x22E31B14C](MEMORY[0x24BDEF3E0], v11, v52);
  sub_22D8E6F2C();
  v23 = v7;
  v24 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  v25 = v38;
  v24(v38, v2, a1);
  v26 = (*(unsigned __int8 *)(v23 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v23 + 80);
  v27 = swift_allocObject();
  *(_QWORD *)(v27 + 16) = v36;
  *(_QWORD *)(v27 + 24) = v19;
  (*(void (**)(unint64_t, char *, uint64_t))(v23 + 32))(v27 + v26, v25, a1);
  v51 = v22;
  v28 = MEMORY[0x22E31B14C](MEMORY[0x24BDF3F50], v12, &v51);
  v29 = v43;
  sub_22D8CE200();
  v30 = (uint64_t)v37;
  sub_22D8E6EFC();
  swift_release();
  (*(void (**)(char *, uint64_t))(v44 + 8))(v29, v45);
  (*(void (**)(char *, uint64_t))(v41 + 8))(v14, v12);
  v31 = sub_22D8CE204();
  v50[0] = v28;
  v50[1] = v31;
  MEMORY[0x22E31B14C](MEMORY[0x24BDED308], v15, v50);
  v32 = v40;
  sub_22D8CFBF4(v30, v15, v40);
  v33 = *(void (**)(uint64_t, uint64_t))(v42 + 8);
  v33(v30, v15);
  sub_22D8CDC24(v32, v15, v46);
  return ((uint64_t (*)(uint64_t, uint64_t))v33)(v32, v15);
}

uint64_t sub_22D8D077C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
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
  char *v16;
  uint64_t v17;
  uint64_t v18;
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
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD *v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD *v44;
  void (*v45)(_QWORD *, uint64_t);
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  uint64_t v61;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  char *v72;
  _QWORD *v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  unint64_t v84;
  uint64_t v85;
  _QWORD v86[2];
  uint64_t v87;
  uint64_t v88;

  v80 = a4;
  v7 = sub_22D8E7124();
  v74 = *(char **)(v7 - 8);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v73 = (uint64_t *)((char *)&v63 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v8);
  v72 = (char *)&v63 - v10;
  v76 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DA01A8);
  MEMORY[0x24BDAC7A8](v76);
  v67 = (uint64_t)&v63 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v70 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DA0218);
  v68 = *(_QWORD *)(v70 - 8);
  v12 = MEMORY[0x24BDAC7A8](v70);
  v66 = (char *)&v63 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v69 = (char *)&v63 - v14;
  v75 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DA0220);
  MEMORY[0x24BDAC7A8](v75);
  v16 = (char *)&v63 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v71 = a2;
  v77 = a3;
  v18 = type metadata accessor for AddPassToWalletButton_iOS(0, a2, a3, v17);
  v19 = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v18);
  v21 = (char *)&v63 - v20;
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DA0180);
  MEMORY[0x24BDAC7A8](v22);
  v24 = (char *)&v63 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = sub_22D8E6E30();
  v78 = *(_QWORD *)(v25 - 8);
  v79 = v25;
  MEMORY[0x24BDAC7A8](v25);
  v27 = (char *)&v63 - v26;
  if ((sub_22D8D02C4() & 1) != 0)
  {
    v73 = v16;
    v74 = v24;
    v65 = v22;
    v64 = v7;
    v72 = v27;
    v28 = v77;
    v29 = sub_22D8D0370();
    v30 = v71;
    if ((v29 & 1) != 0)
    {
      v31 = a1 + *(int *)(v18 + 40);
      v32 = *(_QWORD *)v31;
      v33 = *(_BYTE *)(v31 + 8);
      sub_22D8CE69C(*(_QWORD *)v31, v33);
      sub_22D8DE900(v32, v33, &v82);
      sub_22D8CC628(v32, v33);
      v34 = v82;
      (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v21, a1, v18);
      v35 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
      v36 = swift_allocObject();
      *(_QWORD *)(v36 + 16) = v30;
      *(_QWORD *)(v36 + 24) = v28;
      v37 = v19;
      v38 = v28;
      (*(void (**)(unint64_t, char *, uint64_t))(v37 + 32))(v36 + v35, v21, v18);
      v39 = v73;
      *v73 = v34;
      v39[1] = nullsub_1;
      v39[2] = 0;
      v39[3] = sub_22D8D3E4C;
      v39[5] = 0;
      v39[6] = 0;
      v39[4] = v36;
      swift_storeEnumTagMultiPayload();
      __swift_instantiateConcreteTypeFromMangledName(&qword_255DA0198);
      sub_22D8D39F8();
      v40 = sub_22D8D3AA8();
      v82 = v76;
      v83 = MEMORY[0x24BEE1328];
      v84 = v40;
      v85 = MEMORY[0x24BEE1340];
      swift_getOpaqueTypeConformance2();
      v41 = (uint64_t)v74;
      sub_22D8E6E24();
    }
    else
    {
      v46 = v70;
      v47 = v67;
      sub_22D8D0E48(v18, v67);
      LOBYTE(v82) = sub_22D8CCC40() & 1;
      (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v21, a1, v18);
      v48 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
      v49 = swift_allocObject();
      *(_QWORD *)(v49 + 16) = v30;
      *(_QWORD *)(v49 + 24) = v28;
      v50 = v28;
      (*(void (**)(unint64_t, char *, uint64_t))(v19 + 32))(v49 + v48, v21, v18);
      v51 = sub_22D8D3AA8();
      v52 = MEMORY[0x24BEE1328];
      v53 = v66;
      v54 = v76;
      sub_22D8E6F20();
      swift_release();
      sub_22D8D4064(v47, &qword_255DA01A8);
      v55 = v68;
      v56 = v69;
      (*(void (**)(char *, char *, uint64_t))(v68 + 32))(v69, v53, v46);
      (*(void (**)(_QWORD *, char *, uint64_t))(v55 + 16))(v73, v56, v46);
      swift_storeEnumTagMultiPayload();
      __swift_instantiateConcreteTypeFromMangledName(&qword_255DA0198);
      sub_22D8D39F8();
      v82 = v54;
      v83 = v52;
      v84 = v51;
      v85 = MEMORY[0x24BEE1340];
      swift_getOpaqueTypeConformance2();
      v41 = (uint64_t)v74;
      v38 = v50;
      sub_22D8E6E24();
      (*(void (**)(char *, uint64_t))(v55 + 8))(v56, v46);
    }
    sub_22D8D3948();
    v81 = v38;
    v7 = v64;
    MEMORY[0x22E31B14C](MEMORY[0x24BDF5578], v64, &v81);
    v27 = v72;
    sub_22D8CFC68(v41, v65);
    sub_22D8D4064(v41, &qword_255DA0180);
  }
  else
  {
    v42 = a1 + *(int *)(v18 + 36);
    v38 = v77;
    v88 = v77;
    MEMORY[0x22E31B14C](MEMORY[0x24BDF5578], v7, &v88);
    v43 = (uint64_t)v72;
    sub_22D8CFBF4(v42, v7, (uint64_t)v72);
    v44 = v73;
    sub_22D8CDC24(v43, v7, (uint64_t)v73);
    sub_22D8D3948();
    sub_22D8CFD2C((uint64_t)v44, v22, v7);
    v45 = (void (*)(_QWORD *, uint64_t))*((_QWORD *)v74 + 1);
    v45(v44, v7);
    v45((_QWORD *)v43, v7);
  }
  v58 = v79;
  v57 = v80;
  v59 = v78;
  v60 = sub_22D8D3948();
  v87 = v38;
  v61 = MEMORY[0x22E31B14C](MEMORY[0x24BDF5578], v7, &v87);
  v86[0] = v60;
  v86[1] = v61;
  MEMORY[0x22E31B14C](MEMORY[0x24BDEF3E0], v58, v86);
  sub_22D8CDC24((uint64_t)v27, v58, v57);
  return (*(uint64_t (**)(char *, uint64_t))(v59 + 8))(v27, v58);
}

uint64_t sub_22D8D0E48@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  char *v7;
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
  uint64_t v18;
  _QWORD *v19;
  void *v20;
  void *v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  ValueMetadata *v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  ValueMetadata *v41;
  char *v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  char v51;
  uint64_t v53;
  char v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  _QWORD *v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  unint64_t v62;
  uint64_t OpaqueTypeConformance2;
  unint64_t v64;
  uint64_t v65;
  uint64_t v66;
  _QWORD v67[3];
  unint64_t v68;
  uint64_t v69;
  uint64_t v70;
  id v71;
  _QWORD *v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  uint64_t v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  ValueMetadata *v86;
  uint64_t (*v87)(uint64_t, uint64_t, uint64_t, uint64_t);
  unint64_t v88;
  unint64_t v89;
  unint64_t v90;
  unint64_t v91;
  uint64_t v92;
  uint64_t v93;

  v3 = v2;
  v83 = a2;
  v79 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DA0228);
  v5 = MEMORY[0x24BDAC7A8](v79);
  v7 = (char *)v67 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *(_QWORD *)(a1 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  MEMORY[0x24BDAC7A8](v5);
  v80 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DA01C8);
  v76 = *(_QWORD *)(v80 - 8);
  MEMORY[0x24BDAC7A8](v80);
  v11 = (char *)v67 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v81 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DA0230);
  v78 = *(_QWORD *)(v81 - 8);
  v12 = MEMORY[0x24BDAC7A8](v81);
  v75 = (char *)v67 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v77 = (char *)v67 - v14;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DA01C0);
  MEMORY[0x24BDAC7A8](v15);
  v82 = (char *)v67 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DA0238);
  MEMORY[0x24BDAC7A8](v17);
  v19 = (_QWORD *)((char *)v67 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (*(_BYTE *)(v3 + 40))
  {
    v72 = v7;
    v73 = v17;
    v74 = v15;
    sub_22D8D19A4();
    v21 = v20;
    v23 = v3 + *(int *)(a1 + 40);
    if ((v22 & 1) != 0)
    {
      v53 = *(_QWORD *)v23;
      v54 = *(_BYTE *)(v23 + 8);
      sub_22D8CE69C(*(_QWORD *)v23, v54);
      sub_22D8DE900(v53, v54, &v86);
      sub_22D8CC628(v53, v54);
      v55 = v86;
      (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))((char *)v67 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v3, a1);
      v56 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
      v57 = swift_allocObject();
      *(_OWORD *)(v57 + 16) = *(_OWORD *)(a1 + 16);
      (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v57 + v56, (char *)v67 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
      *(_QWORD *)(v57 + ((v9 + v56 + 7) & 0xFFFFFFFFFFFFFFF8)) = v21;
      v58 = v72;
      *v72 = v55;
      v58[1] = sub_22D8D3FB8;
      v58[2] = v57;
      swift_storeEnumTagMultiPayload();
      v59 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255DA01D0);
      v60 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255DA01D8);
      v61 = sub_22D8D3A64();
      v62 = sub_22D8D3C50();
      v86 = &type metadata for AddPassButtonView;
      v87 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v60;
      v88 = v61;
      v89 = v62;
      OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
      v64 = sub_22D8D3CD4();
      v65 = sub_22D8D3D18(&qword_255DA0200, &qword_255DA01D0, MEMORY[0x24BDF5428]);
      v86 = (ValueMetadata *)v80;
      v87 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))MEMORY[0x24BEE0D00];
      v88 = v59;
      v89 = MEMORY[0x24BDF1FA8];
      v90 = OpaqueTypeConformance2;
      v91 = v64;
      v92 = v65;
      v93 = MEMORY[0x24BDF1F80];
      swift_getOpaqueTypeConformance2();
      v46 = (uint64_t)v82;
      sub_22D8E6E24();
    }
    else
    {
      v24 = *(_QWORD *)v23;
      v71 = v20;
      v25 = *(_BYTE *)(v23 + 8);
      sub_22D8CE69C(v24, v25);
      sub_22D8DE900(v24, v25, &v86);
      sub_22D8CC628(v24, v25);
      v26 = (ValueMetadata *)v86;
      (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))((char *)v67 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), v3, a1);
      v27 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
      v28 = swift_allocObject();
      *(_OWORD *)(v28 + 16) = *(_OWORD *)(a1 + 16);
      (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v28 + v27, (char *)v67 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
      v86 = v26;
      v87 = sub_22D8D41B8;
      v88 = v28;
      sub_22D8D01BC();
      swift_retain();
      v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DA01D8);
      v30 = sub_22D8D3A64();
      v68 = sub_22D8D3C50();
      v67[2] = v30;
      sub_22D8E6EF0();
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      v70 = sub_22D8D026C();
      v69 = v31;
      v32 = (void *)objc_opt_self();
      v33 = (void *)sub_22D8E701C();
      v34 = objc_msgSend(v32, sel_localizedDeletableWalletStringFor_, v33);

      v35 = sub_22D8E7040();
      v37 = v36;

      v67[1] = v67;
      v84 = v35;
      v85 = v37;
      v39 = MEMORY[0x24BDAC7A8](v38);
      MEMORY[0x24BDAC7A8](v39);
      v67[0] = __swift_instantiateConcreteTypeFromMangledName(&qword_255DA01D0);
      v86 = &type metadata for AddPassButtonView;
      v87 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v29;
      v88 = v30;
      v89 = v68;
      v68 = swift_getOpaqueTypeConformance2();
      v40 = sub_22D8D3CD4();
      v66 = sub_22D8D3D18(&qword_255DA0200, &qword_255DA01D0, MEMORY[0x24BDF5428]);
      v41 = (ValueMetadata *)v80;
      v42 = v75;
      sub_22D8E6F08();
      swift_bridgeObjectRelease();
      swift_release();
      swift_release();
      (*(void (**)(char *, ValueMetadata *))(v76 + 8))(v11, v41);
      v43 = v77;
      v44 = v78;
      v45 = v81;
      (*(void (**)(char *, char *, uint64_t))(v78 + 32))(v77, v42, v81);
      (*(void (**)(_QWORD *, char *, uint64_t))(v44 + 16))(v72, v43, v45);
      swift_storeEnumTagMultiPayload();
      v86 = v41;
      v87 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))MEMORY[0x24BEE0D00];
      v88 = v67[0];
      v89 = MEMORY[0x24BDF1FA8];
      v90 = v68;
      v91 = v40;
      v92 = v66;
      v93 = MEMORY[0x24BDF1F80];
      swift_getOpaqueTypeConformance2();
      v46 = (uint64_t)v82;
      sub_22D8E6E24();
      sub_22D8D45F0(v71, 0);
      (*(void (**)(char *, uint64_t))(v44 + 8))(v43, v45);
    }
    sub_22D8D401C(v46, (uint64_t)v19);
    swift_storeEnumTagMultiPayload();
    sub_22D8D3A64();
    sub_22D8D3B14();
    sub_22D8E6E24();
    return sub_22D8D4064(v46, &qword_255DA01C0);
  }
  else
  {
    v47 = *(_QWORD *)(v3 + 8);
    v48 = *(void **)v3;
    v49 = v3 + *(int *)(a1 + 40);
    v50 = *(_QWORD *)v49;
    v51 = *(_BYTE *)(v49 + 8);
    sub_22D8D0140(*(void **)v3, v47, *(_QWORD *)(v3 + 16), *(_QWORD *)(v3 + 24), *(_QWORD *)(v3 + 32), 0);
    sub_22D8CE69C(v50, v51);
    sub_22D8DE900(v50, v51, &v86);
    sub_22D8CC628(v50, v51);
    *v19 = v86;
    v19[1] = v48;
    v19[2] = v47;
    swift_storeEnumTagMultiPayload();
    sub_22D8D3A64();
    sub_22D8D3B14();
    return sub_22D8E6E24();
  }
}

_BYTE *sub_22D8D1728(_BYTE *result, _BYTE *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (*result == 1 && (*a2 & 1) == 0)
  {
    type metadata accessor for AddPassToWalletButton_iOS(0, a4, a5, a4);
    return (_BYTE *)sub_22D8D03C4();
  }
  return result;
}

uint64_t sub_22D8D1774(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  sub_22D8E70A0();
  v3[5] = sub_22D8E7094();
  sub_22D8E7088();
  return swift_task_switch();
}

uint64_t sub_22D8D17E4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)(v0 + 32);
  v2 = *(_QWORD *)(v0 + 24);
  swift_release();
  v4 = type metadata accessor for AddPassToWalletButton_iOS(0, v2, v1, v3);
  sub_22D8D1834(v4);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_22D8D1834(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v9;

  v3 = *(_QWORD *)(a1 + 16);
  v4 = sub_22D8E7124();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v9 - v6;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)&v9 - v6, v1 + *(int *)(a1 + 36), v4);
  LODWORD(v3) = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 48))(v7, 1, v3);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  if ((_DWORD)v3 != 1)
    __asm { BR              X10 }
  return sub_22D8D0318();
}

void sub_22D8D19A4()
{
  __asm { BR              X10 }
}

uint64_t sub_22D8D19E8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  swift_bridgeObjectRetain();
  swift_retain();
  v4 = sub_22D8DC688(v3, v2, v0, v1);
  swift_bridgeObjectRelease();
  swift_release();
  return v4;
}

void sub_22D8D1AD0()
{
  sub_22D8E7184();
  __break(1u);
}

uint64_t sub_22D8D1B0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v5;
  uint64_t v6;

  v5 = objc_msgSend((id)objc_opt_self(), sel_passbookHasBeenDeleted);
  type metadata accessor for AddPassToWalletButton_iOS(0, a2, a3, v6);
  if (v5)
    return sub_22D8D0214();
  else
    return sub_22D8CCC94();
}

void sub_22D8D1B7C(uint64_t a1)
{
  __asm { BR              X10 }
}

uint64_t sub_22D8D1BC0(uint64_t a1)
{
  uint64_t v1;
  void (*v2)(uint64_t, uint64_t);

  v2 = *(void (**)(uint64_t, uint64_t))(a1 + 24);
  swift_retain();
  v2(v1, 1);
  return swift_release();
}

uint64_t AddPassToWalletButton<>.init(action:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(_QWORD *)a3 = result;
  *(_QWORD *)(a3 + 8) = a2;
  *(_QWORD *)(a3 + 24) = 0;
  *(_QWORD *)(a3 + 32) = 0;
  *(_QWORD *)(a3 + 16) = 0;
  *(_WORD *)(a3 + 40) = 256;
  return result;
}

uint64_t sub_22D8D1C1C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_22D8D1C50()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_22D8D1C58()
{
  uint64_t result;
  unint64_t v1;

  result = sub_22D8E7124();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

char *sub_22D8D1CD0(char *a1, char **a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  size_t v8;
  int v9;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  void *v20;
  const void *v21;
  size_t __n;
  uint64_t v24;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v6 = *(_DWORD *)(v5 + 80);
  v7 = v6;
  v8 = *(_QWORD *)(v5 + 64);
  if (!*(_DWORD *)(v5 + 84))
    ++v8;
  v9 = v6 & 0x100000;
  if (v7 > 7 || v9 != 0 || ((v7 + 41) & ~v7) + v8 > 0x18)
  {
    v12 = *a2;
    *(_QWORD *)a1 = *a2;
    a1 = &v12[(v7 & 0xF8 ^ 0x1F8) & (v7 + 16)];
    swift_retain();
  }
  else
  {
    __n = v8;
    v13 = *a2;
    v14 = (uint64_t)a2[1];
    v24 = *(_QWORD *)(a3 + 16);
    v15 = (uint64_t)a2[2];
    v16 = (uint64_t)a2[3];
    v17 = (uint64_t)a2[4];
    v18 = *((_BYTE *)a2 + 40);
    sub_22D8D0140(*a2, v14, v15, v16, v17, v18);
    *(_QWORD *)a1 = v13;
    *((_QWORD *)a1 + 1) = v14;
    *((_QWORD *)a1 + 2) = v15;
    *((_QWORD *)a1 + 3) = v16;
    *((_QWORD *)a1 + 4) = v17;
    a1[40] = v18;
    v19 = (uint64_t)a2 + v7;
    v20 = (void *)((unint64_t)&a1[v7 + 41] & ~v7);
    v21 = (const void *)((v19 + 41) & ~v7);
    if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v5 + 48))(v21, 1, v24))
    {
      memcpy(v20, v21, __n);
    }
    else
    {
      (*(void (**)(void *, const void *, uint64_t))(v5 + 16))(v20, v21, v24);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v5 + 56))(v20, 0, 1, v24);
    }
  }
  return a1;
}

uint64_t sub_22D8D1E38(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t result;

  sub_22D8CC5B0(*(void **)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 40));
  v4 = *(_QWORD *)(a2 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = (a1 + *(unsigned __int8 *)(v5 + 80) + 41) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v5 + 48))(v6, 1, v4);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(unint64_t, uint64_t))(v5 + 8))(v6, v4);
  return result;
}

uint64_t sub_22D8D1EC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const void *v16;
  size_t v17;

  v6 = *(void **)a2;
  v7 = *(_QWORD *)(a2 + 8);
  v8 = *(_QWORD *)(a2 + 16);
  v9 = *(_QWORD *)(a2 + 24);
  v10 = *(_QWORD *)(a2 + 32);
  v11 = *(_BYTE *)(a2 + 40);
  sub_22D8D0140(*(void **)a2, v7, v8, v9, v10, v11);
  *(_QWORD *)a1 = v6;
  *(_QWORD *)(a1 + 8) = v7;
  *(_QWORD *)(a1 + 16) = v8;
  *(_QWORD *)(a1 + 24) = v9;
  *(_QWORD *)(a1 + 32) = v10;
  *(_BYTE *)(a1 + 40) = v11;
  v12 = *(_QWORD *)(a3 + 16);
  v13 = *(_QWORD *)(v12 - 8);
  v14 = *(unsigned __int8 *)(v13 + 80);
  v15 = (void *)((v14 + 41 + a1) & ~v14);
  v16 = (const void *)((v14 + 41 + a2) & ~v14);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v13 + 48))(v16, 1, v12))
  {
    if (*(_DWORD *)(v13 + 84))
      v17 = *(_QWORD *)(v13 + 64);
    else
      v17 = *(_QWORD *)(v13 + 64) + 1;
    memcpy(v15, v16, v17);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v13 + 16))(v15, v16, v12);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v15, 0, 1, v12);
  }
  return a1;
}

uint64_t sub_22D8D1FC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t (*v23)(void *, uint64_t, uint64_t);
  int v24;
  size_t v25;

  v6 = *(void **)a2;
  v7 = *(_QWORD *)(a2 + 8);
  v8 = *(_QWORD *)(a2 + 16);
  v9 = *(_QWORD *)(a2 + 24);
  v10 = *(_QWORD *)(a2 + 32);
  v11 = *(_BYTE *)(a2 + 40);
  sub_22D8D0140(*(void **)a2, v7, v8, v9, v10, v11);
  v12 = *(void **)a1;
  v13 = *(_QWORD *)(a1 + 8);
  v14 = *(_QWORD *)(a1 + 16);
  v15 = *(_QWORD *)(a1 + 24);
  v16 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)a1 = v6;
  *(_QWORD *)(a1 + 8) = v7;
  *(_QWORD *)(a1 + 16) = v8;
  *(_QWORD *)(a1 + 24) = v9;
  *(_QWORD *)(a1 + 32) = v10;
  v17 = *(_BYTE *)(a1 + 40);
  *(_BYTE *)(a1 + 40) = v11;
  sub_22D8CC5B0(v12, v13, v14, v15, v16, v17);
  v18 = *(_QWORD *)(a3 + 16);
  v19 = *(_QWORD *)(v18 - 8);
  v20 = *(unsigned __int8 *)(v19 + 80);
  v21 = (void *)((v20 + 41 + a1) & ~v20);
  v22 = (void *)((v20 + 41 + a2) & ~v20);
  v23 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v19 + 48);
  LODWORD(v7) = v23(v21, 1, v18);
  v24 = v23(v22, 1, v18);
  if ((_DWORD)v7)
  {
    if (!v24)
    {
      (*(void (**)(void *, void *, uint64_t))(v19 + 16))(v21, v22, v18);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v19 + 56))(v21, 0, 1, v18);
      return a1;
    }
  }
  else
  {
    if (!v24)
    {
      (*(void (**)(void *, void *, uint64_t))(v19 + 24))(v21, v22, v18);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v19 + 8))(v21, v18);
  }
  if (*(_DWORD *)(v19 + 84))
    v25 = *(_QWORD *)(v19 + 64);
  else
    v25 = *(_QWORD *)(v19 + 64) + 1;
  memcpy(v21, v22, v25);
  return a1;
}

_OWORD *sub_22D8D2128(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const void *v9;
  size_t v10;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  *(_OWORD *)((char *)a1 + 25) = *(_OWORD *)((char *)a2 + 25);
  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(unsigned __int8 *)(v6 + 80);
  v8 = (void *)(((unint64_t)a1 + v7 + 41) & ~v7);
  v9 = (const void *)(((unint64_t)a2 + v7 + 41) & ~v7);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v6 + 48))(v9, 1, v5))
  {
    if (*(_DWORD *)(v6 + 84))
      v10 = *(_QWORD *)(v6 + 64);
    else
      v10 = *(_QWORD *)(v6 + 64) + 1;
    memcpy(v8, v9, v10);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v6 + 32))(v8, v9, v5);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v6 + 56))(v8, 0, 1, v5);
  }
  return a1;
}

uint64_t sub_22D8D21EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  char v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t (*v20)(void *, uint64_t, uint64_t);
  int v21;
  int v22;
  size_t v23;

  v6 = *(_QWORD *)(a2 + 32);
  v7 = *(_BYTE *)(a2 + 40);
  v8 = *(void **)a1;
  v9 = *(_QWORD *)(a1 + 8);
  v10 = *(_QWORD *)(a1 + 16);
  v11 = *(_QWORD *)(a1 + 24);
  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v13;
  *(_QWORD *)(a1 + 32) = v6;
  v14 = *(_BYTE *)(a1 + 40);
  *(_BYTE *)(a1 + 40) = v7;
  sub_22D8CC5B0(v8, v9, v10, v11, v12, v14);
  v15 = *(_QWORD *)(a3 + 16);
  v16 = *(_QWORD *)(v15 - 8);
  v17 = *(unsigned __int8 *)(v16 + 80);
  v18 = (void *)((v17 + 41 + a1) & ~v17);
  v19 = (void *)((v17 + 41 + a2) & ~v17);
  v20 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v16 + 48);
  v21 = v20(v18, 1, v15);
  v22 = v20(v19, 1, v15);
  if (v21)
  {
    if (!v22)
    {
      (*(void (**)(void *, void *, uint64_t))(v16 + 32))(v18, v19, v15);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v18, 0, 1, v15);
      return a1;
    }
  }
  else
  {
    if (!v22)
    {
      (*(void (**)(void *, void *, uint64_t))(v16 + 40))(v18, v19, v15);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v16 + 8))(v18, v15);
  }
  if (*(_DWORD *)(v16 + 84))
    v23 = *(_QWORD *)(v16 + 64);
  else
    v23 = *(_QWORD *)(v16 + 64) + 1;
  memcpy(v18, v19, v23);
  return a1;
}

uint64_t sub_22D8D2320(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  int v5;
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  char v12;
  int v13;
  unsigned int v15;
  int v16;
  unsigned int v17;
  unsigned int v18;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  if (v5)
    v6 = v5 - 1;
  else
    v6 = 0;
  if (v6 <= 0xFC)
    v7 = 252;
  else
    v7 = v6;
  if (v5)
    v8 = *(_QWORD *)(v4 + 64);
  else
    v8 = *(_QWORD *)(v4 + 64) + 1;
  if (!a2)
    return 0;
  v9 = *(unsigned __int8 *)(v4 + 80);
  v10 = a2 - v7;
  if (a2 <= v7)
    goto LABEL_28;
  v11 = v8 + ((v9 + 41) & ~v9);
  v12 = 8 * v11;
  if (v11 <= 3)
  {
    v15 = ((v10 + ~(-1 << v12)) >> v12) + 1;
    if (HIWORD(v15))
    {
      v13 = *(_DWORD *)(a1 + v11);
      if (!v13)
        goto LABEL_28;
      goto LABEL_21;
    }
    if (v15 > 0xFF)
    {
      v13 = *(unsigned __int16 *)(a1 + v11);
      if (!*(_WORD *)(a1 + v11))
        goto LABEL_28;
      goto LABEL_21;
    }
    if (v15 < 2)
    {
LABEL_28:
      if (v6 > 0xFC)
      {
        v18 = (*(uint64_t (**)(uint64_t))(v4 + 48))((a1 + v9 + 41) & ~v9);
        if (v18 >= 2)
          return v18 - 1;
        else
          return 0;
      }
      else
      {
        v17 = *(unsigned __int8 *)(a1 + 40);
        if (v17 > 3)
          return (v17 ^ 0xFF) + 1;
        else
          return 0;
      }
    }
  }
  v13 = *(unsigned __int8 *)(a1 + v11);
  if (!*(_BYTE *)(a1 + v11))
    goto LABEL_28;
LABEL_21:
  v16 = (v13 - 1) << v12;
  if (v11 > 3)
    v16 = 0;
  if ((_DWORD)v11)
  {
    if (v11 > 3)
      LODWORD(v11) = 4;
    __asm { BR              X12 }
  }
  return v7 + v16 + 1;
}

void sub_22D8D249C(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  unsigned int v6;
  uint64_t v7;
  int v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  size_t v12;
  BOOL v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  int v17;

  v6 = 0;
  v7 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  v8 = *(_DWORD *)(v7 + 84);
  if (v8)
    v9 = v8 - 1;
  else
    v9 = 0;
  if (v9 <= 0xFC)
    v10 = 252;
  else
    v10 = v9;
  v11 = *(_QWORD *)(v7 + 64);
  if (!v8)
    ++v11;
  v12 = ((*(unsigned __int8 *)(v7 + 80) + 41) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80)) + v11;
  v13 = a3 >= v10;
  v14 = a3 - v10;
  if (v14 != 0 && v13)
  {
    if (v12 > 3)
    {
      v6 = 1u;
      if (v10 < a2)
        goto LABEL_19;
      goto LABEL_26;
    }
    v15 = ((v14 + ~(-1 << (8 * v12))) >> (8 * v12)) + 1;
    if (HIWORD(v15))
    {
      v6 = 4u;
      if (v10 < a2)
      {
LABEL_19:
        v16 = ~v10 + a2;
        if (v12 < 4)
        {
          if ((_DWORD)v12)
          {
            v17 = v16 & ~(-1 << (8 * v12));
            bzero(a1, v12);
            if ((_DWORD)v12 == 3)
            {
              *a1 = v17;
              *((_BYTE *)a1 + 2) = BYTE2(v17);
            }
            else if ((_DWORD)v12 == 2)
            {
              *a1 = v17;
            }
            else
            {
              *(_BYTE *)a1 = v17;
            }
          }
        }
        else
        {
          bzero(a1, v12);
          *(_DWORD *)a1 = v16;
        }
        __asm { BR              X10 }
      }
LABEL_26:
      __asm { BR              X15 }
    }
    if (v15 >= 0x100)
      v6 = 2;
    else
      v6 = v15 > 1;
  }
  if (v10 < a2)
    goto LABEL_19;
  goto LABEL_26;
}

void sub_22D8D2708()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  *(_BYTE *)(v0 + v1) = v2;
}

void sub_22D8D2710()
{
  uint64_t v0;
  uint64_t v1;
  __int16 v2;

  *(_WORD *)(v0 + v1) = v2;
}

void sub_22D8D2730()
{
  uint64_t v0;
  int v1;

  *(_WORD *)v0 = v1;
  *(_BYTE *)(v0 + 2) = BYTE2(v1);
}

void sub_22D8D2740()
{
  _WORD *v0;
  __int16 v1;

  *v0 = v1;
}

void sub_22D8D2748()
{
  _DWORD *v0;
  int v1;

  *v0 = v1;
}

uint64_t type metadata accessor for AddPassToWalletButton(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for AddPassToWalletButton);
}

void sub_22D8D2760(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  type metadata accessor for AddPassToWalletButton_iOS(255, *a1, a1[1], a4);
  JUMPOUT(0x22E31B14CLL);
}

void *destroy for AddPassToWalletSheet(uint64_t a1)
{
  return sub_22D8CC5B0(*(void **)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 40));
}

uint64_t initializeWithCopy for AddPassToWalletSheet(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  v3 = *(void **)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a2 + 32);
  v8 = *(_BYTE *)(a2 + 40);
  sub_22D8D0140(*(void **)a2, v4, v5, v6, v7, v8);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  *(_BYTE *)(a1 + 40) = v8;
  return a1;
}

uint64_t assignWithCopy for AddPassToWalletSheet(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;

  v3 = *(void **)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a2 + 32);
  v8 = *(_BYTE *)(a2 + 40);
  sub_22D8D0140(*(void **)a2, v4, v5, v6, v7, v8);
  v9 = *(void **)a1;
  v10 = *(_QWORD *)(a1 + 8);
  v11 = *(_QWORD *)(a1 + 16);
  v12 = *(_QWORD *)(a1 + 24);
  v13 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  v14 = *(_BYTE *)(a1 + 40);
  *(_BYTE *)(a1 + 40) = v8;
  sub_22D8CC5B0(v9, v10, v11, v12, v13, v14);
  return a1;
}

__n128 __swift_memcpy41_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for AddPassToWalletSheet(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  char v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  char v11;

  v3 = *(_QWORD *)(a2 + 32);
  v4 = *(_BYTE *)(a2 + 40);
  v5 = *(void **)a1;
  v7 = *(_QWORD *)(a1 + 8);
  v6 = *(_QWORD *)(a1 + 16);
  v8 = *(_QWORD *)(a1 + 24);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v10;
  *(_QWORD *)(a1 + 32) = v3;
  v11 = *(_BYTE *)(a1 + 40);
  *(_BYTE *)(a1 + 40) = v4;
  sub_22D8CC5B0(v5, v7, v6, v8, v9, v11);
  return a1;
}

uint64_t getEnumTagSinglePayload for AddPassToWalletSheet(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFD && *(_BYTE *)(a1 + 41))
    return (*(_DWORD *)a1 + 253);
  v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 <= 3)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for AddPassToWalletSheet(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 40) = 0;
    *(_QWORD *)result = a2 - 253;
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 41) = 1;
  }
  else
  {
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 41) = 0;
    if (a2)
      *(_BYTE *)(result + 40) = -(char)a2;
  }
  return result;
}

uint64_t sub_22D8D2998(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 40);
}

uint64_t sub_22D8D29A0(uint64_t result, char a2)
{
  *(_BYTE *)(result + 40) = a2;
  return result;
}

ValueMetadata *type metadata accessor for AddPassToWalletSheet()
{
  return &type metadata for AddPassToWalletSheet;
}

uint64_t sub_22D8D29B8()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_22D8D29C0()
{
  uint64_t result;
  unint64_t v1;

  result = sub_22D8E7124();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

char *sub_22D8D2A50(char *a1, char **a2, uint64_t a3)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  size_t v7;
  int v8;
  char *v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  char *v20;
  char *v21;
  size_t v22;
  char *v23;
  char *v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  char v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v38;
  size_t __n;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 80);
  v6 = v5;
  v7 = *(_QWORD *)(v4 + 64);
  if (!*(_DWORD *)(v4 + 84))
    ++v7;
  v8 = v5 & 0x100000;
  if (v6 > 7
    || v8 != 0
    || ((((((((v7 + ((v6 + 41) & ~v6) + 23) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)
       + 23) & 0xFFFFFFFFFFFFFFF8)
     + 16 > 0x18)
  {
    v11 = *a2;
    *(_QWORD *)a1 = *a2;
    v14 = &v11[(v6 & 0xF8 ^ 0x1F8) & (v6 + 16)];
  }
  else
  {
    v38 = *(_QWORD *)(a3 + 16);
    __n = v7;
    v13 = *a2;
    v12 = (uint64_t)a2[1];
    v14 = a1;
    v15 = (uint64_t)a2[2];
    v16 = (uint64_t)a2[3];
    v17 = (uint64_t)a2[4];
    v18 = *((_BYTE *)a2 + 40);
    sub_22D8D0140(*a2, v12, v15, v16, v17, v18);
    *(_QWORD *)v14 = v13;
    *((_QWORD *)v14 + 1) = v12;
    *((_QWORD *)v14 + 2) = v15;
    *((_QWORD *)v14 + 3) = v16;
    *((_QWORD *)v14 + 4) = v17;
    v14[40] = v18;
    v19 = (uint64_t)a2 + v6;
    v20 = (char *)((unint64_t)&v14[v6 + 41] & ~v6);
    v21 = (char *)((v19 + 41) & ~v6);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v21, 1, v38))
    {
      v22 = __n;
      memcpy(v20, v21, __n);
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v20, v21, v38);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v4 + 56))(v20, 0, 1, v38);
      v22 = __n;
    }
    v23 = &v20[v22];
    v24 = &v21[v22];
    v25 = (unint64_t)(v23 + 7) & 0xFFFFFFFFFFFFFFF8;
    v26 = (unint64_t)(v24 + 7) & 0xFFFFFFFFFFFFFFF8;
    v27 = *(_QWORD *)v26;
    v28 = *(_BYTE *)(v26 + 8);
    sub_22D8CE69C(*(_QWORD *)v26, v28);
    *(_QWORD *)v25 = v27;
    *(_BYTE *)(v25 + 8) = v28;
    v29 = (unint64_t)(v23 + 23) & 0xFFFFFFFFFFFFFFF8;
    v30 = (unint64_t)(v24 + 23) & 0xFFFFFFFFFFFFFFF8;
    *(_BYTE *)v29 = *(_BYTE *)v30;
    *(_QWORD *)(v29 + 8) = *(_QWORD *)(v30 + 8);
    v31 = (v29 + 23) & 0xFFFFFFFFFFFFFFF8;
    v32 = (v30 + 23) & 0xFFFFFFFFFFFFFFF8;
    *(_BYTE *)v31 = *(_BYTE *)v32;
    *(_QWORD *)(v31 + 8) = *(_QWORD *)(v32 + 8);
    v33 = (v31 + 23) & 0xFFFFFFFFFFFFFFF8;
    v34 = (v32 + 23) & 0xFFFFFFFFFFFFFFF8;
    *(_BYTE *)v33 = *(_BYTE *)v34;
    *(_QWORD *)(v33 + 8) = *(_QWORD *)(v34 + 8);
    v35 = (v33 + 23) & 0xFFFFFFFFFFFFFFF8;
    v36 = (v34 + 23) & 0xFFFFFFFFFFFFFFF8;
    *(_BYTE *)v35 = *(_BYTE *)v36;
    *(_QWORD *)(v35 + 8) = *(_QWORD *)(v36 + 8);
    swift_retain();
    swift_retain();
    swift_retain();
  }
  swift_retain();
  return v14;
}

uint64_t sub_22D8D2CB0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;

  sub_22D8CC5B0(*(void **)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_BYTE *)(a1 + 40));
  v4 = *(_QWORD *)(a2 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = (a1 + *(unsigned __int8 *)(v5 + 80) + 41) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  if (!(*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v5 + 48))(v6, 1, v4))
    (*(void (**)(unint64_t, uint64_t))(v5 + 8))(v6, v4);
  v7 = *(_QWORD *)(v5 + 64);
  if (*(_DWORD *)(v5 + 84))
    v8 = v7 + v6;
  else
    v8 = v7 + v6 + 1;
  sub_22D8CC628(*(_QWORD *)((v8 + 7) & 0xFFFFFFFFFFFFFFF8), *(_BYTE *)(((v8 + 7) & 0xFFFFFFFFFFFFFFF8) + 8));
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_22D8D2D90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  int v17;
  size_t v18;
  size_t v19;
  size_t v20;
  char *v21;
  char *v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  char v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;

  v6 = *(void **)a2;
  v7 = *(_QWORD *)(a2 + 8);
  v8 = *(_QWORD *)(a2 + 16);
  v9 = *(_QWORD *)(a2 + 24);
  v10 = *(_QWORD *)(a2 + 32);
  v11 = *(_BYTE *)(a2 + 40);
  sub_22D8D0140(*(void **)a2, v7, v8, v9, v10, v11);
  *(_QWORD *)a1 = v6;
  *(_QWORD *)(a1 + 8) = v7;
  *(_QWORD *)(a1 + 16) = v8;
  *(_QWORD *)(a1 + 24) = v9;
  *(_QWORD *)(a1 + 32) = v10;
  *(_BYTE *)(a1 + 40) = v11;
  v12 = *(_QWORD *)(a3 + 16);
  v13 = *(_QWORD *)(v12 - 8);
  v14 = *(unsigned __int8 *)(v13 + 80);
  v15 = (char *)((v14 + 41 + a1) & ~v14);
  v16 = (char *)((v14 + 41 + a2) & ~v14);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v16, 1, v12))
  {
    v17 = *(_DWORD *)(v13 + 84);
    v18 = *(_QWORD *)(v13 + 64);
    if (v17)
      v19 = v18;
    else
      v19 = v18 + 1;
    memcpy(v15, v16, v19);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v15, v16, v12);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v15, 0, 1, v12);
    v17 = *(_DWORD *)(v13 + 84);
    v18 = *(_QWORD *)(v13 + 64);
  }
  if (v17)
    v20 = v18;
  else
    v20 = v18 + 1;
  v21 = &v15[v20];
  v22 = &v16[v20];
  v23 = (unint64_t)&v15[v20 + 7] & 0xFFFFFFFFFFFFFFF8;
  v24 = (unint64_t)&v16[v20 + 7] & 0xFFFFFFFFFFFFFFF8;
  v25 = *(_QWORD *)v24;
  v26 = *(_BYTE *)(v24 + 8);
  sub_22D8CE69C(*(_QWORD *)v24, v26);
  *(_QWORD *)v23 = v25;
  *(_BYTE *)(v23 + 8) = v26;
  v27 = (unint64_t)(v21 + 23) & 0xFFFFFFFFFFFFFFF8;
  v28 = (unint64_t)(v22 + 23) & 0xFFFFFFFFFFFFFFF8;
  *(_BYTE *)v27 = *(_BYTE *)v28;
  *(_QWORD *)(v27 + 8) = *(_QWORD *)(v28 + 8);
  v29 = (v27 + 23) & 0xFFFFFFFFFFFFFFF8;
  v30 = (v28 + 23) & 0xFFFFFFFFFFFFFFF8;
  *(_BYTE *)v29 = *(_BYTE *)v30;
  *(_QWORD *)(v29 + 8) = *(_QWORD *)(v30 + 8);
  v31 = (v29 + 23) & 0xFFFFFFFFFFFFFFF8;
  v32 = (v30 + 23) & 0xFFFFFFFFFFFFFFF8;
  *(_BYTE *)v31 = *(_BYTE *)v32;
  *(_QWORD *)(v31 + 8) = *(_QWORD *)(v32 + 8);
  v33 = (v31 + 23) & 0xFFFFFFFFFFFFFFF8;
  v34 = (v32 + 23) & 0xFFFFFFFFFFFFFFF8;
  *(_BYTE *)v33 = *(_BYTE *)v34;
  *(_QWORD *)(v33 + 8) = *(_QWORD *)(v34 + 8);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_22D8D2F78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t (*v23)(char *, uint64_t, uint64_t);
  int v24;
  size_t v25;
  uint64_t v26;
  char *v27;
  char *v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  char v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;

  v6 = *(void **)a2;
  v7 = *(_QWORD *)(a2 + 8);
  v8 = *(_QWORD *)(a2 + 16);
  v9 = *(_QWORD *)(a2 + 24);
  v10 = *(_QWORD *)(a2 + 32);
  v11 = *(_BYTE *)(a2 + 40);
  sub_22D8D0140(*(void **)a2, v7, v8, v9, v10, v11);
  v12 = *(void **)a1;
  v13 = *(_QWORD *)(a1 + 8);
  v14 = *(_QWORD *)(a1 + 16);
  v15 = *(_QWORD *)(a1 + 24);
  v16 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)a1 = v6;
  *(_QWORD *)(a1 + 8) = v7;
  *(_QWORD *)(a1 + 16) = v8;
  *(_QWORD *)(a1 + 24) = v9;
  *(_QWORD *)(a1 + 32) = v10;
  v17 = *(_BYTE *)(a1 + 40);
  *(_BYTE *)(a1 + 40) = v11;
  sub_22D8CC5B0(v12, v13, v14, v15, v16, v17);
  v18 = *(_QWORD *)(a3 + 16);
  v19 = *(_QWORD *)(v18 - 8);
  v20 = *(unsigned __int8 *)(v19 + 80);
  v21 = (char *)((v20 + 41 + a1) & ~v20);
  v22 = (char *)((v20 + 41 + a2) & ~v20);
  v23 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v19 + 48);
  LODWORD(v7) = v23(v21, 1, v18);
  v24 = v23(v22, 1, v18);
  if ((_DWORD)v7)
  {
    if (!v24)
    {
      (*(void (**)(char *, char *, uint64_t))(v19 + 16))(v21, v22, v18);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v19 + 56))(v21, 0, 1, v18);
      goto LABEL_10;
    }
  }
  else
  {
    if (!v24)
    {
      (*(void (**)(char *, char *, uint64_t))(v19 + 24))(v21, v22, v18);
      goto LABEL_10;
    }
    (*(void (**)(char *, uint64_t))(v19 + 8))(v21, v18);
  }
  if (*(_DWORD *)(v19 + 84))
    v25 = *(_QWORD *)(v19 + 64);
  else
    v25 = *(_QWORD *)(v19 + 64) + 1;
  memcpy(v21, v22, v25);
LABEL_10:
  if (*(_DWORD *)(v19 + 84))
    v26 = *(_QWORD *)(v19 + 64);
  else
    v26 = *(_QWORD *)(v19 + 64) + 1;
  v27 = &v21[v26];
  v28 = &v22[v26];
  v29 = (unint64_t)&v21[v26 + 7] & 0xFFFFFFFFFFFFFFF8;
  v30 = (unint64_t)&v22[v26 + 7] & 0xFFFFFFFFFFFFFFF8;
  v31 = *(_QWORD *)v30;
  v32 = *(_BYTE *)(v30 + 8);
  sub_22D8CE69C(*(_QWORD *)v30, v32);
  v33 = *(_QWORD *)v29;
  v34 = *(_BYTE *)(v29 + 8);
  *(_QWORD *)v29 = v31;
  *(_BYTE *)(v29 + 8) = v32;
  sub_22D8CC628(v33, v34);
  v35 = (unint64_t)(v27 + 23) & 0xFFFFFFFFFFFFFFF8;
  v36 = (unint64_t)(v28 + 23) & 0xFFFFFFFFFFFFFFF8;
  *(_BYTE *)v35 = *(_BYTE *)v36;
  *(_QWORD *)(v35 + 8) = *(_QWORD *)(v36 + 8);
  swift_retain();
  swift_release();
  v37 = (v35 + 23) & 0xFFFFFFFFFFFFFFF8;
  v38 = (v36 + 23) & 0xFFFFFFFFFFFFFFF8;
  *(_BYTE *)v37 = *(_BYTE *)v38;
  *(_QWORD *)(v37 + 8) = *(_QWORD *)(v38 + 8);
  swift_retain();
  swift_release();
  v39 = (v37 + 23) & 0xFFFFFFFFFFFFFFF8;
  v40 = (v38 + 23) & 0xFFFFFFFFFFFFFFF8;
  *(_BYTE *)v39 = *(_BYTE *)v40;
  *(_QWORD *)(v39 + 8) = *(_QWORD *)(v40 + 8);
  swift_retain();
  swift_release();
  v41 = (v39 + 23) & 0xFFFFFFFFFFFFFFF8;
  v42 = (v40 + 23) & 0xFFFFFFFFFFFFFFF8;
  *(_BYTE *)v41 = *(_BYTE *)v42;
  *(_QWORD *)(v41 + 8) = *(_QWORD *)(v42 + 8);
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *sub_22D8D31E8(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  int v10;
  size_t v11;
  size_t v12;
  size_t v13;
  char *v14;
  char *v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  _OWORD *v19;
  _OWORD *v20;
  _OWORD *v21;
  _OWORD *v22;
  _OWORD *v23;
  _OWORD *v24;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  *(_OWORD *)((char *)a1 + 25) = *(_OWORD *)((char *)a2 + 25);
  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(unsigned __int8 *)(v6 + 80);
  v8 = (char *)(((unint64_t)a1 + v7 + 41) & ~v7);
  v9 = (char *)(((unint64_t)a2 + v7 + 41) & ~v7);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v9, 1, v5))
  {
    v10 = *(_DWORD *)(v6 + 84);
    v11 = *(_QWORD *)(v6 + 64);
    if (v10)
      v12 = v11;
    else
      v12 = v11 + 1;
    memcpy(v8, v9, v12);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v9, v5);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v6 + 56))(v8, 0, 1, v5);
    v10 = *(_DWORD *)(v6 + 84);
    v11 = *(_QWORD *)(v6 + 64);
  }
  if (v10)
    v13 = v11;
  else
    v13 = v11 + 1;
  v14 = &v8[v13];
  v15 = &v9[v13];
  v16 = (unint64_t)(v14 + 7) & 0xFFFFFFFFFFFFFFF8;
  v17 = (unint64_t)(v15 + 7) & 0xFFFFFFFFFFFFFFF8;
  v18 = *(_QWORD *)v17;
  *(_BYTE *)(v16 + 8) = *(_BYTE *)(v17 + 8);
  *(_QWORD *)v16 = v18;
  v19 = (_OWORD *)((unint64_t)(v14 + 23) & 0xFFFFFFFFFFFFFFF8);
  v20 = (_OWORD *)((unint64_t)(v15 + 23) & 0xFFFFFFFFFFFFFFF8);
  *v19 = *v20;
  v21 = (_OWORD *)(((unint64_t)v19 + 23) & 0xFFFFFFFFFFFFFFF8);
  v22 = (_OWORD *)(((unint64_t)v20 + 23) & 0xFFFFFFFFFFFFFFF8);
  *v21 = *v22;
  v23 = (_OWORD *)(((unint64_t)v21 + 23) & 0xFFFFFFFFFFFFFFF8);
  v24 = (_OWORD *)(((unint64_t)v22 + 23) & 0xFFFFFFFFFFFFFFF8);
  *v23 = *v24;
  *(_OWORD *)(((unint64_t)v23 + 23) & 0xFFFFFFFFFFFFF8) = *(_OWORD *)(((unint64_t)v24 + 23) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_22D8D332C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  char v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t (*v20)(char *, uint64_t, uint64_t);
  int v21;
  int v22;
  size_t v23;
  uint64_t v24;
  char *v25;
  char *v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;

  v6 = *(_QWORD *)(a2 + 32);
  v7 = *(_BYTE *)(a2 + 40);
  v8 = *(void **)a1;
  v9 = *(_QWORD *)(a1 + 8);
  v10 = *(_QWORD *)(a1 + 16);
  v11 = *(_QWORD *)(a1 + 24);
  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v13;
  *(_QWORD *)(a1 + 32) = v6;
  v14 = *(_BYTE *)(a1 + 40);
  *(_BYTE *)(a1 + 40) = v7;
  sub_22D8CC5B0(v8, v9, v10, v11, v12, v14);
  v15 = *(_QWORD *)(a3 + 16);
  v16 = *(_QWORD *)(v15 - 8);
  v17 = *(unsigned __int8 *)(v16 + 80);
  v18 = (char *)((v17 + 41 + a1) & ~v17);
  v19 = (char *)((v17 + 41 + a2) & ~v17);
  v20 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v16 + 48);
  v21 = v20(v18, 1, v15);
  v22 = v20(v19, 1, v15);
  if (v21)
  {
    if (!v22)
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v18, v19, v15);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v18, 0, 1, v15);
      goto LABEL_10;
    }
  }
  else
  {
    if (!v22)
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 40))(v18, v19, v15);
      goto LABEL_10;
    }
    (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
  }
  if (*(_DWORD *)(v16 + 84))
    v23 = *(_QWORD *)(v16 + 64);
  else
    v23 = *(_QWORD *)(v16 + 64) + 1;
  memcpy(v18, v19, v23);
LABEL_10:
  if (*(_DWORD *)(v16 + 84))
    v24 = *(_QWORD *)(v16 + 64);
  else
    v24 = *(_QWORD *)(v16 + 64) + 1;
  v25 = &v18[v24];
  v26 = &v19[v24];
  v27 = (unint64_t)(v25 + 7) & 0xFFFFFFFFFFFFFFF8;
  v28 = (unint64_t)(v26 + 7) & 0xFFFFFFFFFFFFFFF8;
  v29 = *(_QWORD *)v28;
  LOBYTE(v28) = *(_BYTE *)(v28 + 8);
  v30 = *(_QWORD *)v27;
  v31 = *(_BYTE *)(v27 + 8);
  *(_QWORD *)v27 = v29;
  *(_BYTE *)(v27 + 8) = v28;
  sub_22D8CC628(v30, v31);
  v32 = (unint64_t)(v25 + 23) & 0xFFFFFFFFFFFFFFF8;
  v33 = (unint64_t)(v26 + 23) & 0xFFFFFFFFFFFFFFF8;
  *(_BYTE *)v32 = *(_BYTE *)v33;
  *(_QWORD *)(v32 + 8) = *(_QWORD *)(v33 + 8);
  swift_release();
  v34 = (v32 + 23) & 0xFFFFFFFFFFFFFFF8;
  v35 = (v33 + 23) & 0xFFFFFFFFFFFFFFF8;
  *(_BYTE *)v34 = *(_BYTE *)v35;
  *(_QWORD *)(v34 + 8) = *(_QWORD *)(v35 + 8);
  swift_release();
  v36 = (v34 + 23) & 0xFFFFFFFFFFFFFFF8;
  v37 = (v35 + 23) & 0xFFFFFFFFFFFFFFF8;
  *(_BYTE *)v36 = *(_BYTE *)v37;
  *(_QWORD *)(v36 + 8) = *(_QWORD *)(v37 + 8);
  swift_release();
  v38 = (v36 + 23) & 0xFFFFFFFFFFFFFFF8;
  v39 = (v37 + 23) & 0xFFFFFFFFFFFFFFF8;
  *(_BYTE *)v38 = *(_BYTE *)v39;
  *(_QWORD *)(v38 + 8) = *(_QWORD *)(v39 + 8);
  swift_release();
  return a1;
}

uint64_t sub_22D8D3544(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  int v5;
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v15;
  unsigned int v16;
  unint64_t v17;
  int v18;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  if (v5)
    v6 = v5 - 1;
  else
    v6 = 0;
  if (v6 <= 0x7FFFFFFE)
    v7 = 2147483646;
  else
    v7 = v6;
  v8 = *(_QWORD *)(v4 + 64);
  if (!v5)
    ++v8;
  if (!a2)
    return 0;
  v9 = *(unsigned __int8 *)(v4 + 80);
  v10 = v8 + 23;
  if (v7 < a2)
  {
    if (((((((((((v10 + ((v9 + 41) & ~v9)) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)
           + 23) & 0xFFFFFFFFFFFFFFF8)
         + 16) & 0xFFFFFFF8) != 0)
      v11 = 2;
    else
      v11 = a2 - v7 + 1;
    if (v11 >= 0x10000)
      v12 = 4;
    else
      v12 = 2;
    if (v11 < 0x100)
      v12 = 1;
    if (v11 >= 2)
      v13 = v12;
    else
      v13 = 0;
    __asm { BR              X17 }
  }
  v15 = (a1 + v9 + 41) & ~v9;
  if (v6 < 0x7FFFFFFE)
  {
    v17 = *(_QWORD *)(((v10 + v15) & 0xFFFFFFFFFFFFF8) + 8);
    if (v17 >= 0xFFFFFFFF)
      LODWORD(v17) = -1;
    v18 = v17 - 1;
    if (v18 < 0)
      v18 = -1;
    return (v18 + 1);
  }
  else
  {
    v16 = (*(uint64_t (**)(uint64_t))(v4 + 48))(v15);
    if (v16 >= 2)
      return v16 - 1;
    else
      return 0;
  }
}

void sub_22D8D36B4(unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  int v6;
  uint64_t v7;
  int v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  unsigned int v12;
  unsigned int v13;
  int v14;
  unsigned int v15;

  v6 = 0;
  v7 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  v8 = *(_DWORD *)(v7 + 84);
  if (v8)
    v9 = v8 - 1;
  else
    v9 = 0;
  if (v9 <= 0x7FFFFFFE)
    v10 = 2147483646;
  else
    v10 = v9;
  v11 = *(_QWORD *)(v7 + 64);
  if (!v8)
    ++v11;
  if (v10 < a3)
  {
    v12 = a3 - v10;
    if ((((((((((_DWORD)v11 + 23 + ((*(unsigned __int8 *)(v7 + 80) + 41) & ~*(unsigned __int8 *)(v7 + 80))) & 0xFFFFFFF8)
             + 23) & 0xFFFFFFF8)
           + 23) & 0xFFFFFFF8)
         + 23) & 0xFFFFFFF8) == 0xFFFFFFF0)
      v13 = v12 + 1;
    else
      v13 = 2;
    if (v13 >= 0x10000)
      v14 = 4;
    else
      v14 = 2;
    if (v13 < 0x100)
      v14 = 1;
    if (v13 >= 2)
      v6 = v14;
    else
      v6 = 0;
  }
  if (a2 > v10)
  {
    if ((((((((((_DWORD)v11 + 23 + ((*(unsigned __int8 *)(v7 + 80) + 41) & ~*(unsigned __int8 *)(v7 + 80))) & 0xFFFFFFF8)
             + 23) & 0xFFFFFFF8)
           + 23) & 0xFFFFFFF8)
         + 23) & 0xFFFFFFF8) != 0xFFFFFFF0)
    {
      v15 = ~v10 + a2;
      bzero(a1, ((((((((v11 + 23 + ((*(unsigned __int8 *)(v7 + 80) + 41) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80))) & 0xFFFFFFFFFFFFFFF8)+ 23) & 0xFFFFFFFFFFFFFFF8)+ 23) & 0xFFFFFFFFFFFFFFF8)+ 23) & 0xFFFFFFFFFFFFFFF8)+ 16);
      *a1 = v15;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X16 }
}

uint64_t sub_22D8D37D8@<X0>(unsigned int a1@<W1>, size_t a2@<X8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  int v18;
  _QWORD *v19;
  uint64_t result;

  *(_BYTE *)(v15 + v16) = 0;
  if (a1)
  {
    v17 = (void *)((v15 + v14 + 41) & v10);
    if (v11 < 0x7FFFFFFE)
    {
      v19 = (_QWORD *)(((unint64_t)v17 + v13) & 0xFFFFFFFFFFFFFFF8);
      if (a1 > 0x7FFFFFFE)
      {
        *v19 = a1 - 0x7FFFFFFF;
        v19[1] = 0;
      }
      else
      {
        v19[1] = a1;
      }
    }
    else if (v11 >= a1)
    {
      return (*(uint64_t (**)(void *, _QWORD))(v12 + 56))(v17, a1 + 1);
    }
    else if ((_DWORD)a2)
    {
      if (a2 <= 3)
        v18 = a2;
      else
        v18 = 4;
      bzero(v17, a2);
      __asm { BR              X10 }
    }
  }
  return result;
}

void sub_22D8D38E4()
{
  uint64_t v0;
  int v1;

  *(_WORD *)v0 = v1;
  *(_BYTE *)(v0 + 2) = BYTE2(v1);
}

void sub_22D8D38F4()
{
  _WORD *v0;
  __int16 v1;

  *v0 = v1;
}

void sub_22D8D38FC()
{
  _DWORD *v0;
  int v1;

  *v0 = v1;
}

uint64_t sub_22D8D3908()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_22D8D393C@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;

  return sub_22D8D077C(v1[4], v1[2], v1[3], a1);
}

unint64_t sub_22D8D3948()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  _QWORD v5[6];

  result = qword_255DA0188;
  if (!qword_255DA0188)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255DA0180);
    v2 = sub_22D8D39F8();
    v3 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255DA01A8);
    v4 = sub_22D8D3AA8();
    v5[2] = v3;
    v5[3] = MEMORY[0x24BEE1328];
    v5[4] = v4;
    v5[5] = MEMORY[0x24BEE1340];
    v5[0] = v2;
    v5[1] = swift_getOpaqueTypeConformance2();
    result = MEMORY[0x22E31B14C](MEMORY[0x24BDEF3E0], v1, v5);
    atomic_store(result, (unint64_t *)&qword_255DA0188);
  }
  return result;
}

unint64_t sub_22D8D39F8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_255DA0190;
  if (!qword_255DA0190)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255DA0198);
    v2[0] = sub_22D8D3A64();
    v2[1] = MEMORY[0x24BDF0910];
    result = MEMORY[0x22E31B14C](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_255DA0190);
  }
  return result;
}

unint64_t sub_22D8D3A64()
{
  unint64_t result;

  result = qword_255DA01A0;
  if (!qword_255DA01A0)
  {
    result = MEMORY[0x22E31B14C](&unk_22D8E85F0, &type metadata for AddPassButtonView);
    atomic_store(result, (unint64_t *)&qword_255DA01A0);
  }
  return result;
}

unint64_t sub_22D8D3AA8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_255DA01B0;
  if (!qword_255DA01B0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255DA01A8);
    v2[0] = sub_22D8D3A64();
    v2[1] = sub_22D8D3B14();
    result = MEMORY[0x22E31B14C](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_255DA01B0);
  }
  return result;
}

unint64_t sub_22D8D3B14()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t OpaqueTypeConformance2;
  unint64_t v6;
  uint64_t v7;
  _QWORD v8[10];

  result = qword_255DA01B8;
  if (!qword_255DA01B8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255DA01C0);
    v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255DA01C8);
    v3 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255DA01D0);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255DA01D8);
    v4 = sub_22D8D3A64();
    sub_22D8D3C50();
    OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
    v6 = sub_22D8D3CD4();
    v7 = sub_22D8D3D18(&qword_255DA0200, &qword_255DA01D0, MEMORY[0x24BDF5428]);
    v8[2] = v2;
    v8[3] = MEMORY[0x24BEE0D00];
    v8[4] = v3;
    v8[5] = MEMORY[0x24BDF1FA8];
    v8[6] = OpaqueTypeConformance2;
    v8[7] = v6;
    v8[8] = v7;
    v8[9] = MEMORY[0x24BDF1F80];
    v8[0] = swift_getOpaqueTypeConformance2();
    v8[1] = v4;
    result = MEMORY[0x22E31B14C](MEMORY[0x24BDEF3E0], v1, v8);
    atomic_store(result, (unint64_t *)&qword_255DA01B8);
  }
  return result;
}

unint64_t sub_22D8D3C50()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_255DA01E0;
  if (!qword_255DA01E0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255DA01D8);
    v2 = sub_22D8D3D18(&qword_255DA01E8, &qword_255DA01F0, MEMORY[0x24BDEF370]);
    v3[0] = MEMORY[0x24BDF4760];
    v3[1] = v2;
    result = MEMORY[0x22E31B14C](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_255DA01E0);
  }
  return result;
}

unint64_t sub_22D8D3CD4()
{
  unint64_t result;

  result = qword_255DA01F8;
  if (!qword_255DA01F8)
  {
    result = MEMORY[0x22E31B14C](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_255DA01F8);
  }
  return result;
}

uint64_t sub_22D8D3D18(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x22E31B14C](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_22D8D3D5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  v6 = *(_QWORD *)(v4 + 16);
  v7 = *(_QWORD *)(v4 + 24);
  v8 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for AddPassToWalletButton_iOS(0, v6, v7, a4) - 8) + 80);
  v9 = v4 + ((v8 + 32) & ~v8);
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v10;
  *v10 = v5;
  v10[1] = sub_22D8CE0A0;
  return sub_22D8D1774(v9, v6, v7);
}

_BYTE *sub_22D8D3DE0(_BYTE *a1, _BYTE *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v7 = *(_QWORD *)(v4 + 16);
  v8 = *(_QWORD *)(v4 + 24);
  v9 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for AddPassToWalletButton_iOS(0, v7, v8, a4) - 8) + 80);
  return sub_22D8D1728(a1, a2, v4 + ((v9 + 32) & ~v9), v7, v8);
}

uint64_t sub_22D8D3E4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  type metadata accessor for AddPassToWalletButton_iOS(0, *(_QWORD *)(v4 + 16), *(_QWORD *)(v4 + 24), a4);
  return sub_22D8D03C4();
}

uint64_t sub_22D8D3E90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;

  v5 = *(_QWORD *)(v4 + 16);
  v6 = type metadata accessor for AddPassToWalletButton_iOS(0, v5, *(_QWORD *)(v4 + 24), a4);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v9 = *(_QWORD *)(v7 + 64);
  sub_22D8CC5B0(*(void **)(v4 + v8), *(_QWORD *)(v4 + v8 + 8), *(_QWORD *)(v4 + v8 + 16), *(_QWORD *)(v4 + v8 + 24), *(_QWORD *)(v4 + v8 + 32), *(_BYTE *)(v4 + v8 + 40));
  v10 = v4 + v8 + *(int *)(v6 + 36);
  v11 = *(_QWORD *)(v5 - 8);
  if (!(*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v11 + 48))(v10, 1, v5))
    (*(void (**)(unint64_t, uint64_t))(v11 + 8))(v10, v5);
  sub_22D8CC628(*(_QWORD *)(v4 + v8 + *(int *)(v6 + 40)), *(_BYTE *)(v4 + v8 + *(int *)(v6 + 40) + 8));
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  return swift_deallocObject();
}

void sub_22D8D3FB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;

  v5 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for AddPassToWalletButton_iOS(0, *(_QWORD *)(v4 + 16), *(_QWORD *)(v4 + 24), a4)- 8)+ 80);
  sub_22D8D1B7C(v4 + ((v5 + 32) & ~v5));
}

uint64_t sub_22D8D401C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DA01C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_22D8D4064(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t objectdestroyTm(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v5 = *(_QWORD *)(v4 + 16);
  v6 = type metadata accessor for AddPassToWalletButton_iOS(0, v5, *(_QWORD *)(v4 + 24), a4);
  v7 = *(unsigned __int8 *)(*(_QWORD *)(v6 - 8) + 80);
  v8 = v4 + ((v7 + 32) & ~v7);
  sub_22D8CC5B0(*(void **)v8, *(_QWORD *)(v8 + 8), *(_QWORD *)(v8 + 16), *(_QWORD *)(v8 + 24), *(_QWORD *)(v8 + 32), *(_BYTE *)(v8 + 40));
  v9 = v8 + *(int *)(v6 + 36);
  v10 = *(_QWORD *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v9, 1, v5))
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v5);
  sub_22D8CC628(*(_QWORD *)(v8 + *(int *)(v6 + 40)), *(_BYTE *)(v8 + *(int *)(v6 + 40) + 8));
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_22D8D41B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v5 = *(_QWORD *)(v4 + 16);
  v6 = *(_QWORD *)(v4 + 24);
  v7 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for AddPassToWalletButton_iOS(0, v5, v6, a4) - 8) + 80);
  return sub_22D8D1B0C(v4 + ((v7 + 32) & ~v7), v5, v6);
}

uint64_t sub_22D8D4208@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = sub_22D8E6FD4();
  *a1 = v1;
  a1[1] = v3;
  a1[2] = v4;
  return swift_retain();
}

uint64_t sub_22D8D4234@<X0>(char *a1@<X8>)
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
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(char *, char *, uint64_t);
  char *v30;
  uint64_t v31;
  void (*v32)(char *, uint64_t);
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;

  v35 = a1;
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DA0240);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v34 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DA0248);
  v34 = *(_QWORD *)(v4 - 8);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x24BDAC7A8](v5);
  v10 = (char *)&v34 - v9;
  v11 = MEMORY[0x24BDAC7A8](v8);
  v13 = (char *)&v34 - v12;
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v34 - v14;
  v16 = (void *)objc_opt_self();
  v17 = (void *)sub_22D8E701C();
  v18 = objc_msgSend(v16, sel_localizedDeletableWalletStringFor_, v17);

  v19 = sub_22D8E7040();
  v21 = v20;

  v36 = v19;
  v37 = v21;
  sub_22D8D3CD4();
  sub_22D8E6F8C();
  v22 = (void *)sub_22D8E701C();
  v23 = objc_msgSend(v16, sel_localizedDeletableWalletStringFor_, v22);

  v24 = sub_22D8E7040();
  v26 = v25;

  v36 = v24;
  v37 = v26;
  sub_22D8E6CB0();
  v27 = sub_22D8E6CBC();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 56))(v3, 0, 1, v27);
  sub_22D8E6F80();
  v28 = v34;
  v29 = *(void (**)(char *, char *, uint64_t))(v34 + 16);
  v29(v10, v15, v4);
  v29(v7, v13, v4);
  v30 = v35;
  v29(v35, v10, v4);
  v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DA0250);
  v29(&v30[*(int *)(v31 + 48)], v7, v4);
  v32 = *(void (**)(char *, uint64_t))(v28 + 8);
  v32(v13, v4);
  v32(v15, v4);
  v32(v7, v4);
  return ((uint64_t (*)(char *, uint64_t))v32)(v10, v4);
}

uint64_t sub_22D8D4520@<X0>(char *a1@<X8>)
{
  return sub_22D8D4234(a1);
}

uint64_t sub_22D8D4528@<X0>(uint64_t a1@<X8>)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t result;
  uint64_t v6;
  char v7;
  uint64_t v8;

  v2 = (void *)objc_opt_self();
  v3 = (void *)sub_22D8E701C();
  v4 = objc_msgSend(v2, sel_localizedDeletableWalletStringFor_, v3);

  sub_22D8E7040();
  sub_22D8D3CD4();
  result = sub_22D8E6EB4();
  *(_QWORD *)a1 = result;
  *(_QWORD *)(a1 + 8) = v6;
  *(_BYTE *)(a1 + 16) = v7 & 1;
  *(_QWORD *)(a1 + 24) = v8;
  return result;
}

uint64_t sub_22D8D45E8@<X0>(uint64_t a1@<X8>)
{
  return sub_22D8D4528(a1);
}

void sub_22D8D45F0(id a1, char a2)
{
  if ((a2 & 1) != 0)

  else
    swift_release();
}

uint64_t sub_22D8D4604(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[2];
  uint64_t v8;
  _QWORD v9[2];
  uint64_t v10;

  v1 = *(_QWORD *)(a1 + 8);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255DA0180);
  v2 = sub_22D8E7124();
  v3 = sub_22D8E6E30();
  v4 = sub_22D8E6F38();
  sub_22D8E6CEC();
  v5 = sub_22D8E6D10();
  v10 = v1;
  v9[0] = sub_22D8D3948();
  v9[1] = MEMORY[0x22E31B14C](MEMORY[0x24BDF5578], v2, &v10);
  v8 = MEMORY[0x22E31B14C](MEMORY[0x24BDEF3E0], v3, v9);
  v7[0] = MEMORY[0x22E31B14C](MEMORY[0x24BDF3F50], v4, &v8);
  v7[1] = sub_22D8CE204();
  return MEMORY[0x22E31B14C](MEMORY[0x24BDED308], v5, v7);
}

uint64_t sub_22D8D4740()
{
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for PaymentButtonView.Coordinator()
{
  return objc_opt_self();
}

ValueMetadata *type metadata accessor for PaymentButtonView()
{
  return &type metadata for PaymentButtonView;
}

id sub_22D8D4794()
{
  _QWORD *v0;
  id v1;
  uint64_t v3;

  v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE6FAB8]), sel_initWithPaymentButtonType_paymentButtonStyle_, *v0, v0[1]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DA0330);
  sub_22D8E6E3C();
  objc_msgSend(v1, sel_addTarget_action_forControlEvents_, v3, sel_callback, 0x2000);
  swift_release();
  objc_msgSend(v1, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  return v1;
}

uint64_t sub_22D8D4844@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(v1 + 16);
  v3 = *(_QWORD *)(v1 + 24);
  type metadata accessor for PaymentButtonView.Coordinator();
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  *(_QWORD *)(v5 + 24) = v3;
  *a1 = v5;
  return swift_retain();
}

uint64_t sub_22D8D4888()
{
  sub_22D8D4974();
  return sub_22D8E6E00();
}

uint64_t sub_22D8D48D8()
{
  sub_22D8D4974();
  return sub_22D8E6DAC();
}

void sub_22D8D4928()
{
  sub_22D8D4974();
  sub_22D8E6DF4();
  __break(1u);
}

unint64_t sub_22D8D4950(uint64_t a1)
{
  unint64_t result;

  result = sub_22D8D4974();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_22D8D4974()
{
  unint64_t result;

  result = qword_255DA0328;
  if (!qword_255DA0328)
  {
    result = MEMORY[0x22E31B14C](&unk_22D8E8334, &type metadata for PaymentButtonView);
    atomic_store(result, (unint64_t *)&qword_255DA0328);
  }
  return result;
}

uint64_t sub_22D8D49B8()
{
  void *v0;
  void *v1;
  id v2;

  v0 = (void *)objc_opt_self();
  v1 = (void *)sub_22D8E701C();
  v2 = objc_msgSend(v0, sel_localizedDeletableWalletStringFor_, v1);

  sub_22D8E7040();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DA01D0);
  sub_22D8CB2E8();
  sub_22D8D3CD4();
  sub_22D8D5428();
  sub_22D8E6F08();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22D8D4B10()
{
  unsigned __int8 v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255DA0058);
  sub_22D8E6F50();
  return v1;
}

uint64_t sub_22D8D4B64()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DA0058);
  return sub_22D8E6F5C();
}

uint64_t sub_22D8D4BBC@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char v6;

  v4 = v2 + *(int *)(a1 + 56);
  v5 = *(_QWORD *)v4;
  v6 = *(_BYTE *)(v4 + 8);
  sub_22D8CE69C(*(_QWORD *)v4, v6);
  sub_22D8DEAA8(v5, v6, a2);
  return sub_22D8CC628(v5, v6);
}

uint64_t sub_22D8D4C14@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  uint64_t v14;
  int *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v24;
  uint64_t v25;

  v14 = *a1;
  v15 = (int *)type metadata accessor for VerifyIdentityWithWalletButton(0, a7, a8, a4);
  v16 = a9 + v15[10];
  sub_22D8E6F44();
  *(_BYTE *)v16 = v24;
  *(_QWORD *)(v16 + 8) = v25;
  v17 = a9 + v15[11];
  sub_22D8E6F44();
  *(_BYTE *)v17 = v24;
  *(_QWORD *)(v17 + 8) = v25;
  v18 = v15[12];
  *(_QWORD *)(a9 + v18) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE6EB40]), sel_init);
  v19 = a9 + v15[14];
  *(_QWORD *)v19 = swift_getKeyPath();
  *(_BYTE *)(v19 + 8) = 0;
  *(_QWORD *)(a9 + v15[13]) = v14;
  *(_QWORD *)a9 = a2;
  *(_QWORD *)(a9 + 8) = a3;
  *(_QWORD *)(a9 + 16) = a4;
  *(_BYTE *)(a9 + 24) = a5 & 1;
  v20 = a9 + v15[9];
  v21 = sub_22D8E7124();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 32))(v20, a6, v21);
}

uint64_t VerifyIdentityWithWalletButton.body.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(char *, uint64_t, uint64_t);
  char *v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  void (*v33)(uint64_t, uint64_t);
  uint64_t v35;
  uint64_t v36;
  char *v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  _QWORD v50[2];
  uint64_t v51;
  _QWORD v52[2];
  uint64_t v53;

  v46 = a2;
  v4 = sub_22D8E70C4();
  v44 = *(_QWORD *)(v4 - 8);
  v45 = v4;
  v5 = MEMORY[0x24BDAC7A8](v4);
  v43 = (char *)&v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(_QWORD *)(a1 - 8);
  v39 = *(_QWORD *)(v7 + 64);
  MEMORY[0x24BDAC7A8](v5);
  v38 = (char *)&v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255DA0338);
  v36 = *(_QWORD *)(a1 + 16);
  v9 = v36;
  v10 = sub_22D8E7124();
  v11 = sub_22D8E6E30();
  v12 = sub_22D8E6F38();
  v41 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v35 - v13;
  sub_22D8E6CEC();
  v15 = sub_22D8E6D10();
  v42 = *(_QWORD *)(v15 - 8);
  v16 = MEMORY[0x24BDAC7A8](v15);
  v37 = (char *)&v35 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v40 = (uint64_t)&v35 - v18;
  v19 = *(_QWORD *)(a1 + 24);
  v47 = v9;
  v48 = v19;
  v49 = v2;
  v20 = sub_22D8D5358();
  v53 = v19;
  v21 = MEMORY[0x22E31B14C](MEMORY[0x24BDF5578], v10, &v53);
  v52[0] = v20;
  v52[1] = v21;
  v22 = MEMORY[0x22E31B14C](MEMORY[0x24BDEF3E0], v11, v52);
  sub_22D8E6F2C();
  v23 = v7;
  v24 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  v25 = v38;
  v24(v38, v2, a1);
  v26 = (*(unsigned __int8 *)(v23 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v23 + 80);
  v27 = swift_allocObject();
  *(_QWORD *)(v27 + 16) = v36;
  *(_QWORD *)(v27 + 24) = v19;
  (*(void (**)(unint64_t, char *, uint64_t))(v23 + 32))(v27 + v26, v25, a1);
  v51 = v22;
  v28 = MEMORY[0x22E31B14C](MEMORY[0x24BDF3F50], v12, &v51);
  v29 = v43;
  sub_22D8CE200();
  v30 = (uint64_t)v37;
  sub_22D8E6EFC();
  swift_release();
  (*(void (**)(char *, uint64_t))(v44 + 8))(v29, v45);
  (*(void (**)(char *, uint64_t))(v41 + 8))(v14, v12);
  v31 = sub_22D8CE204();
  v50[0] = v28;
  v50[1] = v31;
  MEMORY[0x22E31B14C](MEMORY[0x24BDED308], v15, v50);
  v32 = v40;
  sub_22D8CFBF4(v30, v15, v40);
  v33 = *(void (**)(uint64_t, uint64_t))(v42 + 8);
  v33(v30, v15);
  sub_22D8CDC24(v32, v15, v46);
  return ((uint64_t (*)(uint64_t, uint64_t))v33)(v32, v15);
}

uint64_t sub_22D8D50CC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
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
  void (*v22)(char *, uint64_t);
  unint64_t v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD v30[2];
  uint64_t v31;
  uint64_t v32;

  v28 = a4;
  v7 = sub_22D8E7124();
  v26 = *(_QWORD *)(v7 - 8);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v26 - v11;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DA0338);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v26 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_22D8E6E30();
  v27 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)&v26 - v17;
  v20 = type metadata accessor for VerifyIdentityWithWalletButton(0, a2, a3, v19);
  if ((sub_22D8D4B10() & 1) != 0)
  {
    sub_22D8D5474(v20, (uint64_t)v15);
    sub_22D8D5358();
    v29 = a3;
    MEMORY[0x22E31B14C](MEMORY[0x24BDF5578], v7, &v29);
    sub_22D8CFC68((uint64_t)v15, v13);
    sub_22D8D72E0((uint64_t)v15);
  }
  else
  {
    v21 = a1 + *(int *)(v20 + 36);
    v32 = a3;
    MEMORY[0x22E31B14C](MEMORY[0x24BDF5578], v7, &v32);
    sub_22D8CFBF4(v21, v7, (uint64_t)v12);
    sub_22D8CDC24((uint64_t)v12, v7, (uint64_t)v10);
    sub_22D8D5358();
    sub_22D8CFD2C((uint64_t)v10, v13, v7);
    v22 = *(void (**)(char *, uint64_t))(v26 + 8);
    v22(v10, v7);
    v22(v12, v7);
  }
  v23 = sub_22D8D5358();
  v31 = a3;
  v24 = MEMORY[0x22E31B14C](MEMORY[0x24BDF5578], v7, &v31);
  v30[0] = v23;
  v30[1] = v24;
  MEMORY[0x22E31B14C](MEMORY[0x24BDEF3E0], v16, v30);
  sub_22D8CDC24((uint64_t)v18, v16, v28);
  return (*(uint64_t (**)(char *, uint64_t))(v27 + 8))(v18, v16);
}

uint64_t sub_22D8D534C@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;

  return sub_22D8D50CC(v1[4], v1[2], v1[3], a1);
}

unint64_t sub_22D8D5358()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  _QWORD v6[10];

  result = qword_255DA0340;
  if (!qword_255DA0340)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255DA0338);
    v2 = sub_22D8CB2E8();
    v3 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255DA01D0);
    v4 = sub_22D8D3CD4();
    v5 = sub_22D8D5428();
    v6[2] = &type metadata for IdentityButton;
    v6[3] = MEMORY[0x24BEE0D00];
    v6[4] = v3;
    v6[5] = MEMORY[0x24BDF1FA8];
    v6[6] = v2;
    v6[7] = v4;
    v6[8] = v5;
    v6[9] = MEMORY[0x24BDF1F80];
    v6[0] = v2;
    v6[1] = swift_getOpaqueTypeConformance2();
    result = MEMORY[0x22E31B14C](MEMORY[0x24BDEF3E0], v1, v6);
    atomic_store(result, &qword_255DA0340);
  }
  return result;
}

unint64_t sub_22D8D5428()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255DA0200;
  if (!qword_255DA0200)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255DA01D0);
    result = MEMORY[0x22E31B14C](MEMORY[0x24BDF5428], v1);
    atomic_store(result, &qword_255DA0200);
  }
  return result;
}

uint64_t sub_22D8D5474@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  _QWORD *v19;
  id v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v29;
  ValueMetadata *v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  ValueMetadata *v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  ValueMetadata *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;
  unint64_t v51;
  uint64_t v52;

  v44 = a2;
  v4 = *(_QWORD *)(a1 - 8);
  v5 = *(_QWORD *)(v4 + 64);
  MEMORY[0x24BDAC7A8](a1);
  v6 = (char *)&v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DA0460);
  v7 = *(_QWORD *)(v42 - 8);
  MEMORY[0x24BDAC7A8](v42);
  v41 = (char *)&v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DA0468);
  MEMORY[0x24BDAC7A8](v43);
  v10 = (uint64_t *)((char *)&v35 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  v11 = *(void **)v2;
  v12 = *(_QWORD *)(v2 + 8);
  if ((*(_BYTE *)(v2 + 24) & 1) != 0)
  {
    v37 = *(_QWORD *)(v2 + 16);
    v40 = *(_QWORD *)(v2 + *(int *)(a1 + 52));
    v36 = v11;
    swift_retain();
    sub_22D8D4BBC(a1, &v45);
    v38 = v45;
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))((char *)&v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v2, a1);
    v13 = *(unsigned __int8 *)(v4 + 80);
    v39 = v7;
    v14 = (v13 + 32) & ~v13;
    v15 = (v5 + v14 + 7) & 0xFFFFFFFFFFFFFFF8;
    v16 = swift_allocObject();
    *(_OWORD *)(v16 + 16) = *(_OWORD *)(a1 + 16);
    (*(void (**)(uint64_t, char *, uint64_t))(v4 + 32))(v16 + v14, v6, a1);
    v17 = v36;
    v18 = v37;
    *(_QWORD *)(v16 + v15) = v36;
    v19 = (_QWORD *)(v16 + ((v15 + 15) & 0xFFFFFFFFFFFFFFF8));
    *v19 = v12;
    v19[1] = v18;
    v20 = v17;
    swift_retain();
    sub_22D8D01BC();
    v21 = v41;
    sub_22D8D49B8();
    swift_release();
    swift_release();
    swift_release();
    v22 = v39;
    v23 = v42;
    (*(void (**)(_QWORD *, char *, uint64_t))(v39 + 16))(v10, v21, v42);
    swift_storeEnumTagMultiPayload();
    v24 = sub_22D8CB2E8();
    v25 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255DA01D0);
    v26 = sub_22D8D3CD4();
    v27 = sub_22D8D5428();
    v45 = &type metadata for IdentityButton;
    v46 = MEMORY[0x24BEE0D00];
    v47 = v25;
    v48 = MEMORY[0x24BDF1FA8];
    v49 = v24;
    v50 = v26;
    v51 = v27;
    v52 = MEMORY[0x24BDF1F80];
    swift_getOpaqueTypeConformance2();
    sub_22D8E6E24();

    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v22 + 8))(v21, v23);
  }
  else
  {
    v29 = *(_QWORD *)(v2 + *(int *)(a1 + 52));
    swift_retain();
    sub_22D8D4BBC(a1, &v45);
    v30 = v45;
    *v10 = v29;
    v10[1] = v30;
    v10[2] = v11;
    v10[3] = v12;
    swift_storeEnumTagMultiPayload();
    v31 = sub_22D8CB2E8();
    v32 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255DA01D0);
    v33 = sub_22D8D3CD4();
    v34 = sub_22D8D5428();
    v45 = &type metadata for IdentityButton;
    v46 = MEMORY[0x24BEE0D00];
    v47 = v32;
    v48 = MEMORY[0x24BDF1FA8];
    v49 = v31;
    v50 = v33;
    v51 = v34;
    v52 = MEMORY[0x24BDF1F80];
    swift_getOpaqueTypeConformance2();
    return sub_22D8E6E24();
  }
}

uint64_t sub_22D8D5808(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  v3[2] = sub_22D8E70A0();
  v3[3] = sub_22D8E7094();
  v6 = (_QWORD *)swift_task_alloc();
  v3[4] = v6;
  v8 = type metadata accessor for VerifyIdentityWithWalletButton(0, a2, a3, v7);
  *v6 = v3;
  v6[1] = sub_22D8D5890;
  return sub_22D8D5B18(v8);
}

uint64_t sub_22D8D5890()
{
  swift_task_dealloc();
  sub_22D8E7088();
  return swift_task_switch();
}

uint64_t sub_22D8D5900()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_22D8D5930(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  int *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v5 = *(_QWORD *)(v4 + 16);
  v6 = (int *)type metadata accessor for VerifyIdentityWithWalletButton(0, v5, *(_QWORD *)(v4 + 24), a4);
  v7 = *(unsigned __int8 *)(*((_QWORD *)v6 - 1) + 80);
  v8 = v4 + ((v7 + 32) & ~v7);
  sub_22D8D5A38(*(void **)v8, *(_QWORD *)(v8 + 8), *(_QWORD *)(v8 + 16), *(_BYTE *)(v8 + 24));
  v9 = v8 + v6[9];
  v10 = *(_QWORD *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v9, 1, v5))
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v5);
  swift_release();
  swift_release();

  sub_22D8CC628(*(_QWORD *)(v8 + v6[14]), *(_BYTE *)(v8 + v6[14] + 8));
  return swift_deallocObject();
}

uint64_t type metadata accessor for VerifyIdentityWithWalletButton(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for VerifyIdentityWithWalletButton);
}

uint64_t sub_22D8D5A38(void *a1, uint64_t a2, uint64_t a3, char a4)
{
  if ((a4 & 1) != 0)

  return swift_release();
}

uint64_t sub_22D8D5A64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  v6 = *(_QWORD *)(v4 + 16);
  v7 = *(_QWORD *)(v4 + 24);
  v8 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for VerifyIdentityWithWalletButton(0, v6, v7, a4) - 8)
                          + 80);
  v9 = v4 + ((v8 + 32) & ~v8);
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v10;
  *v10 = v5;
  v10[1] = sub_22D8CE0A0;
  return sub_22D8D5808(v9, v6, v7);
}

uint64_t sub_22D8D5AE4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_22D8D5B18(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v2[15] = a1;
  v2[16] = v1;
  v2[17] = *(_QWORD *)(a1 + 16);
  v3 = sub_22D8E7124();
  v2[18] = v3;
  v2[19] = *(_QWORD *)(v3 - 8);
  v2[20] = swift_task_alloc();
  sub_22D8E70A0();
  v2[21] = sub_22D8E7094();
  v2[22] = sub_22D8E7088();
  v2[23] = v4;
  return swift_task_switch();
}

uint64_t sub_22D8D5BB4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  _QWORD *v13;

  v1 = *(_QWORD *)(v0 + 160);
  v2 = *(_QWORD *)(v0 + 136);
  (*(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(v0 + 152) + 16))(v1, *(_QWORD *)(v0 + 128) + *(int *)(*(_QWORD *)(v0 + 120) + 36), *(_QWORD *)(v0 + 144));
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 48))(v1, 1, v2) == 1)
  {
    v3 = *(_QWORD *)(v0 + 160);
    v4 = *(_QWORD *)(v0 + 144);
    v5 = *(_QWORD *)(v0 + 152);
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v4);
  }
  else
  {
    v6 = *(_QWORD *)(v0 + 128);
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 152) + 8))(*(_QWORD *)(v0 + 160), *(_QWORD *)(v0 + 144));
    if ((*(_BYTE *)(v6 + 24) & 1) != 0)
    {
      v7 = **(void ***)(v0 + 128);
      *(_QWORD *)(v0 + 192) = v7;
      v8 = v7;
      v9 = objc_msgSend(v8, sel_descriptor);
      *(_QWORD *)(v0 + 200) = v9;
      if (v9)
      {
        v10 = v9;
        v11 = *(void **)(*(_QWORD *)(v0 + 128) + *(int *)(*(_QWORD *)(v0 + 120) + 48));
        *(_QWORD *)(v0 + 56) = v0 + 208;
        *(_QWORD *)(v0 + 16) = v0;
        *(_QWORD *)(v0 + 24) = sub_22D8D5D64;
        v12 = swift_continuation_init();
        *(_QWORD *)(v0 + 80) = MEMORY[0x24BDAC760];
        v13 = (_QWORD *)(v0 + 80);
        v13[1] = 0x40000000;
        v13[2] = sub_22D8D5F70;
        v13[3] = &block_descriptor;
        v13[4] = v12;
        objc_msgSend(v11, sel_checkCanRequestDocument_completion_, v10, v13);
        return swift_continuation_await();
      }

      swift_release();
    }
    else
    {
      swift_release();
    }
  }
  sub_22D8D4B64();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_22D8D5D64()
{
  return swift_task_switch();
}

uint64_t sub_22D8D5DA8()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 192);
  swift_unknownObjectRelease();
  swift_release();

  sub_22D8D4B64();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_22D8D5E00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;

  v11 = objc_msgSend((id)objc_opt_self(), sel_passbookHasBeenDeleted);
  v13 = type metadata accessor for VerifyIdentityWithWalletButton(0, a5, a6, v12);
  if (v11)
    sub_22D8CCC94();
  else
    sub_22D8D5E9C(a2, a3, a4, v13);
}

void sub_22D8D5E9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[6];

  v8 = *(void **)(v4 + *(int *)(a4 + 48));
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = a2;
  *(_QWORD *)(v9 + 24) = a3;
  v11[4] = sub_22D8D74EC;
  v11[5] = v9;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 1107296256;
  v11[2] = sub_22D8D609C;
  v11[3] = &block_descriptor_11;
  v10 = _Block_copy(v11);
  swift_retain();
  swift_release();
  objc_msgSend(v8, sel_requestDocument_completion_, a1, v10);
  _Block_release(v10);
}

uint64_t sub_22D8D5F70(uint64_t a1, char a2)
{
  **(_BYTE **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) + 40) = a2;
  return swift_continuation_resume();
}

void sub_22D8D5F84(void *a1, id a2, void (*a3)(void *, uint64_t))
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;

  if (a1)
  {
    v11 = a1;
    a3(a1, 0);

  }
  else
  {
    if (a2)
    {
      v6 = a2;
    }
    else
    {
      sub_22D8E7040();
      v7 = objc_allocWithZone(MEMORY[0x24BDD1540]);
      v8 = (void *)sub_22D8E701C();
      swift_bridgeObjectRelease();
      v6 = objc_msgSend(v7, sel_initWithDomain_code_userInfo_, v8, 0, 0);

    }
    v9 = a2;
    v10 = v6;
    a3(v6, 1);

  }
}

void sub_22D8D609C(uint64_t a1, void *a2, void *a3)
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

uint64_t sub_22D8D6114()
{
  uint64_t result;
  unint64_t v1;

  result = sub_22D8E7124();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

char *sub_22D8D61BC(char *a1, char **a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  size_t v8;
  size_t v9;
  int v10;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  void *v19;
  const void *v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  _QWORD *v25;
  void **v26;
  void *v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  char v33;
  id v34;
  size_t __n;
  uint64_t v37;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v6 = *(_DWORD *)(v5 + 80);
  v7 = v6;
  v8 = *(_QWORD *)(v5 + 64);
  if (!*(_DWORD *)(v5 + 84))
    ++v8;
  v9 = v8 + 7;
  v10 = v6 & 0x100000;
  if (v7 > 7
    || v10 != 0
    || ((((((((((v8 + 7 + ((v7 + 25) & ~v7)) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8)
         + 15) & 0xFFFFFFFFFFFFFFF8)
       + 15) & 0xFFFFFFFFFFFFFFF8)
     + 9 > 0x18)
  {
    v13 = *a2;
    *(_QWORD *)a1 = *a2;
    a1 = &v13[(v7 & 0xF8 ^ 0x1F8) & (v7 + 16)];
    swift_retain();
  }
  else
  {
    __n = v8;
    v37 = *(_QWORD *)(a3 + 16);
    v14 = *a2;
    v15 = (uint64_t)a2[1];
    v16 = (uint64_t)a2[2];
    v17 = *((_BYTE *)a2 + 24);
    sub_22D8D63D8(*a2, v15, v16, v17);
    *(_QWORD *)a1 = v14;
    *((_QWORD *)a1 + 1) = v15;
    *((_QWORD *)a1 + 2) = v16;
    a1[24] = v17;
    v18 = (uint64_t)a2 + v7;
    v19 = (void *)((unint64_t)&a1[v7 + 25] & ~v7);
    v20 = (const void *)((v18 + 25) & ~v7);
    if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v5 + 48))(v20, 1, v37))
    {
      memcpy(v19, v20, __n);
    }
    else
    {
      (*(void (**)(void *, const void *, uint64_t))(v5 + 16))(v19, v20, v37);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v5 + 56))(v19, 0, 1, v37);
    }
    v21 = ((unint64_t)v19 + v9) & 0xFFFFFFFFFFFFFFF8;
    v22 = ((unint64_t)v20 + v9) & 0xFFFFFFFFFFFFFFF8;
    *(_BYTE *)v21 = *(_BYTE *)v22;
    *(_QWORD *)(v21 + 8) = *(_QWORD *)(v22 + 8);
    v23 = (v21 + 23) & 0xFFFFFFFFFFFFFFF8;
    v24 = (v22 + 23) & 0xFFFFFFFFFFFFFFF8;
    *(_BYTE *)v23 = *(_BYTE *)v24;
    *(_QWORD *)(v23 + 8) = *(_QWORD *)(v24 + 8);
    v25 = (_QWORD *)((v23 + 23) & 0xFFFFFFFFFFFFF8);
    v26 = (void **)((v24 + 23) & 0xFFFFFFFFFFFFF8);
    v27 = *v26;
    *v25 = *v26;
    v28 = (_QWORD *)(((unint64_t)v25 + 15) & 0xFFFFFFFFFFFFF8);
    v29 = ((unint64_t)v26 + 15) & 0xFFFFFFFFFFFFF8;
    v30 = *(_QWORD *)v29;
    v29 += 15;
    *v28 = v30;
    v31 = ((unint64_t)v28 + 15) & 0xFFFFFFFFFFFFFFF8;
    v32 = *(_QWORD *)(v29 & 0xFFFFFFFFFFFFFFF8);
    v33 = *(_BYTE *)((v29 & 0xFFFFFFFFFFFFFFF8) + 8);
    swift_retain();
    swift_retain();
    v34 = v27;
    sub_22D8CE69C(v32, v33);
    *(_QWORD *)v31 = v32;
    *(_BYTE *)(v31 + 8) = v33;
  }
  return a1;
}

uint64_t sub_22D8D63D8(void *a1, uint64_t a2, uint64_t a3, char a4)
{
  id v4;

  if ((a4 & 1) != 0)
    v4 = a1;
  return swift_retain();
}

uint64_t sub_22D8D6404(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  id *v9;

  sub_22D8D5A38(*(void **)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_BYTE *)(a1 + 24));
  v4 = *(_QWORD *)(a2 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = (a1 + *(unsigned __int8 *)(v5 + 80) + 25) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  if (!(*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v5 + 48))(v6, 1, v4))
    (*(void (**)(unint64_t, uint64_t))(v5 + 8))(v6, v4);
  v7 = v6 + *(_QWORD *)(v5 + 64);
  if (!*(_DWORD *)(v5 + 84))
    ++v7;
  v8 = (v7 + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_release();
  swift_release();
  v9 = (id *)((((v8 + 23) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFF8);

  return sub_22D8CC628(*(_QWORD *)(((((unint64_t)v9 + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8), *(_BYTE *)((((((unint64_t)v9 + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 8));
}

uint64_t sub_22D8D64D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const void *v14;
  int v15;
  size_t v16;
  size_t v17;
  size_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  _QWORD *v23;
  void **v24;
  void *v25;
  _QWORD *v26;
  _QWORD *v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  char v31;
  id v32;

  v6 = *(void **)a2;
  v7 = *(_QWORD *)(a2 + 8);
  v8 = *(_QWORD *)(a2 + 16);
  v9 = *(_BYTE *)(a2 + 24);
  sub_22D8D63D8(*(void **)a2, v7, v8, v9);
  *(_QWORD *)a1 = v6;
  *(_QWORD *)(a1 + 8) = v7;
  *(_QWORD *)(a1 + 16) = v8;
  *(_BYTE *)(a1 + 24) = v9;
  v10 = *(_QWORD *)(a3 + 16);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(unsigned __int8 *)(v11 + 80);
  v13 = (void *)((v12 + 25 + a1) & ~v12);
  v14 = (const void *)((v12 + 25 + a2) & ~v12);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48))(v14, 1, v10))
  {
    v15 = *(_DWORD *)(v11 + 84);
    v16 = *(_QWORD *)(v11 + 64);
    if (v15)
      v17 = v16;
    else
      v17 = v16 + 1;
    memcpy(v13, v14, v17);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 16))(v13, v14, v10);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v13, 0, 1, v10);
    v15 = *(_DWORD *)(v11 + 84);
    v16 = *(_QWORD *)(v11 + 64);
  }
  if (v15)
    v18 = v16;
  else
    v18 = v16 + 1;
  v19 = ((unint64_t)v13 + v18 + 7) & 0xFFFFFFFFFFFFFFF8;
  v20 = ((unint64_t)v14 + v18 + 7) & 0xFFFFFFFFFFFFFFF8;
  *(_BYTE *)v19 = *(_BYTE *)v20;
  *(_QWORD *)(v19 + 8) = *(_QWORD *)(v20 + 8);
  v21 = (v19 + 23) & 0xFFFFFFFFFFFFFFF8;
  v22 = (v20 + 23) & 0xFFFFFFFFFFFFFFF8;
  *(_BYTE *)v21 = *(_BYTE *)v22;
  *(_QWORD *)(v21 + 8) = *(_QWORD *)(v22 + 8);
  v23 = (_QWORD *)((v21 + 23) & 0xFFFFFFFFFFFFF8);
  v24 = (void **)((v22 + 23) & 0xFFFFFFFFFFFFF8);
  v25 = *v24;
  *v23 = *v24;
  v26 = (_QWORD *)(((unint64_t)v23 + 15) & 0xFFFFFFFFFFFFF8);
  v27 = (_QWORD *)(((unint64_t)v24 + 15) & 0xFFFFFFFFFFFFF8);
  *v26 = *v27;
  v28 = ((unint64_t)v26 + 15) & 0xFFFFFFFFFFFFFFF8;
  v29 = ((unint64_t)v27 + 15) & 0xFFFFFFFFFFFFFFF8;
  v30 = *(_QWORD *)v29;
  v31 = *(_BYTE *)(v29 + 8);
  swift_retain();
  swift_retain();
  v32 = v25;
  sub_22D8CE69C(v30, v31);
  *(_QWORD *)v28 = v30;
  *(_BYTE *)(v28 + 8) = v31;
  return a1;
}

uint64_t sub_22D8D6678(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t (*v19)(void *, uint64_t, uint64_t);
  int v20;
  size_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v35;

  v6 = *(void **)a2;
  v7 = *(_QWORD *)(a2 + 8);
  v8 = *(_QWORD *)(a2 + 16);
  v9 = *(_BYTE *)(a2 + 24);
  sub_22D8D63D8(*(void **)a2, v7, v8, v9);
  v10 = *(void **)a1;
  v11 = *(_QWORD *)(a1 + 8);
  v12 = *(_QWORD *)(a1 + 16);
  v13 = *(_BYTE *)(a1 + 24);
  *(_QWORD *)a1 = v6;
  *(_QWORD *)(a1 + 8) = v7;
  *(_QWORD *)(a1 + 16) = v8;
  *(_BYTE *)(a1 + 24) = v9;
  sub_22D8D5A38(v10, v11, v12, v13);
  v14 = *(_QWORD *)(a3 + 16);
  v15 = *(_QWORD *)(v14 - 8);
  v16 = *(unsigned __int8 *)(v15 + 80);
  v17 = (void *)((v16 + 25 + a1) & ~v16);
  v18 = (void *)((v16 + 25 + a2) & ~v16);
  v19 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v15 + 48);
  LODWORD(v7) = v19(v17, 1, v14);
  v20 = v19(v18, 1, v14);
  if ((_DWORD)v7)
  {
    if (!v20)
    {
      (*(void (**)(void *, void *, uint64_t))(v15 + 16))(v17, v18, v14);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v17, 0, 1, v14);
      goto LABEL_10;
    }
  }
  else
  {
    if (!v20)
    {
      (*(void (**)(void *, void *, uint64_t))(v15 + 24))(v17, v18, v14);
      goto LABEL_10;
    }
    (*(void (**)(void *, uint64_t))(v15 + 8))(v17, v14);
  }
  if (*(_DWORD *)(v15 + 84))
    v21 = *(_QWORD *)(v15 + 64);
  else
    v21 = *(_QWORD *)(v15 + 64) + 1;
  memcpy(v17, v18, v21);
LABEL_10:
  if (*(_DWORD *)(v15 + 84))
    v22 = *(_QWORD *)(v15 + 64);
  else
    v22 = *(_QWORD *)(v15 + 64) + 1;
  v23 = ((unint64_t)v17 + v22 + 7) & 0xFFFFFFFFFFFFFFF8;
  v24 = ((unint64_t)v18 + v22 + 7) & 0xFFFFFFFFFFFFFFF8;
  *(_BYTE *)v23 = *(_BYTE *)v24;
  *(_QWORD *)(v23 + 8) = *(_QWORD *)(v24 + 8);
  swift_retain();
  swift_release();
  v25 = (v23 + 23) & 0xFFFFFFFFFFFFFFF8;
  v26 = (v24 + 23) & 0xFFFFFFFFFFFFFFF8;
  *(_BYTE *)v25 = *(_BYTE *)v26;
  *(_QWORD *)(v25 + 8) = *(_QWORD *)(v26 + 8);
  swift_retain();
  swift_release();
  v27 = (v25 + 23) & 0xFFFFFFFFFFFFFFF8;
  v28 = (v26 + 23) & 0xFFFFFFFFFFFFF8;
  v29 = *(void **)v28;
  v28 += 15;
  v30 = *(void **)v27;
  *(_QWORD *)v27 = v29;
  v27 += 15;
  v31 = v29;

  *(_QWORD *)(v27 & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(v28 & 0xFFFFFFFFFFFFF8);
  v32 = ((v27 & 0xFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8;
  v33 = *(_QWORD *)(((v28 & 0xFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8);
  LOBYTE(v28) = *(_BYTE *)((((v28 & 0xFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 8);
  sub_22D8CE69C(v33, v28);
  v34 = *(_QWORD *)v32;
  v35 = *(_BYTE *)(v32 + 8);
  *(_QWORD *)v32 = v33;
  *(_BYTE *)(v32 + 8) = v28;
  sub_22D8CC628(v34, v35);
  return a1;
}

_OWORD *sub_22D8D6898(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const void *v8;
  int v9;
  size_t v10;
  size_t v11;
  size_t v12;
  _OWORD *v13;
  _OWORD *v14;
  _OWORD *v15;
  _OWORD *v16;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD *v19;
  _QWORD *v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;

  *a1 = *a2;
  *(_OWORD *)((char *)a1 + 9) = *(_OWORD *)((char *)a2 + 9);
  v4 = *(_QWORD *)(a3 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(unsigned __int8 *)(v5 + 80);
  v7 = (void *)(((unint64_t)a1 + v6 + 25) & ~v6);
  v8 = (const void *)(((unint64_t)a2 + v6 + 25) & ~v6);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v5 + 48))(v8, 1, v4))
  {
    v9 = *(_DWORD *)(v5 + 84);
    v10 = *(_QWORD *)(v5 + 64);
    if (v9)
      v11 = v10;
    else
      v11 = v10 + 1;
    memcpy(v7, v8, v11);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v5 + 32))(v7, v8, v4);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v5 + 56))(v7, 0, 1, v4);
    v9 = *(_DWORD *)(v5 + 84);
    v10 = *(_QWORD *)(v5 + 64);
  }
  if (v9)
    v12 = v10;
  else
    v12 = v10 + 1;
  v13 = (_OWORD *)(((unint64_t)v7 + v12 + 7) & 0xFFFFFFFFFFFFFFF8);
  v14 = (_OWORD *)(((unint64_t)v8 + v12 + 7) & 0xFFFFFFFFFFFFFFF8);
  *v13 = *v14;
  v15 = (_OWORD *)(((unint64_t)v13 + 23) & 0xFFFFFFFFFFFFFFF8);
  v16 = (_OWORD *)(((unint64_t)v14 + 23) & 0xFFFFFFFFFFFFFFF8);
  *v15 = *v16;
  v17 = (_QWORD *)(((unint64_t)v15 + 23) & 0xFFFFFFFFFFFFFFF8);
  v18 = (_QWORD *)(((unint64_t)v16 + 23) & 0xFFFFFFFFFFFFFFF8);
  *v17 = *v18;
  v19 = (_QWORD *)(((unint64_t)v17 + 15) & 0xFFFFFFFFFFFFF8);
  v20 = (_QWORD *)(((unint64_t)v18 + 15) & 0xFFFFFFFFFFFFFFF8);
  *v19 = *v20;
  v21 = ((unint64_t)v20 + 15) & 0xFFFFFFFFFFFFFFF8;
  v22 = *(_QWORD *)v21;
  v23 = ((unint64_t)v19 + 15) & 0xFFFFFFFFFFFFFFF8;
  *(_BYTE *)(v23 + 8) = *(_BYTE *)(v21 + 8);
  *(_QWORD *)v23 = v22;
  return a1;
}

uint64_t sub_22D8D69D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  char v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t (*v17)(void *, uint64_t, uint64_t);
  int v18;
  int v19;
  size_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  unint64_t v30;
  char v31;
  uint64_t v32;
  char v33;

  v6 = *(_QWORD *)(a2 + 16);
  v7 = *(_BYTE *)(a2 + 24);
  v8 = *(void **)a1;
  v9 = *(_QWORD *)(a1 + 8);
  v10 = *(_QWORD *)(a1 + 16);
  v11 = *(_BYTE *)(a1 + 24);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = v6;
  *(_BYTE *)(a1 + 24) = v7;
  sub_22D8D5A38(v8, v9, v10, v11);
  v12 = *(_QWORD *)(a3 + 16);
  v13 = *(_QWORD *)(v12 - 8);
  v14 = *(unsigned __int8 *)(v13 + 80);
  v15 = (void *)((v14 + 25 + a1) & ~v14);
  v16 = (void *)((v14 + 25 + a2) & ~v14);
  v17 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v13 + 48);
  v18 = v17(v15, 1, v12);
  v19 = v17(v16, 1, v12);
  if (v18)
  {
    if (!v19)
    {
      (*(void (**)(void *, void *, uint64_t))(v13 + 32))(v15, v16, v12);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v15, 0, 1, v12);
      goto LABEL_10;
    }
  }
  else
  {
    if (!v19)
    {
      (*(void (**)(void *, void *, uint64_t))(v13 + 40))(v15, v16, v12);
      goto LABEL_10;
    }
    (*(void (**)(void *, uint64_t))(v13 + 8))(v15, v12);
  }
  if (*(_DWORD *)(v13 + 84))
    v20 = *(_QWORD *)(v13 + 64);
  else
    v20 = *(_QWORD *)(v13 + 64) + 1;
  memcpy(v15, v16, v20);
LABEL_10:
  if (*(_DWORD *)(v13 + 84))
    v21 = *(_QWORD *)(v13 + 64);
  else
    v21 = *(_QWORD *)(v13 + 64) + 1;
  v22 = ((unint64_t)v15 + v21 + 7) & 0xFFFFFFFFFFFFFFF8;
  v23 = ((unint64_t)v16 + v21 + 7) & 0xFFFFFFFFFFFFFFF8;
  *(_BYTE *)v22 = *(_BYTE *)v23;
  *(_QWORD *)(v22 + 8) = *(_QWORD *)(v23 + 8);
  swift_release();
  v24 = (v22 + 23) & 0xFFFFFFFFFFFFFFF8;
  v25 = (v23 + 23) & 0xFFFFFFFFFFFFFFF8;
  *(_BYTE *)v24 = *(_BYTE *)v25;
  *(_QWORD *)(v24 + 8) = *(_QWORD *)(v25 + 8);
  swift_release();
  v26 = (v24 + 23) & 0xFFFFFFFFFFFFFFF8;
  v27 = (v25 + 23) & 0xFFFFFFFFFFFFF8;
  v28 = *(_QWORD *)v27;
  v27 += 15;
  v29 = *(void **)v26;
  *(_QWORD *)v26 = v28;
  v26 += 15;

  *(_QWORD *)(v26 & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(v27 & 0xFFFFFFFFFFFFF8);
  v30 = ((v26 & 0xFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8;
  v31 = *(_BYTE *)((((v27 & 0xFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 8);
  v32 = *(_QWORD *)v30;
  v33 = *(_BYTE *)(v30 + 8);
  *(_QWORD *)v30 = *(_QWORD *)(((v27 & 0xFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8);
  *(_BYTE *)(v30 + 8) = v31;
  sub_22D8CC628(v32, v33);
  return a1;
}

uint64_t sub_22D8D6BC0(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  int v5;
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v17;
  unsigned int v18;
  unint64_t v19;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  if (v5)
    v6 = v5 - 1;
  else
    v6 = 0;
  if (v6 <= 0x7FFFFFFF)
    v7 = 0x7FFFFFFF;
  else
    v7 = v6;
  v8 = *(_QWORD *)(v4 + 64);
  if (!v5)
    ++v8;
  if (!a2)
    return 0;
  v9 = *(unsigned __int8 *)(v4 + 80);
  v10 = v8 + 7;
  if (v7 < a2)
  {
    v11 = ((((((((((v10 + ((v9 + 25) & ~(_DWORD)v9)) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8) + 23) & 0xFFFFFFF8) + 15) & 0xFFFFFFF8)
          + 15) & 0xFFFFFFF8)
        + 9;
    v12 = (a2 - v7 + 255) >> (8 * v11);
    if (v11 < 4)
      v13 = v12 + 1;
    else
      v13 = 2;
    if (v13 >= 0x10000)
      v14 = 4;
    else
      v14 = 2;
    if (v13 < 0x100)
      v14 = 1;
    if (v13 >= 2)
      v15 = v14;
    else
      v15 = 0;
    __asm { BR              X17 }
  }
  v17 = (a1 + v9 + 25) & ~v9;
  if (v6 < 0x7FFFFFFF)
  {
    v19 = *(_QWORD *)((((((v10 + v17) & 0xFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFF8);
    if (v19 >= 0xFFFFFFFF)
      LODWORD(v19) = -1;
    return (v19 + 1);
  }
  else
  {
    v18 = (*(uint64_t (**)(uint64_t))(v4 + 48))(v17);
    if (v18 >= 2)
      return v18 - 1;
    else
      return 0;
  }
}

void sub_22D8D6D60(_BYTE *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  int v6;
  uint64_t v7;
  int v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  size_t v12;
  unsigned int v13;
  unsigned int v14;
  int v15;
  int v16;

  v6 = 0;
  v7 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  v8 = *(_DWORD *)(v7 + 84);
  if (v8)
    v9 = v8 - 1;
  else
    v9 = 0;
  if (v9 <= 0x7FFFFFFF)
    v10 = 0x7FFFFFFF;
  else
    v10 = v9;
  v11 = *(_QWORD *)(v7 + 64);
  if (!v8)
    ++v11;
  v12 = ((((((((((v11 + 7 + ((*(unsigned __int8 *)(v7 + 80) + 25) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80))) & 0xFFFFFFFFFFFFFFF8)
              + 23) & 0xFFFFFFFFFFFFFFF8)
            + 23) & 0xFFFFFFFFFFFFFFF8)
          + 15) & 0xFFFFFFFFFFFFFFF8)
        + 15) & 0xFFFFFFFFFFFFFFF8)
      + 9;
  if (v10 < a3)
  {
    v13 = (a3 - v10 + 255) >> (8 * v12);
    if (v12 <= 3)
      v14 = v13 + 1;
    else
      v14 = 2;
    if (v14 >= 0x10000)
      v15 = 4;
    else
      v15 = 2;
    if (v14 < 0x100)
      v15 = 1;
    if (v14 >= 2)
      v6 = v15;
    else
      v6 = 0;
  }
  if (v10 < a2)
  {
    if (v12 >= 4)
      v16 = ~v10 + a2;
    else
      v16 = (~(_BYTE)v10 + a2);
    bzero(a1, v12);
    if ((_DWORD)v12 == 1)
      *a1 = v16;
    else
      *(_DWORD *)a1 = v16;
    __asm { BR              X10 }
  }
  __asm { BR              X16 }
}

void sub_22D8D6EB8()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  *(_BYTE *)(v0 + v1) = v2;
  JUMPOUT(0x22D8D6FB0);
}

void sub_22D8D6EC0(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_DWORD *)(v2 + v3) = 0;
  if (a2)
    JUMPOUT(0x22D8D6EC8);
  JUMPOUT(0x22D8D6FB0);
}

void sub_22D8D6F40()
{
  _BYTE *v0;
  char v1;

  *v0 = v1;
  JUMPOUT(0x22D8D6FB0);
}

void sub_22D8D6F6C()
{
  uint64_t v0;
  uint64_t v1;
  __int16 v2;

  *(_WORD *)(v0 + v1) = v2;
  JUMPOUT(0x22D8D6FB0);
}

void sub_22D8D6F74()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  *(_DWORD *)(v0 + v1) = v2;
  JUMPOUT(0x22D8D6FB0);
}

void sub_22D8D6F7C(unsigned int a1@<W1>, size_t a2@<X8>)
{
  void *v2;
  int v3;
  uint64_t v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  *(_WORD *)(v7 + v8) = 0;
  if (a1)
  {
    v2 = (void *)((v7 + v6 + 25) & v4);
    if (v5 < 0x7FFFFFFF)
      JUMPOUT(0x22D8D6F48);
    if (v5 >= a1)
      JUMPOUT(0x22D8D6F88);
    if ((_DWORD)a2)
    {
      if (a2 <= 3)
        v3 = a2;
      else
        v3 = 4;
      bzero(v2, a2);
      __asm { BR              X10 }
    }
  }
  JUMPOUT(0x22D8D6FB0);
}

void sub_22D8D6FC4()
{
  uint64_t v0;
  int v1;

  *(_WORD *)v0 = v1;
  *(_BYTE *)(v0 + 2) = BYTE2(v1);
  JUMPOUT(0x22D8D6FB0);
}

void sub_22D8D6FD4()
{
  _WORD *v0;
  __int16 v1;

  *v0 = v1;
  JUMPOUT(0x22D8D6FB0);
}

void sub_22D8D6FDC()
{
  _DWORD *v0;
  int v1;

  *v0 = v1;
  JUMPOUT(0x22D8D6FB0);
}

uint64_t sub_22D8D6FE8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[2];
  uint64_t v8;
  _QWORD v9[2];
  uint64_t v10;

  v1 = *(_QWORD *)(a1 + 8);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255DA0338);
  v2 = sub_22D8E7124();
  v3 = sub_22D8E6E30();
  v4 = sub_22D8E6F38();
  sub_22D8E6CEC();
  v5 = sub_22D8E6D10();
  v10 = v1;
  v9[0] = sub_22D8D5358();
  v9[1] = MEMORY[0x22E31B14C](MEMORY[0x24BDF5578], v2, &v10);
  v8 = MEMORY[0x22E31B14C](MEMORY[0x24BDEF3E0], v3, v9);
  v7[0] = MEMORY[0x22E31B14C](MEMORY[0x24BDF3F50], v4, &v8);
  v7[1] = sub_22D8CE204();
  return MEMORY[0x22E31B14C](MEMORY[0x24BDED308], v5, v7);
}

uint64_t sub_22D8D70EC(uint64_t a1)
{
  return sub_22D8D5A38(*(void **)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_BYTE *)(a1 + 24));
}

uint64_t sub_22D8D7100(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  char v6;

  v3 = *(void **)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_BYTE *)(a2 + 24);
  sub_22D8D63D8(*(void **)a2, v4, v5, v6);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_BYTE *)(a1 + 24) = v6;
  return a1;
}

uint64_t sub_22D8D715C(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  char v10;

  v3 = *(void **)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_BYTE *)(a2 + 24);
  sub_22D8D63D8(*(void **)a2, v4, v5, v6);
  v7 = *(void **)a1;
  v8 = *(_QWORD *)(a1 + 8);
  v9 = *(_QWORD *)(a1 + 16);
  v10 = *(_BYTE *)(a1 + 24);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_BYTE *)(a1 + 24) = v6;
  sub_22D8D5A38(v7, v8, v9, v10);
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

uint64_t sub_22D8D71DC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  char v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  v3 = *(_QWORD *)(a2 + 16);
  v4 = *(_BYTE *)(a2 + 24);
  v5 = *(void **)a1;
  v7 = *(_QWORD *)(a1 + 8);
  v6 = *(_QWORD *)(a1 + 16);
  v8 = *(_BYTE *)(a1 + 24);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = v3;
  *(_BYTE *)(a1 + 24) = v4;
  sub_22D8D5A38(v5, v7, v6, v8);
  return a1;
}

uint64_t sub_22D8D7228(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 25))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 24);
  if (v3 <= 1)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t sub_22D8D7270(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_BYTE *)(result + 24) = 0;
    *(_QWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 25) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 25) = 0;
    if (a2)
      *(_BYTE *)(result + 24) = -(char)a2;
  }
  return result;
}

uint64_t sub_22D8D72B8(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 24);
}

uint64_t sub_22D8D72C0(uint64_t result, char a2)
{
  *(_BYTE *)(result + 24) = a2 & 1;
  return result;
}

uint64_t type metadata accessor for VerifyIdentityWithWalletButton.Configuration(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for VerifyIdentityWithWalletButton.Configuration);
}

uint64_t sub_22D8D72E0(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DA0338);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_22D8D7320(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  int *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;

  v5 = *(_QWORD *)(v4 + 16);
  v6 = (int *)type metadata accessor for VerifyIdentityWithWalletButton(0, v5, *(_QWORD *)(v4 + 24), a4);
  v7 = *((_QWORD *)v6 - 1);
  v8 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v9 = *(_QWORD *)(v7 + 64);
  v10 = v4 + v8;
  sub_22D8D5A38(*(void **)(v4 + v8), *(_QWORD *)(v4 + v8 + 8), *(_QWORD *)(v4 + v8 + 16), *(_BYTE *)(v4 + v8 + 24));
  v11 = v4 + v8 + v6[9];
  v12 = *(_QWORD *)(v5 - 8);
  if (!(*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v12 + 48))(v11, 1, v5))
    (*(void (**)(unint64_t, uint64_t))(v12 + 8))(v11, v5);
  swift_release();
  swift_release();

  sub_22D8CC628(*(_QWORD *)(v10 + v6[14]), *(_BYTE *)(v10 + v6[14] + 8));
  swift_release();
  return swift_deallocObject();
}

void sub_22D8D7444(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;

  v5 = *(_QWORD *)(v4 + 16);
  v6 = *(_QWORD *)(v4 + 24);
  v7 = *(_QWORD *)(type metadata accessor for VerifyIdentityWithWalletButton(0, v5, v6, a4) - 8);
  v8 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v9 = (*(_QWORD *)(v7 + 64) + v8 + 7) & 0xFFFFFFFFFFFFFFF8;
  sub_22D8D5E00(v4 + v8, *(_QWORD *)(v4 + v9), *(_QWORD *)(v4 + ((v9 + 15) & 0xFFFFFFFFFFFFFFF8)), *(_QWORD *)(v4 + ((v9 + 15) & 0xFFFFFFFFFFFFFFF8) + 8), v5, v6);
}

uint64_t sub_22D8D74B8@<X0>(char *a1@<X8>)
{
  return sub_22D8D4234(a1);
}

uint64_t sub_22D8D74C8()
{
  swift_release();
  return swift_deallocObject();
}

void sub_22D8D74EC(void *a1, void *a2)
{
  uint64_t v2;

  sub_22D8D5F84(a1, a2, *(void (**)(void *, uint64_t))(v2 + 16));
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

id sub_22D8D7578()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AddPassButtonView.Coordinator();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for AddPassButtonView.Coordinator()
{
  return objc_opt_self();
}

uint64_t destroy for AddPassButtonView()
{
  return swift_release();
}

_QWORD *_s16_PassKit_SwiftUI17AddPassButtonViewVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a2[1];
  v4 = a2[2];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = v4;
  swift_retain();
  return a1;
}

_QWORD *assignWithCopy for AddPassButtonView(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  *a1 = *a2;
  v3 = a2[2];
  a1[1] = a2[1];
  a1[2] = v3;
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for AddPassButtonView(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for AddPassButtonView(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 24))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AddPassButtonView(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 24) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for AddPassButtonView()
{
  return &type metadata for AddPassButtonView;
}

id sub_22D8D7744()
{
  _QWORD *v0;
  id v1;
  void *v3;

  v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE6FA68]), sel_initWithAddPassButtonStyle_, *v0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DA04D0);
  sub_22D8E6E3C();
  objc_msgSend(v1, sel_addTarget_action_forControlEvents_, v3, sel_callback, 0x2000);

  objc_msgSend(v1, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  return v1;
}

id sub_22D8D77EC@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  objc_class *v5;
  char *v6;
  char *v7;
  id result;
  objc_super v9;

  v4 = *(_QWORD *)(v1 + 8);
  v3 = *(_QWORD *)(v1 + 16);
  v5 = (objc_class *)type metadata accessor for AddPassButtonView.Coordinator();
  v6 = (char *)objc_allocWithZone(v5);
  v7 = &v6[OBJC_IVAR____TtCV16_PassKit_SwiftUI17AddPassButtonView11Coordinator_action];
  *(_QWORD *)v7 = v4;
  *((_QWORD *)v7 + 1) = v3;
  v9.receiver = v6;
  v9.super_class = v5;
  swift_retain();
  result = objc_msgSendSuper2(&v9, sel_init);
  *a1 = result;
  return result;
}

unint64_t sub_22D8D785C(uint64_t a1)
{
  unint64_t result;

  result = sub_22D8D7880();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_22D8D7880()
{
  unint64_t result;

  result = qword_255DA04C8;
  if (!qword_255DA04C8)
  {
    result = MEMORY[0x22E31B14C](&unk_22D8E8544, &type metadata for AddPassButtonView);
    atomic_store(result, (unint64_t *)&qword_255DA04C8);
  }
  return result;
}

uint64_t sub_22D8D78C4()
{
  sub_22D8D7880();
  return sub_22D8E6E00();
}

uint64_t sub_22D8D7914()
{
  sub_22D8D7880();
  return sub_22D8E6DAC();
}

void sub_22D8D7964()
{
  sub_22D8D7880();
  sub_22D8E6DF4();
  __break(1u);
}

void static AddPassToWalletButtonStyle.black.getter(_BYTE *a1@<X8>)
{
  *a1 = 0;
}

void static AddPassToWalletButtonStyle.blackOutline.getter(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

BOOL sub_22D8D799C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_22D8D79B4()
{
  sub_22D8E71CC();
  sub_22D8E71D8();
  return sub_22D8E71E4();
}

uint64_t sub_22D8D79F8()
{
  return sub_22D8E71D8();
}

uint64_t sub_22D8D7A20()
{
  sub_22D8E71CC();
  sub_22D8E71D8();
  return sub_22D8E71E4();
}

uint64_t View.addPassToWalletButtonStyle(_:)()
{
  swift_getKeyPath();
  sub_22D8E6ED8();
  return swift_release();
}

uint64_t sub_22D8D7AD0()
{
  sub_22D8D7EB4();
  return sub_22D8E6D64();
}

uint64_t sub_22D8D7B04@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;
  char v3;

  sub_22D8D7EB4();
  result = sub_22D8E6D64();
  *a1 = v3;
  return result;
}

uint64_t sub_22D8D7B50@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;
  char v3;

  sub_22D8D7EB4();
  result = sub_22D8E6D64();
  *a1 = v3;
  return result;
}

uint64_t sub_22D8D7B9C()
{
  sub_22D8D7EB4();
  return sub_22D8E6D70();
}

uint64_t sub_22D8D7BE4()
{
  sub_22D8D7EB4();
  return sub_22D8E6D70();
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for AddPassToWalletButtonStyle()
{
  return &type metadata for AddPassToWalletButtonStyle;
}

uint64_t sub_22D8D7C50(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD v4[2];

  v1 = *(_QWORD *)(a1 + 8);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255DA04D8);
  v2 = sub_22D8E6D10();
  v4[0] = v1;
  v4[1] = sub_22D8D7CB0();
  return MEMORY[0x22E31B14C](MEMORY[0x24BDED308], v2, v4);
}

unint64_t sub_22D8D7CB0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255DA04E0;
  if (!qword_255DA04E0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255DA04D8);
    result = MEMORY[0x22E31B14C](MEMORY[0x24BDF1028], v1);
    atomic_store(result, (unint64_t *)&qword_255DA04E0);
  }
  return result;
}

uint64_t _s16_PassKit_SwiftUI26AddPassToWalletButtonStyleV18AddPassButtonStyleOwet_0(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s16_PassKit_SwiftUI26AddPassToWalletButtonStyleV18AddPassButtonStyleOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_22D8D7DD8 + 4 * byte_22D8E8645[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_22D8D7E0C + 4 * byte_22D8E8640[v4]))();
}

uint64_t sub_22D8D7E0C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_22D8D7E14(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x22D8D7E1CLL);
  return result;
}

uint64_t sub_22D8D7E28(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x22D8D7E30);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_22D8D7E34(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22D8D7E3C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22D8D7E48(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_22D8D7E50(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for AddPassToWalletButtonStyle.AddPassButtonStyle()
{
  return &type metadata for AddPassToWalletButtonStyle.AddPassButtonStyle;
}

unint64_t sub_22D8D7E70()
{
  unint64_t result;

  result = qword_255DA04E8;
  if (!qword_255DA04E8)
  {
    result = MEMORY[0x22E31B14C](&unk_22D8E86F4, &type metadata for AddPassToWalletButtonStyle.AddPassButtonStyle);
    atomic_store(result, (unint64_t *)&qword_255DA04E8);
  }
  return result;
}

unint64_t sub_22D8D7EB4()
{
  unint64_t result;

  result = qword_255DA04F0;
  if (!qword_255DA04F0)
  {
    result = MEMORY[0x22E31B14C](&unk_22D8E8740, &type metadata for AddPassToWalletButtonStyleKey);
    atomic_store(result, (unint64_t *)&qword_255DA04F0);
  }
  return result;
}

ValueMetadata *type metadata accessor for AddPassToWalletButtonStyleKey()
{
  return &type metadata for AddPassToWalletButtonStyleKey;
}

void sub_22D8D7F08(_BYTE *a1@<X8>)
{
  *a1 = 0;
}

id sub_22D8D7F14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char *v3;
  char *v4;
  char *v5;
  uint64_t v6;
  char *v7;
  objc_super v9;

  v4 = &v3[OBJC_IVAR____TtC16_PassKit_SwiftUI31PaymentAuthorizationCoordinator_onMerchantSessionRequested];
  *(_QWORD *)v4 = 0;
  *((_QWORD *)v4 + 1) = 0;
  v5 = &v3[OBJC_IVAR____TtC16_PassKit_SwiftUI31PaymentAuthorizationCoordinator_onPaymentAuthorizationCompletion];
  *(_QWORD *)v5 = 0;
  *((_QWORD *)v5 + 1) = 0;
  v6 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)&v3[OBJC_IVAR____TtC16_PassKit_SwiftUI31PaymentAuthorizationCoordinator_onPaymentMethodChange] = MEMORY[0x24BEE4AF8];
  *(_QWORD *)&v3[OBJC_IVAR____TtC16_PassKit_SwiftUI31PaymentAuthorizationCoordinator_onShippingContactChange] = v6;
  *(_QWORD *)&v3[OBJC_IVAR____TtC16_PassKit_SwiftUI31PaymentAuthorizationCoordinator_onShippingChange] = v6;
  *(_QWORD *)&v3[OBJC_IVAR____TtC16_PassKit_SwiftUI31PaymentAuthorizationCoordinator_onCouponCodeChange] = v6;
  *(_QWORD *)&v3[OBJC_IVAR____TtC16_PassKit_SwiftUI31PaymentAuthorizationCoordinator_activeWindow] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC16_PassKit_SwiftUI31PaymentAuthorizationCoordinator_underlyingCoordinator] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC16_PassKit_SwiftUI31PaymentAuthorizationCoordinator_request] = a1;
  v7 = &v3[OBJC_IVAR____TtC16_PassKit_SwiftUI31PaymentAuthorizationCoordinator_onPaymentAuthorizationChange];
  *(_QWORD *)v7 = a2;
  *((_QWORD *)v7 + 1) = a3;
  v9.receiver = v3;
  v9.super_class = (Class)type metadata accessor for PaymentAuthorizationCoordinator();
  return objc_msgSendSuper2(&v9, sel_init);
}

void sub_22D8D7FD0()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[6];

  v1 = OBJC_IVAR____TtC16_PassKit_SwiftUI31PaymentAuthorizationCoordinator_underlyingCoordinator;
  if (!*(_QWORD *)(v0 + OBJC_IVAR____TtC16_PassKit_SwiftUI31PaymentAuthorizationCoordinator_underlyingCoordinator))
  {
    if (*(_QWORD *)(v0 + OBJC_IVAR____TtC16_PassKit_SwiftUI31PaymentAuthorizationCoordinator_activeWindow))
    {
      v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE6FAB0]), sel_initWithPaymentRequest_, *(_QWORD *)(v0 + OBJC_IVAR____TtC16_PassKit_SwiftUI31PaymentAuthorizationCoordinator_request));
      v3 = *(void **)(v0 + v1);
      *(_QWORD *)(v0 + v1) = v2;

      v4 = *(void **)(v0 + v1);
      if (v4)
      {
        objc_msgSend(v4, sel_setDelegate_, v0);
        v5 = *(void **)(v0 + v1);
        if (v5)
        {
          v6 = swift_allocObject();
          swift_unknownObjectWeakInit();
          v9[4] = sub_22D8DB7A4;
          v9[5] = v6;
          v9[0] = MEMORY[0x24BDAC760];
          v9[1] = 1107296256;
          v9[2] = sub_22D8D821C;
          v9[3] = &block_descriptor_0;
          v7 = _Block_copy(v9);
          v8 = v5;
          swift_release();
          objc_msgSend(v8, sel_presentWithCompletion_, v7);
          _Block_release(v7);

        }
      }
    }
    else
    {
      sub_22D8D8120();
    }
  }
}

void sub_22D8D8120()
{
  uint64_t v0;
  uint64_t v1;
  void (*v2)(_QWORD *);
  void (*v3)(uint64_t);
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[3];

  v1 = v0;
  v2 = *(void (**)(_QWORD *))(v0
                                       + OBJC_IVAR____TtC16_PassKit_SwiftUI31PaymentAuthorizationCoordinator_onPaymentAuthorizationChange);
  v7[1] = 0;
  v7[2] = 0;
  v7[0] = 1;
  v2(v7);
  v3 = *(void (**)(uint64_t))(v0
                                      + OBJC_IVAR____TtC16_PassKit_SwiftUI31PaymentAuthorizationCoordinator_onPaymentAuthorizationCompletion);
  if (v3)
  {
    v4 = swift_retain();
    v3(v4);
    sub_22D8CC6BC((uint64_t)v3);
  }
  v5 = OBJC_IVAR____TtC16_PassKit_SwiftUI31PaymentAuthorizationCoordinator_underlyingCoordinator;
  v6 = *(void **)(v1 + OBJC_IVAR____TtC16_PassKit_SwiftUI31PaymentAuthorizationCoordinator_underlyingCoordinator);
  if (v6)
  {
    objc_msgSend(v6, sel_dismissWithCompletion_, 0);
    v6 = *(void **)(v1 + v5);
  }
  *(_QWORD *)(v1 + v5) = 0;

}

void sub_22D8D81C8(char a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if ((a1 & 1) == 0)
  {
    v2 = a2 + 16;
    swift_beginAccess();
    v3 = MEMORY[0x22E31B254](v2);
    if (v3)
    {
      v4 = (void *)v3;
      sub_22D8D8120();

    }
  }
}

uint64_t sub_22D8D821C(uint64_t a1, uint64_t a2)
{
  void (*v3)(uint64_t);

  v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

id sub_22D8D8258()
{
  uint64_t v0;
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  id v6;

  v1 = *(void **)(v0 + OBJC_IVAR____TtC16_PassKit_SwiftUI31PaymentAuthorizationCoordinator_request);
  v2 = objc_msgSend(v1, sel_supportedNetworks);
  type metadata accessor for PKPaymentNetwork(0);
  v3 = sub_22D8E7070();

  v4 = *(_QWORD *)(v3 + 16);
  swift_bridgeObjectRelease();
  if (!v4 && !objc_msgSend(v1, sel_merchantCapabilities))
    return objc_msgSend((id)objc_opt_self(), sel_canMakePayments);
  v5 = objc_msgSend(v1, sel_supportedNetworks);
  if (!v5)
  {
    sub_22D8E7070();
    v5 = (id)sub_22D8E7064();
    swift_bridgeObjectRelease();
  }
  v6 = objc_msgSend((id)objc_opt_self(), sel_canMakePaymentsUsingNetworks_capabilities_, v5, objc_msgSend(v1, sel_merchantCapabilities));

  return v6;
}

id sub_22D8D83B4()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PaymentAuthorizationCoordinator();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for PaymentAuthorizationCoordinator()
{
  return objc_opt_self();
}

uint64_t sub_22D8D84C8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 40) = a1;
  *(_QWORD *)(v2 + 48) = v1;
  return swift_task_switch();
}

uint64_t sub_22D8D84E0()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  int *v4;
  _QWORD *v5;
  id v7;
  void *v8;
  id v9;
  uint64_t (*v10)(uint64_t, uint64_t);

  v1 = *(_QWORD **)(*(_QWORD *)(v0 + 48)
                  + OBJC_IVAR____TtC16_PassKit_SwiftUI31PaymentAuthorizationCoordinator_onPaymentMethodChange);
  *(_QWORD *)(v0 + 56) = v1;
  v2 = v1[2];
  *(_QWORD *)(v0 + 64) = v2;
  if (v2)
  {
    *(_QWORD *)(v0 + 16) = MEMORY[0x24BEE4AF8];
    *(_QWORD *)(v0 + 72) = 0;
    v3 = *(_QWORD *)(v0 + 40);
    *(_QWORD *)(v0 + 80) = v1[5];
    v4 = (int *)v1[4];
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 24) = v3;
    v10 = (uint64_t (*)(uint64_t, uint64_t))((char *)v4 + *v4);
    swift_retain();
    v5 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 88) = v5;
    *v5 = v0;
    v5[1] = sub_22D8D8628;
    return v10(v0 + 32, v0 + 24);
  }
  else
  {
    v7 = objc_allocWithZone(MEMORY[0x24BE6ED10]);
    sub_22D8DAD00(0, &qword_255DA0630);
    v8 = (void *)sub_22D8E7064();
    v9 = objc_msgSend(v7, sel_initWithErrors_paymentSummaryItems_, 0, v8);

    return (*(uint64_t (**)(id))(v0 + 8))(v9);
  }
}

uint64_t sub_22D8D8628()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_task_dealloc();
  swift_release();
  *(_QWORD *)(v1 + 96) = *(_QWORD *)(v1 + 32);
  return swift_task_switch();
}

id sub_22D8D8688()
{
  uint64_t v0;
  id result;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  unint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int *v16;
  _QWORD *v17;
  uint64_t (*v18)(uint64_t, uint64_t);

  result = objc_msgSend(*(id *)(v0 + 96), sel_errors);
  if (result)
  {
    v2 = result;
    __swift_instantiateConcreteTypeFromMangledName(&qword_255DA0628);
    v3 = sub_22D8E7070();

    v4 = *(_QWORD *)(v3 + 16);
    swift_bridgeObjectRelease();
    if (v4 || objc_msgSend(*(id *)(v0 + 96), sel_status))
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v5 = *(id *)(v0 + 96);
      return (id)(*(uint64_t (**)(id))(v0 + 8))(v5);
    }
    v6 = *(void **)(v0 + 96);
    v7 = *(_QWORD *)(v0 + 64);
    v8 = *(_QWORD *)(v0 + 72) + 1;
    v9 = objc_msgSend(v6, sel_paymentSummaryItems);
    sub_22D8DAD00(0, &qword_255DA0630);
    v10 = sub_22D8E7070();

    sub_22D8D88A8(v10, sub_22D8DAEF0);
    if (v8 == v7)
    {
      swift_bridgeObjectRelease();
      v11 = objc_allocWithZone(MEMORY[0x24BE6ED10]);
      v12 = (void *)sub_22D8E7064();
      swift_bridgeObjectRelease();
      v5 = objc_msgSend(v11, sel_initWithErrors_paymentSummaryItems_, 0, v12);

      return (id)(*(uint64_t (**)(id))(v0 + 8))(v5);
    }
    v13 = *(_QWORD *)(v0 + 72) + 1;
    *(_QWORD *)(v0 + 72) = v13;
    v14 = *(_QWORD *)(v0 + 40);
    v15 = *(_QWORD *)(v0 + 56) + 16 * v13;
    *(_QWORD *)(v0 + 80) = *(_QWORD *)(v15 + 40);
    v16 = *(int **)(v15 + 32);
    *(_QWORD *)(v0 + 24) = v14;
    v18 = (uint64_t (*)(uint64_t, uint64_t))((char *)v16 + *v16);
    swift_retain();
    v17 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 88) = v17;
    *v17 = v0;
    v17[1] = sub_22D8D8628;
    return (id)v18(v0 + 32, v0 + 24);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_22D8D88A8(unint64_t a1, uint64_t (*a2)(uint64_t, _QWORD, unint64_t))
{
  unint64_t *v2;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v5 = sub_22D8E7190();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v6 = *v2;
  if (*v2 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_22D8E7190();
    swift_bridgeObjectRelease();
    v8 = v7 + v5;
    if (!__OFADD__(v7, v5))
      goto LABEL_5;
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v7 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
  v8 = v7 + v5;
  if (__OFADD__(v7, v5))
    goto LABEL_23;
LABEL_5:
  v6 = *v2;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *v2 = v6;
  v7 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v6 & 0x8000000000000000) == 0 && (v6 & 0x4000000000000000) == 0)
  {
    v10 = v6 & 0xFFFFFFFFFFFFFF8;
    if (v8 <= *(_QWORD *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      goto LABEL_15;
    v7 = 1;
  }
  if (v6 >> 62)
    goto LABEL_25;
  v11 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v11 <= v8)
      v11 = v8;
    swift_bridgeObjectRetain();
    v6 = MEMORY[0x22E31ACCC](v7, v11, 1, v6);
    swift_bridgeObjectRelease();
    *v2 = v6;
    v10 = v6 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    result = a2(v10 + 8 * *(_QWORD *)(v10 + 16) + 32, (*(_QWORD *)(v10 + 24) >> 1) - *(_QWORD *)(v10 + 16), a1);
    if (v13 >= v5)
      break;
LABEL_24:
    __break(1u);
LABEL_25:
    swift_bridgeObjectRetain();
    v11 = sub_22D8E7190();
    swift_bridgeObjectRelease();
  }
  if (v13 < 1)
    goto LABEL_19;
  v14 = *(_QWORD *)((*v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  v15 = __OFADD__(v14, v13);
  v16 = v14 + v13;
  if (!v15)
  {
    *(_QWORD *)((*v2 & 0xFFFFFFFFFFFFFF8) + 0x10) = v16;
LABEL_19:
    swift_bridgeObjectRelease();
    return sub_22D8E707C();
  }
  __break(1u);
  return result;
}

_QWORD *sub_22D8D8A64(_QWORD *result)
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
  result = sub_22D8DFD4C(result, v10, 1, v3);
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
  __swift_instantiateConcreteTypeFromMangledName(qword_255DA0700);
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

uint64_t sub_22D8D8B5C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 48) = a1;
  *(_QWORD *)(v2 + 56) = v1;
  return swift_task_switch();
}

uint64_t sub_22D8D8B74()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int *v5;
  _QWORD *v6;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t (*v12)(uint64_t, uint64_t);

  v1 = *(_QWORD **)(*(_QWORD *)(v0 + 56)
                  + OBJC_IVAR____TtC16_PassKit_SwiftUI31PaymentAuthorizationCoordinator_onShippingContactChange);
  *(_QWORD *)(v0 + 64) = v1;
  v2 = v1[2];
  *(_QWORD *)(v0 + 72) = v2;
  if (v2)
  {
    v3 = MEMORY[0x24BEE4AF8];
    *(_QWORD *)(v0 + 16) = MEMORY[0x24BEE4AF8];
    *(_QWORD *)(v0 + 24) = v3;
    *(_QWORD *)(v0 + 80) = 0;
    v4 = *(_QWORD *)(v0 + 48);
    *(_QWORD *)(v0 + 88) = v1[5];
    v5 = (int *)v1[4];
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 32) = v4;
    v12 = (uint64_t (*)(uint64_t, uint64_t))((char *)v5 + *v5);
    swift_retain();
    v6 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 96) = v6;
    *v6 = v0;
    v6[1] = sub_22D8D8CF0;
    return v12(v0 + 40, v0 + 32);
  }
  else
  {
    v8 = objc_allocWithZone(MEMORY[0x24BE6ED18]);
    sub_22D8DAD00(0, &qword_255DA0630);
    v9 = (void *)sub_22D8E7064();
    sub_22D8DAD00(0, &qword_255DA0638);
    v10 = (void *)sub_22D8E7064();
    v11 = objc_msgSend(v8, sel_initWithErrors_paymentSummaryItems_shippingMethods_, 0, v9, v10);

    return (*(uint64_t (**)(id))(v0 + 8))(v11);
  }
}

uint64_t sub_22D8D8CF0()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_task_dealloc();
  swift_release();
  *(_QWORD *)(v1 + 104) = *(_QWORD *)(v1 + 40);
  return swift_task_switch();
}

id sub_22D8D8D50()
{
  uint64_t v0;
  id result;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  unint64_t v10;
  id v11;
  unint64_t v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int *v19;
  _QWORD *v20;
  uint64_t (*v21)(uint64_t, uint64_t);

  result = objc_msgSend(*(id *)(v0 + 104), sel_errors);
  if (result)
  {
    v2 = result;
    __swift_instantiateConcreteTypeFromMangledName(&qword_255DA0628);
    v3 = sub_22D8E7070();

    v4 = *(_QWORD *)(v3 + 16);
    swift_bridgeObjectRelease();
    if (v4 || objc_msgSend(*(id *)(v0 + 104), sel_status))
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v5 = *(id *)(v0 + 104);
      return (id)(*(uint64_t (**)(id))(v0 + 8))(v5);
    }
    v6 = *(void **)(v0 + 104);
    v7 = *(_QWORD *)(v0 + 72);
    v8 = *(_QWORD *)(v0 + 80) + 1;
    v9 = objc_msgSend(v6, sel_paymentSummaryItems);
    sub_22D8DAD00(0, &qword_255DA0630);
    v10 = sub_22D8E7070();

    sub_22D8D88A8(v10, sub_22D8DAEF0);
    v11 = objc_msgSend(v6, sel_shippingMethods);
    sub_22D8DAD00(0, &qword_255DA0638);
    v12 = sub_22D8E7070();

    sub_22D8D88A8(v12, sub_22D8DB0A0);
    if (v8 == v7)
    {
      swift_bridgeObjectRelease();
      v13 = objc_allocWithZone(MEMORY[0x24BE6ED18]);
      v14 = (void *)sub_22D8E7064();
      swift_bridgeObjectRelease();
      v15 = (void *)sub_22D8E7064();
      swift_bridgeObjectRelease();
      v5 = objc_msgSend(v13, sel_initWithErrors_paymentSummaryItems_shippingMethods_, 0, v14, v15);

      return (id)(*(uint64_t (**)(id))(v0 + 8))(v5);
    }
    v16 = *(_QWORD *)(v0 + 80) + 1;
    *(_QWORD *)(v0 + 80) = v16;
    v17 = *(_QWORD *)(v0 + 48);
    v18 = *(_QWORD *)(v0 + 64) + 16 * v16;
    *(_QWORD *)(v0 + 88) = *(_QWORD *)(v18 + 40);
    v19 = *(int **)(v18 + 32);
    *(_QWORD *)(v0 + 32) = v17;
    v21 = (uint64_t (*)(uint64_t, uint64_t))((char *)v19 + *v19);
    swift_retain();
    v20 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 96) = v20;
    *v20 = v0;
    v20[1] = sub_22D8D8CF0;
    return (id)v21(v0 + 40, v0 + 32);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_22D8D9004(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 40) = a1;
  *(_QWORD *)(v2 + 48) = v1;
  return swift_task_switch();
}

uint64_t sub_22D8D901C()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  int *v4;
  _QWORD *v5;
  id v7;
  void *v8;
  id v9;
  uint64_t (*v10)(uint64_t, uint64_t);

  v1 = *(_QWORD **)(*(_QWORD *)(v0 + 48)
                  + OBJC_IVAR____TtC16_PassKit_SwiftUI31PaymentAuthorizationCoordinator_onShippingChange);
  *(_QWORD *)(v0 + 56) = v1;
  v2 = v1[2];
  *(_QWORD *)(v0 + 64) = v2;
  if (v2)
  {
    *(_QWORD *)(v0 + 16) = MEMORY[0x24BEE4AF8];
    *(_QWORD *)(v0 + 72) = 0;
    v3 = *(_QWORD *)(v0 + 40);
    *(_QWORD *)(v0 + 80) = v1[5];
    v4 = (int *)v1[4];
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 24) = v3;
    v10 = (uint64_t (*)(uint64_t, uint64_t))((char *)v4 + *v4);
    swift_retain();
    v5 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 88) = v5;
    *v5 = v0;
    v5[1] = sub_22D8D9160;
    return v10(v0 + 32, v0 + 24);
  }
  else
  {
    v7 = objc_allocWithZone(MEMORY[0x24BE6ED20]);
    sub_22D8DAD00(0, &qword_255DA0630);
    v8 = (void *)sub_22D8E7064();
    v9 = objc_msgSend(v7, sel_initWithPaymentSummaryItems_, v8);

    return (*(uint64_t (**)(id))(v0 + 8))(v9);
  }
}

uint64_t sub_22D8D9160()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_task_dealloc();
  swift_release();
  *(_QWORD *)(v1 + 96) = *(_QWORD *)(v1 + 32);
  return swift_task_switch();
}

uint64_t sub_22D8D91C0()
{
  uint64_t v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  unint64_t v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  int *v12;
  _QWORD *v13;
  uint64_t (*v14)(uint64_t, uint64_t);

  if (objc_msgSend(*(id *)(v0 + 96), sel_status))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v1 = *(id *)(v0 + 96);
    return (*(uint64_t (**)(id))(v0 + 8))(v1);
  }
  v2 = *(void **)(v0 + 96);
  v3 = *(_QWORD *)(v0 + 64);
  v4 = *(_QWORD *)(v0 + 72) + 1;
  v5 = objc_msgSend(v2, sel_paymentSummaryItems);
  sub_22D8DAD00(0, &qword_255DA0630);
  v6 = sub_22D8E7070();

  sub_22D8D88A8(v6, sub_22D8DAEF0);
  if (v4 == v3)
  {
    swift_bridgeObjectRelease();
    v7 = objc_allocWithZone(MEMORY[0x24BE6ED20]);
    v8 = (void *)sub_22D8E7064();
    swift_bridgeObjectRelease();
    v1 = objc_msgSend(v7, sel_initWithPaymentSummaryItems_, v8);

    return (*(uint64_t (**)(id))(v0 + 8))(v1);
  }
  *(_QWORD *)(v0 + 72) = v4;
  v10 = *(_QWORD *)(v0 + 40);
  v11 = *(_QWORD *)(v0 + 56) + 16 * v4;
  *(_QWORD *)(v0 + 80) = *(_QWORD *)(v11 + 40);
  v12 = *(int **)(v11 + 32);
  *(_QWORD *)(v0 + 24) = v10;
  v14 = (uint64_t (*)(uint64_t, uint64_t))((char *)v12 + *v12);
  swift_retain();
  v13 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 88) = v13;
  *v13 = v0;
  v13[1] = sub_22D8D9160;
  return v14(v0 + 32, v0 + 24);
}

uint64_t sub_22D8D9384(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[8] = a2;
  v3[9] = v2;
  v3[7] = a1;
  return swift_task_switch();
}

uint64_t sub_22D8D93A0()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int *v6;
  _QWORD *v7;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t (*v13)(uint64_t, uint64_t);

  v1 = *(_QWORD **)(*(_QWORD *)(v0 + 72)
                  + OBJC_IVAR____TtC16_PassKit_SwiftUI31PaymentAuthorizationCoordinator_onCouponCodeChange);
  *(_QWORD *)(v0 + 80) = v1;
  v2 = v1[2];
  *(_QWORD *)(v0 + 88) = v2;
  if (v2)
  {
    v3 = MEMORY[0x24BEE4AF8];
    *(_QWORD *)(v0 + 32) = MEMORY[0x24BEE4AF8];
    *(_QWORD *)(v0 + 40) = v3;
    *(_QWORD *)(v0 + 96) = 0;
    v5 = *(_QWORD *)(v0 + 56);
    v4 = *(_QWORD *)(v0 + 64);
    *(_QWORD *)(v0 + 104) = v1[5];
    v6 = (int *)v1[4];
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 16) = v5;
    *(_QWORD *)(v0 + 24) = v4;
    v13 = (uint64_t (*)(uint64_t, uint64_t))((char *)v6 + *v6);
    swift_retain();
    v7 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 112) = v7;
    *v7 = v0;
    v7[1] = sub_22D8D9528;
    return v13(v0 + 48, v0 + 16);
  }
  else
  {
    v9 = objc_allocWithZone(MEMORY[0x24BE6ED00]);
    sub_22D8DAD00(0, &qword_255DA0630);
    v10 = (void *)sub_22D8E7064();
    sub_22D8DAD00(0, &qword_255DA0638);
    v11 = (void *)sub_22D8E7064();
    v12 = objc_msgSend(v9, sel_initWithErrors_paymentSummaryItems_shippingMethods_, 0, v10, v11);

    return (*(uint64_t (**)(id))(v0 + 8))(v12);
  }
}

uint64_t sub_22D8D9528()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_task_dealloc();
  swift_release();
  *(_QWORD *)(v1 + 120) = *(_QWORD *)(v1 + 48);
  return swift_task_switch();
}

id sub_22D8D9588()
{
  uint64_t v0;
  id result;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  unint64_t v10;
  id v11;
  unint64_t v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int *v20;
  _QWORD *v21;
  uint64_t (*v22)(uint64_t, uint64_t);

  result = objc_msgSend(*(id *)(v0 + 120), sel_errors);
  if (result)
  {
    v2 = result;
    __swift_instantiateConcreteTypeFromMangledName(&qword_255DA0628);
    v3 = sub_22D8E7070();

    v4 = *(_QWORD *)(v3 + 16);
    swift_bridgeObjectRelease();
    if (v4 || objc_msgSend(*(id *)(v0 + 120), sel_status))
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v5 = *(id *)(v0 + 120);
      return (id)(*(uint64_t (**)(id))(v0 + 8))(v5);
    }
    v6 = *(void **)(v0 + 120);
    v7 = *(_QWORD *)(v0 + 88);
    v8 = *(_QWORD *)(v0 + 96) + 1;
    v9 = objc_msgSend(v6, sel_paymentSummaryItems);
    sub_22D8DAD00(0, &qword_255DA0630);
    v10 = sub_22D8E7070();

    sub_22D8D88A8(v10, sub_22D8DAEF0);
    v11 = objc_msgSend(v6, sel_shippingMethods);
    sub_22D8DAD00(0, &qword_255DA0638);
    v12 = sub_22D8E7070();

    sub_22D8D88A8(v12, sub_22D8DB0A0);
    if (v8 == v7)
    {
      swift_bridgeObjectRelease();
      v13 = objc_allocWithZone(MEMORY[0x24BE6ED00]);
      v14 = (void *)sub_22D8E7064();
      swift_bridgeObjectRelease();
      v15 = (void *)sub_22D8E7064();
      swift_bridgeObjectRelease();
      v5 = objc_msgSend(v13, sel_initWithErrors_paymentSummaryItems_shippingMethods_, 0, v14, v15);

      return (id)(*(uint64_t (**)(id))(v0 + 8))(v5);
    }
    v16 = *(_QWORD *)(v0 + 96) + 1;
    *(_QWORD *)(v0 + 96) = v16;
    v18 = *(_QWORD *)(v0 + 56);
    v17 = *(_QWORD *)(v0 + 64);
    v19 = *(_QWORD *)(v0 + 80) + 16 * v16;
    *(_QWORD *)(v0 + 104) = *(_QWORD *)(v19 + 40);
    v20 = *(int **)(v19 + 32);
    *(_QWORD *)(v0 + 16) = v18;
    *(_QWORD *)(v0 + 24) = v17;
    v22 = (uint64_t (*)(uint64_t, uint64_t))((char *)v20 + *v20);
    swift_retain();
    v21 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 112) = v21;
    *v21 = v0;
    v21[1] = sub_22D8D9528;
    return (id)v22(v0 + 48, v0 + 16);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_22D8D9AE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  sub_22D8E70A0();
  v3[5] = sub_22D8E7094();
  sub_22D8E7088();
  return swift_task_switch();
}

uint64_t sub_22D8D9B50()
{
  _QWORD *v0;
  void *v1;
  const void *v2;
  void *v3;
  id v4;
  id v5;
  _QWORD *v6;
  uint64_t (__cdecl *v8)();

  v1 = (void *)v0[4];
  v3 = (void *)v0[2];
  v2 = (const void *)v0[3];
  swift_release();
  v0[6] = _Block_copy(v2);
  v8 = (uint64_t (__cdecl *)())((char *)&dword_255DA06F8 + dword_255DA06F8);
  v4 = v3;
  v5 = v1;
  v6 = (_QWORD *)swift_task_alloc();
  v0[7] = v6;
  *v6 = v0;
  v6[1] = sub_22D8D9BD8;
  return v8();
}

uint64_t sub_22D8D9BD8(void *a1)
{
  uint64_t *v1;
  void (**v3)(_QWORD, _QWORD);
  void *v4;
  void *v5;
  uint64_t v7;

  v3 = *(void (***)(_QWORD, _QWORD))(*v1 + 48);
  v4 = *(void **)(*v1 + 32);
  v5 = *(void **)(*v1 + 16);
  v7 = *v1;
  swift_task_dealloc();

  ((void (**)(_QWORD, void *))v3)[2](v3, a1);
  _Block_release(v3);

  return (*(uint64_t (**)(void))(v7 + 8))();
}

uint64_t sub_22D8D9D90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;

  v4[4] = a3;
  v4[5] = a4;
  v4[2] = a1;
  v4[3] = a2;
  v4[6] = sub_22D8E70A0();
  v4[7] = sub_22D8E7094();
  sub_22D8E7088();
  return swift_task_switch();
}

uint64_t sub_22D8D9E04()
{
  _QWORD *v0;
  const void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  _QWORD *v8;
  uint64_t v9;

  v1 = (const void *)v0[4];
  v2 = (void *)v0[5];
  v4 = (void *)v0[2];
  v3 = (void *)v0[3];
  swift_release();
  v0[8] = _Block_copy(v1);
  v5 = v4;
  v6 = v3;
  v7 = v2;
  v0[9] = sub_22D8E7094();
  v8 = (_QWORD *)swift_task_alloc();
  v0[10] = v8;
  *v8 = v0;
  v8[1] = sub_22D8D9EA8;
  v9 = v0[5];
  v8[5] = v0[3];
  v8[6] = v9;
  return swift_task_switch();
}

uint64_t sub_22D8D9EA8(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 88) = a1;
  swift_task_dealloc();
  sub_22D8E7088();
  return swift_task_switch();
}

uint64_t sub_22D8D9F20()
{
  uint64_t v0;
  void *v1;
  void (**v2)(_QWORD, _QWORD);
  void *v3;
  void *v4;
  void *v5;

  v1 = *(void **)(v0 + 88);
  v2 = *(void (***)(_QWORD, _QWORD))(v0 + 64);
  v3 = *(void **)(v0 + 40);
  v5 = *(void **)(v0 + 16);
  v4 = *(void **)(v0 + 24);
  swift_release();

  ((void (**)(_QWORD, void *))v2)[2](v2, v1);
  _Block_release(v2);

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_22D8DA0CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;

  v4[4] = a3;
  v4[5] = a4;
  v4[2] = a1;
  v4[3] = a2;
  v4[6] = sub_22D8E70A0();
  v4[7] = sub_22D8E7094();
  sub_22D8E7088();
  return swift_task_switch();
}

uint64_t sub_22D8DA140()
{
  _QWORD *v0;
  const void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  _QWORD *v8;
  uint64_t v9;

  v1 = (const void *)v0[4];
  v2 = (void *)v0[5];
  v4 = (void *)v0[2];
  v3 = (void *)v0[3];
  swift_release();
  v0[8] = _Block_copy(v1);
  v5 = v4;
  v6 = v3;
  v7 = v2;
  v0[9] = sub_22D8E7094();
  v8 = (_QWORD *)swift_task_alloc();
  v0[10] = v8;
  *v8 = v0;
  v8[1] = sub_22D8DA1E4;
  v9 = v0[5];
  v8[6] = v0[3];
  v8[7] = v9;
  return swift_task_switch();
}

uint64_t sub_22D8DA1E4(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 88) = a1;
  swift_task_dealloc();
  sub_22D8E7088();
  return swift_task_switch();
}

uint64_t sub_22D8DA394(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;

  v4[4] = a3;
  v4[5] = a4;
  v4[2] = a1;
  v4[3] = a2;
  v4[6] = sub_22D8E70A0();
  v4[7] = sub_22D8E7094();
  sub_22D8E7088();
  return swift_task_switch();
}

uint64_t sub_22D8DA408()
{
  _QWORD *v0;
  const void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  _QWORD *v8;
  uint64_t v9;

  v1 = (const void *)v0[4];
  v2 = (void *)v0[5];
  v4 = (void *)v0[2];
  v3 = (void *)v0[3];
  swift_release();
  v0[8] = _Block_copy(v1);
  v5 = v4;
  v6 = v3;
  v7 = v2;
  v0[9] = sub_22D8E7094();
  v8 = (_QWORD *)swift_task_alloc();
  v0[10] = v8;
  *v8 = v0;
  v8[1] = sub_22D8DA1E4;
  v9 = v0[5];
  v8[5] = v0[3];
  v8[6] = v9;
  return swift_task_switch();
}

uint64_t sub_22D8DA5E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;

  v4[4] = a3;
  v4[5] = a4;
  v4[2] = a1;
  v4[3] = a2;
  v4[6] = sub_22D8E70A0();
  v4[7] = sub_22D8E7094();
  sub_22D8E7088();
  return swift_task_switch();
}

uint64_t sub_22D8DA658()
{
  _QWORD *v0;
  const void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  _QWORD *v9;
  uint64_t v10;

  v1 = (const void *)v0[4];
  v2 = (void *)v0[5];
  v3 = (void *)v0[2];
  swift_release();
  v0[8] = _Block_copy(v1);
  v4 = sub_22D8E7040();
  v6 = v5;
  v0[9] = v5;
  v7 = v3;
  v8 = v2;
  v0[10] = sub_22D8E7094();
  v9 = (_QWORD *)swift_task_alloc();
  v0[11] = v9;
  *v9 = v0;
  v9[1] = sub_22D8DA70C;
  v10 = v0[5];
  v9[8] = v6;
  v9[9] = v10;
  v9[7] = v4;
  return swift_task_switch();
}

uint64_t sub_22D8DA70C(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 96) = a1;
  swift_task_dealloc();
  sub_22D8E7088();
  return swift_task_switch();
}

uint64_t sub_22D8DA784()
{
  uint64_t v0;
  void *v1;
  void (**v2)(_QWORD, _QWORD);
  void *v3;
  void *v4;

  v1 = *(void **)(v0 + 96);
  v2 = *(void (***)(_QWORD, _QWORD))(v0 + 64);
  v3 = *(void **)(v0 + 40);
  v4 = *(void **)(v0 + 16);
  swift_release();
  swift_bridgeObjectRelease();

  ((void (**)(_QWORD, void *))v2)[2](v2, v1);
  _Block_release(v2);

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_22D8DA814()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v2 = v0[2];
  v3 = v0[3];
  v5 = v0[4];
  v4 = v0[5];
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v6;
  *v6 = v1;
  v6[1] = sub_22D8DB7C8;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_255DA05E0 + dword_255DA05E0))(v2, v3, v5, v4);
}

uint64_t sub_22D8DA88C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v4;
  *v4 = v3;
  v4[1] = sub_22D8DB7C8;
  return v6();
}

uint64_t sub_22D8DA8E4()
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
  v5[1] = sub_22D8DB7C8;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_255DA05F0 + dword_255DA05F0))(v2, v3, v4);
}

uint64_t sub_22D8DA95C(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(void);

  v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v5;
  *v5 = v4;
  v5[1] = sub_22D8DB7C8;
  return v7();
}

uint64_t sub_22D8DA9B4(uint64_t a1)
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
  v7[1] = sub_22D8DB7C8;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_255DA0600 + dword_255DA0600))(a1, v4, v5, v6);
}

uint64_t sub_22D8DAA38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_22D8E70C4();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_22D8E70B8();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_22D8DAB7C(a1);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_22D8E7088();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_22D8DAB7C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DA05D8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_22D8DABBC(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_22D8DAC20;
  return v6(a1);
}

uint64_t sub_22D8DAC20()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_22D8DAC6C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_22D8DAC90(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_22D8CE0A0;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_255DA0610 + dword_255DA0610))(a1, v4);
}

uint64_t sub_22D8DAD00(uint64_t a1, unint64_t *a2)
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

uint64_t (*sub_22D8DAD38(uint64_t (**a1)(), unint64_t a2, uint64_t a3))()
{
  uint64_t (*v6)();

  v6 = (uint64_t (*)())malloc(0x28uLL);
  *a1 = v6;
  *((_QWORD *)v6 + 4) = sub_22D8DAE10(v6, a2, a3);
  return sub_22D8DAD8C;
}

uint64_t (*sub_22D8DAD90(void (**a1)(id *a1), unint64_t a2, uint64_t a3))()
{
  void (*v6)(id *);

  v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((_QWORD *)v6 + 4) = sub_22D8DAE7C(v6, a2, a3);
  return sub_22D8DAD8C;
}

void sub_22D8DADE4(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

uint64_t (*sub_22D8DAE10(uint64_t (*result)(), unint64_t a2, uint64_t a3))()
{
  uint64_t (*v3)();
  id v4;

  v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    v4 = (id)MEMORY[0x22E31ACC0](a2, a3);
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
    return sub_22D8DB7CC;
  }
  __break(1u);
  return result;
}

void (*sub_22D8DAE7C(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  void (*v3)(id *);
  id v4;

  v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    v4 = (id)MEMORY[0x22E31ACC0](a2, a3);
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
    return sub_22D8DAEE8;
  }
  __break(1u);
  return result;
}

void sub_22D8DAEE8(id *a1)
{

}

uint64_t sub_22D8DAEF0(uint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t i;
  uint64_t (*v10)();
  id *v11;
  id v12;
  uint64_t (*v13[4])();

  v5 = result;
  v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_22D8E7190();
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
      v8 = sub_22D8E7190();
      result = swift_bridgeObjectRelease();
      if (v8 <= a2)
      {
        if (v7 >= 1)
        {
          sub_22D8DB250(&qword_255DA0658, &qword_255DA0650);
          swift_bridgeObjectRetain();
          for (i = 0; i != v7; ++i)
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_255DA0650);
            v10 = sub_22D8DAD38(v13, i, a3);
            v12 = *v11;
            ((void (*)(uint64_t (**)(), _QWORD))v10)(v13, 0);
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
        sub_22D8DAD00(0, &qword_255DA0630);
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

uint64_t sub_22D8DB0A0(uint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t i;
  uint64_t (*v10)();
  id *v11;
  id v12;
  void (*v13[4])(id *);

  v5 = result;
  v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_22D8E7190();
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
      v8 = sub_22D8E7190();
      result = swift_bridgeObjectRelease();
      if (v8 <= a2)
      {
        if (v7 >= 1)
        {
          sub_22D8DB250(&qword_255DA0648, &qword_255DA0640);
          swift_bridgeObjectRetain();
          for (i = 0; i != v7; ++i)
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_255DA0640);
            v10 = sub_22D8DAD90(v13, i, a3);
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
        sub_22D8DAD00(0, &qword_255DA0638);
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

uint64_t sub_22D8DB250(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x22E31B14C](MEMORY[0x24BEE12E0], v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_22D8DB294()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v2 = v0[2];
  v3 = v0[3];
  v5 = v0[4];
  v4 = v0[5];
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v6;
  *v6 = v1;
  v6[1] = sub_22D8DB7C8;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_255DA0660 + dword_255DA0660))(v2, v3, v5, v4);
}

uint64_t sub_22D8DB318()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v2 = v0[2];
  v3 = v0[3];
  v5 = v0[4];
  v4 = v0[5];
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v6;
  *v6 = v1;
  v6[1] = sub_22D8DB7C8;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_255DA0688 + dword_255DA0688))(v2, v3, v5, v4);
}

uint64_t objectdestroyTm_0()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 32));
  return swift_deallocObject();
}

uint64_t sub_22D8DB3D8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v2 = v0[2];
  v3 = v0[3];
  v5 = v0[4];
  v4 = v0[5];
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v6;
  *v6 = v1;
  v6[1] = sub_22D8CE0A0;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_255DA06B0 + dword_255DA06B0))(v2, v3, v5, v4);
}

uint64_t sub_22D8DB458()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 24));
  return swift_deallocObject();
}

uint64_t sub_22D8DB48C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v2 = v0[2];
  v3 = v0[3];
  v4 = v0[4];
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_22D8DB7C8;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_255DA06D8 + dword_255DA06D8))(v2, v3, v4);
}

uint64_t objectdestroy_3Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_22D8DB52C()
{
  uint64_t v0;
  _QWORD *v1;

  v1[2] = v0;
  v1[3] = sub_22D8E70A0();
  v1[4] = sub_22D8E7094();
  return swift_task_switch();
}

uint64_t sub_22D8DB57C()
{
  _QWORD *v0;
  uint64_t v1;
  int *v2;
  _QWORD *v3;
  uint64_t (*v5)(void);

  v1 = v0[2] + OBJC_IVAR____TtC16_PassKit_SwiftUI31PaymentAuthorizationCoordinator_onMerchantSessionRequested;
  v2 = *(int **)v1;
  v0[5] = *(_QWORD *)v1;
  if (v2)
  {
    v0[6] = *(_QWORD *)(v1 + 8);
    v5 = (uint64_t (*)(void))((char *)v2 + *v2);
    swift_retain();
    v3 = (_QWORD *)swift_task_alloc();
    v0[7] = v3;
    *v3 = v0;
    v3[1] = sub_22D8DB660;
    return v5();
  }
  else
  {
    v0[9] = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE6ED08]), sel_initWithStatus_merchantSession_, 0, 0);
    sub_22D8E7088();
    return swift_task_switch();
  }
}

uint64_t sub_22D8DB660(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 64) = a1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_22D8DB6BC()
{
  uint64_t *v0;

  sub_22D8CC6BC(v0[5]);
  v0[9] = v0[8];
  sub_22D8E7088();
  return swift_task_switch();
}

uint64_t sub_22D8DB718()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 72));
}

uint64_t sub_22D8DB74C()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_22D8DB770()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

uint64_t sub_22D8DB780()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_22D8DB7A4(char a1)
{
  uint64_t v1;

  sub_22D8D81C8(a1, v1);
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

uint64_t sub_22D8DB7D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  type metadata accessor for AsyncShareablePassConfiguration.Result(255, *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), a4);
  sub_22D8E6F74();
  return sub_22D8E6F50();
}

uint64_t sub_22D8DB830(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  type metadata accessor for AsyncShareablePassConfiguration.Result(255, *(_QWORD *)(a2 + 16), *(_QWORD *)(a2 + 24), a4);
  sub_22D8E6F74();
  return sub_22D8E6F5C();
}

uint64_t AsyncShareablePassConfiguration.init(metadata:action:content:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v14;
  uint64_t result;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  sub_22D8E6F44();
  type metadata accessor for AsyncShareablePassConfiguration.Result(0, a5, a6, v14);
  result = sub_22D8E6F44();
  *(_QWORD *)a7 = a1;
  *(_QWORD *)(a7 + 8) = a2;
  *(_BYTE *)(a7 + 16) = v16;
  *(_QWORD *)(a7 + 24) = v17;
  *(_QWORD *)(a7 + 32) = v16;
  *(_BYTE *)(a7 + 40) = v17;
  *(_QWORD *)(a7 + 48) = v18;
  *(_QWORD *)(a7 + 56) = a3;
  *(_QWORD *)(a7 + 64) = a4;
  return result;
}

uint64_t AsyncShareablePassConfiguration.body.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  __int128 *v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  void (*v16)(_OWORD *);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  unsigned __int8 v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  void (*v27)(char *, uint64_t);
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD v33[2];
  _OWORD v34[4];
  uint64_t v35;
  void *v36;
  unsigned __int8 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;

  v32 = a2;
  v4 = *(_QWORD *)(a1 + 16);
  v30 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v6 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_22D8E6D10();
  v31 = *(_QWORD *)(v7 - 8);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v29 = (uint64_t)&v29 - v11;
  v12 = v2[1];
  v13 = v2[3];
  v40 = v2[2];
  v41 = v13;
  v14 = v2[1];
  v38 = *v2;
  v39 = v14;
  v15 = v2[3];
  v34[2] = v40;
  v34[3] = v15;
  v42 = *((_QWORD *)v2 + 8);
  v16 = (void (*)(_OWORD *))*((_QWORD *)&v41 + 1);
  v35 = *((_QWORD *)v2 + 8);
  v34[0] = v38;
  v34[1] = v12;
  sub_22D8DB7D0(a1, v17, v18, v19);
  v20 = v36;
  v21 = v37;
  *(_QWORD *)&v34[0] = v36;
  BYTE8(v34[0]) = v37;
  v16(v34);
  sub_22D8DBBE0(v20, v21);
  v22 = swift_allocObject();
  v23 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(v22 + 16) = v4;
  *(_QWORD *)(v22 + 24) = v23;
  v24 = v41;
  *(_OWORD *)(v22 + 64) = v40;
  *(_OWORD *)(v22 + 80) = v24;
  *(_QWORD *)(v22 + 96) = v42;
  v25 = v39;
  *(_OWORD *)(v22 + 32) = v38;
  *(_OWORD *)(v22 + 48) = v25;
  sub_22D8DBC4C((uint64_t)&v38);
  sub_22D8E6F14();
  swift_release();
  (*(void (**)(char *, uint64_t))(v30 + 8))(v6, v4);
  v33[0] = v23;
  v33[1] = MEMORY[0x24BDF0910];
  MEMORY[0x22E31B14C](MEMORY[0x24BDED308], v7, v33);
  v26 = v29;
  sub_22D8CFBF4((uint64_t)v10, v7, v29);
  v27 = *(void (**)(char *, uint64_t))(v31 + 8);
  v27(v10, v7);
  sub_22D8CDC24(v26, v7, v32);
  return ((uint64_t (*)(uint64_t, uint64_t))v27)(v26, v7);
}

void sub_22D8DBBE0(id a1, unsigned __int8 a2)
{
  if (a2 <= 1u)

}

void sub_22D8DBC00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5 = type metadata accessor for AsyncShareablePassConfiguration(0, *(_QWORD *)(v4 + 16), *(_QWORD *)(v4 + 24), a4);
  sub_22D8DBD0C(v5, v6, v7, v8);
}

uint64_t sub_22D8DBC4C(uint64_t a1)
{
  void *v2;
  unsigned __int8 v3;

  v2 = *(void **)(a1 + 32);
  v3 = *(_BYTE *)(a1 + 40);
  swift_retain();
  swift_bridgeObjectRetain();
  sub_22D8DBCBC(v2, v3);
  swift_retain();
  swift_retain();
  return a1;
}

id sub_22D8DBCBC(id result, unsigned __int8 a2)
{
  if (a2 <= 1u)
    return result;
  return result;
}

uint64_t sub_22D8DBCD8()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_22D8DBD0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __int128 *v4;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  id v25;
  unsigned __int8 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;

  v6 = v4[1];
  v7 = v4[3];
  v29 = v4[2];
  v30 = v7;
  v8 = v4[1];
  v27 = *v4;
  v28 = v8;
  v9 = v4[3];
  v22 = v29;
  v23 = v9;
  v31 = *((_QWORD *)v4 + 8);
  v24 = *((_QWORD *)v4 + 8);
  v20 = v27;
  v21 = v6;
  sub_22D8DB7D0(a1, a2, a3, a4);
  if (v26 != 2 || v25)
  {
    sub_22D8DBBE0(v25, v26);
  }
  else
  {
    LOBYTE(v20) = v28 & 1;
    *((_QWORD *)&v20 + 1) = *((_QWORD *)&v28 + 1);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255DA0058);
    sub_22D8E6F50();
    LOBYTE(v20) = v28 & 1;
    *((_QWORD *)&v20 + 1) = *((_QWORD *)&v28 + 1);
    LOBYTE(v25) = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_255DA0058);
    sub_22D8E6F5C();
    v10 = (void *)objc_opt_self();
    sub_22D8DC56C();
    v11 = (void *)sub_22D8E7064();
    v12 = (void *)sub_22D8E701C();
    v13 = *((_QWORD *)&v27 + 1);
    v14 = swift_allocObject();
    v15 = v29;
    v16 = v30;
    v17 = v27;
    *(_OWORD *)(v14 + 48) = v28;
    *(_OWORD *)(v14 + 64) = v15;
    *(_OWORD *)(v14 + 80) = v16;
    v18 = *(_OWORD *)(a1 + 16);
    *(_QWORD *)(v14 + 96) = v31;
    *(_OWORD *)(v14 + 16) = v18;
    *(_OWORD *)(v14 + 32) = v17;
    *(_QWORD *)&v22 = sub_22D8DC5F4;
    *((_QWORD *)&v22 + 1) = v14;
    *(_QWORD *)&v20 = MEMORY[0x24BDAC760];
    *((_QWORD *)&v20 + 1) = 1107296256;
    *(_QWORD *)&v21 = sub_22D8D609C;
    *((_QWORD *)&v21 + 1) = &block_descriptor_1;
    v19 = _Block_copy(&v20);
    sub_22D8DBC4C((uint64_t)&v27);
    swift_release();
    objc_msgSend(v10, sel_configurationForPassMetadata_provisioningPolicyIdentifier_primaryAction_completion_, v11, v12, v13, v19);
    _Block_release(v19);

  }
}

uint64_t sub_22D8DBEF8(void *a1, id a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;

  if (a1)
  {
    v9 = *(_OWORD *)(a3 + 48);
    v35 = *(_OWORD *)(a3 + 32);
    v36 = v9;
    v37 = *(_QWORD *)(a3 + 64);
    v10 = *(_OWORD *)(a3 + 16);
    v33 = *(_OWORD *)a3;
    v34 = v10;
    v31 = (uint64_t)a1;
    v32 = 0;
    v11 = type metadata accessor for AsyncShareablePassConfiguration(0, a4, a5, a4);
    v12 = a1;
    return sub_22D8DB830((uint64_t)&v31, v11, v13, v14);
  }
  else if (a2)
  {
    v16 = *(_OWORD *)(a3 + 48);
    v35 = *(_OWORD *)(a3 + 32);
    v36 = v16;
    v37 = *(_QWORD *)(a3 + 64);
    v17 = *(_OWORD *)(a3 + 16);
    v33 = *(_OWORD *)a3;
    v34 = v17;
    v31 = (uint64_t)a2;
    v32 = 1;
    v18 = a2;
    v20 = type metadata accessor for AsyncShareablePassConfiguration(0, a4, a5, v19);
    return sub_22D8DB830((uint64_t)&v31, v20, v21, v22);
  }
  else
  {
    v23 = *(_OWORD *)(a3 + 48);
    v35 = *(_OWORD *)(a3 + 32);
    v36 = v23;
    v37 = *(_QWORD *)(a3 + 64);
    v24 = *(_OWORD *)(a3 + 16);
    v33 = *(_OWORD *)a3;
    v34 = v24;
    sub_22D8DBC4C(a3);
    if (qword_255D9FD00 != -1)
      swift_once();
    v26 = (void *)qword_255DA2860;
    v31 = qword_255DA2860;
    v32 = 1;
    v27 = type metadata accessor for AsyncShareablePassConfiguration(0, a4, a5, v25);
    v28 = v26;
    sub_22D8DB830((uint64_t)&v31, v27, v29, v30);
    return sub_22D8DC618(a3);
  }
}

uint64_t sub_22D8DC064()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_22D8DC06C(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_release();
  sub_22D8DBBE0(*(id *)(a1 + 32), *(_BYTE *)(a1 + 40));
  swift_release();
  return swift_release();
}

uint64_t sub_22D8DC0B0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  unsigned __int8 v6;
  uint64_t v7;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v5 = *(void **)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  v6 = *(_BYTE *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_22D8DBCBC(v5, v6);
  *(_QWORD *)(a1 + 32) = v5;
  *(_BYTE *)(a1 + 40) = v6;
  v7 = *(_QWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 64) = v7;
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_22D8DC140(uint64_t a1, uint64_t a2)
{
  void *v4;
  unsigned __int8 v5;
  void *v6;
  unsigned __int8 v7;
  uint64_t v8;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_retain();
  swift_release();
  v4 = *(void **)(a2 + 32);
  v5 = *(_BYTE *)(a2 + 40);
  sub_22D8DBCBC(v4, v5);
  v6 = *(void **)(a1 + 32);
  *(_QWORD *)(a1 + 32) = v4;
  v7 = *(_BYTE *)(a1 + 40);
  *(_BYTE *)(a1 + 40) = v5;
  sub_22D8DBBE0(v6, v7);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_retain();
  swift_release();
  v8 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = v8;
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy72_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  result = *(__n128 *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t sub_22D8DC228(uint64_t a1, uint64_t a2)
{
  char v4;
  void *v5;
  unsigned __int8 v6;
  uint64_t v7;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_release();
  v4 = *(_BYTE *)(a2 + 40);
  v5 = *(void **)(a1 + 32);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  v6 = *(_BYTE *)(a1 + 40);
  *(_BYTE *)(a1 + 40) = v4;
  sub_22D8DBBE0(v5, v6);
  swift_release();
  v7 = *(_QWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 64) = v7;
  swift_release();
  return a1;
}

uint64_t sub_22D8DC2B8(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 72))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t sub_22D8DC300(uint64_t result, int a2, int a3)
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
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 72) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

uint64_t type metadata accessor for AsyncShareablePassConfiguration(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for AsyncShareablePassConfiguration);
}

uint64_t sub_22D8DC35C(uint64_t a1, uint64_t a2)
{
  id v3;
  unsigned __int8 v4;

  v3 = *(id *)a2;
  v4 = *(_BYTE *)(a2 + 8);
  sub_22D8DBCBC(*(id *)a2, v4);
  *(_QWORD *)a1 = v3;
  *(_BYTE *)(a1 + 8) = v4;
  return a1;
}

void sub_22D8DC3A0(uint64_t a1)
{
  sub_22D8DBBE0(*(id *)a1, *(_BYTE *)(a1 + 8));
}

uint64_t sub_22D8DC3B0(uint64_t a1, uint64_t a2)
{
  id v3;
  unsigned __int8 v4;
  void *v5;
  unsigned __int8 v6;

  v3 = *(id *)a2;
  v4 = *(_BYTE *)(a2 + 8);
  sub_22D8DBCBC(*(id *)a2, v4);
  v5 = *(void **)a1;
  *(_QWORD *)a1 = v3;
  v6 = *(_BYTE *)(a1 + 8);
  *(_BYTE *)(a1 + 8) = v4;
  sub_22D8DBBE0(v5, v6);
  return a1;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_BYTE *)(result + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t sub_22D8DC414(uint64_t a1, uint64_t a2)
{
  char v3;
  void *v4;
  unsigned __int8 v5;

  v3 = *(_BYTE *)(a2 + 8);
  v4 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v5 = *(_BYTE *)(a1 + 8);
  *(_BYTE *)(a1 + 8) = v3;
  sub_22D8DBBE0(v4, v5);
  return a1;
}

uint64_t sub_22D8DC450(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFE && *(_BYTE *)(a1 + 9))
    return (*(_DWORD *)a1 + 254);
  v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 2)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t sub_22D8DC498(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_BYTE *)(result + 8) = 0;
    *(_QWORD *)result = a2 - 254;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 9) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 9) = 0;
    if (a2)
      *(_BYTE *)(result + 8) = -(char)a2;
  }
  return result;
}

uint64_t sub_22D8DC4DC(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 8) <= 1u)
    return *(unsigned __int8 *)(a1 + 8);
  else
    return (*(_DWORD *)a1 + 2);
}

uint64_t sub_22D8DC4F4(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(_QWORD *)result = a2 - 2;
    LOBYTE(a2) = 2;
  }
  *(_BYTE *)(result + 8) = a2;
  return result;
}

uint64_t type metadata accessor for AsyncShareablePassConfiguration.Result(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for AsyncShareablePassConfiguration.Result);
}

uint64_t sub_22D8DC518(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD v4[2];

  v1 = *(_QWORD *)(a1 + 8);
  v2 = sub_22D8E6D10();
  v4[0] = v1;
  v4[1] = MEMORY[0x24BDF0910];
  return MEMORY[0x22E31B14C](MEMORY[0x24BDED308], v2, v4);
}

unint64_t sub_22D8DC56C()
{
  unint64_t result;

  result = qword_255DA0810;
  if (!qword_255DA0810)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_255DA0810);
  }
  return result;
}

uint64_t objectdestroyTm_1()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_release();
  sub_22D8DBBE0(*(id *)(v0 + 64), *(_BYTE *)(v0 + 72));
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_22D8DC5F4(void *a1, void *a2)
{
  uint64_t v2;

  return sub_22D8DBEF8(a1, a2, v2 + 32, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24));
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

uint64_t sub_22D8DC618(uint64_t a1)
{
  void *v2;
  unsigned __int8 v3;

  v2 = *(void **)(a1 + 32);
  v3 = *(_BYTE *)(a1 + 40);
  swift_bridgeObjectRelease();
  swift_release();
  sub_22D8DBBE0(v2, v3);
  swift_release();
  swift_release();
  return a1;
}

uint64_t sub_22D8DC688(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  id v17;
  void *v18;
  id v19;
  objc_class *v20;
  char *v21;
  uint64_t (**v22)(uint64_t, uint64_t, uint64_t, uint64_t);
  id v23;
  id v24;
  id v25;
  void *v26;
  _QWORD v28[4];
  objc_super v29;

  v8 = *(_QWORD *)(a4 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  MEMORY[0x24BDAC7A8](a1);
  v10 = (char *)v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v12, v11);
  v13 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v14 = (v9 + v13 + 7) & 0xFFFFFFFFFFFFFFF8;
  v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = *(_OWORD *)(a4 + 16);
  (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v15 + v13, v10, a4);
  v16 = (_QWORD *)(v15 + v14);
  *v16 = a2;
  v16[1] = a3;
  v17 = objc_allocWithZone(MEMORY[0x24BE6FA70]);
  sub_22D8DCE00();
  swift_bridgeObjectRetain();
  swift_retain();
  v18 = (void *)sub_22D8E7064();
  v19 = objc_msgSend(v17, sel_initWithPasses_, v18);

  if (v19)
  {
    v20 = (objc_class *)type metadata accessor for AddPassesViewControllerWrapper.AddPassCoordinator();
    v21 = (char *)objc_allocWithZone(v20);
    v22 = (uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))&v21[OBJC_IVAR____TtCV16_PassKit_SwiftUIP33_CEF41C66ABDFF5E01A9463BEC59EB36F30AddPassesViewControllerWrapper18AddPassCoordinator_completion];
    *v22 = sub_22D8DCD88;
    v22[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v15;
    swift_retain();
    sub_22D8CC6BC(0);
    v29.receiver = v21;
    v29.super_class = v20;
    v23 = objc_msgSendSuper2(&v29, sel_init);
    swift_release();
    v28[1] = a1;
    v28[2] = v23;
    v28[3] = v19;
    sub_22D8DCE3C();
    return sub_22D8E6FC8();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_release();
    sub_22D8E7040();
    v25 = objc_allocWithZone(MEMORY[0x24BDD1540]);
    v26 = (void *)sub_22D8E701C();
    swift_bridgeObjectRelease();
    v24 = objc_msgSend(v25, sel_initWithDomain_code_userInfo_, v26, 1, 0);

  }
  return (uint64_t)v24;
}

id sub_22D8DC9E0()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  objc_super v4;

  __swift_instantiateConcreteTypeFromMangledName(qword_255DA08C0);
  v1 = swift_allocObject();
  v2 = MEMORY[0x24BEE0D00];
  *(_OWORD *)(v1 + 16) = xmmword_22D8E8890;
  *(_QWORD *)(v1 + 56) = v2;
  *(_QWORD *)(v1 + 32) = 0x74696E696564;
  *(_QWORD *)(v1 + 40) = 0xE600000000000000;
  sub_22D8E71C0();
  swift_bridgeObjectRelease();
  v4.receiver = v0;
  v4.super_class = (Class)type metadata accessor for AddPassesViewControllerWrapper.AddPassCoordinator();
  return objc_msgSendSuper2(&v4, sel_dealloc);
}

uint64_t type metadata accessor for AddPassesViewControllerWrapper.AddPassCoordinator()
{
  return objc_opt_self();
}

uint64_t sub_22D8DCC5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5 = *(_QWORD *)(v4 + 16);
  v6 = type metadata accessor for AddPassToWalletButton_iOS(0, v5, *(_QWORD *)(v4 + 24), a4);
  v7 = v4
     + ((*(unsigned __int8 *)(*(_QWORD *)(v6 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v6 - 8) + 80));
  sub_22D8CC5B0(*(void **)v7, *(_QWORD *)(v7 + 8), *(_QWORD *)(v7 + 16), *(_QWORD *)(v7 + 24), *(_QWORD *)(v7 + 32), *(_BYTE *)(v7 + 40));
  v8 = v7 + *(int *)(v6 + 36);
  v9 = *(_QWORD *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v8, 1, v5))
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v5);
  sub_22D8CC628(*(_QWORD *)(v7 + *(int *)(v6 + 40)), *(_BYTE *)(v7 + *(int *)(v6 + 40) + 8));
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_22D8DCD88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t (*v7)(uint64_t);

  v6 = type metadata accessor for AddPassToWalletButton_iOS(0, *(_QWORD *)(v4 + 16), *(_QWORD *)(v4 + 24), a4);
  v7 = *(uint64_t (**)(uint64_t))(v4
                                         + ((*(_QWORD *)(*(_QWORD *)(v6 - 8) + 64)
                                           + ((*(unsigned __int8 *)(*(_QWORD *)(v6 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v6 - 8) + 80))
                                           + 7) & 0xFFFFFFFFFFFFFFF8));
  sub_22D8CCC94();
  return v7(a1);
}

unint64_t sub_22D8DCE00()
{
  unint64_t result;

  result = qword_255DA08B0;
  if (!qword_255DA08B0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_255DA08B0);
  }
  return result;
}

unint64_t sub_22D8DCE3C()
{
  unint64_t result;

  result = qword_255DA08B8;
  if (!qword_255DA08B8)
  {
    result = MEMORY[0x22E31B14C](&unk_22D8E8974, &type metadata for AddPassesViewControllerWrapper);
    atomic_store(result, (unint64_t *)&qword_255DA08B8);
  }
  return result;
}

uint64_t sub_22D8DCE80(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

void destroy for AddPassesViewControllerWrapper(uint64_t a1)
{
  swift_bridgeObjectRelease();

}

_QWORD *_s16_PassKit_SwiftUI30AddPassesViewControllerWrapperVwCP_0(_QWORD *a1, _QWORD *a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  v3 = (void *)a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = (void *)a2[2];
  a1[2] = v4;
  swift_bridgeObjectRetain();
  v5 = v3;
  v6 = v4;
  return a1;
}

_QWORD *assignWithCopy for AddPassesViewControllerWrapper(_QWORD *a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = (void *)a2[1];
  v5 = (void *)a1[1];
  a1[1] = v4;
  v6 = v4;

  v7 = (void *)a2[2];
  v8 = (void *)a1[2];
  a1[2] = v7;
  v9 = v7;

  return a1;
}

uint64_t assignWithTake for AddPassesViewControllerWrapper(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;

  swift_bridgeObjectRelease();
  v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;

  v5 = *(void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);

  return a1;
}

uint64_t getEnumTagSinglePayload for AddPassesViewControllerWrapper(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for AddPassesViewControllerWrapper(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for AddPassesViewControllerWrapper()
{
  return &type metadata for AddPassesViewControllerWrapper;
}

id sub_22D8DD05C()
{
  uint64_t v0;
  id v2;

  v2 = *(id *)(v0 + 16);
  objc_msgSend(v2, sel_setDelegate_, *(_QWORD *)(v0 + 8));
  return v2;
}

id sub_22D8DD08C@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  void *v2;

  v2 = *(void **)(v1 + 8);
  *a1 = v2;
  return v2;
}

unint64_t sub_22D8DD098(uint64_t a1)
{
  unint64_t result;

  result = sub_22D8DD0BC();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_22D8DD0BC()
{
  unint64_t result;

  result = qword_255DA08F8;
  if (!qword_255DA08F8)
  {
    result = MEMORY[0x22E31B14C](&unk_22D8E88E0, &type metadata for AddPassesViewControllerWrapper);
    atomic_store(result, (unint64_t *)&qword_255DA08F8);
  }
  return result;
}

uint64_t sub_22D8DD100()
{
  sub_22D8DD0BC();
  return sub_22D8E6E9C();
}

uint64_t sub_22D8DD150()
{
  sub_22D8DD0BC();
  return sub_22D8E6E6C();
}

void sub_22D8DD1A0()
{
  sub_22D8DD0BC();
  sub_22D8E6E90();
  __break(1u);
}

ValueMetadata *type metadata accessor for ClearBackgroundView()
{
  return &type metadata for ClearBackgroundView;
}

void sub_22D8DD1D4(void *a1)
{
  id v1;
  void *v2;
  id v3;
  id v4;

  v1 = objc_msgSend(a1, sel_superview);
  if (v1)
  {
    v2 = v1;
    v3 = objc_msgSend(v1, sel_superview);

    if (v3)
    {
      v4 = objc_msgSend((id)objc_opt_self(), sel_clearColor);
      objc_msgSend(v3, sel_setBackgroundColor_, v4);

    }
  }
}

uint64_t sub_22D8DD27C(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_22D8DD2B0()
{
  sub_22D8DD6C0();
  return sub_22D8E6E00();
}

uint64_t sub_22D8DD300()
{
  sub_22D8DD6C0();
  return sub_22D8E6DAC();
}

void sub_22D8DD350()
{
  sub_22D8DD6C0();
  sub_22D8E6DF4();
  __break(1u);
}

unint64_t sub_22D8DD378()
{
  unint64_t result;

  result = qword_255DA0900;
  if (!qword_255DA0900)
  {
    result = MEMORY[0x22E31B14C](&unk_22D8E89E4, &type metadata for ClearBackgroundView);
    atomic_store(result, (unint64_t *)&qword_255DA0900);
  }
  return result;
}

id sub_22D8DD3BC()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v13;
  uint64_t v14;
  _QWORD aBlock[6];

  v0 = sub_22D8E6FF8();
  v14 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v13 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_22D8E7010();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDB00]), sel_init);
  sub_22D8DD5AC();
  v8 = (void *)sub_22D8E710C();
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v7;
  aBlock[4] = sub_22D8DD60C;
  aBlock[5] = v9;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_22D8DD27C;
  aBlock[3] = &block_descriptor_2;
  v10 = _Block_copy(aBlock);
  v11 = v7;
  swift_release();
  sub_22D8E7004();
  aBlock[0] = MEMORY[0x24BEE4AF8];
  sub_22D8DD62C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DA0918);
  sub_22D8DD674();
  sub_22D8E7130();
  MEMORY[0x22E31AC78](0, v6, v2, v10);
  _Block_release(v10);

  (*(void (**)(char *, uint64_t))(v14 + 8))(v2, v0);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return v11;
}

unint64_t sub_22D8DD5AC()
{
  unint64_t result;

  result = qword_255DA0908;
  if (!qword_255DA0908)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_255DA0908);
  }
  return result;
}

uint64_t sub_22D8DD5E8()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_22D8DD60C()
{
  uint64_t v0;

  sub_22D8DD1D4(*(void **)(v0 + 16));
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

unint64_t sub_22D8DD62C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255DA0910;
  if (!qword_255DA0910)
  {
    v1 = sub_22D8E6FF8();
    result = MEMORY[0x22E31B14C](MEMORY[0x24BEE5468], v1);
    atomic_store(result, (unint64_t *)&qword_255DA0910);
  }
  return result;
}

unint64_t sub_22D8DD674()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255DA0920;
  if (!qword_255DA0920)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255DA0918);
    result = MEMORY[0x22E31B14C](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_255DA0920);
  }
  return result;
}

unint64_t sub_22D8DD6C0()
{
  unint64_t result;

  result = qword_255DA0928;
  if (!qword_255DA0928)
  {
    result = MEMORY[0x22E31B14C](&unk_22D8E8A34, &type metadata for ClearBackgroundView);
    atomic_store(result, (unint64_t *)&qword_255DA0928);
  }
  return result;
}

uint64_t PayWithApplePayButton.init(_:request:onPaymentAuthorizationChange:fallback:)@<X0>(uint64_t *a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void (*a5)(void)@<X4>, uint64_t a6@<X6>, uint64_t a7@<X7>, _QWORD *a8@<X8>)
{
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  uint64_t v23;
  uint64_t v24;

  v23 = a7;
  v15 = sub_22D8E7124();
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v23 - v16;
  v18 = *a1;
  v19 = objc_allocWithZone((Class)type metadata accessor for PaymentAuthorizationCoordinator());
  v20 = a2;
  swift_retain();
  v21 = sub_22D8D7F14((uint64_t)v20, a3, a4);
  v24 = v18;
  a5();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(a6 - 8) + 56))(v17, 0, 1, a6);
  sub_22D8DD82C(&v24, (uint64_t)v21, (uint64_t)v17, a6, v23, a8);

  return swift_release();
}

uint64_t sub_22D8DD82C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, _QWORD *a6@<X8>)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v17;
  uint64_t v18;

  v12 = sub_22D8E7124();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v17 - v14;
  v18 = *a1;
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))((char *)&v17 - v14, a3, v12);
  sub_22D8CD108(&v18, a2, 0, 1, (uint64_t)v15, a4, a5, a6);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v13 + 8))(a3, v12);
}

uint64_t PayWithApplePayButton.init(_:request:onPaymentAuthorizationChange:onMerchantSessionRequested:fallback:)@<X0>(uint64_t *a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, void (*a7)(uint64_t)@<X6>, uint64_t a8@<X7>, _QWORD *a9@<X8>, uint64_t a10, uint64_t a11)
{
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  id v21;
  id v22;
  char *v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v28[2];
  void (*v29)(uint64_t);
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;

  v28[1] = a8;
  v29 = a7;
  v30 = a9;
  v31 = a11;
  v17 = sub_22D8E7124();
  MEMORY[0x24BDAC7A8](v17);
  v19 = (char *)v28 - v18;
  v20 = *a1;
  v21 = objc_allocWithZone((Class)type metadata accessor for PaymentAuthorizationCoordinator());
  v22 = a2;
  swift_retain();
  v23 = (char *)sub_22D8D7F14((uint64_t)v22, a3, a4);
  v24 = &v23[OBJC_IVAR____TtC16_PassKit_SwiftUI31PaymentAuthorizationCoordinator_onMerchantSessionRequested];
  v25 = *(_QWORD *)&v23[OBJC_IVAR____TtC16_PassKit_SwiftUI31PaymentAuthorizationCoordinator_onMerchantSessionRequested];
  *(_QWORD *)v24 = a5;
  *((_QWORD *)v24 + 1) = a6;
  swift_retain();
  v26 = sub_22D8CC6BC(v25);
  v32 = v20;
  v29(v26);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(a10 - 8) + 56))(v19, 0, 1, a10);
  sub_22D8DD82C(&v32, (uint64_t)v23, (uint64_t)v19, a10, v31, v30);

  swift_release();
  return swift_release();
}

double PayWithApplePayButton<>.init(_:request:onPaymentAuthorizationChange:)@<D0>(uint64_t *a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v9;
  id v10;
  id v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  double result;
  __int128 v16;
  _OWORD v17[9];
  uint64_t v18;

  v9 = *a1;
  objc_allocWithZone((Class)type metadata accessor for PaymentAuthorizationCoordinator());
  v10 = a2;
  swift_retain();
  v11 = sub_22D8D7F14((uint64_t)v10, a3, a4);
  sub_22D8CCFA8(v9, (uint64_t)v11, 0, 1, 1, (uint64_t)v17);

  swift_release();
  v12 = v17[7];
  *(_OWORD *)(a5 + 96) = v17[6];
  *(_OWORD *)(a5 + 112) = v12;
  *(_OWORD *)(a5 + 128) = v17[8];
  *(_QWORD *)(a5 + 144) = v18;
  v13 = v17[3];
  *(_OWORD *)(a5 + 32) = v17[2];
  *(_OWORD *)(a5 + 48) = v13;
  v14 = v17[5];
  *(_OWORD *)(a5 + 64) = v17[4];
  *(_OWORD *)(a5 + 80) = v14;
  result = *(double *)v17;
  v16 = v17[1];
  *(_OWORD *)a5 = v17[0];
  *(_OWORD *)(a5 + 16) = v16;
  return result;
}

double PayWithApplePayButton<>.init(_:request:onPaymentAuthorizationChange:onMerchantSessionRequested:)@<D0>(uint64_t *a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v13;
  id v14;
  id v15;
  char *v16;
  char *v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  double result;
  __int128 v23;
  _OWORD v24[9];
  uint64_t v25;

  v13 = *a1;
  v14 = objc_allocWithZone((Class)type metadata accessor for PaymentAuthorizationCoordinator());
  v15 = a2;
  swift_retain();
  v16 = (char *)sub_22D8D7F14((uint64_t)v15, a3, a4);
  v17 = &v16[OBJC_IVAR____TtC16_PassKit_SwiftUI31PaymentAuthorizationCoordinator_onMerchantSessionRequested];
  v18 = *(_QWORD *)&v16[OBJC_IVAR____TtC16_PassKit_SwiftUI31PaymentAuthorizationCoordinator_onMerchantSessionRequested];
  *(_QWORD *)v17 = a5;
  *((_QWORD *)v17 + 1) = a6;
  swift_retain();
  sub_22D8CC6BC(v18);
  sub_22D8CCFA8(v13, (uint64_t)v16, 0, 1, 1, (uint64_t)v24);

  swift_release();
  swift_release();
  v19 = v24[7];
  *(_OWORD *)(a7 + 96) = v24[6];
  *(_OWORD *)(a7 + 112) = v19;
  *(_OWORD *)(a7 + 128) = v24[8];
  *(_QWORD *)(a7 + 144) = v25;
  v20 = v24[3];
  *(_OWORD *)(a7 + 32) = v24[2];
  *(_OWORD *)(a7 + 48) = v20;
  v21 = v24[5];
  *(_OWORD *)(a7 + 64) = v24[4];
  *(_OWORD *)(a7 + 80) = v21;
  result = *(double *)v24;
  v23 = v24[1];
  *(_OWORD *)a7 = v24[0];
  *(_OWORD *)(a7 + 16) = v23;
  return result;
}

id *destroy for PayWithApplePayButtonPaymentAuthorizationPhase(id *result)
{
  if ((unint64_t)*result >= 0xFFFFFFFF)
  {

    return (id *)swift_release();
  }
  return result;
}

uint64_t _s16_PassKit_SwiftUI46PayWithApplePayButtonPaymentAuthorizationPhaseOwCP_0(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v3 = *(void **)a2;
  if (*(_QWORD *)a2 < 0xFFFFFFFFuLL)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  }
  else
  {
    v4 = *(_QWORD *)(a2 + 8);
    v5 = *(_QWORD *)(a2 + 16);
    *(_QWORD *)a1 = v3;
    *(_QWORD *)(a1 + 8) = v4;
    *(_QWORD *)(a1 + 16) = v5;
    v6 = v3;
    swift_retain();
  }
  return a1;
}

uint64_t assignWithCopy for PayWithApplePayButtonPaymentAuthorizationPhase(uint64_t a1, __int128 *a2)
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  __int128 v10;

  v4 = *(void **)a1;
  v5 = *(void **)a2;
  if (*(_QWORD *)a1 < 0xFFFFFFFFuLL)
  {
    if ((unint64_t)v5 >= 0xFFFFFFFF)
    {
      *(_QWORD *)a1 = v5;
      v8 = *((_QWORD *)a2 + 2);
      *(_QWORD *)(a1 + 8) = *((_QWORD *)a2 + 1);
      *(_QWORD *)(a1 + 16) = v8;
      v9 = v5;
      swift_retain();
      return a1;
    }
LABEL_7:
    v10 = *a2;
    *(_QWORD *)(a1 + 16) = *((_QWORD *)a2 + 2);
    *(_OWORD *)a1 = v10;
    return a1;
  }
  if ((unint64_t)v5 < 0xFFFFFFFF)
  {

    swift_release();
    goto LABEL_7;
  }
  *(_QWORD *)a1 = v5;
  v6 = v5;

  v7 = *((_QWORD *)a2 + 2);
  *(_QWORD *)(a1 + 8) = *((_QWORD *)a2 + 1);
  *(_QWORD *)(a1 + 16) = v7;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for PayWithApplePayButtonPaymentAuthorizationPhase(uint64_t a1, uint64_t a2)
{
  void *v4;

  v4 = *(void **)a1;
  if (*(_QWORD *)a1 < 0xFFFFFFFFuLL)
    goto LABEL_5;
  if (*(_QWORD *)a2 < 0xFFFFFFFFuLL)
  {

    swift_release();
LABEL_5:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
    return a1;
  }
  *(_QWORD *)a1 = *(_QWORD *)a2;

  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for PayWithApplePayButtonPaymentAuthorizationPhase(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;
  unsigned int v4;
  unsigned int v5;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFE && *((_BYTE *)a1 + 24))
    return (*(_DWORD *)a1 + 2147483646);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 + 1;
  v5 = v3 - 1;
  if (v4 >= 3)
    return v5;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for PayWithApplePayButtonPaymentAuthorizationPhase(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFD)
  {
    *(_QWORD *)result = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_DWORD *)result = a2 - 2147483646;
    if (a3 >= 0x7FFFFFFE)
      *(_BYTE *)(result + 24) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFE)
      *(_BYTE *)(result + 24) = 0;
    if (a2)
      *(_QWORD *)result = a2 + 1;
  }
  return result;
}

uint64_t sub_22D8DDF00(uint64_t *a1)
{
  uint64_t v1;

  v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

_QWORD *sub_22D8DDF18(_QWORD *result, int a2)
{
  uint64_t v2;

  if (a2 < 0)
  {
    v2 = a2 ^ 0x80000000;
    result[1] = 0;
    result[2] = 0;
  }
  else
  {
    if (!a2)
      return result;
    v2 = (a2 - 1);
  }
  *result = v2;
  return result;
}

ValueMetadata *type metadata accessor for PayWithApplePayButtonPaymentAuthorizationPhase()
{
  return &type metadata for PayWithApplePayButtonPaymentAuthorizationPhase;
}

uint64_t sub_22D8DDF48()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for WindowFinder.Coordinator()
{
  return objc_opt_self();
}

ValueMetadata *type metadata accessor for WindowFinder()
{
  return &type metadata for WindowFinder;
}

id sub_22D8DDF88()
{
  id *v0;

  return *v0;
}

uint64_t sub_22D8DDF90@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for WindowFinder.Coordinator();
  result = swift_allocObject();
  *a1 = result;
  return result;
}

uint64_t sub_22D8DDFC0()
{
  sub_22D8DE0AC();
  return sub_22D8E6E00();
}

uint64_t sub_22D8DE010()
{
  sub_22D8DE0AC();
  return sub_22D8E6DAC();
}

void sub_22D8DE060()
{
  sub_22D8DE0AC();
  sub_22D8E6DF4();
  __break(1u);
}

unint64_t sub_22D8DE088(uint64_t a1)
{
  unint64_t result;

  result = sub_22D8DE0AC();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_22D8DE0AC()
{
  unint64_t result;

  result = qword_255DA09F0;
  if (!qword_255DA09F0)
  {
    result = MEMORY[0x22E31B14C](&unk_22D8E8B80, &type metadata for WindowFinder);
    atomic_store(result, (unint64_t *)&qword_255DA09F0);
  }
  return result;
}

uint64_t VerifyIdentityWithWalletButton.init(_:request:onCompletion:fallback:)@<X0>(uint64_t *a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void (*a5)(uint64_t)@<X4>, uint64_t a6@<X6>, uint64_t a7@<X7>, uint64_t a8@<X8>)
{
  uint64_t v16;
  uint64_t v17;
  char *v18;
  id v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;

  v16 = sub_22D8E7124();
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)&v22 - v17;
  v23 = *a1;
  v19 = a2;
  v20 = swift_retain();
  a5(v20);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(a6 - 8) + 56))(v18, 0, 1, a6);
  sub_22D8D4C14(&v23, (uint64_t)a2, a3, a4, 1, (uint64_t)v18, a6, a7, a8);

  return swift_release();
}

uint64_t VerifyIdentityWithWalletButton<>.init(_:action:)@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  id v8;
  uint64_t result;
  char v10;
  uint64_t v11;

  v7 = *a1;
  sub_22D8E6F44();
  sub_22D8E6F44();
  v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE6EB40]), sel_init);
  result = swift_getKeyPath();
  *(_QWORD *)a4 = a2;
  *(_QWORD *)(a4 + 8) = a3;
  *(_QWORD *)(a4 + 16) = 0;
  *(_WORD *)(a4 + 24) = 256;
  *(_BYTE *)(a4 + 32) = v10;
  *(_QWORD *)(a4 + 40) = v11;
  *(_BYTE *)(a4 + 48) = v10;
  *(_QWORD *)(a4 + 56) = v11;
  *(_QWORD *)(a4 + 64) = v8;
  *(_QWORD *)(a4 + 72) = v7;
  *(_QWORD *)(a4 + 80) = result;
  *(_BYTE *)(a4 + 88) = 0;
  return result;
}

uint64_t VerifyIdentityWithWalletButton<>.init(_:request:onCompletion:)@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v9;
  id v10;
  uint64_t result;
  char v12;
  uint64_t v13;

  v9 = *a1;
  sub_22D8E6F44();
  sub_22D8E6F44();
  v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE6EB40]), sel_init);
  result = swift_getKeyPath();
  *(_QWORD *)a5 = a2;
  *(_QWORD *)(a5 + 8) = a3;
  *(_QWORD *)(a5 + 16) = a4;
  *(_WORD *)(a5 + 24) = 257;
  *(_BYTE *)(a5 + 32) = v12;
  *(_QWORD *)(a5 + 40) = v13;
  *(_BYTE *)(a5 + 48) = v12;
  *(_QWORD *)(a5 + 56) = v13;
  *(_QWORD *)(a5 + 64) = v10;
  *(_QWORD *)(a5 + 72) = v9;
  *(_QWORD *)(a5 + 80) = result;
  *(_BYTE *)(a5 + 88) = 0;
  return result;
}

uint64_t sub_22D8DE3C4@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  sub_22D8DE4EC();
  result = sub_22D8E6D64();
  *a1 = v3;
  return result;
}

uint64_t sub_22D8DE410@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  sub_22D8DE4EC();
  result = sub_22D8E6D64();
  *a1 = v3;
  return result;
}

uint64_t sub_22D8DE45C()
{
  sub_22D8DE4EC();
  return sub_22D8E6D70();
}

uint64_t sub_22D8DE4A4()
{
  sub_22D8DE4EC();
  return sub_22D8E6D70();
}

unint64_t sub_22D8DE4EC()
{
  unint64_t result;

  result = qword_255DA09F8;
  if (!qword_255DA09F8)
  {
    result = MEMORY[0x22E31B14C](&unk_22D8E95D8, &type metadata for VerifyIdentityWithWalletButtonStyleKey);
    atomic_store(result, (unint64_t *)&qword_255DA09F8);
  }
  return result;
}

uint64_t View.onApplePayPaymentMethodChange(perform:)(uint64_t a1, uint64_t a2)
{
  uint64_t KeyPath;
  _QWORD *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  _QWORD *v9;

  KeyPath = swift_getKeyPath();
  v5 = (_QWORD *)sub_22D8DE73C(KeyPath, 0, &qword_255DA0AD0);
  swift_release();
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = a1;
  *(_QWORD *)(v6 + 24) = a2;
  swift_retain();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v5 = sub_22D8DFD58(0, v5[2] + 1, 1, v5, &qword_255DA0AC8);
  v8 = v5[2];
  v7 = v5[3];
  if (v8 >= v7 >> 1)
    v5 = sub_22D8DFD58((_QWORD *)(v7 > 1), v8 + 1, 1, v5, &qword_255DA0AC8);
  v5[2] = v8 + 1;
  v9 = &v5[2 * v8];
  v9[4] = &unk_255DA0A08;
  v9[5] = v6;
  swift_getKeyPath();
  sub_22D8E6ED8();
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t sub_22D8DE684()
{
  return sub_22D8DF24C((void (*)(void))sub_22D8DFEFC);
}

uint64_t sub_22D8DE698@<X0>(_QWORD *a1@<X8>)
{
  return keypath_getTm((void (*)(void))sub_22D8DFEFC, a1);
}

uint64_t sub_22D8DE6AC@<X0>(_QWORD *a1@<X8>)
{
  return keypath_getTm((void (*)(void))sub_22D8DFEFC, a1);
}

uint64_t sub_22D8DE6C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_22D8DF100(a1, a2, a3, a4, (void (*)(void))sub_22D8DFEFC);
}

uint64_t sub_22D8DE6D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_22D8DF100(a1, a2, a3, a4, (void (*)(void))sub_22D8DFEFC);
}

uint64_t sub_22D8DE6F8@<X0>(uint64_t a1@<X0>, char a2@<W1>, _QWORD *a3@<X8>)
{
  return sub_22D8DEB2C(a1, a2, (void (*)(uint64_t, _QWORD))sub_22D8CE69C, 0xD00000000000001ALL, 0x800000022D8E9EE0, (void (*)(_QWORD, _QWORD))sub_22D8CC628, a3);
}

uint64_t sub_22D8DE724(uint64_t a1, char a2)
{
  return sub_22D8DE73C(a1, a2, &qword_255DA0AD0);
}

uint64_t sub_22D8DE730(uint64_t a1, char a2)
{
  return sub_22D8DE73C(a1, a2, &qword_255DA0AB8);
}

uint64_t sub_22D8DE73C(uint64_t a1, char a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  os_log_type_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v18;
  uint64_t v19;

  v6 = sub_22D8E6D4C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a2 & 1) != 0)
  {
    swift_bridgeObjectRetain();
  }
  else
  {
    swift_retain();
    v10 = sub_22D8E70DC();
    v11 = sub_22D8E6EA8();
    v12 = v10;
    if (os_log_type_enabled(v11, v10))
    {
      v13 = swift_slowAlloc();
      v14 = swift_slowAlloc();
      v19 = v14;
      *(_DWORD *)v13 = 136315138;
      __swift_instantiateConcreteTypeFromMangledName(a3);
      v15 = sub_22D8E71F0();
      *(_QWORD *)(v13 + 4) = sub_22D8DF558(v15, v16, &v19);
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22D8C9000, v11, v12, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v13, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22E31B1D0](v14, -1, -1);
      MEMORY[0x22E31B1D0](v13, -1, -1);
    }

    sub_22D8E6D40();
    swift_getAtKeyPath();
    sub_22D8CE014(a1, 0);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    return v19;
  }
  return a1;
}

uint64_t sub_22D8DE8E8(uint64_t a1, char a2)
{
  return sub_22D8DE73C(a1, a2, &qword_255DA0AA0);
}

uint64_t sub_22D8DE8F4(uint64_t a1, char a2)
{
  return sub_22D8DE73C(a1, a2, &qword_255DA0AE0);
}

uint64_t sub_22D8DE900@<X0>(uint64_t a1@<X0>, char a2@<W1>, _BYTE *a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  char *v10;
  os_log_type_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v6 = sub_22D8E6D4C();
  v7 = *(_QWORD *)(v6 - 8);
  result = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a2 & 1) != 0)
  {
    *a3 = a1 & 1;
  }
  else
  {
    sub_22D8CE69C(a1, 0);
    v11 = sub_22D8E70DC();
    v12 = sub_22D8E6EA8();
    if (os_log_type_enabled(v12, v11))
    {
      v13 = swift_slowAlloc();
      v14 = swift_slowAlloc();
      v16 = v14;
      *(_DWORD *)v13 = 136315138;
      *(_QWORD *)(v13 + 4) = sub_22D8DF558(0xD00000000000001ALL, 0x800000022D8E9E50, &v16);
      _os_log_impl(&dword_22D8C9000, v12, v11, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v13, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22E31B1D0](v14, -1, -1);
      MEMORY[0x22E31B1D0](v13, -1, -1);
    }

    sub_22D8E6D40();
    swift_getAtKeyPath();
    sub_22D8CC628(a1, 0);
    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  }
  return result;
}

uint64_t sub_22D8DEAA8@<X0>(uint64_t a1@<X0>, char a2@<W1>, _QWORD *a3@<X8>)
{
  return sub_22D8DEB2C(a1, a2, (void (*)(uint64_t, _QWORD))sub_22D8CE69C, 0xD000000000000023, 0x800000022D8E9EB0, (void (*)(_QWORD, _QWORD))sub_22D8CC628, a3);
}

uint64_t sub_22D8DEAD4@<X0>(uint64_t a1@<X0>, char a2@<W1>, _QWORD *a3@<X8>)
{
  return sub_22D8DEB2C(a1, a2, (void (*)(uint64_t, _QWORD))sub_22D8DFF8C, 0xD000000000000012, 0x800000022D8E9E70, (void (*)(_QWORD, _QWORD))sub_22D8DFF90, a3);
}

uint64_t sub_22D8DEB00@<X0>(uint64_t a1@<X0>, char a2@<W1>, _QWORD *a3@<X8>)
{
  return sub_22D8DEB2C(a1, a2, (void (*)(uint64_t, _QWORD))sub_22D8DFF8C, 0xD000000000000018, 0x800000022D8E9E90, (void (*)(_QWORD, _QWORD))sub_22D8DFF90, a3);
}

uint64_t sub_22D8DEB2C@<X0>(uint64_t a1@<X0>, char a2@<W1>, void (*a3)(uint64_t, _QWORD)@<X2>, uint64_t a4@<X3>, unint64_t a5@<X4>, void (*a6)(_QWORD, _QWORD)@<X5>, _QWORD *a7@<X8>)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t result;
  uint64_t v17;
  char *v18;
  os_log_type_t v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  void (*v28)(_QWORD, _QWORD);
  uint64_t v29;

  v14 = sub_22D8E6D4C();
  v15 = *(_QWORD *)(v14 - 8);
  result = MEMORY[0x24BDAC7A8]();
  v18 = (char *)&v26 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a2 & 1) != 0)
  {
    *a7 = a1;
  }
  else
  {
    a3(a1, 0);
    v19 = sub_22D8E70DC();
    v20 = sub_22D8E6EA8();
    if (os_log_type_enabled(v20, v19))
    {
      v21 = swift_slowAlloc();
      v27 = a5;
      v22 = v21;
      v23 = swift_slowAlloc();
      v28 = a6;
      v29 = v23;
      v24 = v23;
      *(_DWORD *)v22 = 136315138;
      *(_QWORD *)(v22 + 4) = sub_22D8DF558(a4, v27, &v29);
      _os_log_impl(&dword_22D8C9000, v20, v19, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", (uint8_t *)v22, 0xCu);
      swift_arrayDestroy();
      v25 = v24;
      a6 = v28;
      MEMORY[0x22E31B1D0](v25, -1, -1);
      MEMORY[0x22E31B1D0](v22, -1, -1);
    }

    sub_22D8E6D40();
    swift_getAtKeyPath();
    a6(a1, 0);
    return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v18, v14);
  }
  return result;
}

uint64_t sub_22D8DECD8(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t);

  *(_QWORD *)(v3 + 16) = a1;
  v4 = *a2;
  v7 = (uint64_t (*)(uint64_t))((char *)a3 + *a3);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 24) = v5;
  *v5 = v3;
  v5[1] = sub_22D8DFF94;
  return v7(v4);
}

uint64_t sub_22D8DED3C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_22D8DED60(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  int *v6;
  _QWORD *v7;

  v6 = *(int **)(v2 + 16);
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_22D8DB7C8;
  return ((uint64_t (*)(uint64_t, uint64_t *, int *))((char *)&dword_255DA0A00 + dword_255DA0A00))(a1, a2, v6);
}

uint64_t View.onApplePayShippingContactChange(perform:)(uint64_t a1, uint64_t a2)
{
  uint64_t KeyPath;
  _QWORD *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  _QWORD *v9;

  KeyPath = swift_getKeyPath();
  v5 = (_QWORD *)sub_22D8DE73C(KeyPath, 0, &qword_255DA0AB8);
  swift_release();
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = a1;
  *(_QWORD *)(v6 + 24) = a2;
  swift_retain();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v5 = sub_22D8DFD58(0, v5[2] + 1, 1, v5, &qword_255DA0AB0);
  v8 = v5[2];
  v7 = v5[3];
  if (v8 >= v7 >> 1)
    v5 = sub_22D8DFD58((_QWORD *)(v7 > 1), v8 + 1, 1, v5, &qword_255DA0AB0);
  v5[2] = v8 + 1;
  v9 = &v5[2 * v8];
  v9[4] = &unk_255DA0A18;
  v9[5] = v6;
  swift_getKeyPath();
  sub_22D8E6ED8();
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t sub_22D8DEF34()
{
  return sub_22D8DF24C((void (*)(void))sub_22D8DFEB8);
}

uint64_t sub_22D8DEF48@<X0>(_QWORD *a1@<X8>)
{
  return keypath_getTm((void (*)(void))sub_22D8DFEB8, a1);
}

uint64_t sub_22D8DEF5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_22D8DF100(a1, a2, a3, a4, (void (*)(void))sub_22D8DFEB8);
}

uint64_t View.onApplePayShippingMethodChange(perform:)(uint64_t a1, uint64_t a2)
{
  uint64_t KeyPath;
  _QWORD *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  _QWORD *v9;

  KeyPath = swift_getKeyPath();
  v5 = (_QWORD *)sub_22D8DE73C(KeyPath, 0, &qword_255DA0AA0);
  swift_release();
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = a1;
  *(_QWORD *)(v6 + 24) = a2;
  swift_retain();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v5 = sub_22D8DFD58(0, v5[2] + 1, 1, v5, &qword_255DA0A98);
  v8 = v5[2];
  v7 = v5[3];
  if (v8 >= v7 >> 1)
    v5 = sub_22D8DFD58((_QWORD *)(v7 > 1), v8 + 1, 1, v5, &qword_255DA0A98);
  v5[2] = v8 + 1;
  v9 = &v5[2 * v8];
  v9[4] = &unk_255DA0A28;
  v9[5] = v6;
  swift_getKeyPath();
  sub_22D8E6ED8();
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t sub_22D8DF0C4()
{
  return sub_22D8DF24C((void (*)(void))sub_22D8DFE74);
}

uint64_t sub_22D8DF0D8@<X0>(_QWORD *a1@<X8>)
{
  return keypath_getTm((void (*)(void))sub_22D8DFE74, a1);
}

uint64_t sub_22D8DF0EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_22D8DF100(a1, a2, a3, a4, (void (*)(void))sub_22D8DFE74);
}

uint64_t sub_22D8DF100(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(void))
{
  a5();
  swift_bridgeObjectRetain();
  return sub_22D8E6D70();
}

uint64_t View.onApplePayCouponCodeChange(perform:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DA0A30);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_22D8E8890;
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = a1;
  *(_QWORD *)(v5 + 24) = a2;
  *(_QWORD *)(v4 + 32) = &unk_255DA0A40;
  *(_QWORD *)(v4 + 40) = v5;
  swift_retain();
  sub_22D8E6ED8();
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t sub_22D8DF238()
{
  return sub_22D8DF24C((void (*)(void))sub_22D8DFD08);
}

uint64_t sub_22D8DF24C(void (*a1)(void))
{
  uint64_t v2;

  a1();
  sub_22D8E6D64();
  return v2;
}

uint64_t sub_22D8DF28C@<X0>(_QWORD *a1@<X8>)
{
  return keypath_getTm((void (*)(void))sub_22D8DFD08, a1);
}

uint64_t keypath_getTm@<X0>(void (*a1)(void)@<X3>, _QWORD *a2@<X8>)
{
  uint64_t result;
  uint64_t v4;

  a1();
  result = sub_22D8E6D64();
  *a2 = v4;
  return result;
}

uint64_t sub_22D8DF2F4(uint64_t a1)
{
  _QWORD *v1;
  uint64_t (*v2)(_QWORD *, _QWORD);
  _QWORD v4[4];

  v1 = *(_QWORD **)a1;
  if (*(_QWORD *)(*(_QWORD *)a1 + 16))
  {
    swift_bridgeObjectRetain();
    sub_22D8DFD08();
    v2 = (uint64_t (*)(_QWORD *, _QWORD))sub_22D8E6D58();
    sub_22D8D8A64(v1);
    return v2(v4, 0);
  }
  else
  {
    sub_22D8DFD08();
    return sub_22D8E6D70();
  }
}

uint64_t sub_22D8DF398(uint64_t a1, uint64_t *a2, int *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t, uint64_t);

  *(_QWORD *)(v3 + 16) = a1;
  v4 = *a2;
  v5 = a2[1];
  v8 = (uint64_t (*)(uint64_t, uint64_t))((char *)a3 + *a3);
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 24) = v6;
  *v6 = v3;
  v6[1] = sub_22D8DF404;
  return v8(v4, v5);
}

uint64_t sub_22D8DF404(uint64_t a1)
{
  uint64_t *v1;
  _QWORD *v3;
  uint64_t v5;

  v3 = *(_QWORD **)(*v1 + 16);
  v5 = *v1;
  swift_task_dealloc();
  *v3 = a1;
  return (*(uint64_t (**)(void))(v5 + 8))();
}

void sub_22D8DF454()
{
  qword_255DA2868 = MEMORY[0x24BEE4AF8];
}

uint64_t sub_22D8DF468@<X0>(_QWORD *a1@<X8>)
{
  return sub_22D8DF514(&qword_255D9FD08, &qword_255DA2868, a1);
}

void sub_22D8DF484()
{
  qword_255DA2870 = MEMORY[0x24BEE4AF8];
}

uint64_t sub_22D8DF498@<X0>(_QWORD *a1@<X8>)
{
  return sub_22D8DF514(&qword_255D9FD10, &qword_255DA2870, a1);
}

void sub_22D8DF4B4()
{
  qword_255DA2878 = MEMORY[0x24BEE4AF8];
}

uint64_t sub_22D8DF4C8@<X0>(_QWORD *a1@<X8>)
{
  return sub_22D8DF514(&qword_255D9FD18, &qword_255DA2878, a1);
}

void sub_22D8DF4E4()
{
  qword_255DA2880 = MEMORY[0x24BEE4AF8];
}

uint64_t sub_22D8DF4F8@<X0>(_QWORD *a1@<X8>)
{
  return sub_22D8DF514(&qword_255D9FD20, &qword_255DA2880, a1);
}

uint64_t sub_22D8DF514@<X0>(_QWORD *a1@<X2>, _QWORD *a2@<X3>, _QWORD *a3@<X8>)
{
  if (*a1 != -1)
    swift_once();
  *a3 = *a2;
  return swift_bridgeObjectRetain();
}

unint64_t sub_22D8DF558(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_22D8DF628(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_22D8DFCC8((uint64_t)v12, *a3);
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
      sub_22D8DFCC8((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

unint64_t sub_22D8DF628(unint64_t *a1, void *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  unint64_t result;
  uint64_t v10;
  unint64_t v11;
  _QWORD v12[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v10 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v10)
        {
          v12[0] = a5;
          v12[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          memcpy(__dst, v12, HIBYTE(a6) & 0xF);
          result = 0;
          *((_BYTE *)__dst + v10) = 0;
          *a1 = (unint64_t)__dst;
          return result;
        }
      }
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    result = sub_22D8DF724(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    result = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    result = sub_22D8E7178();
    if (!result)
    {
      __break(1u);
      return result;
    }
  }
  *a1 = result;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain();
}

uint64_t sub_22D8DF724(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_22D8DF7B8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = (uint64_t)sub_22D8DF8B4(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = (uint64_t)sub_22D8DF8B4((char *)(v3 > 1), v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_22D8DF7B8(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t result;
  char v5;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_9;
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (v2)
  {
    while (1)
    {
      v3 = sub_22D8DF850(v2, 0);
      result = sub_22D8E7154();
      if ((v5 & 1) != 0)
        break;
      if (result == v2)
        return (uint64_t)v3;
      __break(1u);
LABEL_9:
      v2 = sub_22D8E7058();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_22D8DF850(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DA0A88);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_22D8DF8B4(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_255DA0A88);
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
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v8])
      memmove(v12, v13, v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_22D8DF99C@<X0>(_QWORD *a1@<X8>)
{
  return keypath_getTm((void (*)(void))sub_22D8DFEB8, a1);
}

uint64_t sub_22D8DF9B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_22D8DF100(a1, a2, a3, a4, (void (*)(void))sub_22D8DFEB8);
}

uint64_t sub_22D8DF9D4(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  int *v6;
  _QWORD *v7;

  v6 = *(int **)(v2 + 16);
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_22D8DB7C8;
  return ((uint64_t (*)(uint64_t, uint64_t *, int *))((char *)&dword_255DA0A10 + dword_255DA0A10))(a1, a2, v6);
}

uint64_t sub_22D8DFA54@<X0>(_QWORD *a1@<X8>)
{
  return keypath_getTm((void (*)(void))sub_22D8DFE74, a1);
}

uint64_t sub_22D8DFA68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_22D8DF100(a1, a2, a3, a4, (void (*)(void))sub_22D8DFE74);
}

uint64_t sub_22D8DFA8C(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  int *v6;
  _QWORD *v7;

  v6 = *(int **)(v2 + 16);
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_22D8DB7C8;
  return ((uint64_t (*)(uint64_t, uint64_t *, int *))((char *)&dword_255DA0A20 + dword_255DA0A20))(a1, a2, v6);
}

uint64_t sub_22D8DFB0C@<X0>(_QWORD *a1@<X8>)
{
  return keypath_getTm((void (*)(void))sub_22D8DFD08, a1);
}

uint64_t sub_22D8DFB24(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  int *v6;
  _QWORD *v7;

  v6 = *(int **)(v2 + 16);
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_22D8CE0A0;
  return ((uint64_t (*)(uint64_t, uint64_t *, int *))((char *)&dword_255DA0A38 + dword_255DA0A38))(a1, a2, v6);
}

uint64_t sub_22D8DFBA4(uint64_t a1)
{
  return get_witness_table_7SwiftUI4ViewRzlAA15ModifiedContentVyxAA30_EnvironmentKeyWritingModifierVySaySo35PKPaymentRequestPaymentMethodUpdateCSo0jM0CYacGGGAaBHPxAaBHD1__AlA0cI0HPyHCHCTm(a1, &qword_255DA0A48, &qword_255DA0A50);
}

uint64_t sub_22D8DFBB8(uint64_t a1)
{
  return get_witness_table_7SwiftUI4ViewRzlAA15ModifiedContentVyxAA30_EnvironmentKeyWritingModifierVySaySo35PKPaymentRequestPaymentMethodUpdateCSo0jM0CYacGGGAaBHPxAaBHD1__AlA0cI0HPyHCHCTm(a1, &qword_255DA0A58, &qword_255DA0A60);
}

uint64_t get_witness_table_7SwiftUI4ViewRzlAA15ModifiedContentVyxAA30_EnvironmentKeyWritingModifierVySaySo35PKPaymentRequestPaymentMethodUpdateCSo0jM0CYacGGGAaBHPxAaBHD1__AlA0cI0HPyHCHCTm(uint64_t a1, uint64_t *a2, unint64_t *a3)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[2];

  v5 = *(_QWORD *)(a1 + 8);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
  v6 = sub_22D8E6D10();
  v8[0] = v5;
  v8[1] = sub_22D8DFC68(a3, a2);
  return MEMORY[0x22E31B14C](MEMORY[0x24BDED308], v6, v8);
}

uint64_t sub_22D8DFC40(uint64_t a1)
{
  return get_witness_table_7SwiftUI4ViewRzlAA15ModifiedContentVyxAA30_EnvironmentKeyWritingModifierVySaySo35PKPaymentRequestPaymentMethodUpdateCSo0jM0CYacGGGAaBHPxAaBHD1__AlA0cI0HPyHCHCTm(a1, &qword_255DA0A68, &qword_255DA0A70);
}

uint64_t sub_22D8DFC54(uint64_t a1)
{
  return get_witness_table_7SwiftUI4ViewRzlAA15ModifiedContentVyxAA30_EnvironmentKeyWritingModifierVySaySo35PKPaymentRequestPaymentMethodUpdateCSo0jM0CYacGGGAaBHPxAaBHD1__AlA0cI0HPyHCHCTm(a1, &qword_255DA0A78, &qword_255DA0A80);
}

uint64_t sub_22D8DFC68(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x22E31B14C](MEMORY[0x24BDF1028], v4);
    atomic_store(result, a1);
  }
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

uint64_t sub_22D8DFCC8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_22D8DFD08()
{
  unint64_t result;

  result = qword_255DA0A90;
  if (!qword_255DA0A90)
  {
    result = MEMORY[0x22E31B14C](&unk_22D8E8E64, &type metadata for PayWithApplePayButtonCouponCodeChangeKey);
    atomic_store(result, (unint64_t *)&qword_255DA0A90);
  }
  return result;
}

_QWORD *sub_22D8DFD4C(_QWORD *a1, int64_t a2, char a3, _QWORD *a4)
{
  return sub_22D8DFD58(a1, a2, a3, a4, &qword_255DA0A30);
}

_QWORD *sub_22D8DFD58(_QWORD *result, int64_t a2, char a3, _QWORD *a4, uint64_t *a5)
{
  char v6;
  unint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  int64_t v12;
  uint64_t v13;

  v6 = (char)result;
  if ((a3 & 1) != 0)
  {
    v7 = a4[3];
    v8 = v7 >> 1;
    if ((uint64_t)(v7 >> 1) < a2)
    {
      if (v8 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v8 = v7 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v7 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v8 = a2;
    }
  }
  else
  {
    v8 = a2;
  }
  v9 = a4[2];
  if (v8 <= v9)
    v10 = a4[2];
  else
    v10 = v8;
  if (v10)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    v11 = (_QWORD *)swift_allocObject();
    v12 = _swift_stdlib_malloc_size(v11);
    v13 = v12 - 32;
    if (v12 < 32)
      v13 = v12 - 17;
    v11[2] = v9;
    v11[3] = 2 * (v13 >> 4);
  }
  else
  {
    v11 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  if ((v6 & 1) != 0)
  {
    if (v11 != a4 || v11 + 4 >= &a4[2 * v9 + 4])
      memmove(v11 + 4, a4 + 4, 16 * v9);
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(qword_255DA0700);
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v11;
}

unint64_t sub_22D8DFE74()
{
  unint64_t result;

  result = qword_255DA0AA8;
  if (!qword_255DA0AA8)
  {
    result = MEMORY[0x22E31B14C](&unk_22D8E8E2C, &type metadata for PayWithApplePayButtonShippingChangeKey);
    atomic_store(result, (unint64_t *)&qword_255DA0AA8);
  }
  return result;
}

unint64_t sub_22D8DFEB8()
{
  unint64_t result;

  result = qword_255DA0AC0;
  if (!qword_255DA0AC0)
  {
    result = MEMORY[0x22E31B14C](&unk_22D8E8DF4, &type metadata for PayWithApplePayButtonShippingContactChangeKey);
    atomic_store(result, (unint64_t *)&qword_255DA0AC0);
  }
  return result;
}

unint64_t sub_22D8DFEFC()
{
  unint64_t result;

  result = qword_255DA0AD8;
  if (!qword_255DA0AD8)
  {
    result = MEMORY[0x22E31B14C](&unk_22D8E8DBC, &type metadata for PayWithApplePayButtonPaymentMethodChangeKey);
    atomic_store(result, (unint64_t *)&qword_255DA0AD8);
  }
  return result;
}

ValueMetadata *type metadata accessor for PayWithApplePayButtonPaymentMethodChangeKey()
{
  return &type metadata for PayWithApplePayButtonPaymentMethodChangeKey;
}

ValueMetadata *type metadata accessor for PayWithApplePayButtonShippingContactChangeKey()
{
  return &type metadata for PayWithApplePayButtonShippingContactChangeKey;
}

ValueMetadata *type metadata accessor for PayWithApplePayButtonShippingChangeKey()
{
  return &type metadata for PayWithApplePayButtonShippingChangeKey;
}

ValueMetadata *type metadata accessor for PayWithApplePayButtonCouponCodeChangeKey()
{
  return &type metadata for PayWithApplePayButtonCouponCodeChangeKey;
}

id sub_22D8DFF98()
{
  return objc_msgSend((id)objc_opt_self(), sel_openInstallWallet);
}

uint64_t sub_22D8DFFBC()
{
  unsigned __int8 v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255DA0058);
  sub_22D8E6F50();
  return v1;
}

uint64_t sub_22D8E0010@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char v6;

  v4 = v2 + *(int *)(a1 + 52);
  v5 = *(_QWORD *)v4;
  v6 = *(_BYTE *)(v4 + 8);
  sub_22D8DFF8C(*(_QWORD *)v4, v6);
  sub_22D8DEAD4(v5, v6, a2);
  return sub_22D8DFF90(v5, v6);
}

uint64_t sub_22D8E0068@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char v6;

  v4 = v2 + *(int *)(a1 + 56);
  v5 = *(_QWORD *)v4;
  v6 = *(_BYTE *)(v4 + 8);
  sub_22D8DFF8C(*(_QWORD *)v4, v6);
  sub_22D8DEB00(v5, v6, a2);
  return sub_22D8DFF90(v5, v6);
}

uint64_t PayLaterView.body.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(char *, uint64_t, uint64_t);
  uint64_t v27;
  char *v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  void (*v35)(char *, uint64_t);
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD v52[2];
  _QWORD v53[2];
  uint64_t v54;

  v48 = a2;
  v3 = sub_22D8E70C4();
  v46 = *(_QWORD *)(v3 - 8);
  v47 = v3;
  v4 = MEMORY[0x24BDAC7A8](v3);
  v45 = (char *)&v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(_QWORD *)(a1 - 8);
  v43 = *(_QWORD *)(v6 + 64);
  MEMORY[0x24BDAC7A8](v4);
  v40 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255DA0AE8);
  v8 = *(_QWORD *)(a1 + 16);
  v9 = a1;
  v39 = a1;
  v37 = v8;
  v10 = sub_22D8E7124();
  v11 = sub_22D8E6E30();
  v12 = sub_22D8E0454();
  v54 = *(_QWORD *)(v9 + 24);
  v13 = v54;
  v38 = v54;
  v14 = MEMORY[0x22E31B14C](MEMORY[0x24BDF5578], v10, &v54);
  v53[0] = v12;
  v53[1] = v14;
  MEMORY[0x22E31B14C](MEMORY[0x24BDEF3E0], v11, v53);
  v15 = sub_22D8E6FA4();
  v41 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v37 - v16;
  sub_22D8E6CEC();
  v18 = sub_22D8E6D10();
  v44 = *(_QWORD *)(v18 - 8);
  v19 = MEMORY[0x24BDAC7A8](v18);
  v21 = (char *)&v37 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v19);
  v23 = (char *)&v37 - v22;
  v49 = v8;
  v50 = v13;
  v24 = v42;
  v51 = v42;
  sub_22D8E6D7C();
  sub_22D8E6F98();
  v25 = v6;
  v26 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  v27 = v39;
  v28 = v40;
  v26(v40, v24, v39);
  v29 = (*(unsigned __int8 *)(v25 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v25 + 80);
  v30 = swift_allocObject();
  v31 = v38;
  *(_QWORD *)(v30 + 16) = v37;
  *(_QWORD *)(v30 + 24) = v31;
  (*(void (**)(unint64_t, char *, uint64_t))(v25 + 32))(v30 + v29, v28, v27);
  v32 = MEMORY[0x22E31B14C](MEMORY[0x24BDF4700], v15);
  v33 = v45;
  sub_22D8CE200();
  sub_22D8E6EFC();
  swift_release();
  (*(void (**)(char *, uint64_t))(v46 + 8))(v33, v47);
  (*(void (**)(char *, uint64_t))(v41 + 8))(v17, v15);
  v34 = sub_22D8E3284(qword_255D9FF50, (uint64_t (*)(uint64_t))MEMORY[0x24BDEC4E0], MEMORY[0x24BDEC4C8]);
  v52[0] = v32;
  v52[1] = v34;
  MEMORY[0x22E31B14C](MEMORY[0x24BDED308], v18, v52);
  sub_22D8CFBF4((uint64_t)v21, v18, (uint64_t)v23);
  v35 = *(void (**)(char *, uint64_t))(v44 + 8);
  v35(v21, v18);
  sub_22D8CDC24((uint64_t)v23, v18, v48);
  return ((uint64_t (*)(char *, uint64_t))v35)(v23, v18);
}

unint64_t sub_22D8E0454()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_255DA0AF0;
  if (!qword_255DA0AF0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255DA0AE8);
    v2[0] = sub_22D8E3284(&qword_255DA0AF8, (uint64_t (*)(uint64_t))type metadata accessor for PayLaterViewWrapper, (uint64_t)&unk_22D8E90C4);
    v2[1] = MEMORY[0x24BDEDBB8];
    result = MEMORY[0x22E31B14C](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_255DA0AF0);
  }
  return result;
}

uint64_t type metadata accessor for PayLaterViewWrapper()
{
  uint64_t result;

  result = qword_255DA0C00;
  if (!qword_255DA0C00)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_22D8E0514@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
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
  void (*v22)(char *, uint64_t);
  unint64_t v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD v30[2];
  uint64_t v31;
  uint64_t v32;

  v28 = a4;
  v7 = sub_22D8E7124();
  v26 = *(_QWORD *)(v7 - 8);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v26 - v11;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DA0AE8);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v26 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_22D8E6E30();
  v27 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)&v26 - v17;
  v20 = type metadata accessor for PayLaterView(0, a2, a3, v19);
  if ((sub_22D8DFFBC() & 1) != 0)
  {
    sub_22D8E07A0(v20, (uint64_t)v15);
    sub_22D8E0454();
    v29 = a3;
    MEMORY[0x22E31B14C](MEMORY[0x24BDF5578], v7, &v29);
    sub_22D8CFC68((uint64_t)v15, v13);
    sub_22D8E3388((uint64_t)v15);
  }
  else
  {
    v21 = a1 + *(int *)(v20 + 40);
    v32 = a3;
    MEMORY[0x22E31B14C](MEMORY[0x24BDF5578], v7, &v32);
    sub_22D8CFBF4(v21, v7, (uint64_t)v12);
    sub_22D8CDC24((uint64_t)v12, v7, (uint64_t)v10);
    sub_22D8E0454();
    sub_22D8CFD2C((uint64_t)v10, v13, v7);
    v22 = *(void (**)(char *, uint64_t))(v26 + 8);
    v22(v10, v7);
    v22(v12, v7);
  }
  v23 = sub_22D8E0454();
  v31 = a3;
  v24 = MEMORY[0x22E31B14C](MEMORY[0x24BDF5578], v7, &v31);
  v30[0] = v23;
  v30[1] = v24;
  MEMORY[0x22E31B14C](MEMORY[0x24BDEF3E0], v16, v30);
  sub_22D8CDC24((uint64_t)v18, v16, v28);
  return (*(uint64_t (**)(char *, uint64_t))(v27 + 8))(v18, v16);
}

uint64_t sub_22D8E0794@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;

  return sub_22D8E0514(v1[4], v1[2], v1[3], a1);
}

uint64_t sub_22D8E07A0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  int *v2;
  int *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  void (*v15)(char *, uint64_t, uint64_t);
  uint64_t v16;
  uint64_t v17;
  char *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v23;
  uint64_t v24;
  _OWORD v25[7];

  v5 = (int *)type metadata accessor for PayLaterViewWrapper();
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DA0AE8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *v2;
  v12 = (uint64_t)v2 + *(int *)(a1 + 36);
  v13 = &v7[v5[5]];
  v14 = sub_22D8E6C8C();
  v15 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 16);
  v23 = *(_OWORD *)(v2 + 1);
  v15(v13, v12, v14);
  sub_22D8E0068(a1, v25);
  v16 = *(_QWORD *)&v25[0];
  sub_22D8E0010(a1, &v24);
  v17 = v24;
  *(_DWORD *)v7 = v11;
  *(_OWORD *)(v7 + 4) = v23;
  *(_QWORD *)&v7[v5[6]] = v16;
  *(_QWORD *)&v7[v5[7]] = v17;
  sub_22D8E6FD4();
  sub_22D8E6D1C();
  sub_22D8E33C8((uint64_t)v7, (uint64_t)v10);
  v18 = &v10[*(int *)(v8 + 36)];
  v19 = v25[5];
  *((_OWORD *)v18 + 4) = v25[4];
  *((_OWORD *)v18 + 5) = v19;
  *((_OWORD *)v18 + 6) = v25[6];
  v20 = v25[1];
  *(_OWORD *)v18 = v25[0];
  *((_OWORD *)v18 + 1) = v20;
  v21 = v25[3];
  *((_OWORD *)v18 + 2) = v25[2];
  *((_OWORD *)v18 + 3) = v21;
  sub_22D8E340C((uint64_t)v7);
  return sub_22D8E3448((uint64_t)v10, a2, &qword_255DA0AE8);
}

uint64_t sub_22D8E09E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  v3[2] = sub_22D8E70A0();
  v3[3] = sub_22D8E7094();
  v6 = (_QWORD *)swift_task_alloc();
  v3[4] = v6;
  v8 = type metadata accessor for PayLaterView(0, a2, a3, v7);
  *v6 = v3;
  v6[1] = sub_22D8D5890;
  return sub_22D8E0C44(v8);
}

uint64_t sub_22D8E0A68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  int *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v5 = *(_QWORD *)(v4 + 16);
  v6 = (int *)type metadata accessor for PayLaterView(0, v5, *(_QWORD *)(v4 + 24), a4);
  v7 = *(unsigned __int8 *)(*((_QWORD *)v6 - 1) + 80);
  v8 = v4 + ((v7 + 32) & ~v7);
  v9 = v8 + v6[9];
  v10 = sub_22D8E6C8C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
  v11 = v8 + v6[10];
  v12 = *(_QWORD *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v12 + 48))(v11, 1, v5))
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v5);
  swift_release();
  sub_22D8DFF90(*(_QWORD *)(v8 + v6[13]), *(_BYTE *)(v8 + v6[13] + 8));
  sub_22D8DFF90(*(_QWORD *)(v8 + v6[14]), *(_BYTE *)(v8 + v6[14] + 8));
  v13 = v8 + v6[15];
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DA0B08);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v14 = sub_22D8E6CC8();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 8))(v13, v14);
  }
  else
  {
    swift_release();
  }
  return swift_deallocObject();
}

uint64_t type metadata accessor for PayLaterView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for PayLaterView);
}

uint64_t sub_22D8E0BC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  v6 = *(_QWORD *)(v4 + 16);
  v7 = *(_QWORD *)(v4 + 24);
  v8 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for PayLaterView(0, v6, v7, a4) - 8) + 80);
  v9 = v4 + ((v8 + 32) & ~v8);
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v10;
  *v10 = v5;
  v10[1] = sub_22D8CE0A0;
  return sub_22D8E09E0(v9, v6, v7);
}

uint64_t sub_22D8E0C44(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2[2] = a1;
  v2[3] = v1;
  sub_22D8E70A0();
  v2[4] = sub_22D8E7094();
  v2[5] = sub_22D8E7088();
  v2[6] = v3;
  return swift_task_switch();
}

uint64_t sub_22D8E0CB0()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v1;
  *v1 = v0;
  v1[1] = sub_22D8E0D24;
  return sub_22D8E6CA4();
}

uint64_t sub_22D8E0D24(char a1)
{
  uint64_t v1;

  *(_BYTE *)(*(_QWORD *)v1 + 64) = a1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_22D8E0D7C()
{
  uint64_t v0;

  swift_release();
  sub_22D8D0214();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t PayLaterView<>.init(amount:currency:)@<X0>(unint64_t a1@<X0>, unint64_t a2@<X1>, unsigned int a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  __int16 v6;
  int v7;
  int *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  void (*v15)(char *, uint64_t, uint64_t);
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t *v21;
  void (*v22)(char *, uint64_t);
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unsigned int v29;
  unint64_t v30;
  unsigned int v31;
  uint64_t v32;
  char v33;
  char v34;
  uint64_t v35;

  v29 = a3;
  v6 = a2;
  v7 = a1;
  v32 = a5;
  v24 = a4;
  v25 = HIDWORD(a1);
  v26 = HIWORD(a1);
  v27 = a2 >> 16;
  v28 = HIDWORD(a2);
  v30 = HIWORD(a2);
  v31 = HIWORD(a3);
  v8 = (int *)__swift_instantiateConcreteTypeFromMangledName(qword_255DA0B18);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_22D8E6C8C();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
  v15(v14, a4, v11);
  v16 = v8[10];
  v10[v16] = 1;
  *(_QWORD *)&v10[v8[11]] = 0x4041800000000000;
  v17 = &v10[v8[12]];
  v33 = 0;
  sub_22D8E6F44();
  v18 = v35;
  *v17 = v34;
  *((_QWORD *)v17 + 1) = v18;
  v19 = &v10[v8[13]];
  *(_QWORD *)v19 = swift_getKeyPath();
  v19[8] = 0;
  v20 = &v10[v8[14]];
  *(_QWORD *)v20 = swift_getKeyPath();
  v20[8] = 0;
  v21 = (uint64_t *)&v10[v8[15]];
  *v21 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DA0B08);
  swift_storeEnumTagMultiPayload();
  *(_DWORD *)v10 = v7;
  *((_WORD *)v10 + 2) = v25;
  *((_WORD *)v10 + 3) = v26;
  *((_WORD *)v10 + 4) = v6;
  *((_WORD *)v10 + 5) = v27;
  *((_WORD *)v10 + 6) = v28;
  *((_WORD *)v10 + 7) = v30;
  *((_WORD *)v10 + 8) = v29;
  *((_WORD *)v10 + 9) = v31;
  v15(&v10[v8[9]], (uint64_t)v14, v11);
  v22 = *(void (**)(char *, uint64_t))(v12 + 8);
  v22(v14, v11);
  v10[v16] = 0;
  sub_22D8E3448((uint64_t)v10, v32, qword_255DA0B18);
  return ((uint64_t (*)(uint64_t, uint64_t))v22)(v24, v11);
}

void *sub_22D8E1014(uint64_t a1, int *a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  uint64_t v11;

  v4 = v2;
  v5 = sub_22D8E6C8C();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22D8E32C4();
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v4 + a2[5], v5);
  v9 = (void *)sub_22D8E70E8();
  objc_msgSend(v9, sel_setDisplayStyle_, *(_QWORD *)(v4 + a2[6]));
  objc_msgSend(v9, sel_setAction_, *(_QWORD *)(v4 + a2[7]));
  return v9;
}

id sub_22D8E1100(void *a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v12;

  v5 = v3;
  v7 = sub_22D8E6C8C();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22D8E70F4();
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v5 + a3[5], v7);
  sub_22D8E7100();
  objc_msgSend(a1, sel_setDisplayStyle_, *(_QWORD *)(v5 + a3[6]));
  return objc_msgSend(a1, sel_setAction_, *(_QWORD *)(v5 + a3[7]));
}

uint64_t sub_22D8E11CC()
{
  sub_22D8E3284(&qword_255DA0C40, (uint64_t (*)(uint64_t))type metadata accessor for PayLaterViewWrapper, (uint64_t)&unk_22D8E9034);
  return sub_22D8E6E00();
}

uint64_t sub_22D8E1234()
{
  sub_22D8E3284(&qword_255DA0C40, (uint64_t (*)(uint64_t))type metadata accessor for PayLaterViewWrapper, (uint64_t)&unk_22D8E9034);
  return sub_22D8E6DAC();
}

void sub_22D8E129C()
{
  sub_22D8E3284(&qword_255DA0C40, (uint64_t (*)(uint64_t))type metadata accessor for PayLaterViewWrapper, (uint64_t)&unk_22D8E9034);
  sub_22D8E6DF4();
  __break(1u);
}

uint64_t sub_22D8E12D8@<X0>(_QWORD *a1@<X8>)
{
  return keypath_getTm((void (*)(void))sub_22D8E3344, a1);
}

uint64_t sub_22D8E12EC@<X0>(_QWORD *a1@<X8>)
{
  return keypath_getTm((void (*)(void))sub_22D8E3344, a1);
}

uint64_t sub_22D8E1300(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm(a1, a2, a3, a4, (void (*)(void))sub_22D8E3344);
}

uint64_t sub_22D8E1314(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm(a1, a2, a3, a4, (void (*)(void))sub_22D8E3344);
}

uint64_t sub_22D8E1328@<X0>(_QWORD *a1@<X8>)
{
  return keypath_getTm((void (*)(void))sub_22D8E3300, a1);
}

uint64_t sub_22D8E133C@<X0>(_QWORD *a1@<X8>)
{
  return keypath_getTm((void (*)(void))sub_22D8E3300, a1);
}

uint64_t sub_22D8E1350(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm(a1, a2, a3, a4, (void (*)(void))sub_22D8E3300);
}

uint64_t keypath_setTm(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(void))
{
  a5();
  return sub_22D8E6D70();
}

uint64_t sub_22D8E13AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm(a1, a2, a3, a4, (void (*)(void))sub_22D8E3300);
}

uint64_t sub_22D8E13C0()
{
  return sub_22D8E6D28();
}

uint64_t sub_22D8E13E0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v2 = sub_22D8E6CC8();
  MEMORY[0x24BDAC7A8](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_22D8E6D34();
}

uint64_t sub_22D8E1460()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_22D8E1494()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;

  sub_22D8E6C8C();
  if (v0 <= 0x3F)
  {
    sub_22D8E7124();
    if (v1 <= 0x3F)
    {
      sub_22D8E2C88();
      if (v2 <= 0x3F)
        swift_initStructMetadata();
    }
  }
}

uint64_t sub_22D8E1568(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  int v20;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  void *v28;
  const void *v29;
  _QWORD *v31;
  _QWORD *v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  char v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  char v42;
  _QWORD *v43;
  _QWORD *v44;
  unsigned int v45;
  uint64_t v46;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  size_t __n;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;

  v6 = sub_22D8E6C8C();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_DWORD *)(v7 + 80);
  v9 = *(_QWORD *)(v7 + 64);
  v54 = v6;
  v55 = *(_QWORD *)(a3 + 16);
  v10 = *(_QWORD *)(v55 - 8);
  v11 = *(_DWORD *)(v10 + 80);
  if (*(_DWORD *)(v10 + 84))
    v12 = *(_QWORD *)(v10 + 64);
  else
    v12 = *(_QWORD *)(v10 + 64) + 1;
  __n = v12;
  v56 = v12 + 7;
  v13 = (((((v12
           + 7
           + ((v9 + ((v8 + 20) & ~(unint64_t)v8) + v11) & ~(unint64_t)v11)) & 0xFFFFFFFFFFFFFFF8)
         + 15) & 0xFFFFFFFFFFFFFFF8)
       + 39) & 0xFFFFFFFFFFFFFFF8;
  v14 = *(_QWORD *)(sub_22D8E6CC8() - 8);
  v15 = *(_DWORD *)(v14 + 80);
  v16 = v15 & 0xF8 | 7;
  v17 = (v15 & 0xF8) + 16;
  v18 = 8;
  if (*(_QWORD *)(v14 + 64) > 8uLL)
    v18 = *(_QWORD *)(v14 + 64);
  v19 = v11 | v8 | (unint64_t)v16;
  v20 = (v11 | v8 | v15) & 0x100000;
  if (v19 != 7 || v20 != 0 || v18 + ((v17 + v13) & ~v16) + 1 > 0x18)
  {
    v23 = *a2;
    *(_QWORD *)a1 = *a2;
    v24 = v23 + ((v19 + 16) & ~v19);
LABEL_26:
    swift_retain();
    return v24;
  }
  v50 = v17;
  v51 = v18;
  v48 = v14;
  v49 = ~v16;
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_DWORD *)(a1 + 16) = *((_DWORD *)a2 + 4);
  v52 = a1;
  v25 = (uint64_t)a2 + v8;
  v26 = (a1 + v8 + 20) & ~(unint64_t)v8;
  v27 = (v25 + 20) & ~(unint64_t)v8;
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v7 + 16))(v26, v27, v54);
  v28 = (void *)((v26 + v9 + v11) & ~(unint64_t)v11);
  v29 = (const void *)((v27 + v9 + v11) & ~(unint64_t)v11);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v10 + 48))(v29, 1, v55))
  {
    memcpy(v28, v29, __n);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v10 + 16))(v28, v29, v55);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v28, 0, 1, v55);
  }
  v31 = (_QWORD *)(((unint64_t)v28 + v56) & 0xFFFFFFFFFFFFF8);
  v32 = (_QWORD *)(((unint64_t)v29 + v56) & 0xFFFFFFFFFFFFFFF8);
  *v31 = *v32;
  v33 = ((unint64_t)v31 + 15) & 0xFFFFFFFFFFFFFFF8;
  v34 = ((unint64_t)v32 + 15) & 0xFFFFFFFFFFFFFFF8;
  *(_BYTE *)v33 = *(_BYTE *)v34;
  *(_QWORD *)(v33 + 8) = *(_QWORD *)(v34 + 8);
  v35 = (v33 + 23) & 0xFFFFFFFFFFFFFFF8;
  v36 = (v34 + 23) & 0xFFFFFFFFFFFFFFF8;
  v37 = *(_QWORD *)v36;
  v38 = *(_BYTE *)(v36 + 8);
  swift_retain();
  sub_22D8DFF8C(v37, v38);
  *(_QWORD *)v35 = v37;
  *(_BYTE *)(v35 + 8) = v38;
  v39 = (v33 + 39) & 0xFFFFFFFFFFFFFFF8;
  v40 = (v34 + 39) & 0xFFFFFFFFFFFFFFF8;
  v41 = *(_QWORD *)v40;
  v42 = *(_BYTE *)(v40 + 8);
  sub_22D8DFF8C(*(_QWORD *)v40, v42);
  *(_QWORD *)v39 = v41;
  *(_BYTE *)(v39 + 8) = v42;
  v43 = (_QWORD *)((v50 + v39) & v49);
  v44 = (_QWORD *)((v50 + v40) & v49);
  v45 = *((unsigned __int8 *)v44 + v51);
  if (v45 >= 2)
  {
    if (v51 <= 3)
      v46 = v51;
    else
      v46 = 4;
    __asm { BR              X12 }
  }
  v24 = v52;
  if (v45 != 1)
  {
    *v43 = *v44;
    *((_BYTE *)v43 + v51) = 0;
    goto LABEL_26;
  }
  (*(void (**)(_QWORD *))(v48 + 16))(v43);
  *((_BYTE *)v43 + v51) = 1;
  return v24;
}

uint64_t sub_22D8E18C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unsigned int v18;
  uint64_t v19;

  v4 = sub_22D8E6C8C();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = (a1 + *(unsigned __int8 *)(v5 + 80) + 20) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  (*(void (**)(unint64_t, uint64_t))(v5 + 8))(v6, v4);
  v7 = v6 + *(_QWORD *)(v5 + 64);
  v8 = *(_QWORD *)(a2 + 16);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = (v7 + *(unsigned __int8 *)(v9 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  if (!(*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v9 + 48))(v10, 1, v8))
    (*(void (**)(unint64_t, uint64_t))(v9 + 8))(v10, v8);
  v11 = v10 + *(_QWORD *)(v9 + 64);
  if (!*(_DWORD *)(v9 + 84))
    ++v11;
  v12 = (((v11 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8;
  swift_release();
  sub_22D8DFF90(*(_QWORD *)((v12 + 23) & 0xFFFFFFFFFFFFFFF8), *(_BYTE *)(((v12 + 23) & 0xFFFFFFFFFFFFFFF8) + 8));
  v13 = (v12 + 39) & 0xFFFFFFFFFFFFFFF8;
  sub_22D8DFF90(*(_QWORD *)v13, *(_BYTE *)(v13 + 8));
  v14 = *(_QWORD *)(sub_22D8E6CC8() - 8);
  v15 = *(_DWORD *)(v14 + 80) & 0xF8 | 7;
  v16 = (v13 + v15 + 9) & ~v15;
  v17 = *(_QWORD *)(v14 + 64);
  if (v17 <= 8)
    v17 = 8;
  v18 = *(unsigned __int8 *)(v16 + v17);
  if (v18 >= 2)
  {
    if (v17 <= 3)
      v19 = v17;
    else
      v19 = 4;
    __asm { BR              X14 }
  }
  if (v18 == 1)
    return (*(uint64_t (**)(void))(v14 + 8))();
  else
    return swift_release();
}

uint64_t sub_22D8E1A7C(uint64_t a1, uint64_t a2, uint64_t a3)
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
  uint64_t v15;
  void *v16;
  const void *v17;
  int v18;
  uint64_t v19;
  size_t v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  char v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  _QWORD *v39;
  _QWORD *v40;
  uint64_t v41;
  unsigned int v42;
  uint64_t v43;
  char v44;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  v6 = sub_22D8E6C8C();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(unsigned __int8 *)(v7 + 80);
  v9 = (v8 + 20 + a1) & ~v8;
  v10 = (v8 + 20 + a2) & ~v8;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v9, v10, v6);
  v11 = *(_QWORD *)(v7 + 64);
  v12 = *(_QWORD *)(a3 + 16);
  v13 = *(_QWORD *)(v12 - 8);
  v14 = *(unsigned __int8 *)(v13 + 80);
  v15 = v11 + v14;
  v16 = (void *)((v15 + v9) & ~v14);
  v17 = (const void *)((v15 + v10) & ~v14);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v13 + 48))(v17, 1, v12))
  {
    v18 = *(_DWORD *)(v13 + 84);
    v19 = *(_QWORD *)(v13 + 64);
    if (v18)
      v20 = *(_QWORD *)(v13 + 64);
    else
      v20 = v19 + 1;
    memcpy(v16, v17, v20);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v13 + 16))(v16, v17, v12);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v16, 0, 1, v12);
    v18 = *(_DWORD *)(v13 + 84);
    v19 = *(_QWORD *)(v13 + 64);
  }
  if (v18)
    v21 = v19;
  else
    v21 = v19 + 1;
  v22 = (_QWORD *)(((unint64_t)v16 + v21 + 7) & 0xFFFFFFFFFFFFF8);
  v23 = (_QWORD *)(((unint64_t)v17 + v21 + 7) & 0xFFFFFFFFFFFFFFF8);
  *v22 = *v23;
  v24 = ((unint64_t)v22 + 15) & 0xFFFFFFFFFFFFFFF8;
  v25 = ((unint64_t)v23 + 15) & 0xFFFFFFFFFFFFFFF8;
  *(_BYTE *)v24 = *(_BYTE *)v25;
  *(_QWORD *)(v24 + 8) = *(_QWORD *)(v25 + 8);
  v26 = (v24 + 23) & 0xFFFFFFFFFFFFFFF8;
  v27 = (v25 + 23) & 0xFFFFFFFFFFFFFFF8;
  v28 = *(_QWORD *)v27;
  v29 = *(_BYTE *)(v27 + 8);
  swift_retain();
  sub_22D8DFF8C(v28, v29);
  *(_QWORD *)v26 = v28;
  *(_BYTE *)(v26 + 8) = v29;
  v30 = (v24 + 39) & 0xFFFFFFFFFFFFFFF8;
  v31 = (v25 + 39) & 0xFFFFFFFFFFFFFFF8;
  v32 = *(_QWORD *)v31;
  v33 = *(_BYTE *)(v31 + 8);
  sub_22D8DFF8C(*(_QWORD *)v31, v33);
  *(_QWORD *)v30 = v32;
  *(_BYTE *)(v30 + 8) = v33;
  v34 = *(_QWORD *)(sub_22D8E6CC8() - 8);
  v35 = *(_DWORD *)(v34 + 80) & 0xF8;
  v36 = v35 + 16;
  v37 = v35 + 16 + v30;
  v38 = ~v35 & 0xFFFFFFFFFFFFFFF8;
  v39 = (_QWORD *)(v37 & v38);
  v40 = (_QWORD *)((v36 + v31) & v38);
  if (*(_QWORD *)(v34 + 64) <= 8uLL)
    v41 = 8;
  else
    v41 = *(_QWORD *)(v34 + 64);
  v42 = *((unsigned __int8 *)v40 + v41);
  if (v42 >= 2)
  {
    if (v41 <= 3)
      v43 = v41;
    else
      v43 = 4;
    __asm { BR              X13 }
  }
  if (v42 == 1)
  {
    (*(void (**)(_QWORD *))(v34 + 16))(v39);
    v44 = 1;
  }
  else
  {
    *v39 = *v40;
    swift_retain();
    v44 = 0;
  }
  *((_BYTE *)v39 + v41) = v44;
  return a1;
}

uint64_t sub_22D8E1D0C(uint64_t a1, uint64_t a2, uint64_t a3)
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
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t (*v18)(void *, uint64_t, uint64_t);
  int v19;
  size_t v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  char v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  _QWORD *v44;
  uint64_t v45;
  _QWORD *v46;
  uint64_t v47;
  uint64_t v48;
  unsigned int v49;
  uint64_t v50;
  unsigned int v51;
  uint64_t v52;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_WORD *)(a1 + 4) = *(_WORD *)(a2 + 4);
  *(_WORD *)(a1 + 6) = *(_WORD *)(a2 + 6);
  *(_WORD *)(a1 + 8) = *(_WORD *)(a2 + 8);
  *(_WORD *)(a1 + 10) = *(_WORD *)(a2 + 10);
  *(_WORD *)(a1 + 12) = *(_WORD *)(a2 + 12);
  *(_WORD *)(a1 + 14) = *(_WORD *)(a2 + 14);
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  *(_WORD *)(a1 + 18) = *(_WORD *)(a2 + 18);
  v6 = sub_22D8E6C8C();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(unsigned __int8 *)(v7 + 80);
  v9 = (v8 + 20 + a1) & ~v8;
  v10 = (v8 + 20 + a2) & ~v8;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 24))(v9, v10, v6);
  v11 = *(_QWORD *)(v7 + 64);
  v12 = *(_QWORD *)(a3 + 16);
  v13 = *(_QWORD *)(v12 - 8);
  v14 = *(unsigned __int8 *)(v13 + 80);
  v15 = v11 + v14;
  v16 = (void *)((v15 + v9) & ~v14);
  v17 = (void *)((v15 + v10) & ~v14);
  v18 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v13 + 48);
  LODWORD(v9) = v18(v16, 1, v12);
  v19 = v18(v17, 1, v12);
  if ((_DWORD)v9)
  {
    if (!v19)
    {
      (*(void (**)(void *, void *, uint64_t))(v13 + 16))(v16, v17, v12);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v16, 0, 1, v12);
      goto LABEL_10;
    }
  }
  else
  {
    if (!v19)
    {
      (*(void (**)(void *, void *, uint64_t))(v13 + 24))(v16, v17, v12);
      goto LABEL_10;
    }
    (*(void (**)(void *, uint64_t))(v13 + 8))(v16, v12);
  }
  if (*(_DWORD *)(v13 + 84))
    v20 = *(_QWORD *)(v13 + 64);
  else
    v20 = *(_QWORD *)(v13 + 64) + 1;
  memcpy(v16, v17, v20);
LABEL_10:
  if (*(_DWORD *)(v13 + 84))
    v21 = *(_QWORD *)(v13 + 64);
  else
    v21 = *(_QWORD *)(v13 + 64) + 1;
  v22 = (_QWORD *)(((unint64_t)v16 + v21 + 7) & 0xFFFFFFFFFFFFF8);
  v23 = (_QWORD *)(((unint64_t)v17 + v21 + 7) & 0xFFFFFFFFFFFFFFF8);
  *v22 = *v23;
  v24 = ((unint64_t)v22 + 15) & 0xFFFFFFFFFFFFFFF8;
  v25 = ((unint64_t)v23 + 15) & 0xFFFFFFFFFFFFFFF8;
  *(_BYTE *)v24 = *(_BYTE *)v25;
  *(_QWORD *)(v24 + 8) = *(_QWORD *)(v25 + 8);
  swift_retain();
  swift_release();
  v26 = (v24 + 23) & 0xFFFFFFFFFFFFFFF8;
  v27 = (v25 + 23) & 0xFFFFFFFFFFFFFFF8;
  v28 = *(_QWORD *)v27;
  v29 = *(_BYTE *)(v27 + 8);
  sub_22D8DFF8C(*(_QWORD *)v27, v29);
  v30 = *(_QWORD *)v26;
  v31 = *(_BYTE *)(v26 + 8);
  *(_QWORD *)v26 = v28;
  *(_BYTE *)(v26 + 8) = v29;
  sub_22D8DFF90(v30, v31);
  v32 = (v24 + 39) & 0xFFFFFFFFFFFFFFF8;
  v33 = (v25 + 39) & 0xFFFFFFFFFFFFFFF8;
  v34 = *(_QWORD *)v33;
  v35 = *(_BYTE *)(v33 + 8);
  sub_22D8DFF8C(*(_QWORD *)v33, v35);
  v36 = *(_QWORD *)v32;
  v37 = *(_BYTE *)(v32 + 8);
  *(_QWORD *)v32 = v34;
  *(_BYTE *)(v32 + 8) = v35;
  sub_22D8DFF90(v36, v37);
  v38 = sub_22D8E6CC8();
  v39 = *(_QWORD *)(v38 - 8);
  v40 = *(_DWORD *)(v39 + 80) & 0xF8;
  v41 = v40 + 16;
  v42 = v40 + 16 + v32;
  v43 = ~v40 & 0xFFFFFFFFFFFFFFF8;
  v44 = (_QWORD *)(v42 & v43);
  v45 = v41 + v33;
  v46 = (_QWORD *)(v45 & v43);
  if ((v42 & v43) != (v45 & v43))
  {
    v47 = v38;
    if (*(_QWORD *)(v39 + 64) <= 8uLL)
      v48 = 8;
    else
      v48 = *(_QWORD *)(v39 + 64);
    v49 = *((unsigned __int8 *)v44 + v48);
    if (v49 >= 2)
    {
      if (v48 <= 3)
        v50 = v48;
      else
        v50 = 4;
      __asm { BR              X12 }
    }
    if (v49 == 1)
      (*(void (**)(_QWORD *, uint64_t))(v39 + 8))(v44, v38);
    else
      swift_release();
    v51 = *((unsigned __int8 *)v46 + v48);
    if (v51 >= 2)
    {
      if (v48 <= 3)
        v52 = v48;
      else
        v52 = 4;
      __asm { BR              X12 }
    }
    if (v51 == 1)
    {
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v39 + 16))(v44, v46, v47);
      *((_BYTE *)v44 + v48) = 1;
    }
    else
    {
      *v44 = *v46;
      *((_BYTE *)v44 + v48) = 0;
      swift_retain();
    }
  }
  return a1;
}

uint64_t sub_22D8E20E8(uint64_t a1, uint64_t a2, uint64_t a3)
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
  uint64_t v15;
  void *v16;
  const void *v17;
  int v18;
  uint64_t v19;
  size_t v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  _OWORD *v24;
  _OWORD *v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  _QWORD *v37;
  _QWORD *v38;
  uint64_t v39;
  unsigned int v40;
  uint64_t v41;
  char v42;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  v6 = sub_22D8E6C8C();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(unsigned __int8 *)(v7 + 80);
  v9 = (v8 + 20 + a1) & ~v8;
  v10 = (v8 + 20 + a2) & ~v8;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32))(v9, v10, v6);
  v11 = *(_QWORD *)(v7 + 64);
  v12 = *(_QWORD *)(a3 + 16);
  v13 = *(_QWORD *)(v12 - 8);
  v14 = *(unsigned __int8 *)(v13 + 80);
  v15 = v11 + v14;
  v16 = (void *)((v15 + v9) & ~v14);
  v17 = (const void *)((v15 + v10) & ~v14);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v13 + 48))(v17, 1, v12))
  {
    v18 = *(_DWORD *)(v13 + 84);
    v19 = *(_QWORD *)(v13 + 64);
    if (v18)
      v20 = *(_QWORD *)(v13 + 64);
    else
      v20 = v19 + 1;
    memcpy(v16, v17, v20);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v13 + 32))(v16, v17, v12);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v16, 0, 1, v12);
    v18 = *(_DWORD *)(v13 + 84);
    v19 = *(_QWORD *)(v13 + 64);
  }
  if (v18)
    v21 = v19;
  else
    v21 = v19 + 1;
  v22 = (_QWORD *)(((unint64_t)v16 + v21 + 7) & 0xFFFFFFFFFFFFF8);
  v23 = (_QWORD *)(((unint64_t)v17 + v21 + 7) & 0xFFFFFFFFFFFFFFF8);
  *v22 = *v23;
  v24 = (_OWORD *)(((unint64_t)v22 + 15) & 0xFFFFFFFFFFFFFFF8);
  v25 = (_OWORD *)(((unint64_t)v23 + 15) & 0xFFFFFFFFFFFFFFF8);
  *v24 = *v25;
  v26 = ((unint64_t)v24 + 23) & 0xFFFFFFFFFFFFFFF8;
  v27 = ((unint64_t)v25 + 23) & 0xFFFFFFFFFFFFFFF8;
  v28 = *(_QWORD *)v27;
  *(_BYTE *)(v26 + 8) = *(_BYTE *)(v27 + 8);
  *(_QWORD *)v26 = v28;
  v29 = ((unint64_t)v25 + 39) & 0xFFFFFFFFFFFFFFF8;
  v30 = *(_QWORD *)v29;
  v31 = ((unint64_t)v24 + 39) & 0xFFFFFFFFFFFFFFF8;
  *(_BYTE *)(v31 + 8) = *(_BYTE *)(v29 + 8);
  *(_QWORD *)v31 = v30;
  v32 = *(_QWORD *)(sub_22D8E6CC8() - 8);
  v33 = *(_DWORD *)(v32 + 80) & 0xF8;
  v34 = v33 + 16;
  v35 = v33 + 16 + v31;
  v36 = ~v33 & 0xFFFFFFFFFFFFFFF8;
  v37 = (_QWORD *)(v35 & v36);
  v38 = (_QWORD *)((v34 + v29) & v36);
  if (*(_QWORD *)(v32 + 64) <= 8uLL)
    v39 = 8;
  else
    v39 = *(_QWORD *)(v32 + 64);
  v40 = *((unsigned __int8 *)v38 + v39);
  if (v40 >= 2)
  {
    if (v39 <= 3)
      v41 = v39;
    else
      v41 = 4;
    __asm { BR              X13 }
  }
  if (v40 == 1)
  {
    (*(void (**)(_QWORD *))(v32 + 32))(v37);
    v42 = 1;
  }
  else
  {
    v42 = 0;
    *v37 = *v38;
  }
  *((_BYTE *)v37 + v39) = v42;
  return a1;
}

uint64_t sub_22D8E2350(uint64_t a1, uint64_t a2, uint64_t a3)
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
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t (*v18)(void *, uint64_t, uint64_t);
  int v19;
  size_t v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  unint64_t v31;
  unint64_t v32;
  char v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  _QWORD *v42;
  uint64_t v43;
  _QWORD *v44;
  uint64_t v45;
  uint64_t v46;
  unsigned int v47;
  uint64_t v48;
  unsigned int v49;
  uint64_t v50;
  char v51;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_OWORD *)(a1 + 4) = *(_OWORD *)(a2 + 4);
  v6 = sub_22D8E6C8C();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(unsigned __int8 *)(v7 + 80);
  v9 = (v8 + 20 + a1) & ~v8;
  v10 = (v8 + 20 + a2) & ~v8;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 40))(v9, v10, v6);
  v11 = *(_QWORD *)(v7 + 64);
  v12 = *(_QWORD *)(a3 + 16);
  v13 = *(_QWORD *)(v12 - 8);
  v14 = *(unsigned __int8 *)(v13 + 80);
  v15 = v11 + v14;
  v16 = (void *)((v15 + v9) & ~v14);
  v17 = (void *)((v15 + v10) & ~v14);
  v18 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v13 + 48);
  LODWORD(v9) = v18(v16, 1, v12);
  v19 = v18(v17, 1, v12);
  if ((_DWORD)v9)
  {
    if (!v19)
    {
      (*(void (**)(void *, void *, uint64_t))(v13 + 32))(v16, v17, v12);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v16, 0, 1, v12);
      goto LABEL_10;
    }
  }
  else
  {
    if (!v19)
    {
      (*(void (**)(void *, void *, uint64_t))(v13 + 40))(v16, v17, v12);
      goto LABEL_10;
    }
    (*(void (**)(void *, uint64_t))(v13 + 8))(v16, v12);
  }
  if (*(_DWORD *)(v13 + 84))
    v20 = *(_QWORD *)(v13 + 64);
  else
    v20 = *(_QWORD *)(v13 + 64) + 1;
  memcpy(v16, v17, v20);
LABEL_10:
  if (*(_DWORD *)(v13 + 84))
    v21 = *(_QWORD *)(v13 + 64);
  else
    v21 = *(_QWORD *)(v13 + 64) + 1;
  v22 = (_QWORD *)(((unint64_t)v16 + v21 + 7) & 0xFFFFFFFFFFFFF8);
  v23 = (_QWORD *)(((unint64_t)v17 + v21 + 7) & 0xFFFFFFFFFFFFFFF8);
  *v22 = *v23;
  v24 = ((unint64_t)v22 + 15) & 0xFFFFFFFFFFFFFFF8;
  v25 = ((unint64_t)v23 + 15) & 0xFFFFFFFFFFFFFFF8;
  *(_BYTE *)v24 = *(_BYTE *)v25;
  *(_QWORD *)(v24 + 8) = *(_QWORD *)(v25 + 8);
  swift_release();
  v26 = (v24 + 23) & 0xFFFFFFFFFFFFFFF8;
  v27 = (v25 + 23) & 0xFFFFFFFFFFFFFFF8;
  v28 = *(_QWORD *)v27;
  LOBYTE(v27) = *(_BYTE *)(v27 + 8);
  v29 = *(_QWORD *)v26;
  v30 = *(_BYTE *)(v26 + 8);
  *(_QWORD *)v26 = v28;
  *(_BYTE *)(v26 + 8) = v27;
  sub_22D8DFF90(v29, v30);
  v31 = (v24 + 39) & 0xFFFFFFFFFFFFFFF8;
  v32 = (v25 + 39) & 0xFFFFFFFFFFFFFFF8;
  v33 = *(_BYTE *)(v32 + 8);
  v34 = *(_QWORD *)v31;
  v35 = *(_BYTE *)(v31 + 8);
  *(_QWORD *)v31 = *(_QWORD *)v32;
  *(_BYTE *)(v31 + 8) = v33;
  sub_22D8DFF90(v34, v35);
  v36 = sub_22D8E6CC8();
  v37 = *(_QWORD *)(v36 - 8);
  v38 = *(_DWORD *)(v37 + 80) & 0xF8;
  v39 = v38 + 16;
  v40 = v38 + 16 + v31;
  v41 = ~v38 & 0xFFFFFFFFFFFFFFF8;
  v42 = (_QWORD *)(v40 & v41);
  v43 = v39 + v32;
  v44 = (_QWORD *)(v43 & v41);
  if ((v40 & v41) != (v43 & v41))
  {
    v45 = v36;
    if (*(_QWORD *)(v37 + 64) <= 8uLL)
      v46 = 8;
    else
      v46 = *(_QWORD *)(v37 + 64);
    v47 = *((unsigned __int8 *)v42 + v46);
    if (v47 >= 2)
    {
      if (v46 <= 3)
        v48 = v46;
      else
        v48 = 4;
      __asm { BR              X12 }
    }
    if (v47 == 1)
      (*(void (**)(_QWORD *, uint64_t))(v37 + 8))(v42, v36);
    else
      swift_release();
    v49 = *((unsigned __int8 *)v44 + v46);
    if (v49 >= 2)
    {
      if (v46 <= 3)
        v50 = v46;
      else
        v50 = 4;
      __asm { BR              X12 }
    }
    if (v49 == 1)
    {
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v37 + 32))(v42, v44, v45);
      v51 = 1;
    }
    else
    {
      v51 = 0;
      *v42 = *v44;
    }
    *((_BYTE *)v42 + v46) = v51;
  }
  return a1;
}

uint64_t sub_22D8E26D0(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  int v25;
  unsigned int v26;
  int v27;
  int v28;
  uint64_t v29;
  uint64_t v31;
  unint64_t v32;
  unsigned int v33;
  int v34;

  v6 = sub_22D8E6C8C();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(unsigned int *)(v7 + 84);
  v9 = *(_QWORD *)(a3 + 16);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(unsigned int *)(v10 + 84);
  if ((_DWORD)v11)
    v12 = v11 - 1;
  else
    v12 = 0;
  if (v12 <= v8)
    v13 = *(_DWORD *)(v7 + 84);
  else
    v13 = v12;
  if (v13 <= 0x7FFFFFFE)
    v14 = 2147483646;
  else
    v14 = v13;
  v15 = *(_QWORD *)(sub_22D8E6CC8() - 8);
  if (*(_QWORD *)(v15 + 64) <= 8uLL)
    v16 = 8;
  else
    v16 = *(_QWORD *)(v15 + 64);
  v17 = *(_QWORD *)(v10 + 64);
  if (!(_DWORD)v11)
    ++v17;
  if (!a2)
    return 0;
  v18 = *(unsigned __int8 *)(v7 + 80);
  v19 = *(_QWORD *)(v7 + 64);
  v20 = v17 + 7;
  v21 = *(unsigned __int8 *)(v10 + 80);
  if (a2 > v14)
  {
    v22 = *(_DWORD *)(v15 + 80) & 0xF8 | 7;
    v23 = v16
        + ((v22
          + ((((((v20 + ((v19 + ((v18 + 20) & ~v18) + v21) & ~v21)) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)
            + 39) & 0xFFFFFFFFFFFFFFF8)
          + 9) & ~v22)
        + 1;
    v24 = 8 * v23;
    if (v23 > 3)
      goto LABEL_18;
    v26 = ((a2 - v14 + ~(-1 << v24)) >> v24) + 1;
    if (HIWORD(v26))
    {
      v25 = *(_DWORD *)(a1 + v23);
      if (!v25)
        goto LABEL_34;
      goto LABEL_25;
    }
    if (v26 > 0xFF)
    {
      v25 = *(unsigned __int16 *)(a1 + v23);
      if (!*(_WORD *)(a1 + v23))
        goto LABEL_34;
      goto LABEL_25;
    }
    if (v26 >= 2)
    {
LABEL_18:
      v25 = *(unsigned __int8 *)(a1 + v23);
      if (!*(_BYTE *)(a1 + v23))
        goto LABEL_34;
LABEL_25:
      v27 = (v25 - 1) << v24;
      if (v23 > 3)
        v27 = 0;
      if ((_DWORD)v23)
      {
        if (v23 <= 3)
          v28 = v23;
        else
          v28 = 4;
        __asm { BR              X11 }
      }
      v34 = v14 + v27;
      return (v34 + 1);
    }
  }
LABEL_34:
  v29 = (a1 + v18 + 20) & ~v18;
  if ((_DWORD)v8 == v14)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v29, v8, v6);
  v31 = (v29 + v19 + v21) & ~v21;
  if (v12 != v14)
  {
    v32 = *(_QWORD *)(((((v20 + v31) & 0xFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFF8) + 8);
    if (v32 >= 0xFFFFFFFF)
      LODWORD(v32) = -1;
    v34 = v32 - 1;
    if (v34 < 0)
      v34 = -1;
    return (v34 + 1);
  }
  if (v11 < 2)
    return 0;
  v33 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v31, v11, v9);
  if (v33 >= 2)
    return v33 - 1;
  else
    return 0;
}

void sub_22D8E2968(_BYTE *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  int v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  size_t v18;
  unsigned int v19;
  unsigned int v20;
  int v21;

  v7 = *(_QWORD *)(sub_22D8E6C8C() - 8);
  v8 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  v9 = *(_DWORD *)(v8 + 84);
  if (v9)
    v10 = v9 - 1;
  else
    v10 = 0;
  if (v10 <= *(_DWORD *)(v7 + 84))
    v11 = *(_DWORD *)(v7 + 84);
  else
    v11 = v10;
  if (v11 <= 0x7FFFFFFE)
    v12 = 2147483646;
  else
    v12 = v11;
  v13 = 0;
  v14 = *(_QWORD *)(sub_22D8E6CC8() - 8);
  if (*(_QWORD *)(v14 + 64) <= 8uLL)
    v15 = 8;
  else
    v15 = *(_QWORD *)(v14 + 64);
  v16 = *(_QWORD *)(v8 + 64);
  if (!v9)
    ++v16;
  v17 = *(_DWORD *)(v14 + 80) & 0xF8 | 7;
  v18 = v15
      + ((v17
        + ((((((v16
              + 7
              + ((*(_QWORD *)(v7 + 64)
                + ((*(unsigned __int8 *)(v7 + 80) + 20) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80))
                + *(unsigned __int8 *)(v8 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80))) & 0xFFFFFFFFFFFFFFF8)
            + 15) & 0xFFFFFFFFFFFFFFF8)
          + 39) & 0xFFFFFFFFFFFFFFF8)
        + 9) & ~v17)
      + 1;
  if (a3 > v12)
  {
    if (v18 > 3)
    {
      v13 = 1u;
      if (v12 >= a2)
LABEL_31:
        __asm { BR              X16 }
LABEL_24:
      v20 = ~v12 + a2;
      if (v18 < 4)
      {
        if ((_DWORD)v18)
        {
          v21 = v20 & ~(-1 << (8 * v18));
          bzero(a1, v18);
          if ((_DWORD)v18 == 3)
          {
            *(_WORD *)a1 = v21;
            a1[2] = BYTE2(v21);
          }
          else if ((_DWORD)v18 == 2)
          {
            *(_WORD *)a1 = v21;
          }
          else
          {
            *a1 = v21;
          }
        }
      }
      else
      {
        bzero(a1, v18);
        *(_DWORD *)a1 = v20;
      }
      __asm { BR              X10 }
    }
    v19 = ((a3 - v12 + ~(-1 << (8 * v18))) >> (8 * v18)) + 1;
    if (HIWORD(v19))
    {
      v13 = 4u;
      if (v12 >= a2)
        goto LABEL_31;
      goto LABEL_24;
    }
    if (v19 >= 0x100)
      v13 = 2;
    else
      v13 = v19 > 1;
  }
  if (v12 >= a2)
    goto LABEL_31;
  goto LABEL_24;
}

void sub_22D8E2C40()
{
  char v0;
  uint64_t v1;
  uint64_t v2;

  *(_BYTE *)(v1 + v2) = v0;
  JUMPOUT(0x22D8E2C64);
}

void sub_22D8E2C48()
{
  __int16 v0;
  uint64_t v1;
  uint64_t v2;

  *(_WORD *)(v1 + v2) = v0;
  JUMPOUT(0x22D8E2C64);
}

void sub_22D8E2C50()
{
  int v0;
  uint64_t v1;
  uint64_t v2;

  *(_DWORD *)(v1 + v2) = v0;
  JUMPOUT(0x22D8E2C64);
}

void sub_22D8E2C88()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_255DA0BA0)
  {
    sub_22D8E6CC8();
    v0 = sub_22D8E6CD4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_255DA0BA0);
  }
}

uint64_t sub_22D8E2CDC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  uint64_t v6;
  _QWORD v8[2];
  _QWORD v9[2];
  uint64_t v10;

  v1 = *(_QWORD *)(a1 + 8);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255DA0AE8);
  v2 = sub_22D8E7124();
  v3 = sub_22D8E6E30();
  v10 = v1;
  v9[0] = sub_22D8E0454();
  v9[1] = MEMORY[0x22E31B14C](MEMORY[0x24BDF5578], v2, &v10);
  MEMORY[0x22E31B14C](MEMORY[0x24BDEF3E0], v3, v9);
  v4 = sub_22D8E6FA4();
  sub_22D8E6CEC();
  v5 = (uint64_t (*)(uint64_t))MEMORY[0x24BDEC4E0];
  v6 = sub_22D8E6D10();
  v8[0] = MEMORY[0x22E31B14C](MEMORY[0x24BDF4700], v4);
  v8[1] = sub_22D8E3284(qword_255D9FF50, v5, MEMORY[0x24BDEC4C8]);
  return MEMORY[0x22E31B14C](MEMORY[0x24BDED308], v6, v8);
}

_QWORD *sub_22D8E2DF0(uint64_t a1, uint64_t *a2, int *a3)
{
  _QWORD *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v4 = (_QWORD *)a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v12 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_DWORD *)(a1 + 16) = *((_DWORD *)a2 + 4);
    v7 = a3[5];
    v8 = a1 + v7;
    v9 = (uint64_t)a2 + v7;
    v10 = sub_22D8E6C8C();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
    v11 = a3[7];
    *(_QWORD *)((char *)v4 + a3[6]) = *(uint64_t *)((char *)a2 + a3[6]);
    *(_QWORD *)((char *)v4 + v11) = *(uint64_t *)((char *)a2 + v11);
  }
  return v4;
}

uint64_t sub_22D8E2EA4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = a1 + *(int *)(a2 + 20);
  v3 = sub_22D8E6C8C();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

uint64_t sub_22D8E2EDC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  v6 = a3[5];
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = sub_22D8E6C8C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v7, v8, v9);
  v10 = a3[7];
  *(_QWORD *)(a1 + a3[6]) = *(_QWORD *)(a2 + a3[6]);
  *(_QWORD *)(a1 + v10) = *(_QWORD *)(a2 + v10);
  return a1;
}

uint64_t sub_22D8E2F64(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_WORD *)(a1 + 4) = *(_WORD *)(a2 + 4);
  *(_WORD *)(a1 + 6) = *(_WORD *)(a2 + 6);
  *(_WORD *)(a1 + 8) = *(_WORD *)(a2 + 8);
  *(_WORD *)(a1 + 10) = *(_WORD *)(a2 + 10);
  *(_WORD *)(a1 + 12) = *(_WORD *)(a2 + 12);
  *(_WORD *)(a1 + 14) = *(_WORD *)(a2 + 14);
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  *(_WORD *)(a1 + 18) = *(_WORD *)(a2 + 18);
  v6 = a3[5];
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = sub_22D8E6C8C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  *(_QWORD *)(a1 + a3[6]) = *(_QWORD *)(a2 + a3[6]);
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  return a1;
}

uint64_t sub_22D8E3028(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  v6 = a3[5];
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = sub_22D8E6C8C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  v10 = a3[7];
  *(_QWORD *)(a1 + a3[6]) = *(_QWORD *)(a2 + a3[6]);
  *(_QWORD *)(a1 + v10) = *(_QWORD *)(a2 + v10);
  return a1;
}

uint64_t sub_22D8E30B0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_OWORD *)(a1 + 4) = *(_OWORD *)(a2 + 4);
  v6 = a3[5];
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = sub_22D8E6C8C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 40))(v7, v8, v9);
  v10 = a3[7];
  *(_QWORD *)(a1 + a3[6]) = *(_QWORD *)(a2 + a3[6]);
  *(_QWORD *)(a1 + v10) = *(_QWORD *)(a2 + v10);
  return a1;
}

uint64_t sub_22D8E3138()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_22D8E3144(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;

  v4 = a1 + *(int *)(a3 + 20);
  v5 = sub_22D8E6C8C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 48))(v4, a2, v5);
}

uint64_t sub_22D8E3184()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_22D8E3190(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;

  v5 = a1 + *(int *)(a4 + 20);
  v6 = sub_22D8E6C8C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, a2, a2, v6);
}

uint64_t sub_22D8E31D4()
{
  uint64_t result;
  unint64_t v1;

  result = sub_22D8E6C8C();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_22D8E3258()
{
  return sub_22D8E3284(&qword_255DA0AF8, (uint64_t (*)(uint64_t))type metadata accessor for PayLaterViewWrapper, (uint64_t)&unk_22D8E90C4);
}

uint64_t sub_22D8E3284(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x22E31B14C](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_22D8E32C4()
{
  unint64_t result;

  result = qword_255DA0C48;
  if (!qword_255DA0C48)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_255DA0C48);
  }
  return result;
}

unint64_t sub_22D8E3300()
{
  unint64_t result;

  result = qword_255DA0C50;
  if (!qword_255DA0C50)
  {
    result = MEMORY[0x22E31B14C](&unk_22D8E9274, &type metadata for PayLaterViewDisplayStyleKey);
    atomic_store(result, (unint64_t *)&qword_255DA0C50);
  }
  return result;
}

unint64_t sub_22D8E3344()
{
  unint64_t result;

  result = qword_255DA0C58;
  if (!qword_255DA0C58)
  {
    result = MEMORY[0x22E31B14C](&unk_22D8E923C, &type metadata for PayLaterViewActionKey);
    atomic_store(result, &qword_255DA0C58);
  }
  return result;
}

uint64_t sub_22D8E3388(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DA0AE8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_22D8E33C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for PayLaterViewWrapper();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_22D8E340C(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for PayLaterViewWrapper();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_22D8E3448(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

void static PayLaterViewAction.learnMore.getter(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

void static PayLaterViewAction.calculator.getter(_QWORD *a1@<X8>)
{
  *a1 = 1;
}

BOOL static PayLaterViewAction.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

BOOL sub_22D8E34B4(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

void static PayLaterViewDisplayStyle.checkout.getter(_QWORD *a1@<X8>)
{
  *a1 = 2;
}

void static PayLaterViewDisplayStyle.price.getter(_QWORD *a1@<X8>)
{
  *a1 = 3;
}

uint64_t View.payLaterViewAction(_:)()
{
  return sub_22D8E352C();
}

uint64_t sub_22D8E34EC()
{
  sub_22D8E3344();
  return sub_22D8E6D64();
}

uint64_t View.payLaterViewDisplayStyle(_:)()
{
  return sub_22D8E352C();
}

uint64_t sub_22D8E352C()
{
  swift_getKeyPath();
  sub_22D8E6ED8();
  return swift_release();
}

uint64_t sub_22D8E3598()
{
  sub_22D8E3300();
  return sub_22D8E6D64();
}

void sub_22D8E35CC(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

uint64_t sub_22D8E35D4()
{
  sub_22D8E3730();
  return sub_22D8E6D04();
}

uint64_t sub_22D8E3624()
{
  sub_22D8E36EC();
  return sub_22D8E6D04();
}

ValueMetadata *type metadata accessor for PayLaterViewAction()
{
  return &type metadata for PayLaterViewAction;
}

ValueMetadata *type metadata accessor for PayLaterViewDisplayStyle()
{
  return &type metadata for PayLaterViewDisplayStyle;
}

uint64_t sub_22D8E36A4(uint64_t a1)
{
  return get_witness_table_7SwiftUI4ViewRzlAA15ModifiedContentVyxAA30_EnvironmentKeyWritingModifierVySaySo35PKPaymentRequestPaymentMethodUpdateCSo0jM0CYacGGGAaBHPxAaBHD1__AlA0cI0HPyHCHCTm(a1, &qword_255DA0C68, &qword_255DA0C70);
}

uint64_t sub_22D8E36B8(uint64_t a1)
{
  return get_witness_table_7SwiftUI4ViewRzlAA15ModifiedContentVyxAA30_EnvironmentKeyWritingModifierVySaySo35PKPaymentRequestPaymentMethodUpdateCSo0jM0CYacGGGAaBHPxAaBHD1__AlA0cI0HPyHCHCTm(a1, &qword_255DA0C78, &qword_255DA0C80);
}

ValueMetadata *type metadata accessor for PayLaterViewActionKey()
{
  return &type metadata for PayLaterViewActionKey;
}

ValueMetadata *type metadata accessor for PayLaterViewDisplayStyleKey()
{
  return &type metadata for PayLaterViewDisplayStyleKey;
}

unint64_t sub_22D8E36EC()
{
  unint64_t result;

  result = qword_255DA0C88;
  if (!qword_255DA0C88)
  {
    result = MEMORY[0x22E31B14C](&protocol conformance descriptor for PayLaterViewDisplayStyle, &type metadata for PayLaterViewDisplayStyle);
    atomic_store(result, (unint64_t *)&qword_255DA0C88);
  }
  return result;
}

unint64_t sub_22D8E3730()
{
  unint64_t result;

  result = qword_255DA0C90;
  if (!qword_255DA0C90)
  {
    result = MEMORY[0x22E31B14C](&protocol conformance descriptor for PayLaterViewAction, &type metadata for PayLaterViewAction);
    atomic_store(result, (unint64_t *)&qword_255DA0C90);
  }
  return result;
}

id sub_22D8E3784(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  _QWORD v33[7];
  _OWORD v34[3];
  uint64_t v35;

  v26 = a4;
  v28 = a2;
  v27 = a1;
  v9 = *(_QWORD *)(a6 - 8);
  v10 = *(_QWORD *)(v9 + 64);
  MEMORY[0x24BDAC7A8](a1);
  v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v13, v12);
  v14 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v15 = (v10 + v14 + 7) & 0xFFFFFFFFFFFFFFF8;
  v16 = swift_allocObject();
  v17 = *(_QWORD *)(a6 + 16);
  v18 = *(_QWORD *)(a6 + 24);
  *(_QWORD *)(v16 + 16) = v17;
  *(_QWORD *)(v16 + 24) = v18;
  (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v16 + v14, v11, a6);
  v19 = (_QWORD *)(v16 + v15);
  *v19 = v26;
  v19[1] = a5;
  v20 = v27;
  swift_retain();
  swift_retain();
  sub_22D8E3ED4(v20, v28, a3, (uint64_t)sub_22D8CC634, v16, v17, v18, v33);
  v22 = _s35AddPaymentPassViewControllerWrapperVMa(255, v17, v18, v21);
  v23 = sub_22D8E7124();
  (*(void (**)(_OWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v23 - 8) + 32))(v34, v33, v23);
  if (*(_QWORD *)&v34[0])
  {
    v29 = v34[0];
    v30 = v34[1];
    v31 = v34[2];
    v32 = v35;
    MEMORY[0x22E31B14C](&unk_22D8E9400, v22);
    return (id)sub_22D8E6FC8();
  }
  else
  {
    if (qword_255D9FD28 != -1)
      swift_once();
    return (id)qword_255DA2888;
  }
}

void sub_22D8E3994()
{
  id v0;
  void *v1;
  id v2;

  sub_22D8E7040();
  v0 = objc_allocWithZone(MEMORY[0x24BDD1540]);
  v1 = (void *)sub_22D8E701C();
  swift_bridgeObjectRelease();
  v2 = objc_msgSend(v0, sel_initWithDomain_code_userInfo_, v1, 2, 0);

  qword_255DA2888 = (uint64_t)v2;
}

uint64_t AddPassToWalletButton.init(_:onRequest:onCompletion:fallback:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, void (*a6)(uint64_t)@<X5>, uint64_t a7@<X7>, _OWORD *a8@<X8>, uint64_t a9)
{
  uint64_t v17;
  uint64_t v18;
  char *v19;
  id v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;

  v24 = a9;
  v17 = sub_22D8E7124();
  MEMORY[0x24BDAC7A8](v17);
  v19 = (char *)&v23 - v18;
  *(_QWORD *)&v25 = a1;
  *((_QWORD *)&v25 + 1) = a2;
  v26 = a3;
  v27 = a4;
  v28 = a5;
  v29 = 3;
  v20 = a1;
  swift_retain();
  v21 = swift_retain();
  a6(v21);

  swift_release();
  swift_release();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(a7 - 8) + 56))(v19, 0, 1, a7);
  return sub_22D8CFBF8(&v25, (uint64_t)v19, a7, v24, a8);
}

uint64_t AddPassToWalletButtonResponse.certificates.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t AddPassToWalletButtonResponse.certificates.setter(uint64_t a1)
{
  _QWORD *v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v1 = a1;
  return result;
}

uint64_t (*AddPassToWalletButtonResponse.certificates.modify())()
{
  return nullsub_1;
}

uint64_t AddPassToWalletButtonResponse.nonce.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 8);
  sub_22D8E3BAC(v1, *(_QWORD *)(v0 + 16));
  return v1;
}

uint64_t sub_22D8E3BAC(uint64_t a1, unint64_t a2)
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

uint64_t AddPassToWalletButtonResponse.nonce.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = sub_22D8E3C24(*(_QWORD *)(v2 + 8), *(_QWORD *)(v2 + 16));
  *(_QWORD *)(v2 + 8) = a1;
  *(_QWORD *)(v2 + 16) = a2;
  return result;
}

uint64_t sub_22D8E3C24(uint64_t a1, unint64_t a2)
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

uint64_t (*AddPassToWalletButtonResponse.nonce.modify())()
{
  return nullsub_1;
}

uint64_t AddPassToWalletButtonResponse.nonceSignature.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 24);
  sub_22D8E3BAC(v1, *(_QWORD *)(v0 + 32));
  return v1;
}

uint64_t AddPassToWalletButtonResponse.nonceSignature.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = sub_22D8E3C24(*(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32));
  *(_QWORD *)(v2 + 24) = a1;
  *(_QWORD *)(v2 + 32) = a2;
  return result;
}

uint64_t (*AddPassToWalletButtonResponse.nonceSignature.modify())()
{
  return nullsub_1;
}

uint64_t AddPassToWalletButton<>.init(_:onRequest:onCompletion:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  *(_QWORD *)a6 = result;
  *(_QWORD *)(a6 + 8) = a2;
  *(_QWORD *)(a6 + 16) = a3;
  *(_QWORD *)(a6 + 24) = a4;
  *(_QWORD *)(a6 + 32) = a5;
  *(_WORD *)(a6 + 40) = 259;
  return result;
}

uint64_t destroy for AddPassToWalletButtonResponse(uint64_t a1)
{
  swift_bridgeObjectRelease();
  sub_22D8E3C24(*(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16));
  return sub_22D8E3C24(*(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32));
}

_QWORD *initializeWithCopy for AddPassToWalletButtonResponse(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;

  v4 = a2[1];
  *a1 = *a2;
  v5 = a2[2];
  swift_bridgeObjectRetain();
  sub_22D8E3BAC(v4, v5);
  a1[1] = v4;
  a1[2] = v5;
  v7 = a2[3];
  v6 = a2[4];
  sub_22D8E3BAC(v7, v6);
  a1[3] = v7;
  a1[4] = v6;
  return a1;
}

_QWORD *assignWithCopy for AddPassToWalletButtonResponse(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;

  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = a2[1];
  v5 = a2[2];
  sub_22D8E3BAC(v4, v5);
  v6 = a1[1];
  v7 = a1[2];
  a1[1] = v4;
  a1[2] = v5;
  sub_22D8E3C24(v6, v7);
  v9 = a2[3];
  v8 = a2[4];
  sub_22D8E3BAC(v9, v8);
  v10 = a1[3];
  v11 = a1[4];
  a1[3] = v9;
  a1[4] = v8;
  sub_22D8E3C24(v10, v11);
  return a1;
}

_QWORD *assignWithTake for AddPassToWalletButtonResponse(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;

  *a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  v4 = a1[1];
  v5 = a1[2];
  *(_OWORD *)(a1 + 1) = *(_OWORD *)(a2 + 8);
  sub_22D8E3C24(v4, v5);
  v6 = a1[3];
  v7 = a1[4];
  *(_OWORD *)(a1 + 3) = *(_OWORD *)(a2 + 24);
  sub_22D8E3C24(v6, v7);
  return a1;
}

ValueMetadata *type metadata accessor for AddPassToWalletButtonResponse()
{
  return &type metadata for AddPassToWalletButtonResponse;
}

uint64_t sub_22D8E3E78()
{
  return swift_initClassMetadata2();
}

id sub_22D8E3ED4@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, _QWORD *a8@<X8>)
{
  uint64_t v9;
  id v14;
  id v15;
  id result;

  v9 = a4;
  _s35AddPaymentPassViewControllerWrapperV11CoordinatorCMa(0, a6, a7, a4);
  v14 = a1;
  swift_retain();
  swift_retain();
  v15 = sub_22D8E4848(v14, a2, a3, v9, a5);

  swift_release();
  swift_release();
  result = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE6FA78]), sel_initWithRequestConfiguration_delegate_, v14, v15);
  if (!result)
  {

    swift_release();
    swift_release();
    v14 = 0;
    a2 = 0;
    a3 = 0;
    v9 = 0;
    a5 = 0;
    result = 0;
    v15 = 0;
  }
  *a8 = v14;
  a8[1] = a2;
  a8[2] = a3;
  a8[3] = v9;
  a8[4] = a5;
  a8[5] = result;
  a8[6] = v15;
  return result;
}

uint64_t sub_22D8E3FE4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;

  v3 = (_QWORD *)(v2 + qword_255DA0CB0);
  v4 = *(_QWORD *)(v2 + qword_255DA0CB0);
  *v3 = a1;
  v3[1] = a2;
  return sub_22D8CC6BC(v4);
}

uint64_t sub_22D8E4004(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;

  v7[9] = a6;
  v7[10] = a7;
  v7[7] = a4;
  v7[8] = a5;
  return swift_task_switch();
}

uint64_t sub_22D8E4020()
{
  uint64_t v0;
  uint64_t v1;
  int *v2;
  uint64_t v3;
  __int128 v4;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t);

  v1 = *(_QWORD *)(v0 + 64);
  v2 = *(int **)(*(_QWORD *)(v0 + 56) + qword_255DA0CA8);
  v3 = *(_QWORD *)(v1 + 32);
  v4 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)(v0 + 16) = *(_OWORD *)v1;
  *(_OWORD *)(v0 + 32) = v4;
  *(_QWORD *)(v0 + 48) = v3;
  v7 = (uint64_t (*)(uint64_t))((char *)v2 + *v2);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 88) = v5;
  *v5 = v0;
  v5[1] = sub_22D8E40A0;
  return v7(v0 + 16);
}

uint64_t sub_22D8E40A0(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 96) = a1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_22D8E40FC()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 96);
  (*(void (**)(void *))(v0 + 72))(v1);

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_22D8E4138(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_22D8E70C4();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_22D8E70B8();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_22D8DAB7C(a1);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_22D8E7088();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_22D8E427C(void *a1, int a2, void *a3, int a4, void *a5, void *a6, void *aBlock)
{
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;

  v11 = _Block_copy(aBlock);
  v12 = sub_22D8E7070();
  v13 = a3;
  v14 = a5;
  v15 = a6;
  v16 = a1;
  v17 = sub_22D8E6C80();
  v19 = v18;

  v20 = sub_22D8E6C80();
  v22 = v21;

  v23 = swift_allocObject();
  *(_QWORD *)(v23 + 16) = v11;
  sub_22D8E48C0(v12, v17, v19, v20, v22, (uint64_t)sub_22D8DB770, v23);
  swift_release();
  sub_22D8E3C24(v20, v22);
  sub_22D8E3C24(v17, v19);

  return swift_bridgeObjectRelease();
}

void sub_22D8E439C(void *a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a3;
  v9 = a4;
  v10 = a1;
  v11 = a5;
  sub_22D8E49E4(a4, a5);

}

void sub_22D8E4418()
{
  sub_22D8E4AF4();
}

id sub_22D8E4434(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  objc_class *v5;
  objc_super v7;

  v5 = (objc_class *)_s35AddPaymentPassViewControllerWrapperV11CoordinatorCMa(0, *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v4) + 0x50), *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v4) + 0x58), a4);
  v7.receiver = v4;
  v7.super_class = v5;
  return objc_msgSendSuper2(&v7, sel_dealloc);
}

uint64_t sub_22D8E4480(uint64_t a1)
{

  swift_release();
  return sub_22D8CC6BC(*(_QWORD *)(a1 + qword_255DA0CB0));
}

uint64_t _s35AddPaymentPassViewControllerWrapperV11CoordinatorCMa(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&_s35AddPaymentPassViewControllerWrapperV11CoordinatorCMn);
}

uint64_t sub_22D8E44DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5 = *(_QWORD *)(v4 + 16);
  v6 = type metadata accessor for AddPassToWalletButton_iOS(0, v5, *(_QWORD *)(v4 + 24), a4);
  v7 = v4
     + ((*(unsigned __int8 *)(*(_QWORD *)(v6 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v6 - 8) + 80));
  sub_22D8CC5B0(*(void **)v7, *(_QWORD *)(v7 + 8), *(_QWORD *)(v7 + 16), *(_QWORD *)(v7 + 24), *(_QWORD *)(v7 + 32), *(_BYTE *)(v7 + 40));
  v8 = v7 + *(int *)(v6 + 36);
  v9 = *(_QWORD *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v8, 1, v5))
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v5);
  sub_22D8CC628(*(_QWORD *)(v7 + *(int *)(v6 + 40)), *(_BYTE *)(v7 + *(int *)(v6 + 40) + 8));
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t _s35AddPaymentPassViewControllerWrapperVMa(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&_s35AddPaymentPassViewControllerWrapperVMn);
}

id sub_22D8E4614()
{
  return (id)sub_22D8E48B8();
}

id sub_22D8E4658@<X0>(_QWORD *a1@<X8>)
{
  void *v2;

  v2 = (void *)sub_22D8E48B0();
  *a1 = v2;
  return v2;
}

uint64_t sub_22D8E46A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x22E31B14C](&unk_22D8E9388, a3);
  return sub_22D8E6E9C();
}

uint64_t sub_22D8E46FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x22E31B14C](&unk_22D8E9388, a3);
  return sub_22D8E6E6C();
}

void sub_22D8E4758(uint64_t a1)
{
  MEMORY[0x22E31B14C](&unk_22D8E9388, a1);
  sub_22D8E6E90();
  __break(1u);
}

id sub_22D8E4788(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t *v7;
  _QWORD *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  objc_class *v12;
  objc_super v14;

  v6 = *MEMORY[0x24BEE4EA0] & *v5;
  v7 = (_QWORD *)((char *)v5 + qword_255DA0CB0);
  *v7 = 0;
  v7[1] = 0;
  *(_QWORD *)((char *)v5 + qword_255DA0CA0) = a1;
  v8 = (_QWORD *)((char *)v5 + qword_255DA0CA8);
  *v8 = a2;
  v8[1] = a3;
  v9 = *v7;
  *v7 = a4;
  v7[1] = a5;
  v10 = a1;
  swift_retain();
  swift_retain();
  sub_22D8CC6BC(v9);
  v12 = (objc_class *)_s35AddPaymentPassViewControllerWrapperV11CoordinatorCMa(0, *(_QWORD *)(v6 + 80), *(_QWORD *)(v6 + 88), v11);
  v14.receiver = v5;
  v14.super_class = v12;
  return objc_msgSendSuper2(&v14, sel_init);
}

id sub_22D8E4848(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  id v11;

  v11 = objc_allocWithZone((Class)_s35AddPaymentPassViewControllerWrapperV11CoordinatorCMa(0, *(_QWORD *)(v5 + 80), *(_QWORD *)(v5 + 88), a4));
  return sub_22D8E4788(a1, a2, a3, a4, a5);
}

uint64_t sub_22D8E48B0()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 48);
}

uint64_t sub_22D8E48B8()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 40);
}

uint64_t sub_22D8E48C0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6, uint64_t a7)
{
  void *v7;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  _QWORD *v19;
  id v20;
  uint64_t v22;

  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DA05D8);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v22 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_22D8E70C4();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v17, 1, 1, v18);
  v19 = (_QWORD *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = v7;
  v19[5] = a1;
  v19[6] = a2;
  v19[7] = a3;
  v19[8] = a4;
  v19[9] = a5;
  v19[10] = a6;
  v19[11] = a7;
  swift_bridgeObjectRetain();
  sub_22D8E3BAC(a2, a3);
  sub_22D8E3BAC(a4, a5);
  v20 = v7;
  swift_retain();
  sub_22D8E4138((uint64_t)v17, (uint64_t)&unk_255DA0DA8, (uint64_t)v19);
  return swift_release();
}

uint64_t sub_22D8E49E4(void *a1, void *a2)
{
  uint64_t v2;
  void (*v3)(void *, uint64_t);
  id v5;
  id v7;
  uint64_t v8;
  id v9;
  _QWORD *v10;
  uint64_t v11;

  v3 = *(void (**)(void *, uint64_t))(v2 + qword_255DA0CB0);
  if (v3)
  {
    if (a1)
    {
      sub_22D8DCE80((uint64_t)v3);
      v5 = a1;
      v3(a1, 0);
      sub_22D8CC6BC((uint64_t)v3);

    }
    else
    {
      if (a2)
      {
        swift_retain();
        v7 = a2;
      }
      else
      {
        v8 = qword_255D9FD28;
        swift_retain();
        if (v8 != -1)
          swift_once();
        v7 = (id)qword_255DA2888;
      }
      v9 = a2;
      v3(v7, 1);
      sub_22D8CC6BC((uint64_t)v3);

    }
  }
  v10 = (_QWORD *)(v2 + qword_255DA0CB0);
  v11 = *(_QWORD *)(v2 + qword_255DA0CB0);
  *v10 = 0;
  v10[1] = 0;
  return sub_22D8CC6BC(v11);
}

void sub_22D8E4AF4()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_22D8E4B20()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_22D8E4B44()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  sub_22D8E3C24(*(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 56));
  sub_22D8E3C24(*(_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 72));
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_22D8E4B90()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  __int128 v4;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = swift_task_alloc();
  v4 = *(_OWORD *)(v0 + 80);
  *(_QWORD *)(v1 + 16) = v3;
  *(_QWORD *)v3 = v1;
  *(_QWORD *)(v3 + 8) = sub_22D8CE0A0;
  *(_OWORD *)(v3 + 72) = v4;
  *(_QWORD *)(v3 + 56) = v2;
  *(_QWORD *)(v3 + 64) = v0 + 40;
  return swift_task_switch();
}

uint64_t sub_22D8E4C04()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_22D8E4C28(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_22D8CE0A0;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_255DA0DB0 + dword_255DA0DB0))(a1, v4);
}

void sub_22D8E4C98(id *a1)
{

  swift_release();
  swift_release();

}

uint64_t sub_22D8E4CD8(uint64_t a1, __int128 *a2)
{
  __int128 v3;
  __int128 v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;

  v3 = *a2;
  v4 = a2[1];
  *(_OWORD *)a1 = *a2;
  *(_OWORD *)(a1 + 16) = v4;
  v5 = (void *)*((_QWORD *)a2 + 5);
  *(_QWORD *)(a1 + 32) = *((_QWORD *)a2 + 4);
  *(_QWORD *)(a1 + 40) = v5;
  v6 = (void *)*((_QWORD *)a2 + 6);
  *(_QWORD *)(a1 + 48) = v6;
  v7 = (id)v3;
  swift_retain();
  swift_retain();
  v8 = v5;
  v9 = v6;
  return a1;
}

uint64_t sub_22D8E4D48(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  v7 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v7;
  swift_retain();
  swift_release();
  v8 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v8;
  swift_retain();
  swift_release();
  v9 = *(void **)(a2 + 40);
  v10 = *(void **)(a1 + 40);
  *(_QWORD *)(a1 + 40) = v9;
  v11 = v9;

  v12 = *(void **)(a2 + 48);
  v13 = *(void **)(a1 + 48);
  *(_QWORD *)(a1 + 48) = v12;
  v14 = v12;

  return a1;
}

__n128 __swift_memcpy56_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t sub_22D8E4DFC(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_release();
  v4 = *(void **)(a1 + 40);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);

  v5 = *(void **)(a1 + 48);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);

  return a1;
}

uint64_t sub_22D8E4E68(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 56))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t sub_22D8E4EB0(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 56) = 1;
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
    *(_BYTE *)(result + 56) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

void sub_22D8E4EFC()
{
  JUMPOUT(0x22E31B14CLL);
}

void static PayWithApplePayButtonLabel.plain.getter(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

void static PayWithApplePayButtonLabel.buy.getter(_QWORD *a1@<X8>)
{
  *a1 = 1;
}

void static PayWithApplePayButtonLabel.addMoney.getter(_QWORD *a1@<X8>)
{
  *a1 = 9;
}

void static PayWithApplePayButtonLabel.book.getter(_QWORD *a1@<X8>)
{
  *a1 = 6;
}

void static PayWithApplePayButtonLabel.checkout.getter(_QWORD *a1@<X8>)
{
  *a1 = 5;
}

void static PayWithApplePayButtonLabel.continue.getter(_QWORD *a1@<X8>)
{
  *a1 = 16;
}

void static PayWithApplePayButtonLabel.contribute.getter(_QWORD *a1@<X8>)
{
  *a1 = 14;
}

void static PayWithApplePayButtonLabel.donate.getter(_QWORD *a1@<X8>)
{
  *a1 = 4;
}

void static PayWithApplePayButtonLabel.inStore.getter(_QWORD *a1@<X8>)
{
  *a1 = 3;
}

void static PayWithApplePayButtonLabel.order.getter(_QWORD *a1@<X8>)
{
  *a1 = 11;
}

void static PayWithApplePayButtonLabel.reload.getter(_QWORD *a1@<X8>)
{
  *a1 = 8;
}

void static PayWithApplePayButtonLabel.rent.getter(_QWORD *a1@<X8>)
{
  *a1 = 12;
}

void static PayWithApplePayButtonLabel.setUp.getter(_QWORD *a1@<X8>)
{
  *a1 = 2;
}

void static PayWithApplePayButtonLabel.subscribe.getter(_QWORD *a1@<X8>)
{
  *a1 = 7;
}

void static PayWithApplePayButtonLabel.support.getter(_QWORD *a1@<X8>)
{
  *a1 = 13;
}

void static PayWithApplePayButtonLabel.tip.getter(_QWORD *a1@<X8>)
{
  *a1 = 15;
}

void static PayWithApplePayButtonLabel.topUp.getter(_QWORD *a1@<X8>)
{
  *a1 = 10;
}

uint64_t View.payWithApplePayButtonStyle(_:)()
{
  swift_getKeyPath();
  sub_22D8E6ED8();
  return swift_release();
}

uint64_t sub_22D8E5048()
{
  sub_22D8E5270();
  return sub_22D8E6D64();
}

uint64_t sub_22D8E507C@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  sub_22D8E5270();
  result = sub_22D8E6D64();
  *a1 = v3;
  return result;
}

uint64_t sub_22D8E50C8@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  sub_22D8E5270();
  result = sub_22D8E6D64();
  *a1 = v3;
  return result;
}

uint64_t sub_22D8E5114()
{
  sub_22D8E5270();
  return sub_22D8E6D70();
}

uint64_t sub_22D8E515C()
{
  sub_22D8E5270();
  return sub_22D8E6D70();
}

ValueMetadata *type metadata accessor for PayWithApplePayButtonLabel()
{
  return &type metadata for PayWithApplePayButtonLabel;
}

ValueMetadata *type metadata accessor for PayWithApplePayButtonStyle()
{
  return &type metadata for PayWithApplePayButtonStyle;
}

uint64_t sub_22D8E51C4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD v4[2];

  v1 = *(_QWORD *)(a1 + 8);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255DA0E40);
  v2 = sub_22D8E6D10();
  v4[0] = v1;
  v4[1] = sub_22D8E5224();
  return MEMORY[0x22E31B14C](MEMORY[0x24BDED308], v2, v4);
}

unint64_t sub_22D8E5224()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255DA0E48;
  if (!qword_255DA0E48)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255DA0E40);
    result = MEMORY[0x22E31B14C](MEMORY[0x24BDF1028], v1);
    atomic_store(result, (unint64_t *)&qword_255DA0E48);
  }
  return result;
}

unint64_t sub_22D8E5270()
{
  unint64_t result;

  result = qword_255DA0E50;
  if (!qword_255DA0E50)
  {
    result = MEMORY[0x22E31B14C](&unk_22D8E94E0, &type metadata for PayWithApplePayButtonStyleKey);
    atomic_store(result, (unint64_t *)&qword_255DA0E50);
  }
  return result;
}

ValueMetadata *type metadata accessor for PayWithApplePayButtonStyleKey()
{
  return &type metadata for PayWithApplePayButtonStyleKey;
}

void sub_22D8E52C4(_QWORD *a1@<X8>)
{
  *a1 = 3;
}

void static VerifyIdentityWithWalletButtonLabel.verifyIdentity.getter(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

void static VerifyIdentityWithWalletButtonLabel.continue.getter(_QWORD *a1@<X8>)
{
  *a1 = 3;
}

void static VerifyIdentityWithWalletButtonLabel.verify.getter(_QWORD *a1@<X8>)
{
  *a1 = 1;
}

void static VerifyIdentityWithWalletButtonLabel.verifyAge.getter(_QWORD *a1@<X8>)
{
  *a1 = 2;
}

uint64_t static VerifyIdentityWithWalletButtonStyle.blackOutline.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;

  result = swift_beginAccess();
  *a1 = qword_255DA0E58;
  return result;
}

uint64_t static VerifyIdentityWithWalletButtonStyle.blackOutline.setter(uint64_t *a1)
{
  uint64_t v1;
  uint64_t result;

  v1 = *a1;
  result = swift_beginAccess();
  qword_255DA0E58 = v1;
  return result;
}

uint64_t (*static VerifyIdentityWithWalletButtonStyle.blackOutline.modify())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t View.verifyIdentityWithWalletButtonStyle(_:)()
{
  swift_getKeyPath();
  sub_22D8E6ED8();
  return swift_release();
}

uint64_t sub_22D8E544C()
{
  sub_22D8DE4EC();
  return sub_22D8E6D64();
}

ValueMetadata *type metadata accessor for VerifyIdentityWithWalletButtonLabel()
{
  return &type metadata for VerifyIdentityWithWalletButtonLabel;
}

ValueMetadata *type metadata accessor for VerifyIdentityWithWalletButtonStyle()
{
  return &type metadata for VerifyIdentityWithWalletButtonStyle;
}

uint64_t sub_22D8E54A8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD v4[2];

  v1 = *(_QWORD *)(a1 + 8);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255DA0E60);
  v2 = sub_22D8E6D10();
  v4[0] = v1;
  v4[1] = sub_22D8E5508();
  return MEMORY[0x22E31B14C](MEMORY[0x24BDED308], v2, v4);
}

unint64_t sub_22D8E5508()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255DA0E68;
  if (!qword_255DA0E68)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255DA0E60);
    result = MEMORY[0x22E31B14C](MEMORY[0x24BDF1028], v1);
    atomic_store(result, (unint64_t *)&qword_255DA0E68);
  }
  return result;
}

ValueMetadata *type metadata accessor for VerifyIdentityWithWalletButtonStyleKey()
{
  return &type metadata for VerifyIdentityWithWalletButtonStyleKey;
}

id static AddPassToWalletButtonFilter.paymentNetwork(_:)@<X0>(id a1@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = a1;
  *(_QWORD *)(a2 + 8) = 0;
  *(_BYTE *)(a2 + 16) = 0;
  return a1;
}

uint64_t static AddPassToWalletButtonFilter.productIdentifier(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_22D8E5584(a1, a2, 1, a3);
}

uint64_t static AddPassToWalletButtonFilter.primaryAccountIdentifier(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_22D8E5584(a1, a2, 2, a3);
}

uint64_t sub_22D8E5584@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  *(_QWORD *)a4 = a1;
  *(_QWORD *)(a4 + 8) = a2;
  *(_BYTE *)(a4 + 16) = a3;
  return swift_bridgeObjectRetain();
}

uint64_t AddPassToWalletButton.init(_:cardholderName:passStyle:primaryAccountSuffix:cardDetails:description:filters:onRequest:onCompletion:fallback:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X6>, uint64_t a6@<X7>, _OWORD *a7@<X8>, uint64_t a8, uint64_t a9, __int128 a10, uint64_t a11, uint64_t a12, void (*a13)(uint64_t), uint64_t a14, uint64_t a15, uint64_t a16)
{
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  __int128 v21;
  _OWORD *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v27 = a5;
  v28 = a6;
  v25 = a3;
  v26 = a4;
  v23 = a1;
  v24 = a2;
  v22 = a7;
  v21 = a10;
  v16 = sub_22D8E7124();
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)&v21 - v17;
  v19 = swift_bridgeObjectRelease();
  a13(v19);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(a15 - 8) + 56))(v18, 0, 1, a15);
  return sub_22D8E59E8(v23, v25, 0, v26, v27, v22, a8, a9, (uint64_t)v18, v21, *((uint64_t *)&v21 + 1), a11, a12, a15, a16);
}

void sub_22D8E569C(void *a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X4>, uint64_t a4@<X5>, uint64_t a5@<X6>, uint64_t a6@<X8>, uint64_t a7, uint64_t a8, char a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _BYTE *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35[3];

  v19 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE6E9A8]), sel_initWithEncryptionScheme_, a1);
  if (v19)
  {
    v20 = v19;
    if (a2)
    {
      v21 = (void *)sub_22D8E701C();
      swift_bridgeObjectRelease();
    }
    else
    {
      v21 = 0;
    }
    objc_msgSend(v20, sel_setCardholderName_, v21);

    if (a3)
    {
      v22 = (void *)sub_22D8E701C();
      swift_bridgeObjectRelease();
    }
    else
    {
      v22 = 0;
    }
    objc_msgSend(v20, sel_setPrimaryAccountSuffix_, v22);

    objc_msgSend(v20, sel_setStyle_, a4);
    if (a5)
    {
      sub_22D8E6370();
      v23 = (void *)sub_22D8E7064();
      swift_bridgeObjectRelease();
      objc_msgSend(v20, sel_setCardDetails_, v23);

    }
    if (a7)
    {
      v24 = (void *)sub_22D8E701C();
      swift_bridgeObjectRelease();
    }
    else
    {
      v24 = 0;
    }
    v26 = a12;
    v25 = a13;
    v27 = a10;
    objc_msgSend(v20, sel_setLocalizedDescription_, v24);

    v35[2] = MEMORY[0x24BEE4B08];
    v28 = *(_QWORD *)(a8 + 16);
    if (v28)
    {
      v29 = (_BYTE *)(a8 + 48);
      do
      {
        v30 = (void *)*((_QWORD *)v29 - 2);
        if (*v29)
        {
          v31 = *((_QWORD *)v29 - 1);
          v32 = (void *)*((_QWORD *)v29 - 2);
          if (*v29 == 1)
          {
            sub_22D8E5FC0(v32, v31, 1);
            sub_22D8E61C4(v35, (uint64_t)v30, v31);
            swift_bridgeObjectRelease();
          }
          else
          {
            sub_22D8E5FC0(v32, v31, 2);
            v33 = (void *)sub_22D8E701C();
            objc_msgSend(v20, sel_setPrimaryAccountIdentifier_, v33);
            sub_22D8E5FE8(v30, v31, 2);

          }
        }
        else
        {
          objc_msgSend(v20, sel_setPaymentNetwork_, *((_QWORD *)v29 - 2));
        }
        v29 += 24;
        --v28;
      }
      while (v28);
      swift_bridgeObjectRelease();
      v25 = a13;
      v26 = a12;
      v27 = a10;
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    v34 = (void *)sub_22D8E70D0();
    swift_bridgeObjectRelease();
    objc_msgSend(v20, sel_setProductIdentifiers_, v34);

    *(_BYTE *)(a6 + 41) = a9 & 1;
    *(_QWORD *)a6 = v20;
    *(_QWORD *)(a6 + 8) = v27;
    *(_QWORD *)(a6 + 16) = a11;
    *(_QWORD *)(a6 + 24) = v26;
    *(_QWORD *)(a6 + 32) = v25;
    *(_BYTE *)(a6 + 40) = 3;
  }
  else
  {
    sub_22D8E7184();
    __break(1u);
  }
}

uint64_t sub_22D8E59E8@<X0>(void *a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X4>, uint64_t a4@<X5>, uint64_t a5@<X6>, _OWORD *a6@<X8>, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  _BYTE *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t result;
  _OWORD *v36;
  __int128 v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char v41;

  v21 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE6E9A8]), sel_initWithEncryptionScheme_, a1);
  if (v21)
  {
    v22 = v21;
    if (a2)
    {
      v23 = (void *)sub_22D8E701C();
      swift_bridgeObjectRelease();
    }
    else
    {
      v23 = 0;
    }
    objc_msgSend(v22, sel_setCardholderName_, v23);

    if (a3)
    {
      v24 = (void *)sub_22D8E701C();
      swift_bridgeObjectRelease();
    }
    else
    {
      v24 = 0;
    }
    objc_msgSend(v22, sel_setPrimaryAccountSuffix_, v24);

    objc_msgSend(v22, sel_setStyle_, a4);
    if (a5)
    {
      sub_22D8E6370();
      v25 = (void *)sub_22D8E7064();
      swift_bridgeObjectRelease();
      objc_msgSend(v22, sel_setCardDetails_, v25);

    }
    if (a7)
    {
      v26 = (void *)sub_22D8E701C();
      swift_bridgeObjectRelease();
    }
    else
    {
      v26 = 0;
    }
    v27 = a13;
    objc_msgSend(v22, sel_setLocalizedDescription_, v26);

    v28 = *(_QWORD *)(a8 + 16);
    if (v28)
    {
      v36 = a6;
      v29 = (_BYTE *)(a8 + 48);
      do
      {
        v30 = (void *)*((_QWORD *)v29 - 2);
        if (*v29)
        {
          v31 = *((_QWORD *)v29 - 1);
          v32 = (void *)*((_QWORD *)v29 - 2);
          if (*v29 == 1)
          {
            sub_22D8E5FC0(v32, v31, 1);
            sub_22D8E61C4((uint64_t *)&v37, (uint64_t)v30, v31);
            swift_bridgeObjectRelease();
          }
          else
          {
            sub_22D8E5FC0(v32, v31, 2);
            v33 = (void *)sub_22D8E701C();
            objc_msgSend(v22, sel_setPrimaryAccountIdentifier_, v33);
            sub_22D8E5FE8(v30, v31, 2);

          }
        }
        else
        {
          objc_msgSend(v22, sel_setPaymentNetwork_, *((_QWORD *)v29 - 2));
        }
        v29 += 24;
        --v28;
      }
      while (v28);
      swift_bridgeObjectRelease();
      a6 = v36;
      v27 = a13;
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    v34 = (void *)sub_22D8E70D0();
    swift_bridgeObjectRelease();
    objc_msgSend(v22, sel_setProductIdentifiers_, v34);

    *(_QWORD *)&v37 = v22;
    *((_QWORD *)&v37 + 1) = a10;
    v38 = a11;
    v39 = a12;
    v40 = v27;
    v41 = 3;
    return sub_22D8CFBF8(&v37, a9, a14, a15, a6);
  }
  else
  {
    result = sub_22D8E7184();
    __break(1u);
  }
  return result;
}

uint64_t AddPassToWalletButton.init(_:primaryAccountSuffix:passStyle:cardDetails:description:filters:onRequest:onCompletion:fallback:)@<X0>(void *a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, uint64_t a7@<X7>, _OWORD *a8@<X8>, __int128 a9, uint64_t a10, uint64_t a11, void (*a12)(uint64_t), uint64_t a13, uint64_t a14, uint64_t a15)
{
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v23 = a7;
  v24 = a6;
  v27 = a4;
  v28 = a5;
  v25 = a2;
  v26 = a3;
  v22 = a9;
  v17 = sub_22D8E7124();
  v18 = MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)&v22 - v19;
  a12(v18);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(a14 - 8) + 56))(v20, 0, 1, a14);
  return sub_22D8E59E8(a1, 0, v25, v26, v27, a8, v24, v23, (uint64_t)v20, v22, *((uint64_t *)&v22 + 1), a10, a11, a14, a15);
}

double AddPassToWalletButton<>.init(_:cardholderName:passStyle:primaryAccountSuffix:cardDetails:description:filters:onRequest:onCompletion:)@<D0>(void *a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X6>, uint64_t a5@<X8>, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v16;
  char v17;
  char v18;
  double result;
  __int128 v20;
  _OWORD v21[2];
  uint64_t v22;
  char v23;
  char v24;

  swift_bridgeObjectRelease();
  sub_22D8E569C(a1, a2, 0, a3, a4, (uint64_t)v21, a6, a7, 1, a8, a9, a10, a11);
  v16 = v22;
  v17 = v23;
  v18 = v24;
  result = *(double *)v21;
  v20 = v21[1];
  *(_OWORD *)a5 = v21[0];
  *(_OWORD *)(a5 + 16) = v20;
  *(_QWORD *)(a5 + 32) = v16;
  *(_BYTE *)(a5 + 40) = v17;
  *(_BYTE *)(a5 + 41) = v18;
  return result;
}

double AddPassToWalletButton<>.init(_:primaryAccountSuffix:passStyle:cardDetails:description:filters:onRequest:onCompletion:)@<D0>(void *a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X6>, uint64_t a6@<X7>, uint64_t a7@<X8>, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v12;
  char v13;
  char v14;
  double result;
  __int128 v16;
  _OWORD v17[2];
  uint64_t v18;
  char v19;
  char v20;

  sub_22D8E569C(a1, 0, a2, a3, a4, (uint64_t)v17, a5, a6, 1, a8, a9, a10, a11);
  v12 = v18;
  v13 = v19;
  v14 = v20;
  result = *(double *)v17;
  v16 = v17[1];
  *(_OWORD *)a7 = v17[0];
  *(_OWORD *)(a7 + 16) = v16;
  *(_QWORD *)(a7 + 32) = v12;
  *(_BYTE *)(a7 + 40) = v13;
  *(_BYTE *)(a7 + 41) = v14;
  return result;
}

id sub_22D8E5FC0(id result, uint64_t a2, char a3)
{
  if (a3 == 2 || a3 == 1)
    return (id)swift_bridgeObjectRetain();
  if (!a3)
    return result;
  return result;
}

void sub_22D8E5FE8(void *a1, uint64_t a2, char a3)
{
  if (a3 == 2 || a3 == 1)
  {
    swift_bridgeObjectRelease();
  }
  else if (!a3)
  {

  }
}

ValueMetadata *type metadata accessor for AddPassToWalletButtonFilter()
{
  return &type metadata for AddPassToWalletButtonFilter;
}

void destroy for AddPassToWalletButtonFilter.FilterType(uint64_t a1)
{
  sub_22D8E5FE8(*(void **)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t _s16_PassKit_SwiftUI27AddPassToWalletButtonFilterV10FilterTypeOwCP_0(uint64_t a1, uint64_t a2)
{
  id v3;
  uint64_t v4;
  char v5;

  v3 = *(id *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_22D8E5FC0(*(id *)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t _s16_PassKit_SwiftUI27AddPassToWalletButtonFilterV10FilterTypeOwca_0(uint64_t a1, uint64_t a2)
{
  id v3;
  uint64_t v4;
  char v5;
  void *v6;
  uint64_t v7;
  char v8;

  v3 = *(id *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_22D8E5FC0(*(id *)a2, v4, v5);
  v6 = *(void **)a1;
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  v8 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v5;
  sub_22D8E5FE8(v6, v7, v8);
  return a1;
}

uint64_t _s16_PassKit_SwiftUI27AddPassToWalletButtonFilterV10FilterTypeOwta_0(uint64_t a1, uint64_t a2)
{
  char v3;
  void *v4;
  uint64_t v5;
  char v6;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(void **)a1;
  v5 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  v6 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v3;
  sub_22D8E5FE8(v4, v5, v6);
  return a1;
}

uint64_t _s16_PassKit_SwiftUI27AddPassToWalletButtonFilterV10FilterTypeOwet_0(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFE && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 254);
  v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 2)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t _s16_PassKit_SwiftUI27AddPassToWalletButtonFilterV10FilterTypeOwst_0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 254;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

uint64_t sub_22D8E61AC(uint64_t result, char a2)
{
  *(_BYTE *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for AddPassToWalletButtonFilter.FilterType()
{
  return &type metadata for AddPassToWalletButtonFilter.FilterType;
}

uint64_t sub_22D8E61C4(uint64_t *a1, uint64_t a2, uint64_t a3)
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
  sub_22D8E71CC();
  swift_bridgeObjectRetain();
  sub_22D8E704C();
  v8 = sub_22D8E71E4();
  v9 = -1 << *(_BYTE *)(v7 + 32);
  v10 = v8 & ~v9;
  if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = *(_QWORD *)(v7 + 48);
    v12 = (_QWORD *)(v11 + 16 * v10);
    v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_22D8E71A8() & 1) != 0)
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
      if (v19 || (sub_22D8E71A8() & 1) != 0)
        goto LABEL_7;
    }
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v21 = *v3;
  *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_22D8E6688(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

unint64_t sub_22D8E6370()
{
  unint64_t result;

  result = qword_255DA0E70;
  if (!qword_255DA0E70)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_255DA0E70);
  }
  return result;
}

uint64_t sub_22D8E63AC()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DA0E78);
  v3 = sub_22D8E7148();
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
      sub_22D8E71CC();
      sub_22D8E704C();
      result = sub_22D8E71E4();
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

uint64_t sub_22D8E6688(uint64_t result, uint64_t a2, unint64_t a3, char a4)
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
    sub_22D8E63AC();
  }
  else
  {
    if (v10 > v9)
    {
      result = (uint64_t)sub_22D8E6820();
      goto LABEL_22;
    }
    sub_22D8E69D0();
  }
  v11 = *v4;
  sub_22D8E71CC();
  sub_22D8E704C();
  result = sub_22D8E71E4();
  v12 = -1 << *(_BYTE *)(v11 + 32);
  a3 = result & ~v12;
  v13 = v11 + 56;
  if (((*(_QWORD *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
  {
    v14 = *(_QWORD *)(v11 + 48);
    v15 = (_QWORD *)(v14 + 16 * a3);
    v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (result = sub_22D8E71A8(), (result & 1) != 0))
    {
LABEL_21:
      result = sub_22D8E71B4();
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
          result = sub_22D8E71A8();
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

void *sub_22D8E6820()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DA0E78);
  v2 = *v0;
  v3 = sub_22D8E713C();
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

uint64_t sub_22D8E69D0()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DA0E78);
  v3 = sub_22D8E7148();
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
    sub_22D8E71CC();
    swift_bridgeObjectRetain();
    sub_22D8E704C();
    result = sub_22D8E71E4();
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

uint64_t sub_22D8E6C80()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_22D8E6C8C()
{
  return MEMORY[0x24BDCED80]();
}

uint64_t sub_22D8E6C98()
{
  return MEMORY[0x24BEE76F0]();
}

uint64_t sub_22D8E6CA4()
{
  return MEMORY[0x24BEE5C78]();
}

uint64_t sub_22D8E6CB0()
{
  return MEMORY[0x24BDEAF98]();
}

uint64_t sub_22D8E6CBC()
{
  return MEMORY[0x24BDEAFA8]();
}

uint64_t sub_22D8E6CC8()
{
  return MEMORY[0x24BDEB418]();
}

uint64_t sub_22D8E6CD4()
{
  return MEMORY[0x24BDEB560]();
}

uint64_t sub_22D8E6CE0()
{
  return MEMORY[0x24BDEBED0]();
}

uint64_t sub_22D8E6CEC()
{
  return MEMORY[0x24BDEC4E0]();
}

uint64_t sub_22D8E6CF8()
{
  return MEMORY[0x24BDEC638]();
}

uint64_t sub_22D8E6D04()
{
  return MEMORY[0x24BDEC648]();
}

uint64_t sub_22D8E6D10()
{
  return MEMORY[0x24BDED2D0]();
}

uint64_t sub_22D8E6D1C()
{
  return MEMORY[0x24BDEDBA8]();
}

uint64_t sub_22D8E6D28()
{
  return MEMORY[0x24BDEDEE8]();
}

uint64_t sub_22D8E6D34()
{
  return MEMORY[0x24BDEDEF8]();
}

uint64_t sub_22D8E6D40()
{
  return MEMORY[0x24BDEE4E0]();
}

uint64_t sub_22D8E6D4C()
{
  return MEMORY[0x24BDEE4F8]();
}

uint64_t sub_22D8E6D58()
{
  return MEMORY[0x24BDEE520]();
}

uint64_t sub_22D8E6D64()
{
  return MEMORY[0x24BDEE530]();
}

uint64_t sub_22D8E6D70()
{
  return MEMORY[0x24BDEE538]();
}

uint64_t sub_22D8E6D7C()
{
  return MEMORY[0x24BDEEF60]();
}

uint64_t sub_22D8E6D88()
{
  return MEMORY[0x24BDEF228]();
}

uint64_t sub_22D8E6D94()
{
  return MEMORY[0x24BDEF238]();
}

uint64_t sub_22D8E6DA0()
{
  return MEMORY[0x24BDEF248]();
}

uint64_t sub_22D8E6DAC()
{
  return MEMORY[0x24BDEF260]();
}

uint64_t sub_22D8E6DB8()
{
  return MEMORY[0x24BDEF270]();
}

uint64_t sub_22D8E6DC4()
{
  return MEMORY[0x24BDEF278]();
}

uint64_t sub_22D8E6DD0()
{
  return MEMORY[0x24BDEF288]();
}

uint64_t sub_22D8E6DDC()
{
  return MEMORY[0x24BDEF298]();
}

uint64_t sub_22D8E6DE8()
{
  return MEMORY[0x24BDEF2A8]();
}

uint64_t sub_22D8E6DF4()
{
  return MEMORY[0x24BDEF2C0]();
}

uint64_t sub_22D8E6E00()
{
  return MEMORY[0x24BDEF2C8]();
}

uint64_t sub_22D8E6E0C()
{
  return MEMORY[0x24BDEF2D8]();
}

uint64_t sub_22D8E6E18()
{
  return MEMORY[0x24BDEF380]();
}

uint64_t sub_22D8E6E24()
{
  return MEMORY[0x24BDEF3A0]();
}

uint64_t sub_22D8E6E30()
{
  return MEMORY[0x24BDEF3B8]();
}

uint64_t sub_22D8E6E3C()
{
  return MEMORY[0x24BDF0AF0]();
}

uint64_t sub_22D8E6E48()
{
  return MEMORY[0x24BDF0EC0]();
}

uint64_t sub_22D8E6E54()
{
  return MEMORY[0x24BDF0ED0]();
}

uint64_t sub_22D8E6E60()
{
  return MEMORY[0x24BDF0EE0]();
}

uint64_t sub_22D8E6E6C()
{
  return MEMORY[0x24BDF0EF0]();
}

uint64_t sub_22D8E6E78()
{
  return MEMORY[0x24BDF0F00]();
}

uint64_t sub_22D8E6E84()
{
  return MEMORY[0x24BDF0F10]();
}

uint64_t sub_22D8E6E90()
{
  return MEMORY[0x24BDF0F18]();
}

uint64_t sub_22D8E6E9C()
{
  return MEMORY[0x24BDF0F28]();
}

uint64_t sub_22D8E6EA8()
{
  return MEMORY[0x24BDF1430]();
}

uint64_t sub_22D8E6EB4()
{
  return MEMORY[0x24BDF1FF0]();
}

uint64_t sub_22D8E6EC0()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t sub_22D8E6ECC()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t sub_22D8E6ED8()
{
  return MEMORY[0x24BDF2370]();
}

uint64_t sub_22D8E6EE4()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t sub_22D8E6EF0()
{
  return MEMORY[0x24BDF2830]();
}

uint64_t sub_22D8E6EFC()
{
  return MEMORY[0x24BDF34D0]();
}

uint64_t sub_22D8E6F08()
{
  return MEMORY[0x24BDF35B0]();
}

uint64_t sub_22D8E6F14()
{
  return MEMORY[0x24BDF38C8]();
}

uint64_t sub_22D8E6F20()
{
  return MEMORY[0x24BDF38E0]();
}

uint64_t sub_22D8E6F2C()
{
  return MEMORY[0x24BDF3F18]();
}

uint64_t sub_22D8E6F38()
{
  return MEMORY[0x24BDF3F28]();
}

uint64_t sub_22D8E6F44()
{
  return MEMORY[0x24BDF4280]();
}

uint64_t sub_22D8E6F50()
{
  return MEMORY[0x24BDF4290]();
}

uint64_t sub_22D8E6F5C()
{
  return MEMORY[0x24BDF42A8]();
}

uint64_t sub_22D8E6F68()
{
  return MEMORY[0x24BDF42B0]();
}

uint64_t sub_22D8E6F74()
{
  return MEMORY[0x24BDF42C0]();
}

uint64_t sub_22D8E6F80()
{
  return MEMORY[0x24BDF4368]();
}

uint64_t sub_22D8E6F8C()
{
  return MEMORY[0x24BDF4380]();
}

uint64_t sub_22D8E6F98()
{
  return MEMORY[0x24BDF46D8]();
}

uint64_t sub_22D8E6FA4()
{
  return MEMORY[0x24BDF46E0]();
}

uint64_t sub_22D8E6FB0()
{
  return MEMORY[0x24BDF4728]();
}

uint64_t sub_22D8E6FBC()
{
  return MEMORY[0x24BDF4730]();
}

uint64_t sub_22D8E6FC8()
{
  return MEMORY[0x24BDF4790]();
}

uint64_t sub_22D8E6FD4()
{
  return MEMORY[0x24BDF4F18]();
}

uint64_t sub_22D8E6FE0()
{
  return MEMORY[0x24BDF53F0]();
}

uint64_t sub_22D8E6FEC()
{
  return MEMORY[0x24BDF5418]();
}

uint64_t sub_22D8E6FF8()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_22D8E7004()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_22D8E7010()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_22D8E701C()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_22D8E7028()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_22D8E7034()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_22D8E7040()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_22D8E704C()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_22D8E7058()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_22D8E7064()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_22D8E7070()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_22D8E707C()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_22D8E7088()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_22D8E7094()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_22D8E70A0()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_22D8E70AC()
{
  return MEMORY[0x24BEE6940]();
}

uint64_t sub_22D8E70B8()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_22D8E70C4()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_22D8E70D0()
{
  return MEMORY[0x24BDCFCC0]();
}

uint64_t sub_22D8E70DC()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_22D8E70E8()
{
  return MEMORY[0x24BEE5C88]();
}

uint64_t sub_22D8E70F4()
{
  return MEMORY[0x24BEE5C90]();
}

uint64_t sub_22D8E7100()
{
  return MEMORY[0x24BEE5C98]();
}

uint64_t sub_22D8E710C()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_22D8E7118()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_22D8E7124()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_22D8E7130()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_22D8E713C()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_22D8E7148()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_22D8E7154()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_22D8E7160()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_22D8E716C()
{
  return MEMORY[0x24BEE2660]();
}

uint64_t sub_22D8E7178()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_22D8E7184()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_22D8E7190()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_22D8E719C()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_22D8E71A8()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_22D8E71B4()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_22D8E71C0()
{
  return MEMORY[0x24BEE42C0]();
}

uint64_t sub_22D8E71CC()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_22D8E71D8()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_22D8E71E4()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_22D8E71F0()
{
  return MEMORY[0x24BEE4A98]();
}

uint64_t PKApplePayButtonAccessibilityTitleForType()
{
  return MEMORY[0x24BE6F180]();
}

uint64_t PKCreateApplePayButtonImage()
{
  return MEMORY[0x24BE6F230]();
}

uint64_t PKOpenInstallWallet()
{
  return MEMORY[0x24BE6F4C0]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

uint64_t PKLocalizedDeletableString(NSString *a1)
{
  return MEMORY[0x24BE6FA48](a1);
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

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
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

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_continuation_await()
{
  return MEMORY[0x24BEE71B8]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x24BEE71C0]();
}

uint64_t swift_continuation_resume()
{
  return MEMORY[0x24BEE71C8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
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

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x24BEE4CE8]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x24BEE4D08]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
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

uint64_t swift_getTupleTypeMetadata()
{
  return MEMORY[0x24BEE4DF0]();
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

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
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

