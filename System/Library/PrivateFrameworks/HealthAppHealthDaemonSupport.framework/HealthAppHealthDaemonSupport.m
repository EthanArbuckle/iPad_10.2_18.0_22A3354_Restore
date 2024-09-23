uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
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

uint64_t objectdestroy_23Tm()
{
  uint64_t v0;

  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t static PinnedContentState.supportsSecureCoding.getter()
{
  return 1;
}

uint64_t sub_23DB9CF00@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(*a1 + OBJC_IVAR___HAHDPinnedContentState_shouldRespectOrder);
  result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_23DB9CF50(char *a1, _QWORD *a2)
{
  char v2;
  _BYTE *v3;
  uint64_t result;

  v2 = *a1;
  v3 = (_BYTE *)(*a2 + OBJC_IVAR___HAHDPinnedContentState_shouldRespectOrder);
  result = swift_beginAccess();
  *v3 = v2;
  return result;
}

uint64_t sub_23DB9CF9C()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___HAHDPinnedContentState_shouldRespectOrder);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_23DB9CFE0(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR___HAHDPinnedContentState_shouldRespectOrder);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_23DB9D028())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_23DB9D06C@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;

  v3 = (_QWORD *)(*a1 + OBJC_IVAR___HAHDPinnedContentState_identifiers);
  swift_beginAccess();
  *a2 = *v3;
  return swift_bridgeObjectRetain();
}

uint64_t sub_23DB9D0C0(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v3;

  v2 = *a1;
  v3 = (_QWORD *)(*a2 + OBJC_IVAR___HAHDPinnedContentState_identifiers);
  swift_beginAccess();
  *v3 = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23DB9D128()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t sub_23DB9D170(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)(v1 + OBJC_IVAR___HAHDPinnedContentState_identifiers);
  swift_beginAccess();
  *v3 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_23DB9D1C0())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

id PinnedContentState.__allocating_init(shouldRespectOrder:identifiers:)(char a1, uint64_t a2)
{
  objc_class *v2;
  _BYTE *v5;
  objc_super v7;

  v5 = objc_allocWithZone(v2);
  v5[OBJC_IVAR___HAHDPinnedContentState_shouldRespectOrder] = a1;
  *(_QWORD *)&v5[OBJC_IVAR___HAHDPinnedContentState_identifiers] = a2;
  v7.receiver = v5;
  v7.super_class = v2;
  return objc_msgSendSuper2(&v7, sel_init);
}

id PinnedContentState.init(shouldRespectOrder:identifiers:)(char a1, uint64_t a2)
{
  _BYTE *v2;
  objc_super v4;

  v2[OBJC_IVAR___HAHDPinnedContentState_shouldRespectOrder] = a1;
  *(_QWORD *)&v2[OBJC_IVAR___HAHDPinnedContentState_identifiers] = a2;
  v4.receiver = v2;
  v4.super_class = (Class)type metadata accessor for PinnedContentState();
  return objc_msgSendSuper2(&v4, sel_init);
}

uint64_t type metadata accessor for PinnedContentState()
{
  return objc_opt_self();
}

void sub_23DB9D2D4(void *a1)
{
  uint64_t v1;
  unsigned __int8 *v3;
  uint64_t v4;
  void *v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = (unsigned __int8 *)(v1 + OBJC_IVAR___HAHDPinnedContentState_shouldRespectOrder);
  swift_beginAccess();
  v4 = *v3;
  v5 = (void *)sub_23DBAB2F0();
  objc_msgSend(a1, sel_encodeBool_forKey_, v4, v5);

  v6 = (uint64_t *)(v1 + OBJC_IVAR___HAHDPinnedContentState_identifiers);
  swift_beginAccess();
  v7 = *v6;
  v8 = *(_QWORD *)(*v6 + 16);
  if (v8)
  {
    swift_bridgeObjectRetain();
    sub_23DBAB4C4();
    v9 = v7 + 40;
    do
    {
      v10 = objc_allocWithZone(MEMORY[0x24BDD17C8]);
      swift_bridgeObjectRetain();
      v11 = (void *)sub_23DBAB2F0();
      swift_bridgeObjectRelease();
      objc_msgSend(v10, sel_initWithString_, v11);

      sub_23DBAB4AC();
      sub_23DBAB4D0();
      sub_23DBAB4DC();
      sub_23DBAB4B8();
      v9 += 16;
      --v8;
    }
    while (v8);
    swift_bridgeObjectRelease();
  }
  sub_23DB9D670();
  v12 = (void *)sub_23DBAB350();
  swift_bridgeObjectRelease();
  v13 = (void *)sub_23DBAB2F0();
  objc_msgSend(a1, sel_encodeObject_forKey_, v12, v13);

}

id PinnedContentState.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;
  id v4;

  v3 = objc_allocWithZone(v1);
  v4 = sub_23DB9D6AC(a1);

  return v4;
}

id PinnedContentState.init(coder:)(void *a1)
{
  id v2;

  v2 = sub_23DB9D6AC(a1);

  return v2;
}

id PinnedContentState.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void PinnedContentState.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id PinnedContentState.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PinnedContentState();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_23DB9D670()
{
  unint64_t result;

  result = qword_25431E0F0;
  if (!qword_25431E0F0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_25431E0F0);
  }
  return result;
}

id sub_23DB9D6AC(void *a1)
{
  void *v1;
  _BYTE *v3;
  void *v4;
  unsigned __int8 v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  id result;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  _QWORD *v17;
  id *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  _QWORD *v25;
  objc_super v26;

  v3 = v1;
  v4 = (void *)sub_23DBAB2F0();
  v5 = objc_msgSend(a1, sel_decodeBoolForKey_, v4);

  v3[OBJC_IVAR___HAHDPinnedContentState_shouldRespectOrder] = v5;
  sub_23DB9D670();
  v6 = sub_23DBAB3F8();
  if (!v6)
  {
    v11 = (_QWORD *)MEMORY[0x24BEE4AF8];
LABEL_24:
    *(_QWORD *)&v3[OBJC_IVAR___HAHDPinnedContentState_identifiers] = v11;

    v26.receiver = v3;
    v26.super_class = (Class)type metadata accessor for PinnedContentState();
    return objc_msgSendSuper2(&v26, sel_init);
  }
  v7 = v6;
  if (!(v6 >> 62))
  {
    v8 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
    result = (id)swift_bridgeObjectRetain();
    if (v8)
      goto LABEL_4;
LABEL_22:
    v11 = (_QWORD *)MEMORY[0x24BEE4AF8];
LABEL_23:
    swift_bridgeObjectRelease_n();
    goto LABEL_24;
  }
  swift_bridgeObjectRetain();
  result = (id)sub_23DBAB500();
  v8 = (uint64_t)result;
  if (!result)
    goto LABEL_22;
LABEL_4:
  if (v8 >= 1)
  {
    if ((v7 & 0xC000000000000001) != 0)
    {
      v10 = 0;
      v11 = (_QWORD *)MEMORY[0x24BEE4AF8];
      do
      {
        MEMORY[0x24263CD18](v10, v7);
        v12 = sub_23DBAB2FC();
        v14 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v11 = sub_23DBA30DC(0, v11[2] + 1, 1, v11);
        v16 = v11[2];
        v15 = v11[3];
        if (v16 >= v15 >> 1)
          v11 = sub_23DBA30DC((_QWORD *)(v15 > 1), v16 + 1, 1, v11);
        ++v10;
        v11[2] = v16 + 1;
        v17 = &v11[2 * v16];
        v17[4] = v12;
        v17[5] = v14;
      }
      while (v8 != v10);
    }
    else
    {
      v18 = (id *)(v7 + 32);
      v11 = (_QWORD *)MEMORY[0x24BEE4AF8];
      do
      {
        v19 = *v18;
        v20 = sub_23DBAB2FC();
        v22 = v21;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v11 = sub_23DBA30DC(0, v11[2] + 1, 1, v11);
        v24 = v11[2];
        v23 = v11[3];
        if (v24 >= v23 >> 1)
          v11 = sub_23DBA30DC((_QWORD *)(v23 > 1), v24 + 1, 1, v11);
        v11[2] = v24 + 1;
        v25 = &v11[2 * v24];
        v25[4] = v20;
        v25[5] = v22;
        ++v18;
        --v8;
      }
      while (v8);
    }
    goto LABEL_23;
  }
  __break(1u);
  return result;
}

uint64_t method lookup function for PinnedContentState()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PinnedContentState.shouldRespectOrder.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x60))();
}

uint64_t dispatch thunk of PinnedContentState.shouldRespectOrder.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x68))();
}

uint64_t dispatch thunk of PinnedContentState.shouldRespectOrder.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x70))();
}

uint64_t dispatch thunk of PinnedContentState.identifiers.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of PinnedContentState.identifiers.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of PinnedContentState.identifiers.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of PinnedContentState.__allocating_init(shouldRespectOrder:identifiers:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t dispatch thunk of PinnedContentState.encode(with:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of PinnedContentState.__allocating_init(coder:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t dispatch thunk of PinnedContentStoring.domain.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of PinnedContentStoring.fetchPinnedContent(completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t dispatch thunk of PinnedContentStoring.fetchPinnedContent()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of PinnedContentStoring.applyDifferences(_:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 32))();
}

uint64_t dispatch thunk of PinnedContentStoring.applyDifferences(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t dispatch thunk of PinnedContentStoring.pinContentWithIdentifier(_:at:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, _QWORD))(a8 + 48))(a1, a2, a3, a4 & 1);
}

uint64_t dispatch thunk of PinnedContentStoring.pinContentWithIdentifier(_:at:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, _QWORD))(a6 + 56))(a1, a2, a3, a4 & 1);
}

uint64_t dispatch thunk of PinnedContentStoring.unpinContentWithIdentifier(_:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return (*(uint64_t (**)(void))(a6 + 64))();
}

uint64_t dispatch thunk of PinnedContentStoring.unpinContentWithIdentifier(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 72))();
}

uint64_t dispatch thunk of PinnedContentStoring.movePinnedContentWithIdentifier(_:to:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return (*(uint64_t (**)(void))(a7 + 80))();
}

uint64_t dispatch thunk of PinnedContentStoring.movePinnedContentWithIdentifier(_:to:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 88))();
}

uint64_t dispatch thunk of PinnedContentStoring.unpinAllContentInDomain(completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 96))();
}

uint64_t dispatch thunk of PinnedContentStoring.unpinAllContentInDomain()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 104))();
}

uint64_t sub_23DB9DAF8()
{
  uint64_t v0;

  v0 = sub_23DBAB0EC();
  __swift_allocate_value_buffer(v0, qword_25431E160);
  __swift_project_value_buffer(v0, (uint64_t)qword_25431E160);
  return sub_23DBAB0E0();
}

uint64_t static Logger.pinnedContent.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_25431E100 != -1)
    swift_once();
  v2 = sub_23DBAB0EC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_25431E160);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

id PinnedContentStore.healthStore.getter()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR____TtC28HealthAppHealthDaemonSupport18PinnedContentStore_healthStore);
}

void PinnedContentStore.__allocating_init(healthStore:domain:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  PinnedContentStore.init(healthStore:domain:)(a1);
}

void PinnedContentStore.init(healthStore:domain:)(void *a1)
{
  char *v1;
  char *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  char *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  objc_super v25;

  v2 = v1;
  swift_getObjectType();
  v4 = sub_23DBAB0C8();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)&v2[OBJC_IVAR____TtC28HealthAppHealthDaemonSupport18PinnedContentStore_proxyProvider] = 0;
  *(_QWORD *)&v2[OBJC_IVAR____TtC28HealthAppHealthDaemonSupport18PinnedContentStore_healthStore] = a1;
  v8 = (objc_class *)type metadata accessor for PinnedContentStore();
  v25.receiver = v2;
  v25.super_class = v8;
  v9 = a1;
  v10 = objc_msgSendSuper2(&v25, sel_init);
  v11 = v9;
  v12 = v10;
  sub_23DBAB5A8();
  v13 = (void *)objc_opt_self();
  v14 = (char *)v12;
  v15 = objc_msgSend(v13, sel_interfaceWithProtocol_, &unk_256CEB3A0);
  v16 = (void *)_s09HealthAppA13DaemonSupport18PinnedContentStoreC15serverInterfaceSo14NSXPCInterfaceCvgZ_0();
  sub_23DBAB0BC();
  v17 = objc_allocWithZone(MEMORY[0x24BDD4038]);
  v18 = (void *)sub_23DBAB2F0();
  swift_bridgeObjectRelease();
  v19 = (void *)sub_23DBAB0B0();
  v20 = objc_msgSend(v17, sel_initWithHealthStore_taskIdentifier_exportedObject_exportedInterface_remoteInterface_taskUUID_, v11, v18, v14, v15, v16, v19);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v21 = OBJC_IVAR____TtC28HealthAppHealthDaemonSupport18PinnedContentStore_proxyProvider;
  v22 = *(void **)&v14[OBJC_IVAR____TtC28HealthAppHealthDaemonSupport18PinnedContentStore_proxyProvider];
  *(_QWORD *)&v14[OBJC_IVAR____TtC28HealthAppHealthDaemonSupport18PinnedContentStore_proxyProvider] = v20;

  v23 = *(void **)&v14[v21];
  if (v23)
  {
    v24 = v23;
    objc_msgSend(v24, sel_setShouldRetryOnInterruption_, 0);

  }
  else
  {
    __break(1u);
  }
}

uint64_t type metadata accessor for PinnedContentStore()
{
  return objc_opt_self();
}

uint64_t static PinnedContentStore.taskIdentifier.getter()
{
  return sub_23DBAB5A8();
}

id static PinnedContentStore.clientInterface.getter()
{
  return objc_msgSend((id)objc_opt_self(), sel_interfaceWithProtocol_, &unk_256CEB3A0);
}

void sub_23DB9DEA8(uint64_t a1, uint64_t a2)
{
  char *v2;
  char *v3;
  uint64_t ObjectType;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  void *v12;
  char *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  _QWORD *v19;
  void *v20;
  char *v21;
  id v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t (*v29)();
  _QWORD *v30;

  v3 = v2;
  ObjectType = swift_getObjectType();
  v7 = OBJC_IVAR____TtC28HealthAppHealthDaemonSupport18PinnedContentStore_proxyProvider;
  v8 = *(void **)&v3[OBJC_IVAR____TtC28HealthAppHealthDaemonSupport18PinnedContentStore_proxyProvider];
  if (v8)
  {
    v9 = ObjectType;
    v10 = (_QWORD *)swift_allocObject();
    v10[2] = v3;
    v10[3] = a1;
    v10[4] = a2;
    v10[5] = v9;
    v29 = (uint64_t (*)())sub_23DBA43B8;
    v30 = v10;
    v11 = MEMORY[0x24BDAC760];
    v25 = MEMORY[0x24BDAC760];
    v26 = 1107296256;
    v27 = sub_23DB9E100;
    v28 = &block_descriptor;
    v12 = _Block_copy(&v25);
    v13 = v3;
    swift_retain();
    v14 = v8;
    swift_release();
    v15 = objc_msgSend(v14, sel_clientQueueObjectHandlerWithCompletion_, v12);
    _Block_release(v12);

    v16 = swift_allocObject();
    *(_QWORD *)(v16 + 16) = v15;
    v17 = *(void **)&v3[v7];
    if (v17)
    {
      v18 = v16;
      v19 = (_QWORD *)swift_allocObject();
      v19[2] = v13;
      v19[3] = sub_23DBA43DC;
      v19[4] = v18;
      v19[5] = v9;
      v29 = (uint64_t (*)())sub_23DBA43E8;
      v30 = v19;
      v25 = v11;
      v26 = 1107296256;
      v27 = sub_23DB9E5C8;
      v28 = &block_descriptor_9;
      v20 = _Block_copy(&v25);
      v21 = v13;
      v22 = v17;
      swift_retain();
      swift_release();
      v23 = swift_allocObject();
      *(_QWORD *)(v23 + 16) = sub_23DBA43DC;
      *(_QWORD *)(v23 + 24) = v18;
      v29 = sub_23DBA43F4;
      v30 = (_QWORD *)v23;
      v25 = v11;
      v26 = 1107296256;
      v27 = sub_23DB9E630;
      v28 = &block_descriptor_15;
      v24 = _Block_copy(&v25);
      swift_retain();
      swift_release();
      objc_msgSend(v22, sel_fetchProxyWithHandler_errorHandler_, v20, v24);
      _Block_release(v24);
      _Block_release(v20);
      swift_release();

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

uint64_t sub_23DB9E100(uint64_t a1, uint64_t a2, void *a3)
{
  void (*v5)(__int128 *, void *);
  id v6;
  __int128 v8;
  __int128 v9;

  v5 = *(void (**)(__int128 *, void *))(a1 + 32);
  if (a2)
  {
    *((_QWORD *)&v9 + 1) = swift_getObjectType();
    *(_QWORD *)&v8 = a2;
  }
  else
  {
    v8 = 0u;
    v9 = 0u;
  }
  swift_retain();
  swift_unknownObjectRetain();
  v6 = a3;
  v5(&v8, a3);
  swift_release();

  return sub_23DBA4F0C((uint64_t)&v8, (unint64_t *)&qword_256CE8B10, MEMORY[0x24BEE4AD8] + 8);
}

void sub_23DB9E1A0(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  _QWORD v11[3];
  uint64_t v12;

  sub_23DBA4D50(a1, (uint64_t)v11);
  v5 = v12;
  if (!v12)
  {
    v10 = 0;
    if (!a2)
      goto LABEL_4;
    goto LABEL_3;
  }
  v6 = __swift_project_boxed_opaque_existential_0(v11, v12);
  v7 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v6, v6);
  v9 = (char *)v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v7 + 16))(v9);
  v10 = sub_23DBAB530();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v5);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v11);
  if (a2)
LABEL_3:
    a2 = (void *)sub_23DBAB08C();
LABEL_4:
  (*(void (**)(uint64_t, uint64_t, void *))(a3 + 16))(a3, v10, a2);
  swift_unknownObjectRelease();

}

void sub_23DB9E2A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD aBlock[6];
  _QWORD v12[6];

  sub_23DBA4CB4(a1, (uint64_t)aBlock);
  sub_23DBA4CF0();
  if (swift_dynamicCast())
  {
    v7 = (void *)v12[0];
    v8 = (void *)sub_23DBAB2F0();
    v9 = swift_allocObject();
    *(_QWORD *)(v9 + 16) = a3;
    *(_QWORD *)(v9 + 24) = a4;
    aBlock[4] = sub_23DBA51F8;
    aBlock[5] = v9;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_23DB9E554;
    aBlock[3] = &block_descriptor_296;
    v10 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v7, sel_remote_fetchPinnedContentInDomain_withCompletion_, v8, v10);
    _Block_release(v10);
    swift_unknownObjectRelease();

  }
  else
  {
    sub_23DBA4CB4(a1, (uint64_t)aBlock);
    v12[0] = 0;
    v12[1] = 0xE000000000000000;
    sub_23DBAB47C();
    swift_bridgeObjectRelease();
    v12[4] = 91;
    v12[5] = 0xE100000000000000;
    sub_23DBAB5A8();
    sub_23DBAB320();
    swift_bridgeObjectRelease();
    sub_23DBAB320();
    sub_23DBAB320();
    sub_23DBAB320();
    sub_23DBA4CB4((uint64_t)aBlock, (uint64_t)v12);
    sub_23DBAB308();
    sub_23DBAB320();
    swift_bridgeObjectRelease();
    sub_23DBAB4F4();
    __break(1u);
  }
}

uint64_t sub_23DB9E4D0(void *a1, uint64_t a2, void (*a3)(__int128 *, uint64_t))
{
  id v6;
  __int128 v8;
  __int128 v9;

  if (a1)
  {
    *((_QWORD *)&v9 + 1) = type metadata accessor for PinnedContentState();
    *(_QWORD *)&v8 = a1;
  }
  else
  {
    v8 = 0u;
    v9 = 0u;
  }
  v6 = a1;
  a3(&v8, a2);
  return sub_23DBA4F0C((uint64_t)&v8, (unint64_t *)&qword_256CE8B10, MEMORY[0x24BEE4AD8] + 8);
}

void sub_23DB9E554(uint64_t a1, void *a2, void *a3)
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

uint64_t sub_23DB9E5C8(uint64_t a1, uint64_t a2)
{
  void (*v3)(_QWORD *);
  _QWORD v5[4];

  v3 = *(void (**)(_QWORD *))(a1 + 32);
  v5[3] = swift_getObjectType();
  v5[0] = a2;
  swift_retain();
  swift_unknownObjectRetain();
  v3(v5);
  swift_release();
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v5);
}

void sub_23DB9E630(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

uint64_t sub_23DB9E680()
{
  char *v0;
  void *v1;
  uint64_t ObjectType;
  uint64_t v3;
  id *v4;
  uint64_t result;
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void **v17;
  uint64_t aBlock;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;

  v1 = v0;
  ObjectType = swift_getObjectType();
  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = 0;
  v4 = (id *)(v3 + 16);
  result = swift_allocObject();
  *(_QWORD *)(result + 16) = 0;
  v17 = (void **)(result + 16);
  v6 = *(void **)&v0[OBJC_IVAR____TtC28HealthAppHealthDaemonSupport18PinnedContentStore_proxyProvider];
  if (!v6)
    goto LABEL_9;
  v7 = result;
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = v1;
  v8[3] = v3;
  v8[4] = v7;
  v8[5] = ObjectType;
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = sub_23DBA4444;
  *(_QWORD *)(v9 + 24) = v8;
  v22 = sub_23DBA4460;
  v23 = v9;
  aBlock = MEMORY[0x24BDAC760];
  v19 = 1107296256;
  v20 = sub_23DB9EB8C;
  v21 = &block_descriptor_30;
  v10 = _Block_copy(&aBlock);
  v11 = v1;
  swift_retain();
  swift_retain();
  swift_retain();
  v12 = v6;
  swift_release();
  v22 = sub_23DBA4480;
  v23 = v7;
  aBlock = MEMORY[0x24BDAC760];
  v19 = 1107296256;
  v20 = sub_23DB9E630;
  v21 = &block_descriptor_33;
  v13 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v12, sel_getSynchronousProxyWithHandler_errorHandler_, v10, v13);

  _Block_release(v13);
  _Block_release(v10);
  LOBYTE(v13) = swift_isEscapingClosureAtFileLocation();
  result = swift_release();
  if ((v13 & 1) != 0)
  {
    __break(1u);
LABEL_9:
    __break(1u);
    return result;
  }
  swift_beginAccess();
  if (*v4)
  {
    v14 = *v4;
    swift_release();
    swift_release();
    swift_release();
    return (uint64_t)v14;
  }
  else
  {
    swift_beginAccess();
    v15 = *v17;
    if (!*v17)
    {
      sub_23DBA4498();
      swift_allocError();
      v15 = 0;
    }
    v16 = v15;
    swift_willThrow();
    swift_release();
    swift_release();
    return swift_release();
  }
}

void sub_23DB9E95C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD aBlock[6];
  _QWORD v12[6];

  sub_23DBA4CB4(a1, (uint64_t)aBlock);
  sub_23DBA4CF0();
  if (swift_dynamicCast())
  {
    v7 = (void *)v12[0];
    v8 = (void *)sub_23DBAB2F0();
    v9 = swift_allocObject();
    *(_QWORD *)(v9 + 16) = a3;
    *(_QWORD *)(v9 + 24) = a4;
    aBlock[4] = sub_23DBA51F4;
    aBlock[5] = v9;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_23DB9E554;
    aBlock[3] = &block_descriptor_289;
    v10 = _Block_copy(aBlock);
    swift_retain();
    swift_retain();
    swift_release();
    objc_msgSend(v7, sel_remote_fetchPinnedContentInDomain_withCompletion_, v8, v10);
    _Block_release(v10);
    swift_unknownObjectRelease();

  }
  else
  {
    sub_23DBA4CB4(a1, (uint64_t)aBlock);
    v12[0] = 0;
    v12[1] = 0xE000000000000000;
    sub_23DBAB47C();
    swift_bridgeObjectRelease();
    v12[4] = 91;
    v12[5] = 0xE100000000000000;
    sub_23DBAB5A8();
    sub_23DBAB320();
    swift_bridgeObjectRelease();
    sub_23DBAB320();
    sub_23DBAB320();
    sub_23DBAB320();
    sub_23DBA4CB4((uint64_t)aBlock, (uint64_t)v12);
    sub_23DBAB308();
    sub_23DBAB320();
    swift_bridgeObjectRelease();
    sub_23DBAB4F4();
    __break(1u);
  }
}

uint64_t sub_23DB9EB8C(uint64_t a1, uint64_t a2)
{
  void (*v3)(_QWORD *);
  _QWORD v5[4];

  v3 = *(void (**)(_QWORD *))(a1 + 32);
  v5[3] = swift_getObjectType();
  v5[0] = a2;
  swift_unknownObjectRetain();
  v3(v5);
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v5);
}

void sub_23DB9EBE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char *v3;
  char *v4;
  uint64_t ObjectType;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  void *v14;
  char *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  _QWORD *v21;
  void *v22;
  char *v23;
  id v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t (*v31)(uint64_t);
  _QWORD *v32;

  v4 = v3;
  ObjectType = swift_getObjectType();
  v9 = OBJC_IVAR____TtC28HealthAppHealthDaemonSupport18PinnedContentStore_proxyProvider;
  v10 = *(void **)&v3[OBJC_IVAR____TtC28HealthAppHealthDaemonSupport18PinnedContentStore_proxyProvider];
  if (v10)
  {
    v11 = ObjectType;
    v12 = (_QWORD *)swift_allocObject();
    v12[2] = v4;
    v12[3] = a2;
    v12[4] = a3;
    v12[5] = v11;
    v31 = (uint64_t (*)(uint64_t))sub_23DBA5150;
    v32 = v12;
    v13 = MEMORY[0x24BDAC760];
    v27 = MEMORY[0x24BDAC760];
    v28 = 1107296256;
    v29 = sub_23DB9E100;
    v30 = &block_descriptor_39;
    v14 = _Block_copy(&v27);
    v15 = v4;
    swift_retain();
    v16 = v10;
    swift_release();
    v17 = objc_msgSend(v16, sel_clientQueueObjectHandlerWithCompletion_, v14);
    _Block_release(v14);

    v18 = swift_allocObject();
    *(_QWORD *)(v18 + 16) = v17;
    v19 = *(void **)&v4[v9];
    if (v19)
    {
      v20 = v18;
      v21 = (_QWORD *)swift_allocObject();
      v21[2] = v15;
      v21[3] = a1;
      v21[4] = sub_23DBA5064;
      v21[5] = v20;
      v21[6] = v11;
      v31 = sub_23DBA4514;
      v32 = v21;
      v27 = v13;
      v28 = 1107296256;
      v29 = sub_23DB9E5C8;
      v30 = &block_descriptor_49;
      v22 = _Block_copy(&v27);
      v23 = v15;
      v24 = v19;
      swift_bridgeObjectRetain();
      swift_retain();
      swift_release();
      v25 = swift_allocObject();
      *(_QWORD *)(v25 + 16) = sub_23DBA5064;
      *(_QWORD *)(v25 + 24) = v20;
      v31 = (uint64_t (*)(uint64_t))sub_23DBA43F4;
      v32 = (_QWORD *)v25;
      v27 = v13;
      v28 = 1107296256;
      v29 = sub_23DB9E630;
      v30 = &block_descriptor_55;
      v26 = _Block_copy(&v27);
      swift_retain();
      swift_release();
      objc_msgSend(v24, sel_fetchProxyWithHandler_errorHandler_, v22, v26);
      _Block_release(v26);
      _Block_release(v22);
      swift_release();

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

void sub_23DB9EE4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v9;
  uint64_t v10;
  _BYTE *v11;
  objc_class *v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  objc_class *v18;
  char *v19;
  char *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  objc_super v26;
  _QWORD aBlock[6];
  objc_super v28;
  _QWORD v29[5];

  sub_23DBA4CB4(a1, (uint64_t)aBlock);
  sub_23DBA4CF0();
  if (swift_dynamicCast())
  {
    v9 = (void *)v29[0];
    v10 = *(_QWORD *)(a3 + 16);
    if (v10)
    {
      v25 = a4;
      aBlock[0] = MEMORY[0x24BEE4AF8];
      sub_23DBAB4C4();
      v11 = (_BYTE *)(a3 + 56);
      do
      {
        v15 = *((_QWORD *)v11 - 3);
        if (*v11 == 1)
        {
          v16 = *((_QWORD *)v11 - 2);
          v17 = *((_QWORD *)v11 - 1);
          v18 = (objc_class *)type metadata accessor for CodablePinnedContentDifference();
          v19 = (char *)objc_allocWithZone(v18);
          v20 = &v19[OBJC_IVAR___HAHDCodablePinnedContentDifference_identifier];
          *(_QWORD *)v20 = 0;
          *((_QWORD *)v20 + 1) = 0;
          *(_QWORD *)&v19[OBJC_IVAR___HAHDCodablePinnedContentDifference_index] = v17;
          swift_beginAccess();
          *(_QWORD *)v20 = v15;
          *((_QWORD *)v20 + 1) = v16;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          v26.receiver = v19;
          v26.super_class = v18;
          objc_msgSendSuper2(&v26, sel_init);
        }
        else
        {
          v12 = (objc_class *)type metadata accessor for CodablePinnedContentDifference();
          v13 = (char *)objc_allocWithZone(v12);
          v14 = &v13[OBJC_IVAR___HAHDCodablePinnedContentDifference_identifier];
          *(_QWORD *)v14 = 0;
          *((_QWORD *)v14 + 1) = 0;
          *(_QWORD *)&v13[OBJC_IVAR___HAHDCodablePinnedContentDifference_index] = v15;
          swift_beginAccess();
          *(_QWORD *)v14 = 0;
          *((_QWORD *)v14 + 1) = 0;
          swift_bridgeObjectRelease();
          v28.receiver = v13;
          v28.super_class = v12;
          objc_msgSendSuper2(&v28, sel_init);
        }
        sub_23DBAB4AC();
        sub_23DBAB4D0();
        sub_23DBAB4DC();
        sub_23DBAB4B8();
        v11 += 32;
        --v10;
      }
      while (v10);
      a4 = v25;
    }
    type metadata accessor for CodablePinnedContentDifference();
    v21 = (void *)sub_23DBAB350();
    swift_bridgeObjectRelease();
    v22 = (void *)sub_23DBAB2F0();
    v23 = swift_allocObject();
    *(_QWORD *)(v23 + 16) = a4;
    *(_QWORD *)(v23 + 24) = a5;
    aBlock[4] = sub_23DBA51F8;
    aBlock[5] = v23;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_23DB9E554;
    aBlock[3] = &block_descriptor_283;
    v24 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v9, sel_remote_applyDifferencesWithDifferences_inDomain_completion_, v21, v22, v24);
    _Block_release(v24);
    swift_unknownObjectRelease();

  }
  else
  {
    sub_23DBA4CB4(a1, (uint64_t)aBlock);
    v29[0] = 0;
    v29[1] = 0xE000000000000000;
    sub_23DBAB47C();
    swift_bridgeObjectRelease();
    sub_23DBAB5A8();
    sub_23DBAB320();
    swift_bridgeObjectRelease();
    sub_23DBAB320();
    sub_23DBAB320();
    sub_23DBAB320();
    sub_23DBA4CB4((uint64_t)aBlock, (uint64_t)v29);
    sub_23DBAB308();
    sub_23DBAB320();
    swift_bridgeObjectRelease();
    sub_23DBAB4F4();
    __break(1u);
  }
}

uint64_t sub_23DB9F228(uint64_t a1)
{
  char *v1;
  uint64_t ObjectType;
  uint64_t v4;
  uint64_t result;
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  char *v11;
  id v12;
  void *v13;
  id *v14;
  id v15;
  void *v16;
  id v17;
  void **v18;
  uint64_t aBlock;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id *v25;

  ObjectType = swift_getObjectType();
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = 0;
  v25 = (id *)(v4 + 16);
  result = swift_allocObject();
  *(_QWORD *)(result + 16) = 0;
  v18 = (void **)(result + 16);
  v6 = *(void **)&v1[OBJC_IVAR____TtC28HealthAppHealthDaemonSupport18PinnedContentStore_proxyProvider];
  if (!v6)
    goto LABEL_9;
  v7 = result;
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = v1;
  v8[3] = a1;
  v8[4] = v4;
  v8[5] = v7;
  v8[6] = ObjectType;
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = sub_23DBA455C;
  *(_QWORD *)(v9 + 24) = v8;
  v23 = sub_23DBA51FC;
  v24 = v9;
  aBlock = MEMORY[0x24BDAC760];
  v20 = 1107296256;
  v21 = sub_23DB9EB8C;
  v22 = &block_descriptor_67;
  v10 = _Block_copy(&aBlock);
  v11 = v1;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  v12 = v6;
  swift_release();
  v23 = sub_23DBA4480;
  v24 = v7;
  aBlock = MEMORY[0x24BDAC760];
  v20 = 1107296256;
  v21 = sub_23DB9E630;
  v22 = &block_descriptor_70;
  v13 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v12, sel_getSynchronousProxyWithHandler_errorHandler_, v10, v13);

  _Block_release(v13);
  _Block_release(v10);
  LOBYTE(v13) = swift_isEscapingClosureAtFileLocation();
  result = swift_release();
  if ((v13 & 1) != 0)
  {
    __break(1u);
LABEL_9:
    __break(1u);
    return result;
  }
  v14 = v25;
  swift_beginAccess();
  if (*v14)
  {
    v15 = *v14;
    swift_release();
    swift_release();
    swift_release();
    return (uint64_t)v15;
  }
  else
  {
    swift_beginAccess();
    v16 = *v18;
    if (!*v18)
    {
      sub_23DBA4498();
      swift_allocError();
      v16 = 0;
    }
    v17 = v16;
    swift_willThrow();
    swift_release();
    swift_release();
    return swift_release();
  }
}

void sub_23DB9F514(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v9;
  uint64_t v10;
  _BYTE *v11;
  objc_class *v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  objc_class *v18;
  char *v19;
  char *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  objc_super v27;
  _QWORD aBlock[6];
  objc_super v29;
  _QWORD v30[5];

  sub_23DBA4CB4(a1, (uint64_t)aBlock);
  sub_23DBA4CF0();
  if (swift_dynamicCast())
  {
    v9 = (void *)v30[0];
    v10 = *(_QWORD *)(a3 + 16);
    if (v10)
    {
      v25 = (void *)v30[0];
      v26 = a5;
      aBlock[0] = MEMORY[0x24BEE4AF8];
      sub_23DBAB4C4();
      v11 = (_BYTE *)(a3 + 56);
      do
      {
        v15 = *((_QWORD *)v11 - 3);
        if (*v11 == 1)
        {
          v16 = *((_QWORD *)v11 - 2);
          v17 = *((_QWORD *)v11 - 1);
          v18 = (objc_class *)type metadata accessor for CodablePinnedContentDifference();
          v19 = (char *)objc_allocWithZone(v18);
          v20 = &v19[OBJC_IVAR___HAHDCodablePinnedContentDifference_identifier];
          *(_QWORD *)v20 = 0;
          *((_QWORD *)v20 + 1) = 0;
          *(_QWORD *)&v19[OBJC_IVAR___HAHDCodablePinnedContentDifference_index] = v17;
          swift_beginAccess();
          *(_QWORD *)v20 = v15;
          *((_QWORD *)v20 + 1) = v16;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          v27.receiver = v19;
          v27.super_class = v18;
          objc_msgSendSuper2(&v27, sel_init);
        }
        else
        {
          v12 = (objc_class *)type metadata accessor for CodablePinnedContentDifference();
          v13 = (char *)objc_allocWithZone(v12);
          v14 = &v13[OBJC_IVAR___HAHDCodablePinnedContentDifference_identifier];
          *(_QWORD *)v14 = 0;
          *((_QWORD *)v14 + 1) = 0;
          *(_QWORD *)&v13[OBJC_IVAR___HAHDCodablePinnedContentDifference_index] = v15;
          swift_beginAccess();
          *(_QWORD *)v14 = 0;
          *((_QWORD *)v14 + 1) = 0;
          swift_bridgeObjectRelease();
          v29.receiver = v13;
          v29.super_class = v12;
          objc_msgSendSuper2(&v29, sel_init);
        }
        sub_23DBAB4AC();
        sub_23DBAB4D0();
        sub_23DBAB4DC();
        sub_23DBAB4B8();
        v11 += 32;
        --v10;
      }
      while (v10);
      a5 = v26;
      v9 = v25;
    }
    type metadata accessor for CodablePinnedContentDifference();
    v21 = (void *)sub_23DBAB350();
    swift_bridgeObjectRelease();
    v22 = (void *)sub_23DBAB2F0();
    v23 = swift_allocObject();
    *(_QWORD *)(v23 + 16) = a4;
    *(_QWORD *)(v23 + 24) = a5;
    aBlock[4] = sub_23DBA51F4;
    aBlock[5] = v23;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_23DB9E554;
    aBlock[3] = &block_descriptor_276;
    v24 = _Block_copy(aBlock);
    swift_retain();
    swift_retain();
    swift_release();
    objc_msgSend(v9, sel_remote_applyDifferencesWithDifferences_inDomain_completion_, v21, v22, v24);
    _Block_release(v24);
    swift_unknownObjectRelease();

  }
  else
  {
    sub_23DBA4CB4(a1, (uint64_t)aBlock);
    v30[0] = 0;
    v30[1] = 0xE000000000000000;
    sub_23DBAB47C();
    swift_bridgeObjectRelease();
    sub_23DBAB5A8();
    sub_23DBAB320();
    swift_bridgeObjectRelease();
    sub_23DBAB320();
    sub_23DBAB320();
    sub_23DBAB320();
    sub_23DBA4CB4((uint64_t)aBlock, (uint64_t)v30);
    sub_23DBAB308();
    sub_23DBAB320();
    swift_bridgeObjectRelease();
    sub_23DBAB4F4();
    __break(1u);
  }
}

void sub_23DB9F8F8(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  char *v6;
  char *v7;
  uint64_t ObjectType;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  _QWORD *v16;
  void *v17;
  char *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  char *v27;
  id v28;
  uint64_t v29;
  void *v30;
  uint64_t aBlock;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t (*v37)();
  _QWORD *v38;

  v7 = v6;
  ObjectType = swift_getObjectType();
  v13 = OBJC_IVAR____TtC28HealthAppHealthDaemonSupport18PinnedContentStore_proxyProvider;
  v14 = *(void **)&v7[OBJC_IVAR____TtC28HealthAppHealthDaemonSupport18PinnedContentStore_proxyProvider];
  if (v14)
  {
    v15 = ObjectType;
    v16 = (_QWORD *)swift_allocObject();
    v16[2] = v7;
    v16[3] = a5;
    v16[4] = a6;
    v16[5] = v15;
    v37 = (uint64_t (*)())sub_23DBA4590;
    v38 = v16;
    aBlock = MEMORY[0x24BDAC760];
    v34 = 1107296256;
    v35 = sub_23DB9E100;
    v36 = &block_descriptor_76;
    v17 = _Block_copy(&aBlock);
    v18 = v7;
    swift_retain();
    v19 = v14;
    swift_release();
    v20 = objc_msgSend(v19, sel_clientQueueObjectHandlerWithCompletion_, v17);
    _Block_release(v17);

    v21 = swift_allocObject();
    *(_QWORD *)(v21 + 16) = v20;
    v22 = *(void **)&v7[v13];
    if (v22)
    {
      v23 = v21;
      v24 = swift_allocObject();
      *(_QWORD *)(v24 + 16) = v18;
      *(_QWORD *)(v24 + 24) = a1;
      *(_QWORD *)(v24 + 32) = a2;
      *(_QWORD *)(v24 + 40) = a3;
      *(_BYTE *)(v24 + 48) = a4 & 1;
      *(_QWORD *)(v24 + 56) = sub_23DBA5064;
      *(_QWORD *)(v24 + 64) = v23;
      *(_QWORD *)(v24 + 72) = v15;
      v37 = (uint64_t (*)())sub_23DBA45E8;
      v38 = (_QWORD *)v24;
      v25 = MEMORY[0x24BDAC760];
      aBlock = MEMORY[0x24BDAC760];
      v34 = 1107296256;
      v35 = sub_23DB9E5C8;
      v36 = &block_descriptor_86;
      v26 = _Block_copy(&aBlock);
      v27 = v18;
      v28 = v22;
      swift_bridgeObjectRetain();
      swift_retain();
      swift_release();
      v29 = swift_allocObject();
      *(_QWORD *)(v29 + 16) = sub_23DBA5064;
      *(_QWORD *)(v29 + 24) = v23;
      v37 = sub_23DBA43F4;
      v38 = (_QWORD *)v29;
      aBlock = v25;
      v34 = 1107296256;
      v35 = sub_23DB9E630;
      v36 = &block_descriptor_92;
      v30 = _Block_copy(&aBlock);
      swift_retain();
      swift_release();
      objc_msgSend(v28, sel_fetchProxyWithHandler_errorHandler_, v26, v30);
      _Block_release(v30);
      _Block_release(v26);
      swift_release();

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

void sub_23DB9FB88(uint64_t a1, void *a2, void *a3, void (*a4)(id, _QWORD), uint64_t a5, uint64_t a6, const char *a7)
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  id v23;
  NSObject *v24;
  os_log_type_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  id v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  void *v37;
  id v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void (*v42)(id, _QWORD);
  int v43;
  id v44[4];
  uint64_t v45;
  _BYTE v46[24];
  uint64_t v47;

  v13 = sub_23DBAB0EC();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8]();
  v16 = (char *)&v39 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DBA4D50(a1, (uint64_t)v46);
  if (v47)
  {
    type metadata accessor for PinnedContentState();
    if ((swift_dynamicCast() & 1) != 0)
    {
      v17 = v44[0];
      v18 = v44[0];
      a4(v17, 0);

      return;
    }
  }
  else
  {
    sub_23DBA4F0C((uint64_t)v46, (unint64_t *)&qword_256CE8B10, MEMORY[0x24BEE4AD8] + 8);
  }
  if (qword_25431E100 != -1)
    swift_once();
  v19 = __swift_project_value_buffer(v13, (uint64_t)qword_25431E160);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v16, v19, v13);
  sub_23DBA4D50(a1, (uint64_t)v46);
  v20 = a3;
  v21 = a2;
  v22 = v20;
  v23 = a2;
  v24 = sub_23DBAB0D4();
  v25 = sub_23DBAB3EC();
  v43 = v25;
  if (os_log_type_enabled(v24, v25))
  {
    v26 = swift_slowAlloc();
    v41 = a5;
    v27 = v26;
    v40 = swift_slowAlloc();
    v45 = v40;
    *(_DWORD *)v27 = 136315906;
    v42 = a4;
    v28 = sub_23DBAB5A8();
    v44[0] = (id)sub_23DBA8734(v28, v29, &v45);
    v39 = a7;
    sub_23DBAB41C();
    swift_bridgeObjectRelease();
    *(_WORD *)(v27 + 12) = 2080;
    v44[0] = (id)sub_23DBA8734(0x7972616D6D7573, 0xE700000000000000, &v45);
    sub_23DBAB41C();

    *(_WORD *)(v27 + 22) = 2080;
    sub_23DBA4D50((uint64_t)v46, (uint64_t)v44);
    v30 = MEMORY[0x24BEE4AD8] + 8;
    sub_23DBA5020(0, (unint64_t *)&qword_256CE8B10, MEMORY[0x24BEE4AD8] + 8, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE1C68]);
    v31 = sub_23DBAB308();
    v44[0] = (id)sub_23DBA8734(v31, v32, &v45);
    sub_23DBAB41C();
    swift_bridgeObjectRelease();
    sub_23DBA4F0C((uint64_t)v46, (unint64_t *)&qword_256CE8B10, v30);
    *(_WORD *)(v27 + 32) = 2080;
    v44[0] = a2;
    v33 = a2;
    sub_23DBA4DD4();
    v34 = sub_23DBAB308();
    v44[0] = (id)sub_23DBA8734(v34, v35, &v45);
    a4 = v42;
    sub_23DBAB41C();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_23DB9B000, v24, (os_log_type_t)v43, v39, (uint8_t *)v27, 0x2Au);
    v36 = v40;
    swift_arrayDestroy();
    MEMORY[0x24263D18C](v36, -1, -1);
    MEMORY[0x24263D18C](v27, -1, -1);
  }
  else
  {

    sub_23DBA4F0C((uint64_t)v46, (unint64_t *)&qword_256CE8B10, MEMORY[0x24BEE4AD8] + 8);
  }

  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  v37 = a2;
  if (!a2)
  {
    sub_23DBA4498();
    v37 = (void *)swift_allocError();
  }
  v38 = a2;
  a4(v37, 1);

}

void sub_23DB9FFEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8)
{
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  _QWORD aBlock[6];
  _QWORD v19[6];

  sub_23DBA4CB4(a1, (uint64_t)aBlock);
  sub_23DBA4CF0();
  if (swift_dynamicCast())
  {
    v12 = (void *)v19[0];
    v13 = (void *)sub_23DBAB2F0();
    v14 = (void *)sub_23DBAB2F0();
    if ((a6 & 1) != 0)
    {
      v15 = 0;
    }
    else
    {
      sub_23DBA4ED4(0, &qword_256CE8B18);
      v15 = (void *)sub_23DBAB404();
    }
    v16 = swift_allocObject();
    *(_QWORD *)(v16 + 16) = a7;
    *(_QWORD *)(v16 + 24) = a8;
    aBlock[4] = sub_23DBA51F8;
    aBlock[5] = v16;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_23DB9E554;
    aBlock[3] = &block_descriptor_270;
    v17 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v12, sel_remote_pinContentWithIdentifier_inDomain_atIndex_completion_, v13, v14, v15, v17);
    _Block_release(v17);
    swift_unknownObjectRelease();

  }
  else
  {
    sub_23DBA4CB4(a1, (uint64_t)aBlock);
    v19[0] = 0;
    v19[1] = 0xE000000000000000;
    sub_23DBAB47C();
    swift_bridgeObjectRelease();
    v19[4] = 91;
    v19[5] = 0xE100000000000000;
    sub_23DBAB5A8();
    sub_23DBAB320();
    swift_bridgeObjectRelease();
    sub_23DBAB320();
    sub_23DBAB320();
    sub_23DBAB320();
    sub_23DBA4CB4((uint64_t)aBlock, (uint64_t)v19);
    sub_23DBAB308();
    sub_23DBAB320();
    swift_bridgeObjectRelease();
    sub_23DBAB4F4();
    __break(1u);
  }
}

uint64_t sub_23DBA0284(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  char *v4;
  void *v5;
  uint64_t ObjectType;
  uint64_t v10;
  uint64_t result;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void **v23;
  id *v24;
  uint64_t aBlock;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;

  v5 = v4;
  ObjectType = swift_getObjectType();
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = 0;
  v24 = (id *)(v10 + 16);
  result = swift_allocObject();
  *(_QWORD *)(result + 16) = 0;
  v23 = (void **)(result + 16);
  v12 = *(void **)&v4[OBJC_IVAR____TtC28HealthAppHealthDaemonSupport18PinnedContentStore_proxyProvider];
  if (!v12)
    goto LABEL_9;
  v13 = result;
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = v5;
  *(_QWORD *)(v14 + 24) = a1;
  *(_QWORD *)(v14 + 32) = a2;
  *(_QWORD *)(v14 + 40) = a3;
  *(_BYTE *)(v14 + 48) = a4 & 1;
  *(_QWORD *)(v14 + 56) = v10;
  *(_QWORD *)(v14 + 64) = v13;
  *(_QWORD *)(v14 + 72) = ObjectType;
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = sub_23DBA4684;
  *(_QWORD *)(v15 + 24) = v14;
  v30 = sub_23DBA51FC;
  v31 = v15;
  aBlock = MEMORY[0x24BDAC760];
  v27 = 1107296256;
  v28 = sub_23DB9EB8C;
  v29 = &block_descriptor_104;
  v16 = _Block_copy(&aBlock);
  v17 = v5;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  v18 = v12;
  swift_release();
  v30 = sub_23DBA4480;
  v31 = v13;
  aBlock = MEMORY[0x24BDAC760];
  v27 = 1107296256;
  v28 = sub_23DB9E630;
  v29 = &block_descriptor_107;
  v19 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v18, sel_getSynchronousProxyWithHandler_errorHandler_, v16, v19);

  _Block_release(v19);
  _Block_release(v16);
  LOBYTE(v19) = swift_isEscapingClosureAtFileLocation();
  result = swift_release();
  if ((v19 & 1) != 0)
  {
    __break(1u);
LABEL_9:
    __break(1u);
    return result;
  }
  swift_beginAccess();
  if (*v24)
  {
    v20 = *v24;
    swift_release();
    swift_release();
    swift_release();
    return (uint64_t)v20;
  }
  else
  {
    swift_beginAccess();
    v21 = *v23;
    if (!*v23)
    {
      sub_23DBA4498();
      swift_allocError();
      v21 = 0;
    }
    v22 = v21;
    swift_willThrow();
    swift_release();
    swift_release();
    return swift_release();
  }
}

void sub_23DBA0594(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8)
{
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  _QWORD aBlock[6];
  _QWORD v19[6];

  sub_23DBA4CB4(a1, (uint64_t)aBlock);
  sub_23DBA4CF0();
  if (swift_dynamicCast())
  {
    v12 = (void *)v19[0];
    v13 = (void *)sub_23DBAB2F0();
    v14 = (void *)sub_23DBAB2F0();
    if ((a6 & 1) != 0)
    {
      v15 = 0;
    }
    else
    {
      sub_23DBA4ED4(0, &qword_256CE8B18);
      v15 = (void *)sub_23DBAB404();
    }
    v16 = swift_allocObject();
    *(_QWORD *)(v16 + 16) = a7;
    *(_QWORD *)(v16 + 24) = a8;
    aBlock[4] = sub_23DBA4DBC;
    aBlock[5] = v16;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_23DB9E554;
    aBlock[3] = &block_descriptor_263;
    v17 = _Block_copy(aBlock);
    swift_retain();
    swift_retain();
    swift_release();
    objc_msgSend(v12, sel_remote_pinContentWithIdentifier_inDomain_atIndex_completion_, v13, v14, v15, v17);
    _Block_release(v17);
    swift_unknownObjectRelease();

  }
  else
  {
    sub_23DBA4CB4(a1, (uint64_t)aBlock);
    v19[0] = 0;
    v19[1] = 0xE000000000000000;
    sub_23DBAB47C();
    swift_bridgeObjectRelease();
    v19[4] = 91;
    v19[5] = 0xE100000000000000;
    sub_23DBAB5A8();
    sub_23DBAB320();
    swift_bridgeObjectRelease();
    sub_23DBAB320();
    sub_23DBAB320();
    sub_23DBAB320();
    sub_23DBA4CB4((uint64_t)aBlock, (uint64_t)v19);
    sub_23DBAB308();
    sub_23DBAB320();
    swift_bridgeObjectRelease();
    sub_23DBAB4F4();
    __break(1u);
  }
}

void sub_23DBA0834(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  char *v4;
  uint64_t ObjectType;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  _QWORD *v21;
  void *v22;
  id v23;
  char *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t (*v31)(uint64_t);
  _QWORD *v32;

  ObjectType = swift_getObjectType();
  v10 = OBJC_IVAR____TtC28HealthAppHealthDaemonSupport18PinnedContentStore_proxyProvider;
  v11 = *(void **)&v4[OBJC_IVAR____TtC28HealthAppHealthDaemonSupport18PinnedContentStore_proxyProvider];
  if (v11)
  {
    v12 = ObjectType;
    v13 = swift_allocObject();
    *(_QWORD *)(v13 + 16) = a3;
    *(_QWORD *)(v13 + 24) = a4;
    v31 = (uint64_t (*)(uint64_t))sub_23DBA51F0;
    v32 = (_QWORD *)v13;
    v14 = MEMORY[0x24BDAC760];
    v27 = MEMORY[0x24BDAC760];
    v28 = 1107296256;
    v29 = sub_23DB9E100;
    v30 = &block_descriptor_113;
    v15 = _Block_copy(&v27);
    swift_retain();
    v16 = v11;
    swift_release();
    v17 = objc_msgSend(v16, sel_clientQueueObjectHandlerWithCompletion_, v15);
    _Block_release(v15);

    v18 = swift_allocObject();
    *(_QWORD *)(v18 + 16) = v17;
    v19 = *(void **)&v4[v10];
    if (v19)
    {
      v20 = v18;
      v21 = (_QWORD *)swift_allocObject();
      v21[2] = v4;
      v21[3] = a1;
      v21[4] = a2;
      v21[5] = sub_23DBA5064;
      v21[6] = v20;
      v21[7] = v12;
      v31 = sub_23DBA4754;
      v32 = v21;
      v27 = v14;
      v28 = 1107296256;
      v29 = sub_23DB9E5C8;
      v30 = &block_descriptor_123;
      v22 = _Block_copy(&v27);
      v23 = v19;
      v24 = v4;
      swift_bridgeObjectRetain();
      swift_retain();
      swift_release();
      v25 = swift_allocObject();
      *(_QWORD *)(v25 + 16) = sub_23DBA5064;
      *(_QWORD *)(v25 + 24) = v20;
      v31 = (uint64_t (*)(uint64_t))sub_23DBA4760;
      v32 = (_QWORD *)v25;
      v27 = v14;
      v28 = 1107296256;
      v29 = sub_23DB9E630;
      v30 = &block_descriptor_129;
      v26 = _Block_copy(&v27);
      swift_retain();
      swift_release();
      objc_msgSend(v23, sel_fetchProxyWithHandler_errorHandler_, v22, v26);
      _Block_release(v26);
      _Block_release(v22);
      swift_release();

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

void sub_23DBA0A90(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  id v21;
  NSObject *v22;
  os_log_type_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  _QWORD aBlock[6];
  uint64_t v32[4];
  uint64_t v33;

  v10 = sub_23DBAB0EC();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10, v12);
  v14 = (char *)&aBlock[-1] - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DBA4CB4(a1, (uint64_t)aBlock);
  sub_23DBA4CF0();
  if ((swift_dynamicCast() & 1) != 0)
  {
    v15 = (void *)v32[0];
    v16 = (void *)sub_23DBAB2F0();
    v17 = (void *)sub_23DBAB2F0();
    v18 = swift_allocObject();
    *(_QWORD *)(v18 + 16) = a5;
    *(_QWORD *)(v18 + 24) = a6;
    aBlock[4] = sub_23DBA51F8;
    aBlock[5] = v18;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_23DB9E554;
    aBlock[3] = &block_descriptor_257;
    v19 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v15, sel_remote_unpinContentWithIdentifier_inDomain_completion_, v16, v17, v19);
    _Block_release(v19);
    swift_unknownObjectRelease();

  }
  else
  {
    if (qword_25431E100 != -1)
      swift_once();
    v20 = __swift_project_value_buffer(v10, (uint64_t)qword_25431E160);
    (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v14, v20, v10);
    sub_23DBA4CB4(a1, (uint64_t)aBlock);
    v21 = a2;
    v22 = sub_23DBAB0D4();
    v23 = sub_23DBAB3EC();
    if (os_log_type_enabled(v22, v23))
    {
      v24 = swift_slowAlloc();
      v25 = swift_slowAlloc();
      v33 = v25;
      *(_DWORD *)v24 = 136315650;
      v26 = sub_23DBAB5A8();
      v32[0] = sub_23DBA8734(v26, v27, &v33);
      v30 = v11;
      sub_23DBAB41C();
      swift_bridgeObjectRelease();
      *(_WORD *)(v24 + 12) = 2080;
      v32[0] = sub_23DBA8734(0x7972616D6D7573, 0xE700000000000000, &v33);
      sub_23DBAB41C();

      *(_WORD *)(v24 + 22) = 2080;
      sub_23DBA4CB4((uint64_t)aBlock, (uint64_t)v32);
      v28 = sub_23DBAB308();
      v32[0] = sub_23DBA8734(v28, v29, &v33);
      sub_23DBAB41C();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_0((uint64_t)aBlock);
      _os_log_impl(&dword_23DB9B000, v22, v23, "[%s]_%s: Proxy is unrecognized type: %s", (uint8_t *)v24, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x24263D18C](v25, -1, -1);
      MEMORY[0x24263D18C](v24, -1, -1);

      (*(void (**)(char *, uint64_t))(v30 + 8))(v14, v10);
    }
    else
    {

      __swift_destroy_boxed_opaque_existential_0((uint64_t)aBlock);
      (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v10);
    }
  }
}

uint64_t sub_23DBA0E64(uint64_t a1, uint64_t a2)
{
  char *v2;
  uint64_t ObjectType;
  uint64_t v6;
  uint64_t result;
  void *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  void *v12;
  char *v13;
  id v14;
  void *v15;
  id *v16;
  id v17;
  void *v18;
  id v19;
  void **v20;
  uint64_t aBlock;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id *v27;

  ObjectType = swift_getObjectType();
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = 0;
  v27 = (id *)(v6 + 16);
  result = swift_allocObject();
  *(_QWORD *)(result + 16) = 0;
  v20 = (void **)(result + 16);
  v8 = *(void **)&v2[OBJC_IVAR____TtC28HealthAppHealthDaemonSupport18PinnedContentStore_proxyProvider];
  if (!v8)
    goto LABEL_9;
  v9 = result;
  v10 = (_QWORD *)swift_allocObject();
  v10[2] = v2;
  v10[3] = a1;
  v10[4] = a2;
  v10[5] = v6;
  v10[6] = v9;
  v10[7] = ObjectType;
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = sub_23DBA47A0;
  *(_QWORD *)(v11 + 24) = v10;
  v25 = sub_23DBA51FC;
  v26 = v11;
  aBlock = MEMORY[0x24BDAC760];
  v22 = 1107296256;
  v23 = sub_23DB9EB8C;
  v24 = &block_descriptor_141;
  v12 = _Block_copy(&aBlock);
  v13 = v2;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  v14 = v8;
  swift_release();
  v25 = sub_23DBA4480;
  v26 = v9;
  aBlock = MEMORY[0x24BDAC760];
  v22 = 1107296256;
  v23 = sub_23DB9E630;
  v24 = &block_descriptor_144;
  v15 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v14, sel_getSynchronousProxyWithHandler_errorHandler_, v12, v15);

  _Block_release(v15);
  _Block_release(v12);
  LOBYTE(v15) = swift_isEscapingClosureAtFileLocation();
  result = swift_release();
  if ((v15 & 1) != 0)
  {
    __break(1u);
LABEL_9:
    __break(1u);
    return result;
  }
  v16 = v27;
  swift_beginAccess();
  if (*v16)
  {
    v17 = *v16;
    swift_release();
    swift_release();
    swift_release();
    return (uint64_t)v17;
  }
  else
  {
    swift_beginAccess();
    v18 = *v20;
    if (!*v20)
    {
      sub_23DBA4498();
      swift_allocError();
      v18 = 0;
    }
    v19 = v18;
    swift_willThrow();
    swift_release();
    swift_release();
    return swift_release();
  }
}

void sub_23DBA1154(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _QWORD aBlock[6];
  _QWORD v15[6];

  sub_23DBA4CB4(a1, (uint64_t)aBlock);
  sub_23DBA4CF0();
  if (swift_dynamicCast())
  {
    v9 = (void *)v15[0];
    v10 = (void *)sub_23DBAB2F0();
    v11 = (void *)sub_23DBAB2F0();
    v12 = swift_allocObject();
    *(_QWORD *)(v12 + 16) = a5;
    *(_QWORD *)(v12 + 24) = a6;
    aBlock[4] = sub_23DBA51F4;
    aBlock[5] = v12;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_23DB9E554;
    aBlock[3] = &block_descriptor_250;
    v13 = _Block_copy(aBlock);
    swift_retain();
    swift_retain();
    swift_release();
    objc_msgSend(v9, sel_remote_unpinContentWithIdentifier_inDomain_completion_, v10, v11, v13);
    _Block_release(v13);
    swift_unknownObjectRelease();

  }
  else
  {
    sub_23DBA4CB4(a1, (uint64_t)aBlock);
    v15[0] = 0;
    v15[1] = 0xE000000000000000;
    sub_23DBAB47C();
    swift_bridgeObjectRelease();
    v15[4] = 91;
    v15[5] = 0xE100000000000000;
    sub_23DBAB5A8();
    sub_23DBAB320();
    swift_bridgeObjectRelease();
    sub_23DBAB320();
    sub_23DBAB320();
    sub_23DBAB320();
    sub_23DBA4CB4((uint64_t)aBlock, (uint64_t)v15);
    sub_23DBAB308();
    sub_23DBAB320();
    swift_bridgeObjectRelease();
    sub_23DBAB4F4();
    __break(1u);
  }
}

void sub_23DBA13AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  char *v5;
  uint64_t ObjectType;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  void *v24;
  id v25;
  char *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t (*v33)();
  _QWORD *v34;

  ObjectType = swift_getObjectType();
  v12 = OBJC_IVAR____TtC28HealthAppHealthDaemonSupport18PinnedContentStore_proxyProvider;
  v13 = *(void **)&v5[OBJC_IVAR____TtC28HealthAppHealthDaemonSupport18PinnedContentStore_proxyProvider];
  if (v13)
  {
    v14 = ObjectType;
    v15 = swift_allocObject();
    *(_QWORD *)(v15 + 16) = a4;
    *(_QWORD *)(v15 + 24) = a5;
    v33 = (uint64_t (*)())sub_23DBA47D0;
    v34 = (_QWORD *)v15;
    v29 = MEMORY[0x24BDAC760];
    v30 = 1107296256;
    v31 = sub_23DB9E100;
    v32 = &block_descriptor_150;
    v16 = _Block_copy(&v29);
    swift_retain();
    v17 = v13;
    swift_release();
    v18 = objc_msgSend(v17, sel_clientQueueObjectHandlerWithCompletion_, v16);
    _Block_release(v16);

    v19 = swift_allocObject();
    *(_QWORD *)(v19 + 16) = v18;
    v20 = *(void **)&v5[v12];
    if (v20)
    {
      v21 = v19;
      v22 = (_QWORD *)swift_allocObject();
      v22[2] = v5;
      v22[3] = a1;
      v22[4] = a2;
      v22[5] = a3;
      v22[6] = sub_23DBA5064;
      v22[7] = v21;
      v22[8] = v14;
      v33 = (uint64_t (*)())sub_23DBA481C;
      v34 = v22;
      v23 = MEMORY[0x24BDAC760];
      v29 = MEMORY[0x24BDAC760];
      v30 = 1107296256;
      v31 = sub_23DB9E5C8;
      v32 = &block_descriptor_160;
      v24 = _Block_copy(&v29);
      v25 = v20;
      v26 = v5;
      swift_bridgeObjectRetain();
      swift_retain();
      swift_release();
      v27 = swift_allocObject();
      *(_QWORD *)(v27 + 16) = sub_23DBA5064;
      *(_QWORD *)(v27 + 24) = v21;
      v33 = sub_23DBA4760;
      v34 = (_QWORD *)v27;
      v29 = v23;
      v30 = 1107296256;
      v31 = sub_23DB9E630;
      v32 = &block_descriptor_166;
      v28 = _Block_copy(&v29);
      swift_retain();
      swift_release();
      objc_msgSend(v25, sel_fetchProxyWithHandler_errorHandler_, v24, v28);
      _Block_release(v28);
      _Block_release(v24);
      swift_release();

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

void sub_23DBA1618(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  id v22;
  NSObject *v23;
  os_log_type_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  _QWORD aBlock[6];
  uint64_t v34[4];
  uint64_t v35;

  v32 = a6;
  v10 = sub_23DBAB0EC();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10, v12);
  v14 = (char *)&aBlock[-1] - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DBA4CB4(a1, (uint64_t)aBlock);
  sub_23DBA4CF0();
  if ((swift_dynamicCast() & 1) != 0)
  {
    v15 = (void *)v34[0];
    v16 = (void *)sub_23DBAB2F0();
    v17 = (void *)sub_23DBAB2F0();
    sub_23DBA4ED4(0, &qword_256CE8B18);
    v18 = (void *)sub_23DBAB404();
    v19 = swift_allocObject();
    *(_QWORD *)(v19 + 16) = v32;
    *(_QWORD *)(v19 + 24) = a7;
    aBlock[4] = sub_23DBA51F8;
    aBlock[5] = v19;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_23DB9E554;
    aBlock[3] = &block_descriptor_244;
    v20 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v15, sel_remote_movePinnedContentWithIdentifier_inDomain_toIndex_completion_, v16, v17, v18, v20);
    _Block_release(v20);
    swift_unknownObjectRelease();

  }
  else
  {
    if (qword_25431E100 != -1)
      swift_once();
    v21 = __swift_project_value_buffer(v10, (uint64_t)qword_25431E160);
    (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v14, v21, v10);
    sub_23DBA4CB4(a1, (uint64_t)aBlock);
    v22 = a2;
    v23 = sub_23DBAB0D4();
    v24 = sub_23DBAB3EC();
    if (os_log_type_enabled(v23, v24))
    {
      v25 = swift_slowAlloc();
      v32 = v11;
      v26 = v25;
      v27 = swift_slowAlloc();
      v35 = v27;
      *(_DWORD *)v26 = 136315650;
      v28 = sub_23DBAB5A8();
      v34[0] = sub_23DBA8734(v28, v29, &v35);
      sub_23DBAB41C();
      swift_bridgeObjectRelease();
      *(_WORD *)(v26 + 12) = 2080;
      v34[0] = sub_23DBA8734(0x7972616D6D7573, 0xE700000000000000, &v35);
      sub_23DBAB41C();

      *(_WORD *)(v26 + 22) = 2080;
      sub_23DBA4CB4((uint64_t)aBlock, (uint64_t)v34);
      v30 = sub_23DBAB308();
      v34[0] = sub_23DBA8734(v30, v31, &v35);
      sub_23DBAB41C();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_0((uint64_t)aBlock);
      _os_log_impl(&dword_23DB9B000, v23, v24, "[%s]_%s: Proxy is unrecognized type: %s", (uint8_t *)v26, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x24263D18C](v27, -1, -1);
      MEMORY[0x24263D18C](v26, -1, -1);

      (*(void (**)(char *, uint64_t))(v32 + 8))(v14, v10);
    }
    else
    {

      __swift_destroy_boxed_opaque_existential_0((uint64_t)aBlock);
      (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v10);
    }
  }
}

uint64_t sub_23DBA1A28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char *v3;
  void *v4;
  uint64_t ObjectType;
  uint64_t v9;
  uint64_t result;
  void *v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void **v22;
  id *v23;
  uint64_t aBlock;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;

  v4 = v3;
  ObjectType = swift_getObjectType();
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = 0;
  v23 = (id *)(v9 + 16);
  result = swift_allocObject();
  *(_QWORD *)(result + 16) = 0;
  v22 = (void **)(result + 16);
  v11 = *(void **)&v3[OBJC_IVAR____TtC28HealthAppHealthDaemonSupport18PinnedContentStore_proxyProvider];
  if (!v11)
    goto LABEL_9;
  v12 = result;
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = v4;
  v13[3] = a1;
  v13[4] = a2;
  v13[5] = a3;
  v13[6] = v9;
  v13[7] = v12;
  v13[8] = ObjectType;
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = sub_23DBA4864;
  *(_QWORD *)(v14 + 24) = v13;
  v28 = sub_23DBA51FC;
  v29 = v14;
  aBlock = MEMORY[0x24BDAC760];
  v25 = 1107296256;
  v26 = sub_23DB9EB8C;
  v27 = &block_descriptor_178;
  v15 = _Block_copy(&aBlock);
  v16 = v4;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  v17 = v11;
  swift_release();
  v28 = sub_23DBA4480;
  v29 = v12;
  aBlock = MEMORY[0x24BDAC760];
  v25 = 1107296256;
  v26 = sub_23DB9E630;
  v27 = &block_descriptor_181;
  v18 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v17, sel_getSynchronousProxyWithHandler_errorHandler_, v15, v18);

  _Block_release(v18);
  _Block_release(v15);
  LOBYTE(v18) = swift_isEscapingClosureAtFileLocation();
  result = swift_release();
  if ((v18 & 1) != 0)
  {
    __break(1u);
LABEL_9:
    __break(1u);
    return result;
  }
  swift_beginAccess();
  if (*v23)
  {
    v19 = *v23;
    swift_release();
    swift_release();
    swift_release();
    return (uint64_t)v19;
  }
  else
  {
    swift_beginAccess();
    v20 = *v22;
    if (!*v22)
    {
      sub_23DBA4498();
      swift_allocError();
      v20 = 0;
    }
    v21 = v20;
    swift_willThrow();
    swift_release();
    swift_release();
    return swift_release();
  }
}

void sub_23DBA1D24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD aBlock[6];
  _QWORD v17[6];

  sub_23DBA4CB4(a1, (uint64_t)aBlock);
  sub_23DBA4CF0();
  if (swift_dynamicCast())
  {
    v10 = (void *)v17[0];
    v11 = (void *)sub_23DBAB2F0();
    v12 = (void *)sub_23DBAB2F0();
    sub_23DBA4ED4(0, &qword_256CE8B18);
    v13 = (void *)sub_23DBAB404();
    v14 = swift_allocObject();
    *(_QWORD *)(v14 + 16) = a6;
    *(_QWORD *)(v14 + 24) = a7;
    aBlock[4] = sub_23DBA51F4;
    aBlock[5] = v14;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_23DB9E554;
    aBlock[3] = &block_descriptor_237;
    v15 = _Block_copy(aBlock);
    swift_retain();
    swift_retain();
    swift_release();
    objc_msgSend(v10, sel_remote_movePinnedContentWithIdentifier_inDomain_toIndex_completion_, v11, v12, v13, v15);
    _Block_release(v15);
    swift_unknownObjectRelease();

  }
  else
  {
    sub_23DBA4CB4(a1, (uint64_t)aBlock);
    v17[0] = 0;
    v17[1] = 0xE000000000000000;
    sub_23DBAB47C();
    swift_bridgeObjectRelease();
    v17[4] = 91;
    v17[5] = 0xE100000000000000;
    sub_23DBAB5A8();
    sub_23DBAB320();
    swift_bridgeObjectRelease();
    sub_23DBAB320();
    sub_23DBAB320();
    sub_23DBAB320();
    sub_23DBA4CB4((uint64_t)aBlock, (uint64_t)v17);
    sub_23DBAB308();
    sub_23DBAB320();
    swift_bridgeObjectRelease();
    sub_23DBAB4F4();
    __break(1u);
  }
}

void sub_23DBA1FB4(uint64_t a1, uint64_t a2)
{
  char *v2;
  uint64_t ObjectType;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  _QWORD *v17;
  void *v18;
  id v19;
  char *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void (*v27)(uint64_t);
  _QWORD *v28;

  ObjectType = swift_getObjectType();
  v6 = OBJC_IVAR____TtC28HealthAppHealthDaemonSupport18PinnedContentStore_proxyProvider;
  v7 = *(void **)&v2[OBJC_IVAR____TtC28HealthAppHealthDaemonSupport18PinnedContentStore_proxyProvider];
  if (v7)
  {
    v8 = ObjectType;
    v9 = swift_allocObject();
    *(_QWORD *)(v9 + 16) = a1;
    *(_QWORD *)(v9 + 24) = a2;
    v27 = (void (*)(uint64_t))sub_23DBA51F0;
    v28 = (_QWORD *)v9;
    v10 = MEMORY[0x24BDAC760];
    v23 = MEMORY[0x24BDAC760];
    v24 = 1107296256;
    v25 = sub_23DB9E100;
    v26 = &block_descriptor_187;
    v11 = _Block_copy(&v23);
    swift_retain();
    v12 = v7;
    swift_release();
    v13 = objc_msgSend(v12, sel_clientQueueObjectHandlerWithCompletion_, v11);
    _Block_release(v11);

    v14 = swift_allocObject();
    *(_QWORD *)(v14 + 16) = v13;
    v15 = *(void **)&v2[v6];
    if (v15)
    {
      v16 = v14;
      v17 = (_QWORD *)swift_allocObject();
      v17[2] = v2;
      v17[3] = sub_23DBA5064;
      v17[4] = v16;
      v17[5] = v8;
      v27 = sub_23DBA48C8;
      v28 = v17;
      v23 = v10;
      v24 = 1107296256;
      v25 = sub_23DB9E5C8;
      v26 = &block_descriptor_197;
      v18 = _Block_copy(&v23);
      v19 = v15;
      v20 = v2;
      swift_retain();
      swift_release();
      v21 = swift_allocObject();
      *(_QWORD *)(v21 + 16) = sub_23DBA5064;
      *(_QWORD *)(v21 + 24) = v16;
      v27 = (void (*)(uint64_t))sub_23DBA4760;
      v28 = (_QWORD *)v21;
      v23 = v10;
      v24 = 1107296256;
      v25 = sub_23DB9E630;
      v26 = &block_descriptor_203;
      v22 = _Block_copy(&v23);
      swift_retain();
      swift_release();
      objc_msgSend(v19, sel_fetchProxyWithHandler_errorHandler_, v18, v22);
      _Block_release(v22);
      _Block_release(v18);
      swift_release();

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

void sub_23DBA21F4(uint64_t a1, void *a2, void (*a3)(void *, uint64_t))
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  _BYTE v9[24];
  uint64_t v10;

  sub_23DBA4D50(a1, (uint64_t)v9);
  if (v10)
  {
    type metadata accessor for PinnedContentState();
    if ((swift_dynamicCast() & 1) != 0)
    {
      v5 = v8;
      a3(v8, 0);

      return;
    }
  }
  else
  {
    sub_23DBA4F0C((uint64_t)v9, (unint64_t *)&qword_256CE8B10, MEMORY[0x24BEE4AD8] + 8);
  }
  if (a2)
  {
    v6 = a2;
  }
  else
  {
    sub_23DBA4498();
    v6 = (void *)swift_allocError();
  }
  v7 = a2;
  a3(v6, 1);

}

void sub_23DBA22EC(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  os_log_type_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  _QWORD aBlock[6];
  uint64_t v29[4];
  uint64_t v30;

  v8 = sub_23DBAB0EC();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8, v10);
  v12 = (char *)&aBlock[-1] - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DBA4CB4(a1, (uint64_t)aBlock);
  sub_23DBA4CF0();
  if ((swift_dynamicCast() & 1) != 0)
  {
    v13 = (void *)v29[0];
    v14 = (void *)sub_23DBAB2F0();
    v15 = swift_allocObject();
    *(_QWORD *)(v15 + 16) = a3;
    *(_QWORD *)(v15 + 24) = a4;
    aBlock[4] = sub_23DBA4D48;
    aBlock[5] = v15;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_23DB9E554;
    aBlock[3] = &block_descriptor_231;
    v16 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    objc_msgSend(v13, sel_remote_unpinAllContentInDomain_withCompletion_, v14, v16);
    _Block_release(v16);
    swift_unknownObjectRelease();

  }
  else
  {
    if (qword_25431E100 != -1)
      swift_once();
    v17 = __swift_project_value_buffer(v8, (uint64_t)qword_25431E160);
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v12, v17, v8);
    sub_23DBA4CB4(a1, (uint64_t)aBlock);
    v18 = a2;
    v19 = sub_23DBAB0D4();
    v20 = sub_23DBAB3EC();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = swift_slowAlloc();
      v22 = swift_slowAlloc();
      v30 = v22;
      *(_DWORD *)v21 = 136315650;
      v27 = v9;
      v23 = sub_23DBAB5A8();
      v29[0] = sub_23DBA8734(v23, v24, &v30);
      sub_23DBAB41C();
      swift_bridgeObjectRelease();
      *(_WORD *)(v21 + 12) = 2080;
      v29[0] = sub_23DBA8734(0x7972616D6D7573, 0xE700000000000000, &v30);
      sub_23DBAB41C();

      *(_WORD *)(v21 + 22) = 2080;
      sub_23DBA4CB4((uint64_t)aBlock, (uint64_t)v29);
      v25 = sub_23DBAB308();
      v29[0] = sub_23DBA8734(v25, v26, &v30);
      sub_23DBAB41C();
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_0((uint64_t)aBlock);
      _os_log_impl(&dword_23DB9B000, v19, v20, "[%s]_%s: Proxy is unrecognized type: %s", (uint8_t *)v21, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x24263D18C](v22, -1, -1);
      MEMORY[0x24263D18C](v21, -1, -1);

      (*(void (**)(char *, uint64_t))(v27 + 8))(v12, v8);
    }
    else
    {

      __swift_destroy_boxed_opaque_existential_0((uint64_t)aBlock);
      (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
    }
  }
}

uint64_t sub_23DBA26A0()
{
  char *v0;
  void *v1;
  uint64_t ObjectType;
  uint64_t v3;
  id *v4;
  uint64_t result;
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void **v17;
  uint64_t aBlock;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;

  v1 = v0;
  ObjectType = swift_getObjectType();
  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = 0;
  v4 = (id *)(v3 + 16);
  result = swift_allocObject();
  *(_QWORD *)(result + 16) = 0;
  v17 = (void **)(result + 16);
  v6 = *(void **)&v0[OBJC_IVAR____TtC28HealthAppHealthDaemonSupport18PinnedContentStore_proxyProvider];
  if (!v6)
    goto LABEL_9;
  v7 = result;
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = v1;
  v8[3] = v3;
  v8[4] = v7;
  v8[5] = ObjectType;
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = sub_23DBA4934;
  *(_QWORD *)(v9 + 24) = v8;
  v22 = sub_23DBA51FC;
  v23 = v9;
  aBlock = MEMORY[0x24BDAC760];
  v19 = 1107296256;
  v20 = sub_23DB9EB8C;
  v21 = &block_descriptor_215;
  v10 = _Block_copy(&aBlock);
  v11 = v1;
  swift_retain();
  swift_retain();
  swift_retain();
  v12 = v6;
  swift_release();
  v22 = sub_23DBA4480;
  v23 = v7;
  aBlock = MEMORY[0x24BDAC760];
  v19 = 1107296256;
  v20 = sub_23DB9E630;
  v21 = &block_descriptor_218;
  v13 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v12, sel_getSynchronousProxyWithHandler_errorHandler_, v10, v13);

  _Block_release(v13);
  _Block_release(v10);
  LOBYTE(v13) = swift_isEscapingClosureAtFileLocation();
  result = swift_release();
  if ((v13 & 1) != 0)
  {
    __break(1u);
LABEL_9:
    __break(1u);
    return result;
  }
  swift_beginAccess();
  if (*v4)
  {
    v14 = *v4;
    swift_release();
    swift_release();
    swift_release();
    return (uint64_t)v14;
  }
  else
  {
    swift_beginAccess();
    v15 = *v17;
    if (!*v17)
    {
      sub_23DBA4498();
      swift_allocError();
      v15 = 0;
    }
    v16 = v15;
    swift_willThrow();
    swift_release();
    swift_release();
    return swift_release();
  }
}

void sub_23DBA297C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD aBlock[6];
  _QWORD v12[6];

  sub_23DBA4CB4(a1, (uint64_t)aBlock);
  sub_23DBA4CF0();
  if (swift_dynamicCast())
  {
    v7 = (void *)v12[0];
    v8 = (void *)sub_23DBAB2F0();
    v9 = swift_allocObject();
    *(_QWORD *)(v9 + 16) = a3;
    *(_QWORD *)(v9 + 24) = a4;
    aBlock[4] = sub_23DBA51F4;
    aBlock[5] = v9;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_23DB9E554;
    aBlock[3] = &block_descriptor_225;
    v10 = _Block_copy(aBlock);
    swift_retain();
    swift_retain();
    swift_release();
    objc_msgSend(v7, sel_remote_unpinAllContentInDomain_withCompletion_, v8, v10);
    _Block_release(v10);
    swift_unknownObjectRelease();

  }
  else
  {
    sub_23DBA4CB4(a1, (uint64_t)aBlock);
    v12[0] = 0;
    v12[1] = 0xE000000000000000;
    sub_23DBAB47C();
    swift_bridgeObjectRelease();
    v12[4] = 91;
    v12[5] = 0xE100000000000000;
    sub_23DBAB5A8();
    sub_23DBAB320();
    swift_bridgeObjectRelease();
    sub_23DBAB320();
    sub_23DBAB320();
    sub_23DBAB320();
    sub_23DBA4CB4((uint64_t)aBlock, (uint64_t)v12);
    sub_23DBAB308();
    sub_23DBAB320();
    swift_bridgeObjectRelease();
    sub_23DBAB4F4();
    __break(1u);
  }
}

void sub_23DBA2BAC(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v8;
  id v9;
  void *v10;
  id v11;

  swift_beginAccess();
  v8 = *(void **)(a3 + 16);
  *(_QWORD *)(a3 + 16) = a1;
  v9 = a1;

  swift_beginAccess();
  v10 = *(void **)(a4 + 16);
  *(_QWORD *)(a4 + 16) = a2;
  v11 = a2;

}

id sub_23DBA2C40(void *a1, uint64_t a2)
{
  void *v4;

  swift_beginAccess();
  v4 = *(void **)(a2 + 16);
  *(_QWORD *)(a2 + 16) = a1;

  return a1;
}

id sub_23DBA2C90()
{
  return objc_msgSend((id)objc_opt_self(), sel_interfaceWithProtocol_, &unk_256CEB3A0);
}

id PinnedContentStore.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void PinnedContentStore.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id PinnedContentStore.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PinnedContentStore();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_23DBA2E14(uint64_t a1, uint64_t a2)
{
  sub_23DB9DEA8(a1, a2);
}

uint64_t sub_23DBA2E34()
{
  return sub_23DB9E680();
}

void sub_23DBA2E54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_23DB9EBE4(a1, a2, a3);
}

uint64_t sub_23DBA2E74(uint64_t a1)
{
  return sub_23DB9F228(a1);
}

void sub_23DBA2E94(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6)
{
  sub_23DB9F8F8(a1, a2, a3, a4 & 1, a5, a6);
}

uint64_t sub_23DBA2EB8(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  return sub_23DBA0284(a1, a2, a3, a4 & 1);
}

void sub_23DBA2EDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_23DBA0834(a1, a2, a3, a4);
}

uint64_t sub_23DBA2EFC(uint64_t a1, uint64_t a2)
{
  return sub_23DBA0E64(a1, a2);
}

void sub_23DBA2F1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  sub_23DBA13AC(a1, a2, a3, a4, a5);
}

uint64_t sub_23DBA2F3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_23DBA1A28(a1, a2, a3);
}

void sub_23DBA2F5C(uint64_t a1, uint64_t a2)
{
  sub_23DBA1FB4(a1, a2);
}

uint64_t sub_23DBA2F7C()
{
  return sub_23DBA26A0();
}

unint64_t PinnedContentDomain.darwinNotificationName.getter()
{
  return 0xD00000000000002FLL;
}

uint64_t static PinnedContentStore.Failure.== infix(_:_:)()
{
  return 1;
}

uint64_t PinnedContentStore.Failure.hash(into:)()
{
  return sub_23DBAB590();
}

uint64_t PinnedContentStore.Failure.hashValue.getter()
{
  sub_23DBAB584();
  sub_23DBAB590();
  return sub_23DBAB59C();
}

uint64_t sub_23DBA3024()
{
  return 1;
}

uint64_t sub_23DBA302C()
{
  sub_23DBAB584();
  sub_23DBAB590();
  return sub_23DBAB59C();
}

uint64_t sub_23DBA306C()
{
  return sub_23DBAB590();
}

uint64_t sub_23DBA3090()
{
  sub_23DBAB584();
  sub_23DBAB590();
  return sub_23DBAB59C();
}

_QWORD *sub_23DBA30DC(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      sub_23DBA5020(0, (unint64_t *)&unk_25431E088, MEMORY[0x24BEE0D00], MEMORY[0x24BEE3598]);
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
    sub_23DBA3D28(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_23DBA31FC(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      sub_23DBA5020(0, &qword_25431E158, MEMORY[0x24BEE23D0], MEMORY[0x24BEE3598]);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
      v12 = v10 + 4;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[5 * v8 + 4])
          memmove(v12, a4 + 4, 40 * v8);
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
    sub_23DBA3EA0(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_23DBA3330(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  char v11;
  char isUniquelyReferenced_nonNull_native;
  __int128 v13;
  uint64_t v15;
  _BYTE v16[40];

  v3 = v2;
  v6 = *v2;
  swift_bridgeObjectRetain();
  v7 = sub_23DBAB440();
  v8 = -1 << *(_BYTE *)(v6 + 32);
  v9 = v7 & ~v8;
  if (((*(_QWORD *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFF8)) >> v9) & 1) != 0)
  {
    v10 = ~v8;
    while (1)
    {
      sub_23DBA4F54(*(_QWORD *)(v6 + 48) + 40 * v9, (uint64_t)v16);
      v11 = MEMORY[0x24263CCD0](v16, a2);
      sub_23DBA4F90((uint64_t)v16);
      if ((v11 & 1) != 0)
        break;
      v9 = (v9 + 1) & v10;
      if (((*(_QWORD *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFF8)) >> v9) & 1) == 0)
        goto LABEL_5;
    }
    swift_bridgeObjectRelease();
    sub_23DBA4F90(a2);
    sub_23DBA4F54(*(_QWORD *)(*v3 + 48) + 40 * v9, a1);
    return 0;
  }
  else
  {
LABEL_5:
    swift_bridgeObjectRelease();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_23DBA4F54(a2, (uint64_t)v16);
    v15 = *v3;
    *v3 = 0x8000000000000000;
    sub_23DBA376C((uint64_t)v16, v9, isUniquelyReferenced_nonNull_native);
    *v3 = v15;
    swift_bridgeObjectRelease();
    v13 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v13;
    *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
    return 1;
  }
}

uint64_t sub_23DBA34A8()
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
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;

  v1 = v0;
  v2 = *v0;
  sub_23DBA4FC4();
  v3 = sub_23DBAB464();
  v4 = v3;
  if (*(_QWORD *)(v2 + 16))
  {
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
        v15 = __clz(__rbit64(v8));
        v8 &= v8 - 1;
        v16 = v15 | (v12 << 6);
      }
      else
      {
        v17 = v12 + 1;
        if (__OFADD__(v12, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v17 >= v9)
          goto LABEL_33;
        v18 = v6[v17];
        ++v12;
        if (!v18)
        {
          v12 = v17 + 1;
          if (v17 + 1 >= v9)
            goto LABEL_33;
          v18 = v6[v12];
          if (!v18)
          {
            v12 = v17 + 2;
            if (v17 + 2 >= v9)
              goto LABEL_33;
            v18 = v6[v12];
            if (!v18)
            {
              v19 = v17 + 3;
              if (v19 >= v9)
              {
LABEL_33:
                swift_release();
                v1 = v0;
                v28 = 1 << *(_BYTE *)(v2 + 32);
                if (v28 > 63)
                  bzero((void *)(v2 + 56), ((unint64_t)(v28 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v6 = -1 << v28;
                *(_QWORD *)(v2 + 16) = 0;
                break;
              }
              v18 = v6[v19];
              if (!v18)
              {
                while (1)
                {
                  v12 = v19 + 1;
                  if (__OFADD__(v19, 1))
                    goto LABEL_39;
                  if (v12 >= v9)
                    goto LABEL_33;
                  v18 = v6[v12];
                  ++v19;
                  if (v18)
                    goto LABEL_23;
                }
              }
              v12 = v19;
            }
          }
        }
LABEL_23:
        v8 = (v18 - 1) & v18;
        v16 = __clz(__rbit64(v18)) + (v12 << 6);
      }
      v20 = *(_QWORD *)(v2 + 48) + 40 * v16;
      v29 = *(_OWORD *)v20;
      v30 = *(_OWORD *)(v20 + 16);
      v31 = *(_QWORD *)(v20 + 32);
      result = sub_23DBAB440();
      v21 = -1 << *(_BYTE *)(v4 + 32);
      v22 = result & ~v21;
      v23 = v22 >> 6;
      if (((-1 << v22) & ~*(_QWORD *)(v10 + 8 * (v22 >> 6))) != 0)
      {
        v13 = __clz(__rbit64((-1 << v22) & ~*(_QWORD *)(v10 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v24 = 0;
        v25 = (unint64_t)(63 - v21) >> 6;
        do
        {
          if (++v23 == v25 && (v24 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v26 = v23 == v25;
          if (v23 == v25)
            v23 = 0;
          v24 |= v26;
          v27 = *(_QWORD *)(v10 + 8 * v23);
        }
        while (v27 == -1);
        v13 = __clz(__rbit64(~v27)) + (v23 << 6);
      }
      *(_QWORD *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      v14 = *(_QWORD *)(v4 + 48) + 40 * v13;
      *(_OWORD *)v14 = v29;
      *(_OWORD *)(v14 + 16) = v30;
      *(_QWORD *)(v14 + 32) = v31;
      ++*(_QWORD *)(v4 + 16);
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

uint64_t sub_23DBA376C(uint64_t result, unint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;
  _BYTE v19[40];

  v4 = v3;
  v6 = result;
  v7 = *(_QWORD *)(*v3 + 16);
  v8 = *(_QWORD *)(*v3 + 24);
  if (v8 > v7 && (a3 & 1) != 0)
    goto LABEL_12;
  if ((a3 & 1) != 0)
  {
    sub_23DBA34A8();
  }
  else
  {
    if (v8 > v7)
    {
      result = (uint64_t)sub_23DBA38D4();
      goto LABEL_12;
    }
    sub_23DBA3A9C();
  }
  v9 = *v3;
  result = sub_23DBAB440();
  v10 = -1 << *(_BYTE *)(v9 + 32);
  a2 = result & ~v10;
  if (((*(_QWORD *)(v9 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v11 = ~v10;
    do
    {
      sub_23DBA4F54(*(_QWORD *)(v9 + 48) + 40 * a2, (uint64_t)v19);
      v12 = MEMORY[0x24263CCD0](v19, v6);
      result = sub_23DBA4F90((uint64_t)v19);
      if ((v12 & 1) != 0)
        goto LABEL_15;
      a2 = (a2 + 1) & v11;
    }
    while (((*(_QWORD *)(v9 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_12:
  v13 = *v4;
  *(_QWORD *)(*v4 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  v14 = *(_QWORD *)(v13 + 48) + 40 * a2;
  v15 = *(_OWORD *)(v6 + 16);
  *(_OWORD *)v14 = *(_OWORD *)v6;
  *(_OWORD *)(v14 + 16) = v15;
  *(_QWORD *)(v14 + 32) = *(_QWORD *)(v6 + 32);
  v16 = *(_QWORD *)(v13 + 16);
  v17 = __OFADD__(v16, 1);
  v18 = v16 + 1;
  if (!v17)
  {
    *(_QWORD *)(v13 + 16) = v18;
    return result;
  }
  __break(1u);
LABEL_15:
  result = sub_23DBAB548();
  __break(1u);
  return result;
}

void *sub_23DBA38D4()
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
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  _OWORD v23[2];
  uint64_t v24;

  v1 = v0;
  sub_23DBA4FC4();
  v2 = *v0;
  v3 = sub_23DBAB458();
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
    v16 = 40 * v15;
    result = (void *)sub_23DBA4F54(*(_QWORD *)(v2 + 48) + 40 * v15, (uint64_t)v23);
    v17 = *(_QWORD *)(v4 + 48) + v16;
    v18 = v23[0];
    v19 = v23[1];
    *(_QWORD *)(v17 + 32) = v24;
    *(_OWORD *)v17 = v18;
    *(_OWORD *)(v17 + 16) = v19;
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

uint64_t sub_23DBA3A9C()
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
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  unint64_t v17;
  unint64_t v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  _OWORD v29[2];
  uint64_t v30;

  v1 = v0;
  v2 = *v0;
  sub_23DBA4FC4();
  v3 = sub_23DBAB464();
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
  v9 = (unint64_t)(v5 + 63) >> 6;
  v10 = v3 + 56;
  result = swift_retain();
  v12 = 0;
  while (1)
  {
    if (v8)
    {
      v17 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      v18 = v17 | (v12 << 6);
      goto LABEL_24;
    }
    v19 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v19 >= v9)
      goto LABEL_33;
    v20 = *(_QWORD *)(v6 + 8 * v19);
    ++v12;
    if (!v20)
    {
      v12 = v19 + 1;
      if (v19 + 1 >= v9)
        goto LABEL_33;
      v20 = *(_QWORD *)(v6 + 8 * v12);
      if (!v20)
      {
        v12 = v19 + 2;
        if (v19 + 2 >= v9)
          goto LABEL_33;
        v20 = *(_QWORD *)(v6 + 8 * v12);
        if (!v20)
          break;
      }
    }
LABEL_23:
    v8 = (v20 - 1) & v20;
    v18 = __clz(__rbit64(v20)) + (v12 << 6);
LABEL_24:
    sub_23DBA4F54(*(_QWORD *)(v2 + 48) + 40 * v18, (uint64_t)v29);
    result = sub_23DBAB440();
    v22 = -1 << *(_BYTE *)(v4 + 32);
    v23 = result & ~v22;
    v24 = v23 >> 6;
    if (((-1 << v23) & ~*(_QWORD *)(v10 + 8 * (v23 >> 6))) != 0)
    {
      v13 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v10 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
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
        v28 = *(_QWORD *)(v10 + 8 * v24);
      }
      while (v28 == -1);
      v13 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(_QWORD *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
    v14 = *(_QWORD *)(v4 + 48) + 40 * v13;
    v15 = v29[0];
    v16 = v29[1];
    *(_QWORD *)(v14 + 32) = v30;
    *(_OWORD *)v14 = v15;
    *(_OWORD *)(v14 + 16) = v16;
    ++*(_QWORD *)(v4 + 16);
  }
  v21 = v19 + 3;
  if (v21 >= v9)
  {
LABEL_33:
    result = swift_release_n();
    v1 = v0;
    goto LABEL_35;
  }
  v20 = *(_QWORD *)(v6 + 8 * v21);
  if (v20)
  {
    v12 = v21;
    goto LABEL_23;
  }
  while (1)
  {
    v12 = v21 + 1;
    if (__OFADD__(v21, 1))
      break;
    if (v12 >= v9)
      goto LABEL_33;
    v20 = *(_QWORD *)(v6 + 8 * v12);
    ++v21;
    if (v20)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_23DBA3D28(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  result = sub_23DBAB50C();
  __break(1u);
  return result;
}

uint64_t sub_23DBA3E18(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  _BYTE v5[40];
  _BYTE v6[40];
  uint64_t v7;

  v2 = *(_QWORD *)(a1 + 16);
  result = sub_23DBAB3A4();
  v7 = result;
  if (v2)
  {
    v4 = a1 + 32;
    do
    {
      sub_23DBA4F54(v4, (uint64_t)v5);
      sub_23DBA3330((uint64_t)v6, (uint64_t)v5);
      sub_23DBA4F90((uint64_t)v6);
      v4 += 40;
      --v2;
    }
    while (v2);
    return v7;
  }
  return result;
}

uint64_t sub_23DBA3EA0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_23DBAB50C();
  __break(1u);
  return result;
}

uint64_t _s09HealthAppA13DaemonSupport18PinnedContentStoreC15serverInterfaceSo14NSXPCInterfaceCvgZ_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  _QWORD *v10;
  void *v11;
  id v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v12 = objc_msgSend((id)objc_opt_self(), sel_interfaceWithProtocol_, &unk_256CEB340);
  sub_23DBA4ED4(0, (unint64_t *)&unk_25431E0E0);
  *(_QWORD *)&v16 = MEMORY[0x24BEE4AF8];
  MEMORY[0x24263CBC8]();
  if (*(_QWORD *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    sub_23DBAB374();
  sub_23DBA4ED4(0, (unint64_t *)&qword_25431E0F0);
  swift_getObjCClassFromMetadata();
  sub_23DBAB380();
  v0 = sub_23DBAB368();
  MEMORY[0x24263CBC8](v0);
  if (*(_QWORD *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    sub_23DBAB374();
  type metadata accessor for CodablePinnedContentDifference();
  swift_getObjCClassFromMetadata();
  sub_23DBAB380();
  v1 = sub_23DBAB368();
  MEMORY[0x24263CBC8](v1);
  if (*(_QWORD *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    sub_23DBAB374();
  type metadata accessor for PinnedContentState();
  swift_getObjCClassFromMetadata();
  sub_23DBAB380();
  v2 = sub_23DBAB368();
  MEMORY[0x24263CBC8](v2);
  if (*(_QWORD *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    sub_23DBAB374();
  swift_getObjCClassFromMetadata();
  sub_23DBAB380();
  sub_23DBAB368();
  if (!((unint64_t)v16 >> 62))
  {
    v3 = *(_QWORD *)((v16 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v3)
      goto LABEL_11;
LABEL_24:
    v6 = (_QWORD *)MEMORY[0x24BEE4AF8];
LABEL_25:
    swift_bridgeObjectRelease_n();
    sub_23DBA3E18((uint64_t)v6);
    swift_bridgeObjectRelease();
    v11 = (void *)sub_23DBAB398();
    swift_bridgeObjectRelease();
    objc_msgSend(v12, sel_setClasses_forSelector_argumentIndex_ofReply_, v11, sel_remote_applyDifferencesWithDifferences_inDomain_completion_, 0, 0);

    return (uint64_t)v12;
  }
  swift_bridgeObjectRetain();
  result = sub_23DBAB500();
  v3 = result;
  if (!result)
    goto LABEL_24;
LABEL_11:
  if (v3 >= 1)
  {
    v5 = v16 + 32;
    v6 = (_QWORD *)MEMORY[0x24BEE4AF8];
    v7 = MEMORY[0x24BEE23D0];
    do
    {
      swift_unknownObjectRetain_n();
      if ((swift_dynamicCast() & 1) == 0)
      {
        v18 = 0;
        v16 = 0u;
        v17 = 0u;
      }
      swift_unknownObjectRelease();
      if (*((_QWORD *)&v17 + 1))
      {
        v13 = v16;
        v14 = v17;
        v15 = v18;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v6 = sub_23DBA31FC(0, v6[2] + 1, 1, v6);
        v9 = v6[2];
        v8 = v6[3];
        if (v9 >= v8 >> 1)
          v6 = sub_23DBA31FC((_QWORD *)(v8 > 1), v9 + 1, 1, v6);
        v6[2] = v9 + 1;
        v10 = &v6[5 * v9];
        v10[8] = v15;
        *((_OWORD *)v10 + 2) = v13;
        *((_OWORD *)v10 + 3) = v14;
      }
      else
      {
        sub_23DBA4F0C((uint64_t)&v16, (unint64_t *)&unk_256CE8B30, v7);
      }
      v5 += 8;
      --v3;
    }
    while (v3);
    goto LABEL_25;
  }
  __break(1u);
  return result;
}

void sub_23DBA43B8(uint64_t a1, void *a2)
{
  uint64_t v2;

  sub_23DB9FB88(a1, a2, *(void **)(v2 + 16), *(void (**)(id, _QWORD))(v2 + 24), *(_QWORD *)(v2 + 32), *(_QWORD *)(v2 + 40), "[%s]_%s: Proxy returned pinnedContent=%s with error=%s");
}

void sub_23DBA43DC(uint64_t a1, void *a2)
{
  uint64_t v2;

  sub_23DB9E1A0(a1, a2, *(_QWORD *)(v2 + 16));
}

void sub_23DBA43E8(uint64_t a1)
{
  uint64_t *v1;

  sub_23DB9E2A8(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_23DBA43F8()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_23DBA441C()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_23DBA4444(uint64_t a1)
{
  uint64_t *v1;

  sub_23DB9E95C(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_23DBA4450()
{
  return swift_deallocObject();
}

uint64_t sub_23DBA4460()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

id sub_23DBA4480(void *a1)
{
  uint64_t v1;

  return sub_23DBA2C40(a1, v1);
}

unint64_t sub_23DBA4498()
{
  unint64_t result;

  result = qword_256CE8A90;
  if (!qword_256CE8A90)
  {
    result = MEMORY[0x24263D114](&protocol conformance descriptor for PinnedContentStore.Failure, &type metadata for PinnedContentStore.Failure);
    atomic_store(result, (unint64_t *)&qword_256CE8A90);
  }
  return result;
}

uint64_t sub_23DBA44E0()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23DBA4514(uint64_t a1)
{
  return sub_23DBA4568(a1, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_23DB9EE4C);
}

uint64_t sub_23DBA4520()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23DBA455C(uint64_t a1)
{
  return sub_23DBA4568(a1, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_23DB9F514);
}

uint64_t sub_23DBA4568(uint64_t a1, uint64_t (*a2)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  _QWORD *v2;

  return a2(a1, v2[2], v2[3], v2[4], v2[5], v2[6]);
}

uint64_t sub_23DBA457C()
{
  return swift_deallocObject();
}

void sub_23DBA4590(uint64_t a1, void *a2)
{
  uint64_t v2;

  sub_23DB9FB88(a1, a2, *(void **)(v2 + 16), *(void (**)(id, _QWORD))(v2 + 24), *(_QWORD *)(v2 + 32), *(_QWORD *)(v2 + 40), "[%s]_%s: Proxy returned newContent=%s with error=%s");
}

uint64_t sub_23DBA45B4()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23DBA45E8(uint64_t a1)
{
  return sub_23DBA4690(a1, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_23DB9FFEC);
}

uint64_t sub_23DBA45F4(uint64_t a1)
{
  uint64_t v1;
  void (*v2)(_OWORD *, uint64_t);
  _OWORD v4[2];

  v2 = *(void (**)(_OWORD *, uint64_t))(v1 + 16);
  memset(v4, 0, sizeof(v4));
  v2(v4, a1);
  return sub_23DBA4F0C((uint64_t)v4, (unint64_t *)&qword_256CE8B10, MEMORY[0x24BEE4AD8] + 8);
}

uint64_t sub_23DBA4648()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23DBA4684(uint64_t a1)
{
  return sub_23DBA4690(a1, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_23DBA0594);
}

uint64_t sub_23DBA4690(uint64_t a1, uint64_t (*a2)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  uint64_t v2;

  return a2(a1, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32), *(_QWORD *)(v2 + 40), *(unsigned __int8 *)(v2 + 48), *(_QWORD *)(v2 + 56), *(_QWORD *)(v2 + 64), *(_QWORD *)(v2 + 72));
}

uint64_t sub_23DBA46C8()
{
  return swift_deallocObject();
}

uint64_t sub_23DBA46D8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23DBA46FC()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_23DBA4720()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23DBA4754(uint64_t a1)
{
  return sub_23DBA47AC(a1, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_23DBA0A90);
}

uint64_t sub_23DBA4764()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23DBA47A0(uint64_t a1)
{
  return sub_23DBA47AC(a1, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_23DBA1154);
}

uint64_t sub_23DBA47AC(uint64_t a1, uint64_t (*a2)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  _QWORD *v2;

  return a2(a1, v2[2], v2[3], v2[4], v2[5], v2[6], v2[7]);
}

uint64_t sub_23DBA47C0()
{
  return swift_deallocObject();
}

void sub_23DBA47D0(uint64_t a1, void *a2)
{
  uint64_t v2;

  sub_23DBA21F4(a1, a2, *(void (**)(void *, uint64_t))(v2 + 16));
}

uint64_t sub_23DBA47E8()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23DBA481C(uint64_t a1)
{
  return sub_23DBA4870(a1, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_23DBA1618);
}

uint64_t sub_23DBA4828()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_23DBA4864(uint64_t a1)
{
  return sub_23DBA4870(a1, (uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_23DBA1D24);
}

uint64_t sub_23DBA4870(uint64_t a1, uint64_t (*a2)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  _QWORD *v2;

  return a2(a1, v2[2], v2[3], v2[4], v2[5], v2[6], v2[7], v2[8]);
}

uint64_t sub_23DBA4888()
{
  return swift_deallocObject();
}

uint64_t objectdestroyTm()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

void sub_23DBA48C8(uint64_t a1)
{
  uint64_t v1;

  sub_23DBA22EC(a1, *(void **)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32));
}

uint64_t sub_23DBA48D4(uint64_t a1)
{
  uint64_t v1;
  void (*v2)(_BYTE *, uint64_t);
  _BYTE v4[24];
  uint64_t v5;

  v2 = *(void (**)(_BYTE *, uint64_t))(v1 + 16);
  v5 = MEMORY[0x24BEE1328];
  v4[0] = 0;
  v2(v4, a1);
  return sub_23DBA4F0C((uint64_t)v4, (unint64_t *)&qword_256CE8B10, MEMORY[0x24BEE4AD8] + 8);
}

void sub_23DBA4934(uint64_t a1)
{
  uint64_t *v1;

  sub_23DBA297C(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_23DBA4940()
{
  return swift_deallocObject();
}

unint64_t sub_23DBA4954()
{
  unint64_t result;

  result = qword_256CE8A98;
  if (!qword_256CE8A98)
  {
    result = MEMORY[0x24263D114](&protocol conformance descriptor for PinnedContentStore.Failure, &type metadata for PinnedContentStore.Failure);
    atomic_store(result, (unint64_t *)&qword_256CE8A98);
  }
  return result;
}

uint64_t method lookup function for PinnedContentStore()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PinnedContentStore.__allocating_init(healthStore:domain:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t dispatch thunk of PinnedContentStore.fetchPinnedContent(completion:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of PinnedContentStore.fetchPinnedContent()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x90))();
}

uint64_t dispatch thunk of PinnedContentStore.applyDifferences(_:completion:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of PinnedContentStore.applyDifferences(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of PinnedContentStore.pinContentWithIdentifier(_:at:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, _QWORD))((*MEMORY[0x24BEE4EA0] & *v4) + 0xA8))(a1, a2, a3, a4 & 1);
}

uint64_t dispatch thunk of PinnedContentStore.pinContentWithIdentifier(_:at:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, _QWORD))((*MEMORY[0x24BEE4EA0] & *v4) + 0xB0))(a1, a2, a3, a4 & 1);
}

uint64_t dispatch thunk of PinnedContentStore.unpinContentWithIdentifier(_:completion:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of PinnedContentStore.unpinContentWithIdentifier(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of PinnedContentStore.movePinnedContentWithIdentifier(_:to:completion:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of PinnedContentStore.movePinnedContentWithIdentifier(_:to:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of PinnedContentStore.unpinAllContentInDomain(completion:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xD8))();
}

uint64_t dispatch thunk of PinnedContentStore.unpinAllContentInDomain()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xE0))();
}

uint64_t dispatch thunk of PinnedContentStore.exportedInterface()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of PinnedContentStore.remoteInterface()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xF0))();
}

uint64_t dispatch thunk of PinnedContentStore.connectionInvalidated()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xF8))();
}

uint64_t getEnumTagSinglePayload for PinnedContentDomain(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for PinnedContentStore.Failure(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23DBA4C50 + 4 * byte_23DBABB20[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23DBA4C70 + 4 * byte_23DBABB25[v4]))();
}

_BYTE *sub_23DBA4C50(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23DBA4C70(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23DBA4C78(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23DBA4C80(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23DBA4C88(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23DBA4C90(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_23DBA4C9C()
{
  return 0;
}

ValueMetadata *type metadata accessor for PinnedContentStore.Failure()
{
  return &type metadata for PinnedContentStore.Failure;
}

uint64_t sub_23DBA4CB4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_23DBA4CF0()
{
  unint64_t result;

  result = qword_25431E098;
  if (!qword_25431E098)
  {
    result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_25431E098);
  }
  return result;
}

uint64_t sub_23DBA4D48(void *a1, uint64_t a2)
{
  uint64_t v2;

  return sub_23DB9E4D0(a1, a2, *(void (**)(__int128 *, uint64_t))(v2 + 16));
}

uint64_t sub_23DBA4D50(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_23DBA5020(0, (unint64_t *)&qword_256CE8B10, MEMORY[0x24BEE4AD8] + 8, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE1C68]);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_23DBA4DBC(void *a1, void *a2)
{
  uint64_t v2;

  sub_23DBA2BAC(a1, a2, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24));
}

void sub_23DBA4DD4()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256CE8B20)
  {
    sub_23DBA4E28();
    v0 = sub_23DBAB410();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_256CE8B20);
  }
}

unint64_t sub_23DBA4E28()
{
  unint64_t result;

  result = qword_256CE8B28;
  if (!qword_256CE8B28)
  {
    result = swift_getExistentialTypeMetadata();
    atomic_store(result, (unint64_t *)&qword_256CE8B28);
  }
  return result;
}

uint64_t objectdestroy_221Tm()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

_QWORD *__swift_project_boxed_opaque_existential_0(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_23DBA4ED4(uint64_t a1, unint64_t *a2)
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

uint64_t sub_23DBA4F0C(uint64_t a1, unint64_t *a2, uint64_t a3)
{
  uint64_t v4;

  sub_23DBA5020(0, a2, a3, (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE1C68]);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  return a1;
}

uint64_t sub_23DBA4F54(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 16))(a2, a1);
  return a2;
}

uint64_t sub_23DBA4F90(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 8))();
  return a1;
}

void sub_23DBA4FC4()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256CE8B40)
  {
    v0 = sub_23DBAB470();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_256CE8B40);
  }
}

void sub_23DBA5020(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(_QWORD, uint64_t))
{
  unint64_t v5;
  uint64_t v6;

  if (!*a2)
  {
    v5 = a4(0, a3);
    if (!v6)
      atomic_store(v5, a2);
  }
}

unint64_t PinnedContentDomain.keyValueDomainName.getter()
{
  return 0xD000000000000026;
}

BOOL PinnedContentDomain.init(rawValue:)()
{
  uint64_t v0;

  v0 = sub_23DBAB518();
  swift_bridgeObjectRelease();
  return v0 != 0;
}

void *static PinnedContentDomain.allCases.getter()
{
  return &unk_250E83E88;
}

uint64_t sub_23DBA5274()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;

  v0 = _s09HealthAppA13DaemonSupport19PinnedContentDomainO8rawValueSSvg_0();
  v2 = v1;
  if (v0 == _s09HealthAppA13DaemonSupport19PinnedContentDomainO8rawValueSSvg_0() && v2 == v3)
    v4 = 1;
  else
    v4 = sub_23DBAB53C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v4 & 1;
}

uint64_t sub_23DBA52F4()
{
  sub_23DBAB584();
  _s09HealthAppA13DaemonSupport19PinnedContentDomainO8rawValueSSvg_0();
  sub_23DBAB314();
  swift_bridgeObjectRelease();
  return sub_23DBAB59C();
}

uint64_t sub_23DBA534C()
{
  _s09HealthAppA13DaemonSupport19PinnedContentDomainO8rawValueSSvg_0();
  sub_23DBAB314();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23DBA5388()
{
  sub_23DBAB584();
  _s09HealthAppA13DaemonSupport19PinnedContentDomainO8rawValueSSvg_0();
  sub_23DBAB314();
  swift_bridgeObjectRelease();
  return sub_23DBAB59C();
}

uint64_t sub_23DBA53DC@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_23DBAB518();
  result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

uint64_t sub_23DBA542C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = _s09HealthAppA13DaemonSupport19PinnedContentDomainO8rawValueSSvg_0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void sub_23DBA5450(_QWORD *a1@<X8>)
{
  *a1 = &unk_250E83EE8;
}

uint64_t sub_23DBA5464(uint64_t a1, char a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;

  type metadata accessor for CoherentPinnedContentState();
  sub_23DBA69B4();
  v5 = v4;
  result = sub_23DBAB1F4();
  if ((a2 & 1) != 0)
    return result;
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    if ((a1 & 0x8000000000000000) == 0 && result >= a1)
      return a1;
    v5 = sub_23DBAB1F4();
    if (qword_25431E100 == -1)
      goto LABEL_7;
  }
  swift_once();
LABEL_7:
  v7 = sub_23DBAB0EC();
  __swift_project_value_buffer(v7, (uint64_t)qword_25431E160);
  v8 = sub_23DBAB0D4();
  v9 = sub_23DBAB3EC();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = swift_slowAlloc();
    v11 = swift_slowAlloc();
    v15 = v11;
    *(_DWORD *)v10 = 136315394;
    sub_23DBA8734(0xD00000000000001ALL, 0x800000023DBABD40, &v15);
    sub_23DBAB41C();
    *(_WORD *)(v10 + 12) = 2080;
    v12 = sub_23DBAB308();
    sub_23DBA8734(v12, v13, &v15);
    sub_23DBAB41C();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23DB9B000, v8, v9, "[%s]: Could not sanitize index: %s", (uint8_t *)v10, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24263D18C](v11, -1, -1);
    MEMORY[0x24263D18C](v10, -1, -1);
  }

  sub_23DBA71DC();
  swift_allocError();
  *(_QWORD *)v14 = a1;
  *(_QWORD *)(v14 + 8) = v5;
  *(_BYTE *)(v14 + 16) = 1;
  return swift_willThrow();
}

uint64_t sub_23DBA56BC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v2 = v1;
  type metadata accessor for CoherentPinnedContentState();
  sub_23DBA69B4();
  v4 = sub_23DBAB1F4();
  if (v4 < 0)
  {
    __break(1u);
LABEL_10:
    swift_once();
    goto LABEL_6;
  }
  if ((a1 & 0x8000000000000000) == 0 && v4 > a1)
    return sub_23DBAB1DC();
  v2 = sub_23DBAB1F4();
  if (qword_25431E100 != -1)
    goto LABEL_10;
LABEL_6:
  v6 = sub_23DBAB0EC();
  __swift_project_value_buffer(v6, (uint64_t)qword_25431E160);
  v7 = sub_23DBAB0D4();
  v8 = sub_23DBAB3EC();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = swift_slowAlloc();
    v10 = swift_slowAlloc();
    v14 = v10;
    *(_DWORD *)v9 = 136315394;
    sub_23DBA8734(0xD00000000000001ALL, 0x800000023DBABD40, &v14);
    sub_23DBAB41C();
    *(_WORD *)(v9 + 12) = 2080;
    v11 = sub_23DBAB308();
    sub_23DBA8734(v11, v12, &v14);
    sub_23DBAB41C();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23DB9B000, v7, v8, "[%s]: Index out of bounds: %s", (uint8_t *)v9, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24263D18C](v10, -1, -1);
    MEMORY[0x24263D18C](v9, -1, -1);
  }

  sub_23DBA71DC();
  swift_allocError();
  *(_QWORD *)v13 = a1;
  *(_QWORD *)(v13 + 8) = v2;
  *(_BYTE *)(v13 + 16) = 1;
  return swift_willThrow();
}

uint64_t sub_23DBA5918(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t result;
  char v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;

  result = sub_23DBA5464(a3, 0);
  if (!v3)
  {
    type metadata accessor for CoherentPinnedContentState();
    sub_23DBA5BD0(a1, a2);
    if ((v7 & 1) != 0)
    {
      if (qword_25431E100 != -1)
        swift_once();
      v8 = sub_23DBAB0EC();
      __swift_project_value_buffer(v8, (uint64_t)qword_25431E160);
      swift_bridgeObjectRetain_n();
      v9 = sub_23DBAB0D4();
      v10 = sub_23DBAB3EC();
      if (os_log_type_enabled(v9, v10))
      {
        v11 = swift_slowAlloc();
        v12 = swift_slowAlloc();
        v16 = v12;
        *(_DWORD *)v11 = 136315650;
        sub_23DBA8734(0xD00000000000001ALL, 0x800000023DBABD40, &v16);
        sub_23DBAB41C();
        *(_WORD *)(v11 + 12) = 2048;
        sub_23DBAB41C();
        *(_WORD *)(v11 + 22) = 2080;
        swift_bridgeObjectRetain();
        v13 = sub_23DBAB308();
        sub_23DBA8734(v13, v14, &v16);
        sub_23DBAB41C();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_23DB9B000, v9, v10, "[%s]: Attempted to move item to index %ld failed: %s", (uint8_t *)v11, 0x20u);
        swift_arrayDestroy();
        MEMORY[0x24263D18C](v12, -1, -1);
        MEMORY[0x24263D18C](v11, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      sub_23DBA71DC();
      swift_allocError();
      *(_QWORD *)v15 = a1;
      *(_QWORD *)(v15 + 8) = a2;
      *(_BYTE *)(v15 + 16) = 0;
      swift_bridgeObjectRetain();
      return swift_willThrow();
    }
    else
    {
      sub_23DBA69B4();
      return sub_23DBAB1C4();
    }
  }
  return result;
}

uint64_t sub_23DBA5BD0(uint64_t a1, uint64_t a2)
{
  void (*v4)(uint64_t *, _QWORD);
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  char v9;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v14 = a1;
  v15 = a2;
  sub_23DBA69B4();
  sub_23DBA6F40(&qword_256CE8B78, (uint64_t (*)(uint64_t))sub_23DBA69B4, MEMORY[0x24BE18338]);
  sub_23DBAB3BC();
  if ((v12 & 1) == 0)
    return v11;
  sub_23DBAB3B0();
  while (1)
  {
    sub_23DBAB3C8();
    if (v13 == v11)
      return 0;
    v4 = (void (*)(uint64_t *, _QWORD))sub_23DBAB3E0();
    v7 = *v5;
    v6 = v5[1];
    swift_bridgeObjectRetain();
    v4(&v11, 0);
    if (v7 == a1 && v6 == a2)
      break;
    v9 = sub_23DBAB53C();
    swift_bridgeObjectRelease();
    if ((v9 & 1) != 0)
      return v13;
    sub_23DBAB3D4();
  }
  swift_bridgeObjectRelease();
  return v13;
}

uint64_t sub_23DBA5D30()
{
  uint64_t result;

  qword_25431E178 = 0xD000000000000014;
  unk_25431E180 = 0x800000023DBAC640;
  qword_25431E188 = swift_getKeyPath();
  unk_25431E190 = 0xD000000000000012;
  qword_25431E198 = 0x800000023DBAC2D0;
  result = swift_getKeyPath();
  qword_25431E1A0 = result;
  return result;
}

uint64_t sub_23DBA5DA4(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4;

  if ((a3 & 1) != 0)
  {
    sub_23DBAB47C();
    swift_bridgeObjectRelease();
    v4 = 0x207865646E49;
    sub_23DBAB524();
    sub_23DBAB320();
    swift_bridgeObjectRelease();
    sub_23DBAB320();
    sub_23DBAB524();
    sub_23DBAB320();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_23DBAB47C();
    swift_bridgeObjectRelease();
    v4 = 0x696669746E656449;
    sub_23DBAB320();
    sub_23DBAB320();
  }
  return v4;
}

uint64_t sub_23DBA5F04()
{
  uint64_t v0;

  return sub_23DBA5DA4(*(_QWORD *)v0, *(_QWORD *)(v0 + 8), *(_BYTE *)(v0 + 16));
}

uint64_t sub_23DBA5F10()
{
  sub_23DBA6F40(&qword_25431DF80, (uint64_t (*)(uint64_t))type metadata accessor for CoherentPinnedContentState, (uint64_t)&unk_23DBABF34);
  return sub_23DBAB14C();
}

uint64_t sub_23DBA5F74()
{
  sub_23DBA6F40(&qword_25431DF80, (uint64_t (*)(uint64_t))type metadata accessor for CoherentPinnedContentState, (uint64_t)&unk_23DBABF34);
  return sub_23DBAB188();
}

uint64_t sub_23DBA5FD4()
{
  sub_23DBA6F40(&qword_25431DF80, (uint64_t (*)(uint64_t))type metadata accessor for CoherentPinnedContentState, (uint64_t)&unk_23DBABF34);
  return sub_23DBAB110();
}

uint64_t sub_23DBA6028()
{
  return sub_23DBAB1B8();
}

uint64_t sub_23DBA6050@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if (qword_25431DF78 != -1)
    swift_once();
  v2 = unk_25431E180;
  v4 = qword_25431E188;
  v3 = unk_25431E190;
  v5 = qword_25431E198;
  v6 = qword_25431E1A0;
  *a1 = qword_25431E178;
  a1[1] = v2;
  a1[2] = v4;
  a1[3] = v3;
  a1[4] = v5;
  a1[5] = v6;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  return swift_retain();
}

uint64_t sub_23DBA60D4()
{
  sub_23DBA6F40(&qword_25431DF80, (uint64_t (*)(uint64_t))type metadata accessor for CoherentPinnedContentState, (uint64_t)&unk_23DBABF34);
  return sub_23DBAB1AC();
}

uint64_t sub_23DBA6114()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_23DBA6120(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t result;

  v4 = *(int *)(a2 + 24);
  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + v4) = a1;
  return result;
}

uint64_t (*sub_23DBA6154())()
{
  return nullsub_1;
}

uint64_t sub_23DBA6168@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  *(_QWORD *)(a2 + *(int *)(a1 + 24)) = MEMORY[0x24BEE4B00];
  sub_23DBAB248();
  v2 = MEMORY[0x24BEE0D00];
  sub_23DBA7158(0, (unint64_t *)&unk_25431E0A0);
  sub_23DBA719C((unint64_t *)&qword_25431E078, (unint64_t *)&unk_25431E0A0, v2, MEMORY[0x24BEE12C8]);
  return sub_23DBAB218();
}

uint64_t sub_23DBA6254()
{
  sub_23DBA6F40(&qword_25431DFB8, (uint64_t (*)(uint64_t))type metadata accessor for CoherentPinnedContentState, (uint64_t)&unk_23DBABDB4);
  return sub_23DBAB2A8();
}

uint64_t sub_23DBA6294()
{
  sub_23DBA6F40(&qword_25431DF80, (uint64_t (*)(uint64_t))type metadata accessor for CoherentPinnedContentState, (uint64_t)&unk_23DBABF34);
  return sub_23DBAB128();
}

uint64_t sub_23DBA62EC()
{
  sub_23DBA6F40(&qword_25431DF80, (uint64_t (*)(uint64_t))type metadata accessor for CoherentPinnedContentState, (uint64_t)&unk_23DBABF34);
  return sub_23DBAB158();
}

uint64_t sub_23DBA633C()
{
  sub_23DBA6F40(&qword_25431DF80, (uint64_t (*)(uint64_t))type metadata accessor for CoherentPinnedContentState, (uint64_t)&unk_23DBABF34);
  return sub_23DBAB1A0();
}

uint64_t sub_23DBA638C()
{
  sub_23DBA6F40(&qword_25431DF80, (uint64_t (*)(uint64_t))type metadata accessor for CoherentPinnedContentState, (uint64_t)&unk_23DBABF34);
  return sub_23DBAB164();
}

uint64_t sub_23DBA63F4()
{
  sub_23DBA6F40(&qword_25431DF80, (uint64_t (*)(uint64_t))type metadata accessor for CoherentPinnedContentState, (uint64_t)&unk_23DBABF34);
  return sub_23DBAB194();
}

uint64_t sub_23DBA6444()
{
  sub_23DBA6F40(&qword_25431DF80, (uint64_t (*)(uint64_t))type metadata accessor for CoherentPinnedContentState, (uint64_t)&unk_23DBABF34);
  return sub_23DBAB170();
}

uint64_t sub_23DBA6494()
{
  sub_23DBA6F40(&qword_25431DF80, (uint64_t (*)(uint64_t))type metadata accessor for CoherentPinnedContentState, (uint64_t)&unk_23DBABF34);
  return sub_23DBAB140();
}

uint64_t sub_23DBA64EC()
{
  sub_23DBA6F40(&qword_25431DF80, (uint64_t (*)(uint64_t))type metadata accessor for CoherentPinnedContentState, (uint64_t)&unk_23DBABF34);
  return sub_23DBAB11C();
}

uint64_t sub_23DBA6554()
{
  sub_23DBA6F40(&qword_25431DF80, (uint64_t (*)(uint64_t))type metadata accessor for CoherentPinnedContentState, (uint64_t)&unk_23DBABF34);
  return sub_23DBAB0F8();
}

uint64_t sub_23DBA65A4()
{
  sub_23DBA6F40(&qword_25431DF80, (uint64_t (*)(uint64_t))type metadata accessor for CoherentPinnedContentState, (uint64_t)&unk_23DBABF34);
  return sub_23DBAB134();
}

uint64_t sub_23DBA65E4()
{
  sub_23DBA6F40(&qword_25431DF80, (uint64_t (*)(uint64_t))type metadata accessor for CoherentPinnedContentState, (uint64_t)&unk_23DBABF34);
  return sub_23DBAB104();
}

uint64_t sub_23DBA6638()
{
  sub_23DBA6F40(&qword_25431DF80, (uint64_t (*)(uint64_t))type metadata accessor for CoherentPinnedContentState, (uint64_t)&unk_23DBABF34);
  return sub_23DBAB17C();
}

uint64_t sub_23DBA6688()
{
  sub_23DBA6F40(&qword_25431DFB0, (uint64_t (*)(uint64_t))type metadata accessor for CoherentPinnedContentState, (uint64_t)&unk_23DBABF5C);
  return sub_23DBAB284();
}

uint64_t sub_23DBA66EC()
{
  sub_23DBA6F40(&qword_25431DFB0, (uint64_t (*)(uint64_t))type metadata accessor for CoherentPinnedContentState, (uint64_t)&unk_23DBABF5C);
  return sub_23DBAB290();
}

uint64_t _s09HealthAppA13DaemonSupport19PinnedContentDomainO8rawValueSSvg_0()
{
  return 0x7972616D6D7573;
}

unint64_t sub_23DBA677C()
{
  unint64_t result;

  result = qword_256CE8B48;
  if (!qword_256CE8B48)
  {
    result = MEMORY[0x24263D114](&protocol conformance descriptor for PinnedContentDomain, &type metadata for PinnedContentDomain);
    atomic_store(result, (unint64_t *)&qword_256CE8B48);
  }
  return result;
}

uint64_t sub_23DBA67C0()
{
  return sub_23DBA719C(&qword_256CE8B50, &qword_256CE8B58, (uint64_t)&type metadata for PinnedContentDomain, MEMORY[0x24BEE12E0]);
}

uint64_t storeEnumTagSinglePayload for PinnedContentDomain(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23DBA6834 + 4 * byte_23DBABC30[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23DBA6854 + 4 * byte_23DBABC35[v4]))();
}

_BYTE *sub_23DBA6834(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23DBA6854(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23DBA685C(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23DBA6864(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23DBA686C(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23DBA6874(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for PinnedContentDomain()
{
  return &type metadata for PinnedContentDomain;
}

uint64_t *sub_23DBA6890(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
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
    sub_23DBA6950();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    sub_23DBA69B4();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 24)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 24));
    swift_bridgeObjectRetain();
  }
  return a1;
}

void sub_23DBA6950()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_25431DF98)
  {
    v0 = sub_23DBAB23C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_25431DF98);
  }
}

void sub_23DBA69B4()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_25431E070)
  {
    v0 = sub_23DBAB20C();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_25431E070);
  }
}

uint64_t sub_23DBA6A18(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_23DBA6950();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = a1 + *(int *)(a2 + 20);
  sub_23DBA69B4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  return swift_bridgeObjectRelease();
}

uint64_t sub_23DBA6A88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  sub_23DBA6950();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  sub_23DBA69B4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
  *(_QWORD *)(a1 + *(int *)(a3 + 24)) = *(_QWORD *)(a2 + *(int *)(a3 + 24));
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_23DBA6B1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  sub_23DBA6950();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  sub_23DBA69B4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 24))(v8, v9, v10);
  *(_QWORD *)(a1 + *(int *)(a3 + 24)) = *(_QWORD *)(a2 + *(int *)(a3 + 24));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_23DBA6BBC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  sub_23DBA6950();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  sub_23DBA69B4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  *(_QWORD *)(a1 + *(int *)(a3 + 24)) = *(_QWORD *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t sub_23DBA6C4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  sub_23DBA6950();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  sub_23DBA69B4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  *(_QWORD *)(a1 + *(int *)(a3 + 24)) = *(_QWORD *)(a2 + *(int *)(a3 + 24));
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_23DBA6CE4()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_23DBA6CF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v14;

  sub_23DBA6950();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
    return v9(v10, a2, v8);
  }
  sub_23DBA69B4();
  v12 = *(_QWORD *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
  {
    v8 = v11;
    v10 = a1 + *(int *)(a3 + 20);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    return v9(v10, a2, v8);
  }
  v14 = *(_QWORD *)(a1 + *(int *)(a3 + 24));
  if (v14 >= 0xFFFFFFFF)
    LODWORD(v14) = -1;
  return (v14 + 1);
}

uint64_t sub_23DBA6D98()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_23DBA6DA4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  sub_23DBA6950();
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
LABEL_5:
    v11(v12, a2, a2, v10);
    return;
  }
  sub_23DBA69B4();
  v14 = *(_QWORD *)(v13 - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    v10 = v13;
    v12 = a1 + *(int *)(a4 + 20);
    v11 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    goto LABEL_5;
  }
  *(_QWORD *)(a1 + *(int *)(a4 + 24)) = (a2 - 1);
}

uint64_t type metadata accessor for CoherentPinnedContentState()
{
  uint64_t result;

  result = qword_25431DFC8;
  if (!qword_25431DFC8)
    return swift_getSingletonMetadata();
  return result;
}

void sub_23DBA6E84()
{
  unint64_t v0;
  unint64_t v1;

  sub_23DBA6950();
  if (v0 <= 0x3F)
  {
    sub_23DBA69B4();
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

uint64_t sub_23DBA6F14()
{
  return sub_23DBA6F40(&qword_25431DFC0, (uint64_t (*)(uint64_t))type metadata accessor for CoherentPinnedContentState, (uint64_t)&unk_23DBABEEC);
}

uint64_t sub_23DBA6F40(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x24263D114](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_23DBA6F80()
{
  return sub_23DBA6F40(&qword_25431DFB0, (uint64_t (*)(uint64_t))type metadata accessor for CoherentPinnedContentState, (uint64_t)&unk_23DBABF5C);
}

uint64_t sub_23DBA6FAC()
{
  return sub_23DBA6F40(&qword_25431DFA8, (uint64_t (*)(uint64_t))type metadata accessor for CoherentPinnedContentState, (uint64_t)&unk_23DBABE14);
}

uint64_t sub_23DBA6FD8()
{
  return sub_23DBA6F40(&qword_25431E060, (uint64_t (*)(uint64_t))sub_23DBA69B4, MEMORY[0x24BE18328]);
}

uint64_t sub_23DBA7004()
{
  return sub_23DBA6F40(&qword_25431DF90, (uint64_t (*)(uint64_t))sub_23DBA6950, MEMORY[0x24BE18390]);
}

uint64_t sub_23DBA7030()
{
  return sub_23DBA6F40(&qword_25431DF88, (uint64_t (*)(uint64_t))type metadata accessor for CoherentPinnedContentState, (uint64_t)&unk_23DBABE74);
}

uint64_t sub_23DBA705C()
{
  return sub_23DBA6F40(&qword_25431DFA0, (uint64_t (*)(uint64_t))type metadata accessor for CoherentPinnedContentState, (uint64_t)&unk_23DBABD7C);
}

uint64_t sub_23DBA7088()
{
  return sub_23DBA6F40(&qword_25431DFB8, (uint64_t (*)(uint64_t))type metadata accessor for CoherentPinnedContentState, (uint64_t)&unk_23DBABDB4);
}

uint64_t sub_23DBA70B4()
{
  return sub_23DBA6F40(&qword_256CE8B60, (uint64_t (*)(uint64_t))sub_23DBA70E0, MEMORY[0x24BE185D0]);
}

void sub_23DBA70E0()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256CE8B68)
  {
    type metadata accessor for CoherentPinnedContentState();
    sub_23DBA6F40(&qword_25431DF80, (uint64_t (*)(uint64_t))type metadata accessor for CoherentPinnedContentState, (uint64_t)&unk_23DBABF34);
    v0 = sub_23DBAB278();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_256CE8B68);
  }
}

void sub_23DBA7158(uint64_t a1, unint64_t *a2)
{
  unint64_t v3;
  uint64_t v4;

  if (!*a2)
  {
    v3 = sub_23DBAB38C();
    if (!v4)
      atomic_store(v3, a2);
  }
}

uint64_t sub_23DBA719C(unint64_t *a1, unint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v7;

  result = *a1;
  if (!result)
  {
    sub_23DBA7158(255, a2);
    result = MEMORY[0x24263D114](a4, v7);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_23DBA71DC()
{
  unint64_t result;

  result = qword_256CE8B70;
  if (!qword_256CE8B70)
  {
    result = MEMORY[0x24263D114](&unk_23DBAC050, &type metadata for CoherentPinnedContentState.Failure);
    atomic_store(result, (unint64_t *)&qword_256CE8B70);
  }
  return result;
}

uint64_t sub_23DBA7224(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if ((a3 & 1) == 0)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t destroy for CoherentPinnedContentState.Failure(uint64_t a1)
{
  return sub_23DBA7244(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t sub_23DBA7244(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if ((a3 & 1) == 0)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t _s28HealthAppHealthDaemonSupport26CoherentPinnedContentStateV7FailureOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_23DBA7224(*(_QWORD *)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for CoherentPinnedContentState.Failure(uint64_t a1, uint64_t a2)
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
  sub_23DBA7224(*(_QWORD *)a2, v4, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  v8 = *(_BYTE *)(a1 + 16);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  sub_23DBA7244(v6, v7, v8);
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

uint64_t assignWithTake for CoherentPinnedContentState.Failure(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  char v6;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(_QWORD *)a1;
  v5 = *(_QWORD *)(a1 + 8);
  v6 = *(_BYTE *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = v3;
  sub_23DBA7244(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for CoherentPinnedContentState.Failure(uint64_t a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for CoherentPinnedContentState.Failure(uint64_t result, unsigned int a2, unsigned int a3)
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

uint64_t sub_23DBA73D4(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_23DBA73DC(uint64_t result, char a2)
{
  *(_BYTE *)(result + 16) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for CoherentPinnedContentState.Failure()
{
  return &type metadata for CoherentPinnedContentState.Failure;
}

id CodablePinnedContentDifference.__allocating_init(difference:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  objc_class *v8;
  char *v9;
  void *v10;
  char *v11;
  objc_super *v12;
  objc_super v14;
  void *v15;

  v8 = (objc_class *)type metadata accessor for CodablePinnedContentDifference();
  v9 = (char *)objc_allocWithZone(v8);
  v10 = v9;
  v11 = &v9[OBJC_IVAR___HAHDCodablePinnedContentDifference_identifier];
  *(_QWORD *)v11 = 0;
  *((_QWORD *)v11 + 1) = 0;
  if ((a4 & 1) != 0)
  {
    *(_QWORD *)&v9[OBJC_IVAR___HAHDCodablePinnedContentDifference_index] = a3;
    swift_beginAccess();
    *(_QWORD *)v11 = a1;
    *((_QWORD *)v11 + 1) = a2;
    swift_bridgeObjectRelease();
    v14.receiver = v10;
    v12 = &v14;
  }
  else
  {
    *(_QWORD *)&v9[OBJC_IVAR___HAHDCodablePinnedContentDifference_index] = a1;
    swift_beginAccess();
    *(_QWORD *)v11 = 0;
    *((_QWORD *)v11 + 1) = 0;
    swift_bridgeObjectRelease();
    v15 = v10;
    v12 = (objc_super *)&v15;
  }
  v12->super_class = v8;
  return -[objc_super init](v12, sel_init);
}

BOOL static PinnedContentDifference.== infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  return sub_23DBA7C00(a1, a2, a3, a4 & 1, a5, a6, a7, a8 & 1);
}

BOOL sub_23DBA74E4(uint64_t a1, uint64_t a2)
{
  return sub_23DBA7C00(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_BYTE *)(a1 + 24), *(_QWORD *)a2, *(_QWORD *)(a2 + 8), *(_QWORD *)(a2 + 16), *(_BYTE *)(a2 + 24));
}

uint64_t static CodablePinnedContentDifference.supportsSecureCoding.getter()
{
  return 1;
}

uint64_t sub_23DBA7518()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___HAHDCodablePinnedContentDifference_index;
  swift_beginAccess();
  return *(_QWORD *)v1;
}

uint64_t sub_23DBA755C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t result;

  v3 = (_QWORD *)(v1 + OBJC_IVAR___HAHDCodablePinnedContentDifference_index);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_23DBA75A4())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_23DBA75E8(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v3 = *a1;
  v2 = a1[1];
  v4 = (_QWORD *)(*a2 + OBJC_IVAR___HAHDCodablePinnedContentDifference_identifier);
  swift_beginAccess();
  *v4 = v3;
  v4[1] = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_23DBA7650()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v1 = (uint64_t *)(v0 + OBJC_IVAR___HAHDCodablePinnedContentDifference_identifier);
  swift_beginAccess();
  v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_23DBA76A4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)(v2 + OBJC_IVAR___HAHDCodablePinnedContentDifference_identifier);
  swift_beginAccess();
  *v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_23DBA7700())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

id CodablePinnedContentDifference.__allocating_init(index:identifier:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_class *v3;
  char *v7;
  char *v8;
  objc_super v10;

  v7 = (char *)objc_allocWithZone(v3);
  v8 = &v7[OBJC_IVAR___HAHDCodablePinnedContentDifference_identifier];
  *(_QWORD *)v8 = 0;
  *((_QWORD *)v8 + 1) = 0;
  *(_QWORD *)&v7[OBJC_IVAR___HAHDCodablePinnedContentDifference_index] = a1;
  swift_beginAccess();
  *(_QWORD *)v8 = a2;
  *((_QWORD *)v8 + 1) = a3;
  swift_bridgeObjectRelease();
  v10.receiver = v7;
  v10.super_class = v3;
  return objc_msgSendSuper2(&v10, sel_init);
}

uint64_t type metadata accessor for CodablePinnedContentDifference()
{
  return objc_opt_self();
}

id CodablePinnedContentDifference.init(index:identifier:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char *v3;
  char *v6;
  objc_super v8;

  v6 = &v3[OBJC_IVAR___HAHDCodablePinnedContentDifference_identifier];
  *(_QWORD *)v6 = 0;
  *((_QWORD *)v6 + 1) = 0;
  *(_QWORD *)&v3[OBJC_IVAR___HAHDCodablePinnedContentDifference_index] = a1;
  swift_beginAccess();
  *(_QWORD *)v6 = a2;
  *((_QWORD *)v6 + 1) = a3;
  swift_bridgeObjectRelease();
  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for CodablePinnedContentDifference();
  return objc_msgSendSuper2(&v8, sel_init);
}

void sub_23DBA7880(void *a1)
{
  uint64_t v1;
  uint64_t *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = (uint64_t *)(v1 + OBJC_IVAR___HAHDCodablePinnedContentDifference_index);
  swift_beginAccess();
  v4 = *v3;
  v5 = (void *)sub_23DBAB2F0();
  objc_msgSend(a1, sel_encodeInteger_forKey_, v4, v5);

  v6 = v1 + OBJC_IVAR___HAHDCodablePinnedContentDifference_identifier;
  swift_beginAccess();
  if (*(_QWORD *)(v6 + 8))
  {
    swift_bridgeObjectRetain();
    v7 = (void *)sub_23DBAB2F0();
    swift_bridgeObjectRelease();
    v8 = (void *)sub_23DBAB2F0();
    objc_msgSend(a1, sel_encodeObject_forKey_, v7, v8);

  }
}

id CodablePinnedContentDifference.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;
  id v4;

  v3 = objc_allocWithZone(v1);
  v4 = sub_23DBA7C74(a1);

  return v4;
}

id CodablePinnedContentDifference.init(coder:)(void *a1)
{
  id v2;

  v2 = sub_23DBA7C74(a1);

  return v2;
}

id CodablePinnedContentDifference.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void CodablePinnedContentDifference.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id CodablePinnedContentDifference.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CodablePinnedContentDifference();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t CodablePinnedContentDifference.toPinnedContentDifference()()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t *v3;

  v1 = (uint64_t *)(v0 + OBJC_IVAR___HAHDCodablePinnedContentDifference_identifier);
  swift_beginAccess();
  if (v1[1])
  {
    v2 = *v1;
    swift_beginAccess();
  }
  else
  {
    v3 = (uint64_t *)(v0 + OBJC_IVAR___HAHDCodablePinnedContentDifference_index);
    swift_beginAccess();
    v2 = *v3;
  }
  swift_bridgeObjectRetain();
  return v2;
}

BOOL sub_23DBA7C00(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  _BOOL8 result;
  char v12;

  if ((a4 & 1) == 0)
    return (a8 & 1) == 0 && a1 == a5;
  if ((a8 & 1) != 0)
  {
    if (a1 == a5 && a2 == a6)
      return a3 == a7;
    v12 = sub_23DBAB53C();
    result = 0;
    if ((v12 & 1) != 0)
      return a3 == a7;
  }
  else
  {
    return 0;
  }
  return result;
}

id sub_23DBA7C74(void *a1)
{
  char *v1;
  char *v3;
  char *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  objc_super v15;
  _OWORD v16[2];
  _BYTE v17[24];
  uint64_t v18;

  v3 = &v1[OBJC_IVAR___HAHDCodablePinnedContentDifference_identifier];
  *(_QWORD *)v3 = 0;
  *((_QWORD *)v3 + 1) = 0;
  v4 = v1;
  v5 = (void *)sub_23DBAB2F0();
  v6 = objc_msgSend(a1, sel_decodeIntegerForKey_, v5);

  *(_QWORD *)&v4[OBJC_IVAR___HAHDCodablePinnedContentDifference_index] = v6;
  v7 = (void *)sub_23DBAB2F0();
  v8 = objc_msgSend(a1, sel_decodeObjectForKey_, v7);

  if (v8)
  {
    sub_23DBAB434();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v16, 0, sizeof(v16));
  }
  sub_23DBA8218((uint64_t)v16, (uint64_t)v17);
  if (v18)
  {
    v9 = swift_dynamicCast();
    if (v9)
      v10 = v13;
    else
      v10 = 0;
    if (v9)
      v11 = v14;
    else
      v11 = 0;
  }
  else
  {
    sub_23DBA82B4((uint64_t)v17);
    v10 = 0;
    v11 = 0;
  }
  swift_beginAccess();
  *(_QWORD *)v3 = v10;
  *((_QWORD *)v3 + 1) = v11;

  swift_bridgeObjectRelease();
  v15.receiver = v4;
  v15.super_class = (Class)type metadata accessor for CodablePinnedContentDifference();
  return objc_msgSendSuper2(&v15, sel_init);
}

uint64_t sub_23DBA7E04@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;
  uint64_t result;

  v3 = (_QWORD *)(*a1 + OBJC_IVAR___HAHDCodablePinnedContentDifference_index);
  result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_23DBA7E54(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t result;

  v2 = *a1;
  v3 = (_QWORD *)(*a2 + OBJC_IVAR___HAHDCodablePinnedContentDifference_index);
  result = swift_beginAccess();
  *v3 = v2;
  return result;
}

uint64_t sub_23DBA7EA0@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;
  uint64_t v4;

  v3 = (_QWORD *)(*a1 + OBJC_IVAR___HAHDCodablePinnedContentDifference_identifier);
  swift_beginAccess();
  v4 = v3[1];
  *a2 = *v3;
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t initializeBufferWithCopyOfBuffer for PinnedContentDifference(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t sub_23DBA7F28(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t result;

  if ((a4 & 1) != 0)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t destroy for PinnedContentDifference(uint64_t a1)
{
  return sub_23DBA7F4C(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_BYTE *)(a1 + 24));
}

uint64_t sub_23DBA7F4C(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t result;

  if ((a4 & 1) != 0)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t initializeWithCopy for PinnedContentDifference(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_BYTE *)(a2 + 24);
  sub_23DBA7F28(*(_QWORD *)a2, v4, v5, v6);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_BYTE *)(a1 + 24) = v6;
  return a1;
}

uint64_t assignWithCopy for PinnedContentDifference(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_BYTE *)(a2 + 24);
  sub_23DBA7F28(*(_QWORD *)a2, v4, v5, v6);
  v7 = *(_QWORD *)a1;
  v8 = *(_QWORD *)(a1 + 8);
  v9 = *(_QWORD *)(a1 + 16);
  v10 = *(_BYTE *)(a1 + 24);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_BYTE *)(a1 + 24) = v6;
  sub_23DBA7F4C(v7, v8, v9, v10);
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

uint64_t assignWithTake for PinnedContentDifference(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  v3 = *(_QWORD *)(a2 + 16);
  v4 = *(_BYTE *)(a2 + 24);
  v5 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  v6 = *(_QWORD *)(a1 + 16);
  v8 = *(_BYTE *)(a1 + 24);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = v3;
  *(_BYTE *)(a1 + 24) = v4;
  sub_23DBA7F4C(v5, v7, v6, v8);
  return a1;
}

uint64_t getEnumTagSinglePayload for PinnedContentDifference(uint64_t a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for PinnedContentDifference(uint64_t result, unsigned int a2, unsigned int a3)
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

uint64_t sub_23DBA8114(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 24);
}

uint64_t sub_23DBA811C(uint64_t result, char a2)
{
  *(_BYTE *)(result + 24) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for PinnedContentDifference()
{
  return &type metadata for PinnedContentDifference;
}

uint64_t method lookup function for CodablePinnedContentDifference()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CodablePinnedContentDifference.index.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x60))();
}

uint64_t dispatch thunk of CodablePinnedContentDifference.index.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x68))();
}

uint64_t dispatch thunk of CodablePinnedContentDifference.index.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x70))();
}

uint64_t dispatch thunk of CodablePinnedContentDifference.identifier.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of CodablePinnedContentDifference.identifier.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of CodablePinnedContentDifference.identifier.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of CodablePinnedContentDifference.__allocating_init(index:identifier:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 144))();
}

uint64_t dispatch thunk of CodablePinnedContentDifference.encode(with:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of CodablePinnedContentDifference.__allocating_init(coder:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 160))();
}

uint64_t sub_23DBA8218(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_23DBA825C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_23DBA825C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_256CE8B10)
  {
    v0 = sub_23DBAB410();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_256CE8B10);
  }
}

uint64_t sub_23DBA82B4(uint64_t a1)
{
  uint64_t v2;

  sub_23DBA825C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t static LegacyFavoritesManagerSupport.keyValueDomainCategory.getter()
{
  return 0;
}

unint64_t static LegacyFavoritesManagerSupport.keyValueDomainName.getter()
{
  return 0xD00000000000001ALL;
}

unint64_t static LegacyFavoritesManagerSupport.keyValueDomainKey.getter()
{
  return 0xD000000000000013;
}

uint64_t static LegacyFavoritesManagerSupport.favoriteIdentifiers(from:)(uint64_t a1)
{
  unint64_t v1;
  char v2;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;

  sub_23DBA4CB4(a1, (uint64_t)&v12);
  sub_23DBA85E4();
  if ((swift_dynamicCast() & 1) != 0)
  {
    if (*(_QWORD *)(v11 + 16) && (v1 = sub_23DBA8D9C(0xD000000000000013, 0x800000023DBAC760), (v2 & 1) != 0))
    {
      sub_23DBA4CB4(*(_QWORD *)(v11 + 56) + 32 * v1, (uint64_t)&v12);
    }
    else
    {
      v12 = 0u;
      v13 = 0u;
    }
    swift_bridgeObjectRelease();
    if (*((_QWORD *)&v13 + 1))
    {
      sub_23DBA5020(0, (unint64_t *)&unk_25431E0A0, MEMORY[0x24BEE0D00], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE1250]);
      if ((swift_dynamicCast() & 1) != 0)
        return v11;
    }
    else
    {
      sub_23DBA82B4((uint64_t)&v12);
    }
  }
  if (qword_25431E100 != -1)
    swift_once();
  v4 = sub_23DBAB0EC();
  __swift_project_value_buffer(v4, (uint64_t)qword_25431E160);
  v5 = sub_23DBAB0D4();
  v6 = sub_23DBAB3EC();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = swift_slowAlloc();
    v8 = swift_slowAlloc();
    *(_QWORD *)&v12 = v8;
    *(_DWORD *)v7 = 136315394;
    sub_23DBA8734(0xD00000000000001DLL, 0x800000023DBAC110, (uint64_t *)&v12);
    sub_23DBAB41C();
    *(_WORD *)(v7 + 12) = 2080;
    v9 = sub_23DBAB308();
    sub_23DBA8734(v9, v10, (uint64_t *)&v12);
    sub_23DBAB41C();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_23DB9B000, v5, v6, "[%s]: Legacy favorites unreadable: %s", (uint8_t *)v7, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24263D18C](v8, -1, -1);
    MEMORY[0x24263D18C](v7, -1, -1);
  }

  sub_23DBA864C();
  swift_allocError();
  return swift_willThrow();
}

void sub_23DBA85E4()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_25431E080)
  {
    v0 = sub_23DBAB2E4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_25431E080);
  }
}

unint64_t sub_23DBA864C()
{
  unint64_t result;

  result = qword_256CE8B90;
  if (!qword_256CE8B90)
  {
    result = MEMORY[0x24263D114](&protocol conformance descriptor for LegacyFavoritesManagerSupport.Failure, &type metadata for LegacyFavoritesManagerSupport.Failure);
    atomic_store(result, (unint64_t *)&qword_256CE8B90);
  }
  return result;
}

unint64_t LegacyFavoritesManagerSupport.Failure.debugDescription.getter()
{
  return 0xD00000000000002BLL;
}

uint64_t static LegacyFavoritesManagerSupport.Failure.== infix(_:_:)()
{
  return 1;
}

uint64_t LegacyFavoritesManagerSupport.Failure.hash(into:)()
{
  return sub_23DBAB590();
}

uint64_t LegacyFavoritesManagerSupport.Failure.hashValue.getter()
{
  sub_23DBAB584();
  sub_23DBAB590();
  return sub_23DBAB59C();
}

unint64_t sub_23DBA8718()
{
  return 0xD00000000000002BLL;
}

uint64_t sub_23DBA8734(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_23DBA8804(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_23DBA4CB4((uint64_t)v12, *a3);
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
      sub_23DBA4CB4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_23DBA8804(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_23DBAB428();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_23DBA89BC(a5, a6);
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
  v8 = sub_23DBAB4A0();
  if (!v8)
  {
    sub_23DBAB4E8();
    __break(1u);
LABEL_17:
    result = sub_23DBAB50C();
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

uint64_t sub_23DBA89BC(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_23DBA8A50(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_23DBA8C3C(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_23DBA8C3C(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_23DBA8A50(uint64_t a1, unint64_t a2)
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
      v3 = sub_23DBA8BC4(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_23DBAB488();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_23DBAB4E8();
      __break(1u);
LABEL_10:
      v2 = sub_23DBAB32C();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_23DBAB50C();
    __break(1u);
LABEL_14:
    result = sub_23DBAB4E8();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_23DBA8BC4(uint64_t a1, uint64_t a2)
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
  sub_23DBA5020(0, &qword_256CE8BA0, MEMORY[0x24BEE4260], MEMORY[0x24BEE3598]);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_23DBA8C3C(char a1, int64_t a2, char a3, char *a4)
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
    sub_23DBA5020(0, &qword_256CE8BA0, MEMORY[0x24BEE4260], MEMORY[0x24BEE3598]);
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
  result = sub_23DBAB50C();
  __break(1u);
  return result;
}

unint64_t sub_23DBA8D9C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_23DBAB584();
  sub_23DBAB314();
  v4 = sub_23DBAB59C();
  return sub_23DBA8EF4(a1, a2, v4);
}

unint64_t sub_23DBA8E04()
{
  unint64_t result;

  result = qword_256CE8B98;
  if (!qword_256CE8B98)
  {
    result = MEMORY[0x24263D114](&protocol conformance descriptor for LegacyFavoritesManagerSupport.Failure, &type metadata for LegacyFavoritesManagerSupport.Failure);
    atomic_store(result, (unint64_t *)&qword_256CE8B98);
  }
  return result;
}

ValueMetadata *type metadata accessor for LegacyFavoritesManagerSupport()
{
  return &type metadata for LegacyFavoritesManagerSupport;
}

uint64_t storeEnumTagSinglePayload for LegacyFavoritesManagerSupport.Failure(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_23DBA8E98 + 4 * byte_23DBAC120[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_23DBA8EB8 + 4 * byte_23DBAC125[v4]))();
}

_BYTE *sub_23DBA8E98(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_23DBA8EB8(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23DBA8EC0(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23DBA8EC8(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_23DBA8ED0(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_23DBA8ED8(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for LegacyFavoritesManagerSupport.Failure()
{
  return &type metadata for LegacyFavoritesManagerSupport.Failure;
}

unint64_t sub_23DBA8EF4(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_23DBAB53C() & 1) == 0)
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
      while (!v14 && (sub_23DBAB53C() & 1) == 0);
    }
  }
  return v6;
}

uint64_t HDCodablePinnedContentState.Failure.debugDescription.getter()
{
  sub_23DBAB47C();
  swift_bridgeObjectRelease();
  sub_23DBAB320();
  sub_23DBAB320();
  return 543516756;
}

id HDCodablePinnedContentState.init(pinnedIdentifiers:)(uint64_t a1)
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
  id result;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  void *v21;
  _QWORD v22[2];
  char v23;

  v2 = sub_23DBAB26C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2, v4);
  v6 = (char *)v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for CoherentPinnedContentState();
  MEMORY[0x24BDAC7A8](v7, v8);
  v10 = (char *)v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  if (result)
  {
    *(_QWORD *)&v10[*(int *)(v7 + 24)] = MEMORY[0x24BEE4B00];
    v23 = 1;
    v12 = result;
    sub_23DBAB248();
    v22[1] = a1;
    sub_23DBA5020(0, (unint64_t *)&unk_25431E0A0, MEMORY[0x24BEE0D00], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE1250]);
    sub_23DBA92D4();
    sub_23DBAB218();
    sub_23DBAB2D8();
    v13 = (void *)sub_23DBAB2CC();
    v14 = v2;
    (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v6, *MEMORY[0x24BE184E0], v2);
    sub_23DBA6F40(&qword_25431DFB0, (uint64_t (*)(uint64_t))type metadata accessor for CoherentPinnedContentState, (uint64_t)&unk_23DBABF5C);
    v15 = v22[0];
    v16 = sub_23DBAB284();
    if (v15)
    {

      (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    }
    else
    {
      v18 = v16;
      v19 = v17;
      v20 = sub_23DBAB098();
      v22[0] = v14;
      v21 = (void *)v20;
      sub_23DBA9370(v18, v19);
      objc_msgSend(v12, sel_setPinnedContentStateData_, v21);

      (*(void (**)(char *, _QWORD))(v3 + 8))(v6, v22[0]);
    }
    sub_23DBA9334((uint64_t)v10);
    return v12;
  }
  else
  {
    __break(1u);
  }
  return result;
}

unint64_t sub_23DBA92D4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25431E078;
  if (!qword_25431E078)
  {
    sub_23DBA5020(255, (unint64_t *)&unk_25431E0A0, MEMORY[0x24BEE0D00], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE1250]);
    result = MEMORY[0x24263D114](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_25431E078);
  }
  return result;
}

uint64_t sub_23DBA9334(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for CoherentPinnedContentState();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_23DBA9370(uint64_t a1, unint64_t a2)
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

uint64_t HDCodablePinnedContentState.makeCopy()()
{
  void *v0;
  uint64_t v2;

  swift_getObjectType();
  objc_msgSend(v0, sel_copy);
  sub_23DBAB434();
  swift_unknownObjectRelease();
  swift_dynamicCast();
  return v2;
}

BOOL HDCodablePinnedContentState.isEqual(_:)(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _BOOL8 v13;
  char v15;
  id v16;
  id v17;
  _QWORD v18[2];
  _BYTE v19[24];
  uint64_t v20;

  v2 = v1;
  v4 = type metadata accessor for CoherentPinnedContentState();
  v6 = MEMORY[0x24BDAC7A8](v4, v5);
  v8 = (char *)v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6, v9);
  v11 = (char *)v18 - v10;
  sub_23DBA4D50(a1, (uint64_t)v19);
  if (!v20)
  {
    sub_23DBA82B4((uint64_t)v19);
    return 0;
  }
  sub_23DBA95C8();
  if ((swift_dynamicCast() & 1) == 0)
    return 0;
  v12 = (void *)v18[1];
  sub_23DBA9604();
  sub_23DBA9604();
  v15 = sub_23DBAB1B8();
  if ((v15 & 1) != 0)
  {
    v16 = objc_msgSend(v2, sel_epoch);
    v17 = objc_msgSend(v12, sel_epoch);

    v13 = v16 == v17;
  }
  else
  {

    v13 = 0;
  }
  sub_23DBA9334((uint64_t)v8);
  sub_23DBA9334((uint64_t)v11);
  return v13;
}

unint64_t sub_23DBA95C8()
{
  unint64_t result;

  result = qword_256CE8BA8;
  if (!qword_256CE8BA8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_256CE8BA8);
  }
  return result;
}

uint64_t sub_23DBA9604()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  uint64_t v14;

  swift_getObjectType();
  v1 = objc_msgSend(v0, sel_pinnedContentStateData);
  if (v1)
  {
    v2 = v1;
    sub_23DBAB0A4();

    type metadata accessor for CoherentPinnedContentState();
    sub_23DBA6F40(&qword_25431DFB0, (uint64_t (*)(uint64_t))type metadata accessor for CoherentPinnedContentState, (uint64_t)&unk_23DBABF5C);
    return sub_23DBAB290();
  }
  else
  {
    if (qword_25431E100 != -1)
      swift_once();
    v4 = sub_23DBAB0EC();
    __swift_project_value_buffer(v4, (uint64_t)qword_25431E160);
    v5 = sub_23DBAB0D4();
    v6 = sub_23DBAB3EC();
    if (os_log_type_enabled(v5, v6))
    {
      v7 = swift_slowAlloc();
      v8 = swift_slowAlloc();
      v14 = v8;
      *(_DWORD *)v7 = 136315394;
      v9 = sub_23DBAB5A8();
      sub_23DBA8734(v9, v10, &v14);
      sub_23DBAB41C();
      swift_bridgeObjectRelease();
      *(_WORD *)(v7 + 12) = 2080;
      v11 = sub_23DBAB308();
      sub_23DBA8734(v11, v12, &v14);
      sub_23DBAB41C();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_23DB9B000, v5, v6, "[%s]: Underlying data is missing: %s", (uint8_t *)v7, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x24263D18C](v8, -1, -1);
      MEMORY[0x24263D18C](v7, -1, -1);
    }

    sub_23DBAB044();
    swift_allocError();
    *v13 = 0xD000000000000016;
    v13[1] = 0x800000023DBAC9C0;
    return swift_willThrow();
  }
}

BOOL sub_23DBA98AC(void *a1, uint64_t a2, uint64_t a3)
{
  id v4;
  id v5;
  BOOL v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = a1;
    swift_unknownObjectRetain();
    sub_23DBAB434();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = a1;
  }
  v6 = HDCodablePinnedContentState.isEqual(_:)((uint64_t)v8);

  sub_23DBA82B4((uint64_t)v8);
  return v6;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> HDCodablePinnedContentState.setShouldRespectOrder()()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
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
  unint64_t v14;
  unint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  char v19;

  v2 = v0;
  v3 = sub_23DBAB26C();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3, v5);
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for CoherentPinnedContentState();
  MEMORY[0x24BDAC7A8](v8, v9);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DBA9604();
  if (!v1)
  {
    v19 = 1;
    sub_23DBA6950();
    sub_23DBAB230();
    sub_23DBAB2D8();
    v12 = (void *)sub_23DBAB2CC();
    (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v7, *MEMORY[0x24BE184E0], v3);
    sub_23DBA6F40(&qword_25431DFB0, (uint64_t (*)(uint64_t))type metadata accessor for CoherentPinnedContentState, (uint64_t)&unk_23DBABF5C);
    v13 = sub_23DBAB284();
    v15 = v14;
    v18 = sub_23DBAB098();
    sub_23DBA9370(v13, v15);
    v16 = (void *)v18;
    objc_msgSend(v2, sel_setPinnedContentStateData_, v18);

    (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
    sub_23DBA9334((uint64_t)v11);
  }
}

uint64_t sub_23DBA9ADC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  void *v18;
  char *v19;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  void *v24;
  id v25;
  char *v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v28 = a5;
  v31 = a4;
  v9 = sub_23DBAB26C();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9, v11);
  v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for CoherentPinnedContentState();
  MEMORY[0x24BDAC7A8](v14, v15);
  v17 = (char *)&v25 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DBA9604();
  if (!v5)
  {
    v25 = a1;
    v26 = v13;
    v27 = v10;
    sub_23DBA5464(v31, v28 & 1);
    v29 = a2;
    v30 = a3;
    v31 = a3;
    sub_23DBA69B4();
    sub_23DBAB1D0();
    sub_23DBAB2D8();
    v18 = (void *)sub_23DBAB2CC();
    v19 = v26;
    (*(void (**)(char *, _QWORD, uint64_t))(v27 + 104))(v26, *MEMORY[0x24BE184E0], v9);
    sub_23DBA6F40(&qword_25431DFB0, (uint64_t (*)(uint64_t))type metadata accessor for CoherentPinnedContentState, (uint64_t)&unk_23DBABF5C);
    v21 = sub_23DBAB284();
    v23 = v22;
    v24 = (void *)sub_23DBAB098();
    sub_23DBA9370(v21, v23);
    objc_msgSend(v25, sel_setPinnedContentStateData_, v24);

    (*(void (**)(char *, uint64_t))(v27 + 8))(v19, v9);
    sub_23DBA9334((uint64_t)v17);
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_23DBA9D08(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  void *v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v25 = a3;
  v6 = sub_23DBAB26C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6, v8);
  v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for CoherentPinnedContentState();
  MEMORY[0x24BDAC7A8](v11, v12);
  v14 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DBA9604();
  if (!v3)
  {
    v23 = a2;
    v24 = v25;
    sub_23DBA69B4();
    sub_23DBAB1E8();
    swift_bridgeObjectRelease();
    sub_23DBAB2D8();
    v15 = (void *)sub_23DBAB2CC();
    (*(void (**)(char *, _QWORD, uint64_t))(v7 + 104))(v10, *MEMORY[0x24BE184E0], v6);
    sub_23DBA6F40(&qword_25431DFB0, (uint64_t (*)(uint64_t))type metadata accessor for CoherentPinnedContentState, (uint64_t)&unk_23DBABF5C);
    v16 = sub_23DBAB284();
    v18 = v17;
    v22 = sub_23DBAB098();
    sub_23DBA9370(v16, v18);
    v19 = (void *)v22;
    objc_msgSend(a1, sel_setPinnedContentStateData_, v22);

    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    sub_23DBA9334((uint64_t)v14);
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_23DBA9EE8(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
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
  uint64_t v18;
  void (*v19)(char *, _QWORD, uint64_t);
  char *v20;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  void *v25;
  uint64_t v26;
  id v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;

  v30 = a4;
  v8 = sub_23DBAB26C();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8, v10);
  v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for CoherentPinnedContentState();
  MEMORY[0x24BDAC7A8](v13, v14);
  v16 = (char *)&v26 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DBA9604();
  if (!v4)
  {
    v27 = a1;
    v28 = v12;
    v29 = a3;
    sub_23DBA5918(a2, a3, v30);
    sub_23DBAB2D8();
    v17 = (void *)sub_23DBAB2CC();
    v18 = v9;
    v19 = *(void (**)(char *, _QWORD, uint64_t))(v9 + 104);
    v20 = v28;
    v19(v28, *MEMORY[0x24BE184E0], v8);
    sub_23DBA6F40(&qword_25431DFB0, (uint64_t (*)(uint64_t))type metadata accessor for CoherentPinnedContentState, (uint64_t)&unk_23DBABF5C);
    v22 = sub_23DBAB284();
    v24 = v23;
    v25 = (void *)sub_23DBAB098();
    sub_23DBA9370(v22, v24);
    objc_msgSend(v27, sel_setPinnedContentStateData_, v25);

    (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v8);
    sub_23DBA9334((uint64_t)v16);
  }
  return swift_bridgeObjectRelease();
}

id HDCodablePinnedContentState.getPinnedContent()()
{
  id v0;
  uint64_t v1;
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
  char v12;
  uint64_t v13;
  objc_class *v14;
  _BYTE *v15;
  uint64_t v17;
  objc_super v18;
  char v19;

  sub_23DBA69B4();
  v3 = v2;
  v4 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2, v5);
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for CoherentPinnedContentState();
  MEMORY[0x24BDAC7A8](v8, v9);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DBA9604();
  if (!v1)
  {
    sub_23DBA6950();
    sub_23DBAB224();
    v12 = v19;
    (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v7, &v11[*(int *)(v8 + 20)], v3);
    sub_23DBA6F40(&qword_25431E068, (uint64_t (*)(uint64_t))sub_23DBA69B4, MEMORY[0x24BE18330]);
    v13 = sub_23DBAB338();
    v14 = (objc_class *)type metadata accessor for PinnedContentState();
    v15 = objc_allocWithZone(v14);
    v15[OBJC_IVAR___HAHDPinnedContentState_shouldRespectOrder] = v12;
    *(_QWORD *)&v15[OBJC_IVAR___HAHDPinnedContentState_identifiers] = v13;
    v18.receiver = v15;
    v18.super_class = v14;
    v0 = objc_msgSendSuper2(&v18, sel_init);
    sub_23DBA9334((uint64_t)v11);
  }
  return v0;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> HDCodablePinnedContentState.pinContentWithIdentifier(_:at:)(Swift::String _, Swift::Int_optional at)
{
  void *v2;
  Swift::Int value;
  void *object;
  uint64_t countAndFlagsBits;
  _BOOL4 is_nil;

  value = at.value;
  object = _._object;
  countAndFlagsBits = _._countAndFlagsBits;
  is_nil = at.is_nil;
  swift_bridgeObjectRetain();
  sub_23DBA9ADC(v2, countAndFlagsBits, (uint64_t)object, value, is_nil);
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> HDCodablePinnedContentState.unpinContentWithIdentifier(_:)(Swift::String a1)
{
  void *v1;
  void *object;
  uint64_t countAndFlagsBits;

  object = a1._object;
  countAndFlagsBits = a1._countAndFlagsBits;
  swift_bridgeObjectRetain();
  sub_23DBA9D08(v1, countAndFlagsBits, (uint64_t)object);
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> HDCodablePinnedContentState.unpinContent(at:)(Swift::Int at)
{
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;

  v3 = v1;
  v5 = sub_23DBAB26C();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5, v7);
  v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for CoherentPinnedContentState();
  MEMORY[0x24BDAC7A8](v10, v11);
  v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DBA9604();
  if (!v2)
  {
    sub_23DBA56BC(at);
    sub_23DBAB2D8();
    v14 = (void *)sub_23DBAB2CC();
    (*(void (**)(char *, _QWORD, uint64_t))(v6 + 104))(v9, *MEMORY[0x24BE184E0], v5);
    sub_23DBA6F40(&qword_25431DFB0, (uint64_t (*)(uint64_t))type metadata accessor for CoherentPinnedContentState, (uint64_t)&unk_23DBABF5C);
    v15 = sub_23DBAB284();
    v17 = v16;
    v20 = sub_23DBAB098();
    sub_23DBA9370(v15, v17);
    v18 = (void *)v20;
    objc_msgSend(v3, sel_setPinnedContentStateData_, v20);

    (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
    sub_23DBA9334((uint64_t)v13);
  }
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> HDCodablePinnedContentState.movePinnedContentWithIdentifier(_:to:)(Swift::String _, Swift::Int to)
{
  void *v2;
  void *object;
  uint64_t countAndFlagsBits;

  object = _._object;
  countAndFlagsBits = _._countAndFlagsBits;
  swift_bridgeObjectRetain();
  sub_23DBA9EE8(v2, countAndFlagsBits, (uint64_t)object, to);
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> HDCodablePinnedContentState.unpinAllContentInDomain()()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
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
  unint64_t v14;
  unint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;

  v2 = v0;
  v3 = sub_23DBAB26C();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3, v5);
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for CoherentPinnedContentState();
  MEMORY[0x24BDAC7A8](v8, v9);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DBA9604();
  if (!v1)
  {
    sub_23DBA69B4();
    sub_23DBAB200();
    sub_23DBAB2D8();
    v12 = (void *)sub_23DBAB2CC();
    (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v7, *MEMORY[0x24BE184E0], v3);
    sub_23DBA6F40(&qword_25431DFB0, (uint64_t (*)(uint64_t))type metadata accessor for CoherentPinnedContentState, (uint64_t)&unk_23DBABF5C);
    v13 = sub_23DBAB284();
    v15 = v14;
    v18 = sub_23DBAB098();
    sub_23DBA9370(v13, v15);
    v16 = (void *)v18;
    objc_msgSend(v2, sel_setPinnedContentStateData_, v18);

    (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
    sub_23DBA9334((uint64_t)v11);
  }
}

uint64_t HDCodablePinnedContentState.merge(with:)()
{
  void *v0;
  uint64_t v1;
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
  uint64_t result;
  void *v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;

  v2 = sub_23DBAB26C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2, v4);
  v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for CoherentPinnedContentState();
  v9 = MEMORY[0x24BDAC7A8](v7, v8);
  v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9, v12);
  v14 = (char *)&v21 - v13;
  result = sub_23DBA9604();
  if (!v1)
  {
    v23 = v0;
    sub_23DBA9604();
    sub_23DBA6F40(&qword_25431DF80, (uint64_t (*)(uint64_t))type metadata accessor for CoherentPinnedContentState, (uint64_t)&unk_23DBABF34);
    sub_23DBAB17C();
    sub_23DBAB2D8();
    v16 = (void *)sub_23DBAB2CC();
    (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v6, *MEMORY[0x24BE184E0], v2);
    sub_23DBA6F40(&qword_25431DFB0, (uint64_t (*)(uint64_t))type metadata accessor for CoherentPinnedContentState, (uint64_t)&unk_23DBABF5C);
    v17 = sub_23DBAB284();
    v19 = v18;
    v22 = sub_23DBAB098();
    sub_23DBA9370(v17, v19);
    v20 = (void *)v22;
    objc_msgSend(v23, sel_setPinnedContentStateData_, v22);

    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    sub_23DBA9334((uint64_t)v11);
    return sub_23DBA9334((uint64_t)v14);
  }
  return result;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> HDCodablePinnedContentState.purgeCoherentMetadataAndIncrementEpoch()()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
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
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  void *v28;
  id v29;
  char *v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  char v38;

  v2 = sub_23DBAB26C();
  v35 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2, v3);
  v34 = (char *)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23DBA69B4();
  v6 = v5;
  v7 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5, v8);
  v10 = (char *)&v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for CoherentPinnedContentState();
  v13 = MEMORY[0x24BDAC7A8](v11, v12);
  v15 = (char *)&v31 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13, v16);
  v18 = (char *)&v31 - v17;
  sub_23DBA9604();
  if (!v1)
  {
    v32 = v0;
    sub_23DBA6950();
    sub_23DBAB224();
    v33 = v2;
    v19 = v38;
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v10, &v18[*(int *)(v11 + 20)], v6);
    sub_23DBA6F40(&qword_25431E068, (uint64_t (*)(uint64_t))sub_23DBA69B4, MEMORY[0x24BE18330]);
    v20 = sub_23DBAB338();
    *(_QWORD *)&v15[*(int *)(v11 + 24)] = MEMORY[0x24BEE4B00];
    v37 = v19;
    v21 = v33;
    sub_23DBAB248();
    v36 = v20;
    sub_23DBA5020(0, (unint64_t *)&unk_25431E0A0, MEMORY[0x24BEE0D00], (uint64_t (*)(_QWORD, uint64_t))MEMORY[0x24BEE1250]);
    sub_23DBA92D4();
    sub_23DBAB218();
    sub_23DBA9334((uint64_t)v18);
    sub_23DBAABF0((uint64_t)v15, (uint64_t)v18);
    sub_23DBAB2D8();
    v22 = (void *)sub_23DBAB2CC();
    v24 = v34;
    v23 = v35;
    (*(void (**)(char *, _QWORD, uint64_t))(v35 + 104))(v34, *MEMORY[0x24BE184E0], v21);
    sub_23DBA6F40(&qword_25431DFB0, (uint64_t (*)(uint64_t))type metadata accessor for CoherentPinnedContentState, (uint64_t)&unk_23DBABF5C);
    v25 = sub_23DBAB284();
    v27 = v26;
    v28 = (void *)sub_23DBAB098();
    sub_23DBA9370(v25, v27);
    v29 = v32;
    objc_msgSend(v32, sel_setPinnedContentStateData_, v28);

    (*(void (**)(char *, uint64_t))(v23 + 8))(v24, v21);
    sub_23DBA9334((uint64_t)v18);
    v30 = (char *)objc_msgSend(v29, sel_epoch);
    if (__OFADD__(v30, 1))
      __break(1u);
    else
      objc_msgSend(v29, sel_setEpoch_, v30 + 1);
  }
}

uint64_t sub_23DBAABF0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for CoherentPinnedContentState();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t HDCodablePinnedContentState.logDescription.getter()
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
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v19[2];

  swift_getObjectType();
  sub_23DBA69B4();
  v1 = v0;
  v2 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0, v3);
  v5 = (char *)&v19[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for CoherentPinnedContentState();
  v8 = MEMORY[0x24BDAC7A8](v6, v7);
  v10 = (char *)&v19[-1] - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8, v11);
  v13 = (char *)&v19[-1] - v12;
  sub_23DBA9604();
  v19[0] = 0;
  v19[1] = 0xE000000000000000;
  sub_23DBAB47C();
  swift_bridgeObjectRelease();
  strcpy((char *)v19, "identifiers=");
  BYTE5(v19[1]) = 0;
  HIWORD(v19[1]) = -5120;
  (*(void (**)(char *, char *, uint64_t))(v2 + 16))(v5, &v13[*(int *)(v6 + 20)], v1);
  sub_23DBA6F40(&qword_25431E068, (uint64_t (*)(uint64_t))sub_23DBA69B4, MEMORY[0x24BE18330]);
  sub_23DBAB338();
  MEMORY[0x24263CBE0]();
  sub_23DBAB320();
  swift_release();
  swift_bridgeObjectRelease();
  sub_23DBAB320();
  sub_23DBAAEBC((uint64_t)v13, (uint64_t)v10);
  sub_23DBAB308();
  sub_23DBAB320();
  swift_bridgeObjectRelease();
  sub_23DBA9334((uint64_t)v13);
  v19[0] = 0;
  v19[1] = 0xE000000000000000;
  sub_23DBAB47C();
  v14 = sub_23DBAB5A8();
  v16 = v15;
  swift_bridgeObjectRelease();
  v19[0] = v14;
  v19[1] = v16;
  sub_23DBAB320();
  sub_23DBAB320();
  swift_bridgeObjectRelease();
  return v19[0];
}

uint64_t sub_23DBAAEBC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for CoherentPinnedContentState();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_QWORD *_s7FailureOwCP(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t _s7FailureOwxx()
{
  return swift_bridgeObjectRelease();
}

_QWORD *_s7FailureOwca(_QWORD *a1, _QWORD *a2)
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

_QWORD *_s7FailureOwta(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s7FailureOwet(uint64_t a1, int a2)
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

uint64_t _s7FailureOwst(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for HDCodablePinnedContentState.Failure()
{
  return &type metadata for HDCodablePinnedContentState.Failure;
}

unint64_t sub_23DBAB044()
{
  unint64_t result;

  result = qword_256CE8BB0;
  if (!qword_256CE8BB0)
  {
    result = MEMORY[0x24263D114](&protocol conformance descriptor for HDCodablePinnedContentState.Failure, &type metadata for HDCodablePinnedContentState.Failure);
    atomic_store(result, (unint64_t *)&qword_256CE8BB0);
  }
  return result;
}

uint64_t sub_23DBAB08C()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_23DBAB098()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_23DBAB0A4()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_23DBAB0B0()
{
  return MEMORY[0x24BDCE9D0]();
}

uint64_t sub_23DBAB0BC()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_23DBAB0C8()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_23DBAB0D4()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_23DBAB0E0()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_23DBAB0EC()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_23DBAB0F8()
{
  return MEMORY[0x24BE17F40]();
}

uint64_t sub_23DBAB104()
{
  return MEMORY[0x24BE17F48]();
}

uint64_t sub_23DBAB110()
{
  return MEMORY[0x24BE17F50]();
}

uint64_t sub_23DBAB11C()
{
  return MEMORY[0x24BE17F58]();
}

uint64_t sub_23DBAB128()
{
  return MEMORY[0x24BE17F60]();
}

uint64_t sub_23DBAB134()
{
  return MEMORY[0x24BE17F68]();
}

uint64_t sub_23DBAB140()
{
  return MEMORY[0x24BE17F70]();
}

uint64_t sub_23DBAB14C()
{
  return MEMORY[0x24BE17F78]();
}

uint64_t sub_23DBAB158()
{
  return MEMORY[0x24BE17F80]();
}

uint64_t sub_23DBAB164()
{
  return MEMORY[0x24BE17F88]();
}

uint64_t sub_23DBAB170()
{
  return MEMORY[0x24BE17F90]();
}

uint64_t sub_23DBAB17C()
{
  return MEMORY[0x24BE17F98]();
}

uint64_t sub_23DBAB188()
{
  return MEMORY[0x24BE17FA0]();
}

uint64_t sub_23DBAB194()
{
  return MEMORY[0x24BE17FA8]();
}

uint64_t sub_23DBAB1A0()
{
  return MEMORY[0x24BE17FB0]();
}

uint64_t sub_23DBAB1AC()
{
  return MEMORY[0x24BE17FB8]();
}

uint64_t sub_23DBAB1B8()
{
  return MEMORY[0x24BE18288]();
}

uint64_t sub_23DBAB1C4()
{
  return MEMORY[0x24BE18298]();
}

uint64_t sub_23DBAB1D0()
{
  return MEMORY[0x24BE182C8]();
}

uint64_t sub_23DBAB1DC()
{
  return MEMORY[0x24BE182D0]();
}

uint64_t sub_23DBAB1E8()
{
  return MEMORY[0x24BE182D8]();
}

uint64_t sub_23DBAB1F4()
{
  return MEMORY[0x24BE182F8]();
}

uint64_t sub_23DBAB200()
{
  return MEMORY[0x24BE18300]();
}

uint64_t sub_23DBAB20C()
{
  return MEMORY[0x24BE18310]();
}

uint64_t sub_23DBAB218()
{
  return MEMORY[0x24BE18320]();
}

uint64_t sub_23DBAB224()
{
  return MEMORY[0x24BE18368]();
}

uint64_t sub_23DBAB230()
{
  return MEMORY[0x24BE18370]();
}

uint64_t sub_23DBAB23C()
{
  return MEMORY[0x24BE18378]();
}

uint64_t sub_23DBAB248()
{
  return MEMORY[0x24BE18388]();
}

uint64_t sub_23DBAB254()
{
  return MEMORY[0x24BE183A0]();
}

uint64_t sub_23DBAB260()
{
  return MEMORY[0x24BE183A8]();
}

uint64_t sub_23DBAB26C()
{
  return MEMORY[0x24BE184E8]();
}

uint64_t sub_23DBAB278()
{
  return MEMORY[0x24BE185C0]();
}

uint64_t sub_23DBAB284()
{
  return MEMORY[0x24BE186C0]();
}

uint64_t sub_23DBAB290()
{
  return MEMORY[0x24BE186C8]();
}

uint64_t sub_23DBAB29C()
{
  return MEMORY[0x24BE18758]();
}

uint64_t sub_23DBAB2A8()
{
  return MEMORY[0x24BE18768]();
}

uint64_t sub_23DBAB2B4()
{
  return MEMORY[0x24BE189A8]();
}

uint64_t sub_23DBAB2C0()
{
  return MEMORY[0x24BE189B0]();
}

uint64_t sub_23DBAB2CC()
{
  return MEMORY[0x24BDD2020]();
}

uint64_t sub_23DBAB2D8()
{
  return MEMORY[0x24BE189D0]();
}

uint64_t sub_23DBAB2E4()
{
  return MEMORY[0x24BEE0460]();
}

uint64_t sub_23DBAB2F0()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_23DBAB2FC()
{
  return MEMORY[0x24BDCFB30]();
}

uint64_t sub_23DBAB308()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_23DBAB314()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_23DBAB320()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_23DBAB32C()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_23DBAB338()
{
  return MEMORY[0x24BEE0E00]();
}

uint64_t sub_23DBAB344()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_23DBAB350()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_23DBAB35C()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_23DBAB368()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_23DBAB374()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_23DBAB380()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_23DBAB38C()
{
  return MEMORY[0x24BEE1250]();
}

uint64_t sub_23DBAB398()
{
  return MEMORY[0x24BDCFCC0]();
}

uint64_t sub_23DBAB3A4()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_23DBAB3B0()
{
  return MEMORY[0x24BEE18A0]();
}

uint64_t sub_23DBAB3BC()
{
  return MEMORY[0x24BEE18C0]();
}

uint64_t sub_23DBAB3C8()
{
  return MEMORY[0x24BEE1910]();
}

uint64_t sub_23DBAB3D4()
{
  return MEMORY[0x24BEE1918]();
}

uint64_t sub_23DBAB3E0()
{
  return MEMORY[0x24BEE1A28]();
}

uint64_t sub_23DBAB3EC()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_23DBAB3F8()
{
  return MEMORY[0x24BDD0190]();
}

uint64_t sub_23DBAB404()
{
  return MEMORY[0x24BDD01F8]();
}

uint64_t sub_23DBAB410()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_23DBAB41C()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_23DBAB428()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_23DBAB434()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_23DBAB440()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_23DBAB44C()
{
  return MEMORY[0x24BEE23A8]();
}

uint64_t sub_23DBAB458()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_23DBAB464()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_23DBAB470()
{
  return MEMORY[0x24BEE24D8]();
}

uint64_t sub_23DBAB47C()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_23DBAB488()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_23DBAB494()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_23DBAB4A0()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_23DBAB4AC()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_23DBAB4B8()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_23DBAB4C4()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_23DBAB4D0()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_23DBAB4DC()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_23DBAB4E8()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_23DBAB4F4()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_23DBAB500()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_23DBAB50C()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_23DBAB518()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_23DBAB524()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_23DBAB530()
{
  return MEMORY[0x24BEE3A20]();
}

uint64_t sub_23DBAB53C()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_23DBAB548()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_23DBAB554()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_23DBAB560()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_23DBAB56C()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_23DBAB578()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_23DBAB584()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_23DBAB590()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_23DBAB59C()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_23DBAB5A8()
{
  return MEMORY[0x24BEE4A98]();
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
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

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getExistentialTypeMetadata()
{
  return MEMORY[0x24BEE4D28]();
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

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
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

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x24BEE4F88]();
}

