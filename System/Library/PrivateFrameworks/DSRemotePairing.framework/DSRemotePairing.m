void sub_23A1DD5F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,char a44)
{
  _Block_object_dispose(&a44, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void DSRemotePairing.getPairedDevices(completion:)(void (*a1)(_QWORD), uint64_t a2)
{
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
  void *v12;
  uint64_t v13;
  void (*v14)(_QWORD);
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  void (*v19)(char *, unint64_t, uint64_t);
  id v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;
  _QWORD v32[2];
  id v33;
  uint64_t v34;
  void (*v35)(_QWORD);
  uint64_t v36;
  void (*v37)(char *, unint64_t, uint64_t);
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  v34 = a2;
  v35 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256950C10);
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)v32 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_23A1DE9C8();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_23A1DEA4C();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8]();
  v11 = (char *)v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23A1DEA04();
  v12 = (void *)sub_23A1DE9F8();
  v13 = sub_23A1DE9E0();
  v14 = v35;
  v39 = v9;
  v40 = v5;
  v38 = v4;
  v33 = v12;
  v41 = MEMORY[0x24BEE4AF8];
  v15 = *(_QWORD *)(v13 + 16);
  if (v15)
  {
    v16 = v40;
    v17 = (*(unsigned __int8 *)(v39 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v39 + 80);
    v32[1] = v13;
    v18 = v13 + v17;
    v19 = *(void (**)(char *, unint64_t, uint64_t))(v39 + 16);
    v36 = *(_QWORD *)(v39 + 72);
    v37 = v19;
    while (1)
    {
      v37(v11, v18, v8);
      sub_23A1DEA34();
      v20 = objc_allocWithZone((Class)DSPairedComputer);
      v21 = (void *)sub_23A1DEA88();
      swift_bridgeObjectRelease();
      v22 = objc_msgSend(v20, sel_initWithDeviceName_, v21);

      if (!v22)
        break;
      sub_23A1DEA28();
      if (v23)
      {
        v24 = (void *)sub_23A1DEA88();
        swift_bridgeObjectRelease();
      }
      else
      {
        v24 = 0;
      }
      objc_msgSend(v22, sel_setSerialNumber_, v24);

      sub_23A1DEA40();
      if (v25)
      {
        v26 = (void *)sub_23A1DEA88();
        swift_bridgeObjectRelease();
      }
      else
      {
        v26 = 0;
      }
      objc_msgSend(v22, sel_setMarketingName_, v26);

      sub_23A1DEA1C();
      sub_23A1DE9BC();
      (*(void (**)(char *, uint64_t))(v16 + 8))(v7, v38);
      v27 = (void *)sub_23A1DEA88();
      swift_bridgeObjectRelease();
      objc_msgSend(v22, sel_setRemotePairingFrameworkIdentifier_, v27);

      sub_23A1DEA10();
      v28 = sub_23A1DE9A4();
      v29 = *(_QWORD *)(v28 - 8);
      v30 = 0;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v29 + 48))(v3, 1, v28) != 1)
      {
        v30 = (void *)sub_23A1DE998();
        (*(void (**)(char *, uint64_t))(v29 + 8))(v3, v28);
      }
      objc_msgSend(v22, sel_setDatePaired_, v30);

      v31 = v22;
      MEMORY[0x23B8443C4]();
      if (*(_QWORD *)((v41 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v41 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_23A1DEAD0();
      sub_23A1DEADC();
      sub_23A1DEAC4();

      (*(void (**)(char *, uint64_t))(v39 + 8))(v11, v8);
      v18 += v36;
      --v15;
      v16 = v40;
      if (!v15)
      {
        swift_bridgeObjectRelease();
        v35(0);
        goto LABEL_17;
      }
    }
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRelease();
    v14(0);
LABEL_17:

  }
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B8446B8]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

void sub_23A1DDC60(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  id v4;

  if (a1)
    v3 = sub_23A1DE98C();
  else
    v3 = 0;
  v4 = (id)v3;
  (*(void (**)(uint64_t))(a2 + 16))(a2);

}

uint64_t DSRemotePairing.removeAllPairedDevices()()
{
  void *v0;

  sub_23A1DEA04();
  v0 = (void *)sub_23A1DE9F8();
  sub_23A1DE9EC();

  return 0;
}

uint64_t sub_23A1DDD78(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

id DSRemotePairing.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id DSRemotePairing.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_init);
}

id DSRemotePairing.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_23A1DDF18(void (**a1)(const void *, _QWORD))
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
  void *v11;
  uint64_t v12;
  void (**v13)(const void *, _QWORD);
  uint64_t v14;
  unint64_t v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  void (**v28)(const void *, _QWORD);
  uint64_t v29;
  void *v30;
  void (**v31)(const void *, _QWORD);
  uint64_t v32;
  uint64_t v33;
  void (*v34)(char *, unint64_t, uint64_t);
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  v31 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256950C10);
  MEMORY[0x24BDAC7A8]();
  v2 = (char *)&v29 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_23A1DE9C8();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_23A1DEA4C();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8]();
  v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23A1DEA04();
  v11 = (void *)sub_23A1DE9F8();
  v12 = sub_23A1DE9E0();
  v13 = v31;
  v35 = v4;
  v36 = v8;
  v37 = MEMORY[0x24BEE4AF8];
  v14 = *(_QWORD *)(v12 + 16);
  if (v14)
  {
    v29 = v12;
    v30 = v11;
    v15 = v12 + ((*(unsigned __int8 *)(v36 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v36 + 80));
    v32 = *(_QWORD *)(v36 + 72);
    v33 = v3;
    v34 = *(void (**)(char *, unint64_t, uint64_t))(v36 + 16);
    while (1)
    {
      v34(v10, v15, v7);
      sub_23A1DEA34();
      v16 = objc_allocWithZone((Class)DSPairedComputer);
      v17 = (void *)sub_23A1DEA88();
      swift_bridgeObjectRelease();
      v18 = objc_msgSend(v16, sel_initWithDeviceName_, v17, v29);

      if (!v18)
        break;
      sub_23A1DEA28();
      if (v19)
      {
        v20 = (void *)sub_23A1DEA88();
        swift_bridgeObjectRelease();
      }
      else
      {
        v20 = 0;
      }
      objc_msgSend(v18, sel_setSerialNumber_, v20);

      sub_23A1DEA40();
      if (v21)
      {
        v22 = (void *)sub_23A1DEA88();
        swift_bridgeObjectRelease();
      }
      else
      {
        v22 = 0;
      }
      objc_msgSend(v18, sel_setMarketingName_, v22);

      sub_23A1DEA1C();
      sub_23A1DE9BC();
      (*(void (**)(char *, uint64_t))(v35 + 8))(v6, v33);
      v23 = (void *)sub_23A1DEA88();
      swift_bridgeObjectRelease();
      objc_msgSend(v18, sel_setRemotePairingFrameworkIdentifier_, v23);

      sub_23A1DEA10();
      v24 = sub_23A1DE9A4();
      v25 = *(_QWORD *)(v24 - 8);
      v26 = 0;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v2, 1, v24) != 1)
      {
        v26 = (void *)sub_23A1DE998();
        (*(void (**)(char *, uint64_t))(v25 + 8))(v2, v24);
      }
      objc_msgSend(v18, sel_setDatePaired_, v26);

      v27 = v18;
      MEMORY[0x23B8443C4]();
      if (*(_QWORD *)((v37 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v37 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_23A1DEAD0();
      sub_23A1DEADC();
      sub_23A1DEAC4();

      (*(void (**)(char *, uint64_t))(v36 + 8))(v10, v7);
      v15 += v32;
      if (!--v14)
      {
        swift_bridgeObjectRelease();
        v11 = v30;
        v28 = v31;
        goto LABEL_17;
      }
    }
    _Block_release(v31);
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRelease();
    v28 = v13;
LABEL_17:
    v28[2](v28, 0);

  }
}

_BYTE *_s15DSRemotePairingAAC21removeSelectedDevices_27invokingCompletionHandlerOn10completionySaySo16DSPairedComputerCG_So17OS_dispatch_queueCSgys5Error_pSgctF_0(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  uint64_t v15;
  _BYTE *result;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  unint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  BOOL v26;
  uint64_t v27;
  _BYTE *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  _BYTE v32[12];
  unsigned int v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  _QWORD aBlock[6];

  v37 = a3;
  v38 = a4;
  v39 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256950C20);
  MEMORY[0x24BDAC7A8]();
  v6 = &v32[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = sub_23A1DEA58();
  v8 = *(_QWORD *)(v7 - 8);
  v35 = v7;
  v36 = v8;
  MEMORY[0x24BDAC7A8]();
  v10 = &v32[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v11 = sub_23A1DEA64();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8]();
  v14 = &v32[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v15 = *(_QWORD *)(sub_23A1DEA7C() - 8);
  result = (_BYTE *)MEMORY[0x24BDAC7A8]();
  v18 = (uint64_t)&v32[-((v17 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v19 = a1 >> 62;
  v40 = a1;
  if (a1 >> 62)
  {
LABEL_18:
    v34 = (unint64_t)result;
    swift_bridgeObjectRetain();
    v27 = sub_23A1DEB0C();
    swift_bridgeObjectRelease();
    result = (_BYTE *)v34;
    if (v27)
    {
LABEL_3:
      sub_23A1DEA04();
      v20 = (void *)sub_23A1DE9F8();
      if (v19)
      {
        v21 = v40;
        swift_bridgeObjectRetain();
        v12 = sub_23A1DEB0C();
        if (v12)
        {
LABEL_5:
          v34 = v21 & 0xC000000000000001;
          v33 = *MEMORY[0x24BE7ED00];
          v18 = 4;
          while (1)
          {
            if (v34)
              result = (_BYTE *)MEMORY[0x23B844424](v18 - 4, v21);
            else
              result = *(id *)(v21 + 8 * v18);
            v14 = result;
            v19 = v18 - 3;
            if (__OFADD__(v18 - 4, 1))
            {
              __break(1u);
              goto LABEL_18;
            }
            result = objc_msgSend(result, sel_remotePairingFrameworkIdentifier);
            if (!result)
              break;
            v22 = result;
            sub_23A1DEA94();

            sub_23A1DE9B0();
            swift_bridgeObjectRelease();
            v23 = sub_23A1DE9C8();
            v24 = *(_QWORD *)(v23 - 8);
            result = (_BYTE *)(*(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v24 + 48))(v6, 1, v23);
            if ((_DWORD)result == 1)
              goto LABEL_22;
            (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v24 + 32))(v10, v6, v23);
            v11 = v35;
            v15 = v36;
            (*(void (**)(_BYTE *, _QWORD, uint64_t))(v36 + 104))(v10, v33, v35);
            v25 = swift_allocObject();
            *(_QWORD *)(v25 + 16) = v37;
            *(_QWORD *)(v25 + 24) = v38;
            swift_retain();
            sub_23A1DE9D4();

            swift_release();
            (*(void (**)(_BYTE *, uint64_t))(v15 + 8))(v10, v11);
            ++v18;
            v26 = v19 == v12;
            v21 = v40;
            if (v26)
              goto LABEL_16;
          }
          __break(1u);
LABEL_22:
          __break(1u);
          goto LABEL_23;
        }
      }
      else
      {
        v21 = v40;
        v12 = *(_QWORD *)((v40 & 0xFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain();
        if (v12)
          goto LABEL_5;
      }
LABEL_16:

      return (_BYTE *)swift_bridgeObjectRelease();
    }
  }
  else if (*(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_3;
  }
  if (v39)
  {
    v28 = result;
    v29 = swift_allocObject();
    v30 = v38;
    *(_QWORD *)(v29 + 16) = v37;
    *(_QWORD *)(v29 + 24) = v30;
    aBlock[4] = sub_23A1DE874;
    aBlock[5] = v29;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_23A1DDD78;
    aBlock[3] = &block_descriptor;
    v31 = _Block_copy(aBlock);
    swift_retain();
    sub_23A1DEA70();
    v41 = MEMORY[0x24BEE4AF8];
    sub_23A1DE8B0();
    __swift_instantiateConcreteTypeFromMangledName(&qword_256950C30);
    sub_23A1DE8F8();
    sub_23A1DEAF4();
    MEMORY[0x23B84440C](0, v18, v14, v31);
    _Block_release(v31);
    (*(void (**)(_BYTE *, uint64_t))(v12 + 8))(v14, v11);
    (*(void (**)(uint64_t, _BYTE *))(v15 + 8))(v18, v28);
    return (_BYTE *)swift_release();
  }
LABEL_23:
  __break(1u);
  return result;
}

uint64_t type metadata accessor for DSRemotePairing()
{
  return objc_opt_self();
}

unint64_t sub_23A1DE7C8()
{
  unint64_t result;

  result = qword_256950C18;
  if (!qword_256950C18)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_256950C18);
  }
  return result;
}

uint64_t sub_23A1DE804()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void sub_23A1DE828(uint64_t a1)
{
  uint64_t v1;

  sub_23A1DDC60(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_23A1DE830()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23A1DE854()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_23A1DE874()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(v0 + 16))(0);
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

unint64_t sub_23A1DE8B0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256950C28;
  if (!qword_256950C28)
  {
    v1 = sub_23A1DEA64();
    result = MEMORY[0x23B8446D0](MEMORY[0x24BEE5468], v1);
    atomic_store(result, (unint64_t *)&qword_256950C28);
  }
  return result;
}

unint64_t sub_23A1DE8F8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256950C38;
  if (!qword_256950C38)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_256950C30);
    result = MEMORY[0x23B8446D0](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_256950C38);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B8446C4](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_23A1DE98C()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_23A1DE998()
{
  return MEMORY[0x24BDCE5D8]();
}

uint64_t sub_23A1DE9A4()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_23A1DE9B0()
{
  return MEMORY[0x24BDCE998]();
}

uint64_t sub_23A1DE9BC()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_23A1DE9C8()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_23A1DE9D4()
{
  return MEMORY[0x24BE7ECA8]();
}

uint64_t sub_23A1DE9E0()
{
  return MEMORY[0x24BE7ECB0]();
}

uint64_t sub_23A1DE9EC()
{
  return MEMORY[0x24BE7ECB8]();
}

uint64_t sub_23A1DE9F8()
{
  return MEMORY[0x24BE7ECC0]();
}

uint64_t sub_23A1DEA04()
{
  return MEMORY[0x24BE7ECC8]();
}

uint64_t sub_23A1DEA10()
{
  return MEMORY[0x24BE7ECD0]();
}

uint64_t sub_23A1DEA1C()
{
  return MEMORY[0x24BE7ECD8]();
}

uint64_t sub_23A1DEA28()
{
  return MEMORY[0x24BE7ECE0]();
}

uint64_t sub_23A1DEA34()
{
  return MEMORY[0x24BE7ECE8]();
}

uint64_t sub_23A1DEA40()
{
  return MEMORY[0x24BE7ECF0]();
}

uint64_t sub_23A1DEA4C()
{
  return MEMORY[0x24BE7ECF8]();
}

uint64_t sub_23A1DEA58()
{
  return MEMORY[0x24BE7ED08]();
}

uint64_t sub_23A1DEA64()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_23A1DEA70()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_23A1DEA7C()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_23A1DEA88()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_23A1DEA94()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_23A1DEAA0()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_23A1DEAAC()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_23A1DEAB8()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_23A1DEAC4()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_23A1DEAD0()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_23A1DEADC()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_23A1DEAE8()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_23A1DEAF4()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_23A1DEB00()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_23A1DEB0C()
{
  return MEMORY[0x24BEE3068]();
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

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

uint64_t lockdown_copy_paired_host_info()
{
  return MEMORY[0x24BEDC4F0]();
}

uint64_t lockdown_wifi_sync_enabled()
{
  return MEMORY[0x24BEDC548]();
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

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
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

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x24BEE4CA8]();
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

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

