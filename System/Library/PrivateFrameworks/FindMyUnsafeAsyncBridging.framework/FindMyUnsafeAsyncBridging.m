uint64_t sub_23BBE1530(uint64_t a1)
{
  uint64_t *v1;

  return sub_23BBE1AF4(a1, v1[3], v1[4], v1[2]);
}

uint64_t unsafeBlocking<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;

  v4[4] = a3;
  v4[5] = a4;
  v4[2] = a1;
  v4[3] = a2;
  return swift_task_switch();
}

{
  _QWORD *v4;

  v4[4] = a3;
  v4[5] = a4;
  v4[2] = a1;
  v4[3] = a2;
  return swift_task_switch();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t UnsafeSendableBox.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + *(_QWORD *)(*(_QWORD *)v0 + 88);
  v2 = sub_23BBE3770();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t sub_23BBE15C0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  __int128 v3;
  _QWORD *v4;

  v1 = *(_QWORD *)(v0 + 40);
  v2 = swift_task_alloc();
  *(_QWORD *)(v0 + 48) = v2;
  v3 = *(_OWORD *)(v0 + 24);
  *(_QWORD *)(v2 + 16) = v1;
  *(_OWORD *)(v2 + 24) = v3;
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v4;
  *v4 = v0;
  v4[1] = sub_23BBE1660;
  return sub_23BBE3788();
}

uint64_t sub_23BBE1660()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_23BBE16B0(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_23BBE16DC()
{
  sub_23BBE3710();
  return sub_23BBE1744();
}

uint64_t sub_23BBE1744()
{
  uint64_t v0;
  void (*v1)(uint64_t);

  v0 = MEMORY[0x24BDAC7A8]();
  v1(v0);
  sub_23BBE3710();
  return sub_23BBE3704();
}

uint64_t unsafeFromAsyncTask<A>(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  _QWORD *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t result;
  uint64_t v23;

  v23 = a4;
  v7 = sub_23BBE3770();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8]();
  v10 = (char *)&v23 - v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25430AAE0);
  MEMORY[0x24BDAC7A8]();
  v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23BBE36BC();
  type metadata accessor for UnsafeSendableBox(0, a3, v13, v14);
  v15 = swift_allocObject();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v15 + 80) - 8) + 56))(v15 + *(_QWORD *)(*(_QWORD *)v15 + 88), 1, 1);
  v16 = dispatch_group_create();
  dispatch_group_enter(v16);
  v17 = sub_23BBE3728();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v12, 1, 1, v17);
  v18 = (_QWORD *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = v15;
  v18[5] = a1;
  v18[6] = a2;
  v18[7] = v16;
  swift_retain();
  swift_retain();
  v19 = v16;
  sub_23BBE2F08((uint64_t)v12, (uint64_t)&unk_256A73EC0, (uint64_t)v18);
  swift_release();
  sub_23BBE3734();
  v20 = v15 + *(_QWORD *)(*(_QWORD *)v15 + 88);
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v20, v7);
  v21 = *(_QWORD *)(a3 - 8);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v21 + 48))(v10, 1, a3);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }
  else
  {
    swift_release();

    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v21 + 32))(v23, v10, a3);
  }
  return result;
}

uint64_t sub_23BBE19EC(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25430AAE0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for UnsafeSendableBox(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for UnsafeSendableBox);
}

uint64_t UnsafeSendableBox.__allocating_init()()
{
  uint64_t v0;

  v0 = swift_allocObject();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v0 + 80) - 8) + 56))(v0 + *(_QWORD *)(*(_QWORD *)v0 + 88), 1, 1);
  return v0;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24260DCB4]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x24260DC90](a1, v6, a5);
}

uint64_t sub_23BBE1AF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
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
  char *v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  void *v22;
  _QWORD v24[2];
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD aBlock[6];

  v25 = a2;
  v26 = a3;
  v6 = sub_23BBE36C8();
  v29 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_23BBE36E0();
  v27 = *(_QWORD *)(v9 - 8);
  v28 = v9;
  MEMORY[0x24BDAC7A8]();
  v11 = (char *)v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_23BBE3710();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = *(_QWORD *)(v13 + 64);
  MEMORY[0x24BDAC7A8]();
  v16 = (char *)v24 - v15;
  if (qword_25430ABA8 != -1)
    swift_once();
  v24[1] = qword_25430ABB0;
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v16, a1, v12);
  v17 = (*(unsigned __int8 *)(v13 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  v18 = (v14 + v17 + 7) & 0xFFFFFFFFFFFFFFF8;
  v19 = swift_allocObject();
  *(_QWORD *)(v19 + 16) = a4;
  (*(void (**)(unint64_t, char *, uint64_t))(v13 + 32))(v19 + v17, v16, v12);
  v20 = (_QWORD *)(v19 + v18);
  v21 = v26;
  *v20 = v25;
  v20[1] = v21;
  aBlock[4] = sub_23BBE16DC;
  aBlock[5] = v19;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_23BBE16B0;
  aBlock[3] = &block_descriptor;
  v22 = _Block_copy(aBlock);
  swift_retain();
  sub_23BBE36D4();
  v30 = MEMORY[0x24BEE4AF8];
  sub_23BBE1DEC(&qword_25430AAF0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25430AAF8);
  sub_23BBE1DAC(&qword_25430AB00, &qword_25430AAF8);
  sub_23BBE377C();
  MEMORY[0x24260DB4C](0, v11, v8, v22);
  _Block_release(v22);
  (*(void (**)(char *, uint64_t))(v29 + 8))(v8, v6);
  (*(void (**)(char *, uint64_t))(v27 + 8))(v11, v28);
  return swift_release();
}

uint64_t sub_23BBE1DAC(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x24260DCCC](MEMORY[0x24BEE12C8], v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23BBE1DEC(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x24260DCCC](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23BBE1E2C()
{
  uint64_t (*v0)(uint64_t);
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t result;
  _QWORD v6[2];

  sub_23BBE3740();
  v0 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688];
  MEMORY[0x24BDAC7A8]();
  sub_23BBE36E0();
  MEMORY[0x24BDAC7A8]();
  v1 = sub_23BBE374C();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8]();
  v4 = (char *)v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23BBE353C();
  (*(void (**)(char *, _QWORD, uint64_t))(v2 + 104))(v4, *MEMORY[0x24BEE5758], v1);
  sub_23BBE36D4();
  v6[1] = MEMORY[0x24BEE4AF8];
  sub_23BBE1DEC(&qword_25430AB18, v0, MEMORY[0x24BEE5698]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25430AB08);
  sub_23BBE1DAC(&qword_25430AB10, &qword_25430AB08);
  sub_23BBE377C();
  result = sub_23BBE3764();
  qword_25430ABB0 = result;
  return result;
}

uint64_t sub_23BBE1FFC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  __int128 v3;
  _QWORD *v4;

  v1 = *(_QWORD *)(v0 + 40);
  v2 = swift_task_alloc();
  *(_QWORD *)(v0 + 48) = v2;
  v3 = *(_OWORD *)(v0 + 24);
  *(_QWORD *)(v2 + 16) = v1;
  *(_OWORD *)(v2 + 24) = v3;
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v4;
  *v4 = v0;
  v4[1] = sub_23BBE209C;
  return sub_23BBE3794();
}

uint64_t sub_23BBE209C()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 64) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_23BBE2110()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23BBE2144(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
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
  char *v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  void *v22;
  _QWORD v24[2];
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD aBlock[6];

  v25 = a2;
  v26 = a3;
  v6 = sub_23BBE36C8();
  v29 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_23BBE36E0();
  v27 = *(_QWORD *)(v9 - 8);
  v28 = v9;
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256A73ED8);
  v12 = sub_23BBE3710();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = *(_QWORD *)(v13 + 64);
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)v24 - v15;
  if (qword_25430ABA8 != -1)
    swift_once();
  v24[1] = qword_25430ABB0;
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v16, a1, v12);
  v17 = (*(unsigned __int8 *)(v13 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  v18 = (v14 + v17 + 7) & 0xFFFFFFFFFFFFFFF8;
  v19 = swift_allocObject();
  *(_QWORD *)(v19 + 16) = a4;
  (*(void (**)(unint64_t, char *, uint64_t))(v13 + 32))(v19 + v17, v16, v12);
  v20 = (_QWORD *)(v19 + v18);
  v21 = v26;
  *v20 = v25;
  v20[1] = v21;
  aBlock[4] = sub_23BBE3610;
  aBlock[5] = v19;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_23BBE16B0;
  aBlock[3] = &block_descriptor_24;
  v22 = _Block_copy(aBlock);
  swift_retain();
  sub_23BBE36D4();
  v30 = MEMORY[0x24BEE4AF8];
  sub_23BBE1DEC(&qword_25430AAF0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25430AAF8);
  sub_23BBE1DAC(&qword_25430AB00, &qword_25430AAF8);
  sub_23BBE377C();
  MEMORY[0x24260DB4C](0, v11, v8, v22);
  _Block_release(v22);
  (*(void (**)(char *, uint64_t))(v29 + 8))(v8, v6);
  (*(void (**)(char *, uint64_t))(v27 + 8))(v11, v28);
  return swift_release();
}

uint64_t sub_23BBE2404(uint64_t a1)
{
  uint64_t *v1;

  return sub_23BBE2144(a1, v1[3], v1[4], v1[2]);
}

uint64_t sub_23BBE2410(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE v13[16];
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256A73ED8);
  v7 = sub_23BBE37A0();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = &v13[-v9];
  v14 = a4;
  v15 = a2;
  v16 = a3;
  sub_23BBE2514((void (*)(_BYTE *))sub_23BBE3680, (uint64_t)&v13[-v9]);
  v11 = sub_23BBE3710();
  sub_23BBE2630((uint64_t)v10, v11);
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t sub_23BBE2514@<X0>(void (*a1)(_BYTE *)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  _BYTE v11[16];

  MEMORY[0x24BDAC7A8]();
  v5 = &v11[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v6 = sub_23BBE37A0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8]();
  v9 = &v11[-v8];
  a1(v5);
  swift_storeEnumTagMultiPayload();
  return (*(uint64_t (**)(uint64_t, _BYTE *, uint64_t))(v7 + 32))(a2, v9, v6);
}

uint64_t sub_23BBE2630(uint64_t a1, uint64_t a2)
{
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
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v18;

  v3 = *(_QWORD *)(a2 + 16);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(_QWORD *)(v8 + 24);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_23BBE37A0();
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v18 - v14;
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))((char *)&v18 - v14, a1, v13);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v12, v15, v9);
    return sub_23BBE36F8();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v7, v15, v3);
    return sub_23BBE3704();
  }
}

uint64_t UnsafeSendableBox.contents.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(_QWORD *)(*(_QWORD *)v1 + 88);
  swift_beginAccess();
  v4 = sub_23BBE3770();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t UnsafeSendableBox.contents.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(_QWORD *)(*(_QWORD *)v1 + 88);
  swift_beginAccess();
  v4 = sub_23BBE3770();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(v3, a1, v4);
  return swift_endAccess();
}

uint64_t (*UnsafeSendableBox.contents.modify())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t UnsafeSendableBox.init()()
{
  uint64_t v0;

  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v0 + 80) - 8) + 56))(v0 + *(_QWORD *)(*(_QWORD *)v0 + 88), 1, 1);
  return v0;
}

uint64_t UnsafeSendableBox.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + *(_QWORD *)(*(_QWORD *)v0 + 88);
  v2 = sub_23BBE3770();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

void unsafeFromAsyncTask<A>(_:)(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  _QWORD *v18;
  NSObject *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;

  v23 = a4;
  v7 = sub_23BBE3770();
  v24 = *(_QWORD *)(v7 - 8);
  v25 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v26 = (char *)&v23 - v8;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25430AAE0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23BBE36BC();
  type metadata accessor for UnsafeSendableBox(0, a3, v12, v13);
  v14 = swift_allocObject();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v14 + 80) - 8) + 56))(v14 + *(_QWORD *)(*(_QWORD *)v14 + 88), 1, 1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25430AAE8);
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = 1;
  v16 = dispatch_group_create();
  dispatch_group_enter(v16);
  v17 = sub_23BBE3728();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v11, 1, 1, v17);
  v18 = (_QWORD *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = v16;
  v18[5] = v14;
  v18[6] = a1;
  v18[7] = a2;
  v18[8] = v15;
  v19 = v16;
  swift_retain();
  swift_retain();
  swift_retain();
  sub_23BBE2F08((uint64_t)v11, (uint64_t)&unk_256A73EB0, (uint64_t)v18);
  swift_release();
  sub_23BBE3734();
  swift_beginAccess();
  if (*(_QWORD *)(v15 + 16) >= 2uLL)
  {
    MEMORY[0x24260DC78](*(_QWORD *)(v15 + 16));
    swift_willThrow();
    swift_release();
    swift_release();

  }
  else
  {
    v20 = v14 + *(_QWORD *)(*(_QWORD *)v14 + 88);
    swift_beginAccess();
    v21 = v26;
    (*(void (**)(char *, uint64_t, uint64_t))(v24 + 16))(v26, v20, v25);
    v22 = *(_QWORD *)(a3 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v21, 1, a3) == 1)
    {
      __break(1u);
    }
    else
    {
      swift_release();
      swift_release();

      (*(void (**)(uint64_t, char *, uint64_t))(v22 + 32))(v23, v21, a3);
    }
  }
}

uint64_t sub_23BBE2BE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int *a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t (*v14)(uint64_t);

  v8[9] = a5;
  v8[10] = a8;
  v8[8] = a4;
  v8[11] = *(_QWORD *)(*(_QWORD *)a5 + 80);
  v10 = sub_23BBE3770();
  v8[12] = v10;
  v8[13] = *(_QWORD *)(v10 - 8);
  v11 = swift_task_alloc();
  v8[14] = v11;
  v14 = (uint64_t (*)(uint64_t))((char *)a6 + *a6);
  v12 = (_QWORD *)swift_task_alloc();
  v8[15] = v12;
  *v12 = v8;
  v12[1] = sub_23BBE2C90;
  return v14(v11);
}

uint64_t sub_23BBE2C90()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 128) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23BBE2CF4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *(_QWORD *)(v0 + 104);
  v1 = *(_QWORD *)(v0 + 112);
  v3 = *(_QWORD *)(v0 + 96);
  v4 = *(_QWORD *)(v0 + 72);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(*(_QWORD *)(v0 + 88) - 8) + 56))(v1, 0, 1);
  v5 = v4 + *(_QWORD *)(*(_QWORD *)v4 + 88);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 40))(v5, v1, v3);
  swift_endAccess();
  dispatch_group_leave(*(dispatch_group_t *)(v0 + 64));
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23BBE2DA4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 128);
  v2 = *(_QWORD *)(v0 + 80);
  swift_beginAccess();
  v3 = *(_QWORD *)(v2 + 16);
  *(_QWORD *)(v2 + 16) = v1;
  sub_23BBE345C(v3);
  dispatch_group_leave(*(dispatch_group_t *)(v0 + 64));
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23BBE2E08()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23BBE2E4C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;

  v2 = v0[4];
  v3 = v0[5];
  v4 = (int *)v0[6];
  v5 = v0[7];
  v6 = v0[8];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v7;
  *v7 = v1;
  v7[1] = sub_23BBE2EC0;
  return sub_23BBE2BE8((uint64_t)v7, v8, v9, v2, v3, v4, v5, v6);
}

uint64_t sub_23BBE2EC0()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_23BBE2F08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_23BBE3728();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_23BBE371C();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_23BBE19EC(a1);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_23BBE36EC();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_23BBE304C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int *a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t (*v13)(uint64_t);

  v7[5] = a4;
  v7[6] = a7;
  v7[7] = *(_QWORD *)(*(_QWORD *)a4 + 80);
  v9 = sub_23BBE3770();
  v7[8] = v9;
  v7[9] = *(_QWORD *)(v9 - 8);
  v10 = swift_task_alloc();
  v7[10] = v10;
  v13 = (uint64_t (*)(uint64_t))((char *)a5 + *a5);
  v11 = (_QWORD *)swift_task_alloc();
  v7[11] = v11;
  *v11 = v7;
  v11[1] = sub_23BBE30F0;
  return v13(v10);
}

uint64_t sub_23BBE30F0()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_23BBE3144()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;

  v2 = *(_QWORD *)(v0 + 72);
  v1 = *(_QWORD *)(v0 + 80);
  v3 = *(_QWORD *)(v0 + 64);
  v5 = *(_QWORD *)(v0 + 40);
  v4 = *(NSObject **)(v0 + 48);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(*(_QWORD *)(v0 + 56) - 8) + 56))(v1, 0, 1);
  v6 = v5 + *(_QWORD *)(*(_QWORD *)v5 + 88);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 40))(v6, v1, v3);
  swift_endAccess();
  dispatch_group_leave(v4);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_23BBE31F0()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  swift_release();
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_23BBE322C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  int *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  v2 = v0[4];
  v3 = (int *)v0[5];
  v5 = v0[6];
  v4 = v0[7];
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v6;
  *v6 = v1;
  v6[1] = sub_23BBE36B0;
  return sub_23BBE304C((uint64_t)v6, v7, v8, v2, v3, v5, v4);
}

uint64_t sub_23BBE3294()
{
  uint64_t result;
  unint64_t v1;

  result = sub_23BBE3770();
  if (v1 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for UnsafeSendableBox()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of UnsafeSendableBox.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t sub_23BBE3318(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_23BBE337C;
  return v6(a1);
}

uint64_t sub_23BBE337C()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_23BBE33C8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23BBE33EC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_23BBE2EC0;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_256A73EC8 + dword_256A73EC8))(a1, v4);
}

uint64_t sub_23BBE345C(uint64_t result)
{
  if (result != 1)
    JUMPOUT(0x24260DC6CLL);
  return result;
}

uint64_t sub_23BBE346C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = sub_23BBE3710();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  swift_release();
  return swift_deallocObject();
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24260DCC0](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_23BBE353C()
{
  unint64_t result;

  result = qword_25430AB20;
  if (!qword_25430AB20)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_25430AB20);
  }
  return result;
}

uint64_t sub_23BBE3578()
{
  uint64_t v0;
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256A73ED8);
  v1 = sub_23BBE3710();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23BBE3610()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t *v4;

  v1 = *(_QWORD *)(v0 + 16);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256A73ED8);
  v2 = *(_QWORD *)(sub_23BBE3710() - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (uint64_t *)(v0 + ((*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8));
  return sub_23BBE2410(v0 + v3, *v4, v4[1], v1);
}

uint64_t sub_23BBE3680(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t result;

  result = (*(uint64_t (**)(void))(v1 + 24))();
  if (v2)
    *a1 = v2;
  return result;
}

uint64_t sub_23BBE36BC()
{
  return MEMORY[0x24BE31918]();
}

uint64_t sub_23BBE36C8()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_23BBE36D4()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_23BBE36E0()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_23BBE36EC()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_23BBE36F8()
{
  return MEMORY[0x24BEE6820]();
}

uint64_t sub_23BBE3704()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t sub_23BBE3710()
{
  return MEMORY[0x24BEE6830]();
}

uint64_t sub_23BBE371C()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_23BBE3728()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_23BBE3734()
{
  return MEMORY[0x24BEE5658]();
}

uint64_t sub_23BBE3740()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_23BBE374C()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_23BBE3758()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_23BBE3764()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_23BBE3770()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_23BBE377C()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_23BBE3788()
{
  return MEMORY[0x24BEE7040]();
}

uint64_t sub_23BBE3794()
{
  return MEMORY[0x24BEE70E0]();
}

uint64_t sub_23BBE37A0()
{
  return MEMORY[0x24BEE4408]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
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

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x24BEE4B78]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x24BEE4BB8]();
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

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x24BEE4D08]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x24BEE4E28]();
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

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x24BEE4F58]();
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

