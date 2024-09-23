void sub_212554174(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
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

void FSFSwitchToMobile()
{
  uid_t v0;
  passwd *v1;
  uid_t pw_uid;

  v0 = geteuid();
  v1 = getpwnam("mobile");
  if (v1)
    pw_uid = v1->pw_uid;
  else
    pw_uid = 501;
  if (pw_uid != v0)
  {
    if (seteuid(pw_uid))
      NSLog(CFSTR("seteuid to mobile failed."));
  }
}

const __CFString *FSFStringFromSourceType(uint64_t a1)
{
  if (a1)
    return CFSTR("SELF");
  else
    return CFSTR("FEATURE_STORE");
}

uint64_t FSFSourceTypeFromString(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("FEATURE_STORE")) & 1) != 0)
  {
    v2 = 0;
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("SELF")))
  {
    v2 = 1;
  }
  else
  {
    v2 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v2;
}

uint64_t static FeatureStoreService.insertAwait<A>(interactionId:item:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  _QWORD *v7;

  v7[7] = a6;
  v7[8] = v6;
  v7[5] = a4;
  v7[6] = a5;
  v7[3] = a2;
  v7[4] = a3;
  v7[2] = a1;
  return swift_task_switch();
}

uint64_t static FeatureStoreService.insertAwait<A>(interactionId:item:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  __int128 v3;
  __int128 v4;
  _QWORD *v5;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = swift_task_alloc();
  *(_QWORD *)(v0 + 72) = v2;
  v3 = *(_OWORD *)(v0 + 56);
  v4 = *(_OWORD *)(v0 + 24);
  *(_OWORD *)(v2 + 16) = *(_OWORD *)(v0 + 40);
  *(_OWORD *)(v2 + 32) = v3;
  *(_QWORD *)(v2 + 48) = v1;
  *(_OWORD *)(v2 + 56) = v4;
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 80) = v5;
  *v5 = v0;
  v5[1] = static FeatureStoreService.insertAwait<A>(interactionId:item:);
  return withCheckedContinuation<A>(isolation:function:_:)();
}

{
  swift_task_dealloc();
  swift_task_dealloc();
  return swift_task_switch();
}

{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  __int128 v3;
  _QWORD *v4;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v2;
  v3 = *(_OWORD *)(v0 + 24);
  *(_OWORD *)(v2 + 16) = *(_OWORD *)(v0 + 40);
  *(_QWORD *)(v2 + 32) = v1;
  *(_OWORD *)(v2 + 40) = v3;
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 64) = v4;
  *v4 = v0;
  v4[1] = static FeatureStoreService.insertAwait<A>(interactionId:item:);
  return withCheckedContinuation<A>(isolation:function:_:)();
}

{
  swift_task_dealloc();
  swift_task_dealloc();
  return swift_task_switch();
}

void closure #1 in static FeatureStoreService.insertAwait<A>(interactionId:item:)()
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
  uint64_t v18;
  unint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  void (*v26)(uint64_t);
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

  OUTLINED_FUNCTION_7();
  v2 = v1;
  v31 = v4;
  v32 = v3;
  v6 = v5;
  v8 = v7;
  v29 = v9;
  v30 = v10;
  v34 = v11;
  v33 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<(), Never>);
  v12 = *(_QWORD *)(v33 - 8);
  v13 = *(_QWORD *)(v12 + 64);
  v14 = MEMORY[0x24BDAC7A8](v33);
  v28 = (uint64_t)&v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = *(_QWORD *)(v6 - 8);
  v16 = *(_QWORD *)(v15 + 64);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v27 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = type metadata accessor for DispatchQoS();
  v35 = *(_QWORD *)(v18 - 8);
  v36 = v18;
  MEMORY[0x24BDAC7A8](v18);
  OUTLINED_FUNCTION_3();
  static DispatchQoS.userInitiated.getter();
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v17, v8, v6);
  v19 = (*(unsigned __int8 *)(v15 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  v20 = (char *)swift_allocObject();
  v21 = v31;
  v22 = v32;
  *((_QWORD *)v20 + 2) = v6;
  *((_QWORD *)v20 + 3) = v21;
  *((_QWORD *)v20 + 4) = v2;
  v23 = v30;
  *((_QWORD *)v20 + 5) = v29;
  *((_QWORD *)v20 + 6) = v23;
  *((_QWORD *)v20 + 7) = v22;
  (*(void (**)(char *, char *, uint64_t))(v15 + 32))(&v20[v19], v17, v6);
  v24 = v28;
  OUTLINED_FUNCTION_25(v28, v34, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 16));
  v25 = (*(unsigned __int8 *)(v12 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  v26 = (void (*)(uint64_t))swift_allocObject();
  OUTLINED_FUNCTION_25((uint64_t)v26 + v25, v24, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 32));
  swift_bridgeObjectRetain();
  static FeatureStoreService.performInsert(qos:insertBlock:completion:)(v0, (uint64_t)partial apply for closure #1 in static FeatureStoreService.insert<A>(interactionId:item:completion:), (uint64_t)v20, (void (*)(uint64_t))partial apply for implicit closure #2 in implicit closure #1 in closure #1 in static FeatureStoreService.insertAwait<A>(interactionId:item:), v26);
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v0, v36);
  OUTLINED_FUNCTION_0();
}

void partial apply for closure #1 in static FeatureStoreService.insertAwait<A>(interactionId:item:)()
{
  closure #1 in static FeatureStoreService.insertAwait<A>(interactionId:item:)();
}

void static FeatureStoreService.insertSync<A>(interactionId:item:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
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
  char *v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t, uint64_t);
  NSObject *v28;
  os_log_type_t v29;
  _BOOL4 v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  void (*v35)(char *, uint64_t);
  uint64_t v36;
  char **inserted;
  const char *v38;
  uint64_t v39;
  unsigned __int8 v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  os_log_type_t v46;
  uint8_t *v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  int v52;
  double v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  int v59;
  uint64_t v60;
  uint64_t (*v61)(uint64_t, uint64_t, uint64_t);
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;

  OUTLINED_FUNCTION_7();
  v2 = v1;
  v64 = v3;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v68 = v10;
  v11 = type metadata accessor for LogSignpost();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_8();
  v65 = v13 - v12;
  v14 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_3();
  v16 = type metadata accessor for Logger();
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  OUTLINED_FUNCTION_4();
  v62 = v18 - v19;
  v21 = MEMORY[0x24BDAC7A8](v20);
  v23 = (char *)&v55 - v22;
  MEMORY[0x24BDAC7A8](v21);
  v25 = (char *)&v55 - v24;
  v26 = Logger.service.unsafeMutableAddressor();
  v63 = v17;
  v27 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v17 + 16);
  v60 = v26;
  v61 = v27;
  OUTLINED_FUNCTION_25((uint64_t)v25, v26, v27);
  OUTLINED_FUNCTION_21(v0, v7, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v14 + 16));
  swift_bridgeObjectRetain_n();
  v28 = Logger.logObject.getter();
  v29 = static os_log_type_t.debug.getter();
  v59 = v29;
  v30 = os_log_type_enabled(v28, v29);
  v66 = v9;
  v67 = v2;
  if (v30)
  {
    v31 = OUTLINED_FUNCTION_5();
    v57 = v16;
    v32 = v31;
    v56 = OUTLINED_FUNCTION_5();
    v70 = v56;
    *(_DWORD *)v32 = 136315394;
    v55 = v32 + 4;
    v69 = OUTLINED_FUNCTION_14();
    swift_getMetatypeMetadata();
    v33 = OUTLINED_FUNCTION_16();
    v58 = v7;
    v69 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v33, v34, &v70);
    OUTLINED_FUNCTION_15();
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_13();
    *(_WORD *)(v32 + 12) = 2080;
    OUTLINED_FUNCTION_18();
    v69 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v68, v9, &v70);
    OUTLINED_FUNCTION_15();
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_212552000, v28, (os_log_type_t)v59, "Inserting item of type %s with interactionId: %s", (uint8_t *)v32, 0x16u);
    OUTLINED_FUNCTION_22();
    OUTLINED_FUNCTION_1();
  }
  OUTLINED_FUNCTION_13();

  swift_bridgeObjectRelease_n();
  v35 = *(void (**)(char *, uint64_t))(v63 + 8);
  v35(v25, v16);
  v36 = v65;
  inserted = FeatureStoreService.signpostInsertSync.unsafeMutableAddressor();
  v38 = *inserted;
  v39 = (uint64_t)inserted[1];
  v40 = *((_BYTE *)inserted + 16);
  default argument 0 of static LogSignpost.begin(logger:_:)();
  static LogSignpost.begin(logger:_:)((uint64_t)v23, v38, v39, v40, v36);
  v35(v23, v16);
  v41 = static JSONCoder.encode(codable:)();
  if (v42 >> 60 == 15)
  {
    v43 = v62;
    v44 = v16;
    v61(v62, v60, v16);
    v45 = Logger.logObject.getter();
    v46 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v45, v46))
    {
      v47 = (uint8_t *)OUTLINED_FUNCTION_5();
      *(_WORD *)v47 = 0;
      _os_log_impl(&dword_212552000, v45, v46, "Could not encode the item. Skipping insertion.", v47, 2u);
      OUTLINED_FUNCTION_1();
    }

    v35((char *)v43, v44);
  }
  else
  {
    v48 = v41;
    v49 = v42;
    v70 = OUTLINED_FUNCTION_14();
    swift_getMetatypeMetadata();
    String.init<A>(describing:)();
    type metadata accessor for FeatureStoreStreamAccessor();
    v50 = FeatureStoreStreamAccessor.__allocating_init(identifier:)();
    type metadata accessor for FeatureStoreBiomeEvent();
    v51 = v66;
    swift_bridgeObjectRetain();
    outlined copy of Data?(v48, v49);
    v52 = default argument 2 of FeatureStoreBiomeEvent.init(interactionId:featureData:dataVersion:timestamp:)();
    v53 = default argument 3 of FeatureStoreBiomeEvent.init(interactionId:featureData:dataVersion:timestamp:)();
    v54 = FeatureStoreBiomeEvent.__allocating_init(interactionId:featureData:dataVersion:timestamp:)(v68, v51, v48, v49, v52, v53);
    (*(void (**)(void))(*(_QWORD *)v50 + 104))();
    swift_release();

    outlined consume of Data?(v48, v49);
  }
  $defer #1 <A>() in static FeatureStoreService.insertSync<A>(interactionId:item:)();
  outlined destroy of LogSignpost(v36);
  OUTLINED_FUNCTION_0();
}

void static FeatureStoreService.insert<A>(interactionId:item:)()
{
  static FeatureStoreService.insert<A>(interactionId:item:completion:)();
}

void static FeatureStoreService.insert<A>(interactionId:item:completion:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t);
  void (*v7)(uint64_t);
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
  unint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t);
  void (*v28)(uint64_t);

  OUTLINED_FUNCTION_7();
  v25 = v2;
  v26 = v3;
  v5 = v4;
  v27 = v6;
  v28 = v7;
  v9 = v8;
  v11 = v10;
  v24 = v12;
  v13 = type metadata accessor for DispatchQoS();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_3();
  v15 = *(_QWORD *)(v5 - 8);
  v16 = *(_QWORD *)(v15 + 64);
  MEMORY[0x24BDAC7A8](v17);
  v18 = (char *)&v23 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_21((uint64_t)v18, v9, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v15 + 16));
  v19 = (*(unsigned __int8 *)(v15 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  v20 = (_QWORD *)swift_allocObject();
  v21 = v25;
  v20[2] = v5;
  v20[3] = v21;
  v20[4] = v26;
  v20[5] = v0;
  v20[6] = v24;
  v20[7] = v11;
  OUTLINED_FUNCTION_21((uint64_t)v20 + v19, (uint64_t)v18, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v15 + 32));
  v22 = swift_bridgeObjectRetain();
  default argument 0 of static FeatureStoreService.performInsert(qos:insertBlock:completion:)(v22);
  static FeatureStoreService.performInsert(qos:insertBlock:completion:)(v1, (uint64_t)partial apply for closure #1 in static FeatureStoreService.insert<A>(interactionId:item:completion:), (uint64_t)v20, v27, v28);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v1, v13);
  OUTLINED_FUNCTION_0();
}

void $defer #1 <A>() in static FeatureStoreService.insertSync<A>(interactionId:item:)()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;
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
  NSObject *v17;
  os_log_type_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;

  OUTLINED_FUNCTION_7();
  v1 = v0;
  v3 = v2;
  v22 = v4;
  v6 = v5;
  v7 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_8();
  v10 = v9 - v8;
  v11 = type metadata accessor for Logger();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_8();
  v15 = v14 - v13;
  LogSignpost.end()();
  v16 = Logger.service.unsafeMutableAddressor();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16))(v15, v16, v11);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v10, v6, v1);
  swift_bridgeObjectRetain_n();
  v17 = Logger.logObject.getter();
  v18 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v17, v18))
  {
    v19 = OUTLINED_FUNCTION_5();
    v23 = OUTLINED_FUNCTION_5();
    *(_DWORD *)v19 = 136315394;
    swift_getDynamicType();
    swift_getMetatypeMetadata();
    v20 = OUTLINED_FUNCTION_16();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v20, v21, &v23);
    OUTLINED_FUNCTION_15();
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_9();
    *(_WORD *)(v19 + 12) = 2080;
    swift_bridgeObjectRetain();
    getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v22, v3, &v23);
    OUTLINED_FUNCTION_15();
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_212552000, v17, v18, "Inserted item of type %s with interactionId: %s", (uint8_t *)v19, 0x16u);
    OUTLINED_FUNCTION_22();
    OUTLINED_FUNCTION_1();
  }
  OUTLINED_FUNCTION_9();

  swift_bridgeObjectRelease_n();
  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v15, v11);
  OUTLINED_FUNCTION_0();
}

uint64_t outlined destroy of LogSignpost(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for LogSignpost();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t static FeatureStoreService.retrieve<A>(interactionId:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  uint64_t v21;
  uint64_t v23;

  v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_4();
  v13 = v11 - v12;
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v23 - v15;
  type metadata accessor for StreamQuery();
  type metadata accessor for Date();
  OUTLINED_FUNCTION_12((uint64_t)v16);
  OUTLINED_FUNCTION_12(v13);
  v17 = variable initialization expression of StreamQuery.interactionIds();
  v18 = StreamQuery.__allocating_init(startDate:endDate:interactionIds:)((uint64_t)v16, v13, v17);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
  v19 = swift_allocObject();
  *(_OWORD *)(v19 + 16) = xmmword_212575370;
  *(_QWORD *)(v19 + 32) = a1;
  *(_QWORD *)(v19 + 40) = a2;
  v20 = *(void (**)(uint64_t))((*MEMORY[0x24BEE4EA0] & *v18) + 0xA0);
  OUTLINED_FUNCTION_18();
  v20(v19);
  v21 = static FeatureStoreService.retrieve<A>(query:)((uint64_t)v18, a3, a4, a5);

  return v21;
}

uint64_t static FeatureStoreService.retrieve<A>(query:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v16[8];

  v9 = static FeatureStoreService.retrieveWithInteractionWrapper<A>(query:)(a1, a2, a3, a4);
  if (!v5)
  {
    v16[7] = v9;
    MEMORY[0x24BDAC7A8](v9);
    v16[2] = a2;
    v16[3] = a3;
    v16[4] = a4;
    type metadata accessor for InteractionWrapper(255, a2, v10, v11);
    v12 = OUTLINED_FUNCTION_24();
    v13 = MEMORY[0x212BEEBCC](MEMORY[0x24BEE12E0], v12);
    v4 = _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lF((void (*)(char *, char *))partial apply for closure #1 in static FeatureStoreService.retrieve<A>(query:), (uint64_t)v16, v12, a2, MEMORY[0x24BEE4078], v13, MEMORY[0x24BEE40A8], v14);
    swift_bridgeObjectRelease();
  }
  return v4;
}

uint64_t static FeatureStoreService.retrieveWithInteractionWrapper<A>(query:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;

  type metadata accessor for InteractionWrapper(255, a2, a3, a4);
  v5 = OUTLINED_FUNCTION_24();
  result = static FeatureStoreService.performRetrieve<A>(retrieveBlock:)((void (*)(uint64_t))partial apply for closure #1 in static FeatureStoreService.retrieveWithInteractionWrapper<A>(query:), v5, (uint64_t)&v7);
  if (!v4)
    return v7;
  return result;
}

uint64_t _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lF(void (*a1)(char *, char *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  Swift::Int v24;
  uint64_t result;
  Swift::Int v26;
  void (*v27)(char *, _QWORD);
  void (*v28)(char *);
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t AssociatedTypeWitness;
  void (*v47)(char *, char *);
  uint64_t v48;
  char *v49;
  Swift::Int v50;
  uint64_t v51;
  char v52[32];
  uint64_t v53;

  v39 = a5;
  v40 = a8;
  v47 = a1;
  v48 = a2;
  v38 = *(_QWORD *)(a5 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v49 = (char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v11 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v12 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v14 = (char *)&v36 - v13;
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v36 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = swift_getAssociatedTypeWitness();
  v41 = *(_QWORD *)(v17 - 8);
  v42 = v17;
  v18 = MEMORY[0x24BDAC7A8](v17);
  v37 = (char *)&v36 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v21 = (char *)&v36 - v20;
  v22 = dispatch thunk of Collection.count.getter();
  if (!v22)
    return static Array._allocateUninitialized(_:)();
  v23 = a4;
  v24 = v22;
  v53 = MEMORY[0x212BEE434](v23);
  v43 = type metadata accessor for ContiguousArray();
  ContiguousArray.reserveCapacity(_:)(v24);
  v45 = a6;
  result = dispatch thunk of Collection.startIndex.getter();
  if ((v24 & 0x8000000000000000) == 0)
  {
    v26 = v24;
    v44 = v16;
    while (v26)
    {
      v50 = v26;
      v27 = (void (*)(char *, _QWORD))dispatch thunk of Collection.subscript.read();
      v28 = *(void (**)(char *))(v11 + 16);
      v29 = v11;
      v30 = AssociatedTypeWitness;
      v28(v14);
      v27(v52, 0);
      v31 = v21;
      v32 = v51;
      v47(v14, v49);
      if (v32)
      {
        (*(void (**)(char *, uint64_t))(v29 + 8))(v14, v30);
        (*(void (**)(char *, uint64_t))(v41 + 8))(v21, v42);
        swift_release();
        return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v38 + 32))(v40, v49, v39);
      }
      v51 = 0;
      (*(void (**)(char *, uint64_t))(v29 + 8))(v14, v30);
      ContiguousArray.append(_:)();
      result = dispatch thunk of Collection.formIndex(after:)();
      v26 = v50 - 1;
      v11 = v29;
      if (v50 == 1)
      {
        v34 = v41;
        v33 = v42;
        v35 = v37;
        (*(void (**)(char *, char *, uint64_t))(v41 + 32))(v37, v31, v42);
        _expectEnd<A>(of:is:)();
        (*(void (**)(char *, uint64_t))(v34 + 8))(v35, v33);
        return v53;
      }
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t closure #1 in static FeatureStoreService.retrieveWithInteractionWrapper<A>(query:)@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, NSObject *a4@<X3>, _QWORD *a5@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  void (*v20)(void);
  id v21;
  NSObject *v22;
  os_log_type_t v23;
  _BOOL4 v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  void (*v28)(char *, uint64_t);
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t result;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  _QWORD *v43;
  NSObject *v44;
  os_log_type_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  unint64_t v51;
  uint64_t v52;
  os_log_t v53;
  _QWORD *v54;
  uint64_t v55;
  uint64_t v56;
  void (*v57)(void);
  _QWORD *v58;
  uint64_t v59;
  uint64_t v60;
  os_log_t v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  id v65;
  uint64_t (*v66)(uint64_t, uint64_t);
  uint64_t v67;
  uint64_t v68;

  v60 = a3;
  v61 = a4;
  v8 = type metadata accessor for Logger();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_4();
  v12 = v10 - v11;
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v52 - v14;
  v68 = a2;
  swift_getMetatypeMetadata();
  v16 = String.init<A>(describing:)();
  v18 = v17;
  v19 = Logger.service.unsafeMutableAddressor();
  v64 = v9;
  v20 = *(void (**)(void))(v9 + 16);
  v56 = v19;
  v57 = v20;
  ((void (*)(char *))v20)(v15);
  swift_bridgeObjectRetain_n();
  v21 = a1;
  v63 = v15;
  v22 = Logger.logObject.getter();
  v23 = static os_log_type_t.debug.getter();
  v24 = os_log_type_enabled(v22, v23);
  v58 = a5;
  v59 = v12;
  v62 = a2;
  if (v24)
  {
    v25 = OUTLINED_FUNCTION_5();
    v66 = (uint64_t (*)(uint64_t, uint64_t))v18;
    v26 = v25;
    v54 = (_QWORD *)OUTLINED_FUNCTION_5();
    v55 = OUTLINED_FUNCTION_5();
    v68 = v55;
    *(_DWORD *)v26 = 136315394;
    swift_bridgeObjectRetain();
    v67 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v16, (unint64_t)v66, &v68);
    v53 = v22;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v26 + 12) = 2112;
    v67 = (uint64_t)v21;
    v27 = v21;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *v54 = v21;

    _os_log_impl(&dword_212552000, v53, v23, "Retrieving items of type %s) with query: %@", (uint8_t *)v26, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    OUTLINED_FUNCTION_23();
    OUTLINED_FUNCTION_1();
  }

  OUTLINED_FUNCTION_19();
  v28 = *(void (**)(char *, uint64_t))(v64 + 8);
  v28(v63, v8);
  v29 = v65;
  type metadata accessor for FeatureStoreStreamAccessor();
  OUTLINED_FUNCTION_20();
  v30 = FeatureStoreStreamAccessor.__allocating_init(identifier:)();
  v31 = (*(uint64_t (**)(id))(*(_QWORD *)v30 + 112))(v21);
  if (v29)
  {
    swift_bridgeObjectRelease();
    return OUTLINED_FUNCTION_10();
  }
  else
  {
    v65 = v21;
    v66 = (uint64_t (*)(uint64_t, uint64_t))v28;
    v64 = v16;
    v52 = v8;
    v68 = v31;
    MEMORY[0x24BDAC7A8](v31);
    v33 = v60;
    *(&v52 - 4) = v62;
    *(&v52 - 3) = v33;
    *(&v52 - 2) = (uint64_t)v61;
    v34 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [FeatureStoreBiomeEvent]);
    v38 = OUTLINED_FUNCTION_17(v34, v35, v36, v37);
    lazy protocol witness table accessor for type [FeatureStoreBiomeEvent] and conformance [A]();
    v39 = (void *)Sequence.compactMap<A>(_:)();
    swift_bridgeObjectRelease();
    v40 = v52;
    v41 = v59;
    v57();
    v42 = v65;
    OUTLINED_FUNCTION_20();
    v43 = v42;
    swift_bridgeObjectRetain();
    v44 = Logger.logObject.getter();
    v45 = static os_log_type_t.debug.getter();
    LODWORD(v63) = v45;
    if (os_log_type_enabled(v44, v45))
    {
      v46 = OUTLINED_FUNCTION_5();
      v65 = v39;
      v47 = v46;
      v62 = OUTLINED_FUNCTION_5();
      v68 = v62;
      *(_DWORD *)v47 = 134218498;
      v61 = v44;
      v67 = MEMORY[0x212BEE11C](v65, v38);
      OUTLINED_FUNCTION_11();
      swift_bridgeObjectRelease();
      *(_WORD *)(v47 + 12) = 2080;
      OUTLINED_FUNCTION_20();
      v67 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v64, v18, &v68);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      v48 = swift_bridgeObjectRelease_n();
      *(_WORD *)(v47 + 22) = 2080;
      (*(void (**)(uint64_t))((*MEMORY[0x24BEE4EA0] & *v43) + 0x98))(v48);
      v49 = MEMORY[0x212BEE0E0]();
      v51 = v50;
      swift_bridgeObjectRelease();
      v67 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v49, v51, &v68);
      OUTLINED_FUNCTION_11();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_212552000, v61, (os_log_type_t)v63, "Retrieved %ld item(s) of type %s) with query: %s", (uint8_t *)v47, 0x20u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_1();
    }

    OUTLINED_FUNCTION_10();
    OUTLINED_FUNCTION_19();
    swift_bridgeObjectRelease();
    result = v66(v41, v40);
    *v58 = v39;
  }
  return result;
}

uint64_t closure #1 in closure #1 in static FeatureStoreService.retrieveWithInteractionWrapper<A>(query:)@<X0>(_QWORD **a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
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
  uint64_t v16;
  uint64_t v17;
  char *v18;
  _QWORD *v19;
  uint64_t *v20;
  uint64_t v21;
  unint64_t v22;
  Swift::String v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v28;
  uint64_t v29;
  double (*v30)(uint64_t);
  uint64_t v31;
  double v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37[4];
  uint64_t v38;
  unint64_t v39;

  v37[2] = a3;
  v37[3] = a4;
  v37[0] = a5;
  v7 = type metadata accessor for Optional();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)v37 - v10;
  v12 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_4();
  v15 = v13 - v14;
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)v37 - v17;
  v19 = *a1;
  v20 = (_QWORD *)((char *)v19 + OBJC_IVAR___FSFFeatureStoreBiomeEvent_featureData);
  static JSONCoder.decode(data:)(a2, (uint64_t)v11);
  if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, a2) == 1)
  {
    (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
    v38 = 0;
    v39 = 0xE000000000000000;
    _StringGuts.grow(_:)(17);
    swift_bridgeObjectRelease();
    v38 = 0x6420746F6E6E6163;
    v39 = 0xEF203A65646F6365;
    v21 = *v20;
    v22 = v20[1];
    outlined copy of Data._Representation(v21, v22);
    v23._countAndFlagsBits = Data.description.getter();
    String.append(_:)(v23);
    swift_bridgeObjectRelease();
    outlined consume of Data._Representation(v21, v22);
    v24 = v38;
    v25 = v39;
    lazy protocol witness table accessor for type FeatureStoreError and conformance FeatureStoreError();
    swift_allocError();
    *(_QWORD *)v26 = v24;
    *(_QWORD *)(v26 + 8) = v25;
    *(_BYTE *)(v26 + 16) = 0;
    return swift_willThrow();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v18, v11, a2);
    v28 = *(_QWORD *)((char *)v19 + OBJC_IVAR___FSFFeatureStoreBiomeEvent_interactionId);
    v29 = *(_QWORD *)((char *)v19 + OBJC_IVAR___FSFFeatureStoreBiomeEvent_interactionId + 8);
    v30 = *(double (**)(uint64_t))((*MEMORY[0x24BEE4EA0] & *v19) + 0x78);
    v31 = OUTLINED_FUNCTION_18();
    v32 = v30(v31);
    (*(void (**)(uint64_t, char *, uint64_t))(v12 + 16))(v15, v18, a2);
    v33 = v37[0];
    InteractionWrapper.init(interactionId:timestamp:feature:)(v28, v29, v15, a2, v37[0], v32);
    (*(void (**)(char *, uint64_t))(v12 + 8))(v18, a2);
    v36 = type metadata accessor for InteractionWrapper(0, a2, v34, v35);
    return __swift_storeEnumTagSinglePayload(v33, 0, 1, v36);
  }
}

uint64_t outlined copy of Data?(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return outlined copy of Data._Representation(a1, a2);
  return a1;
}

uint64_t outlined copy of Data._Representation(uint64_t a1, unint64_t a2)
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

uint64_t outlined consume of Data?(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return outlined consume of Data._Representation(a1, a2);
  return a1;
}

uint64_t outlined consume of Data._Representation(uint64_t a1, unint64_t a2)
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

uint64_t getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[3];
  uint64_t ObjectType;

  v6 = specialized _StringGuts._deconstructUTF8<A>(scratch:)(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      outlined init with copy of Any((uint64_t)v12, *a3);
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
      outlined init with copy of Any((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t specialized _StringGuts._deconstructUTF8<A>(scratch:)(_QWORD *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v11;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      specialized UnsafeMutableRawPointer.initializeMemory<A>(as:from:count:)((char *)__src, HIBYTE(a6) & 0xF, __dst);
      UnsafeMutableRawBufferPointer.subscript.setter();
      result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    result = _StringGuts._allocateForDeconstruct()(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    v8 = _StringObject.sharedUTF8.getter();
    if (!v8)
    {
      result = _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
      return result;
    }
  }
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain();
}

void *specialized UnsafeMutableRawPointer.initializeMemory<A>(as:from:count:)(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)_fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t _StringGuts._allocateForDeconstruct()(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = specialized _copyCollectionToContiguousArray<A>(_:)(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(v2 + 16) + 1, 1, v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = (uint64_t)specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v3 > 1), v4 + 1, 1, v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t specialized _copyCollectionToContiguousArray<A>(_:)(uint64_t a1, unint64_t a2)
{
  Swift::Int v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
  {
    v2 = String.UTF8View._foreignCount()();
    if (v2)
      goto LABEL_6;
    return MEMORY[0x24BEE4AF8];
  }
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (!v2)
    return MEMORY[0x24BEE4AF8];
LABEL_6:
  v3 = specialized _ContiguousArrayBuffer.init(_uninitializedCount:minimumCapacity:)(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    v4 = v3;
    v5 = _StringGuts.copyUTF8(into:)();
    if ((v6 & 1) != 0 || v5 != v2)
      goto LABEL_14;
    return (uint64_t)v4;
  }
  _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
LABEL_14:
  result = _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

_QWORD *specialized _ContiguousArrayBuffer.init(_uninitializedCount:minimumCapacity:)(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char *result, int64_t a2, char a3, uint64_t a4)
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
    v6 = *(_QWORD *)(a4 + 24);
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
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<UInt8>);
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
  v13 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    specialized UnsafeMutablePointer.moveInitialize(from:count:)(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    specialized UnsafeMutablePointer.initialize(from:count:)(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *specialized UnsafeMutablePointer.initialize(from:count:)(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)_fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

char *specialized UnsafeMutablePointer.moveInitialize(from:count:)(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

void partial apply for closure #1 in static FeatureStoreService.insert<A>(interactionId:item:completion:)()
{
  partial apply for closure #1 in static FeatureStoreService.insert<A>(interactionId:item:completion:)();
}

{
  static FeatureStoreService.insertSync<A>(interactionId:item:)();
}

{
  uint64_t v0;

  closure #1 in static FeatureStoreService.insert<A>(interactionId:item:completion:)(*(void **)(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40));
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x212BEEBB4]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t partial apply for closure #1 in static FeatureStoreService.retrieve<A>(query:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;

  v8 = *(_QWORD *)(v5 + 16);
  v9 = OUTLINED_FUNCTION_17(a1, a2, a3, a4);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a5, a1 + *(int *)(v9 + 32), v8);
}

uint64_t partial apply for closure #1 in static FeatureStoreService.retrieveWithInteractionWrapper<A>(query:)@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  return closure #1 in static FeatureStoreService.retrieveWithInteractionWrapper<A>(query:)(*(void **)(v1 + 40), *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(NSObject **)(v1 + 32), a1);
}

uint64_t partial apply for closure #1 in closure #1 in static FeatureStoreService.retrieveWithInteractionWrapper<A>(query:)@<X0>(_QWORD **a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;

  return closure #1 in closure #1 in static FeatureStoreService.retrieveWithInteractionWrapper<A>(query:)(a1, v2[2], v2[3], v2[4], a2);
}

unint64_t lazy protocol witness table accessor for type [FeatureStoreBiomeEvent] and conformance [A]()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type [FeatureStoreBiomeEvent] and conformance [A];
  if (!lazy protocol witness table cache variable for type [FeatureStoreBiomeEvent] and conformance [A])
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [FeatureStoreBiomeEvent]);
    result = MEMORY[0x212BEEBCC](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [FeatureStoreBiomeEvent] and conformance [A]);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x212BEEBC0](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

unint64_t lazy protocol witness table accessor for type FeatureStoreError and conformance FeatureStoreError()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type FeatureStoreError and conformance FeatureStoreError;
  if (!lazy protocol witness table cache variable for type FeatureStoreError and conformance FeatureStoreError)
  {
    result = MEMORY[0x212BEEBCC](&protocol conformance descriptor for FeatureStoreError, &type metadata for FeatureStoreError);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FeatureStoreError and conformance FeatureStoreError);
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

uint64_t outlined init with copy of Any(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t objectdestroyTm()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_bridgeObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_21255B0F0()
{
  uint64_t v0;
  uint64_t v1;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<(), Never>);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #2 in implicit closure #1 in closure #1 in static FeatureStoreService.insertAwait<A>(interactionId:item:)()
{
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<(), Never>);
  return CheckedContinuation.resume(returning:)();
}

void OUTLINED_FUNCTION_1()
{
  JUMPOUT(0x212BEEC50);
}

uint64_t OUTLINED_FUNCTION_5()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_9()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v2, v1);
}

uint64_t OUTLINED_FUNCTION_10()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_11()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t OUTLINED_FUNCTION_12(uint64_t a1)
{
  uint64_t v1;

  return __swift_storeEnumTagSinglePayload(a1, 1, 1, v1);
}

uint64_t OUTLINED_FUNCTION_13()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v1, v2);
}

uint64_t OUTLINED_FUNCTION_14()
{
  return swift_getDynamicType();
}

uint64_t OUTLINED_FUNCTION_15()
{
  uint64_t v0;

  return v0 - 96;
}

uint64_t OUTLINED_FUNCTION_16()
{
  return String.init<A>(describing:)();
}

uint64_t OUTLINED_FUNCTION_17(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  return type metadata accessor for InteractionWrapper(0, v4, a3, a4);
}

uint64_t OUTLINED_FUNCTION_18()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_19()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_20()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_21@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

uint64_t OUTLINED_FUNCTION_22()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_23()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_24()
{
  return type metadata accessor for Array();
}

uint64_t OUTLINED_FUNCTION_25@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

uint64_t FeatureStoreNSCodingAccessorWithType.insert(interactionId:feature:)()
{
  uint64_t v0;

  lazy protocol witness table accessor for type FeatureStoreError and conformance FeatureStoreError();
  OUTLINED_FUNCTION_2();
  *(_OWORD *)v0 = xmmword_212575380;
  *(_BYTE *)(v0 + 16) = 1;
  return swift_willThrow();
}

unint64_t FeatureStoreNSCodingAccessorWithType.retrieve(interactionId:)(uint64_t a1, uint64_t a2)
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
  NSObject *v13;
  uint64_t v14;
  _QWORD *v15;
  unint64_t result;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  _QWORD *v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  os_log_type_t v27;
  uint8_t *v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;

  v6 = *(_QWORD *)v2;
  v7 = type metadata accessor for Logger();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = ((char *)&v30 - v12);
  v14 = (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 112))(a1, a2);
  if (v3)
    return v2;
  v15 = (_QWORD *)v14;
  v31 = v7;
  result = type metadata accessor for NSKeyedUnarchiver();
  if (v15[2])
  {
    outlined copy of Data._Representation(v15[4], v15[5]);
    swift_bridgeObjectRelease();
    v2 = static NSKeyedUnarchiver.unarchivedObject<A>(ofClass:from:)();
    OUTLINED_FUNCTION_8_0();
    v25 = v31;
    if (!v2)
    {
      v26 = Logger.accessor.unsafeMutableAddressor();
      (*(void (**)(NSObject *, uint64_t, uint64_t))(v8 + 16))(v13, v26, v25);
      Logger.logObject.getter();
      v27 = OUTLINED_FUNCTION_9_0();
      if (os_log_type_enabled(v13, v27))
      {
        v28 = (uint8_t *)OUTLINED_FUNCTION_5();
        *(_WORD *)v28 = 0;
        _os_log_impl(&dword_212552000, v13, v27, "Deserialization failed. Returned nil object.", v28, 2u);
        OUTLINED_FUNCTION_1();
      }

      (*(void (**)(NSObject *, uint64_t))(v8 + 8))(v13, v25);
      lazy protocol witness table accessor for type FeatureStoreError and conformance FeatureStoreError();
      OUTLINED_FUNCTION_2();
      OUTLINED_FUNCTION_0_0(v29, 0xD000000000000026);
      v17 = Logger.accessor.unsafeMutableAddressor();
      (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v11, v17, v25);
      OUTLINED_FUNCTION_6();
      OUTLINED_FUNCTION_6();
      v18 = Logger.logObject.getter();
      v19 = static os_log_type_t.error.getter();
      v2 = v19;
      if (os_log_type_enabled(v18, v19))
      {
        v30 = v18;
        v20 = (uint8_t *)OUTLINED_FUNCTION_5();
        v21 = (_QWORD *)OUTLINED_FUNCTION_5();
        *(_DWORD *)v20 = 138412290;
        OUTLINED_FUNCTION_6();
        v22 = _swift_stdlib_bridgeErrorToNSError();
        v32 = v22;
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        *v21 = v22;
        v23 = v30;
        OUTLINED_FUNCTION_4_0();
        OUTLINED_FUNCTION_4_0();
        _os_log_impl(&dword_212552000, v23, (os_log_type_t)v2, "Deserialization failed. Error: %@", v20, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_1();
      }
      OUTLINED_FUNCTION_4_0();
      OUTLINED_FUNCTION_4_0();

      (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v25);
      lazy protocol witness table accessor for type FeatureStoreError and conformance FeatureStoreError();
      OUTLINED_FUNCTION_2();
      OUTLINED_FUNCTION_0_0(v24, 0xD000000000000026);
      OUTLINED_FUNCTION_4_0();
    }
    return v2;
  }
  __break(1u);
  return result;
}

unint64_t type metadata accessor for NSKeyedUnarchiver()
{
  unint64_t result;

  result = lazy cache variable for type metadata for NSKeyedUnarchiver;
  if (!lazy cache variable for type metadata for NSKeyedUnarchiver)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for NSKeyedUnarchiver);
  }
  return result;
}

uint64_t FeatureStoreNSCodingAccessorWithType.retrieve(interactionId:)()
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
  unint64_t v9;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[2];

  v2 = *(_QWORD *)v0;
  v3 = (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
  if (!v1)
  {
    v13[1] = v3;
    MEMORY[0x24BDAC7A8](v3);
    v12 = *(_QWORD *)(v2 + 144);
    v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [InteractionWrapper<Data>]);
    v7 = type metadata accessor for InteractionWrapper(0, v12, v5, v6);
    v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
    v9 = lazy protocol witness table accessor for type [InteractionWrapper<Data>] and conformance [A]();
    v0 = _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lF((void (*)(char *, char *))partial apply for closure #1 in FeatureStoreNSCodingAccessorWithType.retrieve(interactionId:), (uint64_t)&v11, v4, v7, v8, v9, MEMORY[0x24BEE3F20], (uint64_t)v13);
    swift_bridgeObjectRelease();
  }
  return v0;
}

void closure #1 in FeatureStoreNSCodingAccessorWithType.retrieve(interactionId:)(double *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint64_t v20;
  uint8_t *v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  NSObject *v32;
  os_log_type_t v33;
  uint8_t *v34;
  uint64_t v35;
  double v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;

  v37 = a4;
  v38 = a3;
  v7 = type metadata accessor for Logger();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = ((char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v9);
  v13 = ((char *)&v36 - v12);
  v14 = *((_QWORD *)a1 + 1);
  v36 = *a1;
  v15 = a1[2];
  type metadata accessor for NSKeyedUnarchiver();
  v16 = static NSKeyedUnarchiver.unarchivedObject<A>(ofClass:from:)();
  if (!v4)
  {
    v28 = *(_QWORD *)&v36;
    v29 = v37;
    if (v16)
    {
      v39 = v16;
      swift_bridgeObjectRetain();
      InteractionWrapper.init(interactionId:timestamp:feature:)(v28, v14, (uint64_t)&v39, a2, v29, v15);
      return;
    }
    v30 = Logger.accessor.unsafeMutableAddressor();
    v31 = v13;
    (*(void (**)(NSObject *, uint64_t, uint64_t))(v8 + 16))(v13, v30, v7);
    v32 = v13;
    Logger.logObject.getter();
    v33 = OUTLINED_FUNCTION_9_0();
    if (os_log_type_enabled(v32, v33))
    {
      v34 = (uint8_t *)OUTLINED_FUNCTION_5();
      *(_WORD *)v34 = 0;
      _os_log_impl(&dword_212552000, v32, v33, "Deserialization failed. Returned nil object.", v34, 2u);
      OUTLINED_FUNCTION_1();
    }

    (*(void (**)(NSObject *, uint64_t))(v8 + 8))(v31, v7);
    lazy protocol witness table accessor for type FeatureStoreError and conformance FeatureStoreError();
    OUTLINED_FUNCTION_2();
    OUTLINED_FUNCTION_0_0(v35, 0xD000000000000026);
  }
  v17 = Logger.accessor.unsafeMutableAddressor();
  v37 = v8;
  (*(void (**)(NSObject *, uint64_t, uint64_t))(v8 + 16))(v11, v17, v7);
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_7_0();
  v18 = v11;
  Logger.logObject.getter();
  v19 = OUTLINED_FUNCTION_9_0();
  if (os_log_type_enabled(v11, v19))
  {
    v20 = OUTLINED_FUNCTION_5();
    v36 = *(double *)&v11;
    v21 = (uint8_t *)v20;
    v22 = (_QWORD *)OUTLINED_FUNCTION_5();
    *(_DWORD *)v21 = 138412290;
    OUTLINED_FUNCTION_7_0();
    v23 = _swift_stdlib_bridgeErrorToNSError();
    v39 = v23;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *v22 = v23;
    OUTLINED_FUNCTION_5_0();
    OUTLINED_FUNCTION_5_0();
    _os_log_impl(&dword_212552000, v18, v19, "Deserialization failed. Error: %@", v21, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_1();
  }
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_5_0();
  v24 = v37;
  v25 = v38;

  (*(void (**)(NSObject *, uint64_t))(v24 + 8))(v11, v7);
  lazy protocol witness table accessor for type FeatureStoreError and conformance FeatureStoreError();
  v26 = OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(v27, 0xD000000000000026);
  OUTLINED_FUNCTION_5_0();
  *v25 = v26;
}

void FeatureStoreNSCodingAccessorWithType.__allocating_init(identifier:)(uint64_t a1, uint64_t a2)
{
  swift_allocObject();
  BaseStreamAccessor.init(identifier:)(a1, a2);
}

uint64_t FeatureStoreNSCodingAccessorWithType.__deallocating_deinit()
{
  BaseStreamAccessor.deinit();
  return swift_deallocClassInstance();
}

uint64_t vtable thunk for BaseStreamAccessor.insert(interactionId:feature:) dispatching to FeatureStoreNSCodingAccessorWithType.insert(interactionId:feature:)()
{
  return FeatureStoreNSCodingAccessorWithType.insert(interactionId:feature:)();
}

unint64_t vtable thunk for BaseStreamAccessor.retrieve(interactionId:) dispatching to FeatureStoreNSCodingAccessorWithType.retrieve(interactionId:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t *a3@<X8>)
{
  uint64_t v3;
  unint64_t result;

  result = FeatureStoreNSCodingAccessorWithType.retrieve(interactionId:)(a1, a2);
  if (!v3)
    *a3 = result;
  return result;
}

void partial apply for closure #1 in FeatureStoreNSCodingAccessorWithType.retrieve(interactionId:)(double *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;

  closure #1 in FeatureStoreNSCodingAccessorWithType.retrieve(interactionId:)(a1, *(_QWORD *)(v3 + 16), a2, a3);
}

unint64_t lazy protocol witness table accessor for type [InteractionWrapper<Data>] and conformance [A]()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type [InteractionWrapper<Data>] and conformance [A];
  if (!lazy protocol witness table cache variable for type [InteractionWrapper<Data>] and conformance [A])
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for [InteractionWrapper<Data>]);
    result = MEMORY[0x212BEEBCC](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type [InteractionWrapper<Data>] and conformance [A]);
  }
  return result;
}

uint64_t type metadata completion function for FeatureStoreNSCodingAccessorWithType()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for FeatureStoreNSCodingAccessorWithType(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for FeatureStoreNSCodingAccessorWithType);
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x212BEEB54](a1, v6, a5);
}

uint64_t OUTLINED_FUNCTION_0_0@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v2;

  *(_QWORD *)a1 = a2;
  *(_QWORD *)(a1 + 8) = v2 | 0x8000000000000000;
  *(_BYTE *)(a1 + 16) = 0;
  return swift_willThrow();
}

uint64_t OUTLINED_FUNCTION_2()
{
  return swift_allocError();
}

void OUTLINED_FUNCTION_4_0()
{
  void *v0;

}

void OUTLINED_FUNCTION_5_0()
{
  void *v0;

}

id OUTLINED_FUNCTION_6()
{
  void *v0;

  return v0;
}

id OUTLINED_FUNCTION_7_0()
{
  void *v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_8_0()
{
  uint64_t v0;
  unint64_t v1;

  return outlined consume of Data._Representation(v0, v1);
}

uint64_t OUTLINED_FUNCTION_9_0()
{
  return static os_log_type_t.error.getter();
}

void runSimulatableTask<A, B>(interactionId:input:_:)(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void (*a4)(char *)@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  _QWORD v23[2];
  void (*v24)(char *);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v29 = a9;
  v28 = a8;
  v23[1] = a5;
  v24 = a4;
  v32 = a12;
  v31 = a11;
  v17 = *(_QWORD *)(a6 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v19 = (char *)v23 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = type metadata accessor for Optional();
  v23[0] = *(_QWORD *)(v25 - 8);
  MEMORY[0x24BDAC7A8](v25);
  v21 = (char *)v23 - v20;
  v26 = type metadata accessor for FeatureStoreService();
  static FeatureStoreService.insert<A>(interactionId:item:)();
  v27 = a1;
  v28 = a2;
  interactionForInjection<A>(interactionId:)(a1, a2, a7, v31, v32, (uint64_t)v21);
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v19, a3, a6);
  if (__swift_getEnumTagSinglePayload((uint64_t)v21, 1, a7) == 1)
  {
    v22 = v30;
    v24(v19);
    if (v22)
    {
      OUTLINED_FUNCTION_13_0();
      OUTLINED_FUNCTION_25_0();
      return;
    }
    OUTLINED_FUNCTION_13_0();
    OUTLINED_FUNCTION_25_0();
  }
  else
  {
    OUTLINED_FUNCTION_13_0();
    (*(void (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(a7 - 8) + 32))(v29, v21, a7);
  }
  static FeatureStoreService.insert<A>(interactionId:item:)();
}

uint64_t interactionForInjection<A>(interactionId:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
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
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  os_log_type_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  void *v47;
  os_log_type_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  NSObject *v63;
  os_log_type_t v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  uint64_t v68;
  unint64_t v69;
  void (*v70)(char *, uint64_t);
  char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  char *v76;
  void *v77;
  os_log_type_t v78;
  uint64_t v79;
  uint64_t v80;
  unint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  os_log_t v85;
  char *v86;
  uint64_t v87;
  char *v88;
  char *v89;
  uint64_t v90;
  char *v91;
  uint64_t v92;
  uint64_t v93;
  char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  char *v100;

  v92 = a2;
  v93 = a1;
  v10 = type metadata accessor for Logger();
  v98 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_39();
  v96 = v11;
  OUTLINED_FUNCTION_35();
  MEMORY[0x24BDAC7A8](v12);
  v94 = (char *)&v84 - v13;
  OUTLINED_FUNCTION_35();
  MEMORY[0x24BDAC7A8](v14);
  v89 = (char *)&v84 - v15;
  OUTLINED_FUNCTION_35();
  v17 = MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)&v84 - v18;
  v90 = *(_QWORD *)(a3 - 8);
  MEMORY[0x24BDAC7A8](v17);
  OUTLINED_FUNCTION_39();
  v87 = v20;
  OUTLINED_FUNCTION_35();
  MEMORY[0x24BDAC7A8](v21);
  v88 = (char *)&v84 - v22;
  OUTLINED_FUNCTION_35();
  MEMORY[0x24BDAC7A8](v23);
  v91 = (char *)&v84 - v24;
  v25 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  v26 = MEMORY[0x24BDAC7A8](v25);
  v28 = (char *)&v84 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v26);
  v30 = (char *)&v84 - v29;
  type metadata accessor for FeatureStoreService();
  v31 = static FeatureStoreService.interactionIdForInjection()();
  if (v32)
  {
    v33 = v32;
    v86 = v19;
    v97 = v10;
    v95 = a6;
    v34 = v31;
    type metadata accessor for StreamQuery();
    type metadata accessor for Date();
    v35 = a3;
    OUTLINED_FUNCTION_23_0((uint64_t)v30, 1);
    OUTLINED_FUNCTION_23_0((uint64_t)v28, 1);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
    v36 = swift_allocObject();
    *(_OWORD *)(v36 + 16) = xmmword_212575370;
    *(_QWORD *)(v36 + 32) = v34;
    *(_QWORD *)(v36 + 40) = v33;
    swift_bridgeObjectRetain();
    v37 = v36;
    v38 = v35;
    v39 = StreamQuery.__allocating_init(startDate:endDate:interactionIds:)((uint64_t)v30, (uint64_t)v28, v37);
    v40 = static FeatureStoreService.retrieve<A>(query:)((uint64_t)v39, v35, a4, a5);
    v41 = v33;
    v96 = v34;

    v100 = (char *)v40;
    v42 = type metadata accessor for Array();
    MEMORY[0x212BEEBCC](MEMORY[0x24BEE12E0], v42);
    if ((Collection.isEmpty.getter() & 1) != 0)
    {
      OUTLINED_FUNCTION_38();
      v43 = Logger.service.unsafeMutableAddressor();
      v45 = v97;
      v44 = v98;
      v46 = v94;
      OUTLINED_FUNCTION_21((uint64_t)v94, v43, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v98 + 16));
      OUTLINED_FUNCTION_27();
      v47 = (void *)Logger.logObject.getter();
      v48 = static os_log_type_t.debug.getter();
      if (OUTLINED_FUNCTION_14_0(v48))
      {
        OUTLINED_FUNCTION_5();
        v49 = OUTLINED_FUNCTION_5();
        v99 = v38;
        v100 = (char *)v49;
        OUTLINED_FUNCTION_34(4.8151e-34);
        v50 = OUTLINED_FUNCTION_36();
        v99 = OUTLINED_FUNCTION_32(v50, v51);
        OUTLINED_FUNCTION_31();
        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_24_0();
        v99 = OUTLINED_FUNCTION_12_0();
        OUTLINED_FUNCTION_31();
        OUTLINED_FUNCTION_21_0();
        OUTLINED_FUNCTION_28(&dword_212552000, v52, v53, "No injection available for type:%s injectInteractionId:%s");
        OUTLINED_FUNCTION_30();
        OUTLINED_FUNCTION_1();
      }

      OUTLINED_FUNCTION_22_0();
      v70 = *(void (**)(char *, uint64_t))(v44 + 8);
      v71 = v46;
      v72 = v45;
LABEL_15:
      v70(v71, v72);
      v54 = 1;
      a6 = v95;
      return OUTLINED_FUNCTION_23_0(a6, v54);
    }
    v56 = v92;
    v57 = static InjectionCursor.getNextAndIncrement<A>(forType:interactionId:)(v35, v93, v92, v35, a4, a5);
    if (v57 >= MEMORY[0x212BEE11C](v40, v35))
    {
      OUTLINED_FUNCTION_38();
      v73 = Logger.service.unsafeMutableAddressor();
      v75 = v97;
      v74 = v98;
      v76 = v89;
      (*(void (**)(char *, uint64_t, uint64_t))(v98 + 16))(v89, v73, v97);
      OUTLINED_FUNCTION_27();
      v77 = (void *)Logger.logObject.getter();
      v78 = static os_log_type_t.error.getter();
      if (OUTLINED_FUNCTION_14_0(v78))
      {
        OUTLINED_FUNCTION_5();
        v79 = OUTLINED_FUNCTION_5();
        v99 = v35;
        v100 = (char *)v79;
        OUTLINED_FUNCTION_34(4.8151e-34);
        v80 = String.init<A>(describing:)();
        v99 = OUTLINED_FUNCTION_32(v80, v81);
        OUTLINED_FUNCTION_31();
        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_24_0();
        v99 = OUTLINED_FUNCTION_12_0();
        OUTLINED_FUNCTION_31();
        OUTLINED_FUNCTION_21_0();
        OUTLINED_FUNCTION_28(&dword_212552000, v82, v83, "Used up all injection values for type: %s injectInteractionId:%s");
        OUTLINED_FUNCTION_30();
        OUTLINED_FUNCTION_1();
      }

      OUTLINED_FUNCTION_22_0();
      v70 = *(void (**)(char *, uint64_t))(v74 + 8);
      v71 = v76;
      v72 = v75;
      goto LABEL_15;
    }
    v58 = v91;
    Array.subscript.getter();
    OUTLINED_FUNCTION_38();
    v59 = Logger.service.unsafeMutableAddressor();
    v60 = v98;
    (*(void (**)(char *, uint64_t, uint64_t))(v98 + 16))(v86, v59, v97);
    v61 = v90;
    v62 = v88;
    v94 = *(char **)(v90 + 16);
    ((void (*)(char *, char *, uint64_t))v94)(v88, v58, v38);
    swift_bridgeObjectRetain_n();
    OUTLINED_FUNCTION_27();
    v63 = Logger.logObject.getter();
    v64 = static os_log_type_t.debug.getter();
    if (OUTLINED_FUNCTION_14_0(v64))
    {
      v65 = OUTLINED_FUNCTION_5();
      v89 = (char *)OUTLINED_FUNCTION_5();
      v99 = v38;
      v100 = v89;
      *(_DWORD *)v65 = 136316162;
      swift_getMetatypeMetadata();
      v66 = OUTLINED_FUNCTION_36();
      v85 = v63;
      v99 = OUTLINED_FUNCTION_32(v66, v67);
      OUTLINED_FUNCTION_6_0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v65 + 12) = 2080;
      swift_bridgeObjectRetain();
      v99 = OUTLINED_FUNCTION_12_0();
      OUTLINED_FUNCTION_6_0();
      OUTLINED_FUNCTION_21_0();
      *(_WORD *)(v65 + 22) = 2080;
      swift_bridgeObjectRetain();
      v99 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v93, v56, (uint64_t *)&v100);
      OUTLINED_FUNCTION_6_0();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v65 + 32) = 2080;
      ((void (*)(uint64_t, char *, uint64_t))v94)(v87, v62, v38);
      v68 = String.init<A>(describing:)();
      v99 = OUTLINED_FUNCTION_32(v68, v69);
      OUTLINED_FUNCTION_6_0();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_41(*(uint64_t (**)(uint64_t, uint64_t))(v90 + 8));
      *(_WORD *)(v65 + 42) = 2048;
      v99 = v57;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl(&dword_212552000, v85, v41, "=== Injecting Value ===\ntype:%s\ninjectInteractionId:%s\ninteractionId:%s\nvalue: %s\nvalueIndex: %ld", (uint8_t *)v65, 0x34u);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_1();
    }
    swift_bridgeObjectRelease_n();
    OUTLINED_FUNCTION_22_0();
    OUTLINED_FUNCTION_41(*(uint64_t (**)(uint64_t, uint64_t))(v61 + 8));

    (*(void (**)(char *, uint64_t))(v60 + 8))(v86, v97);
    a6 = v95;
    (*(void (**)(uint64_t, char *, uint64_t))(v61 + 32))(v95, v91, v38);
    v54 = 0;
  }
  else
  {
    v54 = 1;
  }
  return OUTLINED_FUNCTION_23_0(a6, v54);
}

uint64_t runSimulatableTask<A, B>(interactionId:input:task:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;

  v9 = OUTLINED_FUNCTION_2_0(a1, a2, a3, a4, a5, a6, a7, a8);
  v10 = OUTLINED_FUNCTION_33(v9);
  v8[16] = v10;
  v8[17] = *(_QWORD *)(v10 - 8);
  v8[18] = OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_40();
  return OUTLINED_FUNCTION_17_0();
}

#error "21255C7D4: call analysis failed (funcsize=30)"

uint64_t runSimulatableTask<A, B>(interactionId:input:task:)()
{
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_40();
  return OUTLINED_FUNCTION_16_0();
}

uint64_t one-time initialization function for lock()
{
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for ManagedBuffer<(), os_unfair_lock_s>);
  result = swift_allocObject();
  *(_DWORD *)(result + 16) = 0;
  qword_254B518E8 = result;
  return result;
}

uint64_t one-time initialization function for cursors()
{
  uint64_t result;

  result = Dictionary.init(dictionaryLiteral:)();
  qword_254B518F8 = result;
  return result;
}

uint64_t static InjectionCursor.getNextAndIncrement<A>(forType:interactionId:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11;
  os_unfair_lock_s *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v16[10];

  v11 = a1;
  if (_MergedGlobals_0 != -1)
    a1 = swift_once();
  v12 = (os_unfair_lock_s *)qword_254B518E8;
  MEMORY[0x24BDAC7A8](a1);
  v16[2] = a4;
  v16[3] = a5;
  v16[4] = a6;
  v16[5] = v11;
  v16[6] = a2;
  v16[7] = a3;
  swift_retain();
  specialized OSAllocatedUnfairLock<A>.withLock<A>(_:)((_QWORD *(*)(uint64_t *__return_ptr))partial apply for closure #1 in static InjectionCursor.getNextAndIncrement<A>(forType:interactionId:), (uint64_t)v16, v12);
  v14 = v13;
  swift_release();
  return v14;
}

void specialized OSAllocatedUnfairLock<A>.withLock<A>(_:)(_QWORD *(*a1)(uint64_t *__return_ptr), uint64_t a2, os_unfair_lock_s *a3)
{
  os_unfair_lock_s *v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a3 + 4;
  os_unfair_lock_lock(a3 + 4);
  specialized closure #1 in OSAllocatedUnfairLock<A>.withLock<A>(_:)(v5, a1, &v6);
  os_unfair_lock_unlock(v4);
}

uint64_t static FeatureStoreService.interactionIdForInjection()()
{
  id v0;
  id v1;
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;

  v0 = objc_allocWithZone(MEMORY[0x24BDBCF50]);
  v1 = @nonobjc NSUserDefaults.init(suiteName:)(0xD000000000000013, 0x8000000212576E60);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = (void *)MEMORY[0x212BEE02C](0xD00000000000001CLL, 0x8000000212576E80);
  v4 = objc_msgSend(v2, sel_stringForKey_, v3);

  if (!v4)
  {

    return 0;
  }
  v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();

  return v5;
}

uint64_t static FeatureStoreService.runReplayableOperation<A, B>(interactionId:input:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;

  v9 = OUTLINED_FUNCTION_2_0(a1, a2, a3, a4, a5, a6, a7, a8);
  v10 = OUTLINED_FUNCTION_33(v9);
  v8[16] = v10;
  v8[17] = *(_QWORD *)(v10 - 8);
  v8[18] = OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_40();
  return OUTLINED_FUNCTION_17_0();
}

#error "21255CB58: call analysis failed (funcsize=30)"

uint64_t static FeatureStoreService.runReplayableOperation<A, B>(interactionId:input:_:)()
{
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_40();
  return OUTLINED_FUNCTION_16_0();
}

{
  uint64_t v0;

  OUTLINED_FUNCTION_37();
  OUTLINED_FUNCTION_21(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 120), *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 + 112) + 32));
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_44();
  OUTLINED_FUNCTION_42();
  return OUTLINED_FUNCTION_0_1(*(uint64_t (**)(void))(v0 + 8));
}

{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

id @nonobjc NSUserDefaults.init(suiteName:)(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  id v4;

  if (a2)
  {
    v3 = (void *)MEMORY[0x212BEE02C]();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  v4 = objc_msgSend(v2, sel_initWithSuiteName_, v3);

  return v4;
}

_QWORD *specialized closure #1 in OSAllocatedUnfairLock<A>.withLock<A>(_:)(uint64_t a1, _QWORD *(*a2)(uint64_t *__return_ptr))
{
  uint64_t v2;
  _QWORD *result;
  uint64_t v4;

  result = a2(&v4);
  if (!v2)
    return (_QWORD *)v4;
  return result;
}

uint64_t partial apply for closure #1 in static InjectionCursor.getNextAndIncrement<A>(forType:interactionId:)@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  Swift::String v6;
  Swift::String v7;
  uint64_t v8;
  unint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v3 = *(_QWORD *)(v1 + 48);
  v4 = *(void **)(v1 + 56);
  swift_getMetatypeMetadata();
  v14 = String.init<A>(describing:)();
  v15 = v5;
  swift_bridgeObjectRetain();
  v6._countAndFlagsBits = 58;
  v6._object = (void *)0xE100000000000000;
  String.append(_:)(v6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  v7._countAndFlagsBits = v3;
  v7._object = v4;
  String.append(_:)(v7);
  swift_bridgeObjectRelease();
  if (qword_254B518F0 != -1)
    swift_once();
  swift_beginAccess();
  v8 = qword_254B518F8;
  if (*(_QWORD *)(qword_254B518F8 + 16))
  {
    swift_bridgeObjectRetain();
    v9 = specialized __RawDictionaryStorage.find<A>(_:)(v14, v15);
    if ((v10 & 1) != 0)
      v11 = *(_QWORD *)(*(_QWORD *)(v8 + 56) + 8 * v9);
    else
      v11 = -1;
    swift_bridgeObjectRelease();
  }
  else
  {
    v11 = -1;
  }
  result = swift_endAccess();
  v13 = v11 + 1;
  if (__OFADD__(v11, 1))
  {
    __break(1u);
  }
  else
  {
    swift_beginAccess();
    specialized Dictionary._Variant.setValue(_:forKey:)(v13, v14, v15);
    swift_endAccess();
    result = swift_bridgeObjectRelease();
    *a1 = v13;
  }
  return result;
}

ValueMetadata *type metadata accessor for InjectionCursor()
{
  return &type metadata for InjectionCursor;
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(uint64_t a1, uint64_t a2)
{
  Swift::Int v4;

  Hasher.init(_seed:)();
  String.hash(into:)();
  v4 = Hasher._finalize()();
  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, a2, v4);
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

uint64_t specialized Dictionary._Variant.setValue(_:forKey:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v9;

  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v9 = *v3;
  *v3 = 0x8000000000000000;
  specialized _NativeDictionary.setValue(_:forKey:isUnique:)(a1, a2, a3, isUniquelyReferenced_nonNull_native);
  *v3 = v9;
  return swift_bridgeObjectRelease();
}

uint64_t specialized _NativeDictionary.setValue(_:forKey:isUnique:)(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD **v5;
  _QWORD *v10;
  unint64_t v11;
  char v12;
  uint64_t v13;
  _BOOL8 v14;
  Swift::Int v15;
  unint64_t v16;
  char v17;
  uint64_t result;
  char v19;
  _QWORD *v20;

  v5 = (_QWORD **)v4;
  v10 = (_QWORD *)*v4;
  v11 = specialized __RawDictionaryStorage.find<A>(_:)(a2, a3);
  v13 = v10[2];
  v14 = (v12 & 1) == 0;
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_9;
  }
  v16 = v11;
  v17 = v12;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _NativeDictionary<String, Int>);
  result = _NativeDictionary.ensureUnique(isUnique:capacity:)(a4 & 1, v15);
  if ((result & 1) == 0)
    goto LABEL_5;
  result = specialized __RawDictionaryStorage.find<A>(_:)(a2, a3);
  if ((v17 & 1) != (v19 & 1))
  {
LABEL_9:
    result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
  v16 = result;
LABEL_5:
  v20 = *v5;
  if ((v17 & 1) != 0)
  {
    *(_QWORD *)(v20[7] + 8 * v16) = a1;
  }
  else
  {
    specialized _NativeDictionary._insert(at:key:value:)(v16, a2, a3, a1, v20);
    return swift_bridgeObjectRetain();
  }
  return result;
}

unint64_t specialized _NativeDictionary._insert(at:key:value:)(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  _QWORD *v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;

  a5[(result >> 6) + 8] |= 1 << result;
  v5 = (_QWORD *)(a5[6] + 16 * result);
  *v5 = a2;
  v5[1] = a3;
  *(_QWORD *)(a5[7] + 8 * result) = a4;
  v6 = a5[2];
  v7 = __OFADD__(v6, 1);
  v8 = v6 + 1;
  if (v7)
    __break(1u);
  else
    a5[2] = v8;
  return result;
}

_QWORD *specialized closure #1 in OSAllocatedUnfairLock<A>.withLock<A>(_:)@<X0>(uint64_t a1@<X0>, _QWORD *(*a2)(uint64_t *__return_ptr)@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v3;
  _QWORD *result;

  result = specialized closure #1 in OSAllocatedUnfairLock<A>.withLock<A>(_:)(a1, a2);
  if (!v3)
    *a3 = result;
  return result;
}

void type metadata accessor for os_unfair_lock_s()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!lazy cache variable for type metadata for os_unfair_lock_s)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&lazy cache variable for type metadata for os_unfair_lock_s);
  }
}

uint64_t OUTLINED_FUNCTION_0_1(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_2_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;

  v10 = *(_OWORD *)(v9 + 16);
  v11 = *(_QWORD *)(v9 + 40);
  *(_QWORD *)(v8 + 96) = *(_QWORD *)(v9 + 32);
  *(_QWORD *)(v8 + 104) = v11;
  *(_OWORD *)(v8 + 80) = v10;
  *(_QWORD *)(v8 + 64) = a7;
  *(_QWORD *)(v8 + 72) = a8;
  *(_QWORD *)(v8 + 48) = a5;
  *(_QWORD *)(v8 + 56) = a6;
  *(_QWORD *)(v8 + 32) = a3;
  *(_QWORD *)(v8 + 40) = a4;
  *(_QWORD *)(v8 + 16) = a1;
  *(_QWORD *)(v8 + 24) = a2;
  *(_QWORD *)(v8 + 112) = *(_QWORD *)(a8 - 8);
  return swift_task_alloc();
}

void OUTLINED_FUNCTION_3_0()
{
  static FeatureStoreService.insert<A>(interactionId:item:)();
}

uint64_t OUTLINED_FUNCTION_4_1()
{
  _QWORD *v0;

  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(v0[14] + 32))(v0[2], v0[18], v0[9]);
}

void OUTLINED_FUNCTION_5_1(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 152) = a1;
  static FeatureStoreService.insert<A>(interactionId:item:)();
}

uint64_t OUTLINED_FUNCTION_6_0()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t OUTLINED_FUNCTION_7_1(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return a3();
}

uint64_t OUTLINED_FUNCTION_8_1()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_9_1()
{
  return type metadata accessor for FeatureStoreService();
}

uint64_t OUTLINED_FUNCTION_10_0()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;

  v3 = *v1;
  v4 = (uint64_t *)(v2 - 8);
  *v4 = *v1;
  *v4 = *v1;
  *(_QWORD *)(v3 + 168) = v0;
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_12_0()
{
  unint64_t v0;
  uint64_t v1;

  return getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(*(_QWORD *)(v1 - 128), v0, (uint64_t *)(v1 - 96));
}

uint64_t OUTLINED_FUNCTION_13_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v0, v2);
}

BOOL OUTLINED_FUNCTION_14_0(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_15_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  return interactionForInjection<A>(interactionId:)(v10, v13, v12, v11, a9, v9);
}

uint64_t OUTLINED_FUNCTION_16_0()
{
  return swift_task_switch();
}

uint64_t OUTLINED_FUNCTION_17_0()
{
  return swift_task_switch();
}

void OUTLINED_FUNCTION_18_0()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_19_0(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 160) = a1;
  *a1 = v2;
  a1[1] = v1;
  return *(_QWORD *)(v2 + 120);
}

uint64_t OUTLINED_FUNCTION_20_0()
{
  _QWORD *v0;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v0[17] + 8))(v0[18], v0[16]);
}

uint64_t OUTLINED_FUNCTION_21_0()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_22_0()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_23_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v2);
}

uint64_t OUTLINED_FUNCTION_24_0()
{
  uint64_t v0;

  *(_WORD *)(v0 + 12) = 2080;
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_25_0()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(v1 - 160) + 8))(v0, *(_QWORD *)(v1 - 136));
}

uint64_t OUTLINED_FUNCTION_27()
{
  return swift_bridgeObjectRetain();
}

void OUTLINED_FUNCTION_28(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  uint8_t *v5;
  os_log_type_t v6;

  _os_log_impl(a1, v4, v6, a4, v5, 0x16u);
}

uint64_t OUTLINED_FUNCTION_29()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_30()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_31()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t OUTLINED_FUNCTION_32(uint64_t a1, unint64_t a2)
{
  uint64_t v2;

  return getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a1, a2, (uint64_t *)(v2 - 96));
}

uint64_t OUTLINED_FUNCTION_33(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 120) = a1;
  return type metadata accessor for Optional();
}

uint64_t OUTLINED_FUNCTION_34(float a1)
{
  float *v1;

  *v1 = a1;
  return swift_getMetatypeMetadata();
}

uint64_t OUTLINED_FUNCTION_36()
{
  return String.init<A>(describing:)();
}

uint64_t OUTLINED_FUNCTION_38()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_41@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

uint64_t OUTLINED_FUNCTION_42()
{
  return swift_task_dealloc();
}

id OUTLINED_FUNCTION_43()
{
  void *v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_44()
{
  return swift_task_dealloc();
}

uint64_t BaseFeatureWrapper.feature.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v1 + 80) - 8) + 16))(a1, v1 + *(_QWORD *)(*(_QWORD *)v1 + 88));
}

id @objc BaseFeatureWrapper.interactionId.getter()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;

  OUTLINED_FUNCTION_1_0();
  v2 = (void *)MEMORY[0x212BEE02C](v0, v1);
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t BaseFeatureWrapper.interactionId.getter()
{
  uint64_t v0;

  OUTLINED_FUNCTION_1_0();
  return v0;
}

uint64_t @objc BaseFeatureWrapper.dataVersion.getter(uint64_t a1)
{
  return *(unsigned int *)(a1 + *(_QWORD *)(*(_QWORD *)a1 + 104));
}

uint64_t BaseFeatureWrapper.dataVersion.getter()
{
  uint64_t v0;

  return *(unsigned int *)(v0 + *(_QWORD *)(*(_QWORD *)v0 + 104));
}

uint64_t BaseFeatureWrapper.__allocating_init(interactionId:dataVersion:feature:)(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;

  v8 = swift_allocObject();
  BaseFeatureWrapper.init(interactionId:dataVersion:feature:)(a1, a2, a3, a4);
  return v8;
}

uint64_t *BaseFeatureWrapper.init(interactionId:dataVersion:feature:)(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t *v4;
  uint64_t v5;
  _QWORD *v6;

  v5 = *v4;
  v6 = (uint64_t *)((char *)v4 + *(_QWORD *)(*v4 + 96));
  *v6 = a1;
  v6[1] = a2;
  *(_DWORD *)((char *)v4 + *(_QWORD *)(*v4 + 104)) = a3;
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(v5 + 80) - 8) + 32))((uint64_t)v4 + *(_QWORD *)(*v4 + 88), a4);
  return v4;
}

uint64_t BaseFeatureWrapper.serialize()()
{
  return 0;
}

uint64_t static BaseFeatureWrapper.deserialize(_:dataVersion:interactionId:)()
{
  return 0;
}

id @objc static BaseFeatureWrapper.deserialize(_:dataVersion:interactionId:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;

  v6 = a3;
  v7 = a5;
  v8 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  v10 = v9;

  static String._unconditionallyBridgeFromObjectiveC(_:)();
  swift_bridgeObjectRelease();
  outlined consume of Data._Representation(v8, v10);
  return 0;
}

Swift::String_optional __swiftcall BaseFeatureWrapper.json()()
{
  uint64_t v0;
  void *v1;
  Swift::String_optional result;

  v0 = 0;
  v1 = 0;
  result.value._object = v1;
  result.value._countAndFlagsBits = v0;
  return result;
}

uint64_t BaseFeatureWrapper.deinit()
{
  uint64_t v0;

  (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v0 + 80) - 8) + 8))(v0 + *(_QWORD *)(*(_QWORD *)v0 + 88));
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t BaseFeatureWrapper.__deallocating_deinit()
{
  BaseFeatureWrapper.deinit();
  return swift_deallocClassInstance();
}

uint64_t type metadata completion function for BaseFeatureWrapper()
{
  uint64_t result;
  unint64_t v1;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t type metadata accessor for BaseFeatureWrapper(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for BaseFeatureWrapper);
}

id OUTLINED_FUNCTION_0_2()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_1_0()
{
  return swift_bridgeObjectRetain();
}

uint64_t AceObjectFeatureWrapper.serialize()()
{
  id *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  os_log_type_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  os_log_type_t v21;
  _DWORD *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v27[2];
  id v28[2];

  v28[1] = *(id *)MEMORY[0x24BDAC8D0];
  v1 = OUTLINED_FUNCTION_10_1();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = MEMORY[0x24BDAC7A8](v1);
  v5 = (char *)v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)v27 - v6;
  v8 = objc_msgSend(v0[2], sel_dictionary);
  if (!v8)
  {
    v14 = Logger.accessor.unsafeMutableAddressor();
    OUTLINED_FUNCTION_11_0(v14, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 16));
    OUTLINED_FUNCTION_13_1();
    v15 = OUTLINED_FUNCTION_9_0();
    if (OUTLINED_FUNCTION_5_2(v15))
    {
      *(_WORD *)OUTLINED_FUNCTION_5() = 0;
      OUTLINED_FUNCTION_3_1(&dword_212552000, v16, v17, "AceObject dictionary is nil.");
      OUTLINED_FUNCTION_0_3();
    }

    (*(void (**)(char *, uint64_t))(v2 + 8))(v7, v1);
    return 0;
  }
  v9 = v8;
  v10 = (void *)objc_opt_self();
  v28[0] = 0;
  v11 = objc_msgSend(v10, sel_dataWithJSONObject_options_error_, v9, 0, v28);
  v12 = v28[0];
  if (!v11)
  {
    v18 = v12;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    v19 = Logger.accessor.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v5, v19, v1);
    OUTLINED_FUNCTION_7_2();
    OUTLINED_FUNCTION_7_2();
    v20 = (void *)Logger.logObject.getter();
    v21 = static os_log_type_t.error.getter();
    if (OUTLINED_FUNCTION_9_2(v21))
    {
      v22 = (_DWORD *)OUTLINED_FUNCTION_5();
      v27[0] = OUTLINED_FUNCTION_5();
      *v22 = 138412290;
      OUTLINED_FUNCTION_7_2();
      v23 = (void *)_swift_stdlib_bridgeErrorToNSError();
      v28[0] = v23;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_QWORD *)v27[0] = v23;
      OUTLINED_FUNCTION_2_1();
      OUTLINED_FUNCTION_2_1();
      OUTLINED_FUNCTION_8_2(&dword_212552000, v24, v25, "Serialization failed. Error: %@");
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_1();
    }
    OUTLINED_FUNCTION_2_1();
    OUTLINED_FUNCTION_2_1();
    OUTLINED_FUNCTION_2_1();

    (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v1);
    return 0;
  }
  v13 = static Data._unconditionallyBridgeFromObjectiveC(_:)();

  return v13;
}

id @objc AceObjectFeatureWrapper.serialize()()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t v2;
  Class isa;

  swift_retain();
  v0 = AceObjectFeatureWrapper.serialize()();
  v2 = v1;
  swift_release();
  if (v2 >> 60 == 15)
    return OUTLINED_FUNCTION_6_1(0);
  isa = Data._bridgeToObjectiveC()().super.isa;
  outlined consume of Data?(v0, v2);
  return OUTLINED_FUNCTION_6_1(isa);
}

uint64_t static AceObjectFeatureWrapper.deserialize(_:dataVersion:interactionId:)(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  _BYTE *v15;
  void *v16;
  Class isa;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  Class v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t result;
  uint64_t v27;
  os_log_type_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  void (*v33)(_BYTE *, uint64_t, uint64_t);
  void *v34;
  os_log_type_t v35;
  _DWORD *v36;
  _QWORD *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  _BYTE v41[12];
  int v42;
  uint64_t v43;
  id v44[5];

  v6 = v5;
  v43 = a4;
  v44[4] = *(id *)MEMORY[0x24BDAC8D0];
  v9 = OUTLINED_FUNCTION_10_1();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = &v41[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v11);
  v15 = &v41[-v14];
  v16 = (void *)objc_opt_self();
  isa = Data._bridgeToObjectiveC()().super.isa;
  v44[0] = 0;
  v18 = objc_msgSend(v16, sel_JSONObjectWithData_options_error_, isa, 0, v44);

  if (v18)
  {
    v19 = v44[0];
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [AnyHashable : Any]);
    if ((swift_dynamicCast() & 1) == 0)
      goto LABEL_6;
    v42 = a3;
    v13 = *(_BYTE **)(v6 + 144);
    v20 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
    v21 = v9;
    v22 = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    v23 = objc_msgSend(v20, sel_initWithDictionary_, v22);

    v9 = v21;
    if (v23)
    {
      type metadata accessor for AceObjectFeatureWrapper(0, (uint64_t)v13, v24, v25);
      swift_bridgeObjectRetain();
      AceObjectFeatureWrapper.__allocating_init(interactionId:dataVersion:feature:)(v43, a5, v42, (uint64_t)v23);
      result = swift_dynamicCastClass();
      if (result)
        return result;
      swift_release();
    }
    else
    {
LABEL_6:
      v27 = Logger.accessor.unsafeMutableAddressor();
      (*(void (**)(_BYTE *, uint64_t, uint64_t))(v10 + 16))(v15, v27, v9);
      OUTLINED_FUNCTION_13_1();
      v28 = OUTLINED_FUNCTION_9_0();
      if (OUTLINED_FUNCTION_5_2(v28))
      {
        *(_WORD *)OUTLINED_FUNCTION_5() = 0;
        OUTLINED_FUNCTION_3_1(&dword_212552000, v29, v30, "Could not create AceObject.");
        OUTLINED_FUNCTION_0_3();
      }

      (*(void (**)(_BYTE *, uint64_t))(v10 + 8))(v15, v9);
    }
  }
  else
  {
    v31 = v44[0];
    _convertNSErrorToError(_:)();

    swift_willThrow();
    v32 = Logger.accessor.unsafeMutableAddressor();
    v33 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v10 + 16);
    v43 = v9;
    v33(v13, v32, v9);
    OUTLINED_FUNCTION_7_2();
    OUTLINED_FUNCTION_7_2();
    v34 = (void *)Logger.logObject.getter();
    v35 = static os_log_type_t.error.getter();
    if (OUTLINED_FUNCTION_9_2(v35))
    {
      v36 = (_DWORD *)OUTLINED_FUNCTION_5();
      v37 = (_QWORD *)OUTLINED_FUNCTION_5();
      *v36 = 138412290;
      OUTLINED_FUNCTION_7_2();
      v38 = (void *)_swift_stdlib_bridgeErrorToNSError();
      v44[0] = v38;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *v37 = v38;
      OUTLINED_FUNCTION_2_1();
      OUTLINED_FUNCTION_2_1();
      OUTLINED_FUNCTION_8_2(&dword_212552000, v39, v40, "Deserialization failed. Error: %@");
      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSObject?);
      swift_arrayDestroy();
      OUTLINED_FUNCTION_1();
    }
    OUTLINED_FUNCTION_2_1();
    OUTLINED_FUNCTION_2_1();
    OUTLINED_FUNCTION_2_1();

    (*(void (**)(_BYTE *, uint64_t))(v10 + 8))(v13, v43);
  }
  return 0;
}

uint64_t *AceObjectFeatureWrapper.__allocating_init(interactionId:dataVersion:feature:)(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  swift_allocObject();
  return AceObjectFeatureWrapper.init(interactionId:dataVersion:feature:)(a1, a2, a3, a4);
}

id @objc static AceObjectFeatureWrapper.deserialize(_:dataVersion:interactionId:)(uint64_t a1, uint64_t a2, void *a3, int a4, void *a5)
{
  id v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  v7 = a3;
  v8 = a5;
  v9 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  v11 = v10;

  v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v14 = v13;

  swift_getObjCClassMetadata();
  v15 = (void *)static AceObjectFeatureWrapper.deserialize(_:dataVersion:interactionId:)(v9, v11, a4, v12, v14);
  swift_bridgeObjectRelease();
  outlined consume of Data._Representation(v9, v11);
  return v15;
}

Swift::String_optional __swiftcall AceObjectFeatureWrapper.json()()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  os_log_type_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  Swift::String_optional result;
  uint64_t v21;

  v1 = OUTLINED_FUNCTION_10_1();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for String.Encoding();
  v6 = MEMORY[0x24BDAC7A8](v5);
  v7 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v0 + 120))(v6);
  if (v8 >> 60 == 15)
  {
    v9 = Logger.accessor.unsafeMutableAddressor();
    OUTLINED_FUNCTION_11_0(v9, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 16));
    OUTLINED_FUNCTION_13_1();
    v10 = OUTLINED_FUNCTION_9_0();
    if (OUTLINED_FUNCTION_5_2(v10))
    {
      *(_WORD *)OUTLINED_FUNCTION_5() = 0;
      OUTLINED_FUNCTION_3_1(&dword_212552000, v11, v12, "Json fetch failed.");
      OUTLINED_FUNCTION_0_3();
    }

    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    v13 = 0;
    v14 = 0;
  }
  else
  {
    v15 = v7;
    v16 = v8;
    static String.Encoding.utf8.getter();
    v13 = String.init(data:encoding:)();
    v14 = v17;
    outlined consume of Data?(v15, v16);
  }
  v18 = v13;
  v19 = v14;
  result.value._object = v19;
  result.value._countAndFlagsBits = v18;
  return result;
}

id @objc AceObjectFeatureWrapper.json()()
{
  Swift::String_optional v0;
  void *v1;

  swift_retain();
  v0 = AceObjectFeatureWrapper.json()();
  swift_release();
  if (!v0.value._object)
    return OUTLINED_FUNCTION_6_1(0);
  v1 = (void *)MEMORY[0x212BEE02C](v0.value._countAndFlagsBits, v0.value._object);
  swift_bridgeObjectRelease();
  return OUTLINED_FUNCTION_6_1(v1);
}

uint64_t *AceObjectFeatureWrapper.init(interactionId:dataVersion:feature:)(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;

  v5 = a4;
  return BaseFeatureWrapper.init(interactionId:dataVersion:feature:)(a1, a2, a3, (uint64_t)&v5);
}

uint64_t AceObjectFeatureWrapper.__deallocating_deinit()
{
  BaseFeatureWrapper.deinit();
  return swift_deallocClassInstance();
}

uint64_t *vtable thunk for BaseFeatureWrapper.__allocating_init(interactionId:dataVersion:feature:) dispatching to AceObjectFeatureWrapper.__allocating_init(interactionId:dataVersion:feature:)(uint64_t a1, uint64_t a2, int a3, uint64_t *a4)
{
  return AceObjectFeatureWrapper.__allocating_init(interactionId:dataVersion:feature:)(a1, a2, a3, *a4);
}

uint64_t type metadata accessor for AceObjectFeatureWrapper(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for AceObjectFeatureWrapper);
}

void OUTLINED_FUNCTION_0_3()
{
  JUMPOUT(0x212BEEC50);
}

void OUTLINED_FUNCTION_2_1()
{
  void *v0;

}

void OUTLINED_FUNCTION_3_1(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;

  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

BOOL OUTLINED_FUNCTION_5_2(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

id OUTLINED_FUNCTION_6_1(id a1)
{
  return a1;
}

id OUTLINED_FUNCTION_7_2()
{
  void *v0;

  return v0;
}

void OUTLINED_FUNCTION_8_2(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  uint8_t *v5;
  os_log_type_t v6;

  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

BOOL OUTLINED_FUNCTION_9_2(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_10_1()
{
  return type metadata accessor for Logger();
}

uint64_t OUTLINED_FUNCTION_11_0@<X0>(uint64_t a1@<X1>, uint64_t (*a2)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  return a2(v3, a1, v2);
}

uint64_t OUTLINED_FUNCTION_13_1()
{
  return Logger.logObject.getter();
}

uint64_t outlined copy of FeatureStoreError(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t result;

  if (a3 <= 2u)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t destroy for FeatureStoreError(uint64_t a1)
{
  return outlined consume of FeatureStoreError(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t outlined consume of FeatureStoreError(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  uint64_t result;

  if (a3 <= 2u)
    return swift_bridgeObjectRelease();
  return result;
}

void initializeBufferWithCopyOfBuffer for FeatureStoreError(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;

  OUTLINED_FUNCTION_0_4(a1, a2);
  *(_QWORD *)v2 = v3;
  *(_QWORD *)(v2 + 8) = v4;
  *(_BYTE *)(v2 + 16) = v5;
  OUTLINED_FUNCTION_1_1();
}

void assignWithCopy for FeatureStoreError(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  unsigned __int8 v8;

  OUTLINED_FUNCTION_0_4(a1, a2);
  v6 = *(_QWORD *)v2;
  v7 = *(_QWORD *)(v2 + 8);
  *(_QWORD *)v2 = v3;
  *(_QWORD *)(v2 + 8) = v4;
  v8 = *(_BYTE *)(v2 + 16);
  *(_BYTE *)(v2 + 16) = v5;
  outlined consume of FeatureStoreError(v6, v7, v8);
  OUTLINED_FUNCTION_1_1();
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for FeatureStoreError(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 v6;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(_QWORD *)a1;
  v5 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  v6 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v3;
  outlined consume of FeatureStoreError(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for FeatureStoreError(uint64_t a1, unsigned int a2)
{
  int v2;
  unsigned int v3;

  if (a2)
  {
    if (a2 >= 0xFE && *(_BYTE *)(a1 + 17))
    {
      v2 = *(_DWORD *)a1 + 253;
    }
    else
    {
      v3 = *(unsigned __int8 *)(a1 + 16);
      if (v3 <= 2)
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

uint64_t storeEnumTagSinglePayload for FeatureStoreError(uint64_t result, unsigned int a2, unsigned int a3)
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

uint64_t getEnumTag for FeatureStoreError(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t destructiveInjectEnumTag for FeatureStoreError(uint64_t result, char a2)
{
  *(_BYTE *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for FeatureStoreError()
{
  return &type metadata for FeatureStoreError;
}

uint64_t OUTLINED_FUNCTION_0_4(uint64_t a1, uint64_t a2)
{
  return outlined copy of FeatureStoreError(*(_QWORD *)a2, *(_QWORD *)(a2 + 8), *(_BYTE *)(a2 + 16));
}

id INIntentResponse.fsf_serialize()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  id result;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v0 = type metadata accessor for String.Encoding();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = (id)INSJSONEncodedIntentResponse();
  if (result)
  {
    v5 = result;
    static String._unconditionallyBridgeFromObjectiveC(_:)();

    static String.Encoding.utf8.getter();
    v6 = String.data(using:allowLossyConversion:)();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    return (id)v6;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id static INIntentResponse.fsf_deserialize(from:)()
{
  Class isa;
  id v1;

  isa = Data._bridgeToObjectiveC()().super.isa;
  v1 = (id)INIntentResponseCreate();

  return v1;
}

id protocol witness for Serializable.fsf_serialize() in conformance INIntentResponse()
{
  return INIntentResponse.fsf_serialize()();
}

id protocol witness for static Serializable.fsf_deserialize(from:) in conformance INIntentResponse@<X0>(_QWORD *a1@<X8>)
{
  id result;

  result = static INIntentResponse.fsf_deserialize(from:)();
  *a1 = result;
  return result;
}

uint64_t FeatureStoreStreamAccessor.stream.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + OBJC_IVAR____TtC12FeatureStore26FeatureStoreStreamAccessor_stream;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Streams.StoreStream<FeatureStoreBiomeEvent>);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t FeatureStoreStreamAccessor.__allocating_init(identifier:)()
{
  uint64_t v0;

  v0 = swift_allocObject();
  FeatureStoreStreamAccessor.init(identifier:)();
  return v0;
}

uint64_t FeatureStoreStreamAccessor.init(identifier:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  id v6;

  v1 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Streams.StoreStream<FeatureStoreBiomeEvent>)
                 - 8);
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_8();
  v4 = v3 - v2;
  v5 = objc_msgSend((id)objc_opt_self(), sel_biomeStoreConfig);
  *(_QWORD *)(v0 + 16) = v5;
  type metadata accessor for FeatureStoreBiomeEvent();
  v6 = v5;
  Streams.StoreStream.init(_:storeConfig:)();
  OUTLINED_FUNCTION_11_1(v0 + OBJC_IVAR____TtC12FeatureStore26FeatureStoreStreamAccessor_stream, v4, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v1 + 32));
  return v0;
}

void FeatureStoreStreamAccessor.insert(feature:)(_QWORD *a1)
{
  id v2;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Streams.StoreStream<FeatureStoreBiomeEvent>);
  lazy protocol witness table accessor for type Streams.StoreStream<FeatureStoreBiomeEvent> and conformance Streams.StoreStream<A>(&lazy protocol witness table cache variable for type Streams.StoreStream<FeatureStoreBiomeEvent> and conformance Streams.StoreStream<A>, &demangling cache variable for type metadata for Streams.StoreStream<FeatureStoreBiomeEvent>, MEMORY[0x24BE0CA10]);
  v2 = (id)StoreStreamProtocol.source()();
  (*(void (**)(void))((*MEMORY[0x24BEE4EA0] & *a1) + 0x78))();
  objc_msgSend(v2, sel_sendEvent_timestamp_, a1);

}

uint64_t FeatureStoreStreamAccessor.retrieve(query:)(_QWORD *a1)
{
  double v1;
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
  char *v17;
  void *v18;
  _QWORD *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Publishers.Filter<BMStoreEvent>);
  v41 = *(_QWORD *)(v3 - 8);
  v42 = v3;
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_8_3();
  v40 = v4;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for BookmarkablePublisher<BMStoreEvent>);
  v38 = *(_QWORD *)(v5 - 8);
  v39 = v5;
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_8_3();
  v37 = v6;
  v7 = type metadata accessor for Date();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_8();
  v11 = v10 - v9;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  v13 = MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v37 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v37 - v16;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Streams.StoreStream<FeatureStoreBiomeEvent>);
  v18 = (void *)Streams.StoreStream.inner.getter();
  v19 = (_QWORD *)MEMORY[0x24BEE4EA0];
  (*(void (**)(void))((*MEMORY[0x24BEE4EA0] & *a1) + 0x68))();
  if (OUTLINED_FUNCTION_15_1((uint64_t)v17))
  {
    v20 = outlined destroy of Date?((uint64_t)v17);
    v21 = 0;
  }
  else
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v8 + 16))(v11, v17, v7);
    outlined destroy of Date?((uint64_t)v17);
    Date.timeIntervalSinceReferenceDate.getter();
    v22 = OUTLINED_FUNCTION_2_2();
    v20 = MEMORY[0x212BEE1C4](v22, v1);
    v21 = (void *)v20;
  }
  (*(void (**)(uint64_t))((*v19 & *a1) + 0x80))(v20);
  if (OUTLINED_FUNCTION_15_1((uint64_t)v15))
  {
    outlined destroy of Date?((uint64_t)v15);
    v23 = 0;
  }
  else
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v8 + 16))(v11, v15, v7);
    outlined destroy of Date?((uint64_t)v15);
    Date.timeIntervalSinceReferenceDate.getter();
    v24 = OUTLINED_FUNCTION_2_2();
    v23 = (void *)MEMORY[0x212BEE1C4](v24, v1);
  }
  v25 = objc_msgSend(v18, sel_publisherWithStartTime_endTime_maxEvents_lastN_reversed_, v21, v23, 0, 0, 0, v37);

  v26 = v25;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for BMStoreEvent);
  v27 = v37;
  BookmarkablePublisher.init(_:)();
  v28 = OUTLINED_FUNCTION_14_1();
  *(_QWORD *)(v28 + 16) = MEMORY[0x24BEE4AF8];
  v29 = (uint64_t *)(v28 + 16);
  *(_QWORD *)(OUTLINED_FUNCTION_14_1() + 16) = a1;
  lazy protocol witness table accessor for type Streams.StoreStream<FeatureStoreBiomeEvent> and conformance Streams.StoreStream<A>(&lazy protocol witness table cache variable for type BookmarkablePublisher<BMStoreEvent<FeatureStoreBiomeEvent>> and conformance BookmarkablePublisher<A>, &demangling cache variable for type metadata for BookmarkablePublisher<BMStoreEvent>, MEMORY[0x24BE0C940]);
  v30 = a1;
  v32 = v39;
  v31 = v40;
  PublisherProtocol.filter(isIncluded:)();
  swift_release();
  lazy protocol witness table accessor for type Streams.StoreStream<FeatureStoreBiomeEvent> and conformance Streams.StoreStream<A>(&lazy protocol witness table cache variable for type Publishers.Filter<BMStoreEvent<FeatureStoreBiomeEvent>> and conformance Publishers.Filter<A>, &demangling cache variable for type metadata for Publishers.Filter<BMStoreEvent>, MEMORY[0x24BE0C888]);
  swift_retain();
  v33 = v42;
  v34 = (void *)PublisherProtocol.sink(completion:receiveInput:)();

  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v41 + 8))(v31, v33);
  (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v27, v32);
  swift_beginAccess();
  v35 = *v29;
  swift_bridgeObjectRetain();
  swift_release();
  return v35;
}

uint64_t outlined destroy of Date?(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_21255ECD4()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t closure #1 in FeatureStoreStreamAccessor.retrieve(query:)(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(void);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  id v21;
  NSObject *v22;
  os_log_type_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;

  OUTLINED_FUNCTION_12_1();
  OUTLINED_FUNCTION_10_2();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_8();
  v9 = v8 - v7;
  v10 = *(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *a2) + 0x98);
  v11 = *(_QWORD *)(v10() + 16);
  v12 = swift_bridgeObjectRelease();
  if (!v11)
    return 1;
  v13 = ((uint64_t (*)(uint64_t))v10)(v12);
  v14 = specialized Set.init<A>(_:)(v13);
  v15 = (char *)objc_msgSend(v3, sel_eventBody);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)&v15[OBJC_IVAR___FSFFeatureStoreBiomeEvent_interactionId];
    v18 = *(_QWORD *)&v15[OBJC_IVAR___FSFFeatureStoreBiomeEvent_interactionId + 8];
    swift_bridgeObjectRetain();
    LOBYTE(v17) = specialized Set.contains(_:)(v17, v18, v14);
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    return v17 & 1;
  }
  else
  {
    swift_bridgeObjectRelease();
    v20 = Logger.accessor.unsafeMutableAddressor();
    OUTLINED_FUNCTION_11_1(v9, v20, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16));
    v21 = v3;
    v22 = Logger.logObject.getter();
    v23 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v22, v23))
    {
      OUTLINED_FUNCTION_6_2();
      v27 = OUTLINED_FUNCTION_4_2();
      *(_DWORD *)v10 = 136315138;
      objc_msgSend(v21, sel_error);
      type metadata accessor for BMStoreError();
      v24 = String.init<A>(describing:)();
      getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v24, v25, &v27);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_7_3(&dword_212552000, v22, v26, "EventBody is nil. Store error: %s");
      OUTLINED_FUNCTION_5_3();
      OUTLINED_FUNCTION_1();
    }

    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v9, v2);
    return 0;
  }
}

uint64_t sub_21255EF34()
{
  OUTLINED_FUNCTION_9_3();
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in FeatureStoreStreamAccessor.retrieve(query:)(uint64_t a1)
{
  uint64_t v1;

  return closure #1 in FeatureStoreStreamAccessor.retrieve(query:)(a1, *(_QWORD **)(v1 + 16));
}

uint64_t specialized Set.init<A>(_:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  Swift::Int *v4;
  Swift::Int v5;
  Swift::Int v6;
  uint64_t v7;
  Swift::Int v9;
  uint64_t v10;

  v2 = Set.init(minimumCapacity:)();
  v10 = v2;
  v3 = *(_QWORD *)(a1 + 16);
  if (v3)
  {
    v4 = (Swift::Int *)(a1 + 40);
    do
    {
      v5 = *(v4 - 1);
      v6 = *v4;
      swift_bridgeObjectRetain();
      specialized Set._Variant.insert(_:)(&v9, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v3;
    }
    while (v3);
    swift_bridgeObjectRelease();
    return v10;
  }
  else
  {
    v7 = v2;
    swift_bridgeObjectRelease();
  }
  return v7;
}

uint64_t specialized Set.contains(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  Swift::Int v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  BOOL v12;
  uint64_t result;
  uint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  BOOL v17;

  if (*(_QWORD *)(a3 + 16))
  {
    Hasher.init(_seed:)();
    String.hash(into:)();
    v6 = Hasher._finalize()();
    v7 = -1 << *(_BYTE *)(a3 + 32);
    v8 = v6 & ~v7;
    v9 = a3 + 56;
    if (((*(_QWORD *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) != 0)
    {
      v10 = *(_QWORD *)(a3 + 48);
      v11 = (_QWORD *)(v10 + 16 * v8);
      v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
        return 1;
      v14 = ~v7;
      v15 = (v8 + 1) & v14;
      if (((*(_QWORD *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) != 0)
      {
        while (1)
        {
          v16 = (_QWORD *)(v10 + 16 * v15);
          v17 = *v16 == a1 && v16[1] == a2;
          if (v17 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
            break;
          result = 0;
          v15 = (v15 + 1) & v14;
          if (((*(_QWORD *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) == 0)
            return result;
        }
        return 1;
      }
    }
  }
  return 0;
}

void closure #3 in FeatureStoreStreamAccessor.retrieve(query:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  _DWORD *v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  id v13;
  _QWORD *v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  os_log_type_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23[3];
  uint64_t v24;

  OUTLINED_FUNCTION_12_1();
  OUTLINED_FUNCTION_10_2();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_8();
  v10 = v9 - v8;
  v11 = objc_msgSend(v3, sel_eventBody);
  if (v11)
  {
    v12 = v11;
    v13 = objc_msgSend(v3, sel_timestamp);
    (*(void (**)(id))((*MEMORY[0x24BEE4EA0] & *v12) + 0x80))(v13);
    swift_beginAccess();
    v14 = v12;
    MEMORY[0x212BEE0BC]();
    specialized Array._reserveCapacityAssumingUniqueBuffer(oldCount:)(*(_QWORD *)((*(_QWORD *)(a2 + 16) & 0xFFFFFFFFFFFFF8)
                                                                                + 0x10));
    specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
    specialized Array._endMutation()();
    swift_endAccess();

  }
  else
  {
    v15 = Logger.accessor.unsafeMutableAddressor();
    OUTLINED_FUNCTION_11_1(v10, v15, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 16));
    v16 = v3;
    v17 = Logger.logObject.getter();
    v18 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v17, v18))
    {
      OUTLINED_FUNCTION_6_2();
      v19 = OUTLINED_FUNCTION_4_2();
      *v4 = 136315138;
      v23[0] = v19;
      LOBYTE(v24) = objc_msgSend(v16, sel_error);
      type metadata accessor for BMStoreError();
      v20 = String.init<A>(describing:)();
      v24 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v20, v21, v23);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_7_3(&dword_212552000, v17, v22, "This should not happen as we had already filtered nil eventBody instances! Store Error: %s");
      OUTLINED_FUNCTION_5_3();
      OUTLINED_FUNCTION_1();
    }

    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v10, v2);
  }
}

void partial apply for closure #3 in FeatureStoreStreamAccessor.retrieve(query:)(uint64_t a1)
{
  uint64_t v1;

  closure #3 in FeatureStoreStreamAccessor.retrieve(query:)(a1, v1);
}

uint64_t lazy protocol witness table accessor for type Streams.StoreStream<FeatureStoreBiomeEvent> and conformance Streams.StoreStream<A>(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x212BEEBCC](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t FeatureStoreStreamAccessor.retrieve(interactionId:)()
{
  Swift::String v0;
  Swift::String v1;
  Swift::String v2;
  uint64_t v3;

  _StringGuts.grow(_:)(75);
  v0._object = (void *)0x8000000212576F40;
  v0._countAndFlagsBits = 0xD000000000000048;
  String.append(_:)(v0);
  v1._countAndFlagsBits = _typeName(_:qualified:)();
  String.append(_:)(v1);
  swift_bridgeObjectRelease();
  v2._countAndFlagsBits = 33;
  v2._object = (void *)0xE100000000000000;
  String.append(_:)(v2);
  lazy protocol witness table accessor for type FeatureStoreError and conformance FeatureStoreError();
  swift_allocError();
  *(_QWORD *)v3 = 0;
  *(_QWORD *)(v3 + 8) = 0xE000000000000000;
  *(_BYTE *)(v3 + 16) = 0;
  return swift_willThrow();
}

uint64_t FeatureStoreStreamAccessor.deinit()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_9_3();
  v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Streams.StoreStream<FeatureStoreBiomeEvent>);
  OUTLINED_FUNCTION_3_2(v1);
  return v0;
}

uint64_t FeatureStoreStreamAccessor.__deallocating_deinit()
{
  uint64_t v0;

  OUTLINED_FUNCTION_9_3();
  v0 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Streams.StoreStream<FeatureStoreBiomeEvent>);
  OUTLINED_FUNCTION_3_2(v0);
  return swift_deallocClassInstance();
}

_UNKNOWN **associated type witness table accessor for StreamAccessor.FeatureType : FeatureMetadata in FeatureStoreStreamAccessor()
{
  return &protocol witness table for FeatureStoreBiomeEvent;
}

uint64_t protocol witness for StreamAccessor.init(identifier:) in conformance FeatureStoreStreamAccessor@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  result = (*(uint64_t (**)(void))(v1 + 96))();
  *a1 = result;
  return result;
}

uint64_t protocol witness for StreamAccessor.insert(feature:) in conformance FeatureStoreStreamAccessor(_QWORD *a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)v1 + 104))(*a1);
}

uint64_t protocol witness for StreamAccessor.retrieve(query:) in conformance FeatureStoreStreamAccessor()
{
  return OUTLINED_FUNCTION_13_2();
}

uint64_t protocol witness for StreamAccessor.retrieve(interactionId:) in conformance FeatureStoreStreamAccessor()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(**(_QWORD **)v0 + 120))();
}

uint64_t ObjC metadata update function for FeatureStoreStreamAccessor()
{
  return type metadata accessor for FeatureStoreStreamAccessor();
}

uint64_t type metadata accessor for FeatureStoreStreamAccessor()
{
  uint64_t result;

  result = type metadata singleton initialization cache for FeatureStoreStreamAccessor;
  if (!type metadata singleton initialization cache for FeatureStoreStreamAccessor)
    return swift_getSingletonMetadata();
  return result;
}

void type metadata completion function for FeatureStoreStreamAccessor()
{
  unint64_t v0;

  type metadata accessor for Streams.StoreStream<FeatureStoreBiomeEvent>();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

uint64_t method lookup function for FeatureStoreStreamAccessor()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of FeatureStoreStreamAccessor.__allocating_init(identifier:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of FeatureStoreStreamAccessor.insert(feature:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 104))();
}

uint64_t dispatch thunk of FeatureStoreStreamAccessor.retrieve(query:)()
{
  return OUTLINED_FUNCTION_13_2();
}

void type metadata accessor for Streams.StoreStream<FeatureStoreBiomeEvent>()
{
  unint64_t v0;
  uint64_t v1;

  if (!lazy cache variable for type metadata for Streams.StoreStream<FeatureStoreBiomeEvent>)
  {
    type metadata accessor for FeatureStoreBiomeEvent();
    v0 = type metadata accessor for Streams.StoreStream();
    if (!v1)
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for Streams.StoreStream<FeatureStoreBiomeEvent>);
  }
}

uint64_t specialized Array._reserveCapacityAssumingUniqueBuffer(oldCount:)(uint64_t result)
{
  _QWORD *v1;

  if (result + 1 > *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFF8) + 0x18) >> 1)
    return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
  return result;
}

void type metadata accessor for BMStoreError()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!lazy cache variable for type metadata for BMStoreError)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&lazy cache variable for type metadata for BMStoreError);
  }
}

uint64_t specialized Set._Variant.insert(_:)(Swift::Int *a1, Swift::Int a2, Swift::Int a3)
{
  uint64_t *v3;
  uint64_t v7;
  Swift::Int v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  BOOL v13;
  Swift::Int *v14;
  Swift::Int v15;
  uint64_t v17;
  _QWORD *v18;
  BOOL v19;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v21;

  v7 = *v3;
  Hasher.init(_seed:)();
  swift_bridgeObjectRetain();
  String.hash(into:)();
  v8 = Hasher._finalize()();
  v9 = -1 << *(_BYTE *)(v7 + 32);
  v10 = v8 & ~v9;
  if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = *(_QWORD *)(v7 + 48);
    v12 = (_QWORD *)(v11 + 16 * v10);
    v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v14 = (Swift::Int *)(*(_QWORD *)(*v3 + 48) + 16 * v10);
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
      if (v19 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
        goto LABEL_7;
    }
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v21 = *v3;
  *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  specialized _NativeSet.insertNew(_:at:isUnique:)(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t specialized _NativeSet.resize(capacity:)()
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
  unint64_t i;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  _QWORD *v30;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<String>);
  v3 = static _SetStorage.resize(original:capacity:move:)();
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
    if (!v7)
      goto LABEL_7;
LABEL_6:
    v12 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    for (i = v12 | (v11 << 6); ; i = __clz(__rbit64(v15)) + (v11 << 6))
    {
      v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * i);
      v18 = *v17;
      v19 = v17[1];
      Hasher.init(_seed:)();
      String.hash(into:)();
      result = Hasher._finalize()();
      v20 = -1 << *(_BYTE *)(v4 + 32);
      v21 = result & ~v20;
      v22 = v21 >> 6;
      if (((-1 << v21) & ~*(_QWORD *)(v9 + 8 * (v21 >> 6))) == 0)
      {
        v24 = 0;
        v25 = (unint64_t)(63 - v20) >> 6;
        while (++v22 != v25 || (v24 & 1) == 0)
        {
          v26 = v22 == v25;
          if (v22 == v25)
            v22 = 0;
          v24 |= v26;
          v27 = *(_QWORD *)(v9 + 8 * v22);
          if (v27 != -1)
          {
            v23 = __clz(__rbit64(~v27)) + (v22 << 6);
            goto LABEL_30;
          }
        }
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        return result;
      }
      v23 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v9 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
      *(_QWORD *)(v9 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
      v28 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v23);
      *v28 = v18;
      v28[1] = v19;
      ++*(_QWORD *)(v4 + 16);
      if (v7)
        goto LABEL_6;
LABEL_7:
      v14 = v11 + 1;
      if (__OFADD__(v11, 1))
        goto LABEL_38;
      if (v14 >= v8)
        goto LABEL_32;
      v15 = v30[v14];
      ++v11;
      if (!v15)
      {
        v11 = v14 + 1;
        if (v14 + 1 >= v8)
          goto LABEL_32;
        v15 = v30[v11];
        if (!v15)
        {
          v11 = v14 + 2;
          if (v14 + 2 >= v8)
            goto LABEL_32;
          v15 = v30[v11];
          if (!v15)
          {
            v16 = v14 + 3;
            if (v16 >= v8)
            {
LABEL_32:
              swift_release();
              v1 = v0;
              v29 = 1 << *(_BYTE *)(v2 + 32);
              if (v29 > 63)
                specialized UnsafeMutablePointer.assign(repeating:count:)(0, (unint64_t)(v29 + 63) >> 6, v30);
              else
                *v30 = -1 << v29;
              *(_QWORD *)(v2 + 16) = 0;
              break;
            }
            v15 = v30[v16];
            if (!v15)
            {
              while (1)
              {
                v11 = v16 + 1;
                if (__OFADD__(v16, 1))
                  goto LABEL_39;
                if (v11 >= v8)
                  goto LABEL_32;
                v15 = v30[v11];
                ++v16;
                if (v15)
                  goto LABEL_20;
              }
            }
            v11 = v16;
          }
        }
      }
LABEL_20:
      v7 = (v15 - 1) & v15;
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

Swift::Int specialized _NativeSet.insertNew(_:at:isUnique:)(Swift::Int result, Swift::Int a2, unint64_t a3, char a4)
{
  uint64_t *v4;
  uint64_t *v5;
  Swift::Int v8;
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
  Swift::Int *v21;
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
    specialized _NativeSet.resize(capacity:)();
  }
  else
  {
    if (v10 > v9)
    {
      result = (Swift::Int)specialized _NativeSet.copy()();
      goto LABEL_22;
    }
    specialized _NativeSet.copyAndResize(capacity:)();
  }
  v11 = *v4;
  Hasher.init(_seed:)();
  String.hash(into:)();
  result = Hasher._finalize()();
  v12 = -1 << *(_BYTE *)(v11 + 32);
  a3 = result & ~v12;
  v13 = v11 + 56;
  if (((*(_QWORD *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
  {
    v14 = *(_QWORD *)(v11 + 48);
    v15 = (_QWORD *)(v14 + 16 * a3);
    v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (result = _stringCompareWithSmolCheck(_:_:expecting:)(), (result & 1) != 0))
    {
LABEL_21:
      result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
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
          result = _stringCompareWithSmolCheck(_:_:expecting:)();
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
  v21 = (Swift::Int *)(*(_QWORD *)(v20 + 48) + 16 * a3);
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

uint64_t specialized UnsafeMutablePointer.assign(repeating:count:)(uint64_t result, uint64_t a2, _QWORD *a3)
{
  if (a2 < 0)
  {
    __break(1u);
  }
  else
  {
    for (; a2; --a2)
      *a3++ = result;
  }
  return result;
}

void *specialized _NativeSet.copy()()
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
  uint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t i;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  _QWORD *v20;
  uint64_t v21;
  _QWORD *v22;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<String>);
  v2 = *v0;
  v3 = static _SetStorage.copy(original:)();
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
  v11 = *(_QWORD *)(v2 + 56);
  v12 = -1;
  if (v10 < 64)
    v12 = ~(-1 << v10);
  v13 = v12 & v11;
  v14 = (unint64_t)(v10 + 63) >> 6;
  if ((v12 & v11) == 0)
    goto LABEL_12;
LABEL_11:
  v15 = __clz(__rbit64(v13));
  v13 &= v13 - 1;
  for (i = v15 | (v9 << 6); ; i = __clz(__rbit64(v18)) + (v9 << 6))
  {
    v20 = (_QWORD *)(*(_QWORD *)(v2 + 48) + 16 * i);
    v21 = v20[1];
    v22 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * i);
    *v22 = *v20;
    v22[1] = v21;
    result = (void *)swift_bridgeObjectRetain();
    if (v13)
      goto LABEL_11;
LABEL_12:
    v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v17 >= v14)
      goto LABEL_28;
    v18 = *(_QWORD *)(v6 + 8 * v17);
    ++v9;
    if (!v18)
    {
      v9 = v17 + 1;
      if (v17 + 1 >= v14)
        goto LABEL_28;
      v18 = *(_QWORD *)(v6 + 8 * v9);
      if (!v18)
      {
        v9 = v17 + 2;
        if (v17 + 2 >= v14)
          goto LABEL_28;
        v18 = *(_QWORD *)(v6 + 8 * v9);
        if (!v18)
          break;
      }
    }
LABEL_25:
    v13 = (v18 - 1) & v18;
  }
  v19 = v17 + 3;
  if (v19 >= v14)
    goto LABEL_28;
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
  {
    v9 = v19;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v9 >= v14)
      goto LABEL_28;
    v18 = *(_QWORD *)(v6 + 8 * v9);
    ++v19;
    if (v18)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t specialized _NativeSet.copyAndResize(capacity:)()
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
  unint64_t i;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  _QWORD *v28;
  int64_t v29;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<String>);
  v3 = static _SetStorage.resize(original:capacity:move:)();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_34:
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
  if (!v8)
    goto LABEL_7;
LABEL_6:
  v12 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  for (i = v12 | (v11 << 6); ; i = __clz(__rbit64(v15)) + (v11 << 6))
  {
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * i);
    v18 = *v17;
    v19 = v17[1];
    Hasher.init(_seed:)();
    swift_bridgeObjectRetain();
    String.hash(into:)();
    result = Hasher._finalize()();
    v20 = -1 << *(_BYTE *)(v4 + 32);
    v21 = result & ~v20;
    v22 = v21 >> 6;
    if (((-1 << v21) & ~*(_QWORD *)(v9 + 8 * (v21 >> 6))) == 0)
    {
      v24 = 0;
      v25 = (unint64_t)(63 - v20) >> 6;
      while (++v22 != v25 || (v24 & 1) == 0)
      {
        v26 = v22 == v25;
        if (v22 == v25)
          v22 = 0;
        v24 |= v26;
        v27 = *(_QWORD *)(v9 + 8 * v22);
        if (v27 != -1)
        {
          v23 = __clz(__rbit64(~v27)) + (v22 << 6);
          goto LABEL_30;
        }
      }
      __break(1u);
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    v23 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v9 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
    *(_QWORD *)(v9 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    v28 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v23);
    *v28 = v18;
    v28[1] = v19;
    ++*(_QWORD *)(v4 + 16);
    if (v8)
      goto LABEL_6;
LABEL_7:
    v14 = v11 + 1;
    if (__OFADD__(v11, 1))
      goto LABEL_36;
    if (v14 >= v29)
      goto LABEL_32;
    v15 = *(_QWORD *)(v6 + 8 * v14);
    ++v11;
    if (!v15)
    {
      v11 = v14 + 1;
      if (v14 + 1 >= v29)
        goto LABEL_32;
      v15 = *(_QWORD *)(v6 + 8 * v11);
      if (!v15)
      {
        v11 = v14 + 2;
        if (v14 + 2 >= v29)
          goto LABEL_32;
        v15 = *(_QWORD *)(v6 + 8 * v11);
        if (!v15)
          break;
      }
    }
LABEL_20:
    v8 = (v15 - 1) & v15;
  }
  v16 = v14 + 3;
  if (v16 >= v29)
  {
LABEL_32:
    result = swift_release_n();
    v1 = v0;
    goto LABEL_34;
  }
  v15 = *(_QWORD *)(v6 + 8 * v16);
  if (v15)
  {
    v11 = v16;
    goto LABEL_20;
  }
  while (1)
  {
    v11 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v11 >= v29)
      goto LABEL_32;
    v15 = *(_QWORD *)(v6 + 8 * v11);
    ++v16;
    if (v15)
      goto LABEL_20;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t OUTLINED_FUNCTION_2_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v0, v2);
}

uint64_t OUTLINED_FUNCTION_3_2(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v1, a1);
}

uint64_t OUTLINED_FUNCTION_4_2()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_5_3()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_6_2()
{
  return swift_slowAlloc();
}

void OUTLINED_FUNCTION_7_3(void *a1, NSObject *a2, uint64_t a3, const char *a4)
{
  uint8_t *v4;
  os_log_type_t v5;

  _os_log_impl(a1, a2, v5, a4, v4, 0xCu);
}

void OUTLINED_FUNCTION_9_3()
{
  uint64_t v0;

}

uint64_t OUTLINED_FUNCTION_11_1@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

uint64_t OUTLINED_FUNCTION_12_1()
{
  return type metadata accessor for Logger();
}

uint64_t OUTLINED_FUNCTION_13_2()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t OUTLINED_FUNCTION_14_1()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_15_1(uint64_t a1)
{
  uint64_t v1;

  return __swift_getEnumTagSinglePayload(a1, 1, v1);
}

uint64_t PBCodableFeatureWrapper.serialize()()
{
  uint64_t v0;
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(*(id *)(v0 + 16), sel_data);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = static Data._unconditionallyBridgeFromObjectiveC(_:)();

  return v3;
}

id @objc PBCodableFeatureWrapper.serialize()()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t v2;
  Class isa;

  swift_retain();
  v0 = PBCodableFeatureWrapper.serialize()();
  v2 = v1;
  swift_release();
  if (v2 >> 60 == 15)
    return OUTLINED_FUNCTION_6_1(0);
  isa = Data._bridgeToObjectiveC()().super.isa;
  outlined consume of Data?(v0, v2);
  return OUTLINED_FUNCTION_6_1(isa);
}

uint64_t static PBCodableFeatureWrapper.deserialize(_:dataVersion:interactionId:)(uint64_t a1, unint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  uint64_t v18;
  void *v19;
  os_log_type_t v20;
  uint64_t v21;
  uint64_t v22;

  v6 = v5;
  type metadata accessor for Logger();
  OUTLINED_FUNCTION_7_4();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_6_3();
  v12 = *(_QWORD *)(v6 + 144);
  objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  outlined copy of Data._Representation(a1, a2);
  v13 = @nonobjc PBCodable.init(data:)(a1, a2);
  if (v13)
  {
    v16 = (uint64_t)v13;
    type metadata accessor for PBCodableFeatureWrapper(0, v12, v14, v15);
    swift_bridgeObjectRetain();
    AceObjectFeatureWrapper.__allocating_init(interactionId:dataVersion:feature:)(a4, a5, a3, v16);
    result = swift_dynamicCastClass();
    if (result)
      return result;
    swift_release();
  }
  else
  {
    v18 = Logger.accessor.unsafeMutableAddressor();
    OUTLINED_FUNCTION_2_3(v18);
    v19 = (void *)Logger.logObject.getter();
    v20 = static os_log_type_t.error.getter();
    if (OUTLINED_FUNCTION_5_2(v20))
    {
      *(_WORD *)OUTLINED_FUNCTION_8_4() = 0;
      OUTLINED_FUNCTION_3_1(&dword_212552000, v21, v22, "Serialization failed");
      OUTLINED_FUNCTION_0_3();
    }

    OUTLINED_FUNCTION_3_3();
  }
  return 0;
}

id @objc static PBCodableFeatureWrapper.deserialize(_:dataVersion:interactionId:)(uint64_t a1, uint64_t a2, void *a3, int a4, void *a5)
{
  id v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  v7 = a3;
  v8 = a5;
  v9 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  v11 = v10;

  v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v14 = v13;

  swift_getObjCClassMetadata();
  v15 = (void *)static PBCodableFeatureWrapper.deserialize(_:dataVersion:interactionId:)(v9, v11, a4, v12, v14);
  swift_bridgeObjectRelease();
  outlined consume of Data._Representation(v9, v11);
  return v15;
}

Swift::String_optional __swiftcall PBCodableFeatureWrapper.json()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  os_log_type_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  Swift::String_optional result;

  type metadata accessor for Logger();
  OUTLINED_FUNCTION_7_4();
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_6_3();
  v2 = type metadata accessor for String.Encoding();
  v3 = MEMORY[0x24BDAC7A8](v2);
  v4 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v0 + 120))(v3);
  if (v5 >> 60 == 15)
  {
    v6 = Logger.accessor.unsafeMutableAddressor();
    OUTLINED_FUNCTION_2_3(v6);
    v7 = (void *)Logger.logObject.getter();
    v8 = static os_log_type_t.error.getter();
    if (OUTLINED_FUNCTION_5_2(v8))
    {
      *(_WORD *)OUTLINED_FUNCTION_8_4() = 0;
      OUTLINED_FUNCTION_3_1(&dword_212552000, v9, v10, "Json fetch failed.");
      OUTLINED_FUNCTION_0_3();
    }

    OUTLINED_FUNCTION_3_3();
    v11 = 0;
    v12 = 0;
  }
  else
  {
    v13 = v4;
    v14 = v5;
    static String.Encoding.utf8.getter();
    v11 = String.init(data:encoding:)();
    v12 = v15;
    outlined consume of Data?(v13, v14);
  }
  v16 = v11;
  v17 = v12;
  result.value._object = v17;
  result.value._countAndFlagsBits = v16;
  return result;
}

id @objc PBCodableFeatureWrapper.json()()
{
  Swift::String_optional v0;
  void *v1;

  swift_retain();
  v0 = PBCodableFeatureWrapper.json()();
  swift_release();
  if (!v0.value._object)
    return OUTLINED_FUNCTION_6_1(0);
  v1 = (void *)MEMORY[0x212BEE02C](v0.value._countAndFlagsBits, v0.value._object);
  swift_bridgeObjectRelease();
  return OUTLINED_FUNCTION_6_1(v1);
}

id @nonobjc PBCodable.init(data:)(uint64_t a1, unint64_t a2)
{
  void *v2;
  Class isa;
  id v6;

  if (a2 >> 60 == 15)
  {
    isa = 0;
  }
  else
  {
    isa = Data._bridgeToObjectiveC()().super.isa;
    outlined consume of Data?(a1, a2);
  }
  v6 = objc_msgSend(v2, sel_initWithData_, isa);

  return v6;
}

uint64_t type metadata accessor for PBCodableFeatureWrapper(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for PBCodableFeatureWrapper);
}

uint64_t OUTLINED_FUNCTION_2_3(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, a1, v1);
}

uint64_t OUTLINED_FUNCTION_3_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_8_4()
{
  return swift_slowAlloc();
}

uint64_t static NSCodingCoder.encode(codable:)(uint64_t a1)
{
  id v2;
  id v3;
  uint64_t v4;

  v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1618]), sel_initRequiringSecureCoding_, 0);
  objc_msgSend(v2, sel_setOutputFormat_, 100);
  objc_msgSend(v2, sel_encodeObject_forKey_, a1, *MEMORY[0x24BDD0E88]);
  objc_msgSend(v2, sel_finishEncoding);
  v3 = objc_msgSend(v2, sel_encodedData);
  v4 = static Data._unconditionallyBridgeFromObjectiveC(_:)();

  return v4;
}

uint64_t static NSCodingCoder.decode(data:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t result;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;

  v0 = type metadata accessor for Logger();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = MEMORY[0x24BDAC7A8](v0);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v10 - v3;
  type metadata accessor for NSKeyedUnarchiver();
  result = static NSKeyedUnarchiver.unarchivedObject<A>(ofClass:from:)();
  if (!result)
  {
    v6 = Logger.accessor.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v4, v6, v0);
    v7 = Logger.logObject.getter();
    v8 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = (uint8_t *)OUTLINED_FUNCTION_5();
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_212552000, v7, v8, "Decoding failed, unexpectedly returns . Returning nil object", v9, 2u);
      OUTLINED_FUNCTION_1();
    }

    (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v0);
    return 0;
  }
  return result;
}

uint64_t protocol witness for static Coder.encode(codable:) in conformance NSCodingCoder<A>(uint64_t *a1)
{
  return static NSCodingCoder.encode(codable:)(*a1);
}

uint64_t protocol witness for static Coder.decode(data:) in conformance NSCodingCoder<A>@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = static NSCodingCoder.decode(data:)();
  *a1 = result;
  return result;
}

uint64_t type metadata instantiation function for NSCodingCoder()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t type metadata accessor for NSCodingCoder(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for NSCodingCoder);
}

uint64_t dispatch thunk of static Coder.encode(codable:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of static Coder.decode(data:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 24))();
}

uint64_t one-time initialization function for logger()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = OUTLINED_FUNCTION_10_1();
  __swift_allocate_value_buffer(v0, static FeatureStoreService.logger);
  v1 = __swift_project_value_buffer(v0, (uint64_t)static FeatureStoreService.logger);
  v2 = Logger.service.unsafeMutableAddressor();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

uint64_t FeatureStoreService.logger.unsafeMutableAddressor()
{
  return FeatureStoreService.logger.unsafeMutableAddressor(&one-time initialization token for logger, (uint64_t (*)(_QWORD))MEMORY[0x24BEE78D8], (uint64_t)static FeatureStoreService.logger);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t static FeatureStoreService.logger.getter@<X0>(uint64_t a1@<X8>)
{
  return static FeatureStoreService.logger.getter(&one-time initialization token for logger, (uint64_t (*)(_QWORD))MEMORY[0x24BEE78D8], (uint64_t)static FeatureStoreService.logger, a1);
}

uint64_t one-time initialization function for signposter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v0 = OUTLINED_FUNCTION_10_1();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  OUTLINED_FUNCTION_8();
  v4 = v3 - v2;
  v5 = type metadata accessor for OSSignposter();
  __swift_allocate_value_buffer(v5, static FeatureStoreService.signposter);
  __swift_project_value_buffer(v5, (uint64_t)static FeatureStoreService.signposter);
  if (one-time initialization token for logger != -1)
    swift_once();
  v6 = __swift_project_value_buffer(v0, (uint64_t)static FeatureStoreService.logger);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 16))(v4, v6, v0);
  return OSSignposter.init(logger:)();
}

uint64_t FeatureStoreService.signposter.unsafeMutableAddressor()
{
  return FeatureStoreService.logger.unsafeMutableAddressor(&one-time initialization token for signposter, (uint64_t (*)(_QWORD))MEMORY[0x24BEE77F0], (uint64_t)static FeatureStoreService.signposter);
}

uint64_t FeatureStoreService.logger.unsafeMutableAddressor(_QWORD *a1, uint64_t (*a2)(_QWORD), uint64_t a3)
{
  uint64_t v5;

  if (*a1 != -1)
    swift_once();
  v5 = a2(0);
  return __swift_project_value_buffer(v5, a3);
}

uint64_t static FeatureStoreService.signposter.getter@<X0>(uint64_t a1@<X8>)
{
  return static FeatureStoreService.logger.getter(&one-time initialization token for signposter, (uint64_t (*)(_QWORD))MEMORY[0x24BEE77F0], (uint64_t)static FeatureStoreService.signposter, a1);
}

uint64_t static FeatureStoreService.logger.getter@<X0>(_QWORD *a1@<X0>, uint64_t (*a2)(_QWORD)@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  uint64_t v8;

  if (*a1 != -1)
    swift_once();
  v7 = a2(0);
  v8 = __swift_project_value_buffer(v7, a3);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a4, v8, v7);
}

uint64_t static FeatureStoreService.qos.getter()
{
  id v0;
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  BOOL v8;
  BOOL v9;

  v0 = objc_msgSend((id)objc_opt_self(), sel_standardUserDefaults);
  v1 = (void *)MEMORY[0x212BEE02C](0xD000000000000014, 0x8000000212577010);
  v2 = objc_msgSend(v0, sel_stringForKey_, v1);

  if (v2)
  {
    v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v5 = v4;

    if (v5)
    {
      v6 = v3 == 0x74696E4972657375 && v5 == 0xED00006465746169;
      if (v6 || (OUTLINED_FUNCTION_3_4() & 1) != 0)
      {
        OUTLINED_FUNCTION_14_2();
        return static DispatchQoS.userInitiated.getter();
      }
      v8 = v3 == 0x65746E4972657375 && v5 == 0xEF65766974636172;
      if (v8 || (OUTLINED_FUNCTION_3_4() & 1) != 0)
      {
        OUTLINED_FUNCTION_14_2();
        return static DispatchQoS.userInteractive.getter();
      }
      v9 = v3 == 0x7974696C697475 && v5 == 0xE700000000000000;
      if (v9 || (OUTLINED_FUNCTION_3_4() & 1) != 0)
      {
        OUTLINED_FUNCTION_14_2();
        return static DispatchQoS.utility.getter();
      }
      if (v3 != 0x756F72676B636162 || v5 != 0xEA0000000000646ELL)
        OUTLINED_FUNCTION_3_4();
      OUTLINED_FUNCTION_14_2();
    }
  }
  return static DispatchQoS.background.getter();
}

uint64_t one-time initialization function for fsCaptureQueue()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  type metadata accessor for OS_dispatch_queue.Attributes();
  v1 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688];
  OUTLINED_FUNCTION_5_4();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_13_3();
  v3 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_10_3();
  type metadata accessor for DispatchQoS();
  OUTLINED_FUNCTION_5_4();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_8();
  type metadata accessor for OS_dispatch_queue();
  type metadata accessor for FeatureStoreService();
  static FeatureStoreService.qos.getter();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v4 + 104))(v0, *MEMORY[0x24BEE5758], v3);
  lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags(&lazy protocol witness table cache variable for type OS_dispatch_queue.Attributes and conformance OS_dispatch_queue.Attributes, v1, MEMORY[0x24BEE5698]);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [OS_dispatch_queue.Attributes]);
  lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A](&lazy protocol witness table cache variable for type [OS_dispatch_queue.Attributes] and conformance [A], &demangling cache variable for type metadata for [OS_dispatch_queue.Attributes]);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  result = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  static FeatureStoreService.fsCaptureQueue = result;
  return result;
}

uint64_t *FeatureStoreService.fsCaptureQueue.unsafeMutableAddressor()
{
  if (one-time initialization token for fsCaptureQueue != -1)
    swift_once();
  return &static FeatureStoreService.fsCaptureQueue;
}

id static FeatureStoreService.fsCaptureQueue.getter()
{
  if (one-time initialization token for fsCaptureQueue != -1)
    swift_once();
  return (id)static FeatureStoreService.fsCaptureQueue;
}

char **FeatureStoreService.signpostInsert.unsafeMutableAddressor()
{
  return &static FeatureStoreService.signpostInsert;
}

void static FeatureStoreService.signpostInsert.getter()
{
  OUTLINED_FUNCTION_9_4();
}

char **FeatureStoreService.signpostInsertSync.unsafeMutableAddressor()
{
  return &static FeatureStoreService.signpostInsertSync;
}

void static FeatureStoreService.signpostInsertSync.getter()
{
  OUTLINED_FUNCTION_9_4();
}

char **FeatureStoreService.signpostRetrieve.unsafeMutableAddressor()
{
  return &static FeatureStoreService.signpostRetrieve;
}

void static FeatureStoreService.signpostRetrieve.getter()
{
  OUTLINED_FUNCTION_9_4();
}

char **FeatureStoreService.signpostInsertQueueLatency.unsafeMutableAddressor()
{
  return &static FeatureStoreService.signpostInsertQueueLatency;
}

void static FeatureStoreService.signpostInsertQueueLatency.getter()
{
  OUTLINED_FUNCTION_9_4();
}

char **FeatureStoreService.signpostJsonEncode.unsafeMutableAddressor()
{
  return &static FeatureStoreService.signpostJsonEncode;
}

void static FeatureStoreService.signpostJsonEncode.getter()
{
  OUTLINED_FUNCTION_9_4();
}

char **FeatureStoreService.signpostBiomeInsert.unsafeMutableAddressor()
{
  return &static FeatureStoreService.signpostBiomeInsert;
}

void static FeatureStoreService.signpostBiomeInsert.getter()
{
  OUTLINED_FUNCTION_9_4();
}

char *FeatureStoreService.overrideLegalRestrictions.unsafeMutableAddressor()
{
  return &static FeatureStoreService.overrideLegalRestrictions;
}

void static FeatureStoreService.overrideLegalRestrictions.getter()
{
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_6_4();
}

void static FeatureStoreService.overrideLegalRestrictions.setter(char a1)
{
  OUTLINED_FUNCTION_4_3();
  static FeatureStoreService.overrideLegalRestrictions = a1;
  OUTLINED_FUNCTION_6_4();
}

uint64_t (*static FeatureStoreService.overrideLegalRestrictions.modify())()
{
  OUTLINED_FUNCTION_4_3();
  return static FeatureStoreService.overrideLegalRestrictions.modify;
}

char *FeatureStoreService.overrideSupportedUserCheck.unsafeMutableAddressor()
{
  return &static FeatureStoreService.overrideSupportedUserCheck;
}

void static FeatureStoreService.overrideSupportedUserCheck.getter()
{
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_6_4();
}

void static FeatureStoreService.overrideSupportedUserCheck.setter(char a1)
{
  OUTLINED_FUNCTION_4_3();
  static FeatureStoreService.overrideSupportedUserCheck = a1;
  OUTLINED_FUNCTION_6_4();
}

uint64_t (*static FeatureStoreService.overrideSupportedUserCheck.modify())()
{
  OUTLINED_FUNCTION_4_3();
  return static FeatureStoreService.overrideSupportedUserCheck.modify;
}

void static FeatureStoreService.isUnderLegalRestriction.getter()
{
  OUTLINED_FUNCTION_0_5();
  if ((static FeatureStoreService.overrideLegalRestrictions & 1) == 0)
    objc_msgSend((id)objc_opt_self(), sel_isUnderLegalRestriction);
  OUTLINED_FUNCTION_6_4();
}

void static FeatureStoreService.isSupportedUser.getter()
{
  OUTLINED_FUNCTION_0_5();
  if ((static FeatureStoreService.overrideSupportedUserCheck & 1) == 0)
    objc_msgSend((id)objc_opt_self(), sel_isSupportedUser);
  OUTLINED_FUNCTION_6_4();
}

void static FeatureStoreService.performInsert(qos:insertBlock:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t), void (*a5)(uint64_t))
{
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
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  char *v25;
  char v26;
  char v27;
  uint64_t v28;
  void *v29;
  os_log_type_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  os_log_type_t v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)();
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  void (**v44)();
  void (**v45)(uint64_t);
  uint64_t v46;
  void (*v47)(uint64_t);
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void (*v58)(uint64_t);
  void (*v59)(uint64_t);
  uint64_t v60;
  _QWORD aBlock[6];

  v52 = a2;
  v58 = a5;
  v59 = a4;
  v54 = a1;
  v6 = type metadata accessor for DispatchWorkItemFlags();
  v56 = *(_QWORD *)(v6 - 8);
  v57 = v6;
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_8();
  v55 = v8 - v7;
  v9 = OUTLINED_FUNCTION_10_1();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v51 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x24BDAC7A8](v11);
  v16 = (char *)&v51 - v15;
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v51 - v17;
  v19 = OUTLINED_FUNCTION_15_2();
  v20 = *(_QWORD *)(v19 - 8);
  v21 = *(_QWORD *)(v20 + 64);
  v22 = MEMORY[0x24BDAC7A8](v19);
  v23 = (char *)&v51 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v22);
  v25 = (char *)&v51 - v24;
  static FeatureStoreService.isSupportedUser.getter();
  if ((v26 & 1) == 0)
  {
    v34 = Logger.service.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v13, v34, v9);
    v35 = (void *)Logger.logObject.getter();
    v36 = static os_log_type_t.error.getter();
    if (OUTLINED_FUNCTION_12_2(v36))
    {
      *(_WORD *)OUTLINED_FUNCTION_5() = 0;
      OUTLINED_FUNCTION_11_2(&dword_212552000, v37, v38, "Skipping insertion as process does not run with a supported user");
      OUTLINED_FUNCTION_1();
    }

    v33 = (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v13, v9);
    goto LABEL_9;
  }
  static FeatureStoreService.isUnderLegalRestriction.getter();
  if ((v27 & 1) != 0)
  {
    v28 = Logger.service.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v16, v28, v9);
    v29 = (void *)Logger.logObject.getter();
    v30 = static os_log_type_t.error.getter();
    if (OUTLINED_FUNCTION_12_2(v30))
    {
      *(_WORD *)OUTLINED_FUNCTION_5() = 0;
      OUTLINED_FUNCTION_11_2(&dword_212552000, v31, v32, "Skipping insertion as it's legally restricted.");
      OUTLINED_FUNCTION_1();
    }

    v33 = (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v16, v9);
LABEL_9:
    if (v59)
      v59(v33);
    goto LABEL_14;
  }
  v39 = (void (*)())swift_allocObject();
  v40 = v52;
  *((_QWORD *)v39 + 2) = v53;
  *((_QWORD *)v39 + 3) = v40;
  *((_QWORD *)v39 + 4) = a3;
  swift_retain();
  default argument 0 of static LogSignpost.begin(logger:_:)();
  static LogSignpost.begin(logger:_:)((uint64_t)v18, "QueueLatency", 12, 2u, (uint64_t)v25);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v18, v9);
  if (one-time initialization token for fsCaptureQueue != -1)
    swift_once();
  outlined init with copy of LogSignpost((uint64_t)v25, (uint64_t)v23);
  v41 = (*(unsigned __int8 *)(v20 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80);
  v42 = (v21 + v41 + 7) & 0xFFFFFFFFFFFFFFF8;
  v43 = swift_allocObject();
  outlined init with take of LogSignpost((uint64_t)v23, v43 + v41);
  v44 = (void (**)())(v43 + v42);
  *v44 = partial apply for closure #1 in static FeatureStoreService.performInsert(qos:insertBlock:completion:);
  v44[1] = v39;
  v45 = (void (**)(uint64_t))(v43 + ((v42 + 23) & 0xFFFFFFFFFFFFFFF8));
  v47 = v58;
  v46 = (uint64_t)v59;
  *v45 = v59;
  v45[1] = v47;
  aBlock[4] = partial apply for closure #2 in static FeatureStoreService.performInsert(qos:insertBlock:completion:);
  aBlock[5] = v43;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = thunk for @escaping @callee_guaranteed @Sendable () -> ();
  aBlock[3] = &block_descriptor;
  v48 = _Block_copy(aBlock);
  v60 = MEMORY[0x24BEE4AF8];
  swift_retain();
  outlined copy of (@escaping @callee_guaranteed () -> ())?(v46);
  lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags(&lazy protocol witness table cache variable for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [DispatchWorkItemFlags]);
  lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A](&lazy protocol witness table cache variable for type [DispatchWorkItemFlags] and conformance [A], &demangling cache variable for type metadata for [DispatchWorkItemFlags]);
  v49 = v55;
  v50 = v57;
  dispatch thunk of SetAlgebra.init<A>(_:)();
  MEMORY[0x212BEE284](0, v54, v49, v48);
  _Block_release(v48);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v56 + 8))(v49, v50);
  outlined destroy of LogSignpost((uint64_t)v25);
  swift_release();
LABEL_14:
  OUTLINED_FUNCTION_0();
}

void closure #1 in static FeatureStoreService.performInsert(qos:insertBlock:completion:)(void (*a1)(uint64_t))
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = OUTLINED_FUNCTION_10_1();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_10_3();
  type metadata accessor for LogSignpost();
  OUTLINED_FUNCTION_5_4();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_13_3();
  default argument 0 of static LogSignpost.begin(logger:_:)();
  static LogSignpost.begin(logger:_:)(v2, "Insert", 6, 2u, v1);
  v7 = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(v2, v4);
  a1(v7);
  LogSignpost.end()();
  outlined destroy of LogSignpost(v1);
  OUTLINED_FUNCTION_0();
}

void closure #2 in static FeatureStoreService.performInsert(qos:insertBlock:completion:)(uint64_t a1, uint64_t (*a2)(void), uint64_t a3, void (*a4)(uint64_t))
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *boxed_opaque_existential_0;
  uint64_t v13;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DispatchQoS.QoSClass?);
  OUTLINED_FUNCTION_5_4();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_8();
  v9 = v8 - v7;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Any>);
  v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_212575370;
  qos_class_self();
  DispatchQoS.QoSClass.init(rawValue:)();
  v11 = type metadata accessor for DispatchQoS.QoSClass();
  *(_QWORD *)(v10 + 56) = v11;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)(v10 + 32));
  if (__swift_getEnumTagSinglePayload(v9, 1, v11) == 1)
  {
    (*(void (**)(uint64_t *, _QWORD, uint64_t))(*(_QWORD *)(v11 - 8) + 104))(boxed_opaque_existential_0, *MEMORY[0x24BEE5478], v11);
    outlined destroy of DispatchQoS.QoSClass?(v9);
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(boxed_opaque_existential_0, v9, v11);
  }
  print(_:separator:terminator:)();
  swift_bridgeObjectRelease();
  LogSignpost.end()();
  v13 = a2();
  if (a4)
    a4(v13);
  OUTLINED_FUNCTION_0();
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

uint64_t static FeatureStoreService.performRetrieve<A>(retrieveBlock:)@<X0>(void (*a1)(uint64_t)@<X0>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
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
  uint64_t v20;
  uint64_t v22;

  v5 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](a1);
  OUTLINED_FUNCTION_8();
  v8 = v7 - v6;
  v9 = type metadata accessor for Logger();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_8();
  v13 = v12 - v11;
  type metadata accessor for LogSignpost();
  OUTLINED_FUNCTION_5_4();
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_8();
  v17 = v16 - v15;
  if (objc_msgSend((id)objc_opt_self(), sel_isSupportedUser))
  {
    default argument 0 of static LogSignpost.begin(logger:_:)();
    static LogSignpost.begin(logger:_:)(v13, "Retrieve", 8, 2u, v17);
    v18 = (*(uint64_t (**)(uint64_t, uint64_t))(v10 + 8))(v13, v9);
    a1(v18);
    if (!v22)
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 32))(a3, v8, a2);
    LogSignpost.end()();
    return outlined destroy of LogSignpost(v17);
  }
  else
  {
    lazy protocol witness table accessor for type FeatureStoreError and conformance FeatureStoreError();
    swift_allocError();
    *(_QWORD *)v20 = 0xD000000000000040;
    *(_QWORD *)(v20 + 8) = 0x8000000212577030;
    *(_BYTE *)(v20 + 16) = 0;
    return swift_willThrow();
  }
}

id FeatureStoreService.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id FeatureStoreService.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FeatureStoreService();
  return objc_msgSendSuper2(&v2, sel_init);
}

id FeatureStoreService.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FeatureStoreService();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_212561ED0()
{
  swift_release();
  return swift_deallocObject();
}

void partial apply for closure #1 in static FeatureStoreService.performInsert(qos:insertBlock:completion:)()
{
  uint64_t v0;

  closure #1 in static FeatureStoreService.performInsert(qos:insertBlock:completion:)(*(void (**)(uint64_t))(v0 + 24));
}

uint64_t outlined init with copy of LogSignpost(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for LogSignpost();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_212561F40()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = OUTLINED_FUNCTION_15_2();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (((*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8;
  v5 = v0 + v3;
  swift_release();
  v6 = v5 + *(int *)(v1 + 24);
  v7 = type metadata accessor for OSSignposter();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  swift_release();
  if (*(_QWORD *)(v0 + v4))
    swift_release();
  return swift_deallocObject();
}

uint64_t outlined init with take of LogSignpost(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for LogSignpost();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void partial apply for closure #2 in static FeatureStoreService.performInsert(qos:insertBlock:completion:)()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;

  v1 = *(_QWORD *)(OUTLINED_FUNCTION_15_2() - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v3 = (*(_QWORD *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8;
  closure #2 in static FeatureStoreService.performInsert(qos:insertBlock:completion:)(v0 + v2, *(uint64_t (**)(void))(v0 + v3), *(_QWORD *)(v0 + v3 + 8), *(void (**)(uint64_t))(v0 + ((v3 + 23) & 0xFFFFFFFFFFFFFFF8)));
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

uint64_t outlined copy of (@escaping @callee_guaranteed () -> ())?(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

uint64_t type metadata accessor for FeatureStoreService()
{
  return objc_opt_self();
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

uint64_t outlined destroy of DispatchQoS.QoSClass?(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DispatchQoS.QoSClass?);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
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

void lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t v5;

  if (!*a1)
  {
    v5 = a2(255);
    atomic_store(MEMORY[0x212BEEBCC](a3, v5), a1);
  }
  OUTLINED_FUNCTION_20_1();
}

void lazy protocol witness table accessor for type [DispatchWorkItemFlags] and conformance [A](unint64_t *a1, uint64_t *a2)
{
  uint64_t v3;

  if (!*a1)
  {
    v3 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    atomic_store(MEMORY[0x212BEEBCC](MEMORY[0x24BEE12C8], v3), a1);
  }
  OUTLINED_FUNCTION_20_1();
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

uint64_t OUTLINED_FUNCTION_0_5()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_3_4()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t OUTLINED_FUNCTION_4_3()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_10_3()
{
  return 0;
}

void OUTLINED_FUNCTION_11_2(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;

  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

BOOL OUTLINED_FUNCTION_12_2(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_14_2()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_15_2()
{
  return type metadata accessor for LogSignpost();
}

void SerializableStreamAccessor.insert(interactionId:feature:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  void *v13;
  id v14;
  id v15;
  id v16[2];

  v4 = v3;
  v16[1] = *(id *)MEMORY[0x24BDAC8D0];
  v6 = *(_QWORD *)(*v4 + 144);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v9 = (char *)v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for SerializableFeatureWrapper(0, v6, *(_QWORD *)(v10 + 152), v11);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a3, v6);
  swift_bridgeObjectRetain();
  v12 = SerializableFeatureWrapper.__allocating_init(interactionId:dataVersion:feature:)();
  v13 = (void *)v4[2];
  v16[0] = 0;
  if ((objc_msgSend(v13, sel_insert_error_, v12, v16) & 1) != 0)
  {
    v14 = v16[0];
  }
  else
  {
    v15 = v16[0];
    _convertNSErrorToError(_:)();

    swift_willThrow();
  }
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_1_2();
}

void SerializableStreamAccessor.retrieve(interactionId:)(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t (*v11)(void);
  uint64_t v12;
  uint64_t v13;

  v4 = *v1;
  v5 = (*(uint64_t (**)(void))(*v1 + 112))();
  if (v2)
    goto LABEL_6;
  v7 = (_QWORD *)v5;
  v8 = *(_QWORD *)(v4 + 144);
  type metadata accessor for SerializableFeatureWrapper(0, v8, *(_QWORD *)(v4 + 152), v6);
  if (v7[2])
  {
    v9 = v7[4];
    v10 = v7[5];
    outlined copy of Data._Representation(v9, v10);
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_4_4();
    v12 = v11();
    outlined consume of Data._Representation(v9, v10);
    if (v12)
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a1, v12 + *(_QWORD *)(*(_QWORD *)v12 + 88), v8);
      OUTLINED_FUNCTION_2_4();
    }
    else
    {
      lazy protocol witness table accessor for type FeatureStoreError and conformance FeatureStoreError();
      OUTLINED_FUNCTION_2();
      OUTLINED_FUNCTION_0_6(v13, (uint64_t)"Stored data could not be deserialized!");
    }
LABEL_6:
    OUTLINED_FUNCTION_1_2();
    return;
  }
  __break(1u);
}

uint64_t SerializableStreamAccessor.retrieve(interactionId:)(uint64_t a1, uint64_t a2)
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
  unint64_t v13;
  _OWORD v15[2];
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  _QWORD v19[2];

  v6 = *(_QWORD *)v2;
  v7 = (*(uint64_t (**)(void))(*(_QWORD *)v2 + 120))();
  if (!v3)
  {
    v19[1] = v7;
    MEMORY[0x24BDAC7A8](v7);
    v18 = *(_OWORD *)(v6 + 144);
    v15[1] = v18;
    v16 = a1;
    v17 = a2;
    v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [InteractionWrapper<Data>]);
    v11 = type metadata accessor for InteractionWrapper(0, v18, v9, v10);
    v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
    v13 = lazy protocol witness table accessor for type [InteractionWrapper<Data>] and conformance [A]();
    v2 = _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lF((void (*)(char *, char *))partial apply for closure #1 in SerializableStreamAccessor.retrieve(interactionId:), (uint64_t)v15, v8, v11, v12, v13, MEMORY[0x24BEE3F20], (uint64_t)v19);
    swift_bridgeObjectRelease();
  }
  return v2;
}

uint64_t closure #1 in SerializableStreamAccessor.retrieve(interactionId:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X5>, uint64_t a6@<X8>)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(void);
  uint64_t v18;
  uint64_t result;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;

  v23 = a5;
  v10 = *(_QWORD *)(a4 - 8);
  v11 = MEMORY[0x24BDAC7A8](a1);
  v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = *(double *)(v11 + 16);
  type metadata accessor for SerializableFeatureWrapper(0, v15, v16, v15);
  OUTLINED_FUNCTION_4_4();
  v18 = v17();
  if (v18)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v13, v18 + *(_QWORD *)(*(_QWORD *)v18 + 88), a4);
    swift_bridgeObjectRetain();
    InteractionWrapper.init(interactionId:timestamp:feature:)(a2, a3, (uint64_t)v13, a4, a6, v14);
    return OUTLINED_FUNCTION_2_4();
  }
  else
  {
    lazy protocol witness table accessor for type FeatureStoreError and conformance FeatureStoreError();
    v20 = OUTLINED_FUNCTION_2();
    result = OUTLINED_FUNCTION_0_6(v21, (uint64_t)"Stored data could not be deserialized!");
    *v23 = v20;
  }
  return result;
}

uint64_t partial apply for closure #1 in SerializableStreamAccessor.retrieve(interactionId:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t *v3;

  return closure #1 in SerializableStreamAccessor.retrieve(interactionId:)(a1, v3[4], v3[5], v3[2], a2, a3);
}

uint64_t type metadata completion function for SerializableStreamAccessor()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for SerializableStreamAccessor(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for SerializableStreamAccessor);
}

uint64_t OUTLINED_FUNCTION_0_6@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  *(_QWORD *)a1 = 0xD000000000000026;
  *(_QWORD *)(a1 + 8) = (a2 - 32) | 0x8000000000000000;
  *(_BYTE *)(a1 + 16) = 0;
  return swift_willThrow();
}

uint64_t OUTLINED_FUNCTION_2_4()
{
  return swift_release();
}

uint64_t static PBCodableCoder.encode(codable:)(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(a1, sel_data);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = static Data._unconditionallyBridgeFromObjectiveC(_:)();

  return v3;
}

id static PBCodableCoder.decode(data:)(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v15;

  v4 = type metadata accessor for Logger();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  outlined copy of Data._Representation(a1, a2);
  v9 = @nonobjc PBCodable.init(data:)(a1, a2);
  if (!v9)
  {
    v10 = Logger.accessor.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v10, v4);
    v11 = Logger.logObject.getter();
    v12 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_212552000, v11, v12, "Serialization failed", v13, 2u);
      MEMORY[0x212BEEC50](v13, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  return v9;
}

uint64_t protocol witness for static Coder.encode(codable:) in conformance PBCodableCoder<A>(void **a1)
{
  return static PBCodableCoder.encode(codable:)(*a1);
}

id protocol witness for static Coder.decode(data:) in conformance PBCodableCoder<A>@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  id result;

  result = static PBCodableCoder.decode(data:)(a1, a2);
  *a3 = result;
  return result;
}

uint64_t type metadata accessor for PBCodableCoder(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for PBCodableCoder);
}

uint64_t one-time initialization function for accessor(uint64_t a1)
{
  return one-time initialization function for accessor(a1, static Logger.accessor);
}

uint64_t Logger.accessor.unsafeMutableAddressor()
{
  return Logger.accessor.unsafeMutableAddressor(one-time initialization token for accessor, (uint64_t)static Logger.accessor);
}

uint64_t static Logger.accessor.getter@<X0>(uint64_t a1@<X8>)
{
  return static Logger.accessor.getter(one-time initialization token for accessor, (uint64_t)static Logger.accessor, a1);
}

uint64_t one-time initialization function for contextProviding(uint64_t a1)
{
  return one-time initialization function for accessor(a1, static Logger.contextProviding);
}

uint64_t Logger.contextProviding.unsafeMutableAddressor()
{
  return Logger.accessor.unsafeMutableAddressor(&one-time initialization token for contextProviding, (uint64_t)static Logger.contextProviding);
}

uint64_t Logger.accessor.unsafeMutableAddressor(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;

  if (*a1 != -1)
    swift_once();
  v3 = OUTLINED_FUNCTION_10_1();
  return __swift_project_value_buffer(v3, a2);
}

uint64_t static Logger.contextProviding.getter@<X0>(uint64_t a1@<X8>)
{
  return static Logger.accessor.getter(&one-time initialization token for contextProviding, (uint64_t)static Logger.contextProviding, a1);
}

uint64_t static Logger.accessor.getter@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;

  if (*a1 != -1)
    swift_once();
  v5 = OUTLINED_FUNCTION_10_1();
  v6 = __swift_project_value_buffer(v5, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a3, v6, v5);
}

uint64_t one-time initialization function for service(uint64_t a1)
{
  return one-time initialization function for accessor(a1, static Logger.service);
}

uint64_t Logger.service.unsafeMutableAddressor()
{
  return Logger.accessor.unsafeMutableAddressor(&one-time initialization token for service, (uint64_t)static Logger.service);
}

uint64_t static Logger.service.getter@<X0>(uint64_t a1@<X8>)
{
  return static Logger.accessor.getter(&one-time initialization token for service, (uint64_t)static Logger.service, a1);
}

uint64_t one-time initialization function for SELF(uint64_t a1)
{
  return one-time initialization function for accessor(a1, static Logger.SELF);
}

uint64_t Logger.SELF.unsafeMutableAddressor()
{
  return Logger.accessor.unsafeMutableAddressor(&one-time initialization token for SELF, (uint64_t)static Logger.SELF);
}

uint64_t static Logger.SELF.getter@<X0>(uint64_t a1@<X8>)
{
  return static Logger.accessor.getter(&one-time initialization token for SELF, (uint64_t)static Logger.SELF, a1);
}

uint64_t one-time initialization function for signpost(uint64_t a1)
{
  return one-time initialization function for accessor(a1, static Logger.signpost);
}

uint64_t one-time initialization function for accessor(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_10_1();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return Logger.init(subsystem:category:)();
}

uint64_t Logger.signpost.unsafeMutableAddressor()
{
  return Logger.accessor.unsafeMutableAddressor(&one-time initialization token for signpost, (uint64_t)static Logger.signpost);
}

uint64_t static Logger.signpost.getter@<X0>(uint64_t a1@<X8>)
{
  return static Logger.accessor.getter(&one-time initialization token for signpost, (uint64_t)static Logger.signpost, a1);
}

ValueMetadata *type metadata accessor for Logger()
{
  return &type metadata for Logger;
}

void StreamQuery.startDate.getter(uint64_t a1@<X8>)
{
  StreamQuery.startDate.getter(&OBJC_IVAR___FSFStreamQuery_startDate, a1);
}

uint64_t outlined init with copy of Date?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void StreamQuery.startDate.setter(uint64_t a1)
{
  StreamQuery.startDate.setter(a1, &OBJC_IVAR___FSFStreamQuery_startDate);
}

uint64_t outlined assign with take of Date?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t key path getter for StreamQuery.startDate : StreamQuery(_QWORD **a1)
{
  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & **a1) + 0x68))();
}

uint64_t key path setter for StreamQuery.startDate : StreamQuery(uint64_t a1, _QWORD **a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v8;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with copy of Date?(a1, (uint64_t)v6);
  return (*(uint64_t (**)(char *))((*MEMORY[0x24BEE4EA0] & **a2) + 0x70))(v6);
}

void StreamQuery.startDate.modify()
{
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_20_1();
}

uint64_t variable initialization expression of StreamQuery.endDate@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;

  v2 = OUTLINED_FUNCTION_3_5();
  return __swift_storeEnumTagSinglePayload(a1, 1, 1, v2);
}

id @objc StreamQuery.startDate.getter(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  Class isa;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  OUTLINED_FUNCTION_5_4();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_8();
  v7 = v6 - v5;
  a3();
  v8 = OUTLINED_FUNCTION_3_5();
  isa = 0;
  if (__swift_getEnumTagSinglePayload(v7, 1, v8) != 1)
  {
    isa = Date._bridgeToObjectiveC()().super.isa;
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
  }
  return OUTLINED_FUNCTION_6_1(isa);
}

void StreamQuery.endDate.getter(uint64_t a1@<X8>)
{
  StreamQuery.startDate.getter(&OBJC_IVAR___FSFStreamQuery_endDate, a1);
}

void StreamQuery.startDate.getter(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  OUTLINED_FUNCTION_7_5(*a1);
  OUTLINED_FUNCTION_4_3();
  outlined init with copy of Date?(v2, a2);
  OUTLINED_FUNCTION_6_4();
}

void @objc StreamQuery.startDate.setter(void *a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  OUTLINED_FUNCTION_5_4();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_8();
  v10 = v9 - v8;
  if (a3)
  {
    static Date._unconditionallyBridgeFromObjectiveC(_:)();
    v11 = OUTLINED_FUNCTION_3_5();
    v12 = 0;
  }
  else
  {
    v11 = OUTLINED_FUNCTION_3_5();
    v12 = 1;
  }
  __swift_storeEnumTagSinglePayload(v10, v12, 1, v11);
  v13 = a1;
  a4(v10);

}

void StreamQuery.endDate.setter(uint64_t a1)
{
  StreamQuery.startDate.setter(a1, &OBJC_IVAR___FSFStreamQuery_endDate);
}

void StreamQuery.startDate.setter(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  OUTLINED_FUNCTION_7_5(*a2);
  OUTLINED_FUNCTION_0_7();
  outlined assign with take of Date?(a1, v2);
  swift_endAccess();
  OUTLINED_FUNCTION_6_4();
}

uint64_t key path getter for StreamQuery.endDate : StreamQuery(_QWORD **a1)
{
  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & **a1) + 0x80))();
}

uint64_t key path setter for StreamQuery.endDate : StreamQuery(uint64_t a1, _QWORD **a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v8;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with copy of Date?(a1, (uint64_t)v6);
  return (*(uint64_t (**)(char *))((*MEMORY[0x24BEE4EA0] & **a2) + 0x88))(v6);
}

void StreamQuery.endDate.modify()
{
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_20_1();
}

uint64_t variable initialization expression of StreamQuery.interactionIds()
{
  return MEMORY[0x24BEE4AF8];
}

uint64_t StreamQuery.interactionIds.getter()
{
  OUTLINED_FUNCTION_4_3();
  return swift_bridgeObjectRetain();
}

void StreamQuery.interactionIds.setter(uint64_t a1)
{
  _QWORD *v1;

  OUTLINED_FUNCTION_7_5(OBJC_IVAR___FSFStreamQuery_interactionIds);
  OUTLINED_FUNCTION_4_3();
  *v1 = a1;
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_6_4();
}

uint64_t key path getter for StreamQuery.interactionIds : StreamQuery@<X0>(_QWORD **a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & **a1) + 0x98))();
  *a2 = result;
  return result;
}

uint64_t key path setter for StreamQuery.interactionIds : StreamQuery(uint64_t a1, _QWORD **a2)
{
  uint64_t (*v2)(uint64_t);
  uint64_t v3;

  v2 = *(uint64_t (**)(uint64_t))((*MEMORY[0x24BEE4EA0] & **a2) + 0xA0);
  v3 = swift_bridgeObjectRetain();
  return v2(v3);
}

void StreamQuery.interactionIds.modify()
{
  OUTLINED_FUNCTION_0_7();
  OUTLINED_FUNCTION_20_1();
}

id StreamQuery.__allocating_init(startDate:endDate:interactionIds:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_class *v3;
  id v7;

  v7 = objc_allocWithZone(v3);
  return StreamQuery.init(startDate:endDate:interactionIds:)(a1, a2, a3);
}

id StreamQuery.init(startDate:endDate:interactionIds:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char *v3;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  id v11;
  objc_super v13;

  v7 = (uint64_t)&v3[OBJC_IVAR___FSFStreamQuery_startDate];
  OUTLINED_FUNCTION_3_5();
  OUTLINED_FUNCTION_5_5(v7);
  v8 = (uint64_t)&v3[OBJC_IVAR___FSFStreamQuery_endDate];
  OUTLINED_FUNCTION_5_5((uint64_t)&v3[OBJC_IVAR___FSFStreamQuery_endDate]);
  v9 = &v3[OBJC_IVAR___FSFStreamQuery_interactionIds];
  *(_QWORD *)&v3[OBJC_IVAR___FSFStreamQuery_interactionIds] = MEMORY[0x24BEE4AF8];
  OUTLINED_FUNCTION_0_7();
  v10 = v3;
  outlined assign with copy of Date?(a1, v7);
  swift_endAccess();
  OUTLINED_FUNCTION_0_7();
  outlined assign with copy of Date?(a2, v8);
  swift_endAccess();
  OUTLINED_FUNCTION_4_3();
  *(_QWORD *)v9 = a3;

  swift_bridgeObjectRelease();
  v13.receiver = v10;
  v13.super_class = (Class)type metadata accessor for StreamQuery();
  v11 = objc_msgSendSuper2(&v13, sel_init);
  outlined destroy of Date?(a2);
  outlined destroy of Date?(a1);
  return v11;
}

uint64_t outlined assign with copy of Date?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for StreamQuery()
{
  uint64_t result;

  result = type metadata singleton initialization cache for StreamQuery;
  if (!type metadata singleton initialization cache for StreamQuery)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t StreamQuery.description.getter()
{
  _QWORD *v0;
  uint64_t v1;
  Swift::String v2;
  _QWORD *v3;
  Swift::String v4;
  Swift::String v5;
  Swift::String v6;
  Swift::String v8;
  Swift::String v9;
  Swift::String v10;

  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  OUTLINED_FUNCTION_5_4();
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_8();
  _StringGuts.grow(_:)(60);
  v2._countAndFlagsBits = 0xD000000000000017;
  v2._object = (void *)0x8000000212577110;
  String.append(_:)(v2);
  v3 = (_QWORD *)MEMORY[0x24BEE4EA0];
  OUTLINED_FUNCTION_12_3();
  v8._countAndFlagsBits = OUTLINED_FUNCTION_10_4();
  OUTLINED_FUNCTION_13_4(v8);
  swift_bridgeObjectRelease();
  v4._countAndFlagsBits = 0x746144646E65202CLL;
  v4._object = (void *)0xEB00000000203A65;
  String.append(_:)(v4);
  OUTLINED_FUNCTION_12_3();
  v9._countAndFlagsBits = OUTLINED_FUNCTION_10_4();
  OUTLINED_FUNCTION_13_4(v9);
  OUTLINED_FUNCTION_9_5();
  v5._object = (void *)0x8000000212577130;
  v5._countAndFlagsBits = 0xD000000000000013;
  String.append(_:)(v5);
  (*(void (**)(void))((*v3 & *v0) + 0x98))();
  v10._countAndFlagsBits = MEMORY[0x212BEE0E0]();
  OUTLINED_FUNCTION_13_4(v10);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_9_5();
  v6._countAndFlagsBits = 41;
  v6._object = (void *)0xE100000000000000;
  String.append(_:)(v6);
  return 0;
}

id StreamQuery.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void StreamQuery.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id StreamQuery.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for StreamQuery();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t ObjC metadata update function for StreamQuery()
{
  return type metadata accessor for StreamQuery();
}

void type metadata completion function for StreamQuery()
{
  unint64_t v0;

  type metadata accessor for Date?();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

uint64_t method lookup function for StreamQuery()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of StreamQuery.startDate.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x68))();
}

uint64_t dispatch thunk of StreamQuery.startDate.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x70))();
}

uint64_t dispatch thunk of StreamQuery.startDate.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of StreamQuery.endDate.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of StreamQuery.endDate.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of StreamQuery.endDate.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x90))();
}

uint64_t dispatch thunk of StreamQuery.interactionIds.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of StreamQuery.interactionIds.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of StreamQuery.interactionIds.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of StreamQuery.__allocating_init(startDate:endDate:interactionIds:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 176))();
}

void type metadata accessor for Date?()
{
  unint64_t v0;
  uint64_t v1;

  if (!lazy cache variable for type metadata for Date?)
  {
    type metadata accessor for Date();
    v0 = type metadata accessor for Optional();
    if (!v1)
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for Date?);
  }
}

uint64_t OUTLINED_FUNCTION_0_7()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_3_5()
{
  return type metadata accessor for Date();
}

uint64_t OUTLINED_FUNCTION_5_5(uint64_t a1)
{
  uint64_t v1;

  return __swift_storeEnumTagSinglePayload(a1, 1, 1, v1);
}

uint64_t OUTLINED_FUNCTION_7_5@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return v1 + a1;
}

uint64_t OUTLINED_FUNCTION_9_5()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_10_4()
{
  return String.init<A>(describing:)();
}

uint64_t OUTLINED_FUNCTION_12_3()
{
  uint64_t (*v0)(void);

  return v0();
}

void OUTLINED_FUNCTION_13_4(Swift::String a1)
{
  String.append(_:)(a1);
}

uint64_t LogSignpost.name.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t LogSignpost.state.getter()
{
  return swift_retain();
}

uint64_t LogSignpost.signposter.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  OUTLINED_FUNCTION_15_2();
  OUTLINED_FUNCTION_0_8();
  v0 = OUTLINED_FUNCTION_7_6();
  return OUTLINED_FUNCTION_1_3(v0, v1, v2, v3);
}

uint64_t type metadata accessor for LogSignpost()
{
  uint64_t result;

  result = type metadata singleton initialization cache for LogSignpost;
  if (!type metadata singleton initialization cache for LogSignpost)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t LogSignpost.init(name:state:signposter:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *(_QWORD *)a6 = a1;
  *(_QWORD *)(a6 + 8) = a2;
  *(_BYTE *)(a6 + 16) = a3;
  *(_QWORD *)(a6 + 24) = a4;
  v7 = a6 + *(int *)(OUTLINED_FUNCTION_15_2() + 24);
  OUTLINED_FUNCTION_0_8();
  OUTLINED_FUNCTION_12_4();
  return OUTLINED_FUNCTION_1_3(v7, a5, v9, *(uint64_t (**)(void))(v8 + 32));
}

uint64_t default argument 0 of static LogSignpost.begin(logger:_:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  Logger.signpost.unsafeMutableAddressor();
  type metadata accessor for Logger();
  v0 = OUTLINED_FUNCTION_7_6();
  return OUTLINED_FUNCTION_1_3(v0, v1, v2, v3);
}

void static LogSignpost.begin(logger:_:)(uint64_t a1@<X0>, const char *a2@<X1>, uint64_t a3@<X2>, unsigned __int8 a4@<W3>, uint64_t a5@<X8>)
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t, uint64_t);
  char *v24;
  uint64_t v25;
  NSObject *v26;
  os_signpost_type_t v27;
  const char *v28;
  uint8_t *v29;
  os_signpost_id_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  int v36;
  uint64_t v37;
  char v38;

  v37 = a3;
  v35 = a2;
  v36 = a4;
  v7 = type metadata accessor for OSSignpostID();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v11 = (char *)&v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v33 - v12;
  v14 = type metadata accessor for Logger();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_8();
  v18 = v17 - v16;
  v19 = OUTLINED_FUNCTION_0_8();
  v33 = *(_QWORD *)(v19 - 8);
  v34 = v19;
  MEMORY[0x24BDAC7A8](v19);
  OUTLINED_FUNCTION_8();
  v22 = v21 - v20;
  v23 = *(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 16);
  v24 = v13;
  v23(v18, a1, v14);
  v25 = v37;
  OSSignposter.init(logger:)();
  OSSignposter.logHandle.getter();
  OSSignpostID.init(log:)();
  v26 = OSSignposter.logHandle.getter();
  v27 = static os_signpost_type_t.begin.getter();
  if ((OS_os_log.signpostsEnabled.getter() & 1) == 0)
  {

    (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v11, v24, v7);
    type metadata accessor for OSSignpostIntervalState();
    swift_allocObject();
    v31 = OSSignpostIntervalState.init(id:isOpen:)();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v24, v7);
    *(_QWORD *)a5 = v35;
    *(_QWORD *)(a5 + 8) = v25;
    *(_BYTE *)(a5 + 16) = v36;
    *(_QWORD *)(a5 + 24) = v31;
    v32 = OUTLINED_FUNCTION_15_2();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v33 + 32))(a5 + *(int *)(v32 + 24), v22, v34);
    OUTLINED_FUNCTION_0();
    return;
  }
  if ((v36 & 1) == 0)
  {
    v28 = v35;
    if (v35)
    {
LABEL_9:
      v29 = (uint8_t *)OUTLINED_FUNCTION_8_4();
      *(_WORD *)v29 = 0;
      v30 = OSSignpostID.rawValue.getter();
      _os_signpost_emit_with_name_impl(&dword_212552000, v26, v27, v30, v28, "", v29, 2u);
      OUTLINED_FUNCTION_1();
    }
    __break(1u);
    goto LABEL_12;
  }
  if ((unint64_t)v35 >> 32)
  {
LABEL_12:
    __break(1u);
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  if (v35 >> 11 != 27)
  {
    if (v35 >> 16 <= 0x10)
    {
      v28 = &v38;
      goto LABEL_9;
    }
    goto LABEL_13;
  }
LABEL_14:
  __break(1u);
}

Swift::Void __swiftcall LogSignpost.end()()
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
  char v15;
  NSObject *v16;
  uint64_t v17;
  const char *v18;
  uint8_t *v19;
  os_signpost_id_t v20;
  os_signpost_type_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  char v26;

  v1 = type metadata accessor for OSSignpostError();
  v22 = *(_QWORD *)(v1 - 8);
  v23 = v1;
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_8();
  v24 = v3 - v2;
  v4 = type metadata accessor for OSSignpostID();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_8();
  v8 = v7 - v6;
  v9 = OUTLINED_FUNCTION_0_8();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_8();
  v13 = v12 - v11;
  v14 = OUTLINED_FUNCTION_15_2();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v13, v0 + *(int *)(v14 + 24), v9);
  v25 = *(const char **)v0;
  v15 = *(_BYTE *)(v0 + 16);
  v16 = OSSignposter.logHandle.getter();
  OSSignpostIntervalState.signpostID.getter();
  v21 = static os_signpost_type_t.end.getter();
  if ((OS_os_log.signpostsEnabled.getter() & 1) == 0)
  {

    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v8, v4);
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v13, v9);
    OUTLINED_FUNCTION_0();
    return;
  }
  if ((v15 & 1) == 0)
  {
    if (v25)
    {
      v17 = v24;
      goto LABEL_9;
    }
    __break(1u);
    goto LABEL_15;
  }
  if ((unint64_t)v25 >> 32)
  {
LABEL_15:
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  if (v25 >> 11 != 27)
  {
    v17 = v24;
    if (v25 >> 16 <= 0x10)
    {
      v25 = &v26;
LABEL_9:
      swift_retain();
      checkForErrorAndConsumeState(state:)();
      swift_release();
      if ((*(unsigned int (**)(uint64_t, uint64_t))(v22 + 88))(v17, v23) == *MEMORY[0x24BEE7810])
      {
        v18 = "[Error] Interval already ended";
      }
      else
      {
        (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v17, v23);
        v18 = "";
      }
      v19 = (uint8_t *)OUTLINED_FUNCTION_8_4();
      *(_WORD *)v19 = 0;
      v20 = OSSignpostID.rawValue.getter();
      _os_signpost_emit_with_name_impl(&dword_212552000, v16, v21, v20, v25, v18, v19, 2u);
      OUTLINED_FUNCTION_1();
    }
    goto LABEL_16;
  }
LABEL_17:
  __break(1u);
}

void initializeBufferWithCopyOfBuffer for LogSignpost(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((*(_DWORD *)(*(_QWORD *)(a3 - 8) + 80) & 0x20000) != 0)
  {
    *(_QWORD *)a1 = *(_QWORD *)a2;
    swift_retain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
    *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
    OUTLINED_FUNCTION_0_8();
    OUTLINED_FUNCTION_5_6();
    OUTLINED_FUNCTION_8_5();
  }
  OUTLINED_FUNCTION_9_6();
}

uint64_t destroy for LogSignpost(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_release();
  v4 = a1 + *(int *)(a2 + 24);
  v5 = OUTLINED_FUNCTION_0_8();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

void initializeWithCopy for LogSignpost(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  OUTLINED_FUNCTION_0_8();
  OUTLINED_FUNCTION_5_6();
  OUTLINED_FUNCTION_8_5();
  OUTLINED_FUNCTION_9_6();
}

void assignWithCopy for LogSignpost(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_retain();
  swift_release();
  OUTLINED_FUNCTION_0_8();
  OUTLINED_FUNCTION_12_4();
  OUTLINED_FUNCTION_11_3(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 24));
  OUTLINED_FUNCTION_1_1();
}

void initializeWithTake for LogSignpost(__n128 *a1, __n128 *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  OUTLINED_FUNCTION_6_5(a1, a2);
  *(_QWORD *)(v2 + 24) = v3;
  v5 = *(int *)(v4 + 24);
  v6 = v2 + v5;
  v8 = v7 + v5;
  OUTLINED_FUNCTION_0_8();
  OUTLINED_FUNCTION_12_4();
  (*(void (**)(uint64_t, uint64_t))(v9 + 32))(v6, v8);
  OUTLINED_FUNCTION_1_1();
}

void assignWithTake for LogSignpost(__n128 *a1, __n128 *a2)
{
  unint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6_5(a1, a2);
  a1[1].n128_u64[1] = v3;
  swift_release();
  OUTLINED_FUNCTION_0_8();
  OUTLINED_FUNCTION_12_4();
  OUTLINED_FUNCTION_11_3(*(uint64_t (**)(uint64_t, uint64_t))(v4 + 40));
  OUTLINED_FUNCTION_1_1();
}

uint64_t getEnumTagSinglePayload for LogSignpost()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_21256425C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 24);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = OUTLINED_FUNCTION_0_8();
    return __swift_getEnumTagSinglePayload(a1 + *(int *)(a3 + 24), a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for LogSignpost()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2125642D8(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 24) = (a2 - 1);
  }
  else
  {
    v7 = OUTLINED_FUNCTION_0_8();
    return __swift_storeEnumTagSinglePayload(v5 + *(int *)(a4 + 24), a2, a2, v7);
  }
  return result;
}

uint64_t type metadata completion function for LogSignpost()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for OSSignposter();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_8()
{
  return type metadata accessor for OSSignposter();
}

uint64_t OUTLINED_FUNCTION_1_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  return a4();
}

uint64_t OUTLINED_FUNCTION_5_6()
{
  return swift_retain();
}

__n128 OUTLINED_FUNCTION_6_5(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  return result;
}

uint64_t OUTLINED_FUNCTION_7_6()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_8_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(v0, v1, v2);
}

uint64_t OUTLINED_FUNCTION_11_3@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

uint64_t SiriTurn.dictionaryRepresentation()()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  objc_class *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  char v16[40];
  objc_super v17;
  uint64_t v18;

  v1 = OUTLINED_FUNCTION_56();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = (objc_class *)type metadata accessor for SiriTurn();
  v17.receiver = v0;
  v17.super_class = v5;
  v6 = objc_msgSendSuper2(&v17, sel_dictionaryRepresentation);
  v7 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  v18 = v7;
  v13 = 0x64496E727574;
  v14 = 0xE600000000000000;
  v8 = MEMORY[0x24BEE0D00];
  AnyHashable.init<A>(_:)();
  dispatch thunk of SiriTurn.turnId.getter();
  v9 = UUID.uuidString.getter();
  v11 = v10;
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  v15 = v8;
  v13 = v9;
  v14 = v11;
  specialized Dictionary.subscript.setter((uint64_t)&v13, (uint64_t)v16);
  return v18;
}

void specialized Dictionary.subscript.setter(uint64_t a1, uint64_t a2)
{
  _OWORD v3[2];

  if (*(_QWORD *)(a1 + 24))
  {
    outlined init with take of Any((_OWORD *)a1, v3);
    specialized Dictionary._Variant.setValue(_:forKey:)(v3, a2);
    outlined destroy of AnyHashable(a2);
  }
  else
  {
    outlined destroy of InstrumentationStreamsProviderProtocol?(a1, &demangling cache variable for type metadata for Any?);
    specialized Dictionary._Variant.removeValue(forKey:)(a2, v3);
    outlined destroy of AnyHashable(a2);
    outlined destroy of InstrumentationStreamsProviderProtocol?((uint64_t)v3, &demangling cache variable for type metadata for Any?);
  }
}

Class @objc SiriTurn.dictionaryRepresentation()(void *a1, uint64_t a2)
{
  return @objc SiriTurn.dictionaryRepresentation()(a1, a2, (void (*)(void))SiriTurn.dictionaryRepresentation());
}

char *EventGraph.dictionaryRepresentation()()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  char *result;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t inited;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v0 = dispatch thunk of EventGraph.componentIdentifiers.getter();
  v1 = specialized Sequence.reduce<A>(into:_:)(MEMORY[0x24BEE4B00], v0);
  OUTLINED_FUNCTION_18_1();
  v2 = dispatch thunk of EventGraph.events()();
  if (v2 >> 62)
    v3 = _CocoaArrayWrapper.endIndex.getter();
  else
    v3 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v3)
  {
    OUTLINED_FUNCTION_9_5();
    v6 = MEMORY[0x24BEE4AF8];
LABEL_14:
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<(AnyHashable, Any)>);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_212575850;
    OUTLINED_FUNCTION_12_5();
    EventGraph.timestamp.getter();
    *(_QWORD *)(inited + 96) = MEMORY[0x24BEE13C8];
    *(_QWORD *)(inited + 72) = v14;
    OUTLINED_FUNCTION_12_5();
    *(_QWORD *)(inited + 168) = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [String : String]);
    *(_QWORD *)(inited + 144) = v1;
    OUTLINED_FUNCTION_12_5();
    *(_QWORD *)(inited + 240) = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [[AnyHashable : Any]]);
    *(_QWORD *)(inited + 216) = v6;
    return (char *)Dictionary.init(dictionaryLiteral:)();
  }
  v16 = MEMORY[0x24BEE4AF8];
  result = specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v3 & ~(v3 >> 63), 0);
  if ((v3 & 0x8000000000000000) == 0)
  {
    v15 = v1;
    v5 = 0;
    v6 = v16;
    do
    {
      if ((v2 & 0xC000000000000001) != 0)
        v7 = (id)MEMORY[0x212BEE3BC](v5, v2);
      else
        v7 = OUTLINED_FUNCTION_26(v2 + 8 * v5);
      v8 = v7;
      v9 = objc_msgSend(v7, sel_dictionaryRepresentation);
      v10 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

      v12 = *(_QWORD *)(v16 + 16);
      v11 = *(_QWORD *)(v16 + 24);
      if (v12 >= v11 >> 1)
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v11 > 1), v12 + 1, 1);
      ++v5;
      *(_QWORD *)(v16 + 16) = v12 + 1;
      *(_QWORD *)(v16 + 8 * v12 + 32) = v10;
    }
    while (v3 != v5);
    OUTLINED_FUNCTION_9_5();
    v1 = v15;
    goto LABEL_14;
  }
  __break(1u);
  return result;
}

uint64_t specialized Sequence.reduce<A>(into:_:)(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  int64_t v16;
  uint64_t v17;
  id v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  unsigned int v22;
  __CFString *v23;
  __CFString *v24;
  __CFString *v25;
  __CFString *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v35;
  char v36;
  uint64_t v37;
  _BOOL8 v38;
  Swift::Int v39;
  unint64_t v40;
  char v41;
  unint64_t v42;
  char v43;
  uint64_t *v44;
  uint64_t *v45;
  uint64_t *v46;
  uint64_t v47;
  BOOL v48;
  uint64_t v49;
  uint64_t result;
  _QWORD v51[5];
  int64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  id v58;
  unint64_t v59;
  int64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  _QWORD *v67;

  v4 = type metadata accessor for UUID();
  v56 = *(_QWORD *)(v4 - 8);
  v57 = v4;
  MEMORY[0x24BDAC7A8](v4);
  v55 = (char *)v51 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a2 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    __CocoaSet.makeIterator()();
    type metadata accessor for ComponentIdentifier();
    lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags(&lazy protocol witness table cache variable for type ComponentIdentifier and conformance NSObject, (uint64_t (*)(uint64_t))MEMORY[0x24BE94860], MEMORY[0x24BEE5BD8]);
    Set.Iterator.init(_cocoa:)();
    a2 = v62;
    v53 = v63;
    v6 = v64;
    v7 = v65;
    v8 = v66;
  }
  else
  {
    v9 = -1 << *(_BYTE *)(a2 + 32);
    v10 = *(_QWORD *)(a2 + 56);
    v53 = a2 + 56;
    v11 = ~v9;
    v12 = -v9;
    if (v12 < 64)
      v13 = ~(-1 << v12);
    else
      v13 = -1;
    v8 = v13 & v10;
    swift_bridgeObjectRetain();
    v6 = v11;
    v7 = 0;
  }
  v51[1] = v6;
  v51[4] = a2 & 0x7FFFFFFFFFFFFFFFLL;
  v52 = (unint64_t)(v6 + 64) >> 6;
  v51[3] = MEMORY[0x24BEE4AD0] + 8;
  v54 = a2;
  if (a2 < 0)
    goto LABEL_10;
LABEL_8:
  if (v8)
  {
    v14 = (v8 - 1) & v8;
    v15 = __clz(__rbit64(v8)) | (v7 << 6);
    v16 = v7;
    goto LABEL_29;
  }
  v19 = v7 + 1;
  if (!__OFADD__(v7, 1))
  {
    if (v19 >= v52)
      goto LABEL_42;
    v20 = *(_QWORD *)(v53 + 8 * v19);
    v16 = v7 + 1;
    if (!v20)
    {
      v16 = v7 + 2;
      if (v7 + 2 >= v52)
        goto LABEL_42;
      v20 = *(_QWORD *)(v53 + 8 * v16);
      if (!v20)
      {
        v16 = v7 + 3;
        if (v7 + 3 >= v52)
          goto LABEL_42;
        v20 = *(_QWORD *)(v53 + 8 * v16);
        if (!v20)
        {
          v16 = v7 + 4;
          if (v7 + 4 >= v52)
            goto LABEL_42;
          v20 = *(_QWORD *)(v53 + 8 * v16);
          if (!v20)
          {
            v16 = v7 + 5;
            if (v7 + 5 >= v52)
              goto LABEL_42;
            v20 = *(_QWORD *)(v53 + 8 * v16);
            if (!v20)
            {
              v21 = v7 + 6;
              while (v21 < v52)
              {
                v20 = *(_QWORD *)(v53 + 8 * v21++);
                if (v20)
                {
                  v16 = v21 - 1;
                  goto LABEL_28;
                }
              }
              goto LABEL_42;
            }
          }
        }
      }
    }
LABEL_28:
    v14 = (v20 - 1) & v20;
    v15 = __clz(__rbit64(v20)) + (v16 << 6);
LABEL_29:
    v18 = *(id *)(*(_QWORD *)(a2 + 48) + 8 * v15);
    if (v18)
    {
      while (1)
      {
        v59 = v14;
        v60 = v16;
        v22 = ComponentIdentifier.componentName.getter();
        v23 = CFSTR("COMPONENTNAME_UNKNOWN");
        v24 = CFSTR("COMPONENTNAME_UNKNOWN");
        if (v22 <= 0x36)
        {
          v24 = off_24CDD2A60[v22];
          v23 = off_24CDD2C18[v22];
        }
        v25 = v24;
        v26 = v23;
        v27 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        v29 = v28;

        v30 = v55;
        v58 = v18;
        dispatch thunk of ComponentIdentifier.uuid.getter();
        v31 = UUID.uuidString.getter();
        v33 = v32;
        (*(void (**)(char *, uint64_t))(v56 + 8))(v30, v57);
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v67 = a1;
        v35 = specialized __RawDictionaryStorage.find<A>(_:)(v27, v29);
        v37 = a1[2];
        v38 = (v36 & 1) == 0;
        v39 = v37 + v38;
        if (__OFADD__(v37, v38))
          break;
        v40 = v35;
        v41 = v36;
        __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _NativeDictionary<String, String>);
        if (_NativeDictionary.ensureUnique(isUnique:capacity:)(isUniquelyReferenced_nonNull_native, v39))
        {
          v42 = specialized __RawDictionaryStorage.find<A>(_:)(v27, v29);
          if ((v41 & 1) != (v43 & 1))
            goto LABEL_46;
          v40 = v42;
        }
        a1 = v67;
        if ((v41 & 1) != 0)
        {
          v44 = (uint64_t *)(v67[7] + 16 * v40);
          swift_bridgeObjectRelease();
          *v44 = v31;
          v44[1] = v33;
        }
        else
        {
          v67[(v40 >> 6) + 8] |= 1 << v40;
          v45 = (uint64_t *)(a1[6] + 16 * v40);
          *v45 = v27;
          v45[1] = v29;
          v46 = (uint64_t *)(a1[7] + 16 * v40);
          *v46 = v31;
          v46[1] = v33;
          v47 = a1[2];
          v48 = __OFADD__(v47, 1);
          v49 = v47 + 1;
          if (v48)
            goto LABEL_44;
          a1[2] = v49;
          swift_bridgeObjectRetain();
        }

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v8 = v59;
        v7 = v60;
        a2 = v54;
        if ((v54 & 0x8000000000000000) == 0)
          goto LABEL_8;
LABEL_10:
        v17 = __CocoaSet.Iterator.next()();
        if (v17)
        {
          v61 = v17;
          type metadata accessor for ComponentIdentifier();
          swift_unknownObjectRetain();
          swift_dynamicCast();
          v18 = v67;
          swift_unknownObjectRelease();
          v16 = v7;
          v14 = v8;
          if (v18)
            continue;
        }
        goto LABEL_42;
      }
      __break(1u);
LABEL_44:
      __break(1u);
      goto LABEL_45;
    }
LABEL_42:
    outlined consume of Set<ComponentIdentifier>.Iterator._Variant();
    return (uint64_t)a1;
  }
LABEL_45:
  __break(1u);
LABEL_46:
  result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

uint64_t _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lFSDySo21SISchemaComponentNameVSay19SiriInstrumentation0E10IdentifierCGG_SSs5NeverOTg506_sSo21def6VSay19g19Instrumentation0B10i30CGSSIgygo_AB3key_AF5valuetSSs5j138OIegnrzr_TR0109_s12FeatureStore27CurareInteractionSELFStreamC8retrieveSDys11AnyHashableVSDyAFSayypGGGyYaKFSaySSGycfu4_SSSo21abc7V_Say19d19N24J10F9CGtXEfU1_Tf3nnnpf_nTf1cn_n(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  uint64_t result;
  int v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  int64_t v16;
  int v17;
  uint64_t v18;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x24BEE4AF8];
  if (!v1)
    return v2;
  v18 = MEMORY[0x24BEE4AF8];
  specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v1, 0);
  v2 = v18;
  result = specialized Dictionary.startIndex.getter(a1);
  if ((result & 0x8000000000000000) == 0)
  {
    v6 = result;
    if (result < 1 << *(_BYTE *)(a1 + 32))
    {
      v7 = a1 + 64;
      while ((*(_QWORD *)(v7 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
      {
        if (v5 != *(_DWORD *)(a1 + 36))
          goto LABEL_18;
        v16 = v1;
        v17 = v5;
        v8 = *(unsigned int *)(*(_QWORD *)(a1 + 48) + 4 * v6);
        v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8 * v6);
        swift_bridgeObjectRetain();
        v10 = closure #3 in implicit closure #6 in CurareInteractionSELFStream.retrieve()(v8, v9);
        v12 = v11;
        result = swift_bridgeObjectRelease();
        v14 = *(_QWORD *)(v18 + 16);
        v13 = *(_QWORD *)(v18 + 24);
        if (v14 >= v13 >> 1)
          result = (uint64_t)specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((char *)(v13 > 1), v14 + 1, 1);
        *(_QWORD *)(v18 + 16) = v14 + 1;
        v15 = v18 + 16 * v14;
        *(_QWORD *)(v15 + 32) = v10;
        *(_QWORD *)(v15 + 40) = v12;
        if ((uint64_t)v6 >= -(-1 << *(_BYTE *)(a1 + 32)))
          goto LABEL_19;
        v7 = a1 + 64;
        if ((*(_QWORD *)(a1 + 64 + 8 * (v6 >> 6)) & (1 << v6)) == 0)
          goto LABEL_20;
        if (v17 != *(_DWORD *)(a1 + 36))
          goto LABEL_21;
        result = _HashTable.occupiedBucket(after:)();
        v1 = v16 - 1;
        if (v16 == 1)
          return v2;
        v6 = result;
        if ((result & 0x8000000000000000) == 0)
        {
          v5 = *(_DWORD *)(a1 + 36);
          if (result < 1 << *(_BYTE *)(a1 + 32))
            continue;
        }
        goto LABEL_22;
      }
      __break(1u);
LABEL_18:
      __break(1u);
LABEL_19:
      __break(1u);
LABEL_20:
      __break(1u);
LABEL_21:
      __break(1u);
    }
  }
LABEL_22:
  __break(1u);
  return result;
}

Class @objc EventGraph.dictionaryRepresentation()(void *a1, uint64_t a2)
{
  return @objc SiriTurn.dictionaryRepresentation()(a1, a2, (void (*)(void))EventGraph.dictionaryRepresentation());
}

Class @objc SiriTurn.dictionaryRepresentation()(void *a1, uint64_t a2, void (*a3)(void))
{
  id v4;
  Class isa;

  v4 = a1;
  a3();

  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  OUTLINED_FUNCTION_18_1();
  return isa;
}

uint64_t variable initialization expression of CurareInteractionSELFStream.logger@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  v2 = Logger.SELF.unsafeMutableAddressor();
  v3 = OUTLINED_FUNCTION_10_1();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v2, v3);
}

double variable initialization expression of CurareInteractionSELFStream.provider@<D0>(uint64_t a1@<X8>)
{
  double result;

  *(_QWORD *)(a1 + 32) = 0;
  result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return result;
}

void CurareInteractionSELFStream.__allocating_init(filter:)()
{
  void *v0;

  OUTLINED_FUNCTION_46();
  v0 = (void *)OUTLINED_FUNCTION_33_0();
  CurareInteractionSELFStream.init(filter:)(v0);
  OUTLINED_FUNCTION_20_1();
}

id CurareInteractionSELFStream.init(filter:)(void *a1)
{
  char *v1;
  char *v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  id v9;
  objc_super v11;

  v3 = &v1[OBJC_IVAR___FSFCurareInteractionSELFStream_logger];
  v4 = v1;
  v5 = Logger.SELF.unsafeMutableAddressor();
  v6 = OUTLINED_FUNCTION_10_1();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(v3, v5, v6);
  v7 = &v4[OBJC_IVAR___FSFCurareInteractionSELFStream_provider];
  *(_OWORD *)v7 = 0u;
  *((_OWORD *)v7 + 1) = 0u;
  *((_QWORD *)v7 + 4) = 0;
  *(_QWORD *)&v4[OBJC_IVAR___FSFCurareInteractionSELFStream_filter] = a1;
  v8 = a1;

  v11.receiver = v4;
  v11.super_class = (Class)ObjC metadata update function for CurareInteractionSELFStream();
  v9 = objc_msgSendSuper2(&v11, sel_init);

  return v9;
}

void CurareInteractionSELFStream.__allocating_init(provider:)()
{
  _QWORD *v0;

  OUTLINED_FUNCTION_46();
  v0 = (_QWORD *)OUTLINED_FUNCTION_33_0();
  CurareInteractionSELFStream.init(provider:)(v0);
  OUTLINED_FUNCTION_20_1();
}

_QWORD *CurareInteractionSELFStream.init(provider:)(_QWORD *a1)
{
  char *v1;
  char *v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  objc_super v11;
  _BYTE v12[40];

  v3 = &v1[OBJC_IVAR___FSFCurareInteractionSELFStream_logger];
  v4 = v1;
  v5 = Logger.SELF.unsafeMutableAddressor();
  v6 = OUTLINED_FUNCTION_10_1();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(v3, v5, v6);
  v7 = (uint64_t)&v4[OBJC_IVAR___FSFCurareInteractionSELFStream_provider];
  *(_OWORD *)v7 = 0u;
  *(_OWORD *)(v7 + 16) = 0u;
  *(_QWORD *)(v7 + 32) = 0;
  outlined init with copy of InstrumentationStreamsProviderProtocol((uint64_t)a1, (uint64_t)v12);
  OUTLINED_FUNCTION_4_3();
  outlined assign with take of InstrumentationStreamsProviderProtocol?((uint64_t)v12, v7);
  swift_endAccess();
  v8 = __swift_project_boxed_opaque_existential_1Tm(a1, a1[3]);
  *(_QWORD *)&v4[OBJC_IVAR___FSFCurareInteractionSELFStream_filter] = dispatch thunk of InstrumentationStreamsProviderProtocol.filter.getter();

  v11.receiver = v4;
  v11.super_class = (Class)ObjC metadata update function for CurareInteractionSELFStream();
  objc_msgSendSuper2(&v11, sel_init);
  v9 = OUTLINED_FUNCTION_33_0();
  __swift_destroy_boxed_opaque_existential_0(v9);
  return v8;
}

uint64_t CurareInteractionSELFStream.retrieve()()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1[75] = v0;
  v2 = OUTLINED_FUNCTION_56();
  v1[76] = v2;
  v1[77] = *(_QWORD *)(v2 - 8);
  v1[78] = OUTLINED_FUNCTION_8_1();
  v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for BookmarkablePublisher<EventGraph>);
  v1[79] = v3;
  v1[80] = *(_QWORD *)(v3 - 8);
  v1[81] = OUTLINED_FUNCTION_8_1();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  v1[82] = OUTLINED_FUNCTION_8_1();
  return swift_task_switch();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  void *v13;
  os_log_type_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v1 = *(_QWORD *)(v0 + 600);
  v2 = OBJC_IVAR___FSFCurareInteractionSELFStream_provider;
  *(_QWORD *)(v0 + 664) = OBJC_IVAR___FSFCurareInteractionSELFStream_provider;
  v3 = v1 + v2;
  OUTLINED_FUNCTION_4_3();
  v4 = outlined init with copy of InstrumentationStreamsProviderProtocol?(v3, v0 + 16);
  v5 = *(_QWORD *)(v0 + 40);
  OUTLINED_FUNCTION_47(v4, &demangling cache variable for type metadata for InstrumentationStreamsProviderProtocol?);
  if (v5)
  {
    v6 = OUTLINED_FUNCTION_22_1();
    if (*(_QWORD *)(v0 + 80))
    {
      OUTLINED_FUNCTION_2_5();
      v7 = swift_task_alloc();
      OUTLINED_FUNCTION_55(v7);
      OUTLINED_FUNCTION_43_0((uint64_t)CurareInteractionSELFStream.retrieve());
      return PublisherProtocol.toSequence()();
    }
    else
    {
      v12 = *(_QWORD *)(v0 + 600);
      OUTLINED_FUNCTION_47(v6, &demangling cache variable for type metadata for InstrumentationStreamsProviderProtocol?);
      v13 = (void *)(v12 + OBJC_IVAR___FSFCurareInteractionSELFStream_logger);
      Logger.logObject.getter();
      v14 = OUTLINED_FUNCTION_9_0();
      if (OUTLINED_FUNCTION_38_0(v14))
      {
        *(_WORD *)OUTLINED_FUNCTION_5() = 0;
        OUTLINED_FUNCTION_19_1(&dword_212552000, v15, v16, "Stream should have both provider and filter. Returning empty result.");
        OUTLINED_FUNCTION_1();
      }

      __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [AnyHashable : [Any]]);
      v17 = Dictionary.init(dictionaryLiteral:)();
      OUTLINED_FUNCTION_5_7();
      OUTLINED_FUNCTION_44();
      OUTLINED_FUNCTION_42();
      return OUTLINED_FUNCTION_16_1(v17, *(uint64_t (**)(void))(v0 + 8));
    }
  }
  else
  {
    v9 = *(_QWORD *)(v0 + 656);
    type metadata accessor for InstrumentationStreamsFactory();
    v10 = type metadata accessor for URL();
    __swift_storeEnumTagSinglePayload(v9, 1, 1, v10);
    *(_QWORD *)(v0 + 120) = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for <<opaque return type of static InstrumentationStreamsFactory.construct(filter:startTime:endTime:maxEvents:lastN:storageURL:)>>.0);
    *(_QWORD *)(v0 + 128) = swift_getOpaqueTypeConformance2();
    __swift_allocate_boxed_opaque_existential_0((uint64_t *)(v0 + 96));
    v11 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 672) = v11;
    *v11 = v0;
    v11[1] = CurareInteractionSELFStream.retrieve();
    return static InstrumentationStreamsFactory.construct(filter:startTime:endTime:maxEvents:lastN:storageURL:)();
  }
}

{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(*v1 + 680) = v0;
  swift_task_dealloc();
  outlined destroy of InstrumentationStreamsProviderProtocol?(*(_QWORD *)(v2 + 656), &demangling cache variable for type metadata for URL?);
  return OUTLINED_FUNCTION_17_1();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  void *v6;
  os_log_type_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v1 = *(_QWORD *)(v0 + 600) + *(_QWORD *)(v0 + 664);
  OUTLINED_FUNCTION_4_3();
  outlined assign with take of InstrumentationStreamsProviderProtocol?(v0 + 96, v1);
  swift_endAccess();
  v2 = OUTLINED_FUNCTION_22_1();
  if (*(_QWORD *)(v0 + 80))
  {
    OUTLINED_FUNCTION_2_5();
    v3 = swift_task_alloc();
    OUTLINED_FUNCTION_55(v3);
    OUTLINED_FUNCTION_43_0((uint64_t)CurareInteractionSELFStream.retrieve());
    return PublisherProtocol.toSequence()();
  }
  else
  {
    v5 = *(_QWORD *)(v0 + 600);
    OUTLINED_FUNCTION_47(v2, &demangling cache variable for type metadata for InstrumentationStreamsProviderProtocol?);
    v6 = (void *)(v5 + OBJC_IVAR___FSFCurareInteractionSELFStream_logger);
    Logger.logObject.getter();
    v7 = OUTLINED_FUNCTION_9_0();
    if (OUTLINED_FUNCTION_38_0(v7))
    {
      *(_WORD *)OUTLINED_FUNCTION_5() = 0;
      OUTLINED_FUNCTION_19_1(&dword_212552000, v8, v9, "Stream should have both provider and filter. Returning empty result.");
      OUTLINED_FUNCTION_1();
    }

    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [AnyHashable : [Any]]);
    v10 = Dictionary.init(dictionaryLiteral:)();
    OUTLINED_FUNCTION_5_7();
    OUTLINED_FUNCTION_44();
    OUTLINED_FUNCTION_42();
    return OUTLINED_FUNCTION_24_1(v10, *(uint64_t (**)(void))(v0 + 8));
  }
}

{
  uint64_t v0;
  int64_t v1;
  uint64_t v2;
  unint64_t isa;
  __int128 v4;
  uint64_t v5;
  unint64_t v6;
  id v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int64_t v21;
  unint64_t v22;
  unint64_t v23;
  int64_t v24;
  unint64_t v25;
  int64_t v26;
  unint64_t v27;
  int64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  id v38;
  NSObject *v39;
  os_log_type_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  id v65;
  os_log_type_t v66;
  uint8_t *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  __n128 v76;
  uint64_t v77;
  id v78;
  uint64_t v79;
  unint64_t v80;
  unint64_t v81;
  uint64_t v82;
  NSObject *v83;
  os_log_type_t v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  unint64_t v90;
  unint64_t v91;
  uint64_t v92;
  uint64_t v93;
  id v94;
  uint64_t v95;
  uint64_t v96;
  unint64_t v97;
  void *v98;
  uint64_t v99;
  id v100;
  uint64_t v101;
  uint64_t v102;
  id v103;
  void *v104;
  id v105;
  uint64_t v106;
  NSDictionary v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  Swift::String v111;
  Swift::String v112;
  uint64_t *v113;
  uint64_t v114;
  uint64_t v115;
  os_log_type_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  id v122;
  void *v123;
  id v124;
  uint64_t v125;
  uint64_t v126;
  id v127;
  uint64_t v128;
  id v129;
  char v130;
  id v131;
  id v132;
  void *v133;
  id v134;
  id v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  os_log_type_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  __n128 v153;
  uint64_t v154;
  id v155;
  uint64_t v156;
  unint64_t v157;
  unint64_t v158;
  uint64_t v159;
  id v160;
  uint64_t v161;
  NSObject *v162;
  os_log_type_t v163;
  uint8_t *v164;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  _QWORD *v169;
  uint64_t v170;
  __int128 v171;
  uint64_t v172;
  uint64_t *v173;
  _QWORD *v174;
  _QWORD *v175;
  uint64_t v176;
  uint64_t v177;
  _QWORD *v178;
  uint64_t v179;
  uint64_t v180;
  os_log_type_t v181;
  _QWORD *v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  id v187;
  uint8_t *v188;
  id *v189;
  uint64_t v190;
  unint64_t v191;
  uint64_t v192;
  _OWORD *v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t *v196;
  uint64_t v197;
  uint64_t v198;
  __int128 v199;
  uint64_t v200;
  void *v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  void *v205;
  uint64_t v206;
  NSObject *v207;
  int64_t v208;
  uint64_t v209;
  unint64_t v210;
  void (*v211)(uint64_t, uint64_t);
  void *v212;
  id v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217[3];

  v2 = v0;
  isa = *(_QWORD *)(v0 + 696);
  v213 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBCED8]), sel_init);
  if (isa >> 62)
    goto LABEL_119;
  v5 = *(_QWORD *)((isa & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v5)
    goto LABEL_108;
  do
  {
    v194 = v2 + 272;
    v195 = v2 + 448;
    v198 = v2 + 496;
    v176 = v2 + 576;
    v192 = v2 + 480;
    v193 = (_OWORD *)(v2 + 176);
    v177 = v2 + 512;
    v196 = (uint64_t *)(v2 + 520);
    v168 = v2 + 528;
    v182 = (_QWORD *)(v2 + 568);
    v174 = (_QWORD *)(v2 + 584);
    v175 = (_QWORD *)(v2 + 560);
    v173 = (uint64_t *)(v2 + 592);
    v186 = *(_QWORD *)(v2 + 616);
    *(_QWORD *)&v4 = 136315138;
    v199 = v4;
    *(_QWORD *)&v4 = 136315906;
    v171 = v4;
    v185 = *(_QWORD *)(v2 + 600);
    v191 = isa & 0xC000000000000001;
    v183 = *(_QWORD *)(v2 + 696) + 32;
    v184 = OBJC_IVAR___FSFCurareInteractionSELFStream_filter;
    v170 = v2 + 600;
    v167 = MEMORY[0x24BEE4AD8] + 8;
    v203 = v2;
    v189 = (id *)(v2 + 536);
    v190 = v5;
    v6 = 0;
    while (1)
    {
      specialized Array._checkSubscript(_:wasNativeTypeChecked:)(v6, v191 == 0, *(_QWORD *)(v2 + 696));
      if (v191)
        v7 = (id)MEMORY[0x212BEE3BC](v6, *(_QWORD *)(v2 + 696));
      else
        v7 = *(id *)(v183 + 8 * v6);
      v8 = __OFADD__(v6, 1);
      v9 = v6 + 1;
      if (v8)
        goto LABEL_115;
      v201 = v7;
      v10 = dispatch thunk of EventGraph.componentIdentifiers.getter();
      v11 = specialized Dictionary.init<A>(grouping:by:)(v10);
      v12 = specialized Dictionary.subscript.getter(1u, v11);
      v197 = v9;
      if (v12)
        break;
      v12 = specialized Dictionary.subscript.getter(9u, v11);
      if (v12)
        break;
      v57 = OUTLINED_FUNCTION_7_7();
      v65 = objc_retain(OUTLINED_FUNCTION_40_0(v57, v58, v59, v60, v61, v62, v63, v64, v166, v167, v168, v170, v171, *((uint64_t *)&v171 + 1), v172, (uint64_t)v173, (uint64_t)v174, (uint64_t)v175,
                v176,
                v177,
                v179,
                v180,
                (uint64_t)v182,
                v183,
                v184,
                v185,
                v186,
                (uint64_t)v187,
                (uint64_t)v189,
                v190,
                v191,
                v192,
                (uint64_t)v193,
                v194,
                v195,
                (uint64_t)v196,
                v9,
                v198,
                v199,
                *((uint64_t *)&v199 + 1),
                v200,
                v201));
      OUTLINED_FUNCTION_27_0();
      v66 = OUTLINED_FUNCTION_9_0();
      if (OUTLINED_FUNCTION_34_0(v66))
      {
        v67 = (uint8_t *)OUTLINED_FUNCTION_5();
        v68 = OUTLINED_FUNCTION_5();
        OUTLINED_FUNCTION_9_7(v68, v69, v70, v71, v72, v73, v74, v75, v166, v167, v168, v170, v171, *((uint64_t *)&v171 + 1), v172, (uint64_t)v173, (uint64_t)v174, (uint64_t)v175, v176,
          v177,
          v179,
          v180,
          (uint64_t)v182,
          v183,
          v184,
          v185,
          v186,
          (uint64_t)v187,
          (uint64_t)v189,
          v190,
          v191,
          v192,
          (uint64_t)v193,
          v194,
          v195,
          (uint64_t)v196,
          v197,
          v198,
          v76);
        v78 = OUTLINED_FUNCTION_41_0(v77, sel_dictionaryRepresentation);
        static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

        v79 = OUTLINED_FUNCTION_39_0();
        v81 = v80;
        OUTLINED_FUNCTION_6_6();
        v82 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v79, v81, &v214);
        OUTLINED_FUNCTION_37_0(v82, v169);
        OUTLINED_FUNCTION_44_0();
        swift_bridgeObjectRelease();

        v83 = 0;
        v84 = v1;
        v85 = "Event graph missed both orchId and mhID! Ignoring: %s";
        goto LABEL_102;
      }
LABEL_103:

LABEL_107:
      v6 = v197;
      if (v197 == v190)
        goto LABEL_108;
    }
    isa = v12 & 0xFFFFFFFFFFFFFF8;
    if (!(v12 >> 62))
    {
      if (*(_QWORD *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10) == 1)
        goto LABEL_12;
LABEL_99:
      OUTLINED_FUNCTION_7_7();
LABEL_100:
      v136 = swift_bridgeObjectRelease();
      v65 = objc_retain(OUTLINED_FUNCTION_40_0(v136, v137, v138, v139, v140, v141, v142, v143, v166, v167, v168, v170, v171, *((uint64_t *)&v171 + 1), v172, (uint64_t)v173, (uint64_t)v174, (uint64_t)v175,
                v176,
                v177,
                v179,
                v180,
                (uint64_t)v182,
                v183,
                v184,
                v185,
                v186,
                (uint64_t)v187,
                (uint64_t)v189,
                v190,
                v191,
                v192,
                (uint64_t)v193,
                v194,
                v195,
                (uint64_t)v196,
                v9,
                v198,
                v199,
                *((uint64_t *)&v199 + 1),
                v200,
                v201));
      OUTLINED_FUNCTION_27_0();
      v144 = OUTLINED_FUNCTION_9_0();
      if (OUTLINED_FUNCTION_34_0(v144))
      {
        v67 = (uint8_t *)OUTLINED_FUNCTION_5();
        v145 = OUTLINED_FUNCTION_5();
        OUTLINED_FUNCTION_9_7(v145, v146, v147, v148, v149, v150, v151, v152, v166, v167, v168, v170, v171, *((uint64_t *)&v171 + 1), v172, (uint64_t)v173, (uint64_t)v174, (uint64_t)v175, v176,
          v177,
          v179,
          v180,
          (uint64_t)v182,
          v183,
          v184,
          v185,
          v186,
          (uint64_t)v187,
          (uint64_t)v189,
          v190,
          v191,
          v192,
          (uint64_t)v193,
          v194,
          v195,
          (uint64_t)v196,
          v197,
          v198,
          v153);
        v155 = OUTLINED_FUNCTION_41_0(v154, sel_dictionaryRepresentation);
        static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

        v156 = OUTLINED_FUNCTION_39_0();
        v158 = v157;
        swift_bridgeObjectRelease();
        v159 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v156, v158, &v214);
        OUTLINED_FUNCTION_37_0(v159, v178);
        OUTLINED_FUNCTION_44_0();
        swift_bridgeObjectRelease();

        v83 = v12;
        v84 = v1;
        v85 = "Event graph has multiple UUIDs for component to key! Ignoring: %s";
LABEL_102:
        _os_log_impl(&dword_212552000, v83, v84, v85, v67, 0xCu);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_1();
      }
      goto LABEL_103;
    }
    OUTLINED_FUNCTION_49();
    v1 = _CocoaArrayWrapper.endIndex.getter();
    OUTLINED_FUNCTION_14_2();
    if (v1 != 1)
      goto LABEL_99;
    OUTLINED_FUNCTION_49();
    v1 = _CocoaArrayWrapper.endIndex.getter();
    OUTLINED_FUNCTION_14_2();
    if (!v1)
    {
      OUTLINED_FUNCTION_14_2();
      goto LABEL_100;
    }
LABEL_12:
    if ((v12 & 0xC000000000000001) != 0)
    {
      v13 = (id)MEMORY[0x212BEE3BC](0, v12);
    }
    else
    {
      if (!*(_QWORD *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10))
        goto LABEL_117;
      v13 = *(id *)(v12 + 32);
    }
    v14 = v13;
    v15 = *(_QWORD *)(v2 + 624);
    v16 = *(_QWORD *)(v2 + 608);
    OUTLINED_FUNCTION_14_2();
    dispatch thunk of ComponentIdentifier.uuid.getter();

    v202 = UUID.uuidString.getter();
    v204 = v17;
    v211 = *(void (**)(uint64_t, uint64_t))(v186 + 8);
    v211(v15, v16);
    v18 = v11 + 64;
    v19 = -1 << *(_BYTE *)(v11 + 32);
    if (-v19 < 64)
      v20 = ~(-1 << -(char)v19);
    else
      v20 = -1;
    isa = v20 & *(_QWORD *)(v11 + 64);
    v1 = (unint64_t)(63 - v19) >> 6;
    OUTLINED_FUNCTION_20();
    v21 = 0;
    if (isa)
    {
LABEL_19:
      v22 = __clz(__rbit64(isa));
      isa &= isa - 1;
      v23 = v22 | (v21 << 6);
      goto LABEL_34;
    }
    while (2)
    {
      v24 = v21 + 1;
      if (__OFADD__(v21, 1))
      {
        __break(1u);
LABEL_115:
        __break(1u);
        goto LABEL_116;
      }
      if (v24 >= v1)
        goto LABEL_51;
      v25 = *(_QWORD *)(v18 + 8 * v24);
      ++v21;
      if (v25)
        goto LABEL_33;
      v21 = v24 + 1;
      if (v24 + 1 >= v1)
        goto LABEL_51;
      v25 = *(_QWORD *)(v18 + 8 * v21);
      if (v25)
        goto LABEL_33;
      v21 = v24 + 2;
      if (v24 + 2 >= v1)
        goto LABEL_51;
      v25 = *(_QWORD *)(v18 + 8 * v21);
      if (v25)
        goto LABEL_33;
      v26 = v24 + 3;
      if (v26 >= v1)
      {
LABEL_51:
        swift_release();
        OUTLINED_FUNCTION_7_7();
        goto LABEL_55;
      }
      v25 = *(_QWORD *)(v18 + 8 * v26);
      if (v25)
      {
        v21 = v26;
LABEL_33:
        isa = (v25 - 1) & v25;
        v23 = __clz(__rbit64(v25)) + (v21 << 6);
LABEL_34:
        v27 = *(_QWORD *)(*(_QWORD *)(v11 + 56) + 8 * v23);
        if (v27 >> 62)
        {
          OUTLINED_FUNCTION_28_0();
          v28 = OUTLINED_FUNCTION_48();
          v29 = OUTLINED_FUNCTION_9_5();
        }
        else
        {
          v28 = *(_QWORD *)((v27 & 0xFFFFFFFFFFFFF8) + 0x10);
          v29 = swift_bridgeObjectRetain();
        }
        if (v28 < 2)
        {
          OUTLINED_FUNCTION_9_5();
          if (isa)
            goto LABEL_19;
          continue;
        }
        v37 = OUTLINED_FUNCTION_40_0(v29, v30, v31, v32, v33, v34, v35, v36, v166, v167, v168, v170, v171, *((uint64_t *)&v171 + 1), v172, (uint64_t)v173, (uint64_t)v174, (uint64_t)v175, v176,
                v177,
                v179,
                v180,
                (uint64_t)v182,
                v183,
                v184,
                v185,
                v186,
                (uint64_t)v187,
                (uint64_t)v189,
                v190,
                v191,
                v192,
                (uint64_t)v193,
                v194,
                v195,
                (uint64_t)v196,
                v197,
                v198,
                v199,
                *((uint64_t *)&v199 + 1),
                v200,
                v201);
        OUTLINED_FUNCTION_20();
        swift_bridgeObjectRetain();
        v38 = v37;
        v39 = OUTLINED_FUNCTION_27_0();
        v40 = static os_log_type_t.info.getter();
        if (os_log_type_enabled(v39, v40))
        {
          v181 = v40;
          v205 = v38;
          v207 = v39;
          v209 = v11;
          v41 = OUTLINED_FUNCTION_5();
          v217[0] = OUTLINED_FUNCTION_5();
          *(_DWORD *)v41 = v171;
          v42 = SISchemaComponentName.description.getter();
          v44 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v42, v43, v217);
          OUTLINED_FUNCTION_37_0(v44, v175);
          UnsafeMutableRawBufferPointer.copyMemory(from:)();
          OUTLINED_FUNCTION_25_1();
          v188 = (uint8_t *)v41;
          *(_WORD *)(v41 + 12) = 2080;
          v214 = MEMORY[0x24BEE4AF8];
          specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v28, 0);
          v45 = 0;
          while (1)
          {
            if ((v27 & 0xC000000000000001) != 0)
              v46 = (id)MEMORY[0x212BEE3BC](v45, v27);
            else
              v46 = OUTLINED_FUNCTION_26(v27 + 8 * v45);
            v47 = v46;
            v48 = *(_QWORD *)(v2 + 624);
            v49 = *(_QWORD *)(v2 + 608);
            dispatch thunk of ComponentIdentifier.uuid.getter();
            v50 = UUID.uuidString.getter();
            v52 = v51;
            v211(v48, v49);

            v53 = v214;
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            {
              OUTLINED_FUNCTION_36_0(0, *(_QWORD *)(v53 + 16) + 1);
              v53 = v214;
            }
            v55 = *(_QWORD *)(v53 + 16);
            v54 = *(_QWORD *)(v53 + 24);
            if (v55 >= v54 >> 1)
            {
              OUTLINED_FUNCTION_36_0((char *)(v54 > 1), v55 + 1);
              v53 = v214;
            }
            ++v45;
            *(_QWORD *)(v53 + 16) = v55 + 1;
            v56 = v53 + 16 * v55;
            *(_QWORD *)(v56 + 32) = v50;
            *(_QWORD *)(v56 + 40) = v52;
            v2 = v203;
            if (v28 == v45)
            {
              v86 = MEMORY[0x212BEE0E0](v53, MEMORY[0x24BEE0D00]);
              OUTLINED_FUNCTION_14_2();
              v88 = OUTLINED_FUNCTION_51(v86, v87, v217);
              OUTLINED_FUNCTION_37_0(v88, v182);
              UnsafeMutableRawBufferPointer.copyMemory(from:)();
              swift_bridgeObjectRelease();
              OUTLINED_FUNCTION_13_5();
              *(_WORD *)(v41 + 22) = 2080;
              _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lFSDySo21SISchemaComponentNameVSay19SiriInstrumentation0E10IdentifierCGG_SSs5NeverOTg506_sSo21def6VSay19g19Instrumentation0B10i30CGSSIgygo_AB3key_AF5valuetSSs5j138OIegnrzr_TR0109_s12FeatureStore27CurareInteractionSELFStreamC8retrieveSDys11AnyHashableVSDyAFSayypGGGyYaKFSaySSGycfu4_SSSo21abc7V_Say19d19N24J10F9CGtXEfU1_Tf3nnnpf_nTf1cn_n(v209);
              v89 = MEMORY[0x212BEE0E0]();
              v91 = v90;
              OUTLINED_FUNCTION_18_1();
              v92 = getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(v89, v91, v217);
              OUTLINED_FUNCTION_37_0(v92, v174);
              UnsafeMutableRawBufferPointer.copyMemory(from:)();
              OUTLINED_FUNCTION_25_1();
              v93 = OUTLINED_FUNCTION_13_5();
              *((_WORD *)v188 + 16) = 2080;
              v94 = OUTLINED_FUNCTION_41_0(v93, sel_dictionaryRepresentation);
              static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

              v95 = Dictionary.description.getter();
              OUTLINED_FUNCTION_25_1();
              *v173 = OUTLINED_FUNCTION_51(v95, v96, v217);
              UnsafeMutableRawBufferPointer.copyMemory(from:)();
              swift_bridgeObjectRelease();

              _os_log_impl(&dword_212552000, v207, v181, "Event graph has multiple UUIDs for some components. Could this be a product error?\nComponent: %s Identifiers: %s\nComponentIdentifiers: %s\nEventGraph: %s", v188, 0x2Au);
              swift_arrayDestroy();
              OUTLINED_FUNCTION_1();
            }
          }
        }
        OUTLINED_FUNCTION_13_5();
        OUTLINED_FUNCTION_13_5();
        swift_release();

LABEL_55:
        v97 = dispatch thunk of EventGraph.events()();
        v98 = *(void **)(v185 + v184);
        isa = swift_allocObject();
        *(_QWORD *)(isa + 16) = v98;
        v99 = swift_task_alloc();
        *(_QWORD *)(v99 + 16) = partial apply for implicit closure #9 in implicit closure #8 in CurareInteractionSELFStream.retrieve();
        *(_QWORD *)(v99 + 24) = isa;
        v100 = v98;
        v1 = specialized _ArrayProtocol.filter(_:)(v97, partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed FilterableEvent) -> (@unowned Bool), v99);
        swift_release();
        OUTLINED_FUNCTION_44();
        if (!((unint64_t)v1 >> 62))
        {
          v101 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
          if (v101)
            goto LABEL_57;
          goto LABEL_106;
        }
        OUTLINED_FUNCTION_54();
        v101 = OUTLINED_FUNCTION_48();
        OUTLINED_FUNCTION_25_1();
        if (!v101)
        {
LABEL_106:
          OUTLINED_FUNCTION_30_0();
          OUTLINED_FUNCTION_25_1();

          goto LABEL_107;
        }
LABEL_57:
        v212 = (void *)objc_opt_self();
        if (v101 < 1)
          goto LABEL_118;
        v102 = 0;
        v208 = v1;
        v210 = v1 & 0xC000000000000001;
        v206 = v101;
        while (2)
        {
          if (v210)
            v103 = (id)MEMORY[0x212BEE3BC](v102, v1);
          else
            v103 = OUTLINED_FUNCTION_26(v1 + 8 * v102);
          v104 = v103;
          v105 = objc_msgSend(v103, sel_dictionaryRepresentation);
          v106 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

          v107.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
          isa = (unint64_t)objc_msgSend(v212, sel_isValidJSONObject_, v107.super.isa);

          if ((_DWORD)isa)
          {
            v108 = OrderedEvent.innerType.getter();
            if (v108)
            {
              v109 = v108;
              *(_QWORD *)(v2 + 544) = OrderedEvent.outerType.getter();
              __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SISchemaTopLevelUnionType.Type);
              v214 = OUTLINED_FUNCTION_20_2();
              v215 = v110;
              v111._countAndFlagsBits = 46;
              v111._object = (void *)0xE100000000000000;
              String.append(_:)(v111);
              *(_QWORD *)(v2 + 552) = v109;
              __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SISchemaInstrumentationMessage.Type);
              v112._countAndFlagsBits = OUTLINED_FUNCTION_20_2();
              v113 = &v214;
              String.append(_:)(v112);
              swift_bridgeObjectRelease();
              v114 = v214;
              v115 = v215;
            }
            else
            {
              v113 = v196;
              *v196 = OrderedEvent.outerType.getter();
              __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for SISchemaTopLevelUnionType.Type);
              v114 = OUTLINED_FUNCTION_20_2();
              v115 = v120;
            }
            *(_QWORD *)(v2 + 416) = v114;
            *(_QWORD *)(v2 + 424) = v115;
            OUTLINED_FUNCTION_28_0();
            v121 = OUTLINED_FUNCTION_23_1();
            v122 = OUTLINED_FUNCTION_52(v121, sel___swift_objectForKeyedSubscript_);
            OUTLINED_FUNCTION_53();
            if (v113)
            {
              OUTLINED_FUNCTION_50();
              OUTLINED_FUNCTION_45();
            }
            else
            {
              *(_OWORD *)(v2 + 304) = 0u;
              *(_OWORD *)(v2 + 320) = 0u;
            }
            v123 = (void *)(v2 + 336);
            OUTLINED_FUNCTION_59();
            if (*(_QWORD *)(v2 + 360))
            {
              type metadata accessor for NSMutableArray(0, &lazy cache variable for type metadata for NSMutableDictionary);
              if ((OUTLINED_FUNCTION_42_0() & 1) == 0)
              {
                OUTLINED_FUNCTION_6_6();
                goto LABEL_84;
              }
              v123 = *(void **)(v2 + 504);
              OUTLINED_FUNCTION_6_6();
              *(_QWORD *)(v2 + 448) = v202;
              *(_QWORD *)(v2 + 456) = v204;
              OUTLINED_FUNCTION_28_0();
              v124 = objc_msgSend(v123, sel___swift_objectForKeyedSubscript_, OUTLINED_FUNCTION_23_1());
              swift_unknownObjectRelease();
              if (v124)
              {
                _bridgeAnyObjectToAny(_:)();
                swift_unknownObjectRelease();
                v125 = (uint64_t)v193;
              }
              else
              {
                v125 = (uint64_t)v193;
                *v193 = 0u;
                v193[1] = 0u;
              }
              outlined init with take of Any?(v125, v194);
              if (*(_QWORD *)(v2 + 296))
              {
                type metadata accessor for NSMutableArray(0, &lazy cache variable for type metadata for NSMutableArray);
                if ((swift_dynamicCast() & 1) != 0)
                {
                  OUTLINED_FUNCTION_7_7();
                  OUTLINED_FUNCTION_6_6();
                  v187 = *v189;
                  OUTLINED_FUNCTION_30_0();
                  v127 = objc_msgSend(v104, sel_dictionaryRepresentation);
                  static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

                  isa = (unint64_t)Dictionary._bridgeToObjectiveC()().super.isa;
                  OUTLINED_FUNCTION_7_7();
                  objc_msgSend(v187, sel_addObject_, isa);

                  goto LABEL_93;
                }

                OUTLINED_FUNCTION_30_0();
LABEL_84:
                *(_QWORD *)(v2 + 432) = v114;
                *(_QWORD *)(v2 + 440) = v115;
                OUTLINED_FUNCTION_28_0();
                v128 = OUTLINED_FUNCTION_23_1();
                v129 = OUTLINED_FUNCTION_52(v128, sel___swift_objectForKeyedSubscript_);
                OUTLINED_FUNCTION_53();
                if (v123)
                {
                  OUTLINED_FUNCTION_50();
                  OUTLINED_FUNCTION_45();
                }
                else
                {
                  *(_OWORD *)(v2 + 208) = 0u;
                  *(_OWORD *)(v2 + 224) = 0u;
                }
                OUTLINED_FUNCTION_59();
                if (*(_QWORD *)(v2 + 264))
                {
                  type metadata accessor for NSMutableArray(0, &lazy cache variable for type metadata for NSMutableDictionary);
                  v130 = OUTLINED_FUNCTION_42_0();
                  OUTLINED_FUNCTION_6_6();
                  if ((v130 & 1) != 0)
                  {
                    isa = *(_QWORD *)(v2 + 496);
                    OUTLINED_FUNCTION_6_6();
                    type metadata accessor for NSMutableArray(0, &lazy cache variable for type metadata for NSMutableArray);
                    v216 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [AnyHashable : Any]);
                    v214 = v106;
                    OUTLINED_FUNCTION_54();
                    v131 = @nonobjc NSMutableArray.__allocating_init(object:)(&v214);
                    *(_QWORD *)(v2 + 480) = v202;
                    *(_QWORD *)(v2 + 488) = v204;
                    OUTLINED_FUNCTION_54();
                    objc_msgSend((id)isa, sel___swift_setObject_forKeyedSubscript_, v131, OUTLINED_FUNCTION_23_1());

                    swift_unknownObjectRelease();
                    goto LABEL_92;
                  }
                }
                else
                {
                  OUTLINED_FUNCTION_6_6();
                  outlined destroy of InstrumentationStreamsProviderProtocol?(v2 + 240, &demangling cache variable for type metadata for Any?);
                }
                type metadata accessor for NSMutableArray(0, &lazy cache variable for type metadata for NSMutableArray);
                v216 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [AnyHashable : Any]);
                v214 = v106;
                v132 = @nonobjc NSMutableArray.__allocating_init(object:)(&v214);
                isa = MEMORY[0x212BEE02C](v202, v204);
                v133 = (void *)objc_opt_self();
                v134 = v132;
                v135 = objc_msgSend(v133, sel_dictionaryWithObject_forKey_, v134, isa);

                *(_QWORD *)(v2 + 464) = v114;
                *(_QWORD *)(v2 + 472) = v115;
                swift_bridgeObjectRetain();
                objc_msgSend(v213, sel___swift_setObject_forKeyedSubscript_, v135, OUTLINED_FUNCTION_23_1());

                OUTLINED_FUNCTION_45();
LABEL_92:
                swift_bridgeObjectRelease();
LABEL_93:
                v1 = v208;
                if (v206 == ++v102)
                  goto LABEL_106;
                continue;
              }

              OUTLINED_FUNCTION_30_0();
              v126 = v194;
            }
            else
            {
              OUTLINED_FUNCTION_6_6();
              v126 = v2 + 336;
            }
            outlined destroy of InstrumentationStreamsProviderProtocol?(v126, &demangling cache variable for type metadata for Any?);
            goto LABEL_84;
          }
          break;
        }
        OUTLINED_FUNCTION_20();
        OUTLINED_FUNCTION_27_0();
        v116 = OUTLINED_FUNCTION_9_0();
        if (os_log_type_enabled((os_log_t)v107.super.isa, v116))
        {
          v117 = OUTLINED_FUNCTION_5();
          v214 = OUTLINED_FUNCTION_5();
          *(_DWORD *)v117 = v199;
          OUTLINED_FUNCTION_20();
          v118 = Dictionary.description.getter();
          OUTLINED_FUNCTION_7_7();
          *(_QWORD *)(v117 + 4) = OUTLINED_FUNCTION_51(v118, v119, &v214);
          swift_bridgeObjectRelease();
          OUTLINED_FUNCTION_13_5();
          _os_log_impl(&dword_212552000, (os_log_t)v107.super.isa, v116, "Event is not a valid JSON Object! Ignoring: %s", (uint8_t *)v117, 0xCu);
          swift_arrayDestroy();
          OUTLINED_FUNCTION_1();
        }

        OUTLINED_FUNCTION_13_5();
        goto LABEL_93;
      }
      break;
    }
    while (1)
    {
      v21 = v26 + 1;
      if (__OFADD__(v26, 1))
        break;
      if (v21 >= v1)
        goto LABEL_51;
      v25 = *(_QWORD *)(v18 + 8 * v21);
      ++v26;
      if (v25)
        goto LABEL_33;
    }
LABEL_116:
    __break(1u);
LABEL_117:
    __break(1u);
LABEL_118:
    __break(1u);
LABEL_119:
    OUTLINED_FUNCTION_49();
    v5 = _CocoaArrayWrapper.endIndex.getter();
    OUTLINED_FUNCTION_14_2();
  }
  while (v5);
LABEL_108:
  swift_bridgeObjectRelease();
  v214 = 0;
  v160 = v213;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [AnyHashable : [Any]]);
  static Dictionary._conditionallyBridgeFromObjectiveC(_:result:)();

  v161 = v214;
  if (v214)
  {

  }
  else
  {
    v162 = (*(_QWORD *)(v2 + 600) + OBJC_IVAR___FSFCurareInteractionSELFStream_logger);
    Logger.logObject.getter();
    v163 = OUTLINED_FUNCTION_9_0();
    if (os_log_type_enabled(v162, v163))
    {
      v164 = (uint8_t *)OUTLINED_FUNCTION_5();
      *(_WORD *)v164 = 0;
      OUTLINED_FUNCTION_1();
    }

    v161 = MEMORY[0x24BEE4B00];
  }
  __swift_destroy_boxed_opaque_existential_0(v2 + 136);
  swift_task_dealloc();
  swift_task_dealloc();
  OUTLINED_FUNCTION_44();
  return OUTLINED_FUNCTION_16_1(v161, *(uint64_t (**)(void))(v2 + 8));
}

{
  uint64_t v0;

  __swift_deallocate_boxed_opaque_existential_1(v0 + 96);
  OUTLINED_FUNCTION_5_7();
  OUTLINED_FUNCTION_44();
  OUTLINED_FUNCTION_42();
  return OUTLINED_FUNCTION_10_5(*(uint64_t (**)(void))(v0 + 8));
}

{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_0(v0 + 136);
  OUTLINED_FUNCTION_5_7();
  OUTLINED_FUNCTION_44();
  OUTLINED_FUNCTION_42();
  return OUTLINED_FUNCTION_10_5(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t CurareInteractionSELFStream.retrieve()(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;

  v3 = (_QWORD *)*v2;
  v3[87] = a1;
  v3[88] = v1;
  swift_task_dealloc();
  (*(void (**)(_QWORD, _QWORD))(v3[80] + 8))(v3[81], v3[79]);
  return OUTLINED_FUNCTION_17_1();
}

uint64_t specialized Dictionary.init<A>(grouping:by:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  id v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  Swift::UInt32 v16;
  char v17;
  unint64_t v18;
  uint64_t v19;
  _BOOL8 v20;
  uint64_t v21;
  char v22;
  unint64_t v23;
  char v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t result;
  int64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  _QWORD *v39;

  v1 = a1;
  v39 = (_QWORD *)MEMORY[0x24BEE4B00];
  if ((a1 & 0xC000000000000001) != 0)
  {
    __CocoaSet.makeIterator()();
    type metadata accessor for ComponentIdentifier();
    lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags(&lazy protocol witness table cache variable for type ComponentIdentifier and conformance NSObject, (uint64_t (*)(uint64_t))MEMORY[0x24BE94860], MEMORY[0x24BEE5BD8]);
    Set.Iterator.init(_cocoa:)();
    v1 = v34;
    v32 = v35;
    v2 = v36;
    v3 = v37;
    v4 = v38;
  }
  else
  {
    v3 = 0;
    v5 = -1 << *(_BYTE *)(a1 + 32);
    v32 = a1 + 56;
    v2 = ~v5;
    v6 = -v5;
    if (v6 < 64)
      v7 = ~(-1 << v6);
    else
      v7 = -1;
    v4 = v7 & *(_QWORD *)(a1 + 56);
  }
  v31 = (unint64_t)(v2 + 64) >> 6;
  v8 = (_QWORD *)MEMORY[0x24BEE4B00];
  if (v1 < 0)
    goto LABEL_10;
LABEL_8:
  if (v4)
  {
    v9 = (v4 - 1) & v4;
    v10 = __clz(__rbit64(v4)) | (v3 << 6);
    v11 = v3;
    goto LABEL_29;
  }
  v13 = v3 + 1;
  if (!__OFADD__(v3, 1))
  {
    if (v13 >= v31)
      goto LABEL_42;
    v14 = *(_QWORD *)(v32 + 8 * v13);
    v11 = v3 + 1;
    if (!v14)
    {
      v11 = v3 + 2;
      if (v3 + 2 >= v31)
        goto LABEL_42;
      v14 = *(_QWORD *)(v32 + 8 * v11);
      if (!v14)
      {
        v11 = v3 + 3;
        if (v3 + 3 >= v31)
          goto LABEL_42;
        v14 = *(_QWORD *)(v32 + 8 * v11);
        if (!v14)
        {
          v11 = v3 + 4;
          if (v3 + 4 >= v31)
            goto LABEL_42;
          v14 = *(_QWORD *)(v32 + 8 * v11);
          if (!v14)
          {
            v11 = v3 + 5;
            if (v3 + 5 >= v31)
              goto LABEL_42;
            v14 = *(_QWORD *)(v32 + 8 * v11);
            if (!v14)
            {
              v15 = v3 + 6;
              while (v15 < v31)
              {
                v14 = *(_QWORD *)(v32 + 8 * v15++);
                if (v14)
                {
                  v11 = v15 - 1;
                  goto LABEL_28;
                }
              }
              goto LABEL_42;
            }
          }
        }
      }
    }
LABEL_28:
    v9 = (v14 - 1) & v14;
    v10 = __clz(__rbit64(v14)) + (v11 << 6);
LABEL_29:
    v12 = *(id *)(*(_QWORD *)(v1 + 48) + 8 * v10);
    if (v12)
    {
      while (1)
      {
        v16 = ComponentIdentifier.componentName.getter();
        v18 = specialized __RawDictionaryStorage.find<A>(_:)(v16);
        v19 = v8[2];
        v20 = (v17 & 1) == 0;
        v21 = v19 + v20;
        if (__OFADD__(v19, v20))
          break;
        v22 = v17;
        if (v8[3] < v21)
        {
          specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(v21, 1);
          v8 = v39;
          v23 = specialized __RawDictionaryStorage.find<A>(_:)(v16);
          if ((v22 & 1) != (v24 & 1))
            goto LABEL_46;
          v18 = v23;
        }
        if ((v22 & 1) != 0)
        {
          v8 = v39;
          v25 = (_QWORD *)(v39[7] + 8 * v18);
          MEMORY[0x212BEE0BC]();
          if (*(_QWORD *)((*v25 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*v25 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
            specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
          specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
          specialized Array._endMutation()();
        }
        else
        {
          __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Swift.AnyObject>);
          v26 = swift_allocObject();
          *(_OWORD *)(v26 + 16) = xmmword_212575860;
          *(_QWORD *)(v26 + 32) = v12;
          v33 = (void *)v26;
          specialized Array._endMutation()();
          v8[(v18 >> 6) + 8] |= 1 << v18;
          *(_DWORD *)(v8[6] + 4 * v18) = v16;
          *(_QWORD *)(v8[7] + 8 * v18) = v33;
          v27 = v8[2];
          v28 = __OFADD__(v27, 1);
          v29 = v27 + 1;
          if (v28)
            goto LABEL_44;
          v8[2] = v29;
        }
        v3 = v11;
        v4 = v9;
        if ((v1 & 0x8000000000000000) == 0)
          goto LABEL_8;
LABEL_10:
        if (__CocoaSet.Iterator.next()())
        {
          type metadata accessor for ComponentIdentifier();
          swift_unknownObjectRetain();
          swift_dynamicCast();
          v12 = v33;
          swift_unknownObjectRelease();
          v11 = v3;
          v9 = v4;
          if (v33)
            continue;
        }
        goto LABEL_42;
      }
      __break(1u);
LABEL_44:
      __break(1u);
      goto LABEL_45;
    }
LABEL_42:
    outlined consume of Set<ComponentIdentifier>.Iterator._Variant();
    return (uint64_t)v39;
  }
LABEL_45:
  __break(1u);
LABEL_46:
  type metadata accessor for SISchemaComponentName();
  result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

uint64_t specialized Dictionary.subscript.getter(Swift::UInt32 a1, uint64_t a2)
{
  char v2;

  if (*(_QWORD *)(a2 + 16) && (specialized __RawDictionaryStorage.find<A>(_:)(a1), (v2 & 1) != 0))
    return swift_bridgeObjectRetain();
  else
    return 0;
}

char *closure #3 in implicit closure #6 in CurareInteractionSELFStream.retrieve()(uint64_t a1, unint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  Swift::String v7;
  uint64_t v8;
  uint64_t v9;
  char *result;
  uint64_t v11;
  unint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  Swift::String v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v3 = OUTLINED_FUNCTION_56();
  v23 = *(_QWORD *)(v3 - 8);
  v24 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = SISchemaComponentName.description.getter();
  v27 = v6;
  v7._countAndFlagsBits = 2112032;
  v7._object = (void *)0xE300000000000000;
  String.append(_:)(v7);
  if (a2 >> 62)
  {
    swift_bridgeObjectRetain();
    v8 = OUTLINED_FUNCTION_48();
    OUTLINED_FUNCTION_18_1();
  }
  else
  {
    v8 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v9 = MEMORY[0x24BEE4AF8];
  if (!v8)
  {
LABEL_14:
    v21._countAndFlagsBits = MEMORY[0x212BEE0E0](v9, MEMORY[0x24BEE0D00]);
    String.append(_:)(v21);
    OUTLINED_FUNCTION_7_7();
    OUTLINED_FUNCTION_18_1();
    return (char *)v26;
  }
  v25 = MEMORY[0x24BEE4AF8];
  result = specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v8 & ~(v8 >> 63), 0);
  if ((v8 & 0x8000000000000000) == 0)
  {
    v11 = 0;
    v22 = a2 & 0xC000000000000001;
    v12 = a2;
    do
    {
      if (v22)
        v13 = (id)MEMORY[0x212BEE3BC](v11, a2);
      else
        v13 = OUTLINED_FUNCTION_26(a2 + 8 * v11);
      v14 = v13;
      dispatch thunk of ComponentIdentifier.uuid.getter();
      v15 = UUID.uuidString.getter();
      v17 = v16;
      (*(void (**)(char *, uint64_t))(v23 + 8))(v5, v24);

      v9 = v25;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        OUTLINED_FUNCTION_36_0(0, *(_QWORD *)(v9 + 16) + 1);
        v9 = v25;
      }
      v19 = *(_QWORD *)(v9 + 16);
      v18 = *(_QWORD *)(v9 + 24);
      if (v19 >= v18 >> 1)
      {
        OUTLINED_FUNCTION_36_0((char *)(v18 > 1), v19 + 1);
        v9 = v25;
      }
      ++v11;
      *(_QWORD *)(v9 + 16) = v19 + 1;
      v20 = v9 + 16 * v19;
      *(_QWORD *)(v20 + 32) = v15;
      *(_QWORD *)(v20 + 40) = v17;
      a2 = v12;
    }
    while (v8 != v11);
    goto LABEL_14;
  }
  __break(1u);
  return result;
}

uint64_t thunk for @escaping @callee_guaranteed (@in_guaranteed FilterableEvent) -> (@unowned Bool)(void *a1, uint64_t (*a2)(_QWORD *))
{
  id v4;
  char v5;
  _QWORD v7[5];

  v7[3] = type metadata accessor for OrderedEvent();
  v7[4] = MEMORY[0x24BDFCAC0];
  v7[0] = a1;
  v4 = a1;
  v5 = a2(v7);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v7);
  return v5 & 1;
}

uint64_t specialized _ArrayProtocol.filter(_:)(unint64_t a1, uint64_t (*a2)(id), uint64_t a3)
{
  uint64_t v3;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  id v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  char v13;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;

  v6 = a1;
  v18 = MEMORY[0x24BEE4AF8];
  if (a1 >> 62)
    goto LABEL_18;
  v7 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v7)
  {
    while (1)
    {
      v8 = 0;
      v16 = v6 & 0xFFFFFFFFFFFFFF8;
      v17 = v6 & 0xC000000000000001;
      v15 = v6;
      while (v17)
      {
        v9 = (id)MEMORY[0x212BEE3BC](v8, v6);
LABEL_7:
        v10 = v9;
        v11 = v8 + 1;
        if (__OFADD__(v8, 1))
          goto LABEL_17;
        v12 = a3;
        v13 = a2(v9);
        if (v3)
        {
          swift_bridgeObjectRelease();

          swift_release();
          return v12;
        }
        if ((v13 & 1) != 0)
        {
          specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
          specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
          v6 = v15;
          specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
          specialized ContiguousArray._endMutation()();
        }
        else
        {

        }
        ++v8;
        if (v11 == v7)
        {
          v12 = v18;
          goto LABEL_20;
        }
      }
      if (v8 < *(_QWORD *)(v16 + 16))
        break;
      __break(1u);
LABEL_17:
      __break(1u);
LABEL_18:
      v7 = _CocoaArrayWrapper.endIndex.getter();
      if (!v7)
        goto LABEL_19;
    }
    v9 = *(id *)(v6 + 8 * v8 + 32);
    goto LABEL_7;
  }
LABEL_19:
  v12 = MEMORY[0x24BEE4AF8];
LABEL_20:
  swift_bridgeObjectRelease();
  return v12;
}

id @nonobjc NSMutableArray.__allocating_init(object:)(_QWORD *a1)
{
  uint64_t v2;
  id v3;

  __swift_project_boxed_opaque_existential_1Tm(a1, a1[3]);
  v2 = _bridgeAnythingToObjectiveC<A>(_:)();
  v3 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_arrayWithObject_, v2);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  return v3;
}

uint64_t @objc closure #1 in CurareInteractionSELFStream.retrieve()(const void *a1, void *a2)
{
  _QWORD *v2;
  _QWORD *v4;

  v2[2] = a2;
  v2[3] = _Block_copy(a1);
  a2;
  v4 = (_QWORD *)swift_task_alloc();
  v2[4] = v4;
  *v4 = v2;
  v4[1] = @objc closure #1 in CurareInteractionSELFStream.retrieve();
  return CurareInteractionSELFStream.retrieve()();
}

uint64_t @objc closure #1 in CurareInteractionSELFStream.retrieve()(objc_class *a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  Class isa;
  Class v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);

  v3 = v1;
  v5 = *v2;
  v6 = *(void **)(*v2 + 16);
  v7 = *v2;
  swift_task_dealloc();

  if (v3)
  {
    _convertErrorToNSError(_:)();

    isa = 0;
    v9 = a1;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [AnyHashable : [Any]]);
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    OUTLINED_FUNCTION_14_2();
    a1 = 0;
    v9 = isa;
  }
  v10 = *(void (***)(_QWORD, _QWORD, _QWORD))(v5 + 24);
  ((void (**)(_QWORD, Class, objc_class *))v10)[2](v10, isa, a1);

  _Block_release(v10);
  return (*(uint64_t (**)(void))(v7 + 8))();
}

uint64_t _runTaskForBridgedAsyncMethod(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v11;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for TaskPriority();
  __swift_storeEnumTagSinglePayload((uint64_t)v6, 1, 1, v7);
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = 0;
  v8[3] = 0;
  v8[4] = a1;
  v8[5] = a2;
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = 0;
  v9[3] = 0;
  v9[4] = &_MergedGlobals;
  v9[5] = v8;
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgmq5((uint64_t)v6, (uint64_t)&unk_254B51660, (uint64_t)v9);
  return swift_release();
}

id CurareInteractionSELFStream.__allocating_init()()
{
  return objc_msgSend(OUTLINED_FUNCTION_46(), sel_init);
}

void CurareInteractionSELFStream.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id CurareInteractionSELFStream.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)ObjC metadata update function for CurareInteractionSELFStream();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance SISchemaComponentName()
{
  Swift::UInt32 *v0;

  return specialized RawRepresentable<>.hashValue.getter(*v0);
}

Swift::Int specialized RawRepresentable<>.hashValue.getter(Swift::UInt32 a1)
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(a1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance SISchemaComponentName(int a1)
{
  Swift::UInt32 *v1;

  specialized RawRepresentable<>.hash(into:)(a1, *v1);
}

void specialized RawRepresentable<>.hash(into:)(int a1, Swift::UInt32 a2)
{
  Hasher._combine(_:)(a2);
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance SISchemaComponentName(uint64_t a1)
{
  Swift::UInt32 *v1;

  return specialized RawRepresentable<>._rawHashValue(seed:)(a1, *v1);
}

Swift::Int specialized RawRepresentable<>._rawHashValue(seed:)(uint64_t a1, Swift::UInt32 a2)
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(a2);
  return Hasher._finalize()();
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance SISchemaComponentName(int *a1, int *a2)
{
  return specialized == infix<A>(_:_:)(*a1, *a2);
}

BOOL specialized == infix<A>(_:_:)(int a1, int a2)
{
  return a1 == a2;
}

uint64_t protocol witness for RawRepresentable.init(rawValue:) in conformance SISchemaComponentName@<X0>(unsigned int *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;

  result = SISchemaComponentName.init(rawValue:)(*a1);
  *(_DWORD *)a2 = result;
  *(_BYTE *)(a2 + 4) = BYTE4(result) & 1;
  return result;
}

uint64_t SISchemaComponentName.init(rawValue:)(uint64_t result)
{
  return result;
}

uint64_t protocol witness for RawRepresentable.rawValue.getter in conformance SISchemaComponentName@<X0>(_DWORD *a1@<X8>)
{
  unsigned int *v1;
  uint64_t result;

  result = destructiveProjectEnumData for FeatureStoreError(*v1);
  *a1 = result;
  return result;
}

uint64_t _sIeghH_IeAgH_TR(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v4;
  *v4 = v3;
  v4[1] = _sIeghH_IeAgH_TRTQ0_;
  return v6();
}

uint64_t _sIeAgH_ytIeAgHr_TR(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(void);

  v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v5;
  *v5 = v4;
  v5[1] = _sIeghH_IeAgH_TRTQ0_;
  return v7();
}

uint64_t _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgmq5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = type metadata accessor for TaskPriority();
  if (__swift_getEnumTagSinglePayload(a1, 1, v6) == 1)
  {
    outlined destroy of InstrumentationStreamsProviderProtocol?(a1, &demangling cache variable for type metadata for TaskPriority?);
  }
  else
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(a1, v6);
  }
  if (*(_QWORD *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    dispatch thunk of Actor.unownedExecutor.getter();
    swift_unknownObjectRelease();
  }
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a2;
  *(_QWORD *)(v7 + 24) = a3;
  return swift_task_create();
}

uint64_t _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tgq5(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tgq5TQ0_;
  return v6(a1);
}

uint64_t _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tgq5TQ0_()
{
  uint64_t v0;

  OUTLINED_FUNCTION_0_9();
  return OUTLINED_FUNCTION_3_6(*(uint64_t (**)(void))(v0 + 8));
}

char *specialized UnsafeMutablePointer.moveInitialize(from:count:)(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else if (__dst != __src || &__src[8 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 8 * a2);
  }
  return __src;
}

{
  if (a2 < 0)
  {
    __src = (char *)_fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else if (__dst != __src || &__src[16 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 16 * a2);
  }
  return __src;
}

uint64_t specialized UnsafeMutablePointer.initialize(from:count:)(unint64_t a1, uint64_t a2, unint64_t a3)
{
  BOOL v3;
  uint64_t result;

  if (a2 < 0 || (a3 + 8 * a2 > a1 ? (v3 = a1 + 8 * a2 > a3) : (v3 = 0), v3))
  {
    result = _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [AnyHashable : Any]);
    return swift_arrayInitWithCopy();
  }
  return result;
}

{
  uint64_t result;

  if ((a2 & 0x8000000000000000) == 0 && (a3 + 16 * a2 <= a1 || a1 + 16 * a2 <= a3))
    return swift_arrayInitWithCopy();
  result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

double specialized Dictionary._Variant.removeValue(forKey:)@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t *v2;
  uint64_t *v3;
  unint64_t v6;
  char v7;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v9;
  Swift::Int v10;
  double result;
  uint64_t v12;

  v3 = v2;
  swift_bridgeObjectRetain();
  v6 = specialized __RawDictionaryStorage.find<A>(_:)(a1);
  LOBYTE(a1) = v7;
  swift_bridgeObjectRelease();
  if ((a1 & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v12 = *v3;
    v9 = *v3;
    *v3 = 0x8000000000000000;
    v10 = *(_QWORD *)(v9 + 24);
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _NativeDictionary<AnyHashable, Any>);
    _NativeDictionary.ensureUnique(isUnique:capacity:)(isUniquelyReferenced_nonNull_native, v10);
    outlined destroy of AnyHashable(*(_QWORD *)(v12 + 48) + 40 * v6);
    outlined init with take of Any((_OWORD *)(*(_QWORD *)(v12 + 56) + 32 * v6), a2);
    _NativeDictionary._delete(at:)();
    *v3 = v12;
    swift_bridgeObjectRelease();
  }
  else
  {
    result = 0.0;
    *a2 = 0u;
    a2[1] = 0u;
  }
  return result;
}

uint64_t specialized Dictionary._Variant.setValue(_:forKey:)(_OWORD *a1, uint64_t a2)
{
  uint64_t *v2;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v7;

  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v7 = *v2;
  *v2 = 0x8000000000000000;
  specialized _NativeDictionary.setValue(_:forKey:isUnique:)(a1, a2, isUniquelyReferenced_nonNull_native);
  *v2 = v7;
  return swift_bridgeObjectRelease();
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  Swift::Int v4;

  v2 = v1;
  v4 = AnyHashable._rawHashValue(seed:)(*(_QWORD *)(v2 + 40));
  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, v4);
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:)(Swift::UInt32 a1)
{
  Swift::Int v2;

  Hasher.init(_seed:)();
  Hasher._combine(_:)(a1);
  v2 = Hasher._finalize()();
  return specialized __RawDictionaryStorage.find<A>(_:hashValue:)(a1, v2);
}

uint64_t specialized _NativeDictionary._copyOrMoveAndResize(capacity:moveElements:)(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t i;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  Swift::UInt32 v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  int64_t v30;
  _QWORD *v31;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _DictionaryStorage<SISchemaComponentName, [ComponentIdentifier]>);
  result = static _DictionaryStorage.resize(original:capacity:move:)();
  v7 = result;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 0;
    v9 = *(_QWORD *)(v5 + 64);
    v31 = (_QWORD *)(v5 + 64);
    v10 = 1 << *(_BYTE *)(v5 + 32);
    if (v10 < 64)
      v11 = ~(-1 << v10);
    else
      v11 = -1;
    v12 = v11 & v9;
    v30 = (unint64_t)(v10 + 63) >> 6;
    v13 = result + 64;
    if ((v11 & v9) == 0)
      goto LABEL_7;
LABEL_6:
    v14 = __clz(__rbit64(v12));
    v12 &= v12 - 1;
    for (i = v14 | (v8 << 6); ; i = __clz(__rbit64(v17)) + (v8 << 6))
    {
      v19 = *(_DWORD *)(*(_QWORD *)(v5 + 48) + 4 * i);
      v20 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * i);
      if ((a2 & 1) == 0)
        swift_bridgeObjectRetain();
      Hasher.init(_seed:)();
      Hasher._combine(_:)(v19);
      result = Hasher._finalize()();
      v21 = -1 << *(_BYTE *)(v7 + 32);
      v22 = result & ~v21;
      v23 = v22 >> 6;
      if (((-1 << v22) & ~*(_QWORD *)(v13 + 8 * (v22 >> 6))) == 0)
      {
        v25 = 0;
        v26 = (unint64_t)(63 - v21) >> 6;
        while (++v23 != v26 || (v25 & 1) == 0)
        {
          v27 = v23 == v26;
          if (v23 == v26)
            v23 = 0;
          v25 |= v27;
          v28 = *(_QWORD *)(v13 + 8 * v23);
          if (v28 != -1)
          {
            v24 = __clz(__rbit64(~v28)) + (v23 << 6);
            goto LABEL_30;
          }
        }
        __break(1u);
LABEL_41:
        __break(1u);
LABEL_42:
        __break(1u);
        return result;
      }
      v24 = __clz(__rbit64((-1 << v22) & ~*(_QWORD *)(v13 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
      *(_QWORD *)(v13 + ((v24 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v24;
      *(_DWORD *)(*(_QWORD *)(v7 + 48) + 4 * v24) = v19;
      *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v24) = v20;
      ++*(_QWORD *)(v7 + 16);
      if (v12)
        goto LABEL_6;
LABEL_7:
      v16 = v8 + 1;
      if (__OFADD__(v8, 1))
        goto LABEL_41;
      if (v16 >= v30)
        goto LABEL_32;
      v17 = v31[v16];
      ++v8;
      if (!v17)
      {
        v8 = v16 + 1;
        if (v16 + 1 >= v30)
          goto LABEL_32;
        v17 = v31[v8];
        if (!v17)
        {
          v18 = v16 + 2;
          if (v18 >= v30)
          {
LABEL_32:
            if ((a2 & 1) == 0)
            {
              result = swift_release();
              v3 = v2;
              goto LABEL_39;
            }
            v29 = 1 << *(_BYTE *)(v5 + 32);
            if (v29 >= 64)
              specialized UnsafeMutablePointer.assign(repeating:count:)(0, (unint64_t)(v29 + 63) >> 6, v31);
            else
              *v31 = -1 << v29;
            v3 = v2;
            *(_QWORD *)(v5 + 16) = 0;
            break;
          }
          v17 = v31[v18];
          if (!v17)
          {
            while (1)
            {
              v8 = v18 + 1;
              if (__OFADD__(v18, 1))
                goto LABEL_42;
              if (v8 >= v30)
                goto LABEL_32;
              v17 = v31[v8];
              ++v18;
              if (v17)
                goto LABEL_18;
            }
          }
          v8 = v18;
        }
      }
LABEL_18:
      v12 = (v17 - 1) & v17;
    }
  }
  result = swift_release();
LABEL_39:
  *v3 = v7;
  return result;
}

_OWORD *specialized _NativeDictionary.setValue(_:forKey:isUnique:)(_OWORD *a1, uint64_t a2, char a3)
{
  _QWORD *v3;
  _QWORD **v4;
  _QWORD *v8;
  unint64_t v9;
  char v10;
  uint64_t v11;
  _BOOL8 v12;
  Swift::Int v13;
  unint64_t v14;
  char v15;
  unint64_t v16;
  char v17;
  _QWORD *v18;
  _OWORD *v19;
  _OWORD *result;
  _BYTE v21[40];

  v4 = (_QWORD **)v3;
  v8 = (_QWORD *)*v3;
  v9 = specialized __RawDictionaryStorage.find<A>(_:)(a2);
  v11 = v8[2];
  v12 = (v10 & 1) == 0;
  v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
    goto LABEL_9;
  }
  v14 = v9;
  v15 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _NativeDictionary<AnyHashable, Any>);
  if (!_NativeDictionary.ensureUnique(isUnique:capacity:)(a3 & 1, v13))
    goto LABEL_5;
  v16 = specialized __RawDictionaryStorage.find<A>(_:)(a2);
  if ((v15 & 1) != (v17 & 1))
  {
LABEL_9:
    result = (_OWORD *)KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
  v14 = v16;
LABEL_5:
  v18 = *v4;
  if ((v15 & 1) != 0)
  {
    v19 = (_OWORD *)(v18[7] + 32 * v14);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v19);
    return outlined init with take of Any(a1, v19);
  }
  else
  {
    outlined init with copy of AnyHashable(a2, (uint64_t)v21);
    return specialized _NativeDictionary._insert(at:key:value:)(v14, (uint64_t)v21, a1, v18);
  }
}

_OWORD *specialized _NativeDictionary._insert(at:key:value:)(unint64_t a1, uint64_t a2, _OWORD *a3, _QWORD *a4)
{
  uint64_t v5;
  __int128 v6;
  _OWORD *result;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;

  a4[(a1 >> 6) + 8] |= 1 << a1;
  v5 = a4[6] + 40 * a1;
  v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)v5 = *(_OWORD *)a2;
  *(_OWORD *)(v5 + 16) = v6;
  *(_QWORD *)(v5 + 32) = *(_QWORD *)(a2 + 32);
  result = outlined init with take of Any(a3, (_OWORD *)(a4[7] + 32 * a1));
  v8 = a4[2];
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
    __break(1u);
  else
    a4[2] = v10;
  return result;
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:hashValue:)(uint64_t a1, uint64_t a2)
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
      outlined init with copy of AnyHashable(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = MEMORY[0x212BEE368](v9, a1);
      outlined destroy of AnyHashable((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t specialized __RawDictionaryStorage.find<A>(_:hashValue:)(int a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t result;
  uint64_t v7;
  uint64_t v8;

  v4 = v2 + 64;
  v5 = -1 << *(_BYTE *)(v2 + 32);
  result = a2 & ~v5;
  if (((*(_QWORD *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0)
  {
    v7 = *(_QWORD *)(v2 + 48);
    if (*(_DWORD *)(v7 + 4 * result) != a1)
    {
      v8 = ~v5;
      for (result = (result + 1) & v8;
            ((*(_QWORD *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            result = (result + 1) & v8)
      {
        if (*(_DWORD *)(v7 + 4 * result) == a1)
          break;
      }
    }
  }
  return result;
}

unint64_t specialized Array._checkSubscript(_:wasNativeTypeChecked:)(unint64_t result, char a2, uint64_t a3)
{
  if ((a2 & 1) != 0)
  {
    if ((result & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10) > result)
    {
      return result;
    }
    __break(1u);
  }
  return result;
}

char *specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(char *a1, int64_t a2, char a3)
{
  uint64_t *v3;
  char *result;

  result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3);
  *v3 = (uint64_t)result;
  return result;
}

{
  uint64_t *v3;
  char *result;

  result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3);
  *v3 = (uint64_t)result;
  return result;
}

uint64_t type metadata accessor for CurareInteractionSELFStream()
{
  uint64_t result;

  result = type metadata singleton initialization cache for CurareInteractionSELFStream;
  if (!type metadata singleton initialization cache for CurareInteractionSELFStream)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t outlined init with copy of InstrumentationStreamsProviderProtocol(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t outlined assign with take of InstrumentationStreamsProviderProtocol?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for InstrumentationStreamsProviderProtocol?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t outlined init with copy of InstrumentationStreamsProviderProtocol?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for InstrumentationStreamsProviderProtocol?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t __swift_deallocate_boxed_opaque_existential_1(uint64_t result)
{
  if ((*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 24) - 8) + 80) & 0x20000) != 0)
    JUMPOUT(0x212BEEC50);
  return result;
}

uint64_t outlined init with take of InstrumentationStreamsProviderProtocol(__int128 *a1, uint64_t a2)
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

unint64_t lazy protocol witness table accessor for type BookmarkablePublisher<EventGraph> and conformance BookmarkablePublisher<A>()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type BookmarkablePublisher<EventGraph> and conformance BookmarkablePublisher<A>;
  if (!lazy protocol witness table cache variable for type BookmarkablePublisher<EventGraph> and conformance BookmarkablePublisher<A>)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for BookmarkablePublisher<EventGraph>);
    result = MEMORY[0x212BEEBCC](MEMORY[0x24BE0C940], v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type BookmarkablePublisher<EventGraph> and conformance BookmarkablePublisher<A>);
  }
  return result;
}

uint64_t sub_212568708()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t partial apply for implicit closure #9 in implicit closure #8 in CurareInteractionSELFStream.retrieve()()
{
  return dispatch thunk of EventFilter.isAllowed(_:)() & 1;
}

uint64_t partial apply for thunk for @escaping @callee_guaranteed (@in_guaranteed FilterableEvent) -> (@unowned Bool)(void *a1)
{
  uint64_t v1;

  return thunk for @escaping @callee_guaranteed (@in_guaranteed FilterableEvent) -> (@unowned Bool)(a1, *(uint64_t (**)(_QWORD *))(v1 + 16)) & 1;
}

uint64_t outlined init with take of Any?(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for NSMutableArray(uint64_t a1, unint64_t *a2)
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

uint64_t ObjC metadata update function for CurareInteractionSELFStream()
{
  return type metadata accessor for CurareInteractionSELFStream();
}

uint64_t type metadata completion function for CurareInteractionSELFStream()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for Logger();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for CurareInteractionSELFStream()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of CurareInteractionSELFStream.__allocating_init(filter:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t dispatch thunk of CurareInteractionSELFStream.retrieve()()
{
  _QWORD *v0;
  uint64_t v1;
  int *v2;
  _QWORD *v3;
  uint64_t (*v5)(void);

  v2 = *(int **)((*MEMORY[0x24BEE4EA0] & *v0) + 0x90);
  v5 = (uint64_t (*)(void))((char *)v2 + *v2);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = dispatch thunk of CurareInteractionSELFStream.retrieve();
  return OUTLINED_FUNCTION_3_6(v5);
}

uint64_t dispatch thunk of CurareInteractionSELFStream.retrieve()(uint64_t a1)
{
  uint64_t v1;

  OUTLINED_FUNCTION_0_9();
  return OUTLINED_FUNCTION_24_1(a1, *(uint64_t (**)(void))(v1 + 8));
}

uint64_t sub_212568938()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));

  return swift_deallocObject();
}

uint64_t partial apply for @objc closure #1 in CurareInteractionSELFStream.retrieve()()
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
  v4[1] = partial apply for @objc closure #1 in CurareInteractionSELFStream.retrieve();
  return ((uint64_t (*)(const void *, void *))((char *)&async function pointer to @objc closure #1 in CurareInteractionSELFStream.retrieve()
                                                       + async function pointer to @objc closure #1 in CurareInteractionSELFStream.retrieve()))(v2, v3);
}

{
  uint64_t v0;

  OUTLINED_FUNCTION_0_9();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t _sIeghH_IeAgH_TRTA()
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
  v5[1] = _sIeghH_IeAgH_TRTQ0_;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&_sIeghH_IeAgH_TRTu + _sIeghH_IeAgH_TRTu))(v2, v3, v4);
}

uint64_t objectdestroy_10Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t _sIeAgH_ytIeAgHr_TRTA(uint64_t a1)
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
  v7[1] = _sIeghH_IeAgH_TRTQ0_;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&_sIeAgH_ytIeAgHr_TRTu
                                                                   + _sIeAgH_ytIeAgHr_TRTu))(a1, v4, v5, v6);
}

void outlined destroy of InstrumentationStreamsProviderProtocol?(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  OUTLINED_FUNCTION_20_1();
}

uint64_t sub_212568B5C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tgq5TA(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tgq5TATQ0_;
  return ((uint64_t (*)(uint64_t, int *))((char *)&_sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tgq5Tu
                                                 + _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tgq5Tu))(a1, v4);
}

uint64_t _sxIeAgHr_xs5Error_pIegHrzo_s8SendableRzs5NeverORs_r0_lTRyt_Tgq5TATQ0_()
{
  uint64_t v0;

  OUTLINED_FUNCTION_0_9();
  return OUTLINED_FUNCTION_3_6(*(uint64_t (**)(void))(v0 + 8));
}

char *specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
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
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<[AnyHashable : Any]>);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 8);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    specialized UnsafeMutablePointer.moveInitialize(from:count:)(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    specialized UnsafeMutablePointer.initialize(from:count:)((unint64_t)v13, v8, (unint64_t)v12);
  }
  swift_release();
  return v10;
}

{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
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
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
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
  v13 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    specialized UnsafeMutablePointer.moveInitialize(from:count:)(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    specialized UnsafeMutablePointer.initialize(from:count:)((unint64_t)v13, v8, (unint64_t)v12);
  }
  swift_release();
  return v10;
}

uint64_t specialized Dictionary.startIndex.getter(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;
  unsigned int v6;
  uint64_t i;

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
  v2 = 64;
  for (i = 10; i - 8 < (unint64_t)(v3 + 63) >> 6; ++i)
  {
    v1 = *(_QWORD *)(a1 + 8 * i);
    v2 += 64;
    if (v1)
      return __clz(__rbit64(v1)) + v2;
  }
  return v3;
}

_QWORD *__swift_project_boxed_opaque_existential_1Tm(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t outlined consume of Set<ComponentIdentifier>.Iterator._Variant()
{
  return swift_release();
}

void type metadata accessor for SISchemaComponentName()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!lazy cache variable for type metadata for SISchemaComponentName)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&lazy cache variable for type metadata for SISchemaComponentName);
  }
}

uint64_t outlined destroy of AnyHashable(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 8))();
  return a1;
}

_OWORD *outlined init with take of Any(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t outlined init with copy of AnyHashable(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 16))(a2, a1);
  return a2;
}

void base witness table accessor for Equatable in SISchemaComponentName()
{
  lazy protocol witness table accessor for type DispatchWorkItemFlags and conformance DispatchWorkItemFlags(&lazy protocol witness table cache variable for type SISchemaComponentName and conformance SISchemaComponentName, (uint64_t (*)(uint64_t))type metadata accessor for SISchemaComponentName, (uint64_t)&protocol conformance descriptor for SISchemaComponentName);
}

void CurareInteractionSELFStream.provider.setter()
{
  swift_deletedMethodError();
  __break(1u);
}

uint64_t OUTLINED_FUNCTION_0_9()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
  *(_QWORD *)(v1 - 8) = *v0;
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_2_5()
{
  __int128 *v0;
  uint64_t v1;

  outlined init with take of InstrumentationStreamsProviderProtocol(v0, v1 + 136);
  __swift_project_boxed_opaque_existential_1Tm((_QWORD *)(v1 + 136), *(_QWORD *)(v1 + 160));
  return InstrumentationStreamsProviderProtocol.eventGraphs()();
}

uint64_t OUTLINED_FUNCTION_3_6(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_5_7()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_6_6()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_7_7()
{
  return swift_bridgeObjectRelease();
}

__n128 OUTLINED_FUNCTION_9_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,__n128 a39)
{
  _DWORD *v39;
  uint64_t v40;
  __n128 result;

  *(_QWORD *)(v40 - 144) = a1;
  *(_QWORD *)(v40 - 128) = a1;
  result = a39;
  *v39 = a39.n128_u32[0];
  *(_QWORD *)(v40 - 152) = v39 + 1;
  return result;
}

uint64_t OUTLINED_FUNCTION_10_5(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_12_5()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t OUTLINED_FUNCTION_13_5()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_16_1(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t OUTLINED_FUNCTION_17_1()
{
  return swift_task_switch();
}

uint64_t OUTLINED_FUNCTION_18_1()
{
  return swift_bridgeObjectRelease();
}

void OUTLINED_FUNCTION_19_1(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  os_log_type_t v4;
  NSObject *v5;
  uint8_t *v6;

  _os_log_impl(a1, v5, v4, a4, v6, 2u);
}

uint64_t OUTLINED_FUNCTION_20_2()
{
  return String.init<A>(describing:)();
}

uint64_t OUTLINED_FUNCTION_22_1()
{
  uint64_t v0;
  uint64_t v1;

  return outlined init with copy of InstrumentationStreamsProviderProtocol?(*(_QWORD *)(v1 + 600) + *(_QWORD *)(v1 + 664), v0);
}

uint64_t OUTLINED_FUNCTION_23_1()
{
  return _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)();
}

uint64_t OUTLINED_FUNCTION_24_1(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t OUTLINED_FUNCTION_25_1()
{
  return swift_bridgeObjectRelease();
}

id OUTLINED_FUNCTION_26@<X0>(uint64_t a1@<X8>)
{
  return *(id *)(a1 + 32);
}

uint64_t OUTLINED_FUNCTION_27_0()
{
  return Logger.logObject.getter();
}

uint64_t OUTLINED_FUNCTION_28_0()
{
  return swift_bridgeObjectRetain_n();
}

uint64_t OUTLINED_FUNCTION_30_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_33_0()
{
  uint64_t v0;

  return v0;
}

BOOL OUTLINED_FUNCTION_34_0(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

char *OUTLINED_FUNCTION_36_0(char *a1, int64_t a2)
{
  return specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, 1);
}

_QWORD *OUTLINED_FUNCTION_37_0@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  *a2 = a1;
  return a2;
}

BOOL OUTLINED_FUNCTION_38_0(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_39_0()
{
  return Dictionary.description.getter();
}

id OUTLINED_FUNCTION_40_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,void *a42)
{
  return a42;
}

id OUTLINED_FUNCTION_41_0(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

uint64_t OUTLINED_FUNCTION_42_0()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_43_0@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;

  *v1 = v2;
  v1[1] = a1;
  return *(_QWORD *)(v2 + 632);
}

uint64_t OUTLINED_FUNCTION_44_0()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t OUTLINED_FUNCTION_45()
{
  return swift_unknownObjectRelease();
}

id OUTLINED_FUNCTION_46()
{
  objc_class *v0;

  return objc_allocWithZone(v0);
}

void OUTLINED_FUNCTION_47(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  outlined destroy of InstrumentationStreamsProviderProtocol?(v2, a2);
}

uint64_t OUTLINED_FUNCTION_48()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t OUTLINED_FUNCTION_49()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_50()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t OUTLINED_FUNCTION_51(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  unint64_t v3;

  return getNullTerminatedUTF8PointerImpl(_:storingStringOwnersIn:)(a1, v3, a3);
}

id OUTLINED_FUNCTION_52(uint64_t a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;

  return objc_msgSend(*(id *)(v3 - 136), a2, v2);
}

uint64_t OUTLINED_FUNCTION_53()
{
  return swift_unknownObjectRelease();
}

uint64_t OUTLINED_FUNCTION_54()
{
  return swift_bridgeObjectRetain();
}

unint64_t OUTLINED_FUNCTION_55(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 688) = a1;
  return lazy protocol witness table accessor for type BookmarkablePublisher<EventGraph> and conformance BookmarkablePublisher<A>();
}

uint64_t OUTLINED_FUNCTION_56()
{
  return type metadata accessor for UUID();
}

uint64_t OUTLINED_FUNCTION_59()
{
  uint64_t v0;
  uint64_t v1;

  return outlined init with take of Any?(v1, v0);
}

uint64_t dispatch thunk of Serializable.fsf_serialize()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of static Serializable.fsf_deserialize(from:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 24))();
}

uint64_t InteractionWrapper.interactionId.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

double InteractionWrapper.timestamp.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 16);
}

uint64_t InteractionWrapper.feature.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 16) - 8) + 16))(a2, v2 + *(int *)(a1 + 32));
}

uint64_t InteractionWrapper.init(interactionId:timestamp:feature:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>, double a6@<D0>)
{
  uint64_t v8;

  *(_QWORD *)a5 = a1;
  *(_QWORD *)(a5 + 8) = a2;
  *(double *)(a5 + 16) = a6;
  v8 = a5 + *(int *)(type metadata accessor for InteractionWrapper(0, a4, a3, a4) + 32);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a4 - 8) + 32))(v8, a3, a4);
}

uint64_t type metadata accessor for InteractionWrapper(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for InteractionWrapper);
}

uint64_t dispatch thunk of FeatureMetadata.interactionId.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of FeatureMetadata.timestamp.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of StreamAccessor.init(identifier:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 24))();
}

uint64_t dispatch thunk of StreamAccessor.insert(feature:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t dispatch thunk of StreamAccessor.retrieve(query:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t dispatch thunk of StreamAccessor.retrieve(interactionId:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 48))();
}

uint64_t type metadata instantiation function for InteractionWrapper()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t type metadata completion function for InteractionWrapper()
{
  uint64_t result;
  unint64_t v1;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void initializeBufferWithCopyOfBuffer for InteractionWrapper(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 80);
  if (v5 > 7
    || (*(_DWORD *)(v4 + 80) & 0x100000) != 0
    || ((v5 + 24) & (unint64_t)~v5) + *(_QWORD *)(v4 + 64) > 0x18)
  {
    *a1 = *a2;
    swift_retain();
  }
  else
  {
    v8 = a2[1];
    *a1 = *a2;
    a1[1] = v8;
    *(_QWORD *)(((unint64_t)a1 + 23) & 0xFFFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)a2 + 23) & 0xFFFFFFFFFFFFFFF8);
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_2_6();
  }
  OUTLINED_FUNCTION_9_6();
}

uint64_t destroy for InteractionWrapper(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(unint64_t))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 8))((((a1 + 23) & 0xFFFFFFFFFFFFFFF8) + *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 80));
}

void initializeWithCopy for InteractionWrapper(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  OUTLINED_FUNCTION_3_7((uint64_t)a2, (uint64_t)a1 + 23);
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_2_6();
  OUTLINED_FUNCTION_9_6();
}

void assignWithCopy for InteractionWrapper(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v2 = OUTLINED_FUNCTION_0_10();
  (*(void (**)(uint64_t))(v3 + 24))(v2);
  OUTLINED_FUNCTION_1_1();
}

_OWORD *initializeWithTake for InteractionWrapper(_OWORD *a1, _OWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *a1 = *a2;
  OUTLINED_FUNCTION_3_7((uint64_t)a2, (uint64_t)a1 + 23);
  v4 = *(_QWORD *)(*(_QWORD *)(v3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v4 + 32))((*(unsigned __int8 *)(v4 + 80) + 8 + v5) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80), (*(unsigned __int8 *)(v4 + 80) + 8 + v6) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  return a1;
}

void assignWithTake for InteractionWrapper(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = a2[1];
  *a1 = *a2;
  a1[1] = v2;
  swift_bridgeObjectRelease();
  v3 = OUTLINED_FUNCTION_0_10();
  (*(void (**)(uint64_t))(v4 + 40))(v3);
  OUTLINED_FUNCTION_1_1();
}

uint64_t getEnumTagSinglePayload for InteractionWrapper(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  char v11;
  int v12;
  unsigned int v14;
  int v15;
  unint64_t v16;

  v4 = *(_QWORD *)(a3 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(unsigned int *)(v5 + 84);
  if (v6 <= 0x7FFFFFFF)
    v7 = 0x7FFFFFFF;
  else
    v7 = *(_DWORD *)(v5 + 84);
  if (!a2)
    return 0;
  v8 = *(unsigned __int8 *)(v5 + 80);
  v9 = a2 - v7;
  if (a2 <= v7)
    goto LABEL_22;
  v10 = ((v8 + 24) & ~v8) + *(_QWORD *)(v5 + 64);
  v11 = 8 * v10;
  if (v10 <= 3)
  {
    v14 = ((v9 + ~(-1 << v11)) >> v11) + 1;
    if (HIWORD(v14))
    {
      v12 = *(_DWORD *)(a1 + v10);
      if (!v12)
        goto LABEL_22;
      goto LABEL_15;
    }
    if (v14 > 0xFF)
    {
      v12 = *(unsigned __int16 *)(a1 + v10);
      if (!*(_WORD *)(a1 + v10))
        goto LABEL_22;
      goto LABEL_15;
    }
    if (v14 < 2)
    {
LABEL_22:
      if ((v6 & 0x80000000) != 0)
        return __swift_getEnumTagSinglePayload((((a1 + 23) & 0xFFFFFFFFFFFFFFF8) + v8 + 8) & ~v8, v6, v4);
      v16 = *(_QWORD *)(a1 + 8);
      if (v16 >= 0xFFFFFFFF)
        LODWORD(v16) = -1;
      return (v16 + 1);
    }
  }
  v12 = *(unsigned __int8 *)(a1 + v10);
  if (!*(_BYTE *)(a1 + v10))
    goto LABEL_22;
LABEL_15:
  v15 = (v12 - 1) << v11;
  if (v10 > 3)
    v15 = 0;
  if (!(_DWORD)v10)
    return v7 + v15 + 1;
  if (v10 > 3)
    LODWORD(v10) = 4;
  return ((uint64_t (*)(void))((char *)&loc_2125696D0 + 4 * byte_2125759F0[(v10 - 1)]))();
}

void storeEnumTagSinglePayload for InteractionWrapper(uint64_t a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5;
  unsigned int v6;
  unint64_t v7;
  char v8;
  unsigned int v9;
  int v10;
  unsigned int v11;
  int v12;

  v5 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  if (*(_DWORD *)(v5 + 84) <= 0x7FFFFFFFu)
    v6 = 0x7FFFFFFF;
  else
    v6 = *(_DWORD *)(v5 + 84);
  v7 = ((*(unsigned __int8 *)(v5 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))
     + *(_QWORD *)(v5 + 64);
  v8 = 8 * v7;
  if (a3 > v6)
  {
    if (v7 <= 3)
    {
      v11 = ((a3 - v6 + ~(-1 << v8)) >> v8) + 1;
      if (HIWORD(v11))
      {
        v9 = 4u;
      }
      else if (v11 >= 0x100)
      {
        v9 = 2;
      }
      else
      {
        v9 = v11 > 1;
      }
    }
    else
    {
      v9 = 1u;
    }
  }
  else
  {
    v9 = 0;
  }
  if (v6 < a2)
  {
    v10 = ~v6 + a2;
    if (v7 < 4)
    {
      if ((_DWORD)v7)
      {
        v12 = v10 & ~(-1 << v8);
        OUTLINED_FUNCTION_5_8();
        if ((_DWORD)v7 == 3)
        {
          *(_WORD *)a1 = v12;
          *(_BYTE *)(a1 + 2) = BYTE2(v12);
        }
        else if ((_DWORD)v7 == 2)
        {
          *(_WORD *)a1 = v12;
        }
        else
        {
          *(_BYTE *)a1 = v12;
        }
      }
    }
    else
    {
      OUTLINED_FUNCTION_5_8();
      *(_DWORD *)a1 = v10;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X12 }
}

uint64_t OUTLINED_FUNCTION_0_10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;

  v3 = (_QWORD *)((v2 + 23) & 0xFFFFFFFFFFFFFFF8);
  *v3 = *(_QWORD *)((v1 + 23) & 0xFFFFFFFFFFFFFFF8);
  v4 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 80);
  return ((unint64_t)v3 + v4 + 8) & ~v4;
}

uint64_t OUTLINED_FUNCTION_2_6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(v1, v2, v0);
}

void OUTLINED_FUNCTION_3_7(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  *(_QWORD *)(a2 & 0xFFFFFFFFFFFFFFF8) = *(_QWORD *)((a1 + 23) & 0xFFFFFFFFFFFFFFF8);
}

void OUTLINED_FUNCTION_5_8()
{
  void *v0;
  size_t v1;

  bzero(v0, v1);
}

uint64_t NSCodingFeatureWrapper.serialize()()
{
  uint64_t v0;
  id v1;
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;

  v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1618]), sel_initRequiringSecureCoding_, 0);
  objc_msgSend(v1, sel_setOutputFormat_, 100);
  v2 = *(_QWORD *)(v0 + 16);
  v3 = (void *)MEMORY[0x212BEE02C](1953460082, 0xE400000000000000);
  objc_msgSend(v1, sel_encodeObject_forKey_, v2, v3);

  objc_msgSend(v1, sel_finishEncoding);
  v4 = objc_msgSend(v1, sel_encodedData);
  v5 = static Data._unconditionallyBridgeFromObjectiveC(_:)();

  return v5;
}

id @objc NSCodingFeatureWrapper.serialize()()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t v2;
  Class isa;

  swift_retain();
  v0 = NSCodingFeatureWrapper.serialize()();
  v2 = v1;
  swift_release();
  if (v2 >> 60 == 15)
    return OUTLINED_FUNCTION_6_1(0);
  isa = Data._bridgeToObjectiveC()().super.isa;
  outlined consume of Data?(v0, v2);
  return OUTLINED_FUNCTION_6_1(isa);
}

uint64_t static NSCodingFeatureWrapper.deserialize(_:dataVersion:interactionId:)(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t result;
  uint64_t v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint64_t v22;
  uint64_t v23;

  v23 = a5;
  v8 = type metadata accessor for Logger();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  MEMORY[0x24BDAC7A8](v10);
  v12 = ((char *)&v22 - v11);
  type metadata accessor for NSKeyedUnarchiver();
  v13 = *(_QWORD *)(v5 + 144);
  v16 = static NSKeyedUnarchiver.unarchivedObject<A>(ofClass:from:)();
  v17 = v23;
  if (v16)
  {
    type metadata accessor for NSCodingFeatureWrapper(0, v13, v14, v15);
    swift_bridgeObjectRetain();
    AceObjectFeatureWrapper.__allocating_init(interactionId:dataVersion:feature:)(a4, v17, a3, v16);
    result = swift_dynamicCastClass();
    if (result)
      return result;
    swift_release();
  }
  else
  {
    v19 = Logger.accessor.unsafeMutableAddressor();
    OUTLINED_FUNCTION_11_1((uint64_t)v12, v19, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 16));
    Logger.logObject.getter();
    v20 = OUTLINED_FUNCTION_9_0();
    if (os_log_type_enabled(v12, v20))
    {
      v21 = (uint8_t *)OUTLINED_FUNCTION_5();
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_212552000, v12, v20, "Deserialization failed. Returned nil object.", v21, 2u);
      OUTLINED_FUNCTION_1();
    }

    (*(void (**)(NSObject *, uint64_t))(v9 + 8))(v12, v8);
  }
  return 0;
}

id @objc static NSCodingFeatureWrapper.deserialize(_:dataVersion:interactionId:)(uint64_t a1, uint64_t a2, void *a3, int a4, void *a5)
{
  id v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  v7 = a3;
  v8 = a5;
  v9 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  v11 = v10;

  v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v14 = v13;

  swift_getObjCClassMetadata();
  v15 = (void *)static NSCodingFeatureWrapper.deserialize(_:dataVersion:interactionId:)(v9, v11, a4, v12, v14);
  swift_bridgeObjectRelease();
  outlined consume of Data._Representation(v9, v11);
  return v15;
}

Swift::String_optional __swiftcall NSCodingFeatureWrapper.json()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  Swift::String_optional result;
  uint64_t v20;

  v1 = type metadata accessor for Logger();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = ((char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v5 = type metadata accessor for String.Encoding();
  v6 = MEMORY[0x24BDAC7A8](v5);
  v7 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v0 + 120))(v6);
  if (v8 >> 60 == 15)
  {
    v9 = Logger.accessor.unsafeMutableAddressor();
    OUTLINED_FUNCTION_11_1((uint64_t)v4, v9, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 16));
    Logger.logObject.getter();
    v10 = OUTLINED_FUNCTION_9_0();
    if (os_log_type_enabled(v4, v10))
    {
      v11 = (uint8_t *)OUTLINED_FUNCTION_5();
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_212552000, v4, v10, "Json fetch failed.", v11, 2u);
      OUTLINED_FUNCTION_1();
    }

    (*(void (**)(NSObject *, uint64_t))(v2 + 8))(v4, v1);
    v12 = 0;
    v13 = 0;
  }
  else
  {
    v14 = v7;
    v15 = v8;
    static String.Encoding.utf8.getter();
    v12 = String.init(data:encoding:)();
    v13 = v16;
    outlined consume of Data?(v14, v15);
  }
  v17 = v12;
  v18 = v13;
  result.value._object = v18;
  result.value._countAndFlagsBits = v17;
  return result;
}

id @objc NSCodingFeatureWrapper.json()()
{
  Swift::String_optional v0;
  void *v1;

  swift_retain();
  v0 = NSCodingFeatureWrapper.json()();
  swift_release();
  if (!v0.value._object)
    return OUTLINED_FUNCTION_6_1(0);
  v1 = (void *)MEMORY[0x212BEE02C](v0.value._countAndFlagsBits, v0.value._object);
  swift_bridgeObjectRelease();
  return OUTLINED_FUNCTION_6_1(v1);
}

uint64_t type metadata accessor for NSCodingFeatureWrapper(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for NSCodingFeatureWrapper);
}

uint64_t static FeatureStoreService.insertAceObject<A>(interactionId:item:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  _QWORD *v12;
  id v13;
  uint64_t v14;
  uint64_t v16;

  v8 = type metadata accessor for DispatchQoS();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = a4;
  v12[3] = a3;
  v12[4] = a1;
  v12[5] = a2;
  v13 = a3;
  v14 = swift_bridgeObjectRetain();
  default argument 0 of static FeatureStoreService.performInsert(qos:insertBlock:completion:)(v14);
  static FeatureStoreService.performInsert(qos:insertBlock:completion:)((uint64_t)v11, (uint64_t)partial apply for closure #1 in static FeatureStoreService.insertAceObject<A>(interactionId:item:), (uint64_t)v12, 0, 0);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t sub_21256A14C()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t partial apply for closure #1 in static FeatureStoreService.insertAceObject<A>(interactionId:item:)()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v1 = v0[3];
  v2 = v0[4];
  v3 = v0[5];
  swift_getObjectType();
  swift_getMetatypeMetadata();
  v4 = OUTLINED_FUNCTION_3_8();
  v6 = v5;
  OUTLINED_FUNCTION_5_9(v4, v5, v7, v8);
  FeatureStoreNSCodingAccessorWithType.__allocating_init(identifier:)(v4, v6);
  v11 = v1;
  (*(void (**)(uint64_t, uint64_t, uint64_t *))(*(_QWORD *)v9 + 104))(v2, v3, &v11);
  return swift_release();
}

void static FeatureStoreService.retrieve<A>(interactionId:)(uint64_t a1, void *a2, uint64_t a3)
{
  static FeatureStoreService.retrieve<A>(interactionId:)(a1, a2, a3);
}

{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  Swift::String v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t *v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_2_7();
  OUTLINED_FUNCTION_6_7();
  OUTLINED_FUNCTION_0_11(v4);
  OUTLINED_FUNCTION_0_11((uint64_t)v11);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
  v12 = OUTLINED_FUNCTION_9_8();
  *(_OWORD *)(v12 + 16) = xmmword_212575370;
  *(_QWORD *)(v12 + 32) = a1;
  *(_QWORD *)(v12 + 40) = a2;
  swift_bridgeObjectRetain();
  v13 = OUTLINED_FUNCTION_10_6(v4, (uint64_t)v11);
  v16 = static FeatureStoreService.retrieveAceObject<A>(query:)((uint64_t)v13, a3, v14, v15);

  if (!v3)
  {
    v25 = v16;
    v17 = type metadata accessor for Array();
    MEMORY[0x212BEEBCC](MEMORY[0x24BEE12E0], v17);
    Collection.first.getter();
    swift_bridgeObjectRelease();
    if (!v23)
    {
      v23 = 0;
      v24 = 0xE000000000000000;
      _StringGuts.grow(_:)(42);
      swift_bridgeObjectRelease();
      v23 = 0xD000000000000028;
      v24 = 0x80000002125777F0;
      v18._countAndFlagsBits = a1;
      v18._object = a2;
      String.append(_:)(v18);
      v19 = v23;
      v20 = v24;
      lazy protocol witness table accessor for type FeatureStoreError and conformance FeatureStoreError();
      v21 = OUTLINED_FUNCTION_2();
      *v22 = v19;
      v22[1] = v20;
      OUTLINED_FUNCTION_7_8(v21, (uint64_t)v22);
    }
  }
  OUTLINED_FUNCTION_1_2();
}

uint64_t static FeatureStoreService.retrieveAceObject<A>(query:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v14[6];

  v7 = static FeatureStoreService.retrieveAceObjectWithInteractionWrapper<A>(query:)(a1, a2, a3, a4);
  if (!v5)
  {
    v14[5] = v7;
    MEMORY[0x24BDAC7A8](v7);
    v14[2] = a2;
    type metadata accessor for InteractionWrapper(255, a2, v8, v9);
    v10 = OUTLINED_FUNCTION_24();
    v11 = MEMORY[0x212BEEBCC](MEMORY[0x24BEE12E0], v10);
    v4 = _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lF((void (*)(char *, char *))partial apply for closure #1 in static FeatureStoreService.retrieveAceObject<A>(query:), (uint64_t)v14, v10, a2, MEMORY[0x24BEE4078], v11, MEMORY[0x24BEE40A8], v12);
    swift_bridgeObjectRelease();
  }
  return v4;
}

void static FeatureStoreService.retrieveAceObject<A>(interactionId:)(uint64_t a1, void *a2, uint64_t a3)
{
  static FeatureStoreService.retrieve<A>(interactionId:)(a1, a2, a3);
}

uint64_t static FeatureStoreService.retrieveAceObjectWithInteractionWrapper<A>(query:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;

  type metadata accessor for InteractionWrapper(255, a2, a3, a4);
  v5 = OUTLINED_FUNCTION_24();
  result = static FeatureStoreService.performRetrieve<A>(retrieveBlock:)((void (*)(uint64_t))partial apply for closure #1 in static FeatureStoreService.retrieveAceObjectWithInteractionWrapper<A>(query:), v5, (uint64_t)&v7);
  if (!v4)
    return v7;
  return result;
}

id partial apply for closure #1 in static FeatureStoreService.retrieveAceObject<A>(query:)@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  void *v2;

  v2 = *(void **)(a1 + 24);
  *a2 = v2;
  return v2;
}

void static FeatureStoreService.retrieveWithInteractionWrapper<A>(interactionId:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_2_7();
  OUTLINED_FUNCTION_6_7();
  OUTLINED_FUNCTION_0_11(v3);
  OUTLINED_FUNCTION_0_11((uint64_t)v10);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
  v11 = OUTLINED_FUNCTION_9_8();
  *(_OWORD *)(v11 + 16) = xmmword_212575370;
  *(_QWORD *)(v11 + 32) = a1;
  *(_QWORD *)(v11 + 40) = a2;
  swift_bridgeObjectRetain();
  v12 = OUTLINED_FUNCTION_10_6(v3, (uint64_t)v10);
  static FeatureStoreService.retrieveAceObjectWithInteractionWrapper<A>(query:)((uint64_t)v12, a3, v13, v14);

  OUTLINED_FUNCTION_1_2();
}

{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_2_7();
  OUTLINED_FUNCTION_6_7();
  OUTLINED_FUNCTION_0_11(v3);
  OUTLINED_FUNCTION_0_11((uint64_t)v10);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
  v11 = OUTLINED_FUNCTION_9_8();
  *(_OWORD *)(v11 + 16) = xmmword_212575370;
  *(_QWORD *)(v11 + 32) = a1;
  *(_QWORD *)(v11 + 40) = a2;
  swift_bridgeObjectRetain();
  v12 = OUTLINED_FUNCTION_10_6(v3, (uint64_t)v10);
  static FeatureStoreService.retrieveNSCodingWithInteractionWrapper<A>(query:)((uint64_t)v12, a3, v13, v14);

  OUTLINED_FUNCTION_1_2();
}

uint64_t partial apply for closure #1 in static FeatureStoreService.retrieveAceObjectWithInteractionWrapper<A>(query:)@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(void);
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  uint64_t v20;
  _QWORD *v21;

  v4 = *(_QWORD **)(v1 + 24);
  swift_getMetatypeMetadata();
  v5 = OUTLINED_FUNCTION_3_8();
  v7 = v6;
  OUTLINED_FUNCTION_5_9(v5, v6, v8, v9);
  FeatureStoreNSCodingAccessorWithType.__allocating_init(identifier:)(v5, v7);
  v11 = v10;
  v12 = *(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v4) + 0x98);
  v13 = *(_QWORD *)(v12() + 16);
  v14 = swift_bridgeObjectRelease();
  if (v13 != 1)
    goto LABEL_6;
  v15 = (_QWORD *)((uint64_t (*)(uint64_t))v12)(v14);
  if (!v15[2])
  {
    swift_bridgeObjectRelease();
LABEL_6:
    lazy protocol witness table accessor for type FeatureStoreError and conformance FeatureStoreError();
    v20 = OUTLINED_FUNCTION_2();
    *v21 = 0xD000000000000075;
    v21[1] = 0x8000000212577820;
    OUTLINED_FUNCTION_7_8(v20, (uint64_t)v21);
    return swift_release();
  }
  v16 = v15[4];
  v17 = v15[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v18 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)v11 + 136))(v16, v17);
  swift_bridgeObjectRelease();
  result = swift_release();
  if (!v2)
    *a1 = v18;
  return result;
}

uint64_t OUTLINED_FUNCTION_0_11(uint64_t a1)
{
  uint64_t v1;

  return __swift_storeEnumTagSinglePayload(a1, 1, 1, v1);
}

uint64_t OUTLINED_FUNCTION_2_7()
{
  return type metadata accessor for StreamQuery();
}

uint64_t OUTLINED_FUNCTION_3_8()
{
  return String.init<A>(describing:)();
}

uint64_t OUTLINED_FUNCTION_5_9(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  return type metadata accessor for AceObjectStreamAccessor(0, v4, a3, a4);
}

uint64_t OUTLINED_FUNCTION_6_7()
{
  return type metadata accessor for Date();
}

uint64_t OUTLINED_FUNCTION_7_8(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)(a2 + 16) = 0;
  return swift_willThrow();
}

uint64_t OUTLINED_FUNCTION_9_8()
{
  return swift_allocObject();
}

id OUTLINED_FUNCTION_10_6(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return StreamQuery.__allocating_init(startDate:endDate:interactionIds:)(a1, a2, v2);
}

void static FeatureStoreService.insertCoding(interactionId:item:)()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;

  swift_getObjectType();
  v0 = OUTLINED_FUNCTION_0_12();
  static FeatureStoreService.insertNSCoding<A>(interactionId:item:)(v0, v1, v2, v3);
}

void static FeatureStoreService.insertPBCodable(interactionId:item:)()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;

  type metadata accessor for PBCodable();
  v0 = OUTLINED_FUNCTION_0_12();
  static FeatureStoreService.insert<A>(interactionId:item:)(v0, v1, v2, v3);
}

unint64_t type metadata accessor for PBCodable()
{
  unint64_t result;

  result = lazy cache variable for type metadata for PBCodable;
  if (!lazy cache variable for type metadata for PBCodable)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for PBCodable);
  }
  return result;
}

uint64_t @objc static FeatureStoreService.insertCoding(interactionId:item:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void (*a5)(uint64_t, uint64_t, id))
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v9 = v8;
  swift_getObjCClassMetadata();
  v10 = a4;
  a5(v7, v9, v10);

  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_0_12()
{
  uint64_t v0;

  return v0;
}

uint64_t static FeatureStoreService.insertSerializable<A>(interactionId:item:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v23 = a1;
  v22 = a5;
  v8 = type metadata accessor for DispatchQoS();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = *(_QWORD *)(a4 - 8);
  v14 = *(_QWORD *)(v13 + 64);
  MEMORY[0x24BDAC7A8](v10);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))((char *)&v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), a3, a4);
  v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  v16 = swift_allocObject();
  v17 = v22;
  *(_QWORD *)(v16 + 16) = a4;
  *(_QWORD *)(v16 + 24) = v17;
  (*(void (**)(unint64_t, char *, uint64_t))(v13 + 32))(v16 + v15, (char *)&v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), a4);
  v18 = (_QWORD *)(v16 + ((v14 + v15 + 7) & 0xFFFFFFFFFFFFFFF8));
  *v18 = v23;
  v18[1] = a2;
  v19 = swift_bridgeObjectRetain();
  default argument 0 of static FeatureStoreService.performInsert(qos:insertBlock:completion:)(v19);
  static FeatureStoreService.performInsert(qos:insertBlock:completion:)((uint64_t)v12, (uint64_t)partial apply for closure #1 in static FeatureStoreService.insertSerializable<A>(interactionId:item:), v16, 0, 0);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v12, v8);
}

uint64_t sub_21256AAE4()
{
  uint64_t v0;

  (*(void (**)(unint64_t))(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 80)));
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void partial apply for closure #1 in static FeatureStoreService.insertSerializable<A>(interactionId:item:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(_QWORD *)(v0 + 24);
  v3 = *(_QWORD *)(v1 - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v5 = v0 + v4;
  v6 = (uint64_t *)(v0 + ((*(_QWORD *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8));
  v7 = *v6;
  v8 = v6[1];
  swift_getDynamicType();
  swift_getMetatypeMetadata();
  OUTLINED_FUNCTION_3_8();
  type metadata accessor for SerializableStreamAccessor(0, v1, v2, v9);
  OUTLINED_FUNCTION_2_8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v10 + 104))(v7, v8, v5);
  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_0_13();
}

uint64_t static FeatureStoreService.retrieveSerializable<A>(interactionId:)@<X0>(uint64_t a1@<X2>, uint64_t a2@<X8>)
{
  return static FeatureStoreService.performRetrieve<A>(retrieveBlock:)((void (*)(uint64_t))partial apply for closure #1 in static FeatureStoreService.retrieveSerializable<A>(interactionId:), a1, a2);
}

void partial apply for closure #1 in static FeatureStoreService.retrieveSerializable<A>(interactionId:)()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = v0[2];
  v2 = v0[3];
  v3 = v0[4];
  v4 = v0[5];
  swift_getMetatypeMetadata();
  OUTLINED_FUNCTION_3_8();
  type metadata accessor for SerializableStreamAccessor(0, v1, v2, v5);
  OUTLINED_FUNCTION_2_8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)v6 + 128))(v3, v4);
  OUTLINED_FUNCTION_4_5();
  OUTLINED_FUNCTION_0_13();
}

uint64_t static FeatureStoreService.retrieveWithInteractionWrapper<A>(interactionId:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v19 - v12;
  type metadata accessor for StreamQuery();
  type metadata accessor for Date();
  OUTLINED_FUNCTION_3_9((uint64_t)v13);
  OUTLINED_FUNCTION_3_9((uint64_t)v11);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
  v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_212575370;
  *(_QWORD *)(v14 + 32) = a1;
  *(_QWORD *)(v14 + 40) = a2;
  swift_bridgeObjectRetain();
  v15 = StreamQuery.__allocating_init(startDate:endDate:interactionIds:)((uint64_t)v13, (uint64_t)v11, v14);
  v17 = static FeatureStoreService.retrieveSerializableWithInteractionWrapper<A>(query:)((uint64_t)v15, a3, a4, v16);

  return v17;
}

uint64_t static FeatureStoreService.retrieveSerializableWithInteractionWrapper<A>(query:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;

  type metadata accessor for InteractionWrapper(255, a2, a3, a4);
  v5 = type metadata accessor for Array();
  result = static FeatureStoreService.performRetrieve<A>(retrieveBlock:)((void (*)(uint64_t))partial apply for closure #1 in static FeatureStoreService.retrieveSerializableWithInteractionWrapper<A>(query:), v5, (uint64_t)&v7);
  if (!v4)
    return v7;
  return result;
}

uint64_t partial apply for closure #1 in static FeatureStoreService.retrieveSerializableWithInteractionWrapper<A>(query:)@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(void);
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;
  uint64_t v21;

  v4 = v1[2];
  v5 = v1[3];
  v6 = (_QWORD *)v1[4];
  swift_getMetatypeMetadata();
  v7 = OUTLINED_FUNCTION_3_8();
  v9 = v8;
  type metadata accessor for SerializableStreamAccessor(0, v4, v5, v10);
  FeatureStoreNSCodingAccessorWithType.__allocating_init(identifier:)(v7, v9);
  v12 = v11;
  v13 = *(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v6) + 0x98);
  v14 = *(_QWORD *)(v13() + 16);
  v15 = swift_bridgeObjectRelease();
  if (v14 != 1)
    goto LABEL_6;
  v16 = (_QWORD *)((uint64_t (*)(uint64_t))v13)(v15);
  if (!v16[2])
  {
    swift_bridgeObjectRelease();
LABEL_6:
    lazy protocol witness table accessor for type FeatureStoreError and conformance FeatureStoreError();
    swift_allocError();
    *(_QWORD *)v21 = 0xD000000000000075;
    *(_QWORD *)(v21 + 8) = 0x8000000212577820;
    *(_BYTE *)(v21 + 16) = 0;
    swift_willThrow();
    return swift_release();
  }
  v17 = v16[4];
  v18 = v16[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v19 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)v12 + 136))(v17, v18);
  swift_bridgeObjectRelease();
  result = swift_release();
  if (!v2)
    *a1 = v19;
  return result;
}

void OUTLINED_FUNCTION_2_8()
{
  uint64_t v0;
  uint64_t v1;

  FeatureStoreNSCodingAccessorWithType.__allocating_init(identifier:)(v0, v1);
}

uint64_t OUTLINED_FUNCTION_3_9(uint64_t a1)
{
  uint64_t v1;

  return __swift_storeEnumTagSinglePayload(a1, 1, 1, v1);
}

uint64_t OUTLINED_FUNCTION_4_5()
{
  return swift_release();
}

uint64_t static FeatureStoreService.insertAwait<A>(interactionId:item:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;

  v5[5] = a4;
  v5[6] = v4;
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = a1;
  return swift_task_switch();
}

void closure #1 in static FeatureStoreService.insertAwait<A>(interactionId:item:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  void (*v14)(uint64_t);
  uint64_t v15;
  uint64_t v16;

  v16 = a6;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<(), Never>);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(_QWORD *)(v11 + 64);
  MEMORY[0x24BDAC7A8](v10);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))((char *)&v15 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v10);
  v13 = (*(unsigned __int8 *)(v11 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  v14 = (void (*)(uint64_t))swift_allocObject();
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))((char *)v14 + v13, (char *)&v15 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), v10);
  static FeatureStoreService.insert<A>(interactionId:item:completion:)(a3, a4, a5, (void (*)(uint64_t))partial apply for implicit closure #2 in implicit closure #1 in closure #1 in static FeatureStoreService.insertAwait<A>(interactionId:item:), v14, v16);
  swift_release();
  OUTLINED_FUNCTION_0();
}

void partial apply for closure #1 in static FeatureStoreService.insertAwait<A>(interactionId:item:)(uint64_t a1)
{
  uint64_t v1;

  closure #1 in static FeatureStoreService.insertAwait<A>(interactionId:item:)(a1, *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40), *(void **)(v1 + 48), *(_QWORD *)(v1 + 16));
}

void static FeatureStoreService.insert<A>(interactionId:item:completion:)(uint64_t a1, uint64_t a2, void *a3, void (*a4)(uint64_t), void (*a5)(uint64_t), uint64_t a6)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  _QWORD *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;

  v12 = type metadata accessor for DispatchQoS();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = a6;
  v16[3] = a3;
  v16[4] = a1;
  v16[5] = a2;
  v17 = a3;
  v18 = swift_bridgeObjectRetain();
  default argument 0 of static FeatureStoreService.performInsert(qos:insertBlock:completion:)(v18);
  static FeatureStoreService.performInsert(qos:insertBlock:completion:)((uint64_t)v15, (uint64_t)partial apply for closure #1 in static FeatureStoreService.insert<A>(interactionId:item:completion:), (uint64_t)v16, a4, a5);
  swift_release();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  OUTLINED_FUNCTION_0();
}

void static FeatureStoreService.insert<A>(interactionId:item:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  static FeatureStoreService.insert<A>(interactionId:item:completion:)(a1, a2, a3, 0, 0, a4);
}

void closure #1 in static FeatureStoreService.insert<A>(interactionId:item:completion:)(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  int v19;
  double v20;
  id v21;
  _QWORD v22[2];

  v6 = type metadata accessor for Logger();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = static PBCodableCoder.encode(codable:)(a1);
  if (v11 >> 60 == 15)
  {
    v12 = Logger.service.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v12, v6);
    v13 = Logger.logObject.getter();
    v14 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_212552000, v13, v14, "Could not encode the item. Skipping insertion.", v15, 2u);
      MEMORY[0x212BEEC50](v15, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  else
  {
    v16 = v10;
    v17 = v11;
    v22[1] = swift_getObjectType();
    swift_getMetatypeMetadata();
    String.init<A>(describing:)();
    type metadata accessor for FeatureStoreStreamAccessor();
    v18 = FeatureStoreStreamAccessor.__allocating_init(identifier:)();
    type metadata accessor for FeatureStoreBiomeEvent();
    swift_bridgeObjectRetain();
    outlined copy of Data?(v16, v17);
    v19 = default argument 2 of FeatureStoreBiomeEvent.init(interactionId:featureData:dataVersion:timestamp:)();
    v20 = default argument 3 of FeatureStoreBiomeEvent.init(interactionId:featureData:dataVersion:timestamp:)();
    v21 = FeatureStoreBiomeEvent.__allocating_init(interactionId:featureData:dataVersion:timestamp:)(a2, a3, v16, v17, v19, v20);
    (*(void (**)(void))(*(_QWORD *)v18 + 104))();
    swift_release();

    outlined consume of Data?(v16, v17);
  }
  OUTLINED_FUNCTION_0();
}

uint64_t sub_21256B53C()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t static FeatureStoreService.retrieve<A>(query:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;
  uint64_t v3;

  v1 = type metadata accessor for Array();
  result = static FeatureStoreService.performRetrieve<A>(retrieveBlock:)((void (*)(uint64_t))partial apply for closure #1 in static FeatureStoreService.retrieve<A>(query:), v1, (uint64_t)&v3);
  if (!v0)
    return v3;
  return result;
}

uint64_t closure #1 in static FeatureStoreService.retrieve<A>(query:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;

  swift_getMetatypeMetadata();
  String.init<A>(describing:)();
  type metadata accessor for FeatureStoreStreamAccessor();
  v5 = FeatureStoreStreamAccessor.__allocating_init(identifier:)();
  v6 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v5 + 112))(a1);
  if (v2)
    return swift_release();
  MEMORY[0x24BDAC7A8](v6);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [FeatureStoreBiomeEvent]);
  lazy protocol witness table accessor for type [FeatureStoreBiomeEvent] and conformance [A]();
  v8 = Sequence.compactMap<A>(_:)();
  swift_bridgeObjectRelease();
  result = swift_release();
  *a2 = v8;
  return result;
}

uint64_t partial apply for closure #1 in static FeatureStoreService.retrieve<A>(query:)@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;

  return closure #1 in static FeatureStoreService.retrieve<A>(query:)(*(_QWORD *)(v1 + 24), a1);
}

id partial apply for closure #1 in closure #1 in static FeatureStoreService.retrieve<A>(query:)@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = static PBCodableCoder.decode(data:)(*(_QWORD *)(*a1 + OBJC_IVAR___FSFFeatureStoreBiomeEvent_featureData), *(_QWORD *)(*a1 + OBJC_IVAR___FSFFeatureStoreBiomeEvent_featureData + 8));
  *a2 = result;
  return result;
}

uint64_t sub_21256B76C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CheckedContinuation<(), Never>);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t AceObjectStreamAccessor.insert(interactionId:feature:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t *v9;
  void *v10;
  id v11;
  id v12;
  id v14[2];

  v5 = v4;
  v14[1] = *(id *)MEMORY[0x24BDAC8D0];
  type metadata accessor for AceObjectFeatureWrapper(0, *(_QWORD *)(*v5 + 144), a3, a4);
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain();
  v9 = AceObjectFeatureWrapper.__allocating_init(interactionId:dataVersion:feature:)(a1, a2, 0, a3);
  v10 = (void *)v5[2];
  v14[0] = 0;
  if ((objc_msgSend(v10, sel_insert_error_, v9, v14) & 1) != 0)
  {
    v11 = v14[0];
  }
  else
  {
    v12 = v14[0];
    _convertNSErrorToError(_:)();

    swift_willThrow();
  }
  return swift_release();
}

uint64_t AceObjectStreamAccessor.retrieve(interactionId:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t);
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;

  v2 = *(_QWORD *)v0;
  v3 = (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
  if (v1)
    return v0;
  v6 = v3;
  result = type metadata accessor for AceObjectFeatureWrapper(0, *(_QWORD *)(v2 + 144), v4, v5);
  if (*(_QWORD *)(v6 + 16))
  {
    v8 = result;
    v9 = OUTLINED_FUNCTION_1_4();
    outlined copy of Data._Representation(v9, v10);
    swift_bridgeObjectRelease();
    v11 = OUTLINED_FUNCTION_1_4();
    v0 = v8;
    v13 = v12(v11);
    v14 = OUTLINED_FUNCTION_1_4();
    outlined consume of Data._Representation(v14, v15);
    if (v13)
    {
      v0 = *(_QWORD *)(v13 + 16);
      swift_unknownObjectRetain();
      swift_release();
    }
    else
    {
      lazy protocol witness table accessor for type FeatureStoreError and conformance FeatureStoreError();
      OUTLINED_FUNCTION_2();
      OUTLINED_FUNCTION_0_6(v16, (uint64_t)"Stored data could not be deserialized!");
    }
    return v0;
  }
  __break(1u);
  return result;
}

uint64_t AceObjectStreamAccessor.retrieve(interactionId:)(uint64_t a1, uint64_t a2)
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
  unint64_t v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[2];

  v6 = *(_QWORD *)v2;
  v7 = (*(uint64_t (**)(void))(*(_QWORD *)v2 + 120))();
  if (!v3)
  {
    v19[1] = v7;
    MEMORY[0x24BDAC7A8](v7);
    v16 = *(_QWORD *)(v6 + 144);
    v17 = a1;
    v18 = a2;
    v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [InteractionWrapper<Data>]);
    v11 = type metadata accessor for InteractionWrapper(0, v16, v9, v10);
    v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
    v13 = lazy protocol witness table accessor for type [InteractionWrapper<Data>] and conformance [A]();
    v2 = _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lF((void (*)(char *, char *))partial apply for closure #1 in AceObjectStreamAccessor.retrieve(interactionId:), (uint64_t)&v15, v8, v11, v12, v13, MEMORY[0x24BEE3F20], (uint64_t)v19);
    swift_bridgeObjectRelease();
  }
  return v2;
}

uint64_t partial apply for closure #1 in AceObjectStreamAccessor.retrieve(interactionId:)(double *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  uint64_t v18;
  uint64_t v19;

  v6 = v4[2];
  v7 = v4[3];
  v8 = v4[4];
  v9 = a1[2];
  v10 = *((_QWORD *)a1 + 3);
  v11 = *((_QWORD *)a1 + 4);
  v12 = type metadata accessor for AceObjectFeatureWrapper(0, v6, a3, a4);
  if ((*(uint64_t (**)(uint64_t, uint64_t, _QWORD, uint64_t, uint64_t))(v12 + 128))(v10, v11, 0, v7, v8))
  {
    swift_bridgeObjectRetain();
    swift_unknownObjectRetain();
    v13 = OUTLINED_FUNCTION_1_4();
    InteractionWrapper.init(interactionId:timestamp:feature:)(v13, v14, v15, v6, v16, v9);
    return swift_release();
  }
  else
  {
    lazy protocol witness table accessor for type FeatureStoreError and conformance FeatureStoreError();
    v18 = OUTLINED_FUNCTION_2();
    result = OUTLINED_FUNCTION_0_6(v19, (uint64_t)"Stored data could not be deserialized!");
    *a2 = v18;
  }
  return result;
}

uint64_t type metadata accessor for AceObjectStreamAccessor(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for AceObjectStreamAccessor);
}

uint64_t vtable thunk for BaseStreamAccessor.insert(interactionId:feature:) dispatching to AceObjectStreamAccessor.insert(interactionId:feature:)(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4)
{
  return AceObjectStreamAccessor.insert(interactionId:feature:)(a1, a2, *a3, a4);
}

uint64_t vtable thunk for BaseStreamAccessor.retrieve(interactionId:) dispatching to AceObjectStreamAccessor.retrieve(interactionId:)@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  result = AceObjectStreamAccessor.retrieve(interactionId:)();
  if (!v1)
    *a1 = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_1_4()
{
  uint64_t v0;

  return v0;
}

uint64_t PBCodableStreamAccessor.insert(interactionId:feature:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t *v9;
  void *v10;
  id v11;
  id v12;
  id v14[2];

  v5 = v4;
  v14[1] = *(id *)MEMORY[0x24BDAC8D0];
  type metadata accessor for PBCodableFeatureWrapper(0, *(_QWORD *)(*v5 + 144), (uint64_t)a3, a4);
  swift_bridgeObjectRetain();
  v9 = AceObjectFeatureWrapper.__allocating_init(interactionId:dataVersion:feature:)(a1, a2, 0, (uint64_t)a3);
  v10 = (void *)v5[2];
  v14[0] = 0;
  if ((objc_msgSend(v10, sel_insert_error_, v9, v14) & 1) != 0)
  {
    v11 = v14[0];
  }
  else
  {
    v12 = v14[0];
    _convertNSErrorToError(_:)();

    swift_willThrow();
  }
  return OUTLINED_FUNCTION_2_4();
}

uint64_t PBCodableStreamAccessor.retrieve(interactionId:)()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  id v14;
  uint64_t v15;

  v2 = *v0;
  result = (*(uint64_t (**)(void))(*v0 + 112))();
  if (!v1)
  {
    v6 = result;
    result = type metadata accessor for PBCodableFeatureWrapper(0, *(_QWORD *)(v2 + 144), v4, v5);
    if (*(_QWORD *)(v6 + 16))
    {
      v7 = OUTLINED_FUNCTION_1_4();
      outlined copy of Data._Representation(v7, v8);
      swift_bridgeObjectRelease();
      v9 = OUTLINED_FUNCTION_1_4();
      v11 = v10(v9);
      v12 = OUTLINED_FUNCTION_1_4();
      outlined consume of Data._Representation(v12, v13);
      if (v11)
      {
        v14 = *(id *)(v11 + 16);
        OUTLINED_FUNCTION_2_4();
        return (uint64_t)v14;
      }
      else
      {
        lazy protocol witness table accessor for type FeatureStoreError and conformance FeatureStoreError();
        OUTLINED_FUNCTION_2();
        return OUTLINED_FUNCTION_0_6(v15, (uint64_t)"Stored data could not be deserialized!");
      }
    }
    else
    {
      __break(1u);
    }
  }
  return result;
}

uint64_t PBCodableStreamAccessor.retrieve(interactionId:)(uint64_t a1, uint64_t a2)
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
  unint64_t v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[2];

  v6 = *(_QWORD *)v2;
  v7 = (*(uint64_t (**)(void))(*(_QWORD *)v2 + 120))();
  if (!v3)
  {
    v19[1] = v7;
    MEMORY[0x24BDAC7A8](v7);
    v16 = *(_QWORD *)(v6 + 144);
    v17 = a1;
    v18 = a2;
    v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [InteractionWrapper<Data>]);
    v11 = type metadata accessor for InteractionWrapper(0, v16, v9, v10);
    v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
    v13 = lazy protocol witness table accessor for type [InteractionWrapper<Data>] and conformance [A]();
    v2 = _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lF((void (*)(char *, char *))partial apply for closure #1 in PBCodableStreamAccessor.retrieve(interactionId:), (uint64_t)&v15, v8, v11, v12, v13, MEMORY[0x24BEE3F20], (uint64_t)v19);
    swift_bridgeObjectRelease();
  }
  return v2;
}

uint64_t partial apply for closure #1 in PBCodableStreamAccessor.retrieve(interactionId:)(double *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;
  uint64_t v21;
  uint64_t v22;

  v6 = v4[2];
  v7 = v4[3];
  v8 = v4[4];
  v9 = a1[2];
  v10 = *((_QWORD *)a1 + 3);
  v11 = *((_QWORD *)a1 + 4);
  v12 = type metadata accessor for PBCodableFeatureWrapper(0, v6, a3, a4);
  v13 = (*(uint64_t (**)(uint64_t, uint64_t, _QWORD, uint64_t, uint64_t))(v12 + 128))(v10, v11, 0, v7, v8);
  if (v13)
  {
    v14 = *(void **)(v13 + 16);
    swift_bridgeObjectRetain();
    v15 = v14;
    v16 = OUTLINED_FUNCTION_1_4();
    InteractionWrapper.init(interactionId:timestamp:feature:)(v16, v17, v18, v6, v19, v9);
    return OUTLINED_FUNCTION_2_4();
  }
  else
  {
    lazy protocol witness table accessor for type FeatureStoreError and conformance FeatureStoreError();
    v21 = OUTLINED_FUNCTION_2();
    result = OUTLINED_FUNCTION_0_6(v22, (uint64_t)"Stored data could not be deserialized!");
    *a2 = v21;
  }
  return result;
}

uint64_t type metadata accessor for PBCodableStreamAccessor(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for PBCodableStreamAccessor);
}

uint64_t vtable thunk for BaseStreamAccessor.insert(interactionId:feature:) dispatching to PBCodableStreamAccessor.insert(interactionId:feature:)(uint64_t a1, uint64_t a2, void **a3, uint64_t a4)
{
  return PBCodableStreamAccessor.insert(interactionId:feature:)(a1, a2, *a3, a4);
}

uint64_t vtable thunk for BaseStreamAccessor.retrieve(interactionId:) dispatching to PBCodableStreamAccessor.retrieve(interactionId:)@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  result = PBCodableStreamAccessor.retrieve(interactionId:)();
  if (!v1)
    *a1 = result;
  return result;
}

uint64_t SerializableFeatureWrapper.serialize()()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(*(_QWORD *)(*(_QWORD *)v0 + 152) + 16))(*(_QWORD *)(*(_QWORD *)v0 + 144));
}

Class @objc SerializableFeatureWrapper.serialize()()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t v2;
  Class isa;

  swift_retain();
  v0 = SerializableFeatureWrapper.serialize()();
  v2 = v1;
  swift_release();
  if (v2 >> 60 == 15)
  {
    isa = 0;
  }
  else
  {
    isa = Data._bridgeToObjectiveC()().super.isa;
    outlined consume of Data?(v0, v2);
  }
  return isa;
}

uint64_t static SerializableFeatureWrapper.deserialize(_:dataVersion:interactionId:)(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
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
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t result;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v25 = a5;
  v23 = a4;
  v24 = a3;
  v27 = a1;
  v28 = a2;
  v6 = *(_QWORD *)(v5 + 144);
  v22 = type metadata accessor for Optional();
  v7 = *(_QWORD *)(v22 - 8);
  MEMORY[0x24BDAC7A8](v22);
  v9 = (char *)&v21 - v8;
  v26 = v5;
  v10 = *(_QWORD *)(v5 + 152);
  swift_getAssociatedTypeWitness();
  v11 = type metadata accessor for Optional();
  v12 = MEMORY[0x24BDAC7A8](v11);
  v13 = *(_QWORD *)(v6 - 8);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v21 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v21 - v17;
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 24))(v27, v28, v6, v10);
  if (swift_dynamicCast())
  {
    OUTLINED_FUNCTION_0_14((uint64_t)v9, 0);
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v18, v9, v6);
    type metadata accessor for SerializableFeatureWrapper(0, v6, v10, v19);
    (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v16, v18, v6);
    swift_bridgeObjectRetain();
    SerializableFeatureWrapper.__allocating_init(interactionId:dataVersion:feature:)();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v18, v6);
    result = swift_dynamicCastClass();
    if (result)
      return result;
    swift_release();
  }
  else
  {
    OUTLINED_FUNCTION_0_14((uint64_t)v9, 1);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v22);
  }
  return 0;
}

uint64_t type metadata accessor for SerializableFeatureWrapper(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for SerializableFeatureWrapper);
}

uint64_t *SerializableFeatureWrapper.__allocating_init(interactionId:dataVersion:feature:)()
{
  OUTLINED_FUNCTION_1_5();
  swift_allocObject();
  return SerializableFeatureWrapper.init(interactionId:dataVersion:feature:)();
}

id @objc static SerializableFeatureWrapper.deserialize(_:dataVersion:interactionId:)(uint64_t a1, uint64_t a2, void *a3, int a4, void *a5)
{
  id v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  v7 = a3;
  v8 = a5;
  v9 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  v11 = v10;

  v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v14 = v13;

  swift_getObjCClassMetadata();
  v15 = (void *)static SerializableFeatureWrapper.deserialize(_:dataVersion:interactionId:)(v9, v11, a4, v12, v14);
  swift_bridgeObjectRelease();
  outlined consume of Data._Representation(v9, v11);
  return v15;
}

id @objc SerializableFeatureWrapper.json()()
{
  return 0;
}

uint64_t *SerializableFeatureWrapper.init(interactionId:dataVersion:feature:)()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v13;

  OUTLINED_FUNCTION_1_5();
  v5 = *(_QWORD *)(*(_QWORD *)v1 + 144);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v9, v10, v5);
  v11 = BaseFeatureWrapper.init(interactionId:dataVersion:feature:)(v4, v3, v2, (uint64_t)v9);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v0, v5);
  return v11;
}

uint64_t SerializableFeatureWrapper.__deallocating_deinit()
{
  BaseFeatureWrapper.deinit();
  return swift_deallocClassInstance();
}

uint64_t OUTLINED_FUNCTION_0_14(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v2);
}

id BaseStreamAccessor.stream.getter()
{
  uint64_t v0;

  return *(id *)(v0 + 16);
}

void BaseStreamAccessor.__allocating_init(identifier:)(uint64_t a1, uint64_t a2)
{
  swift_allocObject();
  BaseStreamAccessor.init(identifier:)(a1, a2);
  OUTLINED_FUNCTION_1_1();
}

void BaseStreamAccessor.init(identifier:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  id v6;
  id v7;

  v3 = v2;
  v6 = objc_allocWithZone((Class)FSFCurareInteractionStream);
  v7 = @nonobjc FSFCurareInteractionStream.init(streamId:sourceType:)(a1, a2, 0);
  if (v7)
  {
    *(_QWORD *)(v3 + 16) = v7;
    OUTLINED_FUNCTION_1_1();
  }
  else
  {
    __break(1u);
  }
}

void BaseStreamAccessor.insert(interactionId:feature:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  Swift::String v3;

  OUTLINED_FUNCTION_1_6();
  _StringGuts.grow(_:)(47);
  swift_bridgeObjectRelease();
  v3._countAndFlagsBits = OUTLINED_FUNCTION_3_10();
  OUTLINED_FUNCTION_5_10(v3);
  OUTLINED_FUNCTION_18_1();
  OUTLINED_FUNCTION_2_9();
  OUTLINED_FUNCTION_11_4();
  OUTLINED_FUNCTION_2();
  *(_QWORD *)v2 = v0;
  *(_QWORD *)(v2 + 8) = v1;
  *(_BYTE *)(v2 + 16) = 1;
  swift_willThrow();
  OUTLINED_FUNCTION_7_9();
}

uint64_t BaseStreamAccessor.retrieveSerializedInteractions(interactionId:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v5;
  uint64_t inited;
  Class isa;
  id v8;
  uint64_t v9;
  uint64_t v11;
  const char *v12;
  _BYTE v13[40];
  __int128 v14;
  uint64_t v15;

  v5 = *(void **)(v2 + 16);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_212575370;
  *(_QWORD *)(inited + 32) = a1;
  *(_QWORD *)(inited + 40) = a2;
  swift_bridgeObjectRetain();
  specialized Set.init(_nonEmptyArrayLiteral:)(inited);
  isa = Set._bridgeToObjectiveC()().super.isa;
  OUTLINED_FUNCTION_25_1();
  v8 = objc_msgSend(v5, sel_retrieve_, isa);

  if (!v8)
    goto LABEL_7;
  v9 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  if (!*(_QWORD *)(v9 + 16))
  {
    OUTLINED_FUNCTION_25_1();
LABEL_7:
    lazy protocol witness table accessor for type FeatureStoreError and conformance FeatureStoreError();
    OUTLINED_FUNCTION_2();
    *(_QWORD *)v11 = 0xD000000000000014;
    v12 = "Item does not exist!";
    goto LABEL_10;
  }
  swift_bridgeObjectRetain();
  AnyHashable.init<A>(_:)();
  specialized Dictionary.subscript.getter((uint64_t)v13, v9, &v14);
  OUTLINED_FUNCTION_25_1();
  outlined destroy of AnyHashable((uint64_t)v13);
  if (v15)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [Data]);
    if ((swift_dynamicCast() & 1) != 0)
      return a1;
  }
  else
  {
    outlined destroy of Any?((uint64_t)&v14);
  }
  lazy protocol witness table accessor for type FeatureStoreError and conformance FeatureStoreError();
  OUTLINED_FUNCTION_2();
  *(_QWORD *)v11 = 0xD000000000000018;
  v12 = "Stored item is not Data!";
LABEL_10:
  *(_QWORD *)(v11 + 8) = (unint64_t)(v12 - 32) | 0x8000000000000000;
  *(_BYTE *)(v11 + 16) = 0;
  return swift_willThrow();
}

double specialized Dictionary.subscript.getter@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  unint64_t v5;
  char v6;
  double result;

  if (*(_QWORD *)(a2 + 16) && (v5 = specialized __RawDictionaryStorage.find<A>(_:)(a1), (v6 & 1) != 0))
  {
    outlined init with copy of Any(*(_QWORD *)(a2 + 56) + 32 * v5, (uint64_t)a3);
  }
  else
  {
    result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

uint64_t specialized Dictionary.subscript.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3;

  if (*(_QWORD *)(a3 + 16) && (specialized __RawDictionaryStorage.find<A>(_:)(a1, a2), (v3 & 1) != 0))
    return swift_bridgeObjectRetain();
  else
    return 0;
}

_QWORD *BaseStreamAccessor.retrieveSerializedInteractions(interactionId:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t inited;
  Class isa;
  id v8;
  unint64_t v9;
  uint64_t v10;
  _QWORD *result;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  double v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  unint64_t v29;
  unint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  _QWORD *v33;
  __int128 v34;
  unint64_t v35;
  unint64_t v36;
  _QWORD v37[2];
  _QWORD v38[3];
  __int128 v39;
  _QWORD *v40;

  v5 = *(_QWORD **)(v2 + 16);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_212575370;
  *(_QWORD *)(inited + 32) = a1;
  *(_QWORD *)(inited + 40) = a2;
  swift_bridgeObjectRetain();
  specialized Set.init(_nonEmptyArrayLiteral:)(inited);
  isa = Set._bridgeToObjectiveC()().super.isa;
  OUTLINED_FUNCTION_25_1();
  v8 = objc_msgSend(v5, sel_retrieveWithInteractionWrapper_, isa);

  if (!v8
    || (__swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [FSFFeatureStoreBiomeEvent]),
        v5 = (_QWORD *)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(),
        v8,
        swift_bridgeObjectRetain(),
        v9 = specialized Dictionary.subscript.getter(a1, a2, (uint64_t)v5),
        swift_bridgeObjectRelease(),
        swift_bridgeObjectRelease(),
        !v9))
  {
    lazy protocol witness table accessor for type FeatureStoreError and conformance FeatureStoreError();
    v32 = OUTLINED_FUNCTION_2();
    *v33 = 0xD000000000000014;
    v33[1] = 0x80000002125778F0;
    OUTLINED_FUNCTION_7_8(v32, (uint64_t)v33);
    return v5;
  }
  if (!(v9 >> 62))
  {
    v10 = *(_QWORD *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v10)
      goto LABEL_5;
    goto LABEL_16;
  }
  swift_bridgeObjectRetain();
  v10 = _CocoaArrayWrapper.endIndex.getter();
  OUTLINED_FUNCTION_38();
  if (!v10)
  {
LABEL_16:
    OUTLINED_FUNCTION_38();
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  }
LABEL_5:
  v40 = (_QWORD *)MEMORY[0x24BEE4AF8];
  result = specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, v10 & ~(v10 >> 63), 0);
  if ((v10 & 0x8000000000000000) == 0)
  {
    v12 = 0;
    v5 = v40;
    v35 = v9 & 0xC000000000000001;
    v36 = v9;
    do
    {
      if (v35)
        v13 = (id)MEMORY[0x212BEE3BC](v12, v9);
      else
        v13 = *(id *)(v9 + 8 * v12 + 32);
      v14 = v13;
      v15 = objc_msgSend(v13, sel_interactionId, v34);
      v16 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v18 = v17;

      objc_msgSend(v14, sel_timestamp);
      v20 = v19;
      v21 = objc_msgSend(v14, sel_featureData);
      v22 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
      v24 = v23;

      v37[0] = v22;
      v37[1] = v24;
      InteractionWrapper.init(interactionId:timestamp:feature:)(v16, v18, (uint64_t)v37, MEMORY[0x24BDCDDE8], (uint64_t)v38, v20);

      v25 = v38[0];
      v26 = v38[1];
      v27 = v38[2];
      v28 = v39;
      v40 = v5;
      v30 = v5[2];
      v29 = v5[3];
      if (v30 >= v29 >> 1)
      {
        v34 = v39;
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)((_QWORD *)(v29 > 1), v30 + 1, 1);
        v28 = v34;
        v5 = v40;
      }
      ++v12;
      v5[2] = v30 + 1;
      v31 = &v5[5 * v30];
      v31[4] = v25;
      v31[5] = v26;
      v31[6] = v27;
      *(_OWORD *)(v31 + 7) = v28;
      v9 = v36;
    }
    while (v10 != v12);
    OUTLINED_FUNCTION_38();
    return v5;
  }
  __break(1u);
  return result;
}

void BaseStreamAccessor.retrieve(interactionId:)()
{
  uint64_t v0;
  Swift::String v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  Swift::String v5;

  OUTLINED_FUNCTION_1_6();
  _StringGuts.grow(_:)(54);
  v1._object = (void *)0x8000000212577930;
  v1._countAndFlagsBits = 0xD000000000000033;
  String.append(_:)(v1);
  v5._countAndFlagsBits = OUTLINED_FUNCTION_3_10();
  OUTLINED_FUNCTION_5_10(v5);
  OUTLINED_FUNCTION_18_1();
  OUTLINED_FUNCTION_2_9();
  OUTLINED_FUNCTION_11_4();
  v2 = OUTLINED_FUNCTION_2();
  *v3 = &v4;
  v3[1] = v0;
  OUTLINED_FUNCTION_7_8(v2, (uint64_t)v3);
  OUTLINED_FUNCTION_7_9();
}

uint64_t BaseStreamAccessor.retrieve(interactionId:)()
{
  uint64_t v0;
  Swift::String v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v5;
  Swift::String v6;

  OUTLINED_FUNCTION_1_6();
  _StringGuts.grow(_:)(74);
  v1._object = (void *)0x8000000212577970;
  v1._countAndFlagsBits = 0xD000000000000047;
  String.append(_:)(v1);
  v6._countAndFlagsBits = OUTLINED_FUNCTION_3_10();
  OUTLINED_FUNCTION_5_10(v6);
  OUTLINED_FUNCTION_18_1();
  OUTLINED_FUNCTION_2_9();
  OUTLINED_FUNCTION_11_4();
  v2 = OUTLINED_FUNCTION_2();
  *v3 = &v5;
  v3[1] = v0;
  return OUTLINED_FUNCTION_7_8(v2, (uint64_t)v3);
}

uint64_t BaseStreamAccessor.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t BaseStreamAccessor.__deallocating_deinit()
{
  BaseStreamAccessor.deinit();
  return swift_deallocClassInstance();
}

id @nonobjc FSFCurareInteractionStream.init(streamId:sourceType:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v5;
  id v6;

  if (a2)
  {
    v5 = (void *)MEMORY[0x212BEE02C]();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  v6 = objc_msgSend(v3, sel_initWithStreamId_sourceType_, v5, a3);

  return v6;
}

uint64_t specialized Set.init(_nonEmptyArrayLiteral:)(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  BOOL v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  uint64_t v24;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = MEMORY[0x24BEE4B08];
    goto LABEL_25;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<String>);
  result = static _SetStorage.allocate(capacity:)();
  v3 = result;
  v24 = *(_QWORD *)(a1 + 16);
  if (!v24)
  {
LABEL_25:
    swift_bridgeObjectRelease();
    return v3;
  }
  v4 = 0;
  v5 = result + 56;
  while (v4 < *(_QWORD *)(a1 + 16))
  {
    v6 = (uint64_t *)(a1 + 32 + 16 * v4);
    v8 = *v6;
    v7 = v6[1];
    Hasher.init(_seed:)();
    swift_bridgeObjectRetain();
    String.hash(into:)();
    result = Hasher._finalize()();
    v9 = -1 << *(_BYTE *)(v3 + 32);
    v10 = result & ~v9;
    v11 = v10 >> 6;
    v12 = *(_QWORD *)(v5 + 8 * (v10 >> 6));
    v13 = 1 << v10;
    if (((1 << v10) & v12) != 0)
    {
      v14 = *(_QWORD *)(v3 + 48);
      v15 = (_QWORD *)(v14 + 16 * v10);
      v16 = *v15 == v8 && v15[1] == v7;
      if (v16 || (result = _stringCompareWithSmolCheck(_:_:expecting:)(), (result & 1) != 0))
      {
LABEL_11:
        result = swift_bridgeObjectRelease();
        goto LABEL_22;
      }
      v17 = ~v9;
      while (1)
      {
        v10 = (v10 + 1) & v17;
        v11 = v10 >> 6;
        v12 = *(_QWORD *)(v5 + 8 * (v10 >> 6));
        v13 = 1 << v10;
        if ((v12 & (1 << v10)) == 0)
          break;
        v18 = (_QWORD *)(v14 + 16 * v10);
        if (*v18 != v8 || v18[1] != v7)
        {
          result = _stringCompareWithSmolCheck(_:_:expecting:)();
          if ((result & 1) == 0)
            continue;
        }
        goto LABEL_11;
      }
    }
    *(_QWORD *)(v5 + 8 * v11) = v13 | v12;
    v20 = (_QWORD *)(*(_QWORD *)(v3 + 48) + 16 * v10);
    *v20 = v8;
    v20[1] = v7;
    v21 = *(_QWORD *)(v3 + 16);
    v22 = __OFADD__(v21, 1);
    v23 = v21 + 1;
    if (v22)
      goto LABEL_27;
    *(_QWORD *)(v3 + 16) = v23;
LABEL_22:
    if (++v4 == v24)
      goto LABEL_25;
  }
  __break(1u);
LABEL_27:
  __break(1u);
  return result;
}

uint64_t outlined destroy of Any?(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Any?);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

_QWORD *specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(_QWORD *a1, int64_t a2, char a3)
{
  _QWORD **v3;
  _QWORD *result;

  result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

uint64_t type metadata completion function for BaseStreamAccessor()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for BaseStreamAccessor(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for BaseStreamAccessor);
}

_QWORD *specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  size_t v11;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
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
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<InteractionWrapper<Data>>);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || &a4[5 * v8 + 4] <= v10 + 4)
      memmove(v10 + 4, a4 + 4, 40 * v8);
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for InteractionWrapper<Data>);
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

void OUTLINED_FUNCTION_2_9()
{
  Swift::String v0;

  v0._countAndFlagsBits = 33;
  v0._object = (void *)0xE100000000000000;
  String.append(_:)(v0);
}

uint64_t OUTLINED_FUNCTION_3_10()
{
  return _typeName(_:qualified:)();
}

void OUTLINED_FUNCTION_5_10(Swift::String a1)
{
  String.append(_:)(a1);
}

unint64_t OUTLINED_FUNCTION_11_4()
{
  return lazy protocol witness table accessor for type FeatureStoreError and conformance FeatureStoreError();
}

uint64_t FeatureStoreNSCodingAccessor.insert(interactionId:feature:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t *v9;
  void *v10;
  id v11;
  id v12;
  id v14[2];

  v5 = v4;
  v14[1] = *(id *)MEMORY[0x24BDAC8D0];
  type metadata accessor for NSCodingFeatureWrapper(0, *(_QWORD *)(*v5 + 144), (uint64_t)a3, a4);
  swift_bridgeObjectRetain();
  v9 = AceObjectFeatureWrapper.__allocating_init(interactionId:dataVersion:feature:)(a1, a2, 0, (uint64_t)a3);
  v10 = (void *)v5[2];
  v14[0] = 0;
  if ((objc_msgSend(v10, sel_insert_error_, v9, v14) & 1) != 0)
  {
    v11 = v14[0];
  }
  else
  {
    v12 = v14[0];
    _convertNSErrorToError(_:)();

    swift_willThrow();
  }
  return OUTLINED_FUNCTION_2_4();
}

uint64_t FeatureStoreNSCodingAccessor.retrieve(interactionId:)()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  id v14;
  uint64_t v15;

  v2 = *v0;
  result = (*(uint64_t (**)(void))(*v0 + 112))();
  if (!v1)
  {
    v6 = result;
    result = type metadata accessor for NSCodingFeatureWrapper(0, *(_QWORD *)(v2 + 144), v4, v5);
    if (*(_QWORD *)(v6 + 16))
    {
      v7 = OUTLINED_FUNCTION_1_4();
      outlined copy of Data._Representation(v7, v8);
      swift_bridgeObjectRelease();
      v9 = OUTLINED_FUNCTION_1_4();
      v11 = v10(v9);
      v12 = OUTLINED_FUNCTION_1_4();
      outlined consume of Data._Representation(v12, v13);
      if (v11)
      {
        v14 = *(id *)(v11 + 16);
        OUTLINED_FUNCTION_2_4();
        return (uint64_t)v14;
      }
      else
      {
        lazy protocol witness table accessor for type FeatureStoreError and conformance FeatureStoreError();
        OUTLINED_FUNCTION_2();
        return OUTLINED_FUNCTION_0_6(v15, (uint64_t)"Stored data could not be deserialized!");
      }
    }
    else
    {
      __break(1u);
    }
  }
  return result;
}

uint64_t FeatureStoreNSCodingAccessor.retrieve(interactionId:)(uint64_t a1, uint64_t a2)
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
  unint64_t v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[2];

  v6 = *(_QWORD *)v2;
  v7 = (*(uint64_t (**)(void))(*(_QWORD *)v2 + 120))();
  if (!v3)
  {
    v19[1] = v7;
    MEMORY[0x24BDAC7A8](v7);
    v16 = *(_QWORD *)(v6 + 144);
    v17 = a1;
    v18 = a2;
    v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [InteractionWrapper<Data>]);
    v11 = type metadata accessor for InteractionWrapper(0, v16, v9, v10);
    v12 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Error);
    v13 = lazy protocol witness table accessor for type [InteractionWrapper<Data>] and conformance [A]();
    v2 = _sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lF((void (*)(char *, char *))partial apply for closure #1 in FeatureStoreNSCodingAccessor.retrieve(interactionId:), (uint64_t)&v15, v8, v11, v12, v13, MEMORY[0x24BEE3F20], (uint64_t)v19);
    swift_bridgeObjectRelease();
  }
  return v2;
}

uint64_t partial apply for closure #1 in FeatureStoreNSCodingAccessor.retrieve(interactionId:)(double *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;
  uint64_t v21;
  uint64_t v22;

  v6 = v4[2];
  v7 = v4[3];
  v8 = v4[4];
  v9 = a1[2];
  v10 = *((_QWORD *)a1 + 3);
  v11 = *((_QWORD *)a1 + 4);
  v12 = type metadata accessor for NSCodingFeatureWrapper(0, v6, a3, a4);
  v13 = (*(uint64_t (**)(uint64_t, uint64_t, _QWORD, uint64_t, uint64_t))(v12 + 128))(v10, v11, 0, v7, v8);
  if (v13)
  {
    v14 = *(void **)(v13 + 16);
    swift_bridgeObjectRetain();
    v15 = v14;
    v16 = OUTLINED_FUNCTION_1_4();
    InteractionWrapper.init(interactionId:timestamp:feature:)(v16, v17, v18, v6, v19, v9);
    return OUTLINED_FUNCTION_2_4();
  }
  else
  {
    lazy protocol witness table accessor for type FeatureStoreError and conformance FeatureStoreError();
    v21 = OUTLINED_FUNCTION_2();
    result = OUTLINED_FUNCTION_0_6(v22, (uint64_t)"Stored data could not be deserialized!");
    *a2 = v21;
  }
  return result;
}

uint64_t type metadata accessor for FeatureStoreNSCodingAccessor(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for FeatureStoreNSCodingAccessor);
}

uint64_t vtable thunk for BaseStreamAccessor.insert(interactionId:feature:) dispatching to FeatureStoreNSCodingAccessor.insert(interactionId:feature:)(uint64_t a1, uint64_t a2, void **a3, uint64_t a4)
{
  return FeatureStoreNSCodingAccessor.insert(interactionId:feature:)(a1, a2, *a3, a4);
}

uint64_t vtable thunk for BaseStreamAccessor.retrieve(interactionId:) dispatching to FeatureStoreNSCodingAccessor.retrieve(interactionId:)@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  result = FeatureStoreNSCodingAccessor.retrieve(interactionId:)();
  if (!v1)
    *a1 = result;
  return result;
}

NSDataCompressionAlgorithm_optional __swiftcall CompressionPolicy.compressionAlgorithm()()
{
  unsigned __int8 *v0;
  NSDataCompressionAlgorithm v1;
  Swift::Bool v2;
  NSDataCompressionAlgorithm_optional result;

  v1 = ((uint64_t (*)())((char *)sub_21256D650 + 4 * byte_212575CA0[*v0]))();
  result.value = v1;
  result.is_nil = v2;
  return result;
}

uint64_t sub_21256D650()
{
  return 0;
}

uint64_t sub_21256D65C()
{
  return 1;
}

uint64_t sub_21256D668()
{
  return 2;
}

uint64_t sub_21256D674()
{
  return 3;
}

BOOL static CompressionPolicy.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

void CompressionPolicy.hash(into:)()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
  OUTLINED_FUNCTION_20_1();
}

BOOL static CompressionPolicy.CodingKeys.== infix(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

void CompressionPolicy.CodingKeys.hash(into:)(uint64_t a1, unsigned __int8 a2)
{
  Hasher._combine(_:)(a2);
  OUTLINED_FUNCTION_20_1();
}

uint64_t CompressionPolicy.CodingKeys.init(stringValue:)(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  BOOL v6;
  BOOL v7;
  BOOL v8;
  char v10;

  v3 = a1 == 0x6D6F43746F4E6F64 && a2 == 0xED00007373657270;
  if (v3 || (OUTLINED_FUNCTION_7_10() & 1) != 0)
  {
    OUTLINED_FUNCTION_18_1();
    return 0;
  }
  else
  {
    v6 = a1 == 0x6573667A6CLL && a2 == 0xE500000000000000;
    if (v6 || (OUTLINED_FUNCTION_7_10() & 1) != 0)
    {
      OUTLINED_FUNCTION_18_1();
      return 1;
    }
    else
    {
      v7 = a1 == 3439212 && a2 == 0xE300000000000000;
      if (v7 || (OUTLINED_FUNCTION_7_10() & 1) != 0)
      {
        OUTLINED_FUNCTION_18_1();
        return 2;
      }
      else
      {
        v8 = a1 == 1634564716 && a2 == 0xE400000000000000;
        if (v8 || (OUTLINED_FUNCTION_7_10() & 1) != 0)
        {
          OUTLINED_FUNCTION_18_1();
          return 3;
        }
        else if (a1 == 1651076218 && a2 == 0xE400000000000000)
        {
          OUTLINED_FUNCTION_18_1();
          return 4;
        }
        else
        {
          v10 = OUTLINED_FUNCTION_7_10();
          OUTLINED_FUNCTION_18_1();
          if ((v10 & 1) != 0)
            return 4;
          else
            return 5;
        }
      }
    }
  }
}

void CompressionPolicy.CodingKeys.hashValue.getter(unsigned __int8 a1)
{
  OUTLINED_FUNCTION_48_0();
  Hasher._combine(_:)(a1);
  OUTLINED_FUNCTION_47_0();
  OUTLINED_FUNCTION_28_1();
}

uint64_t CompressionPolicy.CodingKeys.stringValue.getter(char a1)
{
  return *(_QWORD *)&aDonotcomlzfse[8 * a1];
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance CompressionPolicy.CodingKeys(char *a1, char *a2)
{
  return static CompressionPolicy.CodingKeys.== infix(_:_:)(*a1, *a2);
}

void protocol witness for Hashable.hashValue.getter in conformance CompressionPolicy.CodingKeys()
{
  unsigned __int8 *v0;

  CompressionPolicy.CodingKeys.hashValue.getter(*v0);
}

void protocol witness for Hashable.hash(into:) in conformance CompressionPolicy.CodingKeys(uint64_t a1)
{
  unsigned __int8 *v1;

  CompressionPolicy.CodingKeys.hash(into:)(a1, *v1);
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance CompressionPolicy.CodingKeys()
{
  char *v0;

  return CompressionPolicy.CodingKeys.stringValue.getter(*v0);
}

void protocol witness for CodingKey.init(stringValue:) in conformance CompressionPolicy.CodingKeys(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  *a3 = CompressionPolicy.CodingKeys.init(stringValue:)(a1, a2);
  OUTLINED_FUNCTION_20_1();
}

void protocol witness for CodingKey.init(intValue:) in conformance CompressionPolicy.CodingKeys(_BYTE *a1@<X8>)
{
  *a1 = 5;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance CompressionPolicy.CodingKeys()
{
  lazy protocol witness table accessor for type CompressionPolicy.CodingKeys and conformance CompressionPolicy.CodingKeys();
  OUTLINED_FUNCTION_9_9();
  return OUTLINED_FUNCTION_0_15();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance CompressionPolicy.CodingKeys()
{
  lazy protocol witness table accessor for type CompressionPolicy.CodingKeys and conformance CompressionPolicy.CodingKeys();
  OUTLINED_FUNCTION_9_9();
  return OUTLINED_FUNCTION_1_7();
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance CompressionPolicy.DoNotCompressCodingKeys()
{
  lazy protocol witness table accessor for type CompressionPolicy.DoNotCompressCodingKeys and conformance CompressionPolicy.DoNotCompressCodingKeys();
  OUTLINED_FUNCTION_9_9();
  return OUTLINED_FUNCTION_0_15();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance CompressionPolicy.DoNotCompressCodingKeys()
{
  lazy protocol witness table accessor for type CompressionPolicy.DoNotCompressCodingKeys and conformance CompressionPolicy.DoNotCompressCodingKeys();
  OUTLINED_FUNCTION_9_9();
  return OUTLINED_FUNCTION_1_7();
}

void protocol witness for CodingKey.init(stringValue:) in conformance CompressionPolicy.Lz4CodingKeys(uint64_t a1@<X1>, _BYTE *a2@<X8>)
{
  CompressionPolicy.Lz4CodingKeys.init(stringValue:)(a1);
  *a2 = 1;
  OUTLINED_FUNCTION_20_1();
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance CompressionPolicy.Lz4CodingKeys()
{
  lazy protocol witness table accessor for type CompressionPolicy.Lz4CodingKeys and conformance CompressionPolicy.Lz4CodingKeys();
  OUTLINED_FUNCTION_9_9();
  return OUTLINED_FUNCTION_0_15();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance CompressionPolicy.Lz4CodingKeys()
{
  lazy protocol witness table accessor for type CompressionPolicy.Lz4CodingKeys and conformance CompressionPolicy.Lz4CodingKeys();
  OUTLINED_FUNCTION_9_9();
  return OUTLINED_FUNCTION_1_7();
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance CompressionPolicy.LzfseCodingKeys()
{
  lazy protocol witness table accessor for type CompressionPolicy.LzfseCodingKeys and conformance CompressionPolicy.LzfseCodingKeys();
  OUTLINED_FUNCTION_9_9();
  return OUTLINED_FUNCTION_0_15();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance CompressionPolicy.LzfseCodingKeys()
{
  lazy protocol witness table accessor for type CompressionPolicy.LzfseCodingKeys and conformance CompressionPolicy.LzfseCodingKeys();
  OUTLINED_FUNCTION_9_9();
  return OUTLINED_FUNCTION_1_7();
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance CompressionPolicy.LzmaCodingKeys()
{
  lazy protocol witness table accessor for type CompressionPolicy.LzmaCodingKeys and conformance CompressionPolicy.LzmaCodingKeys();
  OUTLINED_FUNCTION_9_9();
  return OUTLINED_FUNCTION_0_15();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance CompressionPolicy.LzmaCodingKeys()
{
  lazy protocol witness table accessor for type CompressionPolicy.LzmaCodingKeys and conformance CompressionPolicy.LzmaCodingKeys();
  OUTLINED_FUNCTION_9_9();
  return OUTLINED_FUNCTION_1_7();
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance CompressionPolicy.ZlibCodingKeys()
{
  lazy protocol witness table accessor for type CompressionPolicy.ZlibCodingKeys and conformance CompressionPolicy.ZlibCodingKeys();
  OUTLINED_FUNCTION_9_9();
  return OUTLINED_FUNCTION_0_15();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance CompressionPolicy.ZlibCodingKeys()
{
  lazy protocol witness table accessor for type CompressionPolicy.ZlibCodingKeys and conformance CompressionPolicy.ZlibCodingKeys();
  OUTLINED_FUNCTION_9_9();
  return OUTLINED_FUNCTION_1_7();
}

void CompressionPolicy.encode(to:)()
{
  unsigned __int8 *v0;
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

  OUTLINED_FUNCTION_41_1();
  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<CompressionPolicy.ZlibCodingKeys>);
  OUTLINED_FUNCTION_8_6();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_8_3();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<CompressionPolicy.LzmaCodingKeys>);
  OUTLINED_FUNCTION_8_6();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_34_1(v5, v11);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<CompressionPolicy.Lz4CodingKeys>);
  OUTLINED_FUNCTION_8_6();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_8_3();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<CompressionPolicy.LzfseCodingKeys>);
  OUTLINED_FUNCTION_8_6();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_8_3();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<CompressionPolicy.DoNotCompressCodingKeys>);
  OUTLINED_FUNCTION_7_4();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_8();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<CompressionPolicy.CodingKeys>);
  OUTLINED_FUNCTION_8_6();
  MEMORY[0x24BDAC7A8](v9);
  v10 = *v0;
  __swift_project_boxed_opaque_existential_1Tm(v2, v2[3]);
  lazy protocol witness table accessor for type CompressionPolicy.CodingKeys and conformance CompressionPolicy.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  __asm { BR              X9 }
}

void sub_21256DC50()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_BYTE *)(v4 - 69) = 0;
  lazy protocol witness table accessor for type CompressionPolicy.DoNotCompressCodingKeys and conformance CompressionPolicy.DoNotCompressCodingKeys();
  v5 = *(_QWORD *)(v4 - 88);
  KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v3, v0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 96) + 8))(v1, v5);
  OUTLINED_FUNCTION_1_2();
}

unint64_t lazy protocol witness table accessor for type CompressionPolicy.CodingKeys and conformance CompressionPolicy.CodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CompressionPolicy.CodingKeys and conformance CompressionPolicy.CodingKeys;
  if (!lazy protocol witness table cache variable for type CompressionPolicy.CodingKeys and conformance CompressionPolicy.CodingKeys)
  {
    result = MEMORY[0x212BEEBCC](&protocol conformance descriptor for CompressionPolicy.CodingKeys, &unk_24CDD36F8);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CompressionPolicy.CodingKeys and conformance CompressionPolicy.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CompressionPolicy.CodingKeys and conformance CompressionPolicy.CodingKeys;
  if (!lazy protocol witness table cache variable for type CompressionPolicy.CodingKeys and conformance CompressionPolicy.CodingKeys)
  {
    result = MEMORY[0x212BEEBCC]("uՅ:d6", &unk_24CDD36F8);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CompressionPolicy.CodingKeys and conformance CompressionPolicy.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CompressionPolicy.CodingKeys and conformance CompressionPolicy.CodingKeys;
  if (!lazy protocol witness table cache variable for type CompressionPolicy.CodingKeys and conformance CompressionPolicy.CodingKeys)
  {
    result = MEMORY[0x212BEEBCC](&protocol conformance descriptor for CompressionPolicy.CodingKeys, &unk_24CDD36F8);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CompressionPolicy.CodingKeys and conformance CompressionPolicy.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CompressionPolicy.CodingKeys and conformance CompressionPolicy.CodingKeys;
  if (!lazy protocol witness table cache variable for type CompressionPolicy.CodingKeys and conformance CompressionPolicy.CodingKeys)
  {
    result = MEMORY[0x212BEEBCC](&protocol conformance descriptor for CompressionPolicy.CodingKeys, &unk_24CDD36F8);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CompressionPolicy.CodingKeys and conformance CompressionPolicy.CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type CompressionPolicy.ZlibCodingKeys and conformance CompressionPolicy.ZlibCodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CompressionPolicy.ZlibCodingKeys and conformance CompressionPolicy.ZlibCodingKeys;
  if (!lazy protocol witness table cache variable for type CompressionPolicy.ZlibCodingKeys and conformance CompressionPolicy.ZlibCodingKeys)
  {
    result = MEMORY[0x212BEEBCC](&protocol conformance descriptor for CompressionPolicy.ZlibCodingKeys, &unk_24CDD3798);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CompressionPolicy.ZlibCodingKeys and conformance CompressionPolicy.ZlibCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CompressionPolicy.ZlibCodingKeys and conformance CompressionPolicy.ZlibCodingKeys;
  if (!lazy protocol witness table cache variable for type CompressionPolicy.ZlibCodingKeys and conformance CompressionPolicy.ZlibCodingKeys)
  {
    result = MEMORY[0x212BEEBCC]("U؅:89", &unk_24CDD3798);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CompressionPolicy.ZlibCodingKeys and conformance CompressionPolicy.ZlibCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CompressionPolicy.ZlibCodingKeys and conformance CompressionPolicy.ZlibCodingKeys;
  if (!lazy protocol witness table cache variable for type CompressionPolicy.ZlibCodingKeys and conformance CompressionPolicy.ZlibCodingKeys)
  {
    result = MEMORY[0x212BEEBCC](&protocol conformance descriptor for CompressionPolicy.ZlibCodingKeys, &unk_24CDD3798);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CompressionPolicy.ZlibCodingKeys and conformance CompressionPolicy.ZlibCodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type CompressionPolicy.LzmaCodingKeys and conformance CompressionPolicy.LzmaCodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CompressionPolicy.LzmaCodingKeys and conformance CompressionPolicy.LzmaCodingKeys;
  if (!lazy protocol witness table cache variable for type CompressionPolicy.LzmaCodingKeys and conformance CompressionPolicy.LzmaCodingKeys)
  {
    result = MEMORY[0x212BEEBCC](&protocol conformance descriptor for CompressionPolicy.LzmaCodingKeys, &unk_24CDD3778);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CompressionPolicy.LzmaCodingKeys and conformance CompressionPolicy.LzmaCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CompressionPolicy.LzmaCodingKeys and conformance CompressionPolicy.LzmaCodingKeys;
  if (!lazy protocol witness table cache variable for type CompressionPolicy.LzmaCodingKeys and conformance CompressionPolicy.LzmaCodingKeys)
  {
    result = MEMORY[0x212BEEBCC](&protocol conformance descriptor for CompressionPolicy.LzmaCodingKeys, &unk_24CDD3778);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CompressionPolicy.LzmaCodingKeys and conformance CompressionPolicy.LzmaCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CompressionPolicy.LzmaCodingKeys and conformance CompressionPolicy.LzmaCodingKeys;
  if (!lazy protocol witness table cache variable for type CompressionPolicy.LzmaCodingKeys and conformance CompressionPolicy.LzmaCodingKeys)
  {
    result = MEMORY[0x212BEEBCC](&protocol conformance descriptor for CompressionPolicy.LzmaCodingKeys, &unk_24CDD3778);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CompressionPolicy.LzmaCodingKeys and conformance CompressionPolicy.LzmaCodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type CompressionPolicy.Lz4CodingKeys and conformance CompressionPolicy.Lz4CodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CompressionPolicy.Lz4CodingKeys and conformance CompressionPolicy.Lz4CodingKeys;
  if (!lazy protocol witness table cache variable for type CompressionPolicy.Lz4CodingKeys and conformance CompressionPolicy.Lz4CodingKeys)
  {
    result = MEMORY[0x212BEEBCC]("%Յ:\b6", &unk_24CDD3758);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CompressionPolicy.Lz4CodingKeys and conformance CompressionPolicy.Lz4CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CompressionPolicy.Lz4CodingKeys and conformance CompressionPolicy.Lz4CodingKeys;
  if (!lazy protocol witness table cache variable for type CompressionPolicy.Lz4CodingKeys and conformance CompressionPolicy.Lz4CodingKeys)
  {
    result = MEMORY[0x212BEEBCC](&protocol conformance descriptor for CompressionPolicy.Lz4CodingKeys, &unk_24CDD3758);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CompressionPolicy.Lz4CodingKeys and conformance CompressionPolicy.Lz4CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CompressionPolicy.Lz4CodingKeys and conformance CompressionPolicy.Lz4CodingKeys;
  if (!lazy protocol witness table cache variable for type CompressionPolicy.Lz4CodingKeys and conformance CompressionPolicy.Lz4CodingKeys)
  {
    result = MEMORY[0x212BEEBCC]("}ׅ:(8", &unk_24CDD3758);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CompressionPolicy.Lz4CodingKeys and conformance CompressionPolicy.Lz4CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type CompressionPolicy.LzfseCodingKeys and conformance CompressionPolicy.LzfseCodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CompressionPolicy.LzfseCodingKeys and conformance CompressionPolicy.LzfseCodingKeys;
  if (!lazy protocol witness table cache variable for type CompressionPolicy.LzfseCodingKeys and conformance CompressionPolicy.LzfseCodingKeys)
  {
    result = MEMORY[0x212BEEBCC]("uՅ:46", &unk_24CDD3738);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CompressionPolicy.LzfseCodingKeys and conformance CompressionPolicy.LzfseCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CompressionPolicy.LzfseCodingKeys and conformance CompressionPolicy.LzfseCodingKeys;
  if (!lazy protocol witness table cache variable for type CompressionPolicy.LzfseCodingKeys and conformance CompressionPolicy.LzfseCodingKeys)
  {
    result = MEMORY[0x212BEEBCC](&protocol conformance descriptor for CompressionPolicy.LzfseCodingKeys, &unk_24CDD3738);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CompressionPolicy.LzfseCodingKeys and conformance CompressionPolicy.LzfseCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CompressionPolicy.LzfseCodingKeys and conformance CompressionPolicy.LzfseCodingKeys;
  if (!lazy protocol witness table cache variable for type CompressionPolicy.LzfseCodingKeys and conformance CompressionPolicy.LzfseCodingKeys)
  {
    result = MEMORY[0x212BEEBCC](&protocol conformance descriptor for CompressionPolicy.LzfseCodingKeys, &unk_24CDD3738);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CompressionPolicy.LzfseCodingKeys and conformance CompressionPolicy.LzfseCodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type CompressionPolicy.DoNotCompressCodingKeys and conformance CompressionPolicy.DoNotCompressCodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CompressionPolicy.DoNotCompressCodingKeys and conformance CompressionPolicy.DoNotCompressCodingKeys;
  if (!lazy protocol witness table cache variable for type CompressionPolicy.DoNotCompressCodingKeys and conformance CompressionPolicy.DoNotCompressCodingKeys)
  {
    result = MEMORY[0x212BEEBCC](&protocol conformance descriptor for CompressionPolicy.DoNotCompressCodingKeys, &unk_24CDD3718);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CompressionPolicy.DoNotCompressCodingKeys and conformance CompressionPolicy.DoNotCompressCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CompressionPolicy.DoNotCompressCodingKeys and conformance CompressionPolicy.DoNotCompressCodingKeys;
  if (!lazy protocol witness table cache variable for type CompressionPolicy.DoNotCompressCodingKeys and conformance CompressionPolicy.DoNotCompressCodingKeys)
  {
    result = MEMORY[0x212BEEBCC](&protocol conformance descriptor for CompressionPolicy.DoNotCompressCodingKeys, &unk_24CDD3718);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CompressionPolicy.DoNotCompressCodingKeys and conformance CompressionPolicy.DoNotCompressCodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CompressionPolicy.DoNotCompressCodingKeys and conformance CompressionPolicy.DoNotCompressCodingKeys;
  if (!lazy protocol witness table cache variable for type CompressionPolicy.DoNotCompressCodingKeys and conformance CompressionPolicy.DoNotCompressCodingKeys)
  {
    result = MEMORY[0x212BEEBCC](&protocol conformance descriptor for CompressionPolicy.DoNotCompressCodingKeys, &unk_24CDD3718);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CompressionPolicy.DoNotCompressCodingKeys and conformance CompressionPolicy.DoNotCompressCodingKeys);
  }
  return result;
}

void CompressionPolicy.hashValue.getter()
{
  int v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  char v9;

  v0 = OUTLINED_FUNCTION_48_0();
  OUTLINED_FUNCTION_46_0(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9);
  OUTLINED_FUNCTION_47_0();
  OUTLINED_FUNCTION_28_1();
}

void CompressionPolicy.init(from:)()
{
  uint64_t v0;
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
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;

  OUTLINED_FUNCTION_41_1();
  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<CompressionPolicy.ZlibCodingKeys>);
  OUTLINED_FUNCTION_8_6();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_8_3();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<CompressionPolicy.LzmaCodingKeys>);
  OUTLINED_FUNCTION_8_6();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_34_1(v5, v20);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<CompressionPolicy.Lz4CodingKeys>);
  OUTLINED_FUNCTION_8_6();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_8_3();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<CompressionPolicy.LzfseCodingKeys>);
  OUTLINED_FUNCTION_8_6();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_8_3();
  v8 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<CompressionPolicy.DoNotCompressCodingKeys>);
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_8();
  v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<CompressionPolicy.CodingKeys>);
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_20_3();
  __swift_project_boxed_opaque_existential_1Tm(v2, v2[3]);
  lazy protocol witness table accessor for type CompressionPolicy.CodingKeys and conformance CompressionPolicy.CodingKeys();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (!v0)
  {
    v10 = KeyedDecodingContainer.allKeys.getter();
    v11 = *(_QWORD *)(v10 + 16);
    if (v11)
    {
      v12 = *(unsigned __int8 *)(v10 + 32);
      specialized ArraySlice.subscript.getter(1, v11, v10, v10 + 32, 0, (2 * v11) | 1);
      v14 = v13;
      v16 = v15;
      swift_bridgeObjectRelease();
      if (v14 == v16 >> 1)
        __asm { BR              X9 }
    }
    v17 = type metadata accessor for DecodingError();
    swift_allocError();
    v19 = v18;
    __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for (@thick Any.Type, DecodingError.Context));
    *v19 = &type metadata for CompressionPolicy;
    KeyedDecodingContainer.codingPath.getter();
    DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v17 - 8) + 104))(v19, *MEMORY[0x24BEE26D0], v17);
    swift_willThrow();
    swift_unknownObjectRelease();
    OUTLINED_FUNCTION_29_0();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v2);
  OUTLINED_FUNCTION_1_2();
}

void sub_21256E220()
{
  uint64_t v0;

  OUTLINED_FUNCTION_59_0();
  OUTLINED_FUNCTION_6_8();
  if (!v0)
    JUMPOUT(0x21256E2F8);
  JUMPOUT(0x21256E1FCLL);
}

void sub_21256E250()
{
  uint64_t v0;

  OUTLINED_FUNCTION_45_0();
  OUTLINED_FUNCTION_6_8();
  if (!v0)
    JUMPOUT(0x21256E27CLL);
  JUMPOUT(0x21256E1FCLL);
}

void sub_21256E288()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_43_1();
  v3 = *(_QWORD *)(v2 - 152);
  OUTLINED_FUNCTION_6_8();
  if (!v0)
  {
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 176) + 8))(v3, v1);
    swift_unknownObjectRelease();
    OUTLINED_FUNCTION_29_0();
    **(_BYTE **)(v2 - 136) = *(_QWORD *)(v2 - 248);
    JUMPOUT(0x21256E208);
  }
  JUMPOUT(0x21256E1FCLL);
}

void sub_21256E2C4()
{
  uint64_t v0;

  OUTLINED_FUNCTION_50_0();
  OUTLINED_FUNCTION_6_8();
  if (!v0)
    JUMPOUT(0x21256E2F8);
  JUMPOUT(0x21256E1FCLL);
}

void protocol witness for Hashable._rawHashValue(seed:) in conformance CompressionPolicy.CodingKeys()
{
  int v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  char v9;

  v0 = Hasher.init(_seed:)();
  OUTLINED_FUNCTION_46_0(v0, v1, v2, v3, v4, v5, v6, v7, v8, v9);
  OUTLINED_FUNCTION_47_0();
  OUTLINED_FUNCTION_28_1();
}

void protocol witness for Decodable.init(from:) in conformance CompressionPolicy()
{
  CompressionPolicy.init(from:)();
}

void protocol witness for Encodable.encode(to:) in conformance CompressionPolicy()
{
  CompressionPolicy.encode(to:)();
}

void FeatureStoreBiomeEvent.interactionId.getter()
{
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_31_0();
  OUTLINED_FUNCTION_20_1();
}

void FeatureStoreBiomeEvent.featureData.getter()
{
  uint64_t v0;
  unint64_t v1;

  v0 = OUTLINED_FUNCTION_31_0();
  outlined copy of Data._Representation(v0, v1);
  OUTLINED_FUNCTION_31_0();
  OUTLINED_FUNCTION_20_1();
}

double FeatureStoreBiomeEvent.timestamp.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___FSFFeatureStoreBiomeEvent_timestamp;
  OUTLINED_FUNCTION_4_3();
  return *(double *)v1;
}

uint64_t FeatureStoreBiomeEvent.timestamp.setter(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR___FSFFeatureStoreBiomeEvent_timestamp);
  result = OUTLINED_FUNCTION_4_3();
  *v3 = a1;
  return result;
}

void key path getter for FeatureStoreBiomeEvent.timestamp : FeatureStoreBiomeEvent(_QWORD **a1@<X0>, double *a2@<X8>)
{
  *a2 = (*(double (**)(void))((*MEMORY[0x24BEE4EA0] & **a1) + 0x78))();
}

uint64_t key path setter for FeatureStoreBiomeEvent.timestamp : FeatureStoreBiomeEvent(double *a1, _QWORD **a2)
{
  return (*(uint64_t (**)(double))((*MEMORY[0x24BEE4EA0] & **a2) + 0x80))(*a1);
}

void FeatureStoreBiomeEvent.timestamp.modify()
{
  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_20_1();
}

uint64_t FeatureStoreBiomeEvent.dataVersion.getter()
{
  uint64_t v0;
  unsigned int *v1;

  v1 = (unsigned int *)(v0 + OBJC_IVAR___FSFFeatureStoreBiomeEvent_dataVersion);
  OUTLINED_FUNCTION_4_3();
  return *v1;
}

uint64_t FeatureStoreBiomeEvent.dataVersion.setter(int a1)
{
  uint64_t v1;
  _DWORD *v3;
  uint64_t result;

  v3 = (_DWORD *)(v1 + OBJC_IVAR___FSFFeatureStoreBiomeEvent_dataVersion);
  result = OUTLINED_FUNCTION_4_3();
  *v3 = a1;
  return result;
}

uint64_t key path getter for FeatureStoreBiomeEvent.dataVersion : FeatureStoreBiomeEvent@<X0>(_QWORD **a1@<X0>, _DWORD *a2@<X8>)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & **a1) + 0x90))();
  *a2 = result;
  return result;
}

uint64_t key path setter for FeatureStoreBiomeEvent.dataVersion : FeatureStoreBiomeEvent(int *a1)
{
  return FeatureStoreBiomeEvent.dataVersion.setter(*a1);
}

char **FeatureStoreBiomeEvent.signpostBiomeEncodeCompress.unsafeMutableAddressor()
{
  return &static FeatureStoreBiomeEvent.signpostBiomeEncodeCompress;
}

const char *static FeatureStoreBiomeEvent.signpostBiomeEncodeCompress.getter()
{
  return "BiomeEncodeCompress";
}

char **FeatureStoreBiomeEvent.signpostBiomeDecodeDecompress.unsafeMutableAddressor()
{
  return &static FeatureStoreBiomeEvent.signpostBiomeDecodeDecompress;
}

const char *static FeatureStoreBiomeEvent.signpostBiomeDecodeDecompress.getter()
{
  return "BiomeDecodeDecompress";
}

void *FeatureStoreBiomeEvent.keyMaximumSizeBeforeCompression.unsafeMutableAddressor()
{
  return &static FeatureStoreBiomeEvent.keyMaximumSizeBeforeCompression;
}

unint64_t static FeatureStoreBiomeEvent.keyMaximumSizeBeforeCompression.getter()
{
  return 0xD000000000000028;
}

void static FeatureStoreBiomeEvent.maximumSizeBeforeCompression.getter()
{
  id v0;

  v0 = objc_msgSend((id)objc_opt_self(), sel_standardUserDefaults);
  OUTLINED_FUNCTION_40_1();
}

uint64_t sub_21256E7AC(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, __int128 a9, __int128 a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  void *v18;
  void *v19;
  uint64_t v20;
  id v22;
  id v23;
  _BYTE v25[96];

  v22 = objc_msgSend(v19, sel_objectForKey_, a1);

  if (v22)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
    outlined destroy of Any?((uint64_t)v25);
    v23 = objc_msgSend(v18, *(SEL *)(v20 + 600));
    OUTLINED_FUNCTION_40_1();
  }
  memset(v25, 0, 32);
  outlined destroy of Any?((uint64_t)v25);
  return 700000;
}

uint64_t default argument 2 of FeatureStoreBiomeEvent.init(interactionId:featureData:dataVersion:timestamp:)()
{
  return 1;
}

double default argument 3 of FeatureStoreBiomeEvent.init(interactionId:featureData:dataVersion:timestamp:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  double v5;
  double v6;

  v0 = type metadata accessor for Date();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  OUTLINED_FUNCTION_8();
  v4 = v3 - v2;
  static Date.now.getter();
  Date.timeIntervalSinceReferenceDate.getter();
  v6 = v5;
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v4, v0);
  return v6;
}

id FeatureStoreBiomeEvent.__allocating_init(interactionId:featureData:dataVersion:timestamp:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, double a6)
{
  objc_class *v6;
  id v13;

  v13 = objc_allocWithZone(v6);
  return FeatureStoreBiomeEvent.init(interactionId:featureData:dataVersion:timestamp:)(a6, a1, a2, a3, a4, a5);
}

id FeatureStoreBiomeEvent.init(interactionId:featureData:dataVersion:timestamp:)(double a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  char *v6;
  uint64_t v7;
  char *v8;
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
  NSObject *v24;
  char *v25;
  char *v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  os_log_type_t v31;
  uint8_t *v32;
  uint8_t *v33;
  uint64_t v34;
  os_log_type_t v35;
  uint8_t *v36;
  objc_class *v37;
  id v38;
  _QWORD v40[8];
  objc_super v41;

  v8 = v6;
  v14 = OUTLINED_FUNCTION_56_0();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_39();
  v40[6] = v16;
  v18 = MEMORY[0x24BDAC7A8](v17);
  v40[5] = (char *)v40 - v19;
  v20 = MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)v40 - v21;
  MEMORY[0x24BDAC7A8](v20);
  v24 = ((char *)v40 - v23);
  v25 = &v8[OBJC_IVAR___FSFFeatureStoreBiomeEvent_interactionId];
  *(_QWORD *)v25 = v7;
  *((_QWORD *)v25 + 1) = a3;
  *(_DWORD *)&v8[OBJC_IVAR___FSFFeatureStoreBiomeEvent_dataVersion] = a6;
  v26 = &v8[OBJC_IVAR___FSFFeatureStoreBiomeEvent_featureData];
  *(_QWORD *)v26 = a4;
  *((_QWORD *)v26 + 1) = a5;
  *(double *)&v8[OBJC_IVAR___FSFFeatureStoreBiomeEvent_timestamp] = a1;
  if (a6)
  {
    OUTLINED_FUNCTION_35_0();
    v27 = v8;
    v28 = Logger.accessor.unsafeMutableAddressor();
    v29 = *(_QWORD *)(v15 + 16);
    v40[4] = v28;
    OUTLINED_FUNCTION_51_0((uint64_t)v22, v28);
    OUTLINED_FUNCTION_35_0();
    v30 = Logger.logObject.getter();
    v31 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v30, v31))
    {
      v40[2] = v27;
      v32 = (uint8_t *)OUTLINED_FUNCTION_5();
      v40[3] = v14;
      v33 = v32;
      v40[1] = v29;
      *(_DWORD *)v32 = 134217984;
      v40[7] = OUTLINED_FUNCTION_60();
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      OUTLINED_FUNCTION_36_1();
      _os_log_impl(&dword_212552000, v30, v31, "Data size in bytes: %ld", v33, 0xCu);
      OUTLINED_FUNCTION_1();
    }
    OUTLINED_FUNCTION_36_1();

    OUTLINED_FUNCTION_44_1((uint64_t)v22);
    OUTLINED_FUNCTION_60();
    static FeatureStoreBiomeEvent.maximumSizeBeforeCompression.getter();
  }
  v8[OBJC_IVAR___FSFFeatureStoreBiomeEvent_compressionPolicy] = 0;
  OUTLINED_FUNCTION_35_0();
  v34 = Logger.accessor.unsafeMutableAddressor();
  (*(void (**)(NSObject *, uint64_t, uint64_t))(v15 + 16))(v24, v34, v14);
  Logger.logObject.getter();
  v35 = OUTLINED_FUNCTION_58();
  if (os_log_type_enabled(v24, v35))
  {
    v36 = (uint8_t *)OUTLINED_FUNCTION_5();
    *(_WORD *)v36 = 0;
    _os_log_impl(&dword_212552000, v24, v35, "No compression is needed", v36, 2u);
    OUTLINED_FUNCTION_1();
  }

  (*(void (**)(NSObject *, uint64_t))(v15 + 8))(v24, v14);
  v37 = (objc_class *)type metadata accessor for FeatureStoreBiomeEvent();
  v41.receiver = v8;
  v41.super_class = v37;
  v38 = objc_msgSendSuper2(&v41, sel_init);
  OUTLINED_FUNCTION_36_1();
  return v38;
}

uint64_t static FeatureStoreBiomeEvent.event(with:dataVersion:)(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v4;
  _DWORD *v5;
  uint64_t v7;

  v4 = OUTLINED_FUNCTION_56_0();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_32_0();
  type metadata accessor for JSONDecoder();
  OUTLINED_FUNCTION_61();
  JSONDecoder.init()();
  lazy protocol witness table accessor for type FeatureStoreBiomeEvent and conformance FeatureStoreBiomeEvent(&lazy protocol witness table cache variable for type FeatureStoreBiomeEvent and conformance FeatureStoreBiomeEvent, (uint64_t)&protocol conformance descriptor for FeatureStoreBiomeEvent);
  dispatch thunk of JSONDecoder.decode<A>(_:from:)();
  swift_release();
  v5 = (_DWORD *)(v7 + OBJC_IVAR___FSFFeatureStoreBiomeEvent_dataVersion);
  OUTLINED_FUNCTION_4_3();
  *v5 = a3;
  return v7;
}

uint64_t FeatureStoreBiomeEvent.serialize()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = type metadata accessor for Logger();
  MEMORY[0x24BDAC7A8](v0);
  OUTLINED_FUNCTION_32_0();
  type metadata accessor for JSONEncoder.OutputFormatting();
  OUTLINED_FUNCTION_8_6();
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_33_1();
  type metadata accessor for JSONEncoder();
  OUTLINED_FUNCTION_61();
  JSONEncoder.init()();
  static JSONEncoder.OutputFormatting.sortedKeys.getter();
  dispatch thunk of JSONEncoder.outputFormatting.setter();
  type metadata accessor for FeatureStoreBiomeEvent();
  lazy protocol witness table accessor for type FeatureStoreBiomeEvent and conformance FeatureStoreBiomeEvent(&lazy protocol witness table cache variable for type FeatureStoreBiomeEvent and conformance FeatureStoreBiomeEvent, (uint64_t)&protocol conformance descriptor for FeatureStoreBiomeEvent);
  v2 = dispatch thunk of JSONEncoder.encode<A>(_:)();
  swift_release();
  return v2;
}

FeatureStore::FeatureStoreBiomeEvent::CodingKeys_optional __swiftcall FeatureStoreBiomeEvent.CodingKeys.init(rawValue:)(Swift::String rawValue)
{
  void *object;
  Swift::String v2;
  unint64_t v3;

  object = rawValue._object;
  v2._countAndFlagsBits = rawValue._countAndFlagsBits;
  v2._object = object;
  v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&outlined read-only object #0 of FeatureStoreBiomeEvent.CodingKeys.init(rawValue:), v2);
  OUTLINED_FUNCTION_18_1();
  if (v3 >= 4)
    return (FeatureStore::FeatureStoreBiomeEvent::CodingKeys_optional)4;
  else
    return (FeatureStore::FeatureStoreBiomeEvent::CodingKeys_optional)v3;
}

FeatureStore::FeatureStoreBiomeEvent::CodingKeys_optional __swiftcall FeatureStoreBiomeEvent.CodingKeys.init(intValue:)(Swift::Int intValue)
{
  return (FeatureStore::FeatureStoreBiomeEvent::CodingKeys_optional)4;
}

uint64_t FeatureStoreBiomeEvent.CodingKeys.rawValue.getter(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)j__OUTLINED_FUNCTION_13_6
                                                                     + 4 * byte_212575CAF[a1]))(0xD000000000000011, 0x8000000212577A30);
}

uint64_t sub_21256F344()
{
  return 0x7372655661746164;
}

uint64_t FeatureStoreBiomeEvent.CodingKeys.stringValue.getter(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)j__OUTLINED_FUNCTION_13_6_0
                                                                     + 4 * byte_212575CB3[a1]))(0xD000000000000011, 0x8000000212577A30);
}

uint64_t sub_21256F3A4()
{
  return 0x7372655661746164;
}

void protocol witness for static Equatable.== infix(_:_:) in conformance FeatureStoreBiomeEvent.CodingKeys(char *a1)
{
  specialized == infix<A>(_:_:)(*a1);
}

void specialized == infix<A>(_:_:)(char a1)
{
  __asm { BR              X11 }
}

uint64_t sub_21256F420(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_21256F498 + 4 * byte_212575CBB[a2]))(0x7463617265746E69);
}

uint64_t sub_21256F498(uint64_t a1)
{
  uint64_t v1;
  char v3;

  if (a1 == 0x7463617265746E69 && v1 == 0xED000064496E6F69)
    v3 = 1;
  else
    v3 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

Swift::Int protocol witness for Hashable.hashValue.getter in conformance FeatureStoreBiomeEvent.CodingKeys()
{
  char *v0;

  return specialized RawRepresentable<>.hashValue.getter(*v0);
}

Swift::Int specialized RawRepresentable<>.hashValue.getter(char a1)
{
  _BYTE v3[72];

  Hasher.init(_seed:)();
  specialized RawRepresentable<>.hash(into:)((uint64_t)v3, a1);
  return Hasher._finalize()();
}

void protocol witness for Hashable.hash(into:) in conformance FeatureStoreBiomeEvent.CodingKeys(uint64_t a1)
{
  char *v1;

  specialized RawRepresentable<>.hash(into:)(a1, *v1);
}

void specialized RawRepresentable<>.hash(into:)(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_21256F5D8()
{
  String.hash(into:)();
  return swift_bridgeObjectRelease();
}

Swift::Int protocol witness for Hashable._rawHashValue(seed:) in conformance FeatureStoreBiomeEvent.CodingKeys(uint64_t a1)
{
  char *v1;

  return specialized RawRepresentable<>._rawHashValue(seed:)(a1, *v1);
}

Swift::Int specialized RawRepresentable<>._rawHashValue(seed:)(uint64_t a1, char a2)
{
  _BYTE v4[72];

  Hasher.init(_seed:)();
  specialized RawRepresentable<>.hash(into:)((uint64_t)v4, a2);
  return Hasher._finalize()();
}

void protocol witness for RawRepresentable.init(rawValue:) in conformance FeatureStoreBiomeEvent.CodingKeys(Swift::String *a1@<X0>, FeatureStore::FeatureStoreBiomeEvent::CodingKeys_optional *a2@<X8>)
{
  a2->value = FeatureStoreBiomeEvent.CodingKeys.init(rawValue:)(*a1).value;
  OUTLINED_FUNCTION_20_1();
}

void protocol witness for RawRepresentable.rawValue.getter in conformance FeatureStoreBiomeEvent.CodingKeys(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t v3;

  *a1 = FeatureStoreBiomeEvent.CodingKeys.rawValue.getter(*v1);
  a1[1] = v3;
  OUTLINED_FUNCTION_20_1();
}

uint64_t protocol witness for CodingKey.stringValue.getter in conformance FeatureStoreBiomeEvent.CodingKeys()
{
  unsigned __int8 *v0;

  return FeatureStoreBiomeEvent.CodingKeys.stringValue.getter(*v0);
}

void protocol witness for CodingKey.init(stringValue:) in conformance FeatureStoreBiomeEvent.CodingKeys(uint64_t a1@<X0>, FeatureStore::FeatureStoreBiomeEvent::CodingKeys_optional *a2@<X8>)
{
  a2->value = FeatureStoreBiomeEvent.CodingKeys.init(stringValue:)(*(Swift::String *)&a1).value;
  OUTLINED_FUNCTION_20_1();
}

void protocol witness for CodingKey.init(intValue:) in conformance FeatureStoreBiomeEvent.CodingKeys(_BYTE *a1@<X8>)
{
  *a1 = 4;
}

uint64_t protocol witness for CustomStringConvertible.description.getter in conformance FeatureStoreBiomeEvent.CodingKeys()
{
  lazy protocol witness table accessor for type FeatureStoreBiomeEvent.CodingKeys and conformance FeatureStoreBiomeEvent.CodingKeys();
  OUTLINED_FUNCTION_9_9();
  return OUTLINED_FUNCTION_0_15();
}

uint64_t protocol witness for CustomDebugStringConvertible.debugDescription.getter in conformance FeatureStoreBiomeEvent.CodingKeys()
{
  lazy protocol witness table accessor for type FeatureStoreBiomeEvent.CodingKeys and conformance FeatureStoreBiomeEvent.CodingKeys();
  OUTLINED_FUNCTION_9_9();
  return OUTLINED_FUNCTION_1_7();
}

void FeatureStoreBiomeEvent.encode(to:)()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
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
  _QWORD v21[9];
  uint64_t v22;
  char v23;
  char v24;

  OUTLINED_FUNCTION_41_1();
  v22 = v1;
  v3 = v0;
  v5 = v4;
  v6 = OUTLINED_FUNCTION_62(*MEMORY[0x24BDAC8D0]);
  v7 = *(_QWORD *)(v6 - 8);
  v21[7] = v6;
  v21[8] = v7;
  OUTLINED_FUNCTION_8_6();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_39();
  v21[5] = v9;
  MEMORY[0x24BDAC7A8](v10);
  v21[6] = (char *)v21 - v11;
  type metadata accessor for LogSignpost();
  OUTLINED_FUNCTION_8_6();
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_8();
  v15 = v14 - v13;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedEncodingContainer<FeatureStoreBiomeEvent.CodingKeys>);
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8](v16);
  OUTLINED_FUNCTION_20_3();
  __swift_project_boxed_opaque_existential_1Tm(v5, v5[3]);
  lazy protocol witness table accessor for type FeatureStoreBiomeEvent.CodingKeys and conformance FeatureStoreBiomeEvent.CodingKeys();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  v24 = 0;
  v18 = v22;
  v19 = KeyedEncodingContainer.encode(_:forKey:)();
  if (!v18)
  {
    v21[4] = v15;
    v22 = v17;
    (*(void (**)(uint64_t))((*MEMORY[0x24BEE4EA0] & *v3) + 0x90))(v19);
    v24 = 2;
    KeyedEncodingContainer.encode(_:forKey:)();
    v20 = OBJC_IVAR___FSFFeatureStoreBiomeEvent_compressionPolicy;
    v24 = *((_BYTE *)v3 + OBJC_IVAR___FSFFeatureStoreBiomeEvent_compressionPolicy);
    v23 = 3;
    lazy protocol witness table accessor for type CompressionPolicy and conformance CompressionPolicy();
    OUTLINED_FUNCTION_53_0();
    v21[3] = 0;
    __asm { BR              X10 }
  }
  (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v2, v16);
  OUTLINED_FUNCTION_1_2();
}

_QWORD *FeatureStoreBiomeEvent.__allocating_init(from:)()
{
  objc_class *v0;
  id v1;

  v1 = objc_allocWithZone(v0);
  return FeatureStoreBiomeEvent.init(from:)();
}

_QWORD *FeatureStoreBiomeEvent.init(from:)()
{
  void *v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  void *v15;
  _BYTE *v16;

  OUTLINED_FUNCTION_41_1();
  v15 = v0;
  v3 = v2;
  OUTLINED_FUNCTION_62(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_8_6();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_33_1();
  type metadata accessor for LogSignpost();
  OUTLINED_FUNCTION_8_6();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_20_3();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for KeyedDecodingContainer<FeatureStoreBiomeEvent.CodingKeys>);
  OUTLINED_FUNCTION_7_4();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_8();
  v7 = __swift_project_boxed_opaque_existential_1Tm(v3, v3[3]);
  lazy protocol witness table accessor for type FeatureStoreBiomeEvent.CodingKeys and conformance FeatureStoreBiomeEvent.CodingKeys();
  v16 = v15;
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (!v1)
  {
    v8 = KeyedDecodingContainer.decode(_:forKey:)();
    v10 = (uint64_t *)&v16[OBJC_IVAR___FSFFeatureStoreBiomeEvent_interactionId];
    *v10 = v8;
    v10[1] = v11;
    v12 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
    if ((v12 & 0x100000000) != 0)
      v13 = 0;
    else
      v13 = v12;
    *(_DWORD *)&v16[OBJC_IVAR___FSFFeatureStoreBiomeEvent_dataVersion] = v13;
    lazy protocol witness table accessor for type CompressionPolicy and conformance CompressionPolicy();
    OUTLINED_FUNCTION_27_1();
    KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
    v14 = OBJC_IVAR___FSFFeatureStoreBiomeEvent_compressionPolicy;
    v16[OBJC_IVAR___FSFFeatureStoreBiomeEvent_compressionPolicy] = 2;
    lazy protocol witness table accessor for type Data and conformance Data();
    OUTLINED_FUNCTION_27_1();
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    __asm { BR              X10 }
  }
  OUTLINED_FUNCTION_54_0();

  type metadata accessor for FeatureStoreBiomeEvent();
  swift_deallocPartialClassInstance();
  return v7;
}

id FeatureStoreBiomeEvent.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void FeatureStoreBiomeEvent.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id FeatureStoreBiomeEvent.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FeatureStoreBiomeEvent();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t protocol witness for Decodable.init(from:) in conformance FeatureStoreBiomeEvent@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t result;

  result = (*(uint64_t (**)(void))(v1 + 216))();
  if (!v2)
    *a1 = result;
  return result;
}

uint64_t protocol witness for Encodable.encode(to:) in conformance FeatureStoreBiomeEvent()
{
  uint64_t **v0;

  return OUTLINED_FUNCTION_57(**v0);
}

void protocol witness for FeatureMetadata.interactionId.getter in conformance FeatureStoreBiomeEvent()
{
  FeatureStoreBiomeEvent.interactionId.getter();
  OUTLINED_FUNCTION_20_1();
}

uint64_t protocol witness for FeatureMetadata.timestamp.getter in conformance FeatureStoreBiomeEvent()
{
  _QWORD **v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & **v0) + 0x78))();
}

uint64_t specialized ArraySlice.subscript.getter(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  if (result < a5)
  {
    __break(1u);
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  if ((uint64_t)(a6 >> 1) < result || (uint64_t)(a6 >> 1) < a2)
    goto LABEL_10;
  if (a2 < a5)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  if ((a2 & 0x8000000000000000) == 0)
    return swift_unknownObjectRetain();
LABEL_12:
  __break(1u);
  return result;
}

uint64_t type metadata accessor for FeatureStoreBiomeEvent()
{
  return objc_opt_self();
}

uint64_t lazy protocol witness table accessor for type FeatureStoreBiomeEvent and conformance FeatureStoreBiomeEvent(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for FeatureStoreBiomeEvent();
    result = MEMORY[0x212BEEBCC](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type FeatureStoreBiomeEvent.CodingKeys and conformance FeatureStoreBiomeEvent.CodingKeys()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type FeatureStoreBiomeEvent.CodingKeys and conformance FeatureStoreBiomeEvent.CodingKeys;
  if (!lazy protocol witness table cache variable for type FeatureStoreBiomeEvent.CodingKeys and conformance FeatureStoreBiomeEvent.CodingKeys)
  {
    result = MEMORY[0x212BEEBCC](&protocol conformance descriptor for FeatureStoreBiomeEvent.CodingKeys, &type metadata for FeatureStoreBiomeEvent.CodingKeys);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FeatureStoreBiomeEvent.CodingKeys and conformance FeatureStoreBiomeEvent.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type FeatureStoreBiomeEvent.CodingKeys and conformance FeatureStoreBiomeEvent.CodingKeys;
  if (!lazy protocol witness table cache variable for type FeatureStoreBiomeEvent.CodingKeys and conformance FeatureStoreBiomeEvent.CodingKeys)
  {
    result = MEMORY[0x212BEEBCC](&protocol conformance descriptor for FeatureStoreBiomeEvent.CodingKeys, &type metadata for FeatureStoreBiomeEvent.CodingKeys);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FeatureStoreBiomeEvent.CodingKeys and conformance FeatureStoreBiomeEvent.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type FeatureStoreBiomeEvent.CodingKeys and conformance FeatureStoreBiomeEvent.CodingKeys;
  if (!lazy protocol witness table cache variable for type FeatureStoreBiomeEvent.CodingKeys and conformance FeatureStoreBiomeEvent.CodingKeys)
  {
    result = MEMORY[0x212BEEBCC](&protocol conformance descriptor for FeatureStoreBiomeEvent.CodingKeys, &type metadata for FeatureStoreBiomeEvent.CodingKeys);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FeatureStoreBiomeEvent.CodingKeys and conformance FeatureStoreBiomeEvent.CodingKeys);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type FeatureStoreBiomeEvent.CodingKeys and conformance FeatureStoreBiomeEvent.CodingKeys;
  if (!lazy protocol witness table cache variable for type FeatureStoreBiomeEvent.CodingKeys and conformance FeatureStoreBiomeEvent.CodingKeys)
  {
    result = MEMORY[0x212BEEBCC](&protocol conformance descriptor for FeatureStoreBiomeEvent.CodingKeys, &type metadata for FeatureStoreBiomeEvent.CodingKeys);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FeatureStoreBiomeEvent.CodingKeys and conformance FeatureStoreBiomeEvent.CodingKeys);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type CompressionPolicy and conformance CompressionPolicy()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CompressionPolicy and conformance CompressionPolicy;
  if (!lazy protocol witness table cache variable for type CompressionPolicy and conformance CompressionPolicy)
  {
    result = MEMORY[0x212BEEBCC](&protocol conformance descriptor for CompressionPolicy, &type metadata for CompressionPolicy);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CompressionPolicy and conformance CompressionPolicy);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CompressionPolicy and conformance CompressionPolicy;
  if (!lazy protocol witness table cache variable for type CompressionPolicy and conformance CompressionPolicy)
  {
    result = MEMORY[0x212BEEBCC](&protocol conformance descriptor for CompressionPolicy, &type metadata for CompressionPolicy);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CompressionPolicy and conformance CompressionPolicy);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type CompressionPolicy and conformance CompressionPolicy;
  if (!lazy protocol witness table cache variable for type CompressionPolicy and conformance CompressionPolicy)
  {
    result = MEMORY[0x212BEEBCC](&protocol conformance descriptor for CompressionPolicy, &type metadata for CompressionPolicy);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type CompressionPolicy and conformance CompressionPolicy);
  }
  return result;
}

unint64_t lazy protocol witness table accessor for type Data and conformance Data()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type Data and conformance Data;
  if (!lazy protocol witness table cache variable for type Data and conformance Data)
  {
    result = MEMORY[0x212BEEBCC](MEMORY[0x24BDCDDF8], MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Data and conformance Data);
  }
  return result;
}

{
  unint64_t result;

  result = lazy protocol witness table cache variable for type Data and conformance Data;
  if (!lazy protocol witness table cache variable for type Data and conformance Data)
  {
    result = MEMORY[0x212BEEBCC](MEMORY[0x24BDCDE38], MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Data and conformance Data);
  }
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

void type metadata accessor for CompressionPolicy()
{
  OUTLINED_FUNCTION_21_1();
}

uint64_t method lookup function for FeatureStoreBiomeEvent()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of FeatureStoreBiomeEvent.timestamp.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of FeatureStoreBiomeEvent.timestamp.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of FeatureStoreBiomeEvent.timestamp.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of FeatureStoreBiomeEvent.dataVersion.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x90))();
}

uint64_t dispatch thunk of FeatureStoreBiomeEvent.__allocating_init(interactionId:featureData:dataVersion:timestamp:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 192))();
}

uint64_t dispatch thunk of FeatureStoreBiomeEvent.serialize()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of FeatureStoreBiomeEvent.encode(to:)()
{
  uint64_t *v0;

  return OUTLINED_FUNCTION_57(*v0);
}

uint64_t dispatch thunk of FeatureStoreBiomeEvent.__allocating_init(from:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 216))();
}

uint64_t getEnumTagSinglePayload for FeatureStoreBiomeEvent.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  BOOL v7;

  if (!a2)
  {
    v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFD)
  {
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
      if (!v4)
        goto LABEL_17;
    }
    else if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
    }
    else
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
    }
    v5 = (*a1 | (v4 << 8)) - 4;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 4;
  v5 = v6 - 4;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for FeatureStoreBiomeEvent.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_212570734 + 4 * byte_212575CC8[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_212570768 + 4 * byte_212575CC3[v4]))();
}

uint64_t sub_212570768(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_212570770(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x212570778);
  return result;
}

uint64_t sub_212570784(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21257078CLL);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_212570790(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_212570798(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t getEnumTag for FeatureStoreBiomeEvent.CodingKeys(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *destructiveInjectEnumTag for FeatureStoreBiomeEvent.CodingKeys(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

void type metadata accessor for FeatureStoreBiomeEvent.CodingKeys()
{
  OUTLINED_FUNCTION_21_1();
}

uint64_t getEnumTagSinglePayload for CompressionPolicy(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  BOOL v7;

  if (!a2)
  {
    v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFC)
  {
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
      if (!v4)
        goto LABEL_17;
    }
    else if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
    }
    else
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
    }
    v5 = (*a1 | (v4 << 8)) - 5;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 5;
  v5 = v6 - 5;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for CompressionPolicy(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_212570894 + 4 * byte_212575CD2[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_2125708C8 + 4 * byte_212575CCD[v4]))();
}

uint64_t sub_2125708C8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2125708D0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2125708D8);
  return result;
}

uint64_t sub_2125708E4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2125708ECLL);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_2125708F0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2125708F8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void type metadata accessor for CompressionPolicy.CodingKeys()
{
  OUTLINED_FUNCTION_21_1();
}

void type metadata accessor for CompressionPolicy.DoNotCompressCodingKeys()
{
  OUTLINED_FUNCTION_21_1();
}

void type metadata accessor for CompressionPolicy.LzfseCodingKeys()
{
  OUTLINED_FUNCTION_21_1();
}

void type metadata accessor for CompressionPolicy.Lz4CodingKeys()
{
  OUTLINED_FUNCTION_21_1();
}

void type metadata accessor for CompressionPolicy.LzmaCodingKeys()
{
  OUTLINED_FUNCTION_21_1();
}

void type metadata accessor for CompressionPolicy.ZlibCodingKeys()
{
  OUTLINED_FUNCTION_21_1();
}

uint64_t OUTLINED_FUNCTION_0_15()
{
  return CodingKey.description.getter();
}

uint64_t OUTLINED_FUNCTION_1_7()
{
  return CodingKey.debugDescription.getter();
}

uint64_t OUTLINED_FUNCTION_2_10()
{
  return KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
}

uint64_t OUTLINED_FUNCTION_5_11()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_6_8()
{
  return KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
}

uint64_t OUTLINED_FUNCTION_7_10()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t OUTLINED_FUNCTION_9_9()
{
  uint64_t v0;

  return v0;
}

BOOL OUTLINED_FUNCTION_12_6(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_13_6()
{
  return 0x7463617265746E69;
}

void OUTLINED_FUNCTION_15_3(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t OUTLINED_FUNCTION_16_2()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_22_2()
{
  uint64_t v0;
  unint64_t v1;

  return outlined consume of Data._Representation(v0, v1);
}

uint64_t OUTLINED_FUNCTION_23_2()
{
  return 0x65727574616566;
}

uint64_t OUTLINED_FUNCTION_29_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 96) + 8))(v0, v1);
}

uint64_t OUTLINED_FUNCTION_30_1@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

uint64_t OUTLINED_FUNCTION_31_0()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_32_0()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_33_1()
{
  return 0;
}

void OUTLINED_FUNCTION_34_1(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 152) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t OUTLINED_FUNCTION_35_0()
{
  unint64_t v0;
  uint64_t v1;

  return outlined copy of Data._Representation(v1, v0);
}

uint64_t OUTLINED_FUNCTION_36_1()
{
  unint64_t v0;
  uint64_t v1;

  return outlined consume of Data._Representation(v1, v0);
}

void OUTLINED_FUNCTION_37_1(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  uint8_t *v5;
  os_log_type_t v6;

  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

void OUTLINED_FUNCTION_38_1(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;

  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

uint64_t OUTLINED_FUNCTION_39_1()
{
  return swift_arrayDestroy();
}

void OUTLINED_FUNCTION_40_1()
{
  JUMPOUT(0x212BEE02CLL);
}

unint64_t OUTLINED_FUNCTION_43_1()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 66) = 3;
  return lazy protocol witness table accessor for type CompressionPolicy.LzmaCodingKeys and conformance CompressionPolicy.LzmaCodingKeys();
}

uint64_t OUTLINED_FUNCTION_44_1(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(a1, v2);
}

unint64_t OUTLINED_FUNCTION_45_0()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 67) = 2;
  return lazy protocol witness table accessor for type CompressionPolicy.Lz4CodingKeys and conformance CompressionPolicy.Lz4CodingKeys();
}

void OUTLINED_FUNCTION_46_0(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  Swift::UInt v10;

  Hasher._combine(_:)(v10);
}

Swift::Int OUTLINED_FUNCTION_47_0()
{
  return Hasher._finalize()();
}

uint64_t OUTLINED_FUNCTION_48_0()
{
  return Hasher.init(_seed:)();
}

uint64_t OUTLINED_FUNCTION_49_0()
{
  uint64_t v0;

  return outlined consume of Data._Representation(*(_QWORD *)(v0 - 144), *(_QWORD *)(v0 - 176));
}

unint64_t OUTLINED_FUNCTION_50_0()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 65) = 4;
  return lazy protocol witness table accessor for type CompressionPolicy.ZlibCodingKeys and conformance CompressionPolicy.ZlibCodingKeys();
}

uint64_t OUTLINED_FUNCTION_51_0(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(uint64_t, uint64_t, uint64_t);
  uint64_t v3;

  return v2(a1, a2, v3);
}

uint64_t OUTLINED_FUNCTION_52_0(uint64_t a1)
{
  unint64_t v1;

  return outlined copy of Data._Representation(a1, v1);
}

uint64_t OUTLINED_FUNCTION_53_0()
{
  return KeyedEncodingContainer.encode<A>(_:forKey:)();
}

uint64_t OUTLINED_FUNCTION_54_0()
{
  uint64_t v0;

  return __swift_destroy_boxed_opaque_existential_0(*(_QWORD *)(v0 - 152));
}

uint64_t OUTLINED_FUNCTION_56_0()
{
  return type metadata accessor for Logger();
}

uint64_t OUTLINED_FUNCTION_57@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return (*(uint64_t (**)(void))((v1 & a1) + 0xD0))();
}

uint64_t OUTLINED_FUNCTION_58()
{
  return static os_log_type_t.debug.getter();
}

unint64_t OUTLINED_FUNCTION_59_0()
{
  uint64_t v0;

  *(_BYTE *)(v0 - 68) = 1;
  return lazy protocol witness table accessor for type CompressionPolicy.LzfseCodingKeys and conformance CompressionPolicy.LzfseCodingKeys();
}

uint64_t OUTLINED_FUNCTION_60()
{
  return Data.count.getter();
}

uint64_t OUTLINED_FUNCTION_61()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_62@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 88) = a1;
  return type metadata accessor for Logger();
}

uint64_t static JSONCoder.encode(codable:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = type metadata accessor for Logger();
  MEMORY[0x24BDAC7A8](v0);
  OUTLINED_FUNCTION_8();
  v1 = type metadata accessor for JSONEncoder.OutputFormatting();
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_8();
  type metadata accessor for JSONEncoder();
  OUTLINED_FUNCTION_61();
  JSONEncoder.init()();
  static JSONEncoder.OutputFormatting.sortedKeys.getter();
  dispatch thunk of JSONEncoder.outputFormatting.setter();
  v2 = dispatch thunk of JSONEncoder.encode<A>(_:)();
  swift_release();
  return v2;
}

uint64_t static JSONCoder.decode(data:)@<X0>(uint64_t a1@<X2>, uint64_t a2@<X8>)
{
  uint64_t v4;

  v4 = type metadata accessor for Logger();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_8();
  type metadata accessor for JSONDecoder();
  OUTLINED_FUNCTION_61();
  JSONDecoder.init()();
  dispatch thunk of JSONDecoder.decode<A>(_:from:)();
  swift_release();
  return __swift_storeEnumTagSinglePayload(a2, 0, 1, a1);
}

uint64_t protocol witness for static Coder.encode(codable:) in conformance JSONCoder<A>()
{
  return static JSONCoder.encode(codable:)();
}

uint64_t protocol witness for static Coder.decode(data:) in conformance JSONCoder<A>@<X0>(uint64_t a1@<X2>, uint64_t a2@<X8>)
{
  return static JSONCoder.decode(data:)(*(_QWORD *)(a1 + 16), a2);
}

uint64_t type metadata accessor for JSONCoder(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for JSONCoder);
}

uint64_t OUTLINED_FUNCTION_6_9(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 96) = a1;
  return v1 - 96;
}

id INIntent.fsf_serialize()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  id result;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v0 = type metadata accessor for String.Encoding();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = (id)INSJSONEncodedIntent();
  if (result)
  {
    v5 = result;
    static String._unconditionallyBridgeFromObjectiveC(_:)();

    static String.Encoding.utf8.getter();
    v6 = String.data(using:allowLossyConversion:)();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    return (id)v6;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id static INIntent.fsf_deserialize(from:)()
{
  Class isa;
  id v1;

  isa = Data._bridgeToObjectiveC()().super.isa;
  v1 = (id)INIntentCreate();

  return v1;
}

id protocol witness for Serializable.fsf_serialize() in conformance INIntent()
{
  return INIntent.fsf_serialize()();
}

id protocol witness for static Serializable.fsf_deserialize(from:) in conformance INIntent@<X0>(_QWORD *a1@<X8>)
{
  id result;

  result = static INIntent.fsf_deserialize(from:)();
  *a1 = result;
  return result;
}

void static FeatureStoreService.insertNSCoding<A>(interactionId:item:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  _QWORD *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;

  v8 = type metadata accessor for DispatchQoS();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = a4;
  v12[3] = a3;
  v12[4] = a1;
  v12[5] = a2;
  v13 = a3;
  v14 = swift_bridgeObjectRetain();
  default argument 0 of static FeatureStoreService.performInsert(qos:insertBlock:completion:)(v14);
  static FeatureStoreService.performInsert(qos:insertBlock:completion:)((uint64_t)v11, (uint64_t)partial apply for closure #1 in static FeatureStoreService.insertNSCoding<A>(interactionId:item:), (uint64_t)v12, 0, 0);
  swift_release();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  OUTLINED_FUNCTION_0();
}

void closure #1 in static FeatureStoreService.insertNSCoding<A>(interactionId:item:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  int v19;
  double v20;
  id v21;
  _QWORD v22[2];

  v6 = type metadata accessor for Logger();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = static NSCodingCoder.encode(codable:)(a1);
  if (v11 >> 60 == 15)
  {
    v12 = Logger.service.unsafeMutableAddressor();
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v12, v6);
    v13 = Logger.logObject.getter();
    v14 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_212552000, v13, v14, "Could not encode the item. Skipping insertion.", v15, 2u);
      MEMORY[0x212BEEC50](v15, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  else
  {
    v16 = v10;
    v17 = v11;
    v22[1] = swift_getObjectType();
    swift_getMetatypeMetadata();
    String.init<A>(describing:)();
    type metadata accessor for FeatureStoreStreamAccessor();
    v18 = FeatureStoreStreamAccessor.__allocating_init(identifier:)();
    type metadata accessor for FeatureStoreBiomeEvent();
    swift_bridgeObjectRetain();
    outlined copy of Data?(v16, v17);
    v19 = default argument 2 of FeatureStoreBiomeEvent.init(interactionId:featureData:dataVersion:timestamp:)();
    v20 = default argument 3 of FeatureStoreBiomeEvent.init(interactionId:featureData:dataVersion:timestamp:)();
    v21 = FeatureStoreBiomeEvent.__allocating_init(interactionId:featureData:dataVersion:timestamp:)(a2, a3, v16, v17, v19, v20);
    (*(void (**)(void))(*(_QWORD *)v18 + 104))();
    swift_release();

    outlined consume of Data?(v16, v17);
  }
  OUTLINED_FUNCTION_0();
}

uint64_t sub_212571874()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void partial apply for closure #1 in static FeatureStoreService.insertNSCoding<A>(interactionId:item:)()
{
  uint64_t *v0;

  closure #1 in static FeatureStoreService.insertNSCoding<A>(interactionId:item:)(v0[3], v0[4], v0[5]);
}

void static FeatureStoreService.retrieve<A>(interactionId:)(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  Swift::String v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t *v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_2_7();
  OUTLINED_FUNCTION_6_7();
  OUTLINED_FUNCTION_0_11(v3);
  OUTLINED_FUNCTION_0_11((uint64_t)v9);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<String>);
  v10 = OUTLINED_FUNCTION_9_8();
  *(_OWORD *)(v10 + 16) = xmmword_212575370;
  *(_QWORD *)(v10 + 32) = a1;
  *(_QWORD *)(v10 + 40) = a2;
  swift_bridgeObjectRetain();
  v11 = OUTLINED_FUNCTION_10_6(v3, (uint64_t)v9);
  static FeatureStoreService.retrieveNSCoding<A>(query:)();
  v13 = v12;

  if (!v2)
  {
    v22 = v13;
    v14 = type metadata accessor for Array();
    MEMORY[0x212BEEBCC](MEMORY[0x24BEE12E0], v14);
    Collection.first.getter();
    swift_bridgeObjectRelease();
    if (!v20)
    {
      v20 = 0;
      v21 = 0xE000000000000000;
      _StringGuts.grow(_:)(42);
      swift_bridgeObjectRelease();
      v20 = 0xD000000000000028;
      v21 = 0x80000002125777F0;
      v15._countAndFlagsBits = a1;
      v15._object = a2;
      String.append(_:)(v15);
      v16 = v20;
      v17 = v21;
      lazy protocol witness table accessor for type FeatureStoreError and conformance FeatureStoreError();
      v18 = OUTLINED_FUNCTION_2();
      *v19 = v16;
      v19[1] = v17;
      OUTLINED_FUNCTION_7_8(v18, (uint64_t)v19);
    }
  }
  OUTLINED_FUNCTION_1_2();
}

void static FeatureStoreService.retrieveNSCoding<A>(query:)()
{
  uint64_t v0;
  uint64_t v1;

  v0 = type metadata accessor for Array();
  OUTLINED_FUNCTION_4_6((void (*)(uint64_t))partial apply for closure #1 in static FeatureStoreService.retrieveNSCoding<A>(query:), v1, v0);
  OUTLINED_FUNCTION_5_12();
}

uint64_t closure #1 in static FeatureStoreService.retrieveNSCoding<A>(query:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;

  swift_getMetatypeMetadata();
  String.init<A>(describing:)();
  type metadata accessor for FeatureStoreStreamAccessor();
  v5 = FeatureStoreStreamAccessor.__allocating_init(identifier:)();
  v6 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v5 + 112))(a1);
  if (v2)
    return swift_release();
  MEMORY[0x24BDAC7A8](v6);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for [FeatureStoreBiomeEvent]);
  lazy protocol witness table accessor for type [FeatureStoreBiomeEvent] and conformance [A]();
  v8 = Sequence.compactMap<A>(_:)();
  swift_bridgeObjectRelease();
  result = swift_release();
  *a2 = v8;
  return result;
}

uint64_t partial apply for closure #1 in static FeatureStoreService.retrieveNSCoding<A>(query:)@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;

  return closure #1 in static FeatureStoreService.retrieveNSCoding<A>(query:)(*(_QWORD *)(v1 + 24), a1);
}

void static FeatureStoreService.retrieveNSCodingWithInteractionWrapper<A>(query:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;

  type metadata accessor for InteractionWrapper(255, a2, a3, a4);
  v4 = type metadata accessor for Array();
  OUTLINED_FUNCTION_4_6((void (*)(uint64_t))partial apply for closure #1 in static FeatureStoreService.retrieveNSCodingWithInteractionWrapper<A>(query:), v5, v4);
  OUTLINED_FUNCTION_5_12();
}

uint64_t partial apply for closure #1 in static FeatureStoreService.retrieveNSCodingWithInteractionWrapper<A>(query:)@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(void);
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;
  uint64_t v21;
  _QWORD *v22;

  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(_QWORD **)(v1 + 24);
  swift_getMetatypeMetadata();
  v6 = String.init<A>(describing:)();
  v8 = v7;
  type metadata accessor for FeatureStoreNSCodingAccessor(0, v4, v9, v10);
  FeatureStoreNSCodingAccessorWithType.__allocating_init(identifier:)(v6, v8);
  v12 = v11;
  v13 = *(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v5) + 0x98);
  v14 = *(_QWORD *)(v13() + 16);
  v15 = swift_bridgeObjectRelease();
  if (v14 != 1)
    goto LABEL_6;
  v16 = (_QWORD *)((uint64_t (*)(uint64_t))v13)(v15);
  if (!v16[2])
  {
    swift_bridgeObjectRelease();
LABEL_6:
    lazy protocol witness table accessor for type FeatureStoreError and conformance FeatureStoreError();
    v21 = OUTLINED_FUNCTION_2();
    *v22 = 0xD000000000000075;
    v22[1] = 0x8000000212577820;
    OUTLINED_FUNCTION_7_8(v21, (uint64_t)v22);
    return swift_release();
  }
  v17 = v16[4];
  v18 = v16[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v19 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)v12 + 136))(v17, v18);
  swift_bridgeObjectRelease();
  result = swift_release();
  if (!v2)
    *a1 = v19;
  return result;
}

uint64_t partial apply for closure #1 in closure #1 in static FeatureStoreService.retrieveNSCoding<A>(query:)@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = static NSCodingCoder.decode(data:)();
  *a1 = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_4_6(void (*a1)(uint64_t), uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return static FeatureStoreService.performRetrieve<A>(retrieveBlock:)(a1, a3, v3 - 8);
}

BOOL static FeatureStoreService.EventStreamState.== infix(_:_:)(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

void FeatureStoreService.EventStreamState.hash(into:)(uint64_t a1, char a2)
{
  Hasher._combine(_:)(a2 & 1);
}

void FeatureStoreService.EventStreamState.hashValue.getter(char a1)
{
  Hasher.init(_seed:)();
  Hasher._combine(_:)(a1 & 1);
  Hasher._finalize()();
  OUTLINED_FUNCTION_28_1();
}

BOOL protocol witness for static Equatable.== infix(_:_:) in conformance FeatureStoreService.EventStreamState(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return static FeatureStoreService.EventStreamState.== infix(_:_:)(*a1, *a2);
}

void protocol witness for Hashable.hashValue.getter in conformance FeatureStoreService.EventStreamState()
{
  char *v0;

  FeatureStoreService.EventStreamState.hashValue.getter(*v0);
}

void protocol witness for Hashable.hash(into:) in conformance FeatureStoreService.EventStreamState(uint64_t a1)
{
  char *v1;

  FeatureStoreService.EventStreamState.hash(into:)(a1, *v1);
}

void protocol witness for Hashable._rawHashValue(seed:) in conformance FeatureStoreService.EventStreamState()
{
  unsigned __int8 *v0;
  Swift::UInt v1;

  v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  Hasher._finalize()();
  OUTLINED_FUNCTION_28_1();
}

uint64_t one-time initialization function for timers()
{
  uint64_t result;

  if ((MEMORY[0x24BEE4AF8] & 0xC000000000000000) != 0 && _CocoaArrayWrapper.endIndex.getter())
    result = specialized Set.init(_nonEmptyArrayLiteral:)(MEMORY[0x24BEE4AF8]);
  else
    result = MEMORY[0x24BEE4B08];
  static FeatureStoreService.timers = result;
  return result;
}

uint64_t *FeatureStoreService.timers.unsafeMutableAddressor()
{
  if (one-time initialization token for timers != -1)
    swift_once();
  return &static FeatureStoreService.timers;
}

uint64_t static FeatureStoreService.timers.getter()
{
  if (one-time initialization token for timers != -1)
    swift_once();
  OUTLINED_FUNCTION_4_3();
  return swift_bridgeObjectRetain();
}

uint64_t static FeatureStoreService.timers.setter(uint64_t a1)
{
  if (one-time initialization token for timers != -1)
    swift_once();
  OUTLINED_FUNCTION_4_3();
  static FeatureStoreService.timers = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*static FeatureStoreService.timers.modify())()
{
  if (one-time initialization token for timers != -1)
    swift_once();
  OUTLINED_FUNCTION_4_3();
  return static FeatureStoreService.overrideLegalRestrictions.modify;
}

uint64_t static FeatureStoreService.streamEvents<A>()(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  _BYTE v10[16];
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v7 = type metadata accessor for AsyncStream.Continuation.BufferingPolicy();
  MEMORY[0x24BDAC7A8](v7);
  v11 = a1;
  v12 = a2;
  v13 = a3;
  v14 = v3;
  default argument 1 of AsyncStream.init(_:bufferingPolicy:_:)((uint64_t)&v10[-v8]);
  return AsyncStream.init(_:bufferingPolicy:_:)();
}

void closure #1 in static FeatureStoreService.streamEvents<A>()()
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
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;

  OUTLINED_FUNCTION_7();
  v41 = v1;
  v42 = v0;
  v43 = v2;
  v39 = v4;
  v40 = v3;
  v5 = type metadata accessor for AsyncStream.Continuation();
  v37 = *(_QWORD *)(v5 - 8);
  v38 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v36 = (uint64_t)&v33 - v6;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSRunLoop.SchedulerOptions?);
  OUTLINED_FUNCTION_8_6();
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = OUTLINED_FUNCTION_3_5();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(_QWORD *)(v11 + 64);
  v13 = MEMORY[0x24BDAC7A8](v10);
  v33 = (uint64_t)&v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v33 - v14;
  v34 = (char *)&v33 - v14;
  static Date.now.getter();
  v35 = swift_allocObject();
  *(_QWORD *)(v35 + 16) = 0;
  type metadata accessor for NSTimer();
  v16 = objc_msgSend((id)objc_opt_self(), sel_mainRunLoop);
  v17 = type metadata accessor for NSRunLoop.SchedulerOptions();
  __swift_storeEnumTagSinglePayload((uint64_t)v9, 1, 1, v17);
  v18 = static NSTimer.publish(every:tolerance:on:in:options:)();

  outlined destroy of NSRunLoop.SchedulerOptions?((uint64_t)v9);
  v44 = v18;
  type metadata accessor for NSTimer.TimerPublisher();
  lazy protocol witness table accessor for type NSTimer.TimerPublisher and conformance NSTimer.TimerPublisher(&lazy protocol witness table cache variable for type NSTimer.TimerPublisher and conformance NSTimer.TimerPublisher, (uint64_t (*)(uint64_t))MEMORY[0x24BDD01C8], MEMORY[0x24BDD01B0]);
  v19 = ConnectablePublisher.autoconnect()();
  swift_release();
  v44 = v19;
  OUTLINED_FUNCTION_12_7((uint64_t)&v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t)v15, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v11 + 16));
  v21 = v36;
  v20 = v37;
  OUTLINED_FUNCTION_7_11(v36, v40, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v37 + 16));
  v22 = (*(unsigned __int8 *)(v11 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  v23 = (v12 + v22 + 7) & 0xFFFFFFFFFFFFFFF8;
  v24 = (v23 + 15) & 0xFFFFFFFFFFFFFFF8;
  v25 = (*(unsigned __int8 *)(v20 + 80) + v24 + 8) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80);
  v26 = swift_allocObject();
  v27 = OUTLINED_FUNCTION_15_4(v26);
  *(_QWORD *)(v27 + 32) = v28;
  OUTLINED_FUNCTION_12_7(v27 + v22, v33, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v11 + 32));
  *(_QWORD *)(v26 + v23) = v39;
  *(_QWORD *)(v26 + v24) = v35;
  OUTLINED_FUNCTION_7_11(v26 + v25, v21, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v20 + 32));
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Publishers.Autoconnect<NSTimer.TimerPublisher>);
  lazy protocol witness table accessor for type Publishers.Autoconnect<NSTimer.TimerPublisher> and conformance Publishers.Autoconnect<A>();
  v29 = Publisher<>.sink(receiveValue:)();
  swift_release();
  swift_release();
  v30 = swift_allocObject();
  v31 = OUTLINED_FUNCTION_15_4(v30);
  *(_QWORD *)(v31 + 32) = v32;
  *(_QWORD *)(v31 + 40) = v29;
  AsyncStream.Continuation.onTermination.setter();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v34, v10);
  swift_release();
  OUTLINED_FUNCTION_0();
}

void partial apply for closure #1 in static FeatureStoreService.streamEvents<A>()()
{
  closure #1 in static FeatureStoreService.streamEvents<A>()();
}

void closure #1 in closure #1 in static FeatureStoreService.streamEvents<A>()()
{
  uint64_t v0;
  void (*v1)(_QWORD *, char *, uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(char *, char *, uint64_t);
  void *v8;
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
  char *v20;
  uint64_t TupleTypeMetadata2;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  int EnumTagSinglePayload;
  uint64_t v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  char *v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  id v61;
  _QWORD *v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void (*v67)(char *, char *, uint64_t);
  void (*v68)(_QWORD *, char *, uint64_t);
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;

  OUTLINED_FUNCTION_7();
  v68 = v1;
  v69 = v2;
  v4 = v3;
  v66 = v5;
  v55 = v6;
  v67 = v7;
  v61 = v8;
  v9 = type metadata accessor for Logger();
  v10 = *(_QWORD *)(v9 - 8);
  v59 = v9;
  v60 = v10;
  OUTLINED_FUNCTION_8_6();
  MEMORY[0x24BDAC7A8](v11);
  v58 = (char *)&v53 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for AsyncStream.Continuation.YieldResult();
  v64 = *(_QWORD *)(v13 - 8);
  v65 = v13;
  MEMORY[0x24BDAC7A8](v13);
  v63 = (char *)&v53 - v14;
  v57 = *(_QWORD *)(v4 - 8);
  OUTLINED_FUNCTION_8_6();
  v16 = MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v53 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v53 - v19;
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v56 = type metadata accessor for Optional();
  v53 = *(_QWORD *)(v56 - 8);
  OUTLINED_FUNCTION_8_6();
  v23 = MEMORY[0x24BDAC7A8](v22);
  v54 = (char *)&v53 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v23);
  v26 = (uint64_t *)((char *)&v53 - v25);
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  OUTLINED_FUNCTION_8_6();
  MEMORY[0x24BDAC7A8](v27);
  OUTLINED_FUNCTION_6_10();
  MEMORY[0x24BDAC7A8](v28);
  v30 = (char *)&v53 - v29;
  type metadata accessor for StreamQuery();
  v31 = OUTLINED_FUNCTION_3_5();
  OUTLINED_FUNCTION_23_0((uint64_t)v30, 1);
  OUTLINED_FUNCTION_23_0(v0, 1);
  v32 = variable initialization expression of StreamQuery.interactionIds();
  v33 = StreamQuery.__allocating_init(startDate:endDate:interactionIds:)((uint64_t)v30, v0, v32);
  OUTLINED_FUNCTION_12_7((uint64_t)v30, (uint64_t)v61, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v31 - 8) + 16));
  OUTLINED_FUNCTION_23_0((uint64_t)v30, 0);
  (*(void (**)(char *))((*MEMORY[0x24BEE4EA0] & *v33) + 0x70))(v30);
  v34 = static FeatureStoreService.retrieve<A>(query:)((uint64_t)v33, v4, (uint64_t)v68, v69);
  v61 = v33;
  v35 = (uint64_t *)(v55 + 16);
  v60 = v34;
  v72 = v34;
  v36 = type metadata accessor for Array();
  MEMORY[0x212BEEBCC](MEMORY[0x24BEE12C8], v36);
  Sequence.enumerated()();
  v71 = v70;
  type metadata accessor for EnumeratedSequence();
  EnumeratedSequence.makeIterator()();
  OUTLINED_FUNCTION_4_3();
  v37 = type metadata accessor for EnumeratedSequence.Iterator();
  v38 = v54;
  v69 = v37;
  EnumeratedSequence.Iterator.next()();
  v39 = v56;
  v68 = *(void (**)(_QWORD *, char *, uint64_t))(v53 + 32);
  v68(v26, v38, v56);
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload((uint64_t)v26, 1, TupleTypeMetadata2);
  v41 = v57;
  if (EnumTagSinglePayload != 1)
  {
    v67 = *(void (**)(char *, char *, uint64_t))(v57 + 32);
    v62 = v26;
    do
    {
      v42 = *v26;
      v67(v20, (char *)v26 + *(int *)(TupleTypeMetadata2 + 48), v4);
      if (v42 >= *v35)
      {
        (*(void (**)(char *, char *, uint64_t))(v41 + 16))(v18, v20, v4);
        OUTLINED_FUNCTION_8_7();
        v43 = v35;
        v44 = v4;
        v45 = v38;
        v46 = v20;
        v47 = v39;
        v48 = TupleTypeMetadata2;
        v49 = v41;
        v50 = v63;
        AsyncStream.Continuation.yield(_:)();
        v51 = v50;
        v41 = v49;
        TupleTypeMetadata2 = v48;
        v39 = v47;
        v20 = v46;
        v38 = v45;
        v4 = v44;
        v35 = v43;
        v26 = v62;
        (*(void (**)(char *, uint64_t))(v64 + 8))(v51, v65);
      }
      (*(void (**)(char *, uint64_t))(v41 + 8))(v20, v4);
      EnumeratedSequence.Iterator.next()();
      v68(v26, v38, v39);
    }
    while (__swift_getEnumTagSinglePayload((uint64_t)v26, 1, TupleTypeMetadata2) != 1);
  }
  swift_bridgeObjectRelease();
  v52 = MEMORY[0x212BEE11C](v60, v4);
  swift_bridgeObjectRelease();

  OUTLINED_FUNCTION_4_3();
  *v35 = v52;
  OUTLINED_FUNCTION_0();
}

void closure #2 in closure #1 in static FeatureStoreService.streamEvents<A>()(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
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
  char *v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  int v37;
  uint64_t v38;
  NSObject *v39;
  os_log_type_t v40;
  uint8_t *v41;
  void (*v42)(char *, uint64_t);
  char *v43;
  int v44;
  int v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t, uint64_t);
  NSObject *v48;
  os_log_type_t v49;
  uint8_t *v50;
  uint64_t v51;
  NSObject *v52;
  os_log_type_t v53;
  uint8_t *v54;

  OUTLINED_FUNCTION_7();
  a19 = v21;
  a20 = v22;
  v24 = v23;
  v25 = type metadata accessor for Logger();
  v26 = *(_QWORD *)(v25 - 8);
  MEMORY[0x24BDAC7A8](v25);
  OUTLINED_FUNCTION_6_10();
  v28 = MEMORY[0x24BDAC7A8](v27);
  v30 = (char *)&a9 - v29;
  MEMORY[0x24BDAC7A8](v28);
  v32 = (char *)&a9 - v31;
  v33 = type metadata accessor for AsyncStream.Continuation.Termination();
  v34 = *(_QWORD *)(v33 - 8);
  MEMORY[0x24BDAC7A8](v33);
  v36 = (char *)&a9 - v35;
  (*(void (**)(char *, uint64_t, uint64_t))(v34 + 16))((char *)&a9 - v35, v24, v33);
  v37 = (*(uint64_t (**)(char *, uint64_t))(v34 + 88))(v36, v33);
  if (v37 == *MEMORY[0x24BEE69B0])
  {
    v38 = Logger.service.unsafeMutableAddressor();
    OUTLINED_FUNCTION_7_11((uint64_t)v30, v38, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v26 + 16));
    v39 = Logger.logObject.getter();
    v40 = static os_log_type_t.info.getter();
    if (OUTLINED_FUNCTION_5_2(v40))
    {
      v41 = (uint8_t *)OUTLINED_FUNCTION_8_4();
      *(_WORD *)v41 = 0;
      OUTLINED_FUNCTION_14_3(&dword_212552000, v39, (os_log_type_t)v33, "Stream finished.", v41);
      OUTLINED_FUNCTION_1();
    }

    v42 = *(void (**)(char *, uint64_t))(v26 + 8);
    v43 = v30;
LABEL_9:
    v51 = v25;
    goto LABEL_13;
  }
  v44 = v37;
  v45 = *MEMORY[0x24BEE69B8];
  v46 = Logger.service.unsafeMutableAddressor();
  v47 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v26 + 16);
  if (v44 == v45)
  {
    OUTLINED_FUNCTION_7_11((uint64_t)v32, v46, v47);
    v48 = Logger.logObject.getter();
    v49 = static os_log_type_t.info.getter();
    if (OUTLINED_FUNCTION_5_2(v49))
    {
      v50 = (uint8_t *)OUTLINED_FUNCTION_8_4();
      *(_WORD *)v50 = 0;
      OUTLINED_FUNCTION_14_3(&dword_212552000, v48, (os_log_type_t)v33, "Stream cancelled.", v50);
      OUTLINED_FUNCTION_1();
    }

    v42 = *(void (**)(char *, uint64_t))(v26 + 8);
    v43 = v32;
    goto LABEL_9;
  }
  OUTLINED_FUNCTION_7_11(v20, v46, v47);
  v52 = Logger.logObject.getter();
  v53 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v52, v53))
  {
    v54 = (uint8_t *)OUTLINED_FUNCTION_8_4();
    *(_WORD *)v54 = 0;
    OUTLINED_FUNCTION_14_3(&dword_212552000, v52, v53, "Unknown termination condition!", v54);
    OUTLINED_FUNCTION_1();
  }

  (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v20, v25);
  v42 = *(void (**)(char *, uint64_t))(v34 + 8);
  v43 = v36;
  v51 = v33;
LABEL_13:
  v42(v43, v51);
  AnyCancellable.cancel()();
  OUTLINED_FUNCTION_0();
}

uint64_t default argument 1 of AsyncStream.init(_:bufferingPolicy:_:)@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *MEMORY[0x24BEE6A10];
  v3 = type metadata accessor for AsyncStream.Continuation.BufferingPolicy();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 104))(a1, v2, v3);
}

unint64_t lazy protocol witness table accessor for type FeatureStoreService.EventStreamState and conformance FeatureStoreService.EventStreamState()
{
  unint64_t result;

  result = lazy protocol witness table cache variable for type FeatureStoreService.EventStreamState and conformance FeatureStoreService.EventStreamState;
  if (!lazy protocol witness table cache variable for type FeatureStoreService.EventStreamState and conformance FeatureStoreService.EventStreamState)
  {
    result = MEMORY[0x212BEEBCC](&protocol conformance descriptor for FeatureStoreService.EventStreamState, &type metadata for FeatureStoreService.EventStreamState);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type FeatureStoreService.EventStreamState and conformance FeatureStoreService.EventStreamState);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for FeatureStoreService.EventStreamState(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  BOOL v7;

  if (!a2)
  {
    v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFF)
  {
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
      if (!v4)
        goto LABEL_17;
    }
    else if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
    }
    else
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
    }
    v5 = (*a1 | (v4 << 8)) - 2;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 2;
  v5 = v6 - 2;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for FeatureStoreService.EventStreamState(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_212572F5C + 4 * byte_212576505[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_212572F90 + 4 * byte_212576500[v4]))();
}

uint64_t sub_212572F90(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_212572F98(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x212572FA0);
  return result;
}

uint64_t sub_212572FAC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x212572FB4);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_212572FB8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_212572FC0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *destructiveInjectEnumTag for FeatureStoreService.EventStreamState(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for FeatureStoreService.EventStreamState()
{
  return &type metadata for FeatureStoreService.EventStreamState;
}

uint64_t sub_212572FE8()
{
  return swift_deallocObject();
}

unint64_t type metadata accessor for NSTimer()
{
  unint64_t result;

  result = lazy cache variable for type metadata for NSTimer;
  if (!lazy cache variable for type metadata for NSTimer)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&lazy cache variable for type metadata for NSTimer);
  }
  return result;
}

uint64_t outlined destroy of NSRunLoop.SchedulerOptions?(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for NSRunLoop.SchedulerOptions?);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_212573074()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  OUTLINED_FUNCTION_7();
  v1 = OUTLINED_FUNCTION_3_5();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (((*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8;
  v5 = OUTLINED_FUNCTION_8_7();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = (*(unsigned __int8 *)(v6 + 80) + v4 + 8) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v6 + 8))(v0 + v7, v5);
  return swift_deallocObject();
}

void partial apply for closure #1 in closure #1 in static FeatureStoreService.streamEvents<A>()()
{
  OUTLINED_FUNCTION_3_5();
  OUTLINED_FUNCTION_8_7();
  closure #1 in closure #1 in static FeatureStoreService.streamEvents<A>()();
}

unint64_t lazy protocol witness table accessor for type Publishers.Autoconnect<NSTimer.TimerPublisher> and conformance Publishers.Autoconnect<A>()
{
  unint64_t result;
  uint64_t v1;

  result = lazy protocol witness table cache variable for type Publishers.Autoconnect<NSTimer.TimerPublisher> and conformance Publishers.Autoconnect<A>;
  if (!lazy protocol witness table cache variable for type Publishers.Autoconnect<NSTimer.TimerPublisher> and conformance Publishers.Autoconnect<A>)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&demangling cache variable for type metadata for Publishers.Autoconnect<NSTimer.TimerPublisher>);
    result = MEMORY[0x212BEEBCC](MEMORY[0x24BDB9510], v1);
    atomic_store(result, (unint64_t *)&lazy protocol witness table cache variable for type Publishers.Autoconnect<NSTimer.TimerPublisher> and conformance Publishers.Autoconnect<A>);
  }
  return result;
}

uint64_t sub_212573214()
{
  swift_release();
  return swift_deallocObject();
}

void partial apply for closure #2 in closure #1 in static FeatureStoreService.streamEvents<A>()(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  uint64_t v20;

  closure #2 in closure #1 in static FeatureStoreService.streamEvents<A>()(a1, *(_QWORD *)(v20 + 40), *(_QWORD *)(v20 + 16), a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20);
}

uint64_t specialized Set.init(_nonEmptyArrayLiteral:)(unint64_t a1)
{
  unint64_t v1;
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t);
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;

  v1 = a1;
  v2 = a1 >> 62;
  if (a1 >> 62)
    goto LABEL_24;
  if (!*(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10))
    goto LABEL_25;
LABEL_3:
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _SetStorage<AnyCancellable>);
  v3 = static _SetStorage.allocate(capacity:)();
  if (v2)
  {
    while (1)
    {
      swift_bridgeObjectRetain();
      v2 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      if (!v2)
        break;
LABEL_5:
      v4 = 0;
      v5 = v3 + 56;
      v21 = v1;
      v22 = v1 & 0xC000000000000001;
      v19 = v1 & 0xFFFFFFFFFFFFFF8;
      v6 = (uint64_t (*)(uint64_t))MEMORY[0x24BDB9B60];
      v20 = v2;
      while (1)
      {
        if (v22)
        {
          v7 = MEMORY[0x212BEE3BC](v4, v21);
        }
        else
        {
          if (v4 >= *(_QWORD *)(v19 + 16))
            goto LABEL_23;
          v7 = swift_retain();
        }
        v8 = __OFADD__(v4++, 1);
        if (v8)
          break;
        v23 = v7;
        type metadata accessor for AnyCancellable();
        lazy protocol witness table accessor for type NSTimer.TimerPublisher and conformance NSTimer.TimerPublisher(&lazy protocol witness table cache variable for type AnyCancellable and conformance AnyCancellable, v6, MEMORY[0x24BDB9B70]);
        v9 = dispatch thunk of Hashable._rawHashValue(seed:)();
        v10 = -1 << *(_BYTE *)(v3 + 32);
        v1 = v9 & ~v10;
        v11 = v1 >> 6;
        v12 = *(_QWORD *)(v5 + 8 * (v1 >> 6));
        v13 = 1 << v1;
        if (((1 << v1) & v12) != 0)
        {
          v14 = ~v10;
          lazy protocol witness table accessor for type NSTimer.TimerPublisher and conformance NSTimer.TimerPublisher((unint64_t *)&lazy protocol witness table cache variable for type AnyCancellable and conformance AnyCancellable, v6, MEMORY[0x24BDB9B78]);
          while ((dispatch thunk of static Equatable.== infix(_:_:)() & 1) == 0)
          {
            v1 = (v1 + 1) & v14;
            v11 = v1 >> 6;
            v12 = *(_QWORD *)(v5 + 8 * (v1 >> 6));
            v13 = 1 << v1;
            if ((v12 & (1 << v1)) == 0)
            {
              v2 = v20;
              goto LABEL_16;
            }
          }
          swift_release();
          v2 = v20;
        }
        else
        {
LABEL_16:
          *(_QWORD *)(v5 + 8 * v11) = v13 | v12;
          *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v1) = v23;
          v15 = *(_QWORD *)(v3 + 16);
          v8 = __OFADD__(v15, 1);
          v16 = v15 + 1;
          if (v8)
            goto LABEL_22;
          *(_QWORD *)(v3 + 16) = v16;
        }
        v6 = (uint64_t (*)(uint64_t))MEMORY[0x24BDB9B60];
        if (v4 == v2)
          goto LABEL_27;
      }
      __break(1u);
LABEL_22:
      __break(1u);
LABEL_23:
      __break(1u);
LABEL_24:
      swift_bridgeObjectRetain();
      v17 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      if (v17)
        goto LABEL_3;
LABEL_25:
      v3 = MEMORY[0x24BEE4B08];
      if (!v2)
        goto LABEL_4;
    }
  }
  else
  {
LABEL_4:
    v2 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v2)
      goto LABEL_5;
  }
LABEL_27:
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t lazy protocol witness table accessor for type NSTimer.TimerPublisher and conformance NSTimer.TimerPublisher(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x212BEEBCC](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_7_11@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

uint64_t OUTLINED_FUNCTION_8_7()
{
  return type metadata accessor for AsyncStream.Continuation();
}

uint64_t OUTLINED_FUNCTION_12_7@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

void OUTLINED_FUNCTION_14_3(void *a1, NSObject *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
  _os_log_impl(a1, a2, a3, a4, a5, 2u);
}

uint64_t OUTLINED_FUNCTION_15_4(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 - 96);
  *(_QWORD *)(result + 16) = *(_QWORD *)(v1 - 104);
  *(_QWORD *)(result + 24) = v2;
  return result;
}

uint64_t dispatch thunk of JSONDecoder.decode<A>(_:from:)()
{
  return MEMORY[0x24BDCB220]();
}

uint64_t JSONDecoder.init()()
{
  return MEMORY[0x24BDCB260]();
}

uint64_t type metadata accessor for JSONDecoder()
{
  return MEMORY[0x24BDCB268]();
}

uint64_t static JSONEncoder.OutputFormatting.sortedKeys.getter()
{
  return MEMORY[0x24BDCB288]();
}

uint64_t type metadata accessor for JSONEncoder.OutputFormatting()
{
  return MEMORY[0x24BDCB2A8]();
}

uint64_t dispatch thunk of JSONEncoder.outputFormatting.setter()
{
  return MEMORY[0x24BDCB2E0]();
}

uint64_t dispatch thunk of JSONEncoder.encode<A>(_:)()
{
  return MEMORY[0x24BDCB3B8]();
}

uint64_t JSONEncoder.init()()
{
  return MEMORY[0x24BDCB400]();
}

uint64_t type metadata accessor for JSONEncoder()
{
  return MEMORY[0x24BDCB410]();
}

uint64_t _convertErrorToNSError(_:)()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t _convertNSErrorToError(_:)()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t type metadata accessor for URL()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t Data.description.getter()
{
  return MEMORY[0x24BDCDBE0]();
}

NSData __swiftcall Data._bridgeToObjectiveC()()
{
  return (NSData)MEMORY[0x24BDCDCA0]();
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t Data.count.getter()
{
  return MEMORY[0x24BDCDD10]();
}

uint64_t Date.timeIntervalSinceReferenceDate.getter()
{
  return MEMORY[0x24BDCDE90]();
}

NSDate __swiftcall Date._bridgeToObjectiveC()()
{
  return (NSDate)MEMORY[0x24BDCE5D8]();
}

uint64_t static Date._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCE878]();
}

uint64_t static Date.now.getter()
{
  return MEMORY[0x24BDCE880]();
}

uint64_t type metadata accessor for Date()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t UUID.uuidString.getter()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t type metadata accessor for UUID()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t PublisherProtocol.toSequence()()
{
  return MEMORY[0x24BDFCAA8]();
}

uint64_t PublisherProtocol.sink(completion:receiveInput:)()
{
  return MEMORY[0x24BE0C8F0]();
}

uint64_t PublisherProtocol.filter(isIncluded:)()
{
  return MEMORY[0x24BE0C900]();
}

uint64_t BookmarkablePublisher.init(_:)()
{
  return MEMORY[0x24BE0C928]();
}

uint64_t Streams.StoreStream.inner.getter()
{
  return MEMORY[0x24BE0C9E8]();
}

uint64_t type metadata accessor for Streams.StoreStream()
{
  return MEMORY[0x24BE0C9F0]();
}

uint64_t Streams.StoreStream.init(_:storeConfig:)()
{
  return MEMORY[0x24BE0CA00]();
}

uint64_t StoreStreamProtocol.source()()
{
  return MEMORY[0x24BE0CA48]();
}

uint64_t OrderedEvent.innerType.getter()
{
  return MEMORY[0x24BDFCAC8]();
}

uint64_t OrderedEvent.outerType.getter()
{
  return MEMORY[0x24BDFCAD0]();
}

uint64_t type metadata accessor for OrderedEvent()
{
  return MEMORY[0x24BE947E8]();
}

uint64_t ComponentIdentifier.componentName.getter()
{
  return MEMORY[0x24BE94840]();
}

uint64_t dispatch thunk of ComponentIdentifier.uuid.getter()
{
  return MEMORY[0x24BE94858]();
}

uint64_t type metadata accessor for ComponentIdentifier()
{
  return MEMORY[0x24BE94860]();
}

uint64_t dispatch thunk of InstrumentationStreamsProviderProtocol.filter.getter()
{
  return MEMORY[0x24BDFCAE8]();
}

uint64_t InstrumentationStreamsProviderProtocol.eventGraphs()()
{
  return MEMORY[0x24BDFCAF8]();
}

uint64_t static InstrumentationStreamsFactory.construct(filter:startTime:endTime:maxEvents:lastN:storageURL:)()
{
  return MEMORY[0x24BDFCB18]();
}

uint64_t type metadata accessor for InstrumentationStreamsFactory()
{
  return MEMORY[0x24BDFCB30]();
}

uint64_t dispatch thunk of EventGraph.componentIdentifiers.getter()
{
  return MEMORY[0x24BDFCB38]();
}

uint64_t dispatch thunk of EventGraph.events()()
{
  return MEMORY[0x24BDFCB60]();
}

uint64_t EventGraph.timestamp.getter()
{
  return MEMORY[0x24BDFCB68]();
}

uint64_t dispatch thunk of EventFilter.isAllowed(_:)()
{
  return MEMORY[0x24BDFCB98]();
}

uint64_t dispatch thunk of SiriTurn.turnId.getter()
{
  return MEMORY[0x24BDFCC08]();
}

uint64_t type metadata accessor for SiriTurn()
{
  return MEMORY[0x24BDFCC10]();
}

uint64_t OSSignpostID.init(log:)()
{
  return MEMORY[0x24BEE7718]();
}

uint64_t OSSignpostID.rawValue.getter()
{
  return MEMORY[0x24BEE7738]();
}

uint64_t type metadata accessor for OSSignpostID()
{
  return MEMORY[0x24BEE7758]();
}

uint64_t OSSignposter.init(logger:)()
{
  return MEMORY[0x24BEE7790]();
}

uint64_t OSSignposter.logHandle.getter()
{
  return MEMORY[0x24BEE77C0]();
}

uint64_t type metadata accessor for OSSignposter()
{
  return MEMORY[0x24BEE77F0]();
}

uint64_t type metadata accessor for OSSignpostError()
{
  return MEMORY[0x24BEE7818]();
}

uint64_t OSSignpostIntervalState.signpostID.getter()
{
  return MEMORY[0x24BEE7848]();
}

uint64_t OSSignpostIntervalState.init(id:isOpen:)()
{
  return MEMORY[0x24BEE7868]();
}

uint64_t type metadata accessor for OSSignpostIntervalState()
{
  return MEMORY[0x24BEE7870]();
}

uint64_t checkForErrorAndConsumeState(state:)()
{
  return MEMORY[0x24BEE78A0]();
}

uint64_t Logger.logObject.getter()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t Logger.init(subsystem:category:)()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t type metadata accessor for Logger()
{
  return MEMORY[0x24BEE78D8]();
}

Swift::Void __swiftcall AnyCancellable.cancel()()
{
  MEMORY[0x24BDB9B50]();
}

uint64_t type metadata accessor for AnyCancellable()
{
  return MEMORY[0x24BDB9B60]();
}

uint64_t ConnectablePublisher.autoconnect()()
{
  return MEMORY[0x24BDB9D18]();
}

uint64_t Publisher<>.sink(receiveValue:)()
{
  return MEMORY[0x24BDBA110]();
}

uint64_t type metadata accessor for DispatchWorkItemFlags()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t DispatchQoS.QoSClass.init(rawValue:)()
{
  return MEMORY[0x24BEE54A0]();
}

uint64_t type metadata accessor for DispatchQoS.QoSClass()
{
  return MEMORY[0x24BEE54B0]();
}

uint64_t static DispatchQoS.background.getter()
{
  return MEMORY[0x24BEE54C0]();
}

uint64_t static DispatchQoS.unspecified.getter()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t static DispatchQoS.userInitiated.getter()
{
  return MEMORY[0x24BEE54D0]();
}

uint64_t static DispatchQoS.userInteractive.getter()
{
  return MEMORY[0x24BEE54D8]();
}

uint64_t static DispatchQoS.utility.getter()
{
  return MEMORY[0x24BEE54E8]();
}

uint64_t type metadata accessor for DispatchQoS()
{
  return MEMORY[0x24BEE5500]();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)MEMORY[0x24BDCF808]();
}

uint64_t static Dictionary._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return MEMORY[0x24BDCF828]();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t Dictionary.description.getter()
{
  return MEMORY[0x24BEE0270]();
}

uint64_t Dictionary.init(dictionaryLiteral:)()
{
  return MEMORY[0x24BEE02B0]();
}

uint64_t dispatch thunk of Hashable._rawHashValue(seed:)()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return MEMORY[0x24BEE0980]();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)MEMORY[0x24BDCF9E0]();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t String.data(using:allowLossyConversion:)()
{
  return MEMORY[0x24BDCFA38]();
}

uint64_t String.init(data:encoding:)()
{
  return MEMORY[0x24BDCFA48]();
}

uint64_t static String.Encoding.utf8.getter()
{
  return MEMORY[0x24BDCFAC8]();
}

uint64_t type metadata accessor for String.Encoding()
{
  return MEMORY[0x24BDCFAF8]();
}

uint64_t String.init<A>(describing:)()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t String.hash(into:)()
{
  return MEMORY[0x24BEE0B20]();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
  MEMORY[0x24BEE0BC0](a1._countAndFlagsBits, a1._object);
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t Sequence.compactMap<A>(_:)()
{
  return MEMORY[0x24BEE0E40]();
}

uint64_t Sequence.enumerated()()
{
  return MEMORY[0x24BEE0E48]();
}

uint64_t specialized Array._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return MEMORY[0x24BEE1110]();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)MEMORY[0x24BDCFBA8]();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t Array.description.getter()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t specialized Array._endMutation()()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t static Array._allocateUninitialized(_:)()
{
  return MEMORY[0x24BEE1180]();
}

uint64_t specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t Array.count.getter()
{
  return MEMORY[0x24BEE11C8]();
}

uint64_t type metadata accessor for Array()
{
  return MEMORY[0x24BEE1250]();
}

uint64_t Array.subscript.getter()
{
  return MEMORY[0x24BEE1308]();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t CheckedContinuation.resume(returning:)()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t TaskPriority.rawValue.getter()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t type metadata accessor for TaskPriority()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t type metadata accessor for AsyncStream.Continuation.Termination()
{
  return MEMORY[0x24BEE69C0]();
}

uint64_t type metadata accessor for AsyncStream.Continuation.YieldResult()
{
  return MEMORY[0x24BEE69E8]();
}

uint64_t AsyncStream.Continuation.onTermination.setter()
{
  return MEMORY[0x24BEE69F8]();
}

uint64_t type metadata accessor for AsyncStream.Continuation.BufferingPolicy()
{
  return MEMORY[0x24BEE6A18]();
}

uint64_t AsyncStream.Continuation.yield(_:)()
{
  return MEMORY[0x24BEE6A30]();
}

uint64_t type metadata accessor for AsyncStream.Continuation()
{
  return MEMORY[0x24BEE6A40]();
}

uint64_t AsyncStream.init(_:bufferingPolicy:_:)()
{
  return MEMORY[0x24BEE6AA0]();
}

NSNumber __swiftcall Double._bridgeToObjectiveC()()
{
  return (NSNumber)MEMORY[0x24BDCFC58]();
}

NSSet __swiftcall Set._bridgeToObjectiveC()()
{
  return (NSSet)MEMORY[0x24BDCFCC0]();
}

uint64_t Set.init(minimumCapacity:)()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t Set.Iterator.init(_cocoa:)()
{
  return MEMORY[0x24BEE1678]();
}

uint64_t dispatch thunk of Collection.startIndex.getter()
{
  return MEMORY[0x24BEE18A0]();
}

uint64_t dispatch thunk of Collection.count.getter()
{
  return MEMORY[0x24BEE18D0]();
}

uint64_t dispatch thunk of Collection.formIndex(after:)()
{
  return MEMORY[0x24BEE1918]();
}

uint64_t Collection.first.getter()
{
  return MEMORY[0x24BEE1980]();
}

uint64_t Collection.isEmpty.getter()
{
  return MEMORY[0x24BEE19B8]();
}

uint64_t dispatch thunk of Collection.subscript.read()
{
  return MEMORY[0x24BEE1A28]();
}

uint64_t static os_log_type_t.info.getter()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t static os_log_type_t.debug.getter()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t static os_log_type_t.error.getter()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t static NSKeyedUnarchiver.unarchivedObject<A>(ofClass:from:)()
{
  return MEMORY[0x24BDCFFB0]();
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

uint64_t static os_signpost_type_t.end.getter()
{
  return MEMORY[0x24BEE7940]();
}

uint64_t static os_signpost_type_t.begin.getter()
{
  return MEMORY[0x24BEE7948]();
}

uint64_t SISchemaComponentName.description.getter()
{
  return MEMORY[0x24BE948F8]();
}

uint64_t type metadata accessor for NSTimer.TimerPublisher()
{
  return MEMORY[0x24BDD01C8]();
}

uint64_t static NSTimer.publish(every:tolerance:on:in:options:)()
{
  return MEMORY[0x24BDD01D8]();
}

uint64_t type metadata accessor for NSRunLoop.SchedulerOptions()
{
  return MEMORY[0x24BDD03C0]();
}

uint64_t OS_os_log.signpostsEnabled.getter()
{
  return MEMORY[0x24BEE7968]();
}

uint64_t type metadata accessor for Optional()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t _HashTable.occupiedBucket(after:)()
{
  return MEMORY[0x24BEE22D8]();
}

uint64_t __CocoaSet.makeIterator()()
{
  return MEMORY[0x24BEE2300]();
}

uint64_t __CocoaSet.Iterator.next()()
{
  return MEMORY[0x24BEE2358]();
}

uint64_t _expectEnd<A>(of:is:)()
{
  return MEMORY[0x24BEE2378]();
}

Swift::Int __swiftcall AnyHashable._rawHashValue(seed:)(Swift::Int seed)
{
  return MEMORY[0x24BEE23A0](seed);
}

uint64_t static AnyHashable.== infix(_:_:)()
{
  return MEMORY[0x24BEE23A8]();
}

uint64_t AnyHashable.init<A>(_:)()
{
  return MEMORY[0x24BEE23E8]();
}

uint64_t static _SetStorage.copy(original:)()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t static _SetStorage.resize(original:capacity:move:)()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t static _SetStorage.allocate(capacity:)()
{
  return MEMORY[0x24BEE24D0]();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
  MEMORY[0x24BEE2510](a1);
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t DecodingError.Context.init(codingPath:debugDescription:underlyingError:)()
{
  return MEMORY[0x24BEE26E8]();
}

uint64_t type metadata accessor for DecodingError()
{
  return MEMORY[0x24BEE2710]();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t specialized ContiguousArray._endMutation()()
{
  return MEMORY[0x24BEE2938]();
}

Swift::Void __swiftcall ContiguousArray.reserveCapacity(_:)(Swift::Int a1)
{
  MEMORY[0x24BEE2950](a1);
}

uint64_t specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t ContiguousArray.append(_:)()
{
  return MEMORY[0x24BEE29C0]();
}

uint64_t ContiguousArray.init()()
{
  return MEMORY[0x24BEE2A00]();
}

uint64_t type metadata accessor for ContiguousArray()
{
  return MEMORY[0x24BEE2A08]();
}

Swift::Bool __swiftcall _NativeDictionary.ensureUnique(isUnique:capacity:)(Swift::Bool isUnique, Swift::Int capacity)
{
  return MEMORY[0x24BEE2E58](isUnique, capacity);
}

uint64_t _NativeDictionary._delete(at:)()
{
  return MEMORY[0x24BEE2E70]();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t EnumeratedSequence.makeIterator()()
{
  return MEMORY[0x24BEE2F90]();
}

uint64_t EnumeratedSequence.Iterator.next()()
{
  return MEMORY[0x24BEE2F98]();
}

uint64_t type metadata accessor for EnumeratedSequence.Iterator()
{
  return MEMORY[0x24BEE2FA0]();
}

uint64_t type metadata accessor for EnumeratedSequence()
{
  return MEMORY[0x24BEE2FB0]();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t static _DictionaryStorage.resize(original:capacity:move:)()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return MEMORY[0x24BEE30B0]();
}

Swift::Int __swiftcall _findStringSwitchCase(cases:string:)(Swift::OpaquePointer cases, Swift::String string)
{
  return MEMORY[0x24BEE3290](cases._rawValue, string._countAndFlagsBits, string._object);
}

uint64_t KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)()
{
  return MEMORY[0x24BEE32B8]();
}

uint64_t KeyedDecodingContainer.codingPath.getter()
{
  return MEMORY[0x24BEE32C0]();
}

uint64_t KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)()
{
  return MEMORY[0x24BEE3308]();
}

uint64_t KeyedDecodingContainer.decodeIfPresent(_:forKey:)()
{
  return MEMORY[0x24BEE3340]();
}

uint64_t KeyedDecodingContainer.decode(_:forKey:)()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t KeyedDecodingContainer.decode<A>(_:forKey:)()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t KeyedDecodingContainer.allKeys.getter()
{
  return MEMORY[0x24BEE33C8]();
}

uint64_t KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)()
{
  return MEMORY[0x24BEE3408]();
}

uint64_t KeyedEncodingContainer.encode(_:forKey:)()
{
  return MEMORY[0x24BEE34A0]();
}

{
  return MEMORY[0x24BEE3508]();
}

uint64_t KeyedEncodingContainer.encode<A>(_:forKey:)()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t withCheckedContinuation<A>(isolation:function:_:)()
{
  return MEMORY[0x24BEE7040]();
}

uint64_t _bridgeAnythingToObjectiveC<A>(_:)()
{
  return MEMORY[0x24BEE3A20]();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t _bridgeAnythingNonVerbatimToObjectiveC<A>(_:)()
{
  return MEMORY[0x24BEE3DE0]();
}

uint64_t ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t Error._getEmbeddedNSError()()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t Error._code.getter()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t Error._domain.getter()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t Error._userInfo.getter()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t print(_:separator:terminator:)()
{
  return MEMORY[0x24BEE42C0]();
}

uint64_t Hasher.init(_seed:)()
{
  return MEMORY[0x24BEE42E0]();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
  MEMORY[0x24BEE42F8](a1);
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt32 a1)
{
  MEMORY[0x24BEE4310](*(_QWORD *)&a1);
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t dispatch thunk of Decoder.container<A>(keyedBy:)()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t dispatch thunk of Encoder.container<A>(keyedBy:)()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t CodingKey.description.getter()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t CodingKey.debugDescription.getter()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t _typeName(_:qualified:)()
{
  return MEMORY[0x24BEE4A98]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
}

uint64_t INIntentCreate()
{
  return MEMORY[0x24BDD9900]();
}

uint64_t INIntentResponseCreate()
{
  return MEMORY[0x24BDD9918]();
}

uint64_t INSJSONEncodedIntent()
{
  return MEMORY[0x24BE5B920]();
}

uint64_t INSJSONEncodedIntentResponse()
{
  return MEMORY[0x24BE5B928]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

NSString *NSHomeDirectory(void)
{
  return (NSString *)MEMORY[0x24BDD0DD8]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *NSUserName(void)
{
  return (NSString *)MEMORY[0x24BDD13F8]();
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

uint64_t __user_local_dirname()
{
  return MEMORY[0x24BDAC960]();
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
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

uid_t geteuid(void)
{
  return MEMORY[0x24BDAE5F8]();
}

passwd *__cdecl getpwnam(const char *a1)
{
  return (passwd *)MEMORY[0x24BDAE710](a1);
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

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
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

void objc_exception_throw(id exception)
{
  MEMORY[0x24BEDD078](exception);
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

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
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

uint64_t os_variant_allows_internal_security_policies()
{
  return MEMORY[0x24BDAF4B0]();
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x24BDAF4D0]();
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x24BDAFA10]();
}

int seteuid(uid_t a1)
{
  return MEMORY[0x24BDAFD18](*(_QWORD *)&a1);
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

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x24BEE4BE0]();
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

uint64_t swift_deletedMethodError()
{
  return MEMORY[0x24BEE4C28]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x24BEE4C40]();
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

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x24BEE4CD8]();
}

uint64_t swift_getDynamicType()
{
  return MEMORY[0x24BEE4D00]();
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

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x24BEE4D98]();
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

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
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

