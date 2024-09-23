void sub_235C60450()
{
  strcpy((char *)&qword_2542992A8, "RC Acceptance");
  *(_WORD *)&algn_2542992B0[6] = -4864;
}

uint64_t sub_235C60480(void *a1, uint64_t a2)
{
  void *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  _QWORD *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v18[2];
  _QWORD aBlock[6];

  v5 = sub_235CA3738();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_235CA375C();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = v2;
  v13[3] = a1;
  v13[4] = a2;
  aBlock[4] = sub_235C69B34;
  aBlock[5] = v13;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_235C9F468;
  aBlock[3] = &block_descriptor_3;
  v14 = _Block_copy(aBlock);
  v15 = v2;
  v16 = a1;
  sub_235CA3744();
  v18[1] = MEMORY[0x24BEE4AF8];
  sub_235C69C18(&qword_2542990D0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254299350);
  sub_235C69B80();
  sub_235CA3A38();
  MEMORY[0x23B7DDA18](0, v12, v8, v14);
  _Block_release(v14);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  return swift_release();
}

void sub_235C6065C(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  char *v19;
  NSObject *v20;
  os_log_type_t v21;
  uint64_t v22;
  char *v23;
  uint8_t *v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void (**v32)(char *, uint64_t);
  char *v33;
  uint8_t *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;

  v6 = sub_235CA3564();
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_didStopASR;
  if (*((_BYTE *)a1 + OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_didStopASR) == 1)
  {
    if (qword_2542992E8 != -1)
      swift_once();
    v11 = sub_235CA3708();
    __swift_project_value_buffer(v11, (uint64_t)qword_254299660);
    v39 = a1;
    v12 = sub_235CA36FC();
    v13 = sub_235CA393C();
    if (!os_log_type_enabled(v12, v13))
    {

      return;
    }
    v14 = (uint8_t *)swift_slowAlloc();
    v15 = swift_slowAlloc();
    v41 = v15;
    *(_DWORD *)v14 = 136315138;
    v16 = *(_QWORD *)&v39[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId];
    v17 = *(_QWORD *)&v39[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId + 8];
    swift_bridgeObjectRetain();
    v40 = sub_235C944B8(v16, v17, &v41);
    sub_235CA3A14();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_235C5E000, v12, v13, "ASR was already stopped for requestId = %s", v14, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B7DE144](v15, -1, -1);
    MEMORY[0x23B7DE144](v14, -1, -1);
  }
  else
  {
    v39 = v7;
    if (qword_2542992E8 != -1)
      swift_once();
    v18 = sub_235CA3708();
    __swift_project_value_buffer(v18, (uint64_t)qword_254299660);
    v19 = a1;
    v20 = sub_235CA36FC();
    v21 = sub_235CA3924();
    if (os_log_type_enabled(v20, v21))
    {
      v22 = swift_slowAlloc();
      v36 = v10;
      v23 = v19;
      v24 = (uint8_t *)v22;
      v25 = swift_slowAlloc();
      v35 = v25;
      v37 = a2;
      v38 = a3;
      *(_DWORD *)v24 = 136315138;
      v41 = v25;
      v34 = v24 + 4;
      v26 = &v19[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId];
      v27 = *(_QWORD *)&v19[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId];
      v28 = *((_QWORD *)v26 + 1);
      swift_bridgeObjectRetain();
      v29 = v27;
      v19 = v23;
      v10 = v36;
      v40 = sub_235C944B8(v29, v28, &v41);
      a2 = v37;
      sub_235CA3A14();

      a3 = v38;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_235C5E000, v20, v21, "Going to stop ASR for requestId = %s", v24, 0xCu);
      v30 = v35;
      swift_arrayDestroy();
      MEMORY[0x23B7DE144](v30, -1, -1);
      MEMORY[0x23B7DE144](v24, -1, -1);

    }
    else
    {

    }
    *((_BYTE *)a1 + v10) = 1;
    if (qword_2542989C0 != -1)
      swift_once();
    v31 = __swift_project_value_buffer(v6, (uint64_t)qword_254299648);
    v32 = (void (**)(char *, uint64_t))v39;
    (*((void (**)(char *, uint64_t, uint64_t))v39 + 2))(v9, v31, v6);
    *(_QWORD *)(swift_allocObject() + 16) = v19;
    v33 = v19;
    sub_235CA3540();
    swift_release();
    v32[1](v9, v6);
    v12 = sub_235CA37E0();
    objc_msgSend(a2, sel_stopSpeechRecognitionTaskAndInvalidateWithReason_requestId_completion_, a3, v12, 0);
  }

}

uint64_t sub_235C60AE8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  unint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  _QWORD *v22;
  unint64_t v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;

  v2 = sub_235CA2790();
  v3 = *(_QWORD *)(v2 - 8);
  v26 = v2;
  v27 = v3;
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254299468);
  v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542990C0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 72);
  v9 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_235CA43E0;
  v28 = v10;
  v11 = v10 + v9;
  v12 = *(int *)(v6 + 48);
  sub_235CA34C8();
  if (qword_254299310 != -1)
    swift_once();
  v13 = (_QWORD *)(v11 + v12);
  v14 = unk_254299680;
  *v13 = qword_254299678;
  v13[1] = v14;
  v15 = (_QWORD *)(v11 + v8 + *(int *)(v6 + 48));
  swift_bridgeObjectRetain();
  sub_235CA3504();
  *v15 = 0xD00000000000001ALL;
  v15[1] = 0x8000000235CA5160;
  v16 = (_QWORD *)(v11 + 2 * v8 + *(int *)(v6 + 48));
  sub_235CA34D4();
  v29 = 0;
  v30 = 0xE000000000000000;
  sub_235CA3828();
  swift_bridgeObjectRetain();
  sub_235CA3828();
  swift_bridgeObjectRelease();
  sub_235CA3828();
  v17 = v30;
  *v16 = v29;
  v16[1] = v17;
  v18 = (_QWORD *)(v11 + 3 * v8 + *(int *)(v6 + 48));
  sub_235CA3534();
  v29 = 0;
  v30 = 0xE000000000000000;
  sub_235CA3828();
  v20 = v26;
  v19 = v27;
  (*(void (**)(char *, uint64_t, uint64_t))(v27 + 16))(v5, a1 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_sessionId, v26);
  sub_235C69C18((unint64_t *)&unk_254299040, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
  sub_235CA3B64();
  sub_235CA3828();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v19 + 8))(v5, v20);
  sub_235CA3828();
  v21 = v30;
  *v18 = v29;
  v18[1] = v21;
  v22 = (_QWORD *)(v11 + 4 * v8 + *(int *)(v6 + 48));
  sub_235CA3528();
  v29 = 0;
  v30 = 0xE000000000000000;
  sub_235CA3828();
  sub_235CA3828();
  sub_235CA3828();
  v23 = v30;
  *v22 = v29;
  v22[1] = v23;
  return v28;
}

void sub_235C60DB0(id a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  unint64_t v17;
  uint64_t v18;
  BOOL v19;
  char v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  id v31;
  NSObject *v32;
  os_log_type_t v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  os_log_type_t v37;
  uint8_t *v38;
  uint8_t *v39;
  os_log_t v40;
  uint64_t v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  unint64_t v47;
  uint64_t v48;
  void *v49;
  id v50;
  void *v51;
  id v52;
  void *v53;
  uint64_t v54;
  _QWORD *v55;
  id v56;
  id v57;
  NSObject *v58;
  os_log_type_t v59;
  uint8_t *v60;
  uint64_t v61;
  id v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  void *v67;
  void *v68;
  id v69;
  _QWORD v70[2];
  os_log_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  unint64_t v77;
  uint64_t aBlock[6];
  uint64_t v79;

  v77 = a6;
  v73 = a4;
  v74 = a5;
  v9 = sub_235CA2790();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8]();
  v12 = (char *)v70 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2542992E8 != -1)
LABEL_38:
    swift_once();
  v13 = sub_235CA3708();
  v76 = __swift_project_value_buffer(v13, (uint64_t)qword_254299660);
  v14 = sub_235CA36FC();
  v15 = sub_235CA3924();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v16 = 0;
    _os_log_impl(&dword_235C5E000, v14, v15, "Received partial result", v16, 2u);
    MEMORY[0x23B7DE144](v16, -1, -1);
  }

  v18 = *(_QWORD *)(a3 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId);
  v17 = *(_QWORD *)(a3 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId + 8);
  v19 = (id)v18 == a1 && v17 == a2;
  if (!v19 && (sub_235CA3B88() & 1) == 0)
  {
    swift_bridgeObjectRetain_n();
    v31 = (id)a3;
    v32 = sub_235CA36FC();
    v33 = sub_235CA3930();
    if (os_log_type_enabled(v32, v33))
    {
      v34 = swift_slowAlloc();
      v35 = swift_slowAlloc();
      aBlock[0] = v35;
      *(_DWORD *)v34 = 136315394;
      swift_bridgeObjectRetain();
      v79 = sub_235C944B8((uint64_t)a1, a2, aBlock);
      sub_235CA3A14();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v34 + 12) = 2080;
      swift_bridgeObjectRetain();
      v79 = sub_235C944B8(v18, v17, aBlock);
      sub_235CA3A14();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_235C5E000, v32, v33, "Response requestId = %s does not match current requestId = %s", (uint8_t *)v34, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x23B7DE144](v35, -1, -1);
      MEMORY[0x23B7DE144](v34, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    return;
  }
  v20 = *(_BYTE *)(a3
                 + OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_havePostedSpeechPartialDeliveryStartedMessage);
  v75 = a3;
  if ((v20 & 1) == 0)
  {
    *(_BYTE *)(a3
             + OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_havePostedSpeechPartialDeliveryStartedMessage) = 1;
    MEMORY[0x24BDAC7A8]();
    v70[-2] = v21;
    v22 = objc_allocWithZone((Class)sub_235CA31E0());
    v23 = sub_235CA2DC0();
    if (v23)
    {
      v24 = (void *)v23;
      v25 = sub_235CA36FC();
      v26 = sub_235CA3924();
      if (os_log_type_enabled(v25, v26))
      {
        v27 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v27 = 0;
        _os_log_impl(&dword_235C5E000, v25, v26, "Going to post speechPartialDeliveryStartedMessage", v27, 2u);
        MEMORY[0x23B7DE144](v27, -1, -1);
      }

      __swift_project_boxed_opaque_existential_1((_QWORD *)(v75 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_messagePublisher), *(_QWORD *)(v75 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_messagePublisher + 24));
      sub_235CA33B4();
      v28 = sub_235CA36FC();
      v29 = sub_235CA3924();
      if (os_log_type_enabled(v28, v29))
      {
        v30 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v30 = 0;
        _os_log_impl(&dword_235C5E000, v28, v29, "Posted speechPartialDeliveryStartedMessage", v30, 2u);
        MEMORY[0x23B7DE144](v30, -1, -1);

      }
      else
      {

      }
    }
    else
    {
      swift_bridgeObjectRetain_n();
      v36 = sub_235CA36FC();
      v37 = sub_235CA3930();
      if (os_log_type_enabled(v36, v37))
      {
        v38 = (uint8_t *)swift_slowAlloc();
        v72 = swift_slowAlloc();
        aBlock[0] = v72;
        v71 = v36;
        v39 = v38;
        *(_DWORD *)v38 = 136315138;
        v70[1] = v38 + 4;
        swift_bridgeObjectRetain();
        v79 = sub_235C944B8((uint64_t)a1, a2, aBlock);
        sub_235CA3A14();
        swift_bridgeObjectRelease_n();
        v40 = v71;
        _os_log_impl(&dword_235C5E000, v71, v37, "Failed to create speechPartialDeliveryStartedMessage for request: %s", v39, 0xCu);
        v41 = v72;
        swift_arrayDestroy();
        MEMORY[0x23B7DE144](v41, -1, -1);
        MEMORY[0x23B7DE144](v39, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
    }
  }
  v42 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE81598]), sel_init);
  sub_235CA2784();
  sub_235CA2760();
  (*(void (**)(char *, unint64_t))(v10 + 8))(v12, v9);
  v43 = (void *)sub_235CA37E0();
  swift_bridgeObjectRelease();
  objc_msgSend(v42, sel_setAceId_, v43);

  a1 = v42;
  v44 = (void *)sub_235CA37E0();
  objc_msgSend(a1, sel_setRefId_, v44);

  v45 = (void *)sub_235CA37E0();
  objc_msgSend(a1, sel_setLanguage_, v45);

  a2 = sub_235C71624(0, &qword_254299420);
  v46 = (void *)sub_235CA38AC();
  objc_msgSend(a1, sel_setTokens_, v46);

  v47 = v77;
  if (!(v77 >> 62))
  {
    v48 = *(_QWORD *)((v77 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v48)
      goto LABEL_24;
LABEL_40:
    swift_bridgeObjectRelease();
    if ((*(_BYTE *)(v75 + OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_isCandidateRequest) & 1) != 0)
    {
      v55 = (_QWORD *)(v75
                     + OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_speechPartialResultsCache);
      swift_beginAccess();
      v56 = a1;
      MEMORY[0x23B7DD94C]();
      if (*(_QWORD *)((*v55 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*v55 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_235CA38DC();
      sub_235CA38E8();
      sub_235CA38D0();
      swift_endAccess();

    }
    else
    {
      v57 = a1;
      v58 = sub_235CA36FC();
      v59 = sub_235CA3924();
      if (os_log_type_enabled(v58, v59))
      {
        v60 = (uint8_t *)swift_slowAlloc();
        v61 = swift_slowAlloc();
        aBlock[0] = v61;
        *(_DWORD *)v60 = 136315138;
        v62 = objc_msgSend(v57, sel_tokens);
        if (v62)
        {
          v63 = v62;
          v64 = sub_235CA38B8();

        }
        else
        {
          v64 = 0;
        }
        v79 = v64;
        __swift_instantiateConcreteTypeFromMangledName(&qword_254299398);
        v65 = sub_235CA37F8();
        v79 = sub_235C944B8(v65, v66, aBlock);
        sub_235CA3A14();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_235C5E000, v58, v59, "Submitting partial text: \"%s\"", v60, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x23B7DE144](v61, -1, -1);
        MEMORY[0x23B7DE144](v60, -1, -1);

      }
      else
      {

      }
      v67 = *(void **)(v75 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_serviceHelper);
      aBlock[4] = (uint64_t)sub_235C61A20;
      aBlock[5] = 0;
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 1107296256;
      aBlock[2] = (uint64_t)sub_235C8101C;
      aBlock[3] = (uint64_t)&block_descriptor_150;
      v68 = _Block_copy(aBlock);
      v69 = v57;
      objc_msgSend(v67, sel_handleCommand_completion_, v69, v68);
      _Block_release(v68);

    }
    return;
  }
  swift_bridgeObjectRetain();
  v48 = sub_235CA3AF8();
  if (!v48)
    goto LABEL_40;
LABEL_24:
  v12 = (char *)(v47 & 0xC000000000000001);
  a3 = 4;
  while (1)
  {
    if (v12)
      v50 = (id)MEMORY[0x23B7DDB44](a3 - 4, v47);
    else
      v50 = *(id *)(v47 + 8 * a3);
    v51 = v50;
    v10 = a3 - 3;
    if (__OFADD__(a3 - 4, 1))
    {
      __break(1u);
      goto LABEL_38;
    }
    if (!objc_msgSend(v50, sel_aceToken))
      break;
    v52 = objc_msgSend(a1, sel_tokens);
    if (!v52)
      goto LABEL_52;
    v53 = v52;
    v54 = sub_235CA38B8();

    aBlock[0] = v54;
    MEMORY[0x23B7DD94C]();
    v9 = *(_QWORD *)((aBlock[0] & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v9 >= *(_QWORD *)((aBlock[0] & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_235CA38DC();
    sub_235CA38E8();
    sub_235CA38D0();
    if (aBlock[0])
    {
      v49 = (void *)sub_235CA38AC();
      swift_bridgeObjectRelease();
    }
    else
    {
      v49 = 0;
    }
    v47 = v77;
    objc_msgSend(a1, sel_setTokens_, v49);

    ++a3;
    if (v10 == v48)
      goto LABEL_40;
  }
  __break(1u);
LABEL_52:
  __break(1u);
}

uint64_t sub_235C61880(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  __swift_instantiateConcreteTypeFromMangledName(&qword_254299050);
  MEMORY[0x24BDAC7A8]();
  v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254299070);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *MEMORY[0x24BE9AD78];
  v8 = sub_235CA33CC();
  v9 = *(_QWORD *)(v8 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 104))(v6, v7, v8);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v9 + 56))(v6, 0, 1, v8);
  sub_235CA3354();
  swift_bridgeObjectRetain();
  sub_235CA3348();
  v10 = a2 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_sessionId;
  v11 = sub_235CA2790();
  v12 = *(_QWORD *)(v11 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v4, v10, v11);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v4, 0, 1, v11);
  sub_235CA336C();
  swift_bridgeObjectRetain();
  return sub_235CA3360();
}

void sub_235C61A20(uint64_t a1, uint64_t a2)
{
  sub_235C61C88(a1, a2, "SpeechPartialResult handled");
}

uint64_t sub_235C61AFC()
{
  uint64_t v0;
  unint64_t *v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD aBlock[6];

  v1 = (unint64_t *)(v0
                          + OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_speechPartialResultsCache);
  swift_beginAccess();
  v2 = *v1;
  if (!(v2 >> 62))
  {
    v3 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v3)
      goto LABEL_3;
    return swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  result = sub_235CA3AF8();
  v3 = result;
  if (!result)
    return swift_bridgeObjectRelease();
LABEL_3:
  if (v3 >= 1)
  {
    v5 = 0;
    v6 = *(void **)(v0 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_serviceHelper);
    do
    {
      if ((v2 & 0xC000000000000001) != 0)
        v7 = (id)MEMORY[0x23B7DDB44](v5, v2);
      else
        v7 = *(id *)(v2 + 8 * v5 + 32);
      v8 = v7;
      ++v5;
      aBlock[4] = sub_235C61C7C;
      aBlock[5] = 0;
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_235C8101C;
      aBlock[3] = &block_descriptor;
      v9 = _Block_copy(aBlock);
      v10 = v8;
      objc_msgSend(v6, sel_handleCommand_completion_, v10, v9);
      _Block_release(v9);

    }
    while (v3 != v5);
    return swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

void sub_235C61C7C(uint64_t a1, uint64_t a2)
{
  sub_235C61C88(a1, a2, "Cached SpeechPartialResult handled");
}

void sub_235C61C88(uint64_t a1, uint64_t a2, const char *a3)
{
  uint64_t v4;
  os_log_type_t v5;
  uint8_t *v6;
  NSObject *oslog;

  if (qword_2542992E8 != -1)
    swift_once();
  v4 = sub_235CA3708();
  __swift_project_value_buffer(v4, (uint64_t)qword_254299660);
  oslog = sub_235CA36FC();
  v5 = sub_235CA3924();
  if (os_log_type_enabled(oslog, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_235C5E000, oslog, v5, a3, v6, 2u);
    MEMORY[0x23B7DE144](v6, -1, -1);
  }

}

void sub_235C61D5C()
{
  uint64_t v0;

  *(_BYTE *)(v0 + OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_isCandidateRequest) = 0;
}

uint64_t sub_235C61DE4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v18;

  __swift_instantiateConcreteTypeFromMangledName(&qword_254299050);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254299070);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *MEMORY[0x24BE9AD78];
  v10 = sub_235CA33CC();
  v11 = *(_QWORD *)(v10 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 104))(v8, v9, v10);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  sub_235CA2CF4();
  swift_bridgeObjectRetain();
  sub_235CA2CE8();
  v12 = a2 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_sessionId;
  v13 = sub_235CA2790();
  v14 = *(_QWORD *)(v13 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v6, v12, v13);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v6, 0, 1, v13);
  sub_235CA2D18();
  swift_bridgeObjectRetain();
  sub_235CA2D0C();
  v15 = objc_msgSend(a3, sel_lastTRPCandidateId);
  if (v15)
  {
    v16 = v15;
    sub_235CA37EC();

  }
  return sub_235CA2D00();
}

uint64_t sub_235C62034(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v26[2];

  v26[0] = a4;
  v26[1] = a6;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542989B0);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_254299050);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_254299070);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)v26 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = *MEMORY[0x24BE9AD78];
  v18 = sub_235CA33CC();
  v19 = *(_QWORD *)(v18 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 104))(v16, v17, v18);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v19 + 56))(v16, 0, 1, v18);
  sub_235CA2E50();
  swift_bridgeObjectRetain();
  sub_235CA2E2C();
  v20 = a2 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_sessionId;
  v21 = sub_235CA2790();
  v22 = *(_QWORD *)(v21 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v22 + 16))(v13, v20, v21);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v22 + 56))(v13, 0, 1, v21);
  sub_235CA2E74();
  swift_bridgeObjectRetain();
  sub_235CA2E68();
  v23 = sub_235CA3498();
  v24 = *(_QWORD *)(v23 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v24 + 16))(v10, a3, v23);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v24 + 56))(v10, 0, 1, v23);
  sub_235CA2E5C();
  swift_bridgeObjectRetain();
  sub_235CA2E38();
  swift_bridgeObjectRetain();
  return sub_235CA2E44();
}

uint64_t sub_235C6228C(uint64_t a1, uint64_t a2, void *a3)
{
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  void *v24;
  uint64_t v26;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542989B0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_254299050);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_254299070);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = *MEMORY[0x24BE9AD78];
  v15 = sub_235CA33CC();
  v16 = *(_QWORD *)(v15 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 104))(v13, v14, v15);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
  sub_235CA3198();
  swift_bridgeObjectRetain();
  sub_235CA3180();
  v17 = a2 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_sessionId;
  v18 = sub_235CA2790();
  v19 = *(_QWORD *)(v18 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v10, v17, v18);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v19 + 56))(v10, 0, 1, v18);
  sub_235CA31BC();
  swift_bridgeObjectRetain();
  sub_235CA31B0();
  v20 = a2 + OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_userId;
  v21 = sub_235CA3498();
  v22 = *(_QWORD *)(v21 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v22 + 16))(v7, v20, v21);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v22 + 56))(v7, 0, 1, v21);
  sub_235CA31A4();
  v23 = objc_msgSend(a3, sel_multiUserTrpCandidateId);
  if (v23)
  {
    v24 = v23;
    sub_235CA37EC();

  }
  sub_235CA318C();
  swift_bridgeObjectRetain();
  return sub_235CA3174();
}

uint64_t sub_235C6257C(uint64_t a1, uint64_t a2, void *a3)
{
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  void *v24;
  uint64_t v26;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542989B0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_254299050);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_254299070);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = *MEMORY[0x24BE9AD78];
  v15 = sub_235CA33CC();
  v16 = *(_QWORD *)(v15 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 104))(v13, v14, v15);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
  sub_235CA3060();
  swift_bridgeObjectRetain();
  sub_235CA303C();
  v17 = a2 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_sessionId;
  v18 = sub_235CA2790();
  v19 = *(_QWORD *)(v18 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v10, v17, v18);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v19 + 56))(v10, 0, 1, v18);
  sub_235CA3084();
  swift_bridgeObjectRetain();
  sub_235CA3078();
  v20 = a2 + OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_userId;
  v21 = sub_235CA3498();
  v22 = *(_QWORD *)(v21 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v22 + 16))(v7, v20, v21);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v22 + 56))(v7, 0, 1, v21);
  sub_235CA306C();
  v23 = objc_msgSend(a3, sel_trpCandidateId);
  if (v23)
  {
    v24 = v23;
    sub_235CA37EC();

  }
  sub_235CA3048();
  swift_bridgeObjectRetain();
  return sub_235CA3054();
}

uint64_t sub_235C62808(uint64_t a1, uint64_t a2, void *a3)
{
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  void *v24;
  uint64_t v26;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542989B0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_254299050);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_254299070);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = *MEMORY[0x24BE9AD78];
  v15 = sub_235CA33CC();
  v16 = *(_QWORD *)(v15 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 104))(v13, v14, v15);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
  sub_235CA2A84();
  swift_bridgeObjectRetain();
  sub_235CA2A60();
  v17 = a2 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_sessionId;
  v18 = sub_235CA2790();
  v19 = *(_QWORD *)(v18 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v10, v17, v18);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v19 + 56))(v10, 0, 1, v18);
  sub_235CA2AA8();
  swift_bridgeObjectRetain();
  sub_235CA2A9C();
  v20 = a2 + OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_userId;
  v21 = sub_235CA3498();
  v22 = *(_QWORD *)(v21 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v22 + 16))(v7, v20, v21);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v22 + 56))(v7, 0, 1, v21);
  sub_235CA2A90();
  v23 = objc_msgSend(a3, sel_trpCandidateId);
  if (v23)
  {
    v24 = v23;
    sub_235CA37EC();

  }
  sub_235CA2A6C();
  swift_bridgeObjectRetain();
  return sub_235CA2A78();
}

uint64_t sub_235C62A94(uint64_t a1, uint64_t a2, void *a3)
{
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  void *v24;
  uint64_t v26;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542989B0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_254299050);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_254299070);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = *MEMORY[0x24BE9AD78];
  v15 = sub_235CA33CC();
  v16 = *(_QWORD *)(v15 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 104))(v13, v14, v15);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
  sub_235CA2E50();
  swift_bridgeObjectRetain();
  sub_235CA2E2C();
  v17 = a2 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_sessionId;
  v18 = sub_235CA2790();
  v19 = *(_QWORD *)(v18 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v10, v17, v18);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v19 + 56))(v10, 0, 1, v18);
  sub_235CA2E74();
  swift_bridgeObjectRetain();
  sub_235CA2E68();
  v20 = a2 + OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_userId;
  v21 = sub_235CA3498();
  v22 = *(_QWORD *)(v21 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v22 + 16))(v7, v20, v21);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v22 + 56))(v7, 0, 1, v21);
  sub_235CA2E5C();
  v23 = objc_msgSend(a3, sel_trpCandidateId);
  if (v23)
  {
    v24 = v23;
    sub_235CA37EC();

  }
  sub_235CA2E38();
  swift_bridgeObjectRetain();
  return sub_235CA2E44();
}

uint64_t sub_235C62D20(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, SEL *a5)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  unint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  unint64_t v29;
  unint64_t v30;
  id v31;
  void *v32;
  _QWORD *v33;
  unint64_t v34;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  SEL *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;

  v40 = a2;
  v41 = a5;
  v39 = a1;
  v7 = sub_235CA2790();
  v37 = *(_QWORD *)(v7 - 8);
  v38 = v7;
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254299468);
  v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542990C0);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(_QWORD *)(v11 + 72);
  v13 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_235CA43F0;
  v42 = v14;
  v15 = v14 + v13;
  v16 = (_QWORD *)(v14 + v13 + *(int *)(v10 + 48));
  sub_235CA34C8();
  if (qword_254299310 != -1)
    swift_once();
  v17 = unk_254299680;
  *v16 = qword_254299678;
  v16[1] = v17;
  v18 = *(int *)(v10 + 48);
  v43 = v10;
  v19 = (_QWORD *)(v15 + v12 + v18);
  swift_bridgeObjectRetain();
  sub_235CA3504();
  *v19 = a3;
  v19[1] = a4;
  v20 = (_QWORD *)(v15 + 2 * v12 + *(int *)(v43 + 48));
  sub_235CA34D4();
  v44 = 0;
  v45 = 0xE000000000000000;
  sub_235CA3828();
  v21 = v39;
  swift_bridgeObjectRetain();
  sub_235CA3828();
  swift_bridgeObjectRelease();
  sub_235CA3828();
  v22 = v45;
  *v20 = v44;
  v20[1] = v22;
  v23 = (_QWORD *)(v15 + 3 * v12 + *(int *)(v43 + 48));
  sub_235CA3534();
  v44 = 0;
  v45 = 0xE000000000000000;
  sub_235CA3828();
  v25 = v37;
  v24 = v38;
  (*(void (**)(char *, uint64_t, uint64_t))(v37 + 16))(v9, v21 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_sessionId, v38);
  sub_235C69C18((unint64_t *)&unk_254299040, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
  sub_235CA3B64();
  sub_235CA3828();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v9, v24);
  sub_235CA3828();
  v26 = v45;
  *v23 = v44;
  v23[1] = v26;
  v27 = v43;
  v28 = (_QWORD *)(v15 + 4 * v12 + *(int *)(v43 + 48));
  sub_235CA3528();
  v44 = 0;
  v45 = 0xE000000000000000;
  sub_235CA3828();
  sub_235CA3828();
  sub_235CA3828();
  v29 = v45;
  *v28 = v44;
  v28[1] = v29;
  v30 = v15 + 5 * v12;
  sub_235CA3510();
  v44 = 0;
  v45 = 0xE000000000000000;
  sub_235CA3828();
  v31 = objc_msgSend(v40, *v41);
  if (v31)
  {
    v32 = v31;
    sub_235CA37EC();

  }
  v33 = (_QWORD *)(v30 + *(int *)(v27 + 48));
  sub_235CA3828();
  swift_bridgeObjectRelease();
  sub_235CA3828();
  v34 = v45;
  *v33 = v44;
  v33[1] = v34;
  return v42;
}

void sub_235C630DC(char a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  char *v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  const char *v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  int v31;
  id v32;
  uint64_t v33;
  NSObject *v34;
  os_log_type_t v35;
  uint8_t *v36;
  char *v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  NSObject *v41;
  os_log_type_t v42;
  uint8_t *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  id v50;
  uint64_t v51;
  char *v52;
  NSObject *v53;
  os_log_type_t v54;
  uint8_t *v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  os_log_type_t v66;
  uint8_t *v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  id v71;
  uint64_t v72;
  uint64_t v73;

  v7 = sub_235CA3564();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v71 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = a3 + 16;
  sub_235CA399C();
  if (qword_2542990E8 != -1)
    swift_once();
  v12 = (id)qword_2542994C8;
  sub_235CA36CC();

  swift_beginAccess();
  v13 = MEMORY[0x23B7DE18C](v11);
  if (v13)
  {
    v14 = (char *)v13;
    if ((a1 & 1) == 0)
    {
      if (qword_2542992E8 != -1)
        swift_once();
      v27 = sub_235CA3708();
      __swift_project_value_buffer(v27, (uint64_t)qword_254299660);
      v28 = sub_235CA36FC();
      v29 = sub_235CA393C();
      if (os_log_type_enabled(v28, v29))
      {
        v30 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v30 = 0;
        _os_log_impl(&dword_235C5E000, v28, v29, "Not posting StoppedListeningForSpeechContinuationMessage since myriad selection is lost", v30, 2u);
        MEMORY[0x23B7DE144](v30, -1, -1);
      }

      if (qword_2542989C0 == -1)
        goto LABEL_40;
      goto LABEL_60;
    }
    if (*(_BYTE *)(v13 + OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_isMUXEnabled) == 1)
    {
      MEMORY[0x24BDAC7A8](v13);
      *(&v71 - 2) = v14;
      *(&v71 - 1) = a4;
      v15 = objc_allocWithZone((Class)sub_235CA333C());
      v16 = sub_235CA3234();
      if (v16)
      {
        v17 = (void *)v16;
        if (qword_2542992E8 != -1)
          swift_once();
        v18 = sub_235CA3708();
        __swift_project_value_buffer(v18, (uint64_t)qword_254299660);
        v19 = sub_235CA36FC();
        v20 = sub_235CA3924();
        if (!os_log_type_enabled(v19, v20))
          goto LABEL_38;
        v21 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v21 = 0;
        v22 = "Going to post MultiUserStoppedListeningForSpeechContinuationMessage";
LABEL_37:
        _os_log_impl(&dword_235C5E000, v19, v20, v22, v21, 2u);
        MEMORY[0x23B7DE144](v21, -1, -1);
LABEL_38:

        __swift_project_boxed_opaque_existential_1(&v14[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_messagePublisher], *(_QWORD *)&v14[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_messagePublisher + 24]);
        sub_235CA33B4();
        goto LABEL_39;
      }
      if (qword_2542992E8 != -1)
        swift_once();
      v51 = sub_235CA3708();
      __swift_project_value_buffer(v51, (uint64_t)qword_254299660);
      v52 = v14;
      v53 = sub_235CA36FC();
      v54 = sub_235CA3930();
      if (os_log_type_enabled(v53, v54))
      {
        v55 = (uint8_t *)swift_slowAlloc();
        v56 = swift_slowAlloc();
        v73 = v56;
        *(_DWORD *)v55 = 136315138;
        v57 = *(_QWORD *)&v52[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId];
        v58 = *(_QWORD *)&v52[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId + 8];
        swift_bridgeObjectRetain();
        v72 = sub_235C944B8(v57, v58, &v73);
        sub_235CA3A14();

        swift_bridgeObjectRelease();
        v59 = "Failed to create MultiUserStoppedListeningForSpeechContinuationMessage for request: %s";
LABEL_53:
        _os_log_impl(&dword_235C5E000, v53, v54, v59, v55, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x23B7DE144](v56, -1, -1);
        MEMORY[0x23B7DE144](v55, -1, -1);

LABEL_54:
        return;
      }
    }
    else
    {
      MEMORY[0x24BDAC7A8](v13);
      *(&v71 - 2) = v14;
      *(&v71 - 1) = a4;
      if (v31 == 1)
      {
        v32 = objc_allocWithZone((Class)sub_235CA32D0());
        v71 = (id)sub_235CA3288();
        if (v71)
        {
          if (qword_2542992E8 != -1)
            swift_once();
          v33 = sub_235CA3708();
          __swift_project_value_buffer(v33, (uint64_t)qword_254299660);
          v34 = sub_235CA36FC();
          v35 = sub_235CA3924();
          if (os_log_type_enabled(v34, v35))
          {
            v36 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)v36 = 0;
            _os_log_impl(&dword_235C5E000, v34, v35, "Going to post StoppedListeningForSpeechContinuationForPlannerMessage", v36, 2u);
            MEMORY[0x23B7DE144](v36, -1, -1);
          }

          v37 = &v14[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_messagePublisher];
          __swift_project_boxed_opaque_existential_1(&v14[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_messagePublisher], *(_QWORD *)&v14[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_messagePublisher + 24]);
          v38 = sub_235CA33B4();
          MEMORY[0x24BDAC7A8](v38);
          *(&v71 - 2) = v14;
          *(&v71 - 1) = a4;
          v39 = objc_allocWithZone((Class)sub_235CA3324());
          v40 = sub_235CA32DC();
          if (v40)
          {
            v17 = (void *)v40;
            v41 = sub_235CA36FC();
            v42 = sub_235CA3924();
            if (os_log_type_enabled(v41, v42))
            {
              v43 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)v43 = 0;
              _os_log_impl(&dword_235C5E000, v41, v42, "Going to post RootStoppedListeningForSpeechContinuationMessage", v43, 2u);
              MEMORY[0x23B7DE144](v43, -1, -1);
            }

            __swift_project_boxed_opaque_existential_1(v37, *((_QWORD *)v37 + 3));
            sub_235CA33B4();

LABEL_39:
            if (qword_2542989C0 == -1)
            {
LABEL_40:
              v47 = __swift_project_value_buffer(v7, (uint64_t)qword_254299648);
              (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v47, v7);
              v48 = swift_allocObject();
              *(_QWORD *)(v48 + 16) = v14;
              *(_QWORD *)(v48 + 24) = a4;
              v49 = v14;
              v50 = a4;
              sub_235CA3540();

              swift_release();
              (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
              return;
            }
LABEL_60:
            swift_once();
            goto LABEL_40;
          }
          v52 = v14;
          v53 = sub_235CA36FC();
          v66 = sub_235CA3930();
          if (os_log_type_enabled(v53, v66))
          {
            v67 = (uint8_t *)swift_slowAlloc();
            v68 = swift_slowAlloc();
            v73 = v68;
            *(_DWORD *)v67 = 136315138;
            v69 = *(_QWORD *)&v52[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId];
            v70 = *(_QWORD *)&v52[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId + 8];
            swift_bridgeObjectRetain();
            v72 = sub_235C944B8(v69, v70, &v73);
            sub_235CA3A14();

            swift_bridgeObjectRelease();
            _os_log_impl(&dword_235C5E000, v53, v66, "Failed to create RootStoppedListeningForSpeechContinuationMessage for request: %s", v67, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x23B7DE144](v68, -1, -1);
            MEMORY[0x23B7DE144](v67, -1, -1);

            goto LABEL_54;
          }

          goto LABEL_56;
        }
        if (qword_2542992E8 != -1)
          swift_once();
        v60 = sub_235CA3708();
        __swift_project_value_buffer(v60, (uint64_t)qword_254299660);
        v52 = v14;
        v53 = sub_235CA36FC();
        v54 = sub_235CA3930();
        if (os_log_type_enabled(v53, v54))
        {
          v55 = (uint8_t *)swift_slowAlloc();
          v56 = swift_slowAlloc();
          v73 = v56;
          *(_DWORD *)v55 = 136315138;
          v61 = *(_QWORD *)&v52[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId];
          v62 = *(_QWORD *)&v52[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId + 8];
          swift_bridgeObjectRetain();
          v72 = sub_235C944B8(v61, v62, &v73);
          sub_235CA3A14();

          swift_bridgeObjectRelease();
          v59 = "Failed to create StoppedListeningForSpeechContinuationForPlannerMessage for request: %s";
          goto LABEL_53;
        }
      }
      else
      {
        v44 = objc_allocWithZone((Class)sub_235CA327C());
        v45 = sub_235CA3234();
        if (v45)
        {
          v17 = (void *)v45;
          if (qword_2542992E8 != -1)
            swift_once();
          v46 = sub_235CA3708();
          __swift_project_value_buffer(v46, (uint64_t)qword_254299660);
          v19 = sub_235CA36FC();
          v20 = sub_235CA3924();
          if (!os_log_type_enabled(v19, v20))
            goto LABEL_38;
          v21 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v21 = 0;
          v22 = "Going to post StoppedListeningForSpeechContinuationMessage";
          goto LABEL_37;
        }
        if (qword_2542992E8 != -1)
          swift_once();
        v63 = sub_235CA3708();
        __swift_project_value_buffer(v63, (uint64_t)qword_254299660);
        v52 = v14;
        v53 = sub_235CA36FC();
        v54 = sub_235CA3930();
        if (os_log_type_enabled(v53, v54))
        {
          v55 = (uint8_t *)swift_slowAlloc();
          v56 = swift_slowAlloc();
          v73 = v56;
          *(_DWORD *)v55 = 136315138;
          v64 = *(_QWORD *)&v52[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId];
          v65 = *(_QWORD *)&v52[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId + 8];
          swift_bridgeObjectRetain();
          v72 = sub_235C944B8(v64, v65, &v73);
          sub_235CA3A14();

          swift_bridgeObjectRelease();
          v59 = "Failed to create StoppedListeningForSpeechContinuationMessage for request: %s";
          goto LABEL_53;
        }
      }
    }

LABEL_56:
    return;
  }
  if (qword_2542992E8 != -1)
    swift_once();
  v23 = sub_235CA3708();
  __swift_project_value_buffer(v23, (uint64_t)qword_254299660);
  v24 = sub_235CA36FC();
  v25 = sub_235CA393C();
  if (os_log_type_enabled(v24, v25))
  {
    v26 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v26 = 0;
    _os_log_impl(&dword_235C5E000, v24, v25, "Not posting StoppedListeningForSpeechContinuationMessage since self is already out of scope", v26, 2u);
    MEMORY[0x23B7DE144](v26, -1, -1);
  }

}

uint64_t sub_235C63D74(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  unint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(char *, uint64_t);
  uint64_t v23;
  unint64_t v24;
  _QWORD *v25;
  unint64_t v26;
  unint64_t v27;
  id v28;
  void *v29;
  _QWORD *v30;
  unint64_t v31;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;

  v36 = a2;
  v3 = sub_235CA2790();
  v34 = *(_QWORD *)(v3 - 8);
  v35 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254299468);
  v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542990C0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 72);
  v9 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_235CA43F0;
  v37 = v10;
  v11 = v10 + v9;
  v12 = (_QWORD *)(v10 + v9 + *(int *)(v6 + 48));
  sub_235CA34C8();
  if (qword_254299310 != -1)
    swift_once();
  v13 = unk_254299680;
  *v12 = qword_254299678;
  v12[1] = v13;
  v14 = (uint64_t *)(v11 + v8 + *(int *)(v6 + 48));
  swift_bridgeObjectRetain();
  sub_235CA3504();
  *v14 = sub_235C99088(0xDu);
  v14[1] = v15;
  v16 = *(int *)(v6 + 48);
  v38 = v6;
  v17 = (_QWORD *)(v11 + 2 * v8 + v16);
  sub_235CA34D4();
  v39 = 0;
  v40 = 0xE000000000000000;
  sub_235CA3828();
  swift_bridgeObjectRetain();
  sub_235CA3828();
  swift_bridgeObjectRelease();
  sub_235CA3828();
  v18 = v40;
  *v17 = v39;
  v17[1] = v18;
  v19 = (_QWORD *)(v11 + 3 * v8 + *(int *)(v38 + 48));
  sub_235CA3534();
  v39 = 0;
  v40 = 0xE000000000000000;
  sub_235CA3828();
  v21 = v34;
  v20 = v35;
  (*(void (**)(char *, uint64_t, uint64_t))(v34 + 16))(v5, a1 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_sessionId, v35);
  sub_235C69C18((unint64_t *)&unk_254299040, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
  sub_235CA3B64();
  sub_235CA3828();
  swift_bridgeObjectRelease();
  v22 = *(void (**)(char *, uint64_t))(v21 + 8);
  v23 = v38;
  v22(v5, v20);
  sub_235CA3828();
  v24 = v40;
  *v19 = v39;
  v19[1] = v24;
  v25 = (_QWORD *)(v11 + 4 * v8 + *(int *)(v23 + 48));
  sub_235CA3528();
  v39 = 0;
  v40 = 0xE000000000000000;
  sub_235CA3828();
  sub_235CA3828();
  sub_235CA3828();
  v26 = v40;
  *v25 = v39;
  v25[1] = v26;
  v27 = v11 + 5 * v8;
  sub_235CA3510();
  v39 = 0;
  v40 = 0xE000000000000000;
  sub_235CA3828();
  v28 = objc_msgSend(v36, sel_lastTRPCandidateId);
  if (v28)
  {
    v29 = v28;
    sub_235CA37EC();

  }
  v30 = (_QWORD *)(v27 + *(int *)(v23 + 48));
  sub_235CA3828();
  swift_bridgeObjectRelease();
  sub_235CA3828();
  v31 = v40;
  *v30 = v39;
  v30[1] = v31;
  return v37;
}

uint64_t sub_235C640C8(uint64_t a1, uint64_t a2, void *a3)
{
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
  uint64_t v16;
  id v17;
  void *v18;
  uint64_t v20;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254299050);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_254299070);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *MEMORY[0x24BE9AD78];
  v12 = sub_235CA33CC();
  v13 = *(_QWORD *)(v12 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 104))(v10, v11, v12);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
  sub_235CA32A0();
  swift_bridgeObjectRetain();
  sub_235CA3294();
  v14 = a2 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_sessionId;
  v15 = sub_235CA2790();
  v16 = *(_QWORD *)(v15 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v7, v14, v15);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v7, 0, 1, v15);
  sub_235CA32C4();
  swift_bridgeObjectRetain();
  sub_235CA32B8();
  v17 = objc_msgSend(a3, sel_lastTRPCandidateId);
  if (v17)
  {
    v18 = v17;
    sub_235CA37EC();

  }
  return sub_235CA32AC();
}

uint64_t sub_235C642B4(uint64_t a1, uint64_t a2, void *a3)
{
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
  uint64_t v16;
  id v17;
  void *v18;
  uint64_t v20;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254299050);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_254299070);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *MEMORY[0x24BE9AD78];
  v12 = sub_235CA33CC();
  v13 = *(_QWORD *)(v12 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 104))(v10, v11, v12);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
  sub_235CA32F4();
  swift_bridgeObjectRetain();
  sub_235CA32E8();
  v14 = a2 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_sessionId;
  v15 = sub_235CA2790();
  v16 = *(_QWORD *)(v15 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v7, v14, v15);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v7, 0, 1, v15);
  sub_235CA3318();
  swift_bridgeObjectRetain();
  sub_235CA330C();
  v17 = objc_msgSend(a3, sel_lastTRPCandidateId);
  if (v17)
  {
    v18 = v17;
    sub_235CA37EC();

  }
  return sub_235CA3300();
}

uint64_t sub_235C644A0(uint64_t a1, uint64_t a2, void *a3)
{
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
  uint64_t v16;
  id v17;
  void *v18;
  uint64_t v20;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254299050);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_254299070);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *MEMORY[0x24BE9AD78];
  v12 = sub_235CA33CC();
  v13 = *(_QWORD *)(v12 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 104))(v10, v11, v12);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
  sub_235CA324C();
  swift_bridgeObjectRetain();
  sub_235CA3240();
  v14 = a2 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_sessionId;
  v15 = sub_235CA2790();
  v16 = *(_QWORD *)(v15 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v7, v14, v15);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v7, 0, 1, v15);
  sub_235CA3270();
  swift_bridgeObjectRetain();
  sub_235CA3264();
  v17 = objc_msgSend(a3, sel_lastTRPCandidateId);
  if (v17)
  {
    v18 = v17;
    sub_235CA37EC();

  }
  return sub_235CA3258();
}

uint64_t sub_235C646F0(uint64_t a1, uint64_t a2)
{
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_254299050);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254299070);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *MEMORY[0x24BE9AD78];
  v10 = sub_235CA33CC();
  v11 = *(_QWORD *)(v10 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 104))(v8, v9, v10);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  sub_235CA3390();
  swift_bridgeObjectRetain();
  sub_235CA3384();
  v12 = a2 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_sessionId;
  v13 = sub_235CA2790();
  v14 = *(_QWORD *)(v13 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v5, v12, v13);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v5, 0, 1, v13);
  return sub_235CA339C();
}

uint64_t sub_235C648C0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254299468);
  v0 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542990C0);
  v1 = *(_QWORD *)(v0 - 8);
  v2 = *(_QWORD *)(v1 + 72);
  v3 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_235CA43E0;
  v5 = v4 + v3;
  v6 = *(int *)(v0 + 48);
  sub_235CA34C8();
  if (qword_254299310 != -1)
    swift_once();
  v7 = (_QWORD *)(v5 + v6);
  v8 = unk_254299680;
  *v7 = qword_254299678;
  v7[1] = v8;
  v9 = (_QWORD *)(v5 + v2 + *(int *)(v0 + 48));
  swift_bridgeObjectRetain();
  sub_235CA34EC();
  *v9 = 0xD000000000000033;
  v9[1] = 0x8000000235CA57A0;
  v10 = (_QWORD *)(v5 + 2 * v2 + *(int *)(v0 + 48));
  sub_235CA3504();
  *v10 = 0xD000000000000021;
  v10[1] = 0x8000000235CA5060;
  v11 = (_QWORD *)(v5 + 3 * v2 + *(int *)(v0 + 48));
  sub_235CA3528();
  sub_235CA3828();
  sub_235CA3828();
  sub_235CA3828();
  *v11 = 0;
  v11[1] = 0xE000000000000000;
  v12 = (_QWORD *)(v5 + 4 * v2 + *(int *)(v0 + 48));
  sub_235CA34F8();
  sub_235CA3828();
  sub_235CA3B64();
  sub_235CA3828();
  swift_bridgeObjectRelease();
  sub_235CA3828();
  *v12 = 0;
  v12[1] = 0xE000000000000000;
  return v4;
}

uint64_t sub_235C64AD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
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
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v27[2];

  v27[1] = a3;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542989B0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_254299050);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_254299070);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = *MEMORY[0x24BE9AD78];
  v17 = sub_235CA33CC();
  v18 = *(_QWORD *)(v17 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v18 + 104))(v15, v16, v17);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
  sub_235CA2C10();
  swift_bridgeObjectRetain();
  sub_235CA2BF8();
  v19 = a2 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_sessionId;
  v20 = sub_235CA2790();
  v21 = *(_QWORD *)(v20 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v21 + 16))(v12, v19, v20);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v21 + 56))(v12, 0, 1, v20);
  sub_235CA2C34();
  swift_bridgeObjectRetain();
  sub_235CA2C28();
  swift_bridgeObjectRetain();
  sub_235CA2BEC();
  v22 = a5;
  sub_235CA2C04();
  v23 = a2 + OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_userId;
  v24 = sub_235CA3498();
  v25 = *(_QWORD *)(v24 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v25 + 16))(v9, v23, v24);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v25 + 56))(v9, 0, 1, v24);
  return sub_235CA2C1C();
}

uint64_t sub_235C64DD0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  unint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  _QWORD *v26;
  unint64_t v27;
  _QWORD *v28;
  unint64_t v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;

  v37 = a4;
  v34 = a2;
  v35 = a3;
  v32 = a1;
  v31 = sub_235CA2790();
  v33 = *(_QWORD *)(v31 - 8);
  MEMORY[0x24BDAC7A8](v31);
  v7 = (char *)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254299468);
  v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542990C0);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(_QWORD *)(v9 + 72);
  v11 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_235CA43F0;
  v36 = v12;
  v13 = v12 + v11;
  v14 = *(int *)(v8 + 48);
  sub_235CA34C8();
  if (qword_254299310 != -1)
    swift_once();
  v15 = (_QWORD *)(v13 + v14);
  v16 = unk_254299680;
  *v15 = qword_254299678;
  v15[1] = v16;
  v17 = (_QWORD *)(v13 + v10 + *(int *)(v8 + 48));
  swift_bridgeObjectRetain();
  sub_235CA3504();
  *v17 = 0xD00000000000001ALL;
  v17[1] = a5;
  v18 = (_QWORD *)(v13 + 2 * v10 + *(int *)(v8 + 48));
  sub_235CA34D4();
  v39 = 0;
  v40 = 0xE000000000000000;
  sub_235CA3828();
  v19 = v32;
  swift_bridgeObjectRetain();
  sub_235CA3828();
  swift_bridgeObjectRelease();
  sub_235CA3828();
  v20 = v40;
  *v18 = v39;
  v18[1] = v20;
  v21 = (_QWORD *)(v13 + 3 * v10 + *(int *)(v8 + 48));
  sub_235CA3534();
  v39 = 0;
  v40 = 0xE000000000000000;
  sub_235CA3828();
  v22 = v19 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_sessionId;
  v23 = v33;
  v24 = v31;
  (*(void (**)(char *, uint64_t, uint64_t))(v33 + 16))(v7, v22, v31);
  sub_235C69C18((unint64_t *)&unk_254299040, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
  sub_235CA3B64();
  sub_235CA3828();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v23 + 8))(v7, v24);
  sub_235CA3828();
  v25 = v40;
  *v21 = v39;
  v21[1] = v25;
  v26 = (_QWORD *)(v13 + 4 * v10 + *(int *)(v8 + 48));
  sub_235CA3528();
  v39 = 0;
  v40 = 0xE000000000000000;
  sub_235CA3828();
  sub_235CA3828();
  sub_235CA3828();
  v27 = v40;
  *v26 = v39;
  v26[1] = v27;
  v28 = (_QWORD *)(v13 + 5 * v10 + *(int *)(v8 + 48));
  sub_235CA34F8();
  v39 = 0;
  v40 = 0xE000000000000000;
  sub_235CA3828();
  v38 = v37;
  sub_235CA3B64();
  sub_235CA3828();
  swift_bridgeObjectRelease();
  sub_235CA3828();
  v29 = v40;
  *v28 = v39;
  v28[1] = v29;
  return v36;
}

uint64_t sub_235C65100(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  unint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  _QWORD *v27;
  unint64_t v28;
  _QWORD *v29;
  unint64_t v30;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;

  v35 = a4;
  v36 = a1;
  v6 = sub_235CA2790();
  v33 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254299468);
  v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542990C0);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_235CA4400;
  v34 = v13;
  v14 = v13 + v12;
  v15 = *(int *)(v9 + 48);
  sub_235CA34C8();
  if (qword_254299310 != -1)
    swift_once();
  v16 = (_QWORD *)(v14 + v15);
  v17 = unk_254299680;
  *v16 = qword_254299678;
  v16[1] = v17;
  v18 = (_QWORD *)(v14 + v11 + *(int *)(v9 + 48));
  swift_bridgeObjectRetain();
  sub_235CA34EC();
  v38 = 0;
  v39 = 0xE000000000000000;
  sub_235CA3A80();
  sub_235CA3828();
  sub_235CA3828();
  sub_235CA3828();
  sub_235CA3828();
  sub_235CA3828();
  v19 = v39;
  *v18 = v38;
  v18[1] = v19;
  v20 = (_QWORD *)(v14 + 2 * v11 + *(int *)(v9 + 48));
  sub_235CA3504();
  *v20 = 0xD000000000000021;
  v20[1] = 0x8000000235CA50B0;
  v21 = (_QWORD *)(v14 + 3 * v11 + *(int *)(v9 + 48));
  sub_235CA34D4();
  v38 = 0;
  v39 = 0xE000000000000000;
  sub_235CA3828();
  v32 = a2;
  swift_bridgeObjectRetain();
  sub_235CA3828();
  swift_bridgeObjectRelease();
  sub_235CA3828();
  v22 = v39;
  *v21 = v38;
  v21[1] = v22;
  v23 = (_QWORD *)(v14 + 4 * v11 + *(int *)(v9 + 48));
  sub_235CA3534();
  v38 = 0;
  v39 = 0xE000000000000000;
  sub_235CA3828();
  v24 = a3 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_sessionId;
  v25 = v33;
  (*(void (**)(char *, uint64_t, uint64_t))(v33 + 16))(v8, v24, v6);
  sub_235C69C18((unint64_t *)&unk_254299040, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
  sub_235CA3B64();
  sub_235CA3828();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v8, v6);
  sub_235CA3828();
  v26 = v39;
  *v23 = v38;
  v23[1] = v26;
  v27 = (_QWORD *)(v14 + 5 * v11 + *(int *)(v9 + 48));
  sub_235CA3528();
  v38 = 0;
  v39 = 0xE000000000000000;
  sub_235CA3828();
  sub_235CA3828();
  sub_235CA3828();
  v28 = v39;
  *v27 = v38;
  v27[1] = v28;
  v29 = (_QWORD *)(v14 + 6 * v11 + *(int *)(v9 + 48));
  sub_235CA34F8();
  v38 = 0;
  v39 = 0xE000000000000000;
  sub_235CA3828();
  v37 = v35;
  sub_235CA3B64();
  sub_235CA3828();
  swift_bridgeObjectRelease();
  sub_235CA3828();
  v30 = v39;
  *v29 = v38;
  v29[1] = v30;
  return v34;
}

uint64_t sub_235C654DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  unint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  _QWORD *v25;
  unint64_t v26;
  _QWORD *v27;
  unint64_t v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;

  v36 = a4;
  v33 = a2;
  v34 = a3;
  v32 = a1;
  v4 = sub_235CA2790();
  v31 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254299468);
  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542990C0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_QWORD *)(v8 + 72);
  v10 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_235CA4400;
  v35 = v11;
  v12 = v11 + v10;
  v13 = *(int *)(v7 + 48);
  sub_235CA34C8();
  if (qword_254299310 != -1)
    swift_once();
  v14 = (_QWORD *)(v12 + v13);
  v15 = unk_254299680;
  *v14 = qword_254299678;
  v14[1] = v15;
  v16 = (_QWORD *)(v12 + v9 + *(int *)(v7 + 48));
  swift_bridgeObjectRetain();
  sub_235CA34EC();
  *v16 = 0xD00000000000003FLL;
  v16[1] = 0x8000000235CA56F0;
  v17 = (_QWORD *)(v12 + 2 * v9 + *(int *)(v7 + 48));
  sub_235CA3504();
  *v17 = 0xD000000000000021;
  v17[1] = 0x8000000235CA50B0;
  v18 = (_QWORD *)(v12 + 3 * v9 + *(int *)(v7 + 48));
  sub_235CA34D4();
  v38 = 0;
  v39 = 0xE000000000000000;
  sub_235CA3828();
  v19 = v32;
  swift_bridgeObjectRetain();
  sub_235CA3828();
  swift_bridgeObjectRelease();
  sub_235CA3828();
  v20 = v39;
  *v18 = v38;
  v18[1] = v20;
  v21 = (_QWORD *)(v12 + 4 * v9 + *(int *)(v7 + 48));
  sub_235CA3534();
  v38 = 0;
  v39 = 0xE000000000000000;
  sub_235CA3828();
  v22 = v19 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_sessionId;
  v23 = v31;
  (*(void (**)(char *, uint64_t, uint64_t))(v31 + 16))(v6, v22, v4);
  sub_235C69C18((unint64_t *)&unk_254299040, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
  sub_235CA3B64();
  sub_235CA3828();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v23 + 8))(v6, v4);
  sub_235CA3828();
  v24 = v39;
  *v21 = v38;
  v21[1] = v24;
  v25 = (_QWORD *)(v12 + 5 * v9 + *(int *)(v7 + 48));
  sub_235CA3528();
  v38 = 0;
  v39 = 0xE000000000000000;
  sub_235CA3828();
  sub_235CA3828();
  sub_235CA3828();
  v26 = v39;
  *v25 = v38;
  v25[1] = v26;
  v27 = (_QWORD *)(v12 + 6 * v9 + *(int *)(v7 + 48));
  sub_235CA34F8();
  v38 = 0;
  v39 = 0xE000000000000000;
  sub_235CA3828();
  v37 = v36;
  sub_235CA3B64();
  sub_235CA3828();
  swift_bridgeObjectRelease();
  sub_235CA3828();
  v28 = v39;
  *v27 = v38;
  v27[1] = v28;
  return v35;
}

uint64_t sub_235C65840(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, void *a6)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  _DWORD v22[4];

  v22[3] = a5;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_254299050);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_254299070);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = *MEMORY[0x24BE9AD78];
  v15 = sub_235CA33CC();
  v16 = *(_QWORD *)(v15 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 104))(v13, v14, v15);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
  sub_235CA2B50();
  swift_bridgeObjectRetain();
  sub_235CA2B20();
  v17 = a2 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_sessionId;
  v18 = sub_235CA2790();
  v19 = *(_QWORD *)(v18 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v10, v17, v18);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v19 + 56))(v10, 0, 1, v18);
  sub_235CA2B68();
  swift_bridgeObjectRetain();
  sub_235CA2B5C();
  swift_bridgeObjectRetain();
  sub_235CA2B44();
  sub_235CA2B2C();
  v20 = a6;
  return sub_235CA2B38();
}

uint64_t sub_235C65A28(uint64_t a1, uint64_t a2)
{
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_254299050);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254299070);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *MEMORY[0x24BE9AD78];
  v10 = sub_235CA33CC();
  v11 = *(_QWORD *)(v10 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 104))(v8, v9, v10);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  sub_235CA2994();
  swift_bridgeObjectRetain();
  sub_235CA2970();
  v12 = a2 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_sessionId;
  v13 = sub_235CA2790();
  v14 = *(_QWORD *)(v13 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v5, v12, v13);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v5, 0, 1, v13);
  sub_235CA29AC();
  swift_bridgeObjectRetain();
  sub_235CA29A0();
  swift_bridgeObjectRetain();
  sub_235CA2988();
  return sub_235CA297C();
}

void sub_235C65C74()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v14;
  uint64_t v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  id v29;
  id v30;
  void *v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  char *v36;
  char *v37;
  os_log_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;

  v1 = v0;
  v2 = sub_235CA36F0();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(_QWORD *)(v3 + 64);
  v5 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v38 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v38 - v7;
  v9 = *(void **)&v0[OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_resultSelectedMsg];
  if (!v9)
  {
    if (qword_2542992E8 != -1)
      swift_once();
    v18 = sub_235CA3708();
    __swift_project_value_buffer(v18, (uint64_t)qword_254299660);
    v39 = v0;
    v19 = sub_235CA36FC();
    v20 = sub_235CA3924();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = (uint8_t *)swift_slowAlloc();
      v22 = swift_slowAlloc();
      v41 = v22;
      *(_DWORD *)v21 = 136315138;
      v23 = *(_QWORD *)&v39[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId];
      v24 = *(_QWORD *)&v39[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId + 8];
      swift_bridgeObjectRetain();
      v40 = sub_235C944B8(v23, v24, &v41);
      sub_235CA3A14();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_235C5E000, v19, v20, "No recognition candidate accepted yet for requestId: %s", v21, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B7DE144](v22, -1, -1);
      MEMORY[0x23B7DE144](v21, -1, -1);

      return;
    }

    goto LABEL_27;
  }
  v39 = v9;
  v10 = sub_235CA3378();
  v12 = v11;

  if (v10 == *(_QWORD *)&v1[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId]
    && v12 == *(_QWORD *)&v1[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId + 8])
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v14 = sub_235CA3B88();
    swift_bridgeObjectRelease();
    if ((v14 & 1) == 0)
    {
      if (qword_2542992E8 != -1)
        swift_once();
      v15 = sub_235CA3708();
      __swift_project_value_buffer(v15, (uint64_t)qword_254299660);
      v38 = (os_log_t)sub_235CA36FC();
      v16 = sub_235CA3930();
      if (os_log_type_enabled(v38, v16))
      {
        v17 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v17 = 0;
        _os_log_impl(&dword_235C5E000, v38, v16, "ResultSelectedMessage requestId does not match current requestId", v17, 2u);
        MEMORY[0x23B7DE144](v17, -1, -1);

        return;
      }

LABEL_27:
      return;
    }
  }
  if (qword_2542992E8 != -1)
    swift_once();
  v25 = sub_235CA3708();
  __swift_project_value_buffer(v25, (uint64_t)qword_254299660);
  v26 = sub_235CA36FC();
  v27 = sub_235CA3924();
  if (os_log_type_enabled(v26, v27))
  {
    v28 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v28 = 0;
    _os_log_impl(&dword_235C5E000, v26, v27, "Will wait on Myriad selection..", v28, 2u);
    MEMORY[0x23B7DE144](v28, -1, -1);
  }

  if (qword_2542990E8 != -1)
    swift_once();
  v29 = (id)qword_2542994C8;
  sub_235CA36D8();
  sub_235CA39A8();
  v30 = (id)qword_2542994C8;
  sub_235CA36C0();

  if (qword_2542992C0 != -1)
    swift_once();
  v31 = *(void **)algn_2542992B0;
  v38 = (os_log_t)qword_2542992A8;
  v32 = swift_allocObject();
  swift_unknownObjectWeakInit();
  (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v6, v8, v2);
  v33 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v34 = (v4 + v33 + 7) & 0xFFFFFFFFFFFFFFF8;
  v35 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(v35 + v33, v6, v2);
  *(_QWORD *)(v35 + v34) = v32;
  v36 = v39;
  *(_QWORD *)(v35 + ((v34 + 15) & 0xFFFFFFFFFFFFFFF8)) = v39;
  v37 = v36;
  swift_retain();
  sub_235C72238((uint64_t)v38, v31, (uint64_t)sub_235C6A0D8, v35);

  swift_release();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
  swift_release();
}

void sub_235C66248(char a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;

  v7 = sub_235CA3564();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = a3 + 16;
  sub_235CA399C();
  if (qword_2542990E8 != -1)
    swift_once();
  v12 = (id)qword_2542994C8;
  sub_235CA36CC();

  swift_beginAccess();
  v13 = MEMORY[0x23B7DE18C](v11);
  if (!v13)
  {
    if (qword_2542992E8 != -1)
      swift_once();
    v20 = sub_235CA3708();
    __swift_project_value_buffer(v20, (uint64_t)qword_254299660);
    v21 = sub_235CA36FC();
    v22 = sub_235CA393C();
    if (os_log_type_enabled(v21, v22))
    {
      v23 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v23 = 0;
      _os_log_impl(&dword_235C5E000, v21, v22, "Not posting ResultSelected since self is already out-of-scope", v23, 2u);
      MEMORY[0x23B7DE144](v23, -1, -1);
    }
    goto LABEL_22;
  }
  v14 = (char *)v13;
  if ((a1 & 1) != 0)
  {
    swift_retain();
    sub_235C775EC(a4);
    swift_release();
    sub_235CA2B74();
    v15 = swift_dynamicCastClass();
    v17 = *(_QWORD *)&v14[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId];
    v16 = *(_QWORD *)&v14[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId + 8];
    swift_retain();
    swift_bridgeObjectRetain();
    v19 = sub_235CA2F88();
    if (v15)
      sub_235C71F1C(v17, v16, v19, v18);
    else
      sub_235C71EEC(v17, v16, v19, v18);
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_2542989C0 != -1)
      swift_once();
    v30 = __swift_project_value_buffer(v7, (uint64_t)qword_254299648);
    (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v30, v7);
    *(_QWORD *)(swift_allocObject() + 16) = v14;
    v31 = v14;
    sub_235CA3540();
    swift_release();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    v21 = *(NSObject **)&v31[OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_resultSelectedMsg];
    *(_QWORD *)&v31[OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_resultSelectedMsg] = 0;

LABEL_22:
    return;
  }
  if (qword_2542992E8 != -1)
    swift_once();
  v24 = sub_235CA3708();
  __swift_project_value_buffer(v24, (uint64_t)qword_254299660);
  v25 = sub_235CA36FC();
  v26 = sub_235CA393C();
  if (os_log_type_enabled(v25, v26))
  {
    v27 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v27 = 0;
    _os_log_impl(&dword_235C5E000, v25, v26, "Not posting ResultSelected since myriad selection is lost", v27, 2u);
    MEMORY[0x23B7DE144](v27, -1, -1);
  }

  if (qword_2542989C0 != -1)
    swift_once();
  v28 = __swift_project_value_buffer(v7, (uint64_t)qword_254299648);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v28, v7);
  *(_QWORD *)(swift_allocObject() + 16) = v14;
  v29 = v14;
  sub_235CA354C();

  swift_release();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t sub_235C666D0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  _QWORD *v17;
  unint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  _QWORD *v23;
  unint64_t v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;

  v2 = sub_235CA2790();
  v3 = *(_QWORD *)(v2 - 8);
  v27 = v2;
  v28 = v3;
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254299468);
  v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542990C0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 72);
  v9 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_235CA43E0;
  v29 = v10;
  v11 = v10 + v9;
  v12 = *(int *)(v6 + 48);
  sub_235CA34C8();
  if (qword_254299310 != -1)
    swift_once();
  v13 = (_QWORD *)(v11 + v12);
  v14 = unk_254299680;
  *v13 = qword_254299678;
  v13[1] = v14;
  v15 = (uint64_t *)(v11 + v8 + *(int *)(v6 + 48));
  swift_bridgeObjectRetain();
  sub_235CA3504();
  *v15 = sub_235C99088(0xDu);
  v15[1] = v16;
  v17 = (_QWORD *)(v11 + 2 * v8 + *(int *)(v6 + 48));
  sub_235CA34D4();
  v30 = 0;
  v31 = 0xE000000000000000;
  sub_235CA3828();
  swift_bridgeObjectRetain();
  sub_235CA3828();
  swift_bridgeObjectRelease();
  sub_235CA3828();
  v18 = v31;
  *v17 = v30;
  v17[1] = v18;
  v19 = (_QWORD *)(v11 + 3 * v8 + *(int *)(v6 + 48));
  sub_235CA3534();
  v30 = 0;
  v31 = 0xE000000000000000;
  sub_235CA3828();
  v21 = v27;
  v20 = v28;
  (*(void (**)(char *, uint64_t, uint64_t))(v28 + 16))(v5, a1 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_sessionId, v27);
  sub_235C69C18((unint64_t *)&unk_254299040, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
  sub_235CA3B64();
  sub_235CA3828();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v20 + 8))(v5, v21);
  sub_235CA3828();
  v22 = v31;
  *v19 = v30;
  v19[1] = v22;
  v23 = (_QWORD *)(v11 + 4 * v8 + *(int *)(v6 + 48));
  sub_235CA3528();
  v30 = 0;
  v31 = 0xE000000000000000;
  sub_235CA3828();
  sub_235CA3828();
  sub_235CA3828();
  v24 = v31;
  *v23 = v30;
  v23[1] = v24;
  return v29;
}

uint64_t sub_235C66988()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254299468);
  v0 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542990C0);
  v1 = *(_QWORD *)(v0 - 8);
  v2 = *(_QWORD *)(v1 + 72);
  v3 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_235CA4410;
  v5 = v4 + v3;
  v6 = *(int *)(v0 + 48);
  sub_235CA34C8();
  if (qword_254299310 != -1)
    swift_once();
  v7 = (_QWORD *)(v5 + v6);
  v8 = unk_254299680;
  *v7 = qword_254299678;
  v7[1] = v8;
  v9 = (_QWORD *)(v5 + v2 + *(int *)(v0 + 48));
  swift_bridgeObjectRetain();
  sub_235CA3504();
  *v9 = 0xD000000000000027;
  v9[1] = 0x8000000235CA50E0;
  v10 = (_QWORD *)(v5 + 2 * v2 + *(int *)(v0 + 48));
  sub_235CA3528();
  sub_235CA3828();
  sub_235CA3828();
  sub_235CA3828();
  *v10 = 0;
  v10[1] = 0xE000000000000000;
  return v4;
}

void sub_235C66AFC(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  int v15;
  uint64_t v16;
  id v17;
  void *v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  id v22;
  void *v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  os_log_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  os_log_t v34;
  uint64_t v35;
  uint64_t v36;

  v5 = sub_235CA3708();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2542992E8 != -1)
    swift_once();
  v9 = __swift_project_value_buffer(v5, (uint64_t)qword_254299660);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v9, v5);
  v10 = a3;
  v11 = a2;
  v12 = v10;
  v13 = a2;
  v14 = sub_235CA36FC();
  v15 = sub_235CA3924();
  if (os_log_type_enabled(v14, (os_log_type_t)v15))
  {
    v33 = v15;
    v34 = v14;
    v16 = swift_slowAlloc();
    v32 = swift_slowAlloc();
    v36 = v32;
    *(_DWORD *)v16 = 136315650;
    v17 = objc_msgSend(v12, sel_aceId);
    if (v17)
    {
      v18 = v17;
      v31 = v6;
      v19 = sub_235CA37EC();
      v21 = v20;

      v35 = sub_235C944B8(v19, v21, &v36);
      sub_235CA3A14();

      swift_bridgeObjectRelease();
      *(_WORD *)(v16 + 12) = 2080;
      v22 = objc_msgSend(v12, sel_refId);
      if (v22)
      {
        v23 = v22;
        v24 = sub_235CA37EC();
        v26 = v25;

        v35 = sub_235C944B8(v24, v26, &v36);
        sub_235CA3A14();

        swift_bridgeObjectRelease();
        *(_WORD *)(v16 + 22) = 2080;
        v35 = (uint64_t)a2;
        __swift_instantiateConcreteTypeFromMangledName(&qword_2542994A8);
        v27 = sub_235CA39FC();
        v35 = sub_235C944B8(v27, v28, &v36);
        sub_235CA3A14();
        swift_bridgeObjectRelease();

        v29 = v34;
        _os_log_impl(&dword_235C5E000, v34, (os_log_type_t)v33, "Sent voiceIdScoreCard to server with aceId: %s and refId:%s, error: %s", (uint8_t *)v16, 0x20u);
        v30 = v32;
        swift_arrayDestroy();
        MEMORY[0x23B7DE144](v30, -1, -1);
        MEMORY[0x23B7DE144](v16, -1, -1);

        (*(void (**)(char *, uint64_t))(v31 + 8))(v8, v5);
        return;
      }
    }
    else
    {

      __break(1u);
    }

    __break(1u);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
}

uint64_t sub_235C66E6C(uint64_t a1, uint64_t a2, void *a3)
{
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
  uint64_t v16;
  id v17;
  uint64_t v19;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254299050);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_254299070);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *MEMORY[0x24BE9AD78];
  v12 = sub_235CA33CC();
  v13 = *(_QWORD *)(v12 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 104))(v10, v11, v12);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
  sub_235CA2AFC();
  swift_bridgeObjectRetain();
  sub_235CA2AF0();
  v14 = a2 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_sessionId;
  v15 = sub_235CA2790();
  v16 = *(_QWORD *)(v15 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v7, v14, v15);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v7, 0, 1, v15);
  sub_235CA2AE4();
  swift_bridgeObjectRetain();
  sub_235CA2AD8();
  v17 = a3;
  return sub_235CA2ACC();
}

id sub_235C6701C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id result;
  void *v19;
  uint64_t v20;
  _BYTE v21[16];

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254299050);
  MEMORY[0x24BDAC7A8](v5);
  v7 = &v21[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_254299070);
  MEMORY[0x24BDAC7A8](v8);
  v10 = &v21[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v11 = *MEMORY[0x24BE9AD78];
  v12 = sub_235CA33CC();
  v13 = *(_QWORD *)(v12 - 8);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v13 + 104))(v10, v11, v12);
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
  sub_235CA2D90();
  swift_bridgeObjectRetain();
  sub_235CA2D60();
  v14 = a2 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_sessionId;
  v15 = sub_235CA2790();
  v16 = *(_QWORD *)(v15 - 8);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v16 + 16))(v7, v14, v15);
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v7, 0, 1, v15);
  sub_235CA2DA8();
  swift_bridgeObjectRetain();
  sub_235CA2D9C();
  v17 = a3;
  sub_235CA2D78();
  objc_msgSend(v17, sel_userIdentityClassification);
  sub_235CA2D84();
  result = objc_msgSend(v17, sel_spIdKnownUserScores);
  if (result)
  {
    v19 = result;
    sub_235C71624(0, (unint64_t *)&unk_254299400);
    v20 = sub_235CA3798();

    sub_235C69CDC(v20);
    swift_bridgeObjectRelease();
    return (id)sub_235CA2D6C();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_235C67498(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  unint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  unint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  _QWORD *v30;
  unint64_t v31;
  _QWORD v33[3];
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;

  v6 = sub_235CA2790();
  v7 = *(_QWORD *)(v6 - 8);
  v34 = v6;
  v35 = v7;
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254299468);
  v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542990C0);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(_QWORD *)(v11 + 72);
  v13 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_235CA43F0;
  v36 = v14;
  v15 = v14 + v13;
  v16 = *(int *)(v10 + 48);
  sub_235CA34C8();
  if (qword_254299310 != -1)
    swift_once();
  v17 = (_QWORD *)(v15 + v16);
  v18 = unk_254299680;
  *v17 = qword_254299678;
  v17[1] = v18;
  v19 = (_QWORD *)(v15 + v12 + *(int *)(v10 + 48));
  swift_bridgeObjectRetain();
  sub_235CA34EC();
  v39 = 0;
  v40 = 0xE000000000000000;
  sub_235CA3A80();
  sub_235CA3828();
  v37 = a1;
  v38 = a2;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2563772A8);
  sub_235CA37F8();
  sub_235CA3828();
  swift_bridgeObjectRelease();
  sub_235CA3828();
  v20 = *(_QWORD *)(a3 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId);
  v33[1] = *(_QWORD *)(a3 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId + 8);
  v33[2] = v20;
  sub_235CA3828();
  sub_235CA3828();
  v21 = v40;
  *v19 = v39;
  v19[1] = v21;
  v22 = (_QWORD *)(v15 + 2 * v12 + *(int *)(v10 + 48));
  sub_235CA3504();
  *v22 = 0xD00000000000001ELL;
  v22[1] = 0x8000000235CA5110;
  v23 = (_QWORD *)(v15 + 3 * v12 + *(int *)(v10 + 48));
  sub_235CA34D4();
  v39 = 0;
  v40 = 0xE000000000000000;
  sub_235CA3828();
  swift_bridgeObjectRetain();
  sub_235CA3828();
  swift_bridgeObjectRelease();
  sub_235CA3828();
  v24 = v40;
  *v23 = v39;
  v23[1] = v24;
  v25 = (_QWORD *)(v15 + 4 * v12 + *(int *)(v10 + 48));
  sub_235CA3534();
  v39 = 0;
  v40 = 0xE000000000000000;
  sub_235CA3828();
  v26 = a3 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_sessionId;
  v27 = v34;
  v28 = v35;
  (*(void (**)(char *, uint64_t, uint64_t))(v35 + 16))(v9, v26, v34);
  sub_235C69C18((unint64_t *)&unk_254299040, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
  sub_235CA3B64();
  sub_235CA3828();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v28 + 8))(v9, v27);
  sub_235CA3828();
  v29 = v40;
  *v25 = v39;
  v25[1] = v29;
  v30 = (_QWORD *)(v15 + 5 * v12 + *(int *)(v10 + 48));
  sub_235CA3528();
  v39 = 0;
  v40 = 0xE000000000000000;
  sub_235CA3828();
  sub_235CA3828();
  sub_235CA3828();
  v31 = v40;
  *v30 = v39;
  v30[1] = v31;
  return v36;
}

uint64_t sub_235C67824(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD *v17;
  unint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  unint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  _QWORD *v27;
  unint64_t v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;

  v35 = a4;
  v36 = a5;
  v33 = a3;
  v31 = a1;
  v6 = sub_235CA2790();
  v32 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254299468);
  v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542990C0);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_235CA43F0;
  v34 = v13;
  v14 = v13 + v12;
  v15 = (_QWORD *)(v13 + v12 + *(int *)(v9 + 48));
  sub_235CA34C8();
  if (qword_254299310 != -1)
    swift_once();
  v16 = unk_254299680;
  *v15 = qword_254299678;
  v15[1] = v16;
  swift_bridgeObjectRetain();
  sub_235CA34EC();
  v38 = 0;
  v39 = 0xE000000000000000;
  sub_235CA3A80();
  sub_235CA3828();
  if ((a2 & 1) == 0)
  {
    v37 = v31;
    sub_235C7152C();
    sub_235CA3A2C();
  }
  v17 = (_QWORD *)(v14 + v11 + *(int *)(v9 + 48));
  sub_235CA3828();
  swift_bridgeObjectRelease();
  sub_235CA3828();
  v18 = v39;
  *v17 = v38;
  v17[1] = v18;
  v19 = (_QWORD *)(v14 + 2 * v11 + *(int *)(v9 + 48));
  sub_235CA3504();
  *v19 = 0xD00000000000001ELL;
  v19[1] = 0x8000000235CA5110;
  v20 = (_QWORD *)(v14 + 3 * v11 + *(int *)(v9 + 48));
  sub_235CA34D4();
  v38 = 0;
  v39 = 0xE000000000000000;
  sub_235CA3828();
  v21 = v33;
  swift_bridgeObjectRetain();
  sub_235CA3828();
  swift_bridgeObjectRelease();
  sub_235CA3828();
  v22 = v39;
  *v20 = v38;
  v20[1] = v22;
  v23 = (_QWORD *)(v14 + 4 * v11 + *(int *)(v9 + 48));
  sub_235CA3534();
  v38 = 0;
  v39 = 0xE000000000000000;
  sub_235CA3828();
  v24 = v21 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_sessionId;
  v25 = v32;
  (*(void (**)(char *, uint64_t, uint64_t))(v32 + 16))(v8, v24, v6);
  sub_235C69C18((unint64_t *)&unk_254299040, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
  sub_235CA3B64();
  sub_235CA3828();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v8, v6);
  sub_235CA3828();
  v26 = v39;
  *v23 = v38;
  v23[1] = v26;
  sub_235CA3528();
  v38 = 0;
  v39 = 0xE000000000000000;
  sub_235CA3828();
  v27 = (_QWORD *)(v14 + 5 * v11 + *(int *)(v9 + 48));
  swift_bridgeObjectRetain();
  sub_235CA3828();
  swift_bridgeObjectRelease();
  sub_235CA3828();
  v28 = v39;
  *v27 = v38;
  v27[1] = v28;
  return v34;
}

uint64_t sub_235C67BC0(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5, int a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  _QWORD *v25;
  unint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  unint64_t v36;
  _QWORD *v37;
  unint64_t v38;
  _QWORD *v39;
  unint64_t v40;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  int v49;
  uint64_t v50;
  id v51;
  uint64_t v52;
  unint64_t v53;

  v49 = a6;
  v42 = a5;
  v47 = a3;
  v48 = a4;
  v46 = a2;
  v11 = sub_235CA2790();
  v12 = *(_QWORD *)(v11 - 8);
  v44 = v11;
  v45 = v12;
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v42 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254299468);
  v15 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542990C0);
  v16 = *(_QWORD *)(v15 - 8);
  v17 = *(_QWORD *)(v16 + 72);
  v18 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  v19 = swift_allocObject();
  *(_OWORD *)(v19 + 16) = xmmword_235CA4420;
  v50 = v19;
  v20 = v19 + v18;
  v21 = (_QWORD *)(v19 + v18 + *(int *)(v15 + 48));
  sub_235CA34C8();
  if (qword_254299310 != -1)
    swift_once();
  v22 = unk_254299680;
  *v21 = qword_254299678;
  v21[1] = v22;
  v23 = (_QWORD *)(v20 + v17 + *(int *)(v15 + 48));
  swift_bridgeObjectRetain();
  sub_235CA34EC();
  *v23 = a7;
  v23[1] = a8;
  v24 = (_QWORD *)(v20 + 2 * v17 + *(int *)(v15 + 48));
  sub_235CA3504();
  *v24 = 0xD000000000000025;
  v24[1] = 0x8000000235CA5130;
  v25 = (_QWORD *)(v20 + 3 * v17 + *(int *)(v15 + 48));
  sub_235CA34D4();
  v52 = 0;
  v53 = 0xE000000000000000;
  sub_235CA3828();
  swift_bridgeObjectRetain();
  sub_235CA3828();
  swift_bridgeObjectRelease();
  sub_235CA3828();
  v26 = v53;
  *v25 = v52;
  v25[1] = v26;
  v27 = 4 * v17;
  v28 = (_QWORD *)(v20 + 4 * v17 + *(int *)(v15 + 48));
  sub_235CA3534();
  v52 = 0;
  v53 = 0xE000000000000000;
  sub_235CA3828();
  v29 = a1 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_sessionId;
  v43 = v17;
  v30 = v15;
  v32 = v44;
  v31 = v45;
  (*(void (**)(char *, uint64_t, uint64_t))(v45 + 16))(v14, v29, v44);
  sub_235C69C18((unint64_t *)&unk_254299040, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
  sub_235CA3B64();
  sub_235CA3828();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v31 + 8))(v14, v32);
  sub_235CA3828();
  v33 = v53;
  *v28 = v52;
  v28[1] = v33;
  v34 = v43;
  sub_235CA3528();
  v52 = 0;
  v53 = 0xE000000000000000;
  sub_235CA3828();
  v35 = (_QWORD *)(v20 + v27 + v34 + *(int *)(v30 + 48));
  swift_bridgeObjectRetain();
  sub_235CA3828();
  swift_bridgeObjectRelease();
  sub_235CA3828();
  v36 = v53;
  *v35 = v52;
  v35[1] = v36;
  v37 = (_QWORD *)(v20 + 6 * v34 + *(int *)(v30 + 48));
  sub_235CA351C();
  v52 = 0;
  v53 = 0xE000000000000000;
  sub_235CA3828();
  v51 = objc_msgSend(v48, sel_code);
  sub_235CA3B64();
  sub_235CA3828();
  swift_bridgeObjectRelease();
  sub_235CA3828();
  v38 = v53;
  *v37 = v52;
  v37[1] = v38;
  sub_235CA34E0();
  v52 = 0;
  v53 = 0xE000000000000000;
  sub_235CA3828();
  if ((v49 & 1) == 0)
  {
    v51 = v42;
    sub_235C7152C();
    sub_235CA3A2C();
  }
  v39 = (_QWORD *)(v20 - v34 + 8 * v34 + *(int *)(v30 + 48));
  sub_235CA3828();
  swift_bridgeObjectRelease();
  sub_235CA3828();
  v40 = v53;
  *v39 = v52;
  v39[1] = v40;
  return v50;
}

uint64_t sub_235C67FD4(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, int a6)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  _QWORD *v18;
  id v19;
  unint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  unint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  unint64_t v34;
  _QWORD *v35;
  unint64_t v36;
  _QWORD *v37;
  unint64_t v38;
  void *v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  int v49;
  uint64_t v50;
  id v51;
  uint64_t v52;
  unint64_t v53;

  v49 = a6;
  v40 = a5;
  v47 = a3;
  v48 = a4;
  v43 = a2;
  v7 = sub_235CA2790();
  v8 = *(_QWORD *)(v7 - 8);
  v45 = v7;
  v46 = v8;
  MEMORY[0x24BDAC7A8](v7);
  v44 = (char *)&v40 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254299468);
  v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542990C0);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(_QWORD *)(v11 + 72);
  v13 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_235CA4420;
  v50 = v14;
  v15 = v14 + v13;
  v16 = (_QWORD *)(v14 + v13 + *(int *)(v10 + 48));
  sub_235CA34C8();
  if (qword_254299310 != -1)
    swift_once();
  v17 = unk_254299680;
  *v16 = qword_254299678;
  v16[1] = v17;
  swift_bridgeObjectRetain();
  sub_235CA34EC();
  v52 = 0;
  v53 = 0xE000000000000000;
  sub_235CA3A80();
  sub_235CA3828();
  v51 = objc_msgSend(a1, sel_code);
  sub_235CA3B64();
  v42 = a1;
  sub_235CA3828();
  swift_bridgeObjectRelease();
  v18 = (_QWORD *)(v15 + v12 + *(int *)(v10 + 48));
  sub_235CA3828();
  v19 = objc_msgSend(a1, sel_description);
  sub_235CA37EC();

  sub_235CA3828();
  swift_bridgeObjectRelease();
  sub_235CA3828();
  v20 = v53;
  *v18 = v52;
  v18[1] = v20;
  v21 = (_QWORD *)(v15 + 2 * v12 + *(int *)(v10 + 48));
  sub_235CA3504();
  *v21 = 0xD000000000000025;
  v21[1] = 0x8000000235CA5130;
  v41 = v12;
  v22 = (_QWORD *)(v15 + 3 * v12 + *(int *)(v10 + 48));
  sub_235CA34D4();
  v52 = 0;
  v53 = 0xE000000000000000;
  sub_235CA3828();
  v23 = v43;
  swift_bridgeObjectRetain();
  sub_235CA3828();
  swift_bridgeObjectRelease();
  sub_235CA3828();
  v24 = v53;
  *v22 = v52;
  v22[1] = v24;
  v25 = 4 * v12;
  v26 = (_QWORD *)(v15 + 4 * v12 + *(int *)(v10 + 48));
  sub_235CA3534();
  v52 = 0;
  v53 = 0xE000000000000000;
  sub_235CA3828();
  v27 = v23 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_sessionId;
  v29 = v45;
  v28 = v46;
  v30 = v44;
  (*(void (**)(char *, uint64_t, uint64_t))(v46 + 16))(v44, v27, v45);
  sub_235C69C18((unint64_t *)&unk_254299040, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
  sub_235CA3B64();
  sub_235CA3828();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v28 + 8))(v30, v29);
  sub_235CA3828();
  v31 = v53;
  *v26 = v52;
  v26[1] = v31;
  v32 = v41;
  sub_235CA3528();
  v52 = 0;
  v53 = 0xE000000000000000;
  sub_235CA3828();
  v33 = (_QWORD *)(v15 + v25 + v32 + *(int *)(v10 + 48));
  swift_bridgeObjectRetain();
  sub_235CA3828();
  swift_bridgeObjectRelease();
  sub_235CA3828();
  v34 = v53;
  *v33 = v52;
  v33[1] = v34;
  v35 = (_QWORD *)(v15 + 6 * v32 + *(int *)(v10 + 48));
  sub_235CA351C();
  v52 = 0;
  v53 = 0xE000000000000000;
  sub_235CA3828();
  v51 = objc_msgSend(v42, sel_code);
  sub_235CA3B64();
  sub_235CA3828();
  swift_bridgeObjectRelease();
  sub_235CA3828();
  v36 = v53;
  *v35 = v52;
  v35[1] = v36;
  sub_235CA34E0();
  v52 = 0;
  v53 = 0xE000000000000000;
  sub_235CA3828();
  if ((v49 & 1) == 0)
  {
    v51 = v40;
    sub_235C7152C();
    sub_235CA3A2C();
  }
  v37 = (_QWORD *)(v15 - v32 + 8 * v32 + *(int *)(v10 + 48));
  sub_235CA3828();
  swift_bridgeObjectRelease();
  sub_235CA3828();
  v38 = v53;
  *v37 = v52;
  v37[1] = v38;
  return v50;
}

id sub_235C684CC(id result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  void *v8;
  void *v9;
  void *v10;

  if (result)
  {
    v8 = result;
    v9 = (void *)sub_235CA37E0();
    objc_msgSend(v8, sel_setTcuId_, v9);

    v10 = (void *)sub_235CA37E0();
    objc_msgSend(v8, sel_setRequestId_, v10);

    result = objc_msgSend(v8, sel_setSpeechPackage_, a5);
    if ((*(_BYTE *)(a6 + 8) & 1) == 0)
      return objc_msgSend(v8, sel_setSpeechEvent_, *(_QWORD *)a6);
  }
  return result;
}

void sub_235C685A4(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;

  if (a1)
  {
    v7 = (void *)sub_235CA37E0();
    objc_msgSend(a1, sel_setTrpCandidateId_, v7);

    v8 = (void *)sub_235CA37E0();
    objc_msgSend(a1, sel_setRequestId_, v8);

    __swift_instantiateConcreteTypeFromMangledName(&qword_254299498);
    v9 = swift_allocObject();
    *(_OWORD *)(v9 + 16) = xmmword_235CA4430;
    *(_QWORD *)(v9 + 32) = a5;
    sub_235CA38D0();
    sub_235C71624(0, &qword_2542993B8);
    v10 = a5;
    v11 = (id)sub_235CA38AC();
    swift_bridgeObjectRelease();
    objc_msgSend(a1, sel_setTcuList_, v11);

  }
}

void sub_235C686C4(void *a1)
{
  void *v2;
  id v3;

  if (a1)
  {
    v2 = (void *)sub_235CA37E0();
    objc_msgSend(a1, sel_setLastTRPCandidateId_, v2);

    v3 = (id)sub_235CA37E0();
    objc_msgSend(a1, sel_setRequestId_, v3);

  }
}

void sub_235C68758(int a1, int a2, id a3)
{
  uint64_t v3;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  os_log_type_t v15;
  uint8_t *v16;
  NSObject *oslog;
  _QWORD aBlock[6];

  v5 = objc_msgSend(a3, sel_description);
  sub_235CA37EC();

  v6 = objc_allocWithZone(MEMORY[0x24BE811A8]);
  v7 = (void *)sub_235CA37E0();
  swift_bridgeObjectRelease();
  v8 = objc_msgSend(v6, sel_initWithReason_, v7);

  if (v8)
  {
    objc_msgSend(v8, sel_setErrorCode_, objc_msgSend(a3, sel_code));
    v9 = v8;
    v10 = (void *)sub_235CA37E0();
    objc_msgSend(v9, sel_setRefId_, v10);

    v11 = *(void **)(v3 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_serviceHelper);
    aBlock[4] = sub_235C689B4;
    aBlock[5] = 0;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_235C8101C;
    aBlock[3] = &block_descriptor_38;
    v12 = _Block_copy(aBlock);
    v13 = v9;
    objc_msgSend(v11, sel_handleCommand_completion_, v13, v12);
    _Block_release(v12);

  }
  else
  {
    if (qword_2542992E8 != -1)
      swift_once();
    v14 = sub_235CA3708();
    __swift_project_value_buffer(v14, (uint64_t)qword_254299660);
    oslog = sub_235CA36FC();
    v15 = sub_235CA3930();
    if (os_log_type_enabled(oslog, v15))
    {
      v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_235C5E000, oslog, v15, "Could not create CommandFailed to fail the request, request will likely timeout", v16, 2u);
      MEMORY[0x23B7DE144](v16, -1, -1);
    }

  }
}

void sub_235C689B4(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  id v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  NSObject *oslog;
  uint64_t v12;

  if (qword_2542992E8 != -1)
    swift_once();
  v3 = sub_235CA3708();
  __swift_project_value_buffer(v3, (uint64_t)qword_254299660);
  v4 = a2;
  v5 = a2;
  oslog = sub_235CA36FC();
  v6 = sub_235CA3930();
  if (os_log_type_enabled(oslog, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = swift_slowAlloc();
    v12 = v8;
    *(_DWORD *)v7 = 136315138;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2542994A8);
    v9 = sub_235CA39FC();
    sub_235C944B8(v9, v10, &v12);
    sub_235CA3A14();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_235C5E000, oslog, v6, "Sent CommandFailed to fail the request with error %s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B7DE144](v8, -1, -1);
    MEMORY[0x23B7DE144](v7, -1, -1);

  }
  else
  {

  }
}

uint64_t sub_235C68B84()
{
  _QWORD *p_aBlock;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  void *v27;
  id v28;
  _QWORD *v29;
  uint64_t *v30;
  _QWORD *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char isUniquelyReferenced_nonNull_native;
  char v38;
  unint64_t v39;
  uint64_t v40;
  _BOOL8 v41;
  uint64_t v42;
  char v43;
  unint64_t v44;
  char v45;
  uint64_t *v46;
  uint64_t v47;
  BOOL v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD *v51;
  NSObject *v52;
  os_log_type_t v53;
  uint8_t *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  NSObject *v62;
  os_log_type_t v63;
  uint8_t *v64;
  uint64_t v65;
  id v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  _QWORD *v70;
  uint64_t v71;
  void *v72;
  uint64_t result;
  _QWORD *v74;
  uint64_t v75;
  uint64_t v76;
  _QWORD *aBlock;
  uint64_t v78;
  uint64_t (*v79)();
  void *v80;
  uint64_t (*v81)();
  uint64_t v82;

  if (*((_BYTE *)p_aBlock + OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_isRMVEnabled) != 1)
  {
    if (AFIsATV() && (sub_235CA36A8(), v19 = v18, swift_bridgeObjectRelease(), !v19))
    {
      v57 = sub_235CA36B4();
      if (v58)
      {
        v59 = v57;
        v60 = v58;
        if (qword_2542992E8 != -1)
          swift_once();
        v61 = sub_235CA3708();
        __swift_project_value_buffer(v61, (uint64_t)qword_254299660);
        v62 = sub_235CA36FC();
        v63 = sub_235CA393C();
        if (os_log_type_enabled(v62, v63))
        {
          v64 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v64 = 0;
          _os_log_impl(&dword_235C5E000, v62, v63, "Generating default user voice ID score card", v64, 2u);
          MEMORY[0x23B7DE144](v64, -1, -1);
        }

        v65 = swift_allocObject();
        *(_QWORD *)(v65 + 16) = v59;
        *(_QWORD *)(v65 + 24) = v60;
        v66 = objc_allocWithZone(MEMORY[0x24BE09398]);
        v67 = swift_allocObject();
        *(_QWORD *)(v67 + 16) = sub_235C69CAC;
        *(_QWORD *)(v67 + 24) = v65;
        v81 = sub_235C71760;
        v82 = v67;
        aBlock = (_QWORD *)MEMORY[0x24BDAC760];
        v78 = 1107296256;
        v68 = &block_descriptor_25;
LABEL_64:
        v79 = sub_235C69A78;
        v80 = v68;
        v72 = _Block_copy(&aBlock);
        swift_release();
        v28 = objc_msgSend(v66, sel_initWithBuilder_, v72);
        _Block_release(v72);
        goto LABEL_65;
      }
      if (qword_2542992E8 != -1)
        swift_once();
      v69 = sub_235CA3708();
      __swift_project_value_buffer(v69, (uint64_t)qword_254299660);
      v51 = p_aBlock;
      v52 = sub_235CA36FC();
      v53 = sub_235CA3930();
      if (os_log_type_enabled(v52, v53))
      {
        v54 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)v54 = 67109120;
        LODWORD(aBlock) = 0;
        goto LABEL_39;
      }
    }
    else
    {
      v20 = sub_235CA36A8();
      if (v21)
      {
        v22 = v20;
        v23 = v21;
        v24 = swift_allocObject();
        *(_QWORD *)(v24 + 16) = v22;
        *(_QWORD *)(v24 + 24) = v23;
        v25 = objc_allocWithZone(MEMORY[0x24BE09398]);
        v26 = swift_allocObject();
        *(_QWORD *)(v26 + 16) = sub_235C69C58;
        *(_QWORD *)(v26 + 24) = v24;
        v81 = sub_235C71760;
        v82 = v26;
        aBlock = (_QWORD *)MEMORY[0x24BDAC760];
        v78 = 1107296256;
        v79 = sub_235C69A78;
        v80 = &block_descriptor_15;
        v27 = _Block_copy(&aBlock);
        swift_release();
        v28 = objc_msgSend(v25, sel_initWithBuilder_, v27);
        _Block_release(v27);
LABEL_65:
        swift_release();
        return (uint64_t)v28;
      }
      if (qword_2542992E8 != -1)
        swift_once();
      v56 = sub_235CA3708();
      __swift_project_value_buffer(v56, (uint64_t)qword_254299660);
      v51 = p_aBlock;
      v52 = sub_235CA36FC();
      v53 = sub_235CA3930();
      if (os_log_type_enabled(v52, v53))
      {
        v54 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)v54 = 67109120;
        LODWORD(aBlock) = 0;
        sub_235CA3A14();

        v55 = "Primary user is missing from homemebers list when RMV=%{BOOL}d";
        goto LABEL_44;
      }
    }
LABEL_55:

    return 0;
  }
  v1 = *(_QWORD *)((char *)p_aBlock + OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_homeMembers);
  v2 = sub_235CA36B4();
  if (v3)
  {
    v75 = v3;
    v76 = v2;
    if (v1 >> 62)
      goto LABEL_60;
    v4 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (!v4)
    {
LABEL_61:
      swift_bridgeObjectRelease();
      v29 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v1 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
      if (v1)
        goto LABEL_21;
LABEL_62:
      v31 = (_QWORD *)MEMORY[0x24BEE4B00];
LABEL_63:
      swift_bridgeObjectRelease();
      v70 = (_QWORD *)swift_allocObject();
      v70[2] = v31;
      v70[3] = v76;
      v70[4] = v75;
      v66 = objc_allocWithZone(MEMORY[0x24BE09398]);
      v71 = swift_allocObject();
      *(_QWORD *)(v71 + 16) = sub_235C69F28;
      *(_QWORD *)(v71 + 24) = v70;
      v81 = sub_235C71760;
      v82 = v71;
      aBlock = (_QWORD *)MEMORY[0x24BDAC760];
      v78 = 1107296256;
      v68 = &block_descriptor_35;
      goto LABEL_64;
    }
LABEL_5:
    aBlock = (_QWORD *)MEMORY[0x24BEE4AF8];
    p_aBlock = &aBlock;
    sub_235C69EE0(0, v4 & ~(v4 >> 63), 0);
    if ((v4 & 0x8000000000000000) == 0)
    {
      v5 = 0;
      v6 = aBlock;
      do
      {
        if (v4 == v5)
        {
          __break(1u);
LABEL_58:
          __break(1u);
LABEL_59:
          __break(1u);
LABEL_60:
          swift_bridgeObjectRetain();
          v4 = sub_235CA3AF8();
          if (!v4)
            goto LABEL_61;
          goto LABEL_5;
        }
        v7 = v6;
        if ((v1 & 0xC000000000000001) != 0)
          v8 = (id)MEMORY[0x23B7DDB44](v5, v1);
        else
          v8 = *(id *)(v1 + 8 * v5 + 32);
        v9 = v8;
        v10 = objc_msgSend(v8, sel_sharedUserId, v74);
        if (!v10)
        {
          __break(1u);
LABEL_70:
          result = sub_235CA3B94();
          __break(1u);
          return result;
        }
        v11 = v10;
        v12 = sub_235CA37EC();
        v14 = v13;

        v6 = v7;
        aBlock = v7;
        v15 = v7[2];
        v16 = v6[3];
        if (v15 >= v16 >> 1)
        {
          sub_235C69EE0(v16 > 1, v15 + 1, 1);
          v6 = aBlock;
        }
        ++v5;
        v6[2] = v15 + 1;
        v17 = &v6[2 * v15];
        v17[4] = v12;
        v17[5] = v14;
      }
      while (v4 != v5);
      v29 = v6;
      swift_bridgeObjectRelease();
      v1 = v29[2];
      if (v1)
      {
LABEL_21:
        sub_235C71624(0, (unint64_t *)&unk_254299400);
        swift_bridgeObjectRetain();
        v74 = v29;
        v30 = v29 + 5;
        v31 = (_QWORD *)MEMORY[0x24BEE4B00];
        while (1)
        {
          v35 = *(v30 - 1);
          v34 = *v30;
          swift_bridgeObjectRetain_n();
          v36 = sub_235CA39D8();
          isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          aBlock = v31;
          v39 = sub_235C9BACC(v35, v34);
          v40 = v31[2];
          v41 = (v38 & 1) == 0;
          v42 = v40 + v41;
          if (__OFADD__(v40, v41))
            goto LABEL_58;
          v43 = v38;
          if (v31[3] >= v42)
          {
            if ((isUniquelyReferenced_nonNull_native & 1) != 0)
            {
              v31 = aBlock;
              if ((v38 & 1) == 0)
                goto LABEL_31;
            }
            else
            {
              sub_235C9E4F8();
              v31 = aBlock;
              if ((v43 & 1) == 0)
                goto LABEL_31;
            }
          }
          else
          {
            sub_235C9BFE8(v42, isUniquelyReferenced_nonNull_native);
            v44 = sub_235C9BACC(v35, v34);
            if ((v43 & 1) != (v45 & 1))
              goto LABEL_70;
            v39 = v44;
            v31 = aBlock;
            if ((v43 & 1) == 0)
            {
LABEL_31:
              v31[(v39 >> 6) + 8] |= 1 << v39;
              v46 = (uint64_t *)(v31[6] + 16 * v39);
              *v46 = v35;
              v46[1] = v34;
              *(_QWORD *)(v31[7] + 8 * v39) = v36;
              v47 = v31[2];
              v48 = __OFADD__(v47, 1);
              v49 = v47 + 1;
              if (v48)
                goto LABEL_59;
              v31[2] = v49;
              swift_bridgeObjectRetain();
              goto LABEL_23;
            }
          }
          v32 = v31[7];
          v33 = *(void **)(v32 + 8 * v39);
          *(_QWORD *)(v32 + 8 * v39) = v36;

LABEL_23:
          v30 += 2;
          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease();
          if (!--v1)
          {
            swift_bridgeObjectRelease();
            goto LABEL_63;
          }
        }
      }
      goto LABEL_62;
    }
    __break(1u);
  }
  else if (qword_2542992E8 == -1)
  {
    goto LABEL_37;
  }
  swift_once();
LABEL_37:
  v50 = sub_235CA3708();
  __swift_project_value_buffer(v50, (uint64_t)qword_254299660);
  v51 = p_aBlock;
  v52 = sub_235CA36FC();
  v53 = sub_235CA3930();
  if (!os_log_type_enabled(v52, v53))
    goto LABEL_55;
  v54 = (uint8_t *)swift_slowAlloc();
  *(_DWORD *)v54 = 67109120;
  LODWORD(aBlock) = 1;
LABEL_39:
  sub_235CA3A14();

  v55 = "Unknown user missing from homemebers list when RMV=%{BOOL}d";
LABEL_44:
  _os_log_impl(&dword_235C5E000, v52, v53, v55, v54, 8u);
  MEMORY[0x23B7DE144](v54, -1, -1);

  return 0;
}

id sub_235C69474(id result)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (result)
  {
    v1 = result;
    sub_235C71624(0, (unint64_t *)&unk_254299400);
    v2 = (void *)sub_235CA39D8();
    objc_msgSend(v1, sel_setSpIdAudioProcessedDuration_, v2);

    v3 = (void *)sub_235CA39D8();
    objc_msgSend(v1, sel_setSpIdUnknownUserScore_, v3);

    v4 = (void *)sub_235CA378C();
    objc_msgSend(v1, sel_setSpIdKnownUserScores_, v4);

    v5 = (void *)sub_235CA39D8();
    objc_msgSend(v1, sel_setSpIdUserScoresVersion_, v5);

    objc_msgSend(v1, sel_setSpIdScoreThresholdingType_, 0);
    objc_msgSend(v1, sel_setSpIdAssetVersion_, 0);
    v6 = (void *)sub_235CA37E0();
    objc_msgSend(v1, sel_setUserClassified_, v6);

    return objc_msgSend(v1, sel_setUserIdentityClassification_, 0);
  }
  return result;
}

id sub_235C695D4(id result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v8;
  void *v9;
  void *v10;
  uint64_t inited;
  void *v12;
  void *v13;
  void *v14;

  if (result)
  {
    v8 = result;
    sub_235C71624(0, (unint64_t *)&unk_254299400);
    v9 = (void *)sub_235CA39D8();
    objc_msgSend(v8, sel_setSpIdAudioProcessedDuration_, v9);

    v10 = (void *)sub_235CA39D8();
    objc_msgSend(v8, sel_setSpIdUnknownUserScore_, v10);

    __swift_instantiateConcreteTypeFromMangledName(&qword_254299480);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_235CA4440;
    *(_QWORD *)(inited + 32) = a2;
    *(_QWORD *)(inited + 40) = a3;
    swift_bridgeObjectRetain();
    *(_QWORD *)(inited + 48) = sub_235CA39D8();
    sub_235C8EC88(inited);
    v12 = (void *)sub_235CA378C();
    swift_bridgeObjectRelease();
    objc_msgSend(v8, sel_setSpIdKnownUserScores_, v12);

    v13 = (void *)sub_235CA39D8();
    objc_msgSend(v8, sel_setSpIdUserScoresVersion_, v13);

    objc_msgSend(v8, sel_setSpIdScoreThresholdingType_, 0);
    objc_msgSend(v8, sel_setSpIdAssetVersion_, 0);
    v14 = (void *)sub_235CA37E0();
    objc_msgSend(v8, sel_setUserClassified_, v14);

    return objc_msgSend(v8, sel_setUserIdentityClassification_, a5);
  }
  return result;
}

uint64_t sub_235C69794()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  __swift_destroy_boxed_opaque_existential_1(v0 + OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_myriadMonitor);
  v1 = v0 + OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_userId;
  v2 = sub_235CA3498();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);

  __swift_destroy_boxed_opaque_existential_1(v0 + OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_sessionState);
  __swift_destroy_boxed_opaque_existential_1(v0 + OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_immutableSessionState);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_release();
}

id sub_235C69860()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AssistantSpeechRecognizerResponseHandler();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_235C69964()
{
  return type metadata accessor for AssistantSpeechRecognizerResponseHandler();
}

uint64_t type metadata accessor for AssistantSpeechRecognizerResponseHandler()
{
  uint64_t result;

  result = qword_2542992D0;
  if (!qword_2542992D0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_235C699A8()
{
  uint64_t result;
  unint64_t v1;

  result = sub_235CA3498();
  if (v1 <= 0x3F)
    return swift_updateClassMetadata2();
  return result;
}

uint64_t sub_235C69A7C(uint64_t a1, uint64_t a2)
{
  void (*v3)(uint64_t);

  v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_unknownObjectRetain();
  v3(a2);
  return swift_unknownObjectRelease();
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

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_235C69B08()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_235C69B34()
{
  uint64_t v0;

  sub_235C6065C(*(void **)(v0 + 16), *(void **)(v0 + 24), *(_QWORD *)(v0 + 32));
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B7DE078]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_235C69B80()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254299360;
  if (!qword_254299360)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_254299350);
    result = MEMORY[0x23B7DE090](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_254299360);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B7DE084](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_235C69C10()
{
  uint64_t v0;

  return sub_235C60AE8(*(_QWORD *)(v0 + 16));
}

uint64_t sub_235C69C18(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x23B7DE090](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

id sub_235C69C58(void *a1)
{
  uint64_t v1;

  return sub_235C695D4(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), 100, 4);
}

uint64_t sub_235C69C78()
{
  return swift_deallocObject();
}

uint64_t sub_235C69C88()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

id sub_235C69CAC(void *a1)
{
  uint64_t v1;

  return sub_235C695D4(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), 0, 0);
}

uint64_t sub_235C69CCC()
{
  return swift_deallocObject();
}

_QWORD *sub_235C69CDC(uint64_t a1)
{
  _QWORD *result;
  _QWORD *v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  char *v11;
  unint64_t v12;
  unint64_t i;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  _QWORD *v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  int64_t v25;
  uint64_t v26;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2563772B8);
  result = (_QWORD *)sub_235CA3B04();
  v3 = result;
  v4 = 0;
  v26 = a1;
  v7 = *(_QWORD *)(a1 + 64);
  v6 = a1 + 64;
  v5 = v7;
  v8 = 1 << *(_BYTE *)(v6 - 32);
  v9 = -1;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  v10 = v9 & v5;
  v25 = (unint64_t)(v8 + 63) >> 6;
  v11 = (char *)(result + 8);
  if ((v9 & v5) == 0)
    goto LABEL_5;
LABEL_4:
  v12 = __clz(__rbit64(v10));
  v10 &= v10 - 1;
  for (i = v12 | (v4 << 6); ; i = __clz(__rbit64(v15)) + (v4 << 6))
  {
    v17 = (uint64_t *)(*(_QWORD *)(v26 + 48) + 16 * i);
    v19 = *v17;
    v18 = v17[1];
    v20 = *(void **)(*(_QWORD *)(v26 + 56) + 8 * i);
    swift_bridgeObjectRetain();
    result = objc_msgSend(v20, sel_integerValue);
    *(_QWORD *)&v11[(i >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << i;
    v21 = (_QWORD *)(v3[6] + 16 * i);
    *v21 = v19;
    v21[1] = v18;
    *(_QWORD *)(v3[7] + 8 * i) = result;
    v22 = v3[2];
    v23 = __OFADD__(v22, 1);
    v24 = v22 + 1;
    if (v23)
    {
      __break(1u);
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    v3[2] = v24;
    if (v10)
      goto LABEL_4;
LABEL_5:
    v14 = v4 + 1;
    if (__OFADD__(v4, 1))
      goto LABEL_24;
    if (v14 >= v25)
      return v3;
    v15 = *(_QWORD *)(v6 + 8 * v14);
    ++v4;
    if (!v15)
    {
      v4 = v14 + 1;
      if (v14 + 1 >= v25)
        return v3;
      v15 = *(_QWORD *)(v6 + 8 * v4);
      if (!v15)
      {
        v4 = v14 + 2;
        if (v14 + 2 >= v25)
          return v3;
        v15 = *(_QWORD *)(v6 + 8 * v4);
        if (!v15)
          break;
      }
    }
LABEL_18:
    v10 = (v15 - 1) & v15;
  }
  v16 = v14 + 3;
  if (v16 >= v25)
    return v3;
  v15 = *(_QWORD *)(v6 + 8 * v16);
  if (v15)
  {
    v4 = v16;
    goto LABEL_18;
  }
  while (1)
  {
    v4 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v4 >= v25)
      return v3;
    v15 = *(_QWORD *)(v6 + 8 * v4);
    ++v16;
    if (v15)
      goto LABEL_18;
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_235C69EE0(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_235C69F44(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_235C69EFC()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

id sub_235C69F28(id result)
{
  return sub_235C69474(result);
}

uint64_t sub_235C69F34()
{
  return swift_deallocObject();
}

uint64_t sub_235C69F44(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_254299478);
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
  result = sub_235CA3B28();
  __break(1u);
  return result;
}

uint64_t sub_235C6A0B0()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_235C6A0D8(uint64_t a1)
{
  return sub_235C711C8(a1, (uint64_t (*)(uint64_t, unint64_t, _QWORD, _QWORD))sub_235C66248);
}

uint64_t sub_235C6A0E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  char *v5;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  _QWORD *v17;
  void *v18;
  char *v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD aBlock[6];

  v11 = sub_235CA3738();
  v23 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8]();
  v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = sub_235CA375C();
  v14 = *(_QWORD *)(v22 - 8);
  MEMORY[0x24BDAC7A8]();
  v16 = (char *)&v21 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = *(_QWORD *)&v5[OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_requestQueue];
  v17 = (_QWORD *)swift_allocObject();
  v17[2] = a1;
  v17[3] = a2;
  v17[4] = v5;
  v17[5] = a3;
  v17[6] = a4;
  v17[7] = a5;
  aBlock[4] = sub_235C7160C;
  aBlock[5] = v17;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_235C9F468;
  aBlock[3] = &block_descriptor_147;
  v18 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  v19 = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_235CA3744();
  v24 = MEMORY[0x24BEE4AF8];
  sub_235C69C18(&qword_2542990D0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254299350);
  sub_235C69B80();
  sub_235CA3A38();
  MEMORY[0x23B7DDA18](0, v16, v13, v18);
  _Block_release(v18);
  (*(void (**)(char *, uint64_t))(v23 + 8))(v13, v11);
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v22);
  return swift_release();
}

void sub_235C6A2F0(uint64_t a1, unint64_t a2)
{
  char *v2;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  unint64_t v9;
  uint64_t v10;
  BOOL v11;
  char *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  if (qword_2542992E8 != -1)
    swift_once();
  v5 = sub_235CA3708();
  __swift_project_value_buffer(v5, (uint64_t)qword_254299660);
  v6 = sub_235CA36FC();
  v7 = sub_235CA3924();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_235C5E000, v6, v7, "Received final result", v8, 2u);
    MEMORY[0x23B7DE144](v8, -1, -1);
  }

  v10 = *(_QWORD *)&v2[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId];
  v9 = *(_QWORD *)&v2[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId + 8];
  v11 = v10 == a1 && v9 == a2;
  if (!v11 && (sub_235CA3B88() & 1) == 0)
  {
    swift_bridgeObjectRetain_n();
    v12 = v2;
    v13 = sub_235CA36FC();
    v14 = sub_235CA3930();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = swift_slowAlloc();
      v16 = swift_slowAlloc();
      v17 = v16;
      *(_DWORD *)v15 = 136315394;
      swift_bridgeObjectRetain();
      sub_235C944B8(a1, a2, &v17);
      sub_235CA3A14();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v15 + 12) = 2080;
      swift_bridgeObjectRetain();
      sub_235C944B8(v10, v9, &v17);
      sub_235CA3A14();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_235C5E000, v13, v14, "Response requestId = %s does not match current requestId = %s", (uint8_t *)v15, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x23B7DE144](v16, -1, -1);
      MEMORY[0x23B7DE144](v15, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

void sub_235C6A59C(void *a1)
{
  _BYTE *v1;
  _BYTE *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  id v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  char v20;
  uint64_t v21;
  os_log_type_t v22;
  uint8_t *v23;
  const char *v24;
  int v25;
  id v26;
  uint64_t v27;
  _BYTE *v28;
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  uint64_t v32;
  os_log_t v33;
  const char *v34;
  id v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  _BYTE *v39;
  id v40;
  os_log_t v41;
  uint64_t v42;
  os_log_t v43;
  uint64_t v44;
  uint64_t v45;

  v2 = v1;
  v4 = sub_235CA3564();
  v5 = *(_QWORD *)(v4 - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v7 = (char *)&v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2542992E8 != -1)
    swift_once();
  v8 = sub_235CA3708();
  __swift_project_value_buffer(v8, (uint64_t)qword_254299660);
  v9 = sub_235CA36FC();
  v10 = sub_235CA3924();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_235C5E000, v9, v10, "Received TRPDetected.", v11, 2u);
    MEMORY[0x23B7DE144](v11, -1, -1);
  }

  if (v2[OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_isMedocEnabled] != 1)
  {
    v43 = (os_log_t)sub_235CA36FC();
    v22 = sub_235CA3930();
    if (os_log_type_enabled(v43, v22))
    {
      v23 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v23 = 0;
      v24 = "Received TRPDetected from CoreSpeech when Medoc is not enabled.";
      goto LABEL_16;
    }
LABEL_17:

    return;
  }
  v12 = objc_msgSend(a1, sel_requestId);
  if (!v12)
  {
LABEL_12:
    v43 = (os_log_t)sub_235CA36FC();
    v22 = sub_235CA3924();
    if (os_log_type_enabled(v43, v22))
    {
      v23 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v23 = 0;
      v24 = "TRPDetected requestId does not match current requestId";
LABEL_16:
      _os_log_impl(&dword_235C5E000, v43, v22, v24, v23, 2u);
      MEMORY[0x23B7DE144](v23, -1, -1);
      goto LABEL_17;
    }
    goto LABEL_17;
  }
  v13 = v12;
  v14 = sub_235CA37EC();
  v16 = v15;

  v18 = *(_QWORD *)&v2[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId];
  v17 = *(NSObject **)&v2[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId + 8];
  if (v14 == v18 && v16 == v17)
  {
    v21 = swift_bridgeObjectRelease();
  }
  else
  {
    v20 = sub_235CA3B88();
    v21 = swift_bridgeObjectRelease();
    if ((v20 & 1) == 0)
      goto LABEL_12;
  }
  v43 = v17;
  MEMORY[0x24BDAC7A8](v21);
  *(&v42 - 2) = (uint64_t)v2;
  *(&v42 - 1) = (uint64_t)a1;
  if (v25 == 1)
  {
    v26 = objc_allocWithZone((Class)sub_235CA30F0());
    v27 = sub_235CA2CDC();
    if (!v27)
    {
      v28 = v2;
      v29 = sub_235CA36FC();
      v30 = sub_235CA3930();
      if (os_log_type_enabled(v29, v30))
      {
        v31 = (uint8_t *)swift_slowAlloc();
        v32 = swift_slowAlloc();
        v45 = v32;
        *(_DWORD *)v31 = 136315138;
        v33 = v43;
        swift_bridgeObjectRetain();
        v44 = sub_235C944B8(v18, (unint64_t)v33, &v45);
        sub_235CA3A14();

        swift_bridgeObjectRelease();
        v34 = "Failed to create MultiUserSpeechStopDetectedMessage for request: %s";
LABEL_29:
        _os_log_impl(&dword_235C5E000, v29, v30, v34, v31, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x23B7DE144](v32, -1, -1);
        MEMORY[0x23B7DE144](v31, -1, -1);

        return;
      }
LABEL_30:

      return;
    }
  }
  else
  {
    v35 = objc_allocWithZone((Class)sub_235CA2D24());
    v27 = sub_235CA2CDC();
    if (!v27)
    {
      v28 = v2;
      v29 = sub_235CA36FC();
      v30 = sub_235CA3930();
      if (os_log_type_enabled(v29, v30))
      {
        v31 = (uint8_t *)swift_slowAlloc();
        v32 = swift_slowAlloc();
        v45 = v32;
        *(_DWORD *)v31 = 136315138;
        v41 = v43;
        swift_bridgeObjectRetain();
        v44 = sub_235C944B8(v18, (unint64_t)v41, &v45);
        sub_235CA3A14();

        swift_bridgeObjectRelease();
        v34 = "Failed to create SpeechStopDetectedMessage for request: %s";
        goto LABEL_29;
      }
      goto LABEL_30;
    }
  }
  v36 = (void *)v27;
  __swift_project_boxed_opaque_existential_1(&v2[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_messagePublisher], *(_QWORD *)&v2[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_messagePublisher + 24]);
  sub_235CA33B4();

  if (qword_2542989C0 != -1)
    swift_once();
  v37 = __swift_project_value_buffer(v4, (uint64_t)qword_254299648);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v37, v4);
  v38 = swift_allocObject();
  *(_QWORD *)(v38 + 16) = v2;
  *(_QWORD *)(v38 + 24) = a1;
  v39 = v2;
  v40 = a1;
  sub_235CA3540();
  swift_release();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

void sub_235C6AB80(void *a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  _QWORD *isa;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  SEL *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  __int128 *v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  _BOOL4 v18;
  uint8_t *v19;
  uint64_t v20;
  id v21;
  void *v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  void (*v26)(NSObject *, NSObject *);
  id v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  NSObject *v33;
  os_log_type_t v34;
  uint8_t *v35;
  uint8_t *v36;
  char v37;
  id v38;
  void *v39;
  id v40;
  os_log_type_t v41;
  _BOOL4 v42;
  SEL *v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  void *v48;
  uint64_t v49;
  unint64_t v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  _QWORD *v55;
  os_log_type_t v56;
  uint64_t v57;
  uint64_t v58;
  id v59;
  void *v60;
  uint64_t v61;
  unint64_t v62;
  unint64_t v63;
  uint64_t v64;
  unint64_t v65;
  _QWORD *v66;
  os_log_type_t v67;
  uint8_t *v68;
  uint64_t v69;
  unint64_t v70;
  __int128 v71;
  id v72;
  void *v73;
  id v75;
  void *v76;
  NSObject *v77;
  NSObject *v78;
  NSObject *v79;
  NSObject *v80;
  id v81;
  void *v82;
  unint64_t v83;
  uint64_t v84;
  uint64_t v85;
  _OWORD *v86;
  __int128 v87;
  __int128 v88;
  id v89;
  void *v90;
  id v91;
  _QWORD *v92;
  unint64_t v93;
  unint64_t v94;
  id v95;
  _QWORD *v96;
  unint64_t v97;
  unint64_t v98;
  _OWORD *v99;
  __int128 v100;
  __int128 v101;
  os_log_type_t v102;
  void *v103;
  uint64_t v104;
  uint64_t v105;
  unint64_t v106;
  uint64_t v107;
  os_log_type_t v108;
  uint64_t v109;
  uint64_t v110;
  unint64_t v111;
  unint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  NSObject *v116;
  id v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  unint64_t v122;
  char isUniquelyReferenced_nonNull_native;
  _QWORD *v124;
  NSObject *v125;
  os_log_type_t v126;
  uint8_t *v127;
  uint64_t v128;
  unint64_t v129;
  uint64_t v130;
  NSObject *v131;
  id v132;
  uint64_t v133;
  void *v134;
  NSObject *v135;
  os_log_type_t v136;
  uint8_t *v137;
  _QWORD *v138;
  NSObject *v139;
  os_log_type_t v140;
  uint8_t *v141;
  uint64_t v142;
  unint64_t v143;
  uint64_t v144;
  NSObject *v145;
  __int128 v146;
  uint64_t v147;
  __int128 v148;
  uint64_t v149;
  uint64_t v150;
  unint64_t v151;
  uint64_t v152;
  NSObject *v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  void *v157;
  NSObject *v158;
  unint64_t v159;
  SEL *v160;
  uint64_t v161;
  _QWORD *v162;
  uint64_t v163;
  NSObject *v164;
  __int128 *v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  _QWORD v170[4];
  _QWORD *v171;
  unint64_t v172;

  v156 = sub_235CA3498();
  v155 = *(_QWORD *)(v156 - 8);
  MEMORY[0x24BDAC7A8](v156);
  v3 = ((char *)&v144 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  v4 = sub_235CA3708();
  isa = v4[-1].isa;
  v6 = MEMORY[0x24BDAC7A8](v4);
  v163 = (uint64_t)&v144 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (SEL *)((char *)&v144 - v9);
  MEMORY[0x24BDAC7A8](v8);
  v12 = ((char *)&v144 - v11);
  if (qword_2542992E8 != -1)
LABEL_77:
    swift_once();
  v13 = __swift_project_value_buffer((uint64_t)v4, (uint64_t)qword_254299660);
  v14 = (__int128 *)isa[2];
  v161 = v13;
  ((void (*))v14)(v12);
  v15 = a1;
  v16 = sub_235CA36FC();
  v17 = sub_235CA3924();
  v18 = os_log_type_enabled(v16, (os_log_type_t)v17);
  v158 = v3;
  v165 = v14;
  if (v18)
  {
    v159 = (unint64_t)isa;
    v160 = v10;
    v164 = v4;
    v19 = (uint8_t *)swift_slowAlloc();
    v20 = swift_slowAlloc();
    *(_QWORD *)&v166 = v20;
    *(_DWORD *)v19 = 136315138;
    v21 = objc_msgSend(v15, sel_multiUserTrpCandidateId);
    isa = v15;
    if (!v21)
    {
LABEL_94:

      __break(1u);
LABEL_95:

      __break(1u);
      goto LABEL_96;
    }
    v22 = v21;
    v23 = sub_235CA37EC();
    v25 = v24;

    v170[0] = sub_235C944B8(v23, v25, (uint64_t *)&v166);
    sub_235CA3A14();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_235C5E000, v16, (os_log_type_t)v17, "Received MultiUserTRPCandidate with top level trpId: %s.", v19, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B7DE144](v20, -1, -1);
    MEMORY[0x23B7DE144](v19, -1, -1);

    v26 = *(void (**)(NSObject *, NSObject *))(v159 + 8);
    v4 = v164;
    v26(v12, v164);
    v10 = v160;
    v15 = isa;
  }
  else
  {

    v26 = (void (*)(NSObject *, NSObject *))isa[1];
    v26(v12, v4);
  }
  isa = v162;
  if (*((_BYTE *)v162 + OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_isMUXEnabled) != 1)
  {
    v33 = sub_235CA36FC();
    v34 = sub_235CA3930();
    if (!os_log_type_enabled(v33, v34))
    {
LABEL_14:

      return;
    }
    v35 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v35 = 0;
    _os_log_impl(&dword_235C5E000, v33, v34, "MultiUserTRPCandidate received from ASR but Multi User is NOT enabled. Will ignore this message.", v35, 2u);
    v36 = v35;
LABEL_13:
    MEMORY[0x23B7DE144](v36, -1, -1);
    goto LABEL_14;
  }
  v27 = objc_msgSend(v15, sel_requestId);
  if (!v27)
    goto LABEL_22;
  v28 = v27;
  v29 = sub_235CA37EC();
  v31 = v30;

  v32 = *(_QWORD *)((char *)isa + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId + 8);
  v152 = *(_QWORD *)((char *)isa + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId);
  if (v29 == v152 && v31 == v32)
  {
    swift_bridgeObjectRelease();
    goto LABEL_16;
  }
  v37 = sub_235CA3B88();
  swift_bridgeObjectRelease();
  if ((v37 & 1) == 0)
  {
LABEL_22:
    v53 = v163;
    ((void (*)(uint64_t, uint64_t, NSObject *))v165)(v163, v161, v4);
    v54 = v15;
    v55 = isa;
    v17 = (uint64_t)v54;
    v16 = v55;
    v3 = sub_235CA36FC();
    v56 = sub_235CA3924();
    if (!os_log_type_enabled(v3, v56))
    {

      v26(v53, v4);
      return;
    }
    v164 = v4;
    v165 = (__int128 *)v26;
    v57 = swift_slowAlloc();
    v58 = swift_slowAlloc();
    *(_QWORD *)&v166 = v58;
    *(_DWORD *)v57 = 136315394;
    v59 = objc_msgSend((id)v17, sel_requestId);
    if (v59)
    {
      v60 = v59;
      v61 = sub_235CA37EC();
      v63 = v62;

      v170[0] = sub_235C944B8(v61, v63, (uint64_t *)&v166);
      sub_235CA3A14();

      swift_bridgeObjectRelease();
      *(_WORD *)(v57 + 12) = 2080;
      v64 = *(uint64_t *)((char *)&v16->isa + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId);
      v65 = *(unint64_t *)((char *)&v16[1].isa
                                + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId);
      swift_bridgeObjectRetain();
      v170[0] = sub_235C944B8(v64, v65, (uint64_t *)&v166);
      sub_235CA3A14();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_235C5E000, v3, v56, "MultiUserTRPCandidate requestId = %s does not match current requestId = %s.", (uint8_t *)v57, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x23B7DE144](v58, -1, -1);
      MEMORY[0x23B7DE144](v57, -1, -1);

      ((void (*)(uint64_t, NSObject *))v165)(v163, v164);
      return;
    }
    goto LABEL_95;
  }
LABEL_16:
  v151 = v32;
  v38 = objc_msgSend(v15, sel_trpCandidateList);
  if (!v38)
  {
    v66 = isa;
    v33 = sub_235CA36FC();
    v67 = sub_235CA3930();
    if (!os_log_type_enabled(v33, v67))
    {

      return;
    }
    v68 = (uint8_t *)swift_slowAlloc();
    v69 = swift_slowAlloc();
    *(_QWORD *)&v166 = v69;
    *(_DWORD *)v68 = 136315138;
    v70 = v151;
    swift_bridgeObjectRetain();
    v170[0] = sub_235C944B8(v152, v70, (uint64_t *)&v166);
    sub_235CA3A14();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_235C5E000, v33, v67, "Received MultiUserTRPCandidate with nil trpCandidateList for request: %s.", v68, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B7DE144](v69, -1, -1);
    v36 = v68;
    goto LABEL_13;
  }
  v39 = v38;
  sub_235C71624(0, (unint64_t *)&unk_2563772C0);
  v17 = sub_235CA38B8();

  ((void (*)(SEL *, uint64_t, NSObject *))v165)(v10, v161, v4);
  v40 = v15;
  swift_bridgeObjectRetain_n();
  v3 = v40;
  v12 = sub_235CA36FC();
  v41 = sub_235CA3924();
  v42 = os_log_type_enabled(v12, v41);
  v43 = v10;
  v44 = (unint64_t)v17 >> 62;
  v154 = v17;
  v145 = v3;
  if (!v42)
  {

    swift_bridgeObjectRelease_n();
    v26(v43, v4);
    goto LABEL_29;
  }
  v160 = v43;
  v164 = v4;
  v165 = (__int128 *)v26;
  v45 = swift_slowAlloc();
  v46 = swift_slowAlloc();
  *(_QWORD *)&v166 = v46;
  *(_DWORD *)v45 = 136315394;
  v47 = -[NSObject multiUserTrpCandidateId](v3, sel_multiUserTrpCandidateId);
  if (!v47)
  {
LABEL_96:

    swift_bridgeObjectRelease();
    __break(1u);
    return;
  }
  v48 = v47;
  v49 = sub_235CA37EC();
  v51 = v50;

  v170[0] = sub_235C944B8(v49, v51, (uint64_t *)&v166);
  sub_235CA3A14();

  swift_bridgeObjectRelease();
  *(_WORD *)(v45 + 12) = 2048;
  v17 = v154;
  if (v44)
  {
    swift_bridgeObjectRetain();
    v52 = sub_235CA3AF8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v52 = *(_QWORD *)((v154 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v3 = v164;
  v4 = v165;
  swift_bridgeObjectRelease();
  v170[0] = v52;
  sub_235CA3A14();
  swift_bridgeObjectRelease();
  _os_log_impl(&dword_235C5E000, v12, v41, "Received MultiUserTRPCandidate with trpCandidateId: %s with %ld entries.", (uint8_t *)v45, 0x16u);
  swift_arrayDestroy();
  MEMORY[0x23B7DE144](v46, -1, -1);
  MEMORY[0x23B7DE144](v45, -1, -1);

  ((void (*)(SEL *, NSObject *))v4)(v160, v3);
  isa = v162;
LABEL_29:
  v172 = sub_235C8EC7C(MEMORY[0x24BEE4AF8]);
  if (v44)
  {
LABEL_80:
    if (v17 < 0)
      v3 = v17;
    else
      v3 = (v17 & 0xFFFFFFFFFFFFFF8);
    swift_bridgeObjectRetain();
    a1 = (void *)sub_235CA3AF8();
    swift_bridgeObjectRelease();
    if (a1)
      goto LABEL_31;
LABEL_84:
    v130 = swift_bridgeObjectRelease();
    MEMORY[0x24BDAC7A8](v130);
    v131 = v145;
    *(&v144 - 4) = (uint64_t)isa;
    *(&v144 - 3) = (uint64_t)v131;
    *(&v144 - 2) = (uint64_t)&v172;
    v132 = objc_allocWithZone((Class)sub_235CA31C8());
    v133 = sub_235CA3168();
    if (v133)
    {
      v134 = (void *)v133;
      v135 = sub_235CA36FC();
      v136 = sub_235CA3924();
      if (os_log_type_enabled(v135, v136))
      {
        v137 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v137 = 0;
        _os_log_impl(&dword_235C5E000, v135, v136, "Posting MultiUserTRPCandidateRequestMessage.", v137, 2u);
        MEMORY[0x23B7DE144](v137, -1, -1);
      }

      __swift_project_boxed_opaque_existential_1((_QWORD *)((char *)isa + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_messagePublisher), *(_QWORD *)((char *)isa + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_messagePublisher + 24));
      sub_235CA33B4();

    }
    else
    {
      v138 = isa;
      v139 = sub_235CA36FC();
      v140 = sub_235CA3930();
      if (os_log_type_enabled(v139, v140))
      {
        v141 = (uint8_t *)swift_slowAlloc();
        v142 = swift_slowAlloc();
        *(_QWORD *)&v166 = v142;
        *(_DWORD *)v141 = 136315138;
        v143 = v151;
        swift_bridgeObjectRetain();
        v170[0] = sub_235C944B8(v152, v143, (uint64_t *)&v166);
        sub_235CA3A14();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_235C5E000, v139, v140, "receivedMultiUserTRPCandidate: Failed to create MultiUserTRPCandidateRequestMessage for request: %s.", v141, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x23B7DE144](v142, -1, -1);
        MEMORY[0x23B7DE144](v141, -1, -1);

      }
      else
      {

      }
    }
    goto LABEL_91;
  }
  a1 = *(void **)((v17 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!a1)
    goto LABEL_84;
LABEL_31:
  v17 = 0;
  v163 = (uint64_t)isa + OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_sessionState;
  v164 = ((char *)isa
                    + OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_immutableSessionState);
  v159 = v154 & 0xC000000000000001;
  v150 = v154 & 0xFFFFFFFFFFFFFF8;
  v149 = v154 + 32;
  v165 = (__int128 *)((char *)&v166 + 8);
  *(_QWORD *)&v71 = 136315138;
  v148 = v71;
  v147 = MEMORY[0x24BEE4AD8] + 8;
  *(_QWORD *)&v71 = 136315394;
  v146 = v71;
  v10 = (SEL *)&unk_25070F000;
  v157 = a1;
  while (1)
  {
    while (1)
    {
      if (v159)
      {
        v72 = (id)MEMORY[0x23B7DDB44](v17, v154);
      }
      else
      {
        if ((unint64_t)v17 >= *(_QWORD *)(v150 + 16))
        {
          __break(1u);
LABEL_79:
          __break(1u);
          goto LABEL_80;
        }
        v72 = *(id *)(v149 + 8 * v17);
      }
      v73 = v72;
      if (__OFADD__(v17++, 1))
      {
        __break(1u);
        goto LABEL_77;
      }
      v75 = objc_msgSend(v72, sel_trpCandidateId);
      if (!v75)
      {
        v3 = isa;
        v12 = sub_235CA36FC();
        v102 = sub_235CA3930();
        if (os_log_type_enabled(v12, v102))
        {
          v103 = v73;
          v104 = swift_slowAlloc();
          v105 = swift_slowAlloc();
          *(_QWORD *)&v166 = v105;
          *(_DWORD *)v104 = v148;
          v106 = v151;
          swift_bridgeObjectRetain();
          *(_QWORD *)(v104 + 4) = sub_235C944B8(v152, v106, (uint64_t *)&v166);

          swift_bridgeObjectRelease();
          _os_log_impl(&dword_235C5E000, v12, v102, "receivedMultiUserTRPCandidate: Failed to create TRPCandidateRequestMessage for request: %s as trpCandidateId was not populated in the TRPCandidate. This can have serious side effects.", (uint8_t *)v104, 0xCu);
          swift_arrayDestroy();
          v107 = v105;
          isa = v162;
          MEMORY[0x23B7DE144](v107, -1, -1);
          MEMORY[0x23B7DE144](v104, -1, -1);

          v10 = (SEL *)&unk_25070F000;
        }
        else
        {

        }
        goto LABEL_33;
      }
      v76 = v75;
      v4 = sub_235CA37EC();
      v78 = v77;

      v79 = objc_msgSend(v73, sel_userId);
      v160 = (SEL *)v73;
      if (v79)
        break;
      v3 = isa;
      swift_bridgeObjectRetain();
      v12 = sub_235CA36FC();
      v108 = sub_235CA3930();
      if (os_log_type_enabled(v12, v108))
      {
        v109 = swift_slowAlloc();
        v110 = swift_slowAlloc();
        *(_QWORD *)&v166 = v110;
        *(_DWORD *)v109 = v146;
        v111 = (unint64_t)v78;
        v112 = v151;
        swift_bridgeObjectRetain();
        *(_QWORD *)(v109 + 4) = sub_235C944B8(v152, v112, (uint64_t *)&v166);

        swift_bridgeObjectRelease();
        *(_WORD *)(v109 + 12) = 2080;
        swift_bridgeObjectRetain();
        *(_QWORD *)(v109 + 14) = sub_235C944B8((uint64_t)v4, v111, (uint64_t *)&v166);
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_235C5E000, v12, v108, "receivedMultiUserTRPCandidate: Failed to create TRPCandidateRequestMessage for request: %s as userId was not populated for the TRPCandidate: %s. This can have serious side effects.", (uint8_t *)v109, 0x16u);
        swift_arrayDestroy();
        v113 = v110;
        isa = v162;
        MEMORY[0x23B7DE144](v113, -1, -1);
        v114 = v109;
        a1 = v157;
        MEMORY[0x23B7DE144](v114, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n();
      }

      v10 = (SEL *)&unk_25070F000;
      if ((void *)v17 == a1)
        goto LABEL_84;
    }
    v3 = v79;
    v12 = sub_235CA37EC();
    v16 = v80;

    sub_235CA3480();
    v171 = (_QWORD *)MEMORY[0x24BEE4AF8];
    v81 = objc_msgSend(v73, sel_tcuList);
    if (!v81)
    {
      __break(1u);
      goto LABEL_94;
    }
    v82 = v81;
    v153 = v4;
    sub_235C71624(0, &qword_2542993B8);
    v83 = sub_235CA38B8();

    if (v83 >> 62)
    {
      swift_bridgeObjectRetain();
      v84 = sub_235CA3AF8();
      swift_bridgeObjectRelease();
      if (!v84)
        goto LABEL_69;
    }
    else
    {
      v84 = *(_QWORD *)((v83 & 0xFFFFFFFFFFFFF8) + 0x10);
      if (!v84)
        goto LABEL_69;
    }
    if (v84 < 1)
      goto LABEL_79;
    v85 = 0;
    v4 = v78;
    do
    {
      if ((v83 & 0xC000000000000001) != 0)
        v89 = (id)MEMORY[0x23B7DDB44](v85, v83);
      else
        v89 = *(id *)(v83 + 8 * v85 + 32);
      v90 = v89;
      v91 = objc_msgSend(v89, v10[412]);
      if (v91)
      {

        *(_QWORD *)&v166 = v90;
        sub_235C71390((uint64_t)v164, (uint64_t)v165);
        v92 = v171;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v92 = sub_235C74524(0, v92[2] + 1, 1, v92);
        v94 = v92[2];
        v93 = v92[3];
        if (v94 >= v93 >> 1)
          v92 = sub_235C74524((_QWORD *)(v93 > 1), v94 + 1, 1, v92);
        v92[2] = v94 + 1;
        v86 = &v92[6 * v94];
        v87 = v166;
        v88 = v168;
        v86[3] = v167;
        v86[4] = v88;
        v86[2] = v87;
        v171 = v92;
      }
      else
      {
        sub_235C71390(v163, (uint64_t)v170);
        __swift_project_boxed_opaque_existential_1(v170, v170[3]);
        v95 = v90;
        sub_235CA345C();
        *(_QWORD *)&v166 = v95;
        sub_235C7131C(&v169, (uint64_t)v165);
        v96 = v171;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v96 = sub_235C74524(0, v96[2] + 1, 1, v96);
        v98 = v96[2];
        v97 = v96[3];
        if (v98 >= v97 >> 1)
          v96 = sub_235C74524((_QWORD *)(v97 > 1), v98 + 1, 1, v96);
        v96[2] = v98 + 1;
        v99 = &v96[6 * v98];
        v100 = v166;
        v101 = v168;
        v99[3] = v167;
        v99[4] = v101;
        v99[2] = v100;

        v171 = v96;
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v170);
        v10 = (SEL *)&unk_25070F000;
      }
      ++v85;
      v78 = v4;
    }
    while (v84 != v85);
LABEL_69:
    v115 = swift_bridgeObjectRelease();
    MEMORY[0x24BDAC7A8](v115);
    isa = v162;
    v116 = v158;
    *(&v144 - 6) = (uint64_t)v162;
    *(&v144 - 5) = (uint64_t)v116;
    *(&v144 - 4) = (uint64_t)v153;
    *(&v144 - 3) = (uint64_t)v78;
    *(&v144 - 2) = (uint64_t)&v171;
    v117 = objc_allocWithZone((Class)sub_235CA2E80());
    v118 = sub_235CA2E20();
    swift_bridgeObjectRelease();
    if (!v118)
      break;
    v119 = sub_235CA348C();
    v121 = v120;
    v122 = v172;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(_QWORD *)&v166 = v122;
    v172 = 0x8000000000000000;
    v12 = &v166;
    sub_235C9D89C(v118, v119, v121, isUniquelyReferenced_nonNull_native);
    v3 = v172;
    v172 = v166;

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    (*(void (**)(NSObject *, uint64_t))(v155 + 8))(v116, v156);
    swift_bridgeObjectRelease();
LABEL_33:
    a1 = v157;
    if ((void *)v17 == v157)
      goto LABEL_84;
  }
  swift_bridgeObjectRelease();
  v124 = isa;
  v125 = sub_235CA36FC();
  v126 = sub_235CA3930();
  if (os_log_type_enabled(v125, v126))
  {
    v127 = (uint8_t *)swift_slowAlloc();
    v128 = swift_slowAlloc();
    *(_QWORD *)&v166 = v128;
    *(_DWORD *)v127 = v148;
    v129 = v151;
    swift_bridgeObjectRetain();
    v170[0] = sub_235C944B8(v152, v129, (uint64_t *)&v166);
    v116 = v158;
    sub_235CA3A14();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_235C5E000, v125, v126, "receivedMultiUserTRPCandidate: Failed to create TRPCandidateRequestMessage for request: %s.", v127, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B7DE144](v128, -1, -1);
    MEMORY[0x23B7DE144](v127, -1, -1);

  }
  else
  {

  }
  (*(void (**)(NSObject *, uint64_t))(v155 + 8))(v116, v156);
  swift_bridgeObjectRelease();
LABEL_91:
  swift_bridgeObjectRelease();
}

void sub_235C6C120(void *a1)
{
  char *v1;
  char *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  void (**v9)(char *, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  char v22;
  uint64_t v23;
  id v24;
  char *v25;
  void (**v26)(char *, uint64_t, uint64_t);
  NSObject *v27;
  int v28;
  uint64_t v29;
  id v30;
  void *v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  os_log_type_t v38;
  uint8_t *v39;
  uint64_t v40;
  void (*v41)(char *, uint64_t, uint64_t);
  char *v42;
  NSObject *v43;
  os_log_type_t v44;
  _BOOL4 v45;
  uint8_t *v46;
  id v47;
  void *v48;
  uint64_t v49;
  char *v50;
  id v51;
  void *v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  _OWORD *v57;
  __int128 v58;
  __int128 v59;
  id v60;
  void *v61;
  id v62;
  _QWORD *v63;
  id v64;
  unint64_t v65;
  unint64_t v66;
  id v67;
  _QWORD *v68;
  unint64_t v69;
  unint64_t v70;
  _OWORD *v71;
  __int128 v72;
  __int128 v73;
  uint64_t v74;
  int v75;
  id v76;
  uint64_t v77;
  SEL *v78;
  void *v79;
  NSObject *v80;
  os_log_type_t v81;
  uint8_t *v82;
  char *v83;
  uint64_t v84;
  id v85;
  uint64_t v86;
  void *v87;
  NSObject *v88;
  os_log_type_t v89;
  uint8_t *v90;
  id v91;
  uint64_t v92;
  NSObject *v93;
  os_log_type_t v94;
  uint8_t *v95;
  id v96;
  void *v97;
  uint64_t v98;
  uint64_t v99;
  char *v100;
  uint64_t v101;
  uint64_t v102;
  void (**v103)(char *, uint64_t, uint64_t);
  char *v104;
  char *v105;
  NSObject *v106;
  os_log_type_t v107;
  uint8_t *v108;
  uint64_t v109;
  unint64_t v110;
  const char *v111;
  unint64_t v112;
  char *v113;
  NSObject *v114;
  os_log_type_t v115;
  uint8_t *v116;
  uint64_t v117;
  unint64_t v118;
  _QWORD v119[2];
  uint64_t v120;
  unint64_t v121;
  char *v122;
  char *v123;
  char *v124;
  uint64_t v125;
  uint64_t v126;
  os_log_t v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  _QWORD v132[4];
  _QWORD v133[2];

  v2 = v1;
  v4 = sub_235CA3564();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v119 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_235CA3708();
  v9 = *(void (***)(char *, uint64_t, uint64_t))(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)v119 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)v119 - v13;
  if (v2[OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_isMedocEnabled] == 1)
  {
    v124 = v7;
    v125 = v5;
    v126 = v4;
    v15 = objc_msgSend(a1, sel_requestId);
    if (!v15)
    {
LABEL_8:
      if (qword_2542992E8 != -1)
        swift_once();
      v23 = __swift_project_value_buffer(v8, (uint64_t)qword_254299660);
      v9[2](v12, v23, v8);
      v24 = a1;
      v25 = v2;
      v26 = v9;
      v9 = (void (**)(char *, uint64_t, uint64_t))v24;
      v2 = v25;
      v27 = sub_235CA36FC();
      v28 = sub_235CA3924();
      if (!os_log_type_enabled(v27, (os_log_type_t)v28))
      {

        ((void (*)(char *, uint64_t))v26[1])(v12, v8);
        return;
      }
      LODWORD(v126) = v28;
      v127 = (os_log_t)v26;
      v29 = swift_slowAlloc();
      v125 = swift_slowAlloc();
      *(_QWORD *)&v128 = v125;
      *(_DWORD *)v29 = 136315394;
      v30 = objc_msgSend(v9, sel_requestId);
      if (v30)
      {
        v31 = v30;
        v32 = sub_235CA37EC();
        v34 = v33;

        v132[0] = sub_235C944B8(v32, v34, (uint64_t *)&v128);
        sub_235CA3A14();

        swift_bridgeObjectRelease();
        *(_WORD *)(v29 + 12) = 2080;
        v35 = *(_QWORD *)&v2[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId];
        v36 = *(_QWORD *)&v2[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId + 8];
        swift_bridgeObjectRetain();
        v132[0] = sub_235C944B8(v35, v36, (uint64_t *)&v128);
        sub_235CA3A14();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_235C5E000, v27, (os_log_type_t)v126, "TRPCandidate requestId = %s does not match current requestId = %s", (uint8_t *)v29, 0x16u);
        v37 = v125;
        swift_arrayDestroy();
        MEMORY[0x23B7DE144](v37, -1, -1);
        MEMORY[0x23B7DE144](v29, -1, -1);

        ((void (*)(char *, uint64_t))v127[1].isa)(v12, v8);
        return;
      }
      goto LABEL_75;
    }
    v16 = v15;
    v17 = sub_235CA37EC();
    v19 = v18;

    v20 = *(_QWORD *)&v2[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId];
    v21 = v17 == v20 && v19 == *(_QWORD *)&v2[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId + 8];
    v121 = *(_QWORD *)&v2[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId + 8];
    v120 = v20;
    if (v21)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      v22 = sub_235CA3B88();
      swift_bridgeObjectRelease();
      if ((v22 & 1) == 0)
        goto LABEL_8;
    }
    if (qword_2542992E8 != -1)
      swift_once();
    v40 = __swift_project_value_buffer(v8, (uint64_t)qword_254299660);
    v41 = v9[2];
    v119[1] = v40;
    ((void (*)(char *))v41)(v14);
    v42 = a1;
    v43 = sub_235CA36FC();
    v44 = sub_235CA3924();
    v45 = os_log_type_enabled(v43, v44);
    v123 = v2;
    v122 = v42;
    if (v45)
    {
      v127 = (os_log_t)v9;
      v46 = (uint8_t *)swift_slowAlloc();
      v9 = (void (**)(char *, uint64_t, uint64_t))swift_slowAlloc();
      *(_QWORD *)&v128 = v9;
      *(_DWORD *)v46 = 136315138;
      v47 = objc_msgSend(v42, sel_trpCandidateId);
      if (!v47)
      {
LABEL_76:

        __break(1u);
        goto LABEL_77;
      }
      v48 = v47;
      v49 = sub_235CA37EC();
      v2 = v50;

      v132[0] = sub_235C944B8(v49, (unint64_t)v2, (uint64_t *)&v128);
      sub_235CA3A14();
      v42 = v122;

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_235C5E000, v43, v44, "Received TRPCandidatePackage with trpCandidateId: %s", v46, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B7DE144](v9, -1, -1);
      MEMORY[0x23B7DE144](v46, -1, -1);

      ((void (*)(char *, uint64_t))v127[1].isa)(v14, v8);
    }
    else
    {

      ((void (*)(char *, uint64_t))v9[1])(v14, v8);
    }
    v133[0] = MEMORY[0x24BEE4AF8];
    v51 = objc_msgSend(v42, sel_tcuList);
    if (!v51)
    {
      __break(1u);
LABEL_75:

      __break(1u);
      goto LABEL_76;
    }
    v52 = v51;
    sub_235C71624(0, &qword_2542993B8);
    v53 = sub_235CA38B8();

    if (v53 >> 62)
    {
      swift_bridgeObjectRetain();
      v54 = sub_235CA3AF8();
      swift_bridgeObjectRelease();
      if (!v54)
        goto LABEL_47;
    }
    else
    {
      v54 = *(_QWORD *)((v53 & 0xFFFFFFFFFFFFF8) + 0x10);
      if (!v54)
        goto LABEL_47;
    }
    if (v54 < 1)
    {
      __break(1u);
LABEL_73:
      swift_once();
LABEL_61:
      v98 = v126;
      v99 = __swift_project_value_buffer(v126, (uint64_t)qword_254299648);
      v100 = v124;
      v101 = v125;
      (*(void (**)(char *, uint64_t, uint64_t))(v125 + 16))(v124, v99, v98);
      v102 = swift_allocObject();
      *(_QWORD *)(v102 + 16) = v42;
      *(_QWORD *)(v102 + 24) = v9;
      v103 = v9;
      v104 = v42;
      sub_235CA3540();
      swift_release();
      (*(void (**)(char *, uint64_t))(v101 + 8))(v100, v98);
LABEL_71:
      swift_bridgeObjectRelease();
      return;
    }
    v55 = 0;
    v127 = (os_log_t)&v123[OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_sessionState];
    v56 = (uint64_t)&v123[OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_immutableSessionState];
    do
    {
      if ((v53 & 0xC000000000000001) != 0)
        v60 = (id)MEMORY[0x23B7DDB44](v55, v53);
      else
        v60 = *(id *)(v53 + 8 * v55 + 32);
      v61 = v60;
      v62 = objc_msgSend(v60, sel_prevTCUIds);
      if (v62)
      {

        *(_QWORD *)&v128 = v61;
        sub_235C71390(v56, (uint64_t)&v128 + 8);
        v63 = (_QWORD *)v133[0];
        v64 = v61;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v63 = sub_235C74524(0, v63[2] + 1, 1, v63);
        v66 = v63[2];
        v65 = v63[3];
        if (v66 >= v65 >> 1)
          v63 = sub_235C74524((_QWORD *)(v65 > 1), v66 + 1, 1, v63);
        v63[2] = v66 + 1;
        v57 = &v63[6 * v66];
        v58 = v128;
        v59 = v130;
        v57[3] = v129;
        v57[4] = v59;
        v57[2] = v58;

        v133[0] = v63;
      }
      else
      {
        sub_235C71390((uint64_t)v127, (uint64_t)v132);
        __swift_project_boxed_opaque_existential_1(v132, v132[3]);
        v67 = v61;
        sub_235CA345C();
        *(_QWORD *)&v128 = v67;
        sub_235C7131C(&v131, (uint64_t)&v128 + 8);
        v68 = (_QWORD *)v133[0];
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v68 = sub_235C74524(0, v68[2] + 1, 1, v68);
        v70 = v68[2];
        v69 = v68[3];
        if (v70 >= v69 >> 1)
          v68 = sub_235C74524((_QWORD *)(v69 > 1), v70 + 1, 1, v68);
        v68[2] = v70 + 1;
        v71 = &v68[6 * v70];
        v72 = v128;
        v73 = v130;
        v71[3] = v129;
        v71[4] = v73;
        v71[2] = v72;

        v133[0] = v68;
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v132);
      }
      ++v55;
    }
    while (v54 != v55);
LABEL_47:
    v74 = swift_bridgeObjectRelease();
    v42 = v123;
    MEMORY[0x24BDAC7A8](v74);
    v9 = (void (**)(char *, uint64_t, uint64_t))v122;
    v119[-4] = v42;
    v119[-3] = v9;
    v119[-2] = v133;
    if (v75 == 1)
    {
      v76 = objc_allocWithZone((Class)sub_235CA3090());
      v77 = sub_235CA3030();
      v78 = (SEL *)&unk_25070F000;
      if (v77)
      {
        v79 = (void *)v77;
        v80 = sub_235CA36FC();
        v81 = sub_235CA3924();
        if (os_log_type_enabled(v80, v81))
        {
          v82 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v82 = 0;
          _os_log_impl(&dword_235C5E000, v80, v81, "Going to post TRPCandidateForPlannerMessage", v82, 2u);
          MEMORY[0x23B7DE144](v82, -1, -1);
        }

        v83 = &v42[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_messagePublisher];
        __swift_project_boxed_opaque_existential_1(&v42[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_messagePublisher], *(_QWORD *)&v42[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_messagePublisher + 24]);
        v84 = sub_235CA33B4();
        MEMORY[0x24BDAC7A8](v84);
        v119[-4] = v42;
        v119[-3] = v9;
        v119[-2] = v133;
        v85 = objc_allocWithZone((Class)sub_235CA2AB4());
        v86 = sub_235CA2A54();
        if (!v86)
        {
          v113 = v42;
          v114 = sub_235CA36FC();
          v115 = sub_235CA3930();
          if (os_log_type_enabled(v114, v115))
          {
            v116 = (uint8_t *)swift_slowAlloc();
            v117 = swift_slowAlloc();
            *(_QWORD *)&v128 = v117;
            *(_DWORD *)v116 = 136315138;
            v118 = v121;
            swift_bridgeObjectRetain();
            v132[0] = sub_235C944B8(v120, v118, (uint64_t *)&v128);
            sub_235CA3A14();

            swift_bridgeObjectRelease();
            _os_log_impl(&dword_235C5E000, v114, v115, "Failed to create RootTRPCandidateMessage for request: %s", v116, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x23B7DE144](v117, -1, -1);
            MEMORY[0x23B7DE144](v116, -1, -1);

          }
          else
          {

          }
          goto LABEL_71;
        }
        v87 = (void *)v86;
        v88 = sub_235CA36FC();
        v89 = sub_235CA3924();
        if (os_log_type_enabled(v88, v89))
        {
          v90 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v90 = 0;
          _os_log_impl(&dword_235C5E000, v88, v89, "Going to post RootTRPCandidateMessage", v90, 2u);
          MEMORY[0x23B7DE144](v90, -1, -1);
        }

        __swift_project_boxed_opaque_existential_1(v83, *((_QWORD *)v83 + 3));
        sub_235CA33B4();

LABEL_59:
        v96 = objc_msgSend(v9, v78[413]);
        if (!v96)
        {
LABEL_77:
          __break(1u);
          return;
        }
        v97 = v96;
        sub_235CA37EC();

        sub_235C72010();
        swift_bridgeObjectRelease();
        if (qword_2542989C0 == -1)
          goto LABEL_61;
        goto LABEL_73;
      }
      v105 = v42;
      v106 = sub_235CA36FC();
      v107 = sub_235CA3930();
      if (os_log_type_enabled(v106, v107))
      {
        v108 = (uint8_t *)swift_slowAlloc();
        v109 = swift_slowAlloc();
        *(_QWORD *)&v128 = v109;
        *(_DWORD *)v108 = 136315138;
        v110 = v121;
        swift_bridgeObjectRetain();
        v132[0] = sub_235C944B8(v120, v110, (uint64_t *)&v128);
        sub_235CA3A14();

        swift_bridgeObjectRelease();
        v111 = "Failed to create TRPCandidateForPlannerMessage for request: %s";
LABEL_66:
        _os_log_impl(&dword_235C5E000, v106, v107, v111, v108, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x23B7DE144](v109, -1, -1);
        MEMORY[0x23B7DE144](v108, -1, -1);

        goto LABEL_71;
      }
    }
    else
    {
      v91 = objc_allocWithZone((Class)sub_235CA2E80());
      v92 = sub_235CA2E20();
      v78 = (SEL *)&unk_25070F000;
      if (v92)
      {
        v87 = (void *)v92;
        v93 = sub_235CA36FC();
        v94 = sub_235CA3924();
        if (os_log_type_enabled(v93, v94))
        {
          v95 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v95 = 0;
          _os_log_impl(&dword_235C5E000, v93, v94, "Going to post TRPCandidateMessage", v95, 2u);
          MEMORY[0x23B7DE144](v95, -1, -1);
        }

        __swift_project_boxed_opaque_existential_1(&v42[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_messagePublisher], *(_QWORD *)&v42[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_messagePublisher + 24]);
        sub_235CA33B4();
        goto LABEL_59;
      }
      v105 = v42;
      v106 = sub_235CA36FC();
      v107 = sub_235CA3930();
      if (os_log_type_enabled(v106, v107))
      {
        v108 = (uint8_t *)swift_slowAlloc();
        v109 = swift_slowAlloc();
        *(_QWORD *)&v128 = v109;
        *(_DWORD *)v108 = 136315138;
        v112 = v121;
        swift_bridgeObjectRetain();
        v132[0] = sub_235C944B8(v120, v112, (uint64_t *)&v128);
        sub_235CA3A14();

        swift_bridgeObjectRelease();
        v111 = "Failed to create TRPCandidateRequestMessage for request: %s";
        goto LABEL_66;
      }
    }

    goto LABEL_71;
  }
  if (qword_2542992E8 != -1)
    swift_once();
  __swift_project_value_buffer(v8, (uint64_t)qword_254299660);
  v127 = (os_log_t)sub_235CA36FC();
  v38 = sub_235CA3930();
  if (os_log_type_enabled(v127, v38))
  {
    v39 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v39 = 0;
    _os_log_impl(&dword_235C5E000, v127, v38, "Received TRPCandidate Medoc is not enabled. Ignoring.", v39, 2u);
    MEMORY[0x23B7DE144](v39, -1, -1);
  }

}

uint64_t sub_235C6D144()
{
  uint64_t v0;

  return sub_235C666D0(*(_QWORD *)(v0 + 16));
}

uint64_t sub_235C6D14C()
{
  return sub_235C66988();
}

void sub_235C6D154(void *a1)
{
  NSObject *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  void *v14;
  objc_class *v15;
  objc_class *v16;
  objc_class *v17;
  char v19;
  os_log_type_t v20;
  uint8_t *v21;
  const char *v22;
  uint64_t v23;
  id v24;
  NSObject *v25;
  int v26;
  _BOOL4 v27;
  uint8_t *v28;
  id v29;
  void *v30;
  void *v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  NSObject *v36;
  os_log_type_t v37;
  _BOOL4 v38;
  uint64_t v39;
  uint8_t *v40;
  id v41;
  char *v42;
  id v43;
  void *v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  uint64_t v50;
  void *v51;
  id v52;
  uint8_t *v53;
  uint64_t v54;
  int v55;
  uint64_t v56;
  id v57;
  uint64_t v58;
  char *v59;
  char *v60;
  uint64_t v61;
  os_log_t v62;
  uint64_t v63;
  uint64_t v64;

  v3 = sub_235CA36F0();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = *(_QWORD *)(v4 + 64);
  v6 = MEMORY[0x24BDAC7A8](v3);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v53 - v7;
  v9 = sub_235CA3708();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v53 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*((_BYTE *)&v1->isa + OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_isMedocEnabled) != 1)
  {
    if (qword_2542992E8 != -1)
      swift_once();
    __swift_project_value_buffer(v9, (uint64_t)qword_254299660);
    v62 = (os_log_t)sub_235CA36FC();
    v20 = sub_235CA3930();
    if (!os_log_type_enabled(v62, v20))
      goto LABEL_17;
    v21 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v21 = 0;
    v22 = "Received ContinuityEnd when Medoc is not enabled.";
    goto LABEL_16;
  }
  v59 = v8;
  v60 = (char *)&v53 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v61 = v4;
  v62 = v1;
  v13 = objc_msgSend(a1, sel_requestId);
  if (!v13)
  {
LABEL_8:
    if (qword_2542992E8 != -1)
      swift_once();
    __swift_project_value_buffer(v9, (uint64_t)qword_254299660);
    v62 = (os_log_t)sub_235CA36FC();
    v20 = sub_235CA393C();
    if (!os_log_type_enabled(v62, v20))
      goto LABEL_17;
    v21 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v21 = 0;
    v22 = "ContinuityEnd requestId does not match current requestId";
LABEL_16:
    _os_log_impl(&dword_235C5E000, v62, v20, v22, v21, 2u);
    MEMORY[0x23B7DE144](v21, -1, -1);
LABEL_17:

    return;
  }
  v14 = v13;
  v15 = (objc_class *)sub_235CA37EC();
  v17 = v16;

  if (v15 == *(objc_class **)((char *)&v62->isa + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId)
    && v17 == *(objc_class **)((char *)&v62[1].isa
                             + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId))
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v19 = sub_235CA3B88();
    swift_bridgeObjectRelease();
    if ((v19 & 1) == 0)
      goto LABEL_8;
  }
  if (qword_2542992E8 != -1)
    swift_once();
  v23 = __swift_project_value_buffer(v9, (uint64_t)qword_254299660);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, v23, v9);
  v24 = a1;
  v25 = sub_235CA36FC();
  v26 = sub_235CA3924();
  v27 = os_log_type_enabled(v25, (os_log_type_t)v26);
  v57 = v24;
  v58 = v3;
  if (v27)
  {
    v55 = v26;
    v56 = v23;
    v28 = (uint8_t *)swift_slowAlloc();
    v54 = swift_slowAlloc();
    v64 = v54;
    *(_DWORD *)v28 = 136315138;
    v29 = objc_msgSend(v24, sel_lastTRPCandidateId);
    v30 = v24;
    if (!v29)
    {

      __break(1u);
      return;
    }
    v31 = v29;
    v53 = v28 + 4;
    v32 = sub_235CA37EC();
    v34 = v33;

    v63 = sub_235C944B8(v32, v34, &v64);
    sub_235CA3A14();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_235C5E000, v25, (os_log_type_t)v55, "Received ContinuityEnd with lastTRPCandidateId: %s", v28, 0xCu);
    v35 = v54;
    swift_arrayDestroy();
    MEMORY[0x23B7DE144](v35, -1, -1);
    MEMORY[0x23B7DE144](v28, -1, -1);

    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  }
  v36 = sub_235CA36FC();
  v37 = sub_235CA3924();
  v38 = os_log_type_enabled(v36, v37);
  v39 = v61;
  if (v38)
  {
    v40 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v40 = 0;
    _os_log_impl(&dword_235C5E000, v36, v37, "Will wait on Myriad selection..", v40, 2u);
    MEMORY[0x23B7DE144](v40, -1, -1);
  }

  if (qword_2542990E8 != -1)
    swift_once();
  v41 = (id)qword_2542994C8;
  v42 = v59;
  sub_235CA36D8();
  sub_235CA39A8();
  v43 = (id)qword_2542994C8;
  sub_235CA36C0();

  if (qword_2542992C0 != -1)
    swift_once();
  v44 = *(void **)algn_2542992B0;
  v56 = qword_2542992A8;
  v45 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v46 = v60;
  v47 = v58;
  (*(void (**)(char *, char *, uint64_t))(v39 + 16))(v60, v42, v58);
  v48 = (*(unsigned __int8 *)(v39 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v39 + 80);
  v49 = (v5 + v48 + 7) & 0xFFFFFFFFFFFFFFF8;
  v50 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v39 + 32))(v50 + v48, v46, v47);
  *(_QWORD *)(v50 + v49) = v45;
  v51 = v57;
  *(_QWORD *)(v50 + ((v49 + 15) & 0xFFFFFFFFFFFFFFF8)) = v57;
  v52 = v51;
  swift_retain();
  sub_235C72238(v56, v44, (uint64_t)sub_235C711BC, v50);
  swift_release();
  (*(void (**)(char *, uint64_t))(v39 + 8))(v42, v47);
  swift_release();
}

void sub_235C6D814(char a1)
{
  uint8_t *v1;
  uint8_t *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  char *v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  os_log_type_t v19;
  uint8_t *v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  os_log_t v27;
  uint8_t *v28;
  os_log_t v29;
  uint64_t v30;
  os_log_t v31;

  v2 = v1;
  v4 = sub_235CA2790();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2542992E8 != -1)
    swift_once();
  v8 = sub_235CA3708();
  __swift_project_value_buffer(v8, (uint64_t)qword_254299660);
  v9 = sub_235CA36FC();
  v10 = sub_235CA3924();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_235C5E000, v9, v10, "Received requestAttentionAssetDownload", v11, 2u);
    MEMORY[0x23B7DE144](v11, -1, -1);
  }

  if ((a1 & 1) != 0)
  {
    MEMORY[0x24BDAC7A8](v12);
    *(&v28 - 2) = v2;
    v13 = objc_allocWithZone((Class)sub_235CA3228());
    v14 = sub_235CA3138();
    if (v14)
    {
      v15 = (char *)v14;
      v16 = sub_235CA36FC();
      v17 = sub_235CA3924();
      if (os_log_type_enabled(v16, v17))
      {
        v18 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v18 = 0;
        _os_log_impl(&dword_235C5E000, v16, v17, "Going to post MagusAttentionAssetDownloadRequestedMessage", v18, 2u);
        MEMORY[0x23B7DE144](v18, -1, -1);
      }

      __swift_project_boxed_opaque_existential_1(&v2[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_messagePublisher], *(_QWORD *)&v2[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_messagePublisher + 24]);
      sub_235CA33B4();
    }
    else
    {
      v15 = v2;
      v21 = sub_235CA36FC();
      v22 = sub_235CA3930();
      if (os_log_type_enabled(v21, v22))
      {
        v23 = (uint8_t *)swift_slowAlloc();
        v29 = (os_log_t)swift_slowAlloc();
        v31 = v29;
        *(_DWORD *)v23 = 136315138;
        v28 = v23 + 4;
        (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v7, &v15[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_sessionId], v4);
        sub_235C69C18((unint64_t *)&unk_254299040, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
        v24 = sub_235CA3B64();
        v26 = v25;
        (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
        v30 = sub_235C944B8(v24, v26, (uint64_t *)&v31);
        sub_235CA3A14();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_235C5E000, v21, v22, "Failed to create MagusAttentionAssetDownloadRequestedMessage for session: %s", v23, 0xCu);
        v27 = v29;
        swift_arrayDestroy();
        MEMORY[0x23B7DE144](v27, -1, -1);
        MEMORY[0x23B7DE144](v23, -1, -1);

        return;
      }

    }
  }
  else
  {
    v29 = (os_log_t)sub_235CA36FC();
    v19 = sub_235CA3924();
    if (os_log_type_enabled(v29, v19))
    {
      v20 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v20 = 67109120;
      LODWORD(v31) = 0;
      sub_235CA3A14();
      _os_log_impl(&dword_235C5E000, v29, v19, "requestDownload = %{BOOL}d, returning.", v20, 8u);
      MEMORY[0x23B7DE144](v20, -1, -1);
    }

  }
}

void sub_235C6DC88(uint64_t a1, unint64_t a2, NSObject *a3, uint64_t a4, double a5)
{
  char *v5;
  char *v6;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  _BOOL4 v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  os_log_t v36;
  NSObject *v37;
  os_log_type_t v38;
  uint8_t *v39;
  uint64_t v40;
  NSObject *v41;
  os_log_type_t v42;
  uint8_t *v43;
  uint64_t v44;
  _QWORD *v45;
  _QWORD v46[2];
  uint64_t v47;
  os_log_t v48;
  uint64_t v49;
  double v50;

  v6 = v5;
  v48 = a3;
  v11 = sub_235CA3564();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)v46 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((v5[OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_isMedocEnabled] & 1) != 0)
  {
    if (qword_2542992E8 != -1)
      swift_once();
    v15 = sub_235CA3708();
    __swift_project_value_buffer(v15, (uint64_t)qword_254299660);
    v48 = (os_log_t)sub_235CA36FC();
    v16 = sub_235CA3930();
    if (os_log_type_enabled(v48, v16))
    {
      v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_235C5E000, v48, v16, "Received Eager RC in Medoc flow. Ignoring.", v17, 2u);
      MEMORY[0x23B7DE144](v17, -1, -1);
    }

  }
  else
  {
    if (qword_2542992E8 != -1)
      swift_once();
    v18 = sub_235CA3708();
    v46[1] = __swift_project_value_buffer(v18, (uint64_t)qword_254299660);
    v19 = sub_235CA36FC();
    v20 = sub_235CA3924();
    v21 = os_log_type_enabled(v19, v20);
    v47 = a1;
    if (v21)
    {
      v22 = swift_slowAlloc();
      *(_DWORD *)v22 = 134218240;
      v50 = *(double *)&v48;
      sub_235CA3A14();
      *(_WORD *)(v22 + 12) = 2048;
      v50 = a5;
      a1 = v47;
      sub_235CA3A14();
      _os_log_impl(&dword_235C5E000, v19, v20, "Received eager recognition candidate rcId:%lu processedDuration: %f", (uint8_t *)v22, 0x16u);
      MEMORY[0x23B7DE144](v22, -1, -1);
    }

    v23 = *(_QWORD *)&v6[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId] == a1
       && *(_QWORD *)&v6[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId + 8] == a2;
    if (v23 || (sub_235CA3B88() & 1) != 0)
    {
      v50 = *(double *)&v48;
      v24 = sub_235CA3B64();
      v26 = v25;
      v27 = MEMORY[0x24BDAC7A8](v24);
      v46[-4] = v6;
      v46[-3] = v27;
      v46[-2] = v28;
      v46[-1] = a4;
      v29 = objc_allocWithZone((Class)sub_235CA2C40());
      v30 = sub_235CA2BE0();
      if (v30)
      {
        v31 = v30;
        v32 = v12;
        v33 = v47;
        sub_235C71ED4(v47, a2, v24, v26);
        swift_bridgeObjectRelease();
        if (qword_2542989C0 != -1)
          swift_once();
        v34 = __swift_project_value_buffer(v11, (uint64_t)qword_254299648);
        (*(void (**)(char *, uint64_t, uint64_t))(v32 + 16))(v14, v34, v11);
        v35 = (_QWORD *)swift_allocObject();
        v35[2] = v6;
        v35[3] = v33;
        v36 = v48;
        v35[4] = a2;
        v35[5] = v36;
        v6;
        swift_bridgeObjectRetain();
        sub_235CA3540();
        swift_release();
        (*(void (**)(char *, uint64_t))(v32 + 8))(v14, v11);
        sub_235C76C80(v31);

        swift_bridgeObjectRelease();
      }
      else
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRetain_n();
        v37 = sub_235CA36FC();
        v38 = sub_235CA3930();
        if (os_log_type_enabled(v37, v38))
        {
          v39 = (uint8_t *)swift_slowAlloc();
          v40 = swift_slowAlloc();
          v50 = *(double *)&v40;
          *(_DWORD *)v39 = 136315138;
          swift_bridgeObjectRetain();
          v49 = sub_235C944B8(v47, a2, (uint64_t *)&v50);
          sub_235CA3A14();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_235C5E000, v37, v38, "Failed to create AsrResultCandidateMessage for request: %s", v39, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x23B7DE144](v40, -1, -1);
          MEMORY[0x23B7DE144](v39, -1, -1);

        }
        else
        {

          swift_bridgeObjectRelease_n();
        }
      }
    }
    else
    {
      v41 = sub_235CA36FC();
      v42 = sub_235CA3930();
      if (os_log_type_enabled(v41, v42))
      {
        v43 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v43 = 0;
        _os_log_impl(&dword_235C5E000, v41, v42, "Response requestId does not match current requestId", v43, 2u);
        MEMORY[0x23B7DE144](v43, -1, -1);
      }

      if (qword_2542989C0 != -1)
        swift_once();
      v44 = __swift_project_value_buffer(v11, (uint64_t)qword_254299648);
      (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, v44, v11);
      v45 = (_QWORD *)swift_allocObject();
      v45[2] = v47;
      v45[3] = a2;
      v45[4] = v48;
      swift_bridgeObjectRetain();
      sub_235CA354C();
      swift_release();
      (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
    }
  }
}

void sub_235C6E2FC(uint64_t a1, unint64_t a2, uint64_t a3, int a4)
{
  void *v4;
  void *v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint8_t *v24;
  uint8_t *v25;
  id v26;
  uint64_t v27;
  void (*v28)(char *, uint64_t, uint64_t);
  char *v29;
  _QWORD *v30;
  uint64_t v31;
  char *v32;
  void (*v33)(char *, uint64_t);
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  unint64_t v38;
  uint64_t v39;
  char v40;
  id v41;
  void *v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  void *v48;
  NSObject *v49;
  os_log_type_t v50;
  uint64_t v51;
  uint64_t v52;
  uint8_t *v53;
  uint8_t *v54;
  char *v55;
  _QWORD *v56;
  uint64_t v57;
  char *v58;
  NSObject *v59;
  os_log_type_t v60;
  uint8_t *v61;
  _QWORD *v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  NSObject *v66;
  os_log_type_t v67;
  unint64_t v68;
  uint8_t *v69;
  uint64_t v70;
  uint64_t v71;
  char v72;
  id v73;
  id v74;
  unint64_t v75;
  NSObject *v76;
  os_log_type_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  int v82;
  uint64_t v83;
  char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;

  v5 = v4;
  v82 = a4;
  v85 = a3;
  v8 = sub_235CA3564();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v84 = (char *)&v80 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_235CA36F0();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v80 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2542992E8 != -1)
    swift_once();
  v15 = sub_235CA3708();
  v83 = __swift_project_value_buffer(v15, (uint64_t)qword_254299660);
  v16 = sub_235CA36FC();
  v17 = sub_235CA3924();
  if (os_log_type_enabled(v16, v17))
  {
    v18 = (uint8_t *)swift_slowAlloc();
    v81 = v12;
    v19 = v11;
    v20 = v9;
    v21 = v5;
    v22 = v8;
    v23 = a1;
    v24 = v18;
    *(_DWORD *)v18 = 134217984;
    v87 = v85;
    sub_235CA3A14();
    _os_log_impl(&dword_235C5E000, v16, v17, "Received recognition candidate accepted for rcId:%lu", v24, 0xCu);
    v25 = v24;
    a1 = v23;
    v8 = v22;
    v5 = v21;
    v9 = v20;
    v11 = v19;
    v12 = v81;
    MEMORY[0x23B7DE144](v25, -1, -1);
  }

  sub_235CA39B4();
  if (qword_2542990E8 != -1)
    swift_once();
  v26 = (id)qword_2542994C8;
  sub_235CA36E4();
  sub_235CA36CC();

  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  if (qword_2542989C0 != -1)
    swift_once();
  v27 = __swift_project_value_buffer(v8, (uint64_t)qword_254299648);
  v28 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  v29 = v84;
  v28(v84, v27, v8);
  v30 = (_QWORD *)swift_allocObject();
  v30[2] = v5;
  v30[3] = a1;
  v31 = v85;
  v30[4] = a2;
  v30[5] = v31;
  v32 = v5;
  swift_bridgeObjectRetain();
  sub_235CA3540();
  swift_release();
  v33 = *(void (**)(char *, uint64_t))(v9 + 8);
  v33(v29, v8);
  if ((*(_QWORD *)&v32[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId] != a1
     || *(_QWORD *)&v32[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId + 8] != a2)
    && (sub_235CA3B88() & 1) == 0)
  {
    v49 = sub_235CA36FC();
    v50 = sub_235CA3930();
    if (os_log_type_enabled(v49, v50))
    {
      v51 = v8;
      v52 = a1;
      v53 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v53 = 0;
      _os_log_impl(&dword_235C5E000, v49, v50, "Response requestId does not match current requestId", v53, 2u);
      v54 = v53;
      a1 = v52;
      v8 = v51;
      MEMORY[0x23B7DE144](v54, -1, -1);
    }

    v55 = v84;
    v28(v84, v27, v8);
    v56 = (_QWORD *)swift_allocObject();
    v56[2] = a1;
    v56[3] = a2;
    v57 = v85;
    v56[4] = v32;
    v56[5] = v57;
    v58 = v32;
    swift_bridgeObjectRetain();
    goto LABEL_25;
  }
  v87 = v85;
  v34 = sub_235CA3B64();
  v36 = v35;
  if (v32[OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_isMUXEnabled] != 1)
  {
    v45 = MEMORY[0x24BDAC7A8](v34);
    *(&v80 - 4) = (uint64_t)v32;
    *(&v80 - 3) = v45;
    *(&v80 - 2) = v36;
    *((_BYTE *)&v80 - 8) = v82 & 1;
    v46 = objc_allocWithZone((Class)sub_235CA2964());
    v47 = sub_235CA2958();
    swift_bridgeObjectRelease();
    if (!v47)
    {
      swift_bridgeObjectRetain_n();
      v66 = sub_235CA36FC();
      v67 = sub_235CA3930();
      if (os_log_type_enabled(v66, v67))
      {
        v68 = a2;
        v69 = (uint8_t *)swift_slowAlloc();
        v70 = swift_slowAlloc();
        v87 = v70;
        *(_DWORD *)v69 = 136315138;
        swift_bridgeObjectRetain();
        v86 = sub_235C944B8(a1, v68, &v87);
        sub_235CA3A14();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_235C5E000, v66, v67, "Failed to create ResultSelectedMessage for request: %s", v69, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x23B7DE144](v70, -1, -1);
        MEMORY[0x23B7DE144](v69, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      return;
    }
    v48 = *(void **)&v32[OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_resultSelectedMsg];
    *(_QWORD *)&v32[OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_resultSelectedMsg] = v47;
LABEL_30:

    sub_235C65C74();
    return;
  }
  v81 = a1;
  v37 = *(void **)&v32[OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_voiceIdScoreCard];
  if (!v37)
  {
    swift_bridgeObjectRelease();
    v59 = sub_235CA36FC();
    v60 = sub_235CA3930();
    if (os_log_type_enabled(v59, v60))
    {
      v61 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v61 = 0;
      _os_log_impl(&dword_235C5E000, v59, v60, "Voice id card is nil. This is due to malformed homemembers list", v61, 2u);
      MEMORY[0x23B7DE144](v61, -1, -1);
    }

    v55 = v84;
    v28(v84, v27, v8);
    v62 = (_QWORD *)swift_allocObject();
    v63 = v81;
    v62[2] = v32;
    v62[3] = v63;
    v64 = v85;
    v62[4] = a2;
    v62[5] = v64;
    v65 = v32;
    swift_bridgeObjectRetain();
LABEL_25:
    sub_235CA354C();
    swift_release();
    v33(v55, v8);
    return;
  }
  v38 = a2;
  if (v32[OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_isIdentityScoreConsumptionEnabled] != 1)
  {
    v71 = MEMORY[0x24BDAC7A8](v34);
    *(&v80 - 6) = (uint64_t)v32;
    *(&v80 - 5) = v71;
    *(&v80 - 4) = v36;
    *((_BYTE *)&v80 - 24) = v72;
    *(&v80 - 2) = (uint64_t)v37;
    objc_allocWithZone((Class)sub_235CA2B74());
    v73 = v37;
    v42 = (void *)sub_235CA2B14();
    swift_bridgeObjectRelease();
    v43 = 0x8000000235CA56A0;
    if (!v42)
    {
      v44 = 0xD000000000000018;
      goto LABEL_33;
    }
    goto LABEL_29;
  }
  v39 = MEMORY[0x24BDAC7A8](v34);
  *(&v80 - 4) = (uint64_t)v32;
  *(&v80 - 3) = v39;
  *(&v80 - 2) = v36;
  *((_BYTE *)&v80 - 8) = v40;
  objc_allocWithZone((Class)sub_235CA315C());
  v41 = v37;
  v42 = (void *)sub_235CA2958();
  swift_bridgeObjectRelease();
  v43 = 0x8000000235CA56C0;
  if (v42)
  {
LABEL_29:
    v74 = v42;
    swift_bridgeObjectRelease();
    v48 = *(void **)&v32[OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_resultSelectedMsg];
    *(_QWORD *)&v32[OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_resultSelectedMsg] = v42;

    goto LABEL_30;
  }
  v44 = 0xD000000000000023;
LABEL_33:
  v75 = v38;
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  v76 = sub_235CA36FC();
  v77 = sub_235CA3930();
  if (os_log_type_enabled(v76, v77))
  {
    v78 = swift_slowAlloc();
    v79 = swift_slowAlloc();
    v87 = v79;
    *(_DWORD *)v78 = 136315394;
    swift_bridgeObjectRetain();
    v86 = sub_235C944B8(v44, v43, &v87);
    sub_235CA3A14();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v78 + 12) = 2080;
    swift_bridgeObjectRetain();
    v86 = sub_235C944B8(v81, v75, &v87);
    sub_235CA3A14();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_235C5E000, v76, v77, "Failed to create %s for request: %s", (uint8_t *)v78, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x23B7DE144](v79, -1, -1);
    MEMORY[0x23B7DE144](v78, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }

}

void sub_235C6ECD0(void *a1)
{
  _BYTE *v1;
  _BYTE *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  id v16;
  void *v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  _QWORD *v27;
  os_log_t v28;
  uint64_t v29;
  void *v30;
  id v31;
  uint64_t v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  id v40;
  id v41;
  uint64_t v42;
  char *v43;
  NSObject *v44;
  os_log_type_t v45;
  uint8_t *v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  const char *v50;
  id v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  os_log_t v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  _QWORD *v62;
  int v63;
  uint64_t v64;
  uint64_t aBlock[7];

  v2 = v1;
  aBlock[6] = *MEMORY[0x24BDAC8D0];
  v4 = sub_235CA2790();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v54 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_235CA3708();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v54 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2542992E8 != -1)
    swift_once();
  v12 = __swift_project_value_buffer(v8, (uint64_t)qword_254299660);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v12, v8);
  v13 = a1;
  v14 = sub_235CA36FC();
  v63 = sub_235CA3924();
  if (!os_log_type_enabled(v14, (os_log_type_t)v63))
  {

    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
LABEL_13:
    v2[OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_hasfirstVoiceIdScoreCardArrived] = 1;
    v30 = *(void **)&v2[OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_voiceIdScoreCard];
    *(_QWORD *)&v2[OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_voiceIdScoreCard] = v13;
    v31 = v13;

    if (v2[OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_isUOS] == 1)
    {
      v33 = (id)sub_235CA3984();
      sub_235CA2784();
      sub_235CA2760();
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      v34 = (void *)sub_235CA37E0();
      swift_bridgeObjectRelease();
      objc_msgSend(v33, sel_setAceId_, v34);

      v35 = v33;
      v36 = (void *)sub_235CA37E0();
      objc_msgSend(v35, sel_setRefId_, v36);

      v37 = *(void **)&v2[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_serviceHelper];
      v38 = swift_allocObject();
      *(_QWORD *)(v38 + 16) = v35;
      aBlock[4] = (uint64_t)sub_235C715A4;
      aBlock[5] = v38;
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 1107296256;
      aBlock[2] = (uint64_t)sub_235C8101C;
      aBlock[3] = (uint64_t)&block_descriptor_141;
      v39 = _Block_copy(aBlock);
      v40 = v35;
      swift_release();
      objc_msgSend(v37, sel_handleCommand_completion_, v40, v39);
      _Block_release(v39);

    }
    if ((v2[OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_isIdentityScoreConsumptionEnabled] & 1) != 0
      || v2[OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_isIdentityBridgeInstrumentationEnabled] == 1)
    {
      MEMORY[0x24BDAC7A8](v32);
      *(&v54 - 2) = (uint64_t)v2;
      *(&v54 - 1) = (uint64_t)v31;
      v41 = objc_allocWithZone((Class)sub_235CA2B08());
      v42 = sub_235CA2AC0();
      if (!v42)
      {
        v43 = v2;
        v44 = sub_235CA36FC();
        v45 = sub_235CA3930();
        if (os_log_type_enabled(v44, v45))
        {
          v46 = (uint8_t *)swift_slowAlloc();
          v47 = swift_slowAlloc();
          aBlock[0] = v47;
          *(_DWORD *)v46 = 136315138;
          v48 = *(_QWORD *)&v43[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId];
          v49 = *(_QWORD *)&v43[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId + 8];
          swift_bridgeObjectRetain();
          v64 = sub_235C944B8(v48, v49, aBlock);
          sub_235CA3A14();

          swift_bridgeObjectRelease();
          v50 = "Failed to create VoiceIdScoreCardMessage for request: %s";
LABEL_24:
          _os_log_impl(&dword_235C5E000, v44, v45, v50, v46, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x23B7DE144](v47, -1, -1);
          MEMORY[0x23B7DE144](v46, -1, -1);

          return;
        }
LABEL_25:

        goto LABEL_26;
      }
    }
    else
    {
      MEMORY[0x24BDAC7A8](v32);
      *(&v54 - 2) = (uint64_t)v2;
      *(&v54 - 1) = (uint64_t)v31;
      v51 = objc_allocWithZone((Class)sub_235CA2DB4());
      v42 = sub_235CA2D54();
      if (!v42)
      {
        v43 = v2;
        v44 = sub_235CA36FC();
        v45 = sub_235CA3930();
        if (os_log_type_enabled(v44, v45))
        {
          v46 = (uint8_t *)swift_slowAlloc();
          v47 = swift_slowAlloc();
          aBlock[0] = v47;
          *(_DWORD *)v46 = 136315138;
          v52 = *(_QWORD *)&v43[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId];
          v53 = *(_QWORD *)&v43[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId + 8];
          swift_bridgeObjectRetain();
          v64 = sub_235C944B8(v52, v53, aBlock);
          sub_235CA3A14();

          swift_bridgeObjectRelease();
          v50 = "Failed to create UserIdentificationMessage for request: %s";
          goto LABEL_24;
        }
        goto LABEL_25;
      }
    }
    v43 = (char *)v42;
    __swift_project_boxed_opaque_existential_1(&v2[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_messagePublisher], *(_QWORD *)&v2[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_messagePublisher + 24]);
    sub_235CA33B4();
LABEL_26:

    return;
  }
  v56 = v14;
  v57 = v9;
  v54 = v8;
  v58 = v7;
  v59 = v5;
  v60 = v4;
  v61 = v12;
  v15 = swift_slowAlloc();
  v62 = (_QWORD *)swift_slowAlloc();
  v55 = swift_slowAlloc();
  aBlock[0] = v55;
  *(_DWORD *)v15 = 136315906;
  v16 = objc_msgSend(v13, sel_spIdKnownUserScores);
  if (v16)
  {
    v17 = v16;
    sub_235C71624(0, (unint64_t *)&unk_254299400);
    sub_235CA3798();

    v18 = sub_235CA37A4();
    v20 = v19;
    swift_bridgeObjectRelease();
    v64 = sub_235C944B8(v18, v20, aBlock);
    sub_235CA3A14();

    swift_bridgeObjectRelease();
    *(_WORD *)(v15 + 12) = 2112;
    v21 = objc_msgSend(v13, sel_spIdUnknownUserScore);
    v22 = v21;
    if (v21)
      v64 = (uint64_t)v21;
    else
      v64 = 0;
    sub_235CA3A14();
    *v62 = v22;

    *(_WORD *)(v15 + 22) = 2048;
    v23 = objc_msgSend(v13, sel_userIdentityClassification);

    v64 = (uint64_t)v23;
    sub_235CA3A14();

    *(_WORD *)(v15 + 32) = 2112;
    v24 = objc_msgSend(v13, sel_spIdAudioProcessedDuration);
    v25 = v24;
    v4 = v60;
    if (v24)
      v64 = (uint64_t)v24;
    else
      v64 = 0;
    sub_235CA3A14();
    v26 = v54;
    v27 = v62;
    v62[1] = v25;

    v28 = v56;
    _os_log_impl(&dword_235C5E000, v56, (os_log_type_t)v63, "Received voiceIdScoreCard.\nKnownUserScores=%s, UnknownUserScore=%@, UserClassification=%ld, Audio Duration= %@", (uint8_t *)v15, 0x2Au);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254299410);
    swift_arrayDestroy();
    MEMORY[0x23B7DE144](v27, -1, -1);
    v29 = v55;
    swift_arrayDestroy();
    MEMORY[0x23B7DE144](v29, -1, -1);
    MEMORY[0x23B7DE144](v15, -1, -1);

    (*(void (**)(char *, uint64_t))(v57 + 8))(v11, v26);
    v7 = v58;
    v5 = v59;
    goto LABEL_13;
  }

  __break(1u);
}

void sub_235C6F600()
{
  _BYTE *v0;
  _BYTE *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(char *, uint64_t);
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  id v19;
  uint64_t v20;
  void *v21;
  _BYTE *v22;
  id v23;
  id v24;
  _QWORD *v25;
  id v26;
  uint64_t v27;
  void *v28;
  _BYTE *v29;
  id v30;
  NSObject *v31;
  _QWORD *v32;
  id v33;
  uint64_t v34;
  void *v35;
  _BYTE *v36;
  id v37;
  _QWORD *v38;
  id v39;
  uint64_t v40;
  void *v41;
  _BYTE *v42;
  id v43;
  uint64_t v44;
  NSObject *v45;
  os_log_type_t v46;
  uint8_t *v47;
  uint64_t v48;
  NSObject *v49;
  os_log_type_t v50;
  void *v51;
  uint8_t *v52;
  uint64_t v53;
  char *v54;
  NSObject *v55;
  os_log_type_t v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  os_log_t v61;
  uint64_t v62;
  char *v63;
  NSObject *v64;
  os_log_type_t v65;
  uint8_t *v66;
  uint64_t v67;
  unint64_t v68;
  os_log_t v69;
  uint64_t v70;
  uint64_t v71;
  char *v72;
  NSObject *v73;
  os_log_type_t v74;
  int v75;
  uint8_t *v76;
  unint64_t v77;
  uint64_t v78;
  os_log_t v79;
  uint8_t *v80;
  uint64_t v81;
  uint8_t *v82;
  uint8_t *v83;
  uint64_t v84;
  uint64_t v85;
  os_log_t v86;
  os_log_t v87;
  id v88;
  id v89;
  uint64_t v90;
  uint64_t aBlock;
  uint64_t v92;
  uint64_t (*v93)();
  void *v94;
  uint64_t (*v95)();
  uint64_t v96;
  uint64_t v97;
  char v98;

  v1 = v0;
  v2 = sub_235CA2790();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v82 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_235CA2784();
  v6 = sub_235CA2760();
  v8 = v7;
  v9 = *(void (**)(char *, uint64_t))(v3 + 8);
  v9(v5, v2);
  v97 = 0;
  v98 = 1;
  if ((v1[OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_isCandidateRequest] & 1) != 0
    || v1[OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_isFFRequest] == 1)
  {
    v97 = 30;
    v98 = 0;
  }
  v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE09348]), sel_init);
  v11 = objc_allocWithZone(MEMORY[0x24BE09318]);
  v12 = v10;
  v13 = objc_msgSend(v11, sel_init);
  v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE09338]), sel_initWithRecognition_rawRecognition_audioAnalytics_isFinal_utteranceStart_, v12, v12, v13, 0, 0.0);

  if (v14)
  {
    sub_235CA2784();
    v15 = sub_235CA2760();
    v17 = v16;
    v9(v5, v2);
    v18 = (_QWORD *)swift_allocObject();
    v18[2] = v15;
    v18[3] = v17;
    v18[4] = v1;
    v18[5] = v14;
    v18[6] = &v97;
    v19 = objc_allocWithZone(MEMORY[0x24BE9B510]);
    v20 = swift_allocObject();
    *(_QWORD *)(v20 + 16) = sub_235C7103C;
    *(_QWORD *)(v20 + 24) = v18;
    v95 = sub_235C7105C;
    v96 = v20;
    aBlock = MEMORY[0x24BDAC760];
    v92 = 1107296256;
    v93 = sub_235C69A78;
    v94 = &block_descriptor_74;
    v21 = _Block_copy(&aBlock);
    v22 = v1;
    v23 = v14;
    swift_release();
    v24 = objc_msgSend(v19, sel_initWithBuilder_, v21);
    _Block_release(v21);
    if (v24)
    {
      v89 = v23;
      v25 = (_QWORD *)swift_allocObject();
      v25[2] = v6;
      v25[3] = v8;
      v25[4] = v22;
      v25[5] = v24;
      v26 = objc_allocWithZone(MEMORY[0x24BE9B518]);
      v27 = swift_allocObject();
      *(_QWORD *)(v27 + 16) = sub_235C710C4;
      *(_QWORD *)(v27 + 24) = v25;
      v95 = sub_235C71760;
      v96 = v27;
      aBlock = MEMORY[0x24BDAC760];
      v92 = 1107296256;
      v93 = sub_235C69A78;
      v94 = &block_descriptor_83;
      v28 = _Block_copy(&aBlock);
      v29 = v22;
      swift_bridgeObjectRetain();
      v30 = v24;
      swift_release();
      v31 = objc_msgSend(v26, sel_initWithBuilder_, v28);
      _Block_release(v28);
      v88 = v30;
      if (v31)
      {
        v87 = v31;
        sub_235C6C120(v31);
        v32 = (_QWORD *)swift_allocObject();
        v32[2] = v6;
        v32[3] = v8;
        v32[4] = v29;
        v33 = objc_allocWithZone(MEMORY[0x24BE9B520]);
        v34 = swift_allocObject();
        *(_QWORD *)(v34 + 16) = sub_235C710E8;
        *(_QWORD *)(v34 + 24) = v32;
        v95 = sub_235C71760;
        v96 = v34;
        aBlock = MEMORY[0x24BDAC760];
        v92 = 1107296256;
        v93 = sub_235C69A78;
        v94 = &block_descriptor_92;
        v35 = _Block_copy(&aBlock);
        v36 = v29;
        swift_bridgeObjectRetain();
        swift_release();
        v37 = objc_msgSend(v33, sel_initWithBuilder_, v35);
        _Block_release(v35);
        if (v37)
        {
          sub_235C6A59C(v37);
          v38 = (_QWORD *)swift_allocObject();
          v38[2] = v6;
          v38[3] = v8;
          v38[4] = v36;
          v39 = objc_allocWithZone(MEMORY[0x24BE9B508]);
          v40 = swift_allocObject();
          *(_QWORD *)(v40 + 16) = sub_235C716DC;
          *(_QWORD *)(v40 + 24) = v38;
          v95 = sub_235C71760;
          v96 = v40;
          aBlock = MEMORY[0x24BDAC760];
          v92 = 1107296256;
          v93 = sub_235C69A78;
          v94 = &block_descriptor_101;
          v41 = _Block_copy(&aBlock);
          v42 = v36;
          swift_release();
          v43 = objc_msgSend(v39, sel_initWithBuilder_, v41);
          _Block_release(v41);
          if (v43)
          {
            sub_235C6D154(v43);
            swift_release();
            swift_release();
            swift_release();
            swift_release();

            return;
          }
          if (qword_2542992E8 != -1)
            swift_once();
          v71 = sub_235CA3708();
          __swift_project_value_buffer(v71, (uint64_t)qword_254299660);
          v72 = v42;
          v73 = sub_235CA36FC();
          v74 = sub_235CA3930();
          v75 = v74;
          v86 = v73;
          if (os_log_type_enabled(v73, v74))
          {
            LODWORD(v85) = v75;
            v76 = (uint8_t *)swift_slowAlloc();
            v84 = swift_slowAlloc();
            aBlock = v84;
            v83 = v76;
            *(_DWORD *)v76 = 136315138;
            v82 = v76 + 4;
            v78 = *(_QWORD *)&v72[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId];
            v77 = *(_QWORD *)&v72[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId + 8];
            swift_bridgeObjectRetain();
            v90 = sub_235C944B8(v78, v77, &aBlock);
            sub_235CA3A14();

            swift_bridgeObjectRelease();
            v79 = v86;
            v80 = v83;
            _os_log_impl(&dword_235C5E000, v86, (os_log_type_t)v85, "Failed to create fabricated ContinuityEnd for request: %s", v83, 0xCu);
            v81 = v84;
            swift_arrayDestroy();
            MEMORY[0x23B7DE144](v81, -1, -1);
            MEMORY[0x23B7DE144](v80, -1, -1);
            swift_release();
            swift_release();
            swift_release();
            swift_release();

            return;
          }
          swift_release();
          swift_release();
          swift_release();
          swift_release();

        }
        else
        {
          swift_bridgeObjectRelease();
          if (qword_2542992E8 != -1)
            swift_once();
          v62 = sub_235CA3708();
          __swift_project_value_buffer(v62, (uint64_t)qword_254299660);
          v63 = v36;
          v64 = sub_235CA36FC();
          v65 = sub_235CA3930();
          if (os_log_type_enabled(v64, v65))
          {
            v86 = v64;
            v66 = (uint8_t *)swift_slowAlloc();
            v85 = swift_slowAlloc();
            aBlock = v85;
            *(_DWORD *)v66 = 136315138;
            v84 = (uint64_t)(v66 + 4);
            v67 = *(_QWORD *)&v63[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId];
            v68 = *(_QWORD *)&v63[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId + 8];
            swift_bridgeObjectRetain();
            v90 = sub_235C944B8(v67, v68, &aBlock);
            sub_235CA3A14();

            swift_bridgeObjectRelease();
            v69 = v86;
            _os_log_impl(&dword_235C5E000, v86, v65, "Failed to create fabricated TRPDetected for request: %s", v66, 0xCu);
            v70 = v85;
            swift_arrayDestroy();
            MEMORY[0x23B7DE144](v70, -1, -1);
            MEMORY[0x23B7DE144](v66, -1, -1);
            swift_release();
            swift_release();
            swift_release();

            return;
          }
          swift_release();
          swift_release();
          swift_release();

        }
      }
      else
      {
        swift_bridgeObjectRelease();
        if (qword_2542992E8 != -1)
          swift_once();
        v53 = sub_235CA3708();
        __swift_project_value_buffer(v53, (uint64_t)qword_254299660);
        v54 = v29;
        v55 = sub_235CA36FC();
        v56 = sub_235CA3930();
        if (os_log_type_enabled(v55, v56))
        {
          v87 = v55;
          v57 = swift_slowAlloc();
          v58 = swift_slowAlloc();
          aBlock = v58;
          *(_DWORD *)v57 = 136315138;
          v86 = (os_log_t)(v57 + 4);
          v60 = *(_QWORD *)&v54[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId];
          v59 = *(_QWORD *)&v54[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId + 8];
          swift_bridgeObjectRetain();
          v90 = sub_235C944B8(v60, v59, &aBlock);
          sub_235CA3A14();

          swift_bridgeObjectRelease();
          v61 = v87;
          _os_log_impl(&dword_235C5E000, v87, v56, "Failed to create fabricated TRPCandidate for request: %s", (uint8_t *)v57, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x23B7DE144](v58, -1, -1);
          MEMORY[0x23B7DE144](v57, -1, -1);
          swift_release();
          swift_release();

          return;
        }
        swift_release();
        swift_release();

      }
    }
    else
    {
      swift_bridgeObjectRelease();
      if (qword_2542992E8 != -1)
        swift_once();
      v48 = sub_235CA3708();
      __swift_project_value_buffer(v48, (uint64_t)qword_254299660);
      v49 = sub_235CA36FC();
      v50 = sub_235CA3930();
      if (os_log_type_enabled(v49, v50))
      {
        v51 = v23;
        v52 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v52 = 0;
        _os_log_impl(&dword_235C5E000, v49, v50, "Could not create fabricated TCUPackage", v52, 2u);
        MEMORY[0x23B7DE144](v52, -1, -1);
        swift_release();

        return;
      }
      swift_release();

    }
  }
  else
  {
    swift_bridgeObjectRelease();
    if (qword_2542992E8 != -1)
      swift_once();
    v44 = sub_235CA3708();
    __swift_project_value_buffer(v44, (uint64_t)qword_254299660);
    v45 = sub_235CA36FC();
    v46 = sub_235CA3930();
    if (os_log_type_enabled(v45, v46))
    {
      v47 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v47 = 0;
      _os_log_impl(&dword_235C5E000, v45, v46, "Failed to create speechPackage", v47, 2u);
      MEMORY[0x23B7DE144](v47, -1, -1);

      return;
    }

  }
}

void sub_235C70294(uint64_t a1, unint64_t a2)
{
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  os_log_type_t v16;
  uint8_t *v17;
  NSObject *v18;
  NSObject *oslog;

  v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE09348]), sel_init);
  v5 = objc_allocWithZone(MEMORY[0x24BE09318]);
  v6 = v4;
  v7 = objc_msgSend(v5, sel_init);
  oslog = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE09338]), sel_initWithRecognition_rawRecognition_audioAnalytics_isFinal_utteranceStart_, v6, v6, v7, 0, 0.0);

  if (oslog)
  {
    if (qword_2542992E8 != -1)
      swift_once();
    v8 = sub_235CA3708();
    __swift_project_value_buffer(v8, (uint64_t)qword_254299660);
    v9 = sub_235CA36FC();
    v10 = sub_235CA3924();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_235C5E000, v9, v10, "Calling delegate callback with fabricated SpeechPackage", v11, 2u);
      MEMORY[0x23B7DE144](v11, -1, -1);
    }

    sub_235C6DC88(a1, a2, 0, (uint64_t)oslog, 0.0);
    v12 = sub_235CA36FC();
    v13 = sub_235CA3924();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_235C5E000, v12, v13, "Calling delegate callback with accept for fabricated SpeechPackage", v14, 2u);
      MEMORY[0x23B7DE144](v14, -1, -1);
    }

    sub_235C6E2FC(a1, a2, 0, 0);
  }
  else
  {
    if (qword_2542992E8 != -1)
      swift_once();
    v15 = sub_235CA3708();
    __swift_project_value_buffer(v15, (uint64_t)qword_254299660);
    oslog = sub_235CA36FC();
    v16 = sub_235CA3930();
    if (!os_log_type_enabled(oslog, v16))
    {
      v18 = oslog;
      oslog = v6;
      goto LABEL_14;
    }
    v17 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v17 = 0;
    _os_log_impl(&dword_235C5E000, oslog, v16, "Failed to create speechPackage", v17, 2u);
    MEMORY[0x23B7DE144](v17, -1, -1);
  }
  v18 = v6;
LABEL_14:

}

void sub_235C70570(void *a1, uint64_t a2, uint64_t a3, void *a4, int a5, void *a6)
{
  char *v6;
  void *v7;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  unint64_t v16;
  BOOL v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint64_t v21;
  uint8_t *v22;
  void *v23;
  uint64_t v24;
  unint64_t v25;
  uint8_t *v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(char *, uint64_t, uint64_t);
  uint64_t v30;
  void (*v31)(char *, uint64_t);
  id v32;
  id v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  char *v37;
  id v38;
  uint64_t v39;
  NSObject *v40;
  os_log_type_t v41;
  uint8_t *v42;
  uint64_t v43;
  _QWORD *v44;
  id v45;
  NSObject *v46;
  os_log_type_t v47;
  uint64_t v48;
  uint8_t *v49;
  uint8_t *v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  char *v54;
  id v55;
  NSObject *v56;
  os_log_type_t v57;
  int v58;
  uint64_t v59;
  uint64_t v60;
  id v61;
  id v62;
  uint64_t v63;
  unint64_t v64;
  unint64_t v65;
  uint64_t v66;
  id v67;
  os_log_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  char *v72;
  char *v73;
  id v74;
  uint64_t v75;
  _QWORD v76[2];
  int v77;
  uint64_t v78;
  uint64_t v79;
  os_log_t v80;
  char *v81;
  unint64_t v82;
  uint64_t v83;
  uint64_t v84;
  id v85;
  void *v86;
  int v87;
  id v88;
  char v89;
  id v90;
  uint64_t v91;
  id v92;

  v7 = v6;
  v85 = a6;
  v86 = a4;
  v87 = a5;
  v11 = sub_235CA3564();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)v76 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3
    && ((v15 = *(_QWORD *)&v6[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId],
         v16 = *(_QWORD *)&v6[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId + 8],
         v15 == a2)
      ? (v17 = v16 == a3)
      : (v17 = 0),
        v17 || (sub_235CA3B88() & 1) != 0))
  {
    v83 = v15;
    v84 = a2;
    v82 = v16;
    if (qword_2542992E8 != -1)
      swift_once();
    v18 = sub_235CA3708();
    v80 = (os_log_t)__swift_project_value_buffer(v18, (uint64_t)qword_254299660);
    v19 = sub_235CA36FC();
    v20 = sub_235CA3924();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = swift_slowAlloc();
      v78 = a3;
      v22 = (uint8_t *)v21;
      v23 = (void *)swift_slowAlloc();
      v81 = v14;
      v79 = v11;
      *(_DWORD *)v22 = 136315138;
      v92 = v23;
      v88 = v86;
      v89 = v87 & 1;
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542993D0);
      v24 = sub_235CA39FC();
      v88 = (id)sub_235C944B8(v24, v25, (uint64_t *)&v92);
      v11 = v79;
      v14 = v81;
      sub_235CA3A14();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_235C5E000, v19, v20, "Received didCompletionRecognitionWithStatistics with endpointMode: %s", v22, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B7DE144](v23, -1, -1);
      v26 = v22;
      a3 = v78;
      MEMORY[0x23B7DE144](v26, -1, -1);
    }

    v27 = v84;
    sub_235C60480(a1, 0);
    if (qword_2542989C0 != -1)
      swift_once();
    v28 = __swift_project_value_buffer(v11, (uint64_t)qword_254299648);
    v29 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
    v29(v14, v28, v11);
    v30 = swift_allocObject();
    *(_QWORD *)(v30 + 16) = v86;
    *(_BYTE *)(v30 + 24) = v87 & 1;
    *(_QWORD *)(v30 + 32) = v7;
    *(_QWORD *)(v30 + 40) = v27;
    *(_QWORD *)(v30 + 48) = a3;
    v81 = v7;
    swift_bridgeObjectRetain();
    sub_235CA3540();
    swift_release();
    v31 = *(void (**)(char *, uint64_t))(v12 + 8);
    v31(v14, v11);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2542994A8);
    if (v85)
    {
      v88 = v85;
      v32 = v85;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2542994A0);
      sub_235C71624(0, &qword_2542993F8);
      if (swift_dynamicCast())
      {
        v33 = v92;
        if (objc_msgSend(v92, sel_code) == (id)1110)
        {
          v29(v14, v28, v11);
          v34 = swift_allocObject();
          v35 = v81;
          v36 = v84;
          *(_QWORD *)(v34 + 16) = v81;
          *(_QWORD *)(v34 + 24) = v36;
          *(_QWORD *)(v34 + 32) = a3;
          *(_QWORD *)(v34 + 40) = v33;
          *(_QWORD *)(v34 + 48) = v86;
          *(_BYTE *)(v34 + 56) = v87 & 1;
          v37 = v35;
          swift_bridgeObjectRetain();
          v38 = v33;
          sub_235CA354C();
          swift_release();
          v31(v14, v11);
          if (v37[OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_isMedocEnabled] == 1)
            sub_235C6F600();
          else
            sub_235C70294(v83, v82);
        }
        else if (objc_msgSend(v33, sel_code) == (id)1101 || objc_msgSend(v33, sel_code) == (id)1107)
        {
          v46 = sub_235CA36FC();
          v47 = sub_235CA3930();
          if (os_log_type_enabled(v46, v47))
          {
            v48 = v11;
            v49 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)v49 = 0;
            _os_log_impl(&dword_235C5E000, v46, v47, "embeddedspeech probably crashed, failing current request", v49, 2u);
            v50 = v49;
            v11 = v48;
            MEMORY[0x23B7DE144](v50, -1, -1);
          }

          v29(v14, v28, v11);
          v51 = swift_allocObject();
          v52 = v81;
          v53 = v84;
          *(_QWORD *)(v51 + 16) = v81;
          *(_QWORD *)(v51 + 24) = v53;
          *(_QWORD *)(v51 + 32) = a3;
          *(_QWORD *)(v51 + 40) = v33;
          *(_QWORD *)(v51 + 48) = v86;
          *(_BYTE *)(v51 + 56) = v87 & 1;
          v52;
          swift_bridgeObjectRetain();
          v54 = v14;
          v55 = v33;
          sub_235CA354C();
          swift_release();
          v31(v54, v11);
          sub_235C68758(v83, v82, v55);
        }
        else
        {
          v85 = v33;
          v56 = sub_235CA36FC();
          v57 = sub_235CA3930();
          v58 = v57;
          v80 = v56;
          if (os_log_type_enabled(v56, v57))
          {
            v59 = swift_slowAlloc();
            v79 = v11;
            v60 = v59;
            v78 = swift_slowAlloc();
            v91 = v78;
            *(_DWORD *)v60 = 134218242;
            v77 = v58;
            v61 = v85;
            v90 = objc_msgSend(v85, sel_code);
            v76[1] = &v91;
            sub_235CA3A14();
            *(_WORD *)(v60 + 12) = 2080;
            v62 = objc_msgSend(v61, sel_description, v60 + 14);
            v63 = sub_235CA37EC();
            v65 = v64;

            v66 = v63;
            v67 = v85;
            v90 = (id)sub_235C944B8(v66, v65, &v91);
            sub_235CA3A14();

            swift_bridgeObjectRelease();
            v68 = v80;
            _os_log_impl(&dword_235C5E000, v80, (os_log_type_t)v77, "Received ASR error %ld %s but not taking any action", (uint8_t *)v60, 0x16u);
            v69 = v78;
            swift_arrayDestroy();
            MEMORY[0x23B7DE144](v69, -1, -1);
            v70 = v60;
            v11 = v79;
            MEMORY[0x23B7DE144](v70, -1, -1);

          }
          else
          {

            v67 = v85;
          }
          v29(v14, v28, v11);
          v71 = swift_allocObject();
          v72 = v81;
          *(_QWORD *)(v71 + 16) = v67;
          *(_QWORD *)(v71 + 24) = v72;
          *(_QWORD *)(v71 + 32) = v84;
          *(_QWORD *)(v71 + 40) = a3;
          *(_QWORD *)(v71 + 48) = v86;
          *(_BYTE *)(v71 + 56) = v87 & 1;
          v73 = v72;
          swift_bridgeObjectRetain();
          v74 = v67;
          sub_235CA354C();
          swift_release();
          v31(v14, v11);
        }
        v75 = (uint64_t)objc_msgSend(v33, sel_code);
        if (v75 < (uint64_t)0xFFFFFFFF80000000)
        {
          __break(1u);
        }
        else if (v75 <= 0x7FFFFFFF)
        {
          sub_235C71C90(v75);

          return;
        }
        __break(1u);
      }
      sub_235CA3B7C();
      __break(1u);
    }
  }
  else
  {
    if (qword_2542992E8 != -1)
      swift_once();
    v39 = sub_235CA3708();
    __swift_project_value_buffer(v39, (uint64_t)qword_254299660);
    v40 = sub_235CA36FC();
    v41 = sub_235CA3930();
    if (os_log_type_enabled(v40, v41))
    {
      v42 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v42 = 0;
      _os_log_impl(&dword_235C5E000, v40, v41, "Response requestId does not match current requestId", v42, 2u);
      MEMORY[0x23B7DE144](v42, -1, -1);
    }

    if (qword_2542989C0 != -1)
      swift_once();
    v43 = __swift_project_value_buffer(v11, (uint64_t)qword_254299648);
    (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, v43, v11);
    v44 = (_QWORD *)swift_allocObject();
    v44[2] = a2;
    v44[3] = a3;
    v44[4] = v7;
    swift_bridgeObjectRetain();
    v45 = v7;
    sub_235CA354C();
    swift_release();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
}

uint64_t sub_235C70EF8()
{
  return objectdestroy_52Tm();
}

uint64_t sub_235C70F00()
{
  uint64_t *v0;

  return sub_235C67498(v0[2], v0[3], v0[4]);
}

uint64_t sub_235C70F0C()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_235C70F38()
{
  uint64_t v0;

  return sub_235C67824(*(_QWORD *)(v0 + 16), *(_BYTE *)(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48));
}

uint64_t sub_235C70F4C()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_235C70F80()
{
  uint64_t v0;

  return sub_235C67FD4(*(void **)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40), *(void **)(v0 + 48), *(unsigned __int8 *)(v0 + 56));
}

uint64_t sub_235C70F98()
{
  return sub_235C71008(0xD000000000000038, 0x8000000235CA5810);
}

uint64_t objectdestroy_61Tm()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_235C70FEC()
{
  return sub_235C71008(0xD000000000000029, 0x8000000235CA57E0);
}

uint64_t sub_235C71008(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_235C67BC0(*(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32), *(void **)(v2 + 40), *(void **)(v2 + 48), *(unsigned __int8 *)(v2 + 56), a1, a2);
}

uint64_t sub_235C71034()
{
  return objectdestroy_67Tm();
}

id sub_235C7103C(void *a1)
{
  uint64_t *v1;

  return sub_235C684CC(a1, v1[2], v1[3], v1[4], v1[5], v1[6]);
}

uint64_t sub_235C7104C()
{
  return swift_deallocObject();
}

uint64_t sub_235C7105C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_235C7107C()
{
  return objectdestroy_67Tm();
}

uint64_t objectdestroy_67Tm()
{
  uint64_t v0;

  swift_bridgeObjectRelease();

  return swift_deallocObject();
}

void sub_235C710C4(void *a1)
{
  uint64_t v1;

  sub_235C685A4(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(void **)(v1 + 40));
}

uint64_t sub_235C710D0()
{
  return swift_deallocObject();
}

uint64_t sub_235C710E0()
{
  return objectdestroy_52Tm();
}

void sub_235C710E8(void *a1)
{
  sub_235C686C4(a1);
}

uint64_t sub_235C71104()
{
  return swift_deallocObject();
}

uint64_t sub_235C71114()
{
  return objectdestroy_52Tm();
}

uint64_t sub_235C7111C()
{
  return swift_deallocObject();
}

uint64_t objectdestroy_43Tm()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v1 = sub_235CA36F0();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (((*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_235C711BC(uint64_t a1)
{
  return sub_235C711C8(a1, (uint64_t (*)(uint64_t, unint64_t, _QWORD, _QWORD))sub_235C630DC);
}

uint64_t sub_235C711C8(uint64_t a1, uint64_t (*a2)(uint64_t, unint64_t, _QWORD, _QWORD))
{
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v4 = *(_QWORD *)(sub_235CA36F0() - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = (*(_QWORD *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8;
  return a2(a1, v2 + v5, *(_QWORD *)(v2 + v6), *(_QWORD *)(v2 + ((v6 + 15) & 0xFFFFFFFFFFFFF8)));
}

uint64_t sub_235C71234()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_235C71260()
{
  uint64_t v0;

  return sub_235C63D74(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_235C71268(uint64_t a1)
{
  uint64_t v1;

  return sub_235C644A0(a1, *(_QWORD *)(v1 + 16), *(void **)(v1 + 24));
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_235C71294()
{
  uint64_t v0;

  return sub_235C62D20(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24), 0xD00000000000002ELL, 0x8000000235CA51A0, (SEL *)&selRef_lastTRPCandidateId);
}

uint64_t sub_235C712CC(uint64_t a1)
{
  uint64_t v1;

  return sub_235C640C8(a1, *(_QWORD *)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t sub_235C712D4(uint64_t a1)
{
  uint64_t v1;

  return sub_235C642B4(a1, *(_QWORD *)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t sub_235C712DC(uint64_t a1)
{
  uint64_t v1;

  return sub_235C61DE4(a1, *(_QWORD *)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t sub_235C712E4()
{
  uint64_t v0;

  return sub_235C62D20(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24), 0xD00000000000001BLL, 0x8000000235CA5180, (SEL *)&selRef_lastTRPCandidateId);
}

uint64_t sub_235C7131C(__int128 *a1, uint64_t a2)
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

uint64_t sub_235C71334(uint64_t a1)
{
  uint64_t v1;

  return sub_235C62A94(a1, *(_QWORD *)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t sub_235C71340()
{
  uint64_t v0;

  return sub_235C62D20(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24), 0xD000000000000018, 0x8000000235CA51D0, (SEL *)&selRef_trpCandidateId);
}

uint64_t sub_235C71378(uint64_t a1)
{
  uint64_t v1;

  return sub_235C6257C(a1, *(_QWORD *)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t sub_235C71384(uint64_t a1)
{
  uint64_t v1;

  return sub_235C62808(a1, *(_QWORD *)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t sub_235C71390(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_235C713D8()
{
  uint64_t *v0;

  return sub_235C64DD0(v0[2], v0[3], v0[4], v0[5], 0x8000000235CA5090);
}

uint64_t sub_235C71404()
{
  return objectdestroy_52Tm();
}

uint64_t objectdestroy_52Tm()
{
  uint64_t v0;

  swift_bridgeObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_235C71444()
{
  uint64_t *v0;

  return sub_235C65100(v0[2], v0[3], v0[4], v0[5]);
}

uint64_t sub_235C71450(uint64_t a1)
{
  uint64_t v1;

  return sub_235C65A28(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_235C71474()
{
  uint64_t *v0;

  return sub_235C654DC(v0[2], v0[3], v0[4], v0[5]);
}

uint64_t sub_235C71480(uint64_t a1)
{
  uint64_t v1;

  return sub_235C65840(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(unsigned __int8 *)(v1 + 40), *(void **)(v1 + 48));
}

uint64_t sub_235C71494()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_235C714B8()
{
  return sub_235C648C0();
}

uint64_t sub_235C714C4(uint64_t a1)
{
  uint64_t v1;

  return sub_235C64AD8(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(void **)(v1 + 40));
}

uint64_t objectdestroy_119Tm()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_235C71500()
{
  uint64_t *v0;

  return sub_235C64DD0(v0[2], v0[3], v0[4], v0[5], 0x8000000235CA5040);
}

unint64_t sub_235C7152C()
{
  unint64_t result;

  result = qword_254299340;
  if (!qword_254299340)
  {
    result = MEMORY[0x23B7DE090](MEMORY[0x24BEE17B0], MEMORY[0x24BEE1768]);
    atomic_store(result, (unint64_t *)&qword_254299340);
  }
  return result;
}

id sub_235C71570(uint64_t a1)
{
  uint64_t v1;

  return sub_235C6701C(a1, *(_QWORD *)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t sub_235C71578(uint64_t a1)
{
  uint64_t v1;

  return sub_235C66E6C(a1, *(_QWORD *)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t sub_235C71580()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_235C715A4(uint64_t a1, void *a2)
{
  uint64_t v2;

  sub_235C66AFC(a1, a2, *(void **)(v2 + 16));
}

uint64_t sub_235C715AC(uint64_t a1)
{
  uint64_t v1;

  return sub_235C646F0(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_235C715B4(uint64_t a1)
{
  uint64_t v1;

  return sub_235C6228C(a1, *(_QWORD *)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t sub_235C715C0(uint64_t a1)
{
  uint64_t *v1;

  return sub_235C62034(a1, v1[2], v1[3], v1[4], v1[5], v1[6]);
}

uint64_t sub_235C715D0()
{
  uint64_t v0;

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_235C7160C()
{
  uint64_t v0;

  sub_235C60DB0(*(id *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 56));
}

uint64_t sub_235C7161C(uint64_t a1)
{
  uint64_t v1;

  return sub_235C61880(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_235C71624(uint64_t a1, unint64_t *a2)
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

void type metadata accessor for AFSpeechEvent(uint64_t a1)
{
  sub_235C71698(a1, (unint64_t *)&unk_2563772D0);
}

void type metadata accessor for AFEndpointMode(uint64_t a1)
{
  sub_235C71698(a1, &qword_2542989F8);
}

void type metadata accessor for LBLocalSpeechRecognizerStopReason(uint64_t a1)
{
  sub_235C71698(a1, (unint64_t *)&unk_2563772E0);
}

void sub_235C71698(uint64_t a1, unint64_t *a2)
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

uint64_t sub_235C7176C()
{
  uint64_t v0;
  uint64_t result;

  type metadata accessor for ASRBridgeInstrumentationUtil();
  v0 = swift_allocObject();
  *(_QWORD *)(v0 + 16) = objc_msgSend((id)objc_opt_self(), sel_sharedStream);
  sub_235CA3654();
  swift_allocObject();
  result = sub_235CA3648();
  *(_QWORD *)(v0 + 24) = result;
  qword_2542994C0 = v0;
  return result;
}

void sub_235C717E4(unint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254299050);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE95630]), sel_init);
  if (v19)
  {
    if (a1 > 6)
      v7 = 0;
    else
      v7 = dword_235CA459C[a1];
    objc_msgSend(v19, sel_setTaskType_, v7);
  }
  v18 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE95618]), sel_init);
  objc_msgSend(v18, sel_setStartedOrChanged_, v19);
  v8 = (void *)sub_235CA3630();
  if (v8)
  {
    v9 = v8;
    objc_msgSend(v8, sel_setAsrBridgeContext_, v18);
    objc_msgSend(*(id *)(v2 + 16), sel_emitMessage_, v9);
    v10 = (void *)sub_235CA3618();
    if (v10
      && (v11 = v10,
          v12 = objc_msgSend(v10, sel_captureSnapshot),
          v11,
          v12))
    {
      v13 = objc_msgSend((id)objc_opt_self(), sel_context);
      if (v13)
      {
        v14 = v13;
        sub_235CA2754();
        v15 = sub_235CA2790();
        v16 = *(_QWORD *)(v15 - 8);
        v17 = 0;
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v6, 1, v15) != 1)
        {
          v17 = (void *)sub_235CA276C();
          (*(void (**)(char *, uint64_t))(v16 + 8))(v6, v15);
        }
        objc_msgSend(v12, sel_logWithEventContext_requestIdentifier_, v14, v17);

      }
      else
      {
        __break(1u);
      }
    }
    else
    {

    }
  }
  else
  {

  }
}

void sub_235C71A48()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_254299050);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE95620]), sel_init);
  if (v15)
    objc_msgSend(v15, sel_setExists_, 1);
  v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE95618]), sel_init);
  objc_msgSend(v14, sel_setEnded_, v15);
  v4 = (void *)sub_235CA3630();
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v4, sel_setAsrBridgeContext_, v14);
    objc_msgSend(*(id *)(v0 + 16), sel_emitMessage_, v5);
    v6 = (void *)sub_235CA3618();
    if (v6
      && (v7 = v6, v8 = objc_msgSend(v6, sel_captureSnapshot), v7, v8))
    {
      v9 = objc_msgSend((id)objc_opt_self(), sel_context);
      if (v9)
      {
        v10 = v9;
        sub_235CA2754();
        v11 = sub_235CA2790();
        v12 = *(_QWORD *)(v11 - 8);
        v13 = 0;
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v3, 1, v11) != 1)
        {
          v13 = (void *)sub_235CA276C();
          (*(void (**)(char *, uint64_t))(v12 + 8))(v3, v11);
        }
        objc_msgSend(v8, sel_logWithEventContext_requestIdentifier_, v10, v13);

      }
      else
      {
        __break(1u);
      }
    }
    else
    {

    }
  }
  else
  {

  }
}

void sub_235C71C90(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254299050);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE95628]), sel_init);
  objc_msgSend(v18, sel_setError_, a1);
  v17 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE95618]), sel_init);
  objc_msgSend(v17, sel_setFailed_, v18);
  v7 = (void *)sub_235CA3630();
  if (v7)
  {
    v8 = v7;
    objc_msgSend(v7, sel_setAsrBridgeContext_, v17);
    objc_msgSend(*(id *)(v2 + 16), sel_emitMessage_, v8);
    v9 = (void *)sub_235CA3618();
    if (v9
      && (v10 = v9,
          v11 = objc_msgSend(v9, sel_captureSnapshot),
          v10,
          v11))
    {
      v12 = objc_msgSend((id)objc_opt_self(), sel_context);
      if (v12)
      {
        v13 = v12;
        sub_235CA2754();
        v14 = sub_235CA2790();
        v15 = *(_QWORD *)(v14 - 8);
        v16 = 0;
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v6, 1, v14) != 1)
        {
          v16 = (void *)sub_235CA276C();
          (*(void (**)(char *, uint64_t))(v15 + 8))(v6, v14);
        }
        objc_msgSend(v11, sel_logWithEventContext_requestIdentifier_, v13, v16);

      }
      else
      {
        __break(1u);
      }
    }
    else
    {

    }
  }
  else
  {

  }
}

void sub_235C71ED4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_235C71F34(a1, a2, a3, a4, (Class *)0x24BE956E8, 1, (SEL *)&selRef_setResultCandidate_);
}

void sub_235C71EEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_235C71F34(a1, a2, a3, a4, (Class *)0x24BE956F0, 0, (SEL *)&selRef_setResultSelected_);
}

void sub_235C71F04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_235C71F34(a1, a2, a3, a4, (Class *)0x24BE95688, 1, (SEL *)&selRef_setMultiUserResultCandidate_);
}

void sub_235C71F1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_235C71F34(a1, a2, a3, a4, (Class *)0x24BE95690, 0, (SEL *)&selRef_setMultiUserResultSelected_);
}

void sub_235C71F34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, Class *a5, uint64_t a6, SEL *a7)
{
  uint64_t v7;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v9 = v7;
  v13 = objc_msgSend(objc_allocWithZone(*a5), sel_init);
  if (v13)
    objc_msgSend(v13, sel_setExists_, 1);
  v10 = (void *)sub_235CA3630();
  if (v10)
  {
    v11 = v10;
    objc_msgSend(v10, *a7, v13);
    objc_msgSend(*(id *)(v9 + 16), sel_emitMessage_, v11);

    v12 = v11;
  }
  else
  {
    v12 = v13;
  }

}

void sub_235C72010()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  id v7;

  v1 = v0;
  v2 = sub_235CA3624();
  if (v2)
  {
    v3 = (void *)v2;
    v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE95700]), sel_init);
    v7 = v4;
    if (v4)
    {
      v5 = v4;
      v6 = (void *)sub_235CA363C();
      objc_msgSend(v5, sel_setTrpId_, v6);

      v4 = v7;
    }
    objc_msgSend(v3, sel_setTrpCandidateReceived_, v4);
    objc_msgSend(*(id *)(v1 + 16), sel_emitMessage_, v3);

  }
}

uint64_t sub_235C72104()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ASRBridgeInstrumentationUtil()
{
  return objc_opt_self();
}

id sub_235C72150()
{
  id result;

  result = objc_msgSend((id)objc_opt_self(), sel_sharedMonitor);
  qword_256377BC0 = (uint64_t)result;
  return result;
}

double sub_235C72188()
{
  double result;

  result = 0.0;
  xmmword_254299530 = 0u;
  unk_254299540 = 0u;
  return result;
}

id sub_235C7219C()
{
  id result;

  result = objc_msgSend((id)objc_opt_self(), sel_isSCDAFrameworkEnabled);
  byte_254299550 = (char)result;
  return result;
}

uint64_t sub_235C721CC(uint64_t a1, uint64_t a2)
{
  void (*v3)(uint64_t);

  v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

uint64_t sub_235C72208()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for MyriadDecisionMonitor()
{
  return objc_opt_self();
}

void sub_235C72238(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id aBlock;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void *v17;
  uint64_t (*v18)();
  uint64_t v19;

  if (qword_254299230 != -1)
    swift_once();
  if (byte_254299550 == 1)
  {
    v7 = objc_msgSend((id)objc_opt_self(), sel_sharedMonitor);
    if (a2)
      a2 = (void *)sub_235CA37E0();
    v8 = swift_allocObject();
    *(_QWORD *)(v8 + 16) = a3;
    *(_QWORD *)(v8 + 24) = a4;
    v18 = sub_235C71760;
    v19 = v8;
    aBlock = (id)MEMORY[0x24BDAC760];
    v15 = 1107296256;
    v16 = sub_235C721CC;
    v17 = &block_descriptor_6;
    v9 = _Block_copy(&aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v7, sel_waitForMyriadDecisionForReason_withCompletion_, a2, v9);
    _Block_release(v9);

    if (qword_254299228 != -1)
      swift_once();
    v17 = (void *)sub_235C72508();
    aBlock = v7;
    swift_beginAccess();
    v10 = v7;
    sub_235C72544((uint64_t)&aBlock, (uint64_t)&xmmword_254299530);
    swift_endAccess();

  }
  else
  {
    if (qword_256376FF0 != -1)
      swift_once();
    v11 = (void *)qword_256377BC0;
    if (a2)
      a2 = (void *)sub_235CA37E0();
    v12 = swift_allocObject();
    *(_QWORD *)(v12 + 16) = a3;
    *(_QWORD *)(v12 + 24) = a4;
    v18 = sub_235C7105C;
    v19 = v12;
    aBlock = (id)MEMORY[0x24BDAC760];
    v15 = 1107296256;
    v16 = sub_235C721CC;
    v17 = &block_descriptor_0;
    v13 = _Block_copy(&aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v11, sel_waitForMyriadDecisionForReason_withCompletion_, a2, v13);
    _Block_release(v13);

  }
}

uint64_t sub_235C724CC()
{
  swift_release();
  return swift_deallocObject();
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

unint64_t sub_235C72508()
{
  unint64_t result;

  result = qword_2542993A0;
  if (!qword_2542993A0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2542993A0);
  }
  return result;
}

uint64_t sub_235C72544(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542994B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

const char *IdentityFeatureFlags.domain.getter()
{
  return "Siri";
}

const char *IdentityFeatureFlags.feature.getter()
{
  _BYTE *v0;

  if (*v0)
    return "is_identity_score_consumption_enabled";
  else
    return "is_identity_bridge_instrumentation_enabled";
}

BOOL static IdentityFeatureFlags.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t IdentityFeatureFlags.hash(into:)()
{
  return sub_235CA3BDC();
}

uint64_t IdentityFeatureFlags.hashValue.getter()
{
  sub_235CA3BD0();
  sub_235CA3BDC();
  return sub_235CA3BE8();
}

BOOL sub_235C72660(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_235C72678()
{
  sub_235CA3BD0();
  sub_235CA3BDC();
  return sub_235CA3BE8();
}

uint64_t sub_235C726BC()
{
  return sub_235CA3BDC();
}

uint64_t sub_235C726E4()
{
  sub_235CA3BD0();
  sub_235CA3BDC();
  return sub_235CA3BE8();
}

unint64_t sub_235C72728()
{
  unint64_t result;

  result = qword_2563773B0;
  if (!qword_2563773B0)
  {
    result = MEMORY[0x23B7DE090](&protocol conformance descriptor for IdentityFeatureFlags, &type metadata for IdentityFeatureFlags);
    atomic_store(result, (unint64_t *)&qword_2563773B0);
  }
  return result;
}

const char *sub_235C7276C()
{
  return "Siri";
}

const char *sub_235C72780()
{
  _BYTE *v0;

  if (*v0)
    return "is_identity_score_consumption_enabled";
  else
    return "is_identity_bridge_instrumentation_enabled";
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for IdentityFeatureFlags(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for IdentityFeatureFlags(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_235C7289C + 4 * byte_235CA4615[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_235C728D0 + 4 * byte_235CA4610[v4]))();
}

uint64_t sub_235C728D0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_235C728D8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x235C728E0);
  return result;
}

uint64_t sub_235C728EC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x235C728F4);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_235C728F8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_235C72900(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_235C7290C(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_235C72918(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for IdentityFeatureFlags()
{
  return &type metadata for IdentityFeatureFlags;
}

uint64_t sub_235C72934()
{
  uint64_t result;

  result = AFIsHorseman();
  byte_2542994B8 = result;
  return result;
}

id sub_235C72950()
{
  id result;

  result = objc_msgSend((id)objc_opt_self(), sel_sharedPreferences);
  qword_254299558 = (uint64_t)result;
  return result;
}

uint64_t sub_235C72988@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
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
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t result;
  unint64_t v23;
  _QWORD *v24;
  __int128 v25;
  char *v26;
  char *v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  void (*v42)(char *, unint64_t, uint64_t);
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  _QWORD *v49;
  uint64_t v50;
  NSObject *v51;
  os_log_type_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  _QWORD v59[2];
  uint64_t *v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  __int128 v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  char *v72;
  unint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  char *v78;
  char *v79;
  uint64_t v80;
  uint64_t v81;
  char *v82;
  uint64_t v83;
  uint64_t v84;
  unint64_t v85;
  uint64_t v86;
  uint64_t v87;
  void (*v88)(char *, unint64_t, uint64_t);
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  char *v92;
  uint64_t v93;
  uint64_t v94;
  char *v95;
  uint64_t v96;
  _QWORD *v97;

  v3 = v2;
  v6 = sub_235CA34BC();
  v93 = *(_QWORD *)(v6 - 8);
  v94 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v92 = (char *)v59 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_235CA27C0();
  v96 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v95 = (char *)v59 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_235CA27D8();
  v83 = *(_QWORD *)(v10 - 8);
  v84 = v10;
  MEMORY[0x24BDAC7A8](v10);
  v82 = (char *)v59 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_235CA282C();
  v80 = *(_QWORD *)(v12 - 8);
  v81 = v12;
  MEMORY[0x24BDAC7A8](v12);
  v79 = (char *)v59 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_235CA27FC();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)v59 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v67 = sub_235CA28BC();
  v66 = *(_QWORD *)(v67 - 8);
  MEMORY[0x24BDAC7A8](v67);
  v65 = (char *)v59 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v74 = sub_235CA28A4();
  v75 = *(_QWORD *)(v74 - 8);
  MEMORY[0x24BDAC7A8](v74);
  v72 = (char *)v59 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = *a1;
  v20 = a1[1];
  if (!*a1)
  {
    v97 = (_QWORD *)MEMORY[0x24BEE4AF8];
    v56 = swift_bridgeObjectRetain();
    result = sub_235C74754(v56);
    v57 = (uint64_t)v97;
LABEL_33:
    *a2 = v57;
    return result;
  }
  v71 = *(_QWORD *)(v21 + 16);
  v61 = v3;
  v60 = a2;
  v59[1] = v20;
  if (!v71)
  {
    v24 = (_QWORD *)MEMORY[0x24BEE4AF8];
LABEL_32:
    v97 = v24;
    v58 = swift_bridgeObjectRetain();
    result = sub_235C74754(v58);
    v57 = (uint64_t)v97;
    a2 = v60;
    goto LABEL_33;
  }
  v69 = v21 + ((*(unsigned __int8 *)(v75 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v75 + 80));
  result = swift_bridgeObjectRetain();
  v23 = 0;
  v24 = (_QWORD *)MEMORY[0x24BEE4AF8];
  *(_QWORD *)&v25 = 136315138;
  v64 = v25;
  v63 = 0x8000000235CA5A50;
  v62 = MEMORY[0x24BEE4AD8] + 8;
  v91 = v8;
  v26 = v95;
  v77 = v15;
  v27 = v72;
  v76 = v14;
  v78 = v17;
  v70 = v21;
  while (v23 < *(_QWORD *)(v21 + 16))
  {
    v28 = *(_QWORD *)(v75 + 72);
    v73 = v23;
    (*(void (**)(char *, unint64_t, uint64_t))(v75 + 16))(v27, v69 + v28 * v23, v74);
    if ((sub_235CA2868() & 1) != 0)
    {
      v29 = v65;
      sub_235CA2850();
      v30 = sub_235CA28B0();
      (*(void (**)(char *, uint64_t))(v66 + 8))(v29, v67);
      v31 = *(_QWORD *)(v30 + 16);
      if (v31)
      {
        v32 = v30 + ((*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80));
        v68 = v30;
        swift_bridgeObjectRetain();
        v33 = 0;
        v34 = *(_QWORD *)(v15 + 72);
        v88 = *(void (**)(char *, unint64_t, uint64_t))(v15 + 16);
        v89 = v34;
        v85 = v32;
        v86 = v31;
        do
        {
          v90 = v33;
          v88(v17, v32 + v89 * v33, v14);
          if ((sub_235CA27E4() & 1) != 0)
          {
            v35 = v79;
            sub_235CA27F0();
            v36 = v82;
            sub_235CA2820();
            (*(void (**)(char *, uint64_t))(v80 + 8))(v35, v81);
            v37 = sub_235CA27CC();
            (*(void (**)(char *, uint64_t))(v83 + 8))(v36, v84);
            v38 = *(_QWORD *)(v37 + 16);
            if (v38)
            {
              v39 = v96;
              v40 = v37 + ((*(unsigned __int8 *)(v96 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v96 + 80));
              v87 = v37;
              swift_bridgeObjectRetain();
              v41 = *(_QWORD *)(v39 + 72);
              v42 = *(void (**)(char *, unint64_t, uint64_t))(v39 + 16);
              do
              {
                v42(v26, v40, v8);
                v43 = v92;
                sub_235CA27B4();
                v44 = sub_235CA34B0();
                v46 = v45;
                (*(void (**)(char *, uint64_t))(v93 + 8))(v43, v94);
                if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
                  v24 = sub_235C74648(0, v24[2] + 1, 1, v24);
                v48 = v24[2];
                v47 = v24[3];
                if (v48 >= v47 >> 1)
                  v24 = sub_235C74648((_QWORD *)(v47 > 1), v48 + 1, 1, v24);
                v24[2] = v48 + 1;
                v49 = &v24[2 * v48];
                v49[4] = v44;
                v49[5] = v46;
                v26 = v95;
                v8 = v91;
                (*(void (**)(char *, uint64_t))(v96 + 8))(v95, v91);
                v40 += v41;
                --v38;
              }
              while (v38);
              swift_bridgeObjectRelease_n();
              v14 = v76;
              v15 = v77;
            }
            else
            {
              swift_bridgeObjectRelease();
            }
            v17 = v78;
            v32 = v85;
            v31 = v86;
          }
          v33 = v90 + 1;
          (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
        }
        while (v33 != v31);
        swift_bridgeObjectRelease_n();
      }
      else
      {
        swift_bridgeObjectRelease();
      }
      v27 = v72;
      result = (*(uint64_t (**)(char *, uint64_t))(v75 + 8))(v72, v74);
    }
    else
    {
      if (qword_2542992E8 != -1)
        swift_once();
      v50 = sub_235CA3708();
      __swift_project_value_buffer(v50, (uint64_t)qword_254299660);
      v51 = sub_235CA36FC();
      v52 = sub_235CA3924();
      if (os_log_type_enabled(v51, v52))
      {
        v53 = swift_slowAlloc();
        v54 = swift_slowAlloc();
        v97 = (_QWORD *)v54;
        *(_DWORD *)v53 = v64;
        *(_QWORD *)(v53 + 4) = sub_235C944B8(0xD000000000000021, v63, (uint64_t *)&v97);
        _os_log_impl(&dword_235C5E000, v51, v52, "Not updating jitProfile for SDA: %s", (uint8_t *)v53, 0xCu);
        swift_arrayDestroy();
        v55 = v54;
        v15 = v77;
        MEMORY[0x23B7DE144](v55, -1, -1);
        MEMORY[0x23B7DE144](v53, -1, -1);
      }

      v27 = v72;
      result = (*(uint64_t (**)(char *, uint64_t))(v75 + 8))(v72, v74);
      v26 = v95;
    }
    v23 = v73 + 1;
    v21 = v70;
    if (v73 + 1 == v71)
    {
      swift_bridgeObjectRelease();
      goto LABEL_32;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_235C730E4()
{
  uint64_t v0;

  v0 = sub_235CA3720();
  __swift_allocate_value_buffer(v0, qword_254299560);
  *(_QWORD *)__swift_project_value_buffer(v0, (uint64_t)qword_254299560) = 50;
  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 - 8) + 104))();
}

uint64_t sub_235C73144(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void (*v3)(uint64_t);

  v2 = a2;
  v3 = *(void (**)(uint64_t))(a1 + 32);
  if (a2)
  {
    sub_235C76AC4();
    v2 = sub_235CA38B8();
  }
  swift_retain();
  v3(v2);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_235C731A4(unint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t (*a5)(BOOL))
{
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char v19;
  id v20;
  id v21;
  unsigned __int8 v22;
  id v23;
  uint64_t v24;
  _BOOL4 v25;
  NSObject *v26;
  os_log_type_t v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32[3];
  uint64_t v33;
  BOOL v34;

  if (!a1)
    goto LABEL_17;
  v9 = a1 & 0xFFFFFFFFFFFFFF8;
  if (!(a1 >> 62))
  {
    v10 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v10)
      goto LABEL_4;
    goto LABEL_16;
  }
  swift_bridgeObjectRetain();
  result = sub_235CA3AF8();
  if (!result)
  {
LABEL_16:
    swift_bridgeObjectRelease();
LABEL_17:
    v30 = 0u;
    v31 = 0u;
    goto LABEL_18;
  }
LABEL_4:
  if ((a1 & 0xC000000000000001) != 0)
  {
    v12 = (id)MEMORY[0x23B7DDB44](0, a1);
  }
  else
  {
    if (!*(_QWORD *)(v9 + 16))
    {
      __break(1u);
      return result;
    }
    v12 = *(id *)(a1 + 32);
  }
  v13 = v12;
  swift_bridgeObjectRelease();
  v14 = objc_msgSend(v13, sel_serializedContextByKey);

  if (!v14)
    goto LABEL_17;
  v15 = sub_235CA3798();

  v16 = sub_235CA37EC();
  if (*(_QWORD *)(v15 + 16) && (v18 = sub_235C9BACC(v16, v17), (v19 & 1) != 0))
  {
    sub_235C76B10(*(_QWORD *)(v15 + 56) + 32 * v18, (uint64_t)&v30);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (*((_QWORD *)&v31 + 1))
    {
      sub_235C76B00(&v30, v32);
      v20 = objc_allocWithZone(MEMORY[0x24BE09120]);
      __swift_project_boxed_opaque_existential_1(v32, v33);
      v21 = objc_msgSend(v20, sel_initWithSerializedBackingStore_, sub_235CA3B70());
      swift_unknownObjectRelease();
      if ((objc_msgSend(v21, sel_callState) & 1) != 0)
      {
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v32);

        v34 = 1;
      }
      else
      {
        v22 = objc_msgSend(v21, sel_callState);

        __swift_destroy_boxed_opaque_existential_1((uint64_t)v32);
        v34 = (v22 & 2) != 0;
      }
      goto LABEL_19;
    }
  }
  else
  {
    v30 = 0u;
    v31 = 0u;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
LABEL_18:
  sub_235C76BD8((uint64_t)&v30, &qword_2542994B0);
  v34 = 0;
LABEL_19:
  sub_235CA399C();
  if (qword_2542990E8 != -1)
    swift_once();
  v23 = (id)qword_2542994C8;
  sub_235CA36CC();

  if (qword_2542992E8 != -1)
    swift_once();
  v24 = sub_235CA3708();
  __swift_project_value_buffer(v24, (uint64_t)qword_254299660);
  v25 = v34;
  swift_bridgeObjectRetain_n();
  v26 = sub_235CA36FC();
  v27 = sub_235CA3924();
  if (os_log_type_enabled(v26, v27))
  {
    v28 = swift_slowAlloc();
    v29 = swift_slowAlloc();
    v32[0] = v29;
    *(_DWORD *)v28 = 67109378;
    LODWORD(v30) = v25;
    sub_235CA3A14();
    *(_WORD *)(v28 + 8) = 2080;
    swift_bridgeObjectRetain();
    *(_QWORD *)&v30 = sub_235C944B8(a3, a4, v32);
    sub_235CA3A14();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_235C5E000, v26, v27, "Retrieved isUserOnPhoneCall status: %{BOOL}d for requestId: %s", (uint8_t *)v28, 0x12u);
    swift_arrayDestroy();
    MEMORY[0x23B7DE144](v29, -1, -1);
    MEMORY[0x23B7DE144](v28, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  swift_beginAccess();
  return a5(v34);
}

uint64_t sub_235C73604(char a1)
{
  if ((a1 & 1) != 0)
    return 0x4879616C70736964;
  else
    return 0xD000000000000010;
}

uint64_t sub_235C73648()
{
  char *v0;

  return sub_235C73604(*v0);
}

uint64_t sub_235C73650@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_235C76748(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_235C73674()
{
  return 0;
}

void sub_235C73680(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_235C7368C()
{
  sub_235C73878();
  return sub_235CA3C0C();
}

uint64_t sub_235C736B4()
{
  sub_235C73878();
  return sub_235CA3C18();
}

uint64_t JitGrammarInput.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v10;
  char v11;
  uint64_t v12;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254298A08);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *v1;
  v10 = v1[1];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_235C73878();
  sub_235CA3C00();
  v12 = v8;
  v11 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542989D8);
  sub_235C73AC8((unint64_t *)&unk_2542989E0, &qword_2542989A8, MEMORY[0x24BE99D38], MEMORY[0x24BEE12A0]);
  sub_235CA3B4C();
  if (!v2)
  {
    v12 = v10;
    v11 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2542989F0);
    sub_235C73B84(&qword_254299368, MEMORY[0x24BEE0D08], MEMORY[0x24BEE12A0]);
    sub_235CA3B58();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

unint64_t sub_235C73878()
{
  unint64_t result;

  result = qword_2542989B8;
  if (!qword_2542989B8)
  {
    result = MEMORY[0x23B7DE090](&unk_235CA499C, &type metadata for JitGrammarInput.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2542989B8);
  }
  return result;
}

uint64_t JitGrammarInput.init(from:)@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  char v13;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563773B8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_235C73878();
  sub_235CA3BF4();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542989D8);
  v13 = 0;
  sub_235C73AC8(&qword_2563773C0, &qword_2563773C8, MEMORY[0x24BE99D40], MEMORY[0x24BEE12D0]);
  sub_235CA3B34();
  v9 = v14;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542989F0);
  v13 = 1;
  sub_235C73B84(&qword_2563773D0, MEMORY[0x24BEE0D38], MEMORY[0x24BEE12D0]);
  swift_bridgeObjectRetain();
  sub_235CA3B40();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v10 = v14;
  *a2 = v9;
  a2[1] = v10;
  swift_bridgeObjectRetain();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_235C73AC8(unint64_t *a1, unint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;

  result = *a1;
  if (!result)
  {
    v9 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2542989D8);
    v10 = sub_235C73B44(a2, a3);
    result = MEMORY[0x23B7DE090](a4, v9, &v10);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_235C73B44(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = sub_235CA28A4();
    result = MEMORY[0x23B7DE090](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_235C73B84(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  result = *a1;
  if (!result)
  {
    v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2542989F0);
    v8 = a2;
    result = MEMORY[0x23B7DE090](a3, v7, &v8);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_235C73BE4@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return JitGrammarInput.init(from:)(a1, a2);
}

uint64_t sub_235C73BF8(_QWORD *a1)
{
  return JitGrammarInput.encode(to:)(a1);
}

uint64_t sub_235C73C0C()
{
  return 1;
}

uint64_t sub_235C73C14()
{
  sub_235CA3BD0();
  sub_235CA3BDC();
  return sub_235CA3BE8();
}

uint64_t sub_235C73C54()
{
  return sub_235CA3BDC();
}

uint64_t sub_235C73C78()
{
  sub_235CA3BD0();
  sub_235CA3BDC();
  return sub_235CA3BE8();
}

uint64_t sub_235C73CB8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_235C76844(a1, a2);
  *a3 = result & 1;
  return result;
}

void sub_235C73CE0(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_235C73CEC()
{
  sub_235C73E5C();
  return sub_235CA3C0C();
}

uint64_t sub_235C73D14()
{
  sub_235C73E5C();
  return sub_235CA3C18();
}

uint64_t JitGrammarOutput.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  _QWORD v9[2];

  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254298A10);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_235C73E5C();
  sub_235CA3C00();
  v9[1] = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2542989F0);
  sub_235C73B84(&qword_254299368, MEMORY[0x24BEE0D08], MEMORY[0x24BEE12A0]);
  sub_235CA3B58();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

unint64_t sub_235C73E5C()
{
  unint64_t result;

  result = qword_254299118;
  if (!qword_254299118)
  {
    result = MEMORY[0x23B7DE090](&unk_235CA494C, &type metadata for JitGrammarOutput.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254299118);
  }
  return result;
}

uint64_t JitGrammarOutput.init(from:)@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _QWORD v10[2];

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563773D8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_235C73E5C();
  sub_235CA3BF4();
  if (!v2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2542989F0);
    sub_235C73B84(&qword_2563773D0, MEMORY[0x24BEE0D38], MEMORY[0x24BEE12D0]);
    sub_235CA3B40();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v10[1];
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_235C73FE0@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return JitGrammarOutput.init(from:)(a1, a2);
}

uint64_t sub_235C73FF4(_QWORD *a1)
{
  return JitGrammarOutput.encode(to:)(a1);
}

uint64_t destroy for JitGrammarInput()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *_s9ASRBridge15JitGrammarInputVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for JitGrammarInput(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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

_OWORD *assignWithTake for JitGrammarInput(_OWORD *a1, _OWORD *a2)
{
  swift_bridgeObjectRelease();
  *a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for JitGrammarInput(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for JitGrammarInput(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for JitGrammarInput()
{
  return &type metadata for JitGrammarInput;
}

ValueMetadata *type metadata accessor for JitGrammarOutput()
{
  return &type metadata for JitGrammarOutput;
}

uint64_t getEnumTagSinglePayload for JitGrammarOutput.CodingKeys(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for JitGrammarOutput.CodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_235C74244 + 4 * byte_235CA46F0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_235C74264 + 4 * byte_235CA46F5[v4]))();
}

_BYTE *sub_235C74244(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_235C74264(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_235C7426C(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_235C74274(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_235C7427C(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_235C74284(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_235C74290()
{
  return 0;
}

ValueMetadata *type metadata accessor for JitGrammarOutput.CodingKeys()
{
  return &type metadata for JitGrammarOutput.CodingKeys;
}

uint64_t storeEnumTagSinglePayload for JitGrammarInput.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_235C742F4 + 4 * byte_235CA46FF[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_235C74328 + 4 * byte_235CA46FA[v4]))();
}

uint64_t sub_235C74328(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_235C74330(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x235C74338);
  return result;
}

uint64_t sub_235C74344(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x235C7434CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_235C74350(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_235C74358(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for JitGrammarInput.CodingKeys()
{
  return &type metadata for JitGrammarInput.CodingKeys;
}

unint64_t sub_235C74378()
{
  unint64_t result;

  result = qword_2563773E0;
  if (!qword_2563773E0)
  {
    result = MEMORY[0x23B7DE090](&unk_235CA486C, &type metadata for JitGrammarInput.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2563773E0);
  }
  return result;
}

unint64_t sub_235C743C0()
{
  unint64_t result;

  result = qword_2563773E8;
  if (!qword_2563773E8)
  {
    result = MEMORY[0x23B7DE090](&unk_235CA4924, &type metadata for JitGrammarOutput.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2563773E8);
  }
  return result;
}

unint64_t sub_235C74408()
{
  unint64_t result;

  result = qword_254299128;
  if (!qword_254299128)
  {
    result = MEMORY[0x23B7DE090](&unk_235CA4894, &type metadata for JitGrammarOutput.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254299128);
  }
  return result;
}

unint64_t sub_235C74450()
{
  unint64_t result;

  result = qword_254299120;
  if (!qword_254299120)
  {
    result = MEMORY[0x23B7DE090](&unk_235CA48BC, &type metadata for JitGrammarOutput.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_254299120);
  }
  return result;
}

unint64_t sub_235C74498()
{
  unint64_t result;

  result = qword_2542990F8;
  if (!qword_2542990F8)
  {
    result = MEMORY[0x23B7DE090](&unk_235CA47DC, &type metadata for JitGrammarInput.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2542990F8);
  }
  return result;
}

unint64_t sub_235C744E0()
{
  unint64_t result;

  result = qword_2542990F0;
  if (!qword_2542990F0)
  {
    result = MEMORY[0x23B7DE090](&unk_235CA4804, &type metadata for JitGrammarInput.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2542990F0);
  }
  return result;
}

_QWORD *sub_235C74524(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  size_t v11;
  _QWORD *v12;

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
      __swift_instantiateConcreteTypeFromMangledName(&qword_254299488);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 48);
      v12 = v10 + 4;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[6 * v8 + 4])
          memmove(v12, a4 + 4, 48 * v8);
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v12 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
        goto LABEL_13;
    }
    sub_235C748A8(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_235C74648(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_254299478);
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
    sub_235C75140(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_235C74754(uint64_t a1)
{
  uint64_t v1;
  unint64_t v2;
  _QWORD *v3;
  int64_t v4;
  int64_t v5;
  _QWORD *isUniquelyReferenced_nonNull_native;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  int64_t v15;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *(_QWORD **)v1;
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 16);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
    goto LABEL_21;
  }
  isUniquelyReferenced_nonNull_native = (_QWORD *)swift_isUniquelyReferenced_nonNull_native();
  if ((_DWORD)isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
  {
    v8 = *(_QWORD *)(a1 + 16);
    if (v8)
      goto LABEL_5;
LABEL_18:
    if (!v2)
      goto LABEL_19;
    goto LABEL_21;
  }
  if (v4 <= v5)
    v15 = v4 + v2;
  else
    v15 = v4;
  v3 = sub_235C74648(isUniquelyReferenced_nonNull_native, v15, 1, v3);
  v8 = *(_QWORD *)(a1 + 16);
  if (!v8)
    goto LABEL_18;
LABEL_5:
  v9 = v3[2];
  if ((v3[3] >> 1) - v9 < (uint64_t)v8)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v10 = (unint64_t)&v3[2 * v9 + 4];
  if (a1 + 32 < v10 + 16 * v8 && v10 < a1 + 32 + 16 * v8)
    goto LABEL_24;
  swift_arrayInitWithCopy();
  if (v8 < v2)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v12 = v3[2];
  v13 = __OFADD__(v12, v8);
  v14 = v12 + v8;
  if (!v13)
  {
    v3[2] = v14;
LABEL_19:
    result = swift_bridgeObjectRelease();
    *(_QWORD *)v1 = v3;
    return result;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  result = sub_235CA3B28();
  __break(1u);
  return result;
}

uint64_t sub_235C748A8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v5 = a4 + 48 * a1 + 32;
    v6 = a3 + 48 * v4;
    if (v5 >= v6 || v5 + 48 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542993C0);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_235CA3B28();
  __break(1u);
  return result;
}

uint64_t sub_235C749B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  int v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint8_t *v22;
  uint8_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t (*v27)(char *, uint64_t, uint64_t);
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  os_log_type_t v31;
  uint8_t *v32;
  const char *v33;
  char *v34;
  uint64_t v35;
  NSObject *v36;
  os_log_type_t v37;
  uint8_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  os_log_type_t v43;
  uint8_t *v44;
  BOOL v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  NSObject *v49;
  os_log_type_t v50;
  uint8_t *v51;
  uint64_t v53;
  char *v54;

  v4 = sub_235CA28A4();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v53 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_235CA2844();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v54 = (char *)&v53 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254299060);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v53 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v53 - v15;
  sub_235C76B90(a2, (uint64_t)&v53 - v15);
  if (a1)
  {
    v17 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v9 + 48))(v16, 1, v8);
    sub_235C76BD8((uint64_t)v16, (uint64_t *)&unk_254299060);
    if (v17 != 1)
    {
      if (qword_2542992E8 != -1)
        swift_once();
      v18 = sub_235CA3708();
      __swift_project_value_buffer(v18, (uint64_t)qword_254299660);
      v19 = sub_235CA36FC();
      v20 = sub_235CA3930();
      if (os_log_type_enabled(v19, v20))
      {
        v21 = (uint8_t *)swift_slowAlloc();
        v53 = v5;
        v22 = v21;
        *(_WORD *)v21 = 0;
        _os_log_impl(&dword_235C5E000, v19, v20, "Both LegacyNLContext and SystemDialogActs are present for this request", v21, 2u);
        v23 = v22;
        v5 = v53;
        MEMORY[0x23B7DE144](v23, -1, -1);
      }

    }
  }
  else
  {
    sub_235C76BD8((uint64_t)v16, (uint64_t *)&unk_254299060);
  }
  sub_235C76B90(a2, (uint64_t)v14);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v14, 1, v8) != 1)
  {
    v34 = v54;
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v54, v14, v8);
    if (qword_2542992E8 != -1)
      swift_once();
    v35 = sub_235CA3708();
    __swift_project_value_buffer(v35, (uint64_t)qword_254299660);
    v36 = sub_235CA36FC();
    v37 = sub_235CA3924();
    if (os_log_type_enabled(v36, v37))
    {
      v38 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v38 = 0;
      _os_log_impl(&dword_235C5E000, v36, v37, "LegacyNLContext is present, ignoring SystemDialogActs", v38, 2u);
      MEMORY[0x23B7DE144](v38, -1, -1);
    }

    if ((sub_235CA2838() & 1) != 0)
    {
      if (qword_254299258 != -1)
        swift_once();
      if (byte_2542994B8)
        v39 = 8;
      else
        v39 = 2;
    }
    else
    {
      if (qword_254299258 != -1)
        swift_once();
      if (byte_2542994B8)
        v39 = 7;
      else
        v39 = 0;
    }
    (*(void (**)(char *, uint64_t))(v9 + 8))(v34, v8);
    return v39;
  }
  sub_235C76BD8((uint64_t)v14, (uint64_t *)&unk_254299060);
  if (!a1)
  {
    if (qword_2542992E8 != -1)
      swift_once();
    v40 = sub_235CA3708();
    __swift_project_value_buffer(v40, (uint64_t)qword_254299660);
    v30 = sub_235CA36FC();
    v31 = sub_235CA3924();
    if (!os_log_type_enabled(v30, v31))
      goto LABEL_42;
    v32 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v32 = 0;
    v33 = "SystemDialogActs not present using default task type";
    goto LABEL_41;
  }
  v24 = *(_QWORD *)(a1 + 16);
  if (!v24)
  {
LABEL_17:
    if (qword_2542992E8 != -1)
      swift_once();
    v29 = sub_235CA3708();
    __swift_project_value_buffer(v29, (uint64_t)qword_254299660);
    v30 = sub_235CA36FC();
    v31 = sub_235CA3924();
    if (!os_log_type_enabled(v30, v31))
      goto LABEL_42;
    v32 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v32 = 0;
    v33 = "No relevant SDA found, using default task type";
LABEL_41:
    _os_log_impl(&dword_235C5E000, v30, v31, v33, v32, 2u);
    MEMORY[0x23B7DE144](v32, -1, -1);
LABEL_42:

    if (qword_254299258 != -1)
      swift_once();
    if (byte_2542994B8)
      return 7;
    else
      return 0;
  }
  v25 = a1 + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
  v26 = *(_QWORD *)(v5 + 72);
  v27 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 16);
  swift_bridgeObjectRetain();
  while (1)
  {
    v28 = v27(v7, v25, v4);
    if ((MEMORY[0x23B7DC920](v28) & 1) != 0)
      break;
    if ((sub_235CA2880() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      if (qword_2542992E8 != -1)
        swift_once();
      v48 = sub_235CA3708();
      __swift_project_value_buffer(v48, (uint64_t)qword_254299660);
      v49 = sub_235CA36FC();
      v50 = sub_235CA3924();
      if (os_log_type_enabled(v49, v50))
      {
        v51 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v51 = 0;
        _os_log_impl(&dword_235C5E000, v49, v50, "SDA found indicating confirmation task type", v51, 2u);
        MEMORY[0x23B7DE144](v51, -1, -1);
      }

      if (qword_254299258 != -1)
        swift_once();
      v45 = byte_2542994B8 == 0;
      v46 = 9;
      v47 = 7;
      goto LABEL_61;
    }
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    v25 += v26;
    if (!--v24)
    {
      swift_bridgeObjectRelease();
      goto LABEL_17;
    }
  }
  swift_bridgeObjectRelease();
  if (qword_2542992E8 != -1)
    swift_once();
  v41 = sub_235CA3708();
  __swift_project_value_buffer(v41, (uint64_t)qword_254299660);
  v42 = sub_235CA36FC();
  v43 = sub_235CA3924();
  if (os_log_type_enabled(v42, v43))
  {
    v44 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v44 = 0;
    _os_log_impl(&dword_235C5E000, v42, v43, "SDA found indicating SiriDictation task type", v44, 2u);
    MEMORY[0x23B7DE144](v44, -1, -1);
  }

  if (qword_254299258 != -1)
    swift_once();
  v45 = byte_2542994B8 == 0;
  v46 = 2;
  v47 = 8;
LABEL_61:
  if (v45)
    v39 = v46;
  else
    v39 = v47;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v39;
}

uint64_t sub_235C75140(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_235CA3B28();
  __break(1u);
  return result;
}

uint64_t sub_235C75230(void *a1, uint64_t a2)
{
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  char v9;
  int v10;

  v4 = AFIsATV();
  if (!objc_msgSend(a1, sel_secureOfflineOnly))
  {
    if (AFIsATV())
    {
      v5 = 6;
      goto LABEL_17;
    }
LABEL_15:
    v5 = 3;
    goto LABEL_17;
  }
  if ((v4 & 1) != 0)
  {
    v5 = 10;
LABEL_17:
    objc_msgSend(a1, sel_taskHint);
    return v5;
  }
  if ((objc_msgSend(a1, sel_forceOfflineRecognition) & 1) == 0)
  {
    v5 = 4;
    goto LABEL_17;
  }
  if (!objc_msgSend(a1, sel_forceOfflineRecognition)
    || !objc_msgSend(a1, sel_secureOfflineOnly)
    || !AFIsSearchDictationRequest())
  {
    goto LABEL_15;
  }
  v6 = sub_235CA37EC();
  if (*(_QWORD *)(a2 + 16) && (v8 = sub_235C9BACC(v6, v7), (v9 & 1) != 0))
  {
    v10 = *(unsigned __int8 *)(*(_QWORD *)(a2 + 56) + v8);
    swift_bridgeObjectRelease();
    if (v10)
      return 6;
    else
      return 3;
  }
  else
  {
    swift_bridgeObjectRelease();
    return 3;
  }
}

uint64_t sub_235C7534C(unint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  const char *v5;
  uint64_t v7;

  if (a1 > 0xA)
  {
    if (qword_2542992E8 != -1)
      swift_once();
    v7 = sub_235CA3708();
    __swift_project_value_buffer(v7, (uint64_t)qword_254299660);
    v2 = sub_235CA36FC();
    v3 = sub_235CA393C();
    if (!os_log_type_enabled(v2, v3))
      goto LABEL_14;
    v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v4 = 0;
    v5 = "Unexpected unknown taskName, setting deliverEager to true";
    goto LABEL_13;
  }
  if (((1 << a1) & 0x178) != 0)
    return 0;
  if (((1 << a1) & 0x287) == 0)
  {
    if (qword_2542992E8 != -1)
      swift_once();
    v1 = sub_235CA3708();
    __swift_project_value_buffer(v1, (uint64_t)qword_254299660);
    v2 = sub_235CA36FC();
    v3 = sub_235CA393C();
    if (!os_log_type_enabled(v2, v3))
      goto LABEL_14;
    v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v4 = 0;
    v5 = "unexpected spelling taskName, setting deliverEager to true";
LABEL_13:
    _os_log_impl(&dword_235C5E000, v2, v3, v5, v4, 2u);
    MEMORY[0x23B7DE144](v4, -1, -1);
LABEL_14:

  }
  return 1;
}

uint64_t sub_235C754DC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(char *, uint64_t, uint64_t);
  void (*v17)(char *, uint64_t);
  char v18;
  char v19;
  uint64_t v20;
  char *v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  os_log_type_t v31;
  uint8_t *v32;
  uint64_t v33;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  v2 = sub_235CA2814();
  v38 = *(_QWORD *)(v2 - 8);
  v39 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v35 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_235CA28A4();
  v40 = *(_QWORD *)(v5 - 8);
  v6 = MEMORY[0x24BDAC7A8](v5);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v35 - v8;
  MEMORY[0x24BDAC7A8](v7);
  v12 = (char *)&v35 - v11;
  if (!a1)
  {
    if (qword_2542992E8 != -1)
      swift_once();
    v29 = sub_235CA3708();
    __swift_project_value_buffer(v29, (uint64_t)qword_254299660);
    v30 = sub_235CA36FC();
    v31 = sub_235CA3924();
    if (os_log_type_enabled(v30, v31))
    {
      v32 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v32 = 0;
      _os_log_impl(&dword_235C5E000, v30, v31, "SDA not present - no payload target language exists returning nil", v32, 2u);
      MEMORY[0x23B7DE144](v32, -1, -1);
    }

    return 0;
  }
  v13 = *(_QWORD *)(a1 + 16);
  if (!v13)
    return 0;
  v36 = v10;
  v37 = a1;
  v14 = a1 + ((*(unsigned __int8 *)(v40 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v40 + 80));
  v15 = *(_QWORD *)(v40 + 72);
  v16 = *(void (**)(char *, uint64_t, uint64_t))(v40 + 16);
  swift_bridgeObjectRetain();
  while (1)
  {
    v16(v12, v14, v5);
    v18 = sub_235CA285C();
    v16(v9, (uint64_t)v12, v5);
    if ((v18 & 1) != 0)
      break;
    v17 = *(void (**)(char *, uint64_t))(v40 + 8);
    v17(v9, v5);
LABEL_5:
    v17(v12, v5);
    v14 += v15;
    if (!--v13)
    {
      swift_bridgeObjectRelease();
      return 0;
    }
  }
  sub_235CA2898();
  v19 = sub_235CA2808();
  (*(void (**)(char *, uint64_t))(v38 + 8))(v4, v39);
  v17 = *(void (**)(char *, uint64_t))(v40 + 8);
  v17(v9, v5);
  if ((v19 & 1) == 0)
    goto LABEL_5;
  swift_bridgeObjectRelease();
  if (qword_2542992E8 != -1)
    swift_once();
  v20 = sub_235CA3708();
  __swift_project_value_buffer(v20, (uint64_t)qword_254299660);
  v21 = v36;
  v16(v36, (uint64_t)v12, v5);
  v22 = sub_235CA36FC();
  v23 = sub_235CA3924();
  if (os_log_type_enabled(v22, v23))
  {
    v24 = (uint8_t *)swift_slowAlloc();
    v40 = swift_slowAlloc();
    v42 = v40;
    *(_DWORD *)v24 = 136315138;
    v25 = sub_235CA288C();
    if (v26)
    {
      v27 = v26;
    }
    else
    {
      v25 = 0xD000000000000019;
      v27 = 0x8000000235CA5AC0;
    }
    v41 = sub_235C944B8(v25, v27, &v42);
    sub_235CA3A14();
    swift_bridgeObjectRelease();
    v17(v21, v5);
    _os_log_impl(&dword_235C5E000, v22, v23, "SDA found - payload target language is: %s", v24, 0xCu);
    v28 = v40;
    swift_arrayDestroy();
    MEMORY[0x23B7DE144](v28, -1, -1);
    MEMORY[0x23B7DE144](v24, -1, -1);
  }
  else
  {
    v17(v21, v5);
  }

  v33 = sub_235CA288C();
  v17(v12, v5);
  return v33;
}

uint64_t sub_235C75920(uint64_t a1, char a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(char *, uint64_t, uint64_t);
  void (*v18)(char *, uint64_t);
  char v19;
  char v20;
  void (*v21)(char *, uint64_t);
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  v4 = sub_235CA2814();
  v35 = *(_QWORD *)(v4 - 8);
  v36 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_235CA28A4();
  v37 = *(_QWORD *)(v7 - 8);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v34 - v11;
  if ((a2 & 1) == 0)
  {
    if (qword_2542992E8 != -1)
      swift_once();
    v27 = sub_235CA3708();
    __swift_project_value_buffer(v27, (uint64_t)qword_254299660);
    v28 = sub_235CA36FC();
    v29 = sub_235CA3924();
    if (!os_log_type_enabled(v28, v29))
      goto LABEL_30;
    v30 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v30 = 0;
    v31 = "Feature flag for auto-punctuation is off";
    goto LABEL_29;
  }
  if (qword_254299260 != -1)
    swift_once();
  if (!objc_msgSend((id)qword_254299558, sel_dictationAutoPunctuationEnabled))
  {
    if (qword_2542992E8 != -1)
      swift_once();
    v32 = sub_235CA3708();
    __swift_project_value_buffer(v32, (uint64_t)qword_254299660);
    v28 = sub_235CA36FC();
    v29 = sub_235CA3924();
    if (!os_log_type_enabled(v28, v29))
      goto LABEL_30;
    v30 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v30 = 0;
    v31 = "Auto-punctuation is disabled";
    goto LABEL_29;
  }
  if (!a1)
  {
    if (qword_2542992E8 != -1)
      swift_once();
    v33 = sub_235CA3708();
    __swift_project_value_buffer(v33, (uint64_t)qword_254299660);
    v28 = sub_235CA36FC();
    v29 = sub_235CA3924();
    if (!os_log_type_enabled(v28, v29))
      goto LABEL_30;
    v30 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v30 = 0;
    v31 = "SystemDialogActs are not present, disabling auto-punctuation";
LABEL_29:
    _os_log_impl(&dword_235C5E000, v28, v29, v31, v30, 2u);
    MEMORY[0x23B7DE144](v30, -1, -1);
LABEL_30:

    return 0;
  }
  v13 = *(_QWORD *)(a1 + 16);
  if (!v13)
    return 0;
  v14 = a1 + ((*(unsigned __int8 *)(v37 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v37 + 80));
  v15 = *(_QWORD *)(v37 + 72);
  v16 = a1;
  v17 = *(void (**)(char *, uint64_t, uint64_t))(v37 + 16);
  v34 = v16;
  swift_bridgeObjectRetain();
  while (1)
  {
    v17(v12, v14, v7);
    v19 = sub_235CA285C();
    v17(v10, (uint64_t)v12, v7);
    if ((v19 & 1) != 0)
      break;
    v18 = *(void (**)(char *, uint64_t))(v37 + 8);
    v18(v10, v7);
    v18(v12, v7);
LABEL_9:
    v14 += v15;
    if (!--v13)
    {
      swift_bridgeObjectRelease();
      return 0;
    }
  }
  sub_235CA2898();
  v20 = sub_235CA2808();
  (*(void (**)(char *, uint64_t))(v35 + 8))(v6, v36);
  v21 = *(void (**)(char *, uint64_t))(v37 + 8);
  v21(v10, v7);
  v21(v12, v7);
  if ((v20 & 1) == 0)
    goto LABEL_9;
  swift_bridgeObjectRelease();
  if (qword_2542992E8 != -1)
    swift_once();
  v22 = sub_235CA3708();
  __swift_project_value_buffer(v22, (uint64_t)qword_254299660);
  v23 = sub_235CA36FC();
  v24 = sub_235CA3924();
  if (os_log_type_enabled(v23, v24))
  {
    v25 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v25 = 0;
    _os_log_impl(&dword_235C5E000, v23, v24, "Previous SDA contains a message payload prompt, enabling auto-punctuation", v25, 2u);
    MEMORY[0x23B7DE144](v25, -1, -1);
  }

  return 1;
}

uint64_t sub_235C75DA4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  BOOL v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  uint64_t v25;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254299430);
    v3 = sub_235CA3A74();
    v4 = 0;
    v5 = v3 + 56;
    v25 = a1 + 32;
    while (1)
    {
      v6 = (uint64_t *)(v25 + 16 * v4);
      v8 = *v6;
      v7 = v6[1];
      sub_235CA3BD0();
      swift_bridgeObjectRetain();
      sub_235CA381C();
      result = sub_235CA3BE8();
      v10 = -1 << *(_BYTE *)(v3 + 32);
      v11 = result & ~v10;
      v12 = v11 >> 6;
      v13 = *(_QWORD *)(v5 + 8 * (v11 >> 6));
      v14 = 1 << v11;
      if (((1 << v11) & v13) != 0)
      {
        v15 = *(_QWORD *)(v3 + 48);
        v16 = (_QWORD *)(v15 + 16 * v11);
        v17 = *v16 == v8 && v16[1] == v7;
        if (v17 || (result = sub_235CA3B88(), (result & 1) != 0))
        {
LABEL_3:
          swift_bridgeObjectRelease();
          goto LABEL_4;
        }
        v18 = ~v10;
        while (1)
        {
          v11 = (v11 + 1) & v18;
          v12 = v11 >> 6;
          v13 = *(_QWORD *)(v5 + 8 * (v11 >> 6));
          v14 = 1 << v11;
          if ((v13 & (1 << v11)) == 0)
            break;
          v19 = (_QWORD *)(v15 + 16 * v11);
          if (*v19 != v8 || v19[1] != v7)
          {
            result = sub_235CA3B88();
            if ((result & 1) == 0)
              continue;
          }
          goto LABEL_3;
        }
      }
      *(_QWORD *)(v5 + 8 * v12) = v14 | v13;
      v21 = (_QWORD *)(*(_QWORD *)(v3 + 48) + 16 * v11);
      *v21 = v8;
      v21[1] = v7;
      v22 = *(_QWORD *)(v3 + 16);
      v23 = __OFADD__(v22, 1);
      v24 = v22 + 1;
      if (v23)
      {
        __break(1u);
        return result;
      }
      *(_QWORD *)(v3 + 16) = v24;
LABEL_4:
      if (++v4 == v1)
        return v3;
    }
  }
  return MEMORY[0x24BEE4B08];
}

uint64_t sub_235C75F44(void *a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  uint64_t inited;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  _QWORD *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v35[2];
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t aBlock[6];

  v37 = a4;
  v38 = a5;
  v39 = a2;
  v7 = sub_235CA36F0();
  v40 = *(_QWORD *)(v7 - 8);
  v41 = v7;
  v8 = *(_QWORD *)(v40 + 64);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v36 = (char *)v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)v35 - v10;
  if (qword_2542990E8 != -1)
    swift_once();
  v12 = (id)qword_2542994C8;
  sub_235CA36D8();
  sub_235CA39A8();
  v13 = (id)qword_2542994C8;
  sub_235CA36C0();

  if (qword_2542992E8 != -1)
    swift_once();
  v14 = sub_235CA3708();
  __swift_project_value_buffer(v14, (uint64_t)qword_254299660);
  swift_bridgeObjectRetain_n();
  v15 = sub_235CA36FC();
  v16 = sub_235CA3924();
  if (os_log_type_enabled(v15, v16))
  {
    v17 = (uint8_t *)swift_slowAlloc();
    v18 = swift_slowAlloc();
    aBlock[0] = v18;
    *(_DWORD *)v17 = 136315138;
    swift_bridgeObjectRetain();
    v42 = sub_235C944B8(v39, a3, aBlock);
    sub_235CA3A14();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_235C5E000, v15, v16, "Fetching isUserOnPhoneCall status for requestId: %s", v17, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B7DE144](v18, -1, -1);
    MEMORY[0x23B7DE144](v17, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  if ((objc_msgSend(a1, sel_respondsToSelector_, sel_fetchContextsForKeys_forRequestID_includesNearbyDevices_completion_) & 1) != 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254299478);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_235CA4440;
    *(_QWORD *)(inited + 32) = sub_235CA37EC();
    *(_QWORD *)(inited + 40) = v20;
    swift_unknownObjectRetain();
    v35[1] = sub_235C75DA4(inited);
    swift_setDeallocating();
    swift_arrayDestroy();
    v21 = v40;
    v22 = v41;
    v23 = v36;
    (*(void (**)(char *, char *, uint64_t))(v40 + 16))(v36, v11, v41);
    v24 = (*(unsigned __int8 *)(v21 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80);
    v25 = (v8 + v24 + 7) & 0xFFFFFFFFFFFFFFF8;
    v26 = (v25 + 23) & 0xFFFFFFFFFFFFFFF8;
    v27 = swift_allocObject();
    (*(void (**)(unint64_t, char *, uint64_t))(v21 + 32))(v27 + v24, v23, v22);
    v28 = (_QWORD *)(v27 + v25);
    v29 = v38;
    *v28 = v39;
    v28[1] = a3;
    v30 = (_QWORD *)(v27 + v26);
    *v30 = v37;
    v30[1] = v29;
    swift_bridgeObjectRetain();
    swift_retain();
    v31 = (void *)sub_235CA390C();
    v32 = (void *)sub_235CA37E0();
    aBlock[4] = (uint64_t)sub_235C76A48;
    aBlock[5] = v27;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_235C73144;
    aBlock[3] = (uint64_t)&block_descriptor_1;
    v33 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(a1, sel_fetchContextsForKeys_forRequestID_includesNearbyDevices_completion_, v31, v32, 0, v33);
    _Block_release(v33);
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();

  }
  return (*(uint64_t (**)(char *, uint64_t))(v40 + 8))(v11, v41);
}

uint64_t sub_235C763EC(void *a1, uint64_t a2, unint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  dispatch_semaphore_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(char *, uint64_t);
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  id v25;
  char *v26;
  uint64_t v27;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;

  v33 = a3;
  v5 = sub_235CA36F0();
  v31 = *(_QWORD *)(v5 - 8);
  v32 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v30 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_235CA3774();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v29 - v12;
  v14 = swift_allocObject();
  *(_BYTE *)(v14 + 16) = 2;
  v15 = dispatch_semaphore_create(0);
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = v14;
  *(_QWORD *)(v16 + 24) = v15;
  swift_retain();
  v17 = v15;
  sub_235C75F44(a1, a2, v33, (uint64_t)sub_235C76928, v16);
  swift_release();
  sub_235CA3768();
  if (qword_254299268 != -1)
    swift_once();
  v18 = sub_235CA3720();
  v19 = __swift_project_value_buffer(v18, (uint64_t)qword_254299560);
  MEMORY[0x23B7DD82C](v11, v19);
  v20 = *(void (**)(char *, uint64_t))(v8 + 8);
  v20(v11, v7);
  sub_235CA39C0();
  v20(v13, v7);
  if ((sub_235CA372C() & 1) != 0)
  {
    if (qword_2542992E8 != -1)
      swift_once();
    v21 = sub_235CA3708();
    __swift_project_value_buffer(v21, (uint64_t)qword_254299660);
    v22 = sub_235CA36FC();
    v23 = sub_235CA3930();
    if (os_log_type_enabled(v22, v23))
    {
      v24 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v24 = 0;
      _os_log_impl(&dword_235C5E000, v22, v23, "Timed out fetching phoneCallState.", v24, 2u);
      MEMORY[0x23B7DE144](v24, -1, -1);
    }

    sub_235CA39B4();
    if (qword_2542990E8 != -1)
      swift_once();
    v25 = (id)qword_2542994C8;
    v26 = v30;
    sub_235CA36E4();
    v27 = 2;
    sub_235CA36CC();

    (*(void (**)(char *, uint64_t))(v31 + 8))(v26, v32);
    swift_release();

  }
  else
  {

    swift_beginAccess();
    v27 = *(unsigned __int8 *)(v14 + 16);
    swift_release();
  }
  return v27;
}

uint64_t sub_235C76748(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0xD000000000000010 && a2 == 0x8000000235CA59D0 || (sub_235CA3B88() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x4879616C70736964 && a2 == 0xEC00000073746E69)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v5 = sub_235CA3B88();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_235C76844(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;

  if (a1 == 0x6D6D61724774696ALL && a2 == 0xEA00000000007261)
  {
    swift_bridgeObjectRelease();
    v4 = 0;
  }
  else
  {
    v3 = sub_235CA3B88();
    swift_bridgeObjectRelease();
    v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_235C768D0()
{
  return 0x6D6D61724774696ALL;
}

uint64_t sub_235C768EC()
{
  return swift_deallocObject();
}

uint64_t sub_235C768FC()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

uint64_t sub_235C76928(char a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 + 16);
  swift_beginAccess();
  *(_BYTE *)(v3 + 16) = a1;
  return sub_235CA39CC();
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

uint64_t sub_235C769B4()
{
  uint64_t v0;
  uint64_t v1;

  v1 = sub_235CA36F0();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_235C76A48(unint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;

  v3 = *(_QWORD *)(sub_235CA36F0() - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v5 = (*(_QWORD *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  return sub_235C731A4(a1, v1 + v4, *(_QWORD *)(v1 + v5), *(_QWORD *)(v1 + v5 + 8), *(uint64_t (**)(BOOL))(v1 + ((v5 + 23) & 0xFFFFFFFFFFFFFFF8)));
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

unint64_t sub_235C76AC4()
{
  unint64_t result;

  result = qword_2542993F0;
  if (!qword_2542993F0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2542993F0);
  }
  return result;
}

_OWORD *sub_235C76B00(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_235C76B10(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_235C76B4C()
{
  unint64_t result;

  result = qword_2563773F8;
  if (!qword_2563773F8)
  {
    result = MEMORY[0x23B7DE090](MEMORY[0x24BDCFB50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_2563773F8);
  }
  return result;
}

uint64_t sub_235C76B90(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254299060);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_235C76BD8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_235C76C14(uint64_t a1)
{
  uint64_t result;
  int v3;
  char v4;
  void *v5;
  id v6;

  result = sub_235C77CD4(a1);
  if ((v4 & 1) != 0)
    goto LABEL_8;
  if (*(_DWORD *)(a1 + 36) != v3)
  {
    __break(1u);
LABEL_8:
    __break(1u);
    return result;
  }
  if (result == 1 << *(_BYTE *)(a1 + 32))
    return 0;
  v5 = (void *)sub_235C77D5C(result, v3, 0, a1);
  v6 = v5;
  return (uint64_t)v5;
}

void sub_235C76C80(NSObject *a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v4;
  char v6;
  uint64_t v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint8_t *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  _QWORD *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  NSObject *v28;
  id v29;
  uint64_t v30;
  void *v31;
  double v32;
  double v33;
  id v34;
  double v35;
  uint64_t v36;
  void *v37;
  id v38;
  uint64_t v39;
  id v40;
  NSObject *v41;
  uint64_t v42;
  void *v43;
  id v44;
  double v45;
  uint64_t v46;
  void *v47;
  double v48;
  NSObject *v49;
  NSObject *v50;
  void *v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  NSObject *v56;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v58;

  v2 = v1;
  if (sub_235CA3378() == v1[7] && v4 == v1[8])
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = sub_235CA3B88();
    swift_bridgeObjectRelease();
    if ((v6 & 1) == 0)
    {
      if (qword_2542992E8 != -1)
        swift_once();
      v7 = sub_235CA3708();
      __swift_project_value_buffer(v7, (uint64_t)qword_254299660);
      a1 = sub_235CA36FC();
      v8 = sub_235CA3930();
      if (!os_log_type_enabled(a1, v8))
        goto LABEL_48;
      v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_235C5E000, a1, v8, "ResultCandidateMessage requestId does not match current requestId", v9, 2u);
      v10 = v9;
LABEL_22:
      MEMORY[0x23B7DE144](v10, -1, -1);
LABEL_48:

      return;
    }
  }
  if (v1[10] >= v1[9])
  {
    if (qword_2542992E8 != -1)
      swift_once();
    v14 = sub_235CA3708();
    __swift_project_value_buffer(v14, (uint64_t)qword_254299660);
    swift_retain();
    v15 = sub_235CA36FC();
    v16 = sub_235CA3930();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v17 = 134217984;
      sub_235CA3A14();
      swift_release();
      _os_log_impl(&dword_235C5E000, v15, v16, "Number of RC's generated by ASR is greater than maximum number of RC's allowed for the request [%ld]. Caching this RC until it has been accepted", v17, 0xCu);
      MEMORY[0x23B7DE144](v17, -1, -1);

    }
    else
    {

      swift_release();
    }
    sub_235CA2F64();
    v24 = swift_dynamicCastClass();
    if (v24)
    {
      v25 = v24;
      v26 = (void *)v2[12];
      if (v26 && swift_dynamicCastClass())
      {
        v27 = v26;
        v28 = a1;
        v29 = v27;
        v30 = sub_235CA2EF8();
        v31 = (void *)sub_235C76C14(v30);
        swift_bridgeObjectRelease();
        v32 = 0.0;
        v33 = 0.0;
        if (v31)
        {
          v34 = objc_msgSend(v31, sel_recognition);

          if (!v34)
          {
            __break(1u);
LABEL_54:
            __break(1u);
            goto LABEL_55;
          }
          objc_msgSend(v34, sel_processedAudioDuration);
          v33 = v35;

        }
        v36 = sub_235CA2EF8();
        v37 = (void *)sub_235C76C14(v36);
        swift_bridgeObjectRelease();
        if (v37)
        {
          v38 = objc_msgSend(v37, sel_recognition);

          if (v38)
            goto LABEL_41;
          goto LABEL_54;
        }
LABEL_42:

        if (v32 >= v33)
          goto LABEL_46;
        v26 = (void *)v2[12];
        v2[12] = v25;
LABEL_45:
        v50 = a1;

LABEL_46:
        v51 = (void *)v2[12];
        if (v51)
        {
          v52 = v51;
          sub_235CA2F88();

          return;
        }
        goto LABEL_48;
      }
    }
    else
    {
      sub_235CA2A48();
      v39 = swift_dynamicCastClass();
      if (!v39)
      {
        v53 = sub_235CA2F88();
        v55 = v54;
        swift_beginAccess();
        v56 = a1;
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v58 = v2[11];
        v2[11] = 0x8000000000000000;
        sub_235C9D8A8((uint64_t)v56, v53, v55, isUniquelyReferenced_nonNull_native);
        v2[11] = v58;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_endAccess();
        sub_235CA2F88();
        return;
      }
      v25 = v39;
      v26 = (void *)v2[12];
      if (v26 && swift_dynamicCastClass())
      {
        v40 = v26;
        v41 = a1;
        v29 = v40;
        v42 = sub_235CA29E8();
        v43 = (void *)sub_235C76C14(v42);
        swift_bridgeObjectRelease();
        v32 = 0.0;
        v33 = 0.0;
        if (v43)
        {
          v44 = objc_msgSend(v43, sel_recognition);

          if (!v44)
          {
LABEL_55:
            __break(1u);
            goto LABEL_56;
          }
          objc_msgSend(v44, sel_processedAudioDuration);
          v33 = v45;

        }
        v46 = sub_235CA2EF8();
        v47 = (void *)sub_235C76C14(v46);
        swift_bridgeObjectRelease();
        if (v47)
        {
          v38 = objc_msgSend(v47, sel_recognition);

          if (v38)
          {
LABEL_41:
            objc_msgSend(v38, sel_processedAudioDuration);
            v32 = v48;

            goto LABEL_42;
          }
LABEL_56:
          __break(1u);
          return;
        }
        goto LABEL_42;
      }
    }
    v2[12] = v25;
    v49 = a1;
    goto LABEL_45;
  }
  __swift_project_boxed_opaque_existential_1(v1 + 2, v1[5]);
  if ((sub_235CA33B4() & 1) != 0)
  {
    v11 = v1[10];
    v12 = __OFADD__(v11, 1);
    v13 = v11 + 1;
    if (!v12)
    {
      v1[10] = v13;
      return;
    }
    __break(1u);
    goto LABEL_52;
  }
  if (qword_2542992E8 != -1)
LABEL_52:
    swift_once();
  v18 = sub_235CA3708();
  __swift_project_value_buffer(v18, (uint64_t)qword_254299660);
  v19 = a1;
  a1 = sub_235CA36FC();
  v20 = sub_235CA3930();
  if (os_log_type_enabled(a1, v20))
  {
    v21 = (uint8_t *)swift_slowAlloc();
    v22 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v21 = 138412290;
    v23 = v19;
    sub_235CA3A14();
    *v22 = v19;

    _os_log_impl(&dword_235C5E000, a1, v20, "Failed to post AsrResultCandidateMessage: %@", v21, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254299410);
    swift_arrayDestroy();
    MEMORY[0x23B7DE144](v22, -1, -1);
    v10 = v21;
    goto LABEL_22;
  }

}

uint64_t sub_235C77358()
{
  _QWORD *v0;
  void *v1;
  id v2;
  void *v3;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  id v10;
  os_log_type_t v11;
  uint8_t *v12;
  _QWORD *v13;
  id v14;

  v1 = (void *)v0[12];
  if (v1)
  {
    __swift_project_boxed_opaque_existential_1(v0 + 2, v0[5]);
    v2 = v1;
    if ((sub_235CA33B4() & 1) != 0)
    {

      v3 = (void *)v0[12];
      v0[12] = 0;

      return 1;
    }
    if (qword_2542992E8 != -1)
      swift_once();
    v9 = sub_235CA3708();
    __swift_project_value_buffer(v9, (uint64_t)qword_254299660);
    v10 = v2;
    v6 = sub_235CA36FC();
    v11 = sub_235CA3930();
    if (!os_log_type_enabled(v6, v11))
    {

      return 0;
    }
    v12 = (uint8_t *)swift_slowAlloc();
    v13 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v12 = 138412290;
    v14 = v10;
    sub_235CA3A14();
    *v13 = v1;

    _os_log_impl(&dword_235C5E000, v6, v11, "Failed to post muxRcMsgBuffered: %@", v12, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254299410);
    swift_arrayDestroy();
    MEMORY[0x23B7DE144](v13, -1, -1);
    MEMORY[0x23B7DE144](v12, -1, -1);

  }
  else
  {
    if (qword_2542992E8 != -1)
      swift_once();
    v5 = sub_235CA3708();
    __swift_project_value_buffer(v5, (uint64_t)qword_254299660);
    v6 = sub_235CA36FC();
    v7 = sub_235CA3930();
    if (os_log_type_enabled(v6, v7))
    {
      v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_235C5E000, v6, v7, "Buffered MUX RC message does not exist", v8, 2u);
      MEMORY[0x23B7DE144](v8, -1, -1);
    }
  }

  return 0;
}

void sub_235C775EC(void *a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v4;
  char v6;
  uint64_t v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  unint64_t v15;
  char v16;
  id v17;
  uint64_t v18;
  id v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  uint64_t v29;
  id v30;
  NSObject *v31;
  os_log_type_t v32;
  uint8_t *v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  NSObject *v40;
  os_log_type_t v41;
  uint8_t *v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  NSObject *oslog;
  uint64_t v47;

  v2 = v1;
  if (sub_235CA3378() == v1[7] && v4 == v1[8])
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = sub_235CA3B88();
    swift_bridgeObjectRelease();
    if ((v6 & 1) == 0)
    {
      if (qword_2542992E8 != -1)
        swift_once();
      v7 = sub_235CA3708();
      __swift_project_value_buffer(v7, (uint64_t)qword_254299660);
      oslog = sub_235CA36FC();
      v8 = sub_235CA3930();
      if (os_log_type_enabled(oslog, v8))
      {
        v9 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_235C5E000, oslog, v8, "ResultSelectedMessage requestId does not match current requestId", v9, 2u);
        MEMORY[0x23B7DE144](v9, -1, -1);
      }

      return;
    }
  }
  v10 = sub_235CA2F88();
  v12 = v11;
  swift_beginAccess();
  v13 = v1[11];
  v14 = &unk_254299000;
  if (*(_QWORD *)(v13 + 16))
  {
    swift_bridgeObjectRetain();
    v15 = sub_235C9BACC(v10, v12);
    if ((v16 & 1) != 0)
    {
      v17 = *(id *)(*(_QWORD *)(v13 + 56) + 8 * v15);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      __swift_project_boxed_opaque_existential_1(v2 + 2, v2[5]);
      sub_235CA33B4();
      if (qword_2542992E8 != -1)
        swift_once();
      v18 = sub_235CA3708();
      __swift_project_value_buffer(v18, (uint64_t)qword_254299660);
      v19 = v17;
      v20 = sub_235CA36FC();
      v21 = sub_235CA3924();
      if (os_log_type_enabled(v20, v21))
      {
        v22 = (uint8_t *)swift_slowAlloc();
        v23 = swift_slowAlloc();
        v47 = v23;
        *(_DWORD *)v22 = 136315138;
        v24 = sub_235CA2F88();
        sub_235C944B8(v24, v25, &v47);
        sub_235CA3A14();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_235C5E000, v20, v21, "Posted buffered RC with id:%s to message bus before posting ResultSelectedMessage", v22, 0xCu);
        swift_arrayDestroy();
        v26 = v23;
        v14 = (_QWORD *)&unk_254299000;
        MEMORY[0x23B7DE144](v26, -1, -1);
        MEMORY[0x23B7DE144](v22, -1, -1);

        v27 = (void *)v2[12];
        if (!v27)
          goto LABEL_27;
      }
      else
      {

        v27 = (void *)v2[12];
        if (!v27)
          goto LABEL_27;
      }
LABEL_22:
      __swift_project_boxed_opaque_existential_1(v2 + 2, v2[5]);
      v28 = v27;
      sub_235CA33B4();
      if (v14[93] != -1)
        swift_once();
      v29 = sub_235CA3708();
      __swift_project_value_buffer(v29, (uint64_t)qword_254299660);
      v30 = v28;
      v31 = sub_235CA36FC();
      v32 = sub_235CA3924();
      if (os_log_type_enabled(v31, v32))
      {
        v33 = (uint8_t *)swift_slowAlloc();
        v34 = swift_slowAlloc();
        v47 = v34;
        *(_DWORD *)v33 = 136315138;
        v35 = sub_235CA2F88();
        sub_235C944B8(v35, v36, &v47);
        sub_235CA3A14();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_235C5E000, v31, v32, "Posted buffered RC with id:%s to message bus before posting ResultSelectedMessage", v33, 0xCu);
        swift_arrayDestroy();
        v37 = v34;
        v14 = (_QWORD *)&unk_254299000;
        MEMORY[0x23B7DE144](v37, -1, -1);
        MEMORY[0x23B7DE144](v33, -1, -1);

      }
      else
      {

      }
      goto LABEL_27;
    }
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  v27 = (void *)v2[12];
  if (v27)
    goto LABEL_22;
LABEL_27:
  if (v14[93] != -1)
    swift_once();
  v38 = sub_235CA3708();
  __swift_project_value_buffer(v38, (uint64_t)qword_254299660);
  v39 = a1;
  v40 = sub_235CA36FC();
  v41 = sub_235CA3924();
  if (os_log_type_enabled(v40, v41))
  {
    v42 = (uint8_t *)swift_slowAlloc();
    v43 = swift_slowAlloc();
    v47 = v43;
    *(_DWORD *)v42 = 136315138;
    v44 = sub_235CA2F88();
    sub_235C944B8(v44, v45, &v47);
    sub_235CA3A14();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_235C5E000, v40, v41, "Posting ResultSelectedMessage for rcId: %s", v42, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B7DE144](v43, -1, -1);
    MEMORY[0x23B7DE144](v42, -1, -1);

  }
  else
  {

  }
  __swift_project_boxed_opaque_existential_1(v2 + 2, v2[5]);
  sub_235CA33B4();
  v2[11] = MEMORY[0x24BEE4B00];
  swift_bridgeObjectRelease();
}

uint64_t sub_235C77C78()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for BufferedResultCandidateHandler()
{
  return objc_opt_self();
}

uint64_t sub_235C77CD4(uint64_t a1)
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

uint64_t sub_235C77D5C(uint64_t result, int a2, uint64_t a3, uint64_t a4)
{
  if (result < 0 || 1 << *(_BYTE *)(a4 + 32) <= result)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (((*(_QWORD *)(a4 + (((unint64_t)result >> 3) & 0xFFFFFFFFFFFFF8) + 64) >> result) & 1) == 0)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (*(_DWORD *)(a4 + 36) == a2)
    return *(_QWORD *)(*(_QWORD *)(a4 + 56) + 8 * result);
LABEL_8:
  __break(1u);
  return result;
}

void sub_235C77DB0(void *a1, void (*a2)(_QWORD, _QWORD), uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
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
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  id v21;
  uint64_t v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  char v30;
  id v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  os_log_type_t v36;
  uint8_t *v37;
  uint64_t v38;
  uint8_t *v39;
  void (*v40)(_QWORD, _QWORD);
  uint64_t v41;
  NSObject *v42;
  os_log_type_t v43;
  uint8_t *v44;
  uint64_t v45;
  NSObject *v46;
  os_log_type_t v47;
  uint8_t *v48;
  uint64_t v49;
  const char *v50;
  id v51;
  void *v52;
  uint64_t v53;
  unint64_t v54;
  unint64_t v55;
  char *v56;
  char v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  void (*v61)(_QWORD, _QWORD);
  void (*v62)(_QWORD, _QWORD);
  id v63;
  char v64;
  NSObject *v65;
  os_log_type_t v66;
  uint8_t *v67;
  void *v68;
  uint64_t v69;
  _QWORD *v70;
  void *v71;
  uint64_t v72;
  NSObject *v73;
  os_log_type_t v74;
  char *v75;
  uint8_t *v76;
  uint8_t *v77;
  char v78;
  uint64_t v79;
  uint64_t v80;
  NSObject *v81;
  os_log_type_t v82;
  int v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  id v87;
  id v88;
  NSObject *v89;
  uint64_t v90;
  NSObject *v91;
  NSObject *v92;
  NSObject *v93;
  os_log_type_t v94;
  int v95;
  uint64_t v96;
  uint64_t v97;
  unint64_t v98;
  uint64_t v99;
  void (*v100)(_QWORD, _QWORD);
  void *v101;
  unsigned __int8 v102;
  uint64_t v103;
  uint64_t v104;
  _QWORD *v105;
  void *v106;
  uint64_t v107;
  NSObject *v108;
  os_log_type_t v109;
  uint8_t *v110;
  uint64_t v111;
  char v112;
  uint64_t v113;
  uint64_t v114;
  NSObject *v115;
  os_log_type_t v116;
  uint8_t *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  unsigned int v124;
  uint64_t v125;
  id v126;
  uint64_t v127;
  char *v128;
  void (*v129)(char *, uint64_t);
  void (*v130)(char *, uint64_t, uint64_t);
  uint64_t v131;
  uint64_t v132;
  void (*v133)(_QWORD, _QWORD);
  id v134;
  uint64_t aBlock;
  uint64_t v136;
  void (*v137)(uint64_t, void *, void *);
  void *v138;
  void (*v139)(void *, uint64_t);
  _QWORD *v140;
  uint64_t v141;
  uint64_t v142;

  v132 = a3;
  v133 = a2;
  v134 = a1;
  v4 = sub_235CA3420();
  v5 = (uint64_t (*)(uint64_t))MEMORY[0x24BE9AF20];
  v6 = *(_QWORD *)(v4 - 8);
  v7 = MEMORY[0x24BDAC7A8](v4);
  v128 = (char *)&v120 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v120 - v10;
  v12 = MEMORY[0x24BDAC7A8](v9);
  v14 = (char *)&v120 - v13;
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v120 - v15;
  v17 = v3;
  v18 = v3 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_requestType;
  v19 = *MEMORY[0x24BE9AEF8];
  v130 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 104);
  v130((char *)&v120 - v15, v19, v4);
  sub_235C69C18(&qword_256377718, v5, MEMORY[0x24BE9AF38]);
  v131 = v18;
  sub_235CA3894();
  sub_235CA3894();
  if (aBlock == v141 && v136 == v142)
  {
    swift_bridgeObjectRelease_n();
    v129 = *(void (**)(char *, uint64_t))(v6 + 8);
    v129(v16, v4);
  }
  else
  {
    v20 = sub_235CA3B88();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v129 = *(void (**)(char *, uint64_t))(v6 + 8);
    v129(v16, v4);
    if ((v20 & 1) == 0)
    {
      v130(v14, *MEMORY[0x24BE9AED8], v4);
      sub_235CA3894();
      sub_235CA3894();
      v21 = v134;
      v22 = v17;
      if (aBlock == v141 && v136 == v142)
      {
        swift_bridgeObjectRelease_n();
        v129(v14, v4);
      }
      else
      {
        v57 = sub_235CA3B88();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v129(v14, v4);
        if ((v57 & 1) == 0)
        {
          if (qword_2542992E8 != -1)
            swift_once();
          v58 = sub_235CA3708();
          __swift_project_value_buffer(v58, (uint64_t)qword_254299660);
          swift_retain();
          v46 = sub_235CA36FC();
          v47 = sub_235CA3930();
          if (os_log_type_enabled(v46, v47))
          {
            v48 = (uint8_t *)swift_slowAlloc();
            v49 = swift_slowAlloc();
            aBlock = v49;
            *(_DWORD *)v48 = 136315138;
            v59 = *(_QWORD *)(v17 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_requestId);
            v60 = *(_QWORD *)(v17 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_requestId + 8);
            swift_bridgeObjectRetain();
            v141 = sub_235C944B8(v59, v60, &aBlock);
            sub_235CA3A14();
            swift_release();
            swift_bridgeObjectRelease();
            v50 = "#AsrOnServer Exiting as the requestType is unsupported. Request: %s";
LABEL_37:
            _os_log_impl(&dword_235C5E000, v46, v47, v50, v48, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x23B7DE144](v49, -1, -1);
            MEMORY[0x23B7DE144](v48, -1, -1);

            v61 = v133;
            if (!v133)
              return;
LABEL_40:
            v61(0, 0);
            return;
          }
LABEL_39:

          swift_release();
          v61 = v133;
          if (!v133)
            return;
          goto LABEL_40;
        }
      }
      goto LABEL_6;
    }
  }
  v21 = v134;
  v22 = v17;
LABEL_6:
  v23 = objc_msgSend(v21, sel_refId);
  if (!v23)
    goto LABEL_17;
  v24 = v23;
  v25 = sub_235CA37EC();
  v27 = v26;

  v29 = *(_QWORD *)(v22 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_requestId);
  v28 = *(_QWORD *)(v22 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_requestId + 8);
  if (v25 == v29 && v27 == v28)
  {
    swift_bridgeObjectRelease();
    goto LABEL_11;
  }
  v30 = sub_235CA3B88();
  swift_bridgeObjectRelease();
  if ((v30 & 1) == 0)
  {
LABEL_17:
    v40 = v133;
    if (qword_2542992E8 != -1)
      swift_once();
    v41 = sub_235CA3708();
    __swift_project_value_buffer(v41, (uint64_t)qword_254299660);
    v42 = sub_235CA36FC();
    v43 = sub_235CA3930();
    if (os_log_type_enabled(v42, v43))
    {
      v44 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v44 = 0;
      _os_log_impl(&dword_235C5E000, v42, v43, "#AsrOnServer Response requestId does not match current requestId", v44, 2u);
      MEMORY[0x23B7DE144](v44, -1, -1);
    }

    if (v40)
      v40(0, 0);
    return;
  }
LABEL_11:
  v31 = objc_msgSend(v21, sel_processedAudioDuration);
  if (!v31)
  {
    if (qword_2542992E8 != -1)
      swift_once();
    v45 = sub_235CA3708();
    __swift_project_value_buffer(v45, (uint64_t)qword_254299660);
    swift_retain();
    v46 = sub_235CA36FC();
    v47 = sub_235CA3930();
    if (os_log_type_enabled(v46, v47))
    {
      v48 = (uint8_t *)swift_slowAlloc();
      v49 = swift_slowAlloc();
      aBlock = v49;
      *(_DWORD *)v48 = 136315138;
      swift_bridgeObjectRetain();
      v141 = sub_235C944B8(v29, v28, &aBlock);
      sub_235CA3A14();
      swift_release();
      swift_bridgeObjectRelease();
      v50 = "#AsrOnServer Failed to parse processedAudioDuration for request: %s";
      goto LABEL_37;
    }
    goto LABEL_39;
  }
  v32 = v31;
  objc_msgSend(v31, sel_doubleValue);

  if (*(_BYTE *)(v22 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_isMedocEnabled) != 1)
  {
    v125 = v29;
    v126 = objc_msgSend(v21, sel_recognition);

    v134 = (id)sub_235CA3990();
    v51 = objc_msgSend(v21, sel_resultId);
    if (v51)
    {
      v52 = v51;
      v53 = sub_235CA37EC();
      v55 = v54;

      v56 = v128;
    }
    else
    {
      v56 = v128;
      if (qword_2542992E8 != -1)
        swift_once();
      v72 = sub_235CA3708();
      __swift_project_value_buffer(v72, (uint64_t)qword_254299660);
      v73 = sub_235CA36FC();
      v74 = sub_235CA3930();
      if (os_log_type_enabled(v73, v74))
      {
        v75 = v56;
        v76 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v76 = 0;
        _os_log_impl(&dword_235C5E000, v73, v74, "#AsrOnServer resultCandidate does not contain resultId: using the default 0", v76, 2u);
        v77 = v76;
        v56 = v75;
        MEMORY[0x23B7DE144](v77, -1, -1);
      }

      v55 = 0xE100000000000000;
      v53 = 48;
    }
    v124 = *MEMORY[0x24BE9AED8];
    ((void (*)(char *))v130)(v56);
    v123 = sub_235C69C18(&qword_254299080, (uint64_t (*)(uint64_t))MEMORY[0x24BE9AF20], MEMORY[0x24BE9AF30]);
    v78 = sub_235CA37D4();
    v79 = ((uint64_t (*)(char *, uint64_t))v129)(v56, v4);
    if ((v78 & 1) != 0)
    {

      if (qword_2542992E8 != -1)
        swift_once();
      v127 = v53;
      v80 = sub_235CA3708();
      __swift_project_value_buffer(v80, (uint64_t)qword_254299660);
      swift_retain_n();
      swift_bridgeObjectRetain_n();
      v81 = sub_235CA36FC();
      v82 = sub_235CA3924();
      v83 = v82;
      if (os_log_type_enabled(v81, v82))
      {
        v84 = swift_slowAlloc();
        LODWORD(v122) = v83;
        v85 = v84;
        v121 = swift_slowAlloc();
        aBlock = v121;
        *(_DWORD *)v85 = 136315394;
        swift_bridgeObjectRetain();
        v141 = sub_235C944B8(v125, v28, &aBlock);
        sub_235CA3A14();
        swift_release_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v85 + 12) = 2080;
        swift_bridgeObjectRetain();
        v141 = sub_235C944B8(v127, v55, &aBlock);
        sub_235CA3A14();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_235C5E000, v81, (os_log_type_t)v122, "#AsrOnServer Not posting AsrResultCandidateMessage as the requestType is uos. request: %s rcId: %s", (uint8_t *)v85, 0x16u);
        v86 = v121;
        swift_arrayDestroy();
        MEMORY[0x23B7DE144](v86, -1, -1);
        MEMORY[0x23B7DE144](v85, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n();
        swift_release_n();
      }
      v100 = v133;
      if (v126)
      {
LABEL_71:
        v101 = *(void **)(v22 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_serviceHelper);
        v102 = objc_msgSend(v101, sel_respondsToSelector_, sel_selectResultWithResultCandidate_completion_);
        v103 = v127;
        if ((v102 & 1) == 0)
        {

          swift_bridgeObjectRelease();
          return;
        }
        v104 = swift_allocObject();
        swift_weakInit();
        v105 = (_QWORD *)swift_allocObject();
        v105[2] = v104;
        v105[3] = v100;
        v105[4] = v132;
        v105[5] = v103;
        v105[6] = v55;
        v139 = sub_235C7F1F8;
        v140 = v105;
        aBlock = MEMORY[0x24BDAC760];
        v136 = 1107296256;
        v137 = sub_235C8101C;
        v138 = &block_descriptor_17;
        v106 = _Block_copy(&aBlock);
        sub_235C7F124((uint64_t)v100);
        swift_unknownObjectRetain();
        swift_retain();
        swift_retain();
        swift_release();
        objc_msgSend(v101, sel_selectResultWithResultCandidate_completion_, v21, v106);
        _Block_release(v106);
        swift_release();
        swift_unknownObjectRelease();
        swift_release();
        goto LABEL_92;
      }
    }
    else
    {
      MEMORY[0x24BDAC7A8](v79);
      *(&v120 - 4) = v22;
      *(&v120 - 3) = v53;
      v87 = v134;
      *(&v120 - 2) = v55;
      *(&v120 - 1) = (uint64_t)v87;
      v88 = objc_allocWithZone((Class)sub_235CA2C40());
      v89 = sub_235CA2BE0();

      if (!v89)
      {
        swift_bridgeObjectRelease();
        if (qword_2542992E8 != -1)
          swift_once();
        v107 = sub_235CA3708();
        __swift_project_value_buffer(v107, (uint64_t)qword_254299660);
        swift_retain();
        v108 = sub_235CA36FC();
        v109 = sub_235CA3930();
        if (os_log_type_enabled(v108, v109))
        {
          v110 = (uint8_t *)swift_slowAlloc();
          v111 = swift_slowAlloc();
          aBlock = v111;
          *(_DWORD *)v110 = 136315138;
          swift_bridgeObjectRetain();
          v141 = sub_235C944B8(v125, v28, &aBlock);
          sub_235CA3A14();
          swift_release();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_235C5E000, v108, v109, "#AsrOnServer Failed to create AsrResultCandidateMessage for request: %s", v110, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x23B7DE144](v111, -1, -1);
          MEMORY[0x23B7DE144](v110, -1, -1);

        }
        else
        {

          swift_release();
        }
        if (v133)
          v133(0, 0);
        goto LABEL_92;
      }
      sub_235C76C80(v89);
      swift_bridgeObjectRelease();
      sub_235C71ED4(v125, v28, v53, v55);
      if (qword_2542992E8 != -1)
        swift_once();
      v127 = v53;
      v90 = sub_235CA3708();
      __swift_project_value_buffer(v90, (uint64_t)qword_254299660);
      v91 = v89;
      swift_retain();
      v92 = v91;
      v93 = sub_235CA36FC();
      v94 = sub_235CA3924();
      v95 = v94;
      if (os_log_type_enabled(v93, v94))
      {
        v96 = swift_slowAlloc();
        v122 = swift_slowAlloc();
        aBlock = v122;
        *(_DWORD *)v96 = 136315394;
        LODWORD(v121) = v95;
        swift_bridgeObjectRetain();
        v141 = sub_235C944B8(v125, v28, &aBlock);
        sub_235CA3A14();
        swift_release();
        swift_bridgeObjectRelease();
        *(_WORD *)(v96 + 12) = 2080;
        v97 = sub_235CA2F88();
        v141 = sub_235C944B8(v97, v98, &aBlock);
        sub_235CA3A14();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_235C5E000, v93, (os_log_type_t)v121, "#AsrOnServer Invoked posting of AsrResultCandidateMessage for request: %s rcId: %s", (uint8_t *)v96, 0x16u);
        v99 = v122;
        swift_arrayDestroy();
        MEMORY[0x23B7DE144](v99, -1, -1);
        MEMORY[0x23B7DE144](v96, -1, -1);

      }
      else
      {

        swift_release();
      }
      v100 = v133;
      v56 = v128;
      if (v126)
        goto LABEL_71;
    }
    v130(v56, v124, v4);
    v112 = sub_235CA37D4();
    v129(v56, v4);
    v113 = v127;
    if ((v112 & 1) != 0)
    {
      swift_bridgeObjectRelease();
      if (qword_2542992E8 != -1)
        swift_once();
      v114 = sub_235CA3708();
      __swift_project_value_buffer(v114, (uint64_t)qword_254299660);
      v115 = sub_235CA36FC();
      v116 = sub_235CA3930();
      if (os_log_type_enabled(v115, v116))
      {
        v117 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v117 = 0;
        _os_log_impl(&dword_235C5E000, v115, v116, "#AsrOnServer we are in StartUnderstandingOnServer path. Not posting ResultSelectedMessage. We shouldn't receive empty recognition for StartUnderstaingOnServer.", v117, 2u);
        MEMORY[0x23B7DE144](v117, -1, -1);
      }

    }
    else
    {
      v118 = swift_allocObject();
      swift_weakInit();
      v119 = swift_allocObject();
      *(_QWORD *)(v119 + 16) = v118;
      *(_QWORD *)(v119 + 24) = v113;
      *(_QWORD *)(v119 + 32) = v55;
      *(_BYTE *)(v119 + 40) = 0;
      swift_bridgeObjectRetain();
      swift_retain();
      sub_235C72238(0x7065636361204352, (void *)0xED000065636E6174, (uint64_t)sub_235C7F20C, v119);
      swift_bridgeObjectRelease();
      swift_release();
      swift_release();
    }
    if (v100)
      v100(0, 0);
LABEL_92:

    return;
  }
  if (qword_2542992E8 != -1)
    swift_once();
  v33 = sub_235CA3708();
  v34 = __swift_project_value_buffer(v33, (uint64_t)qword_254299660);
  swift_retain();
  v128 = (char *)v34;
  v35 = sub_235CA36FC();
  v36 = sub_235CA3924();
  if (os_log_type_enabled(v35, v36))
  {
    v37 = (uint8_t *)swift_slowAlloc();
    v127 = swift_slowAlloc();
    aBlock = v127;
    *(_DWORD *)v37 = 136315138;
    v126 = v37 + 4;
    swift_bridgeObjectRetain();
    v141 = sub_235C944B8(v29, v28, &aBlock);
    sub_235CA3A14();
    swift_release();
    v22 = v17;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_235C5E000, v35, v36, "#AsrOnServer Medoc enabled. Not posting AsrResultCandidateMessage for request: %s.", v37, 0xCu);
    v38 = v127;
    swift_arrayDestroy();
    MEMORY[0x23B7DE144](v38, -1, -1);
    v39 = v37;
    v21 = v134;
    MEMORY[0x23B7DE144](v39, -1, -1);

  }
  else
  {

    swift_release();
  }
  v62 = v133;
  v63 = objc_msgSend(v21, sel_recognition);

  v130(v11, *MEMORY[0x24BE9AED8], v4);
  sub_235CA3894();
  sub_235CA3894();
  if (aBlock == v141 && v136 == v142)
  {
    swift_bridgeObjectRelease_n();
    v129(v11, v4);
    if (!v63)
    {
LABEL_48:
      v65 = sub_235CA36FC();
      v66 = sub_235CA3930();
      if (os_log_type_enabled(v65, v66))
      {
        v67 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v67 = 0;
        _os_log_impl(&dword_235C5E000, v65, v66, "#AsrOnServer we are in StartUnderstandingOnServer path and received empty recognition, which shouldn't happen. Not posting ResultSelectedMessage.", v67, 2u);
        MEMORY[0x23B7DE144](v67, -1, -1);
      }

      if (v62)
        v62(0, 0);
      return;
    }
  }
  else
  {
    v64 = sub_235CA3B88();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v129(v11, v4);
    if ((v64 & 1) != 0 && !v63)
      goto LABEL_48;
  }
  v68 = *(void **)(v22 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_serviceHelper);
  if ((objc_msgSend(v68, sel_respondsToSelector_, sel_selectResultWithResultCandidate_completion_) & 1) != 0)
  {
    v69 = swift_allocObject();
    swift_weakInit();
    v70 = (_QWORD *)swift_allocObject();
    v70[2] = v69;
    v70[3] = v62;
    v70[4] = v132;
    v139 = sub_235C7F250;
    v140 = v70;
    aBlock = MEMORY[0x24BDAC760];
    v136 = 1107296256;
    v137 = sub_235C8101C;
    v138 = &block_descriptor_28;
    v71 = _Block_copy(&aBlock);
    swift_unknownObjectRetain();
    swift_retain();
    sub_235C7F124((uint64_t)v62);
    swift_retain();
    swift_release();
    objc_msgSend(v68, sel_selectResultWithResultCandidate_completion_, v21, v71);
    _Block_release(v71);
    swift_release();
    swift_release();
    swift_unknownObjectRelease();
  }
}

void sub_235C792F8(void *a1, uint64_t a2, uint64_t a3, void (*a4)(_QWORD, _QWORD), uint64_t a5)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t Strong;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  char v20;
  uint64_t v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  os_log_type_t v30;
  BOOL v31;
  void (*v32)(_QWORD, _QWORD);
  uint8_t *v33;
  char v34;
  void (*v35)(void *, _QWORD);
  id v36;
  NSObject *v37;
  os_log_type_t v38;
  uint8_t *v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  id v43;
  NSObject *v44;
  int v45;
  uint64_t v46;
  id v47;
  void *v48;
  uint64_t v49;
  unint64_t v50;
  unint64_t v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  int v56;
  uint64_t v57;
  void (*v58)(_QWORD, _QWORD);
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62[2];

  v59 = a5;
  v7 = sub_235CA3708();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v55 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_235CA3420();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v55 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  if (!Strong)
  {
    if (qword_2542992E8 != -1)
      swift_once();
    __swift_project_value_buffer(v7, (uint64_t)qword_254299660);
    v17 = sub_235CA36FC();
    v18 = sub_235CA3930();
    if (os_log_type_enabled(v17, v18))
    {
      v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_235C5E000, v17, v18, "#AsrOnServer self expired. Ignoring RC acceptance result.", v19, 2u);
      MEMORY[0x23B7DE144](v19, -1, -1);
    }

    if (a4)
      a4(0, 0);
    return;
  }
  v16 = Strong;
  v57 = v8;
  v58 = a4;
  (*(void (**)(char *, _QWORD, uint64_t))(v12 + 104))(v14, *MEMORY[0x24BE9AED8], v11);
  sub_235C69C18(&qword_256377718, (uint64_t (*)(uint64_t))MEMORY[0x24BE9AF20], MEMORY[0x24BE9AF38]);
  sub_235CA3894();
  sub_235CA3894();
  if (v62[0] == v60 && v62[1] == v61)
  {
    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
  else
  {
    v20 = sub_235CA3B88();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
    if ((v20 & 1) == 0)
    {
      if (v58)
        v58(0, 0);
      goto LABEL_26;
    }
  }
  if (!a1 || (objc_opt_self(), (v21 = swift_dynamicCastObjCClass()) == 0))
  {
    if (qword_2542992E8 != -1)
      swift_once();
    __swift_project_value_buffer(v7, (uint64_t)qword_254299660);
    v29 = sub_235CA36FC();
    v30 = sub_235CA393C();
    v31 = os_log_type_enabled(v29, v30);
    v32 = v58;
    if (v31)
    {
      v33 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v33 = 0;
      _os_log_impl(&dword_235C5E000, v29, v30, "#AsrOnServer Did not receive SAResultSelected for RC acceptance. RC not accepted.", v33, 2u);
      MEMORY[0x23B7DE144](v33, -1, -1);
    }

    if (v32)
      v32(0, 0);
LABEL_26:
    swift_release();
    return;
  }
  v22 = (void *)v21;
  v23 = a1;
  v24 = objc_msgSend(v22, sel_refId);
  if (v24)
  {
    v25 = v24;
    v26 = sub_235CA37EC();
    v28 = v27;

    if (v26 == *(_QWORD *)(v16 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_requestId)
      && v28 == *(_QWORD *)(v16 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_requestId + 8))
    {
      swift_bridgeObjectRelease();
LABEL_29:
      v35 = (void (*)(void *, _QWORD))v58;
      if (v58)
      {
        v36 = v23;
        v35(v22, 0);

      }
      if (qword_2542992E8 != -1)
        swift_once();
      __swift_project_value_buffer(v7, (uint64_t)qword_254299660);
      v37 = sub_235CA36FC();
      v38 = sub_235CA3924();
      if (os_log_type_enabled(v37, v38))
      {
        v39 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v39 = 0;
        _os_log_impl(&dword_235C5E000, v37, v38, "#AsrOnServer we are in StartUnderstandingOnServer path. Sent ResultSelected to the server.", v39, 2u);
        MEMORY[0x23B7DE144](v39, -1, -1);

        swift_release();
      }
      else
      {

        swift_release();
      }
      return;
    }
    v34 = sub_235CA3B88();
    swift_bridgeObjectRelease();
    if ((v34 & 1) != 0)
      goto LABEL_29;
  }
  if (qword_2542992E8 != -1)
    swift_once();
  v40 = __swift_project_value_buffer(v7, (uint64_t)qword_254299660);
  v41 = v57;
  (*(void (**)(char *, uint64_t, uint64_t))(v57 + 16))(v10, v40, v7);
  v42 = v23;
  swift_retain_n();
  v43 = v42;
  v44 = sub_235CA36FC();
  v45 = sub_235CA3930();
  if (os_log_type_enabled(v44, (os_log_type_t)v45))
  {
    v56 = v45;
    v46 = swift_slowAlloc();
    v55 = swift_slowAlloc();
    v62[0] = v55;
    *(_DWORD *)v46 = 136315394;
    v47 = objc_msgSend(v22, byte_25070F30E);
    if (!v47)
    {

      swift_release();
      __break(1u);
      return;
    }
    v48 = v47;
    v49 = sub_235CA37EC();
    v51 = v50;

    v60 = sub_235C944B8(v49, v51, v62);
    sub_235CA3A14();

    swift_bridgeObjectRelease();
    *(_WORD *)(v46 + 12) = 2080;
    v52 = *(_QWORD *)(v16 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_requestId);
    v53 = *(_QWORD *)(v16 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_requestId + 8);
    swift_bridgeObjectRetain();
    v60 = sub_235C944B8(v52, v53, v62);
    sub_235CA3A14();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_235C5E000, v44, (os_log_type_t)v56, "#AsrOnServer The refId of ResultSelected %s doesn't match current requestId: %s. Ignoring RC acceptance result.", (uint8_t *)v46, 0x16u);
    v54 = v55;
    swift_arrayDestroy();
    MEMORY[0x23B7DE144](v54, -1, -1);
    MEMORY[0x23B7DE144](v46, -1, -1);

    (*(void (**)(char *, uint64_t))(v57 + 8))(v10, v7);
  }
  else
  {

    swift_release_n();
    (*(void (**)(char *, uint64_t))(v41 + 8))(v10, v7);
  }
  if (v58)
    v58(0, 0);
  swift_release();

}

uint64_t sub_235C79A70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
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
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v27[2];

  v27[1] = a3;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542989B0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_254299050);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_254299070);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = *MEMORY[0x24BE9AD78];
  v17 = sub_235CA33CC();
  v18 = *(_QWORD *)(v17 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v18 + 104))(v15, v16, v17);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
  sub_235CA2C10();
  swift_bridgeObjectRetain();
  sub_235CA2BF8();
  v19 = a2 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_sessionId;
  v20 = sub_235CA2790();
  v21 = *(_QWORD *)(v20 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v21 + 16))(v12, v19, v20);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v21 + 56))(v12, 0, 1, v20);
  sub_235CA2C34();
  swift_bridgeObjectRetain();
  sub_235CA2C28();
  swift_bridgeObjectRetain();
  sub_235CA2BEC();
  v22 = a5;
  sub_235CA2C04();
  v23 = a2 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_userId;
  v24 = sub_235CA3498();
  v25 = *(_QWORD *)(v24 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v25 + 16))(v9, v23, v24);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v25 + 56))(v9, 0, 1, v24);
  return sub_235CA2C1C();
}

void sub_235C79CC4(void *a1, uint64_t a2, uint64_t a3, void (*a4)(_QWORD, _QWORD), uint64_t a5, NSObject *a6, void *a7)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t Strong;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  NSObject *v30;
  os_log_type_t v31;
  uint8_t *v32;
  char v33;
  uint64_t v34;
  id v35;
  id v36;
  NSObject *v37;
  int v38;
  uint64_t v39;
  id v40;
  void *v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  uint64_t v45;
  unint64_t v46;
  os_log_t v47;
  uint64_t v48;
  char v49;
  id v50;
  id v51;
  NSObject *v52;
  os_log_type_t v53;
  uint8_t *v54;
  id v55;
  void *v56;
  void *v57;
  id v58;
  char v59;
  char v60;
  uint64_t v61;
  uint64_t v62;
  os_log_t v63;
  id v64;
  uint64_t v65;
  id v66;
  void (*v67)(_QWORD, _QWORD);
  uint64_t v68;
  id v69;
  os_log_t v70;
  id v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74[2];

  v70 = a6;
  v71 = a7;
  v10 = sub_235CA3708();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v65 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_235CA3420();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v65 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  if (Strong)
  {
    v19 = Strong;
    if (a1)
    {
      objc_opt_self();
      v20 = swift_dynamicCastObjCClass();
      if (v20)
      {
        v68 = a5;
        v21 = (void *)v20;
        v69 = a1;
        v66 = v21;
        v22 = objc_msgSend(v21, sel_refId);
        if (v22)
        {
          v23 = v22;
          v67 = a4;
          v24 = sub_235CA37EC();
          v26 = v25;

          v65 = v19;
          if (v24 == *(_QWORD *)(v19 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_requestId)
            && v26 == *(_QWORD *)(v19 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_requestId + 8))
          {
            swift_bridgeObjectRelease();
            a4 = v67;
LABEL_22:
            (*(void (**)(char *, _QWORD, uint64_t))(v15 + 104))(v17, *MEMORY[0x24BE9AED8], v14);
            sub_235C69C18(&qword_256377718, (uint64_t (*)(uint64_t))MEMORY[0x24BE9AF20], MEMORY[0x24BE9AF38]);
            sub_235CA3894();
            sub_235CA3894();
            if (v74[0] == v72 && v74[1] == v73)
            {
              swift_bridgeObjectRelease_n();
              (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
            }
            else
            {
              v49 = sub_235CA3B88();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
              if ((v49 & 1) == 0)
              {
                v55 = objc_msgSend(v66, sel_isMitigated);
                sub_235C71624(0, (unint64_t *)&unk_254299400);
                v56 = (void *)sub_235CA39D8();
                v57 = v56;
                v50 = v69;
                if (v55)
                {
                  v58 = v55;
                  v59 = sub_235CA39E4();

                  v60 = v59 ^ 1;
                }
                else
                {

                  v60 = 1;
                }
                v61 = swift_allocObject();
                swift_weakInit();
                v62 = swift_allocObject();
                v63 = v70;
                v64 = v71;
                *(_QWORD *)(v62 + 16) = v61;
                *(_QWORD *)(v62 + 24) = v63;
                *(_QWORD *)(v62 + 32) = v64;
                *(_BYTE *)(v62 + 40) = v60 & 1;
                swift_retain();
                swift_bridgeObjectRetain();
                sub_235C72238(0x7065636361204352, (void *)0xED000065636E6174, (uint64_t)sub_235C7F29C, v62);
                swift_release();
                swift_release();
                if (a4)
                  a4(0, 0);
LABEL_47:
                swift_release();

                return;
              }
            }
            v50 = v69;
            if (a4)
            {
              v51 = v69;
              a4(v66, 0);

            }
            if (qword_2542992E8 != -1)
              swift_once();
            __swift_project_value_buffer(v10, (uint64_t)qword_254299660);
            v52 = sub_235CA36FC();
            v53 = sub_235CA3924();
            if (os_log_type_enabled(v52, v53))
            {
              v54 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)v54 = 0;
              _os_log_impl(&dword_235C5E000, v52, v53, "#AsrOnServer we are in StartUnderstandingOnServer path. Sent ResultSelected to the server.", v54, 2u);
              MEMORY[0x23B7DE144](v54, -1, -1);

              swift_release();
              return;
            }

            goto LABEL_47;
          }
          v33 = sub_235CA3B88();
          swift_bridgeObjectRelease();
          a4 = v67;
          v19 = v65;
          if ((v33 & 1) != 0)
            goto LABEL_22;
        }
        if (qword_2542992E8 != -1)
          swift_once();
        v34 = __swift_project_value_buffer(v10, (uint64_t)qword_254299660);
        (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, v34, v10);
        v35 = v69;
        swift_retain_n();
        v36 = v35;
        v37 = sub_235CA36FC();
        v38 = sub_235CA3930();
        if (os_log_type_enabled(v37, (os_log_type_t)v38))
        {
          LODWORD(v69) = v38;
          v70 = v37;
          v71 = v36;
          v67 = a4;
          v39 = swift_slowAlloc();
          v65 = swift_slowAlloc();
          v74[0] = v65;
          *(_DWORD *)v39 = 136315394;
          v40 = objc_msgSend(v66, sel_refId);
          if (!v40)
          {

            swift_release();
            __break(1u);
            return;
          }
          v41 = v40;
          v42 = sub_235CA37EC();
          v44 = v43;

          v72 = sub_235C944B8(v42, v44, v74);
          sub_235CA3A14();
          v36 = v71;

          swift_bridgeObjectRelease();
          *(_WORD *)(v39 + 12) = 2080;
          v45 = *(_QWORD *)(v19 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_requestId);
          v46 = *(_QWORD *)(v19 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_requestId + 8);
          swift_bridgeObjectRetain();
          v72 = sub_235C944B8(v45, v46, v74);
          sub_235CA3A14();
          swift_release_n();
          swift_bridgeObjectRelease();
          v47 = v70;
          _os_log_impl(&dword_235C5E000, v70, (os_log_type_t)v69, "#AsrOnServer The refId of ResultSelected %s doesn't match the current requestId: %s. Ignoring RC acceptance result.", (uint8_t *)v39, 0x16u);
          v48 = v65;
          swift_arrayDestroy();
          MEMORY[0x23B7DE144](v48, -1, -1);
          MEMORY[0x23B7DE144](v39, -1, -1);

          (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
          a4 = v67;
          if (!v67)
          {
LABEL_33:
            swift_release();

            return;
          }
        }
        else
        {

          swift_release_n();
          (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
          if (!a4)
            goto LABEL_33;
        }
        a4(0, 0);
        goto LABEL_33;
      }
    }
    if (qword_2542992E8 != -1)
      swift_once();
    __swift_project_value_buffer(v10, (uint64_t)qword_254299660);
    v27 = sub_235CA36FC();
    v28 = sub_235CA393C();
    if (os_log_type_enabled(v27, v28))
    {
      v29 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v29 = 0;
      _os_log_impl(&dword_235C5E000, v27, v28, "#AsrOnServer Did not receive SAResultSelected for RC acceptance. RC not accepted.", v29, 2u);
      MEMORY[0x23B7DE144](v29, -1, -1);
    }

    if (a4)
      a4(0, 0);
    swift_release();
  }
  else
  {
    if (qword_2542992E8 != -1)
      swift_once();
    __swift_project_value_buffer(v10, (uint64_t)qword_254299660);
    v30 = sub_235CA36FC();
    v31 = sub_235CA3930();
    if (os_log_type_enabled(v30, v31))
    {
      v32 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v32 = 0;
      _os_log_impl(&dword_235C5E000, v30, v31, "#AsrOnServer self expired. Ignoring RC acceptance result.", v32, 2u);
      MEMORY[0x23B7DE144](v32, -1, -1);
    }

    if (a4)
      a4(0, 0);
  }
}

void sub_235C7A590(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  os_log_type_t v17;
  _BOOL4 v18;
  uint8_t *v19;
  unint64_t v20;
  _QWORD *v21;
  id v22;
  _QWORD *v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  id v31;
  void *v32;
  uint8_t *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  void *v38;
  uint64_t v39;
  NSObject *v40;
  os_log_type_t v41;
  _BOOL4 v42;
  uint8_t *v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  NSObject *v48;
  os_log_type_t v49;
  uint8_t *v50;
  const char *v51;
  uint8_t *v52;
  NSObject *v53;
  os_log_type_t v54;
  uint8_t *v55;
  _QWORD *v56;
  NSObject *v57;
  NSObject *v58;
  int64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  uint64_t v64;
  unint64_t v65;
  int64_t v66;
  unint64_t v67;
  int64_t v68;
  void *v69;
  id v70;
  id v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  id v75;
  id v76;
  uint64_t v77;
  id v78;
  void *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  id v83;
  void *v84;
  void *v85;
  uint64_t v86;
  uint64_t v87;
  id v88;
  uint64_t v89;
  char isUniquelyReferenced_nonNull_native;
  NSObject *v91;
  NSObject *v92;
  os_log_type_t v93;
  uint8_t *v94;
  NSObject *v95;
  _QWORD *v96;
  uint64_t v97;
  void *v98;
  uint64_t v99;
  uint64_t v100;
  uint8_t *v101;
  id v102;
  id v103;
  void *v104;
  unint64_t v105;
  NSObject *v106;
  NSObject *v107;
  os_log_type_t v108;
  NSObject *v109;
  uint8_t *v110;
  uint8_t *v111;
  uint8_t *v112;
  id v113;
  id v114;
  id v115;
  uint64_t v116;
  unint64_t v117;
  id v118;
  NSObject *v119;
  NSObject *v120;
  os_log_type_t v121;
  uint64_t v122;
  uint64_t v123;
  unint64_t v124;
  _QWORD *v125;
  NSObject *v126;
  os_log_type_t v127;
  uint64_t v128;
  uint64_t v129;
  unint64_t v130;
  uint8_t *v131;
  uint64_t v132;
  uint64_t v133;
  void *v134;
  uint64_t v135;
  uint8_t *v136;
  uint64_t v137;
  NSObject *v138;
  char v139;
  NSObject *v140;
  uint64_t v141;
  _QWORD *v142;
  uint64_t v143;
  uint64_t v144;
  void *v145;
  void *v146;
  uint64_t v147;
  void (*v148)(_QWORD, _QWORD);
  uint64_t v149;
  uint64_t v150;
  int64_t v151;
  uint64_t v152;
  uint64_t v153;
  unint64_t v154;
  uint8_t *v155;
  id v156;
  uint64_t v157;
  char *v158;
  uint64_t v159;
  char *v160;
  char *v161;
  _QWORD *v162;
  NSObject *v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166[3];
  _QWORD v167[2];

  v5 = v4;
  v147 = a4;
  v145 = a2;
  v8 = sub_235CA3498();
  v159 = *(_QWORD *)(v8 - 8);
  v160 = (char *)v8;
  v9 = MEMORY[0x24BDAC7A8](v8);
  v158 = (char *)&v143 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v143 - v11;
  if (qword_2542992E8 == -1)
    goto LABEL_2;
LABEL_85:
  swift_once();
LABEL_2:
  v13 = sub_235CA3708();
  v14 = __swift_project_value_buffer(v13, (uint64_t)qword_254299660);
  v15 = a1;
  v149 = v14;
  v16 = sub_235CA36FC();
  v17 = sub_235CA3924();
  v18 = os_log_type_enabled(v16, v17);
  v148 = (void (*)(_QWORD, _QWORD))a3;
  v161 = v12;
  if (v18)
  {
    v19 = (uint8_t *)swift_slowAlloc();
    v20 = v5;
    v21 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v19 = 138412290;
    v166[0] = (uint64_t)v15;
    v22 = v15;
    sub_235CA3A14();
    *v21 = v15;

    _os_log_impl(&dword_235C5E000, v16, v17, "#AsrOnServer Received %@", v19, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254299410);
    swift_arrayDestroy();
    v23 = v21;
    v5 = v20;
    MEMORY[0x23B7DE144](v23, -1, -1);
    MEMORY[0x23B7DE144](v19, -1, -1);

  }
  else
  {

  }
  v24 = objc_msgSend(v15, sel_refId, v143);
  if (!v24)
  {
LABEL_14:
    v48 = sub_235CA36FC();
    v49 = sub_235CA3930();
    if (!os_log_type_enabled(v48, v49))
      goto LABEL_20;
    v50 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v50 = 0;
    v51 = "#AsrOnServer Response refId does not match current requestId";
    goto LABEL_16;
  }
  v25 = v24;
  v26 = sub_235CA37EC();
  v28 = v27;

  v29 = *(_QWORD *)(v5 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_requestId);
  a3 = *(_QWORD *)(v5 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_requestId + 8);
  if (v26 == v29 && v28 == a3)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v30 = sub_235CA3B88();
    swift_bridgeObjectRelease();
    if ((v30 & 1) == 0)
      goto LABEL_14;
  }
  v31 = objc_msgSend(v15, sel_rcID);
  if (!v31)
  {
    v53 = v15;
    v48 = sub_235CA36FC();
    v54 = sub_235CA3930();
    if (os_log_type_enabled(v48, v54))
    {
      v55 = (uint8_t *)swift_slowAlloc();
      v56 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v55 = 138412290;
      v166[0] = (uint64_t)v53;
      v57 = v53;
      sub_235CA3A14();
      *v56 = v53;

      _os_log_impl(&dword_235C5E000, v48, v54, "#AsrOnServer No rcId found in %@", v55, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254299410);
      swift_arrayDestroy();
      MEMORY[0x23B7DE144](v56, -1, -1);
      v52 = v55;
LABEL_19:
      MEMORY[0x23B7DE144](v52, -1, -1);
    }
    else
    {

      v48 = v53;
    }
LABEL_20:

    if (v148)
      v148(0, 0);
    return;
  }
  v32 = v31;
  v33 = (uint8_t *)sub_235CA37EC();
  v34 = v15;
  v36 = v35;

  v156 = v34;
  v37 = objc_msgSend(v34, sel_resultCandidates);
  if (!v37)
  {
    swift_bridgeObjectRelease();
    v48 = sub_235CA36FC();
    v49 = sub_235CA3930();
    if (!os_log_type_enabled(v48, v49))
      goto LABEL_20;
    v50 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v50 = 0;
    v51 = "#AsrOnServer No result candidates found";
LABEL_16:
    _os_log_impl(&dword_235C5E000, v48, v49, v51, v50, 2u);
    v52 = v50;
    goto LABEL_19;
  }
  v38 = v37;
  sub_235C71624(0, (unint64_t *)&unk_256377720);
  v39 = sub_235CA3798();

  swift_bridgeObjectRetain_n();
  v40 = sub_235CA36FC();
  v41 = sub_235CA3924();
  v12 = (char *)v41;
  v42 = os_log_type_enabled(v40, v41);
  v154 = v5;
  v155 = v33;
  v157 = v39;
  v144 = a3;
  v143 = v29;
  if (v42)
  {
    a3 = 12;
    v43 = (uint8_t *)swift_slowAlloc();
    v44 = swift_slowAlloc();
    v166[0] = v44;
    *(_DWORD *)v43 = 136315138;
    swift_bridgeObjectRetain();
    v45 = sub_235CA37B0();
    v47 = v46;
    swift_bridgeObjectRelease();
    v164 = sub_235C944B8(v45, v47, v166);
    sub_235CA3A14();
    swift_bridgeObjectRelease_n();
    v39 = v157;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_235C5E000, v40, (os_log_type_t)v12, "#AsrOnServer muxResultCandidate received with recognitions for the following userIds: %s", v43, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B7DE144](v44, -1, -1);
    MEMORY[0x23B7DE144](v43, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v167[0] = sub_235C8EDA8(MEMORY[0x24BEE4AF8]);
  a1 = (void *)sub_235C71624(0, (unint64_t *)&unk_254299400);
  v146 = a1;
  v58 = sub_235CA39D8();
  v59 = 0;
  v60 = *(_QWORD *)(v39 + 64);
  v150 = v39 + 64;
  v61 = 1 << *(_BYTE *)(v39 + 32);
  v62 = -1;
  if (v61 < 64)
    v62 = ~(-1 << v61);
  v5 = v62 & v60;
  v153 = OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_muxRequestContext;
  v151 = (unint64_t)(v61 + 63) >> 6;
  v152 = v36;
  if ((v62 & v60) != 0)
  {
LABEL_28:
    v63 = __clz(__rbit64(v5));
    v64 = (v5 - 1) & v5;
    v65 = v63 | (v59 << 6);
    goto LABEL_43;
  }
  while (1)
  {
    v66 = v59 + 1;
    if (__OFADD__(v59, 1))
    {
      __break(1u);
      goto LABEL_85;
    }
    if (v66 >= v151)
      goto LABEL_53;
    v67 = *(_QWORD *)(v150 + 8 * v66);
    ++v59;
    if (!v67)
    {
      v59 = v66 + 1;
      if (v66 + 1 >= v151)
        goto LABEL_53;
      v67 = *(_QWORD *)(v150 + 8 * v59);
      if (!v67)
      {
        v59 = v66 + 2;
        if (v66 + 2 >= v151)
          goto LABEL_53;
        v67 = *(_QWORD *)(v150 + 8 * v59);
        if (!v67)
          break;
      }
    }
LABEL_42:
    v64 = (v67 - 1) & v67;
    v65 = __clz(__rbit64(v67)) + (v59 << 6);
LABEL_43:
    v69 = *(void **)(*(_QWORD *)(v39 + 56) + 8 * v65);
    swift_bridgeObjectRetain();
    v70 = v69;
    v71 = objc_msgSend(v70, sel_resultId);
    if (!v71)
    {
      v163 = v58;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v91 = v156;
      v92 = sub_235CA36FC();
      v93 = sub_235CA3930();
      if (os_log_type_enabled(v92, v93))
      {
        v94 = (uint8_t *)swift_slowAlloc();
        v162 = (_QWORD *)swift_slowAlloc();
        *(_DWORD *)v94 = 138412290;
        v166[0] = (uint64_t)v91;
        v95 = v91;
        sub_235CA3A14();
        v96 = v162;
        *v162 = v91;

        _os_log_impl(&dword_235C5E000, v92, v93, "#AsrOnServer Malformed or missing resultId in %@", v94, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254299410);
        swift_arrayDestroy();
        MEMORY[0x23B7DE144](v96, -1, -1);
        MEMORY[0x23B7DE144](v94, -1, -1);
      }
      else
      {

        v92 = v91;
      }

      v106 = v163;
      if (v148)
      {
        v148(0, 0);
        swift_release();

      }
      else
      {

        swift_release();
      }
      goto LABEL_82;
    }
    v72 = v71;
    v162 = (_QWORD *)v64;
    v163 = sub_235CA37EC();
    v74 = v73;

    v75 = objc_msgSend(v70, sel_processedAudioDuration);
    if (!v75)
      v75 = (id)sub_235CA39D8();

    sub_235CA3804();
    v76 = v75;
    swift_bridgeObjectRelease();
    v77 = (uint64_t)v161;
    sub_235CA3480();
    v78 = objc_msgSend(v156, sel_refId);
    if (!v78)
      goto LABEL_87;
    v79 = v78;
    v80 = sub_235CA37EC();
    v82 = v81;

    LODWORD(v79) = objc_msgSend(v76, sel_unsignedIntValue);
    a3 = (uint64_t)v76;

    v36 = v152;
    sub_235C7E684(v77, v155, v152, (uint64_t)v163, v74, v70, v80, v82, (int)v79);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v83 = objc_msgSend(v70, sel_processedAudioDuration);
    if (!v83)
      goto LABEL_88;
    v84 = v83;
    sub_235CA3900();

    v85 = (void *)sub_235CA3990();
    v87 = (uint64_t)v158;
    v86 = v159;
    v12 = v160;
    (*(void (**)(char *, uint64_t, char *))(v159 + 16))(v158, v77, v160);
    v88 = v85;
    v89 = v167[0];
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v166[0] = v89;
    sub_235C9DCDC((uint64_t)v88, v87, isUniquelyReferenced_nonNull_native);
    v167[0] = v166[0];
    swift_bridgeObjectRelease();
    a1 = *(void **)(v86 + 8);
    ((void (*)(uint64_t, char *))a1)(v87, v12);

    ((void (*)(uint64_t, char *))a1)(v77, v12);
    v58 = a3;
    v39 = v157;
    v5 = (unint64_t)v162;
    if (v162)
      goto LABEL_28;
  }
  v68 = v66 + 3;
  if (v68 >= v151)
  {
LABEL_53:
    v97 = swift_release();
    v98 = v145;
    if (!v145)
    {
      swift_bridgeObjectRelease();
      v107 = sub_235CA36FC();
      v108 = sub_235CA3930();
      if (os_log_type_enabled(v107, v108))
      {
        v109 = v58;
        v110 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v110 = 0;
        _os_log_impl(&dword_235C5E000, v107, v108, "#AsrOnServer no voiceIdScoreCard exists.  This would be caused by a missing or invalid HomeMemberInfo", v110, 2u);
        v111 = v110;
        v58 = v109;
        MEMORY[0x23B7DE144](v111, -1, -1);
      }

      if (v148)
        v148(0, 0);

      goto LABEL_82;
    }
    v163 = v58;
    v99 = v154;
    if ((*(_BYTE *)(v154 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_isIdentityScoreConsumptionEnabled) & 1) != 0)
    {
      v100 = 0xD000000000000017;
      MEMORY[0x24BDAC7A8](v97);
      v101 = v155;
      *(&v143 - 4) = v99;
      *(&v143 - 3) = (uint64_t)v101;
      v141 = v36;
      v142 = v167;
      v102 = objc_allocWithZone((Class)sub_235CA2A48());
      v103 = v98;
      v104 = (void *)sub_235CA29F4();
      v105 = 0x8000000235CA5E30;
      if (!v104)
        goto LABEL_70;
    }
    else
    {
      MEMORY[0x24BDAC7A8](v97);
      v112 = v155;
      *(&v143 - 6) = v99;
      *(&v143 - 5) = (uint64_t)v112;
      *(&v143 - 4) = v36;
      *(&v143 - 3) = (uint64_t)v167;
      v141 = (uint64_t)v98;
      v113 = objc_allocWithZone((Class)sub_235CA2F64());
      v114 = v98;
      v104 = (void *)sub_235CA2F04();
      v100 = 0xD00000000000001CLL;
      v105 = 0x8000000235CA5E10;
      if (!v104)
      {
LABEL_70:
        swift_bridgeObjectRelease();
        swift_retain_n();
        swift_bridgeObjectRetain();
        v126 = sub_235CA36FC();
        v127 = sub_235CA3930();
        if (os_log_type_enabled(v126, v127))
        {
          v128 = swift_slowAlloc();
          v129 = swift_slowAlloc();
          v166[0] = v129;
          *(_DWORD *)v128 = 136315394;
          swift_bridgeObjectRetain();
          v164 = sub_235C944B8(v100, v105, v166);
          sub_235CA3A14();
          swift_bridgeObjectRelease_n();
          *(_WORD *)(v128 + 12) = 2080;
          v130 = v144;
          swift_bridgeObjectRetain();
          v164 = sub_235C944B8(v143, v130, v166);
          sub_235CA3A14();
          swift_release_n();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_235C5E000, v126, v127, "#AsrOnServer Failed to create %s for request: %s", (uint8_t *)v128, 0x16u);
          swift_arrayDestroy();
          MEMORY[0x23B7DE144](v129, -1, -1);
          MEMORY[0x23B7DE144](v128, -1, -1);

        }
        else
        {

          swift_bridgeObjectRelease_n();
          swift_release_n();
        }

LABEL_82:
        swift_bridgeObjectRelease();
        return;
      }
      v101 = v155;
    }
    v115 = v104;
    v116 = v143;
    v117 = v144;
    sub_235C71F04(v143, v144, (uint64_t)v101, v36);
    v118 = v115;
    swift_retain_n();
    v119 = v118;
    swift_bridgeObjectRetain();
    v120 = sub_235CA36FC();
    v121 = sub_235CA3924();
    if (os_log_type_enabled(v120, v121))
    {
      v122 = swift_slowAlloc();
      v162 = (_QWORD *)swift_slowAlloc();
      v166[0] = (uint64_t)v162;
      *(_DWORD *)v122 = 136315650;
      swift_bridgeObjectRetain();
      v164 = sub_235C944B8(v100, v105, v166);
      sub_235CA3A14();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v122 + 12) = 2080;
      swift_bridgeObjectRetain();
      v164 = sub_235C944B8(v116, v117, v166);
      sub_235CA3A14();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v122 + 22) = 2080;
      v123 = sub_235CA2F88();
      v164 = sub_235C944B8(v123, v124, v166);
      sub_235CA3A14();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_235C5E000, v120, v121, "#AsrOnServer Posting result candidate event %s for request: %s rcId: %s", (uint8_t *)v122, 0x20u);
      v125 = v162;
      swift_arrayDestroy();
      MEMORY[0x23B7DE144](v125, -1, -1);
      MEMORY[0x23B7DE144](v122, -1, -1);

    }
    else
    {

      swift_release_n();
      swift_bridgeObjectRelease_n();
    }
    sub_235C76C80(v119);
    v133 = *(_QWORD *)(v99 + v153);
    v134 = v145;
    v135 = v152;
    if (v132)
    {
      v136 = v131;
      v137 = v132;
      swift_bridgeObjectRelease();
      *(_BYTE *)(v133 + 40) = 1;
      swift_beginAccess();
      *(_QWORD *)(v133 + 32) = MEMORY[0x24BEE4B00];
      swift_bridgeObjectRelease();
      v135 = v137;
      v138 = v163;
    }
    else
    {
      v138 = v163;
      v136 = v155;
    }
    swift_beginAccess();
    swift_bridgeObjectRetain();
    v139 = swift_isUniquelyReferenced_nonNull_native();
    v165 = *(_QWORD *)(v133 + 32);
    *(_QWORD *)(v133 + 32) = 0x8000000000000000;
    sub_235C9DB84(0, (uint64_t)v136, v135, v139);
    *(_QWORD *)(v133 + 32) = v165;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_endAccess();
    swift_bridgeObjectRelease();
    if (v148)
    {
      v148(0, 0);
      v140 = v119;
    }
    else
    {
      v140 = v138;
      v138 = v119;
    }

    goto LABEL_82;
  }
  v67 = *(_QWORD *)(v150 + 8 * v68);
  if (v67)
  {
    v59 = v68;
    goto LABEL_42;
  }
  while (1)
  {
    v59 = v68 + 1;
    if (__OFADD__(v68, 1))
      break;
    if (v59 >= v151)
      goto LABEL_53;
    v67 = *(_QWORD *)(v150 + 8 * v59);
    ++v68;
    if (v67)
      goto LABEL_42;
  }
  __break(1u);
LABEL_87:
  __break(1u);
LABEL_88:
  __break(1u);
}

uint64_t sub_235C7B864(uint64_t a1, uint64_t a2)
{
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_254299050);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254299070);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *MEMORY[0x24BE9AD78];
  v10 = sub_235CA33CC();
  v11 = *(_QWORD *)(v10 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 104))(v8, v9, v10);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  sub_235CA2A24();
  swift_bridgeObjectRetain();
  sub_235CA2A0C();
  v12 = a2 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_sessionId;
  v13 = sub_235CA2790();
  v14 = *(_QWORD *)(v13 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v5, v12, v13);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v5, 0, 1, v13);
  sub_235CA2A3C();
  swift_bridgeObjectRetain();
  sub_235CA2A30();
  swift_bridgeObjectRetain();
  sub_235CA2A18();
  swift_bridgeObjectRetain();
  return sub_235CA2A00();
}

uint64_t sub_235C7BA2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  _QWORD v22[2];

  v22[1] = a5;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_254299050);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_254299070);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = *MEMORY[0x24BE9AD78];
  v15 = sub_235CA33CC();
  v16 = *(_QWORD *)(v15 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 104))(v13, v14, v15);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
  sub_235CA2F40();
  swift_bridgeObjectRetain();
  sub_235CA2F1C();
  v17 = a2 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_sessionId;
  v18 = sub_235CA2790();
  v19 = *(_QWORD *)(v18 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v10, v17, v18);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v19 + 56))(v10, 0, 1, v18);
  sub_235CA2F58();
  swift_bridgeObjectRetain();
  sub_235CA2F4C();
  swift_bridgeObjectRetain();
  sub_235CA2F10();
  swift_bridgeObjectRetain();
  sub_235CA2F34();
  v20 = a6;
  return sub_235CA2F28();
}

void sub_235C7BC0C(void *a1, void *a2)
{
  char *v2;
  char *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  NSObject *v13;
  os_log_type_t v14;
  _BOOL4 v15;
  uint64_t v16;
  uint8_t *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  _QWORD *v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  char v30;
  _QWORD *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  os_log_type_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  char *v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  NSObject *v44;
  os_log_type_t v45;
  uint8_t *v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  char *v50;
  NSObject *v51;
  os_log_type_t v52;
  uint8_t *v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  NSObject *v57;
  os_log_type_t v58;
  uint8_t *v59;
  char *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  _QWORD *v64;
  id v65;
  void *v66;
  char *v67;
  id v68;
  id v69;
  void *v70;
  id v71;
  NSObject *v72;
  os_log_type_t v73;
  uint8_t *v74;
  uint64_t v75;
  _QWORD *v76;
  uint64_t v77;
  uint64_t v78;
  char *v79;
  id v80;
  id aBlock;
  uint64_t v82;
  void (*v83)(uint64_t, void *, void *);
  void *v84;
  void (*v85)(void *, uint64_t);
  _QWORD *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;

  v3 = v2;
  v6 = sub_235CA3420();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v75 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2542992E8 != -1)
    swift_once();
  v10 = sub_235CA3708();
  v11 = __swift_project_value_buffer(v10, (uint64_t)qword_254299660);
  v12 = a1;
  v13 = sub_235CA36FC();
  v14 = sub_235CA3924();
  v15 = os_log_type_enabled(v13, v14);
  v80 = a2;
  if (v15)
  {
    v16 = swift_slowAlloc();
    v78 = v11;
    v17 = (uint8_t *)v16;
    v18 = swift_slowAlloc();
    v79 = v3;
    v76 = (_QWORD *)v18;
    *(_DWORD *)v17 = 138412290;
    aBlock = v12;
    v19 = v12;
    v77 = v6;
    v20 = v7;
    v21 = v19;
    sub_235CA3A14();
    v22 = v76;
    *v76 = v12;

    v7 = v20;
    v6 = v77;
    _os_log_impl(&dword_235C5E000, v13, v14, "#AsrOnServer Received %@", v17, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254299410);
    swift_arrayDestroy();
    v3 = v79;
    MEMORY[0x23B7DE144](v22, -1, -1);
    MEMORY[0x23B7DE144](v17, -1, -1);

  }
  else
  {

  }
  (*(void (**)(char *, _QWORD, uint64_t))(v7 + 104))(v9, *MEMORY[0x24BE9AEF8], v6);
  sub_235C69C18(&qword_256377718, (uint64_t (*)(uint64_t))MEMORY[0x24BE9AF20], MEMORY[0x24BE9AF38]);
  sub_235CA3894();
  sub_235CA3894();
  if (aBlock == (id)v88 && v82 == v89)
  {
    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  else
  {
    v23 = sub_235CA3B88();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    if ((v23 & 1) == 0)
    {
      swift_retain();
      v44 = sub_235CA36FC();
      v45 = sub_235CA3930();
      if (os_log_type_enabled(v44, v45))
      {
        v46 = (uint8_t *)swift_slowAlloc();
        v47 = swift_slowAlloc();
        aBlock = (id)v47;
        *(_DWORD *)v46 = 136315138;
        v48 = *(_QWORD *)&v3[OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_requestId];
        v49 = *(_QWORD *)&v3[OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_requestId + 8];
        swift_bridgeObjectRetain();
        v88 = sub_235C944B8(v48, v49, (uint64_t *)&aBlock);
        sub_235CA3A14();
        swift_release();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_235C5E000, v44, v45, "#AsrOnServer Exiting as the requestType is unsupported. Request: %s", v46, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x23B7DE144](v47, -1, -1);
        MEMORY[0x23B7DE144](v46, -1, -1);

        return;
      }

      goto LABEL_34;
    }
  }
  v24 = *(_QWORD *)&v3[OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_muxRequestContext];
  v25 = sub_235CA2F88();
  v27 = v26;
  swift_beginAccess();
  v28 = *(_QWORD *)(v24 + 24);
  if (*(_QWORD *)(v28 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v29 = sub_235C9BACC(v25, v27);
    if ((v30 & 1) != 0)
    {
      v31 = *(_QWORD **)(*(_QWORD *)(v28 + 56) + 8 * v29);
      swift_retain();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      v32 = v80;
      if (v80)
      {
        v79 = v12;
        v33 = v31[4];
        v34 = v31[5];
        swift_beginAccess();
        v80 = v32;
        swift_bridgeObjectRetain();
        sub_235C9BD4C(v33, v34);
        swift_endAccess();
        swift_bridgeObjectRelease();
        swift_retain();
        v35 = sub_235CA36FC();
        v36 = sub_235CA3924();
        if (os_log_type_enabled(v35, v36))
        {
          v37 = swift_slowAlloc();
          v78 = swift_slowAlloc();
          aBlock = (id)v78;
          *(_DWORD *)v37 = 136315394;
          v38 = v31[2];
          v39 = v31[3];
          swift_bridgeObjectRetain();
          v87 = sub_235C944B8(v38, v39, (uint64_t *)&aBlock);
          sub_235CA3A14();
          swift_bridgeObjectRelease();
          *(_WORD *)(v37 + 12) = 2080;
          v40 = v3;
          v41 = v31[4];
          v42 = v31[5];
          swift_bridgeObjectRetain();
          v87 = sub_235C944B8(v41, v42, (uint64_t *)&aBlock);
          sub_235CA3A14();
          swift_release();
          v3 = v40;
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_235C5E000, v35, v36, "#AsrOnServer Invoking RC acceptance for rcID: %s and asrRCId: %s", (uint8_t *)v37, 0x16u);
          v43 = v78;
          swift_arrayDestroy();
          MEMORY[0x23B7DE144](v43, -1, -1);
          MEMORY[0x23B7DE144](v37, -1, -1);

        }
        else
        {

          swift_release();
        }
        v60 = v79;
        v61 = *(void **)&v3[OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_serviceHelper];
        if ((objc_msgSend(v61, sel_respondsToSelector_, sel_selectResultWithResultCandidate_completion_) & 1) != 0)
        {
          v62 = *(void **)((char *)v31 + OBJC_IVAR____TtC9ASRBridge28ASRMUXResultCandidateContext_resultCandidate);
          v63 = swift_allocObject();
          swift_weakInit();
          v64 = (_QWORD *)swift_allocObject();
          v64[2] = v63;
          v64[3] = v31;
          v65 = v80;
          v64[4] = v80;
          v64[5] = v60;
          v85 = sub_235C7F170;
          v86 = v64;
          aBlock = (id)MEMORY[0x24BDAC760];
          v82 = 1107296256;
          v83 = sub_235C8101C;
          v84 = &block_descriptor_10;
          v66 = _Block_copy(&aBlock);
          v67 = v60;
          swift_retain();
          v68 = v65;
          swift_unknownObjectRetain();
          v69 = v62;
          swift_retain();
          swift_retain();
          swift_release();
          objc_msgSend(v61, sel_selectResultWithResultCandidate_completion_, v69, v66);
          _Block_release(v66);

          swift_release();
          swift_release();
          swift_unknownObjectRelease();
        }
        if (v3[OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_serverEndPointReceived] != 1
          || (v3[OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_serverEndPointSentToSpeech] & 1) != 0)
        {
          goto LABEL_32;
        }
        v70 = *(void **)&v3[OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_serverEndpointIdentifiedMessage];
        if (v70)
        {
          v71 = v70;
          sub_235C7DD7C(v71, 0, 0);

LABEL_32:
          swift_release();

          return;
        }
        v72 = sub_235CA36FC();
        v73 = sub_235CA3930();
        if (os_log_type_enabled(v72, v73))
        {
          v74 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v74 = 0;
          _os_log_impl(&dword_235C5E000, v72, v73, "Cannot find cached SASSpeechServerEndpointIdentified message. Request will fail.", v74, 2u);
          MEMORY[0x23B7DE144](v74, -1, -1);
          swift_release();

          return;
        }

      }
      else
      {
        v57 = sub_235CA36FC();
        v58 = sub_235CA3930();
        if (os_log_type_enabled(v57, v58))
        {
          v59 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v59 = 0;
          _os_log_impl(&dword_235C5E000, v57, v58, "#AsrOnServer no voiceIdScoreCard exists.  This could be caused by a missing or invalid HomeMemberInfo", v59, 2u);
          MEMORY[0x23B7DE144](v59, -1, -1);
          swift_release();

          return;
        }

      }
LABEL_34:
      swift_release();
      return;
    }
    swift_bridgeObjectRelease_n();
  }
  swift_bridgeObjectRelease();
  v50 = v12;
  v51 = sub_235CA36FC();
  v52 = sub_235CA3930();
  if (os_log_type_enabled(v51, v52))
  {
    v53 = (uint8_t *)swift_slowAlloc();
    v54 = swift_slowAlloc();
    aBlock = (id)v54;
    *(_DWORD *)v53 = 136315138;
    v55 = sub_235CA2F88();
    v87 = sub_235C944B8(v55, v56, (uint64_t *)&aBlock);
    sub_235CA3A14();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_235C5E000, v51, v52, "#AsrOnServer ASRMUXResultCandidateContext not found for rcID=%s", v53, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B7DE144](v54, -1, -1);
    MEMORY[0x23B7DE144](v53, -1, -1);

  }
  else
  {

  }
}

void sub_235C7C660(void *a1, uint64_t a2, uint64_t a3, NSObject *a4, NSObject *a5, uint64_t a6)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t Strong;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  id v18;
  void *v19;
  uint64_t v20;
  objc_class *v21;
  objc_class *v22;
  uint64_t *v23;
  char v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  int v31;
  uint64_t v32;
  id v33;
  void *v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t v39;
  os_log_t v40;
  uint64_t v41;
  NSObject *v42;
  os_log_type_t v43;
  uint8_t *v44;
  NSObject *v45;
  os_log_type_t v46;
  uint8_t *v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  void *v52;
  id v53;
  uint64_t v54;
  id v55;
  id v56;
  NSObject *v57;
  os_log_type_t v58;
  uint64_t v59;
  id v60;
  _QWORD *v61;
  os_log_t v62;
  uint64_t v63;
  uint64_t v64;
  os_log_type_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  os_log_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  os_log_t v75;
  _QWORD *v76;
  uint64_t v77;
  uint64_t v78;
  os_log_t v79;
  uint64_t v80;
  uint64_t v81;

  v10 = sub_235CA3708();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v75 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  if (!Strong)
  {
    if (qword_2542992E8 != -1)
      swift_once();
    __swift_project_value_buffer(v10, (uint64_t)qword_254299660);
    v45 = sub_235CA36FC();
    v46 = sub_235CA3930();
    if (os_log_type_enabled(v45, v46))
    {
      v47 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v47 = 0;
      _os_log_impl(&dword_235C5E000, v45, v46, "#AsrOnServer self expired. Ignoring RC acceptance result.", v47, 2u);
      MEMORY[0x23B7DE144](v47, -1, -1);
    }

    return;
  }
  v15 = Strong;
  if (!a1 || (objc_opt_self(), (v16 = swift_dynamicCastObjCClass()) == 0))
  {
    if (qword_2542992E8 != -1)
      swift_once();
    __swift_project_value_buffer(v10, (uint64_t)qword_254299660);
    v42 = sub_235CA36FC();
    v43 = sub_235CA3924();
    if (!os_log_type_enabled(v42, v43))
    {

      swift_release();
      return;
    }
    v44 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v44 = 0;
    _os_log_impl(&dword_235C5E000, v42, v43, "#AsrOnServer Did not receive SAResultSelected for RC acceptance. RC not accepted.", v44, 2u);
    MEMORY[0x23B7DE144](v44, -1, -1);
    goto LABEL_19;
  }
  v17 = v16;
  v78 = a6;
  v79 = a1;
  v18 = -[NSObject refId](v17, sel_refId);
  if (v18)
  {
    v19 = v18;
    v20 = sub_235CA37EC();
    v22 = v21;

    v23 = (uint64_t *)((char *)v15 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_requestId);
    if ((Class)v20 == *(Class *)((char *)&v15->isa + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_requestId)
      && v22 == *(objc_class **)((char *)&v15[1].isa + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_requestId))
    {
      v26 = swift_bridgeObjectRelease();
    }
    else
    {
      v25 = sub_235CA3B88();
      v26 = swift_bridgeObjectRelease();
      if ((v25 & 1) == 0)
        goto LABEL_10;
    }
    if (*((_BYTE *)&v15->isa + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_isIdentityScoreConsumptionEnabled) == 1)
    {
      MEMORY[0x24BDAC7A8](v26);
      *(&v75 - 4) = v15;
      *(&v75 - 3) = a4;
      *(&v75 - 2) = v17;
      v48 = objc_allocWithZone((Class)sub_235CA315C());
      v49 = sub_235CA2958();
      v50 = 0xD000000000000023;
      v51 = 0x8000000235CA56C0;
      if (v49)
      {
        v52 = (void *)v49;
LABEL_33:
        v54 = qword_2542992E8;
        v55 = v52;
        if (v54 != -1)
          swift_once();
        __swift_project_value_buffer(v10, (uint64_t)qword_254299660);
        v56 = v55;
        swift_bridgeObjectRetain();
        v57 = sub_235CA36FC();
        v58 = sub_235CA3924();
        if (os_log_type_enabled(v57, v58))
        {
          v59 = swift_slowAlloc();
          v76 = (_QWORD *)swift_slowAlloc();
          v77 = swift_slowAlloc();
          v81 = v77;
          *(_DWORD *)v59 = 136315394;
          v75 = v57;
          swift_bridgeObjectRetain();
          v80 = sub_235C944B8(v50, v51, &v81);
          sub_235CA3A14();
          swift_bridgeObjectRelease_n();
          *(_WORD *)(v59 + 12) = 2112;
          v80 = (uint64_t)v56;
          v60 = v56;
          sub_235CA3A14();
          v61 = v76;
          *v76 = v52;

          v62 = v75;
          _os_log_impl(&dword_235C5E000, v75, v58, "#AsrOnServer Posting result acceptance event %s %@.", (uint8_t *)v59, 0x16u);
          __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254299410);
          swift_arrayDestroy();
          MEMORY[0x23B7DE144](v61, -1, -1);
          v63 = v77;
          swift_arrayDestroy();
          MEMORY[0x23B7DE144](v63, -1, -1);
          MEMORY[0x23B7DE144](v59, -1, -1);

        }
        else
        {

          swift_bridgeObjectRelease_n();
        }
        v70 = v79;
        swift_retain();
        sub_235C775EC(v56);
        swift_release();
        v71 = *v23;
        v72 = v23[1];
        v73 = sub_235CA2F88();
        sub_235C71F1C(v71, v72, v73, v74);
        swift_release();
        swift_bridgeObjectRelease();

        return;
      }
    }
    else
    {
      v50 = 0xD000000000000018;
      MEMORY[0x24BDAC7A8](v26);
      *(&v75 - 4) = v15;
      *(&v75 - 3) = a4;
      *(&v75 - 2) = v17;
      *(&v75 - 1) = a5;
      v53 = objc_allocWithZone((Class)sub_235CA2B74());
      v52 = (void *)sub_235CA2B14();
      v51 = 0x8000000235CA56A0;
      if (v52)
        goto LABEL_33;
    }
    v64 = v50;
    if (qword_2542992E8 != -1)
      swift_once();
    __swift_project_value_buffer(v10, (uint64_t)qword_254299660);
    swift_retain_n();
    swift_bridgeObjectRetain();
    v42 = sub_235CA36FC();
    v65 = sub_235CA3930();
    if (!os_log_type_enabled(v42, v65))
    {

      swift_release_n();
      swift_bridgeObjectRelease_n();

      return;
    }
    v66 = swift_slowAlloc();
    v67 = swift_slowAlloc();
    v81 = v67;
    *(_DWORD *)v66 = 136315394;
    swift_bridgeObjectRetain();
    v80 = sub_235C944B8(v64, v51, &v81);
    sub_235CA3A14();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v66 + 12) = 2080;
    v68 = *v23;
    v69 = v23[1];
    swift_bridgeObjectRetain();
    v80 = sub_235C944B8(v68, v69, &v81);
    sub_235CA3A14();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_235C5E000, v42, v65, "Failed to create %s for request: %s", (uint8_t *)v66, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x23B7DE144](v67, -1, -1);
    MEMORY[0x23B7DE144](v66, -1, -1);

LABEL_19:
    swift_release();

    return;
  }
LABEL_10:
  if (qword_2542992E8 != -1)
    swift_once();
  v27 = __swift_project_value_buffer(v10, (uint64_t)qword_254299660);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, v27, v10);
  v28 = v79;
  swift_retain_n();
  v29 = v28;
  v30 = sub_235CA36FC();
  v31 = sub_235CA3930();
  if (!os_log_type_enabled(v30, (os_log_type_t)v31))
  {

    swift_release_n();
    goto LABEL_31;
  }
  LODWORD(v78) = v31;
  v79 = v30;
  v32 = swift_slowAlloc();
  v77 = swift_slowAlloc();
  v81 = v77;
  *(_DWORD *)v32 = 136315394;
  v33 = -[NSObject refId](v17, sel_refId);
  if (v33)
  {
    v34 = v33;
    v35 = sub_235CA37EC();
    v37 = v36;

    v80 = sub_235C944B8(v35, v37, &v81);
    sub_235CA3A14();

    swift_bridgeObjectRelease();
    *(_WORD *)(v32 + 12) = 2080;
    v38 = *(uint64_t *)((char *)&v15->isa + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_requestId);
    v39 = *(unint64_t *)((char *)&v15[1].isa + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_requestId);
    swift_bridgeObjectRetain();
    v80 = sub_235C944B8(v38, v39, &v81);
    sub_235CA3A14();
    swift_release_n();
    swift_bridgeObjectRelease();
    v40 = v79;
    _os_log_impl(&dword_235C5E000, v79, (os_log_type_t)v78, "#AsrOnServer The refId of ResultSelected %s doesn't match the current requestId: %s. Ignoring RC acceptance result.", (uint8_t *)v32, 0x16u);
    v41 = v77;
    swift_arrayDestroy();
    MEMORY[0x23B7DE144](v41, -1, -1);
    MEMORY[0x23B7DE144](v32, -1, -1);

    swift_release();
LABEL_31:
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    return;
  }

  swift_release();
  __break(1u);
}

uint64_t sub_235C7D0C0(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
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
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v23;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254299050);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_254299070);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *MEMORY[0x24BE9AD78];
  v13 = sub_235CA33CC();
  v14 = *(_QWORD *)(v13 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 104))(v11, v12, v13);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
  sub_235CA2994();
  swift_bridgeObjectRetain();
  sub_235CA2970();
  v15 = a2 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_sessionId;
  v16 = sub_235CA2790();
  v17 = *(_QWORD *)(v16 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v8, v15, v16);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v17 + 56))(v8, 0, 1, v16);
  sub_235CA29AC();
  swift_bridgeObjectRetain();
  sub_235CA29A0();
  swift_bridgeObjectRetain();
  sub_235CA2988();
  v18 = objc_msgSend(a4, sel_isMitigated);
  sub_235C71624(0, (unint64_t *)&unk_254299400);
  v19 = (void *)sub_235CA39D8();
  v20 = v19;
  if (v18)
  {
    v21 = v18;
    sub_235CA39E4();

  }
  else
  {

  }
  return sub_235CA297C();
}

uint64_t sub_235C7D314(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v26;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_254299050);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_254299070);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = *MEMORY[0x24BE9AD78];
  v15 = sub_235CA33CC();
  v16 = *(_QWORD *)(v15 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 104))(v13, v14, v15);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
  sub_235CA2B50();
  swift_bridgeObjectRetain();
  sub_235CA2B20();
  v17 = a2 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_sessionId;
  v18 = sub_235CA2790();
  v19 = *(_QWORD *)(v18 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v10, v17, v18);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v19 + 56))(v10, 0, 1, v18);
  sub_235CA2B68();
  swift_bridgeObjectRetain();
  sub_235CA2B5C();
  swift_bridgeObjectRetain();
  sub_235CA2B44();
  v20 = objc_msgSend(a4, sel_isMitigated);
  sub_235C71624(0, (unint64_t *)&unk_254299400);
  v21 = (void *)sub_235CA39D8();
  v22 = v21;
  if (v20)
  {
    v23 = v20;
    sub_235CA39E4();

  }
  else
  {

  }
  sub_235CA2B2C();
  v24 = a5;
  return sub_235CA2B38();
}

void sub_235C7D578(char a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t Strong;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  os_log_type_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  os_log_type_t v23;
  uint8_t *v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  uint64_t v29;
  NSObject *v30;
  os_log_type_t v31;
  uint8_t *v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  _QWORD *v36;
  uint64_t v37;
  NSObject *v38;
  uint64_t v39;

  if ((a1 & 1) != 0)
  {
    swift_beginAccess();
    Strong = swift_weakLoadStrong();
    if (Strong)
    {
      v7 = Strong;
      MEMORY[0x24BDAC7A8](Strong);
      v8 = objc_allocWithZone((Class)sub_235CA2964());
      v9 = sub_235CA2958();
      if (v9)
      {
        v10 = (void *)v9;
        swift_retain();
        sub_235C775EC(v10);
        swift_release();
        v11 = (uint64_t *)(v7 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_requestId);
        v12 = *(_QWORD *)(v7 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_requestId);
        v13 = *(_QWORD *)(v7 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_requestId + 8);
        swift_retain();
        swift_bridgeObjectRetain();
        sub_235C71EEC(v12, v13, a3, a4);
        swift_release();
        swift_bridgeObjectRelease();
        if (qword_2542992E8 != -1)
          swift_once();
        v14 = sub_235CA3708();
        __swift_project_value_buffer(v14, (uint64_t)qword_254299660);
        swift_retain_n();
        v15 = v10;
        v16 = sub_235CA36FC();
        v17 = sub_235CA3924();
        if (os_log_type_enabled(v16, v17))
        {
          v18 = swift_slowAlloc();
          v36 = (_QWORD *)swift_slowAlloc();
          v37 = swift_slowAlloc();
          v39 = v37;
          *(_DWORD *)v18 = 136315394;
          v20 = *v11;
          v19 = v11[1];
          swift_bridgeObjectRetain();
          sub_235C944B8(v20, v19, &v39);
          sub_235CA3A14();
          swift_release_n();
          swift_bridgeObjectRelease();
          *(_WORD *)(v18 + 12) = 2112;
          v21 = v15;
          sub_235CA3A14();
          *v36 = v10;

          _os_log_impl(&dword_235C5E000, v16, v17, "#AsrOnServer Invoked posting of ResultSelectedMessage for request: %s resultSelectedMsg: %@", (uint8_t *)v18, 0x16u);
          __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254299410);
          swift_arrayDestroy();
          MEMORY[0x23B7DE144](v36, -1, -1);
          swift_arrayDestroy();
          MEMORY[0x23B7DE144](v37, -1, -1);
          MEMORY[0x23B7DE144](v18, -1, -1);
          swift_release();

          return;
        }

      }
      else
      {
        if (qword_2542992E8 != -1)
          swift_once();
        v29 = sub_235CA3708();
        __swift_project_value_buffer(v29, (uint64_t)qword_254299660);
        swift_retain();
        v30 = sub_235CA36FC();
        v31 = sub_235CA3930();
        if (os_log_type_enabled(v30, v31))
        {
          v32 = (uint8_t *)swift_slowAlloc();
          v33 = swift_slowAlloc();
          v39 = v33;
          *(_DWORD *)v32 = 136315138;
          v34 = *(_QWORD *)(v7 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_requestId);
          v35 = *(_QWORD *)(v7 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_requestId + 8);
          swift_bridgeObjectRetain();
          sub_235C944B8(v34, v35, &v39);
          sub_235CA3A14();
          swift_release();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_235C5E000, v30, v31, "#AsrOnServer Failed to create ResultSelectedMessage for request: %s", v32, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x23B7DE144](v33, -1, -1);
          MEMORY[0x23B7DE144](v32, -1, -1);
          swift_release();

          return;
        }

      }
      swift_release_n();
    }
    else
    {
      if (qword_2542992E8 != -1)
        swift_once();
      v25 = sub_235CA3708();
      __swift_project_value_buffer(v25, (uint64_t)qword_254299660);
      v26 = sub_235CA36FC();
      v27 = sub_235CA3924();
      if (os_log_type_enabled(v26, v27))
      {
        v28 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v28 = 0;
        _os_log_impl(&dword_235C5E000, v26, v27, "#AsrOnServer Not posting ResultSelectedMessage because self is out of scope after waiting for Myriad decision", v28, 2u);
        MEMORY[0x23B7DE144](v28, -1, -1);
      }

    }
  }
  else
  {
    if (qword_2542992E8 != -1)
      swift_once();
    v22 = sub_235CA3708();
    __swift_project_value_buffer(v22, (uint64_t)qword_254299660);
    v38 = sub_235CA36FC();
    v23 = sub_235CA3924();
    if (os_log_type_enabled(v38, v23))
    {
      v24 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v24 = 0;
      _os_log_impl(&dword_235C5E000, v38, v23, "#AsrOnServer Not posting ResultSelectedMessage due to Myriad loss", v24, 2u);
      MEMORY[0x23B7DE144](v24, -1, -1);
    }

  }
}

uint64_t sub_235C7DBB8(uint64_t a1, uint64_t a2)
{
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_254299050);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254299070);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *MEMORY[0x24BE9AD78];
  v10 = sub_235CA33CC();
  v11 = *(_QWORD *)(v10 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 104))(v8, v9, v10);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  sub_235CA2994();
  swift_bridgeObjectRetain();
  sub_235CA2970();
  v12 = a2 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_sessionId;
  v13 = sub_235CA2790();
  v14 = *(_QWORD *)(v13 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v5, v12, v13);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v5, 0, 1, v13);
  sub_235CA29AC();
  swift_bridgeObjectRetain();
  sub_235CA29A0();
  swift_bridgeObjectRetain();
  sub_235CA2988();
  return sub_235CA297C();
}

void sub_235C7DD7C(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  _QWORD *v24;
  void *v25;
  id v26;
  uint64_t v27;
  id v28;
  uint64_t aBlock[6];

  v4 = v3;
  *(_BYTE *)(v3 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_serverEndPointReceived) = 1;
  if (sub_235C7EBD4()
    && (v8 = OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_serverEndPointSentToSpeech,
        (*(_BYTE *)(v3 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_serverEndPointSentToSpeech) & 1) == 0))
  {
    if (qword_2542992E8 != -1)
      swift_once();
    v14 = sub_235CA3708();
    __swift_project_value_buffer(v14, (uint64_t)qword_254299660);
    swift_retain();
    v15 = sub_235CA36FC();
    v16 = sub_235CA3924();
    if (os_log_type_enabled(v15, v16))
    {
      v27 = a2;
      v17 = (uint8_t *)swift_slowAlloc();
      v18 = swift_slowAlloc();
      aBlock[0] = v18;
      *(_DWORD *)v17 = 136315138;
      v19 = *(_QWORD *)(v4 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_requestId);
      v20 = *(_QWORD *)(v4 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_requestId + 8);
      swift_bridgeObjectRetain();
      v21 = v19;
      a2 = v27;
      sub_235C944B8(v21, v20, aBlock);
      sub_235CA3A14();
      swift_release();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_235C5E000, v15, v16, "#AsrOnServer Posting SASSpeechServerEndpointIdentified for requestId: %s)", v17, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B7DE144](v18, -1, -1);
      MEMORY[0x23B7DE144](v17, -1, -1);

    }
    else
    {

      swift_release();
    }
    v22 = *(void **)(v4 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_serviceHelper);
    if ((objc_msgSend(v22, sel_respondsToSelector_, sel_handleSpeechServerEndpointIdentified_completion_, v27) & 1) != 0)
    {
      v23 = swift_allocObject();
      swift_weakInit();
      v24 = (_QWORD *)swift_allocObject();
      v24[2] = v23;
      v24[3] = a2;
      v24[4] = a3;
      v24[5] = a1;
      aBlock[4] = (uint64_t)sub_235C7F0E8;
      aBlock[5] = (uint64_t)v24;
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 1107296256;
      aBlock[2] = (uint64_t)sub_235C8101C;
      aBlock[3] = (uint64_t)&block_descriptor_2;
      v25 = _Block_copy(aBlock);
      swift_unknownObjectRetain();
      swift_retain();
      sub_235C7F124(a2);
      v26 = a1;
      swift_retain();
      swift_release();
      objc_msgSend(v22, sel_handleSpeechServerEndpointIdentified_completion_, v26, v25);
      _Block_release(v25);
      swift_release();
      swift_release();
      swift_unknownObjectRelease();
    }
    *(_BYTE *)(v4 + v8) = 1;
  }
  else
  {
    if (qword_2542992E8 != -1)
      swift_once();
    v9 = sub_235CA3708();
    __swift_project_value_buffer(v9, (uint64_t)qword_254299660);
    v10 = sub_235CA36FC();
    v11 = sub_235CA3924();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_235C5E000, v10, v11, "Pre NL user selection has not run for all RCs. Caching SASSpeechServerEndpointIdentified.", v12, 2u);
      MEMORY[0x23B7DE144](v12, -1, -1);
    }

    v28 = *(id *)(v4 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_serverEndpointIdentifiedMessage);
    *(_QWORD *)(v4 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_serverEndpointIdentifiedMessage) = a1;
    v13 = a1;

  }
}

void sub_235C7E188(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t), uint64_t a5, void *a6)
{
  sub_235C7E194(a1, a2, a3, a4, a5, a6, "#AsrOnServer self expired. Ignoring SASSpeechRecognized response refId:%s");
}

void sub_235C7E194(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t), uint64_t a5, void *a6, const char *a7)
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t Strong;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  NSObject *v22;
  int v23;
  uint8_t *v24;
  id v25;
  void *v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint8_t *v31;
  uint64_t v32;
  int v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  v13 = sub_235CA3708();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v31 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  swift_release();
  if (Strong)
  {
    if (!a4)
      return;
    v18 = a1;
    v19 = a2;
    goto LABEL_12;
  }
  if (qword_2542992E8 != -1)
    swift_once();
  v20 = __swift_project_value_buffer(v13, (uint64_t)qword_254299660);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v16, v20, v13);
  v21 = a6;
  v22 = sub_235CA36FC();
  v23 = sub_235CA3930();
  if (!os_log_type_enabled(v22, (os_log_type_t)v23))
  {

    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
    if (!a4)
      return;
    goto LABEL_11;
  }
  v33 = v23;
  v34 = a7;
  v35 = a5;
  v24 = (uint8_t *)swift_slowAlloc();
  v32 = swift_slowAlloc();
  v37 = v32;
  *(_DWORD *)v24 = 136315138;
  v25 = objc_msgSend(v21, sel_refId);
  if (!v25)
  {

    __break(1u);
    return;
  }
  v26 = v25;
  v31 = v24 + 4;
  v27 = sub_235CA37EC();
  v29 = v28;

  v36 = sub_235C944B8(v27, v29, &v37);
  sub_235CA3A14();

  swift_bridgeObjectRelease();
  _os_log_impl(&dword_235C5E000, v22, (os_log_type_t)v33, v34, v24, 0xCu);
  v30 = v32;
  swift_arrayDestroy();
  MEMORY[0x23B7DE144](v30, -1, -1);
  MEMORY[0x23B7DE144](v24, -1, -1);

  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  if (a4)
  {
LABEL_11:
    v18 = 0;
    v19 = 0;
LABEL_12:
    a4(v18, v19);
  }
}

uint64_t sub_235C7E440()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = v0 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_requestType;
  v2 = sub_235CA3420();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();
  v3 = v0 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_sessionId;
  v4 = sub_235CA2790();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();

  v5 = v0 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_userId;
  v6 = sub_235CA3498();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1(v0 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_myriadMonitor);
  swift_release();
  swift_release();
  swift_release();
  return v0;
}

uint64_t sub_235C7E55C()
{
  sub_235C7E440();
  return swift_deallocClassInstance();
}

uint64_t sub_235C7E580()
{
  return type metadata accessor for ServerAsrProcessor(0);
}

uint64_t type metadata accessor for ServerAsrProcessor(uint64_t a1)
{
  return sub_235C7EFA0(a1, qword_256377460);
}

uint64_t sub_235C7E59C()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;

  result = sub_235CA3420();
  if (v1 <= 0x3F)
  {
    result = sub_235CA2790();
    if (v2 <= 0x3F)
    {
      result = sub_235CA3498();
      if (v3 <= 0x3F)
        return swift_updateClassMetadata2();
    }
  }
  return result;
}

uint64_t sub_235C7E684(uint64_t a1, uint8_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, uint64_t a8, int a9)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  _QWORD *v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  char v33;
  NSObject *v34;
  os_log_type_t v35;
  uint8_t *v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v43;
  uint8_t *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49[3];
  uint64_t v50[3];

  v44 = a2;
  LODWORD(v45) = a9;
  v14 = sub_235CA3498();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v43 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v17, a1, v14);
  type metadata accessor for ASRMUXResultCandidateContext(0);
  v18 = (_QWORD *)swift_allocObject();
  *(_QWORD *)((char *)v18 + OBJC_IVAR____TtC9ASRBridge28ASRMUXResultCandidateContext_resultCandidate) = a6;
  v19 = a6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v20 = (void *)sub_235CA37E0();
  swift_bridgeObjectRelease();
  objc_msgSend(v19, sel_setRefId_, v20);

  v21 = a4;
  v18[2] = a4;
  v18[3] = a5;
  v47 = a5;
  v18[4] = v44;
  v18[5] = a3;
  (*(void (**)(uint64_t, char *, uint64_t))(v15 + 32))((uint64_t)v18 + OBJC_IVAR____TtC9ASRBridge28ASRMUXResultCandidateContext_userId, v17, v14);
  *(_DWORD *)((char *)v18 + OBJC_IVAR____TtC9ASRBridge28ASRMUXResultCandidateContext_processedAudioDuration) = v45;
  if (qword_2542992E8 != -1)
    swift_once();
  v22 = sub_235CA3708();
  __swift_project_value_buffer(v22, (uint64_t)qword_254299660);
  swift_retain_n();
  v23 = sub_235CA36FC();
  v24 = sub_235CA3924();
  if (os_log_type_enabled(v23, v24))
  {
    v25 = (uint8_t *)swift_slowAlloc();
    v26 = swift_slowAlloc();
    v50[0] = v26;
    v45 = a4;
    *(_DWORD *)v25 = 136315138;
    swift_retain();
    v27 = sub_235C7ED64();
    v29 = v28;
    swift_release();
    v49[0] = sub_235C944B8(v27, v29, v50);
    v21 = v45;
    sub_235CA3A14();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_235C5E000, v23, v24, "#AsrOnServer Caching ASRMUXResultCandidateContext: %s in the ASRBridge.", v25, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B7DE144](v26, -1, -1);
    MEMORY[0x23B7DE144](v25, -1, -1);

  }
  else
  {

    swift_release_n();
  }
  v31 = v46;
  v30 = v47;
  v32 = (uint64_t *)(v46 + 24);
  swift_beginAccess();
  if (*(_QWORD *)(*(_QWORD *)(v31 + 24) + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_235C9BACC(v21, v30);
    if ((v33 & 1) != 0)
    {
      swift_retain_n();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v34 = sub_235CA36FC();
      v35 = sub_235CA3930();
      if (os_log_type_enabled(v34, v35))
      {
        v36 = (uint8_t *)swift_slowAlloc();
        v46 = swift_slowAlloc();
        v49[0] = v46;
        v45 = v21;
        *(_DWORD *)v36 = 136315138;
        v30 = v47;
        v44 = v36 + 4;
        swift_retain();
        v37 = sub_235C7ED64();
        v39 = v38;
        swift_release();
        v48 = sub_235C944B8(v37, v39, v49);
        v21 = v45;
        sub_235CA3A14();
        swift_release_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_235C5E000, v34, v35, "#AsrOnServer ASRMUXRequestContext already contains a cache entry: %s. This will be overwritten and may lead to inconsistent results.", v36, 0xCu);
        v40 = v46;
        swift_arrayDestroy();
        MEMORY[0x23B7DE144](v40, -1, -1);
        MEMORY[0x23B7DE144](v36, -1, -1);
        swift_release();

      }
      else
      {

        swift_release_n();
      }
    }
    else
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
  }
  swift_beginAccess();
  swift_bridgeObjectRetain();
  swift_retain();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v48 = *v32;
  *v32 = 0x8000000000000000;
  sub_235C9DA28((uint64_t)v18, v21, v30, isUniquelyReferenced_nonNull_native);
  *v32 = v48;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_endAccess();
  return swift_release();
}

BOOL sub_235C7EBD4()
{
  uint64_t v0;
  char v1;
  _BOOL8 result;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;

  if (*(_BYTE *)(v0 + 40) == 1)
  {
    swift_retain();
    v1 = sub_235C77358();
    swift_release();
    if ((v1 & 1) != 0)
    {
      result = 0;
      *(_BYTE *)(v0 + 40) = 0;
    }
    else
    {
      if (qword_2542992E8 != -1)
        swift_once();
      v3 = sub_235CA3708();
      __swift_project_value_buffer(v3, (uint64_t)qword_254299660);
      v4 = sub_235CA36FC();
      v5 = sub_235CA3930();
      if (os_log_type_enabled(v4, v5))
      {
        v6 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v6 = 0;
        _os_log_impl(&dword_235C5E000, v4, v5, "Could not post buffer RC message. The request will timeout", v6, 2u);
        MEMORY[0x23B7DE144](v6, -1, -1);
      }

      return 0;
    }
  }
  else
  {
    swift_beginAccess();
    return *(_QWORD *)(*(_QWORD *)(v0 + 32) + 16) == 0;
  }
  return result;
}

uint64_t sub_235C7ED10()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ASRMUXRequestContext()
{
  return objc_opt_self();
}

uint64_t sub_235C7ED64()
{
  uint64_t v0;
  uint64_t v2;

  sub_235CA3A80();
  sub_235CA3828();
  swift_bridgeObjectRetain();
  sub_235CA3828();
  swift_bridgeObjectRelease();
  sub_235CA3828();
  swift_bridgeObjectRetain();
  sub_235CA3828();
  swift_bridgeObjectRelease();
  sub_235CA3828();
  sub_235CA3498();
  sub_235C69C18(&qword_2542990B0, (uint64_t (*)(uint64_t))MEMORY[0x24BE9B488], MEMORY[0x24BE9B4B8]);
  sub_235CA3B64();
  sub_235CA3828();
  swift_bridgeObjectRelease();
  sub_235CA3828();
  v2 = *(unsigned int *)(v0 + OBJC_IVAR____TtC9ASRBridge28ASRMUXResultCandidateContext_processedAudioDuration);
  sub_235CA3B64();
  sub_235CA3828();
  swift_bridgeObjectRelease();
  return HIDWORD(v2);
}

uint64_t sub_235C7EF14()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v1 = v0 + OBJC_IVAR____TtC9ASRBridge28ASRMUXResultCandidateContext_userId;
  v2 = sub_235CA3498();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);

  return swift_deallocClassInstance();
}

uint64_t sub_235C7EF84()
{
  return type metadata accessor for ASRMUXResultCandidateContext(0);
}

uint64_t type metadata accessor for ASRMUXResultCandidateContext(uint64_t a1)
{
  return sub_235C7EFA0(a1, qword_256377600);
}

uint64_t sub_235C7EFA0(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_235C7EFD4()
{
  uint64_t result;
  unint64_t v1;

  result = sub_235CA3498();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_235C7F068()
{
  return sub_235C7ED64();
}

uint64_t sub_235C7F088()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_235C7F0AC()
{
  uint64_t v0;

  swift_release();
  if (*(_QWORD *)(v0 + 24))
    swift_release();

  return swift_deallocObject();
}

void sub_235C7F0E8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_235C7E194(a1, a2, *(_QWORD *)(v2 + 16), *(void (**)(uint64_t, uint64_t))(v2 + 24), *(_QWORD *)(v2 + 32), *(void **)(v2 + 40), "#AsrOnServer self expired. Ignoring SASSpeechServerEndpointIdentified response refId:%s");
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

uint64_t sub_235C7F124(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

uint64_t sub_235C7F134()
{
  uint64_t v0;

  swift_release();
  swift_release();

  return swift_deallocObject();
}

void sub_235C7F170(void *a1, uint64_t a2)
{
  uint64_t v2;

  sub_235C7C660(a1, a2, *(_QWORD *)(v2 + 16), *(NSObject **)(v2 + 24), *(NSObject **)(v2 + 32), *(_QWORD *)(v2 + 40));
}

uint64_t sub_235C7F17C(uint64_t a1)
{
  uint64_t v1;

  return sub_235C7D314(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(void **)(v1 + 32), *(void **)(v1 + 40));
}

uint64_t sub_235C7F188(uint64_t a1)
{
  uint64_t v1;

  return sub_235C7D0C0(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(void **)(v1 + 32));
}

uint64_t sub_235C7F194(uint64_t a1)
{
  uint64_t v1;

  return sub_235C7BA2C(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40), *(void **)(v1 + 48));
}

uint64_t sub_235C7F1A4(uint64_t a1)
{
  uint64_t v1;

  return sub_235C7B864(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_235C7F1B0(uint64_t a1)
{
  uint64_t v1;

  return sub_235C79A70(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(void **)(v1 + 40));
}

uint64_t sub_235C7F1BC()
{
  uint64_t v0;

  swift_release();
  if (*(_QWORD *)(v0 + 24))
    swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_235C7F1F8(void *a1, uint64_t a2)
{
  uint64_t v2;

  sub_235C79CC4(a1, a2, *(_QWORD *)(v2 + 16), *(void (**)(_QWORD, _QWORD))(v2 + 24), *(_QWORD *)(v2 + 32), *(NSObject **)(v2 + 40), *(void **)(v2 + 48));
}

void sub_235C7F20C(char a1)
{
  uint64_t *v1;

  sub_235C7D578(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_235C7F21C()
{
  uint64_t v0;

  swift_release();
  if (*(_QWORD *)(v0 + 24))
    swift_release();
  return swift_deallocObject();
}

void sub_235C7F250(void *a1, uint64_t a2)
{
  uint64_t v2;

  sub_235C792F8(a1, a2, *(_QWORD *)(v2 + 16), *(void (**)(_QWORD, _QWORD))(v2 + 24), *(_QWORD *)(v2 + 32));
}

uint64_t sub_235C7F25C(uint64_t a1)
{
  uint64_t v1;

  return sub_235C7DBB8(a1, *(_QWORD *)(v1 + 16));
}

uint64_t objectdestroy_20Tm()
{
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_235C7F2B8(void *a1)
{
  sub_235C7F2D0(a1, MEMORY[0x24BE9A740]);
}

void sub_235C7F2C4(void *a1)
{
  sub_235C7F2D0(a1, MEMORY[0x24BE9A9A8]);
}

void sub_235C7F2D0(void *a1, uint64_t (*a2)(void))
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t (*v11)(void);
  _QWORD *v12;
  id v13;
  _QWORD *v14;
  id v15;
  uint64_t v16;

  v4 = v2;
  if (qword_2542992E8 != -1)
    swift_once();
  v6 = sub_235CA3708();
  __swift_project_value_buffer(v6, (uint64_t)qword_254299660);
  v7 = a1;
  v8 = sub_235CA36FC();
  v9 = sub_235CA3924();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc();
    v16 = v4;
    v11 = a2;
    v12 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v10 = 138412290;
    v13 = v7;
    sub_235CA3A14();
    *v12 = v7;

    _os_log_impl(&dword_235C5E000, v8, v9, "AsrCandidateRequestProcessor received message: %@", v10, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254299410);
    swift_arrayDestroy();
    v14 = v12;
    a2 = v11;
    v4 = v16;
    MEMORY[0x23B7DE144](v14, -1, -1);
    MEMORY[0x23B7DE144](v10, -1, -1);

  }
  else
  {

  }
  v15 = v7;
  sub_235C80234(v15, v4, a2);

}

void sub_235C7F490(int a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  char v12;
  void (*v13)(char *, uint64_t);
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  NSObject *v30;
  os_log_type_t v31;
  _BOOL4 v32;
  uint8_t *v33;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(char *, uint64_t);
  uint64_t v37;
  NSObject *v38;
  os_log_type_t v39;
  uint8_t *v40;
  unint64_t v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  id v45;
  void *v46;
  id v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  id v57;
  char v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  double v62;
  void *v63;
  uint64_t v64;
  unint64_t v65;
  char v66;
  BOOL v68;
  uint64_t v69;
  char v70;
  char v71;
  uint64_t v72;
  uint64_t v73;
  __int16 v74;
  uint64_t v75;
  uint64_t v76;
  unint64_t v77;
  unint64_t v78;
  uint64_t v79;
  unint64_t v80;
  uint64_t v81;
  int v82;
  void (*v83)(char *, uint64_t);
  uint64_t v84;
  char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  unint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;

  v3 = sub_235CA2790();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v75 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(_QWORD *)(v1 + qword_254299150);
  v8 = sub_235CA35AC();
  v10 = v9;
  v84 = v1;
  sub_235CA35E8();
  v85 = v6;
  v86 = v8;
  v87 = v10;
  v88 = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256377970);
  sub_235CA3960();
  swift_bridgeObjectRelease();
  v11 = v90;
  v12 = v91;
  v13 = *(void (**)(char *, uint64_t))(v4 + 8);
  v13(v6, v3);
  if ((v12 & 1) != 0)
  {
    if (qword_2542992E8 != -1)
LABEL_48:
      swift_once();
    v14 = sub_235CA3708();
    __swift_project_value_buffer(v14, (uint64_t)qword_254299660);
    v15 = sub_235CA36FC();
    v16 = sub_235CA3930();
    if (!os_log_type_enabled(v15, v16))
      goto LABEL_6;
    v17 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v17 = 0;
    v18 = "nil hostTime from AsrCandidateRequestCache";
    goto LABEL_5;
  }
  v83 = v13;
  v80 = v11;
  v82 = a1;
  if ((a1 & 1) != 0)
  {
    v79 = sub_235CA37EC();
    v81 = v19;
    v77 = 0;
    v76 = 0;
    v78 = 5;
    v20 = v84;
  }
  else
  {
    v79 = sub_235CA37EC();
    v81 = v21;
    sub_235CA35AC();
    v22 = sub_235CA35E8();
    MEMORY[0x24BDAC7A8](v22);
    __swift_instantiateConcreteTypeFromMangledName(&qword_256377978);
    sub_235CA3960();
    swift_bridgeObjectRelease();
    v23 = v90;
    v24 = v91;
    v83(v6, v3);
    if ((v24 & 1) != 0)
    {
      swift_bridgeObjectRelease();
      if (qword_2542992E8 != -1)
        swift_once();
      v25 = sub_235CA3708();
      __swift_project_value_buffer(v25, (uint64_t)qword_254299660);
      v15 = sub_235CA36FC();
      v16 = sub_235CA3930();
      if (!os_log_type_enabled(v15, v16))
        goto LABEL_6;
      v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v17 = 0;
      v18 = "nil audioRecordType from AsrCandidateRequestCache";
LABEL_5:
      _os_log_impl(&dword_235C5E000, v15, v16, v18, v17, 2u);
      MEMORY[0x23B7DE144](v17, -1, -1);
LABEL_6:

      return;
    }
    v78 = v23;
    sub_235CA35AC();
    v26 = sub_235CA35E8();
    MEMORY[0x24BDAC7A8](v26);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2563772A8);
    sub_235CA3960();
    swift_bridgeObjectRelease();
    v28 = v90;
    v27 = v91;
    v83(v6, v3);
    v77 = v28;
    if (v27)
    {
      v76 = v27;
      v20 = v84;
    }
    else
    {
      if (qword_2542992E8 != -1)
        swift_once();
      v29 = sub_235CA3708();
      __swift_project_value_buffer(v29, (uint64_t)qword_254299660);
      v30 = sub_235CA36FC();
      v31 = sub_235CA3924();
      v32 = os_log_type_enabled(v30, v31);
      v20 = v84;
      if (v32)
      {
        v33 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v33 = 0;
        _os_log_impl(&dword_235C5E000, v30, v31, "nil audioRecordDeviceId from the AsrCandidateRequestCache", v33, 2u);
        MEMORY[0x23B7DE144](v33, -1, -1);
      }

      v76 = 0;
    }
  }
  sub_235CA35AC();
  v34 = sub_235CA35E8();
  v35 = v20;
  MEMORY[0x24BDAC7A8](v34);
  __swift_instantiateConcreteTypeFromMangledName(qword_256377980);
  sub_235CA3960();
  swift_bridgeObjectRelease();
  v36 = (void (*)(char *, uint64_t))v90;
  v83(v6, v3);
  v83 = v36;
  if (v36)
    goto LABEL_26;
  if (qword_2542992E8 != -1)
    goto LABEL_59;
  while (1)
  {
    v37 = sub_235CA3708();
    __swift_project_value_buffer(v37, (uint64_t)qword_254299660);
    v38 = sub_235CA36FC();
    v39 = sub_235CA3930();
    if (os_log_type_enabled(v38, v39))
    {
      v40 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v40 = 0;
      _os_log_impl(&dword_235C5E000, v38, v39, "nil location from the AsrCandidateRequestCache", v40, 2u);
      MEMORY[0x23B7DE144](v40, -1, -1);
    }

    v35 = v84;
LABEL_26:
    sub_235C85238((uint64_t *)&v90);
    v41 = *(_QWORD *)(v35 + qword_254299160);
    if (v41 >> 62)
      break;
    v42 = *(_QWORD *)((v41 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    v43 = v82;
    if (!v42)
      goto LABEL_50;
LABEL_28:
    v89 = MEMORY[0x24BEE4AF8];
    sub_235CA3AC8();
    if ((v42 & 0x8000000000000000) == 0)
    {
      v44 = 0;
      while (1)
      {
        if (v42 == v44)
        {
          __break(1u);
          goto LABEL_48;
        }
        if ((v41 & 0xC000000000000001) != 0)
          v45 = (id)MEMORY[0x23B7DDB44](v44, v41);
        else
          v45 = *(id *)(v41 + 8 * v44 + 32);
        v46 = v45;
        v47 = objc_msgSend(v45, sel_sharedUserId);
        if (v47)
        {
          v48 = v47;
          sub_235CA37EC();
          v50 = v49;

        }
        else
        {
          v50 = 0;
        }
        v51 = objc_msgSend(v46, sel_loggableSharedUserId);
        if (v51)
        {
          v52 = v51;
          sub_235CA37EC();
          v54 = v53;

          if (v50)
            goto LABEL_39;
        }
        else
        {
          v54 = 0;
          if (v50)
          {
LABEL_39:
            v55 = (void *)sub_235CA37E0();
            swift_bridgeObjectRelease();
            if (v54)
              goto LABEL_40;
            goto LABEL_43;
          }
        }
        v55 = 0;
        if (v54)
        {
LABEL_40:
          v56 = (void *)sub_235CA37E0();
          swift_bridgeObjectRelease();
          goto LABEL_44;
        }
LABEL_43:
        v56 = 0;
LABEL_44:
        v57 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE090A8]), sel_initWithSharedUserId_loggableSharedUserId_, v55, v56);

        if (!v57)
        {
          __break(1u);
          return;
        }
        ++v44;

        sub_235CA3AB0();
        sub_235CA3AD4();
        sub_235CA3AE0();
        sub_235CA3ABC();
        if (v42 == v44)
        {
          v75 = v89;
          swift_bridgeObjectRelease();
          v43 = v82;
          goto LABEL_51;
        }
      }
    }
    __break(1u);
LABEL_59:
    swift_once();
  }
  swift_bridgeObjectRetain();
  v42 = sub_235CA3AF8();
  v43 = v82;
  if (v42)
    goto LABEL_28;
LABEL_50:
  swift_bridgeObjectRelease();
  v75 = MEMORY[0x24BEE4AF8];
LABEL_51:
  v58 = v43 ^ 1;
  v84 = sub_235CA35DC();
  v60 = v59;
  v61 = v92;
  v62 = *MEMORY[0x24BE608A0];
  swift_bridgeObjectRetain();
  v63 = (void *)sub_235CA35C4();
  v64 = sub_235CA35DC();
  v66 = sub_235C763EC(v63, v64, v65);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  v68 = (v66 & 1) == 0 && v66 != 2;
  v69 = v90;
  v70 = sub_235C7534C(v90);
  v71 = v91;
  v73 = v93;
  v72 = v94;
  objc_allocWithZone(MEMORY[0x24BE60890]);
  swift_bridgeObjectRetain();
  HIBYTE(v74) = v70 & 1;
  LOBYTE(v74) = v68;
  sub_235C7FE04(v62, v84, v60, v79, v81, v69, 0, v83, v61, 0, 0, 0, 0, 0, 0, 0, 0, 0, v74,
    1,
    v71,
    0,
    0,
    0,
    0,
    0,
    v75,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    v58 & 1,
    v80,
    v78,
    v77,
    v76,
    0,
    v73,
    v72);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

id sub_235C7FE04(double a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, char a15, char a16, char a17, uint64_t a18, __int16 a19, char a20,char a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,void *a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40,uint64_t a41,uint64_t a42)
{
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
  char v53;
  char v54;
  char v55;
  char v56;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v74;
  id v75;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;

  v71 = (void *)sub_235CA37E0();
  swift_bridgeObjectRelease();
  v70 = (void *)sub_235CA37E0();
  swift_bridgeObjectRelease();
  v69 = (void *)sub_235CA38AC();
  swift_bridgeObjectRelease();
  if (a11)
  {
    v68 = (void *)sub_235CA37E0();
    swift_bridgeObjectRelease();
    v43 = a18;
    if (a13)
      goto LABEL_3;
  }
  else
  {
    v68 = 0;
    v43 = a18;
    if (a13)
    {
LABEL_3:
      v67 = (void *)sub_235CA37E0();
      swift_bridgeObjectRelease();
      v44 = a23;
      if (v43)
        goto LABEL_4;
      goto LABEL_14;
    }
  }
  v67 = 0;
  v44 = a23;
  if (v43)
  {
LABEL_4:
    v66 = (void *)sub_235CA378C();
    swift_bridgeObjectRelease();
    v45 = a26;
    if (v44)
      goto LABEL_5;
    goto LABEL_15;
  }
LABEL_14:
  v66 = 0;
  v45 = a26;
  if (v44)
  {
LABEL_5:
    v65 = (void *)sub_235CA37E0();
    swift_bridgeObjectRelease();
    v46 = a27;
    if (v45)
      goto LABEL_6;
    goto LABEL_16;
  }
LABEL_15:
  v65 = 0;
  v46 = a27;
  if (v45)
  {
LABEL_6:
    v64 = (void *)sub_235CA37E0();
    swift_bridgeObjectRelease();
    v47 = a29;
    if (v46)
      goto LABEL_7;
    goto LABEL_17;
  }
LABEL_16:
  v64 = 0;
  v47 = a29;
  if (v46)
  {
LABEL_7:
    sub_235C807CC();
    v63 = (void *)sub_235CA38AC();
    swift_bridgeObjectRelease();
    v48 = a31;
    if (v47)
      goto LABEL_8;
    goto LABEL_18;
  }
LABEL_17:
  v63 = 0;
  v48 = a31;
  if (v47)
  {
LABEL_8:
    v81 = (void *)sub_235CA37E0();
    swift_bridgeObjectRelease();
    v49 = a33;
    if (v48)
      goto LABEL_9;
    goto LABEL_19;
  }
LABEL_18:
  v81 = 0;
  v49 = a33;
  if (v48)
  {
LABEL_9:
    v80 = (void *)sub_235CA37E0();
    swift_bridgeObjectRelease();
    v50 = a39;
    if (v49)
      goto LABEL_10;
LABEL_20:
    v79 = 0;
    v51 = a42;
    if (v50)
      goto LABEL_11;
    goto LABEL_21;
  }
LABEL_19:
  v80 = 0;
  v50 = a39;
  if (!v49)
    goto LABEL_20;
LABEL_10:
  v79 = (void *)sub_235CA37E0();
  swift_bridgeObjectRelease();
  v51 = a42;
  if (v50)
  {
LABEL_11:
    v78 = (void *)sub_235CA37E0();
    swift_bridgeObjectRelease();
    goto LABEL_22;
  }
LABEL_21:
  v78 = 0;
LABEL_22:
  v52 = a37;
  v53 = a17;
  v54 = a16;
  v55 = a15;
  v56 = a14;
  if (v51)
  {
    v77 = (void *)sub_235CA37E0();
    swift_bridgeObjectRelease();
    v52 = a37;
    v56 = a14;
    v55 = a15;
    v54 = a16;
    v53 = a17;
  }
  else
  {
    v77 = 0;
  }
  LOBYTE(v62) = a40 & 1;
  LOBYTE(v61) = a35 & 1;
  LOBYTE(v60) = a24 & 1;
  BYTE3(v59) = a21 & 1;
  BYTE2(v59) = a20 & 1;
  LOWORD(v59) = a19 & 0x101;
  BYTE3(v58) = v53 & 1;
  BYTE2(v58) = v54 & 1;
  BYTE1(v58) = v55 & 1;
  LOBYTE(v58) = v56 & 1;
  v75 = objc_msgSend(v74, sel_initWithRequestId_inputOrigin_speechRecognitionTaskName_speechRecognitionMode_location_jitGrammar_overrideModelPath_applicationName_detectUtterances_continuousListening_shouldHandleCapitalization_secureOfflineOnly_maximumRecognitionDuration_recognitionOverrides_shouldStoreAudioOnDevice_deliverEagerPackage_enableEmojiRecognition_enableAutoPunctuation_UILanguage_enableVoiceCommands_dictationUIInteractionId_sharedUserInfos_prefixText_postfixText_selectedText_powerContext_shouldStartAudioCapture_audioCaptureStartHostTime_audioRecordType_audioRecordDeviceId_shouldGenerateVoiceCommandCandidates_asrLocale_, v71, v70, a6, a7, a8, v69, a1, v68, v67, v58, v66, v59, v65, v60, v64, v63, v81,
          v80,
          v79,
          a34,
          v61,
          a36,
          v52,
          v78,
          v62,
          v77);

  return v75;
}

void sub_235C80234(void *a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  char v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  NSObject *v25;
  _QWORD *v26;
  uint64_t v27;
  _QWORD *v28;
  NSObject *v29;
  NSObject *v30;

  v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254299088);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v27 - v10;
  v12 = *MEMORY[0x24BE9AEF8];
  v13 = sub_235CA3420();
  v14 = *(_QWORD *)(v13 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 104))(v11, v12, v13);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
  sub_235C806CC((uint64_t)v11, (uint64_t)v9);
  v15 = a2 + qword_2542994F0;
  swift_beginAccess();
  v16 = a1;
  sub_235C80714((uint64_t)v9, v15);
  swift_endAccess();
  sub_235C86820(0);
  v17 = a3();
  sub_235C7F490(v17 & 1);
  if (v18)
  {
    v19 = v18;
    if (qword_2542992E8 != -1)
      swift_once();
    v20 = sub_235CA3708();
    __swift_project_value_buffer(v20, (uint64_t)qword_254299660);
    v21 = v19;
    v22 = sub_235CA36FC();
    v23 = sub_235CA3924();
    if (os_log_type_enabled(v22, v23))
    {
      v29 = v16;
      v24 = (uint8_t *)swift_slowAlloc();
      v28 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v24 = 138412290;
      v30 = v21;
      v25 = v21;
      v16 = v29;
      sub_235CA3A14();
      v26 = v28;
      *v28 = v19;

      _os_log_impl(&dword_235C5E000, v22, v23, "Going to call startASR from AsrCandidateRequestProcessor with settings = %@", v24, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254299410);
      swift_arrayDestroy();
      MEMORY[0x23B7DE144](v26, -1, -1);
      MEMORY[0x23B7DE144](v24, -1, -1);
    }
    else
    {

      v22 = v21;
    }

    objc_msgSend(*(id *)(a2 + qword_2542991A0), sel_startSpeechRecognitionResultsWithSettings_, v21);
  }
  else
  {
    v21 = v16;
  }

}

void sub_235C8051C(void *a1)
{
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  _QWORD *v6;
  id v7;
  id v8;

  if (qword_2542992E8 != -1)
    swift_once();
  v2 = sub_235CA3708();
  __swift_project_value_buffer(v2, (uint64_t)qword_254299660);
  v8 = a1;
  v3 = sub_235CA36FC();
  v4 = sub_235CA3924();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    v6 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v5 = 138412290;
    v7 = v8;
    sub_235CA3A14();
    *v6 = v8;

    _os_log_impl(&dword_235C5E000, v3, v4, "AsrCandidateRequestProcessor received message: %@. Ignoring..", v5, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254299410);
    swift_arrayDestroy();
    MEMORY[0x23B7DE144](v6, -1, -1);
    MEMORY[0x23B7DE144](v5, -1, -1);

  }
  else
  {

  }
}

uint64_t sub_235C806CC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254299088);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_235C80714(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254299088);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_235C8075C@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;

  return sub_235C99DCC(v1[2], v1[3], v1[4], v1[5], a1);
}

uint64_t sub_235C80778@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;

  return sub_235C9A4C0(v1[2], v1[3], v1[4], v1[5], a1);
}

uint64_t sub_235C80794@<X0>(_QWORD *a1@<X8>)
{
  uint64_t *v1;

  return sub_235C9ABC8(v1[2], v1[3], v1[4], v1[5], a1);
}

uint64_t sub_235C807B0@<X0>(_QWORD *a1@<X8>)
{
  uint64_t *v1;

  return sub_235C99988(v1[2], v1[3], v1[4], v1[5], a1);
}

unint64_t sub_235C807CC()
{
  unint64_t result;

  result = qword_254298A00;
  if (!qword_254298A00)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_254298A00);
  }
  return result;
}

void static SignpostLogger.begin(_:enableTelemetry:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  if ((a4 & 1) != 0)
    sub_235C80D80(a1, a2, a3, a5, a6);
  else
    (*(void (**)(uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, uint64_t, _QWORD, _QWORD, uint64_t, uint64_t))(a6 + 24))(a1, a2, a3, 0, 0, 256, 0, 0, a5, a6);
}

void static SignpostLogger.end(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  id v8;

  sub_235CA399C();
  v8 = (id)(*(uint64_t (**)(uint64_t, uint64_t))(a6 + 8))(a5, a6);
  sub_235CA36CC();

}

uint64_t static SignpostLogger.event(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  uint64_t v13;

  v7 = sub_235CA36F0();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_235CA39B4();
  v11 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(a5 + 8))(a4, a5);
  sub_235CA36E4();
  sub_235CA36CC();

  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

void sub_235C809D8()
{
  qword_254299678 = 0x6764697242525341;
  unk_254299680 = 0xE900000000000065;
}

uint64_t sub_235C80A00()
{
  uint64_t v0;

  v0 = sub_235CA3708();
  __swift_allocate_value_buffer(v0, qword_254299660);
  __swift_project_value_buffer(v0, (uint64_t)qword_254299660);
  sub_235C80E84();
  if (qword_254299310 != -1)
    swift_once();
  swift_bridgeObjectRetain();
  sub_235CA39F0();
  return sub_235CA3714();
}

uint64_t sub_235C80AC0()
{
  uint64_t v0;

  v0 = sub_235CA3564();
  __swift_allocate_value_buffer(v0, qword_254299648);
  __swift_project_value_buffer(v0, (uint64_t)qword_254299648);
  return sub_235CA3558();
}

uint64_t sub_235C80B08()
{
  uint64_t result;

  sub_235C80E84();
  if (qword_254299310 != -1)
    swift_once();
  swift_bridgeObjectRetain();
  result = sub_235CA39F0();
  qword_2542994C8 = result;
  return result;
}

void static SignpostLogger.begin(name:parameterOverrideOptions:parameter:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, __int16 a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  void (*v13)(uint64_t, uint64_t);
  void *v14;
  uint64_t v15;
  id v16;

  v13 = *(void (**)(uint64_t, uint64_t))(a10 + 8);
  v13(a9, a10);
  sub_235CA36D8();
  if ((a6 & 0x100) != 0 || !a8)
  {
    sub_235CA39A8();
    v16 = (id)((uint64_t (*)(uint64_t, uint64_t))v13)(a9, a10);
    sub_235CA36CC();

  }
  else
  {
    swift_bridgeObjectRetain();
    sub_235CA39A8();
    v14 = (void *)((uint64_t (*)(uint64_t, uint64_t))v13)(a9, a10);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2563773F0);
    v15 = swift_allocObject();
    *(_OWORD *)(v15 + 16) = xmmword_235CA4440;
    *(_QWORD *)(v15 + 56) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v15 + 64) = sub_235C76B4C();
    *(_QWORD *)(v15 + 32) = a7;
    *(_QWORD *)(v15 + 40) = a8;
    sub_235CA36C0();

    swift_bridgeObjectRelease();
  }
}

void sub_235C80D1C(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  static SignpostLogger.begin(_:enableTelemetry:)(a1, a2, a3, a4, a5, a6);
}

void sub_235C80D30(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, __int16 a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  static SignpostLogger.begin(name:parameterOverrideOptions:parameter:)(a1, a2, a3, a4, a5, a6 & 0x1FF, a7, a8, a9, a10);
}

void sub_235C80D58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  static SignpostLogger.end(_:_:)(a1, a2, a3, a4, a5, a6);
}

uint64_t sub_235C80D6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return static SignpostLogger.event(_:)(a1, a2, a3, a4, a5);
}

void sub_235C80D80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void (*v7)(uint64_t, uint64_t);
  id v8;

  v7 = *(void (**)(uint64_t, uint64_t))(a5 + 8);
  v7(a4, a5);
  sub_235CA36D8();
  sub_235CA39A8();
  v8 = (id)((uint64_t (*)(uint64_t, uint64_t))v7)(a4, a5);
  sub_235CA36C0();

}

uint64_t dispatch thunk of static SignpostLogger.log.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of static SignpostLogger.begin(_:enableTelemetry:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 16))();
}

uint64_t dispatch thunk of static SignpostLogger.begin(name:parameterOverrideOptions:parameter:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, __int16 a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(a10 + 24))(a1, a2, a3, a4, a5, a6 & 0x1FF);
}

uint64_t dispatch thunk of static SignpostLogger.end(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 32))();
}

uint64_t dispatch thunk of static SignpostLogger.event(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 40))();
}

unint64_t sub_235C80E84()
{
  unint64_t result;

  result = qword_254299428;
  if (!qword_254299428)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_254299428);
  }
  return result;
}

uint64_t type metadata accessor for AsrRequestProcessor()
{
  uint64_t result;

  result = qword_254299210;
  if (!qword_254299210)
    return swift_getSingletonMetadata();
  return result;
}

void sub_235C80EFC()
{
  unint64_t v0;
  unint64_t v1;

  sub_235C8899C();
  if (v0 <= 0x3F)
  {
    sub_235CA3498();
    if (v1 <= 0x3F)
      swift_initClassMetadata2();
  }
}

void sub_235C8101C(uint64_t a1, void *a2, void *a3)
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

uint64_t sub_235C81090()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  __swift_destroy_boxed_opaque_existential_1(v0 + qword_254299190);
  __swift_destroy_boxed_opaque_existential_1(v0 + qword_2542991F8);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + qword_2542991E8);
  __swift_destroy_boxed_opaque_existential_1(v0 + qword_2542991B0);
  swift_release();

  swift_release();
  swift_bridgeObjectRelease();
  sub_235C76BD8(v0 + qword_2542994F0, (uint64_t *)&unk_254299088);
  v1 = v0 + qword_254299518;
  v2 = sub_235CA3498();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_release();

  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_235C811C8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  objc_msgSend(*(id *)(v0 + qword_2542991A0), sel_invalidate);
  v1 = sub_235CA35F4();
  __swift_destroy_boxed_opaque_existential_1(v1 + qword_254299190);
  __swift_destroy_boxed_opaque_existential_1(v1 + qword_2542991F8);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v1 + qword_2542991E8);
  __swift_destroy_boxed_opaque_existential_1(v1 + qword_2542991B0);
  swift_release();

  swift_release();
  swift_bridgeObjectRelease();
  sub_235C76BD8(v1 + qword_2542994F0, (uint64_t *)&unk_254299088);
  v2 = v1 + qword_254299518;
  v3 = sub_235CA3498();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
  swift_release();

  swift_release();
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t sub_235C8132C()
{
  sub_235C811C8();
  return swift_deallocClassInstance();
}

uint64_t sub_235C8134C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;

  v0 = sub_235CA3378();
  v2 = v1;
  if (v0 == sub_235CA35DC() && v2 == v3)
    v4 = 1;
  else
    v4 = sub_235CA3B88();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v4 & 1;
}

uint64_t sub_235C813D8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  unint64_t v16;
  _QWORD *v17;
  unint64_t v18;
  _QWORD *v19;
  unint64_t v20;
  _QWORD v22[2];
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;

  v24 = a2;
  v22[1] = a1;
  v2 = sub_235CA2790();
  v23 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254299468);
  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542990C0);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 72);
  v8 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_235CA43E0;
  v22[0] = v9;
  v10 = v9 + v8;
  v11 = *(int *)(v5 + 48);
  sub_235CA34C8();
  if (qword_254299310 != -1)
    swift_once();
  v12 = (_QWORD *)(v10 + v11);
  v13 = unk_254299680;
  *v12 = qword_254299678;
  v12[1] = v13;
  v14 = (_QWORD *)(v10 + v7 + *(int *)(v5 + 48));
  swift_bridgeObjectRetain();
  sub_235CA3504();
  *v14 = 0xD00000000000001ALL;
  v14[1] = 0x8000000235CA5FF0;
  v15 = (_QWORD *)(v10 + 2 * v7 + *(int *)(v5 + 48));
  sub_235CA34D4();
  v25 = 0;
  v26 = 0xE000000000000000;
  sub_235CA3828();
  sub_235CA35AC();
  sub_235CA3828();
  swift_bridgeObjectRelease();
  sub_235CA3828();
  v16 = v26;
  *v15 = v25;
  v15[1] = v16;
  v17 = (_QWORD *)(v10 + 3 * v7 + *(int *)(v5 + 48));
  sub_235CA3534();
  v25 = 0;
  v26 = 0xE000000000000000;
  sub_235CA3828();
  sub_235CA35E8();
  sub_235C69C18((unint64_t *)&unk_254299040, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
  sub_235CA3B64();
  sub_235CA3828();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v23 + 8))(v4, v2);
  sub_235CA3828();
  v18 = v26;
  *v17 = v25;
  v17[1] = v18;
  v19 = (_QWORD *)(v10 + 4 * v7 + *(int *)(v5 + 48));
  sub_235CA3528();
  v25 = 0;
  v26 = 0xE000000000000000;
  sub_235CA3828();
  sub_235CA3378();
  sub_235CA3828();
  swift_bridgeObjectRelease();
  sub_235CA3828();
  v20 = v26;
  *v19 = v25;
  v19[1] = v20;
  return v22[0];
}

void sub_235C81688(void *a1)
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
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  _BOOL4 v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  _QWORD *v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  double v37;
  void *v38;
  uint64_t v39;
  char v40;
  BOOL v42;
  id v43;
  id v44;
  uint64_t v45;
  id v46;
  id v47;
  id v48;
  id v49;
  NSObject *v50;
  os_log_type_t v51;
  uint64_t v52;
  _QWORD *v53;
  id v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  id v64;
  uint64_t v65;
  id v66;
  uint64_t v67;
  char *v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  char *v72;
  uint64_t v73;
  char *v74;

  v2 = sub_235CA3564();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v65 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_235CA3408();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v65 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254299088);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v65 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v65 - v14;
  if ((sub_235CA300C() & 1) != 0)
  {
    v69 = v5;
    v70 = v3;
    v71 = v2;
    v16 = *MEMORY[0x24BE9AEF8];
    v17 = sub_235CA3420();
    v18 = *(_QWORD *)(v17 - 8);
    (*(void (**)(char *, uint64_t, uint64_t))(v18 + 104))(v15, v16, v17);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
    sub_235C8BC7C((uint64_t)v15, (uint64_t)v13, (uint64_t *)&unk_254299088);
    v19 = &v72[qword_2542994F0];
    swift_beginAccess();
    sub_235C80714((uint64_t)v13, (uint64_t)v19);
    swift_endAccess();
    sub_235C86820(0);
    v20 = sub_235CA2FF4() != 0;
    swift_bridgeObjectRelease();
    v68 = (char *)(2 * v20);
    v21 = sub_235CA3378();
    v23 = v22;
    sub_235CA2928();
    v67 = sub_235CA33FC();
    v25 = v24;
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    if (sub_235CA2D3C())
    {
      v26 = (void *)sub_235CA34A4();
      swift_release();
    }
    else
    {
      v26 = 0;
    }
    v33 = sub_235CA2FF4();
    if (v33)
      v34 = v33;
    else
      v34 = MEMORY[0x24BEE4AF8];
    v65 = sub_235CA3000();
    v36 = v35;
    v37 = *MEMORY[0x24BE608A0];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v66 = v26;
    v38 = (void *)sub_235CA35C4();
    v39 = v21;
    v40 = sub_235C763EC(v38, v21, v23);
    swift_unknownObjectRelease();
    v42 = (v40 & 1) == 0 && v40 != 2;
    v43 = objc_allocWithZone(MEMORY[0x24BE60890]);
    v44 = sub_235C889F8(v37, v39, v23, v67, v25, (uint64_t)v68, 0, v26, v34, v65, v36, 0, 0, 0, 0, 0, 0, 0, v42,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    if (qword_2542992E8 != -1)
      swift_once();
    v45 = sub_235CA3708();
    __swift_project_value_buffer(v45, (uint64_t)qword_254299660);
    v46 = a1;
    v47 = v44;
    v48 = v46;
    v49 = v47;
    v50 = sub_235CA36FC();
    v51 = sub_235CA3924();
    if (os_log_type_enabled(v50, v51))
    {
      v52 = swift_slowAlloc();
      v53 = (_QWORD *)swift_slowAlloc();
      v68 = (char *)swift_slowAlloc();
      v73 = (uint64_t)v49;
      v74 = v68;
      *(_DWORD *)v52 = 138412546;
      v54 = v49;
      sub_235CA3A14();
      *v53 = v49;

      *(_WORD *)(v52 + 12) = 2080;
      v55 = sub_235CA3378();
      v73 = sub_235C944B8(v55, v56, (uint64_t *)&v74);
      sub_235CA3A14();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_235C5E000, v50, v51, "RequestSettings: %@ for requestId: %s", (uint8_t *)v52, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254299410);
      swift_arrayDestroy();
      MEMORY[0x23B7DE144](v53, -1, -1);
      v57 = (uint64_t)v68;
      swift_arrayDestroy();
      MEMORY[0x23B7DE144](v57, -1, -1);
      MEMORY[0x23B7DE144](v52, -1, -1);

    }
    else
    {

    }
    v58 = v71;
    v59 = v72;
    v60 = v69;
    objc_msgSend(*(id *)&v72[qword_2542991A0], sel_startSpeechRecognitionResultsWithSettings_, v49);
    if (qword_2542989C0 != -1)
      swift_once();
    v61 = __swift_project_value_buffer(v58, (uint64_t)qword_254299648);
    v62 = v70;
    (*(void (**)(char *, uint64_t, uint64_t))(v70 + 16))(v60, v61, v58);
    v63 = swift_allocObject();
    *(_QWORD *)(v63 + 16) = v59;
    *(_QWORD *)(v63 + 24) = v48;
    v64 = v48;
    swift_retain();
    sub_235CA3540();

    swift_release();
    (*(void (**)(char *, uint64_t))(v62 + 8))(v60, v58);
  }
  else
  {
    if (qword_2542992E8 != -1)
      swift_once();
    v27 = sub_235CA3708();
    __swift_project_value_buffer(v27, (uint64_t)qword_254299660);
    v72 = a1;
    v28 = sub_235CA36FC();
    v29 = sub_235CA3924();
    if (os_log_type_enabled(v28, v29))
    {
      v30 = (uint8_t *)swift_slowAlloc();
      v31 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v30 = 138412290;
      v74 = v72;
      v32 = v72;
      sub_235CA3A14();
      *v31 = v72;

      _os_log_impl(&dword_235C5E000, v28, v29, "AsrRequestProcessor received message: %@ ignoring it...", v30, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254299410);
      swift_arrayDestroy();
      MEMORY[0x23B7DE144](v31, -1, -1);
      MEMORY[0x23B7DE144](v30, -1, -1);

    }
    else
    {

    }
  }
}

uint64_t sub_235C81E38(void *a1)
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
  id v18;
  NSObject *v19;
  os_log_type_t v20;
  uint64_t v21;
  uint8_t *v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  id v26;
  _QWORD *v27;
  uint8_t *v28;
  uint64_t v29;
  void (*v30)(char *, uint64_t, uint64_t);
  id v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  void *v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  double v43;
  void *v44;
  char v45;
  uint64_t v46;
  BOOL v48;
  id v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  id v56;
  _QWORD *v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  char *v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  id v69;

  v2 = v1;
  v4 = sub_235CA3564();
  v67 = *(_QWORD *)(v4 - 8);
  v68 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v66 = (char *)&v58 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_235CA3408();
  v65 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v64 = (char *)&v58 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_235CA3420();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v58 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254299088);
  v13 = MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v58 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v63 = (char *)&v58 - v16;
  if (qword_2542992E8 != -1)
    swift_once();
  v17 = sub_235CA3708();
  __swift_project_value_buffer(v17, (uint64_t)qword_254299660);
  v18 = a1;
  v19 = sub_235CA36FC();
  v20 = sub_235CA3924();
  if (os_log_type_enabled(v19, v20))
  {
    v62 = v2;
    v21 = swift_slowAlloc();
    v59 = v15;
    v22 = (uint8_t *)v21;
    v23 = swift_slowAlloc();
    v61 = v6;
    v58 = (_QWORD *)v23;
    *(_DWORD *)v22 = 138412290;
    v69 = v18;
    v24 = v18;
    v60 = v9;
    v25 = v8;
    v26 = v24;
    v2 = v62;
    sub_235CA3A14();
    v27 = v58;
    *v58 = v18;

    v8 = v25;
    v9 = v60;
    _os_log_impl(&dword_235C5E000, v19, v20, "AsrRequestProcessor received message: %@", v22, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254299410);
    swift_arrayDestroy();
    v6 = v61;
    MEMORY[0x23B7DE144](v27, -1, -1);
    v28 = v22;
    v15 = v59;
    MEMORY[0x23B7DE144](v28, -1, -1);

  }
  else
  {

  }
  v29 = *MEMORY[0x24BE9AED8];
  v30 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 104);
  v31 = v63;
  v30(v63, v29, v8);
  (*(void (**)(id, _QWORD, uint64_t, uint64_t))(v9 + 56))(v31, 0, 1, v8);
  sub_235C8BC7C((uint64_t)v31, (uint64_t)v15, (uint64_t *)&unk_254299088);
  v32 = v2 + qword_2542994F0;
  swift_beginAccess();
  sub_235C80714((uint64_t)v15, v32);
  swift_endAccess();
  sub_235C86820(0);
  v30(v11, v29, v8);
  v33 = sub_235C881CC((uint64_t)v11);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  *(_QWORD *)(v2 + qword_2542994E0) = v33;
  swift_release();
  v63 = *(char **)(v2 + qword_2542991A0);
  v34 = v63;
  sub_235CA3378();
  v35 = (void *)sub_235CA37E0();
  swift_bridgeObjectRelease();
  objc_msgSend(v34, sel_disableLocalSpeechRecognitionForRequestId_, v35);

  v36 = sub_235CA3378();
  v38 = v37;
  v39 = v64;
  sub_235CA2928();
  v40 = sub_235CA33FC();
  v42 = v41;
  (*(void (**)(char *, uint64_t))(v65 + 8))(v39, v6);
  v43 = *MEMORY[0x24BE608A0];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v44 = (void *)sub_235CA35C4();
  v45 = sub_235C763EC(v44, v36, v38);
  v46 = v2;
  swift_unknownObjectRelease();
  v48 = (v45 & 1) == 0 && v45 != 2;
  v49 = objc_allocWithZone(MEMORY[0x24BE60890]);
  v50 = sub_235C889F8(v43, v36, v38, v40, v42, 0, 1, 0, MEMORY[0x24BEE4AF8], 0, 0, 0, 0, 0, 0, 0, 0, 0, v48,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0,
          0);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_msgSend(v63, sel_startSpeechRecognitionResultsWithSettings_, v50);
  if (qword_2542989C0 != -1)
    swift_once();
  v51 = v68;
  v52 = __swift_project_value_buffer(v68, (uint64_t)qword_254299648);
  v53 = v66;
  v54 = v67;
  (*(void (**)(char *, uint64_t, uint64_t))(v67 + 16))(v66, v52, v51);
  v55 = swift_allocObject();
  *(_QWORD *)(v55 + 16) = v46;
  *(_QWORD *)(v55 + 24) = v18;
  v56 = v18;
  swift_retain();
  sub_235CA3540();

  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v54 + 8))(v53, v51);
}

uint64_t sub_235C82410(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  id v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unsigned int *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  char v25;
  id v26;
  id v27;
  NSObject *v28;
  os_log_type_t v29;
  uint64_t v30;
  _QWORD *v31;
  id v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  _QWORD *v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  id v51[3];

  v2 = sub_235CA3564();
  v47 = *(_QWORD *)(v2 - 8);
  v48 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v46 = (char *)&v44 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254299088);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v44 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v44 - v8;
  if (qword_2542992E8 != -1)
    swift_once();
  v10 = sub_235CA3708();
  v11 = __swift_project_value_buffer(v10, (uint64_t)qword_254299660);
  v12 = a1;
  v13 = sub_235CA36FC();
  v14 = sub_235CA3924();
  if (os_log_type_enabled(v13, v14))
  {
    v45 = v11;
    v15 = (uint8_t *)swift_slowAlloc();
    v44 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v15 = 138412290;
    v51[0] = v12;
    v16 = v12;
    sub_235CA3A14();
    v17 = v44;
    *v44 = v12;

    _os_log_impl(&dword_235C5E000, v13, v14, "AsrRequestProcessor received message: %@", v15, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254299410);
    swift_arrayDestroy();
    MEMORY[0x23B7DE144](v17, -1, -1);
    MEMORY[0x23B7DE144](v15, -1, -1);

  }
  else
  {

  }
  sub_235CA3210();
  v18 = swift_dynamicCastClass();
  v19 = sub_235CA3420();
  v20 = *(_QWORD *)(v19 - 8);
  v21 = (unsigned int *)MEMORY[0x24BE9AF18];
  if (v18)
    v21 = (unsigned int *)MEMORY[0x24BE9AED0];
  (*(void (**)(char *, _QWORD, uint64_t))(v20 + 104))(v9, *v21, v19);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v20 + 56))(v9, 0, 1, v19);
  sub_235C8BC7C((uint64_t)v9, (uint64_t)v7, (uint64_t *)&unk_254299088);
  v22 = v49;
  v23 = v49 + qword_2542994F0;
  swift_beginAccess();
  sub_235C80714((uint64_t)v7, v23);
  swift_endAccess();
  v24 = (void *)sub_235CA30FC();
  sub_235C86820(v24);

  v25 = AFIsATV();
  v26 = sub_235C8599C((uint64_t)v12, v25);
  swift_retain_n();
  v27 = v26;
  v28 = sub_235CA36FC();
  v29 = sub_235CA3924();
  if (os_log_type_enabled(v28, v29))
  {
    v30 = swift_slowAlloc();
    v31 = (_QWORD *)swift_slowAlloc();
    v45 = swift_slowAlloc();
    v50 = (uint64_t)v27;
    v51[0] = (id)v45;
    *(_DWORD *)v30 = 138412546;
    v32 = v27;
    sub_235CA3A14();
    *v31 = v27;

    v22 = v49;
    *(_WORD *)(v30 + 12) = 2080;
    v33 = sub_235CA35DC();
    v50 = sub_235C944B8(v33, v34, (uint64_t *)v51);
    sub_235CA3A14();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_235C5E000, v28, v29, "RequestSettings: %@ for requestId: %s", (uint8_t *)v30, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254299410);
    swift_arrayDestroy();
    MEMORY[0x23B7DE144](v31, -1, -1);
    v35 = v45;
    swift_arrayDestroy();
    MEMORY[0x23B7DE144](v35, -1, -1);
    MEMORY[0x23B7DE144](v30, -1, -1);

  }
  else
  {

    swift_release_n();
  }
  v36 = objc_msgSend(v27, sel_speechRecognitionTask);
  sub_235CA3378();
  sub_235C717E4((unint64_t)v36);
  swift_bridgeObjectRelease();
  objc_msgSend(*(id *)(v22 + qword_2542991A0), sel_startSpeechRecognitionResultsWithSettings_, v27);
  if (qword_2542989C0 != -1)
    swift_once();
  v37 = v48;
  v38 = __swift_project_value_buffer(v48, (uint64_t)qword_254299648);
  v39 = v46;
  v40 = v47;
  (*(void (**)(char *, uint64_t, uint64_t))(v47 + 16))(v46, v38, v37);
  v41 = swift_allocObject();
  *(_QWORD *)(v41 + 16) = v22;
  *(_QWORD *)(v41 + 24) = v12;
  v42 = v12;
  swift_retain();
  sub_235CA3540();

  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v40 + 8))(v39, v37);
}

void sub_235C829E8(void *a1)
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
  void *v11;
  id v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;

  v2 = v1;
  if (qword_2542992E8 != -1)
    swift_once();
  v4 = sub_235CA3708();
  __swift_project_value_buffer(v4, (uint64_t)qword_254299660);
  v5 = a1;
  v6 = sub_235CA36FC();
  v7 = sub_235CA3924();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    v9 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v8 = 138412290;
    v10 = v5;
    sub_235CA3A14();
    *v9 = v5;

    v2 = v1;
    _os_log_impl(&dword_235C5E000, v6, v7, "AsrRequestProcessor received message: %@", v8, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254299410);
    swift_arrayDestroy();
    MEMORY[0x23B7DE144](v9, -1, -1);
    MEMORY[0x23B7DE144](v8, -1, -1);

  }
  else
  {

  }
  v11 = *(void **)(v2 + qword_2542991C8);
  if (v11)
  {
    v12 = v11;
    sub_235CA3378();
    v13 = sub_235CA37E0();
    swift_bridgeObjectRelease();
    objc_msgSend(v12, sel_siriPromptWillStartWithRootRequestId_, v13);

  }
  else
  {
    v13 = sub_235CA36FC();
    v14 = sub_235CA3930();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_235C5E000, v13, v14, "AttendingClient not set while receiving SiriWillPromptMessage, dropping", v15, 2u);
      MEMORY[0x23B7DE144](v15, -1, -1);
    }
  }

}

void sub_235C82C40(void *a1)
{
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
  char *v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  os_log_type_t v17;
  uint64_t v18;
  uint8_t *v19;
  id v20;
  _QWORD *v21;
  os_log_type_t v22;
  uint8_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t (*v28)(char *, uint64_t, uint64_t);
  int v29;
  uint64_t v30;
  char v31;
  void (*v32)(char *, uint64_t);
  void *v33;
  NSObject *v34;
  NSObject *v35;
  os_log_type_t v36;
  uint8_t *v37;
  _QWORD *v38;
  NSObject *v39;
  uint8_t *v40;
  _QWORD *v41;
  uint8_t *v42;
  char *v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  NSObject *v48;
  id v49;

  v2 = sub_235CA3420();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v40 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542990A0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254299088);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v46 = (uint64_t)&v40 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v40 - v12;
  if (qword_2542992E8 != -1)
    swift_once();
  v14 = sub_235CA3708();
  __swift_project_value_buffer(v14, (uint64_t)qword_254299660);
  v15 = a1;
  v16 = sub_235CA36FC();
  v17 = sub_235CA3924();
  if (os_log_type_enabled(v16, v17))
  {
    v45 = v3;
    v18 = swift_slowAlloc();
    v44 = v5;
    v19 = (uint8_t *)v18;
    v41 = (_QWORD *)swift_slowAlloc();
    v42 = v19;
    v43 = v13;
    *(_DWORD *)v19 = 138412290;
    v40 = v19 + 4;
    v49 = v15;
    v20 = v15;
    v13 = v43;
    sub_235CA3A14();
    v21 = v41;
    *v41 = v15;

    v3 = v45;
    v22 = v17;
    v23 = v42;
    _os_log_impl(&dword_235C5E000, v16, v22, "AsrRequestProcessor received message: %@", v42, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254299410);
    swift_arrayDestroy();
    MEMORY[0x23B7DE144](v21, -1, -1);
    v5 = v44;
    MEMORY[0x23B7DE144](v23, -1, -1);

  }
  else
  {

  }
  v24 = v47 + qword_2542994F0;
  swift_beginAccess();
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v13, *MEMORY[0x24BE9AF18], v2);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v3 + 56))(v13, 0, 1, v2);
  v25 = *(int *)(v6 + 48);
  v26 = (uint64_t)v13;
  v27 = (uint64_t)&v8[v25];
  sub_235C8BA84(v24, (uint64_t)v8);
  sub_235C8BA84(v26, v27);
  v28 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v3 + 48);
  v29 = v28(v8, 1, v2);
  v30 = v46;
  if (v29 == 1)
  {
    sub_235C76BD8(v26, (uint64_t *)&unk_254299088);
    if (v28((char *)v27, 1, v2) == 1)
    {
      sub_235C76BD8((uint64_t)v8, (uint64_t *)&unk_254299088);
LABEL_13:
      v33 = *(void **)(v47 + qword_2542991A0);
      sub_235CA3378();
      v34 = sub_235CA37E0();
      swift_bridgeObjectRelease();
      objc_msgSend(v33, sel_pauseLocalSpeechRecognitionForRequestId_, v34);
      goto LABEL_17;
    }
    goto LABEL_11;
  }
  sub_235C8BA84((uint64_t)v8, v46);
  if (v28((char *)v27, 1, v2) == 1)
  {
    sub_235C76BD8(v26, (uint64_t *)&unk_254299088);
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v30, v2);
LABEL_11:
    sub_235C76BD8((uint64_t)v8, &qword_2542990A0);
    goto LABEL_14;
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 32))(v5, v27, v2);
  sub_235C69C18(&qword_254299080, (uint64_t (*)(uint64_t))MEMORY[0x24BE9AF20], MEMORY[0x24BE9AF30]);
  v31 = sub_235CA37D4();
  v32 = *(void (**)(char *, uint64_t))(v3 + 8);
  v32(v5, v2);
  sub_235C76BD8(v26, (uint64_t *)&unk_254299088);
  v32((char *)v30, v2);
  sub_235C76BD8((uint64_t)v8, (uint64_t *)&unk_254299088);
  if ((v31 & 1) != 0)
    goto LABEL_13;
LABEL_14:
  v35 = v15;
  v34 = sub_235CA36FC();
  v36 = sub_235CA3930();
  if (os_log_type_enabled(v34, v36))
  {
    v37 = (uint8_t *)swift_slowAlloc();
    v38 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v37 = 138412290;
    v48 = v35;
    v39 = v35;
    sub_235CA3A14();
    *v38 = v35;

    _os_log_impl(&dword_235C5E000, v34, v36, "Received unexpected %@ message. Current request is not dictation", v37, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254299410);
    swift_arrayDestroy();
    MEMORY[0x23B7DE144](v38, -1, -1);
    MEMORY[0x23B7DE144](v37, -1, -1);
  }
  else
  {

    v34 = v35;
  }
LABEL_17:

}

void sub_235C831F8(void *a1)
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
  char *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  uint8_t *v18;
  id v19;
  id v20;
  _QWORD *v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unsigned int (*v27)(uint64_t, uint64_t, uint64_t);
  char v28;
  void (*v29)(char *, uint64_t);
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  NSObject *v35;
  os_log_type_t v36;
  uint8_t *v37;
  _QWORD *v38;
  NSObject *v39;
  _QWORD *v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  NSObject *v48;
  id v49;

  v2 = sub_235CA3420();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v40 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542990A0);
  MEMORY[0x24BDAC7A8](v6);
  v47 = (uint64_t)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254299088);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v45 = (char *)&v40 - v12;
  if (qword_2542992E8 != -1)
    swift_once();
  v13 = sub_235CA3708();
  __swift_project_value_buffer(v13, (uint64_t)qword_254299660);
  v14 = a1;
  v15 = sub_235CA36FC();
  v16 = sub_235CA3924();
  if (os_log_type_enabled(v15, v16))
  {
    v44 = v3;
    v17 = swift_slowAlloc();
    v43 = v5;
    v18 = (uint8_t *)v17;
    v40 = (_QWORD *)swift_slowAlloc();
    v41 = v6;
    *(_DWORD *)v18 = 138412290;
    v49 = v14;
    v19 = v14;
    v42 = v2;
    v20 = v19;
    v3 = v44;
    v6 = v41;
    sub_235CA3A14();
    v21 = v40;
    *v40 = v14;

    v2 = v42;
    _os_log_impl(&dword_235C5E000, v15, v16, "AsrRequestProcessor received message: %@", v18, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254299410);
    swift_arrayDestroy();
    MEMORY[0x23B7DE144](v21, -1, -1);
    v22 = v18;
    v5 = v43;
    MEMORY[0x23B7DE144](v22, -1, -1);

  }
  else
  {

  }
  v23 = v46 + qword_2542994F0;
  swift_beginAccess();
  v24 = (uint64_t)v45;
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v45, *MEMORY[0x24BE9AF18], v2);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v3 + 56))(v24, 0, 1, v2);
  v25 = v47;
  v26 = v47 + *(int *)(v6 + 48);
  sub_235C8BA84(v23, v47);
  sub_235C8BA84(v24, v26);
  v27 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48);
  if (v27(v25, 1, v2) == 1)
  {
    sub_235C76BD8(v24, (uint64_t *)&unk_254299088);
    if (v27(v26, 1, v2) == 1)
    {
      sub_235C76BD8(v47, (uint64_t *)&unk_254299088);
LABEL_13:
      v30 = *(void **)(v46 + qword_2542991A0);
      sub_235CA3378();
      v31 = (void *)sub_235CA37E0();
      swift_bridgeObjectRelease();
      sub_235CA2F94();
      v32 = (void *)sub_235CA37E0();
      swift_bridgeObjectRelease();
      sub_235CA2FA0();
      v33 = (void *)sub_235CA37E0();
      swift_bridgeObjectRelease();
      sub_235CA2FAC();
      v34 = sub_235CA37E0();
      swift_bridgeObjectRelease();
      objc_msgSend(v30, sel_resumeLocalRecognitionWithRequestId_prefixText_postfixText_selectedText_, v31, v32, v33, v34);

      goto LABEL_17;
    }
    goto LABEL_11;
  }
  sub_235C8BA84(v47, (uint64_t)v11);
  if (v27(v26, 1, v2) == 1)
  {
    sub_235C76BD8(v24, (uint64_t *)&unk_254299088);
    (*(void (**)(char *, uint64_t))(v3 + 8))(v11, v2);
LABEL_11:
    sub_235C76BD8(v47, &qword_2542990A0);
    goto LABEL_14;
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 32))(v5, v26, v2);
  sub_235C69C18(&qword_254299080, (uint64_t (*)(uint64_t))MEMORY[0x24BE9AF20], MEMORY[0x24BE9AF30]);
  v28 = sub_235CA37D4();
  v29 = *(void (**)(char *, uint64_t))(v3 + 8);
  v29(v5, v2);
  sub_235C76BD8(v24, (uint64_t *)&unk_254299088);
  v29(v11, v2);
  sub_235C76BD8(v47, (uint64_t *)&unk_254299088);
  if ((v28 & 1) != 0)
    goto LABEL_13;
LABEL_14:
  v35 = v14;
  v34 = sub_235CA36FC();
  v36 = sub_235CA3930();
  if (os_log_type_enabled(v34, v36))
  {
    v37 = (uint8_t *)swift_slowAlloc();
    v38 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v37 = 138412290;
    v48 = v35;
    v39 = v35;
    sub_235CA3A14();
    *v38 = v35;

    _os_log_impl(&dword_235C5E000, v34, v36, "Received unexpected %@ message. Current request is not dictation", v37, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254299410);
    swift_arrayDestroy();
    MEMORY[0x23B7DE144](v38, -1, -1);
    MEMORY[0x23B7DE144](v37, -1, -1);
  }
  else
  {

    v34 = v35;
  }
LABEL_17:

}

void sub_235C83804(void *a1)
{
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
  char *v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  uint8_t *v18;
  id v19;
  id v20;
  _QWORD *v21;
  uint8_t *v22;
  char *v23;
  uint64_t v24;
  uint64_t (*v25)(char *, uint64_t, uint64_t);
  int v26;
  uint64_t v27;
  char v28;
  id v29;
  void (*v30)(char *, uint64_t);
  void *v31;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  NSObject *v35;
  os_log_type_t v36;
  uint8_t *v37;
  _QWORD *v38;
  NSObject *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  _QWORD *v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  NSObject *v56;
  id v57;

  v2 = sub_235CA3420();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v48 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542990A0);
  MEMORY[0x24BDAC7A8](v53);
  v7 = (char *)&v48 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254299088);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v54 = (uint64_t)&v48 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v48 - v11;
  if (qword_2542992E8 != -1)
    swift_once();
  v13 = sub_235CA3708();
  __swift_project_value_buffer(v13, (uint64_t)qword_254299660);
  v14 = a1;
  v15 = sub_235CA36FC();
  v16 = sub_235CA3924();
  if (os_log_type_enabled(v15, v16))
  {
    v17 = swift_slowAlloc();
    v52 = v7;
    v18 = (uint8_t *)v17;
    v48 = (_QWORD *)swift_slowAlloc();
    v50 = v3;
    v51 = v2;
    *(_DWORD *)v18 = 138412290;
    v57 = v14;
    v19 = v14;
    v49 = v12;
    v20 = v19;
    v3 = v50;
    v2 = v51;
    sub_235CA3A14();
    v21 = v48;
    *v48 = v14;

    v12 = v49;
    _os_log_impl(&dword_235C5E000, v15, v16, "AsrRequestProcessor received message: %@", v18, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254299410);
    swift_arrayDestroy();
    MEMORY[0x23B7DE144](v21, -1, -1);
    v22 = v18;
    v7 = v52;
    MEMORY[0x23B7DE144](v22, -1, -1);

  }
  else
  {

  }
  v23 = &v55[qword_2542994F0];
  swift_beginAccess();
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v12, *MEMORY[0x24BE9AF18], v2);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v3 + 56))(v12, 0, 1, v2);
  v24 = (uint64_t)&v7[*(int *)(v53 + 48)];
  sub_235C8BA84((uint64_t)v23, (uint64_t)v7);
  sub_235C8BA84((uint64_t)v12, v24);
  v25 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v3 + 48);
  v26 = v25(v7, 1, v2);
  v27 = v54;
  if (v26 != 1)
  {
    sub_235C8BA84((uint64_t)v7, v54);
    if (v25((char *)v24, 1, v2) != 1)
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v3 + 32))(v5, v24, v2);
      sub_235C69C18(&qword_254299080, (uint64_t (*)(uint64_t))MEMORY[0x24BE9AF20], MEMORY[0x24BE9AF30]);
      v28 = sub_235CA37D4();
      v29 = v14;
      v30 = *(void (**)(char *, uint64_t))(v3 + 8);
      v30(v5, v2);
      sub_235C76BD8((uint64_t)v12, (uint64_t *)&unk_254299088);
      v30((char *)v27, v2);
      v14 = v29;
      sub_235C76BD8((uint64_t)v7, (uint64_t *)&unk_254299088);
      if ((v28 & 1) != 0)
        goto LABEL_13;
LABEL_15:
      v34 = v14;
      v35 = sub_235CA36FC();
      v36 = sub_235CA3930();
      if (os_log_type_enabled(v35, v36))
      {
        v37 = (uint8_t *)swift_slowAlloc();
        v38 = (_QWORD *)swift_slowAlloc();
        *(_DWORD *)v37 = 138412290;
        v56 = v34;
        v39 = v34;
        sub_235CA3A14();
        *v38 = v34;

        _os_log_impl(&dword_235C5E000, v35, v36, "Received unexpected %@ message. Current request is not dictation", v37, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254299410);
        swift_arrayDestroy();
        MEMORY[0x23B7DE144](v38, -1, -1);
        MEMORY[0x23B7DE144](v37, -1, -1);
      }
      else
      {

        v35 = v34;
      }
      goto LABEL_41;
    }
    sub_235C76BD8((uint64_t)v12, (uint64_t *)&unk_254299088);
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v27, v2);
LABEL_11:
    sub_235C76BD8((uint64_t)v7, &qword_2542990A0);
    goto LABEL_15;
  }
  sub_235C76BD8((uint64_t)v12, (uint64_t *)&unk_254299088);
  if (v25((char *)v24, 1, v2) != 1)
    goto LABEL_11;
  sub_235C76BD8((uint64_t)v7, (uint64_t *)&unk_254299088);
LABEL_13:
  v55 = *(char **)&v55[qword_2542991A0];
  sub_235CA3378();
  v31 = (void *)sub_235CA37E0();
  swift_bridgeObjectRelease();
  sub_235CA2EA4();
  if (v32)
  {
    v33 = (void *)sub_235CA37E0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v33 = 0;
  }
  sub_235CA2EB0();
  if (v40)
  {
    v41 = (void *)sub_235CA37E0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v41 = 0;
  }
  sub_235CA2EBC();
  if (v42)
  {
    v43 = (void *)sub_235CA37E0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v43 = 0;
  }
  if (sub_235CA2ED4() == 2)
    v44 = 0;
  else
    v44 = (void *)sub_235CA38F4();
  if (sub_235CA2EC8() == 2)
    v45 = 0;
  else
    v45 = (void *)sub_235CA38F4();
  if (sub_235CA2E98() == 2)
    v46 = 0;
  else
    v46 = (void *)sub_235CA38F4();
  if (sub_235CA2E8C() == 2)
    v47 = 0;
  else
    v47 = (void *)sub_235CA38F4();
  if (sub_235CA2EE0() == 2)
    v35 = 0;
  else
    v35 = sub_235CA38F4();
  objc_msgSend(v55, sel_updateVoiceCommandContextWithRequestId_prefixText_postfixText_selectedText_disambiguationActive_cursorInVisibleText_favorCommandSuppression_abortCommandSuppression_undoEvent_, v31, v33, v41, v43, v44, v45, v46, v47, v35);

LABEL_41:
}

void sub_235C83F44(void *a1)
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
  uint64_t v11;
  void *v12;
  void *v13;

  v2 = v1;
  if (qword_2542992E8 != -1)
    swift_once();
  v4 = sub_235CA3708();
  __swift_project_value_buffer(v4, (uint64_t)qword_254299660);
  v5 = a1;
  v6 = sub_235CA36FC();
  v7 = sub_235CA3924();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    v9 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v8 = 138412290;
    v10 = v5;
    sub_235CA3A14();
    *v9 = v5;

    _os_log_impl(&dword_235C5E000, v6, v7, "AsrRequestProcessor received message: %@", v8, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254299410);
    swift_arrayDestroy();
    MEMORY[0x23B7DE144](v9, -1, -1);
    MEMORY[0x23B7DE144](v8, -1, -1);

  }
  else
  {

  }
  v11 = sub_235CA2904();
  sub_235C89204(v11);
  swift_bridgeObjectRelease();
  v12 = *(void **)(v2 + qword_2542991A0);
  sub_235C71624(0, (unint64_t *)&unk_254299400);
  v13 = (void *)sub_235CA378C();
  swift_release();
  objc_msgSend(v12, sel_updateTCUState_, v13);

}

void sub_235C84160(void *a1)
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
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t inited;
  void *v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  uint64_t v21;

  v2 = v1;
  if (qword_2542992E8 != -1)
    swift_once();
  v4 = sub_235CA3708();
  __swift_project_value_buffer(v4, (uint64_t)qword_254299660);
  v5 = a1;
  v6 = sub_235CA36FC();
  v7 = sub_235CA3924();
  if (os_log_type_enabled(v6, v7))
  {
    v21 = v2;
    v8 = (uint8_t *)swift_slowAlloc();
    v9 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v8 = 138412290;
    v10 = v5;
    sub_235CA3A14();
    *v9 = v5;

    _os_log_impl(&dword_235C5E000, v6, v7, "AsrRequestProcessor received message: %@", v8, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254299410);
    swift_arrayDestroy();
    MEMORY[0x23B7DE144](v9, -1, -1);
    v11 = v8;
    v2 = v21;
    MEMORY[0x23B7DE144](v11, -1, -1);

  }
  else
  {

  }
  v12 = sub_235CA2934();
  if (v13)
  {
    v14 = v12;
    v15 = v13;
    __swift_instantiateConcreteTypeFromMangledName(&qword_254299480);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_235CA4440;
    *(_QWORD *)(inited + 32) = v14;
    *(_QWORD *)(inited + 40) = v15;
    *(_QWORD *)(inited + 48) = sub_235CA3918();
    sub_235C8EC88(inited);
    v17 = *(void **)(v2 + qword_2542991A0);
    sub_235C71624(0, (unint64_t *)&unk_254299400);
    v18 = sub_235CA378C();
    swift_bridgeObjectRelease();
    objc_msgSend(v17, sel_updateTCUState_, v18);
  }
  else
  {
    v18 = sub_235CA36FC();
    v19 = sub_235CA3924();
    if (os_log_type_enabled(v18, v19))
    {
      v20 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_235C5E000, v18, v19, "TRPFinalizedMessage does not have a finalTCUId, skipping calling updateTCUState.", v20, 2u);
      MEMORY[0x23B7DE144](v20, -1, -1);
    }
  }

}

void sub_235C84428(void *a1)
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
  void *v11;
  void *v12;
  void *v13;

  v2 = v1;
  if (qword_2542992E8 != -1)
    swift_once();
  v4 = sub_235CA3708();
  __swift_project_value_buffer(v4, (uint64_t)qword_254299660);
  v5 = a1;
  v6 = sub_235CA36FC();
  v7 = sub_235CA3924();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    v9 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v8 = 138412290;
    v10 = v5;
    sub_235CA3A14();
    *v9 = v5;

    _os_log_impl(&dword_235C5E000, v6, v7, "AsrRequestProcessor received message: %@", v8, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254299410);
    swift_arrayDestroy();
    MEMORY[0x23B7DE144](v9, -1, -1);
    MEMORY[0x23B7DE144](v8, -1, -1);

  }
  else
  {

  }
  sub_235CA3378();
  sub_235CA31EC();
  v11 = *(void **)(v2 + qword_2542991A0);
  v12 = (void *)sub_235CA37E0();
  swift_bridgeObjectRelease();
  v13 = (void *)sub_235CA37E0();
  swift_bridgeObjectRelease();
  objc_msgSend(v11, sel_trpCandidateReadyForExecutionForRequestId_withTrpId_, v12, v13);

}

void sub_235C84638(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint8_t *v9;
  _QWORD *v10;
  id v11;
  _QWORD *v12;
  void (*v13)(void);
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;

  v2 = v1;
  if (qword_2542992E8 != -1)
    swift_once();
  v4 = sub_235CA3708();
  __swift_project_value_buffer(v4, (uint64_t)qword_254299660);
  v5 = a1;
  v6 = sub_235CA36FC();
  v7 = sub_235CA3924();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = v2;
    v9 = (uint8_t *)swift_slowAlloc();
    v10 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v9 = 138412290;
    v11 = v5;
    sub_235CA3A14();
    *v10 = v5;

    v2 = v8;
    _os_log_impl(&dword_235C5E000, v6, v7, "AsrRequestProcessor received message: %@", v9, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254299410);
    swift_arrayDestroy();
    MEMORY[0x23B7DE144](v10, -1, -1);
    MEMORY[0x23B7DE144](v9, -1, -1);

  }
  else
  {

  }
  if ((sub_235CA30CC() & 1) == 0)
  {
    v12 = *(_QWORD **)(v2 + qword_2542994F8);
    if (v12)
    {
      v13 = *(void (**)(void))((*MEMORY[0x24BEE4EA0] & *v12) + 0xC8);
      v14 = v12;
      v13();
    }
    else
    {
      v14 = sub_235CA36FC();
      v15 = sub_235CA3930();
      if (os_log_type_enabled(v14, v15))
      {
        v16 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v16 = 0;
        _os_log_impl(&dword_235C5E000, v14, v15, "SpeechRecognizerResponseHandler is nil, unable to submit cached partials", v16, 2u);
        MEMORY[0x23B7DE144](v16, -1, -1);
      }
    }

  }
}

void sub_235C84894(void *a1)
{
  uint64_t v2;
  void (*v3)(_QWORD, _QWORD, _QWORD);
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
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  NSObject *v29;
  os_log_type_t v30;
  _BOOL4 v31;
  uint64_t v32;
  uint8_t *v33;
  id v34;
  _QWORD *v35;
  uint8_t *v36;
  uint8_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t, uint64_t);
  int v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint8_t *v48;
  void (*v49)(char *, _QWORD, uint64_t);
  void (*v50)(char *, uint64_t, uint64_t);
  char *v51;
  char v52;
  char *v53;
  void (*v54)(char *, uint64_t);
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  _QWORD *v62;
  _BOOL8 v63;
  uint64_t v64;
  void (*v65)(uint64_t, _BOOL8);
  _QWORD *v66;
  NSObject *v67;
  os_log_type_t v68;
  uint8_t *v69;
  uint64_t v70;
  char *v71;
  uint64_t v72;
  void (*v73)(char *, uint64_t);
  char *v74;
  char v75;
  void (*v76)(char *, uint64_t);
  uint64_t v77;
  _QWORD *v78;
  char *v79;
  uint64_t v80;
  char *v81;
  char *v82;
  uint64_t v83;
  char *v84;
  uint8_t *v85;
  void (*v86)(_QWORD, _QWORD, _QWORD);
  id v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  char *v91;
  uint64_t v92;
  id v93;

  v2 = sub_235CA3420();
  v3 = *(void (**)(_QWORD, _QWORD, _QWORD))(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v84 = (char *)&v77 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542990A0);
  v6 = MEMORY[0x24BDAC7A8](v5);
  v88 = (uint64_t)&v77 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v89 = (uint64_t)&v77 - v9;
  MEMORY[0x24BDAC7A8](v8);
  v91 = (char *)&v77 - v10;
  v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254299088);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v77 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x24BDAC7A8](v12);
  v82 = (char *)&v77 - v16;
  v17 = MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v77 - v18;
  v20 = MEMORY[0x24BDAC7A8](v17);
  v22 = (char *)&v77 - v21;
  v23 = MEMORY[0x24BDAC7A8](v20);
  v83 = (uint64_t)&v77 - v24;
  MEMORY[0x24BDAC7A8](v23);
  v90 = (uint64_t)&v77 - v25;
  if (qword_2542992E8 != -1)
    swift_once();
  v26 = sub_235CA3708();
  v27 = __swift_project_value_buffer(v26, (uint64_t)qword_254299660);
  v28 = a1;
  v80 = v27;
  v29 = sub_235CA36FC();
  v30 = sub_235CA3924();
  v31 = os_log_type_enabled(v29, v30);
  v79 = v14;
  v87 = v28;
  v81 = v19;
  if (v31)
  {
    v32 = swift_slowAlloc();
    v86 = v3;
    v33 = (uint8_t *)v32;
    v78 = (_QWORD *)swift_slowAlloc();
    v85 = v33;
    *(_DWORD *)v33 = 138412290;
    v93 = v28;
    v34 = v28;
    sub_235CA3A14();
    v35 = v78;
    *v78 = v28;

    v36 = v85;
    _os_log_impl(&dword_235C5E000, v29, v30, "AsrRequestProcessor received message: %@", v85, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254299410);
    swift_arrayDestroy();
    MEMORY[0x23B7DE144](v35, -1, -1);
    v37 = v36;
    v3 = v86;
    MEMORY[0x23B7DE144](v37, -1, -1);

  }
  else
  {

  }
  v38 = v92 + qword_2542994F0;
  swift_beginAccess();
  v39 = *MEMORY[0x24BE9AEF8];
  v40 = v90;
  v86 = (void (*)(_QWORD, _QWORD, _QWORD))*((_QWORD *)v3 + 13);
  v86(v90, v39, v2);
  v85 = (uint8_t *)*((_QWORD *)v3 + 7);
  ((void (*)(uint64_t, _QWORD, uint64_t, uint64_t))v85)(v40, 0, 1, v2);
  v41 = (uint64_t)v91;
  v42 = (uint64_t)&v91[*(int *)(v5 + 48)];
  sub_235C8BA84(v38, (uint64_t)v91);
  sub_235C8BA84(v40, v42);
  v43 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))*((_QWORD *)v3 + 6);
  v44 = v43(v41, 1, v2);
  v45 = v89;
  if (v44 == 1)
  {
    sub_235C76BD8(v40, (uint64_t *)&unk_254299088);
    if (v43(v42, 1, v2) == 1)
    {
      v46 = (uint64_t)v91;
LABEL_23:
      sub_235C76BD8(v46, (uint64_t *)&unk_254299088);
      goto LABEL_24;
    }
    goto LABEL_11;
  }
  v78 = (_QWORD *)v38;
  v47 = v83;
  sub_235C8BA84(v41, v83);
  if (v43(v42, 1, v2) == 1)
  {
    sub_235C76BD8(v90, (uint64_t *)&unk_254299088);
    (*((void (**)(uint64_t, uint64_t))v3 + 1))(v47, v2);
    v38 = (uint64_t)v78;
LABEL_11:
    sub_235C76BD8((uint64_t)v91, &qword_2542990A0);
    v48 = v85;
    v49 = (void (*)(char *, _QWORD, uint64_t))v86;
    v86(v22, *MEMORY[0x24BE9AF18], v2);
    goto LABEL_14;
  }
  v50 = (void (*)(char *, uint64_t, uint64_t))*((_QWORD *)v3 + 4);
  v77 = v5;
  v51 = v84;
  v50(v84, v42, v2);
  sub_235C69C18(&qword_254299080, (uint64_t (*)(uint64_t))MEMORY[0x24BE9AF20], MEMORY[0x24BE9AF30]);
  v52 = sub_235CA37D4();
  v53 = v22;
  v54 = (void (*)(char *, uint64_t))*((_QWORD *)v3 + 1);
  v54(v51, v2);
  sub_235C76BD8(v90, (uint64_t *)&unk_254299088);
  v54((char *)v47, v2);
  v22 = v53;
  v45 = v89;
  v5 = v77;
  sub_235C76BD8(v41, (uint64_t *)&unk_254299088);
  v48 = v85;
  v49 = (void (*)(char *, _QWORD, uint64_t))v86;
  v38 = (uint64_t)v78;
  if ((v52 & 1) == 0)
  {
    v86(v22, *MEMORY[0x24BE9AF18], v2);
LABEL_14:
    ((void (*)(char *, _QWORD, uint64_t, uint64_t))v48)(v22, 0, 1, v2);
    v55 = v45 + *(int *)(v5 + 48);
    sub_235C8BA84(v38, v45);
    sub_235C8BA84((uint64_t)v22, v55);
    if (v43(v45, 1, v2) == 1)
    {
      sub_235C76BD8((uint64_t)v22, (uint64_t *)&unk_254299088);
      if (v43(v55, 1, v2) == 1)
      {
        v46 = v45;
        goto LABEL_23;
      }
    }
    else
    {
      v91 = v22;
      v56 = (uint64_t)v81;
      sub_235C8BA84(v45, (uint64_t)v81);
      if (v43(v55, 1, v2) != 1)
      {
        v71 = v84;
        (*((void (**)(char *, uint64_t, uint64_t))v3 + 4))(v84, v55, v2);
        sub_235C69C18(&qword_254299080, (uint64_t (*)(uint64_t))MEMORY[0x24BE9AF20], MEMORY[0x24BE9AF30]);
        LODWORD(v90) = sub_235CA37D4();
        v72 = v5;
        v73 = (void (*)(char *, uint64_t))*((_QWORD *)v3 + 1);
        v73(v71, v2);
        sub_235C76BD8((uint64_t)v91, (uint64_t *)&unk_254299088);
        v73((char *)v56, v2);
        v5 = v72;
        sub_235C76BD8(v89, (uint64_t *)&unk_254299088);
        if ((v90 & 1) != 0)
          goto LABEL_24;
LABEL_20:
        v57 = v5;
        v58 = (uint64_t)v82;
        v49(v82, *MEMORY[0x24BE9AED0], v2);
        ((void (*)(uint64_t, _QWORD, uint64_t, uint64_t))v48)(v58, 0, 1, v2);
        v59 = v88;
        v60 = v88 + *(int *)(v57 + 48);
        sub_235C8BA84(v38, v88);
        sub_235C8BA84(v58, v60);
        if (v43(v59, 1, v2) == 1)
        {
          sub_235C76BD8(v58, (uint64_t *)&unk_254299088);
          if (v43(v60, 1, v2) == 1)
          {
            v46 = v88;
            goto LABEL_23;
          }
        }
        else
        {
          v70 = (uint64_t)v79;
          sub_235C8BA84(v88, (uint64_t)v79);
          if (v43(v60, 1, v2) != 1)
          {
            v74 = v84;
            (*((void (**)(char *, uint64_t, uint64_t))v3 + 4))(v84, v60, v2);
            sub_235C69C18(&qword_254299080, (uint64_t (*)(uint64_t))MEMORY[0x24BE9AF20], MEMORY[0x24BE9AF30]);
            v75 = sub_235CA37D4();
            v76 = (void (*)(char *, uint64_t))*((_QWORD *)v3 + 1);
            v76(v74, v2);
            sub_235C76BD8(v58, (uint64_t *)&unk_254299088);
            v76((char *)v70, v2);
            sub_235C76BD8(v88, (uint64_t *)&unk_254299088);
            if ((v75 & 1) == 0)
              return;
            goto LABEL_24;
          }
          sub_235C76BD8(v58, (uint64_t *)&unk_254299088);
          (*((void (**)(uint64_t, uint64_t))v3 + 1))(v70, v2);
        }
        sub_235C76BD8(v88, &qword_2542990A0);
        return;
      }
      sub_235C76BD8((uint64_t)v91, (uint64_t *)&unk_254299088);
      (*((void (**)(uint64_t, uint64_t))v3 + 1))(v56, v2);
    }
    sub_235C76BD8(v45, &qword_2542990A0);
    goto LABEL_20;
  }
LABEL_24:
  if ((*(_BYTE *)(v92 + qword_2542994E8) & 1) == 0)
  {
    sub_235CA3378();
    sub_235C71A48();
    swift_bridgeObjectRelease();
  }
  sub_235CA294C();
  v61 = swift_dynamicCastClass();
  v62 = *(_QWORD **)(v92 + qword_2542994F8);
  if (v62)
  {
    v63 = v61 != 0;
    v64 = *(_QWORD *)(v92 + qword_2542991A0);
    v65 = *(void (**)(uint64_t, _BOOL8))((*MEMORY[0x24BEE4EA0] & *v62) + 0xB8);
    v66 = v62;
    v65(v64, v63);

  }
  else
  {
    v67 = sub_235CA36FC();
    v68 = sub_235CA3930();
    if (os_log_type_enabled(v67, v68))
    {
      v69 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v69 = 0;
      _os_log_impl(&dword_235C5E000, v67, v68, "SpeechRecognizerResponseHandler is nil, will not be able to stop ASR.", v69, 2u);
      MEMORY[0x23B7DE144](v69, -1, -1);
    }

  }
}

uint64_t sub_235C85238@<X0>(uint64_t *a1@<X8>)
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
  char *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  void (*v19)(unint64_t, uint64_t, uint64_t);
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  uint64_t v25;
  void (*v26)(char *, uint64_t);
  uint64_t v27;
  unint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  os_log_type_t v34;
  uint64_t v35;
  uint8_t *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint8_t *v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  char v49;
  uint64_t v50;
  uint64_t v51;
  int v52;
  uint64_t v53;
  uint64_t v54;
  char v55;
  char v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  NSObject *v60;
  os_log_type_t v61;
  uint8_t *v62;
  uint64_t v63;
  uint64_t result;
  uint64_t *v65;
  uint8_t *v66;
  void (*v67)(unint64_t, uint64_t, uint64_t);
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void (*v71)(uint64_t, uint64_t);
  uint64_t v72;
  char *v73;
  uint64_t *v74;
  char *v75;
  uint64_t v76;
  __int128 v77;
  __int128 v78;

  v2 = v1;
  v74 = a1;
  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254299060);
  MEMORY[0x24BDAC7A8](v3);
  v75 = (char *)&v66 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_235CA3438();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v73 = (char *)&v66 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v71 = (void (*)(uint64_t, uint64_t))((char *)&v66 - v10);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v66 - v11;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254299458);
  v13 = *(_QWORD *)(v6 + 72);
  v14 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v15 = 2 * v13;
  v16 = swift_allocObject();
  *(_OWORD *)(v16 + 16) = xmmword_235CA4410;
  v17 = v16 + v14;
  v18 = *MEMORY[0x24BE9B350];
  v19 = *(void (**)(unint64_t, uint64_t, uint64_t))(v6 + 104);
  v19(v17, v18, v5);
  v20 = v17 + v13;
  v21 = *MEMORY[0x24BE9B328];
  v19(v20, v21, v5);
  LODWORD(v72) = *MEMORY[0x24BE9B348];
  ((void (*)(unint64_t))v19)(v17 + v15);
  v70 = v2;
  v22 = sub_235C8794C(v16);
  swift_bridgeObjectRelease();
  v19((unint64_t)v12, v18, v5);
  if (*(_QWORD *)(v22 + 16) && (v23 = sub_235C9BBC8((uint64_t)v12), (v24 & 1) != 0))
  {
    sub_235C76B10(*(_QWORD *)(v22 + 56) + 32 * v23, (uint64_t)&v77);
  }
  else
  {
    v77 = 0u;
    v78 = 0u;
  }
  v25 = (uint64_t)v71;
  v26 = *(void (**)(char *, uint64_t))(v6 + 8);
  v26(v12, v5);
  if (*((_QWORD *)&v78 + 1))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2542989D8);
    if (swift_dynamicCast())
      v27 = v76;
    else
      v27 = 0;
  }
  else
  {
    sub_235C76BD8((uint64_t)&v77, &qword_2542994B0);
    v27 = 0;
  }
  v19(v25, v21, v5);
  if (*(_QWORD *)(v22 + 16) && (v28 = sub_235C9BBC8(v25), (v29 & 1) != 0))
  {
    sub_235C76B10(*(_QWORD *)(v22 + 56) + 32 * v28, (uint64_t)&v77);
  }
  else
  {
    v77 = 0u;
    v78 = 0u;
  }
  v26((char *)v25, v5);
  if (*((_QWORD *)&v78 + 1))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2542989F0);
    if (swift_dynamicCast())
    {
      v30 = v76;
      goto LABEL_19;
    }
  }
  else
  {
    sub_235C76BD8((uint64_t)&v77, &qword_2542994B0);
  }
  v30 = MEMORY[0x24BEE4AF8];
LABEL_19:
  v71 = (void (*)(uint64_t, uint64_t))v26;
  if (qword_2542992E8 != -1)
    swift_once();
  v31 = sub_235CA3708();
  v32 = __swift_project_value_buffer(v31, (uint64_t)qword_254299660);
  swift_bridgeObjectRetain_n();
  v69 = v32;
  v33 = sub_235CA36FC();
  v34 = sub_235CA3924();
  if (os_log_type_enabled(v33, v34))
  {
    v35 = swift_slowAlloc();
    v68 = v27;
    v36 = (uint8_t *)v35;
    v37 = swift_slowAlloc();
    v67 = v19;
    v38 = v37;
    *(_QWORD *)&v77 = v37;
    *(_DWORD *)v36 = 136315138;
    v66 = v36 + 4;
    v39 = swift_bridgeObjectRetain();
    v40 = MEMORY[0x23B7DD970](v39, MEMORY[0x24BEE0D00]);
    v41 = v22;
    v43 = v42;
    swift_bridgeObjectRelease();
    v76 = sub_235C944B8(v40, v43, (uint64_t *)&v77);
    sub_235CA3A14();
    swift_bridgeObjectRelease_n();
    v22 = v41;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_235C5E000, v33, v34, "displayHintsFromSession: %s", v36, 0xCu);
    swift_arrayDestroy();
    v44 = v38;
    v19 = v67;
    MEMORY[0x23B7DE144](v44, -1, -1);
    v45 = v36;
    v27 = v68;
    MEMORY[0x23B7DE144](v45, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v46 = (uint64_t)v75;
  v47 = (uint64_t)v73;
  v19((unint64_t)v73, v72, v5);
  if (*(_QWORD *)(v22 + 16) && (v48 = sub_235C9BBC8(v47), (v49 & 1) != 0))
  {
    sub_235C76B10(*(_QWORD *)(v22 + 56) + 32 * v48, (uint64_t)&v77);
  }
  else
  {
    v77 = 0u;
    v78 = 0u;
  }
  v50 = v70;
  swift_bridgeObjectRelease();
  v71(v47, v5);
  if (*((_QWORD *)&v78 + 1))
  {
    v51 = sub_235CA2844();
    v52 = swift_dynamicCast();
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v51 - 8) + 56))(v46, v52 ^ 1u, 1, v51);
  }
  else
  {
    sub_235C76BD8((uint64_t)&v77, &qword_2542994B0);
    v53 = sub_235CA2844();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v53 - 8) + 56))(v46, 1, 1, v53);
  }
  v54 = sub_235C749B4(v27, v46);
  v55 = objc_msgSend((id)objc_opt_self(), sel_isDictationAutoPunctuationEnabled);
  v56 = sub_235C75920(v27, v55);
  v57 = sub_235C754DC(v27);
  v59 = v58;
  if (*(_BYTE *)(v50 + qword_254299180) == 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v60 = sub_235CA36FC();
    v61 = sub_235CA3924();
    if (os_log_type_enabled(v60, v61))
    {
      v62 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v62 = 0;
      _os_log_impl(&dword_235C5E000, v60, v61, "Sending empty JITLME for MUX enabled device for improving ASR performance.", v62, 2u);
      MEMORY[0x23B7DE144](v62, -1, -1);
    }

    v63 = MEMORY[0x24BEE4AF8];
  }
  else
  {
    sub_235CA35DC();
    *(_QWORD *)&v77 = v27;
    *((_QWORD *)&v77 + 1) = v30;
    sub_235C8BB6C();
    v72 = v54;
    v73 = (char *)v57;
    sub_235C8BBB0();
    sub_235C8BBF4();
    sub_235C8BC38();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v46 = (uint64_t)v75;
    sub_235CA27A8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    v54 = v72;
    v57 = (uint64_t)v73;
    swift_bridgeObjectRelease_n();
    v63 = v76;
  }
  result = sub_235C76BD8(v46, (uint64_t *)&unk_254299060);
  v65 = v74;
  *v74 = v54;
  *((_BYTE *)v65 + 8) = v56 & 1;
  v65[2] = v63;
  v65[3] = v57;
  v65[4] = v59;
  return result;
}

id sub_235C8599C(uint64_t a1, char a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  NSObject *v19;
  void *v20;
  id v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  void *v33;
  uint64_t v34;
  NSObject *v35;
  NSObject *v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  char v40;
  unint64_t v41;
  unint64_t v42;
  int v43;
  uint64_t v44;
  NSObject *v45;
  os_log_type_t v46;
  uint8_t *v47;
  NSObject *v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  id v56;
  void *v57;
  uint64_t v58;
  double v59;
  double v60;
  id v61;
  void *v62;
  uint64_t v63;
  id v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  id v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  id v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  id v79;
  void *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  char v84;
  id v85;
  id v86;
  uint64_t v88;
  unsigned int v89;
  unsigned int v90;
  uint64_t v91;
  unint64_t v92;
  unsigned int v93;
  unsigned int v94;
  unsigned int v95;
  unsigned int v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  os_log_t v103;
  unint64_t v104;
  uint64_t v105;
  unint64_t v106;
  unint64_t v107;
  uint64_t v108[5];
  __int128 v109;
  __int128 v110;

  v4 = sub_235CA2748();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v98 = (uint64_t)&v88 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563779A8);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v88 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v88 - v11;
  v102 = a1;
  v13 = (void *)sub_235CA30FC();
  v14 = objc_msgSend((id)objc_opt_self(), sel_sharedPreferences);
  v15 = objc_msgSend(v14, sel_offlineDictationStatus);

  v16 = sub_235CA3798();
  if ((a2 & 1) != 0)
  {
    v17 = v105 + qword_2542991D0;
    v18 = *(_QWORD *)(v105 + qword_2542991D0 + 8);
    if (v18)
    {
      v19 = *(NSObject **)v17;
      swift_bridgeObjectRetain();
      v103 = v19;
      v20 = (void *)sub_235CA37E0();
      v21 = (id)_AFPreferencesReplacementLanguageForLocalRecognizerLanguageCode();

      if (v21)
      {
        v101 = sub_235CA37EC();
        v23 = v22;

        if (qword_2542992E8 != -1)
          swift_once();
        v24 = sub_235CA3708();
        __swift_project_value_buffer(v24, (uint64_t)qword_254299660);
        swift_bridgeObjectRetain_n();
        swift_bridgeObjectRetain();
        v25 = sub_235CA36FC();
        v26 = sub_235CA3924();
        LODWORD(v100) = v26;
        if (os_log_type_enabled(v25, v26))
        {
          v27 = swift_slowAlloc();
          v104 = v23;
          v28 = v27;
          v99 = swift_slowAlloc();
          v108[0] = v99;
          *(_DWORD *)v28 = 136315394;
          v97 = v28 + 4;
          swift_bridgeObjectRetain();
          *(_QWORD *)&v109 = sub_235C944B8((uint64_t)v103, v18, v108);
          v103 = v25;
          sub_235CA3A14();
          swift_bridgeObjectRelease_n();
          *(_WORD *)(v28 + 12) = 2080;
          v97 = v28 + 14;
          swift_bridgeObjectRetain();
          v29 = v101;
          *(_QWORD *)&v109 = sub_235C944B8(v101, v104, v108);
          sub_235CA3A14();
          swift_bridgeObjectRelease_n();
          _os_log_impl(&dword_235C5E000, v103, (os_log_type_t)v100, "Mapped %s to %s", (uint8_t *)v28, 0x16u);
          v30 = v99;
          swift_arrayDestroy();
          MEMORY[0x23B7DE144](v30, -1, -1);
          v31 = v28;
          v23 = v104;
          MEMORY[0x23B7DE144](v31, -1, -1);

        }
        else
        {

          swift_bridgeObjectRelease_n();
          swift_bridgeObjectRelease_n();
          v29 = v101;
        }
        *(_QWORD *)v17 = v29;
        *(_QWORD *)(v17 + 8) = v23;
      }
      swift_bridgeObjectRelease();
    }
  }
  v32 = objc_msgSend(v13, sel_offlineLanguage);
  if (v32)
  {
    v33 = v32;
    v34 = sub_235CA37EC();
    v36 = v35;

  }
  else
  {
    v34 = *(_QWORD *)(v105 + qword_2542991D0);
    v36 = *(NSObject **)(v105 + qword_2542991D0 + 8);
    swift_bridgeObjectRetain();
  }
  if (v36)
    v37 = v34;
  else
    v37 = 0;
  v38 = 0xE000000000000000;
  if (v36)
    v38 = (unint64_t)v36;
  v106 = v37;
  v107 = v38;
  swift_bridgeObjectRetain();
  sub_235CA3A68();
  if (*(_QWORD *)(v16 + 16) && (v39 = sub_235C9BC60((uint64_t)v108), (v40 & 1) != 0))
  {
    sub_235C76B10(*(_QWORD *)(v16 + 56) + 32 * v39, (uint64_t)&v109);
  }
  else
  {
    v109 = 0u;
    v110 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_235C8BAF4((uint64_t)v108);
  if (*((_QWORD *)&v110 + 1))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2563779B0);
    if (swift_dynamicCast())
    {
      v41 = v106;
      goto LABEL_29;
    }
  }
  else
  {
    sub_235C76BD8((uint64_t)&v109, &qword_2542994B0);
  }
  v41 = sub_235C8EF3C(MEMORY[0x24BEE4AF8]);
LABEL_29:
  v42 = sub_235C75230(v13, v41);
  swift_bridgeObjectRelease();
  v43 = *(unsigned __int8 *)(v105 + qword_254299180);
  v103 = v36;
  v104 = v34;
  if (v43 == 1)
  {
    if (qword_2542992E8 != -1)
      swift_once();
    v44 = sub_235CA3708();
    __swift_project_value_buffer(v44, (uint64_t)qword_254299660);
    v45 = sub_235CA36FC();
    v46 = sub_235CA3924();
    if (os_log_type_enabled(v45, v46))
    {
      v47 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v47 = 0;
      _os_log_impl(&dword_235C5E000, v45, v46, "Sending empty JITLME for MUX enabled device for improving ASR performance.", v47, 2u);
      MEMORY[0x23B7DE144](v47, -1, -1);
    }
    v88 = MEMORY[0x24BEE4AF8];
    goto LABEL_37;
  }
  v48 = objc_msgSend(v13, sel_inlineItemList);
  if (v48)
  {
    v45 = v48;
    v88 = sub_235CA38B8();
LABEL_37:

    goto LABEL_38;
  }
  v88 = MEMORY[0x24BEE4AF8];
LABEL_38:
  v49 = sub_235CA3378();
  v100 = v50;
  v101 = v49;
  v51 = objc_msgSend(v13, sel_modelOverrideURL);
  if (v51)
  {
    v52 = v51;
    sub_235CA273C();

    v53 = 0;
  }
  else
  {
    v53 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v10, v53, 1, v4);
  sub_235C8BC7C((uint64_t)v10, (uint64_t)v12, &qword_2563779A8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v12, 1, v4))
  {
    sub_235C76BD8((uint64_t)v12, &qword_2563779A8);
    v105 = 0;
    v99 = 0;
  }
  else
  {
    v54 = v98;
    (*(void (**)(uint64_t, char *, uint64_t))(v5 + 16))(v98, v12, v4);
    sub_235C76BD8((uint64_t)v12, &qword_2563779A8);
    v105 = sub_235CA2730();
    v99 = v55;
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v54, v4);
  }
  v56 = objc_msgSend(v13, sel_applicationName, v88);
  if (v56)
  {
    v57 = v56;
    v98 = sub_235CA37EC();
    v97 = v58;

  }
  else
  {
    v98 = 0;
    v97 = 0;
  }
  v96 = objc_msgSend(v13, sel_detectUtterances);
  v95 = objc_msgSend(v13, sel_continuousListening);
  v94 = objc_msgSend(v13, sel_shouldHandleCapitalization);
  v93 = objc_msgSend(v13, sel_secureOfflineOnly);
  objc_msgSend(v13, sel_maximumRecognitionDuration);
  v60 = v59;
  v61 = objc_msgSend(v13, sel_recognitionOverrides);
  if (v61)
  {
    v62 = v61;
    v63 = sub_235CA3798();

    v92 = sub_235C86458(v63);
    swift_bridgeObjectRelease();
  }
  else
  {
    v92 = 0;
  }
  HIDWORD(v91) = sub_235C7534C(v42);
  LODWORD(v91) = objc_msgSend(v13, sel_emojiRecognition);
  v90 = objc_msgSend(v13, sel_autoPunctuation);
  v89 = objc_msgSend(v13, sel_shouldRecognizeCommands);
  v64 = objc_msgSend(v13, sel_interactionIdentifier);
  if (v64)
  {
    v65 = v64;
    v66 = sub_235CA37EC();
    v68 = v67;

  }
  else
  {
    v66 = 0;
    v68 = 0;
  }
  v102 = v42;
  v69 = objc_msgSend(v13, sel_prefixText);
  if (v69)
  {
    v70 = v69;
    v71 = sub_235CA37EC();
    v73 = v72;

  }
  else
  {
    v71 = 0;
    v73 = 0;
  }
  v74 = objc_msgSend(v13, sel_postfixText);
  if (v74)
  {
    v75 = v74;
    v76 = sub_235CA37EC();
    v78 = v77;

  }
  else
  {
    v76 = 0;
    v78 = 0;
  }
  v79 = objc_msgSend(v13, sel_selectedText);
  if (v79)
  {
    v80 = v79;
    v81 = sub_235CA37EC();
    v83 = v82;

  }
  else
  {
    v81 = 0;
    v83 = 0;
  }
  v84 = objc_msgSend(v13, sel_shouldGenerateVoiceCommandCandidates);
  v85 = objc_allocWithZone(MEMORY[0x24BE60890]);
  v86 = sub_235C88E00(v60, v101, v100, 0, 0xE000000000000000, v102, 0, 0, v88, v105, v99, v98, v97, v96, v95, v94, v93, v92, *(_WORD *)((_BYTE *)&v91 + 3) & 0x100,
          v91,
          v90,
          v104,
          (uint64_t)v103,
          v89,
          v66,
          v68,
          0,
          v71,
          v73,
          v76,
          v78,
          v81,
          v83,
          0,
          0,
          0,
          0,
          0,
          0,
          v84);

  return v86;
}

unint64_t sub_235C86458(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t result;
  int64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t v10;
  unint64_t v11;
  int64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  char v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;
  int64_t v22;
  uint64_t v23;
  uint64_t v25;
  uint64_t v26;
  _BYTE v27[40];
  _OWORD v28[2];
  _OWORD v29[2];
  uint64_t v30;
  _OWORD v31[2];
  _OWORD v32[2];
  uint64_t v33;

  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2563779B8);
    v1 = (_QWORD *)sub_235CA3B1C();
  }
  else
  {
    v1 = (_QWORD *)MEMORY[0x24BEE4B00];
  }
  v23 = a1 + 64;
  v2 = -1;
  v3 = -1 << *(_BYTE *)(a1 + 32);
  if (-v3 < 64)
    v2 = ~(-1 << -(char)v3);
  v4 = v2 & *(_QWORD *)(a1 + 64);
  v22 = (unint64_t)(63 - v3) >> 6;
  result = swift_bridgeObjectRetain();
  v6 = 0;
  while (1)
  {
    if (v4)
    {
      v10 = (v4 - 1) & v4;
      v11 = __clz(__rbit64(v4)) | (v6 << 6);
      v12 = v6;
    }
    else
    {
      v13 = v6 + 1;
      if (__OFADD__(v6, 1))
        goto LABEL_40;
      if (v13 >= v22)
      {
LABEL_36:
        sub_235C8BB64();
        return (unint64_t)v1;
      }
      v14 = *(_QWORD *)(v23 + 8 * v13);
      v12 = v6 + 1;
      if (!v14)
      {
        v12 = v6 + 2;
        if (v6 + 2 >= v22)
          goto LABEL_36;
        v14 = *(_QWORD *)(v23 + 8 * v12);
        if (!v14)
        {
          v12 = v6 + 3;
          if (v6 + 3 >= v22)
            goto LABEL_36;
          v14 = *(_QWORD *)(v23 + 8 * v12);
          if (!v14)
          {
            v12 = v6 + 4;
            if (v6 + 4 >= v22)
              goto LABEL_36;
            v14 = *(_QWORD *)(v23 + 8 * v12);
            if (!v14)
            {
              v15 = v6 + 5;
              if (v6 + 5 >= v22)
                goto LABEL_36;
              v14 = *(_QWORD *)(v23 + 8 * v15);
              if (!v14)
              {
                while (1)
                {
                  v12 = v15 + 1;
                  if (__OFADD__(v15, 1))
                    goto LABEL_41;
                  if (v12 >= v22)
                    goto LABEL_36;
                  v14 = *(_QWORD *)(v23 + 8 * v12);
                  ++v15;
                  if (v14)
                    goto LABEL_26;
                }
              }
              v12 = v6 + 5;
            }
          }
        }
      }
LABEL_26:
      v10 = (v14 - 1) & v14;
      v11 = __clz(__rbit64(v14)) + (v12 << 6);
    }
    sub_235C8BB28(*(_QWORD *)(a1 + 48) + 40 * v11, (uint64_t)v31);
    sub_235C76B10(*(_QWORD *)(a1 + 56) + 32 * v11, (uint64_t)v32 + 8);
    v29[0] = v32[0];
    v29[1] = v32[1];
    v30 = v33;
    v28[0] = v31[0];
    v28[1] = v31[1];
    sub_235C8BB28((uint64_t)v28, (uint64_t)v27);
    if (!swift_dynamicCast())
    {
      sub_235C76BD8((uint64_t)v28, &qword_2563779C0);
LABEL_35:
      swift_bridgeObjectRelease();
      sub_235C8BB64();
      swift_release();
      return 0;
    }
    sub_235C76B10((uint64_t)v29 + 8, (uint64_t)v27);
    sub_235C76BD8((uint64_t)v28, &qword_2563779C0);
    if ((swift_dynamicCast() & 1) == 0)
    {
      swift_bridgeObjectRelease();
      goto LABEL_35;
    }
    result = sub_235C9BACC(v25, v26);
    if ((v16 & 1) != 0)
    {
      v7 = 16 * result;
      v8 = (uint64_t *)(v1[6] + 16 * result);
      swift_bridgeObjectRelease();
      *v8 = v25;
      v8[1] = v26;
      v9 = (uint64_t *)(v1[7] + v7);
      result = swift_bridgeObjectRelease();
      *v9 = v25;
      v9[1] = v26;
      goto LABEL_8;
    }
    if (v1[2] >= v1[3])
      break;
    *(_QWORD *)((char *)v1 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v17 = (uint64_t *)(v1[6] + 16 * result);
    *v17 = v25;
    v17[1] = v26;
    v18 = (uint64_t *)(v1[7] + 16 * result);
    *v18 = v25;
    v18[1] = v26;
    v19 = v1[2];
    v20 = __OFADD__(v19, 1);
    v21 = v19 + 1;
    if (v20)
      goto LABEL_39;
    v1[2] = v21;
LABEL_8:
    v6 = v12;
    v4 = v10;
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

void sub_235C86820(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
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
  _BYTE *v20;
  uint64_t v21;
  uint64_t v22;
  _BYTE *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _BYTE *v30;
  uint64_t v31;
  _BYTE *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t, uint64_t);
  uint64_t v35;
  unsigned int v36;
  _QWORD *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  os_log_type_t v42;
  uint8_t *v43;
  _BYTE *v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  int v48;
  NSObject *v49;
  os_log_type_t v50;
  _BOOL4 v51;
  uint64_t v52;
  uint8_t *v53;
  _BYTE *v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t v57;
  _BYTE *v58;
  uint64_t v59;
  uint64_t v60;
  _BYTE *v61;
  _QWORD *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t (*v66)(uint64_t, uint64_t, uint64_t);
  int v67;
  uint64_t *v68;
  char v69;
  _BYTE *v70;
  uint64_t v71;
  uint64_t v72;
  unint64_t v73;
  uint64_t v74;
  _BYTE *v75;
  _BYTE *v76;
  void (*v77)(_BYTE *, uint64_t);
  uint64_t v78;
  unsigned __int8 v79;
  unsigned __int8 v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t *v83;
  uint64_t v84;
  id v85;
  uint64_t v86;
  void *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  _BYTE *v91;
  NSObject *v92;
  os_log_type_t v93;
  uint8_t *v94;
  uint64_t v95;
  uint64_t v96;
  unint64_t v97;
  id v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  id v106;
  NSObject *v107;
  os_log_type_t v108;
  uint8_t *v109;
  _BYTE *v110;
  _BYTE *v111;
  uint64_t v112;
  uint64_t v113;
  unint64_t v114;
  _BYTE *v115;
  _BYTE *v116;
  _BYTE v117[4];
  int v118;
  int v119;
  int v120;
  id v121;
  _BYTE *v122;
  _BYTE *v123;
  void (**v124)(_QWORD, _QWORD, _QWORD);
  uint64_t v125;
  uint64_t v126;
  _BYTE *v127;
  _BYTE *v128;
  _BYTE *v129;
  _BYTE *v130;
  _BYTE *v131;
  uint64_t v132;
  uint64_t (*v133)(uint64_t, uint64_t, uint64_t);
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  _BYTE v137[40];
  _BYTE v138[40];
  _QWORD v139[4];
  _BYTE *v140;

  v2 = v1;
  v121 = a1;
  v136 = sub_235CA3708();
  v134 = *(_QWORD *)(v136 - 8);
  v3 = MEMORY[0x24BDAC7A8](v136);
  v122 = &v117[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v3);
  v6 = &v117[-v5];
  v7 = sub_235CA3420();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v123 = &v117[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v126 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542990A0);
  MEMORY[0x24BDAC7A8](v126);
  v129 = &v117[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v125 = sub_235CA3498();
  v124 = *(void (***)(_QWORD, _QWORD, _QWORD))(v125 - 8);
  MEMORY[0x24BDAC7A8](v125);
  v131 = &v117[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v12 = sub_235CA2790();
  v13 = MEMORY[0x24BDAC7A8](v12);
  v15 = &v117[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v13);
  v130 = &v117[-v16];
  v17 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254299088);
  v18 = MEMORY[0x24BDAC7A8](v17);
  v20 = &v117[-((v19 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v21 = MEMORY[0x24BDAC7A8](v18);
  v23 = &v117[-v22];
  v24 = MEMORY[0x24BDAC7A8](v21);
  v128 = &v117[-v25];
  v26 = MEMORY[0x24BDAC7A8](v24);
  v127 = &v117[-v27];
  v28 = MEMORY[0x24BDAC7A8](v26);
  v30 = &v117[-v29];
  MEMORY[0x24BDAC7A8](v28);
  v32 = &v117[-v31];
  v33 = v2 + qword_2542994F0;
  swift_beginAccess();
  v132 = v33;
  sub_235C8BA84(v33, (uint64_t)v32);
  v135 = v8;
  v34 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 48);
  v35 = v7;
  v133 = v34;
  v36 = v34((uint64_t)v32, 1, v7);
  v37 = (_QWORD *)&unk_254299000;
  if (v36 == 1)
    goto LABEL_2;
  sub_235C8BA84((uint64_t)v32, (uint64_t)v30);
  v48 = (*(uint64_t (**)(_BYTE *, uint64_t))(v135 + 88))(v30, v35);
  if (v48 == *MEMORY[0x24BE9AEF8])
    goto LABEL_13;
  if (v48 == *MEMORY[0x24BE9AEE0]
    || v48 == *MEMORY[0x24BE9AEC8]
    || v48 == *MEMORY[0x24BE9AEC0]
    || v48 == *MEMORY[0x24BE9AEE8])
  {
    goto LABEL_2;
  }
  if (v48 == *MEMORY[0x24BE9AED8])
  {
LABEL_13:
    sub_235C76BD8((uint64_t)v32, (uint64_t *)&unk_254299088);
    if (qword_2542992E8 != -1)
      swift_once();
    __swift_project_value_buffer(v136, (uint64_t)qword_254299660);
    swift_retain_n();
    v49 = sub_235CA36FC();
    v50 = sub_235CA3924();
    v51 = os_log_type_enabled(v49, v50);
    v52 = (uint64_t)v128;
    if (v51)
    {
      v53 = (uint8_t *)swift_slowAlloc();
      v54 = (_BYTE *)swift_slowAlloc();
      v140 = v54;
      *(_DWORD *)v53 = 136315138;
      v55 = sub_235CA35DC();
      v139[0] = sub_235C944B8(v55, v56, (uint64_t *)&v140);
      sub_235CA3A14();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_235C5E000, v49, v50, "Setting speech client delegate for requestId = %s", v53, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B7DE144](v54, -1, -1);
      MEMORY[0x23B7DE144](v53, -1, -1);

    }
    else
    {

      swift_release_n();
    }
    v57 = (uint64_t)v129;
    v58 = v127;
    sub_235CA35E8();
    v136 = sub_235CA35AC();
    v134 = v59;
    v60 = sub_235CA35DC();
    v127 = v61;
    ((void (**)(_BYTE *, uint64_t, uint64_t))v124)[2](v131, v2 + qword_254299518, v125);
    sub_235C71390(v2 + qword_2542991E8, (uint64_t)&v140);
    v125 = sub_235CA35C4();
    sub_235C71390(v2 + qword_2542991B0, (uint64_t)v139);
    sub_235C71390(v2 + qword_254299190, (uint64_t)v138);
    sub_235C71390(v2 + qword_2542991F8, (uint64_t)v137);
    v124 = (void (**)(_QWORD, _QWORD, _QWORD))sub_235CA35B8();
    v62 = *(_QWORD **)(v2 + qword_254299208);
    v63 = *(_QWORD *)(v2 + qword_254299160);
    LODWORD(v122) = *(unsigned __int8 *)(v2 + qword_254299178);
    LODWORD(v121) = *(unsigned __int8 *)(v2 + qword_254299180);
    v120 = *(unsigned __int8 *)(v2 + qword_2542991B8);
    v119 = *(unsigned __int8 *)(v2 + qword_2542994D0);
    v118 = *(unsigned __int8 *)(v2 + qword_254299168);
    v64 = v135;
    (*(void (**)(_BYTE *, _QWORD, uint64_t))(v135 + 104))(v58, *MEMORY[0x24BE9AED8], v35);
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v64 + 56))(v58, 0, 1, v35);
    v65 = v57 + *(int *)(v126 + 48);
    sub_235C8BA84(v132, v57);
    sub_235C8BA84((uint64_t)v58, v65);
    v66 = v133;
    if (v133(v57, 1, v35) == 1)
    {
      swift_retain();
      swift_bridgeObjectRetain();
      sub_235C76BD8((uint64_t)v58, (uint64_t *)&unk_254299088);
      v67 = v66(v65, 1, v35);
      if (v67 == 1)
        v68 = (uint64_t *)&unk_254299088;
      else
        v68 = &qword_2542990A0;
      if (v67 == 1)
        v69 = -1;
      else
        v69 = 0;
    }
    else
    {
      sub_235C8BA84(v57, v52);
      if (v66(v65, 1, v35) == 1)
      {
        swift_retain();
        swift_bridgeObjectRetain();
        sub_235C76BD8((uint64_t)v58, (uint64_t *)&unk_254299088);
        (*(void (**)(uint64_t, uint64_t))(v135 + 8))(v52, v35);
        v69 = 0;
        v68 = &qword_2542990A0;
      }
      else
      {
        v74 = v135;
        v75 = v123;
        (*(void (**)(_BYTE *, uint64_t, uint64_t))(v135 + 32))(v123, v65, v35);
        sub_235C69C18(&qword_254299080, (uint64_t (*)(uint64_t))MEMORY[0x24BE9AF20], MEMORY[0x24BE9AF30]);
        v133 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v60;
        v76 = v58;
        swift_retain();
        swift_bridgeObjectRetain();
        v69 = sub_235CA37D4();
        v77 = *(void (**)(_BYTE *, uint64_t))(v74 + 8);
        v77(v75, v35);
        v68 = (uint64_t *)&unk_254299088;
        v78 = (uint64_t)v76;
        v60 = (uint64_t)v133;
        sub_235C76BD8(v78, (uint64_t *)&unk_254299088);
        v77((_BYTE *)v52, v35);
        v57 = (uint64_t)v129;
      }
    }
    sub_235C76BD8(v57, v68);
    v79 = *(_BYTE *)(v2 + qword_254299508);
    v80 = *(_BYTE *)(v2 + qword_254299510);
    AFDeviceSupportsSAE();
    v81 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v139, v139[3]);
    MEMORY[0x24BDAC7A8](v81);
    v83 = (uint64_t *)&v117[-((v82 + 15) & 0xFFFFFFFFFFFFFFF0)];
    (*(void (**)(uint64_t *))(v84 + 16))(v83);
    v85 = sub_235C89BEC((uint64_t)v130, v136, v134, v60, (unint64_t)v127, (uint64_t)v131, (uint64_t)&v140, v125, *v83, (uint64_t)v138, (uint64_t)v137, v124, v62, v63, v122, v121, v120, v119, v118,
            v69 & 1,
            v79,
            v80);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v139);
    v37 = &unk_254299000;
    goto LABEL_32;
  }
  if (v48 == *MEMORY[0x24BE9AF08] || v48 == *MEMORY[0x24BE9AEF0])
  {
LABEL_2:
    sub_235C76BD8((uint64_t)v32, (uint64_t *)&unk_254299088);
    if (qword_2542992E8 != -1)
      swift_once();
    v38 = v136;
    v39 = __swift_project_value_buffer(v136, (uint64_t)qword_254299660);
    v40 = v134;
    (*(void (**)(_BYTE *, uint64_t, uint64_t))(v134 + 16))(v6, v39, v38);
    swift_retain_n();
    v41 = sub_235CA36FC();
    v42 = sub_235CA3924();
    if (os_log_type_enabled(v41, v42))
    {
      v43 = (uint8_t *)swift_slowAlloc();
      v44 = (_BYTE *)swift_slowAlloc();
      v140 = v44;
      *(_DWORD *)v43 = 136315138;
      sub_235C8BA84(v132, (uint64_t)v23);
      v45 = v35;
      if (v133((uint64_t)v23, 1, v35))
      {
        v46 = 7104878;
        sub_235C76BD8((uint64_t)v23, (uint64_t *)&unk_254299088);
        v47 = 0xE300000000000000;
      }
      else
      {
        v70 = v123;
        (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v135 + 16))(v123, v23, v45);
        sub_235C76BD8((uint64_t)v23, (uint64_t *)&unk_254299088);
        v71 = sub_235CA3414();
        v72 = v45;
        v46 = v71;
        v47 = v73;
        (*(void (**)(_BYTE *, uint64_t))(v135 + 8))(v70, v72);
      }
      v139[0] = sub_235C944B8(v46, v47, (uint64_t *)&v140);
      sub_235CA3A14();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_235C5E000, v41, v42, "Not setting LocalSpeechRecognizerClientDelegate for requestType %s", v43, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B7DE144](v44, -1, -1);
      MEMORY[0x23B7DE144](v43, -1, -1);

      (*(void (**)(_BYTE *, uint64_t))(v134 + 8))(v6, v136);
      v37 = (_QWORD *)&unk_254299000;
    }
    else
    {

      swift_release_n();
      (*(void (**)(_BYTE *, uint64_t))(v40 + 8))(v6, v38);
    }
    goto LABEL_33;
  }
  if (v48 != *MEMORY[0x24BE9AF18] && v48 != *MEMORY[0x24BE9AED0])
  {
    v131 = *(_BYTE **)(v135 + 8);
    ((void (*)(_BYTE *, uint64_t))v131)(v30, v35);
    if (qword_2542992E8 != -1)
      swift_once();
    v88 = v136;
    v89 = __swift_project_value_buffer(v136, (uint64_t)qword_254299660);
    v90 = v134;
    v91 = v122;
    (*(void (**)(_BYTE *, uint64_t, uint64_t))(v134 + 16))(v122, v89, v88);
    swift_retain_n();
    v92 = sub_235CA36FC();
    v93 = sub_235CA3924();
    if (os_log_type_enabled(v92, v93))
    {
      v94 = (uint8_t *)swift_slowAlloc();
      v130 = (_BYTE *)swift_slowAlloc();
      v140 = v130;
      *(_DWORD *)v94 = 136315138;
      sub_235C8BA84(v132, (uint64_t)v20);
      v95 = v35;
      if (v133((uint64_t)v20, 1, v35))
      {
        v96 = 7104878;
        sub_235C76BD8((uint64_t)v20, (uint64_t *)&unk_254299088);
        v97 = 0xE300000000000000;
      }
      else
      {
        v111 = v123;
        (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v135 + 16))(v123, v20, v95);
        sub_235C76BD8((uint64_t)v20, (uint64_t *)&unk_254299088);
        v112 = sub_235CA3414();
        v113 = v95;
        v96 = v112;
        v97 = v114;
        ((void (*)(_BYTE *, uint64_t))v131)(v111, v113);
      }
      v115 = v122;
      v139[0] = sub_235C944B8(v96, v97, (uint64_t *)&v140);
      sub_235CA3A14();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_235C5E000, v92, v93, "Not setting LocalSpeechRecognizerClientDelegate for requestType %s", v94, 0xCu);
      v116 = v130;
      swift_arrayDestroy();
      MEMORY[0x23B7DE144](v116, -1, -1);
      MEMORY[0x23B7DE144](v94, -1, -1);

      (*(void (**)(_BYTE *, uint64_t))(v134 + 8))(v115, v136);
      v37 = (_QWORD *)&unk_254299000;
    }
    else
    {

      swift_release_n();
      (*(void (**)(_BYTE *, uint64_t))(v90 + 8))(v91, v88);
    }
    sub_235C76BD8((uint64_t)v32, (uint64_t *)&unk_254299088);
    goto LABEL_33;
  }
  sub_235C76BD8((uint64_t)v32, (uint64_t *)&unk_254299088);
  if (v121)
  {
    v98 = v121;
    sub_235CA35E8();
    v99 = sub_235CA35AC();
    v101 = v100;
    v102 = sub_235CA35DC();
    v104 = v103;
    sub_235C71390(v2 + qword_2542991E8, (uint64_t)&v140);
    v105 = sub_235CA35C4();
    v106 = objc_allocWithZone((Class)type metadata accessor for DictationSpeechRecognizerResponseHandler());
    v85 = sub_235C8DB20(v15, v99, v101, v102, v104, (uint64_t)&v140, v105, v98);

LABEL_32:
    v86 = v37[159];
    v87 = *(void **)(v2 + v86);
    *(_QWORD *)(v2 + v86) = v85;

LABEL_33:
    if (*(_QWORD *)(v2 + v37[159]))
      objc_msgSend(*(id *)(v2 + qword_2542991A0), sel_setLocalSpeechRecognizerClientDelegate_);
    return;
  }
  if (qword_2542992E8 != -1)
    swift_once();
  __swift_project_value_buffer(v136, (uint64_t)qword_254299660);
  v107 = sub_235CA36FC();
  v108 = sub_235CA3930();
  if (os_log_type_enabled(v107, v108))
  {
    v109 = (uint8_t *)swift_slowAlloc();
    v110 = (_BYTE *)swift_slowAlloc();
    v140 = v110;
    *(_DWORD *)v109 = 136315138;
    v139[0] = sub_235C944B8(0xD000000000000028, 0x8000000235CA6110, (uint64_t *)&v140);
    sub_235CA3A14();
    _os_log_impl(&dword_235C5E000, v107, v108, "Unexpected nil dictationOptions when initializing %s", v109, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B7DE144](v110, -1, -1);
    MEMORY[0x23B7DE144](v109, -1, -1);
  }

}

uint64_t sub_235C8794C(uint64_t a1)
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
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  void (*v32)(char *, uint64_t);
  uint64_t v33;
  NSObject *v34;
  os_log_type_t v35;
  _QWORD *v36;
  uint64_t v37;
  uint8_t *v38;
  _QWORD *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  _QWORD *v45;
  uint64_t v46;
  NSObject *v47;
  os_log_type_t v48;
  uint8_t *v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char *v58;
  char *v59;
  _QWORD *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64[4];
  uint64_t v65;

  v3 = sub_235CA3438();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v59 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542989B0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v59 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_235CA3498();
  v11 = *(_QWORD *)(v10 - 8);
  v62 = v10;
  v63 = v11;
  v12 = MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v59 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x24BDAC7A8](v12);
  v17 = (char *)&v59 - v16;
  MEMORY[0x24BDAC7A8](v15);
  if (*(_BYTE *)(v1 + qword_254299180) != 1)
  {
    if (qword_2542992E8 != -1)
      swift_once();
    v33 = sub_235CA3708();
    __swift_project_value_buffer(v33, (uint64_t)qword_254299660);
    swift_retain_n();
    v34 = sub_235CA36FC();
    v35 = sub_235CA3924();
    v36 = &unk_254299000;
    if (os_log_type_enabled(v34, v35))
    {
      v37 = swift_slowAlloc();
      v61 = a1;
      v38 = (uint8_t *)v37;
      v39 = (_QWORD *)swift_slowAlloc();
      v60 = v39;
      *(_DWORD *)v38 = 136315138;
      v64[0] = (uint64_t)v39;
      v59 = (char *)(v38 + 4);
      v40 = v1;
      v20 = v62;
      v41 = v63;
      (*(void (**)(char *, uint64_t, uint64_t))(v63 + 16))(v14, v1 + qword_254299518, v62);
      sub_235C69C18(&qword_2542990B0, (uint64_t (*)(uint64_t))MEMORY[0x24BE9B488], MEMORY[0x24BE9B4B8]);
      v42 = sub_235CA3B64();
      v44 = v43;
      (*(void (**)(char *, uint64_t))(v41 + 8))(v14, v20);
      v65 = sub_235C944B8(v42, v44, v64);
      sub_235CA3A14();
      swift_release_n();
      v36 = (_QWORD *)&unk_254299000;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_235C5E000, v34, v35, "Fetching context for sessionUserId: %s", v38, 0xCu);
      v45 = v60;
      swift_arrayDestroy();
      MEMORY[0x23B7DE144](v45, -1, -1);
      MEMORY[0x23B7DE144](v38, -1, -1);

    }
    else
    {

      swift_release_n();
      v40 = v1;
      v20 = v62;
      v41 = v63;
    }
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v40 + qword_254299190), *(_QWORD *)(v40 + qword_254299190 + 24));
    (*(void (**)(char *, uint64_t, uint64_t))(v41 + 16))(v14, v40 + v36[163], v20);
    goto LABEL_21;
  }
  v61 = a1;
  v19 = *(_QWORD *)(v1 + qword_254299190 + 24);
  v59 = (char *)&v59 - v18;
  v60 = (_QWORD *)(v1 + qword_254299190);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v1 + qword_254299190), v19);
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v6, *MEMORY[0x24BE9B340], v3);
  sub_235CA3450();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  if (!v64[3])
  {
    sub_235C76BD8((uint64_t)v64, &qword_2542994B0);
    v20 = v62;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v63 + 56))(v9, 1, 1, v62);
    goto LABEL_15;
  }
  v20 = v62;
  v21 = swift_dynamicCast();
  v22 = v63;
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v63 + 56))(v9, v21 ^ 1u, 1, v20);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v9, 1, v20) == 1)
  {
LABEL_15:
    sub_235C76BD8((uint64_t)v9, &qword_2542989B0);
    if (qword_2542992E8 != -1)
      swift_once();
    v46 = sub_235CA3708();
    __swift_project_value_buffer(v46, (uint64_t)qword_254299660);
    swift_retain_n();
    v47 = sub_235CA36FC();
    v48 = sub_235CA393C();
    if (os_log_type_enabled(v47, v48))
    {
      v49 = (uint8_t *)swift_slowAlloc();
      v50 = swift_slowAlloc();
      *(_DWORD *)v49 = 136315138;
      v64[0] = v50;
      v59 = (char *)(v49 + 4);
      v62 = v1;
      v41 = v63;
      (*(void (**)(char *, uint64_t, uint64_t))(v63 + 16))(v14, v1 + qword_254299518, v20);
      sub_235C69C18(&qword_2542990B0, (uint64_t (*)(uint64_t))MEMORY[0x24BE9B488], MEMORY[0x24BE9B4B8]);
      v51 = sub_235CA3B64();
      v53 = v52;
      (*(void (**)(char *, uint64_t))(v41 + 8))(v14, v20);
      v65 = sub_235C944B8(v51, v53, v64);
      sub_235CA3A14();
      v54 = v62;
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_235C5E000, v47, v48, "Could not find a previous user in the session because perhaps this is the first request of the session. Fetching context for sessionUserId: %s", v49, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B7DE144](v50, -1, -1);
      MEMORY[0x23B7DE144](v49, -1, -1);

      v55 = v54;
    }
    else
    {

      swift_release_n();
      v55 = v1;
      v41 = v63;
    }
    __swift_project_boxed_opaque_existential_1(v60, v60[3]);
    (*(void (**)(char *, uint64_t, uint64_t))(v41 + 16))(v14, v55 + qword_254299518, v20);
LABEL_21:
    v56 = sub_235CA3468();
    (*(void (**)(char *, uint64_t))(v41 + 8))(v14, v20);
    return v56;
  }
  v23 = v59;
  (*(void (**)(char *, char *, uint64_t))(v22 + 32))(v59, v9, v20);
  if (qword_2542992E8 != -1)
    swift_once();
  v24 = sub_235CA3708();
  __swift_project_value_buffer(v24, (uint64_t)qword_254299660);
  (*(void (**)(char *, char *, uint64_t))(v22 + 16))(v17, v23, v20);
  v25 = sub_235CA36FC();
  v26 = sub_235CA3924();
  if (os_log_type_enabled(v25, v26))
  {
    v27 = (uint8_t *)swift_slowAlloc();
    v28 = swift_slowAlloc();
    v64[0] = v28;
    *(_DWORD *)v27 = 136315138;
    sub_235C69C18(&qword_2542990B0, (uint64_t (*)(uint64_t))MEMORY[0x24BE9B488], MEMORY[0x24BE9B4B8]);
    v29 = sub_235CA3B64();
    v65 = sub_235C944B8(v29, v30, v64);
    sub_235CA3A14();
    swift_bridgeObjectRelease();
    v31 = v20;
    v32 = *(void (**)(char *, uint64_t))(v22 + 8);
    v32(v17, v31);
    _os_log_impl(&dword_235C5E000, v25, v26, "Fetching context for the user selected in previous request: %s", v27, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B7DE144](v28, -1, -1);
    MEMORY[0x23B7DE144](v27, -1, -1);
  }
  else
  {
    v31 = v20;
    v32 = *(void (**)(char *, uint64_t))(v22 + 8);
    v32(v17, v31);
  }

  __swift_project_boxed_opaque_existential_1(v60, v60[3]);
  v58 = v59;
  v56 = sub_235CA3468();
  v32(v58, v31);
  return v56;
}

uint64_t sub_235C881CC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  _BYTE v35[12];
  int v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD v41[5];
  _BYTE v42[24];
  uint64_t v43;
  _BYTE v44[48];

  v3 = sub_235CA3420();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = &v35[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = sub_235CA3498();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = &v35[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v11 = sub_235CA2790();
  MEMORY[0x24BDAC7A8](v11);
  v13 = &v35[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v14 = sub_235CA35AC();
  v39 = v15;
  v40 = v14;
  sub_235CA35E8();
  v16 = sub_235CA35DC();
  v37 = v17;
  v38 = v16;
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v8 + 16))(v10, v1 + qword_254299518, v7);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v4 + 16))(v6, a1, v3);
  sub_235CA35D0();
  v18 = sub_235CA35C4();
  sub_235C71390(v1 + qword_2542991B0, (uint64_t)v42);
  v19 = *(_QWORD **)(v1 + qword_254299208);
  v20 = *(_QWORD *)(v1 + qword_2542994D8);
  v36 = *(unsigned __int8 *)(v1 + qword_254299508);
  swift_retain();
  swift_retain();
  v21 = AFDeviceSupportsMedoc();
  v22 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v42, v43);
  MEMORY[0x24BDAC7A8](v22);
  v24 = (uint64_t *)&v35[-((v23 + 15) & 0xFFFFFFFFFFFFFFF0)];
  (*(void (**)(uint64_t *))(v25 + 16))(v24);
  v26 = *v24;
  v27 = type metadata accessor for MyriadDecisionMonitor();
  v41[3] = v27;
  v41[4] = &off_25070C308;
  v41[0] = v26;
  type metadata accessor for ServerAsrProcessor(0);
  v28 = swift_allocObject();
  v29 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v41, v27);
  MEMORY[0x24BDAC7A8](v29);
  v31 = (uint64_t *)&v35[-((v30 + 15) & 0xFFFFFFFFFFFFFFF0)];
  (*(void (**)(uint64_t *))(v32 + 16))(v31);
  v33 = sub_235C8A0F0(v40, v39, (uint64_t)v13, v38, v37, (uint64_t)v10, (uint64_t)v6, (uint64_t)v44, v18, *v31, 0, v19, v20, v36, v21, v28);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v41);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v42);
  return v33;
}

void sub_235C88498(void *a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  os_log_type_t v8;
  uint8_t *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  NSObject *oslog;

  if (*(_BYTE *)(v1 + qword_254299180) != 1 || *(_BYTE *)(v1 + qword_2542994E8) != 1)
  {
    if (qword_2542992E8 != -1)
      swift_once();
    v7 = sub_235CA3708();
    __swift_project_value_buffer(v7, (uint64_t)qword_254299660);
    oslog = sub_235CA36FC();
    v8 = sub_235CA3930();
    if (!os_log_type_enabled(oslog, v8))
      goto LABEL_12;
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    v10 = "#AsrOnServer ASRBridge should not be handling AsrResultCandidateMessage messages unless both MUX is enabled an"
          "d the request is being handled as asrOnServer";
LABEL_11:
    _os_log_impl(&dword_235C5E000, oslog, v8, v10, v9, 2u);
    MEMORY[0x23B7DE144](v9, -1, -1);
    goto LABEL_12;
  }
  if (!*(_QWORD *)(v1 + qword_2542994E0))
  {
    if (qword_2542992E8 != -1)
      swift_once();
    v16 = sub_235CA3708();
    __swift_project_value_buffer(v16, (uint64_t)qword_254299660);
    oslog = sub_235CA36FC();
    v8 = sub_235CA3930();
    if (!os_log_type_enabled(oslog, v8))
      goto LABEL_12;
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    v10 = "#AsrOnServer serverAsrResultCandidateProcessor is nil. Cannot process AsrResultCandidateMessage";
    goto LABEL_11;
  }
  v2 = *(void **)(v1 + qword_2542994F8);
  if (v2)
  {
    type metadata accessor for AssistantSpeechRecognizerResponseHandler();
    v4 = swift_dynamicCastClass();
    if (v4)
    {
      v5 = *(void **)(v4 + OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_voiceIdScoreCard);
      oslog = v5;
      swift_retain();
      v6 = v2;
      sub_235C7BC0C(a1, v5);
      swift_release();

LABEL_12:
      return;
    }
  }
  v11 = qword_2542992E8;
  swift_retain();
  if (v11 != -1)
    swift_once();
  v12 = sub_235CA3708();
  __swift_project_value_buffer(v12, (uint64_t)qword_254299660);
  v13 = sub_235CA36FC();
  v14 = sub_235CA3930();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v15 = 0;
    _os_log_impl(&dword_235C5E000, v13, v14, "#AsrOnServer Current speechResponseHandler is not for Assistant request", v15, 2u);
    MEMORY[0x23B7DE144](v15, -1, -1);
  }

  swift_release();
}

void sub_235C8876C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  _QWORD *v6;
  void (*v7)(void);
  _QWORD *v8;
  os_log_type_t v9;
  uint8_t *v10;
  NSObject *oslog;

  v1 = v0;
  if (qword_2542992E8 != -1)
    swift_once();
  v2 = sub_235CA3708();
  __swift_project_value_buffer(v2, (uint64_t)qword_254299660);
  v3 = sub_235CA36FC();
  v4 = sub_235CA3924();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_235C5E000, v3, v4, "AsrCandidateRequestProcessor transitioning to being the active request processor", v5, 2u);
    MEMORY[0x23B7DE144](v5, -1, -1);
  }

  v6 = *(_QWORD **)(v0 + qword_2542994F8);
  if (v6)
  {
    v7 = *(void (**)(void))((*MEMORY[0x24BEE4EA0] & *v6) + 0xC0);
    v8 = v6;
    v7();

    *(_BYTE *)(v1 + qword_254299500) = 1;
  }
  else
  {
    oslog = sub_235CA36FC();
    v9 = sub_235CA3930();
    if (os_log_type_enabled(oslog, v9))
    {
      v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_235C5E000, oslog, v9, "SpeechRecognizerResponseHandler is nil, will not be able to submit any cached partials", v10, 2u);
      MEMORY[0x23B7DE144](v10, -1, -1);
    }

  }
}

void sub_235C88918()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void sub_235C88944()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void sub_235C88970()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void sub_235C8899C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_254299098)
  {
    sub_235CA3420();
    v0 = sub_235CA3A08();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_254299098);
  }
}

uint64_t sub_235C889F0()
{
  return type metadata accessor for AsrRequestProcessor();
}

id sub_235C889F8(double a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, char a15, char a16, char a17, uint64_t a18, __int16 a19, char a20,char a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,void *a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39)
{
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char v49;
  char v50;
  char v51;
  char v52;
  char v53;
  char v54;
  void *v55;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v72;
  id v73;
  void *v75;
  void *v76;
  void *v77;

  v69 = (void *)sub_235CA37E0();
  swift_bridgeObjectRelease();
  v68 = (void *)sub_235CA37E0();
  swift_bridgeObjectRelease();
  v67 = (void *)sub_235CA38AC();
  swift_bridgeObjectRelease();
  if (a11)
  {
    v66 = (void *)sub_235CA37E0();
    swift_bridgeObjectRelease();
    v40 = a18;
    if (a13)
      goto LABEL_3;
  }
  else
  {
    v66 = 0;
    v40 = a18;
    if (a13)
    {
LABEL_3:
      v65 = (void *)sub_235CA37E0();
      swift_bridgeObjectRelease();
      v41 = a23;
      if (v40)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  v65 = 0;
  v41 = a23;
  if (v40)
  {
LABEL_4:
    v64 = (void *)sub_235CA378C();
    swift_bridgeObjectRelease();
    v42 = a26;
    if (v41)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  v64 = 0;
  v42 = a26;
  if (v41)
  {
LABEL_5:
    v63 = (void *)sub_235CA37E0();
    swift_bridgeObjectRelease();
    v43 = a27;
    if (v42)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  v63 = 0;
  v43 = a27;
  if (v42)
  {
LABEL_6:
    v62 = (void *)sub_235CA37E0();
    swift_bridgeObjectRelease();
    v44 = a29;
    if (v43)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  v62 = 0;
  v44 = a29;
  if (v43)
  {
LABEL_7:
    sub_235C71624(0, (unint64_t *)&qword_254298A00);
    v61 = (void *)sub_235CA38AC();
    swift_bridgeObjectRelease();
    v45 = a31;
    if (v44)
      goto LABEL_8;
    goto LABEL_17;
  }
LABEL_16:
  v61 = 0;
  v45 = a31;
  if (v44)
  {
LABEL_8:
    v76 = (void *)sub_235CA37E0();
    swift_bridgeObjectRelease();
    v46 = a33;
    if (v45)
      goto LABEL_9;
LABEL_18:
    v77 = 0;
    v47 = a39;
    if (v46)
      goto LABEL_10;
    goto LABEL_19;
  }
LABEL_17:
  v76 = 0;
  v46 = a33;
  if (!v45)
    goto LABEL_18;
LABEL_9:
  v77 = (void *)sub_235CA37E0();
  swift_bridgeObjectRelease();
  v47 = a39;
  if (v46)
  {
LABEL_10:
    v75 = (void *)sub_235CA37E0();
    swift_bridgeObjectRelease();
    goto LABEL_20;
  }
LABEL_19:
  v75 = 0;
LABEL_20:
  v48 = a37;
  v49 = a21;
  v50 = a20;
  v51 = a17;
  v52 = a16;
  v53 = a15;
  v54 = a14;
  if (v47)
  {
    v55 = (void *)sub_235CA37E0();
    swift_bridgeObjectRelease();
    v48 = a37;
    v50 = a20;
    v49 = a21;
    v51 = a17;
    v52 = a16;
    v53 = a15;
    v54 = a14;
  }
  else
  {
    v55 = 0;
  }
  LOBYTE(v60) = a35 & 1;
  LOBYTE(v59) = a24 & 1;
  BYTE3(v58) = v49 & 1;
  BYTE2(v58) = v50 & 1;
  LOWORD(v58) = a19 & 0x101;
  BYTE3(v57) = v51 & 1;
  BYTE2(v57) = v52 & 1;
  BYTE1(v57) = v53 & 1;
  LOBYTE(v57) = v54 & 1;
  v73 = objc_msgSend(v72, sel_initWithRequestId_inputOrigin_speechRecognitionTaskName_speechRecognitionMode_location_jitGrammar_overrideModelPath_applicationName_detectUtterances_continuousListening_shouldHandleCapitalization_secureOfflineOnly_maximumRecognitionDuration_recognitionOverrides_shouldStoreAudioOnDevice_deliverEagerPackage_enableEmojiRecognition_enableAutoPunctuation_UILanguage_enableVoiceCommands_dictationUIInteractionId_sharedUserInfos_prefixText_postfixText_selectedText_powerContext_shouldStartAudioCapture_audioCaptureStartHostTime_audioRecordType_audioRecordDeviceId_, v69, v68, a6, a7, a8, v67, a1, v66, v65, v57, v64, v58, v63, v59, v62, v61, v76,
          v77,
          v75,
          a34,
          v60,
          a36,
          v48,
          v55);

  return v73;
}

id sub_235C88E00(double a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, char a14, char a15, char a16, char a17, uint64_t a18, __int16 a19, char a20,char a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,void *a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40)
{
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char v50;
  char v51;
  char v52;
  char v53;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v71;
  id v72;
  void *v74;
  void *v75;
  void *v76;
  void *v77;

  v68 = (void *)sub_235CA37E0();
  swift_bridgeObjectRelease();
  v67 = (void *)sub_235CA37E0();
  swift_bridgeObjectRelease();
  v66 = (void *)sub_235CA38AC();
  swift_bridgeObjectRelease();
  if (a11)
  {
    v65 = (void *)sub_235CA37E0();
    swift_bridgeObjectRelease();
    v41 = a18;
    if (a13)
      goto LABEL_3;
  }
  else
  {
    v65 = 0;
    v41 = a18;
    if (a13)
    {
LABEL_3:
      v64 = (void *)sub_235CA37E0();
      swift_bridgeObjectRelease();
      v42 = a23;
      if (v41)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  v64 = 0;
  v42 = a23;
  if (v41)
  {
LABEL_4:
    v63 = (void *)sub_235CA378C();
    swift_bridgeObjectRelease();
    v43 = a26;
    if (v42)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  v63 = 0;
  v43 = a26;
  if (v42)
  {
LABEL_5:
    v62 = (void *)sub_235CA37E0();
    swift_bridgeObjectRelease();
    v44 = a27;
    if (v43)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  v62 = 0;
  v44 = a27;
  if (v43)
  {
LABEL_6:
    v61 = (void *)sub_235CA37E0();
    swift_bridgeObjectRelease();
    v45 = a29;
    if (v44)
      goto LABEL_7;
    goto LABEL_16;
  }
LABEL_15:
  v61 = 0;
  v45 = a29;
  if (v44)
  {
LABEL_7:
    sub_235C71624(0, (unint64_t *)&qword_254298A00);
    v60 = (void *)sub_235CA38AC();
    swift_bridgeObjectRelease();
    v46 = a31;
    if (v45)
      goto LABEL_8;
    goto LABEL_17;
  }
LABEL_16:
  v60 = 0;
  v46 = a31;
  if (v45)
  {
LABEL_8:
    v77 = (void *)sub_235CA37E0();
    swift_bridgeObjectRelease();
    v47 = a33;
    if (v46)
      goto LABEL_9;
LABEL_18:
    v76 = 0;
    v48 = a39;
    if (v47)
      goto LABEL_10;
    goto LABEL_19;
  }
LABEL_17:
  v77 = 0;
  v47 = a33;
  if (!v46)
    goto LABEL_18;
LABEL_9:
  v76 = (void *)sub_235CA37E0();
  swift_bridgeObjectRelease();
  v48 = a39;
  if (v47)
  {
LABEL_10:
    v75 = (void *)sub_235CA37E0();
    swift_bridgeObjectRelease();
    goto LABEL_20;
  }
LABEL_19:
  v75 = 0;
LABEL_20:
  v49 = a37;
  v50 = a17;
  v51 = a16;
  v52 = a15;
  v53 = a14;
  if (v48)
  {
    v74 = (void *)sub_235CA37E0();
    swift_bridgeObjectRelease();
    v49 = a37;
    v52 = a15;
    v51 = a16;
    v50 = a17;
    v53 = a14;
  }
  else
  {
    v74 = 0;
  }
  LOBYTE(v59) = a40 & 1;
  LOBYTE(v58) = a35 & 1;
  LOBYTE(v57) = a24 & 1;
  BYTE3(v56) = a21 & 1;
  BYTE2(v56) = a20 & 1;
  LOWORD(v56) = a19 & 0x101;
  BYTE3(v55) = v50 & 1;
  BYTE2(v55) = v51 & 1;
  BYTE1(v55) = v52 & 1;
  LOBYTE(v55) = v53 & 1;
  v72 = objc_msgSend(v71, sel_initWithRequestId_inputOrigin_speechRecognitionTaskName_speechRecognitionMode_location_jitGrammar_overrideModelPath_applicationName_detectUtterances_continuousListening_shouldHandleCapitalization_secureOfflineOnly_maximumRecognitionDuration_recognitionOverrides_shouldStoreAudioOnDevice_deliverEagerPackage_enableEmojiRecognition_enableAutoPunctuation_UILanguage_enableVoiceCommands_dictationUIInteractionId_sharedUserInfos_prefixText_postfixText_selectedText_powerContext_shouldStartAudioCapture_audioCaptureStartHostTime_audioRecordType_audioRecordDeviceId_shouldGenerateVoiceCommandCandidates_, v68, v67, a6, a7, a8, v66, a1, v65, v64, v55, v63, v56, v62, v57, v61, v60, v77,
          v76,
          v75,
          a34,
          v58,
          a36,
          v49,
          v74,
          v59);

  return v72;
}

uint64_t sub_235C89204(uint64_t a1)
{
  uint64_t result;
  _QWORD *v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t i;
  int64_t v12;
  unint64_t v13;
  int64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;
  uint64_t v22;
  int64_t v23;
  uint64_t v24;

  __swift_instantiateConcreteTypeFromMangledName(qword_254299440);
  result = sub_235CA3B04();
  v3 = (_QWORD *)result;
  v4 = 0;
  v24 = a1;
  v5 = *(_QWORD *)(a1 + 64);
  v22 = a1 + 64;
  v6 = 1 << *(_BYTE *)(a1 + 32);
  v7 = -1;
  if (v6 < 64)
    v7 = ~(-1 << v6);
  v8 = v7 & v5;
  v23 = (unint64_t)(v6 + 63) >> 6;
  v9 = result + 64;
  if ((v7 & v5) == 0)
    goto LABEL_5;
LABEL_4:
  v10 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  for (i = v10 | (v4 << 6); ; i = __clz(__rbit64(v13)) + (v4 << 6))
  {
    v15 = (uint64_t *)(*(_QWORD *)(v24 + 48) + 16 * i);
    v17 = *v15;
    v16 = v15[1];
    swift_bridgeObjectRetain();
    result = sub_235CA3918();
    *(_QWORD *)(v9 + ((i >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << i;
    v18 = (_QWORD *)(v3[6] + 16 * i);
    *v18 = v17;
    v18[1] = v16;
    *(_QWORD *)(v3[7] + 8 * i) = result;
    v19 = v3[2];
    v20 = __OFADD__(v19, 1);
    v21 = v19 + 1;
    if (v20)
    {
      __break(1u);
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    v3[2] = v21;
    if (v8)
      goto LABEL_4;
LABEL_5:
    v12 = v4 + 1;
    if (__OFADD__(v4, 1))
      goto LABEL_24;
    if (v12 >= v23)
      return (uint64_t)v3;
    v13 = *(_QWORD *)(v22 + 8 * v12);
    ++v4;
    if (!v13)
    {
      v4 = v12 + 1;
      if (v12 + 1 >= v23)
        return (uint64_t)v3;
      v13 = *(_QWORD *)(v22 + 8 * v4);
      if (!v13)
      {
        v4 = v12 + 2;
        if (v12 + 2 >= v23)
          return (uint64_t)v3;
        v13 = *(_QWORD *)(v22 + 8 * v4);
        if (!v13)
          break;
      }
    }
LABEL_18:
    v8 = (v13 - 1) & v13;
  }
  v14 = v12 + 3;
  if (v14 >= v23)
    return (uint64_t)v3;
  v13 = *(_QWORD *)(v22 + 8 * v14);
  if (v13)
  {
    v4 = v14;
    goto LABEL_18;
  }
  while (1)
  {
    v4 = v14 + 1;
    if (__OFADD__(v14, 1))
      break;
    if (v4 >= v23)
      return (uint64_t)v3;
    v13 = *(_QWORD *)(v22 + 8 * v4);
    ++v14;
    if (v13)
      goto LABEL_18;
  }
LABEL_25:
  __break(1u);
  return result;
}

id sub_235C89404(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, char a15, unsigned __int8 a16, unsigned __int8 a17, unsigned __int8 a18, unsigned __int8 a19, char a20,_QWORD *a21,char a22,unsigned __int8 a23,unsigned __int8 a24,_BYTE *a25)
{
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _BYTE *v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  os_log_type_t v36;
  BOOL v37;
  uint8_t *v38;
  uint64_t v39;
  id v40;
  char *v41;
  uint64_t v42;
  void (*v43)(char *, uint64_t);
  uint64_t v44;
  _QWORD *v45;
  id v46;
  uint64_t v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void (*v52)(char *, uint64_t, uint64_t);
  char *v53;
  char *v54;
  uint64_t v55;
  _QWORD *v56;
  uint64_t v57;
  uint64_t *v58;
  objc_class *v59;
  id v60;
  void (*v61)(char *, uint64_t);
  char *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  uint64_t v67;
  int v68;
  int v69;
  int v70;
  int v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  char *v81;
  uint64_t v82;
  int v83;
  id v84;
  _QWORD *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  objc_super v89;
  __int128 v90[2];
  uint64_t v91[5];
  _QWORD v92[5];

  v79 = a8;
  v82 = a7;
  v88 = a6;
  v75 = a3;
  v74 = a2;
  v86 = a12;
  v87 = a11;
  v28 = sub_235CA2790();
  v78 = *(_QWORD *)(v28 - 8);
  MEMORY[0x24BDAC7A8](v28);
  v77 = (char *)&v67 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = type metadata accessor for MyriadDecisionMonitor();
  *(_QWORD *)&a25[OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_resultSelectedMsg] = 0;
  *(_QWORD *)&a25[OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_voiceIdScoreCard] = 0;
  *(_QWORD *)&a25[OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_speechPartialResultsCache] = MEMORY[0x24BEE4AF8];
  v92[4] = &off_25070C308;
  a25[OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_didStopASR] = 0;
  a25[OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_hasfirstVoiceIdScoreCardArrived] = 0;
  v92[3] = v30;
  v92[0] = a10;
  a25[OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_havePostedSpeechPartialDeliveryStartedMessage] = 0;
  v31 = qword_2542992E8;
  v32 = a25;
  if (v31 != -1)
    swift_once();
  v83 = a16;
  v85 = a21;
  v71 = a19;
  v70 = a18;
  v69 = a17;
  v33 = a14;
  v84 = a13;
  v34 = sub_235CA3708();
  __swift_project_value_buffer(v34, (uint64_t)qword_254299660);
  swift_bridgeObjectRetain_n();
  v35 = sub_235CA36FC();
  v36 = sub_235CA3924();
  v37 = os_log_type_enabled(v35, v36);
  v81 = a1;
  v80 = v28;
  v76 = a4;
  if (v37)
  {
    v73 = a14;
    v38 = (uint8_t *)swift_slowAlloc();
    v39 = swift_slowAlloc();
    v91[0] = v39;
    *(_DWORD *)v38 = 136315138;
    swift_bridgeObjectRetain();
    *(_QWORD *)&v90[0] = sub_235C944B8(a4, a5, v91);
    v33 = v73;
    sub_235CA3A14();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_235C5E000, v35, v36, "Result selection gate in place for requestId=%s", v38, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B7DE144](v39, -1, -1);
    MEMORY[0x23B7DE144](v38, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v68 = a24;
  HIDWORD(v67) = a23;
  *(_QWORD *)&v32[OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_homeMembers] = v33;
  v32[OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_isRMVEnabled] = a15 & 1;
  sub_235C71390((uint64_t)v92, (uint64_t)&v32[OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_myriadMonitor]);
  v40 = v84;
  *(_QWORD *)&v32[OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_requestQueue] = v84;
  v41 = &v32[OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_userId];
  v42 = sub_235CA3498();
  v72 = *(_QWORD *)(v42 - 8);
  v43 = *(void (**)(char *, uint64_t))(v72 + 16);
  v73 = v42;
  v43(v41, v88);
  v32[OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_isMUXEnabled] = v83 & 1;
  v32[OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_isMedocEnabled] = v69 & 1;
  v32[OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_isCandidateRequest] = v70 & 1;
  v32[OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_isFFRequest] = v71 & 1;
  sub_235C71390(v87, (uint64_t)&v32[OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_sessionState]);
  sub_235C71390(v86, (uint64_t)&v32[OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_immutableSessionState]);
  v44 = v82;
  sub_235C71390(v82, (uint64_t)v91);
  v45 = v85;
  if (v85)
  {
    swift_retain();
    v46 = v40;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v91);
    v47 = v76;
  }
  else
  {
    sub_235C71390((uint64_t)v91, (uint64_t)v90);
    swift_bridgeObjectRetain();
    v48 = v40;
    _s9ASRBridge9AsrBridgeC27configuredMaxEagerRCAllowedSivgZ_0();
    v50 = v49;
    type metadata accessor for BufferedResultCandidateHandler();
    v45 = (_QWORD *)swift_allocObject();
    v45[10] = 0;
    v45[11] = sub_235C8EC70(MEMORY[0x24BEE4AF8]);
    v45[12] = 0;
    v47 = v76;
    v45[7] = v76;
    v45[8] = a5;
    sub_235C7131C(v90, (uint64_t)(v45 + 2));
    v45[9] = v50;
    v44 = v82;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v91);
  }
  *(_QWORD *)&v32[OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_bufferedResultCandidateHandler] = v45;
  v32[OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_isUOS] = a20 & 1;
  v32[OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_isIdentityScoreConsumptionEnabled] = a22 & 1;
  v32[OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_isIdentityBridgeInstrumentationEnabled] = BYTE4(v67) & 1;
  v32[OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_isAssistantEngineEnabled] = v68 & 1;

  v51 = v78;
  v52 = *(void (**)(char *, uint64_t, uint64_t))(v78 + 16);
  v53 = v77;
  v54 = v81;
  v55 = v80;
  v52(v77, (uint64_t)v81, v80);
  sub_235C71390(v44, (uint64_t)v90);
  v52(&v32[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_sessionId], (uint64_t)v53, v55);
  v56 = &v32[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_assistantId];
  v57 = v75;
  *v56 = v74;
  v56[1] = v57;
  v58 = (uint64_t *)&v32[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId];
  *v58 = v47;
  v58[1] = a5;
  sub_235C71390((uint64_t)v90, (uint64_t)&v32[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_messagePublisher]);
  *(_QWORD *)&v32[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_serviceHelper] = v79;
  *(_QWORD *)&v32[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_instrumentationUtil] = a9;
  v59 = (objc_class *)type metadata accessor for SpeechRecognizerResponseHandler();
  v89.receiver = v32;
  v89.super_class = v59;
  swift_unknownObjectRetain();
  swift_retain();
  v60 = objc_msgSendSuper2(&v89, sel_init);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v90);
  v61 = *(void (**)(char *, uint64_t))(v51 + 8);
  v61(v53, v55);
  if ((v83 & 1) != 0)
  {
    v62 = (char *)v60;
    v63 = v44;
    v64 = sub_235C68B84();
    swift_unknownObjectRelease();
    swift_release();

    swift_release();
    __swift_destroy_boxed_opaque_existential_1(v86);
    __swift_destroy_boxed_opaque_existential_1(v87);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v92);
    __swift_destroy_boxed_opaque_existential_1(v63);
    (*(void (**)(uint64_t, uint64_t))(v72 + 8))(v88, v73);
    v61(v54, v55);
    v65 = *(void **)&v62[OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_voiceIdScoreCard];
    *(_QWORD *)&v62[OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_voiceIdScoreCard] = v64;

  }
  else
  {
    swift_unknownObjectRelease();
    swift_release();

    swift_release();
    __swift_destroy_boxed_opaque_existential_1(v86);
    __swift_destroy_boxed_opaque_existential_1(v87);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v92);
    __swift_destroy_boxed_opaque_existential_1(v44);
    (*(void (**)(uint64_t, uint64_t))(v72 + 8))(v88, v73);
    v61(v54, v55);
  }
  return v60;
}

id sub_235C89BEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, _QWORD *a13, uint64_t a14, unsigned __int8 a15, unsigned __int8 a16, unsigned __int8 a17, unsigned __int8 a18, unsigned __int8 a19, unsigned __int8 a20,unsigned __int8 a21,unsigned __int8 a22)
{
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  void (*v33)(char *, uint64_t, uint64_t);
  uint64_t v34;
  void (*v35)(char *, uint64_t, uint64_t);
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unsigned __int8 v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  _BYTE *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  id v50;
  uint64_t v52;
  uint64_t v53;
  uint64_t *v54;
  _QWORD *v55;
  int v56;
  int v57;
  int v58;
  int v59;
  int v60;
  int v61;
  int v62;
  void *v63;
  int v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  unint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  _QWORD v80[3];
  uint64_t v81;
  _UNKNOWN **v82;
  _BYTE v83[24];
  _BYTE v84[12];
  _BYTE v85[12];
  uint64_t v86;
  _BYTE v87[8];
  uint64_t v88;
  uint64_t v89;
  _UNKNOWN **v90;

  v75 = a8;
  v74 = a5;
  v72 = a4;
  v71 = a3;
  v69 = a2;
  v56 = a22;
  v57 = a21;
  v58 = a20;
  v59 = a19;
  v60 = a18;
  v61 = a17;
  v62 = a16;
  v64 = a15;
  v65 = a14;
  v55 = a13;
  v63 = a12;
  v70 = a11;
  v67 = a10;
  v25 = sub_235CA3498();
  v26 = *(_QWORD *)(v25 - 8);
  MEMORY[0x24BDAC7A8](v25);
  v28 = (char *)&v52 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = sub_235CA2790();
  v30 = *(_QWORD *)(v29 - 8);
  MEMORY[0x24BDAC7A8](v29);
  v32 = (char *)&v52 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  v89 = type metadata accessor for MyriadDecisionMonitor();
  v90 = &off_25070C308;
  v53 = v89;
  v88 = a9;
  v66 = v30;
  v33 = *(void (**)(char *, uint64_t, uint64_t))(v30 + 16);
  v34 = (uint64_t)v28;
  v79 = a1;
  v68 = v29;
  v33(v32, a1, v29);
  v73 = v26;
  v35 = *(void (**)(char *, uint64_t, uint64_t))(v26 + 16);
  v78 = a6;
  v76 = v25;
  v35(v28, a6, v25);
  v77 = a7;
  sub_235C71390(a7, (uint64_t)v87);
  if (qword_2542990D8 != -1)
    swift_once();
  v36 = qword_2542994C0;
  sub_235C71390((uint64_t)&v88, (uint64_t)v85);
  v37 = v67;
  sub_235C71390(v67, (uint64_t)v84);
  v38 = v70;
  sub_235C71390(v70, (uint64_t)v83);
  swift_retain();
  v39 = AFDeviceSupportsSAE();
  v40 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v85, v86);
  v54 = &v52;
  MEMORY[0x24BDAC7A8](v40);
  v42 = (uint64_t *)((char *)&v52 - ((v41 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v43 + 16))(v42);
  v44 = *v42;
  v82 = &off_25070C308;
  v81 = v53;
  v80[0] = v44;
  v45 = objc_allocWithZone((Class)type metadata accessor for AssistantSpeechRecognizerResponseHandler());
  v46 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v80, v81);
  MEMORY[0x24BDAC7A8](v46);
  v48 = (uint64_t *)((char *)&v52 - ((v47 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v49 + 16))(v48);
  v50 = sub_235C89404(v32, v69, v71, v72, v74, v34, (uint64_t)v87, v75, v36, *v48, (uint64_t)v84, (uint64_t)v83, v63, v65, v64 & 1, v62 & 1, v61 & 1, v60 & 1, v59 & 1,
          v58 & 1,
          v55,
          v57 & 1,
          v56 & 1,
          v39,
          v45);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v80);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v85);
  __swift_destroy_boxed_opaque_existential_1(v38);
  __swift_destroy_boxed_opaque_existential_1(v37);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v88);
  __swift_destroy_boxed_opaque_existential_1(v77);
  (*(void (**)(uint64_t, uint64_t))(v73 + 8))(v78, v76);
  (*(void (**)(uint64_t, uint64_t))(v66 + 8))(v79, v68);
  return v50;
}

uint64_t sub_235C8A0F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, _QWORD *a12, uint64_t a13, char a14, char a15, uint64_t a16)
{
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  __int128 v43[2];
  _BYTE v44[40];
  _QWORD v45[6];

  v45[4] = &off_25070C308;
  v45[3] = type metadata accessor for MyriadDecisionMonitor();
  v45[0] = a10;
  *(_BYTE *)(a16 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_serverEndPointReceived) = 0;
  *(_BYTE *)(a16 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_serverEndPointSentToSpeech) = 0;
  *(_QWORD *)(a16 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_serverEndpointIdentifiedMessage) = 0;
  v24 = (_QWORD *)(a16 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_assistantId);
  *v24 = a1;
  v24[1] = a2;
  v25 = a16 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_sessionId;
  v26 = sub_235CA2790();
  v41 = *(_QWORD *)(v26 - 8);
  v42 = a3;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v41 + 16))(v25, a3, v26);
  v27 = (_QWORD *)(a16 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_requestId);
  v38 = a4;
  v39 = a5;
  *v27 = a4;
  v27[1] = a5;
  v28 = a16 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_userId;
  v29 = sub_235CA3498();
  v40 = *(_QWORD *)(v29 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v40 + 16))(v28, a6, v29);
  v30 = a16 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_requestType;
  v31 = sub_235CA3420();
  v32 = *(_QWORD *)(v31 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v32 + 16))(v30, a7, v31);
  *(_QWORD *)(a16 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_serviceHelper) = a9;
  sub_235C71390((uint64_t)v45, a16 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_myriadMonitor);
  sub_235C71390(a8, (uint64_t)v44);
  if (a12)
  {
    swift_retain();
    swift_unknownObjectRetain();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v44);
    v33 = a12;
  }
  else
  {
    sub_235C71390((uint64_t)v44, (uint64_t)v43);
    swift_unknownObjectRetain();
    swift_bridgeObjectRetain();
    _s9ASRBridge9AsrBridgeC27configuredMaxEagerRCAllowedSivgZ_0();
    v35 = v34;
    type metadata accessor for BufferedResultCandidateHandler();
    v33 = (_QWORD *)swift_allocObject();
    v33[10] = 0;
    v33[11] = sub_235C8EC70(MEMORY[0x24BEE4AF8]);
    v33[12] = 0;
    v33[7] = v38;
    v33[8] = v39;
    sub_235C7131C(v43, (uint64_t)(v33 + 2));
    v33[9] = v35;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v44);
  }
  *(_QWORD *)(a16 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_bufferedResultCandidateHandler) = v33;
  v36 = a11;
  if (!a11)
  {
    if (qword_2542990D8 != -1)
      swift_once();
    v36 = qword_2542994C0;
    swift_retain();
  }
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v45);
  __swift_destroy_boxed_opaque_existential_1(a8);
  (*(void (**)(uint64_t, uint64_t))(v32 + 8))(a7, v31);
  (*(void (**)(uint64_t, uint64_t))(v40 + 8))(a6, v29);
  (*(void (**)(uint64_t, uint64_t))(v41 + 8))(v42, v26);
  *(_QWORD *)(a16 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_instrumentationUtil) = v36;
  *(_QWORD *)(a16 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_muxRequestContext) = a13;
  *(_BYTE *)(a16 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_isIdentityScoreConsumptionEnabled) = a14 & 1;
  *(_BYTE *)(a16 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_isMedocEnabled) = a15 & 1;
  return a16;
}

uint64_t sub_235C8A44C(void *a1, void (*a2)(_QWORD, _QWORD), uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
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
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  uint64_t result;
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t, uint64_t);
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  void *v32;
  NSObject *v33;
  os_log_type_t v34;
  void (*v35)(_QWORD, _QWORD);
  uint8_t *v36;
  uint64_t v37;
  id v38;
  void *v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  NSObject *v47;
  os_log_type_t v48;
  uint8_t *v49;
  uint64_t v50;
  id v51;
  void *v52;
  uint64_t v53;
  unint64_t v54;
  unint64_t v55;
  char v56;
  void (*v57)(char *, uint64_t);
  uint64_t v58;
  void (*v59)(_QWORD, _QWORD);
  char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;

  v4 = v3;
  v62 = a3;
  v64 = a1;
  v61 = sub_235CA3708();
  v63 = *(_QWORD *)(v61 - 8);
  v6 = MEMORY[0x24BDAC7A8](v61);
  v8 = (char *)&v58 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v60 = (char *)&v58 - v9;
  v10 = sub_235CA3420();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v58 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542990A0);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v58 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254299088);
  v18 = MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)&v58 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)&v58 - v21;
  if ((*(_BYTE *)(v4 + qword_2542994E8) & 1) != 0)
    goto LABEL_2;
  v59 = a2;
  v24 = v4 + qword_2542994F0;
  swift_beginAccess();
  (*(void (**)(char *, _QWORD, uint64_t))(v11 + 104))(v22, *MEMORY[0x24BE9AED8], v10);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v22, 0, 1, v10);
  v25 = (uint64_t)&v16[*(int *)(v14 + 48)];
  sub_235C8BA84(v24, (uint64_t)v16);
  sub_235C8BA84((uint64_t)v22, v25);
  v26 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v11 + 48);
  if (v26((uint64_t)v16, 1, v10) == 1)
  {
    sub_235C76BD8((uint64_t)v22, (uint64_t *)&unk_254299088);
    v27 = v26(v25, 1, v10);
    a2 = v59;
    if (v27 == 1)
    {
      sub_235C76BD8((uint64_t)v16, (uint64_t *)&unk_254299088);
LABEL_2:
      if (*(_QWORD *)(v4 + qword_2542994E0))
      {
        swift_retain();
        sub_235C77DB0(v64, a2, v62);
        return swift_release();
      }
      if (qword_2542992E8 != -1)
        swift_once();
      v28 = v61;
      v29 = __swift_project_value_buffer(v61, (uint64_t)qword_254299660);
      v30 = v63;
      v31 = v60;
      (*(void (**)(char *, uint64_t, uint64_t))(v63 + 16))(v60, v29, v28);
      v32 = v64;
      v33 = sub_235CA36FC();
      v34 = sub_235CA3930();
      if (os_log_type_enabled(v33, v34))
      {
        v35 = a2;
        v36 = (uint8_t *)swift_slowAlloc();
        v37 = swift_slowAlloc();
        v66 = v37;
        *(_DWORD *)v36 = 136315138;
        v38 = objc_msgSend(v32, sel_resultId);
        if (v38)
        {
          v39 = v38;
          v40 = sub_235CA37EC();
          v42 = v41;

        }
        else
        {
          v40 = 7104878;
          v42 = 0xE300000000000000;
        }
        v65 = sub_235C944B8(v40, v42, &v66);
        sub_235CA3A14();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_235C5E000, v33, v34, "#AsrOnServer serverAsrResultCandidateProcessor is nil. Cannot process the RC. rcId: %s", v36, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x23B7DE144](v37, -1, -1);
        MEMORY[0x23B7DE144](v36, -1, -1);

        result = (*(uint64_t (**)(char *, uint64_t))(v63 + 8))(v60, v28);
        a2 = v35;
        if (!v35)
          return result;
        return ((uint64_t (*)(_QWORD, _QWORD))a2)(0, 0);
      }

      result = (*(uint64_t (**)(char *, uint64_t))(v30 + 8))(v31, v28);
LABEL_22:
      if (!a2)
        return result;
      return ((uint64_t (*)(_QWORD, _QWORD))a2)(0, 0);
    }
    goto LABEL_14;
  }
  sub_235C8BA84((uint64_t)v16, (uint64_t)v20);
  if (v26(v25, 1, v10) == 1)
  {
    sub_235C76BD8((uint64_t)v22, (uint64_t *)&unk_254299088);
    (*(void (**)(char *, uint64_t))(v11 + 8))(v20, v10);
    a2 = v59;
LABEL_14:
    sub_235C76BD8((uint64_t)v16, &qword_2542990A0);
    goto LABEL_15;
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 32))(v13, v25, v10);
  sub_235C69C18(&qword_254299080, (uint64_t (*)(uint64_t))MEMORY[0x24BE9AF20], MEMORY[0x24BE9AF30]);
  v56 = sub_235CA37D4();
  v57 = *(void (**)(char *, uint64_t))(v11 + 8);
  v57(v13, v10);
  sub_235C76BD8((uint64_t)v22, (uint64_t *)&unk_254299088);
  v57(v20, v10);
  sub_235C76BD8((uint64_t)v16, (uint64_t *)&unk_254299088);
  a2 = v59;
  if ((v56 & 1) != 0)
    goto LABEL_2;
LABEL_15:
  if (qword_2542992E8 != -1)
    swift_once();
  v43 = v61;
  v44 = __swift_project_value_buffer(v61, (uint64_t)qword_254299660);
  v45 = v63;
  (*(void (**)(char *, uint64_t, uint64_t))(v63 + 16))(v8, v44, v43);
  v46 = v64;
  v47 = sub_235CA36FC();
  v48 = sub_235CA3930();
  if (!os_log_type_enabled(v47, v48))
  {

    result = (*(uint64_t (**)(char *, uint64_t))(v45 + 8))(v8, v43);
    goto LABEL_22;
  }
  v49 = (uint8_t *)swift_slowAlloc();
  v50 = swift_slowAlloc();
  v66 = v50;
  *(_DWORD *)v49 = 136315138;
  v51 = objc_msgSend(v46, sel_resultId);
  if (v51)
  {
    v52 = v51;
    v53 = sub_235CA37EC();
    v55 = v54;

  }
  else
  {
    v53 = 7104878;
    v55 = 0xE300000000000000;
  }
  v65 = sub_235C944B8(v53, v55, &v66);
  sub_235CA3A14();

  swift_bridgeObjectRelease();
  _os_log_impl(&dword_235C5E000, v47, v48, "#AsrOnServer Unsupported path for handling server RC. Either asrOnServer must be true or requestType must be uos. rcId: %s", v49, 0xCu);
  swift_arrayDestroy();
  MEMORY[0x23B7DE144](v50, -1, -1);
  MEMORY[0x23B7DE144](v49, -1, -1);

  result = (*(uint64_t (**)(char *, uint64_t))(v63 + 8))(v8, v43);
  a2 = v59;
  if (v59)
    return ((uint64_t (*)(_QWORD, _QWORD))a2)(0, 0);
  return result;
}

void sub_235C8AB80(void *a1, void (*a2)(_QWORD, _QWORD), void *a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  id v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v23;
  _QWORD *v24;
  id v25;
  uint64_t v26;
  id v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  id v31;
  void *v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  NSObject *v37;
  os_log_type_t v38;
  uint8_t *v39;
  uint64_t v40;
  id v41;
  NSObject *v42;
  os_log_type_t v43;
  uint8_t *v44;
  id v45;
  void *v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  uint64_t v50;
  void (*v51)(_QWORD, _QWORD);
  uint64_t v52;
  id v53;
  NSObject *v54;
  os_log_type_t v55;
  uint8_t *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void (*v61)(_QWORD, _QWORD);
  id v62;
  uint64_t v63;
  uint64_t v64;

  v7 = sub_235CA3708();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v59 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v59 - v12;
  if (*(_BYTE *)(v3 + qword_254299180) != 1)
  {
    if (qword_2542992E8 != -1)
      swift_once();
    __swift_project_value_buffer(v7, (uint64_t)qword_254299660);
    v19 = a1;
    v20 = sub_235CA36FC();
    v21 = sub_235CA3930();
    if (os_log_type_enabled(v20, v21))
    {
      v22 = (uint8_t *)swift_slowAlloc();
      v23 = swift_slowAlloc();
      v62 = a3;
      v24 = (_QWORD *)v23;
      *(_DWORD *)v22 = 138412290;
      v64 = (uint64_t)v19;
      v25 = v19;
      sub_235CA3A14();
      *v24 = v19;

      _os_log_impl(&dword_235C5E000, v20, v21, "#AsrOnServer MUXResultCandidate received when MUX is disabled.  %@", v22, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254299410);
      swift_arrayDestroy();
      MEMORY[0x23B7DE144](v24, -1, -1);
      MEMORY[0x23B7DE144](v22, -1, -1);

      if (!a2)
        return;
    }
    else
    {

      if (!a2)
        return;
    }
    goto LABEL_19;
  }
  if (*(_BYTE *)(v3 + qword_2542994E8) != 1)
  {
    if (qword_2542992E8 != -1)
      swift_once();
    v26 = __swift_project_value_buffer(v7, (uint64_t)qword_254299660);
    (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v11, v26, v7);
    v27 = a1;
    v28 = sub_235CA36FC();
    v29 = sub_235CA3930();
    if (os_log_type_enabled(v28, v29))
    {
      v61 = a2;
      v62 = a3;
      v30 = (uint8_t *)swift_slowAlloc();
      v60 = swift_slowAlloc();
      v64 = v60;
      *(_DWORD *)v30 = 136315138;
      v31 = objc_msgSend(v27, sel_rcID);
      if (v31)
      {
        v32 = v31;
        v33 = sub_235CA37EC();
        v35 = v34;

      }
      else
      {
        v33 = 7104878;
        v35 = 0xE300000000000000;
      }
      v63 = sub_235C944B8(v33, v35, &v64);
      sub_235CA3A14();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_235C5E000, v28, v29, "#AsrOnServer Unsupported path for handling server RC. rcId: %s", v30, 0xCu);
      v50 = v60;
      swift_arrayDestroy();
      MEMORY[0x23B7DE144](v50, -1, -1);
      MEMORY[0x23B7DE144](v30, -1, -1);

      (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
LABEL_45:
      a2 = v61;
      if (!v61)
        return;
      goto LABEL_19;
    }

    (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
LABEL_35:
    if (!a2)
      return;
LABEL_19:
    a2(0, 0);
    return;
  }
  if (!*(_QWORD *)(v3 + qword_2542994E0))
  {
    if (qword_2542992E8 != -1)
      swift_once();
    v40 = __swift_project_value_buffer(v7, (uint64_t)qword_254299660);
    (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v13, v40, v7);
    v41 = a1;
    v42 = sub_235CA36FC();
    v43 = sub_235CA3930();
    if (os_log_type_enabled(v42, v43))
    {
      v61 = a2;
      v62 = a3;
      v44 = (uint8_t *)swift_slowAlloc();
      v60 = swift_slowAlloc();
      v64 = v60;
      *(_DWORD *)v44 = 136315138;
      v45 = objc_msgSend(v41, sel_rcID);
      if (v45)
      {
        v46 = v45;
        v47 = sub_235CA37EC();
        v49 = v48;

      }
      else
      {
        v47 = 7104878;
        v49 = 0xE300000000000000;
      }
      v63 = sub_235C944B8(v47, v49, &v64);
      sub_235CA3A14();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_235C5E000, v42, v43, "#AsrOnServer serverAsrResultCandidateProcessor is nil. Cannot process the RC. rcId: %s", v44, 0xCu);
      v58 = v60;
      swift_arrayDestroy();
      MEMORY[0x23B7DE144](v58, -1, -1);
      MEMORY[0x23B7DE144](v44, -1, -1);

      (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
      goto LABEL_45;
    }

    (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
    goto LABEL_35;
  }
  v14 = *(void **)(v3 + qword_2542994F8);
  if (v14
    && (type metadata accessor for AssistantSpeechRecognizerResponseHandler(), (v15 = swift_dynamicCastClass()) != 0))
  {
    v16 = v15;
    v17 = (uint64_t)a3;
    if ((*(_BYTE *)(v15
                   + OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_hasfirstVoiceIdScoreCardArrived) & 1) != 0)
    {
      swift_retain();
      v18 = v14;
    }
    else
    {
      v51 = a2;
      v52 = qword_2542992E8;
      swift_retain();
      v53 = v14;
      if (v52 != -1)
        swift_once();
      __swift_project_value_buffer(v7, (uint64_t)qword_254299660);
      v54 = sub_235CA36FC();
      v55 = sub_235CA3930();
      if (os_log_type_enabled(v54, v55))
      {
        v56 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v56 = 0;
        _os_log_impl(&dword_235C5E000, v54, v55, "First Voice Id Score card has not arrived yet. The unknown user shall be used for this result candidate.", v56, 2u);
        MEMORY[0x23B7DE144](v56, -1, -1);
      }

      a2 = v51;
    }
    v57 = *(void **)(v16 + OBJC_IVAR____TtC9ASRBridge40AssistantSpeechRecognizerResponseHandler_voiceIdScoreCard);
    v62 = v57;
    sub_235C7A590(a1, v57, (uint64_t)a2, v17);
    swift_release();

  }
  else
  {
    v36 = qword_2542992E8;
    swift_retain();
    if (v36 != -1)
      swift_once();
    __swift_project_value_buffer(v7, (uint64_t)qword_254299660);
    v37 = sub_235CA36FC();
    v38 = sub_235CA3930();
    if (os_log_type_enabled(v37, v38))
    {
      v39 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v39 = 0;
      _os_log_impl(&dword_235C5E000, v37, v38, "#AsrOnServer Current speechResponseHandler is not for Assistant request", v39, 2u);
      MEMORY[0x23B7DE144](v39, -1, -1);
    }

    swift_release();
  }
}

uint64_t sub_235C8B398(void *a1, uint64_t (*a2)(_QWORD, _QWORD), uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t result;
  uint64_t v12;
  id v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  id v17;
  void *v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t (*v25)(_QWORD, _QWORD);
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v7 = sub_235CA3708();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(_QWORD *)(v3 + qword_2542994E0))
  {
    swift_retain();
    sub_235C7DD7C(a1, (uint64_t)a2, a3);
    return swift_release();
  }
  if (qword_2542992E8 != -1)
    swift_once();
  v12 = __swift_project_value_buffer(v7, (uint64_t)qword_254299660);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v12, v7);
  v13 = a1;
  v14 = sub_235CA36FC();
  v15 = sub_235CA3930();
  if (os_log_type_enabled(v14, v15))
  {
    v25 = a2;
    v26 = a3;
    v16 = (uint8_t *)swift_slowAlloc();
    v24 = swift_slowAlloc();
    v28 = v24;
    *(_DWORD *)v16 = 136315138;
    v17 = objc_msgSend(v13, sel_refId);
    if (v17)
    {
      v18 = v17;
      v19 = sub_235CA37EC();
      v21 = v20;

    }
    else
    {
      v21 = 0xE300000000000000;
      v19 = 7104878;
    }
    v27 = sub_235C944B8(v19, v21, &v28);
    sub_235CA3A14();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_235C5E000, v14, v15, "#AsrOnServer serverAsrResultCandidateProcessor is nil. Cannot process the SASSpeechServerEndpointIdentified. refId: %s", v16, 0xCu);
    v22 = v24;
    swift_arrayDestroy();
    MEMORY[0x23B7DE144](v22, -1, -1);
    MEMORY[0x23B7DE144](v16, -1, -1);

    result = (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    a2 = v25;
    if (v25)
      return a2(0, 0);
  }
  else
  {

    result = (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    if (a2)
      return a2(0, 0);
  }
  return result;
}

uint64_t sub_235C8B64C(void *a1, uint64_t (*a2)(_QWORD, _QWORD), uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  void *v12;
  uint64_t result;
  uint64_t v14;
  _QWORD *v15;
  void *v16;
  id v17;
  uint64_t v18;
  id v19;
  NSObject *v20;
  int v21;
  uint8_t *v22;
  id v23;
  void *v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  uint64_t (*v31)(_QWORD, _QWORD);
  uint64_t aBlock[7];

  v7 = sub_235CA3708();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *(_QWORD *)(v3 + qword_2542994E0);
  if (v11)
  {
    v12 = *(void **)(v11 + OBJC_IVAR____TtC9ASRBridge18ServerAsrProcessor_serviceHelper);
    result = (uint64_t)objc_msgSend(v12, sel_respondsToSelector_, sel_handleSpeechRecognized_completion_);
    if ((result & 1) != 0)
    {
      v14 = swift_allocObject();
      swift_weakInit();
      v15 = (_QWORD *)swift_allocObject();
      v15[2] = v14;
      v15[3] = a2;
      v15[4] = a3;
      v15[5] = a1;
      aBlock[4] = (uint64_t)sub_235C8BA60;
      aBlock[5] = (uint64_t)v15;
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 1107296256;
      aBlock[2] = (uint64_t)sub_235C8101C;
      aBlock[3] = (uint64_t)&block_descriptor_3;
      v16 = _Block_copy(aBlock);
      swift_retain();
      swift_unknownObjectRetain();
      swift_retain();
      sub_235C7F124((uint64_t)a2);
      v17 = a1;
      swift_retain();
      swift_release();
      objc_msgSend(v12, sel_handleSpeechRecognized_completion_, v17, v16);
      _Block_release(v16);
      swift_release();
      swift_release();
      swift_release();
      return swift_unknownObjectRelease();
    }
    return result;
  }
  if (qword_2542992E8 != -1)
    swift_once();
  v18 = __swift_project_value_buffer(v7, (uint64_t)qword_254299660);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v18, v7);
  v19 = a1;
  v20 = sub_235CA36FC();
  v21 = sub_235CA3930();
  if (!os_log_type_enabled(v20, (os_log_type_t)v21))
  {

    result = (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    if (!a2)
      return result;
    return a2(0, 0);
  }
  v30 = v21;
  v31 = a2;
  v22 = (uint8_t *)swift_slowAlloc();
  v29 = swift_slowAlloc();
  aBlock[0] = v29;
  *(_DWORD *)v22 = 136315138;
  v23 = objc_msgSend(v19, sel_refId);
  if (v23)
  {
    v24 = v23;
    v25 = sub_235CA37EC();
    v27 = v26;

  }
  else
  {
    v27 = 0xE300000000000000;
    v25 = 7104878;
  }
  aBlock[6] = sub_235C944B8(v25, v27, aBlock);
  sub_235CA3A14();

  swift_bridgeObjectRelease();
  _os_log_impl(&dword_235C5E000, v20, (os_log_type_t)v30, "#AsrOnServer serverAsrResultCandidateProcessor is nil. Cannot process the SASSpeechRecognized. refId: %s", v22, 0xCu);
  v28 = v29;
  swift_arrayDestroy();
  MEMORY[0x23B7DE144](v28, -1, -1);
  MEMORY[0x23B7DE144](v22, -1, -1);

  result = (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  a2 = v31;
  if (v31)
    return a2(0, 0);
  return result;
}

uint64_t sub_235C8BA00()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_235C8BA24()
{
  uint64_t v0;

  swift_release();
  if (*(_QWORD *)(v0 + 24))
    swift_release();

  return swift_deallocObject();
}

void sub_235C8BA60(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_235C7E188(a1, a2, *(_QWORD *)(v2 + 16), *(void (**)(uint64_t, uint64_t))(v2 + 24), *(_QWORD *)(v2 + 32), *(void **)(v2 + 40));
}

uint64_t block_copy_helper_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_3()
{
  return swift_release();
}

uint64_t sub_235C8BA84(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254299088);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t __swift_mutable_project_boxed_opaque_existential_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

uint64_t sub_235C8BAF4(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 8))();
  return a1;
}

uint64_t sub_235C8BB28(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 16))(a2, a1);
  return a2;
}

uint64_t sub_235C8BB64()
{
  return swift_release();
}

unint64_t sub_235C8BB6C()
{
  unint64_t result;

  result = qword_254299110;
  if (!qword_254299110)
  {
    result = MEMORY[0x23B7DE090](&protocol conformance descriptor for JitGrammarInput, &type metadata for JitGrammarInput);
    atomic_store(result, (unint64_t *)&qword_254299110);
  }
  return result;
}

unint64_t sub_235C8BBB0()
{
  unint64_t result;

  result = qword_254299108;
  if (!qword_254299108)
  {
    result = MEMORY[0x23B7DE090](&protocol conformance descriptor for JitGrammarInput, &type metadata for JitGrammarInput);
    atomic_store(result, (unint64_t *)&qword_254299108);
  }
  return result;
}

unint64_t sub_235C8BBF4()
{
  unint64_t result;

  result = qword_254299140;
  if (!qword_254299140)
  {
    result = MEMORY[0x23B7DE090](&protocol conformance descriptor for JitGrammarOutput, &type metadata for JitGrammarOutput);
    atomic_store(result, (unint64_t *)&qword_254299140);
  }
  return result;
}

unint64_t sub_235C8BC38()
{
  unint64_t result;

  result = qword_254299138;
  if (!qword_254299138)
  {
    result = MEMORY[0x23B7DE090](&protocol conformance descriptor for JitGrammarOutput, &type metadata for JitGrammarOutput);
    atomic_store(result, (unint64_t *)&qword_254299138);
  }
  return result;
}

uint64_t sub_235C8BC7C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t objectdestroy_5Tm()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

uint64_t sub_235C8BCF8()
{
  uint64_t v0;

  return sub_235C813D8(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_235C8BF00(void *a1, uint64_t a2, void *a3, uint64_t a4, void *a5, unsigned int *a6)
{
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  char *v14;
  id v15;

  v10 = sub_235CA37EC();
  v12 = v11;
  v13 = a3;
  v14 = a5;
  v15 = a1;
  sub_235C8E4FC(v10, v12, v14, a6);

  return swift_bridgeObjectRelease();
}

uint64_t sub_235C8C0D4(void *a1, uint64_t a2, void *a3, uint64_t a4, void *a5, void *a6, unsigned int *a7, char a8)
{
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  char *v18;
  id v19;
  id v20;

  v14 = sub_235CA37EC();
  v16 = v15;
  v17 = a3;
  v18 = a5;
  v19 = a6;
  v20 = a1;
  sub_235C8E6BC(v14, v16, v18, v19, a7, a8);

  return swift_bridgeObjectRelease();
}

void sub_235C8C184(void *a1, uint64_t a2)
{
  void *v2;
  uint64_t v5;
  char *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;

  if (qword_2542992E8 != -1)
    swift_once();
  v5 = sub_235CA3708();
  __swift_project_value_buffer(v5, (uint64_t)qword_254299660);
  v6 = v2;
  v7 = sub_235CA36FC();
  v8 = sub_235CA3924();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    v15 = a2;
    v10 = swift_slowAlloc();
    *(_DWORD *)v9 = 136315138;
    v16 = v10;
    v12 = *(_QWORD *)&v6[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId];
    v11 = *(_QWORD *)&v6[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId + 8];
    swift_bridgeObjectRetain();
    sub_235C944B8(v12, v11, &v16);
    sub_235CA3A14();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_235C5E000, v7, v8, "Going to stop ASR for requestId = %s", v9, 0xCu);
    swift_arrayDestroy();
    v13 = v10;
    a2 = v15;
    MEMORY[0x23B7DE144](v13, -1, -1);
    MEMORY[0x23B7DE144](v9, -1, -1);

  }
  else
  {

  }
  v14 = (void *)sub_235CA37E0();
  objc_msgSend(a1, sel_stopSpeechRecognitionTaskWithReason_requestId_, a2, v14);

}

void sub_235C8C44C(uint64_t a1, uint64_t a2, NSObject *a3, char *a4, char *a5, void *a6, int a7)
{
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
  char *v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  char *v32;
  id v33;
  id v34;
  void *v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  char *v41;
  char *v42;
  void *v43;
  void *v44;
  char *v45;
  void *v46;
  char *v47;
  char *v48;
  char *v49;
  uint64_t v50;
  char v51;
  void *v52;
  char *v53;
  id v54;
  void *v55;
  NSObject *v56;
  char v57;
  char *v58;
  id v59;
  uint64_t v60;
  NSObject *v61;
  os_log_type_t v62;
  uint8_t *v63;
  uint64_t v64;
  id v65;
  void *v66;
  char v67;
  void *v68;
  char *v69;
  uint64_t v70;
  char *v71;
  char v72;
  void *v73;
  id v74;
  void *v75;
  NSObject *v76;
  char v77;
  char *v78;
  void *v79;
  char v80;
  void *v81;
  void *v82;
  NSObject *v83;
  uint64_t v84;
  char *v85;
  char v86;
  id v87;
  NSObject *v88;
  char *v89;
  char v90;
  void *v91;
  char *v92;
  char v93;
  char v94;
  void *v95;
  char *v96;
  char *v97;
  char *v98;
  int v99;
  char *v100;
  char *v101;
  char *v102;
  char *v103;
  char *v104;
  uint64_t (*v105)(char *, uint64_t);
  void (*v106)(char *, uint64_t, uint64_t);
  unint64_t v107;
  uint64_t v108;
  char *v109;
  NSObject *v110;
  uint64_t v111;
  char *v112;
  char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;

  v112 = a5;
  v99 = a7;
  v109 = a4;
  v110 = a3;
  v111 = a2;
  v9 = sub_235CA3444();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v97 = (char *)&v97 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v101 = (char *)&v97 - v14;
  v15 = MEMORY[0x24BDAC7A8](v13);
  v103 = (char *)&v97 - v16;
  v17 = MEMORY[0x24BDAC7A8](v15);
  v98 = (char *)&v97 - v18;
  v19 = MEMORY[0x24BDAC7A8](v17);
  v100 = (char *)&v97 - v20;
  v21 = MEMORY[0x24BDAC7A8](v19);
  v102 = (char *)&v97 - v22;
  v23 = MEMORY[0x24BDAC7A8](v21);
  v104 = (char *)&v97 - v24;
  v25 = MEMORY[0x24BDAC7A8](v23);
  v27 = (char *)&v97 - v26;
  v28 = MEMORY[0x24BDAC7A8](v25);
  v30 = (char *)&v97 - v29;
  MEMORY[0x24BDAC7A8](v28);
  v32 = (char *)&v97 - v31;
  v33 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE091C0]), sel_init);
  if (a6)
  {
    v34 = objc_msgSend(a6, sel_commandGrammarParsePackage);
    if (v34)
    {
      v35 = v34;
      objc_msgSend(v33, sel_setCommandGrammarParsePackage_, v34);

    }
  }
  v36 = *MEMORY[0x24BE9B390];
  v106 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 104);
  v106(v32, v36, v9);
  v37 = sub_235C8DA50();
  v108 = a1;
  sub_235CA3894();
  v107 = v37;
  sub_235CA3894();
  if (v116 == v114 && v117 == v115)
  {
    swift_bridgeObjectRelease_n();
    v105 = *(uint64_t (**)(char *, uint64_t))(v10 + 8);
    v38 = v105(v32, v9);
LABEL_8:
    v40 = v111;
    MEMORY[0x24BDAC7A8](v38);
    *(&v97 - 6) = v113;
    *(&v97 - 5) = (char *)v40;
    v41 = v109;
    v42 = (char *)v110;
    *(&v97 - 4) = (char *)v110;
    *(&v97 - 3) = v41;
    *(&v97 - 2) = v112;
    *(&v97 - 1) = (char *)v33;
    v43 = v33;
    objc_allocWithZone((Class)sub_235CA2CD0());
LABEL_9:
    v44 = (void *)sub_235CA2C64();
    if (v44)
      goto LABEL_10;
LABEL_28:
    if (qword_2542992E8 != -1)
      swift_once();
    v60 = sub_235CA3708();
    __swift_project_value_buffer(v60, (uint64_t)qword_254299660);
    swift_bridgeObjectRetain_n();
    v61 = sub_235CA36FC();
    v62 = sub_235CA3930();
    if (!os_log_type_enabled(v61, v62))
    {

      swift_bridgeObjectRelease_n();
      return;
    }
    v63 = (uint8_t *)swift_slowAlloc();
    v64 = swift_slowAlloc();
    v116 = v64;
    *(_DWORD *)v63 = 136315138;
    swift_bridgeObjectRetain();
    v114 = sub_235C944B8(v40, (unint64_t)v42, &v116);
    sub_235CA3A14();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_235C5E000, v61, v62, "Failed to create DictationAsrResultMessage for requestId: %s", v63, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B7DE144](v64, -1, -1);
    MEMORY[0x23B7DE144](v63, -1, -1);

    goto LABEL_86;
  }
  v39 = sub_235CA3B88();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v105 = *(uint64_t (**)(char *, uint64_t))(v10 + 8);
  v38 = v105(v32, v9);
  if ((v39 & 1) != 0)
    goto LABEL_8;
  v106(v30, *MEMORY[0x24BE9B380], v9);
  sub_235CA3894();
  sub_235CA3894();
  v49 = (char *)v111;
  if (v116 == v114 && v117 == v115)
  {
    swift_bridgeObjectRelease_n();
    v50 = v105(v30, v9);
  }
  else
  {
    v57 = sub_235CA3B88();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v50 = v105(v30, v9);
    if ((v57 & 1) == 0)
    {
      v106(v27, *MEMORY[0x24BE9B388], v9);
      sub_235CA3894();
      sub_235CA3894();
      v43 = v33;
      v42 = (char *)v110;
      if (v116 == v114 && v117 == v115)
      {
        swift_bridgeObjectRelease_n();
        v70 = v105(v27, v9);
        v40 = (uint64_t)v49;
        v41 = v109;
      }
      else
      {
        v77 = sub_235CA3B88();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v70 = v105(v27, v9);
        v40 = (uint64_t)v49;
        v41 = v109;
        if ((v77 & 1) == 0)
          goto LABEL_28;
      }
      MEMORY[0x24BDAC7A8](v70);
      *(&v97 - 6) = v113;
      *(&v97 - 5) = (char *)v40;
      v78 = v112;
      *(&v97 - 4) = v42;
      *(&v97 - 3) = v78;
      *(&v97 - 2) = (char *)v33;
      objc_allocWithZone((Class)sub_235CA2CD0());
      goto LABEL_9;
    }
  }
  MEMORY[0x24BDAC7A8](v50);
  *(&v97 - 6) = v113;
  *(&v97 - 5) = v49;
  v40 = (uint64_t)v49;
  v42 = (char *)v110;
  v58 = v112;
  *(&v97 - 4) = (char *)v110;
  *(&v97 - 3) = v58;
  v43 = v33;
  *(&v97 - 2) = (char *)v33;
  v59 = objc_allocWithZone((Class)sub_235CA2CD0());
  v44 = (void *)sub_235CA2C64();
  v41 = v109;
  if (!v44)
    goto LABEL_28;
LABEL_10:
  v45 = v113;
  __swift_project_boxed_opaque_existential_1(&v113[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_messagePublisher], *(_QWORD *)&v113[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_messagePublisher + 24]);
  v110 = v44;
  sub_235CA33B4();
  v46 = *(void **)&v45[OBJC_IVAR____TtC9ASRBridge40DictationSpeechRecognizerResponseHandler_dictationOptions];
  if (objc_msgSend(v46, sel_shouldRecognizeCommands))
  {
    v47 = v104;
    v106(v104, v36, v9);
    sub_235CA3894();
    sub_235CA3894();
    if (v116 == v114 && v117 == v115)
    {
      swift_bridgeObjectRelease_n();
      v105(v47, v9);
      goto LABEL_22;
    }
    v51 = sub_235CA3B88();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v105(v47, v9);
    if ((v51 & 1) != 0)
    {
LABEL_22:
      v52 = *(void **)&v113[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_serviceHelper];
      if (v112)
      {
        if ((objc_msgSend(*(id *)&v113[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_serviceHelper], sel_respondsToSelector_, sel_didRecognizePartialPackage_nluResult_sessionUUID_) & 1) != 0)
        {
          v53 = v112;
          swift_unknownObjectRetain();
          v54 = v43;
          v55 = (void *)sub_235CA37E0();
          objc_msgSend(v52, sel_didRecognizePartialPackage_nluResult_sessionUUID_, v53, v54, v55);
LABEL_25:

          swift_unknownObjectRelease();
          v56 = v110;

          return;
        }
        goto LABEL_85;
      }
      if ((objc_msgSend(*(id *)&v113[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_serviceHelper], sel_respondsToSelector_, sel_didRecognizeTokens_nluResult_sessionUUID_) & 1) != 0)
      {
        if (v41)
        {
          sub_235C8DAA4();
          v65 = v43;
          swift_unknownObjectRetain();
          v66 = (void *)sub_235CA38AC();
        }
        else
        {
          v87 = v43;
          swift_unknownObjectRetain();
          v66 = 0;
        }
        v79 = (void *)sub_235CA37E0();
        objc_msgSend(v52, sel_didRecognizeTokens_nluResult_sessionUUID_, v66, v43, v79);
        swift_unknownObjectRelease();

LABEL_66:
        v88 = v110;

        return;
      }
      goto LABEL_85;
    }
    v69 = v102;
    v106(v102, *MEMORY[0x24BE9B380], v9);
    sub_235CA3894();
    sub_235CA3894();
    if (v116 == v114 && v117 == v115)
    {
      swift_bridgeObjectRelease_n();
      v105(v69, v9);
LABEL_50:
      v73 = *(void **)&v113[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_serviceHelper];
      if ((objc_msgSend(v73, sel_respondsToSelector_, sel_didRecognizePackage_nluResult_sessionUUID_) & 1) == 0)
        goto LABEL_85;
      v74 = v43;
      swift_unknownObjectRetain();
      v75 = (void *)sub_235CA37E0();
      objc_msgSend(v73, sel_didRecognizePackage_nluResult_sessionUUID_, v112, v74, v75);
      swift_unknownObjectRelease();

LABEL_52:
      v76 = v110;

      return;
    }
    v72 = sub_235CA3B88();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v105(v69, v9);
    if ((v72 & 1) != 0)
      goto LABEL_50;
    v84 = *MEMORY[0x24BE9B388];
    v85 = v100;
    v106(v100, v84, v9);
    sub_235CA3894();
    sub_235CA3894();
    if (v116 == v114 && v117 == v115)
    {
      swift_bridgeObjectRelease_n();
      v105(v85, v9);
      v86 = v99;
      if ((v99 & 1) == 0)
      {
LABEL_75:
        v92 = v98;
        v106(v98, v84, v9);
        sub_235CA3894();
        sub_235CA3894();
        if (v116 == v114 && v117 == v115)
        {
          swift_bridgeObjectRelease_n();
          v105(v92, v9);
        }
        else
        {
          v94 = sub_235CA3B88();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          v105(v92, v9);
          if ((v94 & 1) == 0)
            goto LABEL_85;
        }
        if ((v86 & 1) != 0)
          goto LABEL_85;
        goto LABEL_82;
      }
    }
    else
    {
      v90 = sub_235CA3B88();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v105(v85, v9);
      v86 = v99;
      if ((v90 & 1) == 0 || (v99 & 1) == 0)
        goto LABEL_75;
    }
    if (v112)
    {
      v91 = *(void **)&v113[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_serviceHelper];
      if ((objc_msgSend(v91, sel_respondsToSelector_, sel_didRecognizeVoiceCommandCandidatePackage_nluResult_sessionUUID_) & 1) != 0)
      {
        v53 = v112;
        v54 = v43;
        swift_unknownObjectRetain();
        v55 = (void *)sub_235CA37E0();
        objc_msgSend(v91, sel_didRecognizeVoiceCommandCandidatePackage_nluResult_sessionUUID_, v53, v54, v55);
        goto LABEL_25;
      }
    }
    goto LABEL_85;
  }
  if ((objc_msgSend(v46, sel_shouldClassifyIntent) & 1) != 0)
    goto LABEL_85;
  v48 = v103;
  v106(v103, v36, v9);
  sub_235CA3894();
  sub_235CA3894();
  if (v116 == v114 && v117 == v115)
  {
    swift_bridgeObjectRelease_n();
    v105(v48, v9);
  }
  else
  {
    v67 = sub_235CA3B88();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v105(v48, v9);
    if ((v67 & 1) == 0)
    {
      v71 = v101;
      v106(v101, *MEMORY[0x24BE9B380], v9);
      sub_235CA3894();
      sub_235CA3894();
      if (v116 == v114 && v117 == v115)
      {
        swift_bridgeObjectRelease_n();
        v105(v71, v9);
      }
      else
      {
        v80 = sub_235CA3B88();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v105(v71, v9);
        if ((v80 & 1) == 0)
        {
          v89 = v97;
          v106(v97, *MEMORY[0x24BE9B388], v9);
          sub_235CA3894();
          sub_235CA3894();
          if (v116 == v114 && v117 == v115)
          {
            swift_bridgeObjectRelease_n();
            v105(v89, v9);
          }
          else
          {
            v93 = sub_235CA3B88();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            v105(v89, v9);
            if ((v93 & 1) == 0)
              goto LABEL_85;
          }
LABEL_82:
          if (!v112)
            goto LABEL_85;
          v95 = *(void **)&v113[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_serviceHelper];
          if ((objc_msgSend(v95, sel_respondsToSelector_, sel_didRecognizeFinalResultCandidatePackage_sessionUUID_) & 1) == 0)goto LABEL_85;
          v96 = v112;
          swift_unknownObjectRetain();
          v75 = (void *)sub_235CA37E0();
          objc_msgSend(v95, sel_didRecognizeFinalResultCandidatePackage_sessionUUID_, v96, v75);

          swift_unknownObjectRelease();
          goto LABEL_52;
        }
      }
      v81 = *(void **)&v113[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_serviceHelper];
      if ((objc_msgSend(v81, sel_respondsToSelector_, sel_didRecognizePackage_sessionUUID_) & 1) != 0)
      {
        swift_unknownObjectRetain();
        v82 = (void *)sub_235CA37E0();
        objc_msgSend(v81, sel_didRecognizePackage_sessionUUID_, v112, v82);
        swift_unknownObjectRelease();

        v83 = v110;
        return;
      }
      goto LABEL_85;
    }
  }
  v68 = *(void **)&v113[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_serviceHelper];
  if ((objc_msgSend(v68, sel_respondsToSelector_, sel_didRecognizeTokens_sessionUUID_) & 1) != 0)
  {
    if (v41)
    {
      sub_235C8DAA4();
      swift_unknownObjectRetain();
      v66 = (void *)sub_235CA38AC();
    }
    else
    {
      swift_unknownObjectRetain();
      v66 = 0;
    }
    v79 = (void *)sub_235CA37E0();
    objc_msgSend(v68, sel_didRecognizeTokens_sessionUUID_, v66, v79);
    swift_unknownObjectRelease();
    goto LABEL_66;
  }
LABEL_85:

  v61 = v110;
LABEL_86:

}

uint64_t sub_235C8D4D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, void *a7)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  id v27;
  _QWORD v29[2];
  id v30;
  id v31;

  v30 = a6;
  v31 = a7;
  v29[1] = a3;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256377A08);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_254299050);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_254299070);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)v29 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = *MEMORY[0x24BE9AD78];
  v18 = sub_235CA33CC();
  v19 = *(_QWORD *)(v18 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 104))(v16, v17, v18);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v19 + 56))(v16, 0, 1, v18);
  sub_235CA2CAC();
  swift_bridgeObjectRetain();
  sub_235CA2C88();
  v20 = a2 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_sessionId;
  v21 = sub_235CA2790();
  v22 = *(_QWORD *)(v21 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v22 + 16))(v13, v20, v21);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v22 + 56))(v13, 0, 1, v21);
  sub_235CA2CC4();
  swift_bridgeObjectRetain();
  sub_235CA2CB8();
  v23 = *MEMORY[0x24BE9B390];
  v24 = sub_235CA3444();
  v25 = *(_QWORD *)(v24 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v25 + 104))(v10, v23, v24);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v25 + 56))(v10, 0, 1, v24);
  sub_235CA2C7C();
  swift_bridgeObjectRetain();
  sub_235CA2C94();
  v26 = v30;
  sub_235CA2CA0();
  v27 = v31;
  return sub_235CA2C70();
}

uint64_t sub_235C8D72C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, void *a6, unsigned int *a7)
{
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
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  id v28;
  _QWORD v30[2];
  unsigned int *v31;
  id v32;

  v31 = a7;
  v32 = a6;
  v30[1] = a3;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_256377A08);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_254299050);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)v30 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_254299070);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)v30 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = *MEMORY[0x24BE9AD78];
  v19 = sub_235CA33CC();
  v20 = *(_QWORD *)(v19 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v20 + 104))(v17, v18, v19);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v20 + 56))(v17, 0, 1, v19);
  sub_235CA2CAC();
  swift_bridgeObjectRetain();
  sub_235CA2C88();
  v21 = a2 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_sessionId;
  v22 = sub_235CA2790();
  v23 = *(_QWORD *)(v22 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v23 + 16))(v14, v21, v22);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v23 + 56))(v14, 0, 1, v22);
  sub_235CA2CC4();
  swift_bridgeObjectRetain();
  sub_235CA2CB8();
  v24 = *v31;
  v25 = sub_235CA3444();
  v26 = *(_QWORD *)(v25 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v26 + 104))(v11, v24, v25);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v26 + 56))(v11, 0, 1, v25);
  sub_235CA2C7C();
  v27 = a5;
  sub_235CA2CA0();
  v28 = v32;
  return sub_235CA2C70();
}

void sub_235C8D974()
{
  uint64_t v0;

}

id sub_235C8D984()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DictationSpeechRecognizerResponseHandler();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_235C8D9C8()
{
  return type metadata accessor for DictationSpeechRecognizerResponseHandler();
}

uint64_t type metadata accessor for DictationSpeechRecognizerResponseHandler()
{
  uint64_t result;

  result = qword_2563779F0;
  if (!qword_2563779F0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_235C8DA0C()
{
  return swift_updateClassMetadata2();
}

unint64_t sub_235C8DA50()
{
  unint64_t result;
  uint64_t v1;

  result = qword_256377A00;
  if (!qword_256377A00)
  {
    v1 = sub_235CA3444();
    result = MEMORY[0x23B7DE090](MEMORY[0x24BE9B3A8], v1);
    atomic_store(result, (unint64_t *)&qword_256377A00);
  }
  return result;
}

uint64_t sub_235C8DA98(uint64_t a1)
{
  return sub_235C8DAEC(a1, MEMORY[0x24BE9B388]);
}

unint64_t sub_235C8DAA4()
{
  unint64_t result;

  result = qword_2542993A8;
  if (!qword_2542993A8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2542993A8);
  }
  return result;
}

uint64_t sub_235C8DAE0(uint64_t a1)
{
  return sub_235C8DAEC(a1, MEMORY[0x24BE9B380]);
}

uint64_t sub_235C8DAEC(uint64_t a1, unsigned int *a2)
{
  uint64_t v2;

  return sub_235C8D72C(a1, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32), *(void **)(v2 + 40), *(void **)(v2 + 48), a2);
}

uint64_t sub_235C8DB10(uint64_t a1)
{
  uint64_t v1;

  return sub_235C8D4D0(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40), *(void **)(v1 + 48), *(void **)(v1 + 56));
}

id sub_235C8DB20(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8)
{
  char *v8;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  void (*v18)(char *, uint64_t, uint64_t);
  uint64_t v19;
  id v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  objc_class *v25;
  id v26;
  void (*v27)(char *, uint64_t);
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  objc_super v34;
  _BYTE v35[40];

  v31 = a5;
  v32 = a7;
  v30 = a4;
  v14 = sub_235CA2790();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v29 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)&v8[OBJC_IVAR____TtC9ASRBridge40DictationSpeechRecognizerResponseHandler_dictationOptions] = a8;
  v18 = *(void (**)(char *, uint64_t, uint64_t))(v15 + 16);
  v18(v17, (uint64_t)a1, v14);
  v33 = a6;
  sub_235C71390(a6, (uint64_t)v35);
  v19 = qword_2542990D8;
  v20 = a8;
  if (v19 != -1)
    swift_once();
  v21 = qword_2542994C0;
  v18(&v8[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_sessionId], (uint64_t)v17, v14);
  v22 = &v8[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_assistantId];
  *(_QWORD *)v22 = a2;
  *((_QWORD *)v22 + 1) = a3;
  v23 = &v8[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId];
  v24 = v31;
  *(_QWORD *)v23 = v30;
  *((_QWORD *)v23 + 1) = v24;
  sub_235C71390((uint64_t)v35, (uint64_t)&v8[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_messagePublisher]);
  *(_QWORD *)&v8[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_serviceHelper] = v32;
  *(_QWORD *)&v8[OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_instrumentationUtil] = v21;
  v25 = (objc_class *)type metadata accessor for SpeechRecognizerResponseHandler();
  v34.receiver = v8;
  v34.super_class = v25;
  swift_retain();
  v26 = objc_msgSendSuper2(&v34, sel_init);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v35);
  v27 = *(void (**)(char *, uint64_t))(v15 + 8);
  v27(v17, v14);
  __swift_destroy_boxed_opaque_existential_1(v33);
  v27(a1, v14);
  return v26;
}

void sub_235C8DCFC(uint64_t a1, NSObject *a2, char *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  char *v20;
  uint8_t *v21;
  uint8_t *v22;
  BOOL v23;
  os_log_type_t v24;
  uint8_t *v25;
  uint64_t v26;
  os_log_t v27;

  v4 = v3;
  v8 = sub_235CA3444();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2542992E8 != -1)
    swift_once();
  v12 = sub_235CA3708();
  v27 = (os_log_t)__swift_project_value_buffer(v12, (uint64_t)qword_254299660);
  v13 = sub_235CA36FC();
  v14 = sub_235CA3924();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = v9;
    v16 = v8;
    v17 = a1;
    v18 = a2;
    v19 = v4;
    v20 = a3;
    v21 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v21 = 0;
    _os_log_impl(&dword_235C5E000, v13, v14, "Received partial result tokens for dictation request", v21, 2u);
    v22 = v21;
    a3 = v20;
    v4 = v19;
    a2 = v18;
    a1 = v17;
    v8 = v16;
    v9 = v15;
    MEMORY[0x23B7DE144](v22, -1, -1);
  }

  v23 = *(_QWORD *)(v4 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId) == a1
     && *(_QWORD *)(v4 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId + 8) == (_QWORD)a2;
  if (v23 || (sub_235CA3B88() & 1) != 0)
  {
    (*(void (**)(char *, _QWORD, uint64_t))(v9 + 104))(v11, *MEMORY[0x24BE9B390], v8);
    sub_235C8C44C((uint64_t)v11, a1, a2, a3, 0, 0, 0);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  else
  {
    v27 = (os_log_t)sub_235CA36FC();
    v24 = sub_235CA3930();
    if (os_log_type_enabled(v27, v24))
    {
      v25 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v25 = 0;
      _os_log_impl(&dword_235C5E000, v27, v24, "Response requestId does not match current requestId", v25, 2u);
      MEMORY[0x23B7DE144](v25, -1, -1);
    }

  }
}

void sub_235C8DF78(uint64_t a1, NSObject *a2, void *a3, void *a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint8_t *v23;
  uint8_t *v24;
  BOOL v25;
  os_log_t v26;
  id v27;
  void *v28;
  id v29;
  char *v30;
  os_log_type_t v31;
  uint8_t *v32;
  uint64_t v33;
  os_log_t v34;

  v5 = v4;
  v10 = sub_235CA3444();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v34 = (os_log_t)((char *)&v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (qword_2542992E8 != -1)
    swift_once();
  v13 = sub_235CA3708();
  v33 = __swift_project_value_buffer(v13, (uint64_t)qword_254299660);
  v14 = sub_235CA36FC();
  v15 = sub_235CA3924();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = a1;
    v17 = v11;
    v18 = v10;
    v19 = a2;
    v20 = a3;
    v21 = v5;
    v22 = a4;
    v23 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v23 = 0;
    _os_log_impl(&dword_235C5E000, v14, v15, "Received partial result package for dictation request", v23, 2u);
    v24 = v23;
    a4 = v22;
    v5 = v21;
    a3 = v20;
    a2 = v19;
    v10 = v18;
    v11 = v17;
    a1 = v16;
    MEMORY[0x23B7DE144](v24, -1, -1);
  }

  v25 = *(_QWORD *)(v5 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId) == a1
     && *(_QWORD *)(v5 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId + 8) == (_QWORD)a2;
  if (v25 || (sub_235CA3B88() & 1) != 0)
  {
    v26 = v34;
    (*(void (**)(os_log_t, _QWORD, uint64_t))(v11 + 104))(v34, *MEMORY[0x24BE9B390], v10);
    v27 = objc_msgSend(a3, sel_recognition);
    if (v27)
    {
      v28 = v27;
      v29 = objc_msgSend(v27, sel_oneBestTokenList);

      if (v29)
      {
        sub_235C8DAA4();
        v30 = (char *)sub_235CA38B8();

      }
      else
      {
        v30 = 0;
      }
      sub_235C8C44C((uint64_t)v26, a1, a2, v30, (char *)a3, a4, 0);
      swift_bridgeObjectRelease();
      (*(void (**)(os_log_t, uint64_t))(v11 + 8))(v26, v10);
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    v34 = (os_log_t)sub_235CA36FC();
    v31 = sub_235CA3930();
    if (os_log_type_enabled(v34, v31))
    {
      v32 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v32 = 0;
      _os_log_impl(&dword_235C5E000, v34, v31, "Response requestId does not match current requestId", v32, 2u);
      MEMORY[0x23B7DE144](v32, -1, -1);
    }

  }
}

void sub_235C8E278(NSObject *a1, NSObject *a2, char *a3, void *a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  char *v19;
  uint64_t v20;
  void *v21;
  uint8_t *v22;
  uint8_t *v23;
  os_log_t v24;
  BOOL v25;
  os_log_type_t v26;
  uint8_t *v27;
  uint64_t v28;
  os_log_t v29;

  v5 = v4;
  v29 = a1;
  v9 = sub_235CA3444();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2542992E8 != -1)
    swift_once();
  v13 = sub_235CA3708();
  v28 = __swift_project_value_buffer(v13, (uint64_t)qword_254299660);
  v14 = sub_235CA36FC();
  v15 = sub_235CA3924();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = v10;
    v17 = v9;
    v18 = a2;
    v19 = a3;
    v20 = v5;
    v21 = a4;
    v22 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v22 = 0;
    _os_log_impl(&dword_235C5E000, v14, v15, "Received partial result for dictation request with metadata", v22, 2u);
    v23 = v22;
    a4 = v21;
    v5 = v20;
    a3 = v19;
    a2 = v18;
    v9 = v17;
    v10 = v16;
    MEMORY[0x23B7DE144](v23, -1, -1);
  }

  v24 = v29;
  v25 = *(os_log_t *)(v5 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId) == v29
     && *(_QWORD *)(v5 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId + 8) == (_QWORD)a2;
  if (v25 || (sub_235CA3B88() & 1) != 0)
  {
    (*(void (**)(char *, _QWORD, uint64_t))(v10 + 104))(v12, *MEMORY[0x24BE9B390], v9);
    sub_235C8C44C((uint64_t)v12, (uint64_t)v24, a2, a3, 0, a4, 0);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  }
  else
  {
    v29 = (os_log_t)sub_235CA36FC();
    v26 = sub_235CA3930();
    if (os_log_type_enabled(v29, v26))
    {
      v27 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v27 = 0;
      _os_log_impl(&dword_235C5E000, v29, v26, "Response requestId does not match current requestId", v27, 2u);
      MEMORY[0x23B7DE144](v27, -1, -1);
    }

  }
}

void sub_235C8E4FC(uint64_t a1, NSObject *a2, char *a3, unsigned int *a4)
{
  uint64_t v4;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  BOOL v13;
  uint64_t v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  os_log_t v18;

  v9 = sub_235CA3444();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = *(_QWORD *)(v4 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId) == a1
     && *(_QWORD *)(v4 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId + 8) == (_QWORD)a2;
  if (v13 || (sub_235CA3B88() & 1) != 0)
  {
    (*(void (**)(char *, _QWORD, uint64_t))(v10 + 104))(v12, *a4, v9);
    sub_235C8C44C((uint64_t)v12, a1, a2, 0, a3, 0, 0);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  }
  else
  {
    if (qword_2542992E8 != -1)
      swift_once();
    v14 = sub_235CA3708();
    __swift_project_value_buffer(v14, (uint64_t)qword_254299660);
    v18 = (os_log_t)sub_235CA36FC();
    v15 = sub_235CA3930();
    if (os_log_type_enabled(v18, v15))
    {
      v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_235C5E000, v18, v15, "Response requestId does not match current requestId", v16, 2u);
      MEMORY[0x23B7DE144](v16, -1, -1);
    }

  }
}

void sub_235C8E6BC(uint64_t a1, NSObject *a2, char *a3, void *a4, unsigned int *a5, char a6)
{
  uint64_t v6;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  BOOL v17;
  uint64_t v18;
  os_log_type_t v19;
  uint8_t *v20;
  uint64_t v21;
  os_log_t v22;

  v13 = sub_235CA3444();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v21 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = *(_QWORD *)(v6 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId) == a1
     && *(_QWORD *)(v6 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId + 8) == (_QWORD)a2;
  if (v17 || (sub_235CA3B88() & 1) != 0)
  {
    (*(void (**)(char *, _QWORD, uint64_t))(v14 + 104))(v16, *a5, v13);
    sub_235C8C44C((uint64_t)v16, a1, a2, 0, a3, a4, a6 & 1);
    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  }
  else
  {
    if (qword_2542992E8 != -1)
      swift_once();
    v18 = sub_235CA3708();
    __swift_project_value_buffer(v18, (uint64_t)qword_254299660);
    v22 = (os_log_t)sub_235CA36FC();
    v19 = sub_235CA3930();
    if (os_log_type_enabled(v22, v19))
    {
      v20 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_235C5E000, v22, v19, "Response requestId does not match current requestId", v20, 2u);
      MEMORY[0x23B7DE144](v20, -1, -1);
    }

  }
}

void sub_235C8E890(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v4;
  uint64_t v5;
  BOOL v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  os_log_type_t v22;
  uint8_t *v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  NSObject *v27;

  if (a3
    && ((v5 = v4, *(_QWORD *)(v4 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId) == a2)
      ? (v8 = *(_QWORD *)(v4 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_requestId + 8) == a3)
      : (v8 = 0),
        v8 || (sub_235CA3B88() & 1) != 0))
  {
    if (qword_2542992E8 != -1)
      swift_once();
    v9 = sub_235CA3708();
    __swift_project_value_buffer(v9, (uint64_t)qword_254299660);
    v10 = sub_235CA36FC();
    v11 = sub_235CA3924();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_235C5E000, v10, v11, "Completed local dictation recognition", v12, 2u);
      MEMORY[0x23B7DE144](v12, -1, -1);
    }

    MEMORY[0x24BDAC7A8](v13);
    v14 = objc_allocWithZone((Class)sub_235CA2DCC());
    v15 = sub_235CA2DC0();
    if (v15)
    {
      v16 = (void *)v15;
      __swift_project_boxed_opaque_existential_1((_QWORD *)(v5 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_messagePublisher), *(_QWORD *)(v5 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_messagePublisher + 24));
      sub_235CA33B4();
      v17 = *(void **)(v5 + OBJC_IVAR____TtC9ASRBridge31SpeechRecognizerResponseHandler_serviceHelper);
      if ((objc_msgSend(v17, sel_respondsToSelector_, sel_didCompleteRecognitionWithError_secureOfflineOnlyRecognition_sessionUUID_statistics_) & 1) != 0)
      {
        v18 = *(void **)(v5 + OBJC_IVAR____TtC9ASRBridge40DictationSpeechRecognizerResponseHandler_dictationOptions);
        swift_unknownObjectRetain();
        v19 = objc_msgSend(v18, sel_secureOfflineOnly);
        if (a4)
          a4 = (void *)sub_235CA2724();
        v20 = (void *)sub_235CA37E0();
        if (a1)
          a1 = (void *)sub_235CA378C();
        objc_msgSend(v17, sel_didCompleteRecognitionWithError_secureOfflineOnlyRecognition_sessionUUID_statistics_, a4, v19, v20, a1);

        swift_unknownObjectRelease();
      }
      else
      {

      }
    }
    else
    {
      v24 = sub_235CA36FC();
      v25 = sub_235CA3930();
      if (os_log_type_enabled(v24, v25))
      {
        v26 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v26 = 0;
        _os_log_impl(&dword_235C5E000, v24, v25, "Could not create EndDictationRequestMessage msg", v26, 2u);
        MEMORY[0x23B7DE144](v26, -1, -1);
      }

    }
  }
  else
  {
    if (qword_2542992E8 != -1)
      swift_once();
    v21 = sub_235CA3708();
    __swift_project_value_buffer(v21, (uint64_t)qword_254299660);
    v27 = sub_235CA36FC();
    v22 = sub_235CA3930();
    if (os_log_type_enabled(v27, v22))
    {
      v23 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v23 = 0;
      _os_log_impl(&dword_235C5E000, v27, v22, "Response requestId does not match current requestId", v23, 2u);
      MEMORY[0x23B7DE144](v23, -1, -1);
    }

  }
}

unint64_t sub_235C8EC70(uint64_t a1)
{
  return sub_235C8EC94(a1, &qword_256377A58);
}

unint64_t sub_235C8EC7C(uint64_t a1)
{
  return sub_235C8EC94(a1, &qword_256377A78);
}

unint64_t sub_235C8EC88(uint64_t a1)
{
  return sub_235C8EC94(a1, qword_254299440);
}

unint64_t sub_235C8EC94(uint64_t a1, uint64_t *a2)
{
  _QWORD *v3;
  uint64_t v4;
  void **v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  unint64_t result;
  char v11;
  uint64_t *v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(a2);
  v3 = (_QWORD *)sub_235CA3B1C();
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  swift_retain();
  v5 = (void **)(a1 + 48);
  while (1)
  {
    v6 = (uint64_t)*(v5 - 2);
    v7 = (uint64_t)*(v5 - 1);
    v8 = *v5;
    swift_bridgeObjectRetain();
    v9 = v8;
    result = sub_235C9BACC(v6, v7);
    if ((v11 & 1) != 0)
      break;
    *(_QWORD *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v12 = (uint64_t *)(v3[6] + 16 * result);
    *v12 = v6;
    v12[1] = v7;
    *(_QWORD *)(v3[7] + 8 * result) = v9;
    v13 = v3[2];
    v14 = __OFADD__(v13, 1);
    v15 = v13 + 1;
    if (v14)
      goto LABEL_11;
    v3[2] = v15;
    v5 += 3;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_235C8EDA8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t result;
  char v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;
  _QWORD v22[2];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_256377A68);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(_QWORD *)(a1 + 16))
  {
    v7 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_256377A70);
  v6 = sub_235CA3B1C();
  v7 = (_QWORD *)v6;
  v8 = *(_QWORD *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  v9 = *(int *)(v2 + 48);
  v10 = v6 + 64;
  v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v22[1] = a1;
  v12 = a1 + v11;
  v13 = *(_QWORD *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_235C987F8(v12, (uint64_t)v5, &qword_256377A68);
    result = sub_235C9BB30((uint64_t)v5);
    if ((v15 & 1) != 0)
      break;
    v16 = result;
    *(_QWORD *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v17 = v7[6];
    v18 = sub_235CA3498();
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 32))(v17 + *(_QWORD *)(*(_QWORD *)(v18 - 8) + 72) * v16, v5, v18);
    *(_QWORD *)(v7[7] + 8 * v16) = *(_QWORD *)&v5[v9];
    v19 = v7[2];
    v20 = __OFADD__(v19, 1);
    v21 = v19 + 1;
    if (v20)
      goto LABEL_11;
    v7[2] = v21;
    v12 += v13;
    if (!--v8)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_235C8EF3C(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  unint64_t result;
  char v9;
  uint64_t *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_256377A60);
  v2 = (_QWORD *)sub_235CA3B1C();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (_BYTE *)(a1 + 48);
  while (1)
  {
    v5 = *((_QWORD *)v4 - 2);
    v6 = *((_QWORD *)v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    result = sub_235C9BACC(v5, v6);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v10 = (uint64_t *)(v2[6] + 16 * result);
    *v10 = v5;
    v10[1] = v6;
    *(_BYTE *)(v2[7] + result) = v7;
    v11 = v2[2];
    v12 = __OFADD__(v11, 1);
    v13 = v11 + 1;
    if (v12)
      goto LABEL_11;
    v4 += 24;
    v2[2] = v13;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_235C8F04C(uint64_t a1)
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
  unint64_t result;
  char v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  char v22;
  __int128 v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;
  _QWORD v27[2];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254299308);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(_QWORD *)(a1 + 16))
  {
    v7 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_254299438);
  v6 = sub_235CA3B1C();
  v7 = (_QWORD *)v6;
  v8 = *(_QWORD *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  v9 = &v5[*(int *)(v2 + 48)];
  v10 = v6 + 64;
  v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v27[1] = a1;
  v12 = a1 + v11;
  v13 = *(_QWORD *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_235C987F8(v12, (uint64_t)v5, &qword_254299308);
    result = sub_235C9BC90((uint64_t)v5);
    if ((v15 & 1) != 0)
      break;
    v16 = result;
    *(_QWORD *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v17 = v7[6];
    v18 = type metadata accessor for CacheKey();
    result = sub_235C9883C((uint64_t)v5, v17 + *(_QWORD *)(*(_QWORD *)(v18 - 8) + 72) * v16);
    v19 = v7[7] + 56 * v16;
    v20 = v9[16];
    v21 = *((_QWORD *)v9 + 3);
    v22 = v9[32];
    v23 = *(_OWORD *)(v9 + 40);
    *(_OWORD *)v19 = *(_OWORD *)v9;
    *(_BYTE *)(v19 + 16) = v20;
    *(_QWORD *)(v19 + 24) = v21;
    *(_BYTE *)(v19 + 32) = v22;
    *(_OWORD *)(v19 + 40) = v23;
    v24 = v7[2];
    v25 = __OFADD__(v24, 1);
    v26 = v24 + 1;
    if (v25)
      goto LABEL_11;
    v7[2] = v26;
    v12 += v13;
    if (!--v8)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_235C8F204(uint64_t a1, uint64_t *a2)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(a2);
  v3 = (_QWORD *)sub_235CA3B1C();
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  swift_retain();
  v5 = (uint64_t *)(a1 + 48);
  while (1)
  {
    v6 = *(v5 - 2);
    v7 = *(v5 - 1);
    v8 = *v5;
    swift_bridgeObjectRetain();
    swift_retain();
    result = sub_235C9BACC(v6, v7);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v6;
    v11[1] = v7;
    *(_QWORD *)(v3[7] + 8 * result) = v8;
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v3[2] = v14;
    v5 += 3;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

BOOL sub_235C8F328(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t AsrBridge.__allocating_init(_:_:_:_:_:)(void *a1, void *a2, uint64_t a3, void *a4, void *a5, uint64_t a6)
{
  uint64_t v12;

  swift_allocObject();
  v12 = sub_235C97920(a1, a2, a3, a4, a5, a6);
  swift_unknownObjectRelease();

  return v12;
}

uint64_t AsrBridge.init(_:_:_:_:_:)(void *a1, void *a2, uint64_t a3, void *a4, void *a5, uint64_t a6)
{
  uint64_t v7;

  v7 = sub_235C97920(a1, a2, a3, a4, a5, a6);
  swift_unknownObjectRelease();

  return v7;
}

uint64_t sub_235C8F408(char a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  void (*v8)(char *, uint64_t, uint64_t);
  void (*v9)(char *, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;

  v3 = sub_235CA360C();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_235CA29C4();
  sub_235CA3660();
  sub_235CA291C();
  sub_235CA3660();
  sub_235CA312C();
  sub_235CA3660();
  sub_235CA30A8();
  sub_235CA3660();
  sub_235CA3024();
  sub_235CA3660();
  sub_235CA33F0();
  sub_235CA3660();
  sub_235CA28F8();
  sub_235CA3660();
  sub_235CA33E4();
  sub_235CA3660();
  v7 = *MEMORY[0x24BEA6148];
  v8 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 104);
  v8(v6, v7, v3);
  sub_235CA2D48();
  type metadata accessor for AsrRequestProcessor();
  sub_235CA3588();
  v9 = *(void (**)(char *, uint64_t))(v4 + 8);
  v9(v6, v3);
  v8(v6, v7, v3);
  sub_235CA2FE8();
  sub_235CA3588();
  v9(v6, v3);
  v8(v6, v7, v3);
  sub_235CA3018();
  sub_235CA3588();
  v9(v6, v3);
  v8(v6, v7, v3);
  sub_235CA3204();
  sub_235CA3588();
  v9(v6, v3);
  v8(v6, v7, v3);
  sub_235CA3108();
  sub_235CA3588();
  v9(v6, v3);
  v10 = *MEMORY[0x24BEA6170];
  v8(v6, v10, v3);
  sub_235CA33D8();
  sub_235CA3588();
  v9(v6, v3);
  v8(v6, v10, v3);
  sub_235CA30D8();
  sub_235CA3588();
  v9(v6, v3);
  v8(v6, v10, v3);
  sub_235CA2F70();
  sub_235CA3588();
  v9(v6, v3);
  v8(v6, v10, v3);
  sub_235CA2FB8();
  sub_235CA3588();
  v9(v6, v3);
  v8(v6, v10, v3);
  sub_235CA2EEC();
  sub_235CA3588();
  v9(v6, v3);
  v8(v6, v10, v3);
  sub_235CA2910();
  sub_235CA3588();
  v9(v6, v3);
  v8(v6, v10, v3);
  sub_235CA2940();
  sub_235CA3588();
  v9(v6, v3);
  v8(v6, *MEMORY[0x24BEA6168], v3);
  sub_235CA28C8();
  sub_235CA3588();
  v9(v6, v3);
  v11 = *MEMORY[0x24BEA6158];
  v8(v6, v11, v3);
  sub_235CA2F7C();
  sub_235CA3588();
  v9(v6, v3);
  v8(v6, v11, v3);
  sub_235CA30B4();
  sub_235CA3588();
  v9(v6, v3);
  v8(v6, v10, v3);
  sub_235CA30C0();
  sub_235CA3588();
  v9(v6, v3);
  v8(v6, v10, v3);
  sub_235CA309C();
  sub_235CA3588();
  result = ((uint64_t (*)(char *, uint64_t))v9)(v6, v3);
  if (*(_BYTE *)(v1 + qword_2542996C8) == 1)
  {
    v8(v6, v10, v3);
    sub_235CA31F8();
    sub_235CA3588();
    result = ((uint64_t (*)(char *, uint64_t))v9)(v6, v3);
  }
  if ((a1 & 1) != 0)
  {
    sub_235C71624(0, (unint64_t *)&unk_256377720);
    sub_235CA3684();
    sub_235C71624(0, &qword_256377A40);
    sub_235CA3684();
    sub_235C71624(0, &qword_256377A38);
    result = sub_235CA3684();
    if (*(_BYTE *)(v1 + qword_254299690) == 1)
    {
      sub_235C71624(0, &qword_256377A48);
      sub_235CA3684();
      v8(v6, v10, v3);
      sub_235CA2C40();
      sub_235CA3588();
      return ((uint64_t (*)(char *, uint64_t))v9)(v6, v3);
    }
  }
  return result;
}

uint64_t (*sub_235C8FB40())()
{
  swift_retain();
  return sub_235C987F4;
}

uint64_t (*sub_235C8FB70())()
{
  swift_retain();
  return sub_235C987F0;
}

uint64_t (*sub_235C8FBA0())()
{
  swift_retain();
  return sub_235C987EC;
}

uint64_t (*sub_235C8FBD0())()
{
  swift_retain();
  return sub_235C987E8;
}

uint64_t (*sub_235C8FC00())()
{
  swift_retain();
  return sub_235C987E4;
}

uint64_t (*sub_235C8FC30())()
{
  swift_retain();
  return sub_235C987E0;
}

uint64_t (*sub_235C8FC60())()
{
  swift_retain();
  return sub_235C987DC;
}

uint64_t (*sub_235C8FC90())()
{
  swift_retain();
  return sub_235C987D8;
}

void (*sub_235C8FCC0())(void *a1)
{
  swift_retain();
  return sub_235C987A0;
}

void (*sub_235C8FCF0())(void *a1)
{
  swift_retain();
  return sub_235C98744;
}

void (*sub_235C8FD20())(void *)
{
  swift_retain();
  return sub_235C98740;
}

uint64_t (*sub_235C8FD50())(void *)
{
  swift_retain();
  return sub_235C9873C;
}

uint64_t (*sub_235C8FD80())(void *)
{
  swift_retain();
  return sub_235C98738;
}

void (*sub_235C8FDB0())(void *)
{
  swift_retain();
  return sub_235C98734;
}

void (*sub_235C8FDE0())(void *)
{
  swift_retain();
  return sub_235C98730;
}

void (*sub_235C8FE10())(void *)
{
  swift_retain();
  return sub_235C9872C;
}

void (*sub_235C8FE40())(void *)
{
  swift_retain();
  return sub_235C98728;
}

void (*sub_235C8FE70())(void *)
{
  swift_retain();
  return sub_235C98724;
}

void (*sub_235C8FEA0())(void *)
{
  swift_retain();
  return sub_235C98720;
}

void (*sub_235C8FED0())(void *)
{
  swift_retain();
  return sub_235C9871C;
}

void (*sub_235C8FF00())(void *)
{
  swift_retain();
  return sub_235C98718;
}

void (*sub_235C8FF30())(void *)
{
  swift_retain();
  return sub_235C98714;
}

void (*sub_235C8FF60())(void *)
{
  swift_retain();
  return sub_235C98710;
}

void (*sub_235C8FF90())(void *)
{
  swift_retain();
  return sub_235C9870C;
}

void sub_235C8FFC0()
{
  uint64_t v0;
  os_log_type_t v1;
  uint8_t *v2;
  NSObject *oslog;

  if (qword_2542992E8 != -1)
    swift_once();
  v0 = sub_235CA3708();
  __swift_project_value_buffer(v0, (uint64_t)qword_254299660);
  oslog = sub_235CA36FC();
  v1 = sub_235CA3924();
  if (os_log_type_enabled(oslog, v1))
  {
    v2 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_235C5E000, oslog, v1, "ASRBridge no-op for StartChildSpeechRequestMessage", v2, 2u);
    MEMORY[0x23B7DE144](v2, -1, -1);
  }

}

void (*sub_235C9008C())()
{
  swift_retain();
  return sub_235C98704;
}

void (*sub_235C900BC())(void *)
{
  swift_retain();
  return sub_235C986EC;
}

uint64_t (*sub_235C900EC())()
{
  swift_retain();
  return sub_235C98700;
}

uint64_t (*sub_235C9011C())()
{
  swift_retain();
  return sub_235C986FC;
}

uint64_t (*sub_235C9014C())()
{
  swift_retain();
  return sub_235C986F8;
}

uint64_t (*sub_235C9017C())()
{
  swift_retain();
  return sub_235C986F4;
}

void (*sub_235C901AC())(void *)
{
  swift_retain();
  return sub_235C986F0;
}

uint64_t sub_235C901DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  char *v6;
  char *v7;
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
  _BYTE *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _BYTE *v28;
  uint64_t v29;
  _BYTE *v30;
  char *v31;
  uint64_t v32;
  unsigned int (*v33)(_BYTE *, uint64_t, uint64_t);
  unsigned int v34;
  unsigned int v35;
  uint64_t v36;
  _BYTE *v37;
  uint64_t v38;
  void (*v39)(_BYTE *, uint64_t);
  _BYTE *v40;
  uint64_t v41;
  uint64_t v42;
  _BYTE *v43;
  unsigned int (*v44)(_QWORD, _QWORD, _QWORD);
  os_log_t v45;
  int v46;
  uint64_t v47;
  uint64_t v48;
  NSObject *v49;
  os_log_type_t v50;
  uint8_t *v51;
  _BYTE *v52;
  uint64_t v53;
  uint64_t v54;
  _BYTE *v55;
  void (**v56)(_QWORD, _QWORD, _QWORD);
  _BYTE *v57;
  NSObject *v58;
  uint64_t v59;
  _BYTE *v60;
  unint64_t v61;
  uint64_t v62;
  _BYTE *v63;
  uint64_t v64;
  uint64_t v65;
  id v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t *v82;
  uint64_t v83;
  void *v84;
  _BYTE *v85;
  uint64_t v86;
  unint64_t v87;
  _BYTE *v88;
  uint64_t v89;
  uint64_t v90;
  unint64_t v91;
  unint64_t v92;
  os_log_t v93;
  _BYTE *v94;
  NSObject *v96;
  os_log_type_t v97;
  uint8_t *v98;
  _BYTE *v99;
  unsigned __int8 v100;
  _BYTE v101[4];
  int v102;
  uint64_t v103;
  _BYTE *v104;
  int v105;
  uint64_t v106;
  _BYTE *v107;
  uint64_t v108;
  _BYTE *v109;
  char *v110;
  _BYTE *v111;
  _BYTE *v112;
  uint64_t v113;
  os_log_t v114;
  unsigned int (*v115)(_BYTE *, uint64_t, uint64_t);
  _BYTE *v116;
  void (*v117)(_BYTE *, uint64_t, uint64_t);
  _BYTE *v118;
  _BYTE *v119;
  void (**v120)(_QWORD, _QWORD, _QWORD);
  char *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  _QWORD v125[3];
  ValueMetadata *v126;
  _UNKNOWN **v127;
  uint64_t v128[5];
  uint64_t v129;
  _BYTE v130[40];
  __int128 v131;
  uint64_t v132;
  uint64_t v133[4];
  uint64_t v134;

  v106 = a3;
  v7 = v6;
  v105 = a6;
  v123 = a2;
  v124 = a5;
  v108 = a4;
  v113 = a1;
  v122 = sub_235CA3708();
  v120 = *(void (***)(_QWORD, _QWORD, _QWORD))(v122 - 8);
  MEMORY[0x24BDAC7A8](v122);
  v119 = &v101[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542989B0);
  MEMORY[0x24BDAC7A8](v9);
  v112 = &v101[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v11 = sub_235CA3498();
  v114 = *(os_log_t *)(v11 - 8);
  v115 = (unsigned int (*)(_BYTE *, uint64_t, uint64_t))v11;
  v12 = MEMORY[0x24BDAC7A8](v11);
  v107 = &v101[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v12);
  v109 = &v101[-v14];
  v15 = sub_235CA2790();
  v16 = *(_QWORD *)(v15 - 8);
  v17 = MEMORY[0x24BDAC7A8](v15);
  v118 = &v101[-((v18 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v17);
  v116 = &v101[-v19];
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542989A0);
  MEMORY[0x24BDAC7A8](v20);
  v22 = &v101[-((v21 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_254299050);
  v24 = MEMORY[0x24BDAC7A8](v23);
  v111 = &v101[-((v25 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v26 = MEMORY[0x24BDAC7A8](v24);
  v28 = &v101[-v27];
  MEMORY[0x24BDAC7A8](v26);
  v30 = &v101[-v29];
  v121 = v7;
  v31 = &v7[qword_2542996B0];
  swift_beginAccess();
  v117 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v16 + 16);
  v117(v30, v124, v15);
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v30, 0, 1, v15);
  v32 = (uint64_t)&v22[*(int *)(v20 + 48)];
  sub_235C987F8((uint64_t)v31, (uint64_t)v22, &qword_254299050);
  sub_235C987F8((uint64_t)v30, v32, &qword_254299050);
  v33 = *(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v16 + 48);
  v134 = v15;
  v34 = v33(v22, 1, v15);
  v110 = v31;
  if (v34 == 1)
  {
    sub_235C76BD8((uint64_t)v30, &qword_254299050);
    v35 = v33((_BYTE *)v32, 1, v134);
    v36 = (uint64_t)v121;
    if (v35 == 1)
    {
      sub_235C76BD8((uint64_t)v22, &qword_254299050);
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  sub_235C987F8((uint64_t)v22, (uint64_t)v28, &qword_254299050);
  if (v33((_BYTE *)v32, 1, v134) == 1)
  {
    sub_235C76BD8((uint64_t)v30, &qword_254299050);
    (*(void (**)(_BYTE *, uint64_t))(v16 + 8))(v28, v134);
    v36 = (uint64_t)v121;
LABEL_6:
    sub_235C76BD8((uint64_t)v22, &qword_2542989A0);
LABEL_14:
    v115 = v33;
    v53 = v122;
    if (qword_2542992E8 != -1)
      swift_once();
    v54 = __swift_project_value_buffer(v53, (uint64_t)qword_254299660);
    v55 = v119;
    v56 = v120;
    ((void (**)(_BYTE *, uint64_t, uint64_t))v120)[2](v119, v54, v53);
    v57 = v118;
    v117(v118, v124, v134);
    swift_bridgeObjectRetain_n();
    swift_retain_n();
    v58 = sub_235CA36FC();
    LODWORD(v124) = sub_235CA3930();
    if (os_log_type_enabled(v58, (os_log_type_t)v124))
    {
      v114 = v58;
      v59 = swift_slowAlloc();
      v112 = (_BYTE *)swift_slowAlloc();
      v133[0] = (uint64_t)v112;
      *(_DWORD *)v59 = 136315650;
      v60 = v111;
      sub_235C987F8((uint64_t)v110, (uint64_t)v111, &qword_254299050);
      if (v115(v60, 1, v134))
      {
        sub_235C76BD8((uint64_t)v60, &qword_254299050);
        v61 = 0xE300000000000000;
        v62 = 7104878;
      }
      else
      {
        v85 = v116;
        v86 = v134;
        v117(v116, (uint64_t)v60, v134);
        sub_235C76BD8((uint64_t)v60, &qword_254299050);
        v62 = sub_235CA2760();
        v61 = v87;
        (*(void (**)(_BYTE *, uint64_t))(v16 + 8))(v85, v86);
      }
      *(_QWORD *)&v131 = sub_235C944B8(v62, v61, v133);
      sub_235CA3A14();
      swift_release_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v59 + 12) = 2080;
      sub_235C69C18((unint64_t *)&unk_254299040, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
      v88 = v118;
      v89 = v134;
      v90 = sub_235CA3B64();
      *(_QWORD *)&v131 = sub_235C944B8(v90, v91, v133);
      sub_235CA3A14();
      swift_bridgeObjectRelease();
      (*(void (**)(_BYTE *, uint64_t))(v16 + 8))(v88, v89);
      *(_WORD *)(v59 + 22) = 2080;
      v92 = v123;
      swift_bridgeObjectRetain();
      *(_QWORD *)&v131 = sub_235C944B8(v113, v92, v133);
      sub_235CA3A14();
      swift_bridgeObjectRelease_n();
      v93 = v114;
      _os_log_impl(&dword_235C5E000, v114, (os_log_type_t)v124, "Request does not belong to current session id: %s, request session id: %s for request id: %s", (uint8_t *)v59, 0x20u);
      v36 = (uint64_t)v112;
      swift_arrayDestroy();
      MEMORY[0x23B7DE144](v36, -1, -1);
      MEMORY[0x23B7DE144](v59, -1, -1);

      ((void (*)(_BYTE *, uint64_t))v120[1])(v119, v122);
    }
    else
    {
      swift_release_n();
      (*(void (**)(_BYTE *, uint64_t))(v16 + 8))(v57, v134);

      swift_bridgeObjectRelease_n();
      ((void (*)(_BYTE *, uint64_t))v56[1])(v55, v53);
    }
    sub_235C97D5C();
    swift_allocError();
    *v94 = 0;
    goto LABEL_25;
  }
  v37 = v116;
  v38 = v134;
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v16 + 32))(v116, v32, v134);
  sub_235C69C18(&qword_254299038, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA98]);
  LODWORD(v104) = sub_235CA37D4();
  v39 = *(void (**)(_BYTE *, uint64_t))(v16 + 8);
  v40 = v37;
  v36 = (uint64_t)v121;
  v39(v40, v38);
  sub_235C76BD8((uint64_t)v30, &qword_254299050);
  v39(v28, v38);
  sub_235C76BD8((uint64_t)v22, &qword_254299050);
  if ((v104 & 1) == 0)
    goto LABEL_14;
LABEL_8:
  v41 = v36 + qword_2542996D8;
  swift_beginAccess();
  v42 = v41;
  v43 = v112;
  sub_235C987F8(v42, (uint64_t)v112, &qword_2542989B0);
  v45 = v114;
  v44 = (unsigned int (*)(_QWORD, _QWORD, _QWORD))v115;
  v46 = ((uint64_t (*)(_BYTE *, uint64_t, _QWORD))v114[6].isa)(v43, 1, v115);
  v47 = v36;
  v48 = v122;
  if (v46 == 1)
  {
    sub_235C76BD8((uint64_t)v43, &qword_2542989B0);
    if (qword_2542992E8 != -1)
      swift_once();
    __swift_project_value_buffer(v48, (uint64_t)qword_254299660);
    v49 = sub_235CA36FC();
    v50 = sub_235CA3930();
    v36 = v50;
    if (os_log_type_enabled(v49, v50))
    {
      v51 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v51 = 0;
      _os_log_impl(&dword_235C5E000, v49, (os_log_type_t)v36, "UserId has not been set for current session", v51, 2u);
      MEMORY[0x23B7DE144](v51, -1, -1);
    }

    sub_235C97D5C();
    swift_allocError();
    *v52 = 1;
LABEL_25:
    swift_willThrow();
    return v36;
  }
  v63 = v109;
  ((void (*)(_BYTE *, _BYTE *, _QWORD))v45[4].isa)(v109, v43, v44);
  v64 = v47 + qword_2542996A0;
  swift_beginAccess();
  sub_235C987F8(v64, (uint64_t)&v131, &qword_2542990A8);
  if (v132)
  {
    sub_235C7131C(&v131, (uint64_t)v133);
    v117(v116, v124, v134);
    ((void (*)(_BYTE *, _BYTE *, unsigned int (*)(_QWORD, _QWORD, _QWORD)))v45[2].isa)(v107, v63, v44);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v134 = sub_235CA369C();
    v124 = v65;
    sub_235CA3678();
    v122 = sub_235CA366C();
    sub_235C71390((uint64_t)v133, (uint64_t)v130);
    __swift_project_boxed_opaque_existential_1(v133, v133[3]);
    sub_235CA345C();
    sub_235C71390(v47 + qword_254299318, (uint64_t)v128);
    v66 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE60898]), sel_initWithDelegate_, 0);
    v110 = *(char **)(v47 + qword_2542996A8);
    v67 = v110;
    v68 = *(_QWORD *)(v47 + qword_254299330);
    v69 = *(_QWORD *)(v47 + qword_254299328);
    v119 = *(_BYTE **)(v47 + qword_2542996B8);
    v120 = (void (**)(_QWORD, _QWORD, _QWORD))v66;
    v112 = *(_BYTE **)(v47 + qword_2542996B8 + 8);
    v70 = *(_QWORD *)(v47 + qword_254299688);
    LODWORD(v118) = *(unsigned __int8 *)(v47 + qword_254299698);
    LODWORD(v117) = *(unsigned __int8 *)(v47 + qword_254299690);
    LODWORD(v111) = *(unsigned __int8 *)(v47 + qword_254299320);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v121 = v67;
    swift_retain();
    swift_retain();
    _s9ASRBridge9AsrBridgeC27configuredMaxEagerRCAllowedSivgZ_0();
    v103 = v71;
    v126 = &type metadata for IdentityFeatureFlags;
    v72 = sub_235C97DA0();
    v127 = (_UNKNOWN **)v72;
    LOBYTE(v125[0]) = 1;
    v102 = sub_235CA279C();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v125);
    v126 = &type metadata for IdentityFeatureFlags;
    v127 = (_UNKNOWN **)v72;
    LOBYTE(v125[0]) = 0;
    LOBYTE(v72) = sub_235CA279C();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v125);
    v73 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v128, v128[3]);
    v104 = v101;
    MEMORY[0x24BDAC7A8](v73);
    v75 = (uint64_t *)&v101[-((v74 + 15) & 0xFFFFFFFFFFFFFFF0)];
    (*(void (**)(uint64_t *))(v76 + 16))(v75);
    v77 = *v75;
    v78 = type metadata accessor for MyriadDecisionMonitor();
    v126 = (ValueMetadata *)v78;
    v127 = &off_25070C308;
    v125[0] = v77;
    type metadata accessor for AsrRequestProcessor();
    v79 = swift_allocObject();
    v80 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v125, v78);
    MEMORY[0x24BDAC7A8](v80);
    v82 = (uint64_t *)&v101[-((v81 + 15) & 0xFFFFFFFFFFFFFFF0)];
    (*(void (**)(uint64_t *))(v83 + 16))(v82);
    v100 = v72 & 1;
    v84 = v120;
    v36 = sub_235C97DE4(v106, v108, (uint64_t)v116, v113, v123, (uint64_t)v107, v134, v124, (uint64_t)&v131, v122, (uint64_t)v130, (uint64_t)&v129, *v82, v120, v110, v68, v69, (uint64_t)v119, (uint64_t)v112,
            v105 & 1,
            v70,
            (char)v118,
            v117,
            v111,
            v103,
            v102 & 1,
            v100,
            v79);

    swift_release();
    swift_release();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v125);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v128);
    ((void (*)(_BYTE *, unsigned int (*)(_BYTE *, uint64_t, uint64_t)))v114[1].isa)(v109, v115);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v133);
  }
  else
  {
    sub_235C76BD8((uint64_t)&v131, &qword_2542990A8);
    if (qword_2542992E8 != -1)
      swift_once();
    __swift_project_value_buffer(v48, (uint64_t)qword_254299660);
    v96 = sub_235CA36FC();
    v97 = sub_235CA3930();
    v36 = v97;
    if (os_log_type_enabled(v96, v97))
    {
      v98 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v98 = 0;
      _os_log_impl(&dword_235C5E000, v96, (os_log_type_t)v36, "Unable to find SessionState to pass to AsrRequestProcessor", v98, 2u);
      MEMORY[0x23B7DE144](v98, -1, -1);
    }

    sub_235C97D5C();
    swift_allocError();
    *v99 = 2;
    swift_willThrow();
    ((void (*)(_BYTE *, unsigned int (*)(_QWORD, _QWORD, _QWORD)))v45[1].isa)(v63, v44);
  }
  return v36;
}

uint64_t sub_235C90FAC(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  void (**v12)(char *, uint64_t);
  uint64_t v13;
  char *v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  os_log_type_t v18;
  _BOOL4 v19;
  uint64_t v20;
  uint8_t *v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint8_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void (**v32)(char *, uint64_t);
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  id v37;
  id v38;
  NSObject *v39;
  os_log_type_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  uint64_t v50;
  _QWORD v52[2];
  char *v53;
  void (**v54)(char *, uint64_t);
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61[5];
  uint64_t v62[3];
  uint64_t v63;

  v2 = sub_235CA3708();
  v59 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)v52 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542989B0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)v52 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_254299050);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)v52 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_235CA2790();
  v12 = *(void (***)(char *, uint64_t))(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)v52 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2542992E8 != -1)
    swift_once();
  v58 = v4;
  v15 = __swift_project_value_buffer(v2, (uint64_t)qword_254299660);
  v16 = a1;
  v55 = v15;
  v17 = sub_235CA36FC();
  v18 = sub_235CA3924();
  v19 = os_log_type_enabled(v17, v18);
  v60 = v11;
  v57 = v2;
  if (v19)
  {
    v20 = swift_slowAlloc();
    v54 = v12;
    v21 = (uint8_t *)v20;
    v22 = swift_slowAlloc();
    v62[0] = v22;
    *(_DWORD *)v21 = 136315138;
    v52[1] = v21 + 4;
    sub_235CA33A8();
    sub_235C69C18((unint64_t *)&unk_254299040, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
    v23 = sub_235CA3B64();
    v53 = v7;
    v25 = v24;
    v54[1](v14, v60);
    v61[0] = sub_235C944B8(v23, v25, v62);
    v11 = v60;
    sub_235CA3A14();

    v7 = v53;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_235C5E000, v17, v18, "handling session started for session id: %s", v21, 0xCu);
    swift_arrayDestroy();
    v26 = v22;
    v2 = v57;
    MEMORY[0x23B7DE144](v26, -1, -1);
    v27 = v21;
    v12 = v54;
    MEMORY[0x23B7DE144](v27, -1, -1);

  }
  else
  {

  }
  sub_235CA33A8();
  ((void (*)(char *, _QWORD, uint64_t, uint64_t))v12[7])(v10, 0, 1, v11);
  v28 = v56;
  v29 = v56 + qword_2542996B0;
  swift_beginAccess();
  sub_235C9874C((uint64_t)v10, v29, &qword_254299050);
  swift_endAccess();
  sub_235CA29B8();
  v30 = sub_235CA3498();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 56))(v7, 0, 1, v30);
  v31 = v28 + qword_2542996D8;
  swift_beginAccess();
  sub_235C9874C((uint64_t)v7, v31, &qword_2542989B0);
  swift_endAccess();
  sub_235CA3690();
  __swift_project_boxed_opaque_existential_1(v62, v63);
  sub_235CA33A8();
  sub_235CA3474();
  v32 = (void (**)(char *, uint64_t))v12[1];
  ((void (*)(char *, uint64_t))v32)(v14, v11);
  v33 = v28 + qword_2542996A0;
  swift_beginAccess();
  sub_235C9874C((uint64_t)v61, v33, &qword_2542990A8);
  swift_endAccess();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v62);
  if (*(_BYTE *)(v28 + qword_254299320) == 1)
  {
    sub_235CA33A8();
    v34 = sub_235CA33C0();
    sub_235C94094((uint64_t)v14, v34, v35);
    swift_bridgeObjectRelease();
    ((void (*)(char *, uint64_t))v32)(v14, v60);
  }
  v36 = v58;
  (*(void (**)(char *, uint64_t, uint64_t))(v59 + 16))(v58, v55, v2);
  v37 = v16;
  swift_retain_n();
  v38 = v37;
  v39 = sub_235CA36FC();
  v40 = sub_235CA3924();
  if (os_log_type_enabled(v39, v40))
  {
    v41 = swift_slowAlloc();
    v54 = v32;
    v42 = v41;
    v55 = swift_slowAlloc();
    v61[0] = v55;
    *(_DWORD *)v42 = 136315394;
    sub_235C987F8(v33, (uint64_t)v62, &qword_2542990A8);
    v43 = v63;
    sub_235C76BD8((uint64_t)v62, &qword_2542990A8);
    if (v43)
      v44 = 0;
    else
      v44 = 544501582;
    if (v43)
      v45 = 0xE000000000000000;
    else
      v45 = 0xE400000000000000;
    v62[0] = sub_235C944B8(v44, v45, v61);
    sub_235CA3A14();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v42 + 12) = 2080;
    sub_235CA33A8();
    sub_235C69C18((unint64_t *)&unk_254299040, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
    v46 = v60;
    v47 = sub_235CA3B64();
    v49 = v48;
    ((void (*)(char *, uint64_t))v54)(v14, v46);
    v62[0] = sub_235C944B8(v47, v49, v61);
    sub_235CA3A14();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_235C5E000, v39, v40, "%sFound session state for session id %s", (uint8_t *)v42, 0x16u);
    v50 = v55;
    swift_arrayDestroy();
    MEMORY[0x23B7DE144](v50, -1, -1);
    MEMORY[0x23B7DE144](v42, -1, -1);

    return (*(uint64_t (**)(char *, uint64_t))(v59 + 8))(v58, v57);
  }
  else
  {

    swift_release_n();
    return (*(uint64_t (**)(char *, uint64_t))(v59 + 8))(v36, v2);
  }
}

void sub_235C916C0(void *a1)
{
  uint64_t v1;
  uint64_t v3;
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
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  void (*v23)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v24;
  unsigned int (*v25)(uint64_t, uint64_t, uint64_t);
  uint64_t v26;
  char *v27;
  char v28;
  void (*v29)(char *, uint64_t);
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  _BOOL4 v33;
  uint64_t v34;
  uint8_t *v35;
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
  void *v47;
  void *v48;
  uint64_t v49;
  id v50;
  NSObject *v51;
  os_log_type_t v52;
  uint8_t *v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  unint64_t v57;
  unint64_t v58;
  uint64_t v59;
  char *v60;
  char *v61;
  uint64_t v62;
  char *v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  _OWORD v67[2];
  uint64_t v68;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542989B0);
  MEMORY[0x24BDAC7A8](v3);
  v61 = (char *)&v59 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_235CA2790();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v63 = (char *)&v59 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542989A0);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v59 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_254299050);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v60 = (char *)&v59 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v59 - v15;
  v17 = MEMORY[0x24BDAC7A8](v14);
  v19 = (char *)&v59 - v18;
  MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)&v59 - v20;
  v62 = v1;
  v22 = v1 + qword_2542996B0;
  swift_beginAccess();
  v59 = v22;
  sub_235C987F8(v22, (uint64_t)v21, &qword_254299050);
  v64 = a1;
  sub_235CA33A8();
  v23 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56);
  v23(v19, 0, 1, v5);
  v24 = (uint64_t)&v10[*(int *)(v8 + 48)];
  sub_235C987F8((uint64_t)v21, (uint64_t)v10, &qword_254299050);
  sub_235C987F8((uint64_t)v19, v24, &qword_254299050);
  v65 = v6;
  v25 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48);
  if (v25((uint64_t)v10, 1, v5) == 1)
  {
    sub_235C76BD8((uint64_t)v19, &qword_254299050);
    sub_235C76BD8((uint64_t)v21, &qword_254299050);
    if (v25(v24, 1, v5) == 1)
    {
      sub_235C76BD8((uint64_t)v10, &qword_254299050);
LABEL_8:
      if (qword_2542992E8 != -1)
        swift_once();
      v30 = sub_235CA3708();
      __swift_project_value_buffer(v30, (uint64_t)qword_254299660);
      v31 = sub_235CA36FC();
      v32 = sub_235CA3924();
      v33 = os_log_type_enabled(v31, v32);
      v34 = v62;
      if (v33)
      {
        v35 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v35 = 0;
        _os_log_impl(&dword_235C5E000, v31, v32, "setting sessionId and sessionState to nil", v35, 2u);
        MEMORY[0x23B7DE144](v35, -1, -1);
      }

      v36 = (uint64_t)v60;
      v23(v60, 1, 1, v5);
      v37 = v59;
      swift_beginAccess();
      sub_235C9874C(v36, v37, &qword_254299050);
      swift_endAccess();
      v68 = 0;
      memset(v67, 0, sizeof(v67));
      v38 = v34 + qword_2542996A0;
      swift_beginAccess();
      sub_235C9874C((uint64_t)v67, v38, &qword_2542990A8);
      swift_endAccess();
      v39 = sub_235CA3498();
      v40 = (uint64_t)v61;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v39 - 8) + 56))(v61, 1, 1, v39);
      v41 = v34 + qword_2542996D8;
      swift_beginAccess();
      sub_235C9874C(v40, v41, &qword_2542989B0);
      swift_endAccess();
      sub_235C8F204(MEMORY[0x24BEE4AF8], &qword_256377A50);
      sub_235CA3570();
      if (*(_BYTE *)(v34 + qword_254299320) == 1)
      {
        v42 = sub_235CA33C0();
        v44 = v43;
        v45 = (uint64_t)v63;
        sub_235CA33A8();
        sub_235C9AD54(v42, v44, v45);
        v46 = qword_2542996A8;
        objc_msgSend(*(id *)(v34 + qword_2542996A8), sel_invalidate);
        v47 = *(void **)(v34 + v46);
        *(_QWORD *)(v34 + v46) = 0;

        v48 = *(void **)(v34 + qword_2542996D0);
        *(_QWORD *)(v34 + qword_2542996D0) = 0;
        swift_bridgeObjectRelease();

        (*(void (**)(uint64_t, uint64_t))(v65 + 8))(v45, v5);
      }
      return;
    }
    goto LABEL_6;
  }
  sub_235C987F8((uint64_t)v10, (uint64_t)v16, &qword_254299050);
  if (v25(v24, 1, v5) == 1)
  {
    sub_235C76BD8((uint64_t)v19, &qword_254299050);
    sub_235C76BD8((uint64_t)v21, &qword_254299050);
    (*(void (**)(char *, uint64_t))(v65 + 8))(v16, v5);
LABEL_6:
    sub_235C76BD8((uint64_t)v10, &qword_2542989A0);
    goto LABEL_14;
  }
  v26 = v65;
  v27 = v63;
  (*(void (**)(char *, uint64_t, uint64_t))(v65 + 32))(v63, v24, v5);
  sub_235C69C18(&qword_254299038, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA98]);
  v28 = sub_235CA37D4();
  v29 = *(void (**)(char *, uint64_t))(v26 + 8);
  v29(v27, v5);
  sub_235C76BD8((uint64_t)v19, &qword_254299050);
  sub_235C76BD8((uint64_t)v21, &qword_254299050);
  v29(v16, v5);
  sub_235C76BD8((uint64_t)v10, &qword_254299050);
  if ((v28 & 1) != 0)
    goto LABEL_8;
LABEL_14:
  if (qword_2542992E8 != -1)
    swift_once();
  v49 = sub_235CA3708();
  __swift_project_value_buffer(v49, (uint64_t)qword_254299660);
  v50 = v64;
  v51 = sub_235CA36FC();
  v52 = sub_235CA3930();
  if (os_log_type_enabled(v51, v52))
  {
    v53 = (uint8_t *)swift_slowAlloc();
    v54 = swift_slowAlloc();
    *(_QWORD *)&v67[0] = v54;
    *(_DWORD *)v53 = 136315138;
    v64 = v53 + 4;
    v55 = v63;
    sub_235CA33A8();
    sub_235C69C18((unint64_t *)&unk_254299040, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
    v56 = sub_235CA3B64();
    v58 = v57;
    (*(void (**)(char *, uint64_t))(v65 + 8))(v55, v5);
    v66 = sub_235C944B8(v56, v58, (uint64_t *)v67);
    sub_235CA3A14();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_235C5E000, v51, v52, "SessionId: %s is not the current session, ignoring", v53, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B7DE144](v54, -1, -1);
    MEMORY[0x23B7DE144](v53, -1, -1);

  }
  else
  {

  }
}

uint64_t sub_235C91E70(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint8_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint8_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40[5];
  uint64_t v41[4];

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542989B0);
  MEMORY[0x24BDAC7A8](v4);
  v39 = (char *)&v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254299050);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_235CA2790();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v35 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2542992E8 != -1)
    swift_once();
  v13 = sub_235CA3708();
  __swift_project_value_buffer(v13, (uint64_t)qword_254299660);
  v14 = a1;
  v15 = sub_235CA36FC();
  v16 = sub_235CA3924();
  if (os_log_type_enabled(v15, v16))
  {
    v17 = swift_slowAlloc();
    v38 = v10;
    v18 = (uint8_t *)v17;
    v36 = swift_slowAlloc();
    v41[0] = v36;
    v37 = v2;
    *(_DWORD *)v18 = 136315138;
    v35 = v18 + 4;
    sub_235CA33A8();
    sub_235C69C18((unint64_t *)&unk_254299040, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
    v19 = sub_235CA3B64();
    v20 = v9;
    v22 = v21;
    (*(void (**)(char *, uint64_t))(v38 + 8))(v12, v20);
    v40[0] = sub_235C944B8(v19, v22, v41);
    v2 = v37;
    sub_235CA3A14();

    v9 = v20;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_235C5E000, v15, v16, "Handling StartSpeechDictationSession for sessionId: %s", v18, 0xCu);
    v23 = v36;
    swift_arrayDestroy();
    MEMORY[0x23B7DE144](v23, -1, -1);
    v24 = v18;
    v10 = v38;
    MEMORY[0x23B7DE144](v24, -1, -1);

  }
  else
  {

  }
  sub_235CA33A8();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v8, 0, 1, v9);
  v25 = v10;
  v26 = v2 + qword_2542996B0;
  swift_beginAccess();
  sub_235C9874C((uint64_t)v8, v26, &qword_254299050);
  swift_endAccess();
  sub_235CA3690();
  __swift_project_boxed_opaque_existential_1(v41, v41[3]);
  sub_235CA33A8();
  sub_235CA3474();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v12, v9);
  v27 = v2 + qword_2542996A0;
  swift_beginAccess();
  sub_235C9874C((uint64_t)v40, v27, &qword_2542990A8);
  swift_endAccess();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v41);
  v28 = sub_235CA3114();
  v29 = (uint64_t *)(v2 + qword_2542996B8);
  *v29 = v28;
  v29[1] = v30;
  swift_bridgeObjectRelease();
  v31 = (uint64_t)v39;
  sub_235CA3120();
  v32 = sub_235CA3498();
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v32 - 8) + 56))(v31, 0, 1, v32);
  v33 = v2 + qword_2542996D8;
  swift_beginAccess();
  sub_235C9874C(v31, v33, &qword_2542989B0);
  return swift_endAccess();
}

void sub_235C922C0(void *a1)
{
  uint8_t *v1;
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
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  void (*v21)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v22;
  unsigned int (*v23)(uint64_t, uint64_t, uint64_t);
  char *v24;
  char v25;
  void (*v26)(char *, uint64_t);
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint8_t *v33;
  uint64_t v34;
  id v35;
  NSObject *v36;
  os_log_type_t v37;
  uint8_t *v38;
  char *v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  id v43;
  uint64_t v44;
  char *v45;
  uint8_t *v46;
  char *v47;
  id v48;
  uint64_t v49[4];

  v3 = sub_235CA2790();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v47 = (char *)&v44 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542989A0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v44 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_254299050);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v45 = (char *)&v44 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v44 - v13;
  v15 = MEMORY[0x24BDAC7A8](v12);
  v17 = (char *)&v44 - v16;
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v44 - v18;
  v46 = v1;
  v20 = (uint64_t)&v1[qword_2542996B0];
  swift_beginAccess();
  v44 = v20;
  sub_235C987F8(v20, (uint64_t)v19, &qword_254299050);
  v48 = a1;
  sub_235CA33A8();
  v21 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56);
  v21(v17, 0, 1, v3);
  v22 = (uint64_t)&v8[*(int *)(v6 + 48)];
  sub_235C987F8((uint64_t)v19, (uint64_t)v8, &qword_254299050);
  sub_235C987F8((uint64_t)v17, v22, &qword_254299050);
  v23 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48);
  if (v23((uint64_t)v8, 1, v3) == 1)
  {
    sub_235C76BD8((uint64_t)v17, &qword_254299050);
    sub_235C76BD8((uint64_t)v19, &qword_254299050);
    if (v23(v22, 1, v3) == 1)
    {
      sub_235C76BD8((uint64_t)v8, &qword_254299050);
LABEL_8:
      if (qword_2542992E8 != -1)
        swift_once();
      v27 = sub_235CA3708();
      __swift_project_value_buffer(v27, (uint64_t)qword_254299660);
      v28 = sub_235CA36FC();
      v29 = sub_235CA3924();
      if (os_log_type_enabled(v28, v29))
      {
        v30 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v30 = 0;
        _os_log_impl(&dword_235C5E000, v28, v29, "Setting sessionId to nil", v30, 2u);
        MEMORY[0x23B7DE144](v30, -1, -1);
      }

      v31 = (uint64_t)v45;
      v21(v45, 1, 1, v3);
      v32 = v44;
      swift_beginAccess();
      sub_235C9874C(v31, v32, &qword_254299050);
      swift_endAccess();
      v33 = &v46[qword_2542996B8];
      *(_QWORD *)v33 = 0;
      *((_QWORD *)v33 + 1) = 0;
      swift_bridgeObjectRelease();
      return;
    }
    goto LABEL_6;
  }
  sub_235C987F8((uint64_t)v8, (uint64_t)v14, &qword_254299050);
  if (v23(v22, 1, v3) == 1)
  {
    sub_235C76BD8((uint64_t)v17, &qword_254299050);
    sub_235C76BD8((uint64_t)v19, &qword_254299050);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v14, v3);
LABEL_6:
    sub_235C76BD8((uint64_t)v8, &qword_2542989A0);
    goto LABEL_13;
  }
  v24 = v47;
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 32))(v47, v22, v3);
  sub_235C69C18(&qword_254299038, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA98]);
  v25 = sub_235CA37D4();
  v26 = *(void (**)(char *, uint64_t))(v4 + 8);
  v26(v24, v3);
  sub_235C76BD8((uint64_t)v17, &qword_254299050);
  sub_235C76BD8((uint64_t)v19, &qword_254299050);
  v26(v14, v3);
  sub_235C76BD8((uint64_t)v8, &qword_254299050);
  if ((v25 & 1) != 0)
    goto LABEL_8;
LABEL_13:
  if (qword_2542992E8 != -1)
    swift_once();
  v34 = sub_235CA3708();
  __swift_project_value_buffer(v34, (uint64_t)qword_254299660);
  v35 = v48;
  v36 = sub_235CA36FC();
  v37 = sub_235CA3930();
  if (os_log_type_enabled(v36, v37))
  {
    v38 = (uint8_t *)swift_slowAlloc();
    v48 = (id)swift_slowAlloc();
    v49[0] = (uint64_t)v48;
    *(_DWORD *)v38 = 136315138;
    v46 = v38 + 4;
    v39 = v47;
    sub_235CA33A8();
    sub_235C69C18((unint64_t *)&unk_254299040, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
    v40 = sub_235CA3B64();
    v42 = v41;
    (*(void (**)(char *, uint64_t))(v4 + 8))(v39, v3);
    v49[3] = sub_235C944B8(v40, v42, v49);
    sub_235CA3A14();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_235C5E000, v36, v37, "SessionId: %s is not the current session, ignoring", v38, 0xCu);
    v43 = v48;
    swift_arrayDestroy();
    MEMORY[0x23B7DE144](v43, -1, -1);
    MEMORY[0x23B7DE144](v38, -1, -1);

  }
  else
  {

  }
}

void sub_235C928CC(void *a1)
{
  sub_235C92914(a1, "StopAttendingRequestedMessage received for sessionId: %s, calling dismissAttending on the AttendingClient", (SEL *)&selRef_dismissAttending, "Received StopAttendingRequestedMessage outside the scope of a session, dropping", "StopAttendingRequestedMessage does not belong to current session id: %s");
}

void sub_235C928F0(void *a1)
{
  sub_235C92914(a1, "SiriDismissedMessage received for sessionId: %s, calling requestDismissed on the AttendingClient", (SEL *)&selRef_requestDismissed, "Received SiriDismissedMessage outside the scope of a session, dropping", "SiriDismissedMessage does not belong to current session id: %s");
}

void sub_235C92914(void *a1, const char *a2, SEL *a3, const char *a4, const char *a5)
{
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
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
  char *v24;
  uint64_t v25;
  uint64_t v26;
  unsigned int (*v27)(uint64_t, uint64_t, uint64_t);
  uint64_t v28;
  uint64_t v29;
  char *v30;
  char v31;
  void (*v32)(char *, uint64_t);
  uint64_t v33;
  id v34;
  NSObject *v35;
  os_log_type_t v36;
  uint8_t *v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  char *v44;
  uint8_t *v45;
  NSObject *v46;
  os_log_type_t v47;
  uint8_t *v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  void *v53;
  NSObject *v54;
  os_log_type_t v55;
  uint8_t *v56;
  uint64_t v57;
  char *v58;
  unint64_t v59;
  const char *v60;
  const char *v61;
  const char *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  id v66;
  SEL *v67;
  char *v68;
  uint64_t v69;
  char *v70;
  uint8_t *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;

  v62 = a2;
  v63 = a5;
  v61 = a4;
  v67 = a3;
  v73 = sub_235CA3708();
  v71 = *(uint8_t **)(v73 - 8);
  MEMORY[0x24BDAC7A8](v73);
  v70 = (char *)&v61 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_235CA2790();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v68 = (char *)&v61 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542989A0);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v61 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_254299050);
  v15 = MEMORY[0x24BDAC7A8](v14);
  v65 = (uint64_t)&v61 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v61 - v18;
  v20 = MEMORY[0x24BDAC7A8](v17);
  v22 = (char *)&v61 - v21;
  MEMORY[0x24BDAC7A8](v20);
  v24 = (char *)&v61 - v23;
  v72 = v5;
  v25 = v5 + qword_2542996B0;
  swift_beginAccess();
  v64 = v25;
  sub_235C987F8(v25, (uint64_t)v24, &qword_254299050);
  v66 = a1;
  sub_235CA33A8();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v9 + 56))(v22, 0, 1, v8);
  v26 = (uint64_t)&v13[*(int *)(v11 + 48)];
  sub_235C987F8((uint64_t)v24, (uint64_t)v13, &qword_254299050);
  sub_235C987F8((uint64_t)v22, v26, &qword_254299050);
  v69 = v9;
  v27 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
  if (v27((uint64_t)v13, 1, v8) == 1)
  {
    sub_235C76BD8((uint64_t)v22, &qword_254299050);
    sub_235C76BD8((uint64_t)v24, &qword_254299050);
    if (v27(v26, 1, v8) == 1)
    {
      sub_235C76BD8((uint64_t)v13, &qword_254299050);
      v28 = v73;
LABEL_8:
      if (qword_2542992E8 != -1)
        swift_once();
      v33 = __swift_project_value_buffer(v28, (uint64_t)qword_254299660);
      v34 = v66;
      v35 = sub_235CA36FC();
      v36 = sub_235CA3924();
      if (os_log_type_enabled(v35, v36))
      {
        v37 = (uint8_t *)swift_slowAlloc();
        v38 = swift_slowAlloc();
        v75 = v38;
        *(_DWORD *)v37 = 136315138;
        v71 = v37 + 4;
        v39 = v68;
        sub_235CA33A8();
        v40 = sub_235CA2760();
        v73 = v33;
        v42 = v41;
        (*(void (**)(char *, uint64_t))(v69 + 8))(v39, v8);
        v74 = sub_235C944B8(v40, v42, &v75);
        sub_235CA3A14();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_235C5E000, v35, v36, v62, v37, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x23B7DE144](v38, -1, -1);
        MEMORY[0x23B7DE144](v37, -1, -1);

      }
      else
      {

      }
      v53 = *(void **)(v72 + qword_2542996A8);
      if (v53)
      {
        objc_msgSend(v53, *v67, v61);
      }
      else
      {
        v54 = sub_235CA36FC();
        v55 = sub_235CA3930();
        if (os_log_type_enabled(v54, v55))
        {
          v56 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v56 = 0;
          _os_log_impl(&dword_235C5E000, v54, v55, v61, v56, 2u);
          MEMORY[0x23B7DE144](v56, -1, -1);
        }

      }
      return;
    }
    goto LABEL_6;
  }
  sub_235C987F8((uint64_t)v13, (uint64_t)v19, &qword_254299050);
  if (v27(v26, 1, v8) == 1)
  {
    sub_235C76BD8((uint64_t)v22, &qword_254299050);
    sub_235C76BD8((uint64_t)v24, &qword_254299050);
    (*(void (**)(char *, uint64_t))(v69 + 8))(v19, v8);
LABEL_6:
    sub_235C76BD8((uint64_t)v13, &qword_2542989A0);
    v28 = v73;
    goto LABEL_12;
  }
  v30 = v68;
  v29 = v69;
  (*(void (**)(char *, uint64_t, uint64_t))(v69 + 32))(v68, v26, v8);
  sub_235C69C18(&qword_254299038, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA98]);
  v31 = sub_235CA37D4();
  v32 = *(void (**)(char *, uint64_t))(v29 + 8);
  v32(v30, v8);
  sub_235C76BD8((uint64_t)v22, &qword_254299050);
  sub_235C76BD8((uint64_t)v24, &qword_254299050);
  v32(v19, v8);
  sub_235C76BD8((uint64_t)v13, &qword_254299050);
  v28 = v73;
  if ((v31 & 1) != 0)
    goto LABEL_8;
LABEL_12:
  if (qword_2542992E8 != -1)
    swift_once();
  v43 = __swift_project_value_buffer(v28, (uint64_t)qword_254299660);
  v44 = v70;
  v45 = v71;
  (*((void (**)(char *, uint64_t, uint64_t))v71 + 2))(v70, v43, v28);
  swift_retain_n();
  v46 = sub_235CA36FC();
  v47 = sub_235CA3924();
  if (os_log_type_enabled(v46, v47))
  {
    v48 = (uint8_t *)swift_slowAlloc();
    v49 = swift_slowAlloc();
    v75 = v49;
    *(_DWORD *)v48 = 136315138;
    v50 = v65;
    sub_235C987F8(v64, v65, &qword_254299050);
    if (v27(v50, 1, v8))
    {
      sub_235C76BD8(v50, &qword_254299050);
      v51 = 0xE300000000000000;
      v52 = 7104878;
    }
    else
    {
      v58 = v68;
      v57 = v69;
      (*(void (**)(char *, uint64_t, uint64_t))(v69 + 16))(v68, v50, v8);
      sub_235C76BD8(v50, &qword_254299050);
      v52 = sub_235CA2760();
      v51 = v59;
      (*(void (**)(char *, uint64_t))(v57 + 8))(v58, v8);
    }
    v60 = v63;
    v74 = sub_235C944B8(v52, v51, &v75);
    sub_235CA3A14();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_235C5E000, v46, v47, v60, v48, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B7DE144](v49, -1, -1);
    MEMORY[0x23B7DE144](v48, -1, -1);

    (*((void (**)(char *, uint64_t))v71 + 1))(v70, v73);
  }
  else
  {

    swift_release_n();
    (*((void (**)(char *, uint64_t))v45 + 1))(v44, v28);
  }
}

uint64_t sub_235C930FC(void *a1)
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
  id v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32[3];

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542989B0);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v29 - v8;
  if (qword_2542992E8 != -1)
    swift_once();
  v10 = sub_235CA3708();
  __swift_project_value_buffer(v10, (uint64_t)qword_254299660);
  v11 = a1;
  v12 = sub_235CA36FC();
  v13 = sub_235CA3924();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = swift_slowAlloc();
    v30 = v7;
    v15 = v14;
    v29 = swift_slowAlloc();
    v32[0] = v29;
    *(_DWORD *)v15 = 136315650;
    v16 = sub_235CA33C0();
    v31 = sub_235C944B8(v16, v17, v32);
    sub_235CA3A14();

    swift_bridgeObjectRelease();
    *(_WORD *)(v15 + 12) = 2048;
    v18 = *(_QWORD *)(sub_235CA28EC() + 16);

    swift_bridgeObjectRelease();
    v31 = v18;
    sub_235CA3A14();

    *(_WORD *)(v15 + 22) = 1024;
    v19 = sub_235CA28E0();

    LODWORD(v31) = v19 & 1;
    sub_235CA3A14();

    _os_log_impl(&dword_235C5E000, v12, v13, "MUXContextMessage received for assistantId: %s with %ld home members and RMVEnabled=%{BOOL}d", (uint8_t *)v15, 0x1Cu);
    v20 = v29;
    swift_arrayDestroy();
    MEMORY[0x23B7DE144](v20, -1, -1);
    v21 = v15;
    v7 = v30;
    MEMORY[0x23B7DE144](v21, -1, -1);

  }
  else
  {

  }
  v22 = sub_235CA28EC();
  v23 = sub_235C9538C(v22);
  swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + qword_254299688) = v23;
  swift_bridgeObjectRelease();
  *(_BYTE *)(v2 + qword_254299698) = sub_235CA28E0() & 1;
  *(_BYTE *)(v2 + qword_254299690) = 1;
  sub_235CA28D4();
  v24 = sub_235CA3498();
  v25 = *(_QWORD *)(v24 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v7, 1, v24) == 1)
  {
    v26 = v2 + qword_2542996D8;
    swift_beginAccess();
    sub_235C987F8(v26, (uint64_t)v9, &qword_2542989B0);
    sub_235C76BD8((uint64_t)v7, &qword_2542989B0);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v25 + 32))(v9, v7, v24);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v25 + 56))(v9, 0, 1, v24);
  }
  v27 = v2 + qword_2542996D8;
  swift_beginAccess();
  sub_235C9874C((uint64_t)v9, v27, &qword_2542989B0);
  return swift_endAccess();
}

void sub_235C934D4(void *a1)
{
  uint64_t v1;
  uint64_t v3;
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
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t, uint64_t);
  int v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  char v29;
  void (*v30)(char *, uint64_t);
  NSObject *v31;
  NSObject *v32;
  os_log_type_t v33;
  uint8_t *v34;
  _QWORD *v35;
  NSObject *v36;
  _QWORD *v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  NSObject *v41;
  os_log_type_t v42;
  uint8_t *v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  void *v48;
  id v49;
  void *v50;
  NSObject *v51;
  os_log_type_t v52;
  uint8_t *v53;
  char *v54;
  unint64_t v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  id v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  NSObject *v67;

  v3 = sub_235CA3708();
  v63 = *(_QWORD *)(v3 - 8);
  v64 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v62 = (char *)&v57 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_235CA2790();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v60 = (char *)&v57 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2542989A0);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v57 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_254299050);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v59 = (uint64_t)&v57 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v57 - v15;
  v17 = MEMORY[0x24BDAC7A8](v14);
  v19 = (char *)&v57 - v18;
  MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)&v57 - v20;
  v65 = v1;
  v22 = v1 + qword_2542996B0;
  swift_beginAccess();
  v58 = v22;
  sub_235C987F8(v22, (uint64_t)v21, &qword_254299050);
  v61 = a1;
  sub_235CA33A8();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v6 + 56))(v19, 0, 1, v5);
  v23 = (uint64_t)&v10[*(int *)(v8 + 48)];
  sub_235C987F8((uint64_t)v21, (uint64_t)v10, &qword_254299050);
  sub_235C987F8((uint64_t)v19, v23, &qword_254299050);
  v24 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 48);
  if (v24((uint64_t)v10, 1, v5) == 1)
  {
    sub_235C76BD8((uint64_t)v19, &qword_254299050);
    sub_235C76BD8((uint64_t)v21, &qword_254299050);
    v25 = v24(v23, 1, v5);
    v26 = v65;
    if (v25 == 1)
    {
      sub_235C76BD8((uint64_t)v10, &qword_254299050);
      v27 = v64;
LABEL_8:
      if (qword_2542992E8 != -1)
        swift_once();
      __swift_project_value_buffer(v27, (uint64_t)qword_254299660);
      v31 = v61;
      v32 = sub_235CA36FC();
      v33 = sub_235CA3924();
      if (os_log_type_enabled(v32, v33))
      {
        v34 = (uint8_t *)swift_slowAlloc();
        v35 = (_QWORD *)swift_slowAlloc();
        *(_DWORD *)v34 = 138412290;
        v67 = v31;
        v36 = v31;
        sub_235CA3A14();
        *v35 = v31;

        _os_log_impl(&dword_235C5E000, v32, v33, "AsrBridge received message: %@", v34, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254299410);
        swift_arrayDestroy();
        v37 = v35;
        v26 = v65;
        MEMORY[0x23B7DE144](v37, -1, -1);
        MEMORY[0x23B7DE144](v34, -1, -1);
      }
      else
      {

        v32 = v31;
      }

      v48 = *(void **)(v26 + qword_2542996A8);
      if (v48)
      {
        v49 = v48;
        sub_235CA3378();
        v50 = (void *)sub_235CA37E0();
        swift_bridgeObjectRelease();
        objc_msgSend(v49, sel_siriDidPromptWithRootRequestId_, v50);

      }
      else
      {
        v51 = sub_235CA36FC();
        v52 = sub_235CA3930();
        if (os_log_type_enabled(v51, v52))
        {
          v53 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v53 = 0;
          _os_log_impl(&dword_235C5E000, v51, v52, "AttendingClient not set while receiving SiriPromptedMessage, dropping", v53, 2u);
          MEMORY[0x23B7DE144](v53, -1, -1);
        }

      }
      return;
    }
    goto LABEL_6;
  }
  sub_235C987F8((uint64_t)v10, (uint64_t)v16, &qword_254299050);
  if (v24(v23, 1, v5) == 1)
  {
    sub_235C76BD8((uint64_t)v19, &qword_254299050);
    sub_235C76BD8((uint64_t)v21, &qword_254299050);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v16, v5);
LABEL_6:
    sub_235C76BD8((uint64_t)v10, &qword_2542989A0);
    v27 = v64;
    goto LABEL_12;
  }
  v28 = v60;
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 32))(v60, v23, v5);
  sub_235C69C18(&qword_254299038, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA98]);
  v29 = sub_235CA37D4();
  v30 = *(void (**)(char *, uint64_t))(v6 + 8);
  v30(v28, v5);
  sub_235C76BD8((uint64_t)v19, &qword_254299050);
  sub_235C76BD8((uint64_t)v21, &qword_254299050);
  v30(v16, v5);
  sub_235C76BD8((uint64_t)v10, &qword_254299050);
  v27 = v64;
  v26 = v65;
  if ((v29 & 1) != 0)
    goto LABEL_8;
LABEL_12:
  if (qword_2542992E8 != -1)
    swift_once();
  v38 = __swift_project_value_buffer(v27, (uint64_t)qword_254299660);
  v39 = v62;
  v40 = v63;
  (*(void (**)(char *, uint64_t, uint64_t))(v63 + 16))(v62, v38, v27);
  swift_retain_n();
  v41 = sub_235CA36FC();
  v42 = sub_235CA3924();
  if (os_log_type_enabled(v41, v42))
  {
    v43 = (uint8_t *)swift_slowAlloc();
    v44 = swift_slowAlloc();
    v67 = v44;
    *(_DWORD *)v43 = 136315138;
    v45 = v59;
    sub_235C987F8(v58, v59, &qword_254299050);
    if (v24(v45, 1, v5))
    {
      sub_235C76BD8(v45, &qword_254299050);
      v46 = 0xE300000000000000;
      v47 = 7104878;
    }
    else
    {
      v54 = v60;
      (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v60, v45, v5);
      sub_235C76BD8(v45, &qword_254299050);
      v47 = sub_235CA2760();
      v46 = v55;
      (*(void (**)(char *, uint64_t))(v6 + 8))(v54, v5);
    }
    v56 = v62;
    v66 = sub_235C944B8(v47, v46, (uint64_t *)&v67);
    sub_235CA3A14();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_235C5E000, v41, v42, "SiriPromptedMessage does not belong to current session id: %s", v43, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23B7DE144](v44, -1, -1);
    MEMORY[0x23B7DE144](v43, -1, -1);

    (*(void (**)(char *, uint64_t))(v63 + 8))(v56, v64);
  }
  else
  {

    swift_release_n();
    (*(void (**)(char *, uint64_t))(v40 + 8))(v39, v27);
  }
}

uint64_t sub_235C93C98(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_235C93D10(a1, a2, a3, a4, "#AsrOnServer Received SASResultCandidate for requestId:%s", (unint64_t *)&unk_256377720, 0x24BE81590, (uint64_t)sub_235C93CBC);
}

uint64_t (*sub_235C93CBC())(void *a1, uint64_t a2, void (*a3)(_QWORD, _QWORD), uint64_t a4)
{
  swift_retain();
  return sub_235C986E0;
}

uint64_t sub_235C93CEC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_235C93D10(a1, a2, a3, a4, "#AsrOnServer Received SASMUXResultCandidate for requestId:%s", &qword_256377A48, 0x24BE81578, (uint64_t)sub_235C93FBC);
}

uint64_t sub_235C93D10(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, const char *a5, unint64_t *a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v10;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  id v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  id v23;
  void *v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  unint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  v37 = a6;
  v38 = a7;
  v36 = a5;
  v10 = v8;
  v39 = a2;
  v14 = sub_235CA3708();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v30 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2542992E8 != -1)
    swift_once();
  v18 = __swift_project_value_buffer(v14, (uint64_t)qword_254299660);
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v17, v18, v14);
  v19 = a1;
  v20 = sub_235CA36FC();
  v21 = sub_235CA3924();
  if (os_log_type_enabled(v20, v21))
  {
    v32 = a3;
    v33 = a4;
    v34 = a8;
    v35 = v10;
    v22 = (uint8_t *)swift_slowAlloc();
    v31 = swift_slowAlloc();
    v41 = v31;
    *(_DWORD *)v22 = 136315138;
    v23 = objc_msgSend(v19, sel_refId);
    if (v23)
    {
      v24 = v23;
      v25 = sub_235CA37EC();
      v27 = v26;

    }
    else
    {
      v27 = 0xE900000000000064;
      v25 = 0x49666572206C696ELL;
    }
    v40 = sub_235C944B8(v25, v27, &v41);
    sub_235CA3A14();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_235C5E000, v20, v21, v36, v22, 0xCu);
    v28 = v31;
    swift_arrayDestroy();
    MEMORY[0x23B7DE144](v28, -1, -1);
    MEMORY[0x23B7DE144](v22, -1, -1);

    (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  }
  sub_235C71624(0, v37);
  type metadata accessor for AsrRequestProcessor();
  return sub_235CA357C();
}

void (*sub_235C93FBC())(void *a1, uint64_t a2, void (*a3)(_QWORD, _QWORD), void *a4)
{
  swift_retain();
  return sub_235C986D4;
}

uint64_t sub_235C93FEC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_235C93D10(a1, a2, a3, a4, "#AsrOnServer Received SASSpeechServerEndpointIdentified for requestId:%s", &qword_256377A40, 0x24BE815A8, (uint64_t)sub_235C94010);
}

uint64_t (*sub_235C94010())(void *a1, uint64_t a2, uint64_t (*a3)(_QWORD, _QWORD), uint64_t a4)
{
  swift_retain();
  return sub_235C986C8;
}

uint64_t sub_235C94040(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_235C93D10(a1, a2, a3, a4, "#AsrOnServer Received SASSpeechRecognized for requestId:%s", &qword_256377A38, 0x24BE815A0, (uint64_t)sub_235C94064);
}

uint64_t (*sub_235C94064())(void *a1, uint64_t a2, uint64_t (*a3)(_QWORD, _QWORD), uint64_t a4)
{
  swift_retain();
  return sub_235C986BC;
}

void sub_235C94094(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  NSObject *v24;
  _BYTE v26[40];

  v4 = v3;
  v8 = sub_235CA2790();
  MEMORY[0x24BDAC7A8](v8);
  v10 = &v26[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  (*(void (**)(char *, uint64_t))(v11 + 16))(v10, a1);
  swift_bridgeObjectRetain();
  sub_235CA3678();
  v12 = *(_QWORD *)(v4 + qword_254299330);
  v13 = objc_allocWithZone((Class)type metadata accessor for AttendingStatesServiceHandler());
  swift_retain();
  v14 = sub_235CA2298((uint64_t)v10, a2, a3, (uint64_t)v26, v12);
  swift_release();
  v15 = qword_2542996D0;
  v16 = *(void **)(v4 + qword_2542996D0);
  *(_QWORD *)(v4 + qword_2542996D0) = v14;

  v17 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE60888]), sel_initWithDelegate_, *(_QWORD *)(v4 + v15));
  v18 = *(void **)(v4 + qword_2542996A8);
  *(_QWORD *)(v4 + qword_2542996A8) = v17;
  v19 = v17;

  -[NSObject startUpdateStates](v19, sel_startUpdateStates);
  if (qword_2542992E8 != -1)
    swift_once();
  v20 = sub_235CA3708();
  __swift_project_value_buffer(v20, (uint64_t)qword_254299660);
  v21 = sub_235CA36FC();
  v22 = sub_235CA3924();
  if (os_log_type_enabled(v21, v22))
  {
    v23 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v23 = 0;
    _os_log_impl(&dword_235C5E000, v21, v22, "Successfully setup Attending handling in AsrBridge", v23, 2u);
    MEMORY[0x23B7DE144](v23, -1, -1);
    v24 = v19;
  }
  else
  {
    v24 = v21;
    v21 = v19;
  }

}

void AsrBridge.__allocating_init(name:messagePublisher:serviceHelper:queue:conversationSessionsManager:logger:waitBeforeReplacingActiveRequest:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void AsrBridge.init(name:messagePublisher:serviceHelper:queue:conversationSessionsManager:logger:waitBeforeReplacingActiveRequest:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_235C942F0()
{
  uint64_t v0;

  swift_release();
  sub_235C76BD8(v0 + qword_2542996B0, &qword_254299050);
  swift_bridgeObjectRelease();
  sub_235C76BD8(v0 + qword_2542996A0, &qword_2542990A8);
  sub_235C76BD8(v0 + qword_2542996D8, &qword_2542989B0);
  swift_bridgeObjectRelease();

  __swift_destroy_boxed_opaque_existential_1(v0 + qword_254299318);
  return swift_release();
}

uint64_t AsrBridge.deinit()
{
  uint64_t v0;

  v0 = sub_235CA35A0();
  swift_release();
  sub_235C76BD8(v0 + qword_2542996B0, &qword_254299050);
  swift_bridgeObjectRelease();
  sub_235C76BD8(v0 + qword_2542996A0, &qword_2542990A8);
  sub_235C76BD8(v0 + qword_2542996D8, &qword_2542989B0);
  swift_bridgeObjectRelease();

  __swift_destroy_boxed_opaque_existential_1(v0 + qword_254299318);
  swift_release();
  return v0;
}

uint64_t AsrBridge.__deallocating_deinit()
{
  AsrBridge.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_235C944B8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_235C94588(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_235C76B10((uint64_t)v12, *a3);
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
      sub_235C76B10((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_235C94588(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_235CA3A20();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_235C94740(a5, a6);
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
  v8 = sub_235CA3AA4();
  if (!v8)
  {
    sub_235CA3AEC();
    __break(1u);
LABEL_17:
    result = sub_235CA3B28();
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

uint64_t sub_235C94740(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_235C947D4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_235C94A24(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_235C94A24(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_235C947D4(uint64_t a1, unint64_t a2)
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
      v3 = sub_235C94948(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_235CA3A8C();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_235CA3AEC();
      __break(1u);
LABEL_10:
      v2 = sub_235CA3834();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_235CA3B28();
    __break(1u);
LABEL_14:
    result = sub_235CA3AEC();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_235C94948(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_254299490);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_235C949AC(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;

  v3 = a1;
  v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    v10 = sub_235CA3870();
    v11 = v10 + (v4 << 16);
    v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v13 = v12;
    return v13 | 4;
  }
  else
  {
    v5 = MEMORY[0x23B7DD8F8](15, a1 >> 16);
    v6 = v5 + (v4 << 16);
    v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v8 = v7;
    return v8 | 8;
  }
}

uint64_t sub_235C94A24(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_254299490);
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
  result = sub_235CA3B28();
  __break(1u);
  return result;
}

unsigned __int8 *sub_235C94B70(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unsigned __int8 *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unsigned __int8 *v11;
  uint64_t v13;
  uint64_t v14;

  v13 = a1;
  v14 = a2;
  swift_bridgeObjectRetain();
  v5 = sub_235CA387C();
  v6 = v4;
  if ((v4 & 0x1000000000000000) == 0)
  {
    if ((v4 & 0x2000000000000000) == 0)
      goto LABEL_3;
LABEL_6:
    v8 = HIBYTE(v6) & 0xF;
    v13 = v5;
    v14 = v6 & 0xFFFFFFFFFFFFFFLL;
    v7 = (unsigned __int8 *)&v13;
    goto LABEL_7;
  }
  v5 = sub_235C94ED0();
  v10 = v9;
  swift_bridgeObjectRelease();
  v6 = v10;
  if ((v10 & 0x2000000000000000) != 0)
    goto LABEL_6;
LABEL_3:
  if ((v5 & 0x1000000000000000) != 0)
  {
    v7 = (unsigned __int8 *)((v6 & 0xFFFFFFFFFFFFFFFLL) + 32);
    v8 = v5 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    v7 = (unsigned __int8 *)sub_235CA3AA4();
  }
LABEL_7:
  v11 = sub_235C94C54(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11;
}

unsigned __int8 *sub_235C94C54(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  unsigned __int8 v8;
  uint64_t v9;
  unsigned __int8 *i;
  unsigned int v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int8 v15;
  unsigned __int8 v16;
  unsigned __int8 v17;
  unsigned __int8 *v18;
  unsigned int v19;
  char v20;
  uint64_t v21;
  unsigned __int8 v22;
  unsigned __int8 v23;
  unsigned __int8 v24;
  uint64_t v25;
  unsigned int v26;
  char v27;
  uint64_t v28;

  v3 = a2;
  v4 = *result;
  if (v4 != 43)
  {
    if (v4 == 45)
    {
      if (a2 >= 1)
      {
        v5 = a2 - 1;
        if (a2 != 1)
        {
          v6 = a3 + 48;
          v7 = a3 + 55;
          v8 = a3 + 87;
          if (a3 > 10)
          {
            v6 = 58;
          }
          else
          {
            v8 = 97;
            v7 = 65;
          }
          if (result)
          {
            v9 = 0;
            for (i = result + 1; ; ++i)
            {
              v11 = *i;
              if (v11 < 0x30 || v11 >= v6)
              {
                if (v11 < 0x41 || v11 >= v7)
                {
                  if (v11 < 0x61 || v11 >= v8)
                    return 0;
                  v12 = -87;
                }
                else
                {
                  v12 = -55;
                }
              }
              else
              {
                v12 = -48;
              }
              v13 = v9 * a3;
              if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63)
                return 0;
              v9 = v13 - (v11 + v12);
              if (__OFSUB__(v13, (v11 + v12)))
                return 0;
              if (!--v5)
                return (unsigned __int8 *)v9;
            }
          }
          return 0;
        }
        return 0;
      }
      __break(1u);
      goto LABEL_65;
    }
    if (a2)
    {
      v22 = a3 + 48;
      v23 = a3 + 55;
      v24 = a3 + 87;
      if (a3 > 10)
      {
        v22 = 58;
      }
      else
      {
        v24 = 97;
        v23 = 65;
      }
      if (result)
      {
        v25 = 0;
        do
        {
          v26 = *result;
          if (v26 < 0x30 || v26 >= v22)
          {
            if (v26 < 0x41 || v26 >= v23)
            {
              if (v26 < 0x61 || v26 >= v24)
                return 0;
              v27 = -87;
            }
            else
            {
              v27 = -55;
            }
          }
          else
          {
            v27 = -48;
          }
          v28 = v25 * a3;
          if ((unsigned __int128)(v25 * (__int128)a3) >> 64 != (v25 * a3) >> 63)
            return 0;
          v25 = v28 + (v26 + v27);
          if (__OFADD__(v28, (v26 + v27)))
            return 0;
          ++result;
          --v3;
        }
        while (v3);
        return (unsigned __int8 *)(v28 + (v26 + v27));
      }
      return 0;
    }
    return 0;
  }
  if (a2 < 1)
  {
LABEL_65:
    __break(1u);
    return result;
  }
  v14 = a2 - 1;
  if (a2 == 1)
    return 0;
  v15 = a3 + 48;
  v16 = a3 + 55;
  v17 = a3 + 87;
  if (a3 > 10)
  {
    v15 = 58;
  }
  else
  {
    v17 = 97;
    v16 = 65;
  }
  if (!result)
    return 0;
  v9 = 0;
  v18 = result + 1;
  do
  {
    v19 = *v18;
    if (v19 < 0x30 || v19 >= v15)
    {
      if (v19 < 0x41 || v19 >= v16)
      {
        if (v19 < 0x61 || v19 >= v17)
          return 0;
        v20 = -87;
      }
      else
      {
        v20 = -55;
      }
    }
    else
    {
      v20 = -48;
    }
    v21 = v9 * a3;
    if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63)
      return 0;
    v9 = v21 + (v19 + v20);
    if (__OFADD__(v21, (v19 + v20)))
      return 0;
    ++v18;
    --v14;
  }
  while (v14);
  return (unsigned __int8 *)v9;
}

uint64_t sub_235C94ED0()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;

  v0 = sub_235CA3888();
  v4 = sub_235C94F4C(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_235C94F4C(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD v14[3];

  if ((a4 & 0x1000000000000000) != 0)
  {
    v9 = sub_235C95090(a1, a2, a3, a4);
    if (v9)
    {
      v10 = v9;
      v11 = sub_235C94948(v9, 0);
      v12 = sub_235C9517C((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v12 != v10)
      {
        __break(1u);
        goto LABEL_9;
      }
    }
    else
    {
      v11 = (_QWORD *)MEMORY[0x24BEE4AF8];
    }
    v13 = MEMORY[0x23B7DD8BC](v11 + 4, v11[2]);
    swift_release();
    return v13;
  }
  else
  {
    if ((a4 & 0x2000000000000000) == 0)
    {
      if ((a3 & 0x1000000000000000) != 0)
LABEL_12:
        JUMPOUT(0x23B7DD8BCLL);
LABEL_9:
      sub_235CA3AA4();
      goto LABEL_12;
    }
    v14[0] = a3;
    v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return MEMORY[0x23B7DD8BC]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

unint64_t sub_235C95090(unint64_t result, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;

  v7 = result;
  v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0)
    LOBYTE(v8) = 1;
  v9 = 4 << v8;
  if ((result & 0xC) == 4 << v8)
  {
    result = sub_235C949AC(result, a3, a4);
    v7 = result;
  }
  if ((a2 & 0xC) == v9)
  {
    result = sub_235C949AC(a2, a3, a4);
    a2 = result;
    if ((a4 & 0x1000000000000000) == 0)
      return (a2 >> 16) - (v7 >> 16);
  }
  else if ((a4 & 0x1000000000000000) == 0)
  {
    return (a2 >> 16) - (v7 >> 16);
  }
  v10 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000) == 0)
    v10 = a3 & 0xFFFFFFFFFFFFLL;
  if (v10 < v7 >> 16)
  {
    __break(1u);
  }
  else if (v10 >= a2 >> 16)
  {
    return sub_235CA3858();
  }
  __break(1u);
  return result;
}

unint64_t sub_235C9517C(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  _QWORD *v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  char v19;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v26;
  unint64_t v27;
  _QWORD v28[2];

  v9 = (_QWORD *)result;
  if (!a2)
    goto LABEL_5;
  if (!a3)
  {
    v12 = a4;
    v11 = 0;
    goto LABEL_33;
  }
  if (a3 < 0)
    goto LABEL_36;
  v10 = a5 >> 14;
  v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    v11 = 0;
    v12 = a4;
LABEL_33:
    *v9 = a4;
    v9[1] = a5;
    v9[2] = a6;
    v9[3] = a7;
    v9[4] = v12;
    return v11;
  }
  v11 = 0;
  v14 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000) == 0)
    LOBYTE(v14) = 1;
  v15 = 4 << v14;
  v21 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  v22 = a7 & 0xFFFFFFFFFFFFFFLL;
  v16 = HIBYTE(a7) & 0xF;
  if ((a7 & 0x2000000000000000) == 0)
    v16 = a6 & 0xFFFFFFFFFFFFLL;
  v23 = v16;
  v26 = a3 - 1;
  v12 = a4;
  while (1)
  {
    v17 = v12 & 0xC;
    result = v12;
    if (v17 == v15)
      result = sub_235C949AC(v12, a6, a7);
    if (result >> 14 < v27 || result >> 14 >= v10)
      break;
    if ((a7 & 0x1000000000000000) != 0)
    {
      result = sub_235CA3864();
      v19 = result;
      if (v17 != v15)
        goto LABEL_23;
    }
    else
    {
      v18 = result >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        v19 = *((_BYTE *)v28 + v18);
        if (v17 != v15)
          goto LABEL_23;
      }
      else
      {
        result = v21;
        if ((a6 & 0x1000000000000000) == 0)
          result = sub_235CA3AA4();
        v19 = *(_BYTE *)(result + v18);
        if (v17 != v15)
        {
LABEL_23:
          if ((a7 & 0x1000000000000000) == 0)
            goto LABEL_24;
          goto LABEL_27;
        }
      }
    }
    result = sub_235C949AC(v12, a6, a7);
    v12 = result;
    if ((a7 & 0x1000000000000000) == 0)
    {
LABEL_24:
      v12 = (v12 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_29;
    }
LABEL_27:
    if (v23 <= v12 >> 16)
      goto LABEL_35;
    v12 = sub_235CA3840();
LABEL_29:
    *(_BYTE *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      v11 = a3;
      goto LABEL_33;
    }
    ++v11;
    if (v10 == v12 >> 14)
      goto LABEL_33;
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

_QWORD *sub_235C9538C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  int64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v8;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_254299498);
  v3 = (_QWORD *)swift_allocObject();
  v4 = _swift_stdlib_malloc_size(v3);
  v5 = v4 - 32;
  if (v4 < 32)
    v5 = v4 - 25;
  v3[2] = v1;
  v3[3] = (2 * (v5 >> 3)) | 1;
  v6 = sub_235C972BC(&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_235C8BB64();
  if (v6 != (_QWORD *)v1)
  {
    __break(1u);
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  return v3;
}

void sub_235C95474(void *a1, uint64_t a2)
{
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
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  NSObject *v24;
  os_log_type_t v25;
  BOOL v26;
  uint8_t *v27;
  id v28;
  id v29;
  uint64_t v30;
  id v31;
  _QWORD *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  os_log_type_t v39;
  uint8_t *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  char v46;
  uint64_t v47;
  char *v48;
  void *v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  void (*v53)(char *, uint64_t);
  void *v54;
  void *v55;
  id v56;
  id v57;
  id v58;
  NSObject *v59;
  os_log_type_t v60;
  uint64_t v61;
  uint64_t v62;
  _QWORD *v63;
  id v64;
  void (**v65)(uint64_t, uint64_t);
  uint64_t v66;
  unint64_t v67;
  uint64_t v68;
  void (**v69)(uint64_t, uint64_t);
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  void (**v74)(uint64_t, uint64_t);
  void *v75;
  void (**v76)(uint64_t, uint64_t);
  NSObject *v77;
  os_log_type_t v78;
  uint64_t v79;
  uint8_t *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  unint64_t v84;
  uint64_t v85;
  uint8_t *v86;
  id v87;
  uint64_t v88;
  uint64_t v89;
  char *v90;
  uint64_t v91;
  _QWORD *v92;
  void (**v93)(uint64_t, uint64_t);
  void (**v94)(uint64_t, uint64_t);
  _QWORD *v95;
  uint64_t v96;
  char *v97;
  char *v98;
  char *v99;
  char *v100;
  uint64_t v101;
  uint64_t v102;
  char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  char *v108;
  void (**v109)(uint64_t, uint64_t);
  id v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113[4];

  v4 = sub_235CA3564();
  v104 = *(_QWORD *)(v4 - 8);
  v105 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v103 = (char *)&v95 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_235CA3420();
  v7 = *(_QWORD *)(v6 - 8);
  v106 = v6;
  v107 = v7;
  MEMORY[0x24BDAC7A8](v6);
  v97 = (char *)&v95 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v102 = sub_235CA3408();
  v9 = *(_QWORD *)(v102 - 8);
  v10 = MEMORY[0x24BDAC7A8](v102);
  v12 = (char *)&v95 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v99 = (char *)&v95 - v13;
  v14 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254299088);
  v15 = MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v95 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v98 = (char *)&v95 - v18;
  v19 = sub_235CA2790();
  v109 = *(void (***)(uint64_t, uint64_t))(v19 - 8);
  MEMORY[0x24BDAC7A8](v19);
  v108 = (char *)&v95 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2542992E8 != -1)
    swift_once();
  v21 = sub_235CA3708();
  v22 = __swift_project_value_buffer(v21, (uint64_t)qword_254299660);
  v23 = a1;
  v24 = sub_235CA36FC();
  v25 = sub_235CA3924();
  v26 = os_log_type_enabled(v24, v25);
  v110 = (id)v22;
  v100 = v12;
  v101 = v9;
  if (v26)
  {
    v27 = (uint8_t *)swift_slowAlloc();
    v95 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v27 = 138412290;
    v113[0] = (uint64_t)v23;
    v28 = v23;
    v96 = v19;
    v29 = v23;
    v30 = a2;
    v31 = v28;
    sub_235CA3A14();
    v32 = v95;
    *v95 = v29;

    a2 = v30;
    v23 = v29;
    v19 = v96;
    _os_log_impl(&dword_235C5E000, v24, v25, "AsrRequestProcessor received message: %@", v27, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254299410);
    swift_arrayDestroy();
    MEMORY[0x23B7DE144](v32, -1, -1);
    MEMORY[0x23B7DE144](v27, -1, -1);

  }
  else
  {

  }
  if (sub_235CA2D3C())
  {
    v33 = (void *)sub_235CA34A4();
    swift_release();
  }
  else
  {
    v33 = 0;
  }
  v34 = sub_235CA35AC();
  v36 = v35;
  v37 = (uint64_t)v108;
  sub_235CA35E8();
  sub_235C99440(v33, v34, v36, v37);
  swift_bridgeObjectRelease();

  v109[1](v37, v19);
  if (*(_BYTE *)(a2 + qword_254299500) == 1)
  {
    v38 = sub_235CA36FC();
    v39 = sub_235CA393C();
    if (os_log_type_enabled(v38, v39))
    {
      v40 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v40 = 0;
      _os_log_impl(&dword_235C5E000, v38, v39, "Dropping the StartSpeechRequestMessage as we already ran this request in Candidate mode.", v40, 2u);
      MEMORY[0x23B7DE144](v40, -1, -1);
    }

  }
  else
  {
    v41 = v23;
    v43 = v106;
    v42 = v107;
    v44 = *(char **)(v107 + 104);
    v45 = (uint64_t)v98;
    LODWORD(v96) = *MEMORY[0x24BE9AEF8];
    v108 = v44;
    ((void (*)(char *))v44)(v98);
    v46 = 1;
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v42 + 56))(v45, 0, 1, v43);
    sub_235C806CC(v45, (uint64_t)v17);
    v47 = a2 + qword_2542994F0;
    swift_beginAccess();
    sub_235C9874C((uint64_t)v17, v47, (uint64_t *)&unk_254299088);
    swift_endAccess();
    v48 = v99;
    v49 = v41;
    sub_235CA2928();
    v51 = v100;
    v50 = v101;
    v52 = v102;
    (*(void (**)(char *, _QWORD, uint64_t))(v101 + 104))(v100, *MEMORY[0x24BE9AE90], v102);
    sub_235C69C18(&qword_254299078, (uint64_t (*)(uint64_t))MEMORY[0x24BE9AEA0], MEMORY[0x24BE9AEB8]);
    sub_235CA3894();
    sub_235CA3894();
    if (v113[0] != v111 || v113[1] != v112)
      v46 = sub_235CA3B88();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v53 = *(void (**)(char *, uint64_t))(v50 + 8);
    v53(v51, v52);
    v53(v48, v52);
    *(_BYTE *)(a2 + qword_254299168) = v46 & 1;
    sub_235C86820(0);
    sub_235C969EC((uint64_t)v49, a2);
    v55 = v54;
    v56 = v49;
    v57 = v55;
    v109 = (void (**)(uint64_t, uint64_t))v56;
    v58 = v57;
    v59 = sub_235CA36FC();
    v60 = sub_235CA3924();
    if (os_log_type_enabled(v59, v60))
    {
      v61 = swift_slowAlloc();
      v62 = swift_slowAlloc();
      v102 = a2;
      v63 = (_QWORD *)v62;
      v101 = swift_slowAlloc();
      v113[0] = v101;
      *(_DWORD *)v61 = 138412546;
      v111 = (uint64_t)v58;
      v64 = v58;
      sub_235CA3A14();
      *v63 = v58;

      v65 = v109;
      *(_WORD *)(v61 + 12) = 2080;
      v66 = sub_235CA3378();
      v111 = sub_235C944B8(v66, v67, v113);
      sub_235CA3A14();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_235C5E000, v59, v60, "RequestSettings: %@ for requestId: %s", (uint8_t *)v61, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254299410);
      swift_arrayDestroy();
      a2 = v102;
      MEMORY[0x23B7DE144](v63, -1, -1);
      v68 = v101;
      swift_arrayDestroy();
      MEMORY[0x23B7DE144](v68, -1, -1);
      MEMORY[0x23B7DE144](v61, -1, -1);

    }
    else
    {

      v69 = v109;
    }
    if ((sub_235CA2D30() & 1) != 0)
    {
      *(_BYTE *)(a2 + qword_2542994E8) = 1;
      v70 = (uint64_t)v97;
      v71 = v106;
      ((void (*)(char *, _QWORD, uint64_t))v108)(v97, v96, v106);
      v72 = sub_235C881CC(v70);
      (*(void (**)(uint64_t, uint64_t))(v107 + 8))(v70, v71);
      *(_QWORD *)(a2 + qword_2542994E0) = v72;
      swift_release();
      v73 = *(void **)(a2 + qword_2542991A0);
      v74 = v109;
      sub_235CA3378();
      v75 = (void *)sub_235CA37E0();
      swift_bridgeObjectRelease();
      objc_msgSend(v73, sel_disableLocalSpeechRecognitionForRequestId_, v75);

      v76 = v74;
      v77 = sub_235CA36FC();
      v78 = sub_235CA3924();
      if (os_log_type_enabled(v77, v78))
      {
        v79 = swift_slowAlloc();
        v110 = v58;
        v80 = (uint8_t *)v79;
        v81 = a2;
        v82 = swift_slowAlloc();
        v113[0] = v82;
        *(_DWORD *)v80 = 136315138;
        v83 = sub_235CA3378();
        v111 = sub_235C944B8(v83, v84, v113);
        sub_235CA3A14();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_235C5E000, v77, v78, "#AsrOnServer ASR is being processed on server for requestId: %s. LocalSpeechRecognition is disabled.", v80, 0xCu);
        swift_arrayDestroy();
        v85 = v82;
        a2 = v81;
        MEMORY[0x23B7DE144](v85, -1, -1);
        v86 = v80;
        v58 = v110;
        MEMORY[0x23B7DE144](v86, -1, -1);

      }
      else
      {

      }
    }
    else
    {
      v87 = objc_msgSend(v58, sel_speechRecognitionTask);
      sub_235CA3378();
      sub_235C717E4((unint64_t)v87);
      swift_bridgeObjectRelease();
    }
    objc_msgSend(*(id *)(a2 + qword_2542991A0), sel_startSpeechRecognitionResultsWithSettings_, v58);
    if (qword_2542989C0 != -1)
      swift_once();
    v88 = v105;
    v89 = __swift_project_value_buffer(v105, (uint64_t)qword_254299648);
    v90 = v103;
    v91 = v104;
    (*(void (**)(char *, uint64_t, uint64_t))(v104 + 16))(v103, v89, v88);
    v92 = (_QWORD *)swift_allocObject();
    v93 = v109;
    v92[2] = a2;
    v92[3] = v93;
    v92[4] = &off_25070C998;
    v94 = v93;
    swift_retain();
    sub_235CA3540();

    swift_release();
    (*(void (**)(char *, uint64_t))(v91 + 8))(v90, v88);
  }
}

void sub_235C95F30(void *a1, uint64_t a2)
{
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
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  NSObject *v24;
  os_log_type_t v25;
  BOOL v26;
  uint8_t *v27;
  id v28;
  id v29;
  uint64_t v30;
  id v31;
  _QWORD *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  os_log_type_t v39;
  uint8_t *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  char v46;
  uint64_t v47;
  char *v48;
  void *v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  void (*v53)(char *, uint64_t);
  void *v54;
  void *v55;
  id v56;
  id v57;
  id v58;
  NSObject *v59;
  os_log_type_t v60;
  uint64_t v61;
  uint64_t v62;
  _QWORD *v63;
  id v64;
  void (**v65)(uint64_t, uint64_t);
  uint64_t v66;
  unint64_t v67;
  uint64_t v68;
  void (**v69)(uint64_t, uint64_t);
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  void (**v74)(uint64_t, uint64_t);
  void *v75;
  void (**v76)(uint64_t, uint64_t);
  NSObject *v77;
  os_log_type_t v78;
  uint64_t v79;
  uint8_t *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  unint64_t v84;
  uint64_t v85;
  uint8_t *v86;
  id v87;
  uint64_t v88;
  uint64_t v89;
  char *v90;
  uint64_t v91;
  _QWORD *v92;
  void (**v93)(uint64_t, uint64_t);
  void (**v94)(uint64_t, uint64_t);
  _QWORD *v95;
  uint64_t v96;
  char *v97;
  char *v98;
  char *v99;
  char *v100;
  uint64_t v101;
  uint64_t v102;
  char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  char *v108;
  void (**v109)(uint64_t, uint64_t);
  id v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113[4];

  v4 = sub_235CA3564();
  v104 = *(_QWORD *)(v4 - 8);
  v105 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v103 = (char *)&v95 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_235CA3420();
  v7 = *(_QWORD *)(v6 - 8);
  v106 = v6;
  v107 = v7;
  MEMORY[0x24BDAC7A8](v6);
  v97 = (char *)&v95 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v102 = sub_235CA3408();
  v9 = *(_QWORD *)(v102 - 8);
  v10 = MEMORY[0x24BDAC7A8](v102);
  v12 = (char *)&v95 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v99 = (char *)&v95 - v13;
  v14 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254299088);
  v15 = MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v95 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v98 = (char *)&v95 - v18;
  v19 = sub_235CA2790();
  v109 = *(void (***)(uint64_t, uint64_t))(v19 - 8);
  MEMORY[0x24BDAC7A8](v19);
  v108 = (char *)&v95 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2542992E8 != -1)
    swift_once();
  v21 = sub_235CA3708();
  v22 = __swift_project_value_buffer(v21, (uint64_t)qword_254299660);
  v23 = a1;
  v24 = sub_235CA36FC();
  v25 = sub_235CA3924();
  v26 = os_log_type_enabled(v24, v25);
  v110 = (id)v22;
  v100 = v12;
  v101 = v9;
  if (v26)
  {
    v27 = (uint8_t *)swift_slowAlloc();
    v95 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v27 = 138412290;
    v113[0] = (uint64_t)v23;
    v28 = v23;
    v96 = v19;
    v29 = v23;
    v30 = a2;
    v31 = v28;
    sub_235CA3A14();
    v32 = v95;
    *v95 = v29;

    a2 = v30;
    v23 = v29;
    v19 = v96;
    _os_log_impl(&dword_235C5E000, v24, v25, "AsrRequestProcessor received message: %@", v27, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254299410);
    swift_arrayDestroy();
    MEMORY[0x23B7DE144](v32, -1, -1);
    MEMORY[0x23B7DE144](v27, -1, -1);

  }
  else
  {

  }
  if (sub_235CA2FDC())
  {
    v33 = (void *)sub_235CA34A4();
    swift_release();
  }
  else
  {
    v33 = 0;
  }
  v34 = sub_235CA35AC();
  v36 = v35;
  v37 = (uint64_t)v108;
  sub_235CA35E8();
  sub_235C99440(v33, v34, v36, v37);
  swift_bridgeObjectRelease();

  v109[1](v37, v19);
  if (*(_BYTE *)(a2 + qword_254299500) == 1)
  {
    v38 = sub_235CA36FC();
    v39 = sub_235CA393C();
    if (os_log_type_enabled(v38, v39))
    {
      v40 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v40 = 0;
      _os_log_impl(&dword_235C5E000, v38, v39, "Dropping the StartSpeechRequestMessage as we already ran this request in Candidate mode.", v40, 2u);
      MEMORY[0x23B7DE144](v40, -1, -1);
    }

  }
  else
  {
    v41 = v23;
    v43 = v106;
    v42 = v107;
    v44 = *(char **)(v107 + 104);
    v45 = (uint64_t)v98;
    LODWORD(v96) = *MEMORY[0x24BE9AEF8];
    v108 = v44;
    ((void (*)(char *))v44)(v98);
    v46 = 1;
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v42 + 56))(v45, 0, 1, v43);
    sub_235C806CC(v45, (uint64_t)v17);
    v47 = a2 + qword_2542994F0;
    swift_beginAccess();
    sub_235C9874C((uint64_t)v17, v47, (uint64_t *)&unk_254299088);
    swift_endAccess();
    v48 = v99;
    v49 = v41;
    sub_235CA2FD0();
    v51 = v100;
    v50 = v101;
    v52 = v102;
    (*(void (**)(char *, _QWORD, uint64_t))(v101 + 104))(v100, *MEMORY[0x24BE9AE90], v102);
    sub_235C69C18(&qword_254299078, (uint64_t (*)(uint64_t))MEMORY[0x24BE9AEA0], MEMORY[0x24BE9AEB8]);
    sub_235CA3894();
    sub_235CA3894();
    if (v113[0] != v111 || v113[1] != v112)
      v46 = sub_235CA3B88();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v53 = *(void (**)(char *, uint64_t))(v50 + 8);
    v53(v51, v52);
    v53(v48, v52);
    *(_BYTE *)(a2 + qword_254299168) = v46 & 1;
    sub_235C86820(0);
    sub_235C96E54((uint64_t)v49, a2);
    v55 = v54;
    v56 = v49;
    v57 = v55;
    v109 = (void (**)(uint64_t, uint64_t))v56;
    v58 = v57;
    v59 = sub_235CA36FC();
    v60 = sub_235CA3924();
    if (os_log_type_enabled(v59, v60))
    {
      v61 = swift_slowAlloc();
      v62 = swift_slowAlloc();
      v102 = a2;
      v63 = (_QWORD *)v62;
      v101 = swift_slowAlloc();
      v113[0] = v101;
      *(_DWORD *)v61 = 138412546;
      v111 = (uint64_t)v58;
      v64 = v58;
      sub_235CA3A14();
      *v63 = v58;

      v65 = v109;
      *(_WORD *)(v61 + 12) = 2080;
      v66 = sub_235CA3378();
      v111 = sub_235C944B8(v66, v67, v113);
      sub_235CA3A14();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_235C5E000, v59, v60, "RequestSettings: %@ for requestId: %s", (uint8_t *)v61, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254299410);
      swift_arrayDestroy();
      a2 = v102;
      MEMORY[0x23B7DE144](v63, -1, -1);
      v68 = v101;
      swift_arrayDestroy();
      MEMORY[0x23B7DE144](v68, -1, -1);
      MEMORY[0x23B7DE144](v61, -1, -1);

    }
    else
    {

      v69 = v109;
    }
    if ((sub_235CA2FC4() & 1) != 0)
    {
      *(_BYTE *)(a2 + qword_2542994E8) = 1;
      v70 = (uint64_t)v97;
      v71 = v106;
      ((void (*)(char *, _QWORD, uint64_t))v108)(v97, v96, v106);
      v72 = sub_235C881CC(v70);
      (*(void (**)(uint64_t, uint64_t))(v107 + 8))(v70, v71);
      *(_QWORD *)(a2 + qword_2542994E0) = v72;
      swift_release();
      v73 = *(void **)(a2 + qword_2542991A0);
      v74 = v109;
      sub_235CA3378();
      v75 = (void *)sub_235CA37E0();
      swift_bridgeObjectRelease();
      objc_msgSend(v73, sel_disableLocalSpeechRecognitionForRequestId_, v75);

      v76 = v74;
      v77 = sub_235CA36FC();
      v78 = sub_235CA3924();
      if (os_log_type_enabled(v77, v78))
      {
        v79 = swift_slowAlloc();
        v110 = v58;
        v80 = (uint8_t *)v79;
        v81 = a2;
        v82 = swift_slowAlloc();
        v113[0] = v82;
        *(_DWORD *)v80 = 136315138;
        v83 = sub_235CA3378();
        v111 = sub_235C944B8(v83, v84, v113);
        sub_235CA3A14();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_235C5E000, v77, v78, "#AsrOnServer ASR is being processed on server for requestId: %s. LocalSpeechRecognition is disabled.", v80, 0xCu);
        swift_arrayDestroy();
        v85 = v82;
        a2 = v81;
        MEMORY[0x23B7DE144](v85, -1, -1);
        v86 = v80;
        v58 = v110;
        MEMORY[0x23B7DE144](v86, -1, -1);

      }
      else
      {

      }
    }
    else
    {
      v87 = objc_msgSend(v58, sel_speechRecognitionTask);
      sub_235CA3378();
      sub_235C717E4((unint64_t)v87);
      swift_bridgeObjectRelease();
    }
    objc_msgSend(*(id *)(a2 + qword_2542991A0), sel_startSpeechRecognitionResultsWithSettings_, v58);
    if (qword_2542989C0 != -1)
      swift_once();
    v88 = v105;
    v89 = __swift_project_value_buffer(v105, (uint64_t)qword_254299648);
    v90 = v103;
    v91 = v104;
    (*(void (**)(char *, uint64_t, uint64_t))(v104 + 16))(v103, v89, v88);
    v92 = (_QWORD *)swift_allocObject();
    v93 = v109;
    v92[2] = a2;
    v92[3] = v93;
    v92[4] = &off_25070C9C0;
    v94 = v93;
    swift_retain();
    sub_235CA3540();

    swift_release();
    (*(void (**)(char *, uint64_t))(v91 + 8))(v90, v88);
  }
}

void sub_235C969EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  void *v32;
  uint64_t v33;
  unint64_t v34;
  char v35;
  BOOL v37;
  uint64_t v38;
  char v39;
  char v40;
  uint64_t v41;
  uint64_t v42;
  __int16 v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  unint64_t v51;
  char v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;

  v4 = sub_235CA3408();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v49 = (char *)&v44 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_235C85238((uint64_t *)&v51);
  v7 = *(_QWORD *)(a2 + qword_254299160);
  if (v7 >> 62)
  {
LABEL_23:
    swift_bridgeObjectRetain();
    v8 = sub_235CA3AF8();
    if (v8)
      goto LABEL_3;
LABEL_24:
    swift_bridgeObjectRelease();
    v45 = MEMORY[0x24BEE4AF8];
LABEL_25:
    v21 = sub_235CA2D30();
    v22 = sub_235CA3378();
    v24 = v23;
    v25 = v49;
    sub_235CA2928();
    v26 = sub_235CA33FC();
    v46 = v27;
    (*(void (**)(char *, uint64_t))(v5 + 8))(v25, v4);
    v28 = sub_235CA2D3C();
    v47 = v26;
    v48 = v24;
    if (v28)
    {
      v49 = (char *)sub_235CA34A4();
      swift_release();
    }
    else
    {
      v49 = 0;
    }
    if ((v21 & 1) != 0)
      v29 = 2;
    else
      v29 = 0;
    v30 = v53;
    v31 = *MEMORY[0x24BE608A0];
    swift_bridgeObjectRetain();
    v32 = (void *)sub_235CA35C4();
    v33 = sub_235CA35DC();
    v35 = sub_235C763EC(v32, v33, v34);
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    v37 = (v35 & 1) == 0 && v35 != 2;
    v38 = v51;
    v39 = sub_235C7534C(v51);
    v40 = v52;
    v41 = v54;
    v42 = v55;
    objc_allocWithZone(MEMORY[0x24BE60890]);
    swift_bridgeObjectRetain();
    HIBYTE(v43) = v39 & 1;
    LOBYTE(v43) = v37;
    sub_235C7FE04(v31, v22, v48, v47, v46, v38, v29, v49, v30, 0, 0, 0, 0, 0, 0, 0, 0, 0, v43,
      1,
      v40,
      0,
      0,
      0,
      0,
      0,
      v45,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      v41,
      v42);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return;
  }
  v8 = *(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v8)
    goto LABEL_24;
LABEL_3:
  v50 = MEMORY[0x24BEE4AF8];
  sub_235CA3AC8();
  if ((v8 & 0x8000000000000000) == 0)
  {
    v44 = v5;
    v46 = v4;
    v47 = a1;
    v48 = a2;
    a2 = 0;
    v5 = v7 & 0xC000000000000001;
    while (1)
    {
      if (v8 == a2)
      {
        __break(1u);
        goto LABEL_23;
      }
      if (v5)
        v9 = (id)MEMORY[0x23B7DDB44](a2, v7);
      else
        v9 = *(id *)(v7 + 8 * a2 + 32);
      v10 = v9;
      v11 = objc_msgSend(v9, sel_sharedUserId, v44);
      if (v11)
      {
        v12 = v11;
        sub_235CA37EC();
        v14 = v13;

      }
      else
      {
        v14 = 0;
      }
      v15 = objc_msgSend(v10, sel_loggableSharedUserId);
      if (v15)
      {
        v16 = v15;
        sub_235CA37EC();
        v4 = v17;

        if (v14)
          goto LABEL_14;
      }
      else
      {
        v4 = 0;
        if (v14)
        {
LABEL_14:
          v18 = (void *)sub_235CA37E0();
          swift_bridgeObjectRelease();
          if (!v4)
            goto LABEL_18;
          goto LABEL_15;
        }
      }
      v18 = 0;
      if (!v4)
      {
LABEL_18:
        v19 = 0;
        goto LABEL_19;
      }
LABEL_15:
      v19 = (void *)sub_235CA37E0();
      swift_bridgeObjectRelease();
LABEL_19:
      v20 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE090A8]), sel_initWithSharedUserId_loggableSharedUserId_, v18, v19);

      if (!v20)
        goto LABEL_39;
      ++a2;

      sub_235CA3AB0();
      a1 = *(_QWORD *)(v50 + 16);
      sub_235CA3AD4();
      sub_235CA3AE0();
      sub_235CA3ABC();
      if (v8 == a2)
      {
        v45 = v50;
        swift_bridgeObjectRelease();
        v4 = v46;
        v5 = v44;
        goto LABEL_25;
      }
    }
  }
  __break(1u);
LABEL_39:
  __break(1u);
}

void sub_235C96E54(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  void *v32;
  uint64_t v33;
  unint64_t v34;
  char v35;
  BOOL v37;
  uint64_t v38;
  char v39;
  char v40;
  uint64_t v41;
  uint64_t v42;
  __int16 v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  unint64_t v51;
  char v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;

  v4 = sub_235CA3408();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v49 = (char *)&v44 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_235C85238((uint64_t *)&v51);
  v7 = *(_QWORD *)(a2 + qword_254299160);
  if (v7 >> 62)
  {
LABEL_23:
    swift_bridgeObjectRetain();
    v8 = sub_235CA3AF8();
    if (v8)
      goto LABEL_3;
LABEL_24:
    swift_bridgeObjectRelease();
    v45 = MEMORY[0x24BEE4AF8];
LABEL_25:
    v21 = sub_235CA2FC4();
    v22 = sub_235CA3378();
    v24 = v23;
    v25 = v49;
    sub_235CA2FD0();
    v26 = sub_235CA33FC();
    v46 = v27;
    (*(void (**)(char *, uint64_t))(v5 + 8))(v25, v4);
    v28 = sub_235CA2FDC();
    v47 = v26;
    v48 = v24;
    if (v28)
    {
      v49 = (char *)sub_235CA34A4();
      swift_release();
    }
    else
    {
      v49 = 0;
    }
    if ((v21 & 1) != 0)
      v29 = 2;
    else
      v29 = 0;
    v30 = v53;
    v31 = *MEMORY[0x24BE608A0];
    swift_bridgeObjectRetain();
    v32 = (void *)sub_235CA35C4();
    v33 = sub_235CA35DC();
    v35 = sub_235C763EC(v32, v33, v34);
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    v37 = (v35 & 1) == 0 && v35 != 2;
    v38 = v51;
    v39 = sub_235C7534C(v51);
    v40 = v52;
    v41 = v54;
    v42 = v55;
    objc_allocWithZone(MEMORY[0x24BE60890]);
    swift_bridgeObjectRetain();
    HIBYTE(v43) = v39 & 1;
    LOBYTE(v43) = v37;
    sub_235C7FE04(v31, v22, v48, v47, v46, v38, v29, v49, v30, 0, 0, 0, 0, 0, 0, 0, 0, 0, v43,
      1,
      v40,
      0,
      0,
      0,
      0,
      0,
      v45,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      v41,
      v42);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return;
  }
  v8 = *(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v8)
    goto LABEL_24;
LABEL_3:
  v50 = MEMORY[0x24BEE4AF8];
  sub_235CA3AC8();
  if ((v8 & 0x8000000000000000) == 0)
  {
    v44 = v5;
    v46 = v4;
    v47 = a1;
    v48 = a2;
    a2 = 0;
    v5 = v7 & 0xC000000000000001;
    while (1)
    {
      if (v8 == a2)
      {
        __break(1u);
        goto LABEL_23;
      }
      if (v5)
        v9 = (id)MEMORY[0x23B7DDB44](a2, v7);
      else
        v9 = *(id *)(v7 + 8 * a2 + 32);
      v10 = v9;
      v11 = objc_msgSend(v9, sel_sharedUserId, v44);
      if (v11)
      {
        v12 = v11;
        sub_235CA37EC();
        v14 = v13;

      }
      else
      {
        v14 = 0;
      }
      v15 = objc_msgSend(v10, sel_loggableSharedUserId);
      if (v15)
      {
        v16 = v15;
        sub_235CA37EC();
        v4 = v17;

        if (v14)
          goto LABEL_14;
      }
      else
      {
        v4 = 0;
        if (v14)
        {
LABEL_14:
          v18 = (void *)sub_235CA37E0();
          swift_bridgeObjectRelease();
          if (!v4)
            goto LABEL_18;
          goto LABEL_15;
        }
      }
      v18 = 0;
      if (!v4)
      {
LABEL_18:
        v19 = 0;
        goto LABEL_19;
      }
LABEL_15:
      v19 = (void *)sub_235CA37E0();
      swift_bridgeObjectRelease();
LABEL_19:
      v20 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE090A8]), sel_initWithSharedUserId_loggableSharedUserId_, v18, v19);

      if (!v20)
        goto LABEL_39;
      ++a2;

      sub_235CA3AB0();
      a1 = *(_QWORD *)(v50 + 16);
      sub_235CA3AD4();
      sub_235CA3AE0();
      sub_235CA3ABC();
      if (v8 == a2)
      {
        v45 = v50;
        swift_bridgeObjectRelease();
        v4 = v46;
        v5 = v44;
        goto LABEL_25;
      }
    }
  }
  __break(1u);
LABEL_39:
  __break(1u);
}

_QWORD *sub_235C972BC(_QWORD *result, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  int64_t v12;
  uint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  void *v20;
  id v21;

  v5 = result;
  v6 = a4 + 64;
  v7 = -1 << *(_BYTE *)(a4 + 32);
  if (-v7 < 64)
    v8 = ~(-1 << -(char)v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(a4 + 64);
  if (!a2)
  {
    v12 = 0;
    v10 = 0;
LABEL_38:
    *v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return (_QWORD *)v10;
  }
  v10 = a3;
  if (!a3)
  {
    v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  v11 = a2;
  v12 = 0;
  v13 = 0;
  v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9)
    goto LABEL_9;
LABEL_8:
  v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    v20 = *(void **)(*(_QWORD *)(a4 + 56) + 8 * v16);
    *v11 = v20;
    if (v13 == v10)
    {
      v21 = v20;
      goto LABEL_38;
    }
    ++v11;
    result = v20;
    if (v9)
      goto LABEL_8;
LABEL_9:
    v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14)
      goto LABEL_33;
    v18 = *(_QWORD *)(v6 + 8 * v17);
    if (!v18)
      break;
LABEL_18:
    v9 = (v18 - 1) & v18;
    v16 = __clz(__rbit64(v18)) + (v17 << 6);
    v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    v9 = 0;
    v12 = v17;
    goto LABEL_37;
  }
  v18 = *(_QWORD *)(v6 + 8 * v12);
  if (v18)
    goto LABEL_14;
  v19 = v17 + 2;
  if (v17 + 2 >= v14)
    goto LABEL_33;
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
    goto LABEL_17;
  v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    v9 = 0;
    v12 = v17 + 2;
    goto LABEL_37;
  }
  v18 = *(_QWORD *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    v17 = v12;
    goto LABEL_18;
  }
  v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    v9 = 0;
LABEL_37:
    v10 = v13;
    goto LABEL_38;
  }
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    v17 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v17 >= v14)
    {
      v9 = 0;
      v12 = v14 - 1;
      goto LABEL_37;
    }
    v18 = *(_QWORD *)(v6 + 8 * v17);
    ++v19;
    if (v18)
      goto LABEL_18;
  }
LABEL_41:
  __break(1u);
  return result;
}

void _s9ASRBridge9AsrBridgeC27configuredMaxEagerRCAllowedSivgZ_0()
{
  id v0;
  void *v1;
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned __int8 *v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  unsigned __int8 *v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  unsigned __int8 *v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unsigned __int8 *v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  char v32;
  _QWORD v33[3];

  v0 = objc_allocWithZone(MEMORY[0x24BDBCF50]);
  v1 = (void *)sub_235CA37E0();
  v2 = objc_msgSend(v0, sel_initWithSuiteName_, v1);

  if (v2)
  {
    v3 = (void *)sub_235CA37E0();
    v4 = objc_msgSend(v2, sel_stringForKey_, v3);

    if (v4)
    {
      v5 = sub_235CA37EC();
      v7 = v6;

      v8 = HIBYTE(v7) & 0xF;
      v9 = v5 & 0xFFFFFFFFFFFFLL;
      if ((v7 & 0x2000000000000000) != 0)
        v10 = HIBYTE(v7) & 0xF;
      else
        v10 = v5 & 0xFFFFFFFFFFFFLL;
      if (v10)
      {
        if ((v7 & 0x1000000000000000) != 0)
        {
          v12 = (uint64_t)sub_235C94B70(v5, v7, 10);
          LOBYTE(v5) = v32;
          goto LABEL_46;
        }
        if ((v7 & 0x2000000000000000) == 0)
        {
          if ((v5 & 0x1000000000000000) != 0)
            v11 = (unsigned __int8 *)((v7 & 0xFFFFFFFFFFFFFFFLL) + 32);
          else
            v11 = (unsigned __int8 *)sub_235CA3AA4();
          v12 = (uint64_t)sub_235C94C54(v11, v9, 10);
          LOBYTE(v5) = v13 & 1;
          goto LABEL_46;
        }
        v33[0] = v5;
        v33[1] = v7 & 0xFFFFFFFFFFFFFFLL;
        if (v5 == 43)
        {
          if (!v8)
            goto LABEL_67;
          if (v8 == 1 || (BYTE1(v5) - 48) > 9u)
            goto LABEL_33;
          v12 = (BYTE1(v5) - 48);
          if (v8 != 2)
          {
            if ((BYTE2(v5) - 48) > 9u)
              goto LABEL_33;
            v12 = 10 * (BYTE1(v5) - 48) + (BYTE2(v5) - 48);
            v14 = v8 - 3;
            if (v14)
            {
              v15 = (unsigned __int8 *)v33 + 3;
              while (1)
              {
                v16 = *v15 - 48;
                if (v16 > 9)
                  goto LABEL_33;
                v17 = 10 * v12;
                if ((unsigned __int128)(v12 * (__int128)10) >> 64 != (10 * v12) >> 63)
                  goto LABEL_33;
                v12 = v17 + v16;
                if (__OFADD__(v17, v16))
                  goto LABEL_33;
                LOBYTE(v5) = 0;
                ++v15;
                if (!--v14)
                  goto LABEL_46;
              }
            }
          }
        }
        else
        {
          if (v5 == 45)
          {
            if (v8)
            {
              if (v8 != 1 && (BYTE1(v5) - 48) <= 9u)
              {
                if (v8 == 2)
                {
                  LOBYTE(v5) = 0;
                  v12 = -(uint64_t)(BYTE1(v5) - 48);
LABEL_46:
                  swift_bridgeObjectRelease();
                  v23 = 5;
                  if (v12 >= 0)
                    v23 = v12;
                  if ((v5 & 1) != 0)
                    v24 = 5;
                  else
                    v24 = v23;
                  goto LABEL_59;
                }
                if ((BYTE2(v5) - 48) <= 9u)
                {
                  v12 = -10 * (BYTE1(v5) - 48) - (BYTE2(v5) - 48);
                  v22 = v8 - 3;
                  if (!v22)
                    goto LABEL_45;
                  v25 = (unsigned __int8 *)v33 + 3;
                  while (1)
                  {
                    v26 = *v25 - 48;
                    if (v26 > 9)
                      break;
                    v27 = 10 * v12;
                    if ((unsigned __int128)(v12 * (__int128)10) >> 64 != (10 * v12) >> 63)
                      break;
                    v12 = v27 - v26;
                    if (__OFSUB__(v27, v26))
                      break;
                    LOBYTE(v5) = 0;
                    ++v25;
                    if (!--v22)
                      goto LABEL_46;
                  }
                }
              }
LABEL_33:
              v12 = 0;
              LOBYTE(v5) = 1;
              goto LABEL_46;
            }
            __break(1u);
LABEL_67:
            __break(1u);
            return;
          }
          if (!v8 || (v5 - 48) > 9u)
            goto LABEL_33;
          v12 = (v5 - 48);
          if (v8 != 1)
          {
            if ((BYTE1(v5) - 48) > 9u)
              goto LABEL_33;
            v12 = 10 * (v5 - 48) + (BYTE1(v5) - 48);
            v18 = v8 - 2;
            if (v18)
            {
              v19 = (unsigned __int8 *)v33 + 2;
              while (1)
              {
                v20 = *v19 - 48;
                if (v20 > 9)
                  goto LABEL_33;
                v21 = 10 * v12;
                if ((unsigned __int128)(v12 * (__int128)10) >> 64 != (10 * v12) >> 63)
                  goto LABEL_33;
                v12 = v21 + v20;
                if (__OFADD__(v21, v20))
                  goto LABEL_33;
                LOBYTE(v5) = 0;
                ++v19;
                if (!--v18)
                  goto LABEL_46;
              }
            }
          }
        }
LABEL_45:
        LOBYTE(v5) = 0;
        goto LABEL_46;
      }
      swift_bridgeObjectRelease();
    }
  }
  v24 = 5;
LABEL_59:
  if (qword_2542992E8 != -1)
    swift_once();
  v28 = sub_235CA3708();
  __swift_project_value_buffer(v28, (uint64_t)qword_254299660);
  v29 = sub_235CA36FC();
  v30 = sub_235CA3924();
  if (os_log_type_enabled(v29, v30))
  {
    v31 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v31 = 134217984;
    v33[0] = v24;
    sub_235CA3A14();
    _os_log_impl(&dword_235C5E000, v29, v30, "maxEagerRcAllowed: %ld", v31, 0xCu);
    MEMORY[0x23B7DE144](v31, -1, -1);
  }

}

uint64_t sub_235C97920(void *a1, void *a2, uint64_t a3, void *a4, void *a5, uint64_t a6)
{
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
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t inited;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  id v37;
  id v39[4];
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _BYTE v44[40];
  _BYTE v45[40];

  v7 = v6;
  v42 = a6;
  v43 = a3;
  v39[0] = a5;
  v39[1] = a1;
  v39[2] = a2;
  v39[3] = a4;
  v8 = sub_235CA3708();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v39 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_235CA36F0();
  v40 = *(_QWORD *)(v12 - 8);
  v41 = v12;
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)v39 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = v6 + qword_2542996B0;
  v16 = sub_235CA2790();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v15, 1, 1, v16);
  v17 = qword_2542996C8;
  *(_BYTE *)(v7 + qword_2542996C8) = 0;
  *(_QWORD *)(v7 + qword_254299688) = MEMORY[0x24BEE4AF8];
  v18 = v7 + qword_2542996A0;
  *(_OWORD *)v18 = 0u;
  *(_OWORD *)(v18 + 16) = 0u;
  *(_QWORD *)(v18 + 32) = 0;
  v19 = v7 + qword_2542996D8;
  v20 = sub_235CA3498();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(v19, 1, 1, v20);
  *(_BYTE *)(v7 + qword_254299698) = 0;
  v21 = (_QWORD *)(v7 + qword_2542996B8);
  *v21 = 0;
  v21[1] = 0;
  *(_QWORD *)(v7 + qword_2542996A8) = 0;
  *(_QWORD *)(v7 + qword_2542996D0) = 0;
  v22 = qword_254299690;
  *(_BYTE *)(v7 + qword_254299690) = 0;
  v23 = qword_2542990E8;
  swift_retain();
  if (v23 != -1)
    swift_once();
  v24 = (id)qword_2542994C8;
  sub_235CA36D8();
  sub_235CA39A8();
  v25 = (id)qword_2542994C8;
  sub_235CA36C0();

  v26 = type metadata accessor for MyriadDecisionMonitor();
  inited = swift_initStaticObject();
  v28 = (uint64_t *)(v7 + qword_254299318);
  v28[3] = v26;
  v28[4] = (uint64_t)&off_25070C308;
  *v28 = inited;
  if (qword_2542990D8 != -1)
    swift_once();
  *(_QWORD *)(v7 + qword_254299328) = qword_2542994C0;
  swift_retain();
  _s9ASRBridge9AsrBridgeC27configuredMaxEagerRCAllowedSivgZ_0();
  *(_QWORD *)(v7 + qword_2542996C0) = v29;
  *(_BYTE *)(v7 + v22) = AFDeviceSupportsSiriMUX();
  type metadata accessor for AsrCandidateRequestCacheManager();
  swift_allocObject();
  *(_QWORD *)(v7 + qword_254299330) = sub_235C9B8FC();
  *(_BYTE *)(v7 + qword_254299320) = AFDeviceSupportsMedoc();
  *(_BYTE *)(v7 + v17) = AFDeviceSupportsPatientSiri();
  swift_release();
  v30 = v43;
  sub_235C71390(v43, (uint64_t)v45);
  v31 = v42;
  sub_235C71390(v42, (uint64_t)v44);
  v32 = qword_2542992E8;
  swift_unknownObjectRetain();
  v33 = v39[0];
  if (v32 != -1)
    swift_once();
  v34 = __swift_project_value_buffer(v8, (uint64_t)qword_254299660);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v34, v8);
  v35 = sub_235CA3594();
  swift_retain();
  v36 = AFDeviceSupportsHybridUOD();
  sub_235C8F408(v36);
  sub_235CA399C();
  v37 = (id)qword_2542994C8;
  sub_235CA36CC();
  swift_release();

  __swift_destroy_boxed_opaque_existential_1(v31);
  __swift_destroy_boxed_opaque_existential_1(v30);
  (*(void (**)(char *, uint64_t))(v40 + 8))(v14, v41);
  return v35;
}

unint64_t sub_235C97D5C()
{
  unint64_t result;

  result = qword_256377A10;
  if (!qword_256377A10)
  {
    result = MEMORY[0x23B7DE090](&unk_235CA4E08, &type metadata for AsrBridge.AsrBridgeError);
    atomic_store(result, (unint64_t *)&qword_256377A10);
  }
  return result;
}

unint64_t sub_235C97DA0()
{
  unint64_t result;

  result = qword_254299220;
  if (!qword_254299220)
  {
    result = MEMORY[0x23B7DE090](&protocol conformance descriptor for IdentityFeatureFlags, &type metadata for IdentityFeatureFlags);
    atomic_store(result, (unint64_t *)&qword_254299220);
  }
  return result;
}

uint64_t sub_235C97DE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, unsigned __int8 a20,uint64_t a21,char a22,unsigned __int8 a23,unsigned __int8 a24,uint64_t a25,unsigned __int8 a26,unsigned __int8 a27,uint64_t a28)
{
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  id v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v50;
  uint64_t v51;
  int v52;
  int v53;
  int v54;
  uint64_t v55;
  int v56;
  int v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  __int128 v77[2];
  _QWORD v78[5];

  v75 = a7;
  v76 = a8;
  v61 = a6;
  v58 = a5;
  v64 = a4;
  v72 = a3;
  v73 = a1;
  v74 = a2;
  v67 = a16;
  v65 = a15;
  v57 = a27;
  v56 = a26;
  v55 = a25;
  v54 = a20;
  v53 = a24;
  v52 = a23;
  v51 = a19;
  v71 = a10;
  v50 = a18;
  v63 = a12;
  v66 = a11;
  v59 = a14;
  v29 = sub_235CA2790();
  v69 = *(_QWORD *)(v29 - 8);
  v70 = v29;
  MEMORY[0x24BDAC7A8](v29);
  v68 = (char *)&v50 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  v78[3] = type metadata accessor for MyriadDecisionMonitor();
  v78[4] = &off_25070C308;
  v78[0] = a13;
  v31 = a28 + qword_2542994F0;
  v32 = sub_235CA3420();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v32 - 8) + 56))(v31, 1, 1, v32);
  *(_BYTE *)(a28 + qword_2542994E8) = 0;
  *(_QWORD *)(a28 + qword_2542994E0) = 0;
  *(_QWORD *)(a28 + qword_2542994F8) = 0;
  *(_BYTE *)(a28 + qword_254299500) = 0;
  v33 = (_QWORD *)(a28 + qword_2542991D0);
  *v33 = 0;
  v33[1] = 0;
  *(_BYTE *)(a28 + qword_254299168) = 0;
  *(_QWORD *)(a28 + qword_254299160) = a21;
  *(_BYTE *)(a28 + qword_254299178) = a22;
  sub_235C71390(a11, a28 + qword_254299190);
  sub_235C71390(a12, a28 + qword_2542991F8);
  v34 = a28 + qword_254299518;
  v60 = sub_235CA3498();
  v62 = *(_QWORD *)(v60 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v62 + 16))(v34, a6, v60);
  *(_QWORD *)(a28 + qword_2542991F0) = a17;
  sub_235C71390(a9, a28 + qword_2542991E8);
  sub_235C71390((uint64_t)v78, a28 + qword_2542991B0);
  v35 = v51;
  *v33 = v50;
  v33[1] = v35;
  swift_retain();
  swift_retain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a28 + qword_254299180) = v52;
  *(_BYTE *)(a28 + qword_2542991B8) = v53;
  *(_BYTE *)(a28 + qword_2542994D0) = v54;
  v36 = v55;
  *(_QWORD *)(a28 + qword_2542991D8) = v55;
  *(_BYTE *)(a28 + qword_254299508) = v56;
  *(_BYTE *)(a28 + qword_254299510) = v57;
  sub_235C71390(a9, (uint64_t)v77);
  type metadata accessor for BufferedResultCandidateHandler();
  v37 = (_QWORD *)swift_allocObject();
  v37[10] = 0;
  v38 = v58;
  swift_bridgeObjectRetain();
  v39 = MEMORY[0x24BEE4AF8];
  v37[11] = sub_235C8EC94(MEMORY[0x24BEE4AF8], &qword_256377A58);
  v37[12] = 0;
  v37[7] = v64;
  v37[8] = v38;
  sub_235C7131C(v77, (uint64_t)(v37 + 2));
  *(_QWORD *)(a28 + qword_254299208) = v37;
  v40 = v59;
  *(_QWORD *)(a28 + qword_2542991A0) = v59;
  v41 = v65;
  *(_QWORD *)(a28 + qword_2542991C8) = v65;
  v37[9] = v36;
  *(_QWORD *)(a28 + qword_254299150) = v67;
  type metadata accessor for ASRMUXRequestContext();
  v42 = swift_allocObject();
  v43 = v41;
  swift_retain();
  swift_retain();
  v44 = v40;
  *(_QWORD *)(v42 + 24) = sub_235C8F204(v39, (uint64_t *)&unk_256377A80);
  *(_QWORD *)(v42 + 32) = sub_235C8EF3C(v39);
  *(_BYTE *)(v42 + 40) = 0;
  *(_QWORD *)(v42 + 16) = v37;
  *(_QWORD *)(a28 + qword_2542994D8) = v42;
  swift_release();
  v45 = v69;
  v46 = v72;
  v47 = v70;
  (*(void (**)(char *, uint64_t, uint64_t))(v69 + 16))(v68, v72, v70);
  sub_235C71390(a9, (uint64_t)v77);
  v48 = sub_235CA3600();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v78);
  __swift_destroy_boxed_opaque_existential_1(v63);
  __swift_destroy_boxed_opaque_existential_1(v66);
  __swift_destroy_boxed_opaque_existential_1(a9);
  (*(void (**)(uint64_t, uint64_t))(v62 + 8))(v61, v60);
  (*(void (**)(uint64_t, uint64_t))(v45 + 8))(v46, v47);
  return v48;
}

uint64_t type metadata accessor for AsrBridge()
{
  uint64_t result;

  result = qword_2542989C8;
  if (!qword_2542989C8)
    return swift_getSingletonMetadata();
  return result;
}

void sub_235C98394()
{
  unint64_t v0;
  unint64_t v1;

  sub_235C984BC(319, &qword_254299058, (void (*)(uint64_t))MEMORY[0x24BDCEA58]);
  if (v0 <= 0x3F)
  {
    sub_235C984BC(319, &qword_2542990B8, (void (*)(uint64_t))MEMORY[0x24BE9B488]);
    if (v1 <= 0x3F)
      swift_initClassMetadata2();
  }
}

uint64_t method lookup function for AsrBridge()
{
  return swift_lookUpClassMethod();
}

void sub_235C984BC(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    a3(255);
    v4 = sub_235CA3A08();
    if (!v5)
      atomic_store(v4, a2);
  }
}

uint64_t sub_235C98508()
{
  return type metadata accessor for AsrBridge();
}

uint64_t getEnumTagSinglePayload for AsrBridge.AsrBridgeError(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for AsrBridge.AsrBridgeError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_235C985EC + 4 * byte_235CA4D05[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_235C98620 + 4 * asc_235CA4D00[v4]))();
}

uint64_t sub_235C98620(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_235C98628(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x235C98630);
  return result;
}

uint64_t sub_235C9863C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x235C98644);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_235C98648(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_235C98650(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_235C9865C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for AsrBridge.AsrBridgeError()
{
  return &type metadata for AsrBridge.AsrBridgeError;
}

unint64_t sub_235C98678()
{
  unint64_t result;

  result = qword_256377A30;
  if (!qword_256377A30)
  {
    result = MEMORY[0x23B7DE090](&unk_235CA4DA0, &type metadata for AsrBridge.AsrBridgeError);
    atomic_store(result, (unint64_t *)&qword_256377A30);
  }
  return result;
}

uint64_t sub_235C986BC(void *a1, uint64_t a2, uint64_t (*a3)(_QWORD, _QWORD), uint64_t a4)
{
  return sub_235C8B64C(a1, a3, a4);
}

uint64_t sub_235C986C8(void *a1, uint64_t a2, uint64_t (*a3)(_QWORD, _QWORD), uint64_t a4)
{
  return sub_235C8B398(a1, a3, a4);
}

void sub_235C986D4(void *a1, uint64_t a2, void (*a3)(_QWORD, _QWORD), void *a4)
{
  sub_235C8AB80(a1, a3, a4);
}

uint64_t sub_235C986E0(void *a1, uint64_t a2, void (*a3)(_QWORD, _QWORD), uint64_t a4)
{
  return sub_235C8A44C(a1, a3, a4);
}

void sub_235C98704()
{
  sub_235C8FFC0();
}

void sub_235C98744(void *a1)
{
  uint64_t v1;

  sub_235C95F30(a1, v1);
}

uint64_t sub_235C9874C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

uint64_t sub_235C98794()
{
  uint64_t v0;

  return sub_235C813D8(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

void sub_235C987A0(void *a1)
{
  uint64_t v1;

  sub_235C95474(a1, v1);
}

uint64_t objectdestroyTm()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

uint64_t sub_235C987F8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_235C9883C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for CacheKey();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_235C98884()
{
  sub_235C988BC(0xD00000000000001CLL, 0x8000000235CA6AC0);
}

void sub_235C988A0()
{
  sub_235C988BC(0xD000000000000016, 0x8000000235CA6AA0);
}

void sub_235C988BC(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  os_log_type_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *oslog;
  uint64_t v9;

  if (qword_2542992E8 != -1)
    swift_once();
  v4 = sub_235CA3708();
  __swift_project_value_buffer(v4, (uint64_t)qword_254299660);
  oslog = sub_235CA36FC();
  v5 = sub_235CA3930();
  if (os_log_type_enabled(oslog, v5))
  {
    v6 = swift_slowAlloc();
    v7 = swift_slowAlloc();
    v9 = v7;
    *(_DWORD *)v6 = 136315394;
    sub_235C944B8(a1, a2, &v9);
    sub_235CA3A14();
    *(_WORD *)(v6 + 12) = 2080;
    sub_235C944B8(0xD00000000000001FLL, 0x8000000235CA4E30, &v9);
    sub_235CA3A14();
    _os_log_impl(&dword_235C5E000, oslog, v5, "Unexpected %s called on base %s class", (uint8_t *)v6, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x23B7DE144](v7, -1, -1);
    MEMORY[0x23B7DE144](v6, -1, -1);

  }
  else
  {

  }
}

void sub_235C98A7C()
{
  uint64_t v0;
  os_log_type_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *oslog;
  uint64_t v5;

  if (qword_2542992E8 != -1)
    swift_once();
  v0 = sub_235CA3708();
  __swift_project_value_buffer(v0, (uint64_t)qword_254299660);
  oslog = sub_235CA36FC();
  v1 = sub_235CA3930();
  if (os_log_type_enabled(oslog, v1))
  {
    v2 = swift_slowAlloc();
    v3 = swift_slowAlloc();
    v5 = v3;
    *(_DWORD *)v2 = 136315394;
    sub_235C944B8(0xD000000000000032, 0x8000000235CA6580, &v5);
    sub_235CA3A14();
    *(_WORD *)(v2 + 12) = 2080;
    sub_235C944B8(0xD00000000000001FLL, 0x8000000235CA4E30, &v5);
    sub_235CA3A14();
    _os_log_impl(&dword_235C5E000, oslog, v1, "Unexpected %s called on base %s class", (uint8_t *)v2, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x23B7DE144](v3, -1, -1);
    MEMORY[0x23B7DE144](v2, -1, -1);

  }
  else
  {

  }
}

id sub_235C98EDC()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SpeechRecognizerResponseHandler();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_235C98FA8()
{
  return type metadata accessor for SpeechRecognizerResponseHandler();
}

uint64_t type metadata accessor for SpeechRecognizerResponseHandler()
{
  uint64_t result;

  result = qword_254299290;
  if (!qword_254299290)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_235C98FEC()
{
  uint64_t result;
  unint64_t v1;

  result = sub_235CA2790();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_235C99088(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_235C990C0 + 4 * byte_235CA4EB8[a1]))(0xD00000000000001ALL, 0x8000000235CA5040);
}

uint64_t sub_235C990C0(uint64_t a1)
{
  return a1 + 7;
}

uint64_t sub_235C99200()
{
  sub_235CA3BD0();
  sub_235CA2790();
  sub_235C69C18(&qword_254299030, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  sub_235CA37C8();
  swift_bridgeObjectRetain();
  sub_235CA381C();
  swift_bridgeObjectRelease();
  return sub_235CA3BE8();
}

uint64_t sub_235C992A4()
{
  sub_235CA2790();
  sub_235C69C18(&qword_254299030, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  sub_235CA37C8();
  swift_bridgeObjectRetain();
  sub_235CA381C();
  return swift_bridgeObjectRelease();
}

uint64_t sub_235C9932C()
{
  sub_235CA3BD0();
  sub_235CA2790();
  sub_235C69C18(&qword_254299030, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  sub_235CA37C8();
  swift_bridgeObjectRetain();
  sub_235CA381C();
  swift_bridgeObjectRelease();
  return sub_235CA3BE8();
}

uint64_t sub_235C993CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  if ((sub_235CA2778() & 1) == 0)
    return 0;
  v6 = *(int *)(a3 + 20);
  v7 = *(_QWORD *)(a1 + v6);
  v8 = *(_QWORD *)(a1 + v6 + 8);
  v9 = (_QWORD *)(a2 + v6);
  if (v7 == *v9 && v8 == v9[1])
    return 1;
  else
    return sub_235CA3B88();
}

uint64_t sub_235C99440(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  char *v25;
  uint64_t v26;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD aBlock[6];

  v5 = v4;
  v29 = a1;
  v30 = a3;
  v28 = a2;
  v33 = sub_235CA3738();
  v36 = *(_QWORD *)(v33 - 8);
  MEMORY[0x24BDAC7A8](v33);
  v31 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_235CA375C();
  v34 = *(_QWORD *)(v8 - 8);
  v35 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_235CA2790();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(_QWORD *)(v12 + 64);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = *(_QWORD *)(v4 + 16);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, a4, v11);
  v15 = (*(unsigned __int8 *)(v12 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  v16 = (v13 + v15 + 7) & 0xFFFFFFFFFFFFFFF8;
  v17 = (v16 + 23) & 0xFFFFFFFFFFFFFFF8;
  v18 = (v17 + 15) & 0xFFFFFFFFFFFFFFF8;
  v19 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v12 + 32))(v19 + v15, v14, v11);
  v20 = (_QWORD *)(v19 + v16);
  v21 = v30;
  *v20 = v28;
  v20[1] = v21;
  *(_QWORD *)(v19 + v17) = v5;
  v22 = v29;
  *(_QWORD *)(v19 + v18) = v29;
  aBlock[4] = sub_235C9F370;
  aBlock[5] = v19;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_235C9F468;
  aBlock[3] = &block_descriptor_24;
  v23 = _Block_copy(aBlock);
  v24 = v22;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_235CA3744();
  v37 = MEMORY[0x24BEE4AF8];
  sub_235C69C18(&qword_2542990D0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254299350);
  sub_235C9F408((unint64_t *)&qword_254299360, (uint64_t *)&unk_254299350);
  v25 = v31;
  v26 = v33;
  sub_235CA3A38();
  MEMORY[0x23B7DDA18](0, v10, v25, v23);
  _Block_release(v23);
  (*(void (**)(char *, uint64_t))(v36 + 8))(v25, v26);
  (*(void (**)(char *, uint64_t))(v34 + 8))(v10, v35);
  return swift_release();
}

uint64_t sub_235C996F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  id v30;
  char isUniquelyReferenced_nonNull_native;
  id v33;
  char v34;
  uint64_t v35;
  int v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  char v42;
  uint64_t v43;
  uint64_t v44;

  v10 = type metadata accessor for CacheKey();
  v11 = MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v35 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v35 - v14;
  v16 = sub_235CA2790();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v15, a1, v16);
  v17 = &v15[*(int *)(v10 + 20)];
  *(_QWORD *)v17 = a2;
  *((_QWORD *)v17 + 1) = a3;
  v18 = (uint64_t *)(a4 + 24);
  swift_beginAccess();
  v19 = *(_QWORD *)(a4 + 24);
  v20 = *(_QWORD *)(v19 + 16);
  swift_bridgeObjectRetain();
  if (v20)
  {
    swift_bridgeObjectRetain();
    v21 = sub_235C9BC90((uint64_t)v15);
    if ((v22 & 1) != 0)
    {
      v23 = *(_QWORD *)(v19 + 56) + 56 * v21;
      v24 = *(void **)v23;
      v25 = *(_QWORD *)(v23 + 8);
      v26 = *(_BYTE *)(v23 + 16);
      v27 = *(_QWORD *)(v23 + 24);
      v36 = *(unsigned __int8 *)(v23 + 32);
      v28 = *(_QWORD *)(v23 + 48);
      v35 = *(_QWORD *)(v23 + 40);
      swift_bridgeObjectRetain_n();
      v29 = v24;
      swift_bridgeObjectRelease();

      sub_235C9F05C((uint64_t)v15, (uint64_t)v13);
      v38 = a5;
      v39 = v25;
      v40 = v26;
      v41 = v27;
      v42 = v36;
      v43 = v35;
      v44 = v28;
      swift_beginAccess();
      v30 = a5;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v37 = *v18;
      *v18 = 0x8000000000000000;
      sub_235C9DE38((uint64_t)&v38, (uint64_t)v13, isUniquelyReferenced_nonNull_native);
      *v18 = v37;
      swift_bridgeObjectRelease();
      sub_235C9BFAC((uint64_t)v13);
      swift_endAccess();
      sub_235C9BFAC((uint64_t)v15);
      return swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
  }
  sub_235C9F05C((uint64_t)v15, (uint64_t)v13);
  v38 = a5;
  v39 = 0;
  v40 = 1;
  v41 = 0;
  v42 = 1;
  v43 = 0;
  v44 = 0;
  swift_beginAccess();
  v33 = a5;
  v34 = swift_isUniquelyReferenced_nonNull_native();
  v37 = *v18;
  *v18 = 0x8000000000000000;
  sub_235C9DE38((uint64_t)&v38, (uint64_t)v13, v34);
  *v18 = v37;
  swift_bridgeObjectRelease();
  sub_235C9BFAC((uint64_t)v13);
  swift_endAccess();
  return sub_235C9BFAC((uint64_t)v15);
}

uint64_t sub_235C99988@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t result;
  id v23;
  _QWORD v24[8];

  v10 = type metadata accessor for CacheKey();
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_235CA2790();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v12, a1, v13);
  v14 = &v12[*(int *)(v10 + 20)];
  *(_QWORD *)v14 = a2;
  *((_QWORD *)v14 + 1) = a3;
  swift_beginAccess();
  v15 = *(_QWORD *)(a4 + 24);
  v16 = *(_QWORD *)(v15 + 16);
  swift_bridgeObjectRetain();
  if (!v16)
    goto LABEL_6;
  swift_bridgeObjectRetain();
  v17 = sub_235C9BC90((uint64_t)v12);
  if ((v18 & 1) == 0)
  {
    swift_bridgeObjectRelease();
LABEL_6:
    result = sub_235C9BFAC((uint64_t)v12);
    goto LABEL_7;
  }
  v19 = *(_QWORD *)(v15 + 56) + 56 * v17;
  v20 = *(void **)v19;
  v24[7] = *(unsigned __int8 *)(v19 + 16);
  v24[2] = *(unsigned __int8 *)(v19 + 32);
  v24[1] = *(_QWORD *)(v19 + 40);
  swift_bridgeObjectRetain();
  v21 = v20;
  swift_bridgeObjectRelease();
  result = sub_235C9BFAC((uint64_t)v12);
  if (v20 == (void *)1)
  {
LABEL_7:
    v20 = 0;
    goto LABEL_8;
  }
  v23 = v21;
  result = (uint64_t)sub_235C9BF7C(v20);
LABEL_8:
  *a5 = v20;
  return result;
}

uint64_t sub_235C99B18(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_235C99F78(a1, a2, a3, a4, a5, (uint64_t)&unk_25070CE68, (uint64_t)sub_235C9F250, (uint64_t)&block_descriptor_18);
}

uint64_t sub_235C99B34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  id v30;
  char v31;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v34;
  id v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  char v41;
  uint64_t v42;
  uint64_t v43;

  v12 = type metadata accessor for CacheKey();
  v13 = MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v34 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v34 - v16;
  v18 = sub_235CA2790();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(v17, a1, v18);
  v19 = &v17[*(int *)(v12 + 20)];
  *(_QWORD *)v19 = a2;
  *((_QWORD *)v19 + 1) = a3;
  v20 = (uint64_t *)(a4 + 24);
  swift_beginAccess();
  v21 = *(_QWORD *)(a4 + 24);
  v22 = *(_QWORD *)(v21 + 16);
  swift_bridgeObjectRetain();
  if (!v22)
    goto LABEL_5;
  swift_bridgeObjectRetain();
  v23 = sub_235C9BC90((uint64_t)v17);
  if ((v24 & 1) == 0)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    sub_235C9F05C((uint64_t)v17, (uint64_t)v15);
    v37 = 0;
    v38 = a5;
    v39 = a6 & 1;
    v40 = 0;
    v41 = 1;
    v42 = 0;
    v43 = 0;
    swift_beginAccess();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v36 = *v20;
    *v20 = 0x8000000000000000;
    sub_235C9DE38((uint64_t)&v37, (uint64_t)v15, isUniquelyReferenced_nonNull_native);
    *v20 = v36;
    swift_bridgeObjectRelease();
    sub_235C9BFAC((uint64_t)v15);
    swift_endAccess();
    return sub_235C9BFAC((uint64_t)v17);
  }
  v25 = *(_QWORD *)(v21 + 56) + 56 * v23;
  v26 = *(void **)v25;
  v27 = *(_QWORD *)(v25 + 24);
  v28 = *(_BYTE *)(v25 + 32);
  v29 = *(_QWORD *)(v25 + 48);
  v34 = *(_QWORD *)(v25 + 40);
  swift_bridgeObjectRetain();
  v35 = v26;
  swift_bridgeObjectRelease();
  sub_235C9F05C((uint64_t)v17, (uint64_t)v15);
  v37 = v26;
  v38 = a5;
  v39 = a6 & 1;
  v40 = v27;
  v41 = v28;
  v42 = v34;
  v43 = v29;
  swift_beginAccess();
  v30 = v35;
  swift_bridgeObjectRetain();
  v31 = swift_isUniquelyReferenced_nonNull_native();
  v36 = *v20;
  *v20 = 0x8000000000000000;
  sub_235C9DE38((uint64_t)&v37, (uint64_t)v15, v31);
  *v20 = v36;
  swift_bridgeObjectRelease();
  sub_235C9BFAC((uint64_t)v15);
  swift_endAccess();
  swift_bridgeObjectRelease();

  return sub_235C9BFAC((uint64_t)v17);
}

uint64_t sub_235C99DCC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  char v22;
  id v23;
  uint64_t result;
  _QWORD v25[6];

  v10 = type metadata accessor for CacheKey();
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_235CA2790();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v12, a1, v13);
  v14 = &v12[*(int *)(v10 + 20)];
  *(_QWORD *)v14 = a2;
  *((_QWORD *)v14 + 1) = a3;
  swift_beginAccess();
  v15 = *(_QWORD *)(a4 + 24);
  v16 = *(_QWORD *)(v15 + 16);
  swift_bridgeObjectRetain();
  if (!v16)
    goto LABEL_6;
  swift_bridgeObjectRetain();
  v17 = sub_235C9BC90((uint64_t)v12);
  if ((v18 & 1) == 0)
  {
    swift_bridgeObjectRelease();
LABEL_6:
    result = sub_235C9BFAC((uint64_t)v12);
    goto LABEL_7;
  }
  v19 = *(_QWORD *)(v15 + 56) + 56 * v17;
  v21 = *(void **)v19;
  v20 = *(_QWORD *)(v19 + 8);
  v22 = *(_BYTE *)(v19 + 16);
  v25[5] = *(unsigned __int8 *)(v19 + 32);
  v25[0] = *(_QWORD *)(v19 + 40);
  swift_bridgeObjectRetain();
  v23 = v21;
  swift_bridgeObjectRelease();
  result = sub_235C9BFAC((uint64_t)v12);
  if (v21 == (void *)1)
  {
LABEL_7:
    v20 = 0;
    v22 = 1;
    goto LABEL_8;
  }
  result = (uint64_t)sub_235C9BF7C(v21);
LABEL_8:
  *(_QWORD *)a5 = v20;
  *(_BYTE *)(a5 + 8) = v22;
  return result;
}

uint64_t sub_235C99F5C(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_235C99F78(a1, a2, a3, a4, a5, (uint64_t)&unk_25070CE18, (uint64_t)sub_235C9F1A8, (uint64_t)&block_descriptor_12);
}

uint64_t sub_235C99F78(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  unint64_t v24;
  void *v25;
  char *v26;
  uint64_t v27;
  _QWORD v29[2];
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD aBlock[7];

  v37 = a8;
  v35 = a7;
  v29[1] = a6;
  v30 = a3;
  v31 = a4;
  v32 = a1;
  v33 = a2;
  v38 = sub_235CA3738();
  v41 = *(_QWORD *)(v38 - 8);
  MEMORY[0x24BDAC7A8](v38);
  v34 = (char *)v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_235CA375C();
  v39 = *(_QWORD *)(v11 - 8);
  v40 = v11;
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_235CA2790();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = *(_QWORD *)(v15 + 64);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)v29 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v36 = *(_QWORD *)(v8 + 16);
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v17, a5, v14);
  v18 = (*(unsigned __int8 *)(v15 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  v19 = (v16 + v18 + 7) & 0xFFFFFFFFFFFFFFF8;
  v20 = (v19 + 23) & 0xFFFFFFFFFFFFFFF8;
  v21 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v15 + 32))(v21 + v18, v17, v14);
  v22 = (_QWORD *)(v21 + v19);
  v23 = v31;
  *v22 = v30;
  v22[1] = v23;
  *(_QWORD *)(v21 + v20) = v8;
  v24 = v21 + ((v20 + 15) & 0xFFFFFFFFFFFFFFF8);
  *(_QWORD *)v24 = v32;
  *(_BYTE *)(v24 + 8) = v33 & 1;
  aBlock[4] = v35;
  aBlock[5] = v21;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_235C9F468;
  aBlock[3] = v37;
  v25 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_235CA3744();
  v42 = MEMORY[0x24BEE4AF8];
  sub_235C69C18(&qword_2542990D0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254299350);
  sub_235C9F408((unint64_t *)&qword_254299360, (uint64_t *)&unk_254299350);
  v26 = v34;
  v27 = v38;
  sub_235CA3A38();
  MEMORY[0x23B7DDA18](0, v13, v26, v25);
  _Block_release(v25);
  (*(void (**)(char *, uint64_t))(v41 + 8))(v26, v27);
  (*(void (**)(char *, uint64_t))(v39 + 8))(v13, v40);
  return swift_release();
}

uint64_t sub_235C9A22C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  id v30;
  char v31;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v34;
  id v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  char v41;
  uint64_t v42;
  uint64_t v43;

  v12 = type metadata accessor for CacheKey();
  v13 = MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v34 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v34 - v16;
  v18 = sub_235CA2790();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(v17, a1, v18);
  v19 = &v17[*(int *)(v12 + 20)];
  *(_QWORD *)v19 = a2;
  *((_QWORD *)v19 + 1) = a3;
  v20 = (uint64_t *)(a4 + 24);
  swift_beginAccess();
  v21 = *(_QWORD *)(a4 + 24);
  v22 = *(_QWORD *)(v21 + 16);
  swift_bridgeObjectRetain();
  if (!v22)
    goto LABEL_5;
  swift_bridgeObjectRetain();
  v23 = sub_235C9BC90((uint64_t)v17);
  if ((v24 & 1) == 0)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    sub_235C9F05C((uint64_t)v17, (uint64_t)v15);
    v37 = 0;
    v38 = 0;
    v39 = 1;
    v40 = a5;
    v41 = a6 & 1;
    v42 = 0;
    v43 = 0;
    swift_beginAccess();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v36 = *v20;
    *v20 = 0x8000000000000000;
    sub_235C9DE38((uint64_t)&v37, (uint64_t)v15, isUniquelyReferenced_nonNull_native);
    *v20 = v36;
    swift_bridgeObjectRelease();
    sub_235C9BFAC((uint64_t)v15);
    swift_endAccess();
    return sub_235C9BFAC((uint64_t)v17);
  }
  v25 = *(_QWORD *)(v21 + 56) + 56 * v23;
  v26 = *(void **)v25;
  v27 = *(_QWORD *)(v25 + 8);
  v28 = *(_BYTE *)(v25 + 16);
  v29 = *(_QWORD *)(v25 + 48);
  v34 = *(_QWORD *)(v25 + 40);
  swift_bridgeObjectRetain();
  v35 = v26;
  swift_bridgeObjectRelease();
  sub_235C9F05C((uint64_t)v17, (uint64_t)v15);
  v37 = v26;
  v38 = v27;
  v39 = v28;
  v40 = a5;
  v41 = a6 & 1;
  v42 = v34;
  v43 = v29;
  swift_beginAccess();
  v30 = v35;
  swift_bridgeObjectRetain();
  v31 = swift_isUniquelyReferenced_nonNull_native();
  v36 = *v20;
  *v20 = 0x8000000000000000;
  sub_235C9DE38((uint64_t)&v37, (uint64_t)v15, v31);
  *v20 = v36;
  swift_bridgeObjectRelease();
  sub_235C9BFAC((uint64_t)v15);
  swift_endAccess();
  swift_bridgeObjectRelease();

  return sub_235C9BFAC((uint64_t)v17);
}

uint64_t sub_235C9A4C0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  char v22;
  id v23;
  uint64_t result;
  _QWORD v25[6];

  v10 = type metadata accessor for CacheKey();
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_235CA2790();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v12, a1, v13);
  v14 = &v12[*(int *)(v10 + 20)];
  *(_QWORD *)v14 = a2;
  *((_QWORD *)v14 + 1) = a3;
  swift_beginAccess();
  v15 = *(_QWORD *)(a4 + 24);
  v16 = *(_QWORD *)(v15 + 16);
  swift_bridgeObjectRetain();
  if (!v16)
    goto LABEL_6;
  swift_bridgeObjectRetain();
  v17 = sub_235C9BC90((uint64_t)v12);
  if ((v18 & 1) == 0)
  {
    swift_bridgeObjectRelease();
LABEL_6:
    result = sub_235C9BFAC((uint64_t)v12);
    goto LABEL_7;
  }
  v19 = *(_QWORD *)(v15 + 56) + 56 * v17;
  v20 = *(void **)v19;
  v25[5] = *(unsigned __int8 *)(v19 + 16);
  v21 = *(_QWORD *)(v19 + 24);
  v22 = *(_BYTE *)(v19 + 32);
  v25[0] = *(_QWORD *)(v19 + 40);
  swift_bridgeObjectRetain();
  v23 = v20;
  swift_bridgeObjectRelease();
  result = sub_235C9BFAC((uint64_t)v12);
  if (v20 == (void *)1)
  {
LABEL_7:
    v21 = 0;
    v22 = 1;
    goto LABEL_8;
  }
  result = (uint64_t)sub_235C9BF7C(v20);
LABEL_8:
  *(_QWORD *)a5 = v21;
  *(_BYTE *)(a5 + 8) = v22;
  return result;
}

uint64_t sub_235C9A650(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  void *v23;
  char *v24;
  uint64_t v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD aBlock[6];

  v28 = a3;
  v29 = a4;
  v30 = a1;
  v31 = a2;
  v34 = sub_235CA3738();
  v37 = *(_QWORD *)(v34 - 8);
  MEMORY[0x24BDAC7A8](v34);
  v32 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_235CA375C();
  v35 = *(_QWORD *)(v8 - 8);
  v36 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_235CA2790();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(_QWORD *)(v12 + 64);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = *(_QWORD *)(v5 + 16);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, a5, v11);
  v15 = (*(unsigned __int8 *)(v12 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  v16 = (v13 + v15 + 7) & 0xFFFFFFFFFFFFFFF8;
  v17 = (v16 + 23) & 0xFFFFFFFFFFFFFFF8;
  v18 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v12 + 32))(v18 + v15, v14, v11);
  v19 = (_QWORD *)(v18 + v16);
  v20 = v29;
  *v19 = v28;
  v19[1] = v20;
  *(_QWORD *)(v18 + v17) = v5;
  v21 = (_QWORD *)(v18 + ((v17 + 15) & 0xFFFFFFFFFFFFFFF8));
  v22 = v31;
  *v21 = v30;
  v21[1] = v22;
  aBlock[4] = sub_235C9F144;
  aBlock[5] = v18;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_235C9F468;
  aBlock[3] = &block_descriptor_6_0;
  v23 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_235CA3744();
  v38 = MEMORY[0x24BEE4AF8];
  sub_235C69C18(&qword_2542990D0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254299350);
  sub_235C9F408((unint64_t *)&qword_254299360, (uint64_t *)&unk_254299350);
  v24 = v32;
  v25 = v34;
  sub_235CA3A38();
  MEMORY[0x23B7DDA18](0, v10, v24, v23);
  _Block_release(v23);
  (*(void (**)(char *, uint64_t))(v37 + 8))(v24, v25);
  (*(void (**)(char *, uint64_t))(v35 + 8))(v10, v36);
  return swift_release();
}

void sub_235C9A900(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE *v15;
  uint64_t v16;
  _BYTE *v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  id v28;
  id v29;
  char isUniquelyReferenced_nonNull_native;
  char v31;
  _BYTE v32[12];
  int v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  char v41;
  uint64_t v42;
  uint64_t v43;

  v12 = type metadata accessor for CacheKey();
  v13 = MEMORY[0x24BDAC7A8](v12);
  v15 = &v32[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v13);
  v17 = &v32[-v16];
  v18 = sub_235CA2790();
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(v17, a1, v18);
  v19 = &v17[*(int *)(v12 + 20)];
  *v19 = a2;
  v19[1] = a3;
  v20 = (uint64_t *)(a4 + 24);
  swift_beginAccess();
  v21 = *(_QWORD *)(a4 + 24);
  v22 = *(_QWORD *)(v21 + 16);
  swift_bridgeObjectRetain();
  if (v22)
  {
    swift_bridgeObjectRetain();
    v23 = sub_235C9BC90((uint64_t)v17);
    if ((v24 & 1) != 0)
    {
      v25 = *(_QWORD *)(v21 + 56) + 56 * v23;
      v26 = *(void **)v25;
      v27 = *(_QWORD *)(v25 + 8);
      v35 = *(unsigned __int8 *)(v25 + 16);
      v34 = *(_QWORD *)(v25 + 24);
      v33 = *(unsigned __int8 *)(v25 + 32);
      swift_bridgeObjectRetain();
      v28 = v26;
      swift_bridgeObjectRelease();
      v29 = v28;
      swift_bridgeObjectRelease();
      sub_235C9F05C((uint64_t)v17, (uint64_t)v15);
      v37 = v26;
      v38 = v27;
      v39 = v35;
      v40 = v34;
      v41 = v33;
      v42 = a5;
      v43 = a6;
      swift_beginAccess();
      swift_bridgeObjectRetain_n();
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v36 = *v20;
      *v20 = 0x8000000000000000;
      sub_235C9DE38((uint64_t)&v37, (uint64_t)v15, isUniquelyReferenced_nonNull_native);
      *v20 = v36;
      swift_bridgeObjectRelease();
      sub_235C9BFAC((uint64_t)v15);
      swift_endAccess();
      sub_235C9BFAC((uint64_t)v17);
      swift_bridgeObjectRelease();

      return;
    }
    swift_bridgeObjectRelease();
  }
  sub_235C9F05C((uint64_t)v17, (uint64_t)v15);
  v37 = 0;
  v38 = 0;
  v39 = 1;
  v40 = 0;
  v41 = 1;
  v42 = a5;
  v43 = a6;
  swift_beginAccess();
  swift_bridgeObjectRetain_n();
  v31 = swift_isUniquelyReferenced_nonNull_native();
  v36 = *v20;
  *v20 = 0x8000000000000000;
  sub_235C9DE38((uint64_t)&v37, (uint64_t)v15, v31);
  *v20 = v36;
  swift_bridgeObjectRelease();
  sub_235C9BFAC((uint64_t)v15);
  swift_endAccess();
  sub_235C9BFAC((uint64_t)v17);
  swift_bridgeObjectRelease();
}

uint64_t sub_235C9ABC8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint64_t result;
  _QWORD v25[6];

  v10 = type metadata accessor for CacheKey();
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_235CA2790();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v12, a1, v13);
  v14 = &v12[*(int *)(v10 + 20)];
  *(_QWORD *)v14 = a2;
  *((_QWORD *)v14 + 1) = a3;
  swift_beginAccess();
  v15 = *(_QWORD *)(a4 + 24);
  v16 = *(_QWORD *)(v15 + 16);
  swift_bridgeObjectRetain();
  if (!v16)
    goto LABEL_6;
  swift_bridgeObjectRetain();
  v17 = sub_235C9BC90((uint64_t)v12);
  if ((v18 & 1) == 0)
  {
    swift_bridgeObjectRelease();
LABEL_6:
    result = sub_235C9BFAC((uint64_t)v12);
    goto LABEL_7;
  }
  v19 = *(_QWORD *)(v15 + 56) + 56 * v17;
  v20 = *(void **)v19;
  v25[5] = *(_QWORD *)(v19 + 24);
  v25[0] = *(unsigned __int8 *)(v19 + 32);
  v22 = *(_QWORD *)(v19 + 40);
  v21 = *(_QWORD *)(v19 + 48);
  swift_bridgeObjectRetain();
  v23 = v20;
  swift_bridgeObjectRelease();
  result = sub_235C9BFAC((uint64_t)v12);
  if (v20 != (void *)1)
  {
    swift_bridgeObjectRetain();
    result = (uint64_t)sub_235C9BF7C(v20);
    *a5 = v22;
    a5[1] = v21;
    return result;
  }
LABEL_7:
  *a5 = 0;
  a5[1] = 0;
  return result;
}

uint64_t sub_235C9AD54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD aBlock[6];

  v4 = v3;
  v23 = a1;
  v24 = a2;
  v26 = sub_235CA3738();
  v29 = *(_QWORD *)(v26 - 8);
  MEMORY[0x24BDAC7A8](v26);
  v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_235CA375C();
  v27 = *(_QWORD *)(v8 - 8);
  v28 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_235CA2790();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(_QWORD *)(v12 + 64);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = *(_QWORD *)(v4 + 16);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, a3, v11);
  v15 = (*(unsigned __int8 *)(v12 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  v16 = (v13 + v15 + 7) & 0xFFFFFFFFFFFFFFF8;
  v17 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v12 + 32))(v17 + v15, v14, v11);
  v18 = (_QWORD *)(v17 + v16);
  v19 = v24;
  *v18 = v23;
  v18[1] = v19;
  *(_QWORD *)(v17 + ((v16 + 23) & 0xFFFFFFFFFFFFFFF8)) = v4;
  aBlock[4] = sub_235C9B894;
  aBlock[5] = v17;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_235C9F468;
  aBlock[3] = &block_descriptor_4;
  v20 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_235CA3744();
  v30 = MEMORY[0x24BEE4AF8];
  sub_235C69C18(&qword_2542990D0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254299350);
  sub_235C9F408((unint64_t *)&qword_254299360, (uint64_t *)&unk_254299350);
  v21 = v26;
  sub_235CA3A38();
  MEMORY[0x23B7DDA18](0, v10, v7, v20);
  _Block_release(v20);
  (*(void (**)(char *, uint64_t))(v29 + 8))(v7, v21);
  (*(void (**)(char *, uint64_t))(v27 + 8))(v10, v28);
  return swift_release();
}

uint64_t sub_235C9AFE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  _QWORD *v10;
  _BYTE v12[24];
  void *v13[7];

  v6 = type metadata accessor for CacheKey();
  MEMORY[0x24BDAC7A8](v6);
  v8 = &v12[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v9 = sub_235CA2790();
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v8, a1, v9);
  v10 = &v8[*(int *)(v6 + 20)];
  *v10 = a2;
  v10[1] = a3;
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_235C9BE18((uint64_t)v8, (uint64_t *)v13);
  swift_endAccess();
  sub_235C9BF48(v13);
  return sub_235C9BFAC((uint64_t)v8);
}

uint64_t sub_235C9B0CC()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for AsrCandidateRequestCacheManager()
{
  return objc_opt_self();
}

uint64_t initializeBufferWithCopyOfBuffer for AsrCandidateRequestCache(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for AsrCandidateRequestCache(id *a1)
{

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for AsrCandidateRequestCache(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  v3 = *(void **)a2;
  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  v5 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v5;
  v6 = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for AsrCandidateRequestCache(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;

  v4 = *(void **)a1;
  v5 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v5;

  v7 = *(_QWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = v7;
  v8 = *(_QWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = v8;
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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

uint64_t assignWithTake for AsrCandidateRequestCache(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;

  v4 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  v5 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AsrCandidateRequestCache(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 56))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for AsrCandidateRequestCache(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 56) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 56) = 0;
    if (a2)
      *(_QWORD *)result = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for AsrCandidateRequestCache()
{
  return &type metadata for AsrCandidateRequestCache;
}

uint64_t *sub_235C9B390(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_235CA2790();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = (uint64_t *)((char *)a1 + v8);
    v10 = (uint64_t *)((char *)a2 + v8);
    v11 = v10[1];
    *v9 = *v10;
    v9[1] = v11;
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_235C9B424(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_235CA2790();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return swift_bridgeObjectRelease();
}

uint64_t sub_235C9B46C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;

  v6 = sub_235CA2790();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  v10 = v9[1];
  *v8 = *v9;
  v8[1] = v10;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_235C9B4D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;

  v6 = sub_235CA2790();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  *v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_235C9B550(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_235CA2790();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_235C9B5AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v6 = sub_235CA2790();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (uint64_t *)(a2 + v7);
  v11 = *v9;
  v10 = v9[1];
  *v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_235C9B618()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_235C9B624(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = sub_235CA2790();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20) + 8);
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t sub_235C9B6A4()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_235C9B6B0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_235CA2790();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
  return result;
}

uint64_t type metadata accessor for CacheKey()
{
  uint64_t result;

  result = qword_2542992F8;
  if (!qword_2542992F8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_235C9B768()
{
  uint64_t result;
  unint64_t v1;

  result = sub_235CA2790();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_235C9B7D8()
{
  return sub_235C69C18(&qword_2542992F0, (uint64_t (*)(uint64_t))type metadata accessor for CacheKey, (uint64_t)&unk_235CA4F40);
}

uint64_t sub_235C9B804()
{
  uint64_t v0;
  uint64_t v1;

  v1 = sub_235CA2790();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_235C9B894()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t *v3;

  v1 = *(_QWORD *)(sub_235CA2790() - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v3 = (uint64_t *)(v0 + ((*(_QWORD *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8));
  return sub_235C9AFE0(v0 + v2, *v3, v3[1]);
}

uint64_t block_copy_helper_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_4()
{
  return swift_release();
}

uint64_t sub_235C9B8FC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t);
  uint64_t v7;
  _QWORD v9[2];

  v1 = sub_235CA3954();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_235CA3948();
  v6 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688];
  MEMORY[0x24BDAC7A8](v5);
  v7 = sub_235CA375C();
  MEMORY[0x24BDAC7A8](v7);
  v9[0] = sub_235C9F3CC();
  sub_235CA3750();
  v9[1] = MEMORY[0x24BEE4AF8];
  sub_235C69C18(&qword_2542993E0, v6, MEMORY[0x24BEE5698]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254299370);
  sub_235C9F408(qword_254299380, (uint64_t *)&unk_254299370);
  sub_235CA3A38();
  (*(void (**)(char *, _QWORD, uint64_t))(v2 + 104))(v4, *MEMORY[0x24BEE5750], v1);
  *(_QWORD *)(v0 + 16) = sub_235CA3978();
  *(_QWORD *)(v0 + 24) = sub_235C8F04C(MEMORY[0x24BEE4AF8]);
  return v0;
}

unint64_t sub_235C9BACC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_235CA3BD0();
  sub_235CA381C();
  v4 = sub_235CA3BE8();
  return sub_235C9E0F4(a1, a2, v4);
}

unint64_t sub_235C9BB30(uint64_t a1)
{
  uint64_t (*v2)(uint64_t);
  uint64_t v3;

  sub_235CA3498();
  v2 = (uint64_t (*)(uint64_t))MEMORY[0x24BE9B488];
  sub_235C69C18(&qword_256377B30, (uint64_t (*)(uint64_t))MEMORY[0x24BE9B488], MEMORY[0x24BE9B4A0]);
  v3 = sub_235CA37BC();
  return sub_235C9E1D4(a1, v3, v2, &qword_256377B38, MEMORY[0x24BE9B4A8]);
}

unint64_t sub_235C9BBC8(uint64_t a1)
{
  uint64_t (*v2)(uint64_t);
  uint64_t v3;

  sub_235CA3438();
  v2 = (uint64_t (*)(uint64_t))MEMORY[0x24BE9B360];
  sub_235C69C18(&qword_256377B20, (uint64_t (*)(uint64_t))MEMORY[0x24BE9B360], MEMORY[0x24BE9B370]);
  v3 = sub_235CA37BC();
  return sub_235C9E1D4(a1, v3, v2, &qword_256377B28, MEMORY[0x24BE9B378]);
}

unint64_t sub_235C9BC60(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_235CA3A50();
  return sub_235C9E304(a1, v2);
}

unint64_t sub_235C9BC90(uint64_t a1)
{
  uint64_t v2;

  sub_235CA3BD0();
  sub_235CA2790();
  sub_235C69C18(&qword_254299030, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  sub_235CA37C8();
  type metadata accessor for CacheKey();
  swift_bridgeObjectRetain();
  sub_235CA381C();
  swift_bridgeObjectRelease();
  v2 = sub_235CA3BE8();
  return sub_235C9E3C8(a1, v2);
}

uint64_t sub_235C9BD4C(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  unint64_t v6;
  char v7;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v3 = v2;
  swift_bridgeObjectRetain();
  v6 = sub_235C9BACC(a1, a2);
  LOBYTE(a2) = v7;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0)
    return 2;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v9 = *v3;
  v12 = *v3;
  *v3 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_235C9E9EC();
    v9 = v12;
  }
  swift_bridgeObjectRelease();
  v10 = *(unsigned __int8 *)(*(_QWORD *)(v9 + 56) + v6);
  sub_235C9D3D8(v6, v9);
  *v3 = v9;
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_235C9BE18@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t *v2;
  uint64_t *v3;
  unint64_t v6;
  char v7;
  uint64_t result;
  int isUniquelyReferenced_nonNull_native;
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

  v3 = v2;
  swift_bridgeObjectRetain();
  v6 = sub_235C9BC90(a1);
  LOBYTE(a1) = v7;
  result = swift_bridgeObjectRelease();
  if ((a1 & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v10 = *v3;
    v22 = *v3;
    *v3 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_235C9EDBC();
      v10 = v22;
    }
    v11 = *(_QWORD *)(v10 + 48);
    v12 = type metadata accessor for CacheKey();
    sub_235C9BFAC(v11 + *(_QWORD *)(*(_QWORD *)(v12 - 8) + 72) * v6);
    v13 = *(_QWORD *)(v10 + 56) + 56 * v6;
    v14 = *(_QWORD *)v13;
    v21 = *(_QWORD *)(v13 + 8);
    v15 = *(unsigned __int8 *)(v13 + 16);
    v16 = *(_QWORD *)(v13 + 24);
    v17 = *(unsigned __int8 *)(v13 + 32);
    v19 = *(_QWORD *)(v13 + 40);
    v18 = *(_QWORD *)(v13 + 48);
    sub_235C9D5AC(v6, v10);
    *v3 = v10;
    result = swift_bridgeObjectRelease();
    v20 = v21;
  }
  else
  {
    v20 = 0;
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v19 = 0;
    v18 = 0;
    v14 = 1;
  }
  *a2 = v14;
  a2[1] = v20;
  a2[2] = v15;
  a2[3] = v16;
  a2[4] = v17;
  a2[5] = v19;
  a2[6] = v18;
  return result;
}

void **sub_235C9BF48(void **a1)
{
  sub_235C9BF7C(*a1);
  return a1;
}

void *sub_235C9BF7C(void *result)
{
  if (result != (void *)1)
  {

    return (void *)swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_235C9BFAC(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for CacheKey();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_235C9BFE8(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t result;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  _QWORD *v19;
  unint64_t v20;
  unint64_t v21;
  _QWORD *v23;
  unint64_t v24;
  int64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id v30;
  char v31;
  unint64_t v32;
  BOOL v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  char v38;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(qword_254299440);
  v38 = a2;
  v6 = sub_235CA3B10();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_38;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v36 = v2;
  v37 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v11 = (unint64_t)(v8 + 63) >> 6;
  v12 = v6 + 64;
  result = swift_retain();
  v14 = 0;
  while (1)
  {
    if (v10)
    {
      v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v21 = v20 | (v14 << 6);
      goto LABEL_21;
    }
    if (__OFADD__(v14++, 1))
      goto LABEL_40;
    if (v14 >= v11)
      break;
    v23 = (_QWORD *)(v5 + 64);
    v24 = *(_QWORD *)(v37 + 8 * v14);
    if (!v24)
    {
      v25 = v14 + 1;
      if (v14 + 1 >= v11)
      {
LABEL_31:
        swift_release();
        v3 = v36;
        if ((v38 & 1) == 0)
          goto LABEL_38;
        goto LABEL_34;
      }
      v24 = *(_QWORD *)(v37 + 8 * v25);
      if (!v24)
      {
        while (1)
        {
          v14 = v25 + 1;
          if (__OFADD__(v25, 1))
            break;
          if (v14 >= v11)
            goto LABEL_31;
          v24 = *(_QWORD *)(v37 + 8 * v14);
          ++v25;
          if (v24)
            goto LABEL_20;
        }
LABEL_39:
        __break(1u);
LABEL_40:
        __break(1u);
        return result;
      }
      ++v14;
    }
LABEL_20:
    v10 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_21:
    v26 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v21);
    v28 = *v26;
    v27 = v26[1];
    v29 = *(void **)(*(_QWORD *)(v5 + 56) + 8 * v21);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      v30 = v29;
    }
    sub_235CA3BD0();
    sub_235CA381C();
    result = sub_235CA3BE8();
    v15 = -1 << *(_BYTE *)(v7 + 32);
    v16 = result & ~v15;
    v17 = v16 >> 6;
    if (((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v31 = 0;
      v32 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v32 && (v31 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        v33 = v17 == v32;
        if (v17 == v32)
          v17 = 0;
        v31 |= v33;
        v34 = *(_QWORD *)(v12 + 8 * v17);
      }
      while (v34 == -1);
      v18 = __clz(__rbit64(~v34)) + (v17 << 6);
    }
    *(_QWORD *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    v19 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v18);
    *v19 = v28;
    v19[1] = v27;
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v18) = v29;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v36;
  v23 = (_QWORD *)(v5 + 64);
  if ((v38 & 1) == 0)
    goto LABEL_38;
LABEL_34:
  v35 = 1 << *(_BYTE *)(v5 + 32);
  if (v35 >= 64)
    bzero(v23, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v35;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_38:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_235C9C2D4(uint64_t a1, char a2, uint64_t *a3)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t result;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  _QWORD *v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  _QWORD *v23;
  unint64_t v24;
  int64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t *v36;
  int64_t v37;
  uint64_t v38;
  char v39;

  v4 = v3;
  v6 = *v3;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  v39 = a2;
  v7 = sub_235CA3B10();
  v8 = v7;
  if (!*(_QWORD *)(v6 + 16))
    goto LABEL_40;
  v9 = 1 << *(_BYTE *)(v6 + 32);
  v38 = v6 + 64;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  else
    v10 = -1;
  v11 = v10 & *(_QWORD *)(v6 + 64);
  v36 = v3;
  v37 = (unint64_t)(v9 + 63) >> 6;
  v12 = v7 + 64;
  result = swift_retain();
  v14 = 0;
  while (1)
  {
    if (v11)
    {
      v20 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      v21 = v20 | (v14 << 6);
      goto LABEL_31;
    }
    v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v37)
      break;
    v23 = (_QWORD *)(v6 + 64);
    v24 = *(_QWORD *)(v38 + 8 * v22);
    ++v14;
    if (!v24)
    {
      v14 = v22 + 1;
      if (v22 + 1 >= v37)
        goto LABEL_33;
      v24 = *(_QWORD *)(v38 + 8 * v14);
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v37)
        {
LABEL_33:
          swift_release();
          v4 = v36;
          if ((v39 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v24 = *(_QWORD *)(v38 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            v14 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_42;
            if (v14 >= v37)
              goto LABEL_33;
            v24 = *(_QWORD *)(v38 + 8 * v14);
            ++v25;
            if (v24)
              goto LABEL_30;
          }
        }
        v14 = v25;
      }
    }
LABEL_30:
    v11 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    v30 = (uint64_t *)(*(_QWORD *)(v6 + 48) + 16 * v21);
    v32 = *v30;
    v31 = v30[1];
    v33 = *(void **)(*(_QWORD *)(v6 + 56) + 8 * v21);
    if ((v39 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      v34 = v33;
    }
    sub_235CA3BD0();
    sub_235CA381C();
    result = sub_235CA3BE8();
    v15 = -1 << *(_BYTE *)(v8 + 32);
    v16 = result & ~v15;
    v17 = v16 >> 6;
    if (((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v26 = 0;
      v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v28 = v17 == v27;
        if (v17 == v27)
          v17 = 0;
        v26 |= v28;
        v29 = *(_QWORD *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(_QWORD *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    v19 = (_QWORD *)(*(_QWORD *)(v8 + 48) + 16 * v18);
    *v19 = v32;
    v19[1] = v31;
    *(_QWORD *)(*(_QWORD *)(v8 + 56) + 8 * v18) = v33;
    ++*(_QWORD *)(v8 + 16);
  }
  swift_release();
  v4 = v36;
  v23 = (_QWORD *)(v6 + 64);
  if ((v39 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v35 = 1 << *(_BYTE *)(v6 + 32);
  if (v35 >= 64)
    bzero(v23, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v35;
  *(_QWORD *)(v6 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v4 = v8;
  return result;
}

uint64_t sub_235C9C5DC(uint64_t a1, char a2)
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
  _QWORD *v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  _QWORD *v22;
  unint64_t v23;
  int64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int64_t v34;
  uint64_t v35;
  char v36;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256377A80);
  v36 = a2;
  v6 = sub_235CA3B10();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v35 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v34 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v34)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v35 + 8 * v21);
    ++v13;
    if (!v23)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v34)
        goto LABEL_33;
      v23 = *(_QWORD *)(v35 + 8 * v13);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v34)
        {
LABEL_33:
          swift_release();
          if ((v36 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v23 = *(_QWORD *)(v35 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v13 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_42;
            if (v13 >= v34)
              goto LABEL_33;
            v23 = *(_QWORD *)(v35 + 8 * v13);
            ++v24;
            if (v23)
              goto LABEL_30;
          }
        }
        v13 = v24;
      }
    }
LABEL_30:
    v10 = (v23 - 1) & v23;
    v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    v29 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v20);
    v31 = *v29;
    v30 = v29[1];
    v32 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v20);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_retain();
    }
    sub_235CA3BD0();
    sub_235CA381C();
    result = sub_235CA3BE8();
    v14 = -1 << *(_BYTE *)(v7 + 32);
    v15 = result & ~v14;
    v16 = v15 >> 6;
    if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v27 = v16 == v26;
        if (v16 == v26)
          v16 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    v18 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v17);
    *v18 = v31;
    v18[1] = v30;
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v17) = v32;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v22 = (_QWORD *)(v5 + 64);
  if ((v36 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v33 = 1 << *(_BYTE *)(v5 + 32);
  if (v33 >= 64)
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v22 = -1 << v33;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_235C9C8F0(uint64_t a1, char a2)
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
  _QWORD *v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  _QWORD *v22;
  unint64_t v23;
  int64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t *v34;
  int64_t v35;
  uint64_t v36;
  char v37;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256377A60);
  v37 = a2;
  v6 = sub_235CA3B10();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v36 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v34 = v2;
  v35 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v35)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v36 + 8 * v21);
    ++v13;
    if (!v23)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v35)
        goto LABEL_33;
      v23 = *(_QWORD *)(v36 + 8 * v13);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v35)
        {
LABEL_33:
          swift_release();
          v3 = v34;
          if ((v37 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v23 = *(_QWORD *)(v36 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v13 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_42;
            if (v13 >= v35)
              goto LABEL_33;
            v23 = *(_QWORD *)(v36 + 8 * v13);
            ++v24;
            if (v23)
              goto LABEL_30;
          }
        }
        v13 = v24;
      }
    }
LABEL_30:
    v10 = (v23 - 1) & v23;
    v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    v29 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v20);
    v31 = *v29;
    v30 = v29[1];
    v32 = *(_BYTE *)(*(_QWORD *)(v5 + 56) + v20);
    if ((v37 & 1) == 0)
      swift_bridgeObjectRetain();
    sub_235CA3BD0();
    sub_235CA381C();
    result = sub_235CA3BE8();
    v14 = -1 << *(_BYTE *)(v7 + 32);
    v15 = result & ~v14;
    v16 = v15 >> 6;
    if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v27 = v16 == v26;
        if (v16 == v26)
          v16 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    v18 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v17);
    *v18 = v31;
    v18[1] = v30;
    *(_BYTE *)(*(_QWORD *)(v7 + 56) + v17) = v32;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v34;
  v22 = (_QWORD *)(v5 + 64);
  if ((v37 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v33 = 1 << *(_BYTE *)(v5 + 32);
  if (v33 >= 64)
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v22 = -1 << v33;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_235C9CBF8(uint64_t a1, int a2)
{
  uint64_t *v2;
  uint64_t *v3;
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
  unint64_t v15;
  uint64_t v16;
  uint64_t result;
  int64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  _QWORD *v23;
  unint64_t v24;
  int64_t v25;
  uint64_t v26;
  unint64_t v27;
  id v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  char v32;
  unint64_t v33;
  BOOL v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  int64_t v39;
  _QWORD *v40;
  uint64_t i;
  int v42;

  v3 = v2;
  v5 = sub_235CA3498();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256377A70);
  v42 = a2;
  v10 = sub_235CA3B10();
  v11 = v10;
  if (!*(_QWORD *)(v9 + 16))
    goto LABEL_41;
  v12 = 1 << *(_BYTE *)(v9 + 32);
  v13 = *(_QWORD *)(v9 + 64);
  v40 = (_QWORD *)(v9 + 64);
  if (v12 < 64)
    v14 = ~(-1 << v12);
  else
    v14 = -1;
  v15 = v14 & v13;
  v38 = v2;
  v39 = (unint64_t)(v12 + 63) >> 6;
  v16 = v10 + 64;
  result = swift_retain();
  v18 = 0;
  for (i = v9; ; v9 = i)
  {
    if (v15)
    {
      v20 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      v21 = v20 | (v18 << 6);
      goto LABEL_22;
    }
    v22 = v18 + 1;
    if (__OFADD__(v18, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v22 >= v39)
      break;
    v23 = v40;
    v24 = v40[v22];
    ++v18;
    if (!v24)
    {
      v18 = v22 + 1;
      if (v22 + 1 >= v39)
        goto LABEL_34;
      v24 = v40[v18];
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v39)
        {
LABEL_34:
          swift_release();
          v3 = v38;
          if ((v42 & 1) == 0)
            goto LABEL_41;
          goto LABEL_37;
        }
        v24 = v40[v25];
        if (!v24)
        {
          while (1)
          {
            v18 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_43;
            if (v18 >= v39)
              goto LABEL_34;
            v24 = v40[v18];
            ++v25;
            if (v24)
              goto LABEL_21;
          }
        }
        v18 = v25;
      }
    }
LABEL_21:
    v15 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v18 << 6);
LABEL_22:
    v26 = *(_QWORD *)(v6 + 72);
    v27 = *(_QWORD *)(v9 + 48) + v26 * v21;
    if ((v42 & 1) != 0)
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v6 + 32))(v8, v27, v5);
      v28 = *(id *)(*(_QWORD *)(v9 + 56) + 8 * v21);
    }
    else
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v6 + 16))(v8, v27, v5);
      v28 = *(id *)(*(_QWORD *)(v9 + 56) + 8 * v21);
    }
    sub_235C69C18(&qword_256377B30, (uint64_t (*)(uint64_t))MEMORY[0x24BE9B488], MEMORY[0x24BE9B4A0]);
    result = sub_235CA37BC();
    v29 = -1 << *(_BYTE *)(v11 + 32);
    v30 = result & ~v29;
    v31 = v30 >> 6;
    if (((-1 << v30) & ~*(_QWORD *)(v16 + 8 * (v30 >> 6))) != 0)
    {
      v19 = __clz(__rbit64((-1 << v30) & ~*(_QWORD *)(v16 + 8 * (v30 >> 6)))) | v30 & 0x7FFFFFFFFFFFFFC0;
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
          goto LABEL_42;
        }
        v34 = v31 == v33;
        if (v31 == v33)
          v31 = 0;
        v32 |= v34;
        v35 = *(_QWORD *)(v16 + 8 * v31);
      }
      while (v35 == -1);
      v19 = __clz(__rbit64(~v35)) + (v31 << 6);
    }
    *(_QWORD *)(v16 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v6 + 32))(*(_QWORD *)(v11 + 48) + v26 * v19, v8, v5);
    *(_QWORD *)(*(_QWORD *)(v11 + 56) + 8 * v19) = v28;
    ++*(_QWORD *)(v11 + 16);
  }
  swift_release();
  v3 = v38;
  v23 = v40;
  if ((v42 & 1) == 0)
    goto LABEL_41;
LABEL_37:
  v36 = 1 << *(_BYTE *)(v9 + 32);
  if (v36 >= 64)
    bzero(v23, ((unint64_t)(v36 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v36;
  *(_QWORD *)(v9 + 16) = 0;
LABEL_41:
  result = swift_release();
  *v3 = v11;
  return result;
}

uint64_t sub_235C9CF8C(uint64_t a1, int a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t result;
  int64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  _QWORD *v23;
  unint64_t v24;
  int64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  void *v33;
  id v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  char v38;
  unint64_t v39;
  BOOL v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t *v44;
  int64_t v45;
  _QWORD *v46;
  uint64_t i;
  uint64_t v48;
  uint64_t v49;
  int v50;
  int v51;
  uint64_t v52;
  int v53;
  __int128 v54;

  v3 = v2;
  v5 = type metadata accessor for CacheKey();
  v48 = *(_QWORD *)(v5 - 8);
  v49 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v43 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254299438);
  v50 = a2;
  v9 = sub_235CA3B10();
  v10 = v9;
  if (!*(_QWORD *)(v8 + 16))
    goto LABEL_41;
  v11 = 1 << *(_BYTE *)(v8 + 32);
  v12 = *(_QWORD *)(v8 + 64);
  v46 = (_QWORD *)(v8 + 64);
  if (v11 < 64)
    v13 = ~(-1 << v11);
  else
    v13 = -1;
  v14 = v13 & v12;
  v44 = v2;
  v45 = (unint64_t)(v11 + 63) >> 6;
  v15 = v9 + 64;
  result = swift_retain();
  v17 = 0;
  for (i = v8; ; v8 = i)
  {
    if (v14)
    {
      v20 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      v21 = v20 | (v17 << 6);
      goto LABEL_22;
    }
    v22 = v17 + 1;
    if (__OFADD__(v17, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v22 >= v45)
      break;
    v23 = v46;
    v24 = v46[v22];
    ++v17;
    if (!v24)
    {
      v17 = v22 + 1;
      if (v22 + 1 >= v45)
        goto LABEL_34;
      v24 = v46[v17];
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v45)
        {
LABEL_34:
          swift_release();
          v3 = v44;
          if ((v50 & 1) == 0)
            goto LABEL_41;
          goto LABEL_37;
        }
        v24 = v46[v25];
        if (!v24)
        {
          while (1)
          {
            v17 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_43;
            if (v17 >= v45)
              goto LABEL_34;
            v24 = v46[v17];
            ++v25;
            if (v24)
              goto LABEL_21;
          }
        }
        v17 = v25;
      }
    }
LABEL_21:
    v14 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v17 << 6);
LABEL_22:
    v26 = *(_QWORD *)(v48 + 72);
    v27 = *(_QWORD *)(v8 + 48) + v26 * v21;
    if ((v50 & 1) != 0)
    {
      sub_235C9883C(v27, (uint64_t)v7);
      v28 = *(_QWORD *)(v8 + 56) + 56 * v21;
      v54 = *(_OWORD *)v28;
      v53 = *(unsigned __int8 *)(v28 + 16);
      v52 = *(_QWORD *)(v28 + 24);
      v51 = *(unsigned __int8 *)(v28 + 32);
      v29 = *(_QWORD *)(v28 + 40);
      v30 = *(_QWORD *)(v28 + 48);
    }
    else
    {
      sub_235C9F05C(v27, (uint64_t)v7);
      v31 = *(_QWORD *)(v8 + 56) + 56 * v21;
      v32 = *(_OWORD *)v31;
      v53 = *(unsigned __int8 *)(v31 + 16);
      v52 = *(_QWORD *)(v31 + 24);
      v51 = *(unsigned __int8 *)(v31 + 32);
      v29 = *(_QWORD *)(v31 + 40);
      v30 = *(_QWORD *)(v31 + 48);
      v54 = v32;
      v33 = (void *)v32;
      swift_bridgeObjectRetain();
      v34 = v33;
    }
    sub_235CA3BD0();
    sub_235CA2790();
    sub_235C69C18(&qword_254299030, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
    sub_235CA37C8();
    swift_bridgeObjectRetain();
    sub_235CA381C();
    swift_bridgeObjectRelease();
    result = sub_235CA3BE8();
    v35 = -1 << *(_BYTE *)(v10 + 32);
    v36 = result & ~v35;
    v37 = v36 >> 6;
    if (((-1 << v36) & ~*(_QWORD *)(v15 + 8 * (v36 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v36) & ~*(_QWORD *)(v15 + 8 * (v36 >> 6)))) | v36 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v38 = 0;
      v39 = (unint64_t)(63 - v35) >> 6;
      do
      {
        if (++v37 == v39 && (v38 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        v40 = v37 == v39;
        if (v37 == v39)
          v37 = 0;
        v38 |= v40;
        v41 = *(_QWORD *)(v15 + 8 * v37);
      }
      while (v41 == -1);
      v18 = __clz(__rbit64(~v41)) + (v37 << 6);
    }
    *(_QWORD *)(v15 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    result = sub_235C9883C((uint64_t)v7, *(_QWORD *)(v10 + 48) + v26 * v18);
    v19 = *(_QWORD *)(v10 + 56) + 56 * v18;
    *(_OWORD *)v19 = v54;
    *(_BYTE *)(v19 + 16) = v53;
    *(_QWORD *)(v19 + 24) = v52;
    *(_BYTE *)(v19 + 32) = v51;
    *(_QWORD *)(v19 + 40) = v29;
    *(_QWORD *)(v19 + 48) = v30;
    ++*(_QWORD *)(v10 + 16);
  }
  swift_release();
  v3 = v44;
  v23 = v46;
  if ((v50 & 1) == 0)
    goto LABEL_41;
LABEL_37:
  v42 = 1 << *(_BYTE *)(v8 + 32);
  if (v42 >= 64)
    bzero(v23, ((unint64_t)(v42 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v42;
  *(_QWORD *)(v8 + 16) = 0;
LABEL_41:
  result = swift_release();
  *v3 = v10;
  return result;
}

unint64_t sub_235C9D3D8(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _OWORD *v12;
  _OWORD *v13;
  uint64_t v14;
  _BYTE *v15;
  _BYTE *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_235CA3A44();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_235CA3BD0();
        swift_bridgeObjectRetain();
        sub_235CA381C();
        v9 = sub_235CA3BE8();
        result = swift_bridgeObjectRelease();
        v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8)
            goto LABEL_5;
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          v11 = *(_QWORD *)(a2 + 48);
          v12 = (_OWORD *)(v11 + 16 * v3);
          v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1)
            *v12 = *v13;
          v14 = *(_QWORD *)(a2 + 56);
          v15 = (_BYTE *)(v14 + v3);
          v16 = (_BYTE *)(v14 + v6);
          if (v3 != v6 || (v3 = v6, v15 >= v16 + 1))
          {
            *v15 = *v16;
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v18 = *v17;
    v19 = (-1 << v3) - 1;
  }
  else
  {
    v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    v19 = *v17;
    v18 = (-1 << result) - 1;
  }
  *v17 = v19 & v18;
  v20 = *(_QWORD *)(a2 + 16);
  v21 = __OFSUB__(v20, 1);
  v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_235C9D5AC(int64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t result;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  int64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  __int128 *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;

  v34 = type metadata accessor for CacheKey();
  v4 = *(_QWORD *)(v34 - 8);
  result = MEMORY[0x24BDAC7A8](v34);
  v7 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = a2 + 64;
  v9 = -1 << *(_BYTE *)(a2 + 32);
  v10 = (a1 + 1) & ~v9;
  if (((1 << v10) & *(_QWORD *)(a2 + 64 + 8 * (v10 >> 6))) != 0)
  {
    v11 = ~v9;
    result = sub_235CA3A44();
    if ((*(_QWORD *)(v8 + 8 * (v10 >> 6)) & (1 << v10)) != 0)
    {
      v33 = (result + 1) & v11;
      v12 = *(_QWORD *)(v4 + 72);
      v13 = v11;
      do
      {
        v17 = v12;
        v18 = v12 * v10;
        v19 = v13;
        sub_235C9F05C(*(_QWORD *)(a2 + 48) + v12 * v10, (uint64_t)v7);
        sub_235CA3BD0();
        sub_235CA2790();
        sub_235C69C18(&qword_254299030, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
        sub_235CA37C8();
        swift_bridgeObjectRetain();
        sub_235CA381C();
        swift_bridgeObjectRelease();
        v20 = sub_235CA3BE8();
        result = sub_235C9BFAC((uint64_t)v7);
        v13 = v19;
        v21 = v20 & v19;
        if (a1 >= (uint64_t)v33)
        {
          if (v21 < v33)
          {
            v12 = v17;
          }
          else
          {
            v12 = v17;
            if (a1 >= (uint64_t)v21)
              goto LABEL_12;
          }
        }
        else
        {
          v12 = v17;
          if (v21 >= v33 || a1 >= (uint64_t)v21)
          {
LABEL_12:
            v22 = *(_QWORD *)(a2 + 48);
            result = v22 + v12 * a1;
            if (v12 * a1 < v18 || result >= v22 + v18 + v12)
            {
              result = swift_arrayInitWithTakeFrontToBack();
LABEL_17:
              v13 = v19;
            }
            else if (v12 * a1 != v18)
            {
              result = swift_arrayInitWithTakeBackToFront();
              goto LABEL_17;
            }
            v23 = *(_QWORD *)(a2 + 56);
            v24 = v23 + 56 * a1;
            v25 = (__int128 *)(v23 + 56 * v10);
            if (a1 != v10 || (a1 = v10, v24 >= (unint64_t)v25 + 56))
            {
              v14 = *v25;
              v15 = v25[1];
              v16 = v25[2];
              *(_QWORD *)(v24 + 48) = *((_QWORD *)v25 + 6);
              *(_OWORD *)(v24 + 16) = v15;
              *(_OWORD *)(v24 + 32) = v16;
              *(_OWORD *)v24 = v14;
              a1 = v10;
            }
          }
        }
        v10 = (v10 + 1) & v13;
      }
      while (((*(_QWORD *)(v8 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
    }
    v26 = (uint64_t *)(v8 + 8 * ((unint64_t)a1 >> 6));
    v27 = *v26;
    v28 = (-1 << a1) - 1;
  }
  else
  {
    v26 = (uint64_t *)(v8 + 8 * ((unint64_t)a1 >> 6));
    v28 = *v26;
    v27 = (-1 << a1) - 1;
  }
  *v26 = v28 & v27;
  v29 = *(_QWORD *)(a2 + 16);
  v30 = __OFSUB__(v29, 1);
  v31 = v29 - 1;
  if (v30)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v31;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

void sub_235C9D89C(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  sub_235C9D8B4(a1, a2, a3, a4, &qword_256377A78);
}

void sub_235C9D8A8(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  sub_235C9D8B4(a1, a2, a3, a4, &qword_256377A58);
}

void sub_235C9D8B4(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t *a5)
{
  _QWORD *v5;
  _QWORD *v7;
  uint64_t v12;
  char v13;
  unint64_t v14;
  uint64_t v15;
  _BOOL8 v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  uint64_t *v24;
  uint64_t v25;
  BOOL v26;
  uint64_t v27;

  v7 = v5;
  v12 = *v5;
  v14 = sub_235C9BACC(a2, a3);
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
  if (v19 >= v17 && (a4 & 1) != 0)
    goto LABEL_7;
  if (v19 >= v17 && (a4 & 1) == 0)
  {
    sub_235C9E690(a5);
LABEL_7:
    v20 = (_QWORD *)*v7;
    if ((v18 & 1) != 0)
    {
LABEL_8:
      v21 = v20[7];

      *(_QWORD *)(v21 + 8 * v14) = a1;
      return;
    }
LABEL_11:
    v20[(v14 >> 6) + 8] |= 1 << v14;
    v24 = (uint64_t *)(v20[6] + 16 * v14);
    *v24 = a2;
    v24[1] = a3;
    *(_QWORD *)(v20[7] + 8 * v14) = a1;
    v25 = v20[2];
    v26 = __OFADD__(v25, 1);
    v27 = v25 + 1;
    if (!v26)
    {
      v20[2] = v27;
      swift_bridgeObjectRetain();
      return;
    }
    goto LABEL_14;
  }
  sub_235C9C2D4(v17, a4 & 1, a5);
  v22 = sub_235C9BACC(a2, a3);
  if ((v18 & 1) == (v23 & 1))
  {
    v14 = v22;
    v20 = (_QWORD *)*v7;
    if ((v18 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  sub_235CA3B94();
  __break(1u);
}

uint64_t sub_235C9DA28(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t result;
  unint64_t v21;
  char v22;
  uint64_t *v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;

  v5 = v4;
  v10 = *v4;
  v12 = sub_235C9BACC(a2, a3);
  v13 = *(_QWORD *)(v10 + 16);
  v14 = (v11 & 1) == 0;
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v16 = v11;
  v17 = *(_QWORD *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0)
    goto LABEL_7;
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_235C9E838();
LABEL_7:
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      v19 = v18[7];
      result = swift_release();
      *(_QWORD *)(v19 + 8 * v12) = a1;
      return result;
    }
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    v23 = (uint64_t *)(v18[6] + 16 * v12);
    *v23 = a2;
    v23[1] = a3;
    *(_QWORD *)(v18[7] + 8 * v12) = a1;
    v24 = v18[2];
    v25 = __OFADD__(v24, 1);
    v26 = v24 + 1;
    if (!v25)
    {
      v18[2] = v26;
      return swift_bridgeObjectRetain();
    }
    goto LABEL_14;
  }
  sub_235C9C5DC(v15, a4 & 1);
  v21 = sub_235C9BACC(a2, a3);
  if ((v16 & 1) == (v22 & 1))
  {
    v12 = v21;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_235CA3B94();
  __break(1u);
  return result;
}

uint64_t sub_235C9DB84(char a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t result;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  char v19;
  uint64_t *v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;

  v5 = v4;
  v10 = *v4;
  v12 = sub_235C9BACC(a2, a3);
  v13 = *(_QWORD *)(v10 + 16);
  v14 = (v11 & 1) == 0;
  result = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v16 = v11;
  v17 = *(_QWORD *)(v10 + 24);
  if (v17 >= result && (a4 & 1) != 0)
    goto LABEL_7;
  if (v17 >= result && (a4 & 1) == 0)
  {
    result = (uint64_t)sub_235C9E9EC();
LABEL_7:
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      *(_BYTE *)(v18[7] + v12) = a1 & 1;
      return result;
    }
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    v20 = (uint64_t *)(v18[6] + 16 * v12);
    *v20 = a2;
    v20[1] = a3;
    *(_BYTE *)(v18[7] + v12) = a1 & 1;
    v21 = v18[2];
    v22 = __OFADD__(v21, 1);
    v23 = v21 + 1;
    if (!v22)
    {
      v18[2] = v23;
      return swift_bridgeObjectRetain();
    }
    goto LABEL_14;
  }
  sub_235C9C8F0(result, a4 & 1);
  result = sub_235C9BACC(a2, a3);
  if ((v16 & 1) == (v19 & 1))
  {
    v12 = result;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_235CA3B94();
  __break(1u);
  return result;
}

void sub_235C9DCDC(uint64_t a1, uint64_t a2, char a3)
{
  _QWORD *v3;
  _QWORD **v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  _QWORD *v12;
  char v13;
  unint64_t v14;
  uint64_t v15;
  _BOOL8 v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  uint64_t v24;

  v4 = (_QWORD **)v3;
  v8 = sub_235CA3498();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (_QWORD *)*v3;
  v14 = sub_235C9BB30(a2);
  v15 = v12[2];
  v16 = (v13 & 1) == 0;
  v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_14;
  }
  v18 = v13;
  v19 = v12[3];
  if (v19 >= v17 && (a3 & 1) != 0)
  {
LABEL_7:
    v20 = *v4;
    if ((v18 & 1) != 0)
    {
LABEL_8:
      v21 = v20[7];

      *(_QWORD *)(v21 + 8 * v14) = a1;
      return;
    }
    goto LABEL_11;
  }
  if (v19 >= v17 && (a3 & 1) == 0)
  {
    sub_235C9EB94();
    goto LABEL_7;
  }
  sub_235C9CBF8(v17, a3 & 1);
  v22 = sub_235C9BB30(a2);
  if ((v18 & 1) != (v23 & 1))
  {
LABEL_14:
    sub_235CA3B94();
    __break(1u);
    return;
  }
  v14 = v22;
  v20 = *v4;
  if ((v18 & 1) != 0)
    goto LABEL_8;
LABEL_11:
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a2, v8);
  sub_235C9DFB0(v14, (uint64_t)v11, a1, v20);
}

uint64_t sub_235C9DE38(uint64_t a1, uint64_t a2, char a3)
{
  _QWORD *v3;
  _QWORD **v4;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _QWORD *v11;
  char v12;
  unint64_t v13;
  uint64_t v14;
  _BOOL8 v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t result;
  __int128 v22;
  unint64_t v23;
  char v24;
  uint64_t v25;

  v4 = (_QWORD **)v3;
  v8 = type metadata accessor for CacheKey();
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = (_QWORD *)*v3;
  v13 = sub_235C9BC90(a2);
  v14 = v11[2];
  v15 = (v12 & 1) == 0;
  v16 = v14 + v15;
  if (__OFADD__(v14, v15))
  {
    __break(1u);
    goto LABEL_14;
  }
  v17 = v12;
  v18 = v11[3];
  if (v18 >= v16 && (a3 & 1) != 0)
  {
LABEL_7:
    v19 = *v4;
    if ((v17 & 1) != 0)
    {
LABEL_8:
      v20 = v19[7] + 56 * v13;

      result = swift_bridgeObjectRelease();
      v22 = *(_OWORD *)(a1 + 16);
      *(_OWORD *)v20 = *(_OWORD *)a1;
      *(_OWORD *)(v20 + 16) = v22;
      *(_OWORD *)(v20 + 32) = *(_OWORD *)(a1 + 32);
      *(_QWORD *)(v20 + 48) = *(_QWORD *)(a1 + 48);
      return result;
    }
    goto LABEL_11;
  }
  if (v18 >= v16 && (a3 & 1) == 0)
  {
    sub_235C9EDBC();
    goto LABEL_7;
  }
  sub_235C9CF8C(v16, a3 & 1);
  v23 = sub_235C9BC90(a2);
  if ((v17 & 1) != (v24 & 1))
  {
LABEL_14:
    result = sub_235CA3B94();
    __break(1u);
    return result;
  }
  v13 = v23;
  v19 = *v4;
  if ((v17 & 1) != 0)
    goto LABEL_8;
LABEL_11:
  sub_235C9F05C(a2, (uint64_t)v10);
  return sub_235C9E048(v13, (uint64_t)v10, (__int128 *)a1, v19);
}

uint64_t sub_235C9DFB0(unint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  a4[(a1 >> 6) + 8] |= 1 << a1;
  v8 = a4[6];
  v9 = sub_235CA3498();
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v8 + *(_QWORD *)(*(_QWORD *)(v9 - 8) + 72) * a1, a2, v9);
  *(_QWORD *)(a4[7] + 8 * a1) = a3;
  v11 = a4[2];
  v12 = __OFADD__(v11, 1);
  v13 = v11 + 1;
  if (v12)
    __break(1u);
  else
    a4[2] = v13;
  return result;
}

uint64_t sub_235C9E048(unint64_t a1, uint64_t a2, __int128 *a3, _QWORD *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;

  a4[(a1 >> 6) + 8] |= 1 << a1;
  v8 = a4[6];
  v9 = type metadata accessor for CacheKey();
  result = sub_235C9883C(a2, v8 + *(_QWORD *)(*(_QWORD *)(v9 - 8) + 72) * a1);
  v11 = a4[7] + 56 * a1;
  *(_QWORD *)(v11 + 48) = *((_QWORD *)a3 + 6);
  v12 = a3[2];
  v13 = *a3;
  *(_OWORD *)(v11 + 16) = a3[1];
  *(_OWORD *)(v11 + 32) = v12;
  *(_OWORD *)v11 = v13;
  v14 = a4[2];
  v15 = __OFADD__(v14, 1);
  v16 = v14 + 1;
  if (v15)
    __break(1u);
  else
    a4[2] = v16;
  return result;
}

unint64_t sub_235C9E0F4(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_235CA3B88() & 1) == 0)
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
      while (!v14 && (sub_235CA3B88() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_235C9E1D4(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t), unint64_t *a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(char *, unint64_t, uint64_t);
  char v17;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  unint64_t *v21;
  uint64_t v22;

  v21 = a4;
  v22 = a5;
  v6 = v5;
  v19 = a1;
  v20 = a3;
  v8 = a3(0);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v19 - v10;
  v12 = -1 << *(_BYTE *)(v6 + 32);
  v13 = a2 & ~v12;
  if (((*(_QWORD *)(v6 + 64 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8)) >> v13) & 1) != 0)
  {
    v14 = ~v12;
    v15 = *(_QWORD *)(v9 + 72);
    v16 = *(void (**)(char *, unint64_t, uint64_t))(v9 + 16);
    do
    {
      v16(v11, *(_QWORD *)(v6 + 48) + v15 * v13, v8);
      sub_235C69C18(v21, v20, v22);
      v17 = sub_235CA37D4();
      (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
      if ((v17 & 1) != 0)
        break;
      v13 = (v13 + 1) & v14;
    }
    while (((*(_QWORD *)(v6 + 64 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8)) >> v13) & 1) != 0);
  }
  return v13;
}

unint64_t sub_235C9E304(uint64_t a1, uint64_t a2)
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
      sub_235C8BB28(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = MEMORY[0x23B7DDB08](v9, a1);
      sub_235C8BAF4((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_235C9E3C8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  BOOL v17;
  uint64_t v19;

  v5 = type metadata accessor for CacheKey();
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = -1 << *(_BYTE *)(v2 + 32);
  v10 = a2 & ~v9;
  if (((*(_QWORD *)(v2 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = ~v9;
    v12 = *(_QWORD *)(v6 + 72);
    while (1)
    {
      sub_235C9F05C(*(_QWORD *)(v2 + 48) + v12 * v10, (uint64_t)v8);
      if ((sub_235CA2778() & 1) != 0)
      {
        v13 = *(int *)(v5 + 20);
        v14 = *(_QWORD *)&v8[v13];
        v15 = *(_QWORD *)&v8[v13 + 8];
        v16 = (_QWORD *)(a1 + v13);
        v17 = v14 == *v16 && v15 == v16[1];
        if (v17 || (sub_235CA3B88() & 1) != 0)
          break;
      }
      sub_235C9BFAC((uint64_t)v8);
      v10 = (v10 + 1) & v11;
      if (((*(_QWORD *)(v2 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) == 0)
        return v10;
    }
    sub_235C9BFAC((uint64_t)v8);
  }
  return v10;
}

id sub_235C9E4F8()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id result;
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
  uint64_t v19;
  void *v20;
  _QWORD *v21;
  unint64_t v23;
  int64_t v24;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(qword_254299440);
  v2 = *v0;
  v3 = sub_235CA3B04();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_24:
    result = (id)swift_release();
    *v1 = v4;
    return result;
  }
  result = (id)(v3 + 64);
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
    if (__OFADD__(v9++, 1))
      goto LABEL_26;
    if (v9 >= v13)
      goto LABEL_24;
    v23 = *(_QWORD *)(v6 + 8 * v9);
    if (!v23)
      break;
LABEL_23:
    v12 = (v23 - 1) & v23;
    v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v18 = v17[1];
    v19 = 8 * v15;
    v20 = *(void **)(*(_QWORD *)(v2 + 56) + v19);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = *v17;
    v21[1] = v18;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    result = v20;
  }
  v24 = v9 + 1;
  if (v9 + 1 >= v13)
    goto LABEL_24;
  v23 = *(_QWORD *)(v6 + 8 * v24);
  if (v23)
  {
    ++v9;
    goto LABEL_23;
  }
  while (1)
  {
    v9 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v9 >= v13)
      goto LABEL_24;
    v23 = *(_QWORD *)(v6 + 8 * v9);
    ++v24;
    if (v23)
      goto LABEL_23;
  }
  __break(1u);
LABEL_26:
  __break(1u);
  return result;
}

id sub_235C9E690(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id result;
  uint64_t v7;
  unint64_t v8;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  _QWORD *v22;
  int64_t v23;
  unint64_t v24;
  int64_t v25;

  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  v3 = *v1;
  v4 = sub_235CA3B04();
  v5 = v4;
  if (!*(_QWORD *)(v3 + 16))
  {
LABEL_26:
    result = (id)swift_release();
    *v2 = v5;
    return result;
  }
  result = (id)(v4 + 64);
  v7 = v3 + 64;
  v8 = (unint64_t)((1 << *(_BYTE *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8)
    result = memmove(result, (const void *)(v3 + 64), 8 * v8);
  v10 = 0;
  *(_QWORD *)(v5 + 16) = *(_QWORD *)(v3 + 16);
  v11 = 1 << *(_BYTE *)(v3 + 32);
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & *(_QWORD *)(v3 + 64);
  v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }
    v23 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v14)
      goto LABEL_26;
    v24 = *(_QWORD *)(v7 + 8 * v23);
    ++v10;
    if (!v24)
    {
      v10 = v23 + 1;
      if (v23 + 1 >= v14)
        goto LABEL_26;
      v24 = *(_QWORD *)(v7 + 8 * v10);
      if (!v24)
        break;
    }
LABEL_25:
    v13 = (v24 - 1) & v24;
    v16 = __clz(__rbit64(v24)) + (v10 << 6);
LABEL_12:
    v17 = 16 * v16;
    v18 = (_QWORD *)(*(_QWORD *)(v3 + 48) + 16 * v16);
    v19 = v18[1];
    v20 = 8 * v16;
    v21 = *(void **)(*(_QWORD *)(v3 + 56) + v20);
    v22 = (_QWORD *)(*(_QWORD *)(v5 + 48) + v17);
    *v22 = *v18;
    v22[1] = v19;
    *(_QWORD *)(*(_QWORD *)(v5 + 56) + v20) = v21;
    swift_bridgeObjectRetain();
    result = v21;
  }
  v25 = v23 + 2;
  if (v25 >= v14)
    goto LABEL_26;
  v24 = *(_QWORD *)(v7 + 8 * v25);
  if (v24)
  {
    v10 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    v10 = v25 + 1;
    if (__OFADD__(v25, 1))
      break;
    if (v10 >= v14)
      goto LABEL_26;
    v24 = *(_QWORD *)(v7 + 8 * v10);
    ++v25;
    if (v24)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_235C9E838()
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
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_256377A80);
  v2 = *v0;
  v3 = sub_235CA3B04();
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
    v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      v9 = v22 + 1;
      if (v22 + 1 >= v13)
        goto LABEL_26;
      v23 = *(_QWORD *)(v6 + 8 * v9);
      if (!v23)
        break;
    }
LABEL_25:
    v12 = (v23 - 1) & v23;
    v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v18 = v17[1];
    v19 = 8 * v15;
    v20 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v19);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = *v17;
    v21[1] = v18;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    result = (void *)swift_retain();
  }
  v24 = v22 + 2;
  if (v24 >= v13)
    goto LABEL_26;
  v23 = *(_QWORD *)(v6 + 8 * v24);
  if (v23)
  {
    v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v9);
    ++v24;
    if (v23)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_235C9E9EC()
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
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_256377A60);
  v2 = *v0;
  v3 = sub_235CA3B04();
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
    v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13)
      goto LABEL_26;
    v21 = *(_QWORD *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      v9 = v20 + 1;
      if (v20 + 1 >= v13)
        goto LABEL_26;
      v21 = *(_QWORD *)(v6 + 8 * v9);
      if (!v21)
        break;
    }
LABEL_25:
    v12 = (v21 - 1) & v21;
    v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    v16 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v18 = *v16;
    v17 = v16[1];
    LOBYTE(v16) = *(_BYTE *)(*(_QWORD *)(v2 + 56) + v15);
    v19 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v15);
    *v19 = v18;
    v19[1] = v17;
    *(_BYTE *)(*(_QWORD *)(v4 + 56) + v15) = (_BYTE)v16;
    result = (void *)swift_bridgeObjectRetain();
  }
  v22 = v20 + 2;
  if (v22 >= v13)
    goto LABEL_26;
  v21 = *(_QWORD *)(v6 + 8 * v22);
  if (v21)
  {
    v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v21 = *(_QWORD *)(v6 + 8 * v9);
    ++v22;
    if (v21)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

id sub_235C9EB94()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id result;
  unint64_t v9;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  int64_t v26;

  v1 = sub_235CA3498();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_256377A70);
  v24 = v0;
  v5 = *v0;
  v6 = sub_235CA3B04();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
  {
LABEL_26:
    result = (id)swift_release();
    *v24 = v7;
    return result;
  }
  result = (id)(v6 + 64);
  v9 = (unint64_t)((1 << *(_BYTE *)(v7 + 32)) + 63) >> 6;
  if (v7 != v5 || (unint64_t)result >= v5 + 64 + 8 * v9)
    result = memmove(result, (const void *)(v5 + 64), 8 * v9);
  v11 = 0;
  *(_QWORD *)(v7 + 16) = *(_QWORD *)(v5 + 16);
  v12 = 1 << *(_BYTE *)(v5 + 32);
  v13 = -1;
  if (v12 < 64)
    v13 = ~(-1 << v12);
  v14 = v13 & *(_QWORD *)(v5 + 64);
  v25 = v5 + 64;
  v26 = (unint64_t)(v12 + 63) >> 6;
  while (1)
  {
    if (v14)
    {
      v15 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      v16 = v15 | (v11 << 6);
      goto LABEL_12;
    }
    v20 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v26)
      goto LABEL_26;
    v21 = *(_QWORD *)(v25 + 8 * v20);
    ++v11;
    if (!v21)
    {
      v11 = v20 + 1;
      if (v20 + 1 >= v26)
        goto LABEL_26;
      v21 = *(_QWORD *)(v25 + 8 * v11);
      if (!v21)
        break;
    }
LABEL_25:
    v14 = (v21 - 1) & v21;
    v16 = __clz(__rbit64(v21)) + (v11 << 6);
LABEL_12:
    v17 = *(_QWORD *)(v2 + 72) * v16;
    (*(void (**)(char *, unint64_t, uint64_t))(v2 + 16))(v4, *(_QWORD *)(v5 + 48) + v17, v1);
    v18 = 8 * v16;
    v19 = *(void **)(*(_QWORD *)(v5 + 56) + v18);
    (*(void (**)(unint64_t, char *, uint64_t))(v2 + 32))(*(_QWORD *)(v7 + 48) + v17, v4, v1);
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + v18) = v19;
    result = v19;
  }
  v22 = v20 + 2;
  if (v22 >= v26)
    goto LABEL_26;
  v21 = *(_QWORD *)(v25 + 8 * v22);
  if (v21)
  {
    v11 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    v11 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v11 >= v26)
      goto LABEL_26;
    v21 = *(_QWORD *)(v25 + 8 * v11);
    ++v22;
    if (v21)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

id sub_235C9EDBC()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id result;
  unint64_t v8;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  int64_t v31;
  unint64_t v32;
  int64_t v33;
  int64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  int64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  int64_t v44;
  __int128 v45;

  v1 = type metadata accessor for CacheKey();
  v41 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v40 = (char *)&v37 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254299438);
  v37 = v0;
  v3 = *v0;
  v4 = sub_235CA3B04();
  v5 = *(_QWORD *)(v3 + 16);
  v43 = v4;
  if (!v5)
  {
    result = (id)swift_release();
    v36 = v43;
    v35 = v37;
LABEL_28:
    *v35 = v36;
    return result;
  }
  v6 = v4;
  result = (id)(v4 + 64);
  v8 = (unint64_t)((1 << *(_BYTE *)(v6 + 32)) + 63) >> 6;
  if (v6 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8)
  {
    result = memmove(result, (const void *)(v3 + 64), 8 * v8);
    v6 = v43;
  }
  v10 = 0;
  *(_QWORD *)(v6 + 16) = *(_QWORD *)(v3 + 16);
  v11 = 1 << *(_BYTE *)(v3 + 32);
  v42 = v3;
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & *(_QWORD *)(v3 + 64);
  v38 = v3 + 64;
  v39 = (unint64_t)(v11 + 63) >> 6;
  v14 = (uint64_t)v40;
  v15 = v43;
  while (1)
  {
    if (v13)
    {
      v16 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      v44 = v10;
      v17 = v16 | (v10 << 6);
      v18 = v42;
      goto LABEL_12;
    }
    v31 = v10 + 1;
    v18 = v42;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v31 >= v39)
      goto LABEL_26;
    v32 = *(_QWORD *)(v38 + 8 * v31);
    v33 = v10 + 1;
    if (!v32)
    {
      v33 = v31 + 1;
      if (v31 + 1 >= v39)
        goto LABEL_26;
      v32 = *(_QWORD *)(v38 + 8 * v33);
      if (!v32)
        break;
    }
LABEL_25:
    v13 = (v32 - 1) & v32;
    v44 = v33;
    v17 = __clz(__rbit64(v32)) + (v33 << 6);
LABEL_12:
    v19 = *(_QWORD *)(v41 + 72) * v17;
    sub_235C9F05C(*(_QWORD *)(v18 + 48) + v19, v14);
    v20 = 56 * v17;
    v21 = *(_QWORD *)(v18 + 56) + 56 * v17;
    v22 = *(_BYTE *)(v21 + 16);
    v23 = *(_QWORD *)(v21 + 24);
    v24 = *(_BYTE *)(v21 + 32);
    v25 = *(_QWORD *)(v21 + 40);
    v26 = *(_QWORD *)(v21 + 48);
    v27 = *(_QWORD *)(v15 + 48) + v19;
    v45 = *(_OWORD *)v21;
    sub_235C9883C(v14, v27);
    v28 = *(_QWORD *)(v15 + 56) + v20;
    v29 = (void *)v45;
    *(_OWORD *)v28 = v45;
    *(_BYTE *)(v28 + 16) = v22;
    *(_QWORD *)(v28 + 24) = v23;
    *(_BYTE *)(v28 + 32) = v24;
    *(_QWORD *)(v28 + 40) = v25;
    *(_QWORD *)(v28 + 48) = v26;
    v30 = v29;
    swift_bridgeObjectRetain();
    result = v30;
    v10 = v44;
  }
  v34 = v31 + 2;
  if (v34 >= v39)
  {
LABEL_26:
    result = (id)swift_release();
    v35 = v37;
    v36 = v43;
    goto LABEL_28;
  }
  v32 = *(_QWORD *)(v38 + 8 * v34);
  if (v32)
  {
    v33 = v34;
    goto LABEL_25;
  }
  while (1)
  {
    v33 = v34 + 1;
    if (__OFADD__(v34, 1))
      break;
    if (v33 >= v39)
      goto LABEL_26;
    v32 = *(_QWORD *)(v38 + 8 * v33);
    ++v34;
    if (v32)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_235C9F05C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for CacheKey();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_235C9F0A0()
{
  uint64_t v0;
  uint64_t v1;

  v1 = sub_235CA2790();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_235C9F144()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;

  v1 = *(_QWORD *)(sub_235CA2790() - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v3 = (*(_QWORD *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8;
  sub_235C9A900(v0 + v2, *(_QWORD *)(v0 + v3), *(_QWORD *)(v0 + v3 + 8), *(_QWORD *)(v0 + ((v3 + 23) & 0xFFFFFFFFFFFFFFF8)), *(_QWORD *)(v0 + ((((v3 + 23) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)), *(_QWORD *)(v0 + ((((v3 + 23) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 8));
}

uint64_t sub_235C9F1A8()
{
  return sub_235C9F25C((uint64_t (*)(unint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_235C9A22C);
}

uint64_t objectdestroy_8Tm()
{
  uint64_t v0;
  uint64_t v1;

  v1 = sub_235CA2790();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_235C9F250()
{
  return sub_235C9F25C((uint64_t (*)(unint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_235C99B34);
}

uint64_t sub_235C9F25C(uint64_t (*a1)(unint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = *(_QWORD *)(sub_235CA2790() - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  return a1(v1 + v3, *(_QWORD *)(v1 + v4), *(_QWORD *)(v1 + v4 + 8), *(_QWORD *)(v1 + ((v4 + 23) & 0xFFFFFFFFFFFFFFF8)), *(_QWORD *)(v1 + ((((v4 + 23) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)), *(unsigned __int8 *)(v1 + ((((v4 + 23) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 8));
}

uint64_t sub_235C9F2D0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v1 = sub_235CA2790();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (((((*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  swift_bridgeObjectRelease();
  swift_release();

  return swift_deallocObject();
}

uint64_t sub_235C9F370()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;

  v1 = *(_QWORD *)(sub_235CA2790() - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v3 = (*(_QWORD *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8;
  return sub_235C996F0(v0 + v2, *(_QWORD *)(v0 + v3), *(_QWORD *)(v0 + v3 + 8), *(_QWORD *)(v0 + ((v3 + 23) & 0xFFFFFFFFFFFFFFF8)), *(void **)(v0 + ((((v3 + 23) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFF8)));
}

unint64_t sub_235C9F3CC()
{
  unint64_t result;

  result = qword_2542993E8;
  if (!qword_2542993E8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2542993E8);
  }
  return result;
}

uint64_t sub_235C9F408(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x23B7DE090](MEMORY[0x24BEE12C8], v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_235C9F468(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_235C9F494(uint64_t a1, uint64_t a2)
{
  return sub_235C9F898(a1, a2, (uint64_t)&unk_25070D0F8, (uint64_t)sub_235CA2220, (uint64_t)&block_descriptor_34);
}

void sub_235C9F4B0(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  id v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  _BYTE v27[16];
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v6 = sub_235CA3564();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = &v27[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v28 = a1;
  v29 = a2;
  v30 = a3;
  v10 = objc_allocWithZone((Class)sub_235CA29DC());
  v11 = sub_235CA29D0();
  if (v11)
  {
    v12 = (void *)v11;
    if (qword_2542992E8 != -1)
      swift_once();
    v13 = sub_235CA3708();
    __swift_project_value_buffer(v13, (uint64_t)qword_254299660);
    v14 = sub_235CA36FC();
    v15 = sub_235CA3924();
    if (os_log_type_enabled(v14, v15))
    {
      v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_235C5E000, v14, v15, "Going to post AttendingStartedMessage", v16, 2u);
      MEMORY[0x23B7DE144](v16, -1, -1);
    }

    if (qword_2542989C0 != -1)
      swift_once();
    v17 = __swift_project_value_buffer(v6, (uint64_t)qword_254299648);
    (*(void (**)(_BYTE *, uint64_t, uint64_t))(v7 + 16))(v9, v17, v6);
    *(_QWORD *)(swift_allocObject() + 16) = a1;
    v18 = a1;
    sub_235CA3540();
    swift_release();
    (*(void (**)(_BYTE *, uint64_t))(v7 + 8))(v9, v6);
    __swift_project_boxed_opaque_existential_1(&v18[OBJC_IVAR____TtC9ASRBridge29AttendingStatesServiceHandler_messagePublisher], *(_QWORD *)&v18[OBJC_IVAR____TtC9ASRBridge29AttendingStatesServiceHandler_messagePublisher + 24]);
    sub_235CA33B4();

  }
  else
  {
    if (qword_2542992E8 != -1)
      swift_once();
    v19 = sub_235CA3708();
    __swift_project_value_buffer(v19, (uint64_t)qword_254299660);
    v20 = a1;
    v21 = sub_235CA36FC();
    v22 = sub_235CA3930();
    if (os_log_type_enabled(v21, v22))
    {
      v23 = (uint8_t *)swift_slowAlloc();
      v24 = swift_slowAlloc();
      *(_DWORD *)v23 = 136315138;
      v32 = v24;
      sub_235CA2790();
      sub_235C69C18((unint64_t *)&unk_254299040, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
      v25 = sub_235CA3B64();
      v31 = sub_235C944B8(v25, v26, &v32);
      sub_235CA3A14();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_235C5E000, v21, v22, "Failed to create AttendingStartedMessage for session: %s", v23, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B7DE144](v24, -1, -1);
      MEMORY[0x23B7DE144](v23, -1, -1);

    }
    else
    {

    }
  }
}

uint64_t sub_235C9F87C(uint64_t a1, uint64_t a2)
{
  return sub_235C9F898(a1, a2, (uint64_t)&unk_25070D0A8, (uint64_t)sub_235CA21A8, (uint64_t)&block_descriptor_28_0);
}

uint64_t sub_235C9F898(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  char *v5;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  _QWORD *v16;
  void *v17;
  char *v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD aBlock[6];

  v10 = sub_235CA3738();
  v22 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = sub_235CA375C();
  v13 = *(_QWORD *)(v21 - 8);
  MEMORY[0x24BDAC7A8](v21);
  v15 = (char *)&v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = *(_QWORD *)&v5[OBJC_IVAR____TtC9ASRBridge29AttendingStatesServiceHandler_queue];
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = v5;
  v16[3] = a1;
  v16[4] = a2;
  aBlock[4] = a4;
  aBlock[5] = v16;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_235C9F468;
  aBlock[3] = a5;
  v17 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  v18 = v5;
  sub_235CA3744();
  v23 = MEMORY[0x24BEE4AF8];
  sub_235C69C18(&qword_2542990D0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254299350);
  sub_235C9F408((unint64_t *)&qword_254299360, (uint64_t *)&unk_254299350);
  sub_235CA3A38();
  MEMORY[0x23B7DDA18](0, v15, v12, v17);
  _Block_release(v17);
  (*(void (**)(char *, uint64_t))(v22 + 8))(v12, v10);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v21);
  return swift_release();
}

void sub_235C9FA8C(char *a1)
{
  id v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;

  v2 = objc_allocWithZone((Class)sub_235CA2C58());
  v3 = sub_235CA2C4C();
  if (v3)
  {
    v4 = (char *)v3;
    if (qword_2542992E8 != -1)
      swift_once();
    v5 = sub_235CA3708();
    __swift_project_value_buffer(v5, (uint64_t)qword_254299660);
    v6 = sub_235CA36FC();
    v7 = sub_235CA3924();
    if (os_log_type_enabled(v6, v7))
    {
      v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_235C5E000, v6, v7, "Going to post AttendingWillStartMessage", v8, 2u);
      MEMORY[0x23B7DE144](v8, -1, -1);
    }

    __swift_project_boxed_opaque_existential_1(&a1[OBJC_IVAR____TtC9ASRBridge29AttendingStatesServiceHandler_messagePublisher], *(_QWORD *)&a1[OBJC_IVAR____TtC9ASRBridge29AttendingStatesServiceHandler_messagePublisher + 24]);
    sub_235CA33B4();
  }
  else
  {
    if (qword_2542992E8 != -1)
      swift_once();
    v9 = sub_235CA3708();
    __swift_project_value_buffer(v9, (uint64_t)qword_254299660);
    v4 = a1;
    v10 = sub_235CA36FC();
    v11 = sub_235CA3930();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      v13 = swift_slowAlloc();
      *(_DWORD *)v12 = 136315138;
      v16 = v13;
      sub_235CA2790();
      sub_235C69C18((unint64_t *)&unk_254299040, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
      v14 = sub_235CA3B64();
      sub_235C944B8(v14, v15, &v16);
      sub_235CA3A14();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_235C5E000, v10, v11, "Failed to create AttendingWillStartMessage for session: %s", v12, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B7DE144](v13, -1, -1);
      MEMORY[0x23B7DE144](v12, -1, -1);

      return;
    }

  }
}

uint64_t sub_235C9FD6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(char *), void (*a6)(uint64_t, uint64_t), void (*a7)(char *), uint64_t (*a8)(uint64_t, uint64_t))
{
  uint64_t v12;
  uint64_t v13;
  char *v14;
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
  uint64_t v25;
  uint64_t v27;
  void (*v28)(char *);
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);

  v29 = a3;
  v30 = a8;
  v28 = a7;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_254299050);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_254299070);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v27 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = *MEMORY[0x24BE9AD78];
  v19 = sub_235CA33CC();
  v20 = *(_QWORD *)(v19 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v20 + 104))(v17, v18, v19);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v20 + 56))(v17, 0, 1, v19);
  a5(v17);
  v21 = *(_QWORD *)(a2 + OBJC_IVAR____TtC9ASRBridge29AttendingStatesServiceHandler_assistantId);
  v22 = *(_QWORD *)(a2 + OBJC_IVAR____TtC9ASRBridge29AttendingStatesServiceHandler_assistantId + 8);
  swift_bridgeObjectRetain();
  a6(v21, v22);
  v23 = a2 + OBJC_IVAR____TtC9ASRBridge29AttendingStatesServiceHandler_sessionId;
  v24 = sub_235CA2790();
  v25 = *(_QWORD *)(v24 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v25 + 16))(v14, v23, v24);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v25 + 56))(v14, 0, 1, v24);
  v28(v14);
  swift_bridgeObjectRetain();
  return v30(v29, a4);
}

uint64_t sub_235C9FF20(void *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t))
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  if (a3)
  {
    v6 = sub_235CA37EC();
    v8 = v7;
  }
  else
  {
    v6 = 0;
    v8 = 0;
  }
  v9 = a1;
  a4(v6, v8);

  return swift_bridgeObjectRelease();
}

uint64_t sub_235C9FF84(void *a1)
{
  char *v1;
  uint64_t v3;
  uint64_t (*v4)(uint64_t);
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  void *v13;
  id v14;
  char *v15;
  _QWORD v17[2];
  _QWORD aBlock[6];

  v3 = sub_235CA3738();
  v4 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458];
  v5 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_235CA375C();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17[0] = *(_QWORD *)&v1[OBJC_IVAR____TtC9ASRBridge29AttendingStatesServiceHandler_queue];
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = a1;
  *(_QWORD *)(v12 + 24) = v1;
  aBlock[4] = sub_235CA2164;
  aBlock[5] = v12;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_235C9F468;
  aBlock[3] = &block_descriptor_19;
  v13 = _Block_copy(aBlock);
  v14 = a1;
  v15 = v1;
  sub_235CA3744();
  v17[1] = MEMORY[0x24BEE4AF8];
  sub_235C69C18(&qword_2542990D0, v4, MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254299350);
  sub_235C9F408((unint64_t *)&qword_254299360, (uint64_t *)&unk_254299350);
  sub_235CA3A38();
  MEMORY[0x23B7DDA18](0, v11, v7, v13);
  _Block_release(v13);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v3);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return swift_release();
}

void sub_235CA0174(void *a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  id v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  _QWORD *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  uint64_t v24;
  char *v25;
  id v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37[2];

  v37[1] = *MEMORY[0x24BDAC8D0];
  v4 = sub_235CA3564();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2542992E8 != -1)
    swift_once();
  v8 = sub_235CA3708();
  __swift_project_value_buffer(v8, (uint64_t)qword_254299660);
  v9 = a1;
  v10 = a1;
  v11 = sub_235CA36FC();
  v12 = sub_235CA3930();
  if (os_log_type_enabled(v11, v12))
  {
    v34 = a2;
    v35 = v5;
    v13 = (uint8_t *)swift_slowAlloc();
    v14 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v13 = 138412290;
    if (a1)
    {
      v15 = a1;
      v16 = _swift_stdlib_bridgeErrorToNSError();
      v37[0] = v16;
      sub_235CA3A14();
    }
    else
    {
      v37[0] = 0;
      sub_235CA3A14();
      v16 = 0;
    }
    *v14 = v16;

    _os_log_impl(&dword_235C5E000, v11, v12, "Received AttendingStoppedUnexpectedly with error = %@", v13, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254299410);
    swift_arrayDestroy();
    MEMORY[0x23B7DE144](v14, -1, -1);
    MEMORY[0x23B7DE144](v13, -1, -1);

    a2 = v34;
    v5 = v35;
  }
  else
  {

  }
  MEMORY[0x24BDAC7A8](v17);
  *(&v33 - 2) = (uint64_t)a2;
  v18 = objc_allocWithZone((Class)sub_235CA3144());
  v19 = sub_235CA3138();
  if (v19)
  {
    v20 = (void *)v19;
    v21 = sub_235CA36FC();
    v22 = sub_235CA3924();
    if (os_log_type_enabled(v21, v22))
    {
      v23 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v23 = 0;
      _os_log_impl(&dword_235C5E000, v21, v22, "Going to post AttendingStoppedUnexpectedlyMessage", v23, 2u);
      MEMORY[0x23B7DE144](v23, -1, -1);
    }

    if (qword_2542989C0 != -1)
      swift_once();
    v24 = __swift_project_value_buffer(v4, (uint64_t)qword_254299648);
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v24, v4);
    *(_QWORD *)(swift_allocObject() + 16) = a2;
    v25 = a2;
    sub_235CA3540();
    swift_release();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    __swift_project_boxed_opaque_existential_1(&v25[OBJC_IVAR____TtC9ASRBridge29AttendingStatesServiceHandler_messagePublisher], *(_QWORD *)&v25[OBJC_IVAR____TtC9ASRBridge29AttendingStatesServiceHandler_messagePublisher + 24]);
    sub_235CA33B4();

  }
  else
  {
    v26 = a2;
    v27 = sub_235CA36FC();
    v28 = sub_235CA3930();
    if (os_log_type_enabled(v27, v28))
    {
      v29 = (uint8_t *)swift_slowAlloc();
      v30 = swift_slowAlloc();
      *(_DWORD *)v29 = 136315138;
      v37[0] = v30;
      sub_235CA2790();
      sub_235C69C18((unint64_t *)&unk_254299040, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
      v31 = sub_235CA3B64();
      v36 = sub_235C944B8(v31, v32, v37);
      sub_235CA3A14();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_235C5E000, v27, v28, "Failed to create AttendingStoppedUnexpectedlyMessage for session: %s", v29, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B7DE144](v30, -1, -1);
      MEMORY[0x23B7DE144](v29, -1, -1);

    }
    else
    {

    }
  }
}

uint64_t sub_235CA069C(uint64_t a1, uint64_t a2)
{
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_254299050);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254299070);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *MEMORY[0x24BE9AD78];
  v10 = sub_235CA33CC();
  v11 = *(_QWORD *)(v10 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 104))(v8, v9, v10);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  sub_235CA3390();
  swift_bridgeObjectRetain();
  sub_235CA3384();
  v12 = a2 + OBJC_IVAR____TtC9ASRBridge29AttendingStatesServiceHandler_sessionId;
  v13 = sub_235CA2790();
  v14 = *(_QWORD *)(v13 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v5, v12, v13);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v5, 0, 1, v13);
  return sub_235CA339C();
}

uint64_t sub_235CA080C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  _QWORD *v16;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254299468);
  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2542990C0);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 72);
  v8 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_235CA4FB0;
  v10 = v9 + v8;
  v11 = *(int *)(v5 + 48);
  sub_235CA34C8();
  if (qword_254299310 != -1)
    swift_once();
  v12 = (_QWORD *)(v10 + v11);
  v13 = unk_254299680;
  *v12 = qword_254299678;
  v12[1] = v13;
  v14 = (_QWORD *)(v10 + v7 + *(int *)(v5 + 48));
  swift_bridgeObjectRetain();
  sub_235CA3504();
  *v14 = a2;
  v14[1] = a3;
  v15 = (_QWORD *)(v10 + 2 * v7 + *(int *)(v5 + 48));
  sub_235CA34D4();
  sub_235CA3828();
  sub_235CA3828();
  sub_235CA3828();
  *v15 = 0;
  v15[1] = 0xE000000000000000;
  v16 = (_QWORD *)(v10 + 3 * v7 + *(int *)(v5 + 48));
  sub_235CA3534();
  sub_235CA3828();
  sub_235CA2790();
  sub_235C69C18((unint64_t *)&unk_254299040, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
  sub_235CA3B64();
  sub_235CA3828();
  swift_bridgeObjectRelease();
  sub_235CA3828();
  *v16 = 0;
  v16[1] = 0xE000000000000000;
  return v9;
}

void sub_235CA0A4C()
{
  uint64_t v0;
  os_log_type_t v1;
  uint8_t *v2;
  NSObject *oslog;

  if (qword_2542992E8 != -1)
    swift_once();
  v0 = sub_235CA3708();
  __swift_project_value_buffer(v0, (uint64_t)qword_254299660);
  oslog = sub_235CA36FC();
  v1 = sub_235CA3924();
  if (os_log_type_enabled(oslog, v1))
  {
    v2 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_235C5E000, oslog, v1, "Received SpeechStartDetected in deprecated path, dropping.", v2, 2u);
    MEMORY[0x23B7DE144](v2, -1, -1);
  }

}

uint64_t sub_235CA0B60(char a1)
{
  char *v1;
  uint64_t v3;
  uint64_t (*v4)(uint64_t);
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  void *v13;
  char *v14;
  _QWORD v16[2];
  _QWORD aBlock[6];

  v3 = sub_235CA3738();
  v4 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458];
  v5 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_235CA375C();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16[0] = *(_QWORD *)&v1[OBJC_IVAR____TtC9ASRBridge29AttendingStatesServiceHandler_queue];
  v12 = swift_allocObject();
  *(_BYTE *)(v12 + 16) = a1;
  *(_QWORD *)(v12 + 24) = v1;
  aBlock[4] = sub_235CA20CC;
  aBlock[5] = v12;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_235C9F468;
  aBlock[3] = &block_descriptor_10_0;
  v13 = _Block_copy(aBlock);
  v14 = v1;
  sub_235CA3744();
  v16[1] = MEMORY[0x24BEE4AF8];
  sub_235C69C18(&qword_2542990D0, v4, MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254299350);
  sub_235C9F408((unint64_t *)&qword_254299360, (uint64_t *)&unk_254299350);
  sub_235CA3A38();
  MEMORY[0x23B7DDA18](0, v11, v7, v13);
  _Block_release(v13);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v3);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return swift_release();
}

void sub_235CA0D4C(char a1, void *a2)
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
  id v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  char *v20;
  id v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v4 = sub_235CA3564();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2542992E8 != -1)
    swift_once();
  v8 = sub_235CA3708();
  __swift_project_value_buffer(v8, (uint64_t)qword_254299660);
  v9 = sub_235CA36FC();
  v10 = sub_235CA3924();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v11 = 67109120;
    LODWORD(v29) = a1 & 1;
    sub_235CA3A14();
    _os_log_impl(&dword_235C5E000, v9, v10, "Received SpeechStartDetected with shouldDuckTTS:%{BOOL}d", v11, 8u);
    MEMORY[0x23B7DE144](v11, -1, -1);
  }

  MEMORY[0x24BDAC7A8](v12);
  *(&v28 - 2) = (uint64_t)a2;
  *((_BYTE *)&v28 - 8) = a1 & 1;
  v13 = objc_allocWithZone((Class)sub_235CA2E14());
  v14 = sub_235CA2DD8();
  if (v14)
  {
    v15 = (void *)v14;
    v16 = sub_235CA36FC();
    v17 = sub_235CA3924();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_235C5E000, v16, v17, "Going to post SpeechStartDetectedMessage", v18, 2u);
      MEMORY[0x23B7DE144](v18, -1, -1);
    }

    if (qword_2542989C0 != -1)
      swift_once();
    v19 = __swift_project_value_buffer(v4, (uint64_t)qword_254299648);
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v19, v4);
    *(_QWORD *)(swift_allocObject() + 16) = a2;
    v20 = a2;
    sub_235CA3540();
    swift_release();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    __swift_project_boxed_opaque_existential_1(&v20[OBJC_IVAR____TtC9ASRBridge29AttendingStatesServiceHandler_messagePublisher], *(_QWORD *)&v20[OBJC_IVAR____TtC9ASRBridge29AttendingStatesServiceHandler_messagePublisher + 24]);
    sub_235CA33B4();

  }
  else
  {
    v21 = a2;
    v22 = sub_235CA36FC();
    v23 = sub_235CA3930();
    if (os_log_type_enabled(v22, v23))
    {
      v24 = (uint8_t *)swift_slowAlloc();
      v25 = swift_slowAlloc();
      *(_DWORD *)v24 = 136315138;
      v29 = v25;
      sub_235CA2790();
      sub_235C69C18((unint64_t *)&unk_254299040, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
      v26 = sub_235CA3B64();
      v28 = sub_235C944B8(v26, v27, &v29);
      sub_235CA3A14();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_235C5E000, v22, v23, "Failed to create SpeechStartDetectedMessage for session: %s", v24, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B7DE144](v25, -1, -1);
      MEMORY[0x23B7DE144](v24, -1, -1);

    }
    else
    {

    }
  }
}

uint64_t sub_235CA1198(uint64_t a1, uint64_t a2)
{
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_254299050);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254299070);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *MEMORY[0x24BE9AD78];
  v10 = sub_235CA33CC();
  v11 = *(_QWORD *)(v10 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 104))(v8, v9, v10);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  sub_235CA2DFC();
  swift_bridgeObjectRetain();
  sub_235CA2DE4();
  v12 = a2 + OBJC_IVAR____TtC9ASRBridge29AttendingStatesServiceHandler_sessionId;
  v13 = sub_235CA2790();
  v14 = *(_QWORD *)(v13 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v5, v12, v13);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v5, 0, 1, v13);
  sub_235CA2E08();
  return sub_235CA2DF0();
}

uint64_t sub_235CA1354(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  char *v4;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  _QWORD *v16;
  void *v17;
  char *v18;
  _QWORD v20[2];
  uint64_t v21;
  uint64_t v22;
  _QWORD aBlock[6];

  v9 = sub_235CA3738();
  v21 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_235CA375C();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20[1] = *(_QWORD *)&v4[OBJC_IVAR____TtC9ASRBridge29AttendingStatesServiceHandler_queue];
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = a1;
  v16[3] = a2;
  v16[4] = a3;
  v16[5] = a4;
  v16[6] = v4;
  aBlock[4] = sub_235CA2040;
  aBlock[5] = v16;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_235C9F468;
  aBlock[3] = &block_descriptor_5;
  v17 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  v18 = v4;
  sub_235CA3744();
  v22 = MEMORY[0x24BEE4AF8];
  sub_235C69C18(&qword_2542990D0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254299350);
  sub_235C9F408((unint64_t *)&qword_254299360, (uint64_t *)&unk_254299350);
  sub_235CA3A38();
  MEMORY[0x23B7DDA18](0, v15, v11, v17);
  _Block_release(v17);
  (*(void (**)(char *, uint64_t))(v21 + 8))(v11, v9);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  return swift_release();
}

void sub_235CA155C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char *a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  int v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  os_log_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  os_log_type_t v35;
  uint8_t *v36;
  uint64_t v37;
  _BYTE *v38;
  uint64_t v39;
  char *v40;
  char *v41;
  NSObject *v42;
  os_log_type_t v43;
  uint8_t *v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  _BYTE v48[12];
  int v49;
  uint64_t v50;
  uint64_t v51;
  _BYTE *v52;
  uint64_t v53;
  uint64_t v54;
  os_log_t v55;
  uint64_t v56;
  uint64_t v57;

  v10 = sub_235CA3564();
  v53 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v52 = &v48[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (qword_2542992E8 != -1)
    swift_once();
  v12 = sub_235CA3708();
  v13 = __swift_project_value_buffer(v12, (uint64_t)qword_254299660);
  swift_bridgeObjectRetain_n();
  v54 = v13;
  v14 = sub_235CA36FC();
  v15 = sub_235CA3924();
  v16 = v15;
  v55 = v14;
  if (os_log_type_enabled(v14, v15))
  {
    v17 = swift_slowAlloc();
    v50 = swift_slowAlloc();
    v56 = a1;
    v57 = v50;
    *(_DWORD *)v17 = 134218498;
    v51 = a2;
    sub_235CA3A14();
    *(_WORD *)(v17 + 12) = 2048;
    v56 = v51;
    sub_235CA3A14();
    *(_WORD *)(v17 + 22) = 2080;
    v18 = a5;
    v19 = v10;
    if (a4)
      v20 = a3;
    else
      v20 = 0;
    v49 = v16;
    if (a4)
      v21 = a4;
    else
      v21 = 0xE000000000000000;
    swift_bridgeObjectRetain();
    v22 = v20;
    v10 = v19;
    a5 = v18;
    v56 = sub_235C944B8(v22, v21, &v57);
    a2 = v51;
    sub_235CA3A14();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    v23 = v55;
    _os_log_impl(&dword_235C5E000, v55, (os_log_type_t)v49, "Received SpeechRecognizerReadyForNewTurn with hostTime:%llu, audioRecordType: %lld, deviceId: %s", (uint8_t *)v17, 0x20u);
    v24 = v50;
    swift_arrayDestroy();
    MEMORY[0x23B7DE144](v24, -1, -1);
    MEMORY[0x23B7DE144](v17, -1, -1);

  }
  else
  {

    v25 = swift_bridgeObjectRelease_n();
  }
  MEMORY[0x24BDAC7A8](v25);
  *(_QWORD *)&v48[-48] = a5;
  *(_QWORD *)&v48[-40] = a1;
  *(_QWORD *)&v48[-32] = a2;
  *(_QWORD *)&v48[-24] = a3;
  *(_QWORD *)&v48[-16] = a4;
  v26 = objc_allocWithZone((Class)sub_235CA2BD4());
  v27 = sub_235CA2B80();
  if (v27)
  {
    v28 = (void *)v27;
    v29 = *(_QWORD *)&a5[OBJC_IVAR____TtC9ASRBridge29AttendingStatesServiceHandler_assistantId];
    v30 = *(_QWORD *)&a5[OBJC_IVAR____TtC9ASRBridge29AttendingStatesServiceHandler_assistantId + 8];
    v31 = a1;
    v32 = a3;
    v33 = (uint64_t)&a5[OBJC_IVAR____TtC9ASRBridge29AttendingStatesServiceHandler_sessionId];
    sub_235C99B18(v31, 0, v29, v30, (uint64_t)&a5[OBJC_IVAR____TtC9ASRBridge29AttendingStatesServiceHandler_sessionId]);
    sub_235C99F5C(a2, 0, v29, v30, v33);
    sub_235C9A650(v32, a4, v29, v30, v33);
    v34 = sub_235CA36FC();
    v35 = sub_235CA3924();
    if (os_log_type_enabled(v34, v35))
    {
      v36 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v36 = 0;
      _os_log_impl(&dword_235C5E000, v34, v35, "Going to post ASRReadyForNewTurnMessage", v36, 2u);
      MEMORY[0x23B7DE144](v36, -1, -1);
    }

    if (qword_2542989C0 != -1)
      swift_once();
    v37 = __swift_project_value_buffer(v10, (uint64_t)qword_254299648);
    v38 = v52;
    v39 = v53;
    (*(void (**)(_BYTE *, uint64_t, uint64_t))(v53 + 16))(v52, v37, v10);
    *(_QWORD *)(swift_allocObject() + 16) = a5;
    v40 = a5;
    sub_235CA3540();
    swift_release();
    (*(void (**)(_BYTE *, uint64_t))(v39 + 8))(v38, v10);
    __swift_project_boxed_opaque_existential_1(&v40[OBJC_IVAR____TtC9ASRBridge29AttendingStatesServiceHandler_messagePublisher], *(_QWORD *)&v40[OBJC_IVAR____TtC9ASRBridge29AttendingStatesServiceHandler_messagePublisher + 24]);
    sub_235CA33B4();

  }
  else
  {
    v41 = a5;
    v42 = sub_235CA36FC();
    v43 = sub_235CA3930();
    if (os_log_type_enabled(v42, v43))
    {
      v44 = (uint8_t *)swift_slowAlloc();
      v45 = swift_slowAlloc();
      *(_DWORD *)v44 = 136315138;
      v57 = v45;
      sub_235CA2790();
      sub_235C69C18((unint64_t *)&unk_254299040, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEAB8]);
      v46 = sub_235CA3B64();
      v56 = sub_235C944B8(v46, v47, &v57);
      sub_235CA3A14();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_235C5E000, v42, v43, "Failed to create ASRReadyForNewTurnMessage for session: %s", v44, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B7DE144](v45, -1, -1);
      MEMORY[0x23B7DE144](v44, -1, -1);

    }
    else
    {

    }
  }
}

uint64_t sub_235CA1B40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unsigned int *v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v27[2];

  v27[0] = a5;
  v27[1] = a6;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_256377BB8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_254299050);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_254299070);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)v27 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = *MEMORY[0x24BE9AD78];
  v18 = sub_235CA33CC();
  v19 = *(_QWORD *)(v18 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 104))(v16, v17, v18);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v19 + 56))(v16, 0, 1, v18);
  sub_235CA2BB0();
  swift_bridgeObjectRetain();
  sub_235CA2B8C();
  v20 = a2 + OBJC_IVAR____TtC9ASRBridge29AttendingStatesServiceHandler_sessionId;
  v21 = sub_235CA2790();
  v22 = *(_QWORD *)(v21 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v22 + 16))(v13, v20, v21);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v22 + 56))(v13, 0, 1, v21);
  sub_235CA2BC8();
  sub_235CA2BBC();
  switch(a4)
  {
    case 22:
      v23 = (unsigned int *)MEMORY[0x24BE9B0D8];
      break;
    case 23:
      v23 = (unsigned int *)MEMORY[0x24BE9B0E0];
      break;
    case 25:
      v23 = (unsigned int *)MEMORY[0x24BE9B0F0];
      break;
    case 27:
      v23 = (unsigned int *)MEMORY[0x24BE9B0E8];
      break;
    default:
      v23 = (unsigned int *)MEMORY[0x24BE9B0F8];
      break;
  }
  v24 = *v23;
  v25 = sub_235CA342C();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 104))(v10, v24, v25);
  sub_235CA342C();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 56))(v10, 0, 1, v25);
  sub_235CA2B98();
  swift_bridgeObjectRetain();
  return sub_235CA2BA4();
}

id sub_235CA1E7C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AttendingStatesServiceHandler();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_235CA1F34()
{
  return type metadata accessor for AttendingStatesServiceHandler();
}

uint64_t type metadata accessor for AttendingStatesServiceHandler()
{
  uint64_t result;

  result = qword_254299278;
  if (!qword_254299278)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_235CA1F78()
{
  uint64_t result;
  unint64_t v1;

  result = sub_235CA2790();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_235CA2014()
{
  uint64_t v0;

  swift_bridgeObjectRelease();

  return swift_deallocObject();
}

void sub_235CA2040()
{
  uint64_t v0;

  sub_235CA155C(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40), *(char **)(v0 + 48));
}

uint64_t block_copy_helper_5(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_5()
{
  return swift_release();
}

uint64_t sub_235CA2068(uint64_t a1)
{
  uint64_t *v1;

  return sub_235CA1B40(a1, v1[2], v1[3], v1[4], v1[5], v1[6]);
}

uint64_t sub_235CA2078()
{
  uint64_t v0;

  return sub_235CA080C(*(_QWORD *)(v0 + 16), 0xD000000000000015, 0x8000000235CA6B00);
}

uint64_t sub_235CA20A8()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_235CA20CC()
{
  uint64_t v0;

  sub_235CA0D4C(*(_BYTE *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_235CA20D8(uint64_t a1)
{
  uint64_t v1;

  return sub_235CA1198(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_235CA20E4()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_235CA2108()
{
  uint64_t v0;

  return sub_235CA080C(*(_QWORD *)(v0 + 16), 0xD000000000000016, 0x8000000235CA6AE0);
}

uint64_t sub_235CA2138()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_235CA2164()
{
  uint64_t v0;

  sub_235CA0174(*(void **)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_235CA216C(uint64_t a1)
{
  uint64_t v1;

  return sub_235CA069C(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_235CA2174()
{
  uint64_t v0;

  return sub_235CA080C(*(_QWORD *)(v0 + 16), 0xD00000000000002CLL, 0x8000000235CA6B20);
}

void sub_235CA21A8()
{
  uint64_t v0;

  sub_235C9FA8C(*(char **)(v0 + 16));
}

uint64_t sub_235CA21B4(uint64_t a1)
{
  uint64_t *v1;

  return sub_235C9FD6C(a1, v1[2], v1[3], v1[4], MEMORY[0x24BE9A478], MEMORY[0x24BE9A468], MEMORY[0x24BE9A480], MEMORY[0x24BE9A470]);
}

uint64_t objectdestroy_24Tm()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_235CA2220()
{
  uint64_t v0;

  sub_235C9F4B0(*(void **)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
}

uint64_t sub_235CA222C(uint64_t a1)
{
  uint64_t *v1;

  return sub_235C9FD6C(a1, v1[2], v1[3], v1[4], MEMORY[0x24BE99F90], MEMORY[0x24BE99F80], MEMORY[0x24BE99F98], MEMORY[0x24BE99F88]);
}

uint64_t sub_235CA2268()
{
  uint64_t v0;

  return sub_235CA080C(*(_QWORD *)(v0 + 16), 0xD000000000000020, 0x8000000235CA6B50);
}

id sub_235CA2298(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  objc_class *v20;
  id v21;
  _QWORD v23[2];
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  objc_super v31;
  uint64_t v32;

  v29 = a4;
  v30 = a5;
  v27 = a2;
  v28 = a3;
  v26 = a1;
  v25 = sub_235CA3954();
  v6 = *(_QWORD *)(v25 - 8);
  MEMORY[0x24BDAC7A8](v25);
  v8 = (char *)v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_235CA3948();
  v10 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688];
  MEMORY[0x24BDAC7A8](v9);
  v11 = sub_235CA375C();
  MEMORY[0x24BDAC7A8](v11);
  v24 = OBJC_IVAR____TtC9ASRBridge29AttendingStatesServiceHandler_queue;
  v23[0] = sub_235C9F3CC();
  v12 = v5;
  sub_235CA3750();
  v32 = MEMORY[0x24BEE4AF8];
  sub_235C69C18(&qword_2542993E0, v10, MEMORY[0x24BEE5698]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254299370);
  sub_235C9F408(qword_254299380, (uint64_t *)&unk_254299370);
  sub_235CA3A38();
  (*(void (**)(char *, _QWORD, uint64_t))(v6 + 104))(v8, *MEMORY[0x24BEE5750], v25);
  *(_QWORD *)(v23[1] + v24) = sub_235CA3978();
  v13 = &v12[OBJC_IVAR____TtC9ASRBridge29AttendingStatesServiceHandler_sessionId];
  v14 = sub_235CA2790();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = v26;
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v13, v26, v14);
  v17 = &v12[OBJC_IVAR____TtC9ASRBridge29AttendingStatesServiceHandler_assistantId];
  v18 = v28;
  v19 = v29;
  *(_QWORD *)v17 = v27;
  *((_QWORD *)v17 + 1) = v18;
  sub_235C71390(v19, (uint64_t)&v12[OBJC_IVAR____TtC9ASRBridge29AttendingStatesServiceHandler_messagePublisher]);
  *(_QWORD *)&v12[OBJC_IVAR____TtC9ASRBridge29AttendingStatesServiceHandler_candidateRequestCacheManager] = v30;
  swift_retain();

  v20 = (objc_class *)type metadata accessor for AttendingStatesServiceHandler();
  v31.receiver = v12;
  v31.super_class = v20;
  v21 = objc_msgSendSuper2(&v31, sel_init);
  __swift_destroy_boxed_opaque_existential_1(v19);
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v16, v14);
  return v21;
}

uint64_t sub_235CA2530()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t);
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD aBlock[6];

  v1 = sub_235CA3738();
  v2 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458];
  v3 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v5 = (char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_235CA375C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12[0] = *(_QWORD *)(v0 + OBJC_IVAR____TtC9ASRBridge29AttendingStatesServiceHandler_queue);
  aBlock[4] = sub_235CA0A4C;
  aBlock[5] = 0;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_235C9F468;
  aBlock[3] = &block_descriptor_40;
  v10 = _Block_copy(aBlock);
  sub_235CA3744();
  v12[1] = MEMORY[0x24BEE4AF8];
  sub_235C69C18(&qword_2542990D0, v2, MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254299350);
  sub_235C9F408((unint64_t *)&qword_254299360, (uint64_t *)&unk_254299350);
  sub_235CA3A38();
  MEMORY[0x23B7DDA18](0, v9, v5, v10);
  _Block_release(v10);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v1);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t sub_235CA2724()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_235CA2730()
{
  return MEMORY[0x24BDCD820]();
}

uint64_t sub_235CA273C()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_235CA2748()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_235CA2754()
{
  return MEMORY[0x24BDCE998]();
}

uint64_t sub_235CA2760()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_235CA276C()
{
  return MEMORY[0x24BDCE9D0]();
}

uint64_t sub_235CA2778()
{
  return MEMORY[0x24BDCE9E0]();
}

uint64_t sub_235CA2784()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_235CA2790()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_235CA279C()
{
  return MEMORY[0x24BE30BE0]();
}

uint64_t sub_235CA27A8()
{
  return MEMORY[0x24BE30C50]();
}

uint64_t sub_235CA27B4()
{
  return MEMORY[0x24BE9C248]();
}

uint64_t sub_235CA27C0()
{
  return MEMORY[0x24BE9C270]();
}

uint64_t sub_235CA27CC()
{
  return MEMORY[0x24BE9C2A0]();
}

uint64_t sub_235CA27D8()
{
  return MEMORY[0x24BE9C2B8]();
}

uint64_t sub_235CA27E4()
{
  return MEMORY[0x24BE9C710]();
}

uint64_t sub_235CA27F0()
{
  return MEMORY[0x24BE9C768]();
}

uint64_t sub_235CA27FC()
{
  return MEMORY[0x24BE9C828]();
}

uint64_t sub_235CA2808()
{
  return MEMORY[0x24BE9CAC8]();
}

uint64_t sub_235CA2814()
{
  return MEMORY[0x24BE9CAF0]();
}

uint64_t sub_235CA2820()
{
  return MEMORY[0x24BE9CB10]();
}

uint64_t sub_235CA282C()
{
  return MEMORY[0x24BE9CB28]();
}

uint64_t sub_235CA2838()
{
  return MEMORY[0x24BE9CC28]();
}

uint64_t sub_235CA2844()
{
  return MEMORY[0x24BE9CCA8]();
}

uint64_t sub_235CA2850()
{
  return MEMORY[0x24BE9CCC8]();
}

uint64_t sub_235CA285C()
{
  return MEMORY[0x24BE9CCE0]();
}

uint64_t sub_235CA2868()
{
  return MEMORY[0x24BE9CCE8]();
}

uint64_t sub_235CA2874()
{
  return MEMORY[0x24BE9CD10]();
}

uint64_t sub_235CA2880()
{
  return MEMORY[0x24BE9CD20]();
}

uint64_t sub_235CA288C()
{
  return MEMORY[0x24BE9CD30]();
}

uint64_t sub_235CA2898()
{
  return MEMORY[0x24BE9CD50]();
}

uint64_t sub_235CA28A4()
{
  return MEMORY[0x24BE9CD70]();
}

uint64_t sub_235CA28B0()
{
  return MEMORY[0x24BE9CEF8]();
}

uint64_t sub_235CA28BC()
{
  return MEMORY[0x24BE9CF10]();
}

uint64_t sub_235CA28C8()
{
  return MEMORY[0x24BE99D48]();
}

uint64_t sub_235CA28D4()
{
  return MEMORY[0x24BEA5FA8]();
}

uint64_t sub_235CA28E0()
{
  return MEMORY[0x24BE99D58]();
}

uint64_t sub_235CA28EC()
{
  return MEMORY[0x24BE99D60]();
}

uint64_t sub_235CA28F8()
{
  return MEMORY[0x24BE99D68]();
}

uint64_t sub_235CA2904()
{
  return MEMORY[0x24BE99D78]();
}

uint64_t sub_235CA2910()
{
  return MEMORY[0x24BE99D88]();
}

uint64_t sub_235CA291C()
{
  return MEMORY[0x24BE99DD0]();
}

uint64_t sub_235CA2928()
{
  return MEMORY[0x24BE99DE8]();
}

uint64_t sub_235CA2934()
{
  return MEMORY[0x24BE99E00]();
}

uint64_t sub_235CA2940()
{
  return MEMORY[0x24BE99E08]();
}

uint64_t sub_235CA294C()
{
  return MEMORY[0x24BE99E10]();
}

uint64_t sub_235CA2958()
{
  return MEMORY[0x24BE99EE8]();
}

uint64_t sub_235CA2964()
{
  return MEMORY[0x24BE99EF0]();
}

uint64_t sub_235CA2970()
{
  return MEMORY[0x24BE99EF8]();
}

uint64_t sub_235CA297C()
{
  return MEMORY[0x24BE99F00]();
}

uint64_t sub_235CA2988()
{
  return MEMORY[0x24BE99F08]();
}

uint64_t sub_235CA2994()
{
  return MEMORY[0x24BE99F10]();
}

uint64_t sub_235CA29A0()
{
  return MEMORY[0x24BE99F18]();
}

uint64_t sub_235CA29AC()
{
  return MEMORY[0x24BE99F20]();
}

uint64_t sub_235CA29B8()
{
  return MEMORY[0x24BE99F48]();
}

uint64_t sub_235CA29C4()
{
  return MEMORY[0x24BE99F50]();
}

uint64_t sub_235CA29D0()
{
  return MEMORY[0x24BE99F78]();
}

uint64_t sub_235CA29DC()
{
  return MEMORY[0x24BE99FA0]();
}

uint64_t sub_235CA29E8()
{
  return MEMORY[0x24BE99FB0]();
}

uint64_t sub_235CA29F4()
{
  return MEMORY[0x24BE99FB8]();
}

uint64_t sub_235CA2A00()
{
  return MEMORY[0x24BE99FC0]();
}

uint64_t sub_235CA2A0C()
{
  return MEMORY[0x24BE99FC8]();
}

uint64_t sub_235CA2A18()
{
  return MEMORY[0x24BE99FD0]();
}

uint64_t sub_235CA2A24()
{
  return MEMORY[0x24BE99FD8]();
}

uint64_t sub_235CA2A30()
{
  return MEMORY[0x24BE99FE0]();
}

uint64_t sub_235CA2A3C()
{
  return MEMORY[0x24BE99FE8]();
}

uint64_t sub_235CA2A48()
{
  return MEMORY[0x24BE99FF0]();
}

uint64_t sub_235CA2A54()
{
  return MEMORY[0x24BE9A000]();
}

uint64_t sub_235CA2A60()
{
  return MEMORY[0x24BE9A008]();
}

uint64_t sub_235CA2A6C()
{
  return MEMORY[0x24BE9A010]();
}

uint64_t sub_235CA2A78()
{
  return MEMORY[0x24BE9A018]();
}

uint64_t sub_235CA2A84()
{
  return MEMORY[0x24BE9A020]();
}

uint64_t sub_235CA2A90()
{
  return MEMORY[0x24BE9A028]();
}

uint64_t sub_235CA2A9C()
{
  return MEMORY[0x24BE9A030]();
}

uint64_t sub_235CA2AA8()
{
  return MEMORY[0x24BE9A038]();
}

uint64_t sub_235CA2AB4()
{
  return MEMORY[0x24BE9A040]();
}

uint64_t sub_235CA2AC0()
{
  return MEMORY[0x24BE9A050]();
}

uint64_t sub_235CA2ACC()
{
  return MEMORY[0x24BE9A058]();
}

uint64_t sub_235CA2AD8()
{
  return MEMORY[0x24BE9A060]();
}

uint64_t sub_235CA2AE4()
{
  return MEMORY[0x24BE9A068]();
}

uint64_t sub_235CA2AF0()
{
  return MEMORY[0x24BE9A070]();
}

uint64_t sub_235CA2AFC()
{
  return MEMORY[0x24BE9A078]();
}

uint64_t sub_235CA2B08()
{
  return MEMORY[0x24BE9A080]();
}

uint64_t sub_235CA2B14()
{
  return MEMORY[0x24BE9A160]();
}

uint64_t sub_235CA2B20()
{
  return MEMORY[0x24BE9A168]();
}

uint64_t sub_235CA2B2C()
{
  return MEMORY[0x24BE9A170]();
}

uint64_t sub_235CA2B38()
{
  return MEMORY[0x24BE9A178]();
}

uint64_t sub_235CA2B44()
{
  return MEMORY[0x24BE9A180]();
}

uint64_t sub_235CA2B50()
{
  return MEMORY[0x24BE9A188]();
}

uint64_t sub_235CA2B5C()
{
  return MEMORY[0x24BE9A190]();
}

uint64_t sub_235CA2B68()
{
  return MEMORY[0x24BE9A198]();
}

uint64_t sub_235CA2B74()
{
  return MEMORY[0x24BE9A1A0]();
}

uint64_t sub_235CA2B80()
{
  return MEMORY[0x24BE9A3C0]();
}

uint64_t sub_235CA2B8C()
{
  return MEMORY[0x24BE9A3C8]();
}

uint64_t sub_235CA2B98()
{
  return MEMORY[0x24BE9A3D0]();
}

uint64_t sub_235CA2BA4()
{
  return MEMORY[0x24BE9A3D8]();
}

uint64_t sub_235CA2BB0()
{
  return MEMORY[0x24BE9A3E0]();
}

uint64_t sub_235CA2BBC()
{
  return MEMORY[0x24BE9A3E8]();
}

uint64_t sub_235CA2BC8()
{
  return MEMORY[0x24BE9A3F0]();
}

uint64_t sub_235CA2BD4()
{
  return MEMORY[0x24BE9A3F8]();
}

uint64_t sub_235CA2BE0()
{
  return MEMORY[0x24BE9A408]();
}

uint64_t sub_235CA2BEC()
{
  return MEMORY[0x24BE9A410]();
}

uint64_t sub_235CA2BF8()
{
  return MEMORY[0x24BE9A418]();
}

uint64_t sub_235CA2C04()
{
  return MEMORY[0x24BE9A420]();
}

uint64_t sub_235CA2C10()
{
  return MEMORY[0x24BE9A428]();
}

uint64_t sub_235CA2C1C()
{
  return MEMORY[0x24BE9A430]();
}

uint64_t sub_235CA2C28()
{
  return MEMORY[0x24BE9A438]();
}

uint64_t sub_235CA2C34()
{
  return MEMORY[0x24BE9A440]();
}

uint64_t sub_235CA2C40()
{
  return MEMORY[0x24BE9A448]();
}

uint64_t sub_235CA2C4C()
{
  return MEMORY[0x24BE9A460]();
}

uint64_t sub_235CA2C58()
{
  return MEMORY[0x24BE9A488]();
}

uint64_t sub_235CA2C64()
{
  return MEMORY[0x24BE9A4B0]();
}

uint64_t sub_235CA2C70()
{
  return MEMORY[0x24BE9A4B8]();
}

uint64_t sub_235CA2C7C()
{
  return MEMORY[0x24BE9A4C0]();
}

uint64_t sub_235CA2C88()
{
  return MEMORY[0x24BE9A4C8]();
}

uint64_t sub_235CA2C94()
{
  return MEMORY[0x24BE9A4D0]();
}

uint64_t sub_235CA2CA0()
{
  return MEMORY[0x24BE9A4D8]();
}

uint64_t sub_235CA2CAC()
{
  return MEMORY[0x24BE9A4E0]();
}

uint64_t sub_235CA2CB8()
{
  return MEMORY[0x24BE9A4E8]();
}

uint64_t sub_235CA2CC4()
{
  return MEMORY[0x24BE9A4F0]();
}

uint64_t sub_235CA2CD0()
{
  return MEMORY[0x24BE9A4F8]();
}

uint64_t sub_235CA2CDC()
{
  return MEMORY[0x24BE9A508]();
}

uint64_t sub_235CA2CE8()
{
  return MEMORY[0x24BE9A510]();
}

uint64_t sub_235CA2CF4()
{
  return MEMORY[0x24BE9A518]();
}

uint64_t sub_235CA2D00()
{
  return MEMORY[0x24BE9A520]();
}

uint64_t sub_235CA2D0C()
{
  return MEMORY[0x24BE9A528]();
}

uint64_t sub_235CA2D18()
{
  return MEMORY[0x24BE9A530]();
}

uint64_t sub_235CA2D24()
{
  return MEMORY[0x24BE9A538]();
}

uint64_t sub_235CA2D30()
{
  return MEMORY[0x24BE9A540]();
}

uint64_t sub_235CA2D3C()
{
  return MEMORY[0x24BE9A548]();
}

uint64_t sub_235CA2D48()
{
  return MEMORY[0x24BE9A550]();
}

uint64_t sub_235CA2D54()
{
  return MEMORY[0x24BE9A560]();
}

uint64_t sub_235CA2D60()
{
  return MEMORY[0x24BE9A568]();
}

uint64_t sub_235CA2D6C()
{
  return MEMORY[0x24BE9A570]();
}

uint64_t sub_235CA2D78()
{
  return MEMORY[0x24BE9A578]();
}

uint64_t sub_235CA2D84()
{
  return MEMORY[0x24BE9A580]();
}

uint64_t sub_235CA2D90()
{
  return MEMORY[0x24BE9A588]();
}

uint64_t sub_235CA2D9C()
{
  return MEMORY[0x24BE9A590]();
}

uint64_t sub_235CA2DA8()
{
  return MEMORY[0x24BE9A598]();
}

uint64_t sub_235CA2DB4()
{
  return MEMORY[0x24BE9A5A0]();
}

uint64_t sub_235CA2DC0()
{
  return MEMORY[0x24BE9A5B0]();
}

uint64_t sub_235CA2DCC()
{
  return MEMORY[0x24BE9A5B8]();
}

uint64_t sub_235CA2DD8()
{
  return MEMORY[0x24BE9A5C8]();
}

uint64_t sub_235CA2DE4()
{
  return MEMORY[0x24BE9A5D0]();
}

uint64_t sub_235CA2DF0()
{
  return MEMORY[0x24BE9A5D8]();
}

uint64_t sub_235CA2DFC()
{
  return MEMORY[0x24BE9A5E0]();
}

uint64_t sub_235CA2E08()
{
  return MEMORY[0x24BE9A5E8]();
}

uint64_t sub_235CA2E14()
{
  return MEMORY[0x24BE9A5F0]();
}

uint64_t sub_235CA2E20()
{
  return MEMORY[0x24BE9A608]();
}

uint64_t sub_235CA2E2C()
{
  return MEMORY[0x24BE9A610]();
}

uint64_t sub_235CA2E38()
{
  return MEMORY[0x24BE9A618]();
}

uint64_t sub_235CA2E44()
{
  return MEMORY[0x24BE9A620]();
}

uint64_t sub_235CA2E50()
{
  return MEMORY[0x24BE9A628]();
}

uint64_t sub_235CA2E5C()
{
  return MEMORY[0x24BE9A630]();
}

uint64_t sub_235CA2E68()
{
  return MEMORY[0x24BE9A638]();
}

uint64_t sub_235CA2E74()
{
  return MEMORY[0x24BE9A640]();
}

uint64_t sub_235CA2E80()
{
  return MEMORY[0x24BE9A648]();
}

uint64_t sub_235CA2E8C()
{
  return MEMORY[0x24BE9A668]();
}

uint64_t sub_235CA2E98()
{
  return MEMORY[0x24BE9A670]();
}

uint64_t sub_235CA2EA4()
{
  return MEMORY[0x24BE9A678]();
}

uint64_t sub_235CA2EB0()
{
  return MEMORY[0x24BE9A680]();
}

uint64_t sub_235CA2EBC()
{
  return MEMORY[0x24BE9A688]();
}

uint64_t sub_235CA2EC8()
{
  return MEMORY[0x24BE9A690]();
}

uint64_t sub_235CA2ED4()
{
  return MEMORY[0x24BE9A698]();
}

uint64_t sub_235CA2EE0()
{
  return MEMORY[0x24BE9A6A0]();
}

uint64_t sub_235CA2EEC()
{
  return MEMORY[0x24BE9A6A8]();
}

uint64_t sub_235CA2EF8()
{
  return MEMORY[0x24BE9A6E8]();
}

uint64_t sub_235CA2F04()
{
  return MEMORY[0x24BE9A6F0]();
}

uint64_t sub_235CA2F10()
{
  return MEMORY[0x24BE9A6F8]();
}

uint64_t sub_235CA2F1C()
{
  return MEMORY[0x24BE9A700]();
}

uint64_t sub_235CA2F28()
{
  return MEMORY[0x24BE9A708]();
}

uint64_t sub_235CA2F34()
{
  return MEMORY[0x24BE9A710]();
}

uint64_t sub_235CA2F40()
{
  return MEMORY[0x24BE9A718]();
}

uint64_t sub_235CA2F4C()
{
  return MEMORY[0x24BE9A720]();
}

uint64_t sub_235CA2F58()
{
  return MEMORY[0x24BE9A728]();
}

uint64_t sub_235CA2F64()
{
  return MEMORY[0x24BE9A730]();
}

uint64_t sub_235CA2F70()
{
  return MEMORY[0x24BE9A738]();
}

uint64_t sub_235CA2F7C()
{
  return MEMORY[0x24BE9A748]();
}

uint64_t sub_235CA2F88()
{
  return MEMORY[0x24BE9A7C8]();
}

uint64_t sub_235CA2F94()
{
  return MEMORY[0x24BE9A7D8]();
}

uint64_t sub_235CA2FA0()
{
  return MEMORY[0x24BE9A7E0]();
}

uint64_t sub_235CA2FAC()
{
  return MEMORY[0x24BE9A7E8]();
}

uint64_t sub_235CA2FB8()
{
  return MEMORY[0x24BE9A7F0]();
}

uint64_t sub_235CA2FC4()
{
  return MEMORY[0x24BE9A800]();
}

uint64_t sub_235CA2FD0()
{
  return MEMORY[0x24BE9A808]();
}

uint64_t sub_235CA2FDC()
{
  return MEMORY[0x24BE9A810]();
}

uint64_t sub_235CA2FE8()
{
  return MEMORY[0x24BE9A818]();
}

uint64_t sub_235CA2FF4()
{
  return MEMORY[0x24BE9A828]();
}

uint64_t sub_235CA3000()
{
  return MEMORY[0x24BE9A830]();
}

uint64_t sub_235CA300C()
{
  return MEMORY[0x24BE9A838]();
}

uint64_t sub_235CA3018()
{
  return MEMORY[0x24BE9A840]();
}

uint64_t sub_235CA3024()
{
  return MEMORY[0x24BE9A878]();
}

uint64_t sub_235CA3030()
{
  return MEMORY[0x24BE9A888]();
}

uint64_t sub_235CA303C()
{
  return MEMORY[0x24BE9A890]();
}

uint64_t sub_235CA3048()
{
  return MEMORY[0x24BE9A898]();
}

uint64_t sub_235CA3054()
{
  return MEMORY[0x24BE9A8A0]();
}

uint64_t sub_235CA3060()
{
  return MEMORY[0x24BE9A8A8]();
}

uint64_t sub_235CA306C()
{
  return MEMORY[0x24BE9A8B0]();
}

uint64_t sub_235CA3078()
{
  return MEMORY[0x24BE9A8B8]();
}

uint64_t sub_235CA3084()
{
  return MEMORY[0x24BE9A8C0]();
}

uint64_t sub_235CA3090()
{
  return MEMORY[0x24BE9A8C8]();
}

uint64_t sub_235CA309C()
{
  return MEMORY[0x24BE9A950]();
}

uint64_t sub_235CA30A8()
{
  return MEMORY[0x24BE9A988]();
}

uint64_t sub_235CA30B4()
{
  return MEMORY[0x24BE9A9B0]();
}

uint64_t sub_235CA30C0()
{
  return MEMORY[0x24BE9A9D8]();
}

uint64_t sub_235CA30CC()
{
  return MEMORY[0x24BE9AA58]();
}

uint64_t sub_235CA30D8()
{
  return MEMORY[0x24BE9AA60]();
}

uint64_t sub_235CA30E4()
{
  return MEMORY[0x24BE9AA70]();
}

uint64_t sub_235CA30F0()
{
  return MEMORY[0x24BE9AA78]();
}

uint64_t sub_235CA30FC()
{
  return MEMORY[0x24BE9AA88]();
}

uint64_t sub_235CA3108()
{
  return MEMORY[0x24BE9AA90]();
}

uint64_t sub_235CA3114()
{
  return MEMORY[0x24BE9AAA0]();
}

uint64_t sub_235CA3120()
{
  return MEMORY[0x24BE9AAA8]();
}

uint64_t sub_235CA312C()
{
  return MEMORY[0x24BE9AAB0]();
}

uint64_t sub_235CA3138()
{
  return MEMORY[0x24BE9AAD0]();
}

uint64_t sub_235CA3144()
{
  return MEMORY[0x24BE9AAD8]();
}

uint64_t sub_235CA3150()
{
  return MEMORY[0x24BE9AAE8]();
}

uint64_t sub_235CA315C()
{
  return MEMORY[0x24BE9AAF0]();
}

uint64_t sub_235CA3168()
{
  return MEMORY[0x24BE9AAF8]();
}

uint64_t sub_235CA3174()
{
  return MEMORY[0x24BE9AB00]();
}

uint64_t sub_235CA3180()
{
  return MEMORY[0x24BE9AB08]();
}

uint64_t sub_235CA318C()
{
  return MEMORY[0x24BE9AB10]();
}

uint64_t sub_235CA3198()
{
  return MEMORY[0x24BE9AB18]();
}

uint64_t sub_235CA31A4()
{
  return MEMORY[0x24BE9AB20]();
}

uint64_t sub_235CA31B0()
{
  return MEMORY[0x24BE9AB28]();
}

uint64_t sub_235CA31BC()
{
  return MEMORY[0x24BE9AB30]();
}

uint64_t sub_235CA31C8()
{
  return MEMORY[0x24BE9AB38]();
}

uint64_t sub_235CA31D4()
{
  return MEMORY[0x24BE9AB40]();
}

uint64_t sub_235CA31E0()
{
  return MEMORY[0x24BE9AB48]();
}

uint64_t sub_235CA31EC()
{
  return MEMORY[0x24BE9AB90]();
}

uint64_t sub_235CA31F8()
{
  return MEMORY[0x24BE9AB98]();
}

uint64_t sub_235CA3204()
{
  return MEMORY[0x24BE9ABC0]();
}

uint64_t sub_235CA3210()
{
  return MEMORY[0x24BE9ABD0]();
}

uint64_t sub_235CA321C()
{
  return MEMORY[0x24BE9AC00]();
}

uint64_t sub_235CA3228()
{
  return MEMORY[0x24BE9AC08]();
}

uint64_t sub_235CA3234()
{
  return MEMORY[0x24BE9AC28]();
}

uint64_t sub_235CA3240()
{
  return MEMORY[0x24BE9AC30]();
}

uint64_t sub_235CA324C()
{
  return MEMORY[0x24BE9AC38]();
}

uint64_t sub_235CA3258()
{
  return MEMORY[0x24BE9AC40]();
}

uint64_t sub_235CA3264()
{
  return MEMORY[0x24BE9AC48]();
}

uint64_t sub_235CA3270()
{
  return MEMORY[0x24BE9AC50]();
}

uint64_t sub_235CA327C()
{
  return MEMORY[0x24BE9AC58]();
}

uint64_t sub_235CA3288()
{
  return MEMORY[0x24BE9AC60]();
}

uint64_t sub_235CA3294()
{
  return MEMORY[0x24BE9AC68]();
}

uint64_t sub_235CA32A0()
{
  return MEMORY[0x24BE9AC70]();
}

uint64_t sub_235CA32AC()
{
  return MEMORY[0x24BE9AC78]();
}

uint64_t sub_235CA32B8()
{
  return MEMORY[0x24BE9AC80]();
}

uint64_t sub_235CA32C4()
{
  return MEMORY[0x24BE9AC88]();
}

uint64_t sub_235CA32D0()
{
  return MEMORY[0x24BE9AC98]();
}

uint64_t sub_235CA32DC()
{
  return MEMORY[0x24BE9ACB0]();
}

uint64_t sub_235CA32E8()
{
  return MEMORY[0x24BE9ACB8]();
}

uint64_t sub_235CA32F4()
{
  return MEMORY[0x24BE9ACC0]();
}

uint64_t sub_235CA3300()
{
  return MEMORY[0x24BE9ACC8]();
}

uint64_t sub_235CA330C()
{
  return MEMORY[0x24BE9ACD0]();
}

uint64_t sub_235CA3318()
{
  return MEMORY[0x24BE9ACD8]();
}

uint64_t sub_235CA3324()
{
  return MEMORY[0x24BE9ACE0]();
}

uint64_t sub_235CA3330()
{
  return MEMORY[0x24BE9ACE8]();
}

uint64_t sub_235CA333C()
{
  return MEMORY[0x24BE9ACF0]();
}

uint64_t sub_235CA3348()
{
  return MEMORY[0x24BE9ACF8]();
}

uint64_t sub_235CA3354()
{
  return MEMORY[0x24BE9AD00]();
}

uint64_t sub_235CA3360()
{
  return MEMORY[0x24BE9AD08]();
}

uint64_t sub_235CA336C()
{
  return MEMORY[0x24BE9AD10]();
}

uint64_t sub_235CA3378()
{
  return MEMORY[0x24BE9AD18]();
}

uint64_t sub_235CA3384()
{
  return MEMORY[0x24BE9AD30]();
}

uint64_t sub_235CA3390()
{
  return MEMORY[0x24BE9AD38]();
}

uint64_t sub_235CA339C()
{
  return MEMORY[0x24BE9AD40]();
}

uint64_t sub_235CA33A8()
{
  return MEMORY[0x24BE9AD48]();
}

uint64_t sub_235CA33B4()
{
  return MEMORY[0x24BE9AD58]();
}

uint64_t sub_235CA33C0()
{
  return MEMORY[0x24BE9AD60]();
}

uint64_t sub_235CA33CC()
{
  return MEMORY[0x24BE9AD98]();
}

uint64_t sub_235CA33D8()
{
  return MEMORY[0x24BE9ADB0]();
}

uint64_t sub_235CA33E4()
{
  return MEMORY[0x24BE9ADD0]();
}

uint64_t sub_235CA33F0()
{
  return MEMORY[0x24BE9ADE0]();
}

uint64_t sub_235CA33FC()
{
  return MEMORY[0x24BE9AE88]();
}

uint64_t sub_235CA3408()
{
  return MEMORY[0x24BE9AEA0]();
}

uint64_t sub_235CA3414()
{
  return MEMORY[0x24BE9AF10]();
}

uint64_t sub_235CA3420()
{
  return MEMORY[0x24BE9AF20]();
}

uint64_t sub_235CA342C()
{
  return MEMORY[0x24BE9B100]();
}

uint64_t sub_235CA3438()
{
  return MEMORY[0x24BE9B360]();
}

uint64_t sub_235CA3444()
{
  return MEMORY[0x24BE9B398]();
}

uint64_t sub_235CA3450()
{
  return MEMORY[0x24BE9B400]();
}

uint64_t sub_235CA345C()
{
  return MEMORY[0x24BE9B408]();
}

uint64_t sub_235CA3468()
{
  return MEMORY[0x24BE9B418]();
}

uint64_t sub_235CA3474()
{
  return MEMORY[0x24BE9B438]();
}

uint64_t sub_235CA3480()
{
  return MEMORY[0x24BE9B468]();
}

uint64_t sub_235CA348C()
{
  return MEMORY[0x24BE9B470]();
}

uint64_t sub_235CA3498()
{
  return MEMORY[0x24BE9B488]();
}

uint64_t sub_235CA34A4()
{
  return MEMORY[0x24BE9B4C0]();
}

uint64_t sub_235CA34B0()
{
  return MEMORY[0x24BE5BA20]();
}

uint64_t sub_235CA34BC()
{
  return MEMORY[0x24BE5BA38]();
}

uint64_t sub_235CA34C8()
{
  return MEMORY[0x24BEA5FB8]();
}

uint64_t sub_235CA34D4()
{
  return MEMORY[0x24BEA5FC8]();
}

uint64_t sub_235CA34E0()
{
  return MEMORY[0x24BEA5FD0]();
}

uint64_t sub_235CA34EC()
{
  return MEMORY[0x24BEA5FD8]();
}

uint64_t sub_235CA34F8()
{
  return MEMORY[0x24BEA5FF0]();
}

uint64_t sub_235CA3504()
{
  return MEMORY[0x24BEA5FF8]();
}

uint64_t sub_235CA3510()
{
  return MEMORY[0x24BEA6008]();
}

uint64_t sub_235CA351C()
{
  return MEMORY[0x24BEA6010]();
}

uint64_t sub_235CA3528()
{
  return MEMORY[0x24BEA6018]();
}

uint64_t sub_235CA3534()
{
  return MEMORY[0x24BEA6020]();
}

uint64_t sub_235CA3540()
{
  return MEMORY[0x24BEA6030]();
}

uint64_t sub_235CA354C()
{
  return MEMORY[0x24BEA6038]();
}

uint64_t sub_235CA3558()
{
  return MEMORY[0x24BEA6040]();
}

uint64_t sub_235CA3564()
{
  return MEMORY[0x24BEA6048]();
}

uint64_t sub_235CA3570()
{
  return MEMORY[0x24BEA6058]();
}

uint64_t sub_235CA357C()
{
  return MEMORY[0x24BEA6060]();
}

uint64_t sub_235CA3588()
{
  return MEMORY[0x24BEA6070]();
}

uint64_t sub_235CA3594()
{
  return MEMORY[0x24BEA6078]();
}

uint64_t sub_235CA35A0()
{
  return MEMORY[0x24BEA6090]();
}

uint64_t sub_235CA35AC()
{
  return MEMORY[0x24BEA60C0]();
}

uint64_t sub_235CA35B8()
{
  return MEMORY[0x24BEA60C8]();
}

uint64_t sub_235CA35C4()
{
  return MEMORY[0x24BEA60D0]();
}

uint64_t sub_235CA35D0()
{
  return MEMORY[0x24BEA60D8]();
}

uint64_t sub_235CA35DC()
{
  return MEMORY[0x24BEA60E0]();
}

uint64_t sub_235CA35E8()
{
  return MEMORY[0x24BEA60E8]();
}

uint64_t sub_235CA35F4()
{
  return MEMORY[0x24BEA60F8]();
}

uint64_t sub_235CA3600()
{
  return MEMORY[0x24BEA6100]();
}

uint64_t sub_235CA360C()
{
  return MEMORY[0x24BEA6178]();
}

uint64_t sub_235CA3618()
{
  return MEMORY[0x24BEA6180]();
}

uint64_t sub_235CA3624()
{
  return MEMORY[0x24BEA6188]();
}

uint64_t sub_235CA3630()
{
  return MEMORY[0x24BEA6190]();
}

uint64_t sub_235CA363C()
{
  return MEMORY[0x24BEA6198]();
}

uint64_t sub_235CA3648()
{
  return MEMORY[0x24BEA61A0]();
}

uint64_t sub_235CA3654()
{
  return MEMORY[0x24BEA61A8]();
}

uint64_t sub_235CA3660()
{
  return MEMORY[0x24BEA61C8]();
}

uint64_t sub_235CA366C()
{
  return MEMORY[0x24BEA61D0]();
}

uint64_t sub_235CA3678()
{
  return MEMORY[0x24BEA61D8]();
}

uint64_t sub_235CA3684()
{
  return MEMORY[0x24BEA61E0]();
}

uint64_t sub_235CA3690()
{
  return MEMORY[0x24BEA61E8]();
}

uint64_t sub_235CA369C()
{
  return MEMORY[0x24BEA61F0]();
}

uint64_t sub_235CA36A8()
{
  return MEMORY[0x24BEA6228]();
}

uint64_t sub_235CA36B4()
{
  return MEMORY[0x24BEA6230]();
}

uint64_t sub_235CA36C0()
{
  return MEMORY[0x24BEE76F8]();
}

uint64_t sub_235CA36CC()
{
  return MEMORY[0x24BEE7700]();
}

uint64_t sub_235CA36D8()
{
  return MEMORY[0x24BEE7718]();
}

uint64_t sub_235CA36E4()
{
  return MEMORY[0x24BEE7748]();
}

uint64_t sub_235CA36F0()
{
  return MEMORY[0x24BEE7758]();
}

uint64_t sub_235CA36FC()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_235CA3708()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_235CA3714()
{
  return MEMORY[0x24BEE78E8]();
}

uint64_t sub_235CA3720()
{
  return MEMORY[0x24BEE5428]();
}

uint64_t sub_235CA372C()
{
  return MEMORY[0x24BEE5438]();
}

uint64_t sub_235CA3738()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_235CA3744()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_235CA3750()
{
  return MEMORY[0x24BEE54D0]();
}

uint64_t sub_235CA375C()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_235CA3768()
{
  return MEMORY[0x24BEE5570]();
}

uint64_t sub_235CA3774()
{
  return MEMORY[0x24BEE5590]();
}

uint64_t sub_235CA3780()
{
  return MEMORY[0x24BEE5620]();
}

uint64_t sub_235CA378C()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_235CA3798()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_235CA37A4()
{
  return MEMORY[0x24BEE0270]();
}

uint64_t sub_235CA37B0()
{
  return MEMORY[0x24BEE02C0]();
}

uint64_t sub_235CA37BC()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_235CA37C8()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_235CA37D4()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_235CA37E0()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_235CA37EC()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_235CA37F8()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_235CA3804()
{
  return MEMORY[0x24BEE0A20]();
}

uint64_t sub_235CA3810()
{
  return MEMORY[0x24BEE0AD8]();
}

uint64_t sub_235CA381C()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_235CA3828()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_235CA3834()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_235CA3840()
{
  return MEMORY[0x24BEE0C18]();
}

uint64_t sub_235CA384C()
{
  return MEMORY[0x24BEE0C30]();
}

uint64_t sub_235CA3858()
{
  return MEMORY[0x24BEE0C38]();
}

uint64_t sub_235CA3864()
{
  return MEMORY[0x24BEE0C40]();
}

uint64_t sub_235CA3870()
{
  return MEMORY[0x24BEE0CA0]();
}

uint64_t sub_235CA387C()
{
  return MEMORY[0x24BEE0DD0]();
}

uint64_t sub_235CA3888()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_235CA3894()
{
  return MEMORY[0x24BEE0FD8]();
}

uint64_t sub_235CA38A0()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_235CA38AC()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_235CA38B8()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_235CA38C4()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_235CA38D0()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_235CA38DC()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_235CA38E8()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_235CA38F4()
{
  return MEMORY[0x24BDCFC08]();
}

uint64_t sub_235CA3900()
{
  return MEMORY[0x24BDCFC40]();
}

uint64_t sub_235CA390C()
{
  return MEMORY[0x24BDCFCC0]();
}

uint64_t sub_235CA3918()
{
  return MEMORY[0x24BDCFD28]();
}

uint64_t sub_235CA3924()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_235CA3930()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_235CA393C()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_235CA3948()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_235CA3954()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_235CA3960()
{
  return MEMORY[0x24BEE5780]();
}

uint64_t sub_235CA396C()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_235CA3978()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_235CA3984()
{
  return MEMORY[0x24BEA6240]();
}

uint64_t sub_235CA3990()
{
  return MEMORY[0x24BEA6248]();
}

uint64_t sub_235CA399C()
{
  return MEMORY[0x24BEE7940]();
}

uint64_t sub_235CA39A8()
{
  return MEMORY[0x24BEE7948]();
}

uint64_t sub_235CA39B4()
{
  return MEMORY[0x24BEE7958]();
}

uint64_t sub_235CA39C0()
{
  return MEMORY[0x24BEE5918]();
}

uint64_t sub_235CA39CC()
{
  return MEMORY[0x24BEE5928]();
}

uint64_t sub_235CA39D8()
{
  return MEMORY[0x24BDD01F8]();
}

uint64_t sub_235CA39E4()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_235CA39F0()
{
  return MEMORY[0x24BEE79A0]();
}

uint64_t sub_235CA39FC()
{
  return MEMORY[0x24BEE1C58]();
}

uint64_t sub_235CA3A08()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_235CA3A14()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_235CA3A20()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_235CA3A2C()
{
  return MEMORY[0x24BEE2090]();
}

uint64_t sub_235CA3A38()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_235CA3A44()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_235CA3A50()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_235CA3A5C()
{
  return MEMORY[0x24BEE23A8]();
}

uint64_t sub_235CA3A68()
{
  return MEMORY[0x24BEE23E8]();
}

uint64_t sub_235CA3A74()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_235CA3A80()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_235CA3A8C()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_235CA3A98()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_235CA3AA4()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_235CA3AB0()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_235CA3ABC()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_235CA3AC8()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_235CA3AD4()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_235CA3AE0()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_235CA3AEC()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_235CA3AF8()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_235CA3B04()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_235CA3B10()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_235CA3B1C()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_235CA3B28()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_235CA3B34()
{
  return MEMORY[0x24BEE3308]();
}

uint64_t sub_235CA3B40()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_235CA3B4C()
{
  return MEMORY[0x24BEE3458]();
}

uint64_t sub_235CA3B58()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_235CA3B64()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_235CA3B70()
{
  return MEMORY[0x24BEE3A20]();
}

uint64_t sub_235CA3B7C()
{
  return MEMORY[0x24BEE3A28]();
}

uint64_t sub_235CA3B88()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_235CA3B94()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_235CA3BA0()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_235CA3BAC()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_235CA3BB8()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_235CA3BC4()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_235CA3BD0()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_235CA3BDC()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_235CA3BE8()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_235CA3BF4()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_235CA3C00()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_235CA3C0C()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_235CA3C18()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t AFDeviceSupportsHybridUOD()
{
  return MEMORY[0x24BE08C90]();
}

uint64_t AFDeviceSupportsMedoc()
{
  return MEMORY[0x24BE08C98]();
}

uint64_t AFDeviceSupportsPatientSiri()
{
  return MEMORY[0x24BE08CA0]();
}

uint64_t AFDeviceSupportsSAE()
{
  return MEMORY[0x24BE08CA8]();
}

uint64_t AFDeviceSupportsSiriMUX()
{
  return MEMORY[0x24BE08CB8]();
}

uint64_t AFIsATV()
{
  return MEMORY[0x24BE08D78]();
}

uint64_t AFIsHorseman()
{
  return MEMORY[0x24BE08D98]();
}

uint64_t AFIsSearchDictationRequest()
{
  return MEMORY[0x24BE08DC8]();
}

uint64_t _AFPreferencesReplacementLanguageForLocalRecognizerLanguageCode()
{
  return MEMORY[0x24BE09438]();
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

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
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

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
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

uint64_t swift_initStaticObject()
{
  return MEMORY[0x24BEE4E50]();
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

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4F60]();
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

