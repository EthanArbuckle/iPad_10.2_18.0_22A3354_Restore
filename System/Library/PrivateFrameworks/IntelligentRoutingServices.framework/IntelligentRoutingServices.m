uint64_t static PlatformInfo.isInternalBuild.getter()
{
  uint64_t has_internal_content;

  String.utf8CString.getter();
  has_internal_content = os_variant_has_internal_content();
  swift_release();
  return has_internal_content;
}

ValueMetadata *type metadata accessor for PlatformInfo()
{
  return &type metadata for PlatformInfo;
}

uint64_t DarwinNotificationHelper.__deallocating_deinit()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  int64_t v7;
  uint64_t result;
  int64_t v9;
  unint64_t v10;
  unint64_t v11;
  int64_t v12;
  unint64_t v13;
  int64_t v14;
  objc_super v15;

  v1 = &v0[OBJC_IVAR____TtC26IntelligentRoutingServices24DarwinNotificationHelper_registrations];
  swift_beginAccess();
  v2 = *(_QWORD *)v1;
  v3 = v2 + 64;
  v4 = 1 << *(_BYTE *)(v2 + 32);
  v5 = -1;
  if (v4 < 64)
    v5 = ~(-1 << v4);
  v6 = v5 & *(_QWORD *)(v2 + 64);
  v7 = (unint64_t)(v4 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v9 = 0;
  while (1)
  {
    if (v6)
    {
      v10 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      v11 = v10 | (v9 << 6);
      goto LABEL_5;
    }
    v12 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v12 >= v7)
      goto LABEL_23;
    v13 = *(_QWORD *)(v3 + 8 * v12);
    ++v9;
    if (!v13)
    {
      v9 = v12 + 1;
      if (v12 + 1 >= v7)
        goto LABEL_23;
      v13 = *(_QWORD *)(v3 + 8 * v9);
      if (!v13)
      {
        v9 = v12 + 2;
        if (v12 + 2 >= v7)
          goto LABEL_23;
        v13 = *(_QWORD *)(v3 + 8 * v9);
        if (!v13)
        {
          v9 = v12 + 3;
          if (v12 + 3 >= v7)
            goto LABEL_23;
          v13 = *(_QWORD *)(v3 + 8 * v9);
          if (!v13)
            break;
        }
      }
    }
LABEL_22:
    v6 = (v13 - 1) & v13;
    v11 = __clz(__rbit64(v13)) + (v9 << 6);
LABEL_5:
    result = notify_cancel(*(_DWORD *)(*(_QWORD *)(v2 + 56) + 40 * v11 + 16));
  }
  v14 = v12 + 4;
  if (v14 >= v7)
  {
LABEL_23:
    swift_release();
    v15.receiver = v0;
    v15.super_class = (Class)type metadata accessor for DarwinNotificationHelper();
    return (uint64_t)objc_msgSendSuper2(&v15, sel_dealloc);
  }
  v13 = *(_QWORD *)(v3 + 8 * v14);
  if (v13)
  {
    v9 = v14;
    goto LABEL_22;
  }
  while (1)
  {
    v9 = v14 + 1;
    if (__OFADD__(v14, 1))
      break;
    if (v9 >= v7)
      goto LABEL_23;
    v13 = *(_QWORD *)(v3 + 8 * v9);
    ++v14;
    if (v13)
      goto LABEL_22;
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t type metadata accessor for DarwinNotificationHelper()
{
  return objc_opt_self();
}

uint64_t DarwinNotificationHelper.addObserver(forNotificationName:handler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  char *v4;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  void *v13;
  NSObject *v14;
  char v15;
  uint64_t result;
  _QWORD *v17;
  uint64_t v18;
  void *v19;
  char *v20;
  char isEscapingClosureAtFileLocation;
  uint64_t v22;
  _QWORD aBlock[6];
  unsigned __int8 v25;

  v9 = type metadata accessor for DispatchPredicate();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8]();
  v12 = (_QWORD *)((char *)&aBlock[-1] - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  v13 = *(void **)&v4[OBJC_IVAR____TtC26IntelligentRoutingServices24DarwinNotificationHelper_queue];
  *v12 = v13;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v10 + 104))(v12, *MEMORY[0x24BEE5608], v9);
  v14 = v13;
  v15 = _dispatchPreconditionTest(_:)();
  result = (*(uint64_t (**)(_QWORD *, uint64_t))(v10 + 8))(v12, v9);
  if ((v15 & 1) != 0)
  {
    v25 = 0;
    v17 = (_QWORD *)swift_allocObject();
    v17[2] = v4;
    v17[3] = a1;
    v17[4] = a2;
    v17[5] = a3;
    v17[6] = a4;
    v17[7] = &v25;
    v18 = swift_allocObject();
    *(_QWORD *)(v18 + 16) = partial apply for closure #1 in DarwinNotificationHelper.addObserver(forNotificationName:handler:);
    *(_QWORD *)(v18 + 24) = v17;
    aBlock[4] = partial apply for thunk for @callee_guaranteed () -> ();
    aBlock[5] = v18;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = thunk for @escaping @callee_guaranteed () -> ();
    aBlock[3] = &block_descriptor;
    v19 = _Block_copy(aBlock);
    v20 = v4;
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    swift_release();
    dispatch_sync(v14, v19);
    _Block_release(v19);
    isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
    result = swift_release();
    if ((isEscapingClosureAtFileLocation & 1) == 0)
    {
      v22 = v25;
      swift_release();
      return v22;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

void closure #1 in DarwinNotificationHelper.addObserver(forNotificationName:handler:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void (*a5)(uint64_t a1), _BYTE *a6)
{
  uint64_t *v12;
  char v13;
  NSObject *v14;
  uint64_t v15;
  _QWORD *v16;
  void *v17;
  uint64_t v18;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v20;
  int out_token;
  uint64_t aBlock;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void *v25;
  void (*v26)(uint64_t);
  _QWORD *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v12 = (uint64_t *)(a1 + OBJC_IVAR____TtC26IntelligentRoutingServices24DarwinNotificationHelper_registrations);
  swift_beginAccess();
  if (*(_QWORD *)(*v12 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    specialized __RawDictionaryStorage.find<A>(_:)(a2, a3);
    if ((v13 & 1) != 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  out_token = -1;
  v14 = *(NSObject **)(a1 + OBJC_IVAR____TtC26IntelligentRoutingServices24DarwinNotificationHelper_queue);
  v15 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = v15;
  v16[3] = a2;
  v16[4] = a3;
  v26 = partial apply for closure #1 in closure #1 in DarwinNotificationHelper.addObserver(forNotificationName:handler:);
  v27 = v16;
  aBlock = MEMORY[0x24BDAC760];
  v23 = 1107296256;
  v24 = thunk for @escaping @callee_guaranteed (@unowned Int32) -> ();
  v25 = &block_descriptor_38;
  v17 = _Block_copy(&aBlock);
  swift_bridgeObjectRetain();
  swift_release();
  v18 = String.utf8CString.getter();
  LODWORD(v14) = notify_register_dispatch((const char *)(v18 + 32), &out_token, v14, v17);
  swift_release();
  _Block_release(v17);
  if (!(_DWORD)v14 && out_token != -1)
  {
    aBlock = a2;
    v23 = a3;
    LODWORD(v24) = out_token;
    v25 = a4;
    v26 = a5;
    swift_beginAccess();
    swift_bridgeObjectRetain_n();
    swift_retain_n();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v20 = *v12;
    *v12 = 0x8000000000000000;
    specialized _NativeDictionary.setValue(_:forKey:isUnique:)((uint64_t)&aBlock, a2, a3, isUniquelyReferenced_nonNull_native);
    *v12 = v20;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_endAccess();
    swift_release();
    swift_bridgeObjectRelease();
    *a6 = 1;
  }
}

uint64_t sub_2400686FC()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

void partial apply for closure #1 in DarwinNotificationHelper.addObserver(forNotificationName:handler:)()
{
  uint64_t v0;

  closure #1 in DarwinNotificationHelper.addObserver(forNotificationName:handler:)(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(void **)(v0 + 40), *(void (**)(uint64_t))(v0 + 48), *(_BYTE **)(v0 + 56));
}

void closure #1 in closure #1 in DarwinNotificationHelper.addObserver(forNotificationName:handler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;

  v7 = type metadata accessor for DispatchPredicate();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8]();
  v10 = (uint64_t *)((char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  swift_beginAccess();
  v11 = MEMORY[0x24267C960](a2 + 16);
  if (v11)
  {
    v12 = (void *)v11;
    v13 = *(void **)(v11 + OBJC_IVAR____TtC26IntelligentRoutingServices24DarwinNotificationHelper_queue);
    *v10 = v13;
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(v8 + 104))(v10, *MEMORY[0x24BEE5610], v7);
    v14 = v13;
    LOBYTE(v13) = _dispatchPreconditionTest(_:)();
    (*(void (**)(_QWORD *, uint64_t))(v8 + 8))(v10, v7);
    if ((v13 & 1) != 0)
    {
      DarwinNotificationHelper.handleDarwinNotificationCallback(forNotificationName:)(a3, a4);

    }
    else
    {
      __break(1u);
    }
  }
}

uint64_t thunk for @escaping @callee_guaranteed (@unowned Int32) -> ()(uint64_t a1, uint64_t a2)
{
  void (*v3)(uint64_t);

  v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

uint64_t sub_240068888()
{
  return swift_deallocObject();
}

uint64_t partial apply for thunk for @callee_guaranteed () -> ()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t thunk for @escaping @callee_guaranteed () -> ()(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
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

Swift::Bool __swiftcall DarwinNotificationHelper.removeObserver(forNotificationName:)(Swift::String forNotificationName)
{
  char *v1;
  void *object;
  uint64_t countAndFlagsBits;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  void *v8;
  NSObject *v9;
  char v10;
  Swift::Bool result;
  _QWORD *v12;
  uint64_t v13;
  void *v14;
  char *v15;
  char isEscapingClosureAtFileLocation;
  Swift::Bool v17;
  _QWORD aBlock[6];
  Swift::Bool v20;

  object = forNotificationName._object;
  countAndFlagsBits = forNotificationName._countAndFlagsBits;
  v4 = type metadata accessor for DispatchPredicate();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (_QWORD *)((char *)&aBlock[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  v8 = *(void **)&v1[OBJC_IVAR____TtC26IntelligentRoutingServices24DarwinNotificationHelper_queue];
  *v7 = v8;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v5 + 104))(v7, *MEMORY[0x24BEE5608], v4);
  v9 = v8;
  v10 = _dispatchPreconditionTest(_:)();
  result = (*(uint64_t (**)(_QWORD *, uint64_t))(v5 + 8))(v7, v4);
  if ((v10 & 1) != 0)
  {
    v20 = 0;
    v12 = (_QWORD *)swift_allocObject();
    v12[2] = v1;
    v12[3] = countAndFlagsBits;
    v12[4] = object;
    v12[5] = &v20;
    v13 = swift_allocObject();
    *(_QWORD *)(v13 + 16) = partial apply for closure #1 in DarwinNotificationHelper.removeObserver(forNotificationName:);
    *(_QWORD *)(v13 + 24) = v12;
    aBlock[4] = thunk for @callee_guaranteed () -> ()partial apply;
    aBlock[5] = v13;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = thunk for @escaping @callee_guaranteed () -> ();
    aBlock[3] = &block_descriptor_13;
    v14 = _Block_copy(aBlock);
    v15 = v1;
    swift_bridgeObjectRetain();
    swift_retain();
    swift_release();
    dispatch_sync(v9, v14);
    _Block_release(v14);
    isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
    result = swift_release();
    if ((isEscapingClosureAtFileLocation & 1) == 0)
    {
      v17 = v20;
      swift_release();
      return v17;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t closure #1 in DarwinNotificationHelper.removeObserver(forNotificationName:)(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t *v7;
  uint64_t result;
  uint64_t v9;
  unint64_t v10;
  char v11;
  int v12;
  uint64_t v13[5];

  v7 = (uint64_t *)(a1 + OBJC_IVAR____TtC26IntelligentRoutingServices24DarwinNotificationHelper_registrations);
  result = swift_beginAccess();
  v9 = *v7;
  if (*(_QWORD *)(*v7 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v10 = specialized __RawDictionaryStorage.find<A>(_:)(a2, a3);
    if ((v11 & 1) == 0)
    {
      swift_bridgeObjectRelease();
      return swift_bridgeObjectRelease();
    }
    v12 = *(_DWORD *)(*(_QWORD *)(v9 + 56) + 40 * v10 + 16);
    swift_bridgeObjectRetain();
    swift_retain();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (notify_cancel(v12))
    {
      swift_release();
      return swift_bridgeObjectRelease();
    }
    swift_beginAccess();
    specialized Dictionary._Variant.removeValue(forKey:)(a2, a3, (uint64_t)v13);
    swift_endAccess();
    outlined release of DarwinNotificationHelper.DarwinNotificationRecord?(v13);
    swift_release();
    result = swift_bridgeObjectRelease();
    *a4 = 1;
  }
  return result;
}

uint64_t partial apply for closure #1 in DarwinNotificationHelper.removeObserver(forNotificationName:)()
{
  uint64_t v0;

  return closure #1 in DarwinNotificationHelper.removeObserver(forNotificationName:)(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(_BYTE **)(v0 + 40));
}

uint64_t sub_240068C20()
{
  return swift_deallocObject();
}

Swift::UInt32 __swiftcall DarwinNotificationHelper.state(forNotificationName:)(Swift::String forNotificationName)
{
  char *v1;
  void *object;
  uint64_t countAndFlagsBits;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  void *v8;
  NSObject *v9;
  char v10;
  _QWORD *v11;
  uint64_t v12;
  void *v13;
  char *v14;
  char isEscapingClosureAtFileLocation;
  unint64_t v16;
  _QWORD aBlock[6];
  _QWORD v19[2];

  object = forNotificationName._object;
  countAndFlagsBits = forNotificationName._countAndFlagsBits;
  v19[1] = *MEMORY[0x24BDAC8D0];
  v4 = type metadata accessor for DispatchPredicate();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (_QWORD *)((char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  v8 = *(void **)&v1[OBJC_IVAR____TtC26IntelligentRoutingServices24DarwinNotificationHelper_queue];
  *v7 = v8;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v5 + 104))(v7, *MEMORY[0x24BEE5608], v4);
  v9 = v8;
  v10 = _dispatchPreconditionTest(_:)();
  (*(void (**)(_QWORD *, uint64_t))(v5 + 8))(v7, v4);
  if ((v10 & 1) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  v19[0] = 0;
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = v1;
  v11[3] = countAndFlagsBits;
  v11[4] = object;
  v11[5] = v19;
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = partial apply for closure #1 in DarwinNotificationHelper.state(forNotificationName:);
  *(_QWORD *)(v12 + 24) = v11;
  aBlock[4] = thunk for @callee_guaranteed () -> ()partial apply;
  aBlock[5] = v12;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed () -> ();
  aBlock[3] = &block_descriptor_23;
  v13 = _Block_copy(aBlock);
  v14 = v1;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  dispatch_sync(v9, v13);
  _Block_release(v13);
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  if ((isEscapingClosureAtFileLocation & 1) != 0)
  {
LABEL_6:
    __break(1u);
LABEL_7:
    __break(1u);
  }
  v16 = v19[0];
  swift_release();
  if (HIDWORD(v16))
    goto LABEL_7;
  return v16;
}

uint64_t closure #1 in DarwinNotificationHelper.state(forNotificationName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t *v7;
  uint64_t result;
  uint64_t v9;
  unint64_t v10;
  char v11;
  int v12;

  v7 = (uint64_t *)(a1 + OBJC_IVAR____TtC26IntelligentRoutingServices24DarwinNotificationHelper_registrations);
  result = swift_beginAccess();
  v9 = *v7;
  if (*(_QWORD *)(v9 + 16))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v10 = specialized __RawDictionaryStorage.find<A>(_:)(a2, a3);
    if ((v11 & 1) != 0)
    {
      v12 = *(_DWORD *)(*(_QWORD *)(v9 + 56) + 40 * v10 + 16);
      swift_bridgeObjectRetain();
      swift_retain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      notify_get_state(v12, a4);
      swift_release();
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t objectdestroy_5Tm()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in DarwinNotificationHelper.state(forNotificationName:)()
{
  uint64_t v0;

  return closure #1 in DarwinNotificationHelper.state(forNotificationName:)(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(uint64_t **)(v0 + 40));
}

uint64_t sub_240068F68()
{
  return swift_deallocObject();
}

uint64_t DarwinNotificationHelper.handleDarwinNotificationCallback(forNotificationName:)(uint64_t a1, uint64_t a2)
{
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
  _QWORD *v13;
  void *v14;
  id v15;
  uint64_t result;
  uint64_t *v17;
  uint64_t v18;
  unint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD aBlock[6];
  __int128 v39;
  uint64_t v40;
  _OWORD v41[2];

  v36 = a1;
  v4 = type metadata accessor for DispatchWorkItemFlags();
  v34 = *(_QWORD *)(v4 - 8);
  v35 = v4;
  MEMORY[0x24BDAC7A8]();
  v33 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  v29 = *(_QWORD *)(v30 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for OS_dispatch_queue.Attributes();
  MEMORY[0x24BDAC7A8]();
  v32 = type metadata accessor for DispatchQoS();
  v31 = *(_QWORD *)(v32 - 8);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for DispatchPredicate();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8]();
  v13 = (uint64_t *)((char *)&v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  v14 = *(void **)(v2 + OBJC_IVAR____TtC26IntelligentRoutingServices24DarwinNotificationHelper_queue);
  *v13 = v14;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v11 + 104))(v13, *MEMORY[0x24BEE5610], v10);
  v15 = v14;
  LOBYTE(v14) = _dispatchPreconditionTest(_:)();
  result = (*(uint64_t (**)(_QWORD *, uint64_t))(v11 + 8))(v13, v10);
  if ((v14 & 1) != 0)
  {
    v17 = (uint64_t *)(v2 + OBJC_IVAR____TtC26IntelligentRoutingServices24DarwinNotificationHelper_registrations);
    result = swift_beginAccess();
    v18 = *v17;
    if (*(_QWORD *)(*v17 + 16))
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v19 = specialized __RawDictionaryStorage.find<A>(_:)(v36, a2);
      if ((v20 & 1) != 0)
      {
        v21 = *(_QWORD *)(v18 + 56) + 40 * v19;
        v39 = *(_OWORD *)v21;
        v22 = *(_QWORD *)(v21 + 24);
        v40 = *(_QWORD *)(v21 + 16);
        v23 = *(_QWORD *)(v21 + 32);
        v41[0] = v39;
        outlined retain of String((uint64_t)v41);
        swift_retain();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        type metadata accessor for OS_dispatch_queue();
        static DispatchQoS.unspecified.getter();
        aBlock[0] = MEMORY[0x24BEE4AF8];
        lazy protocol witness table accessor for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes(&lazy protocol witness table cache variable for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688], MEMORY[0x24BEE5698]);
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [OS_dispatch_queue.Attributes]);
        lazy protocol witness table accessor for type [OS_dispatch_queue.Attributes] and conformance [A](&lazy protocol witness table cache variable for type [OS_dispatch_queue.Attributes] and conformance [A], &demangling cache variable for type metadata for [OS_dispatch_queue.Attributes]);
        dispatch thunk of SetAlgebra.init<A>(_:)();
        (*(void (**)(char *, _QWORD, uint64_t))(v29 + 104))(v7, *MEMORY[0x24BEE5750], v30);
        v24 = (void *)OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
        v25 = swift_allocObject();
        *(_OWORD *)(v25 + 16) = v39;
        *(_QWORD *)(v25 + 32) = v40;
        *(_QWORD *)(v25 + 40) = v22;
        *(_QWORD *)(v25 + 48) = v23;
        aBlock[4] = partial apply for closure #1 in DarwinNotificationHelper.handleDarwinNotificationCallback(forNotificationName:);
        aBlock[5] = v25;
        aBlock[0] = MEMORY[0x24BDAC760];
        aBlock[1] = 1107296256;
        aBlock[2] = thunk for @escaping @callee_guaranteed @Sendable () -> ();
        aBlock[3] = &block_descriptor_29;
        v26 = _Block_copy(aBlock);
        outlined retain of String((uint64_t)v41);
        swift_retain();
        static DispatchQoS.unspecified.getter();
        v37 = MEMORY[0x24BEE4AF8];
        lazy protocol witness table accessor for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes(&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
        lazy protocol witness table accessor for type [OS_dispatch_queue.Attributes] and conformance [A](&lazy protocol witness table cache variable for type [DispatchWorkItemFlags] and conformance [A], &demangling cache variable for type metadata for [DispatchWorkItemFlags]);
        v27 = v33;
        v28 = v35;
        dispatch thunk of SetAlgebra.init<A>(_:)();
        MEMORY[0x24267C6CC](0, v9, v27, v26);
        _Block_release(v26);

        outlined release of String((uint64_t)v41);
        swift_release();
        (*(void (**)(char *, uint64_t))(v34 + 8))(v27, v28);
        (*(void (**)(char *, uint64_t))(v31 + 8))(v9, v32);
        return swift_release();
      }
      else
      {
        swift_bridgeObjectRelease();
        return swift_bridgeObjectRelease();
      }
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t thunk for @escaping @callee_guaranteed @Sendable () -> ()(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

id DarwinNotificationHelper.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id DarwinNotificationHelper.init()()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t (*v4)(uint64_t);
  char *v5;
  objc_class *v6;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v11;
  uint64_t v12;

  v10 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  v1 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for OS_dispatch_queue.Attributes();
  v4 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688];
  MEMORY[0x24BDAC7A8]();
  type metadata accessor for DispatchQoS();
  MEMORY[0x24BDAC7A8]();
  *(_QWORD *)&v0[OBJC_IVAR____TtC26IntelligentRoutingServices24DarwinNotificationHelper_registrations] = MEMORY[0x24BEE4B00];
  v9 = OBJC_IVAR____TtC26IntelligentRoutingServices24DarwinNotificationHelper_queue;
  v8 = type metadata accessor for OS_dispatch_queue();
  v5 = v0;
  static DispatchQoS.unspecified.getter();
  v12 = MEMORY[0x24BEE4AF8];
  lazy protocol witness table accessor for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes(&lazy protocol witness table cache variable for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes, v4, MEMORY[0x24BEE5698]);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [OS_dispatch_queue.Attributes]);
  lazy protocol witness table accessor for type [OS_dispatch_queue.Attributes] and conformance [A](&lazy protocol witness table cache variable for type [OS_dispatch_queue.Attributes] and conformance [A], &demangling cache variable for type metadata for [OS_dispatch_queue.Attributes]);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x24BEE5750], v10);
  *(_QWORD *)&v0[v9] = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();

  v6 = (objc_class *)type metadata accessor for DarwinNotificationHelper();
  v11.receiver = v5;
  v11.super_class = v6;
  return objc_msgSendSuper2(&v11, sel_init);
}

unint64_t type metadata accessor for OS_dispatch_queue()
{
  unint64_t result;

  result = lazy cache variable for type metadata for OS_dispatch_queue;
  if (!lazy cache variable for type metadata for OS_dispatch_queue)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for OS_dispatch_queue);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24267C8DC]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24267C8E8](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t method lookup function for DarwinNotificationHelper()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of DarwinNotificationHelper.addObserver(forNotificationName:handler:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of DarwinNotificationHelper.removeObserver(forNotificationName:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of DarwinNotificationHelper.state(forNotificationName:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x88))();
}

uint64_t initializeBufferWithCopyOfBuffer for DarwinNotificationHelper.DarwinNotificationRecord(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for DarwinNotificationHelper.DarwinNotificationRecord()
{
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t initializeWithCopy for DarwinNotificationHelper.DarwinNotificationRecord(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  v4 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v4;
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for DarwinNotificationHelper.DarwinNotificationRecord(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  v4 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v4;
  swift_retain();
  swift_release();
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

uint64_t assignWithTake for DarwinNotificationHelper.DarwinNotificationRecord(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for DarwinNotificationHelper.DarwinNotificationRecord(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 40))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DarwinNotificationHelper.DarwinNotificationRecord(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 40) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

void *type metadata accessor for DarwinNotificationHelper.DarwinNotificationRecord()
{
  return &unk_25105FC78;
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(uint64_t a1, uint64_t a2)
{
  Swift::Int v4;

  Hasher.init(_seed:)();
  String.hash(into:)();
  v4 = Hasher._finalize()();
  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, a2, v4);
}

uint64_t outlined retain of String(uint64_t a1)
{
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_240069A58()
{
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in DarwinNotificationHelper.handleDarwinNotificationCallback(forNotificationName:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 40))();
}

uint64_t lazy protocol witness table accessor for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x24267C8F4](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t lazy protocol witness table accessor for type [OS_dispatch_queue.Attributes] and conformance [A](unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x24267C8F4](MEMORY[0x24BEE12C8], v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t outlined release of String(uint64_t a1)
{
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t specialized Dictionary._Variant.removeValue(forKey:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t *v3;
  uint64_t *v4;
  unint64_t v8;
  char v9;
  uint64_t result;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  v4 = v3;
  swift_bridgeObjectRetain();
  v8 = specialized __RawDictionaryStorage.find<A>(_:)(a1, a2);
  LOBYTE(a2) = v9;
  result = swift_bridgeObjectRelease();
  if ((a2 & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v12 = *v4;
    v19 = *v4;
    *v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      specialized _NativeDictionary.copy()();
      v12 = v19;
    }
    swift_bridgeObjectRelease();
    v13 = *(_QWORD *)(v12 + 56) + 40 * v8;
    v14 = *(_QWORD *)v13;
    v15 = *(_QWORD *)(v13 + 8);
    v16 = *(unsigned int *)(v13 + 16);
    v18 = *(_OWORD *)(v13 + 24);
    specialized _NativeDictionary._delete(at:)(v8, v12);
    *v4 = v12;
    result = swift_bridgeObjectRelease();
    v17 = v18;
  }
  else
  {
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v17 = 0uLL;
  }
  *(_QWORD *)a3 = v14;
  *(_QWORD *)(a3 + 8) = v15;
  *(_QWORD *)(a3 + 16) = v16;
  *(_OWORD *)(a3 + 24) = v17;
  return result;
}

uint64_t specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(uint64_t a1, char a2)
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
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
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
  uint64_t v34;
  int v35;
  uint64_t v36;
  int64_t v37;
  _QWORD *v38;
  uint64_t i;
  char v40;
  __int128 v41;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, DarwinNotificationHelper.DarwinNotificationRecord>);
  v40 = a2;
  v6 = static _DictionaryStorage.resize(original:capacity:move:)();
  v7 = v6;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 1 << *(_BYTE *)(v5 + 32);
    v38 = (_QWORD *)(v5 + 64);
    if (v8 < 64)
      v9 = ~(-1 << v8);
    else
      v9 = -1;
    v10 = v9 & *(_QWORD *)(v5 + 64);
    v37 = (unint64_t)(v8 + 63) >> 6;
    v11 = v6 + 64;
    result = swift_retain();
    v13 = 0;
    for (i = v5; ; v5 = i)
    {
      if (v10)
      {
        v20 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        v21 = v20 | (v13 << 6);
      }
      else
      {
        v22 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v22 >= v37)
          goto LABEL_33;
        v23 = v38[v22];
        ++v13;
        if (!v23)
        {
          v13 = v22 + 1;
          if (v22 + 1 >= v37)
            goto LABEL_33;
          v23 = v38[v13];
          if (!v23)
          {
            v24 = v22 + 2;
            if (v24 >= v37)
            {
LABEL_33:
              swift_release();
              v3 = v2;
              if ((v40 & 1) != 0)
              {
                v36 = 1 << *(_BYTE *)(v5 + 32);
                if (v36 >= 64)
                  bzero(v38, ((unint64_t)(v36 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v38 = -1 << v36;
                *(_QWORD *)(v5 + 16) = 0;
              }
              break;
            }
            v23 = v38[v24];
            if (!v23)
            {
              while (1)
              {
                v13 = v24 + 1;
                if (__OFADD__(v24, 1))
                  goto LABEL_40;
                if (v13 >= v37)
                  goto LABEL_33;
                v23 = v38[v13];
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
        v21 = __clz(__rbit64(v23)) + (v13 << 6);
      }
      v29 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v21);
      v31 = *v29;
      v30 = v29[1];
      v32 = *(_QWORD *)(v5 + 56) + 40 * v21;
      v33 = *(_QWORD *)v32;
      v34 = *(_QWORD *)(v32 + 8);
      v35 = *(_DWORD *)(v32 + 16);
      v41 = *(_OWORD *)(v32 + 24);
      if ((v40 & 1) == 0)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_retain();
      }
      Hasher.init(_seed:)();
      String.hash(into:)();
      result = Hasher._finalize()();
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
            goto LABEL_39;
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
      v19 = *(_QWORD *)(v7 + 56) + 40 * v17;
      *(_QWORD *)v19 = v33;
      *(_QWORD *)(v19 + 8) = v34;
      *(_DWORD *)(v19 + 16) = v35;
      *(_OWORD *)(v19 + 24) = v41;
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
  *v3 = v7;
  return result;
}

unint64_t specialized _NativeDictionary._delete(at:)(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  __int128 v9;
  __int128 v10;
  Swift::Int v11;
  unint64_t v12;
  uint64_t v13;
  _OWORD *v14;
  _OWORD *v15;
  uint64_t v16;
  unint64_t v17;
  __int128 *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = _HashTable.previousHole(before:)();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        Hasher.init(_seed:)();
        swift_bridgeObjectRetain();
        String.hash(into:)();
        v11 = Hasher._finalize()();
        result = swift_bridgeObjectRelease();
        v12 = v11 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v12 < v8)
            goto LABEL_5;
        }
        else if (v12 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v12)
        {
LABEL_11:
          v13 = *(_QWORD *)(a2 + 48);
          v14 = (_OWORD *)(v13 + 16 * v3);
          v15 = (_OWORD *)(v13 + 16 * v6);
          if (v3 != v6 || v14 >= v15 + 1)
            *v14 = *v15;
          v16 = *(_QWORD *)(a2 + 56);
          v17 = v16 + 40 * v3;
          v18 = (__int128 *)(v16 + 40 * v6);
          if (v3 != v6 || (v3 = v6, v17 >= (unint64_t)v18 + 40))
          {
            v9 = *v18;
            v10 = v18[1];
            *(_QWORD *)(v17 + 32) = *((_QWORD *)v18 + 4);
            *(_OWORD *)v17 = v9;
            *(_OWORD *)(v17 + 16) = v10;
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v19 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v20 = *v19;
    v21 = (-1 << v3) - 1;
  }
  else
  {
    v19 = (uint64_t *)(v4 + 8 * (result >> 6));
    v21 = *v19;
    v20 = (-1 << result) - 1;
  }
  *v19 = v21 & v20;
  v22 = *(_QWORD *)(a2 + 16);
  v23 = __OFSUB__(v22, 1);
  v24 = v22 - 1;
  if (v23)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v24;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t specialized _NativeDictionary.setValue(_:forKey:isUnique:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
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
  __int128 v21;
  unint64_t v22;
  char v23;
  uint64_t *v24;
  uint64_t v25;
  __int128 v26;
  uint64_t v27;
  BOOL v28;
  uint64_t v29;

  v5 = v4;
  v10 = *v4;
  v12 = specialized __RawDictionaryStorage.find<A>(_:)(a2, a3);
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
    specialized _NativeDictionary.copy()();
LABEL_7:
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      v19 = v18[7] + 40 * v12;
      swift_release();
      result = swift_bridgeObjectRelease();
      v21 = *(_OWORD *)(a1 + 16);
      *(_OWORD *)v19 = *(_OWORD *)a1;
      *(_OWORD *)(v19 + 16) = v21;
      *(_QWORD *)(v19 + 32) = *(_QWORD *)(a1 + 32);
      return result;
    }
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    v24 = (uint64_t *)(v18[6] + 16 * v12);
    *v24 = a2;
    v24[1] = a3;
    v25 = v18[7] + 40 * v12;
    v26 = *(_OWORD *)(a1 + 16);
    *(_OWORD *)v25 = *(_OWORD *)a1;
    *(_OWORD *)(v25 + 16) = v26;
    *(_QWORD *)(v25 + 32) = *(_QWORD *)(a1 + 32);
    v27 = v18[2];
    v28 = __OFADD__(v27, 1);
    v29 = v27 + 1;
    if (!v28)
    {
      v18[2] = v29;
      return swift_bridgeObjectRetain();
    }
    goto LABEL_14;
  }
  specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(v15, a4 & 1);
  v22 = specialized __RawDictionaryStorage.find<A>(_:)(a2, a3);
  if ((v16 & 1) == (v23 & 1))
  {
    v12 = v22;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:hashValue:)(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
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
      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }
  return v6;
}

uint64_t *outlined release of DarwinNotificationHelper.DarwinNotificationRecord?(uint64_t *a1)
{
  outlined consume of DarwinNotificationHelper.DarwinNotificationRecord?(*a1, a1[1]);
  return a1;
}

uint64_t outlined consume of DarwinNotificationHelper.DarwinNotificationRecord?(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRelease();
    return swift_release();
  }
  return result;
}

void *specialized _NativeDictionary.copy()()
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
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  _QWORD *v25;
  __int128 v26;
  uint64_t v27;
  int64_t v28;
  unint64_t v29;
  int64_t v30;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<String, DarwinNotificationHelper.DarwinNotificationRecord>);
  v2 = *v0;
  v3 = static _DictionaryStorage.copy(original:)();
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
    v28 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v28 >= v13)
      goto LABEL_26;
    v29 = *(_QWORD *)(v6 + 8 * v28);
    ++v9;
    if (!v29)
    {
      v9 = v28 + 1;
      if (v28 + 1 >= v13)
        goto LABEL_26;
      v29 = *(_QWORD *)(v6 + 8 * v9);
      if (!v29)
        break;
    }
LABEL_25:
    v12 = (v29 - 1) & v29;
    v15 = __clz(__rbit64(v29)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v19 = *v17;
    v18 = v17[1];
    v20 = 40 * v15;
    v21 = *(_QWORD *)(v2 + 56) + v20;
    v22 = *(_QWORD *)v21;
    v23 = *(_QWORD *)(v21 + 8);
    v24 = *(_DWORD *)(v21 + 16);
    v25 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    v26 = *(_OWORD *)(v21 + 24);
    *v25 = v19;
    v25[1] = v18;
    v27 = *(_QWORD *)(v4 + 56) + v20;
    *(_QWORD *)v27 = v22;
    *(_QWORD *)(v27 + 8) = v23;
    *(_DWORD *)(v27 + 16) = v24;
    *(_OWORD *)(v27 + 24) = v26;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    result = (void *)swift_retain();
  }
  v30 = v28 + 2;
  if (v30 >= v13)
    goto LABEL_26;
  v29 = *(_QWORD *)(v6 + 8 * v30);
  if (v29)
  {
    v9 = v30;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v30 + 1;
    if (__OFADD__(v30, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v29 = *(_QWORD *)(v6 + 8 * v9);
    ++v30;
    if (v29)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_24006A634()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_24006A658()
{
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void partial apply for closure #1 in closure #1 in DarwinNotificationHelper.addObserver(forNotificationName:handler:)(uint64_t a1)
{
  uint64_t *v1;

  closure #1 in closure #1 in DarwinNotificationHelper.addObserver(forNotificationName:handler:)(a1, v1[2], v1[3], v1[4]);
}

uint64_t type metadata accessor for DispatchWorkItemFlags()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t static DispatchQoS.unspecified.getter()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t type metadata accessor for DispatchQoS()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t type metadata accessor for DispatchPredicate()
{
  return MEMORY[0x24BEE5618]();
}

uint64_t _dispatchPreconditionTest(_:)()
{
  return MEMORY[0x24BEE5648]();
}

uint64_t String.utf8CString.getter()
{
  return MEMORY[0x24BEE0A30]();
}

uint64_t String.hash(into:)()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t type metadata accessor for OS_dispatch_queue.Attributes()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t OS_dispatch_queue.async(group:qos:flags:execute:)()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t _HashTable.previousHole(before:)()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t static _DictionaryStorage.copy(original:)()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t static _DictionaryStorage.resize(original:capacity:move:)()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t Hasher.init(_seed:)()
{
  return MEMORY[0x24BEE42E0]();
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return MEMORY[0x24BEE4328]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
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

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x24BDAF4D0]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
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

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x24BEE4BD8]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
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

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x24BEE4F10]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x24BEE4FC8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x24BEE4FD0]();
}

