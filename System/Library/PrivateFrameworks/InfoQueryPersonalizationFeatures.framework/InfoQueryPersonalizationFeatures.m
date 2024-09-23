BOOL isCalendarBasedPersonalizationResultType(uint64_t a1)
{
  return (unint64_t)(a1 - 2) < 8;
}

void sub_23F083834(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

id IQFLogCategoryDefault()
{
  if (IQFLogCategoryDefault_onceToken != -1)
    dispatch_once(&IQFLogCategoryDefault_onceToken, &__block_literal_global_0);
  return (id)IQFLogCategoryDefault_defaultLog;
}

void sub_23F0841B0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23F0842BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_2(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_7(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_23F0862C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void sub_23F08668C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_3_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

id PegasusRequestPersonalizationFeatures.mapsPersonalizationRanker.getter()
{
  uint64_t v0;

  return *(id *)(v0 + 16);
}

uint64_t PegasusRequestPersonalizationFeatures.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(id))(v0 + 88))(objc_msgSend(objc_allocWithZone((Class)IQFMapsPersonalizationRanker), sel_init));
}

uint64_t PegasusRequestPersonalizationFeatures.__allocating_init(mapsPersonalizationRanker:)(uint64_t a1)
{
  uint64_t result;

  result = swift_allocObject();
  *(_QWORD *)(result + 16) = a1;
  return result;
}

uint64_t PegasusRequestPersonalizationFeatures.init(mapsPersonalizationRanker:)(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return v1;
}

uint64_t PegasusRequestPersonalizationFeatures.augmentWithPersonalizationEntities(pegasusRequest:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;

  v4 = type metadata accessor for Apple_Parsec_Siri_V2alpha_SiriPegasusRequest();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
}

uint64_t PegasusRequestPersonalizationFeatures.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t PegasusRequestPersonalizationFeatures.__deallocating_deinit()
{
  uint64_t v0;

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for PegasusRequestPersonalizationFeatures()
{
  return objc_opt_self();
}

uint64_t method lookup function for PegasusRequestPersonalizationFeatures()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PegasusRequestPersonalizationFeatures.__allocating_init(mapsPersonalizationRanker:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of PegasusRequestPersonalizationFeatures.augmentWithPersonalizationEntities(pegasusRequest:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 96))();
}

ValueMetadata *type metadata accessor for ParsecAlias()
{
  return &type metadata for ParsecAlias;
}

id PegasusResponsePersonalizationFeatures.mapsPersonalizationRanker.getter()
{
  uint64_t v0;

  return *(id *)(v0 + 16);
}

uint64_t PegasusResponsePersonalizationFeatures.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(id))(v0 + 88))(objc_msgSend(objc_allocWithZone((Class)IQFMapsPersonalizationRanker), sel_init));
}

uint64_t PegasusResponsePersonalizationFeatures.__allocating_init(mapsPersonalizationRanker:)(uint64_t a1)
{
  uint64_t result;

  result = swift_allocObject();
  *(_QWORD *)(result + 16) = a1;
  return result;
}

uint64_t PegasusResponsePersonalizationFeatures.init(mapsPersonalizationRanker:)(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return v1;
}

uint64_t PegasusResponsePersonalizationFeatures.rankedMapsEventsForPegasusResponse(pegasusResponse:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
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
  BOOL v17;
  BOOL v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t result;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  void (*v32)(char *, char *, uint64_t);
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  void (*v39)(char *, unint64_t, uint64_t);
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  Class isa;
  id v52;
  uint64_t v53;
  uint64_t (**v54)(char *, void (*)(char *, unint64_t, uint64_t));
  uint64_t v55;
  void (*v56)(char *, unint64_t, uint64_t);
  char *v57;
  uint64_t v58;

  v55 = type metadata accessor for Apple_Parsec_Siri_Context_ResultEntity();
  v0 = *(_QWORD *)(v55 - 8);
  v1 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v3 = (char *)&v53 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = MEMORY[0x24BDAC7A8](v1);
  v57 = (char *)&v53 - v5;
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v53 - v6;
  v56 = (void (*)(char *, unint64_t, uint64_t))type metadata accessor for Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.SiriInstruction();
  v54 = (uint64_t (**)(char *, void (*)(char *, unint64_t, uint64_t)))*((_QWORD *)v56 - 1);
  MEMORY[0x24BDAC7A8](v56);
  v9 = (char *)&v53 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.ResponseMetadata();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v53 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.responseMetadata.getter();
  v14 = Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.ResponseMetadata.domainName.getter();
  v16 = v15;
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  v17 = v14 == 1936744813 && v16 == 0xE400000000000000;
  if (v17
    || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0
    || (v14 == 7300455 ? (v18 = v16 == 0xE300000000000000) : (v18 = 0), v18))
  {
    swift_bridgeObjectRelease();
    v20 = v55;
  }
  else
  {
    v19 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    v20 = v55;
    if ((v19 & 1) == 0)
      return MEMORY[0x24BEE4AF8];
  }
  Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.siriInstruction.getter();
  v22 = Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.SiriInstruction.resultEntities.getter();
  result = v54[1](v9, v56);
  v24 = MEMORY[0x24BEE4AF8];
  v58 = MEMORY[0x24BEE4AF8];
  v56 = *(void (**)(char *, unint64_t, uint64_t))(v22 + 16);
  if (!v56)
  {
LABEL_29:
    swift_bridgeObjectRelease();
    v37 = *(_QWORD *)(v24 + 16);
    if (v37)
    {
      v58 = MEMORY[0x24BEE4AF8];
      specialized ContiguousArray.reserveCapacity(_:)();
      v38 = v24 + ((*(unsigned __int8 *)(v0 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 80));
      v57 = *(char **)(v0 + 72);
      v39 = *(void (**)(char *, unint64_t, uint64_t))(v0 + 16);
      v55 = v24;
      v56 = v39;
      do
      {
        v56(v3, v38, v20);
        v40 = Apple_Parsec_Siri_Context_ResultEntity.mapsEncryptedMuid.getter();
        v42 = v41;
        v43 = Apple_Parsec_Siri_Context_ResultEntity.name.getter();
        v44 = v3;
        v46 = v45;
        v47 = objc_allocWithZone((Class)IQFMapsPersonalizationLocation);
        v48 = (void *)MEMORY[0x242663CA8](v40, v42);
        swift_bridgeObjectRelease();
        v49 = (void *)MEMORY[0x242663CA8](v43, v46);
        v3 = v44;
        swift_bridgeObjectRelease();
        objc_msgSend(v47, sel_initWithMUID_name_, v48, v49);

        (*(void (**)(char *, uint64_t))(v0 + 8))(v44, v20);
        specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
        specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
        specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
        specialized ContiguousArray._endMutation()();
        v38 += (unint64_t)v57;
        --v37;
      }
      while (v37);
    }
    swift_release();
    v50 = *(void **)(v53 + 16);
    type metadata accessor for IQFMapsPersonalizationLocation(0, &lazy cache variable for type metadata for IQFMapsPersonalizationLocation);
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    v52 = objc_msgSend(v50, sel_rankedEventsForLocations_, isa);

    type metadata accessor for IQFMapsPersonalizationLocation(0, &lazy cache variable for type metadata for IQFMapsPersonalizationResult);
    v21 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

    return v21;
  }
  v54 = (uint64_t (**)(char *, void (*)(char *, unint64_t, uint64_t)))v3;
  v25 = 0;
  while (v25 < *(_QWORD *)(v22 + 16))
  {
    v26 = (*(unsigned __int8 *)(v0 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 80);
    v27 = *(_QWORD *)(v0 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v0 + 16))(v7, v22 + v26 + v27 * v25, v20);
    v28 = Apple_Parsec_Siri_Context_ResultEntity.mapsEncryptedMuid.getter();
    v30 = v29;
    swift_bridgeObjectRelease();
    v31 = HIBYTE(v30) & 0xF;
    if ((v30 & 0x2000000000000000) == 0)
      v31 = v28 & 0xFFFFFFFFFFFFLL;
    if (v31)
    {
      v32 = *(void (**)(char *, char *, uint64_t))(v0 + 32);
      v32(v57, v7, v20);
      v33 = v58;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(v33 + 16) + 1, 1);
        v33 = v58;
      }
      v35 = *(_QWORD *)(v33 + 16);
      v34 = *(_QWORD *)(v33 + 24);
      if (v35 >= v34 >> 1)
      {
        specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v34 > 1, v35 + 1, 1);
        v33 = v58;
      }
      *(_QWORD *)(v33 + 16) = v35 + 1;
      v36 = v33 + v26 + v35 * v27;
      v20 = v55;
      result = ((uint64_t (*)(unint64_t, char *, uint64_t))v32)(v36, v57, v55);
      v58 = v33;
    }
    else
    {
      result = (*(uint64_t (**)(char *, uint64_t))(v0 + 8))(v7, v20);
    }
    if (v56 == (void (*)(char *, unint64_t, uint64_t))++v25)
    {
      v24 = v58;
      v3 = (char *)v54;
      goto LABEL_29;
    }
  }
  __break(1u);
  return result;
}

uint64_t PegasusResponsePersonalizationFeatures.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t PegasusResponsePersonalizationFeatures.__deallocating_deinit()
{
  uint64_t v0;

  return swift_deallocClassInstance();
}

size_t specialized ContiguousArray._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(size_t a1, int64_t a2, char a3)
{
  size_t *v3;
  size_t result;

  result = specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t type metadata accessor for IQFMapsPersonalizationLocation(uint64_t a1, unint64_t *a2)
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

uint64_t type metadata accessor for PegasusResponsePersonalizationFeatures()
{
  return objc_opt_self();
}

uint64_t method lookup function for PegasusResponsePersonalizationFeatures()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PegasusResponsePersonalizationFeatures.__allocating_init(mapsPersonalizationRanker:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of PegasusResponsePersonalizationFeatures.rankedMapsEventsForPegasusResponse(pegasusResponse:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 96))();
}

size_t specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(size_t result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  uint64_t v15;
  unint64_t v16;

  v5 = result;
  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_30:
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
  if (!v9)
  {
    v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for _ContiguousArrayStorage<Apple_Parsec_Siri_Context_ResultEntity>);
  v10 = *(_QWORD *)(type metadata accessor for Apple_Parsec_Siri_Context_ResultEntity() - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  result = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1)
    goto LABEL_29;
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  v15 = *(_QWORD *)(type metadata accessor for Apple_Parsec_Siri_Context_ResultEntity() - 8);
  if ((v5 & 1) != 0)
  {
    if (v13 < a4
      || (v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80),
          (char *)v13 + v16 >= (char *)a4 + v16 + *(_QWORD *)(v15 + 72) * v8))
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return (size_t)v13;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x242664104]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

void IQFMapsPersonalizationRanker.rankedEvents(for:completion:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  Class isa;
  uint64_t v7;
  void *v8;
  _QWORD v9[6];

  type metadata accessor for IQFMapsPersonalizationLocation(0, &lazy cache variable for type metadata for IQFMapsPersonalizationLocation);
  isa = Array._bridgeToObjectiveC()().super.isa;
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a2;
  *(_QWORD *)(v7 + 24) = a3;
  v9[4] = partial apply for closure #1 in IQFMapsPersonalizationRanker.rankedEvents(for:completion:);
  v9[5] = v7;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 1107296256;
  v9[2] = thunk for @escaping @callee_guaranteed (@guaranteed [IQFMapsPersonalizationResult], @guaranteed Error?) -> ();
  v9[3] = &block_descriptor;
  v8 = _Block_copy(v9);
  swift_retain();
  swift_release();
  objc_msgSend(v3, sel_rankedEventsForLocations_completionHandler_, isa, v8);
  _Block_release(v8);

}

void closure #1 in IQFMapsPersonalizationRanker.rankedEvents(for:completion:)(int a1, id a2, void (*a3)(void))
{
  id v5;

  if (a2)
  {
    v5 = a2;
    ((void (*)(id, uint64_t))a3)(a2, 1);

  }
  else
  {
    a3();
  }
}

uint64_t sub_23F087ABC()
{
  swift_release();
  return swift_deallocObject();
}

void partial apply for closure #1 in IQFMapsPersonalizationRanker.rankedEvents(for:completion:)(int a1, void *a2)
{
  uint64_t v2;

  closure #1 in IQFMapsPersonalizationRanker.rankedEvents(for:completion:)(a1, a2, *(void (**)(void))(v2 + 16));
}

void thunk for @escaping @callee_guaranteed (@guaranteed [IQFMapsPersonalizationResult], @guaranteed Error?) -> ()(uint64_t a1, uint64_t a2, void *a3)
{
  void (*v4)(uint64_t, void *);
  uint64_t v5;
  id v6;

  v4 = *(void (**)(uint64_t, void *))(a1 + 32);
  type metadata accessor for IQFMapsPersonalizationLocation(0, &lazy cache variable for type metadata for IQFMapsPersonalizationResult);
  v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  swift_retain();
  v6 = a3;
  v4(v5, a3);
  swift_release();
  swift_bridgeObjectRelease();

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

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_SiriPegasusRequest()
{
  return MEMORY[0x24BE6FBF0]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.SiriInstruction.resultEntities.getter()
{
  return MEMORY[0x24BE6FC00]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.SiriInstruction()
{
  return MEMORY[0x24BE6FC18]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.ResponseMetadata.domainName.getter()
{
  return MEMORY[0x24BE6FC20]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.ResponseMetadata()
{
  return MEMORY[0x24BE6FC38]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.siriInstruction.getter()
{
  return MEMORY[0x24BE6FC40]();
}

uint64_t Apple_Parsec_Siri_V2alpha_SiriPegasusResponse.responseMetadata.getter()
{
  return MEMORY[0x24BE6FC48]();
}

uint64_t Apple_Parsec_Siri_Context_ResultEntity.mapsEncryptedMuid.getter()
{
  return MEMORY[0x24BE70738]();
}

uint64_t Apple_Parsec_Siri_Context_ResultEntity.name.getter()
{
  return MEMORY[0x24BE70750]();
}

uint64_t type metadata accessor for Apple_Parsec_Siri_Context_ResultEntity()
{
  return MEMORY[0x24BE70758]();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)MEMORY[0x24BDCF9E0]();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)MEMORY[0x24BDCFBA8]();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t specialized ContiguousArray._endMutation()()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t specialized ContiguousArray.reserveCapacity(_:)()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x24BE1A1B0]();
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACC10](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
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

long double exp2(long double __x)
{
  long double result;

  MEMORY[0x24BDAE278](__x);
  return result;
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
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

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
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

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
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

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
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

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
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

