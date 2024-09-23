double static MatterAddDeviceExtensionRequestHandler.WiFiNetworkAssociation.defaultSystemNetwork.getter@<D0>(uint64_t a1@<X8>)
{
  double result;

  result = 0.0;
  *(_OWORD *)a1 = xmmword_23452DEA0;
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)(a1 + 24) = 0;
  return result;
}

uint64_t static MatterAddDeviceExtensionRequestHandler.WiFiNetworkAssociation.network(ssid:credentials:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  *a5 = a1;
  a5[1] = a2;
  a5[2] = a3;
  a5[3] = a4;
  sub_23450081C(a1, a2);
  return sub_23450081C(a3, a4);
}

uint64_t sub_23450081C(uint64_t a1, unint64_t a2)
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

uint64_t sub_234500860(char a1)
{
  if ((a1 & 1) != 0)
    return 0x6B726F7774656ELL;
  else
    return 0xD000000000000014;
}

uint64_t sub_2345008A4()
{
  char *v0;

  return sub_234500860(*v0);
}

uint64_t sub_2345008AC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2345025B4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2345008D0()
{
  return 0;
}

void sub_2345008DC(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_2345008E8()
{
  sub_234502C38();
  return sub_23452C01C();
}

uint64_t sub_234500910()
{
  sub_234502C38();
  return sub_23452C028();
}

uint64_t sub_234500938(char a1)
{
  if ((a1 & 1) != 0)
    return 0x69746E6564657263;
  else
    return 1684632435;
}

uint64_t sub_234500970(_QWORD *a1, uint64_t a2, unint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  char v37;

  v30 = a3;
  v28 = a4;
  v29 = a5;
  v33 = a2;
  v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_25615E920);
  v27 = *(_QWORD *)(v32 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25615E928);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8]();
  v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_25615E930);
  v12 = *(_QWORD *)(v34 - 8);
  MEMORY[0x24BDAC7A8]();
  v14 = (char *)&v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_234502C38();
  v15 = v30;
  sub_23452C010();
  if (v15 >> 60 == 15)
  {
    LOBYTE(v35) = 0;
    sub_234502D04();
    v16 = v34;
    sub_23452BED8();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v16);
  }
  else
  {
    v26 = v12;
    LOBYTE(v35) = 1;
    v18 = v33;
    sub_23450081C(v33, v15);
    v20 = v28;
    v19 = v29;
    sub_23450081C(v28, v29);
    sub_234502C7C();
    sub_23452BED8();
    v35 = v18;
    v36 = v15;
    v37 = 0;
    sub_234502CC0();
    v21 = v31;
    sub_23452BF08();
    if (v21)
    {
      sub_2345011D4(v20, v19);
      (*(void (**)(char *, uint64_t))(v27 + 8))(v7, v32);
      (*(void (**)(char *, uint64_t))(v26 + 8))(v14, v34);
      v22 = v33;
      v23 = v15;
    }
    else
    {
      v35 = v20;
      v36 = v19;
      v37 = 1;
      v24 = v32;
      sub_23452BF08();
      sub_2345011D4(v33, v15);
      (*(void (**)(char *, uint64_t))(v27 + 8))(v7, v24);
      (*(void (**)(char *, uint64_t))(v26 + 8))(v14, v34);
      v22 = v20;
      v23 = v19;
    }
    return sub_2345011D4(v22, v23);
  }
}

uint64_t sub_234500C5C()
{
  return 0;
}

uint64_t sub_234500C68@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

void sub_234500C94(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_234500CA0()
{
  sub_234502D04();
  return sub_23452C01C();
}

uint64_t sub_234500CC8()
{
  sub_234502D04();
  return sub_23452C028();
}

BOOL sub_234500CF0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_234500D08()
{
  sub_23452BF8C();
  sub_23452BF98();
  return sub_23452BFC8();
}

uint64_t sub_234500D4C()
{
  return sub_23452BF98();
}

uint64_t sub_234500D74()
{
  sub_23452BF8C();
  sub_23452BF98();
  return sub_23452BFC8();
}

uint64_t sub_234500DB4()
{
  char *v0;

  return sub_234500938(*v0);
}

uint64_t sub_234500DBC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2345026A0(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_234500DE0()
{
  sub_234502C7C();
  return sub_23452C01C();
}

uint64_t sub_234500E08()
{
  sub_234502C7C();
  return sub_23452C028();
}

uint64_t sub_234500E30()
{
  uint64_t *v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;

  v1 = *v0;
  v2 = v0[1];
  v3 = v0[2];
  v4 = v0[3];
  sub_23452BF8C();
  sub_23452BF98();
  if (v2 >> 60 != 15)
  {
    sub_23450081C(v1, v2);
    sub_23450081C(v3, v4);
    sub_23452BB0C();
    sub_23452BB0C();
    sub_2345011D4(v1, v2);
    sub_2345011D4(v3, v4);
  }
  return sub_23452BFC8();
}

uint64_t sub_234500EF0()
{
  uint64_t *v0;
  unint64_t v1;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = v0[1];
  if (v1 >> 60 == 15)
    return sub_23452BF98();
  v4 = v0[2];
  v3 = v0[3];
  v5 = *v0;
  sub_23452BF98();
  sub_23450081C(v5, v1);
  sub_23450081C(v4, v3);
  sub_23452BB0C();
  sub_23452BB0C();
  sub_2345011D4(v5, v1);
  return sub_2345011D4(v4, v3);
}

uint64_t sub_234500FAC()
{
  uint64_t *v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;

  v1 = *v0;
  v2 = v0[1];
  v3 = v0[2];
  v4 = v0[3];
  sub_23452BF8C();
  sub_23452BF98();
  if (v2 >> 60 != 15)
  {
    sub_23450081C(v1, v2);
    sub_23450081C(v3, v4);
    sub_23452BB0C();
    sub_23452BB0C();
    sub_2345011D4(v1, v2);
    sub_2345011D4(v3, v4);
  }
  return sub_23452BFC8();
}

uint64_t sub_234501068@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  result = sub_234502788(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
    a2[2] = v6;
    a2[3] = v7;
  }
  return result;
}

uint64_t sub_234501094(_QWORD *a1)
{
  uint64_t v1;

  return sub_234500970(a1, *(_QWORD *)v1, *(_QWORD *)(v1 + 8), *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t MatterAddDeviceExtensionRequestHandler.WiFiNetworkAssociation.hash(into:)()
{
  uint64_t *v0;
  unint64_t v1;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = v0[1];
  if (v1 >> 60 == 15)
    return sub_23452BF98();
  v4 = v0[2];
  v3 = v0[3];
  v5 = *v0;
  sub_23452BF98();
  sub_234501198(v5, v1, v4, v3);
  sub_23450081C(v5, v1);
  sub_23450081C(v4, v3);
  sub_23452BB0C();
  sub_23452BB0C();
  sub_2345011D4(v5, v1);
  sub_2345011D4(v4, v3);
  return sub_234501218(v5, v1, v4, v3);
}

uint64_t sub_234501198(uint64_t result, unint64_t a2, uint64_t a3, unint64_t a4)
{
  if (a2 >> 60 != 15)
  {
    sub_23450081C(result, a2);
    return sub_23450081C(a3, a4);
  }
  return result;
}

uint64_t sub_2345011D4(uint64_t a1, unint64_t a2)
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

uint64_t sub_234501218(uint64_t result, unint64_t a2, uint64_t a3, unint64_t a4)
{
  if (a2 >> 60 != 15)
  {
    sub_2345011D4(result, a2);
    return sub_2345011D4(a3, a4);
  }
  return result;
}

uint64_t static MatterAddDeviceExtensionRequestHandler.WiFiNetworkAssociation.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return sub_2345018F0(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)a2, *(_QWORD *)(a2 + 8));
}

uint64_t sub_234501270()
{
  return 1;
}

uint64_t sub_234501278()
{
  sub_23452BF8C();
  sub_23452BF98();
  return sub_23452BFC8();
}

uint64_t sub_2345012B8()
{
  return sub_23452BF98();
}

uint64_t sub_2345012DC()
{
  sub_23452BF8C();
  sub_23452BF98();
  return sub_23452BFC8();
}

unint64_t sub_234501318()
{
  return 0xD000000000000012;
}

uint64_t sub_234501334@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_234502BB4(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_23450135C()
{
  sub_234501BB4();
  return sub_23452C01C();
}

uint64_t sub_234501384()
{
  sub_234501BB4();
  return sub_23452C028();
}

uint64_t MatterAddDeviceExtensionRequestHandler.WiFiNetworkAssociation.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  _OWORD v10[2];
  uint64_t v11;
  uint64_t v12;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25615E8B8);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10[0] = *(_OWORD *)v1;
  v8 = *(_QWORD *)(v1 + 16);
  v7 = *(_QWORD *)(v1 + 24);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_234501BB4();
  sub_23452C010();
  v10[1] = v10[0];
  v11 = v8;
  v12 = v7;
  sub_234501BF8();
  sub_23452BF08();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t MatterAddDeviceExtensionRequestHandler.WiFiNetworkAssociation.hashValue.getter()
{
  uint64_t *v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;

  v1 = *v0;
  v2 = v0[1];
  v3 = v0[2];
  v4 = v0[3];
  sub_23452BF8C();
  sub_23452BF98();
  if (v2 >> 60 != 15)
  {
    sub_234501198(v1, v2, v3, v4);
    sub_23450081C(v1, v2);
    sub_23450081C(v3, v4);
    sub_23452BB0C();
    sub_23452BB0C();
    sub_2345011D4(v1, v2);
    sub_2345011D4(v3, v4);
    sub_234501218(v1, v2, v3, v4);
  }
  return sub_23452BFC8();
}

uint64_t MatterAddDeviceExtensionRequestHandler.WiFiNetworkAssociation.init(from:)@<X0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  __int128 v9;
  _OWORD v11[2];

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25615E8D0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_234501BB4();
  sub_23452C004();
  if (!v2)
  {
    sub_234501C5C();
    sub_23452BE90();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    v9 = v11[1];
    *a2 = v11[0];
    a2[1] = v9;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_2345016C8()
{
  uint64_t *v0;
  unint64_t v1;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = v0[1];
  if (v1 >> 60 == 15)
    return sub_23452BF98();
  v4 = v0[2];
  v3 = v0[3];
  v5 = *v0;
  sub_23452BF98();
  sub_234501198(v5, v1, v4, v3);
  sub_23450081C(v5, v1);
  sub_23450081C(v4, v3);
  sub_23452BB0C();
  sub_23452BB0C();
  sub_2345011D4(v5, v1);
  sub_2345011D4(v4, v3);
  return sub_234501218(v5, v1, v4, v3);
}

uint64_t sub_2345017AC()
{
  uint64_t *v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;

  v1 = *v0;
  v2 = v0[1];
  v3 = v0[2];
  v4 = v0[3];
  sub_23452BF8C();
  sub_23452BF98();
  if (v2 >> 60 != 15)
  {
    sub_234501198(v1, v2, v3, v4);
    sub_23450081C(v1, v2);
    sub_23450081C(v3, v4);
    sub_23452BB0C();
    sub_23452BB0C();
    sub_2345011D4(v1, v2);
    sub_2345011D4(v3, v4);
    sub_234501218(v1, v2, v3, v4);
  }
  return sub_23452BFC8();
}

uint64_t sub_234501890@<X0>(_QWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  return MatterAddDeviceExtensionRequestHandler.WiFiNetworkAssociation.init(from:)(a1, a2);
}

uint64_t sub_2345018A4(_QWORD *a1)
{
  return MatterAddDeviceExtensionRequestHandler.WiFiNetworkAssociation.encode(to:)(a1);
}

uint64_t sub_2345018B8(uint64_t a1, uint64_t a2)
{
  return sub_2345018F0(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)a2, *(_QWORD *)(a2 + 8));
}

unsigned __int8 *sub_2345018D4@<X0>(unsigned __int8 *result@<X0>, _WORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void sub_2345018E4(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = *v1;
}

uint64_t sub_2345018F0(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  if (a2 >> 60 == 15)
  {
    if (a6 >> 60 == 15)
      return 1;
  }
  else if (a6 >> 60 != 15)
  {
    __asm { BR              X10 }
  }
  return 0;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23493FDC8]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_234501BB4()
{
  unint64_t result;

  result = qword_25615E8C0;
  if (!qword_25615E8C0)
  {
    result = MEMORY[0x23493FDE0](&unk_23452E1F0, &_s14descr250598101V22WiFiNetworkAssociationV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25615E8C0);
  }
  return result;
}

unint64_t sub_234501BF8()
{
  unint64_t result;

  result = qword_25615E8C8;
  if (!qword_25615E8C8)
  {
    result = MEMORY[0x23493FDE0](&unk_23452E1C8, &_s14descr250598101V22WiFiNetworkAssociationV18AssociationDetailsON);
    atomic_store(result, (unint64_t *)&qword_25615E8C8);
  }
  return result;
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

unint64_t sub_234501C5C()
{
  unint64_t result;

  result = qword_25615E8D8;
  if (!qword_25615E8D8)
  {
    result = MEMORY[0x23493FDE0](&unk_23452E1A0, &_s14descr250598101V22WiFiNetworkAssociationV18AssociationDetailsON);
    atomic_store(result, (unint64_t *)&qword_25615E8D8);
  }
  return result;
}

unint64_t sub_234501CA4()
{
  unint64_t result;

  result = qword_25615E8E0;
  if (!qword_25615E8E0)
  {
    result = MEMORY[0x23493FDE0](&protocol conformance descriptor for MatterAddDeviceExtensionRequestHandler.WiFiNetworkAssociation, &type metadata for MatterAddDeviceExtensionRequestHandler.WiFiNetworkAssociation);
    atomic_store(result, (unint64_t *)&qword_25615E8E0);
  }
  return result;
}

uint64_t *_s14descr250598101V22WiFiNetworkAssociationVwxx(uint64_t *result)
{
  unint64_t v1;
  uint64_t *v2;

  v1 = result[1];
  if (v1 >> 60 != 15)
  {
    v2 = result;
    sub_2345011D4(*result, v1);
    return (uint64_t *)sub_2345011D4(v2[2], v2[3]);
  }
  return result;
}

uint64_t _s14descr250598101V22WiFiNetworkAssociationVwcp(uint64_t a1, uint64_t *a2)
{
  unint64_t v4;
  __int128 v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;

  v4 = a2[1];
  if (v4 >> 60 == 15)
  {
    v5 = *((_OWORD *)a2 + 1);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v5;
  }
  else
  {
    v6 = *a2;
    sub_23450081C(*a2, a2[1]);
    *(_QWORD *)a1 = v6;
    *(_QWORD *)(a1 + 8) = v4;
    v8 = a2[2];
    v7 = a2[3];
    sub_23450081C(v8, v7);
    *(_QWORD *)(a1 + 16) = v8;
    *(_QWORD *)(a1 + 24) = v7;
  }
  return a1;
}

uint64_t _s14descr250598101V22WiFiNetworkAssociationVwca(uint64_t a1, uint64_t *a2)
{
  unint64_t v4;
  __int128 v5;
  __int128 v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;

  v4 = a2[1];
  if (*(_QWORD *)(a1 + 8) >> 60 == 15)
  {
    if (v4 >> 60 == 15)
    {
      v5 = *((_OWORD *)a2 + 1);
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(_OWORD *)(a1 + 16) = v5;
    }
    else
    {
      v7 = *a2;
      sub_23450081C(*a2, a2[1]);
      *(_QWORD *)a1 = v7;
      *(_QWORD *)(a1 + 8) = v4;
      v9 = a2[2];
      v8 = a2[3];
      sub_23450081C(v9, v8);
      *(_QWORD *)(a1 + 16) = v9;
      *(_QWORD *)(a1 + 24) = v8;
    }
  }
  else if (v4 >> 60 == 15)
  {
    sub_234501E78(a1);
    v6 = *((_OWORD *)a2 + 1);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v6;
  }
  else
  {
    v10 = *a2;
    sub_23450081C(*a2, a2[1]);
    v11 = *(_QWORD *)a1;
    v12 = *(_QWORD *)(a1 + 8);
    *(_QWORD *)a1 = v10;
    *(_QWORD *)(a1 + 8) = v4;
    sub_2345011D4(v11, v12);
    v14 = a2[2];
    v13 = a2[3];
    sub_23450081C(v14, v13);
    v15 = *(_QWORD *)(a1 + 16);
    v16 = *(_QWORD *)(a1 + 24);
    *(_QWORD *)(a1 + 16) = v14;
    *(_QWORD *)(a1 + 24) = v13;
    sub_2345011D4(v15, v16);
  }
  return a1;
}

uint64_t sub_234501E78(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25615E8E8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
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

uint64_t *_s14descr250598101V22WiFiNetworkAssociationVwta(uint64_t *a1, uint64_t a2)
{
  unint64_t v4;
  unint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;

  v4 = a1[1];
  if (v4 >> 60 != 15)
  {
    v5 = *(_QWORD *)(a2 + 8);
    if (v5 >> 60 != 15)
    {
      v7 = *a1;
      *a1 = *(_QWORD *)a2;
      a1[1] = v5;
      sub_2345011D4(v7, v4);
      v8 = a1[2];
      v9 = a1[3];
      *((_OWORD *)a1 + 1) = *(_OWORD *)(a2 + 16);
      sub_2345011D4(v8, v9);
      return a1;
    }
    sub_234501E78((uint64_t)a1);
  }
  v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *((_OWORD *)a1 + 1) = v6;
  return a1;
}

uint64_t _s14descr250598101V22WiFiNetworkAssociationVwet(uint64_t a1, unsigned int a2)
{
  uint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xC && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 12);
  v3 = *(_QWORD *)(a1 + 8) >> 60;
  if (((4 * (_DWORD)v3) & 0xC) != 0)
    v4 = 14 - ((4 * v3) & 0xC | (v3 >> 2));
  else
    v4 = -1;
  return (v4 + 1);
}

uint64_t _s14descr250598101V22WiFiNetworkAssociationVwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xB)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 - 12;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xC)
      *(_BYTE *)(result + 32) = 1;
  }
  else
  {
    if (a3 >= 0xC)
      *(_BYTE *)(result + 32) = 0;
    if (a2)
    {
      *(_QWORD *)result = 0;
      *(_QWORD *)(result + 8) = (unint64_t)((4 * (a2 ^ 0xF)) | ((a2 ^ 0xF) >> 2)) << 60;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MatterAddDeviceExtensionRequestHandler.WiFiNetworkAssociation()
{
  return &type metadata for MatterAddDeviceExtensionRequestHandler.WiFiNetworkAssociation;
}

void type metadata accessor for MTRNetworkCommissioningWiFiBand(uint64_t a1)
{
  sub_234502020(a1, &qword_25615E8F0);
}

void type metadata accessor for MTRNetworkCommissioningWiFiSecurity(uint64_t a1)
{
  sub_234502020(a1, &qword_25615E8F8);
}

void sub_234502020(uint64_t a1, unint64_t *a2)
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

uint64_t _s14descr250598101V22WiFiNetworkAssociationV18AssociationDetailsOwCP(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t *_s14descr250598101V22WiFiNetworkAssociationV18AssociationDetailsOwxx(uint64_t *result)
{
  unint64_t v1;
  uint64_t *v2;

  v1 = result[1];
  if ((v1 & 0x3000000000000000) == 0)
  {
    v2 = result;
    sub_2345011D4(*result, v1);
    return (uint64_t *)sub_2345011D4(v2[2], v2[3]);
  }
  return result;
}

uint64_t _s14descr250598101V22WiFiNetworkAssociationV18AssociationDetailsOwcp(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;

  v4 = a2[1];
  if ((v4 & 0x3000000000000000) != 0)
  {
    v5 = *((_OWORD *)a2 + 1);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v5;
  }
  else
  {
    v6 = *a2;
    sub_23450081C(*a2, a2[1]);
    *(_QWORD *)a1 = v6;
    *(_QWORD *)(a1 + 8) = v4;
    v8 = a2[2];
    v7 = a2[3];
    sub_23450081C(v8, v7);
    *(_QWORD *)(a1 + 16) = v8;
    *(_QWORD *)(a1 + 24) = v7;
  }
  return a1;
}

uint64_t *_s14descr250598101V22WiFiNetworkAssociationV18AssociationDetailsOwca(uint64_t *a1, uint64_t *a2)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;

  v4 = a1[1];
  v5 = a2[1];
  v6 = v5 & 0x3000000000000000;
  if ((v4 & 0x3000000000000000) == 0)
  {
    if (!v6)
    {
      v12 = *a2;
      sub_23450081C(*a2, a2[1]);
      v13 = *a1;
      v14 = a1[1];
      *a1 = v12;
      a1[1] = v5;
      sub_2345011D4(v13, v14);
      v16 = a2[2];
      v15 = a2[3];
      sub_23450081C(v16, v15);
      v17 = a1[2];
      v18 = a1[3];
      a1[2] = v16;
      a1[3] = v15;
      sub_2345011D4(v17, v18);
      return a1;
    }
    sub_2345011D4(*a1, v4);
    sub_2345011D4(a1[2], a1[3]);
    goto LABEL_6;
  }
  if (v6)
  {
LABEL_6:
    v10 = *((_OWORD *)a2 + 1);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *((_OWORD *)a1 + 1) = v10;
    return a1;
  }
  v7 = *a2;
  sub_23450081C(*a2, a2[1]);
  *a1 = v7;
  a1[1] = v5;
  v9 = a2[2];
  v8 = a2[3];
  sub_23450081C(v9, v8);
  a1[2] = v9;
  a1[3] = v8;
  return a1;
}

uint64_t *_s14descr250598101V22WiFiNetworkAssociationV18AssociationDetailsOwta(uint64_t *a1, uint64_t a2)
{
  unint64_t v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;

  v4 = a1[1];
  if ((v4 & 0x3000000000000000) == 0)
  {
    v5 = *(_QWORD *)(a2 + 8);
    if ((v5 & 0x3000000000000000) == 0)
    {
      v8 = *a1;
      *a1 = *(_QWORD *)a2;
      a1[1] = v5;
      sub_2345011D4(v8, v4);
      v9 = a1[2];
      v10 = a1[3];
      *((_OWORD *)a1 + 1) = *(_OWORD *)(a2 + 16);
      sub_2345011D4(v9, v10);
      return a1;
    }
    sub_2345011D4(*a1, v4);
    sub_2345011D4(a1[2], a1[3]);
  }
  v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *((_OWORD *)a1 + 1) = v6;
  return a1;
}

uint64_t _s14descr250598101V22WiFiNetworkAssociationV18AssociationDetailsOwet(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  if (!a2)
    return 0;
  if (a2 >= 0xC && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 12);
  v3 = (((*(_QWORD *)(a1 + 8) >> 60) >> 2) & 0xFFFFFFF3 | (4 * ((*(_QWORD *)(a1 + 8) >> 60) & 3))) ^ 0xF;
  if (v3 >= 0xC)
    v3 = -1;
  if (v3 + 1 >= 2)
    return v3;
  else
    return 0;
}

uint64_t _s14descr250598101V22WiFiNetworkAssociationV18AssociationDetailsOwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xB)
  {
    *(_OWORD *)result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)result = a2 - 12;
    if (a3 >= 0xC)
      *(_BYTE *)(result + 32) = 1;
  }
  else
  {
    if (a3 >= 0xC)
      *(_BYTE *)(result + 32) = 0;
    if (a2)
    {
      *(_QWORD *)result = 0;
      *(_QWORD *)(result + 8) = (unint64_t)((4 * (a2 ^ 0xF)) | ((a2 ^ 0xF) >> 2)) << 60;
    }
  }
  return result;
}

uint64_t sub_234502328(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 8) >> 60;
  if (((4 * (_DWORD)v1) & 0xC) != 0)
    return 16 - ((4 * (_DWORD)v1) & 0xC | (v1 >> 2));
  else
    return 0;
}

_QWORD *sub_234502354(_QWORD *result, unsigned int a2)
{
  if (a2 > 0xC)
  {
    result[2] = 0;
    result[3] = 0;
    *result = a2 - 13;
    result[1] = 0;
  }
  else if (a2)
  {
    *result = 0;
    result[1] = (unint64_t)(((-a2 >> 2) & 3) - 4 * a2) << 60;
  }
  return result;
}

ValueMetadata *_s14descr250598101V22WiFiNetworkAssociationV18AssociationDetailsOMa()
{
  return &_s14descr250598101V22WiFiNetworkAssociationV18AssociationDetailsON;
}

uint64_t _s14descr250598101V22WiFiNetworkAssociationV10CodingKeysOwet(unsigned int *a1, int a2)
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

uint64_t _s14descr250598101V22WiFiNetworkAssociationV10CodingKeysOwst(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_234502430 + 4 * byte_23452DEB0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_234502450 + 4 * byte_23452DEB5[v4]))();
}

_BYTE *sub_234502430(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_234502450(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_234502458(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_234502460(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_234502468(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_234502470(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_23450247C()
{
  return 0;
}

ValueMetadata *_s14descr250598101V22WiFiNetworkAssociationV10CodingKeysOMa()
{
  return &_s14descr250598101V22WiFiNetworkAssociationV10CodingKeysON;
}

unint64_t sub_234502498()
{
  unint64_t result;

  result = qword_25615E900;
  if (!qword_25615E900)
  {
    result = MEMORY[0x23493FDE0](&unk_23452E0A0, &_s14descr250598101V22WiFiNetworkAssociationV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25615E900);
  }
  return result;
}

unint64_t sub_2345024E0()
{
  unint64_t result;

  result = qword_25615E908;
  if (!qword_25615E908)
  {
    result = MEMORY[0x23493FDE0](&unk_23452E0C8, &_s14descr250598101V22WiFiNetworkAssociationV18AssociationDetailsON);
    atomic_store(result, (unint64_t *)&qword_25615E908);
  }
  return result;
}

unint64_t sub_234502528()
{
  unint64_t result;

  result = qword_25615E910;
  if (!qword_25615E910)
  {
    result = MEMORY[0x23493FDE0](&unk_23452E010, &_s14descr250598101V22WiFiNetworkAssociationV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25615E910);
  }
  return result;
}

unint64_t sub_234502570()
{
  unint64_t result;

  result = qword_25615E918;
  if (!qword_25615E918)
  {
    result = MEMORY[0x23493FDE0](&unk_23452E038, &_s14descr250598101V22WiFiNetworkAssociationV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25615E918);
  }
  return result;
}

uint64_t sub_2345025B4(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0xD000000000000014 && a2 == 0x8000000234530A10 || (sub_23452BF5C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6B726F7774656ELL && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v5 = sub_23452BF5C();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_2345026A0(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 1684632435 && a2 == 0xE400000000000000;
  if (v3 || (sub_23452BF5C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x69746E6564657263 && a2 == 0xEB00000000736C61)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_23452BF5C();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_234502788(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
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
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25615E958);
  v25 = *(_QWORD *)(v2 - 8);
  v26 = v2;
  MEMORY[0x24BDAC7A8]();
  v27 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25615E960);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25615E968);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8]();
  v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = a1[3];
  v28 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v12);
  sub_234502C38();
  v13 = v29;
  sub_23452C004();
  if (!v13)
  {
    v14 = v4;
    v15 = v27;
    v29 = v9;
    v16 = sub_23452BECC();
    v17 = v16;
    if (*(_QWORD *)(v16 + 16) == 1)
    {
      if ((*(_BYTE *)(v16 + 32) & 1) != 0)
      {
        LOBYTE(v31) = 1;
        sub_234502C7C();
        sub_23452BE48();
        LOBYTE(v30) = 0;
        sub_234502D48();
        v18 = v26;
        sub_23452BE90();
        v24 = v17;
        v5 = v31;
        v32 = 1;
        v22 = v15;
        sub_23452BE90();
        v23 = v29;
        (*(void (**)(char *, uint64_t))(v25 + 8))(v22, v18);
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v23 + 8))(v11, v8);
      }
      else
      {
        LOBYTE(v31) = 0;
        sub_234502D04();
        sub_23452BE48();
        (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v14);
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v29 + 8))(v11, v8);
        v5 = 0;
      }
    }
    else
    {
      v19 = sub_23452BDAC();
      swift_allocError();
      v5 = v20;
      __swift_instantiateConcreteTypeFromMangledName(&qword_25615E970);
      *(_QWORD *)v5 = &_s14descr250598101V22WiFiNetworkAssociationV18AssociationDetailsON;
      sub_23452BE54();
      sub_23452BDA0();
      (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v19 - 8) + 104))(v5, *MEMORY[0x24BEE26D0], v19);
      swift_willThrow();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v29 + 8))(v11, v8);
    }
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
  return v5;
}

uint64_t sub_234502BB4(uint64_t a1, uint64_t a2)
{
  char v2;
  char v3;

  if (a1 == 0xD000000000000012 && a2 == 0x80000002345309C0)
  {
    swift_bridgeObjectRelease();
    v2 = 0;
  }
  else
  {
    v3 = sub_23452BF5C();
    swift_bridgeObjectRelease();
    v2 = v3 ^ 1;
  }
  return v2 & 1;
}

unint64_t sub_234502C38()
{
  unint64_t result;

  result = qword_25615E938;
  if (!qword_25615E938)
  {
    result = MEMORY[0x23493FDE0](&unk_23452E4D4, &_s14descr250598101V22WiFiNetworkAssociationV18AssociationDetailsO10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25615E938);
  }
  return result;
}

unint64_t sub_234502C7C()
{
  unint64_t result;

  result = qword_25615E940;
  if (!qword_25615E940)
  {
    result = MEMORY[0x23493FDE0](&unk_23452E484, &_s14descr250598101V22WiFiNetworkAssociationV18AssociationDetailsO17NetworkCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25615E940);
  }
  return result;
}

unint64_t sub_234502CC0()
{
  unint64_t result;

  result = qword_25615E948;
  if (!qword_25615E948)
  {
    result = MEMORY[0x23493FDE0](MEMORY[0x24BDCDDF8], MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&qword_25615E948);
  }
  return result;
}

unint64_t sub_234502D04()
{
  unint64_t result;

  result = qword_25615E950;
  if (!qword_25615E950)
  {
    result = MEMORY[0x23493FDE0](&unk_23452E434, &_s14descr250598101V22WiFiNetworkAssociationV18AssociationDetailsO30DefaultSystemNetworkCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25615E950);
  }
  return result;
}

unint64_t sub_234502D48()
{
  unint64_t result;

  result = qword_25615E978;
  if (!qword_25615E978)
  {
    result = MEMORY[0x23493FDE0](MEMORY[0x24BDCDE38], MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&qword_25615E978);
  }
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

ValueMetadata *_s14descr250598101V22WiFiNetworkAssociationV18AssociationDetailsO10CodingKeysOMa()
{
  return &_s14descr250598101V22WiFiNetworkAssociationV18AssociationDetailsO10CodingKeysON;
}

ValueMetadata *_s14descr250598101V22WiFiNetworkAssociationV18AssociationDetailsO30DefaultSystemNetworkCodingKeysOMa()
{
  return &_s14descr250598101V22WiFiNetworkAssociationV18AssociationDetailsO30DefaultSystemNetworkCodingKeysON;
}

uint64_t _s8TopologyV10CodingKeysOwet(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s14descr250598101V22WiFiNetworkAssociationV18AssociationDetailsO10CodingKeysOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_234502E9C + 4 * byte_23452DEBF[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_234502ED0 + 4 * byte_23452DEBA[v4]))();
}

uint64_t sub_234502ED0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_234502ED8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x234502EE0);
  return result;
}

uint64_t sub_234502EEC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x234502EF4);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_234502EF8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_234502F00(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_234502F0C(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_234502F14(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *_s14descr250598101V22WiFiNetworkAssociationV18AssociationDetailsO17NetworkCodingKeysOMa()
{
  return &_s14descr250598101V22WiFiNetworkAssociationV18AssociationDetailsO17NetworkCodingKeysON;
}

unint64_t sub_234502F34()
{
  unint64_t result;

  result = qword_25615E980;
  if (!qword_25615E980)
  {
    result = MEMORY[0x23493FDE0](&unk_23452E304, &_s14descr250598101V22WiFiNetworkAssociationV18AssociationDetailsO17NetworkCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25615E980);
  }
  return result;
}

unint64_t sub_234502F7C()
{
  unint64_t result;

  result = qword_25615E988;
  if (!qword_25615E988)
  {
    result = MEMORY[0x23493FDE0](&unk_23452E40C, &_s14descr250598101V22WiFiNetworkAssociationV18AssociationDetailsO10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25615E988);
  }
  return result;
}

unint64_t sub_234502FC4()
{
  unint64_t result;

  result = qword_25615E990;
  if (!qword_25615E990)
  {
    result = MEMORY[0x23493FDE0](&unk_23452E32C, &_s14descr250598101V22WiFiNetworkAssociationV18AssociationDetailsO30DefaultSystemNetworkCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25615E990);
  }
  return result;
}

unint64_t sub_23450300C()
{
  unint64_t result;

  result = qword_25615E998;
  if (!qword_25615E998)
  {
    result = MEMORY[0x23493FDE0](&unk_23452E354, &_s14descr250598101V22WiFiNetworkAssociationV18AssociationDetailsO30DefaultSystemNetworkCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25615E998);
  }
  return result;
}

unint64_t sub_234503054()
{
  unint64_t result;

  result = qword_25615E9A0;
  if (!qword_25615E9A0)
  {
    result = MEMORY[0x23493FDE0](&unk_23452E274, &_s14descr250598101V22WiFiNetworkAssociationV18AssociationDetailsO17NetworkCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25615E9A0);
  }
  return result;
}

unint64_t sub_23450309C()
{
  unint64_t result;

  result = qword_25615E9A8;
  if (!qword_25615E9A8)
  {
    result = MEMORY[0x23493FDE0](&unk_23452E29C, &_s14descr250598101V22WiFiNetworkAssociationV18AssociationDetailsO17NetworkCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25615E9A8);
  }
  return result;
}

unint64_t sub_2345030E4()
{
  unint64_t result;

  result = qword_25615E9B0;
  if (!qword_25615E9B0)
  {
    result = MEMORY[0x23493FDE0](&unk_23452E37C, &_s14descr250598101V22WiFiNetworkAssociationV18AssociationDetailsO10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25615E9B0);
  }
  return result;
}

unint64_t sub_23450312C()
{
  unint64_t result;

  result = qword_25615E9B8;
  if (!qword_25615E9B8)
  {
    result = MEMORY[0x23493FDE0](&unk_23452E3A4, &_s14descr250598101V22WiFiNetworkAssociationV18AssociationDetailsO10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25615E9B8);
  }
  return result;
}

uint64_t static MatterAddDeviceRequest.isSupported.getter()
{
  return 1;
}

uint64_t MatterAddDeviceRequest.topology.getter@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v2 = v1[2];
  v3 = v1[3];
  *a1 = v1[1];
  a1[1] = v2;
  a1[2] = v3;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

__n128 MatterAddDeviceRequest.topology.setter(uint64_t a1)
{
  __n128 *v1;
  unint64_t v3;
  __n128 result;

  v3 = *(_QWORD *)a1;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v1->n128_u64[1] = v3;
  result = *(__n128 *)(a1 + 8);
  v1[1] = result;
  return result;
}

uint64_t (*MatterAddDeviceRequest.topology.modify())()
{
  return nullsub_1;
}

void *MatterAddDeviceRequest.setupPayload.getter()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + 32);
  v2 = v1;
  return v1;
}

void MatterAddDeviceRequest.setupPayload.setter(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 32) = a1;
}

uint64_t (*MatterAddDeviceRequest.setupPayload.modify())()
{
  return nullsub_1;
}

uint64_t MatterAddDeviceRequest.showDeviceCriteria.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for MatterAddDeviceRequest(0);
  return sub_234507C24(v1 + *(int *)(v3 + 28), a1, type metadata accessor for MatterAddDeviceRequest.DeviceCriteria);
}

uint64_t type metadata accessor for MatterAddDeviceRequest(uint64_t a1)
{
  return sub_234507200(a1, qword_25615EA90);
}

uint64_t MatterAddDeviceRequest.showDeviceCriteria.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(type metadata accessor for MatterAddDeviceRequest(0) + 28);
  return sub_2345032F4(a1, v3);
}

uint64_t sub_2345032F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for MatterAddDeviceRequest.DeviceCriteria(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t (*MatterAddDeviceRequest.showDeviceCriteria.modify())()
{
  type metadata accessor for MatterAddDeviceRequest(0);
  return nullsub_1;
}

uint64_t MatterAddDeviceRequest.shouldScanNetworks.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for MatterAddDeviceRequest(0) + 32));
}

uint64_t MatterAddDeviceRequest.shouldScanNetworks.setter(char a1)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for MatterAddDeviceRequest(0);
  *(_BYTE *)(v1 + *(int *)(result + 32)) = a1;
  return result;
}

uint64_t (*MatterAddDeviceRequest.shouldScanNetworks.modify())()
{
  type metadata accessor for MatterAddDeviceRequest(0);
  return nullsub_1;
}

uint64_t MatterAddDeviceRequest.init(topology:setupPayload:showing:)@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  __int128 v11;

  v8 = *a1;
  sub_234507DD0(0, &qword_25615E9C0);
  v11 = *(_OWORD *)(a1 + 1);
  *(_QWORD *)a4 = sub_23452BD34();
  *(_QWORD *)(a4 + 8) = v8;
  *(_OWORD *)(a4 + 16) = v11;
  *(_QWORD *)(a4 + 32) = a2;
  v9 = type metadata accessor for MatterAddDeviceRequest(0);
  result = sub_234507CA4(a3, a4 + *(int *)(v9 + 28), type metadata accessor for MatterAddDeviceRequest.DeviceCriteria);
  *(_BYTE *)(a4 + *(int *)(v9 + 32)) = 1;
  return result;
}

uint64_t MatterAddDeviceRequest.init(topology:setupPayload:showing:shouldScanNetworks:)@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t a5@<X8>)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  __int128 v13;

  v10 = *a1;
  sub_234507DD0(0, &qword_25615E9C0);
  v13 = *(_OWORD *)(a1 + 1);
  *(_QWORD *)a5 = sub_23452BD34();
  *(_QWORD *)(a5 + 8) = v10;
  *(_OWORD *)(a5 + 16) = v13;
  *(_QWORD *)(a5 + 32) = a2;
  v11 = type metadata accessor for MatterAddDeviceRequest(0);
  result = sub_234507CA4(a3, a5 + *(int *)(v11 + 28), type metadata accessor for MatterAddDeviceRequest.DeviceCriteria);
  *(_BYTE *)(a5 + *(int *)(v11 + 32)) = a4;
  return result;
}

uint64_t MatterAddDeviceRequest.perform()()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 120) = v0;
  return swift_task_switch();
}

uint64_t sub_2345035BC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = v0[15];
  sub_23452BCE0();
  sub_23452BB3C();
  v0[16] = objc_msgSend(objc_allocWithZone((Class)MTSDeviceSetupManager), sel_init);
  v2 = swift_task_alloc();
  v0[17] = v2;
  *(_QWORD *)(v2 + 16) = v1;
  v3 = (_QWORD *)swift_task_alloc();
  v0[18] = v3;
  *v3 = v0;
  v3[1] = sub_23450369C;
  return sub_23452BF68();
}

uint64_t sub_23450369C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 152) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_234503708()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  unint64_t v3;
  void *v4;
  uint64_t v6;
  unint64_t v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  _QWORD *v13;

  v1 = *(void **)(v0 + 152);
  sub_23452BAD0();
  swift_allocObject();
  sub_23452BAC4();
  type metadata accessor for MatterAddDeviceRequest(0);
  sub_234506620(&qword_25615E9D0, type metadata accessor for MatterAddDeviceRequest, (uint64_t)&protocol conformance descriptor for MatterAddDeviceRequest);
  v2 = sub_23452BAB8();
  *(_QWORD *)(v0 + 160) = v2;
  *(_QWORD *)(v0 + 168) = v3;
  if (v1)
  {

    swift_release();
LABEL_3:
    v4 = *(void **)(v0 + 128);
    objc_msgSend((id)objc_opt_self(), sel_mts_errorWithCode_, 2);
    swift_willThrow();

    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  v6 = v2;
  v7 = v3;
  swift_release();
  v8 = objc_allocWithZone((Class)MTSDeviceSetupRequest);
  sub_23450081C(v6, v7);
  v9 = (void *)sub_23452BAF4();
  v10 = objc_msgSend(v8, sel_initWithSerializedRequest_, v9);
  *(_QWORD *)(v0 + 176) = v10;
  sub_2345011D4(v6, v7);

  if (!v10)
  {
    sub_2345011D4(v6, v7);
    goto LABEL_3;
  }
  v11 = *(void **)(v0 + 128);
  *(_QWORD *)(v0 + 16) = v0;
  *(_QWORD *)(v0 + 24) = sub_23450392C;
  v12 = swift_continuation_init();
  *(_QWORD *)(v0 + 80) = MEMORY[0x24BDAC760];
  v13 = (_QWORD *)(v0 + 80);
  v13[1] = 0x40000000;
  v13[2] = sub_234503A30;
  v13[3] = &block_descriptor;
  v13[4] = v12;
  objc_msgSend(v11, sel_performDeviceSetupUsingRequest_completionHandler_, v10, v13);
  return swift_continuation_await();
}

uint64_t sub_2345038F4()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 128);
  swift_task_dealloc();

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23450392C()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 184) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_23450398C()
{
  uint64_t v0;
  void *v1;
  void *v2;

  v1 = *(void **)(v0 + 176);
  v2 = *(void **)(v0 + 128);
  sub_2345011D4(*(_QWORD *)(v0 + 160), *(_QWORD *)(v0 + 168));

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2345039D0()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  unint64_t v3;
  void *v4;

  v1 = *(void **)(v0 + 176);
  v2 = *(_QWORD *)(v0 + 160);
  v3 = *(_QWORD *)(v0 + 168);
  v4 = *(void **)(v0 + 128);
  swift_willThrow();
  sub_2345011D4(v2, v3);

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_234503A30(uint64_t a1, void *a2)
{
  _QWORD *v3;
  id v4;

  if (!a2)
    return swift_continuation_throwingResume();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25615ECF0);
  swift_allocError();
  *v3 = a2;
  v4 = a2;
  return swift_continuation_throwingResumeWithError();
}

uint64_t sub_234503AA4(void *a1)
{
  uint64_t v1;
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
  id v15;
  _QWORD v16[3];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25615ECE0);
  v4 = MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)v16 - v7;
  v9 = __swift_instantiateConcreteTypeFromMangledName(qword_25615EB20);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = v1
      + OBJC_IVAR____TtCV13MatterSupport22MatterAddDeviceRequestP33_1A83A92E88F6D049FA318E551745945D24FirstOneWinsContinuation_continuation;
  swift_beginAccess();
  sub_234507D44(v13, (uint64_t)v8, &qword_25615ECE0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
    return sub_23450822C((uint64_t)v8, &qword_25615ECE0);
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v12, v8, v9);
  v16[0] = a1;
  v15 = a1;
  sub_23452BC8C();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v6, 1, 1, v9);
  swift_beginAccess();
  sub_234507D88((uint64_t)v6, v13);
  return swift_endAccess();
}

uint64_t sub_234503C5C()
{
  uint64_t v0;

  sub_23450822C(v0+ OBJC_IVAR____TtCV13MatterSupport22MatterAddDeviceRequestP33_1A83A92E88F6D049FA318E551745945D24FirstOneWinsContinuation_continuation, &qword_25615ECE0);
  swift_defaultActor_destroy();
  return swift_defaultActor_deallocate();
}

uint64_t sub_234503C90()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_234503C9C(uint64_t a1, uint64_t a2)
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
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  v35 = a2;
  v36 = a1;
  v2 = type metadata accessor for MatterAddDeviceRequest(0);
  v3 = *(_QWORD *)(*(_QWORD *)(v2 - 8) + 64);
  v39 = *(_QWORD *)(v2 - 8);
  v40 = v3;
  MEMORY[0x24BDAC7A8](v2);
  v38 = (uint64_t)&v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25615ECE0);
  MEMORY[0x24BDAC7A8](v5);
  v37 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(qword_25615EB20);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v34 = (char *)&v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_23452BD04();
  v32 = *(_QWORD *)(v10 - 8);
  v33 = v10;
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_23452BCF8();
  MEMORY[0x24BDAC7A8](v13);
  v14 = sub_23452BBF0();
  MEMORY[0x24BDAC7A8](v14);
  v15 = sub_23452BB90();
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v32 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23452BCC8();
  v19 = MEMORY[0x24BEE4AF8];
  sub_23452BB3C();
  strcpy(v18, "_matter._tcp");
  v18[13] = 0;
  *((_WORD *)v18 + 7) = -5120;
  *((_QWORD *)v18 + 2) = 0;
  *((_QWORD *)v18 + 3) = 0;
  (*(void (**)(char *, _QWORD, uint64_t))(v16 + 104))(v18, *MEMORY[0x24BDE06A8], v15);
  sub_23452BB78();
  sub_23452BB6C();
  sub_23452BBD8();
  swift_allocObject();
  v20 = sub_23452BBA8();
  sub_234507DD0(0, &qword_25615ECF8);
  sub_23452BBE4();
  v41 = v19;
  sub_234506620(&qword_25615ED00, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688], MEMORY[0x24BEE5698]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25615ED08);
  sub_234507E08();
  sub_23452BD70();
  (*(void (**)(char *, _QWORD, uint64_t))(v32 + 104))(v12, *MEMORY[0x24BEE5750], v33);
  v21 = (void *)sub_23452BD10();
  v22 = v34;
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v34, v36, v7);
  type metadata accessor for MatterAddDeviceRequest.FirstOneWinsContinuation(0);
  v23 = swift_allocObject();
  swift_defaultActor_initialize();
  v24 = v23
      + OBJC_IVAR____TtCV13MatterSupport22MatterAddDeviceRequestP33_1A83A92E88F6D049FA318E551745945D24FirstOneWinsContinuation_continuation;
  v25 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 56);
  v25(v23+ OBJC_IVAR____TtCV13MatterSupport22MatterAddDeviceRequestP33_1A83A92E88F6D049FA318E551745945D24FirstOneWinsContinuation_continuation, 1, 1, v7);
  v26 = (uint64_t)v37;
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v37, v22, v7);
  v25(v26, 0, 1, v7);
  swift_beginAccess();
  sub_234507D88(v26, v24);
  swift_endAccess();
  v27 = v38;
  sub_234507C24(v35, v38, type metadata accessor for MatterAddDeviceRequest);
  v28 = (*(unsigned __int8 *)(v39 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v39 + 80);
  v29 = (v40 + v28 + 7) & 0xFFFFFFFFFFFFFFF8;
  v30 = swift_allocObject();
  sub_234507CA4(v27, v30 + v28, type metadata accessor for MatterAddDeviceRequest);
  *(_QWORD *)(v30 + v29) = v20;
  *(_QWORD *)(v30 + ((v29 + 15) & 0xFFFFFFFFFFFFFFF8)) = v23;
  swift_retain();
  swift_retain();
  sub_23452BB9C();
  sub_23452BBC0();
  swift_release();

  return swift_release();
}

uint64_t sub_234504154(uint64_t a1)
{
  uint64_t v1;

  return sub_234503C9C(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_23450415C(uint64_t a1, NSObject **a2, uint64_t a3, uint64_t a4)
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
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  char *v23;
  os_log_type_t v24;
  NSObject *v25;
  void (*v26)(char *, uint64_t, uint64_t);
  _BOOL4 v27;
  uint8_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  void (*v33)(char *, uint64_t);
  uint64_t v34;
  char *v35;
  uint64_t result;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  os_log_type_t v40;
  NSObject *v41;
  void (*v42)(char *, char *, uint64_t);
  char *v43;
  os_log_type_t v44;
  uint8_t *v45;
  _QWORD *v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD *v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  char *v58;
  unint64_t v59;
  _QWORD *v60;
  uint64_t v61;
  uint64_t v62;
  _QWORD *v63;
  _QWORD v64[2];
  NSObject **v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;

  v72 = a4;
  v70 = a3;
  v76 = sub_23452BB84();
  v67 = *(_QWORD *)(v76 - 8);
  v6 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v69 = (char *)v64 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)v64 - v9;
  v68 = v11;
  MEMORY[0x24BDAC7A8](v8);
  v75 = (char *)v64 - v12;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_25615ED18);
  MEMORY[0x24BDAC7A8](v13);
  v71 = (char *)v64 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_23452BBB4();
  v16 = *(_QWORD *)(v15 - 8);
  v17 = MEMORY[0x24BDAC7A8](v15);
  v74 = (char *)v64 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)v64 - v20;
  MEMORY[0x24BDAC7A8](v19);
  v23 = (char *)v64 - v22;
  v24 = sub_23452BCC8();
  v25 = *a2;
  v26 = *(void (**)(char *, uint64_t, uint64_t))(v16 + 16);
  v73 = a1;
  v26(v23, a1, v15);
  v27 = os_log_type_enabled(v25, v24);
  v66 = v10;
  if (v27)
  {
    v28 = (uint8_t *)swift_slowAlloc();
    v29 = swift_slowAlloc();
    v65 = a2;
    v30 = v29;
    v78 = v29;
    *(_DWORD *)v28 = 136315138;
    v64[1] = v28 + 4;
    v26(v21, (uint64_t)v23, v15);
    v31 = sub_23452BC2C();
    v77 = sub_23451879C(v31, v32, &v78);
    sub_23452BD4C();
    swift_bridgeObjectRelease();
    v33 = *(void (**)(char *, uint64_t))(v16 + 8);
    v33(v23, v15);
    _os_log_impl(&dword_2344FE000, v25, v24, "TCC state %s", v28, 0xCu);
    swift_arrayDestroy();
    v34 = v30;
    a2 = v65;
    MEMORY[0x23493FE58](v34, -1, -1);
    MEMORY[0x23493FE58](v28, -1, -1);
  }
  else
  {
    v33 = *(void (**)(char *, uint64_t))(v16 + 8);
    v33(v23, v15);
  }
  v35 = v74;
  v26(v74, v73, v15);
  result = (*(uint64_t (**)(char *, uint64_t))(v16 + 88))(v35, v15);
  if ((_DWORD)result == *MEMORY[0x24BDE0700])
  {
    (*(void (**)(char *, uint64_t))(v16 + 96))(v35, v15);
    v37 = v67;
    v38 = v75;
    v39 = v76;
    v74 = *(char **)(v67 + 32);
    ((void (*)(char *, char *, uint64_t))v74)(v75, v35, v76);
    v40 = sub_23452BCD4();
    v41 = *a2;
    v42 = *(void (**)(char *, char *, uint64_t))(v37 + 16);
    v43 = v66;
    v42(v66, v38, v39);
    v44 = v40;
    if (os_log_type_enabled(v41, v40))
    {
      v45 = (uint8_t *)swift_slowAlloc();
      v46 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v45 = 138412290;
      sub_234506620(&qword_25615ED40, (uint64_t (*)(uint64_t))MEMORY[0x24BDE0688], MEMORY[0x24BDE0698]);
      swift_allocError();
      v42(v47, v43, v76);
      v48 = _swift_stdlib_bridgeErrorToNSError();
      v78 = v48;
      sub_23452BD4C();
      *v46 = v48;
      v39 = v76;
      v33 = *(void (**)(char *, uint64_t))(v37 + 8);
      v33(v43, v76);
      _os_log_impl(&dword_2344FE000, v41, v44, "Local browse failed; unable to start an add device operation (error: %@)",
        v45,
        0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_25615ED48);
      swift_arrayDestroy();
      MEMORY[0x23493FE58](v46, -1, -1);
      MEMORY[0x23493FE58](v45, -1, -1);
    }
    else
    {
      v33 = *(void (**)(char *, uint64_t))(v37 + 8);
      v33(v43, v39);
    }
    v54 = v37;
    sub_23452BBCC();
    v55 = sub_23452BCB0();
    v56 = (uint64_t)v71;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v55 - 8) + 56))(v71, 1, 1, v55);
    v57 = v69;
    v58 = v75;
    v42(v69, v75, v39);
    v59 = (*(unsigned __int8 *)(v54 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v54 + 80);
    v60 = (_QWORD *)swift_allocObject();
    v60[2] = 0;
    v60[3] = 0;
    v60[4] = v72;
    ((void (*)(char *, char *, uint64_t))v74)((char *)v60 + v59, v57, v39);
    swift_retain();
    sub_234504A2C(v56, (uint64_t)&unk_25615ED38, (uint64_t)v60);
    swift_release();
    v52 = v58;
    v53 = v39;
    return ((uint64_t (*)(char *, uint64_t))v33)(v52, v53);
  }
  if ((_DWORD)result == *MEMORY[0x24BDE0708])
  {
    sub_23452BCD4();
    sub_23452BB3C();
    sub_23452BBCC();
    v49 = sub_23452BCB0();
    v50 = (uint64_t)v71;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v49 - 8) + 56))(v71, 1, 1, v49);
    v51 = (_QWORD *)swift_allocObject();
    v51[2] = 0;
    v51[3] = 0;
    v51[4] = v72;
    swift_retain();
    sub_234504A2C(v50, (uint64_t)&unk_25615ED28, (uint64_t)v51);
    swift_release();
LABEL_9:
    v52 = v35;
    v53 = v15;
    return ((uint64_t (*)(char *, uint64_t))v33)(v52, v53);
  }
  if ((_DWORD)result != *MEMORY[0x24BDE06F8])
  {
    if ((_DWORD)result == *MEMORY[0x24BDE06F0])
    {
      sub_23452BCC8();
      sub_23452BB3C();
      sub_23452BBCC();
      v61 = sub_23452BCB0();
      v62 = (uint64_t)v71;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v61 - 8) + 56))(v71, 1, 1, v61);
      v63 = (_QWORD *)swift_allocObject();
      v63[2] = 0;
      v63[3] = 0;
      v63[4] = v72;
      swift_retain();
      sub_234504A2C(v62, (uint64_t)&unk_25615ED58, (uint64_t)v63);
      return swift_release();
    }
    if ((_DWORD)result != *MEMORY[0x24BDE0710])
      goto LABEL_9;
  }
  return result;
}

uint64_t sub_234504854(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;

  v4[8] = a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25615ECE0);
  v4[9] = swift_task_alloc();
  v4[10] = swift_task_alloc();
  v5 = __swift_instantiateConcreteTypeFromMangledName(qword_25615EB20);
  v4[11] = v5;
  v4[12] = *(_QWORD *)(v5 - 8);
  v4[13] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2345048F0()
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

  v1 = *(_QWORD *)(v0 + 88);
  v2 = *(_QWORD *)(v0 + 96);
  v3 = *(_QWORD *)(v0 + 80);
  v4 = *(_QWORD *)(v0 + 64)
     + OBJC_IVAR____TtCV13MatterSupport22MatterAddDeviceRequestP33_1A83A92E88F6D049FA318E551745945D24FirstOneWinsContinuation_continuation;
  swift_beginAccess();
  sub_234507D44(v4, v3, &qword_25615ECE0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    sub_23450822C(*(_QWORD *)(v0 + 80), &qword_25615ECE0);
  }
  else
  {
    v6 = *(_QWORD *)(v0 + 96);
    v5 = *(_QWORD *)(v0 + 104);
    v7 = *(_QWORD *)(v0 + 88);
    v8 = *(_QWORD *)(v0 + 72);
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v6 + 32))(v5, *(_QWORD *)(v0 + 80), v7);
    sub_23452BC98();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 56))(v8, 1, 1, v7);
    swift_beginAccess();
    sub_234507D88(v8, v4);
    swift_endAccess();
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_234504A2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_23452BCB0();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_23452BCA4();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_23450822C(a1, &qword_25615ED18);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_23452BC80();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_234504B78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;

  v5[9] = a4;
  v5[10] = a5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25615ECE0);
  v5[11] = swift_task_alloc();
  v5[12] = swift_task_alloc();
  v6 = __swift_instantiateConcreteTypeFromMangledName(qword_25615EB20);
  v5[13] = v6;
  v5[14] = *(_QWORD *)(v6 - 8);
  v5[15] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_234504C10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 80);
  v2 = sub_23452BB84();
  sub_234506620(&qword_25615ED40, (uint64_t (*)(uint64_t))MEMORY[0x24BDE0688], MEMORY[0x24BDE0698]);
  *(_QWORD *)(v0 + 128) = swift_allocError();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v3, v1, v2);
  return swift_task_switch();
}

uint64_t sub_234504CA8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v1 = *(_QWORD *)(v0 + 104);
  v2 = *(_QWORD *)(v0 + 112);
  v3 = *(_QWORD *)(v0 + 96);
  v4 = *(_QWORD *)(v0 + 72)
     + OBJC_IVAR____TtCV13MatterSupport22MatterAddDeviceRequestP33_1A83A92E88F6D049FA318E551745945D24FirstOneWinsContinuation_continuation;
  swift_beginAccess();
  sub_234507D44(v4, v3, &qword_25615ECE0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    sub_23450822C(*(_QWORD *)(v0 + 96), &qword_25615ECE0);
  }
  else
  {
    v6 = *(_QWORD *)(v0 + 120);
    v5 = *(void **)(v0 + 128);
    v7 = *(_QWORD *)(v0 + 104);
    v8 = *(_QWORD *)(v0 + 112);
    v9 = *(_QWORD *)(v0 + 88);
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v8 + 32))(v6, *(_QWORD *)(v0 + 96), v7);
    *(_QWORD *)(v0 + 64) = v5;
    v10 = v5;
    sub_23452BC8C();
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 56))(v9, 1, 1, v7);
    swift_beginAccess();
    sub_234507D88(v9, v4);
    swift_endAccess();
  }

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_234504E0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 16) = a4;
  return swift_task_switch();
}

uint64_t sub_234504E24()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 24) = objc_msgSend((id)objc_opt_self(), sel_mts_errorWithCode_, 3);
  return swift_task_switch();
}

uint64_t sub_234504E84()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 24);
  sub_234503AA4(v1);

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t MatterAddDeviceRequest.hash(into:)()
{
  id *v0;
  id *v1;
  id v2;
  _QWORD *v3;
  uint64_t v4;
  _QWORD *v5;
  id v6;
  id v7;

  v1 = v0;
  v2 = *v0;
  sub_23452BD28();

  v3 = v1[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_23452BC38();
  sub_23452BF98();
  v4 = v3[2];
  if (v4)
  {
    v5 = v3 + 5;
    do
    {
      swift_bridgeObjectRetain();
      sub_23452BC38();
      swift_bridgeObjectRelease();
      v5 += 2;
      --v4;
    }
    while (v4);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v6 = v1[4];
  sub_23452BFA4();
  if (v6)
  {
    v7 = v6;
    sub_23452BD28();

  }
  type metadata accessor for MatterAddDeviceRequest(0);
  MatterAddDeviceRequest.DeviceCriteria.hash(into:)();
  return sub_23452BFA4();
}

uint64_t MatterAddDeviceRequest.hashValue.getter()
{
  sub_23452BF8C();
  MatterAddDeviceRequest.hash(into:)();
  return sub_23452BFC8();
}

uint64_t sub_234505030(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_234505068 + 4 * byte_23452E540[a1]))(0xD000000000000012, 0x8000000234530970);
}

uint64_t sub_234505068()
{
  return 0x79676F6C6F706F74;
}

uint64_t sub_234505094()
{
  return 0x7961507075746573;
}

uint64_t sub_2345050B4(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_2345050EC + 4 * byte_23452E544[a1]))(0xD000000000000012, 0x8000000234530970);
}

uint64_t sub_2345050EC()
{
  return 0x79676F6C6F706F74;
}

uint64_t sub_234505118()
{
  return 0x7961507075746573;
}

uint64_t sub_234505138()
{
  sub_23452BF8C();
  MatterAddDeviceRequest.hash(into:)();
  return sub_23452BFC8();
}

uint64_t sub_234505178()
{
  sub_23452BF8C();
  MatterAddDeviceRequest.hash(into:)();
  return sub_23452BFC8();
}

void sub_2345051B4(char *a1)
{
  sub_234512C20(*a1);
}

void sub_2345051C0()
{
  char *v0;

  sub_234512D80(*v0);
}

void sub_2345051C8(uint64_t a1)
{
  char *v1;

  sub_234512EFC(a1, *v1);
}

void sub_2345051D0(uint64_t a1)
{
  char *v1;

  sub_234512FA0(a1, *v1);
}

uint64_t sub_2345051D8@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_2345074FC();
  *a1 = result;
  return result;
}

uint64_t sub_234505204@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_234505030(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_23450522C()
{
  unsigned __int8 *v0;

  return sub_2345050B4(*v0);
}

uint64_t sub_234505234@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_2345074FC();
  *a1 = result;
  return result;
}

void sub_234505258(_BYTE *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_234505264()
{
  sub_234506598();
  return sub_23452C01C();
}

uint64_t sub_23450528C()
{
  sub_234506598();
  return sub_23452C028();
}

uint64_t MatterAddDeviceRequest.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
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
  uint64_t v14;
  char *v15;
  uint64_t v16;
  unint64_t v17;
  char *v18;
  uint64_t v19;
  int v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t *v32;
  _QWORD *v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  int v37;
  char v38;

  v32 = a2;
  v4 = type metadata accessor for MatterAddDeviceRequest.DeviceCriteria(0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25615E9D8);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = a1[3];
  v33 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v11);
  sub_234506598();
  sub_23452C004();
  if (!v2)
  {
    v12 = v8;
    v13 = (uint64_t)v6;
    v38 = 0;
    sub_2345065DC();
    sub_23452BE90();
    v14 = v7;
    v15 = v10;
    v16 = v34;
    v17 = v35;
    v18 = v15;
    v19 = v36;
    LOBYTE(v34) = 2;
    sub_234506620((unint64_t *)&unk_25615E9F0, type metadata accessor for MatterAddDeviceRequest.DeviceCriteria, (uint64_t)&protocol conformance descriptor for MatterAddDeviceRequest.DeviceCriteria);
    sub_23452BE90();
    LOBYTE(v34) = 3;
    v21 = sub_23452BE78();
    v38 = 1;
    sub_234502D48();
    sub_23452BE60();
    v37 = v21;
    v29 = v16;
    v30 = v17;
    v31 = v18;
    v22 = v35;
    if (v35 >> 60 == 15)
    {
      v23 = 0;
    }
    else
    {
      v25 = v34;
      sub_234507DD0(0, &qword_25615EA00);
      sub_234507DD0(0, &qword_25615EA08);
      v23 = sub_23452BCEC();
      sub_234506660(v25, v22);
    }
    v24 = v32;
    v26 = type metadata accessor for MatterAddDeviceRequest(0);
    sub_234507C24(v13, (uint64_t)v24 + *(int *)(v26 + 28), type metadata accessor for MatterAddDeviceRequest.DeviceCriteria);
    sub_234507DD0(0, &qword_25615E9C0);
    v27 = sub_23452BD34();
    v28 = v29;
    *v24 = v27;
    v24[1] = v28;
    v24[2] = v30;
    v24[3] = v19;
    v24[4] = v23;
    *((_BYTE *)v24 + *(int *)(v26 + 32)) = v37 & 1;
    sub_234507C68(v13, type metadata accessor for MatterAddDeviceRequest.DeviceCriteria);
    (*(void (**)(char *, uint64_t))(v12 + 8))(v31, v14);
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v33);
}

uint64_t MatterAddDeviceRequest.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  uint64_t v19;
  char v20;
  id v21;
  __int128 v22;
  uint64_t v23;

  v3 = v1;
  v23 = *MEMORY[0x24BDAC8D0];
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25615EA10);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_234506598();
  sub_23452C010();
  v21 = *(id *)(v3 + 8);
  v22 = *(_OWORD *)(v3 + 16);
  v20 = 0;
  sub_234506674();
  sub_23452BF08();
  if (v2)
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  type metadata accessor for MatterAddDeviceRequest(0);
  LOBYTE(v21) = 2;
  type metadata accessor for MatterAddDeviceRequest.DeviceCriteria(0);
  sub_234506620((unint64_t *)&unk_25615EA20, type metadata accessor for MatterAddDeviceRequest.DeviceCriteria, (uint64_t)&protocol conformance descriptor for MatterAddDeviceRequest.DeviceCriteria);
  sub_23452BF08();
  LOBYTE(v21) = 3;
  sub_23452BEF0();
  v10 = *(void **)(v3 + 32);
  if (!v10)
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v11 = (void *)objc_opt_self();
  v21 = 0;
  v12 = v10;
  v13 = objc_msgSend(v11, sel_archivedDataWithRootObject_requiringSecureCoding_error_, v12, 1, &v21);
  v14 = v21;
  if (!v13)
  {
    v18 = v14;
    sub_23452BAE8();

    swift_willThrow();
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  v15 = (void *)sub_23452BB00();
  v17 = v16;

  v21 = v15;
  *(_QWORD *)&v22 = v17;
  v20 = 1;
  sub_234502CC0();
  sub_23452BF08();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

  return sub_2345011D4((uint64_t)v15, v17);
}

uint64_t sub_234505950@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return MatterAddDeviceRequest.init(from:)(a1, a2);
}

uint64_t sub_234505964(_QWORD *a1)
{
  return MatterAddDeviceRequest.encode(to:)(a1);
}

BOOL sub_234505B74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unint64_t a7, uint64_t a8)
{
  uint64_t v12;
  uint64_t v13;
  char *v14;
  int *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  char v21;
  char v22;
  uint64_t v23;
  char *v24;
  char *v25;
  char *v26;
  uint64_t v27;
  uint64_t *v28;
  char v29;
  _BOOL8 v30;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char v38;

  v36 = a5;
  v34 = a3;
  v35 = a4;
  v33 = a1;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_25615ECC8);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v32 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = (int *)_s14DeviceCriteriaO17DeviceDescriptionVMa(0);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v32 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = 0;
  v19 = 0xF000000000000000;
  v20 = 0;
  if (a7 >> 60 != 15 && a8)
  {
    v37 = 0;
    v38 = 1;
    sub_23450081C(a6, a7);
    sub_23452BFF8();
    if (v38 == 1)
    {
      sub_234506660(a6, a7);
      v18 = 0;
      v20 = 0;
    }
    else
    {
      v20 = v37;
      v18 = a6;
      v19 = a7;
    }
  }
  sub_234507D44(v33, (uint64_t)v14, &qword_25615ECC8);
  v21 = 1;
  if (a2)
  {
    v37 = 0;
    v38 = 1;
    sub_23452BCBC();
    a2 = v37;
    v21 = v38;
  }
  v22 = 1;
  if (v34)
  {
    v37 = 0;
    v38 = 1;
    sub_23452BCBC();
    v23 = v37;
    v22 = v38;
  }
  else
  {
    v23 = 0;
  }
  sub_234507CE8((uint64_t)v14, (uint64_t)v17);
  v24 = &v17[v15[5]];
  *(_QWORD *)v24 = a2;
  v24[8] = v21;
  v25 = &v17[v15[6]];
  *(_QWORD *)v25 = v23;
  v25[8] = v22;
  v26 = &v17[v15[7]];
  v27 = v36;
  *(_QWORD *)v26 = v35;
  *((_QWORD *)v26 + 1) = v27;
  v28 = (uint64_t *)&v17[v15[8]];
  *v28 = v18;
  v28[1] = v19;
  v28[2] = v20;
  type metadata accessor for MatterAddDeviceRequest(0);
  swift_bridgeObjectRetain();
  sub_234507D30(v18, v19);
  sub_23450B470();
  v30 = (v29 & 1) == 0;
  sub_234506660(v18, v19);
  sub_234507C68((uint64_t)v17, _s14DeviceCriteriaO17DeviceDescriptionVMa);
  return v30;
}

id sub_234505F94(uint64_t a1, uint64_t a2, void (*a3)(char *, uint64_t))
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t (*v8)(_QWORD);
  void *v9;
  uint64_t v11;

  v5 = type metadata accessor for MatterAddDeviceRequest(0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_234507C24(a1+ OBJC_IVAR____TtCV13MatterSupport22MatterAddDeviceRequestP33_1A83A92E88F6D049FA318E551745945D7Wrapper_wrappedRequest, (uint64_t)v7, v8);
  a3(v7, v5);
  v9 = (void *)sub_23452BC14();
  swift_bridgeObjectRelease();
  return v9;
}

uint64_t sub_234506098(uint64_t a1)
{
  uint64_t v1;
  char v2;
  char *v4;
  _BYTE v5[24];
  uint64_t v6;

  sub_234507D44(a1, (uint64_t)v5, &qword_25615ECD0);
  if (!v6)
  {
    sub_23450822C((uint64_t)v5, &qword_25615ECD0);
    goto LABEL_5;
  }
  type metadata accessor for MatterAddDeviceRequest.Wrapper(0);
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_5:
    v2 = 0;
    return v2 & 1;
  }
  v2 = _s13MatterSupport0A16AddDeviceRequestV2eeoiySbAC_ACtFZ_0((_QWORD *)(v1+ OBJC_IVAR____TtCV13MatterSupport22MatterAddDeviceRequestP33_1A83A92E88F6D049FA318E551745945D7Wrapper_wrappedRequest), &v4[OBJC_IVAR____TtCV13MatterSupport22MatterAddDeviceRequestP33_1A83A92E88F6D049FA318E551745945D7Wrapper_wrappedRequest]);

  return v2 & 1;
}

id sub_2345061E8()
{
  return sub_23450637C(0, (uint64_t (*)(void))type metadata accessor for MatterAddDeviceRequest.Wrapper);
}

id sub_234506370(uint64_t a1)
{
  return sub_23450637C(a1, type metadata accessor for MTDeviceSetupRequestFactory);
}

id sub_23450637C(uint64_t a1, uint64_t (*a2)(void))
{
  void *v2;
  objc_super v4;

  v4.receiver = v2;
  v4.super_class = (Class)a2();
  return objc_msgSendSuper2(&v4, sel_dealloc);
}

uint64_t sub_2345063AC(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_234506410;
  return v6(a1);
}

uint64_t sub_234506410()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t _s13MatterSupport0A16AddDeviceRequestV2eeoiySbAC_ACtFZ_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  char v7;
  char v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  char v13;
  uint64_t v14;
  char v15;

  sub_234507DD0(0, &qword_25615ECE8);
  if ((sub_23452BD1C() & 1) == 0)
    goto LABEL_15;
  v4 = a1[3];
  v5 = a2[3];
  v6 = a1[1] == a2[1] && a1[2] == a2[2];
  if (v6 || (v7 = sub_23452BF5C(), v8 = 0, (v7 & 1) != 0))
  {
    if ((sub_23450A5F8(v4, v5) & 1) != 0)
    {
      v9 = (void *)a1[4];
      v10 = (void *)a2[4];
      if (v9)
      {
        if (!v10)
          goto LABEL_15;
        sub_234507DD0(0, &qword_25615EA08);
        v11 = v10;
        v12 = v9;
        v13 = sub_23452BD1C();

        if ((v13 & 1) == 0)
          goto LABEL_15;
      }
      else if (v10)
      {
        goto LABEL_15;
      }
      v14 = type metadata accessor for MatterAddDeviceRequest(0);
      static MatterAddDeviceRequest.DeviceCriteria.== infix(_:_:)((uint64_t)a1 + *(int *)(v14 + 28), (uint64_t)a2 + *(int *)(v14 + 28));
      if ((v15 & 1) != 0)
      {
        v8 = *((_BYTE *)a1 + *(int *)(v14 + 32)) ^ *((_BYTE *)a2 + *(int *)(v14 + 32)) ^ 1;
        return v8 & 1;
      }
    }
LABEL_15:
    v8 = 0;
  }
  return v8 & 1;
}

unint64_t sub_234506598()
{
  unint64_t result;

  result = qword_25615E9E0;
  if (!qword_25615E9E0)
  {
    result = MEMORY[0x23493FDE0](&unk_23452E850, &type metadata for MatterAddDeviceRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25615E9E0);
  }
  return result;
}

unint64_t sub_2345065DC()
{
  unint64_t result;

  result = qword_25615E9E8;
  if (!qword_25615E9E8)
  {
    result = MEMORY[0x23493FDE0](&protocol conformance descriptor for MatterAddDeviceRequest.Topology, &type metadata for MatterAddDeviceRequest.Topology);
    atomic_store(result, (unint64_t *)&qword_25615E9E8);
  }
  return result;
}

uint64_t sub_234506620(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x23493FDE0](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_234506660(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_2345011D4(a1, a2);
  return a1;
}

unint64_t sub_234506674()
{
  unint64_t result;

  result = qword_25615EA18;
  if (!qword_25615EA18)
  {
    result = MEMORY[0x23493FDE0](&protocol conformance descriptor for MatterAddDeviceRequest.Topology, &type metadata for MatterAddDeviceRequest.Topology);
    atomic_store(result, (unint64_t *)&qword_25615EA18);
  }
  return result;
}

uint64_t sub_2345066B8()
{
  return sub_234506620(&qword_25615EA30, type metadata accessor for MatterAddDeviceRequest, (uint64_t)&protocol conformance descriptor for MatterAddDeviceRequest);
}

char *initializeBufferWithCopyOfBuffer for MatterAddDeviceRequest(char *a1, char **a2, uint64_t a3)
{
  int v3;
  char *v4;
  char *v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;

  v3 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v4 = *a2;
  *(_QWORD *)a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v7 = &v4[(v3 + 16) & ~(unint64_t)v3];
    swift_retain();
  }
  else
  {
    v7 = a1;
    v8 = a2[2];
    *((_QWORD *)a1 + 1) = a2[1];
    *((_QWORD *)a1 + 2) = v8;
    v9 = a2[4];
    *((_QWORD *)a1 + 3) = a2[3];
    *((_QWORD *)a1 + 4) = v9;
    v10 = *(int *)(a3 + 28);
    v11 = (uint64_t *)&a1[v10];
    v12 = (uint64_t *)((char *)a2 + v10);
    v13 = type metadata accessor for MatterAddDeviceRequest.DeviceCriteria(0);
    v14 = v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v15 = v9;
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
      case 1u:
      case 2u:
        *v11 = *v12;
        swift_retain();
        goto LABEL_9;
      case 3u:
        v16 = sub_23452BB30();
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v11, v12, v16);
        goto LABEL_9;
      case 6u:
        v17 = v12[1];
        *v11 = *v12;
        v11[1] = v17;
        swift_bridgeObjectRetain();
        goto LABEL_9;
      case 7u:
        v18 = *v12;
        v19 = v12[1];
        sub_23450081C(*v12, v19);
        *v11 = v18;
        v11[1] = v19;
        v11[2] = v12[2];
LABEL_9:
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
        break;
    }
    v7[*(int *)(a3 + 32)] = *((_BYTE *)a2 + *(int *)(a3 + 32));
  }
  return v7;
}

uint64_t destroy for MatterAddDeviceRequest(id *a1, uint64_t a2)
{
  char *v4;
  uint64_t result;
  uint64_t v6;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  v4 = (char *)a1 + *(int *)(a2 + 28);
  type metadata accessor for MatterAddDeviceRequest.DeviceCriteria(0);
  result = swift_getEnumCaseMultiPayload();
  switch((int)result)
  {
    case 0:
    case 1:
    case 2:
      result = swift_release();
      break;
    case 3:
      v6 = sub_23452BB30();
      result = (*(uint64_t (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v4, v6);
      break;
    case 6:
      result = swift_bridgeObjectRelease();
      break;
    case 7:
      result = sub_2345011D4(*(_QWORD *)v4, *((_QWORD *)v4 + 1));
      break;
    default:
      return result;
  }
  return result;
}

_QWORD *initializeWithCopy for MatterAddDeviceRequest(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;

  v7 = *(void **)a2;
  v6 = *(_QWORD *)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v6;
  v8 = *(_QWORD *)(a2 + 24);
  a1[2] = *(_QWORD *)(a2 + 16);
  a1[3] = v8;
  v9 = *(void **)(a2 + 32);
  a1[4] = v9;
  v10 = *(int *)(a3 + 28);
  v11 = (_QWORD *)((char *)a1 + v10);
  v12 = (uint64_t *)(a2 + v10);
  v13 = type metadata accessor for MatterAddDeviceRequest.DeviceCriteria(0);
  v14 = v7;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v15 = v9;
  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
    case 1u:
    case 2u:
      *v11 = *v12;
      swift_retain();
      goto LABEL_7;
    case 3u:
      v16 = sub_23452BB30();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v11, v12, v16);
      goto LABEL_7;
    case 6u:
      v17 = v12[1];
      *v11 = *v12;
      v11[1] = v17;
      swift_bridgeObjectRetain();
      goto LABEL_7;
    case 7u:
      v18 = *v12;
      v19 = v12[1];
      sub_23450081C(*v12, v19);
      *v11 = v18;
      v11[1] = v19;
      v11[2] = v12[2];
LABEL_7:
      swift_storeEnumTagMultiPayload();
      break;
    default:
      memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
      break;
  }
  *((_BYTE *)a1 + *(int *)(a3 + 32)) = *(_BYTE *)(a2 + *(int *)(a3 + 32));
  return a1;
}

uint64_t assignWithCopy for MatterAddDeviceRequest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;

  v6 = *(void **)a2;
  v7 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v8 = v6;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v9 = *(void **)(a1 + 32);
  v10 = *(void **)(a2 + 32);
  *(_QWORD *)(a1 + 32) = v10;
  v11 = v10;

  if (a1 != a2)
  {
    v12 = *(int *)(a3 + 28);
    v13 = (uint64_t *)(a1 + v12);
    v14 = (uint64_t *)(a2 + v12);
    sub_234507C68(a1 + v12, type metadata accessor for MatterAddDeviceRequest.DeviceCriteria);
    v15 = type metadata accessor for MatterAddDeviceRequest.DeviceCriteria(0);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
      case 1u:
      case 2u:
        *v13 = *v14;
        swift_retain();
        goto LABEL_8;
      case 3u:
        v16 = sub_23452BB30();
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v13, v14, v16);
        goto LABEL_8;
      case 6u:
        *v13 = *v14;
        v13[1] = v14[1];
        swift_bridgeObjectRetain();
        goto LABEL_8;
      case 7u:
        v17 = *v14;
        v18 = v14[1];
        sub_23450081C(*v14, v18);
        *v13 = v17;
        v13[1] = v18;
        v13[2] = v14[2];
LABEL_8:
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
        break;
    }
  }
  *(_BYTE *)(a1 + *(int *)(a3 + 32)) = *(_BYTE *)(a2 + *(int *)(a3 + 32));
  return a1;
}

uint64_t initializeWithTake for MatterAddDeviceRequest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const void *v9;
  uint64_t v10;
  uint64_t v11;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  v6 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v6;
  v7 = *(int *)(a3 + 28);
  v8 = (void *)(a1 + v7);
  v9 = (const void *)(a2 + v7);
  v10 = type metadata accessor for MatterAddDeviceRequest.DeviceCriteria(0);
  if (swift_getEnumCaseMultiPayload() == 3)
  {
    v11 = sub_23452BB30();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v8, v9, v11);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
  }
  *(_BYTE *)(a1 + *(int *)(a3 + 32)) = *(_BYTE *)(a2 + *(int *)(a3 + 32));
  return a1;
}

_QWORD *assignWithTake for MatterAddDeviceRequest(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;

  v6 = (void *)*a1;
  *a1 = *a2;

  v7 = a2[2];
  a1[1] = a2[1];
  a1[2] = v7;
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  swift_bridgeObjectRelease();
  v8 = (void *)a1[4];
  a1[4] = a2[4];

  if (a1 != a2)
  {
    v9 = *(int *)(a3 + 28);
    v10 = (char *)a1 + v9;
    v11 = (char *)a2 + v9;
    sub_234507C68((uint64_t)a1 + v9, type metadata accessor for MatterAddDeviceRequest.DeviceCriteria);
    v12 = type metadata accessor for MatterAddDeviceRequest.DeviceCriteria(0);
    if (swift_getEnumCaseMultiPayload() == 3)
    {
      v13 = sub_23452BB30();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 32))(v10, v11, v13);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
    }
  }
  *((_BYTE *)a1 + *(int *)(a3 + 32)) = *((_BYTE *)a2 + *(int *)(a3 + 32));
  return a1;
}

uint64_t getEnumTagSinglePayload for MatterAddDeviceRequest()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_234506F24(char *a1, uint64_t a2, uint64_t a3)
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
    v8 = type metadata accessor for MatterAddDeviceRequest.DeviceCriteria(0);
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(&a1[*(int *)(a3 + 28)], a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for MatterAddDeviceRequest()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

char *sub_234506FAC(char *result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = type metadata accessor for MatterAddDeviceRequest.DeviceCriteria(0);
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 28)], a2, a2, v7);
  }
  return result;
}

uint64_t sub_234507020()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for MatterAddDeviceRequest.DeviceCriteria(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_2345070B4()
{
  return type metadata accessor for MatterAddDeviceRequest.FirstOneWinsContinuation(0);
}

uint64_t type metadata accessor for MatterAddDeviceRequest.FirstOneWinsContinuation(uint64_t a1)
{
  return sub_234507200(a1, (uint64_t *)&unk_25615EB08);
}

void sub_2345070D0()
{
  unint64_t v0;

  sub_234507148();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

void sub_234507148()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_25615EB18)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_25615EB20);
    v0 = sub_23452BD40();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_25615EB18);
  }
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23493FDD4](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_2345071E4()
{
  return type metadata accessor for MatterAddDeviceRequest.Wrapper(0);
}

uint64_t type metadata accessor for MatterAddDeviceRequest.Wrapper(uint64_t a1)
{
  return sub_234507200(a1, (uint64_t *)&unk_25615EC60);
}

uint64_t sub_234507200(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_234507234()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for MatterAddDeviceRequest(319);
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t type metadata accessor for MTDeviceSetupRequestFactory()
{
  return objc_opt_self();
}

uint64_t getEnumTagSinglePayload for MatterAddDeviceRequest.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for MatterAddDeviceRequest.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23450739C + 4 * byte_23452E56D[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_2345073D0 + 4 * byte_23452E568[v4]))();
}

uint64_t sub_2345073D0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2345073D8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2345073E0);
  return result;
}

uint64_t sub_2345073EC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2345073F4);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_2345073F8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_234507400(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_23450740C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for MatterAddDeviceRequest.CodingKeys()
{
  return &type metadata for MatterAddDeviceRequest.CodingKeys;
}

unint64_t sub_234507428()
{
  unint64_t result;

  result = qword_25615EC98;
  if (!qword_25615EC98)
  {
    result = MEMORY[0x23493FDE0](&unk_23452E800, &type metadata for MatterAddDeviceRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25615EC98);
  }
  return result;
}

unint64_t sub_234507470()
{
  unint64_t result;

  result = qword_25615ECA0;
  if (!qword_25615ECA0)
  {
    result = MEMORY[0x23493FDE0](&unk_23452E738, &type metadata for MatterAddDeviceRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25615ECA0);
  }
  return result;
}

unint64_t sub_2345074B8()
{
  unint64_t result;

  result = qword_25615ECA8;
  if (!qword_25615ECA8)
  {
    result = MEMORY[0x23493FDE0](&unk_23452E760, &type metadata for MatterAddDeviceRequest.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25615ECA8);
  }
  return result;
}

uint64_t sub_2345074FC()
{
  unint64_t v0;

  v0 = sub_23452BE3C();
  swift_bridgeObjectRelease();
  if (v0 >= 4)
    return 4;
  else
    return v0;
}

id sub_234507544(uint64_t a1, unint64_t a2)
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
  id v14;
  objc_class *v15;
  id v16;
  uint64_t v18;
  objc_super v19;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25615ECB8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for MatterAddDeviceRequest(0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v18 - v12;
  v14 = 0;
  if (a2 >> 60 != 15)
  {
    sub_23452BAAC();
    swift_allocObject();
    sub_23450081C(a1, a2);
    sub_23452BAA0();
    sub_234506620(&qword_25615ECC0, type metadata accessor for MatterAddDeviceRequest, (uint64_t)&protocol conformance descriptor for MatterAddDeviceRequest);
    sub_23452BA94();
    swift_release();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v6, 0, 1, v7);
    sub_234507CA4((uint64_t)v6, (uint64_t)v13, type metadata accessor for MatterAddDeviceRequest);
    sub_234507C24((uint64_t)v13, (uint64_t)v11, type metadata accessor for MatterAddDeviceRequest);
    v15 = (objc_class *)type metadata accessor for MatterAddDeviceRequest.Wrapper(0);
    v16 = objc_allocWithZone(v15);
    sub_234507C24((uint64_t)v11, (uint64_t)v16+ OBJC_IVAR____TtCV13MatterSupport22MatterAddDeviceRequestP33_1A83A92E88F6D049FA318E551745945D7Wrapper_wrappedRequest, type metadata accessor for MatterAddDeviceRequest);
    v19.receiver = v16;
    v19.super_class = v15;
    v14 = objc_msgSendSuper2(&v19, sel_init);
    sub_234507C68((uint64_t)v11, type metadata accessor for MatterAddDeviceRequest);
    sub_234506660(a1, a2);
    sub_234507C68((uint64_t)v13, type metadata accessor for MatterAddDeviceRequest);
  }
  return v14;
}

uint64_t sub_234507794(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  int64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t result;
  uint64_t v23;
  uint64_t v24;
  id v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  objc_class *v43;
  id v44;
  id v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  objc_super v55;
  uint64_t v56;

  v50 = a2;
  v48 = a1;
  v54 = type metadata accessor for MatterAddDeviceRequest.DeviceCriteria(0);
  v52 = *(_QWORD *)(v54 - 8);
  MEMORY[0x24BDAC7A8](v54);
  v7 = (uint64_t *)((char *)&v46 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  v47 = type metadata accessor for MatterAddDeviceRequest(0);
  v8 = MEMORY[0x24BDAC7A8](v47);
  v10 = (char *)&v46 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v49 = (uint64_t *)((char *)&v46 - v11);
  v12 = *(_QWORD *)(a3 + 16);
  v13 = MEMORY[0x24BEE4AF8];
  v53 = a4;
  if (v12)
  {
    v56 = MEMORY[0x24BEE4AF8];
    sub_2345190CC(0, v12, 0);
    v13 = v56;
    v14 = (uint64_t *)(a3 + 40);
    do
    {
      v15 = *(v14 - 1);
      v16 = *v14;
      v56 = v13;
      v18 = *(_QWORD *)(v13 + 16);
      v17 = *(_QWORD *)(v13 + 24);
      swift_bridgeObjectRetain();
      if (v18 >= v17 >> 1)
      {
        sub_2345190CC(v17 > 1, v18 + 1, 1);
        v13 = v56;
      }
      v14 += 2;
      *(_QWORD *)(v13 + 16) = v18 + 1;
      v19 = v13 + 16 * v18;
      *(_QWORD *)(v19 + 32) = v15;
      *(_QWORD *)(v19 + 40) = v16;
      --v12;
    }
    while (v12);
    a4 = v53;
  }
  if (a4 >> 62)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v20 = sub_23452BE24();
    swift_bridgeObjectRelease();
  }
  else
  {
    v20 = *(_QWORD *)((a4 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
  }
  v21 = MEMORY[0x24BEE4AF8];
  if (!v20)
    goto LABEL_19;
  v56 = MEMORY[0x24BEE4AF8];
  result = sub_2345190B0(0, v20 & ~(v20 >> 63), 0);
  if ((v20 & 0x8000000000000000) == 0)
  {
    v46 = v10;
    v23 = 0;
    v21 = v56;
    v51 = a4 & 0xC000000000000001;
    v24 = v20;
    do
    {
      if (v51)
        v25 = (id)MEMORY[0x23493F534](v23, a4);
      else
        v25 = *(id *)(a4 + 8 * v23 + 32);
      v26 = v25;
      v27 = objc_msgSend(v25, sel_rootPublicKey, v46);
      v28 = sub_23452BB00();
      v30 = v29;

      v31 = objc_msgSend(v26, sel_nodeID);
      v32 = sub_23452BFE0();

      *v7 = v28;
      v7[1] = v30;
      v7[2] = v32;
      swift_storeEnumTagMultiPayload();

      v56 = v21;
      v34 = *(_QWORD *)(v21 + 16);
      v33 = *(_QWORD *)(v21 + 24);
      if (v34 >= v33 >> 1)
      {
        sub_2345190B0(v33 > 1, v34 + 1, 1);
        v21 = v56;
      }
      ++v23;
      *(_QWORD *)(v21 + 16) = v34 + 1;
      sub_234507CA4((uint64_t)v7, v21+ ((*(unsigned __int8 *)(v52 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v52 + 80))+ *(_QWORD *)(v52 + 72) * v34, type metadata accessor for MatterAddDeviceRequest.DeviceCriteria);
      a4 = v53;
    }
    while (v24 != v23);
    v10 = v46;
LABEL_19:
    v35 = swift_allocBox();
    v37 = v36;
    v38 = swift_allocObject();
    *(_QWORD *)(v38 + 16) = v21;
    *v37 = v38;
    swift_storeEnumTagMultiPayload();
    v39 = v47;
    v40 = v49;
    *(uint64_t *)((char *)v49 + *(int *)(v47 + 28)) = v35;
    swift_storeEnumTagMultiPayload();
    sub_234507DD0(0, &qword_25615E9C0);
    v41 = sub_23452BD34();
    v42 = v48;
    *v40 = v41;
    v40[1] = v42;
    v40[2] = v50;
    v40[3] = v13;
    v40[4] = 0;
    *((_BYTE *)v40 + *(int *)(v39 + 32)) = 1;
    sub_234507C24((uint64_t)v40, (uint64_t)v10, type metadata accessor for MatterAddDeviceRequest);
    v43 = (objc_class *)type metadata accessor for MatterAddDeviceRequest.Wrapper(0);
    v44 = objc_allocWithZone(v43);
    sub_234507C24((uint64_t)v10, (uint64_t)v44+ OBJC_IVAR____TtCV13MatterSupport22MatterAddDeviceRequestP33_1A83A92E88F6D049FA318E551745945D7Wrapper_wrappedRequest, type metadata accessor for MatterAddDeviceRequest);
    v55.receiver = v44;
    v55.super_class = v43;
    v45 = objc_msgSendSuper2(&v55, sel_init);
    sub_234507C68((uint64_t)v10, type metadata accessor for MatterAddDeviceRequest);
    sub_234507C68((uint64_t)v40, type metadata accessor for MatterAddDeviceRequest);
    return (uint64_t)v45;
  }
  __break(1u);
  return result;
}

uint64_t sub_234507C00()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_234507C24(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_234507C68(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_234507CA4(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_234507CE8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25615ECC8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_234507D30(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_23450081C(a1, a2);
  return a1;
}

uint64_t sub_234507D44(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_234507D88(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25615ECE0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_234507DD0(uint64_t a1, unint64_t *a2)
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

unint64_t sub_234507E08()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25615ED10;
  if (!qword_25615ED10)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25615ED08);
    result = MEMORY[0x23493FDE0](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_25615ED10);
  }
  return result;
}

uint64_t sub_234507E54()
{
  uint64_t v0;
  uint64_t v1;
  id *v2;
  char *v3;
  uint64_t v4;

  v1 = type metadata accessor for MatterAddDeviceRequest(0);
  v2 = (id *)(v0
            + ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)));

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  v3 = (char *)v2 + *(int *)(v1 + 28);
  type metadata accessor for MatterAddDeviceRequest.DeviceCriteria(0);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
    case 1u:
    case 2u:
      swift_release();
      break;
    case 3u:
      v4 = sub_23452BB30();
      (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
      break;
    case 6u:
      swift_bridgeObjectRelease();
      break;
    case 7u:
      sub_2345011D4(*(_QWORD *)v3, *((_QWORD *)v3 + 1));
      break;
    default:
      break;
  }
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_234507F78(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;

  v3 = *(_QWORD *)(type metadata accessor for MatterAddDeviceRequest(0) - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v5 = (*(_QWORD *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  return sub_23450415C(a1, (NSObject **)(v1 + v4), *(_QWORD *)(v1 + v5), *(_QWORD *)(v1 + ((v5 + 15) & 0xFFFFFFFFFFFFF8)));
}

uint64_t sub_234507FD8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_2345082FC;
  v3[2] = v2;
  return swift_task_switch();
}

uint64_t sub_234508038()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = sub_23452BB84();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_2345080B4(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v4 = *(unsigned __int8 *)(*(_QWORD *)(sub_23452BB84() - 8) + 80);
  v5 = v1[2];
  v6 = v1[3];
  v7 = v1[4];
  v8 = (uint64_t)v1 + ((v4 + 40) & ~v4);
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v9;
  *v9 = v2;
  v9[1] = sub_234508148;
  return sub_234504B78(a1, v5, v6, v7, v8);
}

uint64_t sub_234508148()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t objectdestroy_8Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2345081C0(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_2345082FC;
  return sub_234504854(a1, v4, v5, v6);
}

uint64_t sub_23450822C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_234508268()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23450828C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_234508148;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_25615ED60 + dword_25615ED60))(a1, v4);
}

uint64_t MatterAddDeviceRequest.Room.displayName.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t MatterAddDeviceRequest.Room.displayName.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*MatterAddDeviceRequest.Room.displayName.modify())()
{
  return nullsub_1;
}

uint64_t MatterAddDeviceRequest.Room.init(displayName:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  *a3 = result;
  a3[1] = a2;
  return result;
}

uint64_t MatterAddDeviceRequest.Room.hash(into:)()
{
  swift_bridgeObjectRetain();
  sub_23452BC38();
  return swift_bridgeObjectRelease();
}

uint64_t static MatterAddDeviceRequest.Room.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1])
    return 1;
  else
    return sub_23452BF5C();
}

uint64_t sub_2345083F0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_234508C2C(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_234508418()
{
  sub_234508554();
  return sub_23452C01C();
}

uint64_t sub_234508440()
{
  sub_234508554();
  return sub_23452C028();
}

uint64_t MatterAddDeviceRequest.Room.encode(to:)(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25615EDD0);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_234508554();
  sub_23452C010();
  sub_23452BEE4();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

unint64_t sub_234508554()
{
  unint64_t result;

  result = qword_25615EDD8;
  if (!qword_25615EDD8)
  {
    result = MEMORY[0x23493FDE0](&unk_23452EA38, &_s4RoomV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25615EDD8);
  }
  return result;
}

uint64_t MatterAddDeviceRequest.Room.hashValue.getter()
{
  sub_23452BF8C();
  swift_bridgeObjectRetain();
  sub_23452BC38();
  swift_bridgeObjectRelease();
  return sub_23452BFC8();
}

uint64_t MatterAddDeviceRequest.Room.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25615EDE0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_234508554();
  sub_23452C004();
  if (!v2)
  {
    v9 = sub_23452BE6C();
    v11 = v10;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v9;
    a2[1] = v11;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_23450870C()
{
  sub_23452BF8C();
  swift_bridgeObjectRetain();
  sub_23452BC38();
  swift_bridgeObjectRelease();
  return sub_23452BFC8();
}

uint64_t sub_234508764()
{
  swift_bridgeObjectRetain();
  sub_23452BC38();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2345087A8()
{
  sub_23452BF8C();
  swift_bridgeObjectRetain();
  sub_23452BC38();
  swift_bridgeObjectRelease();
  return sub_23452BFC8();
}

unint64_t sub_234508800()
{
  unint64_t result;

  result = qword_25615EDE8;
  if (!qword_25615EDE8)
  {
    result = MEMORY[0x23493FDE0](&protocol conformance descriptor for MatterAddDeviceRequest.Room, &type metadata for MatterAddDeviceRequest.Room);
    atomic_store(result, (unint64_t *)&qword_25615EDE8);
  }
  return result;
}

uint64_t sub_234508844@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return MatterAddDeviceRequest.Room.init(from:)(a1, a2);
}

uint64_t sub_234508858(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25615EDD0);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_234508554();
  sub_23452C010();
  sub_23452BEE4();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_234508944(_QWORD *a1, _QWORD *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1])
    return 1;
  else
    return sub_23452BF5C();
}

_QWORD *_s4HomeVwCP(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t _s4HomeVwxx()
{
  return swift_bridgeObjectRelease();
}

_QWORD *_s4HomeVwca(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

_QWORD *_s4HomeVwta(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s4HomeVwet(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 16))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t _s4HomeVwst(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 16) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for MatterAddDeviceRequest.Room()
{
  return &type metadata for MatterAddDeviceRequest.Room;
}

uint64_t _s4RoomV10CodingKeysOwst(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_234508AF8 + 4 * byte_23452E8A4[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_234508B18 + 4 * byte_23452E8A9[v4]))();
}

_BYTE *sub_234508AF8(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_234508B18(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_234508B20(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_234508B28(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_234508B30(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_234508B38(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *_s4RoomV10CodingKeysOMa()
{
  return &_s4RoomV10CodingKeysON;
}

unint64_t sub_234508B58()
{
  unint64_t result;

  result = qword_25615EDF0;
  if (!qword_25615EDF0)
  {
    result = MEMORY[0x23493FDE0](&unk_23452EA10, &_s4RoomV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25615EDF0);
  }
  return result;
}

unint64_t sub_234508BA0()
{
  unint64_t result;

  result = qword_25615EDF8;
  if (!qword_25615EDF8)
  {
    result = MEMORY[0x23493FDE0](&unk_23452E980, &_s4RoomV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25615EDF8);
  }
  return result;
}

unint64_t sub_234508BE8()
{
  unint64_t result;

  result = qword_25615EE00;
  if (!qword_25615EE00)
  {
    result = MEMORY[0x23493FDE0](&unk_23452E9A8, &_s4RoomV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25615EE00);
  }
  return result;
}

uint64_t sub_234508C2C(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 0x4E79616C70736964 && a2 == 0xEB00000000656D61)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_23452BF5C();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_234508CC0()
{
  return 0x4E79616C70736964;
}

uint64_t MatterAddDeviceExtensionRequestHandler.ThreadScanResult.networkName.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t MatterAddDeviceExtensionRequestHandler.ThreadScanResult.networkName.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*MatterAddDeviceExtensionRequestHandler.ThreadScanResult.networkName.modify())()
{
  return nullsub_1;
}

uint64_t MatterAddDeviceExtensionRequestHandler.ThreadScanResult.panID.getter()
{
  uint64_t v0;

  return *(unsigned __int16 *)(v0 + 16);
}

uint64_t MatterAddDeviceExtensionRequestHandler.ThreadScanResult.panID.setter(uint64_t result)
{
  uint64_t v1;

  *(_WORD *)(v1 + 16) = result;
  return result;
}

uint64_t (*MatterAddDeviceExtensionRequestHandler.ThreadScanResult.panID.modify())()
{
  return nullsub_1;
}

uint64_t MatterAddDeviceExtensionRequestHandler.ThreadScanResult.extendedPANID.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 24);
}

uint64_t MatterAddDeviceExtensionRequestHandler.ThreadScanResult.extendedPANID.setter(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 24) = result;
  return result;
}

uint64_t (*MatterAddDeviceExtensionRequestHandler.ThreadScanResult.extendedPANID.modify())()
{
  return nullsub_1;
}

uint64_t MatterAddDeviceExtensionRequestHandler.ThreadScanResult.channel.getter()
{
  uint64_t v0;

  return *(unsigned __int16 *)(v0 + 32);
}

uint64_t MatterAddDeviceExtensionRequestHandler.ThreadScanResult.channel.setter(uint64_t result)
{
  uint64_t v1;

  *(_WORD *)(v1 + 32) = result;
  return result;
}

uint64_t (*MatterAddDeviceExtensionRequestHandler.ThreadScanResult.channel.modify())()
{
  return nullsub_1;
}

uint64_t MatterAddDeviceExtensionRequestHandler.ThreadScanResult.extendedAddress.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 40);
  sub_23450081C(v1, *(_QWORD *)(v0 + 48));
  return v1;
}

uint64_t MatterAddDeviceExtensionRequestHandler.ThreadScanResult.extendedAddress.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = sub_2345011D4(*(_QWORD *)(v2 + 40), *(_QWORD *)(v2 + 48));
  *(_QWORD *)(v2 + 40) = a1;
  *(_QWORD *)(v2 + 48) = a2;
  return result;
}

uint64_t (*MatterAddDeviceExtensionRequestHandler.ThreadScanResult.extendedAddress.modify())()
{
  return nullsub_1;
}

uint64_t MatterAddDeviceExtensionRequestHandler.ThreadScanResult.rssi.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 56);
}

uint64_t MatterAddDeviceExtensionRequestHandler.ThreadScanResult.rssi.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 56) = result;
  return result;
}

uint64_t (*MatterAddDeviceExtensionRequestHandler.ThreadScanResult.rssi.modify())()
{
  return nullsub_1;
}

uint64_t MatterAddDeviceExtensionRequestHandler.ThreadScanResult.version.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 57);
}

uint64_t MatterAddDeviceExtensionRequestHandler.ThreadScanResult.version.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 57) = result;
  return result;
}

uint64_t (*MatterAddDeviceExtensionRequestHandler.ThreadScanResult.version.modify())()
{
  return nullsub_1;
}

uint64_t MatterAddDeviceExtensionRequestHandler.ThreadScanResult.linkQualityIndicator.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 58);
}

uint64_t MatterAddDeviceExtensionRequestHandler.ThreadScanResult.linkQualityIndicator.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 58) = result;
  return result;
}

uint64_t (*MatterAddDeviceExtensionRequestHandler.ThreadScanResult.linkQualityIndicator.modify())()
{
  return nullsub_1;
}

uint64_t MatterAddDeviceExtensionRequestHandler.ThreadScanResult.init(networkName:panID:extendedPANID:channel:extendedAddress:rssi:version:linkQualityIndicator:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, __int16 a3@<W2>, uint64_t a4@<X3>, __int16 a5@<W4>, uint64_t a6@<X5>, uint64_t a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, __int16 a10)
{
  *(_QWORD *)a9 = result;
  *(_QWORD *)(a9 + 8) = a2;
  *(_WORD *)(a9 + 16) = a3;
  *(_QWORD *)(a9 + 24) = a4;
  *(_WORD *)(a9 + 32) = a5;
  *(_QWORD *)(a9 + 40) = a6;
  *(_QWORD *)(a9 + 48) = a7;
  *(_BYTE *)(a9 + 56) = a8;
  *(_WORD *)(a9 + 57) = a10;
  return result;
}

uint64_t MatterAddDeviceExtensionRequestHandler.ThreadScanResult.hash(into:)()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;

  v1 = *(_QWORD *)(v0 + 40);
  v2 = *(_QWORD *)(v0 + 48);
  swift_bridgeObjectRetain();
  sub_23452BC38();
  swift_bridgeObjectRelease();
  sub_23452BFB0();
  sub_23452BFBC();
  sub_23452BFB0();
  sub_23450081C(v1, v2);
  sub_23452BB0C();
  sub_2345011D4(v1, v2);
  sub_23452BFA4();
  sub_23452BFA4();
  return sub_23452BFA4();
}

uint64_t sub_234508F94(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_234508FCC + 4 * byte_23452EA90[a1]))(0xD000000000000014, 0x8000000234530DD0);
}

uint64_t sub_234508FCC()
{
  return 0x4E6B726F7774656ELL;
}

uint64_t sub_234508FEC()
{
  return 0x44496E6170;
}

uint64_t sub_234509000()
{
  return 0x6465646E65747865;
}

uint64_t sub_234509050()
{
  return 1769173874;
}

uint64_t sub_234509060()
{
  return 0x6E6F6973726576;
}

BOOL sub_234509078(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_23450908C()
{
  unsigned __int8 *v0;

  return sub_234508F94(*v0);
}

uint64_t sub_234509094@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_234509F6C(a1, a2);
  *a3 = result;
  return result;
}

void sub_2345090B8(_BYTE *a1@<X8>)
{
  *a1 = 8;
}

uint64_t sub_2345090C4()
{
  sub_234509A44();
  return sub_23452C01C();
}

uint64_t sub_2345090EC()
{
  sub_234509A44();
  return sub_23452C028();
}

uint64_t MatterAddDeviceExtensionRequestHandler.ThreadScanResult.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _DWORD v16[4];
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  char v24;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25615EE08);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = *(unsigned __int16 *)(v1 + 16);
  v20 = *(_QWORD *)(v1 + 24);
  v19 = *(unsigned __int16 *)(v1 + 32);
  v8 = *(_QWORD *)(v1 + 40);
  v17 = *(_QWORD *)(v1 + 48);
  v18 = v8;
  LODWORD(v8) = *(unsigned __int8 *)(v1 + 56);
  v16[2] = *(unsigned __int8 *)(v1 + 57);
  v16[3] = v8;
  v16[1] = *(unsigned __int8 *)(v1 + 58);
  v9 = a1[3];
  v10 = a1;
  v12 = v11;
  __swift_project_boxed_opaque_existential_1(v10, v9);
  sub_234509A44();
  sub_23452C010();
  LOBYTE(v21) = 0;
  sub_23452BEE4();
  if (!v2)
  {
    v14 = v17;
    v13 = v18;
    LOBYTE(v21) = 1;
    sub_23452BF2C();
    LOBYTE(v21) = 2;
    sub_23452BF38();
    LOBYTE(v21) = 3;
    sub_23452BF2C();
    v21 = v13;
    v22 = v14;
    v24 = 4;
    sub_234502CC0();
    sub_23452BF08();
    LOBYTE(v21) = 5;
    sub_23452BF14();
    LOBYTE(v21) = 6;
    sub_23452BF20();
    LOBYTE(v21) = 7;
    sub_23452BF20();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v12);
}

uint64_t MatterAddDeviceExtensionRequestHandler.ThreadScanResult.hashValue.getter()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;

  v1 = *(_QWORD *)(v0 + 40);
  v2 = *(_QWORD *)(v0 + 48);
  sub_23452BF8C();
  swift_bridgeObjectRetain();
  sub_23452BC38();
  swift_bridgeObjectRelease();
  sub_23452BFB0();
  sub_23452BFBC();
  sub_23452BFB0();
  sub_23450081C(v1, v2);
  sub_23452BB0C();
  sub_2345011D4(v1, v2);
  sub_23452BFA4();
  sub_23452BFA4();
  sub_23452BFA4();
  return sub_23452BFC8();
}

uint64_t MatterAddDeviceExtensionRequestHandler.ThreadScanResult.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  int v18;
  int v19;
  unint64_t v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  int v26;
  char v27;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25615EE18);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_234509A44();
  sub_23452C004();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  LOBYTE(v24) = 0;
  v9 = sub_23452BE6C();
  v11 = v10;
  LOBYTE(v24) = 1;
  swift_bridgeObjectRetain();
  v26 = sub_23452BEB4();
  LOBYTE(v24) = 2;
  v23 = sub_23452BEC0();
  LOBYTE(v24) = 3;
  v22 = sub_23452BEB4();
  v27 = 4;
  sub_234502D48();
  sub_23452BE90();
  v12 = v24;
  LOBYTE(v24) = 5;
  v20 = v25;
  v21 = v12;
  sub_23450081C(v12, v25);
  v19 = sub_23452BE9C();
  LOBYTE(v24) = 6;
  v18 = sub_23452BEA8();
  LOBYTE(v24) = 7;
  v14 = sub_23452BEA8();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  swift_bridgeObjectRetain();
  v16 = v20;
  v15 = v21;
  sub_23450081C(v21, v20);
  sub_2345011D4(v15, v16);
  swift_bridgeObjectRelease();
  *(_QWORD *)a2 = v9;
  *(_QWORD *)(a2 + 8) = v11;
  *(_WORD *)(a2 + 16) = v26;
  *(_QWORD *)(a2 + 24) = v23;
  *(_WORD *)(a2 + 32) = v22;
  *(_QWORD *)(a2 + 40) = v15;
  *(_QWORD *)(a2 + 48) = v16;
  *(_BYTE *)(a2 + 56) = v19;
  *(_BYTE *)(a2 + 57) = v18;
  *(_BYTE *)(a2 + 58) = v14;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  return sub_2345011D4(v15, v16);
}

uint64_t sub_2345097E0()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;

  v1 = *(_QWORD *)(v0 + 40);
  v2 = *(_QWORD *)(v0 + 48);
  sub_23452BF8C();
  swift_bridgeObjectRetain();
  sub_23452BC38();
  swift_bridgeObjectRelease();
  sub_23452BFB0();
  sub_23452BFBC();
  sub_23452BFB0();
  sub_23450081C(v1, v2);
  sub_23452BB0C();
  sub_2345011D4(v1, v2);
  sub_23452BFA4();
  sub_23452BFA4();
  sub_23452BFA4();
  return sub_23452BFC8();
}

uint64_t sub_2345098E4@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return MatterAddDeviceExtensionRequestHandler.ThreadScanResult.init(from:)(a1, a2);
}

uint64_t sub_2345098F8(_QWORD *a1)
{
  return MatterAddDeviceExtensionRequestHandler.ThreadScanResult.encode(to:)(a1);
}

uint64_t _s13MatterSupport0A32AddDeviceExtensionRequestHandlerC16ThreadScanResultV2eeoiySbAE_AEtFZ_0(uint64_t a1, uint64_t a2)
{
  int v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  int v8;
  int v9;
  int v10;
  uint64_t v11;
  int v12;
  int v13;
  uint64_t result;
  char v15;
  unsigned __int8 v16;
  unsigned int v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  int v21;

  v2 = *(unsigned __int16 *)(a1 + 16);
  v3 = *(_QWORD *)(a1 + 24);
  v4 = *(unsigned __int16 *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v7 = *(unsigned __int8 *)(a1 + 56);
  v8 = *(unsigned __int8 *)(a1 + 57);
  v9 = *(unsigned __int8 *)(a1 + 58);
  v10 = *(unsigned __int16 *)(a2 + 16);
  v11 = *(_QWORD *)(a2 + 24);
  v12 = *(unsigned __int16 *)(a2 + 32);
  v13 = *(unsigned __int8 *)(a2 + 58);
  if (*(_QWORD *)a1 == *(_QWORD *)a2 && *(_QWORD *)(a1 + 8) == *(_QWORD *)(a2 + 8))
  {
    result = 0;
    if (v2 != v10)
      return result;
    if (v3 != v11)
      return result;
    v20 = *(unsigned __int8 *)(a2 + 56);
    v21 = *(unsigned __int8 *)(a2 + 57);
    if (v4 != v12)
      return result;
  }
  else
  {
    v20 = *(unsigned __int8 *)(a2 + 56);
    v21 = *(unsigned __int8 *)(a2 + 57);
    v18 = *(_QWORD *)(a1 + 48);
    v19 = *(_QWORD *)(a1 + 40);
    v15 = sub_23452BF5C();
    result = 0;
    if ((v15 & 1) == 0)
      return result;
    if (v2 != v10)
      return result;
    if (v3 != v11)
      return result;
    v6 = v18;
    v5 = v19;
    if (v4 != v12)
      return result;
  }
  sub_23450E8E4(v5, v6);
  v17 = v16 & (v7 == v20);
  if (v8 != v21)
    v17 = 0;
  if (v9 == v13)
    return v17;
  else
    return 0;
}

unint64_t sub_234509A44()
{
  unint64_t result;

  result = qword_25615EE10;
  if (!qword_25615EE10)
  {
    result = MEMORY[0x23493FDE0](&unk_23452EC54, &_s14descr250598741V16ThreadScanResultV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25615EE10);
  }
  return result;
}

unint64_t sub_234509A8C()
{
  unint64_t result;

  result = qword_25615EE20;
  if (!qword_25615EE20)
  {
    result = MEMORY[0x23493FDE0](&protocol conformance descriptor for MatterAddDeviceExtensionRequestHandler.ThreadScanResult, &type metadata for MatterAddDeviceExtensionRequestHandler.ThreadScanResult);
    atomic_store(result, (unint64_t *)&qword_25615EE20);
  }
  return result;
}

uint64_t _s14descr250598741V16ThreadScanResultVwxx(uint64_t a1)
{
  swift_bridgeObjectRelease();
  return sub_2345011D4(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t _s14descr250598741V16ThreadScanResultVwcp(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_WORD *)(a1 + 32) = *(_WORD *)(a2 + 32);
  v5 = *(_QWORD *)(a2 + 40);
  v6 = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRetain();
  sub_23450081C(v5, v6);
  *(_QWORD *)(a1 + 40) = v5;
  *(_QWORD *)(a1 + 48) = v6;
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  *(_WORD *)(a1 + 57) = *(_WORD *)(a2 + 57);
  return a1;
}

uint64_t _s14descr250598741V16ThreadScanResultVwca(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_WORD *)(a1 + 32) = *(_WORD *)(a2 + 32);
  v4 = *(_QWORD *)(a2 + 40);
  v5 = *(_QWORD *)(a2 + 48);
  sub_23450081C(v4, v5);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 48);
  *(_QWORD *)(a1 + 40) = v4;
  *(_QWORD *)(a1 + 48) = v5;
  sub_2345011D4(v6, v7);
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  *(_BYTE *)(a1 + 57) = *(_BYTE *)(a2 + 57);
  *(_BYTE *)(a1 + 58) = *(_BYTE *)(a2 + 58);
  return a1;
}

__n128 __swift_memcpy59_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 43) = *(_OWORD *)(a2 + 43);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t _s14descr250598741V16ThreadScanResultVwta(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_WORD *)(a1 + 32) = *(_WORD *)(a2 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  sub_2345011D4(v5, v6);
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  *(_WORD *)(a1 + 57) = *(_WORD *)(a2 + 57);
  return a1;
}

uint64_t _s14descr250598741V16ThreadScanResultVwet(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 59))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t _s14descr250598741V16ThreadScanResultVwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 58) = 0;
    *(_WORD *)(result + 56) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 59) = 1;
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
    *(_BYTE *)(result + 59) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for MatterAddDeviceExtensionRequestHandler.ThreadScanResult()
{
  return &type metadata for MatterAddDeviceExtensionRequestHandler.ThreadScanResult;
}

uint64_t _s14descr250598741V16ThreadScanResultV10CodingKeysOwet(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s14descr250598741V16ThreadScanResultV10CodingKeysOwst(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_234509E14 + 4 * byte_23452EA9D[v4]))();
  *a1 = a2 + 7;
  return ((uint64_t (*)(void))((char *)sub_234509E48 + 4 * byte_23452EA98[v4]))();
}

uint64_t sub_234509E48(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_234509E50(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x234509E58);
  return result;
}

uint64_t sub_234509E64(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x234509E6CLL);
  *(_BYTE *)result = a2 + 7;
  return result;
}

uint64_t sub_234509E70(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_234509E78(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *_s14descr250598741V16ThreadScanResultV10CodingKeysOMa()
{
  return &_s14descr250598741V16ThreadScanResultV10CodingKeysON;
}

unint64_t sub_234509E98()
{
  unint64_t result;

  result = qword_25615EE28;
  if (!qword_25615EE28)
  {
    result = MEMORY[0x23493FDE0](&unk_23452EC2C, &_s14descr250598741V16ThreadScanResultV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25615EE28);
  }
  return result;
}

unint64_t sub_234509EE0()
{
  unint64_t result;

  result = qword_25615EE30;
  if (!qword_25615EE30)
  {
    result = MEMORY[0x23493FDE0](&unk_23452EB9C, &_s14descr250598741V16ThreadScanResultV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25615EE30);
  }
  return result;
}

unint64_t sub_234509F28()
{
  unint64_t result;

  result = qword_25615EE38;
  if (!qword_25615EE38)
  {
    result = MEMORY[0x23493FDE0](&unk_23452EBC4, &_s14descr250598741V16ThreadScanResultV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25615EE38);
  }
  return result;
}

uint64_t sub_234509F6C(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x4E6B726F7774656ELL && a2 == 0xEB00000000656D61;
  if (v3 || (sub_23452BF5C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x44496E6170 && a2 == 0xE500000000000000 || (sub_23452BF5C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6465646E65747865 && a2 == 0xED000044494E4150 || (sub_23452BF5C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x6C656E6E616863 && a2 == 0xE700000000000000 || (sub_23452BF5C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x6465646E65747865 && a2 == 0xEF73736572646441 || (sub_23452BF5C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 1769173874 && a2 == 0xE400000000000000 || (sub_23452BF5C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x6E6F6973726576 && a2 == 0xE700000000000000 || (sub_23452BF5C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0xD000000000000014 && a2 == 0x8000000234530DD0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else
  {
    v6 = sub_23452BF5C();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 7;
    else
      return 8;
  }
}

uint64_t static MatterAddDeviceRequest.Topology.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  BOOL v4;

  v2 = a1[2];
  v3 = a2[2];
  v4 = *a1 == *a2 && a1[1] == a2[1];
  if (v4 || (sub_23452BF5C() & 1) != 0)
    return sub_23450A5F8(v2, v3);
  else
    return 0;
}

id sub_23450A2F8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = *(_QWORD *)(v1 + 16);
  if (v2)
  {
    swift_bridgeObjectRetain();
    sub_23452BDDC();
    v3 = v1 + 40;
    do
    {
      v4 = objc_allocWithZone((Class)MTSDeviceSetupHome);
      swift_bridgeObjectRetain();
      v5 = (void *)sub_23452BC14();
      swift_bridgeObjectRelease();
      objc_msgSend(v4, sel_initWithName_, v5);

      sub_23452BDC4();
      sub_23452BDE8();
      sub_23452BDF4();
      sub_23452BDD0();
      v3 += 16;
      --v2;
    }
    while (v2);
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  v6 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  sub_23450B3B4();
  v7 = (void *)sub_23452BC5C();
  swift_bridgeObjectRelease();
  v8 = objc_msgSend(v6, sel_initWithHomes_, v7);

  return v8;
}

uint64_t MatterAddDeviceRequest.Topology.init(ecosystemName:homes:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  *a4 = result;
  a4[1] = a2;
  a4[2] = a3;
  return result;
}

uint64_t MatterAddDeviceRequest.Topology.ecosystemName.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t MatterAddDeviceRequest.Topology.ecosystemName.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*MatterAddDeviceRequest.Topology.ecosystemName.modify())()
{
  return nullsub_1;
}

uint64_t MatterAddDeviceRequest.Topology.homes.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t MatterAddDeviceRequest.Topology.homes.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 16) = a1;
  return result;
}

uint64_t (*MatterAddDeviceRequest.Topology.homes.modify())()
{
  return nullsub_1;
}

uint64_t MatterAddDeviceRequest.Topology.hash(into:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;
  uint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  sub_23452BC38();
  swift_bridgeObjectRelease();
  result = sub_23452BF98();
  v3 = *(_QWORD *)(v1 + 16);
  if (v3)
  {
    swift_bridgeObjectRetain();
    v4 = v1 + 40;
    do
    {
      swift_bridgeObjectRetain();
      sub_23452BC38();
      swift_bridgeObjectRelease();
      v4 += 16;
      --v3;
    }
    while (v3);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_23450A5F8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *i;
  BOOL v5;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2 != *(_QWORD *)(a2 + 16))
    return 0;
  if (v2 && a1 != a2)
  {
    v3 = (_QWORD *)(a1 + 40);
    for (i = (_QWORD *)(a2 + 40); ; i += 2)
    {
      v5 = *(v3 - 1) == *(i - 1) && *v3 == *i;
      if (!v5 && (sub_23452BF5C() & 1) == 0)
        break;
      v3 += 2;
      if (!--v2)
        return 1;
    }
    return 0;
  }
  return 1;
}

uint64_t sub_23450A67C(uint64_t a1, uint64_t a2)
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
  uint64_t v13;
  uint64_t v14;
  char v15;
  BOOL v17;
  uint64_t v19;

  v4 = type metadata accessor for MatterAddDeviceRequest.DeviceCriteria(0);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v10 = (char *)&v19 - v9;
  v11 = *(_QWORD *)(a1 + 16);
  if (v11 == *(_QWORD *)(a2 + 16))
  {
    if (!v11 || a1 == a2)
    {
      v15 = 1;
    }
    else
    {
      v12 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
      v13 = *(_QWORD *)(v8 + 72);
      v14 = v11 - 1;
      do
      {
        sub_23450B3F0(a1 + v12, (uint64_t)v10);
        sub_23450B3F0(a2 + v12, (uint64_t)v7);
        v15 = static MatterAddDeviceRequest.DeviceCriteria.== infix(_:_:)(v10, v7);
        sub_23450B434((uint64_t)v7);
        sub_23450B434((uint64_t)v10);
        v17 = v14-- != 0;
        if ((v15 & 1) == 0)
          break;
        v12 += v13;
      }
      while (v17);
    }
  }
  else
  {
    v15 = 0;
  }
  return v15 & 1;
}

uint64_t sub_23450A798(char a1)
{
  if ((a1 & 1) != 0)
    return 0x73656D6F68;
  else
    return 0x65747379736F6365;
}

uint64_t sub_23450A7D8()
{
  char *v0;

  return sub_23450A798(*v0);
}

uint64_t sub_23450A7E0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23450B2BC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23450A804()
{
  sub_23450ADE0();
  return sub_23452C01C();
}

uint64_t sub_23450A82C()
{
  sub_23450ADE0();
  return sub_23452C028();
}

uint64_t MatterAddDeviceRequest.Topology.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  char v13;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25615EE40);
  v10 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(_QWORD *)(v1 + 16);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23450ADE0();
  sub_23452C010();
  v13 = 0;
  sub_23452BEE4();
  if (!v2)
  {
    v11 = v9;
    v12 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25615EE50);
    sub_23450AE68(&qword_25615EE58, (uint64_t (*)(void))sub_23450AE24, MEMORY[0x24BEE12A0]);
    sub_23452BF08();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v6, v4);
}

uint64_t MatterAddDeviceRequest.Topology.hashValue.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 16);
  sub_23452BF8C();
  sub_23452BC38();
  sub_23452BF98();
  v2 = *(_QWORD *)(v1 + 16);
  if (v2)
  {
    v3 = v1 + 40;
    do
    {
      swift_bridgeObjectRetain();
      sub_23452BC38();
      swift_bridgeObjectRelease();
      v3 += 16;
      --v2;
    }
    while (v2);
  }
  return sub_23452BFC8();
}

uint64_t MatterAddDeviceRequest.Topology.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v14[2];
  char v15;
  char v16;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25615EE68);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23450ADE0();
  sub_23452C004();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v16 = 0;
  v9 = sub_23452BE6C();
  v11 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25615EE50);
  v15 = 1;
  sub_23450AE68(&qword_25615EE70, (uint64_t (*)(void))sub_23450AED0, MEMORY[0x24BEE12D0]);
  swift_bridgeObjectRetain();
  sub_23452BE90();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v12 = v14[1];
  *a2 = v9;
  a2[1] = v11;
  a2[2] = v12;
  swift_bridgeObjectRetain();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23450AC40()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;

  v1 = *(_QWORD *)(v0 + 16);
  sub_23452BC38();
  v2 = *(_QWORD *)(v1 + 16);
  result = sub_23452BF98();
  if (v2)
  {
    v4 = v1 + 40;
    do
    {
      swift_bridgeObjectRetain();
      sub_23452BC38();
      result = swift_bridgeObjectRelease();
      v4 += 16;
      --v2;
    }
    while (v2);
  }
  return result;
}

uint64_t sub_23450ACC0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 16);
  sub_23452BF8C();
  sub_23452BC38();
  v2 = *(_QWORD *)(v1 + 16);
  sub_23452BF98();
  if (v2)
  {
    v3 = v1 + 40;
    do
    {
      swift_bridgeObjectRetain();
      sub_23452BC38();
      swift_bridgeObjectRelease();
      v3 += 16;
      --v2;
    }
    while (v2);
  }
  return sub_23452BFC8();
}

uint64_t sub_23450AD58@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return MatterAddDeviceRequest.Topology.init(from:)(a1, a2);
}

uint64_t sub_23450AD6C(_QWORD *a1)
{
  return MatterAddDeviceRequest.Topology.encode(to:)(a1);
}

uint64_t sub_23450AD80(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  BOOL v4;

  v2 = a1[2];
  v3 = a2[2];
  v4 = *a1 == *a2 && a1[1] == a2[1];
  if (v4 || (sub_23452BF5C() & 1) != 0)
    return sub_23450A5F8(v2, v3);
  else
    return 0;
}

unint64_t sub_23450ADE0()
{
  unint64_t result;

  result = qword_25615EE48;
  if (!qword_25615EE48)
  {
    result = MEMORY[0x23493FDE0](&unk_23452EE40, &_s8TopologyV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25615EE48);
  }
  return result;
}

unint64_t sub_23450AE24()
{
  unint64_t result;

  result = qword_25615EE60;
  if (!qword_25615EE60)
  {
    result = MEMORY[0x23493FDE0](&protocol conformance descriptor for MatterAddDeviceRequest.Home, &type metadata for MatterAddDeviceRequest.Home);
    atomic_store(result, (unint64_t *)&qword_25615EE60);
  }
  return result;
}

uint64_t sub_23450AE68(unint64_t *a1, uint64_t (*a2)(void), uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  result = *a1;
  if (!result)
  {
    v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25615EE50);
    v8 = a2();
    result = MEMORY[0x23493FDE0](a3, v7, &v8);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_23450AED0()
{
  unint64_t result;

  result = qword_25615EE78;
  if (!qword_25615EE78)
  {
    result = MEMORY[0x23493FDE0](&protocol conformance descriptor for MatterAddDeviceRequest.Home, &type metadata for MatterAddDeviceRequest.Home);
    atomic_store(result, (unint64_t *)&qword_25615EE78);
  }
  return result;
}

unint64_t sub_23450AF18()
{
  unint64_t result;

  result = qword_25615EE80;
  if (!qword_25615EE80)
  {
    result = MEMORY[0x23493FDE0](&protocol conformance descriptor for MatterAddDeviceRequest.Topology, &type metadata for MatterAddDeviceRequest.Topology);
    atomic_store(result, (unint64_t *)&qword_25615EE80);
  }
  return result;
}

uint64_t _s8TopologyVwxx()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *_s8TopologyVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *_s8TopologyVwca(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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

uint64_t _s8TopologyVwta(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s8TopologyVwet(uint64_t a1, int a2)
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

uint64_t _s8TopologyVwst(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for MatterAddDeviceRequest.Topology()
{
  return &type metadata for MatterAddDeviceRequest.Topology;
}

uint64_t _s8TopologyV10CodingKeysOwst(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23450B164 + 4 * byte_23452ECA9[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23450B198 + 4 * byte_23452ECA4[v4]))();
}

uint64_t sub_23450B198(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23450B1A0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23450B1A8);
  return result;
}

uint64_t sub_23450B1B4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23450B1BCLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23450B1C0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23450B1C8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *_s8TopologyV10CodingKeysOMa()
{
  return &_s8TopologyV10CodingKeysON;
}

unint64_t sub_23450B1E8()
{
  unint64_t result;

  result = qword_25615EE88;
  if (!qword_25615EE88)
  {
    result = MEMORY[0x23493FDE0](&unk_23452EE18, &_s8TopologyV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25615EE88);
  }
  return result;
}

unint64_t sub_23450B230()
{
  unint64_t result;

  result = qword_25615EE90;
  if (!qword_25615EE90)
  {
    result = MEMORY[0x23493FDE0](&unk_23452ED88, &_s8TopologyV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25615EE90);
  }
  return result;
}

unint64_t sub_23450B278()
{
  unint64_t result;

  result = qword_25615EE98;
  if (!qword_25615EE98)
  {
    result = MEMORY[0x23493FDE0](&unk_23452EDB0, &_s8TopologyV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25615EE98);
  }
  return result;
}

uint64_t sub_23450B2BC(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x65747379736F6365 && a2 == 0xED0000656D614E6DLL;
  if (v3 || (sub_23452BF5C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x73656D6F68 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_23452BF5C();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

unint64_t sub_23450B3B4()
{
  unint64_t result;

  result = qword_25615EEA0;
  if (!qword_25615EEA0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_25615EEA0);
  }
  return result;
}

uint64_t sub_23450B3F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for MatterAddDeviceRequest.DeviceCriteria(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_23450B434(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for MatterAddDeviceRequest.DeviceCriteria(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_23450B470()
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
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  _QWORD v18[5];
  uint64_t v19;
  char *v20;
  char *v21;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_25615F168);
  MEMORY[0x24BDAC7A8](v1);
  v20 = (char *)v18 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25615ECC8);
  v4 = MEMORY[0x24BDAC7A8](v3);
  v18[2] = (char *)v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v18[3] = (char *)v18 - v7;
  MEMORY[0x24BDAC7A8](v6);
  v18[4] = (char *)v18 - v8;
  v19 = sub_23452BB30();
  v9 = MEMORY[0x24BDAC7A8](v19);
  v18[1] = (char *)v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v21 = (char *)v18 - v11;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_25615F170);
  MEMORY[0x24BDAC7A8](v12);
  v13 = type metadata accessor for MatterAddDeviceRequest.DeviceCriteria(0);
  v14 = MEMORY[0x24BDAC7A8](v13);
  v15 = MEMORY[0x24BDAC7A8](v14);
  MEMORY[0x24BDAC7A8](v15);
  sub_23450B3F0(v0, (uint64_t)v18 - v16);
  v17 = (char *)sub_23450B690 + 4 * word_23452EE90[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_23450B690()
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

  v6 = *(_QWORD *)(*(_QWORD *)v4 + 16);
  v7 = *(_QWORD *)(v6 + 16);
  if (v7)
  {
    v8 = v6 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    v9 = *(_QWORD *)(v3 + 72);
    swift_bridgeObjectRetain();
    while (1)
    {
      sub_23450B3F0(v8, v1);
      if (!((uint64_t (*)(uint64_t))sub_23450B470)(v2))
        break;
      sub_23450B434(v1);
      v8 += v9;
      if (!--v7)
      {
        swift_bridgeObjectRelease();
        goto LABEL_6;
      }
    }
    swift_bridgeObjectRelease();
    sub_23450ECD4(v1, v5);
    v10 = 0;
  }
  else
  {
LABEL_6:
    v10 = 1;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v3 + 56))(v5, v10, 1, v0);
  sub_23450822C(v5, &qword_25615F170);
  swift_release();
  return v10;
}

void static MatterAddDeviceRequest.DeviceCriteria.== infix(_:_:)(uint64_t a1, uint64_t a2)
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
  char *v20;
  char *v21;
  _QWORD v22[6];
  uint64_t v23;
  uint64_t v24;

  v23 = a1;
  v24 = a2;
  v2 = sub_23452BB30();
  v22[4] = *(_QWORD *)(v2 - 8);
  v22[5] = v2;
  MEMORY[0x24BDAC7A8](v2);
  v22[2] = (char *)v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for MatterAddDeviceRequest.DeviceCriteria(0);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v6 = MEMORY[0x24BDAC7A8](v5);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v22[3] = (char *)v22 - v10;
  v11 = MEMORY[0x24BDAC7A8](v9);
  v22[1] = (char *)v22 - v12;
  v13 = MEMORY[0x24BDAC7A8](v11);
  v22[0] = (char *)v22 - v14;
  v15 = MEMORY[0x24BDAC7A8](v13);
  v16 = MEMORY[0x24BDAC7A8](v15);
  MEMORY[0x24BDAC7A8](v16);
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_25615EEA8);
  v18 = MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)v22 + *(int *)(v18 + 48) - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23450B3F0(v23, (uint64_t)v22 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_23450B3F0(v24, (uint64_t)v20);
  v21 = (char *)sub_23450BDDC + 4 * byte_23452EEA2[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_23450BDDC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  char v4;

  sub_23450B3F0(v0, (uint64_t)v2);
  v3 = *v2;
  if (swift_getEnumCaseMultiPayload())
  {
    swift_release();
    sub_23450822C(v0, &qword_25615EEA8);
    v4 = 0;
  }
  else
  {
    v4 = sub_23450A67C(*(_QWORD *)(v3 + 16), *(_QWORD *)(*(_QWORD *)v1 + 16));
    swift_release();
    swift_release();
    sub_23450B434(v0);
  }
  return v4 & 1;
}

uint64_t type metadata accessor for MatterAddDeviceRequest.DeviceCriteria(uint64_t a1)
{
  return sub_234507200(a1, qword_25615F048);
}

void MatterAddDeviceRequest.DeviceCriteria.hash(into:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _QWORD v8[2];

  v1 = sub_23452BB30();
  MEMORY[0x24BDAC7A8](v1);
  v2 = type metadata accessor for MatterAddDeviceRequest.DeviceCriteria(0);
  v8[1] = *(_QWORD *)(v2 - 8);
  v3 = MEMORY[0x24BDAC7A8](v2);
  v4 = MEMORY[0x24BDAC7A8](v3);
  v5 = MEMORY[0x24BDAC7A8](v4);
  MEMORY[0x24BDAC7A8](v5);
  sub_23450B3F0(v0, (uint64_t)v8 - v6);
  v7 = (char *)sub_23450C258 + 4 * byte_23452EEAB[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_23450C258()
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

  v4 = *(_QWORD *)(*(_QWORD *)v2 + 16);
  sub_23452BF98();
  sub_23452BF98();
  v5 = *(_QWORD *)(v4 + 16);
  if (v5)
  {
    v6 = *(_QWORD *)(v3 - 88);
    v7 = v4 + ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
    v8 = *(_QWORD *)(v6 + 72);
    do
    {
      sub_23450B3F0(v7, v1);
      ((void (*)(uint64_t))MatterAddDeviceRequest.DeviceCriteria.hash(into:))(v0);
      sub_23450B434(v1);
      v7 += v8;
      --v5;
    }
    while (v5);
  }
  return swift_release();
}

uint64_t sub_23450C48C(char a1)
{
  return *(_QWORD *)&aAlldevicany[8 * a1];
}

uint64_t sub_23450C4AC(char a1)
{
  if ((a1 & 1) != 0)
    return 0x444965646F6ELL;
  else
    return 0x6C627550746F6F72;
}

uint64_t sub_23450C4F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_234510A64(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_23450C520()
{
  sub_23450EC08();
  return sub_23452C01C();
}

uint64_t sub_23450C548()
{
  sub_23450EC08();
  return sub_23452C028();
}

uint64_t sub_23450C570()
{
  sub_23450EC90();
  return sub_23452C01C();
}

uint64_t sub_23450C598()
{
  sub_23450EC90();
  return sub_23452C028();
}

uint64_t sub_23450C5C0()
{
  sub_23450EC4C();
  return sub_23452C01C();
}

uint64_t sub_23450C5E8()
{
  sub_23450EC4C();
  return sub_23452C028();
}

uint64_t sub_23450C610()
{
  char *v0;

  return sub_23450C48C(*v0);
}

uint64_t sub_23450C618@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2345105F0(a1, a2);
  *a3 = result;
  return result;
}

void sub_23450C63C(_BYTE *a1@<X8>)
{
  *a1 = 9;
}

uint64_t sub_23450C648()
{
  sub_23450EA2C();
  return sub_23452C01C();
}

uint64_t sub_23450C670()
{
  sub_23450EA2C();
  return sub_23452C028();
}

uint64_t sub_23450C698()
{
  sub_23450EB80();
  return sub_23452C01C();
}

uint64_t sub_23450C6C0()
{
  sub_23450EB80();
  return sub_23452C028();
}

uint64_t sub_23450C6E8()
{
  char *v0;

  return sub_23450C4AC(*v0);
}

uint64_t sub_23450C6F0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23451096C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_23450C714()
{
  sub_23450EA70();
  return sub_23452C01C();
}

uint64_t sub_23450C73C()
{
  sub_23450EA70();
  return sub_23452C028();
}

uint64_t sub_23450C764()
{
  sub_23450EBC4();
  return sub_23452C01C();
}

uint64_t sub_23450C78C()
{
  sub_23450EBC4();
  return sub_23452C028();
}

uint64_t sub_23450C7B4()
{
  sub_23450EAF8();
  return sub_23452C01C();
}

uint64_t sub_23450C7DC()
{
  sub_23450EAF8();
  return sub_23452C028();
}

uint64_t sub_23450C804()
{
  sub_23450EAB4();
  return sub_23452C01C();
}

uint64_t sub_23450C82C()
{
  sub_23450EAB4();
  return sub_23452C028();
}

uint64_t sub_23450C854()
{
  sub_23450EB3C();
  return sub_23452C01C();
}

uint64_t sub_23450C87C()
{
  sub_23450EB3C();
  return sub_23452C028();
}

void MatterAddDeviceRequest.DeviceCriteria.encode(to:)(_QWORD *a1)
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
  char *v14;
  uint64_t v15;
  char *v16;
  char *v17;
  _QWORD v18[5];
  uint64_t v19;
  char *v20;
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
  char *v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;

  v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_25615EEB8);
  v18[4] = *(_QWORD *)(v41 - 8);
  MEMORY[0x24BDAC7A8](v41);
  v40 = (char *)v18 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_25615EEC0);
  v18[3] = *(_QWORD *)(v39 - 8);
  MEMORY[0x24BDAC7A8](v39);
  v38 = (char *)v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_25615EEC8);
  v18[2] = *(_QWORD *)(v37 - 8);
  MEMORY[0x24BDAC7A8](v37);
  v36 = (char *)v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_25615EED0);
  v18[1] = *(_QWORD *)(v35 - 8);
  MEMORY[0x24BDAC7A8](v35);
  v32 = (char *)v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_25615EED8);
  v18[0] = *(_QWORD *)(v34 - 8);
  MEMORY[0x24BDAC7A8](v34);
  v31 = (char *)v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = sub_23452BB30();
  v30 = *(_QWORD *)(v33 - 8);
  MEMORY[0x24BDAC7A8](v33);
  v29 = (char *)v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_25615EEE0);
  v27 = *(_QWORD *)(v28 - 8);
  MEMORY[0x24BDAC7A8](v28);
  v26 = (char *)v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_25615EEE8);
  v24 = *(_QWORD *)(v25 - 8);
  MEMORY[0x24BDAC7A8](v25);
  v23 = (char *)v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_25615EEF0);
  v21 = *(_QWORD *)(v22 - 8);
  MEMORY[0x24BDAC7A8](v22);
  v20 = (char *)v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_25615EEF8);
  MEMORY[0x24BDAC7A8](v19);
  v11 = type metadata accessor for MatterAddDeviceRequest.DeviceCriteria(0);
  v12 = MEMORY[0x24BDAC7A8](v11);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)v18 - v13;
  v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_25615EF00);
  v42 = *(_QWORD *)(v44 - 8);
  MEMORY[0x24BDAC7A8](v44);
  v16 = (char *)v18 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23450EA2C();
  v43 = v16;
  sub_23452C010();
  sub_23450B3F0(v45, (uint64_t)v14);
  v17 = (char *)sub_23450CCA4 + 4 * word_23452EEB4[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_23450CCA4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = *(_QWORD *)(*(_QWORD *)v0 + 16);
  *(_BYTE *)(v1 - 104) = 1;
  sub_23450EC4C();
  v3 = *(_QWORD *)(v1 - 320);
  v5 = *(_QWORD *)(v1 - 136);
  v4 = *(_QWORD *)(v1 - 128);
  sub_23452BED8();
  *(_QWORD *)(v1 - 104) = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25615EF50);
  sub_23450ED3C(&qword_25615EF58, (unint64_t *)&unk_25615EA20, (uint64_t)&protocol conformance descriptor for MatterAddDeviceRequest.DeviceCriteria, MEMORY[0x24BEE12A0]);
  v6 = *(_QWORD *)(v1 - 304);
  sub_23452BF08();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 312) + 8))(v3, v6);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 144) + 8))(v5, v4);
  return swift_release();
}

uint64_t MatterAddDeviceRequest.DeviceCriteria.hashValue.getter()
{
  sub_23452BF8C();
  MatterAddDeviceRequest.DeviceCriteria.hash(into:)();
  return sub_23452BFC8();
}

uint64_t MatterAddDeviceRequest.DeviceCriteria.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
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
  char *v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t *v38;
  uint64_t v39;
  _QWORD v41[9];
  uint64_t v42;
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
  char *v57;
  char *v58;
  char *v59;
  char *v60;
  char *v61;
  char *v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  uint64_t v71;
  _QWORD *v72;
  uint64_t v73;

  v64 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25615EF70);
  v4 = *(_QWORD *)(v3 - 8);
  v55 = v3;
  v56 = v4;
  MEMORY[0x24BDAC7A8](v3);
  v70 = (char *)v41 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_25615EF78);
  v69 = *(_QWORD *)(v54 - 8);
  MEMORY[0x24BDAC7A8](v54);
  v63 = (char *)v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_25615EF80);
  v52 = *(_QWORD *)(v53 - 8);
  MEMORY[0x24BDAC7A8](v53);
  v62 = (char *)v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_25615EF88);
  v49 = *(_QWORD *)(v51 - 8);
  MEMORY[0x24BDAC7A8](v51);
  v60 = (char *)v41 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_25615EF90);
  v68 = *(_QWORD *)(v50 - 8);
  MEMORY[0x24BDAC7A8](v50);
  v61 = (char *)v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_25615EF98);
  v46 = *(_QWORD *)(v48 - 8);
  MEMORY[0x24BDAC7A8](v48);
  v59 = (char *)v41 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_25615EFA0);
  v45 = *(_QWORD *)(v47 - 8);
  MEMORY[0x24BDAC7A8](v47);
  v58 = (char *)v41 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_25615EFA8);
  v44 = *(_QWORD *)(v43 - 8);
  MEMORY[0x24BDAC7A8](v43);
  v67 = (char *)v41 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_25615EFB0);
  v41[8] = *(_QWORD *)(v42 - 8);
  MEMORY[0x24BDAC7A8](v42);
  v57 = (char *)v41 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v71 = __swift_instantiateConcreteTypeFromMangledName(&qword_25615EFB8);
  v66 = *(_QWORD *)(v71 - 8);
  MEMORY[0x24BDAC7A8](v71);
  v15 = (char *)v41 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v65 = type metadata accessor for MatterAddDeviceRequest.DeviceCriteria(0);
  v16 = MEMORY[0x24BDAC7A8](v65);
  v41[7] = (char *)v41 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)v41 - v19;
  v21 = MEMORY[0x24BDAC7A8](v18);
  v23 = (char *)v41 - v22;
  v24 = MEMORY[0x24BDAC7A8](v21);
  v26 = (char *)v41 - v25;
  v27 = MEMORY[0x24BDAC7A8](v24);
  v29 = (char *)v41 - v28;
  MEMORY[0x24BDAC7A8](v27);
  v31 = (char *)v41 - v30;
  v32 = a1[3];
  v72 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v32);
  sub_23450EA2C();
  v33 = v73;
  sub_23452C004();
  if (!v33)
  {
    v41[1] = v26;
    v41[2] = v23;
    v41[4] = v29;
    v41[3] = v20;
    v73 = 0;
    v41[5] = v31;
    v34 = v15;
    v35 = sub_23452BECC();
    if (*(_QWORD *)(v35 + 16) == 1)
    {
      v41[6] = v15;
      __asm { BR              X10 }
    }
    v36 = sub_23452BDAC();
    swift_allocError();
    v38 = v37;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25615E970);
    *v38 = v65;
    v39 = v71;
    sub_23452BE54();
    sub_23452BDA0();
    (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v36 - 8) + 104))(v38, *MEMORY[0x24BEE26D0], v36);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v66 + 8))(v34, v39);
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v72);
}

uint64_t sub_23450E2E0()
{
  sub_23452BF8C();
  MatterAddDeviceRequest.DeviceCriteria.hash(into:)();
  return sub_23452BFC8();
}

uint64_t sub_23450E320()
{
  sub_23452BF8C();
  MatterAddDeviceRequest.DeviceCriteria.hash(into:)();
  return sub_23452BFC8();
}

uint64_t sub_23450E358@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return MatterAddDeviceRequest.DeviceCriteria.init(from:)(a1, a2);
}

void sub_23450E36C(_QWORD *a1)
{
  MatterAddDeviceRequest.DeviceCriteria.encode(to:)(a1);
}

void sub_23450E384(uint64_t *a1)
{
  sub_23451000C(*a1, a1[1]);
}

void sub_23450E3A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __asm { BR              X10 }
}

uint64_t sub_23450E404(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, __int16 a10, char __s2, char a12, char a13, char a14, char a15, char a16, char a17, char a18, char a19, char a20,char a21,char a22,char a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37)
{
  BOOL *v37;
  const void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t result;
  uint64_t v42;
  __int16 v43;
  char v44;
  char v45;
  char v46;
  char v47;

  v42 = v39;
  v43 = v40;
  v44 = BYTE2(v40);
  v45 = BYTE3(v40);
  v46 = BYTE4(v40);
  v47 = BYTE5(v40);
  if (!v38)
  {
    __break(1u);
    JUMPOUT(0x23450E5E8);
  }
  result = memcmp(v38, &v42, BYTE6(v40));
  *v37 = (_DWORD)result == 0;
  return result;
}

void sub_23450E60C(uint64_t a1, uint64_t a2)
{
  __asm { BR              X10 }
}

uint64_t sub_23450E668()
{
  unint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  char v7;
  uint64_t v8;
  __int16 v9;
  char v10;
  char v11;
  char v12;
  char v13;

  v8 = v3;
  v9 = v4;
  v10 = BYTE2(v4);
  v11 = BYTE3(v4);
  v12 = BYTE4(v4);
  v13 = BYTE5(v4);
  sub_23450E3A4((uint64_t)&v8, (uint64_t)&v8 + BYTE6(v4), v1, v0);
  sub_2345011D4(v1, v0);
  if (!v2)
    v5 = v7;
  return v5 & 1;
}

uint64_t sub_23450E830(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t result;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  char v19;

  result = sub_23452BA70();
  v11 = result;
  if (result)
  {
    result = sub_23452BA88();
    if (__OFSUB__(a1, result))
    {
LABEL_15:
      __break(1u);
      return result;
    }
    v11 += a1 - result;
  }
  v12 = __OFSUB__(a2, a1);
  v13 = a2 - a1;
  if (v12)
  {
    __break(1u);
    goto LABEL_15;
  }
  v14 = sub_23452BA7C();
  if (v14 >= v13)
    v15 = v13;
  else
    v15 = v14;
  v16 = v11 + v15;
  if (v11)
    v17 = v16;
  else
    v17 = 0;
  sub_23450E3A4(v11, v17, a4, a5);
  if (!v5)
    v18 = v19;
  return v18 & 1;
}

void sub_23450E8E4(uint64_t a1, uint64_t a2)
{
  __asm { BR              X11 }
}

uint64_t sub_23450E928()
{
  unint64_t v0;

  return ((uint64_t (*)(void))((char *)&loc_23450E95C + dword_23450EA1C[v0 >> 62]))();
}

uint64_t sub_23450E96C@<X0>(uint64_t a1@<X8>)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;

  if (a1 == BYTE6(v1))
  {
    if (a1 < 1)
    {
      v5 = 1;
    }
    else
    {
      sub_23450081C(v2, v1);
      sub_23450E60C(v4, v3);
    }
  }
  else
  {
    v5 = 0;
  }
  return v5 & 1;
}

unint64_t sub_23450EA2C()
{
  unint64_t result;

  result = qword_25615EF08;
  if (!qword_25615EF08)
  {
    result = MEMORY[0x23493FDE0](&unk_23452FAD0, &_s14DeviceCriteriaO10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25615EF08);
  }
  return result;
}

unint64_t sub_23450EA70()
{
  unint64_t result;

  result = qword_25615EF10;
  if (!qword_25615EF10)
  {
    result = MEMORY[0x23493FDE0](&unk_23452FA80, &_s14DeviceCriteriaO20FabricNodeCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25615EF10);
  }
  return result;
}

unint64_t sub_23450EAB4()
{
  unint64_t result;

  result = qword_25615EF18;
  if (!qword_25615EF18)
  {
    result = MEMORY[0x23493FDE0](&unk_23452FA30, &_s14DeviceCriteriaO22SerialNumberCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25615EF18);
  }
  return result;
}

unint64_t sub_23450EAF8()
{
  unint64_t result;

  result = qword_25615EF20;
  if (!qword_25615EF20)
  {
    result = MEMORY[0x23493FDE0](&unk_23452F9E0, &_s14DeviceCriteriaO19ProductIDCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25615EF20);
  }
  return result;
}

unint64_t sub_23450EB3C()
{
  unint64_t result;

  result = qword_25615EF28;
  if (!qword_25615EF28)
  {
    result = MEMORY[0x23493FDE0](&unk_23452F990, &_s14DeviceCriteriaO18VendorIDCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25615EF28);
  }
  return result;
}

unint64_t sub_23450EB80()
{
  unint64_t result;

  result = qword_25615EF30;
  if (!qword_25615EF30)
  {
    result = MEMORY[0x23493FDE0](&unk_23452F940, &_s14DeviceCriteriaO25CommissioningIDCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25615EF30);
  }
  return result;
}

unint64_t sub_23450EBC4()
{
  unint64_t result;

  result = qword_25615EF40;
  if (!qword_25615EF40)
  {
    result = MEMORY[0x23493FDE0](&unk_23452F8F0, &_s14DeviceCriteriaO13NotCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25615EF40);
  }
  return result;
}

unint64_t sub_23450EC08()
{
  unint64_t result;

  result = qword_25615EF48;
  if (!qword_25615EF48)
  {
    result = MEMORY[0x23493FDE0](&unk_23452F8A0, &_s14DeviceCriteriaO13AllCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25615EF48);
  }
  return result;
}

unint64_t sub_23450EC4C()
{
  unint64_t result;

  result = qword_25615EF60;
  if (!qword_25615EF60)
  {
    result = MEMORY[0x23493FDE0](&unk_23452F850, &_s14DeviceCriteriaO13AnyCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25615EF60);
  }
  return result;
}

unint64_t sub_23450EC90()
{
  unint64_t result;

  result = qword_25615EF68;
  if (!qword_25615EF68)
  {
    result = MEMORY[0x23493FDE0](&unk_23452F800, &_s14DeviceCriteriaO20AllDevicesCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25615EF68);
  }
  return result;
}

uint64_t sub_23450ECD4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for MatterAddDeviceRequest.DeviceCriteria(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_23450ED18()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_23450ED3C(unint64_t *a1, unint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;

  result = *a1;
  if (!result)
  {
    v9 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25615EF50);
    v10 = sub_234506620(a2, type metadata accessor for MatterAddDeviceRequest.DeviceCriteria, a3);
    result = MEMORY[0x23493FDE0](a4, v9, &v10);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23450EDC0()
{
  return sub_234506620(&qword_25615EFD0, type metadata accessor for MatterAddDeviceRequest.DeviceCriteria, (uint64_t)&protocol conformance descriptor for MatterAddDeviceRequest.DeviceCriteria);
}

uint64_t *_s14DeviceCriteriaOwCP(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;

  v5 = *(_QWORD *)(a3 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    v7 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v7 + ((v6 + 16) & ~(unint64_t)v6));
    swift_retain();
  }
  else
  {
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
      case 1u:
      case 2u:
        *a1 = *a2;
        swift_retain();
        swift_storeEnumTagMultiPayload();
        break;
      case 3u:
        v9 = sub_23452BB30();
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(a1, a2, v9);
        swift_storeEnumTagMultiPayload();
        break;
      case 6u:
        v10 = a2[1];
        *a1 = *a2;
        a1[1] = v10;
        swift_bridgeObjectRetain();
        swift_storeEnumTagMultiPayload();
        break;
      case 7u:
        v11 = *a2;
        v12 = a2[1];
        sub_23450081C(*a2, v12);
        *a1 = v11;
        a1[1] = v12;
        a1[2] = a2[2];
        swift_storeEnumTagMultiPayload();
        break;
      default:
        memcpy(a1, a2, *(_QWORD *)(v5 + 64));
        break;
    }
  }
  return a1;
}

uint64_t _s14DeviceCriteriaOwxx(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = swift_getEnumCaseMultiPayload();
  switch((int)result)
  {
    case 0:
    case 1:
    case 2:
      result = swift_release();
      break;
    case 3:
      v3 = sub_23452BB30();
      result = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
      break;
    case 6:
      result = swift_bridgeObjectRelease();
      break;
    case 7:
      result = sub_2345011D4(*(_QWORD *)a1, *(_QWORD *)(a1 + 8));
      break;
    default:
      return result;
  }
  return result;
}

uint64_t *_s14DeviceCriteriaOwcp(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;

  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:
    case 1u:
    case 2u:
      *a1 = *a2;
      swift_retain();
      goto LABEL_7;
    case 3u:
      v6 = sub_23452BB30();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
      goto LABEL_7;
    case 6u:
      v7 = a2[1];
      *a1 = *a2;
      a1[1] = v7;
      swift_bridgeObjectRetain();
      goto LABEL_7;
    case 7u:
      v8 = *a2;
      v9 = a2[1];
      sub_23450081C(*a2, v9);
      *a1 = v8;
      a1[1] = v9;
      a1[2] = a2[2];
LABEL_7:
      swift_storeEnumTagMultiPayload();
      break;
    default:
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
      break;
  }
  return a1;
}

uint64_t *_s14DeviceCriteriaOwca(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;

  if (a1 != a2)
  {
    sub_23450B434((uint64_t)a1);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 0u:
      case 1u:
      case 2u:
        *a1 = *a2;
        swift_retain();
        goto LABEL_8;
      case 3u:
        v6 = sub_23452BB30();
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
        goto LABEL_8;
      case 6u:
        *a1 = *a2;
        a1[1] = a2[1];
        swift_bridgeObjectRetain();
        goto LABEL_8;
      case 7u:
        v7 = *a2;
        v8 = a2[1];
        sub_23450081C(*a2, v8);
        *a1 = v7;
        a1[1] = v8;
        a1[2] = a2[2];
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

void *_s14DeviceCriteriaOwtk(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (swift_getEnumCaseMultiPayload() == 3)
  {
    v6 = sub_23452BB30();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  return a1;
}

void *_s14DeviceCriteriaOwta(void *a1, const void *a2, uint64_t a3)
{
  uint64_t v6;

  if (a1 != a2)
  {
    sub_23450B434((uint64_t)a1);
    if (swift_getEnumCaseMultiPayload() == 3)
    {
      v6 = sub_23452BB30();
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

uint64_t _s14DeviceCriteriaOwet(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t _s14DeviceCriteriaOwst(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_23450F400()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_23450F410()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23452BB30();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t _s14DeviceCriteriaO10CodingKeysOwet(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s14DeviceCriteriaO10CodingKeysOwst(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23450F584 + 4 * byte_23452EEFD[v4]))();
  *a1 = a2 + 8;
  return ((uint64_t (*)(void))((char *)sub_23450F5B8 + 4 * byte_23452EEF8[v4]))();
}

uint64_t sub_23450F5B8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23450F5C0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23450F5C8);
  return result;
}

uint64_t sub_23450F5D4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23450F5DCLL);
  *(_BYTE *)result = a2 + 8;
  return result;
}

uint64_t sub_23450F5E0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23450F5E8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *_s14DeviceCriteriaO10CodingKeysOMa()
{
  return &_s14DeviceCriteriaO10CodingKeysON;
}

ValueMetadata *_s14DeviceCriteriaO20AllDevicesCodingKeysOMa()
{
  return &_s14DeviceCriteriaO20AllDevicesCodingKeysON;
}

ValueMetadata *_s14DeviceCriteriaO13AnyCodingKeysOMa()
{
  return &_s14DeviceCriteriaO13AnyCodingKeysON;
}

ValueMetadata *_s14DeviceCriteriaO13AllCodingKeysOMa()
{
  return &_s14DeviceCriteriaO13AllCodingKeysON;
}

ValueMetadata *_s14DeviceCriteriaO13NotCodingKeysOMa()
{
  return &_s14DeviceCriteriaO13NotCodingKeysON;
}

ValueMetadata *_s14DeviceCriteriaO25CommissioningIDCodingKeysOMa()
{
  return &_s14DeviceCriteriaO25CommissioningIDCodingKeysON;
}

ValueMetadata *_s14DeviceCriteriaO18VendorIDCodingKeysOMa()
{
  return &_s14DeviceCriteriaO18VendorIDCodingKeysON;
}

ValueMetadata *_s14DeviceCriteriaO19ProductIDCodingKeysOMa()
{
  return &_s14DeviceCriteriaO19ProductIDCodingKeysON;
}

uint64_t _s14DeviceCriteriaO13AnyCodingKeysOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23450F6BC + 4 * byte_23452EF02[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23450F6DC + 4 * byte_23452EF07[v4]))();
}

_BYTE *sub_23450F6BC(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23450F6DC(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23450F6E4(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23450F6EC(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23450F6F4(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23450F6FC(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *_s14DeviceCriteriaO22SerialNumberCodingKeysOMa()
{
  return &_s14DeviceCriteriaO22SerialNumberCodingKeysON;
}

uint64_t _s14DeviceCriteriaO20FabricNodeCodingKeysOwst(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23450F764 + 4 * byte_23452EF11[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_23450F798 + 4 * byte_23452EF0C[v4]))();
}

uint64_t sub_23450F798(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23450F7A0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23450F7A8);
  return result;
}

uint64_t sub_23450F7B4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23450F7BCLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23450F7C0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23450F7C8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *_s14DeviceCriteriaO20FabricNodeCodingKeysOMa()
{
  return &_s14DeviceCriteriaO20FabricNodeCodingKeysON;
}

unint64_t sub_23450F7E8()
{
  unint64_t result;

  result = qword_25615F080;
  if (!qword_25615F080)
  {
    result = MEMORY[0x23493FDE0](&unk_23452F1C8, &_s14DeviceCriteriaO20FabricNodeCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25615F080);
  }
  return result;
}

unint64_t sub_23450F830()
{
  unint64_t result;

  result = qword_25615F088;
  if (!qword_25615F088)
  {
    result = MEMORY[0x23493FDE0](&unk_23452F280, &_s14DeviceCriteriaO22SerialNumberCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25615F088);
  }
  return result;
}

unint64_t sub_23450F878()
{
  unint64_t result;

  result = qword_25615F090;
  if (!qword_25615F090)
  {
    result = MEMORY[0x23493FDE0](&unk_23452F338, &_s14DeviceCriteriaO19ProductIDCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25615F090);
  }
  return result;
}

unint64_t sub_23450F8C0()
{
  unint64_t result;

  result = qword_25615F098;
  if (!qword_25615F098)
  {
    result = MEMORY[0x23493FDE0](&unk_23452F3F0, &_s14DeviceCriteriaO18VendorIDCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25615F098);
  }
  return result;
}

unint64_t sub_23450F908()
{
  unint64_t result;

  result = qword_25615F0A0;
  if (!qword_25615F0A0)
  {
    result = MEMORY[0x23493FDE0](&unk_23452F4A8, &_s14DeviceCriteriaO25CommissioningIDCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25615F0A0);
  }
  return result;
}

unint64_t sub_23450F950()
{
  unint64_t result;

  result = qword_25615F0A8;
  if (!qword_25615F0A8)
  {
    result = MEMORY[0x23493FDE0](&unk_23452F560, &_s14DeviceCriteriaO13NotCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25615F0A8);
  }
  return result;
}

unint64_t sub_23450F998()
{
  unint64_t result;

  result = qword_25615F0B0;
  if (!qword_25615F0B0)
  {
    result = MEMORY[0x23493FDE0](&unk_23452F618, &_s14DeviceCriteriaO13AllCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25615F0B0);
  }
  return result;
}

unint64_t sub_23450F9E0()
{
  unint64_t result;

  result = qword_25615F0B8;
  if (!qword_25615F0B8)
  {
    result = MEMORY[0x23493FDE0](&unk_23452F6D0, &_s14DeviceCriteriaO13AnyCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25615F0B8);
  }
  return result;
}

unint64_t sub_23450FA28()
{
  unint64_t result;

  result = qword_25615F0C0;
  if (!qword_25615F0C0)
  {
    result = MEMORY[0x23493FDE0](&unk_23452F7D8, &_s14DeviceCriteriaO10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25615F0C0);
  }
  return result;
}

unint64_t sub_23450FA70()
{
  unint64_t result;

  result = qword_25615F0C8;
  if (!qword_25615F0C8)
  {
    result = MEMORY[0x23493FDE0](&unk_23452F6F8, &_s14DeviceCriteriaO20AllDevicesCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25615F0C8);
  }
  return result;
}

unint64_t sub_23450FAB8()
{
  unint64_t result;

  result = qword_25615F0D0;
  if (!qword_25615F0D0)
  {
    result = MEMORY[0x23493FDE0](&unk_23452F720, &_s14DeviceCriteriaO20AllDevicesCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25615F0D0);
  }
  return result;
}

unint64_t sub_23450FB00()
{
  unint64_t result;

  result = qword_25615F0D8;
  if (!qword_25615F0D8)
  {
    result = MEMORY[0x23493FDE0](&unk_23452F640, &_s14DeviceCriteriaO13AnyCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25615F0D8);
  }
  return result;
}

unint64_t sub_23450FB48()
{
  unint64_t result;

  result = qword_25615F0E0;
  if (!qword_25615F0E0)
  {
    result = MEMORY[0x23493FDE0](&unk_23452F668, &_s14DeviceCriteriaO13AnyCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25615F0E0);
  }
  return result;
}

unint64_t sub_23450FB90()
{
  unint64_t result;

  result = qword_25615F0E8;
  if (!qword_25615F0E8)
  {
    result = MEMORY[0x23493FDE0](&unk_23452F588, &_s14DeviceCriteriaO13AllCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25615F0E8);
  }
  return result;
}

unint64_t sub_23450FBD8()
{
  unint64_t result;

  result = qword_25615F0F0;
  if (!qword_25615F0F0)
  {
    result = MEMORY[0x23493FDE0](&unk_23452F5B0, &_s14DeviceCriteriaO13AllCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25615F0F0);
  }
  return result;
}

unint64_t sub_23450FC20()
{
  unint64_t result;

  result = qword_25615F0F8;
  if (!qword_25615F0F8)
  {
    result = MEMORY[0x23493FDE0](&unk_23452F4D0, &_s14DeviceCriteriaO13NotCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25615F0F8);
  }
  return result;
}

unint64_t sub_23450FC68()
{
  unint64_t result;

  result = qword_25615F100;
  if (!qword_25615F100)
  {
    result = MEMORY[0x23493FDE0](&unk_23452F4F8, &_s14DeviceCriteriaO13NotCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25615F100);
  }
  return result;
}

unint64_t sub_23450FCB0()
{
  unint64_t result;

  result = qword_25615F108;
  if (!qword_25615F108)
  {
    result = MEMORY[0x23493FDE0](&unk_23452F418, &_s14DeviceCriteriaO25CommissioningIDCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25615F108);
  }
  return result;
}

unint64_t sub_23450FCF8()
{
  unint64_t result;

  result = qword_25615F110;
  if (!qword_25615F110)
  {
    result = MEMORY[0x23493FDE0](&unk_23452F440, &_s14DeviceCriteriaO25CommissioningIDCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25615F110);
  }
  return result;
}

unint64_t sub_23450FD40()
{
  unint64_t result;

  result = qword_25615F118;
  if (!qword_25615F118)
  {
    result = MEMORY[0x23493FDE0](&unk_23452F360, &_s14DeviceCriteriaO18VendorIDCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25615F118);
  }
  return result;
}

unint64_t sub_23450FD88()
{
  unint64_t result;

  result = qword_25615F120;
  if (!qword_25615F120)
  {
    result = MEMORY[0x23493FDE0](&unk_23452F388, &_s14DeviceCriteriaO18VendorIDCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25615F120);
  }
  return result;
}

unint64_t sub_23450FDD0()
{
  unint64_t result;

  result = qword_25615F128;
  if (!qword_25615F128)
  {
    result = MEMORY[0x23493FDE0](&unk_23452F2A8, &_s14DeviceCriteriaO19ProductIDCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25615F128);
  }
  return result;
}

unint64_t sub_23450FE18()
{
  unint64_t result;

  result = qword_25615F130;
  if (!qword_25615F130)
  {
    result = MEMORY[0x23493FDE0](&unk_23452F2D0, &_s14DeviceCriteriaO19ProductIDCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25615F130);
  }
  return result;
}

unint64_t sub_23450FE60()
{
  unint64_t result;

  result = qword_25615F138;
  if (!qword_25615F138)
  {
    result = MEMORY[0x23493FDE0](&unk_23452F1F0, &_s14DeviceCriteriaO22SerialNumberCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25615F138);
  }
  return result;
}

unint64_t sub_23450FEA8()
{
  unint64_t result;

  result = qword_25615F140;
  if (!qword_25615F140)
  {
    result = MEMORY[0x23493FDE0](&unk_23452F218, &_s14DeviceCriteriaO22SerialNumberCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25615F140);
  }
  return result;
}

unint64_t sub_23450FEF0()
{
  unint64_t result;

  result = qword_25615F148;
  if (!qword_25615F148)
  {
    result = MEMORY[0x23493FDE0](&unk_23452F138, &_s14DeviceCriteriaO20FabricNodeCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25615F148);
  }
  return result;
}

unint64_t sub_23450FF38()
{
  unint64_t result;

  result = qword_25615F150;
  if (!qword_25615F150)
  {
    result = MEMORY[0x23493FDE0](&unk_23452F160, &_s14DeviceCriteriaO20FabricNodeCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25615F150);
  }
  return result;
}

unint64_t sub_23450FF80()
{
  unint64_t result;

  result = qword_25615F158;
  if (!qword_25615F158)
  {
    result = MEMORY[0x23493FDE0](&unk_23452F748, &_s14DeviceCriteriaO10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25615F158);
  }
  return result;
}

unint64_t sub_23450FFC8()
{
  unint64_t result;

  result = qword_25615F160;
  if (!qword_25615F160)
  {
    result = MEMORY[0x23493FDE0](&unk_23452F770, &_s14DeviceCriteriaO10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25615F160);
  }
  return result;
}

void sub_23451000C(uint64_t a1, uint64_t a2)
{
  __asm { BR              X11 }
}

uint64_t sub_23451005C()
{
  unint64_t v0;

  return ((uint64_t (*)(void))((char *)&loc_234510090 + dword_23451014C[v0 >> 62]))();
}

BOOL sub_2345100A0@<W0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;

  if (a1 == BYTE6(v3) && (a1 < 1 || (sub_23450081C(v4, v3), sub_23450E60C(v6, v5), (v7 & 1) != 0)))
    return v2 == v1;
  else
    return 0;
}

BOOL sub_23451015C(uint64_t a1, uint64_t a2)
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
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  unsigned int (*v21)(uint64_t, uint64_t, uint64_t);
  _BOOL8 result;
  char v23;
  void (*v24)(char *, uint64_t);
  int *v25;
  int *v26;
  uint64_t v27;
  _QWORD *v28;
  char v29;
  uint64_t v30;
  _QWORD *v31;
  int v32;
  uint64_t v33;
  _QWORD *v34;
  char v35;
  _QWORD *v36;
  int v37;
  uint64_t v38;
  _QWORD *v39;
  uint64_t v40;
  _QWORD *v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  unint64_t v49;
  char v50;
  char v51;
  uint64_t v52;
  uint64_t v53;

  v4 = sub_23452BB30();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v52 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25615F168);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v52 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_25615ECC8);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v52 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x24BDAC7A8](v12);
  v17 = (char *)&v52 - v16;
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v52 - v18;
  sub_234510AE4(a1, (uint64_t)&v52 - v18);
  v53 = a2;
  sub_234510AE4(a2, (uint64_t)v17);
  v20 = (uint64_t)&v10[*(int *)(v8 + 48)];
  sub_234510AE4((uint64_t)v19, (uint64_t)v10);
  sub_234510AE4((uint64_t)v17, v20);
  v21 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48);
  if (v21((uint64_t)v10, 1, v4) == 1)
  {
    sub_23450822C((uint64_t)v17, &qword_25615ECC8);
    sub_23450822C((uint64_t)v19, &qword_25615ECC8);
    if (v21(v20, 1, v4) == 1)
    {
      sub_23450822C((uint64_t)v10, &qword_25615ECC8);
      goto LABEL_10;
    }
LABEL_6:
    sub_23450822C((uint64_t)v10, &qword_25615F168);
    return 0;
  }
  sub_234510AE4((uint64_t)v10, (uint64_t)v14);
  if (v21(v20, 1, v4) == 1)
  {
    sub_23450822C((uint64_t)v17, &qword_25615ECC8);
    sub_23450822C((uint64_t)v19, &qword_25615ECC8);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v14, v4);
    goto LABEL_6;
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 32))(v7, v20, v4);
  sub_234506620(qword_25615F178, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA98]);
  v23 = sub_23452BC08();
  v24 = *(void (**)(char *, uint64_t))(v5 + 8);
  v24(v7, v4);
  sub_23450822C((uint64_t)v17, &qword_25615ECC8);
  sub_23450822C((uint64_t)v19, &qword_25615ECC8);
  v24(v14, v4);
  sub_23450822C((uint64_t)v10, &qword_25615ECC8);
  if ((v23 & 1) == 0)
    return 0;
LABEL_10:
  v25 = (int *)_s14DeviceCriteriaO17DeviceDescriptionVMa(0);
  v26 = v25;
  v27 = v25[5];
  v28 = (_QWORD *)(a1 + v27);
  v29 = *(_BYTE *)(a1 + v27 + 8);
  v30 = v53;
  v31 = (_QWORD *)(v53 + v27);
  v32 = *(unsigned __int8 *)(v53 + v27 + 8);
  if ((v29 & 1) != 0)
  {
    if (!v32)
      return 0;
  }
  else
  {
    if (*v28 != *v31)
      LOBYTE(v32) = 1;
    if ((v32 & 1) != 0)
      return 0;
  }
  v33 = v25[6];
  v34 = (_QWORD *)(a1 + v33);
  v35 = *(_BYTE *)(a1 + v33 + 8);
  v36 = (_QWORD *)(v53 + v33);
  v37 = *(unsigned __int8 *)(v53 + v33 + 8);
  if ((v35 & 1) != 0)
  {
    if (!v37)
      return 0;
  }
  else
  {
    if (*v34 != *v36)
      LOBYTE(v37) = 1;
    if ((v37 & 1) != 0)
      return 0;
  }
  v38 = v25[7];
  v39 = (_QWORD *)(a1 + v38);
  v40 = *(_QWORD *)(a1 + v38 + 8);
  v41 = (_QWORD *)(v53 + v38);
  v42 = v41[1];
  if (!v40)
  {
    if (v42)
      return 0;
LABEL_29:
    v44 = v26[8];
    v45 = *(_QWORD *)(a1 + v44);
    v46 = *(_QWORD *)(a1 + v44 + 8);
    v47 = (uint64_t *)(v30 + v44);
    v48 = *v47;
    v49 = v47[1];
    if (v46 >> 60 == 15)
    {
      if (v49 >> 60 == 15)
        return 1;
    }
    else if (v49 >> 60 != 15)
    {
      sub_234507D30(v45, v46);
      sub_234507D30(v48, v49);
      sub_23451000C(v45, v46);
      v51 = v50;
      sub_234506660(v48, v49);
      sub_234506660(v45, v46);
      return (v51 & 1) != 0;
    }
    sub_234507D30(v45, v46);
    sub_234507D30(v48, v49);
    sub_234506660(v45, v46);
    sub_234506660(v48, v49);
    return 0;
  }
  if (!v42)
    return 0;
  if (*v39 == *v41 && v40 == v42)
    goto LABEL_29;
  v43 = sub_23452BF5C();
  result = 0;
  if ((v43 & 1) != 0)
    goto LABEL_29;
  return result;
}

uint64_t sub_2345105E4()
{
  return 12383;
}

uint64_t sub_2345105F0(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0x63697665446C6C61 && a2 == 0xEA00000000007365 || (sub_23452BF5C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 7958113 && a2 == 0xE300000000000000 || (sub_23452BF5C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 7105633 && a2 == 0xE300000000000000 || (sub_23452BF5C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 7630702 && a2 == 0xE300000000000000 || (sub_23452BF5C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x697373696D6D6F63 && a2 == 0xEF4449676E696E6FLL || (sub_23452BF5C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x4449726F646E6576 && a2 == 0xE800000000000000 || (sub_23452BF5C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x49746375646F7270 && a2 == 0xE900000000000044 || (sub_23452BF5C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0x754E6C6169726573 && a2 == 0xEC0000007265626DLL || (sub_23452BF5C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0x6F4E636972626166 && a2 == 0xEA00000000006564)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else
  {
    v5 = sub_23452BF5C();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 8;
    else
      return 9;
  }
}

uint64_t sub_23451096C(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x6C627550746F6F72 && a2 == 0xED000079654B6369;
  if (v3 || (sub_23452BF5C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x444965646F6ELL && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_23452BF5C();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_234510A64(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 12383 && a2 == 0xE200000000000000)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_23452BF5C();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t _s14DeviceCriteriaO17DeviceDescriptionVMa(uint64_t a1)
{
  return sub_234507200(a1, (uint64_t *)&unk_25615F1D8);
}

uint64_t sub_234510AE4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25615ECC8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t *sub_234510B2C(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  char *v22;
  uint64_t *v23;
  unint64_t v24;
  uint64_t v25;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_23452BB30();
    v8 = *(_QWORD *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25615ECC8);
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(a1, a2, v7);
      (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
    v11 = a3[5];
    v12 = a3[6];
    v13 = (char *)a1 + v11;
    v14 = (char *)a2 + v11;
    *(_QWORD *)v13 = *(_QWORD *)v14;
    v13[8] = v14[8];
    v15 = (char *)a1 + v12;
    v16 = (char *)a2 + v12;
    *(_QWORD *)v15 = *(_QWORD *)v16;
    v15[8] = v16[8];
    v17 = a3[7];
    v18 = a3[8];
    v19 = (uint64_t *)((char *)a1 + v17);
    v20 = (uint64_t *)((char *)a2 + v17);
    v21 = v20[1];
    *v19 = *v20;
    v19[1] = v21;
    v22 = (char *)a1 + v18;
    v23 = (uint64_t *)((char *)a2 + v18);
    v24 = *(uint64_t *)((char *)a2 + v18 + 8);
    swift_bridgeObjectRetain();
    if (v24 >> 60 == 15)
    {
      *(_OWORD *)v22 = *(_OWORD *)v23;
    }
    else
    {
      v25 = *v23;
      sub_23450081C(*v23, v24);
      *(_QWORD *)v22 = v25;
      *((_QWORD *)v22 + 1) = v24;
    }
    *((_QWORD *)v22 + 2) = v23[2];
  }
  return a1;
}

uint64_t sub_234510C94(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t *v7;
  unint64_t v8;

  v4 = sub_23452BB30();
  v5 = *(_QWORD *)(v4 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(a1, 1, v4))
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  result = swift_bridgeObjectRelease();
  v7 = (uint64_t *)(a1 + *(int *)(a2 + 32));
  v8 = v7[1];
  if (v8 >> 60 != 15)
    return sub_2345011D4(*v7, v8);
  return result;
}

char *sub_234510D30(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t *v21;
  unint64_t v22;
  uint64_t v23;

  v6 = sub_23452BB30();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25615ECC8);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  v9 = a3[5];
  v10 = a3[6];
  v11 = &a1[v9];
  v12 = &a2[v9];
  *(_QWORD *)v11 = *(_QWORD *)v12;
  v11[8] = v12[8];
  v13 = &a1[v10];
  v14 = &a2[v10];
  *(_QWORD *)v13 = *(_QWORD *)v14;
  v13[8] = v14[8];
  v15 = a3[7];
  v16 = a3[8];
  v17 = &a1[v15];
  v18 = &a2[v15];
  v19 = *((_QWORD *)v18 + 1);
  *(_QWORD *)v17 = *(_QWORD *)v18;
  *((_QWORD *)v17 + 1) = v19;
  v20 = &a1[v16];
  v21 = (uint64_t *)&a2[v16];
  v22 = *(_QWORD *)&a2[v16 + 8];
  swift_bridgeObjectRetain();
  if (v22 >> 60 == 15)
  {
    *(_OWORD *)v20 = *(_OWORD *)v21;
  }
  else
  {
    v23 = *v21;
    sub_23450081C(*v21, v22);
    *(_QWORD *)v20 = v23;
    *((_QWORD *)v20 + 1) = v22;
  }
  *((_QWORD *)v20 + 2) = v21[2];
  return a1;
}

char *sub_234510E6C(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(char *, uint64_t, uint64_t);
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  unint64_t v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;

  v6 = sub_23452BB30();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 1, v6);
  v10 = v8(a2, 1, v6);
  if (v9)
  {
    if (!v10)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v10)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(a1, v6);
LABEL_6:
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_25615ECC8);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 24))(a1, a2, v6);
LABEL_7:
  v12 = a3[5];
  v13 = &a1[v12];
  v14 = &a2[v12];
  v15 = *(_QWORD *)v14;
  v13[8] = v14[8];
  *(_QWORD *)v13 = v15;
  v16 = a3[6];
  v17 = &a1[v16];
  v18 = &a2[v16];
  v19 = *(_QWORD *)v18;
  v17[8] = v18[8];
  *(_QWORD *)v17 = v19;
  v20 = a3[7];
  v21 = &a1[v20];
  v22 = &a2[v20];
  *(_QWORD *)v21 = *(_QWORD *)v22;
  *((_QWORD *)v21 + 1) = *((_QWORD *)v22 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v23 = a3[8];
  v24 = (uint64_t)&a1[v23];
  v25 = (uint64_t *)&a2[v23];
  v26 = *(_QWORD *)&a2[v23 + 8];
  if (*(_QWORD *)&a1[v23 + 8] >> 60 != 15)
  {
    if (v26 >> 60 == 15)
    {
      sub_23451106C(v24);
      v28 = v25[2];
      *(_OWORD *)v24 = *(_OWORD *)v25;
LABEL_15:
      *(_QWORD *)(v24 + 16) = v28;
      return a1;
    }
    v30 = *v25;
    sub_23450081C(*v25, v26);
    v31 = *(_QWORD *)v24;
    v32 = *(_QWORD *)(v24 + 8);
    *(_QWORD *)v24 = v30;
    *(_QWORD *)(v24 + 8) = v26;
    sub_2345011D4(v31, v32);
LABEL_14:
    v28 = v25[2];
    goto LABEL_15;
  }
  if (v26 >> 60 != 15)
  {
    v29 = *v25;
    sub_23450081C(*v25, v26);
    *(_QWORD *)v24 = v29;
    *(_QWORD *)(v24 + 8) = v26;
    goto LABEL_14;
  }
  v27 = *(_OWORD *)v25;
  *(_QWORD *)(v24 + 16) = v25[2];
  *(_OWORD *)v24 = v27;
  return a1;
}

uint64_t sub_23451106C(uint64_t a1)
{
  sub_2345011D4(*(_QWORD *)a1, *(_QWORD *)(a1 + 8));
  return a1;
}

char *sub_234511098(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  char *v13;
  char *v14;
  uint64_t v15;
  char *v16;
  char *v17;

  v6 = sub_23452BB30();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25615ECC8);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  v9 = a3[5];
  v10 = a3[6];
  v11 = &a1[v9];
  v12 = &a2[v9];
  *(_QWORD *)v11 = *(_QWORD *)v12;
  v11[8] = v12[8];
  v13 = &a1[v10];
  v14 = &a2[v10];
  *(_QWORD *)v13 = *(_QWORD *)v14;
  v13[8] = v14[8];
  v15 = a3[8];
  *(_OWORD *)&a1[a3[7]] = *(_OWORD *)&a2[a3[7]];
  v16 = &a1[v15];
  v17 = &a2[v15];
  *(_OWORD *)v16 = *(_OWORD *)v17;
  *((_QWORD *)v16 + 2) = *((_QWORD *)v17 + 2);
  return a1;
}

char *sub_2345111A0(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(char *, uint64_t, uint64_t);
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t *v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;

  v6 = sub_23452BB30();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 1, v6);
  v10 = v8(a2, 1, v6);
  if (v9)
  {
    if (!v10)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v10)
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(a1, v6);
LABEL_6:
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_25615ECC8);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 40))(a1, a2, v6);
LABEL_7:
  v12 = a3[5];
  v13 = a3[6];
  v14 = &a1[v12];
  v15 = &a2[v12];
  *(_QWORD *)v14 = *(_QWORD *)v15;
  v14[8] = v15[8];
  v16 = &a1[v13];
  v17 = &a2[v13];
  *(_QWORD *)v16 = *(_QWORD *)v17;
  v16[8] = v17[8];
  v18 = a3[7];
  v19 = &a1[v18];
  v20 = &a2[v18];
  v22 = *(_QWORD *)v20;
  v21 = *((_QWORD *)v20 + 1);
  *(_QWORD *)v19 = v22;
  *((_QWORD *)v19 + 1) = v21;
  swift_bridgeObjectRelease();
  v23 = a3[8];
  v24 = (uint64_t *)&a1[v23];
  v25 = (uint64_t *)&a2[v23];
  v26 = *(_QWORD *)&a1[v23 + 8];
  if (v26 >> 60 != 15)
  {
    v27 = v25[1];
    if (v27 >> 60 != 15)
    {
      v28 = *v24;
      *v24 = *v25;
      v24[1] = v27;
      sub_2345011D4(v28, v26);
      goto LABEL_12;
    }
    sub_23451106C((uint64_t)v24);
  }
  *(_OWORD *)v24 = *(_OWORD *)v25;
LABEL_12:
  v24[2] = v25[2];
  return a1;
}

uint64_t sub_234511344()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_234511350(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;
  int v10;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25615ECC8);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 28) + 8);
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  v10 = v9 - 1;
  if (v10 < 0)
    v10 = -1;
  return (v10 + 1);
}

uint64_t sub_2345113E0()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2345113EC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = __swift_instantiateConcreteTypeFromMangledName(&qword_25615ECC8);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 28) + 8) = a2;
  return result;
}

void sub_23451146C()
{
  unint64_t v0;

  sub_2345114F4();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void sub_2345114F4()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_25615F1E8[0])
  {
    sub_23452BB30();
    v0 = sub_23452BD40();
    if (!v1)
      atomic_store(v0, qword_25615F1E8);
  }
}

uint64_t _s14DeviceCriteriaO10FabricNodeVwxx(uint64_t a1)
{
  return sub_2345011D4(*(_QWORD *)a1, *(_QWORD *)(a1 + 8));
}

uint64_t *_s14DeviceCriteriaO10FabricNodeVwCP_0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  unint64_t v5;

  v4 = *a2;
  v5 = a2[1];
  sub_23450081C(*a2, v5);
  *a1 = v4;
  a1[1] = v5;
  a1[2] = a2[2];
  return a1;
}

uint64_t *_s14DeviceCriteriaO10FabricNodeVwca(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v4 = *a2;
  v5 = a2[1];
  sub_23450081C(*a2, v5);
  v6 = *a1;
  v7 = a1[1];
  *a1 = v4;
  a1[1] = v5;
  sub_2345011D4(v6, v7);
  a1[2] = a2[2];
  return a1;
}

uint64_t *_s14DeviceCriteriaO10FabricNodeVwta(uint64_t *a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t v5;

  v4 = *a1;
  v5 = a1[1];
  *(_OWORD *)a1 = *(_OWORD *)a2;
  sub_2345011D4(v4, v5);
  a1[2] = *(_QWORD *)(a2 + 16);
  return a1;
}

uint64_t _s14DeviceCriteriaO10FabricNodeVwet(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  if (!a2)
    return 0;
  if (a2 >= 0xD && *(_BYTE *)(a1 + 24))
    return (*(_DWORD *)a1 + 13);
  v3 = (((*(_QWORD *)(a1 + 8) >> 60) >> 2) & 0xFFFFFFF3 | (4 * ((*(_QWORD *)(a1 + 8) >> 60) & 3))) ^ 0xF;
  if (v3 >= 0xC)
    v3 = -1;
  return v3 + 1;
}

uint64_t _s14DeviceCriteriaO10FabricNodeVwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xC)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 13;
    if (a3 >= 0xD)
      *(_BYTE *)(result + 24) = 1;
  }
  else
  {
    if (a3 >= 0xD)
      *(_BYTE *)(result + 24) = 0;
    if (a2)
    {
      *(_QWORD *)result = 0;
      *(_QWORD *)(result + 8) = (unint64_t)(((-a2 >> 2) & 3) - 4 * a2) << 60;
    }
  }
  return result;
}

ValueMetadata *_s14DeviceCriteriaO10FabricNodeVMa()
{
  return &_s14DeviceCriteriaO10FabricNodeVN;
}

void static MatterAddDeviceExtensionRequestHandler.ThreadNetworkAssociation.defaultSystemNetwork.getter(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 0;
  *(_BYTE *)(a1 + 8) = 1;
}

uint64_t static MatterAddDeviceExtensionRequestHandler.ThreadNetworkAssociation.network(extendedPANID:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

uint64_t sub_234511708(_QWORD *a1, uint64_t a2, int a3)
{
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  char v21;
  char v22;

  v20 = a3;
  v17 = a2;
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_25615F278);
  v16 = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v18);
  v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25615F280);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25615F288);
  v19 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_234512718();
  sub_23452C010();
  if ((v20 & 1) != 0)
  {
    v21 = 0;
    sub_2345127A0();
    sub_23452BED8();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  else
  {
    v22 = 1;
    sub_23451275C();
    sub_23452BED8();
    v13 = v18;
    sub_23452BF38();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v5, v13);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v19 + 8))(v12, v10);
}

uint64_t sub_234511920()
{
  sub_234512718();
  return sub_23452C01C();
}

uint64_t sub_234511948()
{
  sub_234512718();
  return sub_23452C028();
}

uint64_t sub_234511970()
{
  sub_2345127A0();
  return sub_23452C01C();
}

uint64_t sub_234511998()
{
  sub_2345127A0();
  return sub_23452C028();
}

uint64_t sub_2345119C4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2345122EC(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_2345119EC()
{
  sub_23451275C();
  return sub_23452C01C();
}

uint64_t sub_234511A14()
{
  sub_23451275C();
  return sub_23452C028();
}

uint64_t sub_234511A3C()
{
  uint64_t v0;
  int v1;

  v1 = *(unsigned __int8 *)(v0 + 8);
  sub_23452BF8C();
  sub_23452BF98();
  if (v1 != 1)
    sub_23452BFBC();
  return sub_23452BFC8();
}

uint64_t sub_234511AA8()
{
  uint64_t v0;

  if (*(_BYTE *)(v0 + 8) == 1)
    return sub_23452BF98();
  sub_23452BF98();
  return sub_23452BFBC();
}

uint64_t sub_234511AF4()
{
  uint64_t v0;
  int v1;

  v1 = *(unsigned __int8 *)(v0 + 8);
  sub_23452BF8C();
  sub_23452BF98();
  if (v1 != 1)
    sub_23452BFBC();
  return sub_23452BFC8();
}

uint64_t sub_234511B5C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t result;
  char v5;

  result = sub_2345123AC(a1);
  if (!v2)
  {
    *(_QWORD *)a2 = result;
    *(_BYTE *)(a2 + 8) = v5 & 1;
  }
  return result;
}

uint64_t sub_234511B8C(_QWORD *a1)
{
  uint64_t v1;

  return sub_234511708(a1, *(_QWORD *)v1, *(unsigned __int8 *)(v1 + 8));
}

BOOL sub_234511BA8(uint64_t a1, uint64_t a2)
{
  if (*(_BYTE *)(a1 + 8) == 1)
    return (*(_BYTE *)(a2 + 8) & 1) != 0;
  if ((*(_BYTE *)(a2 + 8) & 1) != 0)
    return 0;
  return *(_QWORD *)a1 == *(_QWORD *)a2;
}

uint64_t MatterAddDeviceExtensionRequestHandler.ThreadNetworkAssociation.hash(into:)()
{
  uint64_t v0;

  if (*(_BYTE *)(v0 + 8) == 1)
    return sub_23452BF98();
  sub_23452BF98();
  return sub_23452BFBC();
}

uint64_t static MatterAddDeviceExtensionRequestHandler.ThreadNetworkAssociation.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  int v2;

  v2 = *(unsigned __int8 *)(a2 + 8);
  if (*(_BYTE *)(a1 + 8) == 1)
  {
    if ((v2 & 1) != 0)
      return 1;
  }
  else
  {
    if (*(_QWORD *)a1 != *(_QWORD *)a2)
      v2 = 1;
    if (v2 != 1)
      return 1;
  }
  return 0;
}

uint64_t sub_234511C6C()
{
  sub_234511DC4();
  return sub_23452C01C();
}

uint64_t sub_234511C94()
{
  sub_234511DC4();
  return sub_23452C028();
}

uint64_t MatterAddDeviceExtensionRequestHandler.ThreadNetworkAssociation.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char v8;
  uint64_t v10;
  char v11;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25615F228);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *v1;
  v8 = *((_BYTE *)v1 + 8);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_234511DC4();
  sub_23452C010();
  v10 = v7;
  v11 = v8;
  sub_234511E08();
  sub_23452BF08();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_234511DC4()
{
  unint64_t result;

  result = qword_25615F230;
  if (!qword_25615F230)
  {
    result = MEMORY[0x23493FDE0](&unk_23452FEF0, &_s14descr250599331V24ThreadNetworkAssociationV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25615F230);
  }
  return result;
}

unint64_t sub_234511E08()
{
  unint64_t result;

  result = qword_25615F238;
  if (!qword_25615F238)
  {
    result = MEMORY[0x23493FDE0](&unk_23452FEC8, &_s14descr250599331V24ThreadNetworkAssociationV18AssociationDetailsON);
    atomic_store(result, (unint64_t *)&qword_25615F238);
  }
  return result;
}

uint64_t MatterAddDeviceExtensionRequestHandler.ThreadNetworkAssociation.hashValue.getter()
{
  uint64_t v0;
  int v1;

  v1 = *(unsigned __int8 *)(v0 + 8);
  sub_23452BF8C();
  sub_23452BF98();
  if (v1 != 1)
    sub_23452BFBC();
  return sub_23452BFC8();
}

uint64_t MatterAddDeviceExtensionRequestHandler.ThreadNetworkAssociation.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char v9;
  uint64_t v11;
  char v12;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25615F240);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_234511DC4();
  sub_23452C004();
  if (!v2)
  {
    sub_234511FE0();
    sub_23452BE90();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    v9 = v12;
    *(_QWORD *)a2 = v11;
    *(_BYTE *)(a2 + 8) = v9;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

unint64_t sub_234511FE0()
{
  unint64_t result;

  result = qword_25615F248;
  if (!qword_25615F248)
  {
    result = MEMORY[0x23493FDE0](&unk_23452FEA0, &_s14descr250599331V24ThreadNetworkAssociationV18AssociationDetailsON);
    atomic_store(result, (unint64_t *)&qword_25615F248);
  }
  return result;
}

unint64_t sub_234512028()
{
  unint64_t result;

  result = qword_25615F250;
  if (!qword_25615F250)
  {
    result = MEMORY[0x23493FDE0](&protocol conformance descriptor for MatterAddDeviceExtensionRequestHandler.ThreadNetworkAssociation, &type metadata for MatterAddDeviceExtensionRequestHandler.ThreadNetworkAssociation);
    atomic_store(result, (unint64_t *)&qword_25615F250);
  }
  return result;
}

uint64_t sub_23451206C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return MatterAddDeviceExtensionRequestHandler.ThreadNetworkAssociation.init(from:)(a1, a2);
}

uint64_t sub_234512080(_QWORD *a1)
{
  return MatterAddDeviceExtensionRequestHandler.ThreadNetworkAssociation.encode(to:)(a1);
}

uint64_t sub_234512094(uint64_t a1, uint64_t a2)
{
  char v2;

  v2 = *(_BYTE *)(a2 + 8);
  if (*(_BYTE *)(a1 + 8) == 1)
  {
    if ((*(_BYTE *)(a2 + 8) & 1) == 0)
      return 0;
  }
  else
  {
    if (*(_QWORD *)a1 != *(_QWORD *)a2)
      v2 = 1;
    if ((v2 & 1) != 0)
      return 0;
  }
  return 1;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_BYTE *)(result + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t _s14descr250599331V24ThreadNetworkAssociationV18AssociationDetailsOwet(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 9))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t _s14descr250599331V24ThreadNetworkAssociationVwst(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_BYTE *)(result + 8) = 0;
    *(_QWORD *)result = (a2 - 1);
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
  *(_BYTE *)(result + 9) = v3;
  return result;
}

ValueMetadata *type metadata accessor for MatterAddDeviceExtensionRequestHandler.ThreadNetworkAssociation()
{
  return &type metadata for MatterAddDeviceExtensionRequestHandler.ThreadNetworkAssociation;
}

uint64_t _s14descr250599331V24ThreadNetworkAssociationV18AssociationDetailsOwst(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)result = 0;
    *(_BYTE *)(result + 8) = 0;
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
  *(_BYTE *)(result + 9) = v3;
  return result;
}

uint64_t sub_23451216C(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 8))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_234512188(uint64_t result, int a2)
{
  if (a2)
  {
    *(_QWORD *)result = (a2 - 1);
    *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    *(_BYTE *)(result + 8) = 0;
  }
  return result;
}

ValueMetadata *_s14descr250599331V24ThreadNetworkAssociationV18AssociationDetailsOMa()
{
  return &_s14descr250599331V24ThreadNetworkAssociationV18AssociationDetailsON;
}

ValueMetadata *_s14descr250599331V24ThreadNetworkAssociationV10CodingKeysOMa()
{
  return &_s14descr250599331V24ThreadNetworkAssociationV10CodingKeysON;
}

unint64_t sub_2345121D0()
{
  unint64_t result;

  result = qword_25615F258;
  if (!qword_25615F258)
  {
    result = MEMORY[0x23493FDE0](&unk_23452FE10, &_s14descr250599331V24ThreadNetworkAssociationV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25615F258);
  }
  return result;
}

unint64_t sub_234512218()
{
  unint64_t result;

  result = qword_25615F260;
  if (!qword_25615F260)
  {
    result = MEMORY[0x23493FDE0](&unk_23452FE38, &_s14descr250599331V24ThreadNetworkAssociationV18AssociationDetailsON);
    atomic_store(result, (unint64_t *)&qword_25615F260);
  }
  return result;
}

unint64_t sub_234512260()
{
  unint64_t result;

  result = qword_25615F268;
  if (!qword_25615F268)
  {
    result = MEMORY[0x23493FDE0](&unk_23452FD80, &_s14descr250599331V24ThreadNetworkAssociationV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25615F268);
  }
  return result;
}

unint64_t sub_2345122A8()
{
  unint64_t result;

  result = qword_25615F270;
  if (!qword_25615F270)
  {
    result = MEMORY[0x23493FDE0](&unk_23452FDA8, &_s14descr250599331V24ThreadNetworkAssociationV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25615F270);
  }
  return result;
}

uint64_t sub_2345122EC(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 0x6465646E65747865 && a2 == 0xED000044494E4150)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_23452BF5C();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_234512388()
{
  return 0x6465646E65747865;
}

uint64_t sub_2345123AC(_QWORD *a1)
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
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  _QWORD *v26;
  char v27;
  char v28;

  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_25615F2A8);
  v24 = *(_QWORD *)(v22 - 8);
  MEMORY[0x24BDAC7A8](v22);
  v25 = (char *)&v21 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_25615F2B0);
  v3 = *(_QWORD *)(v23 - 8);
  MEMORY[0x24BDAC7A8](v23);
  v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25615F2B8);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = (uint64_t)__swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_234512718();
  v11 = (uint64_t)v26;
  sub_23452C004();
  if (v11)
    goto LABEL_6;
  v12 = v5;
  v13 = v25;
  v21 = v7;
  v26 = a1;
  v14 = sub_23452BECC();
  if (*(_QWORD *)(v14 + 16) != 1)
  {
    v17 = sub_23452BDAC();
    swift_allocError();
    v19 = v18;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25615E970);
    *v19 = &_s14descr250599331V24ThreadNetworkAssociationV18AssociationDetailsON;
    v10 = (uint64_t)v9;
    sub_23452BE54();
    sub_23452BDA0();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v17 - 8) + 104))(v19, *MEMORY[0x24BEE26D0], v17);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v21 + 8))(v9, v6);
    a1 = v26;
LABEL_6:
    __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
    return v10;
  }
  if ((*(_BYTE *)(v14 + 32) & 1) != 0)
  {
    v28 = 1;
    sub_23451275C();
    v15 = v13;
    sub_23452BE48();
    v16 = v22;
    v10 = sub_23452BEC0();
    (*(void (**)(char *, uint64_t))(v24 + 8))(v15, v16);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v21 + 8))(v9, v6);
  }
  else
  {
    v27 = 0;
    sub_2345127A0();
    sub_23452BE48();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v12, v23);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v21 + 8))(v9, v6);
    v10 = 0;
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
  return v10;
}

unint64_t sub_234512718()
{
  unint64_t result;

  result = qword_25615F290;
  if (!qword_25615F290)
  {
    result = MEMORY[0x23493FDE0](&unk_2345301D4, &_s14descr250599331V24ThreadNetworkAssociationV18AssociationDetailsO10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25615F290);
  }
  return result;
}

unint64_t sub_23451275C()
{
  unint64_t result;

  result = qword_25615F298;
  if (!qword_25615F298)
  {
    result = MEMORY[0x23493FDE0](&unk_234530184, &_s14descr250599331V24ThreadNetworkAssociationV18AssociationDetailsO17NetworkCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25615F298);
  }
  return result;
}

unint64_t sub_2345127A0()
{
  unint64_t result;

  result = qword_25615F2A0;
  if (!qword_25615F2A0)
  {
    result = MEMORY[0x23493FDE0](&unk_234530134, &_s14descr250599331V24ThreadNetworkAssociationV18AssociationDetailsO30DefaultSystemNetworkCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25615F2A0);
  }
  return result;
}

uint64_t _s14descr250599331V24ThreadNetworkAssociationV18AssociationDetailsO10CodingKeysOwst(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_234512830 + 4 * byte_23452FC75[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_234512864 + 4 * byte_23452FC70[v4]))();
}

uint64_t sub_234512864(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23451286C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x234512874);
  return result;
}

uint64_t sub_234512880(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x234512888);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_23451288C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_234512894(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *_s14descr250599331V24ThreadNetworkAssociationV18AssociationDetailsO10CodingKeysOMa()
{
  return &_s14descr250599331V24ThreadNetworkAssociationV18AssociationDetailsO10CodingKeysON;
}

ValueMetadata *_s14descr250599331V24ThreadNetworkAssociationV18AssociationDetailsO30DefaultSystemNetworkCodingKeysOMa()
{
  return &_s14descr250599331V24ThreadNetworkAssociationV18AssociationDetailsO30DefaultSystemNetworkCodingKeysON;
}

uint64_t _s14descr250599331V24ThreadNetworkAssociationV10CodingKeysOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_234512900 + 4 * byte_23452FC7A[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_234512920 + 4 * byte_23452FC7F[v4]))();
}

_BYTE *sub_234512900(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_234512920(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_234512928(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_234512930(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_234512938(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_234512940(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *_s14descr250599331V24ThreadNetworkAssociationV18AssociationDetailsO17NetworkCodingKeysOMa()
{
  return &_s14descr250599331V24ThreadNetworkAssociationV18AssociationDetailsO17NetworkCodingKeysON;
}

unint64_t sub_234512960()
{
  unint64_t result;

  result = qword_25615F2C0;
  if (!qword_25615F2C0)
  {
    result = MEMORY[0x23493FDE0](&unk_234530004, &_s14descr250599331V24ThreadNetworkAssociationV18AssociationDetailsO17NetworkCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25615F2C0);
  }
  return result;
}

unint64_t sub_2345129A8()
{
  unint64_t result;

  result = qword_25615F2C8;
  if (!qword_25615F2C8)
  {
    result = MEMORY[0x23493FDE0](&unk_23453010C, &_s14descr250599331V24ThreadNetworkAssociationV18AssociationDetailsO10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25615F2C8);
  }
  return result;
}

unint64_t sub_2345129F0()
{
  unint64_t result;

  result = qword_25615F2D0;
  if (!qword_25615F2D0)
  {
    result = MEMORY[0x23493FDE0](&unk_23453002C, &_s14descr250599331V24ThreadNetworkAssociationV18AssociationDetailsO30DefaultSystemNetworkCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25615F2D0);
  }
  return result;
}

unint64_t sub_234512A38()
{
  unint64_t result;

  result = qword_25615F2D8;
  if (!qword_25615F2D8)
  {
    result = MEMORY[0x23493FDE0](&unk_234530054, &_s14descr250599331V24ThreadNetworkAssociationV18AssociationDetailsO30DefaultSystemNetworkCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25615F2D8);
  }
  return result;
}

unint64_t sub_234512A80()
{
  unint64_t result;

  result = qword_25615F2E0;
  if (!qword_25615F2E0)
  {
    result = MEMORY[0x23493FDE0](&unk_23452FF74, &_s14descr250599331V24ThreadNetworkAssociationV18AssociationDetailsO17NetworkCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25615F2E0);
  }
  return result;
}

unint64_t sub_234512AC8()
{
  unint64_t result;

  result = qword_25615F2E8;
  if (!qword_25615F2E8)
  {
    result = MEMORY[0x23493FDE0](&unk_23452FF9C, &_s14descr250599331V24ThreadNetworkAssociationV18AssociationDetailsO17NetworkCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25615F2E8);
  }
  return result;
}

unint64_t sub_234512B10()
{
  unint64_t result;

  result = qword_25615F2F0;
  if (!qword_25615F2F0)
  {
    result = MEMORY[0x23493FDE0](&unk_23453007C, &_s14descr250599331V24ThreadNetworkAssociationV18AssociationDetailsO10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25615F2F0);
  }
  return result;
}

unint64_t sub_234512B58()
{
  unint64_t result;

  result = qword_25615F2F8;
  if (!qword_25615F2F8)
  {
    result = MEMORY[0x23493FDE0](&unk_2345300A4, &_s14descr250599331V24ThreadNetworkAssociationV18AssociationDetailsO10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25615F2F8);
  }
  return result;
}

uint64_t sub_234512B9C(char a1, char a2)
{
  char v3;

  if (*(_QWORD *)&aSsid_4[8 * a1] == *(_QWORD *)&aSsid_4[8 * a2] && qword_234530490[a1] == qword_234530490[a2])
    v3 = 1;
  else
    v3 = sub_23452BF5C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

void sub_234512C20(char a1)
{
  __asm { BR              X11 }
}

uint64_t sub_234512C6C(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_234512CD4 + 4 * byte_23453022C[a2]))(0x79676F6C6F706F74);
}

uint64_t sub_234512CD4(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 0x79676F6C6F706F74 && v1 == 0xE800000000000000)
    v2 = 1;
  else
    v2 = sub_23452BF5C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

void sub_234512D80(char a1)
{
  sub_23452BF8C();
  __asm { BR              X10 }
}

uint64_t sub_234512DD8()
{
  sub_23452BC38();
  swift_bridgeObjectRelease();
  return sub_23452BFC8();
}

uint64_t sub_234512E54()
{
  sub_23452BF8C();
  sub_23452BC38();
  swift_bridgeObjectRelease();
  return sub_23452BFC8();
}

uint64_t sub_234512EBC()
{
  sub_23452BC38();
  return swift_bridgeObjectRelease();
}

void sub_234512EFC(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_234512F40()
{
  sub_23452BC38();
  return swift_bridgeObjectRelease();
}

void sub_234512FA0(uint64_t a1, char a2)
{
  sub_23452BF8C();
  __asm { BR              X10 }
}

uint64_t sub_234512FF4()
{
  sub_23452BC38();
  swift_bridgeObjectRelease();
  return sub_23452BFC8();
}

uint64_t sub_234513070()
{
  sub_23452BF8C();
  sub_23452BC38();
  swift_bridgeObjectRelease();
  return sub_23452BFC8();
}

uint64_t MatterAddDeviceExtensionRequestHandler.WiFiScanResult.ssid.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)v0;
  sub_23450081C(*(_QWORD *)v0, *(_QWORD *)(v0 + 8));
  return v1;
}

uint64_t MatterAddDeviceExtensionRequestHandler.WiFiScanResult.ssid.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = sub_2345011D4(*(_QWORD *)v2, *(_QWORD *)(v2 + 8));
  *(_QWORD *)v2 = a1;
  *(_QWORD *)(v2 + 8) = a2;
  return result;
}

uint64_t (*MatterAddDeviceExtensionRequestHandler.WiFiScanResult.ssid.modify())()
{
  return nullsub_1;
}

uint64_t MatterAddDeviceExtensionRequestHandler.WiFiScanResult.rssi.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 16);
}

uint64_t MatterAddDeviceExtensionRequestHandler.WiFiScanResult.rssi.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 16) = result;
  return result;
}

uint64_t (*MatterAddDeviceExtensionRequestHandler.WiFiScanResult.rssi.modify())()
{
  return nullsub_1;
}

uint64_t MatterAddDeviceExtensionRequestHandler.WiFiScanResult.security.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 17);
}

uint64_t MatterAddDeviceExtensionRequestHandler.WiFiScanResult.security.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 17) = result;
  return result;
}

uint64_t (*MatterAddDeviceExtensionRequestHandler.WiFiScanResult.security.modify())()
{
  return nullsub_1;
}

uint64_t MatterAddDeviceExtensionRequestHandler.WiFiScanResult.band.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 18);
}

uint64_t MatterAddDeviceExtensionRequestHandler.WiFiScanResult.band.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 18) = result;
  return result;
}

uint64_t (*MatterAddDeviceExtensionRequestHandler.WiFiScanResult.band.modify())()
{
  return nullsub_1;
}

uint64_t MatterAddDeviceExtensionRequestHandler.WiFiScanResult.init(ssid:rssi:security:band:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, char a3@<W2>, char a4@<W3>, char a5@<W4>, uint64_t a6@<X8>)
{
  *(_QWORD *)a6 = result;
  *(_QWORD *)(a6 + 8) = a2;
  *(_BYTE *)(a6 + 16) = a3;
  *(_BYTE *)(a6 + 17) = a4;
  *(_BYTE *)(a6 + 18) = a5;
  return result;
}

uint64_t MatterAddDeviceExtensionRequestHandler.WiFiScanResult.hash(into:)()
{
  uint64_t *v0;
  uint64_t v1;
  unint64_t v2;

  v1 = *v0;
  v2 = v0[1];
  sub_23450081C(*v0, v2);
  sub_23452BB0C();
  sub_2345011D4(v1, v2);
  sub_23452BFA4();
  sub_23452BFA4();
  return sub_23452BFA4();
}

uint64_t MatterAddDeviceExtensionRequestHandler.WiFiScanResult.hashValue.getter()
{
  uint64_t *v0;
  uint64_t v1;
  unint64_t v2;

  v1 = *v0;
  v2 = v0[1];
  sub_23452BF8C();
  sub_23450081C(v1, v2);
  sub_23452BB0C();
  sub_2345011D4(v1, v2);
  sub_23452BFA4();
  sub_23452BFA4();
  sub_23452BFA4();
  return sub_23452BFC8();
}

uint64_t sub_2345132E8(char a1)
{
  return *(_QWORD *)&aSsid_4[8 * a1];
}

uint64_t sub_234513308()
{
  uint64_t *v0;
  uint64_t v1;
  unint64_t v2;

  v1 = *v0;
  v2 = v0[1];
  sub_23452BF8C();
  sub_23450081C(v1, v2);
  sub_23452BB0C();
  sub_2345011D4(v1, v2);
  sub_23452BFA4();
  sub_23452BFA4();
  sub_23452BFA4();
  return sub_23452BFC8();
}

uint64_t sub_2345133A8()
{
  uint64_t *v0;
  uint64_t v1;
  unint64_t v2;

  v1 = *v0;
  v2 = v0[1];
  sub_23450081C(*v0, v2);
  sub_23452BB0C();
  sub_2345011D4(v1, v2);
  sub_23452BFA4();
  sub_23452BFA4();
  return sub_23452BFA4();
}

uint64_t sub_234513430()
{
  uint64_t *v0;
  uint64_t v1;
  unint64_t v2;

  v1 = *v0;
  v2 = v0[1];
  sub_23452BF8C();
  sub_23450081C(v1, v2);
  sub_23452BB0C();
  sub_2345011D4(v1, v2);
  sub_23452BFA4();
  sub_23452BFA4();
  sub_23452BFA4();
  return sub_23452BFC8();
}

uint64_t sub_2345134D0(char *a1, char *a2)
{
  return sub_234512B9C(*a1, *a2);
}

uint64_t sub_2345134DC()
{
  return sub_234512E54();
}

uint64_t sub_2345134E4()
{
  return sub_234512EBC();
}

uint64_t sub_2345134EC()
{
  return sub_234513070();
}

uint64_t sub_2345134F4@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_234513EF4();
  *a1 = result;
  return result;
}

uint64_t sub_234513520@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_2345132E8(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_234513548()
{
  char *v0;

  return sub_2345132E8(*v0);
}

uint64_t sub_234513550@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_234513EF4();
  *a1 = result;
  return result;
}

uint64_t sub_234513574()
{
  sub_234513AFC();
  return sub_23452C01C();
}

uint64_t sub_23451359C()
{
  sub_234513AFC();
  return sub_23452C028();
}

uint64_t MatterAddDeviceExtensionRequestHandler.WiFiScanResult.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  char v18;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25615F300);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_234513AFC();
  sub_23452C004();
  if (!v2)
  {
    v18 = 0;
    sub_234502D48();
    sub_23452BE90();
    v10 = v15;
    v9 = v16;
    LOBYTE(v15) = 1;
    v17 = sub_23452BE9C();
    LOBYTE(v15) = 2;
    v14 = sub_23452BEA8();
    LOBYTE(v15) = 3;
    v12 = sub_23452BEA8();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *(_QWORD *)a2 = v10;
    *(_QWORD *)(a2 + 8) = v9;
    *(_BYTE *)(a2 + 16) = v17;
    *(_BYTE *)(a2 + 17) = v14;
    *(_BYTE *)(a2 + 18) = v12;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t MatterAddDeviceExtensionRequestHandler.WiFiScanResult.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  _DWORD v12[2];
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  char v17;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25615F310);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *v1;
  v7 = v1[1];
  v16 = *((unsigned __int8 *)v1 + 16);
  v9 = *((unsigned __int8 *)v1 + 17);
  v12[0] = *((unsigned __int8 *)v1 + 18);
  v12[1] = v9;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_234513AFC();
  sub_23452C010();
  v14 = v8;
  v15 = v7;
  v17 = 0;
  sub_234502CC0();
  v10 = v13;
  sub_23452BF08();
  if (!v10)
  {
    LOBYTE(v14) = 1;
    sub_23452BF14();
    LOBYTE(v14) = 2;
    sub_23452BF20();
    LOBYTE(v14) = 3;
    sub_23452BF20();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_234513944@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return MatterAddDeviceExtensionRequestHandler.WiFiScanResult.init(from:)(a1, a2);
}

uint64_t sub_234513958(_QWORD *a1)
{
  return MatterAddDeviceExtensionRequestHandler.WiFiScanResult.encode(to:)(a1);
}

void _s13MatterSupport0A32AddDeviceExtensionRequestHandlerC14WiFiScanResultV2eeoiySbAE_AEtFZ_0(uint64_t a1)
{
  __asm { BR              X11 }
}

uint64_t sub_2345139CC()
{
  unint64_t v0;

  return ((uint64_t (*)(void))((char *)&loc_234513A00 + dword_234513AEC[v0 >> 62]))();
}

BOOL sub_234513A10@<W0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  char v11;
  char v12;
  _BOOL8 result;

  if (a1 != BYTE6(v4))
    return 0;
  if (a1 < 1)
  {
    if (v8 == v10 && v6 == v9)
      return v5 == v7;
    return 0;
  }
  sub_23450081C(v3, v4);
  sub_23450E60C(v1, v2);
  v12 = v11;
  result = 0;
  if ((v12 & 1) != 0 && v8 == v10 && v6 == v9)
    return v5 == v7;
  return result;
}

unint64_t sub_234513AFC()
{
  unint64_t result;

  result = qword_25615F308;
  if (!qword_25615F308)
  {
    result = MEMORY[0x23493FDE0](&unk_234530420, &_s14descr250599501V14WiFiScanResultV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25615F308);
  }
  return result;
}

unint64_t sub_234513B44()
{
  unint64_t result;

  result = qword_25615F318;
  if (!qword_25615F318)
  {
    result = MEMORY[0x23493FDE0](&protocol conformance descriptor for MatterAddDeviceExtensionRequestHandler.WiFiScanResult, &type metadata for MatterAddDeviceExtensionRequestHandler.WiFiScanResult);
    atomic_store(result, (unint64_t *)&qword_25615F318);
  }
  return result;
}

uint64_t sub_234513B8C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t v5;

  v4 = *(_QWORD *)a2;
  v5 = *(_QWORD *)(a2 + 8);
  sub_23450081C(*(_QWORD *)a2, v5);
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_WORD *)(a1 + 17) = *(_WORD *)(a2 + 17);
  return a1;
}

uint64_t _s14descr250599501V14WiFiScanResultVwca(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v4 = *(_QWORD *)a2;
  v5 = *(_QWORD *)(a2 + 8);
  sub_23450081C(*(_QWORD *)a2, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  sub_2345011D4(v6, v7);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_BYTE *)(a1 + 17) = *(_BYTE *)(a2 + 17);
  *(_BYTE *)(a1 + 18) = *(_BYTE *)(a2 + 18);
  return a1;
}

__n128 __swift_memcpy19_8(uint64_t a1, uint64_t a2)
{
  __n128 result;

  result = *(__n128 *)a2;
  *(_DWORD *)(a1 + 15) = *(_DWORD *)(a2 + 15);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t _s14descr250599501V14WiFiScanResultVwta(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t v5;

  v4 = *(_QWORD *)a1;
  v5 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  sub_2345011D4(v4, v5);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_WORD *)(a1 + 17) = *(_WORD *)(a2 + 17);
  return a1;
}

uint64_t _s14descr250599501V14WiFiScanResultVwet(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  if (!a2)
    return 0;
  if (a2 >= 0xD && *(_BYTE *)(a1 + 19))
    return (*(_DWORD *)a1 + 13);
  v3 = (((*(_QWORD *)(a1 + 8) >> 60) >> 2) & 0xFFFFFFF3 | (4 * ((*(_QWORD *)(a1 + 8) >> 60) & 3))) ^ 0xF;
  if (v3 >= 0xC)
    v3 = -1;
  return v3 + 1;
}

uint64_t _s14descr250599501V14WiFiScanResultVwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xC)
  {
    *(_BYTE *)(result + 18) = 0;
    *(_WORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 13;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xD)
      *(_BYTE *)(result + 19) = 1;
  }
  else
  {
    if (a3 >= 0xD)
      *(_BYTE *)(result + 19) = 0;
    if (a2)
    {
      *(_QWORD *)result = 0;
      *(_QWORD *)(result + 8) = (unint64_t)(((-a2 >> 2) & 3) - 4 * a2) << 60;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MatterAddDeviceExtensionRequestHandler.WiFiScanResult()
{
  return &type metadata for MatterAddDeviceExtensionRequestHandler.WiFiScanResult;
}

uint64_t _s14descr250599501V14WiFiScanResultV10CodingKeysOwst(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_234513D9C + 4 * byte_234530241[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_234513DD0 + 4 * byte_23453023C[v4]))();
}

uint64_t sub_234513DD0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_234513DD8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x234513DE0);
  return result;
}

uint64_t sub_234513DEC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x234513DF4);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_234513DF8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_234513E00(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *_s14descr250599501V14WiFiScanResultV10CodingKeysOMa()
{
  return &_s14descr250599501V14WiFiScanResultV10CodingKeysON;
}

unint64_t sub_234513E20()
{
  unint64_t result;

  result = qword_25615F320;
  if (!qword_25615F320)
  {
    result = MEMORY[0x23493FDE0](&unk_2345303F8, &_s14descr250599501V14WiFiScanResultV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25615F320);
  }
  return result;
}

unint64_t sub_234513E68()
{
  unint64_t result;

  result = qword_25615F328;
  if (!qword_25615F328)
  {
    result = MEMORY[0x23493FDE0](&unk_234530330, &_s14descr250599501V14WiFiScanResultV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25615F328);
  }
  return result;
}

unint64_t sub_234513EB0()
{
  unint64_t result;

  result = qword_25615F330;
  if (!qword_25615F330)
  {
    result = MEMORY[0x23493FDE0](&unk_234530358, &_s14descr250599501V14WiFiScanResultV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25615F330);
  }
  return result;
}

uint64_t sub_234513EF4()
{
  unint64_t v0;

  v0 = sub_23452BE3C();
  swift_bridgeObjectRelease();
  if (v0 >= 4)
    return 4;
  else
    return v0;
}

uint64_t MatterAddDeviceRequest.Home.init(displayName:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  *a3 = result;
  a3[1] = a2;
  return result;
}

uint64_t MatterAddDeviceRequest.Home.displayName.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t MatterAddDeviceRequest.Home.displayName.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*MatterAddDeviceRequest.Home.displayName.modify())()
{
  return nullsub_1;
}

uint64_t MatterAddDeviceRequest.Home.hash(into:)()
{
  swift_bridgeObjectRetain();
  sub_23452BC38();
  return swift_bridgeObjectRelease();
}

uint64_t static MatterAddDeviceRequest.Home.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1])
    return 1;
  else
    return sub_23452BF5C();
}

uint64_t sub_234514028()
{
  sub_234514164();
  return sub_23452C01C();
}

uint64_t sub_234514050()
{
  sub_234514164();
  return sub_23452C028();
}

uint64_t MatterAddDeviceRequest.Home.encode(to:)(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25615F338);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_234514164();
  sub_23452C010();
  sub_23452BEE4();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

unint64_t sub_234514164()
{
  unint64_t result;

  result = qword_25615F340;
  if (!qword_25615F340)
  {
    result = MEMORY[0x23493FDE0](&unk_234530644, &_s4HomeV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25615F340);
  }
  return result;
}

uint64_t MatterAddDeviceRequest.Home.hashValue.getter()
{
  sub_23452BF8C();
  sub_23452BC38();
  return sub_23452BFC8();
}

uint64_t MatterAddDeviceRequest.Home.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25615F348);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_234514164();
  sub_23452C004();
  if (!v2)
  {
    v9 = sub_23452BE6C();
    v11 = v10;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v9;
    a2[1] = v11;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_23451430C()
{
  sub_23452BF8C();
  sub_23452BC38();
  return sub_23452BFC8();
}

uint64_t sub_234514354()
{
  return sub_23452BC38();
}

uint64_t sub_23451435C()
{
  sub_23452BF8C();
  sub_23452BC38();
  return sub_23452BFC8();
}

unint64_t sub_2345143A4()
{
  unint64_t result;

  result = qword_25615F350;
  if (!qword_25615F350)
  {
    result = MEMORY[0x23493FDE0](&protocol conformance descriptor for MatterAddDeviceRequest.Home, &type metadata for MatterAddDeviceRequest.Home);
    atomic_store(result, (unint64_t *)&qword_25615F350);
  }
  return result;
}

uint64_t sub_2345143E8@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return MatterAddDeviceRequest.Home.init(from:)(a1, a2);
}

uint64_t sub_2345143FC(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25615F338);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_234514164();
  sub_23452C010();
  sub_23452BEE4();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

ValueMetadata *type metadata accessor for MatterAddDeviceRequest.Home()
{
  return &type metadata for MatterAddDeviceRequest.Home;
}

uint64_t _s4HomeV10CodingKeysOwst(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_234514538 + 4 * byte_2345304B0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_234514558 + 4 * byte_2345304B5[v4]))();
}

_BYTE *sub_234514538(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_234514558(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_234514560(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_234514568(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_234514570(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_234514578(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *_s4HomeV10CodingKeysOMa()
{
  return &_s4HomeV10CodingKeysON;
}

unint64_t sub_234514598()
{
  unint64_t result;

  result = qword_25615F358;
  if (!qword_25615F358)
  {
    result = MEMORY[0x23493FDE0](&unk_23453061C, &_s4HomeV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25615F358);
  }
  return result;
}

unint64_t sub_2345145E0()
{
  unint64_t result;

  result = qword_25615F360;
  if (!qword_25615F360)
  {
    result = MEMORY[0x23493FDE0](&unk_23453058C, &_s4HomeV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25615F360);
  }
  return result;
}

unint64_t sub_234514628()
{
  unint64_t result;

  result = qword_25615F368[0];
  if (!qword_25615F368[0])
  {
    result = MEMORY[0x23493FDE0](&unk_2345305B4, &_s4HomeV10CodingKeysON);
    atomic_store(result, qword_25615F368);
  }
  return result;
}

uint64_t sub_23451466C()
{
  return swift_task_switch();
}

uint64_t sub_234514680()
{
  sub_23452BD7C();
  swift_bridgeObjectRelease();
  return sub_23452BE18();
}

uint64_t sub_234514708()
{
  return swift_task_switch();
}

uint64_t sub_23451471C()
{
  sub_23452BD7C();
  swift_bridgeObjectRelease();
  return sub_23452BE18();
}

uint64_t sub_2345147A4()
{
  return swift_task_switch();
}

uint64_t sub_2345147B8()
{
  sub_23452BD7C();
  swift_bridgeObjectRelease();
  return sub_23452BE18();
}

uint64_t sub_234514840()
{
  return swift_task_switch();
}

uint64_t sub_234514854()
{
  sub_23452BD7C();
  swift_bridgeObjectRelease();
  return sub_23452BE18();
}

uint64_t sub_2345148DC()
{
  return swift_task_switch();
}

uint64_t sub_2345148F0()
{
  sub_23452BD7C();
  swift_bridgeObjectRelease();
  return sub_23452BE18();
}

uint64_t sub_234514978()
{
  return swift_task_switch();
}

uint64_t sub_23451498C()
{
  sub_23452BD7C();
  swift_bridgeObjectRelease();
  return sub_23452BE18();
}

id MatterAddDeviceExtensionRequestHandler.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id MatterAddDeviceExtensionRequestHandler.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MatterAddDeviceExtensionRequestHandler();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for MatterAddDeviceExtensionRequestHandler()
{
  return objc_opt_self();
}

id MatterAddDeviceExtensionRequestHandler.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MatterAddDeviceExtensionRequestHandler();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for MatterAddDeviceExtensionRequestHandler()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of MatterAddDeviceExtensionRequestHandler.validateDeviceCredential(_:)(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t);

  v4 = *(int **)((*MEMORY[0x24BEE4EA0] & *v1) + 0x50);
  v7 = (uint64_t (*)(uint64_t))((char *)v4 + *v4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_2345082FC;
  return v7(a1);
}

uint64_t dispatch thunk of MatterAddDeviceExtensionRequestHandler.selectWiFiNetwork(from:)(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  int *v6;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t, uint64_t);

  v6 = *(int **)((*MEMORY[0x24BEE4EA0] & *v2) + 0x58);
  v9 = (uint64_t (*)(uint64_t, uint64_t))((char *)v6 + *v6);
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_2345082FC;
  return v9(a1, a2);
}

uint64_t dispatch thunk of MatterAddDeviceExtensionRequestHandler.selectThreadNetwork(from:)(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  int *v6;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t, uint64_t);

  v6 = *(int **)((*MEMORY[0x24BEE4EA0] & *v2) + 0x60);
  v9 = (uint64_t (*)(uint64_t, uint64_t))((char *)v6 + *v6);
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_2345082FC;
  return v9(a1, a2);
}

uint64_t dispatch thunk of MatterAddDeviceExtensionRequestHandler.commissionDevice(in:onboardingPayload:commissioningID:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  int *v10;
  _QWORD *v11;
  uint64_t (*v13)(uint64_t, uint64_t, uint64_t, uint64_t);

  v10 = *(int **)((*MEMORY[0x24BEE4EA0] & *v4) + 0x68);
  v13 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))((char *)v10 + *v10);
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v11;
  *v11 = v5;
  v11[1] = sub_234508148;
  return v13(a1, a2, a3, a4);
}

uint64_t dispatch thunk of MatterAddDeviceExtensionRequestHandler.rooms(in:)(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t);

  v4 = *(int **)((*MEMORY[0x24BEE4EA0] & *v1) + 0x70);
  v7 = (uint64_t (*)(uint64_t))((char *)v4 + *v4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_234514D84;
  return v7(a1);
}

uint64_t sub_234514D84(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v4;

  v4 = *v1;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t dispatch thunk of MatterAddDeviceExtensionRequestHandler.configureDevice(named:in:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  int *v8;
  _QWORD *v9;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t);

  v8 = *(int **)((*MEMORY[0x24BEE4EA0] & *v3) + 0x78);
  v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)v8 + *v8);
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v9;
  *v9 = v4;
  v9[1] = sub_234508148;
  return v11(a1, a2, a3);
}

uint64_t sub_234514E70(uint64_t a1)
{
  void *v1;
  void *v2;
  objc_class *ObjectType;
  char *v5;
  id v6;
  uint64_t result;
  objc_super v8;
  uint64_t v9;
  _QWORD v10[3];
  uint64_t v11;

  v2 = v1;
  ObjectType = (objc_class *)swift_getObjectType();
  sub_234518DF4(a1, (uint64_t)v10);
  type metadata accessor for MatterAddDeviceExtensionRequestHandler();
  v5 = v2;
  if (swift_dynamicCast())
  {
    *(_QWORD *)&v5[OBJC_IVAR____TtC13MatterSupport41MatterAddDeviceExtensionConnectionHandler_extensionRequestHandler] = v9;

    v8.receiver = v5;
    v8.super_class = ObjectType;
    v6 = objc_msgSendSuper2(&v8, sel_init);
    __swift_destroy_boxed_opaque_existential_1(a1);
    return (uint64_t)v6;
  }
  else
  {
    sub_234518DF4(a1, (uint64_t)v10);
    sub_23452BD7C();
    sub_23452BC44();
    __swift_project_boxed_opaque_existential_1(v10, v11);
    sub_23452BF50();
    sub_23452BC44();
    __swift_project_boxed_opaque_existential_1(v10, v11);
    swift_getDynamicType();
    sub_23452C034();
    sub_23452BC44();
    swift_bridgeObjectRelease();
    sub_23452BC44();
    result = sub_23452BE18();
    __break(1u);
  }
  return result;
}

uint64_t sub_234515064(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  _QWORD *v9;
  id v10;
  id v11;

  v2 = v1;
  if (qword_25615E8B0 != -1)
    swift_once();
  v4 = sub_23452BB60();
  __swift_project_value_buffer(v4, (uint64_t)qword_256165870);
  v5 = a1;
  v6 = sub_23452BB48();
  v7 = sub_23452BCC8();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    v9 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v8 = 138412290;
    v10 = v5;
    sub_23452BD4C();
    *v9 = v5;

    _os_log_impl(&dword_2344FE000, v6, v7, "Accepting XPC connection: %@", v8, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25615ED48);
    swift_arrayDestroy();
    MEMORY[0x23493FE58](v9, -1, -1);
    MEMORY[0x23493FE58](v8, -1, -1);

  }
  else
  {

  }
  v11 = objc_msgSend((id)objc_opt_self(), sel_mts_deviceSetupExtensionInterface);
  objc_msgSend(v5, sel_setExportedInterface_, v11);

  objc_msgSend(v5, sel_setExportedObject_, v2);
  objc_msgSend(v5, sel_activate);
  return 1;
}

uint64_t sub_2345152A8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 56) = a1;
  *(_QWORD *)(v2 + 64) = v1;
  return swift_task_switch();
}

uint64_t sub_2345152C0()
{
  _QWORD *v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t result;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  char v25;
  unsigned __int8 v26;
  unsigned __int8 v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  int *v31;
  _QWORD *v32;
  _QWORD *v33;
  _QWORD *v34;
  uint64_t v35;
  _QWORD *v36;
  unint64_t v37;
  int *v38;
  uint64_t v39;

  if (qword_25615E8B0 != -1)
    swift_once();
  v1 = sub_23452BB60();
  __swift_project_value_buffer(v1, (uint64_t)qword_256165870);
  swift_bridgeObjectRetain_n();
  v2 = sub_23452BB48();
  v3 = sub_23452BCC8();
  v36 = v0 + 7;
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    v5 = swift_slowAlloc();
    v39 = v5;
    *(_DWORD *)v4 = 136315138;
    v6 = sub_234507DD0(0, &qword_25615F628);
    v7 = swift_bridgeObjectRetain();
    v8 = MEMORY[0x23493F414](v7, v6);
    v10 = v9;
    swift_bridgeObjectRelease();
    v0[6] = sub_23451879C(v8, v10, &v39);
    sub_23452BD4C();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_2344FE000, v2, v3, "Selecting WiFi network from WiFi scan results: %s", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23493FE58](v5, -1, -1);
    MEMORY[0x23493FE58](v4, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  v11 = v0[7];
  v12 = *(_QWORD **)(v0[8]
                   + OBJC_IVAR____TtC13MatterSupport41MatterAddDeviceExtensionConnectionHandler_extensionRequestHandler);
  if (v11 >> 62)
  {
    swift_bridgeObjectRetain();
    v13 = sub_23452BE24();
    swift_bridgeObjectRelease();
  }
  else
  {
    v13 = *(_QWORD *)((v11 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v14 = MEMORY[0x24BEE4AF8];
  if (!v13)
    goto LABEL_18;
  v39 = MEMORY[0x24BEE4AF8];
  result = sub_2345190E8(0, v13 & ~(v13 >> 63), 0);
  if ((v13 & 0x8000000000000000) == 0)
  {
    v33 = v12;
    v34 = v0;
    v16 = 0;
    v37 = v11 & 0xC000000000000001;
    v35 = *v36 + 32;
    v14 = v39;
    v17 = v13;
    do
    {
      if (v37)
        v18 = (id)MEMORY[0x23493F534](v16, *v36);
      else
        v18 = *(id *)(v35 + 8 * v16);
      v19 = v18;
      v20 = objc_msgSend(v18, sel_ssid);
      v21 = sub_23452BB00();
      v23 = v22;

      v24 = objc_msgSend(v19, sel_rssi);
      v25 = sub_23452BF74();

      v26 = objc_msgSend(v19, sel_security);
      v27 = objc_msgSend(v19, sel_band);

      v39 = v14;
      v29 = *(_QWORD *)(v14 + 16);
      v28 = *(_QWORD *)(v14 + 24);
      if (v29 >= v28 >> 1)
      {
        sub_2345190E8(v28 > 1, v29 + 1, 1);
        v14 = v39;
      }
      ++v16;
      *(_QWORD *)(v14 + 16) = v29 + 1;
      v30 = v14 + 24 * v29;
      *(_QWORD *)(v30 + 32) = v21;
      *(_QWORD *)(v30 + 40) = v23;
      *(_BYTE *)(v30 + 48) = v25;
      *(_BYTE *)(v30 + 49) = v26;
      *(_BYTE *)(v30 + 50) = v27;
    }
    while (v17 != v16);
    v12 = v33;
    v0 = v34;
LABEL_18:
    v0[9] = v14;
    v31 = *(int **)((*MEMORY[0x24BEE4EA0] & *v12) + 0x58);
    v38 = (int *)((char *)v31 + *v31);
    v32 = (_QWORD *)swift_task_alloc();
    v0[10] = v32;
    *v32 = v0;
    v32[1] = sub_2345156C4;
    return ((uint64_t (*)(_QWORD *, uint64_t))v38)(v0 + 2, v14);
  }
  __break(1u);
  return result;
}

uint64_t sub_2345156C4()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 88) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_234515730()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  id v5;
  id v6;
  void *v7;
  void *v8;

  v2 = *(_QWORD *)(v0 + 16);
  v1 = *(_QWORD *)(v0 + 24);
  v3 = *(_QWORD *)(v0 + 32);
  v4 = *(_QWORD *)(v0 + 40);
  if (v1 >> 60 == 15)
  {
    sub_234501218(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40));
    v5 = 0;
  }
  else
  {
    v6 = objc_allocWithZone((Class)MTSWiFiNetworkAssociation);
    sub_234501198(v2, v1, v3, v4);
    v7 = (void *)sub_23452BAF4();
    v8 = (void *)sub_23452BAF4();
    v5 = objc_msgSend(v6, sel_initWithSSID_credentials_, v7, v8);
    sub_2345011D4(v2, v1);
    sub_2345011D4(v3, v4);

    sub_234501218(v2, v1, v3, v4);
  }
  return (*(uint64_t (**)(id))(v0 + 8))(v5);
}

uint64_t sub_23451583C()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2345159A0(int a1, void *aBlock, void *a3)
{
  _QWORD *v3;
  uint64_t v5;
  id v6;
  _QWORD *v7;

  v3[2] = a3;
  v3[3] = _Block_copy(aBlock);
  sub_234507DD0(0, &qword_25615F628);
  v5 = sub_23452BC68();
  v3[4] = v5;
  v6 = a3;
  v7 = (_QWORD *)swift_task_alloc();
  v3[5] = v7;
  *v7 = v3;
  v7[1] = sub_234515A54;
  v7[7] = v5;
  v7[8] = v6;
  return swift_task_switch();
}

uint64_t sub_234515A54(void *a1)
{
  void *v1;
  uint64_t *v2;
  void *v3;
  void *v5;
  uint64_t v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  void *v8;

  v3 = v1;
  v5 = *(void **)(*v2 + 16);
  v6 = *v2;
  swift_task_dealloc();

  swift_bridgeObjectRelease();
  v7 = *(void (***)(_QWORD, _QWORD, _QWORD))(v6 + 24);
  if (v3)
  {
    v8 = (void *)sub_23452BADC();

    ((void (**)(_QWORD, _QWORD, void *))v7)[2](v7, 0, v8);
    _Block_release(v7);
  }
  else
  {
    ((void (**)(_QWORD, void *, _QWORD))v7)[2](*(_QWORD *)(v6 + 24), a1, 0);
    _Block_release(v7);

  }
  return (*(uint64_t (**)(void))(v6 + 8))();
}

uint64_t sub_234515B20(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 40) = a1;
  *(_QWORD *)(v2 + 48) = v1;
  return swift_task_switch();
}

uint64_t sub_234515B38()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t result;
  _QWORD *v17;
  uint64_t v18;
  id v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  char v33;
  id v34;
  char v35;
  id v36;
  char v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  int *v41;
  _QWORD *v42;
  _QWORD *v43;
  _QWORD *v44;
  uint64_t v45;
  _QWORD *v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  __int16 v50;
  uint64_t v51;
  uint64_t v52;
  int *v53;
  uint64_t v54;

  if (qword_25615E8B0 != -1)
    swift_once();
  v1 = v0 + 5;
  v2 = sub_23452BB60();
  __swift_project_value_buffer(v2, (uint64_t)qword_256165870);
  swift_bridgeObjectRetain_n();
  v3 = sub_23452BB48();
  v4 = sub_23452BCC8();
  v46 = v0 + 5;
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    v6 = swift_slowAlloc();
    *(_DWORD *)v5 = 136315138;
    v54 = v6;
    v7 = sub_234507DD0(0, &qword_25615F5F0);
    v8 = swift_bridgeObjectRetain();
    v9 = MEMORY[0x23493F414](v8, v7);
    v11 = v10;
    swift_bridgeObjectRelease();
    v0[4] = sub_23451879C(v9, v11, &v54);
    v1 = v0 + 5;
    sub_23452BD4C();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_2344FE000, v3, v4, "Selecting Thread network from Thread scan results: %s", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23493FE58](v6, -1, -1);
    MEMORY[0x23493FE58](v5, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  v12 = v0[5];
  v13 = *(_QWORD **)(v0[6]
                   + OBJC_IVAR____TtC13MatterSupport41MatterAddDeviceExtensionConnectionHandler_extensionRequestHandler);
  if (v12 >> 62)
  {
    swift_bridgeObjectRetain();
    v14 = sub_23452BE24();
    swift_bridgeObjectRelease();
  }
  else
  {
    v14 = *(_QWORD *)((v12 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v15 = MEMORY[0x24BEE4AF8];
  if (!v14)
    goto LABEL_18;
  v54 = MEMORY[0x24BEE4AF8];
  result = sub_234519104(0, v14 & ~(v14 >> 63), 0);
  if ((v14 & 0x8000000000000000) == 0)
  {
    v43 = v13;
    v44 = v0;
    v17 = v1;
    v18 = 0;
    v47 = v12 & 0xC000000000000001;
    v48 = v14;
    v45 = *v17 + 32;
    v15 = v54;
    do
    {
      if (v47)
        v19 = (id)MEMORY[0x23493F534](v18, *v46);
      else
        v19 = *(id *)(v45 + 8 * v18);
      v20 = v19;
      v21 = objc_msgSend(v19, sel_networkName, v43, v44);
      v22 = sub_23452BC20();
      v51 = v23;
      v52 = v22;

      v24 = objc_msgSend(v20, sel_panID);
      v50 = sub_23452BFD4();

      v25 = objc_msgSend(v20, sel_extendedPANID);
      v49 = sub_23452BFE0();

      v26 = objc_msgSend(v20, sel_channel);
      v27 = sub_23452BFD4();

      v28 = objc_msgSend(v20, sel_extendedAddress);
      v29 = sub_23452BB00();
      v31 = v30;

      v32 = objc_msgSend(v20, sel_rssi);
      v33 = sub_23452BF74();

      v34 = objc_msgSend(v20, sel_version);
      v35 = sub_23452BF80();

      v36 = objc_msgSend(v20, "lqi");
      v37 = sub_23452BF80();

      v54 = v15;
      v39 = *(_QWORD *)(v15 + 16);
      v38 = *(_QWORD *)(v15 + 24);
      if (v39 >= v38 >> 1)
      {
        sub_234519104(v38 > 1, v39 + 1, 1);
        v15 = v54;
      }
      ++v18;
      *(_QWORD *)(v15 + 16) = v39 + 1;
      v40 = v15 + (v39 << 6);
      *(_QWORD *)(v40 + 32) = v52;
      *(_QWORD *)(v40 + 40) = v51;
      *(_WORD *)(v40 + 48) = v50;
      *(_QWORD *)(v40 + 56) = v49;
      *(_WORD *)(v40 + 64) = v27;
      *(_QWORD *)(v40 + 72) = v29;
      *(_QWORD *)(v40 + 80) = v31;
      *(_BYTE *)(v40 + 88) = v33;
      *(_BYTE *)(v40 + 89) = v35;
      *(_BYTE *)(v40 + 90) = v37;
    }
    while (v48 != v18);
    v13 = v43;
    v0 = v44;
LABEL_18:
    v0[7] = v15;
    v41 = *(int **)((*MEMORY[0x24BEE4EA0] & *v13) + 0x60);
    v53 = (int *)((char *)v41 + *v41);
    v42 = (_QWORD *)swift_task_alloc();
    v0[8] = v42;
    *v42 = v0;
    v42[1] = sub_234516014;
    return ((uint64_t (*)(_QWORD *, uint64_t))v53)(v0 + 2, v15);
  }
  __break(1u);
  return result;
}

uint64_t sub_234516014()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 72) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_234516080()
{
  uint64_t v0;
  id v1;
  id v2;
  void *v3;

  if ((*(_BYTE *)(v0 + 24) & 1) != 0)
  {
    v1 = 0;
  }
  else
  {
    v2 = objc_allocWithZone((Class)MTSThreadNetworkAssociation);
    v3 = (void *)sub_23452BFEC();
    v1 = objc_msgSend(v2, sel_initWithExtendedPANID_, v3);

  }
  return (*(uint64_t (**)(id))(v0 + 8))(v1);
}

uint64_t sub_234516104()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_234516268(int a1, void *aBlock, void *a3)
{
  _QWORD *v3;
  uint64_t v5;
  id v6;
  _QWORD *v7;

  v3[2] = a3;
  v3[3] = _Block_copy(aBlock);
  sub_234507DD0(0, &qword_25615F5F0);
  v5 = sub_23452BC68();
  v3[4] = v5;
  v6 = a3;
  v7 = (_QWORD *)swift_task_alloc();
  v3[5] = v7;
  *v7 = v3;
  v7[1] = sub_23451981C;
  v7[5] = v5;
  v7[6] = v6;
  return swift_task_switch();
}

uint64_t sub_23451631C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 72) = a1;
  *(_QWORD *)(v2 + 80) = v1;
  return swift_task_switch();
}

uint64_t sub_234516334()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  _BOOL4 v6;
  void *v7;
  uint8_t *v8;
  id v9;
  _QWORD *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int *v24;
  _QWORD *v25;
  _QWORD *v27;
  uint64_t (*v28)(uint64_t);

  if (qword_25615E8B0 != -1)
    swift_once();
  v1 = *(void **)(v0 + 72);
  v2 = sub_23452BB60();
  __swift_project_value_buffer(v2, (uint64_t)qword_256165870);
  v3 = v1;
  v4 = sub_23452BB48();
  v5 = sub_23452BCC8();
  v6 = os_log_type_enabled(v4, v5);
  v7 = *(void **)(v0 + 72);
  if (v6)
  {
    v8 = (uint8_t *)swift_slowAlloc();
    v27 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v8 = 138412290;
    *(_QWORD *)(v0 + 64) = v7;
    v9 = v7;
    sub_23452BD4C();
    *v27 = v7;

    _os_log_impl(&dword_2344FE000, v4, v5, "Validating device credential: %@", v8, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25615ED48);
    swift_arrayDestroy();
    MEMORY[0x23493FE58](v27, -1, -1);
    MEMORY[0x23493FE58](v8, -1, -1);
  }
  else
  {

  }
  v10 = *(_QWORD **)(*(_QWORD *)(v0 + 80)
                   + OBJC_IVAR____TtC13MatterSupport41MatterAddDeviceExtensionConnectionHandler_extensionRequestHandler);
  v11 = *(id *)(v0 + 72);
  v12 = objc_msgSend(v11, sel_certificationDeclaration);
  v13 = sub_23452BB00();
  v15 = v14;

  *(_QWORD *)(v0 + 88) = v13;
  *(_QWORD *)(v0 + 96) = v15;
  v16 = objc_msgSend(v11, sel_deviceAttestationCertificate);
  v17 = sub_23452BB00();
  v19 = v18;

  *(_QWORD *)(v0 + 104) = v17;
  *(_QWORD *)(v0 + 112) = v19;
  v20 = objc_msgSend(v11, sel_productAttestationIntermediateCertificate);
  v21 = sub_23452BB00();
  v23 = v22;

  *(_QWORD *)(v0 + 120) = v21;
  *(_QWORD *)(v0 + 128) = v23;
  *(_QWORD *)(v0 + 16) = v13;
  *(_QWORD *)(v0 + 24) = v15;
  *(_QWORD *)(v0 + 32) = v17;
  *(_QWORD *)(v0 + 40) = v19;
  *(_QWORD *)(v0 + 48) = v21;
  *(_QWORD *)(v0 + 56) = v23;
  v24 = *(int **)((*MEMORY[0x24BEE4EA0] & *v10) + 0x50);
  v28 = (uint64_t (*)(uint64_t))((char *)v24 + *v24);
  v25 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 136) = v25;
  *v25 = v0;
  v25[1] = sub_2345165CC;
  return v28(v0 + 16);
}

uint64_t sub_2345165CC()
{
  uint64_t v0;
  uint64_t *v1;
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *(_QWORD *)(*v1 + 128);
  v4 = *(_QWORD *)(*v1 + 112);
  v3 = *(_QWORD *)(*v1 + 120);
  v6 = *(_QWORD *)(*v1 + 96);
  v5 = *(_QWORD *)(*v1 + 104);
  v7 = *(_QWORD *)(*v1 + 88);
  v8 = *v1;
  *(_QWORD *)(v8 + 144) = v0;
  swift_task_dealloc();
  sub_2345011D4(v7, v6);
  sub_2345011D4(v5, v4);
  sub_2345011D4(v3, v2);
  if (v0)
    return swift_task_switch();
  else
    return (*(uint64_t (**)(void))(v8 + 8))();
}

uint64_t sub_23451668C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2345167C8(void *a1, void *aBlock, void *a3)
{
  _QWORD *v3;
  id v6;
  id v7;
  _QWORD *v8;

  v3[2] = a1;
  v3[3] = a3;
  v3[4] = _Block_copy(aBlock);
  v6 = a1;
  v7 = a3;
  v8 = (_QWORD *)swift_task_alloc();
  v3[5] = v8;
  *v8 = v3;
  v8[1] = sub_234516858;
  v8[9] = v6;
  v8[10] = v7;
  return swift_task_switch();
}

uint64_t sub_234516858()
{
  void *v0;
  uint64_t *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = *(void **)(*v1 + 16);
  v2 = *(void **)(*v1 + 24);
  v4 = *v1;
  swift_task_dealloc();

  v5 = *(_QWORD *)(v4 + 32);
  if (v0)
  {
    v6 = (void *)sub_23452BADC();

    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(v5 + 16))(*(_QWORD *)(v4 + 32), 0);
  }
  _Block_release(*(const void **)(v4 + 32));
  return (*(uint64_t (**)(void))(v4 + 8))();
}

uint64_t sub_2345168FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;

  v5[11] = a4;
  v5[12] = v4;
  v5[9] = a2;
  v5[10] = a3;
  v5[8] = a1;
  v6 = sub_23452BB30();
  v5[13] = v6;
  v5[14] = *(_QWORD *)(v6 - 8);
  v5[15] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_234516990()
{
  _QWORD *v0;
  uint64_t *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  _QWORD *v29;
  int *v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v34;
  _QWORD *v35;
  os_log_type_t v36;
  uint64_t v37;
  uint64_t v38[2];

  v38[1] = *MEMORY[0x24BDAC8D0];
  if (qword_25615E8B0 != -1)
    swift_once();
  v1 = v0 + 8;
  v2 = (void *)v0[8];
  v4 = v0[14];
  v3 = v0[15];
  v5 = v0[13];
  v6 = v0[11];
  v7 = sub_23452BB60();
  __swift_project_value_buffer(v7, (uint64_t)qword_256165870);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v3, v6, v5);
  v8 = v2;
  swift_bridgeObjectRetain_n();
  v9 = v8;
  v10 = sub_23452BB48();
  v11 = sub_23452BCC8();
  if (os_log_type_enabled(v10, v11))
  {
    v36 = v11;
    v12 = *v1;
    v13 = swift_slowAlloc();
    v35 = (_QWORD *)swift_slowAlloc();
    v37 = swift_slowAlloc();
    *(_DWORD *)v13 = 138412802;
    v38[0] = v37;
    if (v12)
    {
      v0[7] = v9;
      v14 = v9;
    }
    else
    {
      v0[4] = 0;
    }
    sub_23452BD4C();
    v23 = v0[15];
    v34 = v0[14];
    v24 = v0[13];
    v26 = v0[9];
    v25 = v0[10];
    *v35 = v0[8];

    *(_WORD *)(v13 + 12) = 2080;
    swift_bridgeObjectRetain();
    v0[5] = sub_23451879C(v26, v25, v38);
    sub_23452BD4C();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v13 + 22) = 2080;
    sub_234518F78();
    v27 = sub_23452BF44();
    v0[6] = sub_23451879C(v27, v28, v38);
    sub_23452BD4C();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v23, v24);
    _os_log_impl(&dword_2344FE000, v10, v36, "Pairing device in home: %@, onboarding payload: %s, uuid: %s", (uint8_t *)v13, 0x20u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25615ED48);
    swift_arrayDestroy();
    MEMORY[0x23493FE58](v35, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x23493FE58](v37, -1, -1);
    MEMORY[0x23493FE58](v13, -1, -1);

    if (!*v1)
      goto LABEL_10;
  }
  else
  {
    v16 = v0[14];
    v15 = v0[15];
    v17 = v0[13];

    swift_bridgeObjectRelease_n();
    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v15, v17);

    if (!*v1)
    {
LABEL_10:
      v20 = 0;
      v22 = 0;
      goto LABEL_11;
    }
  }
  v18 = v9;
  v19 = objc_msgSend(v18, sel_name);
  v20 = sub_23452BC20();
  v22 = v21;

LABEL_11:
  v0[16] = v22;
  v29 = *(_QWORD **)(v0[12]
                   + OBJC_IVAR____TtC13MatterSupport41MatterAddDeviceExtensionConnectionHandler_extensionRequestHandler);
  v0[2] = v20;
  v0[3] = v22;
  v30 = *(int **)((*MEMORY[0x24BEE4EA0] & *v29) + 0x68);
  v31 = *v30;
  v32 = (_QWORD *)swift_task_alloc();
  v0[17] = v32;
  *v32 = v0;
  v32[1] = sub_234516DA0;
  return ((uint64_t (*)(_QWORD *, _QWORD, _QWORD, _QWORD))((char *)v30 + v31))(v0 + 2, v0[9], v0[10], v0[11]);
}

uint64_t sub_234516DA0()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 144) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_234516E70()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_234517024(void *a1, uint64_t a2, uint64_t a3, const void *a4, void *a5)
{
  _QWORD *v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  _QWORD *v15;

  v5[2] = a1;
  v5[3] = a5;
  v9 = sub_23452BB30();
  v5[4] = v9;
  v5[5] = *(_QWORD *)(v9 - 8);
  v10 = swift_task_alloc();
  v5[6] = v10;
  v5[7] = _Block_copy(a4);
  v11 = sub_23452BC20();
  v13 = v12;
  v5[8] = v12;
  sub_23452BB24();
  v14 = a1;
  a5;
  v15 = (_QWORD *)swift_task_alloc();
  v5[9] = v15;
  *v15 = v5;
  v15[1] = sub_23451710C;
  return sub_2345168FC((uint64_t)a1, v11, v13, v10);
}

uint64_t sub_23451710C()
{
  void *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v3 = *(_QWORD *)(*v1 + 40);
  v2 = *(_QWORD *)(*v1 + 48);
  v5 = *(void **)(*v1 + 24);
  v4 = *(_QWORD *)(*v1 + 32);
  v6 = *(void **)(*v1 + 16);
  v7 = *v1;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);

  swift_bridgeObjectRelease();
  v8 = *(_QWORD *)(v7 + 56);
  if (v0)
  {
    v9 = (void *)sub_23452BADC();

    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(v8 + 16))(*(_QWORD *)(v7 + 56), 0);
  }
  _Block_release(*(const void **)(v7 + 56));
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v7 + 8))();
}

uint64_t sub_2345171E8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 112) = a1;
  *(_QWORD *)(v2 + 120) = v1;
  return swift_task_switch();
}

uint64_t sub_23451724C()
{
  _QWORD *v0;
  id *v1;
  void *v2;
  uint64_t *v3;
  uint64_t v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  _QWORD *v9;
  id v10;
  void *v11;
  _QWORD *v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int *v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;

  if (qword_25615E8B0 != -1)
    swift_once();
  v1 = (id *)(v0 + 11);
  v3 = v0 + 14;
  v2 = (void *)v0[14];
  v4 = sub_23452BB60();
  __swift_project_value_buffer(v4, (uint64_t)qword_256165870);
  v5 = v2;
  v6 = sub_23452BB48();
  v7 = sub_23452BCC8();
  if (os_log_type_enabled(v6, v7))
  {
    v23 = *v3;
    v8 = (uint8_t *)swift_slowAlloc();
    v9 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v8 = 138412290;
    if (v23)
    {
      v0[13] = v5;
      v10 = v5;
    }
    else
    {
      v0[12] = 0;
    }
    sub_23452BD4C();
    *v9 = *v3;

    _os_log_impl(&dword_2344FE000, v6, v7, "Fetching rooms in home: %@", v8, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25615ED48);
    swift_arrayDestroy();
    MEMORY[0x23493FE58](v9, -1, -1);
    MEMORY[0x23493FE58](v8, -1, -1);
    v1 = (id *)(v0 + 11);
  }
  else
  {

  }
  v11 = *(void **)(v0[15]
                 + OBJC_IVAR____TtC13MatterSupport41MatterAddDeviceExtensionConnectionHandler_extensionRequestHandler);
  v0[5] = type metadata accessor for MatterAddDeviceExtensionRequestHandler();
  v0[2] = v11;
  v12 = v11;
  if (swift_dynamicCast())
  {
    v13 = *v3;

    if (v13)
    {
      v14 = v5;
      v15 = objc_msgSend(v14, sel_name);
      v16 = sub_23452BC20();
      v18 = v17;

    }
    else
    {
      v16 = 0;
      v18 = 0;
    }
    v0[16] = v18;
    v0[6] = v16;
    v0[7] = v18;
    v20 = *(int **)((*MEMORY[0x24BEE4EA0] & *v12) + 0x70);
    v21 = *v20;
    v22 = (_QWORD *)swift_task_alloc();
    v0[17] = v22;
    *v22 = v0;
    v22[1] = sub_2345175FC;
    return ((uint64_t (*)(_QWORD *))((char *)v20 + v21))(v0 + 6);
  }
  else
  {
    sub_23452BD7C();
    v0[8] = 0;
    v0[9] = 0xE000000000000000;
    sub_23452BC44();
    v0[10] = v12;
    sub_23452BE00();
    return sub_23452BE18();
  }
}

uint64_t sub_2345175FC(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 144) = a1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_23451768C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v8;

  v1 = *(_QWORD *)(v0 + 144);
  v2 = *(_QWORD *)(v1 + 16);
  if (v2)
  {
    v8 = MEMORY[0x24BEE4AF8];
    sub_23452BDDC();
    v3 = v1 + 40;
    do
    {
      v4 = objc_allocWithZone((Class)MTSDeviceSetupRoom);
      swift_bridgeObjectRetain();
      v5 = (void *)sub_23452BC14();
      swift_bridgeObjectRelease();
      objc_msgSend(v4, sel_initWithName_, v5);

      sub_23452BDC4();
      sub_23452BDE8();
      sub_23452BDF4();
      sub_23452BDD0();
      v3 += 16;
      --v2;
    }
    while (v2);
    v6 = v8;
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    v6 = MEMORY[0x24BEE4AF8];
  }
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v6);
}

uint64_t sub_234517908(void *a1, void *aBlock, void *a3)
{
  _QWORD *v3;
  id v6;
  id v7;
  _QWORD *v8;

  v3[2] = a1;
  v3[3] = a3;
  v3[4] = _Block_copy(aBlock);
  v6 = a1;
  v7 = a3;
  v8 = (_QWORD *)swift_task_alloc();
  v3[5] = v8;
  *v8 = v3;
  v8[1] = sub_234517994;
  v8[14] = a1;
  v8[15] = v7;
  return swift_task_switch();
}

uint64_t sub_234517994()
{
  void *v0;
  uint64_t *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);

  v2 = v0;
  v3 = *v1;
  v5 = *(void **)(*v1 + 16);
  v4 = *(void **)(*v1 + 24);
  v6 = *v1;
  swift_task_dealloc();

  if (v0)
  {
    v7 = sub_23452BADC();

    v8 = 0;
    v9 = (void *)v7;
  }
  else
  {
    sub_234507DD0(0, &qword_25615F570);
    v8 = sub_23452BC5C();
    swift_bridgeObjectRelease();
    v7 = 0;
    v9 = (void *)v8;
  }
  v10 = *(void (***)(_QWORD, _QWORD, _QWORD))(v3 + 32);
  v10[2](v10, v8, v7);

  _Block_release(v10);
  return (*(uint64_t (**)(void))(v6 + 8))();
}

uint64_t sub_234517A7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;

  v4[17] = a3;
  v4[18] = v3;
  v4[15] = a1;
  v4[16] = a2;
  return swift_task_switch();
}

uint64_t sub_234517AE4()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  id v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  unint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  void *v11;
  _QWORD *v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  int *v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  if (qword_25615E8B0 != -1)
    swift_once();
  v1 = *(void **)(v0 + 136);
  v2 = sub_23452BB60();
  __swift_project_value_buffer(v2, (uint64_t)qword_256165870);
  v3 = v1;
  swift_bridgeObjectRetain_n();
  v4 = v3;
  v5 = sub_23452BB48();
  v6 = sub_23452BCC8();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = *(_QWORD *)(v0 + 128);
    v24 = *(_QWORD *)(v0 + 120);
    v25 = *(_QWORD *)(v0 + 136);
    v8 = swift_slowAlloc();
    v9 = (_QWORD *)swift_slowAlloc();
    v26 = swift_slowAlloc();
    v27 = v26;
    *(_DWORD *)v8 = 136315394;
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 96) = sub_23451879C(v24, v7, &v27);
    sub_23452BD4C();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v8 + 12) = 2112;
    if (v25)
    {
      *(_QWORD *)(v0 + 112) = v4;
      v10 = v4;
    }
    else
    {
      *(_QWORD *)(v0 + 104) = 0;
    }
    sub_23452BD4C();
    *v9 = *(_QWORD *)(v0 + 136);

    _os_log_impl(&dword_2344FE000, v5, v6, "Configuring device with name: %s, room: %@", (uint8_t *)v8, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25615ED48);
    swift_arrayDestroy();
    MEMORY[0x23493FE58](v9, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x23493FE58](v26, -1, -1);
    MEMORY[0x23493FE58](v8, -1, -1);

  }
  else
  {
    swift_bridgeObjectRelease_n();

  }
  v11 = *(void **)(*(_QWORD *)(v0 + 144)
                 + OBJC_IVAR____TtC13MatterSupport41MatterAddDeviceExtensionConnectionHandler_extensionRequestHandler);
  *(_QWORD *)(v0 + 40) = type metadata accessor for MatterAddDeviceExtensionRequestHandler();
  *(_QWORD *)(v0 + 16) = v11;
  v12 = v11;
  if (swift_dynamicCast())
  {
    v13 = *(_QWORD *)(v0 + 136);

    if (v13)
    {
      v14 = v4;
      v15 = objc_msgSend(v14, sel_name);
      v16 = sub_23452BC20();
      v18 = v17;

    }
    else
    {
      v16 = 0;
      v18 = 0;
    }
    *(_QWORD *)(v0 + 152) = v18;
    *(_QWORD *)(v0 + 48) = v16;
    *(_QWORD *)(v0 + 56) = v18;
    v21 = *(int **)((*MEMORY[0x24BEE4EA0] & *v12) + 0x78);
    v22 = *v21;
    v23 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 160) = v23;
    *v23 = v0;
    v23[1] = sub_234517F78;
    return ((uint64_t (*)(_QWORD, _QWORD, uint64_t))((char *)v21 + v22))(*(_QWORD *)(v0 + 120), *(_QWORD *)(v0 + 128), v0 + 48);
  }
  else
  {
    v27 = 0;
    v28 = 0xE000000000000000;
    sub_23452BD7C();
    v19 = v28;
    *(_QWORD *)(v0 + 64) = v27;
    *(_QWORD *)(v0 + 72) = v19;
    sub_23452BC44();
    *(_QWORD *)(v0 + 80) = v12;
    sub_23452BE00();
    return sub_23452BE18();
  }
}

uint64_t sub_234517F78()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_234518130(int a1, void *a2, void *aBlock, void *a4)
{
  _QWORD *v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD *v12;

  v4[2] = a2;
  v4[3] = a4;
  v4[4] = _Block_copy(aBlock);
  v7 = sub_23452BC20();
  v9 = v8;
  v4[5] = v8;
  v10 = a2;
  v11 = a4;
  v12 = (_QWORD *)swift_task_alloc();
  v4[6] = v12;
  *v12 = v4;
  v12[1] = sub_2345181E0;
  v12[17] = a2;
  v12[18] = v11;
  v12[15] = v7;
  v12[16] = v9;
  return swift_task_switch();
}

uint64_t sub_2345181E0()
{
  void *v0;
  uint64_t *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = *(void **)(*v1 + 16);
  v2 = *(void **)(*v1 + 24);
  v4 = *v1;
  swift_task_dealloc();

  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(v4 + 32);
  if (v0)
  {
    v6 = (void *)sub_23452BADC();

    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(v5 + 16))(*(_QWORD *)(v4 + 32), 0);
  }
  _Block_release(*(const void **)(v4 + 32));
  return (*(uint64_t (**)(void))(v4 + 8))();
}

id sub_2345182C0()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for MatterAddDeviceExtensionConnectionHandler()
{
  return objc_opt_self();
}

uint64_t sub_234518324()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 32));
  return swift_deallocObject();
}

uint64_t sub_234518360()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD *v6;

  v2 = v0[2];
  v3 = (void *)v0[3];
  v5 = (void *)v0[4];
  v4 = (void *)v0[5];
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v6;
  *v6 = v1;
  v6[1] = sub_2345082FC;
  return ((uint64_t (*)(int, void *, void *, void *))((char *)&dword_25615F4F0 + dword_25615F4F0))(v2, v3, v5, v4);
}

uint64_t sub_2345183D8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v4;
  *v4 = v3;
  v4[1] = sub_2345082FC;
  return v6();
}

uint64_t sub_234518430()
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
  v5[1] = sub_2345082FC;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_25615F500 + dword_25615F500))(v2, v3, v4);
}

uint64_t sub_2345184A8(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(void);

  v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v5;
  *v5 = v4;
  v5[1] = sub_2345082FC;
  return v7();
}

uint64_t sub_234518500(uint64_t a1)
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
  v7[1] = sub_2345082FC;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_25615F510 + dword_25615F510))(a1, v4, v5, v6);
}

uint64_t sub_234518584(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_23452BCB0();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_23452BCA4();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_2345186C8(a1);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_23452BC80();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_2345186C8(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25615ED18);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_234518708()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23451872C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_2345082FC;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_25615F520 + dword_25615F520))(a1, v4);
}

uint64_t sub_23451879C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_23451886C(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_234518DF4((uint64_t)v12, *a3);
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
      sub_234518DF4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_23451886C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_23452BD58();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_234518A24(a5, a6);
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
  v8 = sub_23452BDB8();
  if (!v8)
  {
    sub_23452BE0C();
    __break(1u);
LABEL_17:
    result = sub_23452BE30();
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

uint64_t sub_234518A24(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_234518AB8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_234518C90(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_234518C90(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_234518AB8(uint64_t a1, unint64_t a2)
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
      v3 = sub_234518C2C(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_23452BD88();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_23452BE0C();
      __break(1u);
LABEL_10:
      v2 = sub_23452BC50();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_23452BE30();
    __break(1u);
LABEL_14:
    result = sub_23452BE0C();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_234518C2C(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25615F540);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_234518C90(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25615F540);
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
  result = sub_23452BE30();
  __break(1u);
  return result;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_234518DF4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_234518E38()
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
  v5[1] = sub_2345082FC;
  return ((uint64_t (*)(void *, void *, void *))((char *)&dword_25615F548 + dword_25615F548))(v2, v3, v4);
}

uint64_t sub_234518EAC()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 40));
  return swift_deallocObject();
}

uint64_t sub_234518EF0()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  const void *v5;
  void *v6;
  _QWORD *v7;

  v2 = (void *)v0[2];
  v3 = v0[3];
  v4 = v0[4];
  v5 = (const void *)v0[5];
  v6 = (void *)v0[6];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v7;
  *v7 = v1;
  v7[1] = sub_2345082FC;
  return ((uint64_t (*)(void *, uint64_t, uint64_t, const void *, void *))((char *)&dword_25615F578
                                                                                 + dword_25615F578))(v2, v3, v4, v5, v6);
}

unint64_t sub_234518F78()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25615F5A0;
  if (!qword_25615F5A0)
  {
    v1 = sub_23452BB30();
    result = MEMORY[0x23493FDE0](MEMORY[0x24BDCEAB8], v1);
    atomic_store(result, (unint64_t *)&qword_25615F5A0);
  }
  return result;
}

uint64_t sub_234518FC4()
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
  v5[1] = sub_2345082FC;
  return ((uint64_t (*)(void *, void *, void *))((char *)&dword_25615F5A8 + dword_25615F5A8))(v2, v3, v4);
}

uint64_t sub_23451903C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD *v5;

  v2 = v0[2];
  v3 = (void *)v0[3];
  v4 = (void *)v0[4];
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_2345082FC;
  return ((uint64_t (*)(int, void *, void *))((char *)&dword_25615F5D0 + dword_25615F5D0))(v2, v3, v4);
}

uint64_t sub_2345190B0(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_234519120(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_2345190CC(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_234519300(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_2345190E8(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_234519468(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_234519104(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_2345195E0(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_234519120(char a1, int64_t a2, char a3, _QWORD *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  size_t v14;
  uint64_t v16;
  unint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  char *v21;
  unint64_t v22;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
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
  if (!v9)
  {
    v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_25615F640);
  v10 = *(_QWORD *)(type metadata accessor for MatterAddDeviceRequest.DeviceCriteria(0) - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  v14 = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v14 - v12 == 0x8000000000000000 && v11 == -1)
    goto LABEL_34;
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  v16 = *(_QWORD *)(type metadata accessor for MatterAddDeviceRequest.DeviceCriteria(0) - 8);
  v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  v18 = (char *)v13 + v17;
  v19 = (char *)a4 + v17;
  if ((a1 & 1) != 0)
  {
    if (v13 < a4 || v18 >= &v19[*(_QWORD *)(v16 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  v20 = *(_QWORD *)(v16 + 72) * v8;
  v21 = &v18[v20];
  v22 = (unint64_t)&v19[v20];
  if (v19 >= v21 || (unint64_t)v18 >= v22)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_36:
  result = sub_23452BE30();
  __break(1u);
  return result;
}

uint64_t sub_234519300(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25615F648);
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
  result = sub_23452BE30();
  __break(1u);
  return result;
}

uint64_t sub_234519468(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;
  size_t v14;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25615F638);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  v14 = 24 * v8;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v14])
      memmove(v12, v13, v14);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v14] || v12 >= &v13[v14])
  {
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_23452BE30();
  __break(1u);
  return result;
}

uint64_t sub_2345195E0(char a1, int64_t a2, char a3, char *a4)
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
  size_t v15;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25615F600);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 + 31;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 6);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  v15 = v8 << 6;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[v15])
      memmove(v13, v14, v15);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[v15] || v13 >= &v14[v15])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_23452BE30();
  __break(1u);
  return result;
}

uint64_t objectdestroy_27Tm()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 24));
  return swift_deallocObject();
}

uint64_t sub_23451977C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD *v5;

  v2 = v0[2];
  v3 = (void *)v0[3];
  v4 = (void *)v0[4];
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_2345082FC;
  return ((uint64_t (*)(int, void *, void *))((char *)&dword_25615F608 + dword_25615F608))(v2, v3, v4);
}

uint64_t objectdestroy_10Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_234519820()
{
  uint64_t v0;

  v0 = sub_23452BB60();
  __swift_allocate_value_buffer(v0, qword_256165870);
  __swift_project_value_buffer(v0, (uint64_t)qword_256165870);
  sub_23452BC20();
  return sub_23452BB54();
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

uint64_t MatterAddDeviceExtensionRequestHandler.DeviceCredential.certificationDeclaration.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)v0;
  sub_23450081C(*(_QWORD *)v0, *(_QWORD *)(v0 + 8));
  return v1;
}

uint64_t MatterAddDeviceExtensionRequestHandler.DeviceCredential.certificationDeclaration.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = sub_2345011D4(*(_QWORD *)v2, *(_QWORD *)(v2 + 8));
  *(_QWORD *)v2 = a1;
  *(_QWORD *)(v2 + 8) = a2;
  return result;
}

uint64_t (*MatterAddDeviceExtensionRequestHandler.DeviceCredential.certificationDeclaration.modify())()
{
  return nullsub_1;
}

uint64_t MatterAddDeviceExtensionRequestHandler.DeviceCredential.deviceAttestationCertificate.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  sub_23450081C(v1, *(_QWORD *)(v0 + 24));
  return v1;
}

uint64_t MatterAddDeviceExtensionRequestHandler.DeviceCredential.deviceAttestationCertificate.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = sub_2345011D4(*(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24));
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return result;
}

uint64_t (*MatterAddDeviceExtensionRequestHandler.DeviceCredential.deviceAttestationCertificate.modify())()
{
  return nullsub_1;
}

uint64_t MatterAddDeviceExtensionRequestHandler.DeviceCredential.productAttestationIntermediateCertificate.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 32);
  sub_23450081C(v1, *(_QWORD *)(v0 + 40));
  return v1;
}

uint64_t MatterAddDeviceExtensionRequestHandler.DeviceCredential.productAttestationIntermediateCertificate.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = sub_2345011D4(*(_QWORD *)(v2 + 32), *(_QWORD *)(v2 + 40));
  *(_QWORD *)(v2 + 32) = a1;
  *(_QWORD *)(v2 + 40) = a2;
  return result;
}

uint64_t (*MatterAddDeviceExtensionRequestHandler.DeviceCredential.productAttestationIntermediateCertificate.modify())()
{
  return nullsub_1;
}

uint64_t MatterAddDeviceExtensionRequestHandler.DeviceCredential.init(certificationDeclaration:deviceAttestationCertificate:productAttestationIntermediateCertificate:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, _QWORD *a7@<X8>)
{
  *a7 = result;
  a7[1] = a2;
  a7[2] = a3;
  a7[3] = a4;
  a7[4] = a5;
  a7[5] = a6;
  return result;
}

uint64_t MatterAddDeviceExtensionRequestHandler.DeviceCredential.hash(into:)()
{
  uint64_t *v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;

  v1 = *v0;
  v2 = v0[1];
  v3 = v0[2];
  v4 = v0[3];
  v6 = v0[4];
  v5 = v0[5];
  sub_23450081C(v1, v2);
  sub_23452BB0C();
  sub_2345011D4(v1, v2);
  sub_23450081C(v3, v4);
  sub_23452BB0C();
  sub_2345011D4(v3, v4);
  sub_23450081C(v6, v5);
  sub_23452BB0C();
  return sub_2345011D4(v6, v5);
}

unint64_t sub_234519AF8(char a1)
{
  unint64_t result;

  result = 0xD000000000000018;
  if (a1)
  {
    if (a1 == 1)
      return 0xD00000000000001CLL;
    else
      return 0xD000000000000029;
  }
  return result;
}

unint64_t sub_234519B58()
{
  char *v0;

  return sub_234519AF8(*v0);
}

uint64_t sub_234519B60@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_23451AA2C(a1, a2);
  *a3 = result;
  return result;
}

void sub_234519B84(_BYTE *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_234519B90()
{
  sub_23451A524();
  return sub_23452C01C();
}

uint64_t sub_234519BB8()
{
  sub_23451A524();
  return sub_23452C028();
}

uint64_t MatterAddDeviceExtensionRequestHandler.DeviceCredential.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v3;
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25615F6B0);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *v1;
  v7 = v1[1];
  v9 = v1[2];
  v18 = v1[3];
  v19 = v9;
  v10 = v1[4];
  v16 = v1[5];
  v17 = v10;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23451A524();
  sub_23452C010();
  v21 = v8;
  v22 = v7;
  v23 = 0;
  sub_234502CC0();
  v11 = v20;
  sub_23452BF08();
  if (!v11)
  {
    v13 = v16;
    v12 = v17;
    v21 = v19;
    v22 = v18;
    v23 = 1;
    sub_23452BF08();
    v21 = v12;
    v22 = v13;
    v23 = 2;
    sub_23452BF08();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t MatterAddDeviceExtensionRequestHandler.DeviceCredential.hashValue.getter()
{
  uint64_t *v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;

  v1 = *v0;
  v2 = v0[1];
  v3 = v0[2];
  v4 = v0[3];
  v6 = v0[4];
  v5 = v0[5];
  sub_23452BF8C();
  sub_23450081C(v1, v2);
  sub_23452BB0C();
  sub_2345011D4(v1, v2);
  sub_23450081C(v3, v4);
  sub_23452BB0C();
  sub_2345011D4(v3, v4);
  sub_23450081C(v6, v5);
  sub_23452BB0C();
  sub_2345011D4(v6, v5);
  return sub_23452BFC8();
}

uint64_t MatterAddDeviceExtensionRequestHandler.DeviceCredential.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t *v15;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  unint64_t v22;
  char v23;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25615F6C0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_23451A524();
  sub_23452C004();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  v23 = 0;
  sub_234502D48();
  sub_23452BE90();
  v20 = a2;
  v10 = v21;
  v9 = v22;
  v23 = 1;
  sub_23450081C(v21, v22);
  sub_23452BE90();
  v23 = 2;
  v18 = v22;
  v19 = v21;
  sub_23450081C(v21, v22);
  v17 = 0;
  sub_23452BE90();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v11 = v21;
  v12 = v22;
  sub_23450081C(v10, v9);
  v14 = v18;
  v13 = v19;
  sub_23450081C(v19, v18);
  sub_23450081C(v11, v12);
  sub_2345011D4(v13, v14);
  sub_2345011D4(v10, v9);
  v15 = v20;
  *v20 = v10;
  v15[1] = v9;
  v15[2] = v13;
  v15[3] = v14;
  v15[4] = v11;
  v15[5] = v12;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  sub_2345011D4(v10, v9);
  sub_2345011D4(v13, v14);
  return sub_2345011D4(v11, v12);
}

uint64_t sub_23451A0F8()
{
  uint64_t *v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;

  v1 = *v0;
  v2 = v0[1];
  v3 = v0[2];
  v4 = v0[3];
  v6 = v0[4];
  v5 = v0[5];
  sub_23452BF8C();
  sub_23450081C(v1, v2);
  sub_23452BB0C();
  sub_2345011D4(v1, v2);
  sub_23450081C(v3, v4);
  sub_23452BB0C();
  sub_2345011D4(v3, v4);
  sub_23450081C(v6, v5);
  sub_23452BB0C();
  sub_2345011D4(v6, v5);
  return sub_23452BFC8();
}

uint64_t sub_23451A1C0()
{
  uint64_t *v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;

  v1 = *v0;
  v2 = v0[1];
  v3 = v0[2];
  v4 = v0[3];
  v6 = v0[4];
  v5 = v0[5];
  sub_23450081C(v1, v2);
  sub_23452BB0C();
  sub_2345011D4(v1, v2);
  sub_23450081C(v3, v4);
  sub_23452BB0C();
  sub_2345011D4(v3, v4);
  sub_23450081C(v6, v5);
  sub_23452BB0C();
  return sub_2345011D4(v6, v5);
}

uint64_t sub_23451A274()
{
  uint64_t *v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;

  v1 = *v0;
  v2 = v0[1];
  v3 = v0[2];
  v4 = v0[3];
  v6 = v0[4];
  v5 = v0[5];
  sub_23452BF8C();
  sub_23450081C(v1, v2);
  sub_23452BB0C();
  sub_2345011D4(v1, v2);
  sub_23450081C(v3, v4);
  sub_23452BB0C();
  sub_2345011D4(v3, v4);
  sub_23450081C(v6, v5);
  sub_23452BB0C();
  sub_2345011D4(v6, v5);
  return sub_23452BFC8();
}

uint64_t sub_23451A338@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return MatterAddDeviceExtensionRequestHandler.DeviceCredential.init(from:)(a1, a2);
}

uint64_t sub_23451A34C(_QWORD *a1)
{
  return MatterAddDeviceExtensionRequestHandler.DeviceCredential.encode(to:)(a1);
}

void _s13MatterSupport0A32AddDeviceExtensionRequestHandlerC0D10CredentialV2eeoiySbAE_AEtFZ_0(uint64_t a1)
{
  __asm { BR              X11 }
}

uint64_t sub_23451A3BC()
{
  unint64_t v0;

  return ((uint64_t (*)(void))((char *)&loc_23451A3F0 + dword_23451A514[v0 >> 62]))();
}

void sub_23451A400(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  char v13;

  if (a1 == BYTE6(v3))
  {
    if (a1 < 1 || (v9 = v6, v10 = v1, sub_23450081C(v2, v3), sub_23450E60C(v4, v8), v1 = v10, v6 = v9, (v11 & 1) != 0))
    {
      v12 = v1;
      sub_23450E8E4(v5, v7);
      if ((v13 & 1) != 0)
        sub_23450E8E4(v12, v6);
    }
  }
}

unint64_t sub_23451A524()
{
  unint64_t result;

  result = qword_25615F6B8;
  if (!qword_25615F6B8)
  {
    result = MEMORY[0x23493FDE0](&unk_2345308D4, &_s14descr250599BB1V16DeviceCredentialV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25615F6B8);
  }
  return result;
}

unint64_t sub_23451A56C()
{
  unint64_t result;

  result = qword_25615F6C8;
  if (!qword_25615F6C8)
  {
    result = MEMORY[0x23493FDE0](&protocol conformance descriptor for MatterAddDeviceExtensionRequestHandler.DeviceCredential, &type metadata for MatterAddDeviceExtensionRequestHandler.DeviceCredential);
    atomic_store(result, (unint64_t *)&qword_25615F6C8);
  }
  return result;
}

uint64_t _s14descr250599BB1V16DeviceCredentialVwxx(uint64_t a1)
{
  sub_2345011D4(*(_QWORD *)a1, *(_QWORD *)(a1 + 8));
  sub_2345011D4(*(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24));
  return sub_2345011D4(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t *_s14descr250599BB1V16DeviceCredentialVwcp(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;

  v4 = *a2;
  v5 = a2[1];
  sub_23450081C(*a2, v5);
  *a1 = v4;
  a1[1] = v5;
  v6 = a2[2];
  v7 = a2[3];
  sub_23450081C(v6, v7);
  a1[2] = v6;
  a1[3] = v7;
  v9 = a2[4];
  v8 = a2[5];
  sub_23450081C(v9, v8);
  a1[4] = v9;
  a1[5] = v8;
  return a1;
}

uint64_t *_s14descr250599BB1V16DeviceCredentialVwca(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;

  v4 = *a2;
  v5 = a2[1];
  sub_23450081C(*a2, v5);
  v6 = *a1;
  v7 = a1[1];
  *a1 = v4;
  a1[1] = v5;
  sub_2345011D4(v6, v7);
  v8 = a2[2];
  v9 = a2[3];
  sub_23450081C(v8, v9);
  v10 = a1[2];
  v11 = a1[3];
  a1[2] = v8;
  a1[3] = v9;
  sub_2345011D4(v10, v11);
  v13 = a2[4];
  v12 = a2[5];
  sub_23450081C(v13, v12);
  v14 = a1[4];
  v15 = a1[5];
  a1[4] = v13;
  a1[5] = v12;
  sub_2345011D4(v14, v15);
  return a1;
}

__n128 __swift_memcpy48_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t *_s14descr250599BB1V16DeviceCredentialVwta(uint64_t *a1, _OWORD *a2)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;

  v4 = *a1;
  v5 = a1[1];
  *(_OWORD *)a1 = *a2;
  sub_2345011D4(v4, v5);
  v6 = a1[2];
  v7 = a1[3];
  *((_OWORD *)a1 + 1) = a2[1];
  sub_2345011D4(v6, v7);
  v8 = a1[4];
  v9 = a1[5];
  *((_OWORD *)a1 + 2) = a2[2];
  sub_2345011D4(v8, v9);
  return a1;
}

uint64_t _s14descr250599BB1V16DeviceCredentialVwet(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  if (!a2)
    return 0;
  if (a2 >= 0xD && *(_BYTE *)(a1 + 48))
    return (*(_DWORD *)a1 + 13);
  v3 = (((*(_QWORD *)(a1 + 8) >> 60) >> 2) & 0xFFFFFFF3 | (4 * ((*(_QWORD *)(a1 + 8) >> 60) & 3))) ^ 0xF;
  if (v3 >= 0xC)
    v3 = -1;
  return v3 + 1;
}

uint64_t _s14descr250599BB1V16DeviceCredentialVwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xC)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 - 13;
    if (a3 >= 0xD)
      *(_BYTE *)(result + 48) = 1;
  }
  else
  {
    if (a3 >= 0xD)
      *(_BYTE *)(result + 48) = 0;
    if (a2)
    {
      *(_QWORD *)result = 0;
      *(_QWORD *)(result + 8) = (unint64_t)(((-a2 >> 2) & 3) - 4 * a2) << 60;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for MatterAddDeviceExtensionRequestHandler.DeviceCredential()
{
  return &type metadata for MatterAddDeviceExtensionRequestHandler.DeviceCredential;
}

uint64_t _s14descr250599BB1V16DeviceCredentialV10CodingKeysOwet(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s14descr250599BB1V16DeviceCredentialV10CodingKeysOwst(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_23451A8D4 + 4 * byte_234530725[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_23451A908 + 4 * asc_234530720[v4]))();
}

uint64_t sub_23451A908(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_23451A910(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x23451A918);
  return result;
}

uint64_t sub_23451A924(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x23451A92CLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_23451A930(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_23451A938(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *_s14descr250599BB1V16DeviceCredentialV10CodingKeysOMa()
{
  return &_s14descr250599BB1V16DeviceCredentialV10CodingKeysON;
}

unint64_t sub_23451A958()
{
  unint64_t result;

  result = qword_25615F6D0;
  if (!qword_25615F6D0)
  {
    result = MEMORY[0x23493FDE0](&unk_2345308AC, &_s14descr250599BB1V16DeviceCredentialV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25615F6D0);
  }
  return result;
}

unint64_t sub_23451A9A0()
{
  unint64_t result;

  result = qword_25615F6D8;
  if (!qword_25615F6D8)
  {
    result = MEMORY[0x23493FDE0](&unk_23453081C, &_s14descr250599BB1V16DeviceCredentialV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25615F6D8);
  }
  return result;
}

unint64_t sub_23451A9E8()
{
  unint64_t result;

  result = qword_25615F6E0;
  if (!qword_25615F6E0)
  {
    result = MEMORY[0x23493FDE0](&unk_234530844, &_s14descr250599BB1V16DeviceCredentialV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25615F6E0);
  }
  return result;
}

uint64_t sub_23451AA2C(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0xD000000000000018 && a2 == 0x80000002345315E0 || (sub_23452BF5C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD00000000000001CLL && a2 == 0x8000000234531600 || (sub_23452BF5C() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000029 && a2 == 0x8000000234531620)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v5 = sub_23452BF5C();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

void sub_23451D04C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2345263EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  id *v25;

  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_234528A20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_234529BF4(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_234529DFC(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_234529E58(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_23452A018(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;
  id *v2;
  id *v3;
  uint64_t v4;

  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak((id *)(v4 - 72));
  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_23452B508(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_23452BA70()
{
  return MEMORY[0x24BDCBBC8]();
}

uint64_t sub_23452BA7C()
{
  return MEMORY[0x24BDCBBD8]();
}

uint64_t sub_23452BA88()
{
  return MEMORY[0x24BDCBBF0]();
}

uint64_t sub_23452BA94()
{
  return MEMORY[0x24BDCCA20]();
}

uint64_t sub_23452BAA0()
{
  return MEMORY[0x24BDCCA40]();
}

uint64_t sub_23452BAAC()
{
  return MEMORY[0x24BDCCA48]();
}

uint64_t sub_23452BAB8()
{
  return MEMORY[0x24BDCCA60]();
}

uint64_t sub_23452BAC4()
{
  return MEMORY[0x24BDCCA88]();
}

uint64_t sub_23452BAD0()
{
  return MEMORY[0x24BDCCA90]();
}

uint64_t sub_23452BADC()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_23452BAE8()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_23452BAF4()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_23452BB00()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_23452BB0C()
{
  return MEMORY[0x24BDCDCF8]();
}

uint64_t sub_23452BB18()
{
  return MEMORY[0x24BDCE9E0]();
}

uint64_t sub_23452BB24()
{
  return MEMORY[0x24BDCE9F8]();
}

uint64_t sub_23452BB30()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_23452BB3C()
{
  return MEMORY[0x24BEE76F0]();
}

uint64_t sub_23452BB48()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_23452BB54()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_23452BB60()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_23452BB6C()
{
  return MEMORY[0x24BDE03D8]();
}

uint64_t sub_23452BB78()
{
  return MEMORY[0x24BDE03F0]();
}

uint64_t sub_23452BB84()
{
  return MEMORY[0x24BDE0688]();
}

uint64_t sub_23452BB90()
{
  return MEMORY[0x24BDE06B0]();
}

uint64_t sub_23452BB9C()
{
  return MEMORY[0x24BDE06D0]();
}

uint64_t sub_23452BBA8()
{
  return MEMORY[0x24BDE06E0]();
}

uint64_t sub_23452BBB4()
{
  return MEMORY[0x24BDE0718]();
}

uint64_t sub_23452BBC0()
{
  return MEMORY[0x24BDE0728]();
}

uint64_t sub_23452BBCC()
{
  return MEMORY[0x24BDE0798]();
}

uint64_t sub_23452BBD8()
{
  return MEMORY[0x24BDE07A0]();
}

uint64_t sub_23452BBE4()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_23452BBF0()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_23452BBFC()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_23452BC08()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_23452BC14()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_23452BC20()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_23452BC2C()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_23452BC38()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_23452BC44()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_23452BC50()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_23452BC5C()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_23452BC68()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_23452BC74()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_23452BC80()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_23452BC8C()
{
  return MEMORY[0x24BEE6820]();
}

uint64_t sub_23452BC98()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t sub_23452BCA4()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_23452BCB0()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_23452BCBC()
{
  return MEMORY[0x24BDCFD38]();
}

uint64_t sub_23452BCC8()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_23452BCD4()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_23452BCE0()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_23452BCEC()
{
  return MEMORY[0x24BDCFFB0]();
}

uint64_t sub_23452BCF8()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_23452BD04()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_23452BD10()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_23452BD1C()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_23452BD28()
{
  return MEMORY[0x24BEE5BC8]();
}

uint64_t sub_23452BD34()
{
  return MEMORY[0x24BEE79A0]();
}

uint64_t sub_23452BD40()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_23452BD4C()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_23452BD58()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_23452BD64()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_23452BD70()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_23452BD7C()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_23452BD88()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_23452BD94()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_23452BDA0()
{
  return MEMORY[0x24BEE26E8]();
}

uint64_t sub_23452BDAC()
{
  return MEMORY[0x24BEE2710]();
}

uint64_t sub_23452BDB8()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_23452BDC4()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_23452BDD0()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_23452BDDC()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_23452BDE8()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_23452BDF4()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_23452BE00()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_23452BE0C()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_23452BE18()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_23452BE24()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_23452BE30()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_23452BE3C()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_23452BE48()
{
  return MEMORY[0x24BEE32B8]();
}

uint64_t sub_23452BE54()
{
  return MEMORY[0x24BEE32C0]();
}

uint64_t sub_23452BE60()
{
  return MEMORY[0x24BEE3308]();
}

uint64_t sub_23452BE6C()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_23452BE78()
{
  return MEMORY[0x24BEE3358]();
}

uint64_t sub_23452BE84()
{
  return MEMORY[0x24BEE3370]();
}

uint64_t sub_23452BE90()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_23452BE9C()
{
  return MEMORY[0x24BEE3388]();
}

uint64_t sub_23452BEA8()
{
  return MEMORY[0x24BEE33A8]();
}

uint64_t sub_23452BEB4()
{
  return MEMORY[0x24BEE33B0]();
}

uint64_t sub_23452BEC0()
{
  return MEMORY[0x24BEE33C0]();
}

uint64_t sub_23452BECC()
{
  return MEMORY[0x24BEE33C8]();
}

uint64_t sub_23452BED8()
{
  return MEMORY[0x24BEE3408]();
}

uint64_t sub_23452BEE4()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_23452BEF0()
{
  return MEMORY[0x24BEE34A8]();
}

uint64_t sub_23452BEFC()
{
  return MEMORY[0x24BEE34C0]();
}

uint64_t sub_23452BF08()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_23452BF14()
{
  return MEMORY[0x24BEE34D8]();
}

uint64_t sub_23452BF20()
{
  return MEMORY[0x24BEE34F8]();
}

uint64_t sub_23452BF2C()
{
  return MEMORY[0x24BEE3500]();
}

uint64_t sub_23452BF38()
{
  return MEMORY[0x24BEE3510]();
}

uint64_t sub_23452BF44()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_23452BF50()
{
  return MEMORY[0x24BEE3930]();
}

uint64_t sub_23452BF5C()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_23452BF68()
{
  return MEMORY[0x24BEE70E0]();
}

uint64_t sub_23452BF74()
{
  return MEMORY[0x24BDD06C8]();
}

uint64_t sub_23452BF80()
{
  return MEMORY[0x24BDD0798]();
}

uint64_t sub_23452BF8C()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_23452BF98()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_23452BFA4()
{
  return MEMORY[0x24BEE4300]();
}

uint64_t sub_23452BFB0()
{
  return MEMORY[0x24BEE4308]();
}

uint64_t sub_23452BFBC()
{
  return MEMORY[0x24BEE4318]();
}

uint64_t sub_23452BFC8()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_23452BFD4()
{
  return MEMORY[0x24BDD07B0]();
}

uint64_t sub_23452BFE0()
{
  return MEMORY[0x24BDD0808]();
}

uint64_t sub_23452BFEC()
{
  return MEMORY[0x24BDD0810]();
}

uint64_t sub_23452BFF8()
{
  return MEMORY[0x24BDD0820]();
}

uint64_t sub_23452C004()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_23452C010()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_23452C01C()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_23452C028()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t sub_23452C034()
{
  return MEMORY[0x24BEE4A98]();
}

uint64_t CFPrefs_GetInt64()
{
  return MEMORY[0x24BE29098]();
}

uint64_t DebugGetErrorString()
{
  return MEMORY[0x24BE29350]();
}

uint64_t HMFCreateOSLogHandle()
{
  return MEMORY[0x24BE3EA08]();
}

uint64_t HMFEqualObjects()
{
  return MEMORY[0x24BE3EBA8]();
}

uint64_t HMFGetLogIdentifier()
{
  return MEMORY[0x24BE3EBB8]();
}

uint64_t HMFGetOSLogHandle()
{
  return MEMORY[0x24BE3EBC0]();
}

uint64_t HMFObjectDescription()
{
  return MEMORY[0x24BE3EC10]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

uint64_t OPACKDecodeData()
{
  return MEMORY[0x24BE29870]();
}

uint64_t OPACKEncoderCreateData()
{
  return MEMORY[0x24BE29880]();
}

CFStringRef SecCopyErrorMessageString(OSStatus status, void *reserved)
{
  return (CFStringRef)MEMORY[0x24BDE89F0](*(_QWORD *)&status, reserved);
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return MEMORY[0x24BDE8A70](attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x24BDE8A78](query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return MEMORY[0x24BDE8A80](query);
}

OSStatus SecItemUpdate(CFDictionaryRef query, CFDictionaryRef attributesToUpdate)
{
  return MEMORY[0x24BDE8A88](query, attributesToUpdate);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

uint64_t _HMFPreconditionFailure()
{
  return MEMORY[0x24BE3F2D0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
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

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3E0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t os_unfair_lock_lock_with_options()
{
  return MEMORY[0x24BDAF470]();
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
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

uint64_t swift_continuation_await()
{
  return MEMORY[0x24BEE71B8]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x24BEE71C0]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x24BEE71D0]();
}

uint64_t swift_continuation_throwingResumeWithError()
{
  return MEMORY[0x24BEE71D8]();
}

uint64_t swift_deallocBox()
{
  return MEMORY[0x24BEE4BF8]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_deallocUninitializedObject()
{
  return MEMORY[0x24BEE4C20]();
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

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x24BEE4E30]();
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

uint64_t swift_projectBox()
{
  return MEMORY[0x24BEE4ED0]();
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

