uint64_t PauseConversationAction.isPaused.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC20LiveCommunicationKit23PauseConversationAction_isPaused);
}

uint64_t PauseConversationAction.__allocating_init(conversationUUID:isPaused:)(uint64_t a1, char a2)
{
  uint64_t v4;

  v4 = swift_allocObject();
  PauseConversationAction.init(conversationUUID:isPaused:)(a1, a2);
  return v4;
}

uint64_t PauseConversationAction.init(conversationUUID:isPaused:)(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  void *v14;
  id v15;
  _QWORD *v16;
  uint64_t v18;
  uint64_t v19;

  v3 = v2;
  v19 = sub_233AEB8B8();
  v6 = *(_QWORD *)(v19 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_233AEB8E8();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8]();
  v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = objc_allocWithZone(MEMORY[0x24BDB7918]);
  swift_retain();
  v14 = (void *)sub_233AEB8C4();
  v15 = objc_msgSend(v13, sel_initWithCallUUID_onHold_, v14, a2 & 1);

  *(_BYTE *)(v3 + OBJC_IVAR____TtC20LiveCommunicationKit23PauseConversationAction_isPaused) = a2;
  swift_release();
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, a1, v9);
  sub_233AEB8A0();
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(a1, v9);
  *(_QWORD *)(v3 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_cxAction) = v15;
  (*(void (**)(uint64_t, char *, uint64_t))(v10 + 32))(v3 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_conversationUUID, v12, v9);
  v16 = (_QWORD *)(v3 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_state);
  *v16 = 0;
  v16[1] = 0;
  (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))(v3 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_timeoutDate, v8, v19);
  return v3;
}

uint64_t sub_233AD3CF0(void *a1)
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
  uint64_t v11;
  char *v12;
  unsigned __int8 v13;
  id v14;
  _QWORD *v15;
  uint64_t v17;

  v3 = sub_233AEB8B8();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3, v5);
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_233AEB8E8();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8, v10);
  v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  v13 = objc_msgSend(a1, sel_isOnHold);
  *(_BYTE *)(v1 + OBJC_IVAR____TtC20LiveCommunicationKit23PauseConversationAction_isPaused) = v13;
  swift_release();
  v14 = objc_msgSend(a1, sel_callUUID);
  sub_233AEB8DC();

  sub_233AEB8A0();
  *(_QWORD *)(v1 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_cxAction) = a1;
  (*(void (**)(uint64_t, char *, uint64_t))(v9 + 32))(v1 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_conversationUUID, v12, v8);
  v15 = (_QWORD *)(v1 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_state);
  *v15 = 0;
  v15[1] = 0;
  (*(void (**)(uint64_t, char *, uint64_t))(v4 + 32))(v1 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_timeoutDate, v7, v3);
  return v1;
}

void sub_233AD3E68()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t PauseConversationAction.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_conversationUUID;
  v2 = sub_233AEB8E8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  sub_233AD3F34(*(_QWORD *)(v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_state), *(_QWORD *)(v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_state + 8));
  v3 = v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_timeoutDate;
  v4 = sub_233AEB8B8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

  return v0;
}

uint64_t sub_233AD3F34(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >= 3)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t PauseConversationAction.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_conversationUUID;
  v2 = sub_233AEB8E8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  sub_233AD3F34(*(_QWORD *)(v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_state), *(_QWORD *)(v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_state + 8));
  v3 = v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_timeoutDate;
  v4 = sub_233AEB8B8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

  return swift_deallocClassInstance();
}

uint64_t sub_233AD3FF4()
{
  return type metadata accessor for PauseConversationAction();
}

uint64_t type metadata accessor for PauseConversationAction()
{
  uint64_t result;

  result = qword_25610D380;
  if (!qword_25610D380)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_233AD4038()
{
  return swift_updateClassMetadata2();
}

uint64_t method lookup function for PauseConversationAction()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PauseConversationAction.__allocating_init(conversationUUID:isPaused:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t sub_233AD408C()
{
  sub_233AEBCF0();
  sub_233AEBCFC();
  return sub_233AEBD14();
}

uint64_t sub_233AD40D0()
{
  return sub_233AEBCFC();
}

uint64_t sub_233AD40F8()
{
  sub_233AEBCF0();
  sub_233AEBCFC();
  return sub_233AEBD14();
}

BOOL sub_233AD4138(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

void type metadata accessor for HandleType(uint64_t a1)
{
  sub_233AD4174(a1, &qword_25610D438);
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
  sub_233AD4174(a1, &qword_25610D440);
}

void sub_233AD4174(uint64_t a1, unint64_t *a2)
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

_QWORD *sub_233AD41B8@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_233AD41C8(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

unint64_t sub_233AD41D8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25610D448;
  if (!qword_25610D448)
  {
    type metadata accessor for HandleType(255);
    result = MEMORY[0x23493BDC0](&unk_233AEC36C, v1);
    atomic_store(result, (unint64_t *)&qword_25610D448);
  }
  return result;
}

id sub_233AD4278()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CallObserverDelegateWrapper();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for CallObserverDelegateWrapper()
{
  return objc_opt_self();
}

uint64_t sub_233AD4358()
{
  uint64_t v0;

  v0 = sub_233AEB954();
  __swift_allocate_value_buffer(v0, qword_25610E4F0);
  __swift_project_value_buffer(v0, (uint64_t)qword_25610E4F0);
  return sub_233AEB948();
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

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

void sub_233AD4420(uint64_t *a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  id v14;
  uint64_t v15;
  unint64_t v16;
  char v17;
  uint64_t v18;
  void (*v19)(char *, uint64_t);
  id v20;
  char v21;
  void (*v22)(char *, uint64_t);
  id v23;
  id v24;
  char isUniquelyReferenced_nonNull_native;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  os_unfair_lock_s *v29;
  uint64_t v30;
  _QWORD v31[2];
  uint64_t v32;

  v31[0] = a3;
  v5 = sub_233AEB8E8();
  v6 = *(_QWORD *)(v5 - 8);
  v8 = MEMORY[0x24BDAC7A8](v5, v7);
  v10 = (char *)v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8, v11);
  v13 = (char *)v31 - v12;
  v14 = objc_msgSend(a2, sel_UUID);
  sub_233AEB8DC();

  v15 = *a1;
  if (!*(_QWORD *)(*a1 + 16) || (v16 = sub_233ADDA7C((uint64_t)v13), (v17 & 1) == 0))
  {
    v22 = *(void (**)(char *, uint64_t))(v6 + 8);
    v22(v13, v5);
    type metadata accessor for Conversation(0);
    swift_allocObject();
    v23 = a2;
    v18 = sub_233AD6570(v23);

    v24 = objc_msgSend(v23, sel_UUID);
    sub_233AEB8DC();

    swift_retain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v32 = *a1;
    *a1 = 0x8000000000000000;
    sub_233ADDFC0(v18, (uint64_t)v10, isUniquelyReferenced_nonNull_native);
    *a1 = v32;
    swift_bridgeObjectRelease();
    v22(v10, v5);
LABEL_13:
    *(_QWORD *)v31[0] = v18;
    return;
  }
  v18 = *(_QWORD *)(*(_QWORD *)(v15 + 56) + 8 * v16);
  v19 = *(void (**)(char *, uint64_t))(v6 + 8);
  swift_retain();
  v19(v13, v5);
  v20 = a2;
  if ((objc_msgSend(v20, sel_hasEnded) & 1) != 0)
  {

    v21 = 5;
  }
  else if ((objc_msgSend(v20, sel_isOnHold) & 1) != 0)
  {

    v21 = 3;
  }
  else
  {
    v26 = objc_msgSend(v20, sel_hasConnected);

    if (v26)
      v21 = 2;
    else
      v21 = 0;
  }
  v27 = *(_QWORD *)(v18 + 16);
  v28 = v27 + *(_QWORD *)(*MEMORY[0x24BEE27A8] + *(_QWORD *)v27 + 16);
  v29 = (os_unfair_lock_s *)(v27 + ((*(unsigned int *)(*(_QWORD *)v27 + 48) + 3) & 0x1FFFFFFFCLL));
  os_unfair_lock_lock(v29);
  v30 = v31[1];
  sub_233AD5940(v28, v21);
  if (!v30)
  {
    os_unfair_lock_unlock(v29);
    goto LABEL_13;
  }
  os_unfair_lock_unlock(v29);
  __break(1u);
}

uint64_t sub_233AD46B8()
{
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ConversationCache()
{
  return objc_opt_self();
}

uint64_t ConversationManager.Configuration.ringtoneName.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ConversationManager.Configuration.ringtoneName.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*ConversationManager.Configuration.ringtoneName.modify())()
{
  return nullsub_1;
}

uint64_t ConversationManager.Configuration.iconTemplateImageData.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  sub_233AD479C(v1, *(_QWORD *)(v0 + 24));
  return v1;
}

uint64_t sub_233AD479C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_233AD47B0(a1, a2);
  return a1;
}

uint64_t sub_233AD47B0(uint64_t a1, unint64_t a2)
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

uint64_t ConversationManager.Configuration.iconTemplateImageData.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = sub_233AD4828(*(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24));
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return result;
}

uint64_t sub_233AD4828(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_233AD483C(a1, a2);
  return a1;
}

uint64_t sub_233AD483C(uint64_t a1, unint64_t a2)
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

uint64_t (*ConversationManager.Configuration.iconTemplateImageData.modify())()
{
  return nullsub_1;
}

uint64_t ConversationManager.Configuration.maximumConversationGroups.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 32);
}

uint64_t ConversationManager.Configuration.maximumConversationGroups.setter(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 32) = result;
  return result;
}

uint64_t (*ConversationManager.Configuration.maximumConversationGroups.modify())()
{
  return nullsub_1;
}

uint64_t ConversationManager.Configuration.maximumConversationsPerConversationGroup.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 40);
}

uint64_t ConversationManager.Configuration.maximumConversationsPerConversationGroup.setter(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 40) = result;
  return result;
}

uint64_t (*ConversationManager.Configuration.maximumConversationsPerConversationGroup.modify())()
{
  return nullsub_1;
}

uint64_t ConversationManager.Configuration.includesConversationInRecents.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 48);
}

uint64_t ConversationManager.Configuration.includesConversationInRecents.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 48) = result;
  return result;
}

uint64_t (*ConversationManager.Configuration.includesConversationInRecents.modify())()
{
  return nullsub_1;
}

uint64_t ConversationManager.Configuration.supportsVideo.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 49);
}

uint64_t ConversationManager.Configuration.supportsVideo.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 49) = result;
  return result;
}

uint64_t (*ConversationManager.Configuration.supportsVideo.modify())()
{
  return nullsub_1;
}

uint64_t ConversationManager.Configuration.supportedHandleTypes.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t ConversationManager.Configuration.supportedHandleTypes.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 56) = a1;
  return result;
}

uint64_t (*ConversationManager.Configuration.supportedHandleTypes.modify())()
{
  return nullsub_1;
}

id sub_233AD4950()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;

  v1 = *(_QWORD *)(v0 + 8);
  v2 = *(_QWORD *)(v0 + 24);
  v4 = *(_QWORD *)(v0 + 32);
  v3 = *(_QWORD *)(v0 + 40);
  v5 = *(unsigned __int8 *)(v0 + 48);
  v6 = *(unsigned __int8 *)(v0 + 49);
  v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDB7908]), sel_init);
  if (v1)
    v8 = (void *)sub_233AEB99C();
  else
    v8 = 0;
  objc_msgSend(v7, sel_setRingtoneSound_, v8);

  if (v2 >> 60 == 15)
    v9 = 0;
  else
    v9 = (void *)sub_233AEB888();
  objc_msgSend(v7, sel_setIconTemplateImageData_, v9);

  objc_msgSend(v7, sel_setMaximumCallGroups_, v4);
  objc_msgSend(v7, sel_setMaximumCallsPerCallGroup_, v3);
  objc_msgSend(v7, sel_setIncludesCallsInRecents_, v5);
  objc_msgSend(v7, sel_setSupportsVideo_, v6);
  v10 = swift_bridgeObjectRetain();
  v11 = sub_233AD4AD8(v10);
  swift_bridgeObjectRelease();
  sub_233AE62F4(v11);
  swift_bridgeObjectRelease();
  sub_233AEBAB0();
  objc_msgSend(v7, sel_setSupportsDynamicSystemUI_, 1);
  return v7;
}

uint64_t sub_233AD4AD8(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  char v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x24BEE4AF8];
  if (!v1)
    return v2;
  v15 = MEMORY[0x24BEE4AF8];
  sub_233AD865C(0, v1, 0);
  v2 = v15;
  result = sub_233AE576C(a1);
  v5 = result;
  v7 = v6;
  v9 = v8 & 1;
  while ((v5 & 0x8000000000000000) == 0 && v5 < 1 << *(_BYTE *)(a1 + 32))
  {
    if (((*(_QWORD *)(a1 + 56 + (((unint64_t)v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) == 0)
      goto LABEL_13;
    if (*(_DWORD *)(a1 + 36) != (_DWORD)v7)
      goto LABEL_14;
    v10 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 48) + v5);
    v12 = *(_QWORD *)(v15 + 16);
    v11 = *(_QWORD *)(v15 + 24);
    if (v12 >= v11 >> 1)
      sub_233AD865C(v11 > 1, v12 + 1, 1);
    *(_QWORD *)(v15 + 16) = v12 + 1;
    *(_QWORD *)(v15 + 8 * v12 + 32) = v10 + 1;
    result = sub_233AE5810(v5, v7, v9 & 1, a1);
    v5 = result;
    v7 = v13;
    v9 = v14 & 1;
    if (!--v1)
    {
      sub_233AD5004(result, v13, v14 & 1);
      return v2;
    }
  }
  __break(1u);
LABEL_13:
  __break(1u);
LABEL_14:
  __break(1u);
  return result;
}

uint64_t ConversationManager.Configuration.init(ringtoneName:iconTemplateImageData:maximumConversationGroups:maximumConversationsPerConversationGroup:includesConversationInRecents:supportsVideo:supportedHandleTypes:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, char a7@<W6>, char a8@<W7>, uint64_t a9@<X8>, uint64_t a10)
{
  *(_QWORD *)a9 = result;
  *(_QWORD *)(a9 + 8) = a2;
  *(_QWORD *)(a9 + 16) = a3;
  *(_QWORD *)(a9 + 24) = a4;
  *(_QWORD *)(a9 + 32) = a5;
  *(_QWORD *)(a9 + 40) = a6;
  *(_BYTE *)(a9 + 48) = a7;
  *(_BYTE *)(a9 + 49) = a8;
  *(_QWORD *)(a9 + 56) = a10;
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for Handle(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t _s13ConfigurationVwxx(uint64_t a1)
{
  unint64_t v2;

  swift_bridgeObjectRelease();
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >> 60 != 15)
    sub_233AD483C(*(_QWORD *)(a1 + 16), v2);
  return swift_bridgeObjectRelease();
}

uint64_t _s13ConfigurationVwcp(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  _OWORD *v5;
  unint64_t v6;
  uint64_t v7;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  v5 = (_OWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  if (v6 >> 60 == 15)
  {
    *(_OWORD *)(a1 + 16) = *v5;
  }
  else
  {
    v7 = *(_QWORD *)v5;
    sub_233AD47B0(v7, v6);
    *(_QWORD *)(a1 + 16) = v7;
    *(_QWORD *)(a1 + 24) = v6;
  }
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_WORD *)(a1 + 48) = *(_WORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t _s13ConfigurationVwca(uint64_t a1, uint64_t a2)
{
  uint64_t *v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = (uint64_t *)(a2 + 16);
  v5 = *(_QWORD *)(a2 + 24);
  if (*(_QWORD *)(a1 + 24) >> 60 != 15)
  {
    if (v5 >> 60 != 15)
    {
      v7 = *v4;
      sub_233AD47B0(*v4, *(_QWORD *)(a2 + 24));
      v8 = *(_QWORD *)(a1 + 16);
      v9 = *(_QWORD *)(a1 + 24);
      *(_QWORD *)(a1 + 16) = v7;
      *(_QWORD *)(a1 + 24) = v5;
      sub_233AD483C(v8, v9);
      goto LABEL_8;
    }
    sub_233AD4E64(a1 + 16);
    goto LABEL_6;
  }
  if (v5 >> 60 == 15)
  {
LABEL_6:
    *(_OWORD *)(a1 + 16) = *(_OWORD *)v4;
    goto LABEL_8;
  }
  v6 = *v4;
  sub_233AD47B0(*v4, *(_QWORD *)(a2 + 24));
  *(_QWORD *)(a1 + 16) = v6;
  *(_QWORD *)(a1 + 24) = v5;
LABEL_8:
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_BYTE *)(a1 + 49) = *(_BYTE *)(a2 + 49);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_233AD4E64(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x24BDCDDE8] - 8) + 8))();
  return a1;
}

__n128 __swift_memcpy64_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t _s13ConfigurationVwta(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  _QWORD *v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  v5 = (_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a1 + 24);
  if (v6 >> 60 != 15)
  {
    v7 = *(_QWORD *)(a2 + 24);
    if (v7 >> 60 != 15)
    {
      v8 = *(_QWORD *)(a1 + 16);
      *(_QWORD *)(a1 + 16) = *v5;
      *(_QWORD *)(a1 + 24) = v7;
      sub_233AD483C(v8, v6);
      goto LABEL_6;
    }
    sub_233AD4E64(a1 + 16);
  }
  *(_OWORD *)(a1 + 16) = *(_OWORD *)v5;
LABEL_6:
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_BYTE *)(a1 + 49) = *(_BYTE *)(a2 + 49);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s13ConfigurationVwet(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 64))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 56);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t _s13ConfigurationVwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 64) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 56) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 64) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ConversationManager.Configuration()
{
  return &type metadata for ConversationManager.Configuration;
}

uint64_t sub_233AD5004(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if ((a3 & 1) != 0)
    return swift_bridgeObjectRelease();
  return result;
}

void Conversation.uuid.getter(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  os_unfair_lock_s *v5;
  uint64_t v6;

  v3 = *(_QWORD *)(v1 + 16);
  v4 = v3 + *(_QWORD *)(*MEMORY[0x24BEE27A8] + *(_QWORD *)v3 + 16);
  v5 = (os_unfair_lock_s *)(v3 + ((*(unsigned int *)(*(_QWORD *)v3 + 48) + 3) & 0x1FFFFFFFCLL));
  os_unfair_lock_lock(v5);
  v6 = sub_233AEB8E8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, v4, v6);
  os_unfair_lock_unlock(v5);
}

void sub_233AD5090(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  os_unfair_lock_s *v5;

  v3 = *(_QWORD *)(*(_QWORD *)a1 + 16);
  v4 = v3 + *(_QWORD *)(*MEMORY[0x24BEE27A8] + *(_QWORD *)v3 + 16);
  v5 = (os_unfair_lock_s *)(v3 + ((*(unsigned int *)(*(_QWORD *)v3 + 48) + 3) & 0x1FFFFFFFCLL));
  os_unfair_lock_lock(v5);
  sub_233AD5294(v4, a2);
  os_unfair_lock_unlock(v5);
}

uint64_t sub_233AD5110(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  os_unfair_lock_s *v10;
  _BYTE v12[16];
  _BYTE *v13;

  v4 = sub_233AEB8E8();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = &v12[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  v8 = *(_QWORD *)(*(_QWORD *)a2 + 16);
  v13 = v7;
  v9 = v8 + *(_QWORD *)(*MEMORY[0x24BEE27A8] + *(_QWORD *)v8 + 16);
  v10 = (os_unfair_lock_s *)(v8 + ((*(unsigned int *)(*(_QWORD *)v8 + 48) + 3) & 0x1FFFFFFFCLL));
  os_unfair_lock_lock(v10);
  sub_233AD6534(v9);
  os_unfair_lock_unlock(v10);
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t Conversation.uuid.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  os_unfair_lock_s *v5;
  uint64_t v6;
  uint64_t v7;

  v3 = *(_QWORD *)(v1 + 16);
  v4 = v3 + *(_QWORD *)(*MEMORY[0x24BEE27A8] + *(_QWORD *)v3 + 16);
  v5 = (os_unfair_lock_s *)(v3 + ((*(unsigned int *)(*(_QWORD *)v3 + 48) + 3) & 0x1FFFFFFFCLL));
  os_unfair_lock_lock(v5);
  v6 = sub_233AEB8E8();
  v7 = *(_QWORD *)(v6 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 24))(v4, a1, v6);
  os_unfair_lock_unlock(v5);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
}

uint64_t sub_233AD5294@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;

  v4 = sub_233AEB8E8();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
}

void (*Conversation.uuid.modify(_QWORD *a1))(uint64_t **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  os_unfair_lock_s *v13;

  v3 = malloc(0x38uLL);
  *a1 = v3;
  v4 = sub_233AEB8E8();
  *v3 = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[1] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[2] = malloc(v6);
  v7 = malloc(v6);
  v8 = *(uint64_t **)(v1 + 16);
  v3[3] = v7;
  v3[4] = v8;
  v9 = *v8;
  v10 = *(_QWORD *)(*MEMORY[0x24BEE27A8] + *v8 + 16);
  v3[5] = v10;
  v11 = (char *)v8 + v10;
  v12 = *(unsigned int *)(v9 + 48);
  *((_DWORD *)v3 + 12) = v12;
  v13 = (os_unfair_lock_s *)((char *)v8 + ((v12 + 3) & 0x1FFFFFFFCLL));
  os_unfair_lock_lock(v13);
  (*(void (**)(void *, char *, uint64_t))(v5 + 16))(v7, v11, v4);
  os_unfair_lock_unlock(v13);
  return sub_233AD53C0;
}

void sub_233AD53C0(uint64_t **a1, char a2)
{
  uint64_t *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  os_unfair_lock_s *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(void *, uint64_t);
  uint64_t v13;

  v2 = *a1;
  v3 = (*a1)[4];
  v4 = (void *)(*a1)[2];
  v5 = (void *)(*a1)[3];
  v6 = **a1;
  v7 = (*a1)[1];
  v8 = (*((unsigned int *)*a1 + 12) + 3) & 0x1FFFFFFFCLL;
  v9 = (os_unfair_lock_s *)(v3 + v8);
  v10 = v3 + (*a1)[5];
  if ((a2 & 1) != 0)
  {
    (*(void (**)(uint64_t, void *, uint64_t))(v7 + 16))((*a1)[2], v5, v6);
    os_unfair_lock_lock(v9);
    v11 = sub_233AEB8E8();
    (*(void (**)(uint64_t, void *, uint64_t))(*(_QWORD *)(v11 - 8) + 24))(v10, v4, v11);
    os_unfair_lock_unlock(v9);
    v12 = *(void (**)(void *, uint64_t))(v7 + 8);
    v12(v4, v6);
  }
  else
  {
    os_unfair_lock_lock((os_unfair_lock_t)(v3 + v8));
    v13 = sub_233AEB8E8();
    (*(void (**)(uint64_t, void *, uint64_t))(*(_QWORD *)(v13 - 8) + 24))(v10, v5, v13);
    os_unfair_lock_unlock(v9);
    v12 = *(void (**)(void *, uint64_t))(v7 + 8);
  }
  v12(v5, v6);
  free(v5);
  free(v4);
  free(v2);
}

void Conversation.state.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  os_unfair_lock_s *v5;

  v3 = *(_QWORD *)(v1 + 16);
  v4 = v3 + *(_QWORD *)(*MEMORY[0x24BEE27A8] + *(_QWORD *)v3 + 16);
  v5 = (os_unfair_lock_s *)(v3 + ((*(unsigned int *)(*(_QWORD *)v3 + 48) + 3) & 0x1FFFFFFFCLL));
  os_unfair_lock_lock(v5);
  *a1 = *(_BYTE *)(v4 + *(int *)(type metadata accessor for InternalConversationState(0) + 20));
  os_unfair_lock_unlock(v5);
}

void sub_233AD5548(uint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  os_unfair_lock_s *v5;
  char v6;

  v3 = *(_QWORD *)(*(_QWORD *)a1 + 16);
  v4 = v3 + *(_QWORD *)(*MEMORY[0x24BEE27A8] + *(_QWORD *)v3 + 16);
  v5 = (os_unfair_lock_s *)(v3 + ((*(unsigned int *)(*(_QWORD *)v3 + 48) + 3) & 0x1FFFFFFFCLL));
  os_unfair_lock_lock(v5);
  sub_233AD5650(v4, &v6);
  os_unfair_lock_unlock(v5);
  *a2 = v6;
}

void sub_233AD55D4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  os_unfair_lock_s *v4;

  v2 = *(_QWORD *)(*(_QWORD *)a2 + 16);
  v3 = v2 + *(_QWORD *)(*MEMORY[0x24BEE27A8] + *(_QWORD *)v2 + 16);
  v4 = (os_unfair_lock_s *)(v2 + ((*(unsigned int *)(*(_QWORD *)v2 + 48) + 3) & 0x1FFFFFFFCLL));
  os_unfair_lock_lock(v4);
  sub_233AD6504(v3);
  os_unfair_lock_unlock(v4);
}

uint64_t sub_233AD5650@<X0>(uint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = type metadata accessor for InternalConversationState(0);
  *a2 = *(_BYTE *)(a1 + *(int *)(result + 20));
  return result;
}

void Conversation.localMember.getter(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  os_unfair_lock_s *v5;

  v3 = *(_QWORD *)(v1 + 16);
  v4 = v3 + *(_QWORD *)(*MEMORY[0x24BEE27A8] + *(_QWORD *)v3 + 16);
  v5 = (os_unfair_lock_s *)(v3 + ((*(unsigned int *)(*(_QWORD *)v3 + 48) + 3) & 0x1FFFFFFFCLL));
  os_unfair_lock_lock(v5);
  sub_233AD5854(v4, a1);
  os_unfair_lock_unlock(v5);
}

double sub_233AD5710@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  os_unfair_lock_s *v5;
  uint64_t v6;
  double result;
  __int128 v8;
  _OWORD v9[2];
  uint64_t v10;

  v3 = *(_QWORD *)(*(_QWORD *)a1 + 16);
  v4 = v3 + *(_QWORD *)(*MEMORY[0x24BEE27A8] + *(_QWORD *)v3 + 16);
  v5 = (os_unfair_lock_s *)(v3 + ((*(unsigned int *)(*(_QWORD *)v3 + 48) + 3) & 0x1FFFFFFFCLL));
  os_unfair_lock_lock(v5);
  sub_233AD5854(v4, (uint64_t *)v9);
  os_unfair_lock_unlock(v5);
  v6 = v10;
  result = *(double *)v9;
  v8 = v9[1];
  *(_OWORD *)a2 = v9[0];
  *(_OWORD *)(a2 + 16) = v8;
  *(_QWORD *)(a2 + 32) = v6;
  return result;
}

_QWORD *sub_233AD57A4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  os_unfair_lock_s *v5;
  _QWORD v7[5];

  sub_233AD6410(a1, (uint64_t)v7);
  v3 = *(_QWORD *)(*(_QWORD *)a2 + 16);
  v4 = v3 + *(_QWORD *)(*MEMORY[0x24BEE27A8] + *(_QWORD *)v3 + 16);
  v5 = (os_unfair_lock_s *)(v3 + ((*(unsigned int *)(*(_QWORD *)v3 + 48) + 3) & 0x1FFFFFFFCLL));
  sub_233AD64A0(v7, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_233AD6470);
  os_unfair_lock_lock(v5);
  sub_233AD6458(v4);
  os_unfair_lock_unlock(v5);
  return sub_233AD64A0(v7, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_233AD64D4);
}

uint64_t sub_233AD5854@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = (uint64_t *)(a1 + *(int *)(type metadata accessor for InternalConversationState(0) + 24));
  v4 = *v3;
  v5 = v3[1];
  v6 = v3[2];
  v7 = v3[3];
  v8 = v3[4];
  *a2 = *v3;
  a2[1] = v5;
  a2[2] = v6;
  a2[3] = v7;
  a2[4] = v8;
  return sub_233AD6470(v4, v5, v6);
}

uint64_t sub_233AD58B0(uint64_t a1, _QWORD *a2)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = (uint64_t *)(a1 + *(int *)(type metadata accessor for InternalConversationState(0) + 24));
  v4 = *v3;
  v5 = v3[1];
  v6 = v3[2];
  sub_233AD64A0(a2, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_233AD6470);
  sub_233AD64D4(v4, v5, v6);
  return sub_233AD6410((uint64_t)a2, (uint64_t)v3);
}

uint64_t sub_233AD5940(uint64_t a1, char a2)
{
  uint64_t result;

  result = type metadata accessor for InternalConversationState(0);
  *(_BYTE *)(a1 + *(int *)(result + 20)) = a2;
  return result;
}

uint64_t Conversation.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_release();
  v1 = v0 + OBJC_IVAR____TtC20LiveCommunicationKit12Conversation___observationRegistrar;
  v2 = sub_233AEB930();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t Conversation.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_release();
  v1 = v0 + OBJC_IVAR____TtC20LiveCommunicationKit12Conversation___observationRegistrar;
  v2 = sub_233AEB930();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t Conversation.debugDescription.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  os_unfair_lock_s *v7;
  uint64_t v8;
  char v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;

  v1 = sub_233AEB8E8();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8]();
  v4 = (char *)&v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = 0;
  v19 = 0xE000000000000000;
  sub_233AEBB58();
  v23 = v18;
  v24 = v19;
  sub_233AEB9D8();
  v5 = *(_QWORD *)(v0 + 16);
  v6 = v5 + *(_QWORD *)(*MEMORY[0x24BEE27A8] + *(_QWORD *)v5 + 16);
  v7 = (os_unfair_lock_s *)(v5 + ((*(unsigned int *)(*(_QWORD *)v5 + 48) + 3) & 0x1FFFFFFFCLL));
  os_unfair_lock_lock(v7);
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v6, v1);
  os_unfair_lock_unlock(v7);
  sub_233AD5C70();
  sub_233AEBCC0();
  sub_233AEB9D8();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  sub_233AEB9D8();
  os_unfair_lock_lock(v7);
  v8 = type metadata accessor for InternalConversationState(0);
  v9 = *(_BYTE *)(v6 + *(int *)(v8 + 20));
  os_unfair_lock_unlock(v7);
  LOBYTE(v18) = v9;
  sub_233AEBBF4();
  sub_233AEB9D8();
  os_unfair_lock_lock(v7);
  v10 = (uint64_t *)(v6 + *(int *)(v8 + 24));
  v11 = *v10;
  v12 = v10[1];
  v13 = v10[2];
  v14 = v10[3];
  v15 = v10[4];
  sub_233AD6470(*v10, v12, v13);
  os_unfair_lock_unlock(v7);
  v18 = v11;
  v19 = v12;
  v20 = v13;
  v21 = v14;
  v22 = v15;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25610D5F0);
  sub_233AEB9B4();
  sub_233AEB9D8();
  swift_bridgeObjectRelease();
  sub_233AEB9D8();
  return v23;
}

unint64_t sub_233AD5C70()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25610D5E8;
  if (!qword_25610D5E8)
  {
    v1 = sub_233AEB8E8();
    result = MEMORY[0x23493BDC0](MEMORY[0x24BDCEAB8], v1);
    atomic_store(result, (unint64_t *)&qword_25610D5E8);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23493BDA8]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_233AD5CF8()
{
  return Conversation.debugDescription.getter();
}

uint64_t sub_233AD5D30()
{
  return type metadata accessor for Conversation(0);
}

uint64_t type metadata accessor for Conversation(uint64_t a1)
{
  return sub_233AD6360(a1, qword_25610D620);
}

uint64_t sub_233AD5D4C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_233AEB930();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for Conversation()
{
  return swift_lookUpClassMethod();
}

_QWORD *sub_233AD5DD4(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v13 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_233AEB8E8();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 24);
    *((_BYTE *)a1 + *(int *)(a3 + 20)) = *((_BYTE *)a2 + *(int *)(a3 + 20));
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = *((_QWORD *)v10 + 2);
    if (v11)
    {
      *v9 = *v10;
      *((_QWORD *)v9 + 1) = *((_QWORD *)v10 + 1);
      *((_QWORD *)v9 + 2) = v11;
      v12 = *((_QWORD *)v10 + 4);
      *((_QWORD *)v9 + 3) = *((_QWORD *)v10 + 3);
      *((_QWORD *)v9 + 4) = v12;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      v14 = *((_OWORD *)v10 + 1);
      *(_OWORD *)v9 = *(_OWORD *)v10;
      *((_OWORD *)v9 + 1) = v14;
      *((_QWORD *)v9 + 4) = *((_QWORD *)v10 + 4);
    }
  }
  return a1;
}

uint64_t sub_233AD5EA4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t result;

  v4 = sub_233AEB8E8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  result = *(_QWORD *)(a1 + *(int *)(a2 + 24) + 16);
  if (result)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_233AD5F04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;

  v6 = sub_233AEB8E8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 24);
  *(_BYTE *)(a1 + *(int *)(a3 + 20)) = *(_BYTE *)(a2 + *(int *)(a3 + 20));
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = *(_QWORD *)(v9 + 16);
  if (v10)
  {
    *(_BYTE *)v8 = *(_BYTE *)v9;
    *(_QWORD *)(v8 + 8) = *(_QWORD *)(v9 + 8);
    *(_QWORD *)(v8 + 16) = v10;
    v11 = *(_QWORD *)(v9 + 32);
    *(_QWORD *)(v8 + 24) = *(_QWORD *)(v9 + 24);
    *(_QWORD *)(v8 + 32) = v11;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    v12 = *(_OWORD *)(v9 + 16);
    *(_OWORD *)v8 = *(_OWORD *)v9;
    *(_OWORD *)(v8 + 16) = v12;
    *(_QWORD *)(v8 + 32) = *(_QWORD *)(v9 + 32);
  }
  return a1;
}

uint64_t sub_233AD5FA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;

  v6 = sub_233AEB8E8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  *(_BYTE *)(a1 + *(int *)(a3 + 20)) = *(_BYTE *)(a2 + *(int *)(a3 + 20));
  v7 = *(int *)(a3 + 24);
  v8 = a1 + v7;
  v9 = (__int128 *)(a2 + v7);
  v10 = *(_QWORD *)(a1 + v7 + 16);
  v11 = *((_QWORD *)v9 + 2);
  if (v10)
  {
    if (v11)
    {
      *(_BYTE *)v8 = *(_BYTE *)v9;
      *(_QWORD *)(v8 + 8) = *((_QWORD *)v9 + 1);
      *(_QWORD *)(v8 + 16) = *((_QWORD *)v9 + 2);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(_QWORD *)(v8 + 24) = *((_QWORD *)v9 + 3);
      *(_QWORD *)(v8 + 32) = *((_QWORD *)v9 + 4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_233AD60D0(v8);
      v12 = *((_QWORD *)v9 + 4);
      v13 = v9[1];
      *(_OWORD *)v8 = *v9;
      *(_OWORD *)(v8 + 16) = v13;
      *(_QWORD *)(v8 + 32) = v12;
    }
  }
  else if (v11)
  {
    *(_BYTE *)v8 = *(_BYTE *)v9;
    *(_QWORD *)(v8 + 8) = *((_QWORD *)v9 + 1);
    *(_QWORD *)(v8 + 16) = *((_QWORD *)v9 + 2);
    *(_QWORD *)(v8 + 24) = *((_QWORD *)v9 + 3);
    *(_QWORD *)(v8 + 32) = *((_QWORD *)v9 + 4);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    v14 = *v9;
    v15 = v9[1];
    *(_QWORD *)(v8 + 32) = *((_QWORD *)v9 + 4);
    *(_OWORD *)v8 = v14;
    *(_OWORD *)(v8 + 16) = v15;
  }
  return a1;
}

uint64_t sub_233AD60D0(uint64_t a1)
{
  destroy for Handle();
  return a1;
}

uint64_t sub_233AD6104(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;

  v6 = sub_233AEB8E8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 24);
  *(_BYTE *)(a1 + *(int *)(a3 + 20)) = *(_BYTE *)(a2 + *(int *)(a3 + 20));
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = *(_OWORD *)(v9 + 16);
  *(_OWORD *)v8 = *(_OWORD *)v9;
  *(_OWORD *)(v8 + 16) = v10;
  *(_QWORD *)(v8 + 32) = *(_QWORD *)(v9 + 32);
  return a1;
}

uint64_t sub_233AD6178(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;

  v6 = sub_233AEB8E8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 24);
  *(_BYTE *)(a1 + *(int *)(a3 + 20)) = *(_BYTE *)(a2 + *(int *)(a3 + 20));
  v8 = a1 + v7;
  v9 = a2 + v7;
  if (!*(_QWORD *)(a1 + v7 + 16))
    goto LABEL_5;
  v10 = *(_QWORD *)(v9 + 16);
  if (!v10)
  {
    sub_233AD60D0(a1 + v7);
LABEL_5:
    v12 = *(_OWORD *)(v9 + 16);
    *(_OWORD *)v8 = *(_OWORD *)v9;
    *(_OWORD *)(v8 + 16) = v12;
    *(_QWORD *)(v8 + 32) = *(_QWORD *)(v9 + 32);
    return a1;
  }
  *(_BYTE *)v8 = *(_BYTE *)v9;
  *(_QWORD *)(v8 + 8) = *(_QWORD *)(v9 + 8);
  *(_QWORD *)(v8 + 16) = v10;
  swift_bridgeObjectRelease();
  v11 = *(_QWORD *)(v9 + 32);
  *(_QWORD *)(v8 + 24) = *(_QWORD *)(v9 + 24);
  *(_QWORD *)(v8 + 32) = v11;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_233AD622C()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_233AD6238(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;
  int v10;

  v6 = sub_233AEB8E8();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 24) + 16);
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  v10 = v9 - 1;
  if (v10 < 0)
    v10 = -1;
  return (v10 + 1);
}

uint64_t sub_233AD62C4()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_233AD62D0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_233AEB8E8();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 24) + 16) = a2;
  return result;
}

uint64_t type metadata accessor for InternalConversationState(uint64_t a1)
{
  return sub_233AD6360(a1, qword_25610D708);
}

uint64_t sub_233AD6360(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_233AD6394()
{
  uint64_t result;
  unint64_t v1;

  result = sub_233AEB8E8();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_233AD6410(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25610D5F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_233AD6458(uint64_t a1)
{
  uint64_t v1;

  return sub_233AD58B0(a1, *(_QWORD **)(v1 + 16));
}

uint64_t sub_233AD6470(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  if (a3)
  {
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

_QWORD *sub_233AD64A0(_QWORD *a1, void (*a2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  a2(*a1, a1[1], a1[2], a1[3], a1[4]);
  return a1;
}

uint64_t sub_233AD64D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  if (a3)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_233AD6504(uint64_t a1)
{
  uint64_t v1;
  char v3;
  uint64_t result;

  v3 = *(_BYTE *)(v1 + 16);
  result = type metadata accessor for InternalConversationState(0);
  *(_BYTE *)(a1 + *(int *)(result + 20)) = v3;
  return result;
}

uint64_t sub_233AD6534(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(v1 + 16);
  v4 = sub_233AEB8E8();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a1, v3, v4);
}

uint64_t sub_233AD6570(void *a1)
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
  char *v11;
  id v12;
  id v13;
  char v14;
  unsigned int v15;
  char *v16;
  uint64_t v17;
  uint64_t v19;

  v3 = sub_233AEB8E8();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3, v5);
  v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for InternalConversationState(0);
  MEMORY[0x24BDAC7A8](v8, v9);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_233AEB924();
  v12 = objc_msgSend(a1, sel_UUID);
  sub_233AEB8DC();

  v13 = a1;
  if (objc_msgSend(v13, sel_hasEnded))
  {

    v14 = 5;
  }
  else if ((objc_msgSend(v13, sel_isOnHold) & 1) != 0)
  {

    v14 = 3;
  }
  else
  {
    v15 = objc_msgSend(v13, sel_hasConnected);

    if (v15)
      v14 = 2;
    else
      v14 = 0;
  }
  (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v11, v7, v3);
  v11[*(int *)(v8 + 20)] = v14;
  v16 = &v11[*(int *)(v8 + 24)];
  *((_QWORD *)v16 + 4) = 0;
  *(_OWORD *)v16 = 0u;
  *((_OWORD *)v16 + 1) = 0u;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25610D748);
  v17 = swift_allocObject();
  *(_DWORD *)(v17 + ((*(unsigned int *)(*(_QWORD *)v17 + 48) + 3) & 0x1FFFFFFFCLL)) = 0;
  sub_233AD675C((uint64_t)v11, v17 + *(_QWORD *)(*MEMORY[0x24BEE27A8] + *(_QWORD *)v17 + 16));
  sub_233AD67A0((uint64_t)v11);
  *(_QWORD *)(v1 + 16) = v17;
  return v1;
}

uint64_t sub_233AD675C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for InternalConversationState(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_233AD67A0(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for InternalConversationState(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t ConversationAction.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_conversationUUID;
  v2 = sub_233AEB8E8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  sub_233AD3F34(*(_QWORD *)(v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_state), *(_QWORD *)(v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_state + 8));
  v3 = v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_timeoutDate;
  v4 = sub_233AEB8B8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

  return v0;
}

void ConversationAction.uuid.getter()
{
  uint64_t v0;
  id v1;

  v1 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v0
                                                             + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_cxAction), sel_UUID));
  sub_233AEB8DC();

}

uint64_t ConversationAction.conversationUUID.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_233AD694C(&OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_conversationUUID, (uint64_t (*)(_QWORD))MEMORY[0x24BDCEA58], a1);
}

uint64_t ConversationAction.state.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t *v3;
  uint64_t v4;
  unint64_t v5;

  v3 = (uint64_t *)(v1 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_state);
  swift_beginAccess();
  v4 = *v3;
  v5 = v3[1];
  *a1 = *v3;
  a1[1] = v5;
  return sub_233AD6924(v4, v5);
}

uint64_t sub_233AD6924(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >= 3)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t ConversationAction.timeoutDate.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_233AD694C(&OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_timeoutDate, (uint64_t (*)(_QWORD))MEMORY[0x24BDCE900], a1);
}

uint64_t sub_233AD694C@<X0>(_QWORD *a1@<X0>, uint64_t (*a2)(_QWORD)@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;

  v6 = v3 + *a1;
  swift_beginAccess();
  v7 = a2(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a3, v6, v7);
}

uint64_t ConversationAction.__allocating_init(conversationUUID:timeoutDate:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
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

  v5 = sub_233AEB8B8();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_233AEB8E8();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8]();
  v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDB7870]), sel_init);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, a1, v9);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a2, v5);
  v14 = (*(uint64_t (**)(char *, char *, id))(v2 + 112))(v12, v8, v13);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a2, v5);
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(a1, v9);
  return v14;
}

uint64_t sub_233AD6AEC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;

  v6 = swift_allocObject();
  *(_QWORD *)(v6 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_cxAction) = a3;
  v7 = v6 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_conversationUUID;
  v8 = sub_233AEB8E8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(v7, a1, v8);
  v9 = (_QWORD *)(v6 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_state);
  *v9 = 0;
  v9[1] = 0;
  v10 = v6 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_timeoutDate;
  v11 = sub_233AEB8B8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v10, a2, v11);
  return v6;
}

Swift::Void __swiftcall ConversationAction.fulfill()()
{
  sub_233AD6BCC("Fulfilling action %s", (SEL *)&selRef_fulfill);
}

Swift::Void __swiftcall ConversationAction.fail()()
{
  sub_233AD6BCC("Failing action %s", (SEL *)&selRef_fail);
}

id sub_233AD6BCC(const char *a1, SEL *a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v14;
  uint64_t v15;

  v5 = v2;
  if (qword_25610D350 != -1)
    swift_once();
  v6 = sub_233AEB954();
  __swift_project_value_buffer(v6, (uint64_t)qword_25610E4F0);
  swift_retain_n();
  v7 = sub_233AEB93C();
  v8 = sub_233AEBAA4();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    v10 = swift_slowAlloc();
    v15 = v10;
    *(_DWORD *)v9 = 136315138;
    type metadata accessor for ConversationAction();
    swift_retain();
    v11 = sub_233AEB9C0();
    v14 = sub_233AD6E3C(v11, v12, &v15);
    sub_233AEBAD4();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_233AD2000, v7, v8, a1, v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23493BE50](v10, -1, -1);
    MEMORY[0x23493BE50](v9, -1, -1);

  }
  else
  {

    swift_release_n();
  }
  return objc_msgSend(*(id *)(v5 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_cxAction), *a2, v14, v15);
}

uint64_t ConversationAction.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_conversationUUID;
  v2 = sub_233AEB8E8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  sub_233AD3F34(*(_QWORD *)(v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_state), *(_QWORD *)(v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_state + 8));
  v3 = v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_timeoutDate;
  v4 = sub_233AEB8B8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

  return swift_deallocClassInstance();
}

uint64_t sub_233AD6E3C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_233AD6F0C(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_233AD7588((uint64_t)v12, *a3);
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
      sub_233AD7588((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_233AD6F0C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_233AEBAE0();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_233AD70C4(a5, a6);
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
  v8 = sub_233AEBBAC();
  if (!v8)
  {
    sub_233AEBC00();
    __break(1u);
LABEL_17:
    result = sub_233AEBC3C();
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

uint64_t sub_233AD70C4(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_233AD7158(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_233AD7330(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_233AD7330(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_233AD7158(uint64_t a1, unint64_t a2)
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
      v3 = sub_233AD72CC(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_233AEBB64();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_233AEBC00();
      __break(1u);
LABEL_10:
      v2 = sub_233AEB9E4();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_233AEBC3C();
    __break(1u);
LABEL_14:
    result = sub_233AEBC00();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_233AD72CC(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25610D818);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_233AD7330(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25610D818);
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
  result = sub_233AEBC3C();
  __break(1u);
  return result;
}

uint64_t type metadata accessor for ConversationAction()
{
  uint64_t result;

  result = qword_25610D778;
  if (!qword_25610D778)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_233AD74B8()
{
  return type metadata accessor for ConversationAction();
}

uint64_t sub_233AD74C0()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_233AEB8E8();
  if (v1 <= 0x3F)
  {
    result = sub_233AEB8B8();
    if (v2 <= 0x3F)
    {
      result = swift_updateClassMetadata2();
      if (!result)
        return 0;
    }
  }
  return result;
}

uint64_t method lookup function for ConversationAction()
{
  return swift_lookUpClassMethod();
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

uint64_t sub_233AD7588(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t Conversation.State.init(rawValue:)@<X0>(unint64_t result@<X0>, char *a2@<X8>)
{
  char v2;

  v2 = 6;
  if (result < 6)
    v2 = result;
  *a2 = v2;
  return result;
}

uint64_t Conversation.State.rawValue.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

BOOL sub_233AD75E4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

unint64_t sub_233AD75F8@<X0>(unint64_t *a1@<X0>, char *a2@<X8>)
{
  return Conversation.State.init(rawValue:)(*a1, a2);
}

void sub_233AD7600(_QWORD *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = *v1;
}

uint64_t sub_233AD760C()
{
  sub_233AD7924();
  return sub_233AEB9FC();
}

uint64_t sub_233AD7668()
{
  sub_233AD7924();
  return sub_233AEB9F0();
}

unint64_t sub_233AD76B8()
{
  unint64_t result;

  result = qword_25610D820;
  if (!qword_25610D820)
  {
    result = MEMORY[0x23493BDC0](&protocol conformance descriptor for Conversation.State, &type metadata for Conversation.State);
    atomic_store(result, (unint64_t *)&qword_25610D820);
  }
  return result;
}

uint64_t sub_233AD76FC()
{
  sub_233AEBCF0();
  sub_233AEBCFC();
  return sub_233AEBD14();
}

uint64_t sub_233AD7740()
{
  return sub_233AEBCFC();
}

uint64_t sub_233AD7768()
{
  sub_233AEBCF0();
  sub_233AEBCFC();
  return sub_233AEBD14();
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t _s5StateOwet(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s5StateOwst(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_233AD7894 + 4 * byte_233AEC5E5[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_233AD78C8 + 4 * byte_233AEC5E0[v4]))();
}

uint64_t sub_233AD78C8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_233AD78D0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x233AD78D8);
  return result;
}

uint64_t sub_233AD78E4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x233AD78ECLL);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_233AD78F0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_233AD78F8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_233AD7904(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_233AD790C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for Conversation.State()
{
  return &type metadata for Conversation.State;
}

unint64_t sub_233AD7924()
{
  unint64_t result;

  result = qword_25610D828;
  if (!qword_25610D828)
  {
    result = MEMORY[0x23493BDC0](&protocol conformance descriptor for Conversation.State, &type metadata for Conversation.State);
    atomic_store(result, (unint64_t *)&qword_25610D828);
  }
  return result;
}

uint64_t sub_233AD7968(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;

  v2 = *(_QWORD *)(a1 + 16);
  result = MEMORY[0x24BEE4AF8];
  if (v2)
  {
    v10 = MEMORY[0x24BEE4AF8];
    sub_233AEBBD0();
    v4 = a1 + 64;
    do
    {
      v5 = *(unsigned __int8 *)(v4 - 32) + 1;
      v6 = objc_allocWithZone(MEMORY[0x24BDB78E8]);
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      v7 = (void *)sub_233AEB99C();
      swift_bridgeObjectRelease();
      v8 = objc_msgSend(v6, sel_initWithType_value_, v5, v7);

      v9 = (void *)sub_233AEB99C();
      objc_msgSend(v8, sel_setSiriDisplayName_, v9);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      sub_233AEBBB8();
      sub_233AEBBDC();
      sub_233AEBBE8();
      sub_233AEBBC4();
      v4 += 40;
      --v2;
    }
    while (v2);
    return v10;
  }
  return result;
}

uint64_t StartConversationAction.handles.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t StartConversationAction.isVideo.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC20LiveCommunicationKit23StartConversationAction_isVideo);
}

uint64_t StartConversationAction.__allocating_init(conversationUUID:handles:isVideo:)(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v6;

  v6 = swift_allocObject();
  StartConversationAction.init(conversationUUID:handles:isVideo:)(a1, a2, a3);
  return v6;
}

uint64_t StartConversationAction.init(conversationUUID:handles:isVideo:)(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD *v20;
  _BYTE v22[12];
  int v23;
  uint64_t v24;
  uint64_t v25;

  v4 = v3;
  v5 = a3;
  v23 = a3;
  v8 = sub_233AEB8B8();
  v24 = *(_QWORD *)(v8 - 8);
  v25 = v8;
  MEMORY[0x24BDAC7A8]();
  v10 = &v22[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v11 = sub_233AEB8E8();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8]();
  v14 = &v22[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  *(_QWORD *)(v4 + OBJC_IVAR____TtC20LiveCommunicationKit23StartConversationAction_handles) = a2;
  *(_BYTE *)(v4 + OBJC_IVAR____TtC20LiveCommunicationKit23StartConversationAction_isVideo) = v5;
  v15 = swift_bridgeObjectRetain();
  sub_233AD7968(v15);
  swift_bridgeObjectRelease();
  v16 = objc_allocWithZone(MEMORY[0x24BDB7928]);
  v17 = (void *)sub_233AEB8C4();
  sub_233AD7D3C();
  v18 = (void *)sub_233AEBA14();
  swift_bridgeObjectRelease();
  v19 = objc_msgSend(v16, sel_initWithCallUUID_handles_, v17, v18);

  objc_msgSend(v19, sel_setVideo_, v23 & 1);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v12 + 16))(v14, a1, v11);
  sub_233AEB8A0();
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(a1, v11);
  *(_QWORD *)(v4 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_cxAction) = v19;
  (*(void (**)(uint64_t, _BYTE *, uint64_t))(v12 + 32))(v4 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_conversationUUID, v14, v11);
  v20 = (_QWORD *)(v4 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_state);
  *v20 = 0;
  v20[1] = 0;
  (*(void (**)(uint64_t, _BYTE *, uint64_t))(v24 + 32))(v4 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_timeoutDate, v10, v25);
  return v4;
}

unint64_t sub_233AD7D3C()
{
  unint64_t result;

  result = qword_25610D830;
  if (!qword_25610D830)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_25610D830);
  }
  return result;
}

uint64_t sub_233AD7D78(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  unint64_t v13;
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
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  unsigned __int8 v33;
  id v34;
  _QWORD *v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;

  v2 = v1;
  v4 = sub_233AEB8B8();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_233AEB8E8();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8]();
  v11 = (char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  v12 = objc_msgSend(a1, sel_handles);
  sub_233AD7D3C();
  v13 = sub_233AEBA20();

  if (!(v13 >> 62))
  {
    v14 = *(_QWORD *)((v13 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v14)
      goto LABEL_3;
LABEL_16:
    swift_bridgeObjectRelease();
    v17 = MEMORY[0x24BEE4AF8];
LABEL_17:
    *(_QWORD *)(v2 + OBJC_IVAR____TtC20LiveCommunicationKit23StartConversationAction_handles) = v17;
    v33 = objc_msgSend(a1, sel_isVideo);
    *(_BYTE *)(v2 + OBJC_IVAR____TtC20LiveCommunicationKit23StartConversationAction_isVideo) = v33;
    swift_release();
    v34 = objc_msgSend(a1, sel_callUUID);
    sub_233AEB8DC();

    sub_233AEB8A0();
    *(_QWORD *)(v2 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_cxAction) = a1;
    (*(void (**)(uint64_t, char *, uint64_t))(v9 + 32))(v2 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_conversationUUID, v11, v8);
    v35 = (_QWORD *)(v2 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_state);
    *v35 = 0;
    v35[1] = 0;
    (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))(v2 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_timeoutDate, v7, v4);
    return v2;
  }
  swift_bridgeObjectRetain();
  v14 = sub_233AEBC0C();
  swift_bridgeObjectRelease();
  if (!v14)
    goto LABEL_16;
LABEL_3:
  v46 = v14;
  v47 = MEMORY[0x24BEE4AF8];
  result = sub_233AD8678(0, v14 & ~(v14 >> 63), 0);
  if ((v46 & 0x8000000000000000) == 0)
  {
    v36 = v11;
    v37 = v9;
    v38 = v8;
    v39 = a1;
    v40 = v7;
    v41 = v5;
    v42 = v4;
    v43 = v2;
    v16 = 0;
    v44 = v13 & 0xC000000000000001;
    v45 = v13;
    v17 = v47;
    do
    {
      if (v44)
        v18 = (id)MEMORY[0x23493B8D4](v16, v45);
      else
        v18 = *(id *)(v45 + 8 * v16 + 32);
      v19 = v18;
      v20 = objc_msgSend(v18, sel_value, v36, v37, v38, v39, v40, v41, v42, v43);
      v21 = sub_233AEB9A8();
      v23 = v22;

      v24 = objc_msgSend(v19, sel_type);
      if (v24 == (id)3)
        v25 = 2;
      else
        v25 = v24 == (id)2;
      v26 = objc_msgSend(v19, sel_value);
      v27 = sub_233AEB9A8();
      v29 = v28;

      v47 = v17;
      v31 = *(_QWORD *)(v17 + 16);
      v30 = *(_QWORD *)(v17 + 24);
      if (v31 >= v30 >> 1)
      {
        sub_233AD8678(v30 > 1, v31 + 1, 1);
        v17 = v47;
      }
      *(_QWORD *)(v17 + 16) = v31 + 1;
      v32 = v17 + 40 * v31;
      *(_BYTE *)(v32 + 32) = v25;
      ++v16;
      *(_QWORD *)(v32 + 40) = v21;
      *(_QWORD *)(v32 + 48) = v23;
      *(_QWORD *)(v32 + 56) = v27;
      *(_QWORD *)(v32 + 64) = v29;
    }
    while (v46 != v16);
    swift_bridgeObjectRelease();
    v4 = v42;
    v2 = v43;
    v7 = v40;
    v5 = v41;
    v8 = v38;
    a1 = v39;
    v11 = v36;
    v9 = v37;
    goto LABEL_17;
  }
  __break(1u);
  return result;
}

void StartConversationAction.fulfill(dateStarted:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  _QWORD v19[2];
  uint64_t v20;
  uint64_t v21;

  v3 = sub_233AEB8B8();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_25610D350 != -1)
    swift_once();
  v7 = sub_233AEB954();
  __swift_project_value_buffer(v7, (uint64_t)qword_25610E4F0);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, a1, v3);
  swift_retain_n();
  v8 = sub_233AEB93C();
  v9 = sub_233AEBAA4();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = swift_slowAlloc();
    v19[1] = a1;
    v11 = v10;
    v19[0] = swift_slowAlloc();
    v20 = v1;
    v21 = v19[0];
    *(_DWORD *)v11 = 136315394;
    swift_retain();
    v12 = sub_233AEB9C0();
    v20 = sub_233AD6E3C(v12, v13, &v21);
    sub_233AEBAD4();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v11 + 12) = 2080;
    sub_233AD8570();
    v14 = sub_233AEBCC0();
    v20 = sub_233AD6E3C(v14, v15, &v21);
    sub_233AEBAD4();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    _os_log_impl(&dword_233AD2000, v8, v9, "Fulfilling action %s with dateStarted %s", (uint8_t *)v11, 0x16u);
    v16 = v19[0];
    swift_arrayDestroy();
    MEMORY[0x23493BE50](v16, -1, -1);
    MEMORY[0x23493BE50](v11, -1, -1);
  }
  else
  {
    swift_release_n();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }

  objc_opt_self();
  v17 = (void *)swift_dynamicCastObjCClassUnconditional();
  v18 = (void *)sub_233AEB894();
  objc_msgSend(v17, sel_fulfillWithDateStarted_, v18);

}

void sub_233AD83C8()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_233AD83F4()
{
  return swift_bridgeObjectRelease();
}

uint64_t StartConversationAction.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_conversationUUID;
  v2 = sub_233AEB8E8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  sub_233AD3F34(*(_QWORD *)(v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_state), *(_QWORD *)(v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_state + 8));
  v3 = v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_timeoutDate;
  v4 = sub_233AEB8B8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

  swift_bridgeObjectRelease();
  return v0;
}

uint64_t StartConversationAction.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_conversationUUID;
  v2 = sub_233AEB8E8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  sub_233AD3F34(*(_QWORD *)(v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_state), *(_QWORD *)(v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_state + 8));
  v3 = v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_timeoutDate;
  v4 = sub_233AEB8B8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

unint64_t sub_233AD8570()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25610D838;
  if (!qword_25610D838)
  {
    v1 = sub_233AEB8B8();
    result = MEMORY[0x23493BDC0](MEMORY[0x24BDCE988], v1);
    atomic_store(result, (unint64_t *)&qword_25610D838);
  }
  return result;
}

uint64_t sub_233AD85B8()
{
  return type metadata accessor for StartConversationAction();
}

uint64_t type metadata accessor for StartConversationAction()
{
  uint64_t result;

  result = qword_25610D868;
  if (!qword_25610D868)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_233AD85FC()
{
  return swift_updateClassMetadata2();
}

uint64_t method lookup function for StartConversationAction()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of StartConversationAction.__allocating_init(conversationUUID:handles:isVideo:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 136))();
}

uint64_t sub_233AD865C(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_233AD8694(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_233AD8678(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_233AD87F0(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_233AD8694(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25610D930);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 25;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8])
      memmove(v13, v14, 8 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[8 * v8] || v13 >= &v14[8 * v8])
  {
    memcpy(v13, v14, 8 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_233AEBC3C();
  __break(1u);
  return result;
}

uint64_t sub_233AD87F0(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25610D928);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[40 * v8])
      memmove(v12, v13, 40 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[40 * v8] || v12 >= &v13[40 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_233AEBC3C();
  __break(1u);
  return result;
}

uint64_t MergeConversationAction.conversationUUIDToMergeWith.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + OBJC_IVAR____TtC20LiveCommunicationKit23MergeConversationAction_conversationUUIDToMergeWith;
  v4 = sub_233AEB8E8();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t MergeConversationAction.__allocating_init(conversationUUID:conversationUUIDToMergeWith:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = swift_allocObject();
  MergeConversationAction.init(conversationUUID:conversationUUIDToMergeWith:)(a1, a2);
  return v4;
}

uint64_t MergeConversationAction.init(conversationUUID:conversationUUIDToMergeWith:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  void (*v14)(char *, uint64_t, uint64_t);
  void *v15;
  void *v16;
  id v17;
  char *v18;
  void (*v19)(uint64_t, uint64_t);
  _QWORD *v20;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;

  v3 = v2;
  v6 = sub_233AEB8B8();
  v24 = *(_QWORD *)(v6 - 8);
  v25 = v6;
  MEMORY[0x24BDAC7A8]();
  v23 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_233AEB8E8();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8]();
  v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25610D938);
  MEMORY[0x24BDAC7A8]();
  v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  v14(v13, a2, v8);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v9 + 56))(v13, 0, 1, v8);
  swift_retain();
  v15 = (void *)sub_233AEB8C4();
  v16 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v13, 1, v8) != 1)
  {
    v16 = (void *)sub_233AEB8C4();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v13, v8);
  }
  v17 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDB7910]), sel_initWithCallUUID_callUUIDToGroupWith_, v15, v16);

  v14((char *)(v3 + OBJC_IVAR____TtC20LiveCommunicationKit23MergeConversationAction_conversationUUIDToMergeWith), a2, v8);
  swift_release();
  v14(v11, a1, v8);
  v18 = v23;
  sub_233AEB8A0();
  v19 = *(void (**)(uint64_t, uint64_t))(v9 + 8);
  v19(a2, v8);
  v19(a1, v8);
  *(_QWORD *)(v3 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_cxAction) = v17;
  (*(void (**)(uint64_t, char *, uint64_t))(v9 + 32))(v3 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_conversationUUID, v11, v8);
  v20 = (_QWORD *)(v3 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_state);
  *v20 = 0;
  v20[1] = 0;
  (*(void (**)(uint64_t, char *, uint64_t))(v24 + 32))(v3 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_timeoutDate, v18, v25);
  return v3;
}

uint64_t sub_233AD8C64(void *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  id v15;
  _QWORD *v16;
  uint64_t v18;

  v5 = sub_233AEB8B8();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5, v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_233AEB8E8();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10, v12);
  v14 = (char *)&v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(v2 + OBJC_IVAR____TtC20LiveCommunicationKit23MergeConversationAction_conversationUUIDToMergeWith, a2, v10);
  v15 = objc_msgSend(a1, sel_callUUID);
  sub_233AEB8DC();

  sub_233AEB8A0();
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(a2, v10);
  *(_QWORD *)(v2 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_cxAction) = a1;
  (*(void (**)(uint64_t, char *, uint64_t))(v11 + 32))(v2 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_conversationUUID, v14, v10);
  v16 = (_QWORD *)(v2 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_state);
  *v16 = 0;
  v16[1] = 0;
  (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))(v2 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_timeoutDate, v9, v5);
  return v2;
}

void sub_233AD8DE0()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_233AD8E0C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC20LiveCommunicationKit23MergeConversationAction_conversationUUIDToMergeWith;
  v2 = sub_233AEB8E8();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
}

uint64_t MergeConversationAction.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void (*v3)(uint64_t, uint64_t);
  uint64_t v4;
  uint64_t v5;

  v1 = v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_conversationUUID;
  v2 = sub_233AEB8E8();
  v3 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8);
  v3(v1, v2);
  sub_233AD3F34(*(_QWORD *)(v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_state), *(_QWORD *)(v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_state + 8));
  v4 = v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_timeoutDate;
  v5 = sub_233AEB8B8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);

  v3(v0 + OBJC_IVAR____TtC20LiveCommunicationKit23MergeConversationAction_conversationUUIDToMergeWith, v2);
  return v0;
}

uint64_t MergeConversationAction.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void (*v3)(uint64_t, uint64_t);
  uint64_t v4;
  uint64_t v5;

  v1 = v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_conversationUUID;
  v2 = sub_233AEB8E8();
  v3 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8);
  v3(v1, v2);
  sub_233AD3F34(*(_QWORD *)(v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_state), *(_QWORD *)(v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_state + 8));
  v4 = v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_timeoutDate;
  v5 = sub_233AEB8B8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);

  v3(v0 + OBJC_IVAR____TtC20LiveCommunicationKit23MergeConversationAction_conversationUUIDToMergeWith, v2);
  return swift_deallocClassInstance();
}

uint64_t sub_233AD8FD4()
{
  return type metadata accessor for MergeConversationAction();
}

uint64_t type metadata accessor for MergeConversationAction()
{
  uint64_t result;

  result = qword_25610D968;
  if (!qword_25610D968)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_233AD9018()
{
  uint64_t result;
  unint64_t v1;

  result = sub_233AEB8E8();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for MergeConversationAction()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of MergeConversationAction.__allocating_init(conversationUUID:conversationUUIDToMergeWith:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 128))();
}

unint64_t sub_233AD9098(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t result;
  char v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  _QWORD v26[2];

  v6 = __swift_instantiateConcreteTypeFromMangledName(a2);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(_QWORD *)(a1 + 16))
  {
    v11 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(a3);
  v10 = sub_233AEBC30();
  v11 = (_QWORD *)v10;
  v12 = *(_QWORD *)(a1 + 16);
  if (!v12)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v11;
  }
  v13 = *(int *)(v6 + 48);
  v14 = v10 + 64;
  v15 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v26[1] = a1;
  v16 = a1 + v15;
  v17 = *(_QWORD *)(v7 + 72);
  swift_retain();
  while (1)
  {
    sub_233ADF358(v16, (uint64_t)v9, a2);
    result = sub_233ADDA7C((uint64_t)v9);
    if ((v19 & 1) != 0)
      break;
    v20 = result;
    *(_QWORD *)(v14 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v21 = v11[6];
    v22 = sub_233AEB8E8();
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(_QWORD *)(v22 - 8) + 32))(v21 + *(_QWORD *)(*(_QWORD *)(v22 - 8) + 72) * v20, v9, v22);
    *(_QWORD *)(v11[7] + 8 * v20) = *(_QWORD *)&v9[v13];
    v23 = v11[2];
    v24 = __OFADD__(v23, 1);
    v25 = v23 + 1;
    if (v24)
      goto LABEL_11;
    v11[2] = v25;
    v16 += v17;
    if (!--v12)
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

uint64_t sub_233AD9224(unint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;

  if (a1 >> 62)
    goto LABEL_14;
  v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    result = MEMORY[0x24BEE4AF8];
    if (!v2)
      break;
    v7 = MEMORY[0x24BEE4AF8];
    result = sub_233AEBBD0();
    if (v2 < 0)
    {
      __break(1u);
      return result;
    }
    v4 = 0;
    while (v2 != v4)
    {
      if ((a1 & 0xC000000000000001) != 0)
      {
        v5 = MEMORY[0x23493B8D4](v4, a1);
      }
      else
      {
        v5 = *(_QWORD *)(a1 + 8 * v4 + 32);
        swift_retain();
      }
      ++v4;
      v6 = *(id *)(v5 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_cxAction);
      swift_release();
      sub_233AEBBB8();
      sub_233AEBBDC();
      sub_233AEBBE8();
      sub_233AEBBC4();
      if (v2 == v4)
        return v7;
    }
    __break(1u);
LABEL_14:
    swift_bridgeObjectRetain();
    v2 = sub_233AEBC0C();
    swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t ConversationManager.conversations.getter()
{
  swift_getKeyPath();
  sub_233ADF2B4(&qword_25610DA28, (uint64_t (*)(uint64_t))type metadata accessor for ConversationManager, (uint64_t)&protocol conformance descriptor for ConversationManager);
  sub_233AEB900();
  swift_release();
  return swift_bridgeObjectRetain();
}

uint64_t sub_233AD93F4@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;

  v3 = *a1;
  swift_getKeyPath();
  sub_233ADF2B4(&qword_25610DA28, (uint64_t (*)(uint64_t))type metadata accessor for ConversationManager, (uint64_t)&protocol conformance descriptor for ConversationManager);
  sub_233AEB900();
  swift_release();
  *a2 = *(_QWORD *)(v3 + 24);
  return swift_bridgeObjectRetain();
}

uint64_t sub_233AD9488()
{
  swift_getKeyPath();
  sub_233ADF2B4(&qword_25610DA28, (uint64_t (*)(uint64_t))type metadata accessor for ConversationManager, (uint64_t)&protocol conformance descriptor for ConversationManager);
  swift_bridgeObjectRetain();
  sub_233AEB8F4();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t type metadata accessor for ConversationManager()
{
  uint64_t result;

  result = qword_25610DA98;
  if (!qword_25610DA98)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t ConversationManager.delegate.getter()
{
  uint64_t v0;

  swift_beginAccess();
  return MEMORY[0x23493BED4](v0 + 32);
}

uint64_t ConversationManager.delegate.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_beginAccess();
  *(_QWORD *)(v2 + 40) = a2;
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

void (*ConversationManager.delegate.modify(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[5] = v1;
  swift_beginAccess();
  v4 = MEMORY[0x23493BED4](v1 + 32);
  v5 = *(_QWORD *)(v1 + 40);
  v3[3] = v4;
  v3[4] = v5;
  return sub_233AD9690;
}

void sub_233AD9690(uint64_t a1, char a2)
{
  void *v3;

  v3 = *(void **)a1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a1 + 40) + 40) = *(_QWORD *)(*(_QWORD *)a1 + 32);
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

uint64_t sub_233AD9700()
{
  swift_getKeyPath();
  sub_233ADF2B4(&qword_25610DA28, (uint64_t (*)(uint64_t))type metadata accessor for ConversationManager, (uint64_t)&protocol conformance descriptor for ConversationManager);
  sub_233AEB900();
  swift_release();
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t sub_233AD979C@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;

  v3 = *a1;
  swift_getKeyPath();
  sub_233ADF2B4(&qword_25610DA28, (uint64_t (*)(uint64_t))type metadata accessor for ConversationManager, (uint64_t)&protocol conformance descriptor for ConversationManager);
  sub_233AEB900();
  swift_release();
  swift_beginAccess();
  *a2 = *(_QWORD *)(v3 + 80);
  return swift_bridgeObjectRetain();
}

uint64_t sub_233AD9840()
{
  swift_getKeyPath();
  sub_233ADF2B4(&qword_25610DA28, (uint64_t (*)(uint64_t))type metadata accessor for ConversationManager, (uint64_t)&protocol conformance descriptor for ConversationManager);
  swift_bridgeObjectRetain();
  sub_233AEB8F4();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_233AD98F8(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  *(_QWORD *)(a1 + 80) = a2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_233AD995C()
{
  swift_getKeyPath();
  sub_233ADF2B4(&qword_25610DA28, (uint64_t (*)(uint64_t))type metadata accessor for ConversationManager, (uint64_t)&protocol conformance descriptor for ConversationManager);
  sub_233AEB900();
  swift_release();
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t sub_233AD99F8@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;

  v3 = *a1;
  swift_getKeyPath();
  sub_233ADF2B4(&qword_25610DA28, (uint64_t (*)(uint64_t))type metadata accessor for ConversationManager, (uint64_t)&protocol conformance descriptor for ConversationManager);
  sub_233AEB900();
  swift_release();
  swift_beginAccess();
  *a2 = *(_QWORD *)(v3 + 88);
  return swift_bridgeObjectRetain();
}

uint64_t sub_233AD9A9C()
{
  swift_getKeyPath();
  sub_233ADF2B4(&qword_25610DA28, (uint64_t (*)(uint64_t))type metadata accessor for ConversationManager, (uint64_t)&protocol conformance descriptor for ConversationManager);
  swift_bridgeObjectRetain();
  sub_233AEB8F4();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_233AD9B54(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  *(_QWORD *)(a1 + 88) = a2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t ConversationManager.configuration.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  char v6;
  uint64_t v7;
  __int128 v9;

  v2 = *(_QWORD *)(v1 + 104);
  v3 = *(_QWORD *)(v1 + 112);
  v4 = *(_QWORD *)(v1 + 136);
  v5 = *(_BYTE *)(v1 + 144);
  v6 = *(_BYTE *)(v1 + 145);
  v7 = *(_QWORD *)(v1 + 152);
  *(_QWORD *)a1 = *(_QWORD *)(v1 + 96);
  *(_QWORD *)(a1 + 8) = v2;
  *(_QWORD *)(a1 + 16) = v3;
  v9 = *(_OWORD *)(v1 + 120);
  *(_OWORD *)(a1 + 24) = v9;
  *(_QWORD *)(a1 + 40) = v4;
  *(_BYTE *)(a1 + 48) = v5;
  *(_BYTE *)(a1 + 49) = v6;
  *(_QWORD *)(a1 + 56) = v7;
  swift_bridgeObjectRetain();
  sub_233AD479C(v3, v9);
  return swift_bridgeObjectRetain();
}

uint64_t ConversationManager.pendingActions.getter()
{
  uint64_t v0;
  id v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;

  v1 = objc_msgSend(*(id *)(v0 + 64), sel_pendingTransactions);
  sub_233ADF30C(0, &qword_25610DA30);
  v2 = sub_233AEBA20();

  v3 = sub_233AD9CE8(v2);
  swift_bridgeObjectRelease();
  swift_retain();
  v4 = sub_233ADEA4C(v3, v0);
  swift_bridgeObjectRelease();
  swift_release();
  return v4;
}

uint64_t sub_233AD9CE8(unint64_t a1)
{
  uint64_t v2;
  uint64_t i;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  unint64_t v8;
  uint64_t v10;

  v10 = MEMORY[0x24BEE4AF8];
  if (a1 >> 62)
    goto LABEL_11;
  v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v2; v2 = sub_233AEBC0C())
  {
    for (i = 4; ; ++i)
    {
      v4 = (a1 & 0xC000000000000001) != 0 ? (id)MEMORY[0x23493B8D4](i - 4, a1) : *(id *)(a1 + 8 * i);
      v5 = v4;
      v6 = i - 3;
      if (__OFADD__(i - 4, 1))
        break;
      v7 = objc_msgSend(v4, sel_actions);
      sub_233ADF30C(0, &qword_25610DA48);
      v8 = sub_233AEBA20();

      sub_233ADE404(v8);
      if (v6 == v2)
      {
        swift_bridgeObjectRelease();
        return v10;
      }
    }
    __break(1u);
LABEL_11:
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();
  return MEMORY[0x24BEE4AF8];
}

id ConversationManager.__allocating_init(configuration:)(__int128 *a1)
{
  __int128 v1;
  __int128 v2;
  id result;
  void *v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;

  v1 = a1[1];
  v6 = *a1;
  v7 = v1;
  v2 = a1[3];
  result = objc_msgSend((id)objc_opt_self(), sel_sharedInstance, v6, v7, a1[2], v2);
  if (result)
  {
    v4 = result;
    v5 = sub_233ADECE4((uint64_t *)&v6, result);

    return (id)v5;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_233AD9EBC(__int128 *a1, void *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  char v8;
  char v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  _QWORD *v18;
  _QWORD *v19;
  _QWORD *v20;
  _QWORD *v21;
  _QWORD *v22;
  _QWORD *v23;
  _QWORD *v24;
  uint64_t (**v25)(void *);
  uint64_t (**v26)(void *);
  uint64_t (**v27)(void *);
  uint64_t (**v28)(void *);
  _QWORD *v29;
  uint64_t (**v30)(void *);
  uint64_t (**v31)(void *);
  void *v32;
  id v33;
  id v34;
  __int128 v36;
  __int128 v37;

  v36 = a1[1];
  v37 = *a1;
  v6 = *((_QWORD *)a1 + 4);
  v7 = *((_QWORD *)a1 + 5);
  v8 = *((_BYTE *)a1 + 48);
  v9 = *((_BYTE *)a1 + 49);
  v10 = *((_QWORD *)a1 + 7);
  *(_QWORD *)(v3 + 40) = 0;
  swift_unknownObjectWeakInit();
  sub_233AEB924();
  *(_OWORD *)(v3 + 96) = v37;
  *(_OWORD *)(v3 + 112) = v36;
  *(_QWORD *)(v3 + 128) = v6;
  *(_QWORD *)(v3 + 136) = v7;
  *(_BYTE *)(v3 + 144) = v8;
  *(_BYTE *)(v3 + 145) = v9;
  *(_QWORD *)(v3 + 152) = v10;
  v11 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for CallProviderWrapper()), sel_init);
  *(_QWORD *)(v3 + 64) = a2;
  *(_QWORD *)(v3 + 72) = v11;
  *(_QWORD *)(v3 + 16) = a3;
  v12 = objc_allocWithZone(MEMORY[0x24BDB7888]);
  v13 = a2;
  swift_retain();
  v14 = objc_msgSend(v12, sel_init);
  *(_QWORD *)(v3 + 48) = v14;
  v15 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(v3 + 80) = sub_233AD9098(MEMORY[0x24BEE4AF8], &qword_25610DBA0, &qword_25610DB78);
  *(_QWORD *)(v3 + 88) = sub_233AD9098(v15, &qword_25610DBA0, &qword_25610DB78);
  v16 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for CallObserverDelegateWrapper()), sel_init);
  *(_QWORD *)(v3 + 56) = v16;
  *(_QWORD *)(v3 + 24) = v15;
  v17 = objc_msgSend(v14, sel_callObserver);
  objc_msgSend(v17, sel_setDelegate_queue_, v16, 0);

  v18 = (_QWORD *)(*(_QWORD *)(v3 + 56)
                 + OBJC_IVAR____TtC20LiveCommunicationKit27CallObserverDelegateWrapper_onCallChanged);
  *v18 = sub_233ADF150;
  v18[1] = v3;
  swift_retain();
  swift_release();
  v19 = (_QWORD *)(*(_QWORD *)(v3 + 72) + OBJC_IVAR____TtC20LiveCommunicationKit19CallProviderWrapper_onProviderDidReset);
  *v19 = sub_233ADF154;
  v19[1] = v3;
  swift_retain();
  swift_release();
  v20 = (_QWORD *)(*(_QWORD *)(v3 + 72) + OBJC_IVAR____TtC20LiveCommunicationKit19CallProviderWrapper_onProviderDidBegin);
  *v20 = sub_233ADF158;
  v20[1] = v3;
  swift_retain();
  swift_release();
  v21 = (_QWORD *)(*(_QWORD *)(v3 + 72)
                 + OBJC_IVAR____TtC20LiveCommunicationKit19CallProviderWrapper_onProviderDidActivateAudioSession);
  *v21 = sub_233ADF15C;
  v21[1] = v3;
  swift_retain();
  swift_release();
  v22 = (_QWORD *)(*(_QWORD *)(v3 + 72)
                 + OBJC_IVAR____TtC20LiveCommunicationKit19CallProviderWrapper_onProviderDidDeactivateAudioSession);
  *v22 = sub_233ADF160;
  v22[1] = v3;
  swift_retain();
  swift_release();
  v23 = (_QWORD *)(*(_QWORD *)(v3 + 72)
                 + OBJC_IVAR____TtC20LiveCommunicationKit19CallProviderWrapper_onProviderTimedOutPerformingAction);
  *v23 = sub_233ADF464;
  v23[1] = v3;
  swift_retain();
  swift_release();
  v24 = (_QWORD *)(*(_QWORD *)(v3 + 72)
                 + OBJC_IVAR____TtC20LiveCommunicationKit19CallProviderWrapper_onProviderPerformAction);
  *v24 = sub_233ADF164;
  v24[1] = v3;
  swift_retain();
  swift_release();
  v25 = (uint64_t (**)(void *))(*(_QWORD *)(v3 + 72)
                                        + OBJC_IVAR____TtC20LiveCommunicationKit19CallProviderWrapper_onProviderPerformStartCallAction);
  *v25 = sub_233ADF168;
  v25[1] = (uint64_t (*)(void *))v3;
  swift_retain();
  swift_release();
  v26 = (uint64_t (**)(void *))(*(_QWORD *)(v3 + 72)
                                        + OBJC_IVAR____TtC20LiveCommunicationKit19CallProviderWrapper_onProviderPerformAnswerCallAction);
  *v26 = sub_233ADF19C;
  v26[1] = (uint64_t (*)(void *))v3;
  swift_retain();
  swift_release();
  v27 = (uint64_t (**)(void *))(*(_QWORD *)(v3 + 72)
                                        + OBJC_IVAR____TtC20LiveCommunicationKit19CallProviderWrapper_onProviderPerformEndCallAction);
  *v27 = sub_233ADF1C4;
  v27[1] = (uint64_t (*)(void *))v3;
  swift_retain();
  swift_release();
  v28 = (uint64_t (**)(void *))(*(_QWORD *)(v3 + 72)
                                        + OBJC_IVAR____TtC20LiveCommunicationKit19CallProviderWrapper_onProviderPerformSetHeldCallAction);
  *v28 = sub_233ADF1EC;
  v28[1] = (uint64_t (*)(void *))v3;
  swift_retain();
  swift_release();
  v29 = (_QWORD *)(*(_QWORD *)(v3 + 72)
                 + OBJC_IVAR____TtC20LiveCommunicationKit19CallProviderWrapper_onProviderPerformSetGroupCallAction);
  *v29 = sub_233ADF220;
  v29[1] = v3;
  swift_retain();
  swift_release();
  v30 = (uint64_t (**)(void *))(*(_QWORD *)(v3 + 72)
                                        + OBJC_IVAR____TtC20LiveCommunicationKit19CallProviderWrapper_onProviderPerformSetMutedCallAction);
  *v30 = sub_233ADF224;
  v30[1] = (uint64_t (*)(void *))v3;
  swift_retain();
  swift_release();
  v31 = (uint64_t (**)(void *))(*(_QWORD *)(v3 + 72)
                                        + OBJC_IVAR____TtC20LiveCommunicationKit19CallProviderWrapper_onProviderPerformPlayDTMFCallAction);
  *v31 = sub_233ADF258;
  v31[1] = (uint64_t (*)(void *))v3;
  swift_retain();
  swift_release();
  v32 = *(void **)(v3 + 72);
  v33 = *(id *)(v3 + 64);
  v34 = v32;
  objc_msgSend(v33, sel_setDelegate_queue_, v34, 0);

  swift_release();
  return v3;
}

uint64_t sub_233ADA354(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  os_unfair_lock_s *v4;
  uint64_t *v5;
  os_unfair_lock_s *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  id v20;
  id v21;
  unint64_t v22;
  uint64_t KeyPath;
  uint64_t v24;
  uint64_t v25;
  uint64_t ObjectType;
  uint64_t v28[3];

  v2 = v1;
  v4 = *(os_unfair_lock_s **)(*(_QWORD *)(v2 + 16) + 16);
  v5 = (uint64_t *)&v4[4];
  v6 = v4 + 6;
  os_unfair_lock_lock(v4 + 6);
  sub_233AD4420(v5, a1, (uint64_t)v28);
  os_unfair_lock_unlock(v6);
  v7 = v28[0];
  if (qword_25610D350 != -1)
    swift_once();
  v8 = sub_233AEB954();
  __swift_project_value_buffer(v8, (uint64_t)qword_25610E4F0);
  v9 = a1;
  swift_retain_n();
  v10 = v9;
  v11 = sub_233AEB93C();
  v12 = sub_233AEBAA4();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = swift_slowAlloc();
    v14 = swift_slowAlloc();
    v28[0] = v14;
    *(_DWORD *)v13 = 136315394;
    sub_233ADF30C(0, &qword_25610DB90);
    v15 = v10;
    v16 = sub_233AEB9C0();
    sub_233AD6E3C(v16, v17, v28);
    sub_233AEBAD4();

    swift_bridgeObjectRelease();
    *(_WORD *)(v13 + 12) = 2080;
    type metadata accessor for Conversation(0);
    swift_retain();
    v18 = sub_233AEB9C0();
    sub_233AD6E3C(v18, v19, v28);
    sub_233AEBAD4();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_233AD2000, v11, v12, "Call changed %s %s", (uint8_t *)v13, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x23493BE50](v14, -1, -1);
    MEMORY[0x23493BE50](v13, -1, -1);

  }
  else
  {

    swift_release_n();
  }
  v20 = objc_msgSend(*(id *)(v2 + 48), sel_callObserver);
  v21 = objc_msgSend(v20, sel_calls);

  sub_233ADF30C(0, &qword_25610DB90);
  v22 = sub_233AEBA20();

  swift_retain();
  sub_233ADE8B8(v22, (os_unfair_lock_s *)v2);
  swift_bridgeObjectRelease();
  swift_release();
  KeyPath = swift_getKeyPath();
  MEMORY[0x24BDAC7A8](KeyPath, v24);
  v28[0] = v2;
  sub_233ADF2B4(&qword_25610DA28, (uint64_t (*)(uint64_t))type metadata accessor for ConversationManager, (uint64_t)&protocol conformance descriptor for ConversationManager);
  sub_233AEB8F4();
  swift_release();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  if (MEMORY[0x23493BED4](v2 + 32))
  {
    v25 = *(_QWORD *)(v2 + 40);
    ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v25 + 8))(v2, v7, ObjectType, v25);
    swift_unknownObjectRelease();
  }
  return swift_release();
}

uint64_t sub_233ADA760()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  uint64_t ObjectType;
  uint64_t v10[3];

  v1 = v0;
  if (qword_25610D350 != -1)
    swift_once();
  v2 = sub_233AEB954();
  __swift_project_value_buffer(v2, (uint64_t)qword_25610E4F0);
  v3 = sub_233AEB93C();
  v4 = sub_233AEBAA4();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    v6 = swift_slowAlloc();
    v10[0] = v6;
    *(_DWORD *)v5 = 136315138;
    sub_233AD6E3C(0xD000000000000013, 0x8000000233AEE990, v10);
    sub_233AEBAD4();
    _os_log_impl(&dword_233AD2000, v3, v4, "%s", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23493BE50](v6, -1, -1);
    MEMORY[0x23493BE50](v5, -1, -1);
  }

  swift_beginAccess();
  result = MEMORY[0x23493BED4](v1 + 32);
  if (result)
  {
    v8 = *(_QWORD *)(v1 + 40);
    ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 24))(v1, ObjectType, v8);
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_233ADA920()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  uint64_t ObjectType;
  uint64_t v10[3];

  v1 = v0;
  if (qword_25610D350 != -1)
    swift_once();
  v2 = sub_233AEB954();
  __swift_project_value_buffer(v2, (uint64_t)qword_25610E4F0);
  v3 = sub_233AEB93C();
  v4 = sub_233AEBAA4();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    v6 = swift_slowAlloc();
    v10[0] = v6;
    *(_DWORD *)v5 = 136315138;
    sub_233AD6E3C(0xD000000000000013, 0x8000000233AEE970, v10);
    sub_233AEBAD4();
    _os_log_impl(&dword_233AD2000, v3, v4, "%s", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23493BE50](v6, -1, -1);
    MEMORY[0x23493BE50](v5, -1, -1);
  }

  swift_beginAccess();
  result = MEMORY[0x23493BED4](v1 + 32);
  if (result)
  {
    v8 = *(_QWORD *)(v1 + 40);
    ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v1, ObjectType, v8);
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_233ADAAE0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  uint64_t ObjectType;
  uint64_t v12[3];

  v2 = v1;
  if (qword_25610D350 != -1)
    swift_once();
  v4 = sub_233AEB954();
  __swift_project_value_buffer(v4, (uint64_t)qword_25610E4F0);
  v5 = sub_233AEB93C();
  v6 = sub_233AEBAA4();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = swift_slowAlloc();
    v12[0] = v8;
    *(_DWORD *)v7 = 136315138;
    sub_233AD6E3C(0xD000000000000024, 0x8000000233AEE940, v12);
    sub_233AEBAD4();
    _os_log_impl(&dword_233AD2000, v5, v6, "%s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23493BE50](v8, -1, -1);
    MEMORY[0x23493BE50](v7, -1, -1);
  }

  swift_beginAccess();
  result = MEMORY[0x23493BED4](v2 + 32);
  if (result)
  {
    v10 = *(_QWORD *)(v2 + 40);
    ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 48))(v2, a1, ObjectType, v10);
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_233ADACA8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  uint64_t ObjectType;
  uint64_t v12[3];

  v2 = v1;
  if (qword_25610D350 != -1)
    swift_once();
  v4 = sub_233AEB954();
  __swift_project_value_buffer(v4, (uint64_t)qword_25610E4F0);
  v5 = sub_233AEB93C();
  v6 = sub_233AEBAA4();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = swift_slowAlloc();
    v12[0] = v8;
    *(_DWORD *)v7 = 136315138;
    sub_233AD6E3C(0xD000000000000026, 0x8000000233AEE910, v12);
    sub_233AEBAD4();
    _os_log_impl(&dword_233AD2000, v5, v6, "%s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23493BE50](v8, -1, -1);
    MEMORY[0x23493BE50](v7, -1, -1);
  }

  swift_beginAccess();
  result = MEMORY[0x23493BED4](v2 + 32);
  if (result)
  {
    v10 = *(_QWORD *)(v2 + 40);
    ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56))(v2, a1, ObjectType, v10);
    return swift_unknownObjectRelease();
  }
  return result;
}

void sub_233ADAE70(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t ObjectType;
  id v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38[3];
  uint64_t v39;
  uint64_t v40[3];

  v2 = v1;
  v4 = sub_233AEB8E8();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4, v6);
  v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_25610D350 != -1)
    swift_once();
  v9 = sub_233AEB954();
  __swift_project_value_buffer(v9, (uint64_t)qword_25610E4F0);
  v10 = a1;
  v11 = sub_233AEB93C();
  v12 = sub_233AEBAA4();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = swift_slowAlloc();
    v37 = v4;
    v14 = v13;
    v35 = swift_slowAlloc();
    v36 = v5;
    v40[0] = v35;
    *(_DWORD *)v14 = 136315394;
    v38[0] = (id)sub_233AD6E3C(0xD000000000000025, 0x8000000233AEE8E0, v40);
    sub_233AEBAD4();
    *(_WORD *)(v14 + 12) = 2080;
    v38[0] = v10;
    sub_233ADF30C(0, &qword_25610DA48);
    v15 = v10;
    v16 = sub_233AEB9C0();
    v38[0] = (id)sub_233AD6E3C(v16, v17, v40);
    sub_233AEBAD4();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_233AD2000, v11, v12, "%s %s", (uint8_t *)v14, 0x16u);
    v18 = v35;
    swift_arrayDestroy();
    v5 = v36;
    MEMORY[0x23493BE50](v18, -1, -1);
    v19 = v14;
    v4 = v37;
    MEMORY[0x23493BE50](v19, -1, -1);

  }
  else
  {

  }
  v20 = objc_msgSend(v10, sel_UUID);
  sub_233AEB8DC();

  swift_getKeyPath();
  v40[0] = v2;
  sub_233ADF2B4(&qword_25610DA28, (uint64_t (*)(uint64_t))type metadata accessor for ConversationManager, (uint64_t)&protocol conformance descriptor for ConversationManager);
  sub_233AEB900();
  swift_release();
  swift_beginAccess();
  v21 = *(_QWORD *)(v2 + 88);
  if (*(_QWORD *)(v21 + 16))
  {
    swift_bridgeObjectRetain();
    v22 = sub_233ADDA7C((uint64_t)v8);
    if ((v23 & 1) != 0)
    {
      v24 = *(_QWORD *)(*(_QWORD *)(v21 + 56) + 8 * v22);
      swift_retain();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
      swift_beginAccess();
      if (MEMORY[0x23493BED4](v2 + 32))
      {
        v25 = *(_QWORD *)(v2 + 40);
        ObjectType = swift_getObjectType();
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v25 + 40))(v2, v24, ObjectType, v25);
        swift_release();
        swift_unknownObjectRelease();
      }
      else
      {
        swift_release();
      }
      return;
    }
    swift_bridgeObjectRelease();
  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  v27 = v10;
  v28 = sub_233AEB93C();
  v29 = sub_233AEBA98();
  if (os_log_type_enabled(v28, v29))
  {
    v30 = (uint8_t *)swift_slowAlloc();
    v31 = swift_slowAlloc();
    v38[0] = (id)v31;
    *(_DWORD *)v30 = 136315138;
    v39 = (uint64_t)v27;
    sub_233ADF30C(0, &qword_25610DA48);
    v32 = v27;
    v33 = sub_233AEB9C0();
    v39 = sub_233AD6E3C(v33, v34, (uint64_t *)v38);
    sub_233AEBAD4();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_233AD2000, v28, v29, "Timed out performing unknown action %s", v30, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23493BE50](v31, -1, -1);
    MEMORY[0x23493BE50](v30, -1, -1);

  }
  else
  {

  }
}

uint64_t sub_233ADB380(void *a1, void (*a2)(_QWORD), uint64_t a3, uint64_t a4)
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
  char *v15;
  uint64_t v16;
  id v17;
  id v18;
  _QWORD *v19;
  uint64_t v21;
  uint64_t v22;

  v21 = a3;
  v22 = a4;
  v6 = sub_233AEB8B8();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6, v8);
  v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_233AEB8E8();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11, v13);
  v15 = (char *)&v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  a2(0);
  v16 = swift_allocObject();
  v17 = a1;
  v18 = objc_msgSend(v17, sel_callUUID, v21, v22);
  sub_233AEB8DC();

  sub_233AEB8A0();
  *(_QWORD *)(v16 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_cxAction) = v17;
  (*(void (**)(uint64_t, char *, uint64_t))(v12 + 32))(v16 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_conversationUUID, v15, v11);
  v19 = (_QWORD *)(v16 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_state);
  *v19 = 0;
  v19[1] = 0;
  (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(v16 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_timeoutDate, v10, v6);
  sub_233ADD698(v16, v17);
  return swift_release();
}

uint64_t sub_233ADB50C(void *a1)
{
  uint64_t v2;
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
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  id v20;
  void *v21;
  void (*v22)(char *, char *, uint64_t);
  id v23;
  uint64_t v24;
  uint64_t v26;
  id v27;
  id v28;
  _QWORD *v29;
  uint64_t v30;

  v2 = sub_233AEB8B8();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2, v4);
  v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25610D938);
  MEMORY[0x24BDAC7A8](v7, v8);
  v10 = (char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_233AEB8E8();
  v12 = *(_QWORD *)(v11 - 8);
  v14 = MEMORY[0x24BDAC7A8](v11, v13);
  v16 = (char *)&v30 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14, v17);
  v19 = (char *)&v30 - v18;
  v20 = objc_msgSend(a1, sel_callUUIDToGroupWith);
  if (v20)
  {
    v21 = v20;
    sub_233AEB8DC();

    v22 = *(void (**)(char *, char *, uint64_t))(v12 + 32);
    v22(v10, v16, v11);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v10, 0, 1, v11);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) != 1)
    {
      v22(v19, v10, v11);
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v16, v19, v11);
      type metadata accessor for MergeConversationAction();
      swift_allocObject();
      v23 = a1;
      v24 = sub_233AD8C64(v23, (uint64_t)v16);
      sub_233ADD698(v24, v23);
      swift_release();
      return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v19, v11);
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56))(v10, 1, 1, v11);
  }
  sub_233ADEF0C((uint64_t)v10);
  type metadata accessor for UnmergeConversationAction();
  v26 = swift_allocObject();
  v27 = a1;
  v28 = objc_msgSend(v27, sel_callUUID);
  sub_233AEB8DC();

  sub_233AEB8A0();
  *(_QWORD *)(v26 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_cxAction) = v27;
  (*(void (**)(uint64_t, char *, uint64_t))(v12 + 32))(v26 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_conversationUUID, v16, v11);
  v29 = (_QWORD *)(v26 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_state);
  *v29 = 0;
  v29[1] = 0;
  (*(void (**)(uint64_t, char *, uint64_t))(v3 + 32))(v26 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_timeoutDate, v6, v2);
  sub_233ADD698(v26, v27);
  return swift_release();
}

uint64_t sub_233ADB810(void *a1, uint64_t a2, void (*a3)(_QWORD), uint64_t (*a4)(void))
{
  id v6;
  uint64_t v7;

  a3(0);
  swift_allocObject();
  v6 = a1;
  v7 = a4();
  sub_233ADD698(v7, v6);
  return swift_release();
}

uint64_t ConversationManager.perform(_:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2[20] = a1;
  v2[21] = v1;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25610DA40);
  v2[22] = v3;
  v2[23] = *(_QWORD *)(v3 - 8);
  v2[24] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_233ADB900()
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
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t *boxed_opaque_existential_0;
  _QWORD *v20;
  uint64_t v22;

  if (qword_25610D350 != -1)
    swift_once();
  v1 = sub_233AEB954();
  __swift_project_value_buffer(v1, (uint64_t)qword_25610E4F0);
  swift_bridgeObjectRetain_n();
  v2 = sub_233AEB93C();
  v3 = sub_233AEBAA4();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    v5 = swift_slowAlloc();
    v22 = v5;
    *(_DWORD *)v4 = 136315138;
    v6 = type metadata accessor for ConversationAction();
    v7 = swift_bridgeObjectRetain();
    v8 = MEMORY[0x23493B784](v7, v6);
    v10 = v9;
    swift_bridgeObjectRelease();
    v0[19] = sub_233AD6E3C(v8, v10, &v22);
    sub_233AEBAD4();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_233AD2000, v2, v3, "Performing actions %s", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x23493BE50](v5, -1, -1);
    MEMORY[0x23493BE50](v4, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  v12 = v0[23];
  v11 = v0[24];
  v14 = v0[21];
  v13 = v0[22];
  sub_233AD9224(v0[20]);
  v15 = objc_allocWithZone(MEMORY[0x24BDB7930]);
  sub_233ADF30C(0, &qword_25610DA48);
  v16 = (void *)sub_233AEBA14();
  swift_bridgeObjectRelease();
  v17 = objc_msgSend(v15, sel_initWithActions_, v16);
  v0[25] = v17;

  v18 = *(void **)(v14 + 48);
  v0[2] = v0;
  v0[3] = sub_233ADBC34;
  swift_continuation_init();
  v0[17] = v13;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v0 + 14);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25610DA50);
  sub_233AEBA5C();
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v12 + 32))(boxed_opaque_existential_0, v11, v13);
  v0[10] = MEMORY[0x24BDAC760];
  v20 = v0 + 10;
  v20[1] = 1107296256;
  v20[2] = sub_233ADBD1C;
  v20[3] = &block_descriptor;
  objc_msgSend(v18, sel_requestTransaction_completion_, v17, v20);
  return swift_continuation_await();
}

uint64_t sub_233ADBC34()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 208) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_233ADBC94()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_233ADBCD0()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 200);
  swift_willThrow();

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_233ADBD1C(uint64_t a1, void *a2)
{
  id v3;

  __swift_project_boxed_opaque_existential_0((_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56));
  if (a2)
  {
    v3 = a2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25610DA40);
    sub_233AEBA68();

  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25610DA40);
    sub_233AEBA74();
  }
}

uint64_t ConversationManager.reportNewIncomingConversation(uuid:update:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;

  *(_QWORD *)(v3 + 240) = a1;
  *(_QWORD *)(v3 + 248) = v2;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25610DA40);
  *(_QWORD *)(v3 + 256) = v5;
  *(_QWORD *)(v3 + 264) = *(_QWORD *)(v5 - 8);
  *(_QWORD *)(v3 + 272) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25610D938);
  *(_QWORD *)(v3 + 280) = swift_task_alloc();
  *(_QWORD *)(v3 + 288) = swift_task_alloc();
  v6 = sub_233AEB8E8();
  *(_QWORD *)(v3 + 296) = v6;
  *(_QWORD *)(v3 + 304) = *(_QWORD *)(v6 - 8);
  *(_QWORD *)(v3 + 312) = swift_task_alloc();
  *(_QWORD *)(v3 + 320) = swift_task_alloc();
  *(_QWORD *)(v3 + 328) = swift_task_alloc();
  v7 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v3 + 336) = *(_OWORD *)a2;
  *(_OWORD *)(v3 + 352) = v7;
  v8 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(v3 + 368) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(v3 + 384) = v8;
  *(_BYTE *)(v3 + 145) = *(_BYTE *)(a2 + 64);
  return swift_task_switch();
}

uint64_t sub_233ADBE94()
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
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  uint64_t *boxed_opaque_existential_0;
  _QWORD *v43;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  __int128 v48;
  uint64_t v49;
  uint64_t v50;
  os_log_type_t v51;
  NSObject *log;
  __int128 v53;
  uint64_t v54;
  void (*v55)(uint64_t, uint64_t, uint64_t);
  char v56;
  __int128 v57;
  __int128 v58;
  id v59;
  _OWORD v60[3];
  uint64_t v61;
  uint64_t v62;
  char v63;

  if (qword_25610D350 != -1)
    swift_once();
  v54 = *(_QWORD *)(v0 + 240);
  v2 = *(_QWORD *)(v0 + 344);
  v1 = *(_QWORD *)(v0 + 352);
  v4 = *(_QWORD *)(v0 + 328);
  v3 = *(_QWORD *)(v0 + 336);
  v6 = *(_QWORD *)(v0 + 296);
  v5 = *(_QWORD *)(v0 + 304);
  v7 = sub_233AEB954();
  __swift_project_value_buffer(v7, (uint64_t)qword_25610E4F0);
  v8 = v54;
  v55 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  v55(v4, v8, v6);
  sub_233AD6470(v3, v2, v1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_233AD6470(v3, v2, v1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v9 = sub_233AEB93C();
  v10 = sub_233AEBAA4();
  if (os_log_type_enabled(v9, v10))
  {
    v51 = v10;
    log = v9;
    v11 = *(_QWORD *)(v0 + 328);
    v12 = *(_QWORD *)(v0 + 296);
    v13 = *(_QWORD *)(v0 + 304);
    v14 = *(_QWORD *)(v0 + 280);
    v15 = *(_QWORD *)(v0 + 288);
    v16 = swift_slowAlloc();
    v50 = swift_slowAlloc();
    *(_QWORD *)&v60[0] = v50;
    *(_DWORD *)v16 = 136315650;
    *(_QWORD *)(v0 + 216) = sub_233AD6E3C(0xD00000000000002BLL, 0x8000000233AEE630, (uint64_t *)v60);
    sub_233AEBAD4();
    *(_WORD *)(v16 + 12) = 2080;
    v55(v15, v11, v12);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v13 + 56))(v15, 0, 1, v12);
    sub_233ADF358(v15, v14, &qword_25610D938);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v13 + 48))(v14, 1, v12) == 1)
    {
      sub_233ADEF0C(*(_QWORD *)(v0 + 280));
      v17 = 0xE300000000000000;
      v46 = 7104878;
    }
    else
    {
      v21 = *(_QWORD *)(v0 + 312);
      v22 = *(_QWORD *)(v0 + 320);
      v24 = *(_QWORD *)(v0 + 296);
      v23 = *(_QWORD *)(v0 + 304);
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v23 + 32))(v22, *(_QWORD *)(v0 + 280), v24);
      v55(v21, v22, v24);
      v46 = sub_233AEB9C0();
      v17 = v25;
      (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v22, v24);
    }
    v56 = *(_BYTE *)(v0 + 145);
    v49 = *(_QWORD *)(v0 + 392);
    v48 = *(_OWORD *)(v0 + 376);
    v26 = *(_QWORD *)(v0 + 360);
    v47 = *(_QWORD *)(v0 + 368);
    v27 = *(_QWORD *)(v0 + 344);
    v28 = *(_QWORD *)(v0 + 352);
    v29 = *(_QWORD *)(v0 + 336);
    v45 = *(_QWORD *)(v0 + 328);
    v31 = *(_QWORD *)(v0 + 296);
    v30 = *(_QWORD *)(v0 + 304);
    sub_233ADEF0C(*(_QWORD *)(v0 + 288));
    *(_QWORD *)(v0 + 224) = sub_233AD6E3C(v46, v17, (uint64_t *)v60);
    sub_233AEBAD4();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v45, v31);
    *(_WORD *)(v16 + 22) = 2080;
    *(_QWORD *)(v0 + 80) = v29;
    *(_QWORD *)(v0 + 88) = v27;
    *(_QWORD *)(v0 + 96) = v28;
    *(_QWORD *)(v0 + 104) = v26;
    *(_QWORD *)(v0 + 112) = v47;
    *(_OWORD *)(v0 + 120) = v48;
    *(_QWORD *)(v0 + 136) = v49;
    *(_BYTE *)(v0 + 144) = v56;
    sub_233AD6470(v29, v27, v28);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v32 = sub_233AEB9C0();
    *(_QWORD *)(v0 + 232) = sub_233AD6E3C(v32, v33, (uint64_t *)v60);
    sub_233AEBAD4();
    swift_bridgeObjectRelease();
    sub_233AD64D4(v29, v27, v28);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_233AD64D4(v29, v27, v28);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_233AD2000, log, v51, "%s %s %s", (uint8_t *)v16, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x23493BE50](v50, -1, -1);
    MEMORY[0x23493BE50](v16, -1, -1);

  }
  else
  {
    v19 = *(_QWORD *)(v0 + 344);
    v18 = *(_QWORD *)(v0 + 352);
    v20 = *(_QWORD *)(v0 + 336);
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 304) + 8))(*(_QWORD *)(v0 + 328), *(_QWORD *)(v0 + 296));
    sub_233AD64D4(v20, v19, v18);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_233AD64D4(v20, v19, v18);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

  }
  v34 = *(_BYTE *)(v0 + 145);
  v35 = *(_QWORD *)(v0 + 384);
  v36 = *(_QWORD *)(v0 + 392);
  v57 = *(_OWORD *)(v0 + 352);
  v58 = *(_OWORD *)(v0 + 368);
  v53 = *(_OWORD *)(v0 + 336);
  v38 = *(_QWORD *)(v0 + 264);
  v37 = *(_QWORD *)(v0 + 272);
  v39 = *(_QWORD *)(v0 + 256);
  v59 = *(id *)(*(_QWORD *)(v0 + 248) + 64);
  v40 = sub_233AEB8C4();
  *(_QWORD *)(v0 + 400) = v40;
  v60[0] = v53;
  v60[1] = v57;
  v60[2] = v58;
  v61 = v35;
  v62 = v36;
  v63 = v34;
  v41 = sub_233AE2F28();
  *(_QWORD *)(v0 + 408) = v41;
  *(_QWORD *)(v0 + 16) = v0;
  *(_QWORD *)(v0 + 24) = sub_233ADC4DC;
  swift_continuation_init();
  *(_QWORD *)(v0 + 208) = v39;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)(v0 + 184));
  __swift_instantiateConcreteTypeFromMangledName(&qword_25610DA50);
  sub_233AEBA5C();
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v38 + 32))(boxed_opaque_existential_0, v37, v39);
  *(_QWORD *)(v0 + 152) = MEMORY[0x24BDAC760];
  v43 = (_QWORD *)(v0 + 152);
  v43[1] = 1107296256;
  v43[2] = sub_233ADBD1C;
  v43[3] = &block_descriptor_4;
  objc_msgSend(v59, sel_reportNewIncomingCallWithUUID_update_completion_, v40, v41, v43);
  return swift_continuation_await();
}

uint64_t sub_233ADC4DC()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 416) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_233ADC53C()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 400);

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_233ADC5CC()
{
  uint64_t v0;
  void *v1;
  void *v2;

  v1 = *(void **)(v0 + 408);
  v2 = *(void **)(v0 + 400);
  swift_willThrow();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void ConversationManager.reportConversationEvent(_:for:)(uint64_t a1, uint64_t a2)
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  _QWORD v21[3];
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v23 = a2;
  v22 = sub_233AEB8B8();
  v4 = MEMORY[0x24BDAC7A8](v22, v3);
  v21[2] = (char *)v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v4, v6);
  MEMORY[0x24BDAC7A8](v7, v8);
  v9 = sub_233AEB8E8();
  v24 = *(_QWORD *)(v9 - 8);
  v25 = v9;
  v11 = MEMORY[0x24BDAC7A8](v9, v10);
  v13 = MEMORY[0x24BDAC7A8](v11, v12);
  v15 = MEMORY[0x24BDAC7A8](v13, v14);
  MEMORY[0x24BDAC7A8](v15, v16);
  v17 = type metadata accessor for Conversation.Event();
  MEMORY[0x24BDAC7A8](v17, v18);
  sub_233ADEF4C(a1, (uint64_t)v21 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0));
  v20 = (char *)sub_233ADC804 + 4 * byte_233AEC790[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

void sub_233ADC804()
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
  os_unfair_lock_s *v13;
  void *v14;
  uint64_t v15;
  id v16;

  v3 = *(_QWORD *)v0;
  v4 = *(_QWORD *)(v0 + 8);
  v5 = *(_QWORD *)(v0 + 16);
  v6 = *(_QWORD *)(v0 + 24);
  v7 = *(_QWORD *)(v0 + 32);
  v8 = *(_QWORD *)(v0 + 40);
  *(_QWORD *)(v2 - 216) = *(_QWORD *)(v0 + 48);
  v9 = *(_QWORD *)(v0 + 56);
  *(_DWORD *)(v2 - 208) = *(unsigned __int8 *)(v0 + 64);
  v10 = *(_QWORD *)(*(_QWORD *)(v2 - 192) + 64);
  *(_QWORD *)(v2 - 200) = v9;
  *(_QWORD *)(v2 - 192) = v10;
  v11 = *(_QWORD *)(*(_QWORD *)(v2 - 184) + 16);
  v12 = v11 + *(_QWORD *)(*MEMORY[0x24BEE27A8] + *(_QWORD *)v11 + 16);
  v13 = (os_unfair_lock_s *)(v11 + ((*(unsigned int *)(*(_QWORD *)v11 + 48) + 3) & 0x1FFFFFFFCLL));
  os_unfair_lock_lock(v13);
  sub_233AD5294(v12, v1);
  os_unfair_lock_unlock(v13);
  v14 = (void *)sub_233AEB8C4();
  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v2 - 176) + 8))(v1, *(_QWORD *)(v2 - 168));
  *(_QWORD *)(v2 - 160) = v3;
  *(_QWORD *)(v2 - 152) = v4;
  *(_QWORD *)(v2 - 144) = v5;
  *(_QWORD *)(v2 - 136) = v6;
  *(_QWORD *)(v2 - 128) = v7;
  *(_QWORD *)(v2 - 120) = v8;
  v15 = *(_QWORD *)(v2 - 200);
  *(_QWORD *)(v2 - 112) = *(_QWORD *)(v2 - 216);
  *(_QWORD *)(v2 - 104) = v15;
  *(_BYTE *)(v2 - 96) = *(_DWORD *)(v2 - 208);
  v16 = sub_233AE2F28();
  sub_233AD64D4(v3, v4, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_msgSend(*(id *)(v2 - 192), sel_reportCallWithUUID_updated_, v14, v16);

}

uint64_t static ConversationManager.reportNewIncomingVoIPPushPayload(_:)(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;

  v1[20] = a1;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25610DA40);
  v1[21] = v2;
  v1[22] = *(_QWORD *)(v2 - 8);
  v1[23] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_233ADCC30()
{
  _QWORD *v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t *boxed_opaque_existential_0;
  _QWORD *v14;
  uint64_t v16;
  uint64_t v17;

  if (qword_25610D350 != -1)
    swift_once();
  v1 = sub_233AEB954();
  __swift_project_value_buffer(v1, (uint64_t)qword_25610E4F0);
  swift_bridgeObjectRetain_n();
  v2 = sub_233AEB93C();
  v3 = sub_233AEBAA4();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = swift_slowAlloc();
    v16 = swift_slowAlloc();
    v17 = v16;
    *(_DWORD *)v4 = 136315394;
    v0[18] = sub_233AD6E3C(0xD000000000000024, 0x8000000233AEE660, &v17);
    sub_233AEBAD4();
    *(_WORD *)(v4 + 12) = 2080;
    swift_bridgeObjectRetain();
    v5 = sub_233AEB96C();
    v7 = v6;
    swift_bridgeObjectRelease();
    v0[19] = sub_233AD6E3C(v5, v7, &v17);
    sub_233AEBAD4();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_233AD2000, v2, v3, "%s %s", (uint8_t *)v4, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x23493BE50](v16, -1, -1);
    MEMORY[0x23493BE50](v4, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  v9 = v0[22];
  v8 = v0[23];
  v10 = v0[21];
  v11 = (void *)objc_opt_self();
  v12 = sub_233AEB960();
  v0[24] = v12;
  v0[2] = v0;
  v0[3] = sub_233ADCF78;
  swift_continuation_init();
  v0[17] = v10;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v0 + 14);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25610DA50);
  sub_233AEBA5C();
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v9 + 32))(boxed_opaque_existential_0, v8, v10);
  v0[10] = MEMORY[0x24BDAC760];
  v14 = v0 + 10;
  v14[1] = 1107296256;
  v14[2] = sub_233ADBD1C;
  v14[3] = &block_descriptor_8;
  objc_msgSend(v11, sel_reportNewIncomingVoIPPushPayload_completion_, v12, v14);
  return swift_continuation_await();
}

uint64_t sub_233ADCF78()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 200) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_233ADCFD8()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_233ADD014()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 192);
  swift_willThrow();

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

Swift::Void __swiftcall ConversationManager.invalidate()()
{
  uint64_t v0;

  objc_msgSend(*(id *)(v0 + 64), sel_invalidate);
}

uint64_t ConversationManager.pendingConversationActions(of:for:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  os_unfair_lock_s *v26;
  uint64_t v27;
  void (*v28)(uint64_t, uint64_t);
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v38 = a2;
  v4 = sub_233AEB8E8();
  v36 = *(_QWORD *)(v4 - 8);
  v37 = v4;
  v6 = MEMORY[0x24BDAC7A8](v4, v5);
  v35 = (uint64_t)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6, v8);
  v34 = (char *)&v30 - v9;
  v10 = objc_msgSend(*(id *)(v2 + 64), sel_pendingTransactions);
  sub_233ADF30C(0, &qword_25610DA30);
  v11 = sub_233AEBA20();

  v12 = sub_233AD9CE8(v11);
  swift_bridgeObjectRelease();
  swift_retain();
  v13 = sub_233ADEA4C(v12, v2);
  swift_bridgeObjectRelease();
  swift_release();
  v39 = MEMORY[0x24BEE4AF8];
  if (v13 >> 62)
  {
LABEL_18:
    swift_bridgeObjectRetain();
    v14 = sub_233AEBC0C();
    swift_bridgeObjectRelease();
    if (v14)
      goto LABEL_3;
  }
  else
  {
    v14 = *(_QWORD *)((v13 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v14)
    {
LABEL_3:
      v15 = v13 & 0xC000000000000001;
      v16 = 4;
      v32 = v13;
      v33 = a1;
      v30 = v13 & 0xC000000000000001;
      v31 = v14;
      v17 = v36;
      while (1)
      {
        v18 = v16 - 4;
        if (v15)
        {
          v19 = (_QWORD *)MEMORY[0x23493B8D4](v16 - 4, v13);
          v20 = v16 - 3;
          if (__OFADD__(v18, 1))
            goto LABEL_17;
        }
        else
        {
          v19 = *(_QWORD **)(v13 + 8 * v16);
          swift_retain();
          v20 = v16 - 3;
          if (__OFADD__(v18, 1))
          {
LABEL_17:
            __break(1u);
            goto LABEL_18;
          }
        }
        if (*v19 == a1)
        {
          v21 = (char *)v19 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_conversationUUID;
          swift_beginAccess();
          v22 = v34;
          v23 = v37;
          (*(void (**)(char *, char *, uint64_t))(v17 + 16))(v34, v21, v37);
          v24 = *(_QWORD *)(v38 + 16);
          v25 = v24 + *(_QWORD *)(*MEMORY[0x24BEE27A8] + *(_QWORD *)v24 + 16);
          v26 = (os_unfair_lock_s *)(v24 + ((*(unsigned int *)(*(_QWORD *)v24 + 48) + 3) & 0x1FFFFFFFCLL));
          os_unfair_lock_lock(v26);
          v27 = v35;
          sub_233AD5294(v25, v35);
          os_unfair_lock_unlock(v26);
          LOBYTE(v26) = sub_233AEB8D0();
          v28 = *(void (**)(uint64_t, uint64_t))(v17 + 8);
          v28(v27, v23);
          v28((uint64_t)v22, v23);
          if ((v26 & 1) != 0)
          {
            sub_233AEBBB8();
            sub_233AEBBDC();
            sub_233AEBBE8();
            sub_233AEBBC4();
          }
          else
          {
            swift_release();
          }
          v13 = v32;
          a1 = v33;
          v15 = v30;
          v14 = v31;
        }
        else
        {
          swift_release();
        }
        ++v16;
        if (v20 == v14)
        {
          swift_bridgeObjectRelease();
          return v39;
        }
      }
    }
  }
  swift_bridgeObjectRelease();
  return MEMORY[0x24BEE4AF8];
}

uint64_t sub_233ADD384(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char isUniquelyReferenced_nonNull_native;
  void (*v10)(char *, uint64_t);
  id v11;
  char v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v2 = v1;
  v4 = sub_233AEB8E8();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = a1 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_conversationUUID;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  swift_getKeyPath();
  v16 = v2;
  sub_233ADF2B4(&qword_25610DA28, (uint64_t (*)(uint64_t))type metadata accessor for ConversationManager, (uint64_t)&protocol conformance descriptor for ConversationManager);
  swift_retain();
  sub_233AEB900();
  swift_release();
  v16 = v2;
  swift_getKeyPath();
  sub_233AEB918();
  swift_release();
  swift_beginAccess();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v15 = *(_QWORD *)(v2 + 80);
  *(_QWORD *)(v2 + 80) = 0x8000000000000000;
  sub_233ADDFCC(a1, (uint64_t)v7, isUniquelyReferenced_nonNull_native, &qword_25610DB78);
  *(_QWORD *)(v2 + 80) = v15;
  swift_bridgeObjectRelease();
  v10 = *(void (**)(char *, uint64_t))(v5 + 8);
  v10(v7, v4);
  swift_endAccess();
  v16 = v2;
  swift_getKeyPath();
  sub_233AEB90C();
  swift_release();
  v11 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(a1
                                                              + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_cxAction), sel_UUID));
  sub_233AEB8DC();

  swift_getKeyPath();
  v16 = v2;
  swift_retain();
  sub_233AEB900();
  swift_release();
  v16 = v2;
  swift_getKeyPath();
  sub_233AEB918();
  swift_release();
  swift_beginAccess();
  v12 = swift_isUniquelyReferenced_nonNull_native();
  v15 = *(_QWORD *)(v2 + 88);
  *(_QWORD *)(v2 + 88) = 0x8000000000000000;
  sub_233ADDFCC(a1, (uint64_t)v7, v12, &qword_25610DB78);
  *(_QWORD *)(v2 + 88) = v15;
  swift_bridgeObjectRelease();
  v10(v7, v4);
  swift_endAccess();
  v16 = v2;
  swift_getKeyPath();
  sub_233AEB90C();
  return swift_release();
}

uint64_t sub_233ADD698(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  id v7;
  id v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  id v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t result;
  uint64_t v20;
  uint64_t ObjectType;
  uint64_t v22;
  uint64_t v23[3];

  v3 = v2;
  if (qword_25610D350 != -1)
    swift_once();
  v6 = sub_233AEB954();
  __swift_project_value_buffer(v6, (uint64_t)qword_25610E4F0);
  v7 = a2;
  swift_retain_n();
  v8 = v7;
  v9 = sub_233AEB93C();
  v10 = sub_233AEBAA4();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = swift_slowAlloc();
    v22 = swift_slowAlloc();
    v23[0] = v22;
    *(_DWORD *)v11 = 136315650;
    v12 = sub_233AEBB70();
    sub_233AD6E3C(v12, v13, v23);
    sub_233AEBAD4();
    swift_bridgeObjectRelease();
    *(_WORD *)(v11 + 12) = 2080;
    sub_233ADF30C(0, &qword_25610DA48);
    v14 = v8;
    v15 = sub_233AEB9C0();
    sub_233AD6E3C(v15, v16, v23);
    sub_233AEBAD4();

    swift_bridgeObjectRelease();
    *(_WORD *)(v11 + 22) = 2080;
    type metadata accessor for ConversationAction();
    swift_retain();
    v17 = sub_233AEB9C0();
    sub_233AD6E3C(v17, v18, v23);
    sub_233AEBAD4();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_233AD2000, v9, v10, "%s %s %s", (uint8_t *)v11, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x23493BE50](v22, -1, -1);
    MEMORY[0x23493BE50](v11, -1, -1);

  }
  else
  {

    swift_release_n();
  }
  sub_233ADD384(a1);
  swift_beginAccess();
  result = MEMORY[0x23493BED4](v3 + 32);
  if (result)
  {
    v20 = *(_QWORD *)(v3 + 40);
    ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v20 + 32))(v3, a1, ObjectType, v20);
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t ConversationManager.deinit()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;

  swift_release();
  swift_bridgeObjectRelease();
  sub_233ADEF90(v0 + 32);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v1 = *(_QWORD *)(v0 + 112);
  v2 = *(_QWORD *)(v0 + 120);
  swift_bridgeObjectRelease();
  sub_233AD4828(v1, v2);
  swift_bridgeObjectRelease();
  v3 = v0 + OBJC_IVAR____TtC20LiveCommunicationKit19ConversationManager___observationRegistrar;
  v4 = sub_233AEB930();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  return v0;
}

uint64_t ConversationManager.__deallocating_deinit()
{
  ConversationManager.deinit();
  return swift_deallocClassInstance();
}

unint64_t sub_233ADDA7C(uint64_t a1)
{
  uint64_t v2;

  sub_233AEB8E8();
  sub_233ADF2B4(&qword_25610DB80, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  v2 = sub_233AEB978();
  return sub_233ADDAE8(a1, v2);
}

unint64_t sub_233ADDAE8(uint64_t a1, uint64_t a2)
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
  v5 = sub_233AEB8E8();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
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
      sub_233ADF2B4(&qword_25610DB88, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA98]);
      v14 = sub_233AEB990();
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
      if ((v14 & 1) != 0)
        break;
      v10 = (v10 + 1) & v11;
    }
    while (((*(_QWORD *)(v3 + 64 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
  }
  return v10;
}

uint64_t sub_233ADDC28(uint64_t a1, int a2, uint64_t *a3)
{
  uint64_t *v3;
  uint64_t *v5;
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
  unint64_t v17;
  uint64_t v18;
  uint64_t result;
  int64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  int64_t v24;
  _QWORD *v25;
  unint64_t v26;
  int64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
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
  uint64_t i;
  int v44;

  v5 = v3;
  v7 = sub_233AEB8E8();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8]();
  v10 = (char *)&v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *v3;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  v44 = a2;
  v12 = sub_233AEBC24();
  v13 = v12;
  if (!*(_QWORD *)(v11 + 16))
    goto LABEL_41;
  v14 = 1 << *(_BYTE *)(v11 + 32);
  v15 = *(_QWORD *)(v11 + 64);
  v42 = (_QWORD *)(v11 + 64);
  if (v14 < 64)
    v16 = ~(-1 << v14);
  else
    v16 = -1;
  v17 = v16 & v15;
  v40 = v3;
  v41 = (unint64_t)(v14 + 63) >> 6;
  v18 = v12 + 64;
  result = swift_retain();
  v20 = 0;
  for (i = v11; ; v11 = i)
  {
    if (v17)
    {
      v22 = __clz(__rbit64(v17));
      v17 &= v17 - 1;
      v23 = v22 | (v20 << 6);
      goto LABEL_22;
    }
    v24 = v20 + 1;
    if (__OFADD__(v20, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v24 >= v41)
      break;
    v25 = v42;
    v26 = v42[v24];
    ++v20;
    if (!v26)
    {
      v20 = v24 + 1;
      if (v24 + 1 >= v41)
        goto LABEL_34;
      v26 = v42[v20];
      if (!v26)
      {
        v27 = v24 + 2;
        if (v27 >= v41)
        {
LABEL_34:
          swift_release();
          v5 = v40;
          if ((v44 & 1) == 0)
            goto LABEL_41;
          goto LABEL_37;
        }
        v26 = v42[v27];
        if (!v26)
        {
          while (1)
          {
            v20 = v27 + 1;
            if (__OFADD__(v27, 1))
              goto LABEL_43;
            if (v20 >= v41)
              goto LABEL_34;
            v26 = v42[v20];
            ++v27;
            if (v26)
              goto LABEL_21;
          }
        }
        v20 = v27;
      }
    }
LABEL_21:
    v17 = (v26 - 1) & v26;
    v23 = __clz(__rbit64(v26)) + (v20 << 6);
LABEL_22:
    v28 = *(_QWORD *)(v8 + 72);
    v29 = *(_QWORD *)(v11 + 48) + v28 * v23;
    if ((v44 & 1) != 0)
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v8 + 32))(v10, v29, v7);
      v30 = *(_QWORD *)(*(_QWORD *)(v11 + 56) + 8 * v23);
    }
    else
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v8 + 16))(v10, v29, v7);
      v30 = *(_QWORD *)(*(_QWORD *)(v11 + 56) + 8 * v23);
      swift_retain();
    }
    sub_233ADF2B4(&qword_25610DB80, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
    result = sub_233AEB978();
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
          goto LABEL_42;
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
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v8 + 32))(*(_QWORD *)(v13 + 48) + v28 * v21, v10, v7);
    *(_QWORD *)(*(_QWORD *)(v13 + 56) + 8 * v21) = v30;
    ++*(_QWORD *)(v13 + 16);
  }
  swift_release();
  v5 = v40;
  v25 = v42;
  if ((v44 & 1) == 0)
    goto LABEL_41;
LABEL_37:
  v38 = 1 << *(_BYTE *)(v11 + 32);
  if (v38 >= 64)
    bzero(v25, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v25 = -1 << v38;
  *(_QWORD *)(v11 + 16) = 0;
LABEL_41:
  result = swift_release();
  *v5 = v13;
  return result;
}

uint64_t sub_233ADDFC0(uint64_t a1, uint64_t a2, char a3)
{
  return sub_233ADDFCC(a1, a2, a3, &qword_25610DB98);
}

uint64_t sub_233ADDFCC(uint64_t a1, uint64_t a2, char a3, uint64_t *a4)
{
  _QWORD *v4;
  _QWORD **v6;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  _QWORD *v13;
  char v14;
  unint64_t v15;
  uint64_t v16;
  _BOOL8 v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t result;
  unint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t v27;

  v6 = (_QWORD **)v4;
  v27 = a1;
  v9 = sub_233AEB8E8();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8]();
  v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = (_QWORD *)*v4;
  v15 = sub_233ADDA7C(a2);
  v16 = v13[2];
  v17 = (v14 & 1) == 0;
  v18 = v16 + v17;
  if (__OFADD__(v16, v17))
  {
    __break(1u);
    goto LABEL_14;
  }
  v19 = v14;
  v20 = v13[3];
  if (v20 >= v18 && (a3 & 1) != 0)
  {
LABEL_7:
    v21 = *v6;
    if ((v19 & 1) != 0)
    {
LABEL_8:
      v22 = v21[7];
      result = swift_release();
      *(_QWORD *)(v22 + 8 * v15) = v27;
      return result;
    }
    goto LABEL_11;
  }
  if (v20 >= v18 && (a3 & 1) == 0)
  {
    sub_233ADE1D4(a4);
    goto LABEL_7;
  }
  sub_233ADDC28(v18, a3 & 1, a4);
  v24 = sub_233ADDA7C(a2);
  if ((v19 & 1) != (v25 & 1))
  {
LABEL_14:
    result = sub_233AEBCE4();
    __break(1u);
    return result;
  }
  v15 = v24;
  v21 = *v6;
  if ((v19 & 1) != 0)
    goto LABEL_8;
LABEL_11:
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, a2, v9);
  return sub_233ADE13C(v15, (uint64_t)v12, v27, v21);
}

uint64_t sub_233ADE13C(unint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  a4[(a1 >> 6) + 8] |= 1 << a1;
  v8 = a4[6];
  v9 = sub_233AEB8E8();
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

void *sub_233ADE1D4(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *result;
  unint64_t v11;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  int64_t v28;

  v3 = sub_233AEB8E8();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(a1);
  v26 = v1;
  v7 = *v1;
  v8 = sub_233AEBC18();
  v9 = v8;
  if (!*(_QWORD *)(v7 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v26 = v9;
    return result;
  }
  result = (void *)(v8 + 64);
  v11 = (unint64_t)((1 << *(_BYTE *)(v9 + 32)) + 63) >> 6;
  if (v9 != v7 || (unint64_t)result >= v7 + 64 + 8 * v11)
    result = memmove(result, (const void *)(v7 + 64), 8 * v11);
  v27 = v7 + 64;
  v13 = 0;
  *(_QWORD *)(v9 + 16) = *(_QWORD *)(v7 + 16);
  v14 = 1 << *(_BYTE *)(v7 + 32);
  v15 = -1;
  if (v14 < 64)
    v15 = ~(-1 << v14);
  v16 = v15 & *(_QWORD *)(v7 + 64);
  v28 = (unint64_t)(v14 + 63) >> 6;
  while (1)
  {
    if (v16)
    {
      v17 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      v18 = v17 | (v13 << 6);
      goto LABEL_12;
    }
    v22 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v28)
      goto LABEL_26;
    v23 = *(_QWORD *)(v27 + 8 * v22);
    ++v13;
    if (!v23)
    {
      v13 = v22 + 1;
      if (v22 + 1 >= v28)
        goto LABEL_26;
      v23 = *(_QWORD *)(v27 + 8 * v13);
      if (!v23)
        break;
    }
LABEL_25:
    v16 = (v23 - 1) & v23;
    v18 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_12:
    v19 = *(_QWORD *)(v4 + 72) * v18;
    (*(void (**)(char *, unint64_t, uint64_t))(v4 + 16))(v6, *(_QWORD *)(v7 + 48) + v19, v3);
    v20 = 8 * v18;
    v21 = *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v18);
    (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))(*(_QWORD *)(v9 + 48) + v19, v6, v3);
    *(_QWORD *)(*(_QWORD *)(v9 + 56) + v20) = v21;
    result = (void *)swift_retain();
  }
  v24 = v22 + 2;
  if (v24 >= v28)
    goto LABEL_26;
  v23 = *(_QWORD *)(v27 + 8 * v24);
  if (v23)
  {
    v13 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    v13 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v13 >= v28)
      goto LABEL_26;
    v23 = *(_QWORD *)(v27 + 8 * v13);
    ++v24;
    if (v23)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_233ADE404(unint64_t a1)
{
  unint64_t *v1;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v3 = sub_233AEBC0C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v4 = *v1;
  if (*v1 >> 62)
  {
    swift_bridgeObjectRetain();
    v5 = sub_233AEBC0C();
    swift_bridgeObjectRelease();
    v6 = v5 + v3;
    if (!__OFADD__(v5, v3))
      goto LABEL_5;
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  v6 = v5 + v3;
  if (__OFADD__(v5, v3))
    goto LABEL_23;
LABEL_5:
  v4 = *v1;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *v1 = v4;
  v5 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v4 & 0x8000000000000000) == 0 && (v4 & 0x4000000000000000) == 0)
  {
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
    if (v6 <= *(_QWORD *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      goto LABEL_15;
    v5 = 1;
  }
  if (v4 >> 62)
    goto LABEL_25;
  v9 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v9 <= v6)
      v9 = v6;
    swift_bridgeObjectRetain();
    v4 = MEMORY[0x23493B8E0](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    *v1 = v4;
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    result = sub_233ADE5BC(v8 + 8 * *(_QWORD *)(v8 + 16) + 32, (*(_QWORD *)(v8 + 24) >> 1) - *(_QWORD *)(v8 + 16), a1);
    if (v11 >= v3)
      break;
LABEL_24:
    __break(1u);
LABEL_25:
    swift_bridgeObjectRetain();
    v9 = sub_233AEBC0C();
    swift_bridgeObjectRelease();
  }
  if (v11 < 1)
    goto LABEL_19;
  v12 = *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  v13 = __OFADD__(v12, v11);
  v14 = v12 + v11;
  if (!v13)
  {
    *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
LABEL_19:
    swift_bridgeObjectRelease();
    return sub_233AEBA38();
  }
  __break(1u);
  return result;
}

uint64_t sub_233ADE5BC(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t i;
  void (*v12)(_QWORD *);
  id *v13;
  id v14;
  uint64_t result;
  void (*v16[4])(id *);

  v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_233AEBC0C();
    swift_bridgeObjectRelease();
    if (!v7)
      return a3;
  }
  else
  {
    v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v7)
      return a3;
  }
  if (!a1)
    goto LABEL_19;
  v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    v10 = sub_233AEBC0C();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_233ADF39C();
        swift_bridgeObjectRetain();
        for (i = 0; i != v7; ++i)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_25610DBB0);
          v12 = sub_233ADE7C4(v16, i, a3);
          v14 = *v13;
          ((void (*)(void (**)(id *), _QWORD))v12)(v16, 0);
          *(_QWORD *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v9 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_233ADF30C(0, &qword_25610DA48);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  result = sub_233AEBC3C();
  __break(1u);
  return result;
}

void (*sub_233ADE7C4(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(_QWORD *a1)
{
  void (*v6)(id *);

  v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((_QWORD *)v6 + 4) = sub_233ADE844(v6, a2, a3);
  return sub_233ADE818;
}

void sub_233ADE818(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_233ADE844(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  void (*v3)(id *);
  id v4;

  v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    v4 = (id)MEMORY[0x23493B8D4](a2, a3);
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
    return sub_233ADE8B0;
  }
  __break(1u);
  return result;
}

void sub_233ADE8B0(id *a1)
{

}

void sub_233ADE8B8(unint64_t a1, os_unfair_lock_s *a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  id v10;
  void *v11;
  os_unfair_lock_s *v12;
  uint64_t *v13;
  unint64_t v14;
  _QWORD v15[3];

  v3 = v2;
  v5 = a1;
  if (a1 >> 62)
    goto LABEL_14;
  v6 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (v6)
  {
    v15[2] = MEMORY[0x24BEE4AF8];
    sub_233AEBBD0();
    if (v6 < 0)
    {
      __break(1u);
LABEL_16:
      os_unfair_lock_unlock(a2);
      __break(1u);
      return;
    }
    v7 = 0;
    v14 = v5 & 0xC000000000000001;
    v8 = *(_QWORD *)&a2[4]._os_unfair_lock_opaque;
    v9 = v5;
    while (v6 != v7)
    {
      if (v14)
        v10 = (id)MEMORY[0x23493B8D4](v7, v5);
      else
        v10 = *(id *)(v5 + 8 * v7 + 32);
      v11 = v10;
      v12 = *(os_unfair_lock_s **)(v8 + 16);
      v13 = (uint64_t *)&v12[4];
      a2 = v12 + 6;
      os_unfair_lock_lock(v12 + 6);
      sub_233AD4420(v13, v11, (uint64_t)v15);
      if (v3)
        goto LABEL_16;
      v3 = 0;
      ++v7;
      os_unfair_lock_unlock(a2);
      a2 = (os_unfair_lock_s *)v15[0];

      sub_233AEBBB8();
      sub_233AEBBDC();
      sub_233AEBBE8();
      sub_233AEBBC4();
      v5 = v9;
      if (v6 == v7)
        return;
    }
    __break(1u);
LABEL_14:
    swift_bridgeObjectRetain();
    v6 = sub_233AEBC0C();
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_233ADEA4C(unint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t i;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  char v15;
  _QWORD v17[3];
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v3 = v2;
  v6 = sub_233AEB8E8();
  v19 = *(_QWORD *)(v6 - 8);
  v20 = v6;
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = MEMORY[0x24BEE4AF8];
  if (a1 >> 62)
  {
LABEL_18:
    swift_bridgeObjectRetain();
    v9 = sub_233AEBC0C();
    if (v9)
      goto LABEL_3;
  }
  else
  {
    v9 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v9)
    {
LABEL_3:
      v18 = a1 & 0xC000000000000001;
      v17[1] = v3;
      v17[2] = a2 + OBJC_IVAR____TtC20LiveCommunicationKit19ConversationManager___observationRegistrar;
      swift_beginAccess();
      for (i = 4; ; ++i)
      {
        v3 = i - 4;
        if (v18)
          v11 = (id)MEMORY[0x23493B8D4](i - 4, a1);
        else
          v11 = *(id *)(a1 + 8 * i);
        v12 = v11;
        v13 = i - 3;
        if (__OFADD__(v3, 1))
        {
          __break(1u);
          goto LABEL_18;
        }
        v14 = objc_msgSend(v11, sel_UUID);
        sub_233AEB8DC();

        swift_getKeyPath();
        v21 = a2;
        sub_233ADF2B4(&qword_25610DA28, (uint64_t (*)(uint64_t))type metadata accessor for ConversationManager, (uint64_t)&protocol conformance descriptor for ConversationManager);
        sub_233AEB900();
        swift_release();
        if (*(_QWORD *)(*(_QWORD *)(a2 + 88) + 16))
        {
          swift_bridgeObjectRetain();
          sub_233ADDA7C((uint64_t)v8);
          if ((v15 & 1) != 0)
          {
            swift_retain();
            swift_bridgeObjectRelease();
            (*(void (**)(char *, uint64_t))(v19 + 8))(v8, v20);

            MEMORY[0x23493B760]();
            if (*(_QWORD *)((v22 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v22 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
              sub_233AEBA44();
            sub_233AEBA50();
            sub_233AEBA38();
            goto LABEL_6;
          }
          swift_bridgeObjectRelease();
        }
        (*(void (**)(char *, uint64_t))(v19 + 8))(v8, v20);

LABEL_6:
        if (v13 == v9)
        {
          swift_bridgeObjectRelease();
          return v22;
        }
      }
    }
  }
  swift_bridgeObjectRelease();
  return MEMORY[0x24BEE4AF8];
}

uint64_t sub_233ADECE4(uint64_t *a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v20;
  id v21;
  __int128 v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  char v28;
  uint64_t v29;

  v5 = *a1;
  v4 = a1[1];
  v6 = a1[2];
  v7 = a1[3];
  v8 = a1[7];
  swift_bridgeObjectRetain();
  sub_233AD479C(v6, v7);
  swift_bridgeObjectRetain();
  if ((objc_msgSend(a2, sel_isGreenTea) & 1) != 0)
    v9 = 0;
  else
    v9 = *((_BYTE *)a1 + 48);
  v20 = v9;
  v10 = a1[4];
  v11 = a1[5];
  v12 = *((_BYTE *)a1 + 49);
  v13 = sub_233AD4950();
  v21 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDB7900]), sel_initWithConfiguration_, v13);

  type metadata accessor for ConversationCache();
  v14 = swift_allocObject();
  v15 = v5;
  v16 = sub_233AD9098(MEMORY[0x24BEE4AF8], &qword_25610DBA8, &qword_25610DB98);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25610DB70);
  v17 = swift_allocObject();
  *(_DWORD *)(v17 + 24) = 0;
  *(_QWORD *)(v17 + 16) = v16;
  *(_QWORD *)(v14 + 16) = v17;
  swift_bridgeObjectRetain();
  sub_233AD479C(v6, v7);
  sub_233AD4828(v6, v7);
  swift_bridgeObjectRelease();
  *(_QWORD *)&v22 = v15;
  *((_QWORD *)&v22 + 1) = v4;
  v23 = v6;
  v24 = v7;
  v25 = v10;
  v26 = v11;
  v27 = v20;
  v28 = v12;
  v29 = v8;
  type metadata accessor for ConversationManager();
  v18 = swift_allocObject();
  sub_233AD9EBC(&v22, v21, v14);
  swift_bridgeObjectRelease();
  sub_233AD4828(v6, v7);
  swift_bridgeObjectRelease();
  return v18;
}

uint64_t *__swift_allocate_boxed_opaque_existential_0(uint64_t *a1)
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

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  return sub_233AD7588(a2 + 32, a1 + 32);
}

uint64_t block_destroy_helper(uint64_t a1)
{
  return __swift_destroy_boxed_opaque_existential_0(a1 + 32);
}

uint64_t sub_233ADEF0C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25610D938);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_233ADEF4C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for Conversation.Event();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_233ADEF90(uint64_t a1)
{
  swift_unknownObjectWeakDestroy();
  return a1;
}

uint64_t sub_233ADEFB4@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;

  v3 = *a1;
  v4 = *a1 + 32;
  swift_beginAccess();
  result = MEMORY[0x23493BED4](v4);
  v6 = *(_QWORD *)(v3 + 40);
  *a2 = result;
  a2[1] = v6;
  return result;
}

uint64_t sub_233ADF00C(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *a2;
  swift_beginAccess();
  *(_QWORD *)(v3 + 40) = v2;
  return swift_unknownObjectWeakAssign();
}

uint64_t sub_233ADF064()
{
  return type metadata accessor for ConversationManager();
}

uint64_t sub_233ADF06C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_233AEB930();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for ConversationManager()
{
  return swift_lookUpClassMethod();
}

_QWORD *__swift_project_boxed_opaque_existential_0(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_233ADF168(void *a1)
{
  uint64_t v1;

  return sub_233ADB810(a1, v1, (void (*)(_QWORD))type metadata accessor for StartConversationAction, (uint64_t (*)(void))sub_233AD7D78);
}

uint64_t sub_233ADF19C(void *a1)
{
  return sub_233ADB380(a1, (void (*)(_QWORD))type metadata accessor for JoinConversationAction, (uint64_t)"onManagerPerformAnswerCallAction(_:)", 36);
}

uint64_t sub_233ADF1C4(void *a1)
{
  return sub_233ADB380(a1, (void (*)(_QWORD))type metadata accessor for EndConversationAction, (uint64_t)"onManagerPerformEndCallAction(_:)", 33);
}

uint64_t sub_233ADF1EC(void *a1)
{
  uint64_t v1;

  return sub_233ADB810(a1, v1, (void (*)(_QWORD))type metadata accessor for PauseConversationAction, (uint64_t (*)(void))sub_233AD3CF0);
}

uint64_t sub_233ADF224(void *a1)
{
  uint64_t v1;

  return sub_233ADB810(a1, v1, (void (*)(_QWORD))type metadata accessor for MuteConversationAction, (uint64_t (*)(void))sub_233AEB500);
}

uint64_t sub_233ADF258(void *a1)
{
  uint64_t v1;

  return sub_233ADB810(a1, v1, (void (*)(_QWORD))type metadata accessor for PlayToneAction, (uint64_t (*)(void))sub_233AE6ABC);
}

uint64_t sub_233ADF29C()
{
  uint64_t v0;

  return sub_233AD9B54(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_233ADF2B4(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x23493BDC0](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_233ADF2F4()
{
  uint64_t v0;

  return sub_233AD98F8(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_233ADF30C(uint64_t a1, unint64_t *a2)
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

uint64_t sub_233ADF344()
{
  return sub_233ADF42C();
}

uint64_t sub_233ADF358(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

unint64_t sub_233ADF39C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25610DBB8;
  if (!qword_25610DBB8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25610DBB0);
    result = MEMORY[0x23493BDC0](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&qword_25610DBB8);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23493BDB4](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_233ADF42C()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)(v0 + 16) + 24) = *(_QWORD *)(v0 + 24);
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t JoinConversationAction.__allocating_init(conversationUUID:)(uint64_t a1)
{
  uint64_t v2;

  v2 = swift_allocObject();
  JoinConversationAction.init(conversationUUID:)(a1);
  return v2;
}

uint64_t JoinConversationAction.init(conversationUUID:)(uint64_t a1)
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
  uint64_t v12;
  char *v13;
  id v14;
  void *v15;
  id v16;
  _QWORD *v17;
  uint64_t v19;

  v2 = v1;
  v4 = sub_233AEB8B8();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4, v6);
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_233AEB8E8();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9, v11);
  v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = objc_allocWithZone(MEMORY[0x24BDB7878]);
  v15 = (void *)sub_233AEB8C4();
  v16 = objc_msgSend(v14, sel_initWithCallUUID_, v15);

  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v13, a1, v9);
  sub_233AEB8A0();
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(a1, v9);
  *(_QWORD *)(v2 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_cxAction) = v16;
  (*(void (**)(uint64_t, char *, uint64_t))(v10 + 32))(v2 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_conversationUUID, v13, v9);
  v17 = (_QWORD *)(v2 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_state);
  *v17 = 0;
  v17[1] = 0;
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))(v2 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_timeoutDate, v8, v4);
  return v2;
}

void JoinConversationAction.fulfill(dateConnected:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  _QWORD v20[2];
  uint64_t v21;
  uint64_t v22;

  v3 = sub_233AEB8B8();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3, v5);
  v7 = (char *)v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_25610D350 != -1)
    swift_once();
  v8 = sub_233AEB954();
  __swift_project_value_buffer(v8, (uint64_t)qword_25610E4F0);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v7, a1, v3);
  swift_retain_n();
  v9 = sub_233AEB93C();
  v10 = sub_233AEBAA4();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = swift_slowAlloc();
    v20[1] = a1;
    v12 = v11;
    v20[0] = swift_slowAlloc();
    v21 = v1;
    v22 = v20[0];
    *(_DWORD *)v12 = 136315394;
    swift_retain();
    v13 = sub_233AEB9C0();
    v21 = sub_233AD6E3C(v13, v14, &v22);
    sub_233AEBAD4();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v12 + 12) = 2080;
    sub_233AD8570();
    v15 = sub_233AEBCC0();
    v21 = sub_233AD6E3C(v15, v16, &v22);
    sub_233AEBAD4();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
    _os_log_impl(&dword_233AD2000, v9, v10, "Fulfilling action %s with dateConnected %s", (uint8_t *)v12, 0x16u);
    v17 = v20[0];
    swift_arrayDestroy();
    MEMORY[0x23493BE50](v17, -1, -1);
    MEMORY[0x23493BE50](v12, -1, -1);
  }
  else
  {
    swift_release_n();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  }

  objc_opt_self();
  v18 = (void *)swift_dynamicCastObjCClassUnconditional();
  v19 = (void *)sub_233AEB894();
  objc_msgSend(v18, sel_fulfillWithDateConnected_, v19);

}

void sub_233ADF904()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t JoinConversationAction.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_conversationUUID;
  v2 = sub_233AEB8E8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  sub_233AD3F34(*(_QWORD *)(v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_state), *(_QWORD *)(v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_state + 8));
  v3 = v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_timeoutDate;
  v4 = sub_233AEB8B8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

  return v0;
}

uint64_t JoinConversationAction.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_conversationUUID;
  v2 = sub_233AEB8E8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  sub_233AD3F34(*(_QWORD *)(v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_state), *(_QWORD *)(v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_state + 8));
  v3 = v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_timeoutDate;
  v4 = sub_233AEB8B8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

  return swift_deallocClassInstance();
}

uint64_t sub_233ADFA7C()
{
  return type metadata accessor for JoinConversationAction();
}

uint64_t type metadata accessor for JoinConversationAction()
{
  uint64_t result;

  result = qword_25610DBE8;
  if (!qword_25610DBE8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_233ADFAC0()
{
  return swift_updateClassMetadata2();
}

uint64_t method lookup function for JoinConversationAction()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of JoinConversationAction.__allocating_init(conversationUUID:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 120))();
}

void Conversation.Event.hash(into:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;

  v1 = sub_233AEB8B8();
  MEMORY[0x24BDAC7A8](v1, v2);
  v3 = type metadata accessor for Conversation.Event();
  MEMORY[0x24BDAC7A8](v3, v4);
  sub_233ADEF4C(v0, (uint64_t)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  v6 = (char *)sub_233ADFBD4 + 4 * byte_233AEC960[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_233ADFBD4()
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

  v3 = *(_QWORD *)v1;
  v4 = *(_QWORD *)(v1 + 8);
  v5 = *(_QWORD *)(v1 + 16);
  v6 = *(_QWORD *)(v1 + 24);
  v7 = *(_QWORD *)(v1 + 32);
  v8 = *(_QWORD *)(v1 + 40);
  v9 = *(_QWORD *)(v1 + 48);
  v10 = *(_QWORD *)(v1 + 56);
  *(_DWORD *)(v2 - 156) = *(unsigned __int8 *)(v1 + 64);
  sub_233AEBCFC();
  *(_QWORD *)(v2 - 152) = v3;
  *(_QWORD *)(v2 - 144) = v4;
  *(_QWORD *)(v2 - 136) = v5;
  *(_QWORD *)(v2 - 128) = v6;
  *(_QWORD *)(v2 - 120) = v7;
  *(_QWORD *)(v2 - 112) = v8;
  *(_QWORD *)(v2 - 104) = v9;
  *(_QWORD *)(v2 - 96) = v10;
  *(_BYTE *)(v2 - 88) = *(_DWORD *)(v2 - 156);
  Conversation.Update.hash(into:)(v0);
  sub_233AD64D4(v3, v4, v5);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t type metadata accessor for Conversation.Event()
{
  uint64_t result;

  result = qword_25610DDC8;
  if (!qword_25610DDC8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_233ADFD98(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_233ADFDD4 + 4 * byte_233AEC964[a1]))(0xD000000000000013, 0x8000000233AEEA50);
}

uint64_t sub_233ADFDD4()
{
  uint64_t v0;

  return v0 + 12;
}

unint64_t sub_233ADFDFC()
{
  return 0xD000000000000011;
}

uint64_t sub_233ADFE18()
{
  unsigned __int8 *v0;

  return sub_233ADFD98(*v0);
}

uint64_t sub_233ADFE20@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_233AE2A5C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_233ADFE44()
{
  return 0;
}

void sub_233ADFE50(_BYTE *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_233ADFE5C()
{
  sub_233AE16F0();
  return sub_233AEBD38();
}

uint64_t sub_233ADFE84()
{
  sub_233AE16F0();
  return sub_233AEBD44();
}

uint64_t sub_233ADFEAC()
{
  return 1;
}

uint64_t sub_233ADFEBC()
{
  return 12383;
}

void sub_233ADFECC(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_233ADFED8()
{
  sub_233AE17BC();
  return sub_233AEBD38();
}

uint64_t sub_233ADFF00()
{
  sub_233AE17BC();
  return sub_233AEBD44();
}

BOOL sub_233ADFF28(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_233ADFF40()
{
  _BYTE *v0;

  if (*v0)
    return 12639;
  else
    return 12383;
}

uint64_t sub_233ADFF5C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_233AE2BF4(a1, a2);
  *a3 = result;
  return result;
}

void sub_233ADFF80(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_233ADFF8C()
{
  sub_233AE1734();
  return sub_233AEBD38();
}

uint64_t sub_233ADFFB4()
{
  sub_233AE1734();
  return sub_233AEBD44();
}

uint64_t sub_233ADFFDC()
{
  sub_233AE1800();
  return sub_233AEBD38();
}

uint64_t sub_233AE0004()
{
  sub_233AE1800();
  return sub_233AEBD44();
}

uint64_t sub_233AE002C()
{
  sub_233AEBCF0();
  sub_233AEBCFC();
  return sub_233AEBD14();
}

uint64_t sub_233AE006C()
{
  return sub_233AEBCFC();
}

uint64_t sub_233AE0090()
{
  sub_233AEBCF0();
  sub_233AEBCFC();
  return sub_233AEBD14();
}

uint64_t sub_233AE00CC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  char v5;
  uint64_t result;
  char v7;

  if (a1 == 12383 && a2 == 0xE200000000000000)
  {
    result = swift_bridgeObjectRelease();
    v7 = 0;
  }
  else
  {
    v5 = sub_233AEBCCC();
    result = swift_bridgeObjectRelease();
    v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_233AE0148()
{
  sub_233AE1844();
  return sub_233AEBD38();
}

uint64_t sub_233AE0170()
{
  sub_233AE1844();
  return sub_233AEBD44();
}

void Conversation.Event.encode(to:)(_QWORD *a1)
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
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  char *v26;
  _QWORD v27[5];
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25610DCA0);
  v33 = *(_QWORD *)(v2 - 8);
  v34 = v2;
  MEMORY[0x24BDAC7A8](v2, v3);
  v32 = (char *)v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_25610DCA8);
  v30 = *(_QWORD *)(v31 - 8);
  MEMORY[0x24BDAC7A8](v31, v5);
  v29 = (char *)v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_25610DCB0);
  v27[4] = *(_QWORD *)(v28 - 8);
  MEMORY[0x24BDAC7A8](v28, v7);
  v27[3] = (char *)v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_233AEB8B8();
  v36 = *(_QWORD *)(v9 - 8);
  v37 = v9;
  v11 = MEMORY[0x24BDAC7A8](v9, v10);
  v35 = (char *)v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x24BDAC7A8](v11, v13);
  v27[2] = (char *)v27 - v15;
  MEMORY[0x24BDAC7A8](v14, v16);
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_25610DCB8);
  v27[1] = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17, v18);
  v19 = type metadata accessor for Conversation.Event();
  MEMORY[0x24BDAC7A8](v19, v20);
  v22 = (char *)v27 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_25610DCC0);
  v38 = *(_QWORD *)(v41 - 8);
  MEMORY[0x24BDAC7A8](v41, v23);
  v25 = (char *)v27 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_233AE16F0();
  v40 = v25;
  sub_233AEBD2C();
  sub_233ADEF4C(v39, (uint64_t)v22);
  v26 = (char *)sub_233AE0448 + 4 * byte_233AEC968[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_233AE0448()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;

  v5 = *v1;
  v4 = v1[1];
  *(_QWORD *)(v3 - 184) = *v1;
  v6 = v1[2];
  *(_QWORD *)(v3 - 232) = v1[3];
  *(_QWORD *)(v3 - 224) = v4;
  v7 = v1[4];
  v8 = v1[5];
  v9 = v1[6];
  *(_QWORD *)(v3 - 216) = v1[7];
  *(_QWORD *)(v3 - 208) = v6;
  v10 = *((_BYTE *)v1 + 64);
  *(_BYTE *)(v3 - 160) = 0;
  sub_233AE1844();
  sub_233AEBC90();
  *(_QWORD *)(v3 - 160) = v5;
  v12 = *(_QWORD *)(v3 - 224);
  v11 = *(_QWORD *)(v3 - 216);
  *(_QWORD *)(v3 - 152) = v12;
  *(_QWORD *)(v3 - 144) = v6;
  *(_QWORD *)(v3 - 136) = *(_QWORD *)(v3 - 232);
  *(_QWORD *)(v3 - 128) = v7;
  *(_QWORD *)(v3 - 120) = v8;
  *(_QWORD *)(v3 - 112) = v9;
  *(_QWORD *)(v3 - 104) = v11;
  *(_BYTE *)(v3 - 96) = v10;
  sub_233AE1888();
  sub_233AEBCB4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 312) + 8))(v0, v2);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v3 - 192) + 8))(*(_QWORD *)(v3 - 176), *(_QWORD *)(v3 - 168));
  sub_233AD64D4(*(_QWORD *)(v3 - 184), v12, *(_QWORD *)(v3 - 208));
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t Conversation.Event.hashValue.getter()
{
  sub_233AEBCF0();
  Conversation.Event.hash(into:)();
  return sub_233AEBD14();
}

uint64_t Conversation.Event.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t *v42;
  _QWORD v44[6];
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  char *v52;
  uint64_t v53;
  char *v54;
  char *v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  _QWORD *v60;
  char *v61;

  v56 = a2;
  v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_25610DD08);
  v44[4] = *(_QWORD *)(v50 - 8);
  MEMORY[0x24BDAC7A8](v50, v3);
  v55 = (char *)v44 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_25610DD10);
  v48 = *(_QWORD *)(v49 - 8);
  MEMORY[0x24BDAC7A8](v49, v5);
  v52 = (char *)v44 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_25610DD18);
  v46 = *(_QWORD *)(v47 - 8);
  MEMORY[0x24BDAC7A8](v47, v7);
  v54 = (char *)v44 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_25610DD20);
  v44[5] = *(_QWORD *)(v45 - 8);
  MEMORY[0x24BDAC7A8](v45, v9);
  v51 = (char *)v44 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_25610DD28);
  v53 = *(_QWORD *)(v59 - 8);
  MEMORY[0x24BDAC7A8](v59, v11);
  v13 = (char *)v44 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v58 = type metadata accessor for Conversation.Event();
  v15 = MEMORY[0x24BDAC7A8](v58, v14);
  v17 = (char *)v44 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = MEMORY[0x24BDAC7A8](v15, v18);
  v21 = (char *)v44 - v20;
  v23 = MEMORY[0x24BDAC7A8](v19, v22);
  v25 = (char *)v44 - v24;
  v27 = MEMORY[0x24BDAC7A8](v23, v26);
  v29 = (char *)v44 - v28;
  MEMORY[0x24BDAC7A8](v27, v30);
  v32 = (char *)v44 - v31;
  v33 = a1[3];
  v60 = a1;
  __swift_project_boxed_opaque_existential_0(a1, v33);
  sub_233AE16F0();
  v57 = v13;
  v34 = v61;
  sub_233AEBD20();
  if (!v34)
  {
    v44[0] = v29;
    v44[1] = v25;
    v44[2] = v21;
    v61 = v17;
    v44[3] = v32;
    v36 = v58;
    v35 = v59;
    v37 = v57;
    v38 = sub_233AEBC84();
    if (*(_QWORD *)(v38 + 16) == 1)
      __asm { BR              X10 }
    v39 = v35;
    v40 = sub_233AEBBA0();
    swift_allocError();
    v42 = v41;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25610DD30);
    *v42 = v36;
    sub_233AEBC54();
    sub_233AEBB94();
    (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v40 - 8) + 104))(v42, *MEMORY[0x24BEE26D0], v40);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v53 + 8))(v37, v39);
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v60);
}

uint64_t sub_233AE1160@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return Conversation.Event.init(from:)(a1, a2);
}

void sub_233AE1174(_QWORD *a1)
{
  Conversation.Event.encode(to:)(a1);
}

uint64_t sub_233AE1188()
{
  sub_233AEBCF0();
  Conversation.Event.hash(into:)();
  return sub_233AEBD14();
}

uint64_t sub_233AE11C8()
{
  sub_233AEBCF0();
  Conversation.Event.hash(into:)();
  return sub_233AEBD14();
}

void _s20LiveCommunicationKit12ConversationC5EventO2eeoiySbAE_AEtFZ_0(uint64_t a1, uint64_t a2)
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  _QWORD v24[8];
  uint64_t v25;

  v25 = a2;
  v3 = sub_233AEB8B8();
  v24[6] = *(_QWORD *)(v3 - 8);
  v24[7] = v3;
  v5 = MEMORY[0x24BDAC7A8](v3, v4);
  v24[5] = (char *)v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x24BDAC7A8](v5, v7);
  MEMORY[0x24BDAC7A8](v8, v9);
  v10 = type metadata accessor for Conversation.Event();
  v12 = MEMORY[0x24BDAC7A8](v10, v11);
  v14 = MEMORY[0x24BDAC7A8](v12, v13);
  v16 = MEMORY[0x24BDAC7A8](v14, v15);
  MEMORY[0x24BDAC7A8](v16, v17);
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_25610DE78);
  v20 = MEMORY[0x24BDAC7A8](v18, v19);
  v22 = (char *)v24 + *(int *)(v20 + 48) - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_233ADEF4C(a1, (uint64_t)v24 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_233ADEF4C(v25, (uint64_t)v22);
  v23 = (char *)sub_233AE13B0 + 4 * byte_233AEC970[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_233AE13B0()
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
  char updated;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  __int128 v21;

  sub_233ADEF4C(v0, v2);
  v4 = *(_QWORD *)v2;
  v5 = *(_QWORD *)(v2 + 8);
  v7 = *(_QWORD *)(v2 + 16);
  v6 = *(_QWORD *)(v2 + 24);
  v9 = *(_QWORD *)(v2 + 32);
  v8 = *(_QWORD *)(v2 + 40);
  *(_QWORD *)(v3 - 240) = *(_QWORD *)(v2 + 48);
  if (swift_getEnumCaseMultiPayload())
  {
    sub_233AD64D4(v4, v5, v7);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_233AE2CB4(v0);
    updated = 0;
  }
  else
  {
    v11 = *(_BYTE *)(v2 + 64);
    v12 = *(_QWORD *)(v2 + 56);
    v13 = *(_QWORD *)v1;
    v14 = *(_QWORD *)(v1 + 8);
    v15 = *(_QWORD *)(v1 + 16);
    v16 = *(_QWORD *)(v1 + 24);
    v18 = *(_QWORD *)(v1 + 32);
    v17 = *(_QWORD *)(v1 + 40);
    v19 = *(_BYTE *)(v1 + 64);
    *(_QWORD *)(v3 - 248) = v4;
    *(_QWORD *)(v3 - 160) = v4;
    *(_QWORD *)(v3 - 152) = v5;
    *(_QWORD *)(v3 - 264) = v5;
    *(_QWORD *)(v3 - 144) = v7;
    *(_QWORD *)(v3 - 136) = v6;
    *(_QWORD *)(v3 - 272) = v6;
    *(_QWORD *)(v3 - 280) = v9;
    *(_QWORD *)(v3 - 128) = v9;
    *(_QWORD *)(v3 - 120) = v8;
    *(_QWORD *)(v3 - 256) = v8;
    *(_QWORD *)(v3 - 112) = *(_QWORD *)(v3 - 240);
    *(_QWORD *)(v3 - 104) = v12;
    *(_BYTE *)(v3 - 96) = v11;
    *(_QWORD *)(v3 - 232) = v13;
    *(_QWORD *)(v3 - 224) = v14;
    *(_QWORD *)(v3 - 216) = v15;
    *(_QWORD *)(v3 - 208) = v16;
    v20 = v15;
    *(_QWORD *)(v3 - 200) = v18;
    *(_QWORD *)(v3 - 192) = v17;
    v21 = *(_OWORD *)(v1 + 48);
    *(_OWORD *)(v3 - 304) = v21;
    *(_OWORD *)(v3 - 184) = v21;
    *(_BYTE *)(v3 - 168) = v19;
    updated = _s20LiveCommunicationKit12ConversationC6UpdateV2eeoiySbAE_AEtFZ_0(v3 - 160, v3 - 232);
    sub_233AD64D4(v13, v14, v20);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_233AD64D4(*(_QWORD *)(v3 - 248), *(_QWORD *)(v3 - 264), v7);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_233AE1F08(v0);
  }
  return updated & 1;
}

unint64_t sub_233AE16F0()
{
  unint64_t result;

  result = qword_25610DCC8;
  if (!qword_25610DCC8)
  {
    result = MEMORY[0x23493BDC0](&unk_233AED024, &_s14descr2504D6791C5EventO10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25610DCC8);
  }
  return result;
}

unint64_t sub_233AE1734()
{
  unint64_t result;

  result = qword_25610DCD0;
  if (!qword_25610DCD0)
  {
    result = MEMORY[0x23493BDC0](&unk_233AECFD4, &_s14descr2504D6791C5EventO27ConversationEndedCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25610DCD0);
  }
  return result;
}

unint64_t sub_233AE1778()
{
  unint64_t result;

  result = qword_25610DCE0;
  if (!qword_25610DCE0)
  {
    result = MEMORY[0x23493BDC0](&protocol conformance descriptor for Conversation.EndedReason, &type metadata for Conversation.EndedReason);
    atomic_store(result, (unint64_t *)&qword_25610DCE0);
  }
  return result;
}

unint64_t sub_233AE17BC()
{
  unint64_t result;

  result = qword_25610DCE8;
  if (!qword_25610DCE8)
  {
    result = MEMORY[0x23493BDC0](&unk_233AECF84, &_s14descr2504D6791C5EventO31ConversationConnectedCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25610DCE8);
  }
  return result;
}

unint64_t sub_233AE1800()
{
  unint64_t result;

  result = qword_25610DCF0;
  if (!qword_25610DCF0)
  {
    result = MEMORY[0x23493BDC0](&unk_233AECF34, &_s14descr2504D6791C5EventO39ConversationStartedConnectingCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25610DCF0);
  }
  return result;
}

unint64_t sub_233AE1844()
{
  unint64_t result;

  result = qword_25610DCF8;
  if (!qword_25610DCF8)
  {
    result = MEMORY[0x23493BDC0](&unk_233AECEE4, &_s14descr2504D6791C5EventO29ConversationUpdatedCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25610DCF8);
  }
  return result;
}

unint64_t sub_233AE1888()
{
  unint64_t result;

  result = qword_25610DD00;
  if (!qword_25610DD00)
  {
    result = MEMORY[0x23493BDC0](&protocol conformance descriptor for Conversation.Update, &type metadata for Conversation.Update);
    atomic_store(result, (unint64_t *)&qword_25610DD00);
  }
  return result;
}

unint64_t sub_233AE18CC()
{
  unint64_t result;

  result = qword_25610DD40;
  if (!qword_25610DD40)
  {
    result = MEMORY[0x23493BDC0](&protocol conformance descriptor for Conversation.EndedReason, &type metadata for Conversation.EndedReason);
    atomic_store(result, (unint64_t *)&qword_25610DD40);
  }
  return result;
}

uint64_t sub_233AE1910(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for Conversation.Event();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_233AE1954()
{
  unint64_t result;

  result = qword_25610DD48;
  if (!qword_25610DD48)
  {
    result = MEMORY[0x23493BDC0](&protocol conformance descriptor for Conversation.Update, &type metadata for Conversation.Update);
    atomic_store(result, (unint64_t *)&qword_25610DD48);
  }
  return result;
}

uint64_t sub_233AE1998()
{
  return sub_233ADF2B4(&qword_25610DD50, (uint64_t (*)(uint64_t))type metadata accessor for Conversation.Event, (uint64_t)&protocol conformance descriptor for Conversation.Event);
}

uint64_t _s14descr2504D6791C5EventOwCP(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) == 0)
  {
    v5 = (char *)&loc_233AE1A14 + 4 * byte_233AEC974[swift_getEnumCaseMultiPayload()];
    __asm { BR              X10 }
  }
  v6 = *a2;
  *a1 = *a2;
  v7 = v6 + ((v4 + 16) & ~(unint64_t)v4);
  swift_retain();
  return v7;
}

uint64_t _s14descr2504D6791C5EventOwxx(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = swift_getEnumCaseMultiPayload();
  switch((int)result)
  {
    case 0:
      if (*(_QWORD *)(a1 + 16))
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      swift_bridgeObjectRelease();
      result = swift_bridgeObjectRelease();
      break;
    case 1:
    case 2:
    case 3:
      v3 = sub_233AEB8B8();
      result = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
      break;
    default:
      return result;
  }
  return result;
}

void _s14descr2504D6791C5EventOwcp()
{
  char *v0;

  v0 = (char *)sub_233AE1C3C + 4 * byte_233AEC97C[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_233AE1C3C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;

  v2 = *(_QWORD *)(v1 + 16);
  if (v2)
  {
    *(_BYTE *)v0 = *(_BYTE *)v1;
    *(_QWORD *)(v0 + 8) = *(_QWORD *)(v1 + 8);
    *(_QWORD *)(v0 + 16) = v2;
    v3 = *(_QWORD *)(v1 + 32);
    *(_QWORD *)(v0 + 24) = *(_QWORD *)(v1 + 24);
    *(_QWORD *)(v0 + 32) = v3;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    v4 = *(_OWORD *)(v1 + 16);
    *(_OWORD *)v0 = *(_OWORD *)v1;
    *(_OWORD *)(v0 + 16) = v4;
    *(_QWORD *)(v0 + 32) = *(_QWORD *)(v1 + 32);
  }
  v5 = *(_QWORD *)(v1 + 48);
  *(_QWORD *)(v0 + 40) = *(_QWORD *)(v1 + 40);
  *(_QWORD *)(v0 + 48) = v5;
  *(_QWORD *)(v0 + 56) = *(_QWORD *)(v1 + 56);
  *(_BYTE *)(v0 + 64) = *(_BYTE *)(v1 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_storeEnumTagMultiPayload();
  return v0;
}

uint64_t _s14descr2504D6791C5EventOwca(uint64_t result, uint64_t a2)
{
  char *v2;

  if (result != a2)
  {
    sub_233AE1F08(result);
    v2 = (char *)&loc_233AE1DC0 + 4 * byte_233AEC980[swift_getEnumCaseMultiPayload()];
    __asm { BR              X10 }
  }
  return result;
}

uint64_t sub_233AE1F08(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for Conversation.Event();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

_BYTE *_s14descr2504D6791C5EventOwtk(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 3)
  {
    v8 = sub_233AEB8B8();
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(a1, a2, v8);
    v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25610DA60);
    a1[*(int *)(v9 + 48)] = a2[*(int *)(v9 + 48)];
    swift_storeEnumTagMultiPayload();
  }
  else if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
  {
    v7 = sub_233AEB8B8();
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  return a1;
}

_BYTE *_s14descr2504D6791C5EventOwta(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (a1 != a2)
  {
    sub_233AE1F08((uint64_t)a1);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 3)
    {
      v8 = sub_233AEB8B8();
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(a1, a2, v8);
      v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25610DA60);
      a1[*(int *)(v9 + 48)] = a2[*(int *)(v9 + 48)];
      swift_storeEnumTagMultiPayload();
    }
    else if (EnumCaseMultiPayload == 2 || EnumCaseMultiPayload == 1)
    {
      v7 = sub_233AEB8B8();
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t _s14descr2504D6791C5EventOwet(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t _s14descr2504D6791C5EventOwst(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_233AE21A8()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_233AE21B8()
{
  uint64_t result;
  unint64_t v1;
  _QWORD v2[5];
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v2[4] = "A";
  result = sub_233AEB8B8();
  if (v1 <= 0x3F)
  {
    v3 = *(_QWORD *)(result - 8) + 64;
    v4 = v3;
    swift_getTupleTypeLayout2();
    v5 = v2;
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t _s14descr2504D6791C5EventO10CodingKeysOwet(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s14descr2504D6791C5EventO10CodingKeysOwst(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_233AE231C + 4 * byte_233AEC989[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_233AE2350 + 4 * byte_233AEC984[v4]))();
}

uint64_t sub_233AE2350(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_233AE2358(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x233AE2360);
  return result;
}

uint64_t sub_233AE236C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x233AE2374);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_233AE2378(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_233AE2380(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *_s14descr2504D6791C5EventO10CodingKeysOMa()
{
  return &_s14descr2504D6791C5EventO10CodingKeysON;
}

uint64_t sub_233AE23A8()
{
  return 0;
}

ValueMetadata *_s14descr2504D6791C5EventO29ConversationUpdatedCodingKeysOMa()
{
  return &_s14descr2504D6791C5EventO29ConversationUpdatedCodingKeysON;
}

ValueMetadata *_s14descr2504D6791C5EventO39ConversationStartedConnectingCodingKeysOMa()
{
  return &_s14descr2504D6791C5EventO39ConversationStartedConnectingCodingKeysON;
}

uint64_t _s14descr2504D6FF1V5StateO16FailedCodingKeysOwet(unsigned int *a1, int a2)
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

uint64_t _s14descr2504D6791C5EventO29ConversationUpdatedCodingKeysOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_233AE2460 + 4 * byte_233AEC98E[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_233AE2480 + 4 * byte_233AEC993[v4]))();
}

_BYTE *sub_233AE2460(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_233AE2480(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_233AE2488(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_233AE2490(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_233AE2498(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_233AE24A0(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *_s14descr2504D6791C5EventO31ConversationConnectedCodingKeysOMa()
{
  return &_s14descr2504D6791C5EventO31ConversationConnectedCodingKeysON;
}

uint64_t _s14descr2504D6791C5EventO27ConversationEndedCodingKeysOwet(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s14descr2504D6791C5EventO27ConversationEndedCodingKeysOwst(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_233AE2598 + 4 * byte_233AEC99D[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_233AE25CC + 4 * byte_233AEC998[v4]))();
}

uint64_t sub_233AE25CC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_233AE25D4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x233AE25DCLL);
  return result;
}

uint64_t sub_233AE25E8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x233AE25F0);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_233AE25F4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_233AE25FC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_233AE2608(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *_s14descr2504D6791C5EventO27ConversationEndedCodingKeysOMa()
{
  return &_s14descr2504D6791C5EventO27ConversationEndedCodingKeysON;
}

unint64_t sub_233AE2628()
{
  unint64_t result;

  result = qword_25610DE00;
  if (!qword_25610DE00)
  {
    result = MEMORY[0x23493BDC0](&unk_233AECBDC, &_s14descr2504D6791C5EventO27ConversationEndedCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25610DE00);
  }
  return result;
}

unint64_t sub_233AE2670()
{
  unint64_t result;

  result = qword_25610DE08;
  if (!qword_25610DE08)
  {
    result = MEMORY[0x23493BDC0](&unk_233AECC94, &_s14descr2504D6791C5EventO31ConversationConnectedCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25610DE08);
  }
  return result;
}

unint64_t sub_233AE26B8()
{
  unint64_t result;

  result = qword_25610DE10;
  if (!qword_25610DE10)
  {
    result = MEMORY[0x23493BDC0](&unk_233AECD4C, &_s14descr2504D6791C5EventO39ConversationStartedConnectingCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25610DE10);
  }
  return result;
}

unint64_t sub_233AE2700()
{
  unint64_t result;

  result = qword_25610DE18;
  if (!qword_25610DE18)
  {
    result = MEMORY[0x23493BDC0](&unk_233AECE04, &_s14descr2504D6791C5EventO29ConversationUpdatedCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25610DE18);
  }
  return result;
}

unint64_t sub_233AE2748()
{
  unint64_t result;

  result = qword_25610DE20;
  if (!qword_25610DE20)
  {
    result = MEMORY[0x23493BDC0](&unk_233AECEBC, &_s14descr2504D6791C5EventO10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25610DE20);
  }
  return result;
}

unint64_t sub_233AE2790()
{
  unint64_t result;

  result = qword_25610DE28;
  if (!qword_25610DE28)
  {
    result = MEMORY[0x23493BDC0](&unk_233AECD74, &_s14descr2504D6791C5EventO29ConversationUpdatedCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25610DE28);
  }
  return result;
}

unint64_t sub_233AE27D8()
{
  unint64_t result;

  result = qword_25610DE30;
  if (!qword_25610DE30)
  {
    result = MEMORY[0x23493BDC0](&unk_233AECD9C, &_s14descr2504D6791C5EventO29ConversationUpdatedCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25610DE30);
  }
  return result;
}

unint64_t sub_233AE2820()
{
  unint64_t result;

  result = qword_25610DE38;
  if (!qword_25610DE38)
  {
    result = MEMORY[0x23493BDC0](&unk_233AECCBC, &_s14descr2504D6791C5EventO39ConversationStartedConnectingCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25610DE38);
  }
  return result;
}

unint64_t sub_233AE2868()
{
  unint64_t result;

  result = qword_25610DE40;
  if (!qword_25610DE40)
  {
    result = MEMORY[0x23493BDC0](&unk_233AECCE4, &_s14descr2504D6791C5EventO39ConversationStartedConnectingCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25610DE40);
  }
  return result;
}

unint64_t sub_233AE28B0()
{
  unint64_t result;

  result = qword_25610DE48;
  if (!qword_25610DE48)
  {
    result = MEMORY[0x23493BDC0](&unk_233AECC04, &_s14descr2504D6791C5EventO31ConversationConnectedCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25610DE48);
  }
  return result;
}

unint64_t sub_233AE28F8()
{
  unint64_t result;

  result = qword_25610DE50;
  if (!qword_25610DE50)
  {
    result = MEMORY[0x23493BDC0](&unk_233AECC2C, &_s14descr2504D6791C5EventO31ConversationConnectedCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25610DE50);
  }
  return result;
}

unint64_t sub_233AE2940()
{
  unint64_t result;

  result = qword_25610DE58;
  if (!qword_25610DE58)
  {
    result = MEMORY[0x23493BDC0](&unk_233AECB4C, &_s14descr2504D6791C5EventO27ConversationEndedCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25610DE58);
  }
  return result;
}

unint64_t sub_233AE2988()
{
  unint64_t result;

  result = qword_25610DE60;
  if (!qword_25610DE60)
  {
    result = MEMORY[0x23493BDC0](&unk_233AECB74, &_s14descr2504D6791C5EventO27ConversationEndedCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25610DE60);
  }
  return result;
}

unint64_t sub_233AE29D0()
{
  unint64_t result;

  result = qword_25610DE68;
  if (!qword_25610DE68)
  {
    result = MEMORY[0x23493BDC0](&unk_233AECE2C, &_s14descr2504D6791C5EventO10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25610DE68);
  }
  return result;
}

unint64_t sub_233AE2A18()
{
  unint64_t result;

  result = qword_25610DE70;
  if (!qword_25610DE70)
  {
    result = MEMORY[0x23493BDC0](&unk_233AECE54, &_s14descr2504D6791C5EventO10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25610DE70);
  }
  return result;
}

uint64_t sub_233AE2A5C(uint64_t a1, uint64_t a2)
{
  char v5;

  if (a1 == 0xD000000000000013 && a2 == 0x8000000233AEEA50 || (sub_233AEBCCC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0xD00000000000001DLL && a2 == 0x8000000233AEEA70 || (sub_233AEBCCC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000015 && a2 == 0x8000000233AEEA90 || (sub_233AEBCCC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x8000000233AEEAB0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    v5 = sub_233AEBCCC();
    swift_bridgeObjectRelease();
    if ((v5 & 1) != 0)
      return 3;
    else
      return 4;
  }
}

uint64_t sub_233AE2BF4(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 12383 && a2 == 0xE200000000000000;
  if (v2 || (sub_233AEBCCC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 12639 && a2 == 0xE200000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_233AEBCCC();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_233AE2CB4(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25610DE78);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t dispatch thunk of ConversationManagerDelegate.conversationManager(_:conversationChanged:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t dispatch thunk of ConversationManagerDelegate.conversationManagerDidBegin(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of ConversationManagerDelegate.conversationManagerDidReset(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of ConversationManagerDelegate.conversationManager(_:perform:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 32))();
}

uint64_t dispatch thunk of ConversationManagerDelegate.conversationManager(_:timedOutPerforming:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 40))();
}

uint64_t dispatch thunk of ConversationManagerDelegate.conversationManager(_:didActivate:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 48))();
}

uint64_t dispatch thunk of ConversationManagerDelegate.conversationManager(_:didDeactivate:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 56))();
}

uint64_t sub_233AE2D30(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t result;
  int64_t v4;
  int v5;
  int v6;
  char v7;
  char v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;

  v1 = a1;
  v2 = *(_QWORD *)(a1 + 16);
  result = MEMORY[0x24BEE4AF8];
  if (v2)
  {
    v19 = MEMORY[0x24BEE4AF8];
    sub_233AEBBD0();
    result = sub_233AE5770(v1);
    v4 = result;
    v6 = v5;
    v8 = v7 & 1;
    v16 = v1;
    v17 = v1 + 56;
    while ((v4 & 0x8000000000000000) == 0 && v4 < 1 << *(_BYTE *)(v1 + 32))
    {
      if (((*(_QWORD *)(v17 + (((unint64_t)v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) == 0)
        goto LABEL_11;
      if (*(_DWORD *)(v1 + 36) != v6)
        goto LABEL_12;
      v9 = *(unsigned __int8 *)(*(_QWORD *)(v1 + 48) + 40 * v4) + 1;
      v18 = v8;
      v10 = objc_allocWithZone(MEMORY[0x24BDB78E8]);
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      v11 = (void *)sub_233AEB99C();
      swift_bridgeObjectRelease();
      v12 = objc_msgSend(v10, sel_initWithType_value_, v9, v11);

      v13 = (void *)sub_233AEB99C();
      objc_msgSend(v12, sel_setSiriDisplayName_, v13);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      sub_233AEBBB8();
      sub_233AEBBDC();
      v1 = v16;
      sub_233AEBBE8();
      sub_233AEBBC4();
      result = sub_233AE5814(v4, v6, v18 & 1, v16);
      v4 = result;
      v6 = v14;
      v8 = v15 & 1;
      if (!--v2)
      {
        sub_233AD5004(result, v14, v8);
        return v19;
      }
    }
    __break(1u);
LABEL_11:
    __break(1u);
LABEL_12:
    __break(1u);
  }
  return result;
}

id sub_233AE2F28()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  char v5;
  id v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;

  v1 = *(_QWORD *)(v0 + 16);
  v3 = *(_QWORD *)(v0 + 40);
  v2 = *(_QWORD *)(v0 + 48);
  v4 = *(_QWORD *)(v0 + 56);
  v5 = *(_BYTE *)(v0 + 64);
  v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDB78A0]), sel_init);
  if (v3)
  {
    v7 = sub_233AE2D30(v3);
    sub_233AE6384(v7);
    swift_bridgeObjectRelease();
    sub_233AD7D3C();
    sub_233ADF2B4(&qword_25610DEF0, (uint64_t (*)(uint64_t))sub_233AD7D3C, MEMORY[0x24BEE5BD8]);
    v8 = (void *)sub_233AEBA80();
    swift_bridgeObjectRelease();
    objc_msgSend(v6, sel_setRemoteParticipantHandles_, v8);

  }
  if (v2)
  {
    v9 = sub_233AE2D30(v2);
    sub_233AE6384(v9);
    swift_bridgeObjectRelease();
    sub_233AD7D3C();
    sub_233ADF2B4(&qword_25610DEF0, (uint64_t (*)(uint64_t))sub_233AD7D3C, MEMORY[0x24BEE5BD8]);
    v10 = (void *)sub_233AEBA80();
    swift_bridgeObjectRelease();
    objc_msgSend(v6, sel_setActiveRemoteParticipantHandles_, v10);

  }
  if ((v5 & 1) == 0)
  {
    objc_msgSend(v6, sel_setHasVideo_, (v4 >> 3) & 1);
    objc_msgSend(v6, sel_setSupportsDTMF_, (v4 >> 4) & 1);
    objc_msgSend(v6, sel_setSupportsHolding_, v4 & 1);
    objc_msgSend(v6, sel_setSupportsGrouping_, (v4 >> 1) & 1);
    objc_msgSend(v6, sel_setSupportsUngrouping_, (v4 >> 2) & 1);
  }
  if (v1)
  {
    v11 = (void *)sub_233AEB99C();
    objc_msgSend(v6, sel_setLocalMemberHandleValue_, v11);

  }
  return v6;
}

uint64_t Conversation.Update.localMember.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = *v1;
  v3 = v1[1];
  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  *a1 = *v1;
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = v5;
  a1[4] = v6;
  return sub_233AD6470(v2, v3, v4);
}

__n128 Conversation.Update.localMember.setter(__int128 *a1)
{
  uint64_t *v1;
  uint64_t v2;
  __n128 result;
  __n128 v4;
  __int128 v5;

  v4 = (__n128)a1[1];
  v5 = *a1;
  v2 = *((_QWORD *)a1 + 4);
  sub_233AD64D4(*v1, v1[1], v1[2]);
  result = v4;
  *(_OWORD *)v1 = v5;
  *((__n128 *)v1 + 1) = v4;
  v1[4] = v2;
  return result;
}

uint64_t (*Conversation.Update.localMember.modify())()
{
  return nullsub_1;
}

uint64_t Conversation.Update.members.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t Conversation.Update.members.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 40) = a1;
  return result;
}

uint64_t (*Conversation.Update.members.modify())()
{
  return nullsub_1;
}

uint64_t Conversation.Update.activeRemoteMembers.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t Conversation.Update.activeRemoteMembers.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 48) = a1;
  return result;
}

uint64_t (*Conversation.Update.activeRemoteMembers.modify())()
{
  return nullsub_1;
}

void Conversation.Update.capabilities.getter(uint64_t a1@<X8>)
{
  uint64_t v1;
  char v2;

  v2 = *(_BYTE *)(v1 + 64);
  *(_QWORD *)a1 = *(_QWORD *)(v1 + 56);
  *(_BYTE *)(a1 + 8) = v2;
}

uint64_t Conversation.Update.capabilities.setter(uint64_t result)
{
  uint64_t v1;
  char v2;

  v2 = *(_BYTE *)(result + 8);
  *(_QWORD *)(v1 + 56) = *(_QWORD *)result;
  *(_BYTE *)(v1 + 64) = v2;
  return result;
}

uint64_t (*Conversation.Update.capabilities.modify())()
{
  return nullsub_1;
}

__n128 Conversation.Update.init(localMember:members:activeRemoteMembers:capabilities:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  char v7;
  __n128 result;
  __int128 v9;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = *a4;
  v7 = *((_BYTE *)a4 + 8);
  result = *(__n128 *)a1;
  v9 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)a5 = *(_OWORD *)a1;
  *(_OWORD *)(a5 + 16) = v9;
  *(_QWORD *)(a5 + 32) = v5;
  *(_QWORD *)(a5 + 40) = a2;
  *(_QWORD *)(a5 + 48) = a3;
  *(_QWORD *)(a5 + 56) = v6;
  *(_BYTE *)(a5 + 64) = v7;
  return result;
}

uint64_t Conversation.Update.hash(into:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v2 = v1;
  v4 = *(_QWORD *)(v2 + 16);
  v6 = *(_QWORD *)(v2 + 40);
  v5 = *(_QWORD *)(v2 + 48);
  v7 = *(unsigned __int8 *)(v2 + 64);
  if (v4)
  {
    v9 = *(_QWORD *)v2;
    v8 = *(_QWORD *)(v2 + 8);
    sub_233AEBD08();
    sub_233AEBCFC();
    sub_233AD6470(v9, v8, v4);
    swift_bridgeObjectRetain();
    sub_233AEB9CC();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_233AEB9CC();
    swift_bridgeObjectRelease();
    sub_233AD64D4(v9, v8, v4);
    if (v6)
      goto LABEL_3;
  }
  else
  {
    sub_233AEBD08();
    if (v6)
    {
LABEL_3:
      sub_233AEBD08();
      swift_bridgeObjectRetain();
      sub_233AE5584(a1, v6);
      swift_bridgeObjectRelease();
      if (v5)
        goto LABEL_4;
LABEL_8:
      sub_233AEBD08();
      if (v7)
        return sub_233AEBD08();
      goto LABEL_9;
    }
  }
  sub_233AEBD08();
  if (!v5)
    goto LABEL_8;
LABEL_4:
  sub_233AEBD08();
  swift_bridgeObjectRetain();
  sub_233AE5584(a1, v5);
  swift_bridgeObjectRelease();
  if (v7)
    return sub_233AEBD08();
LABEL_9:
  sub_233AEBD08();
  return sub_233AEBCFC();
}

uint64_t sub_233AE3400()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_233AE3438 + 4 * byte_233AED09C[*v0]))(0x6D654D6C61636F6CLL, 0xEB00000000726562);
}

uint64_t sub_233AE3438()
{
  return 0x737265626D656DLL;
}

unint64_t sub_233AE3450()
{
  return 0xD000000000000013;
}

uint64_t sub_233AE346C()
{
  return 0x696C696261706163;
}

uint64_t sub_233AE348C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_233AE64E4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_233AE34B0()
{
  sub_233AE5BB8();
  return sub_233AEBD38();
}

uint64_t sub_233AE34D8()
{
  sub_233AE5BB8();
  return sub_233AEBD44();
}

uint64_t Conversation.Update.encode(to:)(_QWORD *a1)
{
  __int128 *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  int v24;
  char v25;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25610DE80);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4, v6);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *v1;
  v19 = v1[1];
  v20 = v9;
  v11 = *((_QWORD *)v1 + 4);
  v10 = *((_QWORD *)v1 + 5);
  v17 = *((_QWORD *)v1 + 6);
  v18 = v10;
  v16 = *((_QWORD *)v1 + 7);
  v24 = *((unsigned __int8 *)v1 + 64);
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_233AE5BB8();
  sub_233AEBD2C();
  v21 = v20;
  v22 = v19;
  v23 = v11;
  v25 = 0;
  sub_233AE5BFC();
  sub_233AEBC9C();
  if (!v2)
  {
    v12 = v16;
    v13 = v17;
    *(_QWORD *)&v21 = v18;
    v25 = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25610DE98);
    sub_233AE5CC8(&qword_25610DEA0, (uint64_t (*)(void))sub_233AE5BFC, MEMORY[0x24BEE1700]);
    sub_233AEBC9C();
    *(_QWORD *)&v21 = v13;
    v25 = 2;
    sub_233AEBC9C();
    *(_QWORD *)&v21 = v12;
    BYTE8(v21) = v24;
    v25 = 3;
    sub_233AE5C40();
    sub_233AEBC9C();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

uint64_t Conversation.Update.hashValue.getter()
{
  __int128 *v0;
  char v1;
  __int128 v2;
  __int128 v3;
  _BYTE v5[72];
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  char v10;

  v1 = *((_BYTE *)v0 + 64);
  v2 = v0[1];
  v6 = *v0;
  v7 = v2;
  v3 = v0[3];
  v8 = v0[2];
  v9 = v3;
  v10 = v1;
  sub_233AEBCF0();
  Conversation.Update.hash(into:)((uint64_t)v5);
  return sub_233AEBD14();
}

uint64_t Conversation.Update.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
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
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
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
  int v39;
  char v40;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25610DEB0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5, v7);
  v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_233AE5BB8();
  sub_233AEBD20();
  if (v2)
  {
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
    v24 = 0;
    v25 = 0;
    v26 = 0;
  }
  else
  {
    v40 = 0;
    sub_233AE5C84();
    sub_233AEBC60();
    v27 = a2;
    v12 = v34;
    v11 = v35;
    v13 = v36;
    v32 = v37;
    v33 = v38;
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_25610DE98);
    v40 = 1;
    v29 = v12;
    v30 = v11;
    v31 = v13;
    sub_233AD6470(v12, v11, v13);
    sub_233AE5CC8(&qword_25610DEC0, (uint64_t (*)(void))sub_233AE5C84, MEMORY[0x24BEE1720]);
    v28 = v14;
    sub_233AEBC60();
    v15 = v34;
    v40 = 2;
    swift_bridgeObjectRetain();
    sub_233AEBC60();
    v16 = v34;
    v40 = 3;
    sub_233AE5D30();
    swift_bridgeObjectRetain();
    sub_233AEBC60();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
    v17 = v29;
    v18 = v33;
    v28 = v34;
    v39 = v35;
    v20 = v30;
    v19 = v31;
    v21 = v32;
    sub_233AD6470(v29, v30, v31);
    sub_233AD64D4(v17, v20, v19);
    v22 = v27;
    v23 = v28;
    *v27 = v17;
    v22[1] = v20;
    v22[2] = v19;
    v22[3] = v21;
    v22[4] = v18;
    v22[5] = v15;
    v22[6] = v16;
    v22[7] = v23;
    *((_BYTE *)v22 + 64) = v39;
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
    v24 = v17;
    v25 = v20;
    v26 = v19;
  }
  sub_233AD64D4(v24, v25, v26);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_233AE3B5C@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return Conversation.Update.init(from:)(a1, a2);
}

uint64_t sub_233AE3B70(_QWORD *a1)
{
  return Conversation.Update.encode(to:)(a1);
}

uint64_t sub_233AE3B84()
{
  __int128 *v0;
  char v1;
  __int128 v2;
  __int128 v3;
  _BYTE v5[72];
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  char v10;

  v1 = *((_BYTE *)v0 + 64);
  v2 = v0[1];
  v6 = *v0;
  v7 = v2;
  v3 = v0[3];
  v8 = v0[2];
  v9 = v3;
  v10 = v1;
  sub_233AEBCF0();
  Conversation.Update.hash(into:)((uint64_t)v5);
  return sub_233AEBD14();
}

uint64_t sub_233AE3BE0()
{
  __int128 *v0;
  char v1;
  __int128 v2;
  __int128 v3;
  _BYTE v5[72];
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  char v10;

  v1 = *((_BYTE *)v0 + 64);
  v2 = v0[1];
  v6 = *v0;
  v7 = v2;
  v3 = v0[3];
  v8 = v0[2];
  v9 = v3;
  v10 = v1;
  sub_233AEBCF0();
  Conversation.Update.hash(into:)((uint64_t)v5);
  return sub_233AEBD14();
}

uint64_t sub_233AE3C38(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t i;
  int64_t v8;
  unint64_t v9;
  int64_t v10;
  int64_t v11;
  _QWORD *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  BOOL v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  int64_t v30;
  uint64_t v31;
  int64_t v32;
  uint64_t v34;

  if (result == a2)
    return 1;
  v2 = a2;
  if (*(_QWORD *)(result + 16) != *(_QWORD *)(a2 + 16))
    return 0;
  v3 = 0;
  v28 = result;
  v29 = result + 56;
  v4 = 1 << *(_BYTE *)(result + 32);
  if (v4 < 64)
    v5 = ~(-1 << v4);
  else
    v5 = -1;
  v6 = v5 & *(_QWORD *)(result + 56);
  v30 = (unint64_t)(v4 + 63) >> 6;
  v34 = a2 + 56;
  if (!v6)
    goto LABEL_8;
LABEL_7:
  v31 = (v6 - 1) & v6;
  v32 = v3;
  for (i = __clz(__rbit64(v6)) | (v3 << 6); ; i = __clz(__rbit64(v9)) + (v10 << 6))
  {
    v12 = (_QWORD *)(*(_QWORD *)(result + 48) + 40 * i);
    v13 = *(unsigned __int8 *)v12;
    v15 = v12[1];
    v14 = v12[2];
    v17 = v12[3];
    v16 = v12[4];
    sub_233AEBCF0();
    sub_233AEBCFC();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    sub_233AEB9CC();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_233AEB9CC();
    swift_bridgeObjectRelease();
    v18 = sub_233AEBD14();
    v19 = -1 << *(_BYTE *)(v2 + 32);
    v20 = v18 & ~v19;
    if (((*(_QWORD *)(v34 + ((v20 >> 3) & 0xFFFFFFFFFFFFF8)) >> v20) & 1) == 0)
    {
LABEL_41:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return 0;
    }
    v21 = ~v19;
    v22 = *(_QWORD *)(a2 + 48);
    while (1)
    {
      v23 = (_QWORD *)(v22 + 40 * v20);
      if (*(unsigned __int8 *)v23 == v13)
      {
        v24 = v23[3];
        v25 = v23[4];
        v26 = v23[1] == v15 && v23[2] == v14;
        if (v26 || (sub_233AEBCCC() & 1) != 0)
        {
          v27 = v24 == v17 && v25 == v16;
          if (v27 || (sub_233AEBCCC() & 1) != 0)
            break;
        }
      }
      v20 = (v20 + 1) & v21;
      if (((*(_QWORD *)(v34 + ((v20 >> 3) & 0xFFFFFFFFFFFFF8)) >> v20) & 1) == 0)
        goto LABEL_41;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v3 = v32;
    v2 = a2;
    result = v28;
    v6 = v31;
    if (v31)
      goto LABEL_7;
LABEL_8:
    v8 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_44;
    }
    if (v8 >= v30)
      return 1;
    v9 = *(_QWORD *)(v29 + 8 * v8);
    v10 = v3 + 1;
    if (!v9)
    {
      v10 = v8 + 1;
      if (v8 + 1 >= v30)
        return 1;
      v9 = *(_QWORD *)(v29 + 8 * v10);
      if (!v9)
      {
        v10 = v8 + 2;
        if (v8 + 2 >= v30)
          return 1;
        v9 = *(_QWORD *)(v29 + 8 * v10);
        if (!v9)
        {
          v10 = v8 + 3;
          if (v8 + 3 >= v30)
            return 1;
          v9 = *(_QWORD *)(v29 + 8 * v10);
          if (!v9)
            break;
        }
      }
    }
LABEL_23:
    v31 = (v9 - 1) & v9;
    v32 = v10;
  }
  v11 = v8 + 4;
  if (v11 >= v30)
    return 1;
  v9 = *(_QWORD *)(v29 + 8 * v11);
  if (v9)
  {
    v10 = v11;
    goto LABEL_23;
  }
  while (1)
  {
    v10 = v11 + 1;
    if (__OFADD__(v11, 1))
      break;
    if (v10 >= v30)
      return 1;
    v9 = *(_QWORD *)(v29 + 8 * v10);
    ++v11;
    if (v9)
      goto LABEL_23;
  }
LABEL_44:
  __break(1u);
  return result;
}

uint64_t sub_233AE3F58(uint64_t *a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v13;

  v5 = *v2;
  sub_233AEBCF0();
  sub_233AEBCFC();
  v6 = sub_233AEBD14();
  v7 = -1 << *(_BYTE *)(v5 + 32);
  v8 = v6 & ~v7;
  if (((*(_QWORD *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
  {
LABEL_7:
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v13 = *v2;
    *v2 = 0x8000000000000000;
    sub_233AE4A98(a2, v8, isUniquelyReferenced_nonNull_native);
    *v2 = v13;
    swift_bridgeObjectRelease();
    result = 1;
    goto LABEL_8;
  }
  v9 = *(_QWORD *)(v5 + 48);
  if (*(_QWORD *)(v9 + 8 * v8) != a2)
  {
    v10 = ~v7;
    do
    {
      v8 = (v8 + 1) & v10;
      if (((*(_QWORD *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
        goto LABEL_7;
    }
    while (*(_QWORD *)(v9 + 8 * v8) != a2);
  }
  result = 0;
  a2 = *(_QWORD *)(*(_QWORD *)(*v2 + 48) + 8 * v8);
LABEL_8:
  *a1 = a2;
  return result;
}

uint64_t sub_233AE4074(_QWORD *a1, void *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  id v14;
  char v15;
  uint64_t v16;
  id v17;
  char v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  char isUniquelyReferenced_nonNull_native;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v3 = v2;
  v6 = *v2;
  if ((*v2 & 0xC000000000000001) != 0)
  {
    if (v6 < 0)
      v7 = *v2;
    else
      v7 = v6 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
    v8 = a2;
    v9 = sub_233AEBB1C();

    if (v9)
    {
      swift_bridgeObjectRelease();

      sub_233AD7D3C();
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v26;
      swift_unknownObjectRelease();
      return 0;
    }
    result = sub_233AEBB10();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    v21 = sub_233AE42F0(v7, result + 1);
    v27 = v21;
    if (*(_QWORD *)(v21 + 24) <= *(_QWORD *)(v21 + 16))
    {
      v25 = v8;
      sub_233AE477C();
      v22 = v27;
    }
    else
    {
      v22 = v21;
      v23 = v8;
    }
    sub_233AE4A18((uint64_t)v8, v22);
    *v3 = v22;
  }
  else
  {
    swift_bridgeObjectRetain();
    v11 = sub_233AEBABC();
    v12 = -1 << *(_BYTE *)(v6 + 32);
    v13 = v11 & ~v12;
    if (((*(_QWORD *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8)) >> v13) & 1) != 0)
    {
      sub_233AD7D3C();
      v14 = *(id *)(*(_QWORD *)(v6 + 48) + 8 * v13);
      v15 = sub_233AEBAC8();

      if ((v15 & 1) != 0)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        v19 = *(void **)(*(_QWORD *)(*v2 + 48) + 8 * v13);
        *a1 = v19;
        v20 = v19;
        return 0;
      }
      v16 = ~v12;
      while (1)
      {
        v13 = (v13 + 1) & v16;
        if (((*(_QWORD *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8)) >> v13) & 1) == 0)
          break;
        v17 = *(id *)(*(_QWORD *)(v6 + 48) + 8 * v13);
        v18 = sub_233AEBAC8();

        if ((v18 & 1) != 0)
          goto LABEL_12;
      }
    }
    swift_bridgeObjectRelease();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v28 = *v2;
    *v2 = 0x8000000000000000;
    v8 = a2;
    sub_233AE4BE4((uint64_t)v8, v13, isUniquelyReferenced_nonNull_native);
    *v2 = v28;
  }
  swift_bridgeObjectRelease();
  *a1 = v8;
  return 1;
}

uint64_t sub_233AE42F0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  char v9;
  unint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25610DEF8);
    v2 = sub_233AEBB4C();
    v14 = v2;
    sub_233AEBB04();
    if (sub_233AEBB28())
    {
      sub_233AD7D3C();
      do
      {
        swift_dynamicCast();
        v2 = v14;
        if (*(_QWORD *)(v14 + 24) <= *(_QWORD *)(v14 + 16))
        {
          sub_233AE477C();
          v2 = v14;
        }
        result = sub_233AEBABC();
        v4 = v2 + 56;
        v5 = -1 << *(_BYTE *)(v2 + 32);
        v6 = result & ~v5;
        v7 = v6 >> 6;
        if (((-1 << v6) & ~*(_QWORD *)(v2 + 56 + 8 * (v6 >> 6))) != 0)
        {
          v8 = __clz(__rbit64((-1 << v6) & ~*(_QWORD *)(v2 + 56 + 8 * (v6 >> 6)))) | v6 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          v9 = 0;
          v10 = (unint64_t)(63 - v5) >> 6;
          do
          {
            if (++v7 == v10 && (v9 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            v11 = v7 == v10;
            if (v7 == v10)
              v7 = 0;
            v9 |= v11;
            v12 = *(_QWORD *)(v4 + 8 * v7);
          }
          while (v12 == -1);
          v8 = __clz(__rbit64(~v12)) + (v7 << 6);
        }
        *(_QWORD *)(v4 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v8;
        *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v8) = v13;
        ++*(_QWORD *)(v2 + 16);
      }
      while (sub_233AEBB28());
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x24BEE4B08];
  }
  return v2;
}

uint64_t sub_233AE44D4()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  int64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  unint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t v26;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25610DF08);
  result = sub_233AEBB40();
  v4 = result;
  if (*(_QWORD *)(v2 + 16))
  {
    v5 = 0;
    v6 = (_QWORD *)(v2 + 56);
    v7 = 1 << *(_BYTE *)(v2 + 32);
    if (v7 < 64)
      v8 = ~(-1 << v7);
    else
      v8 = -1;
    v9 = v8 & *(_QWORD *)(v2 + 56);
    v10 = (unint64_t)(v7 + 63) >> 6;
    v11 = result + 56;
    while (1)
    {
      if (v9)
      {
        v13 = __clz(__rbit64(v9));
        v9 &= v9 - 1;
        v14 = v13 | (v5 << 6);
      }
      else
      {
        v15 = v5 + 1;
        if (__OFADD__(v5, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v15 >= v10)
          goto LABEL_33;
        v16 = v6[v15];
        ++v5;
        if (!v16)
        {
          v5 = v15 + 1;
          if (v15 + 1 >= v10)
            goto LABEL_33;
          v16 = v6[v5];
          if (!v16)
          {
            v5 = v15 + 2;
            if (v15 + 2 >= v10)
              goto LABEL_33;
            v16 = v6[v5];
            if (!v16)
            {
              v17 = v15 + 3;
              if (v17 >= v10)
              {
LABEL_33:
                v26 = 1 << *(_BYTE *)(v2 + 32);
                if (v26 > 63)
                  bzero((void *)(v2 + 56), ((unint64_t)(v26 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v6 = -1 << v26;
                v1 = v0;
                *(_QWORD *)(v2 + 16) = 0;
                break;
              }
              v16 = v6[v17];
              if (!v16)
              {
                while (1)
                {
                  v5 = v17 + 1;
                  if (__OFADD__(v17, 1))
                    goto LABEL_39;
                  if (v5 >= v10)
                    goto LABEL_33;
                  v16 = v6[v5];
                  ++v17;
                  if (v16)
                    goto LABEL_23;
                }
              }
              v5 = v17;
            }
          }
        }
LABEL_23:
        v9 = (v16 - 1) & v16;
        v14 = __clz(__rbit64(v16)) + (v5 << 6);
      }
      v18 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v14);
      sub_233AEBCF0();
      sub_233AEBCFC();
      result = sub_233AEBD14();
      v19 = -1 << *(_BYTE *)(v4 + 32);
      v20 = result & ~v19;
      v21 = v20 >> 6;
      if (((-1 << v20) & ~*(_QWORD *)(v11 + 8 * (v20 >> 6))) != 0)
      {
        v12 = __clz(__rbit64((-1 << v20) & ~*(_QWORD *)(v11 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v22 = 0;
        v23 = (unint64_t)(63 - v19) >> 6;
        do
        {
          if (++v21 == v23 && (v22 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v24 = v21 == v23;
          if (v21 == v23)
            v21 = 0;
          v22 |= v24;
          v25 = *(_QWORD *)(v11 + 8 * v21);
        }
        while (v25 == -1);
        v12 = __clz(__rbit64(~v25)) + (v21 << 6);
      }
      *(_QWORD *)(v11 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v12) = v18;
      ++*(_QWORD *)(v4 + 16);
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

uint64_t sub_233AE477C()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  unint64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t result;
  int64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25610DEF8);
  v3 = sub_233AEBB40();
  v4 = v3;
  if (*(_QWORD *)(v2 + 16))
  {
    v28 = v0;
    v5 = 1 << *(_BYTE *)(v2 + 32);
    v6 = (_QWORD *)(v2 + 56);
    if (v5 < 64)
      v7 = ~(-1 << v5);
    else
      v7 = -1;
    v8 = v7 & *(_QWORD *)(v2 + 56);
    v9 = (unint64_t)(v5 + 63) >> 6;
    v10 = v3 + 56;
    result = swift_retain();
    v12 = 0;
    while (1)
    {
      if (v8)
      {
        v14 = __clz(__rbit64(v8));
        v8 &= v8 - 1;
        v15 = v14 | (v12 << 6);
      }
      else
      {
        v16 = v12 + 1;
        if (__OFADD__(v12, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v9)
          goto LABEL_33;
        v17 = v6[v16];
        ++v12;
        if (!v17)
        {
          v12 = v16 + 1;
          if (v16 + 1 >= v9)
            goto LABEL_33;
          v17 = v6[v12];
          if (!v17)
          {
            v12 = v16 + 2;
            if (v16 + 2 >= v9)
              goto LABEL_33;
            v17 = v6[v12];
            if (!v17)
            {
              v18 = v16 + 3;
              if (v18 >= v9)
              {
LABEL_33:
                swift_release();
                v1 = v28;
                v27 = 1 << *(_BYTE *)(v2 + 32);
                if (v27 > 63)
                  bzero((void *)(v2 + 56), ((unint64_t)(v27 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v6 = -1 << v27;
                *(_QWORD *)(v2 + 16) = 0;
                break;
              }
              v17 = v6[v18];
              if (!v17)
              {
                while (1)
                {
                  v12 = v18 + 1;
                  if (__OFADD__(v18, 1))
                    goto LABEL_39;
                  if (v12 >= v9)
                    goto LABEL_33;
                  v17 = v6[v12];
                  ++v18;
                  if (v17)
                    goto LABEL_23;
                }
              }
              v12 = v18;
            }
          }
        }
LABEL_23:
        v8 = (v17 - 1) & v17;
        v15 = __clz(__rbit64(v17)) + (v12 << 6);
      }
      v19 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v15);
      result = sub_233AEBABC();
      v20 = -1 << *(_BYTE *)(v4 + 32);
      v21 = result & ~v20;
      v22 = v21 >> 6;
      if (((-1 << v21) & ~*(_QWORD *)(v10 + 8 * (v21 >> 6))) != 0)
      {
        v13 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v23 = 0;
        v24 = (unint64_t)(63 - v20) >> 6;
        do
        {
          if (++v22 == v24 && (v23 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v25 = v22 == v24;
          if (v22 == v24)
            v22 = 0;
          v23 |= v25;
          v26 = *(_QWORD *)(v10 + 8 * v22);
        }
        while (v26 == -1);
        v13 = __clz(__rbit64(~v26)) + (v22 << 6);
      }
      *(_QWORD *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v13) = v19;
      ++*(_QWORD *)(v4 + 16);
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

unint64_t sub_233AE4A18(uint64_t a1, uint64_t a2)
{
  unint64_t result;

  sub_233AEBABC();
  result = sub_233AEBAF8();
  *(_QWORD *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
  *(_QWORD *)(*(_QWORD *)(a2 + 48) + 8 * result) = a1;
  ++*(_QWORD *)(a2 + 16);
  return result;
}

uint64_t sub_233AE4A98(uint64_t result, unint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  v5 = result;
  v6 = *(_QWORD *)(*v3 + 16);
  v7 = *(_QWORD *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0)
    goto LABEL_14;
  if ((a3 & 1) != 0)
  {
    sub_233AE44D4();
  }
  else
  {
    if (v7 > v6)
    {
      result = (uint64_t)sub_233AE4D58();
      goto LABEL_14;
    }
    sub_233AE5094();
  }
  v8 = *v3;
  sub_233AEBCF0();
  sub_233AEBCFC();
  result = sub_233AEBD14();
  v9 = -1 << *(_BYTE *)(v8 + 32);
  a2 = result & ~v9;
  if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v10 = *(_QWORD *)(v8 + 48);
    if (*(_QWORD *)(v10 + 8 * a2) == v5)
    {
LABEL_13:
      type metadata accessor for HandleType(0);
      result = sub_233AEBCD8();
      __break(1u);
    }
    else
    {
      v11 = ~v9;
      while (1)
      {
        a2 = (a2 + 1) & v11;
        if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) == 0)
          break;
        if (*(_QWORD *)(v10 + 8 * a2) == v5)
          goto LABEL_13;
      }
    }
  }
LABEL_14:
  v12 = *v3;
  *(_QWORD *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(_QWORD *)(*(_QWORD *)(v12 + 48) + 8 * a2) = v5;
  v13 = *(_QWORD *)(v12 + 16);
  v14 = __OFADD__(v13, 1);
  v15 = v13 + 1;
  if (v14)
    __break(1u);
  else
    *(_QWORD *)(v12 + 16) = v15;
  return result;
}

void sub_233AE4BE4(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t *v3;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  char v12;
  uint64_t v13;
  id v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;

  v6 = *(_QWORD *)(*v3 + 16);
  v7 = *(_QWORD *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0)
    goto LABEL_14;
  if ((a3 & 1) != 0)
  {
    sub_233AE477C();
  }
  else
  {
    if (v7 > v6)
    {
      sub_233AE4EEC();
      goto LABEL_14;
    }
    sub_233AE530C();
  }
  v8 = *v3;
  v9 = sub_233AEBABC();
  v10 = -1 << *(_BYTE *)(v8 + 32);
  a2 = v9 & ~v10;
  if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    sub_233AD7D3C();
    v11 = *(id *)(*(_QWORD *)(v8 + 48) + 8 * a2);
    v12 = sub_233AEBAC8();

    if ((v12 & 1) != 0)
    {
LABEL_13:
      sub_233AEBCD8();
      __break(1u);
    }
    else
    {
      v13 = ~v10;
      while (1)
      {
        a2 = (a2 + 1) & v13;
        if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) == 0)
          break;
        v14 = *(id *)(*(_QWORD *)(v8 + 48) + 8 * a2);
        v15 = sub_233AEBAC8();

        if ((v15 & 1) != 0)
          goto LABEL_13;
      }
    }
  }
LABEL_14:
  v16 = *v3;
  *(_QWORD *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(_QWORD *)(*(_QWORD *)(v16 + 48) + 8 * a2) = a1;
  v17 = *(_QWORD *)(v16 + 16);
  v18 = __OFADD__(v17, 1);
  v19 = v17 + 1;
  if (v18)
    __break(1u);
  else
    *(_QWORD *)(v16 + 16) = v19;
}

void *sub_233AE4D58()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25610DF08);
  v2 = *v0;
  v3 = sub_233AEBB34();
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
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v15) = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v15);
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

id sub_233AE4EEC()
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
  void *v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25610DEF8);
  v2 = *v0;
  v3 = sub_233AEBB34();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_28:
    result = (id)swift_release();
    *v1 = v4;
    return result;
  }
  result = (id)(v3 + 56);
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
    v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v18 >= v13)
      goto LABEL_28;
    v19 = *(_QWORD *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      v9 = v18 + 1;
      if (v18 + 1 >= v13)
        goto LABEL_28;
      v19 = *(_QWORD *)(v6 + 8 * v9);
      if (!v19)
      {
        v9 = v18 + 2;
        if (v18 + 2 >= v13)
          goto LABEL_28;
        v19 = *(_QWORD *)(v6 + 8 * v9);
        if (!v19)
          break;
      }
    }
LABEL_27:
    v12 = (v19 - 1) & v19;
    v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(void **)(*(_QWORD *)(v2 + 48) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    result = v17;
  }
  v20 = v18 + 3;
  if (v20 >= v13)
    goto LABEL_28;
  v19 = *(_QWORD *)(v6 + 8 * v20);
  if (v19)
  {
    v9 = v20;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v19 = *(_QWORD *)(v6 + 8 * v9);
    ++v20;
    if (v19)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_233AE5094()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  unint64_t v23;
  BOOL v24;
  uint64_t v25;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25610DF08);
  result = sub_233AEBB40();
  v4 = result;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v4;
    return result;
  }
  v5 = 0;
  v6 = v2 + 56;
  v7 = 1 << *(_BYTE *)(v2 + 32);
  if (v7 < 64)
    v8 = ~(-1 << v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(v2 + 56);
  v10 = (unint64_t)(v7 + 63) >> 6;
  v11 = result + 56;
  while (1)
  {
    if (v9)
    {
      v13 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      v14 = v13 | (v5 << 6);
      goto LABEL_24;
    }
    v15 = v5 + 1;
    if (__OFADD__(v5, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v15 >= v10)
      goto LABEL_33;
    v16 = *(_QWORD *)(v6 + 8 * v15);
    ++v5;
    if (!v16)
    {
      v5 = v15 + 1;
      if (v15 + 1 >= v10)
        goto LABEL_33;
      v16 = *(_QWORD *)(v6 + 8 * v5);
      if (!v16)
      {
        v5 = v15 + 2;
        if (v15 + 2 >= v10)
          goto LABEL_33;
        v16 = *(_QWORD *)(v6 + 8 * v5);
        if (!v16)
          break;
      }
    }
LABEL_23:
    v9 = (v16 - 1) & v16;
    v14 = __clz(__rbit64(v16)) + (v5 << 6);
LABEL_24:
    v18 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v14);
    sub_233AEBCF0();
    sub_233AEBCFC();
    result = sub_233AEBD14();
    v19 = -1 << *(_BYTE *)(v4 + 32);
    v20 = result & ~v19;
    v21 = v20 >> 6;
    if (((-1 << v20) & ~*(_QWORD *)(v11 + 8 * (v20 >> 6))) != 0)
    {
      v12 = __clz(__rbit64((-1 << v20) & ~*(_QWORD *)(v11 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v22 = 0;
      v23 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v23 && (v22 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v24 = v21 == v23;
        if (v21 == v23)
          v21 = 0;
        v22 |= v24;
        v25 = *(_QWORD *)(v11 + 8 * v21);
      }
      while (v25 == -1);
      v12 = __clz(__rbit64(~v25)) + (v21 << 6);
    }
    *(_QWORD *)(v11 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v12) = v18;
    ++*(_QWORD *)(v4 + 16);
  }
  v17 = v15 + 3;
  if (v17 >= v10)
  {
LABEL_33:
    result = swift_release();
    v1 = v0;
    goto LABEL_35;
  }
  v16 = *(_QWORD *)(v6 + 8 * v17);
  if (v16)
  {
    v5 = v17;
    goto LABEL_23;
  }
  while (1)
  {
    v5 = v17 + 1;
    if (__OFADD__(v17, 1))
      break;
    if (v5 >= v10)
      goto LABEL_33;
    v16 = *(_QWORD *)(v6 + 8 * v5);
    ++v17;
    if (v16)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_233AE530C()
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
  int64_t v9;
  uint64_t v10;
  uint64_t result;
  int64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  id v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t *v27;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25610DEF8);
  v3 = sub_233AEBB40();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v4;
    return result;
  }
  v27 = v0;
  v5 = 1 << *(_BYTE *)(v2 + 32);
  v6 = v2 + 56;
  if (v5 < 64)
    v7 = ~(-1 << v5);
  else
    v7 = -1;
  v8 = v7 & *(_QWORD *)(v2 + 56);
  v9 = (unint64_t)(v5 + 63) >> 6;
  v10 = v3 + 56;
  result = swift_retain();
  v12 = 0;
  while (1)
  {
    if (v8)
    {
      v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      v15 = v14 | (v12 << 6);
      goto LABEL_24;
    }
    v16 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v9)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v16);
    ++v12;
    if (!v17)
    {
      v12 = v16 + 1;
      if (v16 + 1 >= v9)
        goto LABEL_33;
      v17 = *(_QWORD *)(v6 + 8 * v12);
      if (!v17)
      {
        v12 = v16 + 2;
        if (v16 + 2 >= v9)
          goto LABEL_33;
        v17 = *(_QWORD *)(v6 + 8 * v12);
        if (!v17)
          break;
      }
    }
LABEL_23:
    v8 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v12 << 6);
LABEL_24:
    v19 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * v15);
    result = sub_233AEBABC();
    v20 = -1 << *(_BYTE *)(v4 + 32);
    v21 = result & ~v20;
    v22 = v21 >> 6;
    if (((-1 << v21) & ~*(_QWORD *)(v10 + 8 * (v21 >> 6))) != 0)
    {
      v13 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v23 = 0;
      v24 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v25 = v22 == v24;
        if (v22 == v24)
          v22 = 0;
        v23 |= v25;
        v26 = *(_QWORD *)(v10 + 8 * v22);
      }
      while (v26 == -1);
      v13 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(_QWORD *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v13) = v19;
    ++*(_QWORD *)(v4 + 16);
  }
  v18 = v16 + 3;
  if (v18 >= v9)
  {
LABEL_33:
    result = swift_release_n();
    v1 = v27;
    goto LABEL_35;
  }
  v17 = *(_QWORD *)(v6 + 8 * v18);
  if (v17)
  {
    v12 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    v12 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v12 >= v9)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v12);
    ++v18;
    if (v17)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_233AE5584(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int64_t v7;
  uint64_t result;
  uint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v13;
  int64_t v14;

  sub_233AEBD14();
  v3 = a2 + 56;
  v4 = 1 << *(_BYTE *)(a2 + 32);
  v5 = -1;
  if (v4 < 64)
    v5 = ~(-1 << v4);
  v6 = v5 & *(_QWORD *)(a2 + 56);
  v7 = (unint64_t)(v4 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v9 = 0;
  v10 = 0;
  while (1)
  {
    if (v6)
    {
      v6 &= v6 - 1;
      goto LABEL_5;
    }
    if (__OFADD__(v10++, 1))
      goto LABEL_19;
    if (v10 >= v7)
    {
LABEL_17:
      swift_release();
      return sub_233AEBCFC();
    }
    v13 = *(_QWORD *)(v3 + 8 * v10);
    if (!v13)
      break;
LABEL_16:
    v6 = (v13 - 1) & v13;
LABEL_5:
    sub_233AEBCF0();
    sub_233AEBCFC();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    sub_233AEB9CC();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_233AEB9CC();
    swift_bridgeObjectRelease();
    v11 = sub_233AEBD14();
    swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
    v9 ^= v11;
  }
  v14 = v10 + 1;
  if (v10 + 1 >= v7)
    goto LABEL_17;
  v13 = *(_QWORD *)(v3 + 8 * v14);
  if (v13)
  {
    ++v10;
    goto LABEL_16;
  }
  while (1)
  {
    v10 = v14 + 1;
    if (__OFADD__(v14, 1))
      break;
    if (v10 >= v7)
      goto LABEL_17;
    v13 = *(_QWORD *)(v3 + 8 * v10);
    ++v14;
    if (v13)
      goto LABEL_16;
  }
  __break(1u);
LABEL_19:
  __break(1u);
  return result;
}

uint64_t sub_233AE5770(uint64_t a1)
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
  if (v6 < 8)
    return v3;
  v1 = *(_QWORD *)(a1 + 72);
  if (v1)
  {
    v2 = 128;
    return __clz(__rbit64(v1)) + v2;
  }
  v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 3)
    v7 = 3;
  v8 = v7 - 3;
  v9 = (unint64_t *)(a1 + 80);
  v2 = 128;
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

int64_t sub_233AE5814(int64_t result, int a2, char a3, uint64_t a4)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;

  if ((a3 & 1) != 0)
    goto LABEL_20;
  v4 = result;
  if (result < 0 || (result = 1 << *(_BYTE *)(a4 + 32), result <= (uint64_t)v4))
  {
    __break(1u);
    goto LABEL_18;
  }
  v5 = v4 >> 6;
  v6 = a4 + 56;
  v7 = *(_QWORD *)(a4 + 56 + 8 * (v4 >> 6));
  if (((v7 >> v4) & 1) == 0)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (*(_DWORD *)(a4 + 36) != a2)
  {
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    return result;
  }
  v8 = v7 & (-2 << (v4 & 0x3F));
  if (v8)
    return __clz(__rbit64(v8)) | v4 & 0xFFFFFFFFFFFFFFC0;
  v9 = v5 + 1;
  v10 = (unint64_t)(result + 63) >> 6;
  if (v5 + 1 < v10)
  {
    v11 = *(_QWORD *)(v6 + 8 * v9);
    if (v11)
      return __clz(__rbit64(v11)) + (v9 << 6);
    v9 = v5 + 2;
    if (v5 + 2 < v10)
    {
      v11 = *(_QWORD *)(v6 + 8 * v9);
      if (v11)
        return __clz(__rbit64(v11)) + (v9 << 6);
      while (v10 - 3 != v5)
      {
        v11 = *(_QWORD *)(a4 + 80 + 8 * v5++);
        if (v11)
        {
          v9 = v5 + 2;
          return __clz(__rbit64(v11)) + (v9 << 6);
        }
      }
    }
  }
  return result;
}

uint64_t _s20LiveCommunicationKit12ConversationC6UpdateV2eeoiySbAE_AEtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  char v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  char v27;
  uint64_t result;
  uint64_t v29;
  char v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  char v38;
  uint64_t v39;
  char v40;
  char v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char v47;
  uint64_t v48;
  char v49;
  char v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char v54;
  char v55;
  uint64_t v56;
  uint64_t v57;

  v2 = *(_QWORD *)a1;
  v3 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD *)(a1 + 16);
  v4 = *(_QWORD *)(a1 + 24);
  v7 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 48);
  v8 = *(_QWORD *)(a1 + 56);
  v10 = *(_BYTE *)(a1 + 64);
  v12 = *(_QWORD *)a2;
  v11 = *(_QWORD *)(a2 + 8);
  v13 = *(_QWORD *)(a2 + 16);
  v14 = *(_QWORD *)(a2 + 24);
  v16 = *(_QWORD *)(a2 + 32);
  v15 = *(_QWORD *)(a2 + 40);
  v18 = *(_QWORD *)(a2 + 48);
  v17 = *(_QWORD *)(a2 + 56);
  v19 = *(_BYTE *)(a2 + 64);
  if (!v5)
  {
    if (!v13)
      goto LABEL_12;
LABEL_17:
    sub_233AD6470(v12, v11, v13);
    sub_233AD64D4(v2, v3, v5);
    sub_233AD64D4(v12, v11, v13);
    return 0;
  }
  if (!v13)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    goto LABEL_17;
  }
  if (v12 != v2)
    return 0;
  if (v3 == v11 && v5 == v13)
    goto LABEL_36;
  v56 = *(_QWORD *)(a1 + 56);
  v57 = *(_QWORD *)(a1 + 40);
  v20 = *(_BYTE *)(a1 + 64);
  v21 = *(_BYTE *)(a2 + 64);
  v22 = *(_QWORD *)(a1 + 48);
  v23 = *(_QWORD *)(a2 + 56);
  v24 = *(_QWORD *)(a2 + 48);
  v25 = *(_QWORD *)(a2 + 40);
  v26 = sub_233AEBCCC();
  v15 = v25;
  v8 = v56;
  v6 = v57;
  v18 = v24;
  v17 = v23;
  v9 = v22;
  v19 = v21;
  v10 = v20;
  v27 = v26;
  result = 0;
  if ((v27 & 1) != 0)
  {
LABEL_36:
    if (v4 == v14 && v7 == v16)
      goto LABEL_12;
    v29 = v8;
    v30 = v10;
    v31 = v19;
    v32 = v9;
    v33 = v17;
    v34 = v18;
    v35 = v6;
    v36 = v15;
    v37 = sub_233AEBCCC();
    v15 = v36;
    v6 = v35;
    v18 = v34;
    v17 = v33;
    v9 = v32;
    v19 = v31;
    v10 = v30;
    v8 = v29;
    v38 = v37;
    result = 0;
    if ((v38 & 1) != 0)
    {
LABEL_12:
      if (v6)
      {
        if (!v15)
          return 0;
        v39 = v8;
        v40 = v10;
        v41 = v19;
        v42 = v9;
        v43 = v17;
        v44 = v18;
        v45 = v15;
        swift_bridgeObjectRetain();
        v46 = swift_bridgeObjectRetain();
        v47 = sub_233AE3C38(v46, v45);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v18 = v44;
        v17 = v43;
        v9 = v42;
        v19 = v41;
        v10 = v40;
        v8 = v39;
        if ((v47 & 1) == 0)
          return 0;
      }
      else if (v15)
      {
        return 0;
      }
      if (v9)
      {
        if (!v18)
          return 0;
        v48 = v8;
        v49 = v10;
        v50 = v19;
        v51 = v17;
        v52 = v18;
        swift_bridgeObjectRetain();
        v53 = swift_bridgeObjectRetain();
        v54 = sub_233AE3C38(v53, v52);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v17 = v51;
        v19 = v50;
        v10 = v49;
        v8 = v48;
        if ((v54 & 1) == 0)
          return 0;
      }
      else if (v18)
      {
        return 0;
      }
      if ((v10 & 1) != 0)
      {
        if ((v19 & 1) != 0)
          return 1;
      }
      else
      {
        if (v8 == v17)
          v55 = v19;
        else
          v55 = 1;
        if ((v55 & 1) == 0)
          return 1;
      }
      return 0;
    }
  }
  return result;
}

unint64_t sub_233AE5BB8()
{
  unint64_t result;

  result = qword_25610DE88;
  if (!qword_25610DE88)
  {
    result = MEMORY[0x23493BDC0](&unk_233AED244, &_s14descr2504D6961C6UpdateV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25610DE88);
  }
  return result;
}

unint64_t sub_233AE5BFC()
{
  unint64_t result;

  result = qword_25610DE90;
  if (!qword_25610DE90)
  {
    result = MEMORY[0x23493BDC0](&protocol conformance descriptor for Handle, &type metadata for Handle);
    atomic_store(result, (unint64_t *)&qword_25610DE90);
  }
  return result;
}

unint64_t sub_233AE5C40()
{
  unint64_t result;

  result = qword_25610DEA8;
  if (!qword_25610DEA8)
  {
    result = MEMORY[0x23493BDC0](&protocol conformance descriptor for Conversation.Capabilities, &type metadata for Conversation.Capabilities);
    atomic_store(result, (unint64_t *)&qword_25610DEA8);
  }
  return result;
}

unint64_t sub_233AE5C84()
{
  unint64_t result;

  result = qword_25610DEB8;
  if (!qword_25610DEB8)
  {
    result = MEMORY[0x23493BDC0](&protocol conformance descriptor for Handle, &type metadata for Handle);
    atomic_store(result, (unint64_t *)&qword_25610DEB8);
  }
  return result;
}

uint64_t sub_233AE5CC8(unint64_t *a1, uint64_t (*a2)(void), uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  result = *a1;
  if (!result)
  {
    v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25610DE98);
    v8 = a2();
    result = MEMORY[0x23493BDC0](a3, v7, &v8);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_233AE5D30()
{
  unint64_t result;

  result = qword_25610DEC8;
  if (!qword_25610DEC8)
  {
    result = MEMORY[0x23493BDC0](&protocol conformance descriptor for Conversation.Capabilities, &type metadata for Conversation.Capabilities);
    atomic_store(result, (unint64_t *)&qword_25610DEC8);
  }
  return result;
}

unint64_t sub_233AE5D78()
{
  unint64_t result;

  result = qword_25610DED0;
  if (!qword_25610DED0)
  {
    result = MEMORY[0x23493BDC0](&protocol conformance descriptor for Conversation.Update, &type metadata for Conversation.Update);
    atomic_store(result, (unint64_t *)&qword_25610DED0);
  }
  return result;
}

uint64_t _s14descr2504D6961C6UpdateVwxx(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 16))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t _s14descr2504D6961C6UpdateVwcp(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;

  v4 = *(_QWORD *)(a2 + 16);
  if (v4)
  {
    *(_BYTE *)a1 = *(_BYTE *)a2;
    *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
    *(_QWORD *)(a1 + 16) = v4;
    v5 = *(_QWORD *)(a2 + 32);
    *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
    *(_QWORD *)(a1 + 32) = v5;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    v6 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v6;
    *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  }
  v7 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v7;
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t _s14descr2504D6961C6UpdateVwca(uint64_t a1, __int128 *a2)
{
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  v4 = *((_QWORD *)a2 + 2);
  if (*(_QWORD *)(a1 + 16))
  {
    if (v4)
    {
      *(_BYTE *)a1 = *(_BYTE *)a2;
      *(_QWORD *)(a1 + 8) = *((_QWORD *)a2 + 1);
      *(_QWORD *)(a1 + 16) = *((_QWORD *)a2 + 2);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(_QWORD *)(a1 + 24) = *((_QWORD *)a2 + 3);
      *(_QWORD *)(a1 + 32) = *((_QWORD *)a2 + 4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_233AD60D0(a1);
      v5 = *((_QWORD *)a2 + 4);
      v6 = a2[1];
      *(_OWORD *)a1 = *a2;
      *(_OWORD *)(a1 + 16) = v6;
      *(_QWORD *)(a1 + 32) = v5;
    }
  }
  else if (v4)
  {
    *(_BYTE *)a1 = *(_BYTE *)a2;
    *(_QWORD *)(a1 + 8) = *((_QWORD *)a2 + 1);
    *(_QWORD *)(a1 + 16) = *((_QWORD *)a2 + 2);
    *(_QWORD *)(a1 + 24) = *((_QWORD *)a2 + 3);
    *(_QWORD *)(a1 + 32) = *((_QWORD *)a2 + 4);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    v7 = *a2;
    v8 = a2[1];
    *(_QWORD *)(a1 + 32) = *((_QWORD *)a2 + 4);
    *(_OWORD *)a1 = v7;
    *(_OWORD *)(a1 + 16) = v8;
  }
  *(_QWORD *)(a1 + 40) = *((_QWORD *)a2 + 5);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 48) = *((_QWORD *)a2 + 6);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v9 = *((_QWORD *)a2 + 7);
  *(_BYTE *)(a1 + 64) = *((_BYTE *)a2 + 64);
  *(_QWORD *)(a1 + 56) = v9;
  return a1;
}

__n128 __swift_memcpy65_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  result = *(__n128 *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t _s14descr2504D6961C6UpdateVwta(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  __int128 v6;

  if (!*(_QWORD *)(a1 + 16))
    goto LABEL_5;
  v4 = *(_QWORD *)(a2 + 16);
  if (!v4)
  {
    sub_233AD60D0(a1);
LABEL_5:
    v6 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v6;
    *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
    goto LABEL_6;
  }
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v5;
  swift_bridgeObjectRelease();
LABEL_6:
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  return a1;
}

uint64_t _s14descr2504D6961C6UpdateVwet(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 65))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 16);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t _s14descr2504D6961C6UpdateVwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 64) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 65) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 65) = 0;
    if (a2)
      *(_QWORD *)(result + 16) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for Conversation.Update()
{
  return &type metadata for Conversation.Update;
}

uint64_t _s14descr2504D6961C6UpdateV10CodingKeysOwst(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_233AE619C + 4 * byte_233AED0A5[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_233AE61D0 + 4 * byte_233AED0A0[v4]))();
}

uint64_t sub_233AE61D0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_233AE61D8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x233AE61E0);
  return result;
}

uint64_t sub_233AE61EC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x233AE61F4);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_233AE61F8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_233AE6200(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *_s14descr2504D6961C6UpdateV10CodingKeysOMa()
{
  return &_s14descr2504D6961C6UpdateV10CodingKeysON;
}

unint64_t sub_233AE6220()
{
  unint64_t result;

  result = qword_25610DED8;
  if (!qword_25610DED8)
  {
    result = MEMORY[0x23493BDC0](&unk_233AED21C, &_s14descr2504D6961C6UpdateV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25610DED8);
  }
  return result;
}

unint64_t sub_233AE6268()
{
  unint64_t result;

  result = qword_25610DEE0;
  if (!qword_25610DEE0)
  {
    result = MEMORY[0x23493BDC0](&unk_233AED18C, &_s14descr2504D6961C6UpdateV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25610DEE0);
  }
  return result;
}

unint64_t sub_233AE62B0()
{
  unint64_t result;

  result = qword_25610DEE8;
  if (!qword_25610DEE8)
  {
    result = MEMORY[0x23493BDC0](&unk_233AED1B4, &_s14descr2504D6961C6UpdateV10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25610DEE8);
  }
  return result;
}

uint64_t sub_233AE62F4(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = *(_QWORD *)(a1 + 16);
  type metadata accessor for HandleType(0);
  sub_233ADF2B4(&qword_25610DF00, (uint64_t (*)(uint64_t))type metadata accessor for HandleType, (uint64_t)&unk_233AEC3D4);
  result = sub_233AEBA8C();
  v7 = result;
  if (v2)
  {
    v4 = (uint64_t *)(a1 + 32);
    do
    {
      v5 = *v4++;
      sub_233AE3F58(&v6, v5);
      --v2;
    }
    while (v2);
    return v7;
  }
  return result;
}

uint64_t sub_233AE6384(unint64_t a1)
{
  unint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void **v7;
  void *v8;
  id v9;
  uint64_t v10;

  v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_233AEBC0C();
    swift_bridgeObjectRelease();
  }
  sub_233AD7D3C();
  sub_233ADF2B4(&qword_25610DEF0, (uint64_t (*)(uint64_t))sub_233AD7D3C, MEMORY[0x24BEE5BD8]);
  result = sub_233AEBA8C();
  v10 = result;
  if (v2)
  {
    swift_bridgeObjectRetain();
    v4 = sub_233AEBC0C();
    result = swift_bridgeObjectRelease();
    if (!v4)
      return v10;
  }
  else
  {
    v4 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v4)
      return v10;
  }
  if (v4 >= 1)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (i = 0; i != v4; ++i)
      {
        v6 = (void *)MEMORY[0x23493B8D4](i, a1);
        sub_233AE4074(&v9, v6);

      }
    }
    else
    {
      v7 = (void **)(a1 + 32);
      do
      {
        v8 = *v7++;
        sub_233AE4074(&v9, v8);

        --v4;
      }
      while (v4);
    }
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_233AE64E4(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x6D654D6C61636F6CLL && a2 == 0xEB00000000726562;
  if (v2 || (sub_233AEBCCC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x737265626D656DLL && a2 == 0xE700000000000000 || (sub_233AEBCCC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000013 && a2 == 0x8000000233AEEAD0 || (sub_233AEBCCC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x696C696261706163 && a2 == 0xEC00000073656974)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    v6 = sub_233AEBCCC();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 3;
    else
      return 4;
  }
}

LiveCommunicationKit::PlayToneAction::Tone_optional __swiftcall PlayToneAction.Tone.init(rawValue:)(Swift::Int rawValue)
{
  _BYTE *v1;
  unsigned int v2;

  v2 = 0x2010003u >> (8 * rawValue);
  if ((unint64_t)rawValue >= 4)
    LOBYTE(v2) = 3;
  *v1 = v2;
  return (LiveCommunicationKit::PlayToneAction::Tone_optional)rawValue;
}

uint64_t PlayToneAction.Tone.rawValue.getter()
{
  unsigned __int8 *v0;

  return *v0 + 1;
}

uint64_t sub_233AE66F4()
{
  sub_233AEBCF0();
  sub_233AEBCFC();
  return sub_233AEBD14();
}

uint64_t sub_233AE6738()
{
  return sub_233AEBCFC();
}

uint64_t sub_233AE6764()
{
  sub_233AEBCF0();
  sub_233AEBCFC();
  return sub_233AEBD14();
}

LiveCommunicationKit::PlayToneAction::Tone_optional sub_233AE67A4(Swift::Int *a1)
{
  return PlayToneAction.Tone.init(rawValue:)(*a1);
}

void sub_233AE67AC(_QWORD *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = *v1 + 1;
}

uint64_t PlayToneAction.digits.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC20LiveCommunicationKit14PlayToneAction_digits);
  swift_bridgeObjectRetain();
  return v1;
}

void PlayToneAction.tone.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + OBJC_IVAR____TtC20LiveCommunicationKit14PlayToneAction_tone);
}

uint64_t PlayToneAction.__allocating_init(conversationUUID:digits:tone:)(char *a1, uint64_t a2, uint64_t a3, unsigned __int8 *a4)
{
  uint64_t v8;

  v8 = swift_allocObject();
  PlayToneAction.init(conversationUUID:digits:tone:)(a1, a2, a3, a4);
  return v8;
}

uint64_t PlayToneAction.init(conversationUUID:digits:tone:)(char *a1, uint64_t a2, uint64_t a3, unsigned __int8 *a4)
{
  uint64_t v4;
  uint64_t v5;
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
  uint64_t v21;
  uint64_t v22;
  id v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  void (*v28)(char *, uint64_t);
  _QWORD *v29;
  char *v30;
  char *v31;
  char *v32;
  _QWORD *v33;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  void (*v38)(char *, uint64_t, uint64_t);
  char *v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;

  v5 = v4;
  v37 = a1;
  v10 = sub_233AEB8B8();
  v41 = *(_QWORD *)(v10 - 8);
  v42 = v10;
  MEMORY[0x24BDAC7A8](v10, v11);
  v40 = (char *)&v35 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_233AEB8E8();
  v14 = *(_QWORD *)(v13 - 8);
  v16 = MEMORY[0x24BDAC7A8](v13, v15);
  v39 = (char *)&v35 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16, v18);
  v20 = (char *)&v35 - v19;
  v21 = *a4;
  v36 = v21;
  v38 = *(void (**)(char *, uint64_t, uint64_t))(v14 + 16);
  v38((char *)&v35 - v19, (uint64_t)a1, v13);
  v22 = v21 + 1;
  v23 = objc_allocWithZone(MEMORY[0x24BDB78F8]);
  swift_retain();
  swift_bridgeObjectRetain();
  v24 = (void *)sub_233AEB8C4();
  v25 = a2;
  v26 = (void *)sub_233AEB99C();
  swift_bridgeObjectRelease();
  v27 = objc_msgSend(v23, sel_initWithCallUUID_digits_type_, v24, v26, v22);

  v28 = *(void (**)(char *, uint64_t))(v14 + 8);
  v28(v20, v13);
  v29 = (_QWORD *)(v5 + OBJC_IVAR____TtC20LiveCommunicationKit14PlayToneAction_digits);
  *v29 = v25;
  v29[1] = a3;
  *(_BYTE *)(v5 + OBJC_IVAR____TtC20LiveCommunicationKit14PlayToneAction_tone) = v36;
  swift_release();
  v30 = v39;
  v31 = v37;
  v38(v39, (uint64_t)v37, v13);
  v32 = v40;
  sub_233AEB8A0();
  v28(v31, v13);
  *(_QWORD *)(v5 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_cxAction) = v27;
  (*(void (**)(uint64_t, char *, uint64_t))(v14 + 32))(v5 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_conversationUUID, v30, v13);
  v33 = (_QWORD *)(v5 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_state);
  *v33 = 0;
  v33[1] = 0;
  (*(void (**)(uint64_t, char *, uint64_t))(v41 + 32))(v5 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_timeoutDate, v32, v42);
  return v5;
}

uint64_t sub_233AE6ABC(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  id v18;
  uint64_t v19;
  id v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  uint64_t v24;
  unint64_t v25;
  os_log_t v26;
  uint8_t *v27;
  uint64_t v28;
  id v29;
  _QWORD *v30;
  uint64_t v32;
  uint64_t v33;
  os_log_t v34;
  uint8_t *v35;
  int v36;
  uint64_t v37;
  id v38;
  uint64_t v39;

  v2 = v1;
  v37 = sub_233AEB8B8();
  v4 = *(_QWORD *)(v37 - 8);
  MEMORY[0x24BDAC7A8](v37, v5);
  v7 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_233AEB8E8();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8, v10);
  v12 = (char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  v13 = objc_msgSend(a1, sel_digits);
  v14 = sub_233AEB9A8();
  v16 = v15;

  v17 = (uint64_t *)(v2 + OBJC_IVAR____TtC20LiveCommunicationKit14PlayToneAction_digits);
  *v17 = v14;
  v17[1] = v16;
  v18 = objc_msgSend(a1, sel_type);
  if (v18 == (id)1)
  {
LABEL_11:
    *(_BYTE *)(v2 + OBJC_IVAR____TtC20LiveCommunicationKit14PlayToneAction_tone) = 0;
    goto LABEL_12;
  }
  if (v18 == (id)2)
  {
    *(_BYTE *)(v2 + OBJC_IVAR____TtC20LiveCommunicationKit14PlayToneAction_tone) = 1;
    goto LABEL_12;
  }
  if (v18 != (id)3)
  {
    if (qword_25610D350 != -1)
      swift_once();
    v19 = sub_233AEB954();
    __swift_project_value_buffer(v19, (uint64_t)qword_25610E4F0);
    v20 = a1;
    v21 = sub_233AEB93C();
    v22 = sub_233AEBAA4();
    v36 = v22;
    if (os_log_type_enabled(v21, v22))
    {
      v34 = v21;
      v35 = (uint8_t *)swift_slowAlloc();
      v33 = swift_slowAlloc();
      v39 = v33;
      v23 = v35;
      *(_DWORD *)v35 = 136315138;
      v38 = objc_msgSend(v20, sel_type, v23 + 4);
      v24 = sub_233AEB9C0();
      v38 = (id)sub_233AD6E3C(v24, v25, &v39);
      sub_233AEBAD4();

      swift_bridgeObjectRelease();
      v26 = v34;
      v27 = v35;
      v28 = v33;
      swift_arrayDestroy();
      MEMORY[0x23493BE50](v28, -1, -1);
      MEMORY[0x23493BE50](v27, -1, -1);

    }
    else
    {

    }
    goto LABEL_11;
  }
  *(_BYTE *)(v2 + OBJC_IVAR____TtC20LiveCommunicationKit14PlayToneAction_tone) = 2;
LABEL_12:
  swift_release();
  v29 = objc_msgSend(a1, sel_callUUID);
  sub_233AEB8DC();

  sub_233AEB8A0();
  *(_QWORD *)(v2 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_cxAction) = a1;
  (*(void (**)(uint64_t, char *, uint64_t))(v9 + 32))(v2 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_conversationUUID, v12, v8);
  v30 = (_QWORD *)(v2 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_state);
  *v30 = 0;
  v30[1] = 0;
  (*(void (**)(uint64_t, char *, uint64_t))(v4 + 32))(v2 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_timeoutDate, v7, v37);
  return v2;
}

void sub_233AE6E40()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_233AE6E6C()
{
  return swift_bridgeObjectRelease();
}

uint64_t PlayToneAction.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_conversationUUID;
  v2 = sub_233AEB8E8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  sub_233AD3F34(*(_QWORD *)(v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_state), *(_QWORD *)(v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_state + 8));
  v3 = v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_timeoutDate;
  v4 = sub_233AEB8B8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

  swift_bridgeObjectRelease();
  return v0;
}

uint64_t PlayToneAction.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_conversationUUID;
  v2 = sub_233AEB8E8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  sub_233AD3F34(*(_QWORD *)(v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_state), *(_QWORD *)(v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_state + 8));
  v3 = v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_timeoutDate;
  v4 = sub_233AEB8B8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

unint64_t sub_233AE6FF8()
{
  unint64_t result;

  result = qword_25610DF10;
  if (!qword_25610DF10)
  {
    result = MEMORY[0x23493BDC0](&protocol conformance descriptor for PlayToneAction.Tone, &type metadata for PlayToneAction.Tone);
    atomic_store(result, (unint64_t *)&qword_25610DF10);
  }
  return result;
}

uint64_t sub_233AE703C()
{
  return type metadata accessor for PlayToneAction();
}

uint64_t type metadata accessor for PlayToneAction()
{
  uint64_t result;

  result = qword_25610DF40;
  if (!qword_25610DF40)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_233AE7080()
{
  return swift_updateClassMetadata2();
}

uint64_t method lookup function for PlayToneAction()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PlayToneAction.__allocating_init(conversationUUID:digits:tone:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 136))();
}

uint64_t getEnumTagSinglePayload for PlayToneAction.Tone(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for PlayToneAction.Tone(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_233AE71B8 + 4 * byte_233AED2A5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_233AE71EC + 4 * byte_233AED2A0[v4]))();
}

uint64_t sub_233AE71EC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_233AE71F4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x233AE71FCLL);
  return result;
}

uint64_t sub_233AE7208(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x233AE7210);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_233AE7214(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_233AE721C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for PlayToneAction.Tone()
{
  return &type metadata for PlayToneAction.Tone;
}

uint64_t sub_233AE7250(char *a1, uint64_t a2, void *a3, _QWORD *a4)
{
  void (*v5)(uint64_t);
  id v6;
  char *v7;
  uint64_t v8;

  v5 = *(void (**)(uint64_t))&a1[*a4];
  v6 = a3;
  v7 = a1;
  v8 = swift_retain();
  v5(v8);

  return swift_release();
}

uint64_t sub_233AE7320(char *a1, uint64_t a2, void *a3, void *a4, _QWORD *a5)
{
  void (*v7)(id);
  id v8;
  id v9;
  char *v10;

  v7 = *(void (**)(id))&a1[*a5];
  v8 = a3;
  v9 = a4;
  v10 = a1;
  swift_retain();
  v7(v9);

  return swift_release();
}

id sub_233AE7398()
{
  char *v0;
  char *v1;
  char *v2;
  char *v3;
  char *v4;
  char *v5;
  char *v6;
  char *v7;
  char *v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  char *v13;
  objc_super v15;

  v1 = &v0[OBJC_IVAR____TtC20LiveCommunicationKit19CallProviderWrapper_onProviderDidReset];
  *(_QWORD *)v1 = nullsub_1;
  *((_QWORD *)v1 + 1) = 0;
  v2 = &v0[OBJC_IVAR____TtC20LiveCommunicationKit19CallProviderWrapper_onProviderDidBegin];
  *(_QWORD *)v2 = nullsub_1;
  *((_QWORD *)v2 + 1) = 0;
  v3 = &v0[OBJC_IVAR____TtC20LiveCommunicationKit19CallProviderWrapper_onProviderDidActivateAudioSession];
  *(_QWORD *)v3 = nullsub_1;
  *((_QWORD *)v3 + 1) = 0;
  v4 = &v0[OBJC_IVAR____TtC20LiveCommunicationKit19CallProviderWrapper_onProviderDidDeactivateAudioSession];
  *(_QWORD *)v4 = nullsub_1;
  *((_QWORD *)v4 + 1) = 0;
  v5 = &v0[OBJC_IVAR____TtC20LiveCommunicationKit19CallProviderWrapper_onProviderTimedOutPerformingAction];
  *(_QWORD *)v5 = nullsub_1;
  *((_QWORD *)v5 + 1) = 0;
  v6 = &v0[OBJC_IVAR____TtC20LiveCommunicationKit19CallProviderWrapper_onProviderPerformAction];
  *(_QWORD *)v6 = nullsub_1;
  *((_QWORD *)v6 + 1) = 0;
  v7 = &v0[OBJC_IVAR____TtC20LiveCommunicationKit19CallProviderWrapper_onProviderPerformStartCallAction];
  *(_QWORD *)v7 = nullsub_1;
  *((_QWORD *)v7 + 1) = 0;
  v8 = &v0[OBJC_IVAR____TtC20LiveCommunicationKit19CallProviderWrapper_onProviderPerformAnswerCallAction];
  *(_QWORD *)v8 = nullsub_1;
  *((_QWORD *)v8 + 1) = 0;
  v9 = &v0[OBJC_IVAR____TtC20LiveCommunicationKit19CallProviderWrapper_onProviderPerformEndCallAction];
  *(_QWORD *)v9 = nullsub_1;
  *((_QWORD *)v9 + 1) = 0;
  v10 = &v0[OBJC_IVAR____TtC20LiveCommunicationKit19CallProviderWrapper_onProviderPerformSetHeldCallAction];
  *(_QWORD *)v10 = nullsub_1;
  *((_QWORD *)v10 + 1) = 0;
  v11 = &v0[OBJC_IVAR____TtC20LiveCommunicationKit19CallProviderWrapper_onProviderPerformSetMutedCallAction];
  *(_QWORD *)v11 = nullsub_1;
  *((_QWORD *)v11 + 1) = 0;
  v12 = &v0[OBJC_IVAR____TtC20LiveCommunicationKit19CallProviderWrapper_onProviderPerformSetGroupCallAction];
  *(_QWORD *)v12 = nullsub_1;
  *((_QWORD *)v12 + 1) = 0;
  v13 = &v0[OBJC_IVAR____TtC20LiveCommunicationKit19CallProviderWrapper_onProviderPerformPlayDTMFCallAction];
  *(_QWORD *)v13 = nullsub_1;
  *((_QWORD *)v13 + 1) = 0;
  v15.receiver = v0;
  v15.super_class = (Class)type metadata accessor for CallProviderWrapper();
  return objc_msgSendSuper2(&v15, sel_init);
}

id sub_233AE7520()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CallProviderWrapper();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for CallProviderWrapper()
{
  return objc_opt_self();
}

uint64_t EndConversationAction.__allocating_init(conversationUUID:)(uint64_t a1)
{
  uint64_t v2;

  v2 = swift_allocObject();
  EndConversationAction.init(conversationUUID:)(a1);
  return v2;
}

uint64_t EndConversationAction.init(conversationUUID:)(uint64_t a1)
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
  uint64_t v12;
  char *v13;
  id v14;
  void *v15;
  id v16;
  _QWORD *v17;
  uint64_t v19;

  v2 = v1;
  v4 = sub_233AEB8B8();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4, v6);
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_233AEB8E8();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9, v11);
  v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = objc_allocWithZone(MEMORY[0x24BDB78E0]);
  v15 = (void *)sub_233AEB8C4();
  v16 = objc_msgSend(v14, sel_initWithCallUUID_, v15);

  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v13, a1, v9);
  sub_233AEB8A0();
  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(a1, v9);
  *(_QWORD *)(v2 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_cxAction) = v16;
  (*(void (**)(uint64_t, char *, uint64_t))(v10 + 32))(v2 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_conversationUUID, v13, v9);
  v17 = (_QWORD *)(v2 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_state);
  *v17 = 0;
  v17[1] = 0;
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))(v2 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_timeoutDate, v8, v4);
  return v2;
}

void EndConversationAction.fulfill(dateEnded:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  _QWORD v20[2];
  uint64_t v21;
  uint64_t v22;

  v3 = sub_233AEB8B8();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3, v5);
  v7 = (char *)v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_25610D350 != -1)
    swift_once();
  v8 = sub_233AEB954();
  __swift_project_value_buffer(v8, (uint64_t)qword_25610E4F0);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v7, a1, v3);
  swift_retain_n();
  v9 = sub_233AEB93C();
  v10 = sub_233AEBAA4();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = swift_slowAlloc();
    v20[1] = a1;
    v12 = v11;
    v20[0] = swift_slowAlloc();
    v21 = v1;
    v22 = v20[0];
    *(_DWORD *)v12 = 136315394;
    swift_retain();
    v13 = sub_233AEB9C0();
    v21 = sub_233AD6E3C(v13, v14, &v22);
    sub_233AEBAD4();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v12 + 12) = 2080;
    sub_233AD8570();
    v15 = sub_233AEBCC0();
    v21 = sub_233AD6E3C(v15, v16, &v22);
    sub_233AEBAD4();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
    _os_log_impl(&dword_233AD2000, v9, v10, "Fulfilling action %s with dateEnded %s", (uint8_t *)v12, 0x16u);
    v17 = v20[0];
    swift_arrayDestroy();
    MEMORY[0x23493BE50](v17, -1, -1);
    MEMORY[0x23493BE50](v12, -1, -1);
  }
  else
  {
    swift_release_n();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  }

  objc_opt_self();
  v18 = (void *)swift_dynamicCastObjCClassUnconditional();
  v19 = (void *)sub_233AEB894();
  objc_msgSend(v18, sel_fulfillWithDateEnded_, v19);

}

void sub_233AE7B18()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t EndConversationAction.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_conversationUUID;
  v2 = sub_233AEB8E8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  sub_233AD3F34(*(_QWORD *)(v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_state), *(_QWORD *)(v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_state + 8));
  v3 = v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_timeoutDate;
  v4 = sub_233AEB8B8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

  return v0;
}

uint64_t EndConversationAction.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_conversationUUID;
  v2 = sub_233AEB8E8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  sub_233AD3F34(*(_QWORD *)(v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_state), *(_QWORD *)(v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_state + 8));
  v3 = v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_timeoutDate;
  v4 = sub_233AEB8B8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

  return swift_deallocClassInstance();
}

uint64_t sub_233AE7C90()
{
  return type metadata accessor for EndConversationAction();
}

uint64_t type metadata accessor for EndConversationAction()
{
  uint64_t result;

  result = qword_25610E118;
  if (!qword_25610E118)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t method lookup function for EndConversationAction()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of EndConversationAction.__allocating_init(conversationUUID:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t UnmergeConversationAction.__allocating_init(conversationUUID:)(uint64_t a1)
{
  uint64_t v2;

  v2 = swift_allocObject();
  UnmergeConversationAction.init(conversationUUID:)(a1);
  return v2;
}

uint64_t UnmergeConversationAction.init(conversationUUID:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
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
  uint64_t v15;
  char *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD *v20;
  uint64_t v22;
  uint64_t v23;

  v2 = v1;
  v23 = sub_233AEB8B8();
  v4 = *(_QWORD *)(v23 - 8);
  MEMORY[0x24BDAC7A8](v23, v5);
  v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_233AEB8E8();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8, v10);
  v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_25610D938);
  MEMORY[0x24BDAC7A8](v13, v14);
  v16 = (char *)&v22 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v16, 1, 1, v8);
  v17 = (void *)sub_233AEB8C4();
  v18 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v16, 1, v8) != 1)
  {
    v18 = (void *)sub_233AEB8C4();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v16, v8);
  }
  v19 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDB7910]), sel_initWithCallUUID_callUUIDToGroupWith_, v17, v18);

  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v12, a1, v8);
  sub_233AEB8A0();
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(a1, v8);
  *(_QWORD *)(v2 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_cxAction) = v19;
  (*(void (**)(uint64_t, char *, uint64_t))(v9 + 32))(v2 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_conversationUUID, v12, v8);
  v20 = (_QWORD *)(v2 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_state);
  *v20 = 0;
  v20[1] = 0;
  (*(void (**)(uint64_t, char *, uint64_t))(v4 + 32))(v2 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_timeoutDate, v7, v23);
  return v2;
}

void sub_233AE7F38()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t UnmergeConversationAction.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_conversationUUID;
  v2 = sub_233AEB8E8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  sub_233AD3F34(*(_QWORD *)(v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_state), *(_QWORD *)(v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_state + 8));
  v3 = v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_timeoutDate;
  v4 = sub_233AEB8B8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

  return v0;
}

uint64_t UnmergeConversationAction.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_conversationUUID;
  v2 = sub_233AEB8E8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  sub_233AD3F34(*(_QWORD *)(v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_state), *(_QWORD *)(v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_state + 8));
  v3 = v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_timeoutDate;
  v4 = sub_233AEB8B8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

  return swift_deallocClassInstance();
}

uint64_t sub_233AE80B0()
{
  return type metadata accessor for UnmergeConversationAction();
}

uint64_t type metadata accessor for UnmergeConversationAction()
{
  uint64_t result;

  result = qword_25610E1F0;
  if (!qword_25610E1F0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t method lookup function for UnmergeConversationAction()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of UnmergeConversationAction.__allocating_init(conversationUUID:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 120))();
}

unint64_t Conversation.EndedReason.init(rawValue:)@<X0>(unint64_t result@<X0>, _BYTE *a2@<X8>)
{
  unint64_t v2;

  v2 = 0x40302010005uLL >> (8 * result);
  if (result >= 6)
    LOBYTE(v2) = 5;
  *a2 = v2;
  return result;
}

uint64_t Conversation.EndedReason.rawValue.getter()
{
  unsigned __int8 *v0;

  return *v0 + 1;
}

unint64_t sub_233AE813C@<X0>(unint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  return Conversation.EndedReason.init(rawValue:)(*a1, a2);
}

uint64_t sub_233AE8144()
{
  sub_233AE8390();
  return sub_233AEB9FC();
}

uint64_t sub_233AE81A0()
{
  sub_233AE8390();
  return sub_233AEB9F0();
}

unint64_t sub_233AE81F0()
{
  unint64_t result;

  result = qword_25610E2A0;
  if (!qword_25610E2A0)
  {
    result = MEMORY[0x23493BDC0](&protocol conformance descriptor for Conversation.EndedReason, &type metadata for Conversation.EndedReason);
    atomic_store(result, (unint64_t *)&qword_25610E2A0);
  }
  return result;
}

uint64_t _s11EndedReasonOwet(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s11EndedReasonOwst(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_233AE8310 + 4 * byte_233AED445[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_233AE8344 + 4 * byte_233AED440[v4]))();
}

uint64_t sub_233AE8344(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_233AE834C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x233AE8354);
  return result;
}

uint64_t sub_233AE8360(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x233AE8368);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_233AE836C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_233AE8374(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for Conversation.EndedReason()
{
  return &type metadata for Conversation.EndedReason;
}

unint64_t sub_233AE8390()
{
  unint64_t result;

  result = qword_25610E2A8;
  if (!qword_25610E2A8)
  {
    result = MEMORY[0x23493BDC0](&protocol conformance descriptor for Conversation.EndedReason, &type metadata for Conversation.EndedReason);
    atomic_store(result, (unint64_t *)&qword_25610E2A8);
  }
  return result;
}

uint64_t sub_233AE83D4@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;

  v3 = *(_QWORD *)(a1 + 16);
  if (v3)
  {
    v4 = 0;
    v5 = (uint64_t *)(a1 + 32);
    do
    {
      v7 = *v5++;
      v6 = v7;
      if ((v7 & ~v4) == 0)
        v6 = 0;
      v4 |= v6;
      --v3;
    }
    while (v3);
  }
  else
  {
    v4 = 0;
  }
  result = swift_bridgeObjectRelease();
  *a2 = v4;
  return result;
}

uint64_t Conversation.Capabilities.init(rawValue:)@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

void static Conversation.Capabilities.pausing.getter(_QWORD *a1@<X8>)
{
  *a1 = 1;
}

void static Conversation.Capabilities.merging.getter(_QWORD *a1@<X8>)
{
  *a1 = 2;
}

void static Conversation.Capabilities.unmerging.getter(_QWORD *a1@<X8>)
{
  *a1 = 4;
}

void static Conversation.Capabilities.video.getter(_QWORD *a1@<X8>)
{
  *a1 = 8;
}

void static Conversation.Capabilities.playingTones.getter(_QWORD *a1@<X8>)
{
  *a1 = 16;
}

uint64_t Conversation.Capabilities.rawValue.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t Conversation.Capabilities.rawValue.setter(uint64_t result)
{
  _QWORD *v1;

  *v1 = result;
  return result;
}

uint64_t (*Conversation.Capabilities.rawValue.modify())()
{
  return nullsub_1;
}

unint64_t sub_233AE8490()
{
  unint64_t result;

  result = qword_25610E2B0;
  if (!qword_25610E2B0)
  {
    result = MEMORY[0x23493BDC0](&protocol conformance descriptor for Conversation.Capabilities, &type metadata for Conversation.Capabilities);
    atomic_store(result, (unint64_t *)&qword_25610E2B0);
  }
  return result;
}

unint64_t sub_233AE84D8()
{
  unint64_t result;

  result = qword_25610E2B8;
  if (!qword_25610E2B8)
  {
    result = MEMORY[0x23493BDC0](&protocol conformance descriptor for Conversation.Capabilities, &type metadata for Conversation.Capabilities);
    atomic_store(result, (unint64_t *)&qword_25610E2B8);
  }
  return result;
}

_QWORD *sub_233AE851C@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_233AE8528()
{
  sub_233AE8490();
  return sub_233AEB9FC();
}

uint64_t sub_233AE8584()
{
  sub_233AE8490();
  return sub_233AEB9F0();
}

unint64_t sub_233AE85D4()
{
  unint64_t result;

  result = qword_25610E2C0;
  if (!qword_25610E2C0)
  {
    result = MEMORY[0x23493BDC0](&protocol conformance descriptor for Conversation.Capabilities, &type metadata for Conversation.Capabilities);
    atomic_store(result, (unint64_t *)&qword_25610E2C0);
  }
  return result;
}

unint64_t sub_233AE861C()
{
  unint64_t result;

  result = qword_25610E2C8;
  if (!qword_25610E2C8)
  {
    result = MEMORY[0x23493BDC0](&protocol conformance descriptor for Conversation.Capabilities, &type metadata for Conversation.Capabilities);
    atomic_store(result, (unint64_t *)&qword_25610E2C8);
  }
  return result;
}

void sub_233AE8660(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

_QWORD *sub_233AE8668@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 | *result;
  return result;
}

_QWORD *sub_233AE867C@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & *result;
  return result;
}

_QWORD *sub_233AE8690@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_233AE86A4(_QWORD *a1, uint64_t *a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *a2;
  v4 = *v2 & *a2;
  if (v4 != *a2)
    *v2 |= v3;
  *a1 = v3;
  return v4 != v3;
}

_QWORD *sub_233AE86D4@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  _QWORD *v2;
  uint64_t v3;

  v3 = *v2 & *result;
  if (v3)
    *v2 &= ~*result;
  *(_QWORD *)a2 = v3;
  *(_BYTE *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *sub_233AE8700@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *result;
  v4 = *v2;
  *v2 |= *result;
  v5 = v4 & v3;
  *(_QWORD *)a2 = v5;
  *(_BYTE *)(a2 + 8) = v5 == 0;
  return result;
}

_QWORD *sub_233AE8724(_QWORD *result)
{
  _QWORD *v1;

  *v1 |= *result;
  return result;
}

_QWORD *sub_233AE8738(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= *result;
  return result;
}

_QWORD *sub_233AE874C(_QWORD *result)
{
  _QWORD *v1;

  *v1 ^= *result;
  return result;
}

_QWORD *sub_233AE8760@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_233AE8774(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & ~*a1) == 0;
}

BOOL sub_233AE8788(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & *a1) == 0;
}

BOOL sub_233AE879C(_QWORD *a1)
{
  _QWORD *v1;

  return (*a1 & ~*v1) == 0;
}

BOOL sub_233AE87B0()
{
  _QWORD *v0;

  return *v0 == 0;
}

uint64_t sub_233AE87C0()
{
  return sub_233AEBAEC();
}

_QWORD *sub_233AE87D8(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= ~*result;
  return result;
}

ValueMetadata *type metadata accessor for Conversation.Capabilities()
{
  return &type metadata for Conversation.Capabilities;
}

uint64_t ConversationAction.State.hash(into:)()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 8) <= 2uLL)
    return sub_233AEBCFC();
  sub_233AEBCFC();
  return sub_233AEB9CC();
}

uint64_t sub_233AE888C()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_233AE88B4 + 4 * byte_233AED7A0[*v0]))(1701602409, 0xE400000000000000);
}

uint64_t sub_233AE88B4()
{
  return 0x676E696E6E7572;
}

uint64_t sub_233AE88CC()
{
  return 0x6574656C706D6F63;
}

uint64_t sub_233AE88E4()
{
  return 0x64656C696166;
}

uint64_t sub_233AE88F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_233AEA09C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_233AE891C()
{
  sub_233AE97A4();
  return sub_233AEBD38();
}

uint64_t sub_233AE8944()
{
  sub_233AE97A4();
  return sub_233AEBD44();
}

uint64_t sub_233AE896C()
{
  return 0;
}

uint64_t sub_233AE8978()
{
  sub_233AE982C();
  return sub_233AEBD38();
}

uint64_t sub_233AE89A0()
{
  sub_233AE982C();
  return sub_233AEBD44();
}

uint64_t sub_233AE89C8()
{
  return 0x6E6F73616572;
}

uint64_t sub_233AE89DC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  char v5;
  uint64_t result;
  char v7;

  if (a1 == 0x6E6F73616572 && a2 == 0xE600000000000000)
  {
    result = swift_bridgeObjectRelease();
    v7 = 0;
  }
  else
  {
    v5 = sub_233AEBCCC();
    result = swift_bridgeObjectRelease();
    v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_233AE8A68()
{
  sub_233AE97E8();
  return sub_233AEBD38();
}

uint64_t sub_233AE8A90()
{
  sub_233AE97E8();
  return sub_233AEBD44();
}

uint64_t sub_233AE8AB8@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

uint64_t sub_233AE8AE4()
{
  sub_233AE98B4();
  return sub_233AEBD38();
}

uint64_t sub_233AE8B0C()
{
  sub_233AE98B4();
  return sub_233AEBD44();
}

uint64_t sub_233AE8B34()
{
  sub_233AE9870();
  return sub_233AEBD38();
}

uint64_t sub_233AE8B5C()
{
  sub_233AE9870();
  return sub_233AEBD44();
}

uint64_t ConversationAction.State.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v4;
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
  char *v25;
  uint64_t v26;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  char v44;
  char v45;
  char v46;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25610E2D0);
  v39 = *(_QWORD *)(v4 - 8);
  v40 = v4;
  MEMORY[0x24BDAC7A8](v4, v5);
  v38 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25610E2D8);
  v36 = *(_QWORD *)(v7 - 8);
  v37 = v7;
  MEMORY[0x24BDAC7A8](v7, v8);
  v35 = (char *)&v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25610E2E0);
  v33 = *(_QWORD *)(v10 - 8);
  v34 = v10;
  MEMORY[0x24BDAC7A8](v10, v11);
  v13 = (char *)&v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_25610E2E8);
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14, v16);
  v18 = (char *)&v32 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_25610E2F0);
  v41 = *(_QWORD *)(v19 - 8);
  v42 = v19;
  MEMORY[0x24BDAC7A8](v19, v20);
  v22 = (char *)&v32 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = *v2;
  v24 = v2[1];
  v32 = v23;
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_233AE97A4();
  sub_233AEBD2C();
  switch(v24)
  {
    case 0:
      v43 = 0;
      sub_233AE98B4();
      v26 = v42;
      sub_233AEBC90();
      (*(void (**)(char *, uint64_t))(v15 + 8))(v18, v14);
      return (*(uint64_t (**)(char *, uint64_t))(v41 + 8))(v22, v26);
    case 1:
      v44 = 1;
      sub_233AE9870();
      v28 = v42;
      sub_233AEBC90();
      (*(void (**)(char *, uint64_t))(v33 + 8))(v13, v34);
      return (*(uint64_t (**)(char *, uint64_t))(v41 + 8))(v22, v28);
    case 2:
      v45 = 2;
      sub_233AE982C();
      v25 = v35;
      v26 = v42;
      sub_233AEBC90();
      (*(void (**)(char *, uint64_t))(v36 + 8))(v25, v37);
      return (*(uint64_t (**)(char *, uint64_t))(v41 + 8))(v22, v26);
    default:
      v46 = 3;
      sub_233AE97E8();
      v29 = v38;
      v30 = v42;
      sub_233AEBC90();
      v31 = v40;
      sub_233AEBCA8();
      (*(void (**)(char *, uint64_t))(v39 + 8))(v29, v31);
      return (*(uint64_t (**)(char *, uint64_t))(v41 + 8))(v22, v30);
  }
}

uint64_t ConversationAction.State.hashValue.getter()
{
  uint64_t v0;
  unint64_t v1;

  v1 = *(_QWORD *)(v0 + 8);
  sub_233AEBCF0();
  sub_233AEBCFC();
  if (v1 > 2)
    sub_233AEB9CC();
  return sub_233AEBD14();
}

uint64_t ConversationAction.State.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
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
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  _QWORD *v26;
  _QWORD v28[7];
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  char *v33;
  char *v34;
  uint64_t v35;
  _QWORD *v36;
  uint64_t v37;

  v35 = a2;
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_25610E320);
  v31 = *(_QWORD *)(v29 - 8);
  MEMORY[0x24BDAC7A8](v29, v3);
  v34 = (char *)v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_25610E328);
  v28[4] = *(_QWORD *)(v30 - 8);
  MEMORY[0x24BDAC7A8](v30, v5);
  v33 = (char *)v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25610E330);
  v28[5] = *(_QWORD *)(v7 - 8);
  v28[6] = v7;
  MEMORY[0x24BDAC7A8](v7, v8);
  v32 = (char *)v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25610E338);
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10, v12);
  v14 = (char *)v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_25610E340);
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15, v17);
  v19 = (char *)v28 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = a1[3];
  v36 = a1;
  __swift_project_boxed_opaque_existential_0(a1, v20);
  sub_233AE97A4();
  v21 = v37;
  sub_233AEBD20();
  if (!v21)
  {
    v28[2] = v10;
    v28[3] = v14;
    v28[1] = v11;
    v37 = v16;
    v22 = sub_233AEBC84();
    v23 = v15;
    if (*(_QWORD *)(v22 + 16) == 1)
      __asm { BR              X10 }
    v24 = sub_233AEBBA0();
    swift_allocError();
    v26 = v25;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25610DD30);
    *v26 = &type metadata for ConversationAction.State;
    sub_233AEBC54();
    sub_233AEBB94();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v24 - 8) + 104))(v26, *MEMORY[0x24BEE26D0], v24);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v37 + 8))(v19, v23);
  }
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v36);
}

uint64_t sub_233AE94EC@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return ConversationAction.State.init(from:)(a1, a2);
}

uint64_t sub_233AE9500(_QWORD *a1)
{
  return ConversationAction.State.encode(to:)(a1);
}

uint64_t sub_233AE9514()
{
  uint64_t v0;
  unint64_t v1;

  v1 = *(_QWORD *)(v0 + 8);
  sub_233AEBCF0();
  sub_233AEBCFC();
  if (v1 > 2)
    sub_233AEB9CC();
  return sub_233AEBD14();
}

uint64_t sub_233AE95A0()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 8) <= 2uLL)
    return sub_233AEBCFC();
  sub_233AEBCFC();
  return sub_233AEB9CC();
}

uint64_t sub_233AE9624()
{
  uint64_t v0;
  unint64_t v1;

  v1 = *(_QWORD *)(v0 + 8);
  sub_233AEBCF0();
  sub_233AEBCFC();
  if (v1 > 2)
    sub_233AEB9CC();
  return sub_233AEBD14();
}

uint64_t _s20LiveCommunicationKit18ConversationActionC5StateO2eeoiySbAE_AEtFZ_0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  char v6;

  v2 = *a1;
  v3 = a1[1];
  v4 = *a2;
  v5 = a2[1];
  if (!v3)
  {
    if (!v5)
    {
      v3 = 0;
      v6 = 1;
      goto LABEL_13;
    }
    goto LABEL_11;
  }
  if (v3 == 1)
  {
    if (v5 == 1)
    {
      v3 = 1;
      v6 = 1;
      goto LABEL_13;
    }
    goto LABEL_11;
  }
  if (v3 != 2)
  {
    if (v5 >= 3)
    {
      if (v2 == v4 && v3 == v5)
        v6 = 1;
      else
        v6 = sub_233AEBCCC();
      goto LABEL_12;
    }
LABEL_11:
    v6 = 0;
LABEL_12:
    sub_233AD6924(v4, v5);
    sub_233AD6924(v2, v3);
    goto LABEL_13;
  }
  if (v5 != 2)
    goto LABEL_11;
  v6 = 1;
  v3 = 2;
LABEL_13:
  sub_233AD3F34(v2, v3);
  sub_233AD3F34(v4, v5);
  return v6 & 1;
}

unint64_t sub_233AE97A4()
{
  unint64_t result;

  result = qword_25610E2F8;
  if (!qword_25610E2F8)
  {
    result = MEMORY[0x23493BDC0](&unk_233AEDCA4, &_s14descr2504D6FF1V5StateO10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25610E2F8);
  }
  return result;
}

unint64_t sub_233AE97E8()
{
  unint64_t result;

  result = qword_25610E300;
  if (!qword_25610E300)
  {
    result = MEMORY[0x23493BDC0](&unk_233AEDC54, &_s14descr2504D6FF1V5StateO16FailedCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25610E300);
  }
  return result;
}

unint64_t sub_233AE982C()
{
  unint64_t result;

  result = qword_25610E308;
  if (!qword_25610E308)
  {
    result = MEMORY[0x23493BDC0](&unk_233AEDC04, &_s14descr2504D6FF1V5StateO18CompleteCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25610E308);
  }
  return result;
}

unint64_t sub_233AE9870()
{
  unint64_t result;

  result = qword_25610E310;
  if (!qword_25610E310)
  {
    result = MEMORY[0x23493BDC0](&unk_233AEDBB4, &_s14descr2504D6FF1V5StateO17RunningCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25610E310);
  }
  return result;
}

unint64_t sub_233AE98B4()
{
  unint64_t result;

  result = qword_25610E318;
  if (!qword_25610E318)
  {
    result = MEMORY[0x23493BDC0](&unk_233AEDB64, &_s14descr2504D6FF1V5StateO14IdleCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25610E318);
  }
  return result;
}

unint64_t sub_233AE98FC()
{
  unint64_t result;

  result = qword_25610E348;
  if (!qword_25610E348)
  {
    result = MEMORY[0x23493BDC0](&protocol conformance descriptor for ConversationAction.State, &type metadata for ConversationAction.State);
    atomic_store(result, (unint64_t *)&qword_25610E348);
  }
  return result;
}

unint64_t _s14descr2504D6FF1V5StateOwxx(uint64_t a1)
{
  unint64_t result;

  result = *(_QWORD *)(a1 + 8);
  if (result >= 0xFFFFFFFF)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t _s14descr2504D6FF1V5StateOwCP_0(uint64_t a1, uint64_t a2)
{
  unint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if (v3 < 0xFFFFFFFF)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  else
  {
    *(_QWORD *)a1 = *(_QWORD *)a2;
    *(_QWORD *)(a1 + 8) = v3;
    swift_bridgeObjectRetain();
  }
  return a1;
}

_QWORD *_s14descr2504D6FF1V5StateOwca(_QWORD *a1, _QWORD *a2)
{
  unint64_t v4;

  v4 = a2[1];
  if (a1[1] < 0xFFFFFFFFuLL)
  {
    if (v4 >= 0xFFFFFFFF)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
      return a1;
    }
LABEL_7:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
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

uint64_t _s14descr2504D6FF1V5StateOwta(uint64_t a1, uint64_t a2)
{
  unint64_t v4;

  if (*(_QWORD *)(a1 + 8) < 0xFFFFFFFFuLL)
    goto LABEL_5;
  v4 = *(_QWORD *)(a2 + 8);
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s14descr2504D6FF1V5StateOwet(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  unsigned int v4;
  unsigned int v5;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFD && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 2147483645);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 + 1;
  v5 = v3 - 2;
  if (v4 >= 4)
    return v5;
  else
    return 0;
}

uint64_t _s14descr2504D6FF1V5StateOwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 >= 0x7FFFFFFD)
  {
    *(_QWORD *)result = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_DWORD *)result = a2 - 2147483645;
    if (a3 >= 0x7FFFFFFD)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFD)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2 + 2;
  }
  return result;
}

uint64_t sub_233AE9B5C(uint64_t a1)
{
  unint64_t v1;

  v1 = *(_QWORD *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

_QWORD *sub_233AE9B74(_QWORD *result, int a2)
{
  if (a2 < 0)
  {
    *result = a2 ^ 0x80000000;
    result[1] = 0;
  }
  else if (a2)
  {
    result[1] = (a2 - 1);
  }
  return result;
}

ValueMetadata *type metadata accessor for ConversationAction.State()
{
  return &type metadata for ConversationAction.State;
}

uint64_t _s14descr2504D6FF1V5StateO10CodingKeysOwst(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_233AE9BF0 + 4 * byte_233AED7AD[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_233AE9C24 + 4 * byte_233AED7A8[v4]))();
}

uint64_t sub_233AE9C24(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_233AE9C2C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x233AE9C34);
  return result;
}

uint64_t sub_233AE9C40(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x233AE9C48);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_233AE9C4C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_233AE9C54(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *_s14descr2504D6FF1V5StateO10CodingKeysOMa()
{
  return &_s14descr2504D6FF1V5StateO10CodingKeysON;
}

ValueMetadata *_s14descr2504D6FF1V5StateO14IdleCodingKeysOMa()
{
  return &_s14descr2504D6FF1V5StateO14IdleCodingKeysON;
}

ValueMetadata *_s14descr2504D6FF1V5StateO17RunningCodingKeysOMa()
{
  return &_s14descr2504D6FF1V5StateO17RunningCodingKeysON;
}

ValueMetadata *_s14descr2504D6FF1V5StateO18CompleteCodingKeysOMa()
{
  return &_s14descr2504D6FF1V5StateO18CompleteCodingKeysON;
}

uint64_t _s14descr2504D6FF1V5StateO16FailedCodingKeysOwst(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_233AE9CE0 + 4 * byte_233AED7B2[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_233AE9D00 + 4 * byte_233AED7B7[v4]))();
}

_BYTE *sub_233AE9CE0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_233AE9D00(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_233AE9D08(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_233AE9D10(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_233AE9D18(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_233AE9D20(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *_s14descr2504D6FF1V5StateO16FailedCodingKeysOMa()
{
  return &_s14descr2504D6FF1V5StateO16FailedCodingKeysON;
}

unint64_t sub_233AE9D40()
{
  unint64_t result;

  result = qword_25610E350;
  if (!qword_25610E350)
  {
    result = MEMORY[0x23493BDC0](&unk_233AED994, &_s14descr2504D6FF1V5StateO16FailedCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25610E350);
  }
  return result;
}

unint64_t sub_233AE9D88()
{
  unint64_t result;

  result = qword_25610E358;
  if (!qword_25610E358)
  {
    result = MEMORY[0x23493BDC0](&unk_233AEDB3C, &_s14descr2504D6FF1V5StateO10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25610E358);
  }
  return result;
}

unint64_t sub_233AE9DD0()
{
  unint64_t result;

  result = qword_25610E360;
  if (!qword_25610E360)
  {
    result = MEMORY[0x23493BDC0](&unk_233AEDA5C, &_s14descr2504D6FF1V5StateO14IdleCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25610E360);
  }
  return result;
}

unint64_t sub_233AE9E18()
{
  unint64_t result;

  result = qword_25610E368;
  if (!qword_25610E368)
  {
    result = MEMORY[0x23493BDC0](&unk_233AEDA84, &_s14descr2504D6FF1V5StateO14IdleCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25610E368);
  }
  return result;
}

unint64_t sub_233AE9E60()
{
  unint64_t result;

  result = qword_25610E370;
  if (!qword_25610E370)
  {
    result = MEMORY[0x23493BDC0](&unk_233AEDA0C, &_s14descr2504D6FF1V5StateO17RunningCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25610E370);
  }
  return result;
}

unint64_t sub_233AE9EA8()
{
  unint64_t result;

  result = qword_25610E378;
  if (!qword_25610E378)
  {
    result = MEMORY[0x23493BDC0](&unk_233AEDA34, &_s14descr2504D6FF1V5StateO17RunningCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25610E378);
  }
  return result;
}

unint64_t sub_233AE9EF0()
{
  unint64_t result;

  result = qword_25610E380;
  if (!qword_25610E380)
  {
    result = MEMORY[0x23493BDC0](&unk_233AED9BC, &_s14descr2504D6FF1V5StateO18CompleteCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25610E380);
  }
  return result;
}

unint64_t sub_233AE9F38()
{
  unint64_t result;

  result = qword_25610E388;
  if (!qword_25610E388)
  {
    result = MEMORY[0x23493BDC0](&unk_233AED9E4, &_s14descr2504D6FF1V5StateO18CompleteCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25610E388);
  }
  return result;
}

unint64_t sub_233AE9F80()
{
  unint64_t result;

  result = qword_25610E390;
  if (!qword_25610E390)
  {
    result = MEMORY[0x23493BDC0](&unk_233AED904, &_s14descr2504D6FF1V5StateO16FailedCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25610E390);
  }
  return result;
}

unint64_t sub_233AE9FC8()
{
  unint64_t result;

  result = qword_25610E398;
  if (!qword_25610E398)
  {
    result = MEMORY[0x23493BDC0](&unk_233AED92C, &_s14descr2504D6FF1V5StateO16FailedCodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25610E398);
  }
  return result;
}

unint64_t sub_233AEA010()
{
  unint64_t result;

  result = qword_25610E3A0;
  if (!qword_25610E3A0)
  {
    result = MEMORY[0x23493BDC0](&unk_233AEDAAC, &_s14descr2504D6FF1V5StateO10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25610E3A0);
  }
  return result;
}

unint64_t sub_233AEA058()
{
  unint64_t result;

  result = qword_25610E3A8;
  if (!qword_25610E3A8)
  {
    result = MEMORY[0x23493BDC0](&unk_233AEDAD4, &_s14descr2504D6FF1V5StateO10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_25610E3A8);
  }
  return result;
}

uint64_t sub_233AEA09C(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 1701602409 && a2 == 0xE400000000000000;
  if (v2 || (sub_233AEBCCC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x676E696E6E7572 && a2 == 0xE700000000000000 || (sub_233AEBCCC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6574656C706D6F63 && a2 == 0xE800000000000000 || (sub_233AEBCCC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x64656C696166 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    v6 = sub_233AEBCCC();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 3;
    else
      return 4;
  }
}

char *Handle.init(type:value:displayName:)@<X0>(char *result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  char v9;

  v9 = *result;
  if (!a5)
  {
    result = (char *)swift_bridgeObjectRetain();
    a4 = a2;
    a5 = a3;
  }
  *(_BYTE *)a6 = v9;
  *(_QWORD *)(a6 + 8) = a2;
  *(_QWORD *)(a6 + 16) = a3;
  *(_QWORD *)(a6 + 24) = a4;
  *(_QWORD *)(a6 + 32) = a5;
  return result;
}

LiveCommunicationKit::Handle::Kind_optional __swiftcall Handle.Kind.init(rawValue:)(Swift::Int rawValue)
{
  _BYTE *v1;
  unsigned int v2;

  v2 = 0x2010003u >> (8 * rawValue);
  if ((unint64_t)rawValue >= 4)
    LOBYTE(v2) = 3;
  *v1 = v2;
  return (LiveCommunicationKit::Handle::Kind_optional)rawValue;
}

uint64_t Handle.Kind.rawValue.getter()
{
  unsigned __int8 *v0;

  return *v0 + 1;
}

LiveCommunicationKit::Handle::Kind_optional sub_233AEA2C0(Swift::Int *a1)
{
  return Handle.Kind.init(rawValue:)(*a1);
}

uint64_t sub_233AEA2C8()
{
  sub_233AEB2B0();
  return sub_233AEB9FC();
}

uint64_t sub_233AEA324()
{
  sub_233AEB2B0();
  return sub_233AEB9F0();
}

void Handle.type.getter(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = *v1;
}

_BYTE *Handle.type.setter(_BYTE *result)
{
  _BYTE *v1;

  *v1 = *result;
  return result;
}

uint64_t (*Handle.type.modify())()
{
  return nullsub_1;
}

uint64_t Handle.value.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Handle.value.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 8) = a1;
  *(_QWORD *)(v2 + 16) = a2;
  return result;
}

uint64_t (*Handle.value.modify())()
{
  return nullsub_1;
}

uint64_t Handle.displayName.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t Handle.displayName.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 24) = a1;
  *(_QWORD *)(v2 + 32) = a2;
  return result;
}

uint64_t (*Handle.displayName.modify())()
{
  return nullsub_1;
}

uint64_t Handle.hash(into:)()
{
  sub_233AEBCFC();
  swift_bridgeObjectRetain();
  sub_233AEB9CC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_233AEB9CC();
  return swift_bridgeObjectRelease();
}

uint64_t sub_233AEA4FC()
{
  _BYTE *v0;
  uint64_t v1;

  v1 = 0x65756C6176;
  if (*v0 != 1)
    v1 = 0x4E79616C70736964;
  if (*v0)
    return v1;
  else
    return 1701869940;
}

uint64_t sub_233AEA554@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_233AEB15C(a1, a2);
  *a3 = result;
  return result;
}

void sub_233AEA578(_BYTE *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_233AEA584()
{
  sub_233AEAC64();
  return sub_233AEBD38();
}

uint64_t sub_233AEA5AC()
{
  sub_233AEAC64();
  return sub_233AEBD44();
}

uint64_t Handle.encode(to:)(_QWORD *a1)
{
  char *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v13[4];
  char v14;
  char v15;
  char v16;
  char v17;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25610E3B0);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4, v6);
  v8 = (char *)v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *v1;
  v10 = *((_QWORD *)v1 + 1);
  v13[2] = *((_QWORD *)v1 + 2);
  v13[3] = v10;
  v11 = *((_QWORD *)v1 + 3);
  v13[0] = *((_QWORD *)v1 + 4);
  v13[1] = v11;
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_233AEAC64();
  sub_233AEBD2C();
  v17 = v9;
  v16 = 0;
  sub_233AEACA8();
  sub_233AEBCB4();
  if (!v2)
  {
    v15 = 1;
    sub_233AEBCA8();
    v14 = 2;
    sub_233AEBCA8();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

uint64_t Handle.hashValue.getter()
{
  sub_233AEBCF0();
  sub_233AEBCFC();
  swift_bridgeObjectRetain();
  sub_233AEB9CC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_233AEB9CC();
  swift_bridgeObjectRelease();
  return sub_233AEBD14();
}

uint64_t Handle.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;
  int v20;
  char v21;
  char v22;
  char v23;
  unsigned __int8 v24;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25610E3C8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5, v7);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  sub_233AEAC64();
  sub_233AEBD20();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  v23 = 0;
  sub_233AEACEC();
  sub_233AEBC78();
  v10 = v24;
  v22 = 1;
  v11 = sub_233AEBC6C();
  v13 = v12;
  v19 = v11;
  v20 = v10;
  v21 = 2;
  swift_bridgeObjectRetain();
  v14 = sub_233AEBC6C();
  v16 = v15;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  *(_BYTE *)a2 = v20;
  *(_QWORD *)(a2 + 8) = v19;
  *(_QWORD *)(a2 + 16) = v13;
  *(_QWORD *)(a2 + 24) = v14;
  *(_QWORD *)(a2 + 32) = v16;
  swift_bridgeObjectRetain();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_233AEA9DC@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return Handle.init(from:)(a1, a2);
}

uint64_t sub_233AEA9F0(_QWORD *a1)
{
  return Handle.encode(to:)(a1);
}

uint64_t sub_233AEAA04()
{
  sub_233AEBCF0();
  sub_233AEBCFC();
  swift_bridgeObjectRetain();
  sub_233AEB9CC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_233AEB9CC();
  swift_bridgeObjectRelease();
  return sub_233AEBD14();
}

uint64_t sub_233AEAAA0()
{
  sub_233AEBCFC();
  swift_bridgeObjectRetain();
  sub_233AEB9CC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_233AEB9CC();
  return swift_bridgeObjectRelease();
}

uint64_t sub_233AEAB20()
{
  sub_233AEBCF0();
  sub_233AEBCFC();
  swift_bridgeObjectRetain();
  sub_233AEB9CC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_233AEB9CC();
  swift_bridgeObjectRelease();
  return sub_233AEBD14();
}

uint64_t _s20LiveCommunicationKit6HandleV2eeoiySbAC_ACtFZ_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  char v7;
  uint64_t result;

  if (*(unsigned __int8 *)a1 != *(unsigned __int8 *)a2)
    return 0;
  v2 = a1[3];
  v3 = a1[4];
  v4 = a2[3];
  v5 = a2[4];
  v6 = a1[1] == a2[1] && a1[2] == a2[2];
  if (v6 || (v7 = sub_233AEBCCC(), result = 0, (v7 & 1) != 0))
  {
    if (v2 == v4 && v3 == v5)
      return 1;
    else
      return sub_233AEBCCC();
  }
  return result;
}

unint64_t sub_233AEAC64()
{
  unint64_t result;

  result = qword_25610E3B8;
  if (!qword_25610E3B8)
  {
    result = MEMORY[0x23493BDC0](&unk_233AEDFB4, &type metadata for Handle.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25610E3B8);
  }
  return result;
}

unint64_t sub_233AEACA8()
{
  unint64_t result;

  result = qword_25610E3C0;
  if (!qword_25610E3C0)
  {
    result = MEMORY[0x23493BDC0](&protocol conformance descriptor for Handle.Kind, &type metadata for Handle.Kind);
    atomic_store(result, (unint64_t *)&qword_25610E3C0);
  }
  return result;
}

unint64_t sub_233AEACEC()
{
  unint64_t result;

  result = qword_25610E3D0;
  if (!qword_25610E3D0)
  {
    result = MEMORY[0x23493BDC0](&protocol conformance descriptor for Handle.Kind, &type metadata for Handle.Kind);
    atomic_store(result, (unint64_t *)&qword_25610E3D0);
  }
  return result;
}

unint64_t sub_233AEAD34()
{
  unint64_t result;

  result = qword_25610E3D8;
  if (!qword_25610E3D8)
  {
    result = MEMORY[0x23493BDC0](&protocol conformance descriptor for Handle.Kind, &type metadata for Handle.Kind);
    atomic_store(result, (unint64_t *)&qword_25610E3D8);
  }
  return result;
}

unint64_t sub_233AEAD7C()
{
  unint64_t result;

  result = qword_25610E3E0;
  if (!qword_25610E3E0)
  {
    result = MEMORY[0x23493BDC0](&protocol conformance descriptor for Handle, &type metadata for Handle);
    atomic_store(result, (unint64_t *)&qword_25610E3E0);
  }
  return result;
}

uint64_t destroy for Handle()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for Handle(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  v4 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for Handle(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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

uint64_t assignWithTake for Handle(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v4 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for Handle(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 40))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Handle(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 16) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 40) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for Handle()
{
  return &type metadata for Handle;
}

ValueMetadata *type metadata accessor for Handle.Kind()
{
  return &type metadata for Handle.Kind;
}

uint64_t _s20LiveCommunicationKit6HandleV4KindOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_233AEB004 + 4 * byte_233AEDD05[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_233AEB038 + 4 * byte_233AEDD00[v4]))();
}

uint64_t sub_233AEB038(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_233AEB040(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x233AEB048);
  return result;
}

uint64_t sub_233AEB054(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x233AEB05CLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_233AEB060(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_233AEB068(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for Handle.CodingKeys()
{
  return &type metadata for Handle.CodingKeys;
}

unint64_t sub_233AEB088()
{
  unint64_t result;

  result = qword_25610E3E8;
  if (!qword_25610E3E8)
  {
    result = MEMORY[0x23493BDC0](&unk_233AEDF8C, &type metadata for Handle.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25610E3E8);
  }
  return result;
}

unint64_t sub_233AEB0D0()
{
  unint64_t result;

  result = qword_25610E3F0;
  if (!qword_25610E3F0)
  {
    result = MEMORY[0x23493BDC0](&unk_233AEDEFC, &type metadata for Handle.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25610E3F0);
  }
  return result;
}

unint64_t sub_233AEB118()
{
  unint64_t result;

  result = qword_25610E3F8;
  if (!qword_25610E3F8)
  {
    result = MEMORY[0x23493BDC0](&unk_233AEDF24, &type metadata for Handle.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25610E3F8);
  }
  return result;
}

uint64_t sub_233AEB15C(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 1701869940 && a2 == 0xE400000000000000;
  if (v2 || (sub_233AEBCCC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x65756C6176 && a2 == 0xE500000000000000 || (sub_233AEBCCC() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x4E79616C70736964 && a2 == 0xEB00000000656D61)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_233AEBCCC();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

unint64_t sub_233AEB2B0()
{
  unint64_t result;

  result = qword_25610E400;
  if (!qword_25610E400)
  {
    result = MEMORY[0x23493BDC0](&protocol conformance descriptor for Handle.Kind, &type metadata for Handle.Kind);
    atomic_store(result, (unint64_t *)&qword_25610E400);
  }
  return result;
}

uint64_t MuteConversationAction.isMuted.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC20LiveCommunicationKit22MuteConversationAction_isMuted);
}

uint64_t MuteConversationAction.__allocating_init(conversationUUID:isMuted:)(uint64_t a1, char a2)
{
  uint64_t v4;

  v4 = swift_allocObject();
  MuteConversationAction.init(conversationUUID:isMuted:)(a1, a2);
  return v4;
}

uint64_t MuteConversationAction.init(conversationUUID:isMuted:)(uint64_t a1, char a2)
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
  uint64_t v13;
  char *v14;
  id v15;
  void *v16;
  id v17;
  _QWORD *v18;
  uint64_t v20;
  uint64_t v21;

  v3 = v2;
  v21 = sub_233AEB8B8();
  v6 = *(_QWORD *)(v21 - 8);
  MEMORY[0x24BDAC7A8](v21, v7);
  v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_233AEB8E8();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10, v12);
  v14 = (char *)&v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = objc_allocWithZone(MEMORY[0x24BDB7920]);
  swift_retain();
  v16 = (void *)sub_233AEB8C4();
  v17 = objc_msgSend(v15, sel_initWithCallUUID_muted_, v16, a2 & 1);

  *(_BYTE *)(v3 + OBJC_IVAR____TtC20LiveCommunicationKit22MuteConversationAction_isMuted) = a2;
  swift_release();
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v14, a1, v10);
  sub_233AEB8A0();
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(a1, v10);
  *(_QWORD *)(v3 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_cxAction) = v17;
  (*(void (**)(uint64_t, char *, uint64_t))(v11 + 32))(v3 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_conversationUUID, v14, v10);
  v18 = (_QWORD *)(v3 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_state);
  *v18 = 0;
  v18[1] = 0;
  (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))(v3 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_timeoutDate, v9, v21);
  return v3;
}

uint64_t sub_233AEB500(void *a1)
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
  uint64_t v11;
  char *v12;
  unsigned __int8 v13;
  id v14;
  _QWORD *v15;
  uint64_t v17;

  v3 = sub_233AEB8B8();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3, v5);
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_233AEB8E8();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8, v10);
  v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  v13 = objc_msgSend(a1, sel_isMuted);
  *(_BYTE *)(v1 + OBJC_IVAR____TtC20LiveCommunicationKit22MuteConversationAction_isMuted) = v13;
  swift_release();
  v14 = objc_msgSend(a1, sel_callUUID);
  sub_233AEB8DC();

  sub_233AEB8A0();
  *(_QWORD *)(v1 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_cxAction) = a1;
  (*(void (**)(uint64_t, char *, uint64_t))(v9 + 32))(v1 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_conversationUUID, v12, v8);
  v15 = (_QWORD *)(v1 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_state);
  *v15 = 0;
  v15[1] = 0;
  (*(void (**)(uint64_t, char *, uint64_t))(v4 + 32))(v1 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_timeoutDate, v7, v3);
  return v1;
}

void sub_233AEB678()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t MuteConversationAction.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_conversationUUID;
  v2 = sub_233AEB8E8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  sub_233AD3F34(*(_QWORD *)(v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_state), *(_QWORD *)(v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_state + 8));
  v3 = v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_timeoutDate;
  v4 = sub_233AEB8B8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

  return v0;
}

uint64_t MuteConversationAction.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_conversationUUID;
  v2 = sub_233AEB8E8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  sub_233AD3F34(*(_QWORD *)(v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_state), *(_QWORD *)(v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_state + 8));
  v3 = v0 + OBJC_IVAR____TtC20LiveCommunicationKit18ConversationAction_timeoutDate;
  v4 = sub_233AEB8B8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

  return swift_deallocClassInstance();
}

uint64_t sub_233AEB7F0()
{
  return type metadata accessor for MuteConversationAction();
}

uint64_t type metadata accessor for MuteConversationAction()
{
  uint64_t result;

  result = qword_25610E430;
  if (!qword_25610E430)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_233AEB834()
{
  return swift_updateClassMetadata2();
}

uint64_t method lookup function for MuteConversationAction()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of MuteConversationAction.__allocating_init(conversationUUID:isMuted:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t sub_233AEB888()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_233AEB894()
{
  return MEMORY[0x24BDCE5D8]();
}

uint64_t sub_233AEB8A0()
{
  return MEMORY[0x24BDCE610]();
}

uint64_t sub_233AEB8AC()
{
  return MEMORY[0x24BDCE858]();
}

uint64_t sub_233AEB8B8()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_233AEB8C4()
{
  return MEMORY[0x24BDCE9D0]();
}

uint64_t sub_233AEB8D0()
{
  return MEMORY[0x24BDCE9E0]();
}

uint64_t sub_233AEB8DC()
{
  return MEMORY[0x24BDCE9F8]();
}

uint64_t sub_233AEB8E8()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_233AEB8F4()
{
  return MEMORY[0x24BEE5C38]();
}

uint64_t sub_233AEB900()
{
  return MEMORY[0x24BEE5C40]();
}

uint64_t sub_233AEB90C()
{
  return MEMORY[0x24BEE5C48]();
}

uint64_t sub_233AEB918()
{
  return MEMORY[0x24BEE5C50]();
}

uint64_t sub_233AEB924()
{
  return MEMORY[0x24BEE5C58]();
}

uint64_t sub_233AEB930()
{
  return MEMORY[0x24BEE5C60]();
}

uint64_t sub_233AEB93C()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_233AEB948()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_233AEB954()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_233AEB960()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_233AEB96C()
{
  return MEMORY[0x24BEE0270]();
}

uint64_t sub_233AEB978()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_233AEB984()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_233AEB990()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_233AEB99C()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_233AEB9A8()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_233AEB9B4()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_233AEB9C0()
{
  return MEMORY[0x24BEE0A10]();
}

uint64_t sub_233AEB9CC()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_233AEB9D8()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_233AEB9E4()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_233AEB9F0()
{
  return MEMORY[0x24BEE1018]();
}

uint64_t sub_233AEB9FC()
{
  return MEMORY[0x24BEE1098]();
}

uint64_t sub_233AEBA08()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_233AEBA14()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_233AEBA20()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_233AEBA2C()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_233AEBA38()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_233AEBA44()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_233AEBA50()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_233AEBA5C()
{
  return MEMORY[0x24BEE6818]();
}

uint64_t sub_233AEBA68()
{
  return MEMORY[0x24BEE6820]();
}

uint64_t sub_233AEBA74()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t sub_233AEBA80()
{
  return MEMORY[0x24BDCFCC0]();
}

uint64_t sub_233AEBA8C()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_233AEBA98()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_233AEBAA4()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_233AEBAB0()
{
  return MEMORY[0x24BEDFFA0]();
}

uint64_t sub_233AEBABC()
{
  return MEMORY[0x24BEE5BB8]();
}

uint64_t sub_233AEBAC8()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_233AEBAD4()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_233AEBAE0()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_233AEBAEC()
{
  return MEMORY[0x24BEE22B0]();
}

uint64_t sub_233AEBAF8()
{
  return MEMORY[0x24BEE22E0]();
}

uint64_t sub_233AEBB04()
{
  return MEMORY[0x24BEE2300]();
}

uint64_t sub_233AEBB10()
{
  return MEMORY[0x24BEE2330]();
}

uint64_t sub_233AEBB1C()
{
  return MEMORY[0x24BEE2340]();
}

uint64_t sub_233AEBB28()
{
  return MEMORY[0x24BEE2358]();
}

uint64_t sub_233AEBB34()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_233AEBB40()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_233AEBB4C()
{
  return MEMORY[0x24BEE24C8]();
}

uint64_t sub_233AEBB58()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_233AEBB64()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_233AEBB70()
{
  return MEMORY[0x24BEE25B8]();
}

uint64_t sub_233AEBB7C()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_233AEBB88()
{
  return MEMORY[0x24BEE2660]();
}

uint64_t sub_233AEBB94()
{
  return MEMORY[0x24BEE26E8]();
}

uint64_t sub_233AEBBA0()
{
  return MEMORY[0x24BEE2710]();
}

uint64_t sub_233AEBBAC()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_233AEBBB8()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_233AEBBC4()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_233AEBBD0()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_233AEBBDC()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_233AEBBE8()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_233AEBBF4()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_233AEBC00()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_233AEBC0C()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_233AEBC18()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_233AEBC24()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_233AEBC30()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_233AEBC3C()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_233AEBC48()
{
  return MEMORY[0x24BEE32B8]();
}

uint64_t sub_233AEBC54()
{
  return MEMORY[0x24BEE32C0]();
}

uint64_t sub_233AEBC60()
{
  return MEMORY[0x24BEE3308]();
}

uint64_t sub_233AEBC6C()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_233AEBC78()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_233AEBC84()
{
  return MEMORY[0x24BEE33C8]();
}

uint64_t sub_233AEBC90()
{
  return MEMORY[0x24BEE3408]();
}

uint64_t sub_233AEBC9C()
{
  return MEMORY[0x24BEE3458]();
}

uint64_t sub_233AEBCA8()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_233AEBCB4()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_233AEBCC0()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_233AEBCCC()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_233AEBCD8()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_233AEBCE4()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_233AEBCF0()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_233AEBCFC()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_233AEBD08()
{
  return MEMORY[0x24BEE4300]();
}

uint64_t sub_233AEBD14()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_233AEBD20()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_233AEBD2C()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_233AEBD38()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_233AEBD44()
{
  return MEMORY[0x24BEE4A10]();
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

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return MEMORY[0x24BEE4C68]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
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

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x24BEE4DE0]();
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

