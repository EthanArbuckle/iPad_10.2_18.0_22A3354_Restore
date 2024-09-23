uint64_t sub_213FD562C()
{
  sub_213FD55D8();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for IdentityHeroViewControllerProvider()
{
  return objc_opt_self();
}

uint64_t sub_213FD5670(uint64_t a1)
{
  uint64_t v1;

  return sub_213FD5564(a1, *(_QWORD *)(v1 + 16), *(uint64_t (**)(uint64_t))(v1 + 24));
}

uint64_t block_copy_helper_25(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_25()
{
  return swift_release();
}

uint64_t sub_213FD5694()
{
  swift_release();
  return swift_deallocObject();
}

id sub_213FD56B8(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v19;

  v12 = (void *)sub_213FF7508();
  v13 = (void *)sub_213FF9428();
  swift_bridgeObjectRelease();
  v14 = (void *)sub_213FF9428();
  swift_bridgeObjectRelease();
  v15 = (void *)sub_213FF9428();
  swift_bridgeObjectRelease();
  if (a10)
  {
    v16 = (void *)sub_213FF9428();
    swift_bridgeObjectRelease();
  }
  else
  {
    v16 = 0;
  }
  v17 = objc_msgSend(v19, sel_initWithImageData_title_subtitle_primaryButtonTitle_secondaryButtonTitle_, v12, v13, v14, v15, v16);
  sub_213F3F6F0(a1, a2);

  return v17;
}

uint64_t sub_213FD57E0()
{
  uint64_t v0;

  return sub_213FD4EA4(v0);
}

uint64_t sub_213FD57E8()
{
  uint64_t v0;

  return sub_213FD4F34(v0);
}

uint64_t sub_213FD57F0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[4];
  _QWORD v7[4];

  v0 = sub_213FF8D38();
  v6[2] = *(_QWORD *)(v0 - 8);
  v6[3] = v0;
  MEMORY[0x24BDAC7A8](v0);
  v6[1] = (char *)v6 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = sub_213FF8810();
  MEMORY[0x24BDAC7A8](v2);
  v3 = sub_213FF881C();
  v6[0] = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D5C398);
  MEMORY[0x24BDAC7A8](v4);
  sub_213FF78B0();
  sub_213FF78A4();
  __swift_project_boxed_opaque_existential_1(v7, v7[3]);
  sub_213FF7F34();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v7);
  return 0;
}

void sub_213FD5B64(id a1, char a2)
{
  if ((a2 & 1) != 0)

}

uint64_t sub_213FD5B70(uint64_t result)
{
  if ((result & 1) != 0)
    return sub_213FD39E4();
  return result;
}

uint64_t sub_213FD5B7C()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_213FD5BA4(void *a1)
{
  uint64_t v1;

  return sub_213FD462C(a1, *(_QWORD *)(v1 + 16), *(void (**)(_QWORD))(v1 + 24), *(_QWORD *)(v1 + 32));
}

void sub_213FD5BB0()
{
  uint64_t v0;

  sub_213FD4054(v0);
}

uint64_t sub_213FD5BC8()
{
  return sub_213FD3D08();
}

void destroy for IdentityProofingReviewSubmissionViewConfiguration(uint64_t a1)
{
  swift_release();

}

_QWORD *_s9CoreIDVUI49IdentityProofingReviewSubmissionViewConfigurationVwCP_0(_QWORD *a1, _QWORD *a2)
{
  void *v3;
  id v4;

  v3 = (void *)a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_retain();
  v4 = v3;
  return a1;
}

_QWORD *assignWithCopy for IdentityProofingReviewSubmissionViewConfiguration(_QWORD *a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  id v6;

  *a1 = *a2;
  swift_retain();
  swift_release();
  v4 = (void *)a2[1];
  v5 = (void *)a1[1];
  a1[1] = v4;
  v6 = v4;

  a1[2] = a2[2];
  return a1;
}

uint64_t assignWithTake for IdentityProofingReviewSubmissionViewConfiguration(uint64_t a1, uint64_t a2)
{
  void *v4;

  swift_release();
  v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;

  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  return a1;
}

ValueMetadata *type metadata accessor for IdentityProofingReviewSubmissionViewConfiguration()
{
  return &type metadata for IdentityProofingReviewSubmissionViewConfiguration;
}

void destroy for IdentityProofingDocumentConfirmation(uint64_t a1)
{
  swift_bridgeObjectRelease();

}

_QWORD *_s9CoreIDVUI36IdentityProofingDocumentConfirmationVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = (void *)a2[2];
  a1[2] = v4;
  swift_bridgeObjectRetain();
  v5 = v4;
  return a1;
}

_QWORD *assignWithCopy for IdentityProofingDocumentConfirmation(_QWORD *a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  id v6;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = (void *)a1[2];
  v5 = (void *)a2[2];
  a1[2] = v5;
  v6 = v5;

  return a1;
}

uint64_t assignWithTake for IdentityProofingDocumentConfirmation(uint64_t a1, uint64_t a2)
{
  void *v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  v4 = *(void **)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);

  return a1;
}

uint64_t getEnumTagSinglePayload for IdentityProofingDocumentConfirmation(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for IdentityProofingDocumentConfirmation(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for IdentityProofingDocumentConfirmation()
{
  return &type metadata for IdentityProofingDocumentConfirmation;
}

uint64_t sub_213FD5EB0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  v0 = (_QWORD *)sub_213FF7EC8();
  if (!v0)
    return 0;
  v1 = v0[2];
  if ((unint64_t)(v1 - 1) >= 2)
  {
    if (v1 == 3)
    {
      v2 = v0[6];
      v3 = v0[7];
      goto LABEL_6;
    }
    swift_bridgeObjectRelease();
    return 0;
  }
  v2 = v0[4];
  v3 = v0[5];
LABEL_6:
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = sub_213FE1990(v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_213FD5F54(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  _QWORD *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  uint64_t v28;
  uint64_t v29;

  v29 = sub_213FF8D38();
  v2 = *(_QWORD *)(v29 - 8);
  MEMORY[0x24BDAC7A8](v29);
  v4 = (char *)&v28 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_213FF8690();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(qword_254D5D1D8);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (_QWORD *)sub_213FF7EC8();
  v13 = *(void **)(a1 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_livenessConfig);
  if (v13)
  {
    v14 = v13;
    v15 = (void *)sub_213FF7DA8();

    if (v15)
    {

      v16 = *(_QWORD *)(a1 + 176);
      if (v16)
      {
        if (*(_QWORD *)(v16 + 16))
        {
          swift_bridgeObjectRetain();
          v17 = sub_213F42568(0xD000000000000015, 0x8000000214005B10);
          if ((v18 & 1) != 0)
          {
            (*(void (**)(char *, unint64_t, uint64_t))(v6 + 16))(v11, *(_QWORD *)(v16 + 56) + *(_QWORD *)(v6 + 72) * v17, v5);
            (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v6 + 56))(v11, 0, 1, v5);
          }
          else
          {
            (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v11, 1, 1, v5);
          }
        }
        else
        {
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v11, 1, 1, v5);
          swift_bridgeObjectRetain();
        }
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v11, 1, v5))
        {
          sub_213F65364((uint64_t)v11);
          swift_bridgeObjectRelease();
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v8, v11, v5);
          sub_213F65364((uint64_t)v11);
          swift_bridgeObjectRelease();
          v24 = sub_213FF8684();
          (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
          if (v24)
          {
            swift_bridgeObjectRelease();
            sub_213FF7778();
            v25 = sub_213FF8D2C();
            v26 = sub_213FF95C0();
            if (os_log_type_enabled(v25, v26))
            {
              v27 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)v27 = 0;
              _os_log_impl(&dword_213F36000, v25, v26, "selecting unorderdUI messages for Passive Liveness", v27, 2u);
              MEMORY[0x2199C815C](v27, -1, -1);
            }

            (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v29);
            v12 = (_QWORD *)v24;
            goto LABEL_12;
          }
        }
      }
    }
  }
  if (!v12)
    return 0;
LABEL_12:
  v19 = v12[2];
  if (v19 == 1)
  {
    v20 = v12[4];
    v21 = v12[5];
    goto LABEL_18;
  }
  if (v19 == 2)
  {
    v20 = v12[6];
    v21 = v12[7];
    goto LABEL_18;
  }
  if (v19 != 3)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  v20 = v12[8];
  v21 = v12[9];
LABEL_18:
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v22 = sub_213FE1990(v20, v21);
  swift_bridgeObjectRelease();
  return v22;
}

uint64_t sub_213FD62A0(uint64_t a1, uint64_t a2)
{
  return sub_213FD62B8(a1, a2, MEMORY[0x24BE1D2E0]);
}

uint64_t sub_213FD62AC(uint64_t a1, uint64_t a2)
{
  return sub_213FD62B8(a1, a2, MEMORY[0x24BE1D308]);
}

uint64_t sub_213FD62B8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;

  v3 = a3();
  if (v4)
  {
    v5 = v4;
  }
  else
  {
    v3 = 0;
    v5 = 0xE000000000000000;
  }
  v6 = sub_213FE1990(v3, v5);
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_213FD6314()
{
  return 3;
}

ValueMetadata *type metadata accessor for DigitalPresentmentPlatter()
{
  return &type metadata for DigitalPresentmentPlatter;
}

uint64_t sub_213FD632C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_213FD6344()
{
  return sub_213FF8FB4();
}

uint64_t sub_213FD635C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  _OWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v27;
  uint64_t v29;

  v4 = sub_213FF8FF0();
  MEMORY[0x24BDAC7A8](v4);
  v6 = (_OWORD *)((char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  v7 = sub_213FF8CF0();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D60270);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_254D5BAD0 != -1)
    swift_once();
  v14 = __swift_project_value_buffer(v7, (uint64_t)qword_254D63050);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v14, v7);
  v15 = sub_213FF92CC();
  v16 = sub_213FF9140();
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D60278);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 16))(v13, a1, v17);
  v18 = &v13[*(int *)(v11 + 36)];
  *(_QWORD *)v18 = v15;
  v18[8] = v16;
  v19 = (char *)v6 + *(int *)(v4 + 20);
  v20 = *MEMORY[0x24BDEEB68];
  v21 = sub_213FF90C8();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 104))(v19, v20, v21);
  __asm { FMOV            V0.2D, #10.0 }
  *v6 = _Q0;
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D60280);
  sub_213F59064((uint64_t)v6, a2 + *(int *)(v27 + 36));
  sub_213FD6554((uint64_t)v13, a2);
  sub_213F590A8((uint64_t)v6);
  return sub_213FD659C((uint64_t)v13);
}

uint64_t sub_213FD6554(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D60270);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_213FD659C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D60270);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_213FD65E0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254D60288;
  if (!qword_254D60288)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254D60280);
    v2[0] = sub_213FD6664();
    v2[1] = sub_213F58F08(&qword_254D5CC00, &qword_254D5CC08, MEMORY[0x24BDEB9D0]);
    result = MEMORY[0x2199C80A8](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254D60288);
  }
  return result;
}

unint64_t sub_213FD6664()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254D60290;
  if (!qword_254D60290)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254D60270);
    v2[0] = sub_213F58F08(&qword_254D60298, &qword_254D60278, MEMORY[0x24BDEFB78]);
    v2[1] = sub_213F58F08(&qword_254D602A0, &qword_254D602A8, MEMORY[0x24BDF06D0]);
    result = MEMORY[0x2199C80A8](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254D60290);
  }
  return result;
}

void sub_213FD6700(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  id v4;

  if (a1)
    v3 = sub_213FF7490();
  else
    v3 = 0;
  v4 = (id)v3;
  (*(void (**)(uint64_t))(a2 + 16))(a2);

}

id CIDVUIInternalIdentityProofingDataSharingFlowManager.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id CIDVUIInternalIdentityProofingDataSharingFlowManager.init()()
{
  void *v0;
  id v1;
  char *v2;
  id v3;
  uint64_t v4;
  objc_super v6;

  v1 = objc_allocWithZone((Class)sub_213FF8648());
  v2 = v0;
  v3 = objc_msgSend(v1, sel_init);
  type metadata accessor for IdentityProofingDataSharingFlowManager();
  v4 = swift_allocObject();
  *(_QWORD *)&v2[OBJC_IVAR____TtC9CoreIDVUI52CIDVUIInternalIdentityProofingDataSharingFlowManager_dataSharingFlowManager] = sub_213FD7678((uint64_t)v3, v4);

  v6.receiver = v2;
  v6.super_class = (Class)type metadata accessor for CIDVUIInternalIdentityProofingDataSharingFlowManager();
  return objc_msgSendSuper2(&v6, sel_init);
}

uint64_t sub_213FD68A0()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
  return swift_task_switch();
}

uint64_t sub_213FD68B8()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 24) = v1;
  *v1 = v0;
  v1[1] = sub_213FD690C;
  return sub_213F61470();
}

uint64_t sub_213FD690C(char a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(v4 + 32) = v1;
  swift_task_dealloc();
  if (v1)
    return swift_task_switch();
  else
    return (*(uint64_t (**)(_QWORD))(v4 + 8))(a1 & 1);
}

uint64_t sub_213FD6980()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 32);
  sub_213FD77BC();
  sub_213FF9458();
  sub_213FF96D4();
  swift_bridgeObjectRelease();
  swift_willThrow();

  return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
}

uint64_t sub_213FD6B30(const void *a1, void *a2)
{
  uint64_t v2;
  id v4;

  *(_QWORD *)(v2 + 16) = a2;
  *(_QWORD *)(v2 + 24) = _Block_copy(a1);
  v4 = a2;
  return swift_task_switch();
}

uint64_t sub_213FD6B78()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 32) = v1;
  *v1 = v0;
  v1[1] = sub_213FD6BCC;
  return sub_213F61470();
}

uint64_t sub_213FD6BCC(char a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v6;

  v4 = *v2;
  *(_QWORD *)(v4 + 40) = v1;
  swift_task_dealloc();
  if (v1)
    return swift_task_switch();
  v6 = *(_QWORD *)(v4 + 24);

  (*(void (**)(uint64_t, _QWORD, _QWORD))(v6 + 16))(v6, a1 & 1, 0);
  _Block_release(*(const void **)(v4 + 24));
  return (*(uint64_t (**)(void))(v4 + 8))();
}

uint64_t sub_213FD6C6C()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;

  v1 = *(void **)(v0 + 40);
  v3 = *(void **)(v0 + 16);
  v2 = *(_QWORD *)(v0 + 24);
  sub_213FD77BC();
  sub_213FF9458();
  v4 = (void *)sub_213FF96D4();
  swift_bridgeObjectRelease();
  swift_willThrow();

  v5 = (void *)sub_213FF7490();
  (*(void (**)(uint64_t, _QWORD, void *))(v2 + 16))(v2, 0, v5);

  _Block_release(*(const void **)(v0 + 24));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_213FD6D3C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
  return swift_task_switch();
}

uint64_t sub_213FD6D54()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 24) = v1;
  *v1 = v0;
  v1[1] = sub_213FD6DA8;
  return sub_213F6185C();
}

uint64_t sub_213FD6DA8(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 32) = v1;
  swift_task_dealloc();
  if (!v1)
    *(_QWORD *)(v4 + 40) = a1;
  return swift_task_switch();
}

uint64_t sub_213FD6E1C()
{
  uint64_t v0;

  if (sub_213FF872C() < 0)
    return sub_213FF986C();
  else
    return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_213FD6EA8()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 32);
  sub_213FD77BC();
  sub_213FF9458();
  sub_213FF96D4();
  swift_bridgeObjectRelease();
  swift_willThrow();

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_213FD7054(const void *a1, void *a2)
{
  _QWORD *v2;
  id v4;
  _QWORD *v5;

  v2[2] = a2;
  v2[3] = _Block_copy(a1);
  v4 = a2;
  v5 = (_QWORD *)swift_task_alloc();
  v2[4] = v5;
  *v5 = v2;
  v5[1] = sub_213FD70CC;
  v5[2] = v4;
  return swift_task_switch();
}

uint64_t sub_213FD70CC(uint64_t a1)
{
  void *v1;
  uint64_t *v2;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v4 = *(void **)(*v2 + 16);
  v5 = *v2;
  swift_task_dealloc();

  v6 = *(_QWORD *)(v5 + 24);
  if (v1)
  {
    v7 = (void *)sub_213FF7490();

    (*(void (**)(uint64_t))(v6 + 16))(v6);
  }
  else
  {
    (*(void (**)(_QWORD, uint64_t, _QWORD))(v6 + 16))(*(_QWORD *)(v5 + 24), a1, 0);
  }
  _Block_release(*(const void **)(v5 + 24));
  return (*(uint64_t (**)(void))(v5 + 8))();
}

uint64_t sub_213FD7174(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;

  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    v5 = sub_213FF8720();
    if ((v6 & 1) != 0)
      v7 = 1;
    else
      v7 = v5;
    v8 = swift_allocObject();
    *(_QWORD *)(v8 + 16) = a2;
    *(_QWORD *)(v8 + 24) = a3;
    swift_retain();
    sub_213F61DE8(v7, (uint64_t)sub_213FD781C, v8);
    return swift_release();
  }
  return result;
}

void sub_213FD7200(void *a1, void (*a2)(void))
{
  id v4;
  void *v5;
  id v6;

  if (a1)
  {
    sub_213FD77BC();
    sub_213FF9458();
    v4 = a1;
    v5 = (void *)sub_213FF96D4();
    swift_bridgeObjectRelease();
    v6 = v5;
    ((void (*)(void *))a2)(v5);

  }
  else
  {
    a2();
  }
}

id CIDVUIInternalIdentityProofingDataSharingFlowManager.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CIDVUIInternalIdentityProofingDataSharingFlowManager();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_213FD73DC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v4;
  *v4 = v3;
  v4[1] = sub_213F4CFEC;
  return v6();
}

uint64_t sub_213FD7430(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(void);

  v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v5;
  *v5 = v4;
  v5[1] = sub_213F4CFEC;
  return v7();
}

uint64_t sub_213FD7484(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_213FF956C();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_213FF9560();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_213FD79B0(a1);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_213FF9524();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_213FD75C8(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_213FD762C;
  return v6(a1);
}

uint64_t sub_213FD762C()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_213FD7678(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v12;

  v4 = sub_213FF8D38();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_213FF7F64();
  swift_allocObject();
  *(_QWORD *)(a2 + 24) = sub_213FF7F58();
  sub_213FF7778();
  v8 = sub_213FF8D2C();
  v9 = sub_213FF95B4();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_213F36000, v8, v9, "IdentityProofingDataSharingFlowManager creating xpc connection", v10, 2u);
    MEMORY[0x2199C815C](v10, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  *(_QWORD *)(a2 + 16) = a1;
  return a2;
}

uint64_t type metadata accessor for CIDVUIInternalIdentityProofingDataSharingFlowManager()
{
  return objc_opt_self();
}

unint64_t sub_213FD77BC()
{
  unint64_t result;

  result = qword_254D5C390;
  if (!qword_254D5C390)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_254D5C390);
  }
  return result;
}

uint64_t sub_213FD77F8()
{
  swift_release();
  return swift_deallocObject();
}

void sub_213FD781C(void *a1)
{
  uint64_t v1;

  sub_213FD7200(a1, *(void (**)(void))(v1 + 16));
}

uint64_t method lookup function for CIDVUIInternalIdentityProofingDataSharingFlowManager()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CIDVUIInternalIdentityProofingDataSharingFlowManager.checkUserConsent()()
{
  _QWORD *v0;
  uint64_t v1;
  int *v2;
  _QWORD *v3;
  uint64_t (*v5)(void);

  v2 = *(int **)((*MEMORY[0x24BEE4EA0] & *v0) + 0x58);
  v5 = (uint64_t (*)(void))((char *)v2 + *v2);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_213F7F75C;
  return v5();
}

uint64_t dispatch thunk of CIDVUIInternalIdentityProofingDataSharingFlowManager.fetchUserConsent()()
{
  _QWORD *v0;
  uint64_t v1;
  int *v2;
  _QWORD *v3;
  uint64_t (*v5)(void);

  v2 = *(int **)((*MEMORY[0x24BEE4EA0] & *v0) + 0x60);
  v5 = (uint64_t (*)(void))((char *)v2 + *v2);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_213F7F75C;
  return v5();
}

uint64_t dispatch thunk of CIDVUIInternalIdentityProofingDataSharingFlowManager.didChangeUserConsent(_:completion:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x68))();
}

uint64_t sub_213FD791C()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_213FD7944()
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
  v4[1] = sub_213F4CFEC;
  return ((uint64_t (*)(const void *, void *))((char *)&dword_254D602D8 + dword_254D602D8))(v2, v3);
}

uint64_t sub_213FD79B0(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D5F760);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_213FD79F0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_213F4AD48;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_254D602F8 + dword_254D602F8))(a1, v4);
}

uint64_t sub_213FD7A64()
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
  v4[1] = sub_213F4AD48;
  return ((uint64_t (*)(const void *, void *))((char *)&dword_254D60308 + dword_254D60308))(v2, v3);
}

uint64_t sub_213FD7ADC(void *a1, char a2, uint64_t (*a3)(uint64_t), uint64_t a4)
{
  uint64_t v4;
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
  uint64_t v21;
  uint64_t result;
  char *v23;
  void (*v24)(char *, _QWORD, uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  NSObject *v35;
  os_log_type_t v36;
  uint8_t *v37;
  uint8_t *v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;

  v42 = a4;
  v8 = sub_213FF8D38();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v39 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_213FF8810();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v39 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_213FF881C();
  v17 = MEMORY[0x24BDAC7A8](v16);
  v20 = v4;
  v21 = *(_QWORD *)(v4 + 32);
  if ((a2 & 1) == 0)
  {
    swift_retain();
    sub_213FED848(a1, 0xD000000000000012, (void *)0x8000000214000910, 0, (uint64_t)a3, v42);
    return swift_release();
  }
  v40 = v8;
  v41 = v11;
  v39 = v9;
  if ((*(_QWORD *)(v21 + 136) & 3) == 2)
  {
    swift_retain();
    sub_213FE2EBC(a1);
    result = swift_release();
    if (!a3)
      return result;
    return a3(result);
  }
  v23 = (char *)&v39 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = *(void (**)(char *, _QWORD, uint64_t))(v13 + 104);
  v25 = v17;
  v26 = v19;
  v27 = v20;
  v24(v15, *MEMORY[0x24BE1DD00], v12);
  sub_213F7DA10(MEMORY[0x24BEE4AF8]);
  sub_213FF8828();
  v28 = *(_QWORD *)(v27 + 32);
  sub_213FD7EAC();
  v29 = (void *)swift_allocError();
  v30 = v26;
  v31 = v23;
  v32 = v25;
  (*(void (**)(uint64_t, char *, uint64_t))(v26 + 16))(v33, v23, v25);
  swift_retain();
  v34 = v41;
  sub_213FF7778();
  v35 = sub_213FF8D2C();
  v36 = sub_213FF95C0();
  if (os_log_type_enabled(v35, v36))
  {
    v37 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v37 = 0;
    _os_log_impl(&dword_213F36000, v35, v36, "Invoked delegate to close the view", v37, 2u);
    v38 = v37;
    v34 = v41;
    MEMORY[0x2199C815C](v38, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v39 + 8))(v34, v40);
  sub_213FEB1F4();
  if (MEMORY[0x2199C81F8](v28 + 96))
  {
    sub_213F7D660(v29);
    swift_unknownObjectRelease();
  }

  swift_release();
  result = (*(uint64_t (**)(char *, uint64_t))(v30 + 8))(v31, v32);
  if (a3)
    return a3(result);
  return result;
}

uint64_t sub_213FD7E50()
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for RGBCaptureInteractor()
{
  return objc_opt_self();
}

unint64_t sub_213FD7EAC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254D5C040;
  if (!qword_254D5C040)
  {
    v1 = sub_213FF881C();
    result = MEMORY[0x2199C80A8](MEMORY[0x24BE1DE78], v1);
    atomic_store(result, (unint64_t *)&qword_254D5C040);
  }
  return result;
}

uint64_t sub_213FD7EF4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void *v6;
  NSData *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  UIImage *v17;
  NSData *v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  UIImage *v23;
  uint64_t *v24;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v1 = v0;
  v2 = sub_213FF8D08();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(void **)(v0 + 32);
  if (v6)
  {
    swift_retain();
    v7 = v6;
    v8 = sub_213FF7E68();
    sub_213F7A6D8(v8);
    v28 = v9;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    swift_release();
    swift_bridgeObjectRelease();
    sub_213FC0990();
    if (qword_254D5BAF8 != -1)
      swift_once();
    v16 = __swift_project_value_buffer(v2, (uint64_t)qword_254D630C8);
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v16, v2);
    v17 = (UIImage *)sub_213FF96EC();
    v18 = UIImagePNGRepresentation(v17);

    if (v18)
    {
      v19 = sub_213FF7514();
      v21 = v20;

    }
    else
    {
      v19 = 0;
      v21 = 0xC000000000000000;
    }
    swift_bridgeObjectRetain();
    sub_213F96998(v13, v15);
    sub_213F4CF08(v13, v15);
    if (v11)
    {
      swift_bridgeObjectRetain();
      sub_213F96998(v13, v15);
      swift_bridgeObjectRelease();
      if (v15 >> 60 != 15)
      {
        v24 = (uint64_t *)(*(_QWORD *)(v1 + 16) + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_cardArtData);
        swift_beginAccess();
        swift_retain();
        sub_213F96998(v13, v15);
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v29 = *v24;
        *v24 = 0x8000000000000000;
        sub_213F436B0(v13, v15, v28, v11, isUniquelyReferenced_nonNull_native);
        *v24 = v29;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_endAccess();
        sub_213F3F6F0(v19, v21);
        swift_bridgeObjectRelease();
        sub_213F4CF08(v13, v15);
        swift_release();

        return v13;
      }
      swift_bridgeObjectRelease();
      sub_213F4CF08(v13, v15);
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      sub_213F4CF08(v13, v15);
    }
  }
  else
  {
    sub_213FC0990();
    if (qword_254D5BAF8 != -1)
      swift_once();
    v22 = __swift_project_value_buffer(v2, (uint64_t)qword_254D630C8);
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v22, v2);
    v23 = (UIImage *)sub_213FF96EC();
    v7 = UIImagePNGRepresentation(v23);

    if (!v7)
      return 0;
    v19 = sub_213FF7514();
  }

  return v19;
}

uint64_t sub_213FD824C()
{
  uint64_t v0;

  swift_release();
  swift_release();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for IdentityProofingImageAssetProvider()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for UsingYourIDInteractor()
{
  return objc_opt_self();
}

id sub_213FD82C0()
{
  return sub_213FD8308(&OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___bottomTray, &qword_254D5BA88, (double *)&qword_254D60688);
}

id sub_213FD82E4()
{
  return sub_213FD8308(&OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___textContainerStackView, &qword_254D5BAB0, (double *)&qword_254D606B0);
}

id sub_213FD8308(uint64_t *a1, _QWORD *a2, double *a3)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v9;
  id v10;

  v4 = *a1;
  v5 = *(void **)(v3 + *a1);
  if (v5)
  {
    v6 = *(id *)(v3 + *a1);
  }
  else
  {
    v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD978]), sel_init);
    objc_msgSend(v6, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    objc_msgSend(v6, sel_setAxis_, 1);
    if (*a2 != -1)
      swift_once();
    objc_msgSend(v6, sel_setSpacing_, *a3);
    v9 = *(void **)(v3 + v4);
    *(_QWORD *)(v3 + v4) = v6;

    v5 = 0;
  }
  v10 = v5;
  return v6;
}

id sub_213FD83DC()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  void *v4;
  id v5;

  v1 = OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___titleLabel;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___titleLabel);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___titleLabel);
  }
  else
  {
    v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD708]), sel_init);
    objc_msgSend(v3, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    objc_msgSend(v3, sel_setTextAlignment_, 1);
    objc_msgSend(v3, sel_setNumberOfLines_, 0);
    objc_msgSend(v3, sel_setLineBreakMode_, 0);
    v4 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v3;

    v2 = 0;
  }
  v5 = v2;
  return v3;
}

id sub_213FD8498()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  void *v4;
  id v5;

  v1 = OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___subTitleLabel;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___subTitleLabel);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___subTitleLabel);
  }
  else
  {
    v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD708]), sel_init);
    objc_msgSend(v3, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    objc_msgSend(v3, sel_setTextAlignment_, 1);
    objc_msgSend(v3, sel_setNumberOfLines_, 0);
    v4 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v3;

    v2 = 0;
  }
  v5 = v2;
  return v3;
}

id sub_213FD8540()
{
  return sub_213FD8940(&OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___scrollView, (Class *)0x24BEBD918);
}

id sub_213FD8554()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;

  v1 = OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___mainStackView;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___mainStackView);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___mainStackView);
  }
  else
  {
    v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD978]), sel_init);
    objc_msgSend(v4, sel_setAxis_, 1);
    objc_msgSend(v4, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    objc_msgSend(v4, sel_setAlignment_, 3);
    if (qword_254D5BA90 != -1)
      swift_once();
    objc_msgSend(v4, sel_setSpacing_, *(double *)&qword_254D60690);
    v5 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v4;
    v3 = v4;

    v2 = 0;
  }
  v6 = v2;
  return v3;
}

_BYTE *sub_213FD8640()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  _BYTE *v3;
  uint64_t v4;
  _BYTE *v5;
  void *v6;
  id v7;

  v1 = OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___primaryButton;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___primaryButton);
  if (v2)
  {
    v3 = *(_BYTE **)(v0 + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___primaryButton);
  }
  else
  {
    v4 = v0;
    v5 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for CoreIDVUIButton()), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
    v5[OBJC_IVAR____TtC9CoreIDVUI15CoreIDVUIButton_style] = 0;
    v3 = v5;
    sub_213FA7EA4();
    objc_msgSend(v3, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    objc_msgSend(v3, sel_addTarget_action_forControlEvents_, v4, sel_primaryButtonClicked, 64);
    v6 = *(void **)(v4 + v1);
    *(_QWORD *)(v4 + v1) = v3;

    v2 = 0;
  }
  v7 = v2;
  return v3;
}

_BYTE *sub_213FD870C()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  _BYTE *v3;
  uint64_t v4;
  _BYTE *v5;
  void *v6;
  id v7;

  v1 = OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___secondaryButton;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___secondaryButton);
  if (v2)
  {
    v3 = *(_BYTE **)(v0 + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___secondaryButton);
  }
  else
  {
    v4 = v0;
    v5 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for CoreIDVUIButton()), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
    v5[OBJC_IVAR____TtC9CoreIDVUI15CoreIDVUIButton_style] = 1;
    v3 = v5;
    sub_213FA7EA4();
    objc_msgSend(v3, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    objc_msgSend(v3, sel_addTarget_action_forControlEvents_, v4, sel_secondaryButtonClicked, 64);
    v6 = *(void **)(v4 + v1);
    *(_QWORD *)(v4 + v1) = v3;

    v2 = 0;
  }
  v7 = v2;
  return v3;
}

_BYTE *sub_213FD87DC()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  _BYTE *v3;
  uint64_t v4;
  _BYTE *v5;
  void *v6;
  id v7;

  v1 = OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___tertiaryButton;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___tertiaryButton);
  if (v2)
  {
    v3 = *(_BYTE **)(v0 + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___tertiaryButton);
  }
  else
  {
    v4 = v0;
    v5 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for CoreIDVUIButton()), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
    v5[OBJC_IVAR____TtC9CoreIDVUI15CoreIDVUIButton_style] = 2;
    v3 = v5;
    sub_213FA7EA4();
    objc_msgSend(v3, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    objc_msgSend(v3, sel_addTarget_action_forControlEvents_, v4, sel_secondaryButtonClicked, 64);
    v6 = *(void **)(v4 + v1);
    *(_QWORD *)(v4 + v1) = v3;

    v2 = 0;
  }
  v7 = v2;
  return v3;
}

id sub_213FD88AC()
{
  return sub_213FD88D4(&OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___footerCaption, (uint64_t (*)(void))sub_213FDC42C);
}

id sub_213FD88C0()
{
  return sub_213FD88D4(&OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___footerCaptionSpacer, (uint64_t (*)(void))sub_213FDC4F4);
}

id sub_213FD88D4(uint64_t *a1, uint64_t (*a2)(void))
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v3 = *a1;
  v4 = *(void **)(v2 + *a1);
  if (v4)
  {
    v5 = *(id *)(v2 + *a1);
  }
  else
  {
    v6 = (void *)a2();
    v7 = *(void **)(v2 + v3);
    *(_QWORD *)(v2 + v3) = v6;
    v5 = v6;

    v4 = 0;
  }
  v8 = v4;
  return v5;
}

id sub_213FD892C()
{
  return sub_213FD8940(&OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___headerView, (Class *)0x24BEBDB00);
}

id sub_213FD8940(uint64_t *a1, Class *a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;

  v3 = *a1;
  v4 = *(void **)(v2 + *a1);
  if (v4)
  {
    v5 = *(id *)(v2 + *a1);
  }
  else
  {
    v6 = objc_msgSend(objc_allocWithZone(*a2), sel_init);
    objc_msgSend(v6, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    v7 = *(void **)(v2 + v3);
    *(_QWORD *)(v2 + v3) = v6;
    v5 = v6;

    v4 = 0;
  }
  v8 = v4;
  return v5;
}

id sub_213FD89BC()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  void *v4;
  id v5;

  v1 = OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___imageView;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___imageView);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___imageView);
  }
  else
  {
    v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD668]), sel_init);
    objc_msgSend(v3, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    objc_msgSend(v3, sel_setContentMode_, 1);
    v4 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v3;

    v2 = 0;
  }
  v5 = v2;
  return v3;
}

void sub_213FD8A50()
{
  char *v0;
  char *v1;
  id v2;
  void *v3;
  id v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  id v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[3];
  uint64_t v23;
  uint64_t v24;

  v1 = v0;
  v2 = objc_msgSend(v0, sel_navigationController);
  if (!v2)
    return;
  v3 = v2;
  v4 = objc_msgSend(v2, sel_viewControllers);

  sub_213F3F7CC(0, (unint64_t *)&qword_254D5CD90);
  v5 = sub_213FF94DC();

  v22[0] = MEMORY[0x24BEE4AF8];
  if (!(v5 >> 62))
  {
    v6 = *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v6)
      goto LABEL_4;
LABEL_16:
    swift_bridgeObjectRelease();
    v10 = MEMORY[0x24BEE4AF8];
    if ((MEMORY[0x24BEE4AF8] & 0x8000000000000000) != 0)
      goto LABEL_27;
    goto LABEL_17;
  }
  swift_bridgeObjectRetain();
  v6 = sub_213FF9884();
  swift_bridgeObjectRelease();
  if (!v6)
    goto LABEL_16;
LABEL_4:
  if (v6 < 1)
  {
    __break(1u);
    return;
  }
  for (i = 0; i != v6; ++i)
  {
    if ((v5 & 0xC000000000000001) != 0)
      v8 = (id)MEMORY[0x2199C78A4](i, v5);
    else
      v8 = *(id *)(v5 + 8 * i + 32);
    v9 = v8;
    type metadata accessor for IdentityProofingViewController();
    if (swift_dynamicCastClass())
    {
      sub_213FF9824();
      sub_213FF9848();
      sub_213FF9854();
      sub_213FF9830();
    }
    else
    {

    }
  }
  swift_bridgeObjectRelease();
  v10 = v22[0];
  if ((v22[0] & 0x8000000000000000) != 0)
    goto LABEL_27;
LABEL_17:
  if ((v10 & 0x4000000000000000) == 0)
  {
    v11 = *(_QWORD *)(v10 + 16);
    goto LABEL_19;
  }
LABEL_27:
  swift_bridgeObjectRetain();
  v11 = sub_213FF9884();
  swift_release();
LABEL_19:
  swift_release();
  if (v11 > 1)
  {
    sub_213F5F2B8((uint64_t)&v1[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_configuration], (uint64_t)v22);
    v12 = v23;
    v13 = v24;
    __swift_project_boxed_opaque_existential_1(v22, v23);
    v14 = (*(unsigned __int8 (**)(uint64_t, uint64_t))(v13 + 120))(v12, v13);
    if (v14)
    {
      if (v14 == 1)
      {
        v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD410]), sel_initWithBarButtonSystemItem_target_action_, 1, v1, sel_cancelButtonClicked);
        v16 = OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_cancelButton;
        v17 = *(void **)&v1[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_cancelButton];
        *(_QWORD *)&v1[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_cancelButton] = v15;

        v18 = objc_msgSend(v1, sel_navigationItem);
        v19 = *(id *)&v1[v16];
        objc_msgSend(v18, sel_setLeftBarButtonItem_, v19);

        v20 = objc_msgSend(v1, sel_navigationItem);
        objc_msgSend(v20, sel_setHidesBackButton_, 1);
      }
      else
      {
        v20 = objc_msgSend(v1, sel_navigationItem);
        objc_msgSend(v20, sel_setHidesBackButton_, 0);
      }
    }
    else
    {
      v21 = objc_msgSend(v1, sel_navigationItem);
      objc_msgSend(v21, sel_setHidesBackButton_, 1);

      v20 = objc_msgSend(v1, sel_navigationItem);
      objc_msgSend(v20, sel_setLeftBarButtonItem_, 0);
    }

    __swift_destroy_boxed_opaque_existential_0((uint64_t)v22);
  }
}

void sub_213FD8DBC()
{
  char *v0;
  char *v1;
  _BYTE *v2;
  _BYTE *v3;
  _BYTE *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;

  v1 = v0;
  objc_msgSend(v0, sel_setOverrideUserInterfaceStyle_, 2);
  v2 = sub_213FD8640();
  v2[OBJC_IVAR____TtC9CoreIDVUI15CoreIDVUIButton_useWatchScheme] = 1;
  sub_213FA7EA4();

  v3 = sub_213FD870C();
  v3[OBJC_IVAR____TtC9CoreIDVUI15CoreIDVUIButton_useWatchScheme] = 1;
  sub_213FA7EA4();

  v4 = sub_213FD87DC();
  v4[OBJC_IVAR____TtC9CoreIDVUI15CoreIDVUIButton_useWatchScheme] = 1;
  sub_213FA7EA4();

  v5 = *(void **)&v1[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_cancelButton];
  if (v5)
  {
    v6 = (void *)objc_opt_self();
    v7 = v5;
    v8 = objc_msgSend(v6, sel_systemOrangeColor);
    objc_msgSend(v7, sel_setTintColor_, v8);

  }
  v9 = objc_msgSend(v1, sel_navigationController);
  if (v9)
  {
    v10 = v9;
    v11 = objc_msgSend(v9, sel_navigationBar);

    v12 = objc_msgSend((id)objc_opt_self(), sel_systemOrangeColor);
    objc_msgSend(v11, sel_setTintColor_, v12);

  }
}

void sub_213FD8F48()
{
  id v0;
  void *v1;
  uint64_t v2;
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  _BYTE *v11;
  id v12;
  id v13;
  id v14;
  _BYTE *v15;
  id v16;
  id v17;
  _BYTE *v18;
  id v19;
  id v20;
  id v21;
  id v22;

  v0 = sub_213FD83DC();
  v1 = (void *)objc_opt_self();
  v2 = *MEMORY[0x24BEBE070];
  v3 = objc_msgSend(v1, sel__preferredFontForTextStyle_maximumContentSizeCategory_, *MEMORY[0x24BEBE210], *MEMORY[0x24BEBE070]);
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, sel_pointSize);
    v5 = objc_msgSend(v1, sel_systemFontOfSize_weight_);

    objc_msgSend(v0, sel_setFont_, v5);
    v6 = sub_213FD83DC();
    objc_msgSend(v6, sel_setAdjustsFontForContentSizeCategory_, 1);

    v7 = sub_213FD8498();
    v8 = *MEMORY[0x24BEBE1D0];
    v9 = objc_msgSend(v1, sel__preferredFontForTextStyle_maximumContentSizeCategory_, *MEMORY[0x24BEBE1D0], v2);
    objc_msgSend(v7, sel_setFont_, v9);

    v10 = sub_213FD8498();
    objc_msgSend(v10, sel_setAdjustsFontForContentSizeCategory_, 1);

    v11 = sub_213FD87DC();
    v12 = objc_msgSend(v11, sel_titleLabel);

    if (v12)
    {
      v13 = objc_msgSend(v1, sel_preferredFontForTextStyle_, v8);
      objc_msgSend(v13, sel_pointSize);
      v14 = objc_msgSend(v1, sel_systemFontOfSize_weight_);

      objc_msgSend(v12, sel_setFont_, v14);
    }
    v15 = sub_213FD8640();
    v16 = objc_msgSend(v15, sel_titleLabel);

    if (v16)
    {
      v17 = objc_msgSend(v1, sel__preferredFontForTextStyle_maximumContentSizeCategory_, *MEMORY[0x24BEBE200], v2);
      objc_msgSend(v16, sel_setFont_, v17);

    }
    v18 = sub_213FD870C();
    v19 = objc_msgSend(v18, sel_titleLabel);

    if (v19)
    {
      v20 = objc_msgSend(v1, sel__preferredFontForTextStyle_maximumContentSizeCategory_, v8, v2);
      objc_msgSend(v19, sel_setFont_, v20);

    }
    v21 = sub_213FD88AC();
    v22 = objc_msgSend(v1, sel__preferredFontForTextStyle_maximumContentSizeCategory_, *MEMORY[0x24BEBE1E8], v2);
    objc_msgSend(v21, sel_setFont_, v22);

  }
  else
  {
    __break(1u);
  }
}

void sub_213FD9260()
{
  id v0;
  id v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t i;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t j;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t k;
  id v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t m;
  id v29;
  void *v30;
  id v31;

  v0 = sub_213FD82C0();
  v1 = objc_msgSend(v0, sel_subviews);

  sub_213F3F7CC(0, &qword_254D60760);
  v2 = sub_213FF94DC();

  if (v2 >> 62)
  {
    swift_bridgeObjectRetain();
    v3 = sub_213FF9884();
    if (!v3)
      goto LABEL_10;
  }
  else
  {
    v3 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (!v3)
      goto LABEL_10;
  }
  if (v3 < 1)
  {
    __break(1u);
    goto LABEL_39;
  }
  for (i = 0; i != v3; ++i)
  {
    if ((v2 & 0xC000000000000001) != 0)
      v5 = (id)MEMORY[0x2199C78A4](i, v2);
    else
      v5 = *(id *)(v2 + 8 * i + 32);
    v6 = v5;
    objc_msgSend(v5, sel_removeFromSuperview);

  }
LABEL_10:
  swift_bridgeObjectRelease_n();
  v7 = sub_213FD82C0();
  objc_msgSend(v7, sel_removeFromSuperview);

  v8 = sub_213FD8554();
  v9 = objc_msgSend(v8, sel_subviews);

  v10 = sub_213FF94DC();
  if (v10 >> 62)
  {
    swift_bridgeObjectRetain();
    v11 = sub_213FF9884();
    if (!v11)
      goto LABEL_19;
  }
  else
  {
    v11 = *(_QWORD *)((v10 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (!v11)
      goto LABEL_19;
  }
  if (v11 < 1)
  {
LABEL_39:
    __break(1u);
    goto LABEL_40;
  }
  for (j = 0; j != v11; ++j)
  {
    if ((v10 & 0xC000000000000001) != 0)
      v13 = (id)MEMORY[0x2199C78A4](j, v10);
    else
      v13 = *(id *)(v10 + 8 * j + 32);
    v14 = v13;
    objc_msgSend(v13, sel_removeFromSuperview);

  }
LABEL_19:
  swift_bridgeObjectRelease_n();
  v15 = sub_213FD8554();
  objc_msgSend(v15, sel_removeFromSuperview);

  v16 = sub_213FD8540();
  v17 = objc_msgSend(v16, sel_subviews);

  v18 = sub_213FF94DC();
  if (v18 >> 62)
  {
    swift_bridgeObjectRetain();
    v19 = sub_213FF9884();
    if (!v19)
      goto LABEL_28;
  }
  else
  {
    v19 = *(_QWORD *)((v18 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (!v19)
      goto LABEL_28;
  }
  if (v19 < 1)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  for (k = 0; k != v19; ++k)
  {
    if ((v18 & 0xC000000000000001) != 0)
      v21 = (id)MEMORY[0x2199C78A4](k, v18);
    else
      v21 = *(id *)(v18 + 8 * k + 32);
    v22 = v21;
    objc_msgSend(v21, sel_removeFromSuperview);

  }
LABEL_28:
  swift_bridgeObjectRelease_n();
  v23 = sub_213FD8540();
  objc_msgSend(v23, sel_removeFromSuperview);

  v24 = sub_213FD82E4();
  v25 = objc_msgSend(v24, sel_subviews);

  v26 = sub_213FF94DC();
  if (!(v26 >> 62))
  {
    v27 = *(_QWORD *)((v26 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v27)
      goto LABEL_30;
LABEL_37:
    swift_bridgeObjectRelease_n();
    v31 = sub_213FD82E4();
    objc_msgSend(v31, sel_removeFromSuperview);

    return;
  }
  swift_bridgeObjectRetain();
  v27 = sub_213FF9884();
  if (!v27)
    goto LABEL_37;
LABEL_30:
  if (v27 >= 1)
  {
    for (m = 0; m != v27; ++m)
    {
      if ((v26 & 0xC000000000000001) != 0)
        v29 = (id)MEMORY[0x2199C78A4](m, v26);
      else
        v29 = *(id *)(v26 + 8 * m + 32);
      v30 = v29;
      objc_msgSend(v29, sel_removeFromSuperview);

    }
    goto LABEL_37;
  }
LABEL_41:
  __break(1u);
}

void sub_213FD9668()
{
  void *v0;
  void *v1;
  id v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  _BYTE *v20;
  id v21;
  id v22;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  unint64_t v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  unint64_t v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  id v65;
  id v66;
  id v67;
  void *v68;
  id v69;
  id v70;
  id v71;
  __objc2_ivar_list *v72;
  id v73;
  double v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  _BYTE *v82;
  id v83;
  _BYTE *v84;
  _QWORD v85[3];
  uint64_t v86;
  uint64_t v87;

  v1 = v0;
  v2 = objc_msgSend(v0, sel_view);
  if (!v2)
  {
    __break(1u);
    goto LABEL_22;
  }
  v3 = v2;
  v4 = sub_213FD82C0();
  objc_msgSend(v3, sel_addSubview_, v4);

  v5 = sub_213FD892C();
  v6 = sub_213FD89BC();
  objc_msgSend(v5, sel_addSubview_, v6);

  v7 = sub_213FD8540();
  v8 = sub_213FD8554();
  objc_msgSend(v7, sel_addSubview_, v8);

  v9 = objc_msgSend(v1, sel_view);
  if (!v9)
  {
LABEL_22:
    __break(1u);
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  v10 = v9;
  v11 = sub_213FD8540();
  objc_msgSend(v10, sel_addSubview_, v11);

  sub_213FDB2C8();
  v12 = sub_213FD82E4();
  v13 = sub_213FD83DC();
  objc_msgSend(v12, sel_addArrangedSubview_, v13);

  v14 = sub_213FD82E4();
  v15 = sub_213FD8498();
  objc_msgSend(v14, sel_addArrangedSubview_, v15);

  v16 = (uint64_t)v1 + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_configuration;
  sub_213F5F2B8((uint64_t)v1 + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_configuration, (uint64_t)v85);
  v17 = v86;
  v18 = v87;
  __swift_project_boxed_opaque_existential_1(v85, v86);
  LOBYTE(v15) = (*(uint64_t (**)(uint64_t, uint64_t))(v18 + 144))(v17, v18);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v85);
  if ((v15 & 1) != 0)
  {
    v19 = sub_213FD82E4();
    v20 = sub_213FD87DC();
    objc_msgSend(v19, sel_addArrangedSubview_, v20);

  }
  v21 = sub_213FD8554();
  v22 = sub_213FD82E4();
  objc_msgSend(v21, sel_addArrangedSubview_, v22);

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254D5E6B0);
  v23 = swift_allocObject();
  *(_OWORD *)(v23 + 16) = xmmword_213FFE6E0;
  v24 = sub_213FD82C0();
  v25 = objc_msgSend(v24, sel_widthAnchor);

  v26 = objc_msgSend(v1, sel_view);
  if (!v26)
    goto LABEL_23;
  v27 = v26;
  v28 = objc_msgSend(v26, sel_widthAnchor);

  if (qword_254D5BAA8 != -1)
    swift_once();
  v29 = objc_msgSend(v25, sel_constraintEqualToAnchor_constant_, v28, -*(double *)&qword_254D606A8);

  *(_QWORD *)(v23 + 32) = v29;
  v30 = sub_213FD82C0();
  v31 = objc_msgSend(v30, sel_centerXAnchor);

  v32 = objc_msgSend(v1, sel_view);
  if (!v32)
    goto LABEL_24;
  v33 = v32;
  v34 = objc_msgSend(v32, sel_centerXAnchor);

  v35 = objc_msgSend(v31, sel_constraintEqualToAnchor_, v34);
  *(_QWORD *)(v23 + 40) = v35;
  v36 = sub_213FD8540();
  v37 = objc_msgSend(v36, sel_leadingAnchor);

  v38 = objc_msgSend(v1, sel_view);
  if (!v38)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  v39 = v38;
  v40 = objc_msgSend(v38, sel_leadingAnchor);

  v41 = objc_msgSend(v37, sel_constraintEqualToAnchor_, v40);
  *(_QWORD *)(v23 + 48) = v41;
  v42 = sub_213FD8540();
  v43 = objc_msgSend(v42, sel_trailingAnchor);

  v44 = objc_msgSend(v1, sel_view);
  if (!v44)
  {
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  v45 = v44;
  v46 = (void *)objc_opt_self();
  v47 = objc_msgSend(v45, sel_trailingAnchor);

  v48 = objc_msgSend(v43, sel_constraintEqualToAnchor_, v47);
  *(_QWORD *)(v23 + 56) = v48;
  v49 = sub_213FD8540();
  v50 = objc_msgSend(v49, sel_bottomAnchor);

  v51 = sub_213FD82C0();
  v52 = objc_msgSend(v51, sel_topAnchor);

  v53 = objc_msgSend(v50, sel_constraintEqualToAnchor_, v52);
  *(_QWORD *)(v23 + 64) = v53;
  v85[0] = v23;
  sub_213FF94E8();
  v54 = v85[0];
  v55 = sub_213FDAC34();
  v85[0] = v54;
  sub_213F55F10(v55);
  v56 = v85[0];
  v57 = sub_213FDB0B0();
  v85[0] = v56;
  sub_213F55F10(v57);
  v58 = v85[0];
  sub_213FDA530();
  v85[0] = v58;
  sub_213F55F10(v59);
  v60 = v85[0];
  v61 = sub_213FDAF60();
  v85[0] = v60;
  sub_213F55F10(v61);
  sub_213F3F7CC(0, (unint64_t *)&qword_254D5D740);
  v62 = (void *)sub_213FF94D0();
  swift_bridgeObjectRelease();
  objc_msgSend(v46, sel_activateConstraints_, v62);

  sub_213F5F2B8(v16, (uint64_t)v85);
  v63 = v86;
  v64 = v87;
  __swift_project_boxed_opaque_existential_1(v85, v86);
  LOBYTE(v64) = (*(uint64_t (**)(uint64_t, uint64_t))(v64 + 40))(v63, v64);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v85);
  v65 = sub_213FD82C0();
  v66 = objc_msgSend(v65, sel_bottomAnchor);

  v67 = objc_msgSend(v1, sel_view);
  v68 = v67;
  if ((v64 & 1) != 0)
  {
    if (v67)
    {
      v69 = objc_msgSend(v67, sel_safeAreaLayoutGuide);

      v70 = objc_msgSend(v69, sel_bottomAnchor);
      v71 = objc_msgSend(v66, sel_constraintEqualToAnchor_, v70);
      v72 = &OBJC_INSTANCE_VARIABLES__TtC9CoreIDVUI41BiometricBindingReplacementViewController;
LABEL_20:
      v75 = v71;

      objc_msgSend(v75, sel_setActive_, 1);
      v76 = sub_213FD82C0();
      sub_213FD9EF0(v76);

      v77 = sub_213FD82C0();
      v78 = sub_213FD88AC();
      objc_msgSend(v77, *(SEL *)&v72[228], v78);

      v79 = sub_213FD82C0();
      v80 = sub_213FD88C0();
      objc_msgSend(v79, *(SEL *)&v72[228], v80);

      v81 = sub_213FD82C0();
      v82 = sub_213FD8640();
      objc_msgSend(v81, *(SEL *)&v72[228], v82);

      v83 = sub_213FD82C0();
      v84 = sub_213FD870C();
      objc_msgSend(v83, *(SEL *)&v72[228], v84);

      return;
    }
    goto LABEL_27;
  }
  if (v67)
  {
    v73 = objc_msgSend(v67, sel_safeAreaLayoutGuide);

    v70 = objc_msgSend(v73, sel_bottomAnchor);
    if (qword_254D5BA78 != -1)
      swift_once();
    v74 = *(double *)&qword_254D60678;
    v72 = &OBJC_INSTANCE_VARIABLES__TtC9CoreIDVUI41BiometricBindingReplacementViewController;
    if (qword_254D5BA88 != -1)
      swift_once();
    v71 = objc_msgSend(v66, sel_constraintEqualToAnchor_constant_, v70, -(v74 + *(double *)&qword_254D60688));
    goto LABEL_20;
  }
LABEL_28:
  __break(1u);
}

void sub_213FD9EF0(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v16[3];
  uint64_t v17;
  uint64_t v18;

  v2 = v1;
  v4 = (uint64_t)v1 + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_configuration;
  sub_213F5F2B8((uint64_t)v1 + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_configuration, (uint64_t)v16);
  v5 = v17;
  v6 = v18;
  __swift_project_boxed_opaque_existential_1(v16, v17);
  v7 = (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 72))(v5, v6);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v16);
  if ((v7 & 1) != 0)
  {
    sub_213F5F2B8(v4, (uint64_t)v16);
    v8 = v17;
    v9 = v18;
    __swift_project_boxed_opaque_existential_1(v16, v17);
    (*(void (**)(uint64_t, uint64_t))(v9 + 128))(v8, v9);
    if (v10)
    {
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v16);
      v11 = (void *)objc_opt_self();
      v12 = (void *)sub_213FF9428();
      swift_bridgeObjectRelease();
      v13 = objc_msgSend(v11, sel_linkWithBundleIdentifier_, v12);

      if (v13)
      {
        objc_msgSend(v2, sel_addChildViewController_, v13);
        v14 = objc_msgSend(v13, sel_view);
        if (v14)
        {
          v15 = v14;
          objc_msgSend(a1, sel_addArrangedSubview_, v14);

          objc_msgSend(v13, sel_didMoveToParentViewController_, v2);
        }
        else
        {
          __break(1u);
        }
      }
    }
    else
    {
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v16);
    }
  }
}

void sub_213FDA07C()
{
  void *v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _BYTE *v17;
  id v18;
  _BYTE *v19;
  id v20;
  id v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  id v47;

  v1 = v0;
  v2 = sub_213FD892C();
  v3 = sub_213FD89BC();
  objc_msgSend(v2, sel_addSubview_, v3);

  v4 = sub_213FD8540();
  v5 = sub_213FD8554();
  objc_msgSend(v4, sel_addSubview_, v5);

  v6 = objc_msgSend(v1, sel_view);
  if (!v6)
  {
    __break(1u);
    goto LABEL_7;
  }
  v7 = v6;
  v8 = sub_213FD8540();
  objc_msgSend(v7, sel_addSubview_, v8);

  sub_213FDB2C8();
  v9 = sub_213FD82E4();
  v10 = sub_213FD83DC();
  objc_msgSend(v9, sel_addArrangedSubview_, v10);

  v11 = sub_213FD82E4();
  v12 = sub_213FD8498();
  objc_msgSend(v11, sel_addArrangedSubview_, v12);

  v13 = sub_213FD82E4();
  sub_213FD9EF0(v13);

  v14 = sub_213FD82E4();
  v15 = sub_213FD88AC();
  objc_msgSend(v14, sel_addArrangedSubview_, v15);

  v16 = sub_213FD82E4();
  v17 = sub_213FD8640();
  objc_msgSend(v16, sel_addArrangedSubview_, v17);

  v18 = sub_213FD82E4();
  v19 = sub_213FD870C();
  objc_msgSend(v18, sel_addArrangedSubview_, v19);

  v20 = sub_213FD8554();
  v21 = sub_213FD82E4();
  objc_msgSend(v20, sel_addArrangedSubview_, v21);

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254D5E6B0);
  v22 = swift_allocObject();
  *(_OWORD *)(v22 + 16) = xmmword_213FFD8C0;
  v23 = sub_213FD8540();
  v24 = objc_msgSend(v23, sel_leadingAnchor);

  v25 = objc_msgSend(v1, sel_view);
  if (!v25)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  v26 = v25;
  v27 = objc_msgSend(v25, sel_leadingAnchor);

  v28 = objc_msgSend(v24, sel_constraintEqualToAnchor_, v27);
  *(_QWORD *)(v22 + 32) = v28;
  v29 = sub_213FD8540();
  v30 = objc_msgSend(v29, sel_trailingAnchor);

  v31 = objc_msgSend(v1, sel_view);
  if (!v31)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  v32 = v31;
  v33 = objc_msgSend(v31, sel_trailingAnchor);

  v34 = objc_msgSend(v30, sel_constraintEqualToAnchor_, v33);
  *(_QWORD *)(v22 + 40) = v34;
  v35 = sub_213FD8540();
  v36 = objc_msgSend(v35, sel_bottomAnchor);

  v37 = objc_msgSend(v1, sel_view);
  if (v37)
  {
    v38 = v37;
    v39 = (void *)objc_opt_self();
    v40 = objc_msgSend(v38, sel_safeAreaLayoutGuide);

    v41 = objc_msgSend(v40, sel_bottomAnchor);
    v42 = objc_msgSend(v36, sel_constraintEqualToAnchor_, v41);

    *(_QWORD *)(v22 + 48) = v42;
    sub_213FF94E8();
    sub_213FDA530();
    sub_213F55F10(v43);
    v44 = sub_213FDAC34();
    sub_213F55F10(v44);
    v45 = sub_213FDB0B0();
    sub_213F55F10(v45);
    v46 = sub_213FDAF60();
    sub_213F55F10(v46);
    sub_213F3F7CC(0, (unint64_t *)&qword_254D5D740);
    v47 = (id)sub_213FF94D0();
    swift_bridgeObjectRelease();
    objc_msgSend(v39, sel_activateConstraints_, v47);

    return;
  }
LABEL_9:
  __break(1u);
}

void sub_213FDA530()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  _QWORD v4[3];
  uint64_t v5;
  uint64_t v6;

  sub_213F5F2B8(v0 + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_configuration, (uint64_t)v4);
  v1 = v5;
  v2 = v6;
  __swift_project_boxed_opaque_existential_1(v4, v5);
  v3 = (char *)&loc_213FDA5A4 + dword_213FDAC24[(*(unsigned __int8 (**)(uint64_t, uint64_t))(v2 + 80))(v1, v2)];
  __asm { BR              X10 }
}

uint64_t sub_213FDA5B4()
{
  uint64_t v0;
  id v1;
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v17;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254D5E6B0);
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_213FFD8C0;
  v1 = sub_213FD89BC();
  v2 = objc_msgSend(v1, sel_widthAnchor);

  v3 = sub_213FD892C();
  v4 = objc_msgSend(v3, sel_widthAnchor);

  v5 = objc_msgSend(v2, sel_constraintEqualToAnchor_, v4);
  *(_QWORD *)(v0 + 32) = v5;
  v6 = sub_213FD89BC();
  v7 = objc_msgSend(v6, sel_heightAnchor);

  v8 = sub_213FD892C();
  v9 = objc_msgSend(v8, sel_heightAnchor);

  v10 = objc_msgSend(v7, sel_constraintEqualToAnchor_, v9);
  *(_QWORD *)(v0 + 40) = v10;
  v11 = sub_213FD89BC();
  v12 = objc_msgSend(v11, sel_topAnchor);

  v13 = sub_213FD892C();
  v14 = objc_msgSend(v13, sel_topAnchor);

  v15 = objc_msgSend(v12, sel_constraintEqualToAnchor_, v14);
  *(_QWORD *)(v0 + 48) = v15;
  sub_213FF94E8();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)&v17);
  return v0;
}

uint64_t sub_213FDAC34()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  _QWORD v31[3];
  uint64_t v32;
  uint64_t v33;

  sub_213F5F2B8(v0 + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_configuration, (uint64_t)v31);
  v1 = v32;
  v2 = v33;
  __swift_project_boxed_opaque_existential_1(v31, v32);
  LOBYTE(v2) = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 112))(v1, v2);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v31);
  v3 = sub_213FD8554();
  v4 = objc_msgSend(v3, sel_topAnchor);

  v5 = sub_213FD8540();
  v6 = objc_msgSend(v5, sel_topAnchor);

  if ((v2 & 1) != 0)
    v7 = objc_msgSend(v4, sel_constraintEqualToAnchor_constant_, v6, 20.0);
  else
    v7 = objc_msgSend(v4, sel_constraintEqualToAnchor_, v6);
  v8 = v7;

  objc_msgSend(v8, sel_setActive_, 1);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254D5E6B0);
  v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_213FFD740;
  v10 = sub_213FD8554();
  v11 = objc_msgSend(v10, sel_bottomAnchor);

  v12 = sub_213FD8540();
  v13 = objc_msgSend(v12, sel_bottomAnchor);

  v14 = objc_msgSend(v11, sel_constraintEqualToAnchor_, v13);
  *(_QWORD *)(v9 + 32) = v14;
  v15 = sub_213FD8554();
  v16 = objc_msgSend(v15, sel_leadingAnchor);

  v17 = sub_213FD8540();
  v18 = objc_msgSend(v17, sel_leadingAnchor);

  v19 = objc_msgSend(v16, sel_constraintEqualToAnchor_, v18);
  *(_QWORD *)(v9 + 40) = v19;
  v20 = sub_213FD8554();
  v21 = objc_msgSend(v20, sel_trailingAnchor);

  v22 = sub_213FD8540();
  v23 = objc_msgSend(v22, sel_trailingAnchor);

  v24 = objc_msgSend(v21, sel_constraintEqualToAnchor_, v23);
  *(_QWORD *)(v9 + 48) = v24;
  v25 = sub_213FD8554();
  v26 = objc_msgSend(v25, sel_widthAnchor);

  v27 = sub_213FD8540();
  v28 = objc_msgSend(v27, sel_widthAnchor);

  v29 = objc_msgSend(v26, sel_constraintEqualToAnchor_, v28);
  *(_QWORD *)(v9 + 56) = v29;
  v31[0] = v9;
  sub_213FF94E8();
  return v31[0];
}

uint64_t sub_213FDAF60()
{
  uint64_t v0;
  _BYTE *v1;
  id v2;
  id v3;
  _BYTE *v4;
  id v5;
  id v6;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254D5E6B0);
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_213FFC220;
  v1 = sub_213FD870C();
  v2 = objc_msgSend(v1, sel_heightAnchor);

  if (qword_254D5BA78 != -1)
    swift_once();
  v3 = objc_msgSend(v2, sel_constraintEqualToConstant_, *(double *)&qword_254D60678);

  *(_QWORD *)(v0 + 32) = v3;
  v4 = sub_213FD8640();
  v5 = objc_msgSend(v4, sel_heightAnchor);

  if (qword_254D5BA80 != -1)
    swift_once();
  v6 = objc_msgSend(v5, sel_constraintEqualToConstant_, *(double *)&qword_254D60680);

  *(_QWORD *)(v0 + 40) = v6;
  sub_213FF94E8();
  return v0;
}

uint64_t sub_213FDB0B0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  uint64_t *v4;
  double v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v18[3];
  uint64_t v19;
  uint64_t v20;

  sub_213F5F2B8(v0 + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_configuration, (uint64_t)v18);
  v1 = v19;
  v2 = v20;
  __swift_project_boxed_opaque_existential_1(v18, v19);
  v3 = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 160))(v1, v2);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v18);
  if ((v3 & 1) != 0)
  {
    if (qword_254D5BAA0 != -1)
      swift_once();
    v4 = &qword_254D606A0;
  }
  else
  {
    if (qword_254D5BA98 != -1)
      swift_once();
    v4 = &qword_254D60698;
  }
  v5 = *(double *)v4;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254D5E6B0);
  v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_213FFC220;
  v7 = sub_213FD82E4();
  v8 = objc_msgSend(v7, sel_widthAnchor);

  v9 = sub_213FD8554();
  v10 = objc_msgSend(v9, sel_widthAnchor);

  v11 = objc_msgSend(v8, sel_constraintEqualToAnchor_constant_, v10, -v5);
  *(_QWORD *)(v6 + 32) = v11;
  v12 = sub_213FD82E4();
  v13 = objc_msgSend(v12, sel_centerXAnchor);

  v14 = sub_213FD8554();
  v15 = objc_msgSend(v14, sel_centerXAnchor);

  v16 = objc_msgSend(v13, sel_constraintEqualToAnchor_, v15);
  *(_QWORD *)(v6 + 40) = v16;
  v18[0] = v6;
  sub_213FF94E8();
  return v18[0];
}

void sub_213FDB2C8()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  id v26;
  double v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  id v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  double v38;
  CGFloat v39;
  double v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  id v44;
  id v45;
  void *v46;
  id v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  char v51;
  uint64_t v52;
  id v53;
  id v54;
  id v55;
  void *v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  void *v62;
  void *v63;
  id v64;
  id v65;
  id v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  double v70;
  char v71;
  char v72;
  id v73;
  id v74;
  id v75;
  void *v76;
  id v77;
  id v78;
  id v79;
  double v80;
  CGFloat v81;
  double v82;
  CGFloat v83;
  double v84;
  CGFloat v85;
  double v86;
  CGFloat v87;
  double Height;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  void *v92;
  double v93;
  double v94;
  id v95;
  uint64_t v96;
  uint64_t v97;
  char v98;
  id v99;
  id v100;
  id v101;
  void *v102;
  id v103;
  id v104;
  id v105;
  id v106;
  id v107;
  _QWORD v108[3];
  uint64_t v109;
  uint64_t v110;
  _QWORD v111[3];
  uint64_t v112;
  uint64_t v113;
  CGRect v114;
  CGRect v115;

  v1 = v0;
  v2 = (uint64_t)v0 + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_configuration;
  sub_213F5F2B8((uint64_t)v0 + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_configuration, (uint64_t)v111);
  v3 = v112;
  v4 = v113;
  __swift_project_boxed_opaque_existential_1(v111, v112);
  v5 = (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 112))(v3, v4);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v111);
  if ((v5 & 1) != 0)
  {
    v6 = objc_msgSend(v1, sel_view);
    if (v6)
    {
      v7 = v6;
      v8 = sub_213FD892C();
      objc_msgSend(v7, sel_addSubview_, v8);

      v9 = sub_213FD8540();
      v10 = objc_msgSend(v9, sel_topAnchor);

      v11 = sub_213FD892C();
      v12 = objc_msgSend(v11, sel_bottomAnchor);

      v13 = objc_msgSend(v10, sel_constraintEqualToAnchor_, v12);
      objc_msgSend(v13, sel_setActive_, 1);
      goto LABEL_9;
    }
    __break(1u);
LABEL_35:
    __break(1u);
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }
  v14 = sub_213FD8554();
  v15 = sub_213FD892C();
  objc_msgSend(v14, sel_addArrangedSubview_, v15);

  v16 = sub_213FD8540();
  v17 = objc_msgSend(v16, sel_topAnchor);

  v18 = objc_msgSend(v1, sel_view);
  if (!v18)
    goto LABEL_35;
  v19 = v18;
  v20 = objc_msgSend(v18, sel_safeAreaLayoutGuide);

  v21 = objc_msgSend(v20, sel_topAnchor);
  v22 = objc_msgSend(v17, sel_constraintEqualToAnchor_, v21);

  objc_msgSend(v22, sel_setActive_, 1);
  sub_213F5F2B8(v2, (uint64_t)v111);
  v23 = v112;
  v24 = v113;
  __swift_project_boxed_opaque_existential_1(v111, v112);
  v25 = (*(unsigned __int8 (**)(uint64_t, uint64_t))(v24 + 80))(v23, v24);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v111);
  if (v25 != 2)
    goto LABEL_10;
  v26 = sub_213FD8554();
  if (qword_254D5BAC0 != -1)
    swift_once();
  v27 = *(double *)&qword_254D606C0;
  v13 = sub_213FD892C();
  objc_msgSend(v26, sel_setCustomSpacing_afterView_, v13, v27);

LABEL_9:
LABEL_10:
  sub_213F5F2B8(v2, (uint64_t)v111);
  v28 = v112;
  v29 = v113;
  __swift_project_boxed_opaque_existential_1(v111, v112);
  v30 = (*(unsigned __int8 (**)(uint64_t, uint64_t))(v29 + 80))(v28, v29);
  if ((v30 - 2) >= 2)
  {
    if (v30)
    {
      v79 = objc_msgSend((id)objc_opt_self(), sel_mainScreen);
      objc_msgSend(v79, sel_bounds);
      v81 = v80;
      v83 = v82;
      v85 = v84;
      v87 = v86;

      v115.origin.x = v81;
      v115.origin.y = v83;
      v115.size.width = v85;
      v115.size.height = v87;
      Height = CGRectGetHeight(v115);
      sub_213F5F2B8(v2, (uint64_t)v108);
      v89 = v109;
      v90 = v110;
      __swift_project_boxed_opaque_existential_1(v108, v109);
      v91 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v90 + 88))(v89, v90);
      if (v91)
      {
        v92 = v91;
        objc_msgSend(v91, sel_size);
        v94 = v93;

      }
      else
      {
        v94 = 0.0;
      }
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v108);
      sub_213F5F2B8(v2, (uint64_t)v108);
      v96 = v109;
      v97 = v110;
      __swift_project_boxed_opaque_existential_1(v108, v109);
      v98 = (*(uint64_t (**)(uint64_t, uint64_t))(v97 + 112))(v96, v97);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v108);
      if ((v98 & 1) != 0)
      {
        v99 = sub_213FD892C();
        v100 = objc_msgSend(v99, sel_topAnchor);

        v101 = objc_msgSend(v1, sel_view);
        if (!v101)
        {
LABEL_41:
          __break(1u);
          return;
        }
        v102 = v101;
        v103 = objc_msgSend(v101, sel_topAnchor);

        v104 = objc_msgSend(v100, sel_constraintEqualToAnchor_constant_, v103, Height * 0.09);
        objc_msgSend(v104, sel_setActive_, 1);

      }
      v105 = sub_213FD892C();
      v106 = objc_msgSend(v105, sel_heightAnchor);

      v107 = objc_msgSend(v106, sel_constraintEqualToConstant_, v94);
      objc_msgSend(v107, sel_setActive_, 1);

    }
    else
    {
      sub_213F5F2B8(v2, (uint64_t)v108);
      v49 = v109;
      v50 = v110;
      __swift_project_boxed_opaque_existential_1(v108, v109);
      v51 = (*(uint64_t (**)(uint64_t, uint64_t))(v50 + 112))(v49, v50);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v108);
      if ((v51 & 1) != 0)
      {
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254D5E6B0);
        v52 = swift_allocObject();
        *(_OWORD *)(v52 + 16) = xmmword_213FFC220;
        v53 = sub_213FD892C();
        v54 = objc_msgSend(v53, sel_widthAnchor);

        v55 = objc_msgSend(v1, sel_view);
        if (!v55)
        {
LABEL_37:
          __break(1u);
          goto LABEL_38;
        }
        v56 = v55;
        v57 = objc_msgSend(v55, sel_widthAnchor);

        v58 = objc_msgSend(v54, sel_constraintEqualToAnchor_, v57);
        *(_QWORD *)(v52 + 32) = v58;
        v59 = sub_213FD892C();
        v60 = objc_msgSend(v59, sel_topAnchor);

        v61 = objc_msgSend(v1, sel_view);
        if (!v61)
        {
LABEL_38:
          __break(1u);
          goto LABEL_39;
        }
        v62 = v61;
        v63 = (void *)objc_opt_self();
        v64 = objc_msgSend(v62, sel_safeAreaLayoutGuide);

        v65 = objc_msgSend(v64, sel_topAnchor);
        v66 = objc_msgSend(v60, sel_constraintEqualToAnchor_, v65);

        *(_QWORD *)(v52 + 40) = v66;
        v108[0] = v52;
        sub_213FF94E8();
        sub_213F3F7CC(0, (unint64_t *)&qword_254D5D740);
        v67 = (void *)sub_213FF94D0();
        swift_bridgeObjectRelease();
        objc_msgSend(v63, sel_activateConstraints_, v67);

      }
      sub_213F5F2B8(v2, (uint64_t)v108);
      v68 = v109;
      v69 = v110;
      __swift_project_boxed_opaque_existential_1(v108, v109);
      v70 = COERCE_DOUBLE((*(uint64_t (**)(uint64_t, uint64_t))(v69 + 104))(v68, v69));
      v72 = v71;
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v108);
      v73 = sub_213FD892C();
      v74 = objc_msgSend(v73, sel_heightAnchor);

      v75 = objc_msgSend(v1, sel_view);
      v76 = v75;
      if ((v72 & 1) != 0)
      {
        if (!v75)
        {
LABEL_40:
          __break(1u);
          goto LABEL_41;
        }
        v77 = objc_msgSend(v75, sel_heightAnchor);

        v78 = objc_msgSend(v74, sel_constraintEqualToAnchor_multiplier_, v77, 0.45);
      }
      else
      {
        if (!v75)
        {
LABEL_39:
          __break(1u);
          goto LABEL_40;
        }
        v77 = objc_msgSend(v75, sel_heightAnchor);

        v78 = objc_msgSend(v74, sel_constraintEqualToAnchor_multiplier_, v77, v70);
      }
      v95 = v78;

      objc_msgSend(v95, sel_setActive_, 1);
    }
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v111);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v111);
    v31 = objc_msgSend((id)objc_opt_self(), sel_mainScreen);
    objc_msgSend(v31, sel_bounds);
    v33 = v32;
    v35 = v34;
    v37 = v36;
    v39 = v38;

    v114.origin.x = v33;
    v114.origin.y = v35;
    v114.size.width = v37;
    v114.size.height = v39;
    v40 = CGRectGetHeight(v114);
    sub_213F5F2B8(v2, (uint64_t)v111);
    v41 = v112;
    v42 = v113;
    __swift_project_boxed_opaque_existential_1(v111, v112);
    LOBYTE(v31) = (*(uint64_t (**)(uint64_t, uint64_t))(v42 + 112))(v41, v42);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v111);
    if ((v31 & 1) != 0)
    {
      v43 = sub_213FD892C();
      v44 = objc_msgSend(v43, sel_topAnchor);

      v45 = objc_msgSend(v1, sel_view);
      if (v45)
      {
        v46 = v45;
        v47 = objc_msgSend(v45, sel_topAnchor);

        v48 = objc_msgSend(v44, sel_constraintEqualToAnchor_constant_, v47, v40 * 0.09);
        objc_msgSend(v48, sel_setActive_, 1);

        return;
      }
      goto LABEL_36;
    }
  }
}

void sub_213FDBCCC(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  id v9;
  unint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  id v20;
  id v21;
  unint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  char v27;
  uint64_t v28;
  double v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  _QWORD v39[3];
  uint64_t v40;
  uint64_t v41;

  v2 = v1;
  v4 = sub_213FF8D38();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v39[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_213FD8554();
  v9 = objc_msgSend(v8, sel_arrangedSubviews);

  sub_213F3F7CC(0, &qword_254D60760);
  v10 = sub_213FF94DC();

  LOBYTE(v9) = sub_213FDC138((uint64_t)a1, v10);
  swift_bridgeObjectRelease();
  if ((v9 & 1) == 0)
  {
    v14 = objc_msgSend(v2, sel_traitCollection);
    v15 = objc_msgSend(v14, sel_preferredContentSizeCategory);

    LOBYTE(v14) = sub_213FF9698();
    if ((v14 & 1) != 0)
    {
      v16 = sub_213FD8554();
      objc_msgSend(v16, sel_addArrangedSubview_, a1);

      sub_213F5F2B8((uint64_t)v2 + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_configuration, (uint64_t)v39);
      v17 = v40;
      v18 = v41;
      __swift_project_boxed_opaque_existential_1(v39, v40);
      LOBYTE(v16) = (*(uint64_t (**)(uint64_t, uint64_t))(v18 + 160))(v17, v18);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v39);
      if ((v16 & 1) != 0)
      {
        if (qword_254D5BAA0 != -1)
          swift_once();
        v19 = &qword_254D606A0;
LABEL_17:
        v29 = *(double *)v19;
        v30 = objc_msgSend(a1, sel_widthAnchor);
        v31 = sub_213FD8554();
        v32 = objc_msgSend(v31, sel_widthAnchor);

        v33 = objc_msgSend(v30, sel_constraintEqualToAnchor_constant_, v32, -v29);
        objc_msgSend(v33, sel_setActive_, 1);

        return;
      }
LABEL_14:
      if (qword_254D5BA98 != -1)
        swift_once();
      v19 = &qword_254D60698;
      goto LABEL_17;
    }
    v20 = sub_213FD82E4();
    v21 = objc_msgSend(v20, sel_arrangedSubviews);

    v22 = sub_213FF94DC();
    v23 = sub_213FD8498();
    sub_213FDD468((uint64_t)v23, v22);
    v25 = v24;
    v27 = v26;
    swift_bridgeObjectRelease();

    if ((v27 & 1) != 0)
    {
      v28 = 0;
    }
    else
    {
      v28 = v25 + 1;
      if (__OFADD__(v25, 1))
      {
        __break(1u);
        goto LABEL_14;
      }
    }
    v34 = sub_213FD82E4();
    objc_msgSend(v34, sel_insertArrangedSubview_atIndex_, a1, v28);

    v35 = objc_msgSend(a1, sel_widthAnchor);
    v36 = sub_213FD82E4();
    v37 = objc_msgSend(v36, sel_widthAnchor);

    v38 = objc_msgSend(v35, sel_constraintEqualToAnchor_, v37);
    objc_msgSend(v38, sel_setActive_, 1);

    return;
  }
  sub_213FF7778();
  v11 = sub_213FF8D2C();
  v12 = sub_213FF95C0();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_213F36000, v11, v12, "view is already configured in proofing view; aborting", v13, 2u);
    MEMORY[0x2199C815C](v13, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_213FDC138(uint64_t a1, unint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  id v5;
  void *v6;
  char v7;
  uint64_t v9;
  uint64_t v10;
  char v11;
  unint64_t v12;
  id v13;
  char v14;

  if (a2 >> 62)
    goto LABEL_20;
  v3 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v3; v3 = sub_213FF9884())
  {
    v4 = a2 & 0xC000000000000001;
    if ((a2 & 0xC000000000000001) == 0)
    {
      v5 = *(id *)(a2 + 32);
      goto LABEL_5;
    }
    while (1)
    {
      v5 = (id)MEMORY[0x2199C78A4](0, a2);
LABEL_5:
      v6 = v5;
      sub_213F3F7CC(0, &qword_254D60760);
      v7 = sub_213FF96F8();

      if ((v7 & 1) != 0)
      {
LABEL_6:
        swift_bridgeObjectRelease();
        return 1;
      }
      if (v3 == 1)
        goto LABEL_18;
      if (v4)
        break;
      v4 = 5;
      while (1)
      {
        v12 = v4 - 3;
        if (__OFADD__(v4 - 4, 1))
          break;
        v13 = *(id *)(a2 + 8 * v4);
        v14 = sub_213FF96F8();

        if ((v14 & 1) != 0)
          goto LABEL_6;
        ++v4;
        if (v12 == v3)
          goto LABEL_18;
      }
      __break(1u);
    }
    v9 = 1;
    while (1)
    {
      MEMORY[0x2199C78A4](v9, a2);
      v10 = v9 + 1;
      if (__OFADD__(v9, 1))
        break;
      v11 = sub_213FF96F8();
      swift_unknownObjectRelease();
      if ((v11 & 1) != 0)
        goto LABEL_6;
      ++v9;
      if (v10 == v3)
        goto LABEL_18;
    }
    __break(1u);
LABEL_20:
    swift_bridgeObjectRetain();
  }
LABEL_18:
  swift_bridgeObjectRelease();
  return 0;
}

BOOL sub_213FDC2BC(_BOOL8 result, uint64_t a2)
{
  uint64_t v2;
  int v3;
  uint64_t i;
  uint64_t v5;
  int v6;

  v2 = *(_QWORD *)(a2 + 16);
  if (!v2)
    return 0;
  v3 = result;
  if (*(_BYTE *)(a2 + 32) == result)
    return 1;
  if (v2 == 1)
    return 0;
  for (i = 33; ; ++i)
  {
    v5 = i - 31;
    if (__OFADD__(i - 32, 1))
      break;
    v6 = *(unsigned __int8 *)(a2 + i);
    result = v6 == v3;
    if (v6 == v3 || v5 == v2)
      return result;
  }
  __break(1u);
  return result;
}

void sub_213FDC31C()
{
  qword_254D60678 = 0x4049000000000000;
}

void sub_213FDC32C()
{
  qword_254D60680 = 0x4049000000000000;
}

void sub_213FDC33C()
{
  qword_254D60688 = 0x4014000000000000;
}

void sub_213FDC34C()
{
  qword_254D60690 = 0x402E000000000000;
}

void sub_213FDC35C()
{
  qword_254D60698 = 0x4048000000000000;
}

void sub_213FDC36C()
{
  qword_254D606A0 = 0x4040000000000000;
}

void sub_213FDC37C()
{
  qword_254D606A8 = 0x4048000000000000;
}

void sub_213FDC38C()
{
  qword_254D606B0 = 0x402E000000000000;
}

void sub_213FDC39C()
{
  qword_254D606B8 = 0x3FE1C71C71C71C72;
}

void sub_213FDC3B8()
{
  qword_254D606C0 = 0x4038000000000000;
}

id sub_213FDC42C()
{
  id v0;
  id v1;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD708]), sel_init);
  objc_msgSend(v0, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  v1 = objc_msgSend((id)objc_opt_self(), sel_grayColor);
  objc_msgSend(v0, sel_setTextColor_, v1);

  objc_msgSend(v0, sel_setTextAlignment_, 1);
  objc_msgSend(v0, sel_setLineBreakMode_, 0);
  objc_msgSend(v0, sel_setNumberOfLines_, 0);

  return v0;
}

id sub_213FDC4F4()
{
  id v0;
  id v1;
  id v2;
  id v3;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDB00]), sel_init);
  objc_msgSend(v0, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  v1 = objc_msgSend((id)objc_opt_self(), sel_clearColor);
  objc_msgSend(v0, sel_setBackgroundColor_, v1);

  v2 = objc_msgSend(v0, sel_heightAnchor);
  v3 = objc_msgSend(v2, sel_constraintEqualToConstant_, 10.0);

  objc_msgSend(v3, sel_setActive_, 1);
  return v0;
}

void sub_213FDC698()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  objc_class *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _BYTE *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  _BYTE *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  _BYTE *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  _BYTE *v38;
  uint64_t v39;
  uint64_t v40;
  char v41;
  _BYTE *v42;
  uint64_t v43;
  uint64_t v44;
  char v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  char v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  char v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  id v60;
  uint64_t v61;
  char v62;
  NSObject *v63;
  os_log_type_t v64;
  uint8_t *v65;
  id v66;
  unsigned int v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  int v71;
  id v72;
  id v73;
  double v74;
  CGFloat v75;
  double v76;
  CGFloat v77;
  double v78;
  CGFloat v79;
  double v80;
  CGFloat v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  id v89;
  id v90;
  id v91;
  id v92;
  void *v93;
  id v94;
  void *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  id v99;
  id v100;
  char v101;
  id v102;
  id v103;
  char v104;
  uint64_t v105;
  _QWORD v106[3];
  uint64_t v107;
  uint64_t v108;
  objc_super v109;
  CGRect v110;
  CGRect v111;

  v1 = v0;
  v2 = sub_213FF8D38();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v106[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (objc_class *)type metadata accessor for IdentityProofingViewController();
  v109.receiver = v0;
  v109.super_class = v6;
  objc_msgSendSuper2(&v109, sel_viewDidLoad);
  v7 = sub_213FD83DC();
  v8 = (uint64_t)&v0[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_configuration];
  sub_213F5F2B8((uint64_t)&v0[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_configuration], (uint64_t)v106);
  v9 = v107;
  v10 = v108;
  __swift_project_boxed_opaque_existential_1(v106, v107);
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v10);
  if (v11)
  {
    v12 = (void *)sub_213FF9428();
    swift_bridgeObjectRelease();
  }
  else
  {
    v12 = 0;
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v106);
  objc_msgSend(v7, sel_setText_, v12);

  v13 = sub_213FD8498();
  sub_213F5F2B8(v8, (uint64_t)v106);
  v14 = v107;
  v15 = v108;
  __swift_project_boxed_opaque_existential_1(v106, v107);
  (*(void (**)(uint64_t, uint64_t))(v15 + 16))(v14, v15);
  if (v16)
  {
    v17 = (void *)sub_213FF9428();
    swift_bridgeObjectRelease();
  }
  else
  {
    v17 = 0;
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v106);
  objc_msgSend(v13, sel_setText_, v17);

  v18 = sub_213FD8640();
  sub_213F5F2B8(v8, (uint64_t)v106);
  v19 = v107;
  v20 = v108;
  __swift_project_boxed_opaque_existential_1(v106, v107);
  (*(void (**)(uint64_t, uint64_t))(v20 + 32))(v19, v20);
  v105 = v3;
  if (v21)
  {
    v22 = (void *)sub_213FF9428();
    swift_bridgeObjectRelease();
  }
  else
  {
    v22 = 0;
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v106);
  objc_msgSend(v18, sel_setTitle_forState_, v22, 0);

  v23 = sub_213FD870C();
  sub_213F5F2B8(v8, (uint64_t)v106);
  v24 = v107;
  v25 = v108;
  __swift_project_boxed_opaque_existential_1(v106, v107);
  (*(void (**)(uint64_t, uint64_t))(v25 + 48))(v24, v25);
  if (v26)
  {
    v27 = (void *)sub_213FF9428();
    swift_bridgeObjectRelease();
  }
  else
  {
    v27 = 0;
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v106);
  objc_msgSend(v23, sel_setTitle_forState_, v27, 0);

  v28 = sub_213FD87DC();
  sub_213F5F2B8(v8, (uint64_t)v106);
  v29 = v107;
  v30 = v108;
  __swift_project_boxed_opaque_existential_1(v106, v107);
  (*(void (**)(uint64_t, uint64_t))(v30 + 152))(v29, v30);
  if (v31)
  {
    v32 = (void *)sub_213FF9428();
    swift_bridgeObjectRelease();
  }
  else
  {
    v32 = 0;
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v106);
  objc_msgSend(v28, sel_setTitle_forState_, v32, 0);

  v33 = sub_213FD88AC();
  sub_213F5F2B8(v8, (uint64_t)v106);
  v34 = v107;
  v35 = v108;
  __swift_project_boxed_opaque_existential_1(v106, v107);
  (*(void (**)(uint64_t, uint64_t))(v35 + 64))(v34, v35);
  if (v36)
  {
    v37 = (void *)sub_213FF9428();
    swift_bridgeObjectRelease();
  }
  else
  {
    v37 = 0;
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v106);
  objc_msgSend(v33, sel_setText_, v37);

  sub_213FD8A50();
  v38 = sub_213FD8640();
  sub_213F5F2B8(v8, (uint64_t)v106);
  v39 = v107;
  v40 = v108;
  __swift_project_boxed_opaque_existential_1(v106, v107);
  v41 = (*(uint64_t (**)(uint64_t, uint64_t))(v40 + 24))(v39, v40);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v106);
  objc_msgSend(v38, sel_setHidden_, (v41 & 1) == 0);

  v42 = sub_213FD870C();
  sub_213F5F2B8(v8, (uint64_t)v106);
  v43 = v107;
  v44 = v108;
  __swift_project_boxed_opaque_existential_1(v106, v107);
  v45 = (*(uint64_t (**)(uint64_t, uint64_t))(v44 + 40))(v43, v44);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v106);
  objc_msgSend(v42, sel_setHidden_, (v45 & 1) == 0);

  v46 = sub_213FD88AC();
  sub_213F5F2B8(v8, (uint64_t)v106);
  v47 = v107;
  v48 = v108;
  __swift_project_boxed_opaque_existential_1(v106, v107);
  v49 = (*(uint64_t (**)(uint64_t, uint64_t))(v48 + 56))(v47, v48);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v106);
  objc_msgSend(v46, sel_setHidden_, (v49 & 1) == 0);

  v50 = sub_213FD88C0();
  sub_213F5F2B8(v8, (uint64_t)v106);
  v51 = v107;
  v52 = v108;
  __swift_project_boxed_opaque_existential_1(v106, v107);
  v53 = (*(uint64_t (**)(uint64_t, uint64_t))(v52 + 56))(v51, v52);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v106);
  objc_msgSend(v50, sel_setHidden_, (v53 & 1) == 0);

  v54 = sub_213FD89BC();
  sub_213F5F2B8(v8, (uint64_t)v106);
  v55 = v107;
  v56 = v108;
  __swift_project_boxed_opaque_existential_1(v106, v107);
  v57 = (*(uint64_t (**)(uint64_t, uint64_t))(v56 + 88))(v55, v56);
  objc_msgSend(v54, sel_setImage_, v57);

  __swift_destroy_boxed_opaque_existential_0((uint64_t)v106);
  sub_213F5F2B8(v8, (uint64_t)v106);
  v58 = v107;
  v59 = v108;
  __swift_project_boxed_opaque_existential_1(v106, v107);
  LOBYTE(v57) = (*(uint64_t (**)(uint64_t, uint64_t))(v59 + 96))(v58, v59);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v106);
  if ((v57 & 1) != 0)
  {
    v60 = sub_213FD89BC();
    sub_213F3F7CC(0, (unint64_t *)&qword_254D5BDF8);
    v61 = sub_213FF8000();
    v62 = MEMORY[0x2199C76A0](v61);
    swift_bridgeObjectRelease();
    if ((v62 & 1) != 0)
    {
      sub_213FF7778();
      v63 = sub_213FF8D2C();
      v64 = sub_213FF95E4();
      if (os_log_type_enabled(v63, v64))
      {
        v65 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v65 = 0;
        _os_log_impl(&dword_213F36000, v63, v64, "Internal setting to skip disable screen captures", v65, 2u);
        MEMORY[0x2199C815C](v65, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v105 + 8))(v5, v2);
    }
    else
    {
      v66 = objc_msgSend(v60, sel_layer);
      v67 = objc_msgSend(v66, sel_disableUpdateMask);

      v68 = objc_msgSend(v60, sel_layer);
      objc_msgSend(v68, sel_setDisableUpdateMask_, v67 | 0x12);

      v60 = v68;
    }

  }
  sub_213F5F2B8(v8, (uint64_t)v106);
  v69 = v107;
  v70 = v108;
  __swift_project_boxed_opaque_existential_1(v106, v107);
  v71 = (*(unsigned __int8 (**)(uint64_t, uint64_t))(v70 + 80))(v69, v70);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v106);
  if (v71 == 2)
  {
    v72 = sub_213FD89BC();
    v73 = sub_213FD89BC();
    objc_msgSend(v73, sel_frame);
    v75 = v74;
    v77 = v76;
    v79 = v78;
    v81 = v80;

    v110.origin.x = v75;
    v110.origin.y = v77;
    v110.size.width = v79;
    v110.size.height = v81;
    v111 = CGRectInset(v110, -1.0, -1.0);
    objc_msgSend(v72, sel_setFrame_, v111.origin.x, v111.origin.y, v111.size.width, v111.size.height);

    v82 = sub_213FD89BC();
    v83 = objc_msgSend(v82, sel_layer);

    objc_msgSend(v83, sel_setCornerRadius_, 8.0);
    v84 = sub_213FD89BC();
    v85 = objc_msgSend(v84, sel_layer);

    v86 = objc_msgSend((id)objc_opt_self(), sel_blackColor);
    v87 = objc_msgSend(v86, sel_colorWithAlphaComponent_, 0.1);

    v88 = objc_msgSend(v87, sel_CGColor);
    objc_msgSend(v85, sel_setBorderColor_, v88);

    v89 = sub_213FD89BC();
    v90 = objc_msgSend(v89, sel_layer);

    objc_msgSend(v90, sel_setBorderWidth_, 1.0);
    v91 = sub_213FD89BC();
    objc_msgSend(v91, sel_setClipsToBounds_, 1);

  }
  v92 = objc_msgSend(v1, sel_view, v105);
  if (v92)
  {
    v93 = v92;
    v94 = objc_msgSend((id)objc_opt_self(), sel_systemBackgroundColor);
    objc_msgSend(v93, sel_setBackgroundColor_, v94);

    v95 = *(void **)&v1[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_cancelButton];
    if (v95)
      objc_msgSend(v95, sel_setEnabled_, 1);
    sub_213FD8F48();
    __swift_instantiateConcreteTypeFromMangledName(&qword_254D5E6D0);
    v96 = swift_allocObject();
    *(_OWORD *)(v96 + 16) = xmmword_213FFBF20;
    v97 = sub_213FF8D50();
    v98 = MEMORY[0x24BEBCB18];
    *(_QWORD *)(v96 + 32) = v97;
    *(_QWORD *)(v96 + 40) = v98;
    MEMORY[0x2199C76AC](v96, sel_updateViewLayout_previousTraitCollection_);
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    v99 = objc_msgSend(v1, sel_traitCollection);
    v100 = objc_msgSend(v99, sel_preferredContentSizeCategory);

    v101 = sub_213FF9698();
    if ((v101 & 1) != 0)
    {
      sub_213FD9668();
    }
    else
    {
      v102 = objc_msgSend(v1, sel_traitCollection);
      v103 = objc_msgSend(v102, sel_preferredContentSizeCategory);

      v104 = sub_213FF96A4();
      if ((v104 & 1) != 0)
        sub_213FDA07C();
    }
  }
  else
  {
    __break(1u);
  }
}

void sub_213FDD204()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  id v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double Height;
  id v20;
  id v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  _QWORD v26[3];
  uint64_t v27;
  uint64_t v28;
  objc_super v29;
  CGRect v30;

  v1 = v0;
  v29.receiver = v0;
  v29.super_class = (Class)type metadata accessor for IdentityProofingViewController();
  objc_msgSendSuper2(&v29, sel_viewDidLayoutSubviews);
  v2 = (uint64_t)v0 + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_configuration;
  sub_213F5F2B8((uint64_t)v0 + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_configuration, (uint64_t)v26);
  v3 = v27;
  v4 = v28;
  __swift_project_boxed_opaque_existential_1(v26, v27);
  v5 = (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 112))(v3, v4);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v26);
  if ((v5 & 1) == 0)
  {
    sub_213F5F2B8(v2, (uint64_t)v26);
    v6 = v27;
    v7 = v28;
    __swift_project_boxed_opaque_existential_1(v26, v27);
    v8 = (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 80))(v6, v7);
    v9 = sub_213FDC2BC(v8, (uint64_t)&unk_24D116F78);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v26);
    if (v9)
    {
      v10 = objc_msgSend((id)objc_opt_self(), sel_mainScreen);
      objc_msgSend(v10, sel_bounds);
      v12 = v11;
      v14 = v13;
      v16 = v15;
      v18 = v17;

      v30.origin.x = v12;
      v30.origin.y = v14;
      v30.size.width = v16;
      v30.size.height = v18;
      Height = CGRectGetHeight(v30);
      v20 = sub_213FD8540();
      v21 = objc_msgSend(v1, sel_view);
      if (v21)
      {
        v22 = v21;
        v23 = Height * 0.09;
        objc_msgSend(v21, sel_safeAreaInsets);
        v25 = v24;

        objc_msgSend(v20, sel_contentInset);
        objc_msgSend(v20, sel_setContentInset_, vabdd_f64(v23, v25));

      }
      else
      {
        __break(1u);
      }
    }
  }
}

void sub_213FDD468(uint64_t a1, unint64_t a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  char v6;
  uint64_t i;
  id v8;
  void *v9;
  char v10;
  unint64_t v11;

  if (a2 >> 62)
    goto LABEL_20;
  v3 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v3)
  {
    while (1)
    {
      if ((a2 & 0xC000000000000001) != 0)
      {
        v4 = (id)MEMORY[0x2199C78A4](0, a2);
      }
      else
      {
        if (!*(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
          return;
        }
        v4 = *(id *)(a2 + 32);
      }
      v5 = v4;
      sub_213F3F7CC(0, &qword_254D60760);
      v6 = sub_213FF96F8();

      if ((v6 & 1) == 0)
      {
        for (i = 0; ; ++i)
        {
          v11 = i + 1;
          if (__OFADD__(i, 1))
            break;
          if (v11 == v3)
            return;
          if ((a2 & 0xC000000000000001) != 0)
          {
            v8 = (id)MEMORY[0x2199C78A4](i + 1, a2);
          }
          else
          {
            if ((v11 & 0x8000000000000000) != 0)
              goto LABEL_18;
            if (v11 >= *(_QWORD *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10))
              goto LABEL_19;
            v8 = *(id *)(a2 + 32 + 8 * v11);
          }
          v9 = v8;
          v10 = sub_213FF96F8();

          if ((v10 & 1) != 0)
            return;
        }
        __break(1u);
LABEL_18:
        __break(1u);
LABEL_19:
        __break(1u);
LABEL_20:
        swift_bridgeObjectRetain();
        v3 = sub_213FF9884();
        swift_bridgeObjectRelease();
        if (v3)
          continue;
      }
      return;
    }
  }
}

id sub_213FDD630()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IdentityProofingViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for IdentityProofingViewController()
{
  return objc_opt_self();
}

id sub_213FDD7D8(uint64_t a1, char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t *boxed_opaque_existential_1;
  char *v8;
  char *v9;
  char *v10;
  char *v11;
  id v12;
  objc_super v14;
  uint64_t v15[5];

  v15[3] = a3;
  v15[4] = a4;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v15);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 32))(boxed_opaque_existential_1, a1, a3);
  v8 = &a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_primaryButtonTargetAction];
  *(_QWORD *)v8 = 0;
  *((_QWORD *)v8 + 1) = 0;
  v9 = &a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_secondaryButtonTargetAction];
  *(_QWORD *)v9 = 0;
  *((_QWORD *)v9 + 1) = 0;
  v10 = &a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_cancelButtonTargetAction];
  *(_QWORD *)v10 = 0;
  *((_QWORD *)v10 + 1) = 0;
  v11 = &a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_tertiaryButtonTargetAction];
  *(_QWORD *)v11 = 0;
  *((_QWORD *)v11 + 1) = 0;
  *(_QWORD *)&a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___bottomTray] = 0;
  *(_QWORD *)&a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___textContainerStackView] = 0;
  *(_QWORD *)&a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___titleLabel] = 0;
  *(_QWORD *)&a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___subTitleLabel] = 0;
  *(_QWORD *)&a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___scrollView] = 0;
  *(_QWORD *)&a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___mainStackView] = 0;
  *(_QWORD *)&a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___primaryButton] = 0;
  *(_QWORD *)&a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___secondaryButton] = 0;
  *(_QWORD *)&a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___tertiaryButton] = 0;
  *(_QWORD *)&a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___footerCaption] = 0;
  *(_QWORD *)&a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___footerCaptionSpacer] = 0;
  *(_QWORD *)&a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_cancelButton] = 0;
  *(_QWORD *)&a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___headerView] = 0;
  *(_QWORD *)&a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___imageView] = 0;
  sub_213F5F2B8((uint64_t)v15, (uint64_t)&a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_configuration]);
  v14.receiver = a2;
  v14.super_class = (Class)type metadata accessor for IdentityProofingViewController();
  v12 = objc_msgSendSuper2(&v14, sel_initWithNibName_bundle_, 0, 0);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v15);
  return v12;
}

void sub_213FDD958(void *a1)
{
  void *v1;
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
  id v13;
  void *v14;
  id v15;
  id v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v23;
  id v24;
  char v25;
  id v26;
  id v27;
  char *v28;
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  id v32;
  char v33;
  id v34;
  id v35;
  NSObject *v36;
  os_log_type_t v37;
  uint8_t *v38;
  id v39;
  id v40;
  NSObject *v41;
  os_log_type_t v42;
  uint8_t *v43;
  id v44;
  id v45;
  NSObject *v46;
  os_log_type_t v47;
  uint8_t *v48;
  char *v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;

  v3 = sub_213FF8D38();
  v51 = *(_QWORD *)(v3 - 8);
  v52 = v3;
  v4 = MEMORY[0x24BDAC7A8](v3);
  v50 = (char *)&v49 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v49 - v7;
  v9 = MEMORY[0x24BDAC7A8](v6);
  v11 = (char *)&v49 - v10;
  MEMORY[0x24BDAC7A8](v9);
  v49 = (char *)&v49 - v12;
  sub_213FD8F48();
  if (a1)
    v13 = objc_msgSend(a1, sel_preferredContentSizeCategory);
  else
    v13 = 0;
  v14 = v1;
  v15 = objc_msgSend(v1, sel_traitCollection);
  v16 = objc_msgSend(v15, sel_preferredContentSizeCategory);

  if (!v13)
  {

LABEL_12:
    if (a1)
    {
      v24 = objc_msgSend(a1, sel_preferredContentSizeCategory);
      v25 = sub_213FF96A4();

      if ((v25 & 1) != 0
        && (v26 = objc_msgSend(v1, sel_traitCollection),
            v27 = objc_msgSend(v26, sel_preferredContentSizeCategory),
            v26,
            LOBYTE(v26) = sub_213FF96A4(),
            v27,
            (v26 & 1) != 0))
      {
        v28 = v49;
        sub_213FF7778();
        v29 = sub_213FF8D2C();
        v30 = sub_213FF95C0();
        if (os_log_type_enabled(v29, v30))
        {
          v31 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v31 = 0;
          _os_log_impl(&dword_213F36000, v29, v30, "previous and current are both greater than the threshold, no layout changes needed", v31, 2u);
          MEMORY[0x2199C815C](v31, -1, -1);
        }

        (*(void (**)(char *, uint64_t))(v51 + 8))(v28, v52);
      }
      else
      {
        v32 = objc_msgSend(a1, sel_preferredContentSizeCategory);
        v33 = sub_213FF9698();

        if ((v33 & 1) != 0
          && (v34 = objc_msgSend(v1, sel_traitCollection),
              v35 = objc_msgSend(v34, sel_preferredContentSizeCategory),
              v34,
              LOBYTE(v34) = sub_213FF9698(),
              v35,
              (v34 & 1) != 0))
        {
          sub_213FF7778();
          v36 = sub_213FF8D2C();
          v37 = sub_213FF95C0();
          if (os_log_type_enabled(v36, v37))
          {
            v38 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)v38 = 0;
            _os_log_impl(&dword_213F36000, v36, v37, "previous and current are both lesser than the threshold, no layout changes needed", v38, 2u);
            MEMORY[0x2199C815C](v38, -1, -1);
          }

          (*(void (**)(char *, uint64_t))(v51 + 8))(v11, v52);
        }
        else
        {
          v39 = objc_msgSend(v1, sel_traitCollection);
          v40 = objc_msgSend(v39, sel_preferredContentSizeCategory);

          LOBYTE(v39) = sub_213FF96A4();
          if ((v39 & 1) != 0)
          {
            sub_213FD9260();
            sub_213FDA07C();
            sub_213FF7778();
            v41 = sub_213FF8D2C();
            v42 = sub_213FF95C0();
            if (os_log_type_enabled(v41, v42))
            {
              v43 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)v43 = 0;
              _os_log_impl(&dword_213F36000, v41, v42, "current size is greater than the threshold, reset layout for larger text", v43, 2u);
              MEMORY[0x2199C815C](v43, -1, -1);
            }

            (*(void (**)(char *, uint64_t))(v51 + 8))(v8, v52);
          }
          else
          {
            v44 = objc_msgSend(v1, sel_traitCollection);
            v45 = objc_msgSend(v44, sel_preferredContentSizeCategory);

            LOBYTE(v44) = sub_213FF9698();
            if ((v44 & 1) != 0)
            {
              sub_213FD9260();
              sub_213FD9668();
              sub_213FF7778();
              v46 = sub_213FF8D2C();
              v47 = sub_213FF95C0();
              if (os_log_type_enabled(v46, v47))
              {
                v48 = (uint8_t *)swift_slowAlloc();
                *(_WORD *)v48 = 0;
                _os_log_impl(&dword_213F36000, v46, v47, "current size is lesser than the threshold, reset layout for smaller text", v48, 2u);
                MEMORY[0x2199C815C](v48, -1, -1);
              }

              (*(void (**)(char *, uint64_t))(v51 + 8))(v50, v52);
            }
          }
        }
      }
    }
    else
    {
      __break(1u);
    }
    return;
  }
  v17 = v8;
  v18 = sub_213FF9458();
  v20 = v19;
  if (v18 == sub_213FF9458() && v20 == v21)
  {

    swift_bridgeObjectRelease_n();
    return;
  }
  v23 = sub_213FF98FC();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v8 = v17;
  v1 = v14;
  if ((v23 & 1) == 0)
    goto LABEL_12;
}

void sub_213FDDEEC()
{
  char *v0;
  char *v1;
  char *v2;
  char *v3;
  char *v4;

  v1 = &v0[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_primaryButtonTargetAction];
  *(_QWORD *)v1 = 0;
  *((_QWORD *)v1 + 1) = 0;
  v2 = &v0[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_secondaryButtonTargetAction];
  *(_QWORD *)v2 = 0;
  *((_QWORD *)v2 + 1) = 0;
  v3 = &v0[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_cancelButtonTargetAction];
  *(_QWORD *)v3 = 0;
  *((_QWORD *)v3 + 1) = 0;
  v4 = &v0[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_tertiaryButtonTargetAction];
  *(_QWORD *)v4 = 0;
  *((_QWORD *)v4 + 1) = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___bottomTray] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___textContainerStackView] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___titleLabel] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___subTitleLabel] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___scrollView] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___mainStackView] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___primaryButton] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___secondaryButton] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___tertiaryButton] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___footerCaption] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___footerCaptionSpacer] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_cancelButton] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___headerView] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___imageView] = 0;

  sub_213FF9878();
  __break(1u);
}

id sub_213FDE0D4()
{
  return sub_213F471F0(&OBJC_IVAR____TtC9CoreIDVUI43IdentityProofingAddedToWalletViewController____lazy_storage___titleLabel);
}

id sub_213FDE0E0()
{
  return sub_213F471F0(&OBJC_IVAR____TtC9CoreIDVUI43IdentityProofingAddedToWalletViewController____lazy_storage___primaryLabel);
}

id sub_213FDE0EC()
{
  return sub_213F471F0(&OBJC_IVAR____TtC9CoreIDVUI43IdentityProofingAddedToWalletViewController____lazy_storage___secondaryLabel);
}

id sub_213FDE0F8()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;

  v1 = OBJC_IVAR____TtC9CoreIDVUI43IdentityProofingAddedToWalletViewController____lazy_storage___primaryButton;
  v2 = *(void **)(v0
                + OBJC_IVAR____TtC9CoreIDVUI43IdentityProofingAddedToWalletViewController____lazy_storage___primaryButton);
  if (v2)
  {
    v3 = *(id *)(v0
               + OBJC_IVAR____TtC9CoreIDVUI43IdentityProofingAddedToWalletViewController____lazy_storage___primaryButton);
  }
  else
  {
    v4 = sub_213F472BC(v0);
    v5 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v4;
    v3 = v4;

    v2 = 0;
  }
  v6 = v2;
  return v3;
}

id sub_213FDE158()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v15;

  v1 = v0;
  v2 = sub_213FF8D08();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = OBJC_IVAR____TtC9CoreIDVUI43IdentityProofingAddedToWalletViewController____lazy_storage___imageView;
  v7 = *(void **)(v1
                + OBJC_IVAR____TtC9CoreIDVUI43IdentityProofingAddedToWalletViewController____lazy_storage___imageView);
  if (v7)
  {
    v8 = *(id *)(v1 + OBJC_IVAR____TtC9CoreIDVUI43IdentityProofingAddedToWalletViewController____lazy_storage___imageView);
  }
  else
  {
    sub_213FC0990();
    if (qword_254D5BAF8 != -1)
      swift_once();
    v9 = __swift_project_value_buffer(v2, (uint64_t)qword_254D630C8);
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v9, v2);
    v10 = (void *)sub_213FF96EC();
    v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD668]), sel_initWithImage_, v10);

    v12 = *(void **)(v1 + v6);
    *(_QWORD *)(v1 + v6) = v11;
    v8 = v11;

    v7 = 0;
  }
  v13 = v7;
  return v8;
}

uint64_t sub_213FDE284()
{
  char *v0;
  char *v1;
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  objc_super v25;

  v1 = v0;
  v25.receiver = v0;
  v25.super_class = (Class)type metadata accessor for IdentityProofingAddedToWalletViewController();
  objc_msgSendSuper2(&v25, sel_viewDidLoad);
  sub_213FDF020();
  v2 = sub_213FA145C();
  v3 = sub_213FDE158();
  objc_msgSend(v2, sel_addArrangedSubview_, v3);

  v4 = sub_213FA145C();
  v5 = sub_213FDE0D4();
  objc_msgSend(v4, sel_addArrangedSubview_, v5);

  v6 = sub_213FA145C();
  v7 = sub_213FDE0E0();
  objc_msgSend(v6, sel_addArrangedSubview_, v7);

  v8 = sub_213FA151C();
  v9 = sub_213FDE0F8();
  objc_msgSend(v8, sel_addArrangedSubview_, v9);

  v10 = sub_213FA145C();
  v11 = sub_213FDE158();
  objc_msgSend(v10, sel_setCustomSpacing_afterView_, v11, 24.0);

  v12 = sub_213FDE0F8();
  v13 = objc_msgSend(v12, sel_widthAnchor);

  v14 = sub_213FA151C();
  v15 = objc_msgSend(v14, sel_widthAnchor);

  v16 = objc_msgSend(v13, sel_constraintEqualToAnchor_constant_, v15, -20.0);
  objc_msgSend(v16, sel_setActive_, 1);

  v17 = sub_213FDE0F8();
  v18 = objc_msgSend(v17, sel_heightAnchor);

  v19 = objc_msgSend(v18, sel_constraintEqualToConstant_, 50.0);
  objc_msgSend(v19, sel_setActive_, 1);

  sub_213FDF020();
  sub_213FDE814();
  v20 = *(_QWORD *)&v1[OBJC_IVAR____TtC9CoreIDVUI43IdentityProofingAddedToWalletViewController_proofingFlowManager];
  sub_213FDE644((*(_QWORD *)(v20 + 136) & 3) == 2);
  sub_213FF8348();
  if (*(_QWORD *)(v20 + 136) == 2)
  {
    swift_bridgeObjectRelease();
    sub_213FF83A8();
  }
  sub_213FF8594();
  swift_retain();
  sub_213FF84BC();
  sub_213FF7F40();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D5E6D0);
  v21 = swift_allocObject();
  *(_OWORD *)(v21 + 16) = xmmword_213FFBF20;
  v22 = sub_213FF8D50();
  v23 = MEMORY[0x24BEBCB18];
  *(_QWORD *)(v21 + 32) = v22;
  *(_QWORD *)(v21 + 40) = v23;
  MEMORY[0x2199C76AC](v21, sel_configureFonts);
  swift_unknownObjectRelease();
  return swift_bridgeObjectRelease();
}

void sub_213FDE644(char a1)
{
  void *v1;
  id v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;

  if ((a1 & 1) != 0)
  {
    v2 = sub_213FDE0D4();
    v3 = (void *)objc_opt_self();
    v4 = objc_msgSend(v3, sel_whiteColor);
    objc_msgSend(v2, sel_setTextColor_, v4);

    v5 = sub_213FDE0E0();
    v6 = objc_msgSend(v3, sel_whiteColor);
    objc_msgSend(v5, sel_setTextColor_, v6);

    v7 = sub_213FDE0EC();
    v8 = objc_msgSend(v3, sel_whiteColor);
    objc_msgSend(v7, sel_setTextColor_, v8);

    v9 = sub_213FDE0F8();
    v10 = objc_msgSend(v3, sel_systemGray5Color);
    objc_msgSend(v9, sel_setBackgroundColor_, v10);

    objc_msgSend(v1, sel_setOverrideUserInterfaceStyle_, 2);
    v11 = objc_msgSend(v1, sel_navigationController);
    if (v11)
    {
      v12 = v11;
      v13 = objc_msgSend(v11, sel_navigationBar);

      v14 = objc_msgSend(v3, sel_systemOrangeColor);
      objc_msgSend(v13, sel_setTintColor_, v14);

    }
  }
}

void sub_213FDE814()
{
  id v0;
  void *v1;
  uint64_t v2;
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;

  v0 = sub_213FDE0D4();
  v1 = (void *)objc_opt_self();
  v2 = *MEMORY[0x24BEBE070];
  v3 = objc_msgSend(v1, sel__preferredFontForTextStyle_maximumContentSizeCategory_, *MEMORY[0x24BEBE210], *MEMORY[0x24BEBE070]);
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, sel_pointSize);
    v5 = objc_msgSend(v1, sel_systemFontOfSize_weight_);

    objc_msgSend(v0, sel_setFont_, v5);
    v6 = sub_213FDE0D4();
    objc_msgSend(v6, sel_setAdjustsFontForContentSizeCategory_, 1);

    v7 = sub_213FDE0E0();
    v8 = *MEMORY[0x24BEBE1D0];
    v9 = objc_msgSend(v1, sel__preferredFontForTextStyle_maximumContentSizeCategory_, *MEMORY[0x24BEBE1D0], v2);
    objc_msgSend(v7, sel_setFont_, v9);

    v10 = sub_213FDE0E0();
    objc_msgSend(v10, sel_setAdjustsFontForContentSizeCategory_, 1);

    v11 = sub_213FDE0EC();
    v12 = objc_msgSend(v1, sel__preferredFontForTextStyle_maximumContentSizeCategory_, v8, v2);
    objc_msgSend(v11, sel_setFont_, v12);

    v13 = sub_213FDE0EC();
    objc_msgSend(v13, sel_setAdjustsFontForContentSizeCategory_, 1);

    v14 = sub_213FDE0F8();
    v15 = objc_msgSend(v14, sel_titleLabel);

    if (v15)
    {
      v16 = objc_msgSend(v1, sel_preferredFontForTextStyle_, *MEMORY[0x24BEBE200]);
      objc_msgSend(v15, sel_setFont_, v16);

    }
    v17 = sub_213FDE0F8();
    v18 = objc_msgSend(v17, sel_titleLabel);

    objc_msgSend(v18, sel_setAdjustsFontSizeToFitWidth_, 1);
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_213FDEAB4()
{
  char *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  id v5;
  id v6;

  v1 = v0;
  v2 = *(_QWORD *)&v0[OBJC_IVAR____TtC9CoreIDVUI43IdentityProofingAddedToWalletViewController_proofingFlowManager];
  type metadata accessor for UsingYourIDInteractor();
  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = v2;
  v4 = (char *)objc_allocWithZone((Class)type metadata accessor for UsingYourIDViewController());
  *(_QWORD *)&v4[OBJC_IVAR____TtC9CoreIDVUI25UsingYourIDViewController_interactor] = v3;
  swift_retain_n();
  swift_retain();
  v5 = sub_213FDFD90(v2, v4);
  v6 = objc_msgSend(v1, sel_navigationController);
  sub_213FE1BAC(v5, v6);

  sub_213FF8348();
  if (*(_QWORD *)(v2 + 136) == 2)
  {
    swift_bridgeObjectRelease();
    sub_213FF83A8();
  }
  sub_213FF8600();
  swift_retain();
  sub_213FF84BC();
  sub_213FF7F40();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_213FDEC90@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t result;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  char v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;

  v3 = __swift_instantiateConcreteTypeFromMangledName(qword_254D5D1D8);
  v4 = MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v4);
  v9 = (char *)&v33 - v8;
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v33 - v10;
  v12 = sub_213FF8690();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v13 + 56);
  result = v14(a1, 1, 1, v12);
  v16 = *(_QWORD *)(v1 + OBJC_IVAR____TtC9CoreIDVUI43IdentityProofingAddedToWalletViewController_proofingFlowManager);
  v17 = *(_QWORD *)(v16 + 136);
  if (v17 == 1)
  {
    v18 = *(_QWORD *)(v16 + 176);
    if (v18)
    {
      if (*(_QWORD *)(v18 + 16))
      {
        swift_bridgeObjectRetain();
        v19 = sub_213F42568(0xD000000000000012, 0x8000000214005FC0);
        if ((v20 & 1) != 0)
        {
          (*(void (**)(char *, unint64_t, uint64_t))(v13 + 16))(v11, *(_QWORD *)(v18 + 56) + *(_QWORD *)(v13 + 72) * v19, v12);
          v21 = v11;
          v22 = 0;
        }
        else
        {
          v21 = v11;
          v22 = 1;
        }
        v14((uint64_t)v21, v22, 1, v12);
      }
      else
      {
        v14((uint64_t)v11, 1, 1, v12);
        swift_bridgeObjectRetain();
      }
      sub_213F65364(a1);
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_213F65364(a1);
      v14((uint64_t)v11, 1, 1, v12);
    }
    result = sub_213FC09CC((uint64_t)v11, a1);
    v17 = *(_QWORD *)(v16 + 136);
    if (v17 != 2)
    {
LABEL_3:
      if (v17 != 3)
        return result;
      goto LABEL_25;
    }
  }
  else if (v17 != 2)
  {
    goto LABEL_3;
  }
  v23 = *(_QWORD *)(v16 + 176);
  if (v23)
  {
    if (*(_QWORD *)(v23 + 16))
    {
      swift_bridgeObjectRetain();
      v24 = sub_213F42568(0xD000000000000012, 0x8000000214005FA0);
      if ((v25 & 1) != 0)
      {
        (*(void (**)(char *, unint64_t, uint64_t))(v13 + 16))(v9, *(_QWORD *)(v23 + 56) + *(_QWORD *)(v13 + 72) * v24, v12);
        v26 = v9;
        v27 = 0;
      }
      else
      {
        v26 = v9;
        v27 = 1;
      }
      v14((uint64_t)v26, v27, 1, v12);
    }
    else
    {
      v14((uint64_t)v9, 1, 1, v12);
      swift_bridgeObjectRetain();
    }
    sub_213F65364(a1);
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_213F65364(a1);
    v14((uint64_t)v9, 1, 1, v12);
  }
  result = sub_213FC09CC((uint64_t)v9, a1);
  if (*(_QWORD *)(v16 + 136) == 3)
  {
LABEL_25:
    v28 = *(_QWORD *)(v16 + 176);
    if (v28)
    {
      if (*(_QWORD *)(v28 + 16))
      {
        swift_bridgeObjectRetain();
        v29 = sub_213F42568(0xD000000000000011, 0x8000000214005F80);
        if ((v30 & 1) != 0)
        {
          (*(void (**)(char *, unint64_t, uint64_t))(v13 + 16))(v6, *(_QWORD *)(v28 + 56) + *(_QWORD *)(v13 + 72) * v29, v12);
          v31 = v6;
          v32 = 0;
        }
        else
        {
          v31 = v6;
          v32 = 1;
        }
        v14((uint64_t)v31, v32, 1, v12);
      }
      else
      {
        v14((uint64_t)v6, 1, 1, v12);
        swift_bridgeObjectRetain();
      }
      sub_213F65364(a1);
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_213F65364(a1);
      v14((uint64_t)v6, 1, 1, v12);
    }
    return sub_213FC09CC((uint64_t)v6, a1);
  }
  return result;
}

void sub_213FDF020()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int (*v11)(char *, uint64_t, uint64_t);
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  _QWORD *v15;
  id v16;
  void *v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  _QWORD *v23;
  id v24;
  void *v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;

  v0 = __swift_instantiateConcreteTypeFromMangledName(qword_254D5D1D8);
  v1 = MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v31 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = MEMORY[0x24BDAC7A8](v1);
  v6 = (char *)&v31 - v5;
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v31 - v7;
  sub_213FDEC90((uint64_t)&v31 - v7);
  v9 = sub_213FF8690();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48);
  if (v11(v8, 1, v9) == 1)
  {
    sub_213F65364((uint64_t)v8);
  }
  else
  {
    v12 = sub_213FF8660();
    v14 = v13;
    (*(void (**)(char *, uint64_t))(v10 + 8))(v8, v9);
    if (v14)
      goto LABEL_5;
  }
  swift_bridgeObjectRelease();
  v12 = 0;
  v14 = 0xE000000000000000;
LABEL_5:
  sub_213FE1990(v12, v14);
  swift_bridgeObjectRelease();
  sub_213FDF374();
  swift_bridgeObjectRelease();
  sub_213FDEC90((uint64_t)v6);
  if (v11(v6, 1, v9) == 1)
  {
    sub_213F65364((uint64_t)v6);
  }
  else
  {
    v15 = (_QWORD *)sub_213FF8684();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v6, v9);
    if (v15)
    {
      if (v15[2])
      {
        v16 = sub_213FDE0E0();
        if (!v15[2])
        {
          __break(1u);
          goto LABEL_27;
        }
        v17 = v16;
        v18 = v15[4];
        v19 = v15[5];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        sub_213FE1990(v18, v19);
        v21 = v20;
        swift_bridgeObjectRelease();
        if (v21)
        {
          v22 = (void *)sub_213FF9428();
          swift_bridgeObjectRelease();
        }
        else
        {
          v22 = 0;
        }
        objc_msgSend(v17, sel_setText_, v22);

      }
      else
      {
        swift_bridgeObjectRelease();
      }
    }
  }
  sub_213FDEC90((uint64_t)v3);
  if (v11(v3, 1, v9) == 1)
  {
    sub_213F65364((uint64_t)v3);
    return;
  }
  v23 = (_QWORD *)sub_213FF866C();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v3, v9);
  if (v23)
  {
    if (!v23[2])
    {
      swift_bridgeObjectRelease();
      return;
    }
    v24 = sub_213FDE0F8();
    if (v23[2])
    {
      v25 = v24;
      v26 = v23[4];
      v27 = v23[5];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      sub_213FE1990(v26, v27);
      v29 = v28;
      swift_bridgeObjectRelease();
      if (v29)
      {
        v30 = (void *)sub_213FF9428();
        swift_bridgeObjectRelease();
      }
      else
      {
        v30 = 0;
      }
      objc_msgSend(v25, sel_setTitle_forState_, v30, 0);

      return;
    }
LABEL_27:
    __break(1u);
  }
}

void sub_213FDF374()
{
  uint64_t v0;
  id v1;
  id v2;
  double v3;
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  char **v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;

  v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBB4B8]), sel_init);
  v2 = objc_msgSend((id)objc_opt_self(), sel_preferredFontForTextStyle_, *MEMORY[0x24BEBE210]);
  objc_msgSend(v2, sel_pointSize);
  v4 = objc_msgSend((id)objc_opt_self(), sel_configurationWithPointSize_weight_, 7, v3);
  v5 = *(_QWORD *)(*(_QWORD *)(v0
                             + OBJC_IVAR____TtC9CoreIDVUI43IdentityProofingAddedToWalletViewController_proofingFlowManager)
                 + 136);
  v6 = v4;
  v7 = (void *)sub_213FF9428();
  v8 = objc_msgSend((id)objc_opt_self(), sel_systemImageNamed_withConfiguration_, v7, v6);

  if (v8)
  {
    v9 = (void *)objc_opt_self();
    v10 = &selRef_whiteColor;
    if ((v5 & 3) != 2)
      v10 = &selRef_systemBlueColor;
    v11 = objc_msgSend(v9, *v10);
    v12 = objc_msgSend(v8, sel_imageWithTintColor_, v11);

  }
  else
  {
    v12 = 0;
  }
  objc_msgSend(v1, sel_setImage_, v12);

  swift_bridgeObjectRetain();
  sub_213FF94A0();
  v13 = objc_allocWithZone(MEMORY[0x24BDD1688]);
  v14 = (void *)sub_213FF9428();
  swift_bridgeObjectRelease();
  v15 = objc_msgSend(v13, sel_initWithString_, v14);

  v16 = objc_msgSend((id)objc_opt_self(), sel_attributedStringWithAttachment_, v1);
  objc_msgSend(v15, sel_appendAttributedString_, v16);

  v17 = sub_213FDE0D4();
  objc_msgSend(v17, sel_setAttributedText_, v15);

}

void sub_213FDF644()
{
  uint64_t v0;

  swift_release();
  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtC9CoreIDVUI43IdentityProofingAddedToWalletViewController____lazy_storage___titleLabel));
  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtC9CoreIDVUI43IdentityProofingAddedToWalletViewController____lazy_storage___primaryLabel));
  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtC9CoreIDVUI43IdentityProofingAddedToWalletViewController____lazy_storage___secondaryLabel));
  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtC9CoreIDVUI43IdentityProofingAddedToWalletViewController____lazy_storage___primaryButton));
  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtC9CoreIDVUI43IdentityProofingAddedToWalletViewController____lazy_storage___imageView));
}

id sub_213FDF6B0()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IdentityProofingAddedToWalletViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for IdentityProofingAddedToWalletViewController()
{
  return objc_opt_self();
}

id sub_213FDF778(uint64_t a1, char *a2)
{
  uint64_t v4;
  char *v5;
  char *v6;
  char *v7;
  char *v8;
  __int128 v9;
  id v10;
  objc_super v12;
  _QWORD v13[5];

  v13[3] = &type metadata for RGBCaptureViewConfiguration;
  v13[4] = &off_24D11BB30;
  v4 = swift_allocObject();
  v5 = &a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_primaryButtonTargetAction];
  *(_QWORD *)v5 = 0;
  *((_QWORD *)v5 + 1) = 0;
  v6 = &a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_secondaryButtonTargetAction];
  *(_QWORD *)v6 = 0;
  *((_QWORD *)v6 + 1) = 0;
  v7 = &a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_cancelButtonTargetAction];
  *(_QWORD *)v7 = 0;
  *((_QWORD *)v7 + 1) = 0;
  v8 = &a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_tertiaryButtonTargetAction];
  *(_QWORD *)v8 = 0;
  *((_QWORD *)v8 + 1) = 0;
  *(_QWORD *)&a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___bottomTray] = 0;
  *(_QWORD *)&a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___textContainerStackView] = 0;
  *(_QWORD *)&a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___titleLabel] = 0;
  *(_QWORD *)&a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___subTitleLabel] = 0;
  *(_QWORD *)&a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___scrollView] = 0;
  *(_QWORD *)&a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___mainStackView] = 0;
  *(_QWORD *)&a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___primaryButton] = 0;
  *(_QWORD *)&a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___secondaryButton] = 0;
  *(_QWORD *)&a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___tertiaryButton] = 0;
  *(_QWORD *)&a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___footerCaption] = 0;
  *(_QWORD *)&a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___footerCaptionSpacer] = 0;
  *(_QWORD *)&a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_cancelButton] = 0;
  v13[0] = v4;
  v9 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v4 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v4 + 32) = v9;
  *(_BYTE *)(v4 + 48) = *(_BYTE *)(a1 + 32);
  *(_QWORD *)&a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___headerView] = 0;
  *(_QWORD *)&a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___imageView] = 0;
  sub_213F5F2B8((uint64_t)v13, (uint64_t)&a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_configuration]);
  v12.receiver = a2;
  v12.super_class = (Class)type metadata accessor for IdentityProofingViewController();
  v10 = objc_msgSendSuper2(&v12, sel_initWithNibName_bundle_, 0, 0);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v13);
  return v10;
}

id sub_213FDF91C(uint64_t a1, uint64_t a2, uint64_t a3, char *a4)
{
  char *v5;
  char *v6;
  char *v7;
  char *v8;
  id v9;
  objc_super v11;
  _QWORD v12[5];

  v5 = &a4[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_primaryButtonTargetAction];
  *(_QWORD *)v5 = 0;
  *((_QWORD *)v5 + 1) = 0;
  v6 = &a4[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_secondaryButtonTargetAction];
  *(_QWORD *)v6 = 0;
  *((_QWORD *)v6 + 1) = 0;
  v7 = &a4[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_cancelButtonTargetAction];
  *(_QWORD *)v7 = 0;
  *((_QWORD *)v7 + 1) = 0;
  v8 = &a4[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_tertiaryButtonTargetAction];
  *(_QWORD *)v8 = 0;
  *((_QWORD *)v8 + 1) = 0;
  *(_QWORD *)&a4[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___bottomTray] = 0;
  *(_QWORD *)&a4[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___textContainerStackView] = 0;
  *(_QWORD *)&a4[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___titleLabel] = 0;
  *(_QWORD *)&a4[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___subTitleLabel] = 0;
  *(_QWORD *)&a4[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___scrollView] = 0;
  *(_QWORD *)&a4[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___mainStackView] = 0;
  *(_QWORD *)&a4[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___primaryButton] = 0;
  *(_QWORD *)&a4[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___secondaryButton] = 0;
  *(_QWORD *)&a4[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___tertiaryButton] = 0;
  v12[4] = &off_24D11C040;
  *(_QWORD *)&a4[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___footerCaption] = 0;
  *(_QWORD *)&a4[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___footerCaptionSpacer] = 0;
  v12[0] = a1;
  v12[1] = a2;
  *(_QWORD *)&a4[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_cancelButton] = 0;
  v12[2] = a3;
  v12[3] = &type metadata for IdentityProofingReviewSubmissionViewConfiguration;
  *(_QWORD *)&a4[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___headerView] = 0;
  *(_QWORD *)&a4[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___imageView] = 0;
  sub_213F5F2B8((uint64_t)v12, (uint64_t)&a4[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_configuration]);
  v11.receiver = a4;
  v11.super_class = (Class)type metadata accessor for IdentityProofingViewController();
  v9 = objc_msgSendSuper2(&v11, sel_initWithNibName_bundle_, 0, 0);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v9;
}

id sub_213FDFA9C(uint64_t a1, uint64_t a2, char *a3)
{
  char *v4;
  char *v5;
  char *v6;
  char *v7;
  id v8;
  objc_super v10;
  _QWORD v11[5];

  v4 = &a3[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_primaryButtonTargetAction];
  *(_QWORD *)v4 = 0;
  *((_QWORD *)v4 + 1) = 0;
  v5 = &a3[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_secondaryButtonTargetAction];
  *(_QWORD *)v5 = 0;
  *((_QWORD *)v5 + 1) = 0;
  v6 = &a3[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_cancelButtonTargetAction];
  *(_QWORD *)v6 = 0;
  *((_QWORD *)v6 + 1) = 0;
  v7 = &a3[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_tertiaryButtonTargetAction];
  *(_QWORD *)v7 = 0;
  *((_QWORD *)v7 + 1) = 0;
  *(_QWORD *)&a3[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___bottomTray] = 0;
  *(_QWORD *)&a3[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___textContainerStackView] = 0;
  *(_QWORD *)&a3[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___titleLabel] = 0;
  *(_QWORD *)&a3[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___subTitleLabel] = 0;
  *(_QWORD *)&a3[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___scrollView] = 0;
  *(_QWORD *)&a3[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___mainStackView] = 0;
  *(_QWORD *)&a3[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___primaryButton] = 0;
  *(_QWORD *)&a3[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___secondaryButton] = 0;
  *(_QWORD *)&a3[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___tertiaryButton] = 0;
  *(_QWORD *)&a3[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___footerCaption] = 0;
  *(_QWORD *)&a3[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___footerCaptionSpacer] = 0;
  v11[3] = &type metadata for IDScanViewConfiguration;
  v11[4] = &off_24D11A270;
  *(_QWORD *)&a3[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_cancelButton] = 0;
  v11[0] = a1;
  v11[1] = a2;
  *(_QWORD *)&a3[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___headerView] = 0;
  *(_QWORD *)&a3[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___imageView] = 0;
  sub_213F5F2B8((uint64_t)v11, (uint64_t)&a3[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_configuration]);
  v10.receiver = a3;
  v10.super_class = (Class)type metadata accessor for IdentityProofingViewController();
  v8 = objc_msgSendSuper2(&v10, sel_initWithNibName_bundle_, 0, 0);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v11);
  return v8;
}

id sub_213FDFC18(char *a1)
{
  char *v2;
  char *v3;
  char *v4;
  char *v5;
  id v6;
  objc_super v8;
  _BYTE v9[24];
  ValueMetadata *v10;
  _UNKNOWN **v11;

  v2 = &a1[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_primaryButtonTargetAction];
  *(_QWORD *)v2 = 0;
  *((_QWORD *)v2 + 1) = 0;
  v3 = &a1[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_secondaryButtonTargetAction];
  *(_QWORD *)v3 = 0;
  *((_QWORD *)v3 + 1) = 0;
  v4 = &a1[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_cancelButtonTargetAction];
  *(_QWORD *)v4 = 0;
  *((_QWORD *)v4 + 1) = 0;
  v5 = &a1[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_tertiaryButtonTargetAction];
  *(_QWORD *)v5 = 0;
  *((_QWORD *)v5 + 1) = 0;
  *(_QWORD *)&a1[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___bottomTray] = 0;
  *(_QWORD *)&a1[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___textContainerStackView] = 0;
  *(_QWORD *)&a1[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___titleLabel] = 0;
  *(_QWORD *)&a1[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___subTitleLabel] = 0;
  *(_QWORD *)&a1[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___scrollView] = 0;
  *(_QWORD *)&a1[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___mainStackView] = 0;
  *(_QWORD *)&a1[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___primaryButton] = 0;
  *(_QWORD *)&a1[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___secondaryButton] = 0;
  *(_QWORD *)&a1[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___tertiaryButton] = 0;
  *(_QWORD *)&a1[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___footerCaption] = 0;
  *(_QWORD *)&a1[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___footerCaptionSpacer] = 0;
  *(_QWORD *)&a1[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_cancelButton] = 0;
  v10 = &type metadata for ProvideFeedbackViewConfiguration;
  v11 = &off_24D119B90;
  *(_QWORD *)&a1[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___headerView] = 0;
  *(_QWORD *)&a1[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___imageView] = 0;
  sub_213F5F2B8((uint64_t)v9, (uint64_t)&a1[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_configuration]);
  v8.receiver = a1;
  v8.super_class = (Class)type metadata accessor for IdentityProofingViewController();
  v6 = objc_msgSendSuper2(&v8, sel_initWithNibName_bundle_, 0, 0);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);
  return v6;
}

id sub_213FDFD90(uint64_t a1, char *a2)
{
  char *v3;
  char *v4;
  char *v5;
  char *v6;
  id v7;
  objc_super v9;
  _QWORD v10[5];

  v3 = &a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_primaryButtonTargetAction];
  *(_QWORD *)v3 = 0;
  *((_QWORD *)v3 + 1) = 0;
  v4 = &a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_secondaryButtonTargetAction];
  *(_QWORD *)v4 = 0;
  *((_QWORD *)v4 + 1) = 0;
  v5 = &a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_cancelButtonTargetAction];
  *(_QWORD *)v5 = 0;
  *((_QWORD *)v5 + 1) = 0;
  v6 = &a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_tertiaryButtonTargetAction];
  *(_QWORD *)v6 = 0;
  *((_QWORD *)v6 + 1) = 0;
  *(_QWORD *)&a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___bottomTray] = 0;
  *(_QWORD *)&a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___textContainerStackView] = 0;
  *(_QWORD *)&a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___titleLabel] = 0;
  *(_QWORD *)&a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___subTitleLabel] = 0;
  *(_QWORD *)&a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___scrollView] = 0;
  *(_QWORD *)&a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___mainStackView] = 0;
  *(_QWORD *)&a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___primaryButton] = 0;
  *(_QWORD *)&a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___secondaryButton] = 0;
  *(_QWORD *)&a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___tertiaryButton] = 0;
  *(_QWORD *)&a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___footerCaption] = 0;
  v10[4] = &off_24D11B560;
  *(_QWORD *)&a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___footerCaptionSpacer] = 0;
  *(_QWORD *)&a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_cancelButton] = 0;
  v10[3] = &type metadata for UsingYourIDConfiguration;
  v10[0] = a1;
  *(_QWORD *)&a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___headerView] = 0;
  *(_QWORD *)&a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController____lazy_storage___imageView] = 0;
  sub_213F5F2B8((uint64_t)v10, (uint64_t)&a2[OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingViewController_configuration]);
  v9.receiver = a2;
  v9.super_class = (Class)type metadata accessor for IdentityProofingViewController();
  v7 = objc_msgSendSuper2(&v9, sel_initWithNibName_bundle_, 0, 0);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v10);
  return v7;
}

uint64_t sub_213FDFF10()
{
  uint64_t v0;

  swift_release();

  swift_release();
  swift_release();
  return swift_deallocObject();
}

id sub_213FDFF4C(uint64_t a1)
{
  objc_class *v2;
  char *v3;
  objc_super v5;

  v2 = (objc_class *)type metadata accessor for IdentityProofingAddedToWalletViewController();
  v3 = (char *)objc_allocWithZone(v2);
  *(_QWORD *)&v3[OBJC_IVAR____TtC9CoreIDVUI43IdentityProofingAddedToWalletViewController____lazy_storage___titleLabel] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC9CoreIDVUI43IdentityProofingAddedToWalletViewController____lazy_storage___primaryLabel] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC9CoreIDVUI43IdentityProofingAddedToWalletViewController____lazy_storage___secondaryLabel] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC9CoreIDVUI43IdentityProofingAddedToWalletViewController____lazy_storage___primaryButton] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC9CoreIDVUI43IdentityProofingAddedToWalletViewController____lazy_storage___imageView] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC9CoreIDVUI43IdentityProofingAddedToWalletViewController_proofingFlowManager] = a1;
  v5.receiver = v3;
  v5.super_class = v2;
  return objc_msgSendSuper2(&v5, sel_initWithNibName_bundle_, 0, 0);
}

ValueMetadata *type metadata accessor for DigitalPresentmentRootView()
{
  return &type metadata for DigitalPresentmentRootView;
}

uint64_t sub_213FDFFF0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_213FE0000@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v23[4];

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D607E0);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)v23 - v8;
  v10 = sub_213FF8EF4();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  v23[1] = a1;
  sub_213F55EC8();
  sub_213FF758C();
  swift_release();
  v14 = a1 + OBJC_IVAR____TtC9CoreIDVUI31DigitalPresentmentRootViewModel__displayConfiguration;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, v14, v10);
  v15 = sub_213FF8E4C();
  v17 = v16;
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  if (v17)
  {
    v18 = sub_213F526C8();
    v19 = sub_213F52A70() & 1;
  }
  else
  {
    v15 = 0;
    v18 = 0;
    v19 = 0;
  }
  *(_QWORD *)v9 = sub_213FF90E0();
  *((_QWORD *)v9 + 1) = 0x4020000000000000;
  v9[16] = 0;
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D607E8);
  sub_213FE023C(a1, (uint64_t)&v9[*(int *)(v20 + 44)]);
  sub_213F4531C((uint64_t)v9, (uint64_t)v7, &qword_254D607E0);
  *(_QWORD *)a2 = v15;
  *(_QWORD *)(a2 + 8) = v17;
  *(_QWORD *)(a2 + 16) = v18;
  *(_BYTE *)(a2 + 24) = v19;
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D607F0);
  sub_213F4531C((uint64_t)v7, a2 + *(int *)(v21 + 48), &qword_254D607E0);
  sub_213FE0784(v15, v17);
  sub_213F4CF1C((uint64_t)v9, &qword_254D607E0);
  sub_213F4CF1C((uint64_t)v7, &qword_254D607E0);
  return sub_213FE07B4(v15, v17);
}

uint64_t sub_213FE023C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
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
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(char *, uint64_t);
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t KeyPath;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;

  v47 = a2;
  v3 = type metadata accessor for DigitalPresentmentPassView(0);
  v4 = *(_QWORD *)(v3 - 8);
  v45 = v3;
  v46 = v4;
  MEMORY[0x24BDAC7A8](v3);
  v42 = (uint64_t *)((char *)&v41 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  v6 = sub_213FF8DD4();
  v43 = *(_QWORD *)(v6 - 8);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v41 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v41 - v10;
  v12 = sub_213FF8EF4();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v41 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D607F8);
  v17 = MEMORY[0x24BDAC7A8](v16);
  v44 = (uint64_t)&v41 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)&v41 - v19;
  swift_getKeyPath();
  v48 = a1;
  sub_213F55EC8();
  sub_213FF758C();
  swift_release();
  v21 = a1 + OBJC_IVAR____TtC9CoreIDVUI31DigitalPresentmentRootViewModel__displayConfiguration;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v15, v21, v12);
  sub_213FF8EA0();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  v22 = v43;
  (*(void (**)(char *, _QWORD, uint64_t))(v43 + 104))(v9, *MEMORY[0x24BE1C400], v6);
  LOBYTE(v21) = sub_213FF8DC8();
  v23 = *(void (**)(char *, uint64_t))(v22 + 8);
  v23(v9, v6);
  v23(v11, v6);
  if ((v21 & 1) != 0)
  {
    v24 = sub_213F53474();
    v26 = v25;
    v27 = sub_213F5384C();
    v29 = v28;
    v30 = sub_213F52E40();
    KeyPath = swift_getKeyPath();
    v32 = (uint64_t)v42;
    *v42 = KeyPath;
    __swift_instantiateConcreteTypeFromMangledName(&qword_254D5CFF8);
    swift_storeEnumTagMultiPayload();
    v33 = v45;
    v34 = (uint64_t *)(v32 + *(int *)(v45 + 20));
    *v34 = v24;
    v34[1] = v26;
    v35 = (uint64_t *)(v32 + *(int *)(v33 + 24));
    *v35 = v27;
    v35[1] = v29;
    *(_QWORD *)(v32 + *(int *)(v33 + 28)) = v30;
    sub_213FE07EC(v32, (uint64_t)v20);
    v36 = 0;
    v37 = v33;
  }
  else
  {
    v36 = 1;
    v37 = v45;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v46 + 56))(v20, v36, 1, v37);
  v38 = v44;
  sub_213F4531C((uint64_t)v20, v44, &qword_254D607F8);
  v39 = v47;
  sub_213F4531C(v38, v47, &qword_254D607F8);
  *(_QWORD *)(v39 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254D60800) + 48)) = a1;
  swift_retain_n();
  sub_213F4CF1C((uint64_t)v20, &qword_254D607F8);
  swift_release();
  return sub_213F4CF1C(v38, &qword_254D607F8);
}

uint64_t sub_213FE05B4@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  char *v13;
  uint64_t KeyPath;
  uint64_t v15;
  uint64_t v17;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D607C0);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D607C8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *v1;
  *(_QWORD *)v5 = sub_213FF90D4();
  *((_QWORD *)v5 + 1) = 0x403D000000000000;
  v5[16] = 0;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D607D0);
  sub_213FE0000(v9, (uint64_t)&v5[*(int *)(v10 + 44)]);
  v11 = sub_213FF92B4();
  v12 = sub_213FF9140();
  sub_213F4531C((uint64_t)v5, (uint64_t)v8, &qword_254D607C0);
  v13 = &v8[*(int *)(v6 + 36)];
  *(_QWORD *)v13 = v11;
  v13[8] = v12;
  sub_213F4CF1C((uint64_t)v5, &qword_254D607C0);
  KeyPath = swift_getKeyPath();
  sub_213F4531C((uint64_t)v8, a1, &qword_254D607C8);
  v15 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254D607D8) + 36);
  *(_QWORD *)v15 = KeyPath;
  *(_QWORD *)(v15 + 8) = 0;
  *(_BYTE *)(v15 + 16) = 1;
  return sub_213F4CF1C((uint64_t)v8, &qword_254D607C8);
}

uint64_t sub_213FE0720@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  char v3;

  result = sub_213FF9068();
  *(_QWORD *)a1 = result;
  *(_BYTE *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_213FE0750()
{
  return sub_213FF9074();
}

uint64_t sub_213FE0784(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRetain();
    return swift_retain();
  }
  return result;
}

uint64_t sub_213FE07B4(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRelease();
    return swift_release();
  }
  return result;
}

uint64_t sub_213FE07EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for DigitalPresentmentPassView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_213FE0834()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254D60808;
  if (!qword_254D60808)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254D607D8);
    v2[0] = sub_213FE08B8();
    v2[1] = sub_213F58F08(&qword_254D60820, &qword_254D60828, MEMORY[0x24BDF1028]);
    result = MEMORY[0x2199C80A8](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254D60808);
  }
  return result;
}

unint64_t sub_213FE08B8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254D60810;
  if (!qword_254D60810)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254D607C8);
    v2[0] = sub_213F58F08(&qword_254D60818, &qword_254D607C0, MEMORY[0x24BDF4700]);
    v2[1] = sub_213F58F08(&qword_254D602A0, &qword_254D602A8, MEMORY[0x24BDF06D0]);
    result = MEMORY[0x2199C80A8](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254D60810);
  }
  return result;
}

uint64_t IdentityDocumentPresentmentConsentView.relyingParty.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(type metadata accessor for IdentityDocumentPresentmentConsentView() + 20);
  return sub_213FE09C0(v3, a1);
}

uint64_t type metadata accessor for IdentityDocumentPresentmentConsentView()
{
  uint64_t result;

  result = qword_254D60888;
  if (!qword_254D60888)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_213FE09C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D5CB50);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_213FE0A08(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v6;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D5CB50);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_213FE09C0(a1, (uint64_t)v4);
  return IdentityDocumentPresentmentConsentView.relyingParty.setter((uint64_t)v4);
}

uint64_t IdentityDocumentPresentmentConsentView.relyingParty.setter(uint64_t a1)
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
  _QWORD v13[3];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D5CB50);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_213FF8D80();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = (uint64_t)v1 + *(int *)(type metadata accessor for IdentityDocumentPresentmentConsentView() + 20);
  sub_213FE0BDC(a1, v10);
  sub_213FE09C0(v10, (uint64_t)v5);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
    sub_213FE0C24((uint64_t)v5);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v9, v5, v6);
    v11 = v1[1];
    v13[1] = *v1;
    v13[2] = v11;
    __swift_instantiateConcreteTypeFromMangledName(&qword_254D5D990);
    sub_213FF9320();
    sub_213F54120();
    swift_release();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  return sub_213FE0C24(a1);
}

uint64_t sub_213FE0BDC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D5CB50);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t sub_213FE0C24(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D5CB50);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void (*IdentityDocumentPresentmentConsentView.relyingParty.modify(_QWORD *a1))(void **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = malloc(0x48uLL);
  *a1 = v3;
  v3[3] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D5CB50);
  v3[4] = malloc(*(_QWORD *)(*(_QWORD *)(v4 - 8) + 64));
  v5 = sub_213FF8D80();
  v3[5] = v5;
  v6 = *(_QWORD *)(v5 - 8);
  v3[6] = v6;
  v3[7] = malloc(*(_QWORD *)(v6 + 64));
  *((_DWORD *)v3 + 16) = *(_DWORD *)(type metadata accessor for IdentityDocumentPresentmentConsentView() + 20);
  return sub_213FE0CF4;
}

void sub_213FE0CF4(void **a1, char a2)
{
  int *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  void *v11;

  v2 = (int *)*a1;
  if ((a2 & 1) == 0)
  {
    v3 = *((_QWORD *)v2 + 5);
    v4 = *((_QWORD *)v2 + 6);
    v5 = *((_QWORD *)v2 + 4);
    sub_213FE09C0(*((_QWORD *)v2 + 3) + v2[16], v5);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(v5, 1, v3) == 1)
    {
      sub_213FE0C24(*((_QWORD *)v2 + 4));
    }
    else
    {
      v7 = *((_QWORD *)v2 + 6);
      v6 = *((_QWORD *)v2 + 7);
      v8 = *((_QWORD *)v2 + 5);
      v9 = (_QWORD *)*((_QWORD *)v2 + 3);
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v7 + 32))(v6, *((_QWORD *)v2 + 4), v8);
      v10 = v9[1];
      *(_QWORD *)v2 = *v9;
      *((_QWORD *)v2 + 1) = v10;
      __swift_instantiateConcreteTypeFromMangledName(&qword_254D5D990);
      sub_213FF9320();
      sub_213F54120();
      swift_release();
      (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
    }
  }
  v11 = (void *)*((_QWORD *)v2 + 4);
  free(*((void **)v2 + 7));
  free(v11);
  free(v2);
}

uint64_t IdentityDocumentPresentmentConsentView.init(elementCategoryGroups:relyingParty:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
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
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, uint64_t, uint64_t, uint64_t);
  void (*v26)(char *, uint64_t, uint64_t);
  uint64_t v27;
  char *v28;
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
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t result;
  uint64_t *v44;
  char *v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  uint64_t *v57;
  uint64_t v58;

  v58 = a2;
  v53 = a1;
  v4 = sub_213FF8D80();
  v46 = *(_QWORD *)(v4 - 8);
  v5 = v46;
  MEMORY[0x24BDAC7A8](v4);
  v45 = (char *)&v45 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_213FF8D5C();
  MEMORY[0x24BDAC7A8](v7);
  v56 = (char *)&v45 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D5CB50);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v52 = (char *)&v45 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v50 = (char *)&v45 - v12;
  v13 = sub_213FF8E70();
  v48 = *(_QWORD *)(v13 - 8);
  v49 = v13;
  MEMORY[0x24BDAC7A8](v13);
  v47 = (char *)&v45 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_213FF8DD4();
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v45 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = sub_213FF8E1C();
  v20 = *(_QWORD *)(v19 - 8);
  MEMORY[0x24BDAC7A8](v19);
  v22 = (char *)&v45 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = *(int *)(type metadata accessor for IdentityDocumentPresentmentConsentView() + 20);
  v57 = a3;
  v24 = (uint64_t)a3 + v23;
  v25 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 56);
  v25(v24, 1, 1, v4);
  v54 = v24;
  sub_213FE0BDC(v58, v24);
  v51 = v20;
  v26 = *(void (**)(char *, uint64_t, uint64_t))(v20 + 16);
  v27 = v53;
  v55 = v19;
  v26(v22, v53, v19);
  (*(void (**)(char *, _QWORD, uint64_t))(v16 + 104))(v18, *MEMORY[0x24BE1C408], v15);
  v28 = v47;
  (*(void (**)(char *, _QWORD, uint64_t))(v48 + 104))(v47, *MEMORY[0x24BE1C4A0], v49);
  v29 = sub_213FF8E10();
  LODWORD(v19) = v30 & 1;
  v31 = (uint64_t)v50;
  v25((uint64_t)v50, 1, 1, v4);
  v32 = v27;
  v33 = (uint64_t)v56;
  sub_213FF8DE0();
  v34 = (uint64_t)v22;
  v35 = v46;
  v36 = (uint64_t)v18;
  v37 = (uint64_t)v52;
  v38 = (uint64_t)v28;
  v39 = v4;
  v40 = v58;
  v41 = sub_213F57050(v34, v36, v38, v29, v19, v31, 0, 0, v33);
  sub_213FE09C0(v40, v37);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v35 + 48))(v37, 1, v39) == 1)
  {
    (*(void (**)(uint64_t, uint64_t))(v51 + 8))(v32, v55);
    sub_213FE0C24(v37);
  }
  else
  {
    v42 = v45;
    (*(void (**)(char *, uint64_t, uint64_t))(v35 + 32))(v45, v37, v39);
    sub_213F54120();
    (*(void (**)(uint64_t, uint64_t))(v51 + 8))(v32, v55);
    (*(void (**)(char *, uint64_t))(v35 + 8))(v42, v39);
  }
  result = sub_213FE11AC(v40, v54);
  v44 = v57;
  *v57 = v41;
  v44[1] = 0;
  return result;
}

uint64_t IdentityDocumentPresentmentConsentView.body.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  __swift_instantiateConcreteTypeFromMangledName(&qword_254D5D990);
  result = sub_213FF9320();
  *a1 = v3;
  return result;
}

uint64_t sub_213FE11AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D5CB50);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_213FE11F4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_213FE1204@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;

  v3 = a1 + *(int *)(type metadata accessor for IdentityDocumentPresentmentConsentView() + 20);
  return sub_213FE09C0(v3, a2);
}

uint64_t *initializeBufferWithCopyOfBuffer for IdentityDocumentPresentmentConsentView(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int (*v11)(char *, uint64_t, uint64_t);
  uint64_t v12;

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
    a1[1] = a2[1];
    v6 = *(int *)(a3 + 20);
    v7 = (char *)a1 + v6;
    v8 = (char *)a2 + v6;
    v9 = sub_213FF8D80();
    v10 = *(_QWORD *)(v9 - 8);
    v11 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48);
    swift_retain();
    swift_retain();
    if (v11(v8, 1, v9))
    {
      v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D5CB50);
      memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v7, v8, v9);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
    }
  }
  return v5;
}

uint64_t destroy for IdentityDocumentPresentmentConsentView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;

  swift_release();
  swift_release();
  v4 = a1 + *(int *)(a2 + 20);
  v5 = sub_213FF8D80();
  v6 = *(_QWORD *)(v5 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  return result;
}

_QWORD *initializeWithCopy for IdentityDocumentPresentmentConsentView(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int (*v10)(char *, uint64_t, uint64_t);
  uint64_t v11;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = *(int *)(a3 + 20);
  v6 = (char *)a1 + v5;
  v7 = (char *)a2 + v5;
  v8 = sub_213FF8D80();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48);
  swift_retain();
  swift_retain();
  if (v10(v7, 1, v8))
  {
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D5CB50);
    memcpy(v6, v7, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v6, v7, v8);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v9 + 56))(v6, 0, 1, v8);
  }
  return a1;
}

_QWORD *assignWithCopy for IdentityDocumentPresentmentConsentView(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(char *, uint64_t, uint64_t);
  int v12;
  int v13;
  uint64_t v14;

  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_213FF8D80();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  v12 = v11(v7, 1, v9);
  v13 = v11(v8, 1, v9);
  if (!v12)
  {
    if (!v13)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 24))(v7, v8, v9);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v10 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v13)
  {
LABEL_6:
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D5CB50);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v7, v8, v9);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  return a1;
}

_OWORD *initializeWithTake for IdentityDocumentPresentmentConsentView(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_213FF8D80();
  v8 = *(_QWORD *)(v7 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7))
  {
    v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D5CB50);
    memcpy(v5, v6, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v5, v6, v7);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v5, 0, 1, v7);
  }
  return a1;
}

_QWORD *assignWithTake for IdentityDocumentPresentmentConsentView(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(char *, uint64_t, uint64_t);
  int v12;
  int v13;
  uint64_t v14;

  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  swift_release();
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_213FF8D80();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  v12 = v11(v7, 1, v9);
  v13 = v11(v8, 1, v9);
  if (!v12)
  {
    if (!v13)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 40))(v7, v8, v9);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v10 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v13)
  {
LABEL_6:
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D5CB50);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v7, v8, v9);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for IdentityDocumentPresentmentConsentView()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_213FE17C0(char *a1, uint64_t a2, uint64_t a3)
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
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D5CB50);
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(&a1[*(int *)(a3 + 20)], a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for IdentityDocumentPresentmentConsentView()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

char *sub_213FE184C(char *result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D5CB50);
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 20)], a2, a2, v7);
  }
  return result;
}

void sub_213FE18C4()
{
  unint64_t v0;

  sub_213FE1938();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void sub_213FE1938()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_254D60898[0])
  {
    sub_213FF8D80();
    v0 = sub_213FF9710();
    if (!v1)
      atomic_store(v0, qword_254D60898);
  }
}

uint64_t sub_213FE1990(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  NSObject *v10;
  os_log_type_t v11;
  _BOOL4 v12;
  uint64_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v3 = v2;
  v6 = sub_213FF8D38();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_213FF7778();
  swift_bridgeObjectRetain_n();
  v10 = sub_213FF8D2C();
  v11 = sub_213FF95C0();
  v12 = os_log_type_enabled(v10, v11);
  v21 = a1;
  if (v12)
  {
    v20 = v3;
    v13 = swift_slowAlloc();
    v19 = v6;
    v14 = (uint8_t *)v13;
    v15 = swift_slowAlloc();
    v23 = v15;
    *(_DWORD *)v14 = 136315138;
    swift_bridgeObjectRetain();
    v22 = sub_213F7DD50(a1, a2, &v23);
    v3 = v20;
    sub_213FF971C();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_213F36000, v10, v11, "looking up text for %s", v14, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2199C815C](v15, -1, -1);
    MEMORY[0x2199C815C](v14, -1, -1);

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v19);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  if (!*(_QWORD *)(v3 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_textReplacementHelper))
    return 0;
  swift_retain();
  v16 = sub_213FF86C0();
  swift_release();
  return v16;
}

id sub_213FE1BAC(void *a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  BOOL v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  _DWORD v13[4];

  v4 = sub_213FF8D38();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_213FED140(a1);
  sub_213FF7778();
  v9 = sub_213FF8D2C();
  v10 = sub_213FF95C0();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v11 = 67109120;
    v13[3] = v8;
    sub_213FF971C();
    _os_log_impl(&dword_213F36000, v9, v10, "shouldAnimate while pushing viewcontroller on the navigation stack : %{BOOL}d", v11, 8u);
    MEMORY[0x2199C815C](v11, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return objc_msgSend(a2, sel_pushViewController_animated_, a1, v8);
}

void sub_213FE1D04(void *a1, char a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint8_t *v24;
  uint8_t *v25;
  void *v26;
  id v27;
  char *v28;
  void (**v29)();
  uint64_t v30;
  char *v31;
  uint64_t v32;
  id v33;
  char v34;
  uint64_t v35;
  id v36;

  v5 = v4;
  v10 = sub_213FF8D38();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v35 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  sub_213F68E18();
  v36 = v14;
  swift_release();
  type metadata accessor for IdentityProofingTCViewController();
  v15 = swift_dynamicCastClass();
  if (!v15)
  {
    type metadata accessor for IdentityProofingErrorViewController();
    if (swift_dynamicCastClass())
    {
      v32 = sub_213FEF240();

      v33 = (id)v32;
      if (!a1)
        goto LABEL_18;
    }
    else
    {
      v33 = v36;
      if (!a1)
      {
LABEL_18:

        return;
      }
    }
    v36 = v33;
    if (a2 == 2)
      v34 = sub_213FED140(v33);
    else
      v34 = a2 & 1;
    sub_213FA5390((uint64_t)v36, v34 & 1, a3, a4);
    v33 = v36;
    goto LABEL_18;
  }
  v16 = *(void **)(v4 + 168);
  *(_QWORD *)(v5 + 168) = v15;
  v17 = v36;

  if (*(_QWORD *)(v5 + 168))
    swift_weakAssign();
  sub_213FF7778();
  v18 = sub_213FF8D2C();
  v19 = sub_213FF95C0();
  if (os_log_type_enabled(v18, v19))
  {
    v20 = (uint8_t *)swift_slowAlloc();
    v36 = v17;
    v21 = a1;
    v22 = a3;
    v23 = a4;
    v24 = v20;
    *(_WORD *)v20 = 0;
    _os_log_impl(&dword_213F36000, v18, v19, "The page to show is termsAndConditions", v20, 2u);
    v25 = v24;
    a4 = v23;
    a3 = v22;
    a1 = v21;
    v17 = v36;
    MEMORY[0x2199C815C](v25, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  v26 = *(void **)(v5 + 168);
  if (v26)
  {
    v27 = v26;
    sub_213FA8464(a1, a3, a4);

    v28 = *(char **)(v5 + 168);
    if (v28)
    {
      v29 = (void (**)())&v28[OBJC_IVAR____TtC9CoreIDVUI32IdentityProofingTCViewController_agreeClicked];
      v30 = *(_QWORD *)&v28[OBJC_IVAR____TtC9CoreIDVUI32IdentityProofingTCViewController_agreeClicked];
      *v29 = sub_213FF4A44;
      v29[1] = (void (*)())v5;
      v31 = v28;
      swift_retain();
      sub_213F4BE68(v30);

    }
  }

}

uint64_t sub_213FE1FB4(uint64_t a1, void *a2)
{
  _QWORD *v3;
  id v4;

  if (!a2)
    return swift_continuation_throwingResume();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D5C028);
  swift_allocError();
  *v3 = a2;
  v4 = a2;
  return swift_continuation_throwingResumeWithError();
}

void sub_213FE2028(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t inited;
  void **v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  NSObject *v21;
  NSObject *v22;
  _QWORD *v23;
  uint8_t *v24;
  uint64_t v25;
  _QWORD *v26;
  uint8_t *v27;
  char *v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;

  v2 = sub_213FF8D38();
  v30 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  sub_213F68E18();
  v6 = v5;
  swift_release();
  v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD7A0]), sel_initWithRootViewController_, v6);
  v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD790]), sel_init);
  objc_msgSend(v8, sel_configureWithTransparentBackground);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D5DCC8);
  inited = swift_initStackObject();
  v10 = (void **)MEMORY[0x24BEBB368];
  *(_OWORD *)(inited + 16) = xmmword_213FFBF20;
  v11 = *v10;
  *(_QWORD *)(inited + 32) = *v10;
  v12 = (void *)objc_opt_self();
  v13 = v11;
  v14 = objc_msgSend(v12, sel_systemOrangeColor);
  *(_QWORD *)(inited + 64) = sub_213F3F7CC(0, (unint64_t *)&qword_254D5C900);
  *(_QWORD *)(inited + 40) = v14;
  sub_213F41484(inited);
  type metadata accessor for Key(0);
  sub_213F3B3C0((unint64_t *)&qword_254D5BC60, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_213FFBE10);
  v15 = (void *)sub_213FF93C8();
  swift_bridgeObjectRelease();
  objc_msgSend(v8, sel_setTitleTextAttributes_, v15);

  objc_msgSend(v7, sel_setModalPresentationStyle_, 1);
  objc_msgSend(v7, sel_setModalInPresentation_, 1);
  v16 = objc_msgSend(v7, sel_navigationBar);
  objc_msgSend(v16, sel_setStandardAppearance_, v8);

  sub_213FF7778();
  v17 = v6;
  v18 = sub_213FF8D2C();
  v19 = sub_213FF95C0();
  if (os_log_type_enabled(v18, v19))
  {
    v29 = a1;
    v20 = (uint8_t *)swift_slowAlloc();
    v26 = (_QWORD *)swift_slowAlloc();
    v27 = v20;
    *(_DWORD *)v20 = 138412290;
    v31 = v17;
    v21 = v17;
    v28 = v4;
    v22 = v21;
    a1 = v29;
    sub_213FF971C();
    v23 = v26;
    *v26 = v17;

    v24 = v27;
    v4 = v28;
    _os_log_impl(&dword_213F36000, v18, v19, "IdentityProofingFlowManager about to present: %@", v27, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_254D5CDD0);
    swift_arrayDestroy();
    MEMORY[0x2199C815C](v23, -1, -1);
    MEMORY[0x2199C815C](v24, -1, -1);
  }
  else
  {

    v18 = v17;
  }

  (*(void (**)(char *, uint64_t))(v30 + 8))(v4, v2);
  if (a1)
    objc_msgSend(a1, sel_presentViewController_animated_completion_, v7, 1, 0);

}

char *sub_213FE23E8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
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
  uint64_t v30;
  uint64_t v31;
  id v32;
  char *v33;
  uint64_t v34;
  uint64_t (**v35)();
  uint64_t v36;
  uint64_t v37;
  uint64_t (**v38)();
  uint64_t v39;
  uint64_t v41;
  uint64_t v42;

  v1 = v0;
  v2 = sub_213FF7EBC();
  if (!v3)
    v2 = 0;
  v4 = 0xE000000000000000;
  if (v3)
    v5 = v3;
  else
    v5 = 0xE000000000000000;
  v6 = sub_213FE1990(v2, v5);
  v8 = v7;
  swift_bridgeObjectRelease();
  v9 = (_QWORD *)sub_213FF7EEC();
  if (!v9)
    goto LABEL_15;
  if (!v9[2])
  {
    swift_bridgeObjectRelease();
LABEL_15:
    v14 = 0;
    goto LABEL_16;
  }
  v10 = v9[4];
  v11 = v9[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v12 = sub_213FE1990(v10, v11);
  v4 = v13;
  swift_bridgeObjectRelease();
  if (v4)
    v14 = v12;
  else
    v14 = 0;
  if (!v4)
    v4 = 0xE000000000000000;
LABEL_16:
  v15 = (_QWORD *)sub_213FF7EEC();
  v42 = v14;
  if (!v15)
  {
LABEL_25:
    v41 = 0;
    v22 = 0xE000000000000000;
    goto LABEL_26;
  }
  if (v15[2] < 2uLL)
  {
    swift_bridgeObjectRelease();
    goto LABEL_25;
  }
  v16 = v15[6];
  v17 = v15[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v18 = sub_213FE1990(v16, v17);
  v20 = v19;
  swift_bridgeObjectRelease();
  if (v20)
    v21 = v18;
  else
    v21 = 0;
  v41 = v21;
  if (v20)
    v22 = v20;
  else
    v22 = 0xE000000000000000;
LABEL_26:
  if (!v8)
  {
    v8 = 0xE000000000000000;
    v6 = 0;
  }
  v23 = sub_213FF7E74();
  if (v24)
  {
    v25 = v24;
  }
  else
  {
    v23 = 0;
    v25 = 0xE000000000000000;
  }
  v26 = sub_213FE1990(v23, v25);
  v28 = v27;
  swift_bridgeObjectRelease();
  if (v28)
    v29 = v26;
  else
    v29 = 0;
  if (v28)
    v30 = v28;
  else
    v30 = 0xE000000000000000;
  type metadata accessor for IdentityProofingNavigationControllerHelper();
  v31 = swift_allocObject();
  v32 = objc_allocWithZone((Class)type metadata accessor for IdentityErrorViewController());
  swift_retain();
  v33 = (char *)sub_213FB35DC(v6, v8, v42, v4, v29, v30, v41, v22, v31, v1);
  swift_release();
  swift_release();
  v34 = swift_allocObject();
  swift_weakInit();
  v35 = (uint64_t (**)())&v33[OBJC_IVAR____TtC9CoreIDVUI27IdentityErrorViewController_secondaryButtonTargetAction];
  v36 = *(_QWORD *)&v33[OBJC_IVAR____TtC9CoreIDVUI27IdentityErrorViewController_secondaryButtonTargetAction];
  *v35 = sub_213FF4B80;
  v35[1] = (uint64_t (*)())v34;
  sub_213F4BE68(v36);
  v37 = swift_allocObject();
  swift_weakInit();
  v38 = (uint64_t (**)())&v33[OBJC_IVAR____TtC9CoreIDVUI27IdentityErrorViewController_primaryButtonTargetAction];
  v39 = *(_QWORD *)&v33[OBJC_IVAR____TtC9CoreIDVUI27IdentityErrorViewController_primaryButtonTargetAction];
  *v38 = sub_213FF4B88;
  v38[1] = (uint64_t (*)())v37;
  sub_213F4BE68(v39);
  sub_213FE5680();
  return v33;
}

uint64_t sub_213FE269C(void *a1)
{
  uint64_t v1;
  uint64_t v2;
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
  char *v15;
  char *v16;
  uint64_t v17;
  char *v18;
  id v19;
  id v20;
  id v21;
  NSObject *v22;
  os_log_type_t v23;
  uint64_t v24;
  uint8_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  void (*v32)(char *, uint64_t);
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  uint64_t v37;
  char *v38;
  NSObject *v39;
  os_log_type_t v40;
  char *v41;
  uint8_t *v42;
  uint8_t *v43;
  uint64_t v44;
  uint64_t v45;
  int v46;
  NSObject *v47;
  os_log_type_t v48;
  char *v49;
  uint8_t *v50;
  uint8_t *v51;
  _QWORD v52[2];
  char *v53;
  char *v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D5C398);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v52 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)v52 - v8;
  v10 = sub_213FF8D38();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v13 = MEMORY[0x24BDAC7A8](v12);
  v14 = MEMORY[0x24BDAC7A8](v13);
  v18 = (char *)v52 - v17;
  if (!a1)
    return sub_213FEF240();
  v53 = v16;
  v54 = v7;
  v55 = v15;
  v56 = v14;
  v19 = a1;
  sub_213FF7778();
  v20 = a1;
  v21 = a1;
  v22 = sub_213FF8D2C();
  v23 = sub_213FF95C0();
  if (os_log_type_enabled(v22, v23))
  {
    v24 = swift_slowAlloc();
    v52[1] = v2;
    v25 = (uint8_t *)v24;
    v26 = swift_slowAlloc();
    v52[0] = v9;
    v27 = v26;
    v58 = v26;
    *(_DWORD *)v25 = 136315138;
    swift_getErrorValue();
    v28 = sub_213FF9950();
    v57 = sub_213F7DD50(v28, v29, &v58);
    sub_213FF971C();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_213F36000, v22, v23, "Received an error from proofing %s", v25, 0xCu);
    swift_arrayDestroy();
    v30 = v27;
    v9 = (char *)v52[0];
    MEMORY[0x2199C815C](v30, -1, -1);
    MEMORY[0x2199C815C](v25, -1, -1);
  }
  else
  {

  }
  v32 = *(void (**)(char *, uint64_t))(v11 + 8);
  v33 = v56;
  v32(v18, v56);
  swift_getErrorValue();
  sub_213FF995C();
  v34 = sub_213FF8810();
  v35 = *(_QWORD *)(v34 - 8);
  v36 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v35 + 48))(v9, 1, v34);
  v37 = (uint64_t)v54;
  v38 = v55;
  if (v36 != 1)
  {
    sub_213F4531C((uint64_t)v9, (uint64_t)v54, &qword_254D5C398);
    v46 = (*(uint64_t (**)(uint64_t, uint64_t))(v35 + 88))(v37, v34);
    if (v46 == *MEMORY[0x24BE1DD20] || v46 == *MEMORY[0x24BE1DCF0])
      goto LABEL_18;
    if (v46 == *MEMORY[0x24BE1DD50])
    {
      sub_213FF7778();
      v47 = sub_213FF8D2C();
      v48 = sub_213FF95C0();
      if (os_log_type_enabled(v47, v48))
      {
        v49 = v9;
        v50 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v50 = 0;
        _os_log_impl(&dword_213F36000, v47, v48, "Received a provisioning identity failure error", v50, 2u);
        v51 = v50;
        v9 = v49;
        MEMORY[0x2199C815C](v51, -1, -1);
      }

      v32(v53, v33);
      v44 = sub_213FEF780();
      goto LABEL_10;
    }
    if (v46 == *MEMORY[0x24BE1DC48])
    {
LABEL_18:
      sub_213F4CF1C((uint64_t)v9, &qword_254D5C398);
      v45 = sub_213FEF240();

      return v45;
    }
    (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v37, v34);
  }
  sub_213FF7778();
  v39 = sub_213FF8D2C();
  v40 = sub_213FF95C0();
  if (os_log_type_enabled(v39, v40))
  {
    v41 = v9;
    v42 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v42 = 0;
    _os_log_impl(&dword_213F36000, v39, v40, "No specific error Received from proofing. Showing generic error", v42, 2u);
    v43 = v42;
    v9 = v41;
    MEMORY[0x2199C815C](v43, -1, -1);
  }

  v32(v38, v33);
  v44 = sub_213FEF240();
LABEL_10:
  v45 = v44;

  sub_213F4CF1C((uint64_t)v9, &qword_254D5C398);
  return v45;
}

uint64_t sub_213FE2B90(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
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
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;

  v3 = v2;
  v28 = (char *)a2;
  v25 = a1;
  v4 = sub_213FF9638();
  v26 = *(_QWORD *)(v4 - 8);
  v27 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_213FF9620();
  MEMORY[0x24BDAC7A8](v7);
  v8 = sub_213FF9398();
  MEMORY[0x24BDAC7A8](v8);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D5DF38);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for IdentityProofingLivenessVideoData(0);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = *(_QWORD *)(v2 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_attributeMessages);
  v16 = *(_QWORD *)(v2 + 176);
  v17 = *(_QWORD *)(v2 + 112);
  sub_213FB15D8(v25, (uint64_t)v14);
  v18 = (uint64_t)v28;
  v28 = v11;
  sub_213F4531C(v18, (uint64_t)v11, &qword_254D5DF38);
  v22 = sub_213F3F7CC(0, (unint64_t *)&qword_254D5CDB0);
  v24 = v16;
  swift_bridgeObjectRetain();
  v23 = v17;
  swift_unknownObjectRetain();
  v25 = v15;
  swift_bridgeObjectRetain();
  sub_213FF938C();
  v29 = MEMORY[0x24BEE4AF8];
  sub_213F3B3C0(&qword_254D5FF50, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688], MEMORY[0x24BEE5698]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D5FF58);
  sub_213FCC014(&qword_254D5FF60, &qword_254D5FF58);
  sub_213FF9788();
  (*(void (**)(char *, _QWORD, uint64_t))(v26 + 104))(v6, *MEMORY[0x24BEE5750], v27);
  v19 = sub_213FF9668();
  if (qword_254D5BA70 != -1)
    swift_once();
  v20 = qword_254D62FC0;
  type metadata accessor for IdentityProofingUploadsManager();
  swift_allocObject();
  swift_retain();
  swift_retain();
  *(_QWORD *)(v3 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_livenessVideoUploadsManager) = sub_213FAAD90(v25, v24, v23, v3, (uint64_t)v14, (uint64_t)v28, v19, v20);
  return swift_release();
}

uint64_t sub_213FE2EBC(void *a1)
{
  uint64_t v2;
  uint8_t *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  NSObject *v16;
  NSObject *v17;
  _QWORD *v18;
  uint8_t *v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v23;
  _QWORD *v24;
  NSObject *v25;
  _QWORD *v26;
  uint64_t v28;
  _QWORD *v29;
  uint8_t *v30;
  NSObject *v31;
  uint64_t v32;
  NSObject *v33;

  v2 = sub_213FF8D38();
  v3 = *(uint8_t **)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v28 - v7;
  v9 = objc_msgSend(a1, sel_navigationController);
  if (!v9)
    v9 = a1;
  v10 = -[NSObject presentingViewController](v9, sel_presentingViewController);
  if (v10)
  {
    v11 = v10;
    -[NSObject dismissViewControllerAnimated:completion:](v10, sel_dismissViewControllerAnimated_completion_, 1, 0);
    swift_retain();
    sub_213F69394();
    swift_release();
    sub_213FF7778();
    v12 = a1;
    v13 = sub_213FF8D2C();
    v14 = sub_213FF95C0();
    if (os_log_type_enabled(v13, v14))
    {
      v32 = v2;
      v15 = (uint8_t *)swift_slowAlloc();
      v29 = (_QWORD *)swift_slowAlloc();
      v30 = v15;
      *(_DWORD *)v15 = 138412290;
      v33 = v12;
      v16 = v12;
      v31 = v9;
      v17 = v16;
      v2 = v32;
      sub_213FF971C();
      v18 = v29;
      *v29 = v12;

      v19 = v30;
      _os_log_impl(&dword_213F36000, v13, v14, "IdentityProofingFlowManager dismissing %@ and reverting back to base view modal", v30, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_254D5CDD0);
      swift_arrayDestroy();
      MEMORY[0x2199C815C](v18, -1, -1);
      MEMORY[0x2199C815C](v19, -1, -1);

      v12 = v31;
    }
    else
    {

      v11 = v12;
    }
  }
  else
  {
    sub_213FF7778();
    v20 = a1;
    v12 = sub_213FF8D2C();
    v21 = sub_213FF95C0();
    if (os_log_type_enabled(v12, v21))
    {
      v22 = (uint8_t *)swift_slowAlloc();
      v23 = swift_slowAlloc();
      v32 = v2;
      v33 = v20;
      v24 = (_QWORD *)v23;
      v30 = v3;
      v31 = v9;
      *(_DWORD *)v22 = 138412290;
      v25 = v20;
      v3 = v30;
      sub_213FF971C();
      *v24 = v20;

      _os_log_impl(&dword_213F36000, v12, v21, "IdentityProofingFlowManager could not dismiss %@; not being presented",
        v22,
        0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_254D5CDD0);
      swift_arrayDestroy();
      v26 = v24;
      v2 = v32;
      MEMORY[0x2199C815C](v26, -1, -1);
      MEMORY[0x2199C815C](v22, -1, -1);
      v11 = v31;
    }
    else
    {

      v12 = v20;
      v11 = v9;
    }
    v8 = v6;
  }

  return (*((uint64_t (**)(char *, uint64_t))v3 + 1))(v8, v2);
}

uint64_t sub_213FE3258(void *a1)
{
  return sub_213FED27C(a1, 0x80000002140067E0, "Unable to show the Account Service unable alert as the server doesn't have the related fields in the config");
}

uint64_t sub_213FE3274(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
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
  char *v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t (*v30)(char *, uint64_t, uint64_t);
  int v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  char *v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  id v48;
  _QWORD *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  id v59;
  char *v60;
  _QWORD *v61;
  unint64_t v62;
  uint64_t v63;
  unint64_t v64;
  uint64_t v65;
  uint64_t result;
  uint64_t v67;
  unint64_t v68;
  uint64_t v69;
  char *v70;
  NSObject *v71;
  os_log_type_t v72;
  uint8_t *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  uint64_t v79;
  char *v80;
  uint64_t v81;
  char *v82;
  uint64_t v83;
  _QWORD aBlock[6];

  v77 = a2;
  v6 = sub_213FF8D38();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v74 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(qword_254D5D1D8);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v74 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x24BDAC7A8](v11);
  v16 = (char *)&v74 - v15;
  v17 = MEMORY[0x24BDAC7A8](v14);
  v19 = (char *)&v74 - v18;
  MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)&v74 - v20;
  v82 = (char *)v6;
  v83 = v3;
  v22 = *(_QWORD *)(v3 + 176);
  v81 = v7;
  v78 = a1;
  v79 = a3;
  if (v22 && *(_QWORD *)(v22 + 16))
  {
    swift_bridgeObjectRetain();
    v23 = sub_213F42568(0x4153487472656C61, 0xE900000000000032);
    if ((v24 & 1) != 0)
    {
      v25 = v23;
      v26 = *(_QWORD *)(v22 + 56);
      v27 = sub_213FF8690();
      v28 = *(_QWORD *)(v27 - 8);
      (*(void (**)(char *, unint64_t, uint64_t))(v28 + 16))(v21, v26 + *(_QWORD *)(v28 + 72) * v25, v27);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v28 + 56))(v21, 0, 1, v27);
    }
    else
    {
      v27 = sub_213FF8690();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 56))(v21, 1, 1, v27);
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    v27 = sub_213FF8690();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 56))(v21, 1, 1, v27);
  }
  sub_213F4531C((uint64_t)v21, (uint64_t)v19, qword_254D5D1D8);
  sub_213FF8690();
  v29 = *(_QWORD *)(v27 - 8);
  v30 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v29 + 48);
  v31 = v30(v19, 1, v27);
  v80 = v9;
  if (v31 == 1)
  {
    sub_213F4CF1C((uint64_t)v19, qword_254D5D1D8);
  }
  else
  {
    v32 = sub_213FF8660();
    v34 = v33;
    (*(void (**)(char *, uint64_t))(v29 + 8))(v19, v27);
    if (v34)
    {
      v76 = sub_213FE1990(v32, v34);
      v36 = v35;
      swift_bridgeObjectRelease();
      goto LABEL_13;
    }
  }
  v76 = 0;
  v36 = 0;
LABEL_13:
  sub_213F4531C((uint64_t)v21, (uint64_t)v16, qword_254D5D1D8);
  if (v30(v16, 1, v27) == 1)
  {
    sub_213F4CF1C((uint64_t)v16, qword_254D5D1D8);
  }
  else
  {
    v37 = (_QWORD *)sub_213FF8684();
    (*(void (**)(char *, uint64_t))(v29 + 8))(v16, v27);
    if (v37)
    {
      if (v37[2])
      {
        v38 = v21;
        v39 = v37[4];
        v40 = v37[5];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        v75 = sub_213FE1990(v39, v40);
        v42 = v41;
        v21 = v38;
        swift_bridgeObjectRelease();
        goto LABEL_20;
      }
      swift_bridgeObjectRelease();
    }
  }
  v75 = 0;
  v42 = 0;
LABEL_20:
  sub_213F4531C((uint64_t)v21, (uint64_t)v13, qword_254D5D1D8);
  if (v30(v13, 1, v27) == 1)
  {
    sub_213F4CF1C((uint64_t)v13, qword_254D5D1D8);
    v43 = 0;
    v44 = 0;
    if (!v36)
      goto LABEL_37;
    goto LABEL_22;
  }
  v60 = v21;
  v61 = (_QWORD *)sub_213FF866C();
  (*(void (**)(char *, uint64_t))(v29 + 8))(v13, v27);
  if (!v61)
    goto LABEL_35;
  v62 = v61[2];
  if (!v62)
  {
    swift_bridgeObjectRelease();
LABEL_35:
    v43 = 0;
    v44 = 0;
    goto LABEL_36;
  }
  v63 = v61[4];
  v64 = v61[5];
  swift_bridgeObjectRetain();
  sub_213FE1990(v63, v64);
  v44 = v65;
  result = swift_bridgeObjectRelease();
  if (!v44 || v62 <= 1)
  {
    swift_bridgeObjectRelease();
    v43 = 0;
LABEL_36:
    v21 = v60;
    if (!v36)
      goto LABEL_37;
LABEL_22:
    if (v42 && v44 && v43)
    {
      v45 = sub_213FF9428();
      v82 = v21;
      v46 = (void *)v45;
      swift_bridgeObjectRelease();
      v47 = (void *)sub_213FF9428();
      swift_bridgeObjectRelease();
      v48 = objc_msgSend((id)objc_opt_self(), sel_alertControllerWithTitle_message_preferredStyle_, v46, v47, 1);

      v49 = (_QWORD *)swift_allocObject();
      v50 = v77;
      v51 = v78;
      v49[2] = v83;
      v49[3] = v51;
      v52 = v79;
      v49[4] = v50;
      v49[5] = v52;
      swift_retain();
      v53 = v51;
      swift_retain();
      v54 = (void *)sub_213FF9428();
      swift_bridgeObjectRelease();
      aBlock[4] = sub_213FF4660;
      aBlock[5] = v49;
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_213F3D08C;
      aBlock[3] = &block_descriptor_76;
      v55 = _Block_copy(aBlock);
      swift_release();
      v56 = (void *)objc_opt_self();
      v57 = objc_msgSend(v56, sel_actionWithTitle_style_handler_, v54, 0, v55);
      _Block_release(v55);

      v21 = v82;
      v58 = (void *)sub_213FF9428();
      swift_bridgeObjectRelease();
      v59 = objc_msgSend(v56, sel_actionWithTitle_style_handler_, v58, 0, 0);

      objc_msgSend(v48, sel_addAction_, v57);
      objc_msgSend(v48, sel_addAction_, v59);
      objc_msgSend(v53, sel_presentViewController_animated_completion_, v48, 1, 0);

      return sub_213F4CF1C((uint64_t)v21, qword_254D5D1D8);
    }
LABEL_37:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v70 = v80;
    sub_213FF7778();
    v71 = sub_213FF8D2C();
    v72 = sub_213FF95C0();
    if (os_log_type_enabled(v71, v72))
    {
      v73 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v73 = 0;
      _os_log_impl(&dword_213F36000, v71, v72, "Unable to show the HSA2 upgrade alert as the server doesn't have the related fields in the config", v73, 2u);
      MEMORY[0x2199C815C](v73, -1, -1);
    }

    (*(void (**)(char *, char *))(v81 + 8))(v70, v82);
    return sub_213F4CF1C((uint64_t)v21, qword_254D5D1D8);
  }
  if (v61[2] >= 2uLL)
  {
    v67 = v61[6];
    v68 = v61[7];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    sub_213FE1990(v67, v68);
    v43 = v69;
    swift_bridgeObjectRelease();
    goto LABEL_36;
  }
  __break(1u);
  return result;
}

uint64_t sub_213FE39E4()
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
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;

  v1 = v0;
  v2 = sub_213FF7DD8();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(_QWORD *)(v1 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_state + 8))
  {
    v6 = *(_QWORD *)(v1 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_state);
    v13 = *(_QWORD *)(v1 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_state + 8);
    v14 = v6;
  }
  else
  {
    v13 = 0xE000000000000000;
    v14 = 0;
  }
  if (*(_QWORD *)(v1 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_country + 8))
  {
    v7 = *(_QWORD *)(v1 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_country);
    v11 = *(_QWORD *)(v1 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_country + 8);
    v12 = v7;
  }
  else
  {
    v11 = 0xE000000000000000;
    v12 = 0;
  }
  sub_213FF86D8();
  v8 = v1 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_idType;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v8, v2);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_213FF7DCC();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  *(_QWORD *)(v1 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_textReplacementHelper) = sub_213FF86CC();
  return swift_release();
}

uint64_t sub_213FE3B7C@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  v3 = *a1;
  v2 = a1[1];
  *a2 = v3;
  a2[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t sub_213FE3B98()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  if (!*(_QWORD *)(v0 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_state + 8)
    || !*(_QWORD *)(v0 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_country + 8))
  {
    return 0;
  }
  v3 = *(_QWORD *)(v0 + 80);
  v4 = *(_QWORD *)(v0 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_213FF94A0();
  sub_213FF94A0();
  swift_bridgeObjectRelease();
  sub_213FF94A0();
  sub_213FF94A0();
  swift_bridgeObjectRelease();
  v1 = sub_213FE3CA0(v3, v4);
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t sub_213FE3CA0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  os_log_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  uint8_t *v33;
  uint64_t v34;
  unint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t v39;
  os_log_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  int v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;

  v3 = v2;
  v47 = a1;
  v5 = sub_213FF7DD8();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_213FF8D38();
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v39 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v15 = (char *)&v39 - v14;
  v16 = *(_QWORD *)(v3 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_state + 8);
  if (!v16 || (v17 = *(_QWORD *)(v3 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_country + 8)) == 0)
  {
    v30 = v13;
    sub_213FF7778();
    v31 = sub_213FF8D2C();
    v32 = sub_213FF95C0();
    if (os_log_type_enabled(v31, v32))
    {
      v33 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v33 = 0;
      _os_log_impl(&dword_213F36000, v31, v32, "State and Country cannot be nil)", v33, 2u);
      MEMORY[0x2199C815C](v33, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v30 + 8))(v12, v9);
    return 0;
  }
  v46 = v13;
  v18 = *(_QWORD *)(v3 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_country);
  v43 = *(_QWORD *)(v3 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_state);
  v44 = v18;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_213FF7778();
  swift_retain_n();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v19 = sub_213FF8D2C();
  v20 = sub_213FF95C0();
  v45 = v20;
  if (os_log_type_enabled(v19, v20))
  {
    v21 = swift_slowAlloc();
    v42 = a2;
    v22 = v21;
    v41 = swift_slowAlloc();
    v50 = v41;
    *(_DWORD *)v22 = 136315650;
    v40 = v19;
    swift_bridgeObjectRetain();
    v49 = sub_213F7DD50(v43, v16, &v50);
    v43 = v9;
    sub_213FF971C();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v22 + 12) = 2080;
    swift_bridgeObjectRetain();
    v49 = sub_213F7DD50(v44, v17, &v50);
    sub_213FF971C();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v22 + 22) = 2080;
    v23 = v3 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_idType;
    swift_beginAccess();
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v23, v5);
    v24 = sub_213FF7DCC();
    v26 = v25;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    v48 = sub_213F7DD50(v24, v26, &v50);
    sub_213FF971C();
    swift_release_n();
    swift_bridgeObjectRelease();
    v27 = v40;
    _os_log_impl(&dword_213F36000, v40, (os_log_type_t)v45, "The state is %s, country is %s, IDType is %s", (uint8_t *)v22, 0x20u);
    v28 = v41;
    swift_arrayDestroy();
    MEMORY[0x2199C815C](v28, -1, -1);
    v29 = v22;
    a2 = v42;
    MEMORY[0x2199C815C](v29, -1, -1);

    (*(void (**)(char *, uint64_t))(v46 + 8))(v15, v43);
  }
  else
  {

    swift_release_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v46 + 8))(v15, v9);
  }
  v34 = *(_QWORD *)(v3 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_messageReplacements);
  if (!*(_QWORD *)(v34 + 16))
    return 0;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v35 = sub_213F42568(v47, a2);
  if ((v36 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return 0;
  }
  v37 = *(_QWORD *)(*(_QWORD *)(v34 + 56) + 16 * v35);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v37;
}

uint64_t sub_213FE4134()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  void (*v15)(char *, uint64_t);
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;

  v1 = v0;
  v2 = sub_213FF8D38();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v4);
  v9 = (char *)&v25 - v8;
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v25 - v10;
  sub_213FF7778();
  v12 = sub_213FF8D2C();
  v13 = sub_213FF95C0();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_213F36000, v12, v13, "IdentityProofingFlowManager - deinit", v14, 2u);
    MEMORY[0x2199C815C](v14, -1, -1);
  }

  v15 = *(void (**)(char *, uint64_t))(v3 + 8);
  v15(v11, v2);
  sub_213FF7FE8();
  if (swift_dynamicCastClass())
  {
    swift_unknownObjectRetain();
    sub_213FF7778();
    v16 = sub_213FF8D2C();
    v17 = sub_213FF95C0();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_213F36000, v16, v17, "IdentityProofingFlowManager - connection is IdentityManagementUIClient, calling invalidate", v18, 2u);
      MEMORY[0x2199C815C](v18, -1, -1);
    }

    v15(v6, v2);
    sub_213FF7FD0();
    swift_unknownObjectRelease();
  }
  else
  {
    sub_213FF7778();
    v19 = sub_213FF8D2C();
    v20 = sub_213FF95C0();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_213F36000, v19, v20, "IdentityProofingFlowManager - connection is not IdentityManagementUIClient, no invalidate called", v21, 2u);
      MEMORY[0x2199C815C](v21, -1, -1);
    }

    v15(v9, v2);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_213F7FB0C(v1 + 96);
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  swift_release();

  swift_bridgeObjectRelease();
  v22 = v1 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_idType;
  v23 = sub_213FF7DD8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 8))(v22, v23);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
  swift_release();

  swift_release();
  sub_213F4CF1C(v1 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_livenessVideoData, &qword_254D5DF38);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return v1;
}

uint64_t sub_213FE4598()
{
  sub_213FE4134();
  return swift_deallocClassInstance();
}

uint64_t sub_213FE45BC()
{
  return type metadata accessor for IdentityProofingFlowManager();
}

uint64_t type metadata accessor for IdentityProofingFlowManager()
{
  uint64_t result;

  result = qword_254D60948;
  if (!qword_254D60948)
    return swift_getSingletonMetadata();
  return result;
}

void sub_213FE4600()
{
  unint64_t v0;
  unint64_t v1;

  sub_213FF7DD8();
  if (v0 <= 0x3F)
  {
    sub_213FAE5E8();
    if (v1 <= 0x3F)
      swift_updateClassMetadata2();
  }
}

void sub_213FE475C(uint64_t a1, void *a2, void (*a3)(_QWORD), void (*a4)(_QWORD))
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  id v20;
  id v21;
  id v22;
  NSObject *v23;
  os_log_type_t v24;
  uint64_t v25;
  uint8_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  os_log_type_t v35;
  uint64_t v36;
  uint8_t *v37;
  uint8_t *v38;
  void (*v39)(char *, uint64_t);
  uint64_t v40;
  NSObject *v41;
  os_log_type_t v42;
  uint8_t *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void (*v48)(_QWORD);
  uint64_t v49;
  uint64_t v50;

  v5 = v4;
  v10 = sub_213FF8D38();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v45 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x24BDAC7A8](v12);
  v17 = (char *)&v45 - v16;
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v45 - v18;
  if (a2)
  {
    v20 = a2;
    sub_213FF7778();
    v21 = a2;
    v22 = a2;
    v23 = sub_213FF8D2C();
    v24 = sub_213FF95CC();
    if (os_log_type_enabled(v23, v24))
    {
      v25 = swift_slowAlloc();
      v47 = v11;
      v26 = (uint8_t *)v25;
      v27 = swift_slowAlloc();
      v48 = a3;
      v28 = v27;
      v50 = v27;
      *(_DWORD *)v26 = 136446210;
      v46 = v10;
      swift_getErrorValue();
      v29 = sub_213FF9950();
      v49 = sub_213F7DD50(v29, v30, &v50);
      sub_213FF971C();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_213F36000, v23, v24, "Error! Proofing not complete %{public}s", v26, 0xCu);
      swift_arrayDestroy();
      v31 = v28;
      a3 = v48;
      MEMORY[0x2199C815C](v31, -1, -1);
      MEMORY[0x2199C815C](v26, -1, -1);

      (*(void (**)(char *, uint64_t))(v47 + 8))(v19, v46);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v11 + 8))(v19, v10);
    }
    v44 = a2;
    a3(a2);

  }
  else
  {
    if (a1)
    {
      v32 = sub_213FF8090();
      if (v32)
      {
        v33 = v32;
        v48 = a4;
        sub_213FF7778();
        v34 = sub_213FF8D2C();
        v35 = sub_213FF95C0();
        if (os_log_type_enabled(v34, v35))
        {
          v36 = v11;
          v37 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v37 = 0;
          _os_log_impl(&dword_213F36000, v34, v35, "received new proofing views", v37, 2u);
          v38 = v37;
          v11 = v36;
          MEMORY[0x2199C815C](v38, -1, -1);
        }

        v39 = *(void (**)(char *, uint64_t))(v11 + 8);
        v39(v17, v10);
        *(_QWORD *)(*(_QWORD *)(v5 + 144) + 24) = v33;
        swift_bridgeObjectRelease();
        v40 = *(_QWORD *)(v5 + 144);
        swift_retain();
        sub_213FF7778();
        v41 = sub_213FF8D2C();
        v42 = sub_213FF95C0();
        if (os_log_type_enabled(v41, v42))
        {
          v43 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v43 = 0;
          _os_log_impl(&dword_213F36000, v41, v42, "reset page iterator", v43, 2u);
          MEMORY[0x2199C815C](v43, -1, -1);
        }

        v39(v14, v10);
        *(_QWORD *)(v40 + 16) = 0;
        swift_release();
      }
    }
    a3(0);
  }
}

uint64_t sub_213FE4B34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v8;

  *(_QWORD *)(v7 + 128) = a6;
  *(_QWORD *)(v7 + 136) = a7;
  *(_BYTE *)(v7 + 192) = a5;
  *(_QWORD *)(v7 + 120) = a4;
  v8 = sub_213FF8D38();
  *(_QWORD *)(v7 + 144) = v8;
  *(_QWORD *)(v7 + 152) = *(_QWORD *)(v8 - 8);
  *(_QWORD *)(v7 + 160) = swift_task_alloc();
  *(_QWORD *)(v7 + 168) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_213FE4BAC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v1 = *(unsigned __int8 *)(v0 + 192);
  v2 = *(_QWORD *)(v0 + 120);
  v3 = *(void **)(v2 + 112);
  v4 = sub_213FF9428();
  *(_QWORD *)(v0 + 176) = v4;
  v5 = *(_QWORD *)(v2 + 136);
  *(_QWORD *)(v0 + 16) = v0;
  *(_QWORD *)(v0 + 24) = sub_213FE4C70;
  v6 = swift_continuation_init();
  *(_QWORD *)(v0 + 80) = MEMORY[0x24BDAC760];
  v7 = (_QWORD *)(v0 + 80);
  v7[1] = 0x40000000;
  v7[2] = sub_213FE1FB4;
  v7[3] = &block_descriptor_152;
  v7[4] = v6;
  objc_msgSend(v3, sel_saveIdentityProofingBiomeDataSharingUserConsent_state_proofingOptions_completionHandler_, v1, v4, v5, v7);
  return swift_continuation_await();
}

uint64_t sub_213FE4C70()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 184) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_213FE4CD0()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  sub_213FF7778();
  v1 = sub_213FF8D2C();
  v2 = sub_213FF95C0();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_213F36000, v1, v2, "Successfully saved the user's consent to share the proofing biome data.", v3, 2u);
    MEMORY[0x2199C815C](v3, -1, -1);
  }
  v4 = *(_QWORD *)(v0 + 168);
  v5 = *(_QWORD *)(v0 + 144);
  v6 = *(_QWORD *)(v0 + 152);
  v7 = *(_QWORD *)(v0 + 120);

  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  if (MEMORY[0x2199C81F8](v7 + 96))
  {
    sub_213F7D660(0);
    swift_unknownObjectRelease();
  }
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_213FE4DD0()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v1 = *(void **)(v0 + 176);
  v3 = *(_QWORD *)(v0 + 152);
  v2 = *(_QWORD *)(v0 + 160);
  v4 = *(_QWORD *)(v0 + 144);
  v5 = *(_QWORD *)(v0 + 120);
  swift_willThrow();

  sub_213FF7778();
  sub_213FF7784();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  v6 = MEMORY[0x2199C81F8](v5 + 96);
  v7 = *(void **)(v0 + 184);
  if (v6)
  {
    v8 = v7;
    sub_213F7D660(v7);

    swift_unknownObjectRelease();
  }

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_213FE4EA4()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1[16] = v0;
  v2 = sub_213FF8810();
  v1[17] = v2;
  v1[18] = *(_QWORD *)(v2 - 8);
  v1[19] = swift_task_alloc();
  v3 = sub_213FF8D38();
  v1[20] = v3;
  v1[21] = *(_QWORD *)(v3 - 8);
  v1[22] = swift_task_alloc();
  v1[23] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_213FE4F3C()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD *v6;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
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

  v1 = *(_QWORD **)(v0 + 128);
  v2 = v1[17];
  if (v2)
  {
    v3 = (void *)v1[20];
    *(_QWORD *)(v0 + 192) = v3;
    if (v3)
    {
      v4 = (void *)v1[14];
      *(_QWORD *)(v0 + 56) = v0 + 120;
      *(_QWORD *)(v0 + 16) = v0;
      *(_QWORD *)(v0 + 24) = sub_213FE52FC;
      v5 = swift_continuation_init();
      *(_QWORD *)(v0 + 80) = MEMORY[0x24BDAC760];
      v6 = (_QWORD *)(v0 + 80);
      v6[1] = 0x40000000;
      v6[2] = sub_213FE3254;
      v6[3] = &block_descriptor_39;
      v6[4] = v5;
      objc_msgSend(v4, sel_fetchExtendedReviewDisplayInfo_proofingOptions_completionHandler_, v3, v2, v6);
      return swift_continuation_await();
    }
    sub_213FF7778();
    v17 = sub_213FF8D2C();
    v18 = sub_213FF95CC();
    if (os_log_type_enabled(v17, v18))
    {
      v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_213F36000, v17, v18, "proofing configuration doesn't exist, unable to request for extended review UI data", v19, 2u);
      MEMORY[0x2199C815C](v19, -1, -1);
    }
    v20 = *(_QWORD *)(v0 + 184);
    v21 = *(_QWORD *)(v0 + 160);
    v22 = *(_QWORD *)(v0 + 168);
    v24 = *(_QWORD *)(v0 + 144);
    v23 = *(_QWORD *)(v0 + 152);
    v25 = *(_QWORD *)(v0 + 136);

    (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v20, v21);
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v24 + 104))(v23, *MEMORY[0x24BE1DDA8], v25);
    sub_213F7DA10(MEMORY[0x24BEE4AF8]);
    sub_213FF881C();
    sub_213F3B3C0((unint64_t *)&qword_254D5C040, (uint64_t (*)(uint64_t))MEMORY[0x24BE1DE60], MEMORY[0x24BE1DE78]);
    swift_allocError();
  }
  else
  {
    sub_213FF7778();
    v8 = sub_213FF8D2C();
    v9 = sub_213FF95CC();
    if (os_log_type_enabled(v8, v9))
    {
      v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_213F36000, v8, v9, "proofing options doesn't exist, unable to request for extended review UI data", v10, 2u);
      MEMORY[0x2199C815C](v10, -1, -1);
    }
    v12 = *(_QWORD *)(v0 + 168);
    v11 = *(_QWORD *)(v0 + 176);
    v13 = *(_QWORD *)(v0 + 152);
    v14 = *(_QWORD *)(v0 + 160);
    v15 = *(_QWORD *)(v0 + 136);
    v16 = *(_QWORD *)(v0 + 144);

    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v11, v14);
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v16 + 104))(v13, *MEMORY[0x24BE1DC60], v15);
    sub_213F7DA10(MEMORY[0x24BEE4AF8]);
    sub_213FF881C();
    sub_213F3B3C0((unint64_t *)&qword_254D5C040, (uint64_t (*)(uint64_t))MEMORY[0x24BE1DE60], MEMORY[0x24BE1DE78]);
    swift_allocError();
  }
  sub_213FF8828();
  swift_willThrow();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_213FE52FC()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 200) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_213FE535C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 120);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v1);
}

uint64_t sub_213FE53C0()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 192);
  swift_willThrow();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_213FE5420(unint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  char isUniquelyReferenced_nonNull_native;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  if (a1)
  {
    v3 = v1 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_cardArtData;
    swift_beginAccess();
    if (!*(_QWORD *)(*(_QWORD *)v3 + 16))
    {
      if (a1 >> 62)
        goto LABEL_18;
      v4 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      for (; v4; v4 = sub_213FF9884())
      {
        v17 = (uint64_t *)v3;
        v3 = 4;
        while (1)
        {
          v5 = (a1 & 0xC000000000000001) != 0
             ? (id)MEMORY[0x2199C78A4](v3 - 4, a1)
             : *(id *)(a1 + 8 * v3);
          v6 = v5;
          v7 = v3 - 3;
          if (__OFADD__(v3 - 4, 1))
            break;
          v8 = sub_213FF7E68();
          if (v8)
          {
            sub_213F7A6D8(v8);
            v18 = v9;
            v11 = v10;
            v13 = v12;
            v15 = v14;
            swift_bridgeObjectRelease();
            swift_bridgeObjectRetain();
            sub_213F96998(v13, v15);
            sub_213F4CF08(v13, v15);
            if (v11)
            {
              swift_bridgeObjectRetain();
              sub_213F96998(v13, v15);
              swift_bridgeObjectRelease();
              if (v15 >> 60 != 15)
              {
                swift_bridgeObjectRelease();
                swift_beginAccess();
                sub_213F4527C(v13, v15);
                isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
                v19 = *v17;
                *v17 = 0x8000000000000000;
                sub_213F436B0(v13, v15, v18, v11, isUniquelyReferenced_nonNull_native);
                *v17 = v19;
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                swift_endAccess();
                swift_bridgeObjectRelease();
                sub_213F4CF08(v13, v15);
                sub_213F4CF08(v13, v15);

                return;
              }
              swift_bridgeObjectRelease();
              sub_213F4CF08(v13, v15);
              swift_bridgeObjectRelease();
            }
            else
            {
              swift_bridgeObjectRelease();
              sub_213F4CF08(v13, v15);
            }
          }

          ++v3;
          if (v7 == v4)
            goto LABEL_19;
        }
        __break(1u);
LABEL_18:
        swift_bridgeObjectRetain();
      }
LABEL_19:
      swift_bridgeObjectRelease();
    }
  }
}

uint64_t sub_213FE5680()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;

  v1 = sub_213FF8D38();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D5F760);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *(_QWORD *)(v0 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_state + 8);
  if (v8)
  {
    v9 = *(_QWORD *)(v0 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_state);
    v10 = sub_213FF956C();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
    v11 = (_QWORD *)swift_allocObject();
    v11[2] = 0;
    v11[3] = 0;
    v11[4] = v0;
    v11[5] = v9;
    v11[6] = v8;
    swift_bridgeObjectRetain();
    swift_retain();
    sub_213F4BE78((uint64_t)v7, (uint64_t)&unk_254D61018, (uint64_t)v11);
    return swift_release();
  }
  else
  {
    sub_213FF7778();
    v13 = sub_213FF8D2C();
    v14 = sub_213FF95C0();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_213F36000, v13, v14, "the state is empty, unable to call proofing completion", v15, 2u);
      MEMORY[0x2199C815C](v15, -1, -1);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
}

uint64_t sub_213FE5830(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;

  v6[21] = a5;
  v6[22] = a6;
  v6[20] = a4;
  v7 = sub_213FF8D38();
  v6[23] = v7;
  v6[24] = *(_QWORD *)(v7 - 8);
  v6[25] = swift_task_alloc();
  v6[26] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_213FE58A4()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v1 = v0[20];
  v2 = *(void **)(v1 + 112);
  v3 = sub_213FF9428();
  v0[27] = v3;
  v4 = *(_QWORD *)(v1 + 136);
  v0[2] = v0;
  v0[3] = sub_213FE5958;
  v5 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v6 = v0 + 10;
  v6[1] = 0x40000000;
  v6[2] = sub_213FE1FB4;
  v6[3] = &block_descriptor_38;
  v6[4] = v5;
  objc_msgSend(v2, sel_clearDataAfterTerminalProofingStateWithState_proofingOptions_completionHandler_, v3, v4, v6);
  return swift_continuation_await();
}

uint64_t sub_213FE5958()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 224) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_213FE59B8()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_213FF7778();
  v1 = sub_213FF8D2C();
  v2 = sub_213FF95C0();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_213F36000, v1, v2, "Proofing data cleared successfully after proofing completion", v3, 2u);
    MEMORY[0x2199C815C](v3, -1, -1);
  }
  v4 = *(_QWORD *)(v0 + 208);
  v5 = *(_QWORD *)(v0 + 184);
  v6 = *(_QWORD *)(v0 + 192);

  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_213FE5A8C()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  void *v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v2 = *(void **)(v0 + 216);
  v1 = *(void **)(v0 + 224);
  swift_willThrow();

  sub_213FF7778();
  v3 = v1;
  v4 = v1;
  v5 = sub_213FF8D2C();
  v6 = sub_213FF95C0();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = *(void **)(v0 + 224);
    v17 = *(_QWORD *)(v0 + 192);
    v18 = *(_QWORD *)(v0 + 184);
    v19 = *(_QWORD *)(v0 + 200);
    v8 = (uint8_t *)swift_slowAlloc();
    v9 = swift_slowAlloc();
    v20 = v9;
    *(_DWORD *)v8 = 136315138;
    swift_getErrorValue();
    v10 = sub_213FF9950();
    *(_QWORD *)(v0 + 152) = sub_213F7DD50(v10, v11, &v20);
    sub_213FF971C();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_213F36000, v5, v6, "received an error while clearing data after proofing completion %s", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2199C815C](v9, -1, -1);
    MEMORY[0x2199C815C](v8, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v19, v18);
  }
  else
  {
    v12 = *(void **)(v0 + 224);
    v14 = *(_QWORD *)(v0 + 192);
    v13 = *(_QWORD *)(v0 + 200);
    v15 = *(_QWORD *)(v0 + 184);

    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v15);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_213FE5C9C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3[58] = a2;
  v3[59] = v2;
  v3[57] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D5F760);
  v3[60] = swift_task_alloc();
  v4 = sub_213FF7DD8();
  v3[61] = v4;
  v3[62] = *(_QWORD *)(v4 - 8);
  v3[63] = swift_task_alloc();
  v3[64] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D61048);
  v3[65] = swift_task_alloc();
  v5 = sub_213FF8708();
  v3[66] = v5;
  v3[67] = *(_QWORD *)(v5 - 8);
  v3[68] = swift_task_alloc();
  v6 = sub_213FF8810();
  v3[69] = v6;
  v3[70] = *(_QWORD *)(v6 - 8);
  v3[71] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D5DF38);
  v3[72] = swift_task_alloc();
  v7 = sub_213FF8D38();
  v3[73] = v7;
  v3[74] = *(_QWORD *)(v7 - 8);
  v3[75] = swift_task_alloc();
  v3[76] = swift_task_alloc();
  v3[77] = swift_task_alloc();
  v3[78] = swift_task_alloc();
  v3[79] = swift_task_alloc();
  v3[80] = swift_task_alloc();
  v3[81] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_213FE5E40()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t *v36;
  void *v37;
  id v38;
  uint64_t (*v39)(uint64_t);
  uint64_t v40;
  uint64_t v41;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  _QWORD *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;

  sub_213FF7778();
  v1 = sub_213FF8D2C();
  v2 = sub_213FF95C0();
  if (os_log_type_enabled(v1, v2))
  {
    v47 = *(_QWORD *)(v0 + 592);
    v48 = *(_QWORD *)(v0 + 584);
    v49 = *(_QWORD *)(v0 + 648);
    v3 = (uint8_t *)swift_slowAlloc();
    v4 = swift_slowAlloc();
    v50 = v4;
    *(_DWORD *)v3 = 136315138;
    *(_QWORD *)(v0 + 424) = sub_213F7DD50(0xD000000000000024, 0x8000000214006A00, &v50);
    sub_213FF971C();
    _os_log_impl(&dword_213F36000, v1, v2, "%s enter", v3, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2199C815C](v4, -1, -1);
    MEMORY[0x2199C815C](v3, -1, -1);

    v5 = *(void (**)(uint64_t, uint64_t))(v47 + 8);
    v5(v49, v48);
  }
  else
  {
    v6 = *(_QWORD *)(v0 + 648);
    v7 = *(_QWORD *)(v0 + 592);
    v8 = *(_QWORD *)(v0 + 584);

    v5 = *(void (**)(uint64_t, uint64_t))(v7 + 8);
    v5(v6, v8);
  }
  *(_QWORD *)(v0 + 656) = v5;
  v9 = *(_QWORD *)(*(_QWORD *)(v0 + 472) + 144);
  swift_retain();
  sub_213FF7778();
  v10 = sub_213FF8D2C();
  v11 = sub_213FF95C0();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_213F36000, v10, v11, "reset page iterator", v12, 2u);
    MEMORY[0x2199C815C](v12, -1, -1);
  }
  v13 = *(_QWORD *)(v0 + 640);
  v14 = *(_QWORD *)(v0 + 584);
  v15 = *(_QWORD *)(v0 + 576);
  v16 = *(_QWORD *)(v0 + 472);
  v17 = *(void **)(v0 + 456);

  v5(v13, v14);
  *(_QWORD *)(v9 + 16) = 0;
  swift_release();
  swift_retain();
  sub_213FC6910();
  swift_release();
  v18 = type metadata accessor for IdentityProofingLivenessVideoData(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v15, 1, 1, v18);
  v19 = v16 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_livenessVideoData;
  swift_beginAccess();
  sub_213FB17EC(v15, v19, &qword_254D5DF38);
  swift_endAccess();
  sub_213FF78B0();
  sub_213FF78A4();
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 144), *(_QWORD *)(v0 + 168));
  sub_213FF7F28();
  __swift_destroy_boxed_opaque_existential_0(v0 + 144);
  v20 = *(void **)(v16 + 160);
  *(_QWORD *)(v16 + 160) = v17;
  v21 = v17;

  v22 = sub_213FF82F4();
  if (v23)
  {
    v22 = sub_213FF947C();
    v25 = v24;
    swift_bridgeObjectRelease();
  }
  else
  {
    v25 = 0;
  }
  v26 = *(_QWORD *)(v0 + 472);
  v27 = OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_state;
  *(_QWORD *)(v0 + 664) = OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_state;
  v28 = (uint64_t *)(v26 + v27);
  *v28 = v22;
  v28[1] = v25;
  swift_bridgeObjectRelease();
  v29 = sub_213FF8300();
  if (v30)
  {
    v29 = sub_213FF947C();
    v32 = v31;
    swift_bridgeObjectRelease();
  }
  else
  {
    v32 = 0;
  }
  v33 = *(_QWORD *)(v0 + 472);
  v34 = *(void **)(v0 + 456);
  v35 = OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_country;
  *(_QWORD *)(v0 + 672) = OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_country;
  v36 = (uint64_t *)(v33 + v35);
  *v36 = v29;
  v36[1] = v32;
  swift_bridgeObjectRelease();
  sub_213FE39E4();
  v37 = *(void **)(v16 + 160);
  *(_QWORD *)(v16 + 160) = v17;
  v38 = v34;

  v39 = *(uint64_t (**)(uint64_t))(**(_QWORD **)(v33 + 152) + 120);
  v40 = swift_retain();
  v41 = v39(v40);
  swift_release();
  if (v41 == 2)
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 560) + 104))(*(_QWORD *)(v0 + 568), *MEMORY[0x24BE1DCD8], *(_QWORD *)(v0 + 552));
    sub_213F7DA10(MEMORY[0x24BEE4AF8]);
    sub_213FF881C();
    sub_213F3B3C0((unint64_t *)&qword_254D5C040, (uint64_t (*)(uint64_t))MEMORY[0x24BE1DE60], MEMORY[0x24BE1DE78]);
    swift_allocError();
    sub_213FF8828();
    swift_willThrow();
    sub_213FE7A18();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v43 = *(_QWORD *)(v0 + 464);
    v44 = *(void **)(*(_QWORD *)(v0 + 472) + 112);
    *(_QWORD *)(v0 + 680) = v44;
    *(_QWORD *)(v0 + 56) = v0 + 700;
    *(_QWORD *)(v0 + 16) = v0;
    *(_QWORD *)(v0 + 24) = sub_213FE648C;
    v45 = swift_continuation_init();
    *(_QWORD *)(v0 + 224) = MEMORY[0x24BDAC760];
    v46 = (_QWORD *)(v0 + 224);
    v46[1] = 0x40000000;
    v46[2] = sub_213FE7BA0;
    v46[3] = &block_descriptor_178;
    v46[4] = v45;
    objc_msgSend(v44, sel_isWatchPairedWithIdType_completionHandler_, v43, v46);
    return swift_continuation_await();
  }
}

uint64_t sub_213FE648C()
{
  return swift_task_switch();
}

uint64_t sub_213FE64D8()
{
  uint64_t v0;
  int v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  void (*v5)(uint64_t, uint64_t);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  void *v17;
  id v18;
  id v19;
  NSObject *v20;
  os_log_type_t v21;
  BOOL v22;
  void (*v23)(uint64_t, uint64_t);
  uint64_t v24;
  uint64_t v25;
  uint8_t *v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v1 = *(unsigned __int8 *)(v0 + 700);
  sub_213FF7778();
  v2 = sub_213FF8D2C();
  v3 = sub_213FF95B4();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v4 = 67109120;
    *(_DWORD *)(v0 + 696) = v1;
    sub_213FF971C();
    _os_log_impl(&dword_213F36000, v2, v3, "prepareForProofingDisplay: isWatchPaired = %{BOOL}d", v4, 8u);
    MEMORY[0x2199C815C](v4, -1, -1);
  }
  v5 = *(void (**)(uint64_t, uint64_t))(v0 + 656);
  v6 = *(_QWORD *)(v0 + 632);
  v7 = *(_QWORD *)(v0 + 584);

  v5(v6, v7);
  v8 = sub_213FF82A0();
  if ((v9 & 1) != 0 || v8 != 2)
  {
    if (v1)
      v10 = 3;
    else
      v10 = 1;
    goto LABEL_10;
  }
  if ((v1 & 1) != 0)
  {
    v10 = 2;
LABEL_10:
    v11 = *(void **)(v0 + 680);
    v12 = *(_QWORD *)(v0 + 464);
    v13 = *(_QWORD *)(v0 + 456);
    *(_QWORD *)(*(_QWORD *)(v0 + 472) + 136) = v10;
    *(_QWORD *)(v0 + 120) = v0 + 432;
    *(_QWORD *)(v0 + 80) = v0;
    *(_QWORD *)(v0 + 88) = sub_213FE69E4;
    v14 = swift_continuation_init();
    *(_QWORD *)(v0 + 184) = MEMORY[0x24BDAC760];
    v15 = (_QWORD *)(v0 + 184);
    v15[1] = 0x40000000;
    v15[2] = sub_213FE3254;
    v15[3] = &block_descriptor_179;
    v15[4] = v14;
    objc_msgSend(v11, sel_prepareForProofingDisplay_proofingOptions_idType_completionHandler_, v13, v10, v12, v15);
    return swift_continuation_await();
  }
  (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 560) + 104))(*(_QWORD *)(v0 + 568), *MEMORY[0x24BE1DCE0], *(_QWORD *)(v0 + 552));
  sub_213F7DA10(MEMORY[0x24BEE4AF8]);
  sub_213FF881C();
  sub_213F3B3C0((unint64_t *)&qword_254D5C040, (uint64_t (*)(uint64_t))MEMORY[0x24BE1DE60], MEMORY[0x24BE1DE78]);
  v17 = (void *)swift_allocError();
  sub_213FF8828();
  swift_willThrow();
  sub_213FF7778();
  v18 = v17;
  v19 = v17;
  v20 = sub_213FF8D2C();
  v21 = sub_213FF95CC();
  v22 = os_log_type_enabled(v20, v21);
  v23 = *(void (**)(uint64_t, uint64_t))(v0 + 656);
  v24 = *(_QWORD *)(v0 + 600);
  v25 = *(_QWORD *)(v0 + 584);
  if (v22)
  {
    v31 = *(_QWORD *)(v0 + 600);
    v30 = *(_QWORD *)(v0 + 584);
    v26 = (uint8_t *)swift_slowAlloc();
    v27 = swift_slowAlloc();
    v32 = v27;
    *(_DWORD *)v26 = 136446210;
    swift_getErrorValue();
    v28 = sub_213FF9950();
    *(_QWORD *)(v0 + 416) = sub_213F7DD50(v28, v29, &v32);
    sub_213FF971C();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_213F36000, v20, v21, "Received an error from start proofing: %{public}s", v26, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2199C815C](v27, -1, -1);
    MEMORY[0x2199C815C](v26, -1, -1);

    v23(v31, v30);
  }
  else
  {

    v23(v24, v25);
  }
  swift_willThrow();
  sub_213FE7A18();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_213FE69E4()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 688) = *(_QWORD *)(*(_QWORD *)v0 + 112);
  return swift_task_switch();
}

uint64_t sub_213FE6A44()
{
  _QWORD *v0;
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
  void *v11;
  id v12;
  id v13;
  NSObject *v14;
  os_log_type_t v15;
  _BOOL4 v16;
  void (*v17)(uint64_t, uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint8_t *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t (*v24)(void);
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  char v48;
  uint64_t v49;
  void *v50;
  NSObject *v51;
  os_log_type_t v52;
  uint8_t *v53;
  void (*v54)(uint64_t, uint64_t);
  uint64_t v55;
  uint64_t v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void (*v65)(uint64_t, uint64_t);
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  id v73;
  NSObject *v74;
  os_log_type_t v75;
  BOOL v76;
  void (*v77)(uint64_t, uint64_t);
  uint64_t v78;
  uint64_t v79;
  uint8_t *v80;
  uint64_t v81;
  uint64_t v82;
  unint64_t v83;
  uint64_t v84;
  void *v85;
  id v86;
  void (*v87)(_QWORD *, _QWORD);
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  _QWORD *v91;
  NSObject *v92;
  os_log_type_t v93;
  uint8_t *v94;
  void (*v95)(uint64_t, uint64_t);
  uint64_t v96;
  uint64_t v97;
  void *v98;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108[2];

  v1 = (void *)v0[54];
  v2 = sub_213FF8090();
  if (!v2)
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD))(v0[70] + 104))(v0[71], *MEMORY[0x24BE1DD10], v0[69]);
    sub_213F7DA10(MEMORY[0x24BEE4AF8]);
    sub_213FF881C();
    sub_213F3B3C0((unint64_t *)&qword_254D5C040, (uint64_t (*)(uint64_t))MEMORY[0x24BE1DE60], MEMORY[0x24BE1DE78]);
    v11 = (void *)swift_allocError();
    goto LABEL_5;
  }
  v3 = v2;
  v4 = v0[67];
  v5 = v0[66];
  v6 = v0[65];
  sub_213FEA78C(v6);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(v6, 1, v5) == 1)
  {
    v7 = v0[71];
    v8 = v0[70];
    v9 = v0[69];
    v10 = v0[65];
    swift_bridgeObjectRelease();
    sub_213F4CF1C(v10, &qword_254D61048);
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v8 + 104))(v7, *MEMORY[0x24BE1DD28], v9);
    sub_213F7DA10(MEMORY[0x24BEE4AF8]);
    sub_213FF881C();
    sub_213F3B3C0((unint64_t *)&qword_254D5C040, (uint64_t (*)(uint64_t))MEMORY[0x24BE1DE60], MEMORY[0x24BE1DE78]);
    v11 = (void *)swift_allocError();
LABEL_5:
    sub_213FF8828();
    swift_willThrow();

    sub_213FF7778();
    v12 = v11;
    v13 = v11;
    v14 = sub_213FF8D2C();
    v15 = sub_213FF95CC();
    v16 = os_log_type_enabled(v14, v15);
    v17 = (void (*)(uint64_t, uint64_t))v0[82];
    v18 = v0[75];
    v19 = v0[73];
    if (v16)
    {
      v105 = v0[75];
      v20 = (uint8_t *)swift_slowAlloc();
      v21 = swift_slowAlloc();
      v108[0] = v21;
      *(_DWORD *)v20 = 136446210;
      swift_getErrorValue();
      v22 = sub_213FF9950();
      v0[52] = sub_213F7DD50(v22, v23, v108);
      sub_213FF971C();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_213F36000, v14, v15, "Received an error from start proofing: %{public}s", v20, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2199C815C](v21, -1, -1);
      MEMORY[0x2199C815C](v20, -1, -1);

      v17(v105, v19);
    }
    else
    {

      v17(v18, v19);
    }
    swift_willThrow();
    sub_213FE7A18();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v24 = (uint64_t (*)(void))v0[1];
    return v24();
  }
  v25 = v0[59];
  (*(void (**)(_QWORD, _QWORD, _QWORD))(v0[67] + 32))(v0[68], v0[65], v0[66]);
  v26 = sub_213FF8090();
  sub_213FE5420(v26);
  swift_bridgeObjectRelease();
  v27 = sub_213FF80F0();
  v28 = v25 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_waitingForWiFiAlertDataThresholdInBytes;
  *(_QWORD *)v28 = v27;
  *(_BYTE *)(v28 + 8) = v29 & 1;
  v30 = sub_213FF8084();
  v31 = v25 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_lowDataModeAlertDataThresholdInBytes;
  *(_QWORD *)v31 = v30;
  *(_BYTE *)(v31 + 8) = v32 & 1;
  v33 = sub_213FF809C();
  v34 = (uint64_t *)(v25 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_learnMoreURL);
  *v34 = v33;
  v34[1] = v35;
  swift_bridgeObjectRelease();
  *(_QWORD *)(v25 + 176) = sub_213FF86E4();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v25 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_attributeMessages) = sub_213FF86F0();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v25 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_messageReplacements) = sub_213FF86FC();
  swift_bridgeObjectRelease();
  v36 = sub_213FF80CC();
  v37 = *(void **)(v25 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_featureEnablementConfig);
  *(_QWORD *)(v25 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_featureEnablementConfig) = v36;

  *(_QWORD *)(v25 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_supportedRegions) = sub_213FF80B4();
  swift_bridgeObjectRelease();
  v38 = sub_213FF80C0();
  v39 = *(void **)(v25 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_livenessConfig);
  *(_QWORD *)(v25 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_livenessConfig) = v38;

  v40 = (void *)sub_213FF80C0();
  v41 = v40;
  if (v40)

  v42 = v0[59];
  *(_BYTE *)(v42 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_isPerformingLivenessStepUp) = v41 != 0;
  v43 = sub_213FF80E4();
  v44 = OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_shouldPreFetchLivenessConfig;
  *(_BYTE *)(v42 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_shouldPreFetchLivenessConfig) = v43 & 1;
  v45 = sub_213FF80C0();
  v103 = v44;
  v104 = v42;
  v107 = v3;
  if (v45 && (v46 = (void *)v45, v47 = (void *)sub_213FF7D9C(), v46, v47))
  {
    v48 = sub_213FF8120();

  }
  else
  {
    v48 = 1;
  }
  *(_BYTE *)(v0[59] + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_selfieImageIsRequired) = v48 & 1;
  v49 = sub_213FF80D8();
  if (v49)
  {
    v50 = (void *)v49;
    sub_213FF7778();
    v51 = sub_213FF8D2C();
    v52 = sub_213FF95C0();
    if (os_log_type_enabled(v51, v52))
    {
      v53 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v53 = 0;
      _os_log_impl(&dword_213F36000, v51, v52, "Saving IQSettings from Liveness Step Up workflow", v53, 2u);
      MEMORY[0x2199C815C](v53, -1, -1);
    }
    v54 = (void (*)(uint64_t, uint64_t))v0[82];
    v55 = v0[78];
    v56 = v0[73];

    v54(v55, v56);
    swift_retain();
    v57 = v50;
    sub_213FC2D20((uint64_t)v50);
    swift_release();

  }
  sub_213FF80FC();
  if (v58)
  {
    v60 = v0[63];
    v59 = v0[64];
    v61 = v0[61];
    v62 = v0[62];
    v63 = v0[59];
    sub_213FF7DB4();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v62 + 16))(v60, v59, v61);
    v64 = v63 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_idType;
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v62 + 24))(v64, v60, v61);
    swift_endAccess();
    sub_213FE39E4();
    v65 = *(void (**)(uint64_t, uint64_t))(v62 + 8);
    v65(v60, v61);
    v65(v59, v61);
  }
  sub_213FF86F0();
  sub_213FF86FC();
  v66 = v0[59];
  v67 = v0[64];
  v69 = v0[61];
  v68 = v0[62];
  sub_213FF86D8();
  v70 = v66 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_idType;
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v68 + 16))(v67, v70, v69);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_213FF7DCC();
  (*(void (**)(uint64_t, uint64_t))(v68 + 8))(v67, v69);
  *(_QWORD *)(v66 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_textReplacementHelper) = sub_213FF86CC();
  swift_release();
  *(_QWORD *)(*(_QWORD *)(v66 + 144) + 24) = v107;
  swift_bridgeObjectRelease();
  v71 = sub_213FF8108();
  if (v71)
  {
    v72 = (void *)v71;
    sub_213FF7778();
    v73 = v72;
    v74 = sub_213FF8D2C();
    v75 = sub_213FF95C0();
    v76 = os_log_type_enabled(v74, v75);
    v77 = (void (*)(uint64_t, uint64_t))v0[82];
    v78 = v0[77];
    v79 = v0[73];
    if (v76)
    {
      v101 = v0[73];
      v80 = (uint8_t *)swift_slowAlloc();
      v81 = swift_slowAlloc();
      v108[0] = v81;
      *(_DWORD *)v80 = 136315138;
      v82 = sub_213FF7CB8();
      v0[55] = sub_213F7DD50(v82, v83, v108);
      sub_213FF971C();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_213F36000, v74, v75, "received doc scan config. IIN = %s", v80, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2199C815C](v81, -1, -1);
      MEMORY[0x2199C815C](v80, -1, -1);

      v77(v78, v101);
    }
    else
    {

      v77(v78, v79);
    }
    v106 = v0[68];
    v100 = v0[67];
    v102 = v0[66];
    v84 = *(_QWORD *)(v0[59] + 144);
    v85 = *(void **)(v84 + 40);
    *(_QWORD *)(v84 + 40) = v73;
    v86 = v73;

    swift_retain();
    sub_213FF7CB8();
    swift_beginAccess();
    v87 = (void (*)(_QWORD *, _QWORD))sub_213FF7C10();
    swift_bridgeObjectRetain();
    sub_213FF7B50();
    v87(v0 + 33, 0);
    swift_endAccess();

    swift_release();
    swift_bridgeObjectRelease();

    (*(void (**)(uint64_t, uint64_t))(v100 + 8))(v106, v102);
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(v0[67] + 8))(v0[68], v0[66]);

  }
  v88 = v0[59];
  v89 = v0[60];
  v90 = sub_213FF956C();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v90 - 8) + 56))(v89, 1, 1, v90);
  v91 = (_QWORD *)swift_allocObject();
  v91[2] = 0;
  v91[3] = 0;
  v91[4] = v88;
  swift_retain();
  sub_213F4BE78(v89, (uint64_t)&unk_254D61058, (uint64_t)v91);
  swift_release();
  if ((*(_BYTE *)(v104 + v103) & 1) != 0)
  {
    sub_213FF7778();
    v92 = sub_213FF8D2C();
    v93 = sub_213FF95C0();
    if (os_log_type_enabled(v92, v93))
    {
      v94 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v94 = 0;
      _os_log_impl(&dword_213F36000, v92, v93, "Instructed to pre fetch liveness config", v94, 2u);
      MEMORY[0x2199C815C](v94, -1, -1);
    }
    v95 = (void (*)(uint64_t, uint64_t))v0[82];
    v96 = v0[76];
    v97 = v0[73];

    v95(v96, v97);
    sub_213FE9D84();
    v98 = sub_213FEADF8();
    sub_213F5F36C(v98);
  }
  sub_213FE7A18();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  v24 = (uint64_t (*)(void))v0[1];
  return v24();
}

uint64_t sub_213FE7768()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t);
  uint64_t v17;

  swift_willThrow();
  v1 = *(void **)(v0 + 688);
  sub_213FF7778();
  v2 = v1;
  v3 = v1;
  v4 = sub_213FF8D2C();
  v5 = sub_213FF95CC();
  if (os_log_type_enabled(v4, v5))
  {
    v15 = *(_QWORD *)(v0 + 600);
    v16 = *(void (**)(uint64_t, uint64_t))(v0 + 656);
    v14 = *(_QWORD *)(v0 + 584);
    v6 = (uint8_t *)swift_slowAlloc();
    v7 = swift_slowAlloc();
    v17 = v7;
    *(_DWORD *)v6 = 136446210;
    swift_getErrorValue();
    v8 = sub_213FF9950();
    *(_QWORD *)(v0 + 416) = sub_213F7DD50(v8, v9, &v17);
    sub_213FF971C();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_213F36000, v4, v5, "Received an error from start proofing: %{public}s", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2199C815C](v7, -1, -1);
    MEMORY[0x2199C815C](v6, -1, -1);

    v16(v15, v14);
  }
  else
  {
    v10 = *(void (**)(uint64_t, uint64_t))(v0 + 656);
    v11 = *(_QWORD *)(v0 + 600);
    v12 = *(_QWORD *)(v0 + 584);

    v10(v11, v12);
  }
  swift_willThrow();
  sub_213FE7A18();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_213FE7A18()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;

  v0 = sub_213FF8D38();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_213FF7778();
  v4 = sub_213FF8D2C();
  v5 = sub_213FF95C0();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    v7 = swift_slowAlloc();
    v10 = v7;
    *(_DWORD *)v6 = 136315138;
    v9 = sub_213F7DD50(0xD000000000000024, 0x8000000214006A00, &v10);
    sub_213FF971C();
    _os_log_impl(&dword_213F36000, v4, v5, "%s exit", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2199C815C](v7, -1, -1);
    MEMORY[0x2199C815C](v6, -1, -1);
  }

  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_213FE7BA0(uint64_t a1, char a2)
{
  **(_BYTE **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) + 40) = a2;
  return swift_continuation_resume();
}

uint64_t sub_213FE7BB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 16) = a4;
  return swift_task_switch();
}

uint64_t sub_213FE7BCC()
{
  uint64_t v0;

  if ((*(_QWORD *)(*(_QWORD *)(v0 + 16) + 136) & 3) != 2)
    sub_213FE8904();
  sub_213FE7C14();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_213FE7C14()
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
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D5F760);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_213FF956C();
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
    sub_213F4CF1C((uint64_t)v4, &qword_254D5F760);
    v9 = 0;
    v10 = 0;
  }
  else
  {
    sub_213FF9560();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v4, v5);
    if (v7[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      v9 = sub_213FF9524();
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
  *(_QWORD *)(v12 + 16) = &unk_254D61000;
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

uint64_t sub_213FE7DE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  _QWORD *v6;

  v4[19] = a4;
  v5 = sub_213FF8D38();
  v4[20] = v5;
  v4[21] = *(_QWORD *)(v5 - 8);
  v4[22] = swift_task_alloc();
  v4[23] = swift_task_alloc();
  v4[24] = swift_task_alloc();
  v4[25] = swift_task_alloc();
  v6 = (_QWORD *)swift_task_alloc();
  v4[26] = v6;
  *v6 = v4;
  v6[1] = sub_213FE7E84;
  return sub_213FEAB64();
}

uint64_t sub_213FE7E84(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v5;

  v5 = (_QWORD *)*v3;
  v5[27] = a2;
  v5[28] = v2;
  swift_task_dealloc();
  if (!v2)
    v5[29] = a1;
  return swift_task_switch();
}

uint64_t sub_213FE7EF8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  char v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v28;
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;

  v1 = sub_213FF821C();
  v2 = sub_213FF821C();
  v3 = v0[27];
  if (v1 == v2)
  {
    swift_bridgeObjectRelease();
    sub_213FF7778();
    v4 = sub_213FF8D2C();
    v5 = sub_213FF95C0();
    if (os_log_type_enabled(v4, v5))
    {
      v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_213F36000, v4, v5, "proofing status unavailable. This is an unexpected daemon state.", v6, 2u);
      MEMORY[0x2199C815C](v6, -1, -1);
    }
    v7 = v0[23];
    v8 = v0[20];
    v9 = v0[21];

    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
    goto LABEL_14;
  }
  if (v3 >> 62)
  {
    swift_bridgeObjectRetain();
    v28 = sub_213FF9884();
    swift_bridgeObjectRelease();
    if (v28)
      goto LABEL_7;
  }
  else if (*(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_7:
    v10 = v0[27];
    v11 = *(void **)(v0[19] + 160);
    v12 = v11;
    v13 = sub_213FF3DC0(v10, (uint64_t)v11);
    swift_bridgeObjectRelease();
    if (v13
      && (v14 = v13, sub_213FF8294(), v16 = v15, v14, (v16 & 1) == 0)
      && (v17 = sub_213FF8210(), v17 == sub_213FF8210()))
    {
      v18 = v0[19];
      v19 = *(void **)(v18 + 112);
      v0[6] = sub_213FF3F80;
      v0[7] = v18;
      v0[2] = MEMORY[0x24BDAC760];
      v0[3] = 1107296256;
      v0[4] = sub_213FE541C;
      v0[5] = &block_descriptor_29_2;
      v20 = _Block_copy(v0 + 2);
      swift_retain();
      swift_release();
      objc_msgSend(v19, sel_fetchImageQualitySettingsWithCompletion_, v20);
      _Block_release(v20);

    }
    else
    {
      sub_213FF7778();
      v21 = sub_213FF8D2C();
      v22 = sub_213FF95C0();
      if (os_log_type_enabled(v21, v22))
      {
        v23 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v23 = 0;
        _os_log_impl(&dword_213F36000, v21, v22, "Stored Proofing Session exists. Do not fetch image quality settings", v23, 2u);
        MEMORY[0x2199C815C](v23, -1, -1);
      }
      v24 = v0[25];
      v25 = v0[20];
      v26 = v0[21];

      (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v24, v25);
    }
    goto LABEL_14;
  }
  swift_bridgeObjectRelease();
  sub_213FF7778();
  v29 = sub_213FF8D2C();
  v30 = sub_213FF95C0();
  if (os_log_type_enabled(v29, v30))
  {
    v31 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v31 = 0;
    _os_log_impl(&dword_213F36000, v29, v30, "Proofing session doesn't exist. Start fetching image quality settings", v31, 2u);
    MEMORY[0x2199C815C](v31, -1, -1);
  }
  v32 = v0[24];
  v33 = v0[20];
  v34 = v0[21];
  v35 = v0[19];

  (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v32, v33);
  v36 = *(void **)(v35 + 112);
  v0[12] = sub_213FF3F80;
  v0[13] = v35;
  v0[8] = MEMORY[0x24BDAC760];
  v0[9] = 1107296256;
  v0[10] = sub_213FE541C;
  v0[11] = &block_descriptor_33;
  v37 = _Block_copy(v0 + 8);
  swift_retain();
  swift_release();
  objc_msgSend(v36, sel_fetchImageQualitySettingsWithCompletion_, v37);
  _Block_release(v37);
LABEL_14:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return ((uint64_t (*)(void))v0[1])();
}

uint64_t sub_213FE82FC()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  void *v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v1 = *(void **)(v0 + 224);
  sub_213FF7778();
  v2 = v1;
  v3 = v1;
  v4 = sub_213FF8D2C();
  v5 = sub_213FF95C0();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = *(void **)(v0 + 224);
    v16 = *(_QWORD *)(v0 + 168);
    v17 = *(_QWORD *)(v0 + 160);
    v18 = *(_QWORD *)(v0 + 176);
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = swift_slowAlloc();
    v19 = v8;
    *(_DWORD *)v7 = 136315138;
    swift_getErrorValue();
    v9 = sub_213FF9950();
    *(_QWORD *)(v0 + 144) = sub_213F7DD50(v9, v10, &v19);
    sub_213FF971C();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_213F36000, v4, v5, "Received an error while checking for proofing flow availability %s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2199C815C](v8, -1, -1);
    MEMORY[0x2199C815C](v7, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v18, v17);
  }
  else
  {
    v11 = *(void **)(v0 + 224);
    v13 = *(_QWORD *)(v0 + 168);
    v12 = *(_QWORD *)(v0 + 176);
    v14 = *(_QWORD *)(v0 + 160);

    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v12, v14);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_213FE8514(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  v6 = sub_213FF8810();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_213FF8D38();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v32 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v32 - v15;
  if (a2)
  {
    v35 = a1;
    v17 = a2;
    sub_213FF7778();
    v18 = a2;
    v19 = a2;
    v20 = sub_213FF8D2C();
    v21 = sub_213FF95CC();
    if (os_log_type_enabled(v20, v21))
    {
      v22 = (uint8_t *)swift_slowAlloc();
      v23 = swift_slowAlloc();
      v34 = a3;
      v24 = v23;
      v37 = v23;
      *(_DWORD *)v22 = 136446210;
      v33 = v10;
      swift_getErrorValue();
      v25 = sub_213FF9950();
      v36 = sub_213F7DD50(v25, v26, &v37);
      sub_213FF971C();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_213F36000, v20, v21, "Received error while trying to fetch the image quality model: %{public}s", v22, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2199C815C](v24, -1, -1);
      MEMORY[0x2199C815C](v22, -1, -1);

      (*(void (**)(char *, uint64_t))(v11 + 8))(v16, v33);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v11 + 8))(v16, v10);
    }
    v28 = v35;
    swift_retain();
    v29 = v28;
  }
  else
  {
    if (a1)
    {
      swift_retain();
      sub_213FC2D20(a1);
      return swift_release();
    }
    (*(void (**)(char *, _QWORD, uint64_t))(v7 + 104))(v9, *MEMORY[0x24BE1DCC8], v6);
    sub_213F7DA10(MEMORY[0x24BEE4AF8]);
    sub_213FF881C();
    v30 = v10;
    sub_213F3B3C0((unint64_t *)&qword_254D5C040, (uint64_t (*)(uint64_t))MEMORY[0x24BE1DE60], MEMORY[0x24BE1DE78]);
    v31 = (void *)swift_allocError();
    sub_213FF8828();
    sub_213FF7778();
    sub_213FF7784();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v30);

    swift_retain();
    v29 = 0;
  }
  sub_213FC2D20(v29);
  return swift_release();
}

void sub_213FE8904()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  void *v9;
  void *v10;
  _QWORD aBlock[6];

  v1 = v0;
  v2 = sub_213FF8D38();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_213FF7778();
  v6 = sub_213FF8D2C();
  v7 = sub_213FF95C0();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_213F36000, v6, v7, "Requesting to fetch BiomeFedStatsUI", v8, 2u);
    MEMORY[0x2199C815C](v8, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v9 = *(void **)(v1 + 112);
  aBlock[4] = sub_213FF2E84;
  aBlock[5] = v1;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_213FE541C;
  aBlock[3] = &block_descriptor_16_0;
  v10 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v9, sel_fetchBiomeFedStatsUIWithCompletion_, v10);
  _Block_release(v10);
}

void sub_213FE8A74(void *a1, void *a2, uint64_t a3)
{
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
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  id v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  void *v30;
  void (*v31)(char *, uint64_t);
  char *v32;
  NSObject *v33;
  os_log_type_t v34;
  uint8_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v6 = sub_213FF8D38();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v8);
  v13 = (char *)&v36 - v12;
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v36 - v14;
  if (a2)
  {
    v16 = a2;
    sub_213FF7778();
    v17 = a2;
    v18 = a2;
    v19 = sub_213FF8D2C();
    v20 = sub_213FF95CC();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = (uint8_t *)swift_slowAlloc();
      v22 = swift_slowAlloc();
      v37 = v6;
      v23 = v22;
      v39 = v22;
      *(_DWORD *)v21 = 136315138;
      swift_getErrorValue();
      v24 = sub_213FF9950();
      v38 = sub_213F7DD50(v24, v25, &v39);
      sub_213FF971C();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_213F36000, v19, v20, "Received an error while attempting to fetch the Biome-FedStatsUI -> %s", v21, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2199C815C](v23, -1, -1);
      MEMORY[0x2199C815C](v21, -1, -1);

      (*(void (**)(char *, uint64_t))(v7 + 8))(v15, v37);
      return;
    }

    v31 = *(void (**)(char *, uint64_t))(v7 + 8);
    v32 = v15;
    goto LABEL_12;
  }
  if (!a1)
  {
    sub_213FF7778();
    v33 = sub_213FF8D2C();
    v34 = sub_213FF95CC();
    if (os_log_type_enabled(v33, v34))
    {
      v35 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v35 = 0;
      _os_log_impl(&dword_213F36000, v33, v34, "The biome fed stats UI Config was not a part of the dynamic workflow", v35, 2u);
      MEMORY[0x2199C815C](v35, -1, -1);
    }

    v31 = *(void (**)(char *, uint64_t))(v7 + 8);
    v32 = v13;
LABEL_12:
    v31(v32, v6);
    return;
  }
  v26 = a1;
  sub_213FF7778();
  v27 = sub_213FF8D2C();
  v28 = sub_213FF95C0();
  if (os_log_type_enabled(v27, v28))
  {
    v29 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v29 = 0;
    _os_log_impl(&dword_213F36000, v27, v28, "Successfully received biome-fedstats UI config from the server", v29, 2u);
    MEMORY[0x2199C815C](v29, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  v30 = *(void **)(a3 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_biomeFedStatsUIConfig);
  *(_QWORD *)(a3 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_biomeFedStatsUIConfig) = a1;

}

void sub_213FE8DE0(uint64_t a1, void *a2, void *a3)
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

uint64_t sub_213FE8E54(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t result;
  uint64_t v14;
  char *v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  uint64_t (*v30)(char *, uint64_t);
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v8 = sub_213FF8D38();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = MEMORY[0x24BDAC7A8](v10);
  v15 = (char *)&v32 - v14;
  if (a3)
  {
    v16 = a3;
    sub_213FF7778();
    v17 = a3;
    v18 = a3;
    v19 = sub_213FF8D2C();
    v20 = sub_213FF95C0();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = (uint8_t *)swift_slowAlloc();
      v22 = swift_slowAlloc();
      v33 = v8;
      v23 = v22;
      v35 = v22;
      *(_DWORD *)v21 = 136315138;
      swift_getErrorValue();
      v24 = sub_213FF9950();
      v34 = sub_213F7DD50(v24, v25, &v35);
      sub_213FF971C();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_213F36000, v19, v20, "Received an error while fetching terms and conditions %s", v21, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2199C815C](v23, -1, -1);
      MEMORY[0x2199C815C](v21, -1, -1);

      return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v15, v33);
    }

    v30 = *(uint64_t (**)(char *, uint64_t))(v9 + 8);
    v31 = v15;
  }
  else
  {
    if (!a2)
      return result;
    v26 = *(_QWORD *)(a4 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager__termsAndConditions);
    swift_bridgeObjectRetain();
    os_unfair_lock_lock((os_unfair_lock_t)(v26 + 32));
    swift_bridgeObjectRelease();
    *(_QWORD *)(v26 + 16) = a1;
    *(_QWORD *)(v26 + 24) = a2;
    swift_bridgeObjectRetain();
    os_unfair_lock_unlock((os_unfair_lock_t)(v26 + 32));
    swift_bridgeObjectRelease();
    sub_213FF7778();
    v27 = sub_213FF8D2C();
    v28 = sub_213FF95C0();
    if (os_log_type_enabled(v27, v28))
    {
      v29 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v29 = 0;
      _os_log_impl(&dword_213F36000, v27, v28, "Successfully stored terms and conditions in memory", v29, 2u);
      MEMORY[0x2199C815C](v29, -1, -1);
    }

    v30 = *(uint64_t (**)(char *, uint64_t))(v9 + 8);
    v31 = v12;
  }
  return v30(v31, v8);
}

uint64_t sub_213FE9150(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t (*v23)(char *, uint64_t);
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v2 = sub_213FF8D38();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v25 - v7;
  if (a1)
  {
    v9 = a1;
    sub_213FF7778();
    v10 = a1;
    v11 = a1;
    v12 = sub_213FF8D2C();
    v13 = sub_213FF95C0();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = swift_slowAlloc();
      v26 = v2;
      v15 = (uint8_t *)v14;
      v16 = swift_slowAlloc();
      v28 = v16;
      *(_DWORD *)v15 = 136315138;
      swift_getErrorValue();
      v17 = sub_213FF9950();
      v27 = sub_213F7DD50(v17, v18, &v28);
      sub_213FF971C();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_213F36000, v12, v13, "received an error from opportunistic file upload %s", v15, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2199C815C](v16, -1, -1);
      MEMORY[0x2199C815C](v15, -1, -1);

      return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v26);
    }

    v23 = *(uint64_t (**)(char *, uint64_t))(v3 + 8);
    v24 = v6;
  }
  else
  {
    sub_213FF7778();
    v20 = sub_213FF8D2C();
    v21 = sub_213FF95C0();
    if (os_log_type_enabled(v20, v21))
    {
      v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_213F36000, v20, v21, "opportunitistic file uploads complete", v22, 2u);
      MEMORY[0x2199C815C](v22, -1, -1);
    }

    v23 = *(uint64_t (**)(char *, uint64_t))(v3 + 8);
    v24 = v8;
  }
  return v23(v24, v2);
}

uint64_t sub_213FE93F0()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1[18] = v0;
  v2 = sub_213FF8810();
  v1[19] = v2;
  v1[20] = *(_QWORD *)(v2 - 8);
  v1[21] = swift_task_alloc();
  v3 = sub_213FF881C();
  v1[22] = v3;
  v1[23] = *(_QWORD *)(v3 - 8);
  v1[24] = swift_task_alloc();
  v1[25] = swift_task_alloc();
  v1[26] = swift_task_alloc();
  v4 = sub_213FF8D38();
  v1[27] = v4;
  v1[28] = *(_QWORD *)(v4 - 8);
  v1[29] = swift_task_alloc();
  v1[30] = swift_task_alloc();
  v1[31] = swift_task_alloc();
  v1[32] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_213FE94E4()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;

  sub_213FF7778();
  v1 = sub_213FF8D2C();
  v2 = sub_213FF95C0();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_213F36000, v1, v2, "Preparing for proofing", v3, 2u);
    MEMORY[0x2199C815C](v3, -1, -1);
  }
  v4 = *(_QWORD *)(v0 + 256);
  v5 = *(_QWORD *)(v0 + 216);
  v6 = *(_QWORD *)(v0 + 224);
  v7 = *(_QWORD *)(v0 + 144);

  v8 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
  *(_QWORD *)(v0 + 264) = v8;
  v8(v4, v5);
  swift_retain();
  v9 = sub_213F6983C();
  swift_release();
  *(_QWORD *)(v0 + 120) = v9;
  sub_213FF0D98(2u);
  v10 = *(_QWORD *)(v7 + 120);
  v11 = *(_QWORD *)(v0 + 120);
  v12 = swift_task_alloc();
  *(_QWORD *)(v12 + 16) = v11;
  *(_QWORD *)(v12 + 24) = v10;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D5F348);
  sub_213FF9650();
  swift_bridgeObjectRelease();
  swift_release();
  swift_task_dealloc();
  v13 = *(_QWORD *)(v0 + 128);
  *(_QWORD *)(v0 + 272) = v13;
  if (v13)
  {
    v14 = *(void **)(*(_QWORD *)(v0 + 144) + 112);
    *(_QWORD *)(v0 + 16) = v0;
    *(_QWORD *)(v0 + 24) = sub_213FE9878;
    v15 = swift_continuation_init();
    *(_QWORD *)(v0 + 80) = MEMORY[0x24BDAC760];
    v16 = (_QWORD *)(v0 + 80);
    v16[1] = 0x40000000;
    v16[2] = sub_213FE1FB4;
    v16[3] = &block_descriptor_14_0;
    v16[4] = v15;
    objc_msgSend(v14, sel_prepareForProofingIdentity_completionHandler_, v13, v16);
    return swift_continuation_await();
  }
  else
  {
    v18 = *(_QWORD *)(v0 + 240);
    v19 = *(_QWORD *)(v0 + 208);
    v20 = *(_QWORD *)(v0 + 216);
    v21 = *(_QWORD *)(v0 + 176);
    v22 = *(_QWORD *)(v0 + 184);
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 160) + 104))(*(_QWORD *)(v0 + 168), *MEMORY[0x24BE1DCC8], *(_QWORD *)(v0 + 152));
    sub_213F7DA10(MEMORY[0x24BEE4AF8]);
    sub_213FF8828();
    sub_213F3B3C0((unint64_t *)&qword_254D5C040, (uint64_t (*)(uint64_t))MEMORY[0x24BE1DE60], MEMORY[0x24BE1DE78]);
    v23 = (void *)swift_allocError();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v22 + 16))(v24, v19, v21);
    sub_213FF7778();
    sub_213FF7784();
    v8(v18, v20);
    (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v19, v21);

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_213FE9878()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 280) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_213FE98D8()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;
  void *v4;
  void (*v5)(uint64_t, uint64_t);
  uint64_t v6;
  uint64_t v7;

  sub_213FF7778();
  v1 = sub_213FF8D2C();
  v2 = sub_213FF95B4();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_213F36000, v1, v2, "Called daemon to prepare for proofing", v3, 2u);
    MEMORY[0x2199C815C](v3, -1, -1);
  }
  v5 = *(void (**)(uint64_t, uint64_t))(v0 + 264);
  v4 = *(void **)(v0 + 272);
  v6 = *(_QWORD *)(v0 + 248);
  v7 = *(_QWORD *)(v0 + 216);

  v5(v6, v7);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_213FE9A00()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  void (*v10)(uint64_t, uint64_t, uint64_t);
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint64_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  void (*v20)(uint64_t, uint64_t);
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t, uint64_t);
  uint64_t v33;
  uint64_t v34;
  void (*v35)(uint64_t, uint64_t);
  uint64_t v36;

  v1 = *(void **)(v0 + 280);
  v2 = *(_QWORD *)(v0 + 240);
  v29 = *(_QWORD *)(v0 + 216);
  v31 = *(void (**)(uint64_t, uint64_t))(v0 + 264);
  v3 = *(_QWORD *)(v0 + 200);
  v33 = *(_QWORD *)(v0 + 192);
  v4 = *(_QWORD *)(v0 + 176);
  v27 = *(_QWORD *)(v0 + 184);
  v5 = *(_QWORD *)(v0 + 160);
  v6 = *(_QWORD *)(v0 + 168);
  v7 = *(_QWORD *)(v0 + 152);
  swift_willThrow();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v5 + 104))(v6, *MEMORY[0x24BE1DC40], v7);
  v8 = v1;
  sub_213F7DA10(MEMORY[0x24BEE4AF8]);
  sub_213FF8828();
  sub_213F3B3C0((unint64_t *)&qword_254D5C040, (uint64_t (*)(uint64_t))MEMORY[0x24BE1DE60], MEMORY[0x24BE1DE78]);
  v9 = (void *)swift_allocError();
  v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(v27 + 16);
  v10(v11, v3, v4);
  sub_213FF7778();
  sub_213FF7784();
  v31(v2, v29);

  sub_213FF7778();
  v10(v33, v3, v4);
  v12 = sub_213FF8D2C();
  v13 = sub_213FF95CC();
  if (os_log_type_enabled(v12, v13))
  {
    v30 = *(_QWORD *)(v0 + 232);
    v32 = *(void (**)(uint64_t, uint64_t))(v0 + 264);
    v28 = *(_QWORD *)(v0 + 216);
    v14 = *(_QWORD *)(v0 + 192);
    v34 = *(_QWORD *)(v0 + 184);
    v15 = *(_QWORD *)(v0 + 176);
    v16 = (uint8_t *)swift_slowAlloc();
    v17 = swift_slowAlloc();
    v36 = v17;
    *(_DWORD *)v16 = 136315138;
    v18 = sub_213FF9950();
    *(_QWORD *)(v0 + 136) = sub_213F7DD50(v18, v19, &v36);
    sub_213FF971C();
    swift_bridgeObjectRelease();
    v35 = *(void (**)(uint64_t, uint64_t))(v34 + 8);
    v35(v14, v15);
    _os_log_impl(&dword_213F36000, v12, v13, "Ignoring Error preparing for proofing: %s", v16, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2199C815C](v17, -1, -1);
    MEMORY[0x2199C815C](v16, -1, -1);

    v32(v30, v28);
  }
  else
  {
    v20 = *(void (**)(uint64_t, uint64_t))(v0 + 264);
    v21 = *(_QWORD *)(v0 + 232);
    v22 = *(_QWORD *)(v0 + 216);
    v35 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v0 + 184) + 8);
    v35(*(_QWORD *)(v0 + 192), *(_QWORD *)(v0 + 176));

    v20(v21, v22);
  }
  v23 = *(void **)(v0 + 272);
  v24 = *(_QWORD *)(v0 + 200);
  v25 = *(_QWORD *)(v0 + 176);
  swift_willThrow();

  v35(v24, v25);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_213FE9D84()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  void (*v15)(char *, uint64_t);
  void *v16;
  void *v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v24;

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D5F760);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_213FF8D38();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v24 - v10;
  sub_213FF7778();
  v12 = sub_213FF8D2C();
  v13 = sub_213FF95C0();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_213F36000, v12, v13, "Retrieving new liveness config", v14, 2u);
    MEMORY[0x2199C815C](v14, -1, -1);
  }

  v15 = *(void (**)(char *, uint64_t))(v6 + 8);
  v15(v11, v5);
  v16 = *(void **)(v1 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_livenessConfig);
  *(_QWORD *)(v1 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_livenessConfig) = 0;

  v17 = *(void **)(v1 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_livenessConfigFetchError);
  *(_QWORD *)(v1 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_livenessConfigFetchError) = 0;

  sub_213FF7778();
  v18 = sub_213FF8D2C();
  v19 = sub_213FF95C0();
  if (os_log_type_enabled(v18, v19))
  {
    v20 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v20 = 0;
    _os_log_impl(&dword_213F36000, v18, v19, "Entering the liveness config fetch lock", v20, 2u);
    MEMORY[0x2199C815C](v20, -1, -1);
  }

  v15(v9, v5);
  dispatch_group_enter(*(dispatch_group_t *)(v1
                                           + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_livenenessConfigFetchGroup));
  v21 = sub_213FF956C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v4, 1, 1, v21);
  v22 = (_QWORD *)swift_allocObject();
  v22[2] = 0;
  v22[3] = 0;
  v22[4] = v1;
  swift_retain();
  sub_213F4BE78((uint64_t)v4, (uint64_t)&unk_254D60FF0, (uint64_t)v22);
  return swift_release();
}

uint64_t sub_213FE9FF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4[17] = a4;
  v5 = sub_213FF8810();
  v4[18] = v5;
  v4[19] = *(_QWORD *)(v5 - 8);
  v4[20] = swift_task_alloc();
  v6 = sub_213FF881C();
  v4[21] = v6;
  v4[22] = *(_QWORD *)(v6 - 8);
  v4[23] = swift_task_alloc();
  v4[24] = swift_task_alloc();
  v7 = sub_213FF8D38();
  v4[25] = v7;
  v4[26] = *(_QWORD *)(v7 - 8);
  v4[27] = swift_task_alloc();
  v4[28] = swift_task_alloc();
  v4[29] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_213FEA0D0()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = *(void **)(v0[17] + 112);
  v0[7] = v0 + 15;
  v0[2] = v0;
  v0[3] = sub_213FEA168;
  v2 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v3 = v0 + 10;
  v3[1] = 0x40000000;
  v3[2] = sub_213FE3254;
  v3[3] = &block_descriptor_13_0;
  v3[4] = v2;
  objc_msgSend(v1, sel_getLivenessConfigWithCompletionHandler_, v3);
  return swift_continuation_await();
}

uint64_t sub_213FEA168()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 240) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_213FEA1C8()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = *(_QWORD *)(v0 + 136);
  v2 = *(void **)(v0 + 120);
  v3 = *(void **)(v1 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_livenessConfig);
  *(_QWORD *)(v1 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_livenessConfig) = v2;
  v4 = v2;

  sub_213FF776C();
  sub_213FF7778();
  v5 = sub_213FF8D2C();
  v6 = sub_213FF95C0();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_213F36000, v5, v6, "Signalling the liveness config fetch lock", v7, 2u);
    MEMORY[0x2199C815C](v7, -1, -1);
  }
  v8 = *(_QWORD *)(v0 + 232);
  v9 = *(_QWORD *)(v0 + 208);
  v10 = *(_QWORD *)(v0 + 200);
  v11 = *(_QWORD *)(v0 + 136);

  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
  dispatch_group_leave(*(dispatch_group_t *)(v11
                                           + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_livenenessConfigFetchGroup));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_213FEA34C()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  void (*v10)(uint64_t, uint64_t, uint64_t);
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  uint64_t v16;
  uint8_t *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  NSObject *v31;
  os_log_type_t v32;
  uint8_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;

  v1 = *(void **)(v0 + 240);
  v2 = *(_QWORD *)(v0 + 224);
  v3 = *(_QWORD *)(v0 + 192);
  v41 = *(_QWORD *)(v0 + 208);
  v43 = *(_QWORD *)(v0 + 200);
  v45 = *(_QWORD *)(v0 + 184);
  v4 = *(_QWORD *)(v0 + 168);
  v40 = *(_QWORD *)(v0 + 176);
  v5 = *(_QWORD *)(v0 + 152);
  v6 = *(_QWORD *)(v0 + 160);
  v7 = *(_QWORD *)(v0 + 144);
  swift_willThrow();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v5 + 104))(v6, *MEMORY[0x24BE1DC40], v7);
  v8 = v1;
  sub_213F7DA10(MEMORY[0x24BEE4AF8]);
  sub_213FF8828();
  sub_213F3B3C0((unint64_t *)&qword_254D5C040, (uint64_t (*)(uint64_t))MEMORY[0x24BE1DE60], MEMORY[0x24BE1DE78]);
  v9 = (void *)swift_allocError();
  v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(v40 + 16);
  v10(v11, v3, v4);
  sub_213FF7778();
  sub_213FF7784();
  v12 = *(void (**)(uint64_t, uint64_t))(v41 + 8);
  v12(v2, v43);

  sub_213FF7778();
  v10(v45, v3, v4);
  v13 = sub_213FF8D2C();
  v14 = sub_213FF95CC();
  if (os_log_type_enabled(v13, v14))
  {
    v42 = *(_QWORD *)(v0 + 200);
    v44 = *(_QWORD *)(v0 + 216);
    v15 = *(_QWORD *)(v0 + 184);
    v39 = *(_QWORD *)(v0 + 176);
    v16 = *(_QWORD *)(v0 + 168);
    v17 = (uint8_t *)swift_slowAlloc();
    v46 = swift_slowAlloc();
    v18 = v46;
    *(_DWORD *)v17 = 136315138;
    v19 = sub_213FF9950();
    *(_QWORD *)(v0 + 128) = sub_213F7DD50(v19, v20, &v46);
    sub_213FF971C();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v15, v16);
    _os_log_impl(&dword_213F36000, v13, v14, "Attempt to get new liveness config failed with error: %s", v17, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2199C815C](v18, -1, -1);
    MEMORY[0x2199C815C](v17, -1, -1);

    v12(v44, v42);
  }
  else
  {
    v21 = *(_QWORD *)(v0 + 216);
    v22 = *(_QWORD *)(v0 + 200);
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 176) + 8))(*(_QWORD *)(v0 + 184), *(_QWORD *)(v0 + 168));

    v12(v21, v22);
  }
  v23 = *(void **)(v0 + 240);
  v24 = *(_QWORD *)(v0 + 192);
  v25 = *(_QWORD *)(v0 + 168);
  v26 = *(_QWORD *)(v0 + 176);
  v27 = *(_QWORD *)(v0 + 136);
  v28 = swift_allocError();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v26 + 32))(v29, v24, v25);

  v30 = *(void **)(v27 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_livenessConfigFetchError);
  *(_QWORD *)(v27 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_livenessConfigFetchError) = v28;

  sub_213FF7778();
  v31 = sub_213FF8D2C();
  v32 = sub_213FF95C0();
  if (os_log_type_enabled(v31, v32))
  {
    v33 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v33 = 0;
    _os_log_impl(&dword_213F36000, v31, v32, "Signalling the liveness config fetch lock", v33, 2u);
    MEMORY[0x2199C815C](v33, -1, -1);
  }
  v34 = *(_QWORD *)(v0 + 232);
  v35 = *(_QWORD *)(v0 + 208);
  v36 = *(_QWORD *)(v0 + 200);
  v37 = *(_QWORD *)(v0 + 136);

  (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v34, v36);
  dispatch_group_leave(*(dispatch_group_t *)(v37
                                           + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_livenenessConfigFetchGroup));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_213FEA78C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v20 = a1;
  v19 = sub_213FF8D38();
  v1 = *(_QWORD *)(v19 - 8);
  v2 = MEMORY[0x24BDAC7A8](v19);
  v4 = (char *)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v2);
  v5 = sub_213FF8708();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_213FF80A8();
  if (v10 >> 60 == 15)
  {
    sub_213FF7778();
    v11 = sub_213FF8D2C();
    v12 = sub_213FF95C0();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_213F36000, v11, v12, "Unable to fetch the attributeConfig, proofing cannot continue", v13, 2u);
      MEMORY[0x2199C815C](v13, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v19);
    v16 = 1;
  }
  else
  {
    v14 = v9;
    v15 = v10;
    sub_213FF73F4();
    swift_allocObject();
    sub_213FF73E8();
    sub_213F3B3C0(&qword_254D60FE0, (uint64_t (*)(uint64_t))MEMORY[0x24BE1DA00], MEMORY[0x24BE1DA10]);
    sub_213FF73DC();
    sub_213F4CF08(v14, v15);
    swift_release();
    (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))(v20, v8, v5);
    v16 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 56))(v20, v16, 1, v5);
}

uint64_t sub_213FEAB64()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1[16] = v0;
  v2 = sub_213FF8D38();
  v1[17] = v2;
  v1[18] = *(_QWORD *)(v2 - 8);
  v1[19] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_213FEABC4()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = *(void **)(v0[16] + 112);
  v0[7] = v0 + 15;
  v0[2] = v0;
  v0[3] = sub_213FEAC5C;
  v2 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v3 = v0 + 10;
  v3[1] = 0x40000000;
  v3[2] = sub_213FE3254;
  v3[3] = &block_descriptor_7;
  v3[4] = v2;
  objc_msgSend(v1, sel_proofingFlowAvailabilityWithCompletionHandler_, v3);
  return swift_continuation_await();
}

uint64_t sub_213FEAC5C()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 160) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_213FEACBC()
{
  uint64_t v0;
  void *v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v1 = *(void **)(v0 + 120);
  sub_213FF7778();
  v2 = sub_213FF8D2C();
  v3 = sub_213FF95C0();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_213F36000, v2, v3, "Proofing status saved", v4, 2u);
    MEMORY[0x2199C815C](v4, -1, -1);
  }
  v6 = *(_QWORD *)(v0 + 144);
  v5 = *(_QWORD *)(v0 + 152);
  v7 = *(_QWORD *)(v0 + 136);

  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
  v8 = sub_213FF7DE4();
  v9 = sub_213FF7DF0();

  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v8, v9);
}

uint64_t sub_213FEADB4()
{
  uint64_t v0;

  swift_willThrow();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void *sub_213FEADF8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint8_t *v20;
  uint8_t *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  id v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v1 = v0;
  v2 = sub_213FF8810();
  v31 = *(_QWORD *)(v2 - 8);
  v32 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v29 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_213FF881C();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_213FF8D38();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_213FF7778();
  v13 = sub_213FF8D2C();
  v14 = sub_213FF95C0();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = (uint8_t *)swift_slowAlloc();
    v30 = v1;
    v16 = v4;
    v17 = v8;
    v18 = v6;
    v19 = v5;
    v20 = v15;
    *(_WORD *)v15 = 0;
    _os_log_impl(&dword_213F36000, v13, v14, "Waiting for the liveness config fetch lock", v15, 2u);
    v21 = v20;
    v5 = v19;
    v6 = v18;
    v8 = v17;
    v4 = v16;
    v1 = v30;
    MEMORY[0x2199C815C](v21, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  v22 = *(id *)(v1 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_livenenessConfigFetchGroup);
  sub_213FF9614();

  v23 = *(void **)(v1 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_livenessConfigFetchError);
  if (v23)
  {
    v24 = *(void **)(v1 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_livenessConfigFetchError);
  }
  else
  {
    v24 = *(void **)(v1 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_livenessConfig);
    if (v24)
    {
      v25 = v24;
    }
    else
    {
      (*(void (**)(char *, _QWORD, uint64_t))(v31 + 104))(v4, *MEMORY[0x24BE1DCC8], v32);
      sub_213F7DA10(MEMORY[0x24BEE4AF8]);
      sub_213FF8828();
      sub_213F3B3C0((unint64_t *)&qword_254D5C040, (uint64_t (*)(uint64_t))MEMORY[0x24BE1DE60], MEMORY[0x24BE1DE78]);
      v24 = (void *)swift_allocError();
      (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))(v26, v8, v5);
    }
  }
  v27 = v23;
  return v24;
}

uint64_t sub_213FEB0D4(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t result;
  uint64_t v12;

  v2 = v1;
  v4 = sub_213FF8D38();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_213FF7778();
  v8 = sub_213FF8D2C();
  v9 = sub_213FF95C0();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_213F36000, v8, v9, "Invoked delegate to close the view", v10, 2u);
    MEMORY[0x2199C815C](v10, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  sub_213FEB1F4();
  result = MEMORY[0x2199C81F8](v2 + 96);
  if (result)
  {
    sub_213F7D660(a1);
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_213FEB1F4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE v19[24];

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D5DF38);
  MEMORY[0x24BDAC7A8](v2);
  v4 = &v19[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = sub_213FF8D38();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = &v19[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v9 = *(_QWORD *)(v1 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager__termsAndConditions);
  os_unfair_lock_lock((os_unfair_lock_t)(v9 + 32));
  swift_bridgeObjectRelease();
  *(_QWORD *)(v9 + 16) = 0;
  *(_QWORD *)(v9 + 24) = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)(v9 + 32));
  v10 = *(_QWORD *)(v1 + 144);
  swift_retain();
  sub_213FF7778();
  v11 = sub_213FF8D2C();
  v12 = sub_213FF95C0();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_213F36000, v11, v12, "reset page iterator", v13, 2u);
    MEMORY[0x2199C815C](v13, -1, -1);
  }

  (*(void (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
  *(_QWORD *)(v10 + 16) = 0;
  swift_release();
  swift_retain();
  sub_213FC6910();
  swift_release();
  v14 = MEMORY[0x24BEE4B00];
  *(_QWORD *)(v1 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_attributeMessages) = MEMORY[0x24BEE4B00];
  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_messageReplacements) = v14;
  swift_bridgeObjectRelease();
  v15 = (_QWORD *)(v1 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_cardArtData);
  swift_beginAccess();
  *v15 = v14;
  swift_bridgeObjectRelease();
  v16 = type metadata accessor for IdentityProofingLivenessVideoData(0);
  (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v4, 1, 1, v16);
  v17 = v1 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_livenessVideoData;
  swift_beginAccess();
  sub_213FB17EC((uint64_t)v4, v17, &qword_254D5DF38);
  swift_endAccess();
  *(_QWORD *)(v1 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_livenessVideoUploadsManager) = 0;
  return swift_release();
}

uint64_t sub_213FEB458()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v15;

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D5F760);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_213FF8D38();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_213FF7778();
  v9 = sub_213FF8D2C();
  v10 = sub_213FF95C0();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_213F36000, v9, v10, "notify active configurations changed invoked on the caller", v11, 2u);
    MEMORY[0x2199C815C](v11, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v12 = sub_213FF956C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v4, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = v1;
  swift_retain();
  sub_213F4BE78((uint64_t)v4, (uint64_t)&unk_254D60FD8, (uint64_t)v13);
  return swift_release();
}

uint64_t sub_213FEB5E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;

  v4[21] = a4;
  v5 = sub_213FF8D38();
  v4[22] = v5;
  v4[23] = *(_QWORD *)(v5 - 8);
  v4[24] = swift_task_alloc();
  v4[25] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_213FEB658()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = *(void **)(v0[21] + 112);
  v0[7] = v0 + 18;
  v0[2] = v0;
  v0[3] = sub_213FEB6F0;
  v2 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v3 = v0 + 10;
  v3[1] = 0x40000000;
  v3[2] = sub_213FE3254;
  v3[3] = &block_descriptor_6_6;
  v3[4] = v2;
  objc_msgSend(v1, sel_proofingFlowAvailabilityWithCompletionHandler_, v3);
  return swift_continuation_await();
}

uint64_t sub_213FEB6F0()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 208) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_213FEB750()
{
  uint64_t v0;
  void *v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v1 = *(void **)(v0 + 144);
  sub_213FF7778();
  v2 = sub_213FF8D2C();
  v3 = sub_213FF95C0();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_213F36000, v2, v3, "proofing status doesn't exist. Cannot return the active configuration.", v4, 2u);
    MEMORY[0x2199C815C](v4, -1, -1);
  }
  v5 = *(_QWORD *)(v0 + 200);
  v6 = *(_QWORD *)(v0 + 176);
  v7 = *(_QWORD *)(v0 + 184);
  v8 = *(_QWORD *)(v0 + 168);

  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  v9 = MEMORY[0x2199C81F8](v8 + 96);
  if (v9)
  {
    v10 = v9;
    v11 = sub_213FF7DF0();
    v12 = (void *)MEMORY[0x2199C81F8](v10 + OBJC_IVAR____TtC9CoreIDVUI33CIDVUIInternalProofingFlowManager_delegate);
    if (v12)
    {
      v13 = v12;
      if ((objc_msgSend(v12, sel_respondsToSelector_, sel_proofingFlowManager_didChangeActiveConfigurations_) & 1) != 0)
      {
        v14 = (void *)MEMORY[0x2199C81F8](v10 + OBJC_IVAR____TtC9CoreIDVUI33CIDVUIInternalProofingFlowManager_externalProofingFlowManager);
        sub_213FBF360(v11);
        sub_213F3F7CC(0, &qword_254D5DC70);
        v15 = (void *)sub_213FF94D0();
        objc_msgSend(v13, sel_proofingFlowManager_didChangeActiveConfigurations_, v14, v15);

        swift_unknownObjectRelease();
        swift_bridgeObjectRelease();

      }
      else
      {
        swift_unknownObjectRelease();
      }
    }
    swift_unknownObjectRelease();

    swift_bridgeObjectRelease();
  }
  else
  {

  }
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_213FEB920()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  void *v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v1 = *(void **)(v0 + 208);
  swift_willThrow();
  sub_213FF7778();
  v2 = v1;
  v3 = v1;
  v4 = sub_213FF8D2C();
  v5 = sub_213FF95CC();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = *(void **)(v0 + 208);
    v16 = *(_QWORD *)(v0 + 184);
    v17 = *(_QWORD *)(v0 + 176);
    v18 = *(_QWORD *)(v0 + 192);
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = swift_slowAlloc();
    v19 = v8;
    *(_DWORD *)v7 = 136315138;
    swift_getErrorValue();
    v9 = sub_213FF9950();
    *(_QWORD *)(v0 + 160) = sub_213F7DD50(v9, v10, &v19);
    sub_213FF971C();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_213F36000, v4, v5, "received an error in checking the proofing status %s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2199C815C](v8, -1, -1);
    MEMORY[0x2199C815C](v7, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v18, v17);
  }
  else
  {
    v11 = *(void **)(v0 + 208);
    v13 = *(_QWORD *)(v0 + 184);
    v12 = *(_QWORD *)(v0 + 192);
    v14 = *(_QWORD *)(v0 + 176);

    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v12, v14);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_213FEBB2C(void *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void (*v8)(uint64_t);
  uint64_t v9;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;

  v4 = sub_213FF8D38();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (objc_msgSend(a1, sel_authorizationStatus) == (id)2)
  {
    swift_retain();
    sub_213FF8624();
    sub_213FF851C();
    v8 = *(void (**)(uint64_t))(**(_QWORD **)(a2 + 152) + 96);
    v9 = swift_retain();
    v8(v9);
    swift_release();
    sub_213FE3B98();
    sub_213FF7F40();
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_213FF7778();
    v11 = sub_213FF8D2C();
    v12 = sub_213FF95C0();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_213F36000, v11, v12, "The notification has not been authorized by the user", v13, 2u);
      MEMORY[0x2199C815C](v13, -1, -1);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

uint64_t sub_213FEBD30()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v1 = sub_213FF7DD8();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8]();
  v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *(_QWORD *)(v0 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_attributeMessages);
  v6 = *(_QWORD *)(v0 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_textReplacementHelper);
  v7 = *(_QWORD *)(v0 + 176);
  v8 = *(_QWORD *)(v0 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_messageReplacements);
  v9 = *(_QWORD *)(v0 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_state);
  v10 = *(_QWORD *)(v0 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_state + 8);
  v11 = *(_QWORD *)(v0 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_country + 8);
  v15 = *(_QWORD *)(v0 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_country);
  v16 = v9;
  v12 = v0 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_idType;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v12, v1);
  type metadata accessor for IdentityProofingUIConfigFactory();
  swift_allocObject();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return sub_213F9DE4C(v5, v7, v6, v8, v16, v10, v15, v11, (uint64_t)v4);
}

void sub_213FEBE98()
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
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  NSObject *v20;
  uint64_t v21;
  uint8_t *v22;
  uint8_t *v23;
  uint8_t *v24;
  void (*v25)(char *, uint64_t);
  void *v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  uint64_t v30;
  uint64_t v31;

  v1 = v0;
  v2 = sub_213FF8810();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_213FF8D38();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v30 - v11;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D5F760);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v30 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = *(_QWORD *)(v1 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_state + 8);
  if (v16)
  {
    v17 = *(_QWORD *)(v1 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_state);
    v18 = sub_213FF956C();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v15, 1, 1, v18);
    v19 = (_QWORD *)swift_allocObject();
    v19[2] = 0;
    v19[3] = 0;
    v19[4] = v1;
    v19[5] = v17;
    v19[6] = v16;
    swift_bridgeObjectRetain();
    swift_retain();
    sub_213F4BE78((uint64_t)v15, (uint64_t)&unk_254D60FC8, (uint64_t)v19);
    swift_release();
  }
  else
  {
    sub_213FF7778();
    v20 = sub_213FF8D2C();
    v21 = sub_213FF95C0();
    if (os_log_type_enabled(v20, (os_log_type_t)v21))
    {
      v22 = (uint8_t *)swift_slowAlloc();
      v31 = v6;
      v23 = v22;
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_213F36000, v20, (os_log_type_t)v21, "State of the document doesn't exist. Cannot invoke provision identity", v22, 2u);
      v24 = v23;
      v6 = v31;
      MEMORY[0x2199C815C](v24, -1, -1);
    }

    v25 = *(void (**)(char *, uint64_t))(v7 + 8);
    v25(v12, v6);
    (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x24BE1DC70], v2);
    sub_213F7DA10(MEMORY[0x24BEE4AF8]);
    sub_213FF881C();
    sub_213F3B3C0((unint64_t *)&qword_254D5C040, (uint64_t (*)(uint64_t))MEMORY[0x24BE1DE60], MEMORY[0x24BE1DE78]);
    v26 = (void *)swift_allocError();
    sub_213FF8828();
    sub_213FF7778();
    v27 = sub_213FF8D2C();
    v28 = sub_213FF95C0();
    if (os_log_type_enabled(v27, v28))
    {
      v29 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v29 = 0;
      _os_log_impl(&dword_213F36000, v27, v28, "Invoked delegate to close the view", v29, 2u);
      MEMORY[0x2199C815C](v29, -1, -1);
    }

    v25(v10, v6);
    sub_213FEB1F4();
    if (MEMORY[0x2199C81F8](v1 + 96))
    {
      sub_213F7D660(v26);
      swift_unknownObjectRelease();
    }

  }
}

uint64_t sub_213FEC248(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;

  v6[21] = a5;
  v6[22] = a6;
  v6[20] = a4;
  v7 = sub_213FF8D38();
  v6[23] = v7;
  v6[24] = *(_QWORD *)(v7 - 8);
  v6[25] = swift_task_alloc();
  v6[26] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_213FEC2BC()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v1 = v0[20];
  v2 = *(void **)(v1 + 112);
  v3 = sub_213FF9428();
  v0[27] = v3;
  v4 = *(_QWORD *)(v1 + 136);
  v0[2] = v0;
  v0[3] = sub_213FEC370;
  v5 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v6 = v0 + 10;
  v6[1] = 0x40000000;
  v6[2] = sub_213FE1FB4;
  v6[3] = &block_descriptor_28;
  v6[4] = v5;
  objc_msgSend(v2, sel_provisionIdentityWithState_proofingOptions_completionHandler_, v3, v4, v6);
  return swift_continuation_await();
}

uint64_t sub_213FEC370()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 224) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_213FEC3D0()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_213FF7778();
  v1 = sub_213FF8D2C();
  v2 = sub_213FF95C0();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_213F36000, v1, v2, "Successfully invoked provisionIdentity", v3, 2u);
    MEMORY[0x2199C815C](v3, -1, -1);
  }
  v4 = *(_QWORD *)(v0 + 208);
  v5 = *(_QWORD *)(v0 + 184);
  v6 = *(_QWORD *)(v0 + 192);

  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_213FEC4A4()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  void *v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v2 = *(void **)(v0 + 216);
  v1 = *(void **)(v0 + 224);
  swift_willThrow();

  sub_213FF7778();
  v3 = v1;
  v4 = v1;
  v5 = sub_213FF8D2C();
  v6 = sub_213FF95C0();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = *(void **)(v0 + 224);
    v17 = *(_QWORD *)(v0 + 192);
    v18 = *(_QWORD *)(v0 + 184);
    v19 = *(_QWORD *)(v0 + 200);
    v8 = (uint8_t *)swift_slowAlloc();
    v9 = swift_slowAlloc();
    v20 = v9;
    *(_DWORD *)v8 = 136315138;
    swift_getErrorValue();
    v10 = sub_213FF9950();
    *(_QWORD *)(v0 + 152) = sub_213F7DD50(v10, v11, &v20);
    sub_213FF971C();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_213F36000, v5, v6, "Error received on provisionIdentity invocation %s", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2199C815C](v9, -1, -1);
    MEMORY[0x2199C815C](v8, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v19, v18);
  }
  else
  {
    v12 = *(void **)(v0 + 224);
    v14 = *(_QWORD *)(v0 + 192);
    v13 = *(_QWORD *)(v0 + 200);
    v15 = *(_QWORD *)(v0 + 184);

    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v15);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_213FEC6B4@<X0>(char a1@<W0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  void (*v19)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v20;
  unint64_t v21;
  char v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char v27;
  char *v28;
  uint64_t v29;
  unsigned int (*v30)(char *, uint64_t, uint64_t);
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t result;
  _QWORD *v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  _QWORD v49[2];

  v3 = v2;
  v6 = sub_213FF8690();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v49 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(qword_254D5D1D8);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)v49 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x24BDAC7A8](v11);
  v16 = (char *)v49 - v15;
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)v49 - v17;
  v19 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56);
  v19((char *)v49 - v17, 1, 1, v6);
  if (a1 == 1)
  {
    v25 = *(_QWORD *)(v3 + 176);
    if (v25 && *(_QWORD *)(v25 + 16))
    {
      swift_bridgeObjectRetain();
      v26 = sub_213F42568(0x7365527472656C61, 0xEF6B6361426E6163);
      if ((v27 & 1) != 0)
      {
        (*(void (**)(char *, unint64_t, uint64_t))(v7 + 16))(v13, *(_QWORD *)(v25 + 56) + *(_QWORD *)(v7 + 72) * v26, v6);
        v28 = v13;
        v29 = 0;
      }
      else
      {
        v28 = v13;
        v29 = 1;
      }
      v19(v28, v29, 1, v6);
      swift_bridgeObjectRelease();
    }
    else
    {
      v19(v13, 1, 1, v6);
    }
    v16 = v13;
    goto LABEL_18;
  }
  if (!a1)
  {
    v20 = *(_QWORD *)(v3 + 176);
    if (v20 && *(_QWORD *)(v20 + 16))
    {
      swift_bridgeObjectRetain();
      v21 = sub_213F42568(0xD000000000000010, 0x80000002140063A0);
      if ((v22 & 1) != 0)
      {
        (*(void (**)(char *, unint64_t, uint64_t))(v7 + 16))(v16, *(_QWORD *)(v20 + 56) + *(_QWORD *)(v7 + 72) * v21, v6);
        v23 = v16;
        v24 = 0;
      }
      else
      {
        v23 = v16;
        v24 = 1;
      }
      v19(v23, v24, 1, v6);
      swift_bridgeObjectRelease();
    }
    else
    {
      v19(v16, 1, 1, v6);
    }
LABEL_18:
    sub_213FB17EC((uint64_t)v16, (uint64_t)v18, qword_254D5D1D8);
  }
  v49[1] = v3;
  v30 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48);
  if (v30(v18, 1, v6)
    || ((*(void (**)(char *, char *, uint64_t))(v7 + 16))(v9, v18, v6),
        v33 = sub_213FF8660(),
        v35 = v34,
        (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6),
        !v35))
  {
    v31 = 0;
    v32 = 0;
  }
  else
  {
    v31 = sub_213FE1990(v33, v35);
    v32 = v36;
    swift_bridgeObjectRelease();
  }
  if (v30(v18, 1, v6)
    || ((*(void (**)(char *, char *, uint64_t))(v7 + 16))(v9, v18, v6),
        v42 = (_QWORD *)sub_213FF866C(),
        (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6),
        !v42))
  {
    v37 = 0;
LABEL_25:
    v38 = 0;
    v39 = 0;
    v40 = 0;
LABEL_26:
    result = sub_213F4CF1C((uint64_t)v18, qword_254D5D1D8);
    *a2 = v31;
    a2[1] = v32;
    a2[2] = v39;
    a2[3] = v40;
    a2[4] = v37;
    a2[5] = v38;
    return result;
  }
  v37 = v42[2];
  if (!v37)
  {
    swift_bridgeObjectRelease();
    goto LABEL_25;
  }
  v43 = v42[4];
  v44 = v42[5];
  swift_bridgeObjectRetain();
  v39 = sub_213FE1990(v43, v44);
  v40 = v45;
  result = swift_bridgeObjectRelease();
  if (!v40)
  {
    swift_bridgeObjectRelease();
    v37 = 0;
    v38 = 0;
    v39 = 0;
    goto LABEL_26;
  }
  if (v37 <= 1)
  {
    swift_bridgeObjectRelease();
    v37 = 0;
    v38 = 0;
    goto LABEL_26;
  }
  if (v42[2] >= 2uLL)
  {
    v46 = v42[6];
    v47 = v42[7];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v37 = sub_213FE1990(v46, v47);
    v38 = v48;
    swift_bridgeObjectRelease();
    if (!v38)
      v37 = 0;
    goto LABEL_26;
  }
  __break(1u);
  return result;
}

void sub_213FECAD8(void *a1)
{
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
  uint64_t v12;
  char *v13;
  NSObject *v14;
  os_log_type_t v15;
  _BOOL4 v16;
  uint8_t *v17;
  uint8_t *v18;
  uint64_t v19;
  unint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  unint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  unint64_t v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  uint64_t v40;
  _QWORD aBlock[6];

  v2 = v1;
  v39 = a1;
  v3 = __swift_instantiateConcreteTypeFromMangledName(qword_254D5D1D8);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v39 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_213FF8690();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v39 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_213FF8D38();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v39 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_213FF7778();
  v14 = sub_213FF8D2C();
  v15 = sub_213FF95C0();
  v16 = os_log_type_enabled(v14, v15);
  v40 = v6;
  if (v16)
  {
    v17 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v17 = 0;
    _os_log_impl(&dword_213F36000, v14, v15, "Will show an error alert due to an internal error", v17, 2u);
    v18 = v17;
    v6 = v40;
    MEMORY[0x2199C815C](v18, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  v19 = *(_QWORD *)(v2 + 176);
  if (!v19 || !*(_QWORD *)(v19 + 16))
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v5, 1, 1, v6);
LABEL_26:
    sub_213F4CF1C((uint64_t)v5, qword_254D5D1D8);
    sub_213FF9878();
    __break(1u);
    return;
  }
  swift_bridgeObjectRetain();
  v20 = sub_213F42568(0xD000000000000018, 0x8000000214006830);
  if ((v21 & 1) != 0)
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v7 + 16))(v5, *(_QWORD *)(v19 + 56) + *(_QWORD *)(v7 + 72) * v20, v6);
    v22 = 0;
  }
  else
  {
    v22 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v5, v22, 1, v6);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
    goto LABEL_26;
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v9, v5, v6);
  v23 = sub_213FF8660();
  if (v24)
  {
    v25 = v24;
  }
  else
  {
    v23 = 0;
    v25 = 0xE000000000000000;
  }
  sub_213FE1990(v23, v25);
  swift_bridgeObjectRelease();
  v26 = (_QWORD *)sub_213FF8684();
  if (v26)
  {
    if (v26[2])
    {
      v27 = v26[4];
      v28 = v26[5];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      sub_213FE1990(v27, v28);
    }
    swift_bridgeObjectRelease();
  }
  v29 = (_QWORD *)sub_213FF866C();
  if (v29)
  {
    if (v29[2])
    {
      v30 = v29[4];
      v31 = v29[5];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      sub_213FE1990(v30, v31);
    }
    swift_bridgeObjectRelease();
  }
  v32 = (void *)sub_213FF9428();
  swift_bridgeObjectRelease();
  v33 = (void *)sub_213FF9428();
  swift_bridgeObjectRelease();
  v34 = objc_msgSend((id)objc_opt_self(), sel_alertControllerWithTitle_message_preferredStyle_, v32, v33, 1);

  v35 = swift_allocObject();
  swift_weakInit();
  swift_retain();
  v36 = (void *)sub_213FF9428();
  swift_bridgeObjectRelease();
  aBlock[4] = sub_213FF4B00;
  aBlock[5] = v35;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_213F3D08C;
  aBlock[3] = &block_descriptor_113;
  v37 = _Block_copy(aBlock);
  swift_release();
  v38 = objc_msgSend((id)objc_opt_self(), sel_actionWithTitle_style_handler_, v36, 0, v37);
  _Block_release(v37);
  swift_release();

  objc_msgSend(v34, sel_addAction_, v38);
  if (v39)
  {
    objc_msgSend(v39, sel_presentViewController_animated_completion_, v34, 1, 0);

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v40);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v40);

  }
}

void sub_213FED040(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  void *v9;
  uint64_t v10;

  v2 = sub_213FF8D38();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_213FF7778();
  v6 = sub_213FF8D2C();
  v7 = sub_213FF95C0();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_213F36000, v6, v7, "Deinitializing the termsAndConditionsViewController object in proofingFlowManager", v8, 2u);
    MEMORY[0x2199C815C](v8, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v9 = *(void **)(a1 + 168);
  *(_QWORD *)(a1 + 168) = 0;

}

BOOL sub_213FED140(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  id v6;
  char v7;
  char v9;

  type metadata accessor for IDScanViewController(0);
  v2 = swift_dynamicCastClass();
  if (v2)
  {
    v3 = v2;
    v4 = OBJC_IVAR____TtC9CoreIDVUI20IDScanViewController_scanSide;
    if ((*(_BYTE *)(v2 + OBJC_IVAR____TtC9CoreIDVUI20IDScanViewController_scanSide) & 1) != 0)
    {
      v5 = a1;
    }
    else
    {
      v6 = a1;
      swift_retain();
      v7 = sub_213F69AE0();
      swift_release();
      if ((v7 & 1) != 0)
      {

        return 1;
      }
      if (*(_BYTE *)(v3 + v4) != 1)
      {

        goto LABEL_10;
      }
    }
    swift_retain();
    v9 = sub_213F69AE0();
    swift_release();

    if ((v9 & 1) == 0)
      return 1;
  }
LABEL_10:
  type metadata accessor for IdentityProofingReviewSubmissionViewController();
  if (swift_dynamicCastClass())
    return 1;
  type metadata accessor for IdentityProofingProgressViewController();
  if (swift_dynamicCastClass())
    return 1;
  type metadata accessor for RGBCaptureViewController();
  if (swift_dynamicCastClass())
    return 1;
  type metadata accessor for IdentityProofingFedStatsOptinViewController();
  return swift_dynamicCastClass() != 0;
}

uint64_t sub_213FED27C(void *a1, uint64_t a2, const char *a3)
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
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unsigned int (*v29)(char *, uint64_t, uint64_t);
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD *v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD *v41;
  uint64_t v42;
  unint64_t v43;
  _QWORD *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  NSObject *v53;
  os_log_type_t v54;
  uint8_t *v55;
  _QWORD v57[2];
  id v58;
  const char *v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;

  v59 = a3;
  v6 = sub_213FF8D38();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v61 = (char *)v57 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(qword_254D5D1D8);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)v57 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v10);
  v15 = (char *)v57 - v14;
  v16 = MEMORY[0x24BDAC7A8](v13);
  v18 = (char *)v57 - v17;
  MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)v57 - v19;
  v60 = v3;
  v21 = *(_QWORD *)(v3 + 176);
  v58 = a1;
  v62 = v7;
  v63 = v6;
  if (v21 && *(_QWORD *)(v21 + 16))
  {
    swift_bridgeObjectRetain();
    v22 = sub_213F42568(0xD00000000000001FLL, a2);
    if ((v23 & 1) != 0)
    {
      v24 = v22;
      v25 = *(_QWORD *)(v21 + 56);
      v26 = sub_213FF8690();
      v27 = *(_QWORD *)(v26 - 8);
      (*(void (**)(char *, unint64_t, uint64_t))(v27 + 16))(v20, v25 + *(_QWORD *)(v27 + 72) * v24, v26);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v27 + 56))(v20, 0, 1, v26);
    }
    else
    {
      v26 = sub_213FF8690();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 56))(v20, 1, 1, v26);
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    v26 = sub_213FF8690();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 56))(v20, 1, 1, v26);
  }
  sub_213F4531C((uint64_t)v20, (uint64_t)v18, qword_254D5D1D8);
  sub_213FF8690();
  v28 = *(_QWORD *)(v26 - 8);
  v29 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v28 + 48);
  if (v29(v18, 1, v26) == 1)
  {
    sub_213F4CF1C((uint64_t)v18, qword_254D5D1D8);
  }
  else
  {
    v30 = sub_213FF8660();
    v32 = v31;
    (*(void (**)(char *, uint64_t))(v28 + 8))(v18, v26);
    if (v32)
    {
      v33 = sub_213FE1990(v30, v32);
      v35 = v34;
      swift_bridgeObjectRelease();
      goto LABEL_13;
    }
  }
  v33 = 0;
  v35 = 0;
LABEL_13:
  sub_213F4531C((uint64_t)v20, (uint64_t)v15, qword_254D5D1D8);
  if (v29(v15, 1, v26) == 1)
  {
    sub_213F4CF1C((uint64_t)v15, qword_254D5D1D8);
  }
  else
  {
    v36 = (_QWORD *)sub_213FF8684();
    (*(void (**)(char *, uint64_t))(v28 + 8))(v15, v26);
    if (v36)
    {
      if (v36[2])
      {
        v57[1] = v33;
        v37 = v36[4];
        v38 = v36[5];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        sub_213FE1990(v37, v38);
        v40 = v39;
        swift_bridgeObjectRelease();
        goto LABEL_20;
      }
      swift_bridgeObjectRelease();
    }
  }
  v40 = 0;
LABEL_20:
  sub_213F4531C((uint64_t)v20, (uint64_t)v12, qword_254D5D1D8);
  if (v29(v12, 1, v26) == 1)
  {
    sub_213F4CF1C((uint64_t)v12, qword_254D5D1D8);
  }
  else
  {
    v41 = (_QWORD *)sub_213FF866C();
    (*(void (**)(char *, uint64_t))(v28 + 8))(v12, v26);
    if (!v41)
    {
      if (!v35)
        goto LABEL_33;
      goto LABEL_30;
    }
    if (v41[2])
    {
      v42 = v41[4];
      v43 = v41[5];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      sub_213FE1990(v42, v43);
      v41 = v44;
      swift_bridgeObjectRelease();
      if (!v35)
        goto LABEL_33;
      goto LABEL_30;
    }
    swift_bridgeObjectRelease();
  }
  v41 = 0;
  if (!v35)
    goto LABEL_33;
LABEL_30:
  if (v40 && v41)
  {
    v45 = (void *)sub_213FF9428();
    swift_bridgeObjectRelease();
    v46 = (void *)sub_213FF9428();
    swift_bridgeObjectRelease();
    v47 = objc_msgSend((id)objc_opt_self(), sel_alertControllerWithTitle_message_preferredStyle_, v45, v46, 1);

    v48 = (void *)sub_213FF9428();
    swift_bridgeObjectRelease();
    v49 = objc_msgSend((id)objc_opt_self(), sel_actionWithTitle_style_handler_, v48, 0, 0);

    objc_msgSend(v47, sel_addAction_, v49);
    objc_msgSend(v58, sel_presentViewController_animated_completion_, v47, 1, 0);

    return sub_213F4CF1C((uint64_t)v20, qword_254D5D1D8);
  }
LABEL_33:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v51 = v62;
  v50 = v63;
  v52 = v61;
  sub_213FF7778();
  v53 = sub_213FF8D2C();
  v54 = sub_213FF95C0();
  if (os_log_type_enabled(v53, v54))
  {
    v55 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v55 = 0;
    _os_log_impl(&dword_213F36000, v53, v54, v59, v55, 2u);
    MEMORY[0x2199C815C](v55, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v51 + 8))(v52, v50);
  return sub_213F4CF1C((uint64_t)v20, qword_254D5D1D8);
}

uint64_t sub_213FED848(void *a1, uint64_t a2, void *a3, int a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  unsigned int (*v36)(char *, uint64_t, uint64_t);
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD *v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD *v47;
  unint64_t v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t result;
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  id v69;
  void *v70;
  void *v71;
  id v72;
  id v73;
  void (*v74)(uint64_t);
  uint64_t v75;
  char *v76;
  unint64_t v77;
  NSObject *v78;
  os_log_type_t v79;
  uint8_t *v80;
  uint64_t v81;
  uint64_t v82;
  char *v83;
  int v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  uint64_t v88;
  char *v89;
  uint64_t v90;
  id v91;
  uint64_t v92;
  id v93;
  uint64_t aBlock;
  uint64_t v95;
  void (*v96)(uint64_t, void *);
  void *v97;
  uint64_t (*v98)(uint64_t);
  uint64_t v99;
  uint64_t v100;

  v85 = a5;
  v84 = a4;
  v93 = a3;
  v88 = a2;
  v9 = (_QWORD *)sub_213FF8D38();
  v10 = *(v9 - 1);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v82 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(qword_254D5D1D8);
  v14 = MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v82 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = MEMORY[0x24BDAC7A8](v14);
  v19 = (char *)&v82 - v18;
  v20 = MEMORY[0x24BDAC7A8](v17);
  v22 = (char *)&v82 - v21;
  MEMORY[0x24BDAC7A8](v20);
  v24 = (char *)&v82 - v23;
  v91 = v9;
  v92 = v6;
  v25 = *(_QWORD *)(v6 + 176);
  v89 = v12;
  v90 = v10;
  v86 = a6;
  v87 = a1;
  if (v25 && *(_QWORD *)(v25 + 16))
  {
    v83 = (char *)&v82 - v23;
    swift_bridgeObjectRetain();
    v26 = (uint64_t)v93;
    swift_bridgeObjectRetain();
    v27 = sub_213F42568(v88, v26);
    if ((v28 & 1) != 0)
    {
      v29 = v27;
      v30 = *(_QWORD *)(v25 + 56);
      v31 = sub_213FF8690();
      v32 = *(_QWORD *)(v31 - 8);
      v33 = v30 + *(_QWORD *)(v32 + 72) * v29;
      v34 = v83;
      (*(void (**)(char *, uint64_t, uint64_t))(v32 + 16))(v83, v33, v31);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v32 + 56))(v34, 0, 1, v31);
    }
    else
    {
      v31 = sub_213FF8690();
      v34 = v83;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v31 - 8) + 56))(v83, 1, 1, v31);
    }
    swift_bridgeObjectRelease();
    v24 = v34;
    swift_bridgeObjectRelease();
  }
  else
  {
    v31 = sub_213FF8690();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v31 - 8) + 56))(v24, 1, 1, v31);
  }
  sub_213F4531C((uint64_t)v24, (uint64_t)v22, qword_254D5D1D8);
  sub_213FF8690();
  v35 = *(_QWORD *)(v31 - 8);
  v36 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v35 + 48);
  if (v36(v22, 1, v31) == 1)
  {
    sub_213F4CF1C((uint64_t)v22, qword_254D5D1D8);
  }
  else
  {
    v37 = sub_213FF8660();
    v39 = v38;
    (*(void (**)(char *, uint64_t))(v35 + 8))(v22, v31);
    if (v39)
    {
      v83 = (char *)sub_213FE1990(v37, v39);
      v41 = v40;
      swift_bridgeObjectRelease();
      goto LABEL_13;
    }
  }
  v83 = 0;
  v41 = 0;
LABEL_13:
  sub_213F4531C((uint64_t)v24, (uint64_t)v19, qword_254D5D1D8);
  if (v36(v19, 1, v31) == 1)
  {
    sub_213F4CF1C((uint64_t)v19, qword_254D5D1D8);
  }
  else
  {
    v42 = (_QWORD *)sub_213FF8684();
    (*(void (**)(char *, uint64_t))(v35 + 8))(v19, v31);
    if (v42)
    {
      if (v42[2])
      {
        v43 = v42[4];
        v44 = v42[5];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        v82 = sub_213FE1990(v43, v44);
        v46 = v45;
        swift_bridgeObjectRelease();
        goto LABEL_20;
      }
      swift_bridgeObjectRelease();
    }
  }
  v82 = 0;
  v46 = 0;
LABEL_20:
  sub_213F4531C((uint64_t)v24, (uint64_t)v16, qword_254D5D1D8);
  if (v36(v16, 1, v31) == 1)
  {
    sub_213F4CF1C((uint64_t)v16, qword_254D5D1D8);
LABEL_29:
    v57 = 0;
    v52 = 0;
    goto LABEL_30;
  }
  v47 = (_QWORD *)sub_213FF866C();
  (*(void (**)(char *, uint64_t))(v35 + 8))(v16, v31);
  if (!v47)
    goto LABEL_29;
  v48 = v47[2];
  if (!v48)
  {
    swift_bridgeObjectRelease();
    goto LABEL_29;
  }
  v49 = v47[4];
  v50 = v47[5];
  swift_bridgeObjectRetain();
  sub_213FE1990(v49, v50);
  v52 = v51;
  result = swift_bridgeObjectRelease();
  if (v52 && v48 > 1)
  {
    if (v47[2] < 2uLL)
    {
      __break(1u);
      return result;
    }
    v54 = v47[6];
    v55 = v47[7];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    sub_213FE1990(v54, v55);
    v57 = v56;
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    v57 = 0;
  }
LABEL_30:
  if (v41 && v46 && v52 && v57)
  {
    v58 = (void *)sub_213FF9428();
    swift_bridgeObjectRelease();
    v59 = (void *)sub_213FF9428();
    swift_bridgeObjectRelease();
    v93 = objc_msgSend((id)objc_opt_self(), sel_alertControllerWithTitle_message_preferredStyle_, v58, v59, 1);

    v60 = v92;
    swift_retain();
    v61 = (void *)sub_213FF9428();
    swift_bridgeObjectRelease();
    v98 = sub_213FF4040;
    v99 = v60;
    aBlock = MEMORY[0x24BDAC760];
    v95 = 1107296256;
    v96 = sub_213F3D08C;
    v97 = &block_descriptor_43_0;
    v62 = _Block_copy(&aBlock);
    swift_release();
    v63 = (void *)objc_opt_self();
    v64 = objc_msgSend(v63, sel_actionWithTitle_style_handler_, v61, 0, v62);
    v91 = v64;
    _Block_release(v62);

    v65 = swift_allocObject();
    *(_QWORD *)(v65 + 16) = v60;
    *(_BYTE *)(v65 + 24) = v84 & 1;
    v67 = v85;
    v66 = v86;
    *(_QWORD *)(v65 + 32) = v85;
    *(_QWORD *)(v65 + 40) = v66;
    v68 = v87;
    *(_QWORD *)(v65 + 48) = v87;
    swift_retain();
    sub_213F4D4E0(v67);
    v69 = v68;
    v70 = (void *)sub_213FF9428();
    swift_bridgeObjectRelease();
    v98 = sub_213FF4084;
    v99 = v65;
    aBlock = MEMORY[0x24BDAC760];
    v95 = 1107296256;
    v96 = sub_213F3D08C;
    v97 = &block_descriptor_49;
    v71 = _Block_copy(&aBlock);
    swift_release();
    v72 = objc_msgSend(v63, sel_actionWithTitle_style_handler_, v70, 0, v71);
    _Block_release(v71);

    v73 = v93;
    objc_msgSend(v93, sel_addAction_, v64);
    objc_msgSend(v73, sel_addAction_, v72);
    objc_msgSend(v73, sel_setPreferredAction_, v72);
    objc_msgSend(v69, sel_presentViewController_animated_completion_, v73, 1, 0);
    sub_213FF8618();
    swift_retain();
    sub_213FF8408();
    v74 = *(void (**)(uint64_t))(**(_QWORD **)(v60 + 152) + 96);
    v75 = swift_retain();
    v74(v75);
    swift_release();
    sub_213FF7F40();

    swift_bridgeObjectRelease();
    swift_release();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v76 = v89;
    sub_213FF7778();
    v77 = (unint64_t)v93;
    swift_bridgeObjectRetain_n();
    v78 = sub_213FF8D2C();
    v79 = sub_213FF95C0();
    if (os_log_type_enabled(v78, v79))
    {
      v80 = (uint8_t *)swift_slowAlloc();
      v81 = swift_slowAlloc();
      aBlock = v81;
      *(_DWORD *)v80 = 136315138;
      swift_bridgeObjectRetain();
      v100 = sub_213F7DD50(v88, v77, &aBlock);
      sub_213FF971C();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_213F36000, v78, v79, "Unable to show the %s as the server doesn't have the related fields in the config", v80, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2199C815C](v81, -1, -1);
      MEMORY[0x2199C815C](v80, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    (*(void (**)(char *, id))(v90 + 8))(v76, v91);
  }
  return sub_213F4CF1C((uint64_t)v24, qword_254D5D1D8);
}

uint64_t sub_213FEE1C0(uint64_t a1, uint64_t a2)
{
  void (*v3)(uint64_t);
  uint64_t v4;

  sub_213FF8600();
  sub_213FF83FC();
  swift_retain();
  sub_213FF8408();
  v3 = *(void (**)(uint64_t))(**(_QWORD **)(a2 + 152) + 96);
  v4 = swift_retain();
  v3(v4);
  swift_release();
  sub_213FF7F40();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_213FEE2D4(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, void *a6)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  void *v21;
  id v22;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  void *v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  char *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  int v49;
  uint64_t v50;
  _QWORD aBlock[7];

  v40 = a6;
  v41 = a4;
  v42 = a5;
  v49 = a3;
  v7 = sub_213FF9374();
  v47 = *(_QWORD *)(v7 - 8);
  v48 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v46 = (char *)&v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_213FF9398();
  v44 = *(_QWORD *)(v9 - 8);
  v45 = v9;
  MEMORY[0x24BDAC7A8](v9);
  v43 = (char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_213FF8D38();
  v38 = *(_QWORD *)(v11 - 8);
  v39 = v11;
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v36 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D5F760);
  MEMORY[0x24BDAC7A8](v14);
  v37 = (char *)&v36 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_213FF8600();
  sub_213FF83CC();
  swift_retain();
  sub_213FF8408();
  v50 = a2;
  v16 = *(void (**)(uint64_t))(**(_QWORD **)(a2 + 152) + 96);
  v17 = swift_retain();
  v16(v17);
  swift_release();
  sub_213FF7F40();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  if ((v49 & 1) != 0)
  {
    v18 = sub_213FF956C();
    v19 = (uint64_t)v37;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v37, 1, 1, v18);
    v20 = (_QWORD *)swift_allocObject();
    v20[2] = 0;
    v20[3] = 0;
    v21 = v40;
    v20[4] = v50;
    v20[5] = v21;
    swift_retain();
    v22 = v21;
    sub_213F4BE78(v19, (uint64_t)&unk_254D61028, (uint64_t)v20);
    return swift_release();
  }
  else
  {
    v24 = v50;
    sub_213FF7778();
    v25 = sub_213FF8D2C();
    v26 = sub_213FF95C0();
    if (os_log_type_enabled(v25, v26))
    {
      v27 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v27 = 0;
      _os_log_impl(&dword_213F36000, v25, v26, "User has clicked on cancel before a proofing request has been made. Close the view", v27, 2u);
      MEMORY[0x2199C815C](v27, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v38 + 8))(v13, v39);
    sub_213F3F7CC(0, (unint64_t *)&qword_254D5CDB0);
    v28 = (void *)sub_213FF9644();
    v29 = (_QWORD *)swift_allocObject();
    v29[2] = v24;
    v31 = v41;
    v30 = v42;
    v29[3] = v41;
    v29[4] = v30;
    aBlock[4] = sub_213FF40CC;
    aBlock[5] = v29;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_213F402DC;
    aBlock[3] = &block_descriptor_55;
    v32 = _Block_copy(aBlock);
    swift_retain();
    sub_213F4D4E0(v31);
    swift_release();
    v33 = v43;
    sub_213FF938C();
    aBlock[0] = MEMORY[0x24BEE4AF8];
    sub_213F3B3C0((unint64_t *)&qword_254D5CDE0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254D5F750);
    sub_213FCC014((unint64_t *)&qword_254D5CDF0, (uint64_t *)&unk_254D5F750);
    v34 = v46;
    v35 = v48;
    sub_213FF9788();
    MEMORY[0x2199C7700](0, v33, v34, v32);
    _Block_release(v32);

    (*(void (**)(char *, uint64_t))(v47 + 8))(v34, v35);
    return (*(uint64_t (**)(char *, uint64_t))(v44 + 8))(v33, v45);
  }
}

uint64_t sub_213FEE770(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t result;
  uint64_t v12;

  v4 = sub_213FF8D38();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_213FF7778();
  v8 = sub_213FF8D2C();
  v9 = sub_213FF95C0();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_213F36000, v8, v9, "Invoked delegate to close the view", v10, 2u);
    MEMORY[0x2199C815C](v10, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  sub_213FEB1F4();
  result = MEMORY[0x2199C81F8](a1 + 96);
  if (result)
  {
    sub_213F7D660(0);
    result = swift_unknownObjectRelease();
  }
  if (a2)
    return a2(result);
  return result;
}

uint64_t sub_213FEE8A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t (__cdecl *v10)();

  v5[16] = a4;
  v5[17] = a5;
  v6 = sub_213FF9374();
  v5[18] = v6;
  v5[19] = *(_QWORD *)(v6 - 8);
  v5[20] = swift_task_alloc();
  v7 = sub_213FF9398();
  v5[21] = v7;
  v5[22] = *(_QWORD *)(v7 - 8);
  v5[23] = swift_task_alloc();
  v10 = (uint64_t (__cdecl *)())((char *)&dword_254D61030 + dword_254D61030);
  v8 = (_QWORD *)swift_task_alloc();
  v5[24] = v8;
  *v8 = v5;
  v8[1] = sub_213FEE958;
  return v10();
}

uint64_t sub_213FEE958(char a1)
{
  uint64_t v1;

  *(_BYTE *)(*(_QWORD *)v1 + 200) = a1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_213FEE9B4()
{
  _QWORD *v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;

  v1 = *((_BYTE *)v0 + 200);
  sub_213F3F7CC(0, (unint64_t *)&qword_254D5CDB0);
  v2 = sub_213FF9644();
  v3 = v0[23];
  v14 = (void *)v2;
  v15 = v0[22];
  v4 = v0[20];
  v16 = v0[21];
  v5 = v0[18];
  v13 = v0[19];
  if ((v1 & 1) != 0)
  {
    v0[13] = v0[16];
    v6 = v0 + 15;
    v0[8] = MEMORY[0x24BDAC760];
    v0[9] = 1107296256;
    v0[10] = sub_213F402DC;
    v0[11] = &block_descriptor_69;
    v0[12] = sub_213FF4644;
    v7 = _Block_copy(v0 + 8);
    swift_retain();
  }
  else
  {
    v9 = v0[16];
    v8 = (void *)v0[17];
    v10 = swift_allocObject();
    v0[7] = v10;
    v0[2] = MEMORY[0x24BDAC760];
    v6 = v0 + 14;
    *(_QWORD *)(v10 + 16) = v9;
    *(_QWORD *)(v10 + 24) = v8;
    v0[3] = 1107296256;
    v0[4] = sub_213F402DC;
    v0[5] = &block_descriptor_65;
    v0[6] = sub_213FF4608;
    v7 = _Block_copy(v0 + 2);
    swift_retain();
    v11 = v8;
  }
  sub_213FF938C();
  *v6 = MEMORY[0x24BEE4AF8];
  sub_213F3B3C0((unint64_t *)&qword_254D5CDE0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254D5F750);
  sub_213FCC014((unint64_t *)&qword_254D5CDF0, (uint64_t *)&unk_254D5F750);
  sub_213FF9788();
  MEMORY[0x2199C7700](0, v3, v4, v7);
  _Block_release(v7);

  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v4, v5);
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v3, v16);
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  return ((uint64_t (*)(void))v0[1])();
}

uint64_t sub_213FEEBF4(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  void *v15;
  _QWORD *v16;
  void *v17;
  id v18;
  uint64_t v20;
  uint64_t v21;
  _QWORD aBlock[6];

  v9 = sub_213FF9374();
  v21 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = sub_213FF9398();
  v12 = *(_QWORD *)(v20 - 8);
  MEMORY[0x24BDAC7A8](v20);
  v14 = (char *)&v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_213F3F7CC(0, (unint64_t *)&qword_254D5CDB0);
  v15 = (void *)sub_213FF9644();
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = a2;
  v16[3] = a3;
  v16[4] = a4;
  v16[5] = a5;
  aBlock[4] = sub_213FF4670;
  aBlock[5] = v16;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_213F402DC;
  aBlock[3] = &block_descriptor_82;
  v17 = _Block_copy(aBlock);
  swift_retain();
  v18 = a3;
  swift_retain();
  swift_release();
  sub_213FF938C();
  aBlock[0] = MEMORY[0x24BEE4AF8];
  sub_213F3B3C0((unint64_t *)&qword_254D5CDE0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254D5F750);
  sub_213FCC014((unint64_t *)&qword_254D5CDF0, (uint64_t *)&unk_254D5F750);
  sub_213FF9788();
  MEMORY[0x2199C7700](0, v14, v11, v17);
  _Block_release(v17);

  (*(void (**)(char *, uint64_t))(v21 + 8))(v11, v9);
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v20);
}

void sub_213FEEE1C(char a1, uint64_t a2, void (*a3)(_QWORD), uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  void *v15;
  id v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  id v34;
  uint8_t *v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(_QWORD);
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  v8 = sub_213FF8D38();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v35 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v35 - v13;
  if (a2)
  {
    v15 = (void *)sub_213FF7490();
    sub_213FF7778();
    v16 = v15;
    v17 = sub_213FF8D2C();
    v18 = sub_213FF95CC();
    if (os_log_type_enabled(v17, v18))
    {
      v39 = v8;
      v19 = (uint8_t *)swift_slowAlloc();
      v37 = swift_slowAlloc();
      v42 = v37;
      v38 = a3;
      *(_DWORD *)v19 = 136446210;
      v35 = v19 + 4;
      v20 = v16;
      v40 = a4;
      v21 = v20;
      v22 = objc_msgSend(v20, sel_description);
      v36 = v9;
      v23 = v22;
      v24 = sub_213FF9458();
      v26 = v25;

      v41 = sub_213F7DD50(v24, v26, &v42);
      a3 = v38;
      sub_213FF971C();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_213F36000, v17, v18, "Failed to repair cloud sync state with error %{public}s", v19, 0xCu);
      v27 = v37;
      swift_arrayDestroy();
      MEMORY[0x2199C815C](v27, -1, -1);
      MEMORY[0x2199C815C](v19, -1, -1);

      (*(void (**)(char *, uint64_t))(v36 + 8))(v12, v39);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
    }
    v34 = v16;
    a3(v16);

  }
  else
  {
    sub_213FF7778();
    v28 = sub_213FF8D2C();
    v29 = sub_213FF95C0();
    if (os_log_type_enabled(v28, v29))
    {
      v40 = a4;
      v30 = (uint8_t *)swift_slowAlloc();
      v31 = swift_slowAlloc();
      v39 = v8;
      *(_DWORD *)v30 = 136446210;
      v42 = v31;
      if ((a1 & 1) != 0)
        v32 = 1702195828;
      else
        v32 = 0x65736C6166;
      if ((a1 & 1) != 0)
        v33 = 0xE400000000000000;
      else
        v33 = 0xE500000000000000;
      v41 = sub_213F7DD50(v32, v33, &v42);
      sub_213FF971C();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_213F36000, v28, v29, "Repaired iCloud account: %{public}s", v30, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2199C815C](v31, -1, -1);
      MEMORY[0x2199C815C](v30, -1, -1);

      (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v39);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v8);
    }
    a3(0);
  }
}

void sub_213FEF1E0(uint64_t a1, uint64_t a2, void *a3)
{
  void (*v5)(uint64_t, void *);
  id v6;

  v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  v6 = a3;
  v5(a2, a3);
  swift_release();

}

uint64_t sub_213FEF240()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int v11;
  uint64_t v12;
  int v13;
  unint64_t v14;
  char v15;
  uint64_t v16;
  void (*v17)(char *, char *, uint64_t);
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  char *v45;
  uint64_t v46;
  void (**v47)();
  uint64_t v48;
  char *v49;
  uint64_t (**v50)();
  uint64_t v51;
  uint64_t result;
  uint64_t v53;
  int v54;
  uint64_t v55;

  v1 = v0;
  v2 = sub_213FF7538();
  MEMORY[0x24BDAC7A8](v2);
  v3 = sub_213FF941C();
  MEMORY[0x24BDAC7A8](v3);
  v4 = __swift_instantiateConcreteTypeFromMangledName(qword_254D5D1D8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v53 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_213FF8690();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v53 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_213F66310();
  v12 = *(_QWORD *)(v0 + 176);
  if (!v12 || !*(_QWORD *)(v12 + 16))
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v6, 1, 1, v7);
LABEL_43:
    sub_213F4CF1C((uint64_t)v6, qword_254D5D1D8);
    result = sub_213FF9878();
    __break(1u);
    return result;
  }
  v13 = v11;
  swift_bridgeObjectRetain();
  v14 = sub_213F42568(0xD000000000000010, 0x8000000214006940);
  if ((v15 & 1) != 0)
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v8 + 16))(v6, *(_QWORD *)(v12 + 56) + *(_QWORD *)(v8 + 72) * v14, v7);
    v16 = 0;
  }
  else
  {
    v16 = 1;
  }
  v54 = v13;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v6, v16, 1, v7);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
    goto LABEL_43;
  v17 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
  v55 = v7;
  v17(v10, v6, v7);
  v18 = sub_213FF8660();
  if (!v19)
    v18 = 0;
  v20 = 0xE000000000000000;
  if (v19)
    v21 = v19;
  else
    v21 = 0xE000000000000000;
  v22 = sub_213FE1990(v18, v21);
  v24 = v23;
  swift_bridgeObjectRelease();
  v25 = (_QWORD *)sub_213FF8684();
  if (!v25)
  {
LABEL_30:
    v53 = 0;
    if ((sub_213F66310() & 1) == 0)
      goto LABEL_21;
LABEL_31:
    sub_213FF9410();
    if (qword_254D5BA30 != -1)
      swift_once();
    v40 = (id)qword_254D62FB0;
    sub_213FF752C();
    v39 = sub_213FF9470();
    v38 = v41;
    goto LABEL_36;
  }
  if (!v25[2])
  {
    swift_bridgeObjectRelease();
    goto LABEL_30;
  }
  v26 = v25[4];
  v27 = v25[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v28 = sub_213FE1990(v26, v27);
  v29 = v22;
  v31 = v30;
  swift_bridgeObjectRelease();
  if (v31)
    v32 = v28;
  else
    v32 = 0;
  v53 = v32;
  if (v31)
    v20 = v31;
  else
    v20 = 0xE000000000000000;
  v22 = v29;
  if ((sub_213F66310() & 1) != 0)
    goto LABEL_31;
LABEL_21:
  v33 = (_QWORD *)sub_213FF866C();
  if (v33)
  {
    if (v33[2])
    {
      v34 = v33[4];
      v35 = v33[5];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      v36 = sub_213FE1990(v34, v35);
      v38 = v37;
      swift_bridgeObjectRelease();
      if (v38)
        v39 = v36;
      else
        v39 = 0;
      if (!v38)
        v38 = 0xE000000000000000;
      goto LABEL_36;
    }
    swift_bridgeObjectRelease();
  }
  v39 = 0;
  v38 = 0xE000000000000000;
LABEL_36:
  if (v24)
    v42 = v24;
  else
    v42 = 0xE000000000000000;
  if (!v24)
    v22 = 0;
  type metadata accessor for IdentityProofingNavigationControllerHelper();
  v43 = swift_allocObject();
  v44 = objc_allocWithZone((Class)type metadata accessor for IdentityErrorViewController());
  swift_retain();
  v45 = (char *)sub_213FB35DC(v22, v42, v53, v20, v39, v38, 0, 0, v43, v1);
  swift_release();
  swift_release();
  v46 = swift_allocObject();
  *(_BYTE *)(v46 + 16) = v54 & 1;
  *(_QWORD *)(v46 + 24) = v1;
  *(_QWORD *)(v46 + 32) = v45;
  v47 = (void (**)())&v45[OBJC_IVAR____TtC9CoreIDVUI27IdentityErrorViewController_primaryButtonTargetAction];
  v48 = *(_QWORD *)&v45[OBJC_IVAR____TtC9CoreIDVUI27IdentityErrorViewController_primaryButtonTargetAction];
  *v47 = sub_213FF4C28;
  v47[1] = (void (*)())v46;
  swift_retain();
  v49 = v45;
  sub_213F4BE68(v48);
  v50 = (uint64_t (**)())&v49[OBJC_IVAR____TtC9CoreIDVUI27IdentityErrorViewController_secondaryButtonTargetAction];
  v51 = *(_QWORD *)&v49[OBJC_IVAR____TtC9CoreIDVUI27IdentityErrorViewController_secondaryButtonTargetAction];
  *v50 = sub_213FF4C34;
  v50[1] = (uint64_t (*)())v1;
  swift_retain();
  sub_213F4BE68(v51);
  sub_213FE5680();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v55);
  return (uint64_t)v49;
}

uint64_t sub_213FEF780()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  char v11;
  uint64_t v12;
  void (*v13)(char *, char *, uint64_t);
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  char *v36;
  uint64_t (**v37)();
  uint64_t v38;
  uint64_t (**v39)();
  uint64_t v40;
  uint64_t result;
  uint64_t v42;
  uint64_t v43;

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(qword_254D5D1D8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v42 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_213FF8690();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(_QWORD *)(v0 + 176);
  if (!v9 || !*(_QWORD *)(v9 + 16))
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v4, 1, 1, v5);
LABEL_36:
    sub_213F4CF1C((uint64_t)v4, qword_254D5D1D8);
    result = sub_213FF9878();
    __break(1u);
    return result;
  }
  swift_bridgeObjectRetain();
  v10 = sub_213F42568(0x676150726F727265, 0xEF64656C69614665);
  if ((v11 & 1) != 0)
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v6 + 16))(v4, *(_QWORD *)(v9 + 56) + *(_QWORD *)(v6 + 72) * v10, v5);
    v12 = 0;
  }
  else
  {
    v12 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v4, v12, 1, v5);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
    goto LABEL_36;
  v13 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
  v43 = v5;
  v13(v8, v4, v5);
  v14 = sub_213FF8660();
  if (!v15)
    v14 = 0;
  v16 = 0xE000000000000000;
  if (v15)
    v17 = v15;
  else
    v17 = 0xE000000000000000;
  v18 = sub_213FE1990(v14, v17);
  v20 = v19;
  swift_bridgeObjectRelease();
  v21 = (_QWORD *)sub_213FF8684();
  if (!v21)
    goto LABEL_21;
  if (!v21[2])
  {
    swift_bridgeObjectRelease();
LABEL_21:
    v42 = 0;
    goto LABEL_22;
  }
  v22 = v21[4];
  v23 = v21[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v24 = sub_213FE1990(v22, v23);
  v16 = v25;
  swift_bridgeObjectRelease();
  if (v16)
    v26 = v24;
  else
    v26 = 0;
  v42 = v26;
  if (!v16)
    v16 = 0xE000000000000000;
LABEL_22:
  v27 = (_QWORD *)sub_213FF866C();
  if (v27)
  {
    if (v27[2])
    {
      v28 = v27[4];
      v29 = v27[5];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      v30 = sub_213FE1990(v28, v29);
      v32 = v31;
      swift_bridgeObjectRelease();
      if (v32)
        v33 = v30;
      else
        v33 = 0;
      if (!v32)
        v32 = 0xE000000000000000;
      goto LABEL_32;
    }
    swift_bridgeObjectRelease();
  }
  v33 = 0;
  v32 = 0xE000000000000000;
LABEL_32:
  if (!v20)
  {
    v20 = 0xE000000000000000;
    v18 = 0;
  }
  type metadata accessor for IdentityProofingNavigationControllerHelper();
  v34 = swift_allocObject();
  v35 = objc_allocWithZone((Class)type metadata accessor for IdentityErrorViewController());
  swift_retain();
  v36 = (char *)sub_213FB35DC(v18, v20, v42, v16, v33, v32, 0, 0, v34, v1);
  swift_release();
  swift_release();
  v37 = (uint64_t (**)())&v36[OBJC_IVAR____TtC9CoreIDVUI27IdentityErrorViewController_primaryButtonTargetAction];
  v38 = *(_QWORD *)&v36[OBJC_IVAR____TtC9CoreIDVUI27IdentityErrorViewController_primaryButtonTargetAction];
  *v37 = sub_213FF4644;
  v37[1] = (uint64_t (*)())v1;
  swift_retain();
  sub_213F4BE68(v38);
  v39 = (uint64_t (**)())&v36[OBJC_IVAR____TtC9CoreIDVUI27IdentityErrorViewController_secondaryButtonTargetAction];
  v40 = *(_QWORD *)&v36[OBJC_IVAR____TtC9CoreIDVUI27IdentityErrorViewController_secondaryButtonTargetAction];
  *v39 = sub_213FF4C34;
  v39[1] = (uint64_t (*)())v1;
  swift_retain();
  sub_213F4BE68(v40);
  sub_213FE5680();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v43);
  return (uint64_t)v36;
}

uint64_t sub_213FEFB84()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t result;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;

  v0 = sub_213FF8D38();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v5 = result;
    sub_213FF7778();
    v6 = sub_213FF8D2C();
    v7 = sub_213FF95C0();
    if (os_log_type_enabled(v6, v7))
    {
      v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_213F36000, v6, v7, "Invoked delegate to close the view", v8, 2u);
      MEMORY[0x2199C815C](v8, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    sub_213FEB1F4();
    if (MEMORY[0x2199C81F8](v5 + 96))
    {
      sub_213F7D660(0);
      swift_release();
      return swift_unknownObjectRelease();
    }
    else
    {
      return swift_release();
    }
  }
  return result;
}

void sub_213FEFCE0(char a1, uint64_t (*a2)(), void *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t (**v11)();
  id v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  id v17;

  v6 = sub_213FF8D38();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a1 & 1) != 0)
  {
    v10 = (char *)objc_allocWithZone((Class)type metadata accessor for ProvideFeedbackViewController());
    *(_QWORD *)&v10[OBJC_IVAR____TtC9CoreIDVUI29ProvideFeedbackViewController_proofingManager] = a2;
    v11 = (uint64_t (**)())&v10[OBJC_IVAR____TtC9CoreIDVUI29ProvideFeedbackViewController_continuation];
    *v11 = sub_213FF4644;
    v11[1] = a2;
    swift_retain_n();
    v12 = sub_213FDFC18(v10);
    v17 = objc_msgSend(a3, sel_navigationController);
    sub_213FE1BAC(v12, v17);

  }
  else
  {
    sub_213FF7778();
    v13 = sub_213FF8D2C();
    v14 = sub_213FF95C0();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_213F36000, v13, v14, "Invoked delegate to close the view", v15, 2u);
      MEMORY[0x2199C815C](v15, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    sub_213FEB1F4();
    if (MEMORY[0x2199C81F8]((char *)a2 + 96))
    {
      sub_213F7D660(0);
      swift_unknownObjectRelease();
    }
  }
}

uint64_t sub_213FEFEA8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t result;
  uint64_t v10;

  v2 = sub_213FF8D38();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_213FF7778();
  v6 = sub_213FF8D2C();
  v7 = sub_213FF95C0();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_213F36000, v6, v7, "Invoked delegate to close the view", v8, 2u);
    MEMORY[0x2199C815C](v8, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  sub_213FEB1F4();
  result = MEMORY[0x2199C81F8](a1 + 96);
  if (result)
  {
    sub_213F7D660(0);
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_213FEFFC4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  char *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D5C268);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_213FF74E4();
  v6 = *(_QWORD *)(v5 - 8);
  result = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(_QWORD *)(a1 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_learnMoreURL + 8))
  {
    swift_bridgeObjectRetain();
    sub_213FF74D8();
    swift_bridgeObjectRelease();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
    {
      return sub_213F4CF1C((uint64_t)v4, &qword_254D5C268);
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v9, v4, v5);
      v10 = objc_msgSend((id)objc_opt_self(), sel_sharedApplication);
      v11 = (void *)sub_213FF74CC();
      sub_213F414A0(MEMORY[0x24BEE4AF8]);
      type metadata accessor for OpenExternalURLOptionsKey(0);
      sub_213F3B3C0((unint64_t *)&qword_254D5D750, (uint64_t (*)(uint64_t))type metadata accessor for OpenExternalURLOptionsKey, (uint64_t)&unk_213FFBE54);
      v12 = (void *)sub_213FF93C8();
      swift_bridgeObjectRelease();
      objc_msgSend(v10, sel_openURL_options_completionHandler_, v11, v12, 0);

      return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, v5);
    }
  }
  return result;
}

uint64_t sub_213FF01AC()
{
  uint64_t v0;
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
  uint64_t Strong;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  id v17;
  void *v18;
  void *v19;
  _QWORD v20[2];
  uint64_t v21;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D5C268);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)v20 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_213FF74E4();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_213FF8D38();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  if (Strong)
  {
    if (*(_QWORD *)(Strong + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_learnMoreURL + 8))
    {
      swift_bridgeObjectRetain();
      sub_213FF74D8();
      swift_bridgeObjectRelease();
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3) == 1)
      {
        sub_213F4CF1C((uint64_t)v2, &qword_254D5C268);
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v6, v2, v3);
        v17 = objc_msgSend((id)objc_opt_self(), sel_sharedApplication);
        v18 = (void *)sub_213FF74CC();
        sub_213F414A0(MEMORY[0x24BEE4AF8]);
        type metadata accessor for OpenExternalURLOptionsKey(0);
        sub_213F3B3C0((unint64_t *)&qword_254D5D750, (uint64_t (*)(uint64_t))type metadata accessor for OpenExternalURLOptionsKey, (uint64_t)&unk_213FFBE54);
        v19 = (void *)sub_213FF93C8();
        swift_bridgeObjectRelease();
        objc_msgSend(v17, sel_openURL_options_completionHandler_, v18, v19, 0);

        (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
      }
    }
    return swift_release();
  }
  else
  {
    sub_213FF7778();
    v12 = sub_213FF8D2C();
    v13 = sub_213FF95CC();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = (uint8_t *)swift_slowAlloc();
      v15 = swift_slowAlloc();
      v21 = v15;
      *(_DWORD *)v14 = 136315138;
      v20[1] = sub_213F7DD50(0xD000000000000026, 0x8000000214006910, &v21);
      sub_213FF971C();
      _os_log_impl(&dword_213F36000, v12, v13, "self doesn't exist in %s", v14, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2199C815C](v15, -1, -1);
      MEMORY[0x2199C815C](v14, -1, -1);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
}

uint64_t sub_213FF0520()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t Strong;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  _QWORD v17[2];
  uint64_t v18;

  v0 = sub_213FF8D38();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = MEMORY[0x24BDAC7A8](v0);
  v4 = (char *)v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)v17 - v5;
  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  if (Strong)
  {
    v8 = Strong;
    sub_213FF7778();
    v9 = sub_213FF8D2C();
    v10 = sub_213FF95C0();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_213F36000, v9, v10, "Invoked delegate to close the view", v11, 2u);
      MEMORY[0x2199C815C](v11, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v0);
    sub_213FEB1F4();
    if (MEMORY[0x2199C81F8](v8 + 96))
    {
      sub_213F7D660(0);
      swift_release();
      return swift_unknownObjectRelease();
    }
    else
    {
      return swift_release();
    }
  }
  else
  {
    sub_213FF7778();
    v13 = sub_213FF8D2C();
    v14 = sub_213FF95CC();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = (uint8_t *)swift_slowAlloc();
      v16 = swift_slowAlloc();
      v18 = v16;
      *(_DWORD *)v15 = 136315138;
      v17[1] = sub_213F7DD50(0xD000000000000026, 0x8000000214006910, &v18);
      sub_213FF971C();
      _os_log_impl(&dword_213F36000, v13, v14, "self doesn't exist in %s", v15, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2199C815C](v16, -1, -1);
      MEMORY[0x2199C815C](v15, -1, -1);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v6, v0);
  }
}

id sub_213FF0898()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IdentityProofingErrorViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for IdentityProofingErrorViewController()
{
  return objc_opt_self();
}

uint64_t sub_213FF08EC(uint64_t a1)
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
  v9[1] = sub_213F4CFEC;
  return sub_213FEC248(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_213FF096C()
{
  return objectdestroy_3Tm_0((void (*)(_QWORD))MEMORY[0x24BEE4F70]);
}

uint64_t sub_213FF0978(uint64_t a1)
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
  v7[1] = sub_213F4CFEC;
  return sub_213FEB5E8(a1, v4, v5, v6);
}

void *sub_213FF09E4()
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
  int64_t v16;
  unint64_t v17;
  int64_t v18;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D5FF48);
  v2 = *v0;
  v3 = sub_213FF97C4();
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
    v16 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v16 >= v13)
      goto LABEL_28;
    v17 = *(_QWORD *)(v6 + 8 * v16);
    ++v9;
    if (!v17)
    {
      v9 = v16 + 1;
      if (v16 + 1 >= v13)
        goto LABEL_28;
      v17 = *(_QWORD *)(v6 + 8 * v9);
      if (!v17)
      {
        v9 = v16 + 2;
        if (v16 + 2 >= v13)
          goto LABEL_28;
        v17 = *(_QWORD *)(v6 + 8 * v9);
        if (!v17)
          break;
      }
    }
LABEL_27:
    v12 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v9 << 6);
LABEL_12:
    *(_BYTE *)(*(_QWORD *)(v4 + 48) + v15) = *(_BYTE *)(*(_QWORD *)(v2 + 48) + v15);
  }
  v18 = v16 + 3;
  if (v18 >= v13)
    goto LABEL_28;
  v17 = *(_QWORD *)(v6 + 8 * v18);
  if (v17)
  {
    v9 = v18;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v17 = *(_QWORD *)(v6 + 8 * v9);
    ++v18;
    if (v17)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_213FF0B74()
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
  v2 = sub_213FF87B0();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D5FF38);
  v6 = *v0;
  v7 = sub_213FF97C4();
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

uint64_t sub_213FF0D98(unsigned __int8 a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  v3 = *v1;
  sub_213FF9980();
  sub_213FF998C();
  v4 = sub_213FF9998();
  v5 = -1 << *(_BYTE *)(v3 + 32);
  v6 = v4 & ~v5;
  if (((*(_QWORD *)(v3 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
    return 3;
  v7 = *(_QWORD *)(v3 + 48);
  if (*(unsigned __int8 *)(v7 + v6) != a1)
  {
    v8 = ~v5;
    do
    {
      v6 = (v6 + 1) & v8;
      if (((*(_QWORD *)(v3 + 56 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
        return 3;
    }
    while (*(unsigned __int8 *)(v7 + v6) != a1);
  }
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v10 = *v1;
  v13 = *v1;
  *v1 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_213FF09E4();
    v10 = v13;
  }
  v11 = *(unsigned __int8 *)(*(_QWORD *)(v10 + 48) + v6);
  sub_213FF0EB8(v6);
  *v1 = v13;
  swift_bridgeObjectRelease();
  return v11;
}

unint64_t sub_213FF0EB8(unint64_t result)
{
  uint64_t *v1;
  int64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  _BYTE *v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;

  v2 = result;
  v3 = *v1;
  v4 = *v1 + 56;
  v5 = -1 << *(_BYTE *)(*v1 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(v4 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    swift_retain();
    v8 = sub_213FF9794();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v9 = (v8 + 1) & v7;
      do
      {
        sub_213FF9980();
        sub_213FF998C();
        v10 = sub_213FF9998() & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v10 < v9)
            goto LABEL_5;
        }
        else if (v10 >= v9)
        {
          goto LABEL_11;
        }
        if (v2 >= (uint64_t)v10)
        {
LABEL_11:
          v11 = *(_QWORD *)(v3 + 48);
          v12 = (_BYTE *)(v11 + v2);
          v13 = (_BYTE *)(v11 + v6);
          if (v2 != v6 || (v2 = v6, v12 >= v13 + 1))
          {
            *v12 = *v13;
            v2 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    *(_QWORD *)(v4 + (((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << v2) - 1;
    result = swift_release();
  }
  else
  {
    *(_QWORD *)(v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << result) - 1;
  }
  v14 = *(_QWORD *)(v3 + 16);
  v15 = __OFSUB__(v14, 1);
  v16 = v14 - 1;
  if (v15)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v3 + 16) = v16;
    ++*(_DWORD *)(v3 + 36);
  }
  return result;
}

uint64_t sub_213FF1060(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t (*v4)(uint64_t);
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v15;
  uint64_t v16;
  _QWORD aBlock[6];

  v3 = sub_213FF9374();
  v4 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458];
  v16 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_213FF9398();
  v7 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_213F3F7CC(0, (unint64_t *)&qword_254D5CDB0);
  v10 = (void *)sub_213FF9644();
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v1;
  *(_QWORD *)(v11 + 24) = a1;
  aBlock[4] = sub_213FF4AB8;
  aBlock[5] = v11;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_213F402DC;
  aBlock[3] = &block_descriptor_107;
  v12 = _Block_copy(aBlock);
  v13 = a1;
  swift_retain();
  swift_release();
  sub_213FF938C();
  aBlock[0] = MEMORY[0x24BEE4AF8];
  sub_213F3B3C0((unint64_t *)&qword_254D5CDE0, v4, MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254D5F750);
  sub_213FCC014((unint64_t *)&qword_254D5CDF0, (uint64_t *)&unk_254D5F750);
  sub_213FF9788();
  MEMORY[0x2199C7700](0, v9, v6, v12);
  _Block_release(v12);

  (*(void (**)(char *, uint64_t))(v16 + 8))(v6, v3);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v15);
}

void sub_213FF1278(uint64_t a1, unint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v6;
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
  uint64_t v19;
  id v20;
  NSObject *v21;
  os_log_type_t v22;
  uint64_t v23;
  uint8_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  id v36;
  uint64_t v37;
  void *v38;
  id v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  _QWORD *v44;
  void *v45;
  uint64_t v46;
  _QWORD *v47;
  void *v48;
  NSObject *v49;
  os_log_type_t v50;
  uint8_t *v51;
  char *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  uint64_t v66;
  void *aBlock;
  uint64_t v68;
  uint64_t (*v69)();
  void *v70;
  uint64_t (*v71)();
  _QWORD *v72;

  v64 = a3;
  v62 = a1;
  v6 = sub_213FF8810();
  v60 = *(_QWORD *)(v6 - 8);
  v61 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v56 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_213FF881C();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v56 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_213FF8D38();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v56 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v65 = (char *)&v56 - v18;
  v63 = swift_allocObject();
  *(_QWORD *)(v63 + 16) = a4;
  if (a2)
  {
    v19 = v64;
    v20 = a4;
    sub_213FF7778();
    swift_bridgeObjectRetain_n();
    v21 = sub_213FF8D2C();
    v22 = sub_213FF95C0();
    if (os_log_type_enabled(v21, v22))
    {
      v23 = swift_slowAlloc();
      v59 = v14;
      v24 = (uint8_t *)v23;
      v25 = swift_slowAlloc();
      aBlock = (void *)v25;
      *(_DWORD *)v24 = 136315138;
      swift_bridgeObjectRetain();
      v66 = sub_213F7DD50(v62, a2, (uint64_t *)&aBlock);
      sub_213FF971C();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_213F36000, v21, v22, "This is the auth code proofing flow with passcode: %s", v24, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2199C815C](v25, -1, -1);
      MEMORY[0x2199C815C](v24, -1, -1);

      (*(void (**)(char *, uint64_t))(v59 + 8))(v65, v13);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v14 + 8))(v65, v13);
    }
    v26 = v63;
    v41 = *(void **)(v19 + 112);
    v42 = (void *)sub_213FF9428();
    v43 = *(_QWORD *)(v19 + 136);
    v44 = (_QWORD *)swift_allocObject();
    v44[2] = v19;
    v44[3] = sub_213FF4BB4;
    v44[4] = v26;
    v71 = sub_213FF4A78;
    v72 = v44;
    aBlock = (void *)MEMORY[0x24BDAC760];
    v68 = 1107296256;
    v69 = sub_213FE541C;
    v70 = &block_descriptor_174;
    v45 = _Block_copy(&aBlock);
    swift_retain();
    swift_retain();
    swift_release();
    objc_msgSend(v41, sel_proofIdentityUsing_proofingOptions_completion_, v42, v43, v45);
    _Block_release(v45);
    swift_release();

  }
  else
  {
    v57 = v8;
    v58 = v12;
    v62 = v10;
    v59 = v14;
    v65 = (char *)v13;
    v27 = v64;
    v28 = a4;
    swift_retain();
    swift_retain();
    sub_213F6983C();
    v29 = swift_release();
    MEMORY[0x24BDAC7A8](v29);
    __swift_instantiateConcreteTypeFromMangledName(&qword_254D5F348);
    sub_213FF9650();
    swift_release();
    swift_bridgeObjectRelease();
    v30 = aBlock;
    if (aBlock)
    {
      v31 = *(void **)(v27 + 112);
      v32 = *(_QWORD *)(v27 + 136);
      v33 = OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_livenessVideoUploadsManager;
      v34 = *(_QWORD *)(v27 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_livenessVideoUploadsManager);
      if (!v34)
        goto LABEL_10;
      v35 = *(void **)(v34 + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingUploadsManager_queue);
      swift_retain();
      v36 = v35;
      sub_213FF9650();
      swift_release();

      v34 = aBlock;
      v37 = *(_QWORD *)(v27 + v33);
      if (v37)
      {
        v38 = *(void **)(v37 + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingUploadsManager_queue);
        swift_retain();
        v39 = v38;
        sub_213FF9650();
        swift_release();

        v40 = (uint64_t)aBlock;
      }
      else
      {
LABEL_10:
        v40 = 0;
      }
      v46 = v63;
      v47 = (_QWORD *)swift_allocObject();
      v47[2] = v27;
      v47[3] = sub_213FF4BB4;
      v47[4] = v46;
      v71 = sub_213FF4A78;
      v72 = v47;
      aBlock = (void *)MEMORY[0x24BDAC760];
      v68 = 1107296256;
      v69 = sub_213FE541C;
      v70 = &block_descriptor_167;
      v48 = _Block_copy(&aBlock);
      swift_retain();
      swift_retain();
      swift_release();
      objc_msgSend(v31, sel_proofIdentity_::totalUploadAssetsFileSizeInBytes_completion_, v30, v32, v34, v40, v48);

      _Block_release(v48);
    }
    else
    {
      sub_213FF7778();
      v49 = sub_213FF8D2C();
      v50 = sub_213FF95C0();
      if (os_log_type_enabled(v49, v50))
      {
        v51 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v51 = 0;
        _os_log_impl(&dword_213F36000, v49, v50, "proofIdentity skipped due to missing scanned images", v51, 2u);
        MEMORY[0x2199C815C](v51, -1, -1);
      }

      (*(void (**)(char *, char *))(v59 + 8))(v17, v65);
      (*(void (**)(char *, _QWORD, uint64_t))(v60 + 104))(v57, *MEMORY[0x24BE1DCC8], v61);
      sub_213F7DA10(MEMORY[0x24BEE4AF8]);
      v52 = v58;
      sub_213FF8828();
      sub_213F3B3C0((unint64_t *)&qword_254D5C040, (uint64_t (*)(uint64_t))MEMORY[0x24BE1DE60], MEMORY[0x24BE1DE78]);
      v53 = (void *)swift_allocError();
      v54 = v62;
      (*(void (**)(uint64_t, char *, uint64_t))(v62 + 16))(v55, v52, v9);
      sub_213F3D0DC(v53, v28);

      (*(void (**)(char *, uint64_t))(v54 + 8))(v52, v9);
    }
    swift_release();
  }
}

_QWORD *sub_213FF19C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  char *v25;
  char *v26;
  _QWORD *v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  os_log_type_t v34;
  uint8_t *v35;
  _QWORD v37[2];

  v6 = (_QWORD *)v5;
  v37[0] = a5;
  v37[1] = a2;
  v10 = sub_213FF8D38();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)v37 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)(v5 + 16) = 0xD000000000000010;
  *(_QWORD *)(v5 + 24) = 0x80000002140069C0;
  strcpy((char *)(v5 + 32), "id.subregion");
  *(_BYTE *)(v5 + 45) = 0;
  *(_WORD *)(v5 + 46) = -5120;
  strcpy((char *)(v5 + 48), "idtype.proper");
  *(_WORD *)(v5 + 62) = -4864;
  strcpy((char *)(v5 + 64), "idtype.lower");
  *(_BYTE *)(v5 + 77) = 0;
  *(_WORD *)(v5 + 78) = -5120;
  *(_QWORD *)(v5 + 80) = 0x6E2E726575737369;
  *(_QWORD *)(v5 + 88) = 0xEB00000000656D61;
  *(_QWORD *)(v5 + 104) = 0;
  swift_unknownObjectWeakInit();
  *(_QWORD *)(v5 + 128) = 0x4008000000000000;
  *(_QWORD *)(v5 + 136) = 0;
  *(_QWORD *)(v5 + 168) = 0;
  *(_QWORD *)(v5 + 176) = 0;
  *(_QWORD *)(v5 + 160) = 0;
  v14 = v5 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_idType;
  v15 = *MEMORY[0x24BE1D148];
  v16 = sub_213FF7DD8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 104))(v14, v15, v16);
  *(_QWORD *)((char *)v6 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_biomeFedStatsUIConfig) = 0;
  *(_QWORD *)((char *)v6 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_featureEnablementConfig) = 0;
  v17 = OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_attributeMessages;
  v18 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)((char *)v6 + v17) = sub_213F41100(MEMORY[0x24BEE4AF8]);
  v19 = OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_messageReplacements;
  *(_QWORD *)((char *)v6 + v19) = sub_213F41100(v18);
  v20 = (_QWORD *)((char *)v6 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_state);
  *v20 = 0;
  v20[1] = 0;
  v21 = (_QWORD *)((char *)v6 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_country);
  *v21 = 0;
  v21[1] = 0;
  *(_QWORD *)((char *)v6 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_supportedRegions) = v18;
  *(_QWORD *)((char *)v6 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_livenessSessionManager) = 0;
  *(_QWORD *)((char *)v6 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_textReplacementHelper) = 0;
  v22 = OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_livenenessConfigFetchGroup;
  *(_QWORD *)((char *)v6 + v22) = dispatch_group_create();
  *(_QWORD *)((char *)v6 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_livenessConfigFetchError) = 0;
  *(_QWORD *)((char *)v6 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_livenessConfig) = 0;
  *((_BYTE *)v6 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_shouldPreFetchLivenessConfig) = 2;
  *(_QWORD *)((char *)v6 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_livenessVideoUploadsManager) = 0;
  v23 = (char *)v6 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_livenessVideoData;
  v24 = type metadata accessor for IdentityProofingLivenessVideoData(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 56))(v23, 1, 1, v24);
  v25 = (char *)v6 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_waitingForWiFiAlertDataThresholdInBytes;
  *(_QWORD *)v25 = 0;
  v25[8] = 1;
  v26 = (char *)v6 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_lowDataModeAlertDataThresholdInBytes;
  *(_QWORD *)v26 = 0;
  v26[8] = 1;
  v27 = (_QWORD *)((char *)v6 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_learnMoreURL);
  *v27 = 0;
  v27[1] = 0;
  *((_BYTE *)v6 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_isPerformingLivenessStepUp) = 0;
  *((_BYTE *)v6 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_selfieImageIsRequired) = 1;
  v28 = (_QWORD *)((char *)v6 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager__passcode);
  *v28 = 0;
  v28[1] = 0;
  v29 = OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_analyticsReporter;
  sub_213FF7F64();
  swift_allocObject();
  *(_QWORD *)((char *)v6 + v29) = sub_213FF7F58();
  v30 = OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_cardArtData;
  *(_QWORD *)((char *)v6 + v30) = sub_213F41220(v18);
  v31 = OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager__termsAndConditions;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254D61040);
  v32 = swift_allocObject();
  *(_QWORD *)(v32 + 16) = 0;
  *(_QWORD *)(v32 + 24) = 0;
  *(_DWORD *)(v32 + 32) = 0;
  *(_QWORD *)((char *)v6 + v31) = v32;
  sub_213FF7778();
  v33 = sub_213FF8D2C();
  v34 = sub_213FF95C0();
  if (os_log_type_enabled(v33, v34))
  {
    v35 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v35 = 0;
    _os_log_impl(&dword_213F36000, v33, v34, "IdentityProofingFlowManager - init", v35, 2u);
    MEMORY[0x2199C815C](v35, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  v6[18] = a1;
  v6[19] = a3;
  v6[15] = a4;
  *(_QWORD *)((char *)v6 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_attributeConfigHelper) = v37[0];
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  v6[14] = sub_213F4D4F0();
  swift_weakAssign();
  swift_weakAssign();
  return v6;
}

void sub_213FF1DFC(void *a1, uint64_t a2, void *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  id v14;
  char v15;
  id v16;
  id v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  id v21;
  id v22;
  NSObject *v23;
  os_log_type_t v24;
  int v25;
  uint8_t *v26;
  id v27;
  id v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  os_log_t v32;
  uint8_t *v33;
  uint64_t v34;
  _QWORD v35[2];
  uint8_t *v36;
  os_log_t v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  uint64_t v41;

  v6 = sub_213FF8D38();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)v35 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)v35 - v11;
  v13 = *(_QWORD *)(a2 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_livenessVideoUploadsManager);
  if (v13)
  {
    v14 = a3;
    swift_retain();
    swift_retain();
    v15 = sub_213F69CE4();
    swift_release();
    if ((v15 & 1) != 0
      || (type metadata accessor for IdentityProofingReviewSubmissionViewController(), swift_dynamicCastClass())
      || *(_BYTE *)(a2 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_isPerformingLivenessStepUp) == 1
      && (*(_BYTE *)(a2 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_selfieImageIsRequired) & 1) == 0
      && (type metadata accessor for RGBCaptureViewController(), swift_dynamicCastClass()))
    {
      v39 = v14;
      sub_213FAECA8(a1, v13, v39);
      swift_release();

    }
    else
    {
      v21 = objc_msgSend(v14, sel_navigationController);
      swift_retain();
      sub_213FE1D04(v21, 2, 0, 0);

      swift_release();
      sub_213FF7778();
      v22 = a1;
      v23 = sub_213FF8D2C();
      v24 = sub_213FF95C0();
      v25 = v24;
      if (os_log_type_enabled(v23, v24))
      {
        LODWORD(v39) = v25;
        v26 = (uint8_t *)swift_slowAlloc();
        v38 = swift_slowAlloc();
        v41 = v38;
        v36 = v26;
        v37 = v23;
        *(_DWORD *)v26 = 136315138;
        v35[1] = v26 + 4;
        v27 = v22;
        v28 = objc_msgSend(v27, sel_description);
        v29 = sub_213FF9458();
        v31 = v30;

        v40 = sub_213F7DD50(v29, v31, &v41);
        sub_213FF971C();

        swift_bridgeObjectRelease();
        v33 = v36;
        v32 = v37;
        _os_log_impl(&dword_213F36000, v37, (os_log_type_t)v39, "Terms and Conditions not in pagination, unable to show liveness video alert on %s", v36, 0xCu);
        v34 = v38;
        swift_arrayDestroy();
        MEMORY[0x2199C815C](v34, -1, -1);
        MEMORY[0x2199C815C](v33, -1, -1);

      }
      else
      {

      }
      swift_release();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);

    }
  }
  else
  {
    v16 = a3;
    v17 = objc_msgSend(v16, sel_navigationController);
    swift_retain();
    sub_213FE1D04(v17, 2, 0, 0);

    swift_release();
    sub_213FF7778();
    v18 = sub_213FF8D2C();
    v19 = sub_213FF95CC();
    if (os_log_type_enabled(v18, v19))
    {
      v20 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_213F36000, v18, v19, "livenessVideoUploadsManager not instantiated, cannot show upload alert if necessary.", v20, 2u);
      MEMORY[0x2199C815C](v20, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
  }
}

void sub_213FF2240(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, void *a5, void *a6)
{
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
  _QWORD *v22;
  id v23;
  id v24;
  char *v25;
  unint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  id v34;
  id v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  id v43;
  uint64_t v44;
  void *v45;
  id v46;
  uint64_t v47;
  _QWORD *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  _QWORD *v52;
  void *v53;
  _QWORD *v54;
  _QWORD *v55;
  void *v56;
  char *v57;
  NSObject *v58;
  os_log_type_t v59;
  uint8_t *v60;
  char *v61;
  uint64_t v62;
  void *v63;
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
  _QWORD *v74;
  uint64_t v75;
  uint64_t v76;
  void *aBlock;
  uint64_t v78;
  uint64_t (*v79)();
  void *v80;
  uint64_t (*v81)();
  _QWORD *v82;

  v75 = a3;
  v72 = a1;
  v10 = sub_213FF8810();
  v69 = *(_QWORD *)(v10 - 8);
  v70 = v10;
  MEMORY[0x24BDAC7A8](v10);
  v71 = (char *)&v66 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_213FF881C();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v66 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_213FF8D38();
  v17 = *(_QWORD *)(v16 - 8);
  v18 = MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v66 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v73 = (char *)&v66 - v21;
  v22 = (_QWORD *)swift_allocObject();
  v22[2] = a4;
  v22[3] = a5;
  v74 = v22;
  v22[4] = a6;
  if (a2)
  {
    v23 = a6;
    swift_retain();
    v24 = a5;
    v25 = v73;
    sub_213FF7778();
    v26 = a2;
    swift_bridgeObjectRetain_n();
    v27 = sub_213FF8D2C();
    v28 = sub_213FF95C0();
    if (os_log_type_enabled(v27, v28))
    {
      v68 = v17;
      v29 = (uint8_t *)swift_slowAlloc();
      v30 = swift_slowAlloc();
      aBlock = (void *)v30;
      *(_DWORD *)v29 = 136315138;
      swift_bridgeObjectRetain();
      v76 = sub_213F7DD50(v72, v26, (uint64_t *)&aBlock);
      sub_213FF971C();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_213F36000, v27, v28, "This is the auth code proofing flow with passcode: %s", v29, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2199C815C](v30, -1, -1);
      MEMORY[0x2199C815C](v29, -1, -1);

      (*(void (**)(char *, uint64_t))(v68 + 8))(v25, v16);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v17 + 8))(v25, v16);
    }
    v31 = v75;
    v48 = v74;
    v49 = *(void **)(v75 + 112);
    v50 = (void *)sub_213FF9428();
    v51 = *(_QWORD *)(v31 + 136);
    v52 = (_QWORD *)swift_allocObject();
    v52[2] = v31;
    v52[3] = sub_213FF4B5C;
    v52[4] = v48;
    v81 = sub_213FF4A78;
    v82 = v52;
    aBlock = (void *)MEMORY[0x24BDAC760];
    v78 = 1107296256;
    v79 = sub_213FE541C;
    v80 = &block_descriptor_151;
    v53 = _Block_copy(&aBlock);
    swift_retain();
    swift_retain();
    swift_release();
    objc_msgSend(v49, sel_proofIdentityUsing_proofingOptions_completion_, v50, v51, v53);
    _Block_release(v53);
    swift_release();

  }
  else
  {
    v66 = v15;
    v67 = v13;
    v72 = v12;
    v73 = (char *)v16;
    v68 = v17;
    v32 = v75;
    v33 = a6;
    v34 = a6;
    swift_retain();
    swift_retain();
    swift_retain();
    v35 = a5;
    sub_213F6983C();
    v36 = swift_release();
    MEMORY[0x24BDAC7A8](v36);
    __swift_instantiateConcreteTypeFromMangledName(&qword_254D5F348);
    sub_213FF9650();
    swift_release();
    swift_bridgeObjectRelease();
    v37 = aBlock;
    if (aBlock)
    {
      v38 = *(void **)(v32 + 112);
      v39 = *(_QWORD *)(v32 + 136);
      v40 = OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_livenessVideoUploadsManager;
      v41 = *(_QWORD *)(v32 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_livenessVideoUploadsManager);
      if (!v41)
        goto LABEL_10;
      v42 = *(void **)(v41 + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingUploadsManager_queue);
      swift_retain();
      v43 = v42;
      sub_213FF9650();
      swift_release();

      v41 = aBlock;
      v44 = *(_QWORD *)(v32 + v40);
      if (v44)
      {
        v45 = *(void **)(v44 + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingUploadsManager_queue);
        swift_retain();
        v46 = v45;
        sub_213FF9650();
        swift_release();

        v47 = (uint64_t)aBlock;
      }
      else
      {
LABEL_10:
        v47 = 0;
      }
      v54 = v74;
      v55 = (_QWORD *)swift_allocObject();
      v55[2] = v32;
      v55[3] = sub_213FF4B5C;
      v55[4] = v54;
      v81 = sub_213FF4A78;
      v82 = v55;
      aBlock = (void *)MEMORY[0x24BDAC760];
      v78 = 1107296256;
      v79 = sub_213FE541C;
      v80 = &block_descriptor_144;
      v56 = _Block_copy(&aBlock);
      swift_retain();
      swift_retain();
      swift_release();
      objc_msgSend(v38, sel_proofIdentity_::totalUploadAssetsFileSizeInBytes_completion_, v37, v39, v41, v47, v56);

      _Block_release(v56);
    }
    else
    {
      v57 = v20;
      sub_213FF7778();
      v58 = sub_213FF8D2C();
      v59 = sub_213FF95C0();
      if (os_log_type_enabled(v58, v59))
      {
        v60 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v60 = 0;
        _os_log_impl(&dword_213F36000, v58, v59, "proofIdentity skipped due to missing scanned images", v60, 2u);
        MEMORY[0x2199C815C](v60, -1, -1);
      }

      (*(void (**)(char *, char *))(v68 + 8))(v57, v73);
      (*(void (**)(char *, _QWORD, uint64_t))(v69 + 104))(v71, *MEMORY[0x24BE1DCC8], v70);
      sub_213F7DA10(MEMORY[0x24BEE4AF8]);
      v61 = v66;
      sub_213FF8828();
      sub_213F3B3C0((unint64_t *)&qword_254D5C040, (uint64_t (*)(uint64_t))MEMORY[0x24BE1DE60], MEMORY[0x24BE1DE78]);
      v62 = v72;
      v63 = (void *)swift_allocError();
      v64 = v67;
      (*(void (**)(uint64_t, char *, uint64_t))(v67 + 16))(v65, v61, v62);
      sub_213FA93DC(v63, a4, v35, v33);

      (*(void (**)(char *, uint64_t))(v64 + 8))(v61, v62);
    }
    swift_release();
  }
}

void sub_213FF29DC(void *a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  id v19;
  char v20;
  id v21;
  uint64_t v22;
  id v23;
  id v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  id v28;
  NSObject *v29;
  os_log_type_t v30;
  int v31;
  uint64_t v32;
  uint8_t *v33;
  id v34;
  id v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  os_log_t v39;
  uint8_t *v40;
  uint64_t v41;
  _QWORD v42[2];
  uint8_t *v43;
  int v44;
  uint64_t v45;
  os_log_t v46;
  uint64_t v47;
  id v48;
  uint64_t v49;
  uint64_t v50;

  v10 = sub_213FF8D38();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)v42 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x24BDAC7A8](v12);
  v17 = (char *)v42 - v16;
  v18 = *(_QWORD *)(a2 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_livenessVideoUploadsManager);
  if (v18)
  {
    v47 = v15;
    v48 = a5;
    swift_retain();
    swift_retain();
    swift_retain();
    v19 = a4;
    v20 = sub_213F69CE4();
    swift_release();
    if ((v20 & 1) != 0
      || (type metadata accessor for IdentityProofingReviewSubmissionViewController(), swift_dynamicCastClass())
      || *(_BYTE *)(a2 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_isPerformingLivenessStepUp) == 1
      && (*(_BYTE *)(a2 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_selfieImageIsRequired) & 1) == 0
      && (type metadata accessor for RGBCaptureViewController(), swift_dynamicCastClass()))
    {
      swift_retain();
      v21 = v19;
      v48 = v48;
      sub_213FAF660(a1, v18, a3, v21, a5);
      swift_release();
      swift_release_n();

      return;
    }
    sub_213FA8CE0(a3, v19, a5);
    sub_213FF7778();
    v28 = a1;
    v29 = sub_213FF8D2C();
    v30 = sub_213FF95C0();
    v31 = v30;
    if (os_log_type_enabled(v29, v30))
    {
      v46 = v29;
      v32 = swift_slowAlloc();
      v44 = v31;
      v33 = (uint8_t *)v32;
      v45 = swift_slowAlloc();
      v50 = v45;
      v43 = v33;
      *(_DWORD *)v33 = 136315138;
      v42[1] = v33 + 4;
      v34 = v28;
      v35 = objc_msgSend(v34, sel_description);
      v36 = sub_213FF9458();
      v38 = v37;

      v49 = sub_213F7DD50(v36, v38, &v50);
      sub_213FF971C();

      swift_bridgeObjectRelease();
      v39 = v46;
      v40 = v43;
      _os_log_impl(&dword_213F36000, v46, (os_log_type_t)v44, "Terms and Conditions not in pagination, unable to show liveness video alert on %s", v43, 0xCu);
      v41 = v45;
      swift_arrayDestroy();
      MEMORY[0x2199C815C](v41, -1, -1);
      MEMORY[0x2199C815C](v40, -1, -1);

    }
    else
    {

    }
    swift_release();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v47);

  }
  else
  {
    v22 = v15;
    v23 = a5;
    swift_retain();
    v24 = a4;
    sub_213FA8CE0(a3, v24, a5);
    sub_213FF7778();
    v25 = sub_213FF8D2C();
    v26 = sub_213FF95CC();
    if (os_log_type_enabled(v25, v26))
    {
      v27 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v27 = 0;
      _os_log_impl(&dword_213F36000, v25, v26, "livenessVideoUploadsManager not instantiated, cannot show upload alert if necessary.", v27, 2u);
      MEMORY[0x2199C815C](v27, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v11 + 8))(v17, v22);
  }
  swift_release();
}

uint64_t sub_213FF2E0C()
{
  return objectdestroy_3Tm_0((void (*)(_QWORD))MEMORY[0x24BEE4F70]);
}

uint64_t sub_213FF2E18(uint64_t a1)
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
  v7[1] = sub_213F4CFEC;
  return sub_213FE9FF4(a1, v4, v5, v6);
}

void sub_213FF2E84(void *a1, void *a2)
{
  uint64_t v2;

  sub_213FE8A74(a1, a2, v2);
}

uint64_t block_copy_helper_26(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_26()
{
  return swift_release();
}

uint64_t sub_213FF2EA4()
{
  return objectdestroy_3Tm_0((void (*)(_QWORD))MEMORY[0x24BEE4F70]);
}

uint64_t sub_213FF2EB0(uint64_t a1)
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
  v7[1] = sub_213F4CFEC;
  return sub_213FE7DE8(a1, v4, v5, v6);
}

uint64_t sub_213FF2F1C()
{
  swift_release();
  return swift_deallocObject();
}

void sub_213FF2F40(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  void (**v14)(char *, uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint64_t v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  id v34;
  uint64_t v35;
  void *v36;
  id v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  _QWORD *v42;
  void *v43;
  NSObject *v44;
  os_log_type_t v45;
  uint8_t *v46;
  char *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  void *aBlock;
  uint64_t v65;
  uint64_t (*v66)();
  void *v67;
  uint64_t (*v68)();
  _QWORD *v69;

  v62 = a4;
  v59 = a1;
  v60 = a3;
  v5 = sub_213FF8810();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v53 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_213FF881C();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v53 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_213FF8D38();
  v14 = *(void (***)(char *, uint64_t))(v13 - 8);
  v15 = MEMORY[0x24BDAC7A8](v13);
  MEMORY[0x24BDAC7A8](v15);
  v61 = (char *)&v53 - v17;
  if (a2)
  {
    v18 = v62;
    swift_retain();
    sub_213FF7778();
    swift_bridgeObjectRetain_n();
    v19 = sub_213FF8D2C();
    v20 = sub_213FF95C0();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = swift_slowAlloc();
      v58 = v13;
      v22 = (uint8_t *)v21;
      v23 = swift_slowAlloc();
      aBlock = (void *)v23;
      *(_DWORD *)v22 = 136315138;
      swift_bridgeObjectRetain();
      v63 = sub_213F7DD50(v59, a2, (uint64_t *)&aBlock);
      sub_213FF971C();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_213F36000, v19, v20, "This is the auth code proofing flow with passcode: %s", v22, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2199C815C](v23, -1, -1);
      MEMORY[0x2199C815C](v22, -1, -1);

      v14[1](v61, v58);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      v14[1](v61, v13);
    }
    v24 = v60;
    v39 = *(void **)(v60 + 112);
    v40 = (void *)sub_213FF9428();
    v41 = *(_QWORD *)(v24 + 136);
    v42 = (_QWORD *)swift_allocObject();
    v42[2] = v24;
    v42[3] = sub_213FF4B08;
    v42[4] = v18;
    v68 = sub_213FF4A78;
    v69 = v42;
    aBlock = (void *)MEMORY[0x24BDAC760];
    v65 = 1107296256;
    v66 = sub_213FE541C;
    v67 = &block_descriptor_131;
    v43 = _Block_copy(&aBlock);
    swift_retain();
    swift_retain();
    swift_release();
    objc_msgSend(v39, sel_proofIdentityUsing_proofingOptions_completion_, v40, v41, v43);
    _Block_release(v43);
    swift_release();

  }
  else
  {
    v25 = v16;
    v54 = v6;
    v55 = v5;
    v56 = v8;
    v57 = v12;
    v58 = v13;
    v59 = v10;
    v61 = (char *)v14;
    v26 = v60;
    swift_retain();
    swift_retain();
    swift_retain();
    sub_213F6983C();
    v27 = swift_release();
    MEMORY[0x24BDAC7A8](v27);
    __swift_instantiateConcreteTypeFromMangledName(&qword_254D5F348);
    sub_213FF9650();
    swift_release();
    swift_bridgeObjectRelease();
    v28 = aBlock;
    if (aBlock)
    {
      v29 = *(void **)(v26 + 112);
      v30 = *(_QWORD *)(v26 + 136);
      v31 = OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_livenessVideoUploadsManager;
      v32 = *(_QWORD *)(v26 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_livenessVideoUploadsManager);
      if (!v32)
        goto LABEL_13;
      v33 = *(void **)(v32 + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingUploadsManager_queue);
      swift_retain();
      v34 = v33;
      sub_213FF9650();
      swift_release();

      v32 = aBlock;
      v35 = *(_QWORD *)(v26 + v31);
      if (v35)
      {
        v36 = *(void **)(v35 + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingUploadsManager_queue);
        swift_retain();
        v37 = v36;
        sub_213FF9650();
        swift_release();

        v38 = (uint64_t)aBlock;
      }
      else
      {
LABEL_13:
        v38 = 0;
      }
      v51 = (_QWORD *)swift_allocObject();
      v51[2] = v26;
      v51[3] = sub_213FF4B08;
      v51[4] = v62;
      v68 = sub_213FF4A78;
      v69 = v51;
      aBlock = (void *)MEMORY[0x24BDAC760];
      v65 = 1107296256;
      v66 = sub_213FE541C;
      v67 = &block_descriptor_124;
      v52 = _Block_copy(&aBlock);
      swift_retain();
      swift_retain();
      swift_release();
      objc_msgSend(v29, sel_proofIdentity_::totalUploadAssetsFileSizeInBytes_completion_, v28, v30, v32, v38, v52);

      _Block_release(v52);
    }
    else
    {
      sub_213FF7778();
      v44 = sub_213FF8D2C();
      v45 = sub_213FF95C0();
      if (os_log_type_enabled(v44, v45))
      {
        v46 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v46 = 0;
        _os_log_impl(&dword_213F36000, v44, v45, "proofIdentity skipped due to missing scanned images", v46, 2u);
        MEMORY[0x2199C815C](v46, -1, -1);
      }

      (*((void (**)(uint64_t, uint64_t))v61 + 1))(v25, v58);
      (*(void (**)(char *, _QWORD, uint64_t))(v54 + 104))(v56, *MEMORY[0x24BE1DCC8], v55);
      sub_213F7DA10(MEMORY[0x24BEE4AF8]);
      v47 = v57;
      sub_213FF8828();
      sub_213F3B3C0((unint64_t *)&qword_254D5C040, (uint64_t (*)(uint64_t))MEMORY[0x24BE1DE60], MEMORY[0x24BE1DE78]);
      v48 = (void *)swift_allocError();
      v49 = v59;
      (*(void (**)(uint64_t, char *, uint64_t))(v59 + 16))(v50, v47, v9);
      sub_213FB4274(v48, v62);

      (*(void (**)(char *, uint64_t))(v49 + 8))(v47, v9);
    }
    swift_release();
  }
}

void sub_213FF3680(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  void (**v14)(char *, uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint64_t v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  id v34;
  uint64_t v35;
  void *v36;
  id v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  _QWORD *v42;
  void *v43;
  NSObject *v44;
  os_log_type_t v45;
  uint8_t *v46;
  char *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  void *aBlock;
  uint64_t v65;
  uint64_t (*v66)();
  void *v67;
  uint64_t (*v68)();
  _QWORD *v69;

  v62 = a4;
  v59 = a1;
  v60 = a3;
  v5 = sub_213FF8810();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v53 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_213FF881C();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v53 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_213FF8D38();
  v14 = *(void (***)(char *, uint64_t))(v13 - 8);
  v15 = MEMORY[0x24BDAC7A8](v13);
  MEMORY[0x24BDAC7A8](v15);
  v61 = (char *)&v53 - v17;
  if (a2)
  {
    v18 = v62;
    swift_retain();
    sub_213FF7778();
    swift_bridgeObjectRetain_n();
    v19 = sub_213FF8D2C();
    v20 = sub_213FF95C0();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = swift_slowAlloc();
      v58 = v13;
      v22 = (uint8_t *)v21;
      v23 = swift_slowAlloc();
      aBlock = (void *)v23;
      *(_DWORD *)v22 = 136315138;
      swift_bridgeObjectRetain();
      v63 = sub_213F7DD50(v59, a2, (uint64_t *)&aBlock);
      sub_213FF971C();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_213F36000, v19, v20, "This is the auth code proofing flow with passcode: %s", v22, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2199C815C](v23, -1, -1);
      MEMORY[0x2199C815C](v22, -1, -1);

      v14[1](v61, v58);
    }
    else
    {

      swift_bridgeObjectRelease_n();
      v14[1](v61, v13);
    }
    v24 = v60;
    v39 = *(void **)(v60 + 112);
    v40 = (void *)sub_213FF9428();
    v41 = *(_QWORD *)(v24 + 136);
    v42 = (_QWORD *)swift_allocObject();
    v42[2] = v24;
    v42[3] = sub_213FF4A4C;
    v42[4] = v18;
    v68 = sub_213FF4A78;
    v69 = v42;
    aBlock = (void *)MEMORY[0x24BDAC760];
    v65 = 1107296256;
    v66 = sub_213FE541C;
    v67 = &block_descriptor_101;
    v43 = _Block_copy(&aBlock);
    swift_retain();
    swift_retain();
    swift_release();
    objc_msgSend(v39, sel_proofIdentityUsing_proofingOptions_completion_, v40, v41, v43);
    _Block_release(v43);
    swift_release();

  }
  else
  {
    v25 = v16;
    v54 = v6;
    v55 = v5;
    v56 = v8;
    v57 = v12;
    v58 = v13;
    v59 = v10;
    v61 = (char *)v14;
    v26 = v60;
    swift_retain();
    swift_retain();
    swift_retain();
    sub_213F6983C();
    v27 = swift_release();
    MEMORY[0x24BDAC7A8](v27);
    __swift_instantiateConcreteTypeFromMangledName(&qword_254D5F348);
    sub_213FF9650();
    swift_release();
    swift_bridgeObjectRelease();
    v28 = aBlock;
    if (aBlock)
    {
      v29 = *(void **)(v26 + 112);
      v30 = *(_QWORD *)(v26 + 136);
      v31 = OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_livenessVideoUploadsManager;
      v32 = *(_QWORD *)(v26 + OBJC_IVAR____TtC9CoreIDVUI27IdentityProofingFlowManager_livenessVideoUploadsManager);
      if (!v32)
        goto LABEL_13;
      v33 = *(void **)(v32 + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingUploadsManager_queue);
      swift_retain();
      v34 = v33;
      sub_213FF9650();
      swift_release();

      v32 = aBlock;
      v35 = *(_QWORD *)(v26 + v31);
      if (v35)
      {
        v36 = *(void **)(v35 + OBJC_IVAR____TtC9CoreIDVUI30IdentityProofingUploadsManager_queue);
        swift_retain();
        v37 = v36;
        sub_213FF9650();
        swift_release();

        v38 = (uint64_t)aBlock;
      }
      else
      {
LABEL_13:
        v38 = 0;
      }
      v51 = (_QWORD *)swift_allocObject();
      v51[2] = v26;
      v51[3] = sub_213FF4A4C;
      v51[4] = v62;
      v68 = sub_213FF4A78;
      v69 = v51;
      aBlock = (void *)MEMORY[0x24BDAC760];
      v65 = 1107296256;
      v66 = sub_213FE541C;
      v67 = &block_descriptor_95;
      v52 = _Block_copy(&aBlock);
      swift_retain();
      swift_retain();
      swift_release();
      objc_msgSend(v29, sel_proofIdentity_::totalUploadAssetsFileSizeInBytes_completion_, v28, v30, v32, v38, v52);

      _Block_release(v52);
    }
    else
    {
      sub_213FF7778();
      v44 = sub_213FF8D2C();
      v45 = sub_213FF95C0();
      if (os_log_type_enabled(v44, v45))
      {
        v46 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v46 = 0;
        _os_log_impl(&dword_213F36000, v44, v45, "proofIdentity skipped due to missing scanned images", v46, 2u);
        MEMORY[0x2199C815C](v46, -1, -1);
      }

      (*((void (**)(uint64_t, uint64_t))v61 + 1))(v25, v58);
      (*(void (**)(char *, _QWORD, uint64_t))(v54 + 104))(v56, *MEMORY[0x24BE1DCC8], v55);
      sub_213F7DA10(MEMORY[0x24BEE4AF8]);
      v47 = v57;
      sub_213FF8828();
      sub_213F3B3C0((unint64_t *)&qword_254D5C040, (uint64_t (*)(uint64_t))MEMORY[0x24BE1DE60], MEMORY[0x24BE1DE78]);
      v48 = (void *)swift_allocError();
      v49 = v59;
      (*(void (**)(uint64_t, char *, uint64_t))(v59 + 16))(v50, v47, v9);
      sub_213FBC1B0(v48, v62);

      (*(void (**)(char *, uint64_t))(v49 + 8))(v47, v9);
    }
    swift_release();
  }
}

void *sub_213FF3DC0(unint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;

  if (a1 >> 62)
  {
LABEL_25:
    swift_bridgeObjectRetain();
    v4 = sub_213FF9884();
    if (v4)
      goto LABEL_3;
  }
  else
  {
    v4 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v4)
    {
LABEL_3:
      v5 = 4;
      while (1)
      {
        if ((a1 & 0xC000000000000001) != 0)
          v6 = (id)MEMORY[0x2199C78A4](v5 - 4, a1);
        else
          v6 = *(id *)(a1 + 8 * v5);
        v7 = v6;
        v8 = v5 - 3;
        if (__OFADD__(v5 - 4, 1))
        {
          __break(1u);
          goto LABEL_25;
        }
        v9 = sub_213FF82F4();
        v11 = v10;
        if (!a2)
          break;
        v12 = v9;
        v13 = sub_213FF82F4();
        if (!v11)
        {
          if (!v14)
            goto LABEL_23;
          goto LABEL_5;
        }
        if (!v14)
          goto LABEL_5;
        if (v12 == v13 && v11 == v14)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
LABEL_23:
          swift_bridgeObjectRelease();
          return v7;
        }
        v15 = sub_213FF98FC();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v15 & 1) != 0)
          goto LABEL_23;

LABEL_6:
        ++v5;
        if (v8 == v4)
          goto LABEL_26;
      }
      if (!v10)
        goto LABEL_23;
LABEL_5:

      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
  }
LABEL_26:
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_213FF3F80(uint64_t a1, void *a2)
{
  uint64_t v2;

  return sub_213FE8514(a1, a2, v2);
}

uint64_t objectdestroyTm_5()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_213FF3FC0(uint64_t a1)
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
  v9[1] = sub_213F4CFEC;
  return sub_213FE5830(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_213FF4040(uint64_t a1)
{
  uint64_t v1;

  return sub_213FEE1C0(a1, v1);
}

uint64_t sub_213FF4048()
{
  uint64_t v0;

  swift_release();
  if (*(_QWORD *)(v0 + 32))
    swift_release();

  return swift_deallocObject();
}

uint64_t sub_213FF4084(uint64_t a1)
{
  uint64_t v1;

  return sub_213FEE2D4(a1, *(_QWORD *)(v1 + 16), *(unsigned __int8 *)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40), *(void **)(v1 + 48));
}

uint64_t sub_213FF4098()
{
  uint64_t v0;

  swift_release();
  if (*(_QWORD *)(v0 + 24))
    swift_release();
  return swift_deallocObject();
}

uint64_t sub_213FF40CC()
{
  uint64_t v0;

  return sub_213FEE770(*(_QWORD *)(v0 + 16), *(uint64_t (**)(uint64_t))(v0 + 24));
}

uint64_t sub_213FF40D8()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_213FF410C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v4 = v1[2];
  v5 = v1[3];
  v7 = v1[4];
  v6 = v1[5];
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_213F4CFEC;
  return sub_213FEE8A8(a1, v4, v5, v7, v6);
}

uint64_t sub_213FF4184()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1[20] = v0;
  v2 = sub_213FF8D38();
  v1[21] = v2;
  v1[22] = *(_QWORD *)(v2 - 8);
  v1[23] = swift_task_alloc();
  v1[24] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_213FF41F4()
{
  _QWORD *v0;
  _QWORD *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v1 = (_QWORD *)v0[20];
  sub_213FEB1F4();
  v2 = (void *)v1[14];
  v3 = (void *)v1[20];
  v0[25] = v3;
  v4 = v1[17];
  v0[2] = v0;
  v0[3] = sub_213FF42A8;
  v5 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v6 = v0 + 10;
  v6[1] = 0x40000000;
  v6[2] = sub_213FE1FB4;
  v6[3] = &block_descriptor_70_0;
  v6[4] = v5;
  objc_msgSend(v2, sel_proofingCancelledWithConfiguration_proofingOptions_completionHandler_, v3, v4, v6);
  return swift_continuation_await();
}

uint64_t sub_213FF42A8()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 208) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_213FF4308()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_213FF7778();
  v1 = sub_213FF8D2C();
  v2 = sub_213FF95C0();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_213F36000, v1, v2, "Proofing Session Cancellation Successful", v3, 2u);
    MEMORY[0x2199C815C](v3, -1, -1);
  }
  v4 = *(_QWORD *)(v0 + 192);
  v5 = *(_QWORD *)(v0 + 168);
  v6 = *(_QWORD *)(v0 + 176);

  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(BOOL))(v0 + 8))(*(_QWORD *)(v0 + 208) == 0);
}

uint64_t sub_213FF43E8()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  void *v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v2 = *(void **)(v0 + 200);
  v1 = *(void **)(v0 + 208);
  swift_willThrow();

  sub_213FF7778();
  v3 = v1;
  v4 = v1;
  v5 = sub_213FF8D2C();
  v6 = sub_213FF95C0();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = *(void **)(v0 + 208);
    v17 = *(_QWORD *)(v0 + 176);
    v18 = *(_QWORD *)(v0 + 168);
    v19 = *(_QWORD *)(v0 + 184);
    v8 = (uint8_t *)swift_slowAlloc();
    v9 = swift_slowAlloc();
    v20 = v9;
    *(_DWORD *)v8 = 136315138;
    swift_getErrorValue();
    v10 = sub_213FF9950();
    *(_QWORD *)(v0 + 152) = sub_213F7DD50(v10, v11, &v20);
    sub_213FF971C();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_213F36000, v5, v6, "Error received while cancelling proofing session %s", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2199C815C](v9, -1, -1);
    MEMORY[0x2199C815C](v8, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v19, v18);
  }
  else
  {
    v12 = *(void **)(v0 + 208);
    v14 = *(_QWORD *)(v0 + 176);
    v13 = *(_QWORD *)(v0 + 184);
    v15 = *(_QWORD *)(v0 + 168);

    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v15);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(BOOL))(v0 + 8))(*(_QWORD *)(v0 + 208) == 0);
}

uint64_t sub_213FF4608()
{
  uint64_t v0;

  return sub_213FED27C(*(void **)(v0 + 24), 0x8000000214006770, "Unable to show the cancellation failure alert as the server doesn't have the related fields in the config");
}

uint64_t sub_213FF4644()
{
  uint64_t v0;

  return sub_213FEFEA8(v0);
}

uint64_t sub_213FF4660(uint64_t a1)
{
  uint64_t v1;

  return sub_213FEEBF4(a1, *(_QWORD *)(v1 + 16), *(void **)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40));
}

void sub_213FF4670()
{
  uint64_t v0;

  sub_213FF467C(*(_QWORD *)(v0 + 24), *(void (**)(_QWORD))(v0 + 32), *(_QWORD *)(v0 + 40));
}

void sub_213FF467C(uint64_t a1, void (*a2)(_QWORD), uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void (*v25)(_QWORD);
  _QWORD aBlock[6];

  v6 = sub_213FF8810();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDB4398]), sel_init);
  v11 = objc_msgSend(v10, sel_aida_accountForPrimaryiCloudAccount);
  if (!v11)
    goto LABEL_5;
  v12 = v11;
  v25 = a2;
  v13 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  v14 = objc_msgSend(v13, sel_altDSIDForAccount_, v12);

  if (!v14)
  {

    a2 = v25;
LABEL_5:
    (*(void (**)(char *, _QWORD, uint64_t))(v7 + 104))(v9, *MEMORY[0x24BE1DC88], v6);
    sub_213F7DA10(MEMORY[0x24BEE4AF8]);
    sub_213FF881C();
    sub_213F3B3C0((unint64_t *)&qword_254D5C040, (uint64_t (*)(uint64_t))MEMORY[0x24BE1DE60], MEMORY[0x24BE1DE78]);
    v23 = (void *)swift_allocError();
    sub_213FF8828();
    a2(v23);

    goto LABEL_6;
  }
  sub_213FF9458();
  v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE0ACB8]), sel_init);
  objc_msgSend(v15, sel_setAltDSID_, v14);

  v16 = *MEMORY[0x24BE0AC40];
  objc_msgSend(v15, sel_setSecurityUpgradeContext_, *MEMORY[0x24BE0AC40]);
  v17 = objc_allocWithZone(MEMORY[0x24BE1AA20]);
  v18 = (void *)sub_213FF9428();
  swift_bridgeObjectRelease();
  v19 = objc_msgSend(v17, sel_initWithAltDSID_, v18);

  objc_msgSend(v19, sel_setPresentingViewController_, a1);
  objc_msgSend(v19, sel_setDeviceToDeviceEncryptionUpgradeType_, 1);
  objc_msgSend(v19, sel_setDeviceToDeviceEncryptionUpgradeUIStyle_, 3);
  objc_msgSend(v19, sel_setSecurityUpgradeContext_, v16);
  v20 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE1AA28]), sel_initWithContext_, v19);
  v21 = swift_allocObject();
  *(_QWORD *)(v21 + 16) = v25;
  *(_QWORD *)(v21 + 24) = a3;
  aBlock[4] = sub_213FF4A3C;
  aBlock[5] = v21;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_213FEF1E0;
  aBlock[3] = &block_descriptor_88;
  v22 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v20, sel_performDeviceToDeviceEncryptionStateRepairWithCompletion_, v22);
  _Block_release(v22);

  v10 = v20;
LABEL_6:

}

void sub_213FF4A3C(char a1, uint64_t a2)
{
  uint64_t v2;

  sub_213FEEE1C(a1, a2, *(void (**)(_QWORD))(v2 + 16), *(_QWORD *)(v2 + 24));
}

void sub_213FF4A44()
{
  uint64_t v0;

  sub_213FED040(v0);
}

void sub_213FF4A4C(void *a1)
{
  uint64_t v1;

  sub_213FBC1B0(a1, v1);
}

uint64_t sub_213FF4A54@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  return sub_213FAE1DC(v1, a1);
}

uint64_t sub_213FF4A6C()
{
  return objectdestroy_3Tm_0((void (*)(_QWORD))MEMORY[0x24BEE4EF8]);
}

uint64_t sub_213FF4A7C()
{
  return objectdestroy_3Tm_0((void (*)(_QWORD))MEMORY[0x24BEE4EF8]);
}

uint64_t objectdestroy_61Tm()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

void sub_213FF4AB8()
{
  uint64_t v0;

  sub_213FECAD8(*(void **)(v0 + 24));
}

uint64_t sub_213FF4ADC()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_213FF4B00()
{
  return sub_213FEFB84();
}

void sub_213FF4B08(void *a1)
{
  uint64_t v1;

  sub_213FB4274(a1, v1);
}

uint64_t sub_213FF4B10()
{
  return objectdestroy_3Tm_0((void (*)(_QWORD))MEMORY[0x24BEE4EF8]);
}

uint64_t sub_213FF4B1C()
{
  return objectdestroy_3Tm_0((void (*)(_QWORD))MEMORY[0x24BEE4EF8]);
}

uint64_t sub_213FF4B28()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

void sub_213FF4B5C(void *a1)
{
  uint64_t v1;

  sub_213FA93DC(a1, *(_QWORD *)(v1 + 16), *(void **)(v1 + 24), *(void **)(v1 + 32));
}

uint64_t sub_213FF4B68()
{
  return objectdestroy_3Tm_0((void (*)(_QWORD))MEMORY[0x24BEE4EF8]);
}

uint64_t sub_213FF4B74()
{
  return objectdestroy_3Tm_0((void (*)(_QWORD))MEMORY[0x24BEE4EF8]);
}

uint64_t sub_213FF4B80()
{
  return sub_213FF01AC();
}

uint64_t sub_213FF4B88()
{
  return sub_213FF0520();
}

uint64_t sub_213FF4B90()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_213FF4BB4(void *a1)
{
  uint64_t v1;

  sub_213F3D0DC(a1, *(void **)(v1 + 16));
}

uint64_t sub_213FF4BBC()
{
  return objectdestroy_3Tm_0((void (*)(_QWORD))MEMORY[0x24BEE4EF8]);
}

uint64_t sub_213FF4BC8()
{
  return objectdestroy_3Tm_0((void (*)(_QWORD))MEMORY[0x24BEE4EF8]);
}

void sub_213FF4BD4(uint64_t a1, void *a2)
{
  uint64_t v2;

  sub_213FE475C(a1, a2, *(void (**)(_QWORD))(v2 + 24), *(void (**)(_QWORD))(v2 + 32));
}

uint64_t sub_213FF4BFC()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

void sub_213FF4C28()
{
  uint64_t v0;

  sub_213FEFCE0(*(_BYTE *)(v0 + 16), *(uint64_t (**)())(v0 + 24), *(void **)(v0 + 32));
}

uint64_t sub_213FF4C34()
{
  uint64_t v0;

  return sub_213FEFFC4(v0);
}

uint64_t sub_213FF4C4C()
{
  return objectdestroy_3Tm_0((void (*)(_QWORD))MEMORY[0x24BEE4F70]);
}

uint64_t objectdestroy_3Tm_0(void (*a1)(_QWORD))
{
  uint64_t v1;

  a1(*(_QWORD *)(v1 + 16));
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_213FF4C88()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_213F4AD48;
  v3[2] = v2;
  return swift_task_switch();
}

uint64_t sub_213FF4D8C@<X0>(uint64_t *a1@<X8>)
{
  return sub_213FB178C(a1);
}

uint64_t sub_213FF4DA0()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v10;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D5F760);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_213FF956C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(v3, 1, 1, v4);
  sub_213FF9554();
  v5 = v0;
  v6 = sub_213FF9548();
  v7 = (_QWORD *)swift_allocObject();
  v8 = MEMORY[0x24BEE6930];
  v7[2] = v6;
  v7[3] = v8;
  v7[4] = v5;
  sub_213F4BE78((uint64_t)v3, (uint64_t)&unk_254D5D1C0, (uint64_t)v7);
  return swift_release();
}

uint64_t sub_213FF4E7C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[3];
  uint64_t v8;
  uint64_t v9;
  _BYTE v10[24];
  uint64_t v11;

  v3 = v1 + OBJC_IVAR____TtC9CoreIDVUI41BiometricBindingReplacementViewController_delegate;
  swift_beginAccess();
  sub_213F64110(v3, (uint64_t)v10);
  if (!v11)
    return sub_213F4CF1C((uint64_t)v10, &qword_254D5D1B0);
  sub_213F5F2B8((uint64_t)v10, (uint64_t)v7);
  sub_213F4CF1C((uint64_t)v10, &qword_254D5D1B0);
  v4 = v8;
  v5 = v9;
  __swift_project_boxed_opaque_existential_1(v7, v8);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 16))(v1, a1, v4, v5);
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v7);
}

uint64_t sub_213FF4F44(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v9[3];
  uint64_t v10;
  uint64_t v11;
  _BYTE v12[24];
  uint64_t v13;

  v5 = v2 + OBJC_IVAR____TtC9CoreIDVUI41BiometricBindingReplacementViewController_delegate;
  swift_beginAccess();
  sub_213F64110(v5, (uint64_t)v12);
  if (!v13)
    return sub_213F4CF1C((uint64_t)v12, &qword_254D5D1B0);
  sub_213F5F2B8((uint64_t)v12, (uint64_t)v9);
  sub_213F4CF1C((uint64_t)v12, &qword_254D5D1B0);
  v6 = v10;
  v7 = v11;
  __swift_project_boxed_opaque_existential_1(v9, v10);
  (*(void (**)(uint64_t, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t))(v7 + 8))(v2, a1, a2, 0, v6, v7);
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);
}

id sub_213FF5020()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;

  v1 = OBJC_IVAR____TtC9CoreIDVUI41BiometricBindingReplacementViewController____lazy_storage___cancelButton;
  v2 = *(void **)(v0
                + OBJC_IVAR____TtC9CoreIDVUI41BiometricBindingReplacementViewController____lazy_storage___cancelButton);
  if (v2)
  {
    v3 = *(id *)(v0
               + OBJC_IVAR____TtC9CoreIDVUI41BiometricBindingReplacementViewController____lazy_storage___cancelButton);
  }
  else
  {
    v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD410]), sel_initWithBarButtonSystemItem_target_action_, 1, v0, sel_cancelBarButtonClicked);
    v5 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v4;
    v3 = v4;

    v2 = 0;
  }
  v6 = v2;
  return v3;
}

void sub_213FF50A4()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  id v28;

  v1 = sub_213FF7538();
  MEMORY[0x24BDAC7A8](v1);
  v2 = sub_213FF941C();
  MEMORY[0x24BDAC7A8](v2);
  v3 = *(void **)&v0[OBJC_IVAR____TtC9CoreIDVUI41BiometricBindingReplacementViewController_titleLabel];
  objc_msgSend(v3, sel_setNumberOfLines_, 0);
  v4 = objc_msgSend((id)objc_opt_self(), sel_labelColor);
  objc_msgSend(v3, sel_setTextColor_, v4);

  objc_msgSend(v3, sel_setAccessibilityTraits_, *MEMORY[0x24BEBDF08]);
  objc_msgSend(v3, sel_setTextAlignment_, 1);
  objc_msgSend(v3, sel_setAdjustsFontForContentSizeCategory_, 1);
  v5 = (void *)objc_opt_self();
  v6 = objc_msgSend(v5, sel__preferredFontForTextStyle_maximumContentSizeCategory_, *MEMORY[0x24BEBE210], *MEMORY[0x24BEBE070]);
  if (!v6)
  {
    __break(1u);
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  v7 = v6;
  objc_msgSend(v6, sel_pointSize);
  v8 = objc_msgSend(v5, sel_systemFontOfSize_weight_);

  objc_msgSend(v3, sel_setFont_, v8);
  sub_213FF9410();
  if (qword_254D5BA30 != -1)
    swift_once();
  v9 = (id)qword_254D62FB0;
  sub_213FF752C();
  sub_213FF9470();
  v10 = (void *)sub_213FF9428();
  swift_bridgeObjectRelease();
  objc_msgSend(v3, sel_setText_, v10);

  v11 = objc_msgSend(v0, sel_view);
  if (!v11)
    goto LABEL_10;
  v12 = v11;
  objc_msgSend(v11, sel_addSubview_, v3);

  objc_msgSend(v3, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  v13 = objc_msgSend(v3, sel_topAnchor);
  v14 = objc_msgSend(v0, sel_view);
  if (!v14)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  v15 = v14;
  v16 = objc_msgSend(v14, sel_safeAreaLayoutGuide);

  v17 = objc_msgSend(v16, sel_topAnchor);
  v18 = objc_msgSend(v13, sel_constraintEqualToAnchor_constant_, v17, 10.0);

  objc_msgSend(v18, sel_setActive_, 1);
  v19 = objc_msgSend(v3, sel_leadingAnchor);
  v20 = objc_msgSend(v0, sel_view);
  if (!v20)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  v21 = v20;
  v22 = objc_msgSend(v20, sel_leadingAnchor);

  v23 = objc_msgSend(v19, sel_constraintEqualToAnchor_constant_, v22, 20.0);
  objc_msgSend(v23, sel_setActive_, 1);

  v24 = objc_msgSend(v3, sel_trailingAnchor);
  v25 = objc_msgSend(v0, sel_view);
  if (v25)
  {
    v26 = v25;
    v27 = objc_msgSend(v25, sel_trailingAnchor);

    v28 = objc_msgSend(v24, sel_constraintEqualToAnchor_constant_, v27, -20.0);
    objc_msgSend(v28, sel_setActive_, 1);

    return;
  }
LABEL_13:
  __break(1u);
}

void sub_213FF5558()
{
  char *v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;

  v1 = *(void **)&v0[OBJC_IVAR____TtC9CoreIDVUI41BiometricBindingReplacementViewController_textLabel];
  objc_msgSend(v1, sel_setNumberOfLines_, 0);
  v2 = objc_msgSend((id)objc_opt_self(), sel_labelColor);
  objc_msgSend(v1, sel_setTextColor_, v2);

  objc_msgSend(v1, sel_setTextAlignment_, 1);
  objc_msgSend(v1, sel_setAdjustsFontForContentSizeCategory_, 1);
  v3 = objc_msgSend((id)objc_opt_self(), sel_preferredFontForTextStyle_, *MEMORY[0x24BEBE1D0]);
  objc_msgSend(v1, sel_setFont_, v3);

  v4 = objc_msgSend(v0, sel_view);
  if (!v4)
  {
    __break(1u);
    goto LABEL_6;
  }
  v5 = v4;
  objc_msgSend(v4, sel_addSubview_, v1);

  objc_msgSend(v1, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  v6 = objc_msgSend(v1, sel_topAnchor);
  v7 = objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC9CoreIDVUI41BiometricBindingReplacementViewController_titleLabel], sel_bottomAnchor);
  v8 = objc_msgSend(v6, sel_constraintEqualToAnchor_constant_, v7, 20.0);

  objc_msgSend(v8, sel_setActive_, 1);
  v9 = objc_msgSend(v1, sel_leadingAnchor);
  v10 = objc_msgSend(v0, sel_view);
  if (!v10)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  v11 = v10;
  v12 = objc_msgSend(v10, sel_leadingAnchor);

  v13 = objc_msgSend(v9, sel_constraintEqualToAnchor_constant_, v12, 20.0);
  objc_msgSend(v13, sel_setActive_, 1);

  v14 = objc_msgSend(v1, sel_trailingAnchor);
  v15 = objc_msgSend(v0, sel_view);
  if (v15)
  {
    v16 = v15;
    v17 = objc_msgSend(v15, sel_trailingAnchor);

    v18 = objc_msgSend(v14, sel_constraintEqualToAnchor_constant_, v17, -20.0);
    objc_msgSend(v18, sel_setActive_, 1);

    return;
  }
LABEL_7:
  __break(1u);
}

id sub_213FF584C()
{
  char *v0;
  void *v1;
  void *v2;
  id v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id result;
  void *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  id v29;

  v1 = *(void **)&v0[OBJC_IVAR____TtC9CoreIDVUI41BiometricBindingReplacementViewController_primaryButton];
  v2 = (void *)objc_opt_self();
  v3 = objc_msgSend(v2, sel_systemBlueColor);
  objc_msgSend(v1, sel_setBackgroundColor_, v3);

  objc_msgSend(v1, sel_addTarget_action_forControlEvents_, v0, sel_performBinding, 64);
  v4 = objc_msgSend(v1, sel_layer);
  objc_msgSend(v4, sel_setCornerRadius_, 10.0);

  v5 = objc_msgSend(v2, sel_whiteColor);
  objc_msgSend(v1, sel_setTintColor_, v5);

  objc_msgSend(v1, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  v6 = objc_msgSend(v1, sel_titleLabel);
  if (v6)
  {
    v7 = v6;
    v8 = objc_msgSend((id)objc_opt_self(), sel_preferredFontForTextStyle_, *MEMORY[0x24BEBE200]);
    objc_msgSend(v7, sel_setFont_, v8);

  }
  v9 = objc_msgSend(v1, sel_titleLabel);
  if (v9)
  {
    v10 = v9;
    objc_msgSend(v9, sel_setAdjustsFontSizeToFitWidth_, 1);

  }
  v11 = objc_msgSend(v1, sel_titleLabel);
  if (v11)
  {
    v12 = v11;
    objc_msgSend(v11, sel_setAdjustsFontForContentSizeCategory_, 1);

  }
  result = objc_msgSend(v0, sel_view);
  if (!result)
  {
    __break(1u);
    goto LABEL_13;
  }
  v14 = result;
  objc_msgSend(result, sel_addSubview_, v1);

  v15 = objc_msgSend(v1, sel_bottomAnchor);
  result = objc_msgSend(v0, sel_view);
  if (!result)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  v16 = result;
  v17 = objc_msgSend(result, sel_safeAreaLayoutGuide);

  v18 = objc_msgSend(v17, sel_bottomAnchor);
  v19 = objc_msgSend(v15, sel_constraintEqualToAnchor_constant_, v18, -40.0);

  objc_msgSend(v19, sel_setActive_, 1);
  v20 = objc_msgSend(v1, sel_leadingAnchor);
  result = objc_msgSend(v0, sel_view);
  if (!result)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v21 = result;
  v22 = objc_msgSend(result, sel_leadingAnchor);

  v23 = objc_msgSend(v20, sel_constraintEqualToAnchor_constant_, v22, 20.0);
  objc_msgSend(v23, sel_setActive_, 1);

  v24 = objc_msgSend(v1, sel_trailingAnchor);
  result = objc_msgSend(v0, sel_view);
  if (result)
  {
    v25 = result;
    v26 = objc_msgSend(result, sel_trailingAnchor);

    v27 = objc_msgSend(v24, sel_constraintEqualToAnchor_constant_, v26, -20.0);
    objc_msgSend(v27, sel_setActive_, 1);

    v28 = objc_msgSend(v1, sel_heightAnchor);
    v29 = objc_msgSend(v28, sel_constraintEqualToConstant_, 50.0);

    objc_msgSend(v29, sel_setActive_, 1);
    objc_msgSend(v1, sel_setEnabled_, 1);
    return objc_msgSend(v1, sel_setHidden_, 1);
  }
LABEL_15:
  __break(1u);
  return result;
}

uint64_t sub_213FF5CB8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  __int128 v5;
  uint64_t v6;
  _QWORD v7[3];
  uint64_t v8;
  uint64_t v9;

  v1 = v0 + OBJC_IVAR____TtC9CoreIDVUI41BiometricBindingReplacementViewController_delegate;
  swift_beginAccess();
  sub_213F64110(v1, (uint64_t)&v5);
  if (!v6)
    return sub_213F4CF1C((uint64_t)&v5, &qword_254D5D1B0);
  sub_213F4CD48(&v5, (uint64_t)v7);
  v2 = v8;
  v3 = v9;
  __swift_project_boxed_opaque_existential_1(v7, v8);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v3 + 16))(v0, 0, v2, v3);
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v7);
}

void sub_213FF5D90()
{
  char *v0;
  id v1;
  id v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDB00]), sel_init);
  objc_msgSend(v0, sel_setView_, v1);

  sub_213FF50A4();
  sub_213FF5558();
  sub_213FF584C();
  v2 = objc_msgSend(v0, sel_navigationItem);
  v3 = sub_213FF5020();
  objc_msgSend(v2, sel_setLeftBarButtonItem_, v3);

  v4 = objc_msgSend(v0, sel_view);
  if (v4)
  {
    v5 = v4;
    v6 = (void *)objc_opt_self();
    v7 = objc_msgSend(v6, sel_systemBackgroundColor);
    objc_msgSend(v5, sel_setBackgroundColor_, v7);

    v8 = sub_213FF77A8();
    if (v8 == sub_213FF77A8())
    {
      objc_msgSend(v0, sel_setOverrideUserInterfaceStyle_, 2);
      v9 = *(void **)&v0[OBJC_IVAR____TtC9CoreIDVUI41BiometricBindingReplacementViewController_primaryButton];
      v10 = objc_msgSend(v6, sel_systemGray5Color);
      objc_msgSend(v9, sel_setBackgroundColor_, v10);

      v11 = sub_213FF5020();
      v12 = objc_msgSend(v6, sel_systemOrangeColor);
      objc_msgSend(v11, sel_setTintColor_, v12);

    }
    v13 = sub_213FF5020();
    objc_msgSend(v13, sel_setEnabled_, 1);

  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_213FF5FAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4[18] = a4;
  v5 = sub_213FF8810();
  v4[19] = v5;
  v4[20] = *(_QWORD *)(v5 - 8);
  v4[21] = swift_task_alloc();
  v6 = sub_213FF881C();
  v4[22] = v6;
  v4[23] = *(_QWORD *)(v6 - 8);
  v4[24] = swift_task_alloc();
  sub_213FF9554();
  v4[25] = sub_213FF9548();
  v4[26] = sub_213FF9524();
  v4[27] = v7;
  return swift_task_switch();
}

uint64_t sub_213FF6068()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 224) = v1;
  *v1 = v0;
  v1[1] = sub_213FF60BC;
  return sub_213F407AC();
}

uint64_t sub_213FF60BC(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;

  v3 = (_QWORD *)*v2;
  v3[15] = v2;
  v3[16] = a1;
  v3[17] = a2;
  v3[29] = a2;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_213FF6114()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;

  v1 = *(_QWORD *)(v0 + 232);
  swift_release();
  if (v1 >> 60 == 15)
  {
    v2 = *(_QWORD *)(v0 + 144);
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 160) + 104))(*(_QWORD *)(v0 + 168), *MEMORY[0x24BE1DD60], *(_QWORD *)(v0 + 152));
    sub_213F7DA10(MEMORY[0x24BEE4AF8]);
    sub_213FF8828();
    v3 = v2 + OBJC_IVAR____TtC9CoreIDVUI41BiometricBindingReplacementViewController_delegate;
    swift_beginAccess();
    sub_213F64110(v3, v0 + 16);
    v5 = *(_QWORD *)(v0 + 184);
    v4 = *(_QWORD *)(v0 + 192);
    v6 = *(_QWORD *)(v0 + 176);
    if (*(_QWORD *)(v0 + 40))
    {
      v7 = *(_QWORD *)(v0 + 144);
      sub_213F5F2B8(v0 + 16, v0 + 56);
      sub_213F4CF1C(v0 + 16, &qword_254D5D1B0);
      v8 = *(_QWORD *)(v0 + 80);
      v9 = *(_QWORD *)(v0 + 88);
      __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 56), v8);
      sub_213F3B3C0((unint64_t *)&qword_254D5C040, (uint64_t (*)(uint64_t))MEMORY[0x24BE1DE60], MEMORY[0x24BE1DE78]);
      v10 = (void *)swift_allocError();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v11, v4, v6);
      (*(void (**)(uint64_t, _QWORD, unint64_t, void *, uint64_t, uint64_t))(v9 + 8))(v7, 0, 0xF000000000000000, v10, v8, v9);

      (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
      __swift_destroy_boxed_opaque_existential_0(v0 + 56);
    }
    else
    {
      (*(void (**)(_QWORD, _QWORD))(v5 + 8))(*(_QWORD *)(v0 + 192), *(_QWORD *)(v0 + 176));
      sub_213F4CF1C(v0 + 16, &qword_254D5D1B0);
    }
  }
  else
  {
    v12 = *(_QWORD *)(v0 + 232);
    v13 = *(_QWORD *)(v0 + 128);
    v14 = *(void **)(*(_QWORD *)(v0 + 144)
                   + OBJC_IVAR____TtC9CoreIDVUI41BiometricBindingReplacementViewController_context);
    v15 = swift_allocObject();
    swift_unknownObjectWeakInit();
    sub_213F446F8(v14, v13, v12, 0, 0, 0, 0, v15);
    swift_release();
    sub_213F4CF08(v13, v12);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_213FF63BC(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _QWORD *v11;
  _QWORD *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, unint64_t);
  int v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(_QWORD *, _QWORD, unint64_t, void *, uint64_t, uint64_t);
  _QWORD *v24;
  id v25;
  _QWORD v26[3];
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[5];

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_254D5C398);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  v11 = (_QWORD *)MEMORY[0x2199C81F8](a4 + 16);
  if (!v11)
    return;
  v12 = v11;
  if (a2 >> 60 != 15)
  {
    v16 = *(void (**)(uint64_t, unint64_t))((*MEMORY[0x24BEE4EA0] & *v11) + 0x140);
    sub_213F4527C(a1, a2);
    v16(a1, a2);
    sub_213F4CF08(a1, a2);
    goto LABEL_7;
  }
  if (!a3)
  {
LABEL_7:

    return;
  }
  v13 = (void *)sub_213FF7490();
  v29[0] = v13;
  sub_213FD77BC();
  sub_213F3B3C0(&qword_254D610E8, (uint64_t (*)(uint64_t))sub_213FD77BC, MEMORY[0x24BDD01A8]);
  sub_213FF995C();
  v14 = sub_213FF8810();
  v15 = *(_QWORD *)(v14 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v10, 1, v14) == 1)
  {
    sub_213F4CF1C((uint64_t)v10, &qword_254D5C398);
  }
  else
  {
    v17 = (*(uint64_t (**)(char *, uint64_t))(v15 + 88))(v10, v14);
    v18 = *MEMORY[0x24BE1DC68];
    v19 = (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v10, v14);
    if (v17 == v18)
    {
      (*(void (**)(uint64_t))((*MEMORY[0x24BEE4EA0] & *v12) + 0x148))(v19);

      return;
    }
  }
  v20 = (uint64_t)v12 + OBJC_IVAR____TtC9CoreIDVUI41BiometricBindingReplacementViewController_delegate;
  swift_beginAccess();
  sub_213F64110(v20, (uint64_t)v29);
  if (v29[3])
  {
    sub_213F5F2B8((uint64_t)v29, (uint64_t)v26);
    sub_213F4CF1C((uint64_t)v29, &qword_254D5D1B0);
    v21 = v27;
    v22 = v28;
    __swift_project_boxed_opaque_existential_1(v26, v27);
    v23 = *(void (**)(_QWORD *, _QWORD, unint64_t, void *, uint64_t, uint64_t))(v22 + 8);
    v24 = v12;
    v25 = v13;
    v23(v12, 0, 0xF000000000000000, v13, v21, v22);

    __swift_destroy_boxed_opaque_existential_0((uint64_t)v26);
  }
  else
  {

    sub_213F4CF1C((uint64_t)v29, &qword_254D5D1B0);
  }
}

uint64_t sub_213FF6758(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t (__cdecl *v7)();

  v4[2] = a4;
  v4[3] = sub_213FF9554();
  v4[4] = sub_213FF9548();
  v7 = (uint64_t (__cdecl *)())((char *)&dword_254D5C010 + dword_254D5C010);
  v5 = (_QWORD *)swift_task_alloc();
  v4[5] = v5;
  *v5 = v4;
  v5[1] = sub_213FF67CC;
  return v7();
}

uint64_t sub_213FF67CC()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 48) = v0;
  swift_task_dealloc();
  sub_213FF9524();
  return swift_task_switch();
}

uint64_t sub_213FF6854()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1 = *(_QWORD **)(v0 + 16);
  v2 = swift_release();
  (*(void (**)(uint64_t))((*MEMORY[0x24BEE4EA0] & *v1) + 0x150))(v2);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_213FF68A4()
{
  uint64_t v0;
  void *v1;
  _QWORD *v2;
  void (*v3)(void *);
  id v4;

  v1 = *(void **)(v0 + 48);
  v2 = *(_QWORD **)(v0 + 16);
  swift_release();
  v3 = *(void (**)(void *))((*MEMORY[0x24BEE4EA0] & *v2) + 0x138);
  v4 = v1;
  v3(v1);

  return (*(uint64_t (**)(void))(v0 + 8))();
}

id sub_213FF6980()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BiometricBindingReplacementViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for BiometricBindingReplacementViewController()
{
  return objc_opt_self();
}

uint64_t sub_213FF6A88()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

id sub_213FF6AAC(uint64_t a1, uint64_t a2)
{
  char *v2;
  uint64_t v5;
  id v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  objc_super v13;

  v5 = OBJC_IVAR____TtC9CoreIDVUI41BiometricBindingReplacementViewController_titleLabel;
  v6 = objc_allocWithZone(MEMORY[0x24BEBD708]);
  v7 = v2;
  *(_QWORD *)&v2[v5] = objc_msgSend(v6, sel_init);
  v8 = OBJC_IVAR____TtC9CoreIDVUI41BiometricBindingReplacementViewController_textLabel;
  *(_QWORD *)&v7[v8] = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD708]), sel_init);
  v9 = OBJC_IVAR____TtC9CoreIDVUI41BiometricBindingReplacementViewController_primaryButton;
  *(_QWORD *)&v7[v9] = objc_msgSend((id)objc_opt_self(), sel_buttonWithType_, 1);
  v10 = OBJC_IVAR____TtC9CoreIDVUI41BiometricBindingReplacementViewController_context;
  *(_QWORD *)&v7[v10] = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDDA938]), sel_init);
  v11 = &v7[OBJC_IVAR____TtC9CoreIDVUI41BiometricBindingReplacementViewController_delegate];
  *((_QWORD *)v11 + 4) = 0;
  *(_OWORD *)v11 = 0u;
  *((_OWORD *)v11 + 1) = 0u;
  *(_QWORD *)&v7[OBJC_IVAR____TtC9CoreIDVUI41BiometricBindingReplacementViewController____lazy_storage___cancelButton] = 0;
  *(_QWORD *)&v7[OBJC_IVAR____TtC9CoreIDVUI41BiometricBindingReplacementViewController____lazy_storage___activityIndicator] = 0;
  *(_QWORD *)&v7[OBJC_IVAR____TtC9CoreIDVUI41BiometricBindingReplacementViewController____lazy_storage___activityIndicatorBarButtonItem] = 0;
  *(_QWORD *)&v7[OBJC_IVAR____TtC9CoreIDVUI41BiometricBindingReplacementViewController_target] = a1;
  *(_QWORD *)&v7[OBJC_IVAR____TtC9CoreIDVUI41BiometricBindingReplacementViewController_biometricBindingController] = a2;
  swift_retain();

  v13.receiver = v7;
  v13.super_class = (Class)type metadata accessor for BiometricBindingReplacementViewController();
  return objc_msgSendSuper2(&v13, sel_initWithNibName_bundle_, 0, 0);
}

void sub_213FF6C0C()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;

  v1 = OBJC_IVAR____TtC9CoreIDVUI41BiometricBindingReplacementViewController_titleLabel;
  *(_QWORD *)&v0[v1] = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD708]), sel_init);
  v2 = OBJC_IVAR____TtC9CoreIDVUI41BiometricBindingReplacementViewController_textLabel;
  *(_QWORD *)&v0[v2] = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD708]), sel_init);
  v3 = OBJC_IVAR____TtC9CoreIDVUI41BiometricBindingReplacementViewController_primaryButton;
  *(_QWORD *)&v0[v3] = objc_msgSend((id)objc_opt_self(), sel_buttonWithType_, 1);
  v4 = OBJC_IVAR____TtC9CoreIDVUI41BiometricBindingReplacementViewController_context;
  *(_QWORD *)&v0[v4] = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDDA938]), sel_init);
  v5 = &v0[OBJC_IVAR____TtC9CoreIDVUI41BiometricBindingReplacementViewController_delegate];
  *((_QWORD *)v5 + 4) = 0;
  *(_OWORD *)v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *(_QWORD *)&v0[OBJC_IVAR____TtC9CoreIDVUI41BiometricBindingReplacementViewController____lazy_storage___cancelButton] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC9CoreIDVUI41BiometricBindingReplacementViewController____lazy_storage___activityIndicator] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC9CoreIDVUI41BiometricBindingReplacementViewController____lazy_storage___activityIndicatorBarButtonItem] = 0;

  sub_213FF9878();
  __break(1u);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self();
}

id sub_213FF6D5C()
{
  uint64_t ObjCClassFromMetadata;
  id result;

  type metadata accessor for ResourceBundleClass();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  result = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  qword_254D610F0 = (uint64_t)result;
  return result;
}

uint64_t sub_213FF6DB0()
{
  uint64_t v0;
  id v1;

  v0 = sub_213FF8CF0();
  __swift_allocate_value_buffer(v0, qword_254D63050);
  __swift_project_value_buffer(v0, (uint64_t)qword_254D63050);
  if (qword_254D5BAC8 != -1)
    swift_once();
  v1 = (id)qword_254D610F0;
  return sub_213FF8CE4();
}

uint64_t sub_213FF6E4C()
{
  uint64_t v0;
  id v1;

  v0 = sub_213FF8D08();
  __swift_allocate_value_buffer(v0, qword_254D63068);
  __swift_project_value_buffer(v0, (uint64_t)qword_254D63068);
  if (qword_254D5BAC8 != -1)
    swift_once();
  v1 = (id)qword_254D610F0;
  return sub_213FF8CE4();
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

uint64_t sub_213FF6F28()
{
  uint64_t v0;
  id v1;

  v0 = sub_213FF8D08();
  __swift_allocate_value_buffer(v0, qword_254D63080);
  __swift_project_value_buffer(v0, (uint64_t)qword_254D63080);
  if (qword_254D5BAC8 != -1)
    swift_once();
  v1 = (id)qword_254D610F0;
  return sub_213FF8CE4();
}

uint64_t sub_213FF6FC4()
{
  uint64_t v0;
  id v1;

  v0 = sub_213FF8D08();
  __swift_allocate_value_buffer(v0, qword_254D63098);
  __swift_project_value_buffer(v0, (uint64_t)qword_254D63098);
  if (qword_254D5BAC8 != -1)
    swift_once();
  v1 = (id)qword_254D610F0;
  return sub_213FF8CE4();
}

uint64_t sub_213FF7060()
{
  uint64_t v0;
  id v1;

  v0 = sub_213FF8D08();
  __swift_allocate_value_buffer(v0, qword_254D630B0);
  __swift_project_value_buffer(v0, (uint64_t)qword_254D630B0);
  if (qword_254D5BAC8 != -1)
    swift_once();
  v1 = (id)qword_254D610F0;
  return sub_213FF8CE4();
}

uint64_t sub_213FF70FC()
{
  uint64_t v0;
  id v1;

  v0 = sub_213FF8D08();
  __swift_allocate_value_buffer(v0, qword_254D630C8);
  __swift_project_value_buffer(v0, (uint64_t)qword_254D630C8);
  if (qword_254D5BAC8 != -1)
    swift_once();
  v1 = (id)qword_254D610F0;
  return sub_213FF8CE4();
}

uint64_t sub_213FF71A0()
{
  uint64_t v0;
  id v1;

  v0 = sub_213FF8D08();
  __swift_allocate_value_buffer(v0, qword_254D630E0);
  __swift_project_value_buffer(v0, (uint64_t)qword_254D630E0);
  if (qword_254D5BAC8 != -1)
    swift_once();
  v1 = (id)qword_254D610F0;
  return sub_213FF8CE4();
}

uint64_t __getPKIdentityHeroViewControllerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getPKIdentityHeroViewConfigurationClass_block_invoke_cold_1(v0);
}

uint64_t __getPKIdentityHeroViewConfigurationClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[PassWrapper getPassImageWithSize:].cold.1(v0);
}

void __getPKPassViewClass_block_invoke_cold_1()
{
  abort_report_np();
  sub_213FF73DC();
}

uint64_t sub_213FF73DC()
{
  return MEMORY[0x24BDCB220]();
}

uint64_t sub_213FF73E8()
{
  return MEMORY[0x24BDCB260]();
}

uint64_t sub_213FF73F4()
{
  return MEMORY[0x24BDCB268]();
}

uint64_t sub_213FF7400()
{
  return MEMORY[0x24BDCB3B8]();
}

uint64_t sub_213FF740C()
{
  return MEMORY[0x24BDCB400]();
}

uint64_t sub_213FF7418()
{
  return MEMORY[0x24BDCB410]();
}

uint64_t sub_213FF7424()
{
  return MEMORY[0x24BDCB6C0]();
}

uint64_t sub_213FF7430()
{
  return MEMORY[0x24BDCB750]();
}

uint64_t sub_213FF743C()
{
  return MEMORY[0x24BDCC930]();
}

uint64_t sub_213FF7448()
{
  return MEMORY[0x24BDCD280]();
}

uint64_t sub_213FF7454()
{
  return MEMORY[0x24BDCD288]();
}

uint64_t sub_213FF7460()
{
  return MEMORY[0x24BDCD290]();
}

uint64_t sub_213FF746C()
{
  return MEMORY[0x24BDCD298]();
}

uint64_t sub_213FF7478()
{
  return MEMORY[0x24BDCD2A8]();
}

uint64_t sub_213FF7484()
{
  return MEMORY[0x24BDCD2B8]();
}

uint64_t sub_213FF7490()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_213FF749C()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_213FF74A8()
{
  return MEMORY[0x24BE1C9C8]();
}

uint64_t sub_213FF74B4()
{
  return MEMORY[0x24BE1C9D0]();
}

uint64_t sub_213FF74C0()
{
  return MEMORY[0x24BDCD820]();
}

uint64_t sub_213FF74CC()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_213FF74D8()
{
  return MEMORY[0x24BDCDA68]();
}

uint64_t sub_213FF74E4()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_213FF74F0()
{
  return MEMORY[0x24BE1C9D8]();
}

uint64_t sub_213FF74FC()
{
  return MEMORY[0x24BDCDC08]();
}

uint64_t sub_213FF7508()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_213FF7514()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_213FF7520()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_213FF752C()
{
  return MEMORY[0x24BDCED58]();
}

uint64_t sub_213FF7538()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_213FF7544()
{
  return MEMORY[0x24BDCF638]();
}

uint64_t sub_213FF7550()
{
  return MEMORY[0x24BDCF650]();
}

uint64_t sub_213FF755C()
{
  return MEMORY[0x24BEBBE88]();
}

uint64_t sub_213FF7568()
{
  return MEMORY[0x24BEBBEB8]();
}

uint64_t sub_213FF7574()
{
  return MEMORY[0x24BDCF678]();
}

uint64_t sub_213FF7580()
{
  return MEMORY[0x24BEE5C38]();
}

uint64_t sub_213FF758C()
{
  return MEMORY[0x24BEE5C40]();
}

uint64_t sub_213FF7598()
{
  return MEMORY[0x24BEE5C48]();
}

uint64_t sub_213FF75A4()
{
  return MEMORY[0x24BEE5C50]();
}

uint64_t sub_213FF75B0()
{
  return MEMORY[0x24BEE5C58]();
}

uint64_t sub_213FF75BC()
{
  return MEMORY[0x24BEE5C60]();
}

uint64_t sub_213FF75C8()
{
  return MEMORY[0x24BE1C9F0]();
}

uint64_t sub_213FF75D4()
{
  return MEMORY[0x24BE1CA38]();
}

uint64_t sub_213FF75E0()
{
  return MEMORY[0x24BE1CA40]();
}

uint64_t sub_213FF75EC()
{
  return MEMORY[0x24BE1CA60]();
}

uint64_t sub_213FF75F8()
{
  return MEMORY[0x24BE1CA68]();
}

uint64_t sub_213FF7604()
{
  return MEMORY[0x24BE1CA70]();
}

uint64_t sub_213FF7610()
{
  return MEMORY[0x24BE1CA78]();
}

uint64_t sub_213FF761C()
{
  return MEMORY[0x24BE1CA80]();
}

uint64_t sub_213FF7628()
{
  return MEMORY[0x24BE1CA88]();
}

uint64_t sub_213FF7634()
{
  return MEMORY[0x24BE1CA90]();
}

uint64_t sub_213FF7640()
{
  return MEMORY[0x24BE1CAD0]();
}

uint64_t sub_213FF764C()
{
  return MEMORY[0x24BE1CAE0]();
}

uint64_t sub_213FF7658()
{
  return MEMORY[0x24BE1CAF8]();
}

uint64_t sub_213FF7664()
{
  return MEMORY[0x24BE1CB00]();
}

uint64_t sub_213FF7670()
{
  return MEMORY[0x24BE1CB08]();
}

uint64_t sub_213FF767C()
{
  return MEMORY[0x24BE1CB10]();
}

uint64_t sub_213FF7688()
{
  return MEMORY[0x24BE1CB18]();
}

uint64_t sub_213FF7694()
{
  return MEMORY[0x24BE1CB40]();
}

uint64_t sub_213FF76A0()
{
  return MEMORY[0x24BE1CB50]();
}

uint64_t sub_213FF76AC()
{
  return MEMORY[0x24BE1CB58]();
}

uint64_t sub_213FF76B8()
{
  return MEMORY[0x24BE1CB60]();
}

uint64_t sub_213FF76C4()
{
  return MEMORY[0x24BE1CB78]();
}

uint64_t sub_213FF76D0()
{
  return MEMORY[0x24BE1CB98]();
}

uint64_t sub_213FF76DC()
{
  return MEMORY[0x24BE1CBA0]();
}

uint64_t sub_213FF76E8()
{
  return MEMORY[0x24BE1CBA8]();
}

uint64_t sub_213FF76F4()
{
  return MEMORY[0x24BE1CBB0]();
}

uint64_t sub_213FF7700()
{
  return MEMORY[0x24BE1CBB8]();
}

uint64_t sub_213FF770C()
{
  return MEMORY[0x24BE1CBC8]();
}

uint64_t sub_213FF7718()
{
  return MEMORY[0x24BE1CBD0]();
}

uint64_t sub_213FF7724()
{
  return MEMORY[0x24BE1CBD8]();
}

uint64_t sub_213FF7730()
{
  return MEMORY[0x24BE1CBE0]();
}

uint64_t sub_213FF773C()
{
  return MEMORY[0x24BE1CBE8]();
}

uint64_t sub_213FF7748()
{
  return MEMORY[0x24BE1CBF0]();
}

uint64_t sub_213FF7754()
{
  return MEMORY[0x24BE1CBF8]();
}

uint64_t sub_213FF7760()
{
  return MEMORY[0x24BE1CC00]();
}

uint64_t sub_213FF776C()
{
  return MEMORY[0x24BE1CC30]();
}

uint64_t sub_213FF7778()
{
  return MEMORY[0x24BE1CC38]();
}

uint64_t sub_213FF7784()
{
  return MEMORY[0x24BE1CC40]();
}

uint64_t sub_213FF7790()
{
  return MEMORY[0x24BE1CC48]();
}

uint64_t sub_213FF779C()
{
  return MEMORY[0x24BE1CC50]();
}

uint64_t sub_213FF77A8()
{
  return MEMORY[0x24BE1CC58]();
}

uint64_t sub_213FF77B4()
{
  return MEMORY[0x24BE1CC68]();
}

uint64_t sub_213FF77C0()
{
  return MEMORY[0x24BE1CC70]();
}

uint64_t sub_213FF77CC()
{
  return MEMORY[0x24BE1CC78]();
}

uint64_t sub_213FF77D8()
{
  return MEMORY[0x24BE1CC80]();
}

uint64_t sub_213FF77E4()
{
  return MEMORY[0x24BE1CC90]();
}

uint64_t sub_213FF77F0()
{
  return MEMORY[0x24BE1CC98]();
}

uint64_t sub_213FF77FC()
{
  return MEMORY[0x24BE1CCA0]();
}

uint64_t sub_213FF7808()
{
  return MEMORY[0x24BE1CCA8]();
}

uint64_t sub_213FF7814()
{
  return MEMORY[0x24BE1CCB0]();
}

uint64_t sub_213FF7820()
{
  return MEMORY[0x24BE1CCB8]();
}

uint64_t sub_213FF782C()
{
  return MEMORY[0x24BE1CCE8]();
}

uint64_t sub_213FF7838()
{
  return MEMORY[0x24BE1CCF0]();
}

uint64_t sub_213FF7844()
{
  return MEMORY[0x24BE1CCF8]();
}

uint64_t sub_213FF7850()
{
  return MEMORY[0x24BE1CD00]();
}

uint64_t sub_213FF785C()
{
  return MEMORY[0x24BE1CD08]();
}

uint64_t sub_213FF7868()
{
  return MEMORY[0x24BE1CD18]();
}

uint64_t sub_213FF7874()
{
  return MEMORY[0x24BE1CD20]();
}

uint64_t sub_213FF7880()
{
  return MEMORY[0x24BE1CD28]();
}

uint64_t sub_213FF788C()
{
  return MEMORY[0x24BE1CD30]();
}

uint64_t sub_213FF7898()
{
  return MEMORY[0x24BE1CD38]();
}

uint64_t sub_213FF78A4()
{
  return MEMORY[0x24BE1CD48]();
}

uint64_t sub_213FF78B0()
{
  return MEMORY[0x24BE1CD50]();
}

uint64_t sub_213FF78BC()
{
  return MEMORY[0x24BE1CD58]();
}

uint64_t sub_213FF78C8()
{
  return MEMORY[0x24BE1CD60]();
}

uint64_t sub_213FF78D4()
{
  return MEMORY[0x24BE1CD68]();
}

uint64_t sub_213FF78E0()
{
  return MEMORY[0x24BE1CD70]();
}

uint64_t sub_213FF78EC()
{
  return MEMORY[0x24BE1CD78]();
}

uint64_t sub_213FF78F8()
{
  return MEMORY[0x24BE1CD88]();
}

uint64_t sub_213FF7904()
{
  return MEMORY[0x24BE1CD90]();
}

uint64_t sub_213FF7910()
{
  return MEMORY[0x24BE1CD98]();
}

uint64_t sub_213FF791C()
{
  return MEMORY[0x24BE1CDA0]();
}

uint64_t sub_213FF7928()
{
  return MEMORY[0x24BE1CDA8]();
}

uint64_t sub_213FF7934()
{
  return MEMORY[0x24BE1CDB0]();
}

uint64_t sub_213FF7940()
{
  return MEMORY[0x24BE1CDB8]();
}

uint64_t sub_213FF794C()
{
  return MEMORY[0x24BE1CDC0]();
}

uint64_t sub_213FF7958()
{
  return MEMORY[0x24BE1CDC8]();
}

uint64_t sub_213FF7964()
{
  return MEMORY[0x24BE1CDD0]();
}

uint64_t sub_213FF7970()
{
  return MEMORY[0x24BE1CDD8]();
}

uint64_t sub_213FF797C()
{
  return MEMORY[0x24BE1CDE0]();
}

uint64_t sub_213FF7988()
{
  return MEMORY[0x24BE1CDE8]();
}

uint64_t sub_213FF7994()
{
  return MEMORY[0x24BE1CDF0]();
}

uint64_t sub_213FF79A0()
{
  return MEMORY[0x24BE1CDF8]();
}

uint64_t sub_213FF79AC()
{
  return MEMORY[0x24BE1CE00]();
}

uint64_t sub_213FF79B8()
{
  return MEMORY[0x24BE1CE08]();
}

uint64_t sub_213FF79C4()
{
  return MEMORY[0x24BE1CE10]();
}

uint64_t sub_213FF79D0()
{
  return MEMORY[0x24BE1CE18]();
}

uint64_t sub_213FF79DC()
{
  return MEMORY[0x24BE1CE20]();
}

uint64_t sub_213FF79E8()
{
  return MEMORY[0x24BE1CE28]();
}

uint64_t sub_213FF79F4()
{
  return MEMORY[0x24BE1CE30]();
}

uint64_t sub_213FF7A00()
{
  return MEMORY[0x24BE1CE38]();
}

uint64_t sub_213FF7A0C()
{
  return MEMORY[0x24BE1CE40]();
}

uint64_t sub_213FF7A18()
{
  return MEMORY[0x24BE1CE48]();
}

uint64_t sub_213FF7A24()
{
  return MEMORY[0x24BE1CE70]();
}

uint64_t sub_213FF7A30()
{
  return MEMORY[0x24BE1CE78]();
}

uint64_t sub_213FF7A3C()
{
  return MEMORY[0x24BE1CE80]();
}

uint64_t sub_213FF7A48()
{
  return MEMORY[0x24BE1CE88]();
}

uint64_t sub_213FF7A54()
{
  return MEMORY[0x24BE1CE90]();
}

uint64_t sub_213FF7A60()
{
  return MEMORY[0x24BE1CE98]();
}

uint64_t sub_213FF7A6C()
{
  return MEMORY[0x24BE1CEA0]();
}

uint64_t sub_213FF7A78()
{
  return MEMORY[0x24BE1CEA8]();
}

uint64_t sub_213FF7A84()
{
  return MEMORY[0x24BE1CEB0]();
}

uint64_t sub_213FF7A90()
{
  return MEMORY[0x24BE1CEB8]();
}

uint64_t sub_213FF7A9C()
{
  return MEMORY[0x24BE1CEC0]();
}

uint64_t sub_213FF7AA8()
{
  return MEMORY[0x24BE1CEC8]();
}

uint64_t sub_213FF7AB4()
{
  return MEMORY[0x24BE1CED0]();
}

uint64_t sub_213FF7AC0()
{
  return MEMORY[0x24BE1CED8]();
}

uint64_t sub_213FF7ACC()
{
  return MEMORY[0x24BE1CEE0]();
}

uint64_t sub_213FF7AD8()
{
  return MEMORY[0x24BE1CEE8]();
}

uint64_t sub_213FF7AE4()
{
  return MEMORY[0x24BE1CEF0]();
}

uint64_t sub_213FF7AF0()
{
  return MEMORY[0x24BE1CEF8]();
}

uint64_t sub_213FF7AFC()
{
  return MEMORY[0x24BE1CF00]();
}

uint64_t sub_213FF7B08()
{
  return MEMORY[0x24BE1CF08]();
}

uint64_t sub_213FF7B14()
{
  return MEMORY[0x24BE1CF10]();
}

uint64_t sub_213FF7B20()
{
  return MEMORY[0x24BE1CF18]();
}

uint64_t sub_213FF7B2C()
{
  return MEMORY[0x24BE1CF20]();
}

uint64_t sub_213FF7B38()
{
  return MEMORY[0x24BE1CF28]();
}

uint64_t sub_213FF7B44()
{
  return MEMORY[0x24BE1CF30]();
}

uint64_t sub_213FF7B50()
{
  return MEMORY[0x24BE1CF38]();
}

uint64_t sub_213FF7B5C()
{
  return MEMORY[0x24BE1CF40]();
}

uint64_t sub_213FF7B68()
{
  return MEMORY[0x24BE1CF48]();
}

uint64_t sub_213FF7B74()
{
  return MEMORY[0x24BE1CF50]();
}

uint64_t sub_213FF7B80()
{
  return MEMORY[0x24BE1CF58]();
}

uint64_t sub_213FF7B8C()
{
  return MEMORY[0x24BE1CF60]();
}

uint64_t sub_213FF7B98()
{
  return MEMORY[0x24BE1CF68]();
}

uint64_t sub_213FF7BA4()
{
  return MEMORY[0x24BE1CF70]();
}

uint64_t sub_213FF7BB0()
{
  return MEMORY[0x24BE1CF78]();
}

uint64_t sub_213FF7BBC()
{
  return MEMORY[0x24BE1CF80]();
}

uint64_t sub_213FF7BC8()
{
  return MEMORY[0x24BE1CF88]();
}

uint64_t sub_213FF7BD4()
{
  return MEMORY[0x24BE1CF90]();
}

uint64_t sub_213FF7BE0()
{
  return MEMORY[0x24BE1CFA0]();
}

uint64_t sub_213FF7BEC()
{
  return MEMORY[0x24BE1CFA8]();
}

uint64_t sub_213FF7BF8()
{
  return MEMORY[0x24BE1CFB0]();
}

uint64_t sub_213FF7C04()
{
  return MEMORY[0x24BE1CFB8]();
}

uint64_t sub_213FF7C10()
{
  return MEMORY[0x24BE1CFC0]();
}

uint64_t sub_213FF7C1C()
{
  return MEMORY[0x24BE1CFC8]();
}

uint64_t sub_213FF7C28()
{
  return MEMORY[0x24BE1CFD0]();
}

uint64_t sub_213FF7C34()
{
  return MEMORY[0x24BE1CFD8]();
}

uint64_t sub_213FF7C40()
{
  return MEMORY[0x24BE1CFE0]();
}

uint64_t sub_213FF7C4C()
{
  return MEMORY[0x24BE1D000]();
}

uint64_t sub_213FF7C58()
{
  return MEMORY[0x24BE1D010]();
}

uint64_t sub_213FF7C64()
{
  return MEMORY[0x24BE1D018]();
}

uint64_t sub_213FF7C70()
{
  return MEMORY[0x24BE1D030]();
}

uint64_t sub_213FF7C7C()
{
  return MEMORY[0x24BE1D048]();
}

uint64_t sub_213FF7C88()
{
  return MEMORY[0x24BE1D050]();
}

uint64_t sub_213FF7C94()
{
  return MEMORY[0x24BE1D058]();
}

uint64_t sub_213FF7CA0()
{
  return MEMORY[0x24BE1D060]();
}

uint64_t sub_213FF7CAC()
{
  return MEMORY[0x24BE1D068]();
}

uint64_t sub_213FF7CB8()
{
  return MEMORY[0x24BE1D070]();
}

uint64_t sub_213FF7CC4()
{
  return MEMORY[0x24BE1D078]();
}

uint64_t sub_213FF7CD0()
{
  return MEMORY[0x24BE1D080]();
}

uint64_t sub_213FF7CDC()
{
  return MEMORY[0x24BE1D098]();
}

uint64_t sub_213FF7CE8()
{
  return MEMORY[0x24BE1D0A0]();
}

uint64_t sub_213FF7CF4()
{
  return MEMORY[0x24BE1D0A8]();
}

uint64_t sub_213FF7D00()
{
  return MEMORY[0x24BE1D0B0]();
}

uint64_t sub_213FF7D0C()
{
  return MEMORY[0x24BE1D0B8]();
}

uint64_t sub_213FF7D18()
{
  return MEMORY[0x24BE1D0C0]();
}

uint64_t sub_213FF7D24()
{
  return MEMORY[0x24BE1D0C8]();
}

uint64_t sub_213FF7D30()
{
  return MEMORY[0x24BE1D0D0]();
}

uint64_t sub_213FF7D3C()
{
  return MEMORY[0x24BE1D0E0]();
}

uint64_t sub_213FF7D48()
{
  return MEMORY[0x24BE1D0E8]();
}

uint64_t sub_213FF7D54()
{
  return MEMORY[0x24BE1D0F0]();
}

uint64_t sub_213FF7D60()
{
  return MEMORY[0x24BE1D0F8]();
}

uint64_t sub_213FF7D6C()
{
  return MEMORY[0x24BE1D100]();
}

uint64_t sub_213FF7D78()
{
  return MEMORY[0x24BE1D108]();
}

uint64_t sub_213FF7D84()
{
  return MEMORY[0x24BE1D110]();
}

uint64_t sub_213FF7D90()
{
  return MEMORY[0x24BE1D118]();
}

uint64_t sub_213FF7D9C()
{
  return MEMORY[0x24BE1D128]();
}

uint64_t sub_213FF7DA8()
{
  return MEMORY[0x24BE1D130]();
}

uint64_t sub_213FF7DB4()
{
  return MEMORY[0x24BE1D140]();
}

uint64_t sub_213FF7DC0()
{
  return MEMORY[0x24BE1D150]();
}

uint64_t sub_213FF7DCC()
{
  return MEMORY[0x24BE1D158]();
}

uint64_t sub_213FF7DD8()
{
  return MEMORY[0x24BE1D160]();
}

uint64_t sub_213FF7DE4()
{
  return MEMORY[0x24BE1D178]();
}

uint64_t sub_213FF7DF0()
{
  return MEMORY[0x24BE1D180]();
}

uint64_t sub_213FF7DFC()
{
  return MEMORY[0x24BE1D188]();
}

uint64_t sub_213FF7E08()
{
  return MEMORY[0x24BE1D190]();
}

uint64_t sub_213FF7E14()
{
  return MEMORY[0x24BE1D198]();
}

uint64_t sub_213FF7E20()
{
  return MEMORY[0x24BE1D1A0]();
}

uint64_t sub_213FF7E2C()
{
  return MEMORY[0x24BE1D1B8]();
}

uint64_t sub_213FF7E38()
{
  return MEMORY[0x24BE1D1C0]();
}

uint64_t sub_213FF7E44()
{
  return MEMORY[0x24BE1D290]();
}

uint64_t sub_213FF7E50()
{
  return MEMORY[0x24BE1D298]();
}

uint64_t sub_213FF7E5C()
{
  return MEMORY[0x24BE1D2A0]();
}

uint64_t sub_213FF7E68()
{
  return MEMORY[0x24BE1D2A8]();
}

uint64_t sub_213FF7E74()
{
  return MEMORY[0x24BE1D2B0]();
}

uint64_t sub_213FF7E80()
{
  return MEMORY[0x24BE1D2B8]();
}

uint64_t sub_213FF7E8C()
{
  return MEMORY[0x24BE1D2C0]();
}

uint64_t sub_213FF7E98()
{
  return MEMORY[0x24BE1D2C8]();
}

uint64_t sub_213FF7EA4()
{
  return MEMORY[0x24BE1D2D0]();
}

uint64_t sub_213FF7EB0()
{
  return MEMORY[0x24BE1D2D8]();
}

uint64_t sub_213FF7EBC()
{
  return MEMORY[0x24BE1D2E0]();
}

uint64_t sub_213FF7EC8()
{
  return MEMORY[0x24BE1D2E8]();
}

uint64_t sub_213FF7ED4()
{
  return MEMORY[0x24BE1D2F0]();
}

uint64_t sub_213FF7EE0()
{
  return MEMORY[0x24BE1D2F8]();
}

uint64_t sub_213FF7EEC()
{
  return MEMORY[0x24BE1D300]();
}

uint64_t sub_213FF7EF8()
{
  return MEMORY[0x24BE1D308]();
}

uint64_t sub_213FF7F04()
{
  return MEMORY[0x24BE1D310]();
}

uint64_t sub_213FF7F10()
{
  return MEMORY[0x24BE1D318]();
}

uint64_t sub_213FF7F1C()
{
  return MEMORY[0x24BE1D320]();
}

uint64_t sub_213FF7F28()
{
  return MEMORY[0x24BE1D330]();
}

uint64_t sub_213FF7F34()
{
  return MEMORY[0x24BE1D338]();
}

uint64_t sub_213FF7F40()
{
  return MEMORY[0x24BE1D340]();
}

uint64_t sub_213FF7F4C()
{
  return MEMORY[0x24BE1D348]();
}

uint64_t sub_213FF7F58()
{
  return MEMORY[0x24BE1D350]();
}

uint64_t sub_213FF7F64()
{
  return MEMORY[0x24BE1D358]();
}

uint64_t sub_213FF7F70()
{
  return MEMORY[0x24BE1D368]();
}

uint64_t sub_213FF7F7C()
{
  return MEMORY[0x24BE1D370]();
}

uint64_t sub_213FF7F88()
{
  return MEMORY[0x24BE1D378]();
}

uint64_t sub_213FF7F94()
{
  return MEMORY[0x24BE1D380]();
}

uint64_t sub_213FF7FA0()
{
  return MEMORY[0x24BE1D388]();
}

uint64_t sub_213FF7FAC()
{
  return MEMORY[0x24BE1D390]();
}

uint64_t sub_213FF7FB8()
{
  return MEMORY[0x24BE1D398]();
}

uint64_t sub_213FF7FC4()
{
  return MEMORY[0x24BE1D3A0]();
}

uint64_t sub_213FF7FD0()
{
  return MEMORY[0x24BE1D3B0]();
}

uint64_t sub_213FF7FDC()
{
  return MEMORY[0x24BE1D3B8]();
}

uint64_t sub_213FF7FE8()
{
  return MEMORY[0x24BE1D3C0]();
}

uint64_t sub_213FF7FF4()
{
  return MEMORY[0x24BE1D3D0]();
}

uint64_t sub_213FF8000()
{
  return MEMORY[0x24BE1D3D8]();
}

uint64_t sub_213FF800C()
{
  return MEMORY[0x24BE1D3E8]();
}

uint64_t sub_213FF8018()
{
  return MEMORY[0x24BE1D3F8]();
}

uint64_t sub_213FF8024()
{
  return MEMORY[0x24BE1D410]();
}

uint64_t sub_213FF8030()
{
  return MEMORY[0x24BE1D440]();
}

uint64_t sub_213FF803C()
{
  return MEMORY[0x24BE1D448]();
}

uint64_t sub_213FF8048()
{
  return MEMORY[0x24BE1D450]();
}

uint64_t sub_213FF8054()
{
  return MEMORY[0x24BE1D458]();
}

uint64_t sub_213FF8060()
{
  return MEMORY[0x24BE1D460]();
}

uint64_t sub_213FF806C()
{
  return MEMORY[0x24BE1D468]();
}

uint64_t sub_213FF8078()
{
  return MEMORY[0x24BE1D470]();
}

uint64_t sub_213FF8084()
{
  return MEMORY[0x24BE1D480]();
}

uint64_t sub_213FF8090()
{
  return MEMORY[0x24BE1D488]();
}

uint64_t sub_213FF809C()
{
  return MEMORY[0x24BE1D490]();
}

uint64_t sub_213FF80A8()
{
  return MEMORY[0x24BE1D498]();
}

uint64_t sub_213FF80B4()
{
  return MEMORY[0x24BE1D4A0]();
}

uint64_t sub_213FF80C0()
{
  return MEMORY[0x24BE1D4A8]();
}

uint64_t sub_213FF80CC()
{
  return MEMORY[0x24BE1D4B0]();
}

uint64_t sub_213FF80D8()
{
  return MEMORY[0x24BE1D4B8]();
}

uint64_t sub_213FF80E4()
{
  return MEMORY[0x24BE1D4C0]();
}

uint64_t sub_213FF80F0()
{
  return MEMORY[0x24BE1D4C8]();
}

uint64_t sub_213FF80FC()
{
  return MEMORY[0x24BE1D4D0]();
}

uint64_t sub_213FF8108()
{
  return MEMORY[0x24BE1D4D8]();
}

uint64_t sub_213FF8114()
{
  return MEMORY[0x24BE1D4E0]();
}

uint64_t sub_213FF8120()
{
  return MEMORY[0x24BE1D4E8]();
}

uint64_t sub_213FF812C()
{
  return MEMORY[0x24BE1D4F0]();
}

uint64_t sub_213FF8138()
{
  return MEMORY[0x24BE1D4F8]();
}

uint64_t sub_213FF8144()
{
  return MEMORY[0x24BE1D500]();
}

uint64_t sub_213FF8150()
{
  return MEMORY[0x24BE1D508]();
}

uint64_t sub_213FF815C()
{
  return MEMORY[0x24BE1D510]();
}

uint64_t sub_213FF8168()
{
  return MEMORY[0x24BE1D518]();
}

uint64_t sub_213FF8174()
{
  return MEMORY[0x24BE1D520]();
}

uint64_t sub_213FF8180()
{
  return MEMORY[0x24BE1D528]();
}

uint64_t sub_213FF818C()
{
  return MEMORY[0x24BE1D530]();
}

uint64_t sub_213FF8198()
{
  return MEMORY[0x24BE1D538]();
}

uint64_t sub_213FF81A4()
{
  return MEMORY[0x24BE1D540]();
}

uint64_t sub_213FF81B0()
{
  return MEMORY[0x24BE1D548]();
}

uint64_t sub_213FF81BC()
{
  return MEMORY[0x24BE1D550]();
}

uint64_t sub_213FF81C8()
{
  return MEMORY[0x24BE1D558]();
}

uint64_t sub_213FF81D4()
{
  return MEMORY[0x24BE1D560]();
}

uint64_t sub_213FF81E0()
{
  return MEMORY[0x24BE1D568]();
}

uint64_t sub_213FF81EC()
{
  return MEMORY[0x24BE1D570]();
}

uint64_t sub_213FF81F8()
{
  return MEMORY[0x24BE1D578]();
}

uint64_t sub_213FF8204()
{
  return MEMORY[0x24BE1D580]();
}

uint64_t sub_213FF8210()
{
  return MEMORY[0x24BE1D588]();
}

uint64_t sub_213FF821C()
{
  return MEMORY[0x24BE1D590]();
}

uint64_t sub_213FF8228()
{
  return MEMORY[0x24BE1D598]();
}

uint64_t sub_213FF8234()
{
  return MEMORY[0x24BE1D5A0]();
}

uint64_t sub_213FF8240()
{
  return MEMORY[0x24BE1D5A8]();
}

uint64_t sub_213FF824C()
{
  return MEMORY[0x24BE1D5B0]();
}

uint64_t sub_213FF8258()
{
  return MEMORY[0x24BE1D5B8]();
}

uint64_t sub_213FF8264()
{
  return MEMORY[0x24BE1D5C0]();
}

uint64_t sub_213FF8270()
{
  return MEMORY[0x24BE1D5C8]();
}

uint64_t sub_213FF827C()
{
  return MEMORY[0x24BE1D5D0]();
}

uint64_t sub_213FF8288()
{
  return MEMORY[0x24BE1D5D8]();
}

uint64_t sub_213FF8294()
{
  return MEMORY[0x24BE1D5E0]();
}

uint64_t sub_213FF82A0()
{
  return MEMORY[0x24BE1D5E8]();
}

uint64_t sub_213FF82AC()
{
  return MEMORY[0x24BE1D5F0]();
}

uint64_t sub_213FF82B8()
{
  return MEMORY[0x24BE1D5F8]();
}

uint64_t sub_213FF82C4()
{
  return MEMORY[0x24BE1D600]();
}

uint64_t sub_213FF82D0()
{
  return MEMORY[0x24BE1D608]();
}

uint64_t sub_213FF82DC()
{
  return MEMORY[0x24BE1D610]();
}

uint64_t sub_213FF82E8()
{
  return MEMORY[0x24BE1D618]();
}

uint64_t sub_213FF82F4()
{
  return MEMORY[0x24BE1D620]();
}

uint64_t sub_213FF8300()
{
  return MEMORY[0x24BE1D628]();
}

uint64_t sub_213FF830C()
{
  return MEMORY[0x24BE1D630]();
}

uint64_t sub_213FF8318()
{
  return MEMORY[0x24BE1D690]();
}

uint64_t sub_213FF8324()
{
  return MEMORY[0x24BE1D698]();
}

uint64_t sub_213FF8330()
{
  return MEMORY[0x24BE1D6A0]();
}

uint64_t sub_213FF833C()
{
  return MEMORY[0x24BE1D6A8]();
}

uint64_t sub_213FF8348()
{
  return MEMORY[0x24BE1D6B8]();
}

uint64_t sub_213FF8354()
{
  return MEMORY[0x24BE1D6C0]();
}

uint64_t sub_213FF8360()
{
  return MEMORY[0x24BE1D6C8]();
}

uint64_t sub_213FF836C()
{
  return MEMORY[0x24BE1D6D0]();
}

uint64_t sub_213FF8378()
{
  return MEMORY[0x24BE1D6D8]();
}

uint64_t sub_213FF8384()
{
  return MEMORY[0x24BE1D6E0]();
}

uint64_t sub_213FF8390()
{
  return MEMORY[0x24BE1D6E8]();
}

uint64_t sub_213FF839C()
{
  return MEMORY[0x24BE1D6F0]();
}

uint64_t sub_213FF83A8()
{
  return MEMORY[0x24BE1D6F8]();
}

uint64_t sub_213FF83B4()
{
  return MEMORY[0x24BE1D700]();
}

uint64_t sub_213FF83C0()
{
  return MEMORY[0x24BE1D710]();
}

uint64_t sub_213FF83CC()
{
  return MEMORY[0x24BE1D718]();
}

uint64_t sub_213FF83D8()
{
  return MEMORY[0x24BE1D728]();
}

uint64_t sub_213FF83E4()
{
  return MEMORY[0x24BE1D730]();
}

uint64_t sub_213FF83F0()
{
  return MEMORY[0x24BE1D738]();
}

uint64_t sub_213FF83FC()
{
  return MEMORY[0x24BE1D748]();
}

uint64_t sub_213FF8408()
{
  return MEMORY[0x24BE1D760]();
}

uint64_t sub_213FF8414()
{
  return MEMORY[0x24BE1D768]();
}

uint64_t sub_213FF8420()
{
  return MEMORY[0x24BE1D778]();
}

uint64_t sub_213FF842C()
{
  return MEMORY[0x24BE1D780]();
}

uint64_t sub_213FF8438()
{
  return MEMORY[0x24BE1D788]();
}

uint64_t sub_213FF8444()
{
  return MEMORY[0x24BE1D790]();
}

uint64_t sub_213FF8450()
{
  return MEMORY[0x24BE1D798]();
}

uint64_t sub_213FF845C()
{
  return MEMORY[0x24BE1D7A0]();
}

uint64_t sub_213FF8468()
{
  return MEMORY[0x24BE1D7B0]();
}

uint64_t sub_213FF8474()
{
  return MEMORY[0x24BE1D7B8]();
}

uint64_t sub_213FF8480()
{
  return MEMORY[0x24BE1D7C0]();
}

uint64_t sub_213FF848C()
{
  return MEMORY[0x24BE1D7C8]();
}

uint64_t sub_213FF8498()
{
  return MEMORY[0x24BE1D7D0]();
}

uint64_t sub_213FF84A4()
{
  return MEMORY[0x24BE1D7D8]();
}

uint64_t sub_213FF84B0()
{
  return MEMORY[0x24BE1D7E0]();
}

uint64_t sub_213FF84BC()
{
  return MEMORY[0x24BE1D7E8]();
}

uint64_t sub_213FF84C8()
{
  return MEMORY[0x24BE1D7F0]();
}

uint64_t sub_213FF84D4()
{
  return MEMORY[0x24BE1D7F8]();
}

uint64_t sub_213FF84E0()
{
  return MEMORY[0x24BE1D800]();
}

uint64_t sub_213FF84EC()
{
  return MEMORY[0x24BE1D808]();
}

uint64_t sub_213FF84F8()
{
  return MEMORY[0x24BE1D810]();
}

uint64_t sub_213FF8504()
{
  return MEMORY[0x24BE1D820]();
}

uint64_t sub_213FF8510()
{
  return MEMORY[0x24BE1D828]();
}

uint64_t sub_213FF851C()
{
  return MEMORY[0x24BE1D830]();
}

uint64_t sub_213FF8528()
{
  return MEMORY[0x24BE1D838]();
}

uint64_t sub_213FF8534()
{
  return MEMORY[0x24BE1D840]();
}

uint64_t sub_213FF8540()
{
  return MEMORY[0x24BE1D850]();
}

uint64_t sub_213FF854C()
{
  return MEMORY[0x24BE1D858]();
}

uint64_t sub_213FF8558()
{
  return MEMORY[0x24BE1D870]();
}

uint64_t sub_213FF8564()
{
  return MEMORY[0x24BE1D878]();
}

uint64_t sub_213FF8570()
{
  return MEMORY[0x24BE1D880]();
}

uint64_t sub_213FF857C()
{
  return MEMORY[0x24BE1D888]();
}

uint64_t sub_213FF8588()
{
  return MEMORY[0x24BE1D890]();
}

uint64_t sub_213FF8594()
{
  return MEMORY[0x24BE1D898]();
}

uint64_t sub_213FF85A0()
{
  return MEMORY[0x24BE1D8A0]();
}

uint64_t sub_213FF85AC()
{
  return MEMORY[0x24BE1D8A8]();
}

uint64_t sub_213FF85B8()
{
  return MEMORY[0x24BE1D8B0]();
}

uint64_t sub_213FF85C4()
{
  return MEMORY[0x24BE1D8B8]();
}

uint64_t sub_213FF85D0()
{
  return MEMORY[0x24BE1D8C0]();
}

uint64_t sub_213FF85DC()
{
  return MEMORY[0x24BE1D8C8]();
}

uint64_t sub_213FF85E8()
{
  return MEMORY[0x24BE1D8D0]();
}

uint64_t sub_213FF85F4()
{
  return MEMORY[0x24BE1D8D8]();
}

uint64_t sub_213FF8600()
{
  return MEMORY[0x24BE1D8E0]();
}

uint64_t sub_213FF860C()
{
  return MEMORY[0x24BE1D8E8]();
}

uint64_t sub_213FF8618()
{
  return MEMORY[0x24BE1D8F0]();
}

uint64_t sub_213FF8624()
{
  return MEMORY[0x24BE1D900]();
}

uint64_t sub_213FF8630()
{
  return MEMORY[0x24BE1D928]();
}

uint64_t sub_213FF863C()
{
  return MEMORY[0x24BE1D930]();
}

uint64_t sub_213FF8648()
{
  return MEMORY[0x24BE1D950]();
}

uint64_t sub_213FF8654()
{
  return MEMORY[0x24BE1D958]();
}

uint64_t sub_213FF8660()
{
  return MEMORY[0x24BE1D960]();
}

uint64_t sub_213FF866C()
{
  return MEMORY[0x24BE1D968]();
}

uint64_t sub_213FF8678()
{
  return MEMORY[0x24BE1D970]();
}

uint64_t sub_213FF8684()
{
  return MEMORY[0x24BE1D978]();
}

uint64_t sub_213FF8690()
{
  return MEMORY[0x24BE1D980]();
}

uint64_t sub_213FF869C()
{
  return MEMORY[0x24BE1D9A8]();
}

uint64_t sub_213FF86A8()
{
  return MEMORY[0x24BE1D9B0]();
}

uint64_t sub_213FF86B4()
{
  return MEMORY[0x24BE1D9B8]();
}

uint64_t sub_213FF86C0()
{
  return MEMORY[0x24BE1D9C8]();
}

uint64_t sub_213FF86CC()
{
  return MEMORY[0x24BE1D9D0]();
}

uint64_t sub_213FF86D8()
{
  return MEMORY[0x24BE1D9D8]();
}

uint64_t sub_213FF86E4()
{
  return MEMORY[0x24BE1D9E8]();
}

uint64_t sub_213FF86F0()
{
  return MEMORY[0x24BE1D9F0]();
}

uint64_t sub_213FF86FC()
{
  return MEMORY[0x24BE1D9F8]();
}

uint64_t sub_213FF8708()
{
  return MEMORY[0x24BE1DA00]();
}

uint64_t sub_213FF8714()
{
  return MEMORY[0x24BE1DA18]();
}

uint64_t sub_213FF8720()
{
  return MEMORY[0x24BE1DA20]();
}

uint64_t sub_213FF872C()
{
  return MEMORY[0x24BE1DA28]();
}

uint64_t sub_213FF8738()
{
  return MEMORY[0x24BE1DA38]();
}

uint64_t sub_213FF8744()
{
  return MEMORY[0x24BE1DA58]();
}

uint64_t sub_213FF8750()
{
  return MEMORY[0x24BE1DA60]();
}

uint64_t sub_213FF875C()
{
  return MEMORY[0x24BE1DA68]();
}

uint64_t sub_213FF8768()
{
  return MEMORY[0x24BE1DA70]();
}

uint64_t sub_213FF8774()
{
  return MEMORY[0x24BE1DA78]();
}

uint64_t sub_213FF8780()
{
  return MEMORY[0x24BE1DA98]();
}

uint64_t sub_213FF878C()
{
  return MEMORY[0x24BE1DB40]();
}

uint64_t sub_213FF8798()
{
  return MEMORY[0x24BE1DB50]();
}

uint64_t sub_213FF87A4()
{
  return MEMORY[0x24BE1DB58]();
}

uint64_t sub_213FF87B0()
{
  return MEMORY[0x24BE1DB60]();
}

uint64_t sub_213FF87BC()
{
  return MEMORY[0x24BE1DBE0]();
}

uint64_t sub_213FF87C8()
{
  return MEMORY[0x24BE1DC00]();
}

uint64_t sub_213FF87D4()
{
  return MEMORY[0x24BE1DC08]();
}

uint64_t sub_213FF87E0()
{
  return MEMORY[0x24BE1DC10]();
}

uint64_t sub_213FF87EC()
{
  return MEMORY[0x24BE1DC18]();
}

uint64_t sub_213FF87F8()
{
  return MEMORY[0x24BE1DC38]();
}

uint64_t sub_213FF8804()
{
  return MEMORY[0x24BE1DE38]();
}

uint64_t sub_213FF8810()
{
  return MEMORY[0x24BE1DE48]();
}

uint64_t sub_213FF881C()
{
  return MEMORY[0x24BE1DE60]();
}

uint64_t sub_213FF8828()
{
  return MEMORY[0x24BE1DE70]();
}

uint64_t sub_213FF8834()
{
  return MEMORY[0x24BE6FB30]();
}

uint64_t sub_213FF8840()
{
  return MEMORY[0x24BE6FB38]();
}

uint64_t sub_213FF884C()
{
  return MEMORY[0x24BE1C5F0]();
}

uint64_t sub_213FF8858()
{
  return MEMORY[0x24BE1C618]();
}

uint64_t sub_213FF8864()
{
  return MEMORY[0x24BE1C620]();
}

uint64_t sub_213FF8870()
{
  return MEMORY[0x24BE1C628]();
}

uint64_t sub_213FF887C()
{
  return MEMORY[0x24BE1C630]();
}

uint64_t sub_213FF8888()
{
  return MEMORY[0x24BE1C638]();
}

uint64_t sub_213FF8894()
{
  return MEMORY[0x24BE1C640]();
}

uint64_t sub_213FF88A0()
{
  return MEMORY[0x24BE1C648]();
}

uint64_t sub_213FF88AC()
{
  return MEMORY[0x24BE1C650]();
}

uint64_t sub_213FF88B8()
{
  return MEMORY[0x24BE1C658]();
}

uint64_t sub_213FF88C4()
{
  return MEMORY[0x24BE1C660]();
}

uint64_t sub_213FF88D0()
{
  return MEMORY[0x24BE1C668]();
}

uint64_t sub_213FF88DC()
{
  return MEMORY[0x24BE1C678]();
}

uint64_t sub_213FF88E8()
{
  return MEMORY[0x24BE1C680]();
}

uint64_t sub_213FF88F4()
{
  return MEMORY[0x24BE1C688]();
}

uint64_t sub_213FF8900()
{
  return MEMORY[0x24BE1C690]();
}

uint64_t sub_213FF890C()
{
  return MEMORY[0x24BE1C698]();
}

uint64_t sub_213FF8918()
{
  return MEMORY[0x24BE1C6A0]();
}

uint64_t sub_213FF8924()
{
  return MEMORY[0x24BE1C6A8]();
}

uint64_t sub_213FF8930()
{
  return MEMORY[0x24BE1C6B0]();
}

uint64_t sub_213FF893C()
{
  return MEMORY[0x24BE1C6B8]();
}

uint64_t sub_213FF8948()
{
  return MEMORY[0x24BE1C6C0]();
}

uint64_t sub_213FF8954()
{
  return MEMORY[0x24BE1C6C8]();
}

uint64_t sub_213FF8960()
{
  return MEMORY[0x24BE1C6D0]();
}

uint64_t sub_213FF896C()
{
  return MEMORY[0x24BE1C6D8]();
}

uint64_t sub_213FF8978()
{
  return MEMORY[0x24BE1C6E0]();
}

uint64_t sub_213FF8984()
{
  return MEMORY[0x24BE1C6E8]();
}

uint64_t sub_213FF8990()
{
  return MEMORY[0x24BE1C6F0]();
}

uint64_t sub_213FF899C()
{
  return MEMORY[0x24BE1C6F8]();
}

uint64_t sub_213FF89A8()
{
  return MEMORY[0x24BE1C700]();
}

uint64_t sub_213FF89B4()
{
  return MEMORY[0x24BE1C710]();
}

uint64_t sub_213FF89C0()
{
  return MEMORY[0x24BE1C720]();
}

uint64_t sub_213FF89CC()
{
  return MEMORY[0x24BE1C728]();
}

uint64_t sub_213FF89D8()
{
  return MEMORY[0x24BE1C738]();
}

uint64_t sub_213FF89E4()
{
  return MEMORY[0x24BE1C778]();
}

uint64_t sub_213FF89F0()
{
  return MEMORY[0x24BE1C780]();
}

uint64_t sub_213FF89FC()
{
  return MEMORY[0x24BE1C790]();
}

uint64_t sub_213FF8A08()
{
  return MEMORY[0x24BE1C798]();
}

uint64_t sub_213FF8A14()
{
  return MEMORY[0x24BE1C7A0]();
}

uint64_t sub_213FF8A20()
{
  return MEMORY[0x24BE1C7A8]();
}

uint64_t sub_213FF8A2C()
{
  return MEMORY[0x24BE1C7B0]();
}

uint64_t sub_213FF8A38()
{
  return MEMORY[0x24BE1C7B8]();
}

uint64_t sub_213FF8A44()
{
  return MEMORY[0x24BE1C7C0]();
}

uint64_t sub_213FF8A50()
{
  return MEMORY[0x24BE1C7C8]();
}

uint64_t sub_213FF8A5C()
{
  return MEMORY[0x24BE1C7D0]();
}

uint64_t sub_213FF8A68()
{
  return MEMORY[0x24BE1C7D8]();
}

uint64_t sub_213FF8A74()
{
  return MEMORY[0x24BE1C7E0]();
}

uint64_t sub_213FF8A80()
{
  return MEMORY[0x24BE1C7E8]();
}

uint64_t sub_213FF8A8C()
{
  return MEMORY[0x24BE1C7F0]();
}

uint64_t sub_213FF8A98()
{
  return MEMORY[0x24BE1C7F8]();
}

uint64_t sub_213FF8AA4()
{
  return MEMORY[0x24BE1C800]();
}

uint64_t sub_213FF8AB0()
{
  return MEMORY[0x24BE1C808]();
}

uint64_t sub_213FF8ABC()
{
  return MEMORY[0x24BE1C810]();
}

uint64_t sub_213FF8AC8()
{
  return MEMORY[0x24BE1C818]();
}

uint64_t sub_213FF8AD4()
{
  return MEMORY[0x24BE1C820]();
}

uint64_t sub_213FF8AE0()
{
  return MEMORY[0x24BE1C828]();
}

uint64_t sub_213FF8AEC()
{
  return MEMORY[0x24BE1C830]();
}

uint64_t sub_213FF8AF8()
{
  return MEMORY[0x24BE1C838]();
}

uint64_t sub_213FF8B04()
{
  return MEMORY[0x24BE1C840]();
}

uint64_t sub_213FF8B10()
{
  return MEMORY[0x24BE1C850]();
}

uint64_t sub_213FF8B1C()
{
  return MEMORY[0x24BE1C858]();
}

uint64_t sub_213FF8B28()
{
  return MEMORY[0x24BE1C860]();
}

uint64_t sub_213FF8B34()
{
  return MEMORY[0x24BE1C868]();
}

uint64_t sub_213FF8B40()
{
  return MEMORY[0x24BE1C870]();
}

uint64_t sub_213FF8B4C()
{
  return MEMORY[0x24BE1C878]();
}

uint64_t sub_213FF8B58()
{
  return MEMORY[0x24BE1C880]();
}

uint64_t sub_213FF8B64()
{
  return MEMORY[0x24BE1C888]();
}

uint64_t sub_213FF8B70()
{
  return MEMORY[0x24BE1C890]();
}

uint64_t sub_213FF8B7C()
{
  return MEMORY[0x24BE1C898]();
}

uint64_t sub_213FF8B88()
{
  return MEMORY[0x24BE1C8A0]();
}

uint64_t sub_213FF8B94()
{
  return MEMORY[0x24BE1C8C0]();
}

uint64_t sub_213FF8BA0()
{
  return MEMORY[0x24BE1C8D0]();
}

uint64_t sub_213FF8BAC()
{
  return MEMORY[0x24BE1C8D8]();
}

uint64_t sub_213FF8BB8()
{
  return MEMORY[0x24BE1C8E0]();
}

uint64_t sub_213FF8BC4()
{
  return MEMORY[0x24BE1C8E8]();
}

uint64_t sub_213FF8BD0()
{
  return MEMORY[0x24BE1C8F0]();
}

uint64_t sub_213FF8BDC()
{
  return MEMORY[0x24BE1C8F8]();
}

uint64_t sub_213FF8BE8()
{
  return MEMORY[0x24BE1C900]();
}

uint64_t sub_213FF8BF4()
{
  return MEMORY[0x24BE1C918]();
}

uint64_t sub_213FF8C00()
{
  return MEMORY[0x24BE1C920]();
}

uint64_t sub_213FF8C0C()
{
  return MEMORY[0x24BE1C928]();
}

uint64_t sub_213FF8C18()
{
  return MEMORY[0x24BE1C930]();
}

uint64_t sub_213FF8C24()
{
  return MEMORY[0x24BE1C938]();
}

uint64_t sub_213FF8C30()
{
  return MEMORY[0x24BE1C940]();
}

uint64_t sub_213FF8C3C()
{
  return MEMORY[0x24BE1C948]();
}

uint64_t sub_213FF8C48()
{
  return MEMORY[0x24BE1C950]();
}

uint64_t sub_213FF8C54()
{
  return MEMORY[0x24BE1C958]();
}

uint64_t sub_213FF8C60()
{
  return MEMORY[0x24BE1C960]();
}

uint64_t sub_213FF8C6C()
{
  return MEMORY[0x24BE1C968]();
}

uint64_t sub_213FF8C78()
{
  return MEMORY[0x24BE1C970]();
}

uint64_t sub_213FF8C84()
{
  return MEMORY[0x24BE1C978]();
}

uint64_t sub_213FF8C90()
{
  return MEMORY[0x24BE1C980]();
}

uint64_t sub_213FF8C9C()
{
  return MEMORY[0x24BE1C988]();
}

uint64_t sub_213FF8CA8()
{
  return MEMORY[0x24BE1C990]();
}

uint64_t sub_213FF8CB4()
{
  return MEMORY[0x24BE1C998]();
}

uint64_t sub_213FF8CC0()
{
  return MEMORY[0x24BE1C9A0]();
}

uint64_t sub_213FF8CCC()
{
  return MEMORY[0x24BE1C9A8]();
}

uint64_t sub_213FF8CD8()
{
  return MEMORY[0x24BE1C9B0]();
}

uint64_t sub_213FF8CE4()
{
  return MEMORY[0x24BDC6D18]();
}

uint64_t sub_213FF8CF0()
{
  return MEMORY[0x24BDC6D28]();
}

uint64_t sub_213FF8CFC()
{
  return MEMORY[0x24BDC6D30]();
}

uint64_t sub_213FF8D08()
{
  return MEMORY[0x24BDC6D48]();
}

uint64_t sub_213FF8D14()
{
  return MEMORY[0x24BEE76F0]();
}

uint64_t sub_213FF8D20()
{
  return MEMORY[0x24BE1DE88]();
}

uint64_t sub_213FF8D2C()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_213FF8D38()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_213FF8D44()
{
  return MEMORY[0x24BEBC430]();
}

uint64_t sub_213FF8D50()
{
  return MEMORY[0x24BEBCB20]();
}

uint64_t sub_213FF8D5C()
{
  return MEMORY[0x24BE1BE60]();
}

uint64_t sub_213FF8D68()
{
  return MEMORY[0x24BE1C090]();
}

uint64_t sub_213FF8D74()
{
  return MEMORY[0x24BE1C098]();
}

uint64_t sub_213FF8D80()
{
  return MEMORY[0x24BE1C0A0]();
}

uint64_t sub_213FF8D8C()
{
  return MEMORY[0x24BE1C3D0]();
}

uint64_t sub_213FF8D98()
{
  return MEMORY[0x24BE1C3D8]();
}

uint64_t sub_213FF8DA4()
{
  return MEMORY[0x24BE1C3E0]();
}

uint64_t sub_213FF8DB0()
{
  return MEMORY[0x24BE1C3E8]();
}

uint64_t sub_213FF8DBC()
{
  return MEMORY[0x24BE1C3F0]();
}

uint64_t sub_213FF8DC8()
{
  return MEMORY[0x24BE1C3F8]();
}

uint64_t sub_213FF8DD4()
{
  return MEMORY[0x24BE1C410]();
}

uint64_t sub_213FF8DE0()
{
  return MEMORY[0x24BE1C428]();
}

uint64_t sub_213FF8DEC()
{
  return MEMORY[0x24BE1C430]();
}

uint64_t sub_213FF8DF8()
{
  return MEMORY[0x24BE1C438]();
}

uint64_t sub_213FF8E04()
{
  return MEMORY[0x24BE1C440]();
}

uint64_t sub_213FF8E10()
{
  return MEMORY[0x24BE1C448]();
}

uint64_t sub_213FF8E1C()
{
  return MEMORY[0x24BE1C450]();
}

uint64_t sub_213FF8E28()
{
  return MEMORY[0x24BE1C468]();
}

uint64_t sub_213FF8E34()
{
  return MEMORY[0x24BE1C478]();
}

uint64_t sub_213FF8E40()
{
  return MEMORY[0x24BE1C480]();
}

uint64_t sub_213FF8E4C()
{
  return MEMORY[0x24BE1C488]();
}

uint64_t sub_213FF8E58()
{
  return MEMORY[0x24BE1C490]();
}

uint64_t sub_213FF8E64()
{
  return MEMORY[0x24BE1C498]();
}

uint64_t sub_213FF8E70()
{
  return MEMORY[0x24BE1C4B0]();
}

uint64_t sub_213FF8E7C()
{
  return MEMORY[0x24BE1C4C0]();
}

uint64_t sub_213FF8E88()
{
  return MEMORY[0x24BE1C4C8]();
}

uint64_t sub_213FF8E94()
{
  return MEMORY[0x24BE1C4D0]();
}

uint64_t sub_213FF8EA0()
{
  return MEMORY[0x24BE1C4D8]();
}

uint64_t sub_213FF8EAC()
{
  return MEMORY[0x24BE1C4E0]();
}

uint64_t sub_213FF8EB8()
{
  return MEMORY[0x24BE1C4F8]();
}

uint64_t sub_213FF8EC4()
{
  return MEMORY[0x24BE1C508]();
}

uint64_t sub_213FF8ED0()
{
  return MEMORY[0x24BE1C510]();
}

uint64_t sub_213FF8EDC()
{
  return MEMORY[0x24BE1C518]();
}

uint64_t sub_213FF8EE8()
{
  return MEMORY[0x24BE1C520]();
}

uint64_t sub_213FF8EF4()
{
  return MEMORY[0x24BE1C528]();
}

uint64_t sub_213FF8F00()
{
  return MEMORY[0x24BE1C570]();
}

uint64_t sub_213FF8F0C()
{
  return MEMORY[0x24BDE05D0]();
}

uint64_t sub_213FF8F18()
{
  return MEMORY[0x24BDE05F0]();
}

uint64_t sub_213FF8F24()
{
  return MEMORY[0x24BDE0630]();
}

uint64_t sub_213FF8F30()
{
  return MEMORY[0x24BDE0640]();
}

uint64_t sub_213FF8F3C()
{
  return MEMORY[0x24BDE0650]();
}

uint64_t sub_213FF8F48()
{
  return MEMORY[0x24BDE0660]();
}

uint64_t sub_213FF8F54()
{
  return MEMORY[0x24BDEB040]();
}

uint64_t sub_213FF8F60()
{
  return MEMORY[0x24BDEB560]();
}

uint64_t sub_213FF8F6C()
{
  return MEMORY[0x24BDEB7B8]();
}

uint64_t sub_213FF8F78()
{
  return MEMORY[0x24BDEBC28]();
}

uint64_t sub_213FF8F84()
{
  return MEMORY[0x24BDEBC38]();
}

uint64_t sub_213FF8F90()
{
  return MEMORY[0x24BDEBC40]();
}

uint64_t sub_213FF8F9C()
{
  return MEMORY[0x24BDEBDE0]();
}

uint64_t sub_213FF8FA8()
{
  return MEMORY[0x24BDEBDF0]();
}

uint64_t sub_213FF8FB4()
{
  return MEMORY[0x24BDEBE00]();
}

uint64_t sub_213FF8FC0()
{
  return MEMORY[0x24BDEBED0]();
}

uint64_t sub_213FF8FCC()
{
  return MEMORY[0x24BDECE88]();
}

uint64_t sub_213FF8FD8()
{
  return MEMORY[0x24BDECEE8]();
}

uint64_t sub_213FF8FE4()
{
  return MEMORY[0x24BDECF50]();
}

uint64_t sub_213FF8FF0()
{
  return MEMORY[0x24BDED998]();
}

uint64_t sub_213FF8FFC()
{
  return MEMORY[0x24BDEDBA8]();
}

uint64_t sub_213FF9008()
{
  return MEMORY[0x24BDEDE90]();
}

uint64_t sub_213FF9014()
{
  return MEMORY[0x24BDEDE98]();
}

uint64_t sub_213FF9020()
{
  return MEMORY[0x24BDEE020]();
}

uint64_t sub_213FF902C()
{
  return MEMORY[0x24BDEE028]();
}

uint64_t sub_213FF9038()
{
  return MEMORY[0x24BDEE288]();
}

uint64_t sub_213FF9044()
{
  return MEMORY[0x24BDEE290]();
}

uint64_t sub_213FF9050()
{
  return MEMORY[0x24BDEE390]();
}

uint64_t sub_213FF905C()
{
  return MEMORY[0x24BDEE3A0]();
}

uint64_t sub_213FF9068()
{
  return MEMORY[0x24BDEE490]();
}

uint64_t sub_213FF9074()
{
  return MEMORY[0x24BDEE4A0]();
}

uint64_t sub_213FF9080()
{
  return MEMORY[0x24BDEE4E0]();
}

uint64_t sub_213FF908C()
{
  return MEMORY[0x24BDEE4F8]();
}

uint64_t sub_213FF9098()
{
  return MEMORY[0x24BDEE700]();
}

uint64_t sub_213FF90A4()
{
  return MEMORY[0x24BDEE718]();
}

uint64_t sub_213FF90B0()
{
  return MEMORY[0x24BDEE730]();
}

uint64_t sub_213FF90BC()
{
  return MEMORY[0x24BDEEA50]();
}

uint64_t sub_213FF90C8()
{
  return MEMORY[0x24BDEEB88]();
}

uint64_t sub_213FF90D4()
{
  return MEMORY[0x24BDEEF60]();
}

uint64_t sub_213FF90E0()
{
  return MEMORY[0x24BDEEF78]();
}

uint64_t sub_213FF90EC()
{
  return MEMORY[0x24BDEF3A0]();
}

uint64_t sub_213FF90F8()
{
  return MEMORY[0x24BDEFCC8]();
}

uint64_t sub_213FF9104()
{
  return MEMORY[0x24BDF0A10]();
}

uint64_t sub_213FF9110()
{
  return MEMORY[0x24BDF0A20]();
}

uint64_t sub_213FF911C()
{
  return MEMORY[0x24BDF1088]();
}

uint64_t sub_213FF9128()
{
  return MEMORY[0x24BDF1430]();
}

uint64_t sub_213FF9134()
{
  return MEMORY[0x24BDF14A0]();
}

uint64_t sub_213FF9140()
{
  return MEMORY[0x24BDF14A8]();
}

uint64_t sub_213FF914C()
{
  return MEMORY[0x24BDF14C0]();
}

uint64_t sub_213FF9158()
{
  return MEMORY[0x24BDF14C8]();
}

uint64_t sub_213FF9164()
{
  return MEMORY[0x24BDF14E0]();
}

uint64_t sub_213FF9170()
{
  return MEMORY[0x24BDF1510]();
}

uint64_t sub_213FF917C()
{
  return MEMORY[0x24BDF1580]();
}

uint64_t sub_213FF9188()
{
  return MEMORY[0x24BDF15F8]();
}

uint64_t sub_213FF9194()
{
  return MEMORY[0x24BDF16A8]();
}

uint64_t sub_213FF91A0()
{
  return MEMORY[0x24BDF16D8]();
}

uint64_t sub_213FF91AC()
{
  return MEMORY[0x24BDF16E8]();
}

uint64_t sub_213FF91B8()
{
  return MEMORY[0x24BDF1700]();
}

uint64_t sub_213FF91C4()
{
  return MEMORY[0x24BDF1778]();
}

uint64_t sub_213FF91D0()
{
  return MEMORY[0x24BDF1798]();
}

uint64_t sub_213FF91DC()
{
  return MEMORY[0x24BDF1820]();
}

uint64_t sub_213FF91E8()
{
  return MEMORY[0x24BDF1828]();
}

uint64_t sub_213FF91F4()
{
  return MEMORY[0x24BDF1D08]();
}

uint64_t sub_213FF9200()
{
  return MEMORY[0x24BDF1DC8]();
}

uint64_t sub_213FF920C()
{
  return MEMORY[0x24BDF1FC0]();
}

uint64_t sub_213FF9218()
{
  return MEMORY[0x24BDF1FF0]();
}

uint64_t sub_213FF9224()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t sub_213FF9230()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t sub_213FF923C()
{
  return MEMORY[0x24BDF25E0]();
}

uint64_t sub_213FF9248()
{
  return MEMORY[0x24BDF25F8]();
}

uint64_t sub_213FF9254()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t sub_213FF9260()
{
  return MEMORY[0x24BDF27E0]();
}

uint64_t sub_213FF926C()
{
  return MEMORY[0x24BDF27F0]();
}

uint64_t sub_213FF9278()
{
  return MEMORY[0x24BDF2DB8]();
}

uint64_t sub_213FF9284()
{
  return MEMORY[0x24BDF2F08]();
}

uint64_t sub_213FF9290()
{
  return MEMORY[0x24BDF3178]();
}

uint64_t sub_213FF929C()
{
  return MEMORY[0x24BDF3BE8]();
}

uint64_t sub_213FF92A8()
{
  return MEMORY[0x24BDF3CF0]();
}

uint64_t sub_213FF92B4()
{
  return MEMORY[0x24BDF3D10]();
}

uint64_t sub_213FF92C0()
{
  return MEMORY[0x24BDF3E08]();
}

uint64_t sub_213FF92CC()
{
  return MEMORY[0x24BDF3E98]();
}

uint64_t sub_213FF92D8()
{
  return MEMORY[0x24BDF3F58]();
}

uint64_t sub_213FF92E4()
{
  return MEMORY[0x24BDF3F80]();
}

uint64_t sub_213FF92F0()
{
  return MEMORY[0x24BDF3FE8]();
}

uint64_t sub_213FF92FC()
{
  return MEMORY[0x24BDF40C0]();
}

uint64_t sub_213FF9308()
{
  return MEMORY[0x24BDF40D8]();
}

uint64_t sub_213FF9314()
{
  return MEMORY[0x24BDF4140]();
}

uint64_t sub_213FF9320()
{
  return MEMORY[0x24BDF4290]();
}

uint64_t sub_213FF932C()
{
  return MEMORY[0x24BDF4790]();
}

uint64_t sub_213FF9338()
{
  return MEMORY[0x24BDF4908]();
}

uint64_t sub_213FF9344()
{
  return MEMORY[0x24BDF4918]();
}

uint64_t sub_213FF9350()
{
  return MEMORY[0x24BDF49B8]();
}

uint64_t sub_213FF935C()
{
  return MEMORY[0x24BDF4F18]();
}

uint64_t sub_213FF9368()
{
  return MEMORY[0x24BDF4F20]();
}

uint64_t sub_213FF9374()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_213FF9380()
{
  return MEMORY[0x24BEE54B0]();
}

uint64_t sub_213FF938C()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_213FF9398()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_213FF93A4()
{
  return MEMORY[0x24BEE5570]();
}

uint64_t sub_213FF93B0()
{
  return MEMORY[0x24BEE5590]();
}

uint64_t sub_213FF93BC()
{
  return MEMORY[0x24BEE5628]();
}

uint64_t sub_213FF93C8()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_213FF93D4()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_213FF93E0()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_213FF93EC()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_213FF93F8()
{
  return MEMORY[0x24BEE07F0]();
}

uint64_t sub_213FF9404()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_213FF9410()
{
  return MEMORY[0x24BDCF8D8]();
}

uint64_t sub_213FF941C()
{
  return MEMORY[0x24BDCF978]();
}

uint64_t sub_213FF9428()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_213FF9434()
{
  return MEMORY[0x24BDCF9F0]();
}

uint64_t sub_213FF9440()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_213FF944C()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_213FF9458()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_213FF9464()
{
  return MEMORY[0x24BDCFA78]();
}

uint64_t sub_213FF9470()
{
  return MEMORY[0x24BDCFB20]();
}

uint64_t sub_213FF947C()
{
  return MEMORY[0x24BEE0A08]();
}

uint64_t sub_213FF9488()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_213FF9494()
{
  return MEMORY[0x24BEE0B68]();
}

uint64_t sub_213FF94A0()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_213FF94AC()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_213FF94B8()
{
  return MEMORY[0x24BEE0FD8]();
}

uint64_t sub_213FF94C4()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_213FF94D0()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_213FF94DC()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_213FF94E8()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_213FF94F4()
{
  return MEMORY[0x24BE1DE90]();
}

uint64_t sub_213FF9500()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_213FF950C()
{
  return MEMORY[0x24BEE1168]();
}

uint64_t sub_213FF9518()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_213FF9524()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_213FF9530()
{
  return MEMORY[0x24BEE6820]();
}

uint64_t sub_213FF953C()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t sub_213FF9548()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_213FF9554()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_213FF9560()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_213FF956C()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_213FF9578()
{
  return MEMORY[0x24BEE14A0]();
}

uint64_t sub_213FF9584()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_213FF9590()
{
  return MEMORY[0x24BEE15E8]();
}

uint64_t sub_213FF959C()
{
  return MEMORY[0x24BE1DE98]();
}

uint64_t sub_213FF95A8()
{
  return MEMORY[0x24BE1DEA0]();
}

uint64_t sub_213FF95B4()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_213FF95C0()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_213FF95CC()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_213FF95D8()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_213FF95E4()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_213FF95F0()
{
  return MEMORY[0x24BE1DEA8]();
}

uint64_t sub_213FF95FC()
{
  return MEMORY[0x24BE1DEB8]();
}

uint64_t sub_213FF9608()
{
  return MEMORY[0x24BEBCCA8]();
}

uint64_t sub_213FF9614()
{
  return MEMORY[0x24BEE5658]();
}

uint64_t sub_213FF9620()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_213FF962C()
{
  return MEMORY[0x24BEE56B8]();
}

uint64_t sub_213FF9638()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_213FF9644()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_213FF9650()
{
  return MEMORY[0x24BEE5780]();
}

uint64_t sub_213FF965C()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_213FF9668()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_213FF9674()
{
  return MEMORY[0x24BEE57B0]();
}

uint64_t sub_213FF9680()
{
  return MEMORY[0x24BEBCCD8]();
}

uint64_t sub_213FF968C()
{
  return MEMORY[0x24BE1DEC0]();
}

uint64_t sub_213FF9698()
{
  return MEMORY[0x24BEBCD58]();
}

uint64_t sub_213FF96A4()
{
  return MEMORY[0x24BEBCD60]();
}

uint64_t sub_213FF96B0()
{
  return MEMORY[0x24BE1DEC8]();
}

uint64_t sub_213FF96BC()
{
  return MEMORY[0x24BDD0118]();
}

uint64_t sub_213FF96C8()
{
  return MEMORY[0x24BEBCFB8]();
}

uint64_t sub_213FF96D4()
{
  return MEMORY[0x24BE1DED0]();
}

uint64_t sub_213FF96E0()
{
  return MEMORY[0x24BDF5540]();
}

uint64_t sub_213FF96EC()
{
  return MEMORY[0x24BEBD008]();
}

uint64_t sub_213FF96F8()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_213FF9704()
{
  return MEMORY[0x24BEE5BD0]();
}

uint64_t sub_213FF9710()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_213FF971C()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_213FF9728()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_213FF9734()
{
  return MEMORY[0x24BDD0548]();
}

uint64_t sub_213FF9740()
{
  return MEMORY[0x24BDD0568]();
}

uint64_t sub_213FF974C()
{
  return MEMORY[0x24BEE2090]();
}

uint64_t sub_213FF9758()
{
  return MEMORY[0x24BEE2200]();
}

uint64_t sub_213FF9764()
{
  return MEMORY[0x24BEE2210]();
}

uint64_t sub_213FF9770()
{
  return MEMORY[0x24BEE2270]();
}

uint64_t sub_213FF977C()
{
  return MEMORY[0x24BEE22B0]();
}

uint64_t sub_213FF9788()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_213FF9794()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_213FF97A0()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_213FF97AC()
{
  return MEMORY[0x24BEE23A8]();
}

uint64_t sub_213FF97B8()
{
  return MEMORY[0x24BEE23E8]();
}

uint64_t sub_213FF97C4()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_213FF97D0()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_213FF97DC()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_213FF97E8()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_213FF97F4()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_213FF9800()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_213FF980C()
{
  return MEMORY[0x24BEE2660]();
}

uint64_t sub_213FF9818()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_213FF9824()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_213FF9830()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_213FF983C()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_213FF9848()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_213FF9854()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_213FF9860()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_213FF986C()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_213FF9878()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_213FF9884()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_213FF9890()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_213FF989C()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_213FF98A8()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_213FF98B4()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_213FF98C0()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_213FF98CC()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_213FF98D8()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_213FF98E4()
{
  return MEMORY[0x24BEE3A20]();
}

uint64_t sub_213FF98F0()
{
  return MEMORY[0x24BEE3A28]();
}

uint64_t sub_213FF98FC()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_213FF9908()
{
  return MEMORY[0x24BEE3B98]();
}

uint64_t sub_213FF9914()
{
  return MEMORY[0x24BEE70E0]();
}

uint64_t sub_213FF9920()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_213FF992C()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_213FF9938()
{
  return MEMORY[0x24BDD06E0]();
}

uint64_t sub_213FF9944()
{
  return MEMORY[0x24BDD06F0]();
}

uint64_t sub_213FF9950()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_213FF995C()
{
  return MEMORY[0x24BE1DEE0]();
}

uint64_t sub_213FF9968()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_213FF9974()
{
  return MEMORY[0x24BEE42C8]();
}

uint64_t sub_213FF9980()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_213FF998C()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_213FF9998()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_213FF99A4()
{
  return MEMORY[0x24BEE4A18]();
}

CGPoint CGPointFromString(NSString *string)
{
  double v1;
  double v2;
  CGPoint result;

  MEMORY[0x24BEBD230](string);
  result.y = v2;
  result.x = v1;
  return result;
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

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x24BDBF078]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CMTime *__cdecl CMTimeMakeFromDictionary(CMTime *__return_ptr retstr, CFDictionaryRef dictionaryRepresentation)
{
  return (CMTime *)MEMORY[0x24BDC04A8](retstr, dictionaryRepresentation);
}

uint64_t SecAccessControlCopyData()
{
  return MEMORY[0x24BDE8788]();
}

BOOL UIAccessibilityIsSwitchControlRunning(void)
{
  return MEMORY[0x24BEBDE70]();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
  MEMORY[0x24BEBDE98](*(_QWORD *)&notification, argument);
}

NSData *__cdecl UIImageJPEGRepresentation(UIImage *image, CGFloat compressionQuality)
{
  return (NSData *)MEMORY[0x24BEBE2D8](image, compressionQuality);
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x24BEBE2E0](image);
}

uint64_t _AXSAssistiveTouchEnabled()
{
  return MEMORY[0x24BED2050]();
}

uint64_t _AXSCommandAndControlEnabled()
{
  return MEMORY[0x24BED2170]();
}

uint64_t _AXSFullKeyboardAccessEnabled()
{
  return MEMORY[0x24BED21F0]();
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

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x24BEE4B30]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x24BDAD010]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
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

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
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

uint64_t swift_continuation_resume()
{
  return MEMORY[0x24BEE71C8]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x24BEE71D0]();
}

uint64_t swift_continuation_throwingResumeWithError()
{
  return MEMORY[0x24BEE71D8]();
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

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x24BEE4C40]();
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

uint64_t swift_getErrorValue()
{
  return MEMORY[0x24BEE4D18]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x24BEE4D88]();
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

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x24BEE4EA8]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x24BEE4EB0]();
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

uint64_t swift_weakAssign()
{
  return MEMORY[0x24BEE5010]();
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

