uint64_t sub_210D269DC(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v23[3];
  uint64_t v24;
  _UNKNOWN **v25;

  v24 = type metadata accessor for EventReporter();
  v25 = &off_24CAAEF80;
  v23[0] = a4;
  type metadata accessor for PlayerController();
  v14 = swift_allocObject();
  v15 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v23, v24);
  MEMORY[0x24BDAC7A8](v15, v15, v16);
  v18 = (_QWORD *)((char *)&v23[-1] - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v19 + 16))(v18);
  v20 = sub_210D26AEC(a1, a2, a3, *v18, a5, a6, a7, v14);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v23);
  return v20;
}

uint64_t sub_210D26AEC(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  double v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t **v20;
  uint64_t v21;
  uint64_t *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t **v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _BYTE v34[24];
  uint64_t v35;
  _QWORD v36[5];

  v36[3] = type metadata accessor for EventReporter();
  v36[4] = &off_24CAAEF80;
  v36[0] = a4;
  *(_QWORD *)(a8 + 24) = 0;
  swift_unknownObjectWeakInit();
  *(_QWORD *)(a8 + 40) = 0x4072C00000000000;
  *(_QWORD *)(a8 + 104) = 0;
  *(_OWORD *)(a8 + 48) = 0u;
  *(_OWORD *)(a8 + 64) = 0u;
  *(_BYTE *)(a8 + 112) = 1;
  *(_QWORD *)(a8 + 128) = 0;
  *(_QWORD *)(a8 + 136) = 0;
  *(_QWORD *)(a8 + 120) = 0;
  *(_OWORD *)(a8 + 208) = 0u;
  *(_OWORD *)(a8 + 224) = 0u;
  *(_OWORD *)(a8 + 240) = 0u;
  *(_OWORD *)(a8 + 256) = 0u;
  *(_OWORD *)(a8 + 272) = 0u;
  *(_OWORD *)(a8 + 288) = 0u;
  *(_OWORD *)(a8 + 304) = 0u;
  *(_OWORD *)(a8 + 320) = 0u;
  *(_QWORD *)(a8 + 384) = 0;
  *(_QWORD *)(a8 + 392) = 0;
  *(_QWORD *)(a8 + 80) = a1;
  *(_QWORD *)(a8 + 88) = a2;
  *(_QWORD *)(a8 + 152) = a3;
  sub_210C45310((uint64_t)v36, a8 + 336);
  *(_QWORD *)(a8 + 160) = a6;
  *(_QWORD *)(a8 + 168) = &off_24CAA9610;
  *(_QWORD *)(a8 + 176) = &off_24CAA94F8;
  *(_QWORD *)(a8 + 184) = &off_24CAA9558;
  *(_QWORD *)(a8 + 376) = a5;
  *(_QWORD *)(a8 + 192) = &off_24CAA9620;
  *(_QWORD *)(a8 + 200) = &off_24CAA9600;
  *(_QWORD *)(a8 + 32) = 0;
  *(_QWORD *)(a8 + 144) = a7;
  v16 = *(double *)(a8 + 40);
  sub_210C45310((uint64_t)v36, (uint64_t)v34);
  v17 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v34, v35);
  MEMORY[0x24BDAC7A8](v17, v17, v18);
  v20 = (uint64_t **)&v34[-((v19 + 15) & 0xFFFFFFFFFFFFFFF0)];
  (*(void (**)(uint64_t **))(v21 + 16))(v20);
  v22 = *v20;
  swift_unknownObjectRetain();
  v23 = a3;
  swift_retain();
  v24 = sub_210C3C85C(v22, v16);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v34);
  *(_QWORD *)(a8 + 328) = v24;
  swift_release();
  v25 = sub_210C85E9C();
  sub_210C45310((uint64_t)v36, (uint64_t)v34);
  v26 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v34, v35);
  MEMORY[0x24BDAC7A8](v26, v26, v27);
  v29 = (uint64_t **)&v34[-((v28 + 15) & 0xFFFFFFFFFFFFFFF0)];
  (*(void (**)(uint64_t **))(v30 + 16))(v29);
  v31 = sub_210D267F4(v25, *v29);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v34);
  *(_QWORD *)(a8 + 96) = v31;
  v32 = *(_QWORD *)(a8 + 328);
  if (v32)
  {
    *(_QWORD *)(v32 + 32) = &off_24CAA78D8;
    swift_unknownObjectWeakAssign();
  }
  sub_210C860F0();

  swift_unknownObjectRelease();
  swift_release();
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v36);
  return a8;
}

void sub_210D26D6C(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  a3[4] = 0;
  swift_unknownObjectWeakInit();
  a3[7] = &off_24CAA66F0;
  a3[2] = a2;
  a3[5] = MEMORY[0x24BEE4AF8];
  a3[6] = a1;
  type metadata accessor for IdleState();
  swift_allocObject();
  swift_unknownObjectRetain();
  swift_retain();
  sub_210C386CC();
}

uint64_t sub_210D26E10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7)
{
  uint64_t v12;
  _QWORD v14[5];

  v14[3] = type metadata accessor for EventReporter();
  v14[4] = &off_24CAAEF80;
  v14[0] = a6;
  *(_QWORD *)(a7 + 24) = 0;
  swift_unknownObjectWeakInit();
  *(_QWORD *)(a7 + 40) = 0;
  swift_unknownObjectWeakInit();
  *(_QWORD *)(a7 + 88) = 0;
  *(_QWORD *)(a7 + 96) = 0;
  v12 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(a7 + 104) = 0;
  *(_QWORD *)(a7 + 112) = v12;
  *(_QWORD *)(a7 + 120) = 0;
  *(_QWORD *)(a7 + 128) = 0;
  *(_QWORD *)(a7 + 136) = v12;
  *(_QWORD *)(a7 + 144) = 0;
  *(_WORD *)(a7 + 152) = 257;
  type metadata accessor for AssetSlidingQueue.Position();
  *(_QWORD *)(a7 + 168) = 0;
  *(_QWORD *)(a7 + 176) = 0;
  *(_QWORD *)(a7 + 160) = 0;
  *(_QWORD *)(a7 + 184) = sub_210E92B30();
  *(_QWORD *)(a7 + 192) = 3;
  *(_DWORD *)(a7 + 200) = 0x1000000;
  *(_WORD *)(a7 + 204) = 2;
  *(_QWORD *)(a7 + 208) = 0;
  *(_QWORD *)(a7 + 216) = v12;
  *(_BYTE *)(a7 + 224) = 0;
  sub_210C45310((uint64_t)v14, a7 + 48);
  *(_QWORD *)(a7 + 24) = a2;
  swift_unknownObjectWeakAssign();
  *(_QWORD *)(a7 + 40) = a4;
  swift_unknownObjectWeakAssign();
  *(_BYTE *)(a7 + 154) = a5;
  sub_210C3E270(0xD000000000000015, 0x8000000210EB2240);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v14);
  return a7;
}

uint64_t sub_210D26F80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t *a6)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v20[3];
  uint64_t v21;
  _UNKNOWN **v22;

  v21 = *a6;
  v22 = &off_24CAAEF80;
  v20[0] = a6;
  type metadata accessor for AssetSlidingQueue();
  v11 = swift_allocObject();
  v12 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v20, v21);
  MEMORY[0x24BDAC7A8](v12, v12, v13);
  v15 = (_QWORD *)((char *)&v20[-1] - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v16 + 16))(v15);
  v17 = sub_210D26E10(a1, a2, a3, a4, a5, *v15, v11);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v20);
  return v17;
}

void sub_210D27074(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  __int128 v19;
  id v20;
  __int128 v21;
  _BYTE v22[24];
  uint64_t v23;
  _QWORD v24[5];

  *(_QWORD *)&v21 = a6;
  v24[3] = type metadata accessor for EventReporter();
  v24[4] = &off_24CAAEF80;
  v24[0] = a4;
  if (a3)
  {
    v10 = a3;
  }
  else
  {
    sub_210C34D54(0, (unint64_t *)&qword_253D7E6B0);
    v10 = (void *)sub_210E92FF8();
  }
  sub_210C45310((uint64_t)v24, (uint64_t)v22);
  v11 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v22, v23);
  MEMORY[0x24BDAC7A8](v11, v11, v12);
  v14 = (uint64_t *)((char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v15 + 16))(v14);
  v16 = *v14;
  v20 = a3;
  sub_210D268FC(0, v16, (uint64_t)v10);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v22);
  type metadata accessor for PlayerFSM();
  v17 = (_QWORD *)swift_allocObject();
  swift_unknownObjectRetain();
  v18 = swift_retain();
  sub_210D26D6C(v18, a7, v17);
}

id sub_210D27374(void *a1, uint64_t a2)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  v4 = objc_msgSend(a1, sel_contentItemID);
  v5 = (void *)sub_210E92BA8();
  v7 = v6;

  sub_210CAA168(v5, v7);
  v9 = v8;
  OUTLINED_FUNCTION_26_0();
  if (!v9)
    return objc_msgSend(*(id *)(a2 + 16), sel_queueItemForPlayerItem_allowReuse_, a1, 1);
  return (id)v9;
}

uint64_t sub_210D27410()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_210D27434()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_210D27460(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_210D25EDC(a1, a2, a3, *(void (**)(void))(v3 + 16));
}

uint64_t sub_210D27480()
{
  return objectdestroy_5Tm();
}

uint64_t objectdestroy_5Tm()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 16))
    swift_release();
  swift_release();
  return swift_deallocObject();
}

void sub_210D274C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  sub_210D25E30(a1, a2, a3, *(void (**)(void))(v3 + 16));
}

uint64_t sub_210D274D8()
{
  uint64_t v0;

  swift_release();
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v0 + 48))
    swift_release();
  return swift_deallocObject();
}

void sub_210D27514()
{
  sub_210C87D7C();
  OUTLINED_FUNCTION_0();
}

uint64_t sub_210D27540(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  _QWORD v25[3];
  uint64_t v26;
  _UNKNOWN **v27;

  v24 = a8;
  v26 = type metadata accessor for EventReporter();
  v27 = &off_24CAAEF80;
  v25[0] = a6;
  type metadata accessor for AssetSlidingQueueController();
  v16 = swift_allocObject();
  v17 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v25, v26);
  MEMORY[0x24BDAC7A8](v17, v17, v18);
  v20 = (_QWORD *)((char *)&v25[-1] - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v21 + 16))(v20);
  v22 = sub_210D27660(a1, a2, a3, a4, a5, *v20, a7, v24, a9, v16);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v25);
  return v22;
}

uint64_t sub_210D27660(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t **v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t ObjectType;
  uint64_t (*v29)(uint64_t, uint64_t);
  void *v30;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD v38[3];
  uint64_t v39;
  _UNKNOWN **v40;
  _QWORD v41[6];

  v35 = a8;
  v41[3] = type metadata accessor for EventReporter();
  v41[4] = &off_24CAAEF80;
  v41[0] = a6;
  *(_QWORD *)(a10 + 24) = 0;
  swift_unknownObjectWeakInit();
  *(_DWORD *)(a10 + 220) = 0;
  *(_OWORD *)(a10 + 160) = 0u;
  *(_QWORD *)(a10 + 176) = 0;
  *(_OWORD *)(a10 + 144) = 0u;
  *(_QWORD *)(a10 + 200) = 0;
  *(_QWORD *)(a10 + 208) = 0;
  *(_QWORD *)(a10 + 192) = 0;
  *(_BYTE *)(a10 + 216) = 0;
  *(_BYTE *)(a10 + 224) = 1;
  *(_QWORD *)(a10 + 232) = 0;
  *(_QWORD *)(a10 + 240) = 0;
  *(_BYTE *)(a10 + 248) = 0;
  *(_QWORD *)(a10 + 256) = 0;
  *(_QWORD *)(a10 + 264) = 0;
  *(_BYTE *)(a10 + 272) = 3;
  *(_QWORD *)(a10 + 280) = 0;
  *(_QWORD *)(a10 + 288) = 0;
  *(_QWORD *)(a10 + 32) = 0;
  *(_QWORD *)(a10 + 40) = a1;
  *(_QWORD *)(a10 + 56) = a3;
  *(_QWORD *)(a10 + 64) = a4;
  *(_QWORD *)(a10 + 72) = a5;
  sub_210C45310((uint64_t)v41, a10 + 80);
  *(_QWORD *)(a10 + 120) = a7;
  *(_QWORD *)(a10 + 128) = a9;
  sub_210C45310((uint64_t)v41, (uint64_t)v38);
  type metadata accessor for TransitionController();
  swift_allocObject();
  v33 = a9;
  swift_unknownObjectRetain();
  swift_retain_n();
  swift_unknownObjectRetain();
  v37 = a4;
  swift_retain();
  v32 = a5;
  swift_unknownObjectRetain();
  v36 = a7;
  swift_retain();
  v34 = a1;
  *(_QWORD *)(a10 + 136) = sub_210C3BF24((uint64_t)v38, a1, (uint64_t)&off_24CAA7888);
  v17 = v35;
  *(_QWORD *)(a10 + 184) = v35;
  *(_QWORD *)(a10 + 48) = a2;
  LOBYTE(a6) = v17 != 1;
  sub_210C45310((uint64_t)v41, (uint64_t)v38);
  v18 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v38, v39);
  MEMORY[0x24BDAC7A8](v18, v18, v19);
  v21 = (uint64_t **)((char *)&v32 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t **))(v22 + 16))(v21);
  v23 = *v21;
  swift_retain_n();
  v35 = a2;
  swift_unknownObjectRetain();
  v24 = sub_210D26F80(a10, (uint64_t)&off_24CAA8B20, a10, (uint64_t)&off_24CAA8B10, a6, v23);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v38);
  v39 = type metadata accessor for AssetSlidingQueue();
  v40 = &off_24CAAB610;
  v38[0] = v24;
  swift_beginAccess();
  sub_210C4641C((uint64_t)v38, a10 + 144);
  swift_endAccess();
  v25 = *(void **)(a10 + 56);
  v26 = *(_QWORD *)(a10 + 40);
  if (*(_QWORD *)(v26 + 64))
  {
    v27 = *(_QWORD *)(v26 + 72);
    ObjectType = swift_getObjectType();
    v29 = *(uint64_t (**)(uint64_t, uint64_t))(v27 + 176);
    swift_unknownObjectRetain();
    v30 = (void *)v29(ObjectType, v27);
    swift_unknownObjectRelease();
  }
  else
  {
    v30 = 0;
  }
  objc_msgSend(v25, sel_updatePlayerPlaybackCoordinator_, v30, v32, v33, v34);
  swift_release();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_release();
  swift_unknownObjectRelease();
  swift_release();
  swift_unknownObjectRelease();

  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v41);
  return a10;
}

void sub_210D2797C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_253D7B298)
  {
    type metadata accessor for UserEventCompletionMonitor();
    sub_210C35144(&qword_253D7B000, (uint64_t (*)(uint64_t))type metadata accessor for UserEventCompletionMonitor, (uint64_t)&unk_210ED50D8);
    v0 = sub_210E93394();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_253D7B298);
  }
}

uint64_t OUTLINED_FUNCTION_21_24()
{
  return swift_release();
}

void OUTLINED_FUNCTION_39_21(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  sub_210BDAD90(&a33);
}

void *sub_210D27A0C(const void *a1, char a2, char a3, uint64_t a4)
{
  uint64_t v4;
  void *result;
  uint64_t v10;
  _QWORD v11[8];
  unint64_t v12;

  result = sub_210C6FC64(a1, v11);
  if (v12 >> 60 == 2)
  {
    v12 &= 0xFFFFFFFFFFFFFFBuLL;
    v10 = v11[0];
    sub_210C6FC64(a1, (void *)(v4 + 16));
    *(_QWORD *)(v4 + 88) = v10;
    *(_BYTE *)(v4 + 96) = a2 & 1;
    *(_BYTE *)(v4 + 97) = a3 & 1;
    *(_QWORD *)(v4 + 104) = a4;
    swift_unknownObjectRetain();
    return (void *)v4;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_210D27AA8()
{
  uint64_t v0;
  _BYTE v1[72];
  _BYTE __dst[184];
  _QWORD __src[23];

  __src[0] = v0;
  sub_210C7A5D0((uint64_t)__src);
  sub_210BDB064(__src, __dst);
  sub_210C38688();
  sub_210C6FC64((const void *)(v0 + 16), v1);
  sub_210CB998C();
}

uint64_t sub_210D27B10(uint64_t a1)
{
  int v2;
  double v3;
  void *v4;
  __int16 v5;
  _QWORD v7[6];
  unsigned __int16 v8;
  unsigned __int8 v9;
  _QWORD v10[4];
  __int16 v11;
  BOOL v12;

  sub_210C7A594(a1, (uint64_t)v7);
  v2 = v8 | (v9 << 16);
  if ((v2 & 0xF00000) == 0x300000)
  {
    v9 = BYTE2(v2) & 0xF;
    v3 = *(double *)v7;
    v4 = (void *)v7[1];
    if (BYTE1(v2))
      v5 = 256;
    else
      v5 = 0;
    v10[0] = v7[2];
    v10[1] = v7[3];
    v10[2] = v7[4];
    v10[3] = v7[5];
    v11 = v5 & 0xFFFE | v2 & 1;
    v12 = (v2 & 0xF0000) != 0;
    type metadata accessor for PausedState();
    OUTLINED_FUNCTION_16_0();
    sub_210C4E588(v4);
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_17_0();
    sub_210C4E588(v4);
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_17_0();
    sub_210CB713C(0, (uint64_t)v4, (uint64_t)v10, v3);
    sub_210C386CC();
  }
  return sub_210D36D3C(a1) & 1;
}

uint64_t sub_210D27C84(const void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[2];
  _BYTE v19[72];

  v3 = v1;
  v5 = sub_210E91D20();
  MEMORY[0x24BDAC7A8](v5, v6, v7);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_210C6FC64((const void *)(v3 + 16), v19);
  sub_210D035F8(v19);
  if ((v10 & 1) != 0)
  {
    OUTLINED_FUNCTION_2_3();
    v11 = *(_QWORD *)(v3 + 88);
    if (*(_BYTE *)(v3 + 96) == 1)
    {
      v12 = *(_BYTE *)(v3 + 97);
      OUTLINED_FUNCTION_5_29();
      sub_210E91D14();
      sub_210E91CFC();
      OUTLINED_FUNCTION_1_40();
      v15 = v9;
      v16 = v2;
      type metadata accessor for FailedInitialLoadingTransitionState();
      v17 = 0;
      v18[0] = 0;
      *(_DWORD *)((char *)v18 + 7) = 0;
      v13 = OUTLINED_FUNCTION_16_0();
      *(_BYTE *)(v13 + 67) = v12;
    }
    else
    {
      OUTLINED_FUNCTION_5_29();
      sub_210E91D14();
      sub_210E91CFC();
      OUTLINED_FUNCTION_1_40();
      v15 = v9;
      v16 = v2;
      type metadata accessor for FailedTransitionState();
      v17 = 0;
      v18[0] = 0;
      *(_DWORD *)((char *)v18 + 7) = 0;
      v13 = OUTLINED_FUNCTION_16_0();
    }
    swift_getObjectType();
    sub_210D0CA9C(v11, v3, (uint64_t)&v15, v13);
    OUTLINED_FUNCTION_6_34();
  }
  return sub_210D36F2C(a1) & 1;
}

uint64_t sub_210D27DF8(unint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  _OWORD v9[3];
  uint64_t v10;
  __int128 v11;

  v4 = v3;
  if (a3 == 1)
  {
    sub_210CB9B54();
  }
  else
  {
    if (a3)
      return sub_210D37218(a1, a2, a3);
    if (a1 >> 62)
    {
      swift_bridgeObjectRetain();
      v8 = sub_210E93490();
      sub_210C4EF40(a1, a2, 0);
      if (v8)
      {
LABEL_5:
        swift_bridgeObjectRetain();
        OUTLINED_FUNCTION_2_3();
        type metadata accessor for ChangingCurrentItemState();
        memset(v9, 0, sizeof(v9));
        v10 = 0;
        v11 = xmmword_210ED2FF0;
        sub_210D2A264(a1, a2 & 1, (uint64_t)v9, *(_BYTE *)(v4 + 96), *(_BYTE *)(v4 + 97));
        OUTLINED_FUNCTION_6_34();
      }
    }
    else if (*(_QWORD *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      goto LABEL_5;
    }
    sub_210CB9A7C();
  }
  return 1;
}

unint64_t sub_210D27F3C()
{
  return 0xD000000000000014;
}

uint64_t sub_210D27F58()
{
  OUTLINED_FUNCTION_0_38();
  return swift_unknownObjectRelease();
}

uint64_t sub_210D27F78()
{
  uint64_t v0;

  OUTLINED_FUNCTION_0_38();
  swift_unknownObjectRelease();
  return v0;
}

uint64_t sub_210D27FA0()
{
  sub_210D27F78();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ErrorResolutionState()
{
  return objc_opt_self();
}

void sub_210D27FE0(uint64_t a1, uint64_t a2, char a3)
{
  __asm { BR              X10 }
}

uint64_t sub_210D28034()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v3;

  OUTLINED_FUNCTION_32();
  sub_210E933A0();
  sub_210E92C38();
  v1 = sub_210C3FDA8();
  MEMORY[0x212BD0B7C](v0, v1);
  sub_210E92C38();
  swift_bridgeObjectRelease();
  sub_210E92C38();
  sub_210E92C38();
  swift_bridgeObjectRelease();
  return v3;
}

void sub_210D28174()
{
  uint64_t v0;

  sub_210D27FE0(*(_QWORD *)v0, *(_QWORD *)(v0 + 8), *(_BYTE *)(v0 + 16));
}

uint64_t destroy for CoordinatorEvent(uint64_t a1)
{
  return sub_210C4EF40(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t _s17MediaPlaybackCore16CoordinatorEventOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_210C4E750(*(_QWORD *)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for CoordinatorEvent(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_210C4E750(*(_QWORD *)a2, v4, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  v8 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v5;
  sub_210C4EF40(v6, v7, v8);
  return a1;
}

uint64_t assignWithTake for CoordinatorEvent(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  char v6;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(_QWORD *)a1;
  v5 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  v6 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v3;
  sub_210C4EF40(v4, v5, v6);
  return a1;
}

ValueMetadata *type metadata accessor for CoordinatorEvent()
{
  return &type metadata for CoordinatorEvent;
}

uint64_t sub_210D28284(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;

  v3 = v2;
  v6 = sub_210E92704();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6, v8, v9);
  v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_210E926D4();
  sub_210C79288(a1, a2);
  swift_retain();
  sub_210C79288(a1, a2);
  swift_retain();
  v12 = sub_210E926F8();
  v13 = sub_210E92F98();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = swift_slowAlloc();
    v25 = v7;
    v15 = v14;
    v16 = swift_slowAlloc();
    v27 = a2;
    v28 = v16;
    *(_DWORD *)v15 = 136315394;
    v26 = a1;
    sub_210C79288(a1, a2);
    v17 = sub_210E92BFC();
    v24 = v6;
    v26 = sub_210C384B0(v17, v18, &v28);
    sub_210E93250();
    swift_bridgeObjectRelease();
    sub_210C7929C(a1, a2);
    sub_210C7929C(a1, a2);
    *(_WORD *)(v15 + 12) = 2080;
    v19 = *(_QWORD *)(v3 + 232);
    v26 = *(_QWORD *)(v3 + 224);
    v27 = v19;
    sub_210C79288(v26, v19);
    v20 = sub_210E92BFC();
    v26 = sub_210C384B0(v20, v21, &v28);
    sub_210E93250();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_210BD8000, v12, v13, "[FullAlignmentTask]: State changed from %s to %s.", (uint8_t *)v15, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x212BD2EEC](v16, -1, -1);
    MEMORY[0x212BD2EEC](v15, -1, -1);

    return (*(uint64_t (**)(char *, uint64_t))(v25 + 8))(v11, v24);
  }
  else
  {
    sub_210C7929C(a1, a2);
    sub_210C7929C(a1, a2);

    swift_release_n();
    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v11, v6);
  }
}

uint64_t sub_210D28508(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;

  *(_QWORD *)(v2 + 224) = a1;
  *(_QWORD *)(v2 + 232) = a2;
  v3 = OUTLINED_FUNCTION_116();
  sub_210C79288(v3, v4);
  v5 = OUTLINED_FUNCTION_116();
  sub_210C7929C(v5, v6);
  v7 = OUTLINED_FUNCTION_116();
  sub_210D28284(v7, v8);
  v9 = OUTLINED_FUNCTION_116();
  return sub_210C7929C(v9, v10);
}

uint64_t sub_210D2854C(void *a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  id v21;
  id v22;
  NSObject *v23;
  os_log_type_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD *v41;
  id v42;
  uint64_t v43;
  uint64_t (*v45)(char *, uint64_t);
  char *v46;
  NSObject *v47;
  os_log_type_t v48;
  uint8_t *v49;
  _QWORD v50[3];
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;

  v2 = v1;
  v4 = OUTLINED_FUNCTION_9_2();
  v5 = *(_QWORD *)(v4 - 8);
  v8 = MEMORY[0x24BDAC7A8](v4, v6, v7);
  v10 = (char *)v50 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v8, v11, v12);
  v15 = (char *)v50 - v14;
  OUTLINED_FUNCTION_130(v13, (unint64_t *)&qword_253D7E630, (void (*)(uint64_t))MEMORY[0x24BEE6990]);
  OUTLINED_FUNCTION_127();
  MEMORY[0x24BDAC7A8](v16, v17, v18);
  v20 = (char *)v50 - v19;
  if (v2[29])
  {
    sub_210E926D4();
    v21 = a1;
    OUTLINED_FUNCTION_34_25();
    v22 = v21;
    v23 = sub_210E926F8();
    v24 = sub_210E92F98();
    if (os_log_type_enabled(v23, v24))
    {
      v25 = OUTLINED_FUNCTION_16_3();
      v50[2] = v5;
      v26 = v25;
      v50[0] = OUTLINED_FUNCTION_16_3();
      v53 = v50[0];
      *(_DWORD *)v26 = 136315651;
      v27 = v2[29];
      v51 = v2[28];
      v52 = v27;
      sub_210C79288(v51, v27);
      v50[1] = v4;
      v28 = sub_210E92BFC();
      v51 = sub_210C384B0(v28, v29, &v53);
      sub_210E93250();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_35_20();
      *(_WORD *)(v26 + 12) = 2160;
      OUTLINED_FUNCTION_19_22();
      v51 = v30;
      v31 = sub_210E93250();
      *(_WORD *)(v26 + 22) = 2081;
      v51 = (uint64_t)a1;
      OUTLINED_FUNCTION_130(v31, &qword_254A808A8, (void (*)(uint64_t))type metadata accessor for PodcastAVItem);
      v32 = sub_210E93238();
      v51 = sub_210C384B0(v32, v33, &v53);
      sub_210E93250();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_210BD8000, v23, v24, "[FullAlignmentTask]: Ignoring start processing request. State: %s, Episode: %{private,mask.hash}s", (uint8_t *)v26, 0x20u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_2();
    }
    OUTLINED_FUNCTION_35_20();

    v45 = *(uint64_t (**)(char *, uint64_t))(v5 + 8);
    v46 = v10;
  }
  else
  {
    if (a1)
    {
      sub_210D23220(a1);
      if (v35)
      {
        sub_210D28508(v34, v35);
        v36 = sub_210E92D94();
        OUTLINED_FUNCTION_35_1((uint64_t)v20, v37, v38, v36);
        v40 = sub_210C454A4(&qword_254A80898, v39, (uint64_t (*)(uint64_t))type metadata accessor for FullAlignmentTask, (uint64_t)&unk_210ED7FB4);
        v41 = (_QWORD *)OUTLINED_FUNCTION_24_11();
        v41[2] = v2;
        v41[3] = v40;
        v41[4] = a1;
        v41[5] = v2;
        OUTLINED_FUNCTION_34_25();
        v42 = a1;
        sub_210C71218((uint64_t)v20, (uint64_t)&unk_254A808B8, (uint64_t)v41);
        v2[27] = v43;
        return swift_release();
      }
    }
    OUTLINED_FUNCTION_65_1();
    v47 = sub_210E926F8();
    v48 = sub_210E92F98();
    if (os_log_type_enabled(v47, v48))
    {
      v49 = (uint8_t *)OUTLINED_FUNCTION_16_3();
      *(_WORD *)v49 = 0;
      _os_log_impl(&dword_210BD8000, v47, v48, "[FullAlignmentTask]: Ignoring start processing request. Content item ID is not valid.", v49, 2u);
      OUTLINED_FUNCTION_2();
    }

    v45 = *(uint64_t (**)(char *, uint64_t))(v5 + 8);
    v46 = v15;
  }
  return v45(v46, v4);
}

uint64_t sub_210D288F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;

  v5[7] = a4;
  v5[8] = a5;
  v6 = sub_210E92704();
  v5[9] = v6;
  v5[10] = *(_QWORD *)(v6 - 8);
  v5[11] = swift_task_alloc();
  v5[12] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_210D28968()
{
  _QWORD *v0;
  void *v1;
  id v2;
  NSObject *v3;
  os_log_type_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  _QWORD *v15;
  uint64_t (*v17)(uint64_t, uint64_t);
  uint64_t v18;

  v1 = (void *)v0[7];
  OUTLINED_FUNCTION_65_1();
  v2 = v1;
  v3 = sub_210E926F8();
  v4 = sub_210E92F98();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = v0[7];
    v6 = OUTLINED_FUNCTION_16_3();
    v18 = OUTLINED_FUNCTION_16_3();
    *(_DWORD *)v6 = 141558275;
    OUTLINED_FUNCTION_19_22();
    v0[4] = v7;
    v8 = sub_210E93250();
    *(_WORD *)(v6 + 12) = 2081;
    v0[5] = v5;
    OUTLINED_FUNCTION_130(v8, &qword_254A808A8, (void (*)(uint64_t))type metadata accessor for PodcastAVItem);
    v9 = sub_210E93238();
    v0[6] = sub_210C384B0(v9, v10, &v18);
    sub_210E93250();
    swift_bridgeObjectRelease();

    OUTLINED_FUNCTION_74_0(&dword_210BD8000, v3, v4, "[FullAlignmentTask]: Begin processing full alignment for episode: %{private,mask.hash}s", (uint8_t *)v6);
    OUTLINED_FUNCTION_41();
    OUTLINED_FUNCTION_2();
  }
  v11 = v0[12];
  v12 = v0[9];
  v13 = v0[10];

  v14 = *(void (**)(uint64_t, uint64_t))(v13 + 8);
  v14(v11, v12);
  v0[13] = v14;
  v17 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_254A7DEC0 + dword_254A7DEC0);
  v15 = (_QWORD *)swift_task_alloc();
  v0[14] = v15;
  *v15 = v0;
  v15[1] = sub_210D28B60;
  return v17((uint64_t)v17, v0[7]);
}

uint64_t sub_210D28B60()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 120) = v0;
  swift_task_dealloc();
  return OUTLINED_FUNCTION_1_2();
}

uint64_t sub_210D28BC0()
{
  uint64_t (*v0)(void);

  swift_task_dealloc();
  OUTLINED_FUNCTION_63();
  v0 = (uint64_t (*)(void))OUTLINED_FUNCTION_38_1();
  return OUTLINED_FUNCTION_8(v0);
}

uint64_t sub_210D28BEC()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t (*v12)(void);

  v1 = *(void **)(v0 + 120);
  sub_210E926D4();
  v2 = v1;
  v3 = v1;
  v4 = sub_210E926F8();
  v5 = sub_210E92F8C();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = *(void **)(v0 + 120);
    v7 = OUTLINED_FUNCTION_16_3();
    v8 = (_QWORD *)OUTLINED_FUNCTION_16_3();
    OUTLINED_FUNCTION_19_22();
    *(_QWORD *)(v0 + 16) = v9;
    *(_DWORD *)v7 = 141558275;
    sub_210E93250();
    *(_WORD *)(v7 + 12) = 2113;
    v10 = v6;
    v11 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 24) = v11;
    sub_210E93250();
    *v8 = v11;
    OUTLINED_FUNCTION_8_0();
    OUTLINED_FUNCTION_8_0();
    OUTLINED_FUNCTION_74_0(&dword_210BD8000, v4, v5, "[FullAlignmentTask]: Error processing full alignment: %{private,mask.hash}@", (uint8_t *)v7);
    sub_210D2A004(0, (unint64_t *)&qword_253D7F130, (uint64_t)&unk_253D7F120, 0x24BEDCDF0, (void (*)(uint64_t, uint64_t, uint64_t))sub_210C34C74);
    OUTLINED_FUNCTION_41();
    OUTLINED_FUNCTION_2();
  }
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_8_0();

  (*(void (**)(_QWORD, _QWORD))(v0 + 104))(*(_QWORD *)(v0 + 88), *(_QWORD *)(v0 + 72));
  swift_task_dealloc();
  OUTLINED_FUNCTION_63();
  v12 = (uint64_t (*)(void))OUTLINED_FUNCTION_38_1();
  return v12();
}

uint64_t sub_210D28DA8()
{
  uint64_t v0;
  _QWORD v2[4];
  _BYTE v3[24];
  uint64_t v4;

  OUTLINED_FUNCTION_3();
  sub_210D2A100(v0 + 176, (uint64_t)v3);
  if (!v4)
    return sub_210D2A164((uint64_t)v3);
  sub_210C45310((uint64_t)v3, (uint64_t)v2);
  sub_210D2A164((uint64_t)v3);
  __swift_project_boxed_opaque_existential_0Tm(v2, v2[3]);
  OUTLINED_FUNCTION_116();
  sub_210E923BC();
  return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v2);
}

uint64_t sub_210D28E3C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  _QWORD v13[4];
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v1 = v0;
  v2 = OUTLINED_FUNCTION_9_2();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2, v4, v5);
  v7 = (char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_65_1();
  v8 = sub_210E926F8();
  v9 = sub_210E92F98();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)OUTLINED_FUNCTION_16_3();
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_210BD8000, v8, v9, "[FullAlignmentTask]: Reset request. Cleaning up.", v10, 2u);
    OUTLINED_FUNCTION_2();
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v7, v2);
  OUTLINED_FUNCTION_3();
  sub_210D2A100(v1 + 176, (uint64_t)&v14);
  if (*((_QWORD *)&v15 + 1))
  {
    sub_210C45310((uint64_t)&v14, (uint64_t)v13);
    sub_210D2A164((uint64_t)&v14);
    __swift_project_boxed_opaque_existential_0Tm(v13, v13[3]);
    sub_210E923B0();
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v13);
  }
  else
  {
    sub_210D2A164((uint64_t)&v14);
  }
  v16 = 0;
  v14 = 0u;
  v15 = 0u;
  OUTLINED_FUNCTION_3();
  sub_210D2A04C((uint64_t)&v14, v1 + 176);
  v11 = swift_endAccess();
  if (*(_QWORD *)(v1 + 216))
  {
    OUTLINED_FUNCTION_19_17(v11, (unint64_t *)&qword_253D7E900);
    swift_retain();
    sub_210E92E0C();
    swift_release();
  }
  *(_QWORD *)(v1 + 216) = 0;
  swift_release();
  return sub_210D28508(0, 0);
}

uint64_t sub_210D29030(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4[32] = a3;
  v4[33] = v3;
  v4[30] = a1;
  v4[31] = a2;
  sub_210D29EC0(0, &qword_254A80858, MEMORY[0x24BDB9D50]);
  v4[34] = v5;
  v4[35] = *(_QWORD *)(v5 - 8);
  v4[36] = OUTLINED_FUNCTION_103();
  sub_210D29EC0(0, &qword_254A80870, MEMORY[0x24BDB9D38]);
  v4[37] = v6;
  v4[38] = *(_QWORD *)(v6 - 8);
  v4[39] = OUTLINED_FUNCTION_103();
  sub_210E926C8();
  v4[40] = OUTLINED_FUNCTION_103();
  v7 = OUTLINED_FUNCTION_9_2();
  v4[41] = v7;
  v4[42] = *(_QWORD *)(v7 - 8);
  v4[43] = swift_task_alloc();
  v4[44] = swift_task_alloc();
  sub_210D29F3C();
  v4[45] = OUTLINED_FUNCTION_103();
  return OUTLINED_FUNCTION_1_2();
}

uint64_t sub_210D2911C()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t (*v15)(void);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  if (sub_210D29918(*(void **)(v0 + 240)))
  {
    v18 = *(_QWORD *)(v0 + 280);
    v1 = *(_QWORD *)(v0 + 264);
    v17 = *(_QWORD *)(v0 + 272);
    v2 = *(void **)(v0 + 248);
    v16 = *(_QWORD *)(v0 + 288);
    v3 = *(void **)(v0 + 240);
    *(_QWORD *)(v0 + 232) = *(_QWORD *)(v1 + 168);
    sub_210C79434();
    OUTLINED_FUNCTION_22_25(&qword_254A80880, v4, (uint64_t (*)(uint64_t))sub_210C79434, MEMORY[0x24BE73488]);
    v2;
    sub_210E92290();
    objc_msgSend(v3, sel_storeItemInt64ID);
    sub_210E9268C();
    swift_unknownObjectRetain();
    sub_210E926EC();
    sub_210E926BC();
    sub_210C34C74(0, (unint64_t *)&qword_253D7E6B0);
    sub_210E92FBC();
    objc_msgSend(objc_allocWithZone(MEMORY[0x24BE73848]), sel_init);
    v5 = sub_210E925B4();
    swift_allocObject();
    v6 = sub_210E925A8();
    v7 = MEMORY[0x24BE73630];
    *(_QWORD *)(v0 + 368) = v6;
    *(_QWORD *)(v0 + 80) = v5;
    *(_QWORD *)(v0 + 88) = v7;
    *(_QWORD *)(v0 + 56) = v6;
    sub_210D29FA0(v0 + 56, v0 + 96);
    OUTLINED_FUNCTION_3();
    swift_retain();
    sub_210D2A04C(v0 + 96, v1 + 176);
    swift_endAccess();
    *(_QWORD *)(v0 + 200) = sub_210E9259C();
    sub_210D29E34();
    v9 = v8;
    v11 = OUTLINED_FUNCTION_22_25(&qword_254A80868, v10, (uint64_t (*)(uint64_t))sub_210D29E34, MEMORY[0x24BDB9AF8]);
    MEMORY[0x212BD075C](v9, v11);
    swift_release();
    sub_210E9283C();
    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v16, v17);
    *(_QWORD *)(v0 + 376) = sub_210C454A4(&qword_254A80898, v12, (uint64_t (*)(uint64_t))type metadata accessor for FullAlignmentTask, (uint64_t)&unk_210ED7FB4);
    *(_QWORD *)(v0 + 384) = sub_210D2A0B0();
    v13 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 392) = v13;
    *v13 = v0;
    v13[1] = sub_210D29438;
    return sub_210E92D64();
  }
  else
  {
    OUTLINED_FUNCTION_10_32();
    OUTLINED_FUNCTION_63();
    OUTLINED_FUNCTION_15();
    OUTLINED_FUNCTION_49();
    OUTLINED_FUNCTION_58();
    OUTLINED_FUNCTION_77_1();
    v15 = (uint64_t (*)(void))OUTLINED_FUNCTION_38_1();
    return v15();
  }
}

uint64_t sub_210D29438()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  OUTLINED_FUNCTION_31_24();
  OUTLINED_FUNCTION_59(v3);
  if (v1)
  {
    swift_getObjectType();
    sub_210E92D28();
    *(_QWORD *)(v2 + 408) = v0;
  }
  else
  {
    *(_QWORD *)(v2 + 400) = 0;
  }
  return OUTLINED_FUNCTION_1_2();
}

uint64_t sub_210D294BC()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  _QWORD *v3;
  void *v5;
  uint64_t v6;
  uint64_t (*v7)(void);
  void *v8;
  id v9;
  NSObject *v10;
  os_log_type_t v11;
  _BOOL4 v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  uint64_t v22;

  if (*(_QWORD *)(v0 + 40))
  {
    sub_210C45354((__int128 *)(v0 + 16), v0 + 136);
    v1 = OUTLINED_FUNCTION_116();
    sub_210D299B0(v1, v2);
    __swift_destroy_boxed_opaque_existential_0Tm(v0 + 136);
    v3 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 416) = v3;
    *v3 = v0;
    v3[1] = sub_210D29888;
    return sub_210E92D64();
  }
  v5 = *(void **)(v0 + 240);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 304) + 8))(*(_QWORD *)(v0 + 312), *(_QWORD *)(v0 + 296));
  if (!sub_210D29918(v5))
    goto LABEL_9;
  v6 = *(_QWORD *)(v0 + 400);
  sub_210E92E3C();
  if (!v6)
  {
    v8 = *(void **)(v0 + 240);
    OUTLINED_FUNCTION_65_1();
    v9 = v8;
    v10 = sub_210E926F8();
    v11 = sub_210E92F98();
    v12 = os_log_type_enabled(v10, v11);
    v13 = *(void **)(v0 + 240);
    if (v12)
    {
      v14 = OUTLINED_FUNCTION_16_3();
      v22 = OUTLINED_FUNCTION_16_3();
      *(_DWORD *)v14 = 141558275;
      OUTLINED_FUNCTION_19_22();
      *(_QWORD *)(v0 + 216) = v15;
      sub_210E93250();
      *(_WORD *)(v14 + 12) = 2081;
      v16 = objc_msgSend(v13, sel_debugDescription);
      v17 = sub_210E92BA8();
      v19 = v18;

      *(_QWORD *)(v0 + 224) = sub_210C384B0(v17, v19, &v22);
      sub_210E93250();
      swift_bridgeObjectRelease();

      OUTLINED_FUNCTION_74_0(&dword_210BD8000, v10, v11, "[FullAlignmentTask]: Completed transcripts processing for episode: %{private,mask.hash}s", (uint8_t *)v14);
      OUTLINED_FUNCTION_41();
      OUTLINED_FUNCTION_2();
    }

    v20 = OUTLINED_FUNCTION_116();
    v21(v20);
    sub_210D28508(0, 1);
LABEL_9:
    swift_release();
    OUTLINED_FUNCTION_10_32();
    OUTLINED_FUNCTION_63();
    OUTLINED_FUNCTION_15();
    OUTLINED_FUNCTION_49();
    OUTLINED_FUNCTION_58();
    OUTLINED_FUNCTION_77_1();
    v7 = (uint64_t (*)(void))OUTLINED_FUNCTION_38_1();
    return v7();
  }
  swift_release();
  OUTLINED_FUNCTION_21_25();
  OUTLINED_FUNCTION_63();
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_58();
  OUTLINED_FUNCTION_77_1();
  swift_task_dealloc();
  v7 = *(uint64_t (**)(void))(v0 + 8);
  return v7();
}

uint64_t sub_210D297A0(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 208) = *(_QWORD *)(v1 + 408);
  OUTLINED_FUNCTION_19_17(a1, (unint64_t *)&qword_253D7E900);
  swift_willThrowTypedImpl();
  return OUTLINED_FUNCTION_1_2();
}

uint64_t sub_210D29808()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(v0 + 304);
  v1 = *(_QWORD *)(v0 + 312);
  v3 = *(_QWORD *)(v0 + 296);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  OUTLINED_FUNCTION_21_25();
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_49();
  OUTLINED_FUNCTION_58();
  OUTLINED_FUNCTION_77_1();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_210D29888()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;

  OUTLINED_FUNCTION_31_24();
  OUTLINED_FUNCTION_59(v3);
  if (v1)
  {
    if (v2[33])
    {
      swift_getObjectType();
      sub_210E92D28();
    }
    v2[51] = v0;
  }
  else
  {
    v2[50] = 0;
  }
  return OUTLINED_FUNCTION_1_2();
}

BOOL sub_210D29918(void *a1)
{
  uint64_t v1;
  unint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;

  v2 = *(_QWORD *)(v1 + 232);
  if (v2 < 2)
    return 0;
  v4 = *(_QWORD *)(v1 + 224);
  swift_bridgeObjectRetain();
  sub_210D23220(a1);
  if (!v6)
  {
    sub_210C7929C(v4, v2);
    return 0;
  }
  if (v5 != v4 || v6 != v2)
  {
    v8 = sub_210E93544();
    OUTLINED_FUNCTION_33_19();
    return (v8 & 1) != 0;
  }
  OUTLINED_FUNCTION_33_19();
  return 1;
}

uint64_t sub_210D299B0(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  _BYTE v20[40];

  OUTLINED_FUNCTION_130(a1, (unint64_t *)&qword_253D7E630, (void (*)(uint64_t))MEMORY[0x24BEE6990]);
  OUTLINED_FUNCTION_127();
  MEMORY[0x24BDAC7A8](v4, v5, v6);
  v8 = &v20[-v7 - 8];
  v9 = sub_210C45310(a1, (uint64_t)v20);
  OUTLINED_FUNCTION_19_17(v9, &qword_254A80840);
  sub_210E92668();
  result = swift_dynamicCast();
  if ((result & 1) != 0)
  {
    v11 = v19;
    v12 = sub_210E92D94();
    OUTLINED_FUNCTION_35_1((uint64_t)v8, v13, v14, v12);
    sub_210E92D7C();
    v15 = a2;
    swift_retain();
    v16 = sub_210E92D70();
    v17 = (_QWORD *)OUTLINED_FUNCTION_24_11();
    v18 = MEMORY[0x24BEE6930];
    v17[2] = v16;
    v17[3] = v18;
    v17[4] = v15;
    v17[5] = v11;
    sub_210C73A5C((uint64_t)v8, (uint64_t)&unk_254A80850, (uint64_t)v17);
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_210D29ADC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;

  v5[2] = a4;
  v5[3] = a5;
  sub_210E92D7C();
  v5[4] = sub_210E92D70();
  sub_210E92D28();
  return swift_task_switch();
}

uint64_t sub_210D29B48()
{
  uint64_t v0;
  uint64_t v1;

  swift_release();
  v1 = sub_210D29B88();
  sub_210CC385C(v1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_210D29B88()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  char v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void (*v11)(char *, unint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  id v22;
  uint64_t v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v0 = sub_210E92638();
  v27 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0, v1, v2);
  v4 = (char *)&v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_210E9265C();
  v6 = sub_210E92650();
  v7 = sub_210E92644();
  v8 = *(_QWORD *)(v7 + 16);
  if (v8)
  {
    v28 = MEMORY[0x24BEE4AF8];
    sub_210E9340C();
    v9 = v7 + ((*(unsigned __int8 *)(v27 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v27 + 80));
    v10 = *(_QWORD *)(v27 + 72);
    v25 = v7;
    v26 = v10;
    v11 = *(void (**)(char *, unint64_t, uint64_t))(v27 + 16);
    v12 = v5 & 1;
    v13 = v6 & 1;
    do
    {
      v11(v4, v9, v0);
      sub_210E92620();
      v15 = v14;
      sub_210E92620();
      v17 = v16;
      sub_210E9262C();
      v19 = v18;
      sub_210E9262C();
      v21 = v20;
      v22 = objc_allocWithZone(MEMORY[0x24BDDCAE8]);
      objc_msgSend(v22, sel_initWithPlayerStartTime_playerEndTime_referenceStartTime_referenceEndTime_matchedBeginning_matchedEnd_, v12, v13, v15, v17, v19, v21, v25);
      (*(void (**)(char *, uint64_t))(v27 + 8))(v4, v0);
      sub_210E933F4();
      sub_210E93418();
      sub_210E93424();
      sub_210E93400();
      v9 += v26;
      --v8;
    }
    while (v8);
    v23 = v28;
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    return MEMORY[0x24BEE4AF8];
  }
  return v23;
}

uint64_t sub_210D29D4C()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_0Tm(v0 + 112);
  swift_unknownObjectRelease();
  swift_release();
  sub_210D2A164(v0 + 176);
  swift_release();
  sub_210C7929C(*(_QWORD *)(v0 + 224), *(_QWORD *)(v0 + 232));
  swift_defaultActor_destroy();
  return v0;
}

uint64_t sub_210D29D98()
{
  sub_210D29D4C();
  return swift_defaultActor_deallocate();
}

uint64_t type metadata accessor for FullAlignmentTask()
{
  return objc_opt_self();
}

uint64_t sub_210D29DD4()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_4_11(v1);
  return sub_210D29ADC(v2, v3, v4, v5, v6);
}

void sub_210D29E34()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_254A80860)
  {
    sub_210C33488(255, &qword_254A80840);
    sub_210C33488(255, (unint64_t *)&qword_253D7E900);
    v0 = sub_210E927E8();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_254A80860);
  }
}

void sub_210D29EC0(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;

  if (!*a2)
  {
    sub_210D29E34();
    v7 = v6;
    v9 = OUTLINED_FUNCTION_22_25(&qword_254A80868, v8, (uint64_t (*)(uint64_t))sub_210D29E34, MEMORY[0x24BDB9AF8]);
    v10 = a3(a1, v7, v9);
    if (!v11)
      atomic_store(v10, a2);
  }
}

void sub_210D29F3C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_254A80878)
  {
    sub_210E923C8();
    sub_210E92668();
    v0 = sub_210E92308();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_254A80878);
  }
}

uint64_t sub_210D29FA0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_210D2A004(0, &qword_254A80888, (uint64_t)&unk_254A80890, MEMORY[0x24BE733F0], (void (*)(uint64_t, uint64_t, uint64_t))sub_210C33488);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_210D2A004(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t, uint64_t, uint64_t))
{
  unint64_t v6;
  uint64_t v7;

  if (!*a2)
  {
    a5(255, a3, a4);
    v6 = OUTLINED_FUNCTION_124();
    if (!v7)
      atomic_store(v6, a2);
  }
  OUTLINED_FUNCTION_0();
}

uint64_t sub_210D2A04C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_210D2A004(0, &qword_254A80888, (uint64_t)&unk_254A80890, MEMORY[0x24BE733F0], (void (*)(uint64_t, uint64_t, uint64_t))sub_210C33488);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

unint64_t sub_210D2A0B0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254A808A0;
  if (!qword_254A808A0)
  {
    sub_210D29EC0(255, &qword_254A80870, MEMORY[0x24BDB9D38]);
    result = MEMORY[0x212BD2E20](MEMORY[0x24BDB9D48], v1);
    atomic_store(result, (unint64_t *)&qword_254A808A0);
  }
  return result;
}

uint64_t sub_210D2A100(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_210D2A004(0, &qword_254A80888, (uint64_t)&unk_254A80890, MEMORY[0x24BE733F0], (void (*)(uint64_t, uint64_t, uint64_t))sub_210C33488);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_210D2A164(uint64_t a1)
{
  uint64_t v2;

  sub_210D2A004(0, &qword_254A80888, (uint64_t)&unk_254A80890, MEMORY[0x24BE733F0], (void (*)(uint64_t, uint64_t, uint64_t))sub_210C33488);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t objectdestroyTm_3()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_210D2A1F8()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_4_11(v1);
  return sub_210D288F4(v2, v3, v4, v5, v6);
}

uint64_t OUTLINED_FUNCTION_21_25()
{
  return swift_task_dealloc();
}

uint64_t sub_210D2A264(uint64_t a1, char a2, uint64_t a3, char a4, char a5)
{
  uint64_t v10;

  v10 = OUTLINED_FUNCTION_16_0();
  *(_QWORD *)(v10 + 96) = a1;
  *(_BYTE *)(v10 + 104) = a2;
  sub_210D2A2CC(a3, a4, a5);
  return v10;
}

uint64_t sub_210D2A2CC(uint64_t a1, char a2, char a3)
{
  uint64_t v3;

  *(_QWORD *)(v3 + 64) = 0;
  *(_OWORD *)(v3 + 32) = 0u;
  *(_OWORD *)(v3 + 48) = 0u;
  *(_OWORD *)(v3 + 16) = 0u;
  *(_OWORD *)(v3 + 72) = xmmword_210ED2FF0;
  sub_210D2B4BC(a1, v3 + 16);
  swift_retain();
  sub_210C4F008(0, 0, 0, 0, 0, 0, 0, 0x1FFFFFFFEuLL, 0);
  *(_BYTE *)(v3 + 88) = a2;
  *(_BYTE *)(v3 + 89) = a3;
  swift_release();
  return v3;
}

uint64_t sub_210D2A364(uint64_t a1)
{
  int v2;
  int v3;
  int v4;
  unsigned int v5;
  unsigned int v6;
  _WORD v8[25];
  unsigned __int8 v9;
  _BYTE v10[48];
  unsigned __int16 v11;
  unsigned __int8 v12;

  sub_210C7A594(a1, (uint64_t)v8);
  v2 = v9;
  v3 = v8[24];
  sub_210C7A594(a1, (uint64_t)v10);
  v4 = v11 | (v12 << 16);
  LOBYTE(v5) = 1;
  switch(v12 >> 4)
  {
    case 2:
      v12 = BYTE2(v4) & 0xF;
      LOBYTE(v5) = sub_210D2A440();
      break;
    case 3:
      v12 = BYTE2(v4) & 0xF;
      LOBYTE(v5) = sub_210D2B190((void (*)(_QWORD))type metadata accessor for PausedState);
      break;
    case 4:
    case 10:
      return v5 & 1;
    default:
      v6 = ((v3 | (v2 << 16)) >> 20) & 0xF;
      if (v6 > 0xC)
        LOBYTE(v5) = 0;
      else
        v5 = (0x1A81u >> v6) & 1;
      break;
  }
  return v5 & 1;
}

uint64_t sub_210D2A440()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  sub_210C385F4();
  type metadata accessor for PlayingState();
  v0 = swift_dynamicCastClass();
  swift_release();
  if (v0)
    return 1;
  sub_210C385F4();
  type metadata accessor for InitiatingPlaybackState();
  v1 = swift_dynamicCastClass();
  swift_release();
  if (v1)
    return 1;
  sub_210C385F4();
  type metadata accessor for InitialLoadingState();
  v4 = swift_dynamicCastClass();
  if (v4)
    v2 = *(unsigned __int8 *)(v4 + 64);
  else
    v2 = 0;
  swift_release();
  return v2;
}

uint64_t sub_210D2A4F8(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t result;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  char v25;

  v2 = v1 + 16;
  v3 = *(_QWORD *)(v1 + 72);
  v4 = *(_QWORD *)(v1 + 80);
  sub_210D2B4BC((uint64_t)a1, v2);
  v6 = OUTLINED_FUNCTION_5_30();
  sub_210C4E818(v6, v7, v8, v9, v10, v11, v12, v13, v24);
  sub_210D2B548(a1);
  result = OUTLINED_FUNCTION_1_41();
  if (v3 >> 1 != 0xFFFFFFFF || (v4 & 3) != 0)
  {
    if ((v4 & 3) == 0)
    {
      v16 = OUTLINED_FUNCTION_5_30();
      sub_210D2B58C(v16, v17, v18, v19, v20, v21, v22, v23, v25);
      sub_210D3716C();
      OUTLINED_FUNCTION_1_41();
    }
    return OUTLINED_FUNCTION_1_41();
  }
  return result;
}

uint64_t sub_210D2A5E4(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
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
  void *v28;
  char v29;
  uint64_t v30;
  double v31;
  __int16 v32;
  id v33;
  uint64_t v35;
  id v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  double v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60[4];
  __int16 v61;
  BOOL v62;
  __int128 v63;

  sub_210C7A594(a1, (uint64_t)&v46);
  v4 = v47;
  v5 = v49;
  v6 = v50;
  sub_210C7A594(a1, (uint64_t)&v53);
  v7 = (unsigned __int16)v59 | (BYTE2(v59) << 16);
  switch(BYTE2(v59) >> 4)
  {
    case 2:
      OUTLINED_FUNCTION_20_21();
      if (sub_210D2B190((void (*)(_QWORD))type metadata accessor for PausedState))
      {
        OUTLINED_FUNCTION_14_28();
        swift_bridgeObjectRetain();
        v8 = sub_210C4E578(v5);
        OUTLINED_FUNCTION_17_24(v8, v9, v10, v11, v12, v13, v14, v15, v35, v38, v39, v41, v43, v45, v46, (uint64_t)v47, v48, v49, v50,
          v51,
          v52,
          *(uint64_t *)&v53,
          (uint64_t)v54,
          v55,
          v56,
          v57,
          v58,
          v59,
          v60[0]);
        sub_210D2B5CC(a1);
      }
      else if ((sub_210D2A440() & 1) != 0)
      {
        OUTLINED_FUNCTION_31_25();
        v63 = xmmword_210ED2FF0;
        sub_210D2A4F8(v60);
      }
      sub_210D3716C();
      goto LABEL_20;
    case 3:
      v44 = a2;
      BYTE2(v59) = BYTE2(v7) & 0xF;
      v17 = v56;
      v18 = v57;
      if ((unint64_t)v54 >= 0xB)
      {
        v31 = v53;
        if (BYTE1(v59))
          v32 = 256;
        else
          v32 = 0;
        v60[0] = v55;
        v60[1] = v56;
        v60[2] = v57;
        v60[3] = v58;
        v62 = BYTE2(v59) != 0;
        v61 = v32 & 0xFFFE | v7 & 1;
        v33 = v54;
        type metadata accessor for PausedState();
        OUTLINED_FUNCTION_16_0();
        OUTLINED_FUNCTION_21_26(v33);
        OUTLINED_FUNCTION_28_26();
        OUTLINED_FUNCTION_21_26(v33);
        OUTLINED_FUNCTION_28_26();
        sub_210CB713C(0, (uint64_t)v33, (uint64_t)v60, v31);
        sub_210C386CC();
      }
      v36 = v54;
      v42 = v58;
      sub_210C4E588(v54);
      swift_bridgeObjectRetain();
      sub_210C4E578(v18);
      if ((sub_210D2A440() & 1) != 0)
      {
        OUTLINED_FUNCTION_14_28();
        sub_210C4E588(v4);
        swift_bridgeObjectRetain();
        v19 = sub_210C4E578(v6);
        OUTLINED_FUNCTION_17_24(v19, v20, v21, v22, v23, v24, v25, v26, (uint64_t)v36, v17, v18, v42, v44, v45, v46, (uint64_t)v47, v48, v49, v50,
          v51,
          v52,
          *(uint64_t *)&v53,
          (uint64_t)v54,
          v55,
          v56,
          v57,
          v58,
          v59,
          v60[0]);
        sub_210D2B5CC(a1);
        v27 = v40;
        v28 = v37;
      }
      else
      {
        v27 = v18;
        v28 = v36;
        if (sub_210D2B190((void (*)(_QWORD))type metadata accessor for PausedState))
        {
          OUTLINED_FUNCTION_31_25();
          v63 = xmmword_210ED2FF0;
          sub_210D2A4F8(v60);
        }
      }
      sub_210D3716C();
      sub_210C4ED50(v28);
      swift_bridgeObjectRelease();
      v30 = v27;
      goto LABEL_19;
    case 4:
      OUTLINED_FUNCTION_20_21();
      v16 = v56;
      OUTLINED_FUNCTION_3_35();
      OUTLINED_FUNCTION_23_20(v16);
      sub_210CB8518();
      goto LABEL_10;
    case 10:
      OUTLINED_FUNCTION_20_21();
      v16 = v56;
      OUTLINED_FUNCTION_3_35();
      OUTLINED_FUNCTION_23_20(v16);
      sub_210CB94CC();
LABEL_10:
      sub_210D3716C();
      swift_bridgeObjectRelease();
      v30 = v16;
LABEL_19:
      sub_210C4ED40(v30);
LABEL_20:
      v29 = 1;
      break;
    default:
      v29 = sub_210D36D3C(a1);
      break;
  }
  return v29 & 1;
}

uint64_t sub_210D2A970(const void *a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v4;
  int v5;
  char v6;
  char v7;
  id v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unsigned int v18;
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
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char v41;
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
  char v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v74;
  __int16 v75;
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
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  char v99;
  uint64_t v100;
  char v101;
  uint64_t v102;
  int v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  _QWORD v108[2];
  uint64_t v109;
  unint64_t v110;
  _QWORD v111[4];
  __int16 v112;
  char v113;
  _QWORD v114[8];

  v2 = v1;
  sub_210C6FC64(a1, v108);
  v4 = (void *)v108[1];
  sub_210C6FC64(a1, &v109);
  v5 = (v110 >> 59) & 0x1E | (v110 >> 2) & 1;
  if (v5 == 3)
  {
    OUTLINED_FUNCTION_16_29();
    swift_unknownObjectRetain();
    OUTLINED_FUNCTION_0_20();
    v9 = *(_QWORD *)(v1 + 16);
    v10 = *(void **)(v2 + 24);
    v12 = *(_QWORD *)(v2 + 32);
    v11 = *(_QWORD *)(v2 + 40);
    v14 = *(_QWORD *)(v2 + 48);
    v13 = *(_QWORD *)(v2 + 56);
    v15 = *(_QWORD *)(v2 + 64);
    v16 = *(_QWORD *)(v2 + 72);
    v17 = *(_QWORD *)(v2 + 80);
    if (v16 >> 1 != 0xFFFFFFFF || (v17 & 3) != 0)
    {
      if ((v17 & 3) == 3)
      {
        if (v11 >> 61 == 1)
        {
          OUTLINED_FUNCTION_2_33();
          v44 = v43;
          OUTLINED_FUNCTION_29_24(v45, v46, v47, v48, v49, v51, v43, v50, v17);
          v52 = OUTLINED_FUNCTION_7_29();
          OUTLINED_FUNCTION_18_18(v52, v53, v54, v55, v56, v57, v44, v58, v17);
          v59 = OUTLINED_FUNCTION_9_28();
          OUTLINED_FUNCTION_18_18(v59, v60, v61, v62, v63, v9, v44, v64, v17);
          swift_release();
          swift_bridgeObjectRelease();
          OUTLINED_FUNCTION_9_28();
          sub_210CB8758();
          type metadata accessor for InitiatingPlaybackState();
          memset(v114, 0, 35);
          OUTLINED_FUNCTION_16_0();
          sub_210CD7638(1, (uint64_t)v114);
          OUTLINED_FUNCTION_27();
        }
      }
      else if ((v17 & 3) == 0)
      {
        v18 = (v15 >> 20) & 0xF;
        if (v18 == 2)
        {
          v102 = HIDWORD(v9) & 1;
          v114[0] = v10;
          v114[1] = v12;
          v114[2] = v11;
          v114[3] = v14;
          LOWORD(v114[4]) = v13 & 0x101;
          HIDWORD(v100) = WORD1(v13) & 1;
          BYTE2(v114[4]) = BYTE2(v13) & 1;
          v107 = v9;
          OUTLINED_FUNCTION_2_33();
          v75 = v74;
          v77 = v76;
          v105 = v76;
          v84 = OUTLINED_FUNCTION_18_18(v78, v79, v80, v81, v82, v74, v76, v83, v17);
          v92 = OUTLINED_FUNCTION_13_23(v84, v85, v86, v87, v88, v89, v90, v91, v17, (uint64_t)sub_210C4E4CC, (uint64_t)sub_210C4E598, (uint64_t)sub_210C4E750, (uint64_t)sub_210C4E76C, v100, v102, v104, v105, v106, v107);
          OUTLINED_FUNCTION_18_18(v92, v93, v94, v95, v96, v97, v77, v98, v99);
          sub_210CB8518();
          v111[0] = v10;
          v111[1] = v12;
          v111[2] = v11;
          v111[3] = v14;
          v113 = v101;
          v112 = v75 & 0x101;
          type metadata accessor for InitiatingPlaybackState();
          OUTLINED_FUNCTION_16_0();
          swift_bridgeObjectRetain();
          OUTLINED_FUNCTION_23_20(v11);
          sub_210CD7638(v103, (uint64_t)v111);
          OUTLINED_FUNCTION_27();
        }
        if (v18 == 3)
        {
          v114[0] = v12;
          v114[1] = v11;
          v114[2] = v14;
          v114[3] = v13;
          BYTE2(v114[4]) = BYTE2(v15) & 1;
          LOWORD(v114[4]) = v15 & 0x101;
          v19 = v15;
          type metadata accessor for PausedState();
          OUTLINED_FUNCTION_16_0();
          v20 = OUTLINED_FUNCTION_7_29();
          OUTLINED_FUNCTION_29_24(v20, v21, v22, v23, v24, v25, v19, v26, v17);
          OUTLINED_FUNCTION_2_33();
          OUTLINED_FUNCTION_29_24(v27, v28, v29, v30, v31, v9, v19, v32, v17);
          OUTLINED_FUNCTION_21_26(v10);
          sub_210C4E578(v14);
          sub_210CB713C(0, (uint64_t)v10, (uint64_t)v114, *(double *)&v9);
          OUTLINED_FUNCTION_27();
        }
      }
    }
    sub_210C385F4();
    type metadata accessor for PlayingState();
    v65 = swift_dynamicCastClass();
    if (v65)
    {
      v66 = v65;
      sub_210CB97BC();
      if ((v67 & 1) != 0)
      {
        v69 = *(_QWORD *)(v66 + 24);
        v68 = *(_QWORD *)(v66 + 32);
        swift_getObjectType();
        swift_bridgeObjectRetain();
        v70 = OUTLINED_FUNCTION_26_22();
        if (v68)
        {
          if (v69 != v70 || v68 != v71)
            OUTLINED_FUNCTION_93();
          swift_bridgeObjectRelease();
        }
        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_27_21();
        type metadata accessor for StallingState();
        OUTLINED_FUNCTION_16_0();
        sub_210CB8588();
      }
    }
    swift_release();
    OUTLINED_FUNCTION_27_21();
    goto LABEL_37;
  }
  if (v5 != 19)
  {
    if (v5 == 5)
    {
      OUTLINED_FUNCTION_16_29();
      OUTLINED_FUNCTION_0_20();
      sub_210CB891C();
      v6 = *(_BYTE *)(v1 + 88);
      v7 = *(_BYTE *)(v2 + 89);
      type metadata accessor for ErrorResolutionState();
      OUTLINED_FUNCTION_16_0();
      sub_210D27A0C(a1, v6, v7, 1);
      swift_unknownObjectRetain();
      v8 = v4;
      swift_retain();
      OUTLINED_FUNCTION_25_27();
    }
    goto LABEL_20;
  }
  OUTLINED_FUNCTION_16_29();
  swift_getObjectType();
  swift_unknownObjectRetain();
  v33 = OUTLINED_FUNCTION_26_22();
  v35 = v34;
  sub_210CB88B4();
  if (!v36)
  {
    OUTLINED_FUNCTION_43_0();
    swift_bridgeObjectRelease();
    goto LABEL_20;
  }
  swift_getObjectType();
  v37 = sub_210D10C80();
  v39 = v38;
  swift_unknownObjectRelease();
  if (v33 == v37 && v35 == v39)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_22;
  }
  v41 = OUTLINED_FUNCTION_93();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v41 & 1) != 0)
  {
LABEL_22:
    OUTLINED_FUNCTION_0_20();
LABEL_37:
    OUTLINED_FUNCTION_43_0();
    v42 = 1;
    return v42 & 1;
  }
  OUTLINED_FUNCTION_43_0();
LABEL_20:
  v42 = sub_210D36F2C(a1);
  return v42 & 1;
}

void sub_210D2B020(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _OWORD v19[3];

  v5 = v4;
  if (a4 >> 61 == 1)
  {
    if (sub_210D2B190((void (*)(_QWORD))type metadata accessor for InterruptedState))
    {
      OUTLINED_FUNCTION_8_29();
      v10 = v4[3];
      v11 = v5[4];
      v12 = v5[5];
      v13 = v5[6];
      v17 = v5[7];
      v18 = v5[2];
      v14 = v5[10];
      v15 = v5[9];
      v16 = v5[8];
      v5[2] = a1;
      v5[3] = a2;
      v5[4] = a3;
      v5[5] = a4;
      *((_OWORD *)v5 + 3) = 0u;
      *((_OWORD *)v5 + 4) = 0u;
      v5[10] = 3;
      swift_bridgeObjectRetain();
      swift_retain();
      sub_210C4F008(v18, v10, v11, v12, v13, v17, v16, v15, v14);
      return;
    }
LABEL_8:
    sub_210D36FD8(a1, a2, a3, a4);
    return;
  }
  if (a4 >> 61 != 3)
    goto LABEL_8;
  OUTLINED_FUNCTION_8_29();
  if ((a1 & 1) != 0)
  {
    type metadata accessor for PausedState();
    memset(v19, 0, 35);
    OUTLINED_FUNCTION_16_0();
    sub_210CB713C(0, 4, (uint64_t)v19, 0.0);
    OUTLINED_FUNCTION_27();
  }
}

BOOL sub_210D2B190(void (*a1)(_QWORD))
{
  _BOOL8 v2;

  sub_210C385F4();
  a1(0);
  v2 = swift_dynamicCastClass() != 0;
  swift_release();
  return v2;
}

unint64_t sub_210D2B1DC()
{
  return OUTLINED_FUNCTION_14_24(18);
}

uint64_t sub_210D2B1F4()
{
  return OUTLINED_FUNCTION_0_39();
}

uint64_t sub_210D2B210()
{
  OUTLINED_FUNCTION_0_39();
  return OUTLINED_FUNCTION_12_29();
}

uint64_t type metadata accessor for ChangingQueueState()
{
  return objc_opt_self();
}

void sub_210D2B254()
{
  uint64_t v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
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
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char __src[184];

  *(_QWORD *)__src = v0;
  v1 = sub_210C7A5D0((uint64_t)__src);
  OUTLINED_FUNCTION_45(v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19,
    v20,
    v21,
    v22,
    v23,
    v24,
    v25,
    v26,
    v27,
    v28,
    v29,
    v30,
    v31,
    __src[0]);
  sub_210C38688();
  sub_210CB9B14(*(unsigned __int8 *)(v0 + 90));
  OUTLINED_FUNCTION_15_29();
}

uint64_t sub_210D2B298(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3;
  uint64_t v7[9];

  if (a3 == 1)
  {
    OUTLINED_FUNCTION_27_21();
    sub_210D2B4BC(v3 + 16, (uint64_t)v7);
    type metadata accessor for ResettingQueueState();
    *(_BYTE *)(OUTLINED_FUNCTION_16_0() + 90) = a1 & 1;
    sub_210D2B548(v7);
    sub_210D2A2CC((uint64_t)v7, 0, 0);
    OUTLINED_FUNCTION_25_27();
  }
  if (a3 == 2)
  {
    type metadata accessor for EndOfQueueState();
    swift_bridgeObjectRetain();
    sub_210CC188C(a1, a2);
    OUTLINED_FUNCTION_27();
  }
  return sub_210D37218(a1, a2, a3);
}

unint64_t sub_210D2B390()
{
  return OUTLINED_FUNCTION_14_24(19);
}

uint64_t sub_210D2B3A8()
{
  OUTLINED_FUNCTION_0_39();
  return OUTLINED_FUNCTION_12_29();
}

uint64_t type metadata accessor for ResettingQueueState()
{
  return objc_opt_self();
}

void sub_210D2B3EC()
{
  uint64_t v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
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
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char __src[184];

  *(_QWORD *)__src = v0;
  v1 = sub_210C7A5D0((uint64_t)__src);
  OUTLINED_FUNCTION_45(v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19,
    v20,
    v21,
    v22,
    v23,
    v24,
    v25,
    v26,
    v27,
    v28,
    v29,
    v30,
    v31,
    __src[0]);
  sub_210C38688();
  sub_210CB9A7C();
  OUTLINED_FUNCTION_15_29();
}

unint64_t sub_210D2B434()
{
  return OUTLINED_FUNCTION_14_24(24);
}

uint64_t sub_210D2B44C()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_210D2B454()
{
  uint64_t v0;

  OUTLINED_FUNCTION_0_39();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_210D2B47C()
{
  sub_210D2B454();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ChangingCurrentItemState()
{
  return objc_opt_self();
}

uint64_t sub_210D2B4BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_210D2B500();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_210D2B500()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_253D7B0E8)
  {
    v0 = sub_210E93244();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_253D7B0E8);
  }
}

uint64_t *sub_210D2B548(uint64_t *a1)
{
  sub_210C4E818(*a1, a1[1], a1[2], a1[3], a1[4], a1[5], a1[6], a1[7], a1[8]);
  return a1;
}

uint64_t sub_210D2B58C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return ((uint64_t (*)())((char *)sub_210D2B5B4 + 4 * byte_210ED7FF6[a9 & 3]))();
}

uint64_t sub_210D2B5C0@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t)@<X8>)
{
  return a2(a1);
}

uint64_t sub_210D2B5CC(uint64_t a1)
{
  sub_210C4EC6C(*(_QWORD *)a1, *(void **)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned __int16 *)(a1 + 48) | (*(unsigned __int8 *)(a1 + 50) << 16));
  return a1;
}

uint64_t OUTLINED_FUNCTION_21_26(void *a1)
{
  sub_210C4E588(a1);
  return swift_bridgeObjectRetain();
}

uint64_t sub_210D2B620()
{
  uint64_t v0;

  if (qword_253D7EED0 != -1)
    swift_once();
  v0 = sub_210E92704();
  return __swift_project_value_buffer(v0, (uint64_t)qword_253D81968);
}

uint64_t sub_210D2B668()
{
  uint64_t result;

  sub_210C345E0();
  result = sub_210E9322C();
  qword_254A8E2B0 = result;
  return result;
}

uint64_t sub_210D2B6CC()
{
  uint64_t result;

  sub_210C345E0();
  result = sub_210E9322C();
  qword_254A8E2B8 = result;
  return result;
}

uint64_t sub_210D2B730()
{
  uint64_t result;

  sub_210C345E0();
  result = sub_210E9322C();
  qword_253D81908 = result;
  return result;
}

uint64_t sub_210D2B784()
{
  uint64_t result;

  sub_210C345E0();
  result = sub_210E9322C();
  qword_253D81898 = result;
  return result;
}

uint64_t sub_210D2B7E8()
{
  uint64_t result;

  sub_210C345E0();
  result = sub_210E9322C();
  qword_254A8E2C0 = result;
  return result;
}

uint64_t sub_210D2B850(uint64_t a1)
{
  return sub_210D2B928(a1, qword_254A8E2C8, &qword_254A7CDB0, (id *)&qword_254A8E2B0);
}

uint64_t sub_210D2B874(uint64_t a1)
{
  return sub_210D2B928(a1, qword_254A8E2E0, &qword_254A7CDB8, (id *)&qword_254A8E2B8);
}

uint64_t sub_210D2B898(uint64_t a1)
{
  return sub_210D2B928(a1, qword_253D81928, qword_253D7EE30, (id *)&qword_253D81908);
}

uint64_t sub_210D2B8BC(uint64_t a1)
{
  return sub_210D2B928(a1, qword_253D81968, &qword_253D7F138, (id *)&qword_253D81948);
}

uint64_t sub_210D2B8E0(uint64_t a1)
{
  return sub_210D2B928(a1, qword_253D818A0, &qword_253D7B518, (id *)&qword_253D81898);
}

uint64_t sub_210D2B904(uint64_t a1)
{
  return sub_210D2B928(a1, qword_254A8E2F8, &qword_254A7CDC0, (id *)&qword_254A8E2C0);
}

uint64_t sub_210D2B928(uint64_t a1, uint64_t *a2, _QWORD *a3, id *a4)
{
  uint64_t v7;
  id v8;

  v7 = sub_210E92704();
  __swift_allocate_value_buffer(v7, a2);
  __swift_project_value_buffer(v7, (uint64_t)a2);
  if (*a3 != -1)
    swift_once();
  v8 = *a4;
  return sub_210E92710();
}

uint64_t sub_210D2B9D0()
{
  return swift_unknownObjectRetain();
}

void sub_210D2BA3C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;

  v1 = OUTLINED_FUNCTION_3_36();
  v2 = (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v1, v0);
  if (v2)
  {
    v3 = (void *)v2;
    swift_bridgeObjectRetain();

  }
  OUTLINED_FUNCTION_0();
}

uint64_t sub_210D2BACC()
{
  uint64_t v0;
  uint64_t v1;

  v1 = OUTLINED_FUNCTION_3_36();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 16))(v1, v0) & 1;
}

void TranscriptAlignmentController.__allocating_init(playbackEngine:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  TranscriptAlignmentController.init(playbackEngine:)(a1);
  OUTLINED_FUNCTION_0();
}

id TranscriptAlignmentController.init(playbackEngine:)(void *a1)
{
  void *v1;
  char *v3;
  id v4;
  id v5;
  char *v6;
  id v7;
  objc_super v9;

  objc_allocWithZone((Class)type metadata accessor for AssetReaderImplementation());
  v3 = v1;
  v4 = a1;
  v5 = sub_210C734FC();
  v6 = &v3[OBJC_IVAR____MPCTranscriptAlignmentController_platformImplementation];
  *(_QWORD *)v6 = v5;
  *((_QWORD *)v6 + 1) = &off_24CAA6C58;

  v9.receiver = v3;
  v9.super_class = (Class)type metadata accessor for TranscriptAlignmentController();
  v7 = objc_msgSendSuper2(&v9, sel_init);

  return v7;
}

uint64_t type metadata accessor for TranscriptAlignmentController()
{
  return objc_opt_self();
}

uint64_t sub_210D2BC08()
{
  uint64_t v0;
  uint64_t v1;

  v1 = OUTLINED_FUNCTION_3_36();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 24))(v1, v0);
}

uint64_t sub_210D2BC70(double a1, double a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)(v3 + 32) = v2;
  *(double *)(v3 + 16) = a1;
  *(double *)(v3 + 24) = a2;
  return swift_task_switch();
}

uint64_t sub_210D2BC8C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t, uint64_t, double, double);

  v2 = OUTLINED_FUNCTION_3_36();
  v3 = (_QWORD *)OUTLINED_FUNCTION_15_1();
  *(_QWORD *)(v1 + 40) = v3;
  *v3 = v1;
  v3[1] = sub_210D2BCFC;
  return v5(v2, v0, *(double *)(v1 + 16), *(double *)(v1 + 24));
}

uint64_t sub_210D2BCFC()
{
  uint64_t v0;

  OUTLINED_FUNCTION_5_31();
  OUTLINED_FUNCTION_10_7();
  return OUTLINED_FUNCTION_23(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_210D2BD9C(const void *a1, void *a2, double a3, double a4)
{
  _QWORD *v4;
  _QWORD *v8;

  v4[2] = a2;
  v4[3] = _Block_copy(a1);
  a2;
  v8 = (_QWORD *)swift_task_alloc();
  v4[4] = v8;
  *v8 = v4;
  v8[1] = sub_210D2BE14;
  return sub_210D2BC70(a3, a4);
}

uint64_t sub_210D2BE14()
{
  uint64_t v0;
  double v1;
  uint64_t v2;
  void (**v3)(_QWORD, double);
  void *v4;

  OUTLINED_FUNCTION_5_31();
  v3 = *(void (***)(_QWORD, double))(v2 + 24);
  v4 = *(void **)(v2 + 16);
  OUTLINED_FUNCTION_10_7();

  v3[2](v3, v1);
  _Block_release(v3);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

id TranscriptAlignmentController.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void TranscriptAlignmentController.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id TranscriptAlignmentController.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TranscriptAlignmentController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for TranscriptAlignmentController()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of TranscriptAlignmentController.eventConsumer.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x58))();
}

uint64_t dispatch thunk of TranscriptAlignmentController.transcriptAlignments.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x60))();
}

uint64_t dispatch thunk of TranscriptAlignmentController.isEnabled.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x68))();
}

uint64_t dispatch thunk of TranscriptAlignmentController.__allocating_init(playbackEngine:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of TranscriptAlignmentController.startProcessing()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of TranscriptAlignmentController.resolve(with:referenceTime:)()
{
  uint64_t v0;
  _QWORD *v1;
  double v2;
  uint64_t (*v4)(double);

  v1 = (_QWORD *)OUTLINED_FUNCTION_15_1();
  *(_QWORD *)(v0 + 16) = v1;
  v2 = OUTLINED_FUNCTION_9_29(v1, (uint64_t)sub_210D2C70C);
  return v4(v2);
}

void sub_210D2BFF0()
{
  uint64_t v0;
  id v1;

  v1 = objc_retain(*(id *)(v0
                         + OBJC_IVAR____TtCC17MediaPlaybackCore29TranscriptAlignmentController13Unimplemented_currentItem));
  OUTLINED_FUNCTION_0();
}

uint64_t sub_210D2C018()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0
                            + OBJC_IVAR____TtCC17MediaPlaybackCore29TranscriptAlignmentController13Unimplemented_isEnabled);
}

uint64_t sub_210D2C028()
{
  uint64_t v0;

  return sub_210D2C1F0(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_210D2C038()
{
  uint64_t v0;

  v0 = qword_254A80A20;
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t sub_210D2C0A0(uint64_t a1, uint64_t a2)
{
  qword_254A80A20 = a1;
  qword_254A80A28 = a2;
  return swift_bridgeObjectRelease();
}

id sub_210D2C0DC()
{
  _BYTE *v0;
  objc_class *ObjectType;
  objc_super v3;

  ObjectType = (objc_class *)swift_getObjectType();
  *(_QWORD *)&v0[OBJC_IVAR____TtCC17MediaPlaybackCore29TranscriptAlignmentController13Unimplemented_currentItem] = 0;
  v0[OBJC_IVAR____TtCC17MediaPlaybackCore29TranscriptAlignmentController13Unimplemented_isEnabled] = 0;
  v3.receiver = v0;
  v3.super_class = ObjectType;
  return objc_msgSendSuper2(&v3, sel_init);
}

uint64_t type metadata accessor for TranscriptAlignmentController.Unimplemented()
{
  return objc_opt_self();
}

uint64_t sub_210D2C180()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_210D2C1C4;
  return sub_210D2C028();
}

uint64_t sub_210D2C1C4()
{
  uint64_t v0;

  OUTLINED_FUNCTION_14_0();
  return OUTLINED_FUNCTION_23(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_210D2C1F0(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_210D2C1F8()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 32));

  return swift_deallocObject();
}

uint64_t sub_210D2C224()
{
  double *v0;
  uint64_t v1;
  double v2;
  double v3;
  const void *v4;
  void *v5;
  _QWORD *v6;

  v2 = v0[2];
  v3 = v0[3];
  v4 = (const void *)*((_QWORD *)v0 + 4);
  v5 = (void *)*((_QWORD *)v0 + 5);
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v6;
  *v6 = v1;
  v6[1] = sub_210C3BED8;
  return ((uint64_t (*)(const void *, void *, double, double))((char *)&dword_254A80B00 + dword_254A80B00))(v4, v5, v2, v3);
}

uint64_t sub_210D2C29C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v4;
  *v4 = v3;
  v4[1] = sub_210C65DCC;
  return v6();
}

uint64_t sub_210D2C2F4()
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
  v5[1] = sub_210C65DCC;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_254A80B18 + dword_254A80B18))(v2, v3, v4);
}

uint64_t sub_210D2C36C(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(void);

  v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v5;
  *v5 = v4;
  v5[1] = sub_210C65DCC;
  return v7();
}

uint64_t objectdestroy_8Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_210D2C3F0(uint64_t a1)
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
  v7[1] = sub_210C65DCC;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_254A80B28 + dword_254A80B28))(a1, v4, v5, v6);
}

uint64_t sub_210D2C474(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_210E92D94();
  if (__swift_getEnumTagSinglePayload(a1, 1, v6) == 1)
  {
    sub_210C36644(a1);
  }
  else
  {
    sub_210E92D88();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(a1, v6);
  }
  if (*(_QWORD *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_210E92D28();
    swift_unknownObjectRelease();
  }
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a2;
  *(_QWORD *)(v7 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_210D2C5B0(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_210D2C614;
  return v6(a1);
}

uint64_t sub_210D2C614()
{
  uint64_t v0;

  OUTLINED_FUNCTION_14_0();
  return OUTLINED_FUNCTION_8(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_210D2C63C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_210D2C660(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_210C72DE4;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_254A80B38 + dword_254A80B38))(a1, v4);
}

unint64_t sub_210D2C6D0()
{
  unint64_t result;

  result = qword_254A7ED80;
  if (!qword_254A7ED80)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_254A7ED80);
  }
  return result;
}

void sub_210D2C710()
{
  unint64_t v0;
  unint64_t v1;

  sub_210E93244();
  if (v0 <= 0x3F)
  {
    sub_210C33834(319, (unint64_t *)&qword_254A80BD0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    if (v1 <= 0x3F)
      swift_initClassMetadata2();
  }
}

uint64_t sub_210D2C7E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t result;
  unint64_t v14;
  uint64_t v15;

  v3 = BYTE4(a3);
  v5 = a3 & 0x7FFFFFFF;
  v6 = &unk_24CAA4C88;
  v7 = (_QWORD *)MEMORY[0x24BEE4AF8];
  if ((a3 & 0x7FFFFFFF) == 0)
    v6 = (_QWORD *)MEMORY[0x24BEE4AF8];
  if ((a3 & 0x100000000) != 0)
    v8 = v6;
  else
    v8 = &unk_24CAA4C50;
  v9 = v8[2];
  swift_bridgeObjectRelease();
  if (!v9)
    return 0;
  v10 = &unk_24CAA4C08;
  if (!v5)
    v10 = v7;
  if ((v3 & 1) != 0)
    v11 = v10;
  else
    v11 = &unk_24CAA4BD0;
  v12 = v11[2];
  result = swift_bridgeObjectRelease();
  v14 = v12 - 1;
  if (v12 - 1 >= a1)
    v14 = a1;
  if ((v14 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v14 < v11[2])
  {
    v15 = v11[v14 + 4];
    swift_bridgeObjectRelease();
    return v15;
  }
  __break(1u);
  return result;
}

void sub_210D2C8CC(uint64_t a1, uint64_t a2, unint64_t a3)
{
  unsigned int v3;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  unint64_t v10;

  v3 = a3;
  v6 = HIDWORD(a3) & 1;
  v7 = &unk_24CAA4D28;
  if ((a3 & 0x7FFFFFFF) == 0)
    v7 = &unk_24CAA4D00;
  if ((a3 & 0x100000000) != 0)
    v8 = v7;
  else
    v8 = &unk_24CAA4CD0;
  v9 = v8[2];
  swift_bridgeObjectRelease();
  v10 = v9 - 1;
  if (v9 - 1 >= a1)
    v10 = a1;
  if ((v10 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v10 < v8[2])
  {
    swift_bridgeObjectRelease();
    sub_210D2C990(a2, v3 | (unint64_t)(v6 << 32));
    return;
  }
  __break(1u);
}

float sub_210D2C990(uint64_t a1, uint64_t a2)
{
  float v2;
  float v3;
  float v4;
  float v5;
  float result;

  v2 = -1.0;
  if (a1 == 1)
    v3 = 1.0;
  else
    v3 = -1.0;
  if (a1 == 1)
    v4 = *(float *)&a2;
  else
    v4 = -*(float *)&a2;
  if (*(float *)&a2 != 0.0)
    v3 = v4;
  if (a1 == 1)
  {
    v2 = 1.0;
    v5 = *(float *)&a2;
  }
  else
  {
    v5 = -*(float *)&a2;
  }
  if (*(float *)&a2 == 0.0)
    result = v2;
  else
    result = v5;
  if ((a2 & 0x100000000) != 0)
    return v3;
  return result;
}

uint64_t sub_210D2C9D4(uint64_t a1, uint64_t a2, unint64_t a3, void *a4, int a5, uint64_t a6)
{
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  _QWORD v21[6];

  v12 = *(_QWORD *)(a6 - 8);
  MEMORY[0x24BDAC7A8](a1, a2, a3);
  v14 = (char *)v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = type metadata accessor for RateScanningSubscription(0, v16, v17, v15);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, a1, a6);
  v19 = sub_210D2CAE8((uint64_t)v14, a2, a3 | ((HIDWORD(a3) & 1) << 32), (uint64_t)a4, a5);
  v21[3] = v18;
  v21[4] = MEMORY[0x212BD2E20](&unk_210ED822C, v18);
  v21[0] = v19;
  sub_210E927AC();
  return __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v21);
}

uint64_t *sub_210D2CAE8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, int a5)
{
  swift_allocObject();
  return sub_210D2CB94(a1, a2, a3 | ((HIDWORD(a3) & 1) << 32), a4, a5);
}

uint64_t sub_210D2CB60(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_210D2C9D4(a1, *(_QWORD *)v2, *(unsigned int *)(v2 + 8) | ((unint64_t)*(unsigned __int8 *)(v2 + 12) << 32), *(void **)(v2 + 16), *(unsigned __int8 *)(v2 + 24), a2);
}

uint64_t *sub_210D2CB94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  uint64_t *v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  _OWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v24;
  int v25;
  uint64_t v26;

  v25 = a5;
  v26 = a1;
  v9 = *v5;
  v10 = *(_QWORD *)(*v5 + 80);
  v11 = sub_210E93244();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11, v13, v14);
  v16 = (char *)&v24 - v15;
  __swift_storeEnumTagSinglePayload((uint64_t)v5 + *(_QWORD *)(v9 + 104), 1, 1, v10);
  v17 = (_OWORD *)((char *)v5 + *(_QWORD *)(*v5 + 112));
  *v17 = 0u;
  v17[1] = 0u;
  *(uint64_t *)((char *)v5 + *(_QWORD *)(*v5 + 120)) = 0;
  *(uint64_t *)((char *)v5 + *(_QWORD *)(*v5 + 128)) = 0;
  v18 = (uint64_t)v5 + *(_QWORD *)(*v5 + 136);
  v19 = sub_210E91CF0();
  __swift_storeEnumTagSinglePayload(v18, 1, 1, v19);
  v20 = *(_QWORD *)(*v5 + 144);
  v21 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD16F0]), sel_init);
  sub_210D2DCAC(0, 0xE000000000000000, v21);
  objc_msgSend(v21, sel_setMinimumFractionDigits_, 3);
  objc_msgSend(v21, sel_setMaximumFractionDigits_, 3);
  *(uint64_t *)((char *)v5 + v20) = (uint64_t)v21;
  v5[2] = a2;
  *((_DWORD *)v5 + 6) = a3;
  *((_BYTE *)v5 + 28) = BYTE4(a3) & 1;
  v5[4] = a4;
  *((_BYTE *)v5 + 40) = v25;
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v16, v26, v10);
  __swift_storeEnumTagSinglePayload((uint64_t)v16, 0, 1, v10);
  v22 = (uint64_t)v5 + *(_QWORD *)(*v5 + 104);
  swift_beginAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v12 + 40))(v22, v16, v11);
  swift_endAccess();
  return v5;
}

uint64_t sub_210D2CD7C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  sub_210C33834(0, (unint64_t *)&qword_254A80BD0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v3, v4, v5);
  v7 = (char *)&v11 - v6;
  sub_210E927DC();
  if ((sub_210E927D0() & 1) != 0 && (sub_210E927DC(), result = sub_210E927D0(), (result & 1) != 0))
  {
    __break(1u);
  }
  else
  {
    sub_210E927DC();
    if ((sub_210E927D0() & 1) != 0 || (sub_210E927DC(), result = sub_210E927D0(), a1) && (result & 1) == 0)
    {
      sub_210E91CE4();
      v9 = sub_210E91CF0();
      __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v9);
      v10 = v1 + *(_QWORD *)(*(_QWORD *)v1 + 136);
      swift_beginAccess();
      sub_210D2DB28((uint64_t)v7, v10);
      swift_endAccess();
      return sub_210D2CE98();
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_210D2CE98()
{
  _QWORD *v0;
  _QWORD *v1;
  _QWORD *v2;
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
  uint64_t v28;
  uint64_t AssociatedTypeWitness;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  unsigned __int8 v42;
  uint64_t v43;
  uint64_t v44;
  int v45;
  int v46;
  uint64_t v47;
  uint64_t v48;
  _QWORD *v49;
  _QWORD *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t result;
  char v58;
  uint64_t v59;
  double v60;
  uint64_t v61;
  void *v62;
  void *v63;
  double v64;
  char v65;
  char v66;
  double v67;
  uint64_t v68;
  BOOL v69;
  uint64_t v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t ObjectType;
  char *v75;
  char *v76;
  void (*v77)(char *, uint64_t);
  uint64_t v78;
  char *v79;
  char *v80;
  void (*v81)(char *, uint64_t);
  uint64_t v82;
  uint64_t v83;
  _QWORD *v84;
  uint64_t v85;
  void *v86;
  char *v87;
  char *v88;
  uint64_t v89;
  char *v90;
  uint64_t v91;
  uint64_t v92;
  char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  char *v97;
  uint64_t v98;
  char *v99;
  uint64_t v100;
  char *v101;
  char *v102;
  uint64_t v103;
  uint64_t v104;
  char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  _QWORD aBlock[7];

  v1 = v0;
  v2 = (_QWORD *)*v0;
  v95 = sub_210E92908();
  v94 = *(_QWORD *)(v95 - 8);
  MEMORY[0x24BDAC7A8](v95, v3, v4);
  v93 = (char *)&v89 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v92 = sub_210E92938();
  v91 = *(_QWORD *)(v92 - 8);
  MEMORY[0x24BDAC7A8](v92, v6, v7);
  v90 = (char *)&v89 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v104 = sub_210E928FC();
  v103 = *(_QWORD *)(v104 - 8);
  v11 = MEMORY[0x24BDAC7A8](v104, v9, v10);
  v102 = (char *)&v89 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11, v13, v14);
  v101 = (char *)&v89 - v15;
  v100 = sub_210E9295C();
  v98 = *(_QWORD *)(v100 - 8);
  v18 = MEMORY[0x24BDAC7A8](v100, v16, v17);
  v97 = (char *)&v89 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18, v20, v21);
  v99 = (char *)&v89 - v22;
  v23 = sub_210E93034();
  v106 = *(_QWORD *)(v23 - 8);
  v107 = v23;
  MEMORY[0x24BDAC7A8](v23, v24, v25);
  v105 = (char *)&v89 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = v2[10];
  v27 = v2[11];
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v112 = v27;
  swift_getAssociatedConformanceWitness();
  v111 = AssociatedTypeWitness;
  v30 = sub_210E927C4();
  v109 = *(_QWORD *)(v30 - 8);
  v110 = v30;
  v33 = MEMORY[0x24BDAC7A8](v30, v31, v32);
  v108 = (uint64_t)&v89 - v34;
  v35 = *(_QWORD *)(v28 - 8);
  MEMORY[0x24BDAC7A8](v33, v36, v37);
  v39 = (char *)&v89 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  v40 = v1[2];
  v41 = *((unsigned int *)v1 + 6);
  v43 = v2[15];
  v44 = *(_QWORD *)((char *)v1 + v43);
  LOBYTE(aBlock[0]) = *((_BYTE *)v1 + 28);
  v42 = aBlock[0];
  sub_210D2C8CC(v44, v40, v41 | ((unint64_t)LOBYTE(aBlock[0]) << 32));
  v46 = v45;
  v47 = (uint64_t)v1 + *(_QWORD *)(*v1 + 104);
  swift_beginAccess();
  if (!__swift_getEnumTagSinglePayload(v47, 1, v28))
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v35 + 16))(v39, v47, v28);
    LODWORD(aBlock[0]) = v46;
    sub_210E927B8();
    (*(void (**)(char *, uint64_t))(v35 + 8))(v39, v28);
  }
  v48 = *(_QWORD *)((char *)v1 + v43);
  v96 = v41 & 0x7FFFFFFF;
  v49 = &unk_24CAA4D28;
  if ((v41 & 0x7FFFFFFF) == 0)
    v49 = &unk_24CAA4D00;
  if ((v42 & 1) != 0)
    v50 = v49;
  else
    v50 = &unk_24CAA4CD0;
  v51 = v50[2];
  swift_bridgeObjectRelease();
  v53 = v51 - 1;
  v54 = v28;
  if (v48 == v53 && !__swift_getEnumTagSinglePayload(v47, 1, v28))
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v35 + 16))(v39, v47, v28);
    v55 = v108;
    __swift_storeEnumTagSinglePayload(v108, 1, 1, v111);
    sub_210E927A0();
    (*(void (**)(uint64_t, uint64_t))(v109 + 8))(v55, v110);
    (*(void (**)(char *, uint64_t))(v35 + 8))(v39, v28);
  }
  v56 = *(_QWORD *)((char *)v1 + v43);
  LOBYTE(aBlock[0]) = v42;
  result = sub_210D2C7E8(v56, v52, v41 | ((unint64_t)v42 << 32));
  if ((v58 & 1) == 0)
  {
    v59 = *(_QWORD *)(*v1 + 128);
    if (!*(_QWORD *)((char *)v1 + v59))
    {
      v60 = *(double *)&result;
      v61 = MEMORY[0x24BEE4AF8];
      if (*((_BYTE *)v1 + 40) == 1)
      {
        v62 = &unk_24CAA4C08;
        if (!v96)
          v62 = (void *)MEMORY[0x24BEE4AF8];
        if ((v42 & 1) != 0)
          v63 = v62;
        else
          v63 = &unk_24CAA4BD0;
        v64 = COERCE_DOUBLE(sub_210D2D810((uint64_t)v63));
        v66 = v65;
        result = swift_bridgeObjectRelease();
        v67 = v64 * 4.0;
        if ((v66 & 1) != 0)
          v67 = 4.0;
        v60 = v60 / v67;
      }
      v68 = *(_QWORD *)((char *)v1 + v43);
      v69 = __OFADD__(v68, 1);
      v70 = v68 + 1;
      if (v69)
      {
        __break(1u);
      }
      else
      {
        *(_QWORD *)((char *)v1 + v43) = v70;
        sub_210D2DB84();
        aBlock[0] = v61;
        sub_210D2DBC0();
        sub_210C33834(0, &qword_253D7B1E8, (uint64_t (*)(uint64_t))MEMORY[0x24BEE57C0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1250]);
        sub_210D2DC00();
        v71 = v105;
        v72 = v107;
        sub_210E9328C();
        v73 = sub_210E93040();
        (*(void (**)(char *, uint64_t))(v106 + 8))(v71, v72);
        *(_QWORD *)((char *)v1 + v59) = v73;
        result = swift_unknownObjectRelease();
        if (*(_QWORD *)((char *)v1 + v59))
        {
          ObjectType = swift_getObjectType();
          swift_unknownObjectRetain();
          v75 = v97;
          sub_210E92950();
          v76 = v99;
          MEMORY[0x212BD0828](v75, v60);
          v77 = *(void (**)(char *, uint64_t))(v98 + 8);
          v78 = v100;
          v77(v75, v100);
          v79 = v101;
          sub_210CA47C8();
          v80 = v102;
          sub_210CA47F8(v102);
          MEMORY[0x212BD0F78](v76, v79, v80, ObjectType);
          swift_unknownObjectRelease();
          v81 = *(void (**)(char *, uint64_t))(v103 + 8);
          v82 = v104;
          v81(v80, v104);
          v81(v79, v82);
          result = ((uint64_t (*)(char *, uint64_t))v77)(v76, v78);
          if (*(_QWORD *)((char *)v1 + v59))
          {
            swift_getObjectType();
            v83 = swift_allocObject();
            swift_weakInit();
            v84 = (_QWORD *)swift_allocObject();
            v85 = v112;
            v84[2] = v54;
            v84[3] = v85;
            v84[4] = v83;
            aBlock[4] = sub_210D2DCA0;
            aBlock[5] = v84;
            aBlock[0] = MEMORY[0x24BDAC760];
            aBlock[1] = 1107296256;
            aBlock[2] = sub_210C37030;
            aBlock[3] = &block_descriptor_25;
            v86 = _Block_copy(aBlock);
            swift_unknownObjectRetain();
            swift_retain();
            v87 = v90;
            sub_210CA4A30();
            v88 = v93;
            sub_210CA4A34();
            sub_210E9304C();
            _Block_release(v86);
            swift_unknownObjectRelease();
            (*(void (**)(char *, uint64_t))(v94 + 8))(v88, v95);
            (*(void (**)(char *, uint64_t))(v91 + 8))(v87, v92);
            swift_release();
            result = swift_release();
            if (*(_QWORD *)((char *)v1 + v59))
            {
              swift_getObjectType();
              swift_unknownObjectRetain();
              sub_210E93064();
              return swift_unknownObjectRelease();
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t sub_210D2D644()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t AssociatedTypeWitness;
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
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;

  v1 = v0;
  v2 = *v0;
  v3 = *(_QWORD *)(*v0 + 80);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  v5 = sub_210E927C4();
  v6 = *(_QWORD *)(v5 - 8);
  v9 = MEMORY[0x24BDAC7A8](v5, v7, v8);
  v11 = (char *)&v20 - v10;
  v12 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v9, v13, v14);
  v16 = (char *)&v20 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = (uint64_t)v1 + *(_QWORD *)(v2 + 104);
  swift_beginAccess();
  if (!__swift_getEnumTagSinglePayload(v17, 1, v3))
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v16, v17, v3);
    __swift_storeEnumTagSinglePayload((uint64_t)v11, 1, 1, AssociatedTypeWitness);
    sub_210E927A0();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v11, v5);
    (*(void (**)(char *, uint64_t))(v12 + 8))(v16, v3);
  }
  v18 = *(_QWORD *)(*v1 + 128);
  if (*(uint64_t *)((char *)v1 + v18))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_210E93058();
    swift_unknownObjectRelease();
  }
  *(uint64_t *)((char *)v1 + v18) = 0;
  return swift_unknownObjectRelease();
}

uint64_t sub_210D2D810(uint64_t a1)
{
  uint64_t v1;
  double v2;
  uint64_t v3;
  double *v4;
  double v5;
  double v6;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return 0;
  v2 = *(double *)(a1 + 32);
  v3 = v1 - 1;
  if (v1 != 1)
  {
    v4 = (double *)(a1 + 40);
    do
    {
      v5 = *v4++;
      v6 = v5;
      if (v2 < v5)
        v2 = v6;
      --v3;
    }
    while (v3);
  }
  return *(_QWORD *)&v2;
}

uint64_t sub_210D2D854()
{
  uint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v1 = result;
    v2 = *(_QWORD *)(*(_QWORD *)result + 128);
    if (*(_QWORD *)(result + v2))
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      sub_210E93058();
      swift_unknownObjectRelease();
    }
    *(_QWORD *)(v1 + v2) = 0;
    v3 = swift_unknownObjectRelease();
    sub_210D2CE98(v3);
    return swift_release();
  }
  return result;
}

id *sub_210D2D8FC()
{
  id *v0;
  char *v1;
  uint64_t v2;

  v1 = (char *)v0 + *((_QWORD *)*v0 + 13);
  v2 = sub_210E93244();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  sub_210C33398((uint64_t)v0 + *((_QWORD *)*v0 + 14));
  swift_unknownObjectRelease();
  sub_210D101C8((uint64_t)v0 + *((_QWORD *)*v0 + 17));

  return v0;
}

uint64_t sub_210D2D998()
{
  sub_210D2D8FC();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for RateScanningSubscription(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for RateScanningSubscription);
}

void sub_210D2D9C4(uint64_t a1)
{

}

uint64_t sub_210D2D9CC(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 5) = *(_QWORD *)(a2 + 5);
  v3 = *(void **)(a2 + 16);
  *(_QWORD *)(a1 + 16) = v3;
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  v4 = v3;
  return a1;
}

uint64_t sub_210D2DA10(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v4 = *a2;
  *(_QWORD *)(a1 + 5) = *(uint64_t *)((char *)a2 + 5);
  *(_QWORD *)a1 = v4;
  v5 = (void *)a2[2];
  v6 = *(void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v5;
  v7 = v5;

  *(_BYTE *)(a1 + 24) = *((_BYTE *)a2 + 24);
  return a1;
}

uint64_t sub_210D2DA68(uint64_t a1, uint64_t a2)
{
  void *v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 5) = *(_QWORD *)(a2 + 5);
  v4 = *(void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);

  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  return a1;
}

void type metadata accessor for RateScannerConfiguration()
{
  OUTLINED_FUNCTION_17();
}

uint64_t sub_210D2DAC8(uint64_t a1)
{
  return sub_210D2CD7C(a1);
}

uint64_t sub_210D2DAE8()
{
  return sub_210D2D644();
}

void sub_210D2DB08()
{
  JUMPOUT(0x212BD2E20);
}

void sub_210D2DB18()
{
  JUMPOUT(0x212BD2E20);
}

uint64_t sub_210D2DB28(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_210C33834(0, (unint64_t *)&qword_254A80BD0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE900], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

unint64_t sub_210D2DB84()
{
  unint64_t result;

  result = qword_253D7B248;
  if (!qword_253D7B248)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_253D7B248);
  }
  return result;
}

unint64_t sub_210D2DBC0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_253D7B240;
  if (!qword_253D7B240)
  {
    v1 = sub_210E93034();
    result = MEMORY[0x212BD2E20](MEMORY[0x24BEE57D0], v1);
    atomic_store(result, (unint64_t *)&qword_253D7B240);
  }
  return result;
}

unint64_t sub_210D2DC00()
{
  unint64_t result;
  uint64_t v1;

  result = qword_253D7B1F0;
  if (!qword_253D7B1F0)
  {
    sub_210C33834(255, &qword_253D7B1E8, (uint64_t (*)(uint64_t))MEMORY[0x24BEE57C0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1250]);
    result = MEMORY[0x212BD2E20](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_253D7B1F0);
  }
  return result;
}

uint64_t sub_210D2DC58()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_210D2DC7C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_210D2DCA0()
{
  return sub_210D2D854();
}

void sub_210D2DCAC(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = (id)sub_210E92B84();
  swift_bridgeObjectRelease();
  objc_msgSend(a3, sel_setNegativePrefix_, v4);

}

uint64_t sub_210D2DCFC(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 25))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 16);
      if (v2 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_210D2DD3C(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 16) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 25) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

void _s11RateScannerVMa()
{
  OUTLINED_FUNCTION_17();
}

_QWORD *__swift_memcpy13_8(_QWORD *result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_QWORD *)((char *)result + 5) = *(uint64_t *)((char *)a2 + 5);
  *result = v2;
  return result;
}

uint64_t sub_210D2DDA0(uint64_t a1, unsigned int a2)
{
  int v2;
  unsigned int v3;

  if (a2)
  {
    if (a2 >= 0xFF && *(_BYTE *)(a1 + 13))
    {
      v2 = *(_DWORD *)a1 + 254;
    }
    else
    {
      v3 = *(unsigned __int8 *)(a1 + 12);
      if (v3 <= 1)
        v2 = -1;
      else
        v2 = v3 ^ 0xFF;
    }
  }
  else
  {
    v2 = -1;
  }
  return (v2 + 1);
}

uint64_t sub_210D2DDE0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_BYTE *)(result + 12) = 0;
    *(_DWORD *)(result + 8) = 0;
    *(_QWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 13) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 13) = 0;
    if (a2)
      *(_BYTE *)(result + 12) = -(char)a2;
  }
  return result;
}

uint64_t sub_210D2DE28(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 12);
}

uint64_t sub_210D2DE30(uint64_t result, char a2)
{
  *(_BYTE *)(result + 12) = a2 & 1;
  return result;
}

void type metadata accessor for RateScannerType()
{
  OUTLINED_FUNCTION_17();
}

uint64_t sub_210D2DE58(uint64_t a1, float a2)
{
  uint64_t v2;
  float v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  float v8;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
    return 0;
  v4 = *(float *)(a1 + 32);
  result = 0;
  if (v4 != a2)
  {
    v6 = v2 - 1;
    v7 = a1 + 36;
    while (v6 != result)
    {
      v8 = *(float *)(v7 + 4 * result++);
      if (v8 == a2)
        return result;
    }
    return 0;
  }
  return result;
}

void sub_210D2DEB8()
{
  unint64_t v0;
  unint64_t v1;
  uint64_t v2;
  id v3;
  void *v4;
  char v5;
  uint64_t v6;
  unint64_t v7;
  id v8;
  void *v9;
  char v10;

  OUTLINED_FUNCTION_71_11();
  v1 = v0;
  if (v0 >> 62)
    goto LABEL_20;
  v2 = *(_QWORD *)((v0 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (v2)
  {
    sub_210C36B28(0, (v1 & 0xC000000000000001) == 0, v1);
    if ((v1 & 0xC000000000000001) != 0)
      v3 = (id)MEMORY[0x212BD126C](0, v1);
    else
      v3 = *(id *)(v1 + 32);
    v4 = v3;
    sub_210C34D54(0, (unint64_t *)&qword_253D7E650);
    v5 = sub_210E931FC();

    if ((v5 & 1) != 0)
      break;
    v6 = 0;
    while (1)
    {
      v7 = v6 + 1;
      if (__OFADD__(v6, 1))
        break;
      if (v7 == v2)
        goto LABEL_21;
      if ((v1 & 0xC000000000000001) != 0)
      {
        v8 = (id)MEMORY[0x212BD126C](v6 + 1, v1);
      }
      else
      {
        if ((v7 & 0x8000000000000000) != 0)
          goto LABEL_18;
        if (v7 >= *(_QWORD *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10))
          goto LABEL_19;
        v8 = *(id *)(v1 + 32 + 8 * v7);
      }
      v9 = v8;
      v10 = sub_210E931FC();

      ++v6;
      if ((v10 & 1) != 0)
        goto LABEL_21;
    }
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
LABEL_20:
    OUTLINED_FUNCTION_25();
    v2 = sub_210E93490();
    OUTLINED_FUNCTION_2_1();
  }
LABEL_21:
  OUTLINED_FUNCTION_69_3();
}

uint64_t sub_210D2E034(uint64_t result, uint64_t a2)
{
  if (*(_QWORD *)(a2 + 16) < result)
  {
    __break(1u);
  }
  else if ((result & 0x8000000000000000) == 0)
  {
    return swift_bridgeObjectRetain();
  }
  __break(1u);
  return result;
}

unint64_t sub_210D2E090(unint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  unint64_t v4;

  v3 = a2 + 1;
  if (__OFADD__(a2, 1))
  {
    __break(1u);
    goto LABEL_10;
  }
  if ((result & 0x8000000000000000) != 0)
  {
LABEL_10:
    __break(1u);
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  v4 = *(_QWORD *)(a3 + 16);
  if (v4 < result || (uint64_t)v4 < v3)
    goto LABEL_11;
  if ((v3 & 0x8000000000000000) == 0)
    return swift_bridgeObjectRetain();
LABEL_12:
  __break(1u);
  return result;
}

_QWORD *PodcastsManagedQueue.__allocating_init()()
{
  _QWORD *result;
  uint64_t v1;

  result = (_QWORD *)swift_allocObject();
  v1 = MEMORY[0x24BEE4AF8];
  result[3] = 0;
  result[4] = 0;
  result[2] = v1;
  return result;
}

void sub_210D2E138(uint64_t a1)
{
  uint64_t v1;

  OUTLINED_FUNCTION_3();
  *(_QWORD *)(v1 + 16) = a1;
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_15_3();
}

_QWORD *PodcastsManagedQueue.init()()
{
  _QWORD *v0;
  _QWORD *result;
  uint64_t v2;

  result = v0;
  v2 = MEMORY[0x24BEE4AF8];
  v0[3] = 0;
  v0[4] = 0;
  v0[2] = v2;
  return result;
}

uint64_t sub_210D2E18C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  uint64_t v4;
  __int128 v6;
  uint64_t v7;
  _QWORD v8[3];

  OUTLINED_FUNCTION_3();
  v8[0] = *(_QWORD *)(v0 + 16);
  swift_retain();
  v1 = OUTLINED_FUNCTION_25();
  v2 = sub_210D30704(v1);
  sub_210D30874((void (*)(uint64_t *))sub_210D30C74, v2, v3 & 1, (uint64_t)&v6);
  OUTLINED_FUNCTION_2_1();
  if (v7)
  {
    sub_210C45354(&v6, (uint64_t)v8);
    v4 = OUTLINED_FUNCTION_15_30(v8);
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v8);
  }
  else
  {
    sub_210D31010((uint64_t)&v6, &qword_254A80368, (uint64_t (*)(uint64_t, unint64_t))MEMORY[0x24BEE1C68]);
    return 0;
  }
  return v4;
}

BOOL static PodcastQueueType.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_210D2E284(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 24) = a1;
  *(_QWORD *)(v2 + 32) = a2;
  return swift_bridgeObjectRelease();
}

BOOL sub_210D2E294(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  char v10;

  if (!a2 || !*(_QWORD *)(v2 + 32))
    return 0;
  OUTLINED_FUNCTION_25();
  v5 = sub_210D2EA5C(a1, a2);
  if ((v6 & 1) != 0)
  {
    OUTLINED_FUNCTION_2_1();
    return 0;
  }
  v7 = v5;
  v8 = OUTLINED_FUNCTION_36_18();
  v10 = v9;
  OUTLINED_FUNCTION_2_1();
  return (v10 & 1) == 0 && v8 < v7;
}

uint64_t sub_210D2E318()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  _QWORD v15[3];
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  OUTLINED_FUNCTION_3();
  v3 = *(_QWORD *)(v0 + 16);
  v4 = *(_QWORD *)(v3 + 16);
  v5 = MEMORY[0x24BEE4AF8];
  if (!v4)
    return v5;
  v18 = MEMORY[0x24BEE4AF8];
  OUTLINED_FUNCTION_25();
  sub_210C33CE8();
  for (i = v3 + 32; ; i += 40)
  {
    sub_210C45310(i, (uint64_t)v15);
    v7 = v16;
    v8 = v17;
    __swift_project_boxed_opaque_existential_0Tm(v15, v16);
    result = (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8))(v7, v8);
    if (!v10)
      break;
    v11 = result;
    v12 = v10;
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v15);
    v5 = v18;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_210C33CE8();
      v5 = v18;
    }
    OUTLINED_FUNCTION_24_23();
    if (v13)
    {
      sub_210C33CE8();
      v5 = v18;
    }
    *(_QWORD *)(v5 + 16) = v1;
    v14 = v5 + 16 * v2;
    *(_QWORD *)(v14 + 32) = v11;
    *(_QWORD *)(v14 + 40) = v12;
    if (!--v4)
    {
      OUTLINED_FUNCTION_2_1();
      return v5;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_210D2E454()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE v22[40];
  uint64_t v23;

  OUTLINED_FUNCTION_3();
  v1 = v0[2];
  v2 = *(_QWORD *)(v1 + 16);
  if (!v2)
    return sub_210D2E728();
  v3 = (_QWORD *)(v1 + 32);
  swift_retain();
  OUTLINED_FUNCTION_29_1();
  v4 = 0;
  while (1)
  {
    v5 = OUTLINED_FUNCTION_3_37(v3);
    v7 = v0[4];
    if (v6)
      break;
    if (!v7)
    {
LABEL_17:
      OUTLINED_FUNCTION_33();
      OUTLINED_FUNCTION_5();
      goto LABEL_19;
    }
LABEL_14:
    ++v4;
    v3 += 5;
    if (v2 == v4)
    {
      OUTLINED_FUNCTION_33();
      OUTLINED_FUNCTION_5();
      return sub_210D2E728();
    }
  }
  if (!v7)
  {
    OUTLINED_FUNCTION_9_0();
    goto LABEL_14;
  }
  if (v5 != v0[3] || v6 != v7)
  {
    v9 = OUTLINED_FUNCTION_95();
    OUTLINED_FUNCTION_9_0();
    if ((v9 & 1) != 0)
      goto LABEL_17;
    goto LABEL_14;
  }
  OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_9_0();
LABEL_19:
  result = sub_210D2E034(v4, v0[2]);
  v10 = MEMORY[0x24BEE4AF8];
  v23 = MEMORY[0x24BEE4AF8];
  v18 = (v14 >> 1) - v13;
  if (v14 >> 1 == v13)
  {
LABEL_30:
    swift_unknownObjectRelease();
    return v10;
  }
  if ((uint64_t)(v14 >> 1) > v13)
  {
    v19 = v12 + 40 * v13;
    do
    {
      OUTLINED_FUNCTION_29_25(result, v12, v13, v14, v15, v16, v17);
      OUTLINED_FUNCTION_22_26((uint64_t)v22, v20);
      sub_210D30C90();
      OUTLINED_FUNCTION_32_21();
      if ((OUTLINED_FUNCTION_14_29() & 1) == 0)
        v21 = 0;
      result = __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v22);
      if (v21)
      {
        MEMORY[0x212BD0B58](result);
        if (*(_QWORD *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_210E92CEC();
        OUTLINED_FUNCTION_31_26();
        result = sub_210E92CE0();
      }
      v19 += 40;
      --v18;
    }
    while (v18);
    v10 = v23;
    goto LABEL_30;
  }
  __break(1u);
  return result;
}

uint64_t sub_210D2E630(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v13;

  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_10:
    swift_bridgeObjectRelease();
    return 0;
  }
  v6 = 0;
  v7 = (_QWORD *)(a1 + 32);
  while (1)
  {
    v8 = v7[3];
    v9 = v7[4];
    __swift_project_boxed_opaque_existential_0Tm(v7, v8);
    v10 = (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8))(v8, v9);
    if (!v11)
      goto LABEL_9;
    if (v10 == a2 && v11 == a3)
      break;
    v13 = sub_210E93544();
    swift_bridgeObjectRelease();
    if ((v13 & 1) != 0)
      goto LABEL_12;
LABEL_9:
    ++v6;
    v7 += 5;
    if (v4 == v6)
      goto LABEL_10;
  }
  swift_bridgeObjectRelease();
LABEL_12:
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_210D2E728()
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
  uint64_t v14;
  _BYTE v15[40];
  uint64_t v16;

  OUTLINED_FUNCTION_3();
  v1 = *(_QWORD *)(v0 + 16);
  v16 = MEMORY[0x24BEE4AF8];
  v2 = *(_QWORD *)(v1 + 16);
  if (v2)
  {
    v3 = v1 + 32;
    v4 = OUTLINED_FUNCTION_25();
    do
    {
      OUTLINED_FUNCTION_29_25(v4, v5, v6, v7, v8, v9, v10);
      OUTLINED_FUNCTION_22_26((uint64_t)v15, v11);
      sub_210D30C90();
      OUTLINED_FUNCTION_32_21();
      if ((OUTLINED_FUNCTION_14_29() & 1) == 0)
        v14 = 0;
      v4 = __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v15);
      if (v14)
      {
        MEMORY[0x212BD0B58](v4);
        if (*(_QWORD *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_210E92CEC();
        OUTLINED_FUNCTION_31_26();
        v4 = sub_210E92CE0();
      }
      v3 += 40;
      --v2;
    }
    while (v2);
    v12 = v16;
  }
  else
  {
    OUTLINED_FUNCTION_25();
    v12 = MEMORY[0x24BEE4AF8];
  }
  OUTLINED_FUNCTION_2_1();
  return v12;
}

BOOL sub_210D2E824()
{
  uint64_t v0;

  OUTLINED_FUNCTION_3();
  return *(_QWORD *)(*(_QWORD *)(v0 + 16) + 16) == 0;
}

uint64_t sub_210D2E85C()
{
  char v0;
  uint64_t v2;

  v2 = sub_210D2EBE4();
  OUTLINED_FUNCTION_47_19(v2, &qword_254A80BD8, (uint64_t (*)(uint64_t, unint64_t))MEMORY[0x24BEE1250]);
  sub_210D30CE4();
  v0 = sub_210E92EE4();
  OUTLINED_FUNCTION_2_1();
  return v0 & 1;
}

uint64_t sub_210D2E8C8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD v4[3];

  OUTLINED_FUNCTION_3();
  v1 = *(_QWORD *)(v0 + 16);
  if (!*(_QWORD *)(v1 + 16))
    return 0;
  sub_210C45310(v1 + 32, (uint64_t)v4);
  v2 = OUTLINED_FUNCTION_15_30(v4);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v4);
  return v2;
}

uint64_t sub_210D2E948@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v13;
  __int128 v15;

  OUTLINED_FUNCTION_3();
  v7 = *(_QWORD *)(v3 + 16);
  v8 = *(_QWORD *)(v7 + 16);
  if (!v8)
  {
    OUTLINED_FUNCTION_54();
LABEL_12:
    *(_QWORD *)(a3 + 32) = 0;
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
    return OUTLINED_FUNCTION_11_0();
  }
  v9 = v7 + 32;
  swift_bridgeObjectRetain_n();
  while (1)
  {
    sub_210C45310(v9, (uint64_t)&v15);
    v10 = OUTLINED_FUNCTION_3_37(&v15);
    if (!v11)
      goto LABEL_9;
    if (v10 == a1 && v11 == a2)
      break;
    v13 = OUTLINED_FUNCTION_95();
    OUTLINED_FUNCTION_9_0();
    if ((v13 & 1) != 0)
      goto LABEL_14;
LABEL_9:
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v15);
    v9 += 40;
    if (!--v8)
    {
      OUTLINED_FUNCTION_11_0();
      goto LABEL_12;
    }
  }
  OUTLINED_FUNCTION_11_0();
LABEL_14:
  swift_bridgeObjectRelease();
  sub_210C45354(&v15, a3);
  return OUTLINED_FUNCTION_11_0();
}

uint64_t sub_210D2EA5C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v12;

  OUTLINED_FUNCTION_3();
  v5 = *(_QWORD *)(v2 + 16);
  v6 = *(_QWORD *)(v5 + 16);
  if (!v6)
    return 0;
  v7 = (_QWORD *)(v5 + 32);
  OUTLINED_FUNCTION_54();
  v8 = 0;
  while (1)
  {
    v9 = OUTLINED_FUNCTION_3_37(v7);
    if (v10)
      break;
LABEL_9:
    ++v8;
    v7 += 5;
    if (v6 == v8)
    {
      v8 = 0;
      goto LABEL_13;
    }
  }
  if (v9 != a1 || v10 != a2)
  {
    v12 = OUTLINED_FUNCTION_95();
    OUTLINED_FUNCTION_14();
    if ((v12 & 1) != 0)
      goto LABEL_13;
    goto LABEL_9;
  }
  OUTLINED_FUNCTION_11_0();
LABEL_13:
  OUTLINED_FUNCTION_11_0();
  return v8;
}

void sub_210D2EB50(uint64_t a1)
{
  uint64_t v1;

  OUTLINED_FUNCTION_47_19(a1, &qword_254A80BD8, (uint64_t (*)(uint64_t, unint64_t))MEMORY[0x24BEE1250]);
  sub_210D30CE4();
  swift_bridgeObjectRetain();
  if ((sub_210E92EE4() & 1) != 0)
  {
    v1 = sub_210D2EBE4();
    sub_210D2FFC8(1, 1, v1);
  }
  sub_210D2E138(a1);
  OUTLINED_FUNCTION_15_3();
}

uint64_t sub_210D2EBE4()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  char v8;
  uint64_t result;
  BOOL v10;
  int64_t v11;
  uint64_t v12;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;

  if (!*(_QWORD *)(v0 + 32))
    return MEMORY[0x24BEE4AF8];
  OUTLINED_FUNCTION_25();
  v1 = OUTLINED_FUNCTION_36_18();
  v3 = v2;
  OUTLINED_FUNCTION_2_1();
  if ((v3 & 1) != 0)
    return MEMORY[0x24BEE4AF8];
  v4 = sub_210D2E18C();
  if (!v5)
    return MEMORY[0x24BEE4AF8];
  v6 = sub_210D2EA5C(v4, v5);
  v8 = v7;
  result = OUTLINED_FUNCTION_42();
  if ((v8 & 1) != 0)
    return MEMORY[0x24BEE4AF8];
  v10 = __OFADD__(v1, 1);
  v11 = v1 + 1;
  if (v10)
  {
    __break(1u);
  }
  else
  {
    OUTLINED_FUNCTION_3();
    result = MEMORY[0x24BEE4AF8];
    if ((v11 & 0x8000000000000000) == 0)
    {
      v12 = *(_QWORD *)(v0 + 16);
      if (v11 < *(_QWORD *)(v12 + 16) && v6 >= v11)
      {
        v14 = sub_210D2E090(v11, v6, v12);
        return sub_210CF2D1C(v14, v15, v16, v17);
      }
    }
  }
  return result;
}

uint64_t sub_210D2ECB0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  char v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t result;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  uint64_t v26;

  v3 = v2;
  v6 = sub_210D2E18C();
  if (!v7 || (v8 = sub_210D2EA5C(v6, v7), v10 = v9, swift_bridgeObjectRelease(), (v10 & 1) != 0))
  {
    OUTLINED_FUNCTION_54();
    OUTLINED_FUNCTION_27_22();
    return 0;
  }
  OUTLINED_FUNCTION_54();
  OUTLINED_FUNCTION_27_22();
  v11 = sub_210D2EA5C(a1, a2);
  if ((v12 & 1) != 0)
    return 0;
  v13 = v11;
  result = OUTLINED_FUNCTION_26_23();
  if ((v15 & 1) != 0)
    return 0;
  v16 = v13 + 1;
  if (__OFADD__(v13, 1))
  {
    __break(1u);
    goto LABEL_20;
  }
  if (__OFSUB__(result, 1))
  {
LABEL_20:
    __break(1u);
LABEL_21:
    __break(1u);
    return result;
  }
  if (result - 1 >= v8)
    v17 = v8;
  else
    v17 = result - 1;
  if (v17 >= v16)
  {
    OUTLINED_FUNCTION_3();
    v21 = sub_210D2E090(v13 + 1, v17, *(_QWORD *)(v3 + 16));
    if (v19 != v20 >> 1)
    {
      v22 = v18;
      v23 = v19;
      v24 = v20;
      OUTLINED_FUNCTION_3();
      sub_210D3028C(v16, v17 + 1);
      swift_endAccess();
      result = OUTLINED_FUNCTION_26_23();
      if ((v25 & 1) == 0)
      {
        v26 = result + 1;
        if (!__OFADD__(result, 1))
        {
          OUTLINED_FUNCTION_3();
          swift_unknownObjectRetain();
          sub_210D30124(v26, v26, v21, v22, v23, v24);
          swift_endAccess();
          swift_unknownObjectRelease();
          return 1;
        }
        goto LABEL_21;
      }
    }
    swift_unknownObjectRelease();
  }
  return 0;
}

void sub_210D2EE58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, int a10, __int16 a11, char a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25)
{
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
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  OUTLINED_FUNCTION_71_11();
  a24 = v25;
  a25 = v26;
  v28 = v27;
  v30 = v29;
  v41 = v31;
  v33 = v32;
  v34 = *(_QWORD *)(v29 + 16);
  swift_bridgeObjectRetain();
  if (!v34)
  {
LABEL_7:
    if (v28 == 1)
    {
      v39 = sub_210D2E18C();
      if (v40)
      {
        OUTLINED_FUNCTION_35_21(v39, v40);
        OUTLINED_FUNCTION_2_1();
LABEL_13:
        OUTLINED_FUNCTION_69_3();
        swift_bridgeObjectRelease();
        return;
      }
    }
    else if (v28)
    {
      goto LABEL_13;
    }
    OUTLINED_FUNCTION_35_21(v33, v41);
    goto LABEL_13;
  }
  v35 = 0;
  v36 = 0;
  while (1)
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_210D30934();
      v30 = v38;
    }
    if (v36 >= *(_QWORD *)(v30 + 16))
      break;
    ++v36;
    v37 = *(_QWORD *)(v30 + v35 + 64);
    __swift_mutable_project_boxed_opaque_existential_1(v30 + v35 + 32, *(_QWORD *)(v30 + v35 + 56));
    a13 = 0;
    OUTLINED_FUNCTION_40_17((uint64_t)&a13, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v37 + 40));
    v35 += 40;
    if (v34 == v36)
      goto LABEL_7;
  }
  __break(1u);
}

uint64_t sub_210D2EF54(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  char v8;
  BOOL v9;
  uint64_t v10;

  if (a2)
  {
    v5 = result;
    v6 = (_QWORD *)sub_210D2E318();
    v7 = sub_210C36398(v5, a2, v6);
    LOBYTE(v5) = v8;
    result = OUTLINED_FUNCTION_33();
    if ((v5 & 1) == 0)
    {
      sub_210D2E318();
      result = swift_bridgeObjectRelease();
      v9 = __OFADD__(v7, 1);
      v10 = v7 + 1;
      if (v9)
      {
        __break(1u);
      }
      else
      {
        OUTLINED_FUNCTION_3();
        OUTLINED_FUNCTION_25();
        sub_210D2FFC8(v10, v10, a3);
        return OUTLINED_FUNCTION_10_18();
      }
    }
  }
  return result;
}

void sub_210D2EFFC()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_25();
  sub_210D2F0E4();
  OUTLINED_FUNCTION_10_18();
  OUTLINED_FUNCTION_15_3();
}

void sub_210D2F03C()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  BOOL v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;

  OUTLINED_FUNCTION_39_22();
  if (v5)
  {
    __break(1u);
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if (!OUTLINED_FUNCTION_44_21() || v4 > *(_QWORD *)(v2 + 24) >> 1)
  {
    sub_210C340A0();
    v2 = v6;
  }
  if (!*(_QWORD *)(v0 + 16))
  {
    if (!v3)
      goto LABEL_11;
    goto LABEL_13;
  }
  OUTLINED_FUNCTION_34_26();
  if (v8 != v5)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  sub_210C34548(v0 + 32, v3, v2 + 16 * v7 + 32);
  if (!v3)
  {
LABEL_11:
    OUTLINED_FUNCTION_2_1();
    *v1 = v2;
    OUTLINED_FUNCTION_18_1();
    return;
  }
  v9 = *(_QWORD *)(v2 + 16);
  v5 = __OFADD__(v9, v3);
  v10 = v9 + v3;
  if (!v5)
  {
    *(_QWORD *)(v2 + 16) = v10;
    goto LABEL_11;
  }
LABEL_15:
  __break(1u);
}

void sub_210D2F0E4()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  BOOL v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;

  OUTLINED_FUNCTION_39_22();
  if (v5)
  {
    __break(1u);
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if (!OUTLINED_FUNCTION_44_21() || v4 > *(_QWORD *)(v2 + 24) >> 1)
  {
    sub_210D21CE4();
    v2 = v6;
  }
  if (!*(_QWORD *)(v0 + 16))
  {
    if (!v3)
      goto LABEL_11;
    goto LABEL_13;
  }
  OUTLINED_FUNCTION_34_26();
  if (v7 != v5)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  sub_210D22FB8(v0 + 32, v3);
  if (!v3)
  {
LABEL_11:
    OUTLINED_FUNCTION_2_1();
    *v1 = v2;
    OUTLINED_FUNCTION_18_1();
    return;
  }
  v8 = *(_QWORD *)(v2 + 16);
  v5 = __OFADD__(v8, v3);
  v9 = v8 + v3;
  if (!v5)
  {
    *(_QWORD *)(v2 + 16) = v9;
    goto LABEL_11;
  }
LABEL_15:
  __break(1u);
}

uint64_t sub_210D2F190(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t i;
  char v17;
  char v18;
  __int128 *v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25[2];
  __int128 v26;
  uint64_t v27;
  uint64_t v28;
  _BYTE v29[40];
  uint64_t v30;
  __int128 v31[3];

  if (!a3
    || (swift_bridgeObjectRetain(), v7 = OUTLINED_FUNCTION_42_19(), result = sub_210D2E630(v7, v8, v9), (v11 & 1) != 0))
  {
    OUTLINED_FUNCTION_3();
    OUTLINED_FUNCTION_25();
    sub_210D2F0E4();
    return swift_endAccess();
  }
  else
  {
    v12 = *(_QWORD *)(a1 + 16);
    if (v12)
    {
      v13 = result;
      v14 = (uint64_t *)(v3 + 16);
      v15 = a1 + 32;
      OUTLINED_FUNCTION_25();
      for (i = 0; i != v12; ++i)
      {
        v30 = i;
        sub_210C45310(v15, (uint64_t)v31);
        sub_210C45354(v31, (uint64_t)v29);
        if (v13 >= i)
        {
          sub_210C45310((uint64_t)v29, (uint64_t)&v26);
          v4 = v27;
          v5 = v28;
          v3 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v26, v27);
          LOBYTE(v25[0]) = 0;
          OUTLINED_FUNCTION_40_17((uint64_t)v25, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 40));
          sub_210C45310((uint64_t)&v26, (uint64_t)v25);
          OUTLINED_FUNCTION_3();
          v20 = OUTLINED_FUNCTION_41_23();
          *v14 = v3;
          if ((v20 & 1) == 0)
          {
            OUTLINED_FUNCTION_9_30();
            OUTLINED_FUNCTION_33_20(v23);
          }
          OUTLINED_FUNCTION_24_23();
          if (v18)
          {
            OUTLINED_FUNCTION_9_30();
            OUTLINED_FUNCTION_33_20(v24);
          }
          *(_QWORD *)(v3 + 16) = v4;
          sub_210C45354(v25, v3 + 40 * v5 + 32);
          swift_endAccess();
          __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v29);
          v19 = &v26;
        }
        else
        {
          sub_210C45310((uint64_t)v29, (uint64_t)&v26);
          OUTLINED_FUNCTION_3();
          v17 = OUTLINED_FUNCTION_41_23();
          *v14 = v3;
          if ((v17 & 1) == 0)
          {
            OUTLINED_FUNCTION_9_30();
            OUTLINED_FUNCTION_33_20(v21);
          }
          OUTLINED_FUNCTION_24_23();
          if (v18)
          {
            OUTLINED_FUNCTION_9_30();
            OUTLINED_FUNCTION_33_20(v22);
          }
          *(_QWORD *)(v3 + 16) = v4;
          sub_210C45354(&v26, v3 + 40 * v5 + 32);
          swift_endAccess();
          v19 = (__int128 *)v29;
        }
        __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v19);
        v15 += 40;
      }
      return swift_bridgeObjectRelease();
    }
  }
  return result;
}

void sub_210D2F3C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v9;
  char v10;
  uint64_t v11;
  char v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE v16[40];

  sub_210D2E318();
  v9 = OUTLINED_FUNCTION_17_25(a1, a2);
  LOBYTE(a1) = v10;
  OUTLINED_FUNCTION_9_0();
  if ((a1 & 1) != 0)
    goto LABEL_6;
  sub_210D2E318();
  v11 = OUTLINED_FUNCTION_17_25(a3, a4);
  v13 = v12;
  OUTLINED_FUNCTION_9_0();
  if ((v13 & 1) != 0)
    goto LABEL_6;
  OUTLINED_FUNCTION_3();
  sub_210D2F534(v9, (uint64_t)v16);
  if (*(_QWORD *)(*(_QWORD *)(v4 + 16) + 16) < v11)
  {
    __break(1u);
  }
  else if ((v11 & 0x8000000000000000) == 0)
  {
    v15 = OUTLINED_FUNCTION_22_26((uint64_t)v16, v14);
    OUTLINED_FUNCTION_28_27(v15);
    swift_endAccess();
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v16);
LABEL_6:
    OUTLINED_FUNCTION_20_22();
    return;
  }
  __break(1u);
}

uint64_t sub_210D2F4A4(unint64_t a1)
{
  unint64_t *v1;
  unint64_t v3;
  uint64_t result;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = *v1;
  result = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *v1 = v3;
  if (!(_DWORD)result || (v3 & 0x8000000000000000) != 0 || (v3 & 0x4000000000000000) != 0)
    sub_210D308C0(v3);
  v5 = v3 & 0xFFFFFFFFFFFFFF8;
  v6 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v6 <= a1)
  {
    __break(1u);
  }
  else
  {
    v7 = v6 - 1;
    v8 = v6 - 1 - a1;
    v9 = v5 + 8 * a1;
    v10 = *(_QWORD *)(v9 + 32);
    sub_210D22878(v9 + 40, v8, v9 + 32);
    *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFF8) + 0x10) = v7;
    sub_210E92CE0();
    return v10;
  }
  return result;
}

void sub_210D2F534(unint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5 = *v2;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    sub_210D30934();
    v5 = v8;
  }
  v6 = *(_QWORD *)(v5 + 16);
  if (v6 <= a1)
  {
    __break(1u);
  }
  else
  {
    v7 = v5 + 40 * a1;
    sub_210C45354((__int128 *)(v7 + 32), a2);
    sub_210D22AC8((char *)(v7 + 72), v6 - 1 - a1, (char *)(v7 + 32));
    *(_QWORD *)(v5 + 16) = v6 - 1;
    *v2 = v5;
  }
}

void sub_210D2F5D0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  int64_t v5;
  char v6;
  _QWORD *v7;
  uint64_t v8;
  char v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE v14[40];

  sub_210D2E318();
  v5 = OUTLINED_FUNCTION_17_25(a1, a2);
  LOBYTE(a1) = v6;
  OUTLINED_FUNCTION_9_0();
  if ((a1 & 1) != 0)
    goto LABEL_9;
  v7 = (_QWORD *)sub_210D2E318();
  v8 = OUTLINED_FUNCTION_16_30(v7);
  v10 = v9;
  OUTLINED_FUNCTION_9_0();
  if ((v10 & 1) != 0)
    goto LABEL_9;
  OUTLINED_FUNCTION_3();
  sub_210D2F534(v5, (uint64_t)v14);
  if (v8 >= v5)
    v12 = v8;
  else
    v12 = v8 + 1;
  if (*(_QWORD *)(*(_QWORD *)(v2 + 16) + 16) < v12)
  {
    __break(1u);
  }
  else if ((v12 & 0x8000000000000000) == 0)
  {
    v13 = OUTLINED_FUNCTION_22_26((uint64_t)v14, v11);
    OUTLINED_FUNCTION_28_27(v13);
    swift_endAccess();
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v14);
LABEL_9:
    OUTLINED_FUNCTION_20_22();
    return;
  }
  __break(1u);
}

void sub_210D2F6B0()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_54();
  v1 = (_QWORD *)OUTLINED_FUNCTION_42_19();
  sub_210D30948(v1, v2, v3);
  v5 = *(_QWORD *)(*(_QWORD *)(v0 + 16) + 16);
  if (v5 < v4)
  {
    __break(1u);
  }
  else
  {
    sub_210D3028C(v4, v5);
    OUTLINED_FUNCTION_10_18();
  }
}

uint64_t sub_210D2F720(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v17;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  char v22;
  char v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31[3];

  v3 = v2;
  v6 = v2 + 16;
  OUTLINED_FUNCTION_3();
  v7 = *(_QWORD *)(v3 + 16);
  v8 = *(_QWORD *)(v7 + 16);
  if (!v8)
    return 0;
  v30 = v6;
  v9 = (_QWORD *)(v7 + 32);
  OUTLINED_FUNCTION_154();
  v10 = 0;
  while (1)
  {
    v11 = v9[3];
    v12 = v9[4];
    __swift_project_boxed_opaque_existential_0Tm(v9, v11);
    v13 = (*(uint64_t (**)(uint64_t, uint64_t))(v12 + 8))(v11, v12);
    if (!v14)
      goto LABEL_9;
    v15 = v14;
    if (v13 == a1 && v14 == a2)
      break;
    v17 = OUTLINED_FUNCTION_95();
    OUTLINED_FUNCTION_9_0();
    if ((v17 & 1) != 0)
      goto LABEL_13;
LABEL_9:
    ++v10;
    v9 += 5;
    if (v8 == v10)
    {
      OUTLINED_FUNCTION_42();
      return 0;
    }
  }
  OUTLINED_FUNCTION_42();
  v7 = v15;
LABEL_13:
  OUTLINED_FUNCTION_42();
  sub_210D2E18C();
  if (!v19
    || (v7 = v19,
        v20 = (_QWORD *)sub_210D2E318(),
        v21 = OUTLINED_FUNCTION_16_30(v20),
        v23 = v22,
        OUTLINED_FUNCTION_42(),
        OUTLINED_FUNCTION_9_0(),
        (v23 & 1) != 0))
  {
    v21 = *(_QWORD *)(*(_QWORD *)v30 + 16) - 1;
  }
  if (__OFADD__(v10, 1))
  {
    __break(1u);
    goto LABEL_26;
  }
  if (v21 >= v10 + 1)
    v7 = v10 + 1;
  else
    v7 = v21;
  if (qword_254A7CDC8 != -1)
    goto LABEL_27;
  while (1)
  {
    v24 = sub_210E92704();
    __swift_project_value_buffer(v24, (uint64_t)qword_254A8E2C8);
    v25 = sub_210E926F8();
    v26 = sub_210E92F98();
    if (os_log_type_enabled(v25, v26))
    {
      v27 = (uint8_t *)swift_slowAlloc();
      v31[0] = swift_slowAlloc();
      *(_DWORD *)v27 = 136315138;
      v28 = sub_210D30D34();
      sub_210C384B0(v28, v29, v31);
      sub_210E93250();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_210BD8000, v25, v26, "Removing items at range: %s", v27, 0xCu);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_2();
    }

    OUTLINED_FUNCTION_3();
    if (!__OFADD__(v21, 1))
      break;
LABEL_26:
    __break(1u);
LABEL_27:
    swift_once();
  }
  sub_210D3028C(v7, v21 + 1);
  swift_endAccess();
  return 1;
}

void sub_210D2F9D0()
{
  sub_210D2E138(MEMORY[0x24BEE4AF8]);
}

uint64_t PodcastsManagedQueue.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t PodcastsManagedQueue.__deallocating_deinit()
{
  PodcastsManagedQueue.deinit();
  return swift_deallocClassInstance();
}

uint64_t PodcastQueueType.hash(into:)()
{
  return sub_210E9361C();
}

uint64_t PodcastQueueType.hashValue.getter()
{
  sub_210E93610();
  sub_210E9361C();
  return sub_210E93634();
}

void sub_210D2FA98()
{
  sub_210D2FAB8();
}

void sub_210D2FAB8()
{
  void *v0;

  sub_210D23220(v0);
}

void sub_210D2FAC0()
{
  sub_210D2FAE0();
}

void sub_210D2FAE0()
{
  void *v0;

  sub_210D0CBD8(v0, (SEL *)&selRef_queueSectionID);
}

void sub_210D2FB00()
{
  sub_210D2FB20();
}

void sub_210D2FB20()
{
  void *v0;

  sub_210D0CBD8(v0, (SEL *)&selRef_queueItemID);
}

uint64_t sub_210D2FB40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t (*a9)(uint64_t, uint64_t, uint64_t), unint64_t *a10)
{
  return sub_210D2FD98(a1, a2, (uint64_t)&qword_253D7E650, 0x24BDB2618, (uint64_t)sub_210D22878, a6, a7, a8, a9, a10);
}

uint64_t sub_210D2FB5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  unint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t result;
  uint64_t v19;

  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    v3 = a3;
    v5 = a2;
    v6 = a1;
    v7 = *v4;
    if (!(*v4 >> 62))
    {
      v9 = *(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10);
      goto LABEL_4;
    }
  }
  OUTLINED_FUNCTION_29_1();
  v9 = OUTLINED_FUNCTION_30_19();
  OUTLINED_FUNCTION_33();
LABEL_4:
  if (v9 < v5)
  {
    __break(1u);
    goto LABEL_32;
  }
  v10 = v5 - v6;
  if (__OFSUB__(v5, v6))
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  v8 = 1 - v10;
  if (__OFSUB__(1, v10))
  {
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  v7 = *v4;
  if (!(*v4 >> 62))
  {
    v11 = *(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10);
    goto LABEL_9;
  }
LABEL_34:
  OUTLINED_FUNCTION_29_1();
  v11 = sub_210E93490();
  OUTLINED_FUNCTION_33();
LABEL_9:
  v12 = v11 + v8;
  if (__OFADD__(v11, v8))
  {
    __break(1u);
LABEL_36:
    OUTLINED_FUNCTION_29_1();
    v15 = sub_210E93490();
    OUTLINED_FUNCTION_33();
    goto LABEL_17;
  }
  v7 = *v4;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *v4 = v7;
  v11 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v7 & 0x8000000000000000) == 0 && (v7 & 0x4000000000000000) == 0)
  {
    v14 = v7 & 0xFFFFFFFFFFFFFF8;
    if (v12 <= *(_QWORD *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      goto LABEL_20;
    v11 = 1;
  }
  if (v7 >> 62)
    goto LABEL_36;
  v15 = *(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10);
LABEL_17:
  if (v15 <= v12)
    v15 = v12;
  OUTLINED_FUNCTION_29_1();
  v7 = MEMORY[0x212BD1278](v11, v15, 1, v7);
  OUTLINED_FUNCTION_45_18();
  *v4 = v7;
  v14 = v7 & 0xFFFFFFFFFFFFFF8;
LABEL_20:
  v16 = (_QWORD *)(v14 + 32 + 8 * v6);
  sub_210C34D54(0, (unint64_t *)&qword_253D7E650);
  swift_arrayDestroy();
  if (!v8)
  {
LABEL_28:
    *v16 = v3;
    return OUTLINED_FUNCTION_7_30();
  }
  if (v7 >> 62)
  {
    OUTLINED_FUNCTION_29_1();
    v17 = OUTLINED_FUNCTION_30_19();
    OUTLINED_FUNCTION_33();
  }
  else
  {
    v17 = *(_QWORD *)(v14 + 16);
  }
  if (__OFSUB__(v17, v5))
  {
    __break(1u);
  }
  else
  {
    result = sub_210D22878(v14 + 32 + 8 * v5, v17 - v5, v16 + 1);
    if (!(v7 >> 62))
    {
      v19 = *(_QWORD *)(v14 + 16);
      goto LABEL_26;
    }
  }
  OUTLINED_FUNCTION_29_1();
  v19 = sub_210E93490();
  result = OUTLINED_FUNCTION_33();
LABEL_26:
  if (!__OFADD__(v19, v8))
  {
    *(_QWORD *)(v14 + 16) = v19 + v8;
    goto LABEL_28;
  }
  __break(1u);
  return result;
}

uint64_t sub_210D2FD7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t (*a9)(uint64_t, uint64_t, uint64_t), unint64_t *a10)
{
  return sub_210D2FD98(a1, a2, (uint64_t)&qword_253D7E7C0, 0x24BDD1540, (uint64_t)sub_210D22878, a6, a7, a8, a9, a10);
}

uint64_t sub_210D2FD98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t (*a9)(uint64_t, uint64_t, uint64_t), unint64_t *a10)
{
  unint64_t *v10;
  uint64_t v11;
  unint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  unint64_t *v19;
  uint64_t (*v20)(uint64_t, uint64_t, uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t result;
  uint64_t v30;

  OUTLINED_FUNCTION_71_11();
  if (v17 < 0)
  {
    __break(1u);
  }
  else
  {
    v16 = v20;
    v12 = v19;
    v11 = v18;
    v14 = v17;
    v15 = *v10;
    if (!(*v10 >> 62))
    {
      v21 = *(_QWORD *)((v15 & 0xFFFFFFFFFFFFF8) + 0x10);
      goto LABEL_4;
    }
  }
  OUTLINED_FUNCTION_106();
  v21 = sub_210E93490();
  OUTLINED_FUNCTION_14();
LABEL_4:
  if (v21 < v11)
  {
    __break(1u);
    goto LABEL_32;
  }
  if (__OFSUB__(v11, v14))
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  v13 = v14 - v11;
  if (__OFSUB__(0, v11 - v14))
  {
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  v15 = *v10;
  a10 = v12;
  if (!(*v10 >> 62))
  {
    v22 = *(_QWORD *)((v15 & 0xFFFFFFFFFFFFF8) + 0x10);
    goto LABEL_9;
  }
LABEL_34:
  OUTLINED_FUNCTION_106();
  v22 = sub_210E93490();
  OUTLINED_FUNCTION_14();
LABEL_9:
  v23 = v22 + v13;
  if (__OFADD__(v22, v13))
  {
    __break(1u);
LABEL_36:
    OUTLINED_FUNCTION_106();
    v26 = sub_210E93490();
    OUTLINED_FUNCTION_14();
    goto LABEL_17;
  }
  v15 = *v10;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *v10 = v15;
  a9 = v16;
  v22 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject
    && (v15 & 0x8000000000000000) == 0
    && (v15 & 0x4000000000000000) == 0)
  {
    v25 = v15 & 0xFFFFFFFFFFFFFF8;
    if (v23 <= *(_QWORD *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      goto LABEL_20;
    v22 = 1;
  }
  if (v15 >> 62)
    goto LABEL_36;
  v26 = *(_QWORD *)((v15 & 0xFFFFFFFFFFFFF8) + 0x10);
LABEL_17:
  if (v26 <= v23)
    v26 = v23;
  OUTLINED_FUNCTION_106();
  v15 = MEMORY[0x212BD1278](v22, v26, 1, v15);
  OUTLINED_FUNCTION_45_18();
  *v10 = v15;
  v25 = v15 & 0xFFFFFFFFFFFFFF8;
LABEL_20:
  v27 = v25 + 32 + 8 * v14;
  sub_210C34D54(0, a10);
  swift_arrayDestroy();
  if (!v13)
  {
LABEL_28:
    OUTLINED_FUNCTION_69_3();
    return sub_210E92CE0();
  }
  if (v15 >> 62)
  {
    OUTLINED_FUNCTION_106();
    v28 = sub_210E93490();
    OUTLINED_FUNCTION_14();
  }
  else
  {
    v28 = *(_QWORD *)(v25 + 16);
  }
  if (__OFSUB__(v28, v11))
  {
    __break(1u);
  }
  else
  {
    result = a9(v25 + 32 + 8 * v11, v28 - v11, v27);
    if (!(v15 >> 62))
    {
      v30 = *(_QWORD *)(v25 + 16);
      goto LABEL_26;
    }
  }
  OUTLINED_FUNCTION_106();
  v30 = sub_210E93490();
  result = OUTLINED_FUNCTION_14();
LABEL_26:
  if (!__OFADD__(v30, v13))
  {
    *(_QWORD *)(v25 + 16) = v30 + v13;
    goto LABEL_28;
  }
  __break(1u);
  return result;
}

uint64_t sub_210D2FFC8(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;

  if (result < 0)
  {
    __break(1u);
    goto LABEL_18;
  }
  v5 = *v3;
  v6 = *(_QWORD *)(*v3 + 16);
  if (v6 < a2)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  v7 = result;
  v8 = a2 - result;
  if (__OFSUB__(a2, result))
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v10 = *(_QWORD *)(a3 + 16);
  v11 = v10 - v8;
  if (__OFSUB__(v10, v8))
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  if (__OFADD__(v6, v11))
  {
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  if (!swift_isUniquelyReferenced_nonNull_native() || v6 + v11 > *(_QWORD *)(v5 + 24) >> 1)
  {
    sub_210D21CE4();
    v5 = v12;
  }
  v13 = v5 + 32 + 40 * v7;
  sub_210D30C90();
  result = swift_arrayDestroy();
  if (!v11)
    goto LABEL_13;
  v14 = *(_QWORD *)(v5 + 16);
  if (__OFSUB__(v14, a2))
    goto LABEL_22;
  result = (uint64_t)sub_210D22AC8((char *)(v5 + 32 + 40 * a2), v14 - a2, (char *)(v13 + 40 * v10));
  v15 = *(_QWORD *)(v5 + 16);
  v16 = __OFADD__(v15, v11);
  v17 = v15 + v11;
  if (v16)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  *(_QWORD *)(v5 + 16) = v17;
LABEL_13:
  if (!v10)
  {
LABEL_16:
    result = swift_bridgeObjectRelease();
    *v3 = v5;
    return result;
  }
  if (*(_QWORD *)(a3 + 16) == v10)
  {
    swift_arrayInitWithCopy();
    goto LABEL_16;
  }
LABEL_24:
  __break(1u);
  return result;
}

uint64_t sub_210D30124(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  uint64_t *v6;
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
  BOOL v18;
  uint64_t v19;

  if (result < 0)
  {
    __break(1u);
    goto LABEL_18;
  }
  v8 = *v6;
  v9 = *(_QWORD *)(*v6 + 16);
  if (v9 < a2)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  v10 = result;
  v11 = a2 - result;
  if (__OFSUB__(a2, result))
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v12 = (a6 >> 1) - a5;
  if (__OFSUB__(a6 >> 1, a5))
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  v13 = v12 - v11;
  if (__OFSUB__(v12, v11))
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  if (__OFADD__(v9, v13))
  {
LABEL_22:
    __break(1u);
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  if (!swift_isUniquelyReferenced_nonNull_native() || v9 + v13 > *(_QWORD *)(v8 + 24) >> 1)
  {
    sub_210D21CE4();
    v8 = v14;
  }
  v15 = v8 + 32 + 40 * v10;
  sub_210D30C90();
  result = swift_arrayDestroy();
  if (!v13)
    goto LABEL_14;
  v16 = *(_QWORD *)(v8 + 16);
  if (__OFSUB__(v16, a2))
    goto LABEL_23;
  result = (uint64_t)sub_210D22AC8((char *)(v8 + 32 + 40 * a2), v16 - a2, (char *)(v15 + 40 * v12));
  v17 = *(_QWORD *)(v8 + 16);
  v18 = __OFADD__(v17, v13);
  v19 = v17 + v13;
  if (v18)
  {
LABEL_24:
    __break(1u);
    return result;
  }
  *(_QWORD *)(v8 + 16) = v19;
LABEL_14:
  if (v12 >= 1)
    swift_arrayInitWithCopy();
  result = swift_unknownObjectRelease();
  *v6 = v8;
  return result;
}

uint64_t sub_210D3028C(uint64_t result, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  if (result < 0)
  {
    __break(1u);
    goto LABEL_15;
  }
  v4 = *v2;
  v5 = *(_QWORD *)(*v2 + 16);
  if (v5 < a2)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  v6 = result;
  v7 = a2 - result;
  if (__OFSUB__(a2, result))
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v8 = result - a2;
  if (__OFSUB__(0, v7))
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  if (__OFADD__(v5, v8))
  {
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  if (!swift_isUniquelyReferenced_nonNull_native() || v5 - v7 > *(_QWORD *)(v4 + 24) >> 1)
  {
    sub_210D21CE4();
    v4 = v9;
  }
  v10 = (char *)(v4 + 32 + 40 * v6);
  sub_210D30C90();
  result = swift_arrayDestroy();
  if (!v7)
    goto LABEL_13;
  v11 = *(_QWORD *)(v4 + 16);
  if (__OFSUB__(v11, a2))
    goto LABEL_19;
  result = (uint64_t)sub_210D22AC8((char *)(v4 + 32 + 40 * a2), v11 - a2, v10);
  v12 = *(_QWORD *)(v4 + 16);
  v13 = __OFADD__(v12, v8);
  v14 = v12 - v7;
  if (!v13)
  {
    *(_QWORD *)(v4 + 16) = v14;
LABEL_13:
    *v2 = v4;
    return result;
  }
LABEL_20:
  __break(1u);
  return result;
}

uint64_t sub_210D30394(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;
  char v18;
  unint64_t v19;

  if (result < 0)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  v5 = *v3;
  v6 = *(_QWORD *)(*v3 + 16);
  if (v6 < a2)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v7 = result;
  v8 = a2 - result;
  if (__OFSUB__(a2, result))
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  v9 = 1 - v8;
  if (__OFSUB__(1, v8))
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  if (__OFADD__(v6, v9))
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *v3 = v5;
  if (!isUniquelyReferenced_nonNull_native || v6 + v9 > *(_QWORD *)(v5 + 24) >> 1)
  {
    sub_210D21CE4();
    v5 = v12;
    *v3 = v12;
  }
  v13 = v5 + 32 + 40 * v7;
  sub_210D30C90();
  result = swift_arrayDestroy();
  if (!v9)
  {
LABEL_13:
    v18 = 0;
    v19 = v5 + 40 * v7 - 8;
    while ((v18 & 1) == 0)
    {
      v19 += 40;
      result = sub_210C45310(a3, v19);
      v18 = 1;
      if (v19 >= v13)
        return sub_210D31010(a3, &qword_254A80D78, MEMORY[0x24BEE28D0]);
    }
    __break(1u);
    goto LABEL_18;
  }
  v14 = *(_QWORD *)(v5 + 16);
  if (__OFSUB__(v14, a2))
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  result = (uint64_t)sub_210D22AC8((char *)(v5 + 32 + 40 * a2), v14 - a2, (char *)(v13 + 40));
  v15 = *(_QWORD *)(v5 + 16);
  v16 = __OFADD__(v15, v9);
  v17 = v15 + v9;
  if (!v16)
  {
    *(_QWORD *)(v5 + 16) = v17;
    goto LABEL_13;
  }
LABEL_24:
  __break(1u);
  return result;
}

uint64_t sub_210D304FC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t *v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t result;
  uint64_t v16;

  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    v2 = a2;
    v4 = a1;
    v5 = *v3;
    if (!(*v3 >> 62))
    {
      v7 = *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10);
      goto LABEL_4;
    }
  }
  OUTLINED_FUNCTION_154();
  v7 = sub_210E93490();
  OUTLINED_FUNCTION_42();
LABEL_4:
  if (v7 < v2)
  {
    __break(1u);
    goto LABEL_32;
  }
  if (__OFSUB__(v2, v4))
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  v6 = v4 - v2;
  if (__OFSUB__(0, v2 - v4))
  {
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  v5 = *v3;
  if (!(*v3 >> 62))
  {
    v8 = *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10);
    goto LABEL_9;
  }
LABEL_34:
  OUTLINED_FUNCTION_154();
  v8 = OUTLINED_FUNCTION_30_19();
  OUTLINED_FUNCTION_42();
LABEL_9:
  v9 = v8 + v6;
  if (__OFADD__(v8, v6))
  {
    __break(1u);
LABEL_36:
    OUTLINED_FUNCTION_154();
    v12 = sub_210E93490();
    OUTLINED_FUNCTION_42();
    goto LABEL_17;
  }
  v5 = *v3;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *v3 = v5;
  v8 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v5 & 0x8000000000000000) == 0 && (v5 & 0x4000000000000000) == 0)
  {
    v11 = v5 & 0xFFFFFFFFFFFFFF8;
    if (v9 <= *(_QWORD *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      goto LABEL_20;
    v8 = 1;
  }
  if (v5 >> 62)
    goto LABEL_36;
  v12 = *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10);
LABEL_17:
  if (v12 <= v9)
    v12 = v9;
  OUTLINED_FUNCTION_154();
  v5 = MEMORY[0x212BD1278](v8, v12, 1, v5);
  OUTLINED_FUNCTION_45_18();
  *v3 = v5;
  v11 = v5 & 0xFFFFFFFFFFFFFF8;
LABEL_20:
  v13 = v11 + 32 + 8 * v4;
  type metadata accessor for PodcastAVItem();
  swift_arrayDestroy();
  if (!v6)
    return OUTLINED_FUNCTION_7_30();
  if (v5 >> 62)
  {
    OUTLINED_FUNCTION_154();
    v14 = sub_210E93490();
    OUTLINED_FUNCTION_42();
  }
  else
  {
    v14 = *(_QWORD *)(v11 + 16);
  }
  if (__OFSUB__(v14, v2))
  {
    __break(1u);
  }
  else
  {
    result = sub_210D22878(v11 + 32 + 8 * v2, v14 - v2, v13);
    if (!(v5 >> 62))
    {
      v16 = *(_QWORD *)(v11 + 16);
      goto LABEL_26;
    }
  }
  OUTLINED_FUNCTION_154();
  v16 = sub_210E93490();
  result = OUTLINED_FUNCTION_42();
LABEL_26:
  if (!__OFADD__(v16, v6))
  {
    *(_QWORD *)(v11 + 16) = v16 + v6;
    return OUTLINED_FUNCTION_7_30();
  }
  __break(1u);
  return result;
}

uint64_t sub_210D30704(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  _QWORD v13[3];
  uint64_t v14;
  uint64_t v15;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
  {
LABEL_7:
    swift_release();
    return 0;
  }
  v2 = 1 - v1;
  v3 = (_QWORD *)(a1 + 40 * v1 - 8);
  while (1)
  {
    v4 = v3[3];
    v5 = v3[4];
    __swift_project_boxed_opaque_existential_0Tm(v3, v4);
    (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(v5 + 32))(v13, v4, v5);
    v6 = v13[0];
    sub_210C45310((uint64_t)v3, (uint64_t)v13);
    if ((v6 & 1) == 0)
      break;
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v13);
LABEL_6:
    ++v2;
    v3 -= 5;
    if (v2 == 1)
      goto LABEL_7;
  }
  v7 = v14;
  v8 = v15;
  __swift_project_boxed_opaque_existential_0Tm(v13, v14);
  v9 = (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8))(v7, v8);
  v11 = sub_210D2E294(v9, v10);
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v13);
  if (!v11)
    goto LABEL_6;
  swift_release();
  return -v2;
}

unint64_t sub_210D30828@<X0>(unint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)(a2 + 16) > result)
  {
    return sub_210C45310(a2 + 40 * result + 32, a3);
  }
  __break(1u);
  return result;
}

double sub_210D30874@<D0>(void (*a1)(uint64_t *)@<X0>, uint64_t a2@<X2>, char a3@<W3>, uint64_t a4@<X8>)
{
  double result;
  uint64_t v5;

  if ((a3 & 1) != 0)
  {
    *(_QWORD *)(a4 + 32) = 0;
    result = 0.0;
    *(_OWORD *)a4 = 0u;
    *(_OWORD *)(a4 + 16) = 0u;
  }
  else
  {
    v5 = a2;
    a1(&v5);
  }
  return result;
}

void sub_210D308C0(unint64_t a1)
{
  if (a1 >> 62)
  {
    OUTLINED_FUNCTION_25();
    sub_210E93490();
    OUTLINED_FUNCTION_2_1();
  }
  JUMPOUT(0x212BD1278);
}

uint64_t sub_210D30920(uint64_t a1)
{
  return sub_210D21A64(0, *(_QWORD *)(a1 + 16), 0, a1);
}

void sub_210D30934()
{
  sub_210D21CE4();
}

void sub_210D30948(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v14;
  _QWORD *v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v24;
  uint64_t v25;
  unint64_t v26;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v32;
  uint64_t v33;
  __int128 v34[2];
  __int128 v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;

  v38 = a1;
  v4 = *a1;
  v5 = *(_QWORD *)(*a1 + 16);
  if (!v5)
    goto LABEL_11;
  swift_bridgeObjectRetain();
  v7 = 0;
  v8 = 0;
  while (1)
  {
    v9 = *(_QWORD *)(v4 + v7 + 56);
    v10 = *(_QWORD *)(v4 + v7 + 64);
    __swift_project_boxed_opaque_existential_0Tm((_QWORD *)(v4 + v7 + 32), v9);
    v11 = (*(uint64_t (**)(uint64_t, uint64_t))(v10 + 8))(v9, v10);
    if (v12)
      break;
LABEL_9:
    ++v8;
    v7 += 40;
    if (v5 == v8)
    {
      swift_bridgeObjectRelease();
LABEL_11:
      swift_bridgeObjectRelease();
      return;
    }
  }
  if (v11 != a2 || v12 != a3)
  {
    v14 = sub_210E93544();
    swift_bridgeObjectRelease();
    if ((v14 & 1) != 0)
      goto LABEL_13;
    goto LABEL_9;
  }
  swift_bridgeObjectRelease();
LABEL_13:
  swift_bridgeObjectRelease();
  v15 = v38;
  if (__OFADD__(v8, 1))
    goto LABEL_50;
  v16 = *(_QWORD *)(v4 + 16);
  if (v8 + 1 == v16)
  {
LABEL_15:
    swift_bridgeObjectRelease();
    return;
  }
  v17 = v7 + 72;
  v18 = v8 + 1;
  while (2)
  {
    if (v18 < v16)
    {
      sub_210C45310(v4 + v17, (uint64_t)&v35);
      v19 = v36;
      v20 = v37;
      __swift_project_boxed_opaque_existential_0Tm(&v35, v36);
      v21 = (*(uint64_t (**)(uint64_t, uint64_t))(v20 + 8))(v19, v20);
      if (v22)
      {
        if (v21 == a2 && v22 == a3)
        {
          swift_bridgeObjectRelease();
          __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v35);
LABEL_39:
          v32 = v18 + 1;
          if (__OFADD__(v18, 1))
            goto LABEL_43;
          v4 = *v15;
          v16 = *(_QWORD *)(*v15 + 16);
          ++v18;
          v17 += 40;
          if (v32 == v16)
            goto LABEL_15;
          continue;
        }
        v24 = sub_210E93544();
        swift_bridgeObjectRelease();
        __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v35);
        if ((v24 & 1) != 0)
          goto LABEL_39;
      }
      else
      {
        __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)&v35);
      }
      if (v18 != v8)
      {
        if ((v8 & 0x8000000000000000) != 0)
          goto LABEL_45;
        v25 = *v15;
        v26 = *(_QWORD *)(*v15 + 16);
        if (v8 >= v26)
          goto LABEL_46;
        sub_210C45310(v25 + 40 * v8 + 32, (uint64_t)&v35);
        if (v18 >= v26)
          goto LABEL_47;
        sub_210C45310(v25 + v17, (uint64_t)v34);
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v15 = v38;
        *v38 = v25;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          sub_210D30934();
          v25 = v33;
          *v15 = v33;
        }
        if (v8 >= *(_QWORD *)(v25 + 16))
          goto LABEL_48;
        v28 = v25 + 40 * v8 + 32;
        __swift_destroy_boxed_opaque_existential_0Tm(v28);
        sub_210C45354(v34, v28);
        v29 = *v15;
        if (v18 >= *(_QWORD *)(*v15 + 16))
          goto LABEL_49;
        v30 = v29 + v17;
        __swift_destroy_boxed_opaque_existential_0Tm(v29 + v17);
        sub_210C45354(&v35, v30);
      }
      if (__OFADD__(v8++, 1))
        goto LABEL_44;
      goto LABEL_39;
    }
    break;
  }
  __break(1u);
LABEL_43:
  __break(1u);
LABEL_44:
  __break(1u);
LABEL_45:
  __break(1u);
LABEL_46:
  __break(1u);
LABEL_47:
  __break(1u);
LABEL_48:
  __break(1u);
LABEL_49:
  __break(1u);
LABEL_50:
  __break(1u);
}

unint64_t sub_210D30C40@<X0>(unint64_t *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  return sub_210D30828(*a1, *a2, a3);
}

unint64_t sub_210D30C74@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_210D30C40(a1, *(uint64_t **)(v2 + 16), a2);
}

unint64_t sub_210D30C90()
{
  unint64_t result;

  result = qword_254A7F930;
  if (!qword_254A7F930)
  {
    result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_254A7F930);
  }
  return result;
}

unint64_t sub_210D30CE4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254A80BE0;
  if (!qword_254A80BE0)
  {
    sub_210D31048(255, &qword_254A80BD8, (uint64_t (*)(uint64_t, unint64_t))MEMORY[0x24BEE1250]);
    result = MEMORY[0x212BD2E20](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&qword_254A80BE0);
  }
  return result;
}

uint64_t sub_210D30D34()
{
  sub_210E93430();
  sub_210E92C38();
  sub_210E93430();
  return 0;
}

unint64_t sub_210D30DCC()
{
  unint64_t result;

  result = qword_254A80BE8;
  if (!qword_254A80BE8)
  {
    result = MEMORY[0x212BD2E20](&protocol conformance descriptor for PodcastQueueType, &type metadata for PodcastQueueType);
    atomic_store(result, (unint64_t *)&qword_254A80BE8);
  }
  return result;
}

uint64_t type metadata accessor for PodcastsManagedQueue()
{
  return objc_opt_self();
}

uint64_t method lookup function for PodcastsManagedQueue()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PodcastsManagedQueue.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of PodcastsManagedQueue.tailInsertionContentItemID.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of PodcastsManagedQueue.queueIDs.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 168))();
}

uint64_t dispatch thunk of PodcastsManagedQueue.firstContentItemID.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 208))();
}

uint64_t dispatch thunk of PodcastsManagedQueue.itemForContentID(id:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 216))();
}

uint64_t dispatch thunk of PodcastsManagedQueue.indexForContentID(id:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 224))();
}

uint64_t dispatch thunk of PodcastsManagedQueue.replaceSoftQueueItems(newItems:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 232))();
}

uint64_t dispatch thunk of PodcastsManagedQueue.shiftHardQueueOnCurrentItemDidChange(fromContentItemID:toContentItemID:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 248))();
}

uint64_t dispatch thunk of PodcastsManagedQueue.insertHardQueueItems(targetContentItemID:newItems:insertionPosition:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 256))();
}

uint64_t dispatch thunk of PodcastsManagedQueue.appendToSoftQueue(newItems:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 272))();
}

uint64_t dispatch thunk of PodcastsManagedQueue.restoreItems(newItems:restorationTailInsertionContentItemID:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 280))();
}

uint64_t dispatch thunk of PodcastsManagedQueue.moveContentItemID(_:beforeContentItemID:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 288))();
}

uint64_t dispatch thunk of PodcastsManagedQueue.moveContentItemID(_:afterContentItemID:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 296))();
}

uint64_t dispatch thunk of PodcastsManagedQueue.removeContentItemID(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 304))();
}

uint64_t dispatch thunk of PodcastsManagedQueue.clearHardQueue(afterContentItemID:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 312))();
}

uint64_t dispatch thunk of PodcastsManagedQueue.reset()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 320))();
}

uint64_t storeEnumTagSinglePayload for PodcastQueueType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_210D30F58 + 4 * byte_210ED82C5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_210D30F8C + 4 * byte_210ED82C0[v4]))();
}

uint64_t sub_210D30F8C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_210D30F94(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x210D30F9CLL);
  return result;
}

uint64_t sub_210D30FA8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x210D30FB0);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_210D30FB4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_210D30FBC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for PodcastQueueType()
{
  return &type metadata for PodcastQueueType;
}

uint64_t dispatch thunk of PodcastsQueueItem.contentItemID.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of PodcastsQueueItem.queueSectionID.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of PodcastsQueueItem.queueItemID.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of PodcastsQueueItem.queueType.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of PodcastsQueueItem.queueType.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t dispatch thunk of PodcastsQueueItem.queueType.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

uint64_t dispatch thunk of PodcastsQueueItem.prewarm()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t sub_210D31010(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, unint64_t))
{
  uint64_t v4;

  OUTLINED_FUNCTION_47_19(a1, a2, a3);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

void sub_210D31048(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, unint64_t))
{
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;

  if (!*a2)
  {
    v6 = sub_210D30C90();
    v7 = a3(a1, v6);
    if (!v8)
      atomic_store(v7, a2);
  }
  OUTLINED_FUNCTION_1();
}

void OUTLINED_FUNCTION_47_19(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, unint64_t))
{
  sub_210D31048(0, a2, a3);
}

uint64_t sub_210D310B4(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  _BYTE v12[40];

  v2 = v1;
  swift_unknownObjectWeakInit();
  *(_OWORD *)(v1 + 24) = 0u;
  v4 = v1 + 24;
  *(_QWORD *)(v1 + 56) = 0;
  *(_OWORD *)(v1 + 40) = 0u;
  v5 = swift_unknownObjectWeakAssign();
  v6 = (void *)MEMORY[0x212BD2FC4](v5);
  if (v6)
  {
    v7 = v6;
    v8 = objc_msgSend(v6, sel_playbackEngine);

    if (v8)
    {
      if ((objc_msgSend(v8, sel_isSystemPodcastsApplication) & 1) == 0)
      {
        v9 = objc_allocWithZone((Class)sub_210E91E58());
        v10 = (void *)sub_210E91E4C();
        sub_210E91E1C();
        sub_210E91E10();
        sub_210E91DF8();
        sub_210E91E04();
        swift_release();
        swift_release();

        swift_beginAccess();
        sub_210D32850((uint64_t)v12, v4);
        swift_endAccess();
        return v2;
      }

    }
  }

  return v2;
}

uint64_t sub_210D31224()
{
  id v0;

  v0 = objc_allocWithZone((Class)sub_210E91DEC());
  return sub_210E91DD4();
}

id sub_210D31260(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  void *v11;
  id v12;
  id result;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  _QWORD *v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  void *v38;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t inited;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  id v48;
  _QWORD v49[5];
  __int128 aBlock[7];

  v4 = sub_210E91D68();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4, v6, v7);
  v9 = (char *)&v45 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_48();
  sub_210D32548(v2 + 24, (uint64_t)aBlock);
  if (!*((_QWORD *)&aBlock[1] + 1))
  {
    sub_210D324A0((uint64_t)aBlock);
    return (id)sub_210E92B30();
  }
  sub_210C45354(aBlock, (uint64_t)v49);
  v10 = (void *)MEMORY[0x212BD2FC4](v2 + 16);
  if (!v10
    || (v11 = v10,
        v12 = objc_msgSend(v10, sel_playbackEngine),
        v11,
        !v12))
  {
    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v49);
    return (id)sub_210E92B30();
  }
  result = objc_msgSend((id)objc_opt_self(), sel_mediaPlaybackCoreBundle);
  v48 = result;
  if (result)
  {
    sub_210E91D5C();
    v14 = sub_210E91D38();
    v16 = v15;
    (*(void (**)(char *, uint64_t))(v5 + 8))(v9, v4);
    v17 = OUTLINED_FUNCTION_16_0();
    *(_BYTE *)(v17 + 16) = 0;
    v18 = MEMORY[0x24BEE4AF8];
    *(_QWORD *)(v17 + 24) = MEMORY[0x24BEE4AF8];
    *(_QWORD *)(v17 + 32) = v18;
    *(_QWORD *)(v17 + 40) = v18;
    *(_BYTE *)(v17 + 48) = 1;
    *(_QWORD *)(v17 + 56) = v18;
    *(_QWORD *)(v17 + 64) = v18;
    *(_QWORD *)(v17 + 72) = v18;
    *(_QWORD *)(v17 + 80) = v18;
    *(_QWORD *)(v17 + 88) = v18;
    *(_QWORD *)(v17 + 96) = v18;
    *(_QWORD *)(v17 + 104) = v18;
    *(_QWORD *)(v17 + 112) = v14;
    v45 = v14;
    *(_QWORD *)(v17 + 120) = v16;
    v19 = OUTLINED_FUNCTION_16_0();
    *(_BYTE *)(v19 + 16) = 0;
    swift_bridgeObjectRetain();
    v47 = v12;
    v20 = objc_msgSend(v12, sel_eventStream);
    v21 = (_QWORD *)OUTLINED_FUNCTION_16_0();
    v21[2] = v19;
    v21[3] = v17;
    v21[4] = a2;
    *(_QWORD *)&aBlock[2] = sub_210D32658;
    *((_QWORD *)&aBlock[2] + 1) = v21;
    *(_QWORD *)&aBlock[0] = MEMORY[0x24BDAC760];
    *((_QWORD *)&aBlock[0] + 1) = 1107296256;
    *(_QWORD *)&aBlock[1] = sub_210D3240C;
    *((_QWORD *)&aBlock[1] + 1) = &block_descriptor_26;
    v22 = _Block_copy(aBlock);
    swift_retain();
    swift_retain();
    v23 = a2;
    swift_release();
    objc_msgSend(v20, sel_performQuery_, v22);
    _Block_release(v22);

    OUTLINED_FUNCTION_48();
    memcpy(aBlock, (const void *)(v17 + 16), sizeof(aBlock));
    sub_210D32664((uint64_t)aBlock);
    sub_210D33414();
    sub_210D32720((uint64_t)aBlock);
    __swift_project_boxed_opaque_existential_0Tm(v49, v49[3]);
    v24 = (void *)sub_210E91E28();
    swift_bridgeObjectRelease();
    v25 = sub_210E91DE0();
    if (v26)
    {
      v27 = v26;
      v46 = v25;
    }
    else
    {
      v29 = (void *)sub_210E92B84();
      OUTLINED_FUNCTION_1_42();
      v30 = (void *)OUTLINED_FUNCTION_2_34();
      v31 = objc_msgSend(v48, sel_localizedStringForKey_value_table_localization_, v29, 0, "MediaPlaybackCore", v30);

      v46 = sub_210E92BA8();
      v27 = v32;

    }
    v33 = sub_210E91DC8();
    if (v34)
    {
      v35 = v33;
      v36 = v34;
      swift_bridgeObjectRelease();
      v37 = v48;
    }
    else
    {
      v38 = (void *)sub_210E92B84();
      OUTLINED_FUNCTION_1_42();
      v39 = (void *)OUTLINED_FUNCTION_2_34();
      swift_bridgeObjectRelease();
      v37 = v48;
      v40 = objc_msgSend(v48, sel_localizedStringForKey_value_table_localization_, v38, 0, "MediaPlaybackCore", v39);

      v35 = sub_210E92BA8();
      v36 = v41;

    }
    sub_210C33834(0, (unint64_t *)&qword_253D7B4E8, (uint64_t (*)(uint64_t))sub_210D327DC, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_210ED27C0;
    *(_QWORD *)(inited + 32) = sub_210E92BA8();
    *(_QWORD *)(inited + 40) = v43;
    *(_QWORD *)(inited + 48) = v46;
    *(_QWORD *)(inited + 56) = v27;
    *(_QWORD *)(inited + 64) = sub_210E92BA8();
    *(_QWORD *)(inited + 72) = v44;
    *(_QWORD *)(inited + 80) = v35;
    *(_QWORD *)(inited + 88) = v36;
    v28 = sub_210E92B30();

    swift_release();
    swift_release();

    __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v49);
    return (id)v28;
  }
  __break(1u);
  return result;
}

void sub_210D31780(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v8;
  id v9;
  _BYTE *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  char **v15;
  id v16;
  uint64_t v17;
  __CFString *v18;
  __CFString *v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v28;
  id v29;
  uint64_t v30;
  __CFString *v31;
  id v32;
  uint64_t v33;
  __CFString *v34;
  id v35;
  char v36;
  id v37;
  _BYTE *v38;
  id v39;
  uint64_t v40;
  __CFString *v41;
  __CFString *v42;
  void *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char v50;
  uint64_t v51;
  NSObject *v52;
  os_log_type_t v53;
  uint8_t *v54;
  id v55;
  id v56;
  uint64_t v57;
  __CFString *v58;
  id v59;
  uint64_t v60;
  id v61;
  uint64_t v62;
  __CFString *v63;
  __CFString *v64;
  uint64_t v65;
  id v66;
  uint64_t v67;
  _BYTE *v68;
  void *v69;
  id v70;
  uint64_t v71;
  void *v72;
  __int128 aBlock;
  void (*v74)(uint64_t, void *);
  void *v75;
  uint64_t (*v76)(uint64_t, uint64_t);
  uint64_t v77;

  v8 = objc_msgSend(a1, sel_findPreviousEventWithType_matchingPayload_, CFSTR("remote-control-begin"), 0);
  if (!v8)
    return;
  v9 = v8;
  v66 = a4;
  v10 = (_BYTE *)(a2 + 16);
  v11 = (char *)objc_msgSend(a1, sel_cursorUntilEvent_, v8);
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = a2 + 16;
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = sub_210D3283C;
  *(_QWORD *)(v13 + 24) = v12;
  v76 = sub_210C574D0;
  v77 = v13;
  *(_QWORD *)&aBlock = MEMORY[0x24BDAC760];
  *((_QWORD *)&aBlock + 1) = 1107296256;
  v74 = sub_210D06C54;
  v75 = &block_descriptor_15;
  v14 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v11, sel_enumeratePreviousEventsWithType_usingBlock_, CFSTR("queue-add"), v14);
  _Block_release(v14);
  LOBYTE(v14) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  if ((v14 & 1) != 0)
  {
    __break(1u);
    goto LABEL_58;
  }
  v69 = v9;
  v15 = &selRef_discoverAirplayDevicesMatchingGroupID_completion_;
  v16 = objc_msgSend(v11, sel_findPreviousEventWithType_matchingPayload_, CFSTR("session-reuse"), 0);
  if (v16)
  {

    swift_beginAccess();
    *v10 = 1;
  }
  v67 = a3;
  v68 = (_BYTE *)(a3 + 16);
  sub_210C33834(0, &qword_253D7E8C8, (uint64_t (*)(uint64_t))type metadata accessor for MPCPlaybackEngineEventType, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
  v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = xmmword_210ED27C0;
  *(_QWORD *)(v17 + 32) = CFSTR("container-begin");
  *(_QWORD *)(v17 + 40) = CFSTR("container-end");
  type metadata accessor for MPCPlaybackEngineEventType(0);
  v18 = CFSTR("container-begin");
  v19 = CFSTR("container-end");
  v20 = (void *)sub_210E92CBC();
  swift_bridgeObjectRelease();
  v21 = objc_msgSend(a1, sel_findPreviousEventWithTypes_matchingPayload_, v20, 0);

  if (v21)
  {
    v22 = objc_msgSend(v21, sel_type);
    v23 = sub_210E92BA8();
    v25 = v24;
    if (v23 == sub_210E92BA8() && v25 == v26)
    {

      swift_bridgeObjectRelease_n();
    }
    else
    {
      v28 = sub_210E93544();

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v28 & 1) == 0)
      {

        v15 = &selRef_discoverAirplayDevicesMatchingGroupID_completion_;
        goto LABEL_23;
      }
    }
    v29 = objc_msgSend(v21, sel_payload);
    type metadata accessor for MPCPlaybackEngineEventPayloadKey(0);
    sub_210C35144((unint64_t *)&qword_253D7E740, (uint64_t (*)(uint64_t))type metadata accessor for MPCPlaybackEngineEventPayloadKey, (uint64_t)&unk_210ED056C);
    v30 = sub_210E92B18();

    v31 = CFSTR("container-kind");
    sub_210CEEF78(v30, &aBlock);

    swift_bridgeObjectRelease();
    if (v75)
    {
      sub_210C34D54(0, &qword_254A7FD70);
      if ((swift_dynamicCast() & 1) == 0)
        goto LABEL_21;
      v32 = objc_msgSend(v21, sel_payload);
      v33 = sub_210E92B18();

      v34 = CFSTR("container-ids");
      sub_210CEEF78(v33, &aBlock);

      swift_bridgeObjectRelease();
      if (v75)
      {
        sub_210C34D54(0, &qword_253D7E690);
        if ((swift_dynamicCast() & 1) != 0)
        {
          v35 = v72;
          v36 = sub_210D33188(v35);
          swift_beginAccess();
          *(_BYTE *)(v67 + 16) = v36;
          v37 = objc_msgSend(v72, sel_prioritizedStoreStringIdentifiersForPersonID_, 0);
          v65 = sub_210E92CC8();

          swift_beginAccess();
          *(_QWORD *)(v67 + 32) = v65;
          swift_bridgeObjectRelease();
LABEL_22:
          v15 = &selRef_discoverAirplayDevicesMatchingGroupID_completion_;
          goto LABEL_23;
        }

LABEL_21:
        goto LABEL_22;
      }

    }
    sub_210C33398((uint64_t)&aBlock);
    goto LABEL_22;
  }
LABEL_23:
  swift_beginAccess();
  if (*v10 == 1)
  {
    swift_beginAccess();
    *v68 = 0;
  }
  v38 = objc_msgSend(a1, v15[238], CFSTR("session-begin"), 0);
  if (!v38)
  {
    swift_release();

    swift_unknownObjectRelease();
    return;
  }
  v10 = v38;
  v39 = objc_msgSend(a1, sel_cursorUntilEvent_, v38);
  v40 = swift_allocObject();
  *(_OWORD *)(v40 + 16) = xmmword_210ED27C0;
  *(_QWORD *)(v40 + 32) = CFSTR("item-begin");
  *(_QWORD *)(v40 + 40) = CFSTR("item-end");
  v41 = CFSTR("item-begin");
  v42 = CFSTR("item-end");
  v43 = (void *)sub_210E92CBC();
  swift_bridgeObjectRelease();
  v9 = objc_msgSend(v39, sel_findPreviousEventWithTypes_matchingPayload_, v43, 0);

  if (v9)
  {
    v44 = objc_msgSend(v9, sel_type);
    v45 = sub_210E92BA8();
    v47 = v46;
    if (v45 == sub_210E92BA8() && v47 == v48)
    {

      swift_bridgeObjectRelease_n();
    }
    else
    {
      v11 = (char *)&selRef_siriRecommendationID;
      v50 = sub_210E93544();

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v50 & 1) == 0)
      {
        if (qword_253D7EED0 == -1)
        {
LABEL_33:
          v51 = sub_210E92704();
          __swift_project_value_buffer(v51, (uint64_t)qword_253D81968);
          v52 = sub_210E926F8();
          v53 = sub_210E92F8C();
          if (os_log_type_enabled(v52, v53))
          {
            v54 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)v54 = 0;
            _os_log_impl(&dword_210BD8000, v52, v53, "❗️Current item is outside of an item event", v54, 2u);
            MEMORY[0x212BD2EEC](v54, -1, -1);
          }

          v55 = objc_msgSend(v66, v11 + 72);
          swift_unknownObjectRelease();
          swift_unknownObjectRelease();

          if (v55 == (id)2)
          {
            swift_beginAccess();
            *(_BYTE *)(v67 + 16) = 4;
            *(_BYTE *)(v67 + 48) = 0;
          }
          goto LABEL_53;
        }
LABEL_58:
        swift_once();
        goto LABEL_33;
      }
    }
    v56 = objc_msgSend(v9, sel_payload);
    type metadata accessor for MPCPlaybackEngineEventPayloadKey(0);
    sub_210C35144((unint64_t *)&qword_253D7E740, (uint64_t (*)(uint64_t))type metadata accessor for MPCPlaybackEngineEventPayloadKey, (uint64_t)&unk_210ED056C);
    v57 = sub_210E92B18();

    v58 = CFSTR("item-ids");
    sub_210CEEF78(v57, &aBlock);

    swift_bridgeObjectRelease();
    if (v75)
    {
      sub_210C34D54(0, &qword_253D7E690);
      if ((swift_dynamicCast() & 1) != 0)
      {
        v59 = objc_msgSend(v70, sel_prioritizedStoreStringIdentifiersForPersonID_, 0);
        v60 = sub_210E92CC8();

        swift_beginAccess();
        *(_QWORD *)(v67 + 24) = v60;
        swift_bridgeObjectRelease();
      }
    }
    else
    {
      sub_210C33398((uint64_t)&aBlock);
    }
    v61 = objc_msgSend(v9, sel_payload);
    v62 = sub_210E92B18();

    v63 = CFSTR("item-metadata");
    sub_210CEEF78(v62, &aBlock);

    swift_bridgeObjectRelease();
    if (!v75)
    {
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();

LABEL_52:
      sub_210C33398((uint64_t)&aBlock);
LABEL_53:
      swift_release();
      return;
    }
    sub_210C57518();
    if ((swift_dynamicCast() & 1) != 0)
    {
      v64 = CFSTR("item-has-video");
      sub_210CEEF78(v71, &aBlock);

      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      swift_bridgeObjectRelease();

      if (v75)
      {
        if ((swift_dynamicCast() & 1) != 0 && v71 == 1)
        {
          swift_beginAccess();
          *(_BYTE *)(v67 + 16) = 4;
          *(_BYTE *)(v67 + 48) = 0;
        }
        goto LABEL_53;
      }
      goto LABEL_52;
    }
    swift_release();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();

  }
  else
  {
    swift_release();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
  }

}

uint64_t sub_210D322E0(void *a1, uint64_t a2, _BYTE *a3)
{
  id v4;
  uint64_t v5;
  __CFString *v6;
  uint64_t result;
  void *v8;
  __int128 v9;
  uint64_t v10;

  v4 = objc_msgSend(a1, sel_payload);
  type metadata accessor for MPCPlaybackEngineEventPayloadKey(0);
  sub_210C35144((unint64_t *)&qword_253D7E740, (uint64_t (*)(uint64_t))type metadata accessor for MPCPlaybackEngineEventPayloadKey, (uint64_t)&unk_210ED056C);
  v5 = sub_210E92B18();

  v6 = CFSTR("queue-start-item-ids");
  sub_210CEEF78(v5, &v9);

  swift_bridgeObjectRelease();
  if (!v10)
    return sub_210C33398((uint64_t)&v9);
  sub_210C34D54(0, &qword_253D7E690);
  result = swift_dynamicCast();
  if ((result & 1) != 0)
  {

    result = swift_beginAccess();
    *a3 = 1;
  }
  return result;
}

uint64_t sub_210D3240C(uint64_t a1)
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

uint64_t sub_210D32454()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy();
  sub_210D324A0(v0 + 24);
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for MPCDialogHandler()
{
  return objc_opt_self();
}

uint64_t sub_210D324A0(uint64_t a1)
{
  uint64_t v2;

  sub_210C33834(0, &qword_253D7ED38, (uint64_t (*)(uint64_t))sub_210D324F4, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_210D324F4()
{
  unint64_t result;

  result = qword_253D7E9E8;
  if (!qword_253D7E9E8)
  {
    result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_253D7E9E8);
  }
  return result;
}

uint64_t sub_210D32548(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_210C33834(0, &qword_253D7ED38, (uint64_t (*)(uint64_t))sub_210D324F4, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_210D325A4()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_210D32618()
{
  return OUTLINED_FUNCTION_0_2();
}

uint64_t sub_210D32624()
{
  uint64_t v0;

  swift_release();
  swift_release();

  return swift_deallocObject();
}

void sub_210D32658(void *a1)
{
  uint64_t v1;

  sub_210D31780(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(void **)(v1 + 32));
}

uint64_t sub_210D32664(uint64_t a1)
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_210D32720(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return a1;
}

void sub_210D327DC()
{
  unint64_t TupleTypeMetadata2;
  uint64_t v1;

  if (!qword_253D7B4B0)
  {
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1)
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_253D7B4B0);
  }
}

uint64_t sub_210D32830()
{
  return OUTLINED_FUNCTION_0_2();
}

uint64_t sub_210D3283C(void *a1, uint64_t a2)
{
  uint64_t v2;

  return sub_210D322E0(a1, a2, *(_BYTE **)(v2 + 16));
}

uint64_t sub_210D32844()
{
  return OUTLINED_FUNCTION_0_2();
}

uint64_t sub_210D32850(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_210C33834(0, &qword_253D7ED38, (uint64_t (*)(uint64_t))sub_210D324F4, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

void sub_210D328B4(uint64_t a1)
{
  sub_210D32904(a1, (void (*)(uint64_t))sub_210C70118);
}

void sub_210D328C4(char a1)
{
  sub_210D32B5C(0, a1);
}

void sub_210D328D0()
{
  OUTLINED_FUNCTION_16_31();
  OUTLINED_FUNCTION_15_31();
  OUTLINED_FUNCTION_121();
  OUTLINED_FUNCTION_19();
}

void sub_210D328F8(uint64_t a1)
{
  sub_210D32904(a1, (void (*)(uint64_t))sub_210D3393C);
}

void sub_210D32904(uint64_t a1, void (*a2)(uint64_t))
{
  OUTLINED_FUNCTION_16_31();
  a2(a1);
  OUTLINED_FUNCTION_7_31();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_121();
  OUTLINED_FUNCTION_19();
}

void sub_210D3293C()
{
  sub_210D32AC0();
}

void sub_210D32948()
{
  OUTLINED_FUNCTION_0_40();
  OUTLINED_FUNCTION_0();
}

uint64_t sub_210D32960(uint64_t a1, char a2)
{
  if (a2)
    OUTLINED_FUNCTION_2_35();
  else
    OUTLINED_FUNCTION_6_35();
  OUTLINED_FUNCTION_10_33();
  return OUTLINED_FUNCTION_10_0();
}

uint64_t sub_210D3299C(uint64_t a1, unsigned __int8 a2)
{
  sub_210C70118(a2);
  sub_210E92C2C();
  return OUTLINED_FUNCTION_10_0();
}

uint64_t sub_210D329D8()
{
  sub_210E92C2C();
  return swift_bridgeObjectRelease();
}

void sub_210D32A14(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_210D32A4C()
{
  OUTLINED_FUNCTION_10_33();
  return OUTLINED_FUNCTION_10_0();
}

void sub_210D32AB4(uint64_t a1, uint64_t a2)
{
  sub_210D32B24(a1, a2, (void (*)(uint64_t))sub_210D3393C);
}

void sub_210D32AC0()
{
  OUTLINED_FUNCTION_12_30();
  sub_210E92C2C();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_121();
  OUTLINED_FUNCTION_19();
}

void sub_210D32B18(uint64_t a1, uint64_t a2)
{
  sub_210D32B24(a1, a2, (void (*)(uint64_t))sub_210C70118);
}

void sub_210D32B24(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  OUTLINED_FUNCTION_12_30();
  a3(a2);
  OUTLINED_FUNCTION_7_31();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_121();
  OUTLINED_FUNCTION_19();
}

void sub_210D32B5C(uint64_t a1, char a2)
{
  OUTLINED_FUNCTION_12_30();
  if (a2)
    OUTLINED_FUNCTION_2_35();
  else
    OUTLINED_FUNCTION_6_35();
  OUTLINED_FUNCTION_10_33();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_121();
  OUTLINED_FUNCTION_19();
}

void sub_210D32BAC()
{
  OUTLINED_FUNCTION_12_30();
  OUTLINED_FUNCTION_15_31();
  OUTLINED_FUNCTION_121();
  OUTLINED_FUNCTION_19();
}

uint64_t sub_210D32BD4()
{
  sub_210E93610();
  sub_210E9361C();
  return sub_210E93634();
}

BOOL sub_210D32C14(uint64_t a1, uint64_t a2)
{
  int v2;
  double v3;
  double v4;
  _BOOL8 result;
  double v7;
  double v8;

  v2 = *(unsigned __int8 *)(a1 + 64);
  if (v2 == 2)
    return 1;
  if (!*(_BYTE *)(a2 + 64))
  {
    v7 = *(double *)(a1 + 16);
    v8 = *(double *)(a2 + 16);
    if (*(_BYTE *)(a1 + 64))
    {
      if (v7 == v8)
        return 1;
    }
    else if (v7 == v8
           || (~*(_QWORD *)&v7 & 0x7FF0000000000000) == 0
           && (*(_QWORD *)(a1 + 16) & 0xFFFFFFFFFFFFFLL) != 0
           && (~*(_QWORD *)&v8 & 0x7FF0000000000000) == 0
           && (*(_QWORD *)(a2 + 16) & 0xFFFFFFFFFFFFFLL) != 0)
    {
      return 1;
    }
    return 0;
  }
  if (*(_BYTE *)(a2 + 64) != 1)
    return 1;
  v3 = *(double *)(a1 + 16);
  v4 = *(double *)(a2 + 16);
  result = v3 == v4 || v2 == 0;
  if (!v2 && v3 != v4)
    return 0;
  return result;
}

uint64_t sub_210D32CC8(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  void *v18;

  if (!a1)
    goto LABEL_4;
  v2 = sub_210E9316C();
  v4 = v3;
  v6 = v5;
  type metadata accessor for CMClock(0);
  v8 = v7;
  v9 = (void *)sub_210E92EFC();
  v18 = v9;
  MEMORY[0x212BD0DE0](v2, v4, v6, &v18, v8, MEMORY[0x24BEE51F0]);

  OUTLINED_FUNCTION_13_24();
  if ((sub_210E93160() & 1) != 0)
  {
    OUTLINED_FUNCTION_13_24();
    v10 = (sub_210E93184() & 1) == 0;
  }
  else
  {
LABEL_4:
    v10 = 1;
  }
  type metadata accessor for EventTime();
  v11 = swift_allocObject();
  v12 = OUTLINED_FUNCTION_13_24();
  sub_210C38A60(v12, v13, v14, v10, v15, v16);

  return v11;
}

unint64_t sub_210D32DEC(unint64_t result)
{
  if (result >= 3)
    return 3;
  return result;
}

uint64_t sub_210D32DFC(uint64_t result)
{
  return result;
}

uint64_t sub_210D32E04()
{
  return sub_210D32BD4();
}

unint64_t sub_210D32E0C@<X0>(unint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result;

  result = sub_210D32DEC(*a1);
  *a2 = result;
  return result;
}

void sub_210D32E34(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = sub_210D32DFC(*v1);
  OUTLINED_FUNCTION_0();
}

uint64_t storeEnumTagSinglePayload for EventTime.TimeType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_210D32EA4 + 4 * byte_210ED842A[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_210D32ED8 + 4 * byte_210ED8425[v4]))();
}

uint64_t sub_210D32ED8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_210D32EE0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x210D32EE8);
  return result;
}

uint64_t sub_210D32EF4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x210D32EFCLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_210D32F00(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_210D32F08(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for EventTime.TimeType()
{
  return &type metadata for EventTime.TimeType;
}

unint64_t sub_210D32F28()
{
  unint64_t result;

  result = qword_254A80E60;
  if (!qword_254A80E60)
  {
    result = MEMORY[0x212BD2E20](&unk_210ED84F0, &type metadata for EventTime.TimeType);
    atomic_store(result, (unint64_t *)&qword_254A80E60);
  }
  return result;
}

BOOL sub_210D32F64(uint64_t *a1, uint64_t *a2)
{
  return sub_210D32C14(*a1, *a2);
}

uint64_t sub_210D32F84()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;

  if (*(_BYTE *)(v0 + 64))
  {
    if (*(_BYTE *)(v0 + 64) != 1)
      return 0x6173726576696E75;
    v3 = 0;
    sub_210E933A0();
    OUTLINED_FUNCTION_5_32();
    OUTLINED_FUNCTION_11_26();
    goto LABEL_9;
  }
  v1 = *(_QWORD *)(v0 + 16);
  if ((~v1 & 0x7FF0000000000000) != 0 || (v1 & 0xFFFFFFFFFFFFFLL) == 0)
  {
    OUTLINED_FUNCTION_9_31();
    OUTLINED_FUNCTION_5_32();
    OUTLINED_FUNCTION_11_26();
LABEL_9:
    sub_210E92C38();
    OUTLINED_FUNCTION_17_26();
    goto LABEL_10;
  }
  OUTLINED_FUNCTION_9_31();
  sub_210E92C38();
  OUTLINED_FUNCTION_17_26();
LABEL_10:
  sub_210E92E54();
  sub_210E92C38();
  return v3;
}

uint64_t sub_210D33100()
{
  return sub_210D32F84();
}

uint64_t *sub_210D33120()
{
  if (qword_253D7C0A0 != -1)
    swift_once();
  return &qword_253D818B8;
}

uint64_t sub_210D33164()
{
  sub_210D33120();
  return swift_retain();
}

uint64_t sub_210D33180()
{
  return sub_210E93358();
}

uint64_t sub_210D33188(void *a1)
{
  void *v1;
  char v2;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  id v21;
  char v22;

  v4 = objc_msgSend(a1, sel_identityKind);
  OUTLINED_FUNCTION_16_2((uint64_t)v4, (unint64_t *)&unk_254A7DAF0);
  swift_getObjCClassFromMetadata();
  v5 = v4;
  v6 = OUTLINED_FUNCTION_1_43();
  OUTLINED_FUNCTION_16_2((uint64_t)v6, &qword_254A7FD70);
  sub_210E931FC();
  OUTLINED_FUNCTION_12_31();

  if ((v2 & 1) != 0)
  {

    return 0;
  }
  else
  {
    OUTLINED_FUNCTION_16_2(v7, &qword_254A7F1D0);
    swift_getObjCClassFromMetadata();
    OUTLINED_FUNCTION_13_25();
    v9 = OUTLINED_FUNCTION_1_43();
    OUTLINED_FUNCTION_6_36();
    OUTLINED_FUNCTION_12_31();

    OUTLINED_FUNCTION_16_2(v10, (unint64_t *)&unk_254A7F1C0);
    swift_getObjCClassFromMetadata();
    OUTLINED_FUNCTION_13_25();
    v11 = OUTLINED_FUNCTION_1_43();
    OUTLINED_FUNCTION_6_36();
    OUTLINED_FUNCTION_12_31();

    OUTLINED_FUNCTION_16_2(v12, &qword_254A7F1B8);
    swift_getObjCClassFromMetadata();
    OUTLINED_FUNCTION_13_25();
    v13 = OUTLINED_FUNCTION_1_43();
    OUTLINED_FUNCTION_6_36();
    OUTLINED_FUNCTION_12_31();

    OUTLINED_FUNCTION_16_2(v14, &qword_254A80E78);
    swift_getObjCClassFromMetadata();
    OUTLINED_FUNCTION_13_25();
    v15 = OUTLINED_FUNCTION_1_43();
    OUTLINED_FUNCTION_6_36();
    OUTLINED_FUNCTION_12_31();

    OUTLINED_FUNCTION_16_2(v16, &qword_254A80E80);
    swift_getObjCClassFromMetadata();
    OUTLINED_FUNCTION_13_25();
    v17 = OUTLINED_FUNCTION_1_43();
    OUTLINED_FUNCTION_6_36();
    OUTLINED_FUNCTION_12_31();

    OUTLINED_FUNCTION_16_2(v18, &qword_254A80E88);
    swift_getObjCClassFromMetadata();
    OUTLINED_FUNCTION_13_25();
    v19 = OUTLINED_FUNCTION_1_43();
    OUTLINED_FUNCTION_6_36();
    OUTLINED_FUNCTION_12_31();

    OUTLINED_FUNCTION_16_2(v20, &qword_254A80E90);
    v21 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_identityKind);
    v22 = OUTLINED_FUNCTION_6_36();

    if ((v22 & 1) != 0)
      return 4;
    else
      return 0;
  }
}

uint64_t sub_210D33414()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int *v5;
  uint64_t v6;
  int *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t, uint64_t);
  unsigned int v15;
  uint64_t v16;
  unsigned __int8 *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t, _QWORD, uint64_t);
  uint64_t v33;
  uint64_t v34;
  uint64_t v36;
  unsigned __int8 *v37;
  uint64_t v38;
  char *v39;
  int *v40;
  uint64_t v41;
  __int128 v42;
  unsigned int v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;

  v0 = sub_210E91E40();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0, v2, v3);
  v39 = (char *)&v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_210D33A30();
  sub_210D33A84();
  v6 = *((_QWORD *)v5 - 1);
  v7 = v5;
  v40 = v5;
  v44 = *(_QWORD *)(v6 + 72);
  v8 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v9 = swift_allocObject();
  v38 = v9;
  *(_OWORD *)(v9 + 16) = xmmword_210ED27D0;
  v10 = v9 + v8;
  v11 = v7[12];
  v12 = *MEMORY[0x24BE7BD08];
  v13 = sub_210E91E34();
  v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 104);
  v14(v10, v12, v13);
  v15 = *MEMORY[0x24BE7BD20];
  v41 = v1;
  OUTLINED_FUNCTION_15_32(v10);
  sub_210D33B00(0, &qword_253D7E8B0, (uint64_t (*)(_QWORD, _QWORD))MEMORY[0x24BEE3598]);
  v16 = OUTLINED_FUNCTION_24_11();
  v42 = xmmword_210ED3000;
  *(_OWORD *)(v16 + 16) = xmmword_210ED3000;
  v17 = v37;
  *(_QWORD *)(v16 + 32) = sub_210D3393C(*v37);
  *(_QWORD *)(v16 + 40) = v18;
  *(_QWORD *)(v10 + v11) = v16;
  v19 = v44;
  v20 = v10 + v44;
  v14(v10 + v44, *MEMORY[0x24BE7BCB8], v13);
  OUTLINED_FUNCTION_15_32(v10 + v19);
  v21 = OUTLINED_FUNCTION_24_11();
  *(_OWORD *)(v21 + 16) = v42;
  v22 = 0x6F65646956;
  if (v17[32])
    v22 = 0x6F69647541;
  v23 = v40;
  *(_QWORD *)(v20 + v40[12]) = v21;
  *(_QWORD *)(v21 + 32) = v22;
  *(_QWORD *)(v21 + 40) = 0xE500000000000000;
  v24 = v10 + 2 * v19;
  v25 = v23[12];
  v26 = *MEMORY[0x24BE7BCF8];
  v44 = v13;
  v40 = (int *)v14;
  v14(v24, v26, v13);
  v43 = v15;
  OUTLINED_FUNCTION_15_32(v24);
  v27 = OUTLINED_FUNCTION_24_11();
  *(_OWORD *)(v27 + 16) = v42;
  v28 = *((_QWORD *)v17 + 13);
  *(_QWORD *)(v27 + 32) = *((_QWORD *)v17 + 12);
  *(_QWORD *)(v27 + 40) = v28;
  *(_QWORD *)(v24 + v25) = v27;
  sub_210D33B00(0, (unint64_t *)&qword_253D7E5D0, (uint64_t (*)(_QWORD, _QWORD))MEMORY[0x24BEE1250]);
  sub_210D33B48();
  swift_bridgeObjectRetain();
  v29 = sub_210E92B30();
  v45 = *((_QWORD *)v17 + 1);
  v46 = v45;
  sub_210D33B88((uint64_t)&v46);
  OUTLINED_FUNCTION_33_1();
  sub_210D2F03C();
  if (*(_QWORD *)(v45 + 16))
  {
    v31 = (uint64_t)v39;
    v32 = (void (*)(uint64_t, _QWORD, uint64_t))v40;
    OUTLINED_FUNCTION_7_32(v30, *MEMORY[0x24BE7BD00]);
    OUTLINED_FUNCTION_10_34(v31, v43);
    OUTLINED_FUNCTION_8_30();
    OUTLINED_FUNCTION_0_41();
    OUTLINED_FUNCTION_3_38();
    v33 = v41;
    v34 = OUTLINED_FUNCTION_2_36();
  }
  else
  {
    v34 = swift_bridgeObjectRelease();
    v32 = (void (*)(uint64_t, _QWORD, uint64_t))v40;
    v33 = v41;
    v31 = (uint64_t)v39;
  }
  if (*(_QWORD *)(*((_QWORD *)v17 + 3) + 16))
  {
    OUTLINED_FUNCTION_7_32(v34, *MEMORY[0x24BE7BCC8]);
    OUTLINED_FUNCTION_5_33();
    OUTLINED_FUNCTION_33_1();
    OUTLINED_FUNCTION_8_30();
    OUTLINED_FUNCTION_0_41();
    OUTLINED_FUNCTION_3_38();
    v34 = OUTLINED_FUNCTION_2_36();
  }
  if (*(_QWORD *)(*((_QWORD *)v17 + 5) + 16))
  {
    OUTLINED_FUNCTION_7_32(v34, *MEMORY[0x24BE7BD10]);
    OUTLINED_FUNCTION_5_33();
    OUTLINED_FUNCTION_33_1();
    OUTLINED_FUNCTION_8_30();
    OUTLINED_FUNCTION_0_41();
    OUTLINED_FUNCTION_3_38();
    v34 = OUTLINED_FUNCTION_2_36();
  }
  if (*(_QWORD *)(*((_QWORD *)v17 + 6) + 16))
  {
    OUTLINED_FUNCTION_7_32(v34, *MEMORY[0x24BE7BCD8]);
    OUTLINED_FUNCTION_5_33();
    OUTLINED_FUNCTION_33_1();
    OUTLINED_FUNCTION_8_30();
    OUTLINED_FUNCTION_0_41();
    OUTLINED_FUNCTION_3_38();
    v34 = OUTLINED_FUNCTION_2_36();
  }
  if (*(_QWORD *)(*((_QWORD *)v17 + 7) + 16))
  {
    OUTLINED_FUNCTION_7_32(v34, *MEMORY[0x24BE7BCC0]);
    OUTLINED_FUNCTION_5_33();
    OUTLINED_FUNCTION_33_1();
    OUTLINED_FUNCTION_8_30();
    OUTLINED_FUNCTION_0_41();
    OUTLINED_FUNCTION_3_38();
    v34 = OUTLINED_FUNCTION_2_36();
  }
  if (*(_QWORD *)(*((_QWORD *)v17 + 8) + 16))
  {
    OUTLINED_FUNCTION_7_32(v34, *MEMORY[0x24BE7BCE0]);
    OUTLINED_FUNCTION_5_33();
    OUTLINED_FUNCTION_33_1();
    OUTLINED_FUNCTION_8_30();
    OUTLINED_FUNCTION_0_41();
    OUTLINED_FUNCTION_3_38();
    v34 = OUTLINED_FUNCTION_2_36();
  }
  if (*(_QWORD *)(*((_QWORD *)v17 + 9) + 16))
  {
    OUTLINED_FUNCTION_7_32(v34, *MEMORY[0x24BE7BCD0]);
    OUTLINED_FUNCTION_5_33();
    OUTLINED_FUNCTION_33_1();
    OUTLINED_FUNCTION_8_30();
    OUTLINED_FUNCTION_0_41();
    OUTLINED_FUNCTION_3_38();
    OUTLINED_FUNCTION_2_36();
  }
  if (*(_QWORD *)(*((_QWORD *)v17 + 10) + 16))
  {
    v32(v31, *MEMORY[0x24BE7BCE8], v44);
    OUTLINED_FUNCTION_10_34(v31, v43);
    OUTLINED_FUNCTION_33_1();
    OUTLINED_FUNCTION_8_30();
    OUTLINED_FUNCTION_0_41();
    OUTLINED_FUNCTION_3_38();
    OUTLINED_FUNCTION_4_32(*(uint64_t (**)(uint64_t, uint64_t))(v33 + 8));
  }
  if (*(_QWORD *)(*((_QWORD *)v17 + 11) + 16))
  {
    v32(v31, *MEMORY[0x24BE7BCF0], v44);
    OUTLINED_FUNCTION_10_34(v31, v43);
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_8_30();
    v45 = v29;
    sub_210C77C54();
    OUTLINED_FUNCTION_3_38();
    OUTLINED_FUNCTION_4_32(*(uint64_t (**)(uint64_t, uint64_t))(v33 + 8));
  }
  return v29;
}

uint64_t sub_210D338FC()
{
  unint64_t v0;

  sub_210E934E4();
  OUTLINED_FUNCTION_16_32();
  if (v0 >= 5)
    return 5;
  else
    return v0;
}

uint64_t sub_210D3393C(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_210D33968 + 4 * byte_210ED85F0[a1]))(1735290707, 0xE400000000000000);
}

uint64_t sub_210D33968()
{
  return 0x6D75626C41;
}

uint64_t sub_210D3397C()
{
  return 0x6E6F6974617453;
}

uint64_t sub_210D33994()
{
  return 0x7473696C79616C50;
}

uint64_t sub_210D339AC()
{
  return 0x6F65646956;
}

uint64_t sub_210D339C0()
{
  uint64_t v0;
  unsigned int v1;

  sub_210E934E4();
  OUTLINED_FUNCTION_16_32();
  if (v0 == 1)
    v1 = 1;
  else
    v1 = 2;
  if (v0)
    return v1;
  else
    return 0;
}

uint64_t sub_210D33A08(char a1)
{
  if ((a1 & 1) != 0)
    return 0x6F69647541;
  else
    return 0x6F65646956;
}

void sub_210D33A30()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_254A80E68)
  {
    sub_210D33A84();
    v0 = sub_210E93508();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_254A80E68);
  }
}

void sub_210D33A84()
{
  unint64_t TupleTypeMetadata2;
  uint64_t v1;

  if (!qword_254A80E70)
  {
    sub_210E91E40();
    sub_210D33B00(255, (unint64_t *)&qword_253D7E5D0, (uint64_t (*)(_QWORD, _QWORD))MEMORY[0x24BEE1250]);
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1)
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_254A80E70);
  }
}

void sub_210D33B00(uint64_t a1, unint64_t *a2, uint64_t (*a3)(_QWORD, _QWORD))
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    v4 = a3(0, MEMORY[0x24BEE0D00]);
    if (!v5)
      atomic_store(v4, a2);
  }
}

unint64_t sub_210D33B48()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254A7DFA0;
  if (!qword_254A7DFA0)
  {
    v1 = sub_210E91E40();
    result = MEMORY[0x212BD2E20](MEMORY[0x24BE7BD30], v1);
    atomic_store(result, (unint64_t *)&qword_254A7DFA0);
  }
  return result;
}

uint64_t sub_210D33B88(uint64_t a1)
{
  swift_bridgeObjectRetain();
  return a1;
}

void sub_210D33BB0(char *a1)
{
  sub_210C4F8C4(*a1);
}

void sub_210D33BBC()
{
  unsigned __int8 *v0;

  sub_210D328F8(*v0);
}

void sub_210D33BC4(uint64_t a1)
{
  char *v1;

  sub_210D32A14(a1, *v1);
}

void sub_210D33BCC(uint64_t a1)
{
  unsigned __int8 *v1;

  sub_210D32AB4(a1, *v1);
}

uint64_t sub_210D33BD4@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_210D338FC();
  *a1 = result;
  return result;
}

uint64_t sub_210D33C00@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_210D3393C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_210D33C28(char *a1, char *a2)
{
  return sub_210C4F850(*a1, *a2);
}

void sub_210D33C34()
{
  sub_210D3293C();
}

uint64_t sub_210D33C3C()
{
  return sub_210D329D8();
}

void sub_210D33C44()
{
  sub_210D32AC0();
}

uint64_t sub_210D33C4C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_210D339C0();
  *a1 = result;
  return result;
}

uint64_t sub_210D33C78@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;

  result = sub_210D33A08(*v1);
  *a1 = result;
  a1[1] = 0xE500000000000000;
  return result;
}

uint64_t sub_210D33CA4(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_210D33CF0 + 4 * byte_210ED85FA[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_210D33D24 + 4 * byte_210ED85F5[v4]))();
}

uint64_t sub_210D33D24(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_210D33D2C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x210D33D34);
  return result;
}

uint64_t sub_210D33D40(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x210D33D48);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_210D33D4C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_210D33D54(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void type metadata accessor for QOSMusicItems.QOSMediaType()
{
  OUTLINED_FUNCTION_17();
}

uint64_t sub_210D33D6C()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_210D33DDC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  v4 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v4;
  v5 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = v5;
  v6 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = v6;
  v7 = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = v7;
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_210D33EC4(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *__swift_memcpy112_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x70uLL);
}

uint64_t sub_210D34018(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_210D340DC(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 112))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_210D3411C(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 104) = 0;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 112) = 1;
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
    *(_BYTE *)(result + 112) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

void type metadata accessor for QOSMusicItems()
{
  OUTLINED_FUNCTION_17();
}

uint64_t sub_210D34184(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_210D341D0 + 4 * byte_210ED8604[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_210D34204 + 4 * byte_210ED85FF[v4]))();
}

uint64_t sub_210D34204(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_210D3420C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x210D34214);
  return result;
}

uint64_t sub_210D34220(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x210D34228);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_210D3422C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_210D34234(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void type metadata accessor for QOSMusicItems.QOSItemType()
{
  OUTLINED_FUNCTION_17();
}

unint64_t sub_210D34250()
{
  unint64_t result;

  result = qword_254A80E98;
  if (!qword_254A80E98)
  {
    result = MEMORY[0x212BD2E20](&unk_210ED86B4, &unk_24CAB07E8);
    atomic_store(result, (unint64_t *)&qword_254A80E98);
  }
  return result;
}

unint64_t sub_210D34290()
{
  unint64_t result;

  result = qword_254A80EA0;
  if (!qword_254A80EA0)
  {
    result = MEMORY[0x212BD2E20]("퀽; c", &unk_24CAB06A8);
    atomic_store(result, &qword_254A80EA0);
  }
  return result;
}

uint64_t sub_210D342CC(uint64_t a1, char a2)
{
  **(_BYTE **)(*(_QWORD *)(a1 + 64) + 40) = a2;
  return swift_continuation_resume();
}

BOOL sub_210D342E0(id a1)
{
  void *v1;
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v14;
  id v16;
  uint64_t v17;

  sub_210C34D54(0, (unint64_t *)&qword_253D7E7C0);
  sub_210D367E0();
  v3 = v1;
  v4 = sub_210E93520();
  if (v4)
  {
    v5 = (void *)v4;

  }
  else
  {
    v5 = (void *)swift_allocError();
    *v6 = v17;
  }
  v7 = (void *)sub_210E91B64();

  v8 = objc_msgSend(v7, sel_domain);
  v9 = sub_210E92BA8();
  v11 = v10;

  if (v9 == sub_210E92BA8() && v11 == v12)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    v14 = sub_210E93544();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v14 & 1) == 0)
    {

      return 0;
    }
  }
  v16 = objc_msgSend(v7, sel_code);

  return v16 == a1;
}

uint64_t sub_210D3444C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  id v8;
  uint64_t result;

  v3 = *(void **)(v1 + 112);
  if (v3)
  {
    v5 = *(_QWORD *)(v1 + 16);
    v4 = *(_QWORD *)(v1 + 24);
    v6 = *(_QWORD *)(v1 + 32);
    if (v3 == (void *)1)
    {
      v3 = 0;
      v7 = 2;
    }
    else
    {
      v7 = *(_BYTE *)(v1 + 120) & 1;
      v8 = v3;
    }
    swift_unknownObjectRetain();
    result = swift_bridgeObjectRetain();
  }
  else
  {
    v5 = 0;
    v4 = 0;
    v6 = 0;
    v7 = 0;
  }
  *(_QWORD *)a1 = v5;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v6;
  *(_QWORD *)(a1 + 24) = v3;
  *(_BYTE *)(a1 + 32) = v7;
  return result;
}

uint64_t sub_210D344DC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;

  v1 = *(_QWORD *)(v0 + 112);
  if (!v1)
    return 1;
  if (v1 != 1)
    return 0;
  result = *(_QWORD *)(v0 + 32);
  if (result)
  {
    result = (uint64_t)objc_msgSend((id)result, sel_avPlayerItem);
    if (result)
    {

      return 1;
    }
  }
  return result;
}

void sub_210D34560()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 128))
  {
    swift_retain();
    swift_task_isCancelled();
    swift_release();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_210D345A0()
{
  uint64_t v0;
  _QWORD *v1;

  if (qword_253D7C0A0 != -1)
    swift_once();
  *(_QWORD *)(v0 + 16) = qword_253D818B8;
  swift_retain();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 24) = v1;
  *v1 = v0;
  v1[1] = sub_210D34628;
  return sub_210C39258();
}

uint64_t sub_210D34628()
{
  OUTLINED_FUNCTION_60_15();
  OUTLINED_FUNCTION_32_3();
  return OUTLINED_FUNCTION_0_4();
}

uint64_t sub_210D34654()
{
  uint64_t v0;
  _QWORD *v1;

  if (qword_253D7C0A0 != -1)
    swift_once();
  *(_QWORD *)(v0 + 16) = qword_253D818B8;
  swift_retain();
  v1 = (_QWORD *)OUTLINED_FUNCTION_99_4();
  *(_QWORD *)(v0 + 24) = v1;
  OUTLINED_FUNCTION_98_8(v1, (uint64_t)sub_210D346DC);
  return sub_210C39258();
}

uint64_t sub_210D346DC()
{
  OUTLINED_FUNCTION_60_15();
  OUTLINED_FUNCTION_32_3();
  return OUTLINED_FUNCTION_0_4();
}

uint64_t sub_210D34708()
{
  uint64_t (*v0)(void);

  swift_release();
  v0 = (uint64_t (*)(void))OUTLINED_FUNCTION_38_1();
  return OUTLINED_FUNCTION_8(v0);
}

uint64_t sub_210D34730()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  OUTLINED_FUNCTION_27_0();
  OUTLINED_FUNCTION_58_0(v2);
  *(_QWORD *)(v0 + 56) = v1;
  swift_task_dealloc();
  return OUTLINED_FUNCTION_24_1();
}

uint64_t sub_210D34780()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(_QWORD, _QWORD))(v0 + 8))(*(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40));
}

uint64_t sub_210D347B8()
{
  uint64_t v0;

  swift_release();
  OUTLINED_FUNCTION_9();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_210D347F0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_27_0();
  OUTLINED_FUNCTION_67_1();
  *(_QWORD *)(v0 + 416) = v2;
  *(_QWORD *)(v0 + 424) = v1;
  OUTLINED_FUNCTION_36_1();
  return OUTLINED_FUNCTION_24_1();
}

uint64_t sub_210D34840()
{
  _QWORD *v0;
  uint64_t v1;

  v1 = v0[48];
  v0[54] = *(_QWORD *)(v1 + 16);
  v0[55] = *(_QWORD *)(v1 + 24);
  sub_210E92D7C();
  v0[56] = sub_210E92D70();
  sub_210E92D28();
  return OUTLINED_FUNCTION_24_1();
}

uint64_t sub_210D348B4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;

  v1 = *(_QWORD *)(v0 + 440);
  v3 = *(_QWORD *)(v0 + 424);
  v2 = *(_QWORD *)(v0 + 432);
  v4 = *(_BYTE *)(v0 + 576);
  swift_release();
  *(_QWORD *)(v0 + 456) = sub_210CEF9E0(v2, v1, v4);
  *(_QWORD *)(v0 + 464) = v3;
  if (!v3)
    swift_unknownObjectRelease();
  return swift_task_switch();
}

uint64_t sub_210D34940()
{
  uint64_t v0;

  OUTLINED_FUNCTION_51_17();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_42_20();
  return OUTLINED_FUNCTION_8(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_210D34974()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t result;
  _QWORD *v4;
  char v5;
  unint64_t v6;
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
  uint64_t (*v17)(void);

  result = OUTLINED_FUNCTION_61_12(*(_QWORD *)(v1 + 456));
  if (*(_QWORD *)(v0 + 32))
  {
    if (objc_msgSend((id)OUTLINED_FUNCTION_86_9(), sel_hasLoadableAsset))
    {
      v4 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v1 + 480) = v4;
      v5 = OUTLINED_FUNCTION_97_8(v4, (uint64_t)sub_210D34A48);
      return OUTLINED_FUNCTION_52_14(v5);
    }
    else
    {
      OUTLINED_FUNCTION_75_10();
      __swift_project_boxed_opaque_existential_0Tm((_QWORD *)(v2 + 56), *(_QWORD *)(v2 + 80));
      OUTLINED_FUNCTION_64_11();
      v6 = OUTLINED_FUNCTION_22_27();
      v8 = v7;
      OUTLINED_FUNCTION_14();
      v9 = OUTLINED_FUNCTION_40();
      OUTLINED_FUNCTION_59_16(v9, v10, v11, v12, v13, v14, v15, v16, v6, v8);
      OUTLINED_FUNCTION_74_11();
      OUTLINED_FUNCTION_12_0();
      OUTLINED_FUNCTION_33();
      OUTLINED_FUNCTION_42_20();
      v17 = (uint64_t (*)(void))OUTLINED_FUNCTION_38_1();
      return OUTLINED_FUNCTION_53_16(v17);
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_210D34A48(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  _QWORD *v5;
  uint64_t v7;
  _QWORD *v8;

  OUTLINED_FUNCTION_26_10();
  OUTLINED_FUNCTION_58_0(v5);
  v2[61] = a1;
  v2[62] = v1;
  swift_task_dealloc();
  if (v1)
    return OUTLINED_FUNCTION_48_0();
  v7 = v2[59];
  v8 = (_QWORD *)swift_task_alloc();
  v2[63] = (uint64_t)v8;
  *v8 = v3;
  v8[1] = sub_210D34AD8;
  return sub_210CF10B0(v7, v2[48]);
}

uint64_t sub_210D34AD8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_27_0();
  OUTLINED_FUNCTION_67_1();
  *(_QWORD *)(v0 + 512) = v2;
  *(_QWORD *)(v0 + 520) = v1;
  OUTLINED_FUNCTION_36_1();
  if (!v1)
    swift_unknownObjectRelease();
  return OUTLINED_FUNCTION_24_1();
}

uint64_t sub_210D34B3C()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t ObjectType;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t (*v19)(void);
  _QWORD *v21;
  void *v22;

  v3 = *(_QWORD *)(v0 + 520);
  sub_210E92E3C();
  if (v3)
  {
    OUTLINED_FUNCTION_51_17();
LABEL_8:
    OUTLINED_FUNCTION_9();
    OUTLINED_FUNCTION_12_0();
    OUTLINED_FUNCTION_42_20();
    v19 = *(uint64_t (**)(void))(v0 + 8);
    return OUTLINED_FUNCTION_17_1(v19);
  }
  ObjectType = swift_getObjectType();
  *(_QWORD *)(v0 + 528) = ObjectType;
  v5 = (uint64_t)OUTLINED_FUNCTION_119(ObjectType, sel_isAssetLoaded);
  v6 = *(_QWORD *)(v0 + 512);
  if ((v5 & 1) == 0)
  {
    v15 = *(_QWORD *)(v0 + 392);
    swift_release();
    v16 = sub_210E92D94();
    __swift_storeEnumTagSinglePayload(v15, 1, 1, v16);
    v17 = swift_allocObject();
    *(_QWORD *)(v17 + 16) = 0;
    *(_QWORD *)(v17 + 24) = 0;
    sub_210C63D64(v15, (uint64_t)&unk_254A80EC8, v17);
    swift_release();
    sub_210C36644(v15);
    OUTLINED_FUNCTION_60_12();
    sub_210D368B8();
    v18 = (void *)OUTLINED_FUNCTION_16_4();
    sub_210E92AF4();
    sub_210D02780((void *)v6);

    swift_willThrow();
    goto LABEL_8;
  }
  if ((OUTLINED_FUNCTION_119(v5, sel_isStartItem) & 1) != 0)
  {
    OUTLINED_FUNCTION_51_17();
    v7 = objc_msgSend(*(id *)(v0 + 512), sel_avPlayerItem);
    if (v7)
    {
      OUTLINED_FUNCTION_77_12(v7);
      OUTLINED_FUNCTION_87_10();
      sub_210E92B84();
      v8 = OUTLINED_FUNCTION_85_8();
      OUTLINED_FUNCTION_89_6(v8, sel_setContentItemID_);

      v9 = v1;
      v10 = OUTLINED_FUNCTION_119((uint64_t)v9, sel_title);
      OUTLINED_FUNCTION_88_8((uint64_t)v10, sel_setTitle_);

      v11 = v9;
      v12 = OUTLINED_FUNCTION_119((uint64_t)v11, sel_isVideoContent);
      OUTLINED_FUNCTION_53((uint64_t)v12, sel_setIsVideoContent_);

      v13 = v11;
      v14 = OUTLINED_FUNCTION_119((uint64_t)v13, sel_prefersSeekOverSkip);
      OUTLINED_FUNCTION_53((uint64_t)v14, sel_setPrefersSeekOverSkip_);

    }
    OUTLINED_FUNCTION_12_0();
    OUTLINED_FUNCTION_61_12(*(_QWORD *)(v0 + 512));
    v22 = *(void **)(v6 + 112);
    *(_QWORD *)(v6 + 112) = 1;
    *(_BYTE *)(v6 + 120) = 0;
    sub_210C38FDC(v22);
    OUTLINED_FUNCTION_42_20();
    v19 = (uint64_t (*)(void))OUTLINED_FUNCTION_38_1();
    return OUTLINED_FUNCTION_17_1(v19);
  }
  v21 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 536) = v21;
  *v21 = v0;
  v21[1] = sub_210D34DEC;
  return sub_210C393E0(2);
}

uint64_t sub_210D34DB0()
{
  uint64_t v0;

  OUTLINED_FUNCTION_51_17();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_42_20();
  return OUTLINED_FUNCTION_13_4(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_210D34DEC(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  _QWORD *v5;
  _QWORD *v7;

  OUTLINED_FUNCTION_26_10();
  OUTLINED_FUNCTION_58_0(v5);
  v2[68] = a1;
  v2[69] = v1;
  swift_task_dealloc();
  if (v1)
    return OUTLINED_FUNCTION_48_0();
  v7 = (_QWORD *)swift_task_alloc();
  v2[70] = (uint64_t)v7;
  *v7 = v3;
  v7[1] = sub_210D34E7C;
  return sub_210CF1270(v2[64]);
}

uint64_t sub_210D34E7C()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  OUTLINED_FUNCTION_27_0();
  OUTLINED_FUNCTION_58_0(v2);
  *(_QWORD *)(v0 + 568) = v1;
  swift_task_dealloc();
  return OUTLINED_FUNCTION_24_1();
}

uint64_t sub_210D34ECC()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t (*v15)(void);

  v3 = *(_QWORD *)(v0 + 568);
  v4 = *(_QWORD *)(v0 + 544);
  OUTLINED_FUNCTION_51_17();
  OUTLINED_FUNCTION_9();
  sub_210E92E3C();
  if (v3)
  {
    swift_unknownObjectRelease();
    OUTLINED_FUNCTION_9();
    OUTLINED_FUNCTION_42_20();
    return OUTLINED_FUNCTION_17_1(*(uint64_t (**)(void))(v0 + 8));
  }
  else
  {
    v6 = objc_msgSend(*(id *)(v0 + 512), sel_avPlayerItem);
    if (v6)
    {
      OUTLINED_FUNCTION_77_12(v6);
      OUTLINED_FUNCTION_87_10();
      sub_210E92B84();
      v7 = OUTLINED_FUNCTION_85_8();
      OUTLINED_FUNCTION_89_6(v7, sel_setContentItemID_);

      v8 = v1;
      v9 = OUTLINED_FUNCTION_119((uint64_t)v8, sel_title);
      OUTLINED_FUNCTION_88_8((uint64_t)v9, sel_setTitle_);

      v10 = v8;
      v11 = OUTLINED_FUNCTION_119((uint64_t)v10, sel_isVideoContent);
      OUTLINED_FUNCTION_53((uint64_t)v11, sel_setIsVideoContent_);

      v12 = v10;
      v13 = OUTLINED_FUNCTION_119((uint64_t)v12, sel_prefersSeekOverSkip);
      OUTLINED_FUNCTION_53((uint64_t)v13, sel_setPrefersSeekOverSkip_);

    }
    OUTLINED_FUNCTION_12_0();
    OUTLINED_FUNCTION_61_12(*(_QWORD *)(v0 + 512));
    v14 = *(void **)(v4 + 112);
    *(_QWORD *)(v4 + 112) = 1;
    *(_BYTE *)(v4 + 120) = 0;
    sub_210C38FDC(v14);
    OUTLINED_FUNCTION_42_20();
    v15 = (uint64_t (*)(void))OUTLINED_FUNCTION_38_1();
    return OUTLINED_FUNCTION_17_1(v15);
  }
}

uint64_t sub_210D35024()
{
  uint64_t v0;

  OUTLINED_FUNCTION_51_17();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_12_0();
  swift_unknownObjectRelease();
  OUTLINED_FUNCTION_42_20();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_210D3507C()
{
  uint64_t v0;

  OUTLINED_FUNCTION_51_17();
  OUTLINED_FUNCTION_42_20();
  return OUTLINED_FUNCTION_8(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_210D350A8()
{
  uint64_t v0;

  OUTLINED_FUNCTION_51_17();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_42_20();
  return OUTLINED_FUNCTION_8(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_210D350DC()
{
  uint64_t v0;

  OUTLINED_FUNCTION_51_17();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_42_20();
  return OUTLINED_FUNCTION_13_4(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_210D35118()
{
  return swift_task_switch();
}

uint64_t sub_210D3512C()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v1 = (void *)objc_opt_self();
  v2 = *MEMORY[0x24BE65AB0];
  v3 = sub_210E92B84();
  v0[15] = v3;
  v4 = sub_210E92B84();
  v0[16] = v4;
  v5 = sub_210E92B84();
  v0[17] = v5;
  v0[2] = v0;
  v0[3] = sub_210D35260;
  v6 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v7 = v0 + 10;
  v7[1] = 0x40000000;
  v7[2] = sub_210D352D8;
  v7[3] = &block_descriptor_27;
  v7[4] = v6;
  objc_msgSend(v1, sel_snapshotWithDomain_type_subType_context_triggerThresholdValues_events_completion_, v2, v3, v4, v5, 0, 0, v7);
  return swift_continuation_await();
}

uint64_t sub_210D35260()
{
  OUTLINED_FUNCTION_58_1();
  return OUTLINED_FUNCTION_0_4();
}

uint64_t sub_210D3529C()
{
  uint64_t v0;
  void *v1;
  void *v2;

  v1 = *(void **)(v0 + 128);
  v2 = *(void **)(v0 + 120);

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_210D352D8(uint64_t a1)
{
  return j__swift_continuation_resume(*(_QWORD *)(a1 + 32));
}

#error "210D355E8: call analysis failed (funcsize=256)"

uint64_t sub_210D35700()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_27_0();
  OUTLINED_FUNCTION_67_1();
  *(_QWORD *)(v0 + 2048) = v2;
  *(_QWORD *)(v0 + 2056) = v1;
  OUTLINED_FUNCTION_36_1();
  return OUTLINED_FUNCTION_24_1();
}

uint64_t sub_210D35754()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  id v3;
  _QWORD *v4;

  v1 = (void *)v0[254];
  v2 = *(_QWORD *)(v0[246] + 32);
  v0[258] = v2;
  v3 = v1;
  swift_unknownObjectRetain();
  v4 = (_QWORD *)swift_task_alloc();
  v0[259] = v4;
  *v4 = v0;
  v4[1] = sub_210D357D0;
  return sub_210CF1CB0(v0[254], v2);
}

uint64_t sub_210D357D0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;

  OUTLINED_FUNCTION_26_10();
  OUTLINED_FUNCTION_67_1();
  *(_QWORD *)(v1 + 2080) = v2;
  *(_QWORD *)(v1 + 2088) = v0;
  OUTLINED_FUNCTION_36_1();
  if (v0)
  {

    OUTLINED_FUNCTION_12_0();
    OUTLINED_FUNCTION_9();
  }
  else
  {
    v3 = *(void **)(v1 + 2032);
    swift_unknownObjectRelease();
    OUTLINED_FUNCTION_9();

  }
  return swift_task_switch();
}

#error "210D35C10: call analysis failed (funcsize=254)"

#error "210D35DAC: call analysis failed (funcsize=128)"

uint64_t sub_210D35EC4()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  OUTLINED_FUNCTION_27_0();
  OUTLINED_FUNCTION_58_0(v2);
  *(_QWORD *)(v0 + 2104) = v1;
  swift_task_dealloc();
  return OUTLINED_FUNCTION_24_1();
}

#error "210D36028: call analysis failed (funcsize=133)"

#error "210D36240: call analysis failed (funcsize=128)"

#error "210D36458: call analysis failed (funcsize=128)"

uint64_t sub_210D36574(uint64_t a1, uint64_t a2)
{
  void *v4;
  id v5;

  v4 = *(void **)a2;
  if (*(_QWORD *)a2 < 0xFFFFFFFFuLL)
  {
    *(_QWORD *)a1 = *(_QWORD *)a2;
  }
  else
  {
    v5 = v4;
    *(_QWORD *)a1 = v4;
  }
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  return a1;
}

uint64_t sub_210D365D0(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;

  v4 = *(void **)a1;
  v5 = *(void **)a2;
  if ((unint64_t)v4 < 0xFFFFFFFF)
  {
    if ((unint64_t)v5 >= 0xFFFFFFFF)
    {
      v8 = v5;
      *(_QWORD *)a1 = v5;
      goto LABEL_6;
    }
LABEL_8:
    v9 = *(void **)a2;
    *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
    *(_QWORD *)a1 = v9;
    return a1;
  }
  if ((unint64_t)v5 < 0xFFFFFFFF)
  {

    goto LABEL_8;
  }
  v6 = v5;
  v7 = *(void **)a1;
  *(_QWORD *)a1 = v5;

LABEL_6:
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  return a1;
}

uint64_t sub_210D3666C(uint64_t a1, uint64_t a2)
{
  void *v4;

  v4 = *(void **)a1;
  if ((unint64_t)v4 < 0xFFFFFFFF)
    goto LABEL_5;
  if (*(_QWORD *)a2 < 0xFFFFFFFFuLL)
  {

LABEL_5:
    *(_QWORD *)a1 = *(_QWORD *)a2;
    goto LABEL_6;
  }
  *(_QWORD *)a1 = *(_QWORD *)a2;

LABEL_6:
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  return a1;
}

uint64_t sub_210D366D0(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;
  unsigned int v4;
  unsigned int v5;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFE && *((_BYTE *)a1 + 9))
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

uint64_t sub_210D36724(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFD)
  {
    *(_QWORD *)result = 0;
    *(_BYTE *)(result + 8) = 0;
    *(_DWORD *)result = a2 - 2147483646;
    if (a3 >= 0x7FFFFFFE)
      *(_BYTE *)(result + 9) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFE)
      *(_BYTE *)(result + 9) = 0;
    if (a2)
      *(_QWORD *)result = a2 + 1;
  }
  return result;
}

uint64_t sub_210D36784(uint64_t result, int a2)
{
  uint64_t v2;

  if (a2 < 0)
  {
    v2 = a2 ^ 0x80000000;
    *(_BYTE *)(result + 8) = 0;
  }
  else
  {
    if (!a2)
      return result;
    v2 = (a2 - 1);
  }
  *(_QWORD *)result = v2;
  return result;
}

void type metadata accessor for AssetTask.State()
{
  OUTLINED_FUNCTION_17();
}

unint64_t sub_210D367B0()
{
  return sub_210C3944C();
}

id sub_210D367D0(id result)
{
  if ((unint64_t)result >= 2)
    return result;
  return result;
}

unint64_t sub_210D367E0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_253D7B4D8;
  if (!qword_253D7B4D8)
  {
    v1 = sub_210C34D54(255, (unint64_t *)&qword_253D7E7C0);
    result = MEMORY[0x212BD2E20](MEMORY[0x24BDD01A8], v1);
    atomic_store(result, (unint64_t *)&qword_253D7B4D8);
  }
  return result;
}

uint64_t sub_210D36830()
{
  swift_unknownObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_210D36854()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_210CBD5D0;
  return sub_210D35118();
}

unint64_t sub_210D368B8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_253D7E5B8;
  if (!qword_253D7E5B8)
  {
    v1 = sub_210E92D58();
    result = MEMORY[0x212BD2E20](MEMORY[0x24BEE6848], v1);
    atomic_store(result, (unint64_t *)&qword_253D7E5B8);
  }
  return result;
}

void sub_210D368F8(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();

}

uint64_t sub_210D36928(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  id v6;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  v5 = *(void **)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain();
  v6 = v5;
  *(_QWORD *)(a1 + 24) = v5;
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  return a1;
}

uint64_t sub_210D36984(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  v4 = *(void **)(a1 + 24);
  v5 = *(void **)(a2 + 24);
  v6 = v5;
  *(_QWORD *)(a1 + 24) = v5;

  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  return a1;
}

__n128 __swift_memcpy33_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t sub_210D36A20(uint64_t a1, uint64_t a2)
{
  void *v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_unknownObjectRelease();
  v4 = *(void **)(a1 + 24);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);

  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  return a1;
}

uint64_t sub_210D36A7C(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 33))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_210D36ABC(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_BYTE *)(result + 32) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 33) = 1;
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
    *(_BYTE *)(result + 33) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

void type metadata accessor for AssetTask.Result()
{
  OUTLINED_FUNCTION_17();
}

uint64_t sub_210D36B0C(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_210D36B58 + 4 * byte_210ED8785[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_210D36B8C + 4 * byte_210ED8780[v4]))();
}

uint64_t sub_210D36B8C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_210D36B94(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x210D36B9CLL);
  return result;
}

uint64_t sub_210D36BA8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x210D36BB0);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_210D36BB4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_210D36BBC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void type metadata accessor for AssetTask.Step()
{
  OUTLINED_FUNCTION_17();
}

unint64_t sub_210D36BD8()
{
  unint64_t result;

  result = qword_254A80EE0;
  if (!qword_254A80EE0)
  {
    result = MEMORY[0x212BD2E20](&unk_210ED8864, &unk_24CAB0A28);
    atomic_store(result, (unint64_t *)&qword_254A80EE0);
  }
  return result;
}

void OUTLINED_FUNCTION_39_23()
{
  void *v0;

  sub_210BDAD90(v0);
}

unint64_t OUTLINED_FUNCTION_47_20()
{
  return 0xD000000000000034;
}

void *OUTLINED_FUNCTION_59_16(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  void *v10;
  _QWORD *v11;

  v11[25] = 0;
  v11[26] = 0;
  v11[27] = a9;
  v11[28] = a10;
  sub_210C94AE4((uint64_t)(v11 + 25));
  return sub_210BDB064(v11 + 25, v10);
}

void OUTLINED_FUNCTION_70_15()
{
  uint64_t v0;

}

void OUTLINED_FUNCTION_72_13()
{
  uint64_t v0;

}

void OUTLINED_FUNCTION_74_11()
{
  void *v0;

  sub_210BDAD90(v0);
}

uint64_t OUTLINED_FUNCTION_75_10()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_86_9()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 472) = v0;
  return swift_unknownObjectRetain();
}

id OUTLINED_FUNCTION_89_6(uint64_t a1, const char *a2)
{
  void *v2;
  uint64_t v3;

  return objc_msgSend(v2, a2, v3);
}

unint64_t OUTLINED_FUNCTION_95_8()
{
  return sub_210C3944C();
}

_QWORD *OUTLINED_FUNCTION_96_7()
{
  uint64_t v0;

  return __swift_project_boxed_opaque_existential_0Tm((_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 80));
}

uint64_t OUTLINED_FUNCTION_97_8@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  *a1 = v2;
  a1[1] = a2;
  return 1;
}

uint64_t OUTLINED_FUNCTION_98_8@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  char v2;
  uint64_t v3;

  *a1 = v3;
  a1[1] = a2;
  return v2 & 1;
}

uint64_t sub_210D36D00(uint64_t a1)
{
  _BYTE v2[50];
  unsigned __int8 v3;

  sub_210C7A594(a1, (uint64_t)v2);
  return ((unsigned __int16)(v3 >> 4) < 0xDu) & (0x1A81u >> (v3 >> 4));
}

uint64_t sub_210D36D3C(uint64_t a1)
{
  int v1;
  uint64_t v2;
  float v3;
  uint64_t v4;
  char v5;
  uint64_t v7;
  float v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned __int16 v13;
  unsigned __int8 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  sub_210C7A594(a1, (uint64_t)&v7);
  v1 = v13 | (v14 << 16);
  if (v14 >> 4 == 1)
  {
    v14 = BYTE2(v1) & 0xF;
    v4 = v7;
    v5 = LOBYTE(v8);
    v15 = v9;
    v16 = v10;
    v17 = v11;
    v18 = v12;
    OUTLINED_FUNCTION_5_35();
    type metadata accessor for InitialLoadingState();
    OUTLINED_FUNCTION_16_0();
    sub_210C798A4(v4, v5, 0, (uint64_t)&v15);
    swift_unknownObjectRetain();
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_35_19();
    swift_unknownObjectRetain();
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_35_19();
    OUTLINED_FUNCTION_27();
  }
  if (!(v14 >> 4))
  {
    v14 = BYTE2(v1) & 0xF;
    v2 = v7;
    v3 = v8;
    v15 = v9;
    v16 = v10;
    v17 = v11;
    v18 = v12;
    OUTLINED_FUNCTION_5_35();
    type metadata accessor for InitialPreLoadingState();
    OUTLINED_FUNCTION_16_0();
    sub_210C79FE8(v2, (uint64_t)&v15, v3);
    swift_unknownObjectRetain();
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_8_22();
    swift_unknownObjectRetain();
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_8_22();
    OUTLINED_FUNCTION_27();
  }
  return 0;
}

uint64_t sub_210D36F2C(const void *a1)
{
  uint64_t result;
  unsigned int v2;
  _BYTE v3[64];
  unint64_t v4;

  sub_210C6FC64(a1, v3);
  result = 0;
  v2 = (v4 >> 59) & 0x1E | (v4 >> 2) & 1;
  if (v2 <= 0x1E)
  {
    if (((1 << v2) & 0x7EE00707) != 0)
      goto LABEL_3;
    if (v2 == 7)
    {
      v4 &= 0xFFFFFFFFFFFFFFBuLL;
      sub_210CB99D0(0, 1);
      goto LABEL_4;
    }
    if (v2 == 13)
    {
LABEL_3:
      v4 &= 0xFFFFFFFFFFFFFFBuLL;
LABEL_4:
      sub_210CB8714();
      return 1;
    }
  }
  return result;
}

void sub_210D36FD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __asm { BR              X10 }
}

uint64_t sub_210D37028()
{
  OUTLINED_FUNCTION_3_40();
  sub_210CB8758();
  return 1;
}

uint64_t sub_210D3716C()
{
  uint64_t v0;
  uint64_t result;
  __int128 v2;
  void (*v3)(uint64_t, uint64_t, _QWORD);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;

  result = (*(uint64_t (**)(void))(*(_QWORD *)v0 + 80))();
  if ((result & 1) != 0)
  {
    sub_210CC262C();
    v7 = v2;
    result = sub_210C57290((uint64_t)&v7);
    if (v3)
    {
      sub_210CC262C();
      sub_210C4ED40(v6);
      v3(v4, v5, 0);
      sub_210C4ED40((uint64_t)v3);
      return swift_bridgeObjectRelease();
    }
  }
  return result;
}

void sub_210D3720C(uint64_t a1)
{
  sub_210C394E8(a1, (void (*)(_QWORD *))sub_210CB8108);
}

uint64_t sub_210D37218(uint64_t a1, uint64_t a2, char a3)
{
  if (a3)
  {
    if (a3 == 2)
    {
      type metadata accessor for EndOfQueueState();
      swift_bridgeObjectRetain();
      sub_210CC188C(a1, a2);
      OUTLINED_FUNCTION_27();
    }
    return 0;
  }
  else
  {
    sub_210CB9B54();
    return 1;
  }
}

uint64_t sub_210D372AC()
{
  return 0x6574617453;
}

uint64_t type metadata accessor for State()
{
  return objc_opt_self();
}

uint64_t sub_210D372E0()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(**(_QWORD **)v0 + 144))();
}

uint64_t sub_210D37308@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_210D37370(a1, (uint64_t (*)(_QWORD))MEMORY[0x24BDCF678], a2);
}

uint64_t sub_210D37314@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *(_QWORD *)(a1 + 16);
  v5 = OUTLINED_FUNCTION_38_22();
  if (v4)
  {
    OUTLINED_FUNCTION_54_14();
    sub_210CCC3C8(a1 + v6, a2);
    v7 = 0;
  }
  else
  {
    v7 = 1;
  }
  return OUTLINED_FUNCTION_19_25(a2, v7, 1, v5);
}

uint64_t sub_210D37370@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(_QWORD)@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5 = *(_QWORD *)(a1 + 16);
  v6 = a2(0);
  v7 = v6;
  if (v5)
  {
    (*(void (**)(uint64_t, unint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a3, a1+ ((*(unsigned __int8 *)(*(_QWORD *)(v6 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v6 - 8) + 80)), v6);
    v8 = 0;
  }
  else
  {
    v8 = 1;
  }
  return OUTLINED_FUNCTION_19_25(a3, v8, 1, v7);
}

BOOL sub_210D373E0(uint64_t (*a1)(char *), uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t (*v11)(uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(char *, uint64_t, uint64_t);
  int EnumTagSinglePayload;
  BOOL v21;
  char v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(char *, uint64_t, uint64_t);
  uint64_t v30;
  uint64_t (*v31)(char *);

  v4 = v3;
  v30 = a2;
  v31 = a1;
  v6 = sub_210E91D68();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6, v8, MEMORY[0x24BDCEEA8]);
  v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_210C33834(0, &qword_254A810F8, v11, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  MEMORY[0x24BDAC7A8](v12, v13, v14);
  v16 = (char *)&v27 - v15;
  v17 = *(_QWORD *)(a3 + 16);
  v27 = a3;
  if (v17)
  {
    v18 = a3 + ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
    v19 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
    v28 = *(_QWORD *)(v7 + 72);
    v29 = v19;
    swift_bridgeObjectRetain();
    while (1)
    {
      v29(v16, v18, v6);
      __swift_storeEnumTagSinglePayload((uint64_t)v16, 0, 1, v6);
      EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v16, 1, v6);
      v21 = EnumTagSinglePayload != 1;
      if (EnumTagSinglePayload == 1)
        break;
      (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v10, v16, v6);
      v22 = v31(v10);
      v23 = v7;
      if (v4)
      {
        (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
        swift_bridgeObjectRelease();
        return v21;
      }
      v24 = v22;
      v25 = v23;
      (*(void (**)(char *, uint64_t))(v23 + 8))(v10, v6);
      if ((v24 & 1) != 0)
        break;
      v18 += v28;
      --v17;
      v7 = v25;
      v4 = 0;
      if (!v17)
        goto LABEL_9;
    }
  }
  else
  {
    swift_bridgeObjectRetain();
LABEL_9:
    __swift_storeEnumTagSinglePayload((uint64_t)v16, 1, 1, v6);
    v21 = 0;
  }
  swift_bridgeObjectRelease();
  return v21;
}

uint64_t sub_210D375F0()
{
  return sub_210E9361C();
}

uint64_t sub_210D37614()
{
  sub_210E93610();
  sub_210E9361C();
  return sub_210E93634();
}

uint64_t sub_210D3765C()
{
  sub_210E93610();
  sub_210E9361C();
  return sub_210E93634();
}

_QWORD *sub_210D37698(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;

  v2 = MEMORY[0x24BEE4AF8];
  v1[4] = 0x3FA999999999999ALL;
  v1[5] = v2;
  v1[2] = a1;
  v1[3] = &unk_24CAA4AD8;
  return v1;
}

uint64_t sub_210D376C4()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
  return OUTLINED_FUNCTION_91();
}

uint64_t sub_210D376D4()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v3;

  if ((sub_210E92E30() & 1) != 0)
  {
    v1 = MEMORY[0x24BEE4AF8];
    return (*(uint64_t (**)(uint64_t))(v0 + 8))(v1);
  }
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v0 + 16) + 40) + 16))
  {
    v1 = swift_bridgeObjectRetain();
    return (*(uint64_t (**)(uint64_t))(v0 + 8))(v1);
  }
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 24) = v3;
  *v3 = v0;
  v3[1] = sub_210D3775C;
  return sub_210D377B0();
}

uint64_t sub_210D3775C(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;

  v4 = *v2;
  v5 = swift_task_dealloc();
  if (!v1)
    v5 = a1;
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(v5);
}

uint64_t sub_210D377B0()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1[15] = v0;
  v2 = sub_210E91D20();
  v1[16] = v2;
  v1[17] = *(_QWORD *)(v2 - 8);
  v1[18] = OUTLINED_FUNCTION_103();
  v3 = OUTLINED_FUNCTION_38_22();
  v1[19] = v3;
  v1[20] = *(_QWORD *)(v3 - 8);
  v1[21] = OUTLINED_FUNCTION_126_0();
  v4 = OUTLINED_FUNCTION_126_0();
  v1[22] = v4;
  OUTLINED_FUNCTION_55_13(v4, &qword_253D7EF40, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  v1[23] = OUTLINED_FUNCTION_103();
  v5 = sub_210E91D68();
  v1[24] = v5;
  v1[25] = *(_QWORD *)(v5 - 8);
  v1[26] = OUTLINED_FUNCTION_103();
  v6 = sub_210E91C60();
  v1[27] = v6;
  v1[28] = *(_QWORD *)(v6 - 8);
  v1[29] = OUTLINED_FUNCTION_103();
  OUTLINED_FUNCTION_6();
  return OUTLINED_FUNCTION_0_4();
}

uint64_t sub_210D37884(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  v3 = v1[28];
  v2 = v1[29];
  v4 = v1[27];
  v5 = v1[15];
  v1[30] = *(_QWORD *)(v5 + 16);
  v6 = OUTLINED_FUNCTION_68(a1, sel_URL);
  sub_210E91C30();

  sub_210E91C00();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  v7 = sub_210E92C08();
  v9 = v8;
  swift_bridgeObjectRelease();
  LOBYTE(v7) = sub_210C36B38(v7, v9, *(_QWORD **)(v5 + 24));
  OUTLINED_FUNCTION_11_0();
  if ((v7 & 1) == 0)
  {
    sub_210D3C010();
    swift_allocError();
    swift_willThrow();
    OUTLINED_FUNCTION_2_38();
    OUTLINED_FUNCTION_15();
    OUTLINED_FUNCTION_49();
    OUTLINED_FUNCTION_58();
    OUTLINED_FUNCTION_77_1();
    OUTLINED_FUNCTION_59_0();
    OUTLINED_FUNCTION_37_18();
    __asm { BR              X0 }
  }
  sub_210D3C04C();
  v1[31] = sub_210E91EAC();
  v10 = (_QWORD *)swift_task_alloc();
  v1[32] = v10;
  OUTLINED_FUNCTION_30_21(v10);
  OUTLINED_FUNCTION_37_18();
  return sub_210E930DC();
}

uint64_t sub_210D379DC()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;

  OUTLINED_FUNCTION_27_0();
  OUTLINED_FUNCTION_58_0(v2);
  *(_QWORD *)(v0 + 264) = v1;
  swift_task_dealloc();
  if (!v1)
    swift_release();
  OUTLINED_FUNCTION_6();
  return OUTLINED_FUNCTION_24_1();
}

uint64_t sub_210D37A30()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  _QWORD *v7;

  sub_210D38C40(v0[14], v0[26]);
  v1 = OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_55_13(v1, &qword_254A81128, (uint64_t (*)(uint64_t))type metadata accessor for AVMetadataKey, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
  v2 = OUTLINED_FUNCTION_16_0();
  v0[34] = v2;
  *(_OWORD *)(v2 + 16) = xmmword_210ED27C0;
  v3 = (void *)*MEMORY[0x24BDB1DA0];
  v4 = (void *)*MEMORY[0x24BDB1D90];
  *(_QWORD *)(v2 + 32) = *MEMORY[0x24BDB1DA0];
  *(_QWORD *)(v2 + 40) = v4;
  v5 = v3;
  v6 = v4;
  v7 = (_QWORD *)swift_task_alloc();
  v0[35] = (uint64_t)v7;
  *v7 = v0;
  v7[1] = sub_210D37B04;
  return sub_210E9319C();
}

uint64_t sub_210D37B04()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_27_0();
  OUTLINED_FUNCTION_67_1();
  *(_QWORD *)(v0 + 288) = v2;
  *(_QWORD *)(v0 + 296) = v1;
  OUTLINED_FUNCTION_36_1();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_6();
  return OUTLINED_FUNCTION_24_1();
}

uint64_t sub_210D37B58()
{
  uint64_t *v0;
  unint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v8;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;

  v1 = v0[36];
  if (v1 >> 62)
  {
    OUTLINED_FUNCTION_21_0();
    v2 = OUTLINED_FUNCTION_52_15();
    OUTLINED_FUNCTION_9_0();
  }
  else
  {
    v2 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v0[38] = v2;
  if (v2)
  {
    v3 = v1 & 0xC000000000000001;
    sub_210C36B28(0, v3 == 0, v0[36]);
    v4 = v0[36];
    if (v3)
      v5 = (id)MEMORY[0x212BD126C](0, v4);
    else
      v5 = *(id *)(v4 + 32);
    v6 = v5;
    if ((sub_210E92E30() & 1) != 0)
    {
      OUTLINED_FUNCTION_11_0();

      OUTLINED_FUNCTION_2_1();
      OUTLINED_FUNCTION_46_16(v0[25]);
      swift_task_dealloc();
      OUTLINED_FUNCTION_15();
      OUTLINED_FUNCTION_58();
      OUTLINED_FUNCTION_77_1();
      OUTLINED_FUNCTION_59_0();
      OUTLINED_FUNCTION_69();
      OUTLINED_FUNCTION_55_15();
      __asm { BR              X1 }
    }
    v10 = MEMORY[0x24BEE4AF8];
    v0[40] = 1;
    v0[41] = v10;
    v0[39] = (uint64_t)v6;
    v11 = (_QWORD *)swift_task_alloc();
    v0[42] = (uint64_t)v11;
    *v11 = v0;
    v11[1] = sub_210D37D24;
    OUTLINED_FUNCTION_55_15();
    return sub_210D39290(v12, v13);
  }
  else
  {
    v8 = v0[37];
    swift_bridgeObjectRelease();
    v16 = MEMORY[0x24BEE4AF8];
    OUTLINED_FUNCTION_3_0();
    sub_210D3ABF0(&v16);
    if (v8)
    {
      OUTLINED_FUNCTION_55_15();
      return swift_release();
    }
    else
    {
      OUTLINED_FUNCTION_43();
      v0[52] = v16;
      v14 = (_QWORD *)swift_task_alloc();
      v0[53] = (uint64_t)v14;
      OUTLINED_FUNCTION_60_16(v14, (uint64_t)sub_210D3827C);
      OUTLINED_FUNCTION_55_15();
      return sub_210D38540(v15);
    }
  }
}

uint64_t sub_210D37D24()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v4;
  uint64_t v5;

  OUTLINED_FUNCTION_27_0();
  OUTLINED_FUNCTION_58_0(v2);
  *(_QWORD *)(v0 + 344) = v1;
  swift_task_dealloc();
  if (v1)
  {
    OUTLINED_FUNCTION_41_25();
    OUTLINED_FUNCTION_9_0();
    OUTLINED_FUNCTION_6();
    return OUTLINED_FUNCTION_24_1();
  }
  else
  {
    v4 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 352) = v4;
    v5 = OUTLINED_FUNCTION_61_13(v4, (uint64_t)sub_210D37D98);
    return sub_210D397E4(v5);
  }
}

uint64_t sub_210D37D98()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v5;
  uint64_t v6;

  OUTLINED_FUNCTION_27_0();
  OUTLINED_FUNCTION_67_1();
  v0[45] = v2;
  v0[46] = v3;
  v0[47] = v1;
  OUTLINED_FUNCTION_36_1();
  if (v1)
  {
    OUTLINED_FUNCTION_41_25();
    OUTLINED_FUNCTION_9_0();
    OUTLINED_FUNCTION_6();
    return OUTLINED_FUNCTION_24_1();
  }
  else
  {
    v5 = (_QWORD *)swift_task_alloc();
    v0[48] = v5;
    v6 = OUTLINED_FUNCTION_61_13(v5, (uint64_t)sub_210D37E10);
    return sub_210D39018(v6);
  }
}

uint64_t sub_210D37E10()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_27_0();
  OUTLINED_FUNCTION_67_1();
  v0[49] = v2;
  v0[50] = v3;
  v0[51] = v1;
  OUTLINED_FUNCTION_36_1();
  if (v1)
  {
    OUTLINED_FUNCTION_41_25();
    OUTLINED_FUNCTION_9_0();
  }
  OUTLINED_FUNCTION_6();
  return OUTLINED_FUNCTION_24_1();
}

void sub_210D37E68()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  double Seconds;
  uint64_t v6;
  Float64 v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  int *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  void *v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  _QWORD *v38;
  uint64_t v39;
  BOOL v40;
  unint64_t v41;
  _QWORD *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;

  v1 = *(_QWORD *)(v0 + 400);
  v2 = *(void **)(v0 + 312);
  if (!v1)
  {
    v30 = *(_QWORD *)(v0 + 360);
    v29 = *(_QWORD *)(v0 + 368);
    sub_210C33358(*(_QWORD *)(v0 + 184), (uint64_t)&qword_253D7EF40, (uint64_t)MEMORY[0x24BDCDAC0], (uint64_t (*)(_QWORD, uint64_t, uint64_t, uint64_t (*)(void)))sub_210C33834);
    sub_210C93F60(v30, v29);

LABEL_9:
    v19 = *(_QWORD *)(v0 + 328);
    goto LABEL_10;
  }
  objc_msgSend(*(id *)(v0 + 312), sel_timeRange);
  v3 = *(_QWORD *)(v0 + 480);
  v4 = *(_QWORD *)(v0 + 472);
  *(_QWORD *)(v0 + 64) = *(_QWORD *)(v0 + 464);
  *(_QWORD *)(v0 + 72) = v4;
  *(_QWORD *)(v0 + 80) = v3;
  Seconds = CMTimeGetSeconds((CMTime *)(v0 + 64));
  objc_msgSend(v2, sel_timeRange);
  *(_QWORD *)(v0 + 88) = *(_QWORD *)(v0 + 16);
  v6 = *(_QWORD *)(v0 + 32);
  *(_QWORD *)(v0 + 96) = *(_QWORD *)(v0 + 24);
  *(_QWORD *)(v0 + 104) = v6;
  v7 = CMTimeGetSeconds((CMTime *)(v0 + 88));
  if (Seconds <= 0.05)
  {
    v32 = *(_QWORD *)(v0 + 360);
    v31 = *(_QWORD *)(v0 + 368);
    v33 = *(void **)(v0 + 312);
    sub_210C33358(*(_QWORD *)(v0 + 184), (uint64_t)&qword_253D7EF40, (uint64_t)MEMORY[0x24BDCDAC0], (uint64_t (*)(_QWORD, uint64_t, uint64_t, uint64_t (*)(void)))sub_210C33834);
    sub_210C93F60(v32, v31);
    OUTLINED_FUNCTION_2_1();

    goto LABEL_9;
  }
  v8 = *(_QWORD *)(v0 + 360);
  v47 = *(_QWORD *)(v0 + 392);
  v48 = *(_QWORD *)(v0 + 368);
  v9 = *(uint64_t **)(v0 + 176);
  v46 = *(_QWORD *)(v0 + 184);
  v49 = *(_QWORD *)(v0 + 168);
  v10 = *(_QWORD *)(v0 + 144);
  v11 = *(int **)(v0 + 152);
  v13 = *(_QWORD *)(v0 + 128);
  v12 = *(_QWORD *)(v0 + 136);
  sub_210E91D14();
  v14 = sub_210E91CFC();
  v16 = v15;
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v10, v13);
  sub_210D3BF20(v46, (uint64_t)v9 + v11[6]);
  *v9 = v14;
  v9[1] = v16;
  v9[2] = v47;
  v9[3] = v1;
  v17 = (uint64_t *)((char *)v9 + v11[7]);
  *v17 = v8;
  v17[1] = v48;
  *(double *)((char *)v9 + v11[8]) = Seconds;
  *(Float64 *)((char *)v9 + v11[9]) = v7;
  sub_210CCC3C8((uint64_t)v9, v49);
  sub_210D3BF7C(v8, v48);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v19 = *(_QWORD *)(v0 + 328);
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    goto LABEL_23;
  while (1)
  {
    v21 = *(_QWORD *)(v19 + 16);
    v20 = *(_QWORD *)(v19 + 24);
    if (v21 >= v20 >> 1)
      v19 = OUTLINED_FUNCTION_75_11(v20 > 1, v21 + 1);
    v23 = *(_QWORD *)(v0 + 360);
    v22 = *(_QWORD *)(v0 + 368);
    v24 = *(void **)(v0 + 312);
    v26 = *(_QWORD *)(v0 + 176);
    v25 = *(_QWORD *)(v0 + 184);
    v28 = *(_QWORD *)(v0 + 160);
    v27 = *(_QWORD *)(v0 + 168);
    *(_QWORD *)(v19 + 16) = v21 + 1;
    sub_210CCC124(v27, v19+ ((*(unsigned __int8 *)(v28 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v28 + 80))+ *(_QWORD *)(v28 + 72) * v21);

    sub_210C93F60(v23, v22);
    sub_210D3BFD4(v26);
    sub_210C33358(v25, (uint64_t)&qword_253D7EF40, (uint64_t)MEMORY[0x24BDCDAC0], (uint64_t (*)(_QWORD, uint64_t, uint64_t, uint64_t (*)(void)))sub_210C33834);
LABEL_10:
    v34 = *(_QWORD *)(v0 + 320);
    if (v34 == *(_QWORD *)(v0 + 304))
    {
      v35 = *(_QWORD *)(v0 + 408);
      swift_bridgeObjectRelease();
      v50 = v19;
      OUTLINED_FUNCTION_3_0();
      sub_210D3ABF0(&v50);
      if (v35)
      {
        OUTLINED_FUNCTION_21_27();
        swift_release();
      }
      else
      {
        OUTLINED_FUNCTION_43();
        *(_QWORD *)(v0 + 416) = v50;
        v38 = (_QWORD *)swift_task_alloc();
        *(_QWORD *)(v0 + 424) = v38;
        OUTLINED_FUNCTION_60_16(v38, (uint64_t)sub_210D3827C);
        OUTLINED_FUNCTION_21_27();
        sub_210D38540(v39);
      }
      return;
    }
    v36 = *(_QWORD *)(v0 + 288);
    if ((v36 & 0xC000000000000001) != 0)
    {
      v37 = (id)MEMORY[0x212BD126C](*(_QWORD *)(v0 + 320));
      v34 = *(_QWORD *)(v0 + 320);
    }
    else
    {
      if (v34 >= *(_QWORD *)((v36 & 0xFFFFFFFFFFFFF8) + 0x10))
      {
        __break(1u);
        return;
      }
      v37 = OUTLINED_FUNCTION_25_1(v36 + 8 * v34);
    }
    v40 = __OFADD__(v34, 1);
    v41 = v34 + 1;
    if (!v40)
      break;
    __break(1u);
LABEL_23:
    v19 = OUTLINED_FUNCTION_75_11(0, *(_QWORD *)(v19 + 16) + 1);
  }
  if ((sub_210E92E30() & 1) != 0)
  {
    OUTLINED_FUNCTION_9_0();

    OUTLINED_FUNCTION_11_0();
    OUTLINED_FUNCTION_46_16(*(_QWORD *)(v0 + 200));
    swift_task_dealloc();
    OUTLINED_FUNCTION_15();
    OUTLINED_FUNCTION_49();
    OUTLINED_FUNCTION_58();
    OUTLINED_FUNCTION_77_1();
    OUTLINED_FUNCTION_59_0();
    OUTLINED_FUNCTION_21_27();
    __asm { BR              X1 }
  }
  *(_QWORD *)(v0 + 320) = v41;
  *(_QWORD *)(v0 + 328) = v19;
  *(_QWORD *)(v0 + 312) = v37;
  v43 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 336) = v43;
  *v43 = v0;
  v43[1] = sub_210D37D24;
  OUTLINED_FUNCTION_21_27();
  sub_210D39290(v44, v45);
}

uint64_t sub_210D3827C(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 432) = a1;
  OUTLINED_FUNCTION_36_1();
  swift_release();
  OUTLINED_FUNCTION_6();
  return OUTLINED_FUNCTION_0_4();
}

void sub_210D382D0()
{
  _QWORD *v0;

  (*(void (**)(_QWORD, _QWORD))(v0[25] + 8))(v0[26], v0[24]);
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_49();
  OUTLINED_FUNCTION_58();
  OUTLINED_FUNCTION_77_1();
  OUTLINED_FUNCTION_59_0();
  OUTLINED_FUNCTION_69();
  OUTLINED_FUNCTION_38_3();
  OUTLINED_FUNCTION_37_18();
  __asm { BR              X1 }
}

uint64_t sub_210D38348()
{
  uint64_t v0;

  OUTLINED_FUNCTION_67();
  swift_release();
  OUTLINED_FUNCTION_2_38();
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_49();
  OUTLINED_FUNCTION_58();
  OUTLINED_FUNCTION_77_1();
  OUTLINED_FUNCTION_59_0();
  return OUTLINED_FUNCTION_60_0(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_210D38390()
{
  uint64_t v0;

  OUTLINED_FUNCTION_67();
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 200) + 8))(*(_QWORD *)(v0 + 208), *(_QWORD *)(v0 + 192));
  OUTLINED_FUNCTION_2_38();
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_49();
  OUTLINED_FUNCTION_58();
  OUTLINED_FUNCTION_77_1();
  OUTLINED_FUNCTION_59_0();
  return OUTLINED_FUNCTION_60_0(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_210D383E0()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_67();
  v1 = *(_QWORD *)(v0 + 200);

  OUTLINED_FUNCTION_52_4(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  OUTLINED_FUNCTION_2_38();
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_49();
  OUTLINED_FUNCTION_58();
  OUTLINED_FUNCTION_77_1();
  OUTLINED_FUNCTION_59_0();
  return OUTLINED_FUNCTION_60_0(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_210D38438()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_67();
  v1 = *(_QWORD *)(v0 + 200);
  v2 = *(_QWORD *)(v0 + 184);

  sub_210C33358(v2, (uint64_t)&qword_253D7EF40, (uint64_t)MEMORY[0x24BDCDAC0], (uint64_t (*)(_QWORD, uint64_t, uint64_t, uint64_t (*)(void)))sub_210C33834);
  OUTLINED_FUNCTION_52_4(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  OUTLINED_FUNCTION_2_38();
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_49();
  OUTLINED_FUNCTION_58();
  OUTLINED_FUNCTION_77_1();
  OUTLINED_FUNCTION_59_0();
  return OUTLINED_FUNCTION_60_0(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_210D384B0()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  OUTLINED_FUNCTION_67();
  v1 = *(_QWORD *)(v0 + 360);
  v2 = *(_QWORD *)(v0 + 368);
  v4 = *(_QWORD *)(v0 + 200);
  v3 = *(_QWORD *)(v0 + 208);
  v6 = *(_QWORD *)(v0 + 184);
  v5 = *(_QWORD *)(v0 + 192);

  sub_210C93F60(v1, v2);
  sub_210C33358(v6, (uint64_t)&qword_253D7EF40, (uint64_t)MEMORY[0x24BDCDAC0], (uint64_t (*)(_QWORD, uint64_t, uint64_t, uint64_t (*)(void)))sub_210C33834);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  OUTLINED_FUNCTION_2_38();
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_49();
  OUTLINED_FUNCTION_58();
  OUTLINED_FUNCTION_77_1();
  OUTLINED_FUNCTION_59_0();
  return OUTLINED_FUNCTION_60_0(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_210D38540(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v2[8] = a1;
  v2[9] = v1;
  OUTLINED_FUNCTION_55_13(a1, &qword_254A7ED40, (uint64_t (*)(uint64_t))type metadata accessor for PodcastChapter, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  v2[10] = OUTLINED_FUNCTION_103();
  v3 = OUTLINED_FUNCTION_38_22();
  v2[11] = v3;
  v2[12] = *(_QWORD *)(v3 - 8);
  v2[13] = OUTLINED_FUNCTION_126_0();
  v2[14] = OUTLINED_FUNCTION_126_0();
  v2[15] = OUTLINED_FUNCTION_126_0();
  v2[16] = OUTLINED_FUNCTION_126_0();
  v2[17] = OUTLINED_FUNCTION_126_0();
  v2[18] = OUTLINED_FUNCTION_126_0();
  sub_210D3BEBC();
  v2[19] = v4;
  v2[20] = OUTLINED_FUNCTION_103();
  OUTLINED_FUNCTION_6();
  return OUTLINED_FUNCTION_0_4();
}

uint64_t sub_210D385F8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t *v11;
  _QWORD *v12;
  uint64_t v13;
  double v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t *v23;
  uint64_t result;
  uint64_t v25;
  double v26;
  _QWORD *v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t);
  _QWORD *v43;
  _QWORD *v44;
  _QWORD *v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD *v48;
  _QWORD *v49;
  uint64_t v50;
  _QWORD *v51;
  uint64_t v52;
  int *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;

  v1 = v0[8];
  v55 = *(_QWORD *)(v1 + 16);
  if (!v55)
  {
    swift_bridgeObjectRetain();
    v6 = v1;
LABEL_18:
    v0[21] = v6;
    v40 = v0[10];
    v39 = v0[11];
    sub_210C578C0(v1, v40);
    if (__swift_getEnumTagSinglePayload(v40, 1, v39) == 1)
    {
      sub_210C33358(v0[10], (uint64_t)&qword_254A7ED40, (uint64_t)type metadata accessor for PodcastChapter, (uint64_t (*)(_QWORD, uint64_t, uint64_t, uint64_t (*)(void)))sub_210C33834);
LABEL_20:
      OUTLINED_FUNCTION_24_25();
      OUTLINED_FUNCTION_15();
      OUTLINED_FUNCTION_49();
      OUTLINED_FUNCTION_58();
      OUTLINED_FUNCTION_77_1();
      OUTLINED_FUNCTION_59_0();
      OUTLINED_FUNCTION_69();
      OUTLINED_FUNCTION_67_2();
      v41 = OUTLINED_FUNCTION_38_3();
      return v42(v41);
    }
    else
    {
      sub_210CCC124(v0[10], v0[14]);
      sub_210D063FC();
      v0[22] = sub_210E91EC4();
      v43 = (_QWORD *)swift_task_alloc();
      v0[23] = v43;
      *v43 = v0;
      v43[1] = sub_210D389FC;
      return sub_210E930DC();
    }
  }
  v44 = (_QWORD *)v0[17];
  v45 = (_QWORD *)v0[18];
  v48 = (_QWORD *)v0[15];
  v49 = (_QWORD *)v0[16];
  v2 = v0[12];
  v53 = (int *)v0[11];
  v54 = v0[19];
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = *(_QWORD *)(v2 + 72);
  OUTLINED_FUNCTION_3_0();
  v5 = 0;
  v46 = -v4;
  v51 = v0;
  v52 = v4;
  v47 = v1 - v4;
  v6 = v1;
  v50 = v1;
  while (1)
  {
    v7 = (_QWORD *)v0[20];
    v8 = v0[18];
    v9 = (uint64_t)v7 + *(int *)(v54 + 48);
    *v7 = v5;
    sub_210CCC3C8(v1 + v3, v9);
    sub_210CCC124(v9, v8);
    if ((sub_210E92E30() & 1) != 0)
    {
      v38 = v0[18];
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_9_0();
      sub_210D3BFD4(v38);
      goto LABEL_20;
    }
    v10 = (uint64_t *)v0[18];
    if (v5)
      break;
    v26 = *(double *)((char *)v10 + v53[9]);
    if (v26 != 0.0)
    {
      v27 = (_QWORD *)v0[17];
      v28 = v26 + *(double *)((char *)v10 + v53[8]);
      v29 = *v10;
      v31 = v45[1];
      v30 = v45[2];
      v32 = v45[3];
      v33 = (uint64_t)v10 + v53[6];
      v34 = (uint64_t *)((char *)v10 + v53[7]);
      v35 = *v34;
      v36 = v34[1];
      *v27 = v29;
      v44[1] = v31;
      v44[2] = v30;
      v44[3] = v32;
      OUTLINED_FUNCTION_66_10(v33, v53[6]);
      v37 = (_QWORD *)((char *)v27 + v53[7]);
      *v37 = v35;
      v37[1] = v36;
      *(double *)((char *)v27 + v53[8]) = v28;
      *(_QWORD *)((char *)v27 + v53[9]) = 0;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      OUTLINED_FUNCTION_69_13();
      result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        result = OUTLINED_FUNCTION_65_12();
        v6 = result;
      }
      if (!*(_QWORD *)(v6 + 16))
        goto LABEL_23;
      sub_210D3BF90(v0[17], v6 + v3);
    }
LABEL_14:
    ++v5;
    sub_210D3BFD4(v0[18]);
    v3 += v52;
    if (v55 == v5)
    {
      swift_bridgeObjectRelease();
      v1 = v0[8];
      goto LABEL_18;
    }
  }
  v12 = (_QWORD *)v0[15];
  v11 = (uint64_t *)v0[16];
  sub_210CCC3C8(v47 + v3, (uint64_t)v11);
  v13 = v53[9];
  v14 = *(double *)((char *)v11 + v13);
  v15 = *(double *)((char *)v10 + v13) - v14;
  v56 = v6;
  v16 = *v11;
  v17 = v49[1];
  v18 = v49[2];
  v19 = v49[3];
  OUTLINED_FUNCTION_66_10((uint64_t)v11 + v53[6], v53[6]);
  v20 = (uint64_t *)((char *)v11 + v53[7]);
  v21 = *v20;
  v22 = v20[1];
  *v12 = v16;
  v6 = v56;
  v48[1] = v17;
  v48[2] = v18;
  v48[3] = v19;
  v23 = (_QWORD *)((char *)v12 + v53[7]);
  *v23 = v21;
  v23[1] = v22;
  *(double *)((char *)v12 + v53[8]) = v15;
  *(double *)((char *)v12 + v53[9]) = v14;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_210D3BF7C(v21, v22);
  result = swift_isUniquelyReferenced_nonNull_native();
  if ((result & 1) == 0)
  {
    result = OUTLINED_FUNCTION_65_12();
    v6 = result;
  }
  v1 = v50;
  v0 = v51;
  if ((unint64_t)(v5 - 1) < *(_QWORD *)(v6 + 16))
  {
    v25 = v51[16];
    sub_210D3BF90(v51[15], v6 + v46 + v3);
    sub_210D3BFD4(v25);
    goto LABEL_14;
  }
  __break(1u);
LABEL_23:
  __break(1u);
  return result;
}

uint64_t sub_210D389FC()
{
  void *v0;
  _QWORD *v1;

  OUTLINED_FUNCTION_27_0();
  OUTLINED_FUNCTION_58_0(v1);
  swift_task_dealloc();
  if (v0)

  OUTLINED_FUNCTION_64();
  OUTLINED_FUNCTION_6();
  return OUTLINED_FUNCTION_24_1();
}

uint64_t sub_210D38A58()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t *v2;
  _QWORD *v3;
  int *v4;
  uint64_t v5;
  Float64 Seconds;
  double v7;
  Float64 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t result;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t);
  unint64_t v22;

  *(_QWORD *)(v0 + 40) = *(_QWORD *)(v0 + 16);
  v1 = *(_QWORD *)(v0 + 168);
  v3 = *(_QWORD **)(v0 + 104);
  v2 = *(uint64_t **)(v0 + 112);
  v4 = *(int **)(v0 + 88);
  v5 = *(_QWORD *)(v0 + 32);
  *(_QWORD *)(v0 + 48) = *(_QWORD *)(v0 + 24);
  *(_QWORD *)(v0 + 56) = v5;
  Seconds = CMTimeGetSeconds((CMTime *)(v0 + 40));
  v22 = *(_QWORD *)(v1 + 16);
  v7 = *(double *)((char *)v2 + v4[9]);
  v8 = Seconds - v7;
  v9 = *v2;
  v10 = v2[1];
  v12 = v2[2];
  v11 = v2[3];
  OUTLINED_FUNCTION_66_10((uint64_t)v2 + v4[6], v4[6]);
  v13 = (uint64_t *)((char *)v2 + v4[7]);
  v14 = *v13;
  v15 = v13[1];
  *v3 = v9;
  v3[1] = v10;
  v3[2] = v12;
  v3[3] = v11;
  v16 = (_QWORD *)((char *)v3 + v4[7]);
  *v16 = v14;
  v16[1] = v15;
  *(Float64 *)((char *)v3 + v4[8]) = v8;
  *(double *)((char *)v3 + v4[9]) = v7;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_69_13();
  result = swift_isUniquelyReferenced_nonNull_native();
  v18 = *(_QWORD *)(v0 + 168);
  if ((result & 1) == 0)
  {
    result = OUTLINED_FUNCTION_65_12();
    v18 = result;
  }
  if (v22)
  {
    if (v22 <= *(_QWORD *)(v18 + 16))
    {
      v19 = *(_QWORD *)(v0 + 112);
      sub_210D3BF90(*(_QWORD *)(v0 + 104), v18+ ((*(unsigned __int8 *)(*(_QWORD *)(v0 + 96) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v0 + 96) + 80))+ *(_QWORD *)(*(_QWORD *)(v0 + 96) + 72) * (v22 - 1));
      sub_210D3BFD4(v19);
      OUTLINED_FUNCTION_24_25();
      OUTLINED_FUNCTION_15();
      OUTLINED_FUNCTION_49();
      OUTLINED_FUNCTION_58();
      OUTLINED_FUNCTION_77_1();
      OUTLINED_FUNCTION_59_0();
      OUTLINED_FUNCTION_69();
      OUTLINED_FUNCTION_67_2();
      v20 = OUTLINED_FUNCTION_38_3();
      return v21(v20);
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_210D38BD4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t);

  sub_210D3BFD4(*(_QWORD *)(v0 + 112));
  OUTLINED_FUNCTION_24_25();
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_49();
  OUTLINED_FUNCTION_58();
  OUTLINED_FUNCTION_77_1();
  OUTLINED_FUNCTION_59_0();
  OUTLINED_FUNCTION_69();
  OUTLINED_FUNCTION_67_2();
  v1 = OUTLINED_FUNCTION_38_3();
  return v2(v1);
}

uint64_t sub_210D38C40@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
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
  char *v13;
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
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  void (*v30)(char *, uint64_t);
  uint64_t result;
  unint64_t v32;
  uint64_t v33;
  char *v34;
  char *v35;
  uint64_t *v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  void (*v42)(char *, char *, uint64_t);
  char v43;
  char *v44;
  char *v45;
  void (*v46)(char *, uint64_t);
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  unint64_t v58;
  void (*v59)(char *, uint64_t);
  char *v60;
  uint64_t v61;
  uint64_t v62;
  void (*v63)(char *, unint64_t, uint64_t);
  char v64[16];
  char *v65;

  v2 = a1;
  v51 = a2;
  OUTLINED_FUNCTION_55_13(a1, &qword_254A810F8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  v6 = MEMORY[0x24BDAC7A8](v3, v4, v5);
  v8 = (char *)&v50 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v6, v9, v10);
  v13 = (char *)&v50 - v12;
  MEMORY[0x24BDAC7A8](v11, v14, v15);
  v17 = (char *)&v50 - v16;
  v18 = sub_210E91D68();
  v19 = *(_QWORD *)(v18 - 8);
  v22 = MEMORY[0x24BDAC7A8](v18, v20, v21);
  v24 = (char *)&v50 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v22, v25, v26);
  v28 = (char *)&v50 - v27;
  sub_210E91D5C();
  v65 = v28;
  v29 = v19;
  LOBYTE(v19) = sub_210D373E0((uint64_t (*)(char *))sub_210D3BEA0, (uint64_t)v64, v2);
  v30 = *(void (**)(char *, uint64_t))(v29 + 8);
  v30(v28, v18);
  if ((v19 & 1) != 0)
    return sub_210E91D5C();
  v59 = v30;
  v60 = v28;
  v57 = v17;
  v50 = v8;
  result = sub_210E91D44();
  v56 = *(_QWORD *)(result + 16);
  if (v56)
  {
    v32 = 0;
    v33 = *(_QWORD *)(v2 + 16);
    v53 = v2;
    v54 = result + 32;
    v34 = v24;
    v35 = v60;
    v52 = v33;
    v55 = result;
    while (v32 < *(_QWORD *)(result + 16))
    {
      v58 = v32;
      v36 = (uint64_t *)(v54 + 16 * v32);
      if (v33)
      {
        v37 = v33;
        v62 = *v36;
        v38 = v2 + ((*(unsigned __int8 *)(v29 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v29 + 80));
        OUTLINED_FUNCTION_54_0();
        swift_bridgeObjectRetain();
        v61 = *(_QWORD *)(v29 + 72);
        v63 = *(void (**)(char *, unint64_t, uint64_t))(v29 + 16);
        v39 = v37;
        while (1)
        {
          v63(v13, v38, v18);
          OUTLINED_FUNCTION_43_20((uint64_t)v13, 0);
          OUTLINED_FUNCTION_56_15((uint64_t)v13);
          if (v40)
            break;
          v41 = v29;
          v42 = *(void (**)(char *, char *, uint64_t))(v29 + 32);
          v42(v34, v13, v18);
          OUTLINED_FUNCTION_54_0();
          sub_210E91D2C();
          v43 = MEMORY[0x212BCFBF8](v34, v35);
          v44 = v35;
          v45 = v34;
          v46 = v59;
          v59(v44, v18);
          if ((v43 & 1) != 0)
          {
            v2 = v53;
            OUTLINED_FUNCTION_2_1();
            v48 = (uint64_t)v57;
            v42(v57, v45, v18);
            v47 = 0;
            v29 = v41;
            v34 = v45;
            v35 = v60;
            goto LABEL_16;
          }
          v46(v45, v18);
          v38 += v61;
          --v39;
          v29 = v41;
          v34 = v45;
          v35 = v60;
          if (!v39)
            goto LABEL_13;
        }
      }
      else
      {
        OUTLINED_FUNCTION_54_0();
        swift_bridgeObjectRetain();
LABEL_13:
        OUTLINED_FUNCTION_43_20((uint64_t)v13, 1);
      }
      v2 = v53;
      OUTLINED_FUNCTION_2_1();
      v47 = 1;
      v48 = (uint64_t)v57;
LABEL_16:
      OUTLINED_FUNCTION_43_20(v48, v47);
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_56_15(v48);
      if (!v40)
      {
        swift_bridgeObjectRelease();
        return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v29 + 32))(v51, v48, v18);
      }
      v32 = v58 + 1;
      sub_210C33358(v48, (uint64_t)&qword_254A810F8, (uint64_t)MEMORY[0x24BDCEEA8], (uint64_t (*)(_QWORD, uint64_t, uint64_t, uint64_t (*)(void)))sub_210C33834);
      result = v55;
      v33 = v52;
      if (v32 == v56)
        goto LABEL_19;
    }
    __break(1u);
  }
  else
  {
LABEL_19:
    swift_bridgeObjectRelease();
    v49 = (uint64_t)v50;
    sub_210D37370(v2, (uint64_t (*)(_QWORD))MEMORY[0x24BDCEEA8], (uint64_t)v50);
    OUTLINED_FUNCTION_56_15(v49);
    if (v40)
    {
      sub_210E91D5C();
      return sub_210C33358(v49, (uint64_t)&qword_254A810F8, (uint64_t)MEMORY[0x24BDCEEA8], (uint64_t (*)(_QWORD, uint64_t, uint64_t, uint64_t (*)(void)))sub_210C33834);
    }
    else
    {
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v29 + 32))(v51, v49, v18);
    }
  }
  return result;
}

uint64_t sub_210D39018(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 32) = a1;
  return OUTLINED_FUNCTION_91();
}

uint64_t sub_210D39028()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v4 = objc_msgSend(*(id *)(v0 + 32), sel_items);
  OUTLINED_FUNCTION_16_2((uint64_t)v4, &qword_254A810C0);
  v5 = OUTLINED_FUNCTION_43_6();

  if (v5 >> 62)
    goto LABEL_18;
  v6 = *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (v6)
  {
    v7 = 0;
    v26 = *MEMORY[0x24BDB1DA0];
    while (1)
    {
      if ((v5 & 0xC000000000000001) != 0)
        OUTLINED_FUNCTION_71_13();
      v8 = OUTLINED_FUNCTION_25_1(v5 + 8 * v7);
      v16 = OUTLINED_FUNCTION_59_17((uint64_t)v8, v9, v10, v11, v12, v13, v14, v15, v25, v26, v27);
      if (v17)
        break;
      v18 = OUTLINED_FUNCTION_68(v16, sel_commonKey);
      if (v18)
      {
        v19 = v18;
        sub_210E92BA8();
        if (v3 == OUTLINED_FUNCTION_47_21() && v2 == v20)
        {
          OUTLINED_FUNCTION_43();

LABEL_16:
          v23 = OUTLINED_FUNCTION_9_0();
          OUTLINED_FUNCTION_81_8(v23, &qword_254A810F0, (unint64_t *)&unk_253D7B1A0, MEMORY[0x24BEE0D00]);
          *(_QWORD *)(v27 + 48) = sub_210E91E88();
          v24 = (_QWORD *)swift_task_alloc();
          *(_QWORD *)(v27 + 56) = v24;
          OUTLINED_FUNCTION_30_21(v24);
          return OUTLINED_FUNCTION_22_28();
        }
        OUTLINED_FUNCTION_31_28();
        OUTLINED_FUNCTION_57_17();
        swift_bridgeObjectRelease();

        if ((v3 & 1) != 0)
          goto LABEL_16;
      }

      ++v7;
      if (v1 == v6)
        goto LABEL_14;
    }
    __break(1u);
LABEL_18:
    OUTLINED_FUNCTION_21_0();
    v6 = OUTLINED_FUNCTION_52_15();
    OUTLINED_FUNCTION_9_0();
  }
LABEL_14:
  OUTLINED_FUNCTION_9_0();
  return OUTLINED_FUNCTION_23_22(0, 0, *(uint64_t (**)(void))(v27 + 8));
}

uint64_t sub_210D391D8()
{
  uint64_t v0;

  OUTLINED_FUNCTION_28_29();
  if (!v0)
    swift_release();
  OUTLINED_FUNCTION_6();
  return OUTLINED_FUNCTION_24_1();
}

uint64_t sub_210D3921C()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v0 + 8))(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_210D39254()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_210D39290(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 88) = a1;
  *(_QWORD *)(v2 + 96) = a2;
  return OUTLINED_FUNCTION_91();
}

uint64_t sub_210D392A0()
{
  uint64_t v0;
  id v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  _QWORD *v11;

  OUTLINED_FUNCTION_67();
  v1 = objc_msgSend(*(id *)(v0 + 96), sel_items);
  OUTLINED_FUNCTION_16_2((uint64_t)v1, &qword_254A810C0);
  v2 = OUTLINED_FUNCTION_43_6();
  *(_QWORD *)(v0 + 104) = v2;

  if (v2 >> 62)
  {
    OUTLINED_FUNCTION_21_0();
    v3 = OUTLINED_FUNCTION_52_15();
    OUTLINED_FUNCTION_9_0();
  }
  else
  {
    v3 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  *(_QWORD *)(v0 + 112) = v3;
  if (v3)
  {
    sub_210D3BCFC();
    *(_QWORD *)(v0 + 120) = v4;
    OUTLINED_FUNCTION_81_8(v4, &qword_254A810F0, (unint64_t *)&unk_253D7B1A0, MEMORY[0x24BEE0D00]);
    v5 = *MEMORY[0x24BDB1DA8];
    *(_QWORD *)(v0 + 128) = v6;
    *(_QWORD *)(v0 + 136) = v5;
    v7 = *(_QWORD *)(v0 + 104);
    if ((v7 & 0xC000000000000001) != 0)
      v8 = (id)MEMORY[0x212BD126C](0);
    else
      v8 = *(id *)(v7 + 32);
    *(_QWORD *)(v0 + 144) = v8;
    *(_QWORD *)(v0 + 152) = 1;
    *(_QWORD *)(v0 + 160) = sub_210E91E94();
    *(_QWORD *)(v0 + 168) = sub_210E91E88();
    v11 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 176) = v11;
    *v11 = v0;
    v11[1] = sub_210D3943C;
    return sub_210E930E8();
  }
  else
  {
    OUTLINED_FUNCTION_9_0();
    v9 = OUTLINED_FUNCTION_72_14();
    OUTLINED_FUNCTION_42_21(v9);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_210D3943C()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;

  v4 = *v1;
  v2 = v4;
  OUTLINED_FUNCTION_58_0(&v4);
  *(_QWORD *)(v2 + 184) = v0;
  swift_task_dealloc();
  if (v0)
    swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_64();
  swift_release();
  OUTLINED_FUNCTION_6();
  return swift_task_switch();
}

id sub_210D394C4()
{
  uint64_t v0;
  _OWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id result;
  _QWORD *v14;
  BOOL v15;
  char v16;
  void *v17;
  void *v19;

  v1 = (_OWORD *)(v0 + 16);
  v2 = *(_QWORD *)(v0 + 80);
  v3 = *(_QWORD *)(v0 + 56);
  if (!v2)
  {
    *v1 = 0u;
    *(_OWORD *)(v0 + 32) = 0u;
LABEL_18:
    OUTLINED_FUNCTION_50_13();
    OUTLINED_FUNCTION_33();
    sub_210C33358(v0 + 16, (uint64_t)&qword_253D7F240, MEMORY[0x24BEE4AD8] + 8, (uint64_t (*)(_QWORD, uint64_t, uint64_t, uint64_t (*)(void)))sub_210BE0BF0);
    goto LABEL_20;
  }
  if (*(_QWORD *)(v2 + 16))
  {
    v4 = sub_210C76F60(*(id *)(v0 + 136));
    v5 = *(void **)(v0 + 136);
    if ((v6 & 1) != 0)
    {
      sub_210C331E0(*(_QWORD *)(v2 + 56) + 32 * v4, v0 + 16);
    }
    else
    {
      *v1 = 0u;
      *(_OWORD *)(v0 + 32) = 0u;
    }

  }
  else
  {
    *v1 = 0u;
    *(_OWORD *)(v0 + 32) = 0u;
  }
  OUTLINED_FUNCTION_9_0();
  if (!*(_QWORD *)(v0 + 40))
    goto LABEL_18;
  if (swift_dynamicCast() && (v7 = *(_QWORD *)(v0 + 72), v3))
  {
    v8 = *(_QWORD *)(v0 + 64);
    v9 = v8 == 0x2072657470616863 && v7 == 0xEB000000006C7275;
    if (v9
      || (OUTLINED_FUNCTION_95() & 1) != 0
      || (v8 == 1178948168 ? (v15 = v7 == 0xE400000000000000) : (v15 = 0), v15))
    {
      swift_bridgeObjectRelease();
LABEL_35:
      swift_bridgeObjectRelease();
      v17 = *(void **)(v0 + 144);
      sub_210E91C48();
      OUTLINED_FUNCTION_33();

LABEL_36:
      OUTLINED_FUNCTION_37_18();
      __asm { BR              X0 }
    }
    v16 = OUTLINED_FUNCTION_95();
    OUTLINED_FUNCTION_9_0();
    if ((v16 & 1) != 0)
      goto LABEL_35;
    v19 = *(void **)(v0 + 144);
    OUTLINED_FUNCTION_33();

  }
  else
  {
    OUTLINED_FUNCTION_50_13();
    swift_bridgeObjectRelease();
  }
LABEL_20:
  v10 = *(_QWORD *)(v0 + 152);
  v11 = *(_QWORD *)(v0 + 104);
  if (v10 == *(_QWORD *)(v0 + 112))
  {
    swift_bridgeObjectRelease();
    v12 = OUTLINED_FUNCTION_72_14();
    OUTLINED_FUNCTION_42_21(v12);
    goto LABEL_36;
  }
  if ((v11 & 0xC000000000000001) != 0)
    result = (id)MEMORY[0x212BD126C](*(_QWORD *)(v0 + 152));
  else
    result = OUTLINED_FUNCTION_25_1(v11 + 8 * v10);
  *(_QWORD *)(v0 + 144) = result;
  *(_QWORD *)(v0 + 152) = v10 + 1;
  if (__OFADD__(v10, 1))
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v0 + 160) = sub_210E91E94();
    *(_QWORD *)(v0 + 168) = sub_210E91E88();
    v14 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 176) = v14;
    *v14 = v0;
    v14[1] = sub_210D3943C;
    OUTLINED_FUNCTION_37_18();
    return (id)sub_210E930E8();
  }
  return result;
}

uint64_t sub_210D397B4()
{
  uint64_t v0;

  OUTLINED_FUNCTION_50_13();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_210D397E4(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 32) = a1;
  return OUTLINED_FUNCTION_91();
}

uint64_t sub_210D397F4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v4 = objc_msgSend(*(id *)(v0 + 32), sel_items);
  OUTLINED_FUNCTION_16_2((uint64_t)v4, &qword_254A810C0);
  v5 = OUTLINED_FUNCTION_43_6();

  if (v5 >> 62)
    goto LABEL_18;
  v6 = *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (v6)
  {
    v7 = 0;
    v26 = *MEMORY[0x24BDB1D90];
    while (1)
    {
      if ((v5 & 0xC000000000000001) != 0)
        OUTLINED_FUNCTION_71_13();
      v8 = OUTLINED_FUNCTION_25_1(v5 + 8 * v7);
      v16 = OUTLINED_FUNCTION_59_17((uint64_t)v8, v9, v10, v11, v12, v13, v14, v15, v25, v26, v27);
      if (v17)
        break;
      v18 = OUTLINED_FUNCTION_68(v16, sel_commonKey);
      if (v18)
      {
        v19 = v18;
        sub_210E92BA8();
        if (v3 == OUTLINED_FUNCTION_47_21() && v2 == v20)
        {
          OUTLINED_FUNCTION_43();

LABEL_16:
          v23 = OUTLINED_FUNCTION_9_0();
          OUTLINED_FUNCTION_81_8(v23, &qword_254A810C8, &qword_254A810D0, MEMORY[0x24BDCDDE8]);
          *(_QWORD *)(v27 + 48) = sub_210E91EA0();
          v24 = (_QWORD *)swift_task_alloc();
          *(_QWORD *)(v27 + 56) = v24;
          OUTLINED_FUNCTION_30_21(v24);
          return OUTLINED_FUNCTION_22_28();
        }
        OUTLINED_FUNCTION_31_28();
        OUTLINED_FUNCTION_57_17();
        swift_bridgeObjectRelease();

        if ((v3 & 1) != 0)
          goto LABEL_16;
      }

      ++v7;
      if (v1 == v6)
        goto LABEL_14;
    }
    __break(1u);
LABEL_18:
    OUTLINED_FUNCTION_21_0();
    v6 = OUTLINED_FUNCTION_52_15();
    OUTLINED_FUNCTION_9_0();
  }
LABEL_14:
  OUTLINED_FUNCTION_9_0();
  return OUTLINED_FUNCTION_23_22(0, 0xF000000000000000, *(uint64_t (**)(void))(v27 + 8));
}

uint64_t sub_210D399A4()
{
  uint64_t v0;

  OUTLINED_FUNCTION_28_29();
  if (!v0)
    swift_release();
  OUTLINED_FUNCTION_6();
  return OUTLINED_FUNCTION_24_1();
}

uint64_t sub_210D399E8()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_210D39A14()
{
  sub_210D399E8();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for PodcastsChapterController()
{
  return objc_opt_self();
}

uint64_t *sub_210D39A54(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v14 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    v8 = a2[3];
    a1[2] = a2[2];
    a1[3] = v8;
    v9 = a3[6];
    v10 = (char *)a1 + v9;
    v11 = (char *)a2 + v9;
    v12 = sub_210E91C60();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, v12))
    {
      sub_210C33834(0, &qword_253D7EF40, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
      memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v10, v11, v12);
      __swift_storeEnumTagSinglePayload((uint64_t)v10, 0, 1, v12);
    }
    v15 = a3[7];
    v16 = (char *)v4 + v15;
    v17 = (char *)a2 + v15;
    v18 = *((_QWORD *)v17 + 1);
    if (v18 >> 60 == 15)
    {
      *(_OWORD *)v16 = *(_OWORD *)v17;
    }
    else
    {
      v19 = *(_QWORD *)v17;
      sub_210CCC9EC(*(_QWORD *)v17, *((_QWORD *)v17 + 1));
      *(_QWORD *)v16 = v19;
      *((_QWORD *)v16 + 1) = v18;
    }
    v20 = a3[9];
    *(uint64_t *)((char *)v4 + a3[8]) = *(uint64_t *)((char *)a2 + a3[8]);
    *(uint64_t *)((char *)v4 + v20) = *(uint64_t *)((char *)a2 + v20);
  }
  return v4;
}

uint64_t sub_210D39BC0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t *v7;
  unint64_t v8;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 24);
  v5 = sub_210E91C60();
  result = __swift_getEnumTagSinglePayload(v4, 1, v5);
  if (!(_DWORD)result)
    result = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  v7 = (uint64_t *)(a1 + *(int *)(a2 + 28));
  v8 = v7[1];
  if (v8 >> 60 != 15)
    return sub_210C93F1C(*v7, v8);
  return result;
}

_QWORD *sub_210D39C60(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  v8 = a3[6];
  v9 = (char *)a1 + v8;
  v10 = (char *)a2 + v8;
  v11 = sub_210E91C60();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v11))
  {
    sub_210C33834(0, &qword_253D7EF40, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
    __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v11);
  }
  v13 = a3[7];
  v14 = (char *)a1 + v13;
  v15 = (char *)a2 + v13;
  v16 = *((_QWORD *)v15 + 1);
  if (v16 >> 60 == 15)
  {
    *(_OWORD *)v14 = *(_OWORD *)v15;
  }
  else
  {
    v17 = *(_QWORD *)v15;
    sub_210CCC9EC(*(_QWORD *)v15, *((_QWORD *)v15 + 1));
    *(_QWORD *)v14 = v17;
    *((_QWORD *)v14 + 1) = v16;
  }
  v18 = a3[9];
  *(_QWORD *)((char *)a1 + a3[8]) = *(_QWORD *)((char *)a2 + a3[8]);
  *(_QWORD *)((char *)a1 + v18) = *(_QWORD *)((char *)a2 + v18);
  return a1;
}

_QWORD *sub_210D39DA0(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  int EnumTagSinglePayload;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t *v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = a3[6];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_210E91C60();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v7, 1, v9);
  v11 = __swift_getEnumTagSinglePayload((uint64_t)v8, 1, v9);
  if (EnumTagSinglePayload)
  {
    if (!v11)
    {
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v7, v8, v9);
      __swift_storeEnumTagSinglePayload((uint64_t)v7, 0, 1, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  v12 = *(_QWORD *)(v9 - 8);
  if (v11)
  {
    (*(void (**)(char *, uint64_t))(v12 + 8))(v7, v9);
LABEL_6:
    sub_210C33834(0, &qword_253D7EF40, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v12 + 24))(v7, v8, v9);
LABEL_7:
  v14 = a3[7];
  v15 = (_QWORD *)((char *)a1 + v14);
  v16 = (_QWORD *)((char *)a2 + v14);
  v17 = *(_QWORD *)((char *)a2 + v14 + 8);
  if (*(_QWORD *)((char *)a1 + v14 + 8) >> 60 != 15)
  {
    if (v17 >> 60 != 15)
    {
      v19 = *v16;
      sub_210CCC9EC(v19, v17);
      v20 = *v15;
      v21 = v15[1];
      *v15 = v19;
      v15[1] = v17;
      sub_210C93F1C(v20, v21);
      goto LABEL_14;
    }
    sub_210D39F90((uint64_t)v15);
    goto LABEL_12;
  }
  if (v17 >> 60 == 15)
  {
LABEL_12:
    *(_OWORD *)v15 = *(_OWORD *)v16;
    goto LABEL_14;
  }
  v18 = *v16;
  sub_210CCC9EC(v18, v17);
  *v15 = v18;
  v15[1] = v17;
LABEL_14:
  *(_QWORD *)((char *)a1 + a3[8]) = *(_QWORD *)((char *)a2 + a3[8]);
  *(_QWORD *)((char *)a1 + a3[9]) = *(_QWORD *)((char *)a2 + a3[9]);
  return a1;
}

uint64_t sub_210D39F90(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x24BDCDDE8] - 8) + 8))();
  return a1;
}

_OWORD *sub_210D39FC4(_OWORD *a1, _OWORD *a2, int *a3)
{
  __int128 v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = a3[6];
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_210E91C60();
  if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v10))
  {
    sub_210C33834(0, &qword_253D7EF40, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
    __swift_storeEnumTagSinglePayload((uint64_t)v8, 0, 1, v10);
  }
  v12 = a3[8];
  *(_OWORD *)((char *)a1 + a3[7]) = *(_OWORD *)((char *)a2 + a3[7]);
  *(_QWORD *)((char *)a1 + v12) = *(_QWORD *)((char *)a2 + v12);
  *(_QWORD *)((char *)a1 + a3[9]) = *(_QWORD *)((char *)a2 + a3[9]);
  return a1;
}

_QWORD *sub_210D3A0B4(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  int EnumTagSinglePayload;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t *v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  v7 = a2[3];
  a1[2] = a2[2];
  a1[3] = v7;
  swift_bridgeObjectRelease();
  v8 = a3[6];
  v9 = (char *)a1 + v8;
  v10 = (char *)a2 + v8;
  v11 = sub_210E91C60();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v9, 1, v11);
  v13 = __swift_getEnumTagSinglePayload((uint64_t)v10, 1, v11);
  if (EnumTagSinglePayload)
  {
    if (!v13)
    {
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v9, v10, v11);
      __swift_storeEnumTagSinglePayload((uint64_t)v9, 0, 1, v11);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  v14 = *(_QWORD *)(v11 - 8);
  if (v13)
  {
    (*(void (**)(char *, uint64_t))(v14 + 8))(v9, v11);
LABEL_6:
    sub_210C33834(0, &qword_253D7EF40, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v14 + 40))(v9, v10, v11);
LABEL_7:
  v16 = a3[7];
  v17 = (_QWORD *)((char *)a1 + v16);
  v18 = (_QWORD *)((char *)a2 + v16);
  v19 = *(_QWORD *)((char *)a1 + v16 + 8);
  if (v19 >> 60 != 15)
  {
    v20 = v18[1];
    if (v20 >> 60 != 15)
    {
      v21 = *v17;
      *v17 = *v18;
      v17[1] = v20;
      sub_210C93F1C(v21, v19);
      goto LABEL_12;
    }
    sub_210D39F90((uint64_t)v17);
  }
  *(_OWORD *)v17 = *(_OWORD *)v18;
LABEL_12:
  v22 = a3[9];
  *(_QWORD *)((char *)a1 + a3[8]) = *(_QWORD *)((char *)a2 + a3[8]);
  *(_QWORD *)((char *)a1 + v22) = *(_QWORD *)((char *)a2 + v22);
  return a1;
}

uint64_t sub_210D3A250()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

void sub_210D3A25C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    OUTLINED_FUNCTION_1();
  }
  else
  {
    OUTLINED_FUNCTION_55_13(a1, &qword_253D7EF40, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    __swift_getEnumTagSinglePayload(a1 + *(int *)(a3 + 24), a2, v6);
  }
}

uint64_t sub_210D3A2DC()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_210D3A2E8(uint64_t result, uint64_t a2, int a3, uint64_t a4)
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
    OUTLINED_FUNCTION_55_13(result, &qword_253D7EF40, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    return OUTLINED_FUNCTION_19_25(v5 + *(int *)(a4 + 24), a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for PodcastChapter()
{
  uint64_t result;

  result = qword_254A81078;
  if (!qword_254A81078)
    return swift_getSingletonMetadata();
  return result;
}

void sub_210D3A398()
{
  unint64_t v0;

  sub_210C33834(319, &qword_253D7EF40, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

uint64_t sub_210D3A43C()
{
  swift_bridgeObjectRetain();
  sub_210E92C38();
  swift_bridgeObjectRelease();
  sub_210E92C38();
  OUTLINED_FUNCTION_38_22();
  OUTLINED_FUNCTION_74_12();
  sub_210E92C38();
  OUTLINED_FUNCTION_74_12();
  sub_210E92C38();
  return 0;
}

uint64_t sub_210D3A520(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  if (a1 < 0)
  {
    result = sub_210E9346C();
    __break(1u);
  }
  else
  {
    if (a1)
    {
      OUTLINED_FUNCTION_38_22();
      v2 = sub_210E92CF8();
      *(_QWORD *)(v2 + 16) = a1;
    }
    else
    {
      v2 = MEMORY[0x24BEE4AF8];
    }
    OUTLINED_FUNCTION_38_22();
    OUTLINED_FUNCTION_54_14();
    return v2;
  }
  return result;
}

void sub_210D3A5CC()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  char v3;
  char v4;
  char v5;
  uint64_t v6;
  _QWORD *v7;
  char *v8;
  uint64_t v9;
  char *v10;

  OUTLINED_FUNCTION_132();
  if ((v3 & 1) != 0)
  {
    OUTLINED_FUNCTION_29_2();
    if (v4 != v5)
    {
      OUTLINED_FUNCTION_60_2();
      if (v4)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_28_24();
    }
  }
  OUTLINED_FUNCTION_52_0();
  if (v2)
  {
    OUTLINED_FUNCTION_55_13(v6, &qword_253D7B2D8, (uint64_t (*)(uint64_t))type metadata accessor for CMTimeRange, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
    v7 = (_QWORD *)OUTLINED_FUNCTION_16_0();
    OUTLINED_FUNCTION_55_0(v7);
  }
  v8 = (char *)OUTLINED_FUNCTION_9_33();
  if ((v1 & 1) != 0)
  {
    sub_210D22794(v8, v9, v10);
    *(_QWORD *)(v0 + 16) = 0;
  }
  else
  {
    sub_210D22BBC(v8, v9, v10);
  }
  OUTLINED_FUNCTION_64();
  OUTLINED_FUNCTION_18_1();
}

void sub_210D3A674()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  char v3;
  char v4;
  char v5;
  const void *v6;
  size_t v7;
  char *v8;
  uint64_t v9;
  char *v10;

  OUTLINED_FUNCTION_132();
  if ((v3 & 1) != 0)
  {
    OUTLINED_FUNCTION_29_2();
    if (v4 != v5)
    {
      OUTLINED_FUNCTION_60_2();
      if (v4)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_28_24();
    }
  }
  OUTLINED_FUNCTION_52_0();
  if (v2)
  {
    sub_210D3C16C();
    v6 = (const void *)OUTLINED_FUNCTION_16_0();
    v7 = _swift_stdlib_malloc_size(v6);
    OUTLINED_FUNCTION_35_23((uint64_t)(v7 - 32) / 16);
  }
  v8 = (char *)OUTLINED_FUNCTION_9_33();
  if ((v1 & 1) != 0)
  {
    sub_210C344F0(v8, v9, v10);
    *(_QWORD *)(v0 + 16) = 0;
  }
  else
  {
    sub_210D22C54((uint64_t)v8, v9);
  }
  OUTLINED_FUNCTION_64();
  OUTLINED_FUNCTION_1();
}

void sub_210D3A714(char a1, uint64_t a2, char a3, uint64_t a4)
{
  sub_210D3A994(a1, a2, a3, a4, &qword_254A81140, (uint64_t (*)(uint64_t))MEMORY[0x24BE735B0], (void (*)(uint64_t, uint64_t, char *))sub_210D2287C, (void (*)(uint64_t, uint64_t, char *))sub_210D22D04);
}

void sub_210D3A738()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  char v3;
  char v4;
  char v5;
  uint64_t v6;
  _QWORD *v7;
  char *v8;
  uint64_t v9;
  char *v10;

  OUTLINED_FUNCTION_132();
  if ((v3 & 1) != 0)
  {
    OUTLINED_FUNCTION_29_2();
    if (v4 != v5)
    {
      OUTLINED_FUNCTION_60_2();
      if (v4)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_28_24();
    }
  }
  OUTLINED_FUNCTION_52_0();
  if (v2)
  {
    OUTLINED_FUNCTION_55_13(v6, &qword_254A81148, (uint64_t (*)(uint64_t))sub_210C72F8C, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
    v7 = (_QWORD *)OUTLINED_FUNCTION_16_0();
    OUTLINED_FUNCTION_55_0(v7);
  }
  v8 = (char *)OUTLINED_FUNCTION_9_33();
  if ((v1 & 1) != 0)
  {
    sub_210D229CC(v8, v9, v10);
    *(_QWORD *)(v0 + 16) = 0;
  }
  else
  {
    sub_210D22DBC((uint64_t)v8, v9);
  }
  OUTLINED_FUNCTION_64();
  OUTLINED_FUNCTION_18_1();
}

void sub_210D3A7E0(char a1, uint64_t a2, char a3, uint64_t a4)
{
  sub_210D3A994(a1, a2, a3, a4, (unint64_t *)&unk_254A80638, (uint64_t (*)(uint64_t))type metadata accessor for PodcastChapter, (void (*)(uint64_t, uint64_t, char *))sub_210D22A2C, (void (*)(uint64_t, uint64_t, char *))sub_210D22E5C);
}

void sub_210D3A804()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  char v3;
  char v4;
  char v5;
  uint64_t v6;
  const void *v7;
  size_t v8;
  char *v9;
  uint64_t v10;
  char *v11;

  OUTLINED_FUNCTION_132();
  if ((v3 & 1) != 0)
  {
    OUTLINED_FUNCTION_29_2();
    if (v4 != v5)
    {
      OUTLINED_FUNCTION_60_2();
      if (v4)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_28_24();
    }
  }
  OUTLINED_FUNCTION_52_0();
  if (v2)
  {
    OUTLINED_FUNCTION_80_11(v6, (unint64_t *)&qword_253D7F150, MEMORY[0x24BEE4AD8] + 8, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE3598]);
    v7 = (const void *)OUTLINED_FUNCTION_16_0();
    v8 = _swift_stdlib_malloc_size(v7);
    OUTLINED_FUNCTION_35_23((uint64_t)(v8 - 32) / 32);
  }
  v9 = (char *)OUTLINED_FUNCTION_9_33();
  if ((v1 & 1) != 0)
  {
    sub_210C34498(v9, v10, v11);
    *(_QWORD *)(v0 + 16) = 0;
  }
  else
  {
    sub_210D22E68((unint64_t)v9, v10, (unint64_t)v11);
  }
  OUTLINED_FUNCTION_64();
  OUTLINED_FUNCTION_1();
}

void sub_210D3A8BC()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  char v3;
  char v4;
  char v5;
  uint64_t v6;
  const void *v7;
  size_t v8;
  char *v9;
  uint64_t v10;
  char *v11;

  OUTLINED_FUNCTION_132();
  if ((v3 & 1) != 0)
  {
    OUTLINED_FUNCTION_29_2();
    if (v4 != v5)
    {
      OUTLINED_FUNCTION_60_2();
      if (v4)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_28_24();
    }
  }
  OUTLINED_FUNCTION_52_0();
  if (v2)
  {
    OUTLINED_FUNCTION_80_11(v6, &qword_253D7B2D0, MEMORY[0x24BEE13C8], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE3598]);
    v7 = (const void *)OUTLINED_FUNCTION_16_0();
    v8 = _swift_stdlib_malloc_size(v7);
    OUTLINED_FUNCTION_35_23((uint64_t)(v8 - 32) / 8);
  }
  v9 = (char *)OUTLINED_FUNCTION_9_33();
  if ((v1 & 1) != 0)
  {
    sub_210D2273C(v9, v10, v11);
    *(_QWORD *)(v0 + 16) = 0;
  }
  else
  {
    sub_210D22B28(v9, v10, v11);
  }
  OUTLINED_FUNCTION_64();
  OUTLINED_FUNCTION_1();
}

void sub_210D3A970(char a1, uint64_t a2, char a3, uint64_t a4)
{
  sub_210D3A994(a1, a2, a3, a4, &qword_254A81150, (uint64_t (*)(uint64_t))MEMORY[0x24BE73178], (void (*)(uint64_t, uint64_t, char *))sub_210D22ABC, (void (*)(uint64_t, uint64_t, char *))sub_210D22F04);
}

void sub_210D3A994(char a1, uint64_t a2, char a3, uint64_t a4, unint64_t *a5, uint64_t (*a6)(uint64_t), void (*a7)(uint64_t, uint64_t, char *), void (*a8)(uint64_t, uint64_t, char *))
{
  uint64_t v13;
  char v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  _QWORD *v21;
  size_t v22;
  uint64_t v24;
  char *v25;
  uint64_t v26;

  if ((a3 & 1) != 0)
  {
    OUTLINED_FUNCTION_29_2();
    if (v14 != v15)
    {
      OUTLINED_FUNCTION_60_2();
      if (v14)
      {
LABEL_24:
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_28_24();
    }
  }
  else
  {
    v13 = a2;
  }
  v16 = *(_QWORD *)(a4 + 16);
  if (v13 <= v16)
    v17 = *(_QWORD *)(a4 + 16);
  else
    v17 = v13;
  if (!v17)
  {
    v21 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_18;
  }
  sub_210C33834(0, a5, a6, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
  v18 = *(_QWORD *)(a6(0) - 8);
  v19 = *(_QWORD *)(v18 + 72);
  v20 = (*(unsigned __int8 *)(v18 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80);
  v21 = (_QWORD *)swift_allocObject();
  v22 = _swift_stdlib_malloc_size(v21);
  if (!v19)
  {
    __break(1u);
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  if (v22 - v20 == 0x8000000000000000 && v19 == -1)
    goto LABEL_23;
  v21[2] = v16;
  v21[3] = 2 * ((uint64_t)(v22 - v20) / v19);
LABEL_18:
  a6(0);
  OUTLINED_FUNCTION_54_14();
  v25 = (char *)v21 + v24;
  v26 = a4 + v24;
  if ((a1 & 1) != 0)
  {
    a7(v26, v16, v25);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    a8(v26, v16, v25);
  }
  OUTLINED_FUNCTION_64();
}

void sub_210D3AAD4()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  char v3;
  char v4;
  char v5;
  uint64_t v6;
  _QWORD *v7;
  char *v8;
  uint64_t v9;
  char *v10;

  OUTLINED_FUNCTION_132();
  if ((v3 & 1) != 0)
  {
    OUTLINED_FUNCTION_29_2();
    if (v4 != v5)
    {
      OUTLINED_FUNCTION_60_2();
      if (v4)
      {
        __break(1u);
        return;
      }
      OUTLINED_FUNCTION_28_24();
    }
  }
  OUTLINED_FUNCTION_52_0();
  if (v2)
  {
    OUTLINED_FUNCTION_55_13(v6, (unint64_t *)&qword_254A7F928, (uint64_t (*)(uint64_t))sub_210D30C90, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
    v7 = (_QWORD *)OUTLINED_FUNCTION_16_0();
    OUTLINED_FUNCTION_55_0(v7);
  }
  v8 = (char *)OUTLINED_FUNCTION_9_33();
  if ((v1 & 1) != 0)
  {
    sub_210D22AC8(v8, v9, v10);
    *(_QWORD *)(v0 + 16) = 0;
  }
  else
  {
    sub_210D22FB8((uint64_t)v8, v9);
  }
  OUTLINED_FUNCTION_64();
  OUTLINED_FUNCTION_18_1();
}

uint64_t sub_210D3AB7C()
{
  sub_210E91D68();
  sub_210C35144(&qword_254A81100, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8], MEMORY[0x24BDCEEE0]);
  return sub_210E92B78() & 1;
}

void sub_210D3ABF0(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6[2];

  v2 = *(_QWORD *)(type metadata accessor for PodcastChapter() - 8);
  v3 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
  {
    sub_210D3C0D8(v3);
    v3 = v4;
  }
  v5 = *(_QWORD *)(v3 + 16);
  v6[0] = v3 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  v6[1] = v5;
  sub_210D3AC70(v6);
  *a1 = v3;
}

void sub_210D3AC70(uint64_t *a1)
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
  unint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  double v34;
  double v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _BOOL4 v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
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
  double v66;
  double v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  unint64_t v71;
  unint64_t v72;
  char *v73;
  char *v74;
  unint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  char v79;
  char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  BOOL v86;
  unint64_t v87;
  char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  char *v93;
  uint64_t v94;
  uint64_t v95;
  BOOL v96;
  uint64_t v97;
  char v98;
  char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  BOOL v103;
  uint64_t v104;
  uint64_t v105;
  char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  unint64_t v114;
  uint64_t v115;
  char *v116;
  char *v117;
  char *v118;
  uint64_t v119;
  char *v120;
  char *v121;
  uint64_t v122;
  uint64_t v123;
  unint64_t v124;
  uint64_t v125;
  unint64_t v126;
  char *v127;
  uint64_t v128;
  uint64_t v129;
  char *v130;
  unint64_t v131;
  uint64_t v132;
  uint64_t v133;
  char *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  unint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t *v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;

  v2 = v1;
  v146 = type metadata accessor for PodcastChapter();
  v140 = *(_QWORD *)(v146 - 8);
  v6 = MEMORY[0x24BDAC7A8](v146, v4, v5);
  v137 = (uint64_t)&v132 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v6, v8, v9);
  v147 = (uint64_t)&v132 - v11;
  v14 = MEMORY[0x24BDAC7A8](v10, v12, v13);
  v144 = (uint64_t)&v132 - v15;
  MEMORY[0x24BDAC7A8](v14, v16, v17);
  v143 = (uint64_t)&v132 - v18;
  v19 = a1[1];
  v20 = sub_210E934F0();
  if (v20 >= v19)
  {
    if ((v19 & 0x8000000000000000) == 0)
    {
      if (v19)
        sub_210D3B580(0, v19, 1, a1);
      return;
    }
    goto LABEL_140;
  }
  v21 = v20;
  v145 = a1;
  v133 = sub_210D3A520(v19 / 2);
  v139 = v22;
  if (v19 <= 0)
  {
LABEL_104:
    v24 = (char *)MEMORY[0x24BEE4AF8];
    v72 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
LABEL_105:
    if (v72 < 2)
    {
LABEL_116:
      swift_bridgeObjectRelease();
      if (v19 >= -1)
        goto LABEL_117;
      goto LABEL_144;
    }
    v125 = *v145;
    while (1)
    {
      v126 = v72 - 2;
      if (v72 < 2)
        break;
      if (!v125)
        goto LABEL_148;
      v127 = v24;
      v128 = *(_QWORD *)&v24[16 * v126 + 32];
      v129 = *(_QWORD *)&v24[16 * v72 + 24];
      sub_210D3B780(v125 + *(_QWORD *)(v140 + 72) * v128, v125 + *(_QWORD *)(v140 + 72) * *(_QWORD *)&v24[16 * v72 + 16], v125 + *(_QWORD *)(v140 + 72) * v129, v139);
      if (v2)
        goto LABEL_102;
      if (v129 < v128)
        goto LABEL_135;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v127 = sub_210D3BC78((uint64_t)v24);
      if (v126 >= *((_QWORD *)v127 + 2))
        goto LABEL_136;
      v130 = &v127[16 * v126 + 32];
      *(_QWORD *)v130 = v128;
      *((_QWORD *)v130 + 1) = v129;
      v131 = *((_QWORD *)v127 + 2);
      if (v72 > v131)
        goto LABEL_137;
      memmove(&v127[16 * v72 + 16], &v127[16 * v72 + 32], 16 * (v131 - v72));
      *((_QWORD *)v127 + 2) = v131 - 1;
      v72 = v131 - 1;
      v24 = v127;
      if (v131 <= 2)
        goto LABEL_116;
    }
LABEL_134:
    __break(1u);
LABEL_135:
    __break(1u);
LABEL_136:
    __break(1u);
LABEL_137:
    __break(1u);
LABEL_138:
    __break(1u);
LABEL_139:
    __break(1u);
LABEL_140:
    __break(1u);
LABEL_141:
    __break(1u);
LABEL_142:
    __break(1u);
LABEL_143:
    __break(1u);
LABEL_144:
    __break(1u);
LABEL_145:
    __break(1u);
LABEL_146:
    __break(1u);
LABEL_147:
    __break(1u);
LABEL_148:
    __break(1u);
    return;
  }
  v132 = v21;
  v23 = 0;
  v24 = (char *)MEMORY[0x24BEE4AF8];
  v25 = v19;
  v135 = v19;
  while (1)
  {
    v26 = v23;
    v27 = v23 + 1;
    if (v23 + 1 >= v25)
    {
      ++v23;
      v28 = v145;
    }
    else
    {
      v141 = v2;
      v28 = v145;
      v29 = *v145;
      v30 = *(_QWORD *)(v140 + 72);
      v31 = v143;
      sub_210CCC3C8(*v145 + v30 * v27, v143);
      v32 = v144;
      sub_210CCC3C8(v29 + v30 * v23, v144);
      v33 = *(int *)(v146 + 36);
      v34 = *(double *)(v31 + v33);
      v35 = *(double *)(v32 + v33);
      sub_210D3BFD4(v32);
      v36 = v31;
      v26 = v23;
      sub_210D3BFD4(v36);
      v23 += 2;
      v136 = v29;
      v148 = v30;
      if (v23 >= v25)
      {
        v2 = v141;
      }
      else
      {
        v138 = v26;
        v134 = v24;
        v142 = v30 * v27;
        v37 = v29;
        v38 = v23;
        v39 = v30 * v23;
        while (1)
        {
          v40 = v25;
          v41 = v143;
          sub_210CCC3C8(v37 + v39, v143);
          v42 = v144;
          sub_210CCC3C8(v37 + v142, v144);
          v43 = *(double *)(v41 + *(int *)(v146 + 36)) >= *(double *)(v42 + *(int *)(v146 + 36));
          sub_210D3BFD4(v42);
          sub_210D3BFD4(v41);
          if (v34 < v35 == v43)
            break;
          v37 += v148;
          ++v38;
          v25 = v40;
          if (v38 >= v40)
          {
            v23 = v40;
            v24 = v134;
            v2 = v141;
            v26 = v138;
            goto LABEL_13;
          }
        }
        v24 = v134;
        v23 = v38;
        v2 = v141;
        v26 = v138;
        v25 = v40;
      }
LABEL_13:
      if (v34 < v35)
      {
        if (v23 < v26)
          goto LABEL_141;
        if (v26 < v23)
        {
          v141 = v2;
          v142 = v25;
          v134 = v24;
          v44 = 0;
          v45 = v148;
          v46 = v148 * (v23 - 1);
          v47 = v26;
          v48 = v23 * v148;
          v49 = v47;
          v138 = v47;
          v50 = v47 * v148;
          do
          {
            if (v49 != v23 + v44 - 1)
            {
              v51 = v136;
              if (!v136)
                goto LABEL_147;
              v52 = v136 + v50;
              v53 = v136 + v46;
              sub_210CCC124(v136 + v50, v137);
              if (v50 < v46 || v52 >= v51 + v48)
              {
                swift_arrayInitWithTakeFrontToBack();
                v45 = v148;
              }
              else
              {
                v45 = v148;
                if (v50 != v46)
                  swift_arrayInitWithTakeBackToFront();
              }
              sub_210CCC124(v137, v53);
              v28 = v145;
            }
            ++v49;
            --v44;
            v46 -= v45;
            v48 -= v45;
            v50 += v45;
          }
          while (v49 < v23 + v44);
          v2 = v141;
          v25 = v142;
          v24 = v134;
          v26 = v138;
        }
      }
    }
    if (v23 < v25)
    {
      if (__OFSUB__(v23, v26))
        goto LABEL_139;
      if (v23 - v26 < v132)
      {
        if (__OFADD__(v26, v132))
          goto LABEL_142;
        if (v26 + v132 >= v25)
          v55 = v25;
        else
          v55 = v26 + v132;
        if (v55 < v26)
          goto LABEL_143;
        if (v23 != v55)
        {
          v138 = v26;
          v134 = v24;
          v56 = *(_QWORD *)(v140 + 72);
          v148 = v56 * (v23 - 1);
          v141 = v2;
          v142 = v56;
          v57 = v23 * v56;
          v136 = v55;
          do
          {
            v58 = 0;
            v59 = v138;
            while (1)
            {
              v60 = v23;
              v61 = *v28;
              v62 = v143;
              sub_210CCC3C8(v57 + v58 + *v28, v143);
              v63 = v148 + v58 + v61;
              v64 = v144;
              sub_210CCC3C8(v63, v144);
              v65 = *(int *)(v146 + 36);
              v66 = *(double *)(v62 + v65);
              v67 = *(double *)(v64 + v65);
              sub_210D3BFD4(v64);
              sub_210D3BFD4(v62);
              if (v66 >= v67)
                break;
              v68 = *v28;
              if (!*v28)
                goto LABEL_145;
              v69 = v68 + v148 + v58;
              sub_210CCC124(v68 + v57 + v58, v147);
              swift_arrayInitWithTakeFrontToBack();
              sub_210CCC124(v147, v69);
              v58 -= v142;
              ++v59;
              v23 = v60;
              v28 = v145;
              if (v60 == v59)
                goto LABEL_46;
            }
            v23 = v60;
LABEL_46:
            ++v23;
            v148 += v142;
            v57 += v142;
          }
          while (v23 != v136);
          v23 = v136;
          v2 = v141;
          v24 = v134;
          v26 = v138;
        }
      }
    }
    if (v23 < v26)
      goto LABEL_138;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v24 = sub_210D3BB70(0, *((_QWORD *)v24 + 2) + 1, 1, v24);
    v71 = *((_QWORD *)v24 + 2);
    v70 = *((_QWORD *)v24 + 3);
    v72 = v71 + 1;
    if (v71 >= v70 >> 1)
      v24 = sub_210D3BB70((char *)(v70 > 1), v71 + 1, 1, v24);
    v141 = v2;
    *((_QWORD *)v24 + 2) = v72;
    v73 = v24 + 32;
    v74 = &v24[16 * v71 + 32];
    *(_QWORD *)v74 = v26;
    *((_QWORD *)v74 + 1) = v23;
    if (v71)
      break;
    v72 = 1;
LABEL_96:
    v25 = v145[1];
    v19 = v135;
    v2 = v141;
    if (v23 >= v25)
      goto LABEL_105;
  }
  while (1)
  {
    v75 = v72 - 1;
    if (v72 >= 4)
    {
      v80 = &v73[16 * v72];
      v81 = *((_QWORD *)v80 - 8);
      v82 = *((_QWORD *)v80 - 7);
      v86 = __OFSUB__(v82, v81);
      v83 = v82 - v81;
      if (v86)
        goto LABEL_123;
      v85 = *((_QWORD *)v80 - 6);
      v84 = *((_QWORD *)v80 - 5);
      v86 = __OFSUB__(v84, v85);
      v78 = v84 - v85;
      v79 = v86;
      if (v86)
        goto LABEL_124;
      v87 = v72 - 2;
      v88 = &v73[16 * v72 - 32];
      v90 = *(_QWORD *)v88;
      v89 = *((_QWORD *)v88 + 1);
      v86 = __OFSUB__(v89, v90);
      v91 = v89 - v90;
      if (v86)
        goto LABEL_125;
      v86 = __OFADD__(v78, v91);
      v92 = v78 + v91;
      if (v86)
        goto LABEL_127;
      if (v92 >= v83)
      {
        v110 = &v73[16 * v75];
        v112 = *(_QWORD *)v110;
        v111 = *((_QWORD *)v110 + 1);
        v86 = __OFSUB__(v111, v112);
        v113 = v111 - v112;
        if (v86)
          goto LABEL_133;
        v103 = v78 < v113;
        goto LABEL_85;
      }
    }
    else
    {
      if (v72 != 3)
      {
        v104 = *((_QWORD *)v24 + 4);
        v105 = *((_QWORD *)v24 + 5);
        v86 = __OFSUB__(v105, v104);
        v97 = v105 - v104;
        v98 = v86;
        goto LABEL_79;
      }
      v77 = *((_QWORD *)v24 + 4);
      v76 = *((_QWORD *)v24 + 5);
      v86 = __OFSUB__(v76, v77);
      v78 = v76 - v77;
      v79 = v86;
    }
    if ((v79 & 1) != 0)
      goto LABEL_126;
    v87 = v72 - 2;
    v93 = &v73[16 * v72 - 32];
    v95 = *(_QWORD *)v93;
    v94 = *((_QWORD *)v93 + 1);
    v96 = __OFSUB__(v94, v95);
    v97 = v94 - v95;
    v98 = v96;
    if (v96)
      goto LABEL_128;
    v99 = &v73[16 * v75];
    v101 = *(_QWORD *)v99;
    v100 = *((_QWORD *)v99 + 1);
    v86 = __OFSUB__(v100, v101);
    v102 = v100 - v101;
    if (v86)
      goto LABEL_130;
    if (__OFADD__(v97, v102))
      goto LABEL_132;
    if (v97 + v102 >= v78)
    {
      v103 = v78 < v102;
LABEL_85:
      if (v103)
        v75 = v87;
      goto LABEL_87;
    }
LABEL_79:
    if ((v98 & 1) != 0)
      goto LABEL_129;
    v106 = &v73[16 * v75];
    v108 = *(_QWORD *)v106;
    v107 = *((_QWORD *)v106 + 1);
    v86 = __OFSUB__(v107, v108);
    v109 = v107 - v108;
    if (v86)
      goto LABEL_131;
    if (v109 < v97)
      goto LABEL_96;
LABEL_87:
    v114 = v75 - 1;
    if (v75 - 1 >= v72)
    {
      __break(1u);
LABEL_120:
      __break(1u);
LABEL_121:
      __break(1u);
LABEL_122:
      __break(1u);
LABEL_123:
      __break(1u);
LABEL_124:
      __break(1u);
LABEL_125:
      __break(1u);
LABEL_126:
      __break(1u);
LABEL_127:
      __break(1u);
LABEL_128:
      __break(1u);
LABEL_129:
      __break(1u);
LABEL_130:
      __break(1u);
LABEL_131:
      __break(1u);
LABEL_132:
      __break(1u);
LABEL_133:
      __break(1u);
      goto LABEL_134;
    }
    if (!*v145)
      goto LABEL_146;
    v115 = v23;
    v116 = v24;
    v117 = &v73[16 * v114];
    v118 = v73;
    v119 = *(_QWORD *)v117;
    v120 = v118;
    v121 = &v118[16 * v75];
    v122 = *((_QWORD *)v121 + 1);
    v123 = v141;
    sub_210D3B780(*v145 + *(_QWORD *)(v140 + 72) * *(_QWORD *)v117, *v145 + *(_QWORD *)(v140 + 72) * *(_QWORD *)v121, *v145 + *(_QWORD *)(v140 + 72) * v122, v139);
    v141 = v123;
    if (v123)
      break;
    if (v122 < v119)
      goto LABEL_120;
    if (v75 > *((_QWORD *)v116 + 2))
      goto LABEL_121;
    *(_QWORD *)v117 = v119;
    *(_QWORD *)&v120[16 * v114 + 8] = v122;
    v124 = *((_QWORD *)v116 + 2);
    if (v75 >= v124)
      goto LABEL_122;
    v73 = v120;
    v24 = v116;
    v72 = v124 - 1;
    memmove(v121, v121 + 16, 16 * (v124 - 1 - v75));
    *((_QWORD *)v116 + 2) = v124 - 1;
    v23 = v115;
    if (v124 <= 2)
      goto LABEL_96;
  }
  v19 = v135;
  v2 = v141;
LABEL_102:
  swift_bridgeObjectRelease();
  if (v19 < -1)
  {
    __break(1u);
    goto LABEL_104;
  }
LABEL_117:
  *(_QWORD *)(v133 + 16) = 0;
  swift_bridgeObjectRelease();
}

uint64_t sub_210D3B580(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
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
  uint64_t result;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  double v28;
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

  v33 = a1;
  v36 = type metadata accessor for PodcastChapter();
  v9 = MEMORY[0x24BDAC7A8](v36, v7, v8);
  v37 = (uint64_t)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v9, v11, v12);
  v15 = (char *)&v31 - v14;
  result = MEMORY[0x24BDAC7A8](v13, v16, v17);
  v21 = (char *)&v31 - v20;
  v35 = a3;
  v32 = a2;
  if (a3 != a2)
  {
    v22 = *(_QWORD *)(v19 + 72);
    v39 = v22 * (v35 - 1);
    v34 = v22;
    v38 = v22 * v35;
    while (2)
    {
      v23 = 0;
      v24 = v33;
      do
      {
        v25 = *a4;
        sub_210CCC3C8(v38 + v23 + *a4, (uint64_t)v21);
        sub_210CCC3C8(v39 + v23 + v25, (uint64_t)v15);
        v26 = *(int *)(v36 + 36);
        v27 = *(double *)&v21[v26];
        v28 = *(double *)&v15[v26];
        sub_210D3BFD4((uint64_t)v15);
        result = sub_210D3BFD4((uint64_t)v21);
        if (v27 >= v28)
          break;
        v29 = *a4;
        if (!*a4)
        {
          __break(1u);
          return result;
        }
        v30 = v29 + v39 + v23;
        sub_210CCC124(v29 + v38 + v23, v37);
        swift_arrayInitWithTakeFrontToBack();
        result = sub_210CCC124(v37, v30);
        v23 -= v34;
        ++v24;
      }
      while (v35 != v24);
      v39 += v34;
      v38 += v34;
      if (++v35 != v32)
        continue;
      break;
    }
  }
  return result;
}

void sub_210D3B780(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
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
  int64_t v18;
  int64_t v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  BOOL v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  double v34;
  double v35;
  unint64_t v36;
  BOOL v39;
  BOOL v40;
  unint64_t v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  double v51;
  double v52;
  uint64_t v53;
  int64_t v57;
  uint64_t v59;
  unint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  unint64_t v64;
  uint64_t v65;

  v60 = a3;
  v65 = type metadata accessor for PodcastChapter();
  v9 = MEMORY[0x24BDAC7A8](v65, v7, v8);
  v11 = (char *)&v59 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9, v12, v13);
  v15 = (char *)&v59 - v14;
  v17 = *(_QWORD *)(v16 + 72);
  if (!v17)
  {
    __break(1u);
LABEL_76:
    __break(1u);
LABEL_77:
    __break(1u);
    goto LABEL_78;
  }
  v18 = a2 - a1;
  if (a2 - a1 == 0x8000000000000000 && v17 == -1)
    goto LABEL_76;
  v20 = v60 - a2;
  if (v60 - a2 == 0x8000000000000000 && v17 == -1)
    goto LABEL_77;
  v64 = a4;
  v22 = v18 / v17;
  v23 = v17;
  v24 = v20 / v17;
  if (v18 / v17 >= v20 / v17)
  {
    v27 = v64;
    sub_210D22A2C(a2, v20 / v17, v64);
    v28 = v27 + v24 * v23;
    v40 = v24 * v23 < 1 || a1 >= a2;
    v31 = v23;
    if (v40)
      goto LABEL_70;
    v62 = -v23;
    v63 = v11;
    v41 = v60;
    v61 = v23;
    while (1)
    {
      v42 = v62;
      v43 = v41 + v62;
      v44 = v28 + v62;
      v45 = v28;
      sub_210CCC3C8(v28 + v62, (uint64_t)v15);
      v46 = a2 + v42;
      v47 = a2 + v42;
      v48 = (uint64_t)v15;
      v49 = (uint64_t)v63;
      sub_210CCC3C8(v47, (uint64_t)v63);
      v50 = *(int *)(v65 + 36);
      v51 = *(double *)(v48 + v50);
      v52 = *(double *)(v49 + v50);
      v53 = v49;
      v15 = (char *)v48;
      sub_210D3BFD4(v53);
      sub_210D3BFD4(v48);
      if (v51 < v52)
        break;
      if (v41 < v45 || v43 >= v45)
      {
        swift_arrayInitWithTakeFrontToBack();
        v28 = v44;
        v27 = v64;
LABEL_65:
        v31 = v61;
        v41 = v43;
        goto LABEL_66;
      }
      v27 = v64;
      if (v41 == v45)
      {
        v28 = v44;
        goto LABEL_65;
      }
      v41 = v43;
      swift_arrayInitWithTakeBackToFront();
      v28 = v44;
      v31 = v61;
LABEL_66:
      if (v28 <= v27 || a2 <= a1)
        goto LABEL_70;
    }
    v60 = v45;
    if (v41 < a2 || v43 >= a2)
    {
      swift_arrayInitWithTakeFrontToBack();
      a2 = v46;
      v27 = v64;
      v31 = v61;
    }
    else
    {
      v31 = v61;
      if (v41 != a2)
      {
        v41 = v43;
        swift_arrayInitWithTakeBackToFront();
        a2 = v46;
        v27 = v64;
LABEL_63:
        v28 = v60;
        goto LABEL_66;
      }
      a2 = v46;
      v27 = v64;
    }
    v41 = v43;
    goto LABEL_63;
  }
  v25 = v64;
  sub_210D22A2C(a1, v18 / v17, v64);
  v26 = v22 * v23;
  v27 = v25;
  v28 = v25 + v26;
  v29 = v60;
  v30 = v26 < 1 || a2 >= v60;
  v31 = v23;
  if (!v30)
  {
    do
    {
      v32 = v28;
      sub_210CCC3C8(a2, (uint64_t)v15);
      sub_210CCC3C8(v27, (uint64_t)v11);
      v33 = *(int *)(v65 + 36);
      v34 = *(double *)&v15[v33];
      v35 = *(double *)&v11[v33];
      sub_210D3BFD4((uint64_t)v11);
      sub_210D3BFD4((uint64_t)v15);
      if (v34 >= v35)
      {
        if (a1 < v27 || a1 >= v27 + v31)
        {
          swift_arrayInitWithTakeFrontToBack();
        }
        else if (a1 != v27)
        {
          swift_arrayInitWithTakeBackToFront();
        }
        v36 = a2;
        v27 += v31;
        v29 = v60;
      }
      else
      {
        v36 = a2 + v31;
        if (a1 < a2 || a1 >= v36)
        {
          swift_arrayInitWithTakeFrontToBack();
        }
        else if (a1 != a2)
        {
          swift_arrayInitWithTakeBackToFront();
        }
      }
      v28 = v32;
      a1 += v31;
      v39 = v27 >= v32 || v36 >= v29;
      a2 = v36;
    }
    while (!v39);
  }
  a2 = a1;
LABEL_70:
  v57 = v28 - v27;
  if (v31 != -1 || v57 != 0x8000000000000000)
  {
    sub_210D22A2C(v27, v57 / v31, a2);
    return;
  }
LABEL_78:
  __break(1u);
}

char *sub_210D3BB70(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
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
    sub_210C33834(0, &qword_254A81130, (uint64_t (*)(uint64_t))sub_210D3C11C, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE3598]);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || &v13[16 * v8] <= v12)
      memmove(v12, v13, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_210D3BC78(uint64_t a1)
{
  return sub_210D3BB70(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

void sub_210D3BC8C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v0 = sub_210E92BA8();
  v2 = v1;
  if (v0 != sub_210E92BA8() || v2 != v3)
    OUTLINED_FUNCTION_95();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_1();
}

void sub_210D3BCFC()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_254A810D8)
  {
    sub_210C34D54(255, &qword_254A810C0);
    sub_210C33834(255, &qword_254A810E0, (uint64_t (*)(uint64_t))sub_210D3BD88, (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
    v0 = sub_210E91E64();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_254A810D8);
  }
}

void sub_210D3BD88()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_254A810E8)
  {
    type metadata accessor for AVMetadataExtraAttributeKey(255);
    sub_210C35144(&qword_254A7D590, (uint64_t (*)(uint64_t))type metadata accessor for AVMetadataExtraAttributeKey, (uint64_t)&unk_210ED2390);
    v0 = sub_210E92B48();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_254A810E8);
  }
}

void sub_210D3BE0C(uint64_t a1, unint64_t *a2, unint64_t *a3, uint64_t a4)
{
  unint64_t v7;
  uint64_t v8;

  if (!*a2)
  {
    sub_210C34D54(255, &qword_254A810C0);
    sub_210BE0BF0(255, a3, a4, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE1C68]);
    v7 = sub_210E91E64();
    if (!v8)
      atomic_store(v7, a2);
  }
}

uint64_t sub_210D3BEA0()
{
  return sub_210D3AB7C() & 1;
}

void sub_210D3BEBC()
{
  unint64_t TupleTypeMetadata2;
  uint64_t v1;

  if (!qword_254A81108)
  {
    type metadata accessor for PodcastChapter();
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1)
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_254A81108);
  }
}

uint64_t sub_210D3BF20(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_210C33834(0, &qword_253D7EF40, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1C68]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_210D3BF7C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_210CCC9EC(a1, a2);
  return a1;
}

uint64_t sub_210D3BF90(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for PodcastChapter();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_210D3BFD4(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for PodcastChapter();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_210D3C010()
{
  unint64_t result;

  result = qword_254A81110;
  if (!qword_254A81110)
  {
    result = MEMORY[0x212BD2E20](&unk_210ED8A58, &type metadata for PodcastsChapterController.Error);
    atomic_store(result, (unint64_t *)&qword_254A81110);
  }
  return result;
}

void sub_210D3C04C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_254A81118)
  {
    sub_210C34D54(255, (unint64_t *)&qword_254A7FCB0);
    sub_210C33834(255, &qword_254A81120, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEEA8], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BEE1250]);
    v0 = sub_210E91E64();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_254A81118);
  }
}

void sub_210D3C0D8(uint64_t a1)
{
  sub_210D3A994(0, *(_QWORD *)(a1 + 16), 0, a1, (unint64_t *)&unk_254A80638, (uint64_t (*)(uint64_t))type metadata accessor for PodcastChapter, (void (*)(uint64_t, uint64_t, char *))sub_210D22A2C, (void (*)(uint64_t, uint64_t, char *))sub_210D22E5C);
}

void sub_210D3C11C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_254A81138)
  {
    v0 = sub_210E92EF0();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_254A81138);
  }
}

void sub_210D3C16C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_253D7B2B8)
  {
    sub_210BE0BF0(255, (unint64_t *)&unk_253D7B1A0, MEMORY[0x24BEE0D00], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE1C68]);
    v0 = sub_210E93508();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_253D7B2B8);
  }
}

uint64_t getEnumTagSinglePayload for PodcastsChapterController.Error(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for PodcastsChapterController.Error(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_210D3C26C + 4 * byte_210ED8930[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_210D3C28C + 4 * byte_210ED8935[v4]))();
}

_BYTE *sub_210D3C26C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_210D3C28C(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_210D3C294(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_210D3C29C(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_210D3C2A4(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_210D3C2AC(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for PodcastsChapterController.Error()
{
  return &type metadata for PodcastsChapterController.Error;
}

unint64_t sub_210D3C2CC()
{
  unint64_t result;

  result = qword_254A81158;
  if (!qword_254A81158)
  {
    result = MEMORY[0x212BD2E20](&unk_210ED8A30, &type metadata for PodcastsChapterController.Error);
    atomic_store(result, (unint64_t *)&qword_254A81158);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_47_21()
{
  return sub_210E92BA8();
}

uint64_t OUTLINED_FUNCTION_59_17(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  *(_QWORD *)(a11 + 40) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_65_12()
{
  uint64_t v0;

  return sub_210D30920(v0);
}

uint64_t OUTLINED_FUNCTION_69_13()
{
  uint64_t v0;
  unint64_t v1;

  return sub_210D3BF7C(v0, v1);
}

uint64_t OUTLINED_FUNCTION_72_14()
{
  return sub_210E91C60();
}

uint64_t OUTLINED_FUNCTION_74_12()
{
  return sub_210E92E54();
}

uint64_t OUTLINED_FUNCTION_75_11(char a1, uint64_t a2)
{
  uint64_t v2;

  return sub_210D21A64(a1, a2, 1, v2);
}

void OUTLINED_FUNCTION_81_8(uint64_t a1, unint64_t *a2, unint64_t *a3, uint64_t a4)
{
  sub_210D3BE0C(0, a2, a3, a4);
}

void sub_210D3C570(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_210D3C5FC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_210D3C9C4(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_210D3CB38(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_210D3CC3C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void _MPCAudioTapInit(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  *a3 = a2;
}

void _MPCAudioTapFinalize(const opaqueMTAudioProcessingTap *a1)
{
  id v1;

  MTAudioProcessingTapGetStorage(a1);
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setSelfRef:", 0);

}

void _MPCAudioTapPrepareCallback(const opaqueMTAudioProcessingTap *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v7;

  MTAudioProcessingTapGetStorage(a1);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_prepareTap:maxFrames:processingFormat:", a1, a3, a4);

}

void _MPCAudioTapProcess(const opaqueMTAudioProcessingTap *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v7;

  MTAudioProcessingTapGetStorage(a1);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_analyzeSamples:numberFrames:", a5, a3);

}

void sub_210D3D7BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t _MPCProtoItemReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  unint64_t v17;
  char v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  char v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  _MPCProtoItemIdentifierSet *v30;
  uint64_t result;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        v24 = 0;
        v25 = 0;
        v26 = 0;
        *(_BYTE *)(a1 + 24) |= 2u;
        while (1)
        {
          v27 = *v3;
          v28 = *(_QWORD *)(a2 + v27);
          if (v28 == -1 || v28 >= *(_QWORD *)(a2 + *v4))
            break;
          v29 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v28);
          *(_QWORD *)(a2 + v27) = v28 + 1;
          v26 |= (unint64_t)(v29 & 0x7F) << v24;
          if ((v29 & 0x80) == 0)
            goto LABEL_45;
          v24 += 7;
          v14 = v25++ >= 9;
          if (v14)
          {
            v26 = 0;
            goto LABEL_47;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_45:
        if (*(_BYTE *)(a2 + *v5))
          v26 = 0;
LABEL_47:
        *(_BYTE *)(a1 + 20) = v26 != 0;
      }
      else if ((_DWORD)v17 == 2)
      {
        v30 = objc_alloc_init(_MPCProtoItemIdentifierSet);
        objc_storeStrong((id *)(a1 + 8), v30);
        if (!PBReaderPlaceMark() || (_MPCProtoItemIdentifierSetReadFrom((uint64_t)v30, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();

      }
      else if ((_DWORD)v17 == 1)
      {
        v18 = 0;
        v19 = 0;
        v20 = 0;
        *(_BYTE *)(a1 + 24) |= 1u;
        while (1)
        {
          v21 = *v3;
          v22 = *(_QWORD *)(a2 + v21);
          if (v22 == -1 || v22 >= *(_QWORD *)(a2 + *v4))
            break;
          v23 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v22);
          *(_QWORD *)(a2 + v21) = v22 + 1;
          v20 |= (unint64_t)(v23 & 0x7F) << v18;
          if ((v23 & 0x80) == 0)
            goto LABEL_41;
          v18 += 7;
          v14 = v19++ >= 9;
          if (v14)
          {
            LODWORD(v20) = 0;
            goto LABEL_43;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_41:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v20) = 0;
LABEL_43:
        *(_DWORD *)(a1 + 16) = v20;
      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_210D40B98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_210D40CF8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_210D41C3C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_210D4D99C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t MPCMediaLibraryForUniqueID(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x24BDDC7F0], "mediaLibraryWithUniqueIdentifier:", a1);
}

void sub_210D4E5A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose((const void *)(v13 - 176), 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_210D4ED10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_210D500C8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Unwind_Resume(a1);
}

void sub_210D51D5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  uint64_t v32;

  _Block_object_dispose(&a32, 8);
  _Block_object_dispose((const void *)(v32 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_210D521EC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__639(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__640(uint64_t a1)
{

}

void sub_210D58CAC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose(&STACK[0x7F0], 8);
  _Block_object_dispose(&STACK[0x830], 8);
  _Block_object_dispose((const void *)(v1 - 240), 8);
  _Block_object_dispose(&STACK[0x530], 8);
  _Block_object_dispose(&STACK[0x560], 8);
  _Block_object_dispose(&STACK[0x580], 8);
  _Block_object_dispose(&STACK[0x5F0], 8);
  _Block_object_dispose(&STACK[0x6A8], 8);
  _Unwind_Resume(a1);
}

void sub_210D5A8A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_210D5AD74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location)
{
  id *v9;
  id *v10;
  uint64_t v11;

  objc_destroyWeak(v9);
  objc_destroyWeak(v10);
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v11 - 168));
  _Unwind_Resume(a1);
}

void sub_210D5B074(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

void sub_210D5CB30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_210D5E414(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,id location,char a31)
{
  uint64_t v31;

  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_210D5FD24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  uint64_t v29;

  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 192), 8);
  _Block_object_dispose((const void *)(v29 - 144), 8);
  _Block_object_dispose((const void *)(v29 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_210D5FF40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  uint64_t v27;

  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 144), 8);
  _Block_object_dispose((const void *)(v27 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_210D60D88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_210D60DFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_210D61394(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__755(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__756(uint64_t a1)
{

}

void sub_210D634C0(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_210D652E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id location)
{
  id *v27;

  objc_destroyWeak(v27);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_210D66C14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_210D68C84(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

BOOL _MPCProtoTracklistIndexPathReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  BOOL v23;
  int *v24;
  char v25;
  unsigned int v26;
  uint64_t v27;
  unint64_t v28;
  char v29;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    while (1)
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      if ((v10 >> 3) == 2)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = 0;
        v18 = 0;
        v19 = 0;
        *(_BYTE *)(a1 + 24) |= 1u;
        while (1)
        {
          v20 = *v3;
          v21 = *(_QWORD *)(a2 + v20);
          if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
          {
            v24 = &OBJC_IVAR____MPCProtoTracklistIndexPath__containerIndex;
            goto LABEL_38;
          }
          v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
          *(_QWORD *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0)
            break;
          v17 += 7;
          v23 = v18++ > 8;
          if (v23)
          {
            v19 = 0;
            v24 = &OBJC_IVAR____MPCProtoTracklistIndexPath__containerIndex;
            goto LABEL_41;
          }
        }
        v24 = &OBJC_IVAR____MPCProtoTracklistIndexPath__containerIndex;
LABEL_39:
        if (*(_BYTE *)(a2 + *v5))
          v19 = 0;
LABEL_41:
        *(_QWORD *)(a1 + *v24) = v19;
        goto LABEL_42;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0)
        return 0;
LABEL_42:
      if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
        return *(_BYTE *)(a2 + *v5) == 0;
    }
    v25 = 0;
    v26 = 0;
    v19 = 0;
    *(_BYTE *)(a1 + 24) |= 2u;
    while (1)
    {
      v27 = *v3;
      v28 = *(_QWORD *)(a2 + v27);
      if (v28 == -1 || v28 >= *(_QWORD *)(a2 + *v4))
        break;
      v29 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v28);
      *(_QWORD *)(a2 + v27) = v28 + 1;
      v19 |= (unint64_t)(v29 & 0x7F) << v25;
      if ((v29 & 0x80) == 0)
      {
        v24 = &OBJC_IVAR____MPCProtoTracklistIndexPath__itemIndex;
        goto LABEL_39;
      }
      v25 += 7;
      v23 = v26++ > 8;
      if (v23)
      {
        v19 = 0;
        v24 = &OBJC_IVAR____MPCProtoTracklistIndexPath__itemIndex;
        goto LABEL_41;
      }
    }
    v24 = &OBJC_IVAR____MPCProtoTracklistIndexPath__itemIndex;
LABEL_38:
    *(_BYTE *)(a2 + *v5) = 1;
    goto LABEL_39;
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_210D6A5B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  uint64_t v16;
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v16 - 192), 8);
  _Block_object_dispose((const void *)(v16 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1170(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1171(uint64_t a1)
{

}

void sub_210D732F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1387(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1388(uint64_t a1)
{

}

id _MPCDescribePS(uint64_t a1)
{
  return +[_MPCPlaybackEnginePlayer describePlayer:](_MPCPlaybackEnginePlayer, "describePlayer:", a1);
}

void sub_210D83F28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_210D84E30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  uint64_t v11;
  va_list va;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v11 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 112), 8);
  _Unwind_Resume(a1);
}

id _MPCSPIRCopyFailedStoreIDs()
{
  void *v0;
  void *v1;
  id v2;
  void *v3;

  os_unfair_lock_lock((os_unfair_lock_t)&__MPCSPIRFailedItemsLock);
  v0 = (void *)objc_msgSend((id)__failedStoreIDs, "copy");
  v1 = v0;
  if (v0)
  {
    v2 = v0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  v3 = v2;

  os_unfair_lock_unlock((os_unfair_lock_t)&__MPCSPIRFailedItemsLock);
  return v3;
}

uint64_t __Block_byref_object_copy__1766(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1767(uint64_t a1)
{

}

void _MPCSPIRAddFailedStoreIDs(void *a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v4 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&__MPCSPIRFailedItemsLock);
  v1 = (void *)__failedStoreIDs;
  if (!__failedStoreIDs)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)__failedStoreIDs;
    __failedStoreIDs = v2;

    v1 = (void *)__failedStoreIDs;
  }
  objc_msgSend(v1, "addObjectsFromArray:", v4);
  os_unfair_lock_unlock((os_unfair_lock_t)&__MPCSPIRFailedItemsLock);

}

void sub_210D87D90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  va_list va1;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  va_list va2;

  va_start(va2, a9);
  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  va_copy(va2, va1);
  v15 = va_arg(va2, _QWORD);
  v17 = va_arg(va2, _QWORD);
  v18 = va_arg(va2, _QWORD);
  v19 = va_arg(va2, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose(va2, 8);
  _Unwind_Resume(a1);
}

BOOL _MPCProtoRadioContentReferenceReadFrom(id *a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  _MPCProtoRadioContentReferenceLibraryAlbumContentReference *v17;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x24BE7AF30];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      if (v9++ >= 9)
      {
        v10 = 0;
        v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v15 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        v17 = objc_alloc_init(_MPCProtoRadioContentReferenceLibraryAlbumContentReference);
        objc_storeStrong(a1 + 1, v17);
        if (PBReaderPlaceMark()
          && (_MPCProtoRadioContentReferenceLibraryAlbumContentReferenceReadFrom((uint64_t)v17, a2) & 1) != 0)
        {
          goto LABEL_32;
        }
        goto LABEL_35;
      case 2u:
        v17 = objc_alloc_init(_MPCProtoRadioContentReferenceLibraryArtistContentReference);
        objc_storeStrong(a1 + 2, v17);
        if (!PBReaderPlaceMark()
          || (_MPCProtoRadioContentReferenceLibraryArtistContentReferenceReadFrom((uint64_t)v17, a2) & 1) == 0)
        {
          goto LABEL_35;
        }
        goto LABEL_32;
      case 3u:
        v17 = objc_alloc_init(_MPCProtoRadioContentReferenceLibraryItemContentReference);
        objc_storeStrong(a1 + 3, v17);
        if (!PBReaderPlaceMark()
          || (_MPCProtoRadioContentReferenceLibraryItemContentReferenceReadFrom((uint64_t)v17, a2) & 1) == 0)
        {
          goto LABEL_35;
        }
        goto LABEL_32;
      case 4u:
        v17 = objc_alloc_init(_MPCProtoRadioContentReferenceStoreContentReference);
        objc_storeStrong(a1 + 4, v17);
        if (PBReaderPlaceMark()
          && (_MPCProtoRadioContentReferenceStoreContentReferenceReadFrom((uint64_t)v17, a2) & 1) != 0)
        {
LABEL_32:
          PBReaderRecallMark();

LABEL_33:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_35:

        return 0;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0)
          return 0;
        goto LABEL_33;
    }
  }
}

void sub_210D89EB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1962(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1963(uint64_t a1)
{

}

void sub_210D8AD00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2163(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2164(uint64_t a1)
{

}

void sub_210D8DF60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t _MPCProtoItemIdentifierSetReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t result;
  uint64_t v24;
  uint64_t v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  char v31;
  unsigned int v32;
  uint64_t v33;
  unint64_t v34;
  char v35;
  char v36;
  unsigned int v37;
  uint64_t v38;
  unint64_t v39;
  char v40;
  char v41;
  unsigned int v42;
  uint64_t v43;
  unint64_t v44;
  char v45;
  void *v46;
  uint64_t v47;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          v17 = 0;
          v18 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 64) |= 2u;
          while (1)
          {
            v20 = *v3;
            v21 = *(_QWORD *)(a2 + v20);
            if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
              break;
            v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
            *(_QWORD *)(a2 + v20) = v21 + 1;
            v19 |= (unint64_t)(v22 & 0x7F) << v17;
            if ((v22 & 0x80) == 0)
              goto LABEL_60;
            v17 += 7;
            v14 = v18++ >= 9;
            if (v14)
            {
              v19 = 0;
              goto LABEL_62;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_60:
          if (*(_BYTE *)(a2 + *v5))
            v19 = 0;
LABEL_62:
          v47 = 16;
          goto LABEL_79;
        case 2u:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 56;
          goto LABEL_58;
        case 3u:
          v26 = 0;
          v27 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 64) |= 8u;
          while (2)
          {
            v28 = *v3;
            v29 = *(_QWORD *)(a2 + v28);
            if (v29 == -1 || v29 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v30 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v29);
              *(_QWORD *)(a2 + v28) = v29 + 1;
              v19 |= (unint64_t)(v30 & 0x7F) << v26;
              if (v30 < 0)
              {
                v26 += 7;
                v14 = v27++ >= 9;
                if (v14)
                {
                  v19 = 0;
                  goto LABEL_66;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v19 = 0;
LABEL_66:
          v47 = 32;
          goto LABEL_79;
        case 4u:
          v31 = 0;
          v32 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 64) |= 0x10u;
          while (2)
          {
            v33 = *v3;
            v34 = *(_QWORD *)(a2 + v33);
            if (v34 == -1 || v34 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v35 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v34);
              *(_QWORD *)(a2 + v33) = v34 + 1;
              v19 |= (unint64_t)(v35 & 0x7F) << v31;
              if (v35 < 0)
              {
                v31 += 7;
                v14 = v32++ >= 9;
                if (v14)
                {
                  v19 = 0;
                  goto LABEL_70;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v19 = 0;
LABEL_70:
          v47 = 40;
          goto LABEL_79;
        case 5u:
          v36 = 0;
          v37 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 64) |= 1u;
          while (2)
          {
            v38 = *v3;
            v39 = *(_QWORD *)(a2 + v38);
            if (v39 == -1 || v39 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v40 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v39);
              *(_QWORD *)(a2 + v38) = v39 + 1;
              v19 |= (unint64_t)(v40 & 0x7F) << v36;
              if (v40 < 0)
              {
                v36 += 7;
                v14 = v37++ >= 9;
                if (v14)
                {
                  v19 = 0;
                  goto LABEL_74;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v19 = 0;
LABEL_74:
          v47 = 8;
          goto LABEL_79;
        case 6u:
          v41 = 0;
          v42 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 64) |= 4u;
          break;
        case 7u:
          PBReaderReadString();
          v24 = objc_claimAutoreleasedReturnValue();
          v25 = 48;
LABEL_58:
          v46 = *(void **)(a1 + v25);
          *(_QWORD *)(a1 + v25) = v24;

          continue;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v43 = *v3;
        v44 = *(_QWORD *)(a2 + v43);
        if (v44 == -1 || v44 >= *(_QWORD *)(a2 + *v4))
          break;
        v45 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v44);
        *(_QWORD *)(a2 + v43) = v44 + 1;
        v19 |= (unint64_t)(v45 & 0x7F) << v41;
        if ((v45 & 0x80) == 0)
          goto LABEL_76;
        v41 += 7;
        v14 = v42++ >= 9;
        if (v14)
        {
          v19 = 0;
          goto LABEL_78;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_76:
      if (*(_BYTE *)(a2 + *v5))
        v19 = 0;
LABEL_78:
      v47 = 24;
LABEL_79:
      *(_QWORD *)(a1 + v47) = v19;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_210D92F00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location, id a18)
{
  id *v18;
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a18);
  _Unwind_Resume(a1);
}

void sub_210D966A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2713(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2714(uint64_t a1)
{

}

void sub_210D9B3F4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 240), 8);
  _Block_object_dispose((const void *)(v1 - 208), 8);
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_210DA3938(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id *location)
{
  objc_destroyWeak(location);
  objc_destroyWeak((id *)&STACK[0x948]);
  _Block_object_dispose(&STACK[0x990], 8);
  _Unwind_Resume(a1);
}

id _MPCBeginBackgroundTaskAndReturnEndTaskBlockWithContext(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  _QWORD aBlock[4];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  id v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = *MEMORY[0x24BE65AB8];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = ___MPCBeginBackgroundTaskAndReturnEndTaskBlockWithContext_block_invoke;
  aBlock[3] = &unk_24CAB2E68;
  v14 = &v16;
  v15 = a1;
  v4 = v3;
  v13 = v4;
  v5 = _Block_copy(aBlock);
  MPSharedBackgroundTaskProvider();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "beginTaskWithExpirationHandler:", v5);
  v17[3] = v7;

  v8 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v17[3];
    *(_DWORD *)buf = 136315650;
    v21 = a1;
    v22 = 2114;
    v23 = v4;
    v24 = 2048;
    v25 = v9;
    _os_log_impl(&dword_210BD8000, v8, OS_LOG_TYPE_DEFAULT, "%s: BackgroundTask: Took assertion for %{public}@ (%lli)", buf, 0x20u);
  }

  v10 = _Block_copy(v5);
  _Block_object_dispose(&v16, 8);

  return v10;
}

void sub_210DA4610(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3282(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3283(uint64_t a1)
{

}

void sub_210DA4FAC(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_210DA8648(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

os_log_t _MPCLogCategoryAnalytics()
{
  return os_log_create("com.apple.amp.mediaplaybackcore", "Analytics");
}

os_log_t _MPCLogCategoryDelegation()
{
  return os_log_create("com.apple.amp.mediaplaybackcore", "Delegation");
}

os_log_t _MPCLogCategoryMediaRemote()
{
  return os_log_create("com.apple.amp.mediaplaybackcore", "MediaRemote");
}

os_log_t _MPCLogCategoryMusicBehavior()
{
  return os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
}

os_log_t _MPCLogCategoryPodcastsBehavior()
{
  return os_log_create("com.apple.amp.mediaplaybackcore", "PodcastsBehavior");
}

os_log_t _MPCLogCategoryPlayback()
{
  return os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
}

os_log_t _MPCLogCategoryPlayback_Oversize()
{
  return os_log_create("com.apple.amp.mediaplaybackcore", "Playback_Oversize");
}

os_log_t _MPCLogCategoryPlaybackEvents()
{
  return os_log_create("com.apple.amp.mediaplaybackcore", "PlaybackEvents");
}

os_log_t _MPCLogCategoryQueueController()
{
  return os_log_create("com.apple.amp.mediaplaybackcore", "QueueController");
}

void sub_210DADB4C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 168), 8);
  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4157(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4158(uint64_t a1)
{

}

void sub_210DAE7D8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 224), 8);
  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Unwind_Resume(a1);
}

void sub_210DAF22C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _MPCDescribeQC(uint64_t a1)
{
  return +[MPCQueueController describePlayer:](MPCQueueController, "describePlayer:", a1);
}

void sub_210DB05A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_210DB3138(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_210DB33B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_210DB446C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_210DBD504(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_210DBD5F4(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4877(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4878(uint64_t a1)
{

}

id _MPCRemotePlayerArtworkDataSourceValidSupportedSizes(void *a1, CGFloat a2, CGFloat a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  CGFloat v13;
  CGFloat v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;
  CGRect v22;
  CGRect v23;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v12, "CGSizeValue", (_QWORD)v16);
        v23.size.width = v13;
        v23.size.height = v14;
        v22.origin.x = 0.0;
        v22.origin.y = 0.0;
        v23.origin.x = 0.0;
        v23.origin.y = 0.0;
        v22.size.width = a2;
        v22.size.height = a3;
        if (CGRectContainsRect(v22, v23))
          objc_msgSend(v6, "addObject:", v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  return v6;
}

void sub_210DC9114(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t MPCAssistantWatchIsConnectedToCompanion()
{
  return 0;
}

void sub_210DCAD44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6428(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6429(uint64_t a1)
{

}

void sub_210DCB558(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_210DCBEE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_210DD0B30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_210DD1D84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  uint64_t v11;
  va_list va;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a10);
  va_start(va, a10);
  v11 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_210DD31C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38)
{
  _Block_object_dispose(&a38, 8);
  _Unwind_Resume(a1);
}

void sub_210DD3D80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__7515(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7516(uint64_t a1)
{

}

void sub_210DD8B30(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_210DD9594(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location)
{
  id *v24;

  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_210DD9CF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_210DD9DD8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_210DDA4E4(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__7802(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7803(uint64_t a1)
{

}

void sub_210DDAB3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _MPCProtoDelegateInfoTokenAReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  int v15;
  uint64_t result;
  uint64_t v18;
  void *v19;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        if (v9++ >= 9)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3))
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
      else
      {
        PBReaderReadData();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = *(void **)(a1 + 8);
        *(_QWORD *)(a1 + 8) = v18;

      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

__CFString *NSStringFromAVFoundationErrorDomainCode(uint64_t a1)
{
  uint64_t v2;
  __CFString *v3;

  v2 = a1 + 11885;
  v3 = CFSTR("Unknown");
  switch(v2)
  {
    case 0:
      v3 = CFSTR("ToneMappingFailed");
      return v3;
    case 1:
      return CFSTR("SandboxExtensionDenied");
    case 2:
      return CFSTR("EncodeFailed");
    case 3:
      return CFSTR("AirPlayReceiverTemporarilyUnavailable");
    case 4:
      return CFSTR("FailedToLoadSampleData");
    case 5:
      return CFSTR("InvalidSampleCursor");
    case 6:
      return CFSTR("ContentKeyRequestCancelled");
    case 7:
      return CFSTR("OperationCancelled");
    case 8:
      return CFSTR("RosettaNotInstalled");
    case 9:
      return CFSTR("SegmentStartedWithNonSyncSample");
    case 10:
      return CFSTR("IncorrectlyConfigured");
    case 12:
      return CFSTR("UnsupportedDeviceActiveFormat");
    case 13:
      return CFSTR("SessionHardwareCostOverage");
    case 14:
      return CFSTR("OperationNotSupportedForPreset");
    case 15:
      return CFSTR("ExternalPlaybackNotSupportedForAsset");
    case 16:
      return CFSTR("NoSourceTrack");
    case 17:
      return CFSTR("NoCompatibleAlternatesForExternalDisplay");
    case 18:
      return CFSTR("NoLongerPlayable");
    case 19:
      return CFSTR("ContentNotUpdated");
    case 20:
      return CFSTR("MalformedDepth");
    case 21:
      return CFSTR("FormatUnsupported");
    case 22:
      return CFSTR("ContentIsUnavailable");
    case 23:
      return CFSTR("OperationNotAllowed");
    case 24:
      return CFSTR("UnsupportedOutputSettings");
    case 25:
      return CFSTR("CreateContentKeyRequestFailed");
    case 26:
      return CFSTR("RecordingAlreadyInProgress");
    case 27:
      return CFSTR("VideoCompositorFailed");
    case 28:
      return CFSTR("AirPlayReceiverRequiresInternet");
    case 29:
      return CFSTR("AirPlayControllerRequiresInternet");
    case 30:
      return CFSTR("UndecodableMediaData");
    case 31:
      return CFSTR("FileTypeDoesNotSupportSampleReferences");
    case 32:
      return CFSTR("FailedToParse");
    case 33:
      return CFSTR("ApplicationIsNotAuthorizedToUseDevice");
    case 35:
      return CFSTR("ServerIncorrectlyConfigured");
    case 36:
      return CFSTR("FailedToLoadMediaData");
    case 37:
      return CFSTR("IncompatibleAsset");
    case 38:
      return CFSTR("OperationInterrupted");
    case 39:
      return CFSTR("TorchLevelUnavailable");
    case 40:
      return CFSTR("DisplayWasDisabled");
    case 41:
      return CFSTR("ScreenCaptureFailed");
    case 42:
      return CFSTR("InvalidOutputURLPathExtension");
    case 43:
      return CFSTR("ReferenceForbiddenByReferencePolicy");
    case 44:
      return CFSTR("InvalidVideoComposition");
    case 45:
      return CFSTR("EncoderTemporarilyUnavailable");
    case 46:
      return CFSTR("DecoderTemporarilyUnavailable");
    case 47:
      return CFSTR("OperationNotSupportedForAsset");
    case 48:
      return CFSTR("DeviceIsNotAvailableInBackground");
    case 49:
      return CFSTR("ApplicationIsNotAuthorized");
    case 50:
      return CFSTR("ContentIsNotAuthorized");
    case 51:
      return CFSTR("EncoderNotFound");
    case 52:
      return CFSTR("DecoderNotFound");
    case 53:
      return CFSTR("NoImageAtTime");
    case 54:
      return CFSTR("ContentIsProtected");
    case 55:
      return CFSTR("MaximumStillImageCaptureRequestsExceeded");
    case 56:
      return CFSTR("FileFailedToParse");
    case 57:
      return CFSTR("FileFormatNotRecognized");
    case 58:
      return CFSTR("InvalidCompositionTrackSegmentSourceDuration");
    case 59:
      return CFSTR("InvalidCompositionTrackSegmentSourceStartTime");
    case 60:
      return CFSTR("InvalidCompositionTrackSegmentDuration");
    case 61:
      return CFSTR("CompositionTrackSegmentsNotContiguous");
    case 62:
      return CFSTR("FileAlreadyExists");
    case 63:
      return CFSTR("InvalidSourceMedia");
    case 64:
      return CFSTR("DecodeFailed");
    case 65:
      return CFSTR("ExportFailed");
    case 66:
      return CFSTR("MediaServicesWereReset");
    case 67:
      return CFSTR("SessionWasInterrupted");
    case 68:
      return CFSTR("DeviceLockedForConfigurationByAnotherProcess");
    case 70:
      return CFSTR("DeviceInUseByAnotherApplication");
    case 71:
      return CFSTR("DeviceNotConnected");
    case 72:
      return CFSTR("MaximumNumberOfSamplesForFileFormatReached");
    case 73:
      return CFSTR("MediaDiscontinuity");
    case 74:
      return CFSTR("MaximumFileSizeReached");
    case 75:
      return CFSTR("MaximumDurationReached");
    case 76:
      return CFSTR("MediaChanged");
    case 77:
      return CFSTR("DeviceWasDisconnected");
    case 78:
      return CFSTR("DiskFull");
    case 79:
      return CFSTR("SessionConfigurationChanged");
    case 80:
      return CFSTR("NoDataCaptured");
    case 81:
      return CFSTR("DeviceAlreadyUsedByAnotherSession");
    case 82:
      return CFSTR("SessionNotRunning");
    case 84:
      return CFSTR("OutOfMemory");
    case 85:
      return v3;
    default:
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("UnknownAVError/code=%lld"), a1);
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      return v3;
  }
}

uint64_t __Block_byref_object_copy__9351(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9352(uint64_t a1)
{

}

id MPCAssistantCreateError(uint64_t a1)
{
  __CFString *v2;
  __CFString *v3;
  void *v4;
  void *v5;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  if ((unint64_t)(a1 - 1) > 0xC)
    v2 = CFSTR("An unknown error occurred.");
  else
    v2 = off_24CAB4388[a1 - 1];
  v3 = v2;
  v7 = *MEMORY[0x24BDD0BA0];
  v8[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("MPAssistantErrorDomain"), a1, v4);

  return v5;
}

id MPCAssistantWrapError(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  __CFString *v7;
  uint64_t v8;
  void *v9;
  __CFString *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v2 = v1;
  if (v1)
  {
    objc_msgSend(v1, "domain");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isEqual:", *MEMORY[0x24BE65728]);

    if (v4)
    {
      v5 = objc_msgSend(v2, "code");
      v6 = 0;
      v7 = CFSTR("An unknown error occurred.");
      if (v5 > 99)
      {
        switch(v5)
        {
          case 't':
          case 'y':
            goto LABEL_16;
          case 'u':
          case 'w':
          case 'x':
          case 'z':
          case '{':
          case '|':
            goto LABEL_20;
          case 'v':
LABEL_9:
            v8 = 4;
            break;
          case '}':
            v8 = 13;
            break;
          default:
            if (v5 == 100)
            {
LABEL_16:
              v8 = 3;
            }
            else
            {
              if (v5 != 202)
                goto LABEL_20;
              v8 = 11;
            }
            break;
        }
      }
      else
      {
        v8 = 1;
        switch(v5)
        {
          case '\'':
          case '/':
            break;
          case '(':
            goto LABEL_9;
          case ')':
          case '*':
          case '+':
          case ',':
          case '-':
          case '.':
            goto LABEL_20;
          case '0':
            v8 = 12;
            break;
          default:
            if (v5 == 5)
            {
              v8 = 2;
            }
            else
            {
              if (v5 != 26)
                goto LABEL_20;
              v8 = 9;
            }
            break;
        }
      }
      v7 = off_24CAB4388[v8 - 1];
      v6 = v8;
    }
    else
    {
      v6 = 0;
      v7 = CFSTR("An unknown error occurred.");
    }
LABEL_20:
    v10 = v7;
    v11 = *MEMORY[0x24BDD0BA0];
    v17[0] = v10;
    v12 = *MEMORY[0x24BDD1398];
    v16[0] = v11;
    v16[1] = v12;
    v13 = (void *)objc_msgSend(v2, "copy");
    v17[1] = v13;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("MPAssistantErrorDomain"), v6, v14);
  }
  else
  {
    MPCAssistantCreateError(0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

id MPCAssistantCreateSendCommandError(unsigned int a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MRMediaRemoteCopySendCommandErrorDescription();
  v6 = *MEMORY[0x24BDD0BA0];
  v7[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("MPCAssistantMediaRemoteSendCommandErrorDomain"), a1, v3);

  return v4;
}

uint64_t MPCAssistantErrorIsInformational(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v6;

  v1 = a1;
  if ((MRMediaRemoteErrorIsInformational() & 1) != 0
    || (objc_msgSend(v1, "underlyingErrors"),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v2, "msv_firstWhere:", &__block_literal_global_9441),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        v2,
        v3))
  {
    v4 = 1;
  }
  else if (objc_msgSend(v1, "code") == 6 || objc_msgSend(v1, "code") == 7 || objc_msgSend(v1, "code") == 11)
  {
    objc_msgSend(v1, "domain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v6, "isEqualToString:", CFSTR("MPAssistantErrorDomain"));

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

void MPCPlaybackEngineEventMonotonicTimeConvertNSDate(void *a1@<X0>, uint64_t a2@<X8>)
{
  id v3;
  double v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  mach_timebase_info info;

  info = 0;
  v3 = a1;
  mach_timebase_info(&info);
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  *(_QWORD *)(a2 + 32) = 0;
  MPCPlaybackEngineEventGetMonotonicTime((_QWORD *)a2);
  objc_msgSend(v3, "timeIntervalSinceReferenceDate");
  v5 = (uint64_t)((v4 - *(double *)(a2 + 32)) * 1000000000.0);
  objc_msgSend(v3, "timeIntervalSinceReferenceDate");
  v7 = v6;

  *(_QWORD *)(a2 + 32) = v7;
  v8 = *(_QWORD *)(a2 + 16) + v5;
  *(_QWORD *)(a2 + 8) += info.denom * v5 / info.numer;
  *(_QWORD *)(a2 + 16) = v8;
}

void MPCPlaybackEngineEventMonotonicTimeConvertCMTimebase(const void *a1@<X0>, uint64_t a2@<X8>, Float64 a3@<D0>)
{
  CMClockRef HostTimeClock;
  NSObject *v7;
  __CFString *v8;
  __int128 v9;
  CMTime v10;
  CMTime v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  CMTime time;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v14 = 0;
  v12 = 0u;
  v13 = 0u;
  MPCPlaybackEngineEventGetMonotonicTime(&v12);
  memset(&v11, 0, sizeof(v11));
  CMTimeMakeWithSeconds(&v11, a3, 1000000000);
  memset(&v10, 0, sizeof(v10));
  HostTimeClock = CMClockGetHostTimeClock();
  time = v11;
  CMSyncConvertTime(&v10, &time, a1, HostTimeClock);
  if ((v10.flags & 1) != 0)
  {
    time = v10;
    MPCPlaybackEngineEventMonotonicTimeWithHostTime(&time, a2);
  }
  else
  {
    v7 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      time = v10;
      v8 = (__CFString *)CMTimeCopyDescription(0, &time);
      LODWORD(time.value) = 138543618;
      *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)a1;
      LOWORD(time.flags) = 2114;
      *(_QWORD *)((char *)&time.flags + 2) = v8;
      _os_log_impl(&dword_210BD8000, v7, OS_LOG_TYPE_ERROR, "Unable to convert timebase to host time - timebase=%{public}@ - hostTimeFromTimeBase=%{public}@", (uint8_t *)&time, 0x16u);

    }
    v9 = v13;
    *(_OWORD *)a2 = v12;
    *(_OWORD *)(a2 + 16) = v9;
    *(_QWORD *)(a2 + 32) = v14;
  }
}

double MPCPlaybackEngineEventMonotonicTimeWithHostTime@<D0>(CMTime *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  double v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  double result;
  CMTime v13;
  __int128 v14;
  __int128 v15;
  double v16;

  v16 = 0.0;
  v14 = 0u;
  v15 = 0u;
  MPCPlaybackEngineEventGetMonotonicTime(&v14);
  v13 = *a1;
  v4 = CMClockConvertHostTimeToSystemUnits(&v13);
  v5 = *((_QWORD *)&v14 + 1) - v4;
  if (*((_QWORD *)&v14 + 1) <= v4)
    __assert_rtn("MPCPlaybackEngineEventMonotonicTimeWithHostTime", "MPCPlaybackEngineEvent.m", 78, "time.machAbsoluteTime > machAbsoluteTime");
  v6 = v4;
  v13.value = 0;
  mach_timebase_info((mach_timebase_info_t)&v13);
  v7 = v5 * LODWORD(v13.value) / HIDWORD(v13.value);
  v8 = (double)v7;
  v9 = v15 - v7;
  v10 = v16;
  *(_QWORD *)a2 = v14;
  *(_QWORD *)(a2 + 8) = v6;
  v11 = *((_QWORD *)&v15 + 1);
  result = v10 + v8 / -1000000000.0;
  *(_QWORD *)(a2 + 16) = v9;
  *(_QWORD *)(a2 + 24) = v11;
  *(double *)(a2 + 32) = result;
  return result;
}

uint64_t MPCPlaybackEngineEventMonotonicTimeGetAbsoluteTimeWithOffset(uint64_t a1, double a2)
{
  mach_timebase_info info;

  info = 0;
  mach_timebase_info(&info);
  return info.denom * (uint64_t)(a2 * 1000000000.0) / info.numer + *(_QWORD *)(a1 + 8);
}

id _EVSEventToABCEvent(void *a1)
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "payload");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  MPCPlaybackEngineEventPayloadJSONFromPayload(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

void sub_210DE47A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__11182(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__11183(uint64_t a1)
{

}

__CFString *NSStringFromMPCErrorCode(uint64_t a1)
{
  __CFString *v3;

  v3 = CFSTR("Unknown");
  switch(a1)
  {
    case 0:
      return v3;
    case 1:
      v3 = CFSTR("UnableToPerformRequest");
      return v3;
    case 2:
      return CFSTR("UnsupportedCommand");
    case 3:
      return CFSTR("MissingBag");
    case 4:
      return CFSTR("UnknownCustomQueueIdentifier");
    case 5:
      return CFSTR("MissingTracklistData");
    case 6:
      return CFSTR("MissingModelRequest");
    case 7:
      return CFSTR("DelegatedAccountCreationFailure");
    case 8:
      return CFSTR("MissingCreationPropertiesData");
    case 9:
      return CFSTR("InvalidSuzeLeaseSessionToken");
    case 10:
      return CFSTR("CellularRestricted");
    case 11:
      return CFSTR("NetworkUnavailable");
    case 12:
      return CFSTR("ExceededBagFileSizeLimit");
    case 13:
      return CFSTR("FailedToDecodePlaylistManagerArchive");
    case 14:
      return CFSTR("RequestTimeout");
    case 15:
      return CFSTR("InvalidResponse");
    case 16:
      return CFSTR("InvalidDelegatedIdentity");
    case 17:
      return CFSTR("SubscriptionRequired");
    case 18:
      return CFSTR("MissingSubscriptionAdamID");
    case 19:
      return CFSTR("MissingLeaseSession");
    case 20:
      return CFSTR("MissingLocalFilePath");
    case 21:
      return CFSTR("AssetQualityTooLow");
    case 22:
      return CFSTR("InvalidCachedAsset");
    case 23:
      return CFSTR("InvalidAssetURL");
    case 24:
      return CFSTR("AssetUnavailable");
    case 25:
      return CFSTR("MissingRedownloadParameters");
    case 26:
      return CFSTR("MissingStoreRequestContext");
    case 27:
      return CFSTR("SubscriptionRequiredForSharedQueue");
    case 28:
      return CFSTR("Cancelled");
    case 29:
      return CFSTR("MissingArtwork");
    case 30:
      return CFSTR("SubscriptionLeaseTaken");
    case 40:
      return CFSTR("ExplicitContentRequiresAgeVerification");
    case 41:
      return CFSTR("ExplicitContentIsNotAllowed");
    case 42:
      return CFSTR("ExplicitContentAgeVerificationFailed");
    case 43:
      return CFSTR("ExplicitContentAgeGatingFailed");
    case 53:
      return CFSTR("DroppedCompletion");
    case 54:
      return CFSTR("SubscriptionAssetResponseMissingItem");
    case 55:
      return CFSTR("FailedToResolveStartItem");
    case 56:
      return CFSTR("NoNetworkConnection");
    case 57:
      return CFSTR("UserIdentityNotSupported");
    case 58:
      return CFSTR("UnsupportedPlaybackContext");
    case 59:
      return CFSTR("UnrestorableArchive");
    case 60:
      return CFSTR("UninitializedPlaybackStack");
    case 61:
      return CFSTR("EmptyModelResponse");
    case 62:
      return CFSTR("FailedToQueueItems");
    case 64:
      return CFSTR("RadioServiceNotAllowed");
    case 65:
      return CFSTR("HLSAssetMissingKeyURLs");
    case 66:
      return CFSTR("UnsupportedPlaybackQueue");
    case 67:
      return CFSTR("MissingUserIdentity");
    case 68:
      return CFSTR("UserIdentityMismatch");
    case 69:
      return CFSTR("NonPlayableEntity");
    case 70:
      return CFSTR("PersonalizationTimeout");
    case 71:
      return CFSTR("HLSAssetKeyDeliveryFailed");
    case 72:
      return CFSTR("MissingTransportableLibraryIDs");
    case 73:
      return CFSTR("MissingDelegationHostAccount");
    case 74:
      return CFSTR("MissingDelegationToken");
    case 75:
      return CFSTR("EmptyModelResponseWithCloudLibraryDisabled");
    default:
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("UnknownCode/%lld"), a1);
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      return v3;
  }
}

__CFString *NSStringFromMPCPlaybackSessionManagerErrorCode(unint64_t a1)
{
  if (a1 < 7)
    return off_24CAB4988[a1];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("UnknownCode/%lld"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *NSStringFromMPCPlayerRequestErrorCode(uint64_t a1)
{
  __CFString *v1;

  if (a1 > 2999)
  {
    if (a1 <= 4999)
    {
      if (a1 == 3000)
        return CFSTR("FailedToLoadArtwork");
      if (a1 == 4000)
        return CFSTR("FailedToLoadSupportedCommands");
    }
    else
    {
      switch(a1)
      {
        case 5000:
          return CFSTR("FailedToResolve");
        case 6000:
          return CFSTR("FailedToPlaybackState");
        case 7000:
          return CFSTR("FailedToLoadParticipants");
      }
    }
    goto LABEL_26;
  }
  if (a1 <= 1000)
  {
    if (!a1)
      return CFSTR("Unknown");
    if (a1 == 1000)
      return CFSTR("UnableToSendCommand");
    goto LABEL_26;
  }
  if (a1 == 1001)
    return CFSTR("CommandFailed");
  if (a1 == 1002)
    return CFSTR("NoCommandsProvided");
  if (a1 != 2000)
  {
LABEL_26:
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("UnknownCode/%lld"), a1);
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
    return v1;
  }
  v1 = CFSTR("FailedToLoadMetadata");
  return v1;
}

__CFString *NSStringFromMPCModelRadioQueueFeederErrorCode(uint64_t a1)
{
  __CFString *v1;
  __CFString *result;

  switch(a1)
  {
    case -1006:
      v1 = CFSTR("AccountSignOut");
      goto LABEL_3;
    case -1005:
      result = CFSTR("GetTracksFailed");
      break;
    case -1004:
      result = CFSTR("NetworkUnavailable");
      break;
    case -1003:
      result = CFSTR("CellularRestricted");
      break;
    default:
      if (a1)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("UnknownCode/%lld"), a1);
        v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_3:
        result = v1;
      }
      else
      {
        result = CFSTR("Unknown");
      }
      break;
  }
  return result;
}

__CFString *NSStringFromMPCPlayerEnqueueErrorCode(unint64_t a1)
{
  __CFString *v1;

  if (a1 < 6 && ((0x2Fu >> a1) & 1) != 0)
  {
    v1 = off_24CAB49C0[a1];
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("UnknownCode/%lld"), a1);
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v1;
}

__CFString *NSStringFromMPCPlaybackEngineInternalErrorCode(uint64_t a1)
{
  __CFString *v2;
  __CFString *result;

  if (a1 <= 2100)
  {
    if (a1 <= 999)
    {
      if (a1 <= 99)
      {
        v2 = CFSTR("Unknown");
        switch(a1)
        {
          case 0:
            return v2;
          case 1:
            v2 = CFSTR("NoContentToPlay");
            return v2;
          case 2:
            result = CFSTR("NoCurrentItem");
            break;
          case 3:
            result = CFSTR("CannotFindReferencedItem");
            break;
          case 4:
            result = CFSTR("FeatureDisabled");
            break;
          case 5:
            result = CFSTR("CommandInvalid");
            break;
          case 6:
            result = CFSTR("CommandRequiresOverride");
            break;
          case 7:
            result = CFSTR("FeatureNotImplemented");
            break;
          default:
            goto LABEL_82;
        }
        return result;
      }
      if (a1 <= 101)
      {
        if (a1 == 100)
          return CFSTR("AccountMissing");
        else
          return CFSTR("AccountMissingSubscription");
      }
      if (a1 == 102)
        return CFSTR("AccountMissingAuthentication");
      if (a1 == 199)
        return CFSTR("AccountNotPrepared");
      goto LABEL_82;
    }
    if (a1 > 1999)
    {
      switch(a1)
      {
        case 2000:
          result = CFSTR("FailedToPlayRate");
          break;
        case 2001:
          result = CFSTR("FailedToPauseRate");
          break;
        case 2002:
          result = CFSTR("FailedToToggleRate");
          break;
        case 2003:
          result = CFSTR("FailedToChangeRate");
          break;
        case 2004:
          result = CFSTR("FailedToJumpToTime");
          break;
        case 2005:
          result = CFSTR("FailedToBeginScanning");
          break;
        case 2006:
          result = CFSTR("FailedToStopScanning");
          break;
        case 2007:
          result = CFSTR("FailedToEndPlayback");
          break;
        default:
          if (a1 != 2100)
            goto LABEL_82;
          result = CFSTR("CannotStopScanningIfNotScanning");
          break;
      }
      return result;
    }
    switch(a1)
    {
      case 1000:
        return CFSTR("MediaServicesUnavailable");
      case 1001:
        return CFSTR("AudioSessionActivationFailed");
      case 1002:
        return CFSTR("AudioSessionActivationCancelled");
    }
LABEL_82:
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("UnknownCode/%lld"), a1);
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
    return v2;
  }
  if (a1 <= 3099)
  {
    if (a1 <= 2999)
    {
      switch(a1)
      {
        case 2101:
          return CFSTR("CannotSkipUnskippableItem");
        case 2200:
          return CFSTR("FailedToPlaySharedListeningItem");
        case 2201:
          return CFSTR("SharedListeningSessionDisconnected");
      }
      goto LABEL_82;
    }
    switch(a1)
    {
      case 3000:
        result = CFSTR("FailedToBuildPlaybackContext");
        break;
      case 3001:
        result = CFSTR("FailedToLoadPlaybackContext");
        break;
      case 3002:
        result = CFSTR("FailedToMoveItem");
        break;
      case 3003:
        result = CFSTR("FailedToRemoveItem");
        break;
      case 3004:
        result = CFSTR("FailedToRepeatItem");
        break;
      case 3005:
        result = CFSTR("FailedToShuffleItem");
        break;
      case 3006:
        result = CFSTR("FailedToChangeAutoPlayMode");
        break;
      case 3007:
        result = CFSTR("FailedToProduceItem");
        break;
      default:
        goto LABEL_82;
    }
  }
  else
  {
    if (a1 > 5000)
    {
      if (a1 <= 5029)
      {
        switch(a1)
        {
          case 5001:
            return CFSTR("TimeoutUnknownCommandID");
          case 5010:
            return CFSTR("TimeoutSessionActivation");
          case 5020:
            return CFSTR("TimeoutQueueLoad");
        }
      }
      else if (a1 > 5049)
      {
        if (a1 == 5050)
          return CFSTR("TimeoutTimeControlStatus");
        if (a1 == 5060)
          return CFSTR("TimeoutFirstAudioFrame");
      }
      else
      {
        if (a1 == 5030)
          return CFSTR("TimeoutAssetLoad");
        if (a1 == 5040)
          return CFSTR("TimeoutReadyToPlay");
      }
      goto LABEL_82;
    }
    switch(a1)
    {
      case 3100:
        result = CFSTR("FailedToLoadSession");
        break;
      case 3101:
        result = CFSTR("FailedToDecodeSession");
        break;
      case 3102:
        result = CFSTR("FailedToFinalizeSession");
        break;
      case 3103:
        result = CFSTR("SessionRestoredUnexpectedCurrentItem");
        break;
      case 3104:
        result = CFSTR("SessionMigrationIdentifierMissing");
        break;
      default:
        if (a1 != 5000)
          goto LABEL_82;
        result = CFSTR("TimeoutUnknown");
        break;
    }
  }
  return result;
}

__CFString *NSStringFromMPCSuntoryErrorCode(uint64_t a1)
{
  __CFString *v1;
  __CFString *result;

  if (a1 <= 199)
  {
    if (a1)
    {
      if (a1 == 101)
      {
        return CFSTR("ModelNotFound");
      }
      else if (a1 == 102)
      {
        return CFSTR("InvalidModel");
      }
      else
      {
LABEL_20:
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("UnknownCode/%lld"), a1);
        v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
        return v1;
      }
    }
    else
    {
      return CFSTR("Unknown");
    }
  }
  else
  {
    switch(a1)
    {
      case 200:
        v1 = CFSTR("FailedToLoadProcessor");
        return v1;
      case 201:
        result = CFSTR("FailedToCreateAudioUnit");
        break;
      case 202:
        result = CFSTR("FailedToSetupAudioUnit");
        break;
      case 203:
        result = CFSTR("FailedToInitializeAudioUnit");
        break;
      case 210:
        result = CFSTR("FailedToProcessData");
        break;
      case 211:
        result = CFSTR("ProcessorNotAvailable");
        break;
      case 212:
        result = CFSTR("ProcessorOverflow");
        break;
      case 213:
        result = CFSTR("FailedToResetAudioUnit");
        break;
      case 220:
        result = CFSTR("FailedToConfigureAsset");
        break;
      default:
        goto LABEL_20;
    }
  }
  return result;
}

__CFString *NSStringFromMPCMusicSharePlayBehaviorErrorCode(unint64_t a1)
{
  if (a1 < 0x10)
    return off_24CAB49F0[a1];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("UnknownCode/%lld"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *NSStringFromMPCMusicPlaybackContextSharePlayErrorCode(unint64_t a1)
{
  if (a1 < 0xA)
    return off_24CAB4A70[a1];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("UnknownCode/%lld"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *NSStringFromMPCMusicBehaviorErrorCode(unint64_t a1)
{
  if (a1 < 0xB)
    return off_24CAB4AC0[a1];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("UnknownCode/%lld"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *NSStringFromMPCPodcastsBehaviorErrorCode(unint64_t a1)
{
  if (a1 < 9)
    return off_24CAB4B18[a1];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("UnknownCode/%lld"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *NSStringFromMPCEnginePlayerErrorCode(unint64_t a1)
{
  if (a1 < 0x12)
    return off_24CAB4B60[a1];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("UnknownCode/%lld"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *NSStringFromMPCExternalContentErrorCode(unint64_t a1)
{
  if (a1 < 3)
    return off_24CAB4BF0[a1];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("UnknownCode/%lld"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

void sub_210DE814C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_210DEA9D8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 160));
  _Unwind_Resume(a1);
}

void *__Block_byref_object_copy__12364(uint64_t a1, uint64_t a2)
{
  void *result;

  result = _Block_copy(*(const void **)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__12365(uint64_t a1)
{

}

void sub_210DF12F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__12799(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__12800(uint64_t a1)
{

}

void sub_210DF3AC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38)
{
  uint64_t v38;

  _Block_object_dispose(&a34, 8);
  _Block_object_dispose(&a38, 8);
  _Block_object_dispose((const void *)(v38 - 248), 8);
  _Block_object_dispose((const void *)(v38 - 200), 8);
  _Unwind_Resume(a1);
}

void sub_210DF472C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
  _Block_object_dispose(&a45, 8);
  _Unwind_Resume(a1);
}

void sub_210DF9AD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a33, 8);
  _Unwind_Resume(a1);
}

void sub_210DFA5D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  _Block_object_dispose(&a32, 8);
  _Unwind_Resume(a1);
}

void sub_210DFB2EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38,uint64_t a39,uint64_t a40,uint64_t a41,char a42,uint64_t a43,uint64_t a44,uint64_t a45,char a46)
{
  _Block_object_dispose(&a38, 8);
  _Block_object_dispose(&a42, 8);
  _Block_object_dispose(&a46, 8);
  _Block_object_dispose(&a24, 8);
  _Unwind_Resume(a1);
}

void sub_210DFC3E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a26, 8);
  _Block_object_dispose(&a33, 8);
  _Unwind_Resume(a1);
}

void sub_210DFC504(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_210DFD070(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_210DFD780(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_210DFF51C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

void sub_210DFFE10(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_210E00420(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__13533(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__13534(uint64_t a1)
{

}

uint64_t _MPCProtoContainerIdentifierSetReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t result;
  char v24;
  unsigned int v25;
  uint64_t v26;
  unint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  unsigned int v32;
  uint64_t v33;
  unint64_t v34;
  char v35;
  void *v36;
  uint64_t v37;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          v17 = 0;
          v18 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 72) |= 2u;
          while (1)
          {
            v20 = *v3;
            v21 = *(_QWORD *)(a2 + v20);
            if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
              break;
            v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
            *(_QWORD *)(a2 + v20) = v21 + 1;
            v19 |= (unint64_t)(v22 & 0x7F) << v17;
            if ((v22 & 0x80) == 0)
              goto LABEL_49;
            v17 += 7;
            v14 = v18++ >= 9;
            if (v14)
            {
              v19 = 0;
              goto LABEL_51;
            }
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_49:
          if (*(_BYTE *)(a2 + *v5))
            v19 = 0;
LABEL_51:
          v37 = 16;
          goto LABEL_60;
        case 2u:
          v24 = 0;
          v25 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 72) |= 4u;
          while (2)
          {
            v26 = *v3;
            v27 = *(_QWORD *)(a2 + v26);
            if (v27 == -1 || v27 >= *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v28 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v27);
              *(_QWORD *)(a2 + v26) = v27 + 1;
              v19 |= (unint64_t)(v28 & 0x7F) << v24;
              if (v28 < 0)
              {
                v24 += 7;
                v14 = v25++ >= 9;
                if (v14)
                {
                  v19 = 0;
                  goto LABEL_55;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v19 = 0;
LABEL_55:
          v37 = 24;
          goto LABEL_60;
        case 3u:
          PBReaderReadString();
          v29 = objc_claimAutoreleasedReturnValue();
          v30 = 56;
          goto LABEL_47;
        case 4u:
          PBReaderReadString();
          v29 = objc_claimAutoreleasedReturnValue();
          v30 = 64;
          goto LABEL_47;
        case 5u:
          v31 = 0;
          v32 = 0;
          v19 = 0;
          *(_BYTE *)(a1 + 72) |= 1u;
          break;
        case 6u:
          PBReaderReadString();
          v29 = objc_claimAutoreleasedReturnValue();
          v30 = 32;
          goto LABEL_47;
        case 7u:
          PBReaderReadString();
          v29 = objc_claimAutoreleasedReturnValue();
          v30 = 48;
          goto LABEL_47;
        case 8u:
          PBReaderReadString();
          v29 = objc_claimAutoreleasedReturnValue();
          v30 = 40;
LABEL_47:
          v36 = *(void **)(a1 + v30);
          *(_QWORD *)(a1 + v30) = v29;

          continue;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v33 = *v3;
        v34 = *(_QWORD *)(a2 + v33);
        if (v34 == -1 || v34 >= *(_QWORD *)(a2 + *v4))
          break;
        v35 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v34);
        *(_QWORD *)(a2 + v33) = v34 + 1;
        v19 |= (unint64_t)(v35 & 0x7F) << v31;
        if ((v35 & 0x80) == 0)
          goto LABEL_57;
        v31 += 7;
        v14 = v32++ >= 9;
        if (v14)
        {
          v19 = 0;
          goto LABEL_59;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_57:
      if (*(_BYTE *)(a2 + *v5))
        v19 = 0;
LABEL_59:
      v37 = 8;
LABEL_60:
      *(_QWORD *)(a1 + v37) = v19;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_210E02F44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__13843(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__13844(uint64_t a1)
{

}

void sub_210E0718C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_210E07840(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_210E07A44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_210E090D8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

uint64_t _MPCProtoDelegateInfoReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  int *v8;
  int *v9;
  char v10;
  unsigned int v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  BOOL v16;
  int v17;
  int v18;
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  unsigned int v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  char v38;
  void *v39;
  char v40;
  unsigned int v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  char v45;
  uint64_t result;
  char v47;
  unsigned int v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  char v52;
  int *v53;
  int *v54;
  _MPCProtoDelegateInfoTokenA *v55;
  uint64_t v56;
  char v57;
  unsigned int v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  char v62;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = &OBJC_IVAR___MPCPlaybackEngineEnvironmentConsumer__networkType;
  v8 = (int *)MEMORY[0x24BE7AF30];
  v9 = &OBJC_IVAR___MPCPlaybackEngineEnvironmentConsumer__networkType;
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    while (1)
    {
      v13 = *v3;
      v14 = *(_QWORD *)(a2 + v13);
      if (v14 == -1 || v14 >= *(_QWORD *)(a2 + *v4))
        break;
      v15 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v14);
      *(_QWORD *)(a2 + v13) = v14 + 1;
      v12 |= (unint64_t)(v15 & 0x7F) << v10;
      if ((v15 & 0x80) == 0)
        goto LABEL_12;
      v10 += 7;
      v16 = v11++ >= 9;
      if (v16)
      {
        v12 = 0;
        v17 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v17 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v12 = 0;
LABEL_14:
    v18 = v12 & 7;
    if (v17 || v18 == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v12 >> 3))
    {
      case 1u:
        v20 = 0;
        v21 = 0;
        v22 = 0;
        *(_BYTE *)(a1 + v7[38]) |= 2u;
        while (1)
        {
          v23 = *v3;
          v24 = *(_QWORD *)(a2 + v23);
          if (v24 == -1 || v24 >= *(_QWORD *)(a2 + *v4))
            break;
          v25 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v24);
          *(_QWORD *)(a2 + v23) = v24 + 1;
          v22 |= (unint64_t)(v25 & 0x7F) << v20;
          if ((v25 & 0x80) == 0)
            goto LABEL_75;
          v20 += 7;
          v16 = v21++ >= 9;
          if (v16)
          {
            v22 = 0;
            goto LABEL_77;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_75:
        if (*(_BYTE *)(a2 + *v5))
          v22 = 0;
LABEL_77:
        v56 = 40;
        goto LABEL_82;
      case 2u:
        v26 = 0;
        v27 = 0;
        v22 = 0;
        *(_BYTE *)(a1 + v7[38]) |= 1u;
        while (2)
        {
          v28 = *v3;
          v29 = *(_QWORD *)(a2 + v28);
          if (v29 == -1 || v29 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v30 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v29);
            *(_QWORD *)(a2 + v28) = v29 + 1;
            v22 |= (unint64_t)(v30 & 0x7F) << v26;
            if (v30 < 0)
            {
              v26 += 7;
              v16 = v27++ >= 9;
              if (v16)
              {
                v22 = 0;
                goto LABEL_81;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v22 = 0;
LABEL_81:
        v56 = 32;
LABEL_82:
        *(_QWORD *)(a1 + v56) = v22;
        goto LABEL_101;
      case 3u:
        PBReaderReadString();
        v31 = objc_claimAutoreleasedReturnValue();
        v32 = 104;
        goto LABEL_47;
      case 4u:
        PBReaderReadString();
        v31 = objc_claimAutoreleasedReturnValue();
        v32 = 48;
        goto LABEL_47;
      case 5u:
        PBReaderReadString();
        v31 = objc_claimAutoreleasedReturnValue();
        v32 = 56;
        goto LABEL_47;
      case 6u:
        v33 = 0;
        v34 = 0;
        v35 = 0;
        *(_BYTE *)(a1 + v7[38]) |= 4u;
        while (2)
        {
          v36 = *v3;
          v37 = *(_QWORD *)(a2 + v36);
          if (v37 == -1 || v37 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v38 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v37);
            *(_QWORD *)(a2 + v36) = v37 + 1;
            v35 |= (unint64_t)(v38 & 0x7F) << v33;
            if (v38 < 0)
            {
              v33 += 7;
              v16 = v34++ >= 9;
              if (v16)
              {
                LODWORD(v35) = 0;
                goto LABEL_86;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v35) = 0;
LABEL_86:
        *(_DWORD *)(a1 + 72) = v35;
        goto LABEL_101;
      case 7u:
        PBReaderReadString();
        v31 = objc_claimAutoreleasedReturnValue();
        v32 = 64;
        goto LABEL_47;
      case 8u:
        PBReaderReadString();
        v31 = objc_claimAutoreleasedReturnValue();
        v32 = 80;
LABEL_47:
        v39 = *(void **)(a1 + v32);
        *(_QWORD *)(a1 + v32) = v31;

        goto LABEL_101;
      case 9u:
        v40 = 0;
        v41 = 0;
        v42 = 0;
        *(_BYTE *)(a1 + v7[38]) |= 8u;
        while (2)
        {
          v43 = *v3;
          v44 = *(_QWORD *)(a2 + v43);
          if (v44 == -1 || v44 >= *(_QWORD *)(a2 + *v4))
          {
            *(_BYTE *)(a2 + *v5) = 1;
          }
          else
          {
            v45 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v44);
            *(_QWORD *)(a2 + v43) = v44 + 1;
            v42 |= (unint64_t)(v45 & 0x7F) << v40;
            if (v45 < 0)
            {
              v40 += 7;
              v16 = v41++ >= 9;
              if (v16)
              {
                v42 = 0;
                goto LABEL_90;
              }
              continue;
            }
          }
          break;
        }
        if (*(_BYTE *)(a2 + *v5))
          v42 = 0;
LABEL_90:
        *(_BYTE *)(a1 + 112) = v42 != 0;
        goto LABEL_101;
      case 0xAu:
        if (v18 == 2)
        {
          result = PBReaderPlaceMark();
          if (!(_DWORD)result)
            return result;
          while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4) && !*(_BYTE *)(a2 + *v5))
          {
            v47 = 0;
            v48 = 0;
            v49 = 0;
            while (1)
            {
              v50 = *v3;
              v51 = *(_QWORD *)(a2 + v50);
              if (v51 == -1 || v51 >= *(_QWORD *)(a2 + *v4))
                break;
              v52 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v51);
              *(_QWORD *)(a2 + v50) = v51 + 1;
              v49 |= (unint64_t)(v52 & 0x7F) << v47;
              if (v52 < 0)
              {
                v47 += 7;
                v16 = v48++ >= 9;
                if (!v16)
                  continue;
              }
              goto LABEL_67;
            }
            *(_BYTE *)(a2 + *v5) = 1;
LABEL_67:
            PBRepeatedInt32Add();
          }
          PBReaderRecallMark();
        }
        else
        {
          v57 = 0;
          v58 = 0;
          v59 = 0;
          while (1)
          {
            v60 = *v3;
            v61 = *(_QWORD *)(a2 + v60);
            if (v61 == -1 || v61 >= *(_QWORD *)(a2 + *v4))
              break;
            v62 = *(_BYTE *)(*(_QWORD *)(a2 + *v8) + v61);
            *(_QWORD *)(a2 + v60) = v61 + 1;
            v59 |= (unint64_t)(v62 & 0x7F) << v57;
            if (v62 < 0)
            {
              v57 += 7;
              v16 = v58++ >= 9;
              if (!v16)
                continue;
            }
            goto LABEL_100;
          }
          *(_BYTE *)(a2 + *v5) = 1;
LABEL_100:
          PBRepeatedInt32Add();
        }
        goto LABEL_101;
      case 0xBu:
        v53 = v9;
        v54 = v7;
        v55 = objc_alloc_init(_MPCProtoDelegateInfoTokenA);
        objc_storeStrong((id *)(a1 + 88), v55);
        if (!PBReaderPlaceMark() || (_MPCProtoDelegateInfoTokenAReadFrom((uint64_t)v55, a2) & 1) == 0)
          goto LABEL_104;
        goto LABEL_73;
      case 0xCu:
        v53 = v9;
        v54 = v7;
        v55 = objc_alloc_init(_MPCProtoDelegateInfoTokenE);
        objc_storeStrong((id *)(a1 + 96), v55);
        if (PBReaderPlaceMark() && (_MPCProtoDelegateInfoTokenEReadFrom((uint64_t)v55, a2) & 1) != 0)
        {
LABEL_73:
          PBReaderRecallMark();

          v7 = v54;
          v9 = v53;
LABEL_101:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_104:

        return 0;
      default:
        if ((PBReaderSkipValueWithTag() & 1) == 0)
          return 0;
        goto LABEL_101;
    }
  }
}

uint64_t _MPCProtoRadioContentReferenceLibraryArtistContentReferenceReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  uint64_t result;
  uint64_t v32;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        v20 = 0;
        v21 = 0;
        v22 = 0;
        *(_BYTE *)(a1 + 32) |= 2u;
        while (1)
        {
          v23 = *v3;
          v24 = *(_QWORD *)(a2 + v23);
          if (v24 == -1 || v24 >= *(_QWORD *)(a2 + *v4))
            break;
          v25 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v24);
          *(_QWORD *)(a2 + v23) = v24 + 1;
          v22 |= (unint64_t)(v25 & 0x7F) << v20;
          if ((v25 & 0x80) == 0)
            goto LABEL_39;
          v20 += 7;
          v14 = v21++ >= 9;
          if (v14)
          {
            v22 = 0;
            goto LABEL_41;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_39:
        if (*(_BYTE *)(a2 + *v5))
          v22 = 0;
LABEL_41:
        v32 = 16;
      }
      else
      {
        if ((_DWORD)v17 != 2)
        {
          if ((_DWORD)v17 == 1)
          {
            PBReaderReadString();
            v18 = objc_claimAutoreleasedReturnValue();
            v19 = *(void **)(a1 + 24);
            *(_QWORD *)(a1 + 24) = v18;

          }
          else
          {
            result = PBReaderSkipValueWithTag();
            if (!(_DWORD)result)
              return result;
          }
          continue;
        }
        v26 = 0;
        v27 = 0;
        v22 = 0;
        *(_BYTE *)(a1 + 32) |= 1u;
        while (1)
        {
          v28 = *v3;
          v29 = *(_QWORD *)(a2 + v28);
          if (v29 == -1 || v29 >= *(_QWORD *)(a2 + *v4))
            break;
          v30 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v29);
          *(_QWORD *)(a2 + v28) = v29 + 1;
          v22 |= (unint64_t)(v30 & 0x7F) << v26;
          if ((v30 & 0x80) == 0)
            goto LABEL_43;
          v26 += 7;
          v14 = v27++ >= 9;
          if (v14)
          {
            v22 = 0;
            goto LABEL_45;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_43:
        if (*(_BYTE *)(a2 + *v5))
          v22 = 0;
LABEL_45:
        v32 = 8;
      }
      *(_QWORD *)(a1 + v32) = v22;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_210E0E15C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_list va;

  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__15968(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__15969(uint64_t a1)
{

}

uint64_t inputRenderCallback(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int *a6)
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;

  v6 = *a6;
  if ((_DWORD)v6)
  {
    v7 = 0;
    v8 = 16 * v6;
    do
    {
      *(_OWORD *)&a6[v7 / 4 + 2] = *(_OWORD *)(*(_QWORD *)(a1 + 88) + v7 + 8);
      v7 += 16;
    }
    while (v8 != v7);
  }
  return 0;
}

void sub_210E151B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_210E166F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_210E18134(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  uint64_t v12;
  va_list va;

  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v12 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_210E1899C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__16650(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__16651(uint64_t a1)
{

}

void sub_210E1AFEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_210E1B58C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_210E1CD14(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_210E1E894(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_210E21F30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49)
{
  uint64_t v49;

  _Block_object_dispose(&a49, 8);
  _Block_object_dispose((const void *)(v49 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__17216(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__17217(uint64_t a1)
{

}

void sub_210E241B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_210E28574(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__18041(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__18042(uint64_t a1)
{

}

uint64_t _MPCProtoRadioContentReferenceStoreContentReferenceReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t result;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        break;
      if ((v10 >> 3) == 1)
      {
        v17 = 0;
        v18 = 0;
        v19 = 0;
        *(_BYTE *)(a1 + 16) |= 1u;
        while (1)
        {
          v20 = *v3;
          v21 = *(_QWORD *)(a2 + v20);
          if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
            break;
          v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
          *(_QWORD *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0)
            goto LABEL_29;
          v17 += 7;
          v14 = v18++ >= 9;
          if (v14)
          {
            v19 = 0;
            goto LABEL_31;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_29:
        if (*(_BYTE *)(a2 + *v5))
          v19 = 0;
LABEL_31:
        *(_QWORD *)(a1 + 8) = v19;
      }
      else
      {
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
      }
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

uint64_t _MPCProtoRadioContentReferenceLibraryItemContentReferenceReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  uint64_t v18;
  uint64_t v19;
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  char v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char v32;
  char v33;
  unsigned int v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  char v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  char v42;
  unsigned int v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  char v48;
  uint64_t v49;
  unint64_t v50;
  void *v51;
  char v52;
  unsigned int v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  char v58;
  uint64_t result;
  char v60;
  unsigned int v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  char v65;
  char v66;
  unsigned int v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  char v71;
  char v72;
  unsigned int v73;
  uint64_t v74;
  uint64_t v75;
  unint64_t v76;
  char v77;
  char v78;
  unsigned int v79;
  uint64_t v80;
  uint64_t v81;
  unint64_t v82;
  char v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        v13 = v12 + 1;
        if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
          break;
        v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v15 = v9++ >= 9;
        if (v15)
        {
          v10 = 0;
          v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v16 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 1u:
          PBReaderReadString();
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = 40;
          goto LABEL_60;
        case 2u:
          PBReaderReadString();
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = 56;
          goto LABEL_60;
        case 3u:
          PBReaderReadString();
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = 72;
          goto LABEL_60;
        case 4u:
          PBReaderReadString();
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = 80;
          goto LABEL_60;
        case 5u:
          v20 = 0;
          v21 = 0;
          v22 = 0;
          *(_WORD *)(a1 + 140) |= 0x40u;
          while (2)
          {
            v23 = *v3;
            v24 = *(_QWORD *)(a2 + v23);
            v25 = v24 + 1;
            if (v24 == -1 || v25 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v26 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v24);
              *(_QWORD *)(a2 + v23) = v25;
              v22 |= (unint64_t)(v26 & 0x7F) << v20;
              if (v26 < 0)
              {
                v20 += 7;
                v15 = v21++ >= 9;
                if (v15)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_101;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v22) = 0;
LABEL_101:
          v84 = 88;
          goto LABEL_135;
        case 6u:
          PBReaderReadString();
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = 96;
          goto LABEL_60;
        case 7u:
          v27 = 0;
          v28 = 0;
          v22 = 0;
          *(_WORD *)(a1 + 140) |= 0x10u;
          while (2)
          {
            v29 = *v3;
            v30 = *(_QWORD *)(a2 + v29);
            v31 = v30 + 1;
            if (v30 == -1 || v31 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v32 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v30);
              *(_QWORD *)(a2 + v29) = v31;
              v22 |= (unint64_t)(v32 & 0x7F) << v27;
              if (v32 < 0)
              {
                v27 += 7;
                v15 = v28++ >= 9;
                if (v15)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_105;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v22) = 0;
LABEL_105:
          v84 = 48;
          goto LABEL_135;
        case 8u:
          v33 = 0;
          v34 = 0;
          v22 = 0;
          *(_WORD *)(a1 + 140) |= 0x80u;
          while (2)
          {
            v35 = *v3;
            v36 = *(_QWORD *)(a2 + v35);
            v37 = v36 + 1;
            if (v36 == -1 || v37 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v38 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v36);
              *(_QWORD *)(a2 + v35) = v37;
              v22 |= (unint64_t)(v38 & 0x7F) << v33;
              if (v38 < 0)
              {
                v33 += 7;
                v15 = v34++ >= 9;
                if (v15)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_109;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v22) = 0;
LABEL_109:
          v84 = 104;
          goto LABEL_135;
        case 9u:
          *(_WORD *)(a1 + 140) |= 4u;
          v39 = *v3;
          v40 = *(_QWORD *)(a2 + v39);
          if (v40 <= 0xFFFFFFFFFFFFFFF7 && v40 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v41 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v40);
            *(_QWORD *)(a2 + v39) = v40 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v41 = 0;
          }
          v86 = 24;
          goto LABEL_140;
        case 0xAu:
          PBReaderReadString();
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = 112;
          goto LABEL_60;
        case 0xBu:
          v42 = 0;
          v43 = 0;
          v44 = 0;
          *(_WORD *)(a1 + 140) |= 0x400u;
          while (2)
          {
            v45 = *v3;
            v46 = *(_QWORD *)(a2 + v45);
            v47 = v46 + 1;
            if (v46 == -1 || v47 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v48 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v46);
              *(_QWORD *)(a2 + v45) = v47;
              v44 |= (unint64_t)(v48 & 0x7F) << v42;
              if (v48 < 0)
              {
                v42 += 7;
                v15 = v43++ >= 9;
                if (v15)
                {
                  v44 = 0;
                  goto LABEL_113;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v44 = 0;
LABEL_113:
          *(_BYTE *)(a1 + 136) = v44 != 0;
          continue;
        case 0xCu:
          *(_WORD *)(a1 + 140) |= 2u;
          v49 = *v3;
          v50 = *(_QWORD *)(a2 + v49);
          if (v50 <= 0xFFFFFFFFFFFFFFF7 && v50 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v41 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v50);
            *(_QWORD *)(a2 + v49) = v50 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v41 = 0;
          }
          v86 = 16;
LABEL_140:
          *(_QWORD *)(a1 + v86) = v41;
          continue;
        case 0xDu:
          PBReaderReadString();
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = 120;
LABEL_60:
          v51 = *(void **)(a1 + v19);
          *(_QWORD *)(a1 + v19) = v18;

          continue;
        case 0xEu:
          v52 = 0;
          v53 = 0;
          v54 = 0;
          *(_WORD *)(a1 + 140) |= 8u;
          while (2)
          {
            v55 = *v3;
            v56 = *(_QWORD *)(a2 + v55);
            v57 = v56 + 1;
            if (v56 == -1 || v57 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v58 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v56);
              *(_QWORD *)(a2 + v55) = v57;
              v54 |= (unint64_t)(v58 & 0x7F) << v52;
              if (v58 < 0)
              {
                v52 += 7;
                v15 = v53++ >= 9;
                if (v15)
                {
                  v54 = 0;
                  goto LABEL_117;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v54 = 0;
LABEL_117:
          v85 = 32;
          goto LABEL_122;
        case 0x10u:
          v60 = 0;
          v61 = 0;
          v54 = 0;
          *(_WORD *)(a1 + 140) |= 1u;
          while (2)
          {
            v62 = *v3;
            v63 = *(_QWORD *)(a2 + v62);
            v64 = v63 + 1;
            if (v63 == -1 || v64 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v65 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v63);
              *(_QWORD *)(a2 + v62) = v64;
              v54 |= (unint64_t)(v65 & 0x7F) << v60;
              if (v65 < 0)
              {
                v60 += 7;
                v15 = v61++ >= 9;
                if (v15)
                {
                  v54 = 0;
                  goto LABEL_121;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            v54 = 0;
LABEL_121:
          v85 = 8;
LABEL_122:
          *(_QWORD *)(a1 + v85) = v54;
          continue;
        case 0x11u:
          v66 = 0;
          v67 = 0;
          v22 = 0;
          *(_WORD *)(a1 + 140) |= 0x20u;
          while (2)
          {
            v68 = *v3;
            v69 = *(_QWORD *)(a2 + v68);
            v70 = v69 + 1;
            if (v69 == -1 || v70 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v71 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v69);
              *(_QWORD *)(a2 + v68) = v70;
              v22 |= (unint64_t)(v71 & 0x7F) << v66;
              if (v71 < 0)
              {
                v66 += 7;
                v15 = v67++ >= 9;
                if (v15)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_126;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v22) = 0;
LABEL_126:
          v84 = 64;
          goto LABEL_135;
        case 0x12u:
          v72 = 0;
          v73 = 0;
          v22 = 0;
          *(_WORD *)(a1 + 140) |= 0x100u;
          while (2)
          {
            v74 = *v3;
            v75 = *(_QWORD *)(a2 + v74);
            v76 = v75 + 1;
            if (v75 == -1 || v76 > *(_QWORD *)(a2 + *v4))
            {
              *(_BYTE *)(a2 + *v5) = 1;
            }
            else
            {
              v77 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v75);
              *(_QWORD *)(a2 + v74) = v76;
              v22 |= (unint64_t)(v77 & 0x7F) << v72;
              if (v77 < 0)
              {
                v72 += 7;
                v15 = v73++ >= 9;
                if (v15)
                {
                  LODWORD(v22) = 0;
                  goto LABEL_130;
                }
                continue;
              }
            }
            break;
          }
          if (*(_BYTE *)(a2 + *v5))
            LODWORD(v22) = 0;
LABEL_130:
          v84 = 128;
          goto LABEL_135;
        case 0x13u:
          v78 = 0;
          v79 = 0;
          v22 = 0;
          *(_WORD *)(a1 + 140) |= 0x200u;
          break;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v80 = *v3;
        v81 = *(_QWORD *)(a2 + v80);
        v82 = v81 + 1;
        if (v81 == -1 || v82 > *(_QWORD *)(a2 + *v4))
          break;
        v83 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v81);
        *(_QWORD *)(a2 + v80) = v82;
        v22 |= (unint64_t)(v83 & 0x7F) << v78;
        if ((v83 & 0x80) == 0)
          goto LABEL_132;
        v78 += 7;
        v15 = v79++ >= 9;
        if (v15)
        {
          LODWORD(v22) = 0;
          goto LABEL_134;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_132:
      if (*(_BYTE *)(a2 + *v5))
        LODWORD(v22) = 0;
LABEL_134:
      v84 = 132;
LABEL_135:
      *(_DWORD *)(a1 + v84) = v22;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_210E36848(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 112));
  _Unwind_Resume(a1);
}

void sub_210E37034(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  uint64_t v17;
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__19567(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__19568(uint64_t a1)
{

}

uint64_t _MPCProtoContainerReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  char v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t result;
  _MPCProtoContainerIdentifierSet *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) >= *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
    return *(_BYTE *)(a2 + *v5) == 0;
  v7 = (int *)MEMORY[0x24BE7AF30];
  while (2)
  {
    if (*(_BYTE *)(a2 + *v5))
      return *(_BYTE *)(a2 + *v5) == 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    while (1)
    {
      v11 = *v3;
      v12 = *(_QWORD *)(a2 + v11);
      if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
        break;
      v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
      *(_QWORD *)(a2 + v11) = v12 + 1;
      v10 |= (unint64_t)(v13 & 0x7F) << v8;
      if ((v13 & 0x80) == 0)
        goto LABEL_12;
      v8 += 7;
      v14 = v9++ >= 9;
      if (v14)
      {
        v10 = 0;
        v15 = *(unsigned __int8 *)(a2 + *v5);
        goto LABEL_14;
      }
    }
    *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
    v15 = *(unsigned __int8 *)(a2 + *v5);
    if (*(_BYTE *)(a2 + *v5))
      v10 = 0;
LABEL_14:
    if (v15 || (v10 & 7) == 4)
      return *(_BYTE *)(a2 + *v5) == 0;
    switch((v10 >> 3))
    {
      case 1u:
        v17 = 0;
        v18 = 0;
        v19 = 0;
        *(_BYTE *)(a1 + 48) |= 1u;
        while (1)
        {
          v20 = *v3;
          v21 = *(_QWORD *)(a2 + v20);
          if (v21 == -1 || v21 >= *(_QWORD *)(a2 + *v4))
            break;
          v22 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v21);
          *(_QWORD *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0)
            goto LABEL_38;
          v17 += 7;
          v14 = v18++ >= 9;
          if (v14)
          {
            LODWORD(v19) = 0;
            goto LABEL_40;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_38:
        if (*(_BYTE *)(a2 + *v5))
          LODWORD(v19) = 0;
LABEL_40:
        *(_DWORD *)(a1 + 8) = v19;
        goto LABEL_41;
      case 2u:
        v24 = objc_alloc_init(_MPCProtoContainerIdentifierSet);
        objc_storeStrong((id *)(a1 + 16), v24);
        if (!PBReaderPlaceMark() || (_MPCProtoContainerIdentifierSetReadFrom((uint64_t)v24, a2) & 1) == 0)
          goto LABEL_43;
        goto LABEL_33;
      case 3u:
        v24 = objc_alloc_init(_MPCProtoItem);
        -[_MPCProtoContainer addItem:](a1, v24);
        if (PBReaderPlaceMark() && (_MPCProtoItemReadFrom((uint64_t)v24, a2) & 1) != 0)
        {
LABEL_33:
          PBReaderRecallMark();

LABEL_41:
          if (*(_QWORD *)(a2 + *v3) >= *(_QWORD *)(a2 + *v4))
            return *(_BYTE *)(a2 + *v5) == 0;
          continue;
        }
LABEL_43:

        return 0;
      case 4u:
        PBReaderReadString();
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = 32;
        goto LABEL_36;
      case 5u:
        PBReaderReadString();
        v25 = objc_claimAutoreleasedReturnValue();
        v26 = 40;
LABEL_36:
        v27 = *(void **)(a1 + v26);
        *(_QWORD *)(a1 + v26) = v25;

        goto LABEL_41;
      default:
        result = PBReaderSkipValueWithTag();
        if (!(_DWORD)result)
          return result;
        goto LABEL_41;
    }
  }
}

void sub_210E3B7D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_210E3BD70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  uint64_t v17;
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__20125(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__20126(uint64_t a1)
{

}

void sub_210E3D4BC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_210E3DF18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_210E40104(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__20569(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__20570(uint64_t a1)
{

}

Class __getMFDebugOverlayControllerClass_block_invoke(uint64_t a1)
{
  uint64_t v2;
  Class result;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = MediaDebugUILibraryCore_frameworkLibrary;
  if (!MediaDebugUILibraryCore_frameworkLibrary)
  {
    v8 = xmmword_24CAB7590;
    v2 = _sl_dlopen();
    v5[3] = v2;
    MediaDebugUILibraryCore_frameworkLibrary = v2;
  }
  _Block_object_dispose(&v4, 8);
  result = objc_getClass("MFDebugOverlayController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getMFDebugOverlayControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_210E40250(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void *__Block_byref_object_copy__111(uint64_t a1, uint64_t a2)
{
  void *result;

  result = _Block_copy(*(const void **)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__112(uint64_t a1)
{

}

void _MPCMediaRemoteControllerAddCommandInfo(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a1;
  MPCRemoteCommandDescriptionCopy(a2);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("command"));

  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("commandName"));
  if (!MRMediaRemoteCommandInfoGetEnabled())
    objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], CFSTR("enabled"));
  v6 = (void *)MRMediaRemoteCommandInfoCopyOptions();
  if (objc_msgSend(v6, "count"))
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("options"));
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ (%d)"), v8, a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, v7);

}

void sub_210E44AE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  _Block_object_dispose(&a9, 8);
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__20890(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__20891(uint64_t a1)
{

}

void _MPCModelStorePlaybackItemsRequestConsumeStorePlatformDictionary(void *a1, void *a2, void *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6)
{
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  unint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  id obj;
  id v42;
  id v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  char v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t (*v59)(uint64_t, uint64_t);
  void (*v60)(uint64_t);
  id v61;
  uint8_t v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v8 = a1;
  v39 = a2;
  v40 = a3;
  v36 = (id)objc_msgSend(v8, "mutableCopy");
  v56 = 0;
  v57 = &v56;
  v58 = 0x3032000000;
  v59 = __Block_byref_object_copy__20890;
  v60 = __Block_byref_object_dispose__20891;
  v61 = 0;
  v50 = 0;
  v51 = &v50;
  v52 = 0x3032000000;
  v53 = __Block_byref_object_copy__20890;
  v54 = __Block_byref_object_dispose__20891;
  v55 = 0;
  v38 = v8;
  objc_msgSend(v8, "objectForKey:", CFSTR("kind"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (v35)
  {
    v49 = 0;
    MPStoreItemMetadataItemKindGetPlayabilityInformation();
  }
  objc_msgSend(v8, "objectForKey:", CFSTR("childrenIds"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSArray() && objc_msgSend(v37, "count"))
  {
    objc_msgSend(v8, "objectForKey:", CFSTR("children"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (_NSIsNSDictionary())
    {
      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      obj = v37;
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v62, 16);
      if (v10)
      {
        v11 = 0;
        v12 = *(_QWORD *)v46;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v46 != v12)
              objc_enumerationMutation(obj);
            v14 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * i);
            if ((_NSIsNSString() & 1) != 0)
            {
              objc_msgSend(v9, "objectForKey:", v14);
              v15 = (id)objc_claimAutoreleasedReturnValue();
              if ((_NSIsNSDictionary() & 1) != 0)
              {
                v43 = 0;
                v44 = 0;
                v42 = 0;
                _MPCModelStorePlaybackItemsRequestConsumeStorePlatformDictionary(v15, v39, v40, &v44, &v43, &v42);
                v16 = v44;
                v17 = v43;
                v18 = v42;
                if (objc_msgSend(v16, "count"))
                {
                  v19 = (void *)v57[5];
                  if (!v19)
                  {
                    v20 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 2);
                    v21 = (void *)v57[5];
                    v57[5] = v20;

                    v19 = (void *)v57[5];
                  }
                  objc_msgSend(v19, "addEntriesFromDictionary:", v16);
                }
                if (v17 != v15)
                {
                  if (!v11)
                  {
                    v22 = objc_alloc(MEMORY[0x24BDBCED8]);
                    v23 = objc_msgSend(v9, "count");
                    if (v23 >= 2)
                      v24 = 2;
                    else
                      v24 = v23;
                    v11 = (void *)objc_msgSend(v22, "initWithCapacity:", v24);
                  }
                  objc_msgSend(v11, "setObject:forKey:", v17, v14);
                }
                if (objc_msgSend(v18, "count"))
                {
                  v25 = (void *)v51[5];
                  if (!v25)
                  {
                    v26 = objc_alloc(MEMORY[0x24BDBCEB8]);
                    v27 = objc_msgSend(v9, "count");
                    if (v27 >= 2)
                      v28 = 2;
                    else
                      v28 = v27;
                    v29 = objc_msgSend(v26, "initWithCapacity:", v28);
                    v30 = (void *)v51[5];
                    v51[5] = v29;

                    v25 = (void *)v51[5];
                  }
                  objc_msgSend(v25, "addObjectsFromArray:", v18);
                }

              }
            }
          }
          v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v62, 16);
        }
        while (v10);

        if (v11)
          objc_msgSend(v36, "setObject:forKey:", v11, CFSTR("children"));
      }
      else
      {

        v11 = 0;
      }

    }
  }
  if (a4)
  {
    v31 = (void *)objc_msgSend((id)v57[5], "count");
    if (v31)
      v31 = (void *)v57[5];
    *a4 = objc_retainAutorelease(v31);
  }
  if (a5)
    *a5 = objc_retainAutorelease(v36);
  if (a6)
    *a6 = objc_retainAutorelease((id)v51[5]);

  _Block_object_dispose(&v50, 8);
  _Block_object_dispose(&v56, 8);

}

void sub_210E455E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53)
{
  _Block_object_dispose(&a47, 8);
  _Block_object_dispose(&a53, 8);
  _Unwind_Resume(a1);
}

void sub_210E46544(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_210E46608(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__21062(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__21063(uint64_t a1)
{

}

void sub_210E4B000(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 256), 8);
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__21491(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__21492(uint64_t a1)
{

}

void sub_210E4C560(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40)
{
  id *v40;
  uint64_t v41;

  _Block_object_dispose((const void *)(v41 - 224), 8);
  objc_destroyWeak(v40);
  _Block_object_dispose(&a40, 8);
  _Block_object_dispose((const void *)(v41 - 176), 8);
  _Unwind_Resume(a1);
}

void *__Block_byref_object_copy__21698(uint64_t a1, uint64_t a2)
{
  void *result;

  result = _Block_copy(*(const void **)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__21699(uint64_t a1)
{

}

void __Block_byref_object_copy__64(uint64_t a1, uint64_t a2)
{
  objc_moveWeak((id *)(a1 + 40), (id *)(a2 + 40));
}

void __Block_byref_object_dispose__65(uint64_t a1)
{
  objc_destroyWeak((id *)(a1 + 40));
}

void sub_210E4E4A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__21874(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__21875(uint64_t a1)
{

}

void sub_210E4F644(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_210E50810(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_210E54BF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a69;

  _Block_object_dispose(&a69, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__22101(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__22102(uint64_t a1)
{

}

void sub_210E56C5C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_210E57FF0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void _MPCHandleProcessTapBuffer(void *a1, OpaqueAudioQueue *a2, AudioQueueBuffer *a3, uint64_t a4, uint64_t a5, const AudioStreamPacketDescription *a6)
{
  void *v11;
  int v12;
  void *v13;
  id v14;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%p"), a1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)&_activeTapsLock);
  v12 = objc_msgSend((id)_activeTaps, "containsObject:", v11);
  os_unfair_lock_unlock((os_unfair_lock_t)&_activeTapsLock);

  if (v12)
  {
    v14 = a1;
    if (objc_msgSend(v14, "isEnabled"))
    {
      objc_msgSend(v14, "delegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "processAudioTapDidReceiveAudioSamples:numberOfSamples:", a3->mAudioData, a5);

      AudioQueueEnqueueBuffer(a2, a3, 0, a6);
    }

  }
}

void sub_210E5EA00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getSASelfLoggerClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  SiriAudioSupportLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("SASelfLogger");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getSASelfLoggerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getSASelfLoggerClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("MPCSiriSelfLogger.m"), 38, CFSTR("Unable to find class %s"), "SASelfLogger");

    __break(1u);
  }
}

void __getSASelfLoggerMWTMusicMetadataClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  SiriAudioSupportLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("SASelfLoggerMWTMusicMetadata");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getSASelfLoggerMWTMusicMetadataClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getSASelfLoggerMWTMusicMetadataClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("MPCSiriSelfLogger.m"), 39, CFSTR("Unable to find class %s"), "SASelfLoggerMWTMusicMetadata");

    __break(1u);
  }
}

void SiriAudioSupportLibrary()
{
  void *v0;
  void *v1;
  void *v2;

  if (!SiriAudioSupportLibraryCore_frameworkLibrary)
    SiriAudioSupportLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!SiriAudioSupportLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *SiriAudioSupportLibrary(void)");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("MPCSiriSelfLogger.m"), 37, CFSTR("%s"), 0);

    __break(1u);
    free(v2);
  }
}

uint64_t __Block_byref_object_copy__23624(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__23625(uint64_t a1)
{

}

__CFString *NSStringFromMPCPlayerAudioFormatTier(unint64_t a1)
{
  if (a1 < 5)
    return off_24CAB8758[a1];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unknown-%ld"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *NSStringFromMPCPlayerAudioRouteType(unint64_t a1)
{
  if (a1 < 0xA)
    return off_24CAB8780[a1];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unknown-%ld"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

const __CFString *NSStringFromMPCPlayerAudioFormatRenderingMode(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 4)
    return CFSTR("Unknown");
  else
    return off_24CAB8730[a1 - 1];
}

__CFString *NSStringFromMPCPlayerAudioFormatJustification(uint64_t a1)
{
  __CFString *v1;

  if (a1 <= 100)
  {
    switch(a1)
    {
      case 0:
        return CFSTR("Unknown");
      case 1:
        return CFSTR("Unavailable");
      case 100:
        return CFSTR("UserPreference");
    }
    goto LABEL_18;
  }
  if (a1 > 500)
  {
    if (a1 == 501)
      return CFSTR("RouteUnknownCompatibility");
    if (a1 == 1000)
      return CFSTR("BandwidthInsufficient");
    goto LABEL_18;
  }
  if (a1 == 101)
    return CFSTR("UserDownload");
  if (a1 != 500)
  {
LABEL_18:
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unknown-%ld"), a1);
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
    return v1;
  }
  v1 = CFSTR("RouteIncompatible");
  return v1;
}

uint64_t MPCPlayerAudioFormatRenderingModeFrom(uint64_t result)
{
  if ((unint64_t)(result - 1) >= 5)
    return 0;
  return result;
}

id NSStringComponentsFromMPCPlayerAudioFormatTierPreference(unint64_t a1)
{
  void *v2;
  unint64_t i;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 64; ++i)
  {
    if (((a1 >> i) & 1) != 0)
    {
      NSStringFromMPCPlayerAudioFormatTier(i);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "addObject:", v4);

    }
  }
  v5 = (void *)objc_msgSend(v2, "copy");

  return v5;
}

id _MPCJSONSanitizedValue(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v1 = a1;
  if (_NSIsNSArray())
  {
    objc_msgSend(v1, "msv_compactMap:", &__block_literal_global_295_24285);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v3 = v2;
    if (objc_msgSend(v2, "count"))
      v4 = v3;
    else
      v4 = 0;
    v5 = v4;

    goto LABEL_13;
  }
  if (_NSIsNSDictionary())
  {
    objc_msgSend(v1, "msv_compactMapValues:", &__block_literal_global_296);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if ((_NSIsNSNumber() & 1) != 0 || _NSIsNSString())
    v5 = v1;
  else
    v5 = 0;
LABEL_13:

  return v5;
}

uint64_t _MPCProtoRadioContentReferenceLibraryAlbumContentReferenceReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  BOOL v14;
  int v15;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  char v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  char v26;
  unsigned int v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  uint64_t result;
  uint64_t v32;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        return *(_BYTE *)(a2 + *v5) == 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        if (v12 == -1 || v12 >= *(_QWORD *)(a2 + *v4))
          break;
        v13 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v14 = v9++ >= 9;
        if (v14)
        {
          v10 = 0;
          v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v15 || (v10 & 7) == 4)
        return *(_BYTE *)(a2 + *v5) == 0;
      v17 = v10 >> 3;
      if ((v10 >> 3) == 3)
      {
        v20 = 0;
        v21 = 0;
        v22 = 0;
        *(_BYTE *)(a1 + 32) |= 2u;
        while (1)
        {
          v23 = *v3;
          v24 = *(_QWORD *)(a2 + v23);
          if (v24 == -1 || v24 >= *(_QWORD *)(a2 + *v4))
            break;
          v25 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v24);
          *(_QWORD *)(a2 + v23) = v24 + 1;
          v22 |= (unint64_t)(v25 & 0x7F) << v20;
          if ((v25 & 0x80) == 0)
            goto LABEL_39;
          v20 += 7;
          v14 = v21++ >= 9;
          if (v14)
          {
            v22 = 0;
            goto LABEL_41;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_39:
        if (*(_BYTE *)(a2 + *v5))
          v22 = 0;
LABEL_41:
        v32 = 16;
      }
      else
      {
        if ((_DWORD)v17 != 2)
        {
          if ((_DWORD)v17 == 1)
          {
            PBReaderReadString();
            v18 = objc_claimAutoreleasedReturnValue();
            v19 = *(void **)(a1 + 24);
            *(_QWORD *)(a1 + 24) = v18;

          }
          else
          {
            result = PBReaderSkipValueWithTag();
            if (!(_DWORD)result)
              return result;
          }
          continue;
        }
        v26 = 0;
        v27 = 0;
        v22 = 0;
        *(_BYTE *)(a1 + 32) |= 1u;
        while (1)
        {
          v28 = *v3;
          v29 = *(_QWORD *)(a2 + v28);
          if (v29 == -1 || v29 >= *(_QWORD *)(a2 + *v4))
            break;
          v30 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v29);
          *(_QWORD *)(a2 + v28) = v29 + 1;
          v22 |= (unint64_t)(v30 & 0x7F) << v26;
          if ((v30 & 0x80) == 0)
            goto LABEL_43;
          v26 += 7;
          v14 = v27++ >= 9;
          if (v14)
          {
            v22 = 0;
            goto LABEL_45;
          }
        }
        *(_BYTE *)(a2 + *v5) = 1;
LABEL_43:
        if (*(_BYTE *)(a2 + *v5))
          v22 = 0;
LABEL_45:
        v32 = 8;
      }
      *(_QWORD *)(a1 + v32) = v22;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_210E66F9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_210E697C0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__25444(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__25445(uint64_t a1)
{

}

_MPCProtoRadioContentReference *_MPCProtoRadioContentReferenceFromICRadioContentReference(void *a1)
{
  id v1;
  _MPCProtoRadioContentReference *v2;
  id v3;
  _MPCProtoRadioContentReferenceLibraryAlbumContentReference *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  int v27;
  NSString *v28;
  char v29;
  void *v30;
  int64_t v31;
  void *v32;
  int v33;
  id v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  int v45;
  void *v46;
  void *v47;
  int v48;
  void *v49;
  void *v50;
  int v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id obj;
  void *v59;
  void *v60;
  void *v61;
  void *v62;

  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = objc_alloc_init(_MPCProtoRadioContentReference);
    v3 = v1;
    v4 = objc_alloc_init(_MPCProtoRadioContentReferenceLibraryAlbumContentReference);
    objc_msgSend(v3, "albumName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "length") && v4)
      objc_storeStrong((id *)&v4->_albumName, v5);
    objc_msgSend(v3, "representativeCloudIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = objc_msgSend(v6, "longLongValue");
      if (v4)
      {
        *(_BYTE *)&v4->_has |= 1u;
        v4->_representativeItemCloudID = v8;
      }
    }
    objc_msgSend(v3, "storeIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = objc_msgSend(v9, "longLongValue");
      if (v4)
      {
        *(_BYTE *)&v4->_has |= 2u;
        v4->_storeAdamID = v11;
      }
    }
    if (!v2)
      goto LABEL_26;
    v12 = 8;
LABEL_25:
    objc_storeStrong((id *)((char *)&v2->super.super.isa + v12), v4);
LABEL_26:

    goto LABEL_27;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = objc_alloc_init(_MPCProtoRadioContentReference);
    v13 = v1;
    v4 = objc_alloc_init(_MPCProtoRadioContentReferenceLibraryArtistContentReference);
    objc_msgSend(v13, "artistName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "length") && v4)
      objc_storeStrong((id *)&v4->_albumName, v5);
    objc_msgSend(v13, "representativeCloudIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v14;
    if (v14)
    {
      v15 = objc_msgSend(v14, "longLongValue");
      if (v4)
      {
        *(_BYTE *)&v4->_has |= 1u;
        v4->_representativeItemCloudID = v15;
      }
    }
    objc_msgSend(v13, "storeIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v16;
    if (v16)
    {
      v17 = objc_msgSend(v16, "longLongValue");
      if (v4)
      {
        *(_BYTE *)&v4->_has |= 2u;
        v4->_storeAdamID = v17;
      }
    }
    if (!v2)
      goto LABEL_26;
    v12 = 16;
    goto LABEL_25;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = objc_alloc_init(_MPCProtoRadioContentReference);
    v19 = v1;
    v4 = objc_alloc_init(_MPCProtoRadioContentReferenceLibraryItemContentReference);
    objc_msgSend(v19, "albumArtistName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "length") && v4)
      objc_storeStrong((id *)&v4[1].super.super.isa, v5);
    objc_msgSend(v19, "albumName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v20, "length") && v4)
      objc_storeStrong((id *)&v4[1]._storeAdamID, v20);
    objc_msgSend(v19, "artistName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v21, "length") && v4)
      objc_storeStrong((id *)&v4[1]._has, v21);
    objc_msgSend(v19, "composerName");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v22, "length") && v4)
      objc_storeStrong((id *)&v4[2].super.super.isa, v22);
    objc_msgSend(v19, "copyright");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v23, "length") && v4)
      objc_storeStrong((id *)&v4[2]._storeAdamID, v23);
    objc_msgSend(v19, "discCount");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    if (v62)
    {
      v24 = objc_msgSend(v62, "integerValue");
      if (v4)
      {
        WORD2(v4[3]._storeAdamID) |= 0x10u;
        LODWORD(v4[1]._representativeItemCloudID) = v24;
      }
    }
    objc_msgSend(v19, "discNumber");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (v25)
    {
      v27 = objc_msgSend(v25, "integerValue");
      if (v4)
      {
        WORD2(v4[3]._storeAdamID) |= 0x80u;
        LODWORD(v4[2]._albumName) = v27;
      }
    }
    objc_msgSend(v19, "fileSize");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    if (v61)
    {
      objc_msgSend(v61, "doubleValue");
      if (v4)
      {
        WORD2(v4[3]._storeAdamID) |= 4u;
        v4->_albumName = v28;
      }
    }
    objc_msgSend(v19, "genreName");
    obj = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(obj, "length") && v4)
      objc_storeStrong((id *)&v4[2]._has, obj);
    v56 = v21;
    objc_msgSend(v19, "isCompilation");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    if (v60)
    {
      v29 = objc_msgSend(v60, "BOOLValue");
      if (v4)
      {
        WORD2(v4[3]._storeAdamID) |= 0x400u;
        LOBYTE(v4[3]._storeAdamID) = v29;
      }
    }
    v30 = v20;
    objc_msgSend(v19, "duration");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    if (v59)
    {
      objc_msgSend(v59, "doubleValue");
      if (v4)
      {
        WORD2(v4[3]._storeAdamID) |= 2u;
        v4->_storeAdamID = v31;
      }
    }
    objc_msgSend(v19, "kind");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = v32;
    if ((objc_msgSend(v32, "isEqualToString:", *MEMORY[0x24BEC8608]) & 1) != 0)
    {
      v33 = 2;
    }
    else if ((objc_msgSend(v32, "isEqualToString:", *MEMORY[0x24BEC8610]) & 1) != 0)
    {
      v33 = 1;
    }
    else if ((objc_msgSend(v32, "isEqualToString:", *MEMORY[0x24BEC8618]) & 1) != 0)
    {
      v33 = 3;
    }
    else if (objc_msgSend(v32, "isEqualToString:", *MEMORY[0x24BEC8620]))
    {
      v33 = 4;
    }
    else
    {
      v33 = 0;
    }
    v53 = v26;
    if (v4)
    {
      WORD2(v4[3]._storeAdamID) |= 0x40u;
      LODWORD(v4[2]._representativeItemCloudID) = v33;
    }
    v55 = v22;
    objc_msgSend(v19, "name");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v37, "length") && v4)
      objc_storeStrong((id *)&v4[3].super.super.isa, v37);
    v54 = v23;
    objc_msgSend(v19, "storeAdamIdentifier");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v38;
    if (v38)
    {
      v40 = objc_msgSend(v38, "longLongValue");
      if (v4)
      {
        WORD2(v4[3]._storeAdamID) |= 8u;
        *(_QWORD *)&v4->_has = v40;
      }
    }
    v57 = v30;
    objc_msgSend(v19, "storeCloudIdentifier");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v41;
    if (v41)
    {
      v43 = objc_msgSend(v41, "longLongValue");
      if (v4)
      {
        WORD2(v4[3]._storeAdamID) |= 1u;
        v4->_representativeItemCloudID = v43;
      }
    }
    objc_msgSend(v19, "trackCount");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (v44)
    {
      v45 = objc_msgSend(v62, "integerValue");
      if (v4)
      {
        WORD2(v4[3]._storeAdamID) |= 0x20u;
        LODWORD(v4[1]._albumName) = v45;
      }
    }
    objc_msgSend(v19, "trackNumber");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v46;
    if (v46)
    {
      v48 = objc_msgSend(v46, "integerValue");
      if (v4)
      {
        WORD2(v4[3]._storeAdamID) |= 0x100u;
        LODWORD(v4[3]._representativeItemCloudID) = v48;
      }
    }
    objc_msgSend(v19, "year");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v49;
    if (v49)
    {
      v51 = objc_msgSend(v49, "integerValue");
      if (v4)
      {
        WORD2(v4[3]._storeAdamID) |= 0x200u;
        HIDWORD(v4[3]._representativeItemCloudID) = v51;
      }
    }
    if (v2)
      objc_storeStrong((id *)&v2->_libraryItemContentReference, v4);

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v2 = 0;
      goto LABEL_28;
    }
    v2 = objc_alloc_init(_MPCProtoRadioContentReference);
    v34 = v1;
    v4 = objc_alloc_init(_MPCProtoRadioContentReferenceStoreContentReference);
    objc_msgSend(v34, "storeIdentifier");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v35;
    if (v35)
    {
      v36 = objc_msgSend(v35, "longLongValue");
      if (v4)
      {
        LOBYTE(v4->_storeAdamID) |= 1u;
        v4->_representativeItemCloudID = v36;
      }
    }
  }
LABEL_27:

LABEL_28:
  return v2;
}

id _MPCProtoRadioContentReferenceToICRadioContentReference(void *a1)
{
  _QWORD *v1;
  void *v2;
  void *v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  __int16 v27;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  unsigned int v34;
  __CFString *v35;
  const __CFString *v36;
  void *v37;
  id v38;
  uint64_t v39;
  void *v40;
  void *v41;
  __int16 v42;
  void *v43;
  void *v44;

  v1 = a1;
  v2 = v1;
  if (!v1)
    goto LABEL_39;
  v3 = (void *)v1[4];
  if (v3)
  {
    v4 = v3;
    if (v4[1])
    {
      v5 = (void *)MEMORY[0x24BEC8930];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "storeItemWithIdentifier:", v6);
      v7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_19:

      goto LABEL_20;
    }
    v7 = 0;
    goto LABEL_20;
  }
  v8 = (void *)v1[1];
  if (v8)
  {
    v4 = v8;
    v7 = objc_alloc_init(MEMORY[0x24BEC8950]);
    v9 = (void *)v4[3];
    if (v9)
    {
      v10 = v9;
      objc_msgSend(v7, "setAlbumName:", v10);

    }
    if (v4[2])
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setStoreIdentifier:", v11);

    }
    goto LABEL_17;
  }
  v12 = (void *)v1[2];
  if (!v12)
  {
    v16 = (void *)v1[3];
    if (v16)
    {
      v4 = v16;
      v7 = objc_alloc_init(MEMORY[0x24BEC8960]);
      v17 = (void *)v4[5];
      if (v17)
      {
        v18 = v17;
        objc_msgSend(v7, "setAlbumArtistName:", v18);

      }
      v19 = (void *)v4[7];
      if (v19)
      {
        v20 = v19;
        objc_msgSend(v7, "setAlbumName:", v20);

      }
      v21 = (void *)v4[9];
      if (v21)
      {
        v22 = v21;
        objc_msgSend(v7, "setArtistName:", v22);

      }
      v23 = (void *)v4[10];
      if (v23)
      {
        v24 = v23;
        objc_msgSend(v7, "setComposerName:", v24);

      }
      v25 = (void *)v4[12];
      if (v25)
      {
        v26 = v25;
        objc_msgSend(v7, "setCopyright:", v26);

      }
      v27 = *((_WORD *)v4 + 70);
      if ((v27 & 0x10) != 0)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *((unsigned int *)v4 + 12));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setDiscCount:", v29);

        v27 = *((_WORD *)v4 + 70);
        if ((v27 & 0x80) == 0)
        {
LABEL_34:
          if ((v27 & 4) == 0)
            goto LABEL_35;
          goto LABEL_43;
        }
      }
      else if ((v27 & 0x80) == 0)
      {
        goto LABEL_34;
      }
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *((unsigned int *)v4 + 26));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setDiscNumber:", v30);

      v27 = *((_WORD *)v4 + 70);
      if ((v27 & 4) == 0)
      {
LABEL_35:
        if ((v27 & 0x400) == 0)
          goto LABEL_36;
        goto LABEL_44;
      }
LABEL_43:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *((double *)v4 + 3));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setFileSize:", v31);

      v27 = *((_WORD *)v4 + 70);
      if ((v27 & 0x400) == 0)
      {
LABEL_36:
        if ((v27 & 2) == 0)
          goto LABEL_37;
        goto LABEL_45;
      }
LABEL_44:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *((unsigned __int8 *)v4 + 136));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setCompilation:", v32);

      v27 = *((_WORD *)v4 + 70);
      if ((v27 & 2) == 0)
      {
LABEL_37:
        if ((v27 & 0x40) == 0)
          goto LABEL_53;
        goto LABEL_46;
      }
LABEL_45:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *((double *)v4 + 2));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setDuration:", v33);

      if ((*((_WORD *)v4 + 70) & 0x40) == 0)
        goto LABEL_53;
LABEL_46:
      v34 = *((_DWORD *)v4 + 22) - 1;
      if (v34 > 3)
        v35 = 0;
      else
        v35 = (__CFString *)**((id **)&unk_24CAB9318 + v34);
      if (v35)
        v36 = v35;
      else
        v36 = &stru_24CABB5D0;
      objc_msgSend(v7, "setKind:", v36);

LABEL_53:
      v37 = (void *)v4[15];
      if (v37)
      {
        v38 = v37;
        objc_msgSend(v7, "setName:", v38);

      }
      v39 = v4[4];
      if (v39)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", v4[4]);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setStoreAdamIdentifier:", v40);

      }
      if (v4[1])
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", v39);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setStoreCloudIdentifier:", v41);

      }
      v42 = *((_WORD *)v4 + 70);
      if ((v42 & 0x20) != 0)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *((unsigned int *)v4 + 16));
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setTrackCount:", v43);

        v42 = *((_WORD *)v4 + 70);
        if ((v42 & 0x100) == 0)
        {
LABEL_61:
          if ((v42 & 0x200) == 0)
            goto LABEL_20;
          goto LABEL_65;
        }
      }
      else if ((*((_WORD *)v4 + 70) & 0x100) == 0)
      {
        goto LABEL_61;
      }
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *((unsigned int *)v4 + 32));
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setTrackNumber:", v44);

      if ((*((_WORD *)v4 + 70) & 0x200) == 0)
        goto LABEL_20;
LABEL_65:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *((unsigned int *)v4 + 33));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setYear:", v6);
      goto LABEL_19;
    }
LABEL_39:
    v7 = 0;
    goto LABEL_40;
  }
  v4 = v12;
  v7 = objc_alloc_init(MEMORY[0x24BEC8958]);
  v13 = (void *)v4[3];
  if (v13)
  {
    v14 = v13;
    objc_msgSend(v7, "setArtistName:", v14);

  }
  if (v4[2])
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setStoreIdentifier:", v15);

  }
LABEL_17:
  if (v4[1])
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setRepresentativeCloudIdentifier:", v6);
    goto LABEL_19;
  }
LABEL_20:

LABEL_40:
  return v7;
}

void sub_210E71024(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  uint64_t v39;

  _Block_object_dispose(&a39, 8);
  _Block_object_dispose((const void *)(v39 - 240), 8);
  _Block_object_dispose((const void *)(v39 - 192), 8);
  _Block_object_dispose((const void *)(v39 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__27020(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__27021(uint64_t a1)
{

}

void sub_210E71688(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_210E73254(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a37, 8);
  _Unwind_Resume(a1);
}

void _MPCAudioTapInit_27320(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  *a3 = a2;
}

void _MPCAudioTapFinalize_27321(const opaqueMTAudioProcessingTap *a1)
{
  id v2;

  MTAudioProcessingTapGetStorage(a1);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "finalizeTap:", a1);

}

void _MPCAudioTapPrepareCallback_27322(const opaqueMTAudioProcessingTap *a1, uint64_t a2, uint64_t a3)
{
  id v6;

  MTAudioProcessingTapGetStorage(a1);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "prepareTap:maxFrames:processingFormat:", a1, a2, a3);

}

void _MPCAudioTapProcess_27323(const opaqueMTAudioProcessingTap *a1, CMItemCount a2, uint64_t a3, AudioBufferList *a4, CMItemCount *a5, MTAudioProcessingTapFlags *a6)
{
  void *v12;
  CMTimeValue value;
  NSObject *v14;
  void *v15;
  int v16;
  MTAudioProcessingTapFlags v17;
  NSObject *v18;
  NSObject *v19;
  _BOOL4 v20;
  CMItemCount v21;
  CMTimeRange timeRangeOut;
  uint8_t buf[4];
  CMTimeValue v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  _BOOL4 v28;
  __int16 v29;
  int v30;
  __int16 v31;
  CMItemCount v32;
  __int16 v33;
  CMItemCount v34;
  __int16 v35;
  int v36;
  __int16 v37;
  int v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  MTAudioProcessingTapGetStorage(a1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  memset(&timeRangeOut, 0, sizeof(timeRangeOut));
  MTAudioProcessingTapGetSourceAudio(a1, a2, a4, a6, &timeRangeOut, a5);
  if ((timeRangeOut.start.flags & 1) != 0)
  {
    value = -1;
    if ((timeRangeOut.duration.flags & 1) != 0
      && !timeRangeOut.duration.epoch
      && (timeRangeOut.duration.value & 0x8000000000000000) == 0)
    {
      value = timeRangeOut.start.value;
      if (timeRangeOut.start.value <= -2)
      {
        v14 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134218240;
          v24 = value;
          v25 = 2048;
          v26 = _MPCAudioTapProcess_lastIndex + a2;
          _os_log_impl(&dword_210BD8000, v14, OS_LOG_TYPE_DEFAULT, "[AP] - correcting time range start for tap: %lld -> %lld", buf, 0x16u);
        }

        value = _MPCAudioTapProcess_lastIndex + a2;
      }
    }
  }
  else
  {
    value = -1;
  }
  objc_msgSend(MEMORY[0x24BDDCB28], "standardUserDefaults");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "vocalAttenuationLogInputAndOuputRMSValues");

  if (v16)
  {
    v17 = *a6;
    v18 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_210BD8000, v18, OS_LOG_TYPE_DEFAULT, "[AP][DEBUG] ======================================================================================================", buf, 2u);
    }

    v19 = os_log_create("com.apple.amp.mediaplaybackcore", "Playback");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      if ((timeRangeOut.start.flags & 1) != 0)
      {
        v20 = 0;
        if ((timeRangeOut.duration.flags & 1) != 0 && !timeRangeOut.duration.epoch)
          v20 = timeRangeOut.duration.value >= 0;
      }
      else
      {
        v20 = 0;
      }
      v21 = *a5;
      *(_DWORD *)buf = 134219776;
      v24 = value;
      v25 = 2048;
      v26 = value - _MPCAudioTapProcess_lastIndex;
      v27 = 1024;
      v28 = v20;
      v29 = 1024;
      v30 = timeRangeOut.start.flags & 1;
      v31 = 2048;
      v32 = a2;
      v33 = 2048;
      v34 = v21;
      v35 = 1024;
      v36 = (v17 >> 8) & 1;
      v37 = 1024;
      v38 = (v17 >> 9) & 1;
      _os_log_impl(&dword_210BD8000, v19, OS_LOG_TYPE_DEFAULT, "[AP][DEBUG] - start: %lld - delta: %lld - valid range: %{BOOL}u - valid time: %{BOOL}u - numberFrames: %ld - numberFramesOut: %ld - startOfStream: %{BOOL}u - endOfStream: %{BOOL}u", buf, 0x42u);
    }

  }
  _MPCAudioTapProcess_lastIndex = value;
  objc_msgSend(v12, "processTap:sampleIndex:numberFrames:flags:audioBufferList:numberFramesOut:flagsOut:", a1, value, a2, a3, a4, a5, a6);

}

void _MPCAudioTapUnprepareCallback_27324(const opaqueMTAudioProcessingTap *a1)
{
  id v2;

  MTAudioProcessingTapGetStorage(a1);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unprepareTap:", a1);

}

uint64_t __Block_byref_object_copy__27334(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__27335(uint64_t a1)
{

}

uint64_t _MPCProtoDelegateInfoTokenEReadFrom(uint64_t a1, uint64_t a2)
{
  int *v3;
  int *v4;
  int *v5;
  int *v7;
  char v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;
  void *v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  char v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char v31;

  v3 = (int *)MEMORY[0x24BE7AF60];
  v4 = (int *)MEMORY[0x24BE7AF50];
  v5 = (int *)MEMORY[0x24BE7AF48];
  if (*(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF60]) < *(_QWORD *)(a2 + (int)*MEMORY[0x24BE7AF50]))
  {
    v7 = (int *)MEMORY[0x24BE7AF30];
    do
    {
      if (*(_BYTE *)(a2 + *v5))
        break;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        v11 = *v3;
        v12 = *(_QWORD *)(a2 + v11);
        v13 = v12 + 1;
        if (v12 == -1 || v13 > *(_QWORD *)(a2 + *v4))
          break;
        v14 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v12);
        *(_QWORD *)(a2 + v11) = v13;
        v10 |= (unint64_t)(v14 & 0x7F) << v8;
        if ((v14 & 0x80) == 0)
          goto LABEL_12;
        v8 += 7;
        v15 = v9++ >= 9;
        if (v15)
        {
          v10 = 0;
          v16 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_12:
      v16 = *(unsigned __int8 *)(a2 + *v5);
      if (*(_BYTE *)(a2 + *v5))
        v10 = 0;
LABEL_14:
      if (v16 || (v10 & 7) == 4)
        break;
      switch((v10 >> 3))
      {
        case 0u:
          PBReaderReadData();
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = 24;
          goto LABEL_23;
        case 1u:
          PBReaderReadString();
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = 32;
LABEL_23:
          v21 = *(void **)(a1 + v19);
          *(_QWORD *)(a1 + v19) = v18;

          continue;
        case 2u:
          *(_BYTE *)(a1 + 40) |= 1u;
          v22 = *v3;
          v23 = *(_QWORD *)(a2 + v22);
          if (v23 <= 0xFFFFFFFFFFFFFFF7 && v23 + 8 <= *(_QWORD *)(a2 + *v4))
          {
            v24 = *(_QWORD *)(*(_QWORD *)(a2 + *v7) + v23);
            *(_QWORD *)(a2 + v22) = v23 + 8;
          }
          else
          {
            *(_BYTE *)(a2 + *v5) = 1;
            v24 = 0;
          }
          *(_QWORD *)(a1 + 8) = v24;
          continue;
        case 3u:
          v25 = 0;
          v26 = 0;
          v27 = 0;
          *(_BYTE *)(a1 + 40) |= 2u;
          break;
        default:
          result = PBReaderSkipValueWithTag();
          if (!(_DWORD)result)
            return result;
          continue;
      }
      while (1)
      {
        v28 = *v3;
        v29 = *(_QWORD *)(a2 + v28);
        v30 = v29 + 1;
        if (v29 == -1 || v30 > *(_QWORD *)(a2 + *v4))
          break;
        v31 = *(_BYTE *)(*(_QWORD *)(a2 + *v7) + v29);
        *(_QWORD *)(a2 + v28) = v30;
        v27 |= (unint64_t)(v31 & 0x7F) << v25;
        if ((v31 & 0x80) == 0)
          goto LABEL_35;
        v25 += 7;
        v15 = v26++ >= 9;
        if (v15)
        {
          v27 = 0;
          goto LABEL_37;
        }
      }
      *(_BYTE *)(a2 + *v5) = 1;
LABEL_35:
      if (*(_BYTE *)(a2 + *v5))
        v27 = 0;
LABEL_37:
      *(_QWORD *)(a1 + 16) = v27;
    }
    while (*(_QWORD *)(a2 + *v3) < *(_QWORD *)(a2 + *v4));
  }
  return *(_BYTE *)(a2 + *v5) == 0;
}

void sub_210E751C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  _Block_object_dispose(&a37, 8);
  _Unwind_Resume(a1);
}

id getAFSecurityConnectionClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getAFSecurityConnectionClass_softClass;
  v7 = getAFSecurityConnectionClass_softClass;
  if (!getAFSecurityConnectionClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getAFSecurityConnectionClass_block_invoke;
    v3[3] = &unk_24CAB9A48;
    v3[4] = &v4;
    __getAFSecurityConnectionClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_210E75298(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAFSecurityConnectionClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!AssistantServicesLibraryCore_frameworkLibrary)
    AssistantServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!AssistantServicesLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *AssistantServicesLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("MPCAssistantEncodings.m"), 16, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("AFSecurityConnection");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getAFSecurityConnectionClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("MPCAssistantEncodings.m"), 17, CFSTR("Unable to find class %s"), "AFSecurityConnection");

LABEL_8:
    __break(1u);
  }
  getAFSecurityConnectionClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_210E7663C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_210E769A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_210E76B14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__27759(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__27760(uint64_t a1)
{

}

uint64_t MPCRadioPlaybackErrorGetCategory(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "userInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("MPCRadioPlaybackErrorCategoryKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSNumber())
    v3 = objc_msgSend(v2, "integerValue");
  else
    v3 = 0;

  return v3;
}

uint64_t __Block_byref_object_copy__27856(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__27857(uint64_t a1)
{

}

void sub_210E7E990(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_210E81B2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_210E82874(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_210E8331C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__28558(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__28559(uint64_t a1)
{

}

void sub_210E89B34(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  _Unwind_Resume(exception_object);
}

void sub_210E8A1D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__29048(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__29049(uint64_t a1)
{

}

void sub_210E8C898(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose(&STACK[0x430], 8);
  _Block_object_dispose(&STACK[0x368], 8);
  _Block_object_dispose((const void *)(v1 - 240), 8);
  _Unwind_Resume(a1);
}

void sub_210E8D0B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  uint64_t v27;

  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 192), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__29443(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__29444(uint64_t a1)
{

}

void sub_210E9166C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_210E91768()
{
  return MEMORY[0x24BEC68E8]();
}

uint64_t sub_210E91774()
{
  return MEMORY[0x24BEC68F8]();
}

uint64_t sub_210E91780()
{
  return MEMORY[0x24BEC6908]();
}

uint64_t sub_210E9178C()
{
  return MEMORY[0x24BEC6928]();
}

uint64_t sub_210E91798()
{
  return MEMORY[0x24BEC6938]();
}

uint64_t sub_210E917A4()
{
  return MEMORY[0x24BEC6940]();
}

uint64_t sub_210E917B0()
{
  return MEMORY[0x24BEC6950]();
}

uint64_t sub_210E917BC()
{
  return MEMORY[0x24BEC6960]();
}

uint64_t sub_210E917C8()
{
  return MEMORY[0x24BEC6978]();
}

uint64_t sub_210E917D4()
{
  return MEMORY[0x24BEC6988]();
}

uint64_t sub_210E917E0()
{
  return MEMORY[0x24BEC6990]();
}

uint64_t sub_210E917EC()
{
  return MEMORY[0x24BEC6998]();
}

uint64_t sub_210E917F8()
{
  return MEMORY[0x24BEC69B0]();
}

uint64_t sub_210E91804()
{
  return MEMORY[0x24BEC69D8]();
}

uint64_t sub_210E91810()
{
  return MEMORY[0x24BEC69E8]();
}

uint64_t sub_210E9181C()
{
  return MEMORY[0x24BEC6A08]();
}

uint64_t sub_210E91828()
{
  return MEMORY[0x24BEC6A18]();
}

uint64_t sub_210E91834()
{
  return MEMORY[0x24BEC6A38]();
}

uint64_t sub_210E91840()
{
  return MEMORY[0x24BEC6A48]();
}

uint64_t sub_210E9184C()
{
  return MEMORY[0x24BEC6A70]();
}

uint64_t sub_210E91858()
{
  return MEMORY[0x24BEC6A80]();
}

uint64_t sub_210E91864()
{
  return MEMORY[0x24BEC6A90]();
}

uint64_t sub_210E91870()
{
  return MEMORY[0x24BEC6A98]();
}

uint64_t sub_210E9187C()
{
  return MEMORY[0x24BEC6AA0]();
}

uint64_t sub_210E91888()
{
  return MEMORY[0x24BEC6AA8]();
}

uint64_t sub_210E91894()
{
  return MEMORY[0x24BEC6AB8]();
}

uint64_t sub_210E918A0()
{
  return MEMORY[0x24BEC6AC0]();
}

uint64_t sub_210E918AC()
{
  return MEMORY[0x24BEC6AC8]();
}

uint64_t sub_210E918B8()
{
  return MEMORY[0x24BEC6AE0]();
}

uint64_t sub_210E918C4()
{
  return MEMORY[0x24BEC6AE8]();
}

uint64_t sub_210E918D0()
{
  return MEMORY[0x24BEC6AF0]();
}

uint64_t sub_210E918DC()
{
  return MEMORY[0x24BEC6AF8]();
}

uint64_t sub_210E918E8()
{
  return MEMORY[0x24BEC6B08]();
}

uint64_t sub_210E918F4()
{
  return MEMORY[0x24BEC6B10]();
}

uint64_t sub_210E91900()
{
  return MEMORY[0x24BEC6B18]();
}

uint64_t sub_210E9190C()
{
  return MEMORY[0x24BEC6B20]();
}

uint64_t sub_210E91918()
{
  return MEMORY[0x24BEC6B28]();
}

uint64_t sub_210E91924()
{
  return MEMORY[0x24BEC6B30]();
}

uint64_t sub_210E91930()
{
  return MEMORY[0x24BEC6B38]();
}

uint64_t sub_210E9193C()
{
  return MEMORY[0x24BEC6B60]();
}

uint64_t sub_210E91948()
{
  return MEMORY[0x24BEC6B78]();
}

uint64_t sub_210E91954()
{
  return MEMORY[0x24BEC6B80]();
}

uint64_t sub_210E91960()
{
  return MEMORY[0x24BEC6B88]();
}

uint64_t sub_210E9196C()
{
  return MEMORY[0x24BEC6BA8]();
}

uint64_t sub_210E91978()
{
  return MEMORY[0x24BEC6BC8]();
}

uint64_t sub_210E91984()
{
  return MEMORY[0x24BEC6BD0]();
}

uint64_t sub_210E91990()
{
  return MEMORY[0x24BEC6BE0]();
}

uint64_t sub_210E9199C()
{
  return MEMORY[0x24BEC6BE8]();
}

uint64_t sub_210E919A8()
{
  return MEMORY[0x24BEC6C00]();
}

uint64_t sub_210E919B4()
{
  return MEMORY[0x24BEC6C08]();
}

uint64_t sub_210E919C0()
{
  return MEMORY[0x24BEC6C20]();
}

uint64_t sub_210E919CC()
{
  return MEMORY[0x24BEC6C30]();
}

uint64_t sub_210E919D8()
{
  return MEMORY[0x24BEC6C40]();
}

uint64_t sub_210E919E4()
{
  return MEMORY[0x24BEC6C50]();
}

uint64_t sub_210E919F0()
{
  return MEMORY[0x24BEC6C88]();
}

uint64_t sub_210E919FC()
{
  return MEMORY[0x24BEC6C90]();
}

uint64_t sub_210E91A08()
{
  return MEMORY[0x24BEC6CA8]();
}

uint64_t sub_210E91A14()
{
  return MEMORY[0x24BEC6CD0]();
}

uint64_t sub_210E91A20()
{
  return MEMORY[0x24BEC6CD8]();
}

uint64_t sub_210E91A2C()
{
  return MEMORY[0x24BEC6CE0]();
}

uint64_t sub_210E91A38()
{
  return MEMORY[0x24BEC6CF0]();
}

uint64_t sub_210E91A44()
{
  return MEMORY[0x24BEC6CF8]();
}

uint64_t sub_210E91A50()
{
  return MEMORY[0x24BEC6D00]();
}

uint64_t sub_210E91A5C()
{
  return MEMORY[0x24BEC6D08]();
}

uint64_t sub_210E91A68()
{
  return MEMORY[0x24BEC6D10]();
}

uint64_t sub_210E91A74()
{
  return MEMORY[0x24BEC6D18]();
}

uint64_t sub_210E91A80()
{
  return MEMORY[0x24BEC6D20]();
}

uint64_t sub_210E91A8C()
{
  return MEMORY[0x24BEC6D28]();
}

uint64_t sub_210E91A98()
{
  return MEMORY[0x24BEC6D30]();
}

uint64_t sub_210E91AA4()
{
  return MEMORY[0x24BDCAF28]();
}

uint64_t sub_210E91AB0()
{
  return MEMORY[0x24BDCB8E8]();
}

uint64_t sub_210E91ABC()
{
  return MEMORY[0x24BDCB910]();
}

uint64_t sub_210E91AC8()
{
  return MEMORY[0x24BDCB918]();
}

uint64_t sub_210E91AD4()
{
  return MEMORY[0x24BDCB930]();
}

uint64_t sub_210E91AE0()
{
  return MEMORY[0x24BDCCA20]();
}

uint64_t sub_210E91AEC()
{
  return MEMORY[0x24BDCCA40]();
}

uint64_t sub_210E91AF8()
{
  return MEMORY[0x24BDCCA48]();
}

uint64_t sub_210E91B04()
{
  return MEMORY[0x24BDCD258]();
}

uint64_t sub_210E91B10()
{
  return MEMORY[0x24BDCD280]();
}

uint64_t sub_210E91B1C()
{
  return MEMORY[0x24BDCD288]();
}

uint64_t sub_210E91B28()
{
  return MEMORY[0x24BDCD290]();
}

uint64_t sub_210E91B34()
{
  return MEMORY[0x24BDCD298]();
}

uint64_t sub_210E91B40()
{
  return MEMORY[0x24BDCD2A0]();
}

uint64_t sub_210E91B4C()
{
  return MEMORY[0x24BDCD2A8]();
}

uint64_t sub_210E91B58()
{
  return MEMORY[0x24BDCD2B8]();
}

uint64_t sub_210E91B64()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_210E91B70()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_210E91B7C()
{
  return MEMORY[0x24BDCD4C8]();
}

uint64_t sub_210E91B88()
{
  return MEMORY[0x24BDCD4D0]();
}

uint64_t sub_210E91B94()
{
  return MEMORY[0x24BDCD4D8]();
}

uint64_t sub_210E91BA0()
{
  return MEMORY[0x24BDCD590]();
}

uint64_t sub_210E91BAC()
{
  return MEMORY[0x24BDCD598]();
}

uint64_t sub_210E91BB8()
{
  return MEMORY[0x24BDCD5A8]();
}

uint64_t sub_210E91BC4()
{
  return MEMORY[0x24BDCD728]();
}

uint64_t sub_210E91BD0()
{
  return MEMORY[0x24BDCD748]();
}

uint64_t sub_210E91BDC()
{
  return MEMORY[0x24BE72FF0]();
}

uint64_t sub_210E91BE8()
{
  return MEMORY[0x24BE72FF8]();
}

uint64_t sub_210E91BF4()
{
  return MEMORY[0x24BDCD7B8]();
}

uint64_t sub_210E91C00()
{
  return MEMORY[0x24BDCD810]();
}

uint64_t sub_210E91C0C()
{
  return MEMORY[0x24BDCD820]();
}

uint64_t sub_210E91C18()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_210E91C24()
{
  return MEMORY[0x24BDCD918]();
}

uint64_t sub_210E91C30()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_210E91C3C()
{
  return MEMORY[0x24BDCD9F8]();
}

uint64_t sub_210E91C48()
{
  return MEMORY[0x24BDCDA68]();
}

uint64_t sub_210E91C54()
{
  return MEMORY[0x24BDCDAA0]();
}

uint64_t sub_210E91C60()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_210E91C6C()
{
  return MEMORY[0x24BDCDB78]();
}

uint64_t sub_210E91C78()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_210E91C84()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_210E91C90()
{
  return MEMORY[0x24BDCDE78]();
}

uint64_t sub_210E91C9C()
{
  return MEMORY[0x24BDCDE90]();
}

uint64_t sub_210E91CA8()
{
  return MEMORY[0x24BDCDE98]();
}

uint64_t sub_210E91CB4()
{
  return MEMORY[0x24BDCE5D8]();
}

uint64_t sub_210E91CC0()
{
  return MEMORY[0x24BDCE610]();
}

uint64_t sub_210E91CCC()
{
  return MEMORY[0x24BDCE780]();
}

uint64_t sub_210E91CD8()
{
  return MEMORY[0x24BDCE878]();
}

uint64_t sub_210E91CE4()
{
  return MEMORY[0x24BDCE8F8]();
}

uint64_t sub_210E91CF0()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_210E91CFC()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_210E91D08()
{
  return MEMORY[0x24BDCE9F8]();
}

uint64_t sub_210E91D14()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_210E91D20()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_210E91D2C()
{
  return MEMORY[0x24BDCEB18]();
}

uint64_t sub_210E91D38()
{
  return MEMORY[0x24BDCEB20]();
}

uint64_t sub_210E91D44()
{
  return MEMORY[0x24BDCEC88]();
}

uint64_t sub_210E91D50()
{
  return MEMORY[0x24BDCECD8]();
}

uint64_t sub_210E91D5C()
{
  return MEMORY[0x24BDCED58]();
}

uint64_t sub_210E91D68()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_210E91D74()
{
  return MEMORY[0x24BDCF338]();
}

uint64_t sub_210E91D80()
{
  return MEMORY[0x24BDCF368]();
}

uint64_t sub_210E91D8C()
{
  return MEMORY[0x24BDCF428]();
}

uint64_t sub_210E91D98()
{
  return MEMORY[0x24BDCF638]();
}

uint64_t sub_210E91DA4()
{
  return MEMORY[0x24BEBBE90]();
}

uint64_t sub_210E91DB0()
{
  return MEMORY[0x24BEBBEB8]();
}

uint64_t sub_210E91DBC()
{
  return MEMORY[0x24BDCF678]();
}

uint64_t sub_210E91DC8()
{
  return MEMORY[0x24BE7BC68]();
}

uint64_t sub_210E91DD4()
{
  return MEMORY[0x24BE7BC70]();
}

uint64_t sub_210E91DE0()
{
  return MEMORY[0x24BE7BC78]();
}

uint64_t sub_210E91DEC()
{
  return MEMORY[0x24BE7BC80]();
}

uint64_t sub_210E91DF8()
{
  return MEMORY[0x24BE7BC88]();
}

uint64_t sub_210E91E04()
{
  return MEMORY[0x24BE7BC90]();
}

uint64_t sub_210E91E10()
{
  return MEMORY[0x24BE7BC98]();
}

uint64_t sub_210E91E1C()
{
  return MEMORY[0x24BE7BCA0]();
}

uint64_t sub_210E91E28()
{
  return MEMORY[0x24BE7BCB0]();
}

uint64_t sub_210E91E34()
{
  return MEMORY[0x24BE7BD18]();
}

uint64_t sub_210E91E40()
{
  return MEMORY[0x24BE7BD28]();
}

uint64_t sub_210E91E4C()
{
  return MEMORY[0x24BE7BD40]();
}

uint64_t sub_210E91E58()
{
  return MEMORY[0x24BE7BD48]();
}

uint64_t sub_210E91E64()
{
  return MEMORY[0x24BEDF378]();
}

uint64_t sub_210E91E70()
{
  return MEMORY[0x24BEDF3A0]();
}

uint64_t sub_210E91E7C()
{
  return MEMORY[0x24BEDF3B0]();
}

uint64_t sub_210E91E88()
{
  return MEMORY[0x24BEDF3C0]();
}

uint64_t sub_210E91E94()
{
  return MEMORY[0x24BEDF3C8]();
}

uint64_t sub_210E91EA0()
{
  return MEMORY[0x24BEDF3D8]();
}

uint64_t sub_210E91EAC()
{
  return MEMORY[0x24BEDF3F8]();
}

uint64_t sub_210E91EB8()
{
  return MEMORY[0x24BEDF400]();
}

uint64_t sub_210E91EC4()
{
  return MEMORY[0x24BEDF408]();
}

uint64_t sub_210E91ED0()
{
  return MEMORY[0x24BEAEFA0]();
}

uint64_t sub_210E91EDC()
{
  return MEMORY[0x24BEE5118]();
}

uint64_t sub_210E91EE8()
{
  return MEMORY[0x24BEE5120]();
}

uint64_t sub_210E91EF4()
{
  return MEMORY[0x24BEE5130]();
}

uint64_t sub_210E91F00()
{
  return MEMORY[0x24BEAEFC8]();
}

uint64_t sub_210E91F0C()
{
  return MEMORY[0x24BEAEFD0]();
}

uint64_t sub_210E91F18()
{
  return MEMORY[0x24BEAF258]();
}

uint64_t sub_210E91F24()
{
  return MEMORY[0x24BEAF270]();
}

uint64_t sub_210E91F30()
{
  return MEMORY[0x24BEAF320]();
}

uint64_t sub_210E91F3C()
{
  return MEMORY[0x24BEAF328]();
}

uint64_t sub_210E91F48()
{
  return MEMORY[0x24BEAF330]();
}

uint64_t sub_210E91F54()
{
  return MEMORY[0x24BEAF340]();
}

uint64_t sub_210E91F60()
{
  return MEMORY[0x24BEAF350]();
}

uint64_t sub_210E91F6C()
{
  return MEMORY[0x24BEAF390]();
}

uint64_t sub_210E91F78()
{
  return MEMORY[0x24BEAF3C8]();
}

uint64_t sub_210E91F84()
{
  return MEMORY[0x24BEAF3D0]();
}

uint64_t sub_210E91F90()
{
  return MEMORY[0x24BE73028]();
}

uint64_t sub_210E91F9C()
{
  return MEMORY[0x24BE73030]();
}

uint64_t sub_210E91FA8()
{
  return MEMORY[0x24BE73038]();
}

uint64_t sub_210E91FB4()
{
  return MEMORY[0x24BE73040]();
}

uint64_t sub_210E91FC0()
{
  return MEMORY[0x24BE73050]();
}

uint64_t sub_210E91FCC()
{
  return MEMORY[0x24BE73058]();
}

uint64_t sub_210E91FD8()
{
  return MEMORY[0x24BE73060]();
}

uint64_t sub_210E91FE4()
{
  return MEMORY[0x24BE73068]();
}

uint64_t sub_210E91FF0()
{
  return MEMORY[0x24BE73070]();
}

uint64_t sub_210E91FFC()
{
  return MEMORY[0x24BE73078]();
}

uint64_t sub_210E92008()
{
  return MEMORY[0x24BE73080]();
}

uint64_t sub_210E92014()
{
  return MEMORY[0x24BE73088]();
}

uint64_t sub_210E92020()
{
  return MEMORY[0x24BE73090]();
}

uint64_t sub_210E9202C()
{
  return MEMORY[0x24BE73098]();
}

uint64_t sub_210E92038()
{
  return MEMORY[0x24BE730A0]();
}

uint64_t sub_210E92044()
{
  return MEMORY[0x24BE730B0]();
}

uint64_t sub_210E92050()
{
  return MEMORY[0x24BE730B8]();
}

uint64_t sub_210E9205C()
{
  return MEMORY[0x24BE730C0]();
}

uint64_t sub_210E92068()
{
  return MEMORY[0x24BE730C8]();
}

uint64_t sub_210E92074()
{
  return MEMORY[0x24BE730D0]();
}

uint64_t sub_210E92080()
{
  return MEMORY[0x24BE730D8]();
}

uint64_t sub_210E9208C()
{
  return MEMORY[0x24BE730E0]();
}

uint64_t sub_210E92098()
{
  return MEMORY[0x24BE730E8]();
}

uint64_t sub_210E920A4()
{
  return MEMORY[0x24BE730F0]();
}

uint64_t sub_210E920B0()
{
  return MEMORY[0x24BE73100]();
}

uint64_t sub_210E920BC()
{
  return MEMORY[0x24BE73108]();
}

uint64_t sub_210E920C8()
{
  return MEMORY[0x24BE73110]();
}

uint64_t sub_210E920D4()
{
  return MEMORY[0x24BE73120]();
}

uint64_t sub_210E920E0()
{
  return MEMORY[0x24BE73130]();
}

uint64_t sub_210E920EC()
{
  return MEMORY[0x24BE73138]();
}

uint64_t sub_210E920F8()
{
  return MEMORY[0x24BE73140]();
}

uint64_t sub_210E92104()
{
  return MEMORY[0x24BE73148]();
}

uint64_t sub_210E92110()
{
  return MEMORY[0x24BE73150]();
}

uint64_t sub_210E9211C()
{
  return MEMORY[0x24BE73158]();
}

uint64_t sub_210E92128()
{
  return MEMORY[0x24BE73160]();
}

uint64_t sub_210E92134()
{
  return MEMORY[0x24BE73168]();
}

uint64_t sub_210E92140()
{
  return MEMORY[0x24BE73170]();
}

uint64_t sub_210E9214C()
{
  return MEMORY[0x24BE73178]();
}

uint64_t sub_210E92158()
{
  return MEMORY[0x24BE73188]();
}

uint64_t sub_210E92164()
{
  return MEMORY[0x24BE73190]();
}

uint64_t sub_210E92170()
{
  return MEMORY[0x24BE73198]();
}

uint64_t sub_210E9217C()
{
  return MEMORY[0x24BE731A0]();
}

uint64_t sub_210E92188()
{
  return MEMORY[0x24BE731A8]();
}

uint64_t sub_210E92194()
{
  return MEMORY[0x24BE731C8]();
}

uint64_t sub_210E921A0()
{
  return MEMORY[0x24BE731D8]();
}

uint64_t sub_210E921AC()
{
  return MEMORY[0x24BE731E0]();
}

uint64_t sub_210E921B8()
{
  return MEMORY[0x24BE731E8]();
}

uint64_t sub_210E921C4()
{
  return MEMORY[0x24BE731F0]();
}

uint64_t sub_210E921D0()
{
  return MEMORY[0x24BE731F8]();
}

uint64_t sub_210E921DC()
{
  return MEMORY[0x24BE73200]();
}

uint64_t sub_210E921E8()
{
  return MEMORY[0x24BE73208]();
}

uint64_t sub_210E921F4()
{
  return MEMORY[0x24BE73210]();
}

uint64_t sub_210E92200()
{
  return MEMORY[0x24BE73218]();
}

uint64_t sub_210E9220C()
{
  return MEMORY[0x24BE73220]();
}

uint64_t sub_210E92218()
{
  return MEMORY[0x24BE73228]();
}

uint64_t sub_210E92224()
{
  return MEMORY[0x24BE73230]();
}

uint64_t sub_210E92230()
{
  return MEMORY[0x24BE73270]();
}

uint64_t sub_210E9223C()
{
  return MEMORY[0x24BE73280]();
}

uint64_t sub_210E92248()
{
  return MEMORY[0x24BE73288]();
}

uint64_t sub_210E92254()
{
  return MEMORY[0x24BE73298]();
}

uint64_t sub_210E92260()
{
  return MEMORY[0x24BE732A0]();
}

uint64_t sub_210E9226C()
{
  return MEMORY[0x24BE732A8]();
}

uint64_t sub_210E92278()
{
  return MEMORY[0x24BE732B0]();
}

uint64_t sub_210E92284()
{
  return MEMORY[0x24BE732B8]();
}

uint64_t sub_210E92290()
{
  return MEMORY[0x24BE732C8]();
}

uint64_t sub_210E9229C()
{
  return MEMORY[0x24BE732D0]();
}

uint64_t sub_210E922A8()
{
  return MEMORY[0x24BE732D8]();
}

uint64_t sub_210E922B4()
{
  return MEMORY[0x24BE732E0]();
}

uint64_t sub_210E922C0()
{
  return MEMORY[0x24BE732E8]();
}

uint64_t sub_210E922CC()
{
  return MEMORY[0x24BE732F0]();
}

uint64_t sub_210E922D8()
{
  return MEMORY[0x24BE732F8]();
}

uint64_t sub_210E922E4()
{
  return MEMORY[0x24BE73300]();
}

uint64_t sub_210E922F0()
{
  return MEMORY[0x24BE73308]();
}

uint64_t sub_210E922FC()
{
  return MEMORY[0x24BE73310]();
}

uint64_t sub_210E92308()
{
  return MEMORY[0x24BE73320]();
}

uint64_t sub_210E92314()
{
  return MEMORY[0x24BE73328]();
}

uint64_t sub_210E92320()
{
  return MEMORY[0x24BE73338]();
}

uint64_t sub_210E9232C()
{
  return MEMORY[0x24BE73340]();
}

uint64_t sub_210E92338()
{
  return MEMORY[0x24BE73348]();
}

uint64_t sub_210E92344()
{
  return MEMORY[0x24BE73350]();
}

uint64_t sub_210E92350()
{
  return MEMORY[0x24BE73358]();
}

uint64_t sub_210E9235C()
{
  return MEMORY[0x24BE73360]();
}

uint64_t sub_210E92368()
{
  return MEMORY[0x24BE73368]();
}

uint64_t sub_210E92374()
{
  return MEMORY[0x24BE73370]();
}

uint64_t sub_210E92380()
{
  return MEMORY[0x24BE73378]();
}

uint64_t sub_210E9238C()
{
  return MEMORY[0x24BE73388]();
}

uint64_t sub_210E92398()
{
  return MEMORY[0x24BE73390]();
}

uint64_t sub_210E923A4()
{
  return MEMORY[0x24BE733E8]();
}

uint64_t sub_210E923B0()
{
  return MEMORY[0x24BE733F8]();
}

uint64_t sub_210E923BC()
{
  return MEMORY[0x24BE73400]();
}

uint64_t sub_210E923C8()
{
  return MEMORY[0x24BE73410]();
}

uint64_t sub_210E923D4()
{
  return MEMORY[0x24BE73420]();
}

uint64_t sub_210E923E0()
{
  return MEMORY[0x24BE73428]();
}

uint64_t sub_210E923EC()
{
  return MEMORY[0x24BE73430]();
}

uint64_t sub_210E923F8()
{
  return MEMORY[0x24BE73438]();
}

uint64_t sub_210E92404()
{
  return MEMORY[0x24BE73440]();
}

uint64_t sub_210E92410()
{
  return MEMORY[0x24BE73450]();
}

uint64_t sub_210E9241C()
{
  return MEMORY[0x24BE73460]();
}

uint64_t sub_210E92428()
{
  return MEMORY[0x24BE73468]();
}

uint64_t sub_210E92434()
{
  return MEMORY[0x24BE73470]();
}

uint64_t sub_210E92440()
{
  return MEMORY[0x24BE73478]();
}

uint64_t sub_210E9244C()
{
  return MEMORY[0x24BE73498]();
}

uint64_t sub_210E92458()
{
  return MEMORY[0x24BE734B8]();
}

uint64_t sub_210E92464()
{
  return MEMORY[0x24BE734D0]();
}

uint64_t sub_210E92470()
{
  return MEMORY[0x24BE734E0]();
}

uint64_t sub_210E9247C()
{
  return MEMORY[0x24BE734E8]();
}

uint64_t sub_210E92488()
{
  return MEMORY[0x24BE734F0]();
}

uint64_t sub_210E92494()
{
  return MEMORY[0x24BE734F8]();
}

uint64_t sub_210E924A0()
{
  return MEMORY[0x24BE73500]();
}

uint64_t sub_210E924AC()
{
  return MEMORY[0x24BE73510]();
}

uint64_t sub_210E924B8()
{
  return MEMORY[0x24BE73558]();
}

uint64_t sub_210E924C4()
{
  return MEMORY[0x24BE73560]();
}

uint64_t sub_210E924D0()
{
  return MEMORY[0x24BE73578]();
}

uint64_t sub_210E924DC()
{
  return MEMORY[0x24BE73580]();
}

uint64_t sub_210E924E8()
{
  return MEMORY[0x24BE73588]();
}

uint64_t sub_210E924F4()
{
  return MEMORY[0x24BE73590]();
}

uint64_t sub_210E92500()
{
  return MEMORY[0x24BE73598]();
}

uint64_t sub_210E9250C()
{
  return MEMORY[0x24BE735A8]();
}

uint64_t sub_210E92518()
{
  return MEMORY[0x24BE735B0]();
}

uint64_t sub_210E92524()
{
  return MEMORY[0x24BE735B8]();
}

uint64_t sub_210E92530()
{
  return MEMORY[0x24BE735C0]();
}

uint64_t sub_210E9253C()
{
  return MEMORY[0x24BE735C8]();
}

uint64_t sub_210E92548()
{
  return MEMORY[0x24BE735D8]();
}

uint64_t sub_210E92554()
{
  return MEMORY[0x24BE735E0]();
}

uint64_t sub_210E92560()
{
  return MEMORY[0x24BE735F0]();
}

uint64_t sub_210E9256C()
{
  return MEMORY[0x24BE735F8]();
}

uint64_t sub_210E92578()
{
  return MEMORY[0x24BE73600]();
}

uint64_t sub_210E92584()
{
  return MEMORY[0x24BE73610]();
}

uint64_t sub_210E92590()
{
  return MEMORY[0x24BE73618]();
}

uint64_t sub_210E9259C()
{
  return MEMORY[0x24BE73620]();
}

uint64_t sub_210E925A8()
{
  return MEMORY[0x24BE73628]();
}

uint64_t sub_210E925B4()
{
  return MEMORY[0x24BE73638]();
}

uint64_t sub_210E925C0()
{
  return MEMORY[0x24BE73650]();
}

uint64_t sub_210E925CC()
{
  return MEMORY[0x24BE73658]();
}

uint64_t sub_210E925D8()
{
  return MEMORY[0x24BE73660]();
}

uint64_t sub_210E925E4()
{
  return MEMORY[0x24BE73670]();
}

uint64_t sub_210E925F0()
{
  return MEMORY[0x24BE73678]();
}

uint64_t sub_210E925FC()
{
  return MEMORY[0x24BE73688]();
}

uint64_t sub_210E92608()
{
  return MEMORY[0x24BE73698]();
}

uint64_t sub_210E92614()
{
  return MEMORY[0x24BE736A0]();
}

uint64_t sub_210E92620()
{
  return MEMORY[0x24BE736A8]();
}

uint64_t sub_210E9262C()
{
  return MEMORY[0x24BE736B0]();
}

uint64_t sub_210E92638()
{
  return MEMORY[0x24BE736B8]();
}

uint64_t sub_210E92644()
{
  return MEMORY[0x24BE736C0]();
}

uint64_t sub_210E92650()
{
  return MEMORY[0x24BE736C8]();
}

uint64_t sub_210E9265C()
{
  return MEMORY[0x24BE736D0]();
}

uint64_t sub_210E92668()
{
  return MEMORY[0x24BE736E0]();
}

uint64_t sub_210E92674()
{
  return MEMORY[0x24BE736F0]();
}

uint64_t sub_210E92680()
{
  return MEMORY[0x24BE73700]();
}

uint64_t sub_210E9268C()
{
  return MEMORY[0x24BE73708]();
}

uint64_t sub_210E92698()
{
  return MEMORY[0x24BE73730]();
}

uint64_t sub_210E926A4()
{
  return MEMORY[0x24BE73738]();
}

uint64_t sub_210E926B0()
{
  return MEMORY[0x24BEE76F0]();
}

uint64_t sub_210E926BC()
{
  return MEMORY[0x24BE73740]();
}

uint64_t sub_210E926C8()
{
  return MEMORY[0x24BEE77F0]();
}

uint64_t sub_210E926D4()
{
  return MEMORY[0x24BE73748]();
}

uint64_t sub_210E926E0()
{
  return MEMORY[0x24BE73750]();
}

uint64_t sub_210E926EC()
{
  return MEMORY[0x24BE73758]();
}

uint64_t sub_210E926F8()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_210E92704()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_210E92710()
{
  return MEMORY[0x24BEE78E8]();
}

uint64_t sub_210E9271C()
{
  return MEMORY[0x24BDB9410]();
}

uint64_t sub_210E92728()
{
  return MEMORY[0x24BDB94B8]();
}

uint64_t sub_210E92734()
{
  return MEMORY[0x24BDB95D8]();
}

uint64_t sub_210E92740()
{
  return MEMORY[0x24BDB97E8]();
}

uint64_t sub_210E9274C()
{
  return MEMORY[0x24BDB9808]();
}

uint64_t sub_210E92758()
{
  return MEMORY[0x24BDB9860]();
}

uint64_t sub_210E92764()
{
  return MEMORY[0x24BDB9878]();
}

uint64_t sub_210E92770()
{
  return MEMORY[0x24BDB9888]();
}

uint64_t sub_210E9277C()
{
  return MEMORY[0x24BDB98E0]();
}

uint64_t sub_210E92788()
{
  return MEMORY[0x24BDB99B8]();
}

uint64_t sub_210E92794()
{
  return MEMORY[0x24BDB99F8]();
}

uint64_t sub_210E927A0()
{
  return MEMORY[0x24BDB9A28]();
}

uint64_t sub_210E927AC()
{
  return MEMORY[0x24BDB9A30]();
}

uint64_t sub_210E927B8()
{
  return MEMORY[0x24BDB9A38]();
}

uint64_t sub_210E927C4()
{
  return MEMORY[0x24BDB9A68]();
}

uint64_t sub_210E927D0()
{
  return MEMORY[0x24BDB9AB0]();
}

uint64_t sub_210E927DC()
{
  return MEMORY[0x24BDB9AC0]();
}

uint64_t sub_210E927E8()
{
  return MEMORY[0x24BDB9AE0]();
}

uint64_t sub_210E927F4()
{
  return MEMORY[0x24BDB9B40]();
}

uint64_t sub_210E92800()
{
  return MEMORY[0x24BDB9B50]();
}

uint64_t sub_210E9280C()
{
  return MEMORY[0x24BDB9B60]();
}

uint64_t sub_210E92818()
{
  return MEMORY[0x24BDB9C78]();
}

uint64_t sub_210E92824()
{
  return MEMORY[0x24BDB9C90]();
}

uint64_t sub_210E92830()
{
  return MEMORY[0x24BDB9C98]();
}

uint64_t sub_210E9283C()
{
  return MEMORY[0x24BDB9D20]();
}

uint64_t sub_210E92848()
{
  return MEMORY[0x24BDB9DF0]();
}

uint64_t sub_210E92854()
{
  return MEMORY[0x24BDB9F20]();
}

uint64_t sub_210E92860()
{
  return MEMORY[0x24BDB9F30]();
}

uint64_t sub_210E9286C()
{
  return MEMORY[0x24BDB9FE0]();
}

uint64_t sub_210E92878()
{
  return MEMORY[0x24BDB9FE8]();
}

uint64_t sub_210E92884()
{
  return MEMORY[0x24BDB9FF0]();
}

uint64_t sub_210E92890()
{
  return MEMORY[0x24BDB9FF8]();
}

uint64_t sub_210E9289C()
{
  return MEMORY[0x24BDBA000]();
}

uint64_t sub_210E928A8()
{
  return MEMORY[0x24BDBA030]();
}

uint64_t sub_210E928B4()
{
  return MEMORY[0x24BDBA050]();
}

uint64_t sub_210E928C0()
{
  return MEMORY[0x24BDBA068]();
}

uint64_t sub_210E928CC()
{
  return MEMORY[0x24BDBA090]();
}

uint64_t sub_210E928D8()
{
  return MEMORY[0x24BDBA0D0]();
}

uint64_t sub_210E928E4()
{
  return MEMORY[0x24BDBA110]();
}

uint64_t sub_210E928F0()
{
  return MEMORY[0x24BDBA138]();
}

uint64_t sub_210E928FC()
{
  return MEMORY[0x24BEE5428]();
}

uint64_t sub_210E92908()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_210E92914()
{
  return MEMORY[0x24BEE54B0]();
}

uint64_t sub_210E92920()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_210E9292C()
{
  return MEMORY[0x24BEE54D8]();
}

uint64_t sub_210E92938()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_210E92944()
{
  return MEMORY[0x24BEE5548]();
}

uint64_t sub_210E92950()
{
  return MEMORY[0x24BEE5570]();
}

uint64_t sub_210E9295C()
{
  return MEMORY[0x24BEE5590]();
}

uint64_t sub_210E92968()
{
  return MEMORY[0x24BEE5618]();
}

uint64_t sub_210E92974()
{
  return MEMORY[0x24BEE5620]();
}

uint64_t sub_210E92980()
{
  return MEMORY[0x24BEE5628]();
}

uint64_t sub_210E9298C()
{
  return MEMORY[0x24BEE5648]();
}

uint64_t sub_210E92998()
{
  return MEMORY[0x24BEAF6D8]();
}

uint64_t sub_210E929A4()
{
  return MEMORY[0x24BEAF720]();
}

uint64_t sub_210E929B0()
{
  return MEMORY[0x24BEAF728]();
}

uint64_t sub_210E929BC()
{
  return MEMORY[0x24BEC6D58]();
}

uint64_t sub_210E929C8()
{
  return MEMORY[0x24BEC6D60]();
}

uint64_t sub_210E929D4()
{
  return MEMORY[0x24BEC6D78]();
}

uint64_t sub_210E929E0()
{
  return MEMORY[0x24BEAF7D8]();
}

uint64_t sub_210E929EC()
{
  return MEMORY[0x24BEAF7E0]();
}

uint64_t sub_210E929F8()
{
  return MEMORY[0x24BEAF7E8]();
}

uint64_t sub_210E92A04()
{
  return MEMORY[0x24BEAF7F8]();
}

uint64_t sub_210E92A10()
{
  return MEMORY[0x24BEAFA40]();
}

uint64_t sub_210E92A1C()
{
  return MEMORY[0x24BEAFA50]();
}

uint64_t sub_210E92A28()
{
  return MEMORY[0x24BEAFAE0]();
}

uint64_t sub_210E92A34()
{
  return MEMORY[0x24BEAFAF0]();
}

uint64_t sub_210E92A40()
{
  return MEMORY[0x24BEAFAF8]();
}

uint64_t sub_210E92A4C()
{
  return MEMORY[0x24BEAFB00]();
}

uint64_t sub_210E92A58()
{
  return MEMORY[0x24BEAFB08]();
}

uint64_t sub_210E92A64()
{
  return MEMORY[0x24BEAFB10]();
}

uint64_t sub_210E92A70()
{
  return MEMORY[0x24BEAFB18]();
}

uint64_t sub_210E92A7C()
{
  return MEMORY[0x24BEAFB20]();
}

uint64_t sub_210E92A88()
{
  return MEMORY[0x24BEAFB28]();
}

uint64_t sub_210E92A94()
{
  return MEMORY[0x24BEAFB30]();
}

uint64_t sub_210E92AA0()
{
  return MEMORY[0x24BEAFB38]();
}

uint64_t sub_210E92AAC()
{
  return MEMORY[0x24BEAFB40]();
}

uint64_t sub_210E92AB8()
{
  return MEMORY[0x24BEAFB48]();
}

uint64_t sub_210E92AC4()
{
  return MEMORY[0x24BEAFB50]();
}

uint64_t sub_210E92AD0()
{
  return MEMORY[0x24BEAFB68]();
}

uint64_t sub_210E92ADC()
{
  return MEMORY[0x24BEE5088]();
}

uint64_t sub_210E92AE8()
{
  return MEMORY[0x24BEE5090]();
}

uint64_t sub_210E92AF4()
{
  return MEMORY[0x24BEE67F8]();
}

uint64_t sub_210E92B00()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_210E92B0C()
{
  return MEMORY[0x24BDCF828]();
}

uint64_t sub_210E92B18()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_210E92B24()
{
  return MEMORY[0x24BEE0270]();
}

uint64_t sub_210E92B30()
{
  return MEMORY[0x24BEE02B0]();
}

uint64_t sub_210E92B3C()
{
  return MEMORY[0x24BEE0418]();
}

uint64_t sub_210E92B48()
{
  return MEMORY[0x24BEE0460]();
}

uint64_t sub_210E92B54()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_210E92B60()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_210E92B6C()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_210E92B78()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_210E92B84()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_210E92B90()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_210E92B9C()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_210E92BA8()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_210E92BB4()
{
  return MEMORY[0x24BDCFA38]();
}

uint64_t sub_210E92BC0()
{
  return MEMORY[0x24BDCFA48]();
}

uint64_t sub_210E92BCC()
{
  return MEMORY[0x24BDCFA78]();
}

uint64_t sub_210E92BD8()
{
  return MEMORY[0x24BDCFAC8]();
}

uint64_t sub_210E92BE4()
{
  return MEMORY[0x24BDCFAE0]();
}

uint64_t sub_210E92BF0()
{
  return MEMORY[0x24BDCFAF8]();
}

uint64_t sub_210E92BFC()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_210E92C08()
{
  return MEMORY[0x24BEE0A08]();
}

uint64_t sub_210E92C14()
{
  return MEMORY[0x24BEE0A78]();
}

uint64_t sub_210E92C20()
{
  return MEMORY[0x24BEE0AD8]();
}

uint64_t sub_210E92C2C()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_210E92C38()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_210E92C44()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_210E92C50()
{
  return MEMORY[0x24BEE0C18]();
}

uint64_t sub_210E92C5C()
{
  return MEMORY[0x24BEE0C30]();
}

uint64_t sub_210E92C68()
{
  return MEMORY[0x24BEE0C38]();
}

uint64_t sub_210E92C74()
{
  return MEMORY[0x24BEE0C40]();
}

uint64_t sub_210E92C80()
{
  return MEMORY[0x24BEE0CA0]();
}

uint64_t sub_210E92C8C()
{
  return MEMORY[0x24BEE0DD0]();
}

uint64_t sub_210E92C98()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_210E92CA4()
{
  return MEMORY[0x24BEE0FD8]();
}

uint64_t sub_210E92CB0()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_210E92CBC()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_210E92CC8()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_210E92CD4()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_210E92CE0()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_210E92CEC()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_210E92CF8()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_210E92D04()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_210E92D10()
{
  return MEMORY[0x24BEE1250]();
}

uint64_t sub_210E92D1C()
{
  return MEMORY[0x24BDCFC08]();
}

uint64_t sub_210E92D28()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_210E92D34()
{
  return MEMORY[0x24BEE6820]();
}

uint64_t sub_210E92D40()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t sub_210E92D4C()
{
  return MEMORY[0x24BEE6830]();
}

uint64_t sub_210E92D58()
{
  return MEMORY[0x24BEE6838]();
}

uint64_t sub_210E92D64()
{
  return MEMORY[0x24BEE68C8]();
}

uint64_t sub_210E92D70()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_210E92D7C()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_210E92D88()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_210E92D94()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_210E92DA0()
{
  return MEMORY[0x24BEE6A30]();
}

uint64_t sub_210E92DAC()
{
  return MEMORY[0x24BEE6A40]();
}

uint64_t sub_210E92DB8()
{
  return MEMORY[0x24BEE6A50]();
}

uint64_t sub_210E92DC4()
{
  return MEMORY[0x24BEE6A58]();
}

uint64_t sub_210E92DD0()
{
  return MEMORY[0x24BEE6A98]();
}

uint64_t sub_210E92DDC()
{
  return MEMORY[0x24BEE6AA0]();
}

uint64_t sub_210E92DE8()
{
  return MEMORY[0x24BEAF500]();
}

uint64_t sub_210E92DF4()
{
  return MEMORY[0x24BEAF508]();
}

uint64_t sub_210E92E00()
{
  return MEMORY[0x24BEE6AC0]();
}

uint64_t sub_210E92E0C()
{
  return MEMORY[0x24BEE6AD0]();
}

uint64_t sub_210E92E18()
{
  return MEMORY[0x24BEE6AE8]();
}

uint64_t sub_210E92E24()
{
  return MEMORY[0x24BEE6B00]();
}

uint64_t sub_210E92E30()
{
  return MEMORY[0x24BEE6B10]();
}

uint64_t sub_210E92E3C()
{
  return MEMORY[0x24BEE6B20]();
}

uint64_t sub_210E92E48()
{
  return MEMORY[0x24BDCFC58]();
}

uint64_t sub_210E92E54()
{
  return MEMORY[0x24BEE13A8]();
}

uint64_t sub_210E92E60()
{
  return MEMORY[0x24BEE14C8]();
}

uint64_t sub_210E92E6C()
{
  return MEMORY[0x24BEE1598]();
}

uint64_t sub_210E92E78()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_210E92E84()
{
  return MEMORY[0x24BEE1608]();
}

uint64_t sub_210E92E90()
{
  return MEMORY[0x24BEE1678]();
}

uint64_t sub_210E92E9C()
{
  return MEMORY[0x24BEE16D8]();
}

uint64_t sub_210E92EA8()
{
  return MEMORY[0x24BDCFD28]();
}

uint64_t sub_210E92EB4()
{
  return MEMORY[0x24BDCFD30]();
}

uint64_t sub_210E92EC0()
{
  return MEMORY[0x24BDCFD38]();
}

uint64_t sub_210E92ECC()
{
  return MEMORY[0x24BDCFD40]();
}

uint64_t sub_210E92ED8()
{
  return MEMORY[0x24BEE1758]();
}

uint64_t sub_210E92EE4()
{
  return MEMORY[0x24BE73760]();
}

uint64_t sub_210E92EF0()
{
  return MEMORY[0x24BEE1B68]();
}

uint64_t sub_210E92EFC()
{
  return MEMORY[0x24BEE51F8]();
}

uint64_t sub_210E92F08()
{
  return MEMORY[0x24BEE5200]();
}

uint64_t sub_210E92F14()
{
  return MEMORY[0x24BEE5210]();
}

uint64_t sub_210E92F20()
{
  return MEMORY[0x24BEE5220]();
}

uint64_t sub_210E92F2C()
{
  return MEMORY[0x24BEE5238]();
}

uint64_t sub_210E92F38()
{
  return MEMORY[0x24BEE5240]();
}

uint64_t sub_210E92F44()
{
  return MEMORY[0x24BEE5248]();
}

uint64_t sub_210E92F50()
{
  return MEMORY[0x24BEE5250]();
}

uint64_t sub_210E92F5C()
{
  return MEMORY[0x24BEE5258]();
}

uint64_t sub_210E92F68()
{
  return MEMORY[0x24BEE5260]();
}

uint64_t sub_210E92F74()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_210E92F80()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_210E92F8C()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_210E92F98()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_210E92FA4()
{
  return MEMORY[0x24BDCFFD8]();
}

uint64_t sub_210E92FB0()
{
  return MEMORY[0x24BEE5660]();
}

uint64_t sub_210E92FBC()
{
  return MEMORY[0x24BE73768]();
}

uint64_t sub_210E92FC8()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_210E92FD4()
{
  return MEMORY[0x24BEE56B8]();
}

uint64_t sub_210E92FE0()
{
  return MEMORY[0x24BEE56F0]();
}

uint64_t sub_210E92FEC()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_210E92FF8()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_210E93004()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_210E93010()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_210E9301C()
{
  return MEMORY[0x24BEE57A8]();
}

uint64_t sub_210E93028()
{
  return MEMORY[0x24BEE57B0]();
}

uint64_t sub_210E93034()
{
  return MEMORY[0x24BEE57C0]();
}

uint64_t sub_210E93040()
{
  return MEMORY[0x24BEE5828]();
}

uint64_t sub_210E9304C()
{
  return MEMORY[0x24BEE58B8]();
}

uint64_t sub_210E93058()
{
  return MEMORY[0x24BEE58D0]();
}

uint64_t sub_210E93064()
{
  return MEMORY[0x24BEE58E8]();
}

uint64_t sub_210E93070()
{
  return MEMORY[0x24BDD0078]();
}

uint64_t sub_210E9307C()
{
  return MEMORY[0x24BDD0098]();
}

uint64_t sub_210E93088()
{
  return MEMORY[0x24BEE5280]();
}

uint64_t sub_210E93094()
{
  return MEMORY[0x24BEE5288]();
}

uint64_t sub_210E930A0()
{
  return MEMORY[0x24BEE5290]();
}

uint64_t sub_210E930AC()
{
  return MEMORY[0x24BEE52A8]();
}

uint64_t sub_210E930B8()
{
  return MEMORY[0x24BEE52B0]();
}

uint64_t sub_210E930C4()
{
  return MEMORY[0x24BEE52B8]();
}

uint64_t sub_210E930D0()
{
  return MEMORY[0x24BEE5958]();
}

uint64_t sub_210E930DC()
{
  return MEMORY[0x24BEDF468]();
}

uint64_t sub_210E930E8()
{
  return MEMORY[0x24BEDF478]();
}

uint64_t sub_210E930F4()
{
  return MEMORY[0x24BEE52C0]();
}

uint64_t sub_210E93100()
{
  return MEMORY[0x24BEE52C8]();
}

uint64_t sub_210E9310C()
{
  return MEMORY[0x24BEE52D0]();
}

uint64_t sub_210E93118()
{
  return MEMORY[0x24BEE52D8]();
}

uint64_t sub_210E93124()
{
  return MEMORY[0x24BEE52E0]();
}

uint64_t sub_210E93130()
{
  return MEMORY[0x24BEE52F0]();
}

uint64_t sub_210E9313C()
{
  return MEMORY[0x24BEE52F8]();
}

uint64_t sub_210E93148()
{
  return MEMORY[0x24BEE5300]();
}

uint64_t sub_210E93154()
{
  return MEMORY[0x24BEE5308]();
}

uint64_t sub_210E93160()
{
  return MEMORY[0x24BEE5318]();
}

uint64_t sub_210E9316C()
{
  return MEMORY[0x24BEE5320]();
}

uint64_t sub_210E93178()
{
  return MEMORY[0x24BEE5328]();
}

uint64_t sub_210E93184()
{
  return MEMORY[0x24BEE5330]();
}

uint64_t sub_210E93190()
{
  return MEMORY[0x24BEC6D80]();
}

uint64_t sub_210E9319C()
{
  return MEMORY[0x24BEDF490]();
}

uint64_t sub_210E931A8()
{
  return MEMORY[0x24BDD0150]();
}

uint64_t sub_210E931B4()
{
  return MEMORY[0x24BDD0170]();
}

uint64_t sub_210E931C0()
{
  return MEMORY[0x24BDD0178]();
}

uint64_t sub_210E931CC()
{
  return MEMORY[0x24BE64B60]();
}

uint64_t sub_210E931D8()
{
  return MEMORY[0x24BE64B68]();
}

uint64_t sub_210E931E4()
{
  return MEMORY[0x24BDD01F0]();
}

uint64_t sub_210E931F0()
{
  return MEMORY[0x24BDD0218]();
}

uint64_t sub_210E931FC()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_210E93208()
{
  return MEMORY[0x24BEE5BD0]();
}

uint64_t sub_210E93214()
{
  return MEMORY[0x24BDD0248]();
}

uint64_t sub_210E93220()
{
  return MEMORY[0x24BDD03C0]();
}

uint64_t sub_210E9322C()
{
  return MEMORY[0x24BEE79A0]();
}

uint64_t sub_210E93238()
{
  return MEMORY[0x24BEE1C58]();
}

uint64_t sub_210E93244()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_210E93250()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_210E9325C()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_210E93268()
{
  return MEMORY[0x24BEE2090]();
}

uint64_t sub_210E93274()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_210E93280()
{
  return MEMORY[0x24BEE22B0]();
}

uint64_t sub_210E9328C()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_210E93298()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_210E932A4()
{
  return MEMORY[0x24BEE22E0]();
}

uint64_t sub_210E932B0()
{
  return MEMORY[0x24BEE22F8]();
}

uint64_t sub_210E932BC()
{
  return MEMORY[0x24BEE2300]();
}

uint64_t sub_210E932C8()
{
  return MEMORY[0x24BEE2308]();
}

uint64_t sub_210E932D4()
{
  return MEMORY[0x24BEE2320]();
}

uint64_t sub_210E932E0()
{
  return MEMORY[0x24BEE2328]();
}

uint64_t sub_210E932EC()
{
  return MEMORY[0x24BEE2330]();
}

uint64_t sub_210E932F8()
{
  return MEMORY[0x24BEE2340]();
}

uint64_t sub_210E93304()
{
  return MEMORY[0x24BEE2348]();
}

uint64_t sub_210E93310()
{
  return MEMORY[0x24BEE2358]();
}

uint64_t sub_210E9331C()
{
  return MEMORY[0x24BEE2360]();
}

uint64_t sub_210E93328()
{
  return MEMORY[0x24BEE2370]();
}

uint64_t sub_210E93334()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_210E93340()
{
  return MEMORY[0x24BEE23A8]();
}

uint64_t sub_210E9334C()
{
  return MEMORY[0x24BEE23E8]();
}

uint64_t sub_210E93358()
{
  return MEMORY[0x24BEE6D58]();
}

uint64_t sub_210E93364()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_210E93370()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_210E9337C()
{
  return MEMORY[0x24BEE24C8]();
}

uint64_t sub_210E93388()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_210E93394()
{
  return MEMORY[0x24BEE24D8]();
}

uint64_t sub_210E933A0()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_210E933AC()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_210E933B8()
{
  return MEMORY[0x24BEE2648]();
}

uint64_t sub_210E933C4()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_210E933D0()
{
  return MEMORY[0x24BEE2660]();
}

uint64_t sub_210E933DC()
{
  return MEMORY[0x24BEE2798]();
}

uint64_t sub_210E933E8()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_210E933F4()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_210E93400()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_210E9340C()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_210E93418()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_210E93424()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_210E93430()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_210E9343C()
{
  return MEMORY[0x24BEE2E58]();
}

uint64_t sub_210E93448()
{
  return MEMORY[0x24BEE2E68]();
}

uint64_t sub_210E93454()
{
  return MEMORY[0x24BEE2E70]();
}

uint64_t sub_210E93460()
{
  return MEMORY[0x24BEE2E90]();
}

uint64_t sub_210E9346C()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_210E93478()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_210E93484()
{
  return MEMORY[0x24BEE2F58]();
}

uint64_t sub_210E93490()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_210E9349C()
{
  return MEMORY[0x24BEE3070]();
}

uint64_t sub_210E934A8()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_210E934B4()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_210E934C0()
{
  return MEMORY[0x24BEE30A0]();
}

uint64_t sub_210E934CC()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_210E934D8()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_210E934E4()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_210E934F0()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_210E934FC()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_210E93508()
{
  return MEMORY[0x24BEE3598]();
}

uint64_t sub_210E93514()
{
  return MEMORY[0x24BEE7040]();
}

uint64_t sub_210E93520()
{
  return MEMORY[0x24BEE3880]();
}

uint64_t sub_210E9352C()
{
  return MEMORY[0x24BEE3A20]();
}

uint64_t sub_210E93538()
{
  return MEMORY[0x24BEE3A28]();
}

uint64_t sub_210E93544()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_210E93550()
{
  return MEMORY[0x24BEE3B90]();
}

uint64_t sub_210E9355C()
{
  return MEMORY[0x24BEE3B98]();
}

uint64_t sub_210E93568()
{
  return MEMORY[0x24BEE70E0]();
}

uint64_t sub_210E93574()
{
  return MEMORY[0x24BEE3D98]();
}

uint64_t sub_210E93580()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_210E9358C()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_210E93598()
{
  return MEMORY[0x24BDD06E0]();
}

uint64_t sub_210E935A4()
{
  return MEMORY[0x24BDD06F0]();
}

uint64_t sub_210E935B0()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_210E935BC()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_210E935C8()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_210E935D4()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_210E935E0()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_210E935EC()
{
  return MEMORY[0x24BDD0768]();
}

uint64_t sub_210E935F8()
{
  return MEMORY[0x24BEE42C0]();
}

uint64_t sub_210E93604()
{
  return MEMORY[0x24BEE42D8]();
}

uint64_t sub_210E93610()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_210E9361C()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_210E93628()
{
  return MEMORY[0x24BEE4320]();
}

uint64_t sub_210E93634()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_210E93640()
{
  return MEMORY[0x24BEE4330]();
}

uint64_t sub_210E9364C()
{
  return MEMORY[0x24BEE4408]();
}

uint64_t sub_210E93658()
{
  return MEMORY[0x24BEE4A98]();
}

uint64_t AFAnalyticsContextsMerge()
{
  return MEMORY[0x24BE08B88]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x24BE1A1C8]();
}

AudioComponent AudioComponentFindNext(AudioComponent inComponent, const AudioComponentDescription *inDesc)
{
  return (AudioComponent)MEMORY[0x24BE0A668](inComponent, inDesc);
}

OSStatus AudioComponentInstanceDispose(AudioComponentInstance inInstance)
{
  return MEMORY[0x24BE0A688](inInstance);
}

OSStatus AudioComponentInstanceNew(AudioComponent inComponent, AudioComponentInstance *outInstance)
{
  return MEMORY[0x24BE0A698](inComponent, outInstance);
}

OSStatus AudioQueueAllocateBuffer(AudioQueueRef inAQ, UInt32 inBufferByteSize, AudioQueueBufferRef *outBuffer)
{
  return MEMORY[0x24BDB68D0](inAQ, *(_QWORD *)&inBufferByteSize, outBuffer);
}

OSStatus AudioQueueDispose(AudioQueueRef inAQ, Boolean inImmediate)
{
  return MEMORY[0x24BDB68D8](inAQ, inImmediate);
}

OSStatus AudioQueueEnqueueBuffer(AudioQueueRef inAQ, AudioQueueBufferRef inBuffer, UInt32 inNumPacketDescs, const AudioStreamPacketDescription *inPacketDescs)
{
  return MEMORY[0x24BDB68E0](inAQ, inBuffer, *(_QWORD *)&inNumPacketDescs, inPacketDescs);
}

OSStatus AudioQueueFreeBuffer(AudioQueueRef inAQ, AudioQueueBufferRef inBuffer)
{
  return MEMORY[0x24BDB68F8](inAQ, inBuffer);
}

OSStatus AudioQueueNewInput(const AudioStreamBasicDescription *inFormat, AudioQueueInputCallback inCallbackProc, void *inUserData, CFRunLoopRef inCallbackRunLoop, CFStringRef inCallbackRunLoopMode, UInt32 inFlags, AudioQueueRef *outAQ)
{
  return MEMORY[0x24BDB6910](inFormat, inCallbackProc, inUserData, inCallbackRunLoop, inCallbackRunLoopMode, *(_QWORD *)&inFlags, outAQ);
}

OSStatus AudioQueueSetProperty(AudioQueueRef inAQ, AudioQueuePropertyID inID, const void *inData, UInt32 inDataSize)
{
  return MEMORY[0x24BDB6940](inAQ, *(_QWORD *)&inID, inData, *(_QWORD *)&inDataSize);
}

OSStatus AudioQueueStart(AudioQueueRef inAQ, const AudioTimeStamp *inStartTime)
{
  return MEMORY[0x24BDB6948](inAQ, inStartTime);
}

OSStatus AudioQueueStop(AudioQueueRef inAQ, Boolean inImmediate)
{
  return MEMORY[0x24BDB6950](inAQ, inImmediate);
}

OSStatus AudioServicesSetProperty(AudioServicesPropertyID inPropertyID, UInt32 inSpecifierSize, const void *inSpecifier, UInt32 inPropertyDataSize, const void *inPropertyData)
{
  return MEMORY[0x24BDB69A0](*(_QWORD *)&inPropertyID, *(_QWORD *)&inSpecifierSize, inSpecifier, *(_QWORD *)&inPropertyDataSize, inPropertyData);
}

OSStatus AudioUnitInitialize(AudioUnit inUnit)
{
  return MEMORY[0x24BE0A750](inUnit);
}

OSStatus AudioUnitRender(AudioUnit inUnit, AudioUnitRenderActionFlags *ioActionFlags, const AudioTimeStamp *inTimeStamp, UInt32 inOutputBusNumber, UInt32 inNumberFrames, AudioBufferList *ioData)
{
  return MEMORY[0x24BE0A778](inUnit, ioActionFlags, inTimeStamp, *(_QWORD *)&inOutputBusNumber, *(_QWORD *)&inNumberFrames, ioData);
}

OSStatus AudioUnitReset(AudioUnit inUnit, AudioUnitScope inScope, AudioUnitElement inElement)
{
  return MEMORY[0x24BE0A780](inUnit, *(_QWORD *)&inScope, *(_QWORD *)&inElement);
}

OSStatus AudioUnitSetParameter(AudioUnit inUnit, AudioUnitParameterID inID, AudioUnitScope inScope, AudioUnitElement inElement, AudioUnitParameterValue inValue, UInt32 inBufferOffsetInFrames)
{
  return MEMORY[0x24BE0A790](inUnit, *(_QWORD *)&inID, *(_QWORD *)&inScope, *(_QWORD *)&inElement, *(_QWORD *)&inBufferOffsetInFrames, inValue);
}

OSStatus AudioUnitSetProperty(AudioUnit inUnit, AudioUnitPropertyID inID, AudioUnitScope inScope, AudioUnitElement inElement, const void *inData, UInt32 inDataSize)
{
  return MEMORY[0x24BE0A798](inUnit, *(_QWORD *)&inID, *(_QWORD *)&inScope, *(_QWORD *)&inElement, inData, *(_QWORD *)&inDataSize);
}

OSStatus AudioUnitUninitialize(AudioUnit inUnit)
{
  return MEMORY[0x24BE0A7A0](inUnit);
}

int CC_MD5_Final(unsigned __int8 *md, CC_MD5_CTX *c)
{
  return MEMORY[0x24BDAC308](md, c);
}

int CC_MD5_Update(CC_MD5_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x24BDAC318](c, data, *(_QWORD *)&len);
}

int CC_SHA1_Final(unsigned __int8 *md, CC_SHA1_CTX *c)
{
  return MEMORY[0x24BDAC328](md, c);
}

int CC_SHA1_Init(CC_SHA1_CTX *c)
{
  return MEMORY[0x24BDAC330](c);
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x24BDAC338](c, data, *(_QWORD *)&len);
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x24BDAC360](md, c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x24BDAC370](c, data, *(_QWORD *)&len);
}

int CC_SHA512_Final(unsigned __int8 *md, CC_SHA512_CTX *c)
{
  return MEMORY[0x24BDAC3A0](md, c);
}

int CC_SHA512_Update(CC_SHA512_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x24BDAC3B0](c, data, *(_QWORD *)&len);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC188](key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x24BDBC558](alloc, bytes, numBytes, *(_QWORD *)&encoding, isExternalRepresentation);
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBEFC8]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

uint64_t CMClockConvertHostTimeToSystemUnits(CMTime *hostTime)
{
  return MEMORY[0x24BDC0148](hostTime);
}

CMClockRef CMClockGetHostTimeClock(void)
{
  return (CMClockRef)MEMORY[0x24BDC0150]();
}

CMTime *__cdecl CMClockGetTime(CMTime *__return_ptr retstr, CMClockRef clock)
{
  return (CMTime *)MEMORY[0x24BDC0158](retstr, clock);
}

CMTime *__cdecl CMSyncConvertTime(CMTime *__return_ptr retstr, CMTime *time, CMClockOrTimebaseRef fromClockOrTimebase, CMClockOrTimebaseRef toClockOrTimebase)
{
  return (CMTime *)MEMORY[0x24BDC03E8](retstr, time, fromClockOrTimebase, toClockOrTimebase);
}

int32_t CMTimeCompare(CMTime *time1, CMTime *time2)
{
  return MEMORY[0x24BDC0450](time1, time2);
}

CFStringRef CMTimeCopyDescription(CFAllocatorRef allocator, CMTime *time)
{
  return (CFStringRef)MEMORY[0x24BDC0478](allocator, time);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  Float64 result;

  MEMORY[0x24BDC0490](time);
  return result;
}

CMTime *__cdecl CMTimeMake(CMTime *__return_ptr retstr, int64_t value, int32_t timescale)
{
  return (CMTime *)MEMORY[0x24BDC0498](retstr, value, *(_QWORD *)&timescale);
}

CMTime *__cdecl CMTimeMakeWithSeconds(CMTime *__return_ptr retstr, Float64 seconds, int32_t preferredTimescale)
{
  return (CMTime *)MEMORY[0x24BDC04C0](retstr, *(_QWORD *)&preferredTimescale, seconds);
}

CMTimeRange *__cdecl CMTimeRangeMake(CMTimeRange *__return_ptr retstr, CMTime *start, CMTime *duration)
{
  return (CMTimeRange *)MEMORY[0x24BDC0580](retstr, start, duration);
}

Float64 CMTimebaseGetEffectiveRate(CMTimebaseRef timebase)
{
  Float64 result;

  MEMORY[0x24BDC05D0](timebase);
  return result;
}

CMTime *__cdecl CMTimebaseGetTime(CMTime *__return_ptr retstr, CMTimebaseRef timebase)
{
  return (CMTime *)MEMORY[0x24BDC05E0](retstr, timebase);
}

uint64_t FigOutputMonitorIsScreenProbablyBeingRecorded()
{
  return MEMORY[0x24BDDCDD8]();
}

uint64_t ICBundleIdentifierForSystemApplicationType()
{
  return MEMORY[0x24BEC84D8]();
}

uint64_t ICCreateLoggableValueForDSID()
{
  return MEMORY[0x24BEC8510]();
}

uint64_t ICCurrentApplicationIsSystemApp()
{
  return MEMORY[0x24BEC8518]();
}

uint64_t ICEnvironmentNetworkTypeIsBluetooth()
{
  return MEMORY[0x24BEC8550]();
}

uint64_t ICEnvironmentNetworkTypeIsCellular()
{
  return MEMORY[0x24BEC8558]();
}

uint64_t ICEnvironmentNetworkTypeIsWiFi()
{
  return MEMORY[0x24BEC8560]();
}

uint64_t ICEnvironmentNetworkTypeIsWired()
{
  return MEMORY[0x24BEC8568]();
}

uint64_t ICSecureKeyDeliveryRequestSupportsAssetResourceLoadingRequest()
{
  return MEMORY[0x24BEC8638]();
}

uint64_t ICUserNotificationGetResponseButton()
{
  return MEMORY[0x24BEC8738]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x24BED8448]();
}

uint64_t MPAVRouteSubtypeDescription()
{
  return MEMORY[0x24BDDBA40]();
}

uint64_t MPArtworkImageJPEGRepresentation()
{
  return MEMORY[0x24BDDBA50]();
}

uint64_t MPArtworkImagePNGRepresentation()
{
  return MEMORY[0x24BDDBA58]();
}

uint64_t MPContainerUniqueID()
{
  return MEMORY[0x24BDDBA88]();
}

uint64_t MPContainerUniqueIDPrefix()
{
  return MEMORY[0x24BDDBA90]();
}

uint64_t MPMediaContentTasteTasteTypeToMPMediaEntityLikedState()
{
  return MEMORY[0x24BDDBAD0]();
}

uint64_t MPModelMovieIsRestricted()
{
  return MEMORY[0x24BDDBD78]();
}

uint64_t MPModelTVEpisodeIsRestricted()
{
  return MEMORY[0x24BDDC400]();
}

uint64_t MPMusicRepeatModeForMPRepeatType()
{
  return MEMORY[0x24BDDC448]();
}

uint64_t MPMusicShuffleModeForMPShuffleType()
{
  return MEMORY[0x24BDDC450]();
}

uint64_t MPNSStringFromRepeatType()
{
  return MEMORY[0x24BDDC458]();
}

uint64_t MPNSStringFromShuffleType()
{
  return MEMORY[0x24BDDC460]();
}

uint64_t MPProcessInfoSystemWallClockUptime()
{
  return MEMORY[0x24BDDC558]();
}

uint64_t MPRemoteCommandStatusFromMRSendCommandResultStatus()
{
  return MEMORY[0x24BDDC578]();
}

uint64_t MPRepeatTypeDescription()
{
  return MEMORY[0x24BDDC580]();
}

uint64_t MPRepeatTypeFromMediaRemoteRepeatMode()
{
  return MEMORY[0x24BDDC588]();
}

uint64_t MPRepeatTypeToMediaRemoteRepeatMode()
{
  return MEMORY[0x24BDDC590]();
}

uint64_t MPSharedBackgroundTaskProvider()
{
  return MEMORY[0x24BDDC5B8]();
}

uint64_t MPShouldIncrementPlayCountForElapsedTime()
{
  return MEMORY[0x24BDDC5C0]();
}

uint64_t MPShuffleTypeDescription()
{
  return MEMORY[0x24BDDC5C8]();
}

uint64_t MPShuffleTypeFromMediaRemoteShuffleMode()
{
  return MEMORY[0x24BDDC5D0]();
}

uint64_t MPShuffleTypeToMediaRemoteShuffleMode()
{
  return MEMORY[0x24BDDC5D8]();
}

uint64_t MPSleepTimerStopModeFromMediaRemoteSleepTimerStopMode()
{
  return MEMORY[0x24BDDC5E0]();
}

uint64_t MPSleepTimerStopModeToMediaRemoteSleepTimerStopMode()
{
  return MEMORY[0x24BDDC5E8]();
}

uint64_t MPStoreItemMetadataInt64NormalizeStoreIDValue()
{
  return MEMORY[0x24BDDC5F8]();
}

uint64_t MPStoreItemMetadataItemKindGetPlayabilityInformation()
{
  return MEMORY[0x24BDDC608]();
}

uint64_t MPStoreItemMetadataStringNormalizeStoreIDValue()
{
  return MEMORY[0x24BDDC620]();
}

uint64_t MPUIApplication()
{
  return MEMORY[0x24BDDC660]();
}

uint64_t MRAVEndpointCopyOutputDevices()
{
  return MEMORY[0x24BE64D98]();
}

uint64_t MRAVEndpointGetDesignatedGroupLeader()
{
  return MEMORY[0x24BE64DB0]();
}

uint64_t MRAVEndpointGetExternalDevice()
{
  return MEMORY[0x24BE64DB8]();
}

uint64_t MRAVEndpointGetLocalEndpoint()
{
  return MEMORY[0x24BE64DC0]();
}

uint64_t MRAVEndpointGetMyGroupLeaderWithTimeout()
{
  return MEMORY[0x24BE64DC8]();
}

uint64_t MRAVEndpointGetOutputDeviceUIDVolume()
{
  return MEMORY[0x24BE64DD0]();
}

uint64_t MRAVEndpointGetOutputDeviceVolume()
{
  return MEMORY[0x24BE64DE0]();
}

uint64_t MRAVEndpointGroupDevicesAndSendCommandWithResult()
{
  return MEMORY[0x24BE64DE8]();
}

uint64_t MRAVEndpointIsLocalEndpoint()
{
  return MEMORY[0x24BE64DF0]();
}

uint64_t MRAVEndpointObserverAddEndpointChangedCallback()
{
  return MEMORY[0x24BE64E00]();
}

uint64_t MRAVEndpointObserverBegin()
{
  return MEMORY[0x24BE64E08]();
}

uint64_t MRAVEndpointObserverCreateWithOutputDeviceUID()
{
  return MEMORY[0x24BE64E10]();
}

uint64_t MRAVEndpointObserverEnd()
{
  return MEMORY[0x24BE64E18]();
}

uint64_t MRAVEndpointPredictGroupLeader()
{
  return MEMORY[0x24BE64E20]();
}

uint64_t MRAVEndpointSetOutputDeviceUIDVolume()
{
  return MEMORY[0x24BE64E28]();
}

uint64_t MRAVOutputContextCopyOutputDevices()
{
  return MEMORY[0x24BE64E38]();
}

uint64_t MRAVOutputContextGetSharedAudioPresentationContext()
{
  return MEMORY[0x24BE64E40]();
}

uint64_t MRAVOutputContextSetOutputDevices()
{
  return MEMORY[0x24BE64E48]();
}

uint64_t MRAVOutputDeviceCanAccessAppleMusic()
{
  return MEMORY[0x24BE64E50]();
}

uint64_t MRAVOutputDeviceCopyUniqueIdentifier()
{
  return MEMORY[0x24BE64E70]();
}

uint64_t MRAVOutputDeviceIsRemoteControllable()
{
  return MEMORY[0x24BE64E90]();
}

uint64_t MRAVReconnaissanceSessionBeginEndpointsSearch()
{
  return MEMORY[0x24BE64EB0]();
}

uint64_t MRAVReconnaissanceSessionBeginSearch()
{
  return MEMORY[0x24BE64EB8]();
}

uint64_t MRAVReconnaissanceSessionCreateWithEndpointFeatures()
{
  return MEMORY[0x24BE64EC8]();
}

uint64_t MRAVReconnaissanceSessionCreateWithMatchingLogicalDeviceIDs()
{
  return MEMORY[0x24BE64ED0]();
}

uint64_t MRAVReconnaissanceSessionCreateWithMatchingOutputGroupIDFeatures()
{
  return MEMORY[0x24BE64ED8]();
}

uint64_t MRAVReconnaissanceSessionSetExpectedLogicalDevices()
{
  return MEMORY[0x24BE64EE0]();
}

uint64_t MRAVReconnaissanceSessionSetReturnPartialResults()
{
  return MEMORY[0x24BE64EE8]();
}

uint64_t MRAVReconnaissanceSessionSetTargetAudioSessionID()
{
  return MEMORY[0x24BE64EF0]();
}

uint64_t MRAVReconnaissanceSessionSetWaitForCompleteClusters()
{
  return MEMORY[0x24BE64EF8]();
}

uint64_t MRAVReconnaissanceSessionSetWaitForUnanimousEndpoints()
{
  return MEMORY[0x24BE64F00]();
}

uint64_t MRContentItemGetArtworkData()
{
  return MEMORY[0x24BE64F58]();
}

uint64_t MRContentItemGetHasArtworkData()
{
  return MEMORY[0x24BE64F60]();
}

uint64_t MRContentItemGetIdentifier()
{
  return MEMORY[0x24BE64F68]();
}

uint64_t MRContentItemHasPlaybackRate()
{
  return MEMORY[0x24BE64FA8]();
}

uint64_t MRContentItemIsEmpty()
{
  return MEMORY[0x24BE64FB0]();
}

uint64_t MRContentItemMerge()
{
  return MEMORY[0x24BE64FB8]();
}

uint64_t MRExternalDeviceCopyCustomOrigin()
{
  return MEMORY[0x24BE64FD8]();
}

uint64_t MRGroupSessionRouteTypeDescription()
{
  return MEMORY[0x24BE65000]();
}

uint64_t MRMediaRemoteAddPlayerPathInvalidationHandler()
{
  return MEMORY[0x24BE65020]();
}

uint64_t MRMediaRemoteApplicationIsSystemApplication()
{
  return MEMORY[0x24BE65028]();
}

uint64_t MRMediaRemoteApplicationIsSystemBooksApplication()
{
  return MEMORY[0x24BE65030]();
}

uint64_t MRMediaRemoteApplicationIsSystemMediaApplication()
{
  return MEMORY[0x24BE65038]();
}

uint64_t MRMediaRemoteApplicationIsSystemPodcastApplication()
{
  return MEMORY[0x24BE65040]();
}

uint64_t MRMediaRemoteCommandHandlerStatusFromMPRemoteCommandHandlerStatus()
{
  return MEMORY[0x24BDDC668]();
}

uint64_t MRMediaRemoteCommandInfoCopyOptions()
{
  return MEMORY[0x24BE65078]();
}

uint64_t MRMediaRemoteCommandInfoCopyValueForKey()
{
  return MEMORY[0x24BE65080]();
}

uint64_t MRMediaRemoteCommandInfoCreate()
{
  return MEMORY[0x24BE65088]();
}

uint64_t MRMediaRemoteCommandInfoGetCommand()
{
  return MEMORY[0x24BE65098]();
}

uint64_t MRMediaRemoteCommandInfoGetEnabled()
{
  return MEMORY[0x24BE650A0]();
}

uint64_t MRMediaRemoteCommandInfoGetIntegerValueForKey()
{
  return MEMORY[0x24BE650A8]();
}

uint64_t MRMediaRemoteCommandInfoSetCommand()
{
  return MEMORY[0x24BE650B0]();
}

uint64_t MRMediaRemoteCommandInfoSetEnabled()
{
  return MEMORY[0x24BE650B8]();
}

uint64_t MRMediaRemoteCopyCommandDescription()
{
  return MEMORY[0x24BE650C0]();
}

uint64_t MRMediaRemoteCopyCommandHandlerStatusDescription()
{
  return MEMORY[0x24BE650C8]();
}

uint64_t MRMediaRemoteCopyLocalDeviceSystemClassicalRoomApplicationDisplayID()
{
  return MEMORY[0x24BE650D8]();
}

uint64_t MRMediaRemoteCopyLocalDeviceSystemMediaApplicationDisplayID()
{
  return MEMORY[0x24BE650E0]();
}

uint64_t MRMediaRemoteCopyPlaybackStateDescription()
{
  return MEMORY[0x24BE650E8]();
}

uint64_t MRMediaRemoteCopySendCommandErrorDescription()
{
  return MEMORY[0x24BE650F0]();
}

uint64_t MRMediaRemoteCopySystemMediaApplicationDefaultSupportedCommands()
{
  return MEMORY[0x24BE650F8]();
}

uint64_t MRMediaRemoteCreateError()
{
  return MEMORY[0x24BE65100]();
}

uint64_t MRMediaRemoteErrorIsInformational()
{
  return MEMORY[0x24BE65108]();
}

uint64_t MRMediaRemoteGetActiveOrigin()
{
  return MEMORY[0x24BE65110]();
}

uint64_t MRMediaRemoteGetDeviceInfo()
{
  return MEMORY[0x24BE65130]();
}

uint64_t MRMediaRemoteGetElectedPlayerPath()
{
  return MEMORY[0x24BE65138]();
}

uint64_t MRMediaRemoteGetIsGroupLeader()
{
  return MEMORY[0x24BE65140]();
}

uint64_t MRMediaRemoteGetLocalOrigin()
{
  return MEMORY[0x24BE65148]();
}

uint64_t MRMediaRemoteGetPlaybackStateForPlayer()
{
  return MEMORY[0x24BE651A0]();
}

uint64_t MRMediaRemoteGetSupportedCommandsForApp()
{
  return MEMORY[0x24BE651B8]();
}

uint64_t MRMediaRemoteGetSupportedCommandsForPlayer()
{
  return MEMORY[0x24BE651C8]();
}

uint64_t MRMediaRemoteNowPlayingBless()
{
  return MEMORY[0x24BE651E0]();
}

uint64_t MRMediaRemoteNowPlayingResolvePlayerPath()
{
  return MEMORY[0x24BE651E8]();
}

uint64_t MRMediaRemoteRemovePlayerPathInvalidationHandler()
{
  return MEMORY[0x24BE65200]();
}

uint64_t MRMediaRemoteRequestNowPlayingPlaybackQueueForPlayerSync()
{
  return MEMORY[0x24BE65208]();
}

uint64_t MRMediaRemoteSendCommandForOriginWithReply()
{
  return MEMORY[0x24BE65228]();
}

uint64_t MRMediaRemoteSendCommandToPlayerWithResult()
{
  return MEMORY[0x24BE65240]();
}

uint64_t MRMediaRemoteSendCommandWithReply()
{
  return MEMORY[0x24BE65248]();
}

uint64_t MRMediaRemoteSetParentApplication()
{
  return MEMORY[0x24BE65268]();
}

uint64_t MRMediaRemoteSetWantsSupportedCommandsChangedNotifications()
{
  return MEMORY[0x24BE65278]();
}

uint64_t MRMediaRemoteUnregisterForNowPlayingNotifications()
{
  return MEMORY[0x24BE65280]();
}

uint64_t MRNowPlayingClientCopyBundleIdentifierHierarchy()
{
  return MEMORY[0x24BE65290]();
}

uint64_t MRNowPlayingClientCreate()
{
  return MEMORY[0x24BE65298]();
}

uint64_t MRNowPlayingClientGetBundleIdentifier()
{
  return MEMORY[0x24BE652A0]();
}

uint64_t MRNowPlayingClientGetDisplayName()
{
  return MEMORY[0x24BE652A8]();
}

uint64_t MRNowPlayingClientGetParentAppBundleIdentifier()
{
  return MEMORY[0x24BE652B0]();
}

uint64_t MRNowPlayingClientGetProcessIdentifier()
{
  return MEMORY[0x24BE652B8]();
}

uint64_t MRNowPlayingPlayerCreate()
{
  return MEMORY[0x24BE652C0]();
}

uint64_t MRNowPlayingPlayerGetIdentifier()
{
  return MEMORY[0x24BE652C8]();
}

uint64_t MRNowPlayingPlayerPathCopy()
{
  return MEMORY[0x24BE652D0]();
}

uint64_t MRNowPlayingPlayerPathCreate()
{
  return MEMORY[0x24BE652D8]();
}

uint64_t MRNowPlayingPlayerPathEqualToPlayerPath()
{
  return MEMORY[0x24BE652E0]();
}

uint64_t MRNowPlayingPlayerPathGetClient()
{
  return MEMORY[0x24BE652E8]();
}

uint64_t MRNowPlayingPlayerPathGetIsResolved()
{
  return MEMORY[0x24BE652F0]();
}

uint64_t MRNowPlayingPlayerPathGetOrigin()
{
  return MEMORY[0x24BE652F8]();
}

uint64_t MRNowPlayingPlayerPathGetPlayer()
{
  return MEMORY[0x24BE65300]();
}

uint64_t MRNowPlayingPlayerPathIsLocal()
{
  return MEMORY[0x24BE65308]();
}

uint64_t MRNowPlayingPlayerSetIdentifier()
{
  return MEMORY[0x24BE65310]();
}

uint64_t MROriginEqualToOrigin()
{
  return MEMORY[0x24BE65328]();
}

uint64_t MROriginGetDisplayName()
{
  return MEMORY[0x24BE65330]();
}

uint64_t MROriginGetUniqueIdentifier()
{
  return MEMORY[0x24BE65338]();
}

uint64_t MROriginIsLocalOrigin()
{
  return MEMORY[0x24BE65340]();
}

uint64_t MROutputDeviceSubtypeFromGroupSessionRoute()
{
  return MEMORY[0x24BE65348]();
}

uint64_t MROutputDeviceTypeFromGroupSessionRoute()
{
  return MEMORY[0x24BE65350]();
}

uint64_t MRPlaybackQueueCopyContentItems()
{
  return MEMORY[0x24BE65360]();
}

uint64_t MRPlaybackQueueGetQueueID()
{
  return MEMORY[0x24BE65370]();
}

uint64_t MRPlaybackQueueGetRange()
{
  return MEMORY[0x24BE65378]();
}

uint64_t MRPlaybackQueueRequestCreate()
{
  return MEMORY[0x24BE65388]();
}

uint64_t MRPlaybackQueueRequestCreateWithIdentifiers()
{
  return MEMORY[0x24BE65398]();
}

uint64_t MRPlaybackQueueRequestGetRange()
{
  return MEMORY[0x24BE653A0]();
}

uint64_t MRPlaybackQueueRequestSetIdentifiers()
{
  return MEMORY[0x24BE653A8]();
}

uint64_t MRPlaybackQueueRequestSetIncludeAlignments()
{
  return MEMORY[0x24BE653B0]();
}

uint64_t MRPlaybackQueueRequestSetIncludeArtwork()
{
  return MEMORY[0x24BE653B8]();
}

uint64_t MRPlaybackQueueRequestSetIncludeInfo()
{
  return MEMORY[0x24BE653C0]();
}

uint64_t MRPlaybackQueueRequestSetIncludeLanguageOptions()
{
  return MEMORY[0x24BE653C8]();
}

uint64_t MRPlaybackQueueRequestSetIncludeMetadata()
{
  return MEMORY[0x24BE653D0]();
}

uint64_t MRPlaybackQueueRequestSetIncludeSections()
{
  return MEMORY[0x24BE653D8]();
}

uint64_t MRPlaybackQueueRequestSetLabel()
{
  return MEMORY[0x24BE653E0]();
}

uint64_t MRPlaybackSessionCreate()
{
  return MEMORY[0x24BE653E8]();
}

uint64_t MRPlaybackSessionCreateExternalRepresentation()
{
  return MEMORY[0x24BE653F0]();
}

uint64_t MRSystemAppPlaybackQueueCreate()
{
  return MEMORY[0x24BE653F8]();
}

uint64_t MRSystemAppPlaybackQueueCreateExternalRepresentation()
{
  return MEMORY[0x24BE65400]();
}

uint64_t MRSystemAppPlaybackQueueCreateFromExternalRepresentation()
{
  return MEMORY[0x24BE65408]();
}

uint64_t MRSystemAppPlaybackQueueDestroy()
{
  return MEMORY[0x24BE65410]();
}

uint64_t MRSystemAppPlaybackQueueSetCustomData()
{
  return MEMORY[0x24BE65420]();
}

uint64_t MRSystemAppPlaybackQueueSetCustomDataIdentifier()
{
  return MEMORY[0x24BE65428]();
}

uint64_t MRSystemAppPlaybackQueueSetFeatureName()
{
  return MEMORY[0x24BE65430]();
}

uint64_t MRSystemAppPlaybackQueueSetGenericTrackIdentifiers()
{
  return MEMORY[0x24BE65438]();
}

uint64_t MRSystemAppPlaybackQueueSetIsRequestingImmediatePlayback()
{
  return MEMORY[0x24BE65440]();
}

uint64_t MRSystemAppPlaybackQueueSetRadioStationIDType()
{
  return MEMORY[0x24BE65458]();
}

uint64_t MRSystemAppPlaybackQueueSetRadioStationStringIdentifier()
{
  return MEMORY[0x24BE65460]();
}

uint64_t MRSystemAppPlaybackQueueSetReplaceIntent()
{
  return MEMORY[0x24BE65468]();
}

uint64_t MRSystemAppPlaybackQueueSetShouldOverrideManuallyCuratedQueue()
{
  return MEMORY[0x24BE65470]();
}

uint64_t MRSystemAppPlaybackQueueSetSiriAssetInfo()
{
  return MEMORY[0x24BE65478]();
}

uint64_t MRSystemAppPlaybackQueueSetSiriRecommendationIdentifier()
{
  return MEMORY[0x24BE65480]();
}

uint64_t MRSystemAppPlaybackQueueSetSiriWHAMetricsInfo()
{
  return MEMORY[0x24BE65488]();
}

uint64_t MRSystemAppPlaybackQueueSetTracklistCollectionIdentifierSetData()
{
  return MEMORY[0x24BE65490]();
}

uint64_t MRSystemAppPlaybackQueueSetTracklistRepeatMode()
{
  return MEMORY[0x24BE65498]();
}

uint64_t MRSystemAppPlaybackQueueSetTracklistShuffleMode()
{
  return MEMORY[0x24BE654A0]();
}

uint64_t MRSystemAppPlaybackQueueSetTracklistStoreIDs()
{
  return MEMORY[0x24BE654A8]();
}

uint64_t MSVBundleIDForAuditToken()
{
  return MEMORY[0x24BE65AC0]();
}

uint64_t MSVDeviceIsAppleTV()
{
  return MEMORY[0x24BE65AD8]();
}

uint64_t MSVDeviceIsAudioAccessory()
{
  return MEMORY[0x24BE65AE0]();
}

uint64_t MSVDeviceIsHomePod()
{
  return MEMORY[0x24BE65AE8]();
}

uint64_t MSVDeviceIsInternalCarry()
{
  return MEMORY[0x24BE65AF0]();
}

uint64_t MSVDeviceIsROSDevice()
{
  return MEMORY[0x24BE65AF8]();
}

uint64_t MSVDeviceIsWatch()
{
  return MEMORY[0x24BE65B00]();
}

uint64_t MSVDeviceOSIsInternalInstall()
{
  return MEMORY[0x24BE65B08]();
}

uint64_t MSVDeviceSupportsDelegatedIdentities()
{
  return MEMORY[0x24BE65B10]();
}

uint64_t MSVDeviceSupportsExtendedColorDisplay()
{
  return MEMORY[0x24BE65B18]();
}

uint64_t MSVDeviceSupportsLosslessMusic()
{
  return MEMORY[0x24BE65B20]();
}

uint64_t MSVDeviceSupportsMultiChannelMusic()
{
  return MEMORY[0x24BE65B28]();
}

uint64_t MSVDeviceSupportsVocalAttenuation()
{
  return MEMORY[0x24BE65B30]();
}

uint64_t MSVGetCurrentThreadPriority()
{
  return MEMORY[0x24BE65B38]();
}

uint64_t MSVGetDeviceProductType()
{
  return MEMORY[0x24BE65B40]();
}

uint64_t MSVGetDiskUsageForPath()
{
  return MEMORY[0x24BE65B48]();
}

uint64_t MSVGetKernelBootTime()
{
  return MEMORY[0x24BE65B50]();
}

uint64_t MSVGetMaximumScreenSize()
{
  return MEMORY[0x24BE65B58]();
}

uint64_t MSVGetProcessLaunchTime()
{
  return MEMORY[0x24BE65B60]();
}

uint64_t MSVGzipCompressData()
{
  return MEMORY[0x24BE65B68]();
}

uint64_t MSVGzipDecompressData()
{
  return MEMORY[0x24BE65B70]();
}

uint64_t MSVHasherSharedSeed()
{
  return MEMORY[0x24BE65B80]();
}

uint64_t MSVLogAddStateHandler()
{
  return MEMORY[0x24BE65B98]();
}

uint64_t MSVLogDateFormatter()
{
  return MEMORY[0x24BE65BA0]();
}

uint64_t MSVLogRemoveStateHandler()
{
  return MEMORY[0x24BE65BA8]();
}

uint64_t MSVMobileHomeDirectory()
{
  return MEMORY[0x24BE65BB0]();
}

uint64_t MSVNanoIDCreate()
{
  return MEMORY[0x24BE65BB8]();
}

uint64_t MSVNanoIDCreateTaggedPointer()
{
  return MEMORY[0x24BE65BC0]();
}

uint64_t MSVOfflineHLSFileExtensions()
{
  return MEMORY[0x24BE65BC8]();
}

uint64_t MSVProcessCopyMediaFrameworksDescriptions()
{
  return MEMORY[0x24BE65BD0]();
}

uint64_t MSVProcessCopyUUID()
{
  return MEMORY[0x24BE65BD8]();
}

uint64_t MSVReplacementRangeForRanges()
{
  return MEMORY[0x24BE65BE8]();
}

uint64_t MSVSignedUnionRange()
{
  return MEMORY[0x24BE65BF8]();
}

uint64_t MSVTimelineChartPrefix()
{
  return MEMORY[0x24BE65C00]();
}

uint64_t MSVUnarchivedObjectOfClass()
{
  return MEMORY[0x24BE65C10]();
}

OSStatus MTAudioProcessingTapCreate(CFAllocatorRef allocator, const MTAudioProcessingTapCallbacks *callbacks, MTAudioProcessingTapCreationFlags flags, MTAudioProcessingTapRef *tapOut)
{
  return MEMORY[0x24BDDCE78](allocator, callbacks, *(_QWORD *)&flags, tapOut);
}

OSStatus MTAudioProcessingTapGetSourceAudio(MTAudioProcessingTapRef tap, CMItemCount numberFrames, AudioBufferList *bufferListInOut, MTAudioProcessingTapFlags *flagsOut, CMTimeRange *timeRangeOut, CMItemCount *numberFramesOut)
{
  return MEMORY[0x24BDDCE80](tap, numberFrames, bufferListInOut, flagsOut, timeRangeOut, numberFramesOut);
}

void *__cdecl MTAudioProcessingTapGetStorage(MTAudioProcessingTapRef tap)
{
  return (void *)MEMORY[0x24BDDCE88](tap);
}

uint64_t MTMultitrackAudioProcessingTapCreate()
{
  return MEMORY[0x24BDDCE90]();
}

NSArray *__cdecl NSAllMapTableValues(NSMapTable *table)
{
  return (NSArray *)MEMORY[0x24BDD0B38](table);
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

void NSEndMapTableEnumeration(NSMapEnumerator *enumerator)
{
  MEMORY[0x24BDD0BD0](enumerator);
}

NSMapEnumerator *__cdecl NSEnumerateMapTable(NSMapEnumerator *__return_ptr retstr, NSMapTable *table)
{
  return (NSMapEnumerator *)MEMORY[0x24BDD0BD8](retstr, table);
}

void *__cdecl NSMapGet(NSMapTable *table, const void *key)
{
  return (void *)MEMORY[0x24BDD1018](table, key);
}

void NSMapInsert(NSMapTable *table, const void *key, const void *value)
{
  MEMORY[0x24BDD1020](table, key, value);
}

BOOL NSNextMapEnumeratorPair(NSMapEnumerator *enumerator, void **key, void **value)
{
  return MEMORY[0x24BDD10F0](enumerator, key, value);
}

uint64_t NSPersistentStringFromMTStopReason()
{
  return MEMORY[0x24BE737B8]();
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x24BDD1218](aSelectorName);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x24BEBD2C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x24BEBD2C8]((__n128)size, *(__n128 *)&size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

uint64_t NSStringFromICLiveLinkEventType()
{
  return MEMORY[0x24BEC8740]();
}

uint64_t NSStringFromMPModelGenericObjectType()
{
  return MEMORY[0x24BDDC670]();
}

uint64_t NSStringFromMPModelRadioStationSubtype()
{
  return MEMORY[0x24BDDC678]();
}

uint64_t NSStringFromMPModelRadioStationType()
{
  return MEMORY[0x24BDDC680]();
}

uint64_t NSStringFromMPPlaybackContextSupplementalReason()
{
  return MEMORY[0x24BDDC688]();
}

uint64_t NSStringFromMPRemoteCommandHandlerDialogActionType()
{
  return MEMORY[0x24BDDC690]();
}

uint64_t NSStringFromMSVSignedRange()
{
  return MEMORY[0x24BE65C20]();
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

uint64_t PBDataWriterWriteBOOLField()
{
  return MEMORY[0x24BE7AF80]();
}

uint64_t PBDataWriterWriteDataField()
{
  return MEMORY[0x24BE7AF88]();
}

uint64_t PBDataWriterWriteDoubleField()
{
  return MEMORY[0x24BE7AF90]();
}

uint64_t PBDataWriterWriteInt32Field()
{
  return MEMORY[0x24BE7AFA8]();
}

uint64_t PBDataWriterWriteInt64Field()
{
  return MEMORY[0x24BE7AFB0]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x24BE7AFD8]();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return MEMORY[0x24BE7AFE8]();
}

uint64_t PBDataWriterWriteUint64Field()
{
  return MEMORY[0x24BE7B008]();
}

uint64_t PBReaderPlaceMark()
{
  return MEMORY[0x24BE7B018]();
}

uint64_t PBReaderReadData()
{
  return MEMORY[0x24BE7B028]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x24BE7B030]();
}

uint64_t PBReaderRecallMark()
{
  return MEMORY[0x24BE7B038]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x24BE7B048]();
}

uint64_t PBRepeatedInt32Add()
{
  return MEMORY[0x24BE7B0C8]();
}

uint64_t PBRepeatedInt32Clear()
{
  return MEMORY[0x24BE7B0D0]();
}

uint64_t PBRepeatedInt32Copy()
{
  return MEMORY[0x24BE7B0D8]();
}

uint64_t PBRepeatedInt32Hash()
{
  return MEMORY[0x24BE7B0E0]();
}

uint64_t PBRepeatedInt32IsEqual()
{
  return MEMORY[0x24BE7B0E8]();
}

uint64_t PBRepeatedInt32NSArray()
{
  return MEMORY[0x24BE7B0F0]();
}

uint64_t PPSCreateTelemetryIdentifier()
{
  return MEMORY[0x24BE74F78]();
}

uint64_t PPSSendTelemetry()
{
  return MEMORY[0x24BE74F80]();
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

uint64_t _CFNetworkCopyDefaultUserAgentString()
{
  return MEMORY[0x24BDB7570]();
}

uint64_t _MRLogForCategory()
{
  return MEMORY[0x24BE65590]();
}

uint64_t _MRMediaRemoteRegisterForNowPlayingNotificationsEx()
{
  return MEMORY[0x24BE65598]();
}

uint64_t _NSIsNSArray()
{
  return MEMORY[0x24BDBD150]();
}

uint64_t _NSIsNSDictionary()
{
  return MEMORY[0x24BDBD168]();
}

uint64_t _NSIsNSNumber()
{
  return MEMORY[0x24BDBD170]();
}

uint64_t _NSIsNSString()
{
  return MEMORY[0x24BDBD178]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

float __exp10f(float a1)
{
  float result;

  MEMORY[0x24BDAC7E0](a1);
  return result;
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x24BDAC838](*(_QWORD *)&a1, a2);
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x24BDAC848]();
}

int __sprintf_chk(char *a1, int a2, size_t a3, const char *a4, ...)
{
  return MEMORY[0x24BDAC8B8](a1, *(_QWORD *)&a2, a3, a4);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACC10](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
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

uint32_t arc4random(void)
{
  return MEMORY[0x24BDAD158]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x24BDAD170](*(_QWORD *)&__upper_bound);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return MEMORY[0x24BDAD9C0](*(_QWORD *)&__clock_id);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCB8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCE0](queue, block);
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCF8](queue, block);
}

void dispatch_block_cancel(dispatch_block_t block)
{
  MEMORY[0x24BDADD10](block);
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x24BDADD18](flags, block);
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x24BDADD20](flags, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority, block);
}

intptr_t dispatch_block_wait(dispatch_block_t block, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADD40](block, timeout);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADDB8](group, queue, block);
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

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADDE0](group, queue, block);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADDF0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED8](label, attr, target);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x24BDADF68](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x24BDADFD0](source, start, interval, leeway);
}

void dispatch_suspend(dispatch_object_t object)
{
  MEMORY[0x24BDADFE0](object);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

lldiv_t div(uint64_t __x, uint64_t __y)
{
  uint64_t v2;
  uint64_t v3;
  lldiv_t result;

  v2 = MEMORY[0x24BDAE050](__x, __y);
  result.rem = v3;
  result.quot = v2;
  return result;
}

long double exp2(long double __x)
{
  long double result;

  MEMORY[0x24BDAE278](__x);
  return result;
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

uint64_t kdebug_trace()
{
  return MEMORY[0x24BDAE958]();
}

ldiv_t ldiv(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  ldiv_t result;

  v2 = MEMORY[0x24BDAEA40](a1, a2);
  result.rem = v3;
  result.quot = v2;
  return result;
}

lldiv_t lldiv(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  lldiv_t result;

  v2 = MEMORY[0x24BDAEA88](a1, a2);
  result.rem = v3;
  result.quot = v2;
  return result;
}

float log10f(float a1)
{
  float result;

  MEMORY[0x24BDAEAB8](a1);
  return result;
}

long double log2(long double __x)
{
  long double result;

  MEMORY[0x24BDAEAD8](__x);
  return result;
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x24BDAEB30]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x24BDAEB48]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x24BDAEC68](info);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x24BDAED08](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

uint64_t msv_dispatch_on_main_queue()
{
  return MEMORY[0x24BE65CE0]();
}

uint64_t msv_dispatch_sync_on_queue()
{
  return MEMORY[0x24BE65CE8]();
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x24BDAF138](*(_QWORD *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x24BDAF148](*(_QWORD *)&token, state64);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x24BDAF170](name, out_token, queue, handler);
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

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x24BEDCFD8](exc_buf);
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

void objc_end_catch(void)
{
  MEMORY[0x24BEDD050]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

void objc_exception_throw(id exception)
{
  MEMORY[0x24BEDD078](exception);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x24BEDD080](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

void objc_moveWeak(id *to, id *from)
{
  MEMORY[0x24BEDD0F8](to, from);
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

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
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

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x24BDAF400](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x24BDAF408](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x24BDAF410](log, ptr);
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
  MEMORY[0x24BDAF458](lock);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

uint64_t os_unfair_recursive_lock_lock_with_options()
{
  return MEMORY[0x24BDAF490]();
}

uint64_t os_unfair_recursive_lock_unlock()
{
  return MEMORY[0x24BDAF4A8]();
}

objc_method_description protocol_getMethodDescription(Protocol *p, SEL aSel, BOOL isRequiredMethod, BOOL isInstanceMethod)
{
  const char *v4;
  char *v5;
  objc_method_description result;

  v4 = (const char *)MEMORY[0x24BEDD4E8](p, aSel, isRequiredMethod, isInstanceMethod);
  result.types = v5;
  result.name = v4;
  return result;
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x24BDAF860](a1);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x24BDAF888](a1, a2);
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x24BDAF9A8](a1, a2);
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x24BDAFA10]();
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x24BDAFAB8](__ptr, __size);
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x24BDAFE38](*(_QWORD *)&a1);
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

uint64_t swift_asyncLet_begin()
{
  return MEMORY[0x24BEE7198]();
}

uint64_t swift_asyncLet_finish()
{
  return MEMORY[0x24BEE71A0]();
}

uint64_t swift_asyncLet_get_throwing()
{
  return MEMORY[0x24BEE71B0]();
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

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x24BEE4C40]();
}

uint64_t swift_dynamicCastClassUnconditional()
{
  return MEMORY[0x24BEE4C48]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x24BEE4C60]();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return MEMORY[0x24BEE4C68]();
}

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return MEMORY[0x24BEE4C70]();
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

uint64_t swift_getExistentialMetatypeMetadata()
{
  return MEMORY[0x24BEE4D20]();
}

uint64_t swift_getExistentialTypeMetadata()
{
  return MEMORY[0x24BEE4D28]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getFunctionTypeMetadata()
{
  return MEMORY[0x24BEE4D50]();
}

uint64_t swift_getFunctionTypeMetadata0()
{
  return MEMORY[0x24BEE4D58]();
}

uint64_t swift_getFunctionTypeMetadata1()
{
  return MEMORY[0x24BEE4D60]();
}

uint64_t swift_getFunctionTypeMetadata2()
{
  return MEMORY[0x24BEE4D68]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
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

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x24BEE4DF8]();
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

uint64_t swift_projectBox()
{
  return MEMORY[0x24BEE4ED0]();
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

uint64_t swift_task_isCancelled()
{
  return MEMORY[0x24BEE7248]();
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

uint64_t swift_unknownObjectUnownedAssign()
{
  return MEMORY[0x24BEE4F90]();
}

uint64_t swift_unknownObjectUnownedDestroy()
{
  return MEMORY[0x24BEE4F98]();
}

uint64_t swift_unknownObjectUnownedInit()
{
  return MEMORY[0x24BEE4FA0]();
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

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x24BEE5058]();
}

int usleep(useconds_t a1)
{
  return MEMORY[0x24BDB02E8](*(_QWORD *)&a1);
}

FFTSetup vDSP_create_fftsetup(vDSP_Length __Log2n, FFTRadix __Radix)
{
  return (FFTSetup)MEMORY[0x24BDB31A0](__Log2n, *(_QWORD *)&__Radix);
}

void vDSP_ctoz(const DSPComplex *__C, vDSP_Stride __IC, const DSPSplitComplex *__Z, vDSP_Stride __IZ, vDSP_Length __N)
{
  MEMORY[0x24BDB31A8](__C, __IC, __Z, __IZ, __N);
}

void vDSP_destroy_fftsetup(FFTSetup __setup)
{
  MEMORY[0x24BDB31C0](__setup);
}

void vDSP_fft_zrip(FFTSetup __Setup, const DSPSplitComplex *__C, vDSP_Stride __IC, vDSP_Length __Log2N, FFTDirection __Direction)
{
  MEMORY[0x24BDB31F8](__Setup, __C, __IC, __Log2N, *(_QWORD *)&__Direction);
}

void vDSP_sve(const float *__A, vDSP_Stride __I, float *__C, vDSP_Length __N)
{
  MEMORY[0x24BDB32D0](__A, __I, __C, __N);
}

void vDSP_vasm(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, const float *__C, float *__D, vDSP_Stride __ID, vDSP_Length __N)
{
  MEMORY[0x24BDB3320](__A, __IA, __B, __IB, __C, __D, __ID, __N);
}

void vDSP_vclr(float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x24BDB3330](__C, __IC, __N);
}

void vDSP_zaspec(const DSPSplitComplex *__A, float *__C, vDSP_Length __N)
{
  MEMORY[0x24BDB3568](__A, __C, __N);
}

